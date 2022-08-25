unit UnitHH;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls, KRVarLabel, Vcl.Grids;

type
  TFormHH = class(TForm)

  private
    { Private declarations }
  public
    { Public declarations }
    cnt, c: integer;
  end;

var
  FormHH: TFormHH;

implementation

Uses UMain;
{$R *.dfm}

end.
