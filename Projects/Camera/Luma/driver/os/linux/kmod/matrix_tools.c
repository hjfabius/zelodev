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
 $Id: matrix_tools.c,v 1.3 2001/02/15 09:03:34 hg Exp $
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

#include <linux/version.h>
#include <asm/io.h>
#include <linux/wrapper.h>

#include "matrix_types.h"
#include "matrix_tools.h"

#if LINUX_VERSION_CODE >= KERNEL_VERSION (2,1,0)
#include <asm/uaccess.h>
#else	/* 2.0.x kernel */
#include <linux/bios32.h>
#endif


#define MODULE_NAME	"mv-tools"

//------------------------------------------------------------- read_user ------
int read_user (TUserVirtualAddress uva, void *dest, u_int size)
{
	int err;

	if ( uva.uptr == 0 || size == 0)
		return -EINVAL;
	if ((err = verify_area (VERIFY_READ, (void *)uva.uptr, size)))
		return err;

#if LINUX_VERSION_CODE >= KERNEL_VERSION (2,1,0)
	switch (size)
	{
	case sizeof (u_char):
		return get_user ( *(u_char  *)dest, (u_char  *)uva.uptr);
	case sizeof (u_short):
		return get_user ( *(u_short *)dest, (u_short *)uva.uptr);
	case sizeof (u_long):
		return get_user ( *(u_long  *)dest, (u_long  *)uva.uptr);
	default:
		copy_from_user (dest, (void *)uva.uptr, size);
		return 0;
	}
#else
	switch (size)
	{
	case sizeof (u_char):
		*(u_char *) dest = get_user ((u_char *) uva.uptr);
		break;
	case sizeof (u_short):
		*(u_short *) dest = get_user ((u_short *) uva.uptr);
		break;
	case sizeof (u_long):
		*(u_long *) dest = get_user ((u_long *) uva.uptr);
		break;
	default:
		copy_from_user (dest, (void *)uva.uptr, size);
		break;
	}
	return 0;
#endif
}

//------------------------------------------------------ write_user_value ------
int write_user_value (const u_long value, TUserVirtualAddress uva, u_int size)
{
	int err;

	if (uva.uptr == 0)
		return -EINVAL;
	if ((err = verify_area (VERIFY_WRITE, (void *)uva.uptr, size)))
		return err;

	switch (size)
	{
	case 1:
		put_user ((u_char) value, (u_char *) uva.uptr);
		break;
	case 2:
		put_user ((u_short) value, (u_short *) uva.uptr);
		break;
	case 4:
		put_user ((u_long) value, (u_long *) uva.uptr);
		break;
	default:
		return -EINVAL;
	}

	return 0;
}

//----------------------------------------------------------- write_user_buffer ------
int write_user_buffer (const void *ptr, TUserVirtualAddress uva, u_int size)
{
	int err;

	if (uva.uptr == 0)
		return -EINVAL;
	if ((err = verify_area (VERIFY_WRITE, (void *)uva.uptr, size)))
		return err;

	copy_to_user ((void *)uva.uptr, ptr, size);

	return 0;
}

/*
 * Delay for WaitJiffies via timeout and schedule().
 * We need to be technically interruptable for this to work,
 * but we really don't want to be, so we block everything.
 * Don't call from interrupt.
 */

//---------------------------------------------------------------- wait_jiffies ------
void wait_jiffies (u_long waitJiffies)
{
	u_long endJiffies = jiffies + waitJiffies;
#if LINUX_VERSION_CODE >=  KERNEL_VERSION (2,1,0)
        do
        {
                schedule();
        }
        while(time_before(jiffies,endJiffies));
#else
	u_long saveBlocked = current->blocked;

	current->blocked = ~0;		/* Block everything we can, ignore the rest */
	while (jiffies < endJiffies)
	{
		current->timeout = endJiffies;
		current->state = TASK_INTERRUPTIBLE;
		schedule ();
	}
	current->blocked = saveBlocked;
#endif
}



