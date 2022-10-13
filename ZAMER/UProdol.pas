unit UProdol;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
	System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
	FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
	FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
	FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
	FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids;

type
	TFProdol = class(TForm)
		BitBtn1: TBitBtn;
		BitBtn2: TBitBtn;
		BitBtn3: TBitBtn;
		GroupBox1: TGroupBox;
		GroupBox2: TGroupBox;
		Qselectneokon: TFDQuery;
		Label13: TLabel;
		DateTimePicker1: TDateTimePicker;
		Label14: TLabel;
		ComboBox1: TComboBox;
		Label15: TLabel;
		Edit4: TEdit;
		Label16: TLabel;
		ComboBox2: TComboBox;
		Label19: TLabel;
		Edit7: TEdit;
		Label20: TLabel;
		ComboBox3: TComboBox;
		Label17: TLabel;
		Edit5: TEdit;
		Label18: TLabel;
		Edit6: TEdit;
		Label21: TLabel;
		Label22: TLabel;
		Edit8: TEdit;
		Edit9: TEdit;
		ComboBox4: TComboBox;
		Label24: TLabel;
		Label23: TLabel;
		Label25: TLabel;
		Edit10: TEdit;
		Label26: TLabel;
		Edit11: TEdit;
		DataSource1: TDataSource;
		DBGrid1: TDBGrid;
		DataSource2: TDataSource;
		QCount: TFDQuery;
		GroupBox3: TGroupBox;
		DBGrid2: TDBGrid;
		Label2: TLabel;
		Label1: TLabel;
		Label3: TLabel;
		Edit1: TEdit;
		Label4: TLabel;
		Edit2: TEdit;
		procedure DBGrid1CellClick(Column: TColumn);
		procedure BitBtn2Click(Sender: TObject);
		procedure BitBtn1Click(Sender: TObject);
		procedure FormActivate(Sender: TObject);
		procedure BitBtn3Click(Sender: TObject);

	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	FProdol: TFProdol;

implementation

uses umain;
{$R *.dfm}

procedure TFProdol.BitBtn1Click(Sender: TObject);
begin
	fmain.edit13.text := '0';
	nomer             := '0';
	FProdol.Close;
end;

procedure TFProdol.BitBtn2Click(Sender: TObject);
begin
	fmain.edit13.text := Label2.caption;
	nomer             := Label2.caption;
	FProdol.Close;
end;

procedure TFProdol.BitBtn3Click(Sender: TObject);
begin
	Qselectneokon.Close;
	Qselectneokon.Open;
end;

procedure TFProdol.DBGrid1CellClick(Column: TColumn);
begin
	ComboBox1.text  := Qselectneokon.fieldbyname('tipdv').AsString;
	Label2.caption  := Qselectneokon.fieldbyname('nomer').AsString;
	Edit4.text      := Qselectneokon.fieldbyname('nomdv').AsString;
	ComboBox2.text  := Qselectneokon.fieldbyname('polus').AsString;
	Edit7.text      := Qselectneokon.fieldbyname('pnom').AsString;
	ComboBox3.text  := Qselectneokon.fieldbyname('energo').AsString;
	Edit5.text      := Qselectneokon.fieldbyname('unom').AsString;
	Edit6.text      := Qselectneokon.fieldbyname('uisp').AsString;
	Edit8.text      := Qselectneokon.fieldbyname('humid').AsString;
	Edit9.text      := Qselectneokon.fieldbyname('pressur').AsString;
	ComboBox4.text  := Qselectneokon.fieldbyname('stendn').AsString;
	Label24.caption := Qselectneokon.fieldbyname('stenda').AsString;
	Edit11.text     := Qselectneokon.fieldbyname('dop1').AsString;
	Edit10.text     := Qselectneokon.fieldbyname('ispoln').AsString;
	Edit1.text      := Qselectneokon.fieldbyname('fio').AsString;
	Edit2.text      := Qselectneokon.fieldbyname('regim').AsString;
end;

procedure TFProdol.FormActivate(Sender: TObject);
begin
	nomer             := '0';
	fmain.edit13.text := '0';
end;

end.
