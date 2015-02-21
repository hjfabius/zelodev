#ifndef _hjStruct
	#define _hjStruct


//***************************************************************************
//                                 Includes
//***************************************************************************
	#include "../include/mv.h"

//***************************************************************************
//                                 Defines
//***************************************************************************
	#define		HJ_UNITS_PER_PATTERN	12
	#define		HJ_NUM_PATTERN			 2
	#define     HJ_MAX_SEARCH_LENGTH   200


//***************************************************************************
//                                 Variables
//***************************************************************************

	const int	mc_iImageHeight = 768;
	const int	mc_iImageWidth = 1024;

	const int	mc_iScreenHeight = 600;
	const int	mc_iScreenWidth  = 800;


	const int	mc_iFontHeight		 = 18;
	const int	mc_iFontWidth		 = 14;

	const int	mc_iFontSWKeysHeight = 42;
	const int	mc_iFontSWKeysWidth	 = 42;




//***************************************************************************
//                                 Types
//***************************************************************************

	//typedef struct
	//{
	//	int				n;
	//	TMvEvent		snapwait;
	//	unsigned long	offset;
	//	BYTE			*buffer;
	//	unsigned long	pitch;
	//	struct timeval	meas_tv;
	//} TSnapParameter;

	//struct timespec 
	//{
	//	time_t  tv_sec;         /* seconds */
	//	long    tv_nsec;        /* nanoseconds */
	//};

	typedef struct
	{
		BYTE	b;
		BYTE	g;
		BYTE	r;
	} Tcolor;

	typedef struct
	{
		BYTE	y;
	} TLux;

	typedef	struct SGrabber TGrabber;
	typedef	enum{ lmDefault, lmHard, lmSoft, lmSoftAsync } TLiveMode; 

	struct SGrabber
	{
		TGrabber		*next;
		int				n;
		int				error;
		DEV_T 			*dev;
		TLiveMode 		LiveMode;
		ACQUIRE_DEF_T 	AcqDef;
	};

	typedef struct
	{                                    /* screen parameter */
		unsigned short Width,            /* = 0  <=>  no display found */
			Height;
		unsigned short BitsPerPixel;
		unsigned short BytesPerPixel;
		unsigned long  BytesPerLine;
		/* pci board parameter */
		unsigned long  PhysicalAddress; /* = 0  <=>  no linear access */
		unsigned long  Offset;
		unsigned short VendorID;
		unsigned short DeviceID;
		unsigned short BridgeNr;
		unsigned short SlotNr;
		
		unsigned long   RedBitMask;
		unsigned long   GreenBitMask;
		unsigned long   BlueBitMask;
		unsigned long   AlphaBitMask;
		
		#ifdef linux
			unsigned long   MemSize; // bytes
		#endif
	} TDisplayInfo, FAR * LP_DisplayInfo;
	
	typedef struct hjMatrix 
	{
		int Width;
		int Height;
		//WORD Pixel[mc_iImageWidth][mc_iImageHeight];
		int Pixel[mc_iImageWidth][mc_iImageHeight];
	};


	typedef struct hjChar
	{
		bool	Pixel[mc_iFontWidth][mc_iFontHeight]; 
	};

	typedef struct hjSWKeyChar
	{
		bool	Pixel[mc_iFontSWKeysWidth][mc_iFontSWKeysHeight]; 
	};

	typedef struct hjFont
	{
		char	Name[50];
		hjChar	Chars[94];
	};


	typedef struct hjSWKeyFont
	{
		hjSWKeyChar	Chars[7];
	};

	typedef struct hjUnit
	{
		vec_t	IdealPos;
		vec_t	RealPos;
		vec_t	ErrorPos;
		DWORD	lColor;
		char	Name[20];
	};

	typedef struct hjPattern
	{
		hjUnit	Unit[HJ_UNITS_PER_PATTERN];
		char    FileName[100];
		int		iNumUnit;
		int		iSearchLength;
	};

	typedef struct hjPatterns
	{
		hjPattern Pattern[HJ_NUM_PATTERN];
	};

#endif // _hjStruct