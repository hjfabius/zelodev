/***************************************************************************
                          hjGUI.h  -  header
                             -------------------
    copyright            : Fabio Cristini
    email                : fabio.cristini@fastwebnet.it

 ***************************************************************************/

#ifndef _hjGUI
	#define _hjGUI

//***************************************************************************
//                                 Include
//***************************************************************************

	#include "hjStruct.h"

//***************************************************************************
//                                 Methods
//***************************************************************************

	int			hjWriteIdleInterace	(DEV_T * dev);
	int			hjWriteInterface	(DEV_T * dev, char * strTitle, hjPattern * oPattern);
	int			hjWriteLogo			();
	void		hjPaintCircle		(int iCenterX, int iCenterY, int iRadius, DWORD lColor);
	void		hjPaintFullCircle	(int iCenterX, int iCenterY, int iRadius, DWORD lColor);
	void		hjPaintEllipse		(int iCenterX, int iCenterY, int iRadiusX, int iRadiusY, DWORD lColor);
	void		hjPaintLineH		(int iStartX, int iStartY, int iLength, DWORD lColor);
	void		hjPaintLineV		(int iStartX, int iStartY, int iLength, DWORD lColor);
	void		hjPaintLineD		(int iStartX, int iStartY, int iLength, DWORD lColor);
	void		hjPaintLineRD		(int iStartX, int iStartY, int iLength, DWORD lColor);
	void		hjPaintRect			(int iLeft, int iTop, int iWidth, int iHeight, DWORD lColor);
	void		hjPaintRegisterMark (hjPattern * oPattern, int iUnitIndex);
	void		hjPaintRegisterMarks(hjPattern * oPattern);

	
	void		hjPrintPointer		(int iNumPointer, vec_t vErr, DWORD lColor, bool bUsed);
	void		hjWriteLegend		(int iLeft, int iTop, DWORD lColor1, DWORD lColor2, bool bShadow);



#endif // _hjTrace