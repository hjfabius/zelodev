//FrameBuffer.cc
#include "FrameBuffer.h"

/*******************************************************************/
void FrameBuffer::init(PCCamera * a_objPCCamera, MarksManager * a_objMarksManager, int a_intXBoundOffset, int a_intYBoundOffset)
{
	m_intFrameBuffer = 0;
	m_lngScreenSize = 0;
	m_cFrameBufferMemoryPointer = 0;
	m_objPCCamera = a_objPCCamera;
	m_objMarksManager = a_objMarksManager;
	m_intXBoundOffset = a_intXBoundOffset;
	m_intYBoundOffset = a_intYBoundOffset;


	/* Open the file for reading and writing */
	m_intFrameBuffer = open(FRAMEBUFFER_DRIVER, O_RDWR);
	if (!m_intFrameBuffer) {
		throw runtime_error("20001"); //"cannot open framebuffer device"
	}

#ifdef WRITE_DEBUG_INFO_FRAMEBUFFER
	printf("The framebuffer device was opened successfully.\n");
#endif

	/* Get fixed screen information */
	if (ioctl(m_intFrameBuffer, FBIOGET_FSCREENINFO, &m_objFixInfo)) 
	{
		throw runtime_error("20002"); //"error reading fixed information"
	}

	/* Get variable screen information */
	if (ioctl(m_intFrameBuffer, FBIOGET_VSCREENINFO, &m_objVarInfo)) 
	{
		throw runtime_error("20003"); //"error reading variable information"
	}

#ifdef WRITE_DEBUG_INFO_FRAMEBUFFER
	printf("The framebuffer device is set \n");
	printf("\tBit per pixel:%d\n", m_objVarInfo.bits_per_pixel);
	printf("\tResolution:   %dx%d\n", m_objVarInfo.xres, m_objVarInfo.yres);
	printf("\tOffset:   %dx%d\n", m_objVarInfo.xoffset, m_objVarInfo.yoffset);

    printf( "Screen Info:\n\n" 
                "\txres:          %d\n" 
                "\tyres:          %d\n" 
                "\txres virtual:  %d\n" 
                "\tyres virtual:  %d\n" 
                "\txoffset        %d\n" 
                "\tyoffset        %d\n" 
                "\tbit per pixel  %d\n" 
                "\tgrayscale      %d\n" 
                "\tnonstd         %d\n" 
                "\tactivate       %d\n" 
                "\theight         %d\n" 
                "\twidth          %d\n\n" 

                "\tphys.    start %lx\n" 
                "\tphys.    len   %d\n" 
                "\ttype           %d\n" 
                "\tID             %16s\n\n", 


                m_objVarInfo.xres, 
                m_objVarInfo.yres, 
                m_objVarInfo.xres_virtual, 
                m_objVarInfo.yres_virtual, 
                m_objVarInfo.xoffset, 
                m_objVarInfo.yoffset, 
                m_objVarInfo.bits_per_pixel, 
                m_objVarInfo.grayscale, 
                m_objVarInfo.nonstd, 
                m_objVarInfo.activate, 
                m_objVarInfo.height, 
                m_objVarInfo.width, 

                m_objFixInfo.smem_start, 
                m_objFixInfo.smem_len, 
                m_objFixInfo.type, 
                m_objFixInfo.id 
        );
#endif

	/* Figure out the size of the screen in bytes */
	m_lngScreenSize = m_objVarInfo.xres * m_objVarInfo.yres * m_objVarInfo.bits_per_pixel / 8;
	
	/* Map the device to memory */
	m_cFrameBufferMemoryPointer = (char *)mmap(0, m_lngScreenSize, 
			PROT_READ | PROT_WRITE, MAP_SHARED, m_intFrameBuffer, 0);       
	if ((int)m_cFrameBufferMemoryPointer == -1)
	{ 
		throw runtime_error("20004"); //"failed to map framebuffer device to memory"
	}

#ifdef WRITE_DEBUG_INFO_FRAMEBUFFER
	printf("The framebuffer device was mapped to memory successfully.\n");
#endif
}


/*******************************************************************/
void FrameBuffer::quit()
{
	//Unmap Pages from memory
	munmap(m_cFrameBufferMemoryPointer, m_lngScreenSize);

	//Close the framebuffer
	close(m_intFrameBuffer);

#ifdef WRITE_DEBUG_INFO_FRAMEBUFFER
	printf("The framebuffer device was closed successfully.\n");
#endif
}


