/***************************************************************************
                          hjLuma.cpp  -  description
                             -------------------
    copyright            : Fabio Cristini
    email                : fabio.cristini@fastwebnet.it

 ***************************************************************************/

//***************************************************************************
//                                 Includes
//***************************************************************************

#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/time.h>
#include <time.h>
#include <sys/types.h>
#include <math.h>

#ifdef USE_CAMDEFS
	#include <camera/camtype.h>
#endif

#include "stopwatch.h"
#include "hjLuma.h"
#include "grabif.h"
#include "../include/mv.h"
#include "hjTrace.h"
#include "hjBlob.h"
#include "hjKeyboard.h"
#include "hjGUI.h"
#include "hjFont.h"
#include "hjColors.h"


//***************************************************************************
//                                 Defines
//***************************************************************************
	#define TITAN_INI_FILENAME		"hjTitan.ini"
	#define ENABLE_WAIT_PROXIMITY	0

//***************************************************************************
//                                 Variables
//***************************************************************************

	TGrabber	*hjTGrabber;
	DEV_T		*hjDev;
	int			mc_iDefaultShutter = 50000; //DWORD in microseconds
	int			m_iIsGrabberOpen   = -1;
	int			m_iSearchWidth	   = 1024;
	hjPatterns	m_oPatterns;	

//***************************************************************************
//                                 Methods
//***************************************************************************

int hjInitApp()
{
	hjInitTrace();

	if (hjInitAppIniFile(&m_oPatterns) == 0)
	{
		hjTrace("Patterns set and written");
	}
	else
	{
		hjTrace("Error reading or writing Patterns");
		return -1;
	}

	m_iIsGrabberOpen = hjOpenGrabber();

	return m_iIsGrabberOpen;
}

int hjCloseApp()
{
	int iRes = 0;

	if (m_iIsGrabberOpen == 0)
	{
		iRes = hjCloseGrabber();
	}

	hjEndTrace();

	return iRes;
}

int	hjOpenGrabber()
{

	if ( (hjTGrabber=OpenGrabber(TITAN_INI_FILENAME))!=NULL )
	{
		//Ok
		hjDev = hjTGrabber->dev;
		
		hjTrace("Grabber opened");

		return 0;
	}
	else
	{
		hjTrace("Error opening grabber.");
		//Error
		return -1;
	}

}


int	hjCloseGrabber()
{
	return CloseGrabber(hjTGrabber);
}



int	hjInitCamera  (int x, int y, int w, int h,
					int fpf, int scale, int vidmod, int gain, int shutter, bool bayer )
{
	int r_val, g_val, b_val;


	if (shutter > 0)
	{
		mc_iDefaultShutter = shutter;
	}
	else
	{
		shutter = mc_iDefaultShutter;
	}

	hjTraceN("hjPrepareLive - X = ", x);
	hjTraceN("hjPrepareLive - Y = ", y);
	hjTraceN("hjPrepareLive - Width = ", w);
	hjTraceN("hjPrepareLive - Heigth = ", h);
	hjTraceN("hjPrepareLive - Shutter = ", shutter);
	hjTraceN("hjPrepareLive - Gain = ", gain);

	if (bayer)
	{
		PrepareLive(hjTGrabber, lmSoft, x, y, w, h, fpf, scale, vidmod, gain, shutter);
		hjWhiteBalance (&r_val, &g_val, &b_val);
		hjWhiteBalance (&r_val, &g_val, &b_val);
		hjWhiteBalance (&r_val, &g_val, &b_val);
		hjWhiteBalance (&r_val, &g_val, &b_val);
		hjWhiteBalance (&r_val, &g_val, &b_val);
		hjWhiteBalance (&r_val, &g_val, &b_val);
		hjWhiteBalance (&r_val, &g_val, &b_val);
	}


	return PrepareLive(hjTGrabber, lmSoft, x, y, w, h, fpf, scale, vidmod, gain, shutter);
}


void hjWhiteBalance (int *r_val, int *g_val, int *b_val)
{
	WhiteBalance(hjTGrabber, r_val, g_val, b_val);
	hjTraceN("hjWhiteBalance - Red = ", *r_val);
	hjTraceN("hjWhiteBalance - Green = ", *g_val);
	hjTraceN("hjWhiteBalance - Blu = ", *b_val);
}

