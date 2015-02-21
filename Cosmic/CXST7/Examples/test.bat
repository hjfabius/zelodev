@echo off
echo Compiling ...
echo.
cxst7 -l +modm +debug crts.s vumeter.c init.c adc.c interrupt.c vector.c
if errorlevel 1 goto bad
:clink
echo.
echo Linking ...
clnk -o vumeter.st7 -m vumeter.map vumeter.lkf
if errorlevel 1 goto bad
:chexa
echo.
echo Converting in hexa file ...
chex -o vumeter.hex vumeter.st7
if errorlevel 1 goto bad
:cclabs
echo.
echo Generating absolute listing ...
clabs vumeter.st7
if errorlevel 1 goto bad
:cdwarf
echo.
echo Generating ELF/Dwarf file ...
cvdwarf vumeter.st7
if errorlevel 1 goto bad
echo.
echo.
echo	The COSMIC ST7 C Compiler installation is successfull
goto sortie
:bad
echo.
echo.
echo	THE COMPILER INSTALLATION HAS FAILED.
:sortie
echo on

