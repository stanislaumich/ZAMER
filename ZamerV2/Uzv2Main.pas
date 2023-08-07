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
        BitBtn2: TBitBtn;
        QUpdDvig: TFDQuery;
        Button1: TButton;
        Button2: TButton;
        Button3: TButton;
        Panel3: TPanel;
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
        procedure BPIClick(Sender: TObject);
        procedure BMHClick(Sender: TObject);
        procedure BitBtn2Click(Sender: TObject);
        procedure Button1Click(Sender: TObject);
        procedure Button2Click(Sender: TObject);
        procedure Button3Click(Sender: TObject);
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
        procedure SendCommand(Sender: TObject; b: Boolean; s: string);
        procedure SendData(Sender: TObject; s: string);
    end;

var
    FZamerV2: TFZamerV2;
    nomer: String;
    cancloseapp: Boolean;
    m: set of byte;

    messs: string;
    pmes: pchar;
    ames: array [1 .. 10] of char;
    fstr: string;

CONST
    WM_MESSAGE_START = WM_USER + 1;
    WM_MESSAGE_STOP = WM_USER + 2;

implementation

{$R *.dfm}

uses UARC, UHH, USopr, UKZ, Unagr, URH, URepP, UProch, UMH, UGRAPHN;

/// /////////////////////////////////////////////////////////////////////////////

procedure TFZamerV2.SendData(Sender: TObject; s: string);
var
    aCopyData: TCopyDataStruct;
    hTargetWnd: HWND;
    z1, z2, ts: string;
    i: integer;
    ss: ansistring;
begin
    QTemp.Open('select value from zini where name=' +
      Quotedstr('ElspecFormHeader'));
    z1 := PWideChar(QTemp.FieldByName('value').Asstring);

    QTemp.Open('select value from zini where name=' +
      Quotedstr('T45FormHeader'));
    z2 := PWideChar(QTemp.FieldByName('value').Asstring);
    /// ////////////////////////////////////////////////
    // z1:= PWideChar('TST');
    ts := s;
    with aCopyData do
    begin
        dwData := 0;
        pmes := pchar(ts);
        cbData := StrLen(pmes) + 2;
        lpData := pmes;
    end;

    hTargetWnd := FindWindowEx(0, 0, nil, pchar(z1));
    if hTargetWnd <> 0 then
        SendMessage(hTargetWnd, WM_COPYDATA, Longint(Handle),
          Longint(@aCopyData))
    else
        ShowMessage('Не обнаружена программа сбора показаний ELSPEC');
    /// ///////////////////////////////////////////////////
    ss := s;
    with aCopyData do
    begin
        dwData := 0;
        pmes := pchar(ss);
        cbData := StrLen(pmes) * 2 + 1;
        lpData := pmes;
    end;
    hTargetWnd := FindWindowEx(0, 0, nil, pchar(z2));
    if hTargetWnd <> 0 then
        SendMessage(hTargetWnd, WM_COPYDATA, Longint(Handle),
          Longint(@aCopyData))
    else
        ShowMessage('Не обнаружена программа сбора показаний Т45');
end;

procedure TFZamerV2.SendCommand(Sender: TObject; b: Boolean; s: string);

begin

    while length(s) < 3 do
        s := '0' + s;
    if b then
    begin
        SendData(FZamerV2, '1' + s);
    end
    else
    begin
        SendData(FZamerV2, '0' + s);
    end;

end;

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

function isemptyfloat(f: string; s: string): string;
begin
    if trim(s) = '' then
        isemptyfloat := ''
    else
      if strtofloat(s) = 0
           then isemptyfloat := ''
         else
        isemptyfloat := myformat(f, strtofloat(s))
end;

function ztoemp(s: string): string;
begin
    if s = '0' then
        ztoemp := ''
    else
        ztoemp := s;
end;

procedure TFZamerV2.FormReport;
const
    wdFindContinue = 1;
    wdReplaceOne = 1;
    wdReplaceAll = 2;
    wdDoNotSaveChanges = 0;
var
    WordApp: OLEVariant;
    SearchString, ReplaceString: string;
    i, j: integer;
    Blank: string;
    ReportPath, fn: string;
    ans: array [0 .. 2] of string;
    tmp: real;
    ts, tm: string;
    k: byte;

    procedure wrepl(s1: string; s2: string);
    begin
        SearchString := s1;
        ReplaceString := s2;
        WordApp.Selection.Find.ClearFormatting;
        WordApp.Selection.Find.Text := SearchString;
        WordApp.Selection.Find.Replacement.Text := ReplaceString;
        WordApp.Selection.Find.Forward := True;
        WordApp.Selection.Find.Wrap := wdFindContinue;
        WordApp.Selection.Find.Format := false;
        WordApp.Selection.Find.MatchCase := True;
        WordApp.Selection.Find.MatchWholeWord := false;
        WordApp.Selection.Find.MatchWildcards := false;
        WordApp.Selection.Find.MatchSoundsLike := false;
        WordApp.Selection.Find.MatchAllWordForms := false;
        WordApp.Selection.Find.Execute(Replace := wdReplaceAll);
    end;

