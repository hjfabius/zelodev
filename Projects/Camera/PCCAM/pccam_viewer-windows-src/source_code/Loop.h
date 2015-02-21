/*------------------------------------------------------------------------
  Neuricam SpA   - Trento - Italy
  http://www.neuricam.com
  email:  techsupport@neuricam.com , info@neuricam.com
--------------------------------------------------------------------------
  Filename: Loop.h
--------------------------------------------------------------------------
  Project:       <PCCam SDK>
  Author(s):     <Roberto Doriguzzi>
  First release: <Jan 2005>
  Description:   <socket image client>
--------------------------------------------------------------------------
  Compiler:      Borland C++ Builder 5 Pro
-------------------------------------------------------------------------*/
//---------------------------------------------------------------------------
#include "Timer.h"
#ifndef LoopH
#define LoopH
//---------------------------------------------------------------------------
#include <Classes.hpp>
//---------------------------------------------------------------------------
class MainLoop : public TThread
{
private:
   Timer loop_time;
protected:
        void __fastcall Execute();
        void __fastcall Update();
public:
        __fastcall MainLoop(bool CreateSuspended);
        bool set_parm;
};
//---------------------------------------------------------------------------
#endif
