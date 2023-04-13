program BIG;

uses
  Vcl.Forms,
  UMain in 'UMain.pas' {FMain},
  Usett in 'Usett.pas' {FSett};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFSett, FSett);
  Application.Run;
end.
