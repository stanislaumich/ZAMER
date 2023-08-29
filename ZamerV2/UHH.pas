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
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Label9: TLabel;
    Label34: TLabel;
    Edit6: TEdit;
    Button2: TButton;
    Button1: TButton;
    Tit: TTimer;
    //tipispyt: Integer;
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
    procedure BitBtn3Click(Sender: TObject);
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1Click(Sender: TObject);

   procedure Preparesg2(t:integer);
    procedure Edit6Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure TitTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure loadgrids;
    procedure savegrids;
    procedure command(b: Boolean);
    procedure setispyt(t: Integer);
  end;

var
  FormHH: TFormHH;
  currentvolt: single;
  tipispyt: Integer;
  times: Integer;
  enableclose: Boolean;
  ccol: Integer;
  fl: string;
  sec:longint;
implementation

uses Uzv2Main, UAuto, Usett;

{$R *.dfm}
procedure TFormHH.setispyt(t: Integer);
 begin
  tipispyt:=t;
 end;


procedure TFormHH.command(b: Boolean);
begin
  FZamerv2.SendCommand(FZamerv2, b, FSett.Edit6.text);
end;

procedure TFormHH.Edit6Change(Sender: TObject);
begin

end;

{
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
}
procedure TFormHH.loadgrids;
var
  i, j, k: Integer;
begin
  QTemp.Open('SELECT NAME, FORM, IROW, ICOL, VAL FROM ZAMER.ZGRIDS WHERE FORM='
    + Quotedstr(FormHH.Name) + ' and name=' + Quotedstr('StringGrid1'));
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
  i, j: Integer;
begin
  { SELECT
    NAME, FORM, IROW,
    ICOL, VAL
    FROM ZAMER.ZGRIDS; }
  // QTEmp.Close;
  // QTemp.SQL.Clear;
  // QTemp.SQl.Add('delete from')

end;

procedure TFormHH.StringGrid1Click(Sender: TObject);
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

procedure TFormHH.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);

var
  s: string;
begin
  with StringGrid1 do
  begin
    if ARow = 0 then
      Canvas.Brush.Color := FSett.Panel1.Color;
    Canvas.Brush.Style := bsSolid;
    s := Cells[ACol, ARow];
    if (ACol = ccol) and (ccol > 0) and (ARow > 0) then
      Canvas.Brush.Color := clGreen;
    Canvas.FillRect(Rect);
    Canvas.TextRect(Rect, s, [tfWordBreak]);

  end;
end;

{ var
  s: string;
  begin
  // if not (gdFixed in State) then
  // if arow=0 then canvas.Brush.Color:=clred;

  with StringGrid1 do
  begin
  if ARow = 0 then
  Canvas.Brush.Color := FSett.Panel1.Color;
  Canvas.Brush.Style := bsSolid;
  s := Cells[ACol, ARow];
  Canvas.FillRect(Rect);
  Canvas.TextRect(Rect, s, [tfWordBreak]);
  end;
  end;
}
procedure TFormHH.StringGrid2Click(Sender: TObject);
begin
  if StringGrid2.row = StringGrid2.RowCount - 1 then
    StringGrid2.row := StringGrid2.row - 1;
  Label26.Caption := StringGrid2.Cells[0, StringGrid2.row];
  StringGrid2.Repaint;
end;

procedure TFormHH.StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  s: string;
begin
  with StringGrid2 do
  begin
    if ARow = 0 then
      Canvas.Brush.Color := FSett.Panel1.Color;

    Canvas.Brush.Style := bsSolid;
    if (ARow = StringGrid2.row) and (ACol > 0) and (ARow > 0) then
      Canvas.Brush.Color := FSett.Panel2.Color;
    s := Cells[ACol, ARow];
    Canvas.FillRect(Rect);
    Canvas.TextRect(Rect, s, [tfWordBreak]);
  end;
end;

{ var
  s: string;
  begin
  // if not (gdFixed in State) then
  // if arow=0 then canvas.Brush.Color:=clred;

  with StringGrid2 do
  begin
  if ARow = 0 then
  Canvas.Brush.Color := FSett.Panel1.Color;
  Canvas.Brush.Style := bsSolid;
  s := Cells[ACol, ARow];
  Canvas.FillRect(Rect);
  Canvas.TextRect(Rect, s, [tfWordBreak]);
  end;
  end;
}
procedure TFormHH.Action1Execute(Sender: TObject);
begin
  BitStart.Click;
end;

procedure TFormHH.BitBtn1Click(Sender: TObject);
var
  i, j: Integer;
  f: textfile;
  s: string;
