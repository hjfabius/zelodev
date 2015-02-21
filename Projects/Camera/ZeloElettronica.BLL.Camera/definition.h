//definition.h
#ifndef DEFINITION_H
	#define DEFINITION_H

	//Includes
	#include <sys/types.h>
	#include <sys/socket.h>
	#include <netinet/in.h>
	#include <arpa/inet.h>
	#include <netdb.h>
	#include <sys/ioctl.h> 
	#include <net/if.h> 
	#include <netinet/in.h> 
	#include <signal.h> 

	#include <stdio.h>
	#include <math.h>
	#include <fstream>
	#include <cstdlib>     // EXIT_FAILURE
	#include <unistd.h>
	#include <fcntl.h>
	#include <linux/fb.h>
	#include <sys/mman.h>
	#include <string.h>
	#include <stdexcept>
	#include <vector>

	#include <stdlib.h>
	#include <linux/fb.h>

	#include <iostream> 
	#include <sstream>


	#include <jpeglib.h>
	#include <sys/time.h>
	#include <linux/videodev.h>




	//Definitions
	#define  SHOW_IMAGE_ON_DISPLAY
	#define  WAIT_FOR_TRIGGER
	#define  CONNECT_TO_ST7
	#define  WRITE_DEBUG_INFO_ST7
	//#define  WRITE_DEBUG_INFO_FRAMEBUFFER
	//#define  WRITE_DEBUG_INFO_FRAMEANALYSIS
	//#define  WRITE_DEBUG_INFO_CAMERA
	#define  CONNECT_TO_TOUCH_SCREEN
	#define  WRITE_DEBUG_INFO_COMMUNICATION

	
	#define VERSION_NUMBER					"Version: 0005"
	#define VERSION_COMPANY					"Zelo Elettronica S.r.l."
	#define VERSION_AUTHOR					"Fabio Cristini"
	#define VERSION_EMAIL					"tech@zeloelettronica.it"
	#define VERSION_APPLICATION				"Lumà"
	
	#define MAX_NUM_MARKS 12
	
	
	#define  REFERENCE_COUNTER				65536
	#define	 ANALYSIS_OFFSET				10 //jumping by ANALYSIS_OFFSET pixels each time
	#define  SQUARE_ANALYSIS_SIZE			80 //size of the pattern in PATTERN_FILE_NAME
	#define  PATTERN_FILE_NAME				"pattern80.raw"

	#define FRAMEBUFFER_DRIVER				"/dev/fb0"

	#define NUM_ANALYZED_POINT				9
	#define CENTER_POINT					4
	#define MAX_ANALYZED_VALUE				99999

	#define MAX_MULTIPLEX_VALUE				2  // 0 Lateral - 1 Longitudinal
	#define MULTIPLEX_LATERAL				0
	#define MULTIPLEX_LONGITUDINAL			1

	#define MESSAGE_VIRTUAL_0				32768 // 256*256/2


	#define MESSAGE_IDX_ID1						0
	#define MESSAGE_IDX_ID2						1
	#define MESSAGE_IDX_MULTIPLEX				2
	#define MESSAGE_IDX_ABSOLUTE_POSITION		8
	#define MESSAGE_IDX_PAGE					4
	#define MESSAGE_IDX_POSITION				6
	#define MESSAGE_IDX_REFERENCE_ID			8
	#define MESSAGE_IDX_FLAGS					9
	#define MESSAGE_MULTIPLEX_LATERAL		 0x01
	#define MESSAGE_MULTIPLEX_LONGITUDINAL	 0x02
	#define MESSAGE_ID_BASE					 0x81

	#define COM_PORT						13000
	#define COM_IP							"192.168.0.31"//"192.168.0.20"
	#define COM_SINGLE_MESSAGE_LENGTH		10 // 10 chars = 10 byte = 2 ID + 2 Multiplex + 6 Data 
	#define COM_MAX_SIZE_MESSAGE			COM_SINGLE_MESSAGE_LENGTH * MAX_NUM_MARKS  // 12 * 10 + 1(\0)
	#define COM_EMPTY_PARAMETER				0x00



	#define IMAGE_WIDTH						640
	#define IMAGE_HEIGHT					480
	#define IMAGE_DEPTH						7
	#define IMAGE_BRIGHTNESS				0x3F	/* min=0x00 max=0x3F */
	#define IMAGE_DRIVER					"/dev/video"
	#define IMAGE_INTEGRATION				2		/* 1<Value<504 means (33*Value)/504 ms */
	#define ST7_MESSAGE_LENGTH				16

	#define null							0

	struct point_t
	{
		int X;
		int Y;
	};

	#include "pccamera.h"
	#include "pointAnalyzer.h"
	#include "analysis.h"
	#include "Marks.h"
	#include "MarksManager.h"
	#include "AnalysisManager.h"
	#include "communication.h"
	#include "FrameBuffer.h"
	#include "utility.h"
	#include "versioning.h"
#endif
