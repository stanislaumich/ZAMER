program UPDATER;
uses
  Vcl.Forms,
  UMAin in 'UMAin.pas' {FMainUpdater},
  UFile in 'UFile.pas' {FFile},
  Ustr in '..\ZAMER\Ustr.pas';

{$R *.res}
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMainUpdater, FMainUpdater);
  Application.CreateForm(TFFile, FFile);
  Application.Run;
end.
