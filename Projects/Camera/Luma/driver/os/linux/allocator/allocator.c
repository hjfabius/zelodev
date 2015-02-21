/*
 * allocator.c -- allocate after high_memory, if available
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
 *
 *	 This module has been modified by Matrix Vision GmbH and redistributed under the
 *   terms of the GNU General Public License.
 *	 Changes:
 *   (1) Module is loaded without an error even if no memory above " highmemory"
 *   is found (see compiler switch FAIL_IF_SIZE_0)
 *   (2) "allocator_init" has been corrected.
 *   (3) "allocator_whole_buffer_size" is new.
 *
 $Id: allocator.c,v 1.8 2002/09/20 14:56:01 hg Exp $
 *
 *
 */

#ifndef __KERNEL__
#  define __KERNEL__
#  error "redefining __KERNEL__"
#endif
#ifndef MODULE
#  define MODULE
#  error "redefining MODULE"
#endif

#include <linux/config.h>

// Use versioning if needed
#if defined(CONFIG_MODVERSIONS) && ! defined(MODVERSIONS)
#   define MODVERSIONS
#endif

#if defined(MODVERSIONS) && !defined(__GENKSYMS__)
#  include <linux/modversions.h>
#  include "allocator.ver"
#endif

#include <linux/version.h>
#ifndef VERSION_CODE
#  define VERSION_CODE(vers,rel,seq) ( ((vers)<<16) | ((rel)<<8) | (seq) )
#endif

#if LINUX_VERSION_CODE < VERSION_CODE(2,0,0)
#  error "This module needs Linux 2.0 or newer"
#else

#ifndef EXPORT_SYMTAB
#define EXPORT_SYMTAB /* Yes, I export a symbol table */
#endif

#include <linux/module.h>
#include <linux/sched.h>
#include <linux/kernel.h>
#include <linux/fs.h>
#include <linux/proc_fs.h>
#include <linux/errno.h>
#include <linux/types.h>

#include <asm/io.h>
#include <asm/page.h>

#include "allocator.h"

/* functions to be exported */
EXPORT_SYMBOL(allocator_allocate_dma);
EXPORT_SYMBOL(allocator_free_dma);
EXPORT_SYMBOL(allocator_whole_buffer_size);


#define ALL_MSG "allocator: "

#undef PDEBUG             /* undef it, just in case */
#ifdef ALL_DEBUG
#  define __static
#  ifdef __KERNEL__
     /* This one if debugging is on, and kernel space */
#    define PDEBUG(fmt, args...) printk( KERN_DEBUG ALL_MSG fmt, ## args)
#  else
     /* This one for user space */
#    define PDEBUG(fmt, args...) fprintf(stderr, fmt, ## args)
#  endif
#else
#  define PDEBUG(fmt, args...) /* not debugging: nothing */
#  define __static static
#endif

#undef PDEBUGG
/* nothing: it's a placeholder */
/*#define PDEBUGG(fmt, args...)*/
#define PDEBUGG PDEBUG

#define FAIL_IF_SIZE_0	0

/* This is meant to be a parameter: 0 = probe, pos. = megs, neg. = disable */
unsigned long himem = 0;
MODULE_AUTHOR("Alessandro Rubini <rubini@linux.it>");
MODULE_DESCRIPTION("Highmem allocator");
#if LINUX_VERSION_CODE >= VERSION_CODE(2,4,10)
MODULE_LICENSE("GPL");
#endif
MODULE_PARM(himem,"l");

static unsigned long allocator_buffer      = 0;  /* physical address */
static unsigned long allocator_buffer_size = 0;  /* kilobytes */

/*
 * The allocator keeps a list of DMA areas, so multiple devices
 * can coexist. The list is kept sorted by address
 */

struct allocator_struct {
    unsigned long address;
    unsigned long size;
    struct allocator_struct *next;
};

struct allocator_struct *allocator_list = NULL;


static int dump_list(void)
{
#ifdef DUMP_ALLOCATOR_LIST
    struct allocator_struct *ptr;

    PDEBUG("Current list:\n");
    for (ptr = allocator_list; ptr; ptr = ptr->next) {
        PDEBUG("0x%08lx (size %likB)\n",ptr->address,ptr->size>>10);
    }
#endif
    return 0;
}

/* ========================================================================
 * This function is the actual allocator.
 *
 * If space is available in high memory (as detected at load time), that
 * one is returned. The return value is a physical address (i.e., it can
 * be used straight ahead for DMA, but needs remapping for program use).
 */

