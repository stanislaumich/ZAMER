program UPDATER;

uses
  Vcl.Forms,
  UMAin in 'UMAin.pas' {FMain},
  UFile in 'UFile.pas' {FFile};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFFile, FFile);
  Application.Run;
end.