//-----------------------------------------------------------------------------
void hjWaitProximity(int iProxyIndex)
{
	DWORD		digIn	= 0x00000000UL;
	unsigned	iValue	= 0;

	if (ENABLE_WAIT_PROXIMITY == 1)
	{
		if (iProxyIndex>=0)
		{
			iValue = 2^iProxyIndex;
			
			while (digIn != iValue)
			{
				digIn = mvReadDigIO(hjDev);
			}
		}
	}
}


//-----------------------------------------------------------------------------
void hjStroboLamp()
{
	DWORD digOut;  //Strobo Flag

	digOut = (DWORD) 1;
	mvWriteDigIO(hjDev, digOut);
	usleep(1);
	
	digOut = (DWORD) 0;
	mvWriteDigIO(hjDev, digOut);
	//usleep(1);

}


//-----------------------------------------------------------------------------
// Return 0 if ok, otherwise -1 
int hjSingleSnap(int iWaitProx, int iStrobo, int iShutter)
{
	int iError = 0;

	if (iShutter == 0)
	{
		iShutter = mc_iDefaultShutter;
	}
	mvSetShutter(hjDev, 256, iShutter);


	hjWaitProximity(iWaitProx);


	if(iStrobo > 0)
	{
		hjStroboLamp();
	}

	mvSingleSnap(hjDev, SNAP_TIMEOUT);
	if ((iError = CheckError(hjDev, "single snap", FALSE)) == NO_ERR)
	{
		return 0;
	}
	else
	{
		//printf(" *** fail, error = %d\n", error);
		return -1;
	}
}



//-----------------------------------------------------------------------------
int hjLive(int frames, int flags)
{
	static struct	timeval start_tv;	
	TDisplayInfo	DisplayInfo;
	int				frame		= 0;
	int				iWait		= 1;
	int				iStrobo		= 1;
	int				iError		= 0;


	if (frames >= 0)
	{	// valid number of frames
		osDisplayInfo(&DisplayInfo, 0);
		
		StartTimer(&start_tv);
	
		if (frames >0)
		{
			hjTraceN("hjLive - Frames = ", frames);
			for (frame = 0; frame < frames && wait_for_input(0, 0) == 0; frame++)
			{
				iError = hjSingleSnap(iWait, iStrobo, 0);
				if (iError == 0 )
				{
					if (_flagclear(flags, INHIBIT_DISPLAY))
					{
						ShowImage(hjTGrabber, DisplayInfo.Width, DisplayInfo.Height, DisplayInfo.BytesPerPixel);
					}
				}
				else
				{
					break;
				}
			}
		}
		else
		{
			hjTrace("hjLive - Waiting for Input");
			while (wait_for_input(0, 0) == 0)
			{
				iError = hjSingleSnap(iWait, iStrobo, 0);
				if (iError == 0 )
				{
					if (_flagclear(flags, INHIBIT_DISPLAY))
					{
						ShowImage(hjTGrabber, DisplayInfo.Width, DisplayInfo.Height, DisplayInfo.BytesPerPixel);
					}
				}
				else
				{
					break;
				}
			}
		}

		TimerMessage(&start_tv, "frame", frame);
	}
	return iError;
}

