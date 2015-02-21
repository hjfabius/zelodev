/* CAMTYPE.C   Camera Type definition Utility for PCprocess Modules MGVS, MRGB
                    and PCimage Module MGVSi

    uf 14.03.1995
*/
/* ------------------------------------------------------------
   $Date: 2002/07/30 11:09:17 $

   $Log: camtype.c,v $
   Revision 1.14  2002/07/30 11:09:17  uf
   no message

   Revision 1.13  2002/07/04 11:12:02  uf
   add only new cameras, already defined cameras will be overwritten

   Revision 1.12  2002/06/18 11:46:04  uf
   changes for MVacquireControl:
   - delete makro if(p) ...
   - offset calculation for 'default' boards
   - #if 0 deleted
   - pccdinSelVideomode remarks deleted
   - acq.ypos[0] = acq.xpos[0] remarked because it's wrong in hardlive
   - _mvSelInputClk() checks if this function is available before calling it

   Revision 1.11  2002/04/11 09:53:32  rs
   The parameter 'MaxCameraDefs' in mvInitCamTypeDefinitions() can be set to
   zero without causing an error. The memory for the array of camera definitions
   will be resized automatically.

   Revision 1.10  2002/04/04 09:43:22  ug
   error message changed

   Revision 1.9  2002/01/10 14:54:48  hg
   #define min needed for linux

   Revision 1.8  2001/10/18 14:01:16  rs
   mvSelCamera ( ), if function fails ( camera not found ),  a warning is set

   Revision 1.7  2001/08/09 13:43:32  rs
   BUGFIX: NONINTERLACED mode => ypos[0] = ypos[1] = 0

   Revision 1.6  2001/08/08 12:36:56  rs
   Incorrect char* type:
   -> char FAR* changed to const char FAR* if possible

   Revision 1.5  2001/08/08 11:52:28  rs
   BUGFIX: the count of cam types has been limited (50)
   -> mvDefCamType() resizes the cam type array automatically

   Revision 1.4  2001/08/08 11:01:27  rs
   Merged with version 1.4 from the cvs-module 'Driver'

   Revision 1.3  2001/06/11 10:56:05  hs
   no message

   Revision 1.2  2001/03/22 10:12:13  hs
   Cvs entries corrected.

*/


#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <malloc.h>


#include <mv.h>

// #define MV_DLL // 1.3

#include "camtype.h"

#define CAM_DEBUG	0
#if CAM_DEBUG
#include "infmsg.h"
#define CAMMSG(p)	INFMSG(p)
#else
#define CAMMSG(p)	(void)0
#endif

#define UNUSED(v)  if(v) v=v

#ifdef linux
#define min(a,b)	((a)<(b)?(a):(b))
#endif

#define _IsMVFunctionAvailable(dev,name)  ((_msize(dev)>(size_t)STRUCT_OFFS(dev,name)) && ( ((void FAR*)(dev)->name != (void FAR*)(dev)->First)  ))
#define _mvSelInputClk(dev,n)  do { if (IsFunctionAvailable(dev,SelInputClk) ) mvSelInputClk( dev, (n) ); }while(0)

#define _delete(p) do { if(p) free(p); (p)=NULL; } while(0)

#define DIG_MGVS    1
#define DIG_MRGB    2
#define DIG_MGVSi   3
#define DIG_PCISG   4
#define DIG_PCISC   5
#define DIG_PCISRGB 6
#define DIG_PCISDIG 7


static LPCAMTYPE_T pActCamType      = NULL;
static LPCAMTYPE_T pFirstCamType    = NULL;
static WORD        NumCamTypes      = 0;
static WORD        MaxNumCamTypes   = 0;
static const char FAR*   slVideoModes[]   = CAM_VIDEO_MODES;
static const char FAR*   slInterlModes[]  = CAM_INTERL_MODES;
static const char FAR*   slAcquireModes[] = CAM_ACQUIRE_MODES;
static const char FAR*   slStartModes[]   = CAM_START_MODES;
static const char FAR*   slFilterModes[]  = CAM_FILTER;
static const char FAR*   slParModes[]     = CAM_UNIT_MODES;
static const char FAR*   slClockModes[]   = CAM_CLOCK_MODES;
static const char FAR*   slInvertModes[]  = CAM_INVERT_MODES;
static const char FAR*   slPhysCamTypes[] = CAM_PHYS_CAM_TYPES;

CAMTYPE_T FAR *pdefault_camdef = default_camdef ;


LPCAMTYPE_T  _MVDFKT mvGetNewCameraTypePtr (DEV_T FAR* dev, const char FAR* Name);
int GetActCameraTypeIndex();
void SetActCameraTypeIndex( int idx );


#define MEMALLOCSTEP 20

/* ------------------------------ GetStrValue --------------------------- */

static WORD GetStrValue ( DEV_T FAR* dev,
                         const char FAR* str,
                         WORD default_value,
                         const char FAR* FAR* strlist)
{
    const char FAR* FAR* p = strlist;
    WORD result = 0;

    strupr ((char*) str);

    while (*p != NULL)
    {
        if (strcmp (*p, str) == 0)
      break;

        result++;
        p++;
    }

    if (*p == NULL)
    {
        SetErr( dev, ERR_ILLEGAL_PARAM);
        result = default_value;
    }

    return result;
}


/* ------------------------------ mvInitCamTypeDefinition --------------- */

