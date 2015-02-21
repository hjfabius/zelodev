/*
 * Memory handling for MATRIX Vision MatrixFg drivers
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
 $Id: matrix_mem.h,v 1.3 2001/02/20 10:31:21 wa Exp $
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

#ifndef _MATRIX_MEM_H
#define _MATRIX_MEM_H

#include <matrix_types.h>
#include <matrix_space.h>

#ifdef __cplusplus
extern "C" {
#endif

#define _pkspace(sp)	PRINTKM(MEM,(PKTB "    %-10s : s=%8d  kv=%p  a=%08lx\n", (sp)->name, (sp)->size, (sp)->kptr, (sp)->addr ))

//========= memory handling ==========================================================
/* Given PGD from the address space's page table, return the kernel
 * linear virtual mapping of the physical memory mapped at uva.
 */
extern void *uvirt_to_virt (pgd_t *pgd, TUserVirtualAddress uva);
/* inline unsigned long uvirt_to_bus (TUserVirtualAddress uva)
   inline unsigned long kvirt_to_bus (TKernelVirtualAddress ??? unsigned long adr)
*/
extern unsigned long kvirt_to_phys (void *kvapar);
extern unsigned long uvirt_to_phys (TUserVirtualAddress uva);
extern void rvfree (void *mem, signed long size);
extern void *rvmalloc (signed long size, int pagetabsize, void **pagetable);

//========= virtual buffer ===========================================================
typedef struct SVmemBuffer TVmemBuffer ;

struct SVmemBuffer
{
	TSpace				Data,
						PageTable;
	TVmemBuffer			*Next ;
	unsigned			MMapped ;
	TUserVirtualAddress	uptr ;
} ;

#define MMAP_SPACE		0
#define FREAD_SPACE		0
#define FWRITE_SPACE	0
#define OTHER_SPACE1	1
#define OTHER_SPACE2	2
#define OTHER_SPACE3	3
#define DMA_MMAP_SPACE	4
#define PHYS_MMAP_SPACE	5
#define PCIMEM_SPACES	6


extern int buffer_initialize (TVmemBuffer *buffer);
extern int buffer_vfree (TVmemBuffer * buffer);
extern int buffer_vmalloc (TVmemBuffer *buffer, int size);


//========== virtual buffer list ==============================================
extern int vmemlist_init (TVmemBuffer **pvmblist);
extern int vmemlist_free (TVmemBuffer **pvmblist);
extern int vmem_alloc (TVmemBuffer **pvmblist, unsigned long size, TVmemBuffer **pvmb);
extern TVmemBuffer *vmemptr_valid (TVmemBuffer *vmblist, TUserVirtualAddress uva);
/* extern int vmemlist_valid ( TVmemBuffer *vmblist, TVmemBuffer *vmbchk ) */


//========== DMA buffers ===========================================================
typedef enum { asNotLoaded, asLoadOk, asLoadError } TAllocatorState ;

#define ALLOCATOR_MODULE "allocator"
extern int allocator_state;

extern unsigned long highmalloc (unsigned long size);
extern void highfree (unsigned long physaddr);
extern int dmabuffer_free ( TSpace *dmaspace, TUserVirtualAddress usrdmapar, int parsize ) ;
extern int dmabuffer_alloc ( TSpace *dmaspace, TUserVirtualAddress usrdmapar, int parsize ) ;

extern int mmap_phys_space ( struct vm_area_struct *vma ) ;

//========== virtual buffer interface functions ===============================

extern int vmemspace_alloc ( TVmemBuffer **pvmblist, TUserVirtualAddress usrvmspar, int parsize ) ;
extern int vmemspace_free ( TVmemBuffer *vmblist, TUserVirtualAddress usrvmspar, int parsize ) ;
extern int vmemspace_virtual_to_physical( TVmemBuffer *vmblist, TUserVirtualAddress usrvmspar, int parsize ) ;
extern int vmemspace_mmap ( TVmemBuffer *vmblist, struct vm_area_struct *vma) ;

#ifdef __cplusplus
}
#endif

#endif /* ifndef _MATRIX_MEM_H */
