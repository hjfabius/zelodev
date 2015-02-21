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
 $Id: matrix_mem.c,v 1.13 2002/09/10 09:06:02 hg Exp $
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

#include <linux/version.h>
#include <linux/mm.h>
#if LINUX_VERSION_CODE >= KERNEL_VERSION (2,4,18)
#include <linux/highmem.h>
#endif
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
#include "kcompat.h"

#define MODULE_NAME	"mv-mem"


//========= memory handling ==========================================================

//------------------------------------------------------------------- pgd_to_kva -------
void *uvirt_to_virt (pgd_t *pgd, TUserVirtualAddress uva)
{
	void  *ret ;
	pmd_t *pmd;
	pte_t *ptep, pte;

	if (!pgd_none (*pgd))
	{
		pmd = pmd_offset (pgd, uva.uptr);
		if (!pmd_none(*pmd))
		{
			ptep = pte_offset (pmd, uva.uptr);
			pte = *ptep;
			if (pte_present (pte))
			{
				ret = (void *)((unsigned long)page_address (pte_page(pte))|(uva.uptr & (PAGE_SIZE-1)));
//				PRINTKM (MEM,(PKTB "uvirt_to_virt(%lx) = %p\n", uva.uptr, ret));
				return ret;
			}
			else
				PRINTKM(MEM,(PKTB "uvirt_to_virt(0x%08lx) * pte_present(0x%08lx) failed\n",
										 uva.uptr, (unsigned long)ptep )) ;
		}
		else
			PRINTKM(MEM,(PKTB "uvirt_to_virt(0x%08lx) * pmd_none(0x%08lx) failed\n",
									 uva.uptr, (unsigned long)pmd )) ;
	}
	else
		PRINTKM(MEM,(PKTB "uvirt_to_virt(0x%08lx) * pgd_none(0x%08lx) failed\n",
								 uva.uptr, (unsigned long)pgd )) ;
//	PRINTKM (MEM,(PKTB "uvirt_to_virt(%lx) = %p\n", uva.uptr, ret));
	return NULL ;
}



#if 0
//------------------------------------------------------------------- uvirt_to_bus -------
unsigned long uvirt_to_bus (TUserVirtualAddress uva)
{
	void *kva ;
	unsigned long ret;

	kva = uvirt_to_virt (pgd_offset (current->mm, adr), adr);
	ret = virt_to_bus (kva);
	PRINTKM (MEM,(PKTB "uvirt_to_bus(%lx-->%lx)\n", adr, ret));
	return ret;
}


//------------------------------------------------------------------- kvirt_to_bus -------
inline unsigned long kvirt_to_bus (TKernelVirtualAddress ??? unsigned long adr)
{
	unsigned long va, kva, ret;

	va = VMALLOC_VMADDR (adr);
	kva = uvirt_to_virt (pgd_offset_k (va), va);
	ret = virt_to_bus ((void *)kva);
	PRINTKM (MEM,(PKTB "kvirt_to_bus(%lx-->%lx)\n", adr, ret));
	return ret;
}
#endif


//------------------------------------------------------------------- kvirt_to_phys -------
/* Here we want the physical address of the memory.
 * This is used when initializing the contents of the
 * area and marking the pages as reserved.
 */
unsigned long kvirt_to_phys (void *kvapar)
{
	unsigned long ret;
	void *kva ;
	TUserVirtualAddress	uva ;

	uva.uptr = VMALLOC_VMADDR ((unsigned long)kvapar);

	if ( ( kva = uvirt_to_virt (pgd_offset_k (uva.uptr), uva) ) != NULL )
	{
		ret = __pa ((unsigned long)kva);
//		if ( kva != kvapar )
//			PRINTKM (MEM,(PKTB "kvirt_to_phys(%p-->%lx) *** kva = %p != kvapar\n", kvapar, ret, kva));
//		PRINTKM (MEM,(PKTB "kvirt_to_phys(%p-->%lx), kva = %p\n", kvapar, ret, kva));
		return ret;
	}
	else
	{
		PRINTKM (MEM,(PKTB "kvirt_to_phys(%p), uva=%08lx * failed\n", kvapar, uva.uptr));
		return 0 ;
	}
}


