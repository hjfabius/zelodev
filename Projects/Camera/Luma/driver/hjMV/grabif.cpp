/***************************************************************************
                          grabin.cpp  -  description
                             -------------------
    copyright            : Fabio Cristini
    email                : fabio.cristini@fastwebnet.it

 ***************************************************************************/


//***************************************************************************
//                                 Includes
//***************************************************************************
#include <iostream.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/time.h>
#include <sys/wait.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#include "stopwatch.h"
#include "grabif.h"



//***************************************************************************
//                                 Defines
//***************************************************************************
#define USE_CAMDEFS

#ifdef USE_CAMDEFS
	#include "../../camera/camtype.h"
#endif

#define GTDEBUG 				1
#define SET_VIDEO_TIMING		0

// field selection options in case of single field capturing
#define INI_FILE			"mv.ini"
#define TRIG_MODE			3	// 1/2 : odd/even? field, 3 : both fields
#define TOGGLE_FIELDS		0	// 1 : toggle odd/even for diff. grabbers


//***************************************************************************
//                                 Variables
//***************************************************************************
static		TGrabber		*GrabberList = NULL;

			unsigned		NumGrabbers  = 0;

			int				NumBuffers = 3;

//***************************************************************************
//                                 Methods
//***************************************************************************
int wait_for_input(int fd, int maxwait_sec)
/* stdin : fd = 0 */
{
    fd_set rfds;
    struct timeval tv;
	
    FD_ZERO(&rfds);
    FD_SET(fd, &rfds);
	
    tv.tv_sec = maxwait_sec;
    tv.tv_usec = 0;
	
    return select(1, &rfds, NULL, NULL, &tv);
}


//-----------------------------------------------------------------------------
int CheckError(DEV_T *dev, char *mesg, BOOL printifok)
{
	int error = GetErr(dev);
	if (error == NO_ERR)
	{
		if (printifok)
			printf("- %s ok !\n", mesg);
		return NO_ERR;
	}
	else
	{
		printf("* %s, error %d = %s\n", mesg , error, GetErrStr(dev));
		return error;
	}
}

//-----------------------------------------------------------------------------
int min(int a, int b)  { return a < b ? a : b; }

//-----------------------------------------------------------------------------
void ShowImage(TGrabber *grabber, int dispwidth, int dispheight, int bypp,
				 BYTE *buffer = NULL, int bufferpitch = 0)
{
	DEV_T *dev = grabber->dev;
	int y, x1, y1;
	BYTE *p;
	BYTE *display;
	int disppitch = dispwidth * bypp;
	
//#if GTDEBUG
//	printf("acqdef = %d x %d x %d fpf, buffer=%p, pitch=%d\n",
//		grabber->AcqDef.xsize[0], grabber->AcqDef.ysize[0],
//		grabber->AcqDef.fields_per_frame,
//		buffer, bufferpitch);
//#endif
	y1 = min(grabber->AcqDef.fields_per_frame * grabber->AcqDef.ysize[0], dispheight);
	x1 = min(grabber->AcqDef.xsize[0], dispwidth);
	display = dev->SegMemAddress[MI_VGA];
//#if GTDEBUG
//	printf("display : %d x %d x %d at %p, img = %p\n",
//		x1, y1, bypp, display,
//		mvGetRowAdr(dev, 0, 0));
//#endif
	
	if (buffer == NULL)
	{
		buffer =((BYTE *)mvGetRowAdr(dev, 0, 0));
		bufferpitch =((BYTE *)mvGetRowAdr(dev, 0, 1)) - buffer;
	}
	
	for (p = buffer, y = 0; y < y1; y++, p += bufferpitch)
	{
		//		for ( int x = 0; x < x1; x++ )
		//			*display++ = (BYTE)x ;
		memcpy(display, p, bypp * x1);
		display += disppitch;
	}
}


void setBayer(TGrabber *grabber, int red, int green, int blue, int gain)
{
	char string[64];
	
	sprintf(string, "SetBayerMosaikCoeff %d %d %d %d", red, green, blue, gain);
	mvInterpretString(grabber->dev, (unsigned char *)string);
	CheckError(grabber->dev, "mvInterpretString", FALSE);
}

//#define BLOCKSIZE  100L	// Größe des Blockes
//#define BLOCKSIZE_QUAD (BLOCKSIZE * BLOCKSIZE)

