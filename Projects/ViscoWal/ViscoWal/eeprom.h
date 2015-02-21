#ifndef EEPROM_H
	#define EEPROM_H

	#include "common.h"
	
	
	#define EEPROM_WREN  				0x06	//Write Enable 				0000 0110
	#define EEPROM_WRDI 				0x04	//Write Disable 			0000 0100
	#define EEPROM_RDSR 				0x05	//Read Status Register 		0000 0101
	#define EEPROM_WRSR 				0x01	//Write Status Register 	0000 0001
	#define EEPROM_READ 				0x03	//Read from Memory Array 	0000 A011	A=1 Upper Page Select  - A=0 Lower Page Selected
	#define EEPROM_WRITE 				0x02	//Write to Memory Array 	0000 A010	A=1 Upper Page Select  - A=0 Lower Page Selected
	
	//Eeprom Status Register Format
	#define EEPROM_SRWD					0x80	//Status Register Write Protect
	#define EEPROM_BP1					0x08	//Block Protect Bits
	#define EEPROM_BP0					0x04	//Block Protect Bits
	#define EEPROM_WEL					0x02	//Write Enable Latch Bit
	#define EEPROM_WIP					0x01	//Write In Progress Bit
	
	#define EEPROM_EOF					0xFF	//End of string
	
	#define  EEPROM_INITIAL_OFFSET		0
	#define  EEPROM_LANGUAGE_LENGTH		2048
	#define  EEPROM_MSG_LENGTH_SHORT	16
	#define  EEPROM_MSG_LENGTH_NORMAL	32
	#define  EEPROM_MSG_LENGTH_LONG		64
	#define  EEPROM_MIN_INDEX_NORMAL	68
	
	
	#define  EEPROM_ADR_RW				0x00
	#define  EEPROM_ADR_RO				0x01
	
	#define  EEPROM_ADR_00				0x00
	#define  EEPROM_ADR_01				0x01
	#define  EEPROM_ADR_02				0x02
	#define  EEPROM_ADR_03				0x03
	#define  EEPROM_ADR_04				0x04
	#define  EEPROM_ADR_05				0x05
	#define  EEPROM_ADR_06				0x06
	#define  EEPROM_ADR_07				0x07
	#define  EEPROM_ADR_NONE			0xFF
	
	//Block Protection - Status Register Bits 
	//BP0	BP1	Protected Block		Array Addresses Protected
	//0 	0 	none 
	//0 	1 	Upper quarter 		0600h 
	//1 	0 	Upper half 			0400h
	//1 	1 	Whole memory 		0000h
	
	//access the EEPROM register
	//and clear all flags
	void eepromInit(void);
	void eepromReset(void);
	void writeEepromString(BYTE a_byEeprom, WORD a_intAddr, BYTE * a_strBuffer);
	BYTE * readEepromString(BYTE a_byEeprom, WORD a_intAddr, BYTE * a_strBuffer);

	void writeEeprom(BYTE a_byEeprom, WORD a_intAddr, WORD a_intLength, BYTE * a_strBuffer);
	void readEeprom(BYTE a_byEeprom, WORD a_intAddr, WORD a_intLength, BYTE * a_strBuffer);
	
	BYTE * readEepromMessage(BYTE a_byEeprom, BYTE a_byMessageID, BYTE a_byLanguageID, BYTE * a_strBuffer);
	
#endif