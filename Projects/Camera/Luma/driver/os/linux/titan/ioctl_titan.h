/*
 * ioctl constants for MATRIX Vision MVtitan driver
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
 $Id: ioctl_titan.h,v 1.7 2002/07/04 09:07:02 hg Exp $
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

#ifndef _IOCTL_TITAN_H
#define _IOCTL_TITAN_H

#include <linux/ioctl.h>
#include "tmregs.h"

#include "../kmod/matrix_types.h"
#include "../kmod/matrix_space.h"

#ifdef __cplusplus
extern "C" {
#endif

#define DRAM_SPACE		0			// SDRAM - PCI space
#define MMIO_SPACE		1           // MMIO  - PCI space
#define VGA_SPACE		2           // VGA display memory space

#define PCI_TYPE0_ADDRESSES 			6
#define PCI_TYPE1_ADDRESSES             2
typedef struct _PCI_COMMON_CONFIG {
    unsigned short  VendorID;                   // (ro)
    unsigned short  DeviceID;                   // (ro)
    unsigned short  Command;                    // Device control
    unsigned short  Status;
    unsigned char   RevisionID;                 // (ro)
    unsigned char   ProgIf;                     // (ro)
    unsigned char   SubClass;                   // (ro)
    unsigned char   BaseClass;                  // (ro)
    unsigned char   CacheLineSize;              // (ro+)
    unsigned char   LatencyTimer;               // (ro+)
    unsigned char   HeaderType;                 // (ro)
    unsigned char   BIST;                       // Built in self test

    union {
        struct _PCI_HEADER_TYPE_0 {
            unsigned long   BaseAddresses[PCI_TYPE0_ADDRESSES];
            unsigned long   Reserved1[1];
        	unsigned short	SubVendorID;
        	unsigned short	SubDeviceID;
            unsigned long   ROMBaseAddress;
            unsigned long   Reserved2[2];

            unsigned char   InterruptLine;      //
            unsigned char   InterruptPin;       // (ro)
            unsigned char   MinimumGrant;       // (ro)
            unsigned char   MaximumLatency;     // (ro)
        } type0;
    } u;

    unsigned char   DeviceSpecific[192];

} PCI_COMMON_CONFIG, *PPCI_COMMON_CONFIG;

typedef struct
{
	unsigned int start;
	unsigned int tail;
	unsigned int size;
	unsigned int wrapped;
} TDebugPrintBuffer;

typedef struct SSlot	  TSlot ;

#define SLOT_STATE_COUNTER	1

#if SLOT_STATE_COUNTER
typedef enum { ssUndefined, ssIdle, ssSignaled, ssWaiting, ssWakeUpped } TSlotState ;
#else
typedef enum { ssUndefined = -1, ssIdle = 0, ssSignaled = 1 /* 2, 3, .. */ } TSlotState ;
#endif

typedef struct
{
	TSlot		  *slot ;
	TSlotState	  state ;
	int			  result ;
	int			  timeout ;
	unsigned long usrpar ;
	unsigned long respar ;
} TSlotQueryParameter ;

typedef struct SSemaphore TSemaphore ;

typedef struct
{
	unsigned long usrpar ;		// in
	TSemaphore	  *semaphore ;
	TSlot		  *slot ;		// out
} TSlotCreateParameter ;

typedef enum { stDRAMIX, stMMIO, stPCIconf, stPCIspace, stDMA, stPHYS } TSpaceType ;

#define dirRD	0x0001
#define dirWR	0x0002
#define dirWRRD	(dirRD|dirWR)

typedef struct { unsigned long addr ; } TMEMSpec ;
typedef struct { unsigned long port ; } TIOSpec ;
typedef struct { unsigned char bus, devfun, index; } TPCIConfSpec ;
typedef struct { unsigned long space, offset ; } TPCISpaceSpec ;

typedef struct
{
	unsigned long	value ;
	unsigned char	size ;
	unsigned char	dir ;
	unsigned char	type ;
	union
	{
		TMEMSpec		mem ;
		TIOSpec			io ;
		TPCIConfSpec	pciconf ;
		TPCISpaceSpec 	pcispace ;
	} spec ;
	TPCIConfSpec	pciconf ;
} TAccSpec ;


typedef struct
{
	unsigned short		index;      // on par
	unsigned char		bus;
	unsigned char		dev_fn;
	PCI_COMMON_CONFIG	pci_config;	// out par
	int				result ;
} TPCIFindConfigStruct ;

typedef struct
{
	unsigned	oscclock, memclock, tmclock ;
	unsigned	reserved[16-3] ;
} TTitanInfoStruct ;


//---- ioctl commands  ---------------------------------------------------------

#define TITAN_IOCTL_MAGIC	'm'

#define _IOt(n)				_IO(TITAN_IOCTL_MAGIC,n)
#define _IORt(n,t)			_IOR(TITAN_IOCTL_MAGIC,n,t)
#define _IOWt(n,t)			_IOW(TITAN_IOCTL_MAGIC,n,t)


#define TITAN_INFO        	_IORt(  1, int)
#define TITAN_VERSION      	_IORt(  2, unsigned long)
#define TITAN_HW_INFO      	_IORt(  1, TTitanInfoStruct)

#define TITAN_DSP_START   	_IORt( 11, int)
#define TITAN_DSP_STOP    	_IORt( 12, int)
#define TITAN_DSP_STATE   	_IORt( 13, int)

#define TITAN_SET_LATENCY  	_IOWt( 21, int)

#define TITAN_DEBUG_PRINT  	_IOWt( 31, int)
#define TITAN_DEBUG_INFO   	_IORt( 32, TDebugPrintBuffer)

#define TITAN_SEND         	_IOWt( 41, TTmMessage)
#define TITAN_RECEIVE      	_IORt( 42, TTmMessage)
#define TITAN_TRANCEIVE    	_IOWt( 43, TTmMessage)

#define TITAN_SLOT_CREATE  	_IORt( 81, TSlotCreateParameter)
#define TITAN_SLOT_DESTROY 	_IOWt( 82, TSlot *)
#define TITAN_SLOT_WAIT 	_IOWt( 83, TSlotQueryParameter)
#define TITAN_SLOT_STATE 	_IORt( 84, TSlotQueryParameter)
#define TITAN_SLOT_CLEAR 	_IOWt( 85, TSlot *)

#define TITAN_VMEM_ALLOC 	_IOWt( 60, TVmemSpace)
#define TITAN_VMEM_FREE 	_IOWt( 61, TVmemSpace)

#define TITAN_VMEM_GET_PHYSICAL	_IORt( 62, TVmemSpace)
#define TITAN_DMA_ALLOC		_IOWt( 63, TVmemSpace)
#define TITAN_DMA_FREE		_IOWt( 64, TVmemSpace)
#define TITAN_SET_SPACE		_IOWt( 65, int)
#define TITAN_GET_SPACE		_IORt( 51, TSpace)
#define TITAN_PCI_FIND_CONFIG	_IORt( 67, TPCIFindConfigStruct )

#define TITAN_REG_RW	   	_IORt( 71, TRegStruct )

#define TITAN_SEM_CREATE	_IORt( 91, TSemaphore * )
#define TITAN_SEM_WAIT	   	_IORt( 92, TSemaphore * )
#define TITAN_SEM_SIGNAL   	_IORt( 93, TSemaphore * )
#define TITAN_SEM_DESTROY	_IORt( 94, TSemaphore * )

#ifdef __cplusplus
}
#endif

#endif /* ifndef _IOCTL_TITAN_H */
