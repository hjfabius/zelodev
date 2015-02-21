/*------------------------------------------------------------------------
  Neuricam SpA   - Trento - Italy
  http://www.neuricam.com
  email:  techsupport@neuricam.com , info@neuricam.com
--------------------------------------------------------------------------
  Filename: Functions.cpp
--------------------------------------------------------------------------
  Project:       <PCCam SDK>
  Author(s):     <Roberto Doriguzzi>
  First release: <Jan 2005>
  Description:   <socket image client>
--------------------------------------------------------------------------
  Compiler:      Borland C++ Builder 5 Pro
-------------------------------------------------------------------------*/

//---------------------------------------------------------------------------
#include <vcl.h>
#include <dir.h>

#pragma hdrstop

#include "Functions.h"
#include <dir.h>
#include <stdlib.h>

#define MAX_PATH_LEN 256

//---------------------------------------------------------------------------
#pragma package(smart_init)


//---------------------------------------------------------------------------

AnsiString ChangeFileExtension(AnsiString filename,AnsiString ext)
{
AnsiString  string;
int         position;
position=filename.LastDelimiter(".")-1;
if(position<0)
   position=filename.Length();
string=filename.SubString(0,position);

if(ext!="")
   string+="."+ext;

return string;
}

//---------------------------------------------------------------------------

AnsiString GetFileExtension(AnsiString filename)
{
AnsiString ext;
ext = filename.SubString(filename.LastDelimiter(".")+1,filename.Length());
if(ext==filename) ext="";
return ext;
}

//---------------------------------------------------------------------------

AnsiString  __fastcall GetFileName(AnsiString f)
{
int len = f.Length();
int index;
for(index=len;index>0;index--)
   if(f[index]=='\\' || f[index]=='/')
      break;
return f.SubString(index+1,len-index+1);
}

//---------------------------------------------------------------------------


