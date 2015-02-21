#include "measure.h"


/*****************************************************************************/


double m_ardblViscosityPreviousPValue	[MEASURE_VISCOSITY_CALC_INDEXES];
double m_ardblViscosityPValue			[MEASURE_VISCOSITY_CALC_INDEXES];
double m_ardblViscosityIValue			[MEASURE_VISCOSITY_CALC_INDEXES];
double m_ardblViscosityDValue			[MEASURE_VISCOSITY_CALC_INDEXES];
double m_ardblViscosityVValues			[MEASURE_VISCOSITY_CALC_INDEXES][MEASURE_VISCOSITY_ARRAY_LENGTH];
double m_ardblViscosityRValues											[MEASURE_VISCOSITY_ARRAY_LENGTH];
WORD   m_arwoViscosityMValues											[MEASURE_VISCOSITY_ARRAY_LENGTH];
double m_ardblViscosityMeasured			[2];
double m_ardblViscosityCalibratedValues	[2];



/*****************************************************************************/
// Private Function Declaration
/*****************************************************************************/

/*****************************************************************************/

void measureInit(void)
{
	BYTE i = MEASURE_VISCOSITY_CALC_INDEXES;
	BYTE j = MEASURE_VISCOSITY_ARRAY_LENGTH;
	
	measureSetValveStatus(VALVES_CLOSED);
	
	while(i-->0)
	{
		m_ardblViscosityPreviousPValue	[i] = 0.0;
		m_ardblViscosityPValue			[i] = 0.0;
		m_ardblViscosityIValue			[i] = 0.0;
		m_ardblViscosityDValue			[i] = 0.0;
		m_ardblViscosityMeasured		[i] = 0.0;
		m_ardblViscosityCalibratedValues[i] = 0.0;
		while(j-->0)
		{
			m_ardblViscosityVValues			[i][j] = 0.0;
			m_ardblViscosityRValues			   [j] = 0.0;
			m_arwoViscosityMValues			   [j] = 0x0000;
		}
	}
}


/*****************************************************************************/
void measureUpdateTemperature(void)
{
	BYTE 	i 				= MEASURE_TEMPERATURE_AVG_FIELDS;
	LWORD 	lwoTemperature 	= 0x00000000;

	while(i-->0)
	{
		ADCCSR = ADON | _Ain_Temp;						// enables the A/D peripheral on Temperature                     
		while (!(ADCCSR & EOC));						// waits for the end of the conversion
		lwoTemperature += ((LWORD)(ADCDRH*16))+((LWORD)(ADCDRL/16));
	}
	
	if(lwoTemperature==0x00000000)		
	{
		parametersSet(PARAM_ALARM,PARAM_ALARM_MEASURING_TEMPERATURE);
	}
	else
	{
		parametersSet(PARAM_IN_TEMPERATURE, (WORD) (lwoTemperature / MEASURE_TEMPERATURE_AVG_FIELDS));
		parametersSet(PARAM_ALARM,PARAM_ALARM_OK);
	}
}


