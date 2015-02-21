/*------------------------------------------------------------------------
  Neuricam SpA   - Trento - Italy
  http://www.neuricam.com
  email:  techsupport@neuricam.com , info@neuricam.com
--------------------------------------------------------------------------
  Filename: Main.h
--------------------------------------------------------------------------
  Project:       <PCCam SDK>
  Author(s):     <Roberto Doriguzzi>
  First release: <Jan 2005>
  Description:   <socket image client>
--------------------------------------------------------------------------
  Compiler:      Borland C++ Builder 5 Pro
-------------------------------------------------------------------------*/

#ifndef MainH
#define MainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include <Dialogs.hpp>
#include <Buttons.hpp>
#include "cspin.h"
#include <ComCtrls.hpp>
#include <FileCtrl.hpp>
#include <Graphics.hpp>
#include <Grids.hpp>
#include <ExtDlgs.hpp>
#include <Mask.hpp>
#include <ScktComp.hpp>
#include <sys/timeb.h>
#include <ComCtrls.hpp>
#include <FileCtrl.hpp>
#include <Graphics.hpp>
#include <sys\timeb.h>
#include <ComCtrls.hpp>
#include <FileCtrl.hpp>
#include <Graphics.hpp>
#include <Menus.hpp>
#include <ToolWin.hpp>
#include <ImgList.hpp>
#include <jpeg.hpp>

#define PORT 5351
#define MAX_STR_LENGTH 256
#define SCAN_ATTEMPTS  10000
//---------------------------------------------------------------------------
struct sockaddr_in my_addr_data,serv_addr_data;
//---------------------------------------------------------------------------
class TMainForm : public TForm
{
__published:	// IDE-managed Components
        TOpenDialog *FotoDialog;
        TLabel *PlateLabel;
        TPanel *AutoPanel;
        TImage *AutoVideo;
        TPanel *ControlPanel;
        TPanel *Panel3;
        TSpeedButton *PlayBtn;
        TSpeedButton *StopBtn;
        TGroupBox *Controls;
        TLabel *Label4;
        TLabel *Label5;
        TStatusBar *StatusBar;
        TOpenDialog *ImageDialog;
        TPanel *Panel1;
        TSpeedButton *ConnectBtn;
        TClientSocket *MySocket;
        TListBox *PccamList;
        TTimer *ScanTimer;
        TButton *ScanBtn;
        TButton *StopScanBtn;
        TProgressBar *ScanBar;
        TPanel *Panel4;
        TLabel *Label6;
        TMaskEdit *AddrEdit1;
        TMaskEdit *AddrEdit2;
        TLabel *Label3;
        TMaskEdit *AddrEdit3;
        TLabel *Label2;
        TComboBox *ColorCombo;
        TScrollBar *GainUD;
        void __fastcall PlayBtnClick(TObject *Sender);
        void __fastcall StopBtnClick(TObject *Sender);
        void __fastcall ConnectBtnClick(TObject *Sender);
        void __fastcall ScanBtnClick(TObject *Sender);
        void __fastcall ColorComboChange(TObject *Sender);
        void __fastcall StopScanBtnClick(TObject *Sender);
        void __fastcall GainUDChange(TObject *Sender);

private:	// User declarations

public:		// User declarations
  __fastcall TMainForm(TComponent* Owner);
  __fastcall ~TMainForm();
  int ORIG_NX;                                    // image width
  int ORIG_NY;                                    // image height
  int ORIG_NN;                                    // image area
  SOCKET sock;
  int imagesize;
  struct sockaddr_in serv_addr;
  Graphics::TBitmap *original_bitmap;
  unsigned char *Original;
  TJPEGImage *original_jpg;
  unsigned char pic_depth;
  unsigned char pic_gain;
  unsigned char hostname[MAX_STR_LENGTH];
  bool set_parm;
  void __fastcall UpDateForm();
  void __fastcall SalvaCarattere(int kk, AnsiString QualeCar);
  void __fastcall BuildGrayPalette(Graphics::TBitmap * bitmap,int depth);
  void __fastcall RawToBmp(Graphics::TBitmap *dest,unsigned char *src,int NX,int NY);
  void __fastcall BmpToRaw(unsigned char *dest,Graphics::TBitmap *src);
};
//---------------------------------------------------------------------------
extern PACKAGE TMainForm *MainForm;
//--------------------------  Extern Variables  -----------------------------

int RawWidth;
int RawHeight;
//---------------------------------------------------------------------------
/*****************************************************************/
int Send(int fd,void *buf,int len)
{
  int sum = 0;
  int bytes = 0;
  int bytesleft = len;
  char * buffer;
  
  buffer = (char *)buf;
  while(sum < len)
  {
    bytes = send(fd,buffer+sum,bytesleft, 0);
    if(bytes > 0) {sum += bytes; bytesleft -= bytes;}
    else return bytes;
  }
  return sum;
}
/***********************************************************************/
int Recv(int fd,void *buf,int len)
{
  int sum = 0;
  int bytes = 0;    
  int bytesleft = len;
  char * buffer; 

  buffer = (char *)buf;
  while(sum < len)
  {
    bytes = recv(fd,buffer+sum,bytesleft, 0);
    if(bytes > 0) {sum += bytes; bytesleft -= bytes;}
    else return bytes;
  }
  return sum;
	
}
/***********************************************************************/

int SendString(int fd,char *buf)
{
  int bytes;
  int i;

  i = 0;
  while(buf[i++] && i < MAX_STR_LENGTH);

  bytes = send(fd,buf,i, 0);

  return bytes;  
}

/*******************************************************/

int RecvString( int fd, char * buf)
{
  int sum = 0;
  int counter;
  int bytes;
  char a;

  strcpy(buf,"\0");
  counter = 0;
  a = '1';
  while(a && sum < MAX_STR_LENGTH)
  {
    bytes = recv(fd,&a,1, 0);
    if(bytes > 0)
    {
      buf[counter] = a;
      counter++;
      sum += bytes;
    }
    else return bytes;
  }
  return sum;
}

/*******************************************************/
AnsiString GetAddress(AnsiString addr)
{
  int  i,a[4];
  char address[16],num[4];
  AnsiString Address;

  strcpy(address,addr.c_str());

  for(i=0;i<=12;i+=4)
  {
    memcpy(num,&address[i],3);
    a[i/4] = atoi(num);
  }

  return Address = IntToStr(a[0]) + "." + IntToStr(a[1]) + "." + IntToStr(a[2]) + "." + IntToStr(a[3]);
}
#endif
