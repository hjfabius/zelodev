#include "main.h"

//************************************************************** 
// Set device configuration values 2
//************************************************************** 
	_FOSCSEL( 	FNOSC_PRI &   							// Primary oscillator (XT, HS, EC)        
                IESO_ON );     							// Two Speed Start-up enabled
        
	_FOSC(  	FCKSM_CSECME  &        					//Clock switching and clock monitor Both enabled
                OSCIOFNC_OFF &        
                //POSCMD_EC &							//Internal Clock 4Mhz
				POSCMD_HS &								//External Clock 20Mhz								
                IOL1WAY_OFF );

	_FWDT(		FWDTEN_OFF);              				// Watchdog Timer Enabled/disabled by user software

WORD m_woCurrentParameterPreviousValue;
	 
	  
//************************************************************** 
// Main Function
//**************************************************************
int main ( void )
{
	BYTE byNextParameter;

	Init();

	if(PIN_SYNC_EXT_ENABLE==0)
	{
		DisplayExternalTrigger();
		DisableFlashInternalTrigger();
		//Enable interrupt for external sync
		IEC1bits.CNIE = 1;		
		while(FOREVER)
		{
		}
	}
	else
	{
		while(FOREVER)
		{
			UpdateCurrentValue(m_woCurrentPOS1CNT);
			if(IsEncoderKeyPressed())
			{
				if(m_byCurrentParameter >= PARAMETER_NUMBER-1)
				{
					byNextParameter = PARAMETER_NUMBER_SHORT;
				}
				else if(m_byCurrentParameter == PARAMETER_NUMBER_SHORT-1)
				{
					byNextParameter = 0;
				}
				else
				{
					byNextParameter =  m_byCurrentParameter+1;
				}
				

				SetCurrentParameterToEncoder(byNextParameter);
				DisplayCurrentValue();
			}		
		}
	}
	
}

//---------------------------------------------------------------------
//  Function Name: Init
//---------------------------------------------------------------------
void Init()
{
	// Initialize ports 
	AD1PCFGL = 0xFFFF;				// set all pin as digital
	LATA  = 0x0000; 				// set latch levels
	TRISA = 0b0000000000000001; 	// set IO RA0 as input, others as output
	LATB  = 0x0000; 				// set latch levels
	TRISB = 0b0110000011100000; 	// set IO RB5, RB6, RB7, RB13, RB14 as input, others as output
									// RB7, RB14 and RB13 (Encoder) are configured as pull-up (in InitEncoder)
									// RB5, RB6 configured in pull-up to catch external sync
									
	//CNPU1bits.CN2PUE = 1;			// Enable pull-up on input change CN2  pin (RA0)

	CNPU2bits.CN27PUE = 1;			// Enable pull-up on input change CN27 pin (RB5)
	CNPU2bits.CN24PUE = 1;			// Enable pull-up on input change CN24 pin (RB6)
	CNEN2bits.CN24IE = 1;			// Enable CN27 for interrupt detaction

	
	// Configuro displey LCD
	OpenLCD(QUARTZ_MHZ);
	ClearLCD();
 	//BacklightLCD (TURN_ON);
	
	parametersInit();
	if(PIN_BATTERY==0)
	{
		DisplayBattery();
	}
	
	
	InitEncoder();
	InitFlash();
	
	calculateValues(CALC_FREQUENCY);

	if(PIN_ENC_BUTTON==0)
	{
		SetCurrentParameterToEncoder(PARAMETER_NUMBER_SHORT);
	}
	else
	{
		SetCurrentParameterToEncoder(PARAM_FREQUENCY);
	}


	DisplaySplashScreen();


	
	DisplayCurrentValue();
	
}


//--------------------------------------------------------------------------------------
// Display Product Name and Version
//--------------------------------------------------------------------------------------
void DisplaySplashScreen()
{
	BYTE i;

	HomeLCD();
	WriteStringLCD(APPLICATION_SUPPLIER );

 	Line2LCD (); 	
	WriteStringLCD(APPLICATION_PRODUCT_VERSION);
	__delay_ms(1500);

	for(i=0; i<15; i++)
	{
		ShiftLCD(LEFT, 1);
		__delay_ms(200);
	}


}


