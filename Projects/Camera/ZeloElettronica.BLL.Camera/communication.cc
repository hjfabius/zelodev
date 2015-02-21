// communication.cc
#include "communication.h"

int					m_intSock = -1;
char				m_strCurrentIP[15];
struct  sockaddr_in m_objServerAddr;


/*******************************************************************/
void Communication::init()
{
	int i,s; 
	struct ifconf ifc; 
	struct ifreq ibuf[12]; /* interfaces' data get stored here */ 
	struct in_addr addr; 
	
	memset ((char *)&m_objServerAddr, 0, sizeof(m_objServerAddr));
	m_objServerAddr.sin_family = AF_INET;
	m_objServerAddr.sin_port = htons(COM_PORT);			// Server's service port
	m_objServerAddr.sin_addr.s_addr = inet_addr(COM_IP);  // Server address


	/* initialize ifconf struct with length and address of data buffer */ 
	ifc.ifc_len = sizeof ibuf; 
	ifc.ifc_buf = (caddr_t)ibuf; 


	s=socket(PF_INET, SOCK_STREAM, 0); 
	if(ioctl(s, SIOCGIFCONF, (char *)&ifc)<0) 
	{ 
		throw runtime_error("50006"); // "Impossible to retrieve IP configuration"
	} 
	close(s); 

	/* ioctl() wrote data in ibuf and their length - which we expect to be 
		multiple of sizeof(ifreq) - in ifc_len */ 
	if(ifc.ifc_len<sizeof(struct ifreq)) 
	{ 
		throw runtime_error("50006"); // "Impossible to retrieve IP configuration"
	} 

	for(i=0;i<ifc.ifc_len/sizeof (struct ifreq);i++) 
	{ 
		/* 
		note: we should check for interfaces flagged as "down". 
		However this seems to be performed by the ioctl itself as it 
		does not return down interfaces
		*/ 

		addr=((struct sockaddr_in*)(&ibuf[i].ifr_addr))->sin_addr; 
		if(strcmp(inet_ntoa(addr), "127.0.0.1")!=0)
		{
			strcpy(m_strCurrentIP, inet_ntoa(addr));
#ifdef WRITE_DEBUG_INFO_COMMUNICATION
			printf("Local IP: %s\n", m_strCurrentIP);
#endif

		}
	} 
}


/*******************************************************************/
void Communication::openConnection()
{
#ifdef WRITE_DEBUG_INFO_COMMUNICATION
	puts("Opening connection to server...");
#endif
	m_intSock = socket(AF_INET, SOCK_STREAM, 0);
	if(connect(m_intSock,(struct sockaddr *)&m_objServerAddr, sizeof(sockaddr)) == -1)
	{
#ifdef WRITE_DEBUG_INFO_COMMUNICATION
		puts("Error opening connection to server");
#endif
		throw runtime_error("50001"); // "impossible to open connection to server"
	}
	else
	{
#ifdef WRITE_DEBUG_INFO_COMMUNICATION
		puts("Connection opened to server");
#endif
	}
}


/*******************************************************************/
void Communication::sendMessage(char * a_strMessage)
{
	int intByte;
#ifdef WRITE_DEBUG_INFO_COMMUNICATION
	printf("Ready to send message (%d bytes)\n", COM_MAX_SIZE_MESSAGE );
#endif

    intByte = send(m_intSock, a_strMessage, COM_MAX_SIZE_MESSAGE, 0);
    
    if(intByte<0) 
	{
		close(m_intSock);
		throw runtime_error("50002"); // "impossible to send the message to the server"
    }

#ifdef WRITE_DEBUG_INFO_COMMUNICATION
	printf("Message Sent: %s\n", a_strMessage);
#endif
}


/*******************************************************************/
void Communication::receiveMessage(char * a_strMessage)
{
	int	 intByte;

	intByte=recv(m_intSock, a_strMessage, COM_MAX_SIZE_MESSAGE, 0);

	if(intByte==-1)
	{ 
		close(m_intSock);
		throw runtime_error("50003"); // "impossible to receive a message from the server"
	} 

#ifdef WRITE_DEBUG_INFO_COMMUNICATION
	printf("Message Received: '%s' (length=%d)\n", a_strMessage, intByte);
#endif
}


/*******************************************************************/
void Communication::closeConnection()
{
	char 	strMsg[COM_MAX_SIZE_MESSAGE];

	if (m_intSock!=-1)
	{
		strcpy(strMsg, "QUIT");
		sendMessage(strMsg);
		close(m_intSock);
		m_intSock = -2;
#ifdef WRITE_DEBUG_INFO_COMMUNICATION
	    printf("Connection to server closed\n");
#endif
	}
}

/*******************************************************************/
char * Communication::getLocalIP()
{
	return m_strCurrentIP;
}

/*******************************************************************/
void Communication::syncronize(MarksManager * _objMarksManager)
{
	char 	strMsg[COM_MAX_SIZE_MESSAGE]; 

	if(m_intSock==-2) //Communication close on CTRL+C signal
	{
		return;
	}

#ifdef WRITE_DEBUG_INFO_COMMUNICATION
	printf("Syncronization with Touch Screen...\n");
#endif

	//Check if connection is closed. If it's, a new socket is opened
	if (m_intSock == -1)
	{
		openConnection();

		_objMarksManager->init();

		//Receive the message (lateral)
		receiveMessage(strMsg);

#ifdef WRITE_DEBUG_INFO_COMMUNICATION
		printf("Longitudinal parameters received\n");
#endif
		//manage the parameters (lateral) received
		_objMarksManager->setParameters(strMsg);

		//Receive the message (longitudinal)
		receiveMessage(strMsg);

#ifdef WRITE_DEBUG_INFO_COMMUNICATION
		printf("Lateral parameters received\n");
#endif
		//manage the parameters (longitudinal) received
		_objMarksManager->setParameters(strMsg);

	}

	if (_objMarksManager->requireToBeSent())
	{

		//aggregate the position in two message and send it

		//lateral
#ifdef WRITE_DEBUG_INFO_COMMUNICATION
		printf("Lateral parameters ready to be sent\n");
#endif
		_objMarksManager->getCurrentPositions(strMsg, MULTIPLEX_LATERAL);
		sendMessage(strMsg);

		//longitudinal
#ifdef WRITE_DEBUG_INFO_COMMUNICATION
		printf("Longitudinal parameters ready to be sent\n");
#endif
		_objMarksManager->getCurrentPositions(strMsg, MULTIPLEX_LONGITUDINAL);
		sendMessage(strMsg);

		//Reset the change flag
		_objMarksManager->parametersSent();
	}
}