unsigned long allocator_allocate_dma (unsigned long kilobytes, int prio)
{
    struct allocator_struct *ptr = allocator_list, *newptr;

    /* check if high memory is available */
    if (!allocator_buffer)
        return 0;

    PDEBUG("request for %ik\n",(int)kilobytes);

    while (ptr && ptr->next) {
        if (ptr->next->address - (ptr->address+ptr->size) >= (kilobytes<<10))
            break; /* enough space */
        ptr = ptr->next;
    }
    if (!ptr->next) {
        /* dump_list(); */
        PDEBUG("alloc failed\n");
        return 0; /* end of list */
    }
    newptr = kmalloc(sizeof(struct allocator_struct),prio);
    if (!newptr)
        return 0;

    /* ok, now stick it after ptr */
    newptr->address = ptr->address + ptr->size;
    newptr->size = kilobytes<<10;
    newptr->next = ptr->next;
    ptr->next = newptr;

    dump_list();
    PDEBUG("returning 0x%08lx\n",newptr->address);
    return newptr->address;
}

int allocator_free_dma (unsigned long address)
{
    struct allocator_struct *ptr = allocator_list, *prev;

    while (ptr && ptr->next) {
        if (ptr->next->address == address)
            break;
	ptr = ptr->next;
	}
    /* the one being freed is ptr->next */
    prev = ptr; ptr = ptr->next;

    if (!ptr) {
        printk(KERN_ERR ALL_MSG "free_dma(0x%08lx) but add. not allocated\n",
               ptr->address);
        return -EINVAL;
    }
    PDEBUGG("freeing: %08lx (%li) next %08lx\n",ptr->address,ptr->size,
	   ptr->next->address);
    prev->next = ptr->next;
    kfree(ptr);

    dump_list();
    return 0;
}


/* ========================================================================
 * allocator_whole_buffer_size
 *
 * How big is the whole dma buffer before we use any of it ?
 * Return the answer in kilobytes
 *
 */
unsigned long allocator_whole_buffer_size(void)
{
	return allocator_buffer_size;  // kilobytes!
}


/* ========================================================================
 * Init and cleanup
 *
 * On cleanup everything is released. If the list is not empty, that a
 * problem of our clients
 */
int allocator_init(void)
{
    /* check how much free memory is there */
    volatile void *remapped;
    unsigned long trial_size = !(himem) ? 1<<20 : himem;
    unsigned long last_trial = 0;
    int step = !(himem); /* no step if size known */
    unsigned long i=0;
    struct allocator_struct *head, *tail;
    char test_string[]  ="0123456789abcde"; /* 16 bytes */
	int allocator_himem = 0;

    PDEBUGG("\n=====================================\n");

    allocator_himem = virt_to_phys (high_memory);
    PDEBUGG("physical himem = 0x%x\n", allocator_himem);
    if (allocator_himem < 0) /* don't even try */
        return -EINVAL;

    while (1) {
        remapped = ioremap(allocator_himem, trial_size);
        if (!remapped)
            break;
        PDEBUGG("Trying %li kB\n",trial_size>>10);
        for (i=last_trial; i<trial_size; i+=16) {
            strcpy((char *)(remapped+i), test_string);

	    if (strcmp((char *)(remapped+i), test_string))
	    {
                PDEBUGG("End of Memory!\n");
                break;
	    }
        }

        iounmap((void *)remapped);

        schedule();
        last_trial = trial_size;
        if (i==trial_size)
            trial_size <<= step; /* double, if all went well */
        else
            break;
        if (!step) break;
    }
    PDEBUG("%li kB, %li B\n",i>>10,i);
    allocator_buffer_size = i>>10; /* kilobytes */
    allocator_buffer = allocator_himem;
    if (allocator_buffer_size > 0) {
        printk(KERN_INFO ALL_MSG "%ld kB free high memory\n", allocator_buffer_size );
	} else {
        printk(KERN_WARNING ALL_MSG "no free high memory to use\n");
#if FAIL_IF_SIZE_0
        return -ENOMEM;
#endif
    }
    /*
     * to simplify things, always have two cells in the list:
     * the first and the last. This avoids some conditionals and
     * extra code when allocating and deallocating: we only play
     * in the middle of the list
     */
    head = kmalloc(sizeof(struct allocator_struct),GFP_KERNEL);
    if (!head)
        return -ENOMEM;
    tail = kmalloc(sizeof(struct allocator_struct),GFP_KERNEL);
    if (!tail) {
        kfree(head);
        return -ENOMEM;
    }

    head->size = tail->size = 0;
    head->address = allocator_buffer;
    tail->address = allocator_buffer + (allocator_buffer_size<<10);
    head->next = tail;
    tail->next = NULL;
    allocator_list = head;

    return 0; /* ok, ready */
}

void allocator_cleanup(void)
{
    struct allocator_struct *ptr, *next;

    for (ptr = allocator_list; ptr; ptr = next) {
        next = ptr->next;
        PDEBUG("freeing list: 0x%08lx\n",ptr->address);
        kfree(ptr);
    }

    allocator_buffer      = 0;
    allocator_buffer_size = 0;
    allocator_list = NULL;
}


#endif /* 1.99.4 or newer */
