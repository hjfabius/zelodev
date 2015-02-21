/*
 * allocator.h -- prototypes for allocating high memory
 *
 * NOTE: this is different from my previous allocator, the one that
 *       assembles pages, which revealed itself both slow and unreliable.
 *
 * Copyright (C) 1998   rubini@linux.it (Alessandro Rubini)
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation; either version 2 of the License, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with this program; if not, write to the Free Software
 *   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 *
 *	 This module has been modified by Matrix Vision GmbH and redistributed under the
 *   terms of the GNU General Public License.
 *	 Changes:
 *   (1) Module is loaded without an error even if no memory above " highmemory"
 *   is found (see compiler switch FAIL_IF_SIZE_0)
 *   (2) "allocator_init" has been corrected.
 *   (3) "allocator_whole_buffer_size" is new.
 *
 $Id: allocator.h,v 1.2 2001/02/15 09:03:37 hg Exp $
 *
 */
#ifndef _ALLOCATOR_H
#define _ALLOCATOR_H

#ifdef __cplusplus
extern "C" {
#endif

extern int allocator_free_dma(unsigned long address);
extern unsigned long allocator_allocate_dma (unsigned long kilobytes, int priority);
extern unsigned long allocator_whole_buffer_size(void);

extern int allocator_init(void);
extern void allocator_cleanup(void);

#ifdef __cplusplus
}
#endif

#endif /* ifndef _ALLOCATOR_H */
