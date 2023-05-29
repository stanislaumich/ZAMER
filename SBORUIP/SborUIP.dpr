program SborUIP;

uses
  Vcl.Forms,
  Umain in 'Umain.pas' {FMain},
  USett in 'USett.pas' {FSett},
  CPortCtl in 'install\Source\CPortCtl.pas',
  CPort in 'install\Source\CPort.pas',
  CPortSetup in 'install\Source\CPortSetup.pas' {ComSetupFrm},
  CPortEsc in 'install\Source\CPortEsc.pas',
  CPortTrmSet in 'install\Source\CPortTrmSet.pas' {ComTrmSetForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFSett, FSett);
  Application.Run;
end.