/*****************************************************************************/
void measureUpdateViscosity(void)
{
	LWORD 	lwoValue 	= 0x00000000;
	LWORD 	lwoTimeout	= 0x00000000;
	BYTE 	byLoop		= MEASURE_VISCOSITY_INTERNAL_LOOP_COUNT;

	//lwoTimeout = ((LWORD)0x00002061 * parametersGetValue(PARAM_TIMEOUTMEASURE));
	
	_bres(_Pa_Led_D1, _Pin_Led_D1);
	_bres(_Pa_Led_D2, _Pin_Led_D2);
	_bres(_Pa_Led_D3, _Pin_Led_D3);

	while(byLoop-->0)
	{
		switch(byLoop)
		{
			case 0:
				_bset(_Pa_Led_D1, _Pin_Led_D1);
				_bres(_Pa_Led_D2, _Pin_Led_D2);
				_bres(_Pa_Led_D3, _Pin_Led_D3);			
				break;
			case 1:
				_bres(_Pa_Led_D1, _Pin_Led_D1);
				_bset(_Pa_Led_D2, _Pin_Led_D2);
				_bres(_Pa_Led_D3, _Pin_Led_D3);			
				break;
			case 2:
				_bset(_Pa_Led_D1, _Pin_Led_D1);
				_bset(_Pa_Led_D2, _Pin_Led_D2);			
				_bres(_Pa_Led_D3, _Pin_Led_D3);			
				break;
			case 3:
				_bres(_Pa_Led_D1, _Pin_Led_D1);
				_bres(_Pa_Led_D2, _Pin_Led_D2);			
				_bset(_Pa_Led_D3, _Pin_Led_D3);			
				break;
			default:
				break;
			
		}
		
		lwoTimeout = MEASURE_VISCOSITY_MEASURATION_TIMEOUT;
		measureSetValveStatus(VALVES_CLOSED);
	
		#ifdef VISCO_SIMULATOR
			while(
					!_btst(_Pa_NamurUp, _Pin_NamurUp) && 
					(lwoTimeout>0x00000000) && 
					!displayIsKeyPressed()
				 )
			{
				lwoTimeout--;
			}
			
			while(	
					!_btst(_Pa_NamurDown, _Pin_NamurDown) && 
					(lwoTimeout>0x00000000) && 
					!displayIsKeyPressed() 
				 )
			{
				lwoTimeout--;
				lwoValue++;
			}
		#else
			while(
					_btst(_Pa_NamurUp, _Pin_NamurUp) && 
					(lwoTimeout>0x00000000) && 
					!displayIsKeyPressed()
				 )
			{
				lwoTimeout--;
			}
			
			while(	_btst(_Pa_NamurDown, _Pin_NamurDown) && 
					(lwoTimeout>0x00000000) && 
					!displayIsKeyPressed() 
				 )
			{
				lwoTimeout--;
				lwoValue++;
			}
		#endif
		measureSetValveStatus(VALVES_OPENED);
	
		if((lwoTimeout==0) || displayIsKeyPressed()) 
		{
			byLoop = 0x00;
		}
	
		if (byLoop>0)
		{
			lwoTimeout = MEASURE_VISCOSITY_INTERNAL_LOOP_TIME;
			while((lwoTimeout-->0) && !displayIsKeyPressed())
			{
				Nop();
			};
		}
	}
	
	//lwoValue = lwoValue / MEASURE_INTERNAL_LOOP
	//lwoValue = lwoValue / 2
	lwoValue /= ((MEASURE_VISCOSITY_INTERNAL_LOOP_COUNT)*2);
	
	//Save the value to history
	byLoop = MEASURE_VISCOSITY_ARRAY_LENGTH;
	while(byLoop-->1)
	{
		m_arwoViscosityMValues[byLoop] = m_arwoViscosityMValues[byLoop-1];
	}
	
	
	if (!displayIsKeyPressed())
	{
		if (lwoTimeout == 0x00000000)
		{
			parametersSet(PARAM_ALARM,PARAM_ALARM_MEASURING_VISCOSITY);
		}
		else
		{
			//FIFOL_PutByte(lwoValue);
			parametersSet(PARAM_ALARM,PARAM_ALARM_OK);
			parametersSet(PARAM_IN_VISCOSITY,(WORD) lwoValue );
		}
		
		m_arwoViscosityMValues[0] = (WORD) lwoValue;
	}
	else
	{
		//crifab 2012-05-04: If a button is pressed, I reuse the previous values, so I don't need to update m_arwoViscosityMValues
		//crifab 2012-05-04: m_arwoViscosityMValues[0] = ((WORD) lwoValue) + 20000;
	}
}

/*****************************************************************************/
WORD measureGetHistoricalViscosityValue(BYTE byIndex)
{
	return m_arwoViscosityMValues[byIndex];
}

