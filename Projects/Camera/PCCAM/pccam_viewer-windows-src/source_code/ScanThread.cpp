/*------------------------------------------------------------------------
  Neuricam SpA   - Trento - Italy
  http://www.neuricam.com
  email:  techsupport@neuricam.com , info@neuricam.com
--------------------------------------------------------------------------
  Filename: ScanThread.cpp
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

#include "ScanThread.h"
#include "Main.h"
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

extern struct sockaddr_in my_addr_data,serv_addr_data;
//---------------------------------------------------------------------------
__fastcall ScanLoop::ScanLoop(bool CreateSuspended)
        : TThread(CreateSuspended)
{
}
//---------------------------------------------------------------------------
void __fastcall ScanLoop::Execute()
{
    AnsiString address;
    int addr_len;
    char msg[256];
    unsigned long argp;
    SOCKET ping;

    addr_len = sizeof(struct sockaddr);
    ping = socket(AF_INET,SOCK_DGRAM,0);

    argp = 1;
    ioctlsocket(ping,FIONBIO,&argp);

    memset ((char *)&my_addr_data,0,sizeof(my_addr_data));
    my_addr_data.sin_family = AF_INET;
    my_addr_data.sin_port   = htons(PORT);
    my_addr_data.sin_addr.s_addr = INADDR_ANY;

    memset ((char *)&serv_addr_data,0,sizeof(serv_addr_data));
    serv_addr_data.sin_family = AF_INET;
    serv_addr_data.sin_port   = htons(PORT);

    bind(ping,(struct sockaddr *)&my_addr_data,sizeof(struct sockaddr));

    counter = 0;
    while(!Terminated && counter < 255)
    {
      address = GetAddress(MainForm->AddrEdit1->Text + "." + MainForm->AddrEdit2->Text + "." + MainForm->AddrEdit3->Text + "." + IntToStr(counter));
      serv_addr_data.sin_addr.s_addr = inet_addr(address.c_str());
      sendto(ping,"Neuri\0",6,0,(struct sockaddr *)&serv_addr_data,sizeof(struct sockaddr));

      int j = 0;
      strcpy(msg,"");
      while(j < SCAN_ATTEMPTS && strcmp(msg,"Cam"))
      {
        recvfrom(ping,msg,256,0,(struct sockaddr *)&serv_addr_data,&addr_len);
        j++;
      }
      if(!strcmp(msg,"Cam"))
      {
        Synchronize(Update1);
      }
      Synchronize(Update2);
      counter++;
    }
}

//---------------------------------------------------------------------------
void __fastcall ScanLoop::Update1()
{
  MainForm->PccamList->Items->Add(AnsiString(inet_ntoa(serv_addr_data.sin_addr)));
}
//---------------------------------------------------------------------------
void __fastcall ScanLoop::Update2()
{
  MainForm->ScanBar->Position = counter;
}
//---------------------------------------------------------------------------
