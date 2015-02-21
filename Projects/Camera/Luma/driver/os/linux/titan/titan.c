/*
 * titan.c  -- Matrix Vision Frame Grabber Driver for MVtitan.
 *
 *   Changes:
 *   Copyright (c) 2000 Matrix Vision GmbH (info@matrix-vision.de)
 *
 *   Some parts of this driver are based on:
 *    ** bttv - Bt848 frame grabber driver **
 *
 *   Copyright (C) 1996,97,98 Ralph  Metzler (rjkm@thp.uni-koeln.de)
 *                          & Marcus Metzler (mocm@thp.uni-koeln.de)
 *   (c) 1999,2000 Gerd Knorr <kraxel@goldbach.in-berlin.de>
 *
 $Id: titan.c,v 1.28 2002/11/25 10:13:50 hg Exp $
 *
 */
/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/

#include <linux/config.h>

// Use versioning if needed
#if defined(CONFIG_MODVERSIONS) && ! defined(MODVERSIONS)
#   define MODVERSIONS
#endif

#ifdef MODVERSIONS
#  include <linux/modversions.h>
#  include <allocator.ver>
#endif

#include <linux/module.h>
#include <linux/mm.h>
#include <linux/pci.h>
#include <asm/irq.h>
#include <asm/pgtable.h>
#include <asm/io.h>
#include <asm/mman.h>
#include <asm/semaphore.h>
#include <linux/time.h>
#if LINUX_VERSION_CODE >= KERNEL_VERSION (2,4,12)
#include <linux/slab.h>
#else
#include <linux/malloc.h>
#endif
#include <linux/wrapper.h>
#include <linux/kmod.h>
#include <linux/list.h>

#include "ioctl_titan.h"
#include "tmif.h"

#include <allocator.h>
#include <matrix_mem.h>
#include <matrix_tools.h>
#include <matrix_vga.h>

#include "kcompat.h"
#include "titan.h"

#define MODULE_NAME	"titan"

#if DEBUG
#define MSG_DBG_BIT         16
#define TM_DBG_BIT          17
#define SLOT_DBG_BIT        18
#define SEM_DBG_BIT         19

unsigned long debug = 0 ; // BASE_SYS_DEBUG | _flg(TM) | _flg(SLOT) | _flg(SEM) ;
#endif

#define DUP_SIGNAL_IS_ERROR	0

#define IRQ_TIMEOUT_MSEC	1000


static u_short		NumTitans = 0;
static struct titan *titans[MAXTITANS] = {NULL};
static u_short		IrqMap = 0;


// module parames

static unsigned long remapdram[MAXTITANS];    /* remap TM dram addresses */
static unsigned long remapmmio[MAXTITANS];    /* remap TM mmio addresses */

// used for dynamic allocation of major device
static int			 major_dev_num = TITAN_MAJOR;

#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,1,17)
MODULE_AUTHOR("MATRIX Vision GmbH <info@matrix-vision.de>");
MODULE_DESCRIPTION("MATRIX Vision Framegrabber");
#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,17)
MODULE_LICENSE("GPL");
#endif
MODULE_PARM(remapdram,"1-16l");
MODULE_PARM(remapmmio,"1-16l");
MODULE_PARM(major_dev_num,"i");
#if DEBUG
MODULE_PARM(debug,"l");
#endif
#endif



//=============== tools ===============================================================

//------------------------------------------------------------- inode_to_titan ------
static struct titan *inode_to_titan (struct inode *ip)
{
    int minor = MINOR (ip->i_rdev);
    return minor < NumTitans ? titans[minor] : NULL;
}


//------------------------------------------------------------- file_to_titan ------
static struct titan *file_to_titan (struct file *file)
{
	int minor = MINOR(file->f_dentry->d_inode->i_rdev) ;
	return minor < NumTitans ? titans[minor] : NULL;
}


//-------------------------------------------------------------- pci_set_latency ------
static int pci_set_latency (struct titan *ttn, int newlatency)
{
	u_short bus = ttn->bus, devfun = ttn->devfun;
	u_char oldlatency, chklatency;

	if (newlatency >= 0 && newlatency <= 255)
	{
		pcibios_read_config_byte (bus, devfun, PCI_LATENCY_TIMER, &oldlatency);
		pcibios_write_config_byte (bus, devfun, PCI_LATENCY_TIMER, (u_char) newlatency);
#if DEBUG
		if ( _flgset(PCI) )
		{
			pcibios_read_config_byte (bus, devfun, PCI_LATENCY_TIMER, &chklatency);
			printk(PKTD "PCI latency old=%d new=%d chk=%d\n", ttn->number,
							 oldlatency, newlatency, chklatency);
		}
#endif
		return 0;
	}
	else
		return -EINVAL;
}

#if 0 // ???
//------------------------------------------------------------- check_pci_status ------
static void check_pci_status (struct titan *ttn)
{
	u_short status;
	register u_short bus = ttn->bus, devfun = ttn->devfun;

	pcibios_read_config_word (bus, devfun, PCI_STATUS, &status);
	pcibios_write_config_word (bus, devfun, PCI_STATUS, status);	/* Clear errors */
	if (status & PCI_STATUS_REC_TARGET_ABORT)
		printk (PKTD "pci target abort\n", ttn->number);
	if (status & PCI_STATUS_REC_MASTER_ABORT)
		printk (PKTD "pci master abort\n", ttn->number);
	if (status & PCI_STATUS_DETECTED_PARITY)
		printk(PKTD "pci parity error\n", ttn->number);
}
#endif

//=========== memory spaces ===========================================================


//------------------------------------------------------------- space_alloc_page ------
static int space_alloc_page (TSpace * space/*, int size */ )
{
	if ( ( space->kptr = (void *) get_free_page (GFP_KERNEL) ) != NULL ) // kmalloc(size,GFP_KERNEL) ;
	{
		if ( ( space->addr = virt_to_phys (space->kptr) ) != 0)
		{
			space->size = PAGE_SIZE;
			PRINTKM(MEM,(PKTB "alloc page to space[%s], kv=%p p=0x%08lx..+0x%08x\n",
					 space->name, space->kptr, space->addr, space->size));
			return 0;
		}
		else
		{
			printk(PKTB "alloc page to space[%s] * virt_to_phys(%p) failed\n",
								 space->name, space->kptr );
			free_page ((int) space->kptr);
			space->kptr = NULL ;
			return -ENOMEM;
		}
	}
	else
	{
		printk (PKTB "alloc page to space[%s] * get_free_page failed\n", space->name );
		return -ENOMEM;
	}
}

//-------------------------------------------------------------- space_free_page ------
static int space_free_page (TSpace * space)
{
	if (space->kptr != NULL)
	{
		free_page ((int) space->kptr);
		space_init (space, NULL);
		return 0;
	}
	else
		return -1;
}

//------------------------------------------------------------------ space_remap ------
static void *space_remap (TSpace * space)
{
	u_long base_page   = space->addr & PAGE_MASK;
	u_long base_offset = space->addr & ~PAGE_MASK;

	space->kptr = (void *) (base_offset | (u_long) ioremap ((u_long) base_page, space->size));
	PRINTKM(MEM,(PKTB "remap space[%s] 0x%08lx -> $%p\n", space->name, space->addr, space->kptr));
	return space->kptr;
}

//------------------------------------------------------------------ space_unmap ------
static void space_unmap (TSpace * space)
{
	if (space->kptr != NULL)
	{
		PRINTKM(MEM,(PKTB "unmap space[%s]\n", space->name));
		iounmap ((void *) space->kptr);
		space->kptr = NULL;
	}
}

//----------------------------------------------------------- space_get_from_pci ------
static void space_get_from_pci (u_char bus, u_char devfun, int index, TSpace * space, char *name)
{
	unsigned int addrmask;
	unsigned long flags;

	space->name = name;
	pcibios_read_config_dword (bus, devfun, index, (unsigned int *)&space->addr);

	save_flags (flags);
	cli ();
	pcibios_write_config_dword (bus, devfun, index, ~0UL);
	pcibios_read_config_dword (bus, devfun, index, &addrmask);
	pcibios_write_config_dword (bus, devfun, index, space->addr);
	restore_flags (flags);

    space->addr &= ~15UL ;
	space->size = ((~addrmask) + 1) & ~7;

	PRINTKM(MEM,(PKTB "get space[%s] ix=%d, 0x%08lx..+0x%08x\n",
					 name, index, space->addr, space->size));
}


//========== virtual buffer interface functions ===============================

//--------------------------------------------------------------- set_space_type -------
static int set_space_type (struct titan *ttn, TUserVirtualAddress usrspacetypepar, int parsize)
{
//	TSpaceType usrspacetype;
	int usrspacetype;
	int result;

	if (parsize == sizeof (int /*TSpaceType??*/))
	{
		if ((result = read_user (usrspacetypepar, &usrspacetype, sizeof (int /*TSpaceType??*/))) == 0)
		{
			PRINTKM(MEM,(PKTD "set_space_type: new space type = %d\n", ttn->number, usrspacetype));
			ttn->space_type = usrspacetype;
		}
	}
	else
		result = -EINVAL ;

	return result;
}



//========= space get/set =====================================================

//------------------------------------------------------------- dram_get ------
static unsigned int dram_get (struct titan *ttn, int ofs)
{
	unsigned int *p = (unsigned int *) DRAM (ttn, ofs);
	unsigned int val = *p;

	PRINTKM(IO,(PKTD "get DRAM[%d] : *%p = 0x%08x\n", ttn->number, ofs, p, val));
	return val;
}

//-------------------------------------------------------------- dram_set -----
static void dram_set (struct titan *ttn, int ofs, unsigned int val)
{
	unsigned int *p = (unsigned int *) DRAM (ttn, ofs);
	PRINTKM(IO,(PKTD "set DRAM[%d] : *%p = 0x%08x\n", ttn->number, ofs, p, val));
	*p = val;
}

