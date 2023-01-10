unit Uzv2Main;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, inifiles,
    math, uadd, ustr,
    Vcl.Buttons, Vcl.ComCtrls, USett, FireDAC.Stan.Intf, FireDAC.Stan.Option,
    FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
    FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.Oracle,
    FireDAC.Phys.OracleDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
    FireDAC.DatS, ShellApi,
    FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, ComObj,
    FireDAC.Comp.Client;

type
    TFZamerV2 = class(TForm)
        Panel1: TPanel;
        Panel2: TPanel;
        Label1: TLabel;
        LNOMER: TLabel;
        GroupBox2: TGroupBox;
        GroupBox1: TGroupBox;
        Label2: TLabel;
        BSoprot: TButton;
        BHH: TButton;
        BKz: TButton;
        BNagr: TButton;
        BRH: TButton;
        BMH: TButton;
        BPI: TButton;
        ExitBtn: TBitBtn;
        HideBtn: TBitBtn;
        Timer1000: TTimer;
        DateTimePicker1: TDateTimePicker;
        Label3: TLabel;
        Label4: TLabel;
        Label5: TLabel;
        Label6: TLabel;
        Label8: TLabel;
        Label11: TLabel;
        Label12: TLabel;
        Label13: TLabel;
        Label15: TLabel;
        Label16: TLabel;
        Label17: TLabel;
        Label18: TLabel;
        CombTipDvig: TComboBox;
        EditNumDvig: TEdit;
        CombPolIsp: TComboBox;
        CombEnergo: TComboBox;
        EditHumi: TEdit;
        EditPress: TEdit;
        CombRegim: TComboBox;
        CombStend: TComboBox;
        Label19: TLabel;
        EditOsob: TEdit;
        EditOsmotr: TEdit;
        CombSotrud: TComboBox;
        BitStartIsp: TBitBtn;
        BitArc: TBitBtn;
        BitBtn5: TBitBtn;
        FDC: TFDConnection;
        QTemp: TFDQuery;
        QAttestat: TFDQuery;
        BitBtn1: TBitBtn;
        Label14: TLabel;
        Label20: TLabel;
        Label9: TLabel;
        Label7: TLabel;
        CombUnom: TComboBox;
        CombUisp: TComboBox;
        CombPNom: TComboBox;
        CombPIsp: TComboBox;
        Image1: TImage;
        Image2: TImage;
        Image3: TImage;
        Image4: TImage;
        Image5: TImage;
        Image6: TImage;
        Image7: TImage;
        CombPolNom: TComboBox;
        Qinsdvig: TFDQuery;
        EditTemp: TEdit;
        Label10: TLabel;
        procedure FormCreate(Sender: TObject);
        procedure ExitBtnClick(Sender: TObject);
        procedure HideBtnClick(Sender: TObject);
        procedure BitBtn5Click(Sender: TObject);
        procedure BitStartIspClick(Sender: TObject);
        procedure CombStendChange(Sender: TObject);
        procedure BitArcClick(Sender: TObject);
        procedure BitBtn1Click(Sender: TObject);
        procedure Timer1000Timer(Sender: TObject);
        procedure BHHClick(Sender: TObject);
        procedure BSoprotClick(Sender: TObject);
        procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
        procedure BKzClick(Sender: TObject);
        procedure BNagrClick(Sender: TObject);
        procedure BRHClick(Sender: TObject);
    private
        { Private declarations }
    public
        procedure saveini;
        procedure restoreini;
        procedure restorecombo;
        procedure savecombo;
        function checkcreatenew: Boolean;
        procedure comboaddtext;
        procedure ImgSet(i: TImage; v: Boolean);
        procedure LoadIspyt(nomer: string);
        procedure enableispyt(f: Boolean);
        procedure FormReport;
        Procedure AddReportString(fn: string; s1, s2, s3: string);
    end;

var
    FZamerV2   : TFZamerV2;
    nomer      : String;
    cancloseapp: Boolean;

implementation

{$R *.dfm}

uses UARC, UHH, USopr, UKZ, Unagr, URH, URepP;

