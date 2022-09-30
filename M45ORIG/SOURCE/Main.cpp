//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
#include "DecoderBroker.h"
#include "Main.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
  // Массив форматов для отображения основной измеряемой величины
  char *MasFormatovRas[4]={"%4.0f", "%4.2f", "%4.1f", "%4.3f"};

//---------------------------------------------------------------------------
int __stdcall DataHandler(int DataType,void *Zapis,void *PContext);
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner) 
    : TForm(Owner)
{
  EstID = false;
  EstIzm = false;
  PDecoder = NULL;
  BStart->Enabled = false;
  BStop->Enabled = false;
  BDisconnect->Enabled = false;
  //................... для защиты общих данных
  SostDat_CrSe = new TCriticalSection();

  CBDecoderType->ItemIndex = 0;
  CBDecoderTypeChange(this);
  Temperature = 0;
}
//--------------------- КНОПКА "ПОДКЛЮЧЕНИЕ К СЕРВЕРУ"
void __fastcall TForm1::BConnectClick(TObject *Sender)
{
  char ServerAddress[300];
  AnsiString AS;
  struct _ParamComPort ParamComPort;

  PortBase = StrToInt(EPortNumber->Text);
  AS = EServerAddress->Text;
  strcpy(ServerAddress,AS.c_str());
  
  NKan=1;
  PSpecialParametrs = (struct _SpecialParametrs *)calloc(sizeof(struct _SpecialParametrs),1);
  PSpecialParametrs->AveragingFactor = StrToInt(EAveragingFactor->Text); // Коэффициент усреднения данных
  PSpecialParametrs->SpeedMeasurementPeriod = 1000; // Период измерения частоты вращения
  PSpecialParametrs->ComPortNumber = StrToInt(EComPortNumber->Text);
  PSpecialParametrs->MODBUS_DeviceAddress = StrToInt(EUnitNumber->Text);
  UnicodeString US = CBBaudRate->Items->Strings[CBBaudRate->ItemIndex];
  ParamComPort.BaudRate = StrToInt(US);
  ParamComPort.BiteSize = 8;
  ParamComPort.Parity = 0;
  ParamComPort.StopBits = 0;
  PSpecialParametrs->PParamComPort = &ParamComPort;
  PSpecialParametrs->ServerAddress = ServerAddress; // Адрес декодера в локальной сети
  PSpecialParametrs->AnotherServerBasePortNumber = PortBase;// Базовый адрес порта декодера
  //................... Создание декодера
  PDecoder = (TDecoder *)DecoderCreate(
                                    NKan,
                                    DecoderType,
                                    DataHandler,
                                    this,
                                    PSpecialParametrs);
  free(PSpecialParametrs);
  //................... Если декодер не удалось создать
  if (PDecoder == NULL) {
    Memo1->Lines->Add("Не удалось создать декодер");
    return;
  }
  //................... Подключение к менеджеру
//  int RetCode = PDecoder->AddListener(this, ZeroPointComputerTime, &ApparatusState);
  //................... Открытие декодера для работы в потоковом режиме
  int Kod = DecoderOpen(PDecoder,1);
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
}
//--------------------- КНОПКА "СТАРТ ИЗМЕРЕНИЙ"
void __fastcall TForm1::BStartClick(TObject *Sender)
{
  BConnect->Enabled = false;
  BStart->Enabled = false;
  BStop->Enabled = true;
  BDisconnect->Enabled = true;

  EstIzm = true;                 // На канале запущены измерения
  KolIzmOto = 0;
  ReflectionTimer->Enabled = true;
}
//--------------------- КНОПКА "СТОП ИЗМЕРЕНИЙ"
void __fastcall TForm1::BStopClick(TObject *Sender)
{
  BConnect->Enabled = false;
  BStart->Enabled = true;
  BStop->Enabled = false;
  BDisconnect->Enabled = true;

  ReflectionTimer->Enabled =false;
  EstIzm = false;                 // На канале остановлены измерения
}
//--------------------- КНОПКА "ОТКЛЮЧЕНИЕ ОТ СЕРВЕРА"
void __fastcall TForm1::BDisconnectClick(TObject *Sender)
{
  ReflectionTimer->Enabled =false;
  EstIzm = false;                 // На канале остановлены измерения
  EstID = false;

  //................... Закрытие декодера
  if (PDecoder!=NULL) {
    DecoderClose(PDecoder);
    PDecoder = NULL;
  }
  Memo1->Lines->Add("Декодер закрыт");

  BConnect->Enabled = true;
  BStart->Enabled = false;
  BStop->Enabled = false;
  BDisconnect->Enabled = false;
}
//--------------------- ЗАКРЫТИЕ ФОРМЫ
void __fastcall TForm1::FormClose(TObject *Sender, TCloseAction &Action)
{
  BDisconnectClick(this);
  Action = caFree;
}
//--------------------- ОБРАБОТЧИК ДАННЫХ, ПОСТУПАЮЩИХ ОТ ДЕКОДЕРА
int __stdcall DataHandler(int DataType,void *PZapis,void *PContext)
{
  struct _DataFrame *PDataFrame;
  TForm1 *PForm1 = (TForm1 *)PContext;

  
  //................... Обработка принятых данных
  switch (DataType) {
  case DATA_TYPE_DATA:   // Тип данных - данные измерений
    //................. Если не получен идентификатор датчика
    if (!PForm1->EstID) return 0;    
    //................. Если остановлены измерения
    if (!PForm1->EstIzm) return 0; 
    PDataFrame = (struct _DataFrame *)PZapis;
    PForm1->SostDat_CrSe->Enter();
    PForm1->SummaZn_Osn += PDataFrame->OsnIzmVel[0];
    PForm1->KolIzmOto++;
    PForm1->Temperature = PDataFrame->Temper;
    PForm1->Skorost = PDataFrame->Skorost;
    PForm1->Moshn = PDataFrame->Moschnost;
    PForm1->SostDat_CrSe->Leave();
    break;

  case DATA_TYPE_MESSAGES: // Тип данных - сообщения декодера
    struct _MessageFrame *PMessageFrame = (struct _MessageFrame *)PZapis;
    PostMessage(Form1->Handle,WM_USER+1,PMessageFrame->MessageCode,NULL);
    break;
  }
  return 0;
}
//--------------------- ОБРАБОТКА СООБЩЕНИЯ #1
void __fastcall TForm1::UserMessage(TMessage& msg)
{
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
  char Message10[]= "Нет паузы в приеме";
  char Message11[]= "Нет доступа к сети";
  char Message12[]= "Восстановление синхронизации";
  char Message13[]= "Нет сообщений от декодера";
  char Message14[]= "Потеря буфера данных при потоковом чтении";
  char Message15[]= "Была переполнена очередь сообщений";
  int Razmernost;
  int DataType;
  int Index;

  DataType = msg.WParam;
  switch (DataType) {
    case MESSAGE_POLUCHEN_ID:    // Получен Идентификатор
      //............... Чтение служебного канала датчика
      retkod = DecoderReadTranducerParametrs(PDecoder,&SK,StrokaDatchikID);
      if (retkod != 0) {
        PMessage = "Не удалось прочитать служебный канал";
      }
      else {
        PMessage = Message1;
      }
      //............... Отображение идентификатора датчика
      AS = StrokaDatchikID;
      EDatchikID->Text = AS;
      //................... Извлечь размерность данных
      Razmernost = SK.ID_Datchik[1]>>4;    // Цифра 3 
      //................... Вычисление индекса для установки форматов отображения
      switch (Razmernost) {
        case 0: case 3: case 6: case 9: case 12:  Index=0; break;
        case 1: case 4: case 7: case 10: case 14: Index=1; break;
        case 2: case 5: case 8: case 11: case 13: Index=2; break;
        case 15:                                  Index=3; break;
      }
      FormatOtobrajenia = MasFormatovRas[Index];
      EstID = true;
      break;

    case MESSAGE_SBOI_SYNCHRO:   // Сбой синхронизации
      PMessage = Message2;  break;
    case MESSAGE_VOSST_SYNCHRO:  // Восстановление синхронизации
      PMessage = Message12;  break;
    case MESSAGE_OSHIBKA_ID:     // Искажение Идентификатора
      PMessage = Message3;  break;
    case MESSAGE_DATCHIK_OFF:    // Датчик отключился
      PMessage = Message4;  break;
     case MESSAGE_DATCHIK_ON:     // Датчик подключился
      PMessage = Message5;  break;
     case MESSAGE_DECODER_OFF:    // Декодер отключился
      PMessage = Message6;  break;
     case MESSAGE_DECODER_ON:     // Декодер подключился
      PMessage = Message7;  break;
     case MESSAGE_ISKAJENIA:      // Искажения приема-передачи
      PMessage = Message8;  break;
     case MESSAGE_OSHIBKA_IO:     // Ошибка ввода-вывода
      PMessage = Message9;  break;
     case MESSAGE_NET_PAUSY:      // Нет паузы в приеме
      PMessage = Message10;  break;
     case MESSAGE_NETWORK_OFF:    // Нет доступа к сети
      PMessage = Message11;  break;
     case MESSAGE_BUFFER_LOSS:    // Потеря буфера данных при потоковом чтении
      PMessage = Message14;  break;
     case MESSAGE_MESSAGEQ_OVERFL:   // Было переполнение очереди сообщений
      PMessage = Message15;  break;
     default:
      PMessage = NULL;  break;
    }
    if (PMessage != NULL) {
      Memo1->Lines->Add(PMessage);
    }
  return;
}
//--------------------- ОБРАБОТЧИК ТАЙМЕРА ДЛЯ ВЫСВЕТКИ ЗНАЧЕНИЙ НА ПАНЕЛЯХ ФОРМЫ
void __fastcall TForm1::ReflectionTimerTimer(TObject *Sender)
{
  AnsiString AS;
  float AbsZnachenie;
  float Znachenie;
  int i;

  //................... Если счетчик уср значений нулевой
  if (KolIzmOto==0) return;
  //................... Ждать освобождения критической секции
  SostDat_CrSe->Enter();
  //................... Вычислить среднее значение
  Znachenie = SummaZn_Osn/(double)KolIzmOto;    // среднее значение
  SummaZn_Osn=0;
  KolIzmOto=0;
  //................... Покинуть критическую секцию
  SostDat_CrSe->Leave();
  //................... Отображение значений
  //................... Формирование строки для отображения основной изм величины на панели
  STOsnIzmVel->Caption = AS.sprintf(FormatOtobrajenia,Znachenie);
  //................... Формирование строки для отображения температуры
  if (Temperature < -40) {
    STTemper->Caption = "";
  }
  else {
    STTemper->Caption = AS.sprintf("%4.1f",Temperature);
  }
  //................... Формирование строки для отображения скорости на панели
  if (Skorost < 1000) {
    STSkorost->Caption = AS.sprintf("%4.1f",Skorost);
  }
  else {
    STSkorost->Caption = AS.sprintf("%4.0f",Skorost);
  }
  //................... Формирование строки для отображения мощности на панели
  STMoschnost->Caption = AS.sprintf(FormatOtobrajenia,Moshn);
  
}
//--------------------- Очистить панель отображения
void __fastcall TForm1::CBDecoderTypeChange(TObject *Sender)
{
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
  case 0:  // Т25
    DecoderType = USB_DECODER;
    break;
  case 1:  // Т26
    DecoderType = MODBUS_DECODER;
    LComPortNumber->Enabled = true;
    EComPortNumber->Enabled = true;
    LBaudRate->Enabled = true;
    CBBaudRate->Enabled = true;
    LUnitNumber->Enabled = true;
    EUnitNumber->Enabled = true;
    break;
  case 2:  // Т32
    DecoderType = COMPORT_DECODER_T32;
    LComPortNumber->Enabled = true;
    EComPortNumber->Enabled = true;
    LBaudRate->Enabled = true;
    CBBaudRate->Enabled = true;
    break;
  case 3:  // Т35
    DecoderType = USB_DECODER_T35;
    break;
  case 4:  // Т36
    DecoderType = MODBUS_DECODER_T36;
    LComPortNumber->Enabled = true;
    EComPortNumber->Enabled = true;
    LBaudRate->Enabled = true;
    CBBaudRate->Enabled = true;
    LUnitNumber->Enabled = true;
    EUnitNumber->Enabled = true;
    break;
  case 5:  // Т37
    DecoderType = ETHERNET_DECODER_T37;
    LServerAddress->Enabled = true;
    EServerAddress->Enabled = true;
    LPortNumber->Enabled = true;
    EPortNumber->Enabled = true;
    break;
  case 6:  // Т42   2
    DecoderType = COMPORT_DECODER_T42;
    LComPortNumber->Enabled = true;
    EComPortNumber->Enabled = true;
    LBaudRate->Enabled = true;
    CBBaudRate->Enabled = true;
    break;
  case 7:  // Т45
    DecoderType = USB_DECODER_T45;
    break;
  case 8:  // Т46
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
//---------------------------------------------------------------------------


void __fastcall TForm1::TQTimer(TObject *Sender)
{
	Application->ProcessMessages();
	// ---внесение данных в базу---
	try {
		Query1->SQL->Clear();
		Query1->SQL->Add("INSERT INTO zamertmp (torq,rot,power,pnom,nomer)values( ");
		Query1->SQL->Add(QuotedStr(FormatFloat("0.000", /*OsnIzm*/ myMoment + pT)) + ", ");
		Query1->SQL->Add(QuotedStr(FormatFloat("0.000", Skorost + pS)) + ", ");
		Query1->SQL->Add(QuotedStr(FormatFloat("0.000", Moshn)) +  ", ");
		Query1->SQL->Add(QuotedStr(FormatFloat("0.000", pisp)) +  ", ");
		Query1->SQL->Add(QuotedStr(nomer)+ ") ");
		Query1->ExecSQL();
	}
	catch (...) {
	}
	Application->ProcessMessages();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::TSTimer(TObject *Sender)
{
	//Label12->Caption = FormatFloat("0.00", Skorost + pS);
	//Label13->Caption = FormatFloat("0.00", Moshn);
	//Label11->Caption = FormatFloat("0.00", /*OsnIzm*/myMoment + pT);
	// while (busy);
	try {
		Query2->SQL->Clear();
		Query2->SQL->Add("update zamer set ");
		Query2->SQL->Add("torq = " + QuotedStr(FormatFloat("0.000",
			/*OsnIzm*/myMoment + pT)) + ", ");
		Query2->SQL->Add("rot = " + QuotedStr(FormatFloat("0.000",
			Skorost + pS)) + ", ");
		Query2->SQL->Add("power = " + QuotedStr(FormatFloat("0.000",
			Moshn)) + "");
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
//---------------------------------------------------------------------------

