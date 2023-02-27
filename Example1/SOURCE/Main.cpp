//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
#include "DecoderBroker.h"
#include "Main.h"
#include <Math.hpp>
#include <math.h>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
boolean Connected;
//---------------------------------------------------------------------------
  // Array of formats for displaying the main measured value
  char *MasFormatovRas[4]={"%4.0f", "%4.2f", "%4.1f", "%4.3f"};
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
    : TForm(Owner)
{
  EstIzm = false;
  PDecoder = NULL;
  BDisconnect->Enabled = false;
  BReadBase->Enabled = false;
  BReadSpeed->Enabled = false;
  BReadTemperature->Enabled = false;
  BReadComplex->Enabled = false;
  BReadMessage->Enabled = false;
  TRect *r = new TRect;
  TIniFile *Ini = new TIniFile(ExtractFilePath(ParamStr(0)) + "\settings45.ini");
  GetWindowRect(this->Handle, r);
  int l = r->Left;
  int t = r->Top;
  Form1->Left = Ini->ReadInteger("Position", "Left", 10);
  Form1->Top = Ini->ReadInteger("Position", "Top", 10);
  int Ind = Ini->ReadInteger("DECODER", "Datchik", 7);
  Ini->Free();

  CBDecoderType->ItemIndex = Ind;// 5;
  CBDecoderTypeChange(this);
  Connected = false;
  BConnectClick(Form1);
}
// --------------------- "Open" BUTTON
void __fastcall TForm1::BConnectClick(TObject *Sender)
{
  char ServerAddress[300];
  AnsiString AS;
  int Index;
  struct _ParamComPort ParamComPort;
  int ApparatusState;
  int i;
  
  PortBase = StrToInt(EPortNumber->Text);
  AS = EServerAddress->Text;
  strcpy(ServerAddress,AS.c_str());
  
  NKan=1;

  BConnect->Enabled = false;
  PSpecialParametrs = (struct _SpecialParametrs *) calloc (sizeof (struct _SpecialParametrs), 1);
  PSpecialParametrs->AveragingFactor = StrToInt (EAveragingFactor->Text); // Data Averaging Coefficient
  PSpecialParametrs->SpeedMeasurementPeriod = 10; // Period of measurement of speed
  PSpecialParametrs->ComPortNumber = StrToInt (EComPortNumber->Text);
  PSpecialParametrs->MODBUS_DeviceAddress = StrToInt (EUnitNumber->Text);
  UnicodeString US = CBBaudRate->Items->Strings [CBBaudRate->ItemIndex];
  ParamComPort.BaudRate = StrToInt (US);
  ParamComPort.BiteSize = 8;
  ParamComPort.Parity = 0;
  ParamComPort.StopBits = 0;
  PSpecialParametrs->PParamComPort = & ParamComPort;
  PSpecialParametrs->ServerAddress = ServerAddress; // Decoder address on the local network
  PSpecialParametrs->AnotherServerBasePortNumber = PortBase; // The base address of the decoder port
  PSpecialParametrs->EthernetProtocolType = CB_Protocol->ItemIndex;
  // ................... Creating a decoder
  PDecoder = (TDecoder *) DecoderCreate (NKan,
                                         DecoderType,
                                         NULL,
                                         NULL,
                                         PSpecialParametrs);
  free (PSpecialParametrs);
  // ................... Opening the decoder
  int Kod = DecoderOpen (PDecoder, 0);
  if (Kod != 0) {
    Memo1->Lines->Add ("Failed to open the decoder");
    return;
  }
  else {
	Memo1->Lines->Add ("Decoder is open");
	Connected = true;
  }
  for (i = 0; i<3; i ++) {
    // ................... Read the service channel of the sensor
    Kod = DecoderReadTranducerParametrs (PDecoder, & SK, StrokaDatchikID);
    if (Kod == 0) break;
    Memo1->Lines->Add ("Could not read service channel");
    Pause (100);
    continue;
  }
  if (i == 3) {
    Memo1->Lines->Add ("Probably the sensor is not connected");
    return;
  }
  else {
    Memo1->Lines->Add ("Service Channel Read");
  }
  // ................... Display the sensor ID
  AS = StrokaDatchikID;
  EDatchikID->Text = AS;
  // ................... Retrieve data dimension
  int Razmernost = SK.ID_Datchik [1] >> 4; // Number 3
  // ................... Calculation of the index for setting display formats
  switch (Razmernost) {
  case 0: case 3: case 6: case 9: case 12: Index = 0; break;
  case 1: case 4: case 7: case 10: case 14: Index = 1; break;
  case 2: case 5: case 8: case 11: case 13: Index = 2; break;
  case 15: Index = 3; break;
  }
  FormatOtobrajenia = MasFormatovRas [Index];

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
void __fastcall TForm1::BDisconnectClick (TObject *Sender)
{
  if (PDecoder != NULL) {
    DecoderClose (PDecoder);
    PDecoder = NULL;
	Memo1->Lines->Add ("Decoder is closed");
    Connected = false;
  }
  BConnect->Enabled = true;
  BDisconnect->Enabled = false;
  BReadBase->Enabled = false;
  BReadSpeed->Enabled = false;
  BReadTemperature->Enabled = false;
  BReadComplex->Enabled = false;
  BReadMessage->Enabled = false;
  TimerMain->Enabled = false;
  Button1->Enabled = false;
  Memo2->Lines->SaveToFile("RESULT.CSV");
}
// --------------------- CLOSING THE FORM
void __fastcall TForm1::FormClose (TObject *Sender, TCloseAction & Action)
{
  BDisconnectClick (this);
  Action = caFree;
}
// --------------------- Reading the main measured value
void __fastcall TForm1::BReadBaseClick (TObject *Sender)
{
  int Kod;
  char OtvetServera [512];
  DWORD PBytesRead;
  union _Otvet *POutputBuffer;
  AnsiString ASCaption;
  float Znachenie;

  // ................... Reading information from the decoder
  if (PDecoder != NULL) {
    Kod = DecoderReadBase (PDecoder, OtvetServera, & PBytesRead);
  }
  if (Kod != 0) {
    Memo1->Lines->Add ("Failed to read the main measured value");
    return;
  }
  // ................... Answer format
  POutputBuffer = (union _Otvet *) OtvetServera;
  // ................... Formation of a line for displaying the main measurement value in the panel
  Znachenie = POutputBuffer->Data.MD.OsnIzmVel;
  ASCaption.sprintf (FormatOtobrajenia, Znachenie);
  STOsnIzmVel->Caption = ASCaption;
}
// --------------------- Reading speed and power
void __fastcall TForm1::BReadSpeedClick (TObject *Sender)
{
  int Kod, i;
  char OtvetServera [512];
  DWORD PBytesRead;
  union _Otvet *POutputBuffer;
  AnsiString ASCaption;
  float Znachenie;

  // ................... Reading information from the decoder
  if (PDecoder != NULL) {
    Kod = DecoderReadSpeed(PDecoder, OtvetServera, & PBytesRead);
  }
  if (Kod != 0) {
    Memo1->Lines->Add ("Failed to read speed and power");
    return;
  }
  // ................... Answer format
  POutputBuffer = (union _Otvet *) OtvetServera;
  // ................... Formation of a line for displaying speed on the panel
  Znachenie = POutputBuffer->Data.MD.RS.Skorost;
  if (Znachenie <1000) {
	STSkorost->Caption = ASCaption.sprintf ("% 4.1f", Znachenie);
  }
  else {
	STSkorost->Caption = ASCaption.sprintf ("% 4.0f", Znachenie);
  }
  // ................... Formation of a line to display power on the panel
  Znachenie = POutputBuffer->Data.MD.RS.Moschnost;
  STMoschnost->Caption = ASCaption.sprintf (FormatOtobrajenia, Znachenie);
}
// --------------------- Reading temperature
void __fastcall TForm1::BReadTemperatureClick (TObject *Sender)
{
  int Kod, i;
  char OtvetServera [512];
  DWORD PBytesRead;
  union _Otvet *POutputBuffer;
  AnsiString ASCaption;
  float Znachenie;

  // ................... Reading information from the decoder
  if (PDecoder != NULL) {
    Kod = DecoderReadTemperature (PDecoder, OtvetServera, & PBytesRead);
  }
  if (Kod != 0) {
    Memo1->Lines->Add ("Could not read temperature");
    return;
  }
  // ................... Answer format
  POutputBuffer = (union _Otvet *) OtvetServera;
  // ................... Formation of a line for displaying temperature
  Znachenie = POutputBuffer->Data.MD.Temper;
  if (Znachenie <-40) {
    STTemper->Caption = "";
  }
  else {
	STTemper->Caption = ASCaption.sprintf ("% 4.1f", Znachenie);
  }
}
// --------------------- Read all measured values
void __fastcall TForm1::BReadComplexClick (TObject *Sender)
{
  int Kod, i;
  char OtvetServera [512];
  DWORD PBytesRead;
  union _Otvet *POutputBuffer;
  AnsiString ASCaption;
  float Znachenie, AbsZnachenie;

  // ................... Reading information from the decoder
  if (PDecoder != NULL) {
    Kod = DecoderReadComplex (PDecoder, OtvetServera, & PBytesRead);
  }
  if (Kod != 0) {
    Memo1->Lines->Add ("Failed to read measured values");
    return;
  }
  // ................... Answer format
  POutputBuffer = (union _Otvet *) OtvetServera;
  // ................... Formation of a line for displaying the main measurement value in the panel
  Znachenie = POutputBuffer->Data.MD.RC.OsnIzmVel;
  STOsnIzmVel->Caption = FloatToStr(SimpleRoundTo(Znachenie,-3)); --
  //ASCaption.sprintf (FormatOtobrajenia, Znachenie);
  // ................... Formation of a line for displaying temperature
  Znachenie = POutputBuffer->Data.MD.RC.Temper;
  if (Znachenie <-40) {
    STTemper->Caption = "";
  }
  else {
	STTemper->Caption = FloatToStr(Znachenie);
	//ASCaption.sprintf ("% 4.1f", Znachenie);
  }
  // ................... Formation of a line for displaying speed on the panel
  Znachenie = POutputBuffer->Data.MD.RC.Skorost;
  if (Znachenie < 1000) {
	STSkorost->Caption = FloatToStr(Znachenie);
	//ASCaption.sprintf ("% 4.1f", Znachenie);
  }
  else {
	STSkorost->Caption =  FloatToStr(Znachenie);
	//ASCaption.sprintf ("% 4.0f", Znachenie);
  }
  // ................... Formation of a line to display power on the panel
  Znachenie = POutputBuffer->Data.MD.RC.Moschnost;
  STMoschnost->Caption = FloatToStr(Znachenie);
  //ASCaption.sprintf (FormatOtobrajenia, Znachenie);
  Memo2->Lines->Add(STOsnIzmVel->Caption+";"+STSkorost->Caption+";"+STMoschnost->Caption+";");
}
// --------------------- Reading decoder status messages
void __fastcall TForm1::BReadMessageClick (TObject *Sender)
{
  union _Otvet *InputBuffer;
  int Kod, MessageCode;
  int i, KolSob;
  char OtvetServera [512];
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
    Kod = DecoderGetMessage (PDecoder, OtvetServera, & PBytesRead);
  }
  if ((Kod != 0) && (Kod != RET_CODE_NODATA)) {
    Memo1->Lines->Add ("Failed to read decoder status messages");
    return;
  }
  if (Kod == RET_CODE_NODATA) {
    Memo1->Lines->Add (Message13);
    return;
  }
  InputBuffer = (union _Otvet *) OtvetServera;
  KolSob = PBytesRead - 9;
  if (KolSob == 0) {
    Memo1->Lines->Add (Message13); return;
  }
  for (i = 0; i <KolSob; i ++) {
    // Highlight the code of the received message
    MessageCode = InputBuffer->MessageBuffer.Messages [i];
    switch (MessageCode) {
    case 0:
      PMessage = Message13; break;

    case MESSAGE_POLUCHEN_ID: // Received Identifier
      PMessage = Message1; break;

    case MESSAGE_SBOI_SYNCHRO: // Sync failed
      PMessage = Message2; break;

    case MESSAGE_VOSST_SYNCHRO: // Restore Sync
      PMessage = Message12; break;

    case MESSAGE_OSHIBKA_ID: // Identifier Distortion
      PMessage = Message3; break;

    case MESSAGE_DATCHIK_OFF: // Sensor disconnected
      PMessage = Message4; break;

    case MESSAGE_DATCHIK_ON: // Sensor connected
      PMessage = Message5; break;

    case MESSAGE_DECODER_OFF: // Decoder disconnected
      PMessage = Message6; break;

    case MESSAGE_DECODER_ON: // Decoder connected
      PMessage = Message7; break;

    case MESSAGE_ISKAJENIA: // Transmission-distortion
      PMessage = Message8; break;

    case MESSAGE_OSHIBKA_IO: // I / O Error
      PMessage = Message9; break;

    case MESSAGE_NET_PAUSY: // There is no pause in reception
      PMessage = Message10; break;

    case MESSAGE_NETWORK_OFF: // No network access
      PMessage = Message11; break;

    case MESSAGE_BUFFER_LOSS: // Loss of data buffer during stream reading
      PMessage = Message14; break;

    case MESSAGE_MESSAGEQ_OVERFL: // There was a message queue overflow
      PMessage = Message15; break;

    default:
      PMessage = NULL; break;
    }
    if (PMessage != NULL) {
      US = PMessage;
      US = L"Read message \"" + US + L"\"";
      Memo1->Lines->Add (US);
    }
  }
}
// --------------------- Clear the display panel
void __fastcall TForm1::BClearClick (TObject *Sender)
{
    STOsnIzmVel->Caption = "";
    STTemper->Caption = "";
    STSkorost->Caption = "";
    STMoschnost->Caption = "";
}
// ------------------------------------------------ ---------------------------
void __fastcall TForm1::CBDecoderTypeChange (TObject *Sender)
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
void TForm1::Pause (unsigned int Timeout)
{
  TEvent *PEvent2;

  PEvent2 = new TEvent (NULL, false, false, NULL, false);
  PEvent2->WaitFor (Timeout);
  delete PEvent2;
}
// ------------------------------------------------ ---------------------------