void WhiteBalance(TGrabber *grabber, int *r_val, int *g_val, int *b_val)
{
	DEV_T *dev = grabber->dev;
	
	if ((dev->Glob->DevType & 0xf0) == DEV_TITANx)
	{
		DWORD* pdata;
		int i = 0;
		int k = 0;
		long r, g, b;
		long BLOCKSIZE = 100;
		long BLOCKSIZE_QUAD;
		int ystart;
		int xstart;
		int ystop;
		int xstop;
		int r_average;
		int g_average;
		int b_average;
		int m;
		Tcolor *pcolorpixel;
		int oldColorMode;
		int m_maxysize, m_maxxsize;
		int m_bayerred = 128, m_bayergreen = 128, m_bayerblue = 128;
		
		BLOCKSIZE_QUAD = BLOCKSIZE * BLOCKSIZE;
		setBayer(grabber, m_bayerred, m_bayergreen, m_bayerblue, 7);
		oldColorMode = mvSelColorMode(dev, NO_CHANGE);
#if GTDEBUG
		printf("Old colour mode = %d\n", oldColorMode);
#endif
		mvSelColorMode(dev, COL_RGB24);
		CheckError(dev, "mvSelColorMode", FALSE);
#if GTDEBUG
		printf("New colour mode = %d\n", COL_RGB24);
#endif
		mvGetAcquireDef(dev, &grabber->AcqDef);
		m_maxxsize = grabber->AcqDef.xsize[0];
		m_maxysize = grabber->AcqDef.ysize[0];
		
#if GTDEBUG
		printf("width=%d, height=%d\n", m_maxxsize, m_maxysize);
#endif
		r = g = b = 0;
		
		ystart =(m_maxysize - BLOCKSIZE)/2;
		xstart =(m_maxxsize - BLOCKSIZE)/2;
		ystop = ystart + BLOCKSIZE;
		xstop = xstart + BLOCKSIZE;
		
		mvSingleSnap(dev, SNAP_TIMEOUT);
		
		for (i = ystart; i < ystop; i++)
		{
			pdata =(DWORD*)mvGetRowAdr(dev, 0, i);
			pdata += xstart;
			pcolorpixel =(Tcolor *)pdata;
			for (k = xstart; k < xstop; k++)
			{
				r += pcolorpixel->r;
				g += pcolorpixel->g;
				b += pcolorpixel->b;
				pcolorpixel++;
			}
		}
		r_average = r / BLOCKSIZE_QUAD;
		g_average = g / BLOCKSIZE_QUAD;
		b_average = b / BLOCKSIZE_QUAD;
		
		// Mittelwert berechnen
		m =(r_average + g_average + b_average)*100/3;
#if GTDEBUG
		printf("Averages: r=%d, g=%d, b=%d, all=%d\n", r_average, g_average, b_average, m);
#endif
		*r_val = m_bayerred*(m/r_average)/100;
		*g_val = m_bayergreen*(m/g_average)/100;
		*b_val = m_bayerblue*(m/b_average)/100;
		
#if GTDEBUG
		printf("r=%d, g=%d, b=%d\n", *r_val, *g_val, *b_val);
#endif
		setBayer(grabber, *r_val, *g_val, *b_val, 7);
		oldColorMode = mvSelColorMode(dev, oldColorMode);
		CheckError(dev, "mvSelColorMode", FALSE);
#if GTDEBUG
		printf("Set old colour mode again = %d\n", oldColorMode);
#endif
	}
	else
		printf("Bayer filter only in MVtitan (devtype=0x%02x)\n", dev->Glob->DevType);
}

//-----------------------------------------------------------------------------
void SetNumAsyncBuffer(int buffers)
{
	if (buffers >= 1 && buffers <= MAX_NUM_BUFFERS)
		NumBuffers = buffers;
	else
		printf("* illegal number of buffers, must be 1..%d\n", MAX_NUM_BUFFERS);
}


