//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include "mserial.h"
#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

BYTE *out;
unsigned char outstart[5] = {0xff, 0x02, 0x41, 0x03, 0x00};


BYTE *buffer;// = "0123456";

TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button1Click(TObject *Sender)
{
//char bufin[100];
//char bufout[100];
    MSerial Comport;
    wchar_t *sbuf;
    String s = "COM1";//ComboBox1->Text;
	sbuf = s.t_str();
	Comport.Open(sbuf, BaudRate_57600, Data8Bit, NonParity, OneStopBit);
	{
	   int* ptr = (out) malloc(5);
	   out[0] =  0xff;
	   out[1] =  0x02;
	   out[2] =  0x41;
	   out[3] =  0x03;
	   Comport.Write(ptr,1);
	   //Comport.Read(buffer,8);

	   //Comport.ResetRB();
	   //Comport.ResetWB();
       Comport.Close();
    }
    //  else MessageBox(NULL, "COM1 невозможно открыть!", "Ошибка!" , MB_OK);
}
//---------------------------------------------------------------------------
