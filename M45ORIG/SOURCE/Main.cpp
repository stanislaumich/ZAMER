// ---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
#include "DecoderBroker.h"
#include "Main.h"
#include <Math.hpp>
#include <math.h>
// ---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

TForm1 *Form1;
float Znachenie;
float pisp;
float corr=0;
String nomer;
int Datchik;
int Interval;

bool EN=false;

 const int reflcnt=10;
int refltime = 0;
float SpeedMeasurement=100;

String IniFileName;
struct {float n;
float m;
float p;
}c;

// ---------------------------------------------------------------------------
// ������ �������� ��� ����������� �������� ���������� ��������
char *MasFormatovRas[4] = {"%4.0f", "%4.2f", "%4.1f", "%4.3f"};

// ---------------------------------------------------------------------------
int __stdcall DataHandler(int DataType, void *Zapis, void *PContext);

// ---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner) : TForm(Owner) {
	TIniFile *Ini = new TIniFile(ExtractFilePath(ParamStr(0)) +
		"\\settings.ini");
	TRect *r = new TRect;
	GetWindowRect(this->Handle, r);
	int l = r->Left;
	int t = r->Top;
	Form1->Left = Ini->ReadInteger("Position", "Left", 10);
	Form1->Top = Ini->ReadInteger("Position", "Top", 10);
	DecoderType = Ini->ReadInteger("DECODER", "Datchik", 4);
	Ini->Free();
	EstID = false;
	EstIzm = false;
	PDecoder = NULL;
	BStart->Enabled = false;
	BStop->Enabled = false;
	BDisconnect->Enabled = false;
	// ................... ��� ������ ����� ������
	SostDat_CrSe = new TCriticalSection();
	Temperature = 0;
}

// --------------------- ������ "����������� � �������"
void __fastcall TForm1::BConnectClick(TObject *Sender) {
	char ServerAddress[300];
	AnsiString AS;
	struct _ParamComPort ParamComPort;
	/* */
	// DecoderType = SIMULATOR_DECODER;
	// DecoderType = USB_DECODER_T35;

	PortBase = StrToInt(EPortNumber->Text);
	AS = EServerAddress->Text;
	strcpy(ServerAddress, AS.c_str());

	NKan = 1;
	PSpecialParametrs = (struct _SpecialParametrs*)calloc
		(sizeof(struct _SpecialParametrs), 1);
	PSpecialParametrs->AveragingFactor = StrToInt(EAveragingFactor->Text);
	// ����������� ���������� ������
	PSpecialParametrs->SpeedMeasurementPeriod = SpeedMeasurement;
	// ������ ��������� ������� ��������
	PSpecialParametrs->ComPortNumber = StrToInt(EComPortNumber->Text);
	PSpecialParametrs->MODBUS_DeviceAddress = StrToInt(EUnitNumber->Text);
	UnicodeString US = CBBaudRate->Items->Strings[CBBaudRate->ItemIndex];
	ParamComPort.BaudRate = StrToInt(US);
	ParamComPort.BiteSize = 8;
	ParamComPort.Parity = 0;
	ParamComPort.StopBits = 0;
	PSpecialParametrs->PParamComPort = &ParamComPort;
	PSpecialParametrs->ServerAddress = ServerAddress;
	// ����� �������� � ��������� ����
	PSpecialParametrs->AnotherServerBasePortNumber = PortBase;
	// ������� ����� ����� ��������
	// ................... �������� ��������
	PDecoder = (TDecoder*)DecoderCreate(NKan, DecoderType, DataHandler, this,
		PSpecialParametrs);
	free(PSpecialParametrs);
	// ................... ���� ������� �� ������� �������
	if (PDecoder == NULL) {
		Memo1->Lines->Add("�� ������� ������� �������");
		return;
	}
	// ................... ����������� � ���������
	// int RetCode = PDecoder->AddListener(this, ZeroPointComputerTime, &ApparatusState);
	// ................... �������� �������� ��� ������ � ��������� ������
	int Kod = DecoderOpen(PDecoder, 1);
	if (Kod != 0) {
		Memo1->Lines->Add("�� ������� ������� �������");
		return;
	}
	else {
		Memo1->Lines->Add("������� ������");
	}
	BConnect->Enabled = false;
	BStart->Enabled = true;
	BStop->Enabled = false;
	BDisconnect->Enabled = true;
}