//-----------------------------------------------------------------------------
int StartLive(TGrabber *grabber)
{
	int error;
	
	switch (grabber->LiveMode)
	{
		case lmDefault :
		case lmHard :
	#if GTDEBUG
			printf("StartLive # %d\n", grabber->n);
	#endif
			mvContinuousSnap(grabber->dev);
			error = CheckError(grabber->dev, "continuous snap", FALSE);
			if (error == ERR_NO_CAMERA)
				error = NO_ERR;
			return error;
		default :
			printf("StartLive : only hardlive allowed\n");
			break;
    }
    return -1;
}

//-----------------------------------------------------------------------------
int StopLive(TGrabber *grabber)
{
	switch (grabber->LiveMode)
	{
		case lmDefault :
		case lmHard :
	#if GTDEBUG
			printf("StopLive # %d\n", grabber->n);
	#endif
			mvStopContinuousSnap(grabber->dev);
			sleep(1);
			return CheckError(grabber->dev, "stop continuous snap", FALSE);
		default :
			printf("StopLive : only hardlive allowed\n");
			break;
    }
    return -1;
}

//-----------------------------------------------------------------------------
int Live(TGrabber *grabber, int frames, int flags)
{
	DEV_T *dev = grabber->dev;
	int error = 0;
	TDisplayInfo DisplayInfo;
	
	static struct timeval start_tv;
	
	if (frames >= 0)
	{	// valid number of frames
		osDisplayInfo(&DisplayInfo, 0);
		int frame;
		
		printf("Live ( .., frames=%d) - soft\n", frames);
		StartTimer(&start_tv);
		//		int MaxX = 1024;
		//	int j;
		//		BYTE datRed[MaxX];
		//		BYTE datGreen[MaxX];
		
		//		BYTE cRed = 224;
		//		BYTE cGreen = 7;
		
		/*		for (int j = 0; j < MaxX; j++)
		{
		datGreen[j]= 7;
		datRed[j]= 224;
		}
		*/
		
		for (frame = 0; frame < frames && wait_for_input(0, 0) == 0; frame++)
		{
			mvSingleSnap(dev, SNAP_TIMEOUT);
			if ((error = CheckError(dev, "single snap", FALSE)) == NO_ERR)
			{
				//				mvWriteLine( dev, 0, 0, 460, MaxX, 460, 1, datRed);
				//				mvWriteLine( dev, 0, 0, 450, MaxX, 450, 1, datGreen);
				//				mvWriteLine( dev, 0, 0, 462, MaxX, 462, 1, dat);
				
				//				mvWriteLine( dev, 0, 0, 400, MaxX, 400, 1, dat);
				//				mvWriteLine( dev, 0, 0, 401, MaxX, 401, 1, dat);
				//				mvWriteLine( dev, 0, 0, 402, MaxX, 402, 1, dat);
				
				
				if (_flagclear(flags, INHIBIT_DISPLAY))
				{
					ShowImage(grabber, DisplayInfo.Width, DisplayInfo.Height, DisplayInfo.BytesPerPixel);
				}
			}
			else
			{
				printf(" *** fail, error = %d\n", error);
				break;
			}
		}
		TimerMessage(&start_tv, "frame", frame);
	}
	return error;
}

//-----------------------------------------------------------------------------
void srgbLinLut(DEV_T FAR* dev)
{
	WORD Addr, LastAddr =  32767;
	WORD lut[32768];
	WORD *p = lut;
	WORD r_val, rg_val, r, g, b;
	
	switch (mvSelColorMode(dev, NO_CHANGE))
	{
		default:
		case COL_RGB888:
			mvWriteLUTLin(dev, INP_LUT1);
			mvWriteLUTLin(dev, INP_LUT2);
			mvWriteLUTLin(dev, INP_LUT3);
			//		mvSelCSCMode(dev,1);
			break;
		case COL_RGB555:
			for (Addr = 0; Addr <= LastAddr; Addr++)
			{
				*p++ = Addr;
			}
			mvWriteLUTEntries(dev, INP_LUT15, 0, LastAddr + 1, lut);
			break;
		case COL_RGB565:
			for (r = 0; r < 32; r++)
			{
				r_val = r << 11;
				for (g = 0; g < 32; g++)
				{
					rg_val = r_val |(g << 6);
					for (b = 0; b < 32; b++)
					{
						*p++ = rg_val | b;
					}
				}
			}
			mvWriteLUTEntries(dev, INP_LUT15, 0, LastAddr + 1, lut);
			break;
	}
}

	

