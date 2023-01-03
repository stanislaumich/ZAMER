unit UHH;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Math, Uadd, Vcl.Buttons, Vcl.Grids, System.Actions,
  Vcl.ActnList, Vcl.ComCtrls;

type
  TFormHH = class(TForm)
    Panel2: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    TimUp: TTimer;
    QUp: TFDQuery;
    QTemp: TFDQuery;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    Label14: TLabel;
    GroupBox3: TGroupBox;
    StringGrid1: TStringGrid;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    GroupBox4: TGroupBox;
    StringGrid2: TStringGrid;
    BitStart: TBitBtn;
    BitSave: TBitBtn;
    BitClear: TBitBtn;
    ActionList1: TActionList;
    Action1: TAction;
    ProgressBar1: TProgressBar;
    TimWork1000: TTimer;
    QInsAll: TFDQuery;
    Label15: TLabel;
    Qsred: TFDQuery;
    GroupBox5: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label26: TLabel;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Edit2: TEdit;
    Edit1: TEdit;
    Label1: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    Label8: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure TimUpTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure StringGrid2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitStartClick(Sender: TObject);
    procedure TimWork1000Timer(Sender: TObject);
    procedure BitClearClick(Sender: TObject);
    procedure BitSaveClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure loadgrids;
    procedure savegrids;
    procedure command(b: Boolean);
  end;

var
  FormHH     : TFormHH;
  currentvolt: single;
  tipispyt   : integer;
  times      : integer;
  enableclose: Boolean;

implementation

uses Uzv2Main, UAuto;

{$R *.dfm}

procedure TFormHH.command(b: Boolean);
begin
  if b then
  begin
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('insert into command (nomer, command) values(' +
      Quotedstr(Nomer) + ' , 11)');
    QTemp.ExecSQL;
  end
  else
  begin
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('insert into command (nomer, command) values(' +
      Quotedstr(Nomer) + ' , 10)');
    QTemp.ExecSQL;
  end;
end;

procedure TFormHH.loadgrids;
var
  i, j, k: integer;
begin
  QTemp.Open('SELECT NAME, FORM, IROW, ICOL, VAL FROM ZAMER.ZGRIDS WHERE FORM='
    + Quotedstr(FormHH.Name) + ' and name=' + Quotedstr('StringGrid1'));
  k                           := 13;
  StringGrid1.RowCount        := k;
  for i                       := 0 to k - 1 do
    for j                     := 0 to 3 do
      StringGrid1.Cells[j, i] := '';
  While not QTemp.Eof do
  begin
    StringGrid1.Cells[QTemp.FieldByName('icol').Asinteger,
      QTemp.FieldByName('irow').Asinteger] := QTemp.FieldByName('val').AsString;
    QTemp.Next;
  end;

  QTemp.Open('SELECT NAME, FORM, IROW, ICOL, VAL FROM ZAMER.ZGRIDS WHERE FORM='
    + Quotedstr(FormHH.Name) + ' and name=' + Quotedstr('StringGrid2'));
  While not QTemp.Eof do
  begin
    StringGrid2.Cells[QTemp.FieldByName('icol').Asinteger,
      QTemp.FieldByName('irow').Asinteger] := QTemp.FieldByName('val').AsString;
    QTemp.Next;
  end;
end;

procedure TFormHH.savegrids;
var
  i, j: integer;
begin
  { SELECT
    NAME, FORM, IROW,
    ICOL, VAL
    FROM ZAMER.ZGRIDS; }
  // QTEmp.Close;
  // QTemp.SQL.Clear;
  // QTemp.SQl.Add('delete from')

end;

procedure TFormHH.StringGrid2Click(Sender: TObject);
begin
  if StringGrid2.row = StringGrid2.RowCount - 1 then
    StringGrid2.row := StringGrid2.row - 1;
  Label26.Caption   := StringGrid2.Cells[0, StringGrid2.row];
end;

procedure TFormHH.Action1Execute(Sender: TObject);
begin
  BitStart.Click;
end;

procedure TFormHH.BitBtn1Click(Sender: TObject);
begin
  FAuto.ShowModal;
end;

procedure TFormHH.BitClearClick(Sender: TObject);
var
  i, j          : integer;
  buttonSelected: integer;
begin
  buttonSelected := MessageDlg('Действительно очистить результаты?',
    mtConfirmation, [mbYes, mbNo], 0);
  if buttonSelected = mrYes then
  begin
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('delete from zhhsvod where nomer=' + Quotedstr(Nomer));
    QTemp.ExecSQL;
    for i                       := 0 to StringGrid2.colcount - 1 do
      for j                     := 1 to StringGrid2.RowCount - 1 do
        StringGrid2.Cells[i, j] := '';
    StringGrid2.RowCount        := 2;
    RadioButton1.Checked        := false;
    RadioButton2.Checked        := false;
    RadioButton3.Checked        := false;
    RadioButton4.Checked        := false;
    RadioButton5.Checked        := false;
    RadioButton6.Checked        := false;
  end;
