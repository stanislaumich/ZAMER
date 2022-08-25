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
    procedure Timer1Timer(Sender: TObject);
    //procedure Timer2Timer(Sender: TObject);
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
    //procedure Timer1Timer(Sender: TObject);
//    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
 R = record
    u1, u2, u3, i1, i2, i3, p1, p2, p3, rot,torq,power: real;
  end;

var
  FRH: TFRH;
  currentvolt: single;
  currentpower: single;
  maxtime    : Integer;
  curtime    : Integer;

  a       : array [1 .. 1000] of R;
  acount  : Integer;
  tipispyt: Integer;


implementation
uses umain;

{$R *.dfm}


function max(a:integer;b:integer):integer;
 begin
   if a>b then result:= a
   else result:= b;
 end;



procedure TFRH.BitBtn1Click(Sender: TObject);
begin
 {
    SELECT
    NOMER, UISP,PISP,
    avg(U12) su12, avg(U23) su23, avg(U31) su31,
    avg(I1) si1,avg(I2) si2, avg(I3) si3,
    avg(P1) sp1,avg(P2) sp2, avg(P3) sp3,
    0 mumax, 0 mpmax,avg(torq) t, avg(power) p, avg(rot) r
    FROM ZAMER.ZRHALL
    group by nomer, uisp, PISP
    union all
    SELECT
    nomer,  UISP,PISP,
    0 su12, 0 su23, 0 su31,
    0 si1, 0 si2, 0 si3,
    0 sp1, 0 sp2, 0 sp3,
    max(dumax) mumax, max(dpmax) mpmax, 0 t, 0 p, 0 r
    FROM ZAMER.ZRHALL
    group by nomer, uisp, PISP
  }
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.add('delete from zrhall where nomer=' + Quotedstr(Nomer) +
    ' and uisp=' + Label6.Caption+' and pisp='+Label8.Caption);
  QTemp.ExecSQL;
  acount            := 0;
  curtime           := 0;
  maxtime           := Strtoint(Edit1.Text);
  ProgressBar1.min  := 0;
  ProgressBar1.Max  := Strtoint(Edit1.Text);
  ProgressBar1.Step := 1;
  Timer2.Enabled    := True;
  Timer1.Enabled    := True;
end;

procedure TFRH.BitBtn2Click(Sender: TObject);
begin
  Fmain.Label30.font.Color := clGreen;
  Fmain.Label30.Caption    := 'ПРОЙДЕН';
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
  QTemp.SQL.add('delete from zrhall where nomer=' + Quotedstr(Nomer));
  QTemp.ExecSQL;
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.add('delete from zrhsvod where nomer=' + Quotedstr(Nomer));
  QTemp.ExecSQL;
end;

procedure TFRH.FormActivate(Sender: TObject);
var
  i: Integer;
begin
  Label3.Caption            := Fmain.Edit6.Text;
  Label10.Caption            := Fmain.Edit7.Text;
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
  StringGrid2.cells[6, 0]   := 'U макс';
  StringGrid2.cells[7, 0]   := 'P макс';
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
end;

procedure TFRH.RadioButton1Click(Sender: TObject);
var
  i  : Integer;
  cod: Integer;

begin
  if StringGrid1.cells[1, 1] = '' then
  begin
    ShowMessage('Нет данных для испытания');
    exit;
  end;

  val(Label10.Caption, currentpower, cod);
  if cod = 0 then
  begin
    StringGrid2.rowcount := 2;
    for i                := 1 to StringGrid1.rowcount - 1 do
      if StringGrid1.cells[1, i] <> '' then
      begin
        StringGrid2.rowcount    := StringGrid2.rowcount + 1;
        StringGrid2.cells[0, i] :=
          floattostr(round(currentpower / 100 *
          Strtoint(StringGrid1.cells[1, i])));
      end;
    StringGrid2.cells[0, StringGrid2.rowcount - 1] := '';
    StringGrid2.row                                := 1;
    tipispyt                                       := 1;
    Label6.Caption:=Label3.Caption;
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
  i  : Integer;
  cod: Integer;

begin
  if StringGrid1.cells[1, 1] = '' then
  begin
    ShowMessage('Нет данных для испытания');
    exit;
  end;

  val(Label10.Caption, currentpower, cod);
  if cod = 0 then
  begin
    StringGrid2.rowcount := 2;
    for i                := 1 to StringGrid1.rowcount - 1 do
      if StringGrid1.cells[2, i] <> '' then
      begin
        StringGrid2.rowcount    := StringGrid2.rowcount + 1;
        StringGrid2.cells[0, i] :=
          floattostr(round(currentpower / 100 *
          Strtoint(StringGrid1.cells[2, i])));
      end;
    StringGrid2.cells[0, StringGrid2.rowcount - 1] := '';
    StringGrid2.row                                := 1;
    tipispyt                                       := 1;
    Label6.Caption:=Label3.Caption;
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
  i  : Integer;
  cod: Integer;