begin
    FrepP.Label1.Caption := 'Создание документа';
    FrepP.Show;

    Blank := Extractfilepath(paramstr(0)) + 'REPORT\BLANK.docx';
    ReportPath := Extractfilepath(paramstr(0)) + 'REPORT';
    fn := ReportPath + '\' + nomer + '.csv';
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

        wrepl('pisp', inttostr(round(strtofloat(FZamerV2.CombPIsp.Text)
          * 1000)));
        AddReportString(fn, '0', 'pisp',
          inttostr(round(strtofloat(FZamerV2.CombPIsp.Text) * 1000)));

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
        wrepl('fio', FZamerV2.CombSotrud.Text);
        AddReportString(fn, '0', 'fio', FZamerV2.CombSotrud.Text);

        // сопротивление
        FrepP.Label1.Caption := 'Сопротивление';
        for i := 1 to 3 do
            for j := 1 to 3 do
            begin // isemptyfloat(tRazI, (ts))     ts := myzero(Frh.Stringgrid2.Cells[4, i]);
                wrepl('st' + inttostr(i) + inttostr(j),
                  isemptyfloat('0.0000', FSopr.StringGrid3.Cells[j, i]));
                AddReportString(fn, '1', 'st' + inttostr(i) + inttostr(j),
                  FSopr.StringGrid3.Cells[j, i]);
            end;
        wrepl('fsoed', FSopr.ComboBox7.Text);
        AddReportString(fn, '1', 'fsoed', FSopr.ComboBox7.Text);
        wrepl('fprizn', FSopr.ComboBox8.Text);
        AddReportString(fn, '1', 'fprizn', FSopr.ComboBox8.Text);
        wrepl('stred1', FSopr.ComboBox9.Text);
        AddReportString(fn, '1', 'stred1', FSopr.ComboBox9.Text);

        wrepl('rizoled1', FSopr.ComboBox10.Text);
        AddReportString(fn, '1', 'rizoled1', FSopr.ComboBox10.Text);
        wrepl('rizoled2', FSopr.ComboBox1.Text);
        AddReportString(fn, '1', 'rizoled2', FSopr.ComboBox1.Text);

        wrepl('rizolvk', FSopr.Edit13.Text);
        AddReportString(fn, '1', 'rizolvk', FSopr.Edit13.Text);
        wrepl('rizolob', FSopr.Edit16.Text);
        AddReportString(fn, '1', 'rizolob', FSopr.Edit16.Text);

        wrepl('tempersopr1', isemptyfloat('0.0', FSopr.Edit8.Text));
        wrepl('tempersopr2', isemptyfloat('0.0', FSopr.Edit1.Text));
        wrepl('tempersopr3', isemptyfloat('0.0', FSopr.Edit2.Text));
        AddReportString(fn, '1', 'tempersopr1',
          isemptyfloat('0.0', FSopr.Edit8.Text));
        AddReportString(fn, '1', 'tempersopr2',
          isemptyfloat('0.0', FSopr.Edit1.Text));
        AddReportString(fn, '1', 'tempersopr3',
          isemptyfloat('0.0', FSopr.Edit2.Text));

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
        wrepl('stred2', FormHH.ComboBox1.Text);
        AddReportString(fn, '1', 'stred2', FormHH.ComboBox1.Text);
        for i := 1 to 12 do
        begin
            wrepl('u' + inttostr(i) + 'hh', FormHH.Stringgrid2.Cells[1, i]);
            AddReportString(fn, '1', 'u' + inttostr(i) + 'hh',
              FormHH.Stringgrid2.Cells[1, i]);
        end;
        for i := 1 to 12 do // isemptyfloat(tRazI, (ts))     ts := myzero(Frh.Stringgrid2.Cells[4, i]);
        begin
            ts := FormHH.Stringgrid2.Cells[2, i];
            wrepl('i' + inttostr(i) + 'hh', isemptyfloat(tRazI, (ts)));
            AddReportString(fn, '1', 'i' + inttostr(i) + 'hh',
              FormHH.Stringgrid2.Cells[2, i]);
        end;
        for i := 1 to 12 do
        begin
            wrepl('p' + inttostr(i) + 'hh', FormHH.Stringgrid2.Cells[3, i]);
            AddReportString(fn, '1', 'p' + inttostr(i) + 'hh',
              FormHH.Stringgrid2.Cells[3, i]);
        end;
        for i := 1 to 12 do
        begin
            wrepl('R' + inttostr(i) + 'hh',
              ztoemp(FormHH.Stringgrid2.Cells[5, i]));
            AddReportString(fn, '1', 'r' + inttostr(i) + 'hh',
              FormHH.Stringgrid2.Cells[5, i]);
        end;
        /// //////
        // короткое замыкание
        FrepP.Label1.Caption := 'Короткое замыкание';

        wrepl('stred3', isemptyfloat('0.0000', FKZ.Edit2.Text) + ' ' + FKZ.ComboBox1.Text);
        AddReportString(fn, '1', 'stred3', FKZ.ComboBox1.Text);
        for i := 1 to 5 do
            for j := 1 to 4 do
            begin
                if FKZ.StringGrid1.Cells[j, i] = '' then
                begin
                    wrepl('Kz' + inttostr(i) + inttostr(j), '');
                    continue;
                end;
                if j = 2 then
                    wrepl('Kz' + inttostr(i) + inttostr(j),
                      myformat('0.000',
                      strtofloat(FKZ.StringGrid1.Cells[j, i])))
                else
                    wrepl('Kz' + inttostr(i) + inttostr(j),
                      myformat('0.0', strtofloat(FKZ.StringGrid1.Cells[j, i])));
            end;

        /// //////   myformat('0.0', strtofloat(FSopr.Edit8.Text))
        // Нагрев
        FrepP.Label1.Caption := 'Нагрев';
        wrepl('stred4', Fnagr.ComboBox3.Text);
        // isemptyfloat(tRazI, (ts))     ts := myzero(Frh.Stringgrid2.Cells[4, i]);
        AddReportString(fn, '1', 'stred4', Fnagr.ComboBox3.Text);
        ts := myzero(Fnagr.StringGrid1.Cells[2, 1]);
        wrepl('N11x', isemptyfloat('0.000', ts));
        ts := myzero(Fnagr.StringGrid1.Cells[2, 2]);
        wrepl('N21x', isemptyfloat('0.000', ts));
        // i
        ts := myzero(Fnagr.StringGrid1.Cells[3, 1]);
        wrepl('N12x', isemptyfloat(tRazP, ts));
        ts := myzero(Fnagr.StringGrid1.Cells[3, 2]);
        wrepl('N22x', isemptyfloat(tRazP, ts));
        // p
        wrepl('N13x', isemptyfloat('0.0', Fnagr.StringGrid1.Cells[4, 1]));
        wrepl('N23x', isemptyfloat('0.0', Fnagr.StringGrid1.Cells[4, 2]));
        // n
        wrepl('N14x', isemptyfloat('0.0', Fnagr.StringGrid1.Cells[5, 1]));
        wrepl('N24x', isemptyfloat('0.0', Fnagr.StringGrid1.Cells[5, 2]));
        // m
        wrepl('N15x', isemptyfloat('0.0', Fnagr.StringGrid1.Cells[6, 1]));
        wrepl('N25x', isemptyfloat('0.0', Fnagr.StringGrid1.Cells[6, 2]));
        // t1
        wrepl('N16x', isemptyfloat('0.0', Fnagr.StringGrid1.Cells[7, 1]));
        wrepl('N26x', isemptyfloat('0.0', Fnagr.StringGrid1.Cells[7, 2]));
        // t2
        wrepl('N17x', isemptyfloat('0.0', Fnagr.StringGrid1.Cells[8, 1]));
        wrepl('N27x', isemptyfloat('0.0', Fnagr.StringGrid1.Cells[8, 2]));
        // t3
        // isemptyfloat(tRazI, (ts))     ts := myzero(Frh.Stringgrid2.Cells[4, i]);
        wrepl('N18x', isemptyfloat('0.0000', Fnagr.StringGrid1.Cells[9, 1]));
        wrepl('N28x', isemptyfloat('0.0000', Fnagr.StringGrid1.Cells[9, 2]));
        // r
        if Fnagr.Edit4.Text <> '0' then
            wrepl('N31x', Fnagr.Edit4.Text)
        else
            wrepl('N31x', ''); // R korp
        if Fnagr.Edit5.Text <> '0' then
            wrepl('N32x', Fnagr.Edit5.Text)
        else
            wrepl('N32x', ''); // R obm
        wrepl('RNAG1', 'НЕИЗВЕСТНО');
        wrepl('stred5', Fnagr.ComboBox3.Text); //

        // прочие характеристики
        FrepP.Label1.Caption := 'Прочие характеристики';
        for j := 1 to 18 do
        begin
            wrepl('Pr' + inttostr(j + 100),
              NVLToEmp(Fproch.StringGrid1.Cells[j, 1]));
        end;
        for j := 1 to 18 do
        begin
            wrepl('Pz' + inttostr(j + 100),
              NVLToEmp(Fproch.StringGrid1.Cells[j, 2]));
        end;
        for i := 1 to 2 do
            for j := 1 to 8 do
            begin
                wrepl('Wh' + inttostr(i) + '-' + inttostr(j),
                  NVLToEmp(Fproch.Stringgrid2.Cells[j, i]));
            end;
        wrepl('rrmass', NVLToEmp(Fproch.Edit2.Text));
        wrepl('tmpr', Fproch.Edit3.Text);
        wrepl('davl', Fproch.Edit5.Text);
        wrepl('vlag', Fproch.Edit4.Text);
        wrepl('upri', Fproch.Edit1.Text);
        // галочки

        if Fproch.radiobutton1.Checked then
            wrepl('epr', 'ВЫДЕРЖАЛ');
        if Fproch.radiobutton2.Checked then
            wrepl('epr', 'НЕ ВЫДЕРЖАЛ');
        if Fproch.radiobutton3.Checked then
            wrepl('epr', 'НЕ ПРОВОДИЛОСЬ');
        if Fproch.radiobutton4.Checked then
            wrepl('ipc', 'ВЫДЕРЖАЛ');
        if Fproch.radiobutton5.Checked then
            wrepl('ipc', 'НЕ ВЫДЕРЖАЛ');
        if Fproch.radiobutton6.Checked then
            wrepl('ipc', 'НЕ ПРОВОДИЛОСЬ');
        if Fproch.RadioButton7.Checked then
            wrepl('ipt', 'ВЫДЕРЖАЛ');
        if Fproch.RadioButton8.Checked then
            wrepl('ipt', 'НЕ ВЫДЕРЖАЛ');
        if Fproch.RadioButton9.Checked then
            wrepl('ipt', 'НЕ ПРОВОДИЛОСЬ');
        if Fproch.RadioButton10.Checked then
            wrepl('triz', 'ВЫДЕРЖАЛ');
        if Fproch.RadioButton11.Checked then
            wrepl('triz', 'НЕ ВЫДЕРЖАЛ');
        if Fproch.RadioButton12.Checked then
            wrepl('triz', 'НЕ ПРОВОДИЛОСЬ');
        if Fproch.RadioButton13.Checked then
            wrepl('u074', 'ВЫДЕРЖАЛ');
        if Fproch.RadioButton14.Checked then
            wrepl('u074', 'НЕ ВЫДЕРЖАЛ');
        if Fproch.RadioButton15.Checked then
            wrepl('u074', 'НЕ ПРОВОДИЛОСЬ');
        if Fproch.RadioButton16.Checked then
            wrepl('u113', 'ВЫДЕРЖАЛ');
        if Fproch.RadioButton17.Checked then
            wrepl('u113', 'НЕ ВЫДЕРЖАЛ');
        if Fproch.RadioButton18.Checked then
            wrepl('u113', 'НЕ ПРОВОДИЛОСЬ');
        {
          tRazU = '0.0';
          tRazP = '0.00';
          tRazI = '0.000';
          tRAZN = '0.0';
          tRazM = '0.00';
          tRazR = '0.0';
        }
        wrepl('TRH1', Frh.Edit4.Text);
        wrepl('TRH2', Frh.Edit5.Text);
        wrepl('TRH3', Frh.Edit6.Text);
        wrepl('RRH1', Frh.Edit7.Text);
        wrepl('stred6', Frh.ComboBox1.Text);
        // рабочая характеристика
        FrepP.Label1.Caption := 'Рабочая характеристика';

        for i := 1 to 10 do
        begin
            ts := myzero(Frh.Stringgrid2.Cells[1, i]);
            wrepl('u' + inttostr(i) + 'rh', isemptyfloat(tRazU, (ts)));
        end;
        for i := 1 to 10 do
        begin
            ts := myzero(Frh.Stringgrid2.Cells[2, i]);
            wrepl('i' + inttostr(i) + 'rh', isemptyfloat(tRazI, (ts)));
        end;
        for i := 1 to 10 do
        begin
            ts := myzero(Frh.Stringgrid2.Cells[3, i]);
            wrepl('p' + inttostr(i) + 'rh', isemptyfloat(tRazP, (ts)));
        end;
        for i := 1 to 10 do
        begin
            ts := myzero(Frh.Stringgrid2.Cells[4, i]);
            wrepl('rot' + inttostr(i) + 'rh', isemptyfloat(tRAZN, (ts)));
        end;
        for i := 1 to 10 do
        begin
            ts := myzero(Frh.Stringgrid2.Cells[5, i]);
            wrepl('torq' + inttostr(i) + 'rh', isemptyfloat(tRazR, (ts)));
        end;

        // Механическая характеристика
        wrepl('u11', FMH.Stringgrid7.Cells[1, 1]);
        m := [];
        k := 0;
        if FMH.CheckBox1.Checked then
            include(m, 1);
        if FMH.CheckBox2.Checked then
            include(m, 2);
        if FMH.CheckBox3.Checked then
            include(m, 3);
        if FMH.CheckBox4.Checked then
            include(m, 4);
        if FMH.CheckBox5.Checked then
            include(m, 5);
        for i := 1 to 5 do
            if i in m then
            begin
                k := k + 1;
                wrepl('u1' + inttostr(k), FMH.Stringgrid7.Cells[1, k]);
                wrepl('u2' + inttostr(k), FMH.Stringgrid7.Cells[2, k]);
                wrepl('u3' + inttostr(k), FMH.Stringgrid7.Cells[3, k]);
            end;
        wrepl('u11', '');
        wrepl('u12', '');
        wrepl('u13', '');
        wrepl('u21', '');
        wrepl('u22', '');
        wrepl('u23', '');
        wrepl('u31', '');
        wrepl('u32', '');
        wrepl('u33', '');

        m := [];
        if FMH.CheckBox6.Checked then
            include(m, 1);
        if FMH.CheckBox7.Checked then
            include(m, 2);
        if FMH.CheckBox8.Checked then
            include(m, 3);
        if FMH.CheckBox9.Checked then
            include(m, 4);
        if FMH.CheckBox10.Checked then
            include(m, 5);
        k := 3;
        for i := 1 to 5 do
            if i in m then
            begin
                k := k + 1;
                wrepl('u1' + inttostr(k), FMH.Stringgrid8.Cells[1, i]);
                wrepl('u2' + inttostr(k), FMH.Stringgrid8.Cells[2, i]);
                wrepl('u3' + inttostr(k), FMH.Stringgrid8.Cells[3, i]);
            end;
        wrepl('u14', '');
        wrepl('u15', '');
        wrepl('u24', '');
        wrepl('u25', '');
        wrepl('u34', '');
        wrepl('u35', '');
        // сохранение документа
        FrepP.Label1.Caption := 'Сохранение документа';
        tm := timetostr(time);
        tm := StringReplace(tm, ':', '-', [rfReplaceAll, rfIgnoreCase]);
        WordApp.ActiveDocument.SaveAs(ReportPath + '\' + nomer + '_' +
          Datetostr(Date) + '_' + tm + '.DOCX');
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
    i: integer;
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
    i, j: integer;
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
    i: integer;
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
    t: integer;
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
    Label2.Caption := timetostr(time);
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
    FormHH.Label7.Caption := CombUisp.Text;
    FormHH.Label12.Caption := nomer;
    FormHH.ShowModal;