//------------------------------------------------------------------- mmio_get ------
static unsigned int mmio_get (struct titan *ttn, char *name, int ofs)
{
	unsigned int *p = (unsigned int *) MMIO (ttn, ofs);
	unsigned int val = *p;

	PRINTKM(IO,(PKTD "get %-12s : *%p = 0x%08x\n", ttn->number, name, p, val));
	return val;
}

//------------------------------------------------------------------- mmio_set -------------
static void mmio_set (struct titan *ttn, char *name, int ofs, unsigned int val)
{
	unsigned int *p = (unsigned int *) MMIO (ttn, ofs);
	PRINTKM(IO,(PKTD "set %-12s : *%p = 0x%08x\n", ttn->number, name, p, val));
	*p = val;
}


//-----------------------------------------------------------------------------
static int titan_get_version (struct titan *ttn, TUserVirtualAddress usrversionpar, int parsize)
{
	unsigned long titan_version = TITAN_NUM_VERSION;
	int result;

	if ( parsize == sizeof (unsigned long) )
	{
		result = write_user_value ( titan_version, usrversionpar, sizeof (unsigned long) );
		PRINTKM (IOCTL, (PKT " get info = %ld\n", titan_version));
	}
	else
		result = -EINVAL ;

	return result;
}

//------- TM clock calculation ------------------------------------------------

static unsigned OscFrqTab[4] = { 50000000, 66666700, 47660000, 0 } ;

								//	0	1	2	3	4	5	6	7
static unsigned ClkMulTab[8] = {	1,	2,	3,	4,	5,	0,	0,	0 } ;
static unsigned ClkDivTab[8] = {	1,	1,	2,	3,	4,	1,	1,	1 } ;

//-----------------------------------------------------------------------------
int titan_get_clocks ( struct titan *ttn, TTitanInfoStruct *info )
{
	unsigned		pll_ratios, memtoosc, ratiobits, oscbits ;
	unsigned short	subid ;

	pcibios_read_config_word ( ttn->bus, ttn->devfun, PCI_SUBSYSTEM_ID, &subid );
	oscbits   = ( subid & 0x0030 ) >> 4 ;

    pll_ratios = *MMIO( ttn, PLL_RATIOS ) ;
	ratiobits  = pll_ratios & 0x07;
	memtoosc   = ( pll_ratios & 0x08 ) >> 3 ;

	info->oscclock = OscFrqTab[oscbits] ;
	info->memclock = info->oscclock * ( memtoosc + 2 ) ;
	info->tmclock  = info->memclock * ClkMulTab[ratiobits] / ClkDivTab[ratiobits] ;

	PRINTKM (IO, (PKT " subid = $%04x  pll_ratio = $%04x\n", subid, pll_ratios ));
	PRINTKM (IO, (PKT " clocks : osc = %d  mem = %u  tm = %u\n",
                 info->oscclock, info->memclock, info->tmclock ));

	return info->oscclock > 0 && info->tmclock > 0
                ? 0
                : -EINVAL ;
}


//-----------------------------------------------------------------------------
static int titan_get_hwinfo ( struct titan *ttn, TUserVirtualAddress usrinfo, int parsize )
{
	int result;
    TTitanInfoStruct info ;

	if ( parsize == sizeof (TTitanInfoStruct) )
	{
        memset ( &info, 0, sizeof(TTitanInfoStruct) ) ;
		if ( ( result = titan_get_clocks ( ttn, &info ) ) >= 0 )
            result = write_user_buffer (&info, usrinfo, sizeof(TTitanInfoStruct));
	}
	else
		result = -EINVAL ;

	return result;
}

#define _offset(t,f)	((long)&(((t *)0)->f))
#define _pciofs(f)		_offset(PCI_COMMON_CONFIG,f)

//-----------------------------------------------------------------------------
int pcibios_read_config ( unsigned char bus, unsigned char dev_fn,
                          unsigned char where, unsigned size, void *val)
{
	switch ( size )
	{
	case sizeof ( unsigned char ) :
		return pcibios_read_config_byte  ( bus, dev_fn, where, (unsigned char *)val); 		
	case sizeof ( unsigned short ):
		return pcibios_read_config_word  ( bus, dev_fn, where, (unsigned short *)val); 		
	case sizeof ( unsigned int )  :
		return pcibios_read_config_dword ( bus, dev_fn, where, (unsigned int *)val); 		
	default : return -1 ;
	}
}

#define _pciConfig				usrpciconf.pci_config
#define _nbus         			usrpciconf.bus
#define _dev_fn      			usrpciconf.dev_fn

#define _getpcifield(f)			pcibios_read_config ( _nbus, _dev_fn, _pciofs(f),	\
											  sizeof(_pciConfig.f), &(_pciConfig.f) )
#define _getpcifield_type0(f)	pcibios_read_config ( _nbus, _dev_fn, _pciofs(u.type0.f),	\
											  sizeof(_pciConfig.u.type0.f),	\
											  &(_pciConfig.u.type0.f) )

//-----------------------------------------------------------------------------
static int pci_read_config (struct titan *ttn, TUserVirtualAddress usrpciconfpar, int parsize)
{
	int result;
    TPCIFindConfigStruct usrpciconf;                                                                                     
	if (parsize == sizeof (TPCIFindConfigStruct))
	{	// par size ok, read bus
        if ((result = read_user (usrpciconfpar, &usrpciconf, sizeof (TPCIFindConfigStruct))) == 0)
        {
            if ( _nbus == 0xff || _dev_fn == 0xff )
            {
                _nbus    = ttn->bus ;
                _dev_fn = ttn->devfun ;
            }                                                                                 
			_getpcifield ( VendorID 	/*, PCI_VENDOR_ID */ ) ;
			_getpcifield ( DeviceID 	/*, PCI_DEVICE_ID */ ) ;
			_getpcifield ( Command 		/*, PCI_COMMAND */ ) ;
			_getpcifield ( Status 		/*, PCI_STATUS */ ) ;
			_getpcifield ( RevisionID 	/*, PCI_REVISION_ID */ ) ;
			_getpcifield ( ProgIf 		/*, PCI_CLASS_PROG */ ) ;
			_getpcifield ( SubClass 	/*, PCI_CLASS_DEVICE */  ) ;
			_getpcifield ( BaseClass 	/*, PCI_CLASS_DEVICE+1 */ ) ;
			_getpcifield ( CacheLineSize/*, PCI_CACHE_LINE_SIZE */ ) ;
			_getpcifield ( LatencyTimer /*, PCI_LATENCY_TIMER */ ) ;
			_getpcifield ( HeaderType 	/*, PCI_HEADER_TYPE */ ) ;
			_getpcifield ( BIST 		/*, PCI_BIST */ ) ;

			_getpcifield_type0 ( BaseAddresses[0] /*, PCI_BASE_ADDRESS_0 */ ) ;
			_getpcifield_type0 ( BaseAddresses[1] /*, PCI_BASE_ADDRESS_1 */ ) ;
			_getpcifield_type0 ( BaseAddresses[2] /*, PCI_BASE_ADDRESS_2 */ ) ;
			_getpcifield_type0 ( BaseAddresses[3] /*, PCI_BASE_ADDRESS_3 */ ) ;
			_getpcifield_type0 ( BaseAddresses[4] /*, PCI_BASE_ADDRESS_4 */ ) ;
			_getpcifield_type0 ( BaseAddresses[5] /*, PCI_BASE_ADDRESS_5 */ ) ;
			_getpcifield_type0 ( SubVendorID	  /*, PCI_SUBSYSTEM_VENDOR_ID */ ) ;
			_getpcifield_type0 ( SubDeviceID	  /*, PCI_SUBSYSTEM_ID */ ) ;
			_getpcifield_type0 ( ROMBaseAddress	  /*, PCI_ROM_ADDRESS */ ) ;
			_getpcifield_type0 ( InterruptLine 	  /*, PCI_INTERRUPT_LINE */ ) ;
			_getpcifield_type0 ( InterruptPin 	  /*, PCI_INTERRUPT_PIN */ ) ;
			_getpcifield_type0 ( MinimumGrant 	  /*, PCI_MIN_GNT */ ) ;
			_getpcifield_type0 ( MaximumLatency   /*, PCI_MAX_LAT  */ ) ;

			PRINTKM(PCI,(PKTD "pci_read_config  bus=$%02x dfn=$%02x ven/dev=%04x/%04x\n",
						 ttn->number, _nbus, _dev_fn, _pciConfig.VendorID, _pciConfig.DeviceID ));
                // give back pci config infos in user buffer
			result = write_user_buffer ( &usrpciconf, usrpciconfpar, sizeof (TPCIFindConfigStruct) );
		}
	}
	else
		result = -EINVAL ;

	return result;
}
#undef _pciConfig
#undef _nbus
#undef _dev_fn

//-------------------------------------------------------------- space_to_user ---------------
static int space_to_user (struct titan *ttn, TUserVirtualAddress uva, int size)
{
	TSpace userspace, *space;
	int result;

	if (size == sizeof (TSpace))
	{
		if ((result = read_user(uva, &userspace, size) ) == 0)
		{
			int spaceid = (unsigned)userspace.name ;
			switch ( spaceid )
			{
			case DRAM_SPACE :
				space =  &ttn->space[DRAM_IX] ;
				break ;
			case MMIO_SPACE :
				space =  &ttn->space[MMIO_IX] ;
				break ;
			case VGA_SPACE :
				space =  &VGASpace ;
				break ;
			default :
				return -EINVAL;
			}
			result = write_user_buffer ( space, uva, size);
		}
		return result;
	}
	else
		return -EINVAL;
}


