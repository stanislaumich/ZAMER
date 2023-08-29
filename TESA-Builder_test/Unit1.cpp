// ---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
// ---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

const wchar_t *sbuf;

HANDLE handle;
COMMTIMEOUTS CommTimeOuts;
DCB dcb;
DWORD numbytes, numbytes_ok, temp;
COMSTAT ComState;
OVERLAPPED Overlap;
char in[7];
int nn = 0;

int t = 15;

unsigned char out[5] = {0xff, 0x02, 0x4A, 0x03};
unsigned char outget1[1] = {0xff};
unsigned char outget2[1] = {0x02};
unsigned char outget3[1] = {0x4A};
unsigned char outget4[1] = {0x03};

unsigned char outstart[4] = {0x02, 0x41, 0x03};
unsigned char outstart1[1] = {0xFF};
unsigned char outstart2[1] = {0x02};
unsigned char outstart3[1] = {0x41};
unsigned char outstart4[1] = {0x03};

unsigned char outclose[5] = {0xff, 0x02, 0x42, 0x03};
unsigned char outcl1[1] = {0xff};
unsigned char outcl2[1] = {0x02};
unsigned char outcl3[1] = {0x42};
unsigned char outcl4[1] = {0x03};

unsigned char outsost[5] = {0xff, 0x02, 0x49, 0x03};
unsigned char outsost1[1] = {0xff};
unsigned char outsost2[1] = {0x02};
unsigned char outsost3[1] = {0x49};
unsigned char outsost4[1] = {0x03};

unsigned char zero[1] = {0xFF};

char ch[8] = "0123456";

TForm1 *Form1;

void send(int c) {

	switch (c) {
	case 0: // start
		WriteFile(handle, outstart1, 1, &numbytes_ok, &Overlap);
		Sleep(t);
		WriteFile(handle, outstart2, 1, &numbytes_ok, &Overlap);
		Sleep(t);
		WriteFile(handle, outstart3, 1, &numbytes_ok, &Overlap);
		Sleep(t);
		WriteFile(handle, outstart4, 1, &numbytes_ok, &Overlap);
        Sleep(t);
        WriteFile(handle, outstart1, 1, &numbytes_ok, &Overlap);
		Sleep(t);
		WriteFile(handle, outstart2, 1, &numbytes_ok, &Overlap);
		Sleep(t);
		WriteFile(handle, outstart3, 1, &numbytes_ok, &Overlap);
		Sleep(t);
		WriteFile(handle, outstart4, 1, &numbytes_ok, &Overlap);
		Sleep(t);
		ReadFile(handle, in, ComState.cbInQue, &numbytes_ok, &Overlap);
		break;
	case 1: // get
		WriteFile(handle, outget1, 1, &numbytes_ok, &Overlap);
		Sleep(t);
		WriteFile(handle, outget2, 1, &numbytes_ok, &Overlap);
		Sleep(t);
		WriteFile(handle, outget3, 1, &numbytes_ok, &Overlap);
		Sleep(t);
		WriteFile(handle, outget4, 1, &numbytes_ok, &Overlap);
		Sleep(t);
		ReadFile(handle, in, ComState.cbInQue, &numbytes_ok, &Overlap);
		break;
	case 2: // close
		WriteFile(handle, outcl1, 1, &numbytes_ok, &Overlap);
		Sleep(t);
		WriteFile(handle, outcl2, 1, &numbytes_ok, &Overlap);
		Sleep(t);
		WriteFile(handle, outcl3, 1, &numbytes_ok, &Overlap);
		Sleep(t);
		WriteFile(handle, outcl4, 1, &numbytes_ok, &Overlap);
		Sleep(t);
		ReadFile(handle, in, ComState.cbInQue, &numbytes_ok, &Overlap);
		/*WriteFile(handle, outcl1, 1, &numbytes_ok, &Overlap);
		Sleep(t);
		WriteFile(handle, outcl2, 1, &numbytes_ok, &Overlap);
		Sleep(t);
		WriteFile(handle, outcl3, 1, &numbytes_ok, &Overlap);
		Sleep(t);
		WriteFile(handle, outcl4, 1, &numbytes_ok, &Overlap);*/
		break;
	case 3: // close
		WriteFile(handle, outsost1, 1, &numbytes_ok, &Overlap);
		Sleep(t);
		WriteFile(handle, outsost2, 1, &numbytes_ok, &Overlap);
		Sleep(t);
		WriteFile(handle, outsost3, 1, &numbytes_ok, &Overlap);
		Sleep(t);
		WriteFile(handle, outsost4, 1, &numbytes_ok, &Overlap);
		Sleep(t);
		ReadFile(handle, in, ComState.cbInQue, &numbytes_ok, &Overlap);
	}
}

