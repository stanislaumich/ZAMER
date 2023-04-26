program Sniffer;

uses
  Windows,
  Forms,
  uMain in 'uMain.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'SnifferDemo';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
