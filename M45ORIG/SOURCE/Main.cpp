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
float mySkorost;
float mySkorostAll;
int times;
float pisp;
float corr = 0;
String nomer;
int Datchik;
int Interval;

float zprev;

float koeff=30/3.14159265358979323846;
float myMoshn=0;
float Popravkam[6];

bool EN = false;

const int reflcnt = 10;
int refltime = 0;
float SpeedMeasurement = 1000;

String IniFileName;
struct {
  float n;
  float m;
  float p;
} c;

// ---------------------------------------------------------------------------
// Массив форматов для отображения основной измеряемой величины
char *MasFormatovRas[4] = {"%4.0f", "%4.2f", "%4.1f", "%4.3f"};

// ---------------------------------------------------------------------------
int __stdcall DataHandler(int DataType, void *Zapis, void *PContext);

// ---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner) : TForm(Owner) {
  TIniFile *Ini = new TIniFile(ExtractFilePath(ParamStr(0)) + "\\settings.ini");
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
  // ................... для защиты общих данных
  SostDat_CrSe = new TCriticalSection();
  Temperature = 0;
}

// --------------------- КНОПКА "ПОДКЛЮЧЕНИЕ К СЕРВЕРУ"
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
  // Коэффициент усреднения данных
  PSpecialParametrs->SpeedMeasurementPeriod = SpeedMeasurement;
  // Период измерения частоты вращения
  PSpecialParametrs->ComPortNumber = StrToInt(EComPortNumber->Text);
  PSpecialParametrs->MODBUS_DeviceAddress = StrToInt(EUnitNumber->Text);
  UnicodeString US = CBBaudRate->Items->Strings[CBBaudRate->ItemIndex];
  ParamComPort.BaudRate = StrToInt(US);
  ParamComPort.BiteSize = 8;
  ParamComPort.Parity = 0;
  ParamComPort.StopBits = 0;
  PSpecialParametrs->PParamComPort = &ParamComPort;
  PSpecialParametrs->ServerAddress = ServerAddress;
  PSpecialParametrs->Popravka[0]=Popravkam[0];
  PSpecialParametrs->Popravka[1]=Popravkam[1];
  PSpecialParametrs->Popravka[2]=Popravkam[2];
  PSpecialParametrs->Popravka[3]=Popravkam[3];
  PSpecialParametrs->Popravka[4]=Popravkam[4];
  PSpecialParametrs->Popravka[5]=Popravkam[5];
  // Адрес декодера в локальной сети
  PSpecialParametrs->AnotherServerBasePortNumber = PortBase;
  // Базовый адрес порта декодера
  // ................... Создание декодера
  PDecoder = (TDecoder*)DecoderCreate(NKan, DecoderType, DataHandler, this,
      PSpecialParametrs);
  free(PSpecialParametrs);
  // ................... Если декодер не удалось создать
  if (PDecoder == NULL) {
    Memo1->Lines->Add("Не удалось создать декодер");
    return;
  }
  // ................... Подключение к менеджеру
  // int RetCode = PDecoder->AddListener(this, ZeroPointComputerTime, &ApparatusState);
  // ................... Открытие декодера для работы в потоковом режиме
  int Kod = DecoderOpen(PDecoder, 1);
  if (Kod != 0) {
    Memo1->Lines->Add("Не удалось открыть декодер");
    return;
  }
  else {
    Memo1->Lines->Add("Декодер открыт");
  }
  BConnect->Enabled = false;
  BStart->Enabled = true;
  BStop->Enabled = false;
  BDisconnect->Enabled = true;
  mySkorostAll = 0;
  mySkorost = 0;
  times = 0;
}

// --------------------- КНОПКА "СТАРТ ИЗМЕРЕНИЙ"
void __fastcall TForm1::BStartClick(TObject *Sender) {
  BConnect->Enabled = false;
  BStart->Enabled = false;
  BStop->Enabled = true;
  BDisconnect->Enabled = true;
  EstIzm = true; // На канале запущены измерения
  KolIzmOto = 0;
  ReflectionTimer->Enabled = true;
}