//-----------------------------------------------------------------------------
int hjMain()
{
	static struct	timeval start_tv;	
	TDisplayInfo	DisplayInfo;
	int				iStrobo		= 1;
	int				iError		= 0;
	int				iExit		= 0;
	int				iOldState	= 0;

	osDisplayInfo(&DisplayInfo, 0);
	
	StartTimer(&start_tv);

	hjTrace("hjMain");
	
	hjInitFont(hjDev);

	iError = hjSingleSnap(-1, iStrobo, 0);
	if(iError == 0)
	{
		hjWriteIdleInterace(hjDev); 
		ShowImage(hjTGrabber, DisplayInfo.Width, DisplayInfo.Height, DisplayInfo.BytesPerPixel);
	}

	while ((iError == 0) && (iExit == 0))
	{
		switch (hjGetCh()) 
		{
			case '1': 
				hjTrace("hjMain - Pattern 1");
				iError = hjSingleSnap(0, iStrobo, 0);
				if ((iError == 0) && (hjAnalysis(&(m_oPatterns.Pattern[0])) == 0))
				{
					hjPrintString("PATTERN 1", 10, 10, HJ_COLOR_CUSTOM_FOREGROUND_IMAGE_TITLE, true);
					hjPaintRegisterMarks(&(m_oPatterns.Pattern[0]));
					ShowImage(hjTGrabber, DisplayInfo.Width, DisplayInfo.Height, DisplayInfo.BytesPerPixel);
				}
				iOldState = 1;
				break;
			case '2': 
				hjTrace("hjMain - Pattern 2");
				iError = hjSingleSnap(1, iStrobo, 0);
				if ((iError == 0) && (hjAnalysis(&(m_oPatterns.Pattern[1])) == 0))
				{
					hjPrintString("PATTERN 2", 10, 10, HJ_COLOR_CUSTOM_FOREGROUND_IMAGE_TITLE, true);
					hjPaintRegisterMarks(&(m_oPatterns.Pattern[1]));
					ShowImage(hjTGrabber, DisplayInfo.Width, DisplayInfo.Height, DisplayInfo.BytesPerPixel);
				}
				iOldState = 2;
				break;
			case '3': 
				hjTrace("hjMain - Image 1");
				if (iOldState != 3)
				{
					hjWriteInterface(hjDev, "Pattern 1", &m_oPatterns.Pattern[0]);
					iOldState = 3;
				}
				else
				{
					hjWriteIdleInterace(hjDev); 
					iOldState = -3;
				}
				ShowImage(hjTGrabber, DisplayInfo.Width, DisplayInfo.Height, DisplayInfo.BytesPerPixel);
				break;
			case '4': 
				hjTrace("hjMain - Image 2");
				if (iOldState != 4)
				{
					hjWriteInterface(hjDev, "Pattern 2", &m_oPatterns.Pattern[1]);
					iOldState = 4;
				}
				else
				{
					hjWriteIdleInterace(hjDev); 
					iOldState = -4;
				}
				ShowImage(hjTGrabber, DisplayInfo.Width, DisplayInfo.Height, DisplayInfo.BytesPerPixel);
				break;
			case 27: 
				hjTrace("hjMain - Exit with ESC");
				iExit = -1;
				break;
			case '7': //Halt
				hjTrace("hjMain - Exit with F6");
				iOldState = 7;
				break;
			case 'a': //Anticipo
				hjTrace("hjMain - Advance with A");
				hjSendError('a', 1);
				iOldState = 100;
				break;
			case 'r': //Ritardo
				hjTrace("hjMain - Delay with R");
				hjSendError('r', 2);
				iOldState = 200;
				break;
			case 't': //Traversa
				hjTrace("hjMain - Crosspiece with T");
				hjSendError('t', 3);
				iOldState = 300;
				break;
			case 'o': //operatore
				hjTrace("hjMain - Operator with O");
				hjSendError('o', 4);
				iOldState = 400;
				break;
			default:  
				break;
		}
	}	
	

	TimerMessage(&start_tv, "frame", 0);

	return iError;
}

int hjSendError(char cDirection, int iMicroSeconds)
{
	DWORD		digOut;  
	timespec	t;
	timespec	t1;

	t.tv_sec = (time_t) 0 ;
	t.tv_nsec = (long) iMicroSeconds;   //1 microsecond


	switch (cDirection) 
	{
		case 'a': //Anticipo  bit 4 = 2^4 = 16
			digOut = (DWORD) 16;
			break;
		case 'r': //Ritardo   bit 5 = 2^5 = 32
			digOut = (DWORD) 32;
			break;
		case 't': //Traversa  bit 6 = 2^5 = 64
			digOut = (DWORD) 64;
			break;
		case 'o': //operatore bit 7 = 2^5 = 128
			digOut = (DWORD) 128;
			break;
		default:  
			digOut = (DWORD) 0;
			break;
	}

	digOut = digOut | MVCAM_LED_FLAG;
	mvWriteDigIO(hjDev, digOut);

	//usleep(iMicroSeconds); //milliseconds
	nanosleep(&t, &t1);	//microseconds
	
	digOut = (DWORD) 0 | MVCAM_LED_FLAG;;
	mvWriteDigIO(hjDev, digOut);

	//struct timespec t, t1;
	//t.tv_sec = 0;
    //t.tv_nsec = 1000;
	//nanosleep(&t, &t1);



	//struct timespec 
	//{
	//	time_t  tv_sec;         /* seconds */
	//	long    tv_nsec;        /* nanoseconds */
	//};

        //struct sched_param p;
        //p . sched_priority = 1;
        //pthread_setschedparam (pthread_self(), SCHED_FIFO, &p);

	return 0; 
}


