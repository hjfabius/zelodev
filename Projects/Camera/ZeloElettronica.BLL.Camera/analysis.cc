// analysis.cc
#include "analysis.h"

using namespace std;

/*******************************************************************/
// AVG of luminance based on FGLM areas
//
// ABCD
// EFGH
// ILMN
// OPQR
/*******************************************************************/
double analysis::getAvgCenter(point_t a_objPoint)
{	
	double	dblSum	= 0.0;
	int		intX	= 0;
	int		intY	= 0;

	try
	{
		for(int intX=a_objPoint.X+(SQUARE_ANALYSIS_SIZE/4); intX<a_objPoint.X+(3*SQUARE_ANALYSIS_SIZE/4); intX++)
		{
			for(int intY =a_objPoint.Y+(SQUARE_ANALYSIS_SIZE/4); intY<a_objPoint.Y+(3*SQUARE_ANALYSIS_SIZE/4); intY++)
			{
				dblSum = dblSum + m_objPCCamera->getPixel(intX, intY);
			}
		}

		return dblSum / ((SQUARE_ANALYSIS_SIZE/2) * (SQUARE_ANALYSIS_SIZE/2)) ;
	}
	catch (exception &e)
	{
		throw e;
	}
}


/*******************************************************************/
// AVG of luminance based on ADOR areas
//
// ABCD
// EFGH
// ILMN
// OPQR
/*******************************************************************/
double analysis::getAvgBorder(point_t a_objPoint)
{	
	double	dblSum	= 0.0;
	int		intX	= 0;
	int		intY	= 0;

	try
	{
		// AVG Based on AD
		for(int intX=a_objPoint.X; intX<a_objPoint.X+(SQUARE_ANALYSIS_SIZE/8); intX++)
		{
			// AVG Based on A
			for(int intY=a_objPoint.Y; intY<a_objPoint.Y+(SQUARE_ANALYSIS_SIZE/8); intY++)
			{
				dblSum = dblSum + m_objPCCamera->getPixel(intX, intY);
			}
			// AVG Based on D
			for(int intY=a_objPoint.Y+SQUARE_ANALYSIS_SIZE-(SQUARE_ANALYSIS_SIZE/8); intY<a_objPoint.Y+SQUARE_ANALYSIS_SIZE; intY++)
			{
				dblSum = dblSum + m_objPCCamera->getPixel(intX, intY);
			}
		}

		// AVG Based on OR
		for(int intX=a_objPoint.X+SQUARE_ANALYSIS_SIZE-(SQUARE_ANALYSIS_SIZE/8); intX<a_objPoint.X+SQUARE_ANALYSIS_SIZE; intX++)
		{
			// AVG Based on O
			for(int intY=a_objPoint.Y; intY<a_objPoint.Y+(SQUARE_ANALYSIS_SIZE/8); intY++)
			{
				dblSum = dblSum + m_objPCCamera->getPixel(intX, intY);
			}
			// AVG Based on AR
			for(int intY=a_objPoint.Y+SQUARE_ANALYSIS_SIZE-(SQUARE_ANALYSIS_SIZE/8); intY<a_objPoint.Y+SQUARE_ANALYSIS_SIZE; intY++)
			{
				dblSum = dblSum + m_objPCCamera->getPixel(intX, intY);
			}
		}
		return dblSum / ((SQUARE_ANALYSIS_SIZE/8)*(SQUARE_ANALYSIS_SIZE/8) * 4);
	}
	catch (exception &e)
	{
		throw e;
	}
}

/*******************************************************************/
// 
// Return the number of bit different between the pattern and the
// luminance read in the square starting in a_objPoint
//
/*******************************************************************/
int analysis::calculateLikeness(point_t a_objPoint)
{	
	int	intAVG	  = 0;
	int	intSum	  = 0;

	int	intX	= 0;
	int	intY	= 0;

	try
	{
		intAVG = (int) ((2*getAvgCenter(a_objPoint))+getAvgBorder(a_objPoint))/3;

		//Sum of difference between square of SQUARE_ANALYSIS_SIZE side
		//and pattern image read by pattern.raw file
		for(intX=0; intX<SQUARE_ANALYSIS_SIZE; intX++)
		{
			for(intY=0; intY<SQUARE_ANALYSIS_SIZE; intY++)
			{
				intSum += abs(
								abs((int)(m_objPCCamera->getPixel(a_objPoint.X+intX, a_objPoint.Y+intY)>intAVG)) -
								abs((int) m_arbooPattern[intX][intY])
							 );
			}
		}

		return intSum;
	}
	catch (exception &e)
	{
		throw e;
	}

}


