unit UKZam;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  Vcl.ExtCtrls, Math, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFKzam = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    StringGrid1: TStringGrid;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit1: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Timer1: TTimer;
    Timer2: TTimer;
    QTemp: TFDQuery;
    QCommand: TFDQuery;
    QInsAll: TFDQuery;
    QSelectSred: TFDQuery;
    QInsSvod: TFDQuery;
    QTorque: TFDQuery;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Edit2: TEdit;
    Label16: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure CommandStart(c: Integer; n: string; fn: string);
    procedure StringGrid1Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  R = record
    u1, u2, u3, i1, i2, i3, p1, p2, p3, rot, torq, power: real;
  end;

var
  FKzam : TFKzam;
  b     : TBitmap;
  acount: Integer;
  a     : array [1 .. 1000] of R;

implementation

uses umain;
{$R *.dfm}

function min(a: Integer; b: Integer): Integer;
begin
  if a < b then
    result := a
  else
    result := b;
end;

function max(a: Integer; b: Integer): Integer;
begin
  if a > b then
    result := a
  else
    result := b;
end;

procedure TFKzam.BitBtn11Click(Sender: TObject);
begin
  FKzam.Close;
end;

procedure TFKzam.BitBtn12Click(Sender: TObject);
begin
  FMAin.Label31.Caption    := 'ПРОЙДЕН';
  FMAin.Label31.Font.Color := clGreen;
  FKzam.Close;
end;

procedure TFKzam.BitBtn1Click(Sender: TObject);
begin
  BitBtn1.Glyph.LoadFromFile(extractfilepath(paramstr(0)) + 'apply.bmp');
  BitBtn2.Glyph := nil;
  BitBtn3.Glyph := nil;
  BitBtn4.Glyph := nil;
  BitBtn5.Glyph := nil;
  BitBtn6.Glyph := nil;
  BitBtn7.Glyph := nil;
  BitBtn1.Repaint;


end;

procedure TFKzam.BitBtn2Click(Sender: TObject);
begin
  BitBtn1.Glyph := nil;
  BitBtn2.Glyph.LoadFromFile(extractfilepath(paramstr(0)) + 'apply.bmp');
  BitBtn3.Glyph := nil;
  BitBtn4.Glyph := nil;
  BitBtn5.Glyph := nil;
  BitBtn6.Glyph := nil;
  BitBtn7.Glyph := nil;
end;

procedure TFKzam.BitBtn3Click(Sender: TObject);
begin
  BitBtn1.Glyph := nil;
  BitBtn2.Glyph := nil;
  BitBtn3.Glyph.LoadFromFile(extractfilepath(paramstr(0)) + 'apply.bmp');
  BitBtn4.Glyph := nil;
  BitBtn5.Glyph := nil;
  BitBtn6.Glyph := nil;
  BitBtn7.Glyph := nil;
end;

procedure TFKzam.BitBtn4Click(Sender: TObject);
begin
  BitBtn1.Glyph := nil;
  BitBtn2.Glyph := nil;
  BitBtn3.Glyph := nil;
  BitBtn4.Glyph.LoadFromFile(extractfilepath(paramstr(0)) + 'apply.bmp');
  BitBtn5.Glyph := nil;
  BitBtn6.Glyph := nil;
  BitBtn7.Glyph := nil;
end;

procedure TFKzam.BitBtn5Click(Sender: TObject);
begin
  BitBtn1.Glyph := nil;
  BitBtn2.Glyph := nil;
  BitBtn3.Glyph := nil;
  BitBtn4.Glyph := nil;
  BitBtn5.Glyph.LoadFromFile(extractfilepath(paramstr(0)) + 'apply.bmp');
  BitBtn6.Glyph := nil;
  BitBtn7.Glyph := nil;
end;

procedure TFKzam.BitBtn6Click(Sender: TObject);
begin
  BitBtn1.Glyph := nil;
  BitBtn2.Glyph := nil;
  BitBtn3.Glyph := nil;
  BitBtn4.Glyph := nil;
  BitBtn5.Glyph := nil;
  BitBtn6.Glyph.LoadFromFile(extractfilepath(paramstr(0)) + 'apply.bmp');
  BitBtn7.Glyph := nil;
