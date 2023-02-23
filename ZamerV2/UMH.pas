unit UMH;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
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
  nomer:string;


implementation

{$R *.dfm}

uses UGraph, Uzv2Main;

type
 Ur = record
  u,t:double;
  end;
 Rr = record
  m,n,t:double;
  end;
 Resr = record
  u,m,n, t1,t2 :double;
 end;

var
  Ua : array [1..1000] of Ur;
  Ra : array [1..1000] of Rr;
  ResA : array[1..1000] of ResR;
  Uo : Ur;
  Ro : Rr;
  ResO : resR;
  Un,Rn, ResN:integer;



  amax, amin           : array [1 .. 5, 1 .. 1000] of R;
  cmax, cmin           : array [1 .. 5] of Integer;
  count, num, curr, row: Integer;



function GetNObor(t:double; max:integer): integer;
 var
  i, res:integer;
  prev : double;
begin
  prev:=1000000;
  res:=0;
  for i:=1 to max do
     if abs(t-Ra[i].t)<prev then
      begin
        res:=i;
        prev:= abs(t-Ra[i].t);
      end;
  GetNobor:=res;
end;

function GetNU(t:double; max:integer): integer;
 var
  i, res:integer;
  prev : double;
begin
  prev:=1000000;
  res:=0;
  for i:=1 to max do
     if abs(t-Ua[i].t)<prev then
      begin
        res:=i;
        prev:= abs(t-Ua[i].t);
      end;
  GetNU:=res;
end;

function gets(e:resr):string;
 begin
  gets:= floattostr(e.u)+' '+floattostr(e.m)+' '+floattostr(e.n);
 end;

procedure TFMH.Button32Click(Sender: TObject);

var
  t, i, maxni: Integer;
  f , maxn : double;
  fnd : integer;
