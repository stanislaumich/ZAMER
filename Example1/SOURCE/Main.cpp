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
boolean Connected;

float atorq[1000];
float arot[1000];
float apower[1000];
int acount;
int wr;
float corr;
String oldA = "25";
float mySkorost;
float myMoment, myMomentPrev;
float koeff=30/3.14159265358979323846;
float myMoshn=0;

// ---------------------------------------------------------------------------
// Array of formats for displaying the main measured value
char *MasFormatovRas[4] = {"%4.0f", "%4.2f", "%4.1f", "%4.3f"};

// ---------------------------------------------------------------------------

void __fastcall TForm1::MyData(TMessage &Message) {
	COPYDATASTRUCT* pCds;
	String s;
	int t,p1,p2,p3;
	pCds = (COPYDATASTRUCT*)Message.LParam;

	t = pCds->cbData;
	//s = IntToStr(t);
	const AnsiString sTest = (char*)pCds->lpData;
	char *request = new char[pCds->cbData];
	strncpy(request, (char*)pCds->lpData, pCds->cbData);
	//ShowMessage(request);
	p1 = StrToInt(request[1]);
	p2 = StrToInt(request[2]);
	p3 = StrToInt(request[3]);
	s =  IntToStr(p1*100+p2*10+p3);
	//Memo1->Lines->Add(request[0]);
	//Memo1->Lines->Add(request[1]);
	//Memo1->Lines->Add(request[2]);
	//Memo1->Lines->Add(request[3]);
	if (request[0] == '1') {
		Qtemp->SQL->Clear();
		Qtemp->SQL->Add("Truncate table zamertmp");
		Qtemp->ExecSQL();
		Qtemp->Close();

		oldA = EAvF->Text;

		EAvF->Text = s;

		BDisconnectClick(Form1);
		BConnectClick(Form1);

		wr = 1; // lets write
		Panel3->Color = clRed;
		Panel3->Caption = "ЗАПИСЬ";
	}
	if (request[0] == '0') {
		wr = 0; // do not write
		EAvF->Text = oldA;
		BDisconnectClick(Form1);
        BConnectClick(Form1);
		Panel3->Color = clBtnFace;
		Panel3->Caption = "ПРОСТОЙ";
	}
}

void __fastcall TForm1::MyStart(TMessage &Message) {
	Qtemp->SQL->Clear();
	Qtemp->SQL->Add("Truncate table zamertmp");
	Qtemp->ExecSQL();
	Qtemp->Close();
	wr = 1; // lets write
	Panel3->Color = clRed;
	Panel3->Caption = "ЗАПИСЬ";
}

void __fastcall TForm1::MyStop(TMessage &Message) {
	QCommand->Close();
	Qtemp->Close();
	Qtemp->SQL->Clear();
	Qtemp->SQL->Add("Delete from command where command in(0, 1)");
	Qtemp->ExecSQL();
	Qtemp->Close();
	wr = 0; // do not write
	Panel3->Color = clBtnFace;
	Panel3->Caption = "ПРОСТОЙ";
}

__fastcall TForm1::TForm1(TComponent* Owner) : TForm(Owner) {
	EstIzm = false;
	PDecoder = NULL;
	BDisconnect->Enabled = false;
	BReadBase->Enabled = false;
	BReadSpeed->Enabled = false;
	BReadTemperature->Enabled = false;
	BReadComplex->Enabled = false;
	BReadMessage->Enabled = false;
	TRect *r = new TRect;
	TIniFile *Ini = new TIniFile(ExtractFilePath(ParamStr(0)) +
		"\settings45.ini");
	Form1->Left = Ini->ReadInteger("Position", "Left", 10);
	Form1->Top = Ini->ReadInteger("Position", "Top", 10);
	int Ind = Ini->ReadInteger("DECODER", "Datchik", 7);
	corr = Ini->ReadFloat("Datchik", "Corr", 0);
	EAvF->Text = Ini->ReadString("Datchik", "AVG", "1");
    ESpeed->Text = Ini->ReadString("Datchik", "SPEED","500");
	int g = Ini->ReadInteger("FILTER", "Type", 6);
	switch (g) {
	case 1:
		RadioButton1->Checked = true;
		break;
	case 2:
		RadioButton2->Checked = true;
		break;
	case 3:
		RadioButton3->Checked = true;
		break;
	case 4:
		RadioButton4->Checked = true;
		break;
	case 5:
		RadioButton5->Checked = true;
		break;
	case 6:
		RadioButton6->Checked = true;
		break;
	}

	Ini->Free();
	wr = 0;
	CBDecoderType->ItemIndex = Ind; // 5;
	CBDecoderTypeChange(this);
	Connected = false;
	Qtemp->Close();
	Qtemp->SQL->Clear();
	Qtemp->SQL->Add("Delete from command where command between 0 and 1");
	Qtemp->ExecSQL();
	// T45FormHeader
	Qtemp->Close();
	Qtemp->SQL->Clear();
	Qtemp->SQL->Add("Update zini set value='" + Form1->Caption +
		"' where name='T45FormHeader'");
	Qtemp->ExecSQL();
	Edit1->Text = FloatToStr(corr);
	myMomentPrev = 0;
}