/*******************************************************************/
//  Find pattern scanning area of 2*m_intMaxRange side
//	Jumping by ANALYSIS_OFFSET pixel each time
/*******************************************************************/
point_t analysis::findPatternInArea(int a_intX, int a_intY)
{
	point_t objPoint;
	point_t	objMinPoint;
	int		intLikeness		= MAX_ANALYZED_VALUE;
	int		intMinLikeness	= MAX_ANALYZED_VALUE;

	try
	{
		objMinPoint.X = -1;
		objMinPoint.Y = -1;

		//Scanning area of 2*m_intMaxRange side
		//looking for the Likeness minimum
		for (int intY=a_intY-m_intMaxRange; intY<a_intY+m_intMaxRange; intY+=ANALYSIS_OFFSET)
		{
			for (int intX=a_intX-m_intMaxRange; intX<a_intX+m_intMaxRange; intX+=ANALYSIS_OFFSET)
			{
				objPoint.X	= intX;
				objPoint.Y  = intY;

				if (!
					((intX<0) ||
					(intY<0) ||
					(intX+SQUARE_ANALYSIS_SIZE>m_intBoundX) ||
					(intY+SQUARE_ANALYSIS_SIZE>m_intBoundY)
					))
				{
					//Linkeness is calculated each time recalculating the average of the luminance
					intLikeness = calculateLikeness(objPoint);			
					if (intLikeness<intMinLikeness)
					{
						intMinLikeness = intLikeness;
						objMinPoint.X = objPoint.X;
						objMinPoint.Y = objPoint.Y;
					}
				}
			}
		}

		if (intMinLikeness > m_intThreshold)
		{
			return objMinPoint;
		}
		else
		{
#ifdef WRITE_DEBUG_INFO_FRAMEANALYSIS
			printf("\nno result below threshold\n");
#endif
			throw range_error("40004\n"); //"no result below threshold"
		}
	}
	catch (range_error &e)
	{
		throw e;
	}
	catch (exception &e)
	{
		throw e;
	}
}


