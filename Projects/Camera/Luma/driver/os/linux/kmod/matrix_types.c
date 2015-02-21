/*
 * Common types for MATRIX Vision driver
 *
 *   Changes:
 *   Copyright (c) 2000-2001 Matrix Vision GmbH (info@matrix-vision.de)
 *
 *
 $Id: matrix_types.c,v 1.2 2002/01/21 09:37:53 hg Exp $
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

#define __NO_VERSION__

// Use versioning if needed
#if defined(CONFIG_MODVERSIONS) && ! defined(MODVERSIONS)
#   define MODVERSIONS
#endif

#ifdef MODVERSIONS
#  include <linux/modversions.h>
#  include <allocator.ver>
#endif

#include <linux/module.h>
#include <linux/version.h>
#include <linux/mm.h>
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

#define MODULE_NAME	"mv-types"


#if 0
unsigned long debug = 0;

#if LINUX_VERSION_CODE >= KERNEL_VERSION (2,1,17)
#if DEBUG
MODULE_PARM(debug,"l");
#endif
#endif

#endif
