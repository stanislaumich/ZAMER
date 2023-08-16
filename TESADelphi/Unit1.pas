unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,  Vcl.StdCtrls, CPort;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    ComPort1: TComPort;
    procedure ComPort1RxBuf(Sender: TObject; const Buffer; Count: Integer);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
 a:array[0..3] of byte;
begin
a[0]:=255;
a[1]:=2;
a[2]:=65;
a[3]:=3;
 ComPort1.Write(a,4);
end;

procedure TForm1.ComPort1RxBuf(Sender: TObject; const Buffer; Count: Integer);
begin
 Memo1.Lines.Add('get');
end;

end.