//-------------------------------------------------------------- wrrd_register ---------------
static int wrrd_register (struct titan *ttn, TUserVirtualAddress regdef, int size)
{
	TRegStruct regs;
	int result;

	if (size == sizeof (TRegStruct))
	{
		if ((result = read_user (regdef, (void *) &regs, size)) == 0)
		{
			int wr = _modeis (regs.reg, WRITE);
			int rd = _modeis (regs.reg, READ);
			int space = _getspace (regs.reg);
			int spec = _getspec (regs.reg);
			TUserVirtualAddress uva ;

			uva.uptr = regdef.uptr + sizeof (long) ;

			PRINTKM(IO,(PKTD "regacc  rd=%d wr=%d space=%d spec=0x%08x\n", ttn->number,
					 rd, wr, space, spec));
			switch (space)
			{
			case spaceMMIO:
				PRINTKM(IO,(PKTD "regacc mmio r=0x%08lx v=0x%08lx\n", ttn->number, regs.reg, regs.val));
				if (wr)
					mmio_set (ttn, "(ioctl)", spec, regs.val);
				if (rd)
					regs.val = mmio_get (ttn, "(ioctl)", spec);
				break;
			case spacePCI:
				{
					u_char size = _size (spec);
					u_char bus = _bus (spec);
					u_char devfun = _devfun (spec);
					u_char index = _index (spec);
					unsigned char val1;
					unsigned short val2;
					unsigned int val4;

					if (bus == _busMAX)
						bus = ttn->bus;
					if (devfun == _devfunMAX)
						devfun = ttn->devfun;

					PRINTKM(IO,(PKTD "regacc pci s=%d b=%d d=%d i=%d, v=$%08lx\n", ttn->number,
							 size, bus, devfun, index, regs.val));
					switch (size)
					{
					case 1:
						if (wr)
							pcibios_write_config_byte (bus, devfun, index, regs.val);
						if (rd)
						{
							pcibios_read_config_byte (bus, devfun, index, &val1);
							regs.val = val1;
						}
						break;
					case 2:
						if (wr)
							pcibios_write_config_word (bus, devfun, index, regs.val);
						if (rd)
						{
							pcibios_read_config_word (bus, devfun, index, &val2);
							regs.val = val2;
						}
						break;
					case 4:
						if (wr)
							pcibios_write_config_dword (bus, devfun, index, regs.val);
						if (rd)
						{
							pcibios_read_config_dword (bus, devfun, index, &val4);
							regs.val = val4;
						}
						break;
					}
				}
				break;
			case spaceDRAM:
				PRINTKM(IO,(PKTD "regacc dram r=0x%08lx v=0x%08lx\n", ttn->number, regs.reg, regs.val));
				if (wr)
					dram_set (ttn, spec, regs.val);
				if (rd)
					regs.val = dram_get (ttn, spec);
				break;
			case spaceIO:
				{
					u_char size = _size (spec);
					unsigned short port = spec & 0xffff;

					PRINTKM(IO,(PKTD "regacc io s=%d port=%d, v=$%08lx\n", ttn->number,
							 size, spec, regs.val));
					switch (size)
					{
					case 1:
						if (wr)
							outb (regs.val, port);
						if (rd)
							regs.val = inb (port);
						break;
					case 2:
						if (wr)
							outw (regs.val, port);
						if (rd)
							regs.val = inw (port);
						break;
					case 4:
						if (wr)
							outl (regs.val, port);
						if (rd)
							regs.val = inl (port);
						break;
					}
				}
				break;
			default:
				printk(PKTD "regacc * illegal space : %d\n", ttn->number, space);
				return -EINVAL;
			}
			if (rd)
				write_user_value (regs.val, uva, sizeof (unsigned long));
		}
		return result;
	}
	else
		return -EINVAL;
}

//------------------------------------------------------------ trimedia_register_init ------
static void trimedia_register_init (struct titan *ttn)
{
	int FirstTimeReset;
	FirstTimeReset = !(*MMIO (ttn, BIU_CTL) & (BIU_SE | BIU_HE));
	PRINTKM(TM,(PKTD "first time reset = %d\n", ttn->number, FirstTimeReset));

	if (FirstTimeReset)
		*MMIO (ttn, BIU_CTL) = BIU_SE << 24;	// default big endian -> little endian

	*MMIO (ttn, BIU_CTL) = BIU_SE | BIU_HE | BIU_SR;
	*MMIO (ttn, DRAM_CACHEABLE_LIMIT) = ttn->space[DRAM_IX].addr + ttn->space[DRAM_IX].size;
	*MMIO (ttn, DRAM_LIMIT) = ttn->space[DRAM_IX].addr + ttn->space[DRAM_IX].size;
	*MMIO (ttn, IMASK) = 0;
	*MMIO (ttn, ICLEAR) = 0xFFFFFFFF;

	PRINTKM(TM,(PKTD "BIU_CTL = 0x%08x\n", ttn->number, *MMIO (ttn, BIU_CTL)));
}

//------------------------------------------------------------------- dsp_stop ------
static int dsp_stop (struct titan *ttn)
{
	int i;

	PRINTKM(TM,(PKTD "dsp stop\n", ttn->number));
	if (ttn->space[MMIO_IX].kptr != NULL)
	{
		*MMIO (ttn, IMASK) = 0;
		*MMIO (ttn, ICLEAR) = 0xFFFFFFFF;

		*MMIO (ttn, BIU_CTL) &= (~BIU_CR);
		*MMIO (ttn, BIU_CTL) |= BIU_SR;

		*MMIO (ttn, AO_CTL) = 0x80000000;
		*MMIO (ttn, AO_FREQ) = 0;

		*MMIO (ttn, AI_CTL) = 0x80000000;
		*MMIO (ttn, AI_FREQ) = 0;

		*MMIO (ttn, VI_CTL) = 0x00080000;
		*MMIO (ttn, VI_CLOCK) = 0;

		*MMIO (ttn, VO_CTL) = 0x80000000;
		*MMIO (ttn, VO_CLOCK) = 0;

		*MMIO (ttn, SSI_CTL) = 0xc0000000;
		*MMIO (ttn, SSI_CTL) = (1 << 18);

		for (i = 0; (*MMIO (ttn, ICP_SR) & 0x01) && i < 10; i++)
			*MMIO (ttn, ICP_SR) = 0x80;

		*MMIO (ttn, IIC_CTL) = 0;

		*MMIO (ttn, VLD_COMMAND) = 0x00000401;

		*MMIO (ttn, TIMER1_TCTL) &= ~0x1;
		*MMIO (ttn, TIMER2_TCTL) &= ~0x1;
		*MMIO (ttn, TIMER3_TCTL) &= ~0x1;
		*MMIO (ttn, SYSTIMER_TCTL) &= ~0x1;

		*MMIO (ttn, BICTL) = 0;
		*MMIO (ttn, BDCTL) = 0;

		*MMIO (ttn, JTAG_DATA_IN) = 0x0;
		*MMIO (ttn, JTAG_DATA_OUT) = 0x0;
		*MMIO (ttn, JTAG_CTL) = 0x04;

		return 0;
	}
	else
		return -1;
}

//------------------------------------------------------------------- dsp_start ------
static int dsp_start (struct titan *ttn)
{
	PRINTKM(TM,(PKTD "dsp start\n", ttn->number));

	*MMIO (ttn, IMASK) = 0;
	*MMIO (ttn, ICLEAR) = 0xFFFFFFFF;
	*MMIO (ttn, BIU_CTL) &= ~BIU_SR;
	*MMIO (ttn, BIU_CTL) |= BIU_CR;

	return 0;
}

//----------------------------------------------------------------- dsp_is_running ------
static unsigned dsp_is_running (struct titan *ttn)
{
	return ((*MMIO (ttn, BIU_CTL) & BIU_SR) == 0);
}

#define WAIT_FOR_TM_STARTED	200 // jiffies

//------------------------------------------------------------------ dsp_raise_irq ------
static int dsp_raise_irq (struct titan *ttn, int irqnum)
{
	if (irqnum >= 0 && irqnum <= 31)
	{
		unsigned long irqmsk = BIT (irqnum);
//		PRINTKM (TM, (PKTD "[%8ld] raise irq %d\n", ttn->number, jiffies, irqnum));

		if ((*MMIO (ttn, IPENDING) & irqmsk) != 0)
		{
			printk(PKTD "last irq %d not served by tm\n", ttn->number, irqnum);
			return -EBUSY;
		}

		if ((*MMIO (ttn, IMASK) & irqmsk) == 0)
			printk(PKTD "irq %d not enabled\n", ttn->number, irqnum);

		*MMIO (ttn, IPENDING) |= irqmsk;

		return 0;
	}
	else if (irqnum == 32)	// special case for debugging
	{
		*MMIO (ttn, INT_CTL) |= 0x011;	// enable & assert PCI irq A 
		return 0;
	}

	return -EINVAL;
}


//------------------------------------------------------------------- trimedia_info ------
static int trimedia_info (struct titan *ttn)
{
	PRINTKM(TM,(PKTD "info : running=%d, irqcnt=%d\n",
					 ttn->number, dsp_is_running (ttn), ttn->irqcnt));

	mmio_get (ttn, "DRAM_BASE", DRAM_BASE);
	mmio_get (ttn, "MMIO_BASE", MMIO_BASE);
	mmio_get (ttn, "DRAM_CACHEABLE_LIMIT", DRAM_CACHEABLE_LIMIT);
	mmio_get (ttn, "DRAM_LIMIT ", DRAM_LIMIT);
	mmio_get (ttn, "BIU_STATUS", BIU_STATUS);
	mmio_get (ttn, "BIU_CTL", BIU_CTL);
	mmio_get (ttn, "IMASK", IMASK);
	mmio_get (ttn, "IPENDING", IPENDING);
	mmio_get (ttn, "INT_CTL", INT_CTL);
	mmio_get (ttn, "INTVEC27", INTVEC27);

	return 0;
}

#define INT_A		BIT(0)
#define IE_A		BIT(4)
#define INT_IE_A	(INT_A|IE_A)	// INT-interupt asserted  and  IE-interrupt enabled