// --------------------- "Open" BUTTON
void __fastcall TForm1::BConnectClick(TObject *Sender) {
	char ServerAddress[300];
	AnsiString AS;
	int Index;
	struct _ParamComPort ParamComPort;
	int ApparatusState;
	int i;

	PortBase = StrToInt(EPortNumber->Text);
	AS = EServerAddress->Text;
	strcpy(ServerAddress, AS.c_str());

	NKan = 1;

	BConnect->Enabled = false;
	PSpecialParametrs = (struct _SpecialParametrs*) calloc
		(sizeof(struct _SpecialParametrs), 1);
	PSpecialParametrs->AveragingFactor = StrToInt(EAvF->Text);//StrToInt(EAveragingFactor->Text);
	// Data Averaging Coefficient
	PSpecialParametrs->SpeedMeasurementPeriod = StrToInt(ESpeed->Text);
	// Period of measurement of speed
	PSpecialParametrs->ComPortNumber = StrToInt(EComPortNumber->Text);
	PSpecialParametrs->MODBUS_DeviceAddress = StrToInt(EUnitNumber->Text);
	UnicodeString US = CBBaudRate->Items->Strings[CBBaudRate->ItemIndex];
	ParamComPort.BaudRate = StrToInt(US);
	ParamComPort.BiteSize = 8;
	ParamComPort.Parity = 0;
	ParamComPort.StopBits = 0;
	PSpecialParametrs->PParamComPort = &ParamComPort;
	PSpecialParametrs->ServerAddress = ServerAddress;
	// Decoder address on the local network
	PSpecialParametrs->AnotherServerBasePortNumber = PortBase;
	// The base address of the decoder port
	PSpecialParametrs->EthernetProtocolType = CB_Protocol->ItemIndex;
	// ................... Creating a decoder
	PDecoder = (TDecoder*) DecoderCreate(NKan, DecoderType, NULL, NULL,
		PSpecialParametrs);
	free(PSpecialParametrs);
	// ................... Opening the decoder
	int Kod = DecoderOpen(PDecoder, 0);
	if (Kod != 0) {
		Memo1->Lines->Add("Failed to open the decoder");
		return;
	}
	else {
		Memo1->Lines->Add("Decoder is open");
		Connected = true;
	}
	for (i = 0; i < 3; i++) {
		// ................... Read the service channel of the sensor
		Kod = DecoderReadTranducerParametrs(PDecoder, &SK, StrokaDatchikID);
		if (Kod == 0)
			break;
		Memo1->Lines->Add("Could not read service channel");
		Pause(100);
		continue;
	}
	if (i == 3) {
		Memo1->Lines->Add("Probably the sensor is not connected");
		return;
	}
	else {
		Memo1->Lines->Add("Service Channel Read");
	}
	// ................... Display the sensor ID
	AS = StrokaDatchikID;
	EDatchikID->Text = AS;
	// ................... Retrieve data dimension
	int Razmernost = SK.ID_Datchik[1] >> 4; // Number 3
	// ................... Calculation of the index for setting display formats
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
	//case 7:
	case 10:
	case 14:
		Index = 1;
		break;
	case 2:
	case 5:
    case 7:
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

	BDisconnect->Enabled = true;
	BReadBase->Enabled = true;
	BReadSpeed->Enabled = true;
	BReadTemperature->Enabled = true;
	BReadComplex->Enabled = true;
	BReadMessage->Enabled = true;
	Button1->Enabled = true;
	Memo2->Lines->Clear();
}