//-----------------------------------------------------------------------------
int hjAnalysis(hjPattern * oPattern)
{
	int			iRes = 0;
	hjMatrix  	iMatrix;
	hjUnit		* oUnit;

	hjTrace("hjAnalysis");

	iMatrix.Height = mc_iImageHeight;
	iMatrix.Width = mc_iImageWidth;
	iRes = hjCreateMatrix(oPattern, &iMatrix);
	//iRes = hjCreateFullMatrix(&iMatrix);

	if (iRes == 0)
	{
		hjTraceN("hjAnalysis - Analysing NumUnit:", oPattern->iNumUnit);
		for(int i=0; i<oPattern->iNumUnit; i++)
		{
			oUnit = &(oPattern->Unit[i]);
			hjTraceN("hjAnalysis - Analyizing Unit ", i);

			hjHorizAnalysis(&iMatrix, oPattern->iSearchLength, oUnit->IdealPos.XPos, oUnit->IdealPos.YPos, &(oUnit->RealPos.XPos));
			hjVertAnalysis (&iMatrix, oPattern->iSearchLength, oUnit->IdealPos.XPos, oUnit->IdealPos.YPos, &(oUnit->RealPos.YPos));

			oUnit->ErrorPos.XPos = oUnit->IdealPos.XPos - oUnit->RealPos.XPos;
			oUnit->ErrorPos.YPos = oUnit->IdealPos.YPos - oUnit->RealPos.YPos;

			hjTraceN("hjAnalysis - Analyized Unit ", i);

		}
		return 0;
	}
	else
	{
		hjTrace("hjAnalysis - Error");
		return iRes;
	}


}

//-----------------------------------------------------------------------------
int hjHorizAnalysis(hjMatrix *iMatrix, int iSearchLength, int iIdealX, int iIdealY, int *iRealX)
{
	float	fXValue[m_iSearchWidth];
	float	fXValueMax		= -1000000.0;
	float   fXValueMin		= +1000000.0;
	float	fCurrentValue	= 0.0;
	int		iXMax			= 0;
	int		iXMin			= 0;
	int		iX				= 0;
	int		iY				= 0;

	for(iX= (iIdealX - (iSearchLength/2)); iX<(iIdealX + (iSearchLength/2)); iX++)
	{
		fXValue[iX] = 0.0;
		
		for(iY= (iIdealY - (iSearchLength/2)); iY<(iIdealY + (iSearchLength/2)); iY++)
		{
			fXValue[iX] += (float) iMatrix->Pixel[iX][iY];
		}
	}
	for(iX= (iIdealX - (iSearchLength/2)) +2 ; iX<(iIdealX + (iSearchLength/2)) - 2; iX++)
	{
		fCurrentValue = fXValue[iX - 2] + fXValue[iX - 1] - fXValue[iX+1] - fXValue[iX+2];

		if (fCurrentValue>fXValueMax)
		{
			iXMax = iX;
			fXValueMax = fCurrentValue;
		}

		if (fCurrentValue<fXValueMin)
		{
			iXMin = iX;
			fXValueMin = fCurrentValue;
		}
	}


	*iRealX = (int) ((iXMin + iXMax) * 0.5);
	return 0;
}