//------------------------------------------------------------------- uvirt_to_bus -------
unsigned long uvirt_to_phys (TUserVirtualAddress uva)
{
	void *kva ;
	unsigned long ret;

	kva = uvirt_to_virt (pgd_offset (current->mm, uva.uptr), uva);
	ret = virt_to_phys (kva);
//	PRINTKM (MEM,(PKTB "uvirt_to_phys(%lx-->%lx)\n", uva.uptr, ret));
	return ret;
}


#define _incptr(p,i)    ((void *)((unsigned long)(p) + i ))
#if LINUX_VERSION_CODE < KERNEL_VERSION(2,3,0)
	#define COUNTER_VALUE(p)	(mem_map[PHYSMAP_NR (p)].count.counter)
#else
	#define COUNTER_VALUE(p)	(page_count (virt_to_page (__va(p))))
#endif

//------------------------------------------------------------------- rvfree -------
void rvfree (void *mem, signed long size)
{
	unsigned long page;

	if (mem)
	{
		PRINTKM(MEM,(PKTB "rvfree: freeing memory at mem=%p\n", mem ));
		if ( ( page = kvirt_to_phys (mem) ) != 0 )
        {
			/*
				Possible values are .....
				counter > 1: block reserved and mapped more than once.  Illegal ????
				counter = 1: block reserved, perhaps mapped. O.K.
				counter < 1: ERROR!
			*/
			if ( (COUNTER_VALUE (page) > 1) || (COUNTER_VALUE (page) < 1) )
				printk (PKTB "rvfree: Warning! Illegal count for 1st page =%d\n", COUNTER_VALUE (page) );
			vfree(mem);
   		}
	}
 	else
		PRINTKM(MEM,(PKTB "rvfree: memory is NULL\n" ));
}


//------------------------------------------------------------------- rvreserve -------
static int rvreserve ( void *mem, signed long size, void *pagetable )
{
	void 		  *adr;
	unsigned long *pt, s;
	unsigned long page;

    for ( pt = (unsigned long *)pagetable, adr = mem, s = size; s > 0; s -= PAGE_SIZE, adr = _incptr(adr,PAGE_SIZE) )
	{
		if ( ( page = kvirt_to_phys (adr) ) == 0 )
        {
    		PRINTKM(MEM,(PKTB "rvreserve * failed, kv=%p, page=0x%08lx\n", adr, page ));
            return -ENOMEM ;
        }
        if ( pt != NULL )
	        *pt++ = cpu_to_le32((unsigned long)page);
#if LINUX_VERSION_CODE < KERNEL_VERSION(2,3,0)
		mem_map_reserve (PHYSMAP_NR (page));
#else
		mem_map_reserve (virt_to_page (__va (page)));
#endif
	}
    return 0 ;
}

#if 0
//------------------------------------------------------------------- rvmalloc -------
void *rvmalloc (signed long size, int pagetabsize, void **pagetable )
{
	void *base, *mem ;

	if ( ( base = vmalloc(size+pagetabsize) ) != NULL )
	{
		memset(base, 0, size+pagetabsize);

        *pagetable = base ;
        mem = _incptr(base,pagetabsize) ;

        if ( rvreserve ( mem,  size,        *pagetable ) != 0
          || rvreserve ( base, pagetabsize, NULL       ) != 0 )
		{
        	rvfree ( base, size+pagetabsize ) ;
			mem = NULL ;
		}
	}
    else
        mem = NULL ;

	return mem;
}
#endif


//========= virtual buffer ===========================================================

//------------------------------------------ buffer_initialize -----------------------
int buffer_initialize ( TVmemBuffer *buffer )
{
	space_init ( &buffer->Data, 	 "VM.Data"  ) ;
	space_init ( &buffer->PageTable, "VM.Table" ) ;
	buffer->Next = NULL ;
	buffer->MMapped = 0 ;
	return 0 ;
}


