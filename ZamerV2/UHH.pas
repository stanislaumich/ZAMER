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
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
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
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    Label13: TLabel;
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
  private
    { Private declarations }
  public
    { Public declarations }
    procedure loadgrids;
    procedure savegrids;
    procedure command(b: boolean);
  end;

var
  FormHH     : TFormHH;
  currentvolt: single;
  tipispyt   : integer;
  times      : integer;

implementation

uses Uzv2Main;

{$R *.dfm}

procedure TFormHH.command(b: boolean);
begin
  if b then
  begin
   QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('insert into command (nomer, command) values(' + Quotedstr(Nomer) +
    ' , 11)' );
  QTemp.ExecSQL;
  end
  else
  begin
    QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('insert into command (nomer, command) values(' + Quotedstr(Nomer) +
    ' , 10)' );
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
  Label8.Caption    := StringGrid2.Cells[0, StringGrid2.row];
end;

procedure TFormHH.Action1Execute(Sender: TObject);
begin
  BitStart.Click;
end;

procedure TFormHH.BitStartClick(Sender: TObject);
begin
  times := Strtoint(Edit1.Text);
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('delete from zhhall where nomer=' + Quotedstr(Nomer) +
    ' and uisp=' + Label8.Caption);
  QTemp.ExecSQL;
  //QTemp.Close;
  //QTemp.SQL.Clear;
  //QTemp.SQL.Add('truncate table zelspec');
  //QTemp.ExecSQL;
  ProgressBar1.min  := 0;
  ProgressBar1.max  := times;
  ProgressBar1.Step := 1;
  Command(true);

  TimWork1000.Enabled := true;
end;

procedure TFormHH.FormActivate(Sender: TObject);
begin
  QTemp.Open('select * from zdelta where name=' + Quotedstr('uhh'));
  Edit2.Text := QTemp.FieldByName('value').AsString;
  QTemp.Open('select * from zini where name=' + Quotedstr('hhtime'));
  Edit1.Text := QTemp.FieldByName('value').AsString;
end;

procedure TFormHH.FormCreate(Sender: TObject);
begin
  loadgrids;
end;

procedure TFormHH.FormHide(Sender: TObject);
begin
  TimUp.Enabled := False;

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
    Label8.Caption := StringGrid2.Cells[0, 1];
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
    Label8.Caption := StringGrid2.Cells[0, 1];
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
    Label8.Caption := StringGrid2.Cells[0, 1];
  end
  else
    ShowMessage
      ('Не удалось получить испытательное напряжение двигателя из установок текущего испытания');
end;

procedure TFormHH.TimUpTimer(Sender: TObject);
begin
  QUp.Open('select U from zelspectmp');
  if abs(QUp.FieldByName('U').Asfloat - myfloat(Label8.Caption)) <
    myfloat(nvltozero(Edit2.Text)) then
  begin
    Label4.Font.Color := clGreen;
    Label9.Font.Color := clGreen;
  end
  else
  begin
    Label4.Font.Color := clRed;
    Label9.Font.Color := clRed;
  end;
  Label9.Caption := myformat(tRazU, QUp.FieldByName('U').Asfloat);
end;

procedure TFormHH.TimWork1000Timer(Sender: TObject);
var
  i              : Integer;
  errcnt, goodcnt: Integer;
begin
 Progressbar1.StepIt;
 times:=times-1;

 if times<=0 then
  begin
   TimWork1000.Enabled := false;
   Command(false);
    {
    QinsAll.ParamByName('NOMER').Asstring := Nomer;
      QinsAll.ParamByName('UISP').AsFloat   := StrtoFloat(Label6.Caption);
      QinsAll.ParamByName('U12').AsFloat    := a[i].u1;
      QinsAll.ParamByName('U23').AsFloat    := a[i].u2;
      QinsAll.ParamByName('U31').AsFloat    := a[i].u3;
      QinsAll.ParamByName('I1').AsFloat     := a[i].i1;
      QinsAll.ParamByName('I2').AsFloat     := a[i].i2;
      QinsAll.ParamByName('I3').AsFloat     := a[i].i3;
      QinsAll.ParamByName('P1').AsFloat     := a[i].p1;
      QinsAll.ParamByName('P2').AsFloat     := a[i].p2;
      QinsAll.ParamByName('P3').AsFloat     := a[i].p3;
      QinsAll.ParamByName('Ps').AsFloat     := a[i].ps;
      QinsAll.ParamByName('DUMAX').AsFloat  := 0;
      QinsAll.ParamByName('FU').AsFloat     := a[i].u;
      QinsAll.ParamByName('FI').AsFloat     := a[i].i;
      QinsAll.ParamByName('FP').AsFloat     := a[i].ps;
      QinsAll.ExecSQL;
      }

  end;

end;

end.
