BIN=../bin
MODULE=camera
 
TGZ=$(MODULE).tgz
 
ADD_DIST=               \
	CAMDEFS.INI			\
	Makefile			\
	camdefs.c			\
	camtype.c			\
	camtype.h

SOURCES=				\

HEADERS=				\

ALL_DIST=               \
	$(SOURCES)          \
	$(HEADERS)          \
	$(ADD_DIST)

all:

tgz:    $(TGZ)
 
$(TGZ): $(ALL_DIST)
	$(BIN)/packdist $(MODULE) $(ALL_DIST)
 
dist dist_titan dist_slc dist_sg_srgb dist_sdig dist_sc:
	@echo $(ALL_DIST)

clean-tgz:
	rm $(MODULE)*.tgz
