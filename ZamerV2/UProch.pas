unit UProch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFProch = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton19: TRadioButton;
    GroupBox5: TGroupBox;
    Label13: TLabel;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton20: TRadioButton;
    GroupBox6: TGroupBox;
    Label4: TLabel;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    RadioButton21: TRadioButton;
    GroupBox7: TGroupBox;
    Label5: TLabel;
    RadioButton10: TRadioButton;
    RadioButton11: TRadioButton;
    RadioButton12: TRadioButton;
    RadioButton22: TRadioButton;
    GroupBox8: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Panel4: TPanel;
    RadioButton13: TRadioButton;
    RadioButton14: TRadioButton;
    RadioButton15: TRadioButton;
    RadioButton23: TRadioButton;
    Panel5: TPanel;
    RadioButton16: TRadioButton;
    RadioButton17: TRadioButton;
    RadioButton18: TRadioButton;
    RadioButton24: TRadioButton;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBox2: TGroupBox;
    StringGrid1: TStringGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    StringGrid2: TStringGrid;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label9: TLabel;
    Edit2: TEdit;
    Panel6: TPanel;
    Label3: TLabel;
    Label6: TLabel;
    QInsProch: TFDQuery;
    Qinsvibro: TFDQuery;
    QInsZvuk: TFDQuery;
    QTemp: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProch: TFProch;
  enableclose: Boolean;

implementation

{$R *.dfm}

uses Uzv2Main;

procedure TFProch.BitBtn1Click(Sender: TObject);
var
  i, j: Integer;
  cod, errx, erry, errx1, erry1: Integer;
  s: string;
  inq: real;
begin
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('delete from zproch where nomer=' + Quotedstr(Label6.Caption));
  QTemp.ExecSQL;
  if (Edit1.Text = '0') or (Edit2.Text = '0') then
  begin
    ShowMessage('Масса равна нулю либо напряжение рано нулю, нужно исправить');
    Exit;
  end;

  QInsProch.Close;
  QInsProch.PaRAMByName('nomer').Asstring := Label6.Caption;
  QInsProch.PaRAMByName('eprochu').AsFloat := strtofloat(Edit1.Text);
  QInsProch.PaRAMByName('massa').AsFloat := strtofloat(Edit2.Text);
  // ----------------------------
  If RadioButton1.Checked then
    QInsProch.PaRAMByName('eproch').AsInteger := 1;
  If RadioButton2.Checked then
    QInsProch.PaRAMByName('eproch').AsInteger := 2;
  If RadioButton3.Checked then
    QInsProch.PaRAMByName('eproch').AsInteger := 0;
  // ------------------------------
  If RadioButton4.Checked then
    QInsProch.PaRAMByName('HIFREQ').AsInteger := 1;
  If RadioButton5.Checked then
    QInsProch.PaRAMByName('HIFREQ').AsInteger := 2;
  If RadioButton6.Checked then
    QInsProch.PaRAMByName('HIFREQ').AsInteger := 0;
  // ------------------------------
  If RadioButton7.Checked then
    QInsProch.PaRAMByName('PEREGRUZ').AsInteger := 1;
  If RadioButton8.Checked then
    QInsProch.PaRAMByName('PEREGRUZ').AsInteger := 2;
  If RadioButton9.Checked then
    QInsProch.PaRAMByName('PEREGRUZ').AsInteger := 0;
  // ------------------------------
  If RadioButton10.Checked then
    QInsProch.PaRAMByName('RIZOL').AsInteger := 1;
  If RadioButton11.Checked then
    QInsProch.PaRAMByName('RIZOL').AsInteger := 2;
  If RadioButton12.Checked then
    QInsProch.PaRAMByName('RIZOL').AsInteger := 0;
  // ------------------------------
  If RadioButton13.Checked then
    QInsProch.PaRAMByName('U074').AsInteger := 1;
  If RadioButton14.Checked then
    QInsProch.PaRAMByName('U074').AsInteger := 2;
  If RadioButton15.Checked then
    QInsProch.PaRAMByName('U074').AsInteger := 0;
  // ------------------------------
  If RadioButton16.Checked then
    QInsProch.PaRAMByName('U113').AsInteger := 1;
  If RadioButton17.Checked then
    QInsProch.PaRAMByName('U113').AsInteger := 2;
  If RadioButton18.Checked then
    QInsProch.PaRAMByName('U113').AsInteger := 0;
  // ------------------------------

  QInsProch.ExecSQL;
  /// //////////////////////////////////
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('delete from zvibro where nomer=' + Quotedstr(Label6.Caption));
  QTemp.ExecSQL;
  errx := 0;
  erry := 0;
  for i := 1 to 2 do
    for j := 1 to 18 do
    begin
      Qinsvibro.Close;
      Qinsvibro.PaRAMByName('x').AsInteger := i;
      Qinsvibro.PaRAMByName('y').AsInteger := j;
      Qinsvibro.PaRAMByName('nomer').Asstring := Label6.Caption;
      s := StringGrid1.cells[j, i];
      s := StringReplace(s, ',', '.', [rfReplaceAll]);
      val(s, inq, cod);
      if cod <> 0 then
      begin
        inq := -1;
        errx := i;
        erry := j;
      end;
      Qinsvibro.PaRAMByName('val').AsFloat := inq;
      Qinsvibro.ExecSQL;
    end;
  if (errx <> 0) then
  begin
    ShowMessage('Ошибка преобразования числа виброиспытания, строка ' +
      inttostr(errx) + ', столбец ' + inttostr(erry))
  end;
  /// //////////////////////////////////

  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('delete from zzvuk where nomer=' + Quotedstr(Label6.Caption));
  QTemp.ExecSQL;
  errx1 := 0;
  erry1 := 0;
  for i := 1 to 2 do
    for j := 1 to 8 do
    begin
      QInsZvuk.Close;
      QInsZvuk.PaRAMByName('x').AsInteger := i;
      QInsZvuk.PaRAMByName('y').AsInteger := j;
      QInsZvuk.PaRAMByName('nomer').Asstring := Label6.Caption;
      s := StringGrid2.cells[j, i];
      s := StringReplace(s, ',', '.', [rfReplaceAll]);
      val(s, inq, cod);
      if cod <> 0 then
      begin
        inq := -1;
        errx1 := i;
        erry1 := j;
      end;
      QInsZvuk.PaRAMByName('val').AsFloat := inq;
      QInsZvuk.ExecSQL;
    end;
  if (errx1 <> 0) then
  begin
    ShowMessage('Ошибка преобразования числа звукоиспытания, строка ' +
      inttostr(errx1) + ', столбец ' + inttostr(erry1))
  end;
  FProch.Close;
  FZamerV2.ImgSet(FZamerV2.Image7, True);