/*******************************************************************/
// Look at the likeness minimum
// If the value is above threshold, the Range is enlarged
/*******************************************************************/
point_t analysis::findPattern(int a_intX, int a_intY, int a_intRange)
{
	pointAnalyzer	objResult;
	pointAnalyzer	arobjResult[4];
	pointAnalyzer	objPointAnalyze;
	point_t			objPoint;
	int				intX1					= 0;
	int				intX2					= 0;
	int				intY1					= 0;
	int				intY2					= 0;
	int				intNumAcceptableResult	= 0;
	int				intOutOfBound			= 0;

	try
	{
		intX1 = a_intX - a_intRange;
		intX2 = a_intX + a_intRange;
		intY1 = a_intY - a_intRange;
		intY2 = a_intY + a_intRange;

		if ((intX1<0) ||
			(intY1<0) ||
			(intX2>m_intBoundX) ||
			(intY2>m_intBoundY) ||
			(a_intRange>m_intMaxRange)
			)
		{
#ifdef WRITE_DEBUG_INFO_FRAMEANALYSIS
			printf("findPatternInArea - Searching arount %d-%d \n ", a_intX, a_intY);
#endif
			objPoint = findPatternInArea(a_intX, a_intY);
			if ((objPoint.X == a_intX) && (objPoint.Y == a_intY))
			{
#ifdef WRITE_DEBUG_INFO_FRAMEANALYSIS
				printf("findPatternInArea - Return same position: no result below threshold\n");
#endif
				throw range_error("40004\n"); //"no result below threshold"
			}
			else
			{
#ifdef WRITE_DEBUG_INFO_FRAMEANALYSIS
				printf("findPatternInArea - Found in         %d-%d\n", objPoint.X, objPoint.Y);
#endif
				return findPattern(objPoint.X, objPoint.Y, ANALYSIS_OFFSET);
			}
		}
#ifdef WRITE_DEBUG_INFO_FRAMEANALYSIS
		else
		{
			printf("findPattern in (%d,%d)-(%d,%d)\n", intX1, intY1, intX2, intY2);
		}
#endif
			

		for(int i=0; i<4; i++)
		{
			switch(i)
			{
				case 0:
					objPointAnalyze.Init(intX1, intY1);
					break;
				case 1:
					objPointAnalyze.Init(intX1, intY2);
					break;
				case 2:
					objPointAnalyze.Init(intX2, intY1);
					break;
				case 3:
					objPointAnalyze.Init(intX2, intY2);
					break;
				default:
#ifdef WRITE_DEBUG_INFO_FRAMEANALYSIS
					printf("analysis' index out of array\n");
#endif
					throw runtime_error("40002\n"); //"analysis' index out of array"
			}

			objResult = findMinimum(objPointAnalyze); 

			//printf("point %d-%d \t %d<%d\n", objPointAnalyze.Center.X, objPointAnalyze.Center.Y, objResult.AVG(), m_intThreshold);
			if (objResult.AVG() < m_intThreshold)
			{
				arobjResult[intNumAcceptableResult] = objResult;
				intNumAcceptableResult++;
			}
		}

		if (intNumAcceptableResult==0)
		{
#ifdef WRITE_DEBUG_INFO_FRAMEANALYSIS
			printf("no result below threshold -->findPattern with offset=%d\n", a_intRange +ANALYSIS_OFFSET);
#endif
			return findPattern(a_intX, a_intY, a_intRange +ANALYSIS_OFFSET);
			//throw runtime_error(40004, "no result below threshold");
		}

		objPoint.X = arobjResult[0].Center.X;
		objPoint.Y = arobjResult[0].Center.Y;

/*
		for(int i=0; i<intNumAcceptableResult; i++)
		{
			if ((objPoint.X != arobjResult[i].Center.X) && (objPoint.Y != arobjResult[i].Center.Y))
			{
#ifdef WRITE_DEBUG_INFO_FRAMEANALYSIS
				printf("minimum point is not unique\n");
#endif
				throw runtime_error("40005\n"); //"minimum point is not unique"
			}
		}
*/

#ifdef WRITE_DEBUG_INFO_FRAMEANALYSIS		
		printf("Center: \t%d-%d \n", objPoint.X, objPoint.Y);
#endif
		return objPoint;
	}
	catch (range_error &e)
	{
		throw e;
	}
	catch (exception &e)
	{
		throw e;
	}
}


/*******************************************************************/
pointAnalyzer analysis::findMinimum(pointAnalyzer	a_objPointAnalyze)
{
	point_t			objPoint;
	try
	{
		for(int i=0; i<NUM_ANALYZED_POINT; i++)
		{
			if(!a_objPointAnalyze.AnalyzedPoint[i])
			{
				switch(i)
				{
					case 0:
						objPoint.X = a_objPointAnalyze.Center.X-1;
						objPoint.Y = a_objPointAnalyze.Center.Y-1;
						break;
					case 1:
						objPoint.X = a_objPointAnalyze.Center.X;
						objPoint.Y = a_objPointAnalyze.Center.Y-1;
						break;
					case 2:
						objPoint.X = a_objPointAnalyze.Center.X+1;
						objPoint.Y = a_objPointAnalyze.Center.Y-1;
						break;
					case 3:
						objPoint.X = a_objPointAnalyze.Center.X-1;
						objPoint.Y = a_objPointAnalyze.Center.Y;
						break;
					case 4:
						objPoint.X = a_objPointAnalyze.Center.X;
						objPoint.Y = a_objPointAnalyze.Center.Y;
						break;
					case 5:
						objPoint.X = a_objPointAnalyze.Center.X+1;
						objPoint.Y = a_objPointAnalyze.Center.Y;
						break;
					case 6:
						objPoint.X = a_objPointAnalyze.Center.X-1;
						objPoint.Y = a_objPointAnalyze.Center.Y+1;
						break;
					case 7:
						objPoint.X = a_objPointAnalyze.Center.X;
						objPoint.Y = a_objPointAnalyze.Center.Y+1;
						break;
					case 8:
						objPoint.X = a_objPointAnalyze.Center.X+1;
						objPoint.Y = a_objPointAnalyze.Center.Y+1;
						break;
					default:
#ifdef WRITE_DEBUG_INFO_FRAMEANALYSIS
						printf("analysis' index out of array\n");
#endif
						throw runtime_error("40002\n"); //"analysis' index out of array"
				}

				a_objPointAnalyze.AnalyzedValues[i] = calculateLikeness(objPoint);
				a_objPointAnalyze.AnalyzedPoint[i]  = true;
			}
		}

		if (a_objPointAnalyze.IsCenter())
		{
			return a_objPointAnalyze;
		}
		else
		{
			return findMinimum(a_objPointAnalyze.NextAnalysis());
		}
	}
	catch (exception &e)
	{
		throw e;
	}
}





