unit URH;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.ComCtrls, Math;

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
    Timer1: TTimer;
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
    Timer3: TTimer;
    CheckBox2: TCheckBox;
    procedure Timer1Timer(Sender: TObject);
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
    procedure Timer3Timer(Sender: TObject);
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
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

procedure TFRH.BitBtn1Click(Sender: TObject);
begin
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('delete from zrhall where nomer=' + Quotedstr(Nomer) +
    ' and uisp=' + Label6.Caption + ' and pisp=' + Label8.Caption);
  QTemp.ExecSQL;
  acount            := 0;
  curtime           := 0;
  maxtime           := Strtoint(Edit1.Text);
  ProgressBar1.min  := 0;
  ProgressBar1.max  := Strtoint(Edit1.Text);
  ProgressBar1.Step := 1;
  CommandStart(1, umain.Nomer, Label8.Caption);
  Timer2.Enabled := True;
  Timer1.Enabled := True;
end;

procedure TFRH.BitBtn2Click(Sender: TObject);
begin
  FMain.Label30.font.Color := clGreen;
  FMain.Label30.Caption    := 'ПРОЙДЕН';
  FRH.Close;
end;

procedure TFRH.BitBtn3Click(Sender: TObject);
var
  i, j: Integer;
begin
  for i                       := 1 to StringGrid2.colcount - 1 do
    for j                     := 1 to StringGrid2.rowcount - 1 do
      StringGrid2.cells[j, i] := '';
  StringGrid2.rowcount        := 2;
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
  StringGrid2.cells[6, 0]   := 'U откл';
  StringGrid2.cells[7, 0]   := 'P откл';
end;

procedure TFRH.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  i, j: Integer;
  f   : textfile;
begin
  AssignFile(f, extractfilepath(paramstr(0)) + '\GridRH.TXT');
  ReWrite(f);
  for i   := 1 to 10 do
    for j := 1 to 3 do
    begin
      WriteLn(f, StringGrid1.cells[j, i]);
    end;
  CloseFile(f);

    // delta and del

  Fmain.QDelta.SQL.Clear;
  Fmain.QDelta.SQL.add('delete from zdelta where name=' + Quotedstr('urh'));
  Fmain.QDelta.ExecSQL;
  Fmain.QDelta.SQL.Clear;
  Fmain.QDelta.SQL.add('insert into zdelta (name,value) values(' +
    Quotedstr('urh') + ',' + Frh.Edit2.Text + ')');
  Fmain.QDelta.ExecSQL;

  QTemp.Close;
  Fmain.QDelta.SQL.Clear;
  Fmain.QDelta.SQL.add('delete from zdelta where name=' + Quotedstr('prh'));
  Fmain.QDelta.ExecSQL;
  Fmain.QDelta.SQL.Clear;
  Fmain.QDelta.SQL.add('insert into zdelta (name,value) values(' +
    Quotedstr('prh') + ',' + Frh.Edit3.Text + ')');
  Fmain.QDelta.ExecSQL;
  QTemp.Close;

  QTemp.SQL.Clear;
  QTemp.SQL.add('delete from ini where name=' + Quotedstr('rhdel'));
  QTemp.ExecSQL;
  QTemp.Close;
  QTemp.SQL.Clear;
  if CheckBox2.Checked then
    QTemp.SQL.add('insert into ini (name,value) values(' +
      Quotedstr('rhdel') + ',1)')
  else
    QTemp.SQL.add('insert into ini (name,value) values(' +
      Quotedstr('rhdel') + ',0)');
  QTemp.ExecSQL;
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

  Fmain.QDelta.Open('select value from zdelta where name=' + Quotedstr('urh'));
  Frh.Edit2.Text := Fmain.QDelta.FieldByName('value').Asstring;
  Fmain.QDelta.Open('select value from zdelta where name=' + Quotedstr('prh'));
  Frh.Edit3.Text := Fmain.QDelta.FieldByName('value').Asstring;
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.Open('select value from ini where name=' + Quotedstr('rhdel'));
  CheckBox2.Checked := QTemp.FieldByName('value').Asinteger = 1;
