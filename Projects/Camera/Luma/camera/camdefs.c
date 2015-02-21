//--------------------------------------------------------------------------
//
// ACQU_CAM.C : this module includes the default video mode settings
//
// -----------------------------------------------
//
//--------------------------------------------------------------------------
/* ------------------------------------------------------------
   $Date: 2002/10/21 11:41:02 $

   $Log: camdefs.c,v $
   Revision 1.9  2002/10/21 11:41:02  tf
   New videomode VM_DIG14

   Revision 1.8  2002/06/18 15:03:53  tf
   New videomodes: VM_DIG2x12,VM_DIG2x14, VM_DIG2x16

   Revision 1.7  2002/06/18 11:46:26  uf
   structure for VM_DIG2x10 added

   Revision 1.6  2002/01/10 14:55:14  hg
   Missing newline at end of file added (linux)

   Revision 1.5  2001/08/08 11:01:16  rs
   Merged with version 1.2 from the cvs-module 'Driver'

   Revision 1.4  2001/06/11 10:55:59  hs
   no message

   Revision 1.3  2001/03/22 10:13:57  hs
   CVS entries corrected

   Revision 1.2  2001/03/22 10:12:14  hs
   Cvs entries corrected.

*/



#include <mv.h>
#include "camtype.h"


#define DEFAULT32(v)   {(v),NO_CHANGE,NO_CHANGE,NO_CHANGE,NO_CHANGE,NO_CHANGE,NO_CHANGE, \
                            NO_CHANGE,NO_CHANGE,NO_CHANGE,NO_CHANGE,NO_CHANGE,NO_CHANGE, \
                            NO_CHANGE,NO_CHANGE,NO_CHANGE,NO_CHANGE,NO_CHANGE,NO_CHANGE, \
                            NO_CHANGE,NO_CHANGE,NO_CHANGE,NO_CHANGE,NO_CHANGE,NO_CHANGE, \
                            NO_CHANGE,NO_CHANGE,NO_CHANGE,NO_CHANGE,NO_CHANGE,NO_CHANGE, \
                            NO_CHANGE}


/* DEFAULT SETTINGS Videomode dependend */

