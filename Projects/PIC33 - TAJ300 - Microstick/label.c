#include "label.h"

static const BYTE 	mc_arstrSetupLabelsIT[][24] = {	
													"Guadagno longitudin.  ",
													"Intervallo longitud.  ",
													"Derivativo longitudin.",
													"Zona morta longitud.  ",
													"Velocita motore long. ",
													"Guadagno trasversale  ",
													"Intervallo trasversale",
													"Zona morta trasversale",
													"Velocita motore tras. ",
													"Guadagno tiro         ",
													"Intervallo tiro       ",
													"Velocita minima       ",
													"Salto anomalie        ",
													"Sensibilta acc/dec.   ",
													"Segno di riferimento  ",
													"Posizione segno in MM ",
													"Forma marca           ",
													"Inversione correzione ",
													"Auto-Registro dopo F4 ",
													"Lingua                ",
													"Trasversale attivo    ",
													"Tiro attivo           ",
													"Cold Seal attivo      ",
													"Zoom Errore           ",
													"Applicazione Twin 01  ",
													"Applicazione Twin 02  ",
													"Selezione Encoder     ",
													"Matricola Macchina    ",
													"Area vuota in F4      ",
													"Ritardo Tastiera      ",
													"Marca PN attiva       ",
													"DAC long. attivo      ", 
													"DAC trasv. attivo     ",
													"DAC tiro attivo       ",													
													"DAC guadagno longitud.",
													"DAC guadagno tiro     ",
													"DAC guadagno manuale  ",
													"DAC offset            ",
													"Mostra Svil. Cilindro ",
													"Timer SNI             ",
													"Ritardo Allarme       ",
													"Refresh Display	   ",
													"Modo: MC=0  -  MM=1   "
												};		

static const BYTE 	mc_arstrSetupLabelsEN[][24] = {	
													"Longitudinal Gain     ",
													"Longitudinal Interval ",
													"Longitudinal Derivat. ",
													"Longitudinal Dead Zone",
													"Longitudinal Motor Spd",
													"Transversal Gain      ",
													"Transversal Interval  ",
													"Transversal Dead Zone ",
													"Transversal Motor Spd ",
													"Tension Gain          ",
													"Tension Interval      ",
													"Minimum Speed         ",
													"Jump Error            ",
													"Speed Variation       ",
													"Reference Mark        ",
													"Mark Position in MM   ",
													"Mark shape            ",
													"Reversal Correction   ",
													"Auto-Register after F4",
													"Language              ",
													"Transversal Enabled   ",
													"Tension Enabled       ",
													"Cold Seal Enabled     ",
													"Error Zoom            ",
													"Twin Application 01   ",
													"Twin Application 02   ",
													"Encoder Selection     ",
													"Machine Serial Number ",
													"Empty Area in F4      ",
													"Keyboard Delay        ",
													"PN mark enabled       ",
													"Enable DAC long.      ", 
													"Enable DAC transv.    ",
													"Enable DAC tension    ",													
													"DAC longitud. gain    ",
													"DAC tension gain      ",
													"DAC manual gain       ",
													"DAC offset            ",
													"Show cylinder size    ",
													"Timer SNI             ",
													"Alarm Delay           ",
													"Display Refresh 	   ",
													"Mode: MC=0  -  MM=1   "
												};		

static const BYTE 	mc_arstrSetupLabelsDE[][24] = {	
													"Lange Gewinn          ",
													"Lange Interwal        ",
													"Lange Ruckstand       ",
													"Totzone lange Register",
													"Geschwin. lange Motor ",
													"Quer Gewinn           ",
													"Quer Interwal         ",
													"Quer Totzone          ",
													"Geschwin. quer Motor  ",
													"Gewinn Spannung       ",
													"Interwal Spannung     ",
													"Minimal Geschwindigk. ",
													"Fehler Uberspringen   ",
													"Sensibilität hochlauf ",
													"Hinweis Marke         ",
													"Marke Stellung MM     ",
													"Marke Form            ",
													"Umkehrung Korrektur   ",
													"Auto-Register nach F4 ",
													"Sprache               ",
													"aktiv Quer            ",
													"aktiv Spannung        ",
													"aktiv Cold seal       ",
													"Zoom Fehler           ",
													"Anwendung Twin 01     ",
													"Anwendung Twin 02     ",
													"Auswahl Encoder       ",
													"Kennummer Register    ",
													"Druckfreier Bereich F4",
													"Verzogerung Tastatur  ",
													"Marke PN aktiv        ",
													"DAC aktiv länge       ",
													"DAC aktiv quer        ",
													"DAC aktiv Spannung    ",
													"DAC lange Gewinn      ",
													"DAC Gewinn Spannung   ",
													"DAC manual Gewinn     ",
													"DAC Offset            ",
													"Zylindergroße zeigen  ",
													"Timer SNI             ",
													"Alarmverzogerung      ",
													"Bildschirm erfrischen ",
													"Modus: MC=0  -  MM=1  " 
												};		

static const BYTE 	mc_arstrSetupLabelsFR[][24] = {		
													"Gain circonferential  ",
													"Cyclique circonfer.   ",
													"Derivativ circonfer.  ",
													"Zone morte circonfer. ",
													"Vitesse moteur circon.",
													"Gain trasversal       ",
													"Cyclique trasversal   ",
													"Zone morte circonfer. ",
													"Vitesse moteur trasv. ",
													"Gain de la tension    ",
													"Cyclique de tension   ",
													"Vitesse moindre       ",
													"Saut de erreur        ",
													"Variation de vitesse  ",
													"Marque de reference   ",
													"Position de marque MM ",
													"Forme de la marque    ",
													"Inversion correction  ",
													"Auto-Reperage apres F4",
													"Langue                ",
													"Trasversal actif      ",
													"Tension actif         ",
													"Cold Seal actif       ",
													"Erreur zoom           ",
													"Application Twin 01   ",
													"Application Twin 02   ",
													"Selection encoder     ",
													"Matricule machine     ",
													"Zone libre impres.  F4",
													"Retard clavier        ",
													"Marque PN actif       ",
													"DAC circonfer. actif  ",
													"DAC trasversal actif  ",
													"DAC tension actif     ",
													"DAC gain circonfer.   ",
													"DAC gain de la tension",
													"DAC gain manuel       ",
													"DAC offset            ",
													"Montrer le cylindre   ",
													"Timer SNI             ",
													"Temporisation d'alarme",
													"Ecran rafraichir      ",
													"Mode: MC=0  -  MM=1   "
												};		

