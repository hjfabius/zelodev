#! /bin/make

BIN=../../../bin

MODULE=linux
SUB_DIRS=allocator kmod matrixfg titan sigma vga x11 nodisp
TGZ=$(MODULE).tgz
ADD_DIST=   \
	Makefile

.PHONY:	titan

all install load unload clean:
	$(BIN)/makeloop $@ allocator matrixfg titan sigma

load_matrixfg:
	make -C allocator install
	make -C matrixfg load

unload_matrixfg:
	make -C matrixfg unload

load_titan:
	make -C allocator install
	make -C titan load

unload_titan:
	make -C titan unload

load_sigma:
	make -C allocator install
	make -C sigma load

unload_sigma:
	make -C sigma unload

slc:
	$(BIN)/makeloop "" allocator matrixfg sigma

sc sg srgb sdig:
	$(BIN)/makeloop "" allocator matrixfg

titan:
	$(BIN)/makeloop "" allocator titan

tgz:    $(TGZ)
 
$(TGZ):
	$(BIN)/packdist $(MODULE) $(ADD_DIST) `$(BIN)/makedistlist $(SUB_DIRS)`

matrixfg_tgz:
	$(BIN)/packdist matrixfg $(ADD_DIST) `$(BIN)/makedistlist allocator kmod matrixfg` 

titan_tgz:
	$(BIN)/packdist titan $(ADD_DIST) `$(BIN)/makedistlist allocator kmod titan` 

sigma_tgz:
	$(BIN)/packdist sigma $(ADD_DIST) `$(BIN)/makedistlist allocator kmod sigma` 

kmod_tgz:
	$(BIN)/packdist kmod $(ADD_DIST) `$(BIN)/makedistlist allocator kmod matrixfg titan` 

dist:
	$(BIN)/makedistlist allocator kmod matrixfg titan sigma
	@echo $(ADD_DIST)

dist_titan:
	$(BIN)/makedistlist allocator kmod titan
	@echo $(ADD_DIST)

dist_sg_srgb dist_sdig dist_sc:
	$(BIN)/makedistlist allocator kmod matrixfg
	@echo $(ADD_DIST)

dist_slc:
	$(BIN)/makedistlist allocator kmod matrixfg sigma
	@echo $(ADD_DIST)

clean-tgz:
	rm $(MODULE)*.tgz


DEVELOPER=$(shell if [ -e Makefile.MV ]; then echo "y"; fi)
ifeq ($(DEVELOPER),y)
	include Makefile.MV
endif 
