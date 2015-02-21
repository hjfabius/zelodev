/*
 * Tools for MATRIX Vision MatrixFg drivers
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
 $Id: matrix_tools.h,v 1.3 2002/07/04 09:06:08 hg Exp $
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

#ifndef _MATRIX_TOOLS_H
#define _MATRIX_TOOLS_H

#include <matrix_types.h>

#ifdef __cplusplus
extern "C" {
#endif

//======= tools ===============================================================

int  read_user (TUserVirtualAddress uva, void *dest, u_int size);
int  write_user_value (const u_long value, TUserVirtualAddress uva, u_int size);
int  write_user_buffer (const void *ptr, TUserVirtualAddress uva, u_int size);
void wait_jiffies (u_long waitJiffies);


#define jiffies_from_ms(a) 		\
	(((a) > 0) ? ((((a) * HZ)/1000)+1) : 0)

#define _varclr(var)	memset(&var,0,sizeof(var))

#ifdef __cplusplus
}
#endif

#endif /* ifndef _MATRIX_TOOLS_H */