end;

procedure TFProch.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  buttonSelected: Integer;
begin
  if enableclose then
    CanClose := True
  else
  begin
    buttonSelected :=
      MessageDlg('У вас есть несохраненные данные, сохранить их?',
      mtConfirmation, [mbYes, mbNo, mbCancel], 0);
    if buttonSelected = mrYes then
    begin
      BitBtn1.Click;
      CanClose := True;
    end;
    if buttonSelected = mrNo then
      CanClose := True;
    if buttonSelected = mrCancel then
      CanClose := false;
  end;
end;

procedure TFProch.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  enableclose := True;
  StringGrid2.cells[0, 0] := 'Точки';
  StringGrid2.cells[0, 1] := 'Изм. 1';
  StringGrid2.cells[0, 2] := 'Изм. 2';
  For i := 1 to 8 do
  begin
    StringGrid2.cells[i, 0] := inttostr(i);
    StringGrid2.cells[i, 1] := inttostr(0);
    StringGrid2.cells[i, 2] := inttostr(0);
  end;

  StringGrid1.cells[0, 1] := 'Упругое';
  StringGrid1.cells[0, 2] := 'Жесткое';
  For i := 1 to 6 do
  begin
    StringGrid1.cells[i, 0] := 'мм/с';
    StringGrid1.cells[i, 1] := inttostr(0);
    StringGrid1.cells[i, 2] := inttostr(0);
  end;
  For i := 7 to 12 do
  begin
    StringGrid1.cells[i, 0] := 'мкм';
    StringGrid1.cells[i, 1] := inttostr(0);
    StringGrid1.cells[i, 2] := inttostr(0);
  end;
  For i := 13 to 18 do
  begin
    StringGrid1.cells[i, 0] := 'м/c2';
    StringGrid1.cells[i, 1] := inttostr(0);
    StringGrid1.cells[i, 2] := inttostr(0);
  end;
  For i := 1 to 18 do
    StringGrid1.ColWidths[i] := 50;
  StringGrid1.ColWidths[0] := 85;

end;

procedure TFProch.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    if (StringGrid1.Col < StringGrid1.Colcount - 1) then
      StringGrid1.Col := StringGrid1.Col + 1
    else
    begin
      StringGrid1.Col := 1;
      if StringGrid1.row = 1 then
        StringGrid1.row := 2
      else
        StringGrid1.row := 1;
    end;
  end;

end;

procedure TFProch.StringGrid2KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    if (StringGrid2.Col < StringGrid2.Colcount - 1) then
      StringGrid2.Col := StringGrid2.Col + 1
    else
    begin
      StringGrid2.Col := 1;
      if StringGrid2.row = 1 then
        StringGrid2.row := 2
      else
        StringGrid2.row := 1;
    end;
  end;
end;

end.
