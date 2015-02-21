#include "label.h"

static const BYTE 	mc_arstrSetupLabelsIT[][] = {	
													"Guadagno viscosita    ",
													"Zona morta viscosita  ",
													"Intermisurazione      ",
													"Viscosita P           ",
													"Viscosita I           ",
													"Viscosita D           ",
													"Viscosita AVG         ",
													"Viscosita P - Visual  ",
													"Viscosita I - Visual  ",
													"Viscosita D - Visual  ",
													"Viscosita AVG - Visual",
													"Salto anomalie        ",
													"Lingua                ",
													"Matricola Macchina    ",
													"Ritardo Tastiera      ",
													"Ritardo Display       ",
													"Clock                 ",
													"Zoom Errore           ",
													"Viscosita - f.moltipli",
													"Viscosita - f.offset  ",
													"Temperatura - f.moltip",
													"Temperatura - f.offset",
													"Tempo massimo correz. ",
													"Modellizzazione ARMA  ",
													"Tazza                 ",
													"Visualizza Taratura   ",
													"Viscosita - f.off.fabb"
												};		


static const BYTE 	mc_arstrSetupLabelsEN[][] = {	
													"Viscosity Gain        ",
													"Viscosity Dead Zone   ",
													"Intermeasuring time   ",
													"Viscosity P           ",
													"Viscosity I           ",
													"Viscosity D           ",
													"Viscosity AVG         ",
													"Viscosity P - Visual  ",
													"Viscosity I - Visual  ",
													"Viscosity D - Visual  ",
													"Viscosity AVG - Visual",
													"Jump error            ",
													"Language              ",
													"Machine serial number ",
													"Keyboard delay        ",
													"Display delay         ",
													"Clock                 ",
													"Zoom Error            ",
													"Viscosity - multiplica",
													"Viscosity - offset    ",
													"Temperature - multipli",
													"Temperature - offset  ",
													"Max Correction time   ",
													"ARMA Model            ",
													"Cup                   ",
													"Show Calibration      ",
													"Viscosity - offset fac"
												};		

//***TODO: Da cambiare*** German
static const BYTE 	mc_arstrSetupLabelsDE[][] = {	
													"Guadagno viscosita    ",
													"Zona morta viscosita  ",
													"Intermisurazione      ",
													"Viscosita P           ",
													"Viscosita I           ",
													"Viscosita D           ",
													"Viscosita AVG         ",
													"Viscosita P - Visual  ",
													"Viscosita I - Visual  ",
													"Viscosita D - Visual  ",
													"Viscosita AVG - Visual",
													"Salto anomalie        ",
													"Lingua                ",
													"Matricola Macchina    ",
													"Ritardo Tastiera      ",
													"Ritardo Display       ",
													"Clock                 ",
													"Zoom Errore           ",
													"Viscosita - f.moltipli",
													"Viscosita - f.offset  ",
													"Temperatura - f.moltip",
													"Temperatura - f.offset",
													"Tempo massimo correz. ",
													"Modellizzazione ARMA  ",
													"Tazza                 ",
													"Visualizza Taratura   ",
													"Viscosita - f.off.fabb"
												};		

//***TODO: Da cambiare*** French
static const BYTE 	mc_arstrSetupLabelsFR[][] = {	
													"Guadagno viscosita    ",
													"Zona morta viscosita  ",
													"Intermisurazione      ",
													"Viscosita P           ",
													"Viscosita I           ",
													"Viscosita D           ",
													"Viscosita AVG         ",
													"Viscosita P - Visual  ",
													"Viscosita I - Visual  ",
													"Viscosita D - Visual  ",
													"Viscosita AVG - Visual",
													"Salto anomalie        ",
													"Lingua                ",
													"Matricola Macchina    ",
													"Ritardo Tastiera      ",
													"Ritardo Display       ",
													"Clock                 ",
													"Zoom Errore           ",
													"Viscosita - f.moltipli",
													"Viscosita - f.offset  ",
													"Temperatura - f.moltip",
													"Temperatura - f.offset",
													"Tempo massimo correz. ",
													"Modellizzazione ARMA  ",
													"Tazza                 ",
													"Visualizza Taratura   ",
													"Viscosita - f.off.fabb"
												};		

