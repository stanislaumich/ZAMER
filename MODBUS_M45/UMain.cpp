// ---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
#include "UMain.h"
#include "modbus.h"
#include "DecoderBroker.h"
#include <string>
#include <System.IOUtils.hpp>
#include <Windows.h>
#include <Math.hpp>
#include <math.h>
// ---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
// #define ENABLE_MODBUSPP_LOGGING

TForm1 *Form1;
float Skorost;
float Moshn;
float Temperature;
float SummaZn_Osn;
float OsnIzm;
int KolIzmOto;
bool busy;
String arcdir;
String IniFileName;
int zamercnt;
int Datchik;
int Interval;
float pP, pT, pS; // мои погрешности прибора
float pisp;
String nomer;
// ---------------------------------------------------------------------------
// ---------------------------------------------------------------------------
int __stdcall DataHandler(int DataType, void *Zapis, void *PContext);

// ---------------------------------------------------------------------------
void MySleep(int t) {
	__int64 ms = GetTickCount();
	while ((GetTickCount() - ms) < t) {
		Sleep(1);
		Application->ProcessMessages();
	}
}

// ---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)

	: TForm(Owner) {
	busy = false;
	IniFileName = ExtractFilePath(Application->ExeName) + "\\settings.ini";
	TIniFile *Ini = new TIniFile(IniFileName);
	int l = Ini->ReadInteger("Position", "Left", 100);
	int t = Ini->ReadInteger("Position", "Top", 100);
	Form1->Left = l;
	Form1->Top = t;
	Datchik = Ini->ReadInteger("DECODER", "Datchik", 4);
	Edit1->Text = FloatToStr(Ini->ReadFloat("DECODER", "Torque",0));
	Edit2->Text = FloatToStr(Ini->ReadFloat("DECODER", "Speed", 0));
	Edit3->Text = FloatToStr(Ini->ReadFloat("DECODER", "Power", 0));
	Ini->Free();
}
// ---------------------------------------------------------------------------
void __fastcall TForm1::BConnect() {
	char ServerAddress[300];
	AnsiString AS;
	struct _ParamComPort ParamComPort;
	int PortBase = 1;
	AS = "IT42E9";
	strcpy(ServerAddress, AS.c_str());
	int NKan = 1;
	PSpecialParametrs = (struct _SpecialParametrs*)calloc
		(sizeof(struct _SpecialParametrs), 1);
	PSpecialParametrs->AveragingFactor = 10; // Data Averaging Coefficient
	PSpecialParametrs->SpeedMeasurementPeriod = 50;
	// Period of measurement of speed
	PSpecialParametrs->ComPortNumber = 1;
	PSpecialParametrs->MODBUS_DeviceAddress = 1;
	UnicodeString US = 0;
	ParamComPort.BaudRate = StrToInt(US);
	ParamComPort.BiteSize = 8;
	ParamComPort.Parity = 0;
	ParamComPort.StopBits = 0;
	PSpecialParametrs->PParamComPort = &ParamComPort;
	PSpecialParametrs->ServerAddress = ServerAddress;
	// Decoder address on the local network
	PSpecialParametrs->AnotherServerBasePortNumber = PortBase;
	// The base address of the decoder port
	PSpecialParametrs->EthernetProtocolType = 0;
	// ................... Creating a decoder
	/*
	 #define USB_DECODER                   0
	 #define MODBUS_DECODER                1
	 #define COMPORT_DECODER               2
	 #define REMOTE_DECODER                3
	 #define SIMULATOR_DECODER             4
	 #define ETHERNET_DECODER_T37          5
	 #define USB_DECODER_T35               6
	 #define MODBUS_DECODER_T36            7
	 #define COMPORT_DECODER_T32           8
	 #define COMPORT_DECODER_T42           9
	 #define USB_DECODER_T45               10
	 #define MODBUS_DECODER_T46            11
	 #define USB_INDICATOR                 15
	 #define COMPORT_INDICATOR             16
	 #define MODBUS_INDICATOR              17
	 #define ETHERNET_INDICATOR            18
	 */
	int dectype = Datchik;
	PDecoder = (TDecoder*)DecoderCreate(1, // NKan,
		dectype, // DecoderType,
		DataHandler, this, PSpecialParametrs);
	free(PSpecialParametrs);
	// ................... If the decoder could not be created
	if (PDecoder == NULL) {
		Memo1->Lines->Add("Декодер М не может быть создан");
		return;
	}
	// ................... Opening a decoder for streaming
	int Kod = DecoderOpen(PDecoder, 1);
	if (Kod != 0) {
		Memo1->Lines->Add("Невозможно открыть декодер М");
		return;
	}
	else {
	   //	Memo1->Lines->Add("Декодер М соединен");
	}
}

