#! /bin/make

MODULE=driver

BIN=../bin
TGZ=$(MODULE).tgz
SUB_DIRS=hjMV common os lib include
ADD_DIST=	\
	README	\
	README.pdf	\
	GPL/COPYING	\
	GPL/GLPL.html	\
	Makefile


.PHONY:	titan slc sdig

all clean titan slc sc sg srgb sdig:
	$(BIN)/makeloop $@ os hjMV

install load unload load_matrixfg load_titan load_sigma unload_matrixfg unload_titan unload_sigma:
	$(BIN)/makeloop $@ os

tgz:	$(TGZ)

$(TGZ): dist
	$(BIN)/packdist	$(MODULE) $(ADD_DIST) `$(BIN)/makedistlist $(SUB_DIRS)`

dist dist_titan dist_slc dist_sg_srgb dist_sdig dist_sc:
	$(BIN)/makedistnode $@ $(SUB_DIRS)
	@echo $(ADD_DIST)


clean-tgz:
	rm $(MODULE)*.tgz


DEVELOPER=$(shell if [ -e Makefile.MV ]; then echo "y"; fi)
ifeq ($(DEVELOPER),y)
	include Makefile.MV
endif 