static TQueueEntry *que_get_item (struct titan *ttn);

static int slot_check ( struct titan *ttn, TSlot *slot );
static int sem_up ( TSemaphore *sem ) ;

//------------------------------------------------------------------- titan_isr ---------
static void titan_isr (int irq, void *dev_id, struct pt_regs *fake)
{
	register struct titan *ttn;
	register volatile unsigned int *intctl;
	TQueueEntry *item ;
	TSlot *slot ;

	ttn = (struct titan *)dev_id;
//  check_pci_status(ttn);
	intctl = (unsigned int *) MMIO (ttn, INT_CTL);

	if ((*intctl & INT_IE_A) == INT_IE_A)
	{
		ttn->irqcnt++;

		for(;;)
		{
			*intctl &= ~INT_A;	// clear irq, also any arisen in the mean time
			if ( ( item = que_get_item(ttn) ) != NULL )
			{
				switch ( item->flag )
				{
				case qfRpcReturn :
					ttn->last_received = item->id.msgnumber ;
					PRINTKM (MSG, (PKTB "[%8ld] isr # %d : rpc #%ld res=%ld\n",
						jiffies, ttn->irqcnt, item->id.msgnumber, item->result));
					wake_up_interruptible (&ttn->receive_queue);
					break ;
				case qfJobEnd :
					slot = item->id.slot ;
					if ( slot_check(ttn,slot) == 0 )
					{
						slot->result = item->result ;
						slot->respar = item->par ;
#if SLOT_STATE_COUNTER
						if ( waitqueue_active (&slot->queue) )
						{
#if DEBUG
							if ( debug != 0 && slot->state != 0 )
								printk (PKTB "irq %d * slot %p queue active, illegal state : %d\n", ttn->irqcnt,
														 slot, slot->state );
#endif
							PRINTKM (SLOT,(PKTB "[%8ld] irq %d/%p : slot %p wakeup, state=%d, res=%d\n",
											jiffies, ttn->irqcnt, item, slot, slot->state, slot->result ));
							wake_up_interruptible (&slot->queue);
						}
						else
						{
							slot->state++ ;
							PRINTKM (SLOT,(PKTB "[%8ld] irq %d/%p : slot %p signal, ++state=%d, res=%d\n",
											jiffies, ttn->irqcnt, item, slot, slot->state, slot->result ));
						}
#else
						switch ( slot->state )
						{
						case ssIdle :
							slot->state  = ssSignaled ;
							PRINTKM (SLOT,(PKTB "[%8ld] irq %d/%p : slot %p signal, res=%d\n",
											jiffies, ttn->irqcnt, item, slot, slot->result ));
							break ;
						case ssWaiting :
							PRINTKM (SLOT,(PKTB "[%8ld] irq %d/%p : slot %p wakeup, res=%d\n",
											jiffies, ttn->irqcnt, item, slot, slot->result ));
							wake_up_interruptible (&slot->queue);
							slot->state = ssWakeUpped ;
							break ;
						case ssSignaled :
						case ssWakeUpped :
#if DUP_SIGNAL_IS_ERROR
							printk(PKTB"[%8ld] irq %d/%p * slot %p multiple signals(ss=%d)\n",
								jiffies, ttn->irqcnt, item, slot, slot->state );
#else
							PRINTKM (SLOT,(PKTB"[%8ld] irq %d/%p * slot %p multiple signals(ss=%d)\n",
								jiffies, ttn->irqcnt, item, slot, slot->state ));
#endif
							break ;
						default :
							printk (PKTB "irq %d * slot %p illegal state : %d\n", ttn->irqcnt,
														 slot, slot->state );
							break ;
						}
#endif
					}
					break ;
				default :
					printk (PKTB "queue error : flag=%lx\n", item->flag);
					return ;
				}
			}
			else
				return ;
		}
	}
}


//==================== TriMedia Debug Print ===========================================

static char magic_string[] = DPB_MAGIC;

//--------------------------------------------------------------- space_phys_to_log ------
static void *space_phys_to_log (TSpace * space, unsigned int addr)
{
	return (void *) ((unsigned int) space->kptr + (addr - space->addr));
}


//-------------------------------------------------------------- trimedia_check_dpb ------
static int trimedia_check_dpb (struct titan *ttn, int flag)
{
	if ( flag == 0
	 || (ttn->TmDebugBuffer != NULL && strcmp(ttn->TmDebugBuffer->magic, magic_string) != 0))
		ttn->TmDebugBuffer = NULL;

	if (ttn->TmDebugBuffer == NULL)
	{
		char *cp = ttn->space[DRAM_IX].kptr;
		char *dram_limit = cp + ttn->space[DRAM_IX].size;

		PRINTKM(TM,(PKTD "search dp buffer\n", ttn->number));
		for (; cp < dram_limit; cp += DPB_MAGICSIZE)
		{
			if (strcmp (cp, magic_string) == 0)
			{
				ttn->TmDebugBuffer = (TTmDebugBuffer *) cp;

				PRINTKM(TM,(PKTD "dp buffer found at %p, size=%d\n", ttn->number,
						 ttn->TmDebugBuffer, ttn->TmDebugBuffer->buffer_size));
				break;
			}
		}
	}
	
	if (ttn->TmDebugBuffer == NULL)
	{
		printk(PKTD " * dp buffer not found\n", ttn->number);
		return -EFAULT;
	}

	return 0;
}


//------------------------------------------------------------- trimedia_debug_info ------
static int trimedia_debug_info (struct titan *ttn, TUserVirtualAddress useraddr)
{
	int result;
	TDebugPrintBuffer dpb;

	if ((result = trimedia_check_dpb (ttn, 0)) == 0)
	{
		TTmDebugBuffer *dp_struct = ttn->TmDebugBuffer;
		dpb.start = dp_struct->buffer - ttn->space[DRAM_IX].addr;
		dpb.tail = dp_struct->tail;
		dpb.size = dp_struct->buffer_size;
		dpb.wrapped = dp_struct->flipped;
		result = write_user_buffer (&dpb, useraddr, sizeof (TDebugPrintBuffer));
	}
	else
		printk(PKTD " * no debug info, result = %d\n", ttn->number, result);
	return result;
}

//------------------------------------------------------------ trimedia_debug_print ------
static int trimedia_debug_print (struct titan *ttn, int flag)
{
	int result;

	if ((result = trimedia_check_dpb (ttn, flag)) == 0)
	{
#define PK_BUF_LEN	256
		TTmDebugBuffer *dp_struct = ttn->TmDebugBuffer;
		char buffer[PK_BUF_LEN];

		char *dpb_start = space_phys_to_log (&ttn->space[DRAM_IX], dp_struct->buffer);
		char *dpb_end = dpb_start + dp_struct->tail;

		unsigned len = dp_struct->tail;
		if (len >= PK_BUF_LEN)
		{
			len = PK_BUF_LEN - 1;
			dpb_start = dpb_end - len;
		}

		if (!dp_struct->flipped)
		{
			memcpy (buffer, dpb_start, len);
			buffer[len] = 0;

			printk (PKTD "dp : %s\n", ttn->number, buffer);
		}
	}
	return result;
}


//==================== semaphore functions ==============================================

static char sem_magic[] = "SEMA" ;
#define SEM_MAGIC	(*(unsigned long *)sem_magic)

struct SSemaphore
{
	unsigned long 	 Magic ;
	struct semaphore KSem ;
} ;

#if LINUX_VERSION_CODE >= KERNEL_VERSION (2,3,0)
    #define PRINTKSEM(msg,sem) \
        PRINTKM (SEM, (PKTB " sem %p : { count:%d, sleepers:%d )\n", \
                        sem, sem->KSem.count.counter, sem->KSem.sleepers) )
#else
    #define PRINTKSEM(msg,sem) \
        PRINTKM (SEM, (PKTB " sem %p : { count:%d, waking:%d, wait:%p )\n", \
                        sem, sem->KSem.count.counter, sem->KSem.waking, sem->KSem.wait ) )
#endif

//---------------------------------------------------------------------------------------
static int semaphore_create ( struct titan *ttn, TUserVirtualAddress arg, int size )
{
	TSemaphore *sem ;
	long int   count ;
	int		   result ;

	if ( size == sizeof (void *) )
	{
		if ( (result = read_user ( arg, &count, sizeof(count))) == 0)
		{
			if ( ( sem = kmalloc ( sizeof(TSemaphore), GFP_KERNEL ) ) != NULL )
			{
        		memset ( sem, 0, sizeof(TSemaphore) ) ;
				sem->Magic = SEM_MAGIC ;
				sema_init ( &sem->KSem, count ) ;
    		    PRINTKSEM ( "created", sem ) ;
				result = write_user_value ((u_long)sem, arg, size);
			}
			else
				result = -ENOMEM;
		}
	}
	else
		result = -EINVAL ;
	return result ;
}


//---------------------------------------------------------------------------------------
static TSemaphore *semaphore_check ( unsigned long arg, int size )
{
   	TSemaphore *sem = (TSemaphore *)arg ;
	if ( size == sizeof (void *) )
    {
        if ( sem != NULL )
        {
            if ( sem->Magic == SEM_MAGIC )
            {
    		    PRINTKSEM ( "check", sem ) ;
                return sem ;
            }
            else
    		    printk(PKTB "sem %p * illegal magic = $%08lx\n", sem, sem->Magic );
        }
        else
   		    printk(PKTB "sem = NULL\n" );
    }
    else
	    printk(PKTB "sem par * illegal parameter size\n" );
	return NULL ;
}


//---------------------------------------------------------------------------------------
static int sem_up ( TSemaphore *sem )
// internal "up"
{
    if ( sem != NULL )
    {
        if ( sem->Magic == SEM_MAGIC )
        {
		    PRINTKSEM ( "sem_up", sem ) ;
            up ( &sem->KSem ) ;
            return 0 ;
        }
        else
		    printk(PKTB "sem_up %p * illegal magic = $%08lx\n", sem, sem->Magic );
    }
    else
	    printk(PKTB "sem_up = NULL\n" );
	return -EINVAL ;
}

