#! /bin/make

BIN=../../bin

OSOBJS=\
	osacc.o \
	osclkcom.o \
	osdelay.o \
	ospciacc.o \
	ospcicfg.o \
	ostools.o

LINUXOSOBJS=\
	linux/tools.o \
	linux/osclock.o \
	linux/osdma.o \
	linux/osinit.o \
	linux/osio.o \
	linux/osisr.o \
	linux/osmem.o \
	linux/ospci.o \
	linux/portacc.o \
	linux/sysdrv.o \
	linux/sysdrv_int.o \
	linux/kinterrupt.o

VGAOBJS=\
	linux/vga/osdispl.o

X11OBJS=\
	linux/x11/osdispl.o \
	linux/x11/dgainfo.o

NODISPOBJS=\
	linux/nodisp/osdispl.o 

MODULE=os
SUB_DIRS=linux
TGZ=$(MODULE).tgz

ADD_DIST=   \
	Makefile

all clean install load unload load_matrixfg load_titan load_sigma unload_matrixfg unload_titan unload_sigma titan slc sc sg srgb sdig: 
	make -C linux $@

tgz:    $(TGZ)
 
$(TGZ): dist
	$(BIN)/packdist $(MODULE) $(ADD_DIST) `$(BIN)/makedistlist $(SUB_DIRS)`
 
dist dist_titan dist_slc dist_sg_srgb dist_sdig dist_sc:
	$(BIN)/makedistnode $@ $(SUB_DIRS)
	@echo $(ADD_DIST)

clean-tgz:
	rm -f $(MODULE)*.tgz


DEVELOPER=$(shell if [ -e Makefile.MV ]; then echo "y"; fi)
ifeq ($(DEVELOPER),y)
	include Makefile.MV
endif 
