#/****************************************************************/
#/*                                                              */
#/*           ST7 inDART Example with COSMIC Toolchain           */
#/*                                                              */
#/****************************************************************/

# This makefile is used to build the ST7 application "adc.elf"
# with the Cosmic Toolchain
#
# The different targets of this makefile are
#   adc.elf (default target):		gmake -f adc.mak adc.elf 
#                             or     	gmake -f adc.mak
#   clean:				gmake -f adc.mak clean
#   rebuild:				gmake -f adc.mak rebuild
#

# By modifying the variables hereafter up to the line *** END ***
# this makefile can be easily customized to meet the needs of 
# other applications
#            
#**********************************************************************
PATHC  = C:\Program Files\Cosmic\Eval ST7
#PATHC  = C:\COSMIC\CXST7_4K


APPLI = adc
LK_CMD_FILE = $(APPLI).lkf

# List of source files
C_SRC_LIST =  main.c vector.c communication.c
ASM_SRC_LIST = 

CC = "$(PATHC)\cxst7.exe" 
AS = "$(PATHC)\cast7.exe"
LK = "$(PATHC)\clnk.exe"
CV = "$(PATHC)\cvdwarf.exe"
INCDIR  = "$(PATHC)\hst7"
LIBDIR  = "$(PATHC)\lib"   

CFLAGS =  +modm +debug -no -co. -l -dCOSMIC -i$(INCDIR)
AFLAGS = -xx -l -v -dCOSMIC
LFLAGS = -o $(APPLI).st7 -m $(APPLI).map -l$(LIBDIR)

#************************** END ***************************************
CP = copy
ECHO = echo
RM = del

# List of object files from list of source files
OBJ_LIST	= $(patsubst %.c,%.o,$(filter %.c,$(C_SRC_LIST))) \
		$(patsubst %.s,%.o,$(filter %.s,$(ASM_SRC_LIST)))

# Rules for building targets

$(APPLI).elf: $(APPLI).st7
	$(CV) $(APPLI).st7

$(APPLI).st7: $(OBJ_LIST) $(LK_CMD_FILE)
	$(LK) $(LFLAGS) $(LK_CMD_FILE) 	      

# Other rules for compiling C files
%.o : %.c
	$(CC) $(CFLAGS) $<

%.o : %.s
	$(AS) $(AFLAGS) $<


# Rule for forcing the build without taking into account dependencies   
rebuild:
	gmake -f $(APPLI).mak clean
	gmake -f $(APPLI).mak $(APPLI).elf

clean :
	if exist $(APPLI).elf $(RM) $(APPLI).elf
	if exist $(APPLI).st7 $(RM) $(APPLI).st7
	if exist *.o $(RM) *.o
	if exist *.ls $(RM) *.ls