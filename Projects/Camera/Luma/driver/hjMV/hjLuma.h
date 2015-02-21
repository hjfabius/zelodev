#ifndef _hjLuma

	#define _hjLuma

//***************************************************************************
//                                 Include
//***************************************************************************

	#include "hjStruct.h"


//***************************************************************************
//                                 Methods
//***************************************************************************
	int			hjInitApp			();
	int			hjCloseApp			();
	int			hjOpenGrabber		();
	int			hjCloseGrabber		();
	int			hjInitCamera		(int x, int y, int w, int h,
										int fpf, int scale, int vidmod, int gain, int shutter, bool bayer);
	void		hjWhiteBalance		(int *r_val, int *g_val, int *b_val);
	void		hjWaitProximity		(int iProxyIndex);
	void		hjStroboLamp		();
	// Return 0 if ok, otherwise -1 
	int			hjSingleSnap		(int iWaitProx, int iStrobo, int iShutter); 
	int			hjLive 				(int frames, int flags = 0);
	int			hjMain				();
	int			hjSendError			(char cDirection, int iMicroSeconds);
	int			hjAnalysis			(hjPattern * oPattern);
	int			hjCreateMatrix		(hjPattern * oPattern, hjMatrix *iMatrix);
	int			hjCreateFullMatrix	(hjMatrix *iMatrix);
	//int			hjFilterMatrix		(hjMatrix *iInMatrix, hjMatrix *iOutMatrix);
	int			hjHorizAnalysis		(hjMatrix *iMatrix, int iSearchLength, int iIdealX, int iIdealY, int *iRealX);
	int			hjVertAnalysis		(hjMatrix *iMatrix, int iSearchLength, int iIdealX, int iIdealY, int *iRealY);



#endif // _hjLuma



