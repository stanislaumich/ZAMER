program MicroToDo;

uses
  Vcl.Forms,
  UMain in 'UMain.pas' {FMain},
  Ustr in '..\ZAMER\Ustr.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMain, FMain);
  Application.Run;
end.
