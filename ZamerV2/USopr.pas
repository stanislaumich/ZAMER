unit USopr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Grids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uadd, ustr;

type
  TFSopr = class(TForm)
    Panel1: TPanel;
    Label34: TLabel;
    Edit8: TEdit;
    ComboBox7: TComboBox;
    Label35: TLabel;
    Label36: TLabel;
    ComboBox8: TComboBox;
    GroupBox3: TGroupBox;
    Label37: TLabel;
    StringGrid3: TStringGrid;
    ComboBox9: TComboBox;
    Button50: TButton;
    GroupBox4: TGroupBox;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    ComboBox10: TComboBox;
    Edit13: TEdit;
    Edit16: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn5: TBitBtn;
    Label1: TLabel;
    Label6: TLabel;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    QTemp: TFDQuery;
    QSoprot: TFDQuery;
    procedure Button50Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure StringGrid3KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSopr: TFSopr;

implementation

{$R *.dfm}

Uses Uzv2Main;

procedure TFSopr.BitBtn1Click(Sender: TObject);
var
  buttonSelected: integer;
begin
  buttonSelected := MessageDlg('Действительно очистить таблицу?',
    mtConfirmation, [mbYes, mbNo], 0);
  if buttonSelected = mrYes then
  begin
    Edit8.Text      := '';
    Edit13.Text     := '';
    Edit16.Text     := '';
    ComboBox7.Text  := '';
    ComboBox8.Text  := '';
    ComboBox9.Text  := '';
    ComboBox10.Text := '';
  end;
end;

procedure TFSopr.BitBtn5Click(Sender: TObject);
var
  i, j: integer;
begin
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.add('delete from ZSOPROT where nomer=' + Quotedstr(Label6.Caption));
  QTemp.ExecSQL;
  QSoprot.Close;
  try
    QSoprot.ParamByName('NOMER').Asstring := Label6.Caption;
    QSoprot.ParamByName('TEMPER').AsFloat :=
      myfloat(strreplace(Edit8.Text, '.', ','));
    QSoprot.ParamByName('PHAS').Asstring     := ComboBox7.Text;
    QSoprot.ParamByName('SOED').Asstring     := ComboBox8.Text;
    QSoprot.ParamByName('SOPRED').Asstring   := ComboBox9.Text;
    QSoprot.ParamByName('IZOLED').Asstring   := ComboBox10.Text;
    QSoprot.ParamByName('IZOLKORP').AsFloat  := myfloat(Edit13.Text);
    QSoprot.ParamByName('IZOLOBMOT').AsFloat := myfloat(Edit16.Text);

    QSoprot.ParamByName('ISPYT13').AsInteger := 0;
    QSoprot.ParamByName('BOLT').AsInteger    := 0;
    if RadioButton1.Checked then
      QSoprot.ParamByName('BOLT').AsInteger := 1;
    if RadioButton2.Checked then
      QSoprot.ParamByName('BOLT').AsInteger := 2;

    for i   := 1 to 3 do
      for j := 1 to 3 do
        if StringGrid3.cells[i, j] = '' then
          StringGrid3.cells[i, j] := '0';

    QSoprot.ParamByName('IZM1U1U2').AsFloat := myfloat(StringGrid3.cells[1, 1]);
    QSoprot.ParamByName('IZM2U1U2').AsFloat := myfloat(StringGrid3.cells[1, 2]);
    QSoprot.ParamByName('IZM3U1U2').AsFloat := myfloat(StringGrid3.cells[1, 3]);
    QSoprot.ParamByName('IZM1V1V2').AsFloat := myfloat(StringGrid3.cells[2, 1]);
    QSoprot.ParamByName('IZM2V1V2').AsFloat := myfloat(StringGrid3.cells[2, 2]);
    QSoprot.ParamByName('IZM3V1V2').AsFloat := myfloat(StringGrid3.cells[2, 3]);
    QSoprot.ParamByName('IZM1W1W2').AsFloat := myfloat(StringGrid3.cells[3, 1]);
    QSoprot.ParamByName('IZM2W1W2').AsFloat := myfloat(StringGrid3.cells[3, 2]);
    QSoprot.ParamByName('IZM3W1W2').AsFloat := myfloat(StringGrid3.cells[3, 3]);
  except
    on E: Exception do
    begin
      ShowMessage
        ('Проверьте введенные данные, все поля должны быть заполнены!');
      E := NIL;
    end;
  end;
  QSoprot.ExecSQL;

  FZamerV2.ImgSet(FZamerV2.Image1, true);
  FSopr.Close;

end;

procedure TFSopr.Button50Click(Sender: TObject);
var
  i, j          : integer;
  buttonSelected: integer;
begin
  buttonSelected := MessageDlg('Действительно очистить таблицу?',
    mtConfirmation, [mbYes, mbNo], 0);
  if buttonSelected = mrYes then
  begin
    Edit8.Text                  := '';
    ComboBox7.Text              := '';
    ComboBox8.Text              := '';
    for i                       := 1 to 3 do
      for j                     := 1 to 3 do
        StringGrid3.cells[i, j] := '0';
    Edit13.Text                 := '500';
    Edit16.Text                 := '500';
  end;

end;

procedure TFSopr.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
 var
  buttonSelected: integer;
begin
buttonSelected := MessageDlg('Сохранить данные?',
    mtConfirmation, [mbYes, mbNo], 0);
  if buttonSelected = mrYes then
  BitBtn5.Click;
end;

procedure TFSopr.FormCreate(Sender: TObject);
var
  i, j: integer;
begin
  StringGrid3.cells[0, 1] := 'Изм. 1';
  StringGrid3.cells[0, 2] := 'Изм. 2';
  StringGrid3.cells[0, 3] := 'Изм. 3';
  StringGrid3.cells[1, 0] := 'U1-U2(U-V)/гл.*';
  StringGrid3.cells[2, 0] := 'V1-V2(V-W)/всп.*';
  StringGrid3.cells[3, 0] := 'W1-W2(W-U)';
  ComboBox9.Text          := 'Ом';
  ComboBox10.Text         := 'МОм';
  for i                   := 1 to 3 do
    for j                 := 1 to 3 do
    begin
      StringGrid3.cells[i, j]  := '0';
      StringGrid3.ColWidths[i] := 160;
    end;
end;

procedure TFSopr.StringGrid3KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    if (StringGrid3.Row = 3) and (StringGrid3.cells[StringGrid3.Col, 3] <> '')
    then
      if StringGrid3.Col < 3 then
        StringGrid3.Selection :=
          TGridRect(Rect(StringGrid3.Col + 1, 1, StringGrid3.Col + 1, 1));
end;

end.