end;

procedure TFKzam.BitBtn7Click(Sender: TObject);
begin
  BitBtn1.Glyph := nil;
  BitBtn2.Glyph := nil;
  BitBtn3.Glyph := nil;
  BitBtn4.Glyph := nil;
  BitBtn5.Glyph := nil;
  BitBtn6.Glyph := nil;
  BitBtn7.Glyph.LoadFromFile(extractfilepath(paramstr(0)) + 'apply.bmp');
end;

procedure TFKzam.CommandStart(c: Integer; n: string; fn: string);
var
  s      : string;
  dectype: string;
begin
  QCommand.SQL.Clear;
  QCommand.SQL.Add
    ('insert into command (nomer, filename, command, dat, interval) values (');
  {
    #define SIMULATOR_DECODER             4
    #define USB_DECODER_T35               6
    #define USB_DECODER_T45               10
  }
  { if (FMAin.RadioButton1.Checked) then
    dectype := '10';
    if (FMAin.RadioButton2.Checked) then
    dectype := '4'; }
  dectype := '10';
  QCommand.SQL.Add(Quotedstr(n) + ',' + Quotedstr(fn) + ',' + inttostr(c) + ','
    + dectype + ', ' + FMAin.Edit12.Text + ')');
  QCommand.ExecSQL;
end;

procedure TFKzam.BitBtn8Click(Sender: TObject);
begin
  acount := 0;
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('truncate table zamertmp');
  QTemp.ExecSQL;
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('delete from zkzall where nomer=' + Quotedstr(Nomer) +
    ' and uisp=' + StringGrid1.cells[0, StringGrid1.row]);
  QTemp.ExecSQL;
  CommandStart(1, Nomer, Label11.Caption);
  Timer1.Enabled  := true;
  Timer2.Enabled  := true;
  BitBtn9.Enabled := true;
  BitBtn8.Enabled := false;
end;

procedure TFKzam.BitBtn9Click(Sender: TObject);
var
  i            : Integer;
  acount1, ncnt: Integer;
begin
  Timer1.Enabled := false;
  Timer2.Enabled := false;
  // вносим данные в таблицу и обрабатываем их
  CommandStart(0, Nomer, Label11.Caption);
  // showmessage('a');
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.Open('select count(*) cnt from zamertmp');
  acount1 := QTemp.FieldByName('cnt').AsInteger;
  ncnt    := min(acount, acount1);
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.Open('select * from zamertmp');
  QTemp.First;
  for i := 1 to ncnt do
  begin
    QInsAll.ParamByName('NOMER').AsString := Nomer;
    QInsAll.ParamByName('UISP').AsFloat   := Strtofloat(Label11.Caption);
    QInsAll.ParamByName('U12').AsFloat    := a[i].u1;
    QInsAll.ParamByName('U23').AsFloat    := a[i].u2;
    QInsAll.ParamByName('U31').AsFloat    := a[i].u3;
    QInsAll.ParamByName('I1').AsFloat     := a[i].i1;
    QInsAll.ParamByName('I2').AsFloat     := a[i].i2;
    QInsAll.ParamByName('I3').AsFloat     := a[i].i3;
    QInsAll.ParamByName('P1').AsFloat     := a[i].p1;
    QInsAll.ParamByName('P2').AsFloat     := a[i].p2;
    QInsAll.ParamByName('P3').AsFloat     := a[i].p3;
    QInsAll.ParamByName('torq').AsFloat   :=
      SimpleRoundTo(QTemp.FieldByName('torq').AsFloat, -2);
    QInsAll.ExecSQL;
    QTemp.Next;
  end;

  QSelectSred.Close;
  QSelectSred.ParamByName('nomer').AsString := Nomer;
  QSelectSred.ParamByName('uisp').AsFloat   := Strtofloat(Label11.Caption);
  QSelectSred.Open;

  QInsSvod.Close;

  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('delete from zkzsvod where nomer=' + Quotedstr(Nomer) +
    ' and uisp=' + Label11.Caption);
  QTemp.ExecSQL;

  QInsSvod.ParamByName('nomer').AsString := Nomer;
  QInsSvod.ParamByName('uisp').AsFloat   := Strtofloat(Label11.Caption);
  QInsSvod.ParamByName('r').AsFloat   := Strtofloat(Edit2.Text);
  QInsSvod.ParamByName('u').AsFloat   := QSelectSred.FieldByName('u').AsFloat;
  QInsSvod.ParamByName('i').AsFloat   := QSelectSred.FieldByName('i').AsFloat;
  QInsSvod.ParamByName('p').AsFloat   := QSelectSred.FieldByName('p').AsFloat;
  QInsSvod.ParamByName('m').AsFloat   := QSelectSred.FieldByName('t').AsFloat;
  QInsSvod.ParamByName('tmp').AsFloat := 0;

  QInsSvod.ExecSQL;

  StringGrid1.cells[1, StringGrid1.row] := QSelectSred.FieldByName('u')
    .AsString;
  StringGrid1.cells[2, StringGrid1.row] := QSelectSred.FieldByName('i')
    .AsString;
  StringGrid1.cells[3, StringGrid1.row] := QSelectSred.FieldByName('p')
    .AsString;
  StringGrid1.cells[4, StringGrid1.row] := QSelectSred.FieldByName('t')
    .AsString;

  /// //////////////////////////////////////////////////////////////////////////
  BitBtn9.Enabled := false;
  BitBtn8.Enabled := false;
