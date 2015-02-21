#include <stdio.h>

#if defined(_WIN32) || defined(__WINDOWS_386__)
#include <windows.h>
#endif

#include <stdarg.h>
#include <string.h>
#include <time.h>
#ifdef linux
#include <unistd.h>
#else
//WA #include <dos.h>
#include <dos.h>
#endif

#if defined(__DPMI32__)
#undef _Windows
#else
#if defined(_Windows)
#include <windows.h>
#endif
#endif

// ??? #pragma 
#include <mv.h>
#include <common/infmsg.h>
#include <common/trace.h>

#include <os/os.h>

#ifdef _CHK_TIME
#ifndef _DEF_LOGTIME
#define _DEF_LOGTIME  1
#endif
#define _DEF_LOGFLUSH 0
#else
#ifndef _DEF_LOGTIME
#define _DEF_LOGTIME  0
#endif
#define _DEF_LOGFLUSH 1
#endif

BOOL TimeLog  = _DEF_LOGTIME ;
BOOL FlushLog = _DEF_LOGFLUSH ;
int  DelayLog = 0 ; // msec
BOOL DupLog   = FALSE ;
BOOL SyncLog  = FALSE ;

#define PM_FILEMODE   "wt"
#define PM_FILEAPPEND "at"


#if _DEBUG
static int protmode   = PM_WINSCREEN;
#else
static int protmode   = PM_NOPROT;
#endif

static int debuglevel = 0; 

static FILE* fpprot         = NULL;
static unsigned short disable_output = 0;
static char  prot_file[200];
static char strModuleText_m[100];

static long  lasttime = -1 ;
static long  progstarttime = -1 ;


#ifdef _WIN32
HANDLE hCon = 0 ;
#endif


#if defined(linux)
#define _xsleep(sl) usleep(sl*1000)
#elif defined(_WIN32)
#define _xsleep(sl) Sleep(sl)
#else
#define _xsleep(sl)
#endif


/* ------------------------------------------- trace_DebugLevel -------- */
void _export trace_DebugLevel ( int level )
{
  debuglevel = level;
}

/* ------------------------------------------- trace_setmoduletext -------- */
void _export trace_setmoduletext (CHAR FAR* ModuleText)
{
  strcpy(strModuleText_m,(char *)ModuleText);
}



/* ------------------------------------------- trace_disableprot -------- */
unsigned short _export trace_disableprot (WORD protmode)
{
  unsigned short olddis = disable_output ;
  disable_output |= protmode;
  return olddis ;
}


/* ------------------------------------------- trace_enableprot --------- */
unsigned short _export trace_enableprot (WORD protmode)
{
  unsigned short olddis = disable_output ;
  disable_output &= (WORD)(~protmode);
  return olddis ;
}


/* ------------------------------------------- trace_openprot ----------- */
void _export trace_openprot (char* filename)
{
#ifdef __BORLANDC__
  struct time t;
  struct date d;
  char timebuf[128];
  char datebuf[128];
#else
  char timebuf[128];
  char datebuf[128];
#endif
  char prgname[256];

  //???? siehe closeprot und define borland
  if (protmode != PM_NOPROT)
	trace_closeprot ();

  trace_enableprot(PM_ALL);

  if (stricmp (filename, "NULL") == 0)
  {
	protmode = PM_NOPROT;
	fpprot = NULL;
	return;
  }
  else if (stricmp (filename, "SCREEN") == 0)
  {
	protmode = PM_SCREEN;
	fpprot = NULL;
  }
  else if (stricmp (filename, "WINSCREEN") == 0)
  {
	protmode = PM_WINSCREEN;
#ifdef _WIN32
    AllocConsole();
    hCon = GetStdHandle(STD_OUTPUT_HANDLE);
#else
	fpprot = NULL;
#endif
  }
  else if (stricmp (filename, "TWSCREEN") == 0)
  {
    protmode = PM_TWSCREEN;
    fpprot = stdout;
  }
  else if (stricmp (filename, "DBWIN") == 0)
  {
    protmode = PM_DBWIN;
	fpprot = NULL;
  }
  else
  {
    fpprot = fopen (filename, PM_FILEMODE);

    if (fpprot != NULL)
    {
      protmode = PM_FILE;
	  strncpy (prot_file, filename, 200);
	  if ( FlushLog )
	  {
		fclose (fpprot);
		fpprot=NULL;
	  }
	}
    else
      protmode = PM_NOPROT;
  }

  /* UH, 7.5.98 */
#ifndef _DIAG
  if ( TimeLog )
	lasttime = osGetClockMSec() ;
#endif

  LOGMSG (("\n------------------------------------------------------------------\n"));

#ifdef __mvWIN__
  GetModuleFileName(NULL,prgname,256);
#else
  strcpy(prgname,"<mv-driver>");
#endif

#if defined(__BORLANDC__)
  gettime (&t);
  getdate (&d);
  sprintf ( timebuf, "%02d:%02d",	   t.ti_hour, t.ti_min ) ;
  sprintf ( datebuf, "%02d.%02d.%02d", d.da_day, d.da_mon, d.da_year ) ;
#elif defined(linux)
	timebuf[0] = 0 ;
	datebuf[0] = 0 ;
#else
#ifndef __WATCOMC__
  _tzset(); // check for system time zone
#endif
  _strtime( timebuf );
  _strdate( datebuf );
#endif

  LOGMSG (("Filename: %s created at %s %s by %s\n", filename ,timebuf, datebuf, prgname ));
}


