#include "stdafx.h"
#include "Form1.h"
#include <stdio.h>
#include <vcclr.h>
#include <shlwapi.h>
#include "VCDecoder.h"
//-----------------------------------------------------------------------------
using namespace Example3;
//-----------------------------------------------------------------------------
  char *MasFormatovRas[4]={"%4.0f", "%4.2f", "%4.1f", "%4.3f"};

//-----------------------------------------------------------------------------
Form1::Form1(void)
{
  InitializeComponent();

  PDecoder = NULL;
  BDisconnect->Enabled = false;
  BReadBase->Enabled = false;
  BReadSpeed->Enabled = false;
  BReadTemperature->Enabled = false;
  BReadComplex->Enabled = false;
  BReadMessage->Enabled = false;

  CBDecoderType->SelectedIndex = 0;
  CBDecoderTypeChange();
}
//--------------------- Release all resources used.
Form1::~Form1()
{
  if (components) {
    delete components;
  }
}
//-----------------------------------------------------------------------------
void Form1::CBDecoderTypeChange(void)
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

  switch (CBDecoderType->SelectedIndex) {
  case 0:  // T26
    DecoderType = MODBUS_DECODER;
    LComPortNumber->Enabled = true;
    EComPortNumber->Enabled = true;
    LBaudRate->Enabled = true;
    CBBaudRate->Enabled = true;
    LUnitNumber->Enabled = true;
    EUnitNumber->Enabled = true;
    break;
  case 1:  // T32
    DecoderType = COMPORT_DECODER_T32;
    LComPortNumber->Enabled = true;
    EComPortNumber->Enabled = true;
    LBaudRate->Enabled = true;
    CBBaudRate->Enabled = true;
    break;
  case 2:  // T35
    DecoderType = USB_DECODER_T35;
    break;
  case 3:  // T36
    DecoderType = MODBUS_DECODER_T36;
    LComPortNumber->Enabled = true;
    EComPortNumber->Enabled = true;
    LBaudRate->Enabled = true;
    CBBaudRate->Enabled = true;
    LUnitNumber->Enabled = true;
    EUnitNumber->Enabled = true;
    break;
  case 4:  // T37
    DecoderType = ETHERNET_DECODER_T37;
    LServerAddress->Enabled = true;
    EServerAddress->Enabled = true;
    LPortNumber->Enabled = true;
    EPortNumber->Enabled = true;
    break;
  case 5:  // T42
    DecoderType = COMPORT_DECODER_T42;
    LComPortNumber->Enabled = true;
    EComPortNumber->Enabled = true;
    LBaudRate->Enabled = true;
    CBBaudRate->Enabled = true;
    break;
  case 6:  // T45
    DecoderType = USB_DECODER_T45;
    break;
  case 7:  // T42
    DecoderType = MODBUS_DECODER_T46;
    LComPortNumber->Enabled = true;
    EComPortNumber->Enabled = true;
    LBaudRate->Enabled = true;
    CBBaudRate->Enabled = true;
    LUnitNumber->Enabled = true;
    EUnitNumber->Enabled = true;
    break;
  case 8: // Simulator
    DecoderType = SIMULATOR_DECODER;
    break;
  case 9:  // Indicator T42(USB)
	DecoderType = USB_INDICATOR;
	break;
  case 10:  // Indicator T42(RS-232)
	DecoderType = COMPORT_INDICATOR;
	LComPortNumber->Enabled = true;
	EComPortNumber->Enabled = true;
	LBaudRate->Enabled = true;
	CBBaudRate->Enabled = true;
	break;
  case 11:  // Indicator T42(RS-485)
	DecoderType = MODBUS_INDICATOR;
	LComPortNumber->Enabled = true;
	EComPortNumber->Enabled = true;
	LBaudRate->Enabled = true;
	CBBaudRate->Enabled = true;
	LUnitNumber->Enabled = true;
	EUnitNumber->Enabled = true;
	break;
  case 12:  // Indicator T42(Ethernet)
	DecoderType = ETHERNET_INDICATOR;
	LServerAddress->Enabled = true;
	EServerAddress->Enabled = true;
	LPortNumber->Enabled = true;
	EPortNumber->Enabled = true;
	EServerAddress->Text = "IT42E1";
	break;
  }
}
//--------------------- "Create+Open" Button
void Form1::ConnectClick(void)
{
  using namespace System;

  pin_ptr<const wchar_t> PtrCWSTR;
  char  ServerAddress[300];
  char  TempChar[10];
  String ^AS;
  int Index;
  struct _ParamComPort ParamComPort;
  int PortBase;
  char StrokaDatchikID[10];
  struct _SK SK;
  struct _SpecialParametrs *PSpecialParametrs;

  PtrCWSTR = PtrToStringChars(EPortNumber->Text);
  WideCharToMultiByte(1251, 0, PtrCWSTR, -1, TempChar, 10, NULL, 0);
  PortBase = atoi(TempChar);
  AS = EServerAddress->Text;
  PtrCWSTR = PtrToStringChars(AS);
  WideCharToMultiByte(1251, 0, PtrCWSTR, -1, ServerAddress, 300, NULL, 0);
  BConnect->Enabled = false;
  // ................... Memory request for the structure
  PSpecialParametrs = (struct _SpecialParametrs *) calloc(sizeof(struct _SpecialParametrs), 1);
  // ................... Formation of the AveragingFactor parameter
  PtrCWSTR = PtrToStringChars(EAveragingFactor->Text);
  WideCharToMultiByte(1251, 0, PtrCWSTR, -1, TempChar, 10, NULL, 0);
  PSpecialParametrs->AveragingFactor = atoi(TempChar);
  // ................... Formation of the SpeedMeasurementPeriod parameter
  PSpecialParametrs->SpeedMeasurementPeriod = 1000; // Period of measurement of speed
													// ................... Formation of the ComPortNumber parameter
  PtrCWSTR = PtrToStringChars(EComPortNumber->Text);
  WideCharToMultiByte(1251, 0, PtrCWSTR, -1, TempChar, 10, NULL, 0);
  PSpecialParametrs->ComPortNumber = atoi(TempChar);
  // ................... Formation of the MODBUS_DeviceAddress parameter
  PtrCWSTR = PtrToStringChars(EUnitNumber->Text);
  WideCharToMultiByte(1251, 0, PtrCWSTR, -1, TempChar, 10, NULL, 0);
  PSpecialParametrs->MODBUS_DeviceAddress = atoi(TempChar);
  // ................... Formation of the BaudRate parameter
  AS = CBBaudRate->SelectedItem->ToString();
  PtrCWSTR = PtrToStringChars(AS);
  WideCharToMultiByte(1251, 0, PtrCWSTR, -1, TempChar, 10, NULL, 0);
  ParamComPort.BaudRate = atoi(TempChar);
  // ................... Formation of other parameters of ParamComPort
  ParamComPort.BiteSize = 8;
  ParamComPort.Parity = 0;
  ParamComPort.StopBits = 0;
  PSpecialParametrs->PParamComPort = &ParamComPort;
  PSpecialParametrs->ServerAddress = ServerAddress; // Decoder address on the local network
  PSpecialParametrs->AnotherServerBasePortNumber = PortBase; // The base address of the decoder port

  // ................... Creating a decoder
  PDecoder = DecoderCreate(1, DecoderType, NULL, NULL, PSpecialParametrs);
  free(PSpecialParametrs);
  // ................... Opening the decoder
  int Kod = DecoderOpen(PDecoder, 0);
  if (Kod!= 0) {
	  Memo1->AppendText("Failed to open the decoder \n");
	  return;
  }
  else {
	  Memo1->AppendText("Decoder is open \n");
  }
  // ................... Read the service channel of the sensor
  Kod = DecoderReadTranducerParametrs(PDecoder, &SK, StrokaDatchikID);
  if (Kod!= 0) {
	  Memo1->AppendText("Could not read service channel \n");
	  return;
  }
  else {
	  Memo1->AppendText("Service channel read \n");
  }
  // ................... Display the sensor ID
  EDatchikID->Text = gcnew String(StrokaDatchikID);
  // ................... Retrieve data dimension
  int Razmernost = SK.ID_Datchik[1] >> 4; // Number 3
  // ................... Calculation of the index for setting display formats
  switch (Razmernost) {
  case 0: case 3: case 6: case 9: case 12: Index = 0; break;
  case 1: case 4: case 7: case 10: case 14: Index = 1; break;
  case 2: case 5: case 8: case 11: case 13: Index = 2; break;
  case 15: Index = 3; break;
  }
  FormatOtobrajenia = MasFormatovRas[Index];
  BDisconnect->Enabled = true;
  BReadBase->Enabled = true;
  BReadSpeed->Enabled = true;
  BReadTemperature->Enabled = true;
  BReadComplex->Enabled = true;
  BReadMessage->Enabled = true;
}
//-----------------------------------------------------------------------------
void Form1::DisconnectClick(void)
{
  if (PDecoder != NULL) {
    DecoderClose(PDecoder);
    PDecoder = NULL;
    Memo1->AppendText("Decoder closed\n");
  }
  BConnect->Enabled = true;
  BDisconnect->Enabled = false;
  BReadBase->Enabled = false;
  BReadSpeed->Enabled = false;
  BReadTemperature->Enabled = false;
  BReadComplex->Enabled = false;
  BReadMessage->Enabled = false;
}
//-----------------------------------------------------------------------------
System::Void Form1::CBDecoderType_SelectedIndexChanged(System::Object^  sender, System::EventArgs^  e) 
{
  CBDecoderTypeChange();
}
//-----------------------------------------------------------------------------
System::Void Form1::BConnect_Click(System::Object^  sender, System::EventArgs^  e) 
{
  ConnectClick(); 
}
//--------------------- "Close" Button
System::Void Form1::BDisconnect_Click(System::Object^  sender, System::EventArgs^  e)
{
  DisconnectClick();
}
//--------------------- CLOSING FORM
System::Void Form1::Form1_FormClosing(System::Object^  sender, System::Windows::Forms::FormClosingEventArgs^  e) 
{
  DisconnectClick();
}
//--------------------- Clear display panel
System::Void Form1::BClear_Click(System::Object^  sender, System::EventArgs^  e)
{
  STOsnIzmVel->Text = "";
  STTemper->Text = "";
  STSkorost->Text = "";
  STMoschnost->Text = "";
}
//--------------------- Reading the main measured value
System::Void Form1::BReadBase_Click(System::Object^  sender, System::EventArgs^  e)
{
  int Kod;
  char  OtvetServera[100];
  DWORD PBytesRead;
  union _Otvet *PInputBuffer;
  float Znachenie;
  char TempChar[10];

  //................... Reading information from a decoder
  if (PDecoder!=NULL) {
    Kod = DecoderReadBase(PDecoder,OtvetServera,&PBytesRead);
  }
  if (Kod!=0) {
    Memo1->AppendText("Failed to read the main measured value\n");
    return;
  }
  //................... Response format
  PInputBuffer = (union _Otvet *)OtvetServera;
  //................... Formation of a line to display the main measurement value in the panel
  Znachenie = PInputBuffer->Data.MD.OsnIzmVel;
  sprintf_s(TempChar, FormatOtobrajenia, Znachenie);
  STOsnIzmVel->Text = gcnew String(TempChar);
}
//--------------------- Reading speed and power
System::Void Form1::BReadSpeed_Click(System::Object^  sender, System::EventArgs^  e)
{
  int Kod;
  char  OtvetServera[100];
  DWORD PBytesRead;
  union _Otvet *PInputBuffer;
  float Znachenie;
  char TempChar[10];

  //................... Reading speed
  if (PDecoder!=NULL) {
    Kod = DecoderReadSpeed(PDecoder,OtvetServera,&PBytesRead);
  }
  if (Kod!=0) {
    Memo1->AppendText("Failed to read speed and power\n");
    return;
  }
  //................... Response format
  PInputBuffer = (union _Otvet *)OtvetServera;
  //................... Formation of a line for displaying speed on the panel
  Znachenie = PInputBuffer->Data.MD.RS.Skorost;
  if (Znachenie < 1000) {
    sprintf_s(TempChar, "%4.1f", Znachenie);
  }
  else {
    sprintf_s(TempChar, "%4.0f", Znachenie);
  }
  STSkorost->Text = gcnew String(TempChar);
  //................... Formation of a line for displaying power on the panel
  Znachenie = PInputBuffer->Data.MD.RS.Moschnost;
  sprintf_s(TempChar, FormatOtobrajenia, Znachenie);
  STMoschnost->Text = gcnew String(TempChar);
}
//--------------------- Temperature reading
System::Void Form1::BReadTemperature_Click(System::Object^  sender, System::EventArgs^ e)
{
  int Kod;
  char  OtvetServera[100];
  DWORD PBytesRead;
  union _Otvet *PInputBuffer;
  float Znachenie;
  char TempChar[10];

  //................... Temperature reading
  if (PDecoder!=NULL) {
    Kod = DecoderReadTemperature(PDecoder,OtvetServera,&PBytesRead);
  }
  if (Kod!=0) {
    Memo1->AppendText("Failed to read temperature\n");
    return;
  }
  //................... Response format
  PInputBuffer = (union _Otvet *)OtvetServera;
  //................... Formation of a line for displaying temperature
  Znachenie = PInputBuffer->Data.MD.Temper;
  if (Znachenie < -40) {
    STTemper->Text = L"";
  }
  else {
    sprintf_s(TempChar, "%4.1f", Znachenie);
    STTemper->Text = gcnew String(TempChar);
  }
}
//--------------------- Reading all measured values
System::Void Form1::BReadComplex_Click(System::Object^  sender, System::EventArgs^  e)
{
  int Kod;
  char  OtvetServera[100];
  DWORD PBytesRead;
  union _Otvet *PInputBuffer;
  float Znachenie;
  char TempChar[10];

  //................... Reading all measured values
  if (PDecoder!=NULL) {
    Kod = DecoderReadComplex(PDecoder,OtvetServera,&PBytesRead);
  }
  if (Kod!=0) {
    Memo1->AppendText("Failed to read measured values\n");
    return;
  }
  //................... Response format
  PInputBuffer = (union _Otvet *)OtvetServera;
  //................... Formation of a line to display the main measurement value in the panel
  Znachenie = PInputBuffer->Data.MD.RC.OsnIzmVel;
  sprintf_s(TempChar, FormatOtobrajenia, Znachenie);
  STOsnIzmVel->Text = gcnew String(TempChar);
  //................... Formation of a line for displaying temperature
  Znachenie = PInputBuffer->Data.MD.RC.Temper;
  if (Znachenie < -40) {
    STTemper->Text = "";
  }
  else {
    sprintf_s(TempChar, "%4.1f", Znachenie);
    STTemper->Text = gcnew String(TempChar);
  }
  //................... Formation of a line for displaying speed on the panel
  Znachenie = PInputBuffer->Data.MD.RC.Skorost;
  if (Znachenie < 1000) {
    sprintf_s(TempChar, "%4.1f", Znachenie);
  }
  else {
    sprintf_s(TempChar, "%4.0f", Znachenie);
  }
  STSkorost->Text = gcnew String(TempChar);
  //................... Formation of a line for displaying power on the panel
  Znachenie = PInputBuffer->Data.MD.RC.Moschnost;
  sprintf_s(TempChar, FormatOtobrajenia, Znachenie);
  STMoschnost->Text = gcnew String(TempChar);
}
//--------------------- Reading decoder status messages
System::Void Form1::BReadMessage_Click(System::Object^  sender, System::EventArgs^  e)
{
  union _Otvet *InputBuffer;
  int Kod, MessageCode;
  int i, KolSob;
  char  OtvetServera[100];
  DWORD PBytesRead;
  char *PMessage;
  char Message1[] = "Received sensor ID";
  char Message2[] = "Sync failed";
  char Message3[] = "Distorting the Identifier";
  char Message4[] = "Sensor disconnected";
  char Message5[] = "Sensor connected";
  char Message6[] = "The decoder is disconnected";
  char Message7[] = "The decoder is connected";
  char Message8[] = "Transmission distortion";
  char Message9[] = "I/O Error";
  char Message10[] = "There is no pause in reception";
  char Message11[] = "No network access";
  char Message12[] = "Restore Sync";
  char Message13[] = "There are no messages from the decoder";
  char Message14[] = "Loss of data buffer during stream reading";
  char Message15[] = "The message queue was full";
  String ^S;

  //................... Reading messages
  if (PDecoder != NULL) {
    Kod = DecoderGetMessage(PDecoder, OtvetServera, &PBytesRead);
  }
  if ((Kod != 0)&&(Kod != RET_CODE_NODATA)) {
    Memo1->AppendText("Failed to read decoder status messages\n");
    return;
  }
  if (Kod == RET_CODE_NODATA) {
    S = gcnew String(Message13);  Memo1->AppendText(S + L"\n");  return;
  }

  InputBuffer = (union _Otvet *)OtvetServera;
  KolSob = PBytesRead - 9;
  if (KolSob == 0) {
    S = gcnew String(Message13);  Memo1->AppendText(S + L"\n");  return;
  }
  for (i=0; i<KolSob; i++){
    //................. detecting the code of the received message
    MessageCode = InputBuffer->MessageBuffer.Messages[i];
    switch (MessageCode) {
    case 0: PMessage = Message13;  break;
    case MESSAGE_POLUCHEN_ID:      // Received sensor ID
      PMessage = Message1;  break;
    case MESSAGE_SBOI_SYNCHRO:     // Sync failed
      PMessage = Message2;  break;
    case MESSAGE_VOSST_SYNCHRO:    // Восстановление синхронизации
      PMessage = Message12;  break;
    case MESSAGE_OSHIBKA_ID:       // Distorting the Identifier
      PMessage = Message3;  break;
    case MESSAGE_DATCHIK_OFF:      // Sensor disconnected
      PMessage = Message4;  break;
    case MESSAGE_DATCHIK_ON:       // Sensor connected
      PMessage = Message5;  break;
    case MESSAGE_DECODER_OFF:      // The decoder is disconnected
      PMessage = Message6;  break;
    case MESSAGE_DECODER_ON:       // The decoder is connected
      PMessage = Message7;  break;
    case MESSAGE_ISKAJENIA:        // Transmission distortion
      PMessage = Message8;  break;
    case MESSAGE_OSHIBKA_IO:       // I/O Error
      PMessage = Message9;  break;
    case MESSAGE_NET_PAUSY:        // There is no pause in reception
      PMessage = Message10;  break;
    case MESSAGE_NETWORK_OFF:      // No network access
      PMessage = Message11;  break;
    case MESSAGE_BUFFER_LOSS:      // Loss of data buffer during stream reading
      PMessage = Message14;  break;
    case MESSAGE_MESSAGEQ_OVERFL:  // The message queue was full
      PMessage = Message15;  break;
    default:
      PMessage = NULL;  break;
    }
    if (PMessage != NULL) {
      String ^S = gcnew String(PMessage);
      S = L"Read message \"" + S + L"\"\n";
      Memo1->AppendText(S);
    }
  }
}
//-----------------------------------------------------------------------------
