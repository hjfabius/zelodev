#! /bin/make

# $Id: Makefile,v 1.14.2.7 2002/11/25 13:33:19 hg Exp $


SRC=main.cpp hjLuma.cpp grabif.cpp stopwatch.cpp hjTrace.cpp hjKeyboard.cpp hjGUI.cpp hjFont.cpp ../../camera/camtype.c ../../camera/camdefs.c hjBlob.cpp ini.cpp 
OBJ=main.o hjLuma.o grabif.o stopwatch.o hjTrace.o hjKeyboard.o hjGUI.o hjFont.o ../../camera/camtype.o ../../camera/camdefs.o hjBlob.o ini.o
CCINC=-I../include/ -I../common/ -I../ -I../../ 
BIN=../../bin

#if you get unresolved errors for __gxx_personality_v0 you might need a newer libstdc++
# so put its path here
CPPLIB=-L/usr/lib -lstdc++

## standard library options
LDOPTVGA=$(CPPLIB) -L../lib -lvga -lmvvga -lmvos -g
LDOPTVGA_STATIC=$(CPPLIB) -L../lib -lvga -lmvvga -lmvos -g 
LDOPTX11=$(CPPLIB) -L../lib -L/usr/X11R6/lib -lXt -lXext -lmvx11 -lmvos -g
LDOPTX11_STATIC=$(CPPLIB) -L../lib -L/usr/X11R6/lib -lXt -lXext -lmvx11 -lmvos -g

## standard compiler options
CCOPT=	-Wall				\
		-Werror				\
		-Wno-long-long		\
		-g					\
		-D_REENTRANT        \
		-D_THREAD_SAFE		\
#		-mpreferred-stack-boundary=16 \
#		-save-temps     	\
##		-DDEBUG				\

MODULE=hjMV
 
TGZ=$(MODULE).tgz

SOURCES=				\
	camtype.c			\
	hjTrace.cpp			\
	hjKeyboard.cpp		\
	hjGUI.cpp			\
	hjFont.cpp			\
	grabif.cpp			\
	hjLuma.cpp			\
	main.cpp			\
	stopwatch.cpp		\
	hjBlob.cpp			\
	ini.cpp				

HEADERS=				\
	camtype.h			\
	hjTrace.h			\
	hjKeyboard.h		\
	hjGUI.h				\
	hjFont.h			\
	hjStruct.h			\
	hjLuma.h			\
	grabif.h			\
	stopwatch.h			\
	hjBlob.h			\
#	sniptype.h			\
	ini.h				\
	hjColors.h
	

ADD_DIST=               \
    README				\
	Makefile            \
	camdefs.ini			\
	slctest.ini			\
	srgbtest.ini		\
	sdigtest.ini		\
	hjTitan.ini		\
	titantest.ini.C1024		\
	titantest.ini.C16		\
	titantest.ini.CL		\
	titantest.ini.G1		\
	srgb1.bin			\
	srgb2.bin			\

ALL_DIST=               \
	$(SOURCES)          \
	$(HEADERS)          \
	$(ADD_DIST)

#-------------------------------------------------------------------------------

all:			\
		sg		\
		sc		\
		titan 	\
		slc		\
		srgb	\
		sdig


#-------------------------------------------------------------------------------
sdigLIB=../lib/libsdig.so

DO_SDIG=$(shell if [ -e $(sdigLIB) ]; then echo "y"; fi)
ifeq ($(DO_SDIG),y)
sdig:	sdigtest xsdigtest

sdigtest: $(OBJ) $(sdigLIB) ../lib/libmvos.so
	$(CC) -o sdigtest $(OBJ) -lsdig -lpthread $(LDOPTVGA)

sdigtest-static: $(OBJ) $(sdigLIB) ../lib/libmvos.so
	$(CC) -o sdigtest $(OBJ) -lsdig -lpthread $(LDOPTVGA_STATIC)

xsdigtest: $(OBJ) $(sdigLIB) ../lib/libmvos.so
	$(CC) -o xsdigtest $(OBJ) -lsdig -lpthread $(LDOPTX11) -lm

xsdigtest-static: $(OBJ) $(sdigLIB) ../lib/libmvos.so
	$(CC) -o xsdigtest $(OBJ) -lsdig -lpthread $(LDOPTX11_STATIC) -lm
else
sdig:
	@echo "NOT making test program for $@ - library not supplied"
endif
	

#-------------------------------------------------------------------------------
scLIB=../lib/libsc.so

DO_SC=$(shell if [ -e $(scLIB) ]; then echo "y"; fi)
ifeq ($(DO_SC),y)
sc:		sctest xsctest

sctest: $(OBJ) $(scLIB) ../lib/libmvos.so
	$(CC) -o sctest $(OBJ) -lsc $(LDOPTVGA)