//---------------------------------------------------------------------------------------
static int semaphore_up ( struct titan *ttn, unsigned long arg, int size )
// ioctl - "up"
{
	TSemaphore *sem ;

	PRINTKM (SEM, (PKTB "sem up\n" ));
	if ( ( sem = semaphore_check ( arg, size ) ) != NULL )
	{
        up ( &sem->KSem ) ;
		return 0 ;
	}
	else
		return -EINVAL ;
}


//---------------------------------------------------------------------------------------
static int semaphore_down ( struct titan *ttn, unsigned long arg, int size )
{
	TSemaphore *sem ;

	PRINTKM (SEM, (PKTB "sem down\n" ));
	if ( ( sem = semaphore_check ( arg, size ) ) != NULL )
	{
		down_interruptible ( &sem->KSem ) ;
		return 0 ;
	}
	else
		return -EINVAL ;
}

//---------------------------------------------------------------------------------------
static int semaphore_destroy ( struct titan *ttn, unsigned long arg, int size )
{
	TSemaphore *sem ;

	PRINTKM (SEM, (PKTB "sem destroy\n" ));
	if ( ( sem = semaphore_check ( arg, size ) ) != NULL )
	{
		PRINTKM (SEM, (PKTB "  sem free, count = %d\n", sem->KSem.count.counter ));
		memset ( sem, 0xff, sizeof(TSemaphore) ) ; // debugging aid
        sem->Magic = 0xAABBCCDD ;
		kfree ( sem ) ;
		return 0 ;
	}
	else
		return -EINVAL ;
}


//==================== slot functions ==================================================

//------------------------------------------------------------------- slot_create ------
static int slot_create ( struct titan *ttn, TUserVirtualAddress arg, int size )
{
	TSlotCreateParameter cp ;
	int				     result ;

	if ( size == sizeof (TSlotCreateParameter) )
	{
		if ( (result = read_user ( arg, &cp, sizeof(TSlotCreateParameter))) == 0)
		{
			if ( ( cp.slot = kmalloc ( sizeof(TSlot), GFP_KERNEL ) ) != NULL )
			{
				list_add_tail ( &cp.slot->list, &ttn->slots ) ;

				cp.slot->titan	   = ttn ;
				cp.slot->state	   = ssIdle ;
                INIT_WAIT_QUEUE_HEAD(cp.slot->queue);
				cp.slot->usrpar    = cp.usrpar ;
                cp.slot->semaphore = cp.semaphore ;
				cp.slot->respar    = 0 ;

				PRINTKM (SLOT, (PKTB "slot %p created, upar = %ld, sem = %p\n",
                                cp.slot, cp.usrpar, cp.semaphore ));
				result = write_user_buffer ( &cp, arg, sizeof(TSlotCreateParameter) );
			}
			else
				result = -ENOMEM;
		}
	}
	else
		result = -EINVAL ;
	return result ;
}

//------------------------------------------------------------------- slot_check ------
static int slot_check ( struct titan *ttn, TSlot *slot )
{
	if ( slot != NULL )
	{
		// search for 'slot' in list "ttn->slots"
		struct list_head *lh ;

		for ( lh = ttn->slots.next; ; lh = lh->next )
		{
			if ( lh == &ttn->slots )
			{
				printk (PKTD "invalid pointer to slot * $%p\n", ttn->number, slot ) ;
				return -EINVAL ;
			}
			if ( slot == list_entry ( lh, TSlot, list ) )
				break ; 
		}
		if ( slot->titan == ttn )
			return 0 ;
		else
			printk (PKTD "illegal slot * $%p wrong back pointer to titan $%p\n",
						ttn->number, slot, slot->titan ) ;
	}
	else
		printk (PKTD "illegal slot * NULL\n", ttn->number ) ;

	return -EINVAL ;
}

//------------------------------------------------------------------- slot_destroy ------
static int slot_destroy ( struct titan *ttn, TSlot *slot )
{
	int result ;

	if ( ( result = slot_check(ttn,slot)) == 0 )
	{
		list_del ( &slot->list ) ;
		PRINTKM (SLOT, (PKTB "slot %p destroyed\n", slot ));
		kfree ( slot ) ;	// clear above for debug purposes
	}
	return result ;
}

//------------------------------------------------------------------- slot_clear ------
static int slot_clear ( struct titan *ttn, TSlot *slot )
{
	int result ;

	if ( ( result = slot_check(ttn,slot)) == 0 )
	{
//???	if ( slot->state == ssSignaled )
			slot->state = ssIdle ;
	}
	return result ;
}

static unsigned que_entries (struct titan *ttn) ;

//----------------------------------------------------------------------------------
static int slot_wait ( struct titan *ttn, TUserVirtualAddress arg, int size )
{
	int			        result ;
	TSlotQueryParameter sp ;
	TSlot		        *slot ;

	if ( size == sizeof (TSlotQueryParameter) )
	{
		if ( (result = read_user ( arg, &sp, sizeof(TSlotQueryParameter))) == 0)
		{
			unsigned long timeout, waitjiffies ;
	   		unsigned long flags;

			waitjiffies = jiffies_from_ms ( sp.timeout ) ;

			slot = sp.slot ;
			PRINTKM (SLOT, (PKTD "[%8ld] slot_wait %p, sp.timeout = %d\n", ttn->number, jiffies, slot, sp.timeout));
			if ( ( result = slot_check(ttn,slot)) == 0 )
			{
				save_flags ( flags );
				cli();
#if SLOT_STATE_COUNTER
				if ( slot->state > 0 )	// signal to slot arrived before wait : immediate release
				{
					PRINTKM (SLOT, (PKTD "[%8ld] no wait for slot %p : state = %d--\n",
										ttn->number, jiffies, slot, slot->state ));
					slot->state-- ;
				}
				else
				{
					if (sp.timeout > 0)
					{
						PRINTKM (SLOT, (PKTD "[%8ld] wait for slot %p : sleep for %ld\n",
											ttn->number, jiffies, slot, waitjiffies));
						timeout = interruptible_sleep_on_timeout( &slot->queue,
															  waitjiffies );
						if (timeout == 0)
						{
							unsigned entries = que_entries ( ttn ) ;
							restore_flags ( flags );
							printk(PKTB "[%8ld] wait for slot %p * timeout, queue entries = %d\n",
																	jiffies, slot, entries );
							return -ETIME;
						}
					}
					else // only query
					{
						PRINTKM (SLOT, (PKTD "[%8ld] slot wait %p : not signaled and not waiting\n",
											ttn->number, jiffies, slot));
						restore_flags ( flags );
						return -ETIME;
					}
				}
#else
				switch ( slot->state )
				{
				case ssSignaled :	// signal to slot arrived before wait : immediate release
					PRINTKM (SLOT, (PKTD "[%8ld] no wait for slot %p : signaled\n",
										ttn->number, jiffies, slot));
					slot->state = ssIdle ;
					break ;
				case ssIdle :		// wait for signal to slot
					if (waitjiffies > 0)
					{
						PRINTKM (SLOT, (PKTD "[%8ld] wait for slot %p : sleep for %ld\n",
											ttn->number, jiffies, slot, waitjiffies));
						slot->state = ssWaiting ;
						timeout = interruptible_sleep_on_timeout( &slot->queue,
															  waitjiffies );
						slot->state = ssIdle ;	// should have been 'ssWakeUpped' before
						if (timeout == 0)
						{
							unsigned entries = que_entries ( ttn ) ;
							restore_flags ( flags );
							printk(PKTB "[%8ld] wait for slot %p * timeout, queue entries = %d\n",
																	jiffies, slot, entries );
							return -ETIME;
						}
					}
					else
					{
						PRINTKM (SLOT, (PKTD "[%8ld] slot wait %p : not signaled and not waiting\n",
											ttn->number, jiffies, slot));
						restore_flags ( flags );
						return -ETIME;
					}
					break ;
				default :
					printk (PKTD "wait for slot %p * illegal slot state %d\n",
										ttn->number, slot, slot->state);
					restore_flags ( flags );
					return -EINVAL ;
				} // switch
#endif
                if ( slot->semaphore != NULL )
                     sem_up ( slot->semaphore ) ;

				sp.result = slot->result ;
				sp.usrpar = slot->usrpar ;
				sp.respar = slot->respar ;

				restore_flags ( flags );
				if (signal_pending(current))	/* a signal arrived */
					return -ERESTARTSYS;
				result = write_user_buffer ( &sp, arg, sizeof(TSlotQueryParameter)) ;
			}
		}
	}
	else
		result = -EINVAL ;
	return result ;
}

//----------------------------------------------------------------------------------
static int slot_state ( struct titan *ttn, TUserVirtualAddress arg, int size )
{
	int result ;
	TSlotQueryParameter sp ;
	if ( size == sizeof (TSlotQueryParameter) )
	{
		if ( (result = read_user ( arg, &sp, sizeof(TSlotQueryParameter))) == 0)
		{
			if ( (result=slot_check ( ttn, sp.slot )) == 0 )
			{
				sp.state  = sp.slot->state ;
				sp.result = sp.slot->result ;
				result = write_user_buffer ( &sp, arg, sizeof(TSlotQueryParameter) );
			}
		}
	}
	else
		result = -EINVAL ;
	return result ;
}


//------------------------------------------------------------------- slot_init ------
static int slot_init (struct titan *ttn)
{
	INIT_LIST_HEAD ( &ttn->slots ) ;
	return 0 ;
}

//------------------------------------------------------------------- slot_term ------
static int slot_term (struct titan *ttn)
{
	TSlot *slot ;

	while ( ! list_empty ( &ttn->slots ) )
	{
		slot = list_entry ( ttn->slots.prev, TSlot, list ) ; 
		printk (PKTD "slot %p still alive\n", ttn->number, slot ) ;
		slot_destroy ( ttn, slot ) ;
	}
	
	return 0 ;
}