begin
  If OpenDialog1.Execute then
  begin
    fl := OpenDialog1.Filename;
    Label9.Caption:=fl;
    assignfile(f, OpenDialog1.Filename);
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

procedure TFormHH.BitBtn3Click(Sender: TObject);
var
  i, j: Integer;
  f: textfile;
  s: string;
begin
  if SaveDialog1.Execute then
  begin
    fl := OpenDialog1.Filename;
    assignfile(f, SaveDialog1.Filename);
    rewrite(f);
    for i := 1 to 3 do
      for j := 1 to 12 do
      begin
        s := StringGrid1.Cells[i, j];
        Writeln(f, s);
      end;
      label9.caption:=fl;
    Closefile(f);
  end;
end;

procedure TFormHH.BitClearClick(Sender: TObject);
var
  i, j: Integer;
  buttonSelected: Integer;
begin
  buttonSelected := MessageDlg('Действительно очистить результаты?',
    mtConfirmation, [mbYes, mbNo], 0);
  if buttonSelected = mrYes then
  begin
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('delete from zhhsvod where nomer=' + Quotedstr(Nomer));
    QTemp.ExecSQL;
    for i := 0 to StringGrid2.colcount - 1 do
      for j := 1 to StringGrid2.RowCount - 1 do
        StringGrid2.Cells[i, j] := '';
    StringGrid2.RowCount := 2;
    RadioButton1.Checked := false;
    RadioButton2.Checked := false;
    RadioButton3.Checked := false;
    RadioButton4.Checked := false;
    RadioButton5.Checked := false;
    RadioButton6.Checked := false;
  end;
end;

procedure TFormHH.BitSaveClick(Sender: TObject);
var
  i: Integer;
  s: string;
begin
  for i := 1 to StringGrid2.RowCount - 2 do
  begin
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('delete from zhhsvod where nomer=' + Quotedstr(Nomer) +
      {' and uisp=' + StringGrid2.Cells[0, i]+}' and ns='+inttostr(i));
    QTemp.ExecSQL;
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add
      ('INSERT INTO ZAMER.ZHHSVOD (NOMER, UISP, USRED, ISRED, PSRED, TIP, DUMAX, R, OTKLON, VIZOL,EDIZM, perc, ns, fn)');
    QTemp.SQL.Add
      (' VALUES ( :NOMER, :UISP, :USRED, :ISRED, :PSRED, :TIP, :DUMAX, :R, :OTKLON, :VIZOL,:edizm, :perc, :ns, :fn)');
    QTemp.ParamByName('nomer').AsString := Nomer;
    QTemp.ParamByName('uisp').AsString := StringGrid2.Cells[0, i];
    QTemp.ParamByName('usred').AsFloat :=
      Strtofloat(NVLToZero(StringGrid2.Cells[1, i]));
    QTemp.ParamByName('isred').AsFloat :=
      Strtofloat(NVLToZero(StringGrid2.Cells[2, i]));
    QTemp.ParamByName('psred').AsFloat :=
      Strtofloat(NVLToZero(StringGrid2.Cells[3, i]));
    QTemp.ParamByName('tip').Asinteger := tipispyt;
    QTemp.ParamByName('dumax').AsFloat :=
      Strtofloat(NVLToZero(StringGrid2.Cells[4, i]));
    s := StringGrid2.Cells[5, i];
    s := StringReplace(s, '.', ',', [rfReplaceAll, rfIgnoreCase]);
    if s = '' then
      s := '0';
    QTemp.ParamByName('r').AsFloat := Strtofloat(s);

    QTemp.ParamByName('otklon').AsString := NVLToZero(StringGrid2.Cells[6, i]);
    QTemp.ParamByName('vizol').Asinteger := 0;
    if RadioButton4.Checked then
      QTemp.ParamByName('vizol').Asinteger := 1;
    if RadioButton5.Checked then
      QTemp.ParamByName('vizol').Asinteger := 2;
    QTemp.ParamByName('edizm').AsString := ComboBox1.text;
    QTemp.ParamByName('perc').Asinteger :=
      round(strtoint(StringGrid2.Cells[0, i]) / strtoint(Label7.Caption) * 100);
    QTemp.ParamByName('ns').AsInteger := i;
    QTemp.ParamByName('fn').AsString := Label9.Caption;
    QTemp.ExecSQL;
  end;
  enableclose := true;
  FZamerv2.ImgSet(FZamerv2.Image2, true);
  FormHH.Close;
end;

procedure TFormHH.BitStartClick(Sender: TObject);
begin
  if (RadioButton1.Checked or RadioButton2.Checked or RadioButton3.Checked) then
  begin
    times := strtoint(Edit1.text);
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('delete from zhhall where nomer=' + Quotedstr(Nomer) +
      ' and uisp=' + Label26.Caption);
    QTemp.ExecSQL;

    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('truncate table zamertmp');
    QTemp.ExecSQL;
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('truncate table zelspec');
    QTemp.ExecSQL;

    ProgressBar1.min := 0;
    ProgressBar1.max := times;
    ProgressBar1.Step := 1;
    ProgressBar1.Position := 0;
    command(true);
    enableclose := false;
    TimWork1000.Enabled := true;
    BitStart.Enabled := false;
  end
  else
    ShowMessage('Не выбран ни один вариант испытания в левой таблице!!');
end;

procedure TFormHH.Button1Click(Sender: TObject);
begin
 Tit.Enabled:=true;
end;

procedure TFormHH.Button2Click(Sender: TObject);
begin
 tit.Enabled:=false;
 sec:=0;
 Edit6.text:='00:00:00';
end;

procedure TFormHH.FormActivate(Sender: TObject);
var
  i, j: Integer;
  f: textfile;
  s: string;
begin
  enableclose := true;
  QTemp.Open('select * from zdelta where name=' + Quotedstr('uhh'));
  Edit2.text := QTemp.FieldByName('value').AsString;
  QTemp.Open('select * from zini where name=' + Quotedstr('hhtime'));
  Edit1.text := QTemp.FieldByName('value').AsString;
  QTemp.Open('select * from zini where name=' + Quotedstr('hhfile'));
  if QTemp.FieldByName('value').AsString = '' then
  begin

  end
  else
  begin
    if FileExists(QTemp.FieldByName('value').AsString) then
     begin
    assignfile(f, QTemp.FieldByName('value').AsString);
    reset(f);
    for i := 1 to 3 do
      for j := 1 to 12 do
      begin
        Readln(f, s);
        StringGrid1.Cells[i, j] := s;
      end;
    Closefile(f);
    Label9.Caption:=QTemp.FieldByName('value').AsString;
    end;
  end;
end;

procedure TFormHH.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  buttonSelected: Integer;
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

  QTemp.ExecSQL('update zini set value = ' + Quotedstr(label9.caption) + ' where name=' +
    Quotedstr('hhfile'));

end;

procedure TFormHH.FormCreate(Sender: TObject);
var
f:textfile;
i,j:integer;
s:string;
begin
  loadgrids;
  ComboBox1.Items.LoadFromFile(extractfilepath(application.exename) +
    'R_SoprotListHH.txt');
  ComboBox1.ItemIndex := 0;
  QTemp.Open('select * from zini where name=' +  Quotedstr('hhfile'));
  label9.caption:=QTemp.FieldByName('value').Asstring;
  if Label9.Caption<>'' then
   begin
  fl := label9.caption;
    assignfile(f, fl);
    reset(f);
    for i := 1 to 3 do
      for j := 1 to 12 do
      begin
        Readln(f, s);
        StringGrid1.Cells[i, j] := s;
      end;
    Closefile(f);

  //RadioButton1Click(Formhh);
   end;
end;

procedure TFormHH.FormHide(Sender: TObject);
begin
  TimUp.Enabled := false;

  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('update zdelta set value= ' + Quotedstr(Edit2.text) +
    ' where name=' + Quotedstr('uhh'));
  QTemp.ExecSQL;

  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('update zini set value= ' + Quotedstr(Edit1.text) +
    ' where name=' + Quotedstr('hhtime'));
  QTemp.ExecSQL;
  savegrids;
end;

procedure TFormHH.FormShow(Sender: TObject);
begin
  TimUp.Enabled := true;
end;

procedure TFormhh.Preparesg2(t:integer);
var
  i, j: Integer;
  cod: Integer;
 begin


 end;

procedure TFormHH.RadioButton1Click(Sender: TObject);
var
  i, j: Integer;
  cod: Integer;
begin
  for i := 0 to 0 { StringGrid2.colcount - 1 } do
    for j := 1 to StringGrid2.RowCount - 1 do
      StringGrid2.Cells[i, j] := '';
  StringGrid2.RowCount := 2;

  if StringGrid1.Cells[1, 1] = '' then
  begin
    ShowMessage('Нет данных для испытания');
    exit;
  end;

  val(FZamerv2.CombUisp.text, currentvolt, cod);
  if cod = 0 then
  begin
    StringGrid2.RowCount := 2;
    for i := 1 to StringGrid1.RowCount - 1 do
      if StringGrid1.Cells[1, i] <> '' then
      begin
        StringGrid2.RowCount := StringGrid2.RowCount + 1;
        StringGrid2.Cells[0, i] :=
          floattostr(round(currentvolt / 100 *
          strtoint(StringGrid1.Cells[1, i])));
      end;
    // StringGrid2.Cells[0, StringGrid2.RowCount - 1] := '';
    for i := 0 to StringGrid2.colcount - 1 do
      StringGrid2.Cells[i, StringGrid2.RowCount - 1] := '';
    StringGrid2.row := 1;
    tipispyt := 1;
    // установите напряжение
    Label26.Caption := StringGrid2.Cells[0, 1];
  end
  else
    ShowMessage
      ('Не удалось получить испытательное напряжение двигателя из установок текущего испытания');
end;

procedure TFormHH.RadioButton2Click(Sender: TObject);
var
  i, j: Integer;
  cod: Integer;

begin
  for i := 0 to 0 { StringGrid2.colcount - 1 } do
    for j := 1 to StringGrid2.RowCount - 1 do
      StringGrid2.Cells[i, j] := '';
  StringGrid2.RowCount := 2;

  if StringGrid1.Cells[2, 1] = '' then
  begin
    ShowMessage('Нет данных для испытания');
    exit;
  end;

  val(FZamerv2.CombUisp.text, currentvolt, cod);
  if cod = 0 then
  begin
    StringGrid2.RowCount := 2;
    for i := 1 to StringGrid1.RowCount - 1 do
      if StringGrid1.Cells[2, i] <> '' then
      begin
        StringGrid2.RowCount := StringGrid2.RowCount + 1;
        StringGrid2.Cells[0, i] :=
          floattostr(round(currentvolt / 100 *
          strtoint(StringGrid1.Cells[2, i])));
      end;
    // StringGrid2.Cells[0, StringGrid2.RowCount - 1] := '';
    for i := 0 to StringGrid2.colcount - 1 do
      StringGrid2.Cells[i, StringGrid2.RowCount - 1] := '';
    StringGrid2.row := 1;
    tipispyt := 2;
    // установите напряжение
    Label26.Caption := StringGrid2.Cells[0, 1];
  end
  else
    ShowMessage
      ('Не удалось получить испытательное напряжение двигателя из установок текущего испытания');
end;

procedure TFormHH.RadioButton3Click(Sender: TObject);
var
  i, j: Integer;
  cod: Integer;
begin
  for i := 0 to 0 { StringGrid2.colcount - 1 } do
    for j := 1 to StringGrid2.RowCount - 1 do
      StringGrid2.Cells[i, j] := '';
  StringGrid2.RowCount := 2;

  if StringGrid1.Cells[3, 1] = '' then
  begin
    ShowMessage('Нет данных для испытания');
    exit;
  end;

  val(FZamerv2.CombUisp.text, currentvolt, cod);
  if cod = 0 then
  begin
    StringGrid2.RowCount := 2;
    for i := 1 to StringGrid1.RowCount - 1 do
      if StringGrid1.Cells[3, i] <> '' then
      begin
        StringGrid2.RowCount := StringGrid2.RowCount + 1;
        StringGrid2.Cells[0, i] :=
          floattostr(round(currentvolt / 100 *
          strtoint(StringGrid1.Cells[3, i])));
      end;
    // StringGrid2.Cells[0, StringGrid2.RowCount - 1] := '';
    for i := 0 to StringGrid2.colcount - 1 do
      StringGrid2.Cells[i, StringGrid2.RowCount - 1] := '';
    StringGrid2.row := 1;
    tipispyt := 3;
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
  QUp.Open('select U, i, p from zelspectmp');
  if abs(QUp.FieldByName('U').AsFloat - myfloat(Label26.Caption)) <
    myfloat(NVLToZero(Edit2.text)) then
  begin
    Label22.Font.Color := clGreen;
    Label16.Font.Color := clGreen;
  end
  else
  begin
    Label16.Font.Color := clRed;
    Label22.Font.Color := clRed;
  end;
  Label22.Caption := myformat(tRazU, QUp.FieldByName('U').AsFloat);
  Label23.Caption := myformat(tRazI, QUp.FieldByName('I').AsFloat);
  Label24.Caption := myformat(tRazP, QUp.FieldByName('P').AsFloat);
end;