end;

procedure TFZamerV2.BitBtn1Click(Sender: TObject);
begin
    ExitBtn.Click;
end;

procedure TFZamerV2.BitBtn2Click(Sender: TObject);
var
    s: string;
begin

    QUpdDvig.Close;
    QUpdDvig.ParamByName('DATA').AsDate := DateTimePicker1.Date;
    QUpdDvig.ParamByName('TIPDV').Asstring := CombTipDvig.Text;
    QUpdDvig.ParamByName('NOMDV').Asstring := EditNumDvig.Text;
    QUpdDvig.ParamByName('POLUS').Asstring := CombPolIsp.Text;
    QUpdDvig.ParamByName('UNOM').AsInteger := strtoint(CombUnom.Text);
    QUpdDvig.ParamByName('UISP').AsInteger := strtoint(CombUisp.Text);
    QUpdDvig.ParamByName('PNOM').AsFloat := strtofloat(Comma(CombPNom.Text));
    QUpdDvig.ParamByName('PISP').AsFloat := strtofloat(Comma(CombPIsp.Text));
    s := EditHumi.Text;
    s := StringReplace(s, ',', '.', [rfReplaceAll, rfIgnoreCase]);
    QUpdDvig.ParamByName('HUMID').AsString := s;
    s := EditPress.Text;
    s := StringReplace(s, ',', '.', [rfReplaceAll, rfIgnoreCase]);
    QUpdDvig.ParamByName('PRESSUR').Asstring := s;
    QUpdDvig.ParamByName('ENERGO').Asstring := CombEnergo.Text;
    QUpdDvig.ParamByName('STENDN').Asstring := CombStend.Text;
    QUpdDvig.ParamByName('STENDA').Asstring := Label19.Caption;
    QUpdDvig.ParamByName('DOP1').Asstring := EditOsmotr.Text;
    QUpdDvig.ParamByName('ISPOLN').Asstring := EditOsob.Text;
    QUpdDvig.ParamByName('READY').AsInteger := 0;
    QUpdDvig.ParamByName('NOMER').Asstring := LNOMER.Caption;
    if CombSotrud.Text = '' then
    begin
        ShowMessage
          ('Не указано ФИО испытателя, проверьте внимательно все необходимые поля');
        exit;
    end;
    QUpdDvig.ParamByName('fio').Asstring := CombSotrud.Text;
    QUpdDvig.ParamByName('regim').Asstring := CombRegim.Text;
    QUpdDvig.ParamByName('POLNom').Asstring := CombPolNom.Text;
    QUpdDvig.ParamByName('POLIsp').Asstring := CombPolIsp.Text;
    s := EditTemp.Text;
    s := StringReplace(s, ',', '.', [rfReplaceAll, rfIgnoreCase]);
    QUpdDvig.ParamByName('TEMP').AsFloat := strtofloat(s);
    QUpdDvig.ExecSQL;
    ShowMessage('Данные двигателя изменены успешно');