// --------------------- ������ "����� ���������"
void __fastcall TForm1::BStartClick(TObject *Sender) {
	BConnect->Enabled = false;
	BStart->Enabled = false;
	BStop->Enabled = true;
	BDisconnect->Enabled = true;
	EstIzm = true; // �� ������ �������� ���������
	KolIzmOto = 0;
	ReflectionTimer->Enabled = true;
}

// --------------------- ������ "���� ���������"
void __fastcall TForm1::BStopClick(TObject *Sender) {
	BConnect->Enabled = false;
	BStart->Enabled = true;
	BStop->Enabled = false;
	BDisconnect->Enabled = true;
	ReflectionTimer->Enabled = false;
	EstIzm = false; // �� ������ ����������� ���������
}

// --------------------- ������ "���������� �� �������"
void __fastcall TForm1::BDisconnectClick(TObject *Sender) {
	ReflectionTimer->Enabled = false;
	EstIzm = false; // �� ������ ����������� ���������
	EstID = false;
	// ................... �������� ��������
	if (PDecoder != NULL) {
		DecoderClose(PDecoder);
		PDecoder = NULL;
	}
	Memo1->Lines->Add("������� ������");
	BConnect->Enabled = true;
	BStart->Enabled = false;
	BStop->Enabled = false;
	BDisconnect->Enabled = false;
}

// --------------------- �������� �����
void __fastcall TForm1::FormClose(TObject *Sender, TCloseAction &Action) {
	BDisconnectClick(this);
	Action = caFree;
}

// --------------------- ���������� ������, ����������� �� ��������
int __stdcall DataHandler(int DataType, void *PZapis, void *PContext) {
	struct _DataFrame *PDataFrame;
	TForm1 *PForm1 = (TForm1*)PContext;
	switch (DataType) {
	case DATA_TYPE_DATA:
		if (!PForm1->EstID)
			return 0;
		if (!PForm1->EstIzm)
			return 0;
		/////////////////////////////////////////////////////////
		PDataFrame = (struct _DataFrame*)PZapis;
		PForm1->SostDat_CrSe->Enter();
			PForm1->SummaZn_Osn += PDataFrame->OsnIzmVel[0]+corr;
			PForm1->KolIzmOto++;
			PForm1->Temperature = PDataFrame->Temper;
			PForm1->Skorost = PDataFrame->Skorost;
			PForm1->Moshn = PDataFrame->Moschnost;
		PForm1->SostDat_CrSe->Leave();
		break;

	case DATA_TYPE_MESSAGES: // ��� ������ - ��������� ��������
		struct _MessageFrame * PMessageFrame = (struct _MessageFrame*)PZapis;
		PostMessage(Form1->Handle, WM_USER + 1,
			PMessageFrame->MessageCode, NULL);
		break;
	}
	return 0;
}