xsctest: $(OBJ) $(scLIB) ../lib/libmvos.so
	$(CC) -o xsctest $(OBJ) -lsc $(LDOPTX11)
else
sc:
	@echo "NOT making test program for $@ - library not supplied"
endif

	
#-------------------------------------------------------------------------------
sgLIB=../lib/libsg.so

DO_SG=$(shell if [ -e $(sgLIB) ]; then echo "y"; fi)
ifeq ($(DO_SG),y)
sg:		sgtest xsgtest

sgtest: $(OBJ) $(sgLIB) ../lib/libmvos.so
	$(CC) -o sgtest $(OBJ) -lsg $(LDOPTVGA)

xsgtest: $(OBJ) $(sgLIB) ../lib/libmvos.so
	$(CC) -o xsgtest /lib/libm.so $(OBJ) -lsg $(LDOPTX11)
else
sg:
	@echo "NOT making test program for $@ - library not supplied"
endif

	
#-------------------------------------------------------------------------------
srgbLIB=../lib/libsrgb.so

DO_SRGB=$(shell if [ -e $(srgbLIB) ]; then echo "y"; fi)
ifeq ($(DO_SRGB),y)
srgb:	srgbtest xsrgbtest

srgbtest: $(OBJ) $(srgbLIB) ../lib/libmvos.so
	$(CC) -o srgbtest $(OBJ) -lsrgb $(LDOPTVGA)

xsrgbtest: $(OBJ) $(srgbLIB) ../lib/libmvos.so
	$(CC) -o xsrgbtest $(OBJ) -lsrgb $(LDOPTX11) -lm
else
srgb:
	@echo "NOT making test program for $@ - library not supplied"
endif

	
	
#-------------------------------------------------------------------------------
slcLIB=../lib/libslc.so

DO_SLC=$(shell if [ -e $(slcLIB) ]; then echo "y"; fi)
ifeq ($(DO_SLC),y)
slc:	slctest xslctest

slctest: $(OBJ) $(slcLIB) ../lib/libmvos.so
	$(CC) -o slctest $(OBJ) -lslc $(LDOPTVGA)

xslctest: $(OBJ) $(slcLIB) ../lib/libmvos.so
	$(CC) -o xslctest -lm $(OBJ) -lslc $(LDOPTX11)
else
slc:
	@echo "NOT making test program for $@ - library not supplied"
endif



#-------------------------------------------------------------------------------
titanLIB=../lib/libtitan.so
titanLIBstatic=../lib/libtitan.a

DO_TITAN=$(shell if [ -e $(titanLIB) ] & [ -e $(titanLIBstatic) ]; then echo "y"; fi)
ifeq ($(DO_TITAN),y)
TM_LDOPTVGA=$(CPPLIB) -L../lib -lvga -lmvvgattn -g
TM_LDOPTVGA_STATIC=$(CPPLIB) -L../lib -lvga -lmvvgattn -g
TM_LDOPTX11=$(CPPLIB) -L../lib -lmvx11ttn -L/usr/X11R6/lib -lXt -lXext -g
TM_LDOPTX11_STATIC=$(CPPLIB) -L../lib -lmvx11ttn -L/usr/X11R6/lib  -lXt -lXext -g

titan:	hjMV xhjMV

hjMV: $(OBJ) $(titanLIB)
	$(CC) -o hjMV $(OBJ) -ltitan -lpthread $(TM_LDOPTVGA)

hjMV-static: $(OBJ)  ../lib/libtitan.a
	$(CC) -o hjMV $(OBJ) -ltitan -lpthread $(TM_LDOPTVGA_STATIC)

xhjMV: $(OBJ) $(titanLIB)
	$(CC) -o xhjMV $(OBJ) -ltitan -lpthread $(TM_LDOPTX11)

xhjMV-static: $(OBJ)  ../lib/libtitan.a
	$(CC) -o xhjMV $(OBJ) -ltitan -lpthread $(TM_LDOPTX11_STATIC)
else
titan:
	@echo "NOT making test program for $@ - library not supplied"
endif
	

#-------------------------------------------------------------------------------
clean:
	rm -f $(OBJ) [a-z]*test

tgz:    $(TGZ)
 
$(TGZ): $(ALL_DIST)
	$(BIN)/packdist $(MODULE) $(ALL_DIST)
 
clean-tgz:
	rm $(MODULE)*.tgz

dist dist_titan dist_slc dist_sg_srgb dist_sdig dist_sc:
	@echo $(ALL_DIST)

## standard rules
.c.o:
	$(CC) -c $(CCOPT) $(CCINC) -o $@ $<

.cpp.o:
	$(CC) -c $(CCOPT) $(CCINC) -o $@ $<

