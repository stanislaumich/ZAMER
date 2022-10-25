unit UMAin;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Wininet, Inifiles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Comp.UI, Vcl.Grids, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, ustr, ShellApi,
  System.Actions, Vcl.ActnList;
type
  TFMainUpdater = class(TForm)
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Memo1: TMemo;
    FDC: TFDConnection;
    GroupBox2: TGroupBox;
    StringGrid1: TStringGrid;
    BitBtn4: TBitBtn;
    QueryList: TFDQuery;
    ActionList1: TActionList;
    Action1: TAction;
    QTemp: TFDQuery;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    function MakeOne(n:integer):boolean;
    function MakeAll(fini:string):boolean;
    procedure Action1Execute(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  FMainUpdater: TFMainUpdater;

const
 dbname='update.sqlite';
implementation
{$R *.dfm}
uses UFile;

procedure Log(s:string);
 begin
  FMainUpdater.Memo1.Lines.Add(s);
 end;
//----------------------------------------------------------------
function GetInetFile(const fileURL, FileName: string): boolean;
const
  BufferSize = 1024;
var
  hSession, hURL: HInternet;
  Buffer: array[1..BufferSize] of Byte;
  BufferLen: DWORD;
  f: file;
  sAppName: string;
begin
  Result := False;
  sAppName := ExtractFileName(Application.ExeName);
  hSession := InternetOpen(PChar(sAppName),
  INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  try
    hURL := InternetOpenURL(hSession, PChar(fileURL), nil, 0, 0, 0);
    try
      AssignFile(f, FileName);
      Rewrite(f,1);
      repeat
        InternetReadFile(hURL, @Buffer, SizeOf(Buffer), BufferLen);
        BlockWrite(f, Buffer, BufferLen);
      until
        BufferLen = 0;
      CloseFile(f);
      Result := True;
    finally
      InternetCloseHandle(hURL);
    end;
  finally
    InternetCloseHandle(hSession);
  end;
end;
//----------------------------------------------------------------
//----------------------------------------------------------------
function TFMainUpdater.MakeOne(n:integer):boolean;
 var
  s:string;
  fin:string;
begin
 //fin:=extractfilepath(paramstr(0))+datetostr(date)+strreplace(timetostr(time),':','-')+'.tmp';
 fin:=extractfilepath(paramstr(0))+'tmp';
 Log('Секция: ' + Stringgrid1.cells[0,n]);
 Log('Скачиваем');
 if GetInetFile(Stringgrid1.cells[1,n], fin) then
  begin
   Log('Файл загружен');
  end
 else
  begin
   Log('Не удалось загрузить файл');
   Exit;
  end;
  //ShellExecute(Handle, 'open', PWideChar(Stringgrid1.cells[3,n]), nil, nil, SW_SHOWNORMAL);
  if Stringgrid1.cells[3,n]<>'' then
  begin
   Log('Команда до обновления '+Stringgrid1.cells[3,n]);
   ExecAndWait(PWideChar(Stringgrid1.cells[3,n]));
  end
   else
  Log('Команды до обновления нет');
  pause(1000);
 if RenameFile(fin, Stringgrid1.cells[2,n]) then
  Log('Обновлено.')
 else
  begin
   Log('Ошибка обновления, возможно файл открыт?');
   Exit;
  end;
 DeleteFile(fin);
 if Stringgrid1.cells[4,n]<>'' then
  begin
   Log('Команда после обновления '+Stringgrid1.cells[4,n]);
   ExecAndWait(PWideChar(Stringgrid1.cells[4,n]));
  end
 else
  Log('Команды после обновления нет');
 Log('Секция завершена');
 Log('');
end;
//----------------------------------------------------------------
function TFMainUpdater.MakeAll(fini:string):boolean;
var
 n:integer;
begin

end;
//----------------------------------------------------------------
procedure TFMainUpdater.Action1Execute(Sender: TObject);
begin
 BitBtn1.Click;
end;

procedure TFMainUpdater.BitBtn1Click(Sender: TObject);
var
 i:integer;
begin
 for i:=1 to Stringgrid1.Rowcount-1 do
  begin
   Stringgrid1.Row:=i;
   BitBtn4.Click;
  end;
 Memo1.Lines.SaveToFile(Extractfilepath(paramstr(0))+''+datetostr(date)+'.log');
end;

procedure TFMainUpdater.BitBtn2Click(Sender: TObject);
begin
   FFile.ShowModal;
end;

procedure TFMainUpdater.BitBtn3Click(Sender: TObject);
begin
 FFile.showmodal;
end;
procedure TFMainUpdater.BitBtn4Click(Sender: TObject);
var
 s: string;
begin
 MakeOne(Stringgrid1.row);
end;

procedure TFMainUpdater.FormCreate(Sender: TObject);
var
 i:integer;
begin
 Log('Открываю БД '+Extractfilepath(paramstr(0))+''+dbname);
 Log('');
 FDC.Params.Database:=Extractfilepath(paramstr(0))+''+dbname;
 FDC.connected:=true;

 QTemp.Close;
 QTemp.SQL.Clear;
 QTEMP.SQL.Add('CREATE TABLE IF NOT EXISTS list (id INTEGER, "before" VARCHAR (250),');
 QTEMP.SQL.Add('url VARCHAR (1000), path VARCHAR (1000), "after" VARCHAR (250), nm VARCHAR (250), dop VARCHAR (250))');
 QTEMP.ExecSQL;
 Querylist.Open;
 i:=1;
 While not QueryList.Eof do
  begin
   Stringgrid1.cells[0,i]:=QueryList.FieldByName('nm').AsString;
   Stringgrid1.cells[1,i]:=QueryList.FieldByName('url').AsString;
   Stringgrid1.cells[2,i]:=QueryList.FieldByName('path').AsString;
   Stringgrid1.cells[3,i]:=QueryList.FieldByName('before').AsString;
   Stringgrid1.cells[4,i]:=QueryList.FieldByName('after').AsString;
   QueryList.Next;
   i:=i+1;
   Stringgrid1.RowCount:=Stringgrid1.RowCount+1;
  end;
 Stringgrid1.RowCount:=Stringgrid1.RowCount-1;
 FDC.connected:=false;
end;

end.