// --------------------- ��������� ��������� #1
void __fastcall TForm1::UserMessage(TMessage& msg) {
	int retkod;
	char *PMessage;
	AnsiString AS;

	char Message1[] = "������� ������������� �������";
	char Message2[] = "���� �������������";
	char Message3[] = "��������� ��������������";
	char Message4[] = "������ ����������";
	char Message5[] = "������ �����������";
	char Message6[] = "������� ����������";
	char Message7[] = "������� �����������";
	char Message8[] = "��������� ������-��������";
	char Message9[] = "������ �����-������";
	char Message10[] = "��� ����� � ������";
	char Message11[] = "��� ������� � ����";
	char Message12[] = "�������������� �������������";
	char Message13[] = "��� ��������� �� ��������";
	char Message14[] = "������ ������ ������ ��� ��������� ������";
	char Message15[] = "���� ����������� ������� ���������";
	int Razmernost;
	int DataType;
	int Index;

	DataType = msg.WParam;
	switch (DataType) {
	case MESSAGE_POLUCHEN_ID: // ������� �������������
		// ............... ������ ���������� ������ �������
		retkod = DecoderReadTranducerParametrs(PDecoder, &SK, StrokaDatchikID);
		if (retkod != 0) {
			PMessage = "�� ������� ��������� ��������� �����";
		}
		else {
			PMessage = Message1;
		}
		// ............... ����������� �������������� �������
		AS = StrokaDatchikID;
		EDatchikID->Text = AS;
		// ................... ������� ����������� ������
		Razmernost = SK.ID_Datchik[1] >> 4; // ����� 3
		// ................... ���������� ������� ��� ��������� �������� �����������
		switch (Razmernost) {
		case 0:
		case 3:
		case 6:
		case 9:
		case 12:
			Index = 0;
			break;
		case 1:
		case 4:
		case 7:
		case 10:
		case 14:
			Index = 1;
			break;
		case 2:
		case 5:
		case 8:
		case 11:
		case 13:
			Index = 2;
			break;
		case 15:
			Index = 3;
			break;
		}
		FormatOtobrajenia = MasFormatovRas[Index];
		EstID = true;
		break;

	case MESSAGE_SBOI_SYNCHRO: // ���� �������������
		PMessage = Message2;
		break;
	case MESSAGE_VOSST_SYNCHRO: // �������������� �������������
		PMessage = Message12;
		break;
	case MESSAGE_OSHIBKA_ID: // ��������� ��������������
		PMessage = Message3;
		break;
	case MESSAGE_DATCHIK_OFF: // ������ ����������
		PMessage = Message4;
		break;
	case MESSAGE_DATCHIK_ON: // ������ �����������
		PMessage = Message5;
		break;
	case MESSAGE_DECODER_OFF: // ������� ����������
		PMessage = Message6;
		break;
	case MESSAGE_DECODER_ON: // ������� �����������
		PMessage = Message7;
		break;
	case MESSAGE_ISKAJENIA: // ��������� ������-��������
		PMessage = Message8;
		break;
	case MESSAGE_OSHIBKA_IO: // ������ �����-������
		PMessage = Message9;
		break;
	case MESSAGE_NET_PAUSY: // ��� ����� � ������
		PMessage = Message10;
		break;
	case MESSAGE_NETWORK_OFF: // ��� ������� � ����
		PMessage = Message11;
		break;
	case MESSAGE_BUFFER_LOSS: // ������ ������ ������ ��� ��������� ������
		PMessage = Message14;
		break;
	case MESSAGE_MESSAGEQ_OVERFL: // ���� ������������ ������� ���������
		PMessage = Message15;
		break;
	default:
		PMessage = NULL;
		break;
	}
	if (PMessage != NULL) {
		Memo1->Lines->Add(PMessage);
	}
	return;
}

