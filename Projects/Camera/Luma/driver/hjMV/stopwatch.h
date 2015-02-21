#ifndef _stopwatch_h
#define _stopwatch_h

#include <sys/time.h>

#define TIME_RESET	0x8000

extern void StartTimer ( struct timeval *start_tv ) ;
extern long DiffTime ( struct timeval *start_tv, struct timeval *end_tv ) ;
extern long ElapsedTime ( struct timeval *start_tv, int info = 0 ) ;
extern void ElapsedMessage ( struct timeval *base_tv, struct timeval *start_tv, char *name, int info = 0 ) ;
extern void ElapsedMessage ( struct timeval *start_tv, char *name, int info = 0 ) ;
extern void TimerMessage ( struct timeval *start_tv, char *name, unsigned items ) ;

#endif // _stopwatch_h
