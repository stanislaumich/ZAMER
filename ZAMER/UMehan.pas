unit UMehan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.Buttons,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Math, System.Actions, Vcl.ActnList;

type
  TFMehan = class(TForm)
    GroupBox17: TGroupBox;
    StringGrid7: TStringGrid;
    Button27: TButton;
    Button32: TButton;
    RadioButton11: TRadioButton;
    RadioButton12: TRadioButton;
    RadioButton13: TRadioButton;
    RadioButton14: TRadioButton;
    RadioButton15: TRadioButton;
    Button47: TButton;
    GroupBox18: TGroupBox;
    StringGrid8: TStringGrid;
    Button37: TButton;
    Button42: TButton;
    RadioButton16: TRadioButton;
    RadioButton17: TRadioButton;
    RadioButton18: TRadioButton;
    RadioButton19: TRadioButton;
    RadioButton20: TRadioButton;
    Button48: TButton;
    Label25: TLabel;
    Edit14: TEdit;
    GroupBox11: TGroupBox;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Timer1: TTimer;
    Timer2: TTimer;
    QCommand: TFDQuery;
    QTemp: TFDQuery;
    QInsall: TFDQuery;
    Label8: TLabel;
    Label9: TLabel;
    QInsSvod: TFDQuery;
    QGetMN: TFDQuery;
    ActionList1: TActionList;
    upstart: TAction;
    upstop: TAction;
    downstart: TAction;
    downstop: TAction;
    Label10: TLabel;
    Label11: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button32Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure CommandStart(c: Integer; n: string; fn: string);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button37Click(Sender: TObject);
    procedure Button42Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure StringGrid7Click(Sender: TObject);
    procedure StringGrid8Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure upstartExecute(Sender: TObject);
    procedure upstopExecute(Sender: TObject);
    procedure downstartExecute(Sender: TObject);
    procedure downstopExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  R = record
    u1, u2, u3, n, m, usred: single;
  end;

var
  FMehan: TFMehan;

implementation

{$R *.dfm}

uses umain;

var

  amax, amin           : array [1 .. 5, 1 .. 1000] of R;
  cmax, cmin           : array [1 .. 5] of Integer;
  count, num, curr, row: Integer;

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

procedure TFMehan.CommandStart(c: Integer; n: string; fn: string);
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
  { if (FMAin.RadioButton1.Checked) then
    dectype := '10';
    if (FMAin.RadioButton2.Checked) then
    dectype := '4'; }
  dectype := '10';
  QCommand.SQL.Add(Quotedstr(n) + ',' + Quotedstr(fn) + ',' + inttostr(c) + ','
    + dectype + ', ' + FMAin.Edit12.Text + ')');
  QCommand.ExecSQL;
  QCommand.Close;
end;

procedure TFMehan.downstartExecute(Sender: TObject);
begin
  Button37.Click;
end;

procedure TFMehan.downstopExecute(Sender: TObject);
begin
  Button42.Click;
end;

procedure TFMehan.upstartExecute(Sender: TObject);
begin
  Button27.Click;
end;

procedure TFMehan.upstopExecute(Sender: TObject);
begin
  Button32.Click;
end;

procedure TFMehan.BitBtn1Click(Sender: TObject);
var
  i, j: Integer;
  // r: single;
  buttonSelected: Integer;
