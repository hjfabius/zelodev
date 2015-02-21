#include "eeprom.h"

/*****************************************************************************/
// Private declaration
/*****************************************************************************/
void eepromSelection(BYTE a_byEeprom);

/*****************************************************************************/
void eepromInit(void)
{
	
	eepromSelection(EEPROM_ADR_00); //Select first eeprom
	SPI_MoveByte(EEPROM_WRSR);		//access the EEPROM register
	SPI_MoveByte((BYTE)0xF0);  		//clear all flags in the EEPROM registers

	eepromSelection(EEPROM_ADR_01); //Select second eeprom
	SPI_MoveByte(EEPROM_WRSR);		//access the EEPROM register
	SPI_MoveByte((BYTE)0xF0);  		//clear all flags in the EEPROM registers

	eepromSelection(EEPROM_ADR_02); //Select third eeprom
	SPI_MoveByte(EEPROM_WRSR);		//access the EEPROM register
	SPI_MoveByte((BYTE)0xF0);  		//clear all flags in the EEPROM registers

	eepromSelection(EEPROM_ADR_03); //Select fourth eeprom
	SPI_MoveByte(EEPROM_WRSR);		//access the EEPROM register
	SPI_MoveByte((BYTE)0xF0);  		//clear all flags in the EEPROM registers

	eepromSelection(EEPROM_ADR_04); //Select fiveth eeprom
	SPI_MoveByte(EEPROM_WRSR);		//access the EEPROM register
	SPI_MoveByte((BYTE)0xF0);  		//clear all flags in the EEPROM registers

	eepromSelection(EEPROM_ADR_05); //Select sixth eeprom
	SPI_MoveByte(EEPROM_WRSR);		//access the EEPROM register
	SPI_MoveByte((BYTE)0xF0);  		//clear all flags in the EEPROM registers

	eepromSelection(EEPROM_ADR_06); //Select seventh eeprom
	SPI_MoveByte(EEPROM_WRSR);		//access the EEPROM register
	SPI_MoveByte((BYTE)0xF0);  		//clear all flags in the EEPROM registers

	eepromSelection(EEPROM_ADR_07); //Select eightth eeprom
	SPI_MoveByte(EEPROM_WRSR);		//access the EEPROM register
	SPI_MoveByte((BYTE)0xF0);  		//clear all flags in the EEPROM registers

	//deselect eeprom
	eepromSelection(EEPROM_ADR_NONE);
}

/*****************************************************************************/
void eepromSelection(BYTE a_byEeprom)
{
	//deselect every eeprom
	
	//select only the choosen one
	switch (a_byEeprom)
	{
		case EEPROM_ADR_00:
			_bres(_Pa_Select_UA, _Pin_Select_UA);
			_bres(_Pa_Select_UB, _Pin_Select_UB);
			_bres(_Pa_Select_UC, _Pin_Select_UC);
			break;
		case EEPROM_ADR_01:
			_bset(_Pa_Select_UA, _Pin_Select_UA);
			_bres(_Pa_Select_UB, _Pin_Select_UB);
			_bres(_Pa_Select_UC, _Pin_Select_UC);
			break;
		case EEPROM_ADR_02:
			_bres(_Pa_Select_UA, _Pin_Select_UA);
			_bset(_Pa_Select_UB, _Pin_Select_UB);
			_bres(_Pa_Select_UC, _Pin_Select_UC);
			break;
		case EEPROM_ADR_03:
			_bset(_Pa_Select_UA, _Pin_Select_UA);
			_bset(_Pa_Select_UB, _Pin_Select_UB);
			_bres(_Pa_Select_UC, _Pin_Select_UC);
			break;
		case EEPROM_ADR_04:
			_bres(_Pa_Select_UA, _Pin_Select_UA);
			_bres(_Pa_Select_UB, _Pin_Select_UB);
			_bset(_Pa_Select_UC, _Pin_Select_UC);
			break;
		case EEPROM_ADR_05:
			_bset(_Pa_Select_UA, _Pin_Select_UA);
			_bres(_Pa_Select_UB, _Pin_Select_UB);
			_bset(_Pa_Select_UC, _Pin_Select_UC);
			break;
		case EEPROM_ADR_06:
			_bres(_Pa_Select_UA, _Pin_Select_UA);
			_bset(_Pa_Select_UB, _Pin_Select_UB);
			_bset(_Pa_Select_UC, _Pin_Select_UC);
			break;
		case EEPROM_ADR_07:
			_bset(_Pa_Select_UA, _Pin_Select_UA);
			_bset(_Pa_Select_UB, _Pin_Select_UB);
			_bset(_Pa_Select_UC, _Pin_Select_UC);
			break;
		case EEPROM_ADR_NONE:
			_bres(_Pa_Select_UA, _Pin_Select_UA);
			_bres(_Pa_Select_UB, _Pin_Select_UB);
			_bres(_Pa_Select_UC, _Pin_Select_UC);		
			_bres(_Pa_Select_U1, _Pin_Select_U1);
			return;
			break;
	}
	
	_bset(_Pa_Select_U1, _Pin_Select_U1);
	
}