//----------------------------------------------------------------- buffer_vfree -----
int buffer_vfree ( TVmemBuffer *buffer )
{
	PRINTKM(MEM,(PKTB "buffer vfree(%s), size = %d + %d\n",
                           buffer->Data.name, buffer->PageTable.size, buffer->Data.size ));
    if ( buffer->PageTable.kptr != NULL )
	{
        kfree (buffer->PageTable.kptr );
		space_init ( &buffer->PageTable, NULL ) ;
	}
    else
        PRINTKM(MEM,(PKTB "buffer vfree: PageTable.kptr already free\n" ));

    if ( buffer->Data.kptr != NULL )
	{
		rvfree (buffer->Data.kptr,buffer->Data.size );
        space_init ( &buffer->Data, NULL ) ;
	}
    else
        PRINTKM(MEM,(PKTB "buffer vfree: Data.kptr already free\n" ));

    return 0;
}


//--------------------------------------------------------------- buffer_vmalloc -----
int buffer_vmalloc ( TVmemBuffer *buffer, int memorysize )
{
	int	 pagetabsize ;
	void *pmemory, *ppagetab ;
    int  result ;

    PRINTKM(MEM,(PKTB "buffer vmalloc (%p), size = %d\n", buffer, memorysize )) ;

    // memory

    _align_up(memorysize,PAGE_SIZE) ;

	pmemory = vmalloc(memorysize);
    if ( pmemory == NULL )
    {
       	PRINTKM(MEM,(PKTB "vmalloc(%d) memory * failed\n", memorysize ));
        return -ENOMEM ;
    }
    memset(pmemory, 0, memorysize);

    buffer->Data.kptr = pmemory ;
    buffer->Data.addr = 0 ; // virtual memory, not physical linear
    buffer->Data.size = memorysize;

    _pkspace(&buffer->Data) ;

    // page table

	pagetabsize = (memorysize / PAGE_SIZE) * sizeof (long) ;

    _align_up(pagetabsize,PAGE_SIZE) ;

    ppagetab = kmalloc(pagetabsize,GFP_KERNEL);
    if ( ppagetab == NULL )
    {
       	PRINTKM(MEM,(PKTB "kmalloc(%d) pagetable * failed\n", pagetabsize ));
        vfree(pmemory);
        space_init ( &buffer->Data, NULL ) ;
        return -ENOMEM ;
    }
	memset(ppagetab, 0, pagetabsize);

    buffer->PageTable.kptr = ppagetab ;
    buffer->PageTable.addr = __pa ((unsigned long)ppagetab);
    buffer->PageTable.size = pagetabsize;
    _pkspace(&buffer->PageTable) ;

    // reserve all pages

    if ( ( result = rvreserve ( pmemory, memorysize, ppagetab ) ) != 0 )
    {
        rvfree ( pmemory, memorysize  ) ;
        kfree ( ppagetab ) ;
        space_init ( &buffer->Data, NULL ) ;
		space_init ( &buffer->PageTable, NULL ) ;
        return result ;
    }

    return 0 ;
}


//========== virtual buffer list ==============================================

//-----------------------------------------------------------------------------
int vmemlist_init ( TVmemBuffer **pvmblist )
{
	*pvmblist = NULL ;
	return 0 ;
}

//-----------------------------------------------------------------------------
int vmemlist_free (TVmemBuffer **pvmblist)
{
	TVmemBuffer *vmb, *nxt ;

	for ( vmb = *pvmblist; vmb != NULL; vmb = nxt )
	{
		nxt = vmb->Next ;
		PRINTKM(MEM,(PKTB "vmemlist_free: calling buffer_vfree for %p, nxt = %p\n", vmb, nxt));
		buffer_vfree(vmb);
		PRINTKM(MEM,(PKTB "vmemlist_free: calling kfree for %p\n", vmb));
		kfree ( vmb ) ;
		PRINTKM(MEM,(PKTB "vmemlist_free: kfree successfully called for %p\n", vmb));
	}
	*pvmblist = NULL ;
	return 0 ;
}

