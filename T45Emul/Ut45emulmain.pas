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
    Button1: TButton;
    Memo1: TMemo;
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
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure TimerUPDZamerTimer(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Ft45emulmain: TFt45emulmain;

implementation

{$R *.dfm}

procedure TFt45emulmain.Button1Click(Sender: TObject);
begin
 QTemp.Open;
 while not qtemp.eof do
  begin
   memo1.lines.add(QTemp.FieldByName('torq').Asstring);
   Qtemp.next;
  end;
end;

procedure TFt45emulmain.Button2Click(Sender: TObject);
begin
 TimerUPDZamer.Interval:=Strtoint(Edit7.Text);
 TimerUPDZamer.Enabled:=true;
end;

procedure TFt45emulmain.Button3Click(Sender: TObject);
begin
  TimerUPDZamer.Enabled:=false;
end;

procedure TFt45emulmain.TimerUPDZamerTimer(Sender: TObject);
var
 torq, rot, power:single;
begin
 torq:=simpleroundto(randomrange(strtoint(Edit1.text),strtoint(Edit2.text))+random,-3);
 rot:=simpleroundto(randomrange(strtoint(Edit3.text),strtoint(Edit4.text))+random,-3);
 power:=simpleroundto(randomrange(strtoint(Edit5.text),strtoint(Edit6.text))+random,-3);


qupdzamer.close;
qupdzamer.ParamByName('rot').AsFloat:=rot;
qupdzamer.ParamByName('torq').AsFloat:=torq;
qupdzamer.ParamByName('power').AsFloat:=power;
qupdzamer.ExecSQL;
end;

end.
