unit UFile;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFFile = class(TForm)
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    Label3: TLabel;
    Edit3: TEdit;
    CheckBox1: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFile: TFFile;

implementation

{$R *.dfm}

end.
