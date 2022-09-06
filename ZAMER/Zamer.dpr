program Zamer;

uses
  Vcl.Forms,
  Umain in 'Umain.pas' {FMain},
  Ustr in '..\M35_45_modbusMAIN\Ustr.pas',
  UDATA in 'UDATA.pas' {Data: TDataModule},
  UHH in 'UHH.pas' {Fhhod},
  USoprot in 'USoprot.pas' {FSoprot},
  UProdol in 'UProdol.pas' {FProdol},
  URH in 'URH.pas' {FRH},
  UKZam in 'UKZam.pas' {FKzam},
  UNagrev in 'UNagrev.pas' {FNagrev},
  UMehan in 'UMehan.pas' {FMehan},
  UArc in 'UArc.pas' {FArc},
  UDatchik in 'UDatchik.pas' {FDatchik};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TData, Data);
  Application.CreateForm(TData, Data);
  Application.CreateForm(TFhhod, Fhhod);
  Application.CreateForm(TFSoprot, FSoprot);
  Application.CreateForm(TFProdol, FProdol);
  Application.CreateForm(TFRH, FRH);
  Application.CreateForm(TFKzam, FKzam);
  Application.CreateForm(TFNagrev, FNagrev);
  Application.CreateForm(TFMehan, FMehan);
  Application.CreateForm(TFArc, FArc);
  Application.CreateForm(TFDatchik, FDatchik);
  Application.Run;

end.