//--------------------------------------------------------------------------------------
// Display External Trigger
//--------------------------------------------------------------------------------------
void DisplayExternalTrigger()
{
	BYTE i;

	HomeLCD();
	WriteStringLCD(parametersGetLabel(PARAM_EXTERNAL_TRIGGER_01));
	
 	Line2LCD (); 	
	WriteStringLCD(parametersGetLabel(PARAM_EXTERNAL_TRIGGER_02));
	__delay_ms(1500);


}


//--------------------------------------------------------------------------------------
// Display Battery
//--------------------------------------------------------------------------------------
void DisplayBattery()
{
	BYTE i;

	HomeLCD();
	WriteStringLCD(parametersGetLabel(PARAM_BATTERY_LOW_01));

 	Line2LCD (); 	
	WriteStringLCD(parametersGetLabel(PARAM_BATTERY_LOW_02));
	
	
	for(i=0; i<30; i++)
	{
		__delay_ms(200);
	}



}


//--------------------------------------------------------------------------------------
// Display Current Value on LCD
//--------------------------------------------------------------------------------------
void DisplayCurrentValue()
{
	BYTE byLanguage;

	byLanguage = parametersGetValue(PARAM_LANGUAGE);
	switch(m_byCurrentParameter)
	{
		case PARAM_FREQUENCY:
			HomeLCD();
	 		WriteStringLCD(parametersGetLabel(PARAM_FREQUENCY));
		 	Line2LCD (); 	
		 	WriteIntLCD(parametersGetValue(PARAM_FREQUENCY), 5);	
	 		WriteStringLCD("mHz");
			break;
		case PARAM_SPEED:
			HomeLCD();
	 		WriteStringLCD(parametersGetLabel(PARAM_SPEED));
		 	Line2LCD (); 	
		 	WriteIntLCD(parametersGetValue(PARAM_SPEED), 4);	
	 		WriteStringLCD("mt/m");
			break;
		case PARAM_CYLINDER:
			HomeLCD();
	 		WriteStringLCD(parametersGetLabel(PARAM_CYLINDER) );
		 	Line2LCD (); 	
		 	WriteIntLCD(parametersGetValue(PARAM_CYLINDER), 4);	
	 		WriteStringLCD(" mm ");
			break;
		case PARAM_MULT_FACTOR:
			HomeLCD();
	 		WriteStringLCD(parametersGetLabel(PARAM_MULT_FACTOR)  );
		 	Line2LCD (); 	
	 		WriteStringLCD("x");
	 		WriteIntLCD(parametersGetValue(PARAM_MULT_FACTOR), 2);
			WriteStringLCD("     ");
			break;
		case PARAM_LANGUAGE:
			HomeLCD();
	 		WriteStringLCD(parametersGetLabel(PARAM_LANGUAGE) );
		 	Line2LCD (); 	
	 		WriteStringLCD(parametersGetLabel(PARAM_LANGUAGES));
			break;
		case PARAM_LIGHT:
			HomeLCD();
	 		WriteStringLCD(parametersGetLabel(PARAM_LIGHT));
		 	Line2LCD (); 	
		 	WriteIntLCD(parametersGetValue(PARAM_LIGHT), 5);	
			WriteStringLCD("   ");
			break;
		default:
			break;
	}
	
}


