/***************************************************************************
                          hjKeyboard.cpp  -  description
                             -------------------
    copyright            : Fabio Cristini
    email                : fabio.cristini@fastwebnet.it

 ***************************************************************************/

/*
 *  getch()  --  a blocking single character input from stdin
 *
 *  BSD or POSIX systems may require a struct termios, older systems
 *  may require a struct termio, and some (Linux) may be able to use
 *  either.
 *
 */
 
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <termios.h>
#include <sys/ioctl.h>
#include "hjKeyboard.h"
 
 
#define CMIN  1
 
#ifdef CTIME
#undef CTIME
#endif
 
#define CTIME 1
 
/*
 *  get a single character from stdin.
 *
 *  First stdout is flushed, stdin is then switched to 
 *  raw mode and input is waited for.  When a single
 *  character is received from stdin the tty is restored
 *  to its original state and  the character is returned.
 *  If the read from stdin fails, a -1 is returned.
 *
 *  A conditional allows compiling with or without echo.
 */
 
int hjGetCh(void)
{
  char                  ch;
  int                   error;
  static struct termios Otty, Ntty;
 
 
  fflush(stdout);
  tcgetattr( 0, &Otty);
  Ntty = Otty;
 
  Ntty.c_iflag          = 0;    /* input mode           */
  Ntty.c_oflag          = 0;    /* output mode          */
 
/* Change this conditional to enable echo of input character */
#if 1
  Ntty.c_lflag          = 0;    /* line settings (no echo) */
#else
  Ntty.c_lflag          = ECHO; /* line settings (echo) */
#endif  
  Ntty.c_cc[VMIN]       = CMIN; /* minimum time to wait */
  Ntty.c_cc[VTIME]      = CTIME;/* minimum characters to wait for */
 
#if 0
/*
 * use this to flush the input buffer before blocking for new input
 */
#define FLAG TCSAFLUSH
#else
/*
 * use this to return a char from the current input buffer, or block if
 * no input is waiting.
 */
#define FLAG TCSANOW
#endif  
 
 if ( 0 == (error = tcsetattr( 0, FLAG, &Ntty))) {
    error =  read( 0, &ch, 1 );       /* get char from stdin */
    error += tcsetattr(0, FLAG, &Otty);   /* restore old settings */
  }
 
  return ( error == 1 ? (int) ch : -1 );
}


/*
 *  hjKbHit()  --  a keyboard lookahead monitor
 *
 *  returns the number of characters available to read, or -1 on error.
 *
 */

int hjKbHit(void)
{
  int                   cnt = 0;
  int                   error;
  static struct termios Otty, Ntty;
 
 
  tcgetattr( 0, &Otty);
  Ntty = Otty;
 
  Ntty.c_iflag          = 0;       /* input mode                */
  Ntty.c_oflag          = 0;       /* output mode               */
  Ntty.c_lflag         &= ~ICANON; /* raw mode */
  Ntty.c_cc[VMIN]       = CMIN;    /* minimum time to wait      */
  Ntty.c_cc[VTIME]      = CTIME;   /* minimum characters to wait for */
 
  if (0 == (error = tcsetattr(0, TCSANOW, &Ntty))) {
    error += ioctl(0, FIONREAD, &cnt);
    error += tcsetattr(0, TCSANOW, &Otty);
  }
 
  return ( error == 0 ? cnt : -1 );
}
 