program ZamerV2;

uses
  Vcl.Forms,
  Uzv2Main in 'Uzv2Main.pas' {FZamerV2} ,
  Ustr in '..\ZAMER\Ustr.pas',
  UHH in 'UHH.pas' {FormHH} ,
  USett in 'USett.pas' {FZamerV2} ,
  UARC in 'UARC.pas' {FARC} ,
  Uadd in '..\ZAMER\Uadd.pas',
  USopr in 'USopr.pas' {FSopr} ,
  UKZ in 'UKZ.pas' {FKZ} ,
  UAuto in 'UAuto.pas' {FAuto};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFZamerV2, FZamerV2);
  Application.CreateForm(TFormHH, FormHH);
  Application.CreateForm(TFSett, FSett);
  Application.CreateForm(TFARC, FARC);
  Application.CreateForm(TFSopr, FSopr);
  Application.CreateForm(TFKZ, FKZ);
  Application.CreateForm(TFAuto, FAuto);
  Application.Run;

end.