/*****************************************************************************/
void measureSetValveStatus(tyMeasureValveStatus a_enmMeasureValveStatus)
{
	if (a_enmMeasureValveStatus == parametersGetValue(PARAM_VALVES))
	{
		return;
	}
	
	parametersSet(PARAM_VALVES, a_enmMeasureValveStatus);
	if (a_enmMeasureValveStatus ==  VALVES_MEASURING)
	{
		//Dummy value, used only to update 
		return;
	}
	
	if((a_enmMeasureValveStatus ==  VALVES_OPENED) && 
	   (parametersGetValue(PARAM_VALVES) == VALVES_MEASURING))
   {
	   return; //To avoid valves flikering
   }
	
	//Close all valves
	
	_bres(_Pa_ValveInk, 	_Pin_ValveInk);
	_bres(_Pa_ValveSolvent, _Pin_ValveSolvent);
	_bres(_Pa_ValveExit, 	_Pin_ValveExit);
	_bres(_Pa_ValvePh, 		_Pin_ValvePh);
	
	//Wait valve delay
	//sleep(parametersGetValue(PARAM_VALVES)*100);

	switch(a_enmMeasureValveStatus)
	{
		case VALVES_OPENED:		
			_bset(_Pa_ValveExit, 	_Pin_ValveExit);
			//Wait valve delay
			//sleep(parametersGetValue(PARAM_VALVES)*100);

			_bset(_Pa_ValveInk, 	_Pin_ValveInk);
			break;
			
		case VALVES_ADDSOLVENT:
			_bset(_Pa_ValveExit, 	_Pin_ValveExit);
			//Wait valve delay
			//sleep(parametersGetValue(PARAM_VALVES)*100);
			_bset(_Pa_ValveSolvent, _Pin_ValveSolvent);
			break;
			
		case VALVES_ADDPH:
			_bset(_Pa_ValvePh, 		_Pin_ValvePh);
			//Wait valve delay
			//sleep(parametersGetValue(PARAM_VALVES)*100);
			_bset(_Pa_ValveExit, 	_Pin_ValveExit);
			break;
			
		case VALVES_WASH:
			_bset(_Pa_ValveSolvent, _Pin_ValveSolvent);
			//Wait valve delay
			//sleep(parametersGetValue(PARAM_VALVES)*100);
			_bset(_Pa_ValveInk, 	_Pin_ValveInk);
			break;
	}		

}




