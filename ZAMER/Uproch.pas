unit Uproch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.ExtCtrls;

type
  TFProch = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    QTemp: TFDQuery;
    QInsProch: TFDQuery;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Qinsvibro: TFDQuery;
    BitBtn3: TBitBtn;
    QInsZvuk: TFDQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    GroupBox5: TGroupBox;
    Label13: TLabel;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    GroupBox6: TGroupBox;
    Label4: TLabel;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    GroupBox7: TGroupBox;
    Label5: TLabel;
    RadioButton10: TRadioButton;
    RadioButton11: TRadioButton;
    RadioButton12: TRadioButton;
    GroupBox8: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    RadioButton19: TRadioButton;
    RadioButton20: TRadioButton;
    RadioButton21: TRadioButton;
    RadioButton22: TRadioButton;
    Label9: TLabel;
    Edit2: TEdit;
    Panel4: TPanel;
    RadioButton13: TRadioButton;
    RadioButton14: TRadioButton;
    RadioButton15: TRadioButton;
    Panel5: TPanel;
    RadioButton16: TRadioButton;
    RadioButton17: TRadioButton;
    RadioButton18: TRadioButton;
    RadioButton23: TRadioButton;
    RadioButton24: TRadioButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProch: TFProch;

implementation

{$R *.dfm}

uses umain;

procedure TFProch.BitBtn1Click(Sender: TObject);
var
  i, j, inq                    : Integer;
  cod, errx, erry, errx1, erry1: Integer;
  s                            : string;
begin
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('delete from zproch where nomer=' + Quotedstr(Nomer));
  QTemp.ExecSQL;
  if (Edit1.Text = '0') or (Edit2.Text = '0') then
  begin
    ShowMessage('Масса равна нулю либо напряжение рано нулю, нужно исправить');
    Exit;
  end;

  QInsProch.Close;
  QInsProch.PaRAMByName('nomer').Asstring  := Nomer;
  QInsProch.PaRAMByName('eprochu').AsFloat := strtofloat(Edit1.Text);
  QInsProch.PaRAMByName('massa').AsFloat   := strtofloat(Edit2.Text);
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
  { INSERT INTO ZAMER.ZVIBRO (
    NOMER, X, Y,
    VAL)
    VALUES ( :NOMER, :X, :Y,
    :VAL ) }
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('delete from zvibro where nomer=' + Quotedstr(Nomer));
  QTemp.ExecSQL;
  errx    := 0;
  erry    := 0;
  for i   := 1 to 2 do
    for j := 1 to 18 do
    begin
      Qinsvibro.Close;
      Qinsvibro.PaRAMByName('x').AsInteger    := i;
      Qinsvibro.PaRAMByName('y').AsInteger    := j;
      Qinsvibro.PaRAMByName('nomer').Asstring := Nomer;
      s                                       := StringGrid1.cells[j, i];
      val(s, inq, cod);
      if cod <> 0 then
      begin
        inq  := -1;
        errx := i;
        erry := j;
      end;
      Qinsvibro.PaRAMByName('val').AsInteger := inq;
      Qinsvibro.ExecSQL;
    end;
  if (errx <> 0) then
  begin
    ShowMessage('Ошибка преобразования числа виброиспытания, строка ' +
      inttostr(errx) + ', столбец ' + inttostr(erry))
  end;
  /// //////////////////////////////////
  { INSERT INTO ZAMER.ZVIBRO (
    NOMER, X, Y,
    VAL)
    VALUES ( :NOMER, :X, :Y,
    :VAL ) }
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('delete from zzvuk where nomer=' + Quotedstr(Nomer));
  QTemp.ExecSQL;
  errx1   := 0;
  erry1   := 0;
  for i   := 1 to 2 do
    for j := 1 to 8 do
    begin
      QInsZvuk.Close;
      QInsZvuk.PaRAMByName('x').AsInteger    := i;
      QInsZvuk.PaRAMByName('y').AsInteger    := j;
      QInsZvuk.PaRAMByName('nomer').Asstring := Nomer;
      s                                      := StringGrid2.cells[j, i];
      val(s, inq, cod);
      if cod <> 0 then
      begin
        inq   := -1;
        errx1 := i;
        erry1 := j;
      end;
      QInsZvuk.PaRAMByName('val').AsInteger := inq;
      QInsZvuk.ExecSQL;
    end;
  if (errx1 <> 0) then
  begin
    ShowMessage('Ошибка преобразования числа звукоиспытания, строка ' +
      inttostr(errx1) + ', столбец ' + inttostr(erry1))
  end;

  if (errx = 0) and (errx1 = 0) then
  begin
    FMain.Label35.Caption    := 'ПРОЙДЕН';
    FMain.Label35.Font.Color := clGreen;
    FProch.Close;
  end;
end;

procedure TFProch.BitBtn2Click(Sender: TObject);
begin
  FProch.Close;
end;

procedure TFProch.BitBtn3Click(Sender: TObject);
var
  i: Integer;
begin
  RadioButton1.Checked  := false;
  RadioButton2.Checked  := false;
  RadioButton3.Checked  := false;
  RadioButton4.Checked  := false;
  RadioButton5.Checked  := false;
  RadioButton6.Checked  := false;
  RadioButton7.Checked  := false;
  RadioButton8.Checked  := false;
  RadioButton9.Checked  := false;
  RadioButton10.Checked := false;
  RadioButton11.Checked := false;
  RadioButton12.Checked := false;
  RadioButton13.Checked := false;
  RadioButton14.Checked := false;
  RadioButton15.Checked := false;
  RadioButton16.Checked := false;
  RadioButton17.Checked := false;
  RadioButton18.Checked := false;

  RadioButton19.Checked := false;
  RadioButton20.Checked := false;
  RadioButton21.Checked := false;
  RadioButton22.Checked := false;
  RadioButton23.Checked := false;
  RadioButton24.Checked := false;

  Edit1.Text              := '0';
  Edit2.Text              := '0';
  StringGrid2.cells[0, 0] := 'Точки';
  StringGrid2.cells[0, 1] := 'Изм. 1';
  StringGrid2.cells[0, 2] := 'Изм. 2';
  For i                   := 1 to 8 do
  begin
    StringGrid2.cells[i, 0] := inttostr(i);
    StringGrid2.cells[i, 1] := inttostr(0);
    StringGrid2.cells[i, 2] := inttostr(0);
  end;

  // StringGrid2.Cells[0,0]:='Точки';
  StringGrid1.cells[0, 1] := 'Упругое';
  StringGrid1.cells[0, 2] := 'Жесткое';
  For i                   := 1 to 6 do
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
  For i                      := 1 to 18 do
    StringGrid1.ColWidths[i] := 50;
  StringGrid1.ColWidths[0]   := 85;

end;

procedure TFProch.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  StringGrid2.cells[0, 0] := 'Точки';
  StringGrid2.cells[0, 1] := 'Изм. 1';
  StringGrid2.cells[0, 2] := 'Изм. 2';
  For i                   := 1 to 8 do
  begin
    StringGrid2.cells[i, 0] := inttostr(i);
    StringGrid2.cells[i, 1] := inttostr(0);
    StringGrid2.cells[i, 2] := inttostr(0);
  end;

  // StringGrid2.Cells[0,0]:='Точки';
  StringGrid1.cells[0, 1] := 'Упругое';
  StringGrid1.cells[0, 2] := 'Жесткое';
  For i                   := 1 to 6 do
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
  For i                      := 1 to 18 do
    StringGrid1.ColWidths[i] := 50;
  StringGrid1.ColWidths[0]   := 85;

end;

procedure TFProch.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if (ARow > 0) then
  begin
    if (ACol > 0) and (ACol < 7) then
    begin
      StringGrid1.Canvas.Brush.Color := $00990000;
      StringGrid1.Canvas.FillRect(Rect);
      StringGrid1.Canvas.Font.Color := clWhite;
      StringGrid1.Canvas.TextOut(Rect.Left + 1, Rect.Top + 1,
        StringGrid1.cells[ACol, ARow]);
    end;
    if (ACol > 6) and (ACol < 13) then
    begin
      StringGrid1.Canvas.Brush.Color := $00009900;
      StringGrid1.Canvas.FillRect(Rect);
      StringGrid1.Canvas.Font.Color := clWhite;
      StringGrid1.Canvas.TextOut(Rect.Left + 1, Rect.Top + 1,
        StringGrid1.cells[ACol, ARow]);
    end;
    if (ACol > 12) and (ACol < 19) then
    begin
      StringGrid1.Canvas.Brush.Color := $00000099;
      StringGrid1.Canvas.FillRect(Rect);
      StringGrid1.Canvas.Font.Color := clWhite;
      StringGrid1.Canvas.TextOut(Rect.Left + 1, Rect.Top + 1,
        StringGrid1.cells[ACol, ARow]);
    end;
  end;
end;

procedure TFProch.StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
 if ((ARow > 0)and (acol>0)) then
    begin
      StringGrid2.Canvas.Brush.Color := clHotLight;
      StringGrid2.Canvas.FillRect(Rect);
      StringGrid2.Canvas.Font.Color := clWhite;
      StringGrid2.Canvas.TextOut(Rect.Left + 1, Rect.Top + 1,
        StringGrid2.cells[ACol, ARow]);
    end;
end;

end.