//==================== queue functions ==============================================


//------------------------------------------------------------------- que_init ------
static int que_init (struct titan *ttn)
{
	int result;

	space_init (&ttn->QueueSpace, "quebuf");
	if ((result = space_alloc_page (&ttn->QueueSpace)) == 0)
	{
		TMessageQueue *mq = (TMessageQueue *)ttn->QueueSpace.kptr ;
		mq->items = (MSG_QUEUE_SIZE - sizeof(TMessageQueue)) / sizeof(TQueueEntry) ;
		mq->head = 0 ;
		mq->tail = 0 ;
		
		*MMIO (ttn, MSG_QUEUE_REG) = ttn->QueueSpace.addr;
	}

	return result;
}

//------------------------------------------------------------------- que_term ------
static int que_term (struct titan *ttn)
{
	return space_free_page (&ttn->QueueSpace);
}

//----------------------------------------------------------------------------------
static TQueueEntry *que_get_item (struct titan *ttn)
{
	TMessageQueue *mq   = (TMessageQueue *)ttn->QueueSpace.kptr ;
	TQueueEntry	  *item = NULL ;

    if ( mq->tail != mq->head )
    {
   	    item = &mq->data[mq->tail] ;
        PRINTKM(MSG,(PKTD "h=%ld t=%ld i=%ld / qf=%ld r=%ld id=%08lx\n", ttn->number,
					mq->head, mq->tail, mq->items, item->flag, item->result, item->id.id ));
   	    if ( ++mq->tail >= mq->items )
   	    	 mq->tail = 0 ;
    }
    return item ;
}

//----------------------------------------------------------------------------------
static unsigned que_entries (struct titan *ttn)
{
	TMessageQueue *mq   = (TMessageQueue *)ttn->QueueSpace.kptr ;
	int entries ;

	entries = mq->head - mq->tail ;
	if ( entries < 0 )
		entries += mq->items ;
    return entries ;
}

#if 0 // only used in target
//----------------------------------------------------------------------------------
static long que_put_item (struct titan *ttn, long flag, long result, long id)
{
	TMessageQueue *mq = (TMessageQueue *)ttn->QueueSpace.kptr ;
	long hix ;
	TQueueEntry	  *item = NULL ;
	
	hix = mq->head ;
    if ( ++hix >= mq->items )
    	 hix = 0 ;
	
    if ( mq->tail != hix )  // room for more
    {
   	    item = &mq->data[mq->head] ;
   	
   	    item->flag 	 = flag ;
   	    item->result = result ;
   	    item->id.id  = id ;
   	
   	    mq->head = hix ;
   	    return 0 ;
    }
    else
        return -1 ;
}

//-----------------------------------------------------------------------------------
static long que_put_jobend (struct titan *ttn, long result, TSlot *slot)
{
	return que_put_item ( ttn, qfJobEnd, result, (long)slot ) ;
}

//-----------------------------------------------------------------------------------
static long que_put_rpcresult (struct titan *ttn, long result, long msgnumber)
{
	return que_put_item ( ttn, qfJobEnd, result, msgnumber ) ;
}
#endif

//------------------------------------------------------------------- msg_init ------
static int msg_init (struct titan *ttn)
{
	int result;

	space_init (&ttn->MessageSpace, "msgbuf");
	if ((result = space_alloc_page(&ttn->MessageSpace /*, sizeof(TTmMessageBuffer) */ )) == 0)
	{
		ttn->last_received = 0;
		*MMIO (ttn, MSG_BUFFER_REG) = ttn->MessageSpace.addr;
		mmio_get (ttn, "INTVEC27", INTVEC27);
	}

	return result;
}

//------------------------------------------------------------------- msg_term ------
static int msg_term (struct titan *ttn)
{
	return space_free_page (&ttn->MessageSpace);
}

//------------------------------------------------------------------- msg_send -------
static int msg_send (struct titan *ttn, TUserVirtualAddress usrmesg, int size)
{
	TTmMessage usrmesgheader;
#if DEBUG
	TTmMessage *tmmesg = (TTmMessage *) ttn->MessageSpace.kptr ;
#endif
	int result;

//  PRINTKM(MSG,(PKTD "send message, s=%d\n", ttn->number, size ));
	if ( size == sizeof (TTmMessage) )
	{
		if ((result = read_user (usrmesg, &usrmesgheader, sizeof (TTmMessage))) == 0)
		{
			if (usrmesgheader.mesg_length <= ttn->MessageSpace.size)
			{
				if ((result = read_user (usrmesg, ttn->MessageSpace.kptr,
													usrmesgheader.mesg_length)) == 0)
				{
					*MMIO (ttn, MSG_BUFFER_REG) = ttn->MessageSpace.addr;
					*MMIO (ttn, MSG_QUEUE_REG)  = ttn->QueueSpace.addr;
   	
					if ( ( result = dsp_raise_irq (ttn, HOST_IRQ_NUM) ) == 0 )
					{
						PRINTKM (MSG, (PKTD "[%8ld] send msg #%d l=%d d=%08lx..\n",
					  		ttn->number, jiffies, tmmesg->number, tmmesg->mesg_length,
						 	*(unsigned long*)tmmesg->data ));
					}
				}
			}
			else
			{
				printk(PKTD "[%8ld] send msg #%d l=%d d=%08lx.. * too big\n",
				  		ttn->number, jiffies, tmmesg->number, tmmesg->mesg_length,
					 	*(unsigned long*)tmmesg->data );
				result = -EINVAL ;
			}
		}
	}
	else
		result = -EINVAL ;

	return result;
}


//------------------------------------------------------------------- msg_receive -------
static int msg_receive (struct titan *ttn, TUserVirtualAddress usrmesg, int size)
{
	TTmMessage 		usrmesgheader;
	TTmMessage		*tmmesg = (TTmMessage *) ttn->MessageSpace.kptr ;
	int 			n, result;
	unsigned long	flags;

//      PRINTKM(MSG,(PKTD "receive message, s=%d\n", ttn->number, size ));
	if ( size == sizeof (TTmMessage) )
	{
		if ((result = read_user (usrmesg, &usrmesgheader, sizeof (TTmMessage))) == 0)
		{
			save_flags (flags);
			cli ();
			for(n=0;ttn->last_received != usrmesgheader.number;n++)
			{
				if ( ttn->last_received == 0 )
					PRINTKM (MSG, (PKTD "[%8ld] msg #%d sleep on receive queue\n",
								ttn->number, jiffies, usrmesgheader.number ));
				else
					printk (PKTD "[%8ld] msg #%d sleep on receive queue * sequ-err : msg #%d got\n",
									ttn->number, jiffies, usrmesgheader.number, ttn->last_received );

				if ( interruptible_sleep_on_timeout( &ttn->receive_queue,
											 jiffies_from_ms(IRQ_TIMEOUT_MSEC)) == 0 )
				{
					restore_flags ( flags );
					printk (PKTD "[%8ld] msg #%d sleep on receive queue * timeout\n",
									ttn->number, jiffies, usrmesgheader.number);
					return -ETIME;
				}
				if (signal_pending(current))	/* a signal arrived */
					return -ERESTARTSYS;
			}
			ttn->last_received = 0 ;
			restore_flags ( flags );
			if ( n == 0 )	// no sleep message shown, instead :
			{
				PRINTKM (MSG, (PKTD "[%8ld] msg #%d return was already waiting, don't sleep\n",
										ttn->number, jiffies, usrmesgheader.number ));
			}
#if 1
			tmmesg->mesg_length = usrmesgheader.mesg_length;
#endif
			if (tmmesg->mesg_length <= usrmesgheader.buffer_size)
			{
#if 1
				result = write_user_buffer (ttn->MessageSpace.kptr, usrmesg, 256 ) ;
#else
				result = write_user_buffer (ttn->MessageSpace.kptr, usrmesg, tmmesg->mesg_length);
#endif
				PRINTKM (MSG, (PKTD "[%8ld] received msg #%d, %d bytes, r=%d, d=%08lx..\n",
						 ttn->number, jiffies, tmmesg->number, tmmesg->mesg_length, tmmesg->result,
						 *(unsigned long*)tmmesg->data )) ;
			}
			else
				result = -EINVAL ;
		}
	}
	else
		result = -EINVAL ;

	return result;
}


//==================== device interface functions ====================================

//----------------------------------------------------------------- titan_open ------
static int titan_open (struct inode *inode, struct file *file)
{
	int ret;
	struct titan *ttn;

	if (!(ttn = inode_to_titan(inode)))
		return (-ENXIO);

	PRINTKM(FILE,(PKTD "open\n", ttn->number));
	PRINTKM(FILE,(PKTD "name is %s\n", ttn->number, cdevname(inode->i_rdev)));
	if (!(ttn->flags & TITAN_INITALIZED))	/* device not found */
	{
		PRINTKM(MEM,(PKTD "** NOT INITIALIZED !!!\n", ttn->number));
		ret = -ENXIO;
	}
	else if (ttn->flags & TITAN_OPEN)	/* device is busy */
	{
		PRINTKM(MEM,(PKTD "** BUSY !!!\n", ttn->number));
		ret = -EBUSY;
	}
	else
	{
		PRINTKM(MEM,(PKTD "Setting open flag\n", ttn->number));
		ttn->flags |= TITAN_OPEN;
		PRINTKM(MEM,(PKTD "Setting up receive queue\n", ttn->number));
        INIT_WAIT_QUEUE_HEAD (ttn->receive_queue);
		PRINTKM(MEM,(PKTD "space[DRAM_IX] is mapped to %p\n", ttn->number, (&ttn->space[DRAM_IX])->kptr));
		ret = 0;
	}
	if (!ret)
	{
		PRINTKM(MEM,(PKTD "Incrementing module count\n", ttn->number));
		MOD_INC_USE_COUNT;
		return 0;
	}

	return ret;
}