/*******************************************************************/
void analysis::readPattern(char * a_strFileName)
{
	string		strLine;
	int			intY = 0;
	int			intX = 0;
	ifstream	objFile;
	string		arstrValues[SQUARE_ANALYSIS_SIZE];
	int			intNumValues;
		
	try
	{
		objFile.open(a_strFileName);
		if(!objFile.is_open())
		{
#ifdef WRITE_DEBUG_INFO_FRAMEANALYSIS			
			printf("cannot open pattern file\n");
#endif
			throw runtime_error("30001\n"); //"cannot open pattern file"
		}

		while(getline(objFile, strLine))
		{
			intNumValues = splitString(strLine, "\t", arstrValues);
			for (int intX=0; intX<intNumValues; intX++)
			{
				m_arbooPattern[intX][intY] = (arstrValues[intX].c_str()[0] == '1');
			}
			intY++;
		}
		objFile.close();
	}
	catch (exception &e)
	{
#ifdef WRITE_DEBUG_INFO_FRAMEANALYSIS			
		printf("cannot elaborate pattern file\n");
#endif
		throw e;
	}
}


/*******************************************************************/
void analysis::init(PCCamera * a_objPCCamera, int a_intBoundX, int a_intBoundY, int a_intMaxRange, int a_intThreshold)
{
	m_intBoundX			= a_intBoundX;
	m_intBoundY			= a_intBoundY;
	m_intThreshold		= a_intThreshold;
	m_intMaxRange		= a_intMaxRange;
	m_objPCCamera		= a_objPCCamera;

#ifdef WRITE_DEBUG_INFO_FRAMEANALYSIS			
	printf("Frame Analysis init: Bounds=%d,%d - MaxRange=%d - Threshold %d\n", a_intBoundX, a_intBoundY, a_intMaxRange, a_intThreshold);
#endif	

	try
	{
		readPattern(PATTERN_FILE_NAME);
	}
	catch (exception &e)
	{
		throw e;
	}
}


/*******************************************************************/
int analysis::splitString(string a_strValue, string a_strDelim, string * a_arstrResults)
{
	try
	{
		int intCutAt	  = 0;
		int intNumResults = 0;
		while((intCutAt = a_strValue.find_first_of(a_strDelim)) != a_strValue.npos)
		{
			if(intCutAt>0)
			{
				a_arstrResults[intNumResults] = a_strValue.substr(0,intCutAt);  
				intNumResults++;
			}
			a_strValue = a_strValue.substr(intCutAt+1);
		}
		if (a_strValue.length()>0)
		{
			a_arstrResults[intNumResults] = a_strValue;  
			intNumResults++;
		}
		return intNumResults;
	}
	catch (exception &e)
	{
		throw e;
	}
}


/*******************************************************************/
bool analysis::getPatternPixel(int a_intX, int a_intY)
{
	return m_arbooPattern[a_intX][a_intY];
}
