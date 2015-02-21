#ifndef _kcompat_h
#define _kcompat_h


#if LINUX_VERSION_CODE >= KERNEL_VERSION (2,1,0)
#include <asm/uaccess.h>
#include <linux/vmalloc.h>
#else
#include <linux/bios32.h>

#define signal_pending(curr)  (curr->signal & ~curr->blocked)

extern long interruptible_sleep_on_timeout(struct wait_queue **p, long expire) ;
extern int time_before(unsigned long a, unsigned long b) ;
extern unsigned long copy_to_user(void *to, const void *from, unsigned long n) ;
extern unsigned long copy_from_user(void *to, const void *from, unsigned long n) ;

#define ioremap vremap
#define iounmap vfree
#endif

#ifndef PHYSMAP_NR
// for kernels <= 2.2.13
#define PHYSMAP_NR(addr) ((unsigned long)(addr) >> PAGE_SHIFT)
#endif

#if LINUX_VERSION_CODE < KERNEL_VERSION(2,3,0)
#define page_address(x) (x)
#endif

#if LINUX_VERSION_CODE < KERNEL_VERSION(2,2,18)
static __inline__ void list_add_tail(struct list_head *new, struct list_head *head)
{
        __list_add(new, head->prev, head);
}
#endif

#if LINUX_VERSION_CODE < KERNEL_VERSION (2,3,0)
# ifndef init_waitqueue_head
#  define init_waitqueue_head(x) do { *(x) = NULL; } while (0);
# endif
# ifndef DECLARE_WAIT_QUEUE_HEAD 
#  define DECLARE_WAIT_QUEUE_HEAD(x) struct wait_queue *x
# endif
# ifndef INIT_WAIT_QUEUE_HEAD
#  define INIT_WAIT_QUEUE_HEAD(name)					 \
   init_waitqueue_head (&name);
# endif
#else   // see <linux/wait.h>
# if WAITQUEUE_DEBUG
#  define INIT_WAIT_QUEUE_HEAD_DEBUG(name)                \
    name.__magic = (long)&(name).__magic;                 \
    name.__creator = (long)&(name).__magic
# else
#  define INIT_WAIT_QUEUE_HEAD_DEBUG(name)
# endif

# define INIT_WAIT_QUEUE_HEAD(name)                        \
   name.lock = WAITQUEUE_RW_LOCK_UNLOCKED;                 \
   name.task_list.next = &(name).task_list;                \
   name.task_list.prev = &(name).task_list;                \
   INIT_WAIT_QUEUE_HEAD_DEBUG(name);                       \
   init_waitqueue_head (&name);
#endif

#endif /*_kcompat_h */
