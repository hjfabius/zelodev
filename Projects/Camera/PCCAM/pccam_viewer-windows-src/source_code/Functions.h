/*------------------------------------------------------------------------
  Neuricam SpA   - Trento - Italy
  http://www.neuricam.com
  email:  techsupport@neuricam.com , info@neuricam.com
--------------------------------------------------------------------------
  Filename: Functions.h
--------------------------------------------------------------------------
  Project:       <PCCam SDK>
  Author(s):     <Roberto Doriguzzi>
  First release: <Jan 2005>
  Description:   <socket image client>
--------------------------------------------------------------------------
  Compiler:      Borland C++ Builder 5 Pro
-------------------------------------------------------------------------*/
//---------------------------------------------------------------------------
#ifndef FunctionsH
#define FunctionsH
//---------------------------------------------------------------------------
AnsiString  __fastcall GetFileName(AnsiString f);
AnsiString ChangeFileExtension(AnsiString filename,AnsiString ext="");
AnsiString GetFileExtension(AnsiString filename);
#endif
