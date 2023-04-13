unit Usett;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.Oracle,
  FireDAC.Phys.OracleDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
 vr = record
   name:string;
   color:word;
   sz:integer;
   x,y:integer;
   before, after:string;
 end;


  TFSett = class(TForm)
    FDC: TFDConnection;
    QTemp: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
      u,i,p,m,n,pw:vr;
  end;

var
  FSett: TFSett;

implementation
 uses umain;
{$R *.dfm}

procedure TFSett.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
QTemp.Close;
QTemp.sql.Clear;
QTemp.SQL.Add('update zini set value = '+Inttostr(FMain.left)+' where name='+Quotedstr('BIGL'));
QTemp.ExecSQL;

QTemp.Close;
QTemp.sql.Clear;
QTemp.SQL.Add('update zini set value = '+Inttostr(FMain.top)+' where name='+Quotedstr('BIGT'));
QTemp.ExecSQL;

QTemp.Close;
QTemp.sql.Clear;
QTemp.SQL.Add('update zini set value = '+Inttostr(FMain.height)+' where name='+Quotedstr('BIGH'));
QTemp.ExecSQL;

QTemp.Close;
QTemp.sql.Clear;
QTemp.SQL.Add('update zini set value = '+Inttostr(FMain.width)+' where name='+Quotedstr('BIGW'));
QTemp.ExecSQL;

end;

procedure TFSett.FormCreate(Sender: TObject);
begin
QTemp.Open('select * from zini where name='+Quotedstr('BIGL'));
FMain.left:=QTemp.FieldByName('value').Asinteger;
QTemp.Open('select * from zini where name='+Quotedstr('BIGT'));
FMain.top:=QTemp.FieldByName('value').Asinteger;
QTemp.Open('select * from zini where name='+Quotedstr('BIGH'));
FMain.height:=QTemp.FieldByName('value').Asinteger;
QTemp.Open('select * from zini where name='+Quotedstr('BIGW'));
FMain.width:=QTemp.FieldByName('value').Asinteger;
FMain.Repaint;


QTemp.Open('select * from zbig where name='+Quotedstr('U'));
u.name:='u';
u.color:=QTemp.FieldByName('color').AsInteger;
u.sz:=QTemp.FieldByName('sz').AsInteger;
u.x:=QTemp.FieldByName('x').AsInteger;
u.y:=QTemp.FieldByName('y').AsInteger;
u.before:=QTemp.FieldByName('before').AsString;
u.after:=QTemp.FieldByName('after').AsString;
QTemp.Close;
QTemp.SQL.Clear;



end;

end.
