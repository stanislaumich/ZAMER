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

    QSoprot.ParamByName('IZM1U1U2').AsFloat :=
      Strtofloat(StringGrid3.Cells[1, 1]);
    QSoprot.ParamByName('IZM2U1U2').AsFloat :=
      Strtofloat(StringGrid3.Cells[1, 2]);
    QSoprot.ParamByName('IZM3U1U2').AsFloat :=
      Strtofloat(StringGrid3.Cells[1, 3]);
    QSoprot.ParamByName('IZM1V1V2').AsFloat :=
      Strtofloat(StringGrid3.Cells[2, 1]);
    QSoprot.ParamByName('IZM2V1V2').AsFloat :=
      Strtofloat(StringGrid3.Cells[2, 2]);
    QSoprot.ParamByName('IZM3V1V2').AsFloat :=
      Strtofloat(StringGrid3.Cells[2, 3]);
    QSoprot.ParamByName('IZM1W1W2').AsFloat :=
      Strtofloat(StringGrid3.Cells[3, 1]);
    QSoprot.ParamByName('IZM2W1W2').AsFloat :=
      Strtofloat(StringGrid3.Cells[3, 2]);
    QSoprot.ParamByName('IZM3W1W2').AsFloat :=
      Strtofloat(StringGrid3.Cells[3, 3]);
  except
    on E: Exception do
    begin
      ShowMessage
        ('Проверьте введенные данные, все поля должны быть заполнены!');
      E := NIL;
    end;
  end;
  QSoprot.ExecSQL;
  ShowMessage('Внесено!');
  Fmain.Label28.font.Color := clGreen;
  Fmain.Label28.Caption    := 'ПРОЙДЕН';
  FSoprot.Close;
end;

end.