//-----------------------------------------------------------------------------
int hjVertAnalysis(hjMatrix *iMatrix, int iSearchLength, int iIdealX, int iIdealY, int *iRealY)
{
	float	fYValue[m_iSearchWidth];
	float	fYValueMax		= -1000000.0;
	float   fYValueMin		= +1000000.0;
	float	fCurrentValue	= 0.0;
	int		iYMax			= 0;
	int		iYMin			= 0;
	int		iX				= 0;
	int		iY				= 0;


	for(iY= (iIdealY - (iSearchLength/2)); iY<(iIdealY + (iSearchLength/2)); iY++)
	{
		fYValue[iY] = 0.0;
		
		for(iX= (iIdealX - (iSearchLength/2)); iX<(iIdealX + (iSearchLength/2)); iX++)
		{
			fYValue[iY] += (float) iMatrix->Pixel[iX][iY];
		}
	}

	for(iY= (iIdealY - (iSearchLength/2)) +2 ; iY<(iIdealY + (iSearchLength/2)) - 2; iY++)
	{
		fCurrentValue = fYValue[iY - 2] + fYValue[iY - 1] - fYValue[iY+1] - fYValue[iY+2];

		if (fCurrentValue>fYValueMax)
		{
			iYMax = iY;
			fYValueMax = fCurrentValue;
		}

		if (fCurrentValue<fYValueMin)
		{
			iYMin = iY;
			fYValueMin = fCurrentValue;
		}
	}


	*iRealY = (int) ((iYMin + iYMax) * 0.5);

	return 0;
}



//-----------------------------------------------------------------------------
int hjCreateFullMatrix(hjMatrix *iMatrix)
{
	
	int			iX;
	int			iY;	

	hjTrace("hjCreateFullMatrix");

	for (iY = 0; iY < iMatrix->Height ; iY++)
	{
		for (iX = 0; iX < iMatrix->Width; iX++)
		{
			iMatrix->Pixel[iX][iY] = (int) mvReadPixel(hjDev,BS_YC_PL_Y, iX, iY);
		}
	}

	return 0;
}

//-----------------------------------------------------------------------------
int hjCreateMatrix(hjPattern * oPattern, hjMatrix *iMatrix)
{
	//float		fXValue;
	int			iX		= 0;
	int			iY		= 0;
	int			iXMin	= 0;
	int			iXMax	= 0;
	int			iYMin	= 0;
	int			iYMax	= 0;


	hjTrace("hjCreateMatrix");

	for(int i=0; i<oPattern->iNumUnit; i++)  
	{
		iXMin = (oPattern->Unit[i].IdealPos.XPos  - (oPattern->iSearchLength/2));
		if (iXMin < 0) iXMin = 0;

		iXMax = (oPattern->Unit[i].IdealPos.XPos  + (oPattern->iSearchLength/2));
		if (iXMax > iMatrix->Width) iXMax = iMatrix->Width;

		iYMin = (oPattern->Unit[i].IdealPos.YPos - (oPattern->iSearchLength/2));
		if (iYMin < 0) iYMin = 0;

		iYMax = (oPattern->Unit[i].IdealPos.YPos  + (oPattern->iSearchLength/2));
		if (iYMax > iMatrix->Height) iYMax = iMatrix->Height;

		for(iX= iXMin; iX<iXMax; iX++)
		{
			//fXValue = 0.0;
			
			for(iY= iYMin; iY<iYMax; iY++)
			{
				iMatrix->Pixel[iX][iY] = (int) mvReadPixel(hjDev,BS_YC_PL_Y, iX, iY);
				//fXValue += (float) iMatrix->Pixel[iX][iY];
			}

			//if 	(fXValue < 1000000.0)  //Usual value is 3.5-4 milion)
			//{
			//	hjTrace("hjCreateMatrix - Image is too dark");
			//	return -1;
			//}
		}
	}
	return 0;
}


//-----------------------------------------------------------------------------
int	hjFilterMatrix (hjMatrix *iInMatrix, hjMatrix *iOutMatrix)
{
	int iX;
	int iY;
	hjTrace("hjFilterMatrix");

	for (iY = 1; iY < (iInMatrix->Height -1); iY++)
	{
		for (iX = 1; iX < (iInMatrix->Width -1); iX++)
		{
			//medium of the nearest pixel

			iOutMatrix->Pixel[iX][iY] = (	iInMatrix->Pixel[iX-1][iY+1]	+
											iInMatrix->Pixel[iX]  [iY+1]	+	 
											iInMatrix->Pixel[iX+1][iY+1]	+
											iInMatrix->Pixel[iX-1][iY]		+
											iInMatrix->Pixel[iX]  [iY]		+
											iInMatrix->Pixel[iX+1][iY]		+
											iInMatrix->Pixel[iX-1][iY-1]	+
											iInMatrix->Pixel[iX]  [iY-1]	+
											iInMatrix->Pixel[iX+1][iY-1]  );
		}
	}

	return 0;
}


