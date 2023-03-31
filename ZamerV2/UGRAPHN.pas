unit UGRAPHN;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFGraphn = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Edit1: TEdit;
    Edit2: TEdit;
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

procedure TFGraphn.Button1Click(Sender: TObject);
var
 Massiv: Array [0..5] of Integer;
 X,Y: Integer;
begin
 Massiv[0]:= 1;
 Massiv[1]:= 50;
 Massiv[2]:= 100;
 Massiv[3]:= 200;
 Massiv[4]:= 220;
 Massiv[5]:= 250;
 For X:= 0 To 5 Do
  begin
   Y:= Massiv[X];
   Image1.Canvas.LineTo(X*50,Image1.Height-Y);
  end;
end;

procedure TFGraphn.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 Edit1.Text:=inttostr(x);
 Edit2.Text:=inttostr(y);

end;

end.
