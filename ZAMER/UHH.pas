unit UHH;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Math, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Actions, Vcl.ActnList;

type
  TFhhod = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    CheckBox1: TCheckBox;
    Label3: TLabel;
    Label4: TLabel;
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
    TimerUpd: TTimer;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label11: TLabel;
    Label12: TLabel;
    ActionList1: TActionList;
    Action1: TAction;
    procedure RadioButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure StringGrid2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure BitBtn3Click(Sender: TObject);
    procedure TimerUpdTimer(Sender: TObject);
    procedure beep;
    procedure FormHide(Sender: TObject);
    procedure Action1Execute(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure autogrid(var stringgrid1:tstringgrid);
  end;

  R = record
    u1, u2, u3, i1, i2, i3, p1, p2, p3, ps, u, i, p: real;
  end;

var
  Fhhod      : TFhhod;
  currentvolt: single;
  maxtime    : Integer;
  curtime    : Integer;

  a       : array [1 .. 1000] of R;
  acount  : Integer;
  tipispyt: Integer;

  pereU, pereI: real;

implementation

{$R *.dfm}

uses Umain;


procedure TFhhod.autogrid(var stringgrid1:tstringgrid);
var
  x, y, w: integer;
  s: string;
  MaxWidth: integer;
begin
  with StringGrid1 do
    //ClientHeight := DefaultRowHeight * RowCount + 5;
    with StringGrid1 do
    begin
      for x := 0 to ColCount - 1 do
      begin
        MaxWidth := 0;
        for y := 0 to RowCount - 1 do
        begin
          w := Canvas.TextWidth(Cells[x,y]);
          if w > MaxWidth then
            MaxWidth := w;
        end;
        ColWidths[x] := MaxWidth + 5;
      end;
    end;
end;

procedure AutoSizeGridColumn(Grid: TStringGrid; column: integer);
var
 i: integer;
 temp: integer;
 max: integer;
begin
 max := 0;
 for i := 0 to (Grid.RowCount - 1) do
  begin
  temp := Grid.Canvas.TextWidth(grid.cells[column, i]);
  if temp > max then max := temp;
  end;
 Grid.ColWidths[column] := Max + {Grid.GridLineWidth +} 3;
end;


function myfloat(s:string):double;
 var
  v:integer;
  f:double;
 begin
  val(s,f,v);
  if v=0 then
   myfloat:=f else myfloat:=0;
 end;

procedure TFhhod.Action1Execute(Sender: TObject);
begin
  BitBtn1.Click;
end;

procedure TFhhod.beep;
begin
  // сделать звук
  MessageBeep(word(-1));
end;

procedure TFhhod.BitBtn1Click(Sender: TObject);
begin
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.add('delete from zhhall where nomer=' + Quotedstr(Nomer) +
    ' and uisp=' + Label6.Caption);
  QTemp.ExecSQL;
  acount            := 0;
  curtime           := 0;
  maxtime           := Strtoint(Edit1.Text);
  ProgressBar1.min  := 0;
  ProgressBar1.Max  := Strtoint(Edit1.Text);
  ProgressBar1.Step := 1;
  pereI             := 0;
  Timer2.Enabled    := True;
  Timer1.Enabled    := True;
end;

procedure TFhhod.BitBtn2Click(Sender: TObject);
var
  i             : Integer;
  b             : Boolean;
  buttonSelected: Integer;
begin

  b     := false;
  for i := 1 to StringGrid2.rowcount - 2 do
  begin
    if StringGrid2.cells[5, i] = '' then
      b := True;
    if StringGrid2.cells[5, i] = '0' then
      b := True;
  end;
  if b then
  begin
    buttonSelected :=
      MessageDlg('Есть нулевые сопротивления, продолжить запись?',
      mtConfirmation, mbYesNo, 0);
    if buttonSelected = mrNo then
      exit;
  end;
  i := 1;
  while StringGrid2.cells[0, i] <> '' do
  begin
    // тут считается среднее по показаниям только датчика
    // напряжения, подвохов не ожидается
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.add('delete from zhhsvod where nomer=' + Quotedstr(Nomer) +
      ' and uisp=' + StringGrid2.cells[0, i]);
    QTemp.ExecSQL;

    QInsSvod.ParamByName('nomer').Asstring := Nomer;
    QInsSvod.ParamByName('uisp').AsFloat := StrtoFloat(StringGrid2.cells[0, i]);
    QInsSvod.ParamByName('usred').AsFloat :=
      StrtoFloat(StringGrid2.cells[1, i]);
    QInsSvod.ParamByName('isred').AsFloat :=
      StrtoFloat(StringGrid2.cells[2, i]);
    QInsSvod.ParamByName('psred').AsFloat :=
      StrtoFloat(StringGrid2.cells[3, i]);
    QInsSvod.ParamByName('dumax').AsFloat :=
      StrtoFloat(StringGrid2.cells[4, i]);
    QInsSvod.ParamByName('tip').Asinteger := tipispyt;
    if StringGrid2.cells[5, i] = '' then
      StringGrid2.cells[5, i]         := '0';
    QInsSvod.ParamByName('R').AsFloat := StrtoFloat(StringGrid2.cells[5, i]);
    QInsSvod.ExecSQL;
    i := i + 1;
  end;

  Fmain.Label29.font.Color := clGreen;
  Fmain.Label29.Caption    := 'ПРОЙДЕН';
  Fhhod.Close;
end;

procedure TFhhod.BitBtn3Click(Sender: TObject);
var
  i, j: Integer;
begin
  for i                       := 1 to StringGrid2.colcount - 1 do
    for j                     := 1 to StringGrid2.rowcount - 1 do
      StringGrid2.cells[j, i] := '0';
  for i                       := 1 to StringGrid2.colcount - 1 do
    StringGrid2.cells[0, i]   := '';
  StringGrid2.rowcount        := 2;
  RadioButton1.Checked        := false;
  RadioButton2.Checked        := false;
  RadioButton3.Checked        := false;
  BitBtn1.Enabled             := false;

  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.add('delete from zhhall where nomer=' + Quotedstr(Nomer));
  QTemp.ExecSQL;
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.add('delete from zhhsvod where nomer=' + Quotedstr(Nomer));
  QTemp.ExecSQL;
end;

procedure TFhhod.FormActivate(Sender: TObject);
var
  i: Integer;
begin
  Label3.Caption            := Fmain.Edit6.Text;
  for i                     := 1 to 10 do
    StringGrid1.cells[0, i] := inttostr(i);
  StringGrid1.cells[0, 0]   := '№';
  StringGrid1.cells[1, 0]   := 'Вар. 1';
  StringGrid1.cells[2, 0]   := 'Вар. 2';
  StringGrid1.cells[3, 0]   := 'Вар. 3';
  StringGrid2.cells[0, 0]   := 'Uхх';
  StringGrid2.cells[1, 0]   := 'U сред';
  StringGrid2.cells[2, 0]   := 'I сред';
  StringGrid2.cells[3, 0]   := 'P сред';
  StringGrid2.cells[4, 0]   := '▲Umax';
  StringGrid2.cells[5, 0]   := 'R';
  StringGrid2.cells[6, 0]   := 'Отклонений';
  TimerUpd.Enabled          := True;
  //AutoSizeGridColumn(StringGrid2,0);

end;

procedure TFhhod.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  i, j: Integer;
  f   : textfile;
begin
  AssignFile(f, extractfilepath(paramstr(0)) + '\GridHH.TXT');
  ReWrite(f);
  for i   := 1 to 10 do
    for j := 1 to 3 do
    begin
      WriteLn(f, StringGrid1.cells[j, i]);
    end;
  CloseFile(f);

  // delta and del
  {
  Fmain.QDelta.SQL.Clear;
  Fmain.QDelta.SQL.add('delete from zdelta where name=' + Quotedstr('uhh'));
  Fmain.QDelta.ExecSQL;
  Fmain.QDelta.SQL.Clear;
  Fmain.QDelta.SQL.add('insert into zdelta (name,value) values(' +
    Quotedstr('uhh') + ',' + Fhhod.Edit2.Text + ')');
  Fmain.QDelta.ExecSQL;
  }
  Fmain.QDelta.SQL.Clear;
  Fmain.QDelta.SQL.add('update zdelta set value='+Fhhod.Edit2.Text+' where name=' + Quotedstr('uhh'));
  Fmain.QDelta.ExecSQL;
  QTemp.Close;
  {QTemp.SQL.Clear;
  QTemp.SQL.add('delete from ini where name=' + Quotedstr('hhdel'));
  QTemp.ExecSQL;
  QTemp.Close;
  QTemp.SQL.Clear;
  if CheckBox2.Checked then
    QTemp.SQL.add('insert into ini (name,value) values(' +
      Quotedstr('hhdel') + ',1)')
  else
    QTemp.SQL.add('insert into ini (name,value) values(' +
      Quotedstr('hhdel') + ',0)');
  QTemp.ExecSQL;
  }
end;

procedure TFhhod.FormCreate(Sender: TObject);
var
  i, j: Integer;
  f   : textfile;
  s   : string;
begin
  AssignFile(f, extractfilepath(paramstr(0)) + '\GridHH.TXT');
  ReSet(f);
  for i   := 1 to 10 do
    for j := 1 to 3 do
    begin
      ReadLn(f, s);
      StringGrid1.cells[j, i] := s;
    end;
  CloseFile(f);

  Fmain.QDelta.Open('select value from zdelta where name=' + Quotedstr('uhh'));
  Fhhod.Edit2.Text := Fmain.QDelta.FieldByName('value').Asstring;
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.Open('select value from ini where name=' + Quotedstr('hhdel'));
  //CheckBox2.Checked := QTemp.FieldByName('value').Asinteger = 1;
end;

procedure TFhhod.FormHide(Sender: TObject);
begin
  TimerUpd.Enabled := false;
end;

procedure TFhhod.RadioButton1Click(Sender: TObject);
var
  i, j: Integer;
  cod : Integer;

begin
  for i                       := 1 to StringGrid2.colcount - 1 do
    for j                     := 0 to StringGrid2.rowcount - 1 do
      StringGrid2.cells[j, i] := '';
  StringGrid2.rowcount        := 2;
  if StringGrid1.cells[1, 1] = '' then
  begin
    ShowMessage('Нет данных для испытания');
    exit;
  end;

  val(Fmain.Edit6.Text, currentvolt, cod);
  if cod = 0 then
  begin
    StringGrid2.rowcount := 2;
    for i                := 1 to StringGrid1.rowcount - 1 do
      if StringGrid1.cells[1, i] <> '' then
      begin
        StringGrid2.rowcount    := StringGrid2.rowcount + 1;
        StringGrid2.cells[0, i] :=
          floattostr(round(currentvolt / 100 *
          Strtoint(StringGrid1.cells[1, i])));
      end;
    StringGrid2.cells[0, StringGrid2.rowcount - 1] := '';
    StringGrid2.row                                := 1;
    tipispyt                                       := 1;
    Label6.Caption                                 := StringGrid2.cells[0, 1];
    BitBtn1.Enabled                                := True;
    BitBtn2.Enabled                                := True;
    BitBtn3.Enabled                                := True;
  end
  else
    ShowMessage
      ('Не удалось получить испытательное напряжение двигателя из установок текущего испытания');
end;

procedure TFhhod.RadioButton2Click(Sender: TObject);
var
  i, j: Integer;
  cod : Integer;

begin
  for i                       := 1 to StringGrid2.colcount - 1 do
    for j                     := 0 to StringGrid2.rowcount - 1 do
      StringGrid2.cells[j, i] := '';
  StringGrid2.rowcount        := 2;
  if StringGrid1.cells[2, 1] = '' then
  begin
    ShowMessage('Нет данных для испытания');
    exit;
  end;

  val(Fmain.Edit6.Text, currentvolt, cod);
  if cod = 0 then
  begin
    StringGrid2.rowcount := 2;
    for i                := 1 to StringGrid1.rowcount - 1 do
      if StringGrid1.cells[2, i] <> '' then
      begin
        StringGrid2.rowcount    := StringGrid2.rowcount + 1;
        StringGrid2.cells[0, i] :=
          floattostr(round(currentvolt / 100 *
          Strtoint(StringGrid1.cells[2, i])));
      end;
    StringGrid2.cells[0, StringGrid2.rowcount - 1] := '';
    StringGrid2.row                                := 1;
    tipispyt                                       := 2;
    Label6.Caption                                 := StringGrid2.cells[0, 1];
    BitBtn1.Enabled                                := True;
    BitBtn2.Enabled                                := True;
    BitBtn3.Enabled                                := True;
  end
  else
    ShowMessage
      ('Не удалось получить испытательное напряжение двигателя из установок текущего испытания');
end;

procedure TFhhod.RadioButton3Click(Sender: TObject);
var
  i, j: Integer;
  cod : Integer;

begin
  for i                       := 1 to StringGrid2.colcount - 1 do
    for j                     := 0 to StringGrid2.rowcount - 1 do
      StringGrid2.cells[j, i] := '';
  StringGrid2.rowcount        := 2;
  if StringGrid1.cells[3, 1] = '' then
  begin
    ShowMessage('Нет данных для испытания');
    exit;
  end;

  val(Fmain.Edit6.Text, currentvolt, cod);
  if cod = 0 then
  begin
    StringGrid2.rowcount := 2;
    for i                := 1 to StringGrid1.rowcount - 1 do
      if StringGrid1.cells[3, i] <> '' then
      begin
        StringGrid2.rowcount    := StringGrid2.rowcount + 1;
        StringGrid2.cells[0, i] :=
          floattostr(round(currentvolt / 100 *
          Strtoint(StringGrid1.cells[3, i])));
      end;
    StringGrid2.cells[0, StringGrid2.rowcount - 1] := '';
    StringGrid2.row                                := 1;
    tipispyt                                       := 3;
    Label6.Caption                                 := StringGrid2.cells[0, 1];
    BitBtn1.Enabled                                := True;
    BitBtn2.Enabled                                := True;
    BitBtn3.Enabled                                := True;
  end
  else
    ShowMessage
      ('Не удалось получить испытательное напряжение двигателя из установок текущего испытания');
end;

procedure TFhhod.StringGrid2Click(Sender: TObject);
begin
  if StringGrid2.row = StringGrid2.rowcount - 1 then
    StringGrid2.row := StringGrid2.row - 1;
  Label6.Caption    := StringGrid2.cells[0, StringGrid2.row];
end;

procedure TFhhod.StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
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
  ok := (abs(StrtoFloat(StringGrid2.cells[1, ARow]) -
    StrtoFloat(StringGrid2.cells[0, ARow])) < myFloat(Edit2.Text)) or
    (StringGrid2.cells[4, ARow] = '');
  if (ACol = 4) and (not ok) then
  begin
    // выбираем зеленный цвет и закрашиваем что нам нужно
    StringGrid2.Canvas.Brush.Color := clYellow;
    StringGrid2.Canvas.FillRect(Rect);
    StringGrid2.Canvas.TextOut(Rect.Left, Rect.Top,
      StringGrid2.cells[ACol, ARow]);
    StringGrid2.Canvas.Brush.Color := clWhite;
  end;
  if (ACol = 5) Then
  begin
    StringGrid2.Canvas.Brush.Color := clTeal;
    StringGrid2.Canvas.FillRect(Rect);
    StringGrid2.Canvas.TextOut(Rect.Left, Rect.Top,
      StringGrid2.cells[ACol, ARow]);
    StringGrid2.Canvas.Brush.Color := clWhite;
  end;
end;

procedure TFhhod.Timer1Timer(Sender: TObject);
var
  i: Integer;
  errcnt,goodcnt:integer;
begin

  curtime := curtime + 1;
  if curtime > maxtime then
  begin
    Timer1.Enabled := false;
    Timer2.Enabled := false;
    /// //////////////////////////////////////////////////////////////////////////
    for i := 1 to acount do
    begin
      QinsAll.ParamByName('NOMER').Asstring := Nomer;
      QinsAll.ParamByName('UISP').AsFloat   := StrtoFloat(Label6.Caption);
      QinsAll.ParamByName('U12').AsFloat    := a[i].u1;
      QinsAll.ParamByName('U23').AsFloat    := a[i].u2;
      QinsAll.ParamByName('U31').AsFloat    := a[i].u3;
      QinsAll.ParamByName('I1').AsFloat     := a[i].i1;
      QinsAll.ParamByName('I2').AsFloat     := a[i].i2;
      QinsAll.ParamByName('I3').AsFloat     := a[i].i3;
      QinsAll.ParamByName('P1').AsFloat     := a[i].p1;
      QinsAll.ParamByName('P2').AsFloat     := a[i].p2;
      QinsAll.ParamByName('P3').AsFloat     := a[i].p3;
      QinsAll.ParamByName('Ps').AsFloat     := a[i].ps;
      QinsAll.ParamByName('DUMAX').AsFloat  := 0;
      QinsAll.ParamByName('FU').AsFloat     := a[i].u;
      QinsAll.ParamByName('FI').AsFloat     := a[i].i;
      QinsAll.ParamByName('FP').AsFloat     := a[i].ps;
      QinsAll.ExecSQL;
    end;
    // по просьбе удалим записи где мы выходим за пределы диапазона
    // там dumax> edit2.text
    //If CheckBox2.Checked then
    //begin
      QTemp.Close;
      QTemp.SQL.Clear;
      QTemp.SQL.add('select count(*) r from zhhall where nomer=' + Quotedstr(Nomer) +
        ' and uisp=' + Label6.Caption + ' and dumax>' + Edit2.Text);
      QTemp.Open;
      errcnt:=QTemp.FieldByName('r').Asinteger;
      //QTemp.SQL.add('delete from zhhall where nomer=' + Quotedstr(Nomer) +
      //  ' and uisp=' + Label6.Caption + ' and dumax>' + Edit2.Text);
      //QTemp.ExecSQL;
    //end;
      QTemp.Close;
      QTemp.SQL.Clear;
      QTemp.SQL.add('select count(*) r from zhhall where nomer=' + Quotedstr(Nomer) +
        ' and uisp=' + Label6.Caption + ' and dumax<=' + Edit2.Text);
      QTemp.Open;
      goodcnt:=QTemp.FieldByName('r').Asinteger;


    // тут считается среднее по показаниям только датчика
    // напряжения, подвохов не ожидается
    {
    select
NOMER, UISP,--round((sum(su12)+sum(su23)+sum(su31))/3,1) u,
round(afu,1) u,
round((sum(si1)+sum(si2)+sum(si3))/3,3) i,
round(sum(sp),2) ps,
round(sum(mumax),4) umax
from
(
SELECT
NOMER, UISP,--avg(U12) su12, avg(U23) su23, avg(U31) su31,
avg(fu) afu,
avg(I1) si1,avg(I2) si2, avg(I3) si3,
avg(ps) sp,0 mumax
FROM ZAMER.ZHHALL
where nomer=:nomer and uisp=:uisp and dumax<=:delta
group by nomer, uisp
union all
SELECT nomer,  UISP,--0 su12, 0 su23, 0 su31,
0 afu,
0 si1, 0 si2, 0 si3,
0 sp, max(dumax) mumax
FROM ZAMER.ZHHALL
where nomer=:nomer and uisp=:uisp and dumax<=:delta
group by nomer, uisp
)
group by nomer, uisp

    }
    Qselectsred.Close;
    Qselectsred.ParamByName('nomer').Asstring := Nomer;
    Qselectsred.ParamByName('uisp').AsFloat   := StrtoFloat(Label6.Caption);
    Qselectsred.ParamByName('delta').AsFloat   := myFloat(Edit2.Text);
    Qselectsred.Open;
    {
      QInsSvod.Close;

      QTemp.Close;
      QTemp.SQL.Clear;
      QTemp.SQL.add('delete from zhhsvod where nomer=' + Quotedstr(Nomer) +
      ' and uisp=' + Label6.Caption);
      QTemp.ExecSQL;
      QInsSvod.ParamByName('nomer').Asstring :=
      Qselectsred.FieldByName('nomer').Asstring;
      QInsSvod.ParamByName('uisp').AsFloat :=
      Qselectsred.FieldByName('uisp').AsFloat;
      QInsSvod.ParamByName('usred').AsFloat :=
      Qselectsred.FieldByName('u').AsFloat;
      QInsSvod.ParamByName('isred').AsFloat :=
      Qselectsred.FieldByName('i').AsFloat;
      QInsSvod.ParamByName('psred').AsFloat :=
      Qselectsred.FieldByName('ps').AsFloat;
      QInsSvod.ParamByName('dumax').AsFloat :=
      Qselectsred.FieldByName('umax').AsFloat;
      QInsSvod.ParamByName('tip').Asinteger := tipispyt;
      ;

      QInsSvod.ExecSQL;
    }
    StringGrid2.cells[1, StringGrid2.row] :=
      Qselectsred.FieldByName('u').Asstring;
    StringGrid2.cells[2, StringGrid2.row] :=
      Qselectsred.FieldByName('i').Asstring;
    StringGrid2.cells[3, StringGrid2.row] :=
      Qselectsred.FieldByName('ps').Asstring;
    StringGrid2.cells[4, StringGrid2.row] :=
      Qselectsred.FieldByName('umax').Asstring;

    StringGrid2.cells[6, StringGrid2.row] :=
      //inttostr(goodcnt)+'/'+ inttostr(errcnt);
      Floattostr(simpleroundto(errcnt/(goodcnt+errcnt)*100,0))+'% ('+Inttostr(goodcnt+errcnt)+')';
    /// //////////////////////////////////////////////////////////////////////////

    ProgressBar1.Position := 0;
    if StringGrid2.row < StringGrid2.rowcount - 1 then
      StringGrid2.row := StringGrid2.row + 1;
    if StringGrid2.cells[0, StringGrid2.row] = '' then
    begin
      BitBtn2.Enabled := True;
      BitBtn3.Enabled := True;
      StringGrid2.row := StringGrid2.row - 1;
      ShowMessage('Испытание завершено!!')
    end
    else
    begin
      BitBtn3.Enabled := True;
      // ShowMessage('Шаг завершен c перекосом фаз по току в '+Floattostr(round(perei))+'% от среднего значения');
      Label12.Caption := floattostr(round(pereI));
      Label6.Caption  := StringGrid2.cells[0, StringGrid2.row];
    end;
  end
  else
    ProgressBar1.Stepit;
  //autogrid( StringGrid2);
end;

procedure TFhhod.Timer2Timer(Sender: TObject);
var
  i, i1, i2, i3: single;
begin
  acount       := acount + 1;
  a[acount].u1 := SimpleRoundTo(Fmain.RU1.Value, -1);
  a[acount].u2 := SimpleRoundTo(Fmain.RU2.Value, -1);
  a[acount].u3 := SimpleRoundTo(Fmain.RU3.Value, -1);
  a[acount].i1 := SimpleRoundTo(Fmain.RI1.Value, -3);
  a[acount].i2 := SimpleRoundTo(Fmain.RI2.Value, -3);
  a[acount].i3 := SimpleRoundTo(Fmain.RI3.Value, -3);
  a[acount].p1 := SimpleRoundTo(Fmain.RP1.Value, -2);
  a[acount].p2 := SimpleRoundTo(Fmain.RP2.Value, -2);
  a[acount].p3 := SimpleRoundTo(Fmain.RP3.Value, -2);
  a[acount].ps := SimpleRoundTo(Fmain.PSredQ.Value, -2);
  a[acount].u := SimpleRoundTo(Fmain.UMom.Value, -1);
  a[acount].i := SimpleRoundTo(Fmain.IMom.Value, -3);
  a[acount].p := SimpleRoundTo(Fmain.PSredQ.Value, -2);
  // перекос фаз
  i  := (a[acount].i1 + a[acount].i2 + a[acount].i3) / 3;
  i1 := abs(100 - (a[acount].i1 / i) * 100);
  i2 := abs(100 - (a[acount].i2 / i) * 100);
  i3 := abs(100 - (a[acount].i3 / i) * 100);
  i  := Max(Max(i1, i2), i3);
  if i > pereI then
    pereI := i;
end;

procedure TFhhod.TimerUpdTimer(Sender: TObject);
begin
  Label8.Caption := Fmain.KRVarLabel1.Caption;
  if abs(StrtoFloat(Label8.Caption) - StrtoFloat(Label6.Caption)) <
    myFloat(Edit2.Text) then
  begin
    Label6.font.Color := clGreen
  end
  else
  begin
    Label6.font.Color := clRed;
    if CheckBox1.Checked then
      beep;
  end;
end;

end.
