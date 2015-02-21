/*------------------------------------------------------------------------
  Neuricam SpA   - Trento - Italy
  http://www.neuricam.com
  email:  techsupport@neuricam.com , info@neuricam.com
--------------------------------------------------------------------------
  Filename: Main.cpp
--------------------------------------------------------------------------
  Project:       <PCCam SDK>
  Author(s):     <Roberto Doriguzzi>
  First release: <Jan 2005>
  Description:   <socket image client>
--------------------------------------------------------------------------
  Compiler:      Borland C++ Builder 5 Pro
-------------------------------------------------------------------------*/

#include <vcl.h>
#pragma hdrstop

#include "Main.h"
#include "fstream.h"
#include "dir.h"
#include "dirent.h"
#include <filectrl.hpp>
#include "Functions.h"
#include "Loop.h"
#include "ScanThread.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cspin"
#pragma resource "*.dfm"

TMainForm *MainForm;

unsigned long counter;

bool _connect;
Timer proc_time;                                // processing time
MainLoop *ML = NULL;
ScanLoop *SL = NULL;
//---------------------------------------------------------------------------
__fastcall TMainForm::TMainForm(TComponent* Owner)
  : TForm(Owner)
{
  original_bitmap = new Graphics::TBitmap();
  original_bitmap->Assign(AutoVideo->Picture->Bitmap);
  original_jpg = new TJPEGImage();

  ColorCombo->ItemIndex = 0;

  ORIG_NX = 640;                                                        // default image width
  ORIG_NY = 480;                                                        // default image height
  ORIG_NN = ORIG_NX*ORIG_NY;

  /******  retriving my IP address  *******************/
  AnsiString host_address,substring;
  int pos;
  struct hostent *he;
  if(!gethostname(hostname,MAX_STR_LENGTH))
  {
    he = gethostbyname(hostname);
    host_address = AnsiString(inet_ntoa(*((struct in_addr *)he->h_addr)));

    pos = host_address.AnsiPos(".");
    AddrEdit1->Text = host_address.SubString(1,pos-1);
    host_address = host_address.SubString(pos+1,host_address.Length());
    pos = host_address.AnsiPos(".");
    AddrEdit2->Text = host_address.SubString(1,pos-1);
    host_address = host_address.SubString(pos+1,host_address.Length());
    pos = host_address.AnsiPos(".");
    AddrEdit3->Text = host_address.SubString(1,pos-1);
    host_address = host_address.SubString(pos+1,host_address.Length());
  }
  /****************************************************/

  set_parm = true;
  _connect = false;
}
//---------------------------------------------------------------------------
__fastcall TMainForm::~TMainForm()
{
  if(ML) delete ML;
  delete original_bitmap;
  delete original_jpg;
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::UpDateForm()
{

}
//---------------------------------------------------------------------------

void __fastcall TMainForm::RawToBmp(Graphics::TBitmap *dest,unsigned char *src,int NX,int NY)
{
  char *b;
  short *w;
  int *lw;
  short *buffer;

  int x,y;

  dest->Width = NX;
  dest->Height = NY;

  switch(pic_depth)
  {
    case 7:
        original_bitmap->PixelFormat = pf8bit;
        BuildGrayPalette(original_bitmap,pic_depth);
        for(y=0;y<NY;y++)
        {
          b = (char *)dest->ScanLine[y];
          for(x=0;x<NX;x++) b[x] = src[y*NX+x];
        }
        break;
    case 16:
        original_bitmap->PixelFormat = pf32bit;
        BuildGrayPalette(original_bitmap,pic_depth);
        buffer = (short *)src;
        for(y=0;y<NY;y++)
        {
          lw = (int *)dest->ScanLine[y];
          for(x=0;x<NX;x++)
          {
            lw[x] = 0;
            lw[x] =  ((buffer[y*NX+x] >> 11) << 19);
            lw[x] |= (((buffer[y*NX+x] & 0x07E0) >> 5) << 10);
            lw[x] |= ((buffer[y*NX+x] & 0x001F) <<3);
          }
        }
        break;
  }
}
//-----------------------------------------------------------------------------
void __fastcall TMainForm::BmpToRaw(unsigned char *dest,Graphics::TBitmap *src)
{
  BYTE *p;
  int NX,NY;
  int x,y;

  NX = src->Width;
  NY = src->Height;


  for(y=0;y<NY;y++)
  {
    p = (BYTE *)src->ScanLine[y];
    for(x=0;x<NX;x++) dest[y*NX+x] = p[x];
  }

}
//---------------------------------------------------------------------
void __fastcall TMainForm::BuildGrayPalette(Graphics::TBitmap * bitmap,int depth)
{
  int value;
  RGBQUAD mask_quad[256];
  for (int i = 0; i < 256; ++i)
  {
    value = depth < 16 ? i : 0;
    mask_quad[i].rgbRed      = value;
    mask_quad[i].rgbBlue     = value;
    mask_quad[i].rgbGreen    = value;
    mask_quad[i].rgbReserved = 0;
  }

  SetDIBColorTable(bitmap->Canvas->Handle, 0, 256, mask_quad);
}
//---------------------------------------------------------------------------


void __fastcall TMainForm::PlayBtnClick(TObject *Sender)
{
  ML->Resume();
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::StopBtnClick(TObject *Sender)
{
  ML->Suspend();
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::ConnectBtnClick(TObject *Sender)
{
  if(PccamList->ItemIndex >= 0)
  {
    if(!_connect)
    {
      sock = socket(AF_INET,SOCK_STREAM,0);

      memset ((char *)&serv_addr,0,sizeof(serv_addr));
      serv_addr.sin_family = AF_INET;
      serv_addr.sin_port   = htons(PORT);
      serv_addr.sin_addr.s_addr = inet_addr(PccamList->Items->Strings[PccamList->ItemIndex].c_str());

      if(connect(sock,(struct sockaddr *)&serv_addr, sizeof(sockaddr)) == -1)
      {
        exit(0);
      }

      pic_gain = GainUD->Position;
      pic_depth = 7;
      imagesize = ORIG_NN;

      SendString(sock,"pic");
      Send(sock,&pic_depth,sizeof(pic_depth));
      Send(sock,&pic_gain,sizeof(pic_gain));


      Original = new unsigned char [2*ORIG_NN];
      ConnectBtn->Caption = "Disconnect";
      _connect = true;

      if(!ML)
      {
        ML = new MainLoop(true);
        ML->Priority = tpLowest	;
      }

      PlayBtn->Enabled = true;
      StopBtn->Enabled = true;
      Controls->Enabled = true;
    }
    else
    {
      if(ML)
      {
        delete ML;
        ML = NULL;
      }
      shutdown(sock,2);

      ConnectBtn->Caption = "Connect";
      delete [] Original;
      _connect = false;

      PlayBtn->Enabled = false;
      StopBtn->Enabled = false;
      Controls->Enabled = false;
    }
  }
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::ScanBtnClick(TObject *Sender)
{
  if(SL)
  {
    delete SL;
    SL = NULL;
  }
  PccamList->Items->Clear();
  SL = new ScanLoop(true);
  SL->Priority = tpLowest;
  SL->Resume();
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::StopScanBtnClick(TObject *Sender)
{
    if(SL)
    {
      delete SL;
      SL = NULL;
    }
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::ColorComboChange(TObject *Sender)
{
  if(ML) delete ML;
  switch(ColorCombo->ItemIndex)
  {
    case 0: pic_depth = 7; imagesize = ORIG_NN; break;
    case 1: pic_depth = 16; imagesize = 2*ORIG_NN; break;
    default: pic_depth = 7; imagesize = ORIG_NN; break;
  }
  SendString(sock,"pic");
  Send(sock,&pic_depth,sizeof(pic_depth));
  Send(sock,&pic_gain,sizeof(pic_gain));

  ML = new MainLoop(false);
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::GainUDChange(TObject *Sender)
{
  pic_gain = GainUD->Position;

  ML->Suspend();
  SendString(sock,"pic");
  Send(sock,&pic_depth,sizeof(pic_depth));
  Send(sock,&pic_gain,sizeof(pic_gain));
  ML->Resume();        
}
//---------------------------------------------------------------------------

