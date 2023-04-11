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
  KRModbusClient, KRModbusMaster, KRConnector, KRTCPConnector, Math;

 CONST
  RAZU = 2;


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
    KRTCPConnector1: TKRTCPConnector;
    KRModbusMaster1: TKRModbusMaster;
    KRModbusClient1: TKRModbusClient;
    BitBtn3: TBitBtn;
    TUpd: TTimer;
    U: TKRMBRegister;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    function GetIni(s:string):string;
    procedure SetIni(s:string; v:string);
    procedure BitBtn3Click(Sender: TObject);
    procedure TUpdTimer(Sender: TObject);
    procedure UValUpdated(Sender: TObject; Variable: TKRVariable);
  private
   procedure GetData(var MessageData: TWMCopyData); message WM_COPYDATA;
  public

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


procedure TFMain.TUpdTimer(Sender: TObject);
begin
  Label1.Caption := FormatFloat('0.00', roundto(U.Value, RazU));
 { Label5.Caption := FormatFloat('0.000', Simpleroundto(ISred.Value, RazI));
  Label6.Caption := FormatFloat('0.0', Simpleroundto(PSred.Value, RazP));
  if CheckBox3.Checked then
  begin
    FBig.Label4.Caption := Label4.Caption;
    FBig.Label5.Caption := Label5.Caption;
    FBig.Label6.Caption := Label6.Caption;
  end;
  if CheckBox1.Checked then
  begin
    Label10.Caption := FormatFloat('0.00', Simpleroundto(U1.Value, RazU));
    Label11.Caption := FormatFloat('0.00', Simpleroundto(U2.Value, RazU));
    Label12.Caption := FormatFloat('0.00', Simpleroundto(U3.Value, RazU));

    Label15.Caption := FormatFloat('0.000', Simpleroundto(I1.Value, RazI));
    Label16.Caption := FormatFloat('0.000', Simpleroundto(I2.Value, RazI));
    Label17.Caption := FormatFloat('0.000', Simpleroundto(I3.Value, RazI));

    Label18.Caption := FormatFloat('0.0', Simpleroundto(P1.Value, RazP));
    Label19.Caption := FormatFloat('0.0', Simpleroundto(P2.Value, RazP));
    Label20.Caption := FormatFloat('0.0', Simpleroundto(P3.Value, RazP));
  end;

  QtmpUpd.ParamByName('u').AsFloat := Simpleroundto(USred.Value, RazU);
  QtmpUpd.ParamByName('i').AsFloat := Simpleroundto(ISred.Value, RazI);
  QtmpUpd.ParamByName('p').AsFloat := Simpleroundto(PSred.Value, RazP);

  QtmpUpd.ParamByName('u1').AsFloat := Simpleroundto(U1.Value, RazU);
  QtmpUpd.ParamByName('u2').AsFloat := Simpleroundto(U2.Value, RazU);
  QtmpUpd.ParamByName('u3').AsFloat := Simpleroundto(U3.Value, RazU);

  QtmpUpd.ParamByName('i1').AsFloat := Simpleroundto(I1.Value, RazI);
  QtmpUpd.ParamByName('i2').AsFloat := Simpleroundto(I2.Value, RazI);
  QtmpUpd.ParamByName('i3').AsFloat := Simpleroundto(I3.Value, RazI);

  QtmpUpd.ParamByName('p1').AsFloat := Simpleroundto(P1.Value, RazP);
  QtmpUpd.ParamByName('p2').AsFloat := Simpleroundto(P2.Value, RazP);
  QtmpUpd.ParamByName('p3').AsFloat := Simpleroundto(P3.Value, RazP);

  QtmpUpd.ParamByName('dop').Asstring := '';
  QtmpUpd.ExecSQL;
  }
  if CheckBox1.Checked then
  begin
   { QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add
      ('INSERT INTO ZAMER.ZELSPEC (ID, U, I, P, U1, U2,U3, I1, I2, I3, DOP, p1, p2, p3) VALUES '+
      '( :ID ,:u ,:I ,:P ,:U1,:U2,:U3,:I1,:I2,:I3, :DOP,:p1,:p2,:p3)');
    QTemp.ParamByName('u').AsFloat := Simpleroundto(USred.Value, RazU);
    QTemp.ParamByName('i').AsFloat := Simpleroundto(ISred.Value, RazI);
    QTemp.ParamByName('p').AsFloat := Simpleroundto(PSred.Value, RazP);

    QTemp.ParamByName('u1').AsFloat := Simpleroundto(U1.Value, RazU);
    QTemp.ParamByName('u2').AsFloat := Simpleroundto(U2.Value, RazU);
    QTemp.ParamByName('u3').AsFloat := Simpleroundto(U3.Value, RazU);

    QTemp.ParamByName('i1').AsFloat := Simpleroundto(I1.Value, RazI);
    QTemp.ParamByName('i2').AsFloat := Simpleroundto(I2.Value, RazI);
    QTemp.ParamByName('i3').AsFloat := Simpleroundto(I3.Value, RazI);

    QTemp.ParamByName('p1').AsFloat := Simpleroundto(P1.Value, RazP);
    QTemp.ParamByName('p2').AsFloat := Simpleroundto(P2.Value, RazP);
    QTemp.ParamByName('p3').AsFloat := Simpleroundto(P3.Value, RazP);

    QTemp.ParamByName('id').AsFloat   := 0;
    QTemp.ParamByName('dop').Asstring := '';
    QTemp.ExecSQL;
    }
  end;
  if KRTCPConnector1.Stat = cstConnected <> prevstat then
  begin
    if KRTCPConnector1.Stat = cstConnected then
    begin
      Panel1.Color      := clGreen;
      Panel1.Font.Color := clWhite;
      Panel1.Caption:='    Соединен';
      StatusBAr1.Panels[0].Text:= FSett.Edit1.Text;
      prevstat         := KRTCPConnector1.Stat = cstConnected;
    end
    else
    begin
      Panel1.Color      := clRed;
      Panel1.Font.Color := clBlack;
      Panel1.Caption:='  Разъединен';
      StatusBAr1.Panels[0].Text:= '0.0.0.0';
      prevstat         := KRTCPConnector1.Stat = cstConnected;
    end;
  end;

end;

procedure TFMain.UValUpdated(Sender: TObject; Variable: TKRVariable);
begin
//  Label1.Caption:= FormatFloat('0.00', roundto(U.Value, RazU));
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
  KRTCPConnector1.IP               := FSett.Edit1.Text;
  KRTCPConnector1.Port             := StrtoInt(FSett.Edit2.Text);
  KRModbusClient1.Addres           := StrtoInt(FSett.Edit3.Text);
  Activated                        := false;
  KRModbusClient1.Active           := false;
  KRModbusMaster1.Active           := false;
  KRTCPConnector1.Active           := false;
  KRTCPConnector1.IP               := FSett.Edit1.Text;
  KRTCPConnector1.Active           := True;
  KRModbusMaster1.Connector.Active := True;
  KRModbusMaster1.Active           := True;
  KRModbusClient1.Active           := True;
  Activated                        := True;
end;

procedure TFMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CheckBox1.Checked:=false;
  SetIni('LEFT',IntToStr(Fmain.Left));
  SetIni('TOP',IntToStr(Fmain.Top));

 ConLite.Connected:=false;
end;

procedure TFMain.FormCreate(Sender: TObject);
begin
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



 FMain.left:=Strtoint(GetIni('LEFT'));
 FMain.left:=Strtoint(GetIni('TOP'));
 FMain.Repaint;
 prevstat:=false;
 BitBtn3.Click;
end;

end.