/*****************************************************************************/
BYTE measureCalculation(void)
{
	double  dblOutValue;
	double  dblTempValue;
	double  dblOffset;
	
	double  dblParamP;
	double  dblParamI;
	double  dblParamD;
	double  dblParamAVG;
	double  dblParamARMA;
	
	WORD	woValue;
	BYTE	byResultParameterIndex;
	BYTE	i;
	BYTE 	byCalculationIndex; //0=Calculation, 1=Visual

	//Actual Temperature
	dblOutValue = (	(double) parametersGetValue(PARAM_IN_TEMPERATURE)* 
					(double) parametersGetValue(PARAM_TEMP_MULT)
				  )/10000.0 - /* Changed from + to - to allow right set-up with PR Electronics Inputs*/ 
				  ((double) parametersGetValue(PARAM_TEMP_OFFSET));// / 10.0);
	
	parametersSet(PARAM_CALC_TEMPERATURE, (WORD) dblOutValue);
	parametersSet(PARAM_OUT_TEMPERATURE, (WORD) dblOutValue);

	//If offset > 32000 then means that during simple calibration the value was negative
	if (parametersGetValue(PARAM_VISCO_OFFSET) < 32000)
	{
		dblOffset = (double) parametersGetValue(PARAM_VISCO_OFFSET);
	}
	else
	{
		dblOffset = -(double) ~parametersGetValue(PARAM_VISCO_OFFSET);
	}


	//Actual Viscosity
	// Ford 4 cup
	dblOutValue = (	(double) parametersGetValue(PARAM_IN_VISCOSITY)* 
					(double) parametersGetValue(PARAM_VISCO_MULT)
					)/10000.0 + 
					(dblOffset/10.0);

	switch(parametersGetValue(PARAM_CUP))
	{
		case PARAM_CUP_ZHAN_2: //Ford 4 cup to Zhan 2 cup conversion
			dblOutValue = 1.286386676	* dblOutValue +	8.024877408;
			break;
		default: //PARAM_CUP_FORD_4 - Ford 4
			break;
	}

	//Insert value in arrays for PID calculation
	byCalculationIndex = MEASURE_VISCOSITY_CALC_INDEXES;
	while(byCalculationIndex-->0)
	{
		if(byCalculationIndex == MEASURE_VISCOSITY_CALC_IDX_CONTROL)
		{
			dblParamP	= parametersGetValue(PARAM_VISCOSITY_P)/100.0;
			dblParamI	= parametersGetValue(PARAM_VISCOSITY_I)/100.0;
			dblParamD	= parametersGetValue(PARAM_VISCOSITY_D)/100.0;
			dblParamAVG	= parametersGetValue(PARAM_VISCOSITY_AVG);
			byResultParameterIndex = PARAM_CALC_VISCOSITY;
			dblParamARMA = parametersGetValue(PARAM_ARMA);
		}
		else /* MEASURE_VISCOSITY_CALC_IDX_VISUAL */
		{
			dblParamP	= parametersGetValue(PARAM_VISCOSITY_P_VISUAL)/100.0;
			dblParamI	= parametersGetValue(PARAM_VISCOSITY_I_VISUAL)/100.0;
			dblParamD	= parametersGetValue(PARAM_VISCOSITY_D_VISUAL)/100.0;
			dblParamAVG	= parametersGetValue(PARAM_VISCOSITY_AVG_VISUAL);
			byResultParameterIndex = PARAM_OUT_VISCOSITY;
			dblParamARMA = parametersGetValue(PARAM_ARMA)/100.0;
		}
		
		//First measure
		if (m_ardblViscosityPreviousPValue[byCalculationIndex] == 0)
		{
			m_ardblViscosityPreviousPValue[byCalculationIndex] 	= dblOutValue;
			m_ardblViscosityVValues[byCalculationIndex][0] 		= dblOutValue;
			i = (BYTE) dblParamAVG;
			while((i-->0) && (byCalculationIndex == MEASURE_VISCOSITY_CALC_IDX_CONTROL))
			{
				m_ardblViscosityRValues[i] = dblOutValue;
			}			
		}
		
		// P(T0) = (M + (AR*P(T-1) + MA*M(T-1) ) / 2 
		m_ardblViscosityPValue[byCalculationIndex] = (dblOutValue+
														(
															m_ardblViscosityPreviousPValue[byCalculationIndex]*dblParamARMA+
															m_ardblViscosityRValues[0]*(1.0-dblParamARMA)
														)
													 )/2;
		
		// I(TO) = (R(T-1) + .... + R(T-n)) / n
		m_ardblViscosityIValue[byCalculationIndex] = 0.0;
		i = (BYTE) dblParamAVG;
		while(i-->0)
		{
			m_ardblViscosityIValue[byCalculationIndex] += m_ardblViscosityRValues[i];
		}
		m_ardblViscosityIValue[byCalculationIndex] /= dblParamAVG;

		// D(T0) = V(T-1) - M)
		m_ardblViscosityDValue[byCalculationIndex] = m_ardblViscosityVValues[byCalculationIndex][0] - dblOutValue;

		
		//Shift the arrays
		i=(BYTE) dblParamAVG;
		while(i-->1)
		{
			m_ardblViscosityVValues[byCalculationIndex][i] = m_ardblViscosityVValues[byCalculationIndex][i-1];
		}		
		
		if(byCalculationIndex == MEASURE_VISCOSITY_CALC_IDX_CONTROL)
		{
			i=(BYTE) dblParamAVG;
			while(i-->1)
			{
				m_ardblViscosityRValues[i] = m_ardblViscosityRValues[i-1];
			}
			//Insert last value in measured array (R)
			m_ardblViscosityRValues[0] = dblOutValue; 
		}	

		//Insert last value in calculated array (V)
		dblTempValue  = m_ardblViscosityPValue[byCalculationIndex] * dblParamP;
		dblTempValue += m_ardblViscosityIValue[byCalculationIndex] * dblParamI;
		dblTempValue += m_ardblViscosityDValue[byCalculationIndex] * dblParamD;
		m_ardblViscosityVValues[byCalculationIndex][0] = dblTempValue;
		
		parametersSet(byResultParameterIndex, (WORD) dblTempValue);
	}

	//Approximation of the difference between measures 
	return (BYTE) MAX(1.0, 
						ABS(
								(	m_ardblViscosityVValues[MEASURE_VISCOSITY_CALC_IDX_CONTROL][1] - 
									m_ardblViscosityVValues[MEASURE_VISCOSITY_CALC_IDX_CONTROL][0]
								) /10.0
						)
					   );

}