// --------------------- КНОПКА "СТОП ИЗМЕРЕНИЙ"
void __fastcall TForm1::BStopClick(TObject *Sender) {
  BConnect->Enabled = false;
  BStart->Enabled = true;
  BStop->Enabled = false;
  BDisconnect->Enabled = true;
  ReflectionTimer->Enabled = false;
  EstIzm = false; // На канале остановлены измерения
}

// --------------------- КНОПКА "ОТКЛЮЧЕНИЕ ОТ СЕРВЕРА"
void __fastcall TForm1::BDisconnectClick(TObject *Sender) {
  ReflectionTimer->Enabled = false;
  EstIzm = false; // На канале остановлены измерения
  EstID = false;
  // ................... Закрытие декодера
  if (PDecoder != NULL) {
    DecoderClose(PDecoder);
    PDecoder = NULL;
  }
  Memo1->Lines->Add("Декодер закрыт");
  BConnect->Enabled = true;
  BStart->Enabled = false;
  BStop->Enabled = false;
  BDisconnect->Enabled = false;
}

// --------------------- ЗАКРЫТИЕ ФОРМЫ
void __fastcall TForm1::FormClose(TObject *Sender, TCloseAction &Action) {
  BDisconnectClick(this);
  Action = caFree;
}

// --------------------- ОБРАБОТЧИК ДАННЫХ, ПОСТУПАЮЩИХ ОТ ДЕКОДЕРА
int __stdcall DataHandler(int DataType, void *PZapis, void *PContext) {
  String s;
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
	if(abs(PDataFrame->OsnIzmVel[0])/abs(PDataFrame->OsnIzmVel[0]-zprev+0.0000001)<5){
	PForm1->SummaZn_Osn += SimpleRoundTo(PDataFrame->OsnIzmVel[0],-2) + corr;
	PForm1->KolIzmOto+=1;
	}else{
		 PForm1->SummaZn_Osn += zprev + corr;
	PForm1->KolIzmOto+=1;}

	zprev= SimpleRoundTo(PDataFrame->OsnIzmVel[0],-2);
	mySkorostAll+=(PDataFrame->Skorost);
	times+=1;
	 if (PForm1->CheckBox1->Checked) {
	 }

	PForm1->Temperature = PDataFrame->Temper;
	PForm1->Skorost = PDataFrame->Skorost;
	PForm1->Moshn = PDataFrame->Moschnost;
	PForm1->SostDat_CrSe->Leave();
	break;

  case DATA_TYPE_MESSAGES: // Тип данных - сообщения декодера
	struct _MessageFrame * PMessageFrame = (struct _MessageFrame*)PZapis;
	PostMessage(Form1->Handle, WM_USER + 1, PMessageFrame->MessageCode, NULL);
	break;
  }
  return 0;
}

