unit UMehan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.Buttons,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Math;

type
  TFMehan = class(TForm)
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
    Label25: TLabel;
    Edit14: TEdit;
    GroupBox11: TGroupBox;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Timer1: TTimer;
    Timer2: TTimer;
    QCommand: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button32Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure CommandStart(c: Integer; n: string; fn: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  R=record
    u1,u2,u3,n,m, usred:single;
  end;

var
  FMehan: TFMehan;
  amax,amin:array[1..5,1..1000] of R;
  cmax,cmin:array[1..5] of integer;
  count, num, curr, row:integer;
implementation

{$R *.dfm}

uses umain;

procedure TFMehan.CommandStart(c: Integer; n: string; fn: string);
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
  if (FMAin.RadioButton1.Checked) then
    dectype := '10';
  if (FMAin.RadioButton2.Checked) then
    dectype := '4';
  dectype   := '10';
  QCommand.SQL.Add(Quotedstr(n) + ',' + Quotedstr(fn) + ',' + inttostr(c) + ','
    + dectype + ', ' + FMAin.Edit12.Text + ')');
  QCommand.ExecSQL;
end;

procedure TFMehan.BitBtn1Click(Sender: TObject);
begin

  fmain.Label32.Caption    := 'ПРОЙДЕН';
  fmain.Label32.Font.Color := clGreen;
end;

procedure TFMehan.Button27Click(Sender: TObject);
 var
  i:integer;
  tr:R;
begin// start
 tr.u1:=0;
 tr.u2:=0;
 tr.u3:=0;
 tr.usred:=0;
 tr.n:=0;
 tr.m:=0;

 count:=0;// current number
 curr:=1;// stringgrid7

 row:= stringgrid7.row;
 for i := 1 to 1000 do amax[row,i]:=tr;
 CommandStart(1, Nomer, '0');
 Timer1.Enabled:=true;
 Timer2.Enabled:=true;

end;

procedure TFMehan.Button32Click(Sender: TObject);
begin
 Timer1.Enabled:=false;
 Timer2.Enabled:=false;
 CommandStart(0, Nomer, '0');



end;

procedure TFMehan.FormActivate(Sender: TObject);
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

procedure TFMehan.Timer2Timer(Sender: TObject);
begin
 if count>=1000 then
  begin

   exit;
  end;
 if curr=1 then
  begin
   amax[row,count].u1:= SimpleRoundTo(FMAin.RU1.Value, -4);
   amax[row,count].u2:= SimpleRoundTo(FMAin.RU2.Value, -4);
   amax[row,count].u3:= SimpleRoundTo(FMAin.RU3.Value, -4);
   amax[row,count].usred:=SimpleRoundTo((amax[row,count].u1+amax[row,count].u2+amax[row,count].u3)/3,-4);
   //amax[row,count].n:=
   //amax[row,count].m:=
  end;



 count:=count+1;
end;

end.
