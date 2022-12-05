unit Unagr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.Grids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFNagr = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label6: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    GroupBox3: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    GroupBox4: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    StringGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ProgressBar1: TProgressBar;
    Edit4: TEdit;
    Edit5: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Edit6: TEdit;
    Label26: TLabel;
    Edit8: TEdit;
    Label27: TLabel;
    Edit7: TEdit;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    QTemp: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNagr: TFNagr;

implementation
 uses uzv2main;
{$R *.dfm}

procedure TFNagr.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('update zini set value=' + Quotedstr(FNagr.Edit1.Text)+' where name='+Quotedstr('nagtime'));
  QTemp.ExecSQL;

  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('update zdelta set value=' + Quotedstr(FNagr.Edit2.Text)+' where name='+Quotedstr('unag'));
  QTemp.ExecSQL;

  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('update zdelta set value=' + Quotedstr(FNagr.Edit3.Text)+' where name='+Quotedstr('pnag'));
  QTemp.ExecSQL;




end;

procedure TFNagr.FormCreate(Sender: TObject);
var
  i, j: Integer;
  s   : string;
begin
  StringGrid1.cells[0, 0]  := 'Нагрузка';
  StringGrid1.cells[1, 0]  := 'U сред В.';
  StringGrid1.cells[2, 0]  := 'I сред А.';
  StringGrid1.cells[3, 0]  := 'P сред Вт.';
  StringGrid1.cells[4, 0]  := 'N сред об.мин';
  StringGrid1.cells[5, 0]  := 'М сред Нм';
  StringGrid1.cells[6, 0]  := 'T, C';
  StringGrid1.cells[7, 0]  := 'R, Ом';
  StringGrid1.cells[8, 0]  := 'T1,C';
  StringGrid1.cells[9, 0]  := 'T2,C';
  StringGrid1.cells[10, 0] := 'T3,C';
  StringGrid1.cells[0, 1]  := 'Без нагрузки';
  StringGrid1.cells[0, 2]  := 'С нагрузкой';

  StringGrid1.DefaultColWidth := 100;

  QTemp.Open('select value from zini where name=' + Quotedstr('nagtime'));
  FNagr.Edit1.Text := QTemp.FieldByName('value').Asstring;
  QTemp.Close;
  QTemp.Open('select value from zdelta where name=' + Quotedstr('unag'));
  FNagr.Edit2.Text := QTemp.FieldByName('value').Asstring;
  QTemp.Close;
  QTemp.Open('select value from zdelta where name=' + Quotedstr('pnag'));
  FNagr.Edit3.Text := QTemp.FieldByName('value').Asstring;
  QTemp.Close;


end;

end.