//------------------------------------------------------------------- ttn_close ------
static void ttn_close (struct titan *ttn)
{
	if (ttn->flags & TITAN_OPEN)	/* device is busy */
	{
		PRINTKM(MEM,(PKTD "Clearing open flag\n", ttn->number));
		ttn->flags &= ~TITAN_OPEN;
		dsp_stop (ttn);
// 	   	stop_capture(ttn);
		slot_term(ttn);
		if (ttn->space[DMA_MMAP_SPACE].addr != 0)
		{
			// free the block using the allocator module
			highfree (ttn->space[DMA_MMAP_SPACE].addr);
			space_init ( &ttn->space[DMA_MMAP_SPACE], "DMA" ) ;
		}
		vmemlist_free(&ttn->VmemBuffers) ;
		MOD_DEC_USE_COUNT;
	}
}

//------------------------------------------------------------------- titan_close ------
#if LINUX_VERSION_CODE >= KERNEL_VERSION (2,1,0)
static int titan_close (struct inode *inode, struct file *file)
#else
static void titan_close (struct inode *inode, struct file *file)
#endif
{
	struct titan *ttn;

	if ((ttn = inode_to_titan(inode))!=NULL)
	{
		PRINTKM(FILE,(PKTD "close\n", ttn->number));
		ttn_close(ttn);
	}
#if LINUX_VERSION_CODE >= KERNEL_VERSION (2,1,0)
	return 0 ;
#endif
}

//------------------------------------------------------------------- titan_read ------
#if LINUX_VERSION_CODE >= KERNEL_VERSION (2,1,0)
static ssize_t titan_read ( struct file *file, char *buffer,
							size_t count, loff_t *ppos) 
#else
static int titan_read (struct inode *inode, struct file *file, char *buffer, int count)
#endif
{
	struct titan *ttn;
	void *p;

#if LINUX_VERSION_CODE >= KERNEL_VERSION (2,1,0)
	if (!(ttn = file_to_titan (file)))
#else
	if (!(ttn = inode_to_titan (inode)))
#endif
		return (-ENXIO);

	if ((p = space_check (&ttn->space[DRAM_IX], file->f_pos, count)) != NULL)
	{
		PRINTKM(FILE,(PKTD "read  %p -> %p, cnt=%d\n", ttn->number, p, buffer, count));
		copy_to_user (buffer, p, count);
		return count;
	}
	else
		return -EINVAL;
}


//------------------------------------------------------------------- titan_write ------
#if LINUX_VERSION_CODE >= KERNEL_VERSION (2,1,0)
static ssize_t titan_write ( struct file *file, const char *buffer,
							 size_t count, loff_t *ppos)
#else
static int titan_write (struct inode *inode, struct file *file, const char *buffer, int count)
#endif
{
	struct titan *ttn;
	void *p;

#if LINUX_VERSION_CODE >= KERNEL_VERSION (2,1,0)
	if (!(ttn = file_to_titan (file)))
#else
	if (!(ttn = inode_to_titan (inode)))
#endif
		return (-ENXIO);

	if ((p = space_check (&ttn->space[DRAM_IX], file->f_pos, count)) != NULL)
	{
		PRINTKM(FILE,(PKTD "write %p -> %p, cnt=%d\n", ttn->number, buffer, p, count));
		copy_from_user (p, buffer, count);
		return count;
	}
	else
		return -EINVAL;
}