begin
  Timer1000.Enabled := false;
  Command(false);
  // начинаем обсчеты
  QTemp.Close;
  QTemp.Open('SELECT rot n, torq m, (CAST(ts as date) - date '+ Quotedstr('1970-01-01') +
    ') * 86400 + to_number(TO_CHAR(ts,' +Quotedstr('SS.FF')+')) - to_number(to_char(ts,' +Quotedstr('SS')+')) t '+
    ' FROM zamertmp order by rowid');
  QTemp.First;
  Rn:=0;
  while not QTemp.eof do
   begin
    Rn:=Rn+1;
    Ra[Rn].m:= QTemp.FieldByName('m').AsFloat;
    Ra[Rn].n:= QTemp.FieldByName('n').AsFloat;
    Ra[Rn].t:= QTemp.FieldByName('t').AsFloat;
    QTemp.Next;
   end;

  QTemp.Close;
  QTemp.Open('SELECT u, (CAST(ts as date) - date '+ Quotedstr('1970-01-01') +
    ') * 86400 + to_number(TO_CHAR(ts,' +Quotedstr('SS.FF')+')) - to_number(to_char(ts,' +Quotedstr('SS')+')) t '+
    ' FROM zelspec order by rowid');
  QTemp.First;
  Un:=0;
  while not QTemp.eof do
   begin
    Un:=Un+1;
    Ua[Un].u:= QTemp.FieldByName('u').AsFloat;
    Ua[Un].t:= QTemp.FieldByName('t').AsFloat;
    QTemp.Next;
   end;
  QTemp.Close;
  ResN:=0;
  if Un < Rn then
   begin // по напряжению
   memo1.lines.add('U<N');
    for i := 1 to Un do
     begin // для каждого напряжения выбираем мин дельта времени с оборотами
      fnd:= GetNobor(Ua[i].t, Rn);
       memo1.lines.add(floattostr(Ua[i].t) + ' ' + inttostr(fnd));
      if fnd = 0 then
       begin  // was not found
        ResN:=ResN+1;
        ResA[Resn].u := 0;
        ResA[Resn].m := 0;
        ResA[Resn].n := 0;
        ResA[Resn].t1:= 0;
        ResA[Resn].t2:= 0;
        memo1.lines.add('notfound');
       end
      else
       begin // was found
        ResN:=ResN+1;
        ResA[Resn].u := Ua[i].u;
        ResA[Resn].m := Ra[fnd].m;
        ResA[Resn].n := Ra[fnd].n;
        ResA[Resn].t1:= Ua[i].t;
        ResA[Resn].t2:= Ra[fnd].t;
        memo1.lines.add('found');
       end;
     end;
   end
   else
    begin // по оборотам
    memo1.lines.add('U>N');
     for i := 1 to Rn do
     begin // для каждого напряжения выбираем мин дельта времени с оборотами
      fnd:= GetNU(Ra[i].t, Un);
      memo1.lines.add(floattostr(Ra[i].t) + ' ' + inttostr(fnd));
      if fnd = 0 then
       begin  // was not found
        ResN:=ResN+1;
        ResA[Resn].u := 0;
        ResA[Resn].m := 0;
        ResA[Resn].n := 0;
        ResA[Resn].t1:= 0;
        ResA[Resn].t2:= 0;
        memo1.lines.add('notfound');
       end
      else
       begin // was found
        ResN:=ResN+1;
        ResA[Resn].u := Ua[fnd].u;
        ResA[Resn].m := Ra[i].m;
        ResA[Resn].n := Ra[i].n;
        ResA[Resn].t1:= Ua[fnd].t;
        ResA[Resn].t2:= Ra[i].t;
        memo1.lines.add('found');
       end;
     end;

     {}
     // надо найти макс N

      for i:=1 to resn do
         begin
          Memo1.lines.add(gets(resa[i]));
          if resa[i].n>maxn then
           begin
            maxni:=i;
            maxn:=resa[i].n;
           end;
         end;

     StringGrid7.cells[1, row] :=
    FloatToStr(SimpleRoundTo(resa[maxni].u, RazU));
  StringGrid7.cells[2, row] :=
    FloatToStr(SimpleRoundTo(resa[maxni].m, RazM));
  StringGrid7.cells[3, row] :=
    FloatToStr(SimpleRoundTo(resa[maxni].n, RazN));

    QInsAll.close;
    QInsall.ParamByName('nomer').AsString := nomer;
    QInsall.ParamByName('usred').AsFloat  := resa[maxni].u;
    QInsall.ParamByName('u12').AsFloat := 0;
    QInsall.ParamByName('u23').AsFloat := 0;
    QInsall.ParamByName('u31').AsFloat := 0;
    QInsall.ParamByName('torq').AsFloat := resa[maxni].m;
    QInsall.ParamByName('rot').AsFloat := resa[maxni].n;
    QInsall.ParamByName('tip').AsInteger    := 1;
    QInsall.ParamByName('numisp').AsInteger := row;
    QInsall.ExecSQL;



    end;
    {QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('select count(*) c from zamertmp');
  QTemp.Open;
  count:= QTemp.FieldByName('c').AsInteger;
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('select count(*) c from zelspec');
  QTemp.Open;
  t := min(count, QTemp.FieldByName('c').AsInteger);
  }
  {
  QTemp.Close;
  QTemp.Open('select to_number(rot) rot, to_number(torq) torq from zamertmp order by rowid');
  QTemp.First;
  QTemp2.Open('select * from zelspec order by rowid');
  QTemp.First;
  QInsall.Close;
  for i := 1 to t do
  begin
    QInsall.ParamByName('nomer').AsString := nomer;
    QInsall.ParamByName('usred').AsFloat  :=
      SimpleRoundTo(amax[row, i].usred, -4);
    QInsall.ParamByName('u12').AsFloat := SimpleRoundTo(QTemp2.FieldByName('u1').AsFloat, RazU);
    QInsall.ParamByName('u23').AsFloat := SimpleRoundTo(QTemp2.FieldByName('u2').AsFloat, RazU);
    QInsall.ParamByName('u31').AsFloat := SimpleRoundTo(QTemp2.FieldByName('u3').AsFloat, RazU);
    QInsall.ParamByName('torq').AsFloat :=
      SimpleRoundTo(QTemp.FieldByName('torq').AsFloat, RazM);
    QInsall.ParamByName('rot').AsFloat :=
      SimpleRoundTo(QTemp.FieldByName('rot').AsFloat, RazN);
    QInsall.ParamByName('tip').AsInteger    := 1;
    QInsall.ParamByName('numisp').AsInteger := row;
    QInsall.ExecSQL;
    QTemp.Next;  QTemp2.Next;
  end;
  }

  {
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add
    ('select * from zmehall where torq=(select max(torq) from zmehall where nomer='
    + Quotedstr(nomer) + ' and numisp=' + inttostr(row) +
    ' and tip=1) and nomer=' + Quotedstr(nomer) + ' and numisp=' + inttostr(row)
    + ' and tip=1');
  QTemp.Open;
  StringGrid7.cells[1, row] :=
    FloatToStr(SimpleRoundTo(QTemp.FieldByName('usred').AsFloat, RazU));
  StringGrid7.cells[2, row] :=
    FloatToStr(SimpleRoundTo(QTemp.FieldByName('torq').AsFloat, RazM));
  StringGrid7.cells[3, row] :=
    FloatToStr(SimpleRoundTo(QTemp.FieldByName('rot').AsFloat, RazN));
  }
  QTemp.Close;
  Button27.Enabled := true;
  Button37.Enabled := true;
  Button32.Enabled := false;
  upstart.Enabled:=true;
  downstart.Enabled:=true;
  upstop.Enabled:=false;
