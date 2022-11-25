//---------------------------------------------------------------------------
#ifndef MainH
#define MainH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Dialogs.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:    // IDE-managed Components
    TPanel *Panel1;
    TPanel *Panel2;
    TMemo *Memo1;
    TEdit *EServerAddress;
  TLabel *LPortNumber;
    TButton *BConnect;
    TButton *BDisconnect;
    TButton *BReadBase;
    TButton *BReadSpeed;
    TButton *BReadTemperature;
    TButton *BReadComplex;
    TUpDown *UpDown1;
    TEdit *EPortNumber;
    TStaticText *STOsnIzmVel;
    TStaticText *STSkorost;
    TStaticText *STMoschnost;
    TLabel *Label3;
    TLabel *Label4;
    TLabel *Label5;
    TLabel *Label6;
    TLabel *Label7;
    TStaticText *STTemper;
    TEdit *EDatchikID;
  TLabel *LServerAddress;
    TButton *BReadMessage;
  TButton *BClear;
  TComboBox *CBDecoderType;
  TLabel *LComPortNumber;
  TLabel *LBaudRate;
  TLabel *LUnitNumber;
  TUpDown *UpDown2;
  TUpDown *UpDown3;
  TComboBox *CBBaudRate;
  TLabel *LAveragingFactor;
  TUpDown *UpDown4;
  TEdit *EAveragingFactor;
  TEdit *EComPortNumber;
  TEdit *EUnitNumber;
  TComboBox *CB_Protocol;
  TLabel *LProtocol;
	TTimer *Timer1;
	TButton *Button1;
	TButton *Button2;
	TLabel *Label1;
	TEdit *Edit1;
  void __fastcall BConnectClick(TObject *Sender);
  void __fastcall BDisconnectClick(TObject *Sender);
  void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
  void __fastcall BReadBaseClick(TObject *Sender);
  void __fastcall BReadSpeedClick(TObject *Sender);
  void __fastcall BReadTemperatureClick(TObject *Sender);
  void __fastcall BReadComplexClick(TObject *Sender);
  void __fastcall BReadMessageClick(TObject *Sender);
  void __fastcall BClearClick(TObject *Sender);
  void __fastcall CBDecoderTypeChange(TObject *Sender);
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall Button2Click(TObject *Sender);
	void __fastcall Timer1Timer(TObject *Sender);
  
private:    // User declarations
  int ClientID;
  TDecoder *PDecoder;
  bool EstIzm;
  int PortBase;
  int NKan;
  char StrokaDatchikID[10];
  struct _SK SK;
  struct _SpecialParametrs *PSpecialParametrs;
  char *FormatOtobrajenia;
  int DecoderType;

public:     // User declarations
  __fastcall TForm1(TComponent* Owner);
  void Pause(unsigned int Timeout);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
