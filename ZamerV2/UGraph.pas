unit UGraph;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  System.Actions, Vcl.ActnList, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, VclTee.Series,
  VclTee.TeEngine, Vcl.ExtCtrls, VclTee.TeeProcs, VclTee.Chart, math;

type
  TFgraph = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Chart1: TChart;
    Series1: TFastLineSeries;
    Series2: TFastLineSeries;
    Series3: TPointSeries;
    Button4: TButton;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Edit2: TEdit;
    QTemp: TFDQuery;
    ActionList1: TActionList;
    Action1: TAction;
    Label9: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Chart1ClickSeries(Sender: TCustomChart; Series: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure BitBtn1Click(Sender: TObject);
    procedure Chart1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fgraph: TFgraph;
  i, cnt: Integer;
  tsred: Integer;
  mas: Integer;
  ar: array [0 .. 1000] of double;

implementation

uses umh;
{$R *.dfm}

procedure TFgraph.BitBtn1Click(Sender: TObject);
var
  i, maxi, ri, N, b, e, c: Integer;
  tf: double;
  gf, pf: double;
  ar: array [1 .. 1000] of double;
begin
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.add('select * from zelspec order by ts');
  gf := Strtofloat(Label9.caption);
  QTemp.Open;
  i := 0;
  pf := 1000000;
  while not(QTemp.eof) do
  begin
    i := i + 1;
    ar[i] := QTemp.FieldByName('u').asFloat;
    if pf > abs(QTemp.FieldByName('ts').asFloat - gf) then
    begin
      ri := i;
      pf := abs(QTemp.FieldByName('ts').asFloat - gf);
    end;
    QTemp.Next;
  end;
  maxi := i;
  N := 3;
  b := ri - N;
  if b < 1 then
    b := 1;
  e := ri + N;
  If e > maxi then
    e := maxi;
  pf := 0;
  c := 0;
  for i := b to e do
  begin
    pf := pf + ar[i];
    c := c + 1;
  end;
  pf := pf / c;

  FMH.Stringgrid8.Cells[1, FMH.Stringgrid8.row] :=
    floattostr(simpleroundto(pf, -2));

  FMH.Stringgrid8.Cells[2, FMH.Stringgrid8.row] := Label4.caption;
  FMH.Stringgrid8.Cells[3, FMH.Stringgrid8.row] := Label5.caption;
  Fgraph.Close;
end;

procedure TFgraph.Button4Click(Sender: TObject);
var
  x0, y0, cx, cy, i, step: Integer;
  tmin, tmax, imin: Integer;
begin
  x0 := 10;
  y0 := 700;
  cx := 1;
  cy := 10;
  i := 0;
  step := 1;
  cnt := 0;
  Series1.LinePen.Width := Strtoint(Edit1.text);
  Series2.LinePen.Width := Strtoint(Edit1.text);
  Series1.Clear;
  Series2.Clear;
  Series3.Clear;
  Label2.caption := '0';
  Label4.caption := '0';
  Label5.caption := '0';
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.add('delete from zamertmp where rot=0 and torq=0 and power=0');
  QTemp.EXECSQL;

  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.Open
    ('select to_number(torq) torq, to_number(rot) rot, ts from zamertmp order by ID');
  // QTemp.Open('select m torq, n rot from zumsvod order by ID');
  tmax := round(QTemp.FieldByName('torq').asFloat);
  tmin := round(QTemp.FieldByName('torq').asFloat);
  Label9.caption := floattostr(tmin);
  imin := 0;
  While not QTemp.eof do
  begin
    Series1.AddXY(i, QTemp.FieldByName('torq').asFloat, '', clGreen);
    Series2.AddXY(i, QTemp.FieldByName('rot').asFloat / mas, '', clred);
    ar[i] := QTemp.FieldByName('ts').asFloat;
    if tmax < QTemp.FieldByName('torq').asFloat then
      tmax := round(QTemp.FieldByName('torq').asFloat);
    if tmin > QTemp.FieldByName('torq').asFloat then
    begin
      tmin := round(QTemp.FieldByName('torq').asFloat);
      imin := i;
      Label9.caption := floattostr(ar[i]);
    end;
    QTemp.Next;
    i := i + step;
    cnt := cnt + 1;
  end;
  tsred := ((tmax + tmin) div 2);

  for i := 0 to cnt - 1 do
    if i = imin then
    begin
      Series3.AddXY(i, tsred, '', clGreen);
      Label2.caption := floattostr(i);
      Label4.caption :=
        floattostr(simpleroundto(Chart1.Series[0].YValue[i], -2));
      Label5.caption :=
        floattostr(simpleroundto(Chart1.Series[1].YValue[i] * mas, -2));
      Label9.caption := floattostr(ar[i]);
    end
    else
      Series3.AddXY(i, tsred, '', clred);
end;

procedure TFgraph.Chart1ClickSeries(Sender: TCustomChart; Series: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Label2.caption := floattostr(Series.XValue[ValueIndex]);
  Label4.caption :=
    floattostr(simpleroundto(Chart1.Series[0].YValue[ValueIndex], -2));
  Label5.caption := floattostr(simpleroundto(Chart1.Series[1].YValue[ValueIndex]
    * mas, -2));
  Label9.caption := floattostr(ar[ValueIndex]);
end;

procedure TFgraph.Chart1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  SeriesIndex: Integer;
begin
  SeriesIndex := Series1.Clicked(X, Y);
  Chart1.ShowHint := SeriesIndex <> -1;
  if Chart1.ShowHint then
    Chart1.Hint := 'Y=' + FormatFloat('#.00', Series1.YValue[SeriesIndex]) +
      ' Legend: ' + Series1.ValueMarkText[SeriesIndex];
end;

procedure TFgraph.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.add('delete from ini where name=' + Quotedstr('graph'));
  QTemp.EXECSQL;
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.add('insert into ini(name, value) values(' + Quotedstr('graph') +
    ',' + Edit1.text + ')');
  QTemp.EXECSQL;
end;

procedure TFgraph.FormCreate(Sender: TObject);
begin
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.add('select * from ini where name=' + Quotedstr('graph'));
  QTemp.Open;
  if QTemp.FieldByName('value').Asstring = '' then
    Edit1.text := '5'
  else
    Edit1.text := QTemp.FieldByName('value').Asstring;
  mas := Strtoint(Edit2.text);
end;

procedure TFgraph.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  mas := Strtoint(Edit2.text);
  Button4.Click();
end;

end.