// ---------------------------------------------------------------------------
int __stdcall DataHandler(int DataType, void * PZapis, void * PContext) {
	struct _DataFrame * PDataFrame;
	TForm1 * PForm1 = (TForm1*) PContext;
	PDataFrame = (struct _DataFrame*) PZapis;
	// PForm1-> SostDat_CrSe-> Enter ();
	busy = true;
	OsnIzm = PDataFrame->OsnIzmVel[0];
	SummaZn_Osn += PDataFrame->OsnIzmVel[0];
	if (SummaZn_Osn != 0)
		KolIzmOto++;
	Temperature = PDataFrame->Temper;
	Skorost = PDataFrame->Skorost;
	Moshn = PDataFrame->Moschnost;
	busy = false;
	// PForm1-> SostDat_CrSe-> Leave ();
	return 0;
}

/*

 // ................... Closing the decoder
 if (PDecoder != NULL) {
 DecoderClose(PDecoder);
 PDecoder = NULL;
 }
 Memo1->Lines->Add("Декодер М разъединен");
 */
// ---------------------------------------------------------------------------
void __fastcall TForm1::Button2Click(TObject *Sender) {
	// ................... Closing the decoder
	if (PDecoder != NULL) {
		DecoderClose(PDecoder);
		PDecoder = NULL;
	}
	//Memo1->Lines->Add("Декодер М разъединен");
}

// ---------------------------------------------------------------------------
void __fastcall TForm1::FormCloseQuery(TObject *Sender, bool &CanClose) {
	if (PDecoder != NULL) {
		DecoderClose(PDecoder);
		PDecoder = NULL;
	}
	///////////////////
	TIniFile *Ini = new TIniFile(ExtractFilePath(ParamStr(0)) +
		"\\settings.ini");
	TRect *r = new TRect;
	GetWindowRect(this->Handle, r);
	int l = r->Left;
	int t = r->Top;
	Ini->WriteString("Position", "Left", IntToStr(l));
	Ini->WriteString("Position", "Top", IntToStr(t));

	Ini->WriteFloat("DECODER", "Torque", StrToFloat(Edit1->Text));
	Ini->WriteFloat("DECODER", "Speed", StrToFloat(Edit2->Text));
	Ini->WriteFloat("DECODER", "Power", StrToFloat(Edit3->Text));

	Ini->WriteInteger("DECODER", "Datchik", Datchik);
	Ini->Free();
}

// ---------------------------------------------------------------------------
void __fastcall TForm1::Timer1Timer(TObject *Sender) {
	Application->ProcessMessages();
	// ---внесение данных в базу---
	try {
		Query1->SQL->Clear();
		Query1->SQL->Add("INSERT INTO zamertmp (torq,rot,power,pnom,nomer)values( ");
		Query1->SQL->Add(QuotedStr(FormatFloat("0.000", OsnIzm + pT)) + ", ");
		Query1->SQL->Add(QuotedStr(FormatFloat("0.000", Skorost + pS)) + ", ");
		Query1->SQL->Add(QuotedStr(FormatFloat("0.000", Moshn + pP)) +  ", ");
		Query1->SQL->Add(QuotedStr(FormatFloat("0.000", pisp)) +  ", ");
		Query1->SQL->Add(QuotedStr(nomer)+ ") ");
		Query1->ExecSQL();
	}
	catch (...) {
	}
	Application->ProcessMessages();
}

// ---------------------------------------------------------------------------

