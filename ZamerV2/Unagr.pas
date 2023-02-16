unit Unagr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.Grids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, ustr, uadd, System.Actions,
  Vcl.ActnList, math;

type
  TFNagr = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label6: TLabel;
    GroupBox3: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    GroupBox4: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    StringGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ProgressBar1: TProgressBar;
    Edit4: TEdit;
    Edit5: TEdit;
    QTemp: TFDQuery;
    TimerUp: TTimer;
    Timer1000: TTimer;
    QInssvod: TFDQuery;
    QInsAll: TFDQuery;
    QSelectSred: TFDQuery;
    ActionList1: TActionList;
    Action1: TAction;
    Label28: TLabel;
    Label29: TLabel;
    QUp: TFDQuery;
    QTemp2: TFDQuery;
    BitBtn10: TBitBtn;
    Label30: TLabel;
    Label31: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Label32: TLabel;
    Label25: TLabel;
    Label26: TLabel;
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
    Label27: TLabel;
    Label33: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TimerUpTimer(Sender: TObject);
    procedure Timer1000Timer(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure command(b: Boolean);
    procedure change(Sender: TObject);
  end;

var
  FNagr: TFNagr;
  enableclose: Boolean;

implementation

uses uzv2main;
{$R *.dfm}

procedure TFNagr.change(Sender: TObject);
begin
  enableclose := false;
end;

procedure TFNagr.Action1Execute(Sender: TObject);
begin
  BitBtn1.Click;
end;

procedure TFNagr.BitBtn10Click(Sender: TObject);
var
  i: integer;
begin

  if StringGrid1.cells[6, 1] = '' then
    StringGrid1.cells[6, 1] := '0';
  if StringGrid1.cells[7, 1] = '' then
    StringGrid1.cells[7, 1] := '0';
  if StringGrid1.cells[8, 1] = '' then
    StringGrid1.cells[8, 1] := '0';
  if StringGrid1.cells[6, 1] = '' then
    StringGrid1.cells[6, 1] := '0';
  if StringGrid1.cells[7, 2] = '' then
    StringGrid1.cells[7, 2] := '0';
  if StringGrid1.cells[8, 2] = '' then
    StringGrid1.cells[8, 2] := '0';

  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('delete from znagrevsvod where nomer=' + QuotedStr(Nomer));
  QTemp.ExecSQL;

  for i := 1 to 2 do
  begin
    QInssvod.ParamByName('nomer').Asstring := Nomer;
    QInssvod.ParamByName('u').AsFloat := myfloat(StringGrid1.cells[1, i]);
    QInssvod.ParamByName('i').AsFloat := myfloat(StringGrid1.cells[2, i]);
    QInssvod.ParamByName('p').AsFloat := myfloat(StringGrid1.cells[3, i]);
    QInssvod.ParamByName('n').AsFloat := myfloat(StringGrid1.cells[4, i]);
    QInssvod.ParamByName('m').AsFloat := myfloat(StringGrid1.cells[5, i]);
    QInssvod.ParamByName('dop1').AsFloat := 0;
    QInssvod.ParamByName('t').AsFloat := 0;
    QInssvod.ParamByName('robm').AsFloat :=
      myfloat(StringReplace(Edit5.Text, '.', ',',
      [rfReplaceAll, rfIgnoreCase]));
    QInssvod.ParamByName('rkorp').AsFloat :=
      myfloat(StringReplace(Edit4.Text, '.', ',',
      [rfReplaceAll, rfIgnoreCase]));
    QInssvod.ParamByName('tip').Asinteger := i;

    QInssvod.ParamByName('t1').AsFloat :=
      myfloat(StringReplace(StringGrid1.cells[6, i], '.', ',',
      [rfReplaceAll, rfIgnoreCase]));
    QInssvod.ParamByName('t2').AsFloat :=
      myfloat(StringReplace(StringGrid1.cells[7, i], '.', ',',
      [rfReplaceAll, rfIgnoreCase]));
    QInssvod.ParamByName('t3').AsFloat :=
      myfloat(StringReplace(StringGrid1.cells[8, i], '.', ',',
      [rfReplaceAll, rfIgnoreCase]));
    QInssvod.ParamByName('r').AsFloat :=
      myfloat(StringReplace(StringGrid1.cells[9, i], '.', ',',
      [rfReplaceAll, rfIgnoreCase]));
    QInssvod.ParamByName('edizmkorp').AsString:=ComboBox1.Text;
    QInssvod.ParamByName('edizmobm').AsString:=ComboBox2.Text;
    QInssvod.ParamByName('edizmispyt').AsString:=ComboBox3.Text;

    QInssvod.ExecSQL;
  end;

  enableclose := true;
  FNagr.Close;
end;

procedure TFNagr.BitBtn1Click(Sender: TObject);
begin

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
  ProgressBar1.Min := 0;
  ProgressBar1.Max := Strtoint(Edit1.Text);
  ProgressBar1.Step := 1;
  ProgressBar1.Position := 0;
  Timer1000.Tag := 0;
  BitBtn1.Enabled := false;
  Timer1000.Enabled := true;
end;

procedure TFNagr.BitBtn2Click(Sender: TObject);
var
  buttonselected, i, j: integer;
begin
  buttonselected := MessageDlg('Очистить данные испытания?', mtConfirmation,
    [mbYes, mbNo], 0);
  if buttonselected = mrYes then
  begin
    for i := 1 to 2 do
      for j := 1 to 9 do
        StringGrid1.cells[j, i] := '';
    Edit4.Text := '';
    Edit5.Text := '';
    enableclose := false;
  end;
end;

procedure TFNagr.command(b: Boolean);
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
      QuotedStr(Nomer) + ' ,' + fname + ', 1, ' + '4' + ',' +
      inttostr(interval) + ')');
    QTemp.ExecSQL;
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('insert into command (nomer, command) values(' +
      QuotedStr(Nomer) + ' , 11)');
    QTemp.ExecSQL;
  end
  else
  begin
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add
      ('insert into command (nomer, filename,command, dat,interval) values(' +
      QuotedStr(Nomer) + ' ,' + fname + ', 0, ' + '4' + ',' +
      inttostr(interval) + ')');
    QTemp.ExecSQL;
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('insert into command (nomer, command) values(' +
      QuotedStr(Nomer) + ' , 10)');
    QTemp.ExecSQL;
  end;
