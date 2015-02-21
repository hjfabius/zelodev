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

UID	= $(shell id -u)

BIN=../../../../bin
MODULE=titan
 
TGZ=$(MODULE).tgz
 
ADD_DIST=               \
	Makefile	

SOURCES=				\
	titan.c

HEADERS=				\
	ioctl_titan.h		\
	titan.h				\
	tmif.h				\
	tmregs.h

ALL_DIST=               \
	$(SOURCES)          \
	$(HEADERS)          \
	$(ADD_DIST)

OPT		= -O1 -fomit-frame-pointer -I$(KERNEL_SRC_DIR)

ALLOC_PATH=../allocator
KMOD_PATH=../kmod

MODFLAGS = -DMODULE $(SMPFLAGS)
WARNFLAGS = -Wall -Wstrict-prototypes 
CFLAGS =  $(WARNFLAGS) $(OPT)	\
	-DTITAN						\
	-D__KERNEL__				\
	-DDEBUG=1					\
	$(MODFLAGS)					\
	-I$(ALLOC_PATH)				\
	-I$(KMOD_PATH)


##	-save-temps					\



MODLIB=/lib/modules/$(LINUXVERSION)

KMOD_SRCS = $(KMOD_PATH)/matrix_tools.c \
            $(KMOD_PATH)/matrix_space.c \
            $(KMOD_PATH)/matrix_vga.c	\
            $(KMOD_PATH)/kcompat.c		\
            $(KMOD_PATH)/matrix_mem.c


KMOD_OBJS = $(KMOD_PATH)/matrix_tools.o \
            $(KMOD_PATH)/matrix_space.o \
            $(KMOD_PATH)/matrix_vga.o \
            $(KMOD_PATH)/kcompat.o \
            $(KMOD_PATH)/matrix_mem.o

TITAN_DEPENDS = 	titan.h 					\
					ioctl_titan.h 				\
					$(ALLOC_PATH)/allocator.h	\
					$(KMOD_PATH)/matrix_tools.h \
					$(KMOD_PATH)/matrix_space.h \
					$(KMOD_PATH)/matrix_mem.h	\
					$(KMOD_PATH)/matrix_vga.h	\
					$(KMOD_PATH)/vgatable.h		\
					$(KMOD_PATH)/kcompat.h		\
					$(KMOD_PATH)/matrix_types.h

all: titan.o

titan.o: titanmain.o $(KMOD_OBJS) 
	$(LD) -r -o titan.o titanmain.o $(KMOD_OBJS)

titanmain.o: titan.c $(TITAN_DEPENDS)
	$(CC) -c $(CFLAGS) -o titanmain.o titan.c

.c.o:
	$(CC) -c $(CFLAGS) -o $@ $<

install: $(MODLIB)/misc/titan.o

$(MODLIB)/misc/titan.o:	titan.o
ifeq ($(UID),0)
	mkdir -p $(MODLIB)/misc
	cp -p titan.o $(MODLIB)/misc
	chown root.root $(MODLIB)/misc/titan.o
	/sbin/depmod -ae
	sync
else
	@echo "** YOU MUST BE ROOT TO INSTALL KERNEL MODULES **"
endif

load:	install
ifeq ($(UID),0)
	$(BIN)/mvload titan
else
	@echo "** YOU MUST BE ROOT TO LOAD KERNEL MODULES **"
endif

unload:
ifeq ($(UID),0)
	$(BIN)/mvunload titan
else
	@echo "** YOU MUST BE ROOT TO UNLOAD KERNEL MODULES **"
endif

clean:
	rm -f titan.o  titanmain.o $(KMOD_OBJS) 


tgz:    $(TGZ)
 
$(TGZ): $(ALL_DIST)
	$(BIN)/packdist $(MODULE) $(ALL_DIST)
 
dist dist_titan:
	@echo $(ALL_DIST)

clean-tgz:
	rm $(MODULE)*.tgz