end;

procedure TFormHH.BitSaveClick(Sender: TObject);
var
  i: integer;
begin
  for i := 1 to StringGrid2.RowCount - 2 do
  begin
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('delete from zhhsvod where nomer=' + Quotedstr(Nomer) +
      ' and uisp=' + StringGrid2.Cells[0, i]);
    QTemp.ExecSQL;
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add
      ('INSERT INTO ZAMER.ZHHSVOD (NOMER, UISP, USRED, ISRED, PSRED, TIP, DUMAX, R, OTKLON, VIZOL,EDIZM)');
    QTemp.SQL.Add
      (' VALUES ( :NOMER, :UISP, :USRED, :ISRED, :PSRED, :TIP, :DUMAX, :R, :OTKLON, :VIZOL,:edizm)');
    QTemp.ParamByName('nomer').AsString  := Nomer;
    QTemp.ParamByName('uisp').AsString   := StringGrid2.Cells[0, i];
    QTemp.ParamByName('usred').AsString  := NVLToZero(StringGrid2.Cells[1, i]);
    QTemp.ParamByName('isred').AsString  := NVLToZero(StringGrid2.Cells[2, i]);
    QTemp.ParamByName('psred').AsString  := NVLToZero(StringGrid2.Cells[3, i]);
    QTemp.ParamByName('tip').Asinteger   := tipispyt;
    QTemp.ParamByName('dumax').AsString  := NVLToZero(StringGrid2.Cells[4, i]);
    QTemp.ParamByName('r').AsString      := NVLToZero(StringGrid2.Cells[5, i]);
    QTemp.ParamByName('otklon').AsString := NVLToZero(StringGrid2.Cells[6, i]);
    QTemp.ParamByName('vizol').Asinteger := 0;
    if RadioButton4.Checked then
      QTemp.ParamByName('vizol').Asinteger := 1;
    if RadioButton5.Checked then
      QTemp.ParamByName('vizol').Asinteger := 2;
    QTemp.ParamByName('edizm').AsString :=ComboBox1.Text;
    QTemp.ExecSQL;
  end;
  enableclose := true;
  FormHH.Close;
end;

procedure TFormHH.BitStartClick(Sender: TObject);
begin
  if (RadioButton1.Checked or RadioButton2.Checked or RadioButton3.Checked) then
  begin
    times := Strtoint(Edit1.Text);
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('delete from zhhall where nomer=' + Quotedstr(Nomer) +
      ' and uisp=' + Label26.Caption);
    QTemp.ExecSQL;
    ProgressBar1.min      := 0;
    ProgressBar1.max      := times;
    ProgressBar1.Step     := 1;
    ProgressBar1.Position := 0;
    command(true);
    enableclose         := false;
    TimWork1000.Enabled := true;
    BitStart.Enabled:=false;
  end
  else
    ShowMessage('Не выбран ни один вариант испытания в левой таблице!!');
end;

procedure TFormHH.FormActivate(Sender: TObject);
begin
  enableclose := true;
  QTemp.Open('select * from zdelta where name=' + Quotedstr('uhh'));
  Edit2.Text := QTemp.FieldByName('value').AsString;
  QTemp.Open('select * from zini where name=' + Quotedstr('hhtime'));
  Edit1.Text := QTemp.FieldByName('value').AsString;
end;

procedure TFormHH.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  buttonSelected: integer;
begin
  if enableclose then
    CanClose := true
  else
  begin
    buttonSelected :=
      MessageDlg('У вас есть несохраненные данные, сохранить их?',
      mtConfirmation, [mbYes, mbNo, mbCancel], 0);
    if buttonSelected = mrYes then
    begin
      BitSave.Click;
      CanClose := true;
    end;
    if buttonSelected = mrNo then
      CanClose := true;
    if buttonSelected = mrCancel then
      CanClose := false;
  end;

end;

procedure TFormHH.FormCreate(Sender: TObject);
begin
  loadgrids;
end;

procedure TFormHH.FormHide(Sender: TObject);
begin
  TimUp.Enabled := false;

  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('update zdelta set value= ' + Quotedstr(Edit2.Text) +
    ' where name=' + Quotedstr('uhh'));
  QTemp.ExecSQL;

  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('update zini set value= ' + Quotedstr(Edit1.Text) +
    ' where name=' + Quotedstr('hhtime'));
  QTemp.ExecSQL;
  savegrids;
