// pointAnalyzer.h
#include "definition.h"

#ifndef POINTANALYZER_H
	#define POINTANALYZER_H

	using namespace std;

	class pointAnalyzer   {

	public:
		point_t				Center;
		int					AnalyzedValues[NUM_ANALYZED_POINT];
		int					AnalyzedPoint [NUM_ANALYZED_POINT];

		int					AVG();
		bool				IsCenter();
		pointAnalyzer		NextAnalysis();
		void				Init(int a_intX, int a_intY);
	};
#endif