end;

procedure TFMH.Button37Click(Sender: TObject);
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
  QTemp.SQL.Add('truncate table zelspec');
  QTemp.ExecSQL;
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('delete from zmehall where nomer=' + Quotedstr(nomer) +
    ' and tip=2 and numisp=' + inttostr(row));
  QTemp.ExecSQL;
  for i          := 1 to 1000 do
    amin[row, i] := tr;
  Command(true);
  Timer1000.Enabled   := true;
  Button37.Enabled := false;
  upstart.Enabled:=false;
  downstart.Enabled:=false;
  upstop.Enabled:=true;
  Button42.Enabled := true;
  Button27.Enabled := false;
end;

procedure TFMH.Button42Click(Sender: TObject);
var
  t, i: Integer;
  f   : single;
begin
  Timer1000.Enabled := false;
  Command(false);
  // начинаем обсчеты
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('select count(*) c from zamertmp');
  QTemp.Open;
  count:= QTemp.FieldByName('c').AsInteger;
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('select count(*) c from zelspec');
  QTemp.Open;
  t := min(count, QTemp.FieldByName('c').AsInteger);
  QTemp.Close;
  QTemp.Open('select to_number(rot) rot, to_number(torq) torq from zamertmp order by rowid');
  QTemp.First;
  QTemp2.Open('select * from zelspec order by rowid');
  QTemp.First;
  QInsall.Close;
  for i := 1 to t do
  begin
    QInsall.ParamByName('nomer').AsString := nomer;
    QInsall.ParamByName('usred').AsFloat  :=
      SimpleRoundTo(amax[row, i].usred, -4);
    QInsall.ParamByName('u12').AsFloat := SimpleRoundTo(QTemp2.FieldByName('u1').AsFloat, RazU);
    QInsall.ParamByName('u23').AsFloat := SimpleRoundTo(QTemp2.FieldByName('u2').AsFloat, RazU);
    QInsall.ParamByName('u31').AsFloat := SimpleRoundTo(QTemp2.FieldByName('u3').AsFloat, RazU);
    QInsall.ParamByName('torq').AsFloat :=
      SimpleRoundTo(QTemp.FieldByName('torq').AsFloat, -4);
    QInsall.ParamByName('rot').AsFloat :=
      SimpleRoundTo(QTemp.FieldByName('rot').AsFloat, -4);
    QInsall.ParamByName('tip').AsInteger    := 2;
    QInsall.ParamByName('numisp').AsInteger := row;
    QInsall.ExecSQL;
    QTemp.Next; QTemp2.Next;
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
    FloatToStr(SimpleRoundTo(QTemp.FieldByName('usred').AsFloat, RazU));
  StringGrid8.cells[2, row] :=
    FloatToStr(SimpleRoundTo(QTemp.FieldByName('torq').AsFloat, RazM));
  StringGrid8.cells[3, row] :=
    FloatToStr(SimpleRoundTo(QTemp.FieldByName('rot').AsFloat, RazN));
  QTemp.Close;
  Button37.Enabled := true;
  Button27.Enabled := true;
  Button42.Enabled := false;
  FGraph.Button4.Click;
  FGraph.ShowModal;
end;

procedure TFMH.command(b: Boolean);
var
  interval: integer;
  fname: string;
