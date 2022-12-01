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
    Label17: TLabel;
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
  private
    { Private declarations }
  public
    procedure command(b: Boolean);
  end;

var
  FKZ        : TFKZ;
  enableclose: Boolean;
  interval:integer;
  fname:string;
implementation

{$R *.dfm}

Uses uzv2Main, UAuto;

procedure TFKZ.command(b: Boolean);
begin
 interval:=50;
 fname:='1600';
  if b then
  begin
    QTemp.Close;
    QTemp.SQL.Clear;

    QTemp.SQL.Add('insert into command (nomer, filename,command, dat,interval) values(' +
      Quotedstr(Nomer) + ' ,'+fname+', 1, '+'4'+','+inttostr(interval)+')');
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
    QTemp.SQL.Add('insert into command (nomer, filename,command, dat,interval) values(' +
      Quotedstr(Nomer) + ' ,'+fname+', 0, '+'4'+','+inttostr(interval)+')');
    QTemp.ExecSQL;
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('insert into command (nomer, command) values(' +
      Quotedstr(Nomer) + ' , 10)');
    QTemp.ExecSQL;
  end;
end;

procedure TFKZ.Action1Execute(Sender: TObject);
begin
  BitBtn8Click(FKZ);
end;

procedure TFKZ.Action2Execute(Sender: TObject);
begin
  BitBtn9Click(FKZ);
end;

procedure TFKZ.BitBtn1Click(Sender: TObject);
begin
  Fauto.ShowModal;
end;

// start f5
procedure TFKZ.BitBtn8Click(Sender: TObject);

begin
  if edit2.text='0' then
   begin
    Showmessage('Не указано сопротивление!');
    exit;
   end;
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('truncate table zamertmp');
  QTemp.ExecSQL;
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('delete from zkzall where nomer=' + Quotedstr(Nomer) +
    ' and uisp=' + StringGrid1.cells[0, StringGrid1.row]);
  QTemp.ExecSQL;
  command(true);
  StringGrid1.Enabled := false;
  BitBtn9.Enabled     := true;
  BitBtn8.Enabled     := false;
end;

// end f9
procedure TFKZ.BitBtn9Click(Sender: TObject);
//type
//  rec = record
//    u, i, p, u1, u2, u3, i1, i2, i3, p1, p2, p3, torq: single;
//  end;
var
  //a  : array [1 .. 1000] of rec;
  i  : integer;
  max: integer;
  el, m45, ncnt:integer;
  e:boolean;
