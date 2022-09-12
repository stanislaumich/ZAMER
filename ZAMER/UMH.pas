unit UMH;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Grids, Vcl.ExtCtrls, math;

type
  TFMH = class(TForm)
    QCommand: TFDQuery;
    GroupBox11: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label25: TLabel;
    Edit14: TEdit;
    Label1: TLabel;
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
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Timer1: TTimer;
    Timer2: TTimer;
    QTemp: TFDQuery;
    Label8: TLabel;
    Label9: TLabel;
    QInsall: TFDQuery;

    procedure CommandStart(c: Integer; n: string; fn: string);
    procedure Timer2Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button32Click(Sender: TObject);

  private
    { Private declarations }
    //rw:integer;
  public
    { Public declarations }
  end;

  R = record
    u1, u2, u3, n, m, usred: single;
  end;

var
  FMH: TFMH;


implementation

{$R *.dfm}

uses umain;
var
  amax, amin           : array [1 .. 5, 1 .. 1000] of R;
  cmax, cmin           : array [1 .. 5] of Integer;
  count: Integer;
  num: Integer;
  tip: Integer;
  rw: Integer;



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

procedure TFMH.Button27Click(Sender: TObject);
begin
  {
  count    := 0; // current number
  Label5.Caption:='0';
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('truncate table zamertmp');
  QTemp.ExecSQL;
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('delete from zmehall where nomer=' + Quotedstr(nomer) +
    ' and tip=1 and numisp=' + inttostr(StringGrid7.row));
  QTemp.ExecSQL;
  QTemp.Close;
  }
  CommandStart(1, nomer, '0');

  Timer2.Enabled   := true;

  Button27.Enabled := false;
  Button32.Enabled := true;

end;

procedure TFMH.Button32Click(Sender: TObject);
var
  t, i: Integer;
  f   : single;
begin
  Timer2.Enabled := false;
  CommandStart(0, nomer, '0');
  // начинаем обсчеты
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
      SimpleRoundTo(amax[StringGrid7.row, i].usred, -4);
    QInsall.ParamByName('u12').AsFloat  := SimpleRoundTo(amax[StringGrid7.row, i].u1, -4);
    QInsall.ParamByName('u23').AsFloat  := SimpleRoundTo(amax[StringGrid7.row, i].u2, -4);
    QInsall.ParamByName('u31').AsFloat  := SimpleRoundTo(amax[StringGrid7.row, i].u3, -4);
    QInsall.ParamByName('torq').AsFloat :=
      SimpleRoundTo(QTemp.FieldByName('torq').AsFloat, -4);
    QInsall.ParamByName('rot').AsFloat :=
      SimpleRoundTo(QTemp.FieldByName('rot').AsFloat, -4);
    QInsall.ParamByName('tip').AsInteger    := 1;
    QInsall.ParamByName('numisp').AsInteger := StringGrid7.row;
    QInsall.ExecSQL;
    QTemp.Next;
  end;
  QTemp.Close;

  QTemp.SQL.Clear;
  QTemp.SQL.Add
    ('select * from zmehall where torq=(select max(torq) from zmehall where nomer='
    + Quotedstr(nomer) + ' and numisp=' + inttostr(StringGrid7.row) +
    ' and tip=1) and nomer=' + Quotedstr(nomer) + ' and numisp=' + inttostr(StringGrid7.row)
    + ' and tip=1');
  QTemp.Open;
  StringGrid7.Cells[1, StringGrid7.row] :=
    FloatToStr(SimpleRoundTo(QTemp.FieldByName('usred').AsFloat, -4));
  StringGrid7.Cells[2, StringGrid7.row] :=
    FloatToStr(SimpleRoundTo(QTemp.FieldByName('torq').AsFloat, -4));
  StringGrid7.Cells[3, StringGrid7.row] :=
    FloatToStr(SimpleRoundTo(QTemp.FieldByName('rot').AsFloat, -4));
  QTemp.Close;

  Button27.Enabled := true;
  Button32.Enabled := false;
end;

procedure TFMH.CommandStart(c: Integer; n: string; fn: string);
var
  s      : string;
  dectype: string;
begin
  QCommand.SQL.Clear;
  QCommand.SQL.Add
    ('insert into command (nomer, filename, command, dat, interval) values (');
  dectype := '10';
  QCommand.SQL.Add(Quotedstr(n) + ',' + Quotedstr(fn) + ',' + inttostr(c) + ','
    + dectype + ', ' + FMAin.Edit12.Text + ')');
  QCommand.ExecSQL;
  QCommand.Close;
end;

procedure TFMH.FormCreate(Sender: TObject);
begin
  StringGrid7.Cells[0, 0] := '';
  StringGrid7.Cells[1, 0] := 'Uсред, В';
  StringGrid7.Cells[2, 0] := 'M, Н/м';
  StringGrid7.Cells[3, 0] := 'N, об/мин';
  StringGrid7.Cells[0, 1] := 'Изм. 1';
  StringGrid7.Cells[0, 2] := 'Изм. 2';
  StringGrid7.Cells[0, 3] := 'Изм. 3';
  StringGrid7.Cells[0, 4] := 'Изм. 4';
  StringGrid7.Cells[0, 5] := 'Изм. 5';

  StringGrid8.Cells[0, 0] := '';
  StringGrid8.Cells[1, 0] := 'Uсред, В';
  StringGrid8.Cells[2, 0] := 'M, Н/м';
  StringGrid8.Cells[3, 0] := 'N, об/мин';
  StringGrid8.Cells[0, 1] := 'Изм. 1';
  StringGrid8.Cells[0, 2] := 'Изм. 2';
  StringGrid8.Cells[0, 3] := 'Изм. 3';
  StringGrid8.Cells[0, 4] := 'Изм. 4';
  StringGrid8.Cells[0, 5] := 'Изм. 5';

end;

procedure TFMH.Timer1Timer(Sender: TObject);
begin
  Label5.Caption := FMAin.KrVarLabel1.Caption;
end;

procedure TFMH.Timer2Timer(Sender: TObject);
begin
  if count >= 1000 then
  begin
  Timer2.Enabled := false;
    ShowMessage('достигнуто максимальное количество замеров, замер остановлен');
    //exit;
  end;
    amax[StringGrid7.row, count].u1    := SimpleRoundTo(FMAin.RU1.Value, -4);
    amax[StringGrid7.row, count].u2    := SimpleRoundTo(FMAin.RU2.Value, -4);
    amax[StringGrid7.row, count].u3    := SimpleRoundTo(FMAin.RU3.Value, -4);
    amax[StringGrid7.row, count].usred := 0;
    amin[StringGrid8.row, count].u1    := SimpleRoundTo(FMAin.RU1.Value, -4);
    amin[StringGrid8.row, count].u2    := SimpleRoundTo(FMAin.RU2.Value, -4);
    amin[StringGrid8.row, count].u3    := SimpleRoundTo(FMAin.RU3.Value, -4);
    amin[StringGrid8.row, count].usred := 0;
  count := count + 1;
  if count mod 10 = 0 then
    Label8.Caption := inttostr(count);
end;

end.