end;

procedure TFormHH.FormShow(Sender: TObject);
begin
  TimUp.Enabled := true;
end;

procedure TFormHH.RadioButton1Click(Sender: TObject);
var
  i, j: integer;
  cod : integer;

begin
  for i                       := 0 to StringGrid2.colcount - 1 do
    for j                     := 1 to StringGrid2.RowCount - 1 do
      StringGrid2.Cells[i, j] := '';
  StringGrid2.RowCount        := 2;
  if StringGrid1.Cells[1, 1] = '' then
  begin
    ShowMessage('Нет данных для испытания');
    exit;
  end;

  val(FZamerv2.CombUisp.Text, currentvolt, cod);
  if cod = 0 then
  begin
    StringGrid2.RowCount := 2;
    for i                := 1 to StringGrid1.RowCount - 1 do
      if StringGrid1.Cells[1, i] <> '' then
      begin
        StringGrid2.RowCount    := StringGrid2.RowCount + 1;
        StringGrid2.Cells[0, i] :=
          floattostr(round(currentvolt / 100 *
          Strtoint(StringGrid1.Cells[1, i])));
      end;
    StringGrid2.Cells[0, StringGrid2.RowCount - 1] := '';
    StringGrid2.row                                := 1;
    tipispyt                                       := 1;
    // установите напряжение
    Label26.Caption := StringGrid2.Cells[0, 1];
  end
  else
    ShowMessage
      ('Не удалось получить испытательное напряжение двигателя из установок текущего испытания');
end;

procedure TFormHH.RadioButton2Click(Sender: TObject);
var
  i, j: integer;
  cod : integer;

begin
  for i                       := 0 to StringGrid2.colcount - 1 do
    for j                     := 1 to StringGrid2.RowCount - 1 do
      StringGrid2.Cells[i, j] := '';
  StringGrid2.RowCount        := 2;
  if StringGrid1.Cells[2, 1] = '' then
  begin
    ShowMessage('Нет данных для испытания');
    exit;
  end;

  val(FZamerv2.CombUisp.Text, currentvolt, cod);
  if cod = 0 then
  begin
    StringGrid2.RowCount := 2;
    for i                := 1 to StringGrid1.RowCount - 1 do
      if StringGrid1.Cells[2, i] <> '' then
      begin
        StringGrid2.RowCount    := StringGrid2.RowCount + 1;
        StringGrid2.Cells[0, i] :=
          floattostr(round(currentvolt / 100 *
          Strtoint(StringGrid1.Cells[2, i])));
      end;
    StringGrid2.Cells[0, StringGrid2.RowCount - 1] := '';
    StringGrid2.row                                := 1;
    tipispyt                                       := 2;
    // установите напряжение
    Label26.Caption := StringGrid2.Cells[0, 1];
  end
  else
    ShowMessage
      ('Не удалось получить испытательное напряжение двигателя из установок текущего испытания');
end;

procedure TFormHH.RadioButton3Click(Sender: TObject);
var
  i, j: integer;
  cod : integer;
begin
  for i                       := 0 to StringGrid2.colcount - 1 do
    for j                     := 1 to StringGrid2.RowCount - 1 do
      StringGrid2.Cells[i, j] := '';
  StringGrid2.RowCount        := 2;
  if StringGrid1.Cells[3, 1] = '' then
  begin
    ShowMessage('Нет данных для испытания');
    exit;
  end;

  val(FZamerv2.CombUisp.Text, currentvolt, cod);
  if cod = 0 then
  begin
    StringGrid2.RowCount := 2;
    for i                := 1 to StringGrid1.RowCount - 1 do
      if StringGrid1.Cells[3, i] <> '' then
      begin
        StringGrid2.RowCount    := StringGrid2.RowCount + 1;
        StringGrid2.Cells[0, i] :=
          floattostr(round(currentvolt / 100 *
          Strtoint(StringGrid1.Cells[3, i])));
      end;
    StringGrid2.Cells[0, StringGrid2.RowCount - 1] := '';
    StringGrid2.row                                := 1;
    tipispyt                                       := 3;
    // установите напряжение
    Label26.Caption := StringGrid2.Cells[0, 1];
  end
  else
    ShowMessage
      ('Не удалось получить испытательное напряжение двигателя из установок текущего испытания');
end;

procedure TFormHH.RadioButton4Click(Sender: TObject);
begin
  enableclose := false;
end;

procedure TFormHH.RadioButton5Click(Sender: TObject);
begin
  enableclose := false;
end;

procedure TFormHH.RadioButton6Click(Sender: TObject);
begin
  enableclose := false;
end;

