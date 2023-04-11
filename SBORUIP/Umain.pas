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
  FireDAC.DApt, FireDAC.Comp.DataSet;

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
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    function GetIni(s:string):string;
    procedure SetIni(s:string; v:string);
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
    //ShowMessage('1111111');
    CheckBox1.Checked:=true;
    CheckBox1.Caption:='—бор данных';
    Panel2.Color:=clGreen;
     MessageData.Result := 1;
  end
  else
   begin
    //ShowMessage('0000000');
    CheckBox1.Checked:=false;
    CheckBox1.Caption:='ќстановлен';
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

procedure TFMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
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
end;

end.