// --------------------- "Close" BUTTON
void __fastcall TForm1::BDisconnectClick(TObject *Sender) {
	if (PDecoder != NULL) {
		DecoderClose(PDecoder);
		PDecoder = NULL;
		Memo1->Lines->Add("Decoder is closed");
		Connected = false;
	}
	BConnect->Enabled = true;
	BDisconnect->Enabled = false;
	BReadBase->Enabled = false;
	BReadSpeed->Enabled = false;
	BReadTemperature->Enabled = false;
	BReadComplex->Enabled = false;
	BReadMessage->Enabled = false;
	// TimerMain->Enabled = false;
	Button1->Enabled = false;
	Memo2->Lines->SaveToFile("RESULT.CSV");
}

// --------------------- CLOSING THE FORM
void __fastcall TForm1::FormClose(TObject *Sender, TCloseAction & Action) {
	BDisconnectClick(this);
	Action = caFree;
	TIniFile *Ini = new TIniFile(ExtractFilePath(ParamStr(0)) +
		"\settings45.ini");
	Memo2->Lines->SaveToFile("res.csv");
	// int l = r->Left;
	// int t = r->Top;
	Ini->WriteInteger("Position", "Left", Form1->Left);
	Ini->WriteInteger("Position", "Top", Form1->Top);
	Ini->WriteString("Datchik", "AVG", EAvF->Text);
	Ini->WriteString("Datchik", "SPEED", ESpeed->Text);
	Ini->WriteString("Datchik", "Corr", Edit1->Text);
	if (RadioButton1->Checked)
		Ini->WriteInteger("FILTER", "Type", 1);
	if (RadioButton2->Checked)
		Ini->WriteInteger("FILTER", "Type", 2);
	if (RadioButton3->Checked)
		Ini->WriteInteger("FILTER", "Type", 3);
	if (RadioButton4->Checked)
		Ini->WriteInteger("FILTER", "Type", 4);
	if (RadioButton5->Checked)
		Ini->WriteInteger("FILTER", "Type", 5);
	if (RadioButton6->Checked)
		Ini->WriteInteger("FILTER", "Type", 6);
    //Ini->WriteInteger("FILTER", "Type", 6);
	Ini->Free();
}

// --------------------- Reading the main measured value
void __fastcall TForm1::BReadBaseClick(TObject *Sender) {
	int Kod;
	char OtvetServera[512];
	DWORD PBytesRead;
	union _Otvet *POutputBuffer;
	AnsiString ASCaption;
	float Znachenie;

	// ................... Reading information from the decoder
	if (PDecoder != NULL) {
		Kod = DecoderReadBase(PDecoder, OtvetServera, &PBytesRead);
	}
	if (Kod != 0) {
		Memo1->Lines->Add("Failed to read the main measured value");
		return;
	}
	// ................... Answer format
	POutputBuffer = (union _Otvet*) OtvetServera;
	// ................... Formation of a line for displaying the main measurement value in the panel
	Znachenie = POutputBuffer->Data.MD.OsnIzmVel;
	ASCaption.sprintf(FormatOtobrajenia, Znachenie);
	STOsnIzmVel->Caption = ASCaption;
}

// --------------------- Reading speed and power
void __fastcall TForm1::BReadSpeedClick(TObject *Sender) {
	int Kod, i;
	char OtvetServera[512];
	DWORD PBytesRead;
	union _Otvet *POutputBuffer;
	AnsiString ASCaption;
	float Znachenie;

	// ................... Reading information from the decoder
	if (PDecoder != NULL) {
		Kod = DecoderReadSpeed(PDecoder, OtvetServera, &PBytesRead);
	}
	if (Kod != 0) {
		Memo1->Lines->Add("Failed to read speed and power");
		return;
	}
	// ................... Answer format
	POutputBuffer = (union _Otvet*) OtvetServera;
	// ................... Formation of a line for displaying speed on the panel
	Znachenie = POutputBuffer->Data.MD.RS.Skorost;
	if (Znachenie < 1000) {
		STSkorost->Caption = ASCaption.sprintf("% 4.1f", Znachenie);
	}
	else {
		STSkorost->Caption = ASCaption.sprintf("% 4.0f", Znachenie);
	}
	// ................... Formation of a line to display power on the panel
	Znachenie = POutputBuffer->Data.MD.RS.Moschnost;
	STMoschnost->Caption = ASCaption.sprintf(FormatOtobrajenia, Znachenie);
}

