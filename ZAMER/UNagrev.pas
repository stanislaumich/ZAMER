unit UNagrev;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Actions, Vcl.ActnList, math;

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
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ProgressBar1: TProgressBar;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    TimerUp500: TTimer;
    Timer50: TTimer;
    QgetMN: TFDQuery;
    ActionList1: TActionList;
    Action1: TAction;
    QTemp: TFDQuery;
    Label17: TLabel;
    Label19: TLabel;
    Label18: TLabel;
    Label16: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Timer1000: TTimer;
    QCommand: TFDQuery;
    Label23: TLabel;
    Edit6: TEdit;
    Label25: TLabel;
    Label24: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    procedure TimerUp500Timer(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer50Timer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Timer1000Timer(Sender: TObject);
    procedure CommandStart(c: Integer; n: string; fn: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

    R = record
    u1, u2, u3, i1, i2, i3, p, m, n, dop, tip: real;
  end;

var
  FNagrev: TFNagrev;
  a       : array [1 .. 1000] of R;
  acount:integer;
  tip:integer;

implementation

{$R *.dfm}

uses umain;


procedure TFNagrev.CommandStart(c: Integer; n: string; fn: string);
var
  s      : string;
  dectype: string;
begin
  QCommand.SQL.Clear;
  QCommand.SQL.Add
    ('insert into command (nomer, filename, command, dat, interval) values (');
  {
    #define SIMULATOR_DECODER             4
    #define USB_DECODER_T35               6
    #define USB_DECODER_T45               10
  }
  dectype := '10';
  QCommand.SQL.Add(Quotedstr(n) + ',' + Quotedstr(fn) + ',' + inttostr(c) + ','
    + dectype + ', ' + FMain.Edit12.Text + ')');
  QCommand.ExecSQL;
end;

procedure TFNagrev.Action1Execute(Sender: TObject);
begin
  BitBtn1.Click;
end;

procedure TFNagrev.BitBtn11Click(Sender: TObject);
begin
  FNagrev.Close;
end;

procedure TFNagrev.BitBtn1Click(Sender: TObject);
begin
 acount:=0;
 tip:=Stringgrid1.Row;
 timer1000.tag:=Strtoint(edit1.text);
 // запустить датчик 45
 CommandStart(1, umain.Nomer, Label8.Caption);




 timer50.Enabled:=true;
 timer1000.enabled:=true;
end;

procedure TFNagrev.FormCreate(Sender: TObject);
var
  i, j: Integer;
  s   : string;
begin
  StringGrid1.cells[0, 0] := 'Нагрузка';
  StringGrid1.cells[1, 0] := 'U сред В.';
  StringGrid1.cells[2, 0] := 'I сред А.';
  StringGrid1.cells[3, 0] := 'P сред Вт.';
  StringGrid1.cells[4, 0] := 'N сред об.мин';
  StringGrid1.cells[5, 0] := 'М сред Нм';
  StringGrid1.cells[6, 0] := 'T, C';
  StringGrid1.cells[7, 0] := 'R, Ом';
  StringGrid1.cells[8, 0] := 'НАГР';
  Stringgrid1.DefaultColWidth:=100;

  Fmain.QDelta.Open('select value from zdelta where name=' + Quotedstr('unag'));
  FNagrev.Edit2.Text := Fmain.QDelta.FieldByName('value').Asstring;
  QTemp.Close;
  Fmain.QDelta.Open('select value from zdelta where name=' + Quotedstr('pnag'));
  FNagrev.Edit3.Text := Fmain.QDelta.FieldByName('value').Asstring;
  QTemp.Close;

end;

procedure TFNagrev.Timer1000Timer(Sender: TObject);
begin
 If Timer1000.Tag=0 then
  begin
   Timer50.Enabled:=false;
   Timer1000.Enabled:=false;
   // остановить датчик 45
    CommandStart(0, umain.Nomer, Label8.Caption);





  end;
 Timer1000.Tag:=Timer1000.Tag-1;
end;

procedure TFNagrev.Timer50Timer(Sender: TObject);
begin
  acount       := acount + 1;
  a[acount].u1 := simpleroundto(FMain.RU1.Value, RazU);
  a[acount].u2 := simpleroundto(FMain.RU2.Value, RazU);
  a[acount].u3 := simpleroundto(FMain.RU3.Value, RazU);
  a[acount].i1 := simpleroundto(FMain.RI1.Value, RazI);
  a[acount].i2 := simpleroundto(FMain.RI2.Value, RazI);
  a[acount].i3 := simpleroundto(FMain.RI3.Value, RazI);
  a[acount].p := simpleroundto(FMain.RP1.Value, RazP);
  // select curr     45
  //a[acount].m := simpleroundto(FMain.RP2.Value, RazM);
  //a[acount].n := simpleroundto(FMain.RP3.Value, RazN);
end;

procedure TFNagrev.TimerUp500Timer(Sender: TObject);
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