CAMDEFAPI(WORD) mvInitCamTypeDefinitions (WORD MaxCameraDefs)
{
	int result = NO_ERR ;

    CAMMSG(("++ mvInitCamTypeDefinitions(%d)\n", MaxCameraDefs )) ; 
    mvAddUserFunction ("SelCamera"              , (USER_FUNC_T) mvSelCamera);
    mvAddUserFunction ("DefCamType"             , (USER_FUNC_T) mvDefCamType);
    mvAddUserFunction ("DefCamAcquireSetup"     , (USER_FUNC_T) mvDefCamAcquireSetup);
    mvAddUserFunction ("DefCamGenerateVSync"    , (USER_FUNC_T) mvDefCamGenerateVSync);
    mvAddUserFunction ("DefCamAnalogParam"      , (USER_FUNC_T) mvDefCamAnalogParam);
    mvAddUserFunction ("DefHorizontalUnit"      , (USER_FUNC_T) mvDefHorizontalUnit);
    mvAddUserFunction ("DefVerticalUnit"        , (USER_FUNC_T) mvDefVerticalUnit);
    mvAddUserFunction ("DefCamHorizontalAcquire", (USER_FUNC_T) mvDefCamHorizontalAcquire);
    mvAddUserFunction ("DefCamVerticalAcquire"  , (USER_FUNC_T) mvDefCamVerticalAcquire);
    mvAddUserFunction ("DefCamClamp"            , (USER_FUNC_T) mvDefCamClamp);
    mvAddUserFunction ("DefCamZero"             , (USER_FUNC_T) mvDefCamZero);
    mvAddUserFunction ("DefCamFieldGate"        , (USER_FUNC_T) mvDefCamFieldGate);
    mvAddUserFunction ("DefCamClamp"            , (USER_FUNC_T) mvDefCamClamp);
    mvAddUserFunction ("DefChannelGain"         , (USER_FUNC_T) mvDefChannelGain);
    mvAddUserFunction ("DefChannelOffset"       , (USER_FUNC_T) mvDefChannelOffset);
    mvAddUserFunction ("DefChannelReference"    , (USER_FUNC_T) mvDefChannelReference);

    mvAddUserFunction ("DefCamHorizontalTota@sd", (USER_FUNC_T) mvDefCamHorizontalTotal);
    mvAddUserFunction ("DefPhysCamType@ss"      , (USER_FUNC_T) mvDefPhysCamType);
    mvAddUserFunction ("DefManufacturer@ss"     , (USER_FUNC_T) mvDefManufacturer);
    mvAddUserFunction ("DefPropDialog@sss"      , (USER_FUNC_T) mvDefPropDialog);

	if( MaxCameraDefs < MEMALLOCSTEP )MaxCameraDefs = MEMALLOCSTEP;

    MaxNumCamTypes = MaxCameraDefs;

    if ( pFirstCamType == NULL )
    {
		if ((pFirstCamType = (LPCAMTYPE_T) calloc (MaxCameraDefs, sizeof (CAMTYPE_T))) == NULL)
			result = ERR_NO_MEM;

	}

    CAMMSG(("-- mvInitCamTypeDefinitions() = %d\n", result )) ; 

    return result;
}


/* ------------------------------ mvFreeCamTypeDefinitions -------------- */

CAMDEFAPI(void) mvFreeCamTypeDefinitions ()
{
   LPCAMTYPE_T pCam = pFirstCamType;
   unsigned int i;


   if (pFirstCamType != NULL)
   {
       for (i = 0; i < NumCamTypes; i++)
       {
          _delete( pCam->Manufacturer );
          _delete( pCam->PropDlgDLL );
          _delete( pCam->PropData.names );
          _delete( pCam->PropData.data );
          _delete( pCam->Comment );

          pCam++;
       }

       free (pFirstCamType);
   }

   pActCamType   = NULL;
   pFirstCamType = NULL;
   NumCamTypes   = 0;
}

/* ------------------------------ mvDefCamType -------------------------- */

VOID  _MVDFKT INTERPRETER_FKT mvDefCamType (DEV_T FAR* dev,
                           const char FAR* Name,
                           const char FAR* VideoMode,
                           const char FAR* Interlaced,
                           WORD VFreq,
                           WORD HFreq,
                           WORD ClockFreq,
                           const char FAR* ClockMode)
{
   LPCAMTYPE_T pCam, pTmp;
   WORD nVideoMode ;
   int i, lastidx;
   
   CAMMSG(("== DefCamType(%s)\n", Name ));
   if (pFirstCamType == NULL)
   {
     SetErr (dev, ERR_NO_MEM);
     return;
   }

   if ( NumCamTypes >= MaxNumCamTypes)
   {
    
	   if ((pTmp = (LPCAMTYPE_T) calloc ( MaxNumCamTypes + MEMALLOCSTEP, sizeof (CAMTYPE_T))) != NULL)
	   {
			memcpy( pTmp, pFirstCamType, MaxNumCamTypes * sizeof (CAMTYPE_T));
			MaxNumCamTypes += MEMALLOCSTEP;
			lastidx = GetActCameraTypeIndex();
			free( pFirstCamType );
			pFirstCamType = pTmp;
			SetActCameraTypeIndex(lastidx);
	   }
	   else
	   {
			CAMMSG(("mvDefCamType(%s) not enough memory, max camdefs = %d\n", Name,  MaxNumCamTypes )) ; 
			return;
	   }
   }


   // search for already defined camera name
   pCam = pFirstCamType ;
   i = 0 ;
   while ( (i < NumCamTypes) && (strcmp( pCam->Name, Name ) != 0) )
   {
      i++ ;
      pCam++ ;
   }

   if ( i == NumCamTypes && NumCamTypes < MaxNumCamTypes)
   {
     NumCamTypes ++;
   }
   else if ( i == NumCamTypes )
     return;


   nVideoMode  = GetStrValue (dev, VideoMode, 0, slVideoModes);
   memcpy (pCam, pdefault_camdef+nVideoMode, sizeof (CAMTYPE_T));

   strncpy (pCam->Name, Name, CT_NAME_LENGTH);
   pCam->VideoMode      = nVideoMode;
   pCam->Interlaced     = GetStrValue (dev, Interlaced, 1, slInterlModes);
   pCam->VerticalFreq   = VFreq;
   pCam->HorizontalFreq = HFreq;
   pCam->ClockFreq      = ClockFreq;
   pCam->ClockMode      = GetStrValue (dev, ClockMode, 0, slClockModes);
}


