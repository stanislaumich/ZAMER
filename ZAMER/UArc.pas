unit UArc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFArc = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    ComboBox1: TComboBox;
    Edit4: TEdit;
    ComboBox2: TComboBox;
    Edit7: TEdit;
    ComboBox3: TComboBox;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    ComboBox4: TComboBox;
    Edit10: TEdit;
    Edit11: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FArc: TFArc;

implementation

{$R *.dfm}

end.
