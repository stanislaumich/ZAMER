unit URH;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.ComCtrls, Math, ustr, System.Actions,
  Vcl.ActnList;

type
  TFRH = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox1: TGroupBox;
    StringGrid1: TStringGrid;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    GroupBox2: TGroupBox;
    StringGrid2: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    CheckBox1: TCheckBox;
    ProgressBar1: TProgressBar;
    Timer1000: TTimer;
    Timer2: TTimer;
    QinsAll: TFDQuery;
    QTemp: TFDQuery;
    Label5: TLabel;
    Label6: TLabel;
    QInsSvod: TFDQuery;
    Qselectsred: TFDQuery;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Edit3: TEdit;
    QCommand: TFDQuery;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    TimerUp: TTimer;
    CheckBox2: TCheckBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    ActionList1: TActionList;
    Action1: TAction;
    Label24: TLabel;
    Edit4: TEdit;
    Label25: TLabel;
    Edit5: TEdit;
    Label26: TLabel;
    Edit6: TEdit;
    Label27: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    Label28: TLabel;
    procedure Timer1000Timer(Sender: TObject);
    // procedure Timer2Timer(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure CommandStart(c: Integer; n: string; fn: string);
    procedure StringGrid2Click(Sender: TObject);
    procedure TimerUpTimer(Sender: TObject);
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    // procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  R = record
    u1, u2, u3, i1, i2, i3, p1, p2, p3, rot, torq, power: real;
  end;

var
  FRH         : TFRH;
  currentvolt : single;
  currentpower: single;
  maxtime     : Integer;
  curtime     : Integer;

  a       : array [1 .. 1000] of R;
  acount  : Integer;
  tipispyt: Integer;
  ch      : Boolean;

implementation

uses umain;

{$R *.dfm}

function min(a: Integer; b: Integer): Integer;
begin
  if a < b then
    result := a
  else
    result := b;
end;

function max(a: Integer; b: Integer): Integer;
begin
  if a > b then
    result := a
  else
    result := b;
end;

procedure TFRH.CommandStart(c: Integer; n: string; fn: string);
var
  s      : string;
  dectype: string;
begin
  QCommand.SQL.Clear;
  QCommand.SQL.Add
    ('insert into command (nomer, filename, command, dat, interval) values (');
  {
    #define SIMULATOR_DECODER             4
    #define USB_DECODER_T35               6
    #define USB_DECODER_T45               10
  }
  dectype := '10';
  QCommand.SQL.Add(Quotedstr(n) + ',' + Quotedstr(fn) + ',' + inttostr(c) + ','
    + dectype + ', ' + FMain.Edit12.Text + ')');
  QCommand.ExecSQL;
end;

function Point(s: string): string;
begin
  Point := strReplace(s, ',', '.');
end;

procedure TFRH.Action1Execute(Sender: TObject);
begin
  BitBtn1.Click;
end;

procedure TFRH.BitBtn1Click(Sender: TObject);
begin
  ch := true;
  if (Edit4.Text = '') or (Edit5.Text = '') or (Edit6.Text = '') or
    (Edit7.Text = '') then
  begin
    Showmessage('Проверьте температуру и сопротивление в нижней части окна');
    exit;
  end;

  BitBtn1.Enabled := false;
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('delete from zrhall where nomer=' + Quotedstr(Nomer) +
    ' and uisp=' + Label3.Caption + ' and pisp=' + Point(Label10.Caption));
  QTemp.ExecSQL;
  acount            := 0;
  curtime           := 0;
  maxtime           := Strtoint(Edit1.Text);
  ProgressBar1.min  := 0;
  ProgressBar1.max  := Strtoint(Edit1.Text);
  ProgressBar1.Step := 1;
  CommandStart(1, umain.Nomer, Label8.Caption);
  Timer2.Enabled    := true;
  Timer1000.Enabled := true;
end;

procedure TFRH.BitBtn2Click(Sender: TObject);
var
  buttonSelected: Integer;
  i             : Integer;
begin
  // проверить температуру
  buttonSelected :=
    MessageDlg
    ('Врно ли внесены значения температуры и сопротивления? Если выбрать НЕТ, то их можно скорректировать и потом опять сохранить',
    mtConfirmation, mbYesNo, 0);
  if buttonSelected = mrNo then
    exit;

  FMain.Label30.font.Color := clGreen;
  FMain.Label30.Caption    := 'ПРОЙДЕН';
  FRH.Close;
end;

procedure TFRH.BitBtn3Click(Sender: TObject);
var
  i, j: Integer;
begin
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

procedure TFRH.FormActivate(Sender: TObject);
var
  i: Integer;
begin
  Label3.Caption            := FMain.Edit6.Text;
  Label10.Caption           := FMain.Edit7.Text;
  Label17.Caption           := Floattostr(Strtofloat(FMain.Edit7.Text) * 1000);
  ch                        := false;
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
end;