end;

procedure TFNagr.Edit3Change(Sender: TObject);
begin
  Label29.Caption := inttostr(round(strtofloat(Label24.Caption) / 100 *
    myfloat(Edit3.Text)));
end;

procedure TFNagr.Edit4Change(Sender: TObject);
begin
  enableclose := false;
end;

procedure TFNagr.Edit5Change(Sender: TObject);
begin
  enableclose := false;
end;

procedure TFNagr.FormActivate(Sender: TObject);
begin
  Label19.Caption := Fzamerv2.CombUisp.Text;
  Label24.Caption := inttostr(round(strtofloat(Fzamerv2.CombPisp.Text) * 1000));
  Label29.Caption := inttostr(round(strtofloat(Label24.Caption) / 100 *
    myfloat(Edit3.Text)));
  enableclose := true;
  BitBtn1.Enabled := true;
end;

procedure TFNagr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Fzamerv2.ImgSet(Fzamerv2.Image4, true);
  TimerUp.Enabled := false;
end;

procedure TFNagr.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  buttonselected: integer;
begin
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('update zini set value=' + QuotedStr(FNagr.Edit1.Text) +
    ' where name=' + QuotedStr('nagtime'));
  QTemp.ExecSQL;

  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('update zdelta set value=' + QuotedStr(FNagr.Edit2.Text) +
    ' where name=' + QuotedStr('unag'));
  QTemp.ExecSQL;

  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('update zdelta set value=' + QuotedStr(FNagr.Edit3.Text) +
    ' where name=' + QuotedStr('pnag'));
  QTemp.ExecSQL;

  if not enableclose then
  begin
    buttonselected := MessageDlg('Сохранить данные?', mtConfirmation,
      [mbYes, mbNo, mbCancel], 0);
    if buttonselected = mrYes then
    begin
      BitBtn10.Click;
      CanClose := true;
    end;
    if buttonselected = mrCancel then
      CanClose := false;
    if buttonselected = mrNo then
      CanClose := true;
  end
  else
    CanClose := true;
end;

procedure TFNagr.FormCreate(Sender: TObject);
var
  i, j: integer;
  s: string;