end;

procedure TFZamerV2.BitStartIspClick(Sender: TObject);
var
    buttonSelected: integer;
    s: string;
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
            nomer := LNOMER.Caption;
            Qinsdvig.Close;
            Qinsdvig.ParamByName('DATA').AsDate := DateTimePicker1.Date;
            Qinsdvig.ParamByName('TIPDV').Asstring := CombTipDvig.Text;
            Qinsdvig.ParamByName('NOMDV').Asstring := EditNumDvig.Text;
            Qinsdvig.ParamByName('POLUS').Asstring := CombPolIsp.Text;
            Qinsdvig.ParamByName('UNOM').AsInteger := strtoint(CombUnom.Text);
            Qinsdvig.ParamByName('UISP').AsInteger := strtoint(CombUisp.Text);
            try
            Qinsdvig.ParamByName('PNOM').AsFloat :=
              strtofloat(Comma(CombPNom.Text));
            Qinsdvig.ParamByName('PISP').AsFloat :=
              strtofloat(Comma(CombPIsp.Text));
            Qinsdvig.ParamByName('HUMID').AsFloat := strtofloat(EditHumi.Text);
            except
             on E:exception do
              begin
                //E:=NIL;
                ShowMessage('Ошибка тут');
              end;
            end;
            s := EditPress.Text;
            s := StringReplace(s, '.', ',', [rfReplaceAll, rfIgnoreCase]);
            Qinsdvig.ParamByName('PRESSUR').AsFloat := strtofloat(s);
            Qinsdvig.ParamByName('ENERGO').Asstring := CombEnergo.Text;
            Qinsdvig.ParamByName('STENDN').Asstring := CombStend.Text;
            Qinsdvig.ParamByName('STENDA').Asstring := Label19.Caption;
            Qinsdvig.ParamByName('DOP1').Asstring := EditOsmotr.Text;
            Qinsdvig.ParamByName('ISPOLN').Asstring := EditOsob.Text;
            Qinsdvig.ParamByName('READY').AsInteger := 0;
            Qinsdvig.ParamByName('NOMER').Asstring := nomer;
            if CombSotrud.Text = '' then
            begin
                ShowMessage
                  ('Не указано ФИО испытателя, проверьте внимательно все необходимые поля');
                exit;
            end;
            Qinsdvig.ParamByName('fio').Asstring := CombSotrud.Text;
            Qinsdvig.ParamByName('regim').Asstring := CombRegim.Text;
            Qinsdvig.ParamByName('POLNom').Asstring := CombPolNom.Text;
            Qinsdvig.ParamByName('POLIsp').Asstring := CombPolIsp.Text;
            s := EditTemp.Text;
            s := StringReplace(s, '.', ',', [rfReplaceAll, rfIgnoreCase]);
            Qinsdvig.ParamByName('TEMP').AsFloat := strtofloat(s);
            Qinsdvig.ExecSQL;
            comboaddtext;
            FSopr.ComboBox9.Text := FSopr.ComboBox9.Items[0];
            FSopr.ComboBox10.Text := FSopr.ComboBox10.Items[0];
            FZamerV2.ImgSet(FZamerV2.Image1, false);
            FZamerV2.ImgSet(FZamerV2.Image2, false);
            FZamerV2.ImgSet(FZamerV2.Image3, false);
            FZamerV2.ImgSet(FZamerV2.Image4, false);
            FZamerV2.ImgSet(FZamerV2.Image5, false);
            FZamerV2.ImgSet(FZamerV2.Image6, false);
            FZamerV2.ImgSet(FZamerV2.Image7, false);
            Fproch.Edit3.Text := EditTemp.Text;
            Fproch.Edit4.Text := EditHumi.Text;
            Fproch.Edit5.Text := EditPress.Text;
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

