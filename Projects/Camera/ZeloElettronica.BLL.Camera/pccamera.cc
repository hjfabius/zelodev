// pccamera.cc
#include "pccamera.h"



#define VIDIOCGI2C	_IOW('v',50, struct pccam_i2c)
#define VIDIOCSI2C	_IOW('v',51, struct pccam_i2c)
#define VIDIOCGIO	_IOW('v',52, unsigned char)
#define VIDIOCSIO	_IOW('v',53, unsigned char)
#define VIDIOCGINT	_IOW('v',54, unsigned short)
#define VIDIOCSINT	_IOW('v',55, unsigned short)
#define VIDIOCSIMAGE	_IOW('v',56, unsigned char)
#define VIDIOCSTRIGGER	_IOW('v',57, unsigned char)

/*******************************************************************/
void PCCamera::init()
{
	unsigned short			ushoImageIntegrationTime	= 0;

	
	/*      opening the device      */
	
	m_intPCCam = 0;
	m_intPCCam = open(IMAGE_DRIVER, O_RDWR);
	if (m_intPCCam<0)
	{
		string strTmp = IMAGE_DRIVER;
		throw runtime_error("10002"); //"open %s: failed", strTmp
	}

	/*	setting camera settings	 */
	setIntegrationTime(IMAGE_INTEGRATION);
#ifdef WRITE_DEBUG_INFO_CAMERA
	fprintf(stdout, "trying to set integration time to %d \n", IMAGE_INTEGRATION);
#endif
	ushoImageIntegrationTime = getIntegrationTime();
#ifdef WRITE_DEBUG_INFO_CAMERA
	fprintf(stdout, "integration time set to %d \n", ushoImageIntegrationTime);
#endif
	/*  setting picture properties  */
	m_objVidPict.depth = IMAGE_DEPTH;
	m_objVidPict.brightness = IMAGE_BRIGHTNESS;		/* min=0x00 max=0x3F */
	ioctl(m_intPCCam, VIDIOCSPICT, &m_objVidPict);

	/*  setting picture size     */
	m_objVidWin.width  = IMAGE_WIDTH;
	m_objVidWin.height = IMAGE_HEIGHT;
	ioctl(m_intPCCam, VIDIOCSWIN, &m_objVidWin);



	/*		allocate space for image*/
	switch(m_objVidPict.depth)
	{
	  case 7:
		  m_intImageSize = m_objVidWin.width*m_objVidWin.height;
	  	  break;
	  case 8:
		  m_intImageSize = m_objVidWin.width*m_objVidWin.height;
		  break;
	  case 10:
		  m_intImageSize = 2*m_objVidWin.width*m_objVidWin.height;
		  break;
 	  case 12:
		  m_intImageSize = 2*m_objVidWin.width*m_objVidWin.height;
          break;
	  case 24:
		  m_intImageSize = 3*m_objVidWin.width*m_objVidWin.height;
          break;
	  default:
		  throw runtime_error("10001"); //"bad image depth %d\n", m_objVidPict.depth
	}
	
	m_ucImage = (unsigned char *) malloc(m_intImageSize);

}

/*******************************************************************/
void PCCamera::quit()
{
	free(m_ucImage);
	
	/*  	 closing the device     */
	close(m_intPCCam);
}

/*******************************************************************/
void PCCamera::saveImage(const char * a_strFileName)
{
	string strTmp;
	
	strTmp = a_strFileName;

	saveImage(strTmp);
}
/*******************************************************************/
void PCCamera::saveImage(string a_strFileName)
{
	FILE*					fFileOutPut				= 0;
	
	/*   saving the image   */
	fFileOutPut = fopen(a_strFileName.c_str(),"wb");
	fwrite(m_ucImage, m_objVidWin.width*m_objVidWin.height, 1, fFileOutPut); /* saving the image */
	fclose(fFileOutPut);

#ifdef WRITE_DEBUG_INFO_CAMERA
	fprintf(stdout, "image saved in '%s'\n", a_strFileName.c_str());
#endif	
}


/*******************************************************************/
int PCCamera::getPixel(int a_intX, int a_intY)
{
	int intIndex;
	switch(m_objVidPict.depth)
	{
	  case 7:
		  intIndex = (a_intX) + (a_intY*m_objVidWin.width);
	  	  break;
	  case 8:
		  intIndex = (a_intX) + (a_intY*m_objVidWin.width);
		  break;
	  case 10:
		  intIndex = (2*a_intX) + (2*a_intY*m_objVidWin.width);
		  break;
 	  case 12:
		  intIndex = (2*a_intX) + (2*a_intY*m_objVidWin.width);
          break;
	  case 24:
		  intIndex = (3*a_intX) + (3*a_intY*m_objVidWin.width);
          break;
	  default:
		  throw runtime_error("10001"); //"bad image depth %d\n", m_objVidPict.depth
	}
	
	return m_ucImage[intIndex];
}


