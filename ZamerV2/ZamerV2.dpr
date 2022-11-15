program ZamerV2;

uses
  Vcl.Forms,
  Uzv2Main in 'Uzv2Main.pas' {FZamerV2},
  Ustr in '..\ZAMER\Ustr.pas',
  Uadd in '..\ZAMER\Uadd.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFZamerV2, FZamerV2);
  Application.Run;
end.