/* ------------------------------ mvDefCamAcquireSetup ------------------ */

VOID  _MVDFKT INTERPRETER_FKT mvDefCamAcquireSetup ( DEV_T FAR* dev,
                                   const char FAR* Name,
                                   const char FAR* AcquireMode,
                                   const char FAR* Invert,
                                   const char FAR* StartMode)
{
   LPCAMTYPE_T pCam;

   pCam = mvGetCameraTypePtr ( dev, Name );

   if ( pCam )
   {
     pCam->AcquireMode = GetStrValue ( dev, AcquireMode, 0, slAcquireModes );
     pCam->InvertSync  = GetStrValue ( dev, Invert     , 0, slInvertModes  );
     pCam->StartMode   = GetStrValue ( dev, StartMode  , 3, slStartModes   );
   }
}


/* ------------------------------ mvDefHorizontalUnit ------------------- */

WORD  _MVDFKT INTERPRETER_FKT mvDefHorizontalUnit ( DEV_T FAR* dev,
                                  const char FAR* Name,
                                  const char FAR* Unit )
{
   WORD last = 0, wUnit;
   LPCAMTYPE_T pCam;

   pCam = mvGetCameraTypePtr ( dev, Name );

   if ( pCam )
   {
     last = pCam->HTParameterMode;
     wUnit = GetStrValue ( dev, Unit, 0, slParModes );

     switch ( wUnit )
     {
       case 0:  /* Pixel */
         pCam->HTAcquireStart     = _GetHPix ( pCam, pCam->HTAcquireStart );
         pCam->HTAcquireWidth     = _GetHPix ( pCam, pCam->HTAcquireWidth );
         pCam->HTClampStart       = _GetHPix ( pCam, pCam->HTClampStart   );
         pCam->HTClampWidth       = _GetHPix ( pCam, pCam->HTClampWidth   );
         pCam->HTZeroStart        = _GetHPix ( pCam, pCam->HTZeroStart    );
         pCam->HTZeroWidth        = _GetHPix ( pCam, pCam->HTZeroWidth    );
         pCam->HTFieldStart       = _GetHPix ( pCam, pCam->HTFieldStart   );
         pCam->HTFieldWidth       = _GetHPix ( pCam, pCam->HTFieldWidth   );
         break;

      case 1:  /* Time */
         pCam->HTAcquireStart     = _GetHTime ( pCam, pCam->HTAcquireStart );
         pCam->HTAcquireWidth     = _GetHTime ( pCam, pCam->HTAcquireWidth );
         pCam->HTClampStart       = _GetHTime ( pCam, pCam->HTClampStart   );
         pCam->HTClampWidth       = _GetHTime ( pCam, pCam->HTClampWidth   );
         pCam->HTZeroStart        = _GetHTime ( pCam, pCam->HTZeroStart    );
         pCam->HTZeroWidth        = _GetHTime ( pCam, pCam->HTZeroWidth    );
         pCam->HTFieldStart       = _GetHTime ( pCam, pCam->HTFieldStart   );
         pCam->HTFieldWidth       = _GetHTime ( pCam, pCam->HTFieldWidth   );
         break;
     }

     pCam->HTParameterMode = wUnit;
   }

   return last;
}


/* ------------------------------ mvDefVerticalUnit --------------------- */

WORD  _MVDFKT INTERPRETER_FKT mvDefVerticalUnit ( DEV_T FAR* dev,
                                const char FAR* Name,
                                const char FAR* Unit )
{
   WORD last = 0, wUnit;
   LPCAMTYPE_T pCam;

   pCam = mvGetCameraTypePtr ( dev, Name);

   if ( pCam)
   {
     last  = pCam->VTParameterMode;
     wUnit = GetStrValue ( dev, Unit, 2, slParModes);

     switch (wUnit)
     {
       case 2:  /* Lines */
         pCam->VTAcquireStart = _GetVLine ( pCam, pCam->VTAcquireStart );
         pCam->VTAcquireWidth = _GetVLine ( pCam, pCam->VTAcquireWidth );
         break;

      case 1:  /* Time */
         pCam->VTAcquireStart = _GetVTime ( pCam, pCam->VTAcquireStart );
         pCam->VTAcquireWidth = _GetVTime ( pCam, pCam->VTAcquireWidth );
         break;
     }

     pCam->VTParameterMode = wUnit;
   }

   return last;
}


/* ------------------------------ mvDefCamAnalogParam ------------------- */

VOID  _MVDFKT INTERPRETER_FKT mvDefCamAnalogParam ( DEV_T FAR* dev,
                                  const char FAR* Name,
                                  const char FAR* ChromFilter,
                                  WORD Gain,
                                  INT  OffsetVol,
                                  WORD LowRefVol,
                                  WORD HighRefVol )
{
   LPCAMTYPE_T pCam;
   signed short sOffset;

   pCam = mvGetCameraTypePtr ( dev, Name);

   if ( pCam)
   {
      sOffset = (signed short) OffsetVol;

      pCam->ChrominanceFilter = GetStrValue ( dev, ChromFilter, 0, slFilterModes );
      pCam->Gain[0]           = Gain;
      pCam->Offset[0]         = sOffset;
      pCam->LowReference[0]   = LowRefVol;
      pCam->HighReference[0]  = HighRefVol;
   }
}