end;

procedure TFRH.RadioButton1Click(Sender: TObject);
var
  i ,j : Integer;
  cod: Integer;

begin
for i                       := 1 to StringGrid2.colcount - 1 do
    for j                     := 0 to StringGrid2.rowcount - 1 do
      StringGrid2.cells[j, i] := '';
  if StringGrid1.cells[1, 1] = '' then
  begin
    ShowMessage('Нет данных для испытания');
    exit;
  end;

  val(Label3.Caption, currentpower, cod);
  if cod = 0 then
  begin
    StringGrid2.rowcount := 2;
    for i                := 1 to StringGrid1.rowcount - 1 do
      if StringGrid1.cells[1, i] <> '' then
      begin
        StringGrid2.rowcount    := StringGrid2.rowcount + 1;
        StringGrid2.cells[0, i] :=
          floattostr(round(StrToFloat(label10.Caption) / 100 *
          Strtoint(StringGrid1.cells[1, i])));
      end;
    StringGrid2.cells[0, StringGrid2.rowcount - 1] := '';
    StringGrid2.row                                := 1;
    tipispyt                                       := 1;
    Label6.Caption                                 := Label3.Caption;
    Label8.Caption                                 := StringGrid2.cells[0, 1];
    BitBtn1.Enabled                                := True;
    BitBtn2.Enabled                                := True;
    BitBtn3.Enabled                                := True;
  end
  else
    ShowMessage
      ('Не удалось получить испытательное напряжение двигателя из установок текущего испытания');
end;

procedure TFRH.RadioButton2Click(Sender: TObject);
var
  i ,j : Integer;
  cod: Integer;

begin
for i                       := 1 to StringGrid2.colcount - 1 do
    for j                     := 0 to StringGrid2.rowcount - 1 do
      StringGrid2.cells[j, i] := '';
  if StringGrid1.cells[1, 1] = '' then
  begin
    ShowMessage('Нет данных для испытания');
    exit;
  end;

  val(Label3.Caption, currentpower, cod);
  if cod = 0 then
  begin
    StringGrid2.rowcount := 2;
    for i                := 1 to StringGrid1.rowcount - 1 do
      if StringGrid1.cells[2, i] <> '' then
      begin
        StringGrid2.rowcount    := StringGrid2.rowcount + 1;
        StringGrid2.cells[0, i] :=
          floattostr(round(StrToFloat(label10.Caption) / 100 *
          Strtoint(StringGrid1.cells[2, i])));
      end;
    StringGrid2.cells[0, StringGrid2.rowcount - 1] := '';
    StringGrid2.row                                := 1;
    tipispyt                                       := 2;
    Label6.Caption                                 := Label3.Caption;
    Label8.Caption                                 := StringGrid2.cells[0, 1];
    BitBtn1.Enabled                                := True;
    BitBtn2.Enabled                                := True;
    BitBtn3.Enabled                                := True;
  end
  else
    ShowMessage
      ('Не удалось получить испытательное напряжение двигателя из установок текущего испытания');
end;

procedure TFRH.RadioButton3Click(Sender: TObject);
var
  i ,j : Integer;
  cod: Integer;

