// pointAnalyzer.cc
#include "pointAnalyzer.h"


/*******************************************************************/
bool	pointAnalyzer::IsCenter(void)
{
	int iMinPoint = -1;
	int iMinValue = MAX_ANALYZED_VALUE;

	try
	{
		for(int i=0; i<NUM_ANALYZED_POINT; i++)
		{
			if (!AnalyzedPoint[i])
			{
				throw runtime_error("40001"); //"value's matrix is not completed"
			}

			if(AnalyzedValues[i]<iMinValue)
			{
				iMinPoint = i;
				iMinValue = AnalyzedValues[i];
			}
		}
											//  0	1	2
		return (iMinPoint == CENTER_POINT);	//	3  >4<	5
											//	6	7	8
	}
	catch (exception &e)
	{
		throw e;
	}

}


/*******************************************************************/
pointAnalyzer pointAnalyzer::NextAnalysis(void)
{
	pointAnalyzer	objNextPoint;
	int				iMinPoint = -1;
	int				iMinValue = MAX_ANALYZED_VALUE;

	objNextPoint.Init(-1,-1);

	try
	{
		for(int i=0; i<NUM_ANALYZED_POINT; i++)
		{
			if (!AnalyzedPoint[i])
			{
				throw runtime_error("40001"); //"value's matrix is not completed"
			}
			if(AnalyzedValues[i]<iMinValue)
			{
				iMinPoint = i;
				iMinValue = AnalyzedValues[i];
			}
		}

		switch(iMinPoint)
		{
			case 0:
				objNextPoint.Center.X = Center.X-1;
				objNextPoint.Center.Y = Center.Y-1;
				objNextPoint.AnalyzedValues[0]=MAX_ANALYZED_VALUE;
				objNextPoint.AnalyzedValues[1]=MAX_ANALYZED_VALUE;
				objNextPoint.AnalyzedValues[2]=MAX_ANALYZED_VALUE;
				objNextPoint.AnalyzedValues[3]=MAX_ANALYZED_VALUE;
				objNextPoint.AnalyzedValues[4]=AnalyzedValues[0];
				objNextPoint.AnalyzedValues[5]=AnalyzedValues[1];
				objNextPoint.AnalyzedValues[6]=MAX_ANALYZED_VALUE;
				objNextPoint.AnalyzedValues[7]=AnalyzedValues[3];
				objNextPoint.AnalyzedValues[8]=AnalyzedValues[4];

				objNextPoint.AnalyzedPoint [0]=false;
				objNextPoint.AnalyzedPoint [1]=false;
				objNextPoint.AnalyzedPoint [2]=false;
				objNextPoint.AnalyzedPoint [3]=false;
				objNextPoint.AnalyzedPoint [4]=true;
				objNextPoint.AnalyzedPoint [5]=true;
				objNextPoint.AnalyzedPoint [6]=false;
				objNextPoint.AnalyzedPoint [7]=true;
				objNextPoint.AnalyzedPoint [8]=true;
				break;
			case 1:
				objNextPoint.Center.X = Center.X;
				objNextPoint.Center.Y = Center.Y-1;
				objNextPoint.AnalyzedValues[0]=MAX_ANALYZED_VALUE;
				objNextPoint.AnalyzedValues[1]=MAX_ANALYZED_VALUE;
				objNextPoint.AnalyzedValues[2]=MAX_ANALYZED_VALUE;
				objNextPoint.AnalyzedValues[3]=AnalyzedValues[0];
				objNextPoint.AnalyzedValues[4]=AnalyzedValues[1];
				objNextPoint.AnalyzedValues[5]=AnalyzedValues[2];
				objNextPoint.AnalyzedValues[6]=AnalyzedValues[3];
				objNextPoint.AnalyzedValues[7]=AnalyzedValues[4];
				objNextPoint.AnalyzedValues[8]=AnalyzedValues[5];

				objNextPoint.AnalyzedPoint [0]=false;
				objNextPoint.AnalyzedPoint [1]=false;
				objNextPoint.AnalyzedPoint [2]=false;
				objNextPoint.AnalyzedPoint [3]=true;
				objNextPoint.AnalyzedPoint [4]=true;
				objNextPoint.AnalyzedPoint [5]=true;
				objNextPoint.AnalyzedPoint [6]=true;
				objNextPoint.AnalyzedPoint [7]=true;
				objNextPoint.AnalyzedPoint [8]=true;
				break;
			case 2:
				objNextPoint.Center.X = Center.X+1;
				objNextPoint.Center.Y = Center.Y-1;
				objNextPoint.AnalyzedValues[0]=MAX_ANALYZED_VALUE;
				objNextPoint.AnalyzedValues[1]=MAX_ANALYZED_VALUE;
				objNextPoint.AnalyzedValues[2]=MAX_ANALYZED_VALUE;
				objNextPoint.AnalyzedValues[3]=AnalyzedValues[1];
				objNextPoint.AnalyzedValues[4]=AnalyzedValues[2];
				objNextPoint.AnalyzedValues[5]=MAX_ANALYZED_VALUE;
				objNextPoint.AnalyzedValues[6]=AnalyzedValues[4];
				objNextPoint.AnalyzedValues[7]=AnalyzedValues[5];
				objNextPoint.AnalyzedValues[8]=MAX_ANALYZED_VALUE;

				objNextPoint.AnalyzedPoint [0]=false;
				objNextPoint.AnalyzedPoint [1]=false;
				objNextPoint.AnalyzedPoint [2]=false;
				objNextPoint.AnalyzedPoint [3]=true;
				objNextPoint.AnalyzedPoint [4]=true;
				objNextPoint.AnalyzedPoint [5]=false;
				objNextPoint.AnalyzedPoint [6]=true;
				objNextPoint.AnalyzedPoint [7]=true;
				objNextPoint.AnalyzedPoint [8]=false;
				break;
			case 3:
				objNextPoint.Center.X = Center.X-1;
				objNextPoint.Center.Y = Center.Y;
				objNextPoint.AnalyzedValues[0]=MAX_ANALYZED_VALUE;
				objNextPoint.AnalyzedValues[1]=AnalyzedValues[0];
				objNextPoint.AnalyzedValues[2]=AnalyzedValues[1];
				objNextPoint.AnalyzedValues[3]=MAX_ANALYZED_VALUE;
				objNextPoint.AnalyzedValues[4]=AnalyzedValues[3];
				objNextPoint.AnalyzedValues[5]=AnalyzedValues[4];
				objNextPoint.AnalyzedValues[6]=MAX_ANALYZED_VALUE;
				objNextPoint.AnalyzedValues[7]=AnalyzedValues[6];
				objNextPoint.AnalyzedValues[8]=AnalyzedValues[7];

				objNextPoint.AnalyzedPoint [0]=false;
				objNextPoint.AnalyzedPoint [1]=true;
				objNextPoint.AnalyzedPoint [2]=true;
				objNextPoint.AnalyzedPoint [3]=false;
				objNextPoint.AnalyzedPoint [4]=true;
				objNextPoint.AnalyzedPoint [5]=true;
				objNextPoint.AnalyzedPoint [6]=false;
				objNextPoint.AnalyzedPoint [7]=true;
				objNextPoint.AnalyzedPoint [8]=true;
				break;
			case 4:
				objNextPoint.Center.X = Center.X;
				objNextPoint.Center.Y = Center.Y;
				objNextPoint.AnalyzedValues[0]=AnalyzedValues[0];
				objNextPoint.AnalyzedValues[1]=AnalyzedValues[1];
				objNextPoint.AnalyzedValues[2]=AnalyzedValues[2];
				objNextPoint.AnalyzedValues[3]=AnalyzedValues[3];
				objNextPoint.AnalyzedValues[4]=AnalyzedValues[4];
				objNextPoint.AnalyzedValues[5]=AnalyzedValues[5];
				objNextPoint.AnalyzedValues[6]=AnalyzedValues[6];
				objNextPoint.AnalyzedValues[7]=AnalyzedValues[7];
				objNextPoint.AnalyzedValues[8]=AnalyzedValues[8];

				objNextPoint.AnalyzedPoint [0]=true;
				objNextPoint.AnalyzedPoint [1]=true;
				objNextPoint.AnalyzedPoint [2]=true;
				objNextPoint.AnalyzedPoint [3]=true;
				objNextPoint.AnalyzedPoint [4]=true;
				objNextPoint.AnalyzedPoint [5]=true;
				objNextPoint.AnalyzedPoint [6]=true;
				objNextPoint.AnalyzedPoint [7]=true;
				objNextPoint.AnalyzedPoint [8]=true;
				break;
			case 5:
				objNextPoint.Center.X = Center.X+1;
				objNextPoint.Center.Y = Center.Y;
				objNextPoint.AnalyzedValues[0]=AnalyzedValues[1];
				objNextPoint.AnalyzedValues[1]=AnalyzedValues[2];
				objNextPoint.AnalyzedValues[2]=MAX_ANALYZED_VALUE;
				objNextPoint.AnalyzedValues[3]=AnalyzedValues[4];
				objNextPoint.AnalyzedValues[4]=AnalyzedValues[5];
				objNextPoint.AnalyzedValues[5]=MAX_ANALYZED_VALUE;
				objNextPoint.AnalyzedValues[6]=AnalyzedValues[7];
				objNextPoint.AnalyzedValues[7]=AnalyzedValues[8];
				objNextPoint.AnalyzedValues[8]=MAX_ANALYZED_VALUE;

				objNextPoint.AnalyzedPoint [0]=true;
				objNextPoint.AnalyzedPoint [1]=true;
				objNextPoint.AnalyzedPoint [2]=false;
				objNextPoint.AnalyzedPoint [3]=true;
				objNextPoint.AnalyzedPoint [4]=true;
				objNextPoint.AnalyzedPoint [5]=false;
				objNextPoint.AnalyzedPoint [6]=true;
				objNextPoint.AnalyzedPoint [7]=true;
				objNextPoint.AnalyzedPoint [8]=false;
				break;
			case 6:
				objNextPoint.Center.X = Center.X-1;
				objNextPoint.Center.Y = Center.Y+1;
				objNextPoint.AnalyzedValues[0]=MAX_ANALYZED_VALUE;
				objNextPoint.AnalyzedValues[1]=AnalyzedValues[3];
				objNextPoint.AnalyzedValues[2]=AnalyzedValues[4];
				objNextPoint.AnalyzedValues[3]=MAX_ANALYZED_VALUE;
				objNextPoint.AnalyzedValues[4]=AnalyzedValues[6];
				objNextPoint.AnalyzedValues[5]=AnalyzedValues[7];
				objNextPoint.AnalyzedValues[6]=MAX_ANALYZED_VALUE;
				objNextPoint.AnalyzedValues[7]=MAX_ANALYZED_VALUE;
				objNextPoint.AnalyzedValues[8]=MAX_ANALYZED_VALUE;

				objNextPoint.AnalyzedPoint [0]=false;
				objNextPoint.AnalyzedPoint [1]=true;
				objNextPoint.AnalyzedPoint [2]=true;
				objNextPoint.AnalyzedPoint [3]=false;
				objNextPoint.AnalyzedPoint [4]=true;
				objNextPoint.AnalyzedPoint [5]=true;
				objNextPoint.AnalyzedPoint [6]=false;
				objNextPoint.AnalyzedPoint [7]=false;
				objNextPoint.AnalyzedPoint [8]=false;
				break;
			case 7:
				objNextPoint.Center.X = Center.X;
				objNextPoint.Center.Y = Center.Y+1;
				objNextPoint.AnalyzedValues[0]=AnalyzedValues[3];
				objNextPoint.AnalyzedValues[1]=AnalyzedValues[4];
				objNextPoint.AnalyzedValues[2]=AnalyzedValues[5];
				objNextPoint.AnalyzedValues[3]=AnalyzedValues[6];
				objNextPoint.AnalyzedValues[4]=AnalyzedValues[7];
				objNextPoint.AnalyzedValues[5]=AnalyzedValues[8];
				objNextPoint.AnalyzedValues[6]=MAX_ANALYZED_VALUE;
				objNextPoint.AnalyzedValues[7]=MAX_ANALYZED_VALUE;
				objNextPoint.AnalyzedValues[8]=MAX_ANALYZED_VALUE;

				objNextPoint.AnalyzedPoint [0]=true;
				objNextPoint.AnalyzedPoint [1]=true;
				objNextPoint.AnalyzedPoint [2]=true;
				objNextPoint.AnalyzedPoint [3]=true;
				objNextPoint.AnalyzedPoint [4]=true;
				objNextPoint.AnalyzedPoint [5]=true;
				objNextPoint.AnalyzedPoint [6]=false;
				objNextPoint.AnalyzedPoint [7]=false;
				objNextPoint.AnalyzedPoint [8]=false;
				break;
			case 8:
				objNextPoint.Center.X = Center.X+1;
				objNextPoint.Center.Y = Center.Y+1;
				objNextPoint.AnalyzedValues[0]=AnalyzedValues[4];
				objNextPoint.AnalyzedValues[1]=AnalyzedValues[5];
				objNextPoint.AnalyzedValues[2]=MAX_ANALYZED_VALUE;
				objNextPoint.AnalyzedValues[3]=AnalyzedValues[7];
				objNextPoint.AnalyzedValues[4]=AnalyzedValues[8];
				objNextPoint.AnalyzedValues[5]=MAX_ANALYZED_VALUE;
				objNextPoint.AnalyzedValues[6]=MAX_ANALYZED_VALUE;
				objNextPoint.AnalyzedValues[7]=MAX_ANALYZED_VALUE;
				objNextPoint.AnalyzedValues[8]=MAX_ANALYZED_VALUE;

				objNextPoint.AnalyzedPoint [0]=true;
				objNextPoint.AnalyzedPoint [1]=true;
				objNextPoint.AnalyzedPoint [2]=false;
				objNextPoint.AnalyzedPoint [3]=true;
				objNextPoint.AnalyzedPoint [4]=true;
				objNextPoint.AnalyzedPoint [5]=false;
				objNextPoint.AnalyzedPoint [6]=false;
				objNextPoint.AnalyzedPoint [7]=false;
				objNextPoint.AnalyzedPoint [8]=false;
				break;
			default:
				throw runtime_error("40002"); //"analysis' index out of array"
		}
		return objNextPoint;
	}
	catch (exception &e)
	{
		throw e;
	}
}

