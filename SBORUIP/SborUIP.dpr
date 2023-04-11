program SborUIP;

uses
  Vcl.Forms,
  Umain in 'Umain.pas' {FMain},
  USett in 'USett.pas' {FSett};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFSett, FSett);
  Application.Run;
end.
