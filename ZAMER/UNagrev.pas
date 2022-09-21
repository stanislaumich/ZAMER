unit UNagrev;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFNagrev = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    GroupBox4: TGroupBox;
    StringGrid1: TStringGrid;
    Label16: TLabel;
    Label17: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ProgressBar1: TProgressBar;
    Label18: TLabel;
    Label19: TLabel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    Timer1: TTimer;
    Timer2: TTimer;
    QgetMN: TFDQuery;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNagrev: TFNagrev;

implementation

{$R *.dfm}

uses umain;

procedure TFNagrev.Timer1Timer(Sender: TObject);
begin
  Label7.Caption := FMAin.KrVarLabel1.Caption;
  Label8.Caption := FMAin.KrVarLabel2.Caption;
  Label9.Caption := FMAin.KrVarLabel3.Caption;

  QgetMN.Open('select * from zamer');
  Label10.Caption := QgetMN.FieldByName('torq').AsString;
  Label11.Caption := QgetMN.FieldByName('rot').AsString;
  Label12.Caption := QgetMN.FieldByName('power').AsString;
end;

end.
