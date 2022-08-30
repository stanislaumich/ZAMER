unit USoprot;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.Grids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, ustr;

type
  TFSoprot = class(TForm)
    Label34: TLabel;
    Edit8: TEdit;
    Label35: TLabel;
    ComboBox7: TComboBox;
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
    BitBtn5: TBitBtn;
    BitBtn1: TBitBtn;
    QSoprot: TFDQuery;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSoprot: TFSoprot;

implementation

uses umain;
{$R *.dfm}

procedure TFSoprot.BitBtn1Click(Sender: TObject);
begin
  Edit8.Text      := '';
  Edit13.Text     := '';
  Edit16.Text     := '';
  ComboBox7.Text  := '';
  ComboBox8.Text  := '';
  ComboBox9.Text  := '';
  ComboBox10.Text := '';
end;

procedure TFSoprot.BitBtn5Click(Sender: TObject);
var
  i, j: integer;
begin

  Fmain.Qtemp.Close;
  Fmain.Qtemp.SQL.Clear;
  Fmain.Qtemp.SQL.add('delete from ZSOPROT where nomer=' +
    Quotedstr(Label1.Caption));
  Fmain.Qtemp.ExecSQL;
  QSoprot.Close;
  try
    QSoprot.ParamByName('NOMER').Asstring := Label1.Caption;
    QSoprot.ParamByName('TEMPER').AsFloat :=
      Strtofloat(strreplace(Edit8.Text, '.', ','));
    QSoprot.ParamByName('PHAS').Asstring     := ComboBox7.Text;
    QSoprot.ParamByName('SOED').Asstring     := ComboBox8.Text;
    QSoprot.ParamByName('SOPRED').Asstring   := ComboBox9.Text;
    QSoprot.ParamByName('IZOLED').Asstring   := ComboBox10.Text;
    QSoprot.ParamByName('IZOLKORP').AsFloat  := Strtofloat(Edit13.Text);
    QSoprot.ParamByName('IZOLOBMOT').AsFloat := Strtofloat(Edit16.Text);

    for i   := 1 to 3 do
      for j := 1 to 3 do
        if StringGrid3.cells[i, j] = '' then
          StringGrid3.cells[i, j] := '0';

    QSoprot.ParamByName('IZM1U1U2').AsFloat :=
      Strtofloat(StringGrid3.cells[1, 1]);
    QSoprot.ParamByName('IZM2U1U2').AsFloat :=
      Strtofloat(StringGrid3.cells[1, 2]);
    QSoprot.ParamByName('IZM3U1U2').AsFloat :=
      Strtofloat(StringGrid3.cells[1, 3]);
    QSoprot.ParamByName('IZM1V1V2').AsFloat :=
      Strtofloat(StringGrid3.cells[2, 1]);
    QSoprot.ParamByName('IZM2V1V2').AsFloat :=
      Strtofloat(StringGrid3.cells[2, 2]);
    QSoprot.ParamByName('IZM3V1V2').AsFloat :=
      Strtofloat(StringGrid3.cells[2, 3]);
    QSoprot.ParamByName('IZM1W1W2').AsFloat :=
      Strtofloat(StringGrid3.cells[3, 1]);
    QSoprot.ParamByName('IZM2W1W2').AsFloat :=
      Strtofloat(StringGrid3.cells[3, 2]);
    QSoprot.ParamByName('IZM3W1W2').AsFloat :=
      Strtofloat(StringGrid3.cells[3, 3]);
  except
    on E: Exception do
    begin
      ShowMessage
        ('��������� ��������� ������, ��� ���� ������ ���� ���������!');
      E := NIL;
    end;
  end;
  QSoprot.ExecSQL;
  ShowMessage('�������!');
  Fmain.Label28.font.Color := clGreen;
  Fmain.Label28.Caption    := '�������';
  FSoprot.Close;
end;

procedure TFSoprot.FormCreate(Sender: TObject);
var
  i, j: integer;
begin

  StringGrid3.cells[0, 1] := '���. 1';
  StringGrid3.cells[0, 2] := '���. 2';
  StringGrid3.cells[0, 3] := '���. 3';

  StringGrid3.cells[1, 0] := 'U1-U2(U-V)/��.';
  StringGrid3.cells[2, 0] := 'V1-V2(V-W)/���.';
  StringGrid3.cells[3, 0] := 'W1-W2(W-U)';

  for i   := 1 to 3 do
    for j := 1 to 3 do
    begin
      StringGrid3.cells[i, j]  := '111111';
      StringGrid3.ColWidths[i] := 150;
    end;

end;

end.
