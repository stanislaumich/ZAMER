unit USettings;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
	System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
	FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
	FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
	FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
	FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
	TFSettings = class(TForm)
		GroupBox1: TGroupBox;
		RadioButton1: TRadioButton;
		RadioButton2: TRadioButton;
		RadioButton3: TRadioButton;
		Edit1: TEdit;
		Edit2: TEdit;
		Edit3: TEdit;
		BitBtn1: TBitBtn;
		BitBtn2: TBitBtn;
		qdel: TFDQuery;
		Qins: TFDQuery;
		QGet: TFDQuery;
		GroupBox2: TGroupBox;
		DataSource1: TDataSource;
		FDTable1: TFDTable;
		DBGrid1: TDBGrid;
		procedure BitBtn1Click(Sender: TObject);
		procedure BitBtn2Click(Sender: TObject);
		procedure FormShow(Sender: TObject);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	FSettings: TFSettings;

implementation

{$R *.dfm}

uses umain;

procedure TFSettings.BitBtn1Click(Sender: TObject);
begin
	qdel.ExecSQL;
	Qins.parambyname('name').Asstring  := 'set_yes';
	Qins.parambyname('value').Asstring := Edit1.Text;
	Qins.ExecSQL;
	Qins.parambyname('name').Asstring  := 'set_no';
	Qins.parambyname('value').Asstring := Edit2.Text;
	Qins.ExecSQL;
	Qins.parambyname('name').Asstring  := 'set_un';
	Qins.parambyname('value').Asstring := Edit3.Text;
	Qins.ExecSQL;
	FSettings.Close;
end;

procedure TFSettings.BitBtn2Click(Sender: TObject);
begin
	FSettings.Close;
end;

procedure TFSettings.FormShow(Sender: TObject);
begin
	QGet.Close;
	QGet.parambyname('name').Asstring := 'set_yes';
	QGet.Open;
	Edit1.Text := QGet.FieldByName('value').Asstring;
	QGet.Close;
	QGet.parambyname('name').Asstring := 'set_no';
	QGet.Open;
	Edit2.Text := QGet.FieldByName('value').Asstring;
	QGet.Close;
	QGet.parambyname('name').Asstring := 'set_un';
	QGet.Open;
	Edit3.Text := QGet.FieldByName('value').Asstring;
	QGet.Close;
end;

end.
