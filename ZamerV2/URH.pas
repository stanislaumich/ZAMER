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
    ComboBox1: TComboBox;
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
    procedure FormCreate(Sender: TObject);
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1Click(Sender: TObject);
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
  tipispyt: Integer;
  currentpower: single;
  times: Integer;
  ccol: Integer;

implementation

uses uzv2main, usett;
{$R *.dfm}

procedure TFRH.loadgrids;
var
  i, j, k: Integer;
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
  i, j, k: Integer;
begin

end;

procedure TFRH.RadioButton1Click(Sender: TObject);
var
  i, j: Integer;
  cod: Integer;

begin

  val(Label35.Caption, currentpower, cod);

  if cod = 0 then
  begin
    StringGrid2.RowCount := 2;
    for i := 1 to StringGrid1.RowCount - 1 do
      if StringGrid1.Cells[1, i] <> '' then
      begin
        StringGrid2.RowCount := StringGrid2.RowCount + 1;
        StringGrid2.Cells[0, i] :=
          Floattostr(round(Strtofloat(Label35.Caption) / 100 *
          Strtoint(StringGrid1.Cells[1, i])));
      end;
    StringGrid2.RowCount := StringGrid2.RowCount - 1;

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
  i, j: Integer;
  cod: Integer;

begin

  val(Label35.Caption, currentpower, cod);
  if cod = 0 then
  begin
    StringGrid2.RowCount := 2;
    for i := 1 to StringGrid1.RowCount - 1 do
      if StringGrid1.Cells[2, i] <> '' then
      begin
        StringGrid2.RowCount := StringGrid2.RowCount + 1;
        StringGrid2.Cells[0, i] :=
          Floattostr(round(Strtofloat(Label35.Caption) / 100 *
          Strtoint(StringGrid1.Cells[2, i])));
      end;
      StringGrid2.RowCount := StringGrid2.RowCount - 1;

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
  i, j: Integer;
  cod: Integer;
begin
  val(Label35.Caption, currentpower, cod);
  if cod = 0 then
  begin
    StringGrid2.RowCount := 2;
    for i := 1 to StringGrid1.RowCount - 1 do
      if StringGrid1.Cells[3, i] <> '' then
      begin
        StringGrid2.RowCount := StringGrid2.RowCount + 1;
        StringGrid2.Cells[0, i] :=
          Floattostr(round(Strtofloat(Label35.Caption) / 100 *
          Strtoint(StringGrid1.Cells[3, i])));
      end;
      StringGrid2.RowCount := StringGrid2.RowCount - 1;

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
  i, j: Integer;
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
  // обновить температуры

  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.add('update zrhsvod set ');
  QTemp.SQL.add('t1= ' + Quotedstr(Edit4.text));
  QTemp.SQL.add(',t2= ' + Quotedstr(Edit5.text));
  QTemp.SQL.add(',t3= ' + Quotedstr(Edit6.text));
  QTemp.SQL.add(',r= ' + Quotedstr(Edit7.text));
  QTemp.SQL.add(',nr= ' + Inttostr(Stringgrid2.rowcount-1));
  QTemp.SQL.add(',tip= ' + inttostr(Stringgrid1.col));
  QTemp.SQL.add(',edizm= ' + Quotedstr(ComboBox1.text));
  QTemp.SQL.add(' where nomer= ' + Quotedstr(nomer));
  QTemp.ExecSQL;
  FZamerV2.ImgSet(FZamerV2.Image5, true);
  enableclose := true;
  // canclose:=true;

  FRH.Close;
end;

procedure TFRH.BitBtn1Click(Sender: TObject);
begin
  if (RadioButton1.Checked or RadioButton2.Checked or RadioButton3.Checked) then
  begin

    times := Strtoint(Edit1.text);
    BitBtn1.Enabled := false;
    BitBtn2.Enabled := true;
    ProgressBar1.min := 0;
    ProgressBar1.max := times;
    ProgressBar1.Step := 1;
    //
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.add('delete from zrhall where nomer=' + Quotedstr(nomer) +
      ' and uisp=' + Label19.Caption + ' and pisp=' +
      mycomma(StringGrid2.Cells[0, StringGrid2.row]));
    QTemp.ExecSQL;

    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.add('delete from zrhsvod where nomer=' + Quotedstr(nomer) +
      ' and uisp=' + Label19.Caption + ' and pisp=' +
      mycomma(StringGrid2.Cells[0, StringGrid2.row]));
    QTemp.ExecSQL;

    enableclose := false;
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.add('truncate table zamertmp');
    QTemp.ExecSQL;
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.add('truncate table zelspec');
    QTemp.ExecSQL;
    command(true);
    //
    Timer1000.Enabled := true;
  end;