// --------------------- ���������� ������� ��� �������� �������� �� ������� �����
void __fastcall TForm1::ReflectionTimerTimer(TObject *Sender)
{
	AnsiString AS;
	int i;
	refltime++;
	if (refltime==reflcnt) {
		SostDat_CrSe->Enter();
		STOsnIzmVel->Caption = AS.sprintf(FormatOtobrajenia, abs(Znachenie));
		// ................... ������������ ������ ��� ����������� �����������
		if (Temperature < -40) {
			STTemper->Caption = "-";
		}
		else {
			STTemper->Caption = AS.sprintf("%4.1f", Temperature);
		}
		// ................... ������������ ������ ��� ����������� �������� �� ������
		if (Skorost < 1000) {
			STSkorost->Caption = AS.sprintf("%4.1f", abs(Skorost));
		}
		else {
			STSkorost->Caption = AS.sprintf("%4.0f", abs(Skorost));
		}
		// ................... ������������ ������ ��� ����������� �������� �� ������
		STMoschnost->Caption = AS.sprintf(FormatOtobrajenia, abs(Moshn));
		SostDat_CrSe->Leave();
		Application->ProcessMessages();
		refltime=0;
	} //////////////////////////////////////////////////////////////////////////////////////////

	if (KolIzmOto == 0)
		return;

	SostDat_CrSe->Enter();
		Znachenie = SummaZn_Osn / (double)KolIzmOto; // ������� ��������
		SummaZn_Osn = 0;
		KolIzmOto = 0;
	SostDat_CrSe->Leave();

	try {  //Form1->Moshn = Znachenie * abs(Skorost) / 9.546;
		QUpd->ParamByName("torq")->AsFloat = abs(Znachenie);
		QUpd->ParamByName("rot")->AsFloat = abs(Skorost);
		QUpd->ParamByName("power")->AsFloat = abs(Moshn);
		QUpd->ExecSQL();
		//STSkorost->Caption = AS.sprintf("%4.0f", abs(Skorost));
		}
	catch (...) {
				}

	if (EN){
		try {  //Form1->Moshn = Znachenie * abs(Skorost) / 9.546;
		//( :TORQ, :OT, :POWER,:NOMER, :PNOM )
			QIns->ParamByName("torq")->AsFloat = abs(Znachenie);
			QIns->ParamByName("rot")->AsFloat = abs(Skorost);
			QIns->ParamByName("power")->AsFloat = abs(Moshn);
			QIns->ParamByName("nomer")->AsString = nomer;
			QIns->ParamByName("pnom")->AsFloat = 0;
			QIns->ExecSQL();
			//STSkorost->Caption = AS.sprintf("%4.0f", abs(Skorost));
			}
		catch (...) {
	  				}
	}


}


// --------------------- �������� ������ �����������
void __fastcall TForm1::CBDecoderTypeChange(TObject *Sender) {
	LComPortNumber->Enabled = false;
	EComPortNumber->Enabled = false;
	LBaudRate->Enabled = false;
	CBBaudRate->Enabled = false;
	LUnitNumber->Enabled = false;
	EUnitNumber->Enabled = false;
	LServerAddress->Enabled = false;
	EServerAddress->Enabled = false;
	LPortNumber->Enabled = false;
	EPortNumber->Enabled = false;

	switch (CBDecoderType->ItemIndex) {
	case 0: // �25
		DecoderType = USB_DECODER;
		break;
	case 1: // �26
		DecoderType = MODBUS_DECODER;
		LComPortNumber->Enabled = true;
		EComPortNumber->Enabled = true;
		LBaudRate->Enabled = true;
		CBBaudRate->Enabled = true;
		LUnitNumber->Enabled = true;
		EUnitNumber->Enabled = true;
		break;
	case 2: // �32
		DecoderType = COMPORT_DECODER_T32;
		LComPortNumber->Enabled = true;
		EComPortNumber->Enabled = true;
		LBaudRate->Enabled = true;
		CBBaudRate->Enabled = true;
		break;
	case 3: // �35
		DecoderType = USB_DECODER_T35;
		break;
	case 4: // �36
		DecoderType = MODBUS_DECODER_T36;
		LComPortNumber->Enabled = true;
		EComPortNumber->Enabled = true;
		LBaudRate->Enabled = true;
		CBBaudRate->Enabled = true;
		LUnitNumber->Enabled = true;
		EUnitNumber->Enabled = true;
		break;
	case 5: // �37
		DecoderType = ETHERNET_DECODER_T37;
		LServerAddress->Enabled = true;
		EServerAddress->Enabled = true;
		LPortNumber->Enabled = true;
		EPortNumber->Enabled = true;
		break;
	case 6: // �42   2
		DecoderType = COMPORT_DECODER_T42;
		LComPortNumber->Enabled = true;
		EComPortNumber->Enabled = true;
		LBaudRate->Enabled = true;
		CBBaudRate->Enabled = true;
		break;
	case 7: // �45
		DecoderType = USB_DECODER_T45;
		break;
	case 8: // �46
		DecoderType = MODBUS_DECODER_T46;
		LComPortNumber->Enabled = true;
		EComPortNumber->Enabled = true;
		LBaudRate->Enabled = true;
		CBBaudRate->Enabled = true;
		LUnitNumber->Enabled = true;
		EUnitNumber->Enabled = true;
		break;
	case 9: // ���������
		DecoderType = SIMULATOR_DECODER;
		break;
	case 10: // T22
		DecoderType = COMPORT_DECODER;
		LComPortNumber->Enabled = true;
		EComPortNumber->Enabled = true;
		break;
	}
}

