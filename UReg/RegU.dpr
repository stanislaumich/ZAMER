program RegU;

uses
  Vcl.Forms,
  UReg in 'UReg.pas' {FormReg};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormReg, FormReg);
  Application.Run;
end.