// --------------------- Reading temperature
void __fastcall TForm1::BReadTemperatureClick(TObject *Sender) {
	int Kod, i;
	char OtvetServera[512];
	DWORD PBytesRead;
	union _Otvet *POutputBuffer;
	AnsiString ASCaption;
	float Znachenie;

	// ................... Reading information from the decoder
	if (PDecoder != NULL) {
		Kod = DecoderReadTemperature(PDecoder, OtvetServera, &PBytesRead);
	}
	if (Kod != 0) {
		Memo1->Lines->Add("Could not read temperature");
		return;
	}
	// ................... Answer format
	POutputBuffer = (union _Otvet*) OtvetServera;
	// ................... Formation of a line for displaying temperature
	Znachenie = POutputBuffer->Data.MD.Temper;
	if (Znachenie < -40) {
		STTemper->Caption = "";
	}
	else {
		STTemper->Caption = ASCaption.sprintf("% 4.1f", Znachenie);
	}
}

// -----------------------------------------------------------------------------------------------------------------------
// Фильтры
const int NUM_READ = 10; // количество усреднений для средних арифм. фильтров

// растянутое среднее арифметическое
float midArifm2(float newVal) {
	static byte counter = 0; // счётчик
	static float prevResult = 0; // хранит предыдущее готовое значение
	static float sum = 0; // сумма
	sum += newVal; // суммируем новое значение
	counter++; // счётчик++
	if (counter == NUM_READ) { // достигли кол-ва измерений
		prevResult = sum / NUM_READ; // считаем среднее
		sum = 0; // обнуляем сумму
		counter = 0; // сброс счётчика
	}
	return prevResult;
}

// -------------------------------------------------------------------------------
float runMiddleArifmOptim(float newVal) {
	static int t = 0;
	static float vals[NUM_READ];
	static float average = 0;

	if (++t >= NUM_READ)
		t = 0; // перемотка t
        average -= vals[t]; // вычитаем старое
	average += newVal; // прибавляем новое
	vals[t] = newVal; // запоминаем в массив
	return ((float)average / NUM_READ);

}
// -------------------------------------------------------------------------------
float k = 0.1; // коэффициент фильтрации, 0.0-1.0

// бегущее среднее
float expRunningAverage(float newVal) {
	static float filVal = 0;
	filVal += (newVal - filVal) * k;
	return filVal;
}

// ------------------------------------------------------------------------------
float expRunningAverageAdaptive(float newVal) {
	static float filVal = 0;
	float k;
	// резкость фильтра зависит от модуля разности значений
	if (abs(newVal - filVal) > 1.5)
		k = 0.9;
	else
		k = 0.03;

	filVal += (newVal - filVal) * k;
	return filVal;
}
// ------------------------------------------------------------------------------
float dt = 0.02;
float sigma_process = 3.0;
float sigma_noise = 0.7;

float ABfilter(float newVal) {
	static float xk_1, vk_1, a, b;
	static float xk, vk, rk;
	static float xm;
	float lambda = (float)sigma_process * dt * dt / sigma_noise;
	float r = (4 + lambda - (float)sqrt(8 * lambda + lambda * lambda)) / 4;
	a = (float)1 - r * r;
	b = (float)2 * (2 - a) - 4 * (float)sqrt(1 - a);
	xm = newVal;
	xk = xk_1 + ((float) vk_1 * dt);
	vk = vk_1;
	rk = xm - xk;
	xk += (float)a * rk;
	vk += (float)(b * rk) / dt;
	xk_1 = xk;
	vk_1 = vk;
	return xk_1;
}

