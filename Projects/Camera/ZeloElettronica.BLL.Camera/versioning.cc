// versioning.cc
#include "versioning.h"


/*******************************************************************/
void Versioning::version()
{
	puts("------------------------------------------");
	puts(VERSION_APPLICATION);
	puts(VERSION_NUMBER);
	puts("------------------------------------------");
	puts(VERSION_AUTHOR);
	puts(VERSION_EMAIL);
	puts("------------------------------------------");
}
