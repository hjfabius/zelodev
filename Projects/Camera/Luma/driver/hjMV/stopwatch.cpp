/***************************************************************************
                          stopwatch.cpp  -  description
                             -------------------
    copyright            : Fabio Cristini
    email                : fabio.cristini@fastwebnet.it
 ***************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

#include "stopwatch.h"


void StartTimer(struct timeval *start_tv)
{
	gettimeofday ( start_tv, NULL ) ;
}

//-----------------------------------------------------------------------------
long DiffTime(struct timeval *start_tv, struct timeval *end_tv )
{
	static struct timeval diff_tv ;
	diff_tv.tv_sec  = end_tv->tv_sec  - start_tv->tv_sec ;
	diff_tv.tv_usec = end_tv->tv_usec - start_tv->tv_usec ;
	if ( diff_tv.tv_usec < 0 ) // handle 1 sec borrow
	{
		diff_tv.tv_usec += 1000000 ; // usec / sec
		diff_tv.tv_sec -= 1 ;
	}
	return diff_tv.tv_sec * 1000 + diff_tv.tv_usec / 1000 ;
}

//-----------------------------------------------------------------------------
long ElapsedTime(struct timeval *start_tv, int info )
// returns msecs since 'StartTimer()'
{
	static struct timeval end_tv ;
	gettimeofday ( &end_tv, NULL ) ;
	if ( ( info & 0xff00 ) == TIME_RESET )
		*start_tv = end_tv ;
	return DiffTime ( start_tv, &end_tv ) ;
}

//-----------------------------------------------------------------------------
void ElapsedMessage ( struct timeval *base_tv, struct timeval *start_tv, char *name, int info )
{
	static struct timeval end_tv ;
	gettimeofday ( &end_tv, NULL ) ;
	long base_msec  = DiffTime ( base_tv, &end_tv ) ;
	long start_msec = DiffTime ( start_tv, &end_tv ) ;
	printf ( "= %4ld %*c%s : %3ld\n", base_msec, ( info & 0xff ) * 16, ' ', name, start_msec ) ;
}

//-----------------------------------------------------------------------------
void ElapsedMessage ( struct timeval *start_tv, char *name, int info )
{
	long msec = ElapsedTime(start_tv,info);
	printf ( "= %*c%s : %ld\n", ( info & 0xff ) * 16, ' ', name, msec ) ;
}

//-----------------------------------------------------------------------------
void TimerMessage ( struct timeval *start_tv, char *name, unsigned items )
{
	long msec = ElapsedTime(start_tv);
	if ( msec == 0 )
		printf ( "no time elapsed * %d %ss\n", items, name ) ;
	else if ( items == 0 )
		printf ( "time : %3f sec * no items counted\n", msec / 1000.0 ) ;
	else
		printf ( "time : %.3f sec for %d %ss, %.1f msec / %s, %.1f %ss / sec\n",
			msec / 1000.0, items, name, (float)msec / (float)items, name, items * 1000.0 / (float)msec, name ) ;
}


