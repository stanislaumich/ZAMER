//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

const wchar_t *sbuf;

HANDLE        handle;
COMMTIMEOUTS  CommTimeOuts;
DCB           dcb;
DWORD         numbytes, numbytes_ok, temp;
COMSTAT       ComState;
OVERLAPPED    Overlap;
char in[7] ;
int nn=0;

unsigned char out[5]={0xff,0x02,0x44,0x03};
char ch[8] ="0123456";


TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
/*
TIniFile *Ini = new TIniFile(ExtractFilePath(ParamStr(0)) +
		"\TesaTest.ini");
	ComboBox1->Text = Ini->ReadString("TESA", "Port", "COM1");
	Ini->Free();
	*/
}
//---------------------------------------------------------------------------
void __fastcall TForm1::ReadClick(TObject *Sender)
{
ClearCommError(handle,&temp,&ComState);
		WriteFile(handle, out, 4, &numbytes_ok, &Overlap); // выдача байта из out
ClearCommError(handle,&temp,&ComState); // опрос состояния буфера приема
  if (ComState.cbInQue>0)                    // контроль количества байт в буфере
	  {ReadFile(handle, in, 7, &numbytes_ok, &Overlap); //считывание 1 байта в in
	  }
  if (in[0]==0x15){
   Label1->Caption = "ОШИБКА";
   Memo1->Lines->Add("ОШИБКА");
  }
  else
  {
  String d = in;
  d = d.Delete(1, 1);
  d = d.Delete(d.Length(), 1);
  Label1->Caption = d;
  Memo1->Lines->Add(d);
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::CloseClick(TObject *Sender)
{
if (handle) {CloseHandle(handle);handle = 0; Label1->Caption = "0";}

}
//---------------------------------------------------------------------------
void __fastcall TForm1::OpenClick(TObject *Sender)
{
 String s = ComboBox1->Text;
 sbuf = s.t_str();
handle=CreateFile(sbuf,GENERIC_READ|GENERIC_WRITE,0,NULL,OPEN_EXISTING,0,NULL);
 SetupComm(handle,100,100);
  GetCommState(handle,&dcb);
    dcb.BaudRate     = CBR_57600;//CBR_2400;  //  CBR_4800; CBR_9600;
    dcb.fBinary      = TRUE;
    dcb.fOutxCtsFlow = FALSE;
    dcb.fOutxDsrFlow = FALSE;
    dcb.fDtrControl  = DTR_CONTROL_DISABLE;
    dcb.fDsrSensitivity = FALSE;
    dcb.fNull        = FALSE;
    dcb.fRtsControl  = RTS_CONTROL_DISABLE;
    dcb.fAbortOnError = FALSE;
    dcb.ByteSize     = 8;
    dcb.Parity       = NOPARITY;
	dcb.StopBits     = 0;
  SetCommState(handle,&dcb);
  PurgeComm(handle,PURGE_RXCLEAR);
  PurgeComm(handle,PURGE_TXCLEAR);

}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button1Click(TObject *Sender)
{
Timer1->Enabled = true;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button2Click(TObject *Sender)
{
Timer1->Enabled = false;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Timer1Timer(TObject *Sender)
{
 ReadClick(Form1);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormClose(TObject *Sender, TCloseAction &Action)
{
/*
TIniFile *Ini = new TIniFile(ExtractFilePath(ParamStr(0)) +
		"\TesaTest.ini");
    Ini->WriteString("TESA", "Port", ComboBox1->Text);
	Ini->Free();
*/
}
//---------------------------------------------------------------------------
