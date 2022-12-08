unit URH;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, System.Actions, Vcl.ActnList, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uadd,ustr,math;

type
  TFRH = class(TForm)
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
    Label18: TLabel;
    Label19: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    BitBtn10: TBitBtn;
    GroupBox3: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    GroupBox2: TGroupBox;
    StringGrid1: TStringGrid;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    GroupBox4: TGroupBox;
    StringGrid2: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label20: TLabel;
    Edit4: TEdit;
    Label25: TLabel;
    Edit5: TEdit;
    Label26: TLabel;
    Edit6: TEdit;
    Label27: TLabel;
    Edit7: TEdit;
    QCommand: TFDQuery;
    Qselectsred: TFDQuery;
    QinsAll: TFDQuery;
    QTemp: TFDQuery;
    QInsSvod: TFDQuery;
    ActionList1: TActionList;
    Action1: TAction;
    Timer1000: TTimer;
    TimerUp: TTimer;
    QUp: TFDQuery;
    procedure Action1Execute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TimerUpTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StringGrid2Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure command(b: Boolean);
    procedure loadgrids;
    procedure savegrids;
  end;

var
  FRH        : TFRH;
  enableclose: Boolean;
  nomer:string;
implementation

uses uzv2main;
{$R *.dfm}

procedure TFRH.loadgrids;
var
  i, j, k: integer;
begin
{  QTemp.Open('SELECT NAME, FORM, IROW, ICOL, VAL FROM ZAMER.ZGRIDS WHERE FORM='
    + Quotedstr(FormHH.Name) + ' and name=' + Quotedstr('StringGrid1'));
  k                           := 13;
  StringGrid1.RowCount        := k;
  for i                       := 0 to k - 1 do
    for j                     := 0 to 3 do
      StringGrid1.Cells[j, i] := '';
  While not QTemp.Eof do
  begin
    StringGrid1.Cells[QTemp.FieldByName('icol').Asinteger,
      QTemp.FieldByName('irow').Asinteger] := QTemp.FieldByName('val').AsString;
    QTemp.Next;
  end;

  QTemp.Open('SELECT NAME, FORM, IROW, ICOL, VAL FROM ZAMER.ZGRIDS WHERE FORM='
    + Quotedstr(FormHH.Name) + ' and name=' + Quotedstr('StringGrid2'));
  While not QTemp.Eof do
  begin
    StringGrid2.Cells[QTemp.FieldByName('icol').Asinteger,
      QTemp.FieldByName('irow').Asinteger] := QTemp.FieldByName('val').AsString;
    QTemp.Next;
  end; }
end;

procedure TFRH.savegrids;
var
  i, j: integer;
begin
  { SELECT
    NAME, FORM, IROW,
    ICOL, VAL
    FROM ZAMER.ZGRIDS; }
  // QTEmp.Close;
  // QTemp.SQL.Clear;
  // QTemp.SQl.Add('delete from')

end;


procedure TFRH.command(b: Boolean);
var
  interval: integer;
  fname   : string;
begin
  interval := 50;
  fname    := '1600';
  if b then
  begin
    QTemp.Close;
    QTemp.SQL.Clear;

    QTemp.SQL.Add
      ('insert into command (nomer, filename,command, dat,interval) values(' +
      Quotedstr(Nomer) + ' ,' + fname + ', 1, ' + '4' + ',' +
      inttostr(interval) + ')');
    QTemp.ExecSQL;
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('insert into command (nomer, command) values(' +
      Quotedstr(Nomer) + ' , 11)');
    QTemp.ExecSQL;
  end
  else
  begin
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add
      ('insert into command (nomer, filename,command, dat,interval) values(' +
      Quotedstr(Nomer) + ' ,' + fname + ', 0, ' + '4' + ',' +
      inttostr(interval) + ')');
    QTemp.ExecSQL;
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('insert into command (nomer, command) values(' +
      Quotedstr(Nomer) + ' , 10)');
    QTemp.ExecSQL;
  end;
end;

procedure TFRH.FormActivate(Sender: TObject);
begin
 Nomer:=Label6.Caption;
 EnableClose:=true;
  QTemp.Open('select * from zdelta where name=' + Quotedstr('urh'));
  Edit2.Text := QTemp.FieldByName('value').AsString;
  QTemp.Open('select * from zdelta where name=' + Quotedstr('prh'));
  Edit3.Text := QTemp.FieldByName('value').AsString;
  QTemp.Open('select * from zini where name=' + Quotedstr('rhtime'));
  Edit1.Text := QTemp.FieldByName('value').AsString;
  loadgrids;
end;

procedure TFRH.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 TimerUp.Enabled:=False;

  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('update zdelta set value= ' + Quotedstr(Edit2.Text) +
    ' where name=' + Quotedstr('urh'));
  QTemp.ExecSQL;
   QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('update zdelta set value= ' + Quotedstr(Edit3.Text) +
    ' where name=' + Quotedstr('prh'));
  QTemp.ExecSQL;
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('update zini set value= ' + Quotedstr(Edit1.Text) +
    ' where name=' + Quotedstr('rhtime'));
  QTemp.ExecSQL;
  savegrids;
end;

procedure TFRH.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
 buttonselected:integer;
begin
 if enableclose then canclose:=true
  else begin
   buttonselected:=  MessageDlg
      ('У вас есть несохраненная работа, она может быть утеряна, действительно закрыть окно?',
      mtConfirmation, [mbYes, mbNo, MbCancel], 0) ;
   if buttonselected=mrYes then begin BitBtn10.Click; canclose:=true;end;
   if buttonselected=mrNo  then canclose:=true;
   if buttonselected=mrCancel  then canclose:=false;
  end;
end;

procedure TFRH.FormShow(Sender: TObject);
begin
 TimerUp.Enabled:=true;
 Enableclose:=true;
end;

procedure TFRH.StringGrid2Click(Sender: TObject);
begin
  if StringGrid2.row = StringGrid2.RowCount - 1 then
    StringGrid2.row := StringGrid2.row - 1;
  Label26.Caption   := StringGrid2.Cells[0, StringGrid2.row];
end;

procedure TFRH.TimerUpTimer(Sender: TObject);
begin

  QUp.Close;
  QUp.Open();
  Label13.Caption := myformat(trazn, QUp.FieldByName('N').AsFloat);
  Label10.Caption := myformat(trazi, QUp.FieldByName('I').AsFloat);
  Label12.Caption := myformat(trazm, QUp.FieldByName('M').AsFloat);

  if ABS(QUp.FieldByName('U').AsFloat - strtofloat(Label19.Caption)) >
    myfloat(Edit2.Text) then
    Label9.Font.Color := clRed
  else
    Label9.Font.Color := clGreen;
  Label9.Caption      := myformat(trazu, QUp.FieldByName('U').AsFloat);
  //
  if ABS(QUp.FieldByName('P').AsFloat - strtofloat(Label24.Caption)) >
    myfloat(Label29.Caption) then
    Label14.Font.Color := clRed
  else
    Label14.Font.Color := clGreen;
  Label14.Caption      := myformat(trazu, QUp.FieldByName('P').AsFloat);
end;

procedure TFRH.Action1Execute(Sender: TObject);
begin
  BitBtn1.Click;
end;

end.
