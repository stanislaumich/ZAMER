unit UReg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, KRConnector,
  KRCOMPortConnector,KRTypes;

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
    CM: TKRCOMPortConnector;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;

    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CMRecv(Sender: TObject; APack: PByte; ALength: Integer);
    procedure CMRecvAsync(Sender: TObject; APack: PByte; ALength: Integer);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure preparepacket;
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    buf: PByte;//PKRBuffer;
    procedure Mycallback(AError: integer; APack: PByte; ALength: integer;
  AData: Pointer);
  end;

var
  FormReg: TFormReg;


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
var
 i:integer;
begin
 for i:=0 to ALength -1 do
  begin
   Memo1.Lines.Add(inttostr(APack[i]));
  end;
 memo1.Lines.add('------------------');
 //Dispose(APack);
end;

procedure TFormReg.Button2Click(Sender: TObject);
begin
  buf[0]:=3;
  preparepacket;
 CM.Send(
    buf, // Указатель на буфер
    plen, // Длина запроса
    Mycallback, // Метод обратной связи
    nil, // Указатель на дополнительные данные
    false, // Нужно получить ответ
    plen // Длина ответа
  );
end;


procedure TFormReg.Button3Click(Sender: TObject);
 begin
  buf[0]:=4;
  preparepacket;
 CM.Send(
    buf, // Указатель на буфер
    plen, // Длина запроса
    Mycallback, // Метод обратной связи
    nil, // Указатель на дополнительные данные
    false, // Нужно получить ответ
    plen // Длина ответа
  );
end;

procedure TFormReg.Button4Click(Sender: TObject);
begin
  buf[0]:=5;
  preparepacket;
 CM.Send(
    buf, // Указатель на буфер
    plen, // Длина запроса
    Mycallback, // Метод обратной связи
    nil, // Указатель на дополнительные данные
    false, // Нужно получить ответ
    plen // Длина ответа
  );
end;

procedure TFormReg.Button5Click(Sender: TObject);
begin
  CM.Active:=false;
end;

procedure TFormReg.Button6Click(Sender: TObject);
begin
 Memo1.Lines.Clear;
end;

procedure TFormReg.CMRecv(Sender: TObject; APack: PByte; ALength: Integer);
var
 i:integer;
begin
{ for i:=0 to ALength -1 do
  begin
   Memo1.Lines.Add(inttostr(APack[i]));
  end;}
end;

procedure TFormReg.CMRecvAsync(Sender: TObject; APack: PByte; ALength: Integer);
var
 i:integer;
begin
 {for i:=0 to ALength -1 do
  begin
   Memo1.Lines.Add(inttostr(APack[i]));
  end;}
end;

procedure TFormReg.Button1Click(Sender: TObject);
begin
 CM.Active:=true;
end;

procedure TFormReg.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 CM.Active:=false;
 freemem(buf);
end;

procedure TFormReg.FormCreate(Sender: TObject);
begin
 getmem(buf,plen);
end;

end.