end;

procedure TFRH.BitBtn3Click(Sender: TObject);
var
  i, j, buttonSelected: Integer;
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
  QTemp.SQL.add('delete from zrhall where nomer=' + Quotedstr(nomer));
  QTemp.ExecSQL;
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.add('delete from zrhsvod where nomer=' + Quotedstr(nomer));
  QTemp.ExecSQL;
end;

procedure TFRH.BitBtn4Click(Sender: TObject);
var
  i, j: Integer;
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
begin
  FZamerV2.SendCommand(FZamerV2, b, Fsett.Edit6.text);
end;

procedure TFRH.Edit3Change(Sender: TObject);
begin
  Label29.Caption := inttostr(round(Strtofloat(Label24.Caption) / 100 *
    myfloat(emp(Edit3.text))));
end;

procedure TFRH.FormActivate(Sender: TObject);
var
  i: Integer;
  f: textfile;
  s: string;
begin
  Label24.Caption := inttostr(round(Strtofloat(FZamerV2.CombPisp.text) * 1000));
    Label35.Caption := Floattostr(Strtofloat(FZamerV2.CombPisp.text) * 1000);
  Label29.Caption := inttostr(round(strtofloat(Label24.Caption) / 100 *
    myfloat(emp(Edit3.Text))));


 for i := 1 to StringGrid1.RowCount - 1 do
      if StringGrid1.Cells[1, i] <> '' then
      if i<Stringgrid2.rowcount then
      begin
        //StringGrid2.RowCount := StringGrid2.RowCount + 1;
        StringGrid2.Cells[0, i] :=
          Floattostr(round(Strtofloat(Label35.Caption) / 100 *
          Strtoint(StringGrid1.Cells[1, i])));
      end;


end;

procedure TFRH.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TimerUp.Enabled := false;

  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.add('update zdelta set value= ' + Quotedstr(emp(Edit2.text)) +
    ' where name=' + Quotedstr('urh'));
  QTemp.ExecSQL;
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.add('update zdelta set value= ' + Quotedstr(emp(Edit3.text)) +
    ' where name=' + Quotedstr('prh'));
  QTemp.ExecSQL;
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.add('update zini set value= ' + Quotedstr(Edit1.text) +
    ' where name=' + Quotedstr('rhtime'));
  QTemp.ExecSQL;
  savegrids;
end;

procedure TFRH.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  buttonSelected: Integer;
  i: Integer;
  f: textfile;
begin
{$I-}
  assignfile(f, Extractfilepath(paramstr(0)) + 'RH2_width.txt');
  rewrite(f);
  for i := 0 to StringGrid2.colcount - 1 do
  begin
    Writeln(f, inttostr(StringGrid2.ColWidths[i]));
  end;
  Closefile(f);
  assignfile(f, Extractfilepath(paramstr(0)) + 'RH1_width.txt');
  rewrite(f);
  for i := 0 to StringGrid1.colcount - 1 do
  begin
    Writeln(f, inttostr(StringGrid1.ColWidths[i]));
  end;
  Closefile(f);
{$I+}
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

procedure TFRH.FormCreate(Sender: TObject);
var
  f: textfile;
  i: Integer;
  s: string;
