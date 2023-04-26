unit Usett;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.Oracle,
  FireDAC.Phys.OracleDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons;

type
 vr = record
   name:string;
   color:longint;
   sz:integer;
   x,y:integer;
   before, after:string;
 end;


  TFSett = class(TForm)
    FDC: TFDConnection;
    QTemp: TFDQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    FDTable1: TFDTable;
    Panel1: TPanel;
    Button1: TButton;
    ColorDialog1: TColorDialog;
    DBEdit1: TDBEdit;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBEdit1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
      u,i,p,m,n,pw:vr;
      Procedure fill;
  end;

var
  FSett: TFSett;

implementation
 uses umain;
{$R *.dfm}

procedure TFSett.Button1Click(Sender: TObject);
begin
 If ColorDialog1.Execute() then
  begin
    FDTable1.Edit;
    dbEdit1.Text:=Inttostr(ColorDialog1.Color);
    Panel1.Font.Color:=ColorDialog1.Color;

    FDTable1.Post;
  end;
end;

procedure TFSett.Fill;

begin

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

QTemp.Open('select * from zbig where name='+Quotedstr('I'));
i.name:='i';
i.color:=QTemp.FieldByName('color').AsInteger;
i.sz:=QTemp.FieldByName('sz').AsInteger;
i.x:=QTemp.FieldByName('x').AsInteger;
i.y:=QTemp.FieldByName('y').AsInteger;
i.before:=QTemp.FieldByName('before').AsString;
i.after:=QTemp.FieldByName('after').AsString;
QTemp.Close;
QTemp.SQL.Clear;

QTemp.Open('select * from zbig where name='+Quotedstr('P'));
p.name:='p';
p.color:=QTemp.FieldByName('color').AsInteger;
p.sz:=QTemp.FieldByName('sz').AsInteger;
p.x:=QTemp.FieldByName('x').AsInteger;
p.y:=QTemp.FieldByName('y').AsInteger;
p.before:=QTemp.FieldByName('before').AsString;
p.after:=QTemp.FieldByName('after').AsString;
QTemp.Close;
QTemp.SQL.Clear;

QTemp.Open('select * from zbig where name='+Quotedstr('M'));
m.name:='m';
m.color:=QTemp.FieldByName('color').AsInteger;
m.sz:=QTemp.FieldByName('sz').AsInteger;
m.x:=QTemp.FieldByName('x').AsInteger;
m.y:=QTemp.FieldByName('y').AsInteger;
m.before:=QTemp.FieldByName('before').AsString;
m.after:=QTemp.FieldByName('after').AsString;
QTemp.Close;
QTemp.SQL.Clear;

QTemp.Open('select * from zbig where name='+Quotedstr('N'));
n.name:='n';
n.color:=QTemp.FieldByName('color').AsInteger;
n.sz:=QTemp.FieldByName('sz').AsInteger;
n.x:=QTemp.FieldByName('x').AsInteger;
n.y:=QTemp.FieldByName('y').AsInteger;
n.before:=QTemp.FieldByName('before').AsString;
n.after:=QTemp.FieldByName('after').AsString;
QTemp.Close;
QTemp.SQL.Clear;

QTemp.Open('select * from zbig where name='+Quotedstr('Pw'));
pw.name:='pw';
pw.color:=QTemp.FieldByName('color').AsInteger;
pw.sz:=QTemp.FieldByName('sz').AsInteger;
pw.x:=QTemp.FieldByName('x').AsInteger;
pw.y:=QTemp.FieldByName('y').AsInteger;
pw.before:=QTemp.FieldByName('before').AsString;
pw.after:=QTemp.FieldByName('after').AsString;
QTemp.Close;
QTemp.SQL.Clear;


end;

procedure TFSett.Button2Click(Sender: TObject);
begin
 Fill;
 FMain.Button1.Click;
end;

procedure TFSett.DBEdit1Click(Sender: TObject);
begin
DbEdit1.Text:=Dbedit1.Text;
end;

procedure TFSett.DBGrid1CellClick(Column: TColumn);
begin
 Panel1.Font.Color:=FDTable1.FieldByName('COLOR').AsLargeInt;
end;

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

QTemp.Open('select * from zbig where name='+Quotedstr('I'));
i.name:='i';
i.color:=QTemp.FieldByName('color').AsInteger;
i.sz:=QTemp.FieldByName('sz').AsInteger;
i.x:=QTemp.FieldByName('x').AsInteger;
i.y:=QTemp.FieldByName('y').AsInteger;
i.before:=QTemp.FieldByName('before').AsString;
i.after:=QTemp.FieldByName('after').AsString;
QTemp.Close;
QTemp.SQL.Clear;

QTemp.Open('select * from zbig where name='+Quotedstr('P'));
p.name:='p';
p.color:=QTemp.FieldByName('color').AsInteger;
p.sz:=QTemp.FieldByName('sz').AsInteger;
p.x:=QTemp.FieldByName('x').AsInteger;
p.y:=QTemp.FieldByName('y').AsInteger;
p.before:=QTemp.FieldByName('before').AsString;
p.after:=QTemp.FieldByName('after').AsString;
QTemp.Close;
QTemp.SQL.Clear;

QTemp.Open('select * from zbig where name='+Quotedstr('M'));
m.name:='m';
m.color:=QTemp.FieldByName('color').AsInteger;
m.sz:=QTemp.FieldByName('sz').AsInteger;
m.x:=QTemp.FieldByName('x').AsInteger;
m.y:=QTemp.FieldByName('y').AsInteger;
m.before:=QTemp.FieldByName('before').AsString;
m.after:=QTemp.FieldByName('after').AsString;
QTemp.Close;
QTemp.SQL.Clear;

QTemp.Open('select * from zbig where name='+Quotedstr('N'));
n.name:='n';
n.color:=QTemp.FieldByName('color').AsInteger;
n.sz:=QTemp.FieldByName('sz').AsInteger;
n.x:=QTemp.FieldByName('x').AsInteger;
n.y:=QTemp.FieldByName('y').AsInteger;
n.before:=QTemp.FieldByName('before').AsString;
n.after:=QTemp.FieldByName('after').AsString;
QTemp.Close;
QTemp.SQL.Clear;

QTemp.Open('select * from zbig where name='+Quotedstr('Pw'));
pw.name:='pw';
pw.color:=QTemp.FieldByName('color').AsInteger;
pw.sz:=QTemp.FieldByName('sz').AsInteger;
pw.x:=QTemp.FieldByName('x').AsInteger;
pw.y:=QTemp.FieldByName('y').AsInteger;
pw.before:=QTemp.FieldByName('before').AsString;
pw.after:=QTemp.FieldByName('after').AsString;
QTemp.Close;
QTemp.SQL.Clear;

end;

end.