//--------------------------------------------------------------------------------------
// Calculate values based on the following mode:
// Mode 0 = Frequency = Factor * Speed / Cylinder
// Mode 1 = Speed     = Cylinder * Frequency / Factor
// Mode 2 = Cylinder  = Factor * Speed / Frequency
// Mode 3 = Factor    = Frequency * Cylinder / Speed 
void calculateValues(unsigned char a_byMode)
{
	LWORD 	lwoFrequency ;
    LWORD 	lwoSpeed     ;
    LWORD 	lwoCylinder  ;
	BYTE 	byFormats	   ;
	
	lwoFrequency  = (LWORD) parametersGetValue(PARAM_FREQUENCY);
	lwoSpeed      = (LWORD) parametersGetValue(PARAM_SPEED);
	lwoCylinder   = (LWORD) parametersGetValue(PARAM_CYLINDER);
	byFormats	  = (BYTE) (0x00FF & parametersGetValue(PARAM_MULT_FACTOR));
	
	switch(a_byMode)
	{
		case PARAM_FREQUENCY:
			parametersSet(PARAM_FREQUENCY,  ((100000.0/6.0) * lwoSpeed * byFormats ) / parametersGetValue(PARAM_CYLINDER));
			
			break;
		case PARAM_SPEED:
			parametersSet(PARAM_SPEED,  (lwoCylinder * lwoFrequency) * (6.0 / 100000.0) / byFormats);			
			break;
		default:
			break;
	}

	//Conteggio = 65536 - 1 / ( T oscillatore  * 256  * frequenza)
	//PR1 = 65536 - 1.0 / (0.00000005  * 256 * m_dblFrequency / 1000);
	//PR1 = 65536 - (unsigned int )  (1.0 / (0.0000128 * m_dblFrequency / 1000));
	//PR1 = 65536 - (unsigned int )  (1000.0 / (0.0000128/ * m_dblFrequency ));
	//PR1 = 65536 - (unsigned int )  (78125000.0 / m_dblFrequency );
	//PR1 = 65536 - (unsigned int )  (39062500.0 / m_dblFrequency ); //Solo i fronti di salita
	PR1 =  (unsigned int )     (39062500.0 / parametersGetValue(PARAM_FREQUENCY) ); //Solo i fronti di salita
	if (TMR1 >= PR1)
	{
		TMR1 = 0;
	}

}




//--------------------------------------------------------------------------------------
// Set Current Parameter To Encoder
//--------------------------------------------------------------------------------------
void SetCurrentParameterToEncoder(BYTE a_byNewParameter)
{
	m_byCurrentParameter 				= a_byNewParameter;
	m_woCurrentParameterPreviousValue 	= parametersGetValue(a_byNewParameter);
	m_woPreviousPOS1CNT 				= m_woCurrentParameterPreviousValue;
	POS1CNT 							= m_woCurrentParameterPreviousValue;
}



//--------------------------------------------------------------------------------------
// set current value
//--------------------------------------------------------------------------------------
void UpdateCurrentValue(WORD a_woNewValue)
{
	WORD woNewValue;
	//If no change, do nothing
	if(m_woCurrentParameterPreviousValue == a_woNewValue)
	{
		return;
	}	

	woNewValue = a_woNewValue;
	m_woCurrentParameterPreviousValue = a_woNewValue;
	
	switch(m_byCurrentParameter)
	{
		case PARAM_FREQUENCY:
			if (a_woNewValue>60000) 		a_woNewValue = 0; 
			parametersSet(m_byCurrentParameter, a_woNewValue);
			calculateValues(PARAM_SPEED);
			break;
		case PARAM_SPEED:
			if (a_woNewValue>60000) 		a_woNewValue = 0;
			parametersSet(m_byCurrentParameter, a_woNewValue);
			calculateValues(PARAM_FREQUENCY);
			break;
		case PARAM_CYLINDER:
			if (a_woNewValue>60000) 		a_woNewValue = 0;
			parametersSet(m_byCurrentParameter, a_woNewValue);
			calculateValues(PARAM_FREQUENCY);
			break;
		case PARAM_MULT_FACTOR:
			if 		(a_woNewValue>60000) 	a_woNewValue = 5;
			else if (a_woNewValue == 0) 	a_woNewValue = 5;
			else if (a_woNewValue>5) 	 	a_woNewValue = 1;
			parametersSet(m_byCurrentParameter, a_woNewValue);
			calculateValues(CALC_FREQUENCY);
			break;
		case PARAM_LANGUAGE:
			if 		(a_woNewValue>60000) 	a_woNewValue = 4;
			else if (a_woNewValue>4) 	 	a_woNewValue = 0;
			parametersSet(m_byCurrentParameter, a_woNewValue);
			break;
		case PARAM_LIGHT:
			if 		(a_woNewValue>60000) 	a_woNewValue = 4;
			else if (a_woNewValue == 0) 	a_woNewValue = 4;
			else if (a_woNewValue>4) 	 	a_woNewValue = 1;
			parametersSet(m_byCurrentParameter, a_woNewValue);
			SetFlashOscillatorDutyCycle(a_woNewValue);
			break;
		default:
			break;
	}

	//If value has been adjusted, encoder value needs to be updated
	if (woNewValue != a_woNewValue)
	{
		SetCurrentParameterToEncoder(m_byCurrentParameter);
	}
	
	//Refresh display
	DisplayCurrentValue();	
}
