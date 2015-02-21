#ifndef _trace_h_
#define _trace_h_
//extern int trace_printf  (const char *format, ...);


#ifdef  __cplusplus
extern "C" {
#endif

extern void  trace_DebugLevel  (int level);
extern void  trace_openprot    (char* filename);
extern void  trace_closeprot   (void);
extern void  __cdecl trace_msg         (char * format, ... );
extern void  __cdecl trace_module_msg  (char* module, char* format, ...);
extern void  __cdecl trace_debuglevel_msg        (int msglevel, char* format, ...);
extern void  __cdecl trace_module_debuglevel_msg (int msglevel, char* module, char* format, ...);
extern void  trace_out         (const char* s);
extern void* trace_GetFP       (void);
extern unsigned short trace_disableprot (unsigned short protmode);
extern unsigned short trace_enableprot  (unsigned short protmode);

#define PM_NOPROT       0
#define PM_SCREEN       1
#define PM_FILE         2
#define PM_WINSCREEN    4
#define PM_TWSCREEN     8
#define PM_DBWIN       16

#define PM_DISPLAY (PM_SCREEN | PM_WINSCREEN | PM_TWSCREEN | PM_DBWIN)
#define PM_ALL   0xFFFF

#ifdef  __cplusplus
}
#endif


#endif //_trace_h_