/*****************************************************************************/
void eepromReset(void)
{
	BYTE byEeprom;
	BYTE byReadValue;
	WORD woAddress = 0x0000;
	
	for(byEeprom = EEPROM_ADR_00; byEeprom<=EEPROM_ADR_07; byEeprom++)
	{
		_switch(_Pa_Led_D1, _Pin_Led_D1);

		//access the register of EEPROM
		eepromSelection(byEeprom);
		SPI_MoveByte(EEPROM_WREN);                
		eepromSelection(EEPROM_ADR_NONE);
		

		//write in the data memory of EEPROM
		eepromSelection(byEeprom);
		SPI_MoveByte(EEPROM_WRITE);           
		
		//load the starting write address of EEPROM
		SPI_MoveByte(0x00);     
		SPI_MoveByte(0x00);  

		woAddress = 32768;
		while (woAddress-- != 0x00)
		{
			//write data on EEPROM
			SPI_MoveByte((BYTE)0xFF);      
			/*
			//loop until write is completed in EEPROM
			do
			{
				// Read the status register of EEPROM
				eepromSelection(byEeprom);
				SPI_MoveByte(EEPROM_RDSR);      
				byReadValue = SPI_MoveByte(SPI_DUMMY);
				eepromSelection(EEPROM_ADR_NONE);
			} while ((byReadValue & EEPROM_WIP) > 0);  
			*/
		}
		eepromSelection(EEPROM_ADR_NONE);
	}
	
	_bres(_Pa_Led_D1, _Pin_Led_D1);
}

/*****************************************************************************/
void writeEepromString(BYTE a_byEeprom, WORD a_intAddr, BYTE * a_strBuffer)
{
    BYTE i 				= 0x00; 
	BYTE byReadValue 	= 0x00;	
	
	//Loop until 0xFF char is written to eeprom
	do
	{
		//access the register of EEPROM
		eepromSelection(a_byEeprom);
		SPI_MoveByte(EEPROM_WREN);                
		eepromSelection(EEPROM_ADR_NONE);
		


		//write in the data memory of EEPROM
		eepromSelection(a_byEeprom);
		SPI_MoveByte(EEPROM_WRITE);           
		
		//load the starting write address of EEPROM
        SPI_MoveByte(HIBYTE(a_intAddr));     
		SPI_MoveByte(LOBYTE(a_intAddr));  
		a_intAddr++;

		//write data on EEPROM
		SPI_MoveByte((BYTE)a_strBuffer[i]);      
		
		eepromSelection(EEPROM_ADR_NONE);
	  
		//loop until write is completed in EEPROM
		do
		{
			// Read the status register of EEPROM
			eepromSelection(a_byEeprom);
			SPI_MoveByte(EEPROM_RDSR);      
			byReadValue = SPI_MoveByte(SPI_DUMMY);
			eepromSelection(EEPROM_ADR_NONE);
		} while ((byReadValue & EEPROM_WIP) > 0);  

	}while (a_strBuffer[i++] != 0x00);
	
}


