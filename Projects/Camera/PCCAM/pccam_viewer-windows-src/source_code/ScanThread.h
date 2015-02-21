/*------------------------------------------------------------------------
  Neuricam SpA   - Trento - Italy
  http://www.neuricam.com
  email:  techsupport@neuricam.com , info@neuricam.com
--------------------------------------------------------------------------
  Filename: ScanThread.h
--------------------------------------------------------------------------
  Project:       <PCCam SDK>
  Author(s):     <Roberto Doriguzzi>
  First release: <Jan 2005>
  Description:   <socket image client>
--------------------------------------------------------------------------
  Compiler:      Borland C++ Builder 5 Pro
-------------------------------------------------------------------------*/
//---------------------------------------------------------------------------

#ifndef ScanThreadH
#define ScanThreadH
//---------------------------------------------------------------------------
#include <Classes.hpp>
//---------------------------------------------------------------------------
class ScanLoop : public TThread
{
private:
   int counter;

protected:
        void __fastcall Execute();
        void __fastcall Update1();
        void __fastcall Update2();
public:
        __fastcall ScanLoop(bool CreateSuspended);
};
//---------------------------------------------------------------------------
#endif
