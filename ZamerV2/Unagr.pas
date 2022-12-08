unit Unagr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.Grids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, ustr, uadd, System.Actions,
  Vcl.ActnList, math;

type
  TFNagr = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label6: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    GroupBox3: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    GroupBox4: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    StringGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ProgressBar1: TProgressBar;
    Edit4: TEdit;
    Edit5: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Edit6: TEdit;
    Label26: TLabel;
    Edit8: TEdit;
    Label27: TLabel;
    Edit7: TEdit;
    BitBtn10: TBitBtn;
    QTemp: TFDQuery;
    TimerUp: TTimer;
    Timer1000: TTimer;
    QInssvod: TFDQuery;
    QInsAll: TFDQuery;
    QSelectSred: TFDQuery;
    ActionList1: TActionList;
    Action1: TAction;
    Label28: TLabel;
    Label29: TLabel;
    QUp: TFDQuery;
    QTemp2: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TimerUpTimer(Sender: TObject);
    procedure StringGrid1Click(Sender: TObject);
    procedure Timer1000Timer(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure command(b: Boolean);
  end;

var
  FNagr: TFNagr;

implementation

uses uzv2main;
{$R *.dfm}


procedure TFNagr.Action1Execute(Sender: TObject);
begin
  BitBtn1.Click;
end;

procedure TFNagr.BitBtn1Click(Sender: TObject);
begin
 if (Edit4.text='') or (Edit5.text='') or (Edit6.text='') or (Edit7.text='') or (Edit8.text='') then
 begin
  ShowMessage('Не заполнены поля сопротивления и температуры!');
  Exit;
 end;
  Command(True);
  ProgressBAr1.Min:=0;
  ProgressBAr1.Max:=Strtoint(Edit1.TExt);
  ProgressBar1.Step:=1;
  ProgressBar1.Position:=0;
  Timer1000.Tag:=0;
  BitBtn1.Enabled:=False;
  Timer1000.Enabled := True;
end;

procedure TFNagr.command(b: Boolean);
begin
  if b then
  begin
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
    QTemp.SQL.Add('insert into command (nomer, command) values(' +
      Quotedstr(Nomer) + ' , 10)');
    QTemp.ExecSQL;
  end;
end;

procedure TFNagr.Edit3Change(Sender: TObject);
begin
  Label29.Caption := inttostr(round(strtofloat(Label24.Caption) / 100 *
    myfloat(Edit3.Text)));
end;

procedure TFNagr.FormActivate(Sender: TObject);
begin
  Label19.Caption := Fzamerv2.CombUisp.Text;
  Label24.Caption := inttostr(round(strtofloat(Fzamerv2.CombPisp.Text) * 1000));
  Label29.Caption := inttostr(round(strtofloat(Label24.Caption) / 100 *
    myfloat(Edit3.Text)));
end;

procedure TFNagr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TimerUp.Enabled := false;
end;

procedure TFNagr.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('update zini set value=' + Quotedstr(FNagr.Edit1.Text) +
    ' where name=' + Quotedstr('nagtime'));
  QTemp.ExecSQL;

  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('update zdelta set value=' + Quotedstr(FNagr.Edit2.Text) +
    ' where name=' + Quotedstr('unag'));
  QTemp.ExecSQL;

  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('update zdelta set value=' + Quotedstr(FNagr.Edit3.Text) +
    ' where name=' + Quotedstr('pnag'));
  QTemp.ExecSQL;

end;

procedure TFNagr.FormCreate(Sender: TObject);
var
  i, j: Integer;
  s   : string;
begin
  StringGrid1.cells[0, 0]  := 'Нагрузка';
  StringGrid1.cells[1, 0]  := 'U сред В.';
  StringGrid1.cells[2, 0]  := 'I сред А.';
  StringGrid1.cells[3, 0]  := 'P сред Вт.';
  StringGrid1.cells[4, 0]  := 'N сред об.мин';
  StringGrid1.cells[5, 0]  := 'М сред Нм';
  StringGrid1.cells[6, 0]  := 'T, C';
  StringGrid1.cells[7, 0]  := 'R, Ом';
  StringGrid1.cells[8, 0]  := 'T1,C';
  StringGrid1.cells[9, 0]  := 'T2,C';
  StringGrid1.cells[10, 0] := 'T3,C';
  StringGrid1.cells[0, 1]  := 'Без нагрузки';
  StringGrid1.cells[0, 2]  := 'С нагрузкой';

  StringGrid1.DefaultColWidth := 100;

  QTemp.Open('select value from zini where name=' + Quotedstr('nagtime'));
  FNagr.Edit1.Text := QTemp.FieldByName('value').Asstring;
  QTemp.Close;
  QTemp.Open('select value from zdelta where name=' + Quotedstr('unag'));
  FNagr.Edit2.Text := QTemp.FieldByName('value').Asstring;
  QTemp.Close;
  QTemp.Open('select value from zdelta where name=' + Quotedstr('pnag'));
  FNagr.Edit3.Text := QTemp.FieldByName('value').Asstring;
  QTemp.Close;

end;

procedure TFNagr.FormShow(Sender: TObject);
begin
  TimerUp.Enabled := True;
end;

procedure TFNagr.StringGrid1Click(Sender: TObject);
begin
  {
    if StringGrid1.Row = 1 then
    begin
    Label18.Caption := FMain.Edit6.Text;
    Label19.Caption := '0';
    end
    else
    begin
    Label18.Caption := FMain.Edit6.Text;
    Label19.Caption := Floattostr(1000 * Strtofloat(FMain.Edit7.Text));
    end;
  }

end;

procedure TFNagr.Timer1000Timer(Sender: TObject);
var
 acount1, acount2, ncnt, i:integer;
begin
 ProgressBar1.StepIt;
 Timer1000.Tag:=Timer1000.Tag+1;
  If Timer1000.Tag > Strtoint(Edit1.Text) then
  begin
    Timer1000.Enabled     := False;
    ProgressBar1.Position := 0;
    // остановить датчик 45
    Command(false);


    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.Open('select count(*) cnt from zamertmp');
    acount1 := QTemp.FieldByName('cnt').Asinteger;
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.Open('select count(*) cnt from zelspec');
    acount2 := QTemp.FieldByName('cnt').Asinteger;
    ncnt    := min(acount2, acount1);
    QTemp.Close;
    QTemp.SQL.Clear;
    {:NOMER ,
 :U1 ,
 :U2 ,
 :U3 ,
 :I1 ,
 :I2 ,
 :I3,
 :P ,
 :M ,
 :N ,
 :DOP1,
 :TIP ,
 :NAGR  p1 p2 p3}
    QTemp.Open('select * from zamertmp');
    QTemp.First;
    QTemp2.Open('select * from zelspec');
    QTemp2.First;
    for i := 1 to ncnt do
    begin
      QInsAll.ParamByName('NOMER').Asstring := Nomer;
      QInsAll.ParamByName('U1').AsFloat     := Qtemp2.FieldByName('U1').AsFloat;
      QInsAll.ParamByName('U2').AsFloat     := Qtemp2.FieldByName('U2').AsFloat;
      QInsAll.ParamByName('U3').AsFloat     := Qtemp2.FieldByName('U3').AsFloat;
      QInsAll.ParamByName('I1').AsFloat     := Qtemp2.FieldByName('i1').AsFloat;
      QInsAll.ParamByName('I2').AsFloat     := Qtemp2.FieldByName('i2').AsFloat;
      QInsAll.ParamByName('I3').AsFloat     := Qtemp2.FieldByName('i3').AsFloat;
      QInsAll.ParamByName('P').AsFloat      := Qtemp2.FieldByName('p').AsFloat;

      QInsAll.ParamByName('P1').AsFloat      :=Qtemp2.FieldByName('p1').AsFloat;
      QInsAll.ParamByName('P2').AsFloat      := Qtemp2.FieldByName('p2').AsFloat;
      QInsAll.ParamByName('P3').AsFloat      := Qtemp2.FieldByName('p3').AsFloat;

      QInsAll.ParamByName('M').AsFloat      :=
        simpleroundto(QTemp.FieldByName('torq').AsFloat, RazM);
      QInsAll.ParamByName('N').AsFloat :=
        simpleroundto(QTemp.FieldByName('rot').AsFloat, RazN);
      QInsAll.ParamByName('DOP1').AsFloat := 0;
      QInsAll.ParamByName('Tip').AsFloat  := StringGrid1.Row;
      QInsAll.ParamByName('nagr').AsFloat := 0;
      QInsAll.ExecSQL;
      QTemp.Next;
      QTemp2.Next;
    end;

    /// /////////////////
    ///
    QSelectSred.Close;
    QSelectSred.ParamByName('nomer').Asstring := Nomer;
    QSelectSred.ParamByName('tip').Asinteger  := StringGrid1.Row;
    // Qselectsred.ParamByName('pisp').AsFloat   := Strtofloat(Label8.Caption);
    QSelectSred.Open;
    QInssvod.Close;
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('delete from znagrevsvod where nomer=' + Quotedstr(Nomer) +
      ' and tip=' + inttostr(StringGrid1.Row));
    QTemp.ExecSQL;
    {
      :NOMER, :U, :I,
      :P, :N, :M,
      :T1, :R, :TIP,
      :DOP1, :RKORP, :ROBM,
      :T2, :T3, :T
    }

    QInssvod.ParamByName('nomer').Asstring :=
      QSelectSred.FieldByName('nomer').Asstring;
    QInssvod.ParamByName('u').AsFloat :=
      simpleroundto((QSelectSred.FieldByName('su1').AsFloat +
      QSelectSred.FieldByName('su2').AsFloat + QSelectSred.FieldByName('su3')
      .AsFloat) / 3, RazU);
    QInssvod.ParamByName('i').AsFloat :=
      simpleroundto((QSelectSred.FieldByName('si1').AsFloat +
      QSelectSred.FieldByName('si2').AsFloat + QSelectSred.FieldByName('si3')
      .AsFloat) / 3, RazI);
    QInssvod.ParamByName('p').AsFloat :=
      simpleroundto(QSelectSred.FieldByName('sp').AsFloat, RazP);
    QInssvod.ParamByName('n').AsFloat :=
      simpleroundto(QSelectSred.FieldByName('sn').AsFloat, RazN);
    QInssvod.ParamByName('m').AsFloat :=
      simpleroundto(QSelectSred.FieldByName('sm').AsFloat, RazM);
    QInssvod.ParamByName('dop1').AsFloat := 0;
    QInssvod.ParamByName('t').AsFloat    :=
      simpleroundto((Strtofloat(Edit6.Text) + Strtofloat(Edit7.Text) +
      Strtofloat(Edit8.Text)) / 3, -1);
    QInssvod.ParamByName('robm').AsFloat  := Strtofloat(Edit5.Text);
    QInssvod.ParamByName('rkorp').AsFloat := Strtofloat(Edit4.Text);
    QInssvod.ParamByName('tip').Asinteger := StringGrid1.Row;
    QInssvod.ParamByName('t1').AsFloat    := Strtofloat(Edit6.Text);
    QInssvod.ParamByName('t2').AsFloat    := Strtofloat(Edit7.Text);
    QInssvod.ParamByName('t3').AsFloat    := Strtofloat(Edit8.Text);
    QInssvod.ParamByName('r').AsFloat     := 0;
    QInssvod.ExecSQL;

    StringGrid1.cells[1, StringGrid1.Row] :=
      Floattostr(simpleroundto((QSelectSred.FieldByName('su1').AsFloat +
      QSelectSred.FieldByName('su2').AsFloat + QSelectSred.FieldByName('su3')
      .AsFloat) / 3, RazU));
    StringGrid1.cells[2, StringGrid1.Row] :=
      Floattostr(simpleroundto((QSelectSred.FieldByName('si1').AsFloat +
      QSelectSred.FieldByName('si2').AsFloat + QSelectSred.FieldByName('si3')
      .AsFloat) / 3, RazI));
    StringGrid1.cells[3, StringGrid1.Row] :=
      Floattostr(simpleroundto(QSelectSred.FieldByName('sp').AsFloat, RazP));
    StringGrid1.cells[4, StringGrid1.Row] :=
      Floattostr(simpleroundto(QSelectSred.FieldByName('sn').AsFloat, RazN));
    StringGrid1.cells[5, StringGrid1.Row] :=
      Floattostr(simpleroundto(QSelectSred.FieldByName('sm').AsFloat, RazM));
    StringGrid1.cells[6, StringGrid1.Row] :=
      Floattostr(simpleroundto((Strtofloat(Edit6.Text) + Strtofloat(Edit7.Text)
      + Strtofloat(Edit8.Text)) / 3, -1));
    StringGrid1.cells[7, StringGrid1.Row] := '0';










    BitBtn1.Enabled:=True;
  end;

end;

procedure TFNagr.TimerUpTimer(Sender: TObject);
begin

  QUp.Close;
  QUp.Open();
  Label13.Caption := myformat(trazn, QUp.FieldByName('N').AsFloat);
  Label10.Caption := myformat(trazi, QUp.FieldByName('I').AsFloat);
  Label12.Caption := myformat(trazm, QUp.FieldByName('M').AsFloat);

  if ABS(QUp.FieldByName('U').AsFloat - strtofloat(Label19.Caption)) >
    myfloat(Edit2.Text) then
    Label9.Font.Color := clRed
  else
    Label9.Font.Color := clGreen;
  Label9.Caption      := myformat(trazu, QUp.FieldByName('U').AsFloat);
  //
  if ABS(QUp.FieldByName('P').AsFloat - strtofloat(Label24.Caption)) >
    myfloat(Label29.Caption) then
    Label14.Font.Color := clRed
  else
    Label14.Font.Color := clGreen;
  Label14.Caption      := myformat(trazu, QUp.FieldByName('P').AsFloat);

end;

end.
