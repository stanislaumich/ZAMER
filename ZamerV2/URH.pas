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
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
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
  tipispyt:integer;
  currentpower: single;
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

procedure TFRH.RadioButton1Click(Sender: TObject);
var
  i, j: Integer;
  cod : Integer;

begin
  for i                       := 0 to StringGrid2.colcount - 1 do
    for j                     := 1 to StringGrid2.RowCount - 1 do
      StringGrid2.cells[i, j] := '';
  if StringGrid1.cells[1, 1] = '' then
  begin
    Showmessage('Нет данных для испытания');
    exit;
  end;

  val(Label3.Caption, currentpower, cod);

  if cod = 0 then
  begin
    StringGrid2.RowCount := 2;
    for i                := 1 to StringGrid1.RowCount - 1 do
      if StringGrid1.cells[1, i] <> '' then
      begin
        StringGrid2.RowCount    := StringGrid2.RowCount + 1;
        StringGrid2.cells[0, i] :=
          Floattostr(simpleroundto(Strtofloat(Label10.Caption) * 1000 / 100 *
          Strtoint(StringGrid1.cells[1, i]), RazP));
      end;
    StringGrid2.cells[0, StringGrid2.RowCount - 1] := '';
    StringGrid2.row                                := 1;
    tipispyt                                       := 1;
    Label6.Caption                                 := Label3.Caption;
    Label8.Caption                                 := StringGrid2.cells[0, 1];
    BitBtn1.Enabled                                := true;
    BitBtn2.Enabled                                := true;
    BitBtn3.Enabled                                := true;
  end
  else
    Showmessage
      ('Не удалось получить испытательное напряжение двигателя из установок текущего испытания');
end;

procedure TFRH.RadioButton2Click(Sender: TObject);
var
  i, j: Integer;
  cod : Integer;

begin
  for i                       := 0 to StringGrid2.colcount - 1 do
    for j                     := 1 to StringGrid2.RowCount - 1 do
      StringGrid2.cells[i, j] := '';
  if StringGrid1.cells[1, 1] = '' then
  begin
    Showmessage('Нет данных для испытания');
    exit;
  end;

  val(Label3.Caption, currentpower, cod);
  if cod = 0 then
  begin
    StringGrid2.RowCount := 2;
    for i                := 1 to StringGrid1.RowCount - 1 do
      if StringGrid1.cells[2, i] <> '' then
      begin
        StringGrid2.RowCount    := StringGrid2.RowCount + 1;
        StringGrid2.cells[0, i] :=
          Floattostr(simpleroundto(Strtofloat(Label10.Caption) * 1000 / 100 *
          Strtoint(StringGrid1.cells[2, i]), RazP));
      end;
    StringGrid2.cells[0, StringGrid2.RowCount - 1] := '';
    StringGrid2.row                                := 1;
    tipispyt                                       := 2;
    Label6.Caption                                 := Label3.Caption;
    Label8.Caption                                 := StringGrid2.cells[0, 1];
    BitBtn1.Enabled                                := true;
    BitBtn2.Enabled                                := true;
    BitBtn3.Enabled                                := true;
  end
  else
    Showmessage
      ('Не удалось получить испытательное напряжение двигателя из установок текущего испытания');
end;

procedure TFRH.RadioButton3Click(Sender: TObject);
var
  i, j: Integer;
  cod : Integer;

begin
  for i                       := 0 to StringGrid2.colcount - 1 do
    for j                     := 1 to StringGrid2.RowCount - 1 do
      StringGrid2.cells[i, j] := '';

  if StringGrid1.cells[1, 1] = '' then
  begin
    Showmessage('Нет данных для испытания');
    exit;
  end;

  val(Label3.Caption, currentpower, cod);
  if cod = 0 then
  begin
    StringGrid2.RowCount := 2;
    for i                := 1 to StringGrid1.RowCount - 1 do
      if StringGrid1.cells[3, i] <> '' then
      begin
        StringGrid2.RowCount    := StringGrid2.RowCount + 1;
        StringGrid2.cells[0, i] :=
          Floattostr(simpleroundto(Strtofloat(Label10.Caption) * 1000 / 100 *
          Strtoint(StringGrid1.cells[3, i]), RazP));
      end;
    StringGrid2.cells[0, StringGrid2.RowCount - 1] := '';
    StringGrid2.row                                := 1;
    tipispyt                                       := 3;
    Label6.Caption                                 := Label3.Caption;
    Label8.Caption                                 := StringGrid2.cells[0, 1];
    BitBtn1.Enabled                                := true;
    BitBtn2.Enabled                                := true;
    BitBtn3.Enabled                                := true;
  end
  else
    Showmessage
      ('Не удалось получить испытательное напряжение двигателя из установок текущего испытания');
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


procedure TFRH.BitBtn3Click(Sender: TObject);
var
  i, j, buttonSelected: Integer;
begin
 buttonSelected :=
      MessageDlg('Действительно очистить все замеры?',
      mtConfirmation, mbYesNo, 0);
if buttonSelected=mrNo then exit;

  for i                       := 0 to StringGrid2.colcount - 1 do
    for j                     := 1 to StringGrid2.RowCount - 1 do
      StringGrid2.cells[i, j] := '';
  StringGrid2.RowCount        := 2;
  RadioButton1.Checked        := false;
  RadioButton2.Checked        := false;
  RadioButton3.Checked        := false;
  BitBtn1.Enabled             := false;

  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('delete from zrhall where nomer=' + Quotedstr(Nomer));
  QTemp.ExecSQL;
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('delete from zrhsvod where nomer=' + Quotedstr(Nomer));
  QTemp.ExecSQL;
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
var
  i: Integer;
begin
  {Label3.Caption            := FMain.Edit6.Text;
  Label10.Caption           := FMain.Edit7.Text;
  Label17.Caption           := Floattostr(Strtofloat(FMain.Edit7.Text) * 1000);
  ch                        := false; }
  for i                     := 1 to 8 do
    StringGrid1.cells[0, i] := inttostr(i);
  StringGrid1.cells[0, 0]   := '№';
  StringGrid1.cells[1, 0]   := 'Вар. 1';
  StringGrid1.cells[2, 0]   := 'Вар. 2';
  StringGrid1.cells[3, 0]   := 'Вар. 3';
  StringGrid2.cells[0, 0]   := 'Нагр.';
  StringGrid2.cells[1, 0]   := 'U сред';
  StringGrid2.cells[2, 0]   := 'I сред';
  StringGrid2.cells[3, 0]   := 'P сред';
  StringGrid2.cells[4, 0]   := 'N сред';
  StringGrid2.cells[5, 0]   := 'M сред';
  StringGrid2.cells[6, 0]   := '▲Umax';
  StringGrid2.cells[7, 0]   := '▲Pmax';

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