/* ------------------------------ mvDefChannelGain ---------------------- */

VOID  _MVDFKT INTERPRETER_FKT mvDefChannelGain ( DEV_T FAR* dev,
                               const char FAR* Name,
                               WORD Channel,
                               WORD Gain)
{
   LPCAMTYPE_T pCam;

   pCam = mvGetCameraTypePtr ( dev, Name);

   if ( pCam)
   {
      if (Channel < 32)
        pCam->Gain[Channel] = Gain;
   }
}


/* --------------------------------------------------- mvDefChannelOffset --- */
VOID  _MVDFKT INTERPRETER_FKT mvDefChannelOffset ( DEV_T FAR* dev,
                                        const char FAR* Name,
                                        WORD Channel,
                                        INT OffsetVol )
{
   LPCAMTYPE_T pCam;

   pCam = mvGetCameraTypePtr( dev,Name);

   if ( pCam )
   {
      if ( Channel < 32 )
          pCam->Offset[Channel]     = OffsetVol;
   }
}


/* ------------------------------ mvDefChannelReference ----------------- */

VOID  _MVDFKT INTERPRETER_FKT mvDefChannelReference ( DEV_T FAR* dev,
                                    const char FAR* Name,
                                    WORD Channel,
                                    WORD ReferenceNr,
                                    WORD RefVol )
{
   LPCAMTYPE_T pCam;

   pCam = mvGetCameraTypePtr ( dev, Name);

   if ( pCam)
   {
      if (Channel < 32)
      {
         if (ReferenceNr == 0)
         {
            pCam->LowReference[Channel] = RefVol;
         }

         else if (ReferenceNr == 1)
         {
            pCam->HighReference[Channel] = RefVol;
         }
      }
   }
}


/* ------------------------------ mvDefCamHorizontalAcquire ------------- */

VOID  _MVDFKT INTERPRETER_FKT mvDefCamHorizontalAcquire ( DEV_T FAR* dev,
                                        const char FAR* Name,
                                        DWORD Start,
                                        DWORD Width,
                                        WORD Increment )
{
   LPCAMTYPE_T pCam;

   pCam = mvGetCameraTypePtr ( dev, Name );

   if ( pCam )
   {
      pCam->HTAcquireStart     = Start;
      pCam->HTAcquireWidth     = Width;
      pCam->HTAcquireIncrement = Increment;
   }
}


/* ------------------------------ mvDefCamHorizontalTotal --------------- */
VOID _MVDFKT INTERPRETER_FKT mvDefCamHorizontalTotal( DEV_T FAR* dev, const char FAR* Name, DWORD Total )
{
   LPCAMTYPE_T pCam;

   pCam = mvGetNewCameraTypePtr (dev, Name);

   if (pCam)
   {
      pCam->HTAcquireTotal     = Total;
   }
}

/* ------------------------------ mvDefCamVerticalAcquire --------------- */

VOID  _MVDFKT INTERPRETER_FKT mvDefCamVerticalAcquire ( DEV_T FAR* dev,
                                      const char FAR* Name,
                                      DWORD Start,
                                      DWORD Width,
                                      WORD Increment )
{
   LPCAMTYPE_T pCam;

   pCam = mvGetCameraTypePtr ( dev, Name );

   if ( pCam )
   {
      pCam->VTAcquireStart     = Start;
      pCam->VTAcquireWidth     = Width;
      pCam->VTAcquireIncrement = Increment;
   }
}


void _MVDFKT INTERPRETER_FKT mvDefCamGenerateVSync ( DEV_T FAR* dev,
                                  const char FAR* Name,
                                  DWORD Start,
                                  DWORD Width )
{
   LPCAMTYPE_T pCam;

   pCam = mvGetCameraTypePtr ( dev, Name );

   if ( pCam )
   {
      pCam->GenerateVSync      =  1;
      pCam->GenerateVSyncStart = Start;
      pCam->GenerateVSyncWidth = Width;
   }

}


/* ------------------------------ mvDefCamClamp ------------------------- */


VOID  _MVDFKT INTERPRETER_FKT mvDefCamClamp ( DEV_T FAR* dev,
                            const char FAR* Name,
                            DWORD Start,
                            DWORD Width )
{
   LPCAMTYPE_T pCam;

   pCam = mvGetCameraTypePtr ( dev, Name );

   if ( pCam )
   {
      pCam->HTClampStart = Start;
      pCam->HTClampWidth = Width;
   }
}


/* ------------------------------ mvDefCamZero -------------------------- */

VOID  _MVDFKT INTERPRETER_FKT mvDefCamZero ( DEV_T FAR* dev,
                           const char FAR* Name,
                           DWORD Start,
                           DWORD Width )
{
   LPCAMTYPE_T pCam;

   pCam = mvGetCameraTypePtr ( dev, Name );

   if ( pCam )
   {
      pCam->HTZeroStart = Start;
      pCam->HTZeroWidth = Width;
   }
}


/* ------------------------------ mvDefCamFieldGate --------------------- */

VOID  _MVDFKT INTERPRETER_FKT mvDefCamFieldGate ( DEV_T FAR* dev,
                                const char FAR* Name,
                                DWORD Start,
                                DWORD Width )
{
   LPCAMTYPE_T pCam;

   pCam = mvGetCameraTypePtr ( dev, Name );

   if ( pCam )
   {
      pCam->HTFieldStart = Start;
      pCam->HTFieldWidth = Width;
   }
}