begin
  ComboBox1.Items.LoadFromFile(Extractfilepath(application.exename) +
    'R_SoprotListRH.txt');
  ComboBox1.ItemIndex := 0;

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
  StringGrid2.Cells[8, 0] := 'U ошиб.(всего)';
  StringGrid2.Cells[9, 0] := 'P ошиб.(всего)';
{$I-}
  assignfile(f, Extractfilepath(paramstr(0)) + 'RH2_width.txt');
  reset(f);
  for i := 0 to StringGrid2.colcount - 1 do
  begin
    Readln(f, s);
    StringGrid2.ColWidths[i] := Strtoint(s);
  end;
  Closefile(f);
  assignfile(f, Extractfilepath(paramstr(0)) + 'RH1_width.txt');
  reset(f);
  for i := 0 to StringGrid1.colcount - 1 do
  begin
    Readln(f, s);
    StringGrid1.ColWidths[i] := Strtoint(s);
  end;
  Closefile(f);
{$I+}
  nomer := Label6.Caption;
  enableclose := true;
  QTemp.Open('select * from zdelta where name=' + Quotedstr('urh'));
  Edit2.text := QTemp.FieldByName('value').AsString;
  QTemp.Open('select * from zdelta where name=' + Quotedstr('prh'));
  Edit3.text := QTemp.FieldByName('value').AsString;
  QTemp.Open('select * from zini where name=' + Quotedstr('rhtime'));
  Edit1.text := QTemp.FieldByName('value').AsString;
  loadgrids;

end;

procedure TFRH.FormShow(Sender: TObject);
begin
  TimerUp.Enabled := true;
  enableclose := true;
  nomer := Label6.Caption;
end;

procedure TFRH.StringGrid1Click(Sender: TObject);
begin
  ccol := StringGrid1.Col;
  StringGrid1.Repaint;
  case ccol of
    1:
      RadioButton1.Checked := true;
    2:
      RadioButton2.Checked := true;
    3:
      RadioButton3.Checked := true;
  end;
end;

procedure TFRH.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  s: string;
begin
  with StringGrid1 do
  begin
    if ARow = 0 then
      Canvas.Brush.Color := Fsett.Panel1.Color;
    Canvas.Brush.Style := bsSolid;
    s := Cells[ACol, ARow];
    if (ACol = ccol) and (ccol > 0) and (ARow > 0) then
      Canvas.Brush.Color := clGreen;
    Canvas.FillRect(Rect);
    Canvas.TextRect(Rect, s, [tfWordBreak]);

  end;
end;

procedure TFRH.StringGrid2Click(Sender: TObject);
begin
  //if StringGrid2.row = StringGrid2.RowCount - 1 then
  //  StringGrid2.row := StringGrid2.row - 1;
  Label24.Caption := StringGrid2.Cells[0, StringGrid2.row];
  Label19.Caption := Label33.Caption;
end;

procedure TFRH.StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  s: string;
begin
  with StringGrid2 do
  begin
    if ARow = 0 then
      Canvas.Brush.Color := Fsett.Panel1.Color;
    Canvas.Brush.Style := bsSolid;
    s := Cells[ACol, ARow];
    Canvas.FillRect(Rect);
    Canvas.TextRect(Rect, s, [tfWordBreak]);
  end;
end;

procedure TFRH.Timer1000Timer(Sender: TObject);
var
  i, errcnt, goodcnt, nr: Integer;
  acount1, acount2, ncnt: Integer;