begin

  // find for max and min
  buttonSelected := MessageDlg('����� ������������ � ����������� �������?',
    mtConfirmation, mbYesNo, 0);
  if buttonSelected = mrYes then
  begin
    // max
    j     := 1;
    for i := 1 to 5 do
    begin
      if StringGrid7.cells[2, i] <> '' then
      begin
        if strtofloat(StringGrid7.cells[2, i]) >
          strtofloat(StringGrid7.cells[2, j]) then
          j := i;
      end;
    end;
    StringGrid7.row := j;
    case j of
      1:
        RadioButton11.Checked := true;
      2:
        RadioButton12.Checked := true;
      3:
        RadioButton13.Checked := true;
      4:
        RadioButton14.Checked := true;
      5:
        RadioButton15.Checked := true;
    end;
    // min
    j     := 1;
    for i := 1 to 5 do
    begin
      if StringGrid8.cells[2, i] <> '' then
      begin
        if strtofloat(StringGrid8.cells[2, i]) <
          strtofloat(StringGrid8.cells[2, j]) then
          j := i;
      end;
    end;
    StringGrid8.row := j;
    case j of
      1:
        RadioButton16.Checked := true;
      2:
        RadioButton17.Checked := true;
      3:
        RadioButton18.Checked := true;
      4:
        RadioButton19.Checked := true;
      5:
        RadioButton20.Checked := true;
    end;
  end;

  // ask me to save data and save
  buttonSelected :=
    MessageDlg('��������� �� �������� ������������ � ����������� �������?',
    mtConfirmation, mbYesNo, 0);
  if buttonSelected = mrYes then
  begin
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add(' delete from zmehsvod where nomer=' + Quotedstr(nomer) +
      ' and tip=1');
    QTemp.ExecSQL;
    for i := 1 to 5 do
      if StringGrid7.cells[1, i] <> '' then
      begin
        QInsSvod.Close;
        QInsSvod.ParamByName('nomer').AsString := nomer;
        QInsSvod.ParamByName('u').AsFloat      :=
          strtofloat(StringGrid7.cells[1, i]);
        QInsSvod.ParamByName('torq').AsFloat :=
          strtofloat(StringGrid7.cells[2, i]);
        QInsSvod.ParamByName('rot').AsFloat :=
          strtofloat(StringGrid7.cells[3, i]);
        QInsSvod.ParamByName('tip').AsInteger    := 1;
        QInsSvod.ParamByName('numisp').AsInteger := i;
        if i = StringGrid7.row then
          QInsSvod.ParamByName('checked').AsInteger := 1
        else
          QInsSvod.ParamByName('checked').AsInteger := 0;
        QInsSvod.ExecSQL;
      end;
    /// ///////
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add(' delete from zmehsvod where nomer=' + Quotedstr(nomer) +
      ' and tip=2');
    QTemp.ExecSQL;
    for i := 1 to 5 do
      if StringGrid8.cells[1, i] <> '' then
      begin
        QInsSvod.Close;
        QInsSvod.ParamByName('nomer').AsString := nomer;
        QInsSvod.ParamByName('u').AsFloat      :=
          strtofloat(StringGrid8.cells[1, i]);
        QInsSvod.ParamByName('torq').AsFloat :=
          strtofloat(StringGrid8.cells[2, i]);
        QInsSvod.ParamByName('rot').AsFloat :=
          strtofloat(StringGrid8.cells[3, i]);
        QInsSvod.ParamByName('tip').AsInteger    := 2;
        QInsSvod.ParamByName('numisp').AsInteger := i;
        if i = StringGrid8.row then
          QInsSvod.ParamByName('checked').AsInteger := 1
        else
          QInsSvod.ParamByName('checked').AsInteger := 0;
        QInsSvod.ExecSQL;
      end;
    /// ///////

    FMAin.Label32.Caption    := '�������';
    FMAin.Label32.Font.Color := clGreen;
    FMehan.Close;
  end;
end;

procedure TFMehan.BitBtn2Click(Sender: TObject);
begin // ������

  FMAin.Label32.Caption    := 'X';
  FMAin.Label32.Font.Color := clRed;
  FMehan.Close;
end;

procedure TFMehan.Button27Click(Sender: TObject);
var
  i : Integer;
  tr: R;
begin // start

  tr.u1    := 0;
  tr.u2    := 0;
  tr.u3    := 0;
  tr.usred := 0;
  tr.n     := 0;
  tr.m     := 0;
  count    := 0; // current number
  curr     := 1; // stringgrid7
  row      := StringGrid7.row;

  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('truncate table zamertmp');
  QTemp.ExecSQL;
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('delete from zmehall where nomer=' + Quotedstr(nomer) +
    ' and tip=1 and numisp=' + inttostr(row));
  QTemp.ExecSQL;
  QTemp.Close;
  for i          := 1 to 1000 do
    amax[row, i] := tr;
  CommandStart(1, nomer, '0');
  // Timer1.Enabled   := true;
  Timer2.Enabled   := true;
  Button27.Enabled := false;
  Button32.Enabled := true;
end;

procedure TFMehan.Button32Click(Sender: TObject);
var
  t, i: Integer;
  f   : single;
