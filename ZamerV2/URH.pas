unit URH;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, System.Actions, Vcl.ActnList, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFRH = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label6: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    BitBtn10: TBitBtn;
    GroupBox3: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    GroupBox2: TGroupBox;
    StringGrid1: TStringGrid;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    GroupBox4: TGroupBox;
    StringGrid2: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label20: TLabel;
    Edit4: TEdit;
    Label25: TLabel;
    Edit5: TEdit;
    Label26: TLabel;
    Edit6: TEdit;
    Label27: TLabel;
    Edit7: TEdit;
    QCommand: TFDQuery;
    Qselectsred: TFDQuery;
    QinsAll: TFDQuery;
    QTemp: TFDQuery;
    QInsSvod: TFDQuery;
    ActionList1: TActionList;
    Action1: TAction;
    Timer1000: TTimer;
    TimerUp: TTimer;
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure command(b: Boolean);
  end;

var
  FRH        : TFRH;
  enableclose: Boolean;

implementation

uses uzv2main;
{$R *.dfm}

procedure TFRH.command(b: Boolean);
var
  interval: integer;
  fname   : string;
begin
  interval := 50;
  fname    := '1600';
  if b then
  begin
    QTemp.Close;
    QTemp.SQL.Clear;

    QTemp.SQL.Add
      ('insert into command (nomer, filename,command, dat,interval) values(' +
      Quotedstr(Nomer) + ' ,' + fname + ', 1, ' + '4' + ',' +
      inttostr(interval) + ')');
    QTemp.ExecSQL;
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('insert into command (nomer, command) values(' +
      Quotedstr(Nomer) + ' , 11)');
    QTemp.ExecSQL;
  end
  else
  begin
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add
      ('insert into command (nomer, filename,command, dat,interval) values(' +
      Quotedstr(Nomer) + ' ,' + fname + ', 0, ' + '4' + ',' +
      inttostr(interval) + ')');
    QTemp.ExecSQL;
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('insert into command (nomer, command) values(' +
      Quotedstr(Nomer) + ' , 10)');
    QTemp.ExecSQL;
  end;
end;

procedure TFRH.Action1Execute(Sender: TObject);
begin
  BitBtn1.Click;
end;

end.