#define __case(case_label)							\
	case case_label:								\
		PRINTKM (IOCTL,(PKTD "case label =" #case_label "\n", ttn->number));
//----------------------------------------------------------- titan_ioctl ------
static int titan_ioctl (struct inode *inode, struct file *file,
						unsigned int cmd, unsigned long arg)
{
	struct titan *ttn;
	int error = 0;
	u_long arg_val;
	TUserVirtualAddress uva ;
	u_short dir = _IOC_DIR (cmd);
	u_short size = _IOC_SIZE (cmd);

	if ((ttn = file_to_titan(file)) == NULL)
		return (-ENXIO);

	PRINTKM (IOCTL,(PKTD "ioctl cmd=0x%08x, dir=%d, size=%d, arg=0x%08lx\n",
			 ttn->number, cmd, dir, size, arg));

	uva.uptr = arg  ;
    if ((dir == _IOC_WRITE) && (size > 0) && (size <= sizeof (u_long)))
	{
		if ((error = read_user ( uva, &arg_val, size)) != 0)
		{
			printk (PKTD "ioctl * read_user error = %d\n", ttn->number, error);
			return error;
		}
	}

	switch (cmd)
	{
	__case(TITAN_VERSION)
		return titan_get_version (ttn, uva, size);

	__case(TITAN_HW_INFO)
		return titan_get_hwinfo (ttn, uva, size);

	__case(TITAN_DMA_ALLOC)
		return dmabuffer_alloc (&ttn->space[DMA_MMAP_SPACE], uva, size);

	__case(TITAN_DMA_FREE)
		return dmabuffer_free(&ttn->space[DMA_MMAP_SPACE], uva, size);

	__case(TITAN_VMEM_GET_PHYSICAL)
		return vmemspace_virtual_to_physical(ttn->VmemBuffers, uva, size);

	__case(TITAN_SET_SPACE)
		return set_space_type (ttn, uva, size);
	__case(TITAN_GET_SPACE)
		return space_to_user (ttn, uva, size);

	__case(TITAN_PCI_FIND_CONFIG)
		return pci_read_config (ttn, uva, size);
	__case(TITAN_DSP_START)
		return dsp_start (ttn);
	__case(TITAN_DSP_STOP)
		return dsp_stop (ttn);
	__case(TITAN_DSP_STATE)
		return write_user_value (dsp_is_running (ttn), uva, size);
	__case(TITAN_INFO)
		return trimedia_info (ttn);
	__case(TITAN_SET_LATENCY)
		return pci_set_latency (ttn, (int) arg_val);
	__case(TITAN_DEBUG_PRINT)
		return trimedia_debug_print (ttn, (int) arg_val);
	__case(TITAN_DEBUG_INFO)
		return trimedia_debug_info (ttn, uva);

	__case(TITAN_SEND)
		return msg_send (ttn, uva, size);
	__case(TITAN_RECEIVE)
		return msg_receive (ttn, uva, size);

	__case(TITAN_SLOT_CREATE)
		return slot_create(ttn, uva, size);
	__case(TITAN_SLOT_DESTROY)
		return slot_destroy(ttn, (TSlot *)arg_val );
	__case(TITAN_SLOT_WAIT)
		return slot_wait ( ttn, uva, size );
	__case(TITAN_SLOT_STATE)
		return slot_state ( ttn, uva, size ) ;
	__case(TITAN_SLOT_CLEAR)
		return slot_clear(ttn, (TSlot *)arg_val );
		
	__case(TITAN_VMEM_ALLOC)
		return vmemspace_alloc ( &ttn->VmemBuffers, uva, size);
	__case(TITAN_VMEM_FREE)
		return vmemspace_free ( ttn->VmemBuffers, uva, size);
		
	__case(TITAN_REG_RW)
		return wrrd_register (ttn, uva, size);

	__case(TITAN_SEM_CREATE)
		return semaphore_create ( ttn, uva, size );
	__case(TITAN_SEM_WAIT)
		return semaphore_down ( ttn, arg, size );
	__case(TITAN_SEM_SIGNAL)
		return semaphore_up ( ttn, arg, size );
	__case(TITAN_SEM_DESTROY)
		return semaphore_destroy ( ttn, arg, size );

	default:
		printk(PKTD "ioctl: invalid ioctl request, cmd=$%08x, size=%d, dir=%d\n", ttn->number,
													 cmd, size, dir);
		return -EINVAL;
	}
	return (error);
}


//--------------------------------------------------------- ttn_mmap ------
#if LINUX_VERSION_CODE >= KERNEL_VERSION (2,1,0)
static int titan_mmap ( struct file *file, struct vm_area_struct *vma)
#else
static int titan_mmap (struct inode *inode, struct file *file, struct vm_area_struct *vma)
#endif
{
	struct titan *ttn;
	unsigned long start;
	int result = 0;

#if LINUX_VERSION_CODE >= KERNEL_VERSION (2,1,0)
	if (!(ttn = file_to_titan (file)))
#else
	if (!(ttn = inode_to_titan (inode)))
#endif
		return -ENXIO;

#if LINUX_VERSION_CODE < KERNEL_VERSION (2,3,0)
    if (vma->vm_offset & ~PAGE_MASK)
	{
		PRINTKM(MEM,(PKTD "mmap: invalid offset=0x%08lx\n", ttn->number, vma->vm_offset));
        return -ENXIO;
    }
#endif

	start = (unsigned long) vma->vm_start;
	if (start & ~PAGE_MASK)
	{
		PRINTKM(MEM,(PKTD "mmap: invalid start=0x%08lx\n", ttn->number, start));
		return -EFAULT;
    }

 	switch (ttn->space_type)
	{	// check valid space_type
case DRAM_IX:
case MMIO_IX:
		result = vmemspace_mmap ( ttn->VmemBuffers, vma);
		break;
case DMA_MMAP_SPACE:								// map dma buffer
case PHYS_MMAP_SPACE:								// map physical memory
		result = mmap_phys_space ( vma );
 		ttn->space_type = DRAM_IX ; // ????
		break;
default:
		PRINTKM(MEM,(PKTD "mmap: invalid space_type=%d\n", ttn->number, ttn->space_type));
		result  = -EINVAL;
    }
	return result;
}

//==================== module interface functions ====================================


#define NO_MORE_TITANS	1

//---------------------------------------------------------------------------------------
void check_remap ( struct titan *ttn, unsigned long *remap, int index )
{
	unsigned long *premap = &remap[ttn->number] ;
	if ( *premap != 0 )
	{
		unsigned long oldaddr ;
		if ( ( *premap & 0xffffUL ) != 0 )
			*premap <<= 16 ;
		pcibios_read_config_dword ( ttn->bus, ttn->devfun, index, (unsigned int *)&oldaddr);
		pcibios_write_config_dword ( ttn->bus, ttn->devfun, index, *premap );
		printk (KERN_INFO PKTD "remap [0x%02x] from 0x%08lx to 0x%08lx \n",
									 ttn->number, index, oldaddr, *premap ) ;
	}
}


#define USE_PCI_FIND
//------------------------------------------------------------ titan_find_and_init ------
static int titan_find_and_init (int titan_number)
{
	struct titan	*ttn ;
	unsigned short	command, subid ;
	u_char		bus, devfun ;
	int		membits ;
	unsigned int	version, boardtype ;
#ifdef USE_PCI_FIND
        struct pci_dev  *dev = NULL;
        int             index = -1;
#endif

#ifndef USE_PCI_FIND
	if (pcibios_find_device (PCI_VENDOR_ID_PHILIPS, PCI_DEVICE_ID_TM1000,
						 titan_number, &bus, &devfun) == PCIBIOS_SUCCESSFUL)
	{
		PRINTKM(MOD,(PKTD "TM1000/1100 at bus=%d, devfun=0x%02x\n", titan_number, bus, devfun));
	}
	else if ( pcibios_find_device (PCI_VENDOR_ID_PHILIPS, PCI_DEVICE_ID_TM1300,
						 titan_number, &bus, &devfun) == PCIBIOS_SUCCESSFUL)
	{
		PRINTKM(MOD,(PKTD "TM1300 at bus=%d, devfun=0x%02x\n", titan_number, bus, devfun));
	}
	else
		return NO_MORE_TITANS;
#else
	while ( index < titan_number && ( dev = pci_find_device (PCI_VENDOR_ID_PHILIPS, PCI_DEVICE_ID_TM1000, dev) ) )
                index++;
        if ( dev && ( index == titan_number ) )
	{
		bus = dev->bus->number;
		devfun = dev->devfn;
		PRINTKM(MOD,(PKTD "TM1000/1100 at bus=%d, devfun=0x%02x\n", titan_number, bus, devfun));
	}
	else
        {
                dev = NULL;
                index = -1;
                while ( index < titan_number && ( dev = pci_find_device (PCI_VENDOR_ID_PHILIPS, PCI_DEVICE_ID_TM1300, dev) ) )
                        index++;
                if ( dev && ( index == titan_number ) )
	        {
		        bus = dev->bus->number;
		        devfun = dev->devfn;
		        PRINTKM(MOD,(PKTD "TM1300 at bus=%d, devfun=0x%02x\n", titan_number, bus, devfun));
	        }
        	else
	        	return NO_MORE_TITANS;
        }
#endif
	if ((ttn = (struct titan *) kmalloc (sizeof (struct titan), GFP_KERNEL)) == NULL)
		  return -ENOMEM;

	memset (ttn, 0, sizeof (struct titan));
	titans[titan_number] = ttn;

	ttn->bus = bus;
	ttn->devfun = devfun;
	ttn->number = titan_number;

#ifndef USE_PCI_FIND
        pcibios_read_config_byte (ttn->bus, ttn->devfun, PCI_INTERRUPT_LINE, &ttn->irqlin);
#else
        ttn->irqlin = dev->irq;
#endif

 	ttn->space_type = DRAM_IX ; // ????
	space_init ( &ttn->space[DMA_MMAP_SPACE],  "DMA" ) ;
	space_init ( &ttn->space[PHYS_MMAP_SPACE], "PHYS" ) ;

	check_remap ( ttn, remapdram, PCI_BASE_ADDRESS_0 ) ;
	space_get_from_pci (ttn->bus, ttn->devfun, PCI_BASE_ADDRESS_0, &ttn->space[DRAM_IX], "DRAM");
	
	pcibios_read_config_word ( ttn->bus, ttn->devfun, PCI_SUBSYSTEM_ID, &subid );
	membits   = subid & 0x000f;
	ttn->space[DRAM_IX].size = ( membits > 0 ? membits : 1 ) * 8*MB ; 
	version   = ( (subid & 0x0f00) >> 8 ) ;
	boardtype = ( (subid & 0xf000) >> 12 ) ;                                                                  
	check_remap ( ttn, remapmmio, PCI_BASE_ADDRESS_1 ) ;
	space_get_from_pci (ttn->bus, ttn->devfun, PCI_BASE_ADDRESS_1, &ttn->space[MMIO_IX], "MMIO");
	
	pcibios_read_config_word (ttn->bus, ttn->devfun, PCI_COMMAND, &command);
	PRINTKM(MOD,(PKTD "bases=0x%08lx,0x%08lx irq=%d cmd=0x%04x\n", ttn->number,
			 ttn->space[DRAM_IX].addr, ttn->space[MMIO_IX].addr,
			 ttn->irqlin, command));
	command |= (PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER);
	if (pcibios_write_config_word (ttn->bus, ttn->devfun, PCI_COMMAND, command))
		return -EFAULT;

	if ((IrqMap & BIT (ttn->irqlin)) == 0)	/* If we don't already have this IRQ */
	{
		if (!request_irq (ttn->irqlin, titan_isr, (SA_INTERRUPT | SA_SHIRQ), "titan", ttn))
		{
			IrqMap |= BIT (ttn->irqlin);
		}
		else
		{
			printk (PKTD "request_irq ( %d ) * failed\n", ttn->number, ttn->irqlin );
			return -EBUSY;
		}
		/* This logic deliberately only makes one request_irq() call for
		 * each physical IRQ needed. There is no need for more.
		 */
	}
	if (space_remap (&ttn->space[DRAM_IX]) == NULL)
		return -EFAULT;
	if (space_remap (&ttn->space[MMIO_IX]) == NULL)
		return -EFAULT;

	vmemlist_init ( &ttn->VmemBuffers ) ;
	
	trimedia_register_init (ttn);

	ttn->TmDebugBuffer = NULL;

	msg_init (ttn);
	que_init (ttn);
	slot_init (ttn);

	ttn->flags |= TITAN_INITALIZED ;

	printk (KERN_INFO "MVtitan device %d ok\n", ttn->number);
	printk (KERN_INFO "DRAM size=0x%x, board type=%d, version=%d\n", ttn->space[DRAM_IX].size, boardtype, version);
	return 0;
}

//---------------------------------------------------------------- titan_terminate ------
static void titan_terminate (void)
{
	int i;

	unregister_chrdev (major_dev_num, "titan");

	for (i = 0; i < MAXTITANS; i++)
	{
		struct titan *ttn = titans[i];
		titans[i] = NULL;
		if (ttn)
		{
			PRINTKM(MOD,(PKTD "terminate\n", ttn->number));
			if (ttn->irqlin)
				free_irq (ttn->irqlin, ttn);

			ttn_close(ttn);

			msg_term (ttn);
			que_term (ttn);

			space_unmap (&ttn->space[DRAM_IX]);
			space_unmap (&ttn->space[MMIO_IX]);

			kfree (ttn);
		}
	}
}


//------------------------------------------------------------------- titan_init ------
static int titan_init (void)
{
	u_short titan_number;
	int result = 0;

	PRINTKM(MOD,(PKTB "++titan_init\n"));

	for (titan_number = 0; titan_number < MAXTITANS; titan_number++)
		titans[titan_number] = NULL;

	if (!pcibios_present ())
		return -EUNATCH;

	for (titan_number = 0; titan_number < MAXTITANS; titan_number++)
	{
		if ((result = titan_find_and_init (titan_number)) != 0)
			break;
	}
	if (result >= 0)
	{
		NumTitans = titan_number;
		PRINTKM(MOD,(PKTB "--titan_init ok, %d Titans found.\n", NumTitans));
		return 0;
	}
	else
	{
		PRINTKM(MOD,(PKTB "--titan_init failed (ret=%d).\n", result));
		titan_terminate ();
		return result;
	}
}


//------------------------------------------------------------------- titan_fops ------
static struct file_operations titan_fops =
{
	read:       titan_read,
	write:      titan_write,
	ioctl:      titan_ioctl,
	mmap:       titan_mmap,
	open:       titan_open,
	release:    titan_close
};


#ifdef MODULE
#define ALLOCATOR_MODULE "allocator"
//------------------------------------------------------------------- init_module ------
int init_module (void)
{
	int ret = 0;
    int dynamic_major;             

	printk (KERN_INFO "MATRIX Vision MVtitan - V%d.%d / " __DATE__ " / " __TIME__ " (%lx)\n",
			TITAN_MAJ_VERSION, TITAN_MIN_VERSION, debug );
	if ((dynamic_major = register_chrdev (major_dev_num, "titan", &titan_fops)) < 0)
	{	// -ve means error, +ve is device number
		PRINTKM(MOD, (PKTB "unable to get major %d for titan devices\n", major_dev_num));
		return -EIO;
	}
	
	if (major_dev_num == 0)
		// dynamic allocation of major device
		major_dev_num = dynamic_major;
	
	PRINTKM(MOD, (PKTB "major for titan devices is %d\n", major_dev_num));

	vga_open();

	ret = titan_init ();

	PRINTKM(MOD,(PKTB "--init_module, ret=%d\n\n", ret));
	return ret;
}

//------------------------------------------------------------------- cleanup_module ------
void cleanup_module (void)
{
	PRINTKM(MOD,(PKTB "++cleanup_module\n"));

	titan_terminate ();

#if 0 // release_module not available
	if ( allocator_state == asLoadOk )
		release_module (ALLOCATOR_MODULE, 1);
#endif
	allocator_state = asNotLoaded ;

	vga_close ();

	PRINTKM(MOD,(PKTB "--cleanup_module\n\n"));
}
#endif /*MODULE */
