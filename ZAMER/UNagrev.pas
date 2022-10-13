unit UNagrev;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
	System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
	Vcl.Buttons,
	Vcl.Grids, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
	FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
	FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
	FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Actions, Vcl.ActnList,
	math;

type
	TFNagrev = class(TForm)
		GroupBox1: TGroupBox;
		Label1: TLabel;
		Label2: TLabel;
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
		GroupBox2: TGroupBox;
		GroupBox3: TGroupBox;
		Label13: TLabel;
		Label14: TLabel;
		Label15: TLabel;
		Edit1: TEdit;
		Edit2: TEdit;
		Edit3: TEdit;
		GroupBox4: TGroupBox;
		StringGrid1: TStringGrid;
		BitBtn1: TBitBtn;
		BitBtn2: TBitBtn;
		ProgressBar1: TProgressBar;
		BitBtn3: TBitBtn;
		BitBtn4: TBitBtn;
		BitBtn5: TBitBtn;
		BitBtn6: TBitBtn;
		BitBtn7: TBitBtn;
		BitBtn8: TBitBtn;
		BitBtn9: TBitBtn;
		BitBtn10: TBitBtn;
		BitBtn11: TBitBtn;
		TimerUp500: TTimer;
		Timer50: TTimer;
		QgetMN: TFDQuery;
		ActionList1: TActionList;
		Action1: TAction;
		QTemp: TFDQuery;
		Label17: TLabel;
		Label19: TLabel;
		Label18: TLabel;
		Label16: TLabel;
		Label20: TLabel;
		Label21: TLabel;
		Label22: TLabel;
		Edit4: TEdit;
		Edit5: TEdit;
		Timer1000: TTimer;
		QCommand: TFDQuery;
		Label23: TLabel;
		Edit6: TEdit;
		Label25: TLabel;
		Label24: TLabel;
		Edit7: TEdit;
		Edit8: TEdit;
		QInsAll: TFDQuery;
		QSelectSred: TFDQuery;
		QInssvod: TFDQuery;
		procedure TimerUp500Timer(Sender: TObject);
		procedure BitBtn11Click(Sender: TObject);
		procedure Action1Execute(Sender: TObject);
		procedure FormCreate(Sender: TObject);
		procedure Timer50Timer(Sender: TObject);
		procedure BitBtn1Click(Sender: TObject);
		procedure Timer1000Timer(Sender: TObject);
		procedure CommandStart(c: Integer; n: string; fn: string);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

	R = record
		u1, u2, u3, i1, i2, i3, p, m, n, dop, tip: real;
	end;

var
	FNagrev: TFNagrev;
	a      : array [1 .. 1000] of R;
	acount : Integer;
	tip    : Integer;

implementation

{$R *.dfm}

uses umain;

procedure TFNagrev.CommandStart(c: Integer; n: string; fn: string);
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
	dectype := '10';
	QCommand.SQL.Add(Quotedstr(n) + ',' + Quotedstr(fn) + ',' + inttostr(c) +
	  ',' + dectype + ', ' + FMain.Edit12.Text + ')');
	QCommand.ExecSQL;
end;

procedure TFNagrev.Action1Execute(Sender: TObject);
begin
	BitBtn1.Click;
end;

procedure TFNagrev.BitBtn11Click(Sender: TObject);
begin
	FNagrev.Close;
end;

procedure TFNagrev.BitBtn1Click(Sender: TObject);
begin
	acount                := 0;
	tip                   := StringGrid1.Row;
	Timer1000.tag         := Strtoint(Edit1.Text);
	ProgressBar1.Max      := Timer1000.tag;
	ProgressBar1.Position := 0;
	BitBtn1.Enabled       := False;
	// запустить датчик 45
	QTemp.Close;
	QTemp.SQL.Clear;
	QTemp.SQL.Add('truncate table zamertmp');
	QTemp.ExecSQL;
	QTemp.Close;
	QTemp.SQL.Clear;
	QTemp.SQL.Add('delete from znagrevall where nomer=' + Quotedstr(Nomer) +
	  ' and tip=' + inttostr(StringGrid1.Row));
	QTemp.ExecSQL;
	CommandStart(1, umain.Nomer, Label8.Caption);

	Timer50.Enabled   := true;
	Timer1000.Enabled := true;
end;

procedure TFNagrev.FormCreate(Sender: TObject);
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

	FMain.QDelta.Open('select value from zdelta where name=' +
	  Quotedstr('unag'));
	FNagrev.Edit2.Text := FMain.QDelta.FieldByName('value').Asstring;
	QTemp.Close;
	FMain.QDelta.Open('select value from zdelta where name=' +
	  Quotedstr('pnag'));
	FNagrev.Edit3.Text := FMain.QDelta.FieldByName('value').Asstring;
	QTemp.Close;

end;

procedure TFNagrev.Timer1000Timer(Sender: TObject);
var
	i            : Integer;
	acount1, ncnt: Integer;