/* ------------------------------------------- trace_closeprot ---------- */
void _export trace_closeprot ()
{
#ifdef __BORLANDC__
  struct time t;
  struct date d;

  gettime (&t);
  getdate (&d);

  if ((fpprot != NULL) && (fpprot != stdout))
  {
    LOGMSG (("Logfile closed at %02d:%02d %02d.%02d.%02d \n", t.ti_hour, t.ti_min, d.da_day, d.da_mon, d.da_year));
    LOGMSG (("------------------------------------------------------------------\n"));
  }
#endif

  if ((fpprot != NULL) && (fpprot != stdout))
  {
	  if ( !FlushLog )
	  {
		fclose (fpprot);
		fpprot=NULL;
	  }
  }

  protmode = PM_NOPROT;
}


/* ------------------------------------------- vtrace_modmsg ---------------- */
void _export __cdecl vtrace_modmsg (char *module, char* format, va_list arg0 )
{
	if ( protmode != PM_NOPROT )
	{
		static int trace_tab = 0;
		//va_list arg;
		char buf[512], *s;
	
		//arg = arg0 ;
		
		if ( format[0] == '$' )
		{
			if ( strnicmp ( format, "$time", 5 ) == 0 )
			{
				TimeLog	= va_arg(arg0,int) ;
				FlushLog = ! TimeLog ;
				progstarttime = lasttime = -1 ;
			}
			else if ( strnicmp ( format, "$flush", 6 ) == 0 )
				FlushLog	= va_arg(arg0,int) ;
			else if ( strnicmp ( format, "$delay", 6 ) == 0 )
				DelayLog	= va_arg(arg0,int) ;
			else if ( strnicmp ( format, "$dup", 4 ) == 0 )
				DupLog	= va_arg(arg0,int) ;
			else if ( strnicmp ( format, "$sync", 5 ) == 0 )
				SyncLog	= va_arg(arg0,int) ;

			//arg = arg0 ;
		} 
	
		if( format[0] == '-' ) 
			if( trace_tab>=2 ) 
				trace_tab-=2;
	
		s = buf ;

		if ( TimeLog )
        {
		  if ( format[0] == ' ' || format[0] == '\t' )
		  {
			  memset ( s, ' ', 14 ) ;
			  s += 14 ; 
		  }
		  else
		  {
        /* UH, 7.5.98 */
#ifndef _DIAG
			  long currtime = osGetClockMSec() ;
#else
       		  long currtime = 0;
#endif
			  if (progstarttime<=0)
				   progstarttime = currtime ;
			  s += sprintf ( s,  "{%6ld:%4ld} ", currtime - progstarttime, currtime - lasttime ) ;
			  lasttime = currtime ;
		  }
        }

#ifdef linux
		s += sprintf ( s, "%4d $ ", getpid() ) ;
#endif
		if ( module != NULL )
			s += sprintf ( s, "%s : ", module ) ;
	
		if ( trace_tab > 0 ) 
			memset(s,' ',trace_tab);
		else
			trace_tab = 0;
	
		vsprintf (s+trace_tab, format, arg0);
	
		if( format[0] == '+' ) 
			if( trace_tab<100 ) 
				trace_tab+=2;
	
		trace_out (buf);
	}
}