//-----------------------------------------------------------------------------
void sgLinLut(DEV_T FAR* dev, int livelut, int snaplut, int displbpp, int hicolbpp)
{
    WORD hilut[256], lolut[256], color, l5, l6;
    int  i;
	
    _odsm(DB_INIT, ("+ PrepareLuts(,%d,%d,%d,%d)", livelut, snaplut, displbpp, hicolbpp));
	
	/* 16 bit : 565 :    R, G, B  =    0..4, 5..10, 11..15
	15 bit : 555 :				 0..4, 5.. 9, 10..14, (15)
	
	  ex. v = 15   15 * 31 / 255 = 1
	  15 * 63 / 255 = 3
	  
		00001.000011.00001
		xxxx. ...xxx x....
		0    8    6   1
	*/
	
	#define CLutChannel(i)	BIT((i) + 8)
	
    switch (dev->Glob->DevType)
    {
		case DEV_PCISC:
			switch (displbpp)
			{
			case 8:
				_odsm(DB_INIT, ("  SC : 8 bit display"));
				break;
				
			default:
				_odsm(DB_INIT, ("  SC : RGB display"));
				break;
			}
			
			break;
			
			case DEV_PCISG:
				if (snaplut >= 0)
					mvWriteLUTLin(dev, snaplut);
				
				switch (displbpp)
				{
				case 8:
					_odsm(DB_INIT, ("  SG : LiveLut = Stretch 17..239"));
					mvWriteLUTStretch(dev, livelut, 0, 17, 255, 239);
					break;
					
				case 24:
				case 32:
					_odsm(DB_INIT, ("  SG : LiveLut = Lin"));
					mvWriteLUTLin(dev, livelut);
					break;
					
				case 15:
				case 16:
					for (i = 0; i <= 255; i++)
					{
						l5 =(WORD)((i * 32) / 256);
						l6 =(WORD)((i * 64) / 256);
						
						switch (hicolbpp)
						{
						case 15: 
							color =(WORD)((l5 << 10) |(l5 << 5) | l5);
							break;
						case 16: 
							color =(WORD)((l5 << 11) |(l6 << 5) | l5);
							break;
						}
						
						lolut[i] =(WORD)(color & 0xff);
						hilut[i] =(WORD)((color >> 8) & 0xff);
					}
	#if GTDEBUG
					switch (hicolbpp)
					{
					case 15:  _odsm(DB_INIT, ("  SG : 
								  LiveLut = RGB 555"));
								  break;
					case 16:  _odsm(DB_INIT, ("  SG : 
								  LiveLut = RGB 565"));
								  break;
					}
	#endif /* GTDEBUG */
					mvWriteLUTEntries(dev, (WORD)(CLutChannel(0) | livelut), 0, 256, hilut);
					mvWriteLUTEntries(dev, (WORD)(CLutChannel(1) | livelut), 0, 256, lolut);
					break;
					
					default:
						_odsm(DB_INIT, ("  SG : LiveLut = ??? illegal color mode ???"));
						break;
				}
				
				break;
				
				case DEV_PCISRGB:
					switch (displbpp)
					{
					case 8:
						_odsm(DB_INIT, ("  SRGB : 8 bit display"));
						break;
						
					default:
						_odsm(DB_INIT, ("  SRGB : RGB display"));
						break;
					}
					
					break;
    }
	
    _odsm(DB_INIT, ("- PrepareLuts()"));
}


//-----------------------------------------------------------------------------
TGrabber *OpenGrabber(char *inifile)
{
	TGrabber *grabber;
	int	error;
	
	if ((grabber =(TGrabber *)malloc(sizeof(TGrabber))) != NULL)
	{
#ifdef USE_CAMDEFS
		mvInitCamTypeDefinitions(50);
#endif
		
		grabber->dev = mvOpenDevice((CHAR*)inifile, NULL, &error, NULL);
		
		if (grabber->dev != NULL && CheckError(grabber->dev, "open device", TRUE) == NO_ERR)
		{
			mvGetAcquireDef(grabber->dev, &grabber->AcqDef);
			
            grabber->n 	   = ++NumGrabbers;
            grabber->error = NO_ERR;
            grabber->next  = GrabberList;
            GrabberList    = grabber;
		}
		else
		{
#ifdef USE_CAMDEFS
			mvFreeCamTypeDefinitions();
#endif
			free(grabber);
			grabber = NULL;
		}
	}
	return grabber;
}


//-----------------------------------------------------------------------------
int PrepareLive(TGrabber *grabber, TLiveMode livemode,
						 int x, int y, int w, int h,
						 int fpf, int scale, int vidmod, int gain, int shutter)
{
	DEV_T	*dev	= grabber->dev;
#if SET_VIDEO_TIMING
	WORD	xstart	= 152;
	WORD	ystart	=  19;
#endif
	
	grabber->LiveMode = livemode;
	
	if (scale >= 0)
		mvSetScalerMode(grabber->dev, SCM_SWITCH, scale, 0);
	if (vidmod >= 0)
		mvSelVideoMode(dev, VM_PAL);
	if (gain >= 0)
		mvSetGain(dev, 0, gain > 0 ? gain : AUTO_SET);
	if (shutter > 0)
	{
		mvSetShutter(dev, 0x4999, shutter);
	}
	
	mvGetAcquireDef(dev, &grabber->AcqDef);
	CheckError(dev, "get acqdef", TRUE);
	printf("acqdef : %d x %d\n", grabber->AcqDef.xsize[0], grabber->AcqDef.ysize[0]);
	
	grabber->AcqDef.start_addr[0] = grabber->AcqDef.start_addr[1] = 0;
	
	//	y = 200;
	//	h = 100;
	
	if (x >= 0)
		grabber->AcqDef.xpos[0] = grabber->AcqDef.xpos[1] = x;
	if (y >= 0)
		grabber->AcqDef.ypos[0] = grabber->AcqDef.ypos[1] = y;
	if (w >= 0)
	{
		grabber->AcqDef.xsize[0] = grabber->AcqDef.xsize[1] = w;
#if SET_VIDEO_TIMING
		mvSetVideoTiming(dev, HRAM, 0, 4095, 1, HVT_ACQUIRE, BIT_RESET);
		mvSetVideoTiming(dev, HRAM, xstart, (WORD)(xstart + w - 1), 1, HVT_ACQUIRE, BIT_SET);
#endif
	}
	if (h >= 0)
	{
		if (((dev->Glob->DevType & 0xf0) != DEV_TITANx) &&(h > 288))
		{	// Only for PAL ?? not for TITAN
			grabber->AcqDef.ypos[0] = grabber->AcqDef.ypos[1] + 1;	// PAL ???
			grabber->AcqDef.fields_per_frame = 2;
			grabber->AcqDef.trig_mode = 3;
		}
		else	// single fields
		{
			grabber->AcqDef.ypos[0] = grabber->AcqDef.ypos[1] + 1;
			grabber->AcqDef.fields_per_frame = fpf;
#if TOGGLE_FIELDS
			static int trig_toggle = 0;
			trig_toggle++;
			grabber->AcqDef.trig_mode =(trig_toggle%2) + 1;
#else
			grabber->AcqDef.trig_mode = TRIG_MODE;
#endif
		}
		grabber->AcqDef.ysize[0] = grabber->AcqDef.ysize[1] = h
			/ grabber->AcqDef.fields_per_frame;
#if SET_VIDEO_TIMING
		mvSetVideoTiming(dev, VRAM, 0, 4095, 1, HVT_ACQUIRE, BIT_RESET);
		mvSetVideoTiming(dev, VRAM, ystart, (WORD)(ystart + grabber->AcqDef.ysize[0] - 1), 1, HVT_ACQUIRE, BIT_SET);
#endif
	}
	
	mvSetAcquireDef(dev, &grabber->AcqDef);
	CheckError(dev, "set acqdef", TRUE);
	
	// mvSelDisplayMode ( dev, 1 ) ;
	return 0;
}


//-----------------------------------------------------------------------------
int CloseGrabber(TGrabber *grabber)
{
	if (grabber != NULL)
	{
		mvCloseDevice(grabber->dev);
		free(grabber);
	}
    else
    {
       	TGrabber *next;
		for (grabber = GrabberList; grabber != NULL; grabber = next)
        {
			mvCloseDevice(grabber->dev);
            next = grabber->next;
			free(grabber);
        }
    }
#ifdef USE_CAMDEFS
    mvFreeCamTypeDefinitions();
#endif
	return 0;
}