// -----------------------------------------------------------------------------------------------------------------------
// --------------------- Read all measured values
void __fastcall TForm1::BReadComplexClick(TObject *Sender) {
	int Kod, i;
	char OtvetServera[512];
	DWORD PBytesRead;
	union _Otvet *POutputBuffer;
	AnsiString ASCaption;
	float Znachenie, AbsZnachenie;

	// ................... Reading information from the decoder
	if (PDecoder != NULL) {
		Kod = DecoderReadComplex(PDecoder, OtvetServera, &PBytesRead);
	}
	if (Kod != 0) {
		Memo1->Lines->Add("Failed to read measured values");
		return;
	}
	// ................... Answer format
	POutputBuffer = (union _Otvet*) OtvetServera;
	// ................... Formation of a line for displaying the main measurement value in the panel
	Znachenie = POutputBuffer->Data.MD.RC.OsnIzmVel;
	Znachenie = Znachenie + corr;


	//myMoment = (myMomentPrev + Znachenie ) / 2;
	myMoment = Znachenie;
	//myMoment = Znachenie;
	if (RadioButton1->Checked)
		STOsnIzmVel->Caption = FloatToStr(RoundTo(midArifm2(Znachenie), -4));
	if (RadioButton2->Checked){
		STOsnIzmVel->Caption =
			FloatToStr(RoundTo(runMiddleArifmOptim(Znachenie), -4));
	   Memo2->Lines->Add(FloatToStr(Znachenie)+" "+FloatToStr(RoundTo(runMiddleArifmOptim(Znachenie), -4)));
	}

	if (RadioButton3->Checked){
		STOsnIzmVel->Caption =
			FloatToStr(RoundTo(expRunningAverage(Znachenie), -4));
	}
	if (RadioButton4->Checked)
		STOsnIzmVel->Caption =
			FloatToStr(RoundTo(expRunningAverageAdaptive(Znachenie), -4));
	if (RadioButton5->Checked)
		STOsnIzmVel->Caption = FloatToStr(RoundTo(ABfilter(Znachenie), -4));
	if (RadioButton6->Checked)
		STOsnIzmVel->Caption = FloatToStr(RoundTo(Znachenie, -4));

	if (STOsnIzmVel->Caption == "NAN")
		STOsnIzmVel->Caption = "0";

	// ASCaption.sprintf (FormatOtobrajenia, Znachenie);
	// ................... Formation of a line for displaying temperature
	Znachenie = POutputBuffer->Data.MD.RC.Temper;
	if (Znachenie < -40) {
		STTemper->Caption = "0";
	}
	else {
		STTemper->Caption = FloatToStr(RoundTo(Znachenie, -2));
		// ASCaption.sprintf ("% 4.1f", Znachenie);
	}
	if (STTemper->Caption == "NAN")
		STTemper->Caption = "0";
	// ................... Formation of a line for displaying speed on the panel
	Znachenie = POutputBuffer->Data.MD.RC.Skorost;

	if (Znachenie < 1000) {
		STSkorost->Caption = FloatToStr(RoundTo(Znachenie, -2));
		mySkorost = Znachenie;
		// ASCaption.sprintf ("% 4.1f", Znachenie);
	}
	else {
		STSkorost->Caption = FloatToStr(RoundTo(Znachenie, -2));
		mySkorost = Znachenie;
		// ASCaption.sprintf ("% 4.0f", Znachenie);
	}
	if (STSkorost->Caption == "NAN")
		STSkorost->Caption = "0";
	// ................... Formation of a line to display power on the panel

	//
	Znachenie= abs(myMoment) * abs(mySkorost) / koeff;

	//
	//Znachenie = POutputBuffer->Data.MD.RC.Moschnost;
	STMoschnost->Caption = FloatToStr(RoundTo(Znachenie, -2));
	if (STMoschnost->Caption == "NAN")
		STMoschnost->Caption = "0";

}

// --------------------- Reading decoder status messages
void __fastcall TForm1::BReadMessageClick(TObject *Sender) {
	union _Otvet *InputBuffer;
	int Kod, MessageCode;
	int i, KolSob;
	char OtvetServera[512];
	DWORD PBytesRead;
	char *PMessage;
	char Message1[] = "Received sensor ID";
	char Message2[] = "Sync failed";
	char Message3[] = "Distorting the Identifier";
	char Message4[] = "Sensor disconnected";
	char Message5[] = "Sensor connected";
	char Message6[] = "The decoder is disconnected";
	char Message7[] = "The decoder is connected";
	char Message8[] = "Transmission-distortion";
	char Message9[] = "I / O Error";
	char Message10[] = "There is no pause in reception";
	char Message11[] = "No network access";
	char Message12[] = "Restore Sync";
	char Message13[] = "There are no messages from the decoder";
	char Message14[] = "Loss of data buffer during stream reading";
	char Message15[] = "The message queue was full";
	UnicodeString US;

	// ................... Reading information from the decoder
	if (PDecoder != NULL) {
		Kod = DecoderGetMessage(PDecoder, OtvetServera, &PBytesRead);
	}
	if ((Kod != 0) && (Kod != RET_CODE_NODATA)) {
		Memo1->Lines->Add("Failed to read decoder status messages");
		return;
	}
	if (Kod == RET_CODE_NODATA) {
		Memo1->Lines->Add(Message13);
		return;
	}
	InputBuffer = (union _Otvet*) OtvetServera;
	KolSob = PBytesRead - 9;
	if (KolSob == 0) {
		Memo1->Lines->Add(Message13);
		return;
	}
	for (i = 0; i < KolSob; i++) {
		// Highlight the code of the received message
		MessageCode = InputBuffer->MessageBuffer.Messages[i];
		switch (MessageCode) {
		case 0:
			PMessage = Message13;
			break;

		case MESSAGE_POLUCHEN_ID: // Received Identifier
			PMessage = Message1;
			break;

		case MESSAGE_SBOI_SYNCHRO: // Sync failed
			PMessage = Message2;
			break;

		case MESSAGE_VOSST_SYNCHRO: // Restore Sync
			PMessage = Message12;
			break;

		case MESSAGE_OSHIBKA_ID: // Identifier Distortion
			PMessage = Message3;
			break;

		case MESSAGE_DATCHIK_OFF: // Sensor disconnected
			PMessage = Message4;
			break;

		case MESSAGE_DATCHIK_ON: // Sensor connected
			PMessage = Message5;
			break;

		case MESSAGE_DECODER_OFF: // Decoder disconnected
			PMessage = Message6;
			break;

		case MESSAGE_DECODER_ON: // Decoder connected
			PMessage = Message7;
			break;

		case MESSAGE_ISKAJENIA: // Transmission-distortion
			PMessage = Message8;
			break;

		case MESSAGE_OSHIBKA_IO: // I / O Error
			PMessage = Message9;
			break;

		case MESSAGE_NET_PAUSY: // There is no pause in reception
			PMessage = Message10;
			break;

		case MESSAGE_NETWORK_OFF: // No network access
			PMessage = Message11;
			break;

		case MESSAGE_BUFFER_LOSS: // Loss of data buffer during stream reading
			PMessage = Message14;
			break;

		case MESSAGE_MESSAGEQ_OVERFL: // There was a message queue overflow
			PMessage = Message15;
			break;

		default:
			PMessage = NULL;
			break;
		}
		if (PMessage != NULL) {
			US = PMessage;
			US = L"Read message \"" + US + L"\"";
			Memo1->Lines->Add(US);
		}
	}
}

// --------------------- Clear the display panel
void __fastcall TForm1::BClearClick(TObject *Sender) {
	STOsnIzmVel->Caption = "";
	STTemper->Caption = "";
	STSkorost->Caption = "";
	STMoschnost->Caption = "";
}

// ------------------------------------------------ ---------------------------
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
	CB_Protocol->Enabled = false;
	LProtocol->Enabled = false;

	switch (CBDecoderType->ItemIndex) {
	case 0: // T26
		DecoderType = MODBUS_DECODER;
		LComPortNumber->Enabled = true;
		EComPortNumber->Enabled = true;
		LBaudRate->Enabled = true;
		CBBaudRate->Enabled = true;
		LUnitNumber->Enabled = true;
		EUnitNumber->Enabled = true;
		break;
	case 1: // T32
		DecoderType = COMPORT_DECODER_T32;
		LComPortNumber->Enabled = true;
		EComPortNumber->Enabled = true;
		LBaudRate->Enabled = true;
		CBBaudRate->Enabled = true;
		break;
	case 2: // T35
		DecoderType = USB_DECODER_T35;
		break;
	case 3: // T36
		DecoderType = MODBUS_DECODER_T36;
		LComPortNumber->Enabled = true;
		EComPortNumber->Enabled = true;
		LBaudRate->Enabled = true;
		CBBaudRate->Enabled = true;
		LUnitNumber->Enabled = true;
		EUnitNumber->Enabled = true;
		break;
	case 4: // T42 2
		DecoderType = COMPORT_DECODER_T42;
		LComPortNumber->Enabled = true;
		EComPortNumber->Enabled = true;
		LBaudRate->Enabled = true;
		CBBaudRate->Enabled = true;
		break;
	case 5: // T45
		DecoderType = USB_DECODER_T45;
		break;
	case 6: // T46
		DecoderType = MODBUS_DECODER_T46;
		LComPortNumber->Enabled = true;
		EComPortNumber->Enabled = true;
		LBaudRate->Enabled = true;
		CBBaudRate->Enabled = true;
		LUnitNumber->Enabled = true;
		EUnitNumber->Enabled = true;
		break;
	case 7: // Simulator
		DecoderType = SIMULATOR_DECODER;
		break;
	case 8: // T42 indicator (USB)
		DecoderType = USB_INDICATOR;
		break;
	case 9: // T42 indicator (RS-232)
		DecoderType = COMPORT_INDICATOR;
		LComPortNumber->Enabled = true;
		EComPortNumber->Enabled = true;
		LBaudRate->Enabled = true;
		CBBaudRate->Enabled = true;
		break;
	case 10: // T42 indicator (RS-485)
		DecoderType = MODBUS_INDICATOR;
		LComPortNumber->Enabled = true;
		EComPortNumber->Enabled = true;
		LBaudRate->Enabled = true;
		CBBaudRate->Enabled = true;
		LUnitNumber->Enabled = true;
		EUnitNumber->Enabled = true;
		break;
	case 11: // T42 indicator (Ethernet)
		DecoderType = ETHERNET_INDICATOR;
		LServerAddress->Enabled = true;
		EServerAddress->Enabled = true;
		LPortNumber->Enabled = true;
		EPortNumber->Enabled = true;
		CB_Protocol->Enabled = true;
		LProtocol->Enabled = true;
		EServerAddress->Text = "IT42E9";
		break;
	}
}

