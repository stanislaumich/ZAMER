program ModBusM45;

uses
  Vcl.Forms,
  UMain in 'UMain.pas' {Form1} ,
  Ustr in 'Ustr.pas',
  Unit2 in 'Unit2.pas' {Form2} ,
  UnitBig in 'UnitBig.pas' {FormBig} ,
  UnitHH in 'UnitHH.pas' {FormHH} ,
  Uformreport in 'Uformreport.pas' {FormReport} ,
  Ugetlast in 'Ugetlast.pas' {Fgetlast};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TFormBig, FormBig);
  Application.CreateForm(TFormHH, FormHH);
  Application.CreateForm(TFormReport, FormReport);
  Application.CreateForm(TFgetlast, Fgetlast);
  Application.Run;

end.