procedure TFormHH.TimUpTimer(Sender: TObject);
begin
  QUp.Open('select U from zelspectmp');
  if abs(QUp.FieldByName('U').Asfloat - myfloat(Label26.Caption)) <
    myfloat(NVLToZero(Edit2.Text)) then
  begin
    Label22.Font.Color := clGreen;
    Label16.Font.Color := clGreen;
  end
  else
  begin
    Label16.Font.Color := clRed;
    Label22.Font.Color := clRed;
  end;
  Label22.Caption := myformat(tRazU, QUp.FieldByName('U').Asfloat);
end;

procedure TFormHH.TimWork1000Timer(Sender: TObject);
var
  i              : integer;
  errcnt, goodcnt: integer;
begin
  ProgressBar1.StepIt;
  times := times - 1;

  if times <= 0 then
  begin
    TimWork1000.Enabled := false;
    command(false);
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.Open('select * from zelspec');
    While not QTemp.Eof do
    begin
      QInsAll.ParamByName('NOMER').AsString := Nomer;
      QInsAll.ParamByName('UISP').Asfloat   := StrtoFloat(Label26.Caption);
      QInsAll.ParamByName('U12').Asfloat    := QTemp.FieldByName('u1').Asfloat;
      QInsAll.ParamByName('U23').Asfloat    := QTemp.FieldByName('u2').Asfloat;
      QInsAll.ParamByName('U31').Asfloat    := QTemp.FieldByName('u3').Asfloat;
      QInsAll.ParamByName('I1').Asfloat     := QTemp.FieldByName('i1').Asfloat;
      QInsAll.ParamByName('I2').Asfloat     := QTemp.FieldByName('i2').Asfloat;
      QInsAll.ParamByName('I3').Asfloat     := QTemp.FieldByName('i3').Asfloat;
      QInsAll.ParamByName('P1').Asfloat     := QTemp.FieldByName('p1').Asfloat;
      QInsAll.ParamByName('P2').Asfloat     := QTemp.FieldByName('p2').Asfloat;
      QInsAll.ParamByName('P3').Asfloat     := QTemp.FieldByName('p3').Asfloat;
      QInsAll.ParamByName('Ps').Asfloat     :=
        (QTemp.FieldByName('p1').Asfloat + QTemp.FieldByName('p2').Asfloat +
        QTemp.FieldByName('p3').Asfloat);
      QInsAll.ParamByName('DUMAX').Asfloat := 0;
      QInsAll.ParamByName('FU').Asfloat    := QTemp.FieldByName('u').Asfloat;
      QInsAll.ParamByName('FI').Asfloat    := QTemp.FieldByName('i').Asfloat;
      QInsAll.ParamByName('FP').Asfloat    := QTemp.FieldByName('p').Asfloat;
      QInsAll.ExecSQL;
      QTemp.Next;
    end;
    QTemp.Open('select count(*) r from zhhall where nomer=' + Quotedstr(Nomer) +
      ' and uisp=' + Label26.Caption + ' and dumax>' + Edit2.Text);
    errcnt := QTemp.FieldByName('r').Asinteger;
    QTemp.Open('select count(*) r from zhhall where nomer=' + Quotedstr(Nomer) +
      ' and uisp=' + Label26.Caption + ' and dumax<=' + Edit2.Text);

    goodcnt := QTemp.FieldByName('r').Asinteger;
    Qsred.Close;
    Qsred.Unprepare;
    Qsred.ParamByName('nomer').AsString := Nomer;
    Qsred.ParamByName('uisp').Asfloat   := StrtoFloat(Label26.Caption);
    Qsred.ParamByName('delta').Asfloat  := myfloat(Edit2.Text);
    Qsred.Open;
    StringGrid2.Cells[1, StringGrid2.row] :=
      floattostr(Qsred.FieldByName('u').Asfloat);
    StringGrid2.Cells[2, StringGrid2.row] :=
      floattostr(Qsred.FieldByName('i').Asfloat);
    StringGrid2.Cells[3, StringGrid2.row] :=
      floattostr(Qsred.FieldByName('p').Asfloat);
    StringGrid2.Cells[4, StringGrid2.row] := Qsred.FieldByName('m').AsString;
    StringGrid2.Cells[5, StringGrid2.row] := '0';
    StringGrid2.Cells[6, StringGrid2.row] :=
      floattostr(simpleroundto(errcnt / (goodcnt + errcnt) * 100, 0)) + '% (' +
      inttostr(goodcnt + errcnt) + ')';

    if StringGrid2.row < StringGrid2.RowCount - 2 then
      StringGrid2.row := StringGrid2.row + 1;
      BitStart.Enabled:=true;
  end;

end;

end.