CAMTYPE_T default_camdef [CT_CAM_DEF_ENTRIES] =
{

/* --------------------------  VM_AUTO = VM_CCIR  ------------------------------------------------ */
   {
     /* CAMERA DATA */
    "",               /* char Name[CT_NAME_LENGTH]; name of the camera                             */
    VM_CCIR,          /* WORD VideoMode;                                                           */
    1,                /* WORD Interlaced;           number of fields per frame                     */
    50,               /* WORD VerticalFreq;         Vertical scan frequency in Hz                  */
    15625,            /* WORD HorizontalFreq;       Horizontal scan frequency in Hz                */
    14750,            /* WORD ClockFreq;            Clock frequency in kHz                         */
    0,                /* WORD ClockMode;            0: internal; 1: external                       */

     /* ACQUIRE SETUP */
    0,                /* WORD AcquireMode;          0: Composite Sync; 1: Variable Scan            */
    0,                /* WORD InvertSync;           Bit 0: pixelclock invert;
                                                    Bit 1: line sync invert;
                                                    Bit 2: frame sync invert;                      */
    3,                /* WORD StartMode;            1: Odd; 2: Even; 3: Next                       */
    0,                /* WORD ChrominanceFilter;    0: AC coupled; 1: 50Hz; 2: 60Hz; 3: DC coupled */
    DEFAULT32 (1),    /* WORD Gain;                 0: 0.5; 1: 1; 2: 2; 4: 4;                      */
    DEFAULT32 (0),    /* WORD Offset;               in mV                                          */
    DEFAULT32 (0),    /* WORD LowReference;         in mV                                          */
    DEFAULT32 (1200), /* WORD HighReference;        in mV                                          */

    /* TIMING RAM SETUP */
    0,                /* WORD HTParameterMode;      horizontal parameter 0: in pixel 1: in ns;     */
    152L,             /* DWORD HTAquireStart;       acquire start position                         */
    768L,             /* DWORD HTAcquireWidth;      acquire width                                  */
    1,                /* WORD HTAcquireIncrement;   acquire increment                              */

    100L,             /* DWORD ClampStart;          clamp start position                           */
    5L,               /* DWORD ClampWidth;          clamp width 0: set to default 5                */
    130L,             /* DWORD ZeroStart;           zero start position                            */
    5L,               /* DWORD ZeroWidth;           zero width 0: set to default 5                 */
    300L,             /* DWORD FieldStart;          field gate start position 0: auto              */
    400L,             /* DWORD FieldWidth;          field gate width 0: auto                       */

    0,                /* WORD VTParameterMode;      vertical parameter 0: in lines 1: in us;       */
    19,               /* DWORD VTAquireStart;       acquire start position                         */
    288L,             /* DWORD VTAcquireWidth;      acquire width                                  */
    1,                /* WORD VTAcquireIncrement;   acquire increment                              */
    0,                /* WORD  GenerateVSync;       0 : no; 1 : yes                                */
    0L,               /* DWORD GenerateVSyncStart;  Startposition of vsync                         */
    0L,               /* DWORD GenerateVSyncWidth;  Width of Sync pulse                            */
    0,                /* WORD  GenerateVSyncPol;    Syncpolarity: 0 : Sync is low; 1: Sync is high */

    0L,               /* DWORD HTAcquireTotal;      time or pixel between two hsync's              */
    0,                /* WORD  PhysCamType;         bit0: digital, bit1: linescan                  */
    0,                /* char *Manufacturer;        name of the camera manufactor                  */
    0,                /* char *PropDlgDLL;          DLL filename with properties dialog            */
    0,                /* char *PropDlgFuncName;     DLL function name of property dialog           */
    {0,0,0}           /* CAMPROP_T PropData;        Property data, camera dependent                */                                 

   },


/* --------------------------  VM_CCIR  ---------------------------------------------------------- */
   {
     /* CAMERA DATA */
    "",               /* char Name[CT_NAME_LENGTH]; name of the camera                             */
    VM_CCIR,          /* WORD VideoMode;                                                           */
    1,                /* WORD Interlaced;           number of fields per frame                     */
    50,               /* WORD VerticalFreq;         Vertical scan frequency in Hz                  */
    15625,            /* WORD HorizontalFreq;       Horizontal scan frequency in Hz                */
    14750,            /* WORD ClockFreq;            Clock frequency in kHz                         */
    0,                /* WORD ClockMode;            0: internal; 1: external                       */

     /* ACQUIRE SETUP */
    0,                /* WORD AcquireMode;          0: Composite Sync; 1: Variable Scan            */
    0,                /* WORD InvertSync;           Bit 0: pixelclock invert;
                                                    Bit 1: line sync invert;
                                                    Bit 2: frame sync invert;                      */
    3,                /* WORD StartMode;            1: Odd; 2: Even; 3: Next                       */
    0,                /* WORD ChrominanceFilter;    0: AC coupled; 1: 50Hz; 2: 60Hz; 3: DC coupled */
    DEFAULT32 (1),    /* WORD Gain;                 0: 0.5; 1: 1; 2: 2; 4: 4;                      */
    DEFAULT32 (0),    /* WORD Offset;               in mV                                          */
    DEFAULT32 (0),    /* WORD LowReference;         in mV                                          */
    DEFAULT32 (1200), /* WORD HighReference;        in mV                                          */

    /* TIMING RAM SETUP */
    0,                /* WORD HTParameterMode;      horizontal parameter 0: in pixel 1: in ns;     */
    152L,             /* DWORD HTAquireStart;       acquire start position                         */
    768L,             /* DWORD HTAcquireWidth;      acquire width                                  */
    1,                /* WORD HTAcquireIncrement;   acquire increment                              */

    100L,             /* DWORD ClampStart;          clamp start position                           */
    5L,               /* DWORD ClampWidth;          clamp width 0: set to default 5                */
    130L,             /* DWORD ZeroStart;           zero start position                            */
    5L,               /* DWORD ZeroWidth;           zero width 0: set to default 5                 */
    300L,             /* DWORD FieldStart;          field gate start position 0: auto              */
    400L,             /* DWORD FieldWidth;          field gate width 0: auto                       */

    0,                /* WORD VTParameterMode;      vertical parameter 0: in lines 1: in us;       */
    19,               /* DWORD VTAquireStart;       acquire start position                         */
    288L,             /* DWORD VTAcquireWidth;      acquire width                                  */
    1,                /* WORD VTAcquireIncrement;   acquire increment                              */
    0,                /* WORD  GenerateVSync;       0 : no; 1 : yes                                */
    0L,               /* DWORD GenerateVSyncStart;  Startposition of vsync                         */
    0L,               /* DWORD GenerateVSyncWidth;  Width of Sync pulse                            */
    0,                /* WORD  GenerateVSyncPol;    Syncpolarity: 0 : Sync is low; 1: Sync is high */

    0L,               /* DWORD HTAcquireTotal;      time or pixel between two hsync's              */
    0,                /* WORD  PhysCamType;         bit0: digital, bit1: linescan                  */
    0,                /* char *Manufacturer;        name of the camera manufactor                  */
    0,                /* char *PropDlgDLL;          DLL filename with properties dialog            */
    0,                /* char *PropDlgFuncName;     DLL function name of property dialog           */
    {0,0,0}           /* CAMPROP_T PropData;        Property data, camera dependent                */                                 

   },


/* --------------------------  VM_RS170 ---------------------------------------------------------- */
   {
    /* CAMERA DATA */
    "",               /* char Name[CT_NAME_LENGTH]; name of the camera                             */
    VM_RS170,         /* WORD VideoMode;                                                           */
    2,                /* WORD Interlaced;           number of fields per frame                     */
    60,               /* WORD VerticalFreq;         Vertical scan frequency in Hz                  */
    15734,            /* WORD HorizontalFreq;       Horizontal scan frequency in Hz                */
    12270,            /* WORD ClockFreq;            Clock frequency in kHz                         */
    0,                /* WORD ClockMode;            0: internal; 1: external                       */

    /* ACQUIRE SETUP */
    0,                /* WORD AcquireMode;          0: Composite Sync; 1: Variable Scan            */
    0,                /* WORD InvertSync;           Bit 0: pixelclock invert;
                                                    Bit 1: line sync invert;
                                                    Bit 2: frame sync invert;                      */
    3,                /* WORD StartMode;            1: Odd; 2: Even; 3: Next                       */
    0,                /* WORD ChrominanceFilter;    0: AC coupled; 1: 50Hz; 2: 60Hz; 3: DC coupled */
    DEFAULT32 (1),    /* WORD Gain;                 0: 0.5; 1: 1; 2: 2; 4: 4;                      */
    DEFAULT32 (0),    /* WORD Offset;               in mV                                          */
    DEFAULT32 (0),    /* WORD LowReference;         in mV                                          */
    DEFAULT32 (1200), /* WORD HighReference;        in mV                                          */

    /* TIMING RAM SETUP */
    0,                /* WORD HTParameterMode;      horizontal parameter 0: in pixel 1: in ns;     */
    113L,             /* DWORD HTAquireStart;       acquire start position                         */
    640L,             /* DWORD HTAcquireWidth;      acquire width                                  */
    1,                /* WORD HTAcquireIncrement;   acquire increment                              */

    74L,              /* DWORD ClampStart;          clamp start position                           */
    5L,               /* DWORD ClampWidth;          clamp width 0: set to default 5                */
    84L,              /* DWORD ZeroStart;           zero start position                            */
    5L,               /* DWORD ZeroWidth;           zero width 0: set to default 5                 */
    260L,             /* DWORD FieldStart;          field gate start position 0: auto              */
    330L,             /* DWORD FieldWidth;          field gate width 0: auto                       */

    0,                /* WORD VTParameterMode;      vertical parameter 0: in lines 1: in us;       */
    14L,              /* DWORD VTAquireStart;       acquire start position                         */
    240L,             /* DWORD VTAcquireWidth;      acquire width                                  */
    1,                /* WORD VTAcquireIncrement;   acquire increment                              */
    0,                /* WORD  GenerateVSync;       0 : no; 1 : yes                                */
    0L,               /* DWORD GenerateVSyncStart;  Startposition of vsync                         */
    0L,               /* DWORD GenerateVSyncWidth;  Width of Sync pulse                            */
    0,                /* WORD  GenerateVSyncPol;    Syncpolarity: 0 : Sync is low; 1: Sync is high */

    0L,               /* DWORD HTAcquireTotal;      time or pixel between two hsync's              */
    0,                /* WORD  PhysCamType;         bit0: digital, bit1: linescan                  */
    0,                /* char *Manufacturer;        name of the camera manufactor                  */
    0,                /* char *PropDlgDLL;          DLL filename with properties dialog            */
    0,                /* char *PropDlgFuncName;     DLL function name of property dialog           */
    {0,0,0}           /* CAMPROP_T PropData;        Property data, camera dependent                */                                 
   },


/* --------------------------  VM_PAL ------------------------------------------------------------ */
   {
    /* CAMERA DATA */
    "",               /* char Name[CT_NAME_LENGTH]; name of the camera                             */
    VM_PAL,           /* WORD VideoMode;                                                           */
    1,                /* WORD Interlaced;           number of fields per frame                     */
    50,               /* WORD VerticalFreq;         Vertical scan frequency in Hz                  */
    15625,            /* WORD HorizontalFreq;       Horizontal scan frequency in Hz                */
    13500,            /* WORD ClockFreq;            Clock frequency in kHz                         */
    0,                /* WORD ClockMode;            0: internal; 1: external                       */

    /* ACQUIRE SETUP */
    0,                /* WORD AcquireMode;          0: Composite Sync; 1: Variable Scan            */
    0,                /* WORD InvertSync;           Bit 0: pixelclock invert;
                                                    Bit 1: line sync invert;
                                                    Bit 2: frame sync invert;                      */
    3,                /* WORD StartMode;            1: Odd; 2: Even; 3: Next                       */
    0,                /* WORD ChrominanceFilter;    0: AC coupled; 1: 50Hz; 2: 60Hz; 3: DC coupled */
    DEFAULT32 (1),    /* WORD Gain;                 0: 0.5; 1: 1; 2: 2; 4: 4;                      */
    DEFAULT32 (0),    /* WORD Offset;               in mV                                          */
    DEFAULT32 (0),    /* WORD LowReference;         in mV                                          */
    DEFAULT32 (1200), /* WORD HighReference;        in mV                                          */

    /* TIMING RAM SETUP */
    0,                /* WORD HTParameterMode;      horizontal parameter 0: in pixel 1: in ns;     */
    140L,           /* DWORD HTAquireStart;       acquire start position                         */
    720L,           /* DWORD HTAcquireWidth;      acquire width                                  */
    1,                /* WORD HTAcquireIncrement;   acquire increment                              */

    92L,            /* DWORD ClampStart;          clamp start position                           */
    5L,             /* DWORD ClampWidth;          clamp width 0: set to default 5                */
    92L,            /* DWORD ZeroStart;           zero start position                            */
    5L,             /* DWORD ZeroWidth;           zero width 0: set to default 5                 */
    300L,           /* DWORD FieldStart;          field gate start position 0: auto              */
    400L,           /* DWORD FieldWidth;          field gate width 0: auto                       */

    0,                /* WORD VTParameterMode;      vertical parameter 0: in lines 1: in us;       */
    19,               /* DWORD VTAquireStart;       acquire start position                         */
    288L,             /* DWORD VTAcquireWidth;      acquire width                                  */
    1,                /* WORD VTAcquireIncrement;   acquire increment                              */
    0,                /* WORD  GenerateVSync;       0 : no; 1 : yes                                */
    0L,               /* DWORD GenerateVSyncStart;  Startposition of vsync                         */
    0L,               /* DWORD GenerateVSyncWidth;  Width of Sync pulse                            */
    0,                /* WORD  GenerateVSyncPol;    Syncpolarity: 0 : Sync is low; 1: Sync is high */

    0L,               /* DWORD HTAcquireTotal;      time or pixel between two hsync's              */
    0,                /* WORD  PhysCamType;         bit0: digital, bit1: linescan                  */
    0,                /* char *Manufacturer;        name of the camera manufactor                  */
    0,                /* char *PropDlgDLL;          DLL filename with properties dialog            */
    0,                /* char *PropDlgFuncName;     DLL function name of property dialog           */
    {0,0,0}           /* CAMPROP_T PropData;        Property data, camera dependent                */                                 
   },


/* --------------------------  VM_NTSC ----------------------------------------------------------- */
   {
    /* CAMERA DATA */
    "",               /* char Name[CT_NAME_LENGTH]; name of the camera                             */
    VM_NTSC,          /* WORD VideoMode;                                                           */
    1,                /* WORD Interlaced;           number of fields per frame                     */
    60,               /* WORD VerticalFreq;         Vertical scan frequency in Hz                  */
    15734,            /* WORD HorizontalFreq;       Horizontal scan frequency in Hz                */
    13500,            /* WORD ClockFreq;            Clock frequency in kHz                         */
    0,                /* WORD ClockMode;            0: internal; 1: external                       */

    /* ACQUIRE SETUP */
    0,                /* WORD AcquireMode;          0: Composite Sync; 1: Variable Scan            */
    0,                /* WORD InvertSync;           Bit 0: pixelclock invert;
                                                    Bit 1: line sync invert;
                                                    Bit 2: frame sync invert;                      */
    3,                /* WORD StartMode;            1: Odd; 2: Even; 3: Next                       */
    0,                /* WORD ChrominanceFilter;    0: AC coupled; 1: 50Hz; 2: 60Hz; 3: DC coupled */
    DEFAULT32 (1),    /* WORD Gain;                 0: 0.5; 1: 1; 2: 2; 4: 4;                      */
    DEFAULT32 (0),    /* WORD Offset;               in mV                                          */
    DEFAULT32 (0),    /* WORD LowReference;         in mV                                          */
    DEFAULT32 (1200), /* WORD HighReference;        in mV                                          */

    /* TIMING RAM SETUP */
    0,                /* WORD HTParameterMode;      horizontal parameter 0: in pixel 1: in ns;     */
    134L,           /* DWORD HTAquireStart;       acquire start position                         */
    720L,           /* DWORD HTAcquireWidth;      acquire width                                  */
    1,                /* WORD HTAcquireIncrement;   acquire increment                              */

    92L,            /* DWORD ClampStart;          clamp start position                           */
    5L,             /* DWORD ClampWidth;          clamp width 0: set to default 5                */
    92L,            /* DWORD ZeroStart;           zero start position                            */
    5L,             /* DWORD ZeroWidth;           zero width 0: set to default 5                 */
    288L,           /* DWORD FieldStart;          field gate start position 0: auto              */
    370L,           /* DWORD FieldWidth;          field gate width 0: auto                       */

    0,                /* WORD VTParameterMode;      vertical parameter 0: in lines 1: in us;       */
    14L,               /* DWORD VTAquireStart;       acquire start position                         */
    240L,             /* DWORD VTAcquireWidth;      acquire width                                  */
    1,                /* WORD VTAcquireIncrement;   acquire increment                              */
    0,                /* WORD  GenerateVSync;       0 : no; 1 : yes                                */
    0L,               /* DWORD GenerateVSyncStart;  Startposition of vsync                         */
    0L,               /* DWORD GenerateVSyncWidth;  Width of Sync pulse                            */
    0,                /* WORD  GenerateVSyncPol;    Syncpolarity: 0 : Sync is low; 1: Sync is high */

    0L,               /* DWORD HTAcquireTotal;      time or pixel between two hsync's              */
    0,                /* WORD  PhysCamType;         bit0: digital, bit1: linescan                  */
    0,                /* char *Manufacturer;        name of the camera manufactor                  */
    0,                /* char *PropDlgDLL;          DLL filename with properties dialog            */
    0,                /* char *PropDlgFuncName;     DLL function name of property dialog           */
    {0,0,0}           /* CAMPROP_T PropData;        Property data, camera dependent                */                                 
   },


/* --------------------------  VM_SECAM ---------------------------------------------------------- */
   {
    /* CAMERA DATA */
    "",               /* char Name[CT_NAME_LENGTH]; name of the camera                             */
    VM_SECAM,         /* WORD VideoMode;                                                           */
    1,                /* WORD Interlaced;           number of fields per frame                     */
    50,               /* WORD VerticalFreq;         Vertical scan frequency in Hz                  */
    15625,            /* WORD HorizontalFreq;       Horizontal scan frequency in Hz                */
    13500,            /* WORD ClockFreq;            Clock frequency in kHz                         */
    0,                /* WORD ClockMode;            0: internal; 1: external                       */

    /* ACQUIRE SETUP */
    0,                /* WORD AcquireMode;          0: Composite Sync; 1: Variable Scan            */
    0,                /* WORD InvertSync;           Bit 0: pixelclock invert;
                                                    Bit 1: line sync invert;
                                                    Bit 2: frame sync invert;                      */
    3,                /* WORD StartMode;            1: Odd; 2: Even; 3: Next                       */
    0,                /* WORD ChrominanceFilter;    0: AC coupled; 1: 50Hz; 2: 60Hz; 3: DC coupled */
    DEFAULT32 (1),    /* WORD Gain;                 0: 0.5; 1: 1; 2: 2; 4: 4;                      */
    DEFAULT32 (0),    /* WORD Offset;               in mV                                          */
    DEFAULT32 (0),    /* WORD LowReference;         in mV                                          */
    DEFAULT32 (1200), /* WORD HighReference;        in mV                                          */

    /* TIMING RAM SETUP */
    0,                /* WORD HTParameterMode;      horizontal parameter 0: in pixel 1: in ns;     */
    140L,           /* DWORD HTAquireStart;       acquire start position                         */
    720L,           /* DWORD HTAcquireWidth;      acquire width                                  */
    1,                /* WORD HTAcquireIncrement;   acquire increment                              */

    92L,            /* DWORD ClampStart;          clamp start position                           */
    5L,             /* DWORD ClampWidth;          clamp width 0: set to default 5                */
    92L,            /* DWORD ZeroStart;           zero start position                            */
    5L,             /* DWORD ZeroWidth;           zero width 0: set to default 5                 */
    300L,           /* DWORD FieldStart;          field gate start position 0: auto              */
    400L,           /* DWORD FieldWidth;          field gate width 0: auto                       */

    0,                /* WORD VTParameterMode;      vertical parameter 0: in lines 1: in us;       */
    19,               /* DWORD VTAquireStart;       acquire start position                         */
    288L,             /* DWORD VTAcquireWidth;      acquire width                                  */
    1,                /* WORD VTAcquireIncrement;   acquire increment                              */
    0,                /* WORD  GenerateVSync;       0 : no; 1 : yes                                */
    0L,               /* DWORD GenerateVSyncStart;  Startposition of vsync                         */
    0L,               /* DWORD GenerateVSyncWidth;  Width of Sync pulse                            */
    0,                /* WORD  GenerateVSyncPol;    Syncpolarity: 0 : Sync is low; 1: Sync is high */

    0L,               /* DWORD HTAcquireTotal;      time or pixel between two hsync's              */
    0,                /* WORD  PhysCamType;         bit0: digital, bit1: linescan                  */
    0,                /* char *Manufacturer;        name of the camera manufactor                  */
    0,                /* char *PropDlgDLL;          DLL filename with properties dialog            */
    0,                /* char *PropDlgFuncName;     DLL function name of property dialog           */
    {0,0,0}           /* CAMPROP_T PropData;        Property data, camera dependent                */                                 
   },


/* --------------------------  VM_SVHS  ---------------------------------------------------------- */
   {
    /* CAMERA DATA */
    "",               /* char Name[CT_NAME_LENGTH]; name of the camera                             */
    VM_SVHS,          /* WORD VideoMode;                                                           */
    1,                /* WORD Interlaced;           number of fields per frame                     */
    50,               /* WORD VerticalFreq;         Vertical scan frequency in Hz                  */
    15625,            /* WORD HorizontalFreq;       Horizontal scan frequency in Hz                */
    13500,            /* WORD ClockFreq;            Clock frequency in kHz                         */
    0,                /* WORD ClockMode;            0: internal; 1: external                       */

    /* ACQUIRE SETUP */
    0,                /* WORD AcquireMode;          0: Composite Sync; 1: Variable Scan            */
    0,                /* WORD InvertSync;           Bit 0: pixelclock invert;
                                                    Bit 1: line sync invert;
                                                    Bit 2: frame sync invert;                      */
    3,                /* WORD StartMode;            1: Odd; 2: Even; 3: Next                       */
    0,                /* WORD ChrominanceFilter;    0: AC coupled; 1: 50Hz; 2: 60Hz; 3: DC coupled */
    DEFAULT32 (1),    /* WORD Gain;                 0: 0.5; 1: 1; 2: 2; 4: 4;                      */
    DEFAULT32 (0),    /* WORD Offset;               in mV                                          */
    DEFAULT32 (0),    /* WORD LowReference;         in mV                                          */
    DEFAULT32 (1200), /* WORD HighReference;        in mV                                          */

    /* TIMING RAM SETUP */
    0,                /* WORD HTParameterMode;      horizontal parameter 0: in pixel 1: in ns;     */
    140L,           /* DWORD HTAquireStart;       acquire start position                         */
    720L,           /* DWORD HTAcquireWidth;      acquire width                                  */
    1,                /* WORD HTAcquireIncrement;   acquire increment                              */

    92L,            /* DWORD ClampStart;          clamp start position                           */
    5L,             /* DWORD ClampWidth;          clamp width 0: set to default 5                */
    92L,            /* DWORD ZeroStart;           zero start position                            */
    5L,             /* DWORD ZeroWidth;           zero width 0: set to default 5                 */
    288L,           /* DWORD FieldStart;          field gate start position 0: auto              */
    370L,           /* DWORD FieldWidth;          field gate width 0: auto                       */

    0,                /* WORD VTParameterMode;      vertical parameter 0: in lines 1: in us;       */
    19L,               /* DWORD VTAquireStart;       acquire start position                         */
    288L,             /* DWORD VTAcquireWidth;      acquire width                                  */
    1,                /* WORD VTAcquireIncrement;   acquire increment                              */
    0,                /* WORD  GenerateVSync;       0 : no; 1 : yes                                */
    0L,               /* DWORD GenerateVSyncStart;  Startposition of vsync                         */
    0L,               /* DWORD GenerateVSyncWidth;  Width of Sync pulse                            */
    0,                /* WORD  GenerateVSyncPol;    Syncpolarity: 0 : Sync is low; 1: Sync is high */

    0L,               /* DWORD HTAcquireTotal;      time or pixel between two hsync's              */
    0,                /* WORD  PhysCamType;         bit0: digital, bit1: linescan                  */
    0,                /* char *Manufacturer;        name of the camera manufactor                  */
    0,                /* char *PropDlgDLL;          DLL filename with properties dialog            */
    0,                /* char *PropDlgFuncName;     DLL function name of property dialog           */
    {0,0,0}           /* CAMPROP_T PropData;        Property data, camera dependent                */                                 
   },


/* --------------------------  VM_VSCAN  --------------------------------------------------------- */
   {
    /* CAMERA DATA */
    "",               /* char Name[CT_NAME_LENGTH]; name of the camera                             */
    VM_VSCAN,          /* WORD VideoMode;                                                           */
    1,                /* WORD Interlaced;           number of fields per frame                     */
    50,               /* WORD VerticalFreq;         Vertical scan frequency in Hz                  */
    15625,            /* WORD HorizontalFreq;       Horizontal scan frequency in Hz                */
    14750,            /* WORD ClockFreq;            Clock frequency in kHz                         */
    1,                /* WORD ClockMode;            0: internal; 1: external                       */

     /* ACQUIRE SETUP */
    0,                /* WORD AcquireMode;          0: Composite Sync; 1: Variable Scan            */
    0,                /* WORD InvertSync;           Bit 0: pixelclock invert;
                                                    Bit 1: line sync invert;
                                                    Bit 2: frame sync invert;                      */
    3,                /* WORD StartMode;            1: Odd; 2: Even; 3: Next                       */
    0,                /* WORD ChrominanceFilter;    0: AC coupled; 1: 50Hz; 2: 60Hz; 3: DC coupled */
    DEFAULT32 (1),    /* WORD Gain;                 0: 0.5; 1: 1; 2: 2; 4: 4;                      */
    DEFAULT32 (0),    /* WORD Offset;               in mV                                          */
    DEFAULT32 (0),    /* WORD LowReference;         in mV                                          */
    DEFAULT32 (1200), /* WORD HighReference;        in mV                                          */

    /* TIMING RAM SETUP */
    0,                /* WORD HTParameterMode;      horizontal parameter 0: in pixel 1: in ns;     */
    152L,             /* DWORD HTAquireStart;       acquire start position                         */
    768L,             /* DWORD HTAcquireWidth;      acquire width                                  */
    1,                /* WORD HTAcquireIncrement;   acquire increment                              */

    100L,             /* DWORD ClampStart;          clamp start position                           */
    5L,               /* DWORD ClampWidth;          clamp width 0: set to default 5                */
    130L,             /* DWORD ZeroStart;           zero start position                            */
    5L,               /* DWORD ZeroWidth;           zero width 0: set to default 5                 */
    300L,             /* DWORD FieldStart;          field gate start position 0: auto              */
    400L,             /* DWORD FieldWidth;          field gate width 0: auto                       */

    0,                /* WORD VTParameterMode;      vertical parameter 0: in lines 1: in us;       */
    19,               /* DWORD VTAquireStart;       acquire start position                         */
    288L,             /* DWORD VTAcquireWidth;      acquire width                                  */
    1,                /* WORD VTAcquireIncrement;   acquire increment                              */
    0,                /* WORD  GenerateVSync;       0 : no; 1 : yes                                */
    0L,               /* DWORD GenerateVSyncStart;  Startposition of vsync                         */
    0L,               /* DWORD GenerateVSyncWidth;  Width of Sync pulse                            */
    0,                /* WORD  GenerateVSyncPol;    Syncpolarity: 0 : Sync is low; 1: Sync is high */

    0L,               /* DWORD HTAcquireTotal;      time or pixel between two hsync's              */
    0,                /* WORD  PhysCamType;         bit0: digital, bit1: linescan                  */
    0,                /* char *Manufacturer;        name of the camera manufactor                  */
    0,                /* char *PropDlgDLL;          DLL filename with properties dialog            */
    0,                /* char *PropDlgFuncName;     DLL function name of property dialog           */
    {0,0,0}           /* CAMPROP_T PropData;        Property data, camera dependent                */                                 

   },


/* --------------------------  VM_CCIR576  ------------------------------------------------------- */
   {
    /* CAMERA DATA */
    "",               /* char Name[CT_NAME_LENGTH]; name of the camera                             */
    VM_CCIR,          /* WORD VideoMode;                                                           */
    1,                /* WORD Interlaced;           number of fields per frame                     */
    50,               /* WORD VerticalFreq;         Vertical scan frequency in Hz                  */
    15625,            /* WORD HorizontalFreq;       Horizontal scan frequency in Hz                */
    14750,            /* WORD ClockFreq;            Clock frequency in kHz                         */
    0,                /* WORD ClockMode;            0: internal; 1: external                       */

     /* ACQUIRE SETUP */
    0,                /* WORD AcquireMode;          0: Composite Sync; 1: Variable Scan            */
    0,                /* WORD InvertSync;           Bit 0: pixelclock invert;
                                                    Bit 1: line sync invert;
                                                    Bit 2: frame sync invert;                      */
    3,                /* WORD StartMode;            1: Odd; 2: Even; 3: Next                       */
    0,                /* WORD ChrominanceFilter;    0: AC coupled; 1: 50Hz; 2: 60Hz; 3: DC coupled */
    DEFAULT32 (1),    /* WORD Gain;                 0: 0.5; 1: 1; 2: 2; 4: 4;                      */
    DEFAULT32 (0),    /* WORD Offset;               in mV                                          */
    DEFAULT32 (0),    /* WORD LowReference;         in mV                                          */
    DEFAULT32 (1200), /* WORD HighReference;        in mV                                          */

    /* TIMING RAM SETUP */
    0,                /* WORD HTParameterMode;      horizontal parameter 0: in pixel 1: in ns;     */
    152L,             /* DWORD HTAquireStart;       acquire start position                         */
    768L,             /* DWORD HTAcquireWidth;      acquire width                                  */
    1,                /* WORD HTAcquireIncrement;   acquire increment                              */

    100L,             /* DWORD ClampStart;          clamp start position                           */
    5L,               /* DWORD ClampWidth;          clamp width 0: set to default 5                */
    130L,             /* DWORD ZeroStart;           zero start position                            */
    5L,               /* DWORD ZeroWidth;           zero width 0: set to default 5                 */
    300L,             /* DWORD FieldStart;          field gate start position 0: auto              */
    400L,             /* DWORD FieldWidth;          field gate width 0: auto                       */

    0,                /* WORD VTParameterMode;      vertical parameter 0: in lines 1: in us;       */
    19,               /* DWORD VTAquireStart;       acquire start position                         */
    288L,             /* DWORD VTAcquireWidth;      acquire width                                  */
    1,                /* WORD VTAcquireIncrement;   acquire increment                              */
    0,                /* WORD  GenerateVSync;       0 : no; 1 : yes                                */
    0L,               /* DWORD GenerateVSyncStart;  Startposition of vsync                         */
    0L,               /* DWORD GenerateVSyncWidth;  Width of Sync pulse                            */
    0,                /* WORD  GenerateVSyncPol;    Syncpolarity: 0 : Sync is low; 1: Sync is high */

    0L,               /* DWORD HTAcquireTotal;      time or pixel between two hsync's              */
    0,                /* WORD  PhysCamType;         bit0: digital, bit1: linescan                  */
    0,                /* char *Manufacturer;        name of the camera manufactor                  */
    0,                /* char *PropDlgDLL;          DLL filename with properties dialog            */
    0,                /* char *PropDlgFuncName;     DLL function name of property dialog           */
    {0,0,0}           /* CAMPROP_T PropData;        Property data, camera dependent                */                                 

   },


/* --------------------------  VM_PAL576  -------------------------------------------------------- */
   {
    /* CAMERA DATA */
    "",               /* char Name[CT_NAME_LENGTH]; name of the camera                             */
    VM_PAL,           /* WORD VideoMode;                                                           */
    1,                /* WORD Interlaced;           number of fields per frame                     */
    50,               /* WORD VerticalFreq;         Vertical scan frequency in Hz                  */
    15625,            /* WORD HorizontalFreq;       Horizontal scan frequency in Hz                */
    13500,            /* WORD ClockFreq;            Clock frequency in kHz                         */
    0,                /* WORD ClockMode;            0: internal; 1: external                       */

    /* ACQUIRE SETUP */
    0,                /* WORD AcquireMode;          0: Composite Sync; 1: Variable Scan            */
    0,                /* WORD InvertSync;           Bit 0: pixelclock invert;
                                                    Bit 1: line sync invert;
                                                    Bit 2: frame sync invert;                      */
    3,                /* WORD StartMode;            1: Odd; 2: Even; 3: Next                       */
    0,                /* WORD ChrominanceFilter;    0: AC coupled; 1: 50Hz; 2: 60Hz; 3: DC coupled */
    DEFAULT32 (1),    /* WORD Gain;                 0: 0.5; 1: 1; 2: 2; 4: 4;                      */
    DEFAULT32 (0),    /* WORD Offset;               in mV                                          */
    DEFAULT32 (0),    /* WORD LowReference;         in mV                                          */
    DEFAULT32 (1200), /* WORD HighReference;        in mV                                          */

    /* TIMING RAM SETUP */
    0,                /* WORD HTParameterMode;      horizontal parameter 0: in pixel 1: in ns;     */
    140L,           /* DWORD HTAquireStart;       acquire start position                         */
    720L,           /* DWORD HTAcquireWidth;      acquire width                                  */
    1,                /* WORD HTAcquireIncrement;   acquire increment                              */

    92L,            /* DWORD ClampStart;          clamp start position                           */
    5L,             /* DWORD ClampWidth;          clamp width 0: set to default 5                */
    92L,            /* DWORD ZeroStart;           zero start position                            */
    5L,             /* DWORD ZeroWidth;           zero width 0: set to default 5                 */
    300L,           /* DWORD FieldStart;          field gate start position 0: auto              */
    400L,           /* DWORD FieldWidth;          field gate width 0: auto                       */

    0,                /* WORD VTParameterMode;      vertical parameter 0: in lines 1: in us;       */
    19,               /* DWORD VTAquireStart;       acquire start position                         */
    288L,             /* DWORD VTAcquireWidth;      acquire width                                  */
    1,                /* WORD VTAcquireIncrement;   acquire increment                              */
    0,                /* WORD  GenerateVSync;       0 : no; 1 : yes                                */
    0L,               /* DWORD GenerateVSyncStart;  Startposition of vsync                         */
    0L,               /* DWORD GenerateVSyncWidth;  Width of Sync pulse                            */
    0,                /* WORD  GenerateVSyncPol;    Syncpolarity: 0 : Sync is low; 1: Sync is high */

    0L,               /* DWORD HTAcquireTotal;      time or pixel between two hsync's              */
    0,                /* WORD  PhysCamType;         bit0: digital, bit1: linescan                  */
    0,                /* char *Manufacturer;        name of the camera manufactor                  */
    0,                /* char *PropDlgDLL;          DLL filename with properties dialog            */
    0,                /* char *PropDlgFuncName;     DLL function name of property dialog           */
    {0,0,0}           /* CAMPROP_T PropData;        Property data, camera dependent                */                                 
   },


/* --------------------------  VM_RGB ------------------------------------------------------------ */
   {
    /* CAMERA DATA */
    "",               /* char Name[CT_NAME_LENGTH]; name of the camera                             */
    VM_RGB,           /* WORD VideoMode;                                                           */
    1,                /* WORD Interlaced;           number of fields per frame                     */
    50,               /* WORD VerticalFreq;         Vertical scan frequency in Hz                  */
    15625,            /* WORD HorizontalFreq;       Horizontal scan frequency in Hz                */
    13500,            /* WORD ClockFreq;            Clock frequency in kHz                         */
    0,                /* WORD ClockMode;            0: internal; 1: external                       */

    /* ACQUIRE SETUP */
    0,                /* WORD AcquireMode;          0: Composite Sync; 1: Variable Scan            */
    0,                /* WORD InvertSync;           Bit 0: pixelclock invert;
                                                    Bit 1: line sync invert;
                                                    Bit 2: frame sync invert;                      */
    3,                /* WORD StartMode;            1: Odd; 2: Even; 3: Next                       */
    0,                /* WORD ChrominanceFilter;    0: AC coupled; 1: 50Hz; 2: 60Hz; 3: DC coupled */
    DEFAULT32 (1),    /* WORD Gain;                 0: 0.5; 1: 1; 2: 2; 4: 4;                      */
    DEFAULT32 (0),    /* WORD Offset;               in mV                                          */
    DEFAULT32 (0),    /* WORD LowReference;         in mV                                          */
    DEFAULT32 (1200), /* WORD HighReference;        in mV                                          */

    /* TIMING RAM SETUP */
    0,                /* WORD HTParameterMode;      horizontal parameter 0: in pixel 1: in ns;     */
    140L,           /* DWORD HTAquireStart;       acquire start position                         */
    720L,           /* DWORD HTAcquireWidth;      acquire width                                  */
    1,                /* WORD HTAcquireIncrement;   acquire increment                              */

    120L,            /* DWORD ClampStart;          clamp start position                           */
    5L,             /* DWORD ClampWidth;          clamp width 0: set to default 5                */
    130L,            /* DWORD ZeroStart;           zero start position                            */
    5L,             /* DWORD ZeroWidth;           zero width 0: set to default 5                 */
    288L,           /* DWORD FieldStart;          field gate start position 0: auto              */
    370L,           /* DWORD FieldWidth;          field gate width 0: auto                       */

    0,                /* WORD VTParameterMode;      vertical parameter 0: in lines 1: in us;       */
    20,               /* DWORD VTAquireStart;       acquire start position                         */
    288L,             /* DWORD VTAcquireWidth;      acquire width                                  */
    1,                /* WORD VTAcquireIncrement;   acquire increment                              */
    0,                /* WORD  GenerateVSync;       0 : no; 1 : yes                                */
    0L,               /* DWORD GenerateVSyncStart;  Startposition of vsync                         */
    0L,               /* DWORD GenerateVSyncWidth;  Width of Sync pulse                            */
    0,                /* WORD  GenerateVSyncPol;    Syncpolarity: 0 : Sync is low; 1: Sync is high */

    0L,               /* DWORD HTAcquireTotal;      time or pixel between two hsync's              */
    0,                /* WORD  PhysCamType;         bit0: digital, bit1: linescan                  */
    0,                /* char *Manufacturer;        name of the camera manufactor                  */
    0,                /* char *PropDlgDLL;          DLL filename with properties dialog            */
    0,                /* char *PropDlgFuncName;     DLL function name of property dialog           */
    {0,0,0}           /* CAMPROP_T PropData;        Property data, camera dependent                */                                 
   },


/* --------------------------  #11 ------------------------------------------------------------ */

   {
     /* CAMERA DATA */
    "",               /* char Name[CT_NAME_LENGTH]; name of the camera                             */
    11,               /* WORD VideoMode;                                                           */
    1,                /* WORD Interlaced;           number of fields per frame                     */
    50,               /* WORD VerticalFreq;         Vertical scan frequency in Hz                  */
    15625,            /* WORD HorizontalFreq;       Horizontal scan frequency in Hz                */
    14750,            /* WORD ClockFreq;            Clock frequency in kHz                         */
    0,                /* WORD ClockMode;            0: internal; 1: external                       */

     /* ACQUIRE SETUP */
    0,                /* WORD AcquireMode;          0: Composite Sync; 1: Variable Scan            */
    0,                /* WORD InvertSync;           Bit 0: pixelclock invert;
                                                    Bit 1: line sync invert;
                                                    Bit 2: frame sync invert;                      */
    3,                /* WORD StartMode;            1: Odd; 2: Even; 3: Next                       */
    0,                /* WORD ChrominanceFilter;    0: AC coupled; 1: 50Hz; 2: 60Hz; 3: DC coupled */
    DEFAULT32 (1),    /* WORD Gain;                 0: 0.5; 1: 1; 2: 2; 4: 4;                      */
    DEFAULT32 (0),    /* WORD Offset;               in mV                                          */
    DEFAULT32 (0),    /* WORD LowReference;         in mV                                          */
    DEFAULT32 (1200), /* WORD HighReference;        in mV                                          */

    /* TIMING RAM SETUP */
    0,                /* WORD HTParameterMode;      horizontal parameter 0: in pixel 1: in ns;     */
    152L,             /* DWORD HTAquireStart;       acquire start position                         */
    768L,             /* DWORD HTAcquireWidth;      acquire width                                  */
    1,                /* WORD HTAcquireIncrement;   acquire increment                              */

    100L,             /* DWORD ClampStart;          clamp start position                           */
    5L,               /* DWORD ClampWidth;          clamp width 0: set to default 5                */
    130L,             /* DWORD ZeroStart;           zero start position                            */
    5L,               /* DWORD ZeroWidth;           zero width 0: set to default 5                 */
    300L,             /* DWORD FieldStart;          field gate start position 0: auto              */
    400L,             /* DWORD FieldWidth;          field gate width 0: auto                       */

    0,                /* WORD VTParameterMode;      vertical parameter 0: in lines 1: in us;       */
    19,               /* DWORD VTAquireStart;       acquire start position                         */
    288L,             /* DWORD VTAcquireWidth;      acquire width                                  */
    1,                /* WORD VTAcquireIncrement;   acquire increment                              */
    0,                /* WORD  GenerateVSync;       0 : no; 1 : yes                                */
    0L,               /* DWORD GenerateVSyncStart;  Startposition of vsync                         */
    0L,               /* DWORD GenerateVSyncWidth;  Width of Sync pulse                            */
    0,                /* WORD  GenerateVSyncPol;    Syncpolarity: 0 : Sync is low; 1: Sync is high */

    0L,               /* DWORD HTAcquireTotal;      time or pixel between two hsync's              */
    0,                /* WORD  PhysCamType;         bit0: digital, bit1: linescan                  */
    0,                /* char *Manufacturer;        name of the camera manufactor                  */
    0,                /* char *PropDlgDLL;          DLL filename with properties dialog            */
    0,                /* char *PropDlgFuncName;     DLL function name of property dialog           */
    {0,0,0}           /* CAMPROP_T PropData;        Property data, camera dependent                */                                 

   },

/* --------------------------  #12 ------------------------------------------------------------ */

   {
     /* CAMERA DATA */
    "",               /* char Name[CT_NAME_LENGTH]; name of the camera                             */
    12,               /* WORD VideoMode;                                                           */
    1,                /* WORD Interlaced;           number of fields per frame                     */
    50,               /* WORD VerticalFreq;         Vertical scan frequency in Hz                  */
    15625,            /* WORD HorizontalFreq;       Horizontal scan frequency in Hz                */
    14750,            /* WORD ClockFreq;            Clock frequency in kHz                         */
    0,                /* WORD ClockMode;            0: internal; 1: external                       */

     /* ACQUIRE SETUP */
    0,                /* WORD AcquireMode;          0: Composite Sync; 1: Variable Scan            */
    0,                /* WORD InvertSync;           Bit 0: pixelclock invert;
                                                    Bit 1: line sync invert;
                                                    Bit 2: frame sync invert;                      */
    3,                /* WORD StartMode;            1: Odd; 2: Even; 3: Next                       */
    0,                /* WORD ChrominanceFilter;    0: AC coupled; 1: 50Hz; 2: 60Hz; 3: DC coupled */
    DEFAULT32 (1),    /* WORD Gain;                 0: 0.5; 1: 1; 2: 2; 4: 4;                      */
    DEFAULT32 (0),    /* WORD Offset;               in mV                                          */
    DEFAULT32 (0),    /* WORD LowReference;         in mV                                          */
    DEFAULT32 (1200), /* WORD HighReference;        in mV                                          */

    /* TIMING RAM SETUP */
    0,                /* WORD HTParameterMode;      horizontal parameter 0: in pixel 1: in ns;     */
    152L,             /* DWORD HTAquireStart;       acquire start position                         */
    768L,             /* DWORD HTAcquireWidth;      acquire width                                  */
    1,                /* WORD HTAcquireIncrement;   acquire increment                              */

    100L,             /* DWORD ClampStart;          clamp start position                           */
    5L,               /* DWORD ClampWidth;          clamp width 0: set to default 5                */
    130L,             /* DWORD ZeroStart;           zero start position                            */
    5L,               /* DWORD ZeroWidth;           zero width 0: set to default 5                 */
    300L,             /* DWORD FieldStart;          field gate start position 0: auto              */
    400L,             /* DWORD FieldWidth;          field gate width 0: auto                       */

    0,                /* WORD VTParameterMode;      vertical parameter 0: in lines 1: in us;       */
    19,               /* DWORD VTAquireStart;       acquire start position                         */
    288L,             /* DWORD VTAcquireWidth;      acquire width                                  */
    1,                /* WORD VTAcquireIncrement;   acquire increment                              */
    0,                /* WORD  GenerateVSync;       0 : no; 1 : yes                                */
    0L,               /* DWORD GenerateVSyncStart;  Startposition of vsync                         */
    0L,               /* DWORD GenerateVSyncWidth;  Width of Sync pulse                            */
    0,                /* WORD  GenerateVSyncPol;    Syncpolarity: 0 : Sync is low; 1: Sync is high */

    0L,               /* DWORD HTAcquireTotal;      time or pixel between two hsync's              */
    0,                /* WORD  PhysCamType;         bit0: digital, bit1: linescan                  */
    0,                /* char *Manufacturer;        name of the camera manufactor                  */
    0,                /* char *PropDlgDLL;          DLL filename with properties dialog            */
    0,                /* char *PropDlgFuncName;     DLL function name of property dialog           */
    {0,0,0}           /* CAMPROP_T PropData;        Property data, camera dependent                */                                 

   },

/* --------------------------  #13 ------------------------------------------------------------ */

   {
     /* CAMERA DATA */
    "",               /* char Name[CT_NAME_LENGTH]; name of the camera                             */
    13,               /* WORD VideoMode;                                                           */
    1,                /* WORD Interlaced;           number of fields per frame                     */
    50,               /* WORD VerticalFreq;         Vertical scan frequency in Hz                  */
    15625,            /* WORD HorizontalFreq;       Horizontal scan frequency in Hz                */
    14750,            /* WORD ClockFreq;            Clock frequency in kHz                         */
    0,                /* WORD ClockMode;            0: internal; 1: external                       */

     /* ACQUIRE SETUP */
    0,                /* WORD AcquireMode;          0: Composite Sync; 1: Variable Scan            */
    0,                /* WORD InvertSync;           Bit 0: pixelclock invert;
                                                    Bit 1: line sync invert;
                                                    Bit 2: frame sync invert;                      */
    3,                /* WORD StartMode;            1: Odd; 2: Even; 3: Next                       */
    0,                /* WORD ChrominanceFilter;    0: AC coupled; 1: 50Hz; 2: 60Hz; 3: DC coupled */
    DEFAULT32 (1),    /* WORD Gain;                 0: 0.5; 1: 1; 2: 2; 4: 4;                      */
    DEFAULT32 (0),    /* WORD Offset;               in mV                                          */
    DEFAULT32 (0),    /* WORD LowReference;         in mV                                          */
    DEFAULT32 (1200), /* WORD HighReference;        in mV                                          */

    /* TIMING RAM SETUP */
    0,                /* WORD HTParameterMode;      horizontal parameter 0: in pixel 1: in ns;     */
    152L,             /* DWORD HTAquireStart;       acquire start position                         */
    768L,             /* DWORD HTAcquireWidth;      acquire width                                  */
    1,                /* WORD HTAcquireIncrement;   acquire increment                              */

    100L,             /* DWORD ClampStart;          clamp start position                           */
    5L,               /* DWORD ClampWidth;          clamp width 0: set to default 5                */
    130L,             /* DWORD ZeroStart;           zero start position                            */
    5L,               /* DWORD ZeroWidth;           zero width 0: set to default 5                 */
    300L,             /* DWORD FieldStart;          field gate start position 0: auto              */
    400L,             /* DWORD FieldWidth;          field gate width 0: auto                       */

    0,                /* WORD VTParameterMode;      vertical parameter 0: in lines 1: in us;       */
    19,               /* DWORD VTAquireStart;       acquire start position                         */
    288L,             /* DWORD VTAcquireWidth;      acquire width                                  */
    1,                /* WORD VTAcquireIncrement;   acquire increment                              */
    0,                /* WORD  GenerateVSync;       0 : no; 1 : yes                                */
    0L,               /* DWORD GenerateVSyncStart;  Startposition of vsync                         */
    0L,               /* DWORD GenerateVSyncWidth;  Width of Sync pulse                            */
    0,                /* WORD  GenerateVSyncPol;    Syncpolarity: 0 : Sync is low; 1: Sync is high */

    0L,               /* DWORD HTAcquireTotal;      time or pixel between two hsync's              */
    0,                /* WORD  PhysCamType;         bit0: digital, bit1: linescan                  */
    0,                /* char *Manufacturer;        name of the camera manufactor                  */
    0,                /* char *PropDlgDLL;          DLL filename with properties dialog            */
    0,                /* char *PropDlgFuncName;     DLL function name of property dialog           */
    {0,0,0}           /* CAMPROP_T PropData;        Property data, camera dependent                */                                 

   },

/* --------------------------  VM_DIG8 ------------------------------------------------------------ */

   {
     /* CAMERA DATA */
    "",               /* char Name[CT_NAME_LENGTH]; name of the camera                             */
    VM_DIG8,          /* WORD VideoMode;                                                           */
    1,                /* WORD Interlaced;           number of fields per frame                     */
    50,               /* WORD VerticalFreq;         Vertical scan frequency in Hz                  */
    15625,            /* WORD HorizontalFreq;       Horizontal scan frequency in Hz                */
    14750,            /* WORD ClockFreq;            Clock frequency in kHz                         */
    1,                /* WORD ClockMode;            0: internal; 1: external                       */

     /* ACQUIRE SETUP */
    0,                /* WORD AcquireMode;          0: Composite Sync; 1: Variable Scan            */
    0,                /* WORD InvertSync;           Bit 0: pixelclock invert;
                                                    Bit 1: line sync invert;
                                                    Bit 2: frame sync invert;                      */
    3,                /* WORD StartMode;            1: Odd; 2: Even; 3: Next                       */
    0,                /* WORD ChrominanceFilter;    0: AC coupled; 1: 50Hz; 2: 60Hz; 3: DC coupled */
    DEFAULT32 (1),    /* WORD Gain;                 0: 0.5; 1: 1; 2: 2; 4: 4;                      */
    DEFAULT32 (0),    /* WORD Offset;               in mV                                          */
    DEFAULT32 (0),    /* WORD LowReference;         in mV                                          */
    DEFAULT32 (1200), /* WORD HighReference;        in mV                                          */

    /* TIMING RAM SETUP */
    0,                /* WORD HTParameterMode;      horizontal parameter 0: in pixel 1: in ns;     */
    152L,             /* DWORD HTAquireStart;       acquire start position                         */
    768L,             /* DWORD HTAcquireWidth;      acquire width                                  */
    1,                /* WORD HTAcquireIncrement;   acquire increment                              */

    100L,             /* DWORD ClampStart;          clamp start position                           */
    5L,               /* DWORD ClampWidth;          clamp width 0: set to default 5                */
    130L,             /* DWORD ZeroStart;           zero start position                            */
    5L,               /* DWORD ZeroWidth;           zero width 0: set to default 5                 */
    300L,             /* DWORD FieldStart;          field gate start position 0: auto              */
    400L,             /* DWORD FieldWidth;          field gate width 0: auto                       */

    0,                /* WORD VTParameterMode;      vertical parameter 0: in lines 1: in us;       */
    19,               /* DWORD VTAquireStart;       acquire start position                         */
    288L,             /* DWORD VTAcquireWidth;      acquire width                                  */
    1,                /* WORD VTAcquireIncrement;   acquire increment                              */
    0,                /* WORD  GenerateVSync;       0 : no; 1 : yes                                */
    0L,               /* DWORD GenerateVSyncStart;  Startposition of vsync                         */
    0L,               /* DWORD GenerateVSyncWidth;  Width of Sync pulse                            */
    0,                /* WORD  GenerateVSyncPol;    Syncpolarity: 0 : Sync is low; 1: Sync is high */

    0L,               /* DWORD HTAcquireTotal;      time or pixel between two hsync's              */
    0,                /* WORD  PhysCamType;         bit0: digital, bit1: linescan                  */
    0,                /* char *Manufacturer;        name of the camera manufactor                  */
    0,                /* char *PropDlgDLL;          DLL filename with properties dialog            */
    0,                /* char *PropDlgFuncName;     DLL function name of property dialog           */
    {0,0,0}           /* CAMPROP_T PropData;        Property data, camera dependent                */                                 

   },

/* --------------------------  VM_DIG10 ------------------------------------------------------------ */

   {
     /* CAMERA DATA */
    "",               /* char Name[CT_NAME_LENGTH]; name of the camera                             */
    VM_DIG10,         /* WORD VideoMode;                                                           */
    1,                /* WORD Interlaced;           number of fields per frame                     */
    50,               /* WORD VerticalFreq;         Vertical scan frequency in Hz                  */
    15625,            /* WORD HorizontalFreq;       Horizontal scan frequency in Hz                */
    14750,            /* WORD ClockFreq;            Clock frequency in kHz                         */
    1,                /* WORD ClockMode;            0: internal; 1: external                       */

     /* ACQUIRE SETUP */
    0,                /* WORD AcquireMode;          0: Composite Sync; 1: Variable Scan            */
    0,                /* WORD InvertSync;           Bit 0: pixelclock invert;
                                                    Bit 1: line sync invert;
                                                    Bit 2: frame sync invert;                      */
    3,                /* WORD StartMode;            1: Odd; 2: Even; 3: Next                       */
    0,                /* WORD ChrominanceFilter;    0: AC coupled; 1: 50Hz; 2: 60Hz; 3: DC coupled */
    DEFAULT32 (1),    /* WORD Gain;                 0: 0.5; 1: 1; 2: 2; 4: 4;                      */
    DEFAULT32 (0),    /* WORD Offset;               in mV                                          */
    DEFAULT32 (0),    /* WORD LowReference;         in mV                                          */
    DEFAULT32 (1200), /* WORD HighReference;        in mV                                          */

    /* TIMING RAM SETUP */
    0,                /* WORD HTParameterMode;      horizontal parameter 0: in pixel 1: in ns;     */
    152L,             /* DWORD HTAquireStart;       acquire start position                         */
    768L,             /* DWORD HTAcquireWidth;      acquire width                                  */
    1,                /* WORD HTAcquireIncrement;   acquire increment                              */

    100L,             /* DWORD ClampStart;          clamp start position                           */
    5L,               /* DWORD ClampWidth;          clamp width 0: set to default 5                */
    130L,             /* DWORD ZeroStart;           zero start position                            */
    5L,               /* DWORD ZeroWidth;           zero width 0: set to default 5                 */
    300L,             /* DWORD FieldStart;          field gate start position 0: auto              */
    400L,             /* DWORD FieldWidth;          field gate width 0: auto                       */

    0,                /* WORD VTParameterMode;      vertical parameter 0: in lines 1: in us;       */
    19,               /* DWORD VTAquireStart;       acquire start position                         */
    288L,             /* DWORD VTAcquireWidth;      acquire width                                  */
    1,                /* WORD VTAcquireIncrement;   acquire increment                              */
    0,                /* WORD  GenerateVSync;       0 : no; 1 : yes                                */
    0L,               /* DWORD GenerateVSyncStart;  Startposition of vsync                         */
    0L,               /* DWORD GenerateVSyncWidth;  Width of Sync pulse                            */
    0,                /* WORD  GenerateVSyncPol;    Syncpolarity: 0 : Sync is low; 1: Sync is high */

    0L,               /* DWORD HTAcquireTotal;      time or pixel between two hsync's              */
    0,                /* WORD  PhysCamType;         bit0: digital, bit1: linescan                  */
    0,                /* char *Manufacturer;        name of the camera manufactor                  */
    0,                /* char *PropDlgDLL;          DLL filename with properties dialog            */
    0,                /* char *PropDlgFuncName;     DLL function name of property dialog           */
    {0,0,0}           /* CAMPROP_T PropData;        Property data, camera dependent                */                                 

   },

/* --------------------------  VM_DIG12 ------------------------------------------------------------ */

   {
     /* CAMERA DATA */
    "",               /* char Name[CT_NAME_LENGTH]; name of the camera                             */
    VM_DIG12,          /* WORD VideoMode;                                                           */
    1,                /* WORD Interlaced;           number of fields per frame                     */
    50,               /* WORD VerticalFreq;         Vertical scan frequency in Hz                  */
    15625,            /* WORD HorizontalFreq;       Horizontal scan frequency in Hz                */
    14750,            /* WORD ClockFreq;            Clock frequency in kHz                         */
    1,                /* WORD ClockMode;            0: internal; 1: external                       */

     /* ACQUIRE SETUP */
    0,                /* WORD AcquireMode;          0: Composite Sync; 1: Variable Scan            */
    0,                /* WORD InvertSync;           Bit 0: pixelclock invert;
                                                    Bit 1: line sync invert;
                                                    Bit 2: frame sync invert;                      */
    3,                /* WORD StartMode;            1: Odd; 2: Even; 3: Next                       */
    0,                /* WORD ChrominanceFilter;    0: AC coupled; 1: 50Hz; 2: 60Hz; 3: DC coupled */
    DEFAULT32 (1),    /* WORD Gain;                 0: 0.5; 1: 1; 2: 2; 4: 4;                      */
    DEFAULT32 (0),    /* WORD Offset;               in mV                                          */
    DEFAULT32 (0),    /* WORD LowReference;         in mV                                          */
    DEFAULT32 (1200), /* WORD HighReference;        in mV                                          */

    /* TIMING RAM SETUP */
    0,                /* WORD HTParameterMode;      horizontal parameter 0: in pixel 1: in ns;     */
    152L,             /* DWORD HTAquireStart;       acquire start position                         */
    768L,             /* DWORD HTAcquireWidth;      acquire width                                  */
    1,                /* WORD HTAcquireIncrement;   acquire increment                              */

    100L,             /* DWORD ClampStart;          clamp start position                           */
    5L,               /* DWORD ClampWidth;          clamp width 0: set to default 5                */
    130L,             /* DWORD ZeroStart;           zero start position                            */
    5L,               /* DWORD ZeroWidth;           zero width 0: set to default 5                 */
    300L,             /* DWORD FieldStart;          field gate start position 0: auto              */
    400L,             /* DWORD FieldWidth;          field gate width 0: auto                       */

    0,                /* WORD VTParameterMode;      vertical parameter 0: in lines 1: in us;       */
    19,               /* DWORD VTAquireStart;       acquire start position                         */
    288L,             /* DWORD VTAcquireWidth;      acquire width                                  */
    1,                /* WORD VTAcquireIncrement;   acquire increment                              */
    0,                /* WORD  GenerateVSync;       0 : no; 1 : yes                                */
    0L,               /* DWORD GenerateVSyncStart;  Startposition of vsync                         */
    0L,               /* DWORD GenerateVSyncWidth;  Width of Sync pulse                            */
    0,                /* WORD  GenerateVSyncPol;    Syncpolarity: 0 : Sync is low; 1: Sync is high */

    0L,               /* DWORD HTAcquireTotal;      time or pixel between two hsync's              */
    0,                /* WORD  PhysCamType;         bit0: digital, bit1: linescan                  */
    0,                /* char *Manufacturer;        name of the camera manufactor                  */
    0,                /* char *PropDlgDLL;          DLL filename with properties dialog            */
    0,                /* char *PropDlgFuncName;     DLL function name of property dialog           */
    {0,0,0}           /* CAMPROP_T PropData;        Property data, camera dependent                */                                 

   },

/* --------------------------  VM_DIG16 ------------------------------------------------------------ */

   {
     /* CAMERA DATA */
    "",               /* char Name[CT_NAME_LENGTH]; name of the camera                             */
    VM_DIG16,          /* WORD VideoMode;                                                           */
    1,                /* WORD Interlaced;           number of fields per frame                     */
    50,               /* WORD VerticalFreq;         Vertical scan frequency in Hz                  */
    15625,            /* WORD HorizontalFreq;       Horizontal scan frequency in Hz                */
    14750,            /* WORD ClockFreq;            Clock frequency in kHz                         */
    1,                /* WORD ClockMode;            0: internal; 1: external                       */

     /* ACQUIRE SETUP */
    0,                /* WORD AcquireMode;          0: Composite Sync; 1: Variable Scan            */
    0,                /* WORD InvertSync;           Bit 0: pixelclock invert;
                                                    Bit 1: line sync invert;
                                                    Bit 2: frame sync invert;                      */
    3,                /* WORD StartMode;            1: Odd; 2: Even; 3: Next                       */
    0,                /* WORD ChrominanceFilter;    0: AC coupled; 1: 50Hz; 2: 60Hz; 3: DC coupled */
    DEFAULT32 (1),    /* WORD Gain;                 0: 0.5; 1: 1; 2: 2; 4: 4;                      */
    DEFAULT32 (0),    /* WORD Offset;               in mV                                          */
    DEFAULT32 (0),    /* WORD LowReference;         in mV                                          */
    DEFAULT32 (1200), /* WORD HighReference;        in mV                                          */

    /* TIMING RAM SETUP */
    0,                /* WORD HTParameterMode;      horizontal parameter 0: in pixel 1: in ns;     */
    152L,             /* DWORD HTAquireStart;       acquire start position                         */
    768L,             /* DWORD HTAcquireWidth;      acquire width                                  */
    1,                /* WORD HTAcquireIncrement;   acquire increment                              */

    100L,             /* DWORD ClampStart;          clamp start position                           */
    5L,               /* DWORD ClampWidth;          clamp width 0: set to default 5                */
    130L,             /* DWORD ZeroStart;           zero start position                            */
    5L,               /* DWORD ZeroWidth;           zero width 0: set to default 5                 */
    300L,             /* DWORD FieldStart;          field gate start position 0: auto              */
    400L,             /* DWORD FieldWidth;          field gate width 0: auto                       */

    0,                /* WORD VTParameterMode;      vertical parameter 0: in lines 1: in us;       */
    19,               /* DWORD VTAquireStart;       acquire start position                         */
    288L,             /* DWORD VTAcquireWidth;      acquire width                                  */
    1,                /* WORD VTAcquireIncrement;   acquire increment                              */
    0,                /* WORD  GenerateVSync;       0 : no; 1 : yes                                */
    0L,               /* DWORD GenerateVSyncStart;  Startposition of vsync                         */
    0L,               /* DWORD GenerateVSyncWidth;  Width of Sync pulse                            */
    0,                /* WORD  GenerateVSyncPol;    Syncpolarity: 0 : Sync is low; 1: Sync is high */

    0L,               /* DWORD HTAcquireTotal;      time or pixel between two hsync's              */
    0,                /* WORD  PhysCamType;         bit0: digital, bit1: linescan                  */
    0,                /* char *Manufacturer;        name of the camera manufactor                  */
    0,                /* char *PropDlgDLL;          DLL filename with properties dialog            */
    0,                /* char *PropDlgFuncName;     DLL function name of property dialog           */
    {0,0,0}           /* CAMPROP_T PropData;        Property data, camera dependent                */                                 

   },

/* --------------------------  VM_DIG24 ------------------------------------------------------------ */

   {
     /* CAMERA DATA */
    "",               /* char Name[CT_NAME_LENGTH]; name of the camera                             */
    VM_DIG24,          /* WORD VideoMode;                                                           */
    1,                /* WORD Interlaced;           number of fields per frame                     */
    50,               /* WORD VerticalFreq;         Vertical scan frequency in Hz                  */
    15625,            /* WORD HorizontalFreq;       Horizontal scan frequency in Hz                */
    14750,            /* WORD ClockFreq;            Clock frequency in kHz                         */
    1,                /* WORD ClockMode;            0: internal; 1: external                       */

     /* ACQUIRE SETUP */
    0,                /* WORD AcquireMode;          0: Composite Sync; 1: Variable Scan            */
    0,                /* WORD InvertSync;           Bit 0: pixelclock invert;
                                                    Bit 1: line sync invert;
                                                    Bit 2: frame sync invert;                      */
    3,                /* WORD StartMode;            1: Odd; 2: Even; 3: Next                       */
    0,                /* WORD ChrominanceFilter;    0: AC coupled; 1: 50Hz; 2: 60Hz; 3: DC coupled */
    DEFAULT32 (1),    /* WORD Gain;                 0: 0.5; 1: 1; 2: 2; 4: 4;                      */
    DEFAULT32 (0),    /* WORD Offset;               in mV                                          */
    DEFAULT32 (0),    /* WORD LowReference;         in mV                                          */
    DEFAULT32 (1200), /* WORD HighReference;        in mV                                          */

    /* TIMING RAM SETUP */
    0,                /* WORD HTParameterMode;      horizontal parameter 0: in pixel 1: in ns;     */
    152L,             /* DWORD HTAquireStart;       acquire start position                         */
    768L,             /* DWORD HTAcquireWidth;      acquire width                                  */
    1,                /* WORD HTAcquireIncrement;   acquire increment                              */

    100L,             /* DWORD ClampStart;          clamp start position                           */
    5L,               /* DWORD ClampWidth;          clamp width 0: set to default 5                */
    130L,             /* DWORD ZeroStart;           zero start position                            */
    5L,               /* DWORD ZeroWidth;           zero width 0: set to default 5                 */
    300L,             /* DWORD FieldStart;          field gate start position 0: auto              */
    400L,             /* DWORD FieldWidth;          field gate width 0: auto                       */

    0,                /* WORD VTParameterMode;      vertical parameter 0: in lines 1: in us;       */
    19,               /* DWORD VTAquireStart;       acquire start position                         */
    288L,             /* DWORD VTAcquireWidth;      acquire width                                  */
    1,                /* WORD VTAcquireIncrement;   acquire increment                              */
    0,                /* WORD  GenerateVSync;       0 : no; 1 : yes                                */
    0L,               /* DWORD GenerateVSyncStart;  Startposition of vsync                         */
    0L,               /* DWORD GenerateVSyncWidth;  Width of Sync pulse                            */
    0,                /* WORD  GenerateVSyncPol;    Syncpolarity: 0 : Sync is low; 1: Sync is high */

    0L,               /* DWORD HTAcquireTotal;      time or pixel between two hsync's              */
    0,                /* WORD  PhysCamType;         bit0: digital, bit1: linescan                  */
    0,                /* char *Manufacturer;        name of the camera manufactor                  */
    0,                /* char *PropDlgDLL;          DLL filename with properties dialog            */
    0,                /* char *PropDlgFuncName;     DLL function name of property dialog           */
    {0,0,0}           /* CAMPROP_T PropData;        Property data, camera dependent                */                                 

   },

/* --------------------------  VM_DIG32 ------------------------------------------------------------ */

   {
     /* CAMERA DATA */
    "",               /* char Name[CT_NAME_LENGTH]; name of the camera                             */
    VM_DIG32,          /* WORD VideoMode;                                                           */
    1,                /* WORD Interlaced;           number of fields per frame                     */
    50,               /* WORD VerticalFreq;         Vertical scan frequency in Hz                  */
    15625,            /* WORD HorizontalFreq;       Horizontal scan frequency in Hz                */
    14750,            /* WORD ClockFreq;            Clock frequency in kHz                         */
    1,                /* WORD ClockMode;            0: internal; 1: external                       */

     /* ACQUIRE SETUP */
    0,                /* WORD AcquireMode;          0: Composite Sync; 1: Variable Scan            */
    0,                /* WORD InvertSync;           Bit 0: pixelclock invert;
                                                    Bit 1: line sync invert;
                                                    Bit 2: frame sync invert;                      */
    3,                /* WORD StartMode;            1: Odd; 2: Even; 3: Next                       */
    0,                /* WORD ChrominanceFilter;    0: AC coupled; 1: 50Hz; 2: 60Hz; 3: DC coupled */
    DEFAULT32 (1),    /* WORD Gain;                 0: 0.5; 1: 1; 2: 2; 4: 4;                      */
    DEFAULT32 (0),    /* WORD Offset;               in mV                                          */
    DEFAULT32 (0),    /* WORD LowReference;         in mV                                          */
    DEFAULT32 (1200), /* WORD HighReference;        in mV                                          */

    /* TIMING RAM SETUP */
    0,                /* WORD HTParameterMode;      horizontal parameter 0: in pixel 1: in ns;     */
    152L,             /* DWORD HTAquireStart;       acquire start position                         */
    768L,             /* DWORD HTAcquireWidth;      acquire width                                  */
    1,                /* WORD HTAcquireIncrement;   acquire increment                              */

    100L,             /* DWORD ClampStart;          clamp start position                           */
    5L,               /* DWORD ClampWidth;          clamp width 0: set to default 5                */
    130L,             /* DWORD ZeroStart;           zero start position                            */
    5L,               /* DWORD ZeroWidth;           zero width 0: set to default 5                 */
    300L,             /* DWORD FieldStart;          field gate start position 0: auto              */
    400L,             /* DWORD FieldWidth;          field gate width 0: auto                       */

    0,                /* WORD VTParameterMode;      vertical parameter 0: in lines 1: in us;       */
    19,               /* DWORD VTAquireStart;       acquire start position                         */
    288L,             /* DWORD VTAcquireWidth;      acquire width                                  */
    1,                /* WORD VTAcquireIncrement;   acquire increment                              */
    0,                /* WORD  GenerateVSync;       0 : no; 1 : yes                                */
    0L,               /* DWORD GenerateVSyncStart;  Startposition of vsync                         */
    0L,               /* DWORD GenerateVSyncWidth;  Width of Sync pulse                            */
    0,                /* WORD  GenerateVSyncPol;    Syncpolarity: 0 : Sync is low; 1: Sync is high */

    0L,               /* DWORD HTAcquireTotal;      time or pixel between two hsync's              */
    0,                /* WORD  PhysCamType;         bit0: digital, bit1: linescan                  */
    0,                /* char *Manufacturer;        name of the camera manufactor                  */
    0,                /* char *PropDlgDLL;          DLL filename with properties dialog            */
    0,                /* char *PropDlgFuncName;     DLL function name of property dialog           */
    {0,0,0}           /* CAMPROP_T PropData;        Property data, camera dependent                */                                 

   },

/* --------------------------  VM_TVES ------------------------------------------------------------ */

   {
     /* CAMERA DATA */
    "",               /* char Name[CT_NAME_LENGTH]; name of the camera                             */
    VM_TVES,          /* WORD VideoMode;                                                           */
    1,                /* WORD Interlaced;           number of fields per frame                     */
    50,               /* WORD VerticalFreq;         Vertical scan frequency in Hz                  */
    15625,            /* WORD HorizontalFreq;       Horizontal scan frequency in Hz                */
    14750,            /* WORD ClockFreq;            Clock frequency in kHz                         */
    0,                /* WORD ClockMode;            0: internal; 1: external                       */

     /* ACQUIRE SETUP */
    0,                /* WORD AcquireMode;          0: Composite Sync; 1: Variable Scan            */
    0,                /* WORD InvertSync;           Bit 0: pixelclock invert;
                                                    Bit 1: line sync invert;
                                                    Bit 2: frame sync invert;                      */
    3,                /* WORD StartMode;            1: Odd; 2: Even; 3: Next                       */
    0,                /* WORD ChrominanceFilter;    0: AC coupled; 1: 50Hz; 2: 60Hz; 3: DC coupled */
    DEFAULT32 (1),    /* WORD Gain;                 0: 0.5; 1: 1; 2: 2; 4: 4;                      */
    DEFAULT32 (0),    /* WORD Offset;               in mV                                          */
    DEFAULT32 (0),    /* WORD LowReference;         in mV                                          */
    DEFAULT32 (1200), /* WORD HighReference;        in mV                                          */

    /* TIMING RAM SETUP */
    0,                /* WORD HTParameterMode;      horizontal parameter 0: in pixel 1: in ns;     */
    152L,             /* DWORD HTAquireStart;       acquire start position                         */
    768L,             /* DWORD HTAcquireWidth;      acquire width                                  */
    1,                /* WORD HTAcquireIncrement;   acquire increment                              */

    100L,             /* DWORD ClampStart;          clamp start position                           */
    5L,               /* DWORD ClampWidth;          clamp width 0: set to default 5                */
    130L,             /* DWORD ZeroStart;           zero start position                            */
    5L,               /* DWORD ZeroWidth;           zero width 0: set to default 5                 */
    300L,             /* DWORD FieldStart;          field gate start position 0: auto              */
    400L,             /* DWORD FieldWidth;          field gate width 0: auto                       */

    0,                /* WORD VTParameterMode;      vertical parameter 0: in lines 1: in us;       */
    19,               /* DWORD VTAquireStart;       acquire start position                         */
    288L,             /* DWORD VTAcquireWidth;      acquire width                                  */
    1,                /* WORD VTAcquireIncrement;   acquire increment                              */
    0,                /* WORD  GenerateVSync;       0 : no; 1 : yes                                */
    0L,               /* DWORD GenerateVSyncStart;  Startposition of vsync                         */
    0L,               /* DWORD GenerateVSyncWidth;  Width of Sync pulse                            */
    0,                /* WORD  GenerateVSyncPol;    Syncpolarity: 0 : Sync is low; 1: Sync is high */

    0L,               /* DWORD HTAcquireTotal;      time or pixel between two hsync's              */
    0,                /* WORD  PhysCamType;         bit0: digital, bit1: linescan                  */
    0,                /* char *Manufacturer;        name of the camera manufactor                  */
    0,                /* char *PropDlgDLL;          DLL filename with properties dialog            */
    0,                /* char *PropDlgFuncName;     DLL function name of property dialog           */
    {0,0,0}           /* CAMPROP_T PropData;        Property data, camera dependent                */                                 

   },


/* --------------------------  VM_NTSC_SVHS ------------------------------------------------------------ */

   {
    /* CAMERA DATA */
    "",               /* char Name[CT_NAME_LENGTH]; name of the camera                             */
    VM_NTSC_SVHS,     /* WORD VideoMode;                                                           */
    1,                /* WORD Interlaced;           number of fields per frame                     */
    60,               /* WORD VerticalFreq;         Vertical scan frequency in Hz                  */
    15734,            /* WORD HorizontalFreq;       Horizontal scan frequency in Hz                */
    13500,            /* WORD ClockFreq;            Clock frequency in kHz                         */
    0,                /* WORD ClockMode;            0: internal; 1: external                       */

    /* ACQUIRE SETUP */
    0,                /* WORD AcquireMode;          0: Composite Sync; 1: Variable Scan            */
    0,                /* WORD InvertSync;           Bit 0: pixelclock invert;
                                                    Bit 1: line sync invert;
                                                    Bit 2: frame sync invert;                      */
    3,                /* WORD StartMode;            1: Odd; 2: Even; 3: Next                       */
    0,                /* WORD ChrominanceFilter;    0: AC coupled; 1: 50Hz; 2: 60Hz; 3: DC coupled */
    DEFAULT32 (1),    /* WORD Gain;                 0: 0.5; 1: 1; 2: 2; 4: 4;                      */
    DEFAULT32 (0),    /* WORD Offset;               in mV                                          */
    DEFAULT32 (0),    /* WORD LowReference;         in mV                                          */
    DEFAULT32 (1200), /* WORD HighReference;        in mV                                          */

    /* TIMING RAM SETUP */
    0,                /* WORD HTParameterMode;      horizontal parameter 0: in pixel 1: in ns;     */
    134L,           /* DWORD HTAquireStart;       acquire start position                         */
    720L,           /* DWORD HTAcquireWidth;      acquire width                                  */
    1,                /* WORD HTAcquireIncrement;   acquire increment                              */

    92L,            /* DWORD ClampStart;          clamp start position                           */
    5L,             /* DWORD ClampWidth;          clamp width 0: set to default 5                */
    92L,            /* DWORD ZeroStart;           zero start position                            */
    5L,             /* DWORD ZeroWidth;           zero width 0: set to default 5                 */
    288L,           /* DWORD FieldStart;          field gate start position 0: auto              */
    370L,           /* DWORD FieldWidth;          field gate width 0: auto                       */

    0,                /* WORD VTParameterMode;      vertical parameter 0: in lines 1: in us;       */
    14L,               /* DWORD VTAquireStart;       acquire start position                         */
    240L,             /* DWORD VTAcquireWidth;      acquire width                                  */
    1,                /* WORD VTAcquireIncrement;   acquire increment                              */
    0,                /* WORD  GenerateVSync;       0 : no; 1 : yes                                */
    0L,               /* DWORD GenerateVSyncStart;  Startposition of vsync                         */
    0L,               /* DWORD GenerateVSyncWidth;  Width of Sync pulse                            */
    0,                /* WORD  GenerateVSyncPol;    Syncpolarity: 0 : Sync is low; 1: Sync is high */

    0L,               /* DWORD HTAcquireTotal;      time or pixel between two hsync's              */
    0,                /* WORD  PhysCamType;         bit0: digital, bit1: linescan                  */
    0,                /* char *Manufacturer;        name of the camera manufactor                  */
    0,                /* char *PropDlgDLL;          DLL filename with properties dialog            */
    0,                /* char *PropDlgFuncName;     DLL function name of property dialog           */
    {0,0,0}           /* CAMPROP_T PropData;        Property data, camera dependent                */                                 
   },

/* --------------------------  VM_SECAM_SVHS ------------------------------------------------------------ */

   {
     /* CAMERA DATA */
    "",               /* char Name[CT_NAME_LENGTH]; name of the camera                             */
    VM_SECAM_SVHS,    /* WORD VideoMode;                                                           */
    1,                /* WORD Interlaced;           number of fields per frame                     */
    50,               /* WORD VerticalFreq;         Vertical scan frequency in Hz                  */
    15625,            /* WORD HorizontalFreq;       Horizontal scan frequency in Hz                */
    14750,            /* WORD ClockFreq;            Clock frequency in kHz                         */
    0,                /* WORD ClockMode;            0: internal; 1: external                       */

     /* ACQUIRE SETUP */
    0,                /* WORD AcquireMode;          0: Composite Sync; 1: Variable Scan            */
    0,                /* WORD InvertSync;           Bit 0: pixelclock invert;
                                                    Bit 1: line sync invert;
                                                    Bit 2: frame sync invert;                      */
    3,                /* WORD StartMode;            1: Odd; 2: Even; 3: Next                       */
    0,                /* WORD ChrominanceFilter;    0: AC coupled; 1: 50Hz; 2: 60Hz; 3: DC coupled */
    DEFAULT32 (1),    /* WORD Gain;                 0: 0.5; 1: 1; 2: 2; 4: 4;                      */
    DEFAULT32 (0),    /* WORD Offset;               in mV                                          */
    DEFAULT32 (0),    /* WORD LowReference;         in mV                                          */
    DEFAULT32 (1200), /* WORD HighReference;        in mV                                          */

    /* TIMING RAM SETUP */
    0,                /* WORD HTParameterMode;      horizontal parameter 0: in pixel 1: in ns;     */
    152L,             /* DWORD HTAquireStart;       acquire start position                         */
    768L,             /* DWORD HTAcquireWidth;      acquire width                                  */
    1,                /* WORD HTAcquireIncrement;   acquire increment                              */

    100L,             /* DWORD ClampStart;          clamp start position                           */
    5L,               /* DWORD ClampWidth;          clamp width 0: set to default 5                */
    130L,             /* DWORD ZeroStart;           zero start position                            */
    5L,               /* DWORD ZeroWidth;           zero width 0: set to default 5                 */
    300L,             /* DWORD FieldStart;          field gate start position 0: auto              */
    400L,             /* DWORD FieldWidth;          field gate width 0: auto                       */

    0,                /* WORD VTParameterMode;      vertical parameter 0: in lines 1: in us;       */
    19,               /* DWORD VTAquireStart;       acquire start position                         */
    288L,             /* DWORD VTAcquireWidth;      acquire width                                  */
    1,                /* WORD VTAcquireIncrement;   acquire increment                              */

    0,                /* WORD  GenerateVSync;       0 : no; 1 : yes                                */
    0L,               /* DWORD GenerateVSyncStart;  Startposition of vsync                         */
    0L,               /* DWORD GenerateVSyncWidth;  Width of Sync pulse                            */
    0,                /* WORD  GenerateVSyncPol;    Syncpolarity: 0 : Sync is low; 1: Sync is high */

    0L,               /* DWORD HTAcquireTotal;      time or pixel between two hsync's              */
    0,                /* WORD  PhysCamType;         bit0: digital, bit1: linescan                  */
    0,                /* char *Manufacturer;        name of the camera manufactor                  */
    0,                /* char *PropDlgDLL;          DLL filename with properties dialog            */
    0,                /* char *PropDlgFuncName;     DLL function name of property dialog           */
    {0,0,0}           /* CAMPROP_T PropData;        Property data, camera dependent                */                                 

   },


/* --------------------------  VM_DIG2X8 ------------------------------------------------------------ */

   {
     /* CAMERA DATA */
    "",               /* char Name[CT_NAME_LENGTH]; name of the camera                             */
    VM_DIG2X8,        /* WORD VideoMode;                                                           */
    0,                /* WORD Interlaced;           number of fields per frame                     */
    50,               /* WORD VerticalFreq;         Vertical scan frequency in Hz                  */
    15625,            /* WORD HorizontalFreq;       Horizontal scan frequency in Hz                */
    14750,            /* WORD ClockFreq;            Clock frequency in kHz                         */
    1,                /* WORD ClockMode;            0: internal; 1: external                       */

     /* ACQUIRE SETUP */
    1,                /* WORD AcquireMode;          0: Composite Sync; 1: Variable Scan            */
    0,                /* WORD InvertSync;           Bit 0: pixelclock invert;
                                                    Bit 1: line sync invert;
                                                    Bit 2: frame sync invert;                      */
    3,                /* WORD StartMode;            1: Odd; 2: Even; 3: Next                       */
    0,                /* WORD ChrominanceFilter;    0: AC coupled; 1: 50Hz; 2: 60Hz; 3: DC coupled */
    DEFAULT32 (1),    /* WORD Gain;                 0: 0.5; 1: 1; 2: 2; 4: 4;                      */
    DEFAULT32 (0),    /* WORD Offset;               in mV                                          */
    DEFAULT32 (0),    /* WORD LowReference;         in mV                                          */
    DEFAULT32 (1200), /* WORD HighReference;        in mV                                          */

    /* TIMING RAM SETUP */
    0,                /* WORD HTParameterMode;      horizontal parameter 0: in pixel 1: in ns;     */
    0L,               /* DWORD HTAquireStart;       acquire start position                         */
    768L,             /* DWORD HTAcquireWidth;      acquire width                                  */
    1,                /* WORD HTAcquireIncrement;   acquire increment                              */

    0L,             /* DWORD ClampStart;          clamp start position                           */
    0L,               /* DWORD ClampWidth;          clamp width 0: set to default 5                */
    0L,             /* DWORD ZeroStart;           zero start position                            */
    0L,               /* DWORD ZeroWidth;           zero width 0: set to default 5                 */
    0L,             /* DWORD FieldStart;          field gate start position 0: auto              */
    0L,             /* DWORD FieldWidth;          field gate width 0: auto                       */

    0,                /* WORD VTParameterMode;      vertical parameter 0: in lines 1: in us;       */
    1,                /* DWORD VTAquireStart;       acquire start position                         */
    576L,             /* DWORD VTAcquireWidth;      acquire width                                  */
    1,                /* WORD VTAcquireIncrement;   acquire increment                              */

    0,                /* WORD  GenerateVSync;       0 : no; 1 : yes                                */
    0L,               /* DWORD GenerateVSyncStart;  Startposition of vsync                         */
    0L,               /* DWORD GenerateVSyncWidth;  Width of Sync pulse                            */
    0,                /* WORD  GenerateVSyncPol;    Syncpolarity: 0 : Sync is low; 1: Sync is high */

    0L,               /* DWORD HTAcquireTotal;      time or pixel between two hsync's              */
    0,                /* WORD  PhysCamType;         bit0: digital, bit1: linescan                  */
    0,                /* char *Manufacturer;        name of the camera manufactor                  */
    0,                /* char *PropDlgDLL;          DLL filename with properties dialog            */
    0,                /* char *PropDlgFuncName;     DLL function name of property dialog           */
    {0,0,0}           /* CAMPROP_T PropData;        Property data, camera dependent                */                                 

   },

/* --------------------------  VM_DIG2X10 ------------------------------------------------------------ */

   {
     /* CAMERA DATA */
    "",               /* char Name[CT_NAME_LENGTH]; name of the camera                             */
    VM_DIG2X10,        /* WORD VideoMode;                                                           */
    0,                /* WORD Interlaced;           number of fields per frame                     */
    50,               /* WORD VerticalFreq;         Vertical scan frequency in Hz                  */
    15625,            /* WORD HorizontalFreq;       Horizontal scan frequency in Hz                */
    14750,            /* WORD ClockFreq;            Clock frequency in kHz                         */
    1,                /* WORD ClockMode;            0: internal; 1: external                       */

     /* ACQUIRE SETUP */
    1,                /* WORD AcquireMode;          0: Composite Sync; 1: Variable Scan            */
    0,                /* WORD InvertSync;           Bit 0: pixelclock invert;
                                                    Bit 1: line sync invert;
                                                    Bit 2: frame sync invert;                      */
    3,                /* WORD StartMode;            1: Odd; 2: Even; 3: Next                       */
    0,                /* WORD ChrominanceFilter;    0: AC coupled; 1: 50Hz; 2: 60Hz; 3: DC coupled */
    DEFAULT32 (1),    /* WORD Gain;                 0: 0.5; 1: 1; 2: 2; 4: 4;                      */
    DEFAULT32 (0),    /* WORD Offset;               in mV                                          */
    DEFAULT32 (0),    /* WORD LowReference;         in mV                                          */
    DEFAULT32 (1200), /* WORD HighReference;        in mV                                          */

    /* TIMING RAM SETUP */
    0,                /* WORD HTParameterMode;      horizontal parameter 0: in pixel 1: in ns;     */
    0L,               /* DWORD HTAquireStart;       acquire start position                         */
    768L,             /* DWORD HTAcquireWidth;      acquire width                                  */
    1,                /* WORD HTAcquireIncrement;   acquire increment                              */

    0L,             /* DWORD ClampStart;          clamp start position                           */
    0L,               /* DWORD ClampWidth;          clamp width 0: set to default 5                */
    0L,             /* DWORD ZeroStart;           zero start position                            */
    0L,               /* DWORD ZeroWidth;           zero width 0: set to default 5                 */
    0L,             /* DWORD FieldStart;          field gate start position 0: auto              */
    0L,             /* DWORD FieldWidth;          field gate width 0: auto                       */

    0,                /* WORD VTParameterMode;      vertical parameter 0: in lines 1: in us;       */
    1,                /* DWORD VTAquireStart;       acquire start position                         */
    576L,             /* DWORD VTAcquireWidth;      acquire width                                  */
    1,                /* WORD VTAcquireIncrement;   acquire increment                              */

    0,                /* WORD  GenerateVSync;       0 : no; 1 : yes                                */
    0L,               /* DWORD GenerateVSyncStart;  Startposition of vsync                         */
    0L,               /* DWORD GenerateVSyncWidth;  Width of Sync pulse                            */
    0,                /* WORD  GenerateVSyncPol;    Syncpolarity: 0 : Sync is low; 1: Sync is high */

    0L,               /* DWORD HTAcquireTotal;      time or pixel between two hsync's              */
    0,                /* WORD  PhysCamType;         bit0: digital, bit1: linescan                  */
    0,                /* char *Manufacturer;        name of the camera manufactor                  */
    0,                /* char *PropDlgDLL;          DLL filename with properties dialog            */
    0,                /* char *PropDlgFuncName;     DLL function name of property dialog           */
    {0,0,0}           /* CAMPROP_T PropData;        Property data, camera dependent                */                                 

   },

/* --------------------------  VM_DIG2X12 ------------------------------------------------------------ */

   {
     /* CAMERA DATA */
    "",               /* char Name[CT_NAME_LENGTH]; name of the camera                             */
    VM_DIG2X12,        /* WORD VideoMode;                                                           */
    0,                /* WORD Interlaced;           number of fields per frame                     */
    50,               /* WORD VerticalFreq;         Vertical scan frequency in Hz                  */
    15625,            /* WORD HorizontalFreq;       Horizontal scan frequency in Hz                */
    14750,            /* WORD ClockFreq;            Clock frequency in kHz                         */
    1,                /* WORD ClockMode;            0: internal; 1: external                       */

     /* ACQUIRE SETUP */
    1,                /* WORD AcquireMode;          0: Composite Sync; 1: Variable Scan            */
    0,                /* WORD InvertSync;           Bit 0: pixelclock invert;
                                                    Bit 1: line sync invert;
                                                    Bit 2: frame sync invert;                      */
    3,                /* WORD StartMode;            1: Odd; 2: Even; 3: Next                       */
    0,                /* WORD ChrominanceFilter;    0: AC coupled; 1: 50Hz; 2: 60Hz; 3: DC coupled */
    DEFAULT32 (1),    /* WORD Gain;                 0: 0.5; 1: 1; 2: 2; 4: 4;                      */
    DEFAULT32 (0),    /* WORD Offset;               in mV                                          */
    DEFAULT32 (0),    /* WORD LowReference;         in mV                                          */
    DEFAULT32 (1200), /* WORD HighReference;        in mV                                          */

    /* TIMING RAM SETUP */
    0,                /* WORD HTParameterMode;      horizontal parameter 0: in pixel 1: in ns;     */
    0L,               /* DWORD HTAquireStart;       acquire start position                         */
    768L,             /* DWORD HTAcquireWidth;      acquire width                                  */
    1,                /* WORD HTAcquireIncrement;   acquire increment                              */

    0L,             /* DWORD ClampStart;          clamp start position                           */
    0L,               /* DWORD ClampWidth;          clamp width 0: set to default 5                */
    0L,             /* DWORD ZeroStart;           zero start position                            */
    0L,               /* DWORD ZeroWidth;           zero width 0: set to default 5                 */
    0L,             /* DWORD FieldStart;          field gate start position 0: auto              */
    0L,             /* DWORD FieldWidth;          field gate width 0: auto                       */

    0,                /* WORD VTParameterMode;      vertical parameter 0: in lines 1: in us;       */
    1,                /* DWORD VTAquireStart;       acquire start position                         */
    576L,             /* DWORD VTAcquireWidth;      acquire width                                  */
    1,                /* WORD VTAcquireIncrement;   acquire increment                              */

    0,                /* WORD  GenerateVSync;       0 : no; 1 : yes                                */
    0L,               /* DWORD GenerateVSyncStart;  Startposition of vsync                         */
    0L,               /* DWORD GenerateVSyncWidth;  Width of Sync pulse                            */
    0,                /* WORD  GenerateVSyncPol;    Syncpolarity: 0 : Sync is low; 1: Sync is high */

    0L,               /* DWORD HTAcquireTotal;      time or pixel between two hsync's              */
    0,                /* WORD  PhysCamType;         bit0: digital, bit1: linescan                  */
    0,                /* char *Manufacturer;        name of the camera manufactor                  */
    0,                /* char *PropDlgDLL;          DLL filename with properties dialog            */
    0,                /* char *PropDlgFuncName;     DLL function name of property dialog           */
    {0,0,0}           /* CAMPROP_T PropData;        Property data, camera dependent                */                                 

   },

/* --------------------------  VM_DIG2X14 ------------------------------------------------------------ */

   {
     /* CAMERA DATA */
    "",               /* char Name[CT_NAME_LENGTH]; name of the camera                             */
    VM_DIG2X14,        /* WORD VideoMode;                                                           */
    0,                /* WORD Interlaced;           number of fields per frame                     */
    50,               /* WORD VerticalFreq;         Vertical scan frequency in Hz                  */
    15625,            /* WORD HorizontalFreq;       Horizontal scan frequency in Hz                */
    14750,            /* WORD ClockFreq;            Clock frequency in kHz                         */
    1,                /* WORD ClockMode;            0: internal; 1: external                       */

     /* ACQUIRE SETUP */
    1,                /* WORD AcquireMode;          0: Composite Sync; 1: Variable Scan            */
    0,                /* WORD InvertSync;           Bit 0: pixelclock invert;
                                                    Bit 1: line sync invert;
                                                    Bit 2: frame sync invert;                      */
    3,                /* WORD StartMode;            1: Odd; 2: Even; 3: Next                       */
    0,                /* WORD ChrominanceFilter;    0: AC coupled; 1: 50Hz; 2: 60Hz; 3: DC coupled */
    DEFAULT32 (1),    /* WORD Gain;                 0: 0.5; 1: 1; 2: 2; 4: 4;                      */
    DEFAULT32 (0),    /* WORD Offset;               in mV                                          */
    DEFAULT32 (0),    /* WORD LowReference;         in mV                                          */
    DEFAULT32 (1200), /* WORD HighReference;        in mV                                          */

    /* TIMING RAM SETUP */
    0,                /* WORD HTParameterMode;      horizontal parameter 0: in pixel 1: in ns;     */
    0L,               /* DWORD HTAquireStart;       acquire start position                         */
    768L,             /* DWORD HTAcquireWidth;      acquire width                                  */
    1,                /* WORD HTAcquireIncrement;   acquire increment                              */

    0L,             /* DWORD ClampStart;          clamp start position                           */
    0L,               /* DWORD ClampWidth;          clamp width 0: set to default 5                */
    0L,             /* DWORD ZeroStart;           zero start position                            */
    0L,               /* DWORD ZeroWidth;           zero width 0: set to default 5                 */
    0L,             /* DWORD FieldStart;          field gate start position 0: auto              */
    0L,             /* DWORD FieldWidth;          field gate width 0: auto                       */

    0,                /* WORD VTParameterMode;      vertical parameter 0: in lines 1: in us;       */
    1,                /* DWORD VTAquireStart;       acquire start position                         */
    576L,             /* DWORD VTAcquireWidth;      acquire width                                  */
    1,                /* WORD VTAcquireIncrement;   acquire increment                              */

    0,                /* WORD  GenerateVSync;       0 : no; 1 : yes                                */
    0L,               /* DWORD GenerateVSyncStart;  Startposition of vsync                         */
    0L,               /* DWORD GenerateVSyncWidth;  Width of Sync pulse                            */
    0,                /* WORD  GenerateVSyncPol;    Syncpolarity: 0 : Sync is low; 1: Sync is high */

    0L,               /* DWORD HTAcquireTotal;      time or pixel between two hsync's              */
    0,                /* WORD  PhysCamType;         bit0: digital, bit1: linescan                  */
    0,                /* char *Manufacturer;        name of the camera manufactor                  */
    0,                /* char *PropDlgDLL;          DLL filename with properties dialog            */
    0,                /* char *PropDlgFuncName;     DLL function name of property dialog           */
    {0,0,0}           /* CAMPROP_T PropData;        Property data, camera dependent                */                                 

   },

/* --------------------------  VM_DIG2X16 ------------------------------------------------------------ */

   {
     /* CAMERA DATA */
    "",               /* char Name[CT_NAME_LENGTH]; name of the camera                             */
    VM_DIG2X16,        /* WORD VideoMode;                                                           */
    0,                /* WORD Interlaced;           number of fields per frame                     */
    50,               /* WORD VerticalFreq;         Vertical scan frequency in Hz                  */
    15625,            /* WORD HorizontalFreq;       Horizontal scan frequency in Hz                */
    14750,            /* WORD ClockFreq;            Clock frequency in kHz                         */
    1,                /* WORD ClockMode;            0: internal; 1: external                       */

     /* ACQUIRE SETUP */
    1,                /* WORD AcquireMode;          0: Composite Sync; 1: Variable Scan            */
    0,                /* WORD InvertSync;           Bit 0: pixelclock invert;
                                                    Bit 1: line sync invert;
                                                    Bit 2: frame sync invert;                      */
    3,                /* WORD StartMode;            1: Odd; 2: Even; 3: Next                       */
    0,                /* WORD ChrominanceFilter;    0: AC coupled; 1: 50Hz; 2: 60Hz; 3: DC coupled */
    DEFAULT32 (1),    /* WORD Gain;                 0: 0.5; 1: 1; 2: 2; 4: 4;                      */
    DEFAULT32 (0),    /* WORD Offset;               in mV                                          */
    DEFAULT32 (0),    /* WORD LowReference;         in mV                                          */
    DEFAULT32 (1200), /* WORD HighReference;        in mV                                          */

    /* TIMING RAM SETUP */
    0,                /* WORD HTParameterMode;      horizontal parameter 0: in pixel 1: in ns;     */
    0L,               /* DWORD HTAquireStart;       acquire start position                         */
    768L,             /* DWORD HTAcquireWidth;      acquire width                                  */
    1,                /* WORD HTAcquireIncrement;   acquire increment                              */

    0L,             /* DWORD ClampStart;          clamp start position                           */
    0L,               /* DWORD ClampWidth;          clamp width 0: set to default 5                */
    0L,             /* DWORD ZeroStart;           zero start position                            */
    0L,               /* DWORD ZeroWidth;           zero width 0: set to default 5                 */
    0L,             /* DWORD FieldStart;          field gate start position 0: auto              */
    0L,             /* DWORD FieldWidth;          field gate width 0: auto                       */

    0,                /* WORD VTParameterMode;      vertical parameter 0: in lines 1: in us;       */
    1,                /* DWORD VTAquireStart;       acquire start position                         */
    576L,             /* DWORD VTAcquireWidth;      acquire width                                  */
    1,                /* WORD VTAcquireIncrement;   acquire increment                              */

    0,                /* WORD  GenerateVSync;       0 : no; 1 : yes                                */
    0L,               /* DWORD GenerateVSyncStart;  Startposition of vsync                         */
    0L,               /* DWORD GenerateVSyncWidth;  Width of Sync pulse                            */
    0,                /* WORD  GenerateVSyncPol;    Syncpolarity: 0 : Sync is low; 1: Sync is high */

    0L,               /* DWORD HTAcquireTotal;      time or pixel between two hsync's              */
    0,                /* WORD  PhysCamType;         bit0: digital, bit1: linescan                  */
    0,                /* char *Manufacturer;        name of the camera manufactor                  */
    0,                /* char *PropDlgDLL;          DLL filename with properties dialog            */
    0,                /* char *PropDlgFuncName;     DLL function name of property dialog           */
    {0,0,0}           /* CAMPROP_T PropData;        Property data, camera dependent                */                                 

   },

/* --------------------------  VM_DIG14 ------------------------------------------------------------ */

   {
     /* CAMERA DATA */
    "",               /* char Name[CT_NAME_LENGTH]; name of the camera                             */
    VM_DIG14,          /* WORD VideoMode;                                                           */
    1,                /* WORD Interlaced;           number of fields per frame                     */
    50,               /* WORD VerticalFreq;         Vertical scan frequency in Hz                  */
    15625,            /* WORD HorizontalFreq;       Horizontal scan frequency in Hz                */
    14750,            /* WORD ClockFreq;            Clock frequency in kHz                         */
    1,                /* WORD ClockMode;            0: internal; 1: external                       */

     /* ACQUIRE SETUP */
    0,                /* WORD AcquireMode;          0: Composite Sync; 1: Variable Scan            */
    0,                /* WORD InvertSync;           Bit 0: pixelclock invert;
                                                    Bit 1: line sync invert;
                                                    Bit 2: frame sync invert;                      */
    3,                /* WORD StartMode;            1: Odd; 2: Even; 3: Next                       */
    0,                /* WORD ChrominanceFilter;    0: AC coupled; 1: 50Hz; 2: 60Hz; 3: DC coupled */
    DEFAULT32 (1),    /* WORD Gain;                 0: 0.5; 1: 1; 2: 2; 4: 4;                      */
    DEFAULT32 (0),    /* WORD Offset;               in mV                                          */
    DEFAULT32 (0),    /* WORD LowReference;         in mV                                          */
    DEFAULT32 (1200), /* WORD HighReference;        in mV                                          */

    /* TIMING RAM SETUP */
    0,                /* WORD HTParameterMode;      horizontal parameter 0: in pixel 1: in ns;     */
    152L,             /* DWORD HTAquireStart;       acquire start position                         */
    768L,             /* DWORD HTAcquireWidth;      acquire width                                  */
    1,                /* WORD HTAcquireIncrement;   acquire increment                              */

    100L,             /* DWORD ClampStart;          clamp start position                           */
    5L,               /* DWORD ClampWidth;          clamp width 0: set to default 5                */
    130L,             /* DWORD ZeroStart;           zero start position                            */
    5L,               /* DWORD ZeroWidth;           zero width 0: set to default 5                 */
    300L,             /* DWORD FieldStart;          field gate start position 0: auto              */
    400L,             /* DWORD FieldWidth;          field gate width 0: auto                       */

    0,                /* WORD VTParameterMode;      vertical parameter 0: in lines 1: in us;       */
    19,               /* DWORD VTAquireStart;       acquire start position                         */
    288L,             /* DWORD VTAcquireWidth;      acquire width                                  */
    1,                /* WORD VTAcquireIncrement;   acquire increment                              */
    0,                /* WORD  GenerateVSync;       0 : no; 1 : yes                                */
    0L,               /* DWORD GenerateVSyncStart;  Startposition of vsync                         */
    0L,               /* DWORD GenerateVSyncWidth;  Width of Sync pulse                            */
    0,                /* WORD  GenerateVSyncPol;    Syncpolarity: 0 : Sync is low; 1: Sync is high */

    0L,               /* DWORD HTAcquireTotal;      time or pixel between two hsync's              */
    0,                /* WORD  PhysCamType;         bit0: digital, bit1: linescan                  */
    0,                /* char *Manufacturer;        name of the camera manufactor                  */
    0,                /* char *PropDlgDLL;          DLL filename with properties dialog            */
    0,                /* char *PropDlgFuncName;     DLL function name of property dialog           */
    {0,0,0}           /* CAMPROP_T PropData;        Property data, camera dependent                */                                 

   },

};