begin
  if StringGrid1.cells[1, 1] = '' then
  begin
    ShowMessage('Нет данных для испытания');
    exit;
  end;

  val(Label10.Caption, currentpower, cod);
  if cod = 0 then
  begin
    StringGrid2.rowcount := 2;
    for i                := 1 to StringGrid1.rowcount - 1 do
      if StringGrid1.cells[3, i] <> '' then
      begin
        StringGrid2.rowcount    := StringGrid2.rowcount + 1;
        StringGrid2.cells[0, i] :=
          floattostr(round(currentpower / 100 *
          Strtoint(StringGrid1.cells[3, i])));
      end;
    StringGrid2.cells[0, StringGrid2.rowcount - 1] := '';
    StringGrid2.row                                := 1;
    tipispyt                                       := 1;
    Label6.Caption:=Label3.Caption;
    Label8.Caption                                 := StringGrid2.cells[0, 1];
    BitBtn1.Enabled                                := True;
    BitBtn2.Enabled                                := True;
    BitBtn3.Enabled                                := True;
  end
  else
    ShowMessage
      ('Не удалось получить испытательное напряжение двигателя из установок текущего испытания');
end;

procedure TFRH.Timer1Timer(Sender: TObject);
var
  i: Integer;
begin
  curtime := curtime + 1;
  if curtime > maxtime then
  begin
    Timer1.Enabled := false;
    Timer2.Enabled := false;
    /// //////////////////////////////////////////////////////////////////////////
    for i := 1 to acount do
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
      QinsAll.ParamByName('rot').AsFloat  := 0;
      QinsAll.ParamByName('torq').AsFloat  := 0;
      QinsAll.ParamByName('power').AsFloat  := 0;
      QinsAll.ExecSQL;
    end;
    Qselectsred.Close;
    Qselectsred.ParamByName('nomer').AsString := Nomer;
    Qselectsred.ParamByName('uisp').AsFloat   := Strtofloat(Label6.Caption);
    Qselectsred.Open;
    QInsSvod.Close;
    { NOMER, UISP, USRED,
      ISRED, PSRED, TIP,
      DUMAX }
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.add('delete from zhhsvod where nomer=' + Quotedstr(Nomer) +
      ' and uisp=' + Label6.Caption);
    QTemp.ExecSQL;
    QInsSvod.ParamByName('nomer').AsString :=
      Qselectsred.Fieldbyname('nomer').AsString;
    QInsSvod.ParamByName('uisp').AsFloat :=
      Qselectsred.Fieldbyname('uisp').AsFloat;
    QInsSvod.ParamByName('usred').AsFloat :=
      Qselectsred.Fieldbyname('u').AsFloat;
    QInsSvod.ParamByName('isred').AsFloat :=
      Qselectsred.Fieldbyname('i').AsFloat;
    QInsSvod.ParamByName('psred').AsFloat :=
      Qselectsred.Fieldbyname('p').AsFloat;
    QInsSvod.ParamByName('dumax').AsFloat :=
      Qselectsred.Fieldbyname('umax').AsFloat;
    QInsSvod.ParamByName('tip').Asinteger := tipispyt;;
    QInsSvod.ExecSQL;
    StringGrid2.cells[1, StringGrid2.row] :=
      Qselectsred.Fieldbyname('u').AsString;
    StringGrid2.cells[2, StringGrid2.row] :=
      Qselectsred.Fieldbyname('i').AsString;
    StringGrid2.cells[3, StringGrid2.row] :=
      Qselectsred.Fieldbyname('p').AsString;
    StringGrid2.cells[4, StringGrid2.row] :=
      Qselectsred.Fieldbyname('umax').AsString;
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
      Label6.Caption := StringGrid2.cells[0, StringGrid2.row];
    end;
  end
  else
    ProgressBar1.Stepit;
end;

procedure TFRH.Timer2Timer(Sender: TObject);
var
  i: single;
begin
  acount       := acount + 1;
  a[acount].u1 := SimpleRoundTo(Fmain.RU1.Value, -4);
  a[acount].u2 := SimpleRoundTo(Fmain.RU2.Value, -4);
  a[acount].u3 := SimpleRoundTo(Fmain.RU3.Value, -4);
  a[acount].i1 := SimpleRoundTo(Fmain.RI1.Value, -4);
  a[acount].i2 := SimpleRoundTo(Fmain.RI2.Value, -4);
  a[acount].i3 := SimpleRoundTo(Fmain.RI3.Value, -4);
  a[acount].p1 := SimpleRoundTo(Fmain.RP1.Value, -4);
  a[acount].p2 := SimpleRoundTo(Fmain.RP2.Value, -4);
  a[acount].p3 := SimpleRoundTo(Fmain.RP3.Value, -4);
  {
  a[acount].rot := SimpleRoundTo(Fmain.RP3.Value, -4);
  a[acount].torq := SimpleRoundTo(Fmain.RP3.Value, -4);
  a[acount].power := SimpleRoundTo(Fmain.RP3.Value, -4);
  }
end;

end.
