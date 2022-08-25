unit Ustr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  comctrls, ShellAPI, ShlObj, grids;

// ==============================================================================
const
  cpWin  = 01;
  cpAlt  = 02;
  cpKoi  = 03;
  AltSet = ['А' .. 'Я', 'а' .. 'п', 'р' .. 'я'];
  KoiSet = ['Б' .. 'Р', 'Т' .. 'С'];
  WinSet = ['а' .. 'п', 'р' .. #255];

type
  ArrOfStr = array of string;

  MyRec = record
    serkod: integer;
    summa: real;
  end;

  A = array [byte] of MyRec;

var
  MaskString: string;
  dates     : array [1 .. 12] of integer = (
    31,
    28,
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31
  );

  lat: array [1 .. 26] of char = (
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  );
  rus: array [1 .. 26] of char = (
    'А',
    'В',
    'С',
    'D',
    'Е',
    'F',
    'G',
    'Н',
    'I',
    'J',
    'К',
    'L',
    'М',
    'N',
    'О',
    'Р',
    'Q',
    'R',
    'S',
    'Т',
    'U',
    'V',
    'W',
    'Х',
    'Y',
    'Z'
  );
  russet: set of char = ['А', 'В', 'С', 'Е', 'Н', 'К', 'М', 'О', 'Р', 'Т', 'Х'];

  Bufsize: longint;

  tsql: string;
  // ==============================================================================
procedure Progress2status(p: tprogressbar; s: tstatusbar);

// ======== SQLite3
// procedure fillstringgrid(sldb:TSQLiteDatabase; stringgrid1:tstringgrid; ssql:string; f:integer);
// procedure fillcombobox  (sldb:TSQLiteDatabase; combobox1:tcombobox; ssql:string);
// function  savestringgrid(sldb:TSQLiteDatabase; stringgrid : tstringgrid; tbname:string):string;
// function instringrec(sldb:TSQLiteDatabase; stringgrid : tstringgrid; tbname:string; n:longint):integer;
// function createstringgridtable(sldb:tsqlitedatabase; stringgrid : tstringgrid; tbname:string):string;


// ======== SQLite3

function parsehome(hin: string; var h_num, h_let, h_drob,
  h_korp: string): boolean;
function parseflat(fin: string; var f_num: string; var f_let: string): boolean;
procedure address(s: string; var street: string; var home: string;
  var flat: string);

function explode(sPart, sInput: string): ArrOfStr;
function implode(sPart: string; arrInp: ArrOfStr): string;
procedure sort(arrInp: ArrOfStr);
procedure rsort(arrInp: ArrOfStr);

// str - исходная строка
// str1 - подстрока, подлежащая замене
// str2 - заменяющая строка
function nvl(s: string): string;
function StrReplace(const Str, Str1, Str2: string): string;
// str - исходная строка
// str1 - подстрока, подлежащая замене
// str2 - заменяющая строка
function pnext(del: string; var s: string): string;
function pnexte(del: string; var s: string): string;
Function lTrim(var s: string): string;
Function Trims(s: string): string;
Function Count_pos(s: string): integer;
function Mypos(s: string; d: string; p: integer): string;
function MyposReplace(sin: string; d: string; p: integer; sub: string): string;

function DetermineCodepage(const st: string): byte;
function DosToWin(st: string): string;
function WinToDos(st: string): string;

function CreateDirEx(Dir: string): boolean;
Procedure ListFileDir(Path: string; FileList: TStrings; mask: string);

function myif(s1: string; s2: string; s3: string; s4: string): string;

function GetDate(f: char; dt: tdatetime): string;
Function parsedatetimeget(s: string; d: tdatetime): string;
Function parsedatetime(s: string): string;
Function ParseOracleDate(s: string): string;
function datetosqlite(s: string): string;
Function ParseMySQLDate(s: string): string;
function ConvertBankDateToDate(s: string): string;
// function ConvertDateToBankDate(s:string):string;
function strmonth(d: tdatetime; caps: boolean): string;
function strmonthd(d: tdatetime; caps: boolean): string;
function invalid(s: string): boolean;
function validatedate(s: string): boolean;
function testnum(s: string): boolean;

procedure nop;
procedure pause(t: int64);

function CopyFile(FromPath, ToPath: string): integer;
function CopyFileProgress(FromPath, ToPath: string; p: tprogressbar): integer;
Function FileMove(fs1, fs2: string; del: integer): integer;
procedure StartProg(handle: thandle; prog, param: string);
procedure StartCMD(handle: thandle; param: string);
function ExecAndWait(aCmd: string; WaitTimeOut: cardinal = INFINITE): cardinal;
procedure Copyfilewin(handle: thandle; from, tof: string);
function FExist(s: string): boolean;
Function OpenFolder(form1: tform): string;
function Getfiles(Memo1: TMemo; ext: string): boolean;

function procent(org: double; pr: double): double;
function percent(A, b: double): double;

// Function proportional(summa:string; summap:string; q1:tquery; q2:tquery):A;
// ==============================================================================
implementation

// uses Unit1;

function myif(s1: string; s2: string; s3: string; s4: string): string;
begin
  if s1 = s2 then
    result := s3
  else
    result := s4;
end;

function nvl(s: string): string;
begin
  result := s;
  if s = '' then
    result := ' ';
end;

// ==========================  DB SQLite 3  ========================

{ procedure fillstringgrid(sldb:TSQLiteDatabase; stringgrid1:tstringgrid; ssql:string;f:integer);
  var
  i,j:cardinal;
  sltb:TSQLIteTable;
  begin
  sltb:=sldb.gettable(ssql);
  // ============ do not likes empty table
  if sltb.Count=0 then exit;
  // ======================================
  stringgrid1.ColCount:=sltb.ColCount;
  stringgrid1.RowCount:=sltb.RowCount+1;
  stringgrid1.repaint;
  // fill headers
  if f=1 then
  for i:=0 to sltb.colcount-1 do
  begin
  stringgrid1.Cells[i,0]:='('+inttostr(i)+')-';
  stringgrid1.Cells[i,0]:=stringgrid1.Cells[i,0] + utf8decode(sltb.columns[i]);
  end;
  // -- END -- fill headers
  j:=0;
  while not sltb.EOF do
  begin
  for i:=0 to sltb.colcount-1 do
  begin
  stringgrid1.Cells[i,j+1]:=utf8decode(sltb.FieldAsString(i));
  end;
  sltb.Next;
  inc(j);
  end;
  stringgrid1.repaint;
  sltb.Free;
  end;

  procedure fillcombobox(sldb:TSQLiteDatabase; combobox1:tcombobox; ssql:string);
  var
  sltb:tsqlitetable;
  begin
  sltb:=sldb.gettable(ssql);
  while not sltb.EOF do
  begin
  combobox1.items.add(utf8decode(sltb.FieldAsString(0)));
  sltb.Next;
  end;
  combobox1.text:='';
  sltb.Free;
  end;

  function instringrec(sldb:TSQLiteDatabase; stringgrid : tstringgrid; tbname:string; n:longint):integer;
  // insert record in table from position
  var
  i:longint;
  s:string;
  begin
  tsql:='insert into '+tbname+' (';
  for i:=0 to stringgrid.ColCount-1 do
  begin
  s:=stringgrid.Cells[i,0];
  delete(s,1,pos('-',s));
  s:=utf8encode(s);
  if i= stringgrid.ColCount-1 then
  tsql:=tsql+s+') values ("'
  else tsql:=tsql+S+', ';
  end;
  for i:=0 to stringgrid.ColCount-1 do
  begin
  s:=stringgrid.Cells[i,n];
  s:=utf8encode(s);
  if i= stringgrid.ColCount-1 then
  tsql:=tsql+s+'");'
  else tsql:=tsql+s+'", "';
  end;
  sldb.ExecSQL(tsql);
  instringrec:=0;
  end;


  function savestringgrid(sldb:TSQLiteDatabase; stringgrid : tstringgrid; tbname:string):string;
  var
  i:longint;
  // s:string;
  begin
  sldb.BeginTransaction;
  tsql:='drop table if exists '+tbname+'_old;';
  sldb.ExecSQL(tsql);
  tsql:='alter table '+tbname+' rename to '+ tbname+'_old;';
  sldb.ExecSQL(tsql);
  createstringgridtable(sldb,stringgrid,'worker');
  //
  for i:=1 to stringgrid.RowCount-1 do
  instringrec(sldb,stringgrid,tbname,i);
  //
  // drop database
  tsql:='drop table if exists '+ tbname+'_old;';
  sldb.ExecSQL(tsql);

  sldb.Commit;
  end;

  function createstringgridtable(sldb:tsqlitedatabase; stringgrid : tstringgrid; tbname:string):string;
  var
  i:integer;
  s:string;
  //sldb: tsqlitedatabase;
  begin
  //sldb.BeginTransaction;
  tsql:='create table '+tbname +'(id integer primary key ,';
  for i:=1 to stringgrid.ColCount-1 do
  begin
  s:=stringgrid.Cells[i,0];
  delete(s,1,pos('-',s));
  if i= stringgrid.ColCount-1 then
  tsql:=tsql+s+' varchar(255)'
  else tsql:=tsql+s+' varchar(255), ';
  end;
  tsql:=tsql+');';
  sldb.ExecSQL(tsql);
  //sldb.Commit;
  end;
}
// ========================
function GetDate(f: char; dt: tdatetime): string;
var
  s: string;
begin
  s := datetostr(dt);
  case f of
    'd', 'D':
      begin
        delete(s, 3, length(s));
      end;
    'm', 'M':
      begin
        delete(s, 1, 3);
        delete(s, 3, length(s));
      end;
    'y', 'Y':
      begin
        delete(s, 1, 6);
      end;

  end; // case
  GetDate := s;
end;

function Getfiles(Memo1: TMemo; ext: string): boolean;
var
  tgd: TOpenDialog;
  res: boolean;
begin
  tgd := TOpenDialog.Create(Memo1);
  if ext <> '' then
    tgd.Filter := ext;
  tgd.Options  := [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing];
  res          := tgd.execute;
  if res then
  begin
    Memo1.Lines := tgd.Files;
  end;
  tgd.Free;
  Getfiles := res;
end;

function testnum(s: string): boolean;
var
  r: double;
begin
  result := true;
  try
    r := 0 + strtofloat(s);
  except

    on EConvertError do
    begin
      result := false;
      exit;
    end;

  end;
  r := r + 0;
end;

function validatedate(s: string): boolean;
var
  day, month, year: integer;
begin
  result   := true;
  dates[2] := 28;
  day      := strtoint(pnext('.', s));
  month    := strtoint(pnext('.', s));
  year     := strtoint(s);
  if (day < 1) or (month < 1) or (year < 1) then
  begin
    result := false;
    exit;
  end;
  if (year mod 4 = 0) then
    dates[2] := 29;
  if day > dates[month] then
    result := false;
end;

{ /*Function proportional(summa:string; summap:string; q1:tquery; q2:tquery):A;
  var
  i:byte;
  m:A;
  s:real;
  begin
  //Q1.Open;
  //Q2.Open;
  Q2.First;
  m[0].serkod:=0;
  s:=0;
  while not Q2.Eof do
  begin
  inc(m[0].serkod);
  m[m[0].serkod].serkod:=Q2.FieldByName('serkod').AsInteger;
  m[m[0].serkod].summa:=round(Q2.FieldByName('summa').AsFloat/Q1.fieldByName('summa').AsFloat*strtofloat(summa));
  m[m[0].serkod].summa:=m[m[0].serkod].summa*(-1);
  s:=s-m[m[0].serkod].summa;
  Q2.Next;
  end;
  Q2.First;
  if summap<>'0' then
  m[1].summa:=m[1].summa-strtofloat(summap);
  m[1].summa:=round(m[1].summa-strtofloat(summa)+s);
  m[0].summa:=s;
  proportional:=m;
  //Q1.Close;
  //Q2.Close;
  end;
  */ }

function parseflat(fin: string; var f_num: string; var f_let: string): boolean;
var
  i  : integer;
  s  : string;
  res: boolean;
  cod: integer;
  c  : char;
begin
  parseflat := false;
  //
  // for i:=1 to length(fin) do
  // if (fin[i] <'1') or (fin[i]>'0') then
  // res:=true;
  //
  val(fin, i, cod);
  if cod <> 0 then
  begin
    f_num := copy(fin, 1, cod - 1);
    f_let := copy(fin, cod, 10);
    c     := f_let[1];
    f_let := inttostr(ord(c) - ord('А') + 1);
    res   := true;
  end
  else
  begin
    f_num := fin;
    f_let := '0';
    res   := false;
  end;
  parseflat := res;
end;

function parsehome(hin: string; var h_num, h_let, h_drob,
  h_korp: string): boolean;
var
  s, ss, sss, ssss: string;
  cod, i          : integer;
begin
  val(hin, i, cod);
  if cod = 0 then
  begin
    h_num     := hin;
    h_let     := '0';
    h_korp    := '0';
    h_drob    := '0';
    parsehome := false;
  end
  else
  begin // тут мы если буква или дробь
    if pos('/', hin) <> 0 then // есть дробь
    begin
      s  := copy(hin, 1, pos('/', hin) - 1);
      ss := copy(hin, pos('/', hin) + 1, 10);
      parseflat(s, h_num, h_let);
      h_drob    := ss;
      h_korp    := '0';
      parsehome := true;
    end
    else
    begin // может быть буква
      parseflat(hin, h_num, h_let);
      h_drob    := '0';
      h_korp    := '0';
      parsehome := true;
    end;
    parsehome := true;
  end;
end;

Function Count_pos(s: string): integer;
var
  i, j: integer;
begin
  j     := 0;
  for i := 1 to length(s) do
    if s[i] = '|' then
      inc(j);
  Count_pos := j;
end;

Function OpenFolder(form1: tform): string;
var
  TitleName  : string;
  lpItemID   : PItemIDList;
  BrowseInfo : TBrowseInfo;
  DisplayName: array [0 .. MAX_PATH] of char;
  TempPath   : array [0 .. MAX_PATH] of char;
begin
  FillChar(BrowseInfo, sizeof(TBrowseInfo), #0);
  BrowseInfo.hwndOwner      := form1.handle;
  BrowseInfo.pszDisplayName := @DisplayName;
  TitleName                 := 'Выберите папку резервной копии';
  BrowseInfo.lpszTitle      := PChar(TitleName);
  BrowseInfo.ulFlags        := BIF_RETURNONLYFSDIRS;
  lpItemID                  := SHBrowseForFolder(BrowseInfo);
  if lpItemID <> nil then
  begin
    SHGetPathFromIDList(lpItemID, TempPath);
    // ShowMessage(TempPath);
    GlobalFreePtr(lpItemID);
  end;
  OpenFolder := TempPath;
end;

function percent(A, b: double): double;
begin
  percent := A / b;
end;

function invalid(s: string): boolean;
var
  ts, rs: string;
  // y,m,d:word;
  cod: integer;
  p  : word;
begin
  invalid := false;
  // try
  ts := pnext('.', s);
  val(ts, p, cod);
  if cod <> 0 then
  begin
    invalid := true;
    exit;
  end;
  if (strtoint(ts) < 1) or (strtoint(ts) > 31) then
    invalid := true;
  rs        := pnext('.', s);
  val(rs, p, cod);
  if cod <> 0 then
  begin
    invalid := true;
    exit;
  end;
  if (strtoint(rs) < 1) or (strtoint(rs) > 12) then
    invalid := true;
  val(s, p, cod);
  if cod <> 0 then
  begin
    invalid := true;
    exit;
  end;
  if (strtoint(s) < 1900) or (strtoint(s) > 2050) then
    invalid := true;
end;

function procent(org: double; pr: double): double;
var
  r: double;
begin
  procent := org / 100 * pr;
end;

function FExist(s: string): boolean;
var
  f: file;
begin
{$I-}
  Assignfile(f, s);
  Reset(f);
  FExist := IoResult = 0;
{$I+}
end;

Function lTrim(var s: string): string;
begin
  if s[1] <> ' ' then
  begin

  end
  else
    while s[1] = ' ' do
      delete(s, 1, 1);
  lTrim := s;
end;

procedure Copyfilewin(handle: thandle; from, tof: string);
var
  OpStruc       : TSHFileOpStruct;
  frombuf, tobuf: array [0 .. 1024] of char;
begin
  FillChar(frombuf, sizeof(frombuf), 0);
  FillChar(tobuf, sizeof(tobuf), 0);
  StrPCopy(frombuf, from);
  StrPCopy(tobuf, tof);
  with OpStruc do
  begin
    Wnd                   := handle;
    wFunc                 := FO_COPY;
    pFrom                 := @frombuf;
    pTo                   := @tobuf;
    fFlags                := FOF_NOCONFIRMATION or FOF_RENAMEONCOLLISION;
    fAnyOperationsAborted := false;
    hNameMappings         := nil;
    lpszProgressTitle     := nil;
  end;
  ShFileOperation(OpStruc);
end;

function ExecAndWait(aCmd: string; WaitTimeOut: cardinal = INFINITE): cardinal;
var
  si : STARTUPINFO;
  pi : PROCESS_INFORMATION;
  res: BOOL;
  r  : cardinal;
begin
  with si do
  begin
    cb          := sizeof(si);
    lpReserved  := nil;
    lpDesktop   := nil;
    lpTitle     := PChar('External program "' + aCmd + '"');
    dwFlags     := 0;
    cbReserved2 := 0;
    lpReserved2 := nil;
  end;
  res := CreateProcess(nil, PChar(aCmd), nil, nil, false, 0, nil, nil, si, pi);
  if res then
    WaitForSingleObject(pi.hProcess, WaitTimeOut);
  GetExitCodeProcess(pi.hProcess, r);
  result := r;
end;

procedure StartProg(handle: thandle; prog, param: string);
begin
  ShellExecute(handle, 'open', PChar(prog), PChar(param), nil, SW_SHOWNORMAL);
end;

procedure StartCMD(handle: thandle; param: string);
begin
  ShellExecute(handle, 'open', PChar('CMD.EXE /C'), PChar(param), nil,
    SW_SHOWNORMAL);
end;

function strmonth(d: tdatetime; caps: boolean): string;
var
  dm, m, y: word;
  s       : string;
begin
  Decodedate(d, y, m, dm);
  if caps then
  begin
    case m of
      1:
        s := 'ЯНВАРЬ';
      2:
        s := 'ФЕВРАЛЬ';
      3:
        s := 'МАРТ';
      4:
        s := 'АПРЕЛЬ';
      5:
        s := 'МАЙ';
      6:
        s := 'ИЮНЬ';
      7:
        s := 'ИЮЛЬ';
      8:
        s := 'АВГУСТ';
      9:
        s := 'СЕНТЯБРЬ';
      10:
        s := 'ОКТЯБРЬ';
      11:
        s := 'НОЯБРЬ';
      12:
        s := 'ДЕКАБРЬ';
    end;
  end
  else
  begin
    case m of
      1:
        s := 'январь';
      2:
        s := 'февраль';
      3:
        s := 'март';
      4:
        s := 'апрель';
      5:
        s := 'май';
      6:
        s := 'июнь';
      7:
        s := 'июль';
      8:
        s := 'август';
      9:
        s := 'сентябрь';
      10:
        s := 'октябрь';
      11:
        s := 'ноябрь';
      12:
        s := 'декабрь';
    end;
  end;
  strmonth := s;
end;

function strmonthd(d: tdatetime; caps: boolean): string;
var
  dm, m, y: word;
  s       : string;
begin
  Decodedate(d, y, m, dm);
  if caps then
  begin
    case m of
      1:
        s := 'ЯНВАРЯ';
      2:
        s := 'ФЕВРАЛЯ';
      3:
        s := 'МАРТА';
      4:
        s := 'АПРЕЛЯ';
      5:
        s := 'МАЯ';
      6:
        s := 'ИЮНЯ';
      7:
        s := 'ИЮЛЯ';
      8:
        s := 'АВГУСТА';
      9:
        s := 'СЕНТЯБРЯ';
      10:
        s := 'ОКТЯБРЯ';
      11:
        s := 'НОЯБРЯ';
      12:
        s := 'ДЕКАБРЯ';
    end;
  end
  else
  begin
    case m of
      1:
        s := 'января';
      2:
        s := 'февраля';
      3:
        s := 'марта';
      4:
        s := 'апреля';
      5:
        s := 'мая';
      6:
        s := 'июня';
      7:
        s := 'июля';
      8:
        s := 'августа';
      9:
        s := 'сентября';
      10:
        s := 'октября';
      11:
        s := 'ноября';
      12:
        s := 'декабря';
    end;
  end;
  strmonthd := s;
end;

function datetosqlite(s: string): string;
var
  ts: string;
begin
  ts           := Mypos(s + '.', '.', 3) + '-';
  ts           := ts + Mypos(s, '.', 2) + '-';
  ts           := ts + Mypos(s, '.', 1);
  datetosqlite := ts;
end;

Procedure pause(t: int64);
var
  c: int64;
begin
  c := GetTickCount;
  repeat
    Application.ProcessMessages
  until GetTickCount - c >= t;
end;

// --------------------------------------------------------------------------------------------
function CopyFile(FromPath, ToPath: string): integer;
var
  F1        : file;
  F2        : file;
  NumRead   : integer;
  NumWritten: integer;
  Buf       : pointer;
  // BufSize: longint;
  Totalbytes: longint;
  TotalRead : longint;
begin
  result := 0;
  Assignfile(F1, FromPath);
  Assignfile(F2, ToPath);
  Reset(F1, 1);
  Totalbytes := Filesize(F1);
  Rewrite(F2, 1);
  // BufSize := 16384;
  GetMem(Buf, Bufsize);
  TotalRead := 0;
  repeat
    BlockRead(F1, Buf^, Bufsize, NumRead);
    inc(TotalRead, NumRead);
    BlockWrite(F2, Buf^, NumRead, NumWritten);
    Application.ProcessMessages;
  until (NumRead = 0) or (NumWritten <> NumRead);
  if (NumWritten <> NumRead) then
  begin
    // ошибка
    result := -1;
  end;
  Closefile(F1);
  Closefile(F2);
end;

function CopyFileProgress(FromPath, ToPath: string; p: tprogressbar): integer;
var
  F1        : file;
  F2        : file;
  NumRead   : integer;
  NumWritten: integer;
  Buf       : pointer;
  // BufSize: longint;
  Totalbytes: longint;
  TotalRead : longint;
begin
  result := 0;
  Assignfile(F1, FromPath);
  Assignfile(F2, ToPath);
  Reset(F1, 1);
  Totalbytes := Filesize(F1);
  p.Min      := 0;
  p.Max      := Filesize(F1);
  p.Position := 0;
  Rewrite(F2, 1);
  // BufSize := 16384;
  GetMem(Buf, Bufsize);
  TotalRead := 0;
  repeat
    BlockRead(F1, Buf^, Bufsize, NumRead);
    inc(TotalRead, NumRead);
    BlockWrite(F2, Buf^, NumRead, NumWritten);
    p.Position := p.Position + NumWritten;
    p.Repaint;
    Application.ProcessMessages;
  until (NumRead = 0) or (NumWritten <> NumRead);
  if (NumWritten <> NumRead) then
  begin
    // ошибка
    result := -1;
  end;
  Closefile(F1);
  Closefile(F2);
end;

procedure Progress2status(p: tprogressbar; s: tstatusbar);
begin
  with p do
  begin
    Position := 0;
    Repaint;
    Parent := s;
    // Position := 100;
    Top    := 2;
    Left   := 0;
    Height := s.Height - Top;
    Width  := s.Panels[0].Width - Left;
  end;

end;

procedure nop;
var
  i: integer;
begin
  for i := 0 to 1 do
  begin;
  end;
end;

Function FileMove(fs1, fs2: string; del: integer): integer;
var
  F1, F2: textfile;
  s     : string;
  res   : integer;
begin
  res := -1;
  Assignfile(F1, fs1);
{$I-}
  Reset(F1);
  If IoResult <> 0 then
  begin
    res := 1; // cannot open src
    exit;
  End
  ELSE
  begin
    Assignfile(F2, fs2);
    Reset(F2);
    If IoResult = 0 then
    begin
      res := 2; // cannot create dst - exist
      exit;
    end
    else
    begin
      Rewrite(F2);
      If IoResult <> 0 then
      begin
        res := 3; // cannot create dst - cannot create new one
        exit;
      end
      else
      begin
        // ReadLn(f1,s);
        While not eof(F1) do
        begin
          ReadLn(F1, s);
          WriteLn(F2, s);
          res := 0; // excellent
        end;
        // WriteLn(f2,s);
      end;
    end;
  End;
  FileMove := res;
  Closefile(F1);
  Closefile(F2);
  If del = 1 then
    deleteFile(fs1);
end;

Function ParseOracleDate(s: string): string;
begin
  s               := StrReplace(s, '.01.', '.jan.');
  s               := StrReplace(s, '.02.', '.feb.');
  s               := StrReplace(s, '.03.', '.mar.');
  s               := StrReplace(s, '.04.', '.apr.');
  s               := StrReplace(s, '.05.', '.may.');
  s               := StrReplace(s, '.06.', '.jun.');
  s               := StrReplace(s, '.07.', '.jul.');
  s               := StrReplace(s, '.08.', '.aug.');
  s               := StrReplace(s, '.09.', '.sep.');
  s               := StrReplace(s, '.10.', '.oct.');
  s               := StrReplace(s, '.11.', '.nov.');
  s               := StrReplace(s, '.12.', '.dec.');
  ParseOracleDate := s;
end;

Function Trims(s: string): string;
var
  i: integer;
begin
  i := 1;
  While i < length(s) do
  begin
    While (s[i] = ' ') and (s[i + 1] = ' ') and (i < length(s)) do
    begin
      delete(s, i + 1, 1);
    end;
    inc(i);
    If i >= length(s) then
      break;
  end;
  Trims := s;
end;

Procedure ListFileDir(Path: string; FileList: TStrings; mask: string);
var
  SR: TSearchRec;
begin
  if FindFirst(Path + mask, faAnyFile, SR) = 0 then
  begin
    repeat
      if (SR.Attr <> faDirectory) then
      begin
        FileList.Add(Path + SR.Name);
      end;
    until FindNext(SR) <> 0;
    FindClose(SR);
  end;
end;

function CreateDirEx(Dir: string): boolean;
var
  i, L  : integer;
  CurDir: string;
begin
  if ExcludeTrailingBackslash(Dir) = '' then
    exit;
  Dir   := IncludeTrailingBackslash(Dir);
  L     := length(Dir);
  for i := 1 to L do
  begin
    CurDir := CurDir + Dir[i];
    if Dir[i] = '\' then
    begin
      if not DirectoryExists(CurDir) then
        if not CreateDir(CurDir) then
          exit;
    end;
  end;
  result := true;
end;

function DosToWin(st: string): string;
var
  Ch: PAnsiChar;
begin
  Ch := PAnsiChar(StrAlloc(length(st) + 1));
  OemToAnsi(PAnsiChar(st), Ch);
  result := Ch;
  StrDispose(Ch)
end;

function WinToDos(st: string): string;
var
  Ch: PAnsiChar;
begin
  Ch := PAnsiChar(StrAlloc(length(st) + 1));
  AnsiToOem(PAnsiChar(st), Ch);
  result := Ch;
  StrDispose(Ch)
end;

Function parsedatetime(s: string): string;
var
  ts: string;
begin
  ts := datetostr(Date);
  delete(ts, pos('.', ts), length(ts));
  s  := StrReplace(s, '%D', ts);
  s  := StrReplace(s, '%d', inttostr(strtoint(ts)));
  ts := datetostr(Date);
  delete(ts, 1, pos('.', ts));
  delete(ts, pos('.', ts), length(ts));
  s  := StrReplace(s, '%M', ts);
  s  := StrReplace(s, '%m', inttostr(strtoint(ts)));
  ts := datetostr(Date);
  delete(ts, 1, pos('.', ts));
  delete(ts, 1, pos('.', ts));
  s := StrReplace(s, '%Y', ts);
  delete(ts, 1, 2);
  s  := StrReplace(s, '%y', ts);
  ts := TimeToStr(Time);
  delete(ts, pos(':', ts), length(ts));
  s := StrReplace(s, '%h', ts);
  if strtoint(ts) < 10 then
    s := StrReplace(s, '%H', '0' + inttostr(strtoint(ts)))
  else
    s := StrReplace(s, '%H', inttostr(strtoint(ts)));
  ts  := TimeToStr(Time);
  delete(ts, 1, pos(':', ts));
  delete(ts, pos(':', ts), length(ts));
  s  := StrReplace(s, '%T', ts);
  s  := StrReplace(s, '%t', inttostr(strtoint(ts)));
  ts := TimeToStr(Time);
  delete(ts, 1, pos(':', ts));
  delete(ts, 1, pos(':', ts));
  s             := StrReplace(s, '%S', ts);
  s             := StrReplace(s, '%s', inttostr(strtoint(ts)));
  parsedatetime := s;
end;

Function parsedatetimeget(s: string; d: tdatetime): string;
var
  ts: string;
begin
  ts := datetostr(d);
  delete(ts, pos('.', ts), length(ts));
  s  := StrReplace(s, '%D', ts);
  s  := StrReplace(s, '%d', inttostr(strtoint(ts)));
  ts := datetostr(d);
  delete(ts, 1, pos('.', ts));
  delete(ts, pos('.', ts), length(ts));
  s  := StrReplace(s, '%M', ts);
  s  := StrReplace(s, '%m', inttostr(strtoint(ts)));
  ts := datetostr(d);
  delete(ts, 1, pos('.', ts));
  delete(ts, 1, pos('.', ts));
  s := StrReplace(s, '%Y', ts);
  delete(ts, 1, 2);
  s  := StrReplace(s, '%y', ts);
  ts := TimeToStr(d);
  delete(ts, pos(':', ts), length(ts));
  s := StrReplace(s, '%h', ts);
  if strtoint(ts) < 10 then
    s := StrReplace(s, '%H', '0' + inttostr(strtoint(ts)))
  else
    s := StrReplace(s, '%H', inttostr(strtoint(ts)));
  ts  := TimeToStr(d);
  delete(ts, 1, pos(':', ts));
  delete(ts, pos(':', ts), length(ts));
  s  := StrReplace(s, '%T', ts);
  s  := StrReplace(s, '%t', inttostr(strtoint(ts)));
  ts := TimeToStr(d);
  delete(ts, 1, pos(':', ts));
  delete(ts, 1, pos(':', ts));
  s                := StrReplace(s, '%S', ts);
  s                := StrReplace(s, '%s', inttostr(strtoint(ts)));
  parsedatetimeget := s;
end;

function StrReplace(const Str, Str1, Str2: string): string;
// str - исходная строка
// str1 - подстрока, подлежащая замене
// str2 - заменяющая строка
var
  p, L: integer;
begin
  result := Str;
  if length(Str) < length(Str1) then
    exit;
  if pos(Str1, Str) = 0 then
    exit;
  L := length(Str1);
  repeat
    p := pos(Str1, result); // ищем подстроку
    if p > 0 then
    begin
      delete(result, p, L); // удаляем ее
      Insert(Str2, result, p); // вставляем новую
      break;
    end;
  until p = 0;
end;

function pnexte(del: string; var s: string): string;
var
  ts: string;
  i : integer;
  // st:string;
begin
  for i := length(s) downto 1 do
  begin
    If s[i] = del then
    begin
      ts := copy(s, i + 1, length(s));
      delete(s, i, length(s));
      break;
    end;
  end;
  // st:=ts;
  pnexte := ts;
end;

function pnext(del: string; var s: string): string;
var
  ts: string;
begin
  ts := '';
  If pos(del, s) <> 0 then
  begin
    ts := s;
    delete(s, 1, pos(del, s));
    delete(ts, pos(del, ts), length(ts));
  end;
  pnext := ts;
end;

function explode(sPart, sInput: string): ArrOfStr;
begin
  setlength(result, 0);
  while pos(sPart, sInput) <> 0 do
  begin
    setlength(result, length(result) + 1);
    result[length(result) - 1] := copy(sInput, 0, pos(sPart, sInput) - 1);
    delete(sInput, 1, pos(sPart, sInput));
  end;
  setlength(result, length(result) + 1);
  result[length(result) - 1] := sInput;
end;

function implode(sPart: string; arrInp: ArrOfStr): string;
var
  i: integer;
begin
  if length(arrInp) <= 1 then
    result := arrInp[0]
  else
  begin
    for i    := 0 to length(arrInp) - 2 do
      result := result + arrInp[i] + sPart;
    result   := result + arrInp[length(arrInp) - 1];
  end;
end;

procedure sort(arrInp: ArrOfStr);
var
  slTmp: TStringList;
  i    : integer;
begin
  slTmp := TStringList.Create;
  for i := 0 to length(arrInp) - 1 do
    slTmp.Add(arrInp[i]);
  slTmp.sort;
  for i       := 0 to slTmp.Count - 1 do
    arrInp[i] := slTmp[i];
  slTmp.Free;
end;

procedure rsort(arrInp: ArrOfStr);
var
  slTmp: TStringList;
  i    : integer;
begin
  slTmp := TStringList.Create;
  for i := 0 to length(arrInp) - 1 do
    slTmp.Add(arrInp[i]);
  slTmp.sort;
  for i                         := 0 to slTmp.Count - 1 do
    arrInp[slTmp.Count - 1 - i] := slTmp[i];
  slTmp.Free;
end;

Function ParseMySQLDate(s: string): string;
var
  ts1, ts2, ts3: string;
begin
  ts1            := pnext('.', s);
  ts2            := pnext('.', s);
  ts3            := s;
  ParseMySQLDate := ts3 + '-' + ts2 + '-' + ts1;
end;

procedure address(s: string; var street: string; var home: string;
  var flat: string);
var
  s1, s2, s3: string;
begin
  flat   := pnexte(' ', s);
  home   := pnexte(' ', s);
  street := s;
end;

function Mypos(s: string; d: string; p: integer): string;
var
  i : integer;
  rs: string;
begin
  s     := s + d;
  for i := 1 to p do
  begin
    rs := pnext(d, s);
  end;
  Mypos := rs;
end;

function DetermineCodepage(const st: string): byte;
var
  WinCount, AltCount, KoiCount, i, rslt: integer;
begin
  DetermineCodepage := cpAlt;
  WinCount          := 0;
  AltCount          := 0;
  KoiCount          := 0;
  for i             := 1 to length(st) do
  begin
    if st[i] in AltSet then
      inc(AltCount);
    if st[i] in WinSet then
      inc(WinCount);
    if st[i] in KoiSet then
      inc(KoiCount);
  end;
  DetermineCodepage := cpAlt;
  if KoiCount > AltCount then
  begin
    DetermineCodepage := cpKoi;
    if WinCount > KoiCount then
      DetermineCodepage := cpWin;
  end
  else
  begin
    if WinCount > AltCount then
      DetermineCodepage := cpWin;
  end;
end;

function ConvertBankDateToDate(s: string): string;
var
  rs, ts: string;
begin
  rs                    := copy(s, 7, 2) + '.';
  rs                    := rs + copy(s, 5, 2) + '.';
  rs                    := rs + copy(s, 1, 4);
  ConvertBankDateToDate := rs;
end;

function MyposReplace(sin: string; d: string; p: integer; sub: string): string;
var
  s, s1, s2: string;
  i        : integer;
begin
  for i := 1 to p - 1 do
  begin
    s := s + pnext(d, sin) + d;
  end;
  pnext(d, sin);
  s            := s + sub + d + sin;
  MyposReplace := s;

end;

begin
  MaskString := '*.*';
  Bufsize    := 32768;

end.