//------------------------------------------------------------------------------
int vmem_alloc (TVmemBuffer **pvmblist, unsigned long size, TVmemBuffer **pvmb)
{
	TVmemBuffer *vmb ;
	int result ;

	if ( ( vmb = (TVmemBuffer *)kmalloc(sizeof(TVmemBuffer),GFP_KERNEL) ) != NULL )
	{
		buffer_initialize ( vmb ) ;
		if ( ( result = buffer_vmalloc ( vmb, size ) ) == 0 )
		{
			vmb->Next = *pvmblist ; // insert new buffer as new head of buffer list
			*pvmblist = vmb ;
			*pvmb = vmb ;

			PRINTKM(MEM,(PKTB "vmem_alloc (%p) :\n", vmb));
			_pkspace(&vmb->Data) ;
			_pkspace(&vmb->PageTable) ;

			return 0 ;
		}
		PRINTKM(MEM,(PKTB "vmem_alloc: buffer_vmalloc (vmb = %p, size = %ld) ** Failed\n", vmb, size));
		kfree ( vmb ) ;
		return result ;
	}
	else
		return -ENOMEM ;
}


//-----------------------------------------------------------------------------
TVmemBuffer *vmemptr_valid ( TVmemBuffer *vmblist, TUserVirtualAddress uva )
{
	TVmemBuffer *vmb;

	for ( vmb = vmblist; vmb != NULL; vmb = vmb->Next )
	{
/*
		PRINTKM (MEM, (PKTB "vmemptr_valid: looking for uvirt=%08lx, found: uvirt=%08lx, pagetable=0x%08lx handle=0x%p\n",
			uva.uptr, vmb->uptr.uptr,
			vmb->PageTable.addr, (THandle)vmb ));
*/
//		are the user virtual addresses the same ???
		if (uva.uptr == vmb->uptr.uptr)
			return vmb ;
	}
	PRINTKM(MEM,(PKTB "vmemptr_valid ( %08lx ) * invalid user pointer\n", uva.uptr )) ;
	return NULL ;
}


#if 0
//-----------------------------------------------------------------------------
int vmemlist_valid ( TVmemBuffer *vmblist, TVmemBuffer *vmbchk )
{
	TVmemBuffer *vmb;

	for ( vmb = vmblist; vmb != NULL; vmb = vmb->Next )
	{
		if ( vmb == vmbchk )
			return 0 ;
	}
	return -EINVAL ;
}
#endif


//========== DMA buffers ===========================================================
int allocator_state = asNotLoaded ;

//------------------------------------------------------------------- highmalloc --------
unsigned long highmalloc (unsigned long size)
{
/*
	Reserve a continuous block of high memory
		input: size = requested size (bytes), multiple of 1 k (1024, 2048, ...)
		output: physical address of start of block
*/
    unsigned long kilobytes, result;
	int ret ;

	kilobytes = size/KB;

	switch (allocator_state)
	{
	case asNotLoaded :
		if ( (ret = request_module (ALLOCATOR_MODULE)) == 0)
		{
			allocator_state = asLoadOk ;
		}
		else
		{
            PRINTKM (MOD,(PKTB"unable to load dependent module " ALLOCATOR_MODULE
                            " for titan devices %d\n", ret));
			allocator_state = asLoadError ;
			return 0 ;
		}
		break ;
	case asLoadOk :
		break ;
	case asLoadError :
		PRINTKM (MOD,(PKTB"dependent module "ALLOCATOR_MODULE" not loaded\n"));
		return 0 ;
	}

 	if ((result = allocator_allocate_dma (kilobytes, GFP_KERNEL)) != 0)
	{
		PRINTKM(MEM,(PKTB "high memory phys=0x%08lx\n", result));
		return result;
	}
	else
	{
		PRINTKM(MEM,(PKTB "not enough high memory available!\n"));
		return 0 ;
	}
}

//------------------------------------------------------------------- highfree --------
void highfree (unsigned long physaddr)
{
/*
	Free a continuous block of high memory
		input: physical address of start of block
*/
	if (physaddr != 0)
	{
		PRINTKM(MEM,(PKTB "releasing high memory...\n"));
		allocator_free_dma (physaddr);
	}
	else
		PRINTKM(MEM,(PKTB "high memory: no address to release!\n"));
}