void __fastcall TForm1::TimerMainTimer(TObject *Sender)
{
 BReadComplexClick(Form1);
 /*
 QUpd->ParamByName("TORQ")->AsFloat = StrToFloat(STOsnIzmVel->Caption);
 QUpd->ParamByName("ROT")->AsFloat =  StrToFloat(STSkorost->Caption);
 QUpd->ParamByName("POWER")->AsFloat = StrToFloat(STMoschnost->Caption);
 QUpd->ExecSQL();
 */
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button1Click(TObject *Sender)
{
 TimerMain->Enabled = !TimerMain->Enabled;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::TimerCommandTimer(TObject *Sender)
{
 QCommand->Open();
 if (QCommand->FieldByName("command")->AsInteger == 1)
  {
   if (!Connected){
	Qtemp->Close();
	Qtemp->SQL->Clear();
	Qtemp->SQL->Add("Delete from command where command = 1");
	Qtemp->ExecSQL();




	BConnectClick(Form1);
   }

   Panel3->Color = clRed;
   TimerMain->Enabled = true;
  }
 if (QCommand->FieldByName("command")->AsInteger == 0)
  {
   TimerMain->Enabled = false;
   if (Connected) {
	Qtemp->Close();
	Qtemp->SQL->Clear();
	Qtemp->SQL->Add("Delete from command where command = 0");
	Qtemp->ExecSQL();



	BDisconnectClick(Form1);
   }
   for(int i=0;i<Memo2->Lines->Count-1;i++){

   }

   Panel3->Color = clBtnFace;
  }
 QCommand->Close();
}
//---------------------------------------------------------------------------

