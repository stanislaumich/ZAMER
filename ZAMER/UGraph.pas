unit UGraph;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls,
  VclTee.TeeGDIPlus, VclTee.TeEngine, VclTee.Series, VclTee.TeeProcs,
  VclTee.Chart, Vcl.Buttons;

type
  TFGraph = class(TForm)
    QTemp: TFDQuery;
    Chart1: TChart;
    Button4: TButton;
    Series1: TFastLineSeries;
    Series2: TFastLineSeries;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Chart1ClickSeries(Sender: TCustomChart; Series: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGraph: TFGraph;

  i: Integer;

implementation

uses umain;
{$R *.dfm}

procedure TFGraph.Button1Click(Sender: TObject);
begin
  i := 0;
  // Image1.Canvas.Moveto(0,Image1.Canvas.ClipRect.Bottom);
  // Timer1.Enabled:=true;
end;

procedure TFGraph.Button3Click(Sender: TObject);
var
  x0, y0, cx, cy, i: Integer;
begin

  x0 := 10;
  y0 := 700;
  cx := 1;
  cy := 10;
  i  := 0;

  QTemp.Close;
  // QTemp.SQL.Clear;
  QTemp.Open('select * from zamertmp order by ID');
  canvas.brush.Color := clred;
  canvas.MoveTo(x0, y0);
  While not QTemp.Eof do
  begin
    canvas.brush.Color := clred;
    canvas.lineto(x0 + round(i / cx),
      y0 - round(QTemp.fieldbyname('torq').asfloat / cy));

    QTemp.Next;
    i := i + 1;
  end;
  i                  := 1;
  canvas.brush.Color := clGreen;
  canvas.MoveTo(x0, y0);
  QTemp.First;
  While not QTemp.Eof do
  begin
    canvas.brush.Color := clred;
    canvas.lineto(x0 + round(i / cx),
      y0 - round(QTemp.fieldbyname('rot').asfloat / cy));

    QTemp.Next;
    i := i + 1;
  end;
  ShowMessage('done');
end;

procedure TFGraph.Button4Click(Sender: TObject);
var
  x0, y0, cx, cy, i, step: Integer;
begin
  x0 := 10;
  y0 := 700;
  cx := 1;
  cy := 10;
  i  := 0;
  // step:=30;
  Series1.Clear;
  Series2.Clear;
  QTemp.Close;
  QTemp.Open('select * from zamertmp order by ID');
  step := QTemp.RecordCount div 30;
  While not QTemp.Eof do
  begin
    Series1.AddXY(i, round(QTemp.fieldbyname('torq').asfloat), '', clGreen);
    Series2.AddXY(i, round(QTemp.fieldbyname('rot').asfloat), '', clred);
    QTemp.Next;
    i := i + step;
  end;

  // ShowMessage('done');

end;

procedure TFGraph.Chart1ClickSeries(Sender: TCustomChart; Series: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Label2.Caption := Floattostr(Series.XValue[ValueIndex]);
  Label4.Caption := Floattostr(Series.YValue[ValueIndex]);
end;

end.
