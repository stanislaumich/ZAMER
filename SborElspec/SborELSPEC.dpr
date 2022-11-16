program SborELSPEC;

uses
  Vcl.Forms,
  UMainSbor in 'UMainSbor.pas' {Form1},
  Ustr in '..\ZAMER\Ustr.pas',
  Uadd in '..\ZAMER\Uadd.pas',
  UBig in 'UBig.pas' {FBig},
  USett in '..\ZamerV2\USett.pas' {FSett};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFBig, FBig);
  Application.CreateForm(TFSett, FSett);
  Application.Run;

end.
