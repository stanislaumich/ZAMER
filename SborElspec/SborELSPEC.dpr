program SborELSPEC;

uses
  Vcl.Forms,
  UMainSbor in 'UMainSbor.pas' {Form1} ,
  Uadd in '..\ZAMER\Uadd.pas',
  Ustr in '..\ZAMER\Ustr.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;

end.
