# Comment/uncomment the following line to enable/disable debugging
#DEBUG=y

## assumes kernel include directory is in /lib/modules/`uname -r`/build/include
## change if not valid on your system!!
KERNEL_SRC_DIR=/lib/modules/$(shell uname -r)/build/include
include $(KERNEL_SRC_DIR)/../.config
ifdef CONFIG_SMP
 SMPFLAGS = -D__SMP__
endif

ifeq ($(LINUXVERSION),)
 LINUXVERSION	= $(shell uname -r)
endif

NUMERICAL_VERSION= $(firstword $(subst -, ,$(LINUXVERSION)))


ifeq ($(DEBUG),y)
  DEBFLAGS = -O -g -DJIT_DEBUG -DJIQ_DEBUG -DALL_DEBUG
else
  DEBFLAGS = -O1
endif

UID	= $(shell id -u)

MODLIB		= /lib/modules/$(LINUXVERSION)
GENKSYMS	= /sbin/genksyms

BIN=../../../../bin
MODULE=allocator
 
TGZ=$(MODULE).tgz
 
ADD_DIST=               \
	Makefile

SOURCES=				\
	allocator.c

HEADERS=				\
	allocator.h

ALL_DIST=               \
	$(SOURCES)          \
	$(HEADERS)          \
	$(ADD_DIST)

MODFLAGS = -DMODULE -I$(KERNEL_SRC_DIR)
WARNFLAGS = -Wall -Wstrict-prototypes

ALLOCEXTRA =  -Dallocator_init=init_module -Dallocator_cleanup=cleanup_module
CFLAGSALLOCMOD = -D__KERNEL__ $(MODFLAGS) $(WARNFLAGS) $(DEBFLAGS) $(ALLOCEXTRA) $(SMPFLAGS)


all: allocator.o

ifdef CONFIG_MODVERSIONS
allocator.o: allocator.c allocator.h allocator.ver
	$(CC) $(CFLAGSALLOCMOD) -c allocator.c
else
allocator.o: allocator.c allocator.h
	$(CC) $(CFLAGSALLOCMOD) -c allocator.c
endif

allocator.ver: allocator.c
	$(CC) $(CFLAGSALLOCMOD) -E -D__GENKSYMS__ -c $^ | $(GENKSYMS) -k $(NUMERICAL_VERSION) > $@


install: $(MODLIB)/misc/allocator.o

$(MODLIB)/misc/allocator.o:	allocator.o
ifeq ($(UID),0)
	mkdir -p $(MODLIB)/misc
	cp -p allocator.o $(MODLIB)/misc
	chown root.root $(MODLIB)/misc/allocator.o
	/sbin/depmod -a
	sync
else
	@echo "** YOU MUST BE ROOT TO INSTALL KERNEL MODULES **"
endif

load:	install

clean:
	rm -f *.o *.s *.i *.ver

tgz:    $(TGZ)
 
$(TGZ): $(ALL_DIST)
	$(BIN)/packdist $(MODULE) $(ALL_DIST)
 
dist dist_titan dist_slc dist_sg_srgb dist_sdig dist_sc:
	@echo $(ALL_DIST)

clean-tgz:
	rm $(MODULE)*.tgz

