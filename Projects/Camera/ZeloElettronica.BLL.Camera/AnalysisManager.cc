// analysis.cc
#include "AnalysisManager.h"

using namespace std;


/*******************************************************************/
void AnalysisManager::init(PCCamera * a_objPCCamera, MarksManager * a_objMarksManager, int a_intBoundX, int a_intBoundY, int a_intMaxRange, int a_intThreshold)
{
	m_objAnalysis.init(a_objPCCamera, a_intBoundX, a_intBoundY, a_intMaxRange, a_intThreshold);
	m_objMarksManager = a_objMarksManager;
}


/*******************************************************************/
void AnalysisManager::updatePositions(int a_intPageNumber)
{
	point_t			objIdealPoint;
	point_t			objCurrentPoint;

	for (int intMarkIndex=0;intMarkIndex<MAX_NUM_MARKS; intMarkIndex++)
	{
		if  ((m_objMarksManager->m_arobjMarks[intMarkIndex].getPage() == a_intPageNumber) &&
			 (m_objMarksManager->m_arobjMarks[intMarkIndex].isUsed() ))
		{

			objIdealPoint.X = m_objMarksManager->m_arobjMarks[intMarkIndex].getPositionAbsolute(MULTIPLEX_LONGITUDINAL);
			objIdealPoint.Y = m_objMarksManager->m_arobjMarks[intMarkIndex].getPositionAbsolute(MULTIPLEX_LATERAL);
			if ((objIdealPoint.X <0) || (objIdealPoint.Y <0))
			{
				throw runtime_error("40006"); //"point to search is out of bounds"
			}

			try
			{
#ifdef WRITE_DEBUG_INFO_FRAMEANALYSIS
				printf("Mark %d - \t %d - %d\n", intMarkIndex, objIdealPoint.X, objIdealPoint.Y);
#endif
				objCurrentPoint = m_objAnalysis.findPattern(objIdealPoint.X, objIdealPoint.Y, ANALYSIS_OFFSET);
				m_objMarksManager->m_arobjMarks[intMarkIndex].setPositionAbsolute(MULTIPLEX_LONGITUDINAL,	objCurrentPoint.X);
				m_objMarksManager->m_arobjMarks[intMarkIndex].setPositionAbsolute(MULTIPLEX_LATERAL,		objCurrentPoint.Y);
			}
			catch (range_error &ex)
			{
				printf("Mark %d - Range Error -		%d %d\n", intMarkIndex, objIdealPoint.X, objIdealPoint.Y);
			}
			catch (exception &ex)
			{
				printf("Mark %d - Exception Error\n");
				throw ex;
			}
		}
	}
}


/*******************************************************************/
bool AnalysisManager::getPatternPixel(int a_intX, int a_intY)
{
	return m_objAnalysis.getPatternPixel(a_intX, a_intY);
}