/*****************************************************************************/
//Calibration on one point of the line (multiplication factor is kept constant
void measureViscosityCalibration(void)
{
	double dblValue;
	double dblValue2;
	BYTE i;
	
	//screenReceivedCode(1,0,parametersGetValue(PARAM_IN_VISCOSITY));
	//sleepSec(1);
	
	m_ardblViscosityCalibratedValues[1] = m_ardblViscosityCalibratedValues[0];
	m_ardblViscosityMeasured[1] = m_ardblViscosityMeasured[0];
	m_ardblViscosityCalibratedValues[0] = (double) parametersGetValue(PARAM_CALIBRATION_VALUE);
	m_ardblViscosityMeasured[0] = (double) parametersGetValue(PARAM_IN_VISCOSITY);

	//System
	//C0 = (X0*Mult/10000) + Offset/10
	//C1 = (X1*Mult/10000) + Offset/10
	
	//C0 - (X0*Mult/10000) = Offset/10
	//C1 - (X1*Mult/10000) = Offset/10
	//10*(C1 - (X1*Mult/10000)) = Offset
	
	//C0 - (X0*Mult/10000) = C1 - (X1*Mult/10000) 
	//C0 - C1 = (X0*Mult/10000) - (X1*Mult/10000) 
	//C0 - C1 = (X0*Mult - X1*Mult)/1000
	//(C0 - C1)*10000 = (X0-X1)*Mult
	//(C0 - C1)*10000 / (X0-X1) = Mult
	
	/* START - Removed in single point calculation to use only offset */
	//dblValue = (m_ardblViscosityCalibratedValues[0] -  m_ardblViscosityCalibratedValues[1]) * (10000.0 / (m_ardblViscosityMeasured[0]-m_ardblViscosityMeasured[1]));
	//parametersSet(PARAM_VISCO_MULT, (WORD) dblValue);
	/* END - Removed in single point calculation to use only offset */

	//screenReceivedCode(2,0,(WORD) dblValue);
	//sleepSec(1);

	dblValue = parametersGetValue(PARAM_VISCO_MULT);
	dblValue2 = 10.0 * (m_ardblViscosityCalibratedValues[0] - (dblValue * m_ardblViscosityMeasured[0] /10000.0));
	parametersSet(PARAM_VISCO_OFFSET, (WORD) dblValue2);
	
/*
	while(1)
	{
		Nop();
	}	
	*/
	m_ardblViscosityPreviousPValue[MEASURE_VISCOSITY_CALC_IDX_CONTROL] = 0.0;
	m_ardblViscosityPreviousPValue[MEASURE_VISCOSITY_CALC_IDX_VISUAL] = 0.0;
	//screenReceivedCode(3,0,(WORD) dblValue);
	//sleepSec(1);
	
}


/*****************************************************************************/
// Calibration based on 2 points of the line
void measureViscosityCalibration2Points(void)
{
	double dblValue;
	
	//screenReceivedCode(1,0,parametersGetValue(PARAM_IN_VISCOSITY));
	//sleepSec(1);
	
	m_ardblViscosityCalibratedValues[1] = m_ardblViscosityCalibratedValues[0];
	m_ardblViscosityMeasured[1] = m_ardblViscosityMeasured[0];
	m_ardblViscosityCalibratedValues[0] = (double) parametersGetValue(PARAM_CALIBRATION_VALUE);
	m_ardblViscosityMeasured[0] = (double) parametersGetValue(PARAM_IN_VISCOSITY);

	//System
	//C0 = (X0*Mult/10000) + Offset/10
	//C1 = (X1*Mult/10000) + Offset/10
	
	//C0 - (X0*Mult/10000) = Offset/10
	//C1 - (X1*Mult/10000) = Offset/10
	//10*(C1 - (X1*Mult/10000)) = Offset
	
	//C0 - (X0*Mult/10000) = C1 - (X1*Mult/10000) 
	//C0 - C1 = (X0*Mult/10000) - (X1*Mult/10000) 
	//C0 - C1 = (X0*Mult - X1*Mult)/1000
	//(C0 - C1)*10000 = (X0-X1)*Mult
	//(C0 - C1)*10000 / (X0-X1) = Mult
	
	dblValue = (m_ardblViscosityCalibratedValues[0] -  m_ardblViscosityCalibratedValues[1]) * (10000.0 / (m_ardblViscosityMeasured[0]-m_ardblViscosityMeasured[1]));
	parametersSet(PARAM_VISCO_MULT, (WORD) dblValue);

	//screenReceivedCode(2,0,(WORD) dblValue);
	//sleepSec(1);

	dblValue = 10.0 * (m_ardblViscosityCalibratedValues[0] - (dblValue * m_ardblViscosityMeasured[0] /10000.0));
	parametersSet(PARAM_VISCO_OFFSET, (WORD) dblValue);
	
	
	m_ardblViscosityPreviousPValue[MEASURE_VISCOSITY_CALC_IDX_CONTROL] = 0.0;
	m_ardblViscosityPreviousPValue[MEASURE_VISCOSITY_CALC_IDX_VISUAL] = 0.0;
	//screenReceivedCode(3,0,(WORD) dblValue);
	//sleepSec(1);

}