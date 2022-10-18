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
    Label5: TLabel;
    Label6: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Chart1ClickSeries(Sender: TCustomChart; Series: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGraph: TFGraph;

  i: Integer;

implementation

uses umain,umehan;
{$R *.dfm}

procedure TFGraph.BitBtn1Click(Sender: TObject);
begin
 //QTemp.Close;
 //QTemp.SQL.Clear;
 //QTemp.Open('select * from zamertmp where id='+Label2.Caption);
 //fmehan.Stringgrid8.Cells[1,fmehan.Stringgrid8.row]:='380';
 fmehan.Stringgrid8.Cells[2,fmehan.Stringgrid8.row]:=LAbel4.Caption;//QTemp.FieldByName('torq').Asstring;
 fmehan.Stringgrid8.Cells[3,fmehan.Stringgrid8.row]:=LAbel5.Caption;//QTemp.FieldByName('rot').Asstring;
 FGraph.Close;
end;

procedure TFGraph.Button1Click(Sender: TObject);
begin
  i := 0;
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
  LAbel2.Caption:='0';
  LAbel4.Caption:='0';
  LAbel5.Caption:='0';
  QTemp.Close;
  QTemp.Open('select * from zamertmp order by ID');
  step := QTemp.RecordCount div 30;
  While not QTemp.Eof do
  begin
    Series1.AddXY(i, QTemp.fieldbyname('torq').asfloat, '', clGreen);
    Series2.AddXY(i, QTemp.fieldbyname('rot').asfloat, '', clred);
    QTemp.Next;
    i := i + step;
  end;
end;

procedure TFGraph.Chart1ClickSeries(Sender: TCustomChart; Series: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Label2.Caption := Floattostr(Series.XValue[ValueIndex]);
  Label4.Caption:= floattostr(Chart1.Series[0].YValue[ValueIndex]);
  Label5.Caption:= floattostr(Chart1.Series[1].YValue[ValueIndex])
end;

end.