begin
  // Timer1.Enabled := false;
  Timer2.Enabled := false;
  CommandStart(0, nomer, '0');
  // �������� �������
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('select count(*) c from zamertmp');
  QTemp.Open;
  t := min(count - 1, QTemp.FieldByName('c').AsInteger);
  QTemp.Close;
  QTemp.Open('select * from zamertmp order by rowid');
  QTemp.First;
  QInsall.Close;
  for i := 1 to t do
  begin
    QInsall.ParamByName('nomer').AsString := nomer;
    QInsall.ParamByName('usred').AsFloat  :=
      SimpleRoundTo(amax[row, i].usred, -4);
    QInsall.ParamByName('u12').AsFloat  := SimpleRoundTo(amax[row, i].u1, -4);
    QInsall.ParamByName('u23').AsFloat  := SimpleRoundTo(amax[row, i].u2, -4);
    QInsall.ParamByName('u31').AsFloat  := SimpleRoundTo(amax[row, i].u3, -4);
    QInsall.ParamByName('torq').AsFloat :=
      SimpleRoundTo(QTemp.FieldByName('torq').AsFloat, -4);
    QInsall.ParamByName('rot').AsFloat :=
      SimpleRoundTo(QTemp.FieldByName('rot').AsFloat, -4);
    QInsall.ParamByName('tip').AsInteger    := 1;
    QInsall.ParamByName('numisp').AsInteger := row;
    QInsall.ExecSQL;
    QTemp.Next;
  end;
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add
    ('select * from zmehall where torq=(select max(torq) from zmehall where nomer='
    + Quotedstr(nomer) + ' and numisp=' + inttostr(row) +
    ' and tip=1) and nomer=' + Quotedstr(nomer) + ' and numisp=' + inttostr(row)
    + ' and tip=1');
  QTemp.Open;
  StringGrid7.cells[1, row] :=
    FloatToStr(SimpleRoundTo(QTemp.FieldByName('usred').AsFloat, -4));
  StringGrid7.cells[2, row] :=
    FloatToStr(SimpleRoundTo(QTemp.FieldByName('torq').AsFloat, -4));
  StringGrid7.cells[3, row] :=
    FloatToStr(SimpleRoundTo(QTemp.FieldByName('rot').AsFloat, -4));
  QTemp.Close;
  Button27.Enabled := true;
  Button32.Enabled := false;
end;

procedure TFMehan.Button37Click(Sender: TObject);
var
  i : Integer;
  tr: R;
begin // start
  tr.u1    := 0;
  tr.u2    := 0;
  tr.u3    := 0;
  tr.usred := 0;
  tr.n     := 0;
  tr.m     := 0;

  count := 0; // current number
  curr  := 2; // stringgrid7
  row   := StringGrid8.row;
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('truncate table zamertmp');
  QTemp.ExecSQL;
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('delete from zmehall where nomer=' + Quotedstr(nomer) +
    ' and tip=2 and numisp=' + inttostr(row));
  QTemp.ExecSQL;

  for i          := 1 to 1000 do
    amin[row, i] := tr;
  CommandStart(1, nomer, '0');
  // Timer1.Enabled   := true;
  Timer2.Enabled   := true;
  Button37.Enabled := false;
  Button42.Enabled := true;

end;

procedure TFMehan.Button42Click(Sender: TObject);
var
  t, i: Integer;
  f   : single;
