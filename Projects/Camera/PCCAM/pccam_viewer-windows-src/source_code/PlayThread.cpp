//---------------------------------------------------------------------------

#include <vcl.h>
#include "Main.h"
#pragma hdrstop

#include "PlayThread.h"
#pragma package(smart_init)
//---------------------------------------------------------------------------

//   Important: Methods and properties of objects in VCL can only be
//   used in a method called using Synchronize, for example:
//
//      Synchronize(UpdateCaption);
//
//   where UpdateCaption could look like:
//
//      void __fastcall Unit1::UpdateCaption()
//      {
//        Form1->Caption = "Updated in a thread";
//      }
//---------------------------------------------------------------------------

__fastcall PlayLoop::PlayLoop(bool CreateSuspended)
        : TThread(CreateSuspended)
{
}
//---------------------------------------------------------------------------
void __fastcall PlayLoop::Execute()
{
  while(!Terminated)
  {



  }
}
//---------------------------------------------------------------------------