begin
for i                       := 1 to StringGrid2.colcount - 1 do
    for j                     := 0 to StringGrid2.rowcount - 1 do
      StringGrid2.cells[j, i] := '';

  if StringGrid1.cells[1, 1] = '' then
  begin
    ShowMessage('Нет данных для испытания');
    exit;
  end;

  val(Label3.Caption, currentpower, cod);
  if cod = 0 then
  begin
    StringGrid2.rowcount := 2;
    for i                := 1 to StringGrid1.rowcount - 1 do
      if StringGrid1.cells[3, i] <> '' then
      begin
        StringGrid2.rowcount    := StringGrid2.rowcount + 1;
        StringGrid2.cells[0, i] :=
          floattostr(round(StrToFloat(label10.Caption) / 100 *
          Strtoint(StringGrid1.cells[3, i])));
      end;
    StringGrid2.cells[0, StringGrid2.rowcount - 1] := '';
    StringGrid2.row                                := 1;
    tipispyt                                       := 3;
    Label6.Caption                                 := Label3.Caption;
    Label8.Caption                                 := StringGrid2.cells[0, 1];
    BitBtn1.Enabled                                := True;
    BitBtn2.Enabled                                := True;
    BitBtn3.Enabled                                := True;
  end
  else
    ShowMessage
      ('Не удалось получить испытательное напряжение двигателя из установок текущего испытания');
end;

procedure TFRH.StringGrid2Click(Sender: TObject);
begin
  if StringGrid2.row = StringGrid2.rowcount - 1 then
    StringGrid2.row := StringGrid2.row - 1;

  if StringGrid2.cells[0, StringGrid2.row] = '' then
    ShowMessage('Выбрано завершение испытания')
  else
    Label8.Caption := StringGrid2.cells[0, StringGrid2.row];
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
  { ok := (abs(Strtofloat(StringGrid2.cells[1, ARow]) -
    Strtofloat(StringGrid2.cells[0, ARow])) < Strtofloat(Edit2.Text)) or
    (StringGrid2.cells[4, ARow] = '');
    if (ACol = 4) and (not ok) then
    begin
    // выбираем зеленный цвет и закрашиваем что нам нужно
    StringGrid2.Canvas.Brush.Color := clYellow;
    StringGrid2.Canvas.FillRect(Rect);
    StringGrid2.Canvas.TextOut(Rect.Left, Rect.Top,
    StringGrid2.cells[ACol, ARow]);
    StringGrid2.Canvas.Brush.Color := clWhite;
    end; }
end;

procedure TFRH.Timer1Timer(Sender: TObject);
var
  i            : Integer;
  acount1, ncnt: Integer;
