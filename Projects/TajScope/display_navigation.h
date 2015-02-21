#ifndef DISPLAY_NAVIGATION_H
	#define DISPLAY_NAVIGATION_H
	
/*****************************************************************************/
// Constant declaration
/*****************************************************************************/
	static const unsigned char mc_strReset[] 					= DISPLAY_MSG_RESET; //DISPLAY_MSG_RESET_KEY;
	static const unsigned char mc_strRecClear[] 				= DISPLAY_STEP_RECCLEAR;
	static const unsigned char mc_strRectMenu[] 				= DISPLAY_STEP_RECTMENU;

	static const unsigned char mc_strGphModeAuto[] 				= DISPLAY_STEP_GPHMODEAUTO;
	static const unsigned char mc_strGphModeManual[] 			= DISPLAY_STEP_GPHMODEMANUAL;
	static const unsigned char mc_strGphModePause[] 			= DISPLAY_STEP_GPHMODEPAUSE;
	static const unsigned char mc_strGphModeOff[] 				= DISPLAY_STEP_GPHMODEOFF;
	
	static const unsigned char mc_strGphScrollDown[] 			= DISPLAY_STEP_GPHSCROLLDOWN;
	static const unsigned char mc_strGphScrollUp[] 				= DISPLAY_STEP_GPHSCROLLUP;
	static const unsigned char mc_strGphUp[] 					= DISPLAY_STEP_GPHUP;
	static const unsigned char mc_strGphDown[] 					= DISPLAY_STEP_GPHDOWN;
	
	static const unsigned char mc_strRecMain[]					= DISPLAY_STEP_RECMAIN;
	static const unsigned char mc_strRecMainSecFull[]			= DISPLAY_STEP_RECMAINSEC_FULL;
	static const unsigned char mc_strRecMainSecNoPh[]			= DISPLAY_STEP_RECMAINSEC_NOPH;

	static const unsigned char mc_strPosMainLabel[][] 			= {DISPLAY_STEP_POSMAINLABEL, 		DISPLAY_STEP_POSMAINLABELSEC, 			DISPLAY_STEP_POSMAINLABELTHIRD};
	static const unsigned char mc_strPosMainValue[][] 			= {DISPLAY_STEP_POSMAINVALUE, 		DISPLAY_STEP_POSMAINVALUESEC, 			DISPLAY_STEP_POSMAINVALUETHIRD};
	static const unsigned char mc_strPosMainValueLittle[][]		= {DISPLAY_STEP_POSMAINVALUELITTLE, DISPLAY_STEP_POSMAINVALUELITTLESEC,  	DISPLAY_STEP_POSMAINVALUELITTLETHIRD};

	static const unsigned char mc_strLogo[]						= DISPLAY_STEP_MSGLOGO;
	static const unsigned char mc_strVersion[] 					= DISPLAY_STEP_MSGVERSION;

#endif