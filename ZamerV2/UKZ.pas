unit UKZ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.Buttons, System.Actions, Vcl.ActnList;

type
  TFKZ = class(TForm)
    QTemp: TFDQuery;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
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
    Label13: TLabel;
    Edit1: TEdit;
    GroupBox2: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    StringGrid1: TStringGrid;
    Edit2: TEdit;
    BitBtn10: TBitBtn;
    BitBtn12: TBitBtn;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    TimerUp: TTimer;
    QUp: TFDQuery;
    BitBtn1: TBitBtn;
    procedure BitBtn8Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure TimerUpTimer(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FKZ: TFKZ;

implementation

{$R *.dfm}

Uses uzv2Main;




procedure TFKZ.Action1Execute(Sender: TObject);
begin
 BitBtn8Click(FKZ);
end;

procedure TFKZ.Action2Execute(Sender: TObject);
begin
 BitBtn9Click(FKZ);
end;

procedure TFKZ.BitBtn8Click(Sender: TObject);
var s:string;
begin

end;

procedure TFKZ.BitBtn9Click(Sender: TObject);
var s:string;
begin

end;

procedure TFKZ.FormActivate(Sender: TObject);
begin
 TimerUp.Enabled:=true;
end;

procedure TFKZ.FormHide(Sender: TObject);
begin
 TimerUp.Enabled:=false;
end;

procedure TFKZ.TimerUpTimer(Sender: TObject);
begin
 QUp.Close;
 QUp.Open();
  Label11.Caption := QUp.FieldByName('P').Asstring;
  Label10.Caption := QUp.FieldByName('I').Asstring;
  Label9.Caption := QUp.FieldByName('U').Asstring;
  Label12.Caption:= QUp.FieldByName('M').Asstring;

end;

end.
