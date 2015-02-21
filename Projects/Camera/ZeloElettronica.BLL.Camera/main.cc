#include "definition.h"

unsigned short  m_usShutter				=   400;
float			m_sngReferenceCounter	=	REFERENCE_COUNTER;
int				m_intXBoundOffset		=	0;
int				m_intYBound0ffset		=	0;
bool			m_blnConnectToServer	=   true; //Connection active
bool			m_blnMarkAnalysis		=   true; //Analysis is performed
int				m_intPage				=	-1;   //all the pages
bool			m_blnSingleShot			=	false; //no user interaction is required during shots
bool			m_blnQuit				=   false;
Communication	m_objComm;

using namespace std;

/*******************************************************************/
int splitParameters(int argc,char** argv)
{
	char cCommand;
	if (argc > 0)
	{
		for(int i=1; i<argc; i++)
		{
			if((i%2)==1)
			{
				cCommand = argv[i][0];
				switch(cCommand)
				{
					case '?':
						printf("\nUsage: \n");
						printf(" s  Shutter Time\n");
						printf(" r  Reference Counter\n");
						printf(" p  Page Number             -1=all pages\n");
						printf(" x  X Offset (on screen)\n");
						printf(" y  Y Offset (on screen)\n");
						printf(" e  Connection to server    0=active, 1=inactive\n");
						printf(" m  Marks Analysis          0=active, 1=inactive\n");
						printf(" w  Single Shot             0=active, 1=inactive\n");
						printf(" v  Application version\n");
						printf("Example: ./Test01 s 400 y 150\n\n");
						return -1;
					case 'v':
						Versioning	objVer;
						objVer.version();
						return -1;
				}
			}
			else
			{
				switch(cCommand)
				{
					case 's':
						m_usShutter = (unsigned short) atoi(argv[i]);
						break;
					case 'c':
						m_sngReferenceCounter = (float) atof(argv[i]);
						break;
					case 'x':
						m_intXBoundOffset =	atoi(argv[i]);
						break;
					case 'y':
						m_intYBound0ffset = atoi(argv[i]);
						break;
					case 'e':
						m_blnConnectToServer = (atoi(argv[i])==0);
						break;
					case 'm':
						m_blnMarkAnalysis = (atoi(argv[i])==0);
						break;
					case 'p':
						m_intPage = atoi(argv[i]);
						break;
					case 'w':
						m_blnSingleShot = (atoi(argv[i])==0);
						break;
					default:
						break;
				}
			}
		}
	}
	return 0;
}


/*******************************************************************/
bool showPattern(FrameBuffer * a_objFrameBuffer, AnalysisManager * a_objAnalysisManager)
{
	int intX;
	int intY;
		
	for(intX=0; intX<SQUARE_ANALYSIS_SIZE; intX++)
	{
		for(intY=0; intY<SQUARE_ANALYSIS_SIZE; intY++)
		{
			if (a_objAnalysisManager->getPatternPixel(intX, intY))
			{
				a_objFrameBuffer->setPixel(intX, intY, 255, 255, 255, 0);
			}
			else
			{
				a_objFrameBuffer->setPixel(intX, intY, 255, 0, 0, 0);
			}
		}
	}
}

/*******************************************************************/
void waitUserInput()
{
	if(m_blnSingleShot)
	{
		char str [80];
		printf("Press any key and enter to continue\n");
		scanf ("%s",str); 
		int counter = 0;
		while ( counter <=50 ) 
		{
			cout << "  " << endl;
			counter++;
		}
	}
}

void closeHandler(int code) 
{ 
	m_blnQuit = true;
#ifdef WRITE_DEBUG_INFO_COMMUNICATION
	printf("Signal close recognized (Code=%d)\nTry to close existing connections\n", code);
#endif
	m_objComm.closeConnection();
}

/*******************************************************************/
int main(int argc,char** argv)
{

	Versioning		objVer;
	PCCamera		objPCCamera;
	FrameBuffer		objFrameBuffer;
	ofstream		objFile;
	MarksManager	objMarksManager;
	AnalysisManager	objAnalysisManager;


	int				intXBound			=	640;
	int				intYBound			=	299;
	int				intOffset			=	0;
	double			dblValue			=	0;
	int				intMaxRangeOffset	=	200; 
	int				intThreshold		=	160;
	unsigned short	usValue;
	unsigned char	ucValue;
	unsigned char	strST7Message[ST7_MESSAGE_LENGTH];
	float			sngRate				=   0.0;
	float			sngTimer			=   0.0;
	int				intCurrentPage		=	-1;


	/* set-up socket as a non-blocking TCP socket */ 
	signal(SIGINT, closeHandler); 

	try
	{
		if (splitParameters(argc, argv)==-1)
		{
			return 0;
		}
		sngRate   = m_sngReferenceCounter;

		intOffset = SQUARE_ANALYSIS_SIZE / 2;
		objVer.version();

		objMarksManager.init();

#ifdef CONNECT_TO_TOUCH_SCREEN
		if (m_blnConnectToServer)
		{
			m_objComm.init();
		}
#endif

#ifdef SHOW_IMAGE_ON_DISPLAY
		objFrameBuffer.init(&objPCCamera, &objMarksManager, m_intXBoundOffset, m_intYBound0ffset);
#endif
		objPCCamera.init();
		objAnalysisManager.init(&objPCCamera, &objMarksManager, intXBound, intYBound, intMaxRangeOffset, intThreshold);
		printf("--------------------------------------------\n");

		objPCCamera.setIntegrationTime(m_usShutter);

#ifdef WAIT_FOR_TRIGGER
		objPCCamera.setTrigger();
#endif	

		while(!m_blnQuit)
		{
#ifdef CONNECT_TO_TOUCH_SCREEN
			if ((m_blnConnectToServer) && (intCurrentPage<=0))
			{
				//Check if connection to touch screen is opened.
				//If not, it opens the socket and positions are sent
				//If positions are changed, they are sent to the touch screen
				m_objComm.syncronize(&objMarksManager);
			}
#endif			

			//Wait user input if required
			waitUserInput();

			objPCCamera.acquireImage();
#ifdef CONNECT_TO_ST7
			intCurrentPage = objPCCamera.getPageNumber();
#endif

			if ((m_intPage<0) || (intCurrentPage == m_intPage))
			{

#ifdef SHOW_IMAGE_ON_DISPLAY
				//read image and write it in framebuffer
				objFrameBuffer.showImage(intXBound, intYBound);

				//Show pattern in upper left corner
				showPattern(&objFrameBuffer, &objAnalysisManager);
#endif

				if(m_blnMarkAnalysis && (intCurrentPage>-1))
				{
					objAnalysisManager.updatePositions(intCurrentPage);
				}

#ifdef SHOW_IMAGE_ON_DISPLAY
				//read image and write it in framebuffer
				objFrameBuffer.showPositions(intCurrentPage);
#endif
			}
		}

#ifdef WAIT_FOR_TRIGGER
		objPCCamera.resetTrigger();
#endif


		objPCCamera.quit();
		objFrameBuffer.quit();

	}
	catch (exception &ex)
	{
		fprintf(stderr, "--------------------------------------------\n");
		fprintf(stderr, "- ERROR ------------------------------------\n");
		fprintf(stderr, "--------------------------------------------\n");
		fprintf(stderr, ex.what());
		fprintf(stderr, "\n--------------------------------------------\n");
		return EXIT_FAILURE;
	}

	return 0;
}