//----------------------------------------------------------------- dmabuffer_alloc --------
int dmabuffer_alloc ( TSpace *dmaspace, TUserVirtualAddress usrdmapar, int parsize )
{
/*
  	input:  TVmemSpace.size = size of continuous block to be reserved (bytes)
			0 means "all available"
  	output: TVmemSpace.addr = address of block
  			TVmemSpace.size = size of block reserved
  			TVmemSpace.kptr = kvirt addr of block (not useful)
	(others unused)
	Calling this routine a second time returns the old values without an error
*/
	TVmemSpace 	usrvms ;
	int result ;

	if ( parsize == sizeof (TVmemSpace) )
	{
		if (dmaspace->addr == 0)
		{	// not already reserved
			if ((result = read_user (usrdmapar, &usrvms, sizeof (TVmemSpace))) == 0)
			{
				if  (usrvms.size == 0)
					// if size is 0 then use the whole dma buffer
					usrvms.size = allocator_whole_buffer_size() * KB;

				PRINTKM(MEM,("dmabuffer_alloc: trying size of 0x%08x\n", usrvms.size));
				if (usrvms.size >= PAGE_SIZE)
				{ // should be a multiple of PAGE_SIZE
					_align_up(usrvms.size,PAGE_SIZE) ;
					dmaspace->addr = highmalloc(usrvms.size);
					if ( dmaspace->addr != 0 )
					{	// was successfully reserved, create page tables
						PRINTKM(MEM,("dmabuffer_alloc: 0x%08lx .. +0x%08x was reserved\n",
											usrvms.addr, usrvms.size));
						dmaspace->size = usrvms.size;
						dmaspace->kptr = NULL;
					}
					else
					{
						printk("dmabuffer_alloc * buffer not successfully reserved\n");
						return -EINVAL ;
					}
           		}
				else
				{
					printk("dmabuffer_alloc * size too small 0x%08x\n", usrvms.size);
					return -EINVAL ;
				}
			}
			else
				return result ;
		}
		else
			PRINTKM(MEM,("dmabuffer_alloc: buffer already reserved, returning old values\n"));

		usrvms.addr = dmaspace->addr;
		usrvms.size = dmaspace->size;
		usrvms.kptr = NULL ;
		usrvms.uptr.uptr = 0 ;

		return write_user_buffer (&usrvms, usrdmapar, sizeof (TVmemSpace));
	}
	else
	{
		printk("dmabuffer_alloc * parameter size error\n");
		return -EINVAL ;
    }
}


//--------------------------------------------------------------- dmabuffer_free -------
int dmabuffer_free ( TSpace *dmaspace, TUserVirtualAddress usrdmapar, int parsize )
{
/*
  	input:  TVmemSpace.addr = phys. address of block
  	output: TVmemSpace.addr = 0, if successful
	(others unused)
*/
	TVmemSpace 	usrvms ;
	int result;

	if ( parsize == sizeof (TVmemSpace) )
	{
		if ((result = read_user (usrdmapar, &usrvms, sizeof (TVmemSpace))) == 0)
		{
			// free the block using the allocator module
			highfree (usrvms.addr);

			usrvms.addr = 0;
			usrvms.size = 0;
			usrvms.kptr = NULL;
			usrvms.uptr.uptr = 0 ;

			// write info back to user
			result = write_user_buffer (&usrvms, usrdmapar, sizeof (TVmemSpace));

			space_init ( dmaspace, NULL ) ;
		}
	}
	else
		result = -EINVAL ;

	return result;
}




//========== virtual buffer interface functions ===============================