/*****************************************************************************/
void writeEeprom(BYTE a_byEeprom, WORD a_intAddr, WORD a_intLength, BYTE * a_strBuffer)
{
    BYTE i 				= 0x00; 
	BYTE byReadValue 	= 0x00;	
	
	//Loop until 0xFF char is written to eeprom
	do
	{
		//access the register of EEPROM
		eepromSelection(a_byEeprom);
		SPI_MoveByte(EEPROM_WREN);                
		eepromSelection(EEPROM_ADR_NONE);
		


		//write in the data memory of EEPROM
		eepromSelection(a_byEeprom);
		SPI_MoveByte(EEPROM_WRITE);           
		
		//load the starting write address of EEPROM
        SPI_MoveByte(HIBYTE(a_intAddr));     
		SPI_MoveByte(LOBYTE(a_intAddr));  
		a_intAddr++;

		//write data on EEPROM
		SPI_MoveByte((BYTE)a_strBuffer[i]);      
		
		eepromSelection(EEPROM_ADR_NONE);
	  
		//loop until write is completed in EEPROM
		do
		{
			// Read the status register of EEPROM
			eepromSelection(a_byEeprom);
			SPI_MoveByte(EEPROM_RDSR);      
			byReadValue = SPI_MoveByte(SPI_DUMMY);
			eepromSelection(EEPROM_ADR_NONE);
		} while ((byReadValue & EEPROM_WIP) > 0);  

		i++;
	}while (i<a_intLength);
	
}

/*****************************************************************************/
BYTE * readEepromString(BYTE a_byEeprom, WORD a_intAddr, BYTE * a_strBuffer)
{
    BYTE ucIndex		= 0x00; 
	
	while(ucIndex==0){};
	
	eepromSelection(a_byEeprom);

	//Set the EEPROM for read operation
	SPI_MoveByte(EEPROM_READ);    

	//load the starting read address
	SPI_MoveByte(HIBYTE(a_intAddr));     
	SPI_MoveByte(LOBYTE(a_intAddr));     

	//loop until 0xFF char is read from eeeprom
	do
	{
		a_strBuffer[ucIndex] = SPI_MoveByte(SPI_DUMMY);
	} while((a_strBuffer[ucIndex++] != 0x00) && (ucIndex<SPI_MAX_LENGTH));
		
	a_strBuffer[SPI_MAX_LENGTH-1] = EEPROM_EOF;
	eepromSelection(EEPROM_ADR_NONE);

	return a_strBuffer + ucIndex;
}

/*****************************************************************************/
void readEeprom(BYTE a_byEeprom, WORD a_intAddr, WORD a_intLength, BYTE * a_strBuffer)
{
    WORD woIndex		= 0x00; 
	
	eepromSelection(a_byEeprom);

	//Set the EEPROM for read operation
	SPI_MoveByte(EEPROM_READ);    

	//load the starting read address
	SPI_MoveByte(HIBYTE(a_intAddr));     
	SPI_MoveByte(LOBYTE(a_intAddr));     

	//loop until 0xFF char is read from eeeprom
	do
	{
		a_strBuffer[woIndex] = SPI_MoveByte(SPI_DUMMY);
		woIndex++;
	} while(woIndex<a_intLength);
		
	eepromSelection(EEPROM_ADR_NONE);
}

/*****************************************************************************/
BYTE * readEepromMessage(BYTE a_byEeprom, BYTE a_byMessageID, BYTE a_byLanguageID, BYTE * a_strBuffer)
{
	WORD woAddress = 0x0000;

	if (a_byMessageID<EEPROM_MIN_INDEX_NORMAL)
	{
		woAddress	= EEPROM_INITIAL_OFFSET + (a_byLanguageID*EEPROM_LANGUAGE_LENGTH) + ((WORD)a_byMessageID * (WORD)EEPROM_MSG_LENGTH_SHORT);
	}
	else
	{	
		woAddress	= (EEPROM_MSG_LENGTH_SHORT*EEPROM_MIN_INDEX_NORMAL) + EEPROM_INITIAL_OFFSET + (a_byLanguageID*EEPROM_LANGUAGE_LENGTH) + ((WORD)(a_byMessageID-EEPROM_MIN_INDEX_NORMAL) * (WORD)EEPROM_MSG_LENGTH_NORMAL);
	}
	return readEepromString(a_byEeprom, woAddress, a_strBuffer)-1;
}