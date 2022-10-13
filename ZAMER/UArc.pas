unit UArc;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
	System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
	Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
	FireDAC.Stan.Option,
	FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
	FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
	FireDAC.Comp.Client;

type
	TFArc = class(TForm)
		GroupBox1: TGroupBox;
		DBGrid1: TDBGrid;
		GroupBox2: TGroupBox;
		Label13: TLabel;
		Label14: TLabel;
		Label15: TLabel;
		Label16: TLabel;
		Label19: TLabel;
		Label20: TLabel;
		Label17: TLabel;
		Label18: TLabel;
		Label21: TLabel;
		Label22: TLabel;
		Label24: TLabel;
		Label23: TLabel;
		Label25: TLabel;
		Label26: TLabel;
		Label1: TLabel;
		Label2: TLabel;
		DateTimePicker1: TDateTimePicker;
		Edit4: TEdit;
		Edit7: TEdit;
		Edit5: TEdit;
		Edit6: TEdit;
		Edit8: TEdit;
		Edit9: TEdit;
		Edit10: TEdit;
		Edit11: TEdit;
		BitBtn1: TBitBtn;
		BitBtn2: TBitBtn;
		QSelect: TFDQuery;
		BitBtn3: TBitBtn;
		DataSelect: TDataSource;
		Edit1: TEdit;
		Edit2: TEdit;
		Label3: TLabel;
		Edit3: TEdit;
		procedure DBGrid1CellClick(Column: TColumn);
		procedure BitBtn3Click(Sender: TObject);
		procedure BitBtn2Click(Sender: TObject);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	FArc: TFArc;

implementation

{$R *.dfm}

procedure setgridcolumnwidths(grid: TDBGrid);
const
	defborder = 10;
var
	temp, n: integer;
	lmax   : array [0 .. 30] of integer;
begin
	with grid do
	begin
		canvas.font := font;
		for n       := 0 to columns.count - 1 do
			// if columns[n].visible then
			lmax[n] := canvas.textwidth(fields[n].fieldname) + defborder;
		grid.datasource.DataSet.first;
		while not grid.datasource.DataSet.eof do
		begin
			for n := 0 to columns.count - 1 do
			begin
				// if columns[n].visible then begin
				temp := canvas.textwidth(trim(columns[n].field.displaytext)) +
				  defborder;
				if temp > lmax[n] then
					lmax[n] := temp;
				// end; { if }
			end; { for }
			grid.datasource.DataSet.next;
		end; { while }
		grid.datasource.DataSet.first;
		for n := 0 to columns.count - 1 do
			if lmax[n] > 0 then
				columns[n].width := lmax[n];
	end; { with }
end; { setgridcolumnwidths }

{ procedure TForm1.FillBlank(ADocument: string);
  const
  wdFindContinue     = 1;
  wdReplaceOne       = 1;
  wdReplaceAll       = 2;
  wdDoNotSaveChanges = 0;
  var
  WordApp                    : OLEVariant;
  SearchString, ReplaceString: string;
  i, j                       : Integer;
  begin
  if not FileExists(ADocument) then
  begin
  ShowMessage('Бланк отчета не найден.');
  exit;
  end;
  try
  WordApp := CreateOLEObject('Word.Application');
  except
  on E: Exception do
  begin
  E.Message := 'Word недоступен';
  raise;
  end;
  end;
  FormReport.Show;
  try
  WordApp.Visible := false;
  WordApp.Documents.Open(ADocument);
  // холостой ход
  for i := 1 to 10 do
  begin
  SearchString  := 'u' + inttostr(i) + 'hh';
  ReplaceString := StringGrid2.Cells[1, i];
  WordApp.Selection.Find.ClearFormatting;
  WordApp.Selection.Find.Text              := SearchString;
  WordApp.Selection.Find.Replacement.Text  := ReplaceString;
  WordApp.Selection.Find.Forward           := true;
  WordApp.Selection.Find.Wrap              := wdFindContinue;
  WordApp.Selection.Find.Format            := false;
  WordApp.Selection.Find.MatchCase         := true;
  WordApp.Selection.Find.MatchWholeWord    := false;
  WordApp.Selection.Find.MatchWildcards    := false;
  WordApp.Selection.Find.MatchSoundsLike   := false;
  WordApp.Selection.Find.MatchAllWordForms := false;
  WordApp.Selection.Find.Execute(Replace := wdReplaceAll);
  end;
  for i := 1 to 10 do
  begin
  SearchString  := 'i' + inttostr(i) + 'hh';
  ReplaceString := StringGrid2.Cells[2, i];
  WordApp.Selection.Find.ClearFormatting;
  WordApp.Selection.Find.Text              := SearchString;
  WordApp.Selection.Find.Replacement.Text  := ReplaceString;
  WordApp.Selection.Find.Forward           := true;
  WordApp.Selection.Find.Wrap              := wdFindContinue;
  WordApp.Selection.Find.Format            := false;
  WordApp.Selection.Find.MatchCase         := true;
  WordApp.Selection.Find.MatchWholeWord    := false;
  WordApp.Selection.Find.MatchWildcards    := false;
  WordApp.Selection.Find.MatchSoundsLike   := false;
  WordApp.Selection.Find.MatchAllWordForms := false;
  WordApp.Selection.Find.Execute(Replace := wdReplaceAll);
  end;
  for i := 1 to 10 do
  begin
  SearchString  := 'p' + inttostr(i) + 'hh';
  ReplaceString := StringGrid2.Cells[3, i];
  WordApp.Selection.Find.ClearFormatting;
  WordApp.Selection.Find.Text              := SearchString;
  WordApp.Selection.Find.Replacement.Text  := ReplaceString;
  WordApp.Selection.Find.Forward           := true;
  WordApp.Selection.Find.Wrap              := wdFindContinue;
  WordApp.Selection.Find.Format            := false;
  WordApp.Selection.Find.MatchCase         := true;
  WordApp.Selection.Find.MatchWholeWord    := false;
  WordApp.Selection.Find.MatchWildcards    := false;
  WordApp.Selection.Find.MatchSoundsLike   := false;
  WordApp.Selection.Find.MatchAllWordForms := false;
  WordApp.Selection.Find.Execute(Replace := wdReplaceAll);
  end;
  // рабочая характеристика i p rot torq
  i := 1;
  while StringGrid6.Cells[0, i] <> '' do
  begin
  SearchString  := 'i' + inttostr(i) + 'rh';
  ReplaceString := StringGrid6.Cells[2, i];
  WordApp.Selection.Find.ClearFormatting;
  WordApp.Selection.Find.Text              := SearchString;
  WordApp.Selection.Find.Replacement.Text  := ReplaceString;
  WordApp.Selection.Find.Forward           := true;
  WordApp.Selection.Find.Wrap              := wdFindContinue;
  WordApp.Selection.Find.Format            := false;
  WordApp.Selection.Find.MatchCase         := true;
  WordApp.Selection.Find.MatchWholeWord    := false;
  WordApp.Selection.Find.MatchWildcards    := false;
  WordApp.Selection.Find.MatchSoundsLike   := false;
  WordApp.Selection.Find.MatchAllWordForms := false;
  WordApp.Selection.Find.Execute(Replace := wdReplaceAll);
  i := i + 1;
  end;
  i := 1;
  while StringGrid6.Cells[0, i] <> '' do
  begin
  SearchString  := 'p' + inttostr(i) + 'rh';
  ReplaceString := StringGrid6.Cells[6, i];
  WordApp.Selection.Find.ClearFormatting;
  WordApp.Selection.Find.Text              := SearchString;
  WordApp.Selection.Find.Replacement.Text  := ReplaceString;
  WordApp.Selection.Find.Forward           := true;
  WordApp.Selection.Find.Wrap              := wdFindContinue;
  WordApp.Selection.Find.Format            := false;
  WordApp.Selection.Find.MatchCase         := true;
  WordApp.Selection.Find.MatchWholeWord    := false;
  WordApp.Selection.Find.MatchWildcards    := false;
  WordApp.Selection.Find.MatchSoundsLike   := false;
  WordApp.Selection.Find.MatchAllWordForms := false;
  WordApp.Selection.Find.Execute(Replace := wdReplaceAll);
  i := i + 1;
  end;
  i := 1;
  while StringGrid6.Cells[0, i] <> '' do
  begin
  SearchString  := 'rot' + inttostr(i) + 'rh';
  ReplaceString := StringGrid6.Cells[4, i];
  WordApp.Selection.Find.ClearFormatting;
  WordApp.Selection.Find.Text              := SearchString;
  WordApp.Selection.Find.Replacement.Text  := ReplaceString;
  WordApp.Selection.Find.Forward           := true;
  WordApp.Selection.Find.Wrap              := wdFindContinue;
  WordApp.Selection.Find.Format            := false;
  WordApp.Selection.Find.MatchCase         := true;
  WordApp.Selection.Find.MatchWholeWord    := false;
  WordApp.Selection.Find.MatchWildcards    := false;
  WordApp.Selection.Find.MatchSoundsLike   := false;
  WordApp.Selection.Find.MatchAllWordForms := false;
  WordApp.Selection.Find.Execute(Replace := wdReplaceAll);
  i := i + 1;
  end;
  i := 1;
  while StringGrid6.Cells[0, i] <> '' do
  begin
  SearchString  := 'torq' + inttostr(i) + 'rh';
  ReplaceString := StringGrid6.Cells[5, i];
  WordApp.Selection.Find.ClearFormatting;
  WordApp.Selection.Find.Text              := SearchString;
  WordApp.Selection.Find.Replacement.Text  := ReplaceString;
  WordApp.Selection.Find.Forward           := true;
  WordApp.Selection.Find.Wrap              := wdFindContinue;
  WordApp.Selection.Find.Format            := false;
  WordApp.Selection.Find.MatchCase         := true;
  WordApp.Selection.Find.MatchWholeWord    := false;
  WordApp.Selection.Find.MatchWildcards    := false;
  WordApp.Selection.Find.MatchSoundsLike   := false;
  WordApp.Selection.Find.MatchAllWordForms := false;
  WordApp.Selection.Find.Execute(Replace := wdReplaceAll);
  i := i + 1;
  end;
  // сохранение документа
  WordApp.ActiveDocument.SaveAs(ReportPath + '\' + Edit5.Text + '.docx');
  WordApp.ActiveDocument.Close(wdDoNotSaveChanges);
  finally
  WordApp.Quit;
  WordApp := Unassigned;
  end;
  FormReport.Close;
  ShowMessage('Отчет сформирован!');
  end;

}

procedure TFArc.BitBtn2Click(Sender: TObject);
begin
	{
	  Label2.Caption       := QSelect.FieldByName('nomer').Asstring;
	  Edit4.TExt           := QSelect.FieldByName('nomdv').Asstring;
	  Edit5.TExt           := QSelect.FieldByName('unom').Asstring;
	  Edit6.TExt           := QSelect.FieldByName('uisp').Asstring;
	  Edit7.TExt           := QSelect.FieldByName('pnom').Asstring;
	  Edit8.TExt           := QSelect.FieldByName('humid').Asstring;
	  Edit9.TExt           := QSelect.FieldByName('pressur').Asstring;
	  Edit10.TExt          := QSelect.FieldByName('ispoln').Asstring;
	  Edit11.TExt          := QSelect.FieldByName('dop1').Asstring;
	  DateTimePicker1.date := QSelect.FieldByName('data').AsDateTime;
	  Edit1.TExt           := QSelect.FieldByName('tipdv').Asstring;
	  Edit2.TExt           := QSelect.FieldByName('energo').Asstring;
	  Label3.Caption       := QSelect.FieldByName('stendn').Asstring;
	  Label24.Caption      := QSelect.FieldByName('stenda').Asstring;
	  Edit3.TExt           := QSelect.FieldByName('polus').Asstring;
	}
end;

procedure TFArc.BitBtn3Click(Sender: TObject);
begin
	QSelect.Close;
	QSelect.Open;
	setgridcolumnwidths(DBGrid1);
end;

procedure TFArc.DBGrid1CellClick(Column: TColumn);
begin
	Label2.Caption       := QSelect.FieldByName('nomer').Asstring;
	Edit4.TExt           := QSelect.FieldByName('nomdv').Asstring;
	Edit5.TExt           := QSelect.FieldByName('unom').Asstring;
	Edit6.TExt           := QSelect.FieldByName('uisp').Asstring;
	Edit7.TExt           := QSelect.FieldByName('pnom').Asstring;
	Edit8.TExt           := QSelect.FieldByName('humid').Asstring;
	Edit9.TExt           := QSelect.FieldByName('pressur').Asstring;
	Edit10.TExt          := QSelect.FieldByName('ispoln').Asstring;
	Edit11.TExt          := QSelect.FieldByName('dop1').Asstring;
	DateTimePicker1.date := QSelect.FieldByName('data').AsDateTime;
	Edit1.TExt           := QSelect.FieldByName('tipdv').Asstring;
	Edit2.TExt           := QSelect.FieldByName('energo').Asstring;
	Label3.Caption       := QSelect.FieldByName('stendn').Asstring;
	Label24.Caption      := QSelect.FieldByName('stenda').Asstring;
	Edit3.TExt           := QSelect.FieldByName('polus').Asstring;
end;

end.
