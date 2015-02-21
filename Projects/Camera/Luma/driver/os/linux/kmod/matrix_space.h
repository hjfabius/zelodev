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
 $Id: matrix_space.h,v 1.3 2001/02/20 10:31:22 wa Exp $
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

#ifndef _MATRIX_SPACE_H
#define _MATRIX_SPACE_H

#include "matrix_types.h"

#ifdef __cplusplus
extern "C" {
#endif

//========== memory spaces ===========================================================
typedef struct
{
	char					*name;
	TPhysicalAddress		addr;
	unsigned				size;
	TKernelVirtualAddress	kptr;
    TUserVirtualAddress		descr;    // used only in titan user space
} TSpace;


extern void space_init (TSpace *space, char *name);
// extern int space_alloc_page (TSpace *space/*, int size */ );
// extern int space_free_page (TSpace * space);
// extern void *space_remap (TSpace * space);
// extern void space_unmap (TSpace * space);
extern void *space_check (TSpace * space, int offset, int count);
//extern void space_get_from_pci (u_char bus, u_char devfun, int index, TSpace * space, char *name);

#ifdef __cplusplus
}
#endif

#endif /* ifndef _MATRIX_SPACE_H */