// --------------------- ОБРАБОТКА СООБЩЕНИЯ #1
void __fastcall TForm1::UserMessage(TMessage& msg) {
  int retkod;
  char *PMessage;
  AnsiString AS;

  char Message1[] = "Получен идентификатор датчика";
  char Message2[] = "Сбой синхронизации";
  char Message3[] = "Искажение Идентификатора";
  char Message4[] = "Датчик отключился";
  char Message5[] = "Датчик подключился";
  char Message6[] = "Декодер отключился";
  char Message7[] = "Декодер подключился";
  char Message8[] = "Искажения приема-передачи";
  char Message9[] = "Ошибка ввода-вывода";
  char Message10[] = "Нет паузы в приеме";
  char Message11[] = "Нет доступа к сети";
  char Message12[] = "Восстановление синхронизации";
  char Message13[] = "Нет сообщений от декодера";
  char Message14[] = "Потеря буфера данных при потоковом чтении";
  char Message15[] = "Была переполнена очередь сообщений";
  int Razmernost;
  int DataType;
  int Index;

  DataType = msg.WParam;
  switch (DataType) {
  case MESSAGE_POLUCHEN_ID: // Получен Идентификатор
    // ............... Чтение служебного канала датчика
    retkod = DecoderReadTranducerParametrs(PDecoder, &SK, StrokaDatchikID);
    if (retkod != 0) {
      PMessage = "Не удалось прочитать служебный канал";
    }
    else {
      PMessage = Message1;
    }
    // ............... Отображение идентификатора датчика
    AS = StrokaDatchikID;
    EDatchikID->Text = AS;
    // ................... Извлечь размерность данных
    Razmernost = SK.ID_Datchik[1] >> 4; // Цифра 3
    // ................... Вычисление индекса для установки форматов отображения
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

  case MESSAGE_SBOI_SYNCHRO: // Сбой синхронизации
    PMessage = Message2;
    break;
  case MESSAGE_VOSST_SYNCHRO: // Восстановление синхронизации
    PMessage = Message12;
    break;
  case MESSAGE_OSHIBKA_ID: // Искажение Идентификатора
    PMessage = Message3;
    break;
  case MESSAGE_DATCHIK_OFF: // Датчик отключился
    PMessage = Message4;
    break;
  case MESSAGE_DATCHIK_ON: // Датчик подключился
    PMessage = Message5;
    break;
  case MESSAGE_DECODER_OFF: // Декодер отключился
    PMessage = Message6;
    break;
  case MESSAGE_DECODER_ON: // Декодер подключился
    PMessage = Message7;
    break;
  case MESSAGE_ISKAJENIA: // Искажения приема-передачи
    PMessage = Message8;
    break;
  case MESSAGE_OSHIBKA_IO: // Ошибка ввода-вывода
    PMessage = Message9;
    break;
  case MESSAGE_NET_PAUSY: // Нет паузы в приеме
    PMessage = Message10;
    break;
  case MESSAGE_NETWORK_OFF: // Нет доступа к сети
    PMessage = Message11;
    break;
  case MESSAGE_BUFFER_LOSS: // Потеря буфера данных при потоковом чтении
    PMessage = Message14;
    break;
  case MESSAGE_MESSAGEQ_OVERFL: // Было переполнение очереди сообщений
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

// --------------------- ОБРАБОТЧИК ТАЙМЕРА ДЛЯ ВЫСВЕТКИ ЗНАЧЕНИЙ НА ПАНЕЛЯХ ФОРМЫ
void __fastcall TForm1::ReflectionTimerTimer(TObject *Sender) {
  AnsiString AS;
  AnsiString AS1;
  String s = "";
  int i;
  //////////////////////////////////////////////////////////////////////////////////////////
  if (KolIzmOto == 0)
	return;
  SostDat_CrSe->Enter();
  //Znachenie = SummaZn_Osn / KolIzmOto+corr; // среднее значение

  // if (KolIzmOto != 0)
  // {
	Znachenie = SummaZn_Osn / KolIzmOto;
	SummaZn_Osn=0;
	KolIzmOto=0;
  // }
  //  */
  if (times!=0){
	mySkorost = (mySkorostAll)/times;
	mySkorostAll=0;
	times=0;
   }

	myMoshn=abs(Znachenie) * abs(Skorost) / koeff;



  SostDat_CrSe->Leave();

  try { // Form1->Moshn = Znachenie * abs(Skorost) / 9.546;
    QUpd->ParamByName("torq")->AsFloat = abs(Znachenie);
	QUpd->ParamByName("rot")->AsFloat = abs(Skorost);
	QUpd->ParamByName("power")->AsFloat = abs(myMoshn);
    QUpd->ExecSQL();
    // STSkorost->Caption = AS.sprintf("%4.0f", abs(Skorost));
  }
  catch (...) {
  }

  if (EN) {
    try { // Form1->Moshn = Znachenie * abs(Skorost) / 9.546;
      // ( :TORQ, :OT, :POWER,:NOMER, :PNOM )
	  QIns->ParamByName("torq")->AsFloat = abs(Znachenie);
      QIns->ParamByName("rot")->AsFloat = abs(Skorost);
	  QIns->ParamByName("power")->AsFloat = abs(myMoshn);
	  QIns->ParamByName("nomer")->AsString = nomer;
      QIns->ParamByName("pnom")->AsFloat = 0;
      QIns->ExecSQL();
      // STSkorost->Caption = AS.sprintf("%4.0f", abs(Skorost));
    }
    catch (...) {
    }
  }
   AS=AS.sprintf("%4.0f", abs(mySkorost));
   AS1=AS1.sprintf("%4.0f", abs(Znachenie));
   //myMoshn= StrToFloat(AS1) * StrToFloat(AS) / koeff;
   myMoshn= abs(Znachenie) * abs(mySkorost) / koeff;
  // отображаем на экране
  refltime++;
  if (refltime == reflcnt) {
	SostDat_CrSe->Enter();
    STOsnIzmVel->Caption = AS.sprintf(FormatOtobrajenia, abs(Znachenie));
    // ................... Формирование строки для отображения температуры

	if (Temperature < -40) {
      STTemper->Caption = "-";
    }
    else {
      STTemper->Caption = AS.sprintf("%4.1f", Temperature);
	}

    // ................... Формирование строки для отображения скорости на панели
    if (Skorost < 1000) {
	  STSkorost->Caption = AS.sprintf("%4.1f", abs(mySkorost));
	}
    else {
	  STSkorost->Caption = AS.sprintf("%4.0f", abs(mySkorost));
	}
    // ................... Формирование строки для отображения мощности на панели
	STMoschnost->Caption = AS.sprintf(FormatOtobrajenia, abs(myMoshn));
	SostDat_CrSe->Leave();
    Application->ProcessMessages();
	refltime = 0;
	s = s + FloatToStr(abs(Znachenie))+";"+FloatToStr(corr)+";";
	s = s + FloatToStr(abs(Skorost))+";";
	s = s + FloatToStr(abs(Moshn))+";"+FloatToStr(myMoshn)+";";
	 if (CheckBox1->Checked) Form1->Memo2->Lines->Add(s);
	Application->ProcessMessages();
  }
}

// --------------------- Очистить панель отображения
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
  case 0: // Т25
    DecoderType = USB_DECODER;
    break;
  case 1: // Т26
    DecoderType = MODBUS_DECODER;
    LComPortNumber->Enabled = true;
    EComPortNumber->Enabled = true;
    LBaudRate->Enabled = true;
    CBBaudRate->Enabled = true;
    LUnitNumber->Enabled = true;
    EUnitNumber->Enabled = true;
    break;
  case 2: // Т32
    DecoderType = COMPORT_DECODER_T32;
    LComPortNumber->Enabled = true;
    EComPortNumber->Enabled = true;
    LBaudRate->Enabled = true;
    CBBaudRate->Enabled = true;
    break;
  case 3: // Т35
    DecoderType = USB_DECODER_T35;
    break;
  case 4: // Т36
    DecoderType = MODBUS_DECODER_T36;
    LComPortNumber->Enabled = true;
    EComPortNumber->Enabled = true;
    LBaudRate->Enabled = true;
    CBBaudRate->Enabled = true;
    LUnitNumber->Enabled = true;
    EUnitNumber->Enabled = true;
    break;
  case 5: // Т37
    DecoderType = ETHERNET_DECODER_T37;
    LServerAddress->Enabled = true;
    EServerAddress->Enabled = true;
    LPortNumber->Enabled = true;
    EPortNumber->Enabled = true;
    break;
  case 6: // Т42   2
    DecoderType = COMPORT_DECODER_T42;
    LComPortNumber->Enabled = true;
    EComPortNumber->Enabled = true;
    LBaudRate->Enabled = true;
    CBBaudRate->Enabled = true;
    break;
  case 7: // Т45
    DecoderType = USB_DECODER_T45;
    break;
  case 8: // Т46
    DecoderType = MODBUS_DECODER_T46;
    LComPortNumber->Enabled = true;
    EComPortNumber->Enabled = true;
    LBaudRate->Enabled = true;
    CBBaudRate->Enabled = true;
    LUnitNumber->Enabled = true;
    EUnitNumber->Enabled = true;
    break;
  case 9: // Симулятор
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

  TIniFile *Ini = new TIniFile(ExtractFilePath(ParamStr(0)) + "\\settings.ini");
   TRect *r = new TRect;
   GetWindowRect(this->Handle, r);
   int l = 10;
   int t = 10;
   l = Ini->ReadInteger("Position", "Left", 10);
   t = Ini->ReadInteger("Position", "Top", 10);
   Form1->Left = l;
   Form1->Top = t;
   Form1->Repaint();

  DecoderType = Ini->ReadInteger("DECODER", "Datchik", 10);

  corr = Ini->ReadFloat("Datchik", "Corr", 0);
  Edit1->Text = Ini->ReadString("Datchik", "Corr", "0");
  Popravkam[0] = Ini->ReadFloat("Datchik", "Popravka0", 0);
  Popravkam[1] = Ini->ReadFloat("Datchik", "Popravka1", 0);
  Popravkam[2] = Ini->ReadFloat("Datchik", "Popravka2", 0);
  Popravkam[3] = Ini->ReadFloat("Datchik", "Popravka3", 0);
  Popravkam[4] = Ini->ReadFloat("Datchik", "Popravka4", 0);
  Popravkam[5] = Ini->ReadFloat("Datchik", "Popravka5", 0);

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
  // Коэффициент усреднения данных
  PSpecialParametrs->SpeedMeasurementPeriod = SpeedMeasurement;
  // Период измерения частоты вращения
  PSpecialParametrs->ComPortNumber = StrToInt(EComPortNumber->Text);
  PSpecialParametrs->MODBUS_DeviceAddress = StrToInt(EUnitNumber->Text);
  UnicodeString US = CBBaudRate->Items->Strings[CBBaudRate->ItemIndex];
  ParamComPort.BaudRate = StrToInt(US);
  ParamComPort.BiteSize = 8;
  ParamComPort.Parity = 0;
  ParamComPort.StopBits = 0;
  PSpecialParametrs->PParamComPort = &ParamComPort;
  PSpecialParametrs->ServerAddress = ServerAddress;
  PSpecialParametrs->Popravka[0]=Popravkam[0];
  PSpecialParametrs->Popravka[1]=Popravkam[1];
  PSpecialParametrs->Popravka[2]=Popravkam[2];
  PSpecialParametrs->Popravka[3]=Popravkam[3];
  PSpecialParametrs->Popravka[4]=Popravkam[4];
  PSpecialParametrs->Popravka[5]=Popravkam[5];
  // Адрес декодера в локальной сети
  PSpecialParametrs->AnotherServerBasePortNumber = PortBase;
  // Базовый адрес порта декодера
  // ................... Создание декодера
  PDecoder = (TDecoder*)DecoderCreate(NKan, DecoderType, DataHandler, this,
      PSpecialParametrs);
  free(PSpecialParametrs);
  // ................... Если декодер не удалось создать
  if (PDecoder == NULL) {
    Memo1->Lines->Add("Не удалось создать декодер");
    return;
  }
  // ................... Подключение к менеджеру
  // int RetCode = PDecoder->AddListener(this, ZeroPointComputerTime, &ApparatusState);
  // ................... Открытие декодера для работы в потоковом режиме
  int Kod = DecoderOpen(PDecoder, 1);
  if (Kod != 0) {
    Memo1->Lines->Add("Не удалось открыть декодер");
    return;
  }
  else {
    Memo1->Lines->Add("Декодер открыт");

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

  EstIzm = true; // На канале запущены измерения
  KolIzmOto = 0;
  ReflectionTimer->Enabled = true;
}
// ---------------------------------------------------------------------------

void __fastcall TForm1::FormCloseQuery(TObject *Sender, bool &CanClose) {
  TIniFile *Ini = new TIniFile(ExtractFilePath(ParamStr(0)) + "\\settings.ini");
  TRect *r = new TRect;
  GetWindowRect(this->Handle, r);
  int l = r->Left;
  int t = r->Top;
  Ini->WriteString("Position", "Left", IntToStr(l));
  Ini->WriteString("Position", "Top", IntToStr(t));
  Ini->WriteFloat("Datchik", "Popravka0", Popravkam[0]);
  Ini->WriteFloat("Datchik", "Popravka1", Popravkam[1]);
  Ini->WriteFloat("Datchik", "Popravka2", Popravkam[2]);
  Ini->WriteFloat("Datchik", "Popravka3", Popravkam[3]);
  Ini->WriteFloat("Datchik", "Popravka4", Popravkam[4]);
  Ini->WriteFloat("Datchik", "Popravka5", Popravkam[5]);
  Ini->WriteInteger("DECODER", "Datchik", DecoderType);
  Ini->Free();
  Memo2->Lines->SaveToFile(ExtractFilePath(ParamStr(0))+"123.csv");
}
// ---------------------------------------------------------------------------

void __fastcall TForm1::BitBtn1Click(TObject *Sender) {
  AnsiString AS;
  TIniFile *Ini = new TIniFile(ExtractFilePath(ParamStr(0)) + "\\settings.ini");
  BitBtn2Click(0);
  //AS = STOsnIzmVel->Caption;
  //for( int i = 1; i <= AS.Length(); i++ )
  //if( AS[i] == '.' )
  // AS[i] = ',';

  //DecimalSeparator = '.';
  corr = SimpleRoundTo((0 - Znachenie/*StrToFloat(AS)*/), -2);
  //DecimalSeparator = ',';
  //corr = SimpleRoundTo((0 - Znachenie), -2);

  Edit1->Text = FloatToStr(corr);
  Ini->WriteString("Datchik", "Corr", Edit1->Text);
  Ini->Free();
}
// ---------------------------------------------------------------------------

void __fastcall TForm1::TimerCommandTimer(TObject *Sender) {
  String dop = 0;
  String file = 0;
  QCommand->SQL->Clear();
  QCommand->SQL->Add("select * from command where command='0' or command='1'");
  QCommand->Open();
  if (QCommand->RecordCount > 0) {
    dop = QCommand->FieldByName("command")->AsString;

    //////////////////////////////////
	if (dop == "1") {
    file = QCommand->FieldByName("filename")->AsString;
    pisp = StrToFloat(file);
    nomer = QCommand->FieldByName("nomer")->AsString;
    Datchik = QCommand->FieldByName("dat")->AsInteger;
    Interval = QCommand->FieldByName("interval")->AsInteger;
      Query1->SQL->Clear();
      Query1->SQL->Text = "truncate table zamertmp";
      Query1->ExecSQL();
	  Memo1->Lines->Add("Запущена серия замеров");
	  QCommand->SQL->Clear();
	  QCommand->SQL->Add("delete from command where command = '1'");
	  QCommand->ExecSQL();
      EN = true;
    }
    //////////////////////////////////////////
    else if (dop == "0") {
      try {
        EN = false;
        Memo1->Lines->Add("Остановлена серия замеров");
        QCommand->SQL->Clear();
		QCommand->SQL->Add("delete from command where command = '0'");
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
// ---------------------------------------------------------------------------

void __fastcall TForm1::BitBtn2Click(TObject *Sender) {
  corr = 0;
  Edit1->Text = "0";
  TIniFile *Ini = new TIniFile(ExtractFilePath(ParamStr(0)) + "\\settings.ini");
  Ini->WriteString("Datchik", "Corr", Edit1->Text);
  Ini->Free();
}
// ---------------------------------------------------------------------------


