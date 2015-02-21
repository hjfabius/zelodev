#ifndef __MV_H
#include <mv.h>
#endif

#ifndef linux
#undef SetErr
#define SetErr(dev,err)   mvSetError(dev,err)
#endif

int mvSetError ( DEV_T FAR *dev, int err ) ;
int SetErrStringF ( DEV_T FAR *dev, WORD err, char FAR *format, ... ) ;
_MVAPI(VOID) mvSetErrString (DEV_T FAR* dev, CHAR FAR *errstring);