// ---------------------------------------------------------------------------

void __fastcall TForm1::FormCreate(TObject *Sender) {
	// BConnectClick(self);++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

    	TIniFile *Ini = new TIniFile(ExtractFilePath(ParamStr(0)) +
		"\\settings.ini");
	//TRect *r = new TRect;
	//GetWindowRect(this->Handle, r);
	//int l = r->Left;
	//int t = r->Top;
	//Ini->ReadString("Position", "Left", 10);
	//Ini->ReadString("Position", "Top", 10);
	/*
	Ini->WriteFloat("DECODER", "Torque", 0);
	Ini->WriteFloat("DECODER", "Speed", 0);
	Ini->WriteInteger("DECODER", "Average", 0);
	 */
	DecoderType = Ini->ReadInteger("DECODER", "Datchik", 10);

	corr = Ini->ReadFloat("Datchik", "Corr", 0 );
	Edit1->Text = Ini->ReadString("Datchik", "Corr", "0");
	Ini->Free();

	char ServerAddress[300];
	AnsiString AS;
	struct _ParamComPort ParamComPort;
	/* */
	// DecoderType = SIMULATOR_DECODER;
	// DecoderType = USB_DECODER_T35;
	PortBase = StrToInt(EPortNumber->Text);
	AS = EServerAddress->Text;
	strcpy(ServerAddress, AS.c_str());
	NKan = 1;
	PSpecialParametrs = (struct _SpecialParametrs*)calloc
		(sizeof(struct _SpecialParametrs), 1);
	PSpecialParametrs->AveragingFactor = StrToInt(EAveragingFactor->Text);
	// ����������� ���������� ������
	PSpecialParametrs->SpeedMeasurementPeriod = SpeedMeasurement;
	// ������ ��������� ������� ��������
	PSpecialParametrs->ComPortNumber = StrToInt(EComPortNumber->Text);
	PSpecialParametrs->MODBUS_DeviceAddress = StrToInt(EUnitNumber->Text);
	UnicodeString US = CBBaudRate->Items->Strings[CBBaudRate->ItemIndex];
	ParamComPort.BaudRate = StrToInt(US);
	ParamComPort.BiteSize = 8;
	ParamComPort.Parity = 0;
	ParamComPort.StopBits = 0;
	PSpecialParametrs->PParamComPort = &ParamComPort;
	PSpecialParametrs->ServerAddress = ServerAddress;
	// ����� �������� � ��������� ����
	PSpecialParametrs->AnotherServerBasePortNumber = PortBase;
	// ������� ����� ����� ��������
	// ................... �������� ��������
	PDecoder = (TDecoder*)DecoderCreate(NKan, DecoderType, DataHandler, this,
		PSpecialParametrs);
	free(PSpecialParametrs);
	// ................... ���� ������� �� ������� �������
	if (PDecoder == NULL) {
		Memo1->Lines->Add("�� ������� ������� �������");
		return;
	}
	// ................... ����������� � ���������
	// int RetCode = PDecoder->AddListener(this, ZeroPointComputerTime, &ApparatusState);
	// ................... �������� �������� ��� ������ � ��������� ������
	int Kod = DecoderOpen(PDecoder, 1);
	if (Kod != 0) {
		Memo1->Lines->Add("�� ������� ������� �������");
		return;
	}
	else {
		Memo1->Lines->Add("������� ������");

	}
	BConnect->Enabled = false;
	BStart->Enabled = true;
	BStop->Enabled = false;
	BDisconnect->Enabled = true;

	// BStartClick();+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	BConnect->Enabled = false;
	BStart->Enabled = false;
	BStop->Enabled = true;
	BDisconnect->Enabled = true;

	EstIzm = true; // �� ������ �������� ���������
	KolIzmOto = 0;
	ReflectionTimer->Enabled = true;
}
// ---------------------------------------------------------------------------