begin
	ProgressBar1.StepIt;
	If Timer1000.tag <= 0 then
	begin
		Timer50.Enabled       := False;
		Timer1000.Enabled     := False;
		ProgressBar1.Position := 0;
		// остановить датчик 45
		CommandStart(0, umain.Nomer, Label8.Caption);

		QTemp.Close;
		QTemp.SQL.Clear;
		QTemp.Open('select count(*) cnt from zamertmp');
		acount1 := QTemp.FieldByName('cnt').Asinteger;
		ncnt    := min(acount, acount1);
		QTemp.Close;
		QTemp.SQL.Clear;
		QTemp.Open('select * from zamertmp');
		QTemp.First;
		for i := 1 to ncnt do
		begin
			QInsAll.ParamByName('NOMER').Asstring := Nomer;
			QInsAll.ParamByName('U1').AsFloat     := a[i].u1;
			QInsAll.ParamByName('U2').AsFloat     := a[i].u2;
			QInsAll.ParamByName('U3').AsFloat     := a[i].u3;
			QInsAll.ParamByName('I1').AsFloat     := a[i].i1;
			QInsAll.ParamByName('I2').AsFloat     := a[i].i2;
			QInsAll.ParamByName('I3').AsFloat     := a[i].i3;
			QInsAll.ParamByName('P').AsFloat      := a[i].p;
			QInsAll.ParamByName('M').AsFloat      :=
			  simpleroundto(QTemp.FieldByName('torq').AsFloat, RazM);
			QInsAll.ParamByName('N').AsFloat :=
			  simpleroundto(QTemp.FieldByName('rot').AsFloat, RazN);
			QInsAll.ParamByName('DOP1').AsFloat := 0;
			QInsAll.ParamByName('Tip').AsFloat  := StringGrid1.Row;
			QInsAll.ParamByName('nagr').AsFloat := 0;
			QInsAll.ExecSQL;
			QTemp.Next;
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
		QTemp.SQL.Add('delete from znagrevsvod where nomer=' + Quotedstr(Nomer)
		  + ' and tip=' + inttostr(StringGrid1.Row));
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
		  QSelectSred.FieldByName('su2').AsFloat + QSelectSred.FieldByName
		  ('su3').AsFloat) / 3, RazU);
		QInssvod.ParamByName('i').AsFloat :=
		  simpleroundto((QSelectSred.FieldByName('si1').AsFloat +
		  QSelectSred.FieldByName('si2').AsFloat + QSelectSred.FieldByName
		  ('si3').AsFloat) / 3, RazI);
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
		  floattostr(simpleroundto((QSelectSred.FieldByName('su1').AsFloat +
		  QSelectSred.FieldByName('su2').AsFloat + QSelectSred.FieldByName
		  ('su3').AsFloat) / 3, RazU));
		StringGrid1.cells[2, StringGrid1.Row] :=
		  floattostr(simpleroundto((QSelectSred.FieldByName('si1').AsFloat +
		  QSelectSred.FieldByName('si2').AsFloat + QSelectSred.FieldByName
		  ('si3').AsFloat) / 3, RazI));
		StringGrid1.cells[3, StringGrid1.Row] :=
		  floattostr(simpleroundto(QSelectSred.FieldByName('sp')
		  .AsFloat, RazP));
		StringGrid1.cells[4, StringGrid1.Row] :=
		  floattostr(simpleroundto(QSelectSred.FieldByName('sn')
		  .AsFloat, RazN));
		StringGrid1.cells[5, StringGrid1.Row] :=
		  floattostr(simpleroundto(QSelectSred.FieldByName('sm')
		  .AsFloat, RazM));
		StringGrid1.cells[6, StringGrid1.Row] :=
		  floattostr(simpleroundto((Strtofloat(Edit6.Text) +
		  Strtofloat(Edit7.Text) + Strtofloat(Edit8.Text)) / 3, -1));
		StringGrid1.cells[7, StringGrid1.Row] := '0';

		/// ////////////////
		BitBtn1.Enabled := true;
	end;
	Timer1000.tag := Timer1000.tag - 1;
end;

procedure TFNagrev.Timer50Timer(Sender: TObject);
begin
	acount       := acount + 1;
	a[acount].u1 := simpleroundto(FMain.RU1.Value, RazU);
	a[acount].u2 := simpleroundto(FMain.RU2.Value, RazU);
	a[acount].u3 := simpleroundto(FMain.RU3.Value, RazU);
	a[acount].i1 := simpleroundto(FMain.RI1.Value, RazI);
	a[acount].i2 := simpleroundto(FMain.RI2.Value, RazI);
	a[acount].i3 := simpleroundto(FMain.RI3.Value, RazI);
	a[acount].p  := simpleroundto(FMain.RP1.Value, RazP);
end;

procedure TFNagrev.TimerUp500Timer(Sender: TObject);
begin
	Label7.Caption := FMain.KrVarLabel1.Caption;
	Label8.Caption := FMain.KrVarLabel2.Caption;
	Label9.Caption := FMain.KrVarLabel3.Caption;

	QgetMN.Open('select * from zamer');
	Label10.Caption := QgetMN.FieldByName('torq').Asstring;
	Label11.Caption := QgetMN.FieldByName('rot').Asstring;
	Label12.Caption := QgetMN.FieldByName('power').Asstring;
end;

end.
