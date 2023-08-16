program TESA;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  CPort in '..\UReg\install\Source\CPort.pas',
  CPortSetup in '..\UReg\install\Source\CPortSetup.pas' {ComSetupFrm},
  CPortCtl in '..\UReg\install\Source\CPortCtl.pas',
  CPortEsc in '..\UReg\install\Source\CPortEsc.pas',
  CPortTrmSet in '..\UReg\install\Source\CPortTrmSet.pas' {ComTrmSetForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
