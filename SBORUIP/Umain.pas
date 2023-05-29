unit Umain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ExtCtrls, inifiles, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, KRComponentCollection, KRVariables,
  KRModbusClient, KRModbusMaster, KRConnector, KRTCPConnector, Math,
  FireDAC.Phys.Oracle, FireDAC.Phys.OracleDef, CPortCtl, CPort;

 CONST
  RAZU = -2;FormatU = '0.00';
  RAZI = -3;FormatI = '0.000';
  RAZP = -1;FormatP = '0.0';
type
  TFMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    StatusBar1: TStatusBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ConLite: TFDConnection;
    QLite: TFDQuery;
    QIni: TFDQuery;
    CheckBox1: TCheckBox;
    BitBtn3: TBitBtn;
    TUpd: TTimer;
    KRTCPConnector1: TKRTCPConnector;
    KRModbusMaster1: TKRModbusMaster;
    KRModbusClient1: TKRModbusClient;
    U: TKRMBRegister;
    I: TKRMBRegister;
    P: TKRMBRegister;
    QTemp: TFDQuery;
    U1: TKRMBRegister;
    U2: TKRMBRegister;
    U3: TKRMBRegister;
    I1: TKRMBRegister;
    I2: TKRMBRegister;
    I3: TKRMBRegister;
    P1: TKRMBRegister;
    P2: TKRMBRegister;
    P3: TKRMBRegister;
    QtmpUpd: TFDQuery;
    ConOra: TFDConnection;
    QTempIns: TFDQuery;
    T1: TKRMBRegister;
    T2: TKRMBRegister;
    T3: TKRMBRegister;
    T4: TKRMBRegister;
    QTempOra: TFDQuery;
    Tstart: TTimer;
    Label7: TLabel;
    Edit1: TEdit;
    Label8: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    CheckBox2: TCheckBox;
    ComLed1: TComLed;
    ComPort1: TComPort;
    ComComboBox1: TComComboBox;
    Button7: TButton;

    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    function GetIni(s:string):string;
    procedure SetIni(s:string; v:string);
    procedure BitBtn3Click(Sender: TObject);
    procedure TUpdTimer(Sender: TObject);
    procedure UReadCallBack(Sender: TObject; var AError: Integer;
      AData: Pointer);
    procedure IReadCallBack(Sender: TObject; var AError: Integer;
      AData: Pointer);
    procedure PReadCallBack(Sender: TObject; var AError: Integer;
      AData: Pointer);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel1MouseEnter(Sender: TObject);
    procedure Panel1MouseLeave(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure TstartTimer(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
   procedure GetData(var MessageData: TWMCopyData); message WM_COPYDATA;
  public
   CURRPribor:string;
  end;

var
  FMain: TFMain;
  ur, u1r,u2r, u3r,
  ir, i1r, i2r, i3r,
  pr, p1r, p2r, p3r:integer;
  sText: array[0..99] of Char;
  prevstat, Activated:boolean;



implementation

{$R *.dfm}

uses USett;

 procedure TFMain.GetData(var MessageData: TWMCopyData);
   var s:string;
 begin
  StrLCopy(sText, MessageData.CopyDataStruct.lpData, MessageData.CopyDataStruct.cbData);
  s:=sText;
  if s[1]='1' then
  begin
    CheckBox1.Checked:=true;
    CheckBox1.Caption:='Сбор данных';
    Panel2.Color:=clGreen;
    MessageData.Result := 1;
  end
  else
   begin
    CheckBox1.Checked:=false;
    CheckBox1.Caption:='Остановлен';
    Panel2.Color:=clbtnface;
     MessageData.Result := 1;
   end;
 end;

procedure TFMain.SetIni(s:string; v:string);
begin
   QLite.Close;
   QLite.sql.Clear;
   Qlite.sql.Add('update ini set val='+QUotedstr(v)+' where name='+QUotedstr(s));
   qlite.ExecSQL;
end;


procedure TFMain.TstartTimer(Sender: TObject);
begin
 Tstart.Enabled:=false;
 BitBtn3.Click;
end;

procedure TFMain.TUpdTimer(Sender: TObject);
begin

  Label1.Caption := FormatFloat(FormatU, Roundto(U.Value, RazU));
  Label2.Caption := FormatFloat(FormatI,Roundto(I.Value, RazI));
  Label3.Caption := FormatFloat(FormatP, Roundto(P.Value, RazP));
  if FSett.Visible then
   begin
    FSett.Label7.Caption := FormatFloat(FormatU, Simpleroundto(U1.Value, RazU));
    FSett.Label8.Caption := FormatFloat(FormatU, Simpleroundto(U2.Value, RazU));
    FSett.Label9.Caption := FormatFloat(FormatU, Simpleroundto(U3.Value, RazU));

    FSett.Label10.Caption := FormatFloat(FormatI, Simpleroundto(I1.Value, RazI));
    FSett.Label11.Caption := FormatFloat(FormatI, Simpleroundto(I2.Value, RazI));
    FSett.Label12.Caption := FormatFloat(FormatI, Simpleroundto(I3.Value, RazI));

    FSett.Label13.Caption := FormatFloat(FormatP, Simpleroundto(P1.Value, RazP));
    FSett.Label14.Caption := FormatFloat(FormatP, Simpleroundto(P2.Value, RazP));
    FSett.Label15.Caption := FormatFloat(FormatP, Simpleroundto(P3.Value, RazP));

   end;

  QtmpUpd.ParamByName('u').AsFloat := Simpleroundto(U.Value, RazU);
  QtmpUpd.ParamByName('i').AsFloat := Simpleroundto(I.Value, RazI);
  QtmpUpd.ParamByName('p').AsFloat := Simpleroundto(P.Value, RazP);

  QtmpUpd.ParamByName('u1').AsFloat := Simpleroundto(U1.Value, RazU);
  QtmpUpd.ParamByName('u2').AsFloat := Simpleroundto(U2.Value, RazU);
  QtmpUpd.ParamByName('u3').AsFloat := Simpleroundto(U3.Value, RazU);

  QtmpUpd.ParamByName('i1').AsFloat := Simpleroundto(I1.Value, RazI);
  QtmpUpd.ParamByName('i2').AsFloat := Simpleroundto(I2.Value, RazI);
  QtmpUpd.ParamByName('i3').AsFloat := Simpleroundto(I3.Value, RazI);

  QtmpUpd.ParamByName('p1').AsFloat := Simpleroundto(P1.Value, RazP);
  QtmpUpd.ParamByName('p2').AsFloat := Simpleroundto(P2.Value, RazP);
  QtmpUpd.ParamByName('p3').AsFloat := Simpleroundto(P3.Value, RazP);

  QtmpUpd.ParamByName('dop').Asstring := CURRPribor;
  QtmpUpd.ExecSQL;

  if CheckBox1.Checked then
  begin
    QTempIns.Close;
    QTempIns.ParamByName('u').AsFloat := Simpleroundto(U.Value, RazU);
    QTempIns.ParamByName('i').AsFloat := Simpleroundto(I.Value, RazI);
    QTempIns.ParamByName('p').AsFloat := Simpleroundto(P.Value, RazP);
    QTempIns.ParamByName('u1').AsFloat := Simpleroundto(U1.Value, RazU);
    QTempIns.ParamByName('u2').AsFloat := Simpleroundto(U2.Value, RazU);
    QTempIns.ParamByName('u3').AsFloat := Simpleroundto(U3.Value, RazU);
    QTempIns.ParamByName('i1').AsFloat := Simpleroundto(I1.Value, RazI);
    QTempIns.ParamByName('i2').AsFloat := Simpleroundto(I2.Value, RazI);
    QTempIns.ParamByName('i3').AsFloat := Simpleroundto(I3.Value, RazI);
    QTempIns.ParamByName('p1').AsFloat := Simpleroundto(P1.Value, RazP);
    QTempIns.ParamByName('p2').AsFloat := Simpleroundto(P2.Value, RazP);
    QTempIns.ParamByName('p3').AsFloat := Simpleroundto(P3.Value, RazP);
    QTempIns.ParamByName('id').AsFloat   := 0;
    QTempIns.ParamByName('dop').Asstring := CURRPribor;
    QTempIns.ExecSQL;
  end;
  if KRTCPConnector1.Stat = cstConnected <> prevstat then
  begin
    if KRTCPConnector1.Stat = cstConnected then
    begin
      Panel1.Color      := clGreen;
      Panel1.Font.Color := clWhite;
      Panel1.Caption:='    Соединен';
      StatusBAr1.Panels[0].Text:= 'Соединен';
      prevstat         := KRTCPConnector1.Stat = cstConnected;
    end
    else
    begin
      Panel1.Color      := clRed;
      Panel1.Font.Color := clBlack;
      Panel1.Caption:='  Разъединен';
      StatusBAr1.Panels[0].Text:= 'Разъединен';
      prevstat         := KRTCPConnector1.Stat = cstConnected;
    end;
  end;

end;

procedure TFMain.UReadCallBack(Sender: TObject; var AError: Integer;
  AData: Pointer);
begin
 //Label1.Caption := FormatFloat('0.00', roundto(U.Value, RazU));
end;

function TFMain.GetIni(s:string):string;
begin
 QIni.close;
 Qini.parambyname('name').Asstring:=s;
 QIni.Open;
 if QIni.RecordCount<>0 then
   GetIni:=Qini.FieldByName('val').Asstring
 else
 begin
   QLite.Close;
   QLite.sql.Clear;
   Qlite.sql.Add('insert into ini (name, val,dop) values('+QUotedstr(s)+','+QUotedstr('0')+','+QUotedstr('AUTO')+');');
   qlite.ExecSQL;
   GetIni:='0';
 end;
end;

procedure TFMain.IReadCallBack(Sender: TObject; var AError: Integer;
  AData: Pointer);
begin
 //Label2.Caption := FormatFloat('0.00', roundto(I.Value, RazI));
end;

procedure TFMain.Panel1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   ReleaseCapture;
  Perform(WM_SysCommand, $F012, 0);
end;

procedure TFMain.Panel1MouseEnter(Sender: TObject);
begin
 Cursor := crSizeAll;
end;

procedure TFMain.Panel1MouseLeave(Sender: TObject);
begin
Cursor := crDefault;
end;

procedure TFMain.PReadCallBack(Sender: TObject; var AError: Integer;
  AData: Pointer);
begin
// Label3.Caption := FormatFloat('0.00', roundto(P.Value, RazP));
end;

procedure TFMain.BitBtn1Click(Sender: TObject);
begin
 FSett.ShowModal;
end;

procedure TFMain.BitBtn2Click(Sender: TObject);
begin
 FMain.Close;
end;

procedure TFMain.BitBtn3Click(Sender: TObject);
begin
  KRTCPConnector1.IP               := GetIni('CURR_IP');
  KRTCPConnector1.Port             := Strtoint(GetIni('CURR_PORT'));
  KRModbusClient1.Addres           := Strtoint(GetIni('CURR_ID'));
  Activated                        := false;
  KRModbusClient1.Active           := false;
  KRModbusMaster1.Active           := false;
  KRTCPConnector1.Active           := false;
  KRTCPConnector1.IP               := GetIni('CURR_IP');

  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('select Dop from ini where name='+QuotedStr('CURR_IP'));
  QTemp.Open;
  CURRPribor:=QTemp.FieldByName('dop').Asstring;
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('select * from pribor where name='+QuotedStr(CURRPribor));
  QTemp.Open;


  U.RegisterIndex:=QTemp.FieldByName('U').AsInteger;
  U1.RegisterIndex:=QTemp.FieldByName('U1').AsInteger;
  U2.RegisterIndex:=QTemp.FieldByName('U2').AsInteger;
  U3.RegisterIndex:=QTemp.FieldByName('U3').AsInteger;
  I.RegisterIndex:=QTemp.FieldByName('I').AsInteger;
  I1.RegisterIndex:=QTemp.FieldByName('I1').AsInteger;
  I2.RegisterIndex:=QTemp.FieldByName('I2').AsInteger;
  I3.RegisterIndex:=QTemp.FieldByName('I3').AsInteger;
  P.RegisterIndex:=QTemp.FieldByName('P').AsInteger;
  P1.RegisterIndex:=QTemp.FieldByName('P1').AsInteger;
  P2.RegisterIndex:=QTemp.FieldByName('P2').AsInteger;
  P3.RegisterIndex:=QTemp.FieldByName('P3').AsInteger;
  KRTCPConnector1.Active           := True;
  KRModbusMaster1.Connector.Active := True;
  KRModbusMaster1.Active           := True;
  KRModbusClient1.Active           := True;
  Activated                        := True;
end;

procedure TFMain.Button7Click(Sender: TObject);
begin
ComPort1.ShowSetupDialog;
end;

procedure TFMain.CheckBox1Click(Sender: TObject);
begin
 if CheckBox1.Checked then
  CheckBox1.Caption:='Сбор данных'
 else
  CheckBox1.Caption:='Остановлен';
end;

procedure TFMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CheckBox1.Checked:=false;
  KRModbusClient1.Active:=false;
  KRModbusMaster1.Active:=false;
  KRTCPConnector1.Active:=false;

  SetIni('LEFT',IntToStr(Fmain.Left));
  SetIni('TOP',IntToStr(Fmain.Top));

 ConLite.Connected:=false;
end;

procedure TFMain.FormCreate(Sender: TObject);
begin
 ConLIte.Params.Database:=Extractfilepath(Application.ExeName)+'SborUIP.sqlite';

 ConLite.Connected:=true;
 QLite.sql.add('CREATE TABLE IF NOT EXISTS pribor ( name VARCHAR (100) PRIMARY KEY  UNIQUE, ');
 QLite.sql.add('u    INTEGER,     u1   INTEGER,     u2   INTEGER,     u3   INTEGER, ');
 QLite.sql.add('i    INTEGER,     i1   INTEGER,     i2   INTEGER,      i3   INTEGER, ');
 QLite.sql.add('p    INTEGER,     p1   INTEGER,     p2   INTEGER,      p3   INTEGER,  ');
 QLite.sql.add('t    INTEGER,     t1   INTEGER,     t2   INTEGER,      t3   INTEGER);  ');
 QLite.ExecSQL;
 QLite.Close;
 QLite.sql.clear;
 QLite.sql.add('CREATE TABLE IF NOT EXISTS ini ( name VARCHAR (100) PRIMARY KEY  UNIQUE, ');
 QLite.sql.add('   val    varchar(1000),     dop varchar(1000));');
 QLite.ExecSQL;
 QLite.Close;
 QLite.sql.clear;
 QLite.sql.add('CREATE TABLE IF NOT EXISTS Stend ( name   VARCHAR (100) PRIMARY KEY  UNIQUE, ');
 QLite.sql.add('   pribor VARCHAR (100) REFERENCES pribor (name) ON DELETE NO ACTION, ');
 QLite.sql.add('   IP     VARCHAR (20), PORT   INTEGER, ID     INTEGER ); ') ;
 QLite.ExecSQL;
 QLite.Close;
 QLite.sql.clear;
 QTempOra.Close;
 QTempOra.SQL.Clear;
 QTempOra.SQL.Add('Update zini set value=' + Quotedstr(FMAin.Caption) +
    ' where name=' + Quotedstr('ElspecFormHeader'));
 QTempOra.ExecSQL;
 QTempOra.Close;

 FMain.left:=Strtoint(GetIni('LEFT'));
 FMain.left:=Strtoint(GetIni('TOP'));
 FMain.Repaint;
 prevstat:=false;
 //BitBtn3.Click;
end;

end.