begin
  // Timer1.Enabled := false;
  Timer2.Enabled := false;
  CommandStart(0, nomer, '0');
  // �������� �������
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('select count(*) c from zamertmp');
  QTemp.Open;
  t := min(count - 1, QTemp.FieldByName('c').AsInteger);
  QTemp.Close;
  QTemp.Open('select * from zamertmp order by rowid');
  QTemp.First;
  QInsall.Close;
  for i := 1 to t do
  begin
    QInsall.ParamByName('nomer').AsString := nomer;
    QInsall.ParamByName('usred').AsFloat  :=
      SimpleRoundTo(amax[row, i].usred, -4);
    QInsall.ParamByName('u12').AsFloat  := SimpleRoundTo(amin[row, i].u1, -4);
    QInsall.ParamByName('u23').AsFloat  := SimpleRoundTo(amin[row, i].u2, -4);
    QInsall.ParamByName('u31').AsFloat  := SimpleRoundTo(amin[row, i].u3, -4);
    QInsall.ParamByName('torq').AsFloat :=
      SimpleRoundTo(QTemp.FieldByName('torq').AsFloat, -4);
    QInsall.ParamByName('rot').AsFloat :=
      SimpleRoundTo(QTemp.FieldByName('rot').AsFloat, -4);
    QInsall.ParamByName('tip').AsInteger    := 2;
    QInsall.ParamByName('numisp').AsInteger := row;
    QInsall.ExecSQL;
    QTemp.Next;
  end;
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add
    ('select * from zmehall where torq=(select min(torq) from zmehall where nomer='
    + Quotedstr(nomer) + ' and numisp=' + inttostr(row) +
    ' and tip=2) and nomer=' + Quotedstr(nomer) + ' and numisp=' + inttostr(row)
    + ' and tip=2');

  QTemp.Open;
  StringGrid8.cells[1, row] :=
    FloatToStr(SimpleRoundTo(QTemp.FieldByName('usred').AsFloat, -4));
  StringGrid8.cells[2, row] :=
    FloatToStr(SimpleRoundTo(QTemp.FieldByName('torq').AsFloat, -4));
  StringGrid8.cells[3, row] :=
    FloatToStr(SimpleRoundTo(QTemp.FieldByName('rot').AsFloat, -4));
  QTemp.Close;
  Button37.Enabled := true;
  Button42.Enabled := false;;
end;

procedure TFMehan.FormActivate(Sender: TObject);
begin
  Timer1.Enabled := true;
end;

procedure TFMehan.FormCreate(Sender: TObject);
begin
  StringGrid7.cells[0, 0] := '';
  StringGrid7.cells[1, 0] := 'U����, �';
  StringGrid7.cells[2, 0] := 'M, �/�';
  StringGrid7.cells[3, 0] := 'N, ��/���';
  StringGrid7.cells[0, 1] := '���. 1';
  StringGrid7.cells[0, 2] := '���. 2';
  StringGrid7.cells[0, 3] := '���. 3';
  StringGrid7.cells[0, 4] := '���. 4';
  StringGrid7.cells[0, 5] := '���. 5';
  row                     := 1;
  StringGrid8.cells[0, 0] := '';
  StringGrid8.cells[1, 0] := 'U����, �';
  StringGrid8.cells[2, 0] := 'M, �/�';
  StringGrid8.cells[3, 0] := 'N, ��/���';
  StringGrid8.cells[0, 1] := '���. 1';
  StringGrid8.cells[0, 2] := '���. 2';
  StringGrid8.cells[0, 3] := '���. 3';
  StringGrid8.cells[0, 4] := '���. 4';
  StringGrid8.cells[0, 5] := '���. 5';
end;

procedure TFMehan.FormHide(Sender: TObject);
begin
  Timer1.Enabled := false;
end;

procedure TFMehan.StringGrid7Click(Sender: TObject);
begin
  row := StringGrid7.row;
end;

procedure TFMehan.StringGrid8Click(Sender: TObject);
begin
  row := StringGrid8.row;
end;

procedure TFMehan.Timer1Timer(Sender: TObject);
begin
  Label5.Caption := FMAin.KrVarLabel1.Caption;
  QGetMN.Open('select * from zamer');
  Label6.Caption := QGetMN.FieldByName('torq').AsString;
  Label7.Caption := QGetMN.FieldByName('rot').AsString;

end;

procedure TFMehan.Timer2Timer(Sender: TObject);
begin
  count := count + 1;
  if count >= 1000 then
  begin
    Timer2.Enabled := false;
    ShowMessage('���������� ������������ ���������� �������, ����� ����������');
    // exit;
  end;
  if curr = 1 then
  begin
    amax[row, count].u1    := SimpleRoundTo(FMAin.RU1.Value, -4);
    amax[row, count].u2    := SimpleRoundTo(FMAin.RU2.Value, -4);
    amax[row, count].u3    := SimpleRoundTo(FMAin.RU3.Value, -4);
    amax[row, count].usred := 0;

  end;
  if curr = 2 then
  begin
    amin[row, count].u1    := SimpleRoundTo(FMAin.RU1.Value, -4);
    amin[row, count].u2    := SimpleRoundTo(FMAin.RU2.Value, -4);
    amin[row, count].u3    := SimpleRoundTo(FMAin.RU3.Value, -4);
    amin[row, count].usred := 0;

  end;

  if count mod 10 = 0 then
    Label8.Caption := inttostr(count);
end;

end.
