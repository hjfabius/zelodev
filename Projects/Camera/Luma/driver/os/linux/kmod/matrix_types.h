/*
 * Types for MATRIX Vision drivers
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
 $Id: matrix_types.h,v 1.2 2001/02/05 14:41:53 wa Exp $
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

#ifndef _MATRIX_TYPES_H
#define _MATRIX_TYPES_H

#ifdef __cplusplus
extern "C" {
#endif


//========= general types ========================================================
typedef unsigned long TAddress ;

typedef TAddress TPhysicalAddress ;
#ifdef __KERNEL__
typedef void 							*TKernelVirtualAddress ;
typedef struct { unsigned long uptr ; } TUserVirtualAddress ;
#else
typedef struct { unsigned long kptr ; } *TKernelVirtualAddress ;
typedef void							*TUserVirtualAddress ;
#endif

typedef struct SHandle *THandle ;

typedef struct
{
	TAddress 				addr;
	unsigned 				size;
	TKernelVirtualAddress	kptr;
	TUserVirtualAddress		uptr;
	TAddress 				pagetable;
	THandle	 				handle;
	unsigned				pages;
	unsigned				pagesize;
} TVmemSpace;


#ifdef __KERNEL__
//========= kernel messages========================================================

#define PKT		KERN_INFO MODULE_NAME
#define PKTD	PKT"%d "
#define PKTB	PKT"  "

//========= debug flags / messages ================================================

#if DEBUG
#define _flg(f)		(1<<f##_DBG_BIT)
#define _flgset(f)	((debug & _flg(f) ) != 0 )

								// 0..15 : common debug flags
#define MOD_DBG_BIT			0	// module init & term
#define FILE_DBG_BIT		1	// file ops
#define IOCTL_DBG_BIT		2	// ioctls
#define MEM_DBG_BIT			3	// memory management & mapping
#define IO_DBG_BIT			4	// io access to device
#define PCI_DBG_BIT			5	// pci config & access

								// 16..31 : module specific debug flags
#define BASE_SYS_DEBUG		(_flg(MOD)|_flg(FILE)|            _flg(MEM)|         _flg(PCI))
#define FULL_SYS_DEBUG		(_flg(MOD)|_flg(FILE)|_flg(IOCTL)|_flg(MEM)|_flg(IO)|_flg(PCI))

extern unsigned long debug ;

// to use printk debug macros :
//  'debug' variable should be defined and initialized "main" part of module
//  MODULE_NAME must be defined
//
//		#define MODULE_NAME "titan"
//	 	unsigned long debug = _flg(IOCTL) | _flg(PCI) ;
//		MODULE_PARM(debug,"l");

#define SHOW(a)   	 printk(#a": %d 0x%x\n", a, a)
#define SHOWM(f,a)   do { if ( _flgset(f) ) SHOW(a) ; } while(0)
#define PRINTKM(f,a) do { if ( _flgset(f) ) printk a ; } while(0)
#else
#define _flgset(f)	0

#define SHOW(a)
#define SHOWM(b,a)
#define PRINTKM(b,a)
#endif

//========= useful definitions=====================================================
#define KB	1024
#define MB	(KB*KB)

#define _align_up(s,p)  s = ( (s) + ((p)-1) ) & ~((p)-1)

#endif

#ifdef __cplusplus
}
#endif

#endif /* ifndef _MATRIX_TYPES_H */
