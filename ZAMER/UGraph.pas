unit UGraph;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls;

type
  TFGraph = class(TForm)
    Button1: TButton;
    Button2: TButton;
    QTemp: TFDQuery;
    Timer1: TTimer;
    Edit1: TEdit;
    Edit2: TEdit;
    Panel1: TPanel;
    Image1: TImage;
    Button3: TButton;
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGraph: TFGraph;

 i:integer;
implementation
 uses umain;
{$R *.dfm}

procedure TFGraph.Button1Click(Sender: TObject);
begin
i:=0;
Image1.Canvas.Moveto(0,Image1.Canvas.ClipRect.Bottom);
Timer1.Enabled:=true;
end;

procedure TFGraph.Button3Click(Sender: TObject);
var
 x0,y0,cx,cy,i:integer;
begin

 x0:=10;
 y0:=700;
 cx:=1;
 cy:=10;
 i:=0;

 QTemp.Close;
 //QTemp.SQL.Clear;
 QTemp.Open('select * from zamertmp order by ID');
 canvas.brush.Color:=clred;
 Canvas.MoveTo(x0,y0);
 While not QTemp.Eof do
  begin
   canvas.brush.Color:=clred;
   canvas.lineto(x0+round(i/cx),y0-round(Qtemp.fieldbyname('torq').asfloat/cy));

   QTemp.Next;
   i:=i+1;
  end;
  i:=1;
  canvas.brush.Color:=clGreen;
 Canvas.MoveTo(x0,y0);
 QTemp.First;
 While not QTemp.Eof do
  begin
   canvas.brush.Color:=clred;
   canvas.lineto(x0+round(i/cx),y0-round(Qtemp.fieldbyname('rot').asfloat/cy));

   QTemp.Next;
   i:=i+1;
  end;
 ShowMessage('done');
end;

procedure TFGraph.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 Edit1.text:=inttostr(x);
 Edit2.TExt:=inttostr(Image1.Canvas.ClipRect.Bottom-y);
end;

procedure TFGraph.Timer1Timer(Sender: TObject);

begin
i:=i+1;
if i=500  then Timer1.Enabled:=false;

Image1.Canvas.LineTo(i, Image1.Canvas.ClipRect.Bottom-i);
end;

end.
