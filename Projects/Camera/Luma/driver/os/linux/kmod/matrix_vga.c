/*
 * Memory handling for MATRIX Vision MatrixFg driver
 *
 *   Changes:
 *   Copyright (c) 2000-2001 Matrix Vision GmbH (info@matrix-vision.de)
 *
 *   Some parts of this driver are based on:
 *    ** bttv - Bt848 frame grabber driver **
 *
 *   Copyright (C) 1996,97,98 Ralph  Metzler (rjkm@thp.uni-koeln.de)
 *                          & Marcus Metzler (mocm@thp.uni-koeln.de)
 *   (c) 1999,2000 Gerd Knorr <kraxel@goldbach.in-berlin.de>
 *
 *
 $Id: matrix_vga.c,v 1.3 2002/01/21 09:37:53 hg Exp $
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

#define __NO_VERSION__
#include <linux/module.h>
#include <linux/version.h>
#include <linux/mm.h>
#include <asm/pgtable.h>
#include <asm/io.h>
#if LINUX_VERSION_CODE >= KERNEL_VERSION (2,4,12)
#include <linux/slab.h>
#else
#include <linux/malloc.h>
#endif
#include <linux/wrapper.h>
#include <linux/kmod.h>

#include "matrix_types.h"
#include "allocator.h"
#include "matrix_mem.h"
#include "matrix_tools.h"
#include "matrix_space.h"

#include <linux/pci.h>

#include "vgatable.h"

#define MODULE_NAME	"mv-vga"


#define NR_CARDS (sizeof(vbs)/sizeof(struct vidbases))
#define DEFAULT_VGA_SIZE (4*MB)

static unsigned long vidmem = 0;

#if LINUX_VERSION_CODE >= KERNEL_VERSION (2,1,17)
MODULE_PARM(vidmem,"l");
#endif

TSpace VGASpace = {"VGA", 0, 0, NULL};

//============== display / VGA =========================================================
// See <kmod/matrix_vga.h> for graphic cards that will be recognised
//------------------------------------------------------------------- vga_open ------
int vga_open (void)
/* Scan for PCI display adapter
   if more than one card is present the last one is used for now */
{
	unsigned int devfn, class, vendev;
	unsigned short vendor, device, badr;
	int found = 0, bus, i;
	unsigned int vidadr = 0;


	for (bus = 0; bus <= 15 && !found; bus++)
    {
        for (devfn = 0; devfn < 0xff && !found; devfn++)
        {
            if (PCI_FUNC (devfn) != 0)
                continue;
            pcibios_read_config_dword (bus, devfn, PCI_VENDOR_ID, &vendev);
            if (vendev == 0xffffffff || vendev == 0x00000000)
                continue;
            pcibios_read_config_word (bus, devfn, PCI_VENDOR_ID, &vendor);
            pcibios_read_config_word (bus, devfn, PCI_DEVICE_ID, &device);
            pcibios_read_config_dword (bus, devfn, PCI_CLASS_REVISION, &class);
            class = class >> 16;
            if ((class >> 8) == PCI_BASE_CLASS_DISPLAY
                || class == PCI_CLASS_NOT_DEFINED_VGA)	/* Number 9 GXE64Pro needs this */
            {
                badr = 0;
                for (i = 0; i < NR_CARDS; i++)
                {
                    if (vendor == vbs[i].vendor)
                    {
                        if (vbs[i].device)
                            if (vbs[i].device != device)
                                continue;
                        PRINTKM(PCI,(PKTB "PCI display adapter: %s\n", vbs[i].name));
                        badr = vbs[i].badr;
                        break;
                    }
                }
                if (NR_CARDS == i)
                    printk ("PCI display adapter unknown\n");
                if (!badr)
                {
                    printk (KERN_ERR "titan   Unknown video memory base address.\n");
                    continue;
                }
                pcibios_read_config_dword (bus, devfn, badr, &vidadr);
                if (vidadr & PCI_BASE_ADDRESS_SPACE_IO)
                {
                    printk (KERN_ERR "titan   Memory seems to be I/O memory.\n");
                    printk (KERN_ERR "titan   Check entry for your card type in kmod/matrix_vga.h vidbases struct.\n");
                    continue;
                }
                vidadr &= PCI_BASE_ADDRESS_MEM_MASK;
                if (!vidadr)
                {
                    printk (KERN_ERR "titan   Memory @ 0, must be something wrong!\n");
                    continue;
                }

                PRINTKM(PCI,(KERN_DEBUG "titan   VGA mem=0x%08x, devfun=0x%04x\n", vidadr, devfn));
                found++;
            }
        }
    }

	// override display address by module parameter
	if (vidmem)
	{
		if (vidmem < 0x1000)
			vidadr = vidmem << 20;
		else
			vidadr = vidmem;
		printk (PKTB "Video memory override: 0x%08x\n", vidadr);
		found = 1;
	}

	if (vidadr != 0)
	{
		PRINTKM(PCI,(PKTB "Using video memory at: 0x%08x\n", vidadr));
		VGASpace.addr = vidadr;
		VGASpace.size = DEFAULT_VGA_SIZE;
	}

	return found;
}

//------------------------------------------------------------------- vga_close ------
void vga_close (void)
{
}


