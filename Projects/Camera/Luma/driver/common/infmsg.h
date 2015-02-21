#ifndef __INFMSG_H__
#define __INFMSG_H__

#include "common/trace.h"

#define DEBUGLEVEL(dl) trace_DebugLevel dl

#ifdef PCP

#ifdef _DEBUG
#define _INFMSG 1
#else 
#define _INFMSG 0
#endif

#else

#define _INFMSG _DEBUG 

#endif

#define LOGMSG(p)  trace_msg p
// INFMDMSG; The debuglevel from the inifile control the INFMSG.
#define INFDMSG(p) trace_debuglevel_msg p 
#define INFMDMSG(p) trace_module_debuglevel_msg p 

#if _INFMSG==0
#define INFMSG(p)   (void)0
#define INFMMSG(p)   (void)0
#else
#define INFMSG(p)  trace_msg p
#define INFMMSG(p)  trace_module_msg p
#endif




#ifdef _SHOW_SRCLINE
#define SRCLINE()  trace_msg("File: %s Line: %d\n",__FILE__,__LINE__)
#else
#define SRCLINE()   (void)0
#endif
  /*


#define log_msg(parlist)\
{\
    CpyArglist##parlist;\
    BuildLogOutString (pdrv->pLog, NULL, (char*)ArgList[0], (va_list)&ArgList[1]);\
}
                
#define inf_msg(parlist)\
{\
    CpyArglist##parlist;\
    BuildLogOutString (pdrv->pLog, NULL, (char*)ArgList[0], (va_list)&ArgList[1]);\
}

#define inf_mmsg(parlist)\
{\
    CpyArglist##parlist;\
    BuildLogOutString (pdrv->pLog, (char*)arglst[0], (char*)ArgList[1], (va_list)&ArgList[2]);\
}

#define inf_mdmsg(parlist)\
{\
    int messagelevel;\
    CpyArglist##parlist;\
    messagelevel = ArgList[1];\
    if (messagelevel <= pdrv->pLog->DebugLevel)\
        BuildLogOutString (pdrv->pLog, NULL, (char*)arglst[0], (char*)ArgList[2], (va_list)&ArgList[3]);\
}

//    modname = (char*)arglst[0];
//    msglevel = arglst[1];
//    format = (char*)arglst[2];
//    arg = (va_list)&arglst[3];

*/

#endif //-__INFMSG_H__
