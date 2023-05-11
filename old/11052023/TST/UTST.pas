unit UTST;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm3 = class(TForm)
    Label1: TLabel;
  private
    { Private declarations }
  public
   procedure WMCopyData(var Msg: TWMCopyData); message WM_COPYDATA;
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}
procedure TForm3.WMCopyData(var Msg: TWMCopyData);
 var
   sText: array[0..99] of Char;
 begin
   // generate text from parameter
  // anzuzeigenden Text aus den Parametern generieren
  StrLCopy(sText, Msg.CopyDataStruct.lpData, Msg.CopyDataStruct.cbData);
   // write received text
  // Empfangenen Text ausgeben
  label1.Caption := sText;
 end;
end.