procedure TFZamerV2.BMHClick(Sender: TObject);
begin
    FMH.Label35.Caption := CombPIsp.Text;
    FMH.Label33.Caption := CombUisp.Text;
    // Fmh.Label24.Caption := floattostr(strtofloat(CombPIsp.Text) * 1000);
    FMH.Label13.Caption := nomer;
    FMH.ShowModal;
end;

procedure TFZamerV2.BNagrClick(Sender: TObject);
begin
    Fnagr.Label6.Caption := nomer;
    Fnagr.Label26.Caption := CombUisp.Text;
    Fnagr.Label31.Caption := CombPIsp.Text;
    Fnagr.ShowModal;
end;

procedure TFZamerV2.BPIClick(Sender: TObject);
begin
    Fproch.Label6.Caption := nomer;
    Fproch.ShowModal;
end;

procedure TFZamerV2.BRHClick(Sender: TObject);
begin
    Frh.Label19.Caption := CombUisp.Text;
    Frh.Label33.Caption := CombUisp.Text;
    Frh.Label24.Caption := floattostr(strtofloat(CombPIsp.Text) * 1000);
    Frh.Label6.Caption := nomer;
    Frh.ShowModal;
end;

procedure TFZamerV2.enableispyt(f: Boolean);
begin
    BSoprot.Enabled := f;
    BHH.Enabled := f;
    BKz.Enabled := f;
    BNagr.Enabled := f;
    BRH.Enabled := f;
    BMH.Enabled := f;
    BPI.Enabled := f;
end;

procedure TFZamerV2.LoadIspyt(nomer: string);
var
    s, s1, s2: string;
    tip, i, j, nr: integer;