//-----------------------------------------------------------------------------
int vmemspace_alloc ( TVmemBuffer **pvmblist, TUserVirtualAddress usrvmspar, int parsize )
{
	TVmemSpace 	usrvms ;
	TVmemBuffer *vmb ;
	int			result;

	if ( parsize == sizeof (TVmemSpace) )
	{
		if ((result = read_user (usrvmspar, &usrvms, sizeof (TVmemSpace))) == 0)
		{
			_align_up(usrvms.size,PAGE_SIZE);
			PRINTKM (MEM, (PKTB "vmemspace alloc s=%u\n", usrvms.size )) ;
			if ((result = vmem_alloc ( pvmblist, usrvms.size, &vmb )) == 0)
			{
				usrvms.addr      = vmb->Data.addr ;
				usrvms.kptr      = vmb->Data.kptr ;
                usrvms.uptr.uptr = 0 ;
				usrvms.pagetable = vmb->PageTable.addr ;
				usrvms.handle    = (THandle)vmb ;  // points back to vmb
				usrvms.pages	 = usrvms.size / PAGE_SIZE ;
				usrvms.pagesize  = PAGE_SIZE ;
				result = write_user_buffer ( &usrvms, usrvmspar, sizeof (TVmemSpace) );
				PRINTKM (MEM, (PKTB "vmemspace alloc (%p) s=%u a=$%08lx kv=%p *kv=0x%08x\n",
					usrvms.handle, usrvms.size, usrvms.addr, usrvms.kptr, *(int *)usrvms.kptr )) ;
				PRINTKM (MEM, (PKTB "     pt  a=$%08lx np=%d ps=%d\n",
					usrvms.pagetable, usrvms.pages, usrvms.pagesize ));
			}
		}
	}
	else
		result = -EINVAL ;

	return result;
}


//------------------------------------------------------------------- vmemspace_free -------
int vmemspace_free ( TVmemBuffer *vmblist, TUserVirtualAddress usrvmspar, int parsize )
{
	TVmemSpace 	usrvms ;
	TVmemBuffer *vmb ;
	int result;

	if ( parsize == sizeof (TVmemSpace) )
	{
		if ((result = read_user (usrvmspar, &usrvms, sizeof (TVmemSpace))) == 0)
		{
			TUserVirtualAddress uva = usrvms.uptr ;
			if ((vmb = vmemptr_valid ( vmblist, uva ) ) != NULL )
			{   // vmb corresponding to the virtual address has been found
				PRINTKM (MEM, (PKTB "vmemspace free s=%u a=$%08lx p=%p pt=$%08lx h=%p\n",
							usrvms.size, usrvms.addr, usrvms.kptr, usrvms.pagetable, usrvms.handle ));
				if ((result = buffer_vfree(vmb)) == 0)
				{
					usrvms.size      = 0 ;
					usrvms.addr      = 0 ;
					usrvms.kptr      = NULL ;
                    usrvms.uptr.uptr = 0 ;
					usrvms.pagetable = 0 ;
					usrvms.handle    = 0 ;
					usrvms.pages	 = 0 ;
					usrvms.pagesize  = 0 ;
					result = write_user_buffer ( &usrvms, usrvmspar, sizeof (TVmemSpace) );
				}
			}
			else
				printk (PKTB "vmemspace free * invalid vmemptr : %p\n", vmb );
		}
	}
	else
		result = -EINVAL ;

	return result;
}

//---------------------------------------------------------- vmemspace_virtual_to_physical -------
int vmemspace_virtual_to_physical( TVmemBuffer *vmblist, TUserVirtualAddress usrvmspar, int parsize )
{
/*
  	input:  TVmemSpace.uptr = user virtual address of block
  	output: TVmemSpace.pagetable = physical address, if successful
*/
	TVmemSpace 	usrvms ;
	int result;

	if (parsize == sizeof (TVmemSpace))
	{
		if ((result = read_user (usrvmspar, &usrvms, sizeof (TVmemSpace))) == 0)
		{
			if ( ( usrvms.addr = uvirt_to_phys ( usrvms.uptr ) ) != 0 )
			{
				result = write_user_buffer ( &usrvms, usrvmspar, sizeof (TVmemSpace) );
//  	          PRINTKM (MEM, (PKTB "vmemspace virtual to physical phys=$%08lx uvirt=%p\n",
//      	          usrvms.addr, usrvms.uptr ));
			}
			else
            {
                printk(PKTB "vmemspace user virtual to physical virt=%08lx * failed\n",
                                        usrvms.uptr.uptr );
                result = -EINVAL ;
            }
		}
	}
	else
		result = -EINVAL ;

	return result;
}


