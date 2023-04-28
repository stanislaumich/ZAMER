unit UReg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, KRConnector,
  KRCOMPortConnector,KRTypes, CPortCtl, CPort;

type
  TFormReg = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Memo1: TMemo;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Edit4: TEdit;
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    ComLed1: TComLed;
    Com: TComPort;
    Button7: TButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure preparepacket;
    procedure Button6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ComRxChar(Sender: TObject; Count: Integer);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    buf: PByte;//PKRBuffer;
    procedure Mycallback(AError: integer; APack: PByte; ALength: integer;
  AData: Pointer);
  end;

var
  FormReg: TFormReg;
  ComStr:string;

const
 plen = 20;// длина пакета

implementation

{$R *.dfm}
procedure TFormReg.preparepacket;
 var
  i:integer;
 begin
  i:=strtoint(Edit4.Text);
  buf[1]:=i div 10;
  buf[2]:=i mod 10;
  i:=strtoint(label8.Caption);
  buf[3]:=i div 10;
  buf[4]:=i mod 10;
  i:=strtoint(Edit3.Text);
  buf[5]:=i div 100;
  i:=strtoint(Edit2.Text);
  buf[6]:=i div 100;
  i:=strtoint(Edit1.Text);
  buf[7]:=i;
  for i:=8 to plen-1 do buf[i]:=0;
 end;

procedure TFormReg.Mycallback(AError: integer; APack: pByte; ALength: integer;
  AData: Pointer);

begin


end;

procedure TFormReg.Button1Click(Sender: TObject);
begin
 Com.Open;
 Button2.Enabled:=true;
 Button3.Enabled:=true;
 Button4.Enabled:=true;
end;

procedure TFormReg.Button2Click(Sender: TObject);
var
 i:integer;
begin
  Com.WriteStr('0');
end;


procedure TFormReg.Button3Click(Sender: TObject);
 begin
  Com.WriteStr('1');
end;

procedure TFormReg.Button4Click(Sender: TObject);
begin
  Com.WriteStr('2');
end;

procedure TFormReg.Button5Click(Sender: TObject);
begin
 Com.Close;
end;

procedure TFormReg.Button6Click(Sender: TObject);
begin
 Memo1.Lines.Clear;
end;

procedure TFormReg.Button7Click(Sender: TObject);
begin
  Com.WriteStr('3');
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
 memo1.lines.add(comstr);
 memo1.lines.add(' ');
 comstr:='';
end;

procedure TFormReg.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

 freemem(buf);
end;

procedure TFormReg.FormCreate(Sender: TObject);
begin
 getmem(buf,plen);

end;

end.
