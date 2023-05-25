unit UReg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, KRConnector,
  KRCOMPortConnector,KRTypes, CPortCtl, CPort, System.Actions, Vcl.ActnList,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.Oracle, FireDAC.Phys.OracleDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  Vcl.ExtCtrls, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Inifiles;

type
  TFormReg = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
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
    FDC: TFDConnection;
    Query1: TFDQuery;
    Timer1: TTimer;
    Label3: TLabel;
    BitBtn5: TBitBtn;
    Query2: TFDQuery;
    Timer2: TTimer;
    Query3: TFDQuery;
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
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
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

procedure TFormReg.Timer1Timer(Sender: TObject);
var
 dU:single;
begin
 if Not Com.Connected then
  Exit;
 Query1.Open;
 Label8.Caption:=Query1.FieldByName('U').Asstring;
 Query1.Close;
 dU:=StrToFloat(Label8.Caption) - StrToFloat(Edit4.Text);
 if abs(dU)>StrToFloat(edit1.text){ большой шаг }
  then
   begin { большой шаг}
   if dU>0 then { надо уменьшить тек больше зад}
    begin
     BitBtn3.Click;
    end
   else
    begin { надо увеличить}
     BitBtn2.Click;
    end;
  end { конец большого шага}
  else { малый шаг или стоп}
   begin
    BitBtn4.Click;
   end;

end;

procedure TFormReg.Timer2Timer(Sender: TObject);
begin
 Query2.Open;
 case Query2.fieldbyname('Command').asinteger of
  1: begin
      // запустить установку
      Edit1.Text:= Query2.fieldbyname('interval').asString;
      Edit4.Text:= Query2.fieldbyname('dat').asString;
      BitBtn1.Click;
     end;
  2: begin
      // закрыть программу
      if Com.Connected then
       begin
        Com.WriteStr('0');
        Com.Close;
       end;
      FormReg.Close;
     end;
  3: begin
      // запустить старт
      BitBtn1.Click;
     end;
  4: begin
      // остановить стоп
      BitBtn5.Click;
     end;
 end;

 Query3.ExecSQL;


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
 Timer1.Enabled:=True;
 BitBtn1.Enabled:=false;
 BitBtn5.Enabled:=true;
end;

procedure TFormReg.BitBtn2Click(Sender: TObject);
begin

  if act<>2 then
   begin
    Com.WriteStr('0');
    Com.WriteStr('2');
    act := 2;
    Label3.Caption:='+';
   end
    else act:=0;
end;

procedure TFormReg.BitBtn3Click(Sender: TObject);
begin

  if act<>1 then
   begin
   Com.WriteStr('0');
    Com.WriteStr('1');
    act:=1;
    Label3.Caption:='-';
   end
    else act:=0;
end;

procedure TFormReg.BitBtn4Click(Sender: TObject);
begin
  Com.WriteStr('0');
  act:=0;
  Label3.Caption:='0';
end;

procedure TFormReg.BitBtn5Click(Sender: TObject);
begin
 Timer1.Enabled:=false;
 if Not Com.Connected then
  Exit;
  act:=0;
  Com.WriteStr('0');
  Com.Close;
  BitBtn5.Enabled:=false;
  BitBtn1.Enabled:=true;
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
var
 ini:TIniFile;
 s:string;
begin
   ini:=Tinifile.Create(Extractfilepath(Application.Exename)+'UReg.ini');
   s:= ComboBox1.Text;
   ini.WriteString('MAIN', 'PORT', s);
   ini.Free;
  if Not Com.Connected then
  Exit;
  Com.WriteStr('0');
  Com.Close;
end;

procedure TFormReg.FormCreate(Sender: TObject);
var
 ini:TIniFile;
 s:string;
begin
act:=0;
ini:=Tinifile.Create(Extractfilepath(Application.Exename)+'UReg.ini');
s:= ini.ReadString('MAIN', 'PORT', 'Com1');
ComboBox1.Text:=s;
ini.Free;
end;

end.