// ---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner) : TForm(Owner) {
}

// ---------------------------------------------------------------------------
void __fastcall TForm1::ReadClick(TObject *Sender) {
	ClearCommError(handle, &temp, &ComState);


	send(1);
	//Sleep(5);
	ClearCommError(handle, &temp, &ComState); // опрос состояния буфера приема
	if (ComState.cbInQue > 0) // контроль количества байт в буфере
	{
		ReadFile(handle, in, ComState.cbInQue, &numbytes_ok, &Overlap);
		//PurgeComm(handle, PURGE_RXCLEAR);
		//PurgeComm(handle, PURGE_TXCLEAR);
	}
	if (in[0] == 0x15) {
		Label1->Caption = "ОШИБКА";
		Memo1->Lines->Add("ОШИБКА");
	}
	else {
		String d = in;
		d = d.Delete(1, 1);
		d = d.Delete(d.Length(), 1);
		Label1->Caption = d;
		Memo1->Lines->Add(d);
	}
}

// ---------------------------------------------------------------------------
void __fastcall TForm1::CloseClick(TObject *Sender) {
	if (handle) {
		send(2);

		Sleep(250);
		CloseHandle(handle);
		handle = 0;
		Label1->Caption = "0";
	}

}

// ---------------------------------------------------------------------------
void __fastcall TForm1::OpenClick(TObject *Sender) {

	String s = "\\\\.\\COM1"; // ComboBox1->Text;
	sbuf = s.t_str();
	handle = CreateFile(sbuf, GENERIC_READ | GENERIC_WRITE, 0, NULL,
		OPEN_EXISTING, FILE_FLAG_OVERLAPPED, NULL);
	// SetupComm(handle, 100, 100);
	COMMTIMEOUTS CommTimeOuts;
	CommTimeOuts.ReadIntervalTimeout = 50;
	CommTimeOuts.ReadTotalTimeoutMultiplier = 10;
	CommTimeOuts.ReadTotalTimeoutConstant = 5;
	CommTimeOuts.WriteTotalTimeoutMultiplier = 20;
	CommTimeOuts.WriteTotalTimeoutConstant = 5;
	SetCommTimeouts(handle, &CommTimeOuts);

	GetCommState(handle, &dcb);
	dcb.BaudRate = CBR_57600; // CBR_2400;  //  CBR_4800; CBR_9600;
	dcb.fBinary = TRUE;
	dcb.fOutxCtsFlow = FALSE;
	dcb.fOutxDsrFlow = FALSE;
	dcb.fDtrControl = DTR_CONTROL_DISABLE;
	dcb.fDsrSensitivity = FALSE;
	dcb.fNull = FALSE;
	dcb.fRtsControl = RTS_CONTROL_DISABLE;
	dcb.fAbortOnError = FALSE;
	dcb.ByteSize = 8;
	dcb.Parity = NOPARITY;
	dcb.StopBits = 0; // 0=1, 1=1.5, 2=2
	SetCommState(handle, &dcb);

	send(0);
}

// ---------------------------------------------------------------------------
void __fastcall TForm1::Button1Click(TObject *Sender) {
	Timer1->Enabled = true;
   //	Timer2->Enabled = true;
}

// ---------------------------------------------------------------------------
void __fastcall TForm1::Button2Click(TObject *Sender) {
	Timer1->Enabled = false;
	//Timer2->Enabled = false;
}

// ---------------------------------------------------------------------------
void __fastcall TForm1::Timer1Timer(TObject *Sender) {
	ReadClick(Form1);
}

// ---------------------------------------------------------------------------
void __fastcall TForm1::FormClose(TObject *Sender, TCloseAction &Action) {
	CloseClick(Form1);
}
// ---------------------------------------------------------------------------

void __fastcall TForm1::Timer2Timer(TObject *Sender)
{
 //send(3);
}
//---------------------------------------------------------------------------

