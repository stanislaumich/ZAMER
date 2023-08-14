// ---------------------------------------------------------------------------
#ifndef MainH
#define MainH
// ---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Dialogs.hpp>
#include <Data.DB.hpp>
#include <FireDAC.Comp.Client.hpp>
#include <FireDAC.Comp.DataSet.hpp>
#include <FireDAC.DApt.hpp>
#include <FireDAC.DApt.Intf.hpp>
#include <FireDAC.DatS.hpp>
#include <FireDAC.Phys.hpp>
#include <FireDAC.Phys.Intf.hpp>
#include <FireDAC.Phys.Oracle.hpp>
#include <FireDAC.Phys.OracleDef.hpp>
#include <FireDAC.Stan.Async.hpp>
#include <FireDAC.Stan.Def.hpp>
#include <FireDAC.Stan.Error.hpp>
#include <FireDAC.Stan.Intf.hpp>
#include <FireDAC.Stan.Option.hpp>
#include <FireDAC.Stan.Param.hpp>
#include <FireDAC.Stan.Pool.hpp>
#include <FireDAC.UI.Intf.hpp>
#include <FireDAC.VCLUI.Wait.hpp>
#include <Vcl.Buttons.hpp>

// ---------------------------------------------------------------------------

#define WM_MESSAGE_START WM_USER+1;
#define WM_MESSAGE_STOP  WM_USER+2;

class TForm1 : public TForm {
__published: // IDE-managed Components
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
	TTimer *TimerMain;
	TButton *Button1;
	TMemo *Memo2;
	TTimer *TimerCommand;
	TFDConnection *FDC;
	TFDQuery *QCommand;
	TPanel *Panel3;
	TFDQuery *QUpd;
	TFDQuery *Qtemp;
	TFDQuery *QIns;
	TTimer *TimerStart;
	TLabel *Label1;
	TEdit *Edit1;
	TBitBtn *BitBtn1;
	TBitBtn *BitBtn2;
	TRadioButton *RadioButton1;
	TRadioButton *RadioButton2;
	TRadioButton *RadioButton3;
	TRadioButton *RadioButton4;
	TRadioButton *RadioButton5;
	TRadioButton *RadioButton6;
	TEdit *ESpeed;
	TLabel *Label2;
	TLabel *Label8;
	TEdit *EAvF;
	TLabel *Label9;
	TComboBox *ComboBox1;
	TButton *Button2;
	TButton *Button3;
	TLabel *Label10;
	TLabel *Label11;
	TButton *Button4;
	TCheckBox *CheckBox1;

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
	void __fastcall TimerMainTimer(TObject *Sender);
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall TimerStartTimer(TObject *Sender);
	void __fastcall BitBtn2Click(TObject *Sender);
	void __fastcall BitBtn1Click(TObject *Sender);
	void __fastcall Edit1Exit(TObject *Sender);
	void __fastcall Button2Click(TObject *Sender);
	void __fastcall Button3Click(TObject *Sender);
	void __fastcall Button4Click(TObject *Sender);

private: // User declarations
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

	BEGIN_MESSAGE_MAP /*VCL_MESSAGE_HANDLER(WM_USER + 1, TMessage, MyStart)
		VCL_MESSAGE_HANDLER(WM_USER + 2, TMessage, MyStop)*/
		VCL_MESSAGE_HANDLER
		(WM_COPYDATA, TMessage, MyData) END_MESSAGE_MAP(TForm)
		void __fastcall MyStart(TMessage & Message);
	void __fastcall MyStop(TMessage & Message);
	void __fastcall MyData(TMessage & Message);

public: // User declarations
	__fastcall TForm1(TComponent* Owner);
	void Pause(unsigned int Timeout);
};

// ---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
// ---------------------------------------------------------------------------
#endif
