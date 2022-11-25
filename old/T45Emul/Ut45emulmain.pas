unit Ut45emulmain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, MemDS, DBAccess,
  Uni, UniProvider, OracleUniProvider, Vcl.ExtCtrls, Math;

type
  TFt45emulmain = class(TForm)
    UniConnection1: TUniConnection;
    QTemp: TUniQuery;
    OracleUniProvider1: TOracleUniProvider;
    QUpdZamer: TUniQuery;
    TimerUPDZamer: TTimer;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Button3: TButton;
    Label4: TLabel;
    Edit7: TEdit;
    Timer1000: TTimer;
    QCommand: TUniQuery;
    QClearCommand: TUniQuery;
    QInsZamerTmp: TUniQuery;
    procedure Button2Click(Sender: TObject);
    procedure TimerUPDZamerTimer(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Timer1000Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  r=record
     rot,torq,power:real;
    end;
var
  Ft45emulmain: TFt45emulmain;
  wr:boolean;
  nomer:string;
  a:array[1..10000] of r;
  acnt:integer;
implementation

{$R *.dfm}

procedure TFt45emulmain.Button2Click(Sender: TObject);
begin
 TimerUPDZamer.Interval:=Strtoint(Edit7.Text);
 TimerUPDZamer.Enabled:=true;
end;

procedure TFt45emulmain.Button3Click(Sender: TObject);
var
 i:integer;
begin
  TimerUPDZamer.Enabled:=false;
  for i:=1 to acnt-1 do
   begin
   qinszamertmp.close;
   qinszamertmp.ParamByName('rot').AsFloat:=a[i].rot;
   qinszamertmp.ParamByName('torq').AsFloat:=a[i].torq;
   qinszamertmp.ParamByName('power').AsFloat:=a[i].power;
   qinszamertmp.ParamByName('nomer').AsString:=nomer;
   qinszamertmp.ParamByName('pnom').AsFloat:=0;
   qinszamertmp.ExecSQL;
   end;
end;

procedure TFt45emulmain.Timer1000Timer(Sender: TObject);
var i:integer;
begin
 QCommand.Close;
 QCommand.SQL.Clear;
 QCommand.SQL.Add('Select * from command');
 QCommand.Open();
 if QCommand.RecordCount<>0 then
  begin
 nomer:=QCommand.FieldByName('nomer').asstring;
 case QCommand.FieldByName('command').AsInteger of
  0: begin
      wr:=false;
      QClearCommand.ExecSQL;
      Button3.Click;

     end;
  1: begin
      QTemp.Close;
      QTemp.SQL.Clear;
      QTemp.SQL.Add('truncate table zamertmp');
      QTemp.ExecSQL;
      wr:=true;
      acnt:=1;
      QClearCommand.ExecSQL;
      Button2.Click;
     end;
  end
 end;
end;

procedure TFt45emulmain.TimerUPDZamerTimer(Sender: TObject);
var
 torq, rot, power:single;
begin
randomize;
 torq:=simpleroundto(randomrange(strtoint(Edit1.text),strtoint(Edit2.text))+random,-3);
 rot:=simpleroundto(randomrange(strtoint(Edit3.text),strtoint(Edit4.text))+random,-3);
 power:=simpleroundto(randomrange(strtoint(Edit5.text),strtoint(Edit6.text))+random,-3);
 qupdzamer.close;
 qupdzamer.ParamByName('rot').AsFloat:=rot;
 qupdzamer.ParamByName('torq').AsFloat:=torq;
 qupdzamer.ParamByName('power').AsFloat:=power;
 qupdzamer.ExecSQL;
 if wr then
  begin
    a[acnt].rot:=rot;
    a[acnt].torq:=torq;
    a[acnt].power:=power;
    acnt:=acnt+1;
  end;
end;

end.