begin
  StringGrid1.cells[0, 0] := 'Нагрузка';
  StringGrid1.cells[1, 0] := 'U сред В.';
  StringGrid1.cells[2, 0] := 'I сред А.';
  StringGrid1.cells[3, 0] := 'P сред Вт.';
  StringGrid1.cells[4, 0] := 'N сред об.мин';
  StringGrid1.cells[5, 0] := 'М сред Нм';
  StringGrid1.cells[6, 0] := 'T1,C';
  StringGrid1.cells[7, 0] := 'T2,C';
  StringGrid1.cells[8, 0] := 'T3,C';
  StringGrid1.cells[9, 0] := 'R';
  StringGrid1.cells[0, 1] := 'Без нагрузки';
  StringGrid1.cells[0, 2] := 'С нагрузкой';

  StringGrid1.DefaultColWidth := 100;

  QTemp.Open('select value from zini where name=' + QuotedStr('nagtime'));
  FNagr.Edit1.Text := QTemp.FieldByName('value').Asstring;
  QTemp.Close;
  QTemp.Open('select value from zdelta where name=' + QuotedStr('unag'));
  FNagr.Edit2.Text := trim(QTemp.FieldByName('value').Asstring);
  QTemp.Close;
  QTemp.Open('select value from zdelta where name=' + QuotedStr('pnag'));
  FNagr.Edit3.Text := trim(QTemp.FieldByName('value').Asstring);
  QTemp.Close;
  ComboBox1.Items.LoadFromFile(Extractfilepath(Application.Exename) +
    'R_NagrKorp.txt');
  ComboBox2.Items.LoadFromFile(Extractfilepath(Application.Exename) +
    'R_NagrObm.txt');
  ComboBox3.Items.LoadFromFile(Extractfilepath(Application.Exename) +
    'R_NagrIspyt.txt');
end;

procedure TFNagr.FormShow(Sender: TObject);
begin
  TimerUp.Enabled := true;
end;

procedure TFNagr.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  enableclose := false;
end;

procedure TFNagr.Timer1000Timer(Sender: TObject);
var
  acount1, acount2, ncnt, i: integer;
