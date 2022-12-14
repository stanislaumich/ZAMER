unit UKZ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.Buttons, System.Actions, Vcl.ActnList, uadd, math;

type
  TFKZ = class(TForm)
    QTemp: TFDQuery;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Edit1: TEdit;
    GroupBox2: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    StringGrid1: TStringGrid;
    Edit2: TEdit;
    BitBtn10: TBitBtn;
    BitBtn12: TBitBtn;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    TimerUp: TTimer;
    QUp: TFDQuery;
    BitBtn1: TBitBtn;
    Qe: TFDQuery;
    Qm: TFDQuery;
    QInsAll: TFDQuery;
    QSelectsred: TFDQuery;
    QInsSvod: TFDQuery;
    Label18: TLabel;
    Label19: TLabel;
    ComboBox1: TComboBox;
    procedure BitBtn8Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure TimerUpTimer(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Edit2Change(Sender: TObject);
  private
    { Private declarations }
  public
    procedure command(b: Boolean);
  end;

var
  FKZ        : TFKZ;
  enableclose: Boolean;
  interval   : integer;
  fname      : string;

implementation

{$R *.dfm}

Uses uzv2Main, UAuto;

procedure TFKZ.command(b: Boolean);
begin
  interval := 50;
  fname    := '1600';
  if b then
  begin
    QTemp.Close;
    QTemp.SQL.Clear;

    QTemp.SQL.Add
      ('insert into command (nomer, filename,command, dat,interval) values(' +
      Quotedstr(Nomer) + ' ,' + fname + ', 1, ' + '4' + ',' +
      inttostr(interval) + ')');
    QTemp.ExecSQL;
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
    QTemp.SQL.Add
      ('insert into command (nomer, filename,command, dat,interval) values(' +
      Quotedstr(Nomer) + ' ,' + fname + ', 0, ' + '4' + ',' +
      inttostr(interval) + ')');
    QTemp.ExecSQL;
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('insert into command (nomer, command) values(' +
      Quotedstr(Nomer) + ' , 10)');
    QTemp.ExecSQL;
  end;
end;

procedure TFKZ.Edit2Change(Sender: TObject);
begin
  enableclose := false;
end;

procedure TFKZ.Action1Execute(Sender: TObject);
begin
  BitBtn8Click(FKZ);
end;

procedure TFKZ.Action2Execute(Sender: TObject);
begin
  BitBtn9Click(FKZ);
end;

procedure TFKZ.BitBtn10Click(Sender: TObject);
var
  i, j: integer;
begin
  for i                       := 1 to StringGrid1.ColCount - 1 do
    for j                     := 1 to StringGrid1.RowCount - 1 do
      StringGrid1.Cells[i, j] := '';
  Edit2.Text                  := '';
  enableclose                 := false;
end;

procedure TFKZ.BitBtn12Click(Sender: TObject);
var
  s  : string;
  cod: integer;
  f  : Real;
begin
  QTemp.Close;
  QTemp.SQL.Clear;
  if Edit2.Text = '' then
  begin
    ShowMessage('?????????? ??????? ????????????? ??? ??????????!');
    exit;
  end;
  s := Edit2.Text;
  s := StringReplace(s, ',', '.', [rfReplaceAll, rfIgnoreCase]);
  val(s, f, cod);
  if cod <> 0 then
  begin
    ShowMessage('????????????? ?? ???????? ??????');
    exit;
  end;

  QTemp.SQL.Add('update zkzsvod set r=' + s);
  QTemp.SQL.Add(' where nomer=' + Quotedstr(Nomer) + ' and uisp=' +
    Label19.caption);
  QTemp.ExecSQL;

  enableclose := True;
  FKZ.Close;
end;

procedure TFKZ.BitBtn1Click(Sender: TObject);
begin
  Fauto.ShowModal;
end;

// start f5
procedure TFKZ.BitBtn8Click(Sender: TObject);

begin
  { if Edit2.text = '' then
    begin
    Showmessage('?? ??????? ?????????????!');
    exit;
    end;
  }
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('truncate table zamertmp');
  QTemp.ExecSQL;
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('delete from zkzall where nomer=' + Quotedstr(Nomer) +
    ' and uisp=' + StringGrid1.Cells[0, StringGrid1.row]);
  QTemp.ExecSQL;
  command(True);
  StringGrid1.Enabled := false;
  BitBtn9.Enabled     := True;
  BitBtn8.Enabled     := false;
  enableclose         := false;
end;

// end f9
procedure TFKZ.BitBtn9Click(Sender: TObject);
// type
// rec = record
// u, i, p, u1, u2, u3, i1, i2, i3, p1, p2, p3, torq: single;
// end;
var
  // a  : array [1 .. 1000] of rec;
  i            : integer;
  max          : integer;
  el, m45, ncnt: integer;
  e            : Boolean;
begin
  command(false);

  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('delete from zkzall where nomer=' + Quotedstr(Nomer) +
    ' and uisp=' + StringGrid1.Cells[0, StringGrid1.row]);
  QTemp.ExecSQL;
  Qm.Close;
  Qe.Close;
  Qm.Open;
  Qe.Open;
  e := True;
  while e do
  begin
    QInsAll.ParamByName('NOMER').AsString := Nomer;
    QInsAll.ParamByName('UISP').AsFloat   := Strtofloat(Label13.caption);
    QInsAll.ParamByName('U12').AsFloat    :=
      SimpleRoundTo(Qe.Fieldbyname('u1').AsFloat, RazU);
    QInsAll.ParamByName('U23').AsFloat :=
      SimpleRoundTo(Qe.Fieldbyname('u2').AsFloat, RazU);
    QInsAll.ParamByName('U31').AsFloat :=
      SimpleRoundTo(Qe.Fieldbyname('u3').AsFloat, RazU);
    QInsAll.ParamByName('I1').AsFloat :=
      SimpleRoundTo(Qe.Fieldbyname('i1').AsFloat, RazI);
    QInsAll.ParamByName('I2').AsFloat :=
      SimpleRoundTo(Qe.Fieldbyname('i2').AsFloat, RazI);
    QInsAll.ParamByName('I3').AsFloat :=
      SimpleRoundTo(Qe.Fieldbyname('i3').AsFloat, RazI);
    QInsAll.ParamByName('P1').AsFloat :=
      SimpleRoundTo(Qe.Fieldbyname('p1').AsFloat, RazP);
    QInsAll.ParamByName('P2').AsFloat :=
      SimpleRoundTo(Qe.Fieldbyname('p1').AsFloat, RazP);
    QInsAll.ParamByName('P3').AsFloat :=
      SimpleRoundTo(Qe.Fieldbyname('p1').AsFloat, RazP);
    QInsAll.ParamByName('torq').AsFloat :=
      SimpleRoundTo(Qm.Fieldbyname('torq').AsFloat, RazM);
    QInsAll.ExecSQL;

    Qm.next;
    Qe.next;
    e := not Qe.eof and not Qm.eof;
  end;

  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('delete from zkzsvod where nomer=' + Quotedstr(Nomer) +
    ' and uisp=' + Label13.caption);
  QTemp.ExecSQL;

  QSelectsred.Close;
  QSelectsred.ParamByName('nomer').AsString := Nomer;
  QSelectsred.ParamByName('uisp').AsFloat   := Strtofloat(Label13.caption);
  QSelectsred.Open;

  StringGrid1.Cells[1, StringGrid1.row] :=
    FloatToStr(SimpleRoundTo(QSelectsred.Fieldbyname('u').AsFloat, RazU));
  StringGrid1.Cells[2, StringGrid1.row] :=
    FloatToStr(SimpleRoundTo(QSelectsred.Fieldbyname('i').AsFloat, RazI));
  StringGrid1.Cells[3, StringGrid1.row] :=
    FloatToStr(SimpleRoundTo(QSelectsred.Fieldbyname('p').AsFloat, RazP));
  StringGrid1.Cells[4, StringGrid1.row] :=
    FloatToStr(SimpleRoundTo(QSelectsred.Fieldbyname('t').AsFloat, RazM));

  QInsSvod.ParamByName('nomer').AsString := Nomer;
  QInsSvod.ParamByName('uisp').AsFloat   := Strtofloat(Label13.caption);
  // if stringgrid1.row=1 then
  QInsSvod.ParamByName('r').AsFloat := 0;
  // SimpleRoundTo(Strtofloat(Edit2.text), RazR);

  QInsSvod.ParamByName('u').AsFloat :=
    SimpleRoundTo(QSelectsred.Fieldbyname('u').AsFloat, RazU);
  QInsSvod.ParamByName('i').AsFloat :=
    SimpleRoundTo(QSelectsred.Fieldbyname('i').AsFloat, RazI);
  QInsSvod.ParamByName('p').AsFloat :=
    SimpleRoundTo(QSelectsred.Fieldbyname('p').AsFloat, RazP);
  QInsSvod.ParamByName('m').AsFloat :=
    SimpleRoundTo(QSelectsred.Fieldbyname('t').AsFloat, RazM);
  QInsSvod.ParamByName('tmp').AsFloat    := 0;
  QInsSvod.ParamByName('edizm').AsString := ComboBox1.Text;
  QInsSvod.ExecSQL;

  Qm.Close;
  Qe.Close;
  /// //////////////////////////////////////////////////////////////////////////
  BitBtn9.Enabled     := false;
  BitBtn8.Enabled     := false;
  StringGrid1.Enabled := True;
end;

procedure TFKZ.FormActivate(Sender: TObject);
begin
  enableclose := True;
  QTemp.Open('select * from zdelta where name=' + Quotedstr('ukz'));
  Edit1.Text      := QTemp.Fieldbyname('value').AsString;
  Nomer           := Label2.caption;
  TimerUp.Enabled := True;
  Label19.caption := FZamerV2.CombUIsp.Text;

  StringGrid1.RowCount    := 6;
  StringGrid1.Cells[0, 0] := 'U ??';
  StringGrid1.Cells[1, 0] := 'U ????';
  StringGrid1.Cells[2, 0] := 'I ????';
  StringGrid1.Cells[3, 0] := 'P ????';
  StringGrid1.Cells[4, 0] := '? ????';
  StringGrid1.Cells[0, 2] := Label19.caption;
  StringGrid1.Cells[0, 1] := inttostr(Round(Strtoint(Label19.caption) / 3.8));

end;

procedure TFKZ.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TimerUp.Enabled := false;
end;

procedure TFKZ.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  buttonSelected: integer;
begin
  if enableclose then
    CanClose := True
  else
  begin
    buttonSelected :=
      MessageDlg('? ??? ???? ????????????? ??????, ????????? ???',
      mtConfirmation, [mbYes, mbNo, mbCancel], 0);
    if buttonSelected = mrYes then
    begin
      BitBtn12.Click;
      CanClose := True;
    end;
    if buttonSelected = mrNo then
      CanClose := True;
    if buttonSelected = mrCancel then
      CanClose := false;
  end;
end;

procedure TFKZ.FormCreate(Sender: TObject);
begin
  ComboBox1.Items.LoadFromFile(ExtractFilepath(Application.ExeName) +
    'R_KZamList.txt');
  ComboBox1.ItemIndex := 0;
end;

procedure TFKZ.FormHide(Sender: TObject);
begin
  TimerUp.Enabled := false;

  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('update zdelta set value= ' + Quotedstr(Edit1.Text) +
    ' where name=' + Quotedstr('ukz'));
  QTemp.ExecSQL;

end;

procedure TFKZ.StringGrid1Click(Sender: TObject);
begin
  if StringGrid1.Cells[0, StringGrid1.row] <> '' then
  begin
    Label13.caption := StringGrid1.Cells[0, StringGrid1.row];
    BitBtn8.Enabled := True;
  end;
end;

procedure TFKZ.TimerUpTimer(Sender: TObject);
begin
  QUp.Close;
  QUp.Open();
  Label11.caption := myformat(trazp, QUp.Fieldbyname('P').AsFloat);
  Label10.caption := myformat(trazi, QUp.Fieldbyname('I').AsFloat);
  Label12.caption := myformat(trazm, QUp.Fieldbyname('M').AsFloat);
  if ABS(QUp.Fieldbyname('U').AsFloat - Strtofloat(Label13.caption)) >
    myfloat(Edit1.Text) then
    Label9.Font.Color := clRed
  else
    Label9.Font.Color := clGreen;
  Label9.caption      := myformat(trazu, QUp.Fieldbyname('U').AsFloat);
end;

end.