procedure TFRH.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  i, j: Integer;
  f   : textfile;
begin
  if ch then
    if MessageDlg
      ('У вас есть несохраненная работа, она может быть утеряна, действительно закрыть окно?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin

      CanClose := true;
    end
    else
      CanClose := false;

  AssignFile(f, extractfilepath(paramstr(0)) + '\GridRH.TXT');
  ReWrite(f);
  for i   := 1 to 10 do
    for j := 1 to 3 do
    begin
      WriteLn(f, StringGrid1.cells[j, i]);
    end;
  CloseFile(f);

  // delta and del
  {
  FMain.QDelta.SQL.Clear;
  FMain.QDelta.SQL.Add('delete from ini where name=' + Quotedstr('rhtime'));
  FMain.QDelta.ExecSQL;
  FMain.QDelta.SQL.Clear;
  FMain.QDelta.SQL.Add('insert into ini (name,value) values(' +
    Quotedstr('rhtime') + ',' + Quotedstr(FRH.Edit1.Text) + ')');
  FMain.QDelta.ExecSQL;}

  FMain.QDelta.SQL.Clear;
  FMain.QDelta.SQL.Add('update ini set value='+Quotedstr(FRH.Edit1.Text)+' where name=' +Quotedstr('rhtime'));
  FMain.QDelta.ExecSQL;

  {
  FMain.QDelta.SQL.Clear;
  FMain.QDelta.SQL.Add('delete from zdelta where name=' + Quotedstr('urh'));
  FMain.QDelta.ExecSQL;
  FMain.QDelta.SQL.Clear;
  FMain.QDelta.SQL.Add('insert into zdelta (name,value) values(' +
    Quotedstr('urh') + ',' + FRH.Edit2.Text + ')');
  FMain.QDelta.ExecSQL;}

  FMain.QDelta.SQL.Clear;
  FMain.QDelta.SQL.Add('update ini set value='+Quotedstr(FRH.Edit2.Text)+' where name=' +Quotedstr('urh'));
  FMain.QDelta.ExecSQL;
  {
  QTemp.Close;
  FMain.QDelta.SQL.Clear;
  FMain.QDelta.SQL.Add('delete from zdelta where name=' + Quotedstr('prh'));
  FMain.QDelta.ExecSQL;
  FMain.QDelta.SQL.Clear;
  FMain.QDelta.SQL.Add('insert into zdelta (name,value) values(' +
    Quotedstr('prh') + ',' + Point(FRH.Edit8.Text) + ')');
  FMain.QDelta.ExecSQL;
  QTemp.Close;}

  FMain.QDelta.SQL.Clear;
  FMain.QDelta.SQL.Add('update ini set value='+Quotedstr(Point(FRH.Edit8.Text))+' where name=' +Quotedstr('prh'));
  FMain.QDelta.ExecSQL;

  {
  QTemp.SQL.Clear;
  QTemp.SQL.Add('delete from ini where name=' + Quotedstr('rhdel'));
  QTemp.ExecSQL;
  QTemp.Close;
  QTemp.SQL.Clear;
  if CheckBox2.Checked then
    QTemp.SQL.Add('insert into ini (name,value) values(' +
      Quotedstr('rhdel') + ',1)')
  else
    QTemp.SQL.Add('insert into ini (name,value) values(' +
      Quotedstr('rhdel') + ',0)');
  QTemp.ExecSQL;
  }


end;

procedure TFRH.FormCreate(Sender: TObject);

var
  i, j: Integer;
  f   : textfile;
  s   : string;
begin

  AssignFile(f, extractfilepath(paramstr(0)) + '\GridRH.TXT');
  ReSet(f);
  for i   := 1 to 10 do
    for j := 1 to 3 do
    begin
      ReadLn(f, s);
      StringGrid1.cells[j, i] := s;
    end;
  CloseFile(f);

  FMain.QDelta.Open('select value from ini where name=' + Quotedstr('rhtime'));
  FRH.Edit1.Text := FMain.QDelta.FieldByName('value').Asstring;
  FMain.QDelta.Open('select value from zdelta where name=' + Quotedstr('urh'));
  FRH.Edit2.Text := FMain.QDelta.FieldByName('value').Asstring;
  FMain.QDelta.Open('select value from zdelta where name=' + Quotedstr('prh'));
  FRH.Edit3.Text := FMain.QDelta.FieldByName('value').Asstring;
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.Open('select value from ini where name=' + Quotedstr('rhdel'));
  CheckBox2.Checked := QTemp.FieldByName('value').Asinteger = 1;

end;

procedure TFRH.FormHide(Sender: TObject);
begin
  TimerUp.Enabled := false;
end;

procedure TFRH.FormShow(Sender: TObject);
begin
  TimerUp.Enabled := true;
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

procedure TFRH.StringGrid2Click(Sender: TObject);
begin
  if StringGrid2.row = StringGrid2.RowCount - 1 then
    StringGrid2.row := StringGrid2.row - 1;

  if StringGrid2.cells[0, StringGrid2.row] = '' then
    Showmessage('Выбрано завершение испытания')
  else
  begin
    Label8.Caption := StringGrid2.cells[0, StringGrid2.row];
    Edit3.Text     := Floattostr(simpleroundto(Strtofloat(StringGrid2.cells[0,
      StringGrid2.row]) / 100 * Strtofloat(Edit8.Text), 0));
  end;

  Label6.Caption := Label3.Caption;
end;

procedure TFRH.StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  ok: Boolean;
begin
  if (ACol = 0) Or (ARow = 0) Then
    exit;
  if StringGrid2.cells[0, ARow] = '' then
    exit;
  if StringGrid2.cells[1, ARow] = '' then
    exit;
end;

procedure TFRH.Timer1000Timer(Sender: TObject);
var
  i            : Integer;
  acount1, ncnt: Integer;
begin
  curtime := curtime + 1;
  if curtime > maxtime then
  begin
    Timer1000.Enabled := false;
    Timer2.Enabled    := false;
    CommandStart(0, Nomer, Label8.Caption);
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.Open('select count(*) cnt from zamertmp');
    acount1 := QTemp.FieldByName('cnt').Asinteger;
    ncnt    := min(acount, acount1);
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.Open('select * from zamertmp');
    /// //////////////////////////////////////////////////////////////////////////
    QTemp.First;
    for i := 1 to ncnt do
    begin
      QinsAll.ParamByName('NOMER').Asstring := Nomer;
      QinsAll.ParamByName('UISP').AsFloat   := Strtofloat(Label6.Caption);
      QinsAll.ParamByName('PISP').AsFloat   := Strtofloat(Label8.Caption);
      QinsAll.ParamByName('U12').AsFloat    := a[i].u1;
      QinsAll.ParamByName('U23').AsFloat    := a[i].u2;
      QinsAll.ParamByName('U31').AsFloat    := a[i].u3;
      QinsAll.ParamByName('I1').AsFloat     := a[i].i1;
      QinsAll.ParamByName('I2').AsFloat     := a[i].i2;
      QinsAll.ParamByName('I3').AsFloat     := a[i].i3;
      QinsAll.ParamByName('P1').AsFloat     := a[i].p1;
      QinsAll.ParamByName('P2').AsFloat     := a[i].p2;
      QinsAll.ParamByName('P3').AsFloat     := a[i].p3;
      QinsAll.ParamByName('DUMAX').AsFloat  := 0;
      QinsAll.ParamByName('DPMAX').AsFloat  := 0;
      QinsAll.ParamByName('rot').AsFloat    :=
        simpleroundto(QTemp.FieldByName('rot').AsFloat, RazN);
      QinsAll.ParamByName('torq').AsFloat :=
        simpleroundto(QTemp.FieldByName('torq').AsFloat, RazM);
      QinsAll.ParamByName('power').AsFloat :=
        simpleroundto(QTemp.FieldByName('power').AsFloat, RazP);
      QinsAll.ExecSQL;
      QTemp.Next;
    end;
    Qselectsred.Close;
    Qselectsred.ParamByName('nomer').Asstring := Nomer;
    Qselectsred.ParamByName('uisp').AsFloat   := Strtofloat(Label6.Caption);
    Qselectsred.ParamByName('pisp').AsFloat   := Strtofloat(Label8.Caption);
    Qselectsred.Open;
    QInsSvod.Close;
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('delete from zrhsvod where nomer=' + Quotedstr(Nomer) +
      ' and uisp=' + Label6.Caption + ' and pisp=' + Point(Label8.Caption));
    QTemp.ExecSQL;

    // потом надо будет перенести
    QInsSvod.ParamByName('nomer').Asstring :=
      Qselectsred.FieldByName('nomer').Asstring;
    QInsSvod.ParamByName('uisp').AsFloat  := Strtofloat(Label6.Caption);
    QInsSvod.ParamByName('pisp').AsFloat  := Strtofloat(Label8.Caption);
    QInsSvod.ParamByName('usred').AsFloat :=
      simpleroundto(Qselectsred.FieldByName('u').AsFloat, RazU);
    QInsSvod.ParamByName('isred').AsFloat :=
      simpleroundto(Qselectsred.FieldByName('i').AsFloat, RazI);
    QInsSvod.ParamByName('psred').AsFloat :=
      simpleroundto(Qselectsred.FieldByName('p').AsFloat, RazP);
    QInsSvod.ParamByName('dumax').AsFloat :=
      simpleroundto(Qselectsred.FieldByName('umax').AsFloat, RazU);
    QInsSvod.ParamByName('dpmax').AsFloat :=
      simpleroundto(Qselectsred.FieldByName('pmax').AsFloat, RazP);
    QInsSvod.ParamByName('torq').AsFloat :=
      simpleroundto(Qselectsred.FieldByName('t').AsFloat, RazM);
    QInsSvod.ParamByName('rot').AsFloat :=
      simpleroundto(Qselectsred.FieldByName('r').AsFloat, RazN);
    QInsSvod.ParamByName('power').AsFloat :=
      simpleroundto(Qselectsred.FieldByName('pow').AsFloat, RazP);
    QInsSvod.ParamByName('tip').Asinteger := tipispyt;
    QInsSvod.ParamByName('t1').AsFloat    := Strtofloat(Edit4.Text);
    QInsSvod.ParamByName('t2').AsFloat    := Strtofloat(Edit5.Text);
    QInsSvod.ParamByName('t3').AsFloat    := Strtofloat(Edit6.Text);
    QInsSvod.ParamByName('r').AsFloat    := Strtofloat(Edit7.Text);
    QInsSvod.ExecSQL;

    // ++++ вверх это вырезать
    StringGrid2.cells[1, StringGrid2.row] :=
      Floattostr(simpleroundto(Qselectsred.FieldByName('u').AsFloat, RazU));
    StringGrid2.cells[2, StringGrid2.row] :=
      Floattostr(simpleroundto(Qselectsred.FieldByName('i').AsFloat, RazI));
    StringGrid2.cells[3, StringGrid2.row] :=
      Floattostr(simpleroundto(Qselectsred.FieldByName('p').AsFloat, RazP));
    StringGrid2.cells[4, StringGrid2.row] :=
      Floattostr(simpleroundto(Qselectsred.FieldByName('i').AsFloat, RazI));
    StringGrid2.cells[5, StringGrid2.row] :=
      Floattostr(simpleroundto(Qselectsred.FieldByName('r').AsFloat, RazN));
    StringGrid2.cells[6, StringGrid2.row] :=
      Floattostr(simpleroundto(Qselectsred.FieldByName('t').AsFloat, RazM));
    StringGrid2.cells[7, StringGrid2.row] :=
      Floattostr(simpleroundto(Qselectsred.FieldByName('pmax').AsFloat, RazP));
    /// //////////////////////////////////////////////////////////////////////////
    ProgressBar1.Position := 0;

    if StringGrid2.cells[0, StringGrid2.row + 1] = '' then
    begin
      BitBtn1.Enabled := true;
      BitBtn2.Enabled := true;
      BitBtn3.Enabled := true;
      Showmessage('Испытание завершено!')
    end
    else
    begin
      StringGrid2.row := StringGrid2.row + 1;
      BitBtn3.Enabled := true;
      BitBtn1.Enabled := true;
      Label8.Caption  := StringGrid2.cells[0, StringGrid2.row];
    end;
  end
  else
    ProgressBar1.Stepit;
end;

procedure TFRH.Timer2Timer(Sender: TObject);
begin
  acount       := acount + 1;
  a[acount].u1 := simpleroundto(FMain.RU1.Value, RazU);
  a[acount].u2 := simpleroundto(FMain.RU2.Value, RazU);
  a[acount].u3 := simpleroundto(FMain.RU3.Value, RazU);
  a[acount].i1 := simpleroundto(FMain.RI1.Value, RazI);
  a[acount].i2 := simpleroundto(FMain.RI2.Value, RazI);
  a[acount].i3 := simpleroundto(FMain.RI3.Value, RazI);
  a[acount].p1 := simpleroundto(FMain.RP1.Value, RazP);
  a[acount].p2 := simpleroundto(FMain.RP2.Value, RazP);
  a[acount].p3 := simpleroundto(FMain.RP3.Value, RazP);
end;

procedure TFRH.TimerUpTimer(Sender: TObject);
begin
  Label13.Caption := Floattostr(simpleroundto(FMain.Usred.Value, RazU));
  // QTemp.Close;
  // QTemp.sql.Clear;
  // QTEMP
  QTemp.Open('select * from zamer');
  Label15.Caption :=
    Floattostr(simpleroundto( { FMain.Psred.Value } QTemp.FieldByName('power')
    .AsFloat, RazP));
  // e2 e3         6 8

  if (ABS(Strtofloat(Label13.Caption) - Strtofloat(Label6.Caption)) >
    Strtofloat(Edit2.Text)) then
    Label6.font.Color := clRed
  else
    Label6.font.Color := clGreen;
  if (ABS(Strtofloat(Label15.Caption) - Strtofloat(Label8.Caption)) >
    Strtofloat(Edit3.Text)) then
    Label8.font.Color := clRed
  else
    Label8.font.Color := clGreen;
end;

end.