procedure TFormHH.TimWork1000Timer(Sender: TObject);
var
  i: Integer;
  errcnt, goodcnt: Integer;
  s: string;
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
      QInsAll.ParamByName('UISP').AsFloat := Strtofloat(Label26.Caption);
      QInsAll.ParamByName('U12').AsFloat := QTemp.FieldByName('u1').AsFloat;
      QInsAll.ParamByName('U23').AsFloat := QTemp.FieldByName('u2').AsFloat;
      QInsAll.ParamByName('U31').AsFloat := QTemp.FieldByName('u3').AsFloat;
      QInsAll.ParamByName('I1').AsFloat := QTemp.FieldByName('i1').AsFloat;
      QInsAll.ParamByName('I2').AsFloat := QTemp.FieldByName('i2').AsFloat;
      QInsAll.ParamByName('I3').AsFloat := QTemp.FieldByName('i3').AsFloat;
      QInsAll.ParamByName('P1').AsFloat := QTemp.FieldByName('p1').AsFloat;
      QInsAll.ParamByName('P2').AsFloat := QTemp.FieldByName('p2').AsFloat;
      QInsAll.ParamByName('P3').AsFloat := QTemp.FieldByName('p3').AsFloat;
      QInsAll.ParamByName('Ps').AsFloat :=
        (QTemp.FieldByName('p1').AsFloat + QTemp.FieldByName('p2').AsFloat +
        QTemp.FieldByName('p3').AsFloat);
      QInsAll.ParamByName('DUMAX').AsFloat := 0;
      QInsAll.ParamByName('FU').AsFloat := QTemp.FieldByName('u').AsFloat;
      QInsAll.ParamByName('FI').AsFloat := QTemp.FieldByName('i').AsFloat;
      QInsAll.ParamByName('FP').AsFloat := QTemp.FieldByName('p').AsFloat;
      QInsAll.ParamByName('ns').Asinteger := Stringgrid2.row;

      QInsAll.ExecSQL;
      QTemp.Next;
    end;
    QTemp.Open('select count(*) r from zhhall where nomer=' + Quotedstr(Nomer) +
      ' and uisp=' + Label26.Caption + ' and dumax>' + Edit2.text+' and ns='+inttostr(Stringgrid2.row));
    errcnt := QTemp.FieldByName('r').Asinteger;
    QTemp.Open('select count(*) r from zhhall where nomer=' + Quotedstr(Nomer) +
      ' and uisp=' + Label26.Caption + ' and dumax<=' + Edit2.text+' and ns='+inttostr(Stringgrid2.row));

    goodcnt := QTemp.FieldByName('r').Asinteger;
    Qsred.Close;
    Qsred.Unprepare;
    Qsred.ParamByName('nomer').AsString := Nomer;
    Qsred.ParamByName('uisp').AsFloat := Strtofloat(Label26.Caption);
    Qsred.ParamByName('delta').AsFloat := myfloat(Edit2.text);
    Qsred.ParamByName('ns').Asinteger := Stringgrid2.row;
    Qsred.Open;
    StringGrid2.Cells[1, StringGrid2.row] :=
      floattostr(Qsred.FieldByName('u').AsFloat);

    s := floattostr(Qsred.FieldByName('i').AsFloat);
    if pos(',', s) = 0 then
      s := s + ',00';

    StringGrid2.Cells[2, StringGrid2.row] := s; // ток

    StringGrid2.Cells[3, StringGrid2.row] :=
      floattostr(Qsred.FieldByName('p').AsFloat);
    StringGrid2.Cells[4, StringGrid2.row] := Qsred.FieldByName('m').AsString;
    StringGrid2.Cells[5, StringGrid2.row] := '0';
    StringGrid2.Cells[6, StringGrid2.row] :=
      floattostr(simpleroundto(errcnt / (goodcnt + errcnt) * 100, 0)) + '% (' +
      inttostr(goodcnt + errcnt) + ')';

    if StringGrid2.row < StringGrid2.RowCount - 2 then
      StringGrid2.row := StringGrid2.row + 1;
    BitStart.Enabled := true;
    ProgressBar1.Position := 0;
  end;

end;

procedure TFormHH.TitTimer(Sender: TObject);
var
 st, ssh,ssm,sss:string;
 h,m,s, t:integer;
begin
sec:=sec+1;
t:=sec;
s:=sec mod 60;
if s<10 then  sss:='0'+ inttostr(s) else sss:= inttostr(s);
t:=t div 60;
m:= t mod 60;
if m<10 then ssm:='0'+ inttostr(m) else ssm:=inttostr(m);
h:=t div 60;
if h<10 then ssh:='0'+inttostr(h) else ssh:=inttostr(h);
st:=ssh+':'+ssm+':'+sss;
edit6.text:=st;
end;

end.