//***TODO: Da cambiare*** Spanish
static const BYTE 	mc_arstrSetupLabelsES[][] = {	
													"Guadagno viscosita    ",
													"Zona morta viscosita  ",
													"Intermisurazione      ",
													"Viscosita P           ",
													"Viscosita I           ",
													"Viscosita D           ",
													"Viscosita AVG         ",
													"Viscosita P - Visual  ",
													"Viscosita I - Visual  ",
													"Viscosita D - Visual  ",
													"Viscosita AVG - Visual",
													"Salto anomalie        ",
													"Lingua                ",
													"Matricola Macchina    ",
													"Ritardo Tastiera      ",
													"Ritardo Display       ",
													"Clock                 ",
													"Zoom Errore           ",
													"Viscosita - f.moltipli",
													"Viscosita - f.offset  ",
													"Temperatura - f.moltip",
													"Temperatura - f.offset",
													"Tempo massimo correz. ",
													"Modellizzazione ARMA  ",
													"Tazza                 ",
													"Visualizza Taratura   ",
													"Viscosita - f.off.fabb"
												};		


/*****************************************************************************/
BYTE * labelGet(BYTE a_byIndex)
{
	switch(parametersGetValue(PARAM_LANGUAGE))
	{
		case PARAM_LANGUAGE_EN: //English
			switch(a_byIndex)
			{
				case LABEL_MODE:
					return "mode:";
					break;
				case LABEL_MODE_MANUAL:
					return "manual";
					break;
				case LABEL_MODE_AUTO:
					return "auto";
					break;
				case LABEL_MODE_PAUSE:
					return "pause";
					break;
				case LABEL_MODE_OFF:
					return "off";
					break;
				case LABEL_TEMPERATURE:
					return "temp:";
					break;
				case LABEL_MESSAGE:
					return "message:";
					break;
				case LABEL_ALARM:
					return "alarm:";
					break;
				case LABEL_ANSWER_OK:
					return "No problem";
					break;
				case LABEL_GENERIC_ALARM_01:
					return "Alarm  ";
					break;
				case LABEL_GENERIC_ALARM_02:
					return "non recognized";
					break;
				case LABEL_VISCOSITY:
					return "viscosity:";
					break;
				case LABEL_SW_VERSION_01:
					return "Software";
					break;
				case LABEL_SW_VERSION_02:
					return "Version";
					break;
				case LABEL_JOB_ARCHIVE_01:
					return "Jobs";
					break;
				case LABEL_JOB_ARCHIVE_02:
					return "archive";
					break;
				case LABEL_SIMPLE_SETUP:
					return "simple setup:";
					break;
				case LABEL_FULL_SETUP:
					return "full setup:";
					break;
				case LABEL_SAVE_JOB_01:
					return "Save";
					break;
				case LABEL_SAVE_JOB_02:
					return "Job";
					break;
				case LABEL_LOAD_JOB_01:
					return "Load";
					break;
				case LABEL_LOAD_JOB_02:
					return "Job";
					break;
				case LABEL_CALIBRATION:
					return "Calibration";
					break;
				case LABEL_SETUP:
					return "Setup";
					break;
				case LABEL_ALARM_MEASURING_VISCOSITY:
					return "Measure viscosity'";
					break;
				case LABEL_ALARM_MEASURING_TEMPERATURE:
					return "Measure temperature";
					break;
				case LABEL_ALARM_MEASURING_PH:
					return "Measure pH";
					break;
				case LABEL_REFERENCE:
					return "Ref:";
					break;
				case LABEL_REAL:
					return "Actual:";
					break;		
				case LABEL_WASHING_01:
					return "Washing";
					break;
				case LABEL_WASHING_02:
					return "viscometer";
					break;
				case LABEL_ADDING_SOLVENT_01:
					return "Adding";
					break;
				case LABEL_ADDING_SOLVENT_02:
					return "solvent";
					break;					
				case LABEL_ALARM_PUMP_ON:
					return "Pump is active";
					break;
				case LABEL_CUP:
					return "Cup";
					break;
				case LABEL_RESET_CALIBRATION_01:
					return "Reset";
					break;
				case LABEL_RESET_CALIBRATION_02:
					return "calibration";
					break;
			default:
					return "ERR_IDX";
					break;
			}
			break;

		case PARAM_LANGUAGE_DE: //***TODO: Da cambiare*** German
			switch(a_byIndex)
			{
				case LABEL_MODE:
					return "mode:";
					break;
				case LABEL_MODE_MANUAL:
					return "manual";
					break;
				case LABEL_MODE_AUTO:
					return "auto";
					break;
				case LABEL_MODE_PAUSE:
					return "pause";
					break;
				case LABEL_MODE_OFF:
					return "off";
					break;
				case LABEL_TEMPERATURE:
					return "temp:";
					break;
				case LABEL_MESSAGE:
					return "message:";
					break;
				case LABEL_ALARM:
					return "alarm:";
					break;
				case LABEL_ANSWER_OK:
					return "No problem";
					break;
				case LABEL_GENERIC_ALARM_01:
					return "Alarm  ";
					break;
				case LABEL_GENERIC_ALARM_02:
					return "non recognized";
					break;
				case LABEL_VISCOSITY:
					return "viscosity:";
					break;
				case LABEL_SW_VERSION_01:
					return "Software";
					break;
				case LABEL_SW_VERSION_02:
					return "Version";
					break;
				case LABEL_JOB_ARCHIVE_01:
					return "Jobs";
					break;
				case LABEL_JOB_ARCHIVE_02:
					return "archive";
					break;
				case LABEL_SIMPLE_SETUP:
					return "simple setup:";
					break;
				case LABEL_FULL_SETUP:
					return "full setup:";
					break;
				case LABEL_SAVE_JOB_01:
					return "Save";
					break;
				case LABEL_SAVE_JOB_02:
					return "Job";
					break;
				case LABEL_LOAD_JOB_01:
					return "Load";
					break;
				case LABEL_LOAD_JOB_02:
					return "Job";
					break;
				case LABEL_CALIBRATION:
					return "Calibration";
					break;
				case LABEL_SETUP:
					return "Setup";
					break;
				case LABEL_ALARM_MEASURING_VISCOSITY:
					return "Measure viscosity";
					break;
				case LABEL_ALARM_MEASURING_TEMPERATURE:
					return "Measure temperature";
					break;
				case LABEL_ALARM_MEASURING_PH:
					return "Measure pH";
					break;
				case LABEL_REFERENCE:
					return "Ref:";
					break;
				case LABEL_REAL:
					return "Actual:";
					break;		
				case LABEL_WASHING_01:
					return "Washing";
					break;
				case LABEL_WASHING_02:
					return "viscometer";
					break;
				case LABEL_ADDING_SOLVENT_01:
					return "Adding";
					break;
				case LABEL_ADDING_SOLVENT_02:
					return "solvent";
					break;					
				case LABEL_ALARM_PUMP_ON:
					return "Pump is active";
					break;
				case LABEL_CUP:
					return "Cup";
					break;
				case LABEL_RESET_CALIBRATION_01:
					return "Reset";
					break;
				case LABEL_RESET_CALIBRATION_02:
					return "calibration";
					break;				
			default:
					return "ERR_IDX";
					break;
			}
			break;
		
		case PARAM_LANGUAGE_FR: //***TODO: Da cambiare*** French
			switch(a_byIndex)
			{
				case LABEL_MODE:
					return "mode:";
					break;
				case LABEL_MODE_MANUAL:
					return "manual";
					break;
				case LABEL_MODE_AUTO:
					return "auto";
					break;
				case LABEL_MODE_PAUSE:
					return "pause";
					break;
				case LABEL_MODE_OFF:
					return "off";
					break;
				case LABEL_TEMPERATURE:
					return "temp:";
					break;
				case LABEL_MESSAGE:
					return "message:";
					break;
				case LABEL_ALARM:
					return "alarm:";
					break;
				case LABEL_ANSWER_OK:
					return "No problem";
					break;
				case LABEL_GENERIC_ALARM_01:
					return "Alarm  ";
					break;
				case LABEL_GENERIC_ALARM_02:
					return "non recognized";
					break;
				case LABEL_VISCOSITY:
					return "viscosity:";
					break;
				case LABEL_SW_VERSION_01:
					return "Software";
					break;
				case LABEL_SW_VERSION_02:
					return "Version";
					break;
				case LABEL_JOB_ARCHIVE_01:
					return "Jobs";
					break;
				case LABEL_JOB_ARCHIVE_02:
					return "archive";
					break;
				case LABEL_SIMPLE_SETUP:
					return "simple setup:";
					break;
				case LABEL_FULL_SETUP:
					return "full setup:";
					break;
				case LABEL_SAVE_JOB_01:
					return "Save";
					break;
				case LABEL_SAVE_JOB_02:
					return "Job";
					break;
				case LABEL_LOAD_JOB_01:
					return "Load";
					break;
				case LABEL_LOAD_JOB_02:
					return "Job";
					break;
				case LABEL_CALIBRATION:
					return "Calibration";
					break;
				case LABEL_SETUP:
					return "Setup";
					break;
				case LABEL_ALARM_MEASURING_VISCOSITY:
					return "Measure viscosity'";
					break;
				case LABEL_ALARM_MEASURING_TEMPERATURE:
					return "Measure temperature";
					break;
				case LABEL_ALARM_MEASURING_PH:
					return "Measure pH";
					break;
				case LABEL_REFERENCE:
					return "Ref:";
					break;
				case LABEL_REAL:
					return "Actual:";
					break;		
				case LABEL_WASHING_01:
					return "Washing";
					break;
				case LABEL_WASHING_02:
					return "viscometer";
					break;
				case LABEL_ADDING_SOLVENT_01:
					return "Adding";
					break;
				case LABEL_ADDING_SOLVENT_02:
					return "solvent";
					break;					
				case LABEL_ALARM_PUMP_ON:
					return "Pump is active";
					break;
				case LABEL_CUP:
					return "Cup";
					break;
				case LABEL_RESET_CALIBRATION_01:
					return "Reset";
					break;
				case LABEL_RESET_CALIBRATION_02:
					return "calibration";
					break;
			default:
					return "ERR_IDX";
					break;
			}
			break;
		
		case PARAM_LANGUAGE_ES: //***TODO: Da cambiare*** Spanish
			switch(a_byIndex)
			{
				case LABEL_MODE:
					return "mode:";
					break;
				case LABEL_MODE_MANUAL:
					return "manual";
					break;
				case LABEL_MODE_AUTO:
					return "auto";
					break;
				case LABEL_MODE_PAUSE:
					return "pause";
					break;
				case LABEL_MODE_OFF:
					return "off";
					break;
				case LABEL_TEMPERATURE:
					return "temp:";
					break;
				case LABEL_MESSAGE:
					return "message:";
					break;
				case LABEL_ALARM:
					return "alarm:";
					break;
				case LABEL_ANSWER_OK:
					return "No problem";
					break;
				case LABEL_GENERIC_ALARM_01:
					return "Alarm  ";
					break;
				case LABEL_GENERIC_ALARM_02:
					return "non recognized";
					break;
				case LABEL_VISCOSITY:
					return "viscosity:";
					break;
				case LABEL_SW_VERSION_01:
					return "Software";
					break;
				case LABEL_SW_VERSION_02:
					return "Version";
					break;
				case LABEL_JOB_ARCHIVE_01:
					return "Jobs";
					break;
				case LABEL_JOB_ARCHIVE_02:
					return "archive";
					break;
				case LABEL_SIMPLE_SETUP:
					return "simple setup:";
					break;
				case LABEL_FULL_SETUP:
					return "full setup:";
					break;
				case LABEL_SAVE_JOB_01:
					return "Save";
					break;
				case LABEL_SAVE_JOB_02:
					return "Job";
					break;
				case LABEL_LOAD_JOB_01:
					return "Load";
					break;
				case LABEL_LOAD_JOB_02:
					return "Job";
					break;
				case LABEL_CALIBRATION:
					return "Calibration";
					break;
				case LABEL_SETUP:
					return "Setup";
					break;
				case LABEL_ALARM_MEASURING_VISCOSITY:
					return "Measure viscosity";
					break;
				case LABEL_ALARM_MEASURING_TEMPERATURE:
					return "Measure temperature";
					break;
				case LABEL_ALARM_MEASURING_PH:
					return "Measure pH";
					break;
				case LABEL_REFERENCE:
					return "Ref:";
					break;
				case LABEL_REAL:
					return "Actual:";
					break;		
				case LABEL_WASHING_01:
					return "Washing";
					break;
				case LABEL_WASHING_02:
					return "viscometer";
					break;
				case LABEL_ADDING_SOLVENT_01:
					return "Adding";
					break;
				case LABEL_ADDING_SOLVENT_02:
					return "solvent";
					break;					
				case LABEL_ALARM_PUMP_ON:
					return "Pump is active";
					break;
				case LABEL_CUP:
					return "Cup";
					break;
				case LABEL_RESET_CALIBRATION_01:
					return "Reset";
					break;
				case LABEL_RESET_CALIBRATION_02:
					return "calibration";
					break;
			default:
					return "ERR_IDX";
					break;
					
			}
			break;
			
		default:	//PARAM_LANGUAGE_IT - Italian
			switch(a_byIndex)
			{
				case LABEL_MODE:
					return "modo:";
					break;
				case LABEL_MODE_MANUAL:
					return "manual";
					break;
				case LABEL_MODE_AUTO:
					return "auto";
					break;
				case LABEL_MODE_PAUSE:
					return "pausa";
					break;
				case LABEL_MODE_OFF:
					return "off";
					break;
				case LABEL_TEMPERATURE:
					return "temp:";
					break;
				case LABEL_MESSAGE:
					return "messaggio:";
					break;
				case LABEL_ALARM:
					return "allarme:";
					break;
				case LABEL_ANSWER_OK:
					return "Nessun problema";
					break;
				case LABEL_GENERIC_ALARM_01:
					return "Allarme  ";
					break;
				case LABEL_GENERIC_ALARM_02:
					return "non riconosciuto";
					break;
				case LABEL_VISCOSITY:
					return "viscosita:";
					break;
				case LABEL_SW_VERSION_01:
					return "Versione";
					break;
				case LABEL_SW_VERSION_02:
					return "Software";
					break;
				case LABEL_JOB_ARCHIVE_01:
					return "Archivio";
					break;
				case LABEL_JOB_ARCHIVE_02:
					return "Lavori";
					break;
				case LABEL_SIMPLE_SETUP:
					return "setup semplice:";
					break;
				case LABEL_FULL_SETUP:
					return "setup completo:";
					break;
				case LABEL_SAVE_JOB_01:
					return "Salva";
					break;
				case LABEL_SAVE_JOB_02:
					return "lavoro";
					break;
				case LABEL_LOAD_JOB_01:
					return "Carica";
					break;
				case LABEL_LOAD_JOB_02:
					return "Lavoro";
					break;
				case LABEL_CALIBRATION:
					return "Taratura";
					break;
				case LABEL_SETUP:
					return "Setup";
					break;
				case LABEL_ALARM_MEASURING_VISCOSITY:
					return "Misur.viscosita";
					break;
				case LABEL_ALARM_MEASURING_TEMPERATURE:
					return "Misur.temperatura";
					break;
				case LABEL_ALARM_MEASURING_PH:
					return "Misur. pH";
					break;		
				case LABEL_REFERENCE:
					return "Rifer:";
					break;
				case LABEL_REAL:
					return "Attual:";
					break;
				case LABEL_WASHING_01:
					return "Lavaggio";
					break;
				case LABEL_WASHING_02:
					return "viscosimetro";
					break;
				case LABEL_ADDING_SOLVENT_01:
					return "Aggiunta solvente";
					break;
				case LABEL_ADDING_SOLVENT_02:
					return "in corso";
					break;
				case LABEL_ALARM_PUMP_ON:
					return "Pompa attiva";
					break;
				case LABEL_CUP:
					return "Tazza";
					break;
				case LABEL_RESET_CALIBRATION_01:
					return "Taratura di";
					break;
				case LABEL_RESET_CALIBRATION_02:
					return "fabbrica";
					break;
					
				default:
					return "ERR_IDX";
					break;
			}
			break;
	}
}


/*****************************************************************************/
BYTE * labelSetupGet(BYTE a_byIndex)
{
	switch(parametersGetValue(PARAM_LANGUAGE))
	{
		case PARAM_LANGUAGE_EN: //English
			return mc_arstrSetupLabelsEN[a_byIndex];
			break;
		case PARAM_LANGUAGE_DE: //German
			return mc_arstrSetupLabelsDE[a_byIndex];
			break;
		case PARAM_LANGUAGE_FR: //French
			return mc_arstrSetupLabelsFR[a_byIndex];
			break;
		case PARAM_LANGUAGE_ES: //Spanish
			return mc_arstrSetupLabelsES[a_byIndex];
			break;
		default:  	//PARAM_LANGUAGE_IT - Italian
			return mc_arstrSetupLabelsIT[a_byIndex];
			break;
	}
}
