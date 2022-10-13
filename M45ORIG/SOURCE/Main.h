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
class TDSaver;

// ---------------------------------------------------------------------------
class TForm1 : public TForm {
__published: // IDE-managed Components
	TPanel *Panel1;
	TPanel *Panel2;
	TMemo *Memo1;
	TButton *BConnect;
	TButton *BStart;
	TButton *BStop;
	TButton *BDisconnect;
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
	TTimer *ReflectionTimer;
	TComboBox *CBDecoderType;
	TLabel *LComPortNumber;
	TEdit *EComPortNumber;
	TLabel *LBaudRate;
	TComboBox *CBBaudRate;
	TUpDown *UpDown2;
	TLabel *LUnitNumber;
	TEdit *EUnitNumber;
	TUpDown *UpDown3;
	TLabel *LServerAddress;
	TEdit *EServerAddress;
	TLabel *LPortNumber;
	TEdit *EPortNumber;
	TUpDown *UpDown4;
	TLabel *LAveragingFactor;
	TEdit *EAveragingFactor;
	TUpDown *UpDown5;
	TLabel *Label1;
	TTimer *TS;
	TTimer *TQ;
	TFDConnection *FDConnection1;
	TFDQuery *Query1;
	TFDQuery *QUpd;
	TLabel *Label2;
	TEdit *Edit1;
	TBitBtn *BitBtn1;
	TTimer *TimerCommand;
	TFDQuery *QCommand;

	void __fastcall BConnectClick(TObject *Sender);
	void __fastcall BStartClick(TObject *Sender);
	void __fastcall BStopClick(TObject *Sender);
	void __fastcall BDisconnectClick(TObject *Sender);
	void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
	void __fastcall ReflectionTimerTimer(TObject *Sender);
	void __fastcall CBDecoderTypeChange(TObject *Sender);
	void __fastcall TSTimer(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall FormCloseQuery(TObject *Sender, bool &CanClose);
	void __fastcall TQTimer(TObject *Sender);
	void __fastcall BitBtn1Click(TObject *Sender);
	void __fastcall TimerCommandTimer(TObject *Sender);

private: // User declarations
	int ClientID;
	TDecoder *PDecoder;
	int PortBase;
	int NKan;
	char StrokaDatchikID[10];
	struct _SK SK;
	struct _SpecialParametrs *PSpecialParametrs;
	char *FormatOtobrajenia;
	int DecoderType;

	void DataProcessing(struct _DataFrame *PDataFrame);
	void TemperatureProcessing(float Temperature);
	void MessageProcessing(double Time, int MessageIndex, bool Local);

public: // User declarations
	TCriticalSection *SostDat_CrSe;
	double SummaZn_Osn; // Сумма значений основной измеряемой величины
	int KolIzmOto; // Количество измерений для усреднения данных
	float Skorost; // рассчитанная скорость
	float Moshn; // рассчитанная мощность
	float Temperature; // температура
	bool EstIzm;
	bool EstID;

	__fastcall TForm1(TComponent* Owner);
	int Init(void);
	void __fastcall UserMessage(Messages::TMessage& msg);

	BEGIN_MESSAGE_MAP MESSAGE_HANDLER(WM_USER + 1, TMessage, UserMessage);
	END_MESSAGE_MAP(TControl)

};

// ---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
// ---------------------------------------------------------------------------
#endif
