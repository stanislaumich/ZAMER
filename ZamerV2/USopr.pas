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
    GroupBox4: TGroupBox;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    ComboBox10: TComboBox;
    Edit13: TEdit;
    Edit16: TEdit;
    Label4: TLabel;
    Label5: TLabel;
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
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure Button50Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure StringGrid3KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Edit8Change(Sender: TObject);
    procedure ComboBox7Change(Sender: TObject);
    procedure ComboBox8Change(Sender: TObject);
    procedure ComboBox9Change(Sender: TObject);
    procedure ComboBox10Change(Sender: TObject);
    procedure Edit13Change(Sender: TObject);
    procedure Edit16Change(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure Edit8Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit13Click(Sender: TObject);
    procedure Edit16Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSopr: TFSopr;
  enableclose: Boolean;

implementation

{$R *.dfm}

Uses Uzv2Main, uhh;

procedure TFSopr.BitBtn1Click(Sender: TObject);
var
  buttonSelected, i, j: integer;
begin
  buttonSelected := MessageDlg('Действительно очистить все поля?',
    mtConfirmation, [mbYes, mbNo], 0);
  if buttonSelected = mrYes then
  begin
    Edit8.Text := '';
    Edit1.Text := '';
    Edit2.Text := '';
    Edit13.Text := '';
    Edit16.Text := '';
    ComboBox7.Text := '';
    ComboBox8.Text := '';
    ComboBox9.Text := '';
    ComboBox10.Text := '';
    Edit8.Text := '';
    ComboBox7.Text := '';
    ComboBox8.Text := '';
    for i := 1 to 3 do
      for j := 1 to 3 do
        StringGrid3.cells[i, j] := '';
    Edit13.Text := '';
    Edit16.Text := '';
    RadioButton1.Checked := false;
    RadioButton2.Checked := false;
    RadioButton3.Checked := false;
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
    QSoprot.ParamByName('TEMP1').AsFloat :=
      myfloat(strreplace(Edit8.Text, '.', ','));
    QSoprot.ParamByName('TEMP2').AsFloat :=
      myfloat(strreplace(Edit1.Text, '.', ','));
    QSoprot.ParamByName('TEMP3').AsFloat :=
      myfloat(strreplace(Edit2.Text, '.', ','));
    QSoprot.ParamByName('PHAS').Asstring := ComboBox7.Text;
    QSoprot.ParamByName('SOED').Asstring := ComboBox8.Text;
    QSoprot.ParamByName('SOPRED').Asstring := ComboBox9.Text;
    QSoprot.ParamByName('IZOLED').Asstring := ComboBox10.Text;
    QSoprot.ParamByName('IZOLKORP').AsFloat := myfloat(Edit13.Text);
    QSoprot.ParamByName('IZOLOBMOT').AsFloat := myfloat(Edit16.Text);

    QSoprot.ParamByName('ISPYT13').AsInteger := 0;
    QSoprot.ParamByName('BOLT').AsInteger := 0;
    if RadioButton1.Checked then
      QSoprot.ParamByName('BOLT').AsInteger := 1;
    if RadioButton2.Checked then
      QSoprot.ParamByName('BOLT').AsInteger := 2;

    for i := 1 to 3 do
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
  ShowMessage('Данные сохранены успешно!');
  enableclose := true;
  FZamerV2.ImgSet(FZamerV2.Image1, true);
  FSopr.Close;
end;

procedure TFSopr.Button50Click(Sender: TObject);
var
  i, j: integer;
  buttonSelected: integer;
begin
  buttonSelected := MessageDlg('Действительно очистить таблицу?',
    mtConfirmation, [mbYes, mbNo], 0);
  if buttonSelected = mrYes then
  begin
    Edit8.Text := '';
    ComboBox7.Text := '';
    ComboBox8.Text := '';
    for i := 1 to 3 do
      for j := 1 to 3 do
        StringGrid3.cells[i, j] := '0';
    Edit13.Text := '500';
    Edit16.Text := '500';
  end;

end;

procedure TFSopr.ComboBox10Change(Sender: TObject);
begin
  enableclose := false;
end;

procedure TFSopr.ComboBox7Change(Sender: TObject);
begin
  enableclose := false;
end;

procedure TFSopr.ComboBox8Change(Sender: TObject);
begin
  enableclose := false;
end;

procedure TFSopr.ComboBox9Change(Sender: TObject);
begin
  enableclose := false;
  formhh.Combobox1.Text := ComboBox9.Text;
end;

procedure TFSopr.Edit13Change(Sender: TObject);
begin
  enableclose := false;
end;

procedure TFSopr.Edit13Click(Sender: TObject);
begin
  Edit13.SelectAll;
end;

procedure TFSopr.Edit16Change(Sender: TObject);
begin
  enableclose := false;
end;

procedure TFSopr.Edit16Click(Sender: TObject);
begin
  Edit16.SelectAll;
end;

procedure TFSopr.Edit1Click(Sender: TObject);
begin
  Edit1.SelectAll;
end;

procedure TFSopr.Edit2Click(Sender: TObject);
begin
  Edit2.SelectAll;
end;

procedure TFSopr.Edit8Change(Sender: TObject);
begin
  enableclose := false;
end;

procedure TFSopr.Edit8Click(Sender: TObject);
begin
  Edit8.SelectAll;
end;

procedure TFSopr.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  buttonSelected: integer;
begin

  if enableclose then
    CanClose := true
  else
  begin
    buttonSelected := MessageDlg('Сохранить данные?', mtConfirmation,
      [mbYes, mbNo, mbCancel], 0);
    if buttonSelected = mrYes then
    begin
      CanClose := true;
      BitBtn5.Click;
    end;
    if buttonSelected = mrNo then
      CanClose := true;
    if buttonSelected = mrCancel then
      CanClose := false;
  end;
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

  ComboBox9.Items.Clear;
  ComboBox10.Items.Clear;
  ComboBox9.Items.LoadFromFile(ExtractFilepath(Application.ExeName) +
    'R_SoprotListUP.txt');
  ComboBox10.Items.LoadFromFile(ExtractFilepath(Application.ExeName) +
    'R_SoprotListDown.txt');
  // ComboBox9.Text  := ComboBox9.Items[0];
  // ComboBox10.Text := ComboBox10.Items[0];
  ComboBox9.ItemIndex := 0;
  ComboBox10.ItemIndex := 0;
  for i := 1 to 3 do
    for j := 1 to 3 do
    begin
      StringGrid3.cells[i, j] := '0';
      StringGrid3.ColWidths[i] := 160;
    end;
  enableclose := true;
end;

procedure TFSopr.RadioButton1Click(Sender: TObject);
begin
  enableclose := false;
end;

procedure TFSopr.RadioButton2Click(Sender: TObject);
begin
  enableclose := false;
end;

procedure TFSopr.RadioButton3Click(Sender: TObject);
begin
  enableclose := false;
end;

procedure TFSopr.StringGrid3KeyPress(Sender: TObject; var Key: Char);
begin
  enableclose := false;
  if (StringGrid3.Row = 3) and (StringGrid3.Col = 3) then
    exit;

  if Key = #13 then
  begin
    if (StringGrid3.Row = 3) then
    begin
      if (StringGrid3.cells[StringGrid3.Col, 3] <> '') then
        StringGrid3.Selection :=
          TGridRect(Rect(StringGrid3.Col + 1, 1, StringGrid3.Col + 1, 1));
    end
    else
      StringGrid3.Selection :=
        TGridRect(Rect(StringGrid3.Col, StringGrid3.Row + 1, StringGrid3.Col,
        StringGrid3.Row + 1));

  end;

end;

end.
