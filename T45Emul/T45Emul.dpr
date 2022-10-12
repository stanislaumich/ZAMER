program T45Emul;

uses
  Vcl.Forms,
  Ut45emulmain in 'Ut45emulmain.pas' {Ft45emulmain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFt45emulmain, Ft45emulmain);
  Application.Run;
end.
