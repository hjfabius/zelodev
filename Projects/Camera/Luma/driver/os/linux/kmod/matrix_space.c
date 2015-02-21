/*
 * Space handling for MATRIX Vision MatrixFg drivers
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
 $Id: matrix_space.c,v 1.3 2001/02/15 09:03:33 hg Exp $
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
#endif

#include <linux/mm.h>
#include <asm/pgtable.h>
#include <asm/io.h>
#include <linux/wrapper.h>

#include "matrix_types.h"
#include "matrix_space.h"


#define MODULE_NAME	"mv-space"

//------------------------------------------------------------------ space_init ------
void space_init (TSpace *space, char *name)
{
	if ( name != NULL )
		space->name = name;
	space->kptr  = NULL;
	space->addr  = 0;
	space->size  = 0;
	space->descr.uptr = 0 ;
}

#if 0
//------------------------------------------------------------ space_alloc_page ------
int space_alloc_page (TSpace *space/*, int size */ )
{
	space->kptr = (void *) get_free_page (GFP_KERNEL); // kmalloc ( size, GFP_KERNEL );

	if (space->kptr != NULL)
	{
		space->addr = virt_to_phys (space->kptr);
		if (space->addr != 0)
		{
			space->size = PAGE_SIZE;
			PRINTKM(MEM,(PKTB "alloc page to space[%s], v=%p p=0x%08lx..+0x%08x\n",
					 space->name, space->kptr, space->addr, space->size));
			return 0;
		}
		else
		{
			PRINTKM(MEM,(PKTB "alloc page to space[%s] * virt_to_phys(%p) failed\n",
								 space->name, space->kptr ));
			free_page ((int) space->kptr);
			space->kptr = NULL ;
			return -ENOMEM;
		}
	}
	else
	{
		PRINTKM(MEM,(PKTB "alloc page to space[%s] * get_free_page failed\n", space->name));
		return -ENOMEM;
	}
}

//------------------------------------------------------------- space_free_page ------
int space_free_page (TSpace * space)
{
	if (space->kptr != NULL)
	{
		PRINTKM(MEM,(PKTB "space_free_page (->kptr = %p)\n", space->kptr ));
		free_page ((int) space->kptr);
		space_init (space, NULL);
		return 0;
	}
	else
		return -1;
}
#endif


#if 0
//----------------------------------------------------------------- space_remap ------
void *space_remap (TSpace * space)
{
	u_long base_page = space->addr & PAGE_MASK;
	u_long base_offset = space->addr & ~PAGE_MASK;

	space->kptr = (void *) (base_offset | (u_long) ioremap ((u_long) base_page, space->size));
	PRINTKM(MEM,(PKTB "map space[%s] 0x%08lx -> %p\n", space->name, space->addr, space->kptr));
	return space->kptr;
}

//----------------------------------------------------------------- space_unmap ------
void space_unmap (TSpace * space)
{
	if (space->kptr != NULL)
	{
		PRINTKM(MEM,(PKTB "unmap space[%s]\n", space->name));
		vfree( space->kptr );
		space->kptr = NULL;
	}
}
#endif

//----------------------------------------------------------------- space_check ------
void *space_check (TSpace * space, int offset, int count)
{
	if (space->kptr != NULL && offset >= 0 && offset + count <= space->size)
		return (void *) (((u_char *) space->kptr) + offset);
	else
		return NULL;
}

#if 0
//---------------------------------------------------------- space_get_from_pci ------
void space_get_from_pci (u_char bus, u_char devfun, int index, TSpace * space, char *name)
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

	space->size = ((~addrmask) + 1) & ~7;

	PRINTKM(MEM,(PKTB "get space[%s] ix=%d, 0x%08lx..+0x%08x\n",
					 name, index, space->addr, space->size));
}
#endif

