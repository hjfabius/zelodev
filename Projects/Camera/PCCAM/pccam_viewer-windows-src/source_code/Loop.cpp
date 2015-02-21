/*------------------------------------------------------------------------
  Neuricam SpA   - Trento - Italy
  http://www.neuricam.com
  email:  techsupport@neuricam.com , info@neuricam.com
--------------------------------------------------------------------------
  Filename: Loop.cpp
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
#pragma hdrstop
#include "Main.h"
#include "Loop.h"
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

//---------------------------------------------------------------------------
__fastcall MainLoop::MainLoop(bool CreateSuspended)
        : TThread(CreateSuspended)
{
}
//---------------------------------------------------------------------------
void __fastcall MainLoop::Execute()
{
    while(!Terminated)
    {
      loop_time.reset();
      loop_time.start();

      SendString(MainForm->sock,"img");
      Recv(MainForm->sock,(char *)MainForm->Original,MainForm->imagesize);

      loop_time.stop();
      Synchronize(Update);
    }
}

//---------------------------------------------------------------------------
void __fastcall MainLoop::Update()
{
  if(loop_time.time())
  MainForm->StatusBar->Panels->Items[0]->Text = " Frame Rate: " + FloatToStrF(1/loop_time.time(),ffFixed,3,2) + " fps";

  MainForm->RawToBmp(MainForm->original_bitmap,MainForm->Original,MainForm->ORIG_NX,MainForm->ORIG_NY);
  MainForm->AutoVideo->Picture->Assign(MainForm->original_bitmap);
}