begin
  times := times - 1;
  if times <= 0 then
  begin
    Timer1000.Enabled := false;
    ProgressBar1.Position := 0;
    command(false);

    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.add
      ('delete from zamertmp where rot = 0 and torq = 0 and power = 0');
    QTemp.ExecSQL;
    QTemp.Close;

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

    QTemp.Open('select * from zamertmp where rot<>0');
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
    Qselectsred.ParamByName('du').AsFloat := Strtofloat(Edit2.text);
    Qselectsred.ParamByName('dp').AsFloat := Strtofloat(Label29.Caption);
    Qselectsred.Open;
    QInsSvod.Close;
    // -----------------------  u
    QTemp.Open('select count(*) r from zrhall where nomer=' + Quotedstr(nomer) +
      ' and uisp=' + Label19.Caption + ' and du>' + Edit2.text + ' and pisp = '
      + Label24.Caption);
    errcnt := QTemp.FieldByName('r').Asinteger;
    QTemp.Open('select count(*) r from zrhall where nomer=' + Quotedstr(nomer) +
      ' and uisp=' + Label19.Caption + ' and du<=' + Edit2.text + ' and pisp = '
      + Label24.Caption);
    goodcnt := QTemp.FieldByName('r').Asinteger;
    StringGrid2.Cells[8, StringGrid2.row] :=
      Floattostr(simpleroundto(errcnt / (goodcnt + errcnt) * 100, 0)) + '% (' +
      inttostr(goodcnt + errcnt) + ')';
    // -----------------------  p
    QTemp.Open('select count(*) r from zrhall where nomer=' + Quotedstr(nomer) +
      ' and uisp=' + Label19.Caption + ' and dp>' + Label29.Caption +
      ' and pisp = ' + Label24.Caption);
    errcnt := QTemp.FieldByName('r').Asinteger;
    QTemp.Open('select count(*) r from zrhall where nomer=' + Quotedstr(nomer) +
      ' and uisp=' + Label19.Caption + ' and dp<=' + Label29.Caption +
      ' and pisp = ' + Label24.Caption);
    goodcnt := QTemp.FieldByName('r').Asinteger;
    StringGrid2.Cells[9, StringGrid2.row] :=
      Floattostr(simpleroundto(errcnt / (goodcnt + errcnt) * 100, 0)) + '% (' +
      inttostr(goodcnt + errcnt) + ')';

    QTemp.Close;
    if Qselectsred.FieldByName('u').AsFloat <> 0 then
    begin
      QTemp.SQL.Clear;
      QTemp.SQL.add('delete from zrhsvod where nomer=' + Quotedstr(nomer) +
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
      QInsSvod.ParamByName('otklonu').AsString := StringGrid2.Cells
        [8, StringGrid2.row];
      QInsSvod.ParamByName('otklonp').AsString := StringGrid2.Cells
        [9, StringGrid2.row];
      QInsSvod.ParamByName('nr').Asinteger := Stringgrid2.Rowcount-1;
      QInsSvod.ParamByName('tip').Asinteger := tipispyt;
      QInsSvod.ParamByName('t1').AsFloat := 0;
      QInsSvod.ParamByName('t2').AsFloat := 0;
      QInsSvod.ParamByName('t3').AsFloat := 0;
      QInsSvod.ParamByName('r').AsFloat := 0;
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

    if StringGrid2.row = StringGrid2.rowcount-1 then
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
var
  pt, p: single;
  cod1, cod2: Integer;
begin
  QUp.Close;
  QUp.Open();

  Label13.Caption := myformat(trazn, QUp.FieldByName('N').AsFloat);
  Label10.Caption := myformat(trazi, QUp.FieldByName('I').AsFloat);
  Label12.Caption := myformat(trazm, QUp.FieldByName('M').AsFloat);
  Label11.Caption := myformat(trazp, QUp.FieldByName('P').AsFloat);

  // if checkbox1.checked  then
  begin
    if ABS(QUp.FieldByName('U').AsFloat - Strtofloat(Label19.Caption)) >
      Strtofloat(emp(trim(Edit2.text))) then
      Label9.Font.Color := clRed
    else
      Label9.Font.Color := clGreen;
    Label9.Caption := myformat(trazu, QUp.FieldByName('U').AsFloat);
  end;
  // if checkbox2.checked  then
  begin

    if ABS(QUp.FieldByName('Pt').AsFloat - Strtofloat(Label24.Caption)) >
      Strtofloat(Label29.Caption) then
      Label14.Font.Color := clRed
    else
      Label14.Font.Color := clGreen;
  end;
  // if checkbox3.checked  then
  begin
    Label14.Caption := myformat(trazm, QUp.FieldByName('Pt').AsFloat);
  end;
  // кпд
  // if checkbox4.checked  then
  begin

    // val(MyComma(QUp.FieldByName('P').AsString), p, cod1);
    // val(MyComma(QUp.FieldByName('Pt').AsString), pt, cod2);
    cod1 := 0;
    cod2 := 0;
    try
      p := Strtofloat(Label11.Caption);
    except
      on e: exception do
      begin
        e := nil;
        cod1 := 1
      end;
    end;
    try
      pt := Strtofloat(Label14.Caption);
    except
      on e: exception do
      begin
        e := nil;
        cod2 := 1
      end;
    end;
    if (cod1 = 1) or (cod2 = 1) then
      Label22.Caption := 'X'
    else
    begin
      if p <> 0 then
        Label22.Caption := inttostr(round(pt / p * 100))
      else
        Label22.Caption := 'X';
    end;
  end;

end;

procedure TFRH.Action1Execute(Sender: TObject);
begin
  BitBtn1.Click;
end;

end.