static const BYTE 	mc_arstrSetupLabelsES[][24] = {	
													"Ganancia circunferen. ",
													"Ciclico circunferen.  ",
													"Derivativo circunfer. ",
													"Zona muerta cincunf.  ",
													"Velocidad motor circu.",
													"Ganancia transversal  ",
													"Ciclico transversal   ",
													"Zona muerta trans.    ",
													"Velocidad motor trans.",
													"Ganancia de tensión   ",
													"Ciclico de la tensión ",
													"Velocidad minima      ",
													"Salto de error        ",
													"Variación velocidad   ",
													"Marca de referencia   ",
													"Posición del senal MM ",
													"Forma marca           ",
													"Cambio corrección     ",
													"Auto-Registro F4      ",
													"Lengua                ",
													"Transversal activo    ",
													"Tensión activo        ",
													"Cold Seal activo      ",
													"Zoom error            ",
													"Aplicación Twin 01    ",
													"Aplicación Twin 02    ",
													"Selección encoder     ",
													"Matricula maquina     ",
													"Area imprenta libre F4",
													"Retardo tecla         ",
													"Marca PN activo       ",
													"DAC circonf. Activo   ",
													"DAC transversal Activo",
													"DAC tensione Activo   ",
													"DAC ganancia circunf. ",
													"DAC ganancia tension  ",
													"DAC ganancia manual   ",
													"DAC offset            ",
													"Demostrar el cilindro ",
													"Timer SNI             ",
													"Retardo de alarma     ",
													"Refrescar pantalla    ",
													"Modo: MC=0  -  MM=1   "
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
				case LABEL_MANUAL:
					return "manual";
					break;
				case LABEL_AUTO:
					return "automatic";
					break;
				case LABEL_SPEED:
					return "speed:";
					break;
				case LABEL_SPEED_SHORT:
					return "spd:";
					break;
				case LABEL_CYLINDER_SIZE:
					return "size:";
					break;
				case LABEL_MT_MIN:
					return "mt/min";
					break;
				case LABEL_MESSAGE:
					return "message:";
					break;
				case LABEL_ALARM:
					return "alarm:";
					break;
				case LABEL_ALARM_ERR_NO_PRINT:
					return "No print";
					break;
				case LABEL_ALARM_ERR_LOW_SPEED:
					return "Low speed";
					break;
				case LABEL_ALARM_ERR_TEST_SH_01:
					return "Scanning Head";
					break;
				case LABEL_ALARM_ERR_TEST_SH_02:
					return "test failed";
					break;
				case LABEL_ALARM_ERR_TEST_ENC_01:
					return "Encoder";
					break;
				case LABEL_ALARM_ERR_TEST_ENC_02:
					return "test failed";
					break;
				case LABEL_ALARM_ERR_PHASE_AUTO_01:
					return "Automatic Phase";
					break;
				case LABEL_ALARM_ERR_PHASE_AUTO_02:
					return "failed";
					break;
				case LABEL_ALARM_CYLINDER_TRAVEL_01:
					return "Cylinder size (P1)";
					break;
				case LABEL_ALARM_CYLINDER_TRAVEL_02:
					return "non acceptable";
					break;
				case LABEL_ALARM_GATE_WINDOW_01:
					return "Gate (P3)";
					break;
				case LABEL_ALARM_GATE_WINDOW_02:
					return "non acceptable";
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
				case LABEL_PHASE_OSCILL:
					return "phase with oscilloscope:";
					break;
				case LABEL_PHASE_FAST:
					return "fast correction phase:";
					break;
				case LABEL_OSCILLOSCOPE:
					return "oscilloscope:";
					break;
				case LABEL_REGISTER:
					return parametersGetValue(PARAM_RUNNING_MODE) == PARAM_RUNNING_MODE_MM ? "register mark-mark:" : "register mark-cylinder:" ;
					break;
				case LABEL_PHASE_CENTER_01:
					return "Error";
					break;
				case LABEL_PHASE_CENTER_02:
					return "reset";		
					break;
				case LABEL_PHASE_MANUAL_01:
					return "Manual";
					break;
				case LABEL_PHASE_MANUAL_02:
					return "phase";		
					break;
				case LABEL_PHASE_AUTO_01:
					return "Automatic"; 	
					break;
				case LABEL_PHASE_AUTO_02:
					return "phase"; 	
					break;
				case LABEL_PHASE_OSCILL_01:
					return "Phase with"; 	
					break;
				case LABEL_PHASE_OSCILL_02:
					return "oscilloscop"; 	
					break;
				case LABEL_PHASE_FAST_01:
					return "Fast correct"; 	
					break;
				case LABEL_PHASE_FAST_02:
					return "phase"; 	
					break;
				case LABEL_CYLINDER_TRAVEL_01:
					return "Cylinder"; 	
					break;
				case LABEL_CYLINDER_TRAVEL_02:
					return "size";
					break;
				case LABEL_ALARM_BOUND_01:
					return "Alarm";
					break;
				case LABEL_ALARM_BOUND_02:
					return "bound";
					break;
				case LABEL_GATE_WINDOW_01:
					return "Gate";
					break;
				case LABEL_GATE_WINDOW_02:
					return "width";
					break;
				case LABEL_SW_VERSION_01:
					return "Software";
					break;
				case LABEL_SW_VERSION_02:
					return "Version";
					break;
				case LABEL_OFFSET_DISTANCE_01:
					return "Offset";
					break;
				case LABEL_OFFSET_DISTANCE_02:
					return "distance";
					break;
				case LABEL_TEST_SH_01:
					return "Scanning ";
					break;
				case LABEL_TEST_SH_02:
					return "head test";
					break;
				case LABEL_TEST_ENC_01:
					return "Encoder";
					break;
				case LABEL_TEST_ENC_02:
					return "test";
					break;
				case LABEL_TEST_OUTPUT_01:
					return "Outputs";
					break;
				case LABEL_TEST_OUTPUT_02:
					return "test";
					break;
				case LABEL_VISUAL_REGISTER_01:
					return "Visual";
					break;
				case LABEL_VISUAL_REGISTER_02:
					return "Register";
					break;
				case LABEL_VISUAL_OSCILL_01:
					return "Visual";
					break;
				case LABEL_VISUAL_OSCILL_02:
					return "Oscilloscop";
					break;
				case LABEL_JOB_ARCHIVE_01:
					return "Jobs";
					break;
				case LABEL_JOB_ARCHIVE_02:
					return "archive";
					break;
				case LABEL_FUNCTIONS:
					return "Functions";
					break;
				case LABEL_PARAMETERS:
					return "Parameters";
					break;
				case LABEL_TESTS:
					return "Tests";
					break;
				case LABEL_SIMPLE_SETUP:
					return "simple setup:";
					break;
				case LABEL_FULL_SETUP:
					return "full setup:";
					break;
				case LABEL_ALARM_ERR_ACCELERATION:
					return "Acceleration";
					break;
				case LABEL_ALARM_ERR_DECELERATION:
					return "Deceleration";
					break;
				case LABEL_ALARM_ERR_DOUBLE_MARK:
					return "Double Mark";
					break;
				case LABEL_AUTO_SHORT:
					return "Auto";
					break;
				case LABEL_MANUAL_SHORT:
					return "Manual";
					break;
				case LABEL_MODE_LONG:
					return "Long:";
					break;
				case LABEL_MODE_TRANS:
					return "Tran:";
					break;
				case LABEL_MODE_PULL:
					return "Tens:";
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
				case LABEL_TWIN_APPLICATION_01_01:
					return "Front/Back";
					break;
				case LABEL_TWIN_APPLICATION_01_02:
					return "application";
					break;
				case LABEL_TWIN_APPLICATION_02_01:
					return "Insetter";
					break;
				case LABEL_TWIN_APPLICATION_02_02:
					return "application";
					break;
				case LABEL_TWIN_APPLICATION_03_01:
					return "Cutting";
					break;
				case LABEL_TWIN_APPLICATION_03_02:
					return "application";
					break;
				case LABEL_TWIN_APPLICATION_04_01:
					return "Web folding";
					break;
				case LABEL_TWIN_APPLICATION_04_02:
					return "application";
					break;				
				case LABEL_TWIN_APPLICATION_05_01:
					return "Perforation";
					break;
				case LABEL_TWIN_APPLICATION_05_02:
					return "application";
					break;				
				case LABEL_TWIN_APPLICATION_06_01:
					return "Frontside";
					break;				
				case LABEL_TWIN_APPLICATION_06_02:
					return "application";
					break;				
				case LABEL_TWIN_APPLICATION_07_01:
					return "Backside";
					break;				
				case LABEL_TWIN_APPLICATION_07_02:
					return "application";
					break;				
				case LABEL_REGISTER_TWIN_APPLICATION_01:
					return "Front/Backside register:";
					break;
				case LABEL_REGISTER_TWIN_APPLICATION_02:
					return "insetter register:";
					break;
				case LABEL_REGISTER_TWIN_APPLICATION_03:
					return "Cutting-off register:";
					break;
				case LABEL_REGISTER_TWIN_APPLICATION_04:
					return "Web folding register:";
					break;
				case LABEL_REGISTER_TWIN_APPLICATION_05:
					return "Perforation register:";
					break;
				case LABEL_REGISTER_TWIN_APPLICATION_06:
					return "Frontside register:";
					break;
				case LABEL_REGISTER_TWIN_APPLICATION_07:
					return "Backside register:";
					break;
				case LABEL_ENCODER_01_01:
					return "Encoder";
					break;
				case LABEL_ENCODER_01_02:
					return "1";
					break;
				case LABEL_ENCODER_02_01:
					return "Encoder";
					break;
				case LABEL_ENCODER_02_02:
					return "2";
					break;
				case LABEL_SELECT_APPLICATION_01:
					return "Application";
					break;
				case LABEL_SELECT_APPLICATION_02:
					return "selection";
					break;
				case LABEL_SELECT_ENCODER_01:
					return "Encoder";
					break;
				case LABEL_SELECT_ENCODER_02:
					return "selection";
					break;		
				case LABEL_SH_PN_01_01:
					return "Positive";
					break;
				case LABEL_SH_PN_01_02:
					return "Mark";
					break;
				case LABEL_SH_PN_02_01:
					return "Negative";
					break;
				case LABEL_SH_PN_02_02:
					return "Mark";
					break;		
				case LABEL_SELECT_SH_PN_01:
					return "P/N Mark";
					break;
				case LABEL_SELECT_SH_PN_02:
					return "Selection";
					break;			
				case LABEL_TENSION_BASE_VALUE_01:
					return "Tension base";
					break;
				case LABEL_TENSION_BASE_VALUE_02:
					return "value";
					break;			
				case LABEL_SELECT_MM_01:
					return "Mark-Mark";
					break;			
				case LABEL_SELECT_MM_02:
					return "positions";
					break;			
				case LABEL_MM_POSITION_01_01:
					return "MM positions";
					break;			
				case LABEL_MM_POSITION_01_02:
					return "reference";
					break;	
				case LABEL_MM_POSITION_02_01:
					return "MM positions";
					break;			
				case LABEL_MM_POSITION_02_02:
					return "signal";
					break;					
				default:
					return "ERR_IDX";
					break;
			}
			break;
		case PARAM_LANGUAGE_DE: //Deutch
			switch(a_byIndex)
			{
				case LABEL_MODE:
					return "Bestimmung";
					break;
				case LABEL_MANUAL:
					return "manuell";
					break;
				case LABEL_AUTO:
					return "automatik";
					break;
				case LABEL_SPEED:
					return "Geschwindigkeit";
					break;
				case LABEL_SPEED_SHORT:
					return "Gesch:";
					break;
				case LABEL_CYLINDER_SIZE:
					return "grosse:";
					break;
				case LABEL_MT_MIN:
					return "mt/min";
					break;
				case LABEL_MESSAGE:
					return "Nachricht";
					break;
				case LABEL_ALARM:
					return "Alarm";
					break;
				case LABEL_ALARM_ERR_NO_PRINT:
					return "Druck fehlt";
					break;
				case LABEL_ALARM_ERR_LOW_SPEED:
					return "langsam Geschwindigkeit";
					break;
				case LABEL_ALARM_ERR_TEST_SH_01:
					return "Lesekopf";
					break;
				case LABEL_ALARM_ERR_TEST_SH_02:
					return "test Irrtum";
					break;
				case LABEL_ALARM_ERR_TEST_ENC_01:
					return "Encoder test";
					break;
				case LABEL_ALARM_ERR_TEST_ENC_02:
					return "Irrtum";
					break;
				case LABEL_ALARM_ERR_PHASE_AUTO_01:
					return "Automatische";
					break;
				case LABEL_ALARM_ERR_PHASE_AUTO_02:
					return "Einstellung Irrtum";
					break;
				case LABEL_ALARM_CYLINDER_TRAVEL_01:
					return "Format Zylinder (P1)";
					break;
				case LABEL_ALARM_CYLINDER_TRAVEL_02:
					return "nicht akzeptabel";
					break;
				case LABEL_ALARM_GATE_WINDOW_01:
					return "Tor Weite (P3)";
					break;
				case LABEL_ALARM_GATE_WINDOW_02:
					return "nicht akzeptabel";
					break;
				case LABEL_ANSWER_OK:
					return "OK";
					break;
				case LABEL_GENERIC_ALARM_01:
					return "Alarm";
					break;
				case LABEL_GENERIC_ALARM_02:
					return "nicht anerkannt";
					break;
				case LABEL_PHASE_OSCILL:
					return "Einstellung mit dem Oszilloskop";
					break;
				case LABEL_PHASE_FAST:
					return "Einstellung Verbesserung stromschenelle";
					break;
				case LABEL_OSCILLOSCOPE:
					return "Oszilloskop";
					break;
				case LABEL_REGISTER:
					return parametersGetValue(PARAM_RUNNING_MODE) == PARAM_RUNNING_MODE_MM ? "Register Marke-Marke:" : "Register Marke-Zylinder:" ;
					break;
				case LABEL_PHASE_CENTER_01:
					return "Nulleinstel.";
					break;
				case LABEL_PHASE_CENTER_02:
					return "Fehler";
					break;
				case LABEL_PHASE_MANUAL_01:
					return "Einstellung";
					break;
				case LABEL_PHASE_MANUAL_02:
					return "manuell";
					break;
				case LABEL_PHASE_AUTO_01:
					return "Einstellung";
					break;
				case LABEL_PHASE_AUTO_02:
					return "automatisch";
					break;
				case LABEL_PHASE_OSCILL_01:
					return "Einstellung";
					break;
				case LABEL_PHASE_OSCILL_02:
					return "Oszilloskop";
					break;
				case LABEL_PHASE_FAST_01:
					return "Einstellung a";
					break;
				case LABEL_PHASE_FAST_02:
					return "beschleunigung";
					break;
				case LABEL_CYLINDER_TRAVEL_01:
					return "dimension";
					break;
				case LABEL_CYLINDER_TRAVEL_02:
					return "zylinder";
					break;
				case LABEL_ALARM_BOUND_01:
					return "Limit";
					break;
				case LABEL_ALARM_BOUND_02:
					return "Alarm";
					break;
				case LABEL_GATE_WINDOW_01:
					return "Weite";
					break;
				case LABEL_GATE_WINDOW_02:
					return "Tor";
					break;
				case LABEL_SW_VERSION_01:
					return "Version";
					break;
				case LABEL_SW_VERSION_02:
					return "Software";
					break;
				case LABEL_OFFSET_DISTANCE_01:
					return "Entfernung";
					break;
				case LABEL_OFFSET_DISTANCE_02:
					return "offset";
					break;
				case LABEL_TEST_SH_01:
					return "Test";
					break;
				case LABEL_TEST_SH_02:
					return "Lesekopf";
					break;
				case LABEL_TEST_ENC_01:
					return "Test";
					break;
				case LABEL_TEST_ENC_02:
					return "Encoder";
					break;
				case LABEL_TEST_OUTPUT_01:
					return "Test";
					break;
				case LABEL_TEST_OUTPUT_02:
					return "Ausgangen";
					break;
				case LABEL_VISUAL_REGISTER_01:
					return "Visual";
					break;
				case LABEL_VISUAL_REGISTER_02:
					return "Register";
					break;
				case LABEL_VISUAL_OSCILL_01:
					return "Visual";
					break;
				case LABEL_VISUAL_OSCILL_02:
					return "Oszilloskop";
					break;
				case LABEL_JOB_ARCHIVE_01:
					return "Archiv";
					break;
				case LABEL_JOB_ARCHIVE_02:
					return "Arbeiten";
					break;
				case LABEL_FUNCTIONS:
					return "Funktionen";
					break;
				case LABEL_PARAMETERS:
					return "Parametern";
					break;
				case LABEL_TESTS:
					return "Tests";
					break;
				case LABEL_SIMPLE_SETUP:
					return "leicht Setup";
					break;
				case LABEL_FULL_SETUP:
					return "vollstandig Setup";
					break;
				case LABEL_ALARM_ERR_ACCELERATION:
					return "Hochlauf";
					break;
				case LABEL_ALARM_ERR_DECELERATION:
					return "Rüchlauf";
					break;
				case LABEL_ALARM_ERR_DOUBLE_MARK:
					return "doppel Marke";
					break;
				case LABEL_AUTO_SHORT:
					return "Auto";
					break;
				case LABEL_MANUAL_SHORT:
					return "man.";
					break;
				case LABEL_MODE_LONG:
					return "langs:";
					break;
				case LABEL_MODE_TRANS:
					return "quer";
					break;
				case LABEL_MODE_PULL:
					return "Span.";
					break;
				case LABEL_SAVE_JOB_01:
					return "speichern";
					break;
				case LABEL_SAVE_JOB_02:
					return "Arbeit";
					break;
				case LABEL_LOAD_JOB_01:
					return "laden";
					break;
				case LABEL_LOAD_JOB_02:
					return "Arbeit";
					break;
				case LABEL_TWIN_APPLICATION_01_01:
					return "Steuerung";
					break;
				case LABEL_TWIN_APPLICATION_01_02:
					return "Vorder/Ruckseite";
					break;
				case LABEL_TWIN_APPLICATION_02_01:
					return "Register";
					break;
				case LABEL_TWIN_APPLICATION_02_02:
					return "Insetter";
					break;
				case LABEL_TWIN_APPLICATION_03_01:
					return "Register";
					break;
				case LABEL_TWIN_APPLICATION_03_02:
					return "Schnitt";
					break;
				case LABEL_TWIN_APPLICATION_04_01:
					return "Register";
					break;
				case LABEL_TWIN_APPLICATION_04_02:
					return "Falz";
					break;
				case LABEL_TWIN_APPLICATION_05_01:
					return "Register";
					break;
				case LABEL_TWIN_APPLICATION_05_02:
					return "Perforation";
					break;
				case LABEL_TWIN_APPLICATION_06_01:
					return "Register";
					break;
				case LABEL_TWIN_APPLICATION_06_02:
					return "Vorder";
					break;
				case LABEL_TWIN_APPLICATION_07_01:
					return "Register";
					break;
				case LABEL_TWIN_APPLICATION_07_02:
					return "Rückseite";
					break;
				case LABEL_REGISTER_TWIN_APPLICATION_01:
					return "Vorder/Rückseite Register";
					break;
				case LABEL_REGISTER_TWIN_APPLICATION_02:
					return "Insetter Register";
					break;
				case LABEL_REGISTER_TWIN_APPLICATION_03:
					return "Schnitt Register";
					break;
				case LABEL_REGISTER_TWIN_APPLICATION_04:
					return "Falz Register";
					break;
				case LABEL_REGISTER_TWIN_APPLICATION_05:
					return "Perforation Register";
					break;
				case LABEL_REGISTER_TWIN_APPLICATION_06:
					return "Vorder Register";
					break;
				case LABEL_REGISTER_TWIN_APPLICATION_07:
					return "Rückseite register";
					break;
				case LABEL_ENCODER_01_01:
					return "Encoder";
					break;
				case LABEL_ENCODER_01_02:
					return "1";
					break;
				case LABEL_ENCODER_02_01:
					return "Encoder";
					break;
				case LABEL_ENCODER_02_02:
					return "2";
					break;
				case LABEL_SELECT_APPLICATION_01:
					return "Auswahl";
					break;
				case LABEL_SELECT_APPLICATION_02:
					return "Anwendung";
					break;
				case LABEL_SELECT_ENCODER_01:
					return "Auswahl";
					break;
				case LABEL_SELECT_ENCODER_02:
					return "Encoder";
					break;
				case LABEL_SH_PN_01_01:
					return "Marke";
					break;
				case LABEL_SH_PN_01_02:
					return "Positiv";
					break;
				case LABEL_SH_PN_02_01:
					return "Marke";
					break;
				case LABEL_SH_PN_02_02:
					return "Negativ";
					break;
				case LABEL_SELECT_SH_PN_01:
					return "Auswahl";
					break;
				case LABEL_SELECT_SH_PN_02:
					return "Marke P/N";
					break;
				case LABEL_TENSION_BASE_VALUE_01:
					return "Spannung";
					break;
				case LABEL_TENSION_BASE_VALUE_02:
					return "Anfangs";
					break;
				case LABEL_SELECT_MM_01:
					return "Marke-Marke";
					break;			
				case LABEL_SELECT_MM_02:
					return "Positionen";
					break;
				case LABEL_MM_POSITION_01_01:
					return "MM Positionen";
					break;			
				case LABEL_MM_POSITION_01_02:
					return "Referez";
					break;	
				case LABEL_MM_POSITION_02_01:
					return "MM Positionen";
					break;			
				case LABEL_MM_POSITION_02_02:
					return "Signal";
					break;					
				default:
					return "ERR_IDX";
					break;
					
			}
			break;			
		case PARAM_LANGUAGE_ES: //Spanish
			switch(a_byIndex)
			{
				case LABEL_MODE:
					return "modo";
					break;
				case LABEL_MANUAL:
					return "manual";
					break;
				case LABEL_AUTO:
					return "automatico";
					break;
				case LABEL_SPEED:
					return "velocidad";
					break;
				case LABEL_SPEED_SHORT:
					return "vel:";
					break;
				case LABEL_CYLINDER_SIZE:
					return "tamano:";
					break;
				case LABEL_MT_MIN:
					return "mt/min";
					break;
				case LABEL_MESSAGE:
					return "mensaje";
					break;
				case LABEL_ALARM:
					return "alarma";
					break;
				case LABEL_ALARM_ERR_NO_PRINT:
					return "Falta de signo";
					break;
				case LABEL_ALARM_ERR_LOW_SPEED:
					return "Velocidad lenta";
					break;
				case LABEL_ALARM_ERR_TEST_SH_01:
					return "Test cabeza";
					break;
				case LABEL_ALARM_ERR_TEST_SH_02:
					return "exploradora error";
					break;
				case LABEL_ALARM_ERR_TEST_ENC_01:
					return "Test encoder";
					break;
				case LABEL_ALARM_ERR_TEST_ENC_02:
					return "error";
					break;
				case LABEL_ALARM_ERR_PHASE_AUTO_01:
					return "Fase";
					break;
				case LABEL_ALARM_ERR_PHASE_AUTO_02:
					return "automatica error";
					break;
				case LABEL_ALARM_CYLINDER_TRAVEL_01:
					return "Desarrollo del Cilindro (P1)";
					break;
				case LABEL_ALARM_CYLINDER_TRAVEL_02:
					return "non admisible";
					break;
				case LABEL_ALARM_GATE_WINDOW_01:
					return "Espacio de Lectura (P3)";
					break;
				case LABEL_ALARM_GATE_WINDOW_02:
					return "non admisible";
					break;
				case LABEL_ANSWER_OK:
					return "OK";
					break;
				case LABEL_GENERIC_ALARM_01:
					return "Alarma";
					break;
				case LABEL_GENERIC_ALARM_02:
					return "desconocido";
					break;
				case LABEL_PHASE_OSCILL:
					return "Fase con osciloscopio";
					break;
				case LABEL_PHASE_FAST:
					return "Fase con correccion rapida";
					break;
				case LABEL_OSCILLOSCOPE:
					return "osciloscopio";
					break;
				case LABEL_REGISTER:
					return "registro";
					return parametersGetValue(PARAM_RUNNING_MODE) == PARAM_RUNNING_MODE_MM ? "registro marca-marca:" : "registro marca-cilindro:" ;
					break;
				case LABEL_PHASE_CENTER_01:
					return "puesta a cero";
					break;
				case LABEL_PHASE_CENTER_02:
					return "error";
					break;
				case LABEL_PHASE_MANUAL_01:
					return "Fase";
					break;
				case LABEL_PHASE_MANUAL_02:
					return "manual";
					break;
				case LABEL_PHASE_AUTO_01:
					return "Fase";
					break;
				case LABEL_PHASE_AUTO_02:
					return "automatica";
					break;
				case LABEL_PHASE_OSCILL_01:
					return "Fase";
					break;
				case LABEL_PHASE_OSCILL_02:
					return "osciloscop";
					break;
				case LABEL_PHASE_FAST_01:
					return "Fase";
					break;
				case LABEL_PHASE_FAST_02:
					return "aceleracion";
					break;
				case LABEL_CYLINDER_TRAVEL_01:
					return "desarrollo";
					break;
				case LABEL_CYLINDER_TRAVEL_02:
					return "cilindro";
					break;
				case LABEL_ALARM_BOUND_01:
					return "umbral";
					break;
				case LABEL_ALARM_BOUND_02:
					return "alarma";
					break;
				case LABEL_GATE_WINDOW_01:
					return "Espacio";
					break;
				case LABEL_GATE_WINDOW_02:
					return "gate";
					break;
				case LABEL_SW_VERSION_01:
					return "Version";
					break;
				case LABEL_SW_VERSION_02:
					return "Software";
					break;
				case LABEL_OFFSET_DISTANCE_01:
					return "Distancia";
					break;
				case LABEL_OFFSET_DISTANCE_02:
					return "de offset";
					break;
				case LABEL_TEST_SH_01:
					return "Test";
					break;
				case LABEL_TEST_SH_02:
					return "Cabeza";
					break;
				case LABEL_TEST_ENC_01:
					return "Test";
					break;
				case LABEL_TEST_ENC_02:
					return "encoder";
					break;
				case LABEL_TEST_OUTPUT_01:
					return "Test";
					break;
				case LABEL_TEST_OUTPUT_02:
					return "salidas";
					break;
				case LABEL_VISUAL_REGISTER_01:
					return "Visual";
					break;
				case LABEL_VISUAL_REGISTER_02:
					return "Registro";
					break;
				case LABEL_VISUAL_OSCILL_01:
					return "Visual";
					break;
				case LABEL_VISUAL_OSCILL_02:
					return "Osciloscopio";
					break;
				case LABEL_JOB_ARCHIVE_01:
					return "Archivo";
					break;
				case LABEL_JOB_ARCHIVE_02:
					return "Trabajos";
					break;
				case LABEL_FUNCTIONS:
					return "funciones";
					break;
				case LABEL_PARAMETERS:
					return "Parametros";
					break;
				case LABEL_TESTS:
					return "Tests";
					break;
				case LABEL_SIMPLE_SETUP:
					return "setup sencillo";
					break;
				case LABEL_FULL_SETUP:
					return "setup total";
					break;
				case LABEL_ALARM_ERR_ACCELERATION:
					return "Aceleracion";
					break;
				case LABEL_ALARM_ERR_DECELERATION:
					return "Deceleracion";
					break;
				case LABEL_ALARM_ERR_DOUBLE_MARK:
					return "doble marca";
					break;
				case LABEL_AUTO_SHORT:
					return "Auto";
					break;
				case LABEL_MANUAL_SHORT:
					return "Manual";
					break;
				case LABEL_MODE_LONG:
					return "circ:";
					break;
				case LABEL_MODE_TRANS:
					return "tras:";
					break;
				case LABEL_MODE_PULL:
					return "Tens:";
					break;
				case LABEL_SAVE_JOB_01:
					return "Salvar";
					break;
				case LABEL_SAVE_JOB_02:
					return "Trabajo";
					break;
				case LABEL_LOAD_JOB_01:
					return "Cargar";
					break;
				case LABEL_LOAD_JOB_02:
					return "Trabajo";
					break;
				case LABEL_TWIN_APPLICATION_01_01:
					return "Control";
					break;
				case LABEL_TWIN_APPLICATION_01_02:
					return "Recto/Verso";
					break;
				case LABEL_TWIN_APPLICATION_02_01:
					return "Control";
					break;
				case LABEL_TWIN_APPLICATION_02_02:
					return "Insetter";
					break;
				case LABEL_TWIN_APPLICATION_03_01:
					return "Control";
					break;
				case LABEL_TWIN_APPLICATION_03_02:
					return "Corte";
					break;
				case LABEL_TWIN_APPLICATION_04_01:
					return "Control";
					break;
				case LABEL_TWIN_APPLICATION_04_02:
					return "Pliegue";
					break;
				case LABEL_TWIN_APPLICATION_05_01:
					return "Control";
					break;
				case LABEL_TWIN_APPLICATION_05_02:
					return "Perforacion";
					break;
				case LABEL_TWIN_APPLICATION_06_01:
					return "Control";
					break;
				case LABEL_TWIN_APPLICATION_06_02:
					return "recto";
					break;
				case LABEL_TWIN_APPLICATION_07_01:
					return "Control";
					break;
				case LABEL_TWIN_APPLICATION_07_02:
					return "verso";
					break;
				case LABEL_REGISTER_TWIN_APPLICATION_01:
					return "registro recto/verso";
					break;
				case LABEL_REGISTER_TWIN_APPLICATION_02:
					return "registro insetter";
					break;
				case LABEL_REGISTER_TWIN_APPLICATION_03:
					return "registro corte";
					break;
				case LABEL_REGISTER_TWIN_APPLICATION_04:
					return "registro pliegue";
					break;
				case LABEL_REGISTER_TWIN_APPLICATION_05:
					return "registro perforacion";
					break;
				case LABEL_REGISTER_TWIN_APPLICATION_06:
					return "registro recto";
					break;
				case LABEL_REGISTER_TWIN_APPLICATION_07:
					return "registro verso";
					break;
				case LABEL_ENCODER_01_01:
					return "Encoder";
					break;
				case LABEL_ENCODER_01_02:
					return "1";
					break;
				case LABEL_ENCODER_02_01:
					return "Encoder";
					break;
				case LABEL_ENCODER_02_02:
					return "2";
					break;
				case LABEL_SELECT_APPLICATION_01:
					return "Seleccion";
					break;
				case LABEL_SELECT_APPLICATION_02:
					return "aplicacion";
					break;
				case LABEL_SELECT_ENCODER_01:
					return "Seleccion";
					break;
				case LABEL_SELECT_ENCODER_02:
					return "Encoder";
					break;
				case LABEL_SH_PN_01_01:
					return "Marca";
					break;
				case LABEL_SH_PN_01_02:
					return "Positiva";
					break;
				case LABEL_SH_PN_02_01:
					return "Marca";
					break;
				case LABEL_SH_PN_02_02:
					return "Negativa";
					break;
				case LABEL_SELECT_SH_PN_01:
					return "Seleccion";
					break;
				case LABEL_SELECT_SH_PN_02:
					return "Marca P/N";
					break;
				case LABEL_TENSION_BASE_VALUE_01:
					return "Tension";
					break;
				case LABEL_TENSION_BASE_VALUE_02:
					return "Inicial";
					break;
				case LABEL_SELECT_MM_01:
					return "Posiciones";
					break;			
				case LABEL_SELECT_MM_02:
					return "marca-marca";
					break;
				case LABEL_MM_POSITION_01_01:
					return "Posiciones MM";
					break;			
				case LABEL_MM_POSITION_01_02:
					return "referencia";
					break;	
				case LABEL_MM_POSITION_02_01:
					return "Posiciones MM";
					break;			
				case LABEL_MM_POSITION_02_02:
					return "senal";
					break;						
				default:
					return "ERR_IDX";
					break;				
			}
			break;			
		case PARAM_LANGUAGE_FR: //French
			switch(a_byIndex)
			{
				case LABEL_MODE:
					return "modalite";
					break;
				case LABEL_MANUAL:
					return "manuel";
					break;
				case LABEL_AUTO:
					return "automatique";
					break;
				case LABEL_SPEED:
					return "vitesse";
					break;
				case LABEL_SPEED_SHORT:
					return "vit:";
					break;
				case LABEL_CYLINDER_SIZE:
					return "taille:";
					break;
				case LABEL_MT_MIN:
					return "mt/min";
					break;
				case LABEL_MESSAGE:
					return "message";
					break;
				case LABEL_ALARM:
					return "alarme";
					break;
				case LABEL_ALARM_ERR_NO_PRINT:
					return "Pas de signe";
					break;
				case LABEL_ALARM_ERR_LOW_SPEED:
					return "bas vitesse";
					break;
				case LABEL_ALARM_ERR_TEST_SH_01:
					return "Test de";
					break;
				case LABEL_ALARM_ERR_TEST_SH_02:
					return "la tete erreur";
					break;
				case LABEL_ALARM_ERR_TEST_ENC_01:
					return "Test encoder";
					break;
				case LABEL_ALARM_ERR_TEST_ENC_02:
					return "erreur";
					break;
				case LABEL_ALARM_ERR_PHASE_AUTO_01:
					return "Calge automatique";
					break;
				case LABEL_ALARM_ERR_PHASE_AUTO_02:
					return "erreur";
					break;
				case LABEL_ALARM_CYLINDER_TRAVEL_01:
					return "Dimension du Cylindre (P1)";
					break;
				case LABEL_ALARM_CYLINDER_TRAVEL_02:
					return "inacceptable";
					break;
				case LABEL_ALARM_GATE_WINDOW_01:
					return "Espace de Lecture (P3)";
					break;
				case LABEL_ALARM_GATE_WINDOW_02:
					return "inacceptable";
					break;
				case LABEL_ANSWER_OK:
					return "OK";
					break;
				case LABEL_GENERIC_ALARM_01:
					return "Alarme";
					break;
				case LABEL_GENERIC_ALARM_02:
					return "ne pas reconnu";
					break;
				case LABEL_PHASE_OSCILL:
					return "calage avec oscilloscope";
					break;
				case LABEL_PHASE_FAST:
					return "calage avec rapide correction";
					break;
				case LABEL_OSCILLOSCOPE:
					return "oscilloscope";
					break;
				case LABEL_REGISTER:
					return "registre";
					return parametersGetValue(PARAM_RUNNING_MODE) == PARAM_RUNNING_MODE_MM ? "registre marque-marque:" : "registre marque-cylindre:" ;
					break;
				case LABEL_PHASE_CENTER_01:
					return "metre au zero";
					break;
				case LABEL_PHASE_CENTER_02:
					return "erreur";
					break;
				case LABEL_PHASE_MANUAL_01:
					return "calage";
					break;
				case LABEL_PHASE_MANUAL_02:
					return "manuel";
					break;
				case LABEL_PHASE_AUTO_01:
					return "calage";
					break;
				case LABEL_PHASE_AUTO_02:
					return "automatique";
					break;
				case LABEL_PHASE_OSCILL_01:
					return "calage";
					break;
				case LABEL_PHASE_OSCILL_02:
					return "oscilloscope";
					break;
				case LABEL_PHASE_FAST_01:
					return "calage";
					break;
				case LABEL_PHASE_FAST_02:
					return "acceleration";
					break;
				case LABEL_CYLINDER_TRAVEL_01:
					return "dimension";
					break;
				case LABEL_CYLINDER_TRAVEL_02:
					return "cylindre";
					break;
				case LABEL_ALARM_BOUND_01:
					return "seuil";
					break;
				case LABEL_ALARM_BOUND_02:
					return "alarm";
					break;
				case LABEL_GATE_WINDOW_01:
					return "Etendue";
					break;
				case LABEL_GATE_WINDOW_02:
					return "gate";
					break;
				case LABEL_SW_VERSION_01:
					return "Version";
					break;
				case LABEL_SW_VERSION_02:
					return "Software";
					break;
				case LABEL_OFFSET_DISTANCE_01:
					return "Distance";
					break;
				case LABEL_OFFSET_DISTANCE_02:
					return "sur offset";
					break;
				case LABEL_TEST_SH_01:
					return "Test";
					break;
				case LABEL_TEST_SH_02:
					return "Tete";
					break;
				case LABEL_TEST_ENC_01:
					return "Test";
					break;
				case LABEL_TEST_ENC_02:
					return "encoder";
					break;
				case LABEL_TEST_OUTPUT_01:
					return "Test";
					break;
				case LABEL_TEST_OUTPUT_02:
					return "sorties";
					break;
				case LABEL_VISUAL_REGISTER_01:
					return "Visual";
					break;
				case LABEL_VISUAL_REGISTER_02:
					return "Registre";
					break;
				case LABEL_VISUAL_OSCILL_01:
					return "Visual";
					break;
				case LABEL_VISUAL_OSCILL_02:
					return "Oscilloscope";
					break;
				case LABEL_JOB_ARCHIVE_01:
					return "Archives";
					break;
				case LABEL_JOB_ARCHIVE_02:
					return "Travaux";
					break;
				case LABEL_FUNCTIONS:
					return "Fonctiones";
					break;
				case LABEL_PARAMETERS:
					return "Parameters";
					break;
				case LABEL_TESTS:
					return "Tests";
					break;
				case LABEL_SIMPLE_SETUP:
					return "setup simple";
					break;
				case LABEL_FULL_SETUP:
					return "setup complet";
					break;
				case LABEL_ALARM_ERR_ACCELERATION:
					return "Acceleration";
					break;
				case LABEL_ALARM_ERR_DECELERATION:
					return "Deceleration";
					break;
				case LABEL_ALARM_ERR_DOUBLE_MARK:
					return "double marque";
					break;
				case LABEL_AUTO_SHORT:
					return "Auto";
					break;
				case LABEL_MANUAL_SHORT:
					return "Manuel";
					break;
				case LABEL_MODE_LONG:
					return "circ:";
					break;
				case LABEL_MODE_TRANS:
					return "tras:";
					break;
				case LABEL_MODE_PULL:
					return "tens:";
					break;
				case LABEL_SAVE_JOB_01:
					return "Sauver";
					break;
				case LABEL_SAVE_JOB_02:
					return "Travail";
					break;
				case LABEL_LOAD_JOB_01:
					return "Charge";
					break;
				case LABEL_LOAD_JOB_02:
					return "Travail";
					break;
				case LABEL_TWIN_APPLICATION_01_01:
					return "Controle";
					break;
				case LABEL_TWIN_APPLICATION_01_02:
					return "Recto/Verso";
					break;
				case LABEL_TWIN_APPLICATION_02_01:
					return "Controle";
					break;
				case LABEL_TWIN_APPLICATION_02_02:
					return "Insetter";
					break;
				case LABEL_TWIN_APPLICATION_03_01:
					return "Controle";
					break;
				case LABEL_TWIN_APPLICATION_03_02:
					return "Coupé";
					break;
				case LABEL_TWIN_APPLICATION_04_01:
					return "Controle";
					break;
				case LABEL_TWIN_APPLICATION_04_02:
					return "Pli";
					break;
				case LABEL_TWIN_APPLICATION_05_01:
					return "Controle";
					break;
				case LABEL_TWIN_APPLICATION_05_02:
					return "Perforation";
					break;
				case LABEL_TWIN_APPLICATION_06_01:
					return "Controle";
					break;
				case LABEL_TWIN_APPLICATION_06_02:
					return "recto";
					break;
				case LABEL_TWIN_APPLICATION_07_01:
					return "Controle";
					break;
				case LABEL_TWIN_APPLICATION_07_02:
					return "verso";
					break;
				case LABEL_REGISTER_TWIN_APPLICATION_01:
					return "reperage recto/verso";
					break;
				case LABEL_REGISTER_TWIN_APPLICATION_02:
					return "reperage insetter";
					break;
				case LABEL_REGISTER_TWIN_APPLICATION_03:
					return "reperage coupe";
					break;
				case LABEL_REGISTER_TWIN_APPLICATION_04:
					return "reperage pli";
					break;
				case LABEL_REGISTER_TWIN_APPLICATION_05:
					return "reperage perforation";
					break;
				case LABEL_REGISTER_TWIN_APPLICATION_06:
					return "reperage recto";
					break;
				case LABEL_REGISTER_TWIN_APPLICATION_07:
					return "reperage verso";
					break;
				case LABEL_ENCODER_01_01:
					return "Encoder";
					break;
				case LABEL_ENCODER_01_02:
					return "1";
					break;
				case LABEL_ENCODER_02_01:
					return "Encoder";
					break;
				case LABEL_ENCODER_02_02:
					return "2";
					break;
				case LABEL_SELECT_APPLICATION_01:
					return "Selection";
					break;
				case LABEL_SELECT_APPLICATION_02:
					return "aplication";
					break;
				case LABEL_SELECT_ENCODER_01:
					return "Selection";
					break;
				case LABEL_SELECT_ENCODER_02:
					return "Encoder";
					break;
				case LABEL_SH_PN_01_01:
					return "Marque";
					break;
				case LABEL_SH_PN_01_02:
					return "Positive";
					break;
				case LABEL_SH_PN_02_01:
					return "Marque";
					break;
				case LABEL_SH_PN_02_02:
					return "Negatif";
					break;
				case LABEL_SELECT_SH_PN_01:
					return "Selection";
					break;
				case LABEL_SELECT_SH_PN_02:
					return "Marque P/N";
					break;
				case LABEL_TENSION_BASE_VALUE_01:
					return "Tension";
					break;
				case LABEL_TENSION_BASE_VALUE_02:
					return "Initial";
					break;
				case LABEL_SELECT_MM_01:
					return "Positions";
					break;			
				case LABEL_SELECT_MM_02:
					return "marque-marque";
					break;
				case LABEL_MM_POSITION_01_01:
					return "Positions MM";
					break;			
				case LABEL_MM_POSITION_01_02:
					return "reference";
					break;	
				case LABEL_MM_POSITION_02_01:
					return "Positions MM";
					break;			
				case LABEL_MM_POSITION_02_02:
					return "signal";
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
				case LABEL_MANUAL:
					return "manuale";
					break;
				case LABEL_AUTO:
					return "automatico";
					break;
				case LABEL_SPEED:
					return "velocita:";
					break;
				case LABEL_SPEED_SHORT:
					return "vel:";
					break;
				case LABEL_CYLINDER_SIZE:
					return "cilin:";
					break;
				case LABEL_MT_MIN:
					return "mt/min";
					break;
				case LABEL_MESSAGE:
					return "messaggio:";
					break;
				case LABEL_ALARM:
					return "allarme:";
					break;
				case LABEL_ALARM_ERR_NO_PRINT:
					return "Mancanza stampa";
					break;
				case LABEL_ALARM_ERR_LOW_SPEED:
					return "Velocita' bassa";
					break;
				case LABEL_ALARM_ERR_TEST_SH_01:
					return "Test testina";
					break;
				case LABEL_ALARM_ERR_TEST_SH_02:
					return "fallito";
					break;
				case LABEL_ALARM_ERR_TEST_ENC_01:
					return "Test encoder";
					break;
				case LABEL_ALARM_ERR_TEST_ENC_02:
					return "fallito";
					break;
				case LABEL_ALARM_ERR_PHASE_AUTO_01:
					return "Fasatura automatica";
					break;
				case LABEL_ALARM_ERR_PHASE_AUTO_02:
					return "fallita";
					break;
				case LABEL_ALARM_CYLINDER_TRAVEL_01:
					return "Sviluppo Cilindro (P1)";
					break;
				case LABEL_ALARM_CYLINDER_TRAVEL_02:
					return "non accettabile";
					break;
				case LABEL_ALARM_GATE_WINDOW_01:
					return "Ampiezza Gate (P3)";
					break;
				case LABEL_ALARM_GATE_WINDOW_02:
					return "non accettabile";
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
				case LABEL_PHASE_OSCILL:
					return "fasatura con oscilloscopio:";
					break;
				case LABEL_PHASE_FAST:
					return "fasatura a correzione rapida:";
					break;
				case LABEL_OSCILLOSCOPE:
					return "oscilloscopio:";
					break;
				case LABEL_REGISTER:
					return parametersGetValue(PARAM_RUNNING_MODE) == PARAM_RUNNING_MODE_MM ? "registro marca-marca:" : "registro marca-cilindro:" ;
					break;
				case LABEL_PHASE_CENTER_01:
					return "Azzeramento";
					break;
				case LABEL_PHASE_CENTER_02:
					return "errore";		
					break;					
				case LABEL_PHASE_MANUAL_01:
					return "Fasatura";
					break;
				case LABEL_PHASE_MANUAL_02:
					return "manuale";		
					break;
				case LABEL_PHASE_AUTO_01:
					return "Fasatura"; 	
					break;
				case LABEL_PHASE_AUTO_02:
					return "automatica"; 	
					break;
				case LABEL_PHASE_OSCILL_01:
					return "Fasatura ad"; 	
					break;
				case LABEL_PHASE_OSCILL_02:
					return "oscilloscop"; 	
					break;
				case LABEL_PHASE_FAST_01:
					return "Fasatura ad"; 	
					break;
				case LABEL_PHASE_FAST_02:
					return "acceleraz"; 	
					break;
				case LABEL_CYLINDER_TRAVEL_01:
					return "Sviluppo"; 	
					break;
				case LABEL_CYLINDER_TRAVEL_02:
					return "cilindro";
					break;
				case LABEL_ALARM_BOUND_01:
					return "Soglia";
					break;
				case LABEL_ALARM_BOUND_02:
					return "allarme";
					break;
				case LABEL_GATE_WINDOW_01:
					return "Ampiezza";
					break;
				case LABEL_GATE_WINDOW_02:
					return "gate";
					break;
				case LABEL_SW_VERSION_01:
					return "Versione";
					break;
				case LABEL_SW_VERSION_02:
					return "Software";
					break;
				case LABEL_OFFSET_DISTANCE_01:
					return "Distanza";
					break;
				case LABEL_OFFSET_DISTANCE_02:
					return "su offset";
					break;
				case LABEL_TEST_SH_01:
					return "Test";
					break;
				case LABEL_TEST_SH_02:
					return "testina";
					break;
				case LABEL_TEST_ENC_01:
					return "Test";
					break;
				case LABEL_TEST_ENC_02:
					return "encoder";
					break;
				case LABEL_TEST_OUTPUT_01:
					return "Test";
					break;
				case LABEL_TEST_OUTPUT_02:
					return "uscite";
					break;
				case LABEL_VISUAL_REGISTER_01:
					return "Visual";
					break;
				case LABEL_VISUAL_REGISTER_02:
					return "Registro";
					break;
				case LABEL_VISUAL_OSCILL_01:
					return "Visual";
					break;
				case LABEL_VISUAL_OSCILL_02:
					return "Oscilloscop";
					break;
				case LABEL_JOB_ARCHIVE_01:
					return "Archivio";
					break;
				case LABEL_JOB_ARCHIVE_02:
					return "Lavori";
					break;
				case LABEL_FUNCTIONS:
					return "Funzioni";
					break;
				case LABEL_PARAMETERS:
					return "Parametri";
					break;
				case LABEL_TESTS:
					return "Tests";
					break;
				case LABEL_SIMPLE_SETUP:
					return "setup semplice:";
					break;
				case LABEL_FULL_SETUP:
					return "setup completo:";
					break;
				case LABEL_ALARM_ERR_ACCELERATION:
					return "Accelerazione";
					break;
				case LABEL_ALARM_ERR_DECELERATION:
					return "Decelerazione";
					break;
				case LABEL_ALARM_ERR_DOUBLE_MARK:
					return "Segno doppio";
					break;
				case LABEL_AUTO_SHORT:
					return "Auto";
					break;
				case LABEL_MANUAL_SHORT:
					return "Manual";
					break;
				case LABEL_MODE_LONG:
					return "Long:";
					break;
				case LABEL_MODE_TRANS:
					return "Tras:";
					break;
				case LABEL_MODE_PULL:
					return "Tiro:";
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
				case LABEL_TWIN_APPLICATION_01_01:
					return "Controllo";
					break;
				case LABEL_TWIN_APPLICATION_01_02:
					return "Bianca/Volta";
					break;
				case LABEL_TWIN_APPLICATION_02_01:
					return "Controllo";
					break;
				case LABEL_TWIN_APPLICATION_02_02:
					return "Ripassaggio";
					break;
				case LABEL_TWIN_APPLICATION_03_01:
					return "Controllo";
					break;
				case LABEL_TWIN_APPLICATION_03_02:
					return "Taglio";
					break;
				case LABEL_TWIN_APPLICATION_04_01:
					return "Controllo";
					break;
				case LABEL_TWIN_APPLICATION_04_02:
					return "Piega";
					break;
				case LABEL_TWIN_APPLICATION_05_01:
					return "Controllo";
					break;
				case LABEL_TWIN_APPLICATION_05_02:
					return "Perforazione";
					break;				
				case LABEL_TWIN_APPLICATION_06_01:
					return "Controllo";
					break;				
				case LABEL_TWIN_APPLICATION_06_02:
					return "bianca";
					break;				
				case LABEL_TWIN_APPLICATION_07_01:
					return "Controllo";
					break;				
				case LABEL_TWIN_APPLICATION_07_02:
					return "volta";
					break;	
				case LABEL_REGISTER_TWIN_APPLICATION_01:
					return "registro bianca/volta:";
					break;
				case LABEL_REGISTER_TWIN_APPLICATION_02:
					return "registro ripassaggio:";
					break;
				case LABEL_REGISTER_TWIN_APPLICATION_03:
					return "registro taglio:";
					break;
				case LABEL_REGISTER_TWIN_APPLICATION_04:
					return "registro piega:";
					break;
				case LABEL_REGISTER_TWIN_APPLICATION_05:
					return "registro perforazione:";
					break;
				case LABEL_REGISTER_TWIN_APPLICATION_06:
					return "registro bianca:";
					break;
				case LABEL_REGISTER_TWIN_APPLICATION_07:
					return "registro volta:";
					break;
				case LABEL_ENCODER_01_01:
					return "Encoder";
					break;
				case LABEL_ENCODER_01_02:
					return "1";
					break;
				case LABEL_ENCODER_02_01:
					return "Encoder";
					break;
				case LABEL_ENCODER_02_02:
					return "2";
					break;					
				case LABEL_SELECT_APPLICATION_01:
					return "Selezione";
					break;
				case LABEL_SELECT_APPLICATION_02:
					return "applicaz.";
					break;
				case LABEL_SELECT_ENCODER_01:
					return "Selezione";
					break;
				case LABEL_SELECT_ENCODER_02:
					return "Encoder";
					break;
				case LABEL_SH_PN_01_01:
					return "Marca";
					break;
				case LABEL_SH_PN_01_02:
					return "Positiva";
					break;
				case LABEL_SH_PN_02_01:
					return "Marca";
					break;
				case LABEL_SH_PN_02_02:
					return "Negativa";
					break;
				case LABEL_SELECT_SH_PN_01:
					return "Selezione";
					break;
				case LABEL_SELECT_SH_PN_02:
					return "Segno P/N";
					break;							
				case LABEL_TENSION_BASE_VALUE_01:
					return "Tiro";
					break;
				case LABEL_TENSION_BASE_VALUE_02:
					return "Iniziale";
					break;
				case LABEL_SELECT_MM_01:
					return "Posizione";
					break;			
				case LABEL_SELECT_MM_02:
					return "marca-marca";
					break;			
				case LABEL_MM_POSITION_01_01:
					return "Posizione MM";
					break;			
				case LABEL_MM_POSITION_01_02:
					return "riferimento";
					break;	
				case LABEL_MM_POSITION_02_01:
					return "Posizione MM";
					break;			
				case LABEL_MM_POSITION_02_02:
					return "segnale";
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
		case PARAM_LANGUAGE_DE: //Deutch
			return mc_arstrSetupLabelsDE[a_byIndex];
			break;
		case PARAM_LANGUAGE_ES: //Spanish
			return mc_arstrSetupLabelsES[a_byIndex];
			break;
		case PARAM_LANGUAGE_FR: //French
			return mc_arstrSetupLabelsFR[a_byIndex];
			break;
		default:  	//PARAM_LANGUAGE_IT - Italian
			return mc_arstrSetupLabelsIT[a_byIndex];
			break;
	}
}
