unit UnitBig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, KRVarLabel;

type
  TFormBig = class(TForm)
    KRVarLabel1: TKRVarLabel;
    Label1: TLabel;
    Label2: TLabel;
    KRVarLabel2: TKRVarLabel;
    KRVarLabel3: TKRVarLabel;
    Label3: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormBig: TFormBig;

implementation

uses Umain;
{$R *.dfm}

end.