begin
    // двигатель целиком
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('select * from zdvigall where nomer=' + Quotedstr(nomer));
    QTemp.Open;
    DateTimePicker1.DateTime := Strtodate(QTemp.FieldByName('DATA').Asstring);
    CombTipDvig.Text := QTemp.FieldByName('tipdv').Asstring;
    EditNumDvig.Text := QTemp.FieldByName('nomdv').Asstring;
    CombUnom.Text := QTemp.FieldByName('unom').Asstring;
    CombUisp.Text := QTemp.FieldByName('uisp').Asstring;
    CombPNom.Text := QTemp.FieldByName('pnom').Asstring;
    CombPIsp.Text := QTemp.FieldByName('pisp').Asstring;
    CombPolNom.Text := QTemp.FieldByName('polnom').Asstring;
    CombPolIsp.Text := QTemp.FieldByName('polisp').Asstring;
    CombEnergo.Text := QTemp.FieldByName('energo').Asstring;
    EditHumi.Text := QTemp.FieldByName('humid').Asstring;
    EditPress.Text := QTemp.FieldByName('pressur').Asstring;
    CombRegim.Text := QTemp.FieldByName('regim').Asstring;
    CombStend.Text := QTemp.FieldByName('stendn').Asstring;
    Label19.Caption := QTemp.FieldByName('stenda').Asstring;
    EditOsob.Text := QTemp.FieldByName('ispoln').Asstring;
    EditOsmotr.Text := QTemp.FieldByName('dop1').Asstring;
    CombSotrud.Text := QTemp.FieldByName('fio').Asstring;
    EditTemp.Text := QTemp.FieldByName('temp').Asstring;
    enableispyt(True);
    /// ////////////////////////////////////////////////////////////
    // загрузить Холостой ход если есть
    QTemp.Close;
    QTemp.Open('select * from zhhsvod where nomer=' + Quotedstr(nomer) +
      ' order by ns');
    ImgSet(Image2, QTemp.RecordCount <> 0);
    tip := QTemp.FieldByName('tip').AsInteger;
    case tip of
        1:
            begin
                FormHH.Radiobutton1Click(FormHH);
                FormHH.radiobutton1.Checked := True;
            end;
        2:
            begin
                FormHH.Radiobutton2Click(FormHH);
                FormHH.radiobutton2.Checked := True;
            end;
        3:
            begin
                FormHH.Radiobutton3Click(FormHH);
                FormHH.radiobutton3.Checked := True;
            end;
    end;

    tip := 1;
    FormHH.Stringgrid2.rowcount := QTemp.RecordCount + 2;
    FormHH.ComboBox1.Text := QTemp.FieldByName('edizm').Asstring;
    while not(QTemp.Eof) do
    begin
        FormHH.Stringgrid2.Cells[0, tip] := QTemp.FieldByName('uisp').Asstring;
        FormHH.Stringgrid2.Cells[1, tip] :=
          addzeroend(QTemp.FieldByName('usred').Asstring, 1);
        FormHH.Stringgrid2.Cells[2, tip] :=
          addzeroend(QTemp.FieldByName('isred').Asstring, 2);
        FormHH.Stringgrid2.Cells[3, tip] :=
          addzeroend(QTemp.FieldByName('psred').Asstring, 1);
        FormHH.Stringgrid2.Cells[4, tip] := QTemp.FieldByName('dumax').Asstring;
        FormHH.Stringgrid2.Cells[5, tip] := QTemp.FieldByName('r').Asstring;
        FormHH.Stringgrid2.Cells[6, tip] := QTemp.FieldByName('otklon')
          .Asstring;
        QTemp.Next;
        tip := tip + 1;
    end;
    case QTemp.FieldByName('vizol').AsInteger of
        0:
            FormHH.radiobutton6.Checked := True;
        1:
            FormHH.radiobutton4.Checked := True;
        2:
            FormHH.radiobutton5.Checked := True;
    end;

    // загрузить сопротивление если есть
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.Open('select * from zsoprot where nomer=' + Quotedstr(nomer));
    FZamerV2.ImgSet(FZamerV2.Image1, QTemp.RecordCount <> 0);

    FSopr.Edit8.Text := QTemp.FieldByName('TEMP1').Asstring;
    FSopr.Edit1.Text := QTemp.FieldByName('TEMP2').Asstring;
    FSopr.Edit2.Text := QTemp.FieldByName('TEMP3').Asstring;
    FSopr.ComboBox7.Text := QTemp.FieldByName('PHAS').Asstring;
    FSopr.ComboBox8.Text := QTemp.FieldByName('SOED').Asstring;
    FSopr.ComboBox9.Text := QTemp.FieldByName('SOPRED').Asstring;
    s := QTemp.FieldByName('IZOLED').Asstring;
    s1 := s;
    delete(s1, pos(' ', s1), length(s1));
    s2 := s;
    delete(s2, 1, pos(' ', s2));
    FSopr.ComboBox10.Text := s1;
    FSopr.ComboBox1.Text := s2;
    FSopr.Edit13.Text := QTemp.FieldByName('IZOLKORP').Asstring;
    FSopr.Edit16.Text := QTemp.FieldByName('IZOLOBMOT').Asstring;
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
      ' order by uisp');
    FZamerV2.ImgSet(FZamerV2.Image3, QTemp.RecordCount <> 0);

    FKZ.StringGrid1.row := 1;
    FKZ.StringGrid1.rowcount := 10;

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
    Fnagr.ComboBox3.Text := QTemp.FieldByName('edizmispyt').Asstring;
    Fnagr.ComboBox1.Text := QTemp.FieldByName('edizmkorp').Asstring;
    Fnagr.ComboBox2.Text := QTemp.FieldByName('edizmobm').Asstring;
    if QTemp.FieldByName('RKORP').Asstring = '' then
        Fnagr.Edit4.Text := '0'
    else
        Fnagr.Edit4.Text := QTemp.FieldByName('RKORP').Asstring;

    if QTemp.FieldByName('ROBM').Asstring = '' then
        Fnagr.Edit5.Text := '0'
    else
        Fnagr.Edit5.Text := QTemp.FieldByName('ROBM').Asstring;
    while not QTemp.Eof do
    begin
        Fnagr.StringGrid1.Cells[1, QTemp.FieldByName('tip').AsInteger] :=
          QTemp.FieldByName('u').Asstring;
        Fnagr.StringGrid1.Cells[2, QTemp.FieldByName('tip').AsInteger] :=
          QTemp.FieldByName('i').Asstring;
        Fnagr.StringGrid1.Cells[3, QTemp.FieldByName('tip').AsInteger] :=
          QTemp.FieldByName('p').Asstring;
        Fnagr.StringGrid1.Cells[4, QTemp.FieldByName('tip').AsInteger] :=
          QTemp.FieldByName('n').Asstring;
        Fnagr.StringGrid1.Cells[5, QTemp.FieldByName('tip').AsInteger] :=
          QTemp.FieldByName('m').Asstring;
        Fnagr.StringGrid1.Cells[6, QTemp.FieldByName('tip').AsInteger] :=
          QTemp.FieldByName('t1').Asstring;
        Fnagr.StringGrid1.Cells[7, QTemp.FieldByName('tip').AsInteger] :=
          QTemp.FieldByName('t2').Asstring;
        Fnagr.StringGrid1.Cells[8, QTemp.FieldByName('tip').AsInteger] :=
          QTemp.FieldByName('t3').Asstring;
        Fnagr.StringGrid1.Cells[9, QTemp.FieldByName('tip').AsInteger] :=
          QTemp.FieldByName('r').Asstring;
        Fnagr.StringGrid1.Cells[10, QTemp.FieldByName('tip').AsInteger] :=
          QTemp.FieldByName('otklonu').Asstring;
        Fnagr.StringGrid1.Cells[11, QTemp.FieldByName('tip').AsInteger] :=
          QTemp.FieldByName('otklonp').Asstring;
        Fnagr.StringGrid1.Cells[12, QTemp.FieldByName('tip').AsInteger] :=
          QTemp.FieldByName('pm').Asstring;
        QTemp.Next;
    end;

    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.Open('select * from zproch where nomer=' + Quotedstr(nomer));
    FZamerV2.ImgSet(FZamerV2.Image7, QTemp.RecordCount <> 0);
    if QTemp.FieldByName('eprochu').Asstring = '' then
        Fproch.Edit1.Text := '380'
    else
        Fproch.Edit1.Text := QTemp.FieldByName('eprochu').Asstring;
    if QTemp.FieldByName('massa').Asstring = '' then
        Fproch.Edit2.Text := '0'
    else
        Fproch.Edit2.Text := QTemp.FieldByName('massa').Asstring;

    case QTemp.FieldByName('eproch').AsInteger of
        1:
            Fproch.radiobutton1.Checked := True;
        2:
            Fproch.radiobutton2.Checked := True;
        0:
            Fproch.radiobutton3.Checked := True;
    end;
    case QTemp.FieldByName('hifreq').AsInteger of
        1:
            Fproch.radiobutton4.Checked := True;
        2:
            Fproch.radiobutton5.Checked := True;
        0:
            Fproch.radiobutton6.Checked := True;
    end;
    case QTemp.FieldByName('peregruz').AsInteger of
        1:
            Fproch.RadioButton7.Checked := True;
        2:
            Fproch.RadioButton8.Checked := True;
        0:
            Fproch.RadioButton9.Checked := True;
    end;
    case QTemp.FieldByName('rizol').AsInteger of
        1:
            Fproch.RadioButton10.Checked := True;
        2:
            Fproch.RadioButton11.Checked := True;
        0:
            Fproch.RadioButton12.Checked := True;
    end;
    case QTemp.FieldByName('u074').AsInteger of
        1:
            Fproch.RadioButton13.Checked := True;
        2:
            Fproch.RadioButton14.Checked := True;
        0:
            Fproch.RadioButton15.Checked := True;
    end;
    case QTemp.FieldByName('u113').AsInteger of
        1:
            Fproch.RadioButton16.Checked := True;
        2:
            Fproch.RadioButton17.Checked := True;
        0:
            Fproch.RadioButton18.Checked := True;
    end;

    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.Open('select * from zvibro where nomer=' + Quotedstr(nomer));
    while not(QTemp.Eof) do
    begin
        Fproch.StringGrid1.Cells[QTemp.FieldByName('y').AsInteger,
          QTemp.FieldByName('x').AsInteger] := QTemp.FieldByName('val')
          .Asstring;
        QTemp.Next;
    end;
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.Open('select * from zzvuk where nomer=' + Quotedstr(nomer));
    while not(QTemp.Eof) do
    begin
        Fproch.Stringgrid2.Cells[QTemp.FieldByName('y').AsInteger,
          QTemp.FieldByName('x').AsInteger] := QTemp.FieldByName('val')
          .Asstring;
        QTemp.Next;
    end;

    // загрузить рабочую характеристику

    for i := 0 to Frh.Stringgrid2.colcount - 1 do
        for j := 1 to Frh.Stringgrid2.rowcount - 1 do
            Frh.Stringgrid2.Cells[i, j] := '';
    // Frh.Stringgrid2.rowcount := 2;

    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.Open('select * from zrhsvod where nomer=' + Quotedstr(nomer) +
      ' order by pisp desc');
    FZamerV2.ImgSet(FZamerV2.Image5, QTemp.RecordCount <> 0);

    Frh.Stringgrid2.rowcount := QTemp.FieldByName('nr').AsInteger + 1;
    tip := QTemp.FieldByName('tip').AsInteger;
    nr := QTemp.FieldByName('nr').AsInteger;
    case tip of
        1:
            begin
                //
                Frh.radiobutton1.Checked := True;
                Frh.Radiobutton1Click(Frh);
                Frh.StringGrid1.col := 1;
                Frh.StringGrid1.OnClick(Frh);
            end;
        2:
            begin
                Frh.Radiobutton2Click(Frh);
                Frh.radiobutton2.Checked := True;
                Frh.StringGrid1.col := 2;
                Frh.StringGrid1.OnClick(Frh);
            end;
        3:
            begin
                Frh.Radiobutton3Click(Frh);
                Frh.radiobutton3.Checked := True;
                Frh.StringGrid1.col := 3;
                Frh.StringGrid1.OnClick(Frh);
            end;
    end;


    if QTemp.FieldByName('t1').Asstring = '' then
        Frh.Edit4.Text := '0'
    else
        Frh.Edit4.Text := QTemp.FieldByName('t1').Asstring;
    if QTemp.FieldByName('t2').Asstring = '' then
        Frh.Edit5.Text := '0'
    else
        Frh.Edit5.Text := QTemp.FieldByName('t2').Asstring;
    if QTemp.FieldByName('t3').Asstring = '' then
        Frh.Edit6.Text := '0'
    else
        Frh.Edit6.Text := QTemp.FieldByName('t3').Asstring;
    if QTemp.FieldByName('r').Asstring = '' then
        Frh.Edit7.Text := '0'
    else
        Frh.Edit7.Text := QTemp.FieldByName('r').Asstring;

    Frh.Edit4.Text := QTemp.FieldByName('t1').Asstring;
    Frh.Edit5.Text := QTemp.FieldByName('t2').Asstring;
    Frh.Edit6.Text := QTemp.FieldByName('t3').Asstring;
    Frh.Edit7.Text := QTemp.FieldByName('r').Asstring;

    tip := 1;
    Frh.ComboBox1.Text := QTemp.FieldByName('edizm').Asstring;
    Frh.Stringgrid2.rowcount := nr + 1;
    while (not(QTemp.Eof)) do
        if tip < Frh.Stringgrid2.rowcount then
        begin
            Frh.Stringgrid2.Cells[0, tip] := QTemp.FieldByName('pisp').Asstring;
            Frh.Stringgrid2.Cells[1, tip] := QTemp.FieldByName('usred')
              .Asstring;
            Frh.Stringgrid2.Cells[2, tip] := QTemp.FieldByName('isred')
              .Asstring;
            Frh.Stringgrid2.Cells[3, tip] := QTemp.FieldByName('psred')
              .Asstring;
            Frh.Stringgrid2.Cells[4, tip] := QTemp.FieldByName('rot').Asstring;
            Frh.Stringgrid2.Cells[5, tip] := QTemp.FieldByName('torq').Asstring;
            Frh.Stringgrid2.Cells[6, tip] := QTemp.FieldByName('dumax')
              .Asstring;
            Frh.Stringgrid2.Cells[7, tip] := QTemp.FieldByName('dpmax')
              .Asstring;
            Frh.Stringgrid2.Cells[8, tip] :=
              QTemp.FieldByName('otklonu').Asstring;
            Frh.Stringgrid2.Cells[9, tip] :=
              QTemp.FieldByName('otklonp').Asstring;
            QTemp.Next;
            tip := tip + 1;
        end;



    // загрузить механическую характеристику

    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.Open('select * from zmehsvod where nomer=' + Quotedstr(nomer));
    FZamerV2.ImgSet(FZamerV2.Image6, QTemp.RecordCount <> 0);
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.Open('select * from zmehsvod where nomer=' + Quotedstr(nomer) +
      ' and tip=1');
    while not(QTemp.Eof) do
    begin
        FMH.Stringgrid7.Cells[1, QTemp.FieldByName('numisp').AsInteger] :=
          QTemp.FieldByName('u').Asstring;
        FMH.Stringgrid7.Cells[2, QTemp.FieldByName('numisp').AsInteger] :=
          QTemp.FieldByName('torq').Asstring;
        FMH.Stringgrid7.Cells[3, QTemp.FieldByName('numisp').AsInteger] :=
          QTemp.FieldByName('rot').Asstring;
        if QTemp.FieldByName('checked').AsInteger = 1 then
        begin
            case QTemp.FieldByName('numisp').AsInteger of
                1:
                    FMH.CheckBox1.Checked := True;
                2:
                    FMH.CheckBox2.Checked := True;
                3:
                    FMH.CheckBox3.Checked := True;
                4:
                    FMH.CheckBox4.Checked := True;
                5:
                    FMH.CheckBox5.Checked := True;
            end;
        end;
        QTemp.Next;
    end;
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.Open('select * from zmehsvod where nomer=' + Quotedstr(nomer) +
      ' and tip=2');
    while not(QTemp.Eof) do
    begin
        FMH.Stringgrid8.Cells[1, QTemp.FieldByName('numisp').AsInteger] :=
          QTemp.FieldByName('u').Asstring;
        FMH.Stringgrid8.Cells[2, QTemp.FieldByName('numisp').AsInteger] :=
          QTemp.FieldByName('torq').Asstring;
        FMH.Stringgrid8.Cells[3, QTemp.FieldByName('numisp').AsInteger] :=
          QTemp.FieldByName('rot').Asstring;
        if QTemp.FieldByName('checked').AsInteger = 1 then
        begin
            case QTemp.FieldByName('numisp').AsInteger of
                1:
                    FMH.CheckBox6.Checked := True;
                2:
                    FMH.CheckBox7.Checked := True;
                3:
                    FMH.CheckBox8.Checked := True;
                4:
                    FMH.CheckBox9.Checked := True;
                5:
                    FMH.CheckBox10.Checked := True;
            end;
        end;
        QTemp.Next;

    end;

    //

    /// ////////////////////////////////////////////////////////////////////////////
