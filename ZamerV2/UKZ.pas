unit UKZ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.Buttons, System.Actions, Vcl.ActnList, uadd;

type
  TFKZ = class(TForm)
    QTemp: TFDQuery;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Edit1: TEdit;
    GroupBox2: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    StringGrid1: TStringGrid;
    Edit2: TEdit;
    BitBtn10: TBitBtn;
    BitBtn12: TBitBtn;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    TimerUp: TTimer;
    QUp: TFDQuery;
    BitBtn1: TBitBtn;
    procedure BitBtn8Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure TimerUpTimer(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FKZ        : TFKZ;
  enableclose: boolean;

implementation

{$R *.dfm}

Uses uzv2Main, UAuto;

procedure TFKZ.Action1Execute(Sender: TObject);
begin
  BitBtn8Click(FKZ);
end;

procedure TFKZ.Action2Execute(Sender: TObject);
begin
  BitBtn9Click(FKZ);
end;

procedure TFKZ.BitBtn1Click(Sender: TObject);
begin
  Fauto.ShowModal;
end;

procedure TFKZ.BitBtn8Click(Sender: TObject);
var
  s: string;
begin

end;

procedure TFKZ.BitBtn9Click(Sender: TObject);
var
  s: string;
begin

end;

procedure TFKZ.FormActivate(Sender: TObject);
begin
  enableclose := true;
  QTemp.Open('select * from zdelta where name=' + Quotedstr('ukz'));
  Edit1.Text := QTemp.FieldByName('value').AsString;

  TimerUp.Enabled := true;
end;

procedure TFKZ.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TimerUp.Enabled := false;
end;

procedure TFKZ.FormCreate(Sender: TObject);
begin
  StringGrid1.Rowcount    := 6;
  StringGrid1.cells[0, 0] := 'U кк';
  StringGrid1.cells[1, 0] := 'U сред';
  StringGrid1.cells[2, 0] := 'I сред';
  StringGrid1.cells[3, 0] := 'P сред';
  StringGrid1.cells[4, 0] := 'М сред';
  StringGrid1.cells[0, 1] := '380';
  StringGrid1.cells[0, 2] := '100';
end;

procedure TFKZ.FormHide(Sender: TObject);
begin
  TimerUp.Enabled := false;

  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('update zdelta set value= ' + Quotedstr(Edit1.Text) +
    ' where name=' + Quotedstr('ukz'));
  QTemp.ExecSQL;

end;

procedure TFKZ.StringGrid1Click(Sender: TObject);
begin
  if StringGrid1.cells[0, StringGrid1.row] <> '' then
  begin
    Label13.Caption := StringGrid1.cells[0, StringGrid1.row];
    BitBtn8.Enabled := true;
  end;
end;

procedure TFKZ.TimerUpTimer(Sender: TObject);
begin
  QUp.Close;
  QUp.Open();
  Label11.Caption := myformat(trazp, QUp.FieldByName('P').AsFloat);
  Label10.Caption := myformat(trazi, QUp.FieldByName('I').AsFloat);
  Label12.Caption := myformat(trazm, QUp.FieldByName('M').AsFloat);
  if ABS(QUp.FieldByName('U').AsFloat - Strtofloat(Label13.Caption)) >
    myfloat(Edit1.Text) then
    Label9.Font.Color := clRed
  else
    Label9.Font.Color := clGreen;
  Label9.Caption      := myformat(trazu, QUp.FieldByName('U').AsFloat);
end;

end.
