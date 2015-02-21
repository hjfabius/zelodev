/***************************************************************************
                          hjTrace.cpp  -  description
                             -------------------
    copyright            : Fabio Cristini
    email                : fabio.cristini@fastwebnet.it

 ***************************************************************************/

//***************************************************************************
//                                 Includes
//***************************************************************************

	#include <ctype.h>
	#include <unistd.h>
	#include <stdlib.h>
	#include <stdio.h>
	#include <iostream>
	#include <fstream>
	#include <time.h>
	#include <string.h>
	#include "hjTrace.h"

//***************************************************************************
//                                 Defines
//***************************************************************************	
	#define APP_NAME	"Luma"

//***************************************************************************
//                                 Variables
//***************************************************************************
	ofstream outMsg;

//***************************************************************************
//                                 Methods
//***************************************************************************

void hjTrace(char *strMsg)
{
	outMsg << APP_NAME << " - " << strMsg << endl;
}

void hjTraceM( int argc, char *argv[] )
{
	char str[100];

	for ( int i = 0; i < argc ; i++ )
	{
		strcat (str,argv[i]);
	}
	hjTrace( str);
}



void hjTraceInt(int iNumber)
{
	outMsg << APP_NAME << " - " << iNumber << endl;
}


void hjTraceN(char *strMsg, int iNumber )
{
	outMsg << APP_NAME << " - " << strMsg << iNumber << endl;
}



void hjWriteImage(hjMatrix *iMatrix)
{
	remove("image.txt");
	ofstream outImageMsg;
	outImageMsg.open("image.txt");

	for (int iY = 0; iY<iMatrix->Height ; iY++)
	{
		for (int iX = 0; iX<iMatrix->Width ; iX++)
		{
			if ((iX % 2 == 0) && (iY % 2 == 0))
                outImageMsg << iX << "\t" << iY << "\t" << iMatrix->Pixel[iX][iY] << "\t" << endl;
		}
	}

	outImageMsg.flush();
	outImageMsg.close(); 

}


void hjInitTrace()
{
	time_t	timer;
	struct	tm *tb;
	char	strFileName[50];
	
	timer = time(NULL);		// Current time
	tb = localtime(&timer); // Conversion to m
	
	sprintf(strFileName, "Log_%d_%d_%d.txt", tb->tm_year + 1900, tb->tm_mon, tb->tm_mday);


	outMsg.open(strFileName);
    if (!outMsg.is_open())
	{
		cout << APP_NAME << " - ERROR: cannot open " << strFileName << endl;
	}
	else
	{
		hjTrace("Versione hjLuma : " __DATE__  " / " __TIME__);
		hjTrace("Start");
	}
}

void hjEndTrace()
{
	sync();
    if (outMsg.is_open())
	{
		hjTrace("End");
		outMsg.flush();
		outMsg.close(); 
	}
}







