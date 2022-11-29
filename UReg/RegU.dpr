program RegU;

uses
  Vcl.Forms,
  UReg in 'UReg.pas' {FormReg},
  CPortCtl in 'install\Source\CPortCtl.pas',
  CPort in 'install\Source\CPort.pas',
  CPortSetup in 'install\Source\CPortSetup.pas' {ComSetupFrm},
  CPortEsc in 'install\Source\CPortEsc.pas',
  CPortTrmSet in 'install\Source\CPortTrmSet.pas' {ComTrmSetForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormReg, FormReg);
  Application.Run;
end.
