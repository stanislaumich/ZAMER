unit UMH;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, System.Actions,
  Vcl.ActnList, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls, Vcl.Grids, uadd, math;

type
  TFMH = class(TForm)
    Label25: TLabel;
    Label1: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    GroupBox17: TGroupBox;
    StringGrid7: TStringGrid;
    Button27: TButton;
    Button32: TButton;
    Button47: TButton;
    GroupBox18: TGroupBox;
    StringGrid8: TStringGrid;
    Button37: TButton;
    Button42: TButton;
    Button48: TButton;
    Edit14: TEdit;
    GroupBox11: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Button1: TButton;
    TimerUp: TTimer;
    Timer1000: TTimer;
    QCommand: TFDQuery;
    QTemp: TFDQuery;
    QInsall: TFDQuery;
    QInsSvod: TFDQuery;
    QUp: TFDQuery;
    ActionList1: TActionList;
    upstart: TAction;
    upstop: TAction;
    downstart: TAction;
    Panel1: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Qtemp2: TFDQuery;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    Memo1: TMemo;
    Qi: TFDQuery;
    QSelSred: TFDQuery;
    procedure TimerUpTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1000Timer(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure upstartExecute(Sender: TObject);
    procedure downstartExecute(Sender: TObject);
    procedure upstopExecute(Sender: TObject);
    procedure Button37Click(Sender: TObject);
    procedure Button32Click(Sender: TObject);
    procedure Button42Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure StringGrid7DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid8DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure command(b: Boolean);
  end;

  R = record
    u1, u2, u3, n, m, usred: single;
  end;

var
  FMH: TFMH;
  nomer: string;

implementation

{$R *.dfm}

uses UGraph, Uzv2Main, Usett;

type
  Ur = record
    u, t: double;
  end;

  Rr = record
    m, n, t: double;
  end;

  Resr = record
    u, m, n, t1, t2: double;
  end;

var
  Ua: array [1 .. 1000] of Ur;
  Ra: array [1 .. 1000] of Rr;
  ResA: array [1 .. 1000] of Resr;
  Uo: Ur;
  Ro: Rr;
  ResO: Resr;
  Un, Rn, ResN: Integer;

  amax, amin: array [1 .. 5, 1 .. 1000] of R;
  cmax, cmin: array [1 .. 5] of Integer;
  count, num, curr, row: Integer;

function GetNObor(t: double; max: Integer): Integer;
var
  i, res: Integer;
  prev: double;
begin
  prev := 1000000;
  res := 0;
  for i := 1 to max do
    if abs(t - Ra[i].t) < prev then
    begin
      res := i;
      prev := abs(t - Ra[i].t);
    end;
  GetNObor := res;
end;

function GetNU(t: double; max: Integer): Integer;
var
  i, res: Integer;
  prev: double;
begin
  prev := 1000000;
  res := 0;
  for i := 1 to max do
    if abs(t - Ua[i].t) < prev then
    begin
      res := i;
      prev := abs(t - Ua[i].t);
    end;
  GetNU := res;
end;

function gets(e: Resr): string;
begin
  gets := floattostr(e.u) + ' ' + floattostr(e.m) + ' ' + floattostr(e.n);
end;

procedure TFMH.Button32Click(Sender: TObject);

var
  t, i, maxni: Integer;
  f, maxn: double;
  fnd: Integer;
begin
  Timer1000.Enabled := false;
  command(false);
  QTemp.SQL.Clear;
  QTemp.SQL.Add('delete from zmehall where nomer=' + Quotedstr(nomer) +
    ' and tip=1 and numisp=' + inttostr(row));
  QTemp.ExecSQL;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('delete from zmehsvod where nomer=' + Quotedstr(nomer) +
    ' and tip=1 and numisp=' + inttostr(row));
  QTemp.ExecSQL;
  // начинаем обсчеты
  Memo1.lines.Add('Запрос из Т45');
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add
    ('delete from zamertmp where rot = 0 and torq = 0 and power = 0');
  QTemp.ExecSQL;
  QTemp.Close;
  QTemp.Close;
  QTemp.Open('SELECT rot n, torq m, (CAST(ts as date) - date ' +
    Quotedstr('1970-01-01') + ') * 86400 + to_number(TO_CHAR(ts,' +
    Quotedstr(fstr) + ')) - to_number(to_char(ts,' + Quotedstr('SS') + ')) t ' +
    ' FROM zamertmp order by rowid');
  QTemp.First;
  Rn := 0;
  Memo1.lines.Add('Обработка Т45');
  while not QTemp.eof do
  begin
    Rn := Rn + 1;
    Ra[Rn].m := QTemp.FieldByName('m').AsFloat;
    Ra[Rn].n := QTemp.FieldByName('n').AsFloat;
    Ra[Rn].t := QTemp.FieldByName('t').AsFloat;
    QTemp.Next;
  end;
  Memo1.lines.Add('Запрос из Элспек');
  QTemp.Close;
  QTemp.Open('SELECT u, (CAST(ts as date) - date ' + Quotedstr('1970-01-01') +
    ') * 86400 + to_number(TO_CHAR(ts,' + Quotedstr(fstr) +
    ')) - to_number(to_char(ts,' + Quotedstr('SS') + ')) t ' +
    ' FROM zelspec order by rowid');
  QTemp.First;
  Un := 0;
  Memo1.lines.Add('Обработка элспек');
  while not QTemp.eof do
  begin
    Un := Un + 1;
    Ua[Un].u := QTemp.FieldByName('u').AsFloat;
    Ua[Un].t := QTemp.FieldByName('t').AsFloat;
    QTemp.Next;
  end;
  QTemp.Close;
  ResN := 0;
  if Un < Rn then
  begin // по напряжению
    Memo1.lines.Add('U<N');
    for i := 1 to Un do
    begin // для каждого напряжения выбираем мин дельта времени с оборотами
      fnd := GetNObor(Ua[i].t, Rn);
      Memo1.lines.Add(floattostr(Ua[i].t) + ' ' + inttostr(fnd));
      if fnd = 0 then
      begin // was not found
        ResN := ResN + 1;
        ResA[ResN].u := 0;
        ResA[ResN].m := 0;
        ResA[ResN].n := 0;
        ResA[ResN].t1 := 0;
        ResA[ResN].t2 := 0;
        Memo1.lines.Add('notfound');
      end
      else
      begin // was found
        ResN := ResN + 1;
        ResA[ResN].u := Ua[i].u;
        ResA[ResN].m := Ra[fnd].m;
        ResA[ResN].n := Ra[fnd].n;
        ResA[ResN].t1 := Ua[i].t;
        ResA[ResN].t2 := Ra[fnd].t;
        Memo1.lines.Add('found');
      end;
    end;
  end
  else
  begin // по оборотам
    Memo1.lines.Add('U>N');
    for i := 1 to Rn do
    begin // для каждого напряжения выбираем мин дельта времени с оборотами
      fnd := GetNU(Ra[i].t, Un);
      Memo1.lines.Add(floattostr(Ra[i].t) + ' ' + inttostr(fnd));
      if fnd = 0 then
      begin // was not found
        ResN := ResN + 1;
        ResA[ResN].u := 0;
        ResA[ResN].m := 0;
        ResA[ResN].n := 0;
        ResA[ResN].t1 := 0;
        ResA[ResN].t2 := 0;
        Memo1.lines.Add('notfound');
      end
      else
      begin // was found
        ResN := ResN + 1;
        ResA[ResN].u := Ua[fnd].u;
        ResA[ResN].m := Ra[i].m;
        ResA[ResN].n := Ra[i].n;
        ResA[ResN].t1 := Ua[fnd].t;
        ResA[ResN].t2 := Ra[i].t;
        Memo1.lines.Add('found');
      end;
    end;
    // ---

  end;

  // --
  maxn := 0;
  for i := 1 to ResN do
  begin
    Memo1.lines.Add(gets(ResA[i]));
    QInsall.Close;
    QInsall.ParamByName('nomer').AsString := nomer;
    QInsall.ParamByName('usred').AsFloat := ResA[i].u;
    QInsall.ParamByName('u12').AsFloat := 0;
    QInsall.ParamByName('u23').AsFloat := 0;
    QInsall.ParamByName('u31').AsFloat := 0;
    QInsall.ParamByName('torq').AsFloat := ResA[i].m;
    QInsall.ParamByName('rot').AsFloat := ResA[i].n;
    QInsall.ParamByName('tip').AsInteger := curr;
    QInsall.ParamByName('numisp').AsInteger := row;
    QInsall.ExecSQL;
    if ResA[i].m > maxn then
    begin
      maxni := i;
      maxn := ResA[i].m;
    end;
  end;

  StringGrid7.cells[1, row] := floattostr(SimpleRoundTo(ResA[maxni].u, RazU));
  StringGrid7.cells[2, row] := floattostr(SimpleRoundTo(ResA[maxni].m, -2));
  StringGrid7.cells[3, row] := floattostr(SimpleRoundTo(ResA[maxni].n, RazN));
  Memo1.lines.Add('Вставка в итоговую таблицу ok');

  QInsSvod.Close;
  QInsSvod.ParamByName('nomer').AsString := nomer;
  QInsSvod.ParamByName('u').AsFloat := ResA[maxni].u;
  QInsSvod.ParamByName('torq').AsFloat := ResA[maxni].m;
  QInsSvod.ParamByName('rot').AsFloat := ResA[maxni].n;
  QInsSvod.ParamByName('tip').AsInteger := 1;
  QInsSvod.ParamByName('numisp').AsInteger := row;
  QInsSvod.ParamByName('checked').AsInteger := 0;
  QInsSvod.ExecSQL;

  Memo1.lines.Add('Все завершено');
  Memo1.lines.savetofile('resMH');

  // --

  QTemp.Close;
  Button27.Enabled := true;
  Button37.Enabled := true;
  Button32.Enabled := false;
  upstart.Enabled := true;
  downstart.Enabled := true;
  upstop.Enabled := false;
  Memo1.lines.Add('Полный выход');
end;

procedure TFMH.Button37Click(Sender: TObject);
var
  tr: R;
  t, i, maxni: Integer;
  f, maxn: double;
  fnd: Integer;
begin // start

  tr.u1 := 0;
  tr.u2 := 0;
  tr.u3 := 0;
  tr.usred := 0;
  tr.n := 0;
  tr.m := 0;

  count := 0; // current number
  curr := 2; // stringgrid7
  row := StringGrid8.row;
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('truncate table zamertmp');
  QTemp.ExecSQL;
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('truncate table zelspec');
  QTemp.ExecSQL;
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('delete from zmehall where nomer=' + Quotedstr(nomer) +
    ' and tip=2 and numisp=' + inttostr(row));
  QTemp.ExecSQL;
  for i := 1 to 1000 do
    amin[row, i] := tr;
  command(true);
  Timer1000.Enabled := true;
  Button37.Enabled := false;
  upstart.Enabled := false;
  downstart.Enabled := false;
  upstop.Enabled := true;
  Button42.Enabled := true;
  Button27.Enabled := false;
end;

procedure TFMH.Button42Click(Sender: TObject);
var
  t, i, maxni: Integer;
  f, maxn: double;
  fnd: Integer;
begin

  Timer1000.Enabled := false;
  command(false);
  Sleep(2000);
  QTemp.SQL.Clear;
  QTemp.SQL.Add('truncate table zmlast');
  QTemp.ExecSQL;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('truncate table zulast');
  QTemp.ExecSQL;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('truncate table zumsvod');
  QTemp.ExecSQL;

  QTemp.SQL.Clear;
  QTemp.SQL.Add('delete from zmehall where nomer=' + Quotedstr(nomer) +
    ' and tip=2 and numisp=' + inttostr(row));
  QTemp.ExecSQL;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('delete from zmehsvod where nomer=' + Quotedstr(nomer) +
    ' and tip=2 and numisp=' + inttostr(row));
  QTemp.ExecSQL;
  // начинаем обсчеты
  Memo1.lines.Add('Запрос из Т45');
  QTemp.Close;
  QTemp.Open('SELECT rot n, torq m, (CAST(ts as date) - date ' +
    Quotedstr('1970-01-01') + ') * 86400 + to_number(TO_CHAR(ts,' +
    Quotedstr(fstr) + ')) - to_number(to_char(ts,' + Quotedstr('SS') + ')) t ' +
    ' FROM zamertmp order by rowid');
  QTemp.First;
  Rn := 0;
  Memo1.lines.Add('Обработка Т45');
  Qi.Close;
  Qi.SQL.Clear;
  Qi.SQL.Add('INSERT INTO ZAMER.ZMLAST ( M, N, TS) VALUES ( :M , :N ,  :TS )');
  while not QTemp.eof do
  begin
    Rn := Rn + 1;
    Ra[Rn].m := QTemp.FieldByName('m').AsFloat;
    Ra[Rn].n := QTemp.FieldByName('n').AsFloat;
    Ra[Rn].t := QTemp.FieldByName('t').AsFloat;
    Qi.ParamByName('M').AsFloat := Ra[Rn].m;
    Qi.ParamByName('N').AsFloat := Ra[Rn].n;
    Qi.ParamByName('TS').AsFloat := Ra[Rn].t;
    Qi.ExecSQL;
    QTemp.Next;
  end;
  Memo1.lines.Add('Запрос из Элспек');
  QTemp.Close;
  QTemp.Open('SELECT u, (CAST(ts as date) - date ' + Quotedstr('1970-01-01') +
    ') * 86400 + to_number(TO_CHAR(ts,' + Quotedstr(fstr) +
    ')) - to_number(to_char(ts,' + Quotedstr('SS') + ')) t ' +
    ' FROM zelspec order by rowid');
  QTemp.First;
  Un := 0;
  Memo1.lines.Add('Обработка элспек');

  Qi.Close;
  Qi.SQL.Clear;
  Qi.SQL.Add('INSERT INTO ZAMER.ZULAST ( U, TS) VALUES ( :U, :TS )');
  while not QTemp.eof do
  begin
    Un := Un + 1;
    Ua[Un].u := QTemp.FieldByName('u').AsFloat;
    Ua[Un].t := QTemp.FieldByName('t').AsFloat;
    Qi.ParamByName('U').AsFloat := Ua[Un].u;
    Qi.ParamByName('TS').AsFloat := Ua[Un].t;
    Qi.ExecSQL;
    QTemp.Next;
  end;
  QTemp.Close;
  ResN := 0;

  Qi.Close;
  Qi.SQL.Clear;
  Qi.SQL.Add
    ('INSERT INTO ZAMER.ZUMSVOD (U, M, N, TU, TM)VALUES ( :U ,  :M , :N , :TU ,  :TM  )');

  if Un < Rn then
  begin // по напряжению
    Memo1.lines.Add('U<N');
    for i := 1 to Un do
    begin // для каждого напряжения выбираем мин дельта времени с оборотами
      fnd := GetNObor(Ua[i].t, Rn);
      Memo1.lines.Add(floattostr(Ua[i].t) + ' ' + inttostr(fnd));
      if fnd = 0 then
      begin // was not found
        ResN := ResN + 1;
        ResA[ResN].u := 0;
        ResA[ResN].m := 0;
        ResA[ResN].n := 0;
        ResA[ResN].t1 := 0;
        ResA[ResN].t2 := 0;
        Memo1.lines.Add('notfound');
      end
      else
      begin // was found
        ResN := ResN + 1;
        ResA[ResN].u := Ua[i].u;
        ResA[ResN].m := Ra[fnd].m;
        ResA[ResN].n := Ra[fnd].n;
        ResA[ResN].t1 := Ua[i].t;
        ResA[ResN].t2 := Ra[fnd].t;
        Qi.ParamByName('U').AsFloat := ResA[ResN].u;
        Qi.ParamByName('TU').AsFloat := ResA[ResN].t1;
        Qi.ParamByName('M').AsFloat := ResA[ResN].m;
        Qi.ParamByName('N').AsFloat := ResA[ResN].n;
        Qi.ParamByName('TM').AsFloat := ResA[ResN].t2;
        Qi.ExecSQL;
        Memo1.lines.Add('found');
      end;
    end;
  end
  else
  begin // по оборотам
    Memo1.lines.Add('U>N');
    for i := 1 to Rn do
    begin // для каждого напряжения выбираем мин дельта времени с оборотами
      fnd := GetNU(Ra[i].t, Un);
      Memo1.lines.Add(floattostr(Ra[i].t) + ' ' + inttostr(fnd));
      if fnd = 0 then
      begin // was not found
        ResN := ResN + 1;
        ResA[ResN].u := 0;
        ResA[ResN].m := 0;
        ResA[ResN].n := 0;
        ResA[ResN].t1 := 0;
        ResA[ResN].t2 := 0;
        Memo1.lines.Add('notfound');
      end
      else
      begin // was found
        ResN := ResN + 1;
        ResA[ResN].u := Ua[fnd].u;
        ResA[ResN].m := Ra[i].m;
        ResA[ResN].n := Ra[i].n;
        ResA[ResN].t1 := Ua[fnd].t;
        ResA[ResN].t2 := Ra[i].t;
        Qi.ParamByName('U').AsFloat := ResA[ResN].u;
        Qi.ParamByName('TU').AsFloat := ResA[ResN].t1;
        Qi.ParamByName('M').AsFloat := ResA[ResN].m;
        Qi.ParamByName('N').AsFloat := ResA[ResN].n;
        Qi.ParamByName('TM').AsFloat := ResA[ResN].t2;
        Qi.ExecSQL;
        Memo1.lines.Add('found');
      end;
    end;

    { }
    // надо найти MIN N
    maxn := 1000000;
    for i := 1 to ResN do
    begin
      Memo1.lines.Add(gets(ResA[i]));
      QInsall.Close;
      QInsall.ParamByName('nomer').AsString := nomer;
      QInsall.ParamByName('usred').AsFloat := SimpleRoundTo(ResA[i].u, RazU);
      QInsall.ParamByName('u12').AsFloat := 0;
      QInsall.ParamByName('u23').AsFloat := 0;
      QInsall.ParamByName('u31').AsFloat := 0;
      QInsall.ParamByName('torq').AsFloat := SimpleRoundTo(ResA[i].m, -2);
      QInsall.ParamByName('rot').AsFloat := SimpleRoundTo(ResA[i].n, RazN);
      QInsall.ParamByName('tip').AsInteger := curr;
      QInsall.ParamByName('numisp').AsInteger := row;
      QInsall.ExecSQL;
      if ResA[i].m < maxn then
      begin
        if ResA[i].u > 20 then
        begin
          maxni := i;
          maxn := ResA[i].m;
        end;
      end;
    end;

    StringGrid8.cells[1, row] := floattostr(SimpleRoundTo(ResA[maxni].u, RazU));
    StringGrid8.cells[2, row] := floattostr(SimpleRoundTo(ResA[maxni].m, -2));
    StringGrid8.cells[3, row] := floattostr(SimpleRoundTo(ResA[maxni].n, RazN));
    Memo1.lines.Add('Вставка в итоговую таблицу');

    QInsSvod.Close;
    QInsSvod.ParamByName('nomer').AsString := nomer;
    QInsSvod.ParamByName('u').AsFloat := ResA[maxni].u;
    QInsSvod.ParamByName('torq').AsFloat := ResA[maxni].m;
    QInsSvod.ParamByName('rot').AsFloat := ResA[maxni].n;
    QInsSvod.ParamByName('tip').AsInteger := 2;
    QInsSvod.ParamByName('numisp').AsInteger := row;
    QInsSvod.ParamByName('checked').AsInteger := 0;
    QInsSvod.ExecSQL;

    Memo1.lines.Add('Все завершено');

  end;

  QTemp.Close;

  Qselsred.Close;
  Qselsred.open;
  stringgrid8.cells[1,stringgrid8.row] :=qselsred.fieldbyname('u').asstring;
  qselsred.close;


  Button37.Enabled := true;
  Button27.Enabled := true;
  Button42.Enabled := false;
  upstart.Enabled := true;
  downstart.Enabled := true;
  upstop.Enabled := false;
  FGraph.Button4.Click;
  FGraph.ShowModal;
end;

procedure TFMH.command(b: Boolean);
begin
  FZamerv2.SendCommand(FZamerv2, b, Fsett.Edit7.Text);
end;

procedure TFMH.downstartExecute(Sender: TObject);
begin
  Button37.Click;
end;

procedure TFMH.Timer1000Timer(Sender: TObject);
begin

  count := count + 1;
  if count >= 1000 then
  begin
    Timer1000.Enabled := false;
    ShowMessage('достигнуто максимальное количество замеров, замер остановлен');
    // exit;
  end;
  if curr = 1 then
  begin

  end;
  if curr = 2 then
  begin

  end;

  if count mod 10 = 0 then
    Label8.Caption := inttostr(count);

end;

procedure TFMH.TimerUpTimer(Sender: TObject);
begin
  QUp.Close;
  QUp.Open();

  Label6.Caption := myformat(trazm, QUp.FieldByName('torq').AsFloat);
  Label7.Caption := myformat(trazr, QUp.FieldByName('rot').AsFloat);
  Label5.Caption := myformat(trazu, QUp.FieldByName('u').AsFloat);
end;

procedure TFMH.upstartExecute(Sender: TObject);
begin
  Button27.Click;
end;

procedure TFMH.upstopExecute(Sender: TObject);
begin
  if curr = 1 then
    Button32.Click;
  if curr = 2 then
    Button42.Click;
end;

procedure TFMH.BitBtn1Click(Sender: TObject);
var
  i, j: Integer;
  // r: single;
  buttonSelected: Integer;
begin
  // ask me to save data and save
  buttonSelected :=
    MessageDlg('Правильно ли выделены максимальные и минимальные моменты?',
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
        QInsSvod.ParamByName('u').AsFloat :=
          strtofloat(StringGrid7.cells[1, i]);
        QInsSvod.ParamByName('torq').AsFloat :=
          strtofloat(StringGrid7.cells[2, i]);
        QInsSvod.ParamByName('rot').AsFloat :=
          strtofloat(StringGrid7.cells[3, i]);
        QInsSvod.ParamByName('tip').AsInteger := 1;
        QInsSvod.ParamByName('numisp').AsInteger := i;
        case i of
          1:
            if CheckBox1.Checked then
              QInsSvod.ParamByName('checked').AsInteger := 1
            else
              QInsSvod.ParamByName('checked').AsInteger := 0;
          2:
            if CheckBox2.Checked then
              QInsSvod.ParamByName('checked').AsInteger := 1
            else
              QInsSvod.ParamByName('checked').AsInteger := 0;
          3:
            if CheckBox3.Checked then
              QInsSvod.ParamByName('checked').AsInteger := 1
            else
              QInsSvod.ParamByName('checked').AsInteger := 0;
          4:
            if CheckBox4.Checked then
              QInsSvod.ParamByName('checked').AsInteger := 1
            else
              QInsSvod.ParamByName('checked').AsInteger := 0;
          5:
            if CheckBox5.Checked then
              QInsSvod.ParamByName('checked').AsInteger := 1
            else
              QInsSvod.ParamByName('checked').AsInteger := 0;
        end;
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
        QInsSvod.ParamByName('u').AsFloat :=
          strtofloat(StringGrid8.cells[1, i]);
        QInsSvod.ParamByName('torq').AsFloat :=
          strtofloat(StringGrid8.cells[2, i]);
        QInsSvod.ParamByName('rot').AsFloat :=
          strtofloat(StringGrid8.cells[3, i]);
        QInsSvod.ParamByName('tip').AsInteger := 2;
        QInsSvod.ParamByName('numisp').AsInteger := i;
        case i of
          1:
            if CheckBox6.Checked then
              QInsSvod.ParamByName('checked').AsInteger := 1
            else
              QInsSvod.ParamByName('checked').AsInteger := 0;
          2:
            if CheckBox7.Checked then
              QInsSvod.ParamByName('checked').AsInteger := 1
            else
              QInsSvod.ParamByName('checked').AsInteger := 0;
          3:
            if CheckBox8.Checked then
              QInsSvod.ParamByName('checked').AsInteger := 1
            else
              QInsSvod.ParamByName('checked').AsInteger := 0;
          4:
            if CheckBox9.Checked then
              QInsSvod.ParamByName('checked').AsInteger := 1
            else
              QInsSvod.ParamByName('checked').AsInteger := 0;
          5:
            if CheckBox10.Checked then
              QInsSvod.ParamByName('checked').AsInteger := 1
            else
              QInsSvod.ParamByName('checked').AsInteger := 0;
        end;
        QInsSvod.ExecSQL;
      end;
    /// ///////

    FZamerv2.ImgSet(FZamerv2.Image6, true);
    FMH.Close;
  end;
end;

procedure TFMH.BitBtn2Click(Sender: TObject);
begin
  FZamerv2.ImgSet(FZamerv2.Image6, false);
  FMH.Close;
end;

procedure TFMH.Button1Click(Sender: TObject);
begin
  FGraph.ShowModal;
end;

procedure TFMH.Button27Click(Sender: TObject);
var
  i: Integer;
  tr: R;
begin // start

  tr.u1 := 0;
  tr.u2 := 0;
  tr.u3 := 0;
  tr.usred := 0;
  tr.n := 0;
  tr.m := 0;
  count := 0; // current number
  curr := 1; // stringgrid7
  row := StringGrid7.row;

  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('truncate table zamertmp');
  QTemp.ExecSQL;
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('truncate table zelspec');
  QTemp.ExecSQL;
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('delete from zmehall where nomer=' + Quotedstr(nomer) +
    ' and tip=1 and numisp=' + inttostr(row));
  QTemp.ExecSQL;
  QTemp.Close;
  for i := 1 to 1000 do
    amax[row, i] := tr;
  command(true);
  // Timer1.Enabled   := true;
  Timer1000.Enabled := true;
  Button27.Enabled := false;
  upstart.Enabled := false;
  downstart.Enabled := false;
  upstop.Enabled := true;
  Button32.Enabled := true;
  Button37.Enabled := false;
end;

procedure TFMH.FormActivate(Sender: TObject);
var
  i: Integer;
begin
  nomer := Label13.Caption;
  TimerUp.Enabled := true;
end;

procedure TFMH.FormCreate(Sender: TObject);
begin
  StringGrid7.cells[0, 0] := '';
  StringGrid7.cells[1, 0] := 'Uсред, В';
  StringGrid7.cells[2, 0] := 'M, Н/м';
  StringGrid7.cells[3, 0] := 'N, об/мин';
  StringGrid7.cells[0, 1] := 'Изм. 1';
  StringGrid7.cells[0, 2] := 'Изм. 2';
  StringGrid7.cells[0, 3] := 'Изм. 3';
  StringGrid7.cells[0, 4] := 'Изм. 4';
  StringGrid7.cells[0, 5] := 'Изм. 5';
  // row                     := 1;
  StringGrid8.cells[0, 0] := '';
  StringGrid8.cells[1, 0] := 'Uсред, В';
  StringGrid8.cells[2, 0] := 'M, Н/м';
  StringGrid8.cells[3, 0] := 'N, об/мин';
  StringGrid8.cells[0, 1] := 'Изм. 1';
  StringGrid8.cells[0, 2] := 'Изм. 2';
  StringGrid8.cells[0, 3] := 'Изм. 3';
  StringGrid8.cells[0, 4] := 'Изм. 4';
  StringGrid8.cells[0, 5] := 'Изм. 5';
end;

procedure TFMH.FormHide(Sender: TObject);
begin
  TimerUp.Enabled := false;
end;

procedure TFMH.StringGrid7DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  s: string;
begin
  with StringGrid7 do
  begin
    if ARow = 0 then
      Canvas.Brush.Color := Fsett.Panel1.Color;
    Canvas.Brush.Style := bsSolid;
    s := cells[ACol, ARow];
    if (ARow = StringGrid7.row) and (ACol > 0) and (ARow > 0) then
      Canvas.Brush.Color := Fsett.Panel2.Color;
    Canvas.FillRect(Rect);
    Canvas.TextRect(Rect, s, [tfWordBreak]);
  end;
end;

procedure TFMH.StringGrid8DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  s: string;
begin
  with StringGrid8 do
  begin
    if ARow = 0 then
      Canvas.Brush.Color := Fsett.Panel1.Color;
    Canvas.Brush.Style := bsSolid;
    s := cells[ACol, ARow];
    if (ARow = StringGrid8.row) and (ACol > 0) and (ARow > 0) then
      Canvas.Brush.Color := Fsett.Panel2.Color;
    Canvas.FillRect(Rect);
    Canvas.TextRect(Rect, s, [tfWordBreak]);
  end;
end;

end.
