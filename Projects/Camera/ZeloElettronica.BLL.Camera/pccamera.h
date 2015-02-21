// pccamera.h
#include "definition.h"

#ifndef PCCAMERA_H
	#define PCCAMERA_H

	using namespace std;

	class PCCamera   {
		int						m_intPCCam;
		struct video_picture	m_objVidPict;
		struct video_window		m_objVidWin;
		unsigned char *			m_ucImage;
		int						m_intImageSize;

	public:
		void			init();
		void			quit();

		void			setIntegrationTime(unsigned short usValue);
		unsigned short	getIntegrationTime(); //1<usValue<504 means (33*usValue)/504 ms.

		void			setTrigger();
		void			resetTrigger();

		void			setIO(unsigned char ucValue);
		unsigned char	getIO();
		void			getMessage(unsigned char * strMessage);
		void			sendInteger(unsigned int intValue);
		int				getPageNumber();


		void			acquireImage();

		int				getPixel(int a_intX, int a_intY);

		void			saveImage(string a_strFileName);
		void			saveImage(const char * a_strFileName);
	};
#endif
