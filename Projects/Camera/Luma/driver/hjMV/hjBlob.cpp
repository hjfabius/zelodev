/***************************************************************************
                          hjBlob.cpp  -  description
                             -------------------
    copyright            : Fabio Cristini
    email                : fabio.cristini@fastwebnet.it

 ***************************************************************************/

//***************************************************************************
//                                 Includes
//***************************************************************************

	#include "ini.h"
	#include "hjBlob.h"
	#include <string.h>
	#include <stdlib.h>
	#include <stdio.h>
	#include "hjColors.h"
	#include "hjTrace.h"


//***************************************************************************
//                                 Defines
//***************************************************************************
	#define HJ_INI_FILENAME				"hjLuma.ini" //Obsolete

	//#define HJ_INI_PATTERN_1_FILENAME	"hjLuma_Pattern_1.ini"
	//#define HJ_INI_PATTERN_2_FILENAME	"hjLuma_Pattern_2.ini"



	#define HJ_IDEAL_POSITION_X			"Ideal_X"
	#define HJ_IDEAL_POSITION_Y			"Ideal_Y"
	#define HJ_REAL_POSITION_X			"Real__X"
	#define HJ_REAL_POSITION_Y			"Real__Y"

	#define HJ_LABEL_COLOR				"Color"
	#define HJ_NUM_UNITS				"Num_Unit"
	#define HJ_SEARCH_LENGTH			"Search_Length"
	#define HJ_CONFIG_SECTION_NAME		"Luma_Config"
//***************************************************************************
//                                 Variables
//***************************************************************************
	char		cBlobLabel[]			= "Blob_";

//***************************************************************************
//                                 Methods
//***************************************************************************

	
//-----------------------------------------------------------------------------
int hjInitAppIniFile(hjPatterns * _oPatterns)
{
	int				iRes;
	//char		*	strTmp;
	//hjPattern   *	oPattern;
	
	hjTrace("hjInitAppIniFile");

	strcpy(_oPatterns->Pattern[0].FileName, "hjLuma_Pattern_1.ini");
	sprintf(_oPatterns->Pattern[1].FileName, "hjLuma_Pattern_2.ini");


    if (hjFileExists("hjLuma_Pattern_1.ini") &&  hjFileExists("hjLuma_Pattern_2.ini") )
	{
		hjTrace("hjInitAppIniFile - Files already exist. Begin to read them.");
		iRes = hjReadIdealPositionBlob(_oPatterns);
	}
	else
	{
		hjTrace("hjInitAppIniFile -  Files non yet exist. They have to be created.");
		for(int i=0; i<HJ_NUM_PATTERN; i++)
		{
			for(int e=0; e<HJ_UNITS_PER_PATTERN; e++) 
			{
				_oPatterns->Pattern[i].Unit[e].ErrorPos.XPos = 0; 
				_oPatterns->Pattern[i].Unit[e].ErrorPos.YPos = 0; 

				_oPatterns->Pattern[i].Unit[e].IdealPos.XPos = 150; 
				_oPatterns->Pattern[i].Unit[e].IdealPos.YPos = 430; 

				_oPatterns->Pattern[i].Unit[e].RealPos.XPos = 150; 
				_oPatterns->Pattern[i].Unit[e].RealPos.YPos = 430; 

				sprintf(_oPatterns->Pattern[i].Unit[e].Name, "Unit %d", e);

				_oPatterns->Pattern[i].Unit[e].lColor = HJ_COLOR_BLACK;
			}
			_oPatterns->Pattern[i].iNumUnit		 = HJ_UNITS_PER_PATTERN;
			_oPatterns->Pattern[i].iSearchLength = HJ_MAX_SEARCH_LENGTH;
		}
		iRes = hjWriteIdealPositionBlob(_oPatterns);
	}

	return iRes;
}

