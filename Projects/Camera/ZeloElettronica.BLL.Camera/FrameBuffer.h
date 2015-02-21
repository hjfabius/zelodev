//FrameBuffer.h
#include "definition.h"

#ifndef FRAMEBUFFER_H
	#define FRAMEBUFFER_H

	using namespace std;


	class FrameBuffer 
	{
		protected:
			int							m_intFrameBuffer;
			struct fb_var_screeninfo	m_objVarInfo;
			struct fb_fix_screeninfo	m_objFixInfo;
			long int					m_lngScreenSize;
			char *						m_cFrameBufferMemoryPointer;
			PCCamera *					m_objPCCamera;
			MarksManager *				m_objMarksManager;
			int							m_intXBoundOffset;
			int							m_intYBoundOffset;

		public:
			void init(PCCamera * a_objPCCamera, MarksManager * a_objMarksManager, int a_intXBoundOffset, int a_intYBoundOffset);
			void quit();
			void setPixel(int a_intX, int a_intY, int a_shoRed, 
				          int a_shoGreen, int a_shoBlue, int a_shoAlpha);
			void showImage(int a_intXBound, int a_intYBound);
			void showPositions(int a_intPageNumber);
			void test();
	};
#endif
