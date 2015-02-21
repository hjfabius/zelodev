/***************************************************************************
                          hjTrace.h  -  header
                             -------------------
    copyright            : Fabio Cristini
    email                : fabio.cristini@fastwebnet.it

 ***************************************************************************/

#ifndef _hjTrace
	#define _hjTrace

	#include "hjStruct.h"

//***************************************************************************
//                                 Methods
//***************************************************************************

	void hjInitTrace();
	void hjTrace(char *strMsg);
	void hjTraceM( int argc, char *argv[] );
	void hjTraceN(char *strMsg, int iNumber );
	void hjTraceInt(int iNumber);
	void hjEndTrace();
	void hjWriteImage(hjMatrix *iMatrix);


#endif // _hjTrace