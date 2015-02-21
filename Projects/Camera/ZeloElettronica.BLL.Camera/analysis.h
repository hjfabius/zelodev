// analysis.h
#include "definition.h"

#ifndef ANALYSIS_H
	#define ANALYSIS_H

	using namespace std;

	class analysis   {

	protected:
		bool			m_arbooPattern[SQUARE_ANALYSIS_SIZE][SQUARE_ANALYSIS_SIZE];
		int				m_intThreshold;
		int				m_intMaxRange;
		PCCamera *		m_objPCCamera;
		int				m_intBoundX;
		int				m_intBoundY; 

		double			getAvgBorder(point_t a_objPoint);
		double			getAvgCenter(point_t a_objPoint);

		void			readPattern(char * a_strFileName);
		pointAnalyzer	findMinimum(pointAnalyzer a_objPointAnalyze);
		point_t			findPatternInArea(int a_intX, int a_intY);
		int				splitString(string a_strValue, string a_strDelim, string * a_arstrResults);
		int				calculateLikeness(point_t a_objPoint);

		
	public:
		point_t			findPattern(int a_intX, int a_intY, int a_intRange);
		void			init(PCCamera * a_objPCCamera, int a_intBoundX, int a_intBoundY, int a_intMaxRange, int a_intThreshold);
		bool			getPatternPixel(int a_intX, int a_intY);

	};

#endif