end;

procedure TFKzam.FormActivate(Sender: TObject);
begin
  StringGrid1.cells[0, 1] :=
    floattostr(round(Strtofloat(FMAin.Edit5.Text) / 3.8));
  StringGrid1.cells[0, 2] := floattostr(round(Strtofloat(FMAin.Edit5.Text)));
end;

procedure TFKzam.FormCreate(Sender: TObject);
begin
  StringGrid1.cells[0, 0] := 'U кк';
  StringGrid1.cells[1, 0] := 'U сред';
  StringGrid1.cells[2, 0] := 'I сред';
  StringGrid1.cells[3, 0] := 'P сред';
  StringGrid1.cells[4, 0] := 'М сред';
  Label14.Caption         := '0';
end;

procedure TFKzam.StringGrid1Click(Sender: TObject);
begin
  if StringGrid1.cells[0, StringGrid1.row] <> '' then
  begin
    Label11.Caption := StringGrid1.cells[0, StringGrid1.row];
    BitBtn8.Enabled := true;
  end;
end;

procedure TFKzam.Timer1Timer(Sender: TObject);
begin
  Label7.Caption := FMAin.KrVarLabel1.Caption;
  Label8.Caption := FMAin.KrVarLabel2.Caption;
  Label9.Caption := FMAin.KrVarLabel3.Caption;
  QTorque.Close;
  QTorque.Open;
  Label10.Caption := QTorque.FieldByName('torq').AsString;;

end;

procedure TFKzam.Timer2Timer(Sender: TObject);
begin
  acount := acount + 1;
  if acount >= 1000 then
  begin
    Timer2.Enabled := false;
    BitBtn9Click(FKzam);
    ShowMessage('Достигнуто предельное количество замеров, замер остановлен');
  end
  else
  begin
    a[acount].u1 := SimpleRoundTo(FMAin.RU1.Value, -4);
    a[acount].u2 := SimpleRoundTo(FMAin.RU2.Value, -4);
    a[acount].u3 := SimpleRoundTo(FMAin.RU3.Value, -4);
    a[acount].i1 := SimpleRoundTo(FMAin.RI1.Value, -4);
    a[acount].i2 := SimpleRoundTo(FMAin.RI2.Value, -4);
    a[acount].i3 := SimpleRoundTo(FMAin.RI3.Value, -4);
    a[acount].p1 := SimpleRoundTo(FMAin.RP1.Value, -4);
    a[acount].p2 := SimpleRoundTo(FMAin.RP2.Value, -4);
    a[acount].p3 := SimpleRoundTo(FMAin.RP3.Value, -4);
    if acount mod 10 = 0 then
      Label14.Caption := inttostr(acount);

  end;
end;

end.