begin
  interval := 50;
  fname := '1600';
  if b then
  begin
    QTemp.Close;
    QTemp.SQL.Clear;

    QTemp.SQL.add
      ('insert into command (nomer, filename,command, dat,interval) values(' +
      Quotedstr(nomer) + ' ,' + fname + ', 1, ' + '4' + ',' +
      inttostr(interval) + ')');
    QTemp.ExecSQL;
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.add('insert into command (nomer, command) values(' +
      Quotedstr(nomer) + ' , 11)');
    QTemp.ExecSQL;
  end
  else
  begin
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.add
      ('insert into command (nomer, filename,command, dat,interval) values(' +
      Quotedstr(nomer) + ' ,' + fname + ', 0, ' + '4' + ',' +
      inttostr(interval) + ')');
    QTemp.ExecSQL;
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.add('insert into command (nomer, command) values(' +
      Quotedstr(nomer) + ' , 10)');
    QTemp.ExecSQL;
  end;
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

  // find for max and min
  {
  buttonSelected := MessageDlg('Найти максимальные и минимальные моменты?',
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
        CheckBox1.Checked := true;
      2:
        CheckBox2.Checked := true;
      3:
        CheckBox3.Checked := true;
      4:
        CheckBox4.Checked := true;
      5:
        CheckBox5.Checked := true;
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
        CheckBox6.Checked := true;
      2:
        CheckBox7.Checked := true;
      3:
        CheckBox8.Checked := true;
      4:
        CheckBox9.Checked := true;
      5:
        CheckBox10.Checked := true;
    end;
  end;
  }
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
        QInsSvod.ParamByName('u').AsFloat      :=
          strtofloat(StringGrid7.cells[1, i]);
        QInsSvod.ParamByName('torq').AsFloat :=
          strtofloat(StringGrid7.cells[2, i]);
        QInsSvod.ParamByName('rot').AsFloat :=
          strtofloat(StringGrid7.cells[3, i]);
        QInsSvod.ParamByName('tip').AsInteger    := 1;
        QInsSvod.ParamByName('numisp').AsInteger := i;
        case i of
        1:  if checkbox1.Checked then QInsSvod.ParamByName('checked').AsInteger := 1
        else
          QInsSvod.ParamByName('checked').AsInteger := 0;
        2:  if checkbox2.Checked then QInsSvod.ParamByName('checked').AsInteger := 1
        else
          QInsSvod.ParamByName('checked').AsInteger := 0;
        3:  if checkbox3.Checked then QInsSvod.ParamByName('checked').AsInteger := 1
        else
          QInsSvod.ParamByName('checked').AsInteger := 0;
        4:  if checkbox4.Checked then QInsSvod.ParamByName('checked').AsInteger := 1
        else
          QInsSvod.ParamByName('checked').AsInteger := 0;
        5:  if checkbox5.Checked then QInsSvod.ParamByName('checked').AsInteger := 1
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
        QInsSvod.ParamByName('u').AsFloat      :=
          strtofloat(StringGrid8.cells[1, i]);
        QInsSvod.ParamByName('torq').AsFloat :=
          strtofloat(StringGrid8.cells[2, i]);
        QInsSvod.ParamByName('rot').AsFloat :=
          strtofloat(StringGrid8.cells[3, i]);
        QInsSvod.ParamByName('tip').AsInteger    := 2;
        QInsSvod.ParamByName('numisp').AsInteger := i;
        case i of
        1:  if checkbox6.Checked then QInsSvod.ParamByName('checked').AsInteger := 1
        else
          QInsSvod.ParamByName('checked').AsInteger := 0;
        2:  if checkbox7.Checked then QInsSvod.ParamByName('checked').AsInteger := 1
        else
          QInsSvod.ParamByName('checked').AsInteger := 0;
        3:  if checkbox8.Checked then QInsSvod.ParamByName('checked').AsInteger := 1
        else
          QInsSvod.ParamByName('checked').AsInteger := 0;
        4:  if checkbox9.Checked then QInsSvod.ParamByName('checked').AsInteger := 1
        else
          QInsSvod.ParamByName('checked').AsInteger := 0;
        5:  if checkbox10.Checked then QInsSvod.ParamByName('checked').AsInteger := 1
        else
          QInsSvod.ParamByName('checked').AsInteger := 0;
        end;
        QInsSvod.ExecSQL;
      end;
    /// ///////

    FZamerV2.ImgSet(FZamerV2.Image6, true);
    FMH.Close;
  end;
end;


procedure TFMH.BitBtn2Click(Sender: TObject);
begin
  FZamerV2.ImgSet(FZamerV2.Image6, false);
  FMH.Close;
end;

procedure TFMH.Button27Click(Sender: TObject);
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
  QTemp.SQL.Add('truncate table zelspec');
  QTemp.ExecSQL;
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('delete from zmehall where nomer=' + Quotedstr(nomer) +
    ' and tip=1 and numisp=' + inttostr(row));
  QTemp.ExecSQL;
  QTemp.Close;
  for i          := 1 to 1000 do
    amax[row, i] := tr;
  Command(true);
  // Timer1.Enabled   := true;
  Timer1000.Enabled   := true;
  Button27.Enabled := false;
  upstart.Enabled:=false;
  downstart.Enabled:=false;
  upstop.Enabled:=true;
  Button32.Enabled := true;
  Button37.Enabled := false;
end;

procedure TFMH.FormActivate(Sender: TObject);
var
  i: integer;
begin
 Nomer:=Label13.Caption;
 TimerUp.Enabled:=true;
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
  //row                     := 1;
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
 TimerUp.Enabled:=false;
end;

end.
