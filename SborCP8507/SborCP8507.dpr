program SborCP8507;

uses
  Vcl.Forms,
  UMain in 'UMain.pas' {Fmain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFmain, Fmain);
  Application.Run;
end.