{
  procedure TFMain.FormCurrentReport;


  begin

  // рабочая характеристика i p rot torq
  FrepP.Label1.Caption := 'Рабочая характеристика';
  for i                := 1 to 10 do
  begin
  wrepl('i' + inttostr(i) + 'rh', Frh.Stringgrid2.Cells[2, i])
  end;
  for i := 1 to 10 do
  begin
  wrepl('p' + inttostr(i) + 'rh', Frh.Stringgrid2.Cells[3, i]);
  end;
  for i := 1 to 10 do
  begin
  wrepl('rot' + inttostr(i) + 'rh', Frh.Stringgrid2.Cells[4, i]);
  end;
  for i := 1 to 10 do
  begin
  wrepl('torq' + inttostr(i) + 'rh', Frh.Stringgrid2.Cells[5, i]);
  end;


  FrepP.Label1.Caption := 'Короткое замыкание';
  // короткое замыкание
  wrepl('rkz', FKZam.Edit2.Text);
  for i     := 1 to 5 do
  for j := 1 to 4 do
  begin
  wrepl('Kz' + inttostr(i) + inttostr(j),
  FKZam.StringGrid1.Cells[j, i]);
  end;
  // Нагрев
  FrepP.Label1.Caption := 'Нагрев';
  wrepl('Nr1x', Fnagrev.Edit4.Text);
  wrepl('Nr2x', Fnagrev.Edit5.Text);
  wrepl('N11x', Fnagrev.StringGrid1.Cells[2, 1]);
  wrepl('N21x', Fnagrev.StringGrid1.Cells[2, 2]); // i
  wrepl('N12x', Fnagrev.StringGrid1.Cells[3, 1]);
  wrepl('N22x', Fnagrev.StringGrid1.Cells[3, 2]); // p
  wrepl('N13x', Fnagrev.StringGrid1.Cells[4, 1]);
  wrepl('N23x', Fnagrev.StringGrid1.Cells[4, 2]); // n
  wrepl('N14x', Fnagrev.StringGrid1.Cells[5, 1]);
  wrepl('N24x', Fnagrev.StringGrid1.Cells[5, 2]); // m
  wrepl('N15x', Fnagrev.StringGrid1.Cells[6, 1]);
  wrepl('N25x', Fnagrev.StringGrid1.Cells[6, 2]); // t
  wrepl('N16x', Fnagrev.StringGrid1.Cells[7, 1]);
  wrepl('N26x', Fnagrev.StringGrid1.Cells[7, 2]); // r

  wrepl('N36x', Edit7.Text); // r RH

  wrepl('N35x', Floattostr(simpleroundto((strtofloat(Frh.Edit4.Text) +
  strtofloat(Frh.Edit5.Text) + strtofloat(Frh.Edit6.Text)) / 3, -1)));

  // прочие хар-ки
  FrepP.Label1.Caption := 'Прочие характеристики';
  for j                := 1 to 18 do
  begin
  wrepl('Pr' + inttostr(j + 100),
  NVLToEmp(Fproch.StringGrid1.Cells[j, 1]));
  end;
  for j := 1 to 18 do
  begin
  wrepl('Pz' + inttostr(j + 100),
  NVLToEmp(Fproch.StringGrid1.Cells[j, 2]));
  end;
  for i     := 1 to 2 do
  for j := 1 to 8 do
  begin
  wrepl('Wh' + inttostr(i) + '-' + inttostr(j),
  Fproch.Stringgrid2.Cells[j, i]);
  end;
  wrepl('rrmass', NVLToEmp(Fproch.Edit2.Text));
  wrepl('tmpr', Fproch.Edit3.Text);
  wrepl('davl', Fproch.Edit5.Text);
  wrepl('vlag', Fproch.Edit4.Text);
  // галочки

  if Fproch.radiobutton1.Checked then
  wrepl('epr', ans[1]);
  if Fproch.radiobutton2.Checked then
  wrepl('epr', ans[2]);
  if Fproch.radiobutton3.Checked then
  wrepl('epr', ans[0]);
  if Fproch.radiobutton4.Checked then
  wrepl('ipc', ans[1]);
  if Fproch.radiobutton5.Checked then
  wrepl('ipc', ans[2]);
  if Fproch.radiobutton6.Checked then
  wrepl('ipc', ans[0]);
  if Fproch.RadioButton7.Checked then
  wrepl('ipt', ans[1]);
  if Fproch.RadioButton8.Checked then
  wrepl('ipt', ans[2]);
  if Fproch.RadioButton9.Checked then
  wrepl('ipt', ans[0]);
  if Fproch.RadioButton10.Checked then
  wrepl('triz', ans[1]);
  if Fproch.RadioButton11.Checked then
  wrepl('triz', ans[2]);
  if Fproch.RadioButton12.Checked then
  wrepl('triz', ans[0]);
  if Fproch.RadioButton13.Checked then
  wrepl('u074', ans[1]);
  if Fproch.RadioButton14.Checked then
  wrepl('u074', ans[2]);
  if Fproch.RadioButton15.Checked then
  wrepl('u074', ans[0]);
  if Fproch.RadioButton16.Checked then
  wrepl('u113', ans[1]);
  if Fproch.RadioButton17.Checked then
  wrepl('u113', ans[2]);
  if Fproch.RadioButton18.Checked then
  wrepl('u113', ans[0]);

  wrepl('IE', ComboBox3.Text);
  wrepl('upri', Fproch.Edit1.Text);
  wrepl('stendn', ComboBox4.Text);
  wrepl('stenda', Label24.Caption);
  wrepl('urab', Edit5.Text);
  wrepl('prab', Edit7.Text);
  wrepl('humi', Edit8.Text);
  wrepl('pressure', Edit9.Text);
  wrepl('osobenn', Edit10.Text);
  wrepl('prim', Edit11.Text);
  wrepl('numdv', Edit4.Text);
  wrepl('tipdv', ComboBox1.Text);
  wrepl('date', DateToStr(DateTimePicker1.Date));
  wrepl('fio', ComboBox5.Text);
  wrepl('polus', ComboBox2.Text);
  wrepl('regim', ComboBox6.Text);
  // сохранение документа
  FrepP.Label1.Caption := 'Сохранение документа';
  WordApp.ActiveDocument.SaveAs(ReportPath + '\' + Nomer + '.docx');
  WordApp.ActiveDocument.Close(wdDoNotSaveChanges);
  finally
  WordApp.Quit;
  WordApp := Unassigned;
  end;
  FrepP.Hide;
  ShowMessage('Отчет сформирован!');
  end;




}
/// /////////////////////////////////////////////////////////////////////////////

Procedure TFZamerV2.AddReportString(fn: string; s1, s2, s3: string);
var
    f: textfile;
    s: string;
begin
    s := s1 + ';' + s2 + ';' + s3 + ';';
    AssignFile(f, fn);
{$I-}
    Append(f);
{$I+}
    If IOResult <> 0 then
    begin
        Rewrite(f);
        Closefile(f);
        Append(f);
    end;
    Writeln(f, s);
    Closefile(f);
end;

procedure TFZamerV2.FormReport;
const
    wdFindContinue     = 1;
    wdReplaceOne       = 1;
    wdReplaceAll       = 2;
    wdDoNotSaveChanges = 0;
var
    WordApp                    : OLEVariant;
    SearchString, ReplaceString: string;
    i, j                       : Integer;
    Blank                      : string;
    ReportPath, fn             : string;
    ans                        : array [0 .. 2] of string;
    tmp                        : real;

    procedure wrepl(s1: string; s2: string);
    begin
        SearchString  := s1;
        ReplaceString := s2;
        WordApp.Selection.Find.ClearFormatting;
        WordApp.Selection.Find.Text              := SearchString;
        WordApp.Selection.Find.Replacement.Text  := ReplaceString;
        WordApp.Selection.Find.Forward           := True;
        WordApp.Selection.Find.Wrap              := wdFindContinue;
        WordApp.Selection.Find.Format            := false;
        WordApp.Selection.Find.MatchCase         := True;
        WordApp.Selection.Find.MatchWholeWord    := false;
        WordApp.Selection.Find.MatchWildcards    := false;
        WordApp.Selection.Find.MatchSoundsLike   := false;
        WordApp.Selection.Find.MatchAllWordForms := false;
        WordApp.Selection.Find.Execute(Replace := wdReplaceAll);
    end;

begin
    FrepP.Label1.Caption := 'Создание документа';
    FrepP.Show;
    // ****************
    { Qtemp.Close;
      Qtemp.Open('select * from ini where name=' + Quotedstr('set_yes'));
      ans[1] := Qtemp.FieldByName('value').Asstring;
      Qtemp.Close;
      Qtemp.Open('select * from ini where name=' + Quotedstr('set_no'));
      ans[2] := Qtemp.FieldByName('value').Asstring;
      Qtemp.Close;
      Qtemp.Open('select * from ini where name=' + Quotedstr('set_un'));
      ans[0] := Qtemp.FieldByName('value').Asstring;
    }
    // *****************
    Blank      := Extractfilepath(paramstr(0)) + 'REPORT\BLANK.docx';
    ReportPath := Extractfilepath(paramstr(0)) + 'REPORT';
    fn         := ReportPath + '\' + nomer + '.csv';
    Deletefile(fn);
    if not FileExists(Blank) then
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
    try
        WordApp.Visible := false;
        WordApp.Documents.Open(Blank);
        // заголовок отчета
        FrepP.Label1.Caption := 'Заголовок отчета';

        wrepl('date', Datetostr(FZamerV2.DateTimePicker1.Date));
        AddReportString(fn, '0', 'dater',
          Datetostr(FZamerV2.DateTimePicker1.Date));
        wrepl('numdv', FZamerV2.EditNumDvig.Text);
        AddReportString(fn, '0', 'numdv', FZamerV2.EditNumDvig.Text);

        wrepl('urab', FZamerV2.CombUnom.Text);
        AddReportString(fn, '0', 'unom', FZamerV2.CombUnom.Text);
        wrepl('uisp', FZamerV2.CombUisp.Text);
        AddReportString(fn, '0', 'uisp', FZamerV2.CombUisp.Text);

        wrepl('prab', FZamerV2.CombPNom.Text);
        AddReportString(fn, '0', 'pnom', FZamerV2.CombPNom.Text);

        wrepl('pisp', inttostr(round(strtofloat(FZamerV2.CombPIsp.Text)*1000)));
        AddReportString(fn, '0', 'pisp', inttostr(round(strtofloat(FZamerV2.CombPIsp.Text)*1000)));

        wrepl('polus', FZamerV2.CombPolNom.Text);
        AddReportString(fn, '0', 'polus', FZamerV2.CombPolNom.Text);
        wrepl('polutisp', FZamerV2.CombPolIsp.Text);
        AddReportString(fn, '0', 'polusisp', FZamerV2.CombPolIsp.Text);

        wrepl('tipdv', FZamerV2.CombTipDvig.Text);
        AddReportString(fn, '0', 'tipdv', FZamerV2.CombTipDvig.Text);
        wrepl('regim', FZamerV2.CombRegim.Text);
        AddReportString(fn, '0', 'regim', FZamerV2.CombRegim.Text);
        wrepl('IE', FZamerV2.CombEnergo.Text);
        AddReportString(fn, '0', 'IE', FZamerV2.CombEnergo.Text);

        wrepl('osobenn', FZamerV2.EditOsob.Text);
        AddReportString(fn, '0', 'osobenn', FZamerV2.EditOsob.Text);
        wrepl('humi', FZamerV2.EditHumi.Text);
        AddReportString(fn, '0', 'humi', FZamerV2.EditHumi.Text);
        wrepl('pressure', FZamerV2.EditPress.Text);
        AddReportString(fn, '0', 'pressure', FZamerV2.EditPress.Text);
        wrepl('stendn', FZamerV2.CombStend.Text);
        AddReportString(fn, '0', 'stendn', FZamerV2.CombStend.Text);
        wrepl('stenda', FZamerV2.Label19.Caption);
        AddReportString(fn, '0', 'stenda', FZamerV2.Label19.Caption);
        wrepl('prim', FZamerV2.EditOsmotr.Text);
        AddReportString(fn, '0', 'prim', FZamerV2.EditOsmotr.Text);

        // сопротивление
        FrepP.Label1.Caption := 'Сопротивление';
        for i                := 1 to 3 do
            for j            := 1 to 3 do
            begin
                wrepl('st' + inttostr(i) + inttostr(j),
                  FSopr.StringGrid3.Cells[j, i]);
                AddReportString(fn, '1', 'st' + inttostr(i) + inttostr(j),
                  FSopr.StringGrid3.Cells[j, i]);
            end;
        wrepl('fsoed', FSopr.ComboBox7.Text);
        AddReportString(fn, '1', 'fsoed', FSopr.ComboBox7.Text);
        wrepl('fprizn', FSopr.ComboBox8.Text);
        AddReportString(fn, '1', 'fprizn', FSopr.ComboBox8.Text);
        wrepl('stred', FSopr.ComboBox9.Text);
        AddReportString(fn, '1', 'stred', FSopr.ComboBox9.Text);
        wrepl('rizoled', FSopr.ComboBox10.Text);
        AddReportString(fn, '1', 'rizoled', FSopr.ComboBox10.Text);
        wrepl('rizolvk', FSopr.Edit13.Text);
        AddReportString(fn, '1', 'rizolvk', FSopr.Edit13.Text);
        wrepl('rizolob', FSopr.Edit16.Text);
        AddReportString(fn, '1', 'rizolob', FSopr.Edit16.Text);

        wrepl('tempersopr1', myformat('0.0', strtofloat(FSopr.Edit8.Text)));
        wrepl('tempersopr2', myformat('0.0', strtofloat(FSopr.Edit1.Text)));
        wrepl('tempersopr3', myformat('0.0', strtofloat(FSopr.Edit2.Text)));
        AddReportString(fn, '1', 'tempersopr1',
          myformat('0.0', strtofloat(FSopr.Edit8.Text)));
        AddReportString(fn, '1', 'tempersopr2',
          myformat('0.0', strtofloat(FSopr.Edit1.Text)));
        AddReportString(fn, '1', 'tempersopr3',
          myformat('0.0', strtofloat(FSopr.Edit2.Text)));

        if FSopr.radiobutton1.Checked then
            wrepl('bolt', 'ВЫДЕРЖАЛ');
        if FSopr.radiobutton2.Checked then
            wrepl('bolt', 'НЕ ВЫДЕРЖАЛ');
        if FSopr.radiobutton3.Checked then
            wrepl('bolt', 'НЕ ИСПЫТЫВАЛОСЬ');

        if FSopr.radiobutton1.Checked then
            wrepl('mvit', FSopr.radiobutton1.Caption);
        if FSopr.radiobutton2.Checked then
            wrepl('mvit', FSopr.radiobutton2.Caption);
        if FSopr.radiobutton3.Checked then
            wrepl('mvit', FSopr.radiobutton3.Caption);

        // холостой ход
        FrepP.Label1.Caption := 'Холостой ход';
        for i                := 1 to 12 do
        begin
            wrepl('u' + inttostr(i) + 'hh', Formhh.Stringgrid2.Cells[1, i]);
            AddReportString(fn, '1', 'u' + inttostr(i) + 'hh',
              Formhh.Stringgrid2.Cells[1, i]);
        end;
        for i := 1 to 12 do
        begin
            wrepl('i' + inttostr(i) + 'hh', Formhh.Stringgrid2.Cells[2, i]);
            AddReportString(fn, '1', 'i' + inttostr(i) + 'hh',
              Formhh.Stringgrid2.Cells[2, i]);
        end;
        for i := 1 to 12 do
        begin
            wrepl('p' + inttostr(i) + 'hh', Formhh.Stringgrid2.Cells[3, i]);
            AddReportString(fn, '1', 'p' + inttostr(i) + 'hh',
              Formhh.Stringgrid2.Cells[3, i]);
        end;
        for i := 1 to 12 do
        begin
            wrepl('R' + inttostr(i) + 'hh', (Formhh.Stringgrid2.Cells[5, i]));
            AddReportString(fn, '1', 'r' + inttostr(i) + 'hh',
              Formhh.Stringgrid2.Cells[5, i]);
        end;
        /// //////
        // короткое замыкание
        FrepP.Label1.Caption := 'Короткое замыкание';
        wrepl('rkz', FKZ.Edit2.Text);
        for i     := 1 to 5 do
            for j := 1 to 4 do
            begin
                wrepl('Kz' + inttostr(i) + inttostr(j),
                  FKZ.StringGrid1.Cells[j, i]);
            end;

        /// //////   myformat('0.0', strtofloat(FSopr.Edit8.Text))
        // Нагрев
        FrepP.Label1.Caption := 'Нагрев';
        //wrepl('N11x', Fnagr.Edit4.Text);
        //wrepl('N12x', Fnagr.Edit5.Text);
        wrepl('N11x', myformat('0.00', strtofloat(Fnagr.StringGrid1.Cells[2, 1])));
        wrepl('N21x', myformat('0.00', strtofloat(Fnagr.StringGrid1.Cells[2, 2]))); // i
        wrepl('N12x', myformat('0.0', strtofloat(Fnagr.StringGrid1.Cells[3, 1])));
        wrepl('N22x', myformat('0.0', strtofloat(Fnagr.StringGrid1.Cells[3, 2]))); // p
        wrepl('N13x', myformat('0.0', strtofloat(Fnagr.StringGrid1.Cells[4, 1])));
        wrepl('N23x', myformat('0.0', strtofloat(Fnagr.StringGrid1.Cells[4, 2]))); // n
        wrepl('N14x', myformat('0.0', strtofloat(Fnagr.StringGrid1.Cells[5, 1])));
        wrepl('N24x', myformat('0.0', strtofloat(Fnagr.StringGrid1.Cells[5, 2]))); // m
        wrepl('N15x', myformat('0.0', strtofloat(Fnagr.StringGrid1.Cells[6, 1])));
        wrepl('N25x', myformat('0.0', strtofloat(Fnagr.StringGrid1.Cells[6, 2]))); // t1
        wrepl('N16x', myformat('0.0', strtofloat(Fnagr.StringGrid1.Cells[7, 1])));
        wrepl('N26x', myformat('0.0', strtofloat(Fnagr.StringGrid1.Cells[7, 2]))); // t2
        wrepl('N17x', myformat('0.0', strtofloat(Fnagr.StringGrid1.Cells[8, 1])));
        wrepl('N27x', myformat('0.0', strtofloat(Fnagr.StringGrid1.Cells[8, 2]))); // t3
        wrepl('N18x', myformat('0.0', strtofloat(Fnagr.StringGrid1.Cells[9, 1])));
        wrepl('N28x', myformat('0.0', strtofloat(Fnagr.StringGrid1.Cells[9, 2]))); // r
        wrepl('N31x', Fnagr.Edit4.Text); // R korp
        wrepl('N32x', Fnagr.Edit5.Text); // R obm






        // сохранение документа
        FrepP.Label1.Caption := 'Сохранение документа';
        WordApp.ActiveDocument.SaveAs(ReportPath + '\' + nomer + '.DOCX');
        WordApp.ActiveDocument.Close(wdDoNotSaveChanges);
    finally
        WordApp.Quit;
        WordApp := Unassigned;
    end;
    FrepP.Hide;
    ShowMessage('Отчет сформирован!');
    ///

end;

/// /////////////////////////////////////////////////////////////////////////////TFZamerV2.
procedure TFZamerV2.ImgSet(i: TImage; v: Boolean);
var
    s: string;
begin
    if v then
        i.picture.LoadFromFile(Extractfilepath(paramstr(0)) + 'apply.bmp')
    else
        i.picture.LoadFromFile(Extractfilepath(paramstr(0)) + 'erase.bmp')
end;

procedure TFZamerV2.comboaddtext;
var
    i: Integer;
begin
    for i := 0 to FZamerV2.ComponentCount - 1 do
    begin
        if Components[i] is TComboBox then
        begin
            if trim(TComboBox(Components[i]).Text) <> '' then
                TComboBox(Components[i])
                  .Items.Add(TComboBox(Components[i]).Text);
        end;
    end;
end;

procedure TFZamerV2.savecombo;
var
    i, j: Integer;
begin
    for i := 0 to FZamerV2.ComponentCount - 1 do
    begin
        if Components[i] is TComboBox then
        begin
            if TComboBox(Components[i]).Tag <> 500 then
            begin
                QTemp.Close;
                QTemp.SQL.Clear;
                QTemp.SQL.Add('delete from zini where name=' +
                  Quotedstr(TComboBox(Components[i]).name));
                QTemp.ExecSQL;
                for j := 0 to TComboBox(Components[i]).Items.Count - 1 do
                    if TComboBox(Components[i]).Items[j] <> '' then
                    begin
                        QTemp.Close;
                        QTemp.SQL.Clear;
                        QTemp.SQL.Add('insert into zini (name, value) values(');
                        QTemp.SQL.Add(Quotedstr(TComboBox(Components[i]).name) +
                          ', ' + Quotedstr(TComboBox(Components[i])
                          .Items[j]) + ')');
                        QTemp.ExecSQL;
                    end;
            end;

        end;
    end;
end;

procedure TFZamerV2.restorecombo;
var
    i: Integer;
begin
    for i := 0 to FZamerV2.ComponentCount - 1 do
    begin
        if Components[i] is TComboBox then
        begin
            if TComboBox(Components[i]).Tag <> 500 then
            begin
                TComboBox(Components[i]).Items.Clear;
                TComboBox(Components[i]).Text := '';
                QTemp.Close;
                QTemp.Open('select distinct(value) v from zini where name=' +
                  Quotedstr(TComboBox(Components[i]).name));
                while not QTemp.Eof do
                begin
                    TComboBox(Components[i])
                      .Items.Add(QTemp.FieldByName('v').Asstring);
                    QTemp.Next;
                end;
            end;
        end;
        If Components[i] is TEdit then
            TEdit(Components[i]).Text := '';
    end;

    CombStend.Items.Clear;
    CombStend.Text := '';
    QTemp.Close;
    QTemp.Open('select Name from zstend');
    while not QTemp.Eof do
    begin
        CombStend.Items.Add(QTemp.FieldByName('name').Asstring);
        QTemp.Next;
    end;
    CombSotrud.Items.Clear;
    CombSotrud.Text := '';
    QTemp.Close;
    QTemp.Open('select fio from zsotr order by id');
    while not QTemp.Eof do
    begin
        CombSotrud.Items.Add(QTemp.FieldByName('fio').Asstring);
        QTemp.Next;
    end;

end;

procedure TFZamerV2.saveini;
var
    i: tinifile;
    t: Integer;
begin
    try
        i := tinifile.Create(Extractfilepath(paramstr(0)) + 'ZAMERV2.INI');
        t := FZamerV2.Left;
        i.WriteInteger('POSITION', 'LEFT', t);
        t := FZamerV2.Top;
        i.WriteInteger('POSITION', 'TOP', t);
        i.free;
    except
        on E: Exception do
            E := NIL;
    end;
end;

procedure TFZamerV2.Timer1000Timer(Sender: TObject);
begin
    Label2.Caption := TimeToStr(time);
end;

procedure TFZamerV2.ExitBtnClick(Sender: TObject);
begin
    if cancloseapp then
    begin
        saveini;
        savecombo;

        FZamerV2.Close;
    end
    else
    begin
        ShowMessage('Не могу закрыть программу!');
    end;
end;

procedure TFZamerV2.HideBtnClick(Sender: TObject);
begin
    Application.Minimize;
end;

function TFZamerV2.checkcreatenew: Boolean;
var
    s: string;
begin
    checkcreatenew := True;
    {
      checkcreatenew := false;
      if CombTipDvig.Text = '' then
      exit;
      if CombPolNom.Text = '' then
      exit;
      if CombPolIsp.Text = '' then
      exit;
      if CombEnergo.Text = '' then
      exit;
      if CombRegim.Text = '' then
      exit;
      if CombStend.Text = '' then
      exit;
      if CombSotrud.Text = '' then
      exit;
    }
    if CombUisp.Text = '' then
    begin
        ShowMessage
          ('Абсолютно невозможно проводить испытания без указания испытательного напряжения');
        checkcreatenew := false;
        exit;
    end;

end;

procedure TFZamerV2.CombStendChange(Sender: TObject);
begin
    QAttestat.ParamByName('name').Asstring := CombStend.Text;
    QAttestat.Open;
    Label19.Caption := QAttestat.FieldByName('attest').Asstring;
    QAttestat.Close;
end;

procedure TFZamerV2.BHHClick(Sender: TObject);
begin
    // enableispyt(false);
    Formhh.Label7.Caption  := CombUisp.Text;
    Formhh.Label12.Caption := nomer;
    Formhh.ShowModal;
end;

procedure TFZamerV2.BitBtn1Click(Sender: TObject);
begin
    ExitBtn.Click;
end;

procedure TFZamerV2.BitStartIspClick(Sender: TObject);
var
    buttonSelected: Integer;
begin
    buttonSelected :=
      MessageDlg('Все ли поля условий испытания заполнены верно?',
      mtConfirmation, mbYesNo, 0);
    if buttonSelected = mrYes then
    begin
        if checkcreatenew then
        begin
            QTemp.Open('select getnomer nomer from dual');
            LNOMER.Caption := QTemp.FieldByName('nomer').Asstring;
            nomer          := LNOMER.Caption;
            Qinsdvig.Close;
            Qinsdvig.ParamByName('DATA').Asstring :=
              Datetostr(DateTimePicker1.Date);
            Qinsdvig.ParamByName('TIPDV').Asstring := CombTipDvig.Text;
            Qinsdvig.ParamByName('NOMDV').Asstring := EditNumDvig.Text;
            Qinsdvig.ParamByName('POLUS').Asstring := CombPolIsp.Text;
            Qinsdvig.ParamByName('UNOM').AsInteger := strtoint(CombUnom.Text);
            Qinsdvig.ParamByName('UISP').AsInteger := strtoint(CombUisp.Text);
            Qinsdvig.ParamByName('PNOM').AsFloat   :=
              strtofloat(Comma(CombPNom.Text));
            Qinsdvig.ParamByName('PISP').AsFloat :=
              strtofloat(Comma(CombPIsp.Text));
            Qinsdvig.ParamByName('HUMID').AsFloat := strtofloat(EditHumi.Text);
            Qinsdvig.ParamByName('PRESSUR').AsFloat :=
              strtofloat(EditPress.Text);
            Qinsdvig.ParamByName('ENERGO').Asstring := CombEnergo.Text;
            Qinsdvig.ParamByName('STENDN').Asstring := CombStend.Text;
            Qinsdvig.ParamByName('STENDA').Asstring := Label19.Caption;
            Qinsdvig.ParamByName('DOP1').Asstring   := EditOsmotr.Text;
            Qinsdvig.ParamByName('ISPOLN').Asstring := EditOsob.Text;
            Qinsdvig.ParamByName('READY').AsInteger := 0;
            Qinsdvig.ParamByName('NOMER').Asstring  := nomer;
            if CombSotrud.Text = '' then
            begin
                ShowMessage
                  ('Не указано ФИО испытателя, проверьте внимательно все необходимые поля');
                exit;
            end;
            Qinsdvig.ParamByName('fio').Asstring    := CombSotrud.Text;
            Qinsdvig.ParamByName('regim').Asstring  := CombRegim.Text;
            Qinsdvig.ParamByName('POLNom').Asstring := CombPolNom.Text;
            Qinsdvig.ParamByName('POLIsp').Asstring := CombPolIsp.Text;
            Qinsdvig.ParamByName('TEMP').Asstring   := EditTemp.Text;
            Qinsdvig.ExecSQL;
            comboaddtext;
            FSopr.ComboBox9.Text  := FSopr.ComboBox9.Items[0];
            FSopr.ComboBox10.Text := FSopr.ComboBox10.Items[0];
            FZamerV2.ImgSet(FZamerV2.Image1, false);
            FZamerV2.ImgSet(FZamerV2.Image2, false);
            FZamerV2.ImgSet(FZamerV2.Image3, false);
            FZamerV2.ImgSet(FZamerV2.Image4, false);
            FZamerV2.ImgSet(FZamerV2.Image5, false);
            FZamerV2.ImgSet(FZamerV2.Image6, false);
            FZamerV2.ImgSet(FZamerV2.Image7, false);
            ShowMessage('Можно приступать к испытаниям');
            enableispyt(True);
        end;
    end;

end;

procedure TFZamerV2.BKzClick(Sender: TObject);
begin
    FKZ.Label2.Caption := nomer;
    FKZ.ShowModal;
end;

procedure TFZamerV2.BNagrClick(Sender: TObject);
begin
    FNagr.Label6.Caption := nomer;
    FNagr.Label31.Caption := CombUIsp.Text;
    FNagr.ShowModal;
end;

procedure TFZamerV2.BRHClick(Sender: TObject);
begin
    FRH.Label6.Caption := nomer;
    FRH.ShowModal;
end;

procedure TFZamerV2.enableispyt(f: Boolean);
begin
    BSoprot.Enabled := f;
    BHH.Enabled     := f;
    BKz.Enabled     := f;
    BNagr.Enabled   := f;
    BRH.Enabled     := f;
    // BMH.Enabled := f;
    // BPI.Enabled := f;
end;

procedure TFZamerV2.LoadIspyt(nomer: string);
var
    s  : string;
    tip: Integer;
begin
    // двигатель целиком
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('select * from zdvigall where nomer=' + Quotedstr(nomer));
    QTemp.Open;
    DateTimePicker1.DateTime := Strtodate(QTemp.FieldByName('DATA').Asstring);
    CombTipDvig.Text         := QTemp.FieldByName('tipdv').Asstring;
    EditNumDvig.Text         := QTemp.FieldByName('nomdv').Asstring;
    CombUnom.Text            := QTemp.FieldByName('unom').Asstring;
    CombUisp.Text            := QTemp.FieldByName('uisp').Asstring;
    CombPNom.Text            := QTemp.FieldByName('pnom').Asstring;
    CombPIsp.Text            := QTemp.FieldByName('pisp').Asstring;
    CombPolNom.Text          := QTemp.FieldByName('polnom').Asstring;
    CombPolIsp.Text          := QTemp.FieldByName('polisp').Asstring;
    CombEnergo.Text          := QTemp.FieldByName('energo').Asstring;
    EditHumi.Text            := QTemp.FieldByName('humid').Asstring;
    EditPress.Text           := QTemp.FieldByName('pressur').Asstring;
    CombRegim.Text           := QTemp.FieldByName('regim').Asstring;
    CombStend.Text           := QTemp.FieldByName('stendn').Asstring;
    Label19.Caption          := QTemp.FieldByName('stenda').Asstring;
    EditOsob.Text            := QTemp.FieldByName('ispoln').Asstring;
    EditOsmotr.Text          := QTemp.FieldByName('dop1').Asstring;
    CombSotrud.Text          := QTemp.FieldByName('fio').Asstring;
    EditTemp.Text            := QTemp.FieldByName('temp').Asstring;
    enableispyt(True);
    /// ////////////////////////////////////////////////////////////
    // загрузить Холостой ход если есть
    QTemp.Close;
    QTemp.Open('select * from zhhsvod where nomer=' + Quotedstr(nomer) +
      ' order by uisp desc');
    ImgSet(Image2, QTemp.RecordCount <> 0);
    tip := QTemp.FieldByName('tip').AsInteger;
    case tip of
        1:
            begin
                Formhh.Radiobutton1Click(Formhh);
                Formhh.radiobutton1.Checked := True;
            end;
        2:
            begin
                Formhh.Radiobutton2Click(Formhh);
                Formhh.radiobutton2.Checked := True;
            end;
        3:
            begin
                Formhh.Radiobutton3Click(Formhh);
                Formhh.radiobutton3.Checked := True;
            end;
    end;

    tip                         := 1;
    Formhh.Stringgrid2.rowcount := QTemp.RecordCount + 2;
    Formhh.ComboBox1.Text       := QTemp.FieldByName('edizm').Asstring;
    while not(QTemp.Eof) do
    begin
        Formhh.Stringgrid2.Cells[0, tip] := QTemp.FieldByName('uisp').Asstring;
        Formhh.Stringgrid2.Cells[1, tip] :=
          addzeroend(QTemp.FieldByName('usred').Asstring, 1);
        Formhh.Stringgrid2.Cells[2, tip] :=
          addzeroend(QTemp.FieldByName('isred').Asstring, 2);
        Formhh.Stringgrid2.Cells[3, tip] :=
          addzeroend(QTemp.FieldByName('psred').Asstring, 1);
        Formhh.Stringgrid2.Cells[4, tip] := QTemp.FieldByName('dumax').Asstring;
        Formhh.Stringgrid2.Cells[5, tip] := QTemp.FieldByName('r').Asstring;
        Formhh.Stringgrid2.Cells[6, tip] := QTemp.FieldByName('otklon')
          .Asstring;
        QTemp.Next;
        tip := tip + 1;
    end;
    case QTemp.FieldByName('vizol').AsInteger of
        0:
            Formhh.RadioButton6.Checked := True;
        1:
            Formhh.RadioButton4.Checked := True;
        2:
            Formhh.RadioButton5.Checked := True;
    end;

    // загрузить сопротивление если есть
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.Open('select * from zsoprot where nomer=' + Quotedstr(nomer));
    FZamerV2.ImgSet(FZamerV2.Image1, QTemp.RecordCount <> 0);

    FSopr.Edit8.Text     := QTemp.FieldByName('TEMP1').Asstring;
    FSopr.Edit1.Text     := QTemp.FieldByName('TEMP2').Asstring;
    FSopr.Edit2.Text     := QTemp.FieldByName('TEMP3').Asstring;
    FSopr.ComboBox7.Text := QTemp.FieldByName('PHAS').Asstring;
    FSopr.ComboBox8.Text := QTemp.FieldByName('SOED').Asstring;
    FSopr.ComboBox9.Text := QTemp.FieldByName('SOPRED').Asstring;
    // if FSopr.ComboBox9.Text = '' then
    // FSopr.ComboBox9.Text := 'МОм';
    FSopr.ComboBox10.Text := QTemp.FieldByName('IZOLED').Asstring;
    // if FSopr.ComboBox10.Text = '' then
    // FSopr.ComboBox10.Text := 'МОм';

    FSopr.Edit13.Text             := QTemp.FieldByName('IZOLKORP').Asstring;
    FSopr.Edit16.Text             := QTemp.FieldByName('IZOLOBMOT').Asstring;
    FSopr.StringGrid3.Cells[1, 1] := QTemp.FieldByName('IZM1U1U2').Asstring;
    FSopr.StringGrid3.Cells[1, 2] := QTemp.FieldByName('IZM2U1U2').Asstring;
    FSopr.StringGrid3.Cells[1, 3] := QTemp.FieldByName('IZM3U1U2').Asstring;
    FSopr.StringGrid3.Cells[2, 1] := QTemp.FieldByName('IZM1V1V2').Asstring;
    FSopr.StringGrid3.Cells[2, 2] := QTemp.FieldByName('IZM2V1V2').Asstring;
    FSopr.StringGrid3.Cells[2, 3] := QTemp.FieldByName('IZM3V1V2').Asstring;
    FSopr.StringGrid3.Cells[3, 1] := QTemp.FieldByName('IZM1W1W2').Asstring;
    FSopr.StringGrid3.Cells[3, 2] := QTemp.FieldByName('IZM2W1W2').Asstring;
    FSopr.StringGrid3.Cells[3, 3] := QTemp.FieldByName('IZM3W1W2').Asstring;
    case QTemp.FieldByName('BOLT').AsInteger of
        0:
            FSopr.radiobutton3.Checked := True;
        1:
            FSopr.radiobutton1.Checked := True;
        2:
            FSopr.radiobutton2.Checked := True;
    end;
    /// ///////////////////////////////// stringreplace  [rfReplaceAll, rfIgnoreCase]///////////////////////////
    // загрузить Короткое замыкание если есть
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.Open('select * from zkzsvod where nomer=' + Quotedstr(nomer) +
      ' order by uisp desc');
    FZamerV2.ImgSet(FZamerV2.Image3, QTemp.RecordCount <> 0);

    FKZ.StringGrid1.row      := 1;
    FKZ.StringGrid1.rowcount := 10;
    // FKZ.Edit2.Enabled        := false;
    while not(QTemp.Eof) do
    begin
        FKZ.StringGrid1.Cells[0, FKZ.StringGrid1.row] :=
          QTemp.FieldByName('uisp').Asstring;
        FKZ.StringGrid1.Cells[1, FKZ.StringGrid1.row] :=
          QTemp.FieldByName('u').Asstring;
        FKZ.StringGrid1.Cells[2, FKZ.StringGrid1.row] :=
          QTemp.FieldByName('i').Asstring;
        FKZ.StringGrid1.Cells[3, FKZ.StringGrid1.row] :=
          QTemp.FieldByName('p').Asstring;
        FKZ.StringGrid1.Cells[4, FKZ.StringGrid1.row] :=
          QTemp.FieldByName('m').Asstring;
        FKZ.StringGrid1.row := FKZ.StringGrid1.row + 1;
        if QTemp.FieldByName('uisp').Asstring = CombUisp.Text then
            FKZ.Edit2.Text := QTemp.FieldByName('r').Asstring;
        FKZ.ComboBox1.Text := QTemp.FieldByName('edizm').Asstring;
        QTemp.Next;
    end;
    /// ////////////////////////////////////////////////////////////
    // загрузить нагрев
    QTemp.Open('select * from znagrevsvod where nomer=' + Quotedstr(nomer));
    FZamerV2.ImgSet(FZamerV2.Image4, QTemp.RecordCount <> 0);

    { SELECT NOMER, U, I, P, N, M,  T1, R, TIP, DOP1, RKORP, ROBM, T2, T3, T }
    QTemp.first;

    if QTemp.FieldByName('RKORP').Asstring = '' then
        FNagr.Edit4.Text := '0'
    else
        FNagr.Edit4.Text := QTemp.FieldByName('RKORP').Asstring;

    if QTemp.FieldByName('ROBM').Asstring = '' then
        FNagr.Edit5.Text := '0'
    else
        FNagr.Edit5.Text := QTemp.FieldByName('ROBM').Asstring;
    while not QTemp.Eof do
    begin
        FNagr.StringGrid1.Cells[1, QTemp.FieldByName('tip').AsInteger] :=
          QTemp.FieldByName('u').Asstring;
        FNagr.StringGrid1.Cells[2, QTemp.FieldByName('tip').AsInteger] :=
          QTemp.FieldByName('i').Asstring;
        FNagr.StringGrid1.Cells[3, QTemp.FieldByName('tip').AsInteger] :=
          QTemp.FieldByName('p').Asstring;
        FNagr.StringGrid1.Cells[4, QTemp.FieldByName('tip').AsInteger] :=
          QTemp.FieldByName('n').Asstring;
        FNagr.StringGrid1.Cells[5, QTemp.FieldByName('tip').AsInteger] :=
          QTemp.FieldByName('m').Asstring;
        FNagr.StringGrid1.Cells[6, QTemp.FieldByName('tip').AsInteger] :=
          QTemp.FieldByName('t1').Asstring;
        FNagr.StringGrid1.Cells[7, QTemp.FieldByName('tip').AsInteger] :=
          QTemp.FieldByName('t2').Asstring;
        FNagr.StringGrid1.Cells[8, QTemp.FieldByName('tip').AsInteger] :=
          QTemp.FieldByName('t3').Asstring;
        FNagr.StringGrid1.Cells[9, QTemp.FieldByName('tip').AsInteger] :=
          QTemp.FieldByName('r').Asstring;
        QTemp.Next;
    end;

    /// ////////////////////////////////////////////////////////////////////////////
end;

procedure TFZamerV2.BitArcClick(Sender: TObject);
var
    i: Integer;
begin
    i := Farc.ShowModal;
    if i = mrOk then
    begin
        LNOMER.Caption := Farc.Label1.Caption;
        nomer          := LNOMER.Caption;
        LoadIspyt(nomer);
    end;
    if i = mrYes then
    begin
        LNOMER.Caption := Farc.Label1.Caption;
        nomer          := LNOMER.Caption;
        LoadIspyt(nomer);
        FormReport;
    end;

end;

procedure TFZamerV2.BitBtn5Click(Sender: TObject);
begin
    FSett.ShowModal;
end;

procedure TFZamerV2.BSoprotClick(Sender: TObject);
begin
    FSopr.Label6.Caption := nomer;
    FSopr.ShowModal;
    // ImgSet(Image1, true);
end;

procedure TFZamerV2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
    QTemp.Open('select value from zini where name=' +
      Quotedstr('ElspecFormHeader'));
    PostMessage(FindWindow(nil, PWideChar(QTemp.FieldByName('value').Asstring)),
      WM_QUIT, 0, 0);

    PostMessage(FindWindow(nil, 'Сбор показаний Т45'), WM_QUIT, 0, 0);
end;

procedure TFZamerV2.FormCreate(Sender: TObject);
begin
    { QTemp.Open('select value from zini where name=' +
      Quotedstr('ElspecFormHeader'));
      PostMessage(FindWindow(nil, PWideChar(QTemp.FieldByName('value').Asstring)),
      WM_QUIT, 0, 0);

      PostMessage(FindWindow(nil, 'Сбор показаний Т45'), WM_QUIT, 0, 0);
    }
    QTemp.Open('select value from zini where name=' + Quotedstr('UIPPath'));
    ShellExecute(Handle, 'open', PWideChar(QTemp.FieldByName('value').Asstring),
      nil, nil, SW_SHOWNORMAL);
    QTemp.Open('select value from zini where name=' + Quotedstr('MNTPath'));
    ShellExecute(Handle, 'open', PWideChar(QTemp.FieldByName('value').Asstring),
      nil, nil, SW_SHOWNORMAL);
    DateTimePicker1.Date := Date;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('Update version set maintotal=maintotal+1');
    QTemp.ExecSQL;
    cancloseapp := True;
    restoreini;
    restorecombo;
end;

procedure TFZamerV2.restoreini;
var
    i: tinifile;
begin
    i := tinifile.Create(Extractfilepath(paramstr(0)) + 'ZAMERV2.INI');
    FZamerV2.Left := i.ReadInteger('POSITION', 'LEFT', 10);
    FZamerV2.Top := i.ReadInteger('POSITION', 'TOP', 10);
    FZamerV2.Repaint;
    i.free;
end;

end.