begin
  ProgressBar1.StepIt;
  Timer1000.Tag := Timer1000.Tag + 1;
  If Timer1000.Tag > Strtoint(Edit1.Text) then
  begin
    Timer1000.Enabled := false;
    ProgressBar1.Position := 0;
    // остановить датчик 45
    command(false);

    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.Open('select count(*) cnt from zamertmp');
    acount1 := QTemp.FieldByName('cnt').Asinteger;
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.Open('select count(*) cnt from zelspec');
    acount2 := QTemp.FieldByName('cnt').Asinteger;
    ncnt := Min(acount2, acount1);
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('delete from znagrevall where nomer=' + QuotedStr(Nomer) +
      ' and tip=' + inttostr(StringGrid1.Row));
    QTemp.ExecSQL;

    QTemp.Open('select * from zamertmp');
    QTemp.First;
    QTemp2.Open('select * from zelspec');
    QTemp2.First;
    for i := 1 to ncnt do
    begin
      QInsAll.ParamByName('NOMER').Asstring := Nomer;
      QInsAll.ParamByName('U1').AsFloat := QTemp2.FieldByName('U1').AsFloat;
      QInsAll.ParamByName('U2').AsFloat := QTemp2.FieldByName('U2').AsFloat;
      QInsAll.ParamByName('U3').AsFloat := QTemp2.FieldByName('U3').AsFloat;
      QInsAll.ParamByName('I1').AsFloat := QTemp2.FieldByName('i1').AsFloat;
      QInsAll.ParamByName('I2').AsFloat := QTemp2.FieldByName('i2').AsFloat;
      QInsAll.ParamByName('I3').AsFloat := QTemp2.FieldByName('i3').AsFloat;
      QInsAll.ParamByName('P').AsFloat := QTemp2.FieldByName('p').AsFloat;
      QInsAll.ParamByName('P1').AsFloat := QTemp2.FieldByName('p1').AsFloat;
      QInsAll.ParamByName('P2').AsFloat := QTemp2.FieldByName('p2').AsFloat;
      QInsAll.ParamByName('P3').AsFloat := QTemp2.FieldByName('p3').AsFloat;
      QInsAll.ParamByName('M').AsFloat :=
        simpleroundto(strtofloat(MyPoint(QTemp.FieldByName('torq')
        .Asstring)), RazM);
      QInsAll.ParamByName('N').AsFloat :=
        simpleroundto(strtofloat(MyPoint(QTemp.FieldByName('rot')
        .Asstring)), RazN);
      QInsAll.ParamByName('DOP1').AsFloat := 0;
      QInsAll.ParamByName('Tip').AsFloat := StringGrid1.Row;
      QInsAll.ParamByName('nagr').AsFloat := 0;
      QInsAll.ExecSQL;
      QTemp.Next;
      QTemp2.Next;
    end;

    /// /////////////////
    ///
    QSelectSred.Close;
    QSelectSred.ParamByName('nomer').Asstring := Nomer;
    QSelectSred.ParamByName('tip').Asinteger := StringGrid1.Row;
    QSelectSred.Open;
    QInssvod.Close;
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('delete from znagrevsvod where nomer=' + QuotedStr(Nomer) +
      ' and tip=' + inttostr(StringGrid1.Row));
    QTemp.ExecSQL;
    StringGrid1.cells[1, StringGrid1.Row] :=
      Floattostr(simpleroundto((QSelectSred.FieldByName('su1').AsFloat +
      QSelectSred.FieldByName('su2').AsFloat + QSelectSred.FieldByName('su3')
      .AsFloat) / 3, RazU));
    StringGrid1.cells[2, StringGrid1.Row] :=
      Floattostr(simpleroundto((QSelectSred.FieldByName('si1').AsFloat +
      QSelectSred.FieldByName('si2').AsFloat + QSelectSred.FieldByName('si3')
      .AsFloat) / 3, RazI));
    StringGrid1.cells[3, StringGrid1.Row] :=
      Floattostr(simpleroundto(QSelectSred.FieldByName('sp').AsFloat, RazP));
    StringGrid1.cells[4, StringGrid1.Row] :=
      Floattostr(simpleroundto(QSelectSred.FieldByName('sn').AsFloat, RazN));
    StringGrid1.cells[5, StringGrid1.Row] :=
      Floattostr(simpleroundto(QSelectSred.FieldByName('sm').AsFloat, RazM));
    BitBtn1.Enabled := true;
    if StringGrid1.Row < StringGrid1.RowCount - 2 then
      StringGrid1.Row := StringGrid1.Row + 1;
  end;

end;

procedure TFNagr.TimerUpTimer(Sender: TObject);
var
 pt,p:single;
 cod1,cod2:integer;
begin

  QUp.Close;
  QUp.Open();

  Label13.Caption := myformat(trazn, QUp.FieldByName('N').AsFloat);
  Label10.Caption := myformat(trazi, QUp.FieldByName('I').AsFloat);
  Label12.Caption := myformat(trazm, QUp.FieldByName('M').AsFloat);
  Label11.Caption := myformat(trazp, QUp.FieldByName('P').AsFloat);

  if checkbox1.checked  then
  begin
  if ABS(QUp.FieldByName('U').AsFloat - strtofloat(Label19.Caption)
    ) > strtofloat(trim(Edit2.Text)) then
    Label9.Font.Color := clRed
  else
    Label9.Font.Color := clGreen;
  Label9.Caption := myformat(trazu, QUp.FieldByName('U').AsFloat);
 end;
  if checkbox2.checked  then
  begin

  if ABS(QUp.FieldByName('Pt').AsFloat-
    strtofloat(Label24.Caption)) > strtofloat(Label29.Caption) then
    Label14.Font.Color := clRed
  else
    Label14.Font.Color := clGreen;
 end;
  if checkbox3.checked  then
  begin

  Label14.Caption := myformat(trazm,
    QUp.FieldByName('Pt').AsFloat);
  end;
  // кпд
   if checkbox4.checked  then
  begin

  val(MyComma(QUp.FieldByName('P').Asstring),p,cod1);
  val(MyComma(QUp.FieldByName('Pt').Asstring),pt,cod2);



  if (cod1 = 0) or (cod2 = 0) then
    Label33.Caption := 'X'
  else
  begin
    if P<>0 then
    Label33.Caption := inttostr(round(pt/p*100))
    else Label33.Caption := 'X';
  end;
  end;
end;

end.
