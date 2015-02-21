#include <string.h>
#include <stdio.h>
#include <stdarg.h>
#include <mv.h>
#include <common/mverr.h>
#include <common/infmsg.h>

static unsigned ErrorCount = 0 ;

//--------------------------------------------------------------------------------------
void CountError(void)
{
		ErrorCount++ ;
}


//--------------------------------------------------------------------------------------
void SetErrNumStr(DEV_T *dev, int err, char *str )
{
	if ( str == NULL )
		str = "" ;
	INFMSG(( "     set error : #%d - %s\n", err, str )) ;
	if (dev->ErrorCode == NO_ERR)
	{
		dev->ErrorCode = (WORD)err;
	        if (dev->ErrorString != NULL)
        	        strncpy ((char*)dev->ErrorString, str, MAX_ERRSTRING_LENGTH);
	}
	else
	{
		INFMSG(( "     leave old error #%d\n", dev->ErrorCode )) ;
	}
	if ( err != NO_ERR )
		CountError() ;
}

#ifdef linux
//--------------------------------------------------------------------------------------
void SetErr(DEV_T *dev, int err )
{
	SetErrNumStr ( dev, err, NULL ) ;
}

//--------------------------------------------------------------------------------------
void SetErrStr ( DEV_T *dev, int err, char *str )
{
	SetErrNumStr ( dev, err, str ) ;
}

//--------------------------------------------------------------------------------------
void SetFatalErr(DEV_T *dev, int err )
{
	SetErrNumStr ( dev, err|MV_FATAL_ERROR, NULL ) ;
}

//--------------------------------------------------------------------------------------
void SetWarning(DEV_T *dev, int err )
{
	SetErrNumStr ( dev, err|MV_WARNING, NULL ) ;
}

//--------------------------------------------------------------------------------------
void SetFatalErrFlag(DEV_T *dev)
{
	dev->ErrorCode |= MV_FATAL_ERROR;
}

//--------------------------------------------------------------------------------------
void SetWarningFlag(DEV_T *dev)
{
	dev->ErrorCode |= MV_WARNING;
}
#endif


/*------------------------------------ SetErrStringF ---------------------*/
int SetErrStringF ( DEV_T FAR *dev, WORD err, char FAR *format, ... )
{
     char buffer[256] ;
     va_list arg;

     if (dev)
     {
         va_start (arg, format);
         vsprintf ( buffer, format, arg ) ;
         va_end (arg);
	 SetErrNumStr ( dev, err, buffer ) ;
     }
     return err ;
}

/*------------------------------------ mvSetErrString ---------------------*/
_MVAPI(VOID) mvSetErrString (DEV_T FAR *dev, CHAR FAR *errstring)
{
     if (dev && dev->ErrorString)
     {
          strncpy ((char*)dev->ErrorString, (char *)errstring, MAX_ERRSTRING_LENGTH);
//          INFMSG(( "     set error : \"%s\"\n", errstring )) ;
     }
}

/*------------------------------------ mvSetError ---------------------------*/
int mvSetError ( DEV_T FAR *dev, int err )
{
	SetErrNumStr ( dev, err, NULL ) ;
	return err ;       
}