/*******************************************************************/
void pointAnalyzer::Init(int a_intX, int a_intY)
{
	Center.X = a_intX;
	Center.Y = a_intY;
	AnalyzedValues[0]=MAX_ANALYZED_VALUE;
	AnalyzedValues[1]=MAX_ANALYZED_VALUE;
	AnalyzedValues[2]=MAX_ANALYZED_VALUE;
	AnalyzedValues[3]=MAX_ANALYZED_VALUE;
	AnalyzedValues[4]=MAX_ANALYZED_VALUE;
	AnalyzedValues[5]=MAX_ANALYZED_VALUE;
	AnalyzedValues[6]=MAX_ANALYZED_VALUE;
	AnalyzedValues[7]=MAX_ANALYZED_VALUE;
	AnalyzedValues[8]=MAX_ANALYZED_VALUE;

	AnalyzedPoint [0]=false;
	AnalyzedPoint [1]=false;
	AnalyzedPoint [2]=false;
	AnalyzedPoint [3]=false;
	AnalyzedPoint [4]=false;
	AnalyzedPoint [5]=false;
	AnalyzedPoint [6]=false;
	AnalyzedPoint [7]=false;
	AnalyzedPoint [8]=false;
}

/*******************************************************************/
int pointAnalyzer::AVG(void)
{
	if(AnalyzedPoint[CENTER_POINT])
		return AnalyzedValues[CENTER_POINT];
	else
		throw runtime_error("40001"); //"value's matrix is not completed"
		//return MAX_ANALYZED_VALUE;
}
