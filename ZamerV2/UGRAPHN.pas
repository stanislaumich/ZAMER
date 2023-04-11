unit UGRAPHN;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFGraphn = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Edit1: TEdit;
    Edit2: TEdit;
    QTemp: TFDQuery;
    procedure Button1Click(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGraphn: TFGraphn;

implementation

{$R *.dfm}
uses uzv2main;


procedure TFGraphn.Button1Click(Sender: TObject);
var
 Massiv: Array [0..5] of Integer;
 X,Y, X0, Y0, kx, ky: Integer;
 count, step, i:integer;
begin
 QTemp.Close;
 QTemp.SQL.Clear;
 QTemp.SQL.Add('select * from zamertmp');
 QTemp.Open;
 count:=QTemp.RecordCount;
 kx:=strtoint(edit1.text);
 ky:=strtoint(edit2.text);
 step:=Image1.Width div count;
 X0:=0;
 Y0:= Image1.Height;
 Image1.Canvas.MoveTo(X0, Y0);
 For i:= 0 To count-1 Do
  begin
   Y:= round(QTemp.fieldByName('torq').Asfloat);
   Image1.Canvas.LineTo((X0+i*step) div kx,(Y0-Y) div ky);
   QTemp.Next;
  end;
end;

procedure TFGraphn.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 //Edit1.Text:=inttostr(x);
 //Edit2.Text:=inttostr(y);

end;

end.