//----------------------------------------------------------------- mmap_vmem_space ------
int vmemspace_mmap ( TVmemBuffer *vmblist, struct vm_area_struct *vma)
{
	unsigned long uptrstart, uptr, physpage, size;
	void *kvptr;
	TVmemBuffer *vmb ;
	unsigned long offset;

	uptrstart = (unsigned long) vma->vm_start;
#if LINUX_VERSION_CODE >= KERNEL_VERSION (2,3,0)
	offset = vma->vm_pgoff << PAGE_SHIFT;
#else
	offset = vma->vm_offset;
#endif
	if (uptrstart & ~PAGE_MASK)
		return -EFAULT;

    if (offset & ~PAGE_MASK)
        return -ENXIO;

	size = vma->vm_end - vma->vm_start;
#if 0 // unused
	if (vma->vm_flags & VM_WRITE)	// map video output buffer at end of DRAM
	{
		if (size > ttn->space[DRAM_IX].size)
			return -EFBIG;

		physpage = (ttn->space[DRAM_IX].addr + ttn->space[DRAM_IX].size - size)
			& PAGE_MASK;

		PRINTKM(MEM,(PKTB "mmap: video out buffer $%08lx..+%ld\n", physpage, size));
		for (; size > 0; uptrstart += PAGE_SIZE, physpage += PAGE_SIZE, size -= PAGE_SIZE)
		{
			if (remap_page_range (uptrstart, physpage, PAGE_SIZE, PAGE_SHARED))
				return -EAGAIN;
		}
	}
	else if (vma->vm_flags & VM_READ)	// map virtual buffers
	{
#endif // TITAN - unused
		if ( (vmb = vmblist) != NULL )
		{
			if ( !vmb->MMapped )
			{
				if (size > vmb->Data.size)
	            {
                	PRINTKM(MEM, (PKTB "mmap_vmem_space: invalid size (%ld > %d)\n",
                                	size, vmb->Data.size));
                	return -EFBIG;
                }
				kvptr = (void *) ((unsigned long) vmb->Data.kptr) + offset ;
				if (kvptr == 0)
				{
					PRINTKM(MEM, (PKTB "mmap_vmem_space: invalid kvptr (%p)\n", kvptr));
					return -EFAULT;
				}

				PRINTKM(MEM,(PKTB "mmap: vmem buffer ofs=%ld -> 0x%08lx..+%ld\n",
						(long)offset, uptrstart, size ));
				for ( uptr=uptrstart; size > 0;
							uptr += PAGE_SIZE, (unsigned long)kvptr += PAGE_SIZE, size -= PAGE_SIZE)
				{
					physpage = kvirt_to_phys (kvptr);	// opti : use buffer page table
	                if (physpage == 0)
	   	            {
   	                     printk(PKTB "mmap_vmem_space: kvirt_to_phys(%p) * failed\n",
                                    kvptr);
                    	return -EFAULT;
                	}

    	            if (remap_page_range (uptr, physpage, PAGE_SIZE, PAGE_SHARED))
        	            return -EAGAIN;
				}
				vmb->uptr.uptr = uptrstart ;
				vmb->MMapped = 1 ;
			}
			else
			{
				printk (PKTB "mmap: vmem already mapped\n" );
				return -EINVAL;
			}
		}
		else
		{
			printk (PKTB "mmap: no vmem allocated\n");
			return -EINVAL;
		}
#if 0 // unused
	}
	else
	{
		PRINTKM(MEM,(PKTB "mmap: neither read nor write protection set\n"));
		return -EINVAL;
	}
#endif // unused
	return 0;
}


//--------------------------------------------------------- mmap_phys_space ------
int mmap_phys_space ( struct vm_area_struct *vma )
{
	unsigned long uptrstart, physpage, size ;

	uptrstart = (unsigned long) vma->vm_start;
	size = vma->vm_end - vma->vm_start;

#if LINUX_VERSION_CODE < KERNEL_VERSION (2,3,0)
    physpage = vma->vm_offset ;
#else
    physpage = vma->vm_pgoff << PAGE_SHIFT ;
#endif
	PRINTKM(MEM,(PKTB "mmap_phys_space(phys=$%08lx, size=$%08lx)\n", physpage, size ));

   	if (remap_page_range (uptrstart, physpage, size, PAGE_SHARED))
   		return -EAGAIN;

	return 0;
}