/* ------------------------------ mvDefPhysCamType -------------------- */
VOID _MVDFKT INTERPRETER_FKT mvDefPhysCamType( DEV_T FAR* dev, const char FAR* Name, const char FAR* CameraType )
{
   LPCAMTYPE_T pCam;

   pCam = mvGetNewCameraTypePtr (dev, Name);

   if (pCam)
   {
      pCam->PhysCamType = GetStrValue (dev, CameraType, 0, slPhysCamTypes);
   }
}

/* ------------------------------ mvDefManufacturer -------------------- */
VOID _MVDFKT INTERPRETER_FKT mvDefManufacturer( DEV_T FAR* dev, const char FAR* Name, const char FAR* Manufacturer )
{
   LPCAMTYPE_T pCam;

   pCam = mvGetNewCameraTypePtr (dev, Name);

   if (pCam)
   {
      if ( Manufacturer ) 
      {
          _delete( pCam->Manufacturer );
          pCam->Manufacturer = strdup(Manufacturer);
      }
   }
}

/* ------------------------------ mvDefPropDialog -------------------- */
VOID _MVDFKT INTERPRETER_FKT mvDefPropDialog( DEV_T FAR* dev, const char FAR* Name, const char FAR* DLLfilename,const char FAR* DLLfunctionname  )
{
   LPCAMTYPE_T pCam;

   pCam = mvGetNewCameraTypePtr (dev, Name);

   if (pCam)
   {
      if ( DLLfilename )     pCam->PropDlgDLL      = strdup(DLLfilename);
      if ( DLLfunctionname ) pCam->PropDlgFuncName = strdup(DLLfunctionname);
   }
}


/* ------------------------------ mvDefCamComment -------------------- */
VOID _MVDFKT INTERPRETER_FKT mvDefCamComment( DEV_T FAR* dev, const char FAR* Name, const char FAR* text  )
{
   LPCAMTYPE_T pCam;

   pCam = mvGetNewCameraTypePtr (dev, Name);

   if (pCam)
   {
      if ( text )     pCam->Comment      = strdup(text);
   }

}


/* ------------------------------ mvGetCameraTypePtr -------------------- */

LPCAMTYPE_T  _MVDFKT mvGetCameraTypePtr ( DEV_T FAR* dev, const char FAR* Name )
{
   LPCAMTYPE_T pCam = pFirstCamType;
   unsigned int i;

   UNUSED ( dev );

   for (i = 0; i < NumCamTypes; i++ )
   {
      if ( stricmp ( pCam->Name, Name ) == 0 )
      {
//   		 CAMMSG(("== GetCameraTypePtr(,%s) - found # %d\n", Name, i ));
   		 return pCam;
      }
      pCam++;
   }
	CAMMSG(("== GetCameraTypePtr(,%s) * not found\n", Name ));
	return NULL ;
}


/* ------------------------------ mvGetNewCameraTypePtr -------------------- */

LPCAMTYPE_T  _MVDFKT mvGetNewCameraTypePtr (DEV_T FAR* dev, const char FAR* Name)
{
   LPCAMTYPE_T pCam;

   // look for previous defined camera
   pCam = mvGetCameraTypePtr (dev, Name);

   if ( pCam == NULL )  // make new defintion, if not found
   {
      pCam = pFirstCamType + NumCamTypes;

      if (NumCamTypes < MaxNumCamTypes)
        NumCamTypes ++;
      else
        return NULL;
   }

   return pCam;
}

/* ------------------------------ GetActCameraTypeIndex ----------------- */
int GetActCameraTypeIndex()
{
   return (int) (pActCamType-pFirstCamType)/sizeof(CAMTYPE_T);
}

/* ------------------------------ SetActCameraTypeIndex ----------------- */
void SetActCameraTypeIndex( int idx )
{
   pActCamType =  pFirstCamType + idx;
}

/* ------------------------------ mvGetActCameraTypePtr ----------------- */

LPCAMTYPE_T  _MVDFKT mvGetActCameraTypePtr ( DEV_T FAR* dev )
{
   UNUSED ( dev );
   return pActCamType;
}


/* ------------------------------ mvSetActCameraTypePtr ----------------- */

void _MVDFKT mvSetActCameraTypePtr (DEV_T FAR* dev, LPCAMTYPE_T pCam)
{
   UNUSED (dev);
   pActCamType = pCam;
}


/* ------------------------------ mvGetFirstCameraTypePtr --------------- */
LPCAMTYPE_T  _MVDFKT mvGetFirstCameraTypePtr ( DEV_T FAR* dev )
{
   UNUSED( dev);
   return pFirstCamType;
}


/* ------------------------------ mvGetNumCameraTypesDefined ------------ */
WORD  _MVDFKT mvGetNumCameraTypesDefined ( DEV_T FAR* dev)
{
   UNUSED( dev );
   return NumCamTypes;
}


/* ------------------------------ LOCAL: GetOffsetValue ----------------- */
static WORD GetOffsetValue ( LPCAMTYPE_T pCam, WORD DigType, WORD channel )
{
   float Offset_mV = (float) pCam->Offset[channel];
   WORD  Offset    = 2048;

   switch ( DigType )
   {
   case DIG_MGVS:       /* PCprocess with MGVS-Module */
   case DIG_MRGB:       /* PCprocess with MRGB-Module */
      Offset = (WORD) (Offset_mV*2048.0/1200.0 + 2048.0);
      break;

   case DIG_MGVSi:      /* PCimage */
      Offset = (WORD) (Offset_mV*2048.0/864.0 + 2048.0);
      break;

   case DIG_PCISG:      /* PCimage-SG/SGVS & SRGB */
   case DIG_PCISRGB:  
      Offset = (WORD) (Offset_mV*2048.0/1200.0 + 2048.0);
      break;

   case DIG_PCISC:      /* PCimage-SC */
      Offset = (WORD) (Offset_mV*2048.0/1200.0 + 2048.0);
      break;

   default:
      Offset = (WORD) (Offset_mV*2048.0/1200.0 + 2048.0);
	  break;

   }

   return Offset;

}


