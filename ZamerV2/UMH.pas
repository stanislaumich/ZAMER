unit UMH;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, System.Actions,
  Vcl.ActnList, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls, Vcl.Grids, uadd;

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
    QUp: TFDQuery;
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
    procedure FormCreate(Sender: TObject);
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
  QUp.Close;
  QUp.Open();

  Label6.Caption := myformat(trazm, QUp.FieldByName('torq').AsFloat);
  Label7.Caption := myformat(trazr, QUp.FieldByName('rot').AsFloat);
  Label5.Caption := myformat(trazu, QUp.FieldByName('u').AsFloat);
end;

procedure TFMH.FormActivate(Sender: TObject);
var
  i: integer;
begin

 TimerUp.Enabled:=true;
end;

procedure TFMH.FormCreate(Sender: TObject);
begin
  StringGrid7.cells[0, 0] := '';
  StringGrid7.cells[1, 0] := 'Uсред, В';
  StringGrid7.cells[2, 0] := 'M, Н/м';
  StringGrid7.cells[3, 0] := 'N, об/мин';
  StringGrid7.cells[0, 1] := 'Изм. 1';
  StringGrid7.cells[0, 2] := 'Изм. 2';
  StringGrid7.cells[0, 3] := 'Изм. 3';
  StringGrid7.cells[0, 4] := 'Изм. 4';
  StringGrid7.cells[0, 5] := 'Изм. 5';
  //row                     := 1;
  StringGrid8.cells[0, 0] := '';
  StringGrid8.cells[1, 0] := 'Uсред, В';
  StringGrid8.cells[2, 0] := 'M, Н/м';
  StringGrid8.cells[3, 0] := 'N, об/мин';
  StringGrid8.cells[0, 1] := 'Изм. 1';
  StringGrid8.cells[0, 2] := 'Изм. 2';
  StringGrid8.cells[0, 3] := 'Изм. 3';
  StringGrid8.cells[0, 4] := 'Изм. 4';
  StringGrid8.cells[0, 5] := 'Изм. 5';
end;

procedure TFMH.FormHide(Sender: TObject);
begin
 TimerUp.Enabled:=false;
end;

end.
