unit UMH;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, System.Actions,
  Vcl.ActnList, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls, Vcl.Grids;

type
  TFMH = class(TForm)
    Label25: TLabel;
    Label1: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    GroupBox17: TGroupBox;
    StringGrid7: TStringGrid;
    Button27: TButton;
    Button32: TButton;
    RadioButton11: TRadioButton;
    RadioButton12: TRadioButton;
    RadioButton13: TRadioButton;
    RadioButton14: TRadioButton;
    RadioButton15: TRadioButton;
    Button47: TButton;
    GroupBox18: TGroupBox;
    StringGrid8: TStringGrid;
    Button37: TButton;
    Button42: TButton;
    RadioButton16: TRadioButton;
    RadioButton17: TRadioButton;
    RadioButton18: TRadioButton;
    RadioButton19: TRadioButton;
    RadioButton20: TRadioButton;
    Button48: TButton;
    Edit14: TEdit;
    GroupBox11: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Button1: TButton;
    TimerUp: TTimer;
    Timer2: TTimer;
    QCommand: TFDQuery;
    QTemp: TFDQuery;
    QInsall: TFDQuery;
    QInsSvod: TFDQuery;
    QGetMN: TFDQuery;
    ActionList1: TActionList;
    upstart: TAction;
    upstop: TAction;
    downstart: TAction;
    downstop: TAction;
    Panel1: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    procedure TimerUpTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMH: TFMH;

implementation

{$R *.dfm}

procedure TFMH.TimerUpTimer(Sender: TObject);
begin
  //Label5.Caption := FMAin.KrVarLabel1.Caption;
  //QGetMN.Open('select * from zamer');
  //Label6.Caption := QGetMN.FieldByName('torq').AsString;
  //Label7.Caption := QGetMN.FieldByName('rot').AsString;
end;

procedure TFMH.FormActivate(Sender: TObject);
begin
 TimerUp.Enabled:=true;
end;

procedure TFMH.FormHide(Sender: TObject);
begin
 TimerUp.Enabled:=false;
end;

end.