// ------------------------------------------------ ---------------------------
void TForm1::Pause(unsigned int Timeout) {
	TEvent *PEvent2;

	PEvent2 = new TEvent(NULL, false, false, NULL, false);
	PEvent2->WaitFor(Timeout);
	delete PEvent2;
}
// ------------------------------------------------ ---------------------------

void __fastcall TForm1::TimerMainTimer(TObject *Sender) {
	BReadComplexClick(Form1);

	float t = StrToFloat(STOsnIzmVel->Caption);
	float r = StrToFloat(STSkorost->Caption);
	float p = StrToFloat(STMoschnost->Caption);
	QUpd->ParamByName("TORQ")->AsFloat = t;
	QUpd->ParamByName("ROT")->AsFloat = r;
	QUpd->ParamByName("POWER")->AsFloat = p;
	QUpd->ExecSQL();
	if (wr == 1) {
		QIns->ParamByName("TORQ")->AsFloat = t;
		QIns->ParamByName("ROT")->AsFloat = r;
		QIns->ParamByName("POWER")->AsFloat = p;
		QIns->ExecSQL();
	}
}
// ---------------------------------------------------------------------------

void __fastcall TForm1::Button1Click(TObject *Sender) {
	// TimerMain->Enabled = !TimerMain->Enabled;
}
// ---------------------------------------------------------------------------

void __fastcall TForm1::TimerStartTimer(TObject *Sender) {

	TimerStart->Enabled = false;
	BConnectClick(Form1);
}
// ---------------------------------------------------------------------------

void __fastcall TForm1::BitBtn2Click(TObject *Sender) {
	Edit1->Text = "0";
	corr = 0;
	TIniFile *Ini = new TIniFile(ExtractFilePath(ParamStr(0)) +
		"\\settings45.ini");
	Ini->WriteString("Datchik", "Corr", Edit1->Text);
	Ini->Free();
}
// ---------------------------------------------------------------------------

void __fastcall TForm1::BitBtn1Click(TObject *Sender) {
	Edit1->Text = FloatToStr(RoundTo(StrToFloat(STOsnIzmVel->Caption) * (-1),-3));
	corr = StrToFloat(Edit1->Text);
	TIniFile *Ini = new TIniFile(ExtractFilePath(ParamStr(0)) +
		"\\settings45.ini");
	Ini->WriteString("Datchik", "Corr", Edit1->Text);
	Ini->Free();
}
// ---------------------------------------------------------------------------

void __fastcall TForm1::Edit1Exit(TObject *Sender) {
	corr = StrToFloat(Edit1->Text);
	TIniFile *Ini = new TIniFile(ExtractFilePath(ParamStr(0)) +
		"\\settings45.ini");
	Ini->WriteString("Datchik", "Corr", Edit1->Text);
	Ini->Free();

}
// ---------------------------------------------------------------------------