begin
  command(false);

  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('delete from zkzall where nomer=' + Quotedstr(Nomer) +
    ' and uisp=' + StringGrid1.cells[0, StringGrid1.row]);
  QTemp.ExecSQL;
  Qm.Close;
  Qe.Close;
  Qm.Open;
  Qe.Open;
  e:=true;
  while e do
   begin
    QInsAll.ParamByName('NOMER').AsString := Nomer;
    QInsAll.ParamByName('UISP').AsFloat   := Strtofloat(Label13.Caption);
    QInsAll.ParamByName('U12').AsFloat    := SimpleRoundTo(Qe.Fieldbyname('u1').Asfloat,RazU);
    QInsAll.ParamByName('U23').AsFloat    := SimpleRoundTo(Qe.Fieldbyname('u2').Asfloat,RazU);
    QInsAll.ParamByName('U31').AsFloat    := SimpleRoundTo(Qe.Fieldbyname('u3').Asfloat,RazU);
    QInsAll.ParamByName('I1').AsFloat     := SimpleRoundTo(Qe.Fieldbyname('i1').Asfloat,RazI);
    QInsAll.ParamByName('I2').AsFloat     := SimpleRoundTo(Qe.Fieldbyname('i2').Asfloat,RazI);
    QInsAll.ParamByName('I3').AsFloat     := SimpleRoundTo(Qe.Fieldbyname('i3').Asfloat,RazI);
    QInsAll.ParamByName('P1').AsFloat     := SimpleRoundTo(Qe.Fieldbyname('p1').Asfloat,RazP);
    QInsAll.ParamByName('P2').AsFloat     := SimpleRoundTo(Qe.Fieldbyname('p1').Asfloat,RazP);
    QInsAll.ParamByName('P3').AsFloat     := SimpleRoundTo(Qe.Fieldbyname('p1').Asfloat,RazP);
    QInsAll.ParamByName('torq').AsFloat   := SimpleRoundTo(Qm.FieldByName('torq').AsFloat, RazM);
    QInsAll.ExecSQL;

    qm.next;
    qe.next;
    e:=not qe.eof and not qm.eof;
   end;

  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('delete from zkzsvod where nomer=' + Quotedstr(Nomer) +
    ' and uisp=' + Label13.Caption);
  QTemp.ExecSQL;

  QSelectSred.Close;
  QSelectSred.ParamByName('nomer').AsString := Nomer;
  QSelectSred.ParamByName('uisp').AsFloat   := Strtofloat(Label13.Caption);
  QSelectSred.Open;


  StringGrid1.cells[1, StringGrid1.row] :=
    FloatToStr(SimpleRoundTo(QSelectSred.FieldByName('u').AsFloat, RazU));
  StringGrid1.cells[2, StringGrid1.row] :=
    FloatToStr(SimpleRoundTo(QSelectSred.FieldByName('i').AsFloat, RazI));
  StringGrid1.cells[3, StringGrid1.row] :=
    FloatToStr(SimpleRoundTo(QSelectSred.FieldByName('p').AsFloat, RazP));
  StringGrid1.cells[4, StringGrid1.row] :=
    FloatToStr(SimpleRoundTo(QSelectSred.FieldByName('t').AsFloat, RazM));

  QInsSvod.ParamByName('nomer').AsString := Nomer;
  QInsSvod.ParamByName('uisp').AsFloat   := Strtofloat(Label13.Caption);
  QInsSvod.ParamByName('r').AsFloat      :=
    SimpleRoundTo(Strtofloat(Edit2.text), RazR);
  QInsSvod.ParamByName('u').AsFloat :=
    SimpleRoundTo(QSelectSred.FieldByName('u').AsFloat, RazU);
  QInsSvod.ParamByName('i').AsFloat :=
    SimpleRoundTo(QSelectSred.FieldByName('i').AsFloat, RazI);
  QInsSvod.ParamByName('p').AsFloat :=
    SimpleRoundTo(QSelectSred.FieldByName('p').AsFloat, RazP);
  QInsSvod.ParamByName('m').AsFloat :=
    SimpleRoundTo(QSelectSred.FieldByName('t').AsFloat, RazM);
  QInsSvod.ParamByName('tmp').AsFloat := 0;
  QInsSvod.ExecSQL;



  Qm.Close;
  Qe.Close;
  /// //////////////////////////////////////////////////////////////////////////
  BitBtn9.Enabled     := false;
  BitBtn8.Enabled     := false;
  StringGrid1.Enabled := true;
end;

procedure TFKZ.FormActivate(Sender: TObject);
begin
  enableclose := true;
  QTemp.Open('select * from zdelta where name=' + Quotedstr('ukz'));
  Edit1.Text := QTemp.FieldByName('value').AsString;
  nomer:=LAbel2.Caption;
  TimerUp.Enabled := true;
end;

procedure TFKZ.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TimerUp.Enabled := false;
end;

procedure TFKZ.FormCreate(Sender: TObject);
begin
  StringGrid1.Rowcount    := 6;
  StringGrid1.cells[0, 0] := 'U кк';
  StringGrid1.cells[1, 0] := 'U сред';
  StringGrid1.cells[2, 0] := 'I сред';
  StringGrid1.cells[3, 0] := 'P сред';
  StringGrid1.cells[4, 0] := 'М сред';
  StringGrid1.cells[0, 1] := '380';
  StringGrid1.cells[0, 2] := '100';
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
  if StringGrid1.cells[0, StringGrid1.row] <> '' then
  begin
    Label13.Caption := StringGrid1.cells[0, StringGrid1.row];
    BitBtn8.Enabled := true;
  end;
end;

procedure TFKZ.TimerUpTimer(Sender: TObject);
begin
  QUp.Close;
  QUp.Open();
  Label11.Caption := myformat(trazp, QUp.FieldByName('P').AsFloat);
  Label10.Caption := myformat(trazi, QUp.FieldByName('I').AsFloat);
  Label12.Caption := myformat(trazm, QUp.FieldByName('M').AsFloat);
  if ABS(QUp.FieldByName('U').AsFloat - Strtofloat(Label13.Caption)) >
    myfloat(Edit1.Text) then
    Label9.Font.Color := clRed
  else
    Label9.Font.Color := clGreen;
  Label9.Caption      := myformat(trazu, QUp.FieldByName('U').AsFloat);
end;

end.
