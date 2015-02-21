// utility.h
#include "definition.h"

#ifndef UTILITY_H
	#define UTILITY_H

	class Utility {

	public:
		int writeImageToTxt(char * a_strFileName, PCCamera * a_objPCCamera);
		
		int printSquare(int a_intX, int a_intY, int a_intWidth, FrameBuffer * a_objFrameBuffer);
		int saveSquare(int a_intX, int a_intY, int a_intWidth, PCCamera * a_objPCCamera, char * a_strFileName);

	};

#endif