static WORD GetDigType ( DEV_T FAR* dev )
{
   ACQUIRE_DEF_T acq;


   switch ( dev->Glob->DevType )
   {
      default :
      case DEV_PCISC :    return DIG_PCISC;
      case DEV_PCISG :    return DIG_PCISG;
      case DEV_PCISRGB :  return DIG_PCISRGB;
      case DEV_PCISDIG :  return DIG_PCISDIG;

      case DEV_PCIB :     return DIG_MGVSi;

      case DEV_PCPM : 
          mvGetAcquireDef ( dev, &acq );
          switch ( (BYTE) ( acq.start_addr[0] >> 24 ) )
          {
              default :
              case 0xBE:  return DIG_MGVS;
              case 0xBF:  return DIG_MRGB;
          }
    }
}


VOID  _MVDFKT mvUpdateActCamera ( DEV_T FAR* dev, DWORD lUpdateFlags )
{
   mvUpdateCamera ( dev, pActCamType, lUpdateFlags ) ;
}


void  _MVDFKT mvUpdateCamera ( DEV_T FAR* dev, LPCAMTYPE_T pCam, DWORD lUpdateFlags )
{
   ACQUIRE_DEF_T acq;
   DWORD         AcquireStartAddr, ltmp;
   WORD          xsize, ysize,wtmp, flags;
   WORD          DigType;
   INT           xdummy;
   int           i;

   CAMMSG(("++ UpdateCamera(%s,$%08lx)\n", pCam->Name, lUpdateFlags )) ;
   DigType = GetDigType(dev);

   if ( lUpdateFlags & CAM_UPDATE_VIDEO )
   {

     /* ------------ Select Standard Videomode */
     if ( pCam->AcquireMode ==  0 )
     {
   		CAMMSG(("  UpdateCamera - SelVideoMode ( %d )\n", pCam->VideoMode ));
      mvSelVideoMode (dev, pCam->VideoMode);
     }
     else
     {
        flags = 0;

        if ( pCam->InvertSync & SYNCINV_HV )
           flags |= VM_INVVSCAN;

        if ( pCam->InvertSync & SYNCINV_H )
           flags |= VM_INVHSYNC;

        if ( pCam->InvertSync & SYNCINV_V )
           flags |= VM_INVVSYNC;

		if ( flags == 0 )
			flags |= VM_NOTINVVSCAN;


   		CAMMSG(("  UpdateCamera - SelVideoMode ( $%x )\n", pCam->VideoMode | flags));
        mvSelVideoMode (dev, (WORD) (pCam->VideoMode | flags));
     }

     /* ------------ AcquireDef */
     mvGetAcquireDef ( dev, &acq );

     switch ( DigType )
     {
       case DIG_MGVS:
                   xdummy = 4;
                   break;

       case DIG_MRGB:
                   xdummy = 0;
                   break;

       default:
                   xdummy = 0;
                   break;
     }

     AcquireStartAddr = min ( acq.start_addr[1], acq.start_addr[0] );

     xsize = (WORD) ( 4 * ( _HP (HTAcquireWidth ) >> 2 ) / pCam->HTAcquireIncrement );
     ysize = (WORD) ( _VL ( VTAcquireWidth ) / pCam->VTAcquireIncrement );
/*
     xsize = min ( XSIZE ( dev ), xsize );
     ysize = min ( YSIZE ( dev ), ysize );
*/
     if ( pCam->Interlaced == 1 )  /* Interlaced */
     {
       acq.fields_per_frame = 2;
       if ( ( acq.start_addr[0] < acq.start_addr[1]) || (acq.ypos[0] < acq.ypos[1]) )
       {
          ltmp              = acq.start_addr[0];
          acq.start_addr[0] = acq.start_addr[1];
          acq.start_addr[1] = ltmp;

          wtmp        = acq.ypos[0];
          acq.ypos[0] = acq.ypos[1];
          acq.ypos[1] = wtmp;
       }
     }
     else if ( pCam->Interlaced == 2 ) /* Field inverted interlaced */
     {
       acq.fields_per_frame = 2;
       if ( (acq.start_addr[0] > acq.start_addr[1]) || (acq.ypos[0] > acq.ypos[1]) )
       {
          /* swap start address of the fields */
          ltmp              = acq.start_addr[1];
          acq.start_addr[1] = acq.start_addr[0];
          acq.start_addr[0] = ltmp;

          wtmp        = acq.ypos[0];
          acq.ypos[0] = acq.ypos[1];
          acq.ypos[1] = wtmp;
       }
     }
     else   /* Noninterlaced */
     {
       acq.fields_per_frame = 1;

       if ( DigType == DIG_PCISG || DigType == DIG_PCISRGB )
       {
         acq.trig_mode |= TM_DISABLE_FIELD_DETECT;
       }
       else
       {
         acq.line_inc[0] /= 2;
         acq.line_inc[1] /= 2;
       }

       acq.start_addr[0] = AcquireStartAddr;
       acq.start_addr[1] = AcquireStartAddr;
       /* not correct for hardlive 
       acq.ypos[0] = 0;
       acq.ypos[1] = 0;
       */
     }


     acq.trig_mode &= ~3;
     acq.trig_mode |= pCam->StartMode;
     acq.vcnt_start = (WORD) (VCNT_START (xsize, _VL (VTAcquireStart)));
     acq.vcnt_incr  = pCam->VTAcquireIncrement;

     for ( i = 0; i < 2; i++ )
     {
       acq.xsize[i] = xsize;
       acq.ysize[i] = ysize;
     }

     mvSetAcquireDef ( dev, &acq );

     /* --------------- Timing RAM */
     {
         WORD xs, ys, xe, ye ;

         xs = (WORD)   _HP ( HTAcquireStart ) ;
         xe = (WORD) ( xs + (xsize + xdummy -1) * pCam->HTAcquireIncrement ) ;
         ys = (WORD)   _VL ( VTAcquireStart ) ;
         ye = (WORD) ( _VL ( VTAcquireStart ) + ysize -1 ) ;



         mvSetVideoTiming ( dev, HRAM,  0, 4095, 1, HVT_ACQUIRE, BIT_RESET );
         mvSetVideoTiming ( dev, HRAM, xs,   xe, pCam->HTAcquireIncrement, HVT_ACQUIRE, BIT_SET);

         mvSetVideoTiming ( dev, VRAM,  0, 4095, 1, HVT_ACQUIRE, BIT_RESET );
         mvSetVideoTiming ( dev, VRAM, ys,   ye, 1, HVT_ACQUIRE, BIT_SET   );

         mvSetVideoTiming ( dev, VRAM,  0, 4095, 1, HVT_SYNC,    BIT_RESET );

         if ( pCam->GenerateVSync  )
         {
            mvSetVideoTiming ( dev, VRAM, (WORD) (_VL (GenerateVSyncStart) ), (WORD) (_VL (GenerateVSyncStart) + _VL (GenerateVSyncWidth) - 1 ), 1, HVT_SYNC, BIT_SET );
         }
     }

   }


   if ( lUpdateFlags & CAM_UPDATE_ZERO )
   {
     mvSetVideoTiming ( dev, HRAM, 0, 4095, 1, HVT_ZERO, BIT_RESET );
     if (( pCam->HTZeroWidth > 0) && (DigType != DIG_MGVSi) )
       mvSetVideoTiming ( dev, HRAM, (WORD) _HP (HTZeroStart), (WORD) (_HP (HTZeroStart) + _HP (HTZeroWidth)), 1, HVT_ZERO, BIT_SET);
   }

   if ( lUpdateFlags & CAM_UPDATE_CLAMP )
   {
     mvSetVideoTiming ( dev, HRAM, 0, 4095, 1, HVT_CLAMP, BIT_RESET );
     if ( pCam->HTClampWidth > 0)
       mvSetVideoTiming ( dev, HRAM, (WORD) _HP (HTClampStart), (WORD) (_HP (HTClampStart) + _HP (HTClampWidth)), 1, HVT_CLAMP, BIT_SET);
   }

   if ( lUpdateFlags & CAM_UPDATE_FIELD )
   {
     mvSetVideoTiming ( dev, HRAM, 0, 4095, 1, HVT_FIELD, BIT_RESET );
     if ( pCam->HTFieldWidth > 0)
       mvSetVideoTiming ( dev, HRAM, (WORD) _HP (HTFieldStart), (WORD) (_HP (HTFieldStart) + _HP (HTFieldWidth)), 1, HVT_FIELD, BIT_SET);
   }


   if ( lUpdateFlags & CAM_UPDATE_VIDEO )
   {
     mvLoadTimingRAM ( dev);
   }

   if ( ( lUpdateFlags & CAM_UPDATE_CHROMFILTER ) != 0
     && ! ( dev->Glob->DevType == DEV_PCISRGB
                && ( pCam->ChrominanceFilter == 1 || pCam->ChrominanceFilter == 2 ) ) )
   {
     mvSelChrominanceFilter ( dev, pCam->ChrominanceFilter );

     if ( GetErr ( dev) == ERR_NOT_IMPLEMENTED )     /* AB: Dig-Modul hat keine Fkt. SelChrominanceFilter */
       ClearErr ( dev);
   }


   if ( lUpdateFlags & CAM_UPDATE_GAIN )
   {
     mvSetGain ( dev, 0, pCam->Gain[0] );

     if ( GetErr ( dev ) == ERR_NOT_IMPLEMENTED )     /* AB: Dig-Modul hat keine Fkt. SetGain */
       ClearErr ( dev );

   }

   if ( dev->Glob->DevType != DEV_PCISC )           /* AB: PCimageSC hat keinen externen Pixeltakt */ 
   {
     if ( lUpdateFlags & ( CAM_UPDATE_CLOCKMODE | CAM_UPDATE_CLOCKFREQ | CAM_UPDATE_INVERTSYNC ) )
     {
	   if (IsFunctionAvailable(dev,SetHorizontalFreq) )
	   {
		   mvSetHorizontalFreq(dev,pCam->HorizontalFreq);
	   }

       if (pCam->ClockMode == 0)
       {
         _mvSelInputClk  ( dev, 0 );
         mvSetPixelFreq ( dev, _PClk ( pCam ) );
       }
       else
       {

         if ( pCam->InvertSync & 1 )
           if ( dev->Glob->DevType == DEV_PCISG || dev->Glob->DevType == DEV_PCISRGB )
		         _mvSelInputClk ( dev, (WORD) -1 );
           else
		         _mvSelInputClk ( dev, 2 );
         else
		       _mvSelInputClk ( dev, 1 );
       }
     }
   }

   if ( lUpdateFlags & CAM_UPDATE_OFFSET )
   {
     WORD offset = GetOffsetValue ( pCam, DigType, 0 ) ;
     mvSetOffset ( dev,0, offset );
	   if ( GetErr ( dev ) == ERR_NOT_IMPLEMENTED )     /* HB: Dig-Modul hat keine Fkt. SetGain */
       ClearErr ( dev ) ;

   }



   CAMMSG(("-- UpdateCamera(), dev.err = %d\n", GetErr(dev) )) ;


}



