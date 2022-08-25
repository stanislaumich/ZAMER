// ---------------------------------------------------------------------------

#ifndef UMainH
#define UMainH
// ---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include "DecoderBroker.h"
#include <Vcl.Dialogs.hpp>
#include <Data.DB.hpp>
#include <FireDAC.Comp.Client.hpp>
#include <FireDAC.Phys.hpp>
#include <FireDAC.Phys.Intf.hpp>
#include <FireDAC.Phys.SQLite.hpp>
#include <FireDAC.Phys.SQLiteDef.hpp>
#include <FireDAC.Phys.SQLiteWrapper.Stat.hpp>
#include <FireDAC.Stan.Async.hpp>
#include <FireDAC.Stan.Def.hpp>
#include <FireDAC.Stan.Error.hpp>
#include <FireDAC.Stan.ExprFuncs.hpp>
#include <FireDAC.Stan.Intf.hpp>
#include <FireDAC.Stan.Option.hpp>
#include <FireDAC.Stan.Pool.hpp>
#include <FireDAC.UI.Intf.hpp>
#include <FireDAC.VCLUI.Wait.hpp>
#include <FireDAC.Comp.DataSet.hpp>
#include <FireDAC.DApt.hpp>
#include <FireDAC.DApt.Intf.hpp>
#include <FireDAC.DatS.hpp>
#include <FireDAC.Stan.Param.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.ComCtrls.hpp>
#include <FireDAC.Phys.Oracle.hpp>
#include <FireDAC.Phys.OracleDef.hpp>
#include <Vcl.Buttons.hpp>

// ---------------------------------------------------------------------------
class TForm1 : public TForm {
__published: // IDE-managed Components
	TGroupBox *GroupBox2;
	TGroupBox *GroupBox4;
	TMemo *Memo1;
	TFDConnection *FDC;
	TFDQuery *Query1;
	TTimer *Timer1;
	TLabel *Label2;
	TLabel *Label3;
	TLabel *Label4;
	TLabel *Label11;
	TLabel *Label12;
	TLabel *Label13;
	TTimer *Timer3;
	TFDQuery *Query2;
	TLabel *Label1;
	TEdit *Edit1;
	TLabel *Label5;
	TLabel *Label6;
	TEdit *Edit2;
	TEdit *Edit3;
	TBitBtn *BitBtn1;

	void __fastcall Button2Click(TObject *Sender);
	void __fastcall FormCloseQuery(TObject *Sender, bool &CanClose);
	void __fastcall Timer1Timer(TObject *Sender);
	void __fastcall Timer3Timer(TObject *Sender);
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall BitBtn1Click(TObject *Sender);
	void __fastcall FormActivate(TObject *Sender);

private: // User declarations
	TDecoder *PDecoder;
	struct _SpecialParametrs *PSpecialParametrs;

public: // User declarations
	__fastcall TForm1(TComponent* Owner);
	void __fastcall BConnect();
};

// ---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
// ---------------------------------------------------------------------------
#endif
