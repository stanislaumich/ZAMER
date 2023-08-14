//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include <stdio.h>
#include <conio.h>
#include <windows.h>

#include "Rs232b.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;

//********************
HANDLE        handle;
COMMTIMEOUTS  CommTimeOuts;
DCB           dcb;
DWORD         numbytes, numbytes_ok, temp;
COMSTAT       ComState;
OVERLAPPED    Overlap;
char in[6] ;
int nn=0;
unsigned char out[16]={0x0f,0x01,0x02,0x03,0x04,0x05,0x06};
char ch[16] ="0123456789ABCDEF";
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner) // init RS-232
         : TForm(Owner)
{handle=CreateFile("COM1",GENERIC_READ|GENERIC_WRITE,0,NULL,OPEN_EXISTING,0,NULL);
 SetupComm(handle,100,100);
  GetCommState(handle,&dcb);
    dcb.BaudRate     = CBR_9600;//CBR_2400;  //  CBR_4800; CBR_9600;
    dcb.fBinary      = TRUE;
    dcb.fOutxCtsFlow = FALSE;
    dcb.fOutxDsrFlow = FALSE;
    dcb.fDtrControl  = DTR_CONTROL_HANDSHAKE;
    dcb.fDsrSensitivity = FALSE;
    dcb.fNull        = FALSE;
    dcb.fRtsControl  = RTS_CONTROL_DISABLE;
    dcb.fAbortOnError = FALSE;
    dcb.ByteSize     = 8;
    dcb.Parity       = NOPARITY;
    dcb.StopBits     = 2;
  SetCommState(handle,&dcb);
  PurgeComm(handle,PURGE_RXCLEAR);
  PurgeComm(handle,PURGE_TXCLEAR);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button1Click(TObject *Sender)
{ CloseHandle(handle); Form1->Close ();}
//---------------------------------------------------------------------------
void __fastcall TForm1::Timer1Timer(TObject *Sender) //Timing with 19 Hz
{int a,b,c,i,x,y;  unsigned char uc; int nn_max=256;
 e1: ClearCommError(handle,&temp,&ComState); // опрос состояния буфера приема
  if (ComState.cbInQue>0)                    // контроль количества байт в буфере
      {ReadFile(handle, in, 1, &numbytes_ok, &Overlap); //считывание 1 байта в in[0]
       uc=(unsigned char) in[0];             // преобразование быйта и его вывод
       a=(int)(uc & 0x0f); b=(int)((uc & 0xf0)>>4);
       {x=nn&0x0f;y=(nn&0xf0)>>4;StringGrid1->Cells[x][y]=ch[b];
        StringGrid1->Cells[x][y]=StringGrid1->Cells[x][y]+ch[a];
        nn++; nn&=0x00ff;
        x=nn&0x0f;    y=(nn&0xf0)>>4;    StringGrid1->Cells[x][y]="  ";
        x=(nn+1)&0x0f;y=((nn+1)&0xf0)>>4;StringGrid1->Cells[x][y]="  ";
        x=(nn+2)&0x0f;y=((nn+2)&0xf0)>>4;StringGrid1->Cells[x][y]="  "; };
       goto e1;}
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button2Click(TObject *Sender)//Output to RS-232
{ AnsiString ch="0123456789ABCDEF abcdef";
 AnsiString ch1="0123456789ABCDEFabcdef";
 int  a,b,n;
//Обработка формата строки 
  if (n=Edit1->Text.Pos("<")!=0)
  {n=Edit1->Text.Pos("<");
   for  (int i=1; i<n; i++)
   {if (ch.Pos(Edit1->Text[i])!=0) {} else{
      Label2->Caption="Не соответстсвие символам '0123456789ABCDEF <abcdef'";
      Edit1->SetFocus(); Edit1->SelStart=i-1; Edit1->SelLength=1; return; };
   };goto a2;
  } else { Label2->Caption="Нет завершающего символа '<'"; return; };
a2:  a=0;b=0;n=Edit1->Text.Pos("<");
     for (int i=1; i<n; i++)
     {if (ch1.Pos(Edit1->Text[i])!=0)
       {b=0;switch (a){case 0: a++; break; case 1: a++; break;
         default: {Label2->Caption="Символы должны идти парами";
         Edit1->SetFocus();Edit1->SelStart=i-1; Edit1->SelLength=1; return;};
         };
       }else {switch (b)
          {case 0: {b++; if (a==1) {Label2->Caption="Символы должны идти парами";
            Edit1->SetFocus();Edit1->SelStart=i-1;
            Edit1->SelLength=1; return;}; a=0; break;}
           default:
           {Label2->Caption="Между парами символов разрешен только один пробел";
            Edit1->SetFocus();Edit1->SelStart=i-1; Edit1->SelLength=1; return;};
          }
        }
     };

  MessageBeep(MB_ICONEXCLAMATION  );

  unsigned char th,tl;   //Выдача информации через RS232
  char tt;
  a=0;b=0;th=tl=0;n=Edit1->Text.Pos("<");
  PurgeComm(handle,PURGE_RXCLEAR); PurgeComm(handle,PURGE_TXCLEAR);
     for (int i=1; i<n; i++)
     {if (ch1.Pos(Edit1->Text[i])!=0)
       {tt=Edit1->Text[i]; th=(tl<<4);
        switch (tt)
          {case '0':{tl=0; break;}; case '1':{tl=1; break;};
           case '2':{tl=2; break;}; case '3':{tl=3; break;};
           case '4':{tl=4; break;}; case '5':{tl=5; break;};
           case '6':{tl=6; break;}; case '7':{tl=7; break;};
           case '8':{tl=8; break;}; case '9':{tl=9; break;};
           case 'a':{tl=10;break;}; case 'A':{tl=10;break;};
           case 'b':{tl=11;break;}; case 'B':{tl=11;break;};
           case 'c':{tl=12;break;}; case 'C':{tl=12;break;};
           case 'd':{tl=13;break;}; case 'D':{tl=13;break;};
           case 'e':{tl=14;break;}; case 'E':{tl=14;break;};
           case 'f':{tl=15;break;}; case 'F':{tl=15;break;};
           default:;}; 
       } else { out[0]=th|tl;
        ClearCommError(handle,&temp,&ComState);
        WriteFile(handle, out, 1, &numbytes_ok, &Overlap); // выдача байта из out[0]
               };
     };
} ;
//---------------------------------------------------------------------------
void __fastcall TForm1::Edit1Change(TObject *Sender)
{
  Label2->Caption="";        
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Exit1Click(TObject *Sender)
{
   Close ();     
}
//---------------------------------------------------------------------------


