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
  VclTee.Chart, Vcl.Buttons, System.Actions, Vcl.ActnList;

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
    ActionList1: TActionList;
    Action1: TAction;
    Edit1: TEdit;
    Series3: TPointSeries;
    Label7: TLabel;
    Label8: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Chart1ClickSeries(Sender: TCustomChart; Series: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer);
    procedure BitBtn1Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGraph: TFGraph;

  i,cnt: Integer;
  tsred:integer;
implementation

uses umain, umehan;
{$R *.dfm}

procedure TFGraph.Action1Execute(Sender: TObject);
begin
  BitBtn1.Click;
end;

procedure TFGraph.BitBtn1Click(Sender: TObject);
begin
  // QTemp.Close;
  // QTemp.SQL.Clear;
  // QTemp.Open('select * from zamertmp where id='+Label2.Caption);
  // fmehan.Stringgrid8.Cells[1,fmehan.Stringgrid8.row]:='380';
  fmehan.Stringgrid8.Cells[2, fmehan.Stringgrid8.row] := Label4.Caption;
  // QTemp.FieldByName('torq').Asstring;
  fmehan.Stringgrid8.Cells[3, fmehan.Stringgrid8.row] := Label5.Caption;
  // QTemp.FieldByName('rot').Asstring;
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
  tmin,tmax, imin:integer;
begin
  x0 := 10;
  y0 := 700;
  cx := 1;
  cy := 10;
  i  := 0;
  step:=1;
  cnt:=0;
  Series1.LinePen.Width := Strtoint(Edit1.text);
  Series2.LinePen.Width := Strtoint(Edit1.text);
  Series1.Clear;
  Series2.Clear;
  Label2.Caption := '0';
  Label4.Caption := '0';
  Label5.Caption := '0';
  QTemp.Close;
  QTemp.Open('select * from zamertmp order by ID');
  tmax:= round(QTemp.fieldbyname('torq').asfloat );
  tmin:= round(QTemp.fieldbyname('torq').asfloat );
  While not QTemp.Eof do
  begin
    Series1.AddXY(i, QTemp.fieldbyname('torq').asfloat, '', clGreen);
    Series2.AddXY(i, QTemp.fieldbyname('rot').asfloat / 10, '', clred);
    if tmax< QTemp.fieldbyname('torq').asfloat then tmax:= round(QTemp.fieldbyname('torq').asfloat );
    if tmin> QTemp.fieldbyname('torq').asfloat then
    begin
     tmin:= round(QTemp.fieldbyname('torq').asfloat );
     imin:=i;
    end;
    QTemp.Next;
    i := i + step;
    cnt:=cnt+1;
  end;
  tsred:=((tmax+tmin) div 2);
  for i:=0 to cnt-1 do
  if  i=imin then
   begin
    Series3.AddXY(i, tsred, '', clgreen);
    Label2.Caption := Floattostr(i);
    Label4.Caption := Floattostr(Chart1.Series[0].YValue[i]);
    Label5.Caption := Floattostr(Chart1.Series[1].YValue[i])
   end
     else
   Series3.AddXY(i, tsred, '', clred);

end;

procedure TFGraph.Chart1ClickSeries(Sender: TCustomChart; Series: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Label2.Caption := Floattostr(Series.XValue[ValueIndex]);
  Label4.Caption := Floattostr(Chart1.Series[0].YValue[ValueIndex]);
  Label5.Caption := Floattostr(Chart1.Series[1].YValue[ValueIndex])
end;

procedure TFGraph.FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure TFGraph.FormCreate(Sender: TObject);
begin
  QTemp.Close;
  QTemp.sql.Clear;
  QTemp.sql.Add('select * from ini where name=' + Quotedstr('graph'));
  QTemp.Open;
  if QTemp.fieldbyname('value').Asstring = '' then
    Edit1.text := '5'
  else
    Edit1.text := QTemp.fieldbyname('value').Asstring;
end;

end.
