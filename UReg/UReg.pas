unit UReg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, KRConnector,
  KRCOMPortConnector,KRTypes, CPortCtl, CPort, System.Actions, Vcl.ActnList;

type
  TFormReg = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Edit4: TEdit;
    BitBtn1: TBitBtn;
    ComLed1: TComLed;
    Com: TComPort;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    ActionList1: TActionList;
    Up: TAction;
    Down: TAction;
    Stop: TAction;
    CheckBox1: TCheckBox;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ComRxChar(Sender: TObject; Count: Integer);
    procedure Button7Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure UpExecute(Sender: TObject);
    procedure DownExecute(Sender: TObject);
    procedure StopExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
//    buf: PByte;//PKRBuffer;
    procedure Mycallback(AError: integer; APack: PByte; ALength: integer;
  AData: Pointer);
  end;

var
  FormReg: TFormReg;
  ComStr:string;
  act : integer;
const
 plen = 20;// длина пакета

implementation

{$R *.dfm}


procedure TFormReg.Mycallback(AError: integer; APack: pByte; ALength: integer;
  AData: Pointer);
begin

end;

procedure TFormReg.StopExecute(Sender: TObject);
begin
 BitBtn4.Click;
end;

procedure TFormReg.UpExecute(Sender: TObject);
begin
 BitBtn2.Click;
end;

procedure TFormReg.BitBtn1Click(Sender: TObject);
begin
 Com.Port:=ComboBox1.Text;
 Com.Open;
 BitBtn2.Enabled:=true;
 BitBtn3.Enabled:=true;
 BitBtn4.Enabled:=true;
end;

procedure TFormReg.BitBtn2Click(Sender: TObject);
begin
  Com.WriteStr('0');
  if act<>2 then
   begin
    Com.WriteStr('2');
    act := 2;
   end
    else act:=0;
end;

procedure TFormReg.BitBtn3Click(Sender: TObject);
begin
  Com.WriteStr('0');
  if act<>1 then
   begin
    Com.WriteStr('1');
    act:=1;
   end
    else act:=0;
end;

procedure TFormReg.BitBtn4Click(Sender: TObject);
begin
  Com.WriteStr('0');
  act:=0;
end;

procedure TFormReg.Button7Click(Sender: TObject);
begin
  Com.WriteStr('3');
  act:=3;
end;

procedure TFormReg.ComRxChar(Sender: TObject; Count: Integer);
var
 i:integer;
 res:string;
begin
 Com.ReadStr(res, Count);
 comstr:='';
 for i:=1 to length(res) do
  begin
    comstr:=comstr+ ' ' +inttostr(byte(res[i]));
  end;

 comstr:='';
end;

procedure TFormReg.DownExecute(Sender: TObject);
begin
 BitBtn3.Click;
end;

procedure TFormReg.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Com.Close;
end;

procedure TFormReg.FormCreate(Sender: TObject);
begin
act:=0;
end;

end.
