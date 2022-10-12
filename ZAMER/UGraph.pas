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
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGraph: TFGraph;

 i:integer;
implementation

{$R *.dfm}

procedure TFGraph.Button1Click(Sender: TObject);
begin
i:=0;
Image1.Canvas.Moveto(0,Image1.Canvas.ClipRect.Bottom);
Timer1.Enabled:=true;
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