void __fastcall TForm1::Timer3Timer(TObject *Sender) {

	Label12->Caption = FormatFloat("0.00", Skorost + pS);
	Label13->Caption = FormatFloat("0.00", Moshn + pP);
	Label11->Caption = FormatFloat("0.00", OsnIzm + pT);
	// while (busy);
	try {
		Query2->SQL->Clear();
		Query2->SQL->Add("update zamer set ");
		Query2->SQL->Add("torq = " + QuotedStr(FormatFloat("0.000",
			OsnIzm + pT)) + ", ");
		Query2->SQL->Add("rot = " + QuotedStr(FormatFloat("0.000",
			Skorost + pS)) + ", ");
		Query2->SQL->Add("power = " + QuotedStr(FormatFloat("0.000",
			Moshn + pP)) + "");
		Query2->ExecSQL();
		Query2->SQL->Clear();
		Query2->SQL->Add("select * from command ");
		Query2->Open();
	}
	catch (...) {
	}
	String dop = 0;
	String file = 0;


	if (Query2->RecordCount > 0) {
		dop = Query2->FieldByName("command")->AsString;
		file = Query2->FieldByName("filename")->AsString;
        pisp = StrToFloat(file);
		nomer = Query2->FieldByName("nomer")->AsString;
		Datchik = Query2->FieldByName("dat")->AsInteger;
		Interval=Query2->FieldByName("interval")->AsInteger;
		//////////////////////////////////
		if (dop == "1") {
			Datchik = Query2->FieldByName("dat")->AsInteger;
			Query1->SQL->Clear();
			Query1->SQL->Text = "truncate table zamertmp";
			Query1->ExecSQL();
			BConnect();
			Memo1->Lines->Add("Запущена серия замеров");
			Timer1->Interval = Interval;
			Timer1->Enabled = true;
			Query2->SQL->Clear();
			Query2->SQL->Add("truncate table command");
			Query2->ExecSQL();
		}
		//////////////////////////////////////////
		else if (dop == "0") {
			Timer1->Enabled = false;
			MySleep(100);
			try {
				Query2->SQL->Clear();
				Query2->SQL->Add("truncate table command");
				Query2->ExecSQL();
			}
			catch (...) {
			}

			Memo1->Lines->Add("Остановлена серия замеров");
		}
		////////////////////////////////////////////////
		else if (dop == "3") {
			Timer1->Enabled = false;
			try {
				if (PDecoder != NULL) {
					DecoderClose(PDecoder);
					PDecoder = NULL;
				}
			}
			catch (...) {
			}
			try {
				Query2->SQL->Clear();
				Query2->SQL->Add("truncate table command");
				Query2->ExecSQL();
			}
			catch (...) {
			}
			Application->Terminate();
		}
	}
	////////////////////////////////////////////////
	Application->ProcessMessages();
}
// ---------------------------------------------------------------------------

void __fastcall TForm1::Button1Click(TObject *Sender) {
	BConnect();
}

// ---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender) {
	TIniFile *Ini = new TIniFile(ExtractFilePath(ParamStr(0)) +
		"\\settings.ini");
	TRect *r = new TRect;
	GetWindowRect(this->Handle, r);
	int l = r->Left;
	int t = r->Top;
	Form1->Left = Ini->ReadInteger("Position", "Left", 10);
	Form1->Top = Ini->ReadInteger("Position", "Top", 10);
	Datchik = Ini->ReadInteger("DECODER", "Datchik", 4);
	Ini->Free();
	Query2->SQL->Clear();
	Query2->SQL->Text = "truncate table command";
	Query2->ExecSQL();
	BitBtn1->Click();
	Timer3->Enabled = true;
	// BConnect();
}
// ---------------------------------------------------------------------------

void __fastcall TForm1::BitBtn1Click(TObject *Sender) {
	pP = StrToFloat(Edit3->Text);
	pS = StrToFloat(Edit2->Text);
	pT = StrToFloat(Edit1->Text);
}
// ---------------------------------------------------------------------------

void __fastcall TForm1::FormActivate(TObject *Sender) {
	BConnect();
}
// ---------------------------------------------------------------------------