begin
  curtime := curtime + 1;
  if curtime > maxtime then
  begin
    Timer1.Enabled := false;
    Timer2.Enabled := false;
    CommandStart(0, Nomer, Label8.Caption);
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.Open('select count(*) cnt from zamertmp');
    acount1 := QTemp.FieldByName('cnt').AsInteger;
    ncnt    := min(acount, acount1);
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.Open('select * from zamertmp');
    /// //////////////////////////////////////////////////////////////////////////
    QTemp.First;
    for i := 1 to ncnt do
    begin
      QinsAll.ParamByName('NOMER').AsString := Nomer;
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
      QinsAll.ParamByName('rot').AsFloat := QTemp.FieldByName('rot').AsFloat;
      QinsAll.ParamByName('torq').AsFloat := QTemp.FieldByName('torq').AsFloat;
      QinsAll.ParamByName('power').AsFloat :=
        QTemp.FieldByName('power').AsFloat;
      QinsAll.ExecSQL;
      QTemp.Next;
    end;
    Qselectsred.Close;
    Qselectsred.ParamByName('nomer').AsString := Nomer;
    Qselectsred.ParamByName('uisp').AsFloat   := Strtofloat(Label6.Caption);
    Qselectsred.ParamByName('pisp').AsFloat   := Strtofloat(Label8.Caption);
    Qselectsred.Open;
    QInsSvod.Close;
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('delete from zrhsvod where nomer=' + Quotedstr(Nomer) +
      ' and uisp=' + Label6.Caption + ' and pisp=' + Label8.Caption);
    QTemp.ExecSQL;
    QInsSvod.ParamByName('nomer').AsString :=
      Qselectsred.FieldByName('nomer').AsString;
    QInsSvod.ParamByName('uisp').AsFloat :=
      Qselectsred.FieldByName('uisp').AsFloat;
    QInsSvod.ParamByName('pisp').AsFloat  := Strtofloat(Label8.Caption);
    QInsSvod.ParamByName('usred').AsFloat :=
      Qselectsred.FieldByName('u').AsFloat;
    QInsSvod.ParamByName('isred').AsFloat :=
      Qselectsred.FieldByName('i').AsFloat;
    QInsSvod.ParamByName('psred').AsFloat :=
      Qselectsred.FieldByName('p').AsFloat;
    QInsSvod.ParamByName('dumax').AsFloat :=
      Qselectsred.FieldByName('umax').AsFloat;
    QInsSvod.ParamByName('dpmax').AsFloat :=
      Qselectsred.FieldByName('pmax').AsFloat;
    QInsSvod.ParamByName('torq').AsFloat :=
      Qselectsred.FieldByName('t').AsFloat;
    QInsSvod.ParamByName('rot').AsFloat := Qselectsred.FieldByName('r').AsFloat;
    QInsSvod.ParamByName('power').AsFloat :=
      Qselectsred.FieldByName('pow').AsFloat;
    QInsSvod.ParamByName('tip').AsInteger := tipispyt;
    QInsSvod.ExecSQL;
    StringGrid2.cells[1, StringGrid2.row] :=
      Qselectsred.FieldByName('u').AsString;
    StringGrid2.cells[2, StringGrid2.row] :=
      Qselectsred.FieldByName('i').AsString;
    StringGrid2.cells[3, StringGrid2.row] :=
      Qselectsred.FieldByName('p').AsString;
    StringGrid2.cells[4, StringGrid2.row] :=
      Qselectsred.FieldByName('i').AsString;
    StringGrid2.cells[5, StringGrid2.row] :=
      Qselectsred.FieldByName('r').AsString;
    StringGrid2.cells[6, StringGrid2.row] :=
      Qselectsred.FieldByName('t').AsString;
    StringGrid2.cells[7, StringGrid2.row] :=
      Qselectsred.FieldByName('pmax').AsString;
    /// //////////////////////////////////////////////////////////////////////////
    ProgressBar1.Position := 0;
    StringGrid2.row       := StringGrid2.row + 1;
    if StringGrid2.cells[0, StringGrid2.row] = '' then
    begin
      BitBtn2.Enabled := True;
      BitBtn3.Enabled := True;
      ShowMessage('Испытание завершено!')
    end
    else
    begin
      BitBtn3.Enabled := True;
      ShowMessage('Шаг завершен!');
      Label8.Caption := StringGrid2.cells[0, StringGrid2.row];
    end;
  end
  else
    ProgressBar1.Stepit;
end;

procedure TFRH.Timer2Timer(Sender: TObject);
begin
  acount       := acount + 1;
  a[acount].u1 := SimpleRoundTo(FMain.RU1.Value, -4);
  a[acount].u2 := SimpleRoundTo(FMain.RU2.Value, -4);
  a[acount].u3 := SimpleRoundTo(FMain.RU3.Value, -4);
  a[acount].i1 := SimpleRoundTo(FMain.RI1.Value, -4);
  a[acount].i2 := SimpleRoundTo(FMain.RI2.Value, -4);
  a[acount].i3 := SimpleRoundTo(FMain.RI3.Value, -4);
  a[acount].p1 := SimpleRoundTo(FMain.RP1.Value, -4);
  a[acount].p2 := SimpleRoundTo(FMain.RP2.Value, -4);
  a[acount].p3 := SimpleRoundTo(FMain.RP3.Value, -4);
end;

procedure TFRH.Timer3Timer(Sender: TObject);
begin
  Label13.Caption := floattostr(SimpleRoundTo(FMain.Usred.Value, -3));
  Label15.Caption := floattostr(SimpleRoundTo(FMain.Psred.Value, -2));
end;

end.