int hjWriteIdealPositionBlob(hjPatterns * _oPatterns)
{
	unsigned int iRes = 0;
    char strSectionName[10];

	hjTrace("hjWriteIdealPositionBlob");


	for(int i=0; i<HJ_NUM_PATTERN; i++)
	{
		//Delete the old file
		hjTrace("hjWriteIdealPositionBlob - Deleting old file");
		remove(_oPatterns->Pattern[i].FileName);

		hjTrace(_oPatterns->Pattern[i].FileName);
		iRes = hjUpdateCfgItem(_oPatterns->Pattern[i].FileName,
					HJ_CONFIG_SECTION_NAME,
					HJ_NUM_UNITS,
					&(_oPatterns->Pattern[i].iNumUnit),
					Cfg_Integer,
					1);
		//if (iRes == 0) return -1;

		iRes = hjUpdateCfgItem(_oPatterns->Pattern[i].FileName,
					HJ_CONFIG_SECTION_NAME,
					HJ_SEARCH_LENGTH,
					&(_oPatterns->Pattern[i].iSearchLength),
					Cfg_Integer,
					1);
		//if (iRes == 0) return -1;



		hjTrace("hjWriteIdealPositionBlob - Looping to write Blob");
		for(int e=0; e<HJ_UNITS_PER_PATTERN; e++) 
		{
			sprintf(strSectionName, "%s%d", cBlobLabel, e);	

			iRes = hjUpdateCfgItem(_oPatterns->Pattern[i].FileName,
						strSectionName,
						HJ_IDEAL_POSITION_X,
						&(_oPatterns->Pattern[i].Unit[e].IdealPos.XPos),
						Cfg_Integer,
						1);
			//if (iRes == 0) return -1;


			iRes = hjUpdateCfgItem(_oPatterns->Pattern[i].FileName,
						strSectionName,
						HJ_IDEAL_POSITION_Y,
						&(_oPatterns->Pattern[i].Unit[e].IdealPos.YPos),
						Cfg_Integer,
						1);

			iRes = hjUpdateCfgItem(_oPatterns->Pattern[i].FileName,
						strSectionName,
						HJ_LABEL_COLOR,
						&(_oPatterns->Pattern[i].Unit[e].lColor),
						Cfg_Integer,
						1);

			
			//if (iRes == 0) return -1;
		}
	}

	return 0;
}


int hjReadIdealPositionBlob(hjPatterns * _oPatterns)
{

	unsigned int iRes = 0;
    char SectionName[12];

	hjTrace("hjReadIdealPositionBlob");

	//Initialization of the arry
	for(int i=0; i<HJ_NUM_PATTERN; i++)
	{
		iRes = hjReadCfgItem(_oPatterns->Pattern[i].FileName,
					HJ_CONFIG_SECTION_NAME,
					HJ_NUM_UNITS,
					&(_oPatterns->Pattern[i].iNumUnit),
					Cfg_Integer,
					1);
		if (iRes == 0) return -1;

		iRes = hjReadCfgItem(_oPatterns->Pattern[i].FileName,
					HJ_CONFIG_SECTION_NAME,
					HJ_SEARCH_LENGTH,
					&(_oPatterns->Pattern[i].iSearchLength),
					Cfg_Integer,
					1);
		if (iRes == 0) return -1;

		hjTraceN("hjReadIdealPositionBlob - ", _oPatterns->Pattern[i].iNumUnit);

		if ((_oPatterns->Pattern[i].iNumUnit < 1) || (_oPatterns->Pattern[i].iNumUnit > MAX_NUM_BLOB)) 
		{
			return -1;
		}


		for(int e=0; e<HJ_UNITS_PER_PATTERN; e++) 
		{
			if (e<_oPatterns->Pattern[i].iNumUnit)
			{
				sprintf(SectionName, "%s%d", cBlobLabel, e);	

				// X
				iRes = hjReadCfgItem(_oPatterns->Pattern[i].FileName,
							SectionName,
							HJ_IDEAL_POSITION_X,
							&(_oPatterns->Pattern[i].Unit[e].IdealPos.XPos),
							Cfg_Integer,
							1);
				if (iRes == 0) return -1;
				

				// Y
				iRes = hjReadCfgItem(_oPatterns->Pattern[i].FileName,
							SectionName,
							HJ_IDEAL_POSITION_Y,
							&(_oPatterns->Pattern[i].Unit[e].IdealPos.YPos),
							Cfg_Integer,
							1);
				if (iRes == 0) return -1;

				// Y
				iRes = hjReadCfgItem(_oPatterns->Pattern[i].FileName,
							SectionName,
							HJ_LABEL_COLOR,
							&(_oPatterns->Pattern[i].Unit[e].lColor),
							Cfg_Integer,
							1);
				if (iRes == 0) return -1;
				
			}
			else
			{
				_oPatterns->Pattern[i].Unit[e].IdealPos.XPos = 0; 
				_oPatterns->Pattern[i].Unit[e].IdealPos.YPos = 0;
				_oPatterns->Pattern[i].Unit[e].lColor = HJ_COLOR_WHITE;
			}

		}
	}

	return 0;
}