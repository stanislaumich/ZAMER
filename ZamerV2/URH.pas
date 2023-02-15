unit URH;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, System.Actions, Vcl.ActnList, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uadd, ustr, math, Vcl.ComCtrls,
  YesOrNoDialog;

type
  TFRH = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label6: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    GroupBox3: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    GroupBox2: TGroupBox;
    StringGrid1: TStringGrid;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    GroupBox4: TGroupBox;
    StringGrid2: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label20: TLabel;
    Edit4: TEdit;
    Label25: TLabel;
    Edit5: TEdit;
    Label26: TLabel;
    Edit6: TEdit;
    Label27: TLabel;
    Edit7: TEdit;
    QCommand: TFDQuery;
    Qselectsred: TFDQuery;
    QinsAll: TFDQuery;
    QTemp: TFDQuery;
    QInsSvod: TFDQuery;
    ActionList1: TActionList;
    Action1: TAction;
    Timer1000: TTimer;
    TimerUp: TTimer;
    QUp: TFDQuery;
    BitBtn10: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    ProgressBar1: TProgressBar;
    Qtemp2: TFDQuery;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label30: TLabel;
    procedure Action1Execute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TimerUpTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StringGrid2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Timer1000Timer(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure command(b: Boolean);
    procedure loadgrids;
    procedure savegrids;
    // procedure command(b: Boolean);
  end;

var
  FRH: TFRH;
  enableclose: Boolean;
  nomer: string;
  tipispyt: integer;
  currentpower: single;
  times: integer;

implementation

uses uzv2main;
{$R *.dfm}

procedure TFRH.loadgrids;
var
  i, j, k: integer;
begin
  QTemp.Open('SELECT NAME, FORM, IROW, ICOL, VAL FROM ZAMER.ZGRIDS WHERE FORM='
    + Quotedstr(FRH.Name) + ' and name=' + Quotedstr('StringGrid1'));
  k := 13;
  StringGrid1.RowCount := k;
  for i := 0 to k - 1 do
    for j := 0 to 3 do
      StringGrid1.Cells[j, i] := '';
  While not QTemp.Eof do
  begin
    StringGrid1.Cells[QTemp.FieldByName('icol').Asinteger,
      QTemp.FieldByName('irow').Asinteger] := QTemp.FieldByName('val').AsString;
    QTemp.Next;
  end;

  QTemp.Open('SELECT NAME, FORM, IROW, ICOL, VAL FROM ZAMER.ZGRIDS WHERE FORM='
    + Quotedstr(FRH.Name) + ' and name=' + Quotedstr('StringGrid2'));
  While not QTemp.Eof do
  begin
    StringGrid2.Cells[QTemp.FieldByName('icol').Asinteger,
      QTemp.FieldByName('irow').Asinteger] := QTemp.FieldByName('val').AsString;
    QTemp.Next;
  end;

end;

procedure TFRH.savegrids;
var
  i, j, k: integer;
begin
  { QTEmp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('DELETE FROM ZAMER.ZGRIDS WHERE FORM='
    + Quotedstr(FRH.Name) + ' and name=' + Quotedstr('StringGrid1'));
    QTemp.ExecSQL;
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('insert into ZAMER.ZGRIDS (NAME, FORM, IROW, ICOL, VAL) VALUES(');
    QTemp.SQL.Add(':NAME, :FORM, :IROW,:ICOL, :VAL)');

    k                           := 13;
    StringGrid1.RowCount        := k;
    for i                       := 0 to k - 1 do
    for j                     := 0 to 3 do
    begin
    QTemp.ParamByName('FORM').Asstring:= (FRH.Name);
    QTemp.ParamByName('NAME').Asstring:= ('StringGrid1');
    QTemp.ParamByName('IROW').AsInteger:= i;
    QTemp.ParamByName('ICOL').AsInteger:= j;
    QTemp.ParamByName('VAL').Asstring:=  StringGrid1.Cells[j, i];
    QTemp.ExecSQL;
    end;
  }
end;

procedure TFRH.RadioButton1Click(Sender: TObject);
var
  i, j: integer;
  cod: integer;

begin
  for i := 0 to StringGrid2.colcount - 1 do
    for j := 1 to StringGrid2.RowCount - 1 do
      StringGrid2.Cells[i, j] := '';
  { if StringGrid1.Cells[1, 1] = '' then
    begin
    Showmessage('Нет данных для испытания');
    exit;
    end;
  }
  val(Label35.Caption, currentpower, cod);

  if cod = 0 then
  begin
    StringGrid2.RowCount := 2;
    for i := 1 to StringGrid1.RowCount - 1 do
      if StringGrid1.Cells[1, i] <> '' then
      begin
        StringGrid2.RowCount := StringGrid2.RowCount + 1;
        StringGrid2.Cells[0, i] :=
          Floattostr(simpleroundto(Strtofloat(Label35.Caption) / 100 *
          Strtoint(StringGrid1.Cells[1, i]), RazP));
      end;
    StringGrid2.Cells[0, StringGrid2.RowCount - 1] := '';
    StringGrid2.row := 1;
    tipispyt := 1;
    Label19.Caption := Label33.Caption;
    Label24.Caption := StringGrid2.Cells[0, 1];
    BitBtn1.Enabled := true;
    BitBtn2.Enabled := true;
    BitBtn3.Enabled := true;
  end
  else
    Showmessage
      ('Не удалось получить испытательное напряжение двигателя из установок текущего испытания');
end;

procedure TFRH.RadioButton2Click(Sender: TObject);
var
  i, j: integer;
  cod: integer;

begin
  for i := 0 to StringGrid2.colcount - 1 do
    for j := 1 to StringGrid2.RowCount - 1 do
      StringGrid2.Cells[i, j] := '';
  { if StringGrid1.Cells[1, 1] = '' then
    begin
    Showmessage('Нет данных для испытания');
    exit;
    end;
  }
  val(Label35.Caption, currentpower, cod);
  if cod = 0 then
  begin
    StringGrid2.RowCount := 2;
    for i := 1 to StringGrid1.RowCount - 1 do
      if StringGrid1.Cells[2, i] <> '' then
      begin
        StringGrid2.RowCount := StringGrid2.RowCount + 1;
        StringGrid2.Cells[0, i] :=
          Floattostr(simpleroundto(Strtofloat(Label35.Caption) / 100 *
          Strtoint(StringGrid1.Cells[2, i]), RazP));
      end;
    StringGrid2.Cells[0, StringGrid2.RowCount - 1] := '';
    StringGrid2.row := 1;
    tipispyt := 2;
    Label19.Caption := Label33.Caption;
    Label24.Caption := StringGrid2.Cells[0, 1];
    BitBtn1.Enabled := true;
    BitBtn2.Enabled := true;
    BitBtn3.Enabled := true;
  end
  else
    Showmessage
      ('Не удалось получить испытательное напряжение двигателя из установок текущего испытания');
end;

procedure TFRH.RadioButton3Click(Sender: TObject);
var
  i, j: integer;
  cod: integer;

begin
  for i := 0 to StringGrid2.colcount - 1 do
    for j := 1 to StringGrid2.RowCount - 1 do
      StringGrid2.Cells[i, j] := '';
  {
    if StringGrid1.Cells[1, 1] = '' then
    begin
    Showmessage('Нет данных для испытания');
    exit;
    end;
  }
  val(Label35.Caption, currentpower, cod);
  if cod = 0 then
  begin
    StringGrid2.RowCount := 2;
    for i := 1 to StringGrid1.RowCount - 1 do
      if StringGrid1.Cells[3, i] <> '' then
      begin
        StringGrid2.RowCount := StringGrid2.RowCount + 1;
        StringGrid2.Cells[0, i] :=
          Floattostr(simpleroundto(Strtofloat(Label35.Caption) / 100 *
          Strtoint(StringGrid1.Cells[3, i]), RazP));
      end;
    StringGrid2.Cells[0, StringGrid2.RowCount - 1] := '';
    StringGrid2.row := 1;
    tipispyt := 3;
    Label19.Caption := Label33.Caption;
    Label24.Caption := StringGrid2.Cells[0, 1];
    BitBtn1.Enabled := true;
    BitBtn2.Enabled := true;
    BitBtn3.Enabled := true;
  end
  else
    Showmessage
      ('Не удалось получить испытательное напряжение двигателя из установок текущего испытания');
end;

procedure TFRH.BitBtn5Click(Sender: TObject);

var
  i, j: integer;
  f: textfile;
  s: string;
begin
  if SaveDialog1.Execute then
  begin
    assignfile(f, SaveDialog1.filename);
    rewrite(f);
    for i := 1 to 3 do
      for j := 1 to 12 do
      begin
        s := StringGrid1.Cells[i, j];
        Writeln(f, s);
      end;
    Closefile(f);
  end;
end;

/// ///////////////////////////////////
procedure TFRH.BitBtn10Click(Sender: TObject);
begin
  // сохранять ничего не нужно
  FRH.Close;
end;

procedure TFRH.BitBtn1Click(Sender: TObject);
begin
  if (RadioButton1.Checked or RadioButton2.Checked or RadioButton3.Checked) then
  begin

    times := Strtoint(Edit1.Text);
    BitBtn1.Enabled := false;
    ProgressBar1.min := 0;
    ProgressBar1.max := times;
    ProgressBar1.Step := 1;
    //
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('delete from zrhall where nomer=' + Quotedstr(nomer) +
      ' and uisp=' + Label19.Caption + ' and pisp=' + StringGrid2.Cells[0,
      StringGrid2.row]);
    QTemp.ExecSQL;

    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('delete from zrhsvod where nomer=' + Quotedstr(nomer) +
      ' and uisp=' + Label19.Caption + ' and pisp=' + StringGrid2.Cells[0,
      StringGrid2.row]);
    QTemp.ExecSQL;

    enableclose := false;
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('truncate table zamertmp');
    QTemp.ExecSQL;
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('truncate table zelspec');
    QTemp.ExecSQL;
    command(true);
    //
    Timer1000.Enabled := true;
  end;

end;

procedure TFRH.BitBtn3Click(Sender: TObject);
var
  i, j, buttonSelected: integer;
begin
  buttonSelected := MessageDlg('Действительно очистить все замеры?',
    mtConfirmation, mbYesNo, 0);
  if buttonSelected = mrNo then
    exit;

  for i := 0 to StringGrid2.colcount - 1 do
    for j := 1 to StringGrid2.RowCount - 1 do
      StringGrid2.Cells[i, j] := '';
  StringGrid2.RowCount := 2;
  RadioButton1.Checked := false;
  RadioButton2.Checked := false;
  RadioButton3.Checked := false;
  BitBtn1.Enabled := false;

  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('delete from zrhall where nomer=' + Quotedstr(nomer));
  QTemp.ExecSQL;
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('delete from zrhsvod where nomer=' + Quotedstr(nomer));
  QTemp.ExecSQL;
end;

procedure TFRH.BitBtn4Click(Sender: TObject);
var
  i, j: integer;
  f: textfile;
  s: string;
begin
  If OpenDialog1.Execute then
  begin
    assignfile(f, OpenDialog1.filename);
    reset(f);
    for i := 1 to 3 do
      for j := 1 to 12 do
      begin
        Readln(f, s);
        StringGrid1.Cells[i, j] := s;
      end;
    Closefile(f);
  end;

end;

procedure TFRH.command(b: Boolean);
var
  interval: integer;
  fname: string;
begin
  interval := 50;
  fname := '1600';
  if b then
  begin
    QTemp.Close;
    QTemp.SQL.Clear;

    QTemp.SQL.Add
      ('insert into command (nomer, filename,command, dat,interval) values(' +
      Quotedstr(nomer) + ' ,' + fname + ', 1, ' + '4' + ',' +
      inttostr(interval) + ')');
    QTemp.ExecSQL;
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('insert into command (nomer, command) values(' +
      Quotedstr(nomer) + ' , 11)');
    QTemp.ExecSQL;
  end
  else
  begin
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add
      ('insert into command (nomer, filename,command, dat,interval) values(' +
      Quotedstr(nomer) + ' ,' + fname + ', 0, ' + '4' + ',' +
      inttostr(interval) + ')');
    QTemp.ExecSQL;
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('insert into command (nomer, command) values(' +
      Quotedstr(nomer) + ' , 10)');
    QTemp.ExecSQL;
  end;
end;

procedure TFRH.Edit3Change(Sender: TObject);
begin
  Label29.Caption := inttostr(round(Strtofloat(Label24.Caption) / 100 *
    myfloat(Edit3.Text)));
end;

procedure TFRH.FormActivate(Sender: TObject);
var
  i: integer;
begin
  Label24.Caption := inttostr(round(Strtofloat(Fzamerv2.CombPisp.Text) * 1000));
  for i := 1 to 8 do
    StringGrid1.Cells[0, i] := inttostr(i);
  StringGrid1.Cells[0, 0] := '№';
  StringGrid1.Cells[1, 0] := 'Вар. 1';
  StringGrid1.Cells[2, 0] := 'Вар. 2';
  StringGrid1.Cells[3, 0] := 'Вар. 3';
  StringGrid2.Cells[0, 0] := 'Нагр.';
  StringGrid2.Cells[1, 0] := 'U сред';
  StringGrid2.Cells[2, 0] := 'I сред';
  StringGrid2.Cells[3, 0] := 'P сред';
  StringGrid2.Cells[4, 0] := 'N сред';
  StringGrid2.Cells[5, 0] := 'M сред';
  StringGrid2.Cells[6, 0] := '▲Umax';
  StringGrid2.Cells[7, 0] := '▲Pmax';

  nomer := Label6.Caption;
  enableclose := true;
  QTemp.Open('select * from zdelta where name=' + Quotedstr('urh'));
  Edit2.Text := QTemp.FieldByName('value').AsString;
  QTemp.Open('select * from zdelta where name=' + Quotedstr('prh'));
  Edit3.Text := QTemp.FieldByName('value').AsString;
  QTemp.Open('select * from zini where name=' + Quotedstr('rhtime'));
  Edit1.Text := QTemp.FieldByName('value').AsString;
  loadgrids;
  Label22.Caption := Fzamerv2.CombUisp.Text;
  Label35.Caption := Floattostr(Strtofloat(Fzamerv2.CombPisp.Text) * 1000);
end;

procedure TFRH.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TimerUp.Enabled := false;

  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('update zdelta set value= ' + Quotedstr(Edit2.Text) +
    ' where name=' + Quotedstr('urh'));
  QTemp.ExecSQL;
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('update zdelta set value= ' + Quotedstr(Edit3.Text) +
    ' where name=' + Quotedstr('prh'));
  QTemp.ExecSQL;
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('update zini set value= ' + Quotedstr(Edit1.Text) +
    ' where name=' + Quotedstr('rhtime'));
  QTemp.ExecSQL;
  savegrids;
end;

procedure TFRH.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  buttonSelected: integer;
begin
  CanClose := true;
  { if enableclose then
    CanClose := true
    else
    begin
    buttonSelected :=
    MessageDlg
    ('У вас есть несохраненная работа, она может быть утеряна, сохранить результаты?',
    mtConfirmation, [mbYes, mbNo, MbCancel], 0);
    if buttonSelected = mrYes then
    begin
    BitBtn10.Click;
    CanClose := true;
    end;
    if buttonSelected = mrNo then
    CanClose := true;
    if buttonSelected = mrCancel then
    CanClose := false;
    end;
  }
end;

procedure TFRH.FormShow(Sender: TObject);
begin
  TimerUp.Enabled := true;
  enableclose := true;
  nomer := Label6.Caption;
end;

procedure TFRH.StringGrid2Click(Sender: TObject);
begin
  if StringGrid2.row = StringGrid2.RowCount - 1 then
    StringGrid2.row := StringGrid2.row - 1;
  Label24.Caption := StringGrid2.Cells[0, StringGrid2.row];
  Label19.Caption := Label33.Caption;
end;

procedure TFRH.Timer1000Timer(Sender: TObject);
var
  i: integer;
  acount1, acount2, ncnt: integer;
begin
  times := times - 1;
  if times <= 0 then
  begin
    Timer1000.Enabled := false;
    ProgressBar1.Stepit;
    command(false);
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.Open('select count(*) cnt from zamertmp');
    acount1 := QTemp.FieldByName('cnt').Asinteger;
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.Open('select count(*) cnt from zelspec');
    acount2 := QTemp.FieldByName('cnt').Asinteger;
    ncnt := min(acount2, acount1);
    QTemp.Close;
    QTemp.SQL.Clear;

    QTemp.Open('select * from zamertmp');
    QTemp.First;
    Qtemp2.Open('select * from zelspec');
    Qtemp2.First;

    for i := 1 to ncnt do
    begin
      /// /////////////////
      QinsAll.ParamByName('NOMER').AsString := nomer;
      QinsAll.ParamByName('UISP').AsFloat := Strtofloat(Label19.Caption);
      QinsAll.ParamByName('PISP').AsFloat := Strtofloat(Label24.Caption);

      QinsAll.ParamByName('U12').AsFloat := Qtemp2.FieldByName('U1').AsFloat;
      QinsAll.ParamByName('U23').AsFloat := Qtemp2.FieldByName('U2').AsFloat;
      QinsAll.ParamByName('U31').AsFloat := Qtemp2.FieldByName('U3').AsFloat;
      QinsAll.ParamByName('I1').AsFloat := Qtemp2.FieldByName('i1').AsFloat;
      QinsAll.ParamByName('I2').AsFloat := Qtemp2.FieldByName('i2').AsFloat;
      QinsAll.ParamByName('I3').AsFloat := Qtemp2.FieldByName('i3').AsFloat;
      QinsAll.ParamByName('P1').AsFloat := Qtemp2.FieldByName('p1').AsFloat;
      QinsAll.ParamByName('P2').AsFloat := Qtemp2.FieldByName('p2').AsFloat;
      QinsAll.ParamByName('P3').AsFloat := Qtemp2.FieldByName('p3').AsFloat;
      QinsAll.ParamByName('U').AsFloat := Qtemp2.FieldByName('u').AsFloat;
      QinsAll.ParamByName('I').AsFloat := Qtemp2.FieldByName('i').AsFloat;
      QinsAll.ParamByName('P').AsFloat := Qtemp2.FieldByName('p').AsFloat;

      QinsAll.ParamByName('DUMAX').AsFloat := 0;
      QinsAll.ParamByName('DPMAX').AsFloat := 0;

      QinsAll.ParamByName('rot').AsFloat :=
        simpleroundto(Strtofloat(MyPoint(QTemp.FieldByName('rot')
        .AsString)), RazN);
      QinsAll.ParamByName('torq').AsFloat :=
        simpleroundto(Strtofloat(MyPoint(QTemp.FieldByName('torq')
        .AsString)), RazM);
      QinsAll.ParamByName('power').AsFloat :=
        simpleroundto(Strtofloat(MyPoint(QTemp.FieldByName('power')
        .AsString)), RazP);

      QinsAll.ExecSQL;
      QTemp.Next;
      Qtemp2.Next;
    end;

    Qselectsred.Close;
    Qselectsred.ParamByName('nomer').AsString := nomer;
    Qselectsred.ParamByName('uisp').AsFloat := Strtofloat(Label19.Caption);
    Qselectsred.ParamByName('pisp').AsFloat := Strtofloat(Label24.Caption);
    Qselectsred.Open;
    QInsSvod.Close;
    QTemp.Close;
    if Qselectsred.FieldByName('u').AsFloat <> 0 then
    begin
      QTemp.SQL.Clear;
      QTemp.SQL.Add('delete from zrhsvod where nomer=' + Quotedstr(nomer) +
        ' and uisp=' + Label19.Caption + ' and pisp=' + Point(Label24.Caption));
      QTemp.ExecSQL;

      QInsSvod.ParamByName('nomer').AsString :=
        Qselectsred.FieldByName('nomer').AsString;
      QInsSvod.ParamByName('uisp').AsFloat := Strtofloat(Label19.Caption);
      QInsSvod.ParamByName('pisp').AsFloat := Strtofloat(Label24.Caption);
      QInsSvod.ParamByName('usred').AsFloat :=
        simpleroundto(Qselectsred.FieldByName('u').AsFloat, RazU);
      QInsSvod.ParamByName('isred').AsFloat :=
        simpleroundto(Qselectsred.FieldByName('i').AsFloat, RazI);
      QInsSvod.ParamByName('psred').AsFloat :=
        simpleroundto(Qselectsred.FieldByName('p').AsFloat, RazP);
      QInsSvod.ParamByName('dumax').AsFloat :=
        simpleroundto(Qselectsred.FieldByName('umax').AsFloat, RazU);
      QInsSvod.ParamByName('dpmax').AsFloat :=
        simpleroundto(Qselectsred.FieldByName('pmax').AsFloat, RazP);
      QInsSvod.ParamByName('torq').AsFloat :=
        simpleroundto(Qselectsred.FieldByName('t').AsFloat, RazM);
      QInsSvod.ParamByName('rot').AsFloat :=
        simpleroundto(Qselectsred.FieldByName('r').AsFloat, RazN);
      QInsSvod.ParamByName('power').AsFloat :=
        simpleroundto(Qselectsred.FieldByName('pow').AsFloat, RazP);
      QInsSvod.ParamByName('tip').Asinteger := tipispyt;
      QInsSvod.ParamByName('t1').AsFloat := Strtofloat(Edit4.Text);
      QInsSvod.ParamByName('t2').AsFloat := Strtofloat(Edit5.Text);
      QInsSvod.ParamByName('t3').AsFloat := Strtofloat(Edit6.Text);
      QInsSvod.ParamByName('r').AsFloat := Strtofloat(Edit7.Text);
      QInsSvod.ExecSQL;
    end; // inssvod
    StringGrid2.Cells[1, StringGrid2.row] :=
      Floattostr(simpleroundto(Qselectsred.FieldByName('u').AsFloat, RazU));
    StringGrid2.Cells[2, StringGrid2.row] :=
      Floattostr(simpleroundto(Qselectsred.FieldByName('i').AsFloat, RazI));
    StringGrid2.Cells[3, StringGrid2.row] :=
      Floattostr(simpleroundto(Qselectsred.FieldByName('p').AsFloat, RazP));
    StringGrid2.Cells[4, StringGrid2.row] :=
      Floattostr(simpleroundto(Qselectsred.FieldByName('r').AsFloat, RazI));
    StringGrid2.Cells[5, StringGrid2.row] :=
      Floattostr(simpleroundto(Qselectsred.FieldByName('t').AsFloat, RazN));
    StringGrid2.Cells[6, StringGrid2.row] :=
      Floattostr(simpleroundto(Qselectsred.FieldByName('umax').AsFloat, RazM));
    StringGrid2.Cells[7, StringGrid2.row] :=
      Floattostr(simpleroundto(Qselectsred.FieldByName('pmax').AsFloat, RazP));

    if StringGrid2.Cells[0, StringGrid2.row + 1] = '' then
    begin
      BitBtn1.Enabled := true;
      BitBtn2.Enabled := true;
      BitBtn3.Enabled := true;
      ProgressBar1.Position := 0;
      Showmessage('Испытание завершено!')
    end
    else
    begin
      StringGrid2.row := StringGrid2.row + 1;
      BitBtn3.Enabled := true;
      BitBtn1.Enabled := true;
      Label24.Caption := StringGrid2.Cells[0, StringGrid2.row];
    end;
  end
  else
    ProgressBar1.Stepit;
end;

procedure TFRH.TimerUpTimer(Sender: TObject);
begin

  QUp.Close;
  QUp.Open();

  Label13.Caption := myformat(trazn, Strtofloat(QUp.FieldByName('N').AsString));
  Label10.Caption := myformat(trazi, Strtofloat(QUp.FieldByName('I').AsString));
  Label12.Caption := myformat(trazm, Strtofloat(QUp.FieldByName('M').AsString));
  Label11.Caption := myformat(trazp, Strtofloat(QUp.FieldByName('P').AsString));

  if ABS(Strtofloat(QUp.FieldByName('U').AsString) - Strtofloat(Label19.Caption)
    ) > Strtofloat(trim(Edit2.Text)) then
    Label9.Font.Color := clRed
  else
    Label9.Font.Color := clGreen;
  Label9.Caption := myformat(trazu, Strtofloat(QUp.FieldByName('U').AsString));

  if ABS(Strtofloat(QUp.FieldByName('Pt').AsString) -
    Strtofloat(Label24.Caption)) > Strtofloat(Label29.Caption) then
    Label14.Font.Color := clRed
  else
    Label14.Font.Color := clGreen;

  Label14.Caption := myformat(trazm,
    Strtofloat(QUp.FieldByName('Pt').AsString));

  // кпд
  if Strtofloat(QUp.FieldByName('P').AsString) = 0 then
    Label33.Caption := 'X'
  else
  begin
    Label22.Caption := inttostr(round(Strtofloat(QUp.FieldByName('Pt').AsString)
      / Strtofloat(QUp.FieldByName('P').AsString) * 100));
  end;

  {
    QUp.Close;
    QUp.Open();
    Label13.Caption := myformat(trazn, QUp.FieldByName('N').AsFloat);
    Label10.Caption := myformat(trazi, QUp.FieldByName('I').AsFloat);
    Label12.Caption := myformat(trazm, QUp.FieldByName('M').AsFloat);

    if ABS(QUp.FieldByName('U').AsFloat - Strtofloat(Label19.Caption)) >
    myfloat(Edit2.Text) then
    Label9.Font.Color := clRed
    else
    Label9.Font.Color := clGreen;
    Label9.Caption := myformat(trazu, QUp.FieldByName('U').AsFloat);
    //
    if ABS(QUp.FieldByName('P').AsFloat - Strtofloat(Label24.Caption)) >
    myfloat(Label29.Caption) then
    Label14.Font.Color := clRed
    else
    Label14.Font.Color := clGreen;
    Label14.Caption := myformat(trazu, QUp.FieldByName('P').AsFloat);

  }
end;

procedure TFRH.Action1Execute(Sender: TObject);
begin
  BitBtn1.Click;
end;

end.
