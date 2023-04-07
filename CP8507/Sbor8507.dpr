program Sbor8507;

uses
  Vcl.Forms,
  UMainSbor in 'UMainSbor.pas' {Form1} ,
  Ustr in '..\ZAMER\Ustr.pas',
  Uadd in '..\ZAMER\Uadd.pas',
  UBig in 'UBig.pas' {FBig};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFBig, FBig);
  Application.Run;

end.
