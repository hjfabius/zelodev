#ifndef _grabif
	#define _grabif


//***************************************************************************
//                                 Includes
//***************************************************************************
	#include <iostream.h>
	#include <fstream.h>
	#include "hjStruct.h"
	#include "../include/mv.h"
	#ifdef USE_CAMDEFS
		#include "../../camera/camtype.h>
	#endif



//***************************************************************************
//                                 Defines
//***************************************************************************
	#define _flagset(s, f)(((s)&(f)) != 0)
	#define _flagclear(s, f)(!_flagset(s, f))
	#define _odsm(x, p) printf p; printf("\n")

	#define MB					(1024 * 1024)
	#define BUFFER_SIZE			(1 * MB)

	#define MAX_NUM_BUFFERS		4
	#define SNAP_TIMEOUT		3000
	#define INHIBIT_DISPLAY		0x0001





//***************************************************************************
//                                 Variables
//***************************************************************************

	
	extern ofstream		outMsg;


//***************************************************************************
//                                 Methods
//***************************************************************************

	TGrabber	*OpenGrabber( char *inifile);

	void		WhiteBalance (TGrabber *grabber, int *r_val, int *g_val, int *b_val);

	int			PrepareLive ( TGrabber *grabber, TLiveMode livemode,
								int x, int y, int w, int h,
								int fpf, int scale, int vidmod, int gain, int shutter ) ;

	int			Live ( TGrabber *grabber, int frames, int flags = 0 ) ;

	int			CloseGrabber ( TGrabber *grabber ) ;

	void		SetNumAsyncBuffer ( int buffers ) ;

	int			CheckError(DEV_T *dev, char *mesg, BOOL printifok);

	int			wait_for_input(int fd, int maxwait_sec);

	void		ShowImage(TGrabber *grabber, int dispwidth, int dispheight, int bypp, 
						BYTE *buffer = NULL, int bufferpitch = 0);
	
	void		Print(char * str) ;

	void		InitFileMsg();

	void		CloseFileMsg();


extern "C" unsigned osDisplayInfo(LP_DisplayInfo dispinfo, unsigned short spec);


#endif // _grabif