/* ------------------------------------------- trace_msg ---------------- */
void _export __cdecl trace_msg (char* format, ...)
{
	if ( protmode != PM_NOPROT )
	{
		va_list arg;
		va_start (arg, format);
		vtrace_modmsg ( NULL, format, arg ) ;
		va_end (arg);
	}
}


/* ------------------------------------------- trace_debuglevel_msg ---------------- */
void _export __cdecl trace_debuglevel_msg (int msglevel, char* format, ...)
{
	if ( protmode != PM_NOPROT && msglevel <= debuglevel )
	{
		va_list arg;
		va_start (arg, format);
		vtrace_modmsg ( NULL, format, arg ) ;
		va_end (arg);
	}
}


/* ---------------------------------------- trace_module_msg ---------------- */
void _export __cdecl trace_module_msg (char* module, char* format, ...)
{
	if ( protmode != PM_NOPROT )
	{
		 va_list arg;
		 va_start (arg, format);
		 vtrace_modmsg ( module, format, arg ) ;
		 va_end (arg);
	}
}


/* ------------------------------------------- trace_module_debuglevel_msg ---------------- */
void _export __cdecl trace_module_debuglevel_msg (int msglevel, char* module, char* format, ...)
{
	if ( protmode != PM_NOPROT && msglevel <= debuglevel )
	{
		va_list arg;
		va_start (arg, format);
		vtrace_modmsg ( module, format, arg ) ;
		va_end (arg);
	}
}


/* ------------------------------------------- trace_out ---------------- */
void _export trace_out (const char* s)
{
	if ( disable_output & protmode )
		return ;
	switch (protmode)
	{
	case PM_SCREEN:      
#if !defined(_WINDOWS) || defined(_EasyWin) || defined(_CONSOLE)
		fputs ( s, stdout ) ;
		if ( FlushLog )
			fflush ( stdout ) ;
#endif
	  	break;

	case PM_WINSCREEN:   
#ifdef _WIN32
	  	if ( hCon != 0 )
		{
	    		int Num ;
	 			WriteConsole( hCon,    s, strlen(s),&Num,0);   
	 	 	}
		else
#endif
		{
				fputs ( s, stdout ) ;
			if ( FlushLog )
				fflush ( stdout ) ;
		}
	  	break;

	case PM_FILE:        
	    if ( fpprot == NULL )
	      fpprot = fopen (prot_file, PM_FILEAPPEND);

	    if ( fpprot != NULL )
	    {
		  	fputs ( s, fpprot ) ;
			if ( FlushLog )
			{
				fclose (fpprot);
#ifdef linux
				if ( SyncLog )
					sync();
#endif
				fpprot = NULL;
			}
	    }
	  	break;


#if defined __PROTEST
	case PM_TWSCREEN:    
	    WNprintf ("%s", s);
	  	break;
#else
#if !defined(_WINDOWS)
	case PM_TWSCREEN:    
	  	fputs ( s, stdout ) ;
		if ( FlushLog )
			fflush ( stdout ) ;
	  	break;
#endif
#endif

#if defined(WIN32) || defined(__WINDOWS_386__) || ((defined(_Windows) && !defined(__DPMI32__) && !defined(__DPMI16__)))
	case PM_DBWIN: 
	    OutputDebugString(s);
	  	{                      // allow window update
	    	MSG msg;
	    	while (PeekMessage(&msg, NULL, 0, 0, PM_REMOVE))
	    	{
	      	TranslateMessage(&msg);
	      	DispatchMessage(&msg);
	    	}
	  	}
	  	break;
#endif

	case PM_NOPROT :
		return ;

default :
	// illegal ??
	  break;
	}

	if ( DupLog )
	{
		fputs ( s, stdout ) ;
		if ( FlushLog )
	 		fflush ( stdout ) ;
	}

   if ( DelayLog )
      _xsleep (DelayLog);

#if TRACE_KEY
	fputs ( " - press Enter >", stdout ) ;
	fflush ( stdout ) ;
	getchar();
#endif

}


/* ------------------------------------------- trace_GetFP -------------- */
void* _export trace_GetFP ()
{
  return (void*) NULL; //fpprot;
}
