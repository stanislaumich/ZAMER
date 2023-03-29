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
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Chart1ClickSeries(Sender: TCustomChart; Series: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure BitBtn1Click(Sender: TObject);
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

implementation

uses umh;
{$R *.dfm}

procedure TFgraph.BitBtn1Click(Sender: TObject);
begin
  FMH.Stringgrid8.Cells[2, FMH.Stringgrid8.row] := Label4.Caption;
  FMH.Stringgrid8.Cells[3, FMH.Stringgrid8.row] := Label5.Caption;
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
  Label2.Caption := '0';
  Label4.Caption := '0';
  Label5.Caption := '0';
  QTemp.Close;
  // QTemp.Open
  // ('select to_number(torq) torq, to_number(rot) rot from zamertmp order by ID');
  QTemp.Open('select m torq, n rot from zumsvod order by ID');
  tmax := round(QTemp.fieldbyname('torq').asfloat);
  tmin := round(QTemp.fieldbyname('torq').asfloat);
  While not QTemp.Eof do
  begin
    Series1.AddXY(i, QTemp.fieldbyname('torq').asfloat, '', clGreen);
    Series2.AddXY(i, QTemp.fieldbyname('rot').asfloat / mas, '', clred);
    if tmax < QTemp.fieldbyname('torq').asfloat then
      tmax := round(QTemp.fieldbyname('torq').asfloat);
    if tmin > QTemp.fieldbyname('torq').asfloat then
    begin
      tmin := round(QTemp.fieldbyname('torq').asfloat);
      imin := i;
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
      Label2.Caption := Floattostr(i);
      Label4.Caption := Floattostr(simpleroundto(Chart1.Series[0].YValue[i],-2));
      Label5.Caption :=
        Floattostr(Simpleroundto(Chart1.Series[1].YValue[i] * mas, -2))
    end
    else
      Series3.AddXY(i, tsred, '', clred);
end;

procedure TFgraph.Chart1ClickSeries(Sender: TCustomChart; Series: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Label2.Caption := Floattostr(Series.XValue[ValueIndex]);
  Label4.Caption := Floattostr(Simpleroundto(Chart1.Series[0].YValue[ValueIndex],-2));
  Label5.Caption :=
    Floattostr(Simpleroundto(Chart1.Series[1].YValue[ValueIndex] * mas, -2))
end;

procedure TFgraph.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QTemp.Close;
  QTemp.sql.Clear;
  QTemp.sql.Add('delete from ini where name=' + Quotedstr('graph'));
  QTemp.ExecSQL;
  QTemp.Close;
  QTemp.sql.Clear;
  QTemp.sql.Add('insert into ini(name, value) values(' + Quotedstr('graph') +
    ',' + Edit1.text + ')');
  QTemp.ExecSQL;
end;

procedure TFgraph.FormCreate(Sender: TObject);
begin
  QTemp.Close;
  QTemp.sql.Clear;
  QTemp.sql.Add('select * from ini where name=' + Quotedstr('graph'));
  QTemp.Open;
  if QTemp.fieldbyname('value').Asstring = '' then
    Edit1.text := '5'
  else
    Edit1.text := QTemp.fieldbyname('value').Asstring;
  mas := Strtoint(Edit2.text);
end;

procedure TFgraph.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  mas := Strtoint(Edit2.text);
  Button4.Click();
end;

end.
