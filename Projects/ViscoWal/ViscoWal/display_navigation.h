#ifndef DISPLAY_NAVIGATION_H
	#define DISPLAY_NAVIGATION_H
	
/*****************************************************************************/
// Constant declaration
/*****************************************************************************/
	
	
	#ifdef DISPLAY_DIRECT_KEYBOARD
		static const unsigned char mc_strReset[] 	= 			  { DISPLAY_RESET, DISPLAY_WAIT, /* Reset Display */ 
																	DISPLAY_CURSOR_POSITION, 0x00, 0x00, DISPLAY_WAIT, /* Set Cursor Home */ 
																	DISPLAY_CLEAR_AREA, 0x00, 0x00, 126, 64, DISPLAY_WAIT,  /* Clear Display */ 
																	DISPLAY_FUNCTION_SET_2, DISPLAY_ENABLE_KEY_SCANNING, DISPLAY_WAIT,  /*Enable Key Scanning*/ 
																	DISPLAY_FUNCTION_SET_2, DISPLAY_HEX_MODE_OFF, DISPLAY_WAIT,  /*Disable Hex Mode 96d = 60H */ 
																	DISPLAY_WRITE_MODE, 0x80,DISPLAY_WAIT,/* Set Vertical Write Mode */  
																	DISPLAY_EOF };
	#endif

	#ifdef DISPLAY_922_KEYBOARD
		static const unsigned char mc_strReset[] 	= 			  {	DISPLAY_RESET, DISPLAY_WAIT, /* Reset Display */ 
																	DISPLAY_CURSOR_POSITION, 0x00, 0x00, DISPLAY_WAIT, /* Set Cursor Home */ 
																	DISPLAY_CLEAR_AREA, 0x00, 0x00, 126, 64, DISPLAY_WAIT,  /* Clear Display */ 
																	DISPLAY_FUNCTION_SET_2, DISPLAY_ENABLE_IO_PORT, 0x9F, DISPLAY_WAIT,  /*Enable Line as input*/ 
																	DISPLAY_FUNCTION_SET_2, DISPLAY_SET_PORT_LINES, 0x9F,/*No pull-up on input*/ 
																	DISPLAY_FUNCTION_SET_2, DISPLAY_HEX_MODE_OFF, DISPLAY_WAIT,  /*Disable Hex Mode 96d = 60H */  
																	DISPLAY_WRITE_MODE, 0x80,DISPLAY_WAIT,/* Set Vertical Write Mode */  
																	DISPLAY_EOF };
	#endif
	
	static const unsigned char mc_strRecClear[] 				= { DISPLAY_CLEAR_AREA, 0x00, 0x00, 126, 64, DISPLAY_WAIT, DISPLAY_EOF };
	
	static const unsigned char mc_strLogo[]						= {	DISPLAY_SELECT_FONT_10x14, DISPLAY_WAIT,  
																	DISPLAY_CURSOR_POSITION, 0x9, 0x2B, DISPLAY_WAIT,
																	'V','i','s','c','o','W','a','l',DISPLAY_WAIT,    
																	DISPLAY_CURSOR_POSITION, 0x5, 0x12, DISPLAY_WAIT,
																	'z','e','l','o', DISPLAY_WAIT,    
																	DISPLAY_SELECT_FONT_5x7, DISPLAY_WAIT,
																	DISPLAY_CURSOR_POSITION, 0x36, 0x12, DISPLAY_WAIT,
																	'e','l','e','t','t','r','o','n','i','c','a', DISPLAY_WAIT,    
																	DISPLAY_INVERT_AREA, 1, 1, 126, 21, DISPLAY_WAIT,
																	DISPLAY_EOF};
																	
	static const unsigned char mc_strVersion[] 					= {	DISPLAY_SELECT_FONT_MINI, DISPLAY_WAIT, /*version pos*/
																	DISPLAY_CURSOR_POSITION, 0x42,0x3E, DISPLAY_WAIT,
																	'v',' ','X','.','X','X','-','y','y','y', DISPLAY_WAIT,  
																	DISPLAY_EOF};

#endif