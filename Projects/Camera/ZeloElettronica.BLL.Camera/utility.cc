// utility.cc
#include "utility.h"

/*******************************************************************/
int Utility::writeImageToTxt(char * a_strFileName, PCCamera * a_objPCCamera)
{
	ofstream		objFile;
	int				intColor =0;

	objFile.open (a_strFileName);
	//read image, store by X colours, write in framebuffer the image
	for(int intX=0; intX<IMAGE_WIDTH; intX++)
	{
		intColor = 0;
		for(int intY=0; intY<IMAGE_HEIGHT; intY++)
		{
			intColor = a_objPCCamera->getPixel(intX, intY);
			objFile << intColor << "\t";
		}
		objFile << "\n";
	}
	objFile.close();
}

/*******************************************************************/
int Utility::printSquare(int a_intX, int a_intY, int a_intWidth, FrameBuffer * a_objFrameBuffer)
{
	for(int intX=0; intX<a_intWidth; intX++)
	{
		a_objFrameBuffer->setPixel(a_intX+intX, a_intY,				 0, 0, 0, 0);
		a_objFrameBuffer->setPixel(a_intX+intX, a_intY+a_intWidth/2, 0, 0, 0, 0);
	}

	for(int intY=0; intY<a_intWidth; intY++)
	{
		a_objFrameBuffer->setPixel(a_intX			, a_intY+intY, 0, 0, 0, 0);
		a_objFrameBuffer->setPixel(a_intX+a_intWidth, a_intY+intY, 0, 0, 0, 0);
	}
}


/*******************************************************************/
int Utility::saveSquare(int a_intX, int a_intY, int a_intWidth, PCCamera * a_objPCCamera, char * a_strFileName)
{
	ofstream		objFile;

	objFile.open (a_strFileName);
	for(int intX=a_intX; intX<a_intX+a_intWidth; intX++)
	{
		for(int intY=a_intY; intY<a_intY+a_intWidth; intY++)
		{
			objFile << a_objPCCamera->getPixel(intX, intY) << "\t";
		}
		objFile << "\n";
	}
	objFile.close();
}
