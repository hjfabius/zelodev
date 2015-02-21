/***************************************************************************
                          main.cpp  -  description
                             -------------------
    copyright            : Fabio Cristini
    email                : fabio.cristini@fastwebnet.it
 ***************************************************************************/

#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <stdlib.h>


#include <fcntl.h>
#include <sys/ioctl.h>
#include <termios.h> 

#include <linux/vt.h>
#include <linux/kd.h>
#include <linux/keyboard.h>


//#include <unistd.h>
#include <sys/reboot.h>

#include "hjLuma.h"

static struct termios  norm_termios;


 #define BMAGIC_SOFT	0
 #define BMAGIC_REBOOT	0x01234567
 #define BMAGIC_HALT	0xCDEF0123
 #define BMAGIC_PWOFF	0x4321FEDC
 
 #if __GNU_LIBRARY__ >= 6
   #define init_reboot(magic) reboot(magic)
 #endif
//-----------------------------------------------------------------------------
const char *gt_basename (const char *filename)
{
	char *s ;
	return ( s = strrchr ( filename, '/' ) ) != NULL ? s+1 : filename ;
}

//-----------------------------------------------------------------------------
void printHelp()
{
	printf ( "usage : hjMv [ -n frames ] [ -s shutter ]\n"
             "             [ -f fpf ] [ -g gain ] [ -c scale ]\n"
             "             [ -v vidmod ] [ -o flags ] [ -b ]\n");
	printf ( "    -?         : help\n" ) ;
	printf ( "    -n frames  : number of frames\n" ) ;
	printf ( "            ( default = 0 = infinitely until key press )\n" ) ;
	printf ( "    -s shutter : shutter's time in microsecond\n" ) ;
	printf ( "    -f fpf     : fields per small frame\n" ) ;
	printf ( "    -g gain    : gain value, 0 = auto gain\n" ) ;
	printf ( "    -c scale   : scaling off | on ( = 0 | 1 )\n" ) ;
	printf ( "    -v vidmod  : video mode\n" ) ;
	printf ( "    -o flags   : option flags\n" ) ;
	printf ( "    -b         : show best bayer gain coeffs\n" ) ;
	exit ( -1 ) ;
}

//-----------------------------------------------------------------------------
unsigned strarg ( char *opt, char *name, char **value, int *pi,
				  int argc, char *argv[] )
{
	int  lo	   = strlen ( opt ) ;
	char *pars = argv[*pi] ;
	int result = 0 ;

	if ( strncmp ( pars, opt, lo ) == 0 )
	{
		pars += lo ;
		if ( *pars == 0 )
		{
			if ( ++(*pi) < argc )
				pars = argv[*pi] ;
			else
				pars = NULL ;
		}
		if ( pars != NULL )
		{
			*value = pars ;
			printf ( " - %s = %s\n", name, *value ) ;
			result = 1 ;
		}
	}
	return result ;
}

//-----------------------------------------------------------------------------
unsigned intarg ( char *opt, char *name, int *value, int *pi,
				  int argc, char *argv[] )
{
	char *pars ;
	int result = 0 ;

	if ( ( result = strarg ( opt, name, &pars, pi, argc, argv ) ) > 0 )
	{
		if ( isdigit ( *pars ) || *pars == '+' || *pars == '-' )
			*value = atoi ( pars ) ;
		else
			result = 0 ;
	}

	return result ;
}

//-----------------------------------------------------------------------------
void reset_terminal(void)
{
	/* Turn off non-blocking on stdin */
	fcntl(0,F_SETFL,(~O_NONBLOCK)&fcntl(0,F_GETFL));
	
	/* Reset terminal parameters */
	tcsetattr(0, TCSAFLUSH, &norm_termios);
	
	/* Reset the palette */
	printf("\033]R");
	fflush(stdout);

//	ioctl (0, KDSETMODE, KD_TEXT);/* and back to text mode */
}


//-----------------------------------------------------------------------------
int main ( int argc, char *argv[] )
{

	int			fpf			= 1;
	int			scale		= -1 ;
	int			vidmod		= -1 ;
	int			gain 		= -1 ;
	int			shutter		= 20000;

	int			bayer		= 0;
	int			iExit		= 0;

	printf("\a");
	
	if (hjInitApp() == 0)
	{
		hjInitCamera (-1, -1, -1, -1, fpf, scale, vidmod, gain, shutter, bayer ) ;
		//hjLive(frames, flags) ;
		iExit = hjMain();
	}
	hjCloseApp() ;

	reset_terminal();
	


	return iExit;
}
