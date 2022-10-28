unit UFile;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids;
type
  TFFile = class(TForm)
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Button2: TButton;
    Button3: TButton;
    QTemp: TFDQuery;
    GroupBox2: TGroupBox;
    StringGrid1: TStringGrid;
    BitBtn3: TBitBtn;
    OpenDialog1: TOpenDialog;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SGRClear;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure StringGrid1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  FFile: TFFile;
implementation
{$R *.dfm}
 uses UMain;


procedure TFFile.SGRClear;
 var
 i,j:integer;
begin
 for i:=1 to stringgrid1.Colcount-1 do
  for j:=1 to stringgrid1.Rowcount-1 do
   Stringgrid1.cells[i,j]:='';
   Stringgrid1.Rowcount:=2;
end;


procedure TFFile.StringGrid1Click(Sender: TObject);
begin
 Edit1.Text:=Stringgrid1.cells[0,Stringgrid1.row];
 Edit2.Text:=Stringgrid1.cells[1,Stringgrid1.row];
 Edit3.Text:=Stringgrid1.cells[2,Stringgrid1.row];
 Edit4.Text:=Stringgrid1.cells[3,Stringgrid1.row];
 Edit5.Text:=Stringgrid1.cells[4,Stringgrid1.row];
end;

procedure TFFile.BitBtn1Click(Sender: TObject);
var i:integer;
begin
 QTemp.Close;
 QTEmp.SQL.Clear;
 QTEMP.SQL.Add('delete from list where nm='+Quotedstr(Edit1.Text));
 QTemp.ExecSQL;
 QTemp.Close;
 QTEmp.SQL.Clear;
 QTEMP.SQL.Add('INSERT INTO list ( id, [before], url, path, [after], nm, dop) VALUES (');
 QTEMP.SQL.Add('0,:before, :url, :path, :after,:nm,:dop )');
 QTemp.ParamByName('nm').Asstring:=Edit1.Text;
 QTemp.ParamByName('url').Asstring:=Edit2.Text;
 QTemp.ParamByName('path').Asstring:=Edit3.Text;
 QTemp.ParamByName('before').Asstring:=Edit4.Text;
 QTemp.ParamByName('after').Asstring:=Edit5.Text;
 QTemp.ParamByName('dop').Asstring:='programm';
 QTemp.ExecSQL;
 QTemp.SQL.Clear;
 QTEMP.SQL.Add('select * from list');
 QTemp.Open;
 SGRClear;
 i:=1;
 While not QTemp.Eof do
  begin
   Stringgrid1.cells[0,i]:=QTemp.FieldByName('nm').AsString;
   Stringgrid1.cells[1,i]:=QTemp.FieldByName('url').AsString;
   Stringgrid1.cells[2,i]:=QTemp.FieldByName('path').AsString;
   Stringgrid1.cells[3,i]:=QTemp.FieldByName('before').AsString;
   Stringgrid1.cells[4,i]:=QTemp.FieldByName('after').AsString;
   QTemp.Next;
   i:=i+1;
   Stringgrid1.RowCount:=Stringgrid1.RowCount+1;
  end;
 Stringgrid1.RowCount:=Stringgrid1.RowCount-1;
 QTemp.Close;
 Edit1.Text:='';
 Edit2.Text:='';
 Edit3.Text:='';
 Edit4.Text:='';
 Edit5.Text:='';
end;

procedure TFFile.BitBtn2Click(Sender: TObject);
begin
 FMainUpdater.FDC.connected:=false;
 FFile.Close;
end;

procedure TFFile.BitBtn3Click(Sender: TObject);
var
 i:integer;
begin
 QTemp.Close;
 QTemp.SQL.Clear;
 QTEMP.SQL.Add('delete from list where nm='+Quotedstr(Stringgrid1.cells[0,Stringgrid1.row]));
 QTemp.Execsql;
 QTemp.SQL.Clear;
 QTEMP.SQL.Add('select * from list');
 QTemp.Open;
 SGRClear;
 i:=1;
 While not QTemp.Eof do
  begin
   Stringgrid1.cells[0,i]:=QTemp.FieldByName('nm').AsString;
   Stringgrid1.cells[1,i]:=QTemp.FieldByName('url').AsString;
   Stringgrid1.cells[2,i]:=QTemp.FieldByName('path').AsString;
   Stringgrid1.cells[3,i]:=QTemp.FieldByName('before').AsString;
   Stringgrid1.cells[4,i]:=QTemp.FieldByName('after').AsString;
   QTemp.Next;
   i:=i+1;
   Stringgrid1.RowCount:=Stringgrid1.RowCount+1;
  end;
 Stringgrid1.RowCount:=Stringgrid1.RowCount-1;
 QTemp.Close;


end;

procedure TFFile.Button1Click(Sender: TObject);
begin
 If OpenDialog1.Execute() then
  Edit3.Text:=OpenDialog1.Filename;
end;

procedure TFFile.Button2Click(Sender: TObject);
begin
 If OpenDialog1.Execute() then
  Edit4.Text:=OpenDialog1.Filename;
end;

procedure TFFile.Button3Click(Sender: TObject);
begin
 If OpenDialog1.Execute() then
  Edit5.Text:=OpenDialog1.Filename;
end;

procedure TFFile.FormActivate(Sender: TObject);
var
 i:integer;
begin
 FMainUpdater.FDC.Params.Database:=Extractfilepath(paramstr(0))+''+dbname;
 FMainUpdater.FDC.connected:=true;
 QTemp.SQL.Clear;
 QTEMP.SQL.Add('select * from list');
 QTemp.Open;
 SGRClear;
   Stringgrid1.cells[0,0]:='Компонент';
   Stringgrid1.cells[1,0]:='Ссылка';
   Stringgrid1.cells[2,0]:='Локальный путь';
   Stringgrid1.cells[3,0]:='Команда до';
   Stringgrid1.cells[4,0]:='Команда после';
 i:=1;
 While not QTemp.Eof do
  begin
   Stringgrid1.cells[0,i]:=QTemp.FieldByName('nm').AsString;
   Stringgrid1.cells[1,i]:=QTemp.FieldByName('url').AsString;
   Stringgrid1.cells[2,i]:=QTemp.FieldByName('path').AsString;
   Stringgrid1.cells[3,i]:=QTemp.FieldByName('before').AsString;
   Stringgrid1.cells[4,i]:=QTemp.FieldByName('after').AsString;
   QTemp.Next;
   i:=i+1;
   Stringgrid1.RowCount:=Stringgrid1.RowCount+1;
  end;
 Stringgrid1.RowCount:=Stringgrid1.RowCount-1;
 QTemp.Close;
end;

procedure TFFile.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 FMainUpdater.FDC.connected:=false;
end;

end.
