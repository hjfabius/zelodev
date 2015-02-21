// AnalysisManager.h
#include "definition.h"

#ifndef ANALYSISMANAGER_H
	#define ANALYSISMANAGER_H

	using namespace std;

	class AnalysisManager   {

	protected:
		analysis		m_objAnalysis;
		MarksManager *	m_objMarksManager;

	public:
		void	updatePositions(int a_intPageNumber);
		void	init(PCCamera * a_objPCCamera, MarksManager * a_objMarksManager, int a_intBoundX, int a_intBoundY, int a_intMaxRange, int a_intThreshold);
		bool	getPatternPixel(int a_intX, int a_intY);

	};

#endif