end;

procedure TFZamerV2.BitArcClick(Sender: TObject);
var
    i: integer;
begin
    i := Farc.ShowModal;
    if i = mrOk then
    begin
        LNOMER.Caption := Farc.Label1.Caption;
        nomer := LNOMER.Caption;
        LoadIspyt(nomer);
    end;
    if i = mrYes then
    begin
        LNOMER.Caption := Farc.Label1.Caption;
        nomer := LNOMER.Caption;
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

procedure TFZamerV2.Button1Click(Sender: TObject);
begin
    FGraphN.Show;
end;

procedure TFZamerV2.Button2Click(Sender: TObject);
begin
    SendCommand(FZamerV2, false, FSett.Edit7.Text);
end;

procedure TFZamerV2.Button3Click(Sender: TObject);
var
    s: string;
begin
    s := '1 234';
    SendData(FZamerV2, s);
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
var
    p: textfile;
    p1, p2: string;
begin
    AssignFile(p, Extractfilepath(paramstr(0)) + 'path.ini');
    Reset(p);
    ReadLn(p, p1);
    ReadLn(p, p2);
    Closefile(p);
    ShellExecute(Handle, 'open', PWideChar(p1), nil, nil, SW_SHOWNORMAL);
    ShellExecute(Handle, 'open', PWideChar(p2), nil, nil, SW_SHOWNORMAL);
    { QTemp.Open('select value from zini where name=' + Quotedstr('UIPPath'));
      ShellExecute(Handle, 'open', PWideChar(QTemp.FieldByName('value').Asstring),
      nil, nil, SW_SHOWNORMAL);
      QTemp.Open('select value from zini where name=' + Quotedstr('MNTPath'));
      ShellExecute(Handle, 'open', PWideChar(QTemp.FieldByName('value').Asstring),
      nil, nil, SW_SHOWNORMAL);
    }
    DateTimePicker1.Date := Date;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('Update version set maintotal=maintotal+1');
    QTemp.ExecSQL;
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('UPDATE ZAMER.ZAMER SET TORQ  = 0, ROT = 0, POWER = 0');
    QTemp.ExecSQL;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('UPDATE ZAMER.ZELSPECTMP SET ID  = 0, U = 0, I   = 0, ');
    QTemp.SQL.Add(' P   = 0, U1  = 0, U2  = 0, U3  = 0, I1  = 0, ');
    QTemp.SQL.Add(' I2  = 0, I3  = 0, DOP = 0, P1  = 0, P2  = 0, ');
    QTemp.SQL.Add(' P3  = 0, KPD = 0');
    QTemp.ExecSQL;
    cancloseapp := True;
    restoreini;
    restorecombo;
    if FileExists('s:\place.txt') then
        fstr := 'SS.FF'
    else
        fstr := 'SS,FF';
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

end.// Сбор ELSPEC