/*******************************************************************/
void FrameBuffer::setPixel(int a_intX, int a_intY, int a_shoRed, 
	              int a_shoGreen, int a_shoBlue, int a_shoAlpha)
{
	long int	lngLocation = 0;

	/* Figure out where in memory to put the pixel */
	lngLocation = (a_intX+m_objVarInfo.xoffset) * (m_objVarInfo.bits_per_pixel/8) + 
				  (a_intY+m_objVarInfo.yoffset) * m_objFixInfo.line_length;

	if ( m_objVarInfo.bits_per_pixel == 32 ) 
	{
		*(m_cFrameBufferMemoryPointer + lngLocation)	 = a_shoBlue;					/* Blue */
		*(m_cFrameBufferMemoryPointer + lngLocation + 1) = a_shoGreen+(a_intX-100)/2;	/* Green */
		*(m_cFrameBufferMemoryPointer + lngLocation + 2) = a_shoRed-(a_intY-100)  /5;	/* Red */
		*(m_cFrameBufferMemoryPointer + lngLocation + 3) = a_shoAlpha;					/* Transparency */
	} 
	else  if(m_objVarInfo.bits_per_pixel == 24 ) 
	{ 
		*(m_cFrameBufferMemoryPointer + lngLocation)	 = a_shoBlue;	/* Blue */
		*(m_cFrameBufferMemoryPointer + lngLocation + 1) = a_shoGreen;	/* Green */
		*(m_cFrameBufferMemoryPointer + lngLocation + 2) = a_shoRed;	/* Red */
	} 
	else  if(m_objVarInfo.bits_per_pixel == 8 ) 
	{ 
         *(m_cFrameBufferMemoryPointer + lngLocation) = (a_shoRed+a_shoGreen+a_shoBlue)/3;
	}
	else //assume 16bpp
	{ 
		//int b = a_shoBlue;
		//int g = (a_intX-a_shoGreen)/6;     // A little green
		//int r = a_shoRed-(a_intY-100)/16;    // A lot of red
		int b = a_shoBlue;
		int g = a_shoGreen/6;     // A little green
		int r = a_shoRed/16;    // A lot of red

		unsigned short int t = r<<11 | g << 5 | b;

		*((unsigned long int*)(m_cFrameBufferMemoryPointer + lngLocation)) = t;

	}

}


/*******************************************************************/
void FrameBuffer::test()
{
	int			x = 0;
	int			y = 0;
	long int	lngLocation = 0;

	for (int i=0; i<640; i++)
	{
		for(int e=0; e<5; e++)
		{
			setPixel(i, 50+e, 255, 0, 0, 0);
			setPixel(i, 100+e, 0, 255, 0, 0);
			setPixel(i, 150+e, 0, 0, 255, 0);
			setPixel(i, 200+e, 0, 255, 255, 0);
			setPixel(i, 250+e, 255, 0, 255, 0);
		}
	}
}


/*******************************************************************/
void FrameBuffer::showImage(int a_intXBound, int a_intYBound)
{
	int intColor = 0;
	int intX=0;
	int intY=0;

	for(intY=0; intY<a_intYBound; intY++)
	{
		intColor = 0;
		for(intX=0; intX<a_intXBound; intX++)
		{
			intColor = m_objPCCamera->getPixel(intX+m_intXBoundOffset, intY+m_intYBoundOffset);
			setPixel(intX, intY, 0, intColor, 0, 0);
		}
	}
}


/*******************************************************************/
void FrameBuffer::showPositions(int a_intPageNumber)
{
	point_t			objIdealPoint;
	point_t			objCurrentPoint;
	int				intCenterImage;
	
	intCenterImage = SQUARE_ANALYSIS_SIZE / 2;
	for (int intMarkIndex=0;intMarkIndex<MAX_NUM_MARKS; intMarkIndex++)
	{
		if  ((m_objMarksManager->m_arobjMarks[intMarkIndex].getPage() == a_intPageNumber) &&
			 (m_objMarksManager->m_arobjMarks[intMarkIndex].isUsed() ))
		{
			objIdealPoint.X = m_objMarksManager->m_arobjMarks[intMarkIndex].getPositionAbsolute(MULTIPLEX_LONGITUDINAL) - m_intXBoundOffset;
			objIdealPoint.Y = m_objMarksManager->m_arobjMarks[intMarkIndex].getPositionAbsolute(MULTIPLEX_LATERAL) - m_intYBoundOffset;
#ifdef WRITE_DEBUG_INFO_FRAMEBUFFER			
			printf("Show Mark %d=   %d-%d\n", intMarkIndex, objIdealPoint.X, objIdealPoint.Y);
#endif

			//If point is negative means that it is out of picture to draw
			if ((objIdealPoint.X >=0) && (objIdealPoint.Y >=0))
			{
				setPixel(intCenterImage+objIdealPoint.X+3,	intCenterImage+objIdealPoint.Y,		31, 31, 31, 0);
				setPixel(intCenterImage+objIdealPoint.X-3,	intCenterImage+objIdealPoint.Y,		31, 31, 31, 0);
				setPixel(intCenterImage+objIdealPoint.X,	intCenterImage+objIdealPoint.Y+3,	31, 31, 31, 0);
				setPixel(intCenterImage+objIdealPoint.X,	intCenterImage+objIdealPoint.Y-3,	31, 31, 31, 0);				
			}
		}
	}
}

