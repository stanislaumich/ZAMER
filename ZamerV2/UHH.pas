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
  private
    { Private declarations }
  public
    { Public declarations }
    procedure loadgrids;
    procedure savegrids;
  end;

var
  FormHH: TFormHH;
  currentvolt:single;
  tipispyt :integer;

implementation

uses Uzv2Main;

{$R *.dfm}

procedure TFormHH.loadgrids;
var
 i,j,k:integer;
begin
QTemp.Open('SELECT NAME, FORM, IROW, ICOL, VAL FROM ZAMER.ZGRIDS WHERE FORM='+Quotedstr(FormHH.Name)+' and name='+Quotedstr('StringGrid1'));
k:=13;
StringGrid1.RowCount:=k;
for i:=0 to k-1 do
 for j:=0 to 3 do
  StringGrid1.Cells[j,i]:='';
While not QTemp.Eof do
 begin
  StringGrid1.Cells[QTemp.FieldByName('icol').Asinteger,QTemp.FieldByName('irow').Asinteger]:=QTemp.FieldByName('val').AsString;
  QTemp.Next;
 end;

end;


procedure TFormHH.savegrids;
var
 i,j:integer;
begin
 {SELECT
NAME, FORM, IROW,
   ICOL, VAL
FROM ZAMER.ZGRIDS;}
//QTEmp.Close;
//QTemp.SQL.Clear;
//QTemp.SQl.Add('delete from')

end;
procedure TFormHH.Action1Execute(Sender: TObject);
begin
  BitStart.Click;
end;

procedure TFormHH.FormActivate(Sender: TObject);
begin
  QTemp.Open('select * from zdelta where name=' + Quotedstr('uhh'));
  Edit2.Text := QTemp.Fieldbyname('value').Asstring;
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
  savegrids;
end;

procedure TFormHH.FormShow(Sender: TObject);
begin
  TimUp.Enabled := True;
end;

procedure TFormHH.RadioButton1Click(Sender: TObject);
var
  i, j: Integer;
  cod : Integer;

begin
  for i                       := 1 to StringGrid2.colcount - 1 do
    for j                     := 0 to StringGrid2.RowCount - 1 do
      StringGrid2.Cells[j, i] := '';
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
    Label8.Caption                                 := StringGrid2.Cells[0, 1];
  end
  else
    ShowMessage
      ('Не удалось получить испытательное напряжение двигателя из установок текущего испытания');
end;

procedure TFormHH.RadioButton2Click(Sender: TObject);
var
  i, j: Integer;
  cod : Integer;

begin
  for i                       := 1 to StringGrid2.colcount - 1 do
    for j                     := 0 to StringGrid2.RowCount - 1 do
      StringGrid2.Cells[j, i] := '';
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
    tipispyt                                       := 1;
    // установите напряжение
    Label8.Caption                                 := StringGrid2.Cells[0, 1];
  end
  else
    ShowMessage
      ('Не удалось получить испытательное напряжение двигателя из установок текущего испытания');
end;

procedure TFormHH.RadioButton3Click(Sender: TObject);
var
  i, j: Integer;
  cod : Integer;

begin
  for i                       := 1 to StringGrid2.colcount - 1 do
    for j                     := 0 to StringGrid2.RowCount - 1 do
      StringGrid2.Cells[j, i] := '';
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
    tipispyt                                       := 1;
    // установите напряжение
    Label8.Caption                                 := StringGrid2.Cells[0, 1];
  end
  else
    ShowMessage
      ('Не удалось получить испытательное напряжение двигателя из установок текущего испытания');
end;

procedure TFormHH.TimUpTimer(Sender: TObject);
begin
  QUp.Open('select U from zelspectmp');
  if abs(QUp.Fieldbyname('U').Asfloat - myfloat(Label8.Caption)) <
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
  Label9.Caption := myformat(tRazU, QUp.Fieldbyname('U').Asfloat);
end;

end.
