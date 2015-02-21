/*
 * MATRIX Vision MVtitan driver
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
 $Id: titan.h,v 1.11 2002/07/12 10:43:43 hg Exp $
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

#ifndef PCI_VENDOR_ID_PHILIPS
#define PCI_VENDOR_ID_PHILIPS   0x1131
#endif
#ifndef PCI_DEVICE_ID_TM1000
#define PCI_DEVICE_ID_TM1000	0x5400	// TM1000, TM1100
#define PCI_DEVICE_ID_TM1300	0x5402
#endif

#define AI_CTL			0x101c04   // internal TriMedia registers, accessed by titan.c
#define AI_FREQ			0x101c10
#define AO_CTL			0x102004
#define AO_FREQ			0x102010
#define BDCTL			0x101020
#define BICTL			0x101000
#define BIU_CTL			0x103008
#define BIU_STATUS		0x103004
#define DRAM_BASE		0x100000
#define DRAM_CACHEABLE_LIMIT	0x100008
#define DRAM_LIMIT		0x100004
#define ICLEAR			0x100824
#define ICP_SR			0x102414
#define IIC_CTL			0x10340c
#define IMASK			0x100828
#define INTVEC26		0x1008e8
#define INTVEC27		0x1008ec
#define INT_CTL			0x103038
#define IPENDING		0x100820
#define JTAG_CTL		0x103808
#define JTAG_DATA_IN		0x103800
#define JTAG_DATA_OUT		0x103804
#define MMIO_BASE		0x100400
#define PLL_RATIOS      0x100300
#define SSI_CTL			0x102c00
#define SYSTIMER_TCTL		0x100C68
#define TIMER1_TCTL		0x100C08
#define TIMER2_TCTL		0x100C28
#define TIMER3_TCTL		0x100C48
#define VI_CLOCK		0x101408
#define VI_CTL			0x101404
#define VLD_COMMAND		0x102800
#define VO_CLOCK		0x101808
#define VO_CTL			0x101804

#define DRAM_IX			0			// PCI base register index
#define MMIO_IX			1

#define MMIO(t,ofs)  		((volatile unsigned int*)(((char *)t->space[MMIO_IX].kptr) + ofs))
#define DRAM(t,ofs)  		((volatile unsigned int*)(((char *)t->space[DRAM_IX].kptr) + ofs))
#define BIT(i) 			(1<<(i))

#define BIU_SE  		BIT(0)	// BIU_CTL register bits
#define BIU_HE  		BIT(9)
#define BIU_CR  		BIT(10)
#define BIU_SR  		BIT(11)

#define TITAN_MAJ_VERSION	0
#define TITAN_MIN_VERSION	10
#define TITAN_NUM_VERSION	(TITAN_MAJ_VERSION*100+TITAN_MIN_VERSION)

#define KB	1024
#define MB	(KB*KB)

#ifdef USE_FIXED_DEVICE
#define TITAN_MAJOR    60
#else // dynamic allocation of device number
#define TITAN_MAJOR  0
#endif

#define MAXTITANS      16

#define DMA_MMAP_SPACE	4
#define PHYS_MMAP_SPACE	5

#define PCIMEM_SPACES	6

#ifdef __KERNEL__
struct SSlot
{
	struct list_head	list;
	struct titan		*titan ;
	TSlotState			state ;
#if LINUX_VERSION_CODE < KERNEL_VERSION (2,3,0)
	struct wait_queue   *queue;
#else
	wait_queue_head_t   queue;
#endif
    int					result ;
    ulong				usrpar ;
    TSemaphore          *semaphore ;
    ulong				respar ;
} ; // TSlot ;
#endif

struct titan
{
	int			        number ;
	unsigned	        flags ;
	TSpace		        space[PCIMEM_SPACES];
#ifdef __KERNEL__
	int			        space_type;
    TVmemBuffer	        *VmemBuffers;

	u_char 				bus;					/* PCI bus number */
	u_char 				devfun;					/*  .. device / function */
	u_char 				irqlin;
	unsigned 			irqcnt;
//  struct task_struct  *proc;      /* process to receive raised signal */
#if LINUX_VERSION_CODE < KERNEL_VERSION (2,3,0)
	struct wait_queue   *receive_queue;
#else
	wait_queue_head_t   receive_queue;
#endif
	TTmDebugBuffer 		*TmDebugBuffer;
	TSpace 				MessageSpace;
	TSpace 				QueueSpace;
	struct list_head	slots;
	unsigned            last_received;
#endif
};

#define MessageBuffer	((TTmMessageBuffer *)MessageSpace.kptr)

#define	TITAN_INITALIZED	0x00000001	/* ..flags */
#define	TITAN_OPEN			0x00000002