void __fastcall TForm1::FormCloseQuery(TObject *Sender, bool &CanClose) {
	TIniFile *Ini = new TIniFile(ExtractFilePath(ParamStr(0)) +
		"\\settings.ini");
	TRect *r = new TRect;
	GetWindowRect(this->Handle, r);
	int l = r->Left;
	int t = r->Top;
	Ini->WriteString("Position", "Left", IntToStr(l));
	Ini->WriteString("Position", "Top", IntToStr(t));

	Ini->WriteFloat("DECODER", "Torque", 0);
	Ini->WriteFloat("DECODER", "Speed", 0);
	Ini->WriteInteger("DECODER", "Average", 0);

	Ini->WriteInteger("DECODER", "Datchik", DecoderType);
	Ini->Free();
}
// ---------------------------------------------------------------------------

void __fastcall TForm1::BitBtn1Click(TObject *Sender)
{
	AnsiString AS;
	TIniFile *Ini = new TIniFile(ExtractFilePath(ParamStr(0)) +
			"\\settings.ini");
	corr = SimpleRoundTo((0-Znachenie),-2);
	Edit1->Text = FloatToStr(corr);
	Ini->WriteString("Datchik", "Corr", Edit1->Text );
	Ini->Free();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::TimerCommandTimer(TObject *Sender)
{
	String dop = 0;
	String file = 0;
	QCommand->SQL->Clear();
	QCommand->SQL->Add("select * from command");
	QCommand->Open();
	if (QCommand->RecordCount > 0)
	{
		dop = QCommand->FieldByName("command")->AsString;
		file = QCommand->FieldByName("filename")->AsString;
		pisp = StrToFloat(file);
		nomer = QCommand->FieldByName("nomer")->AsString;
		Datchik = QCommand->FieldByName("dat")->AsInteger;
		Interval = QCommand->FieldByName("interval")->AsInteger;
		//////////////////////////////////
		if (dop == "1") {
			Query1->SQL->Clear();
			Query1->SQL->Text = "truncate table zamertmp";
			Query1->ExecSQL();
			Memo1->Lines->Add("�������� ����� �������");
			QCommand->SQL->Clear();
			QCommand->SQL->Add("truncate table command");
			QCommand->ExecSQL();
			EN = true;
		}
		//////////////////////////////////////////
		else if (dop == "0") {
			try {
				EN = false;
                Memo1->Lines->Add("����������� ����� �������");
				QCommand->SQL->Clear();
				QCommand->SQL->Add("truncate table command");
				QCommand->ExecSQL();
			}
			catch (...) {
			}

		}
		////////////////////////////////////////////////
		else if (dop == "3") {

			try {
				if (PDecoder != NULL) {
					DecoderClose(PDecoder);
					PDecoder = NULL;
				}
			}
			catch (...) {
			}
			try {
				QCommand->SQL->Clear();
				QCommand->SQL->Add("truncate table command");
				QCommand->ExecSQL();
			}
			catch (...) {
			}
			Application->Terminate();
		}
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm1::BitBtn2Click(TObject *Sender)
{
 corr = 0;
 Edit1->Text = "0";
 	TIniFile *Ini = new TIniFile(ExtractFilePath(ParamStr(0)) +
			"\\settings.ini");
 Ini->WriteString("Datchik", "Corr", Edit1->Text );
	Ini->Free();
}
//---------------------------------------------------------------------------