/*******************************************************************/
void PCCamera::acquireImage()
{
	unsigned short			*ucPtr;
	unsigned char			ucShift;
	
	setIO(0);

	/*  acquiring the image     */
   	lseek(m_intPCCam,	0,		 SEEK_SET);
    read(m_intPCCam,	m_ucImage, m_intImageSize);	
        
	/* converting images before passing them to the compressor */
	if(m_objVidPict.depth == 10 || m_objVidPict.depth == 12)
	{
	  ucPtr = (unsigned short *) m_ucImage;
	  ucShift = m_objVidPict.depth - 8;
	
	  for(int i=0;i<m_objVidWin.width*m_objVidWin.height;i++)
	    m_ucImage[i] = (ucPtr[i] >> ucShift);
	}
}

/*******************************************************************/
void PCCamera::setIntegrationTime(unsigned short usValue) //1 < usValue < 504 means (33*usValue)/504 ms.
{
	ioctl(m_intPCCam, VIDIOCSINT, &usValue);
}

/*******************************************************************/
unsigned short PCCamera::getIntegrationTime() //1 < usValue < 504 means (33*usValue)/504 ms.
{
	unsigned short usValue;
	ioctl(m_intPCCam, VIDIOCGINT, &usValue);
	return usValue;
}


/*******************************************************************/
void PCCamera::setTrigger() 
{
	unsigned char ucValue = 1;
	ioctl(m_intPCCam, VIDIOCSTRIGGER, &ucValue);
}


/*******************************************************************/
void PCCamera::resetTrigger() 
{
	unsigned char ucValue = 0;
	ioctl(m_intPCCam, VIDIOCSTRIGGER, &ucValue);
}


/*******************************************************************/
void PCCamera::setIO(unsigned char ucValue) 
{
	ioctl(m_intPCCam, VIDIOCSIO, &ucValue);	// writing output 1=OUT24V_1 2=OUT24V_2
}


/*******************************************************************/
unsigned char PCCamera::getIO() 
{
	unsigned char ucValue = 0;
	ioctl(m_intPCCam, VIDIOCGIO, &ucValue); // reading input 1=IN24V_1 2=IN24V_2
	return ucValue;
}


/*******************************************************************/
int PCCamera::getPageNumber()
{
	int				intValue		= 0x00;
	int				intFactor		= 0x01;
	int				j				= 0x00;
	char			strMessage[3];


	do
	{
		intValue	= 0x00;
		intFactor	= 0x01;
		for(int i=0; i<8; i++)
		{
			if((i%2)==0)
			{
				setIO(2);
			}
			else
			{
				setIO(0);
			}

			if ((getIO()&0x02)>0)
			{
				intValue += intFactor;
			}
			intFactor *= 2;
		}
		strMessage[j] = intValue;
		j++;
	}
	while ((strMessage[0] == 'I') && (j<3));

	if (strMessage[0] == 'I')
	{
		intValue = strMessage[1] + (256*strMessage[2]);

#ifdef WRITE_DEBUG_INFO_ST7
		printf("ST7: Page Received=%d\n", intValue);
#endif
		return intValue;
	}
	else
	{
#ifdef WRITE_DEBUG_INFO_ST7
		printf("ST7: Error receiving page number from ST7=%s \n", strMessage);
#endif
		return -1;
		//throw runtime_error("60001"); //"error receiving page number from ST7"
	}
}


/*******************************************************************/
void PCCamera::getMessage(unsigned char * strMessage)
{
	int				intValue		= 0x00;
	int				intFactor		= 0x01;
	int				j				= 0x00;
	float			sngTimer		= 0.0;


	do
	{
		intValue	= 0x00;
		intFactor	= 0x01;
		for(int i=0; i<8; i++)
		{
			if((i%2)==0)
			{
				setIO(2);
			}
			else
			{
				setIO(0);
			}

			if ((getIO()&0x02)>0)
			{
				intValue += intFactor;
			}
			intFactor *= 2;
		}

//		printf("Char %d Received : %d\n", j, intValue);

		strMessage[j] = intValue;
		j++;
	}
	while (
			((strMessage[0] != 'I') && (intValue!='\0') && (j<ST7_MESSAGE_LENGTH)) ||
			((strMessage[0] == 'I') && (j<3))
		  );

	if (strMessage[0] == 'I')
	{
		intValue = strMessage[1] + (256*strMessage[2]);
		sngTimer = 1.0*intValue;

		strMessage[ST7_MESSAGE_LENGTH-1] = '\0';
		for(j=ST7_MESSAGE_LENGTH-2; j>=0; j--)
		{
			strMessage[j] = (48+(intValue % 10)); //48 = '0'
			intValue /= 10;
		}

#ifdef WRITE_DEBUG_INFO_ST7
		printf("ST7: Message Received %s --> Speed=%.1f  mt/min \n", strMessage, sngTimer);
#endif

	}

#ifdef WRITE_DEBUG_INFO_ST7
	if(strMessage[0] == '\0')
	{
		printf("ST7: No Message\n");
	}
#endif
}


/*******************************************************************/
void PCCamera::sendInteger(unsigned int intValue)
{
#ifdef WRITE_DEBUG_INFO_ST7
		printf("ST7: Sending message %d\n", intValue);
#endif

	for(int i=0; i<16; i++)
	{
		if((intValue%2)==0)
		{
			setIO(2);
		}
		else
		{
			setIO(0);
		}
		intValue /= 2;
	}
}