WORD  _MVDFKT INTERPRETER_FKT mvSelCamera ( DEV_T FAR * dev, const char FAR * Name )
{
   LPCAMTYPE_T  pCam;

   CAMMSG(("++ SelCamera(,%s)\n", Name ));
   pCam = mvGetCameraTypePtr (dev, Name);

   if ( pCam )
   {
		pActCamType = pCam;
		mvUpdateActCamera ( dev, CAM_UPDATE_ALL ) ;
		CAMMSG(("-- SelCamera (%s) cam found", Name ));
   }
   else
   {
	   char tmp[256];
	   sprintf(tmp, "mvSelCamera(), camera '%s' not found", Name );
	   //SetErrStr ( dev, 56 | MV_WARNING, tmp ) ; // 56 = ERR_OBJNOTFOUND mv.h > 1.5.20.0
	   SetErr ( dev, 56 | MV_WARNING ) ; // 56 = ERR_OBJNOTFOUND mv.h > 1.5.20.0
	   CAMMSG(("-- SelCamera(%s) * %s\n", Name, tmp ));
   }


   return 0;
}


void _MVDFKT mvOutputCamType ( LPCAMTYPE_T pCam, PRINTFKT prf )
{
   if ( pCam )
   {
     (*prf) ( "----------- Cameratype: %s ------------\n", pCam->Name );
     (*prf) ( "VideoMode            %s\n",      slVideoModes[pCam->VideoMode] );
     (*prf) ( "Interlaced           %s\n",      slInterlModes[pCam->Interlaced] );
     (*prf) ( "VerticalFreq         %d Hz\n",   _VClk ( pCam) );
     (*prf) ( "HorizontalFreq       %ld Hz\n",  (long)(_HClk ( pCam) * 1000.0 ) );
     (*prf) ( "ClockFreq            %ld kHz\n", (long)(_PClk ( pCam) * 1000.0 ) );
     (*prf) ( "ClockMode            %d\n",      pCam->ClockMode);
     (*prf) ( "AcquireMode          %s\n",      slAcquireModes[pCam->AcquireMode] );
     (*prf) ( "InvertSync           %d\n",      pCam->InvertSync );
     (*prf) ( "StartMode            %s\n",      slStartModes[pCam->StartMode] );
     (*prf) ( "ChrominanceFilter    %s\n",      slFilterModes[pCam->ChrominanceFilter] );
     (*prf) ( "Gain:                %d\n",      pCam->Gain );
     (*prf) ( "Offset:              %d mV\n",   pCam->Offset );
     (*prf) ( "LowReference:        %d mv\n",   pCam->LowReference );
     (*prf) ( "HighReference:       %d mv\n\n", pCam->HighReference );

     (*prf) ( "Horizontal Acquire:  %4ld (%6ld ns)   %4ld (%6ld ns)   %d\n",
                                   _GetHPix ( pCam, pCam->HTAcquireStart),_GetHTime( pCam,pCam->HTAcquireStart),
                                   _GetHPix ( pCam, pCam->HTAcquireWidth), _GetHTime ( pCam, pCam->HTAcquireWidth), 
                                   pCam->HTAcquireIncrement);
     (*prf) ( "Clamp:               %4ld (%6ld ns)   %4ld (%6ld ns)\n",
                                    _GetHPix ( pCam, pCam->HTClampStart), _GetHTime ( pCam, pCam->HTClampStart),
                                    _GetHPix ( pCam, pCam->HTClampWidth), _GetHTime ( pCam, pCam->HTClampWidth));
     (*prf) ( "Zero:                %4ld (%6ld ns)   %4ld (%6ld ns)\n\n", _GetHPix ( pCam, pCam->HTZeroStart), _GetHTime ( pCam, pCam->HTZeroStart), _GetHPix ( pCam, pCam->HTZeroWidth), _GetHTime ( pCam, pCam->HTZeroWidth));

     (*prf) ( "Vertical Acquire:    %4ld (%6ld us)   %4ld (%6ld us)   %d\n",
                                     _GetVLine ( pCam, pCam->VTAcquireStart), _GetVTime ( pCam, pCam->VTAcquireStart),
                                     _GetVLine ( pCam, pCam->VTAcquireWidth), _GetVTime ( pCam, pCam->VTAcquireWidth),
                                     pCam->VTAcquireIncrement );
   }
}

/* ------------------------------ mvPrintCamType ------------------------ */
#if 0 //!defined(__mvWIN__) 
VOID _MVDFKT mvPrintCamType ( DEV_T FAR* dev, const char FAR* Name )
{
   mvOutputCamType ( mvGetCameraTypePtr ( dev, Name), printf ) ;
}
#endif

/* Test: */
/*
void main ( )
{
   LPCAMTYPE_T pCam;

   mvInitCamTypeDefinitions ( );

   mvDefCamType ( NULL, "XC-75","VM_CCIR","INTERLACED",   50, 15625, 15000, 0 );
   mvDefCamVerticalAcquire ( NULL, "XC-75", 25L, 574L, 1, "LINES");

   mvDefCamType ( NULL, "XC-77","VM_RGB","NONINTERLACED", 60, 15000, 16000, 0 );
   mvDefCamType ( NULL, "123",  "VM_RGB","NONINTERLACED", 60, 15000, 16000, 0 );


   mvPrintCamType ( NULL, "XC-75" );

   mvFreeCamTypeDefinitions ( );

}

*/



