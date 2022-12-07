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
    FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
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
    end;

var
    FZamerV2   : TFZamerV2;
    nomer      : String;
    cancloseapp: Boolean;

implementation

{$R *.dfm}

uses UARC, UHH, USopr, UKZ, Unagr;

procedure TFZamerV2.ImgSet(i: TImage; v: Boolean);
var
    s: string;
begin
    if v then
        i.picture.LoadFromFile(extractfilepath(paramstr(0)) + 'apply.bmp')
    else
        i.picture.LoadFromFile(extractfilepath(paramstr(0)) + 'erase.bmp')
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
        i := tinifile.Create(extractfilepath(paramstr(0)) + 'ZAMERV2.INI');
        t := FZamerV2.Left;
        i.WriteInteger('POSITION', 'LEFT', t);
        t := FZamerV2.Top;
        i.WriteInteger('POSITION', 'TOP', t);
        i.free;
    except
        on e: exception do
            e := NIL;
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
    checkcreatenew := true;
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
    FormHH.Label7.Caption  := CombUisp.Text;
    FormHH.Label12.Caption := nomer;
    FormHH.ShowModal;
end;

procedure TFZamerV2.BitBtn1Click(Sender: TObject);
begin
    ExitBtn.Click;
end;

procedure TFZamerV2.BitStartIspClick(Sender: TObject);
var
    buttonSelected: integer;
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
              DateToStr(DateTimePicker1.Date);
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
            Qinsdvig.ParamByName('fio').Asstring    := CombSotrud.Text;
            Qinsdvig.ParamByName('regim').Asstring  := CombRegim.Text;
            Qinsdvig.ParamByName('POLNom').Asstring := CombPolNom.Text;
            Qinsdvig.ParamByName('POLIsp').Asstring := CombPolIsp.Text;
            Qinsdvig.ParamByName('TEMP').Asstring   := EditTemp.Text;
            Qinsdvig.ExecSQL;
            comboaddtext;
            ShowMessage('Можно приступать к испытаниям');
            enableispyt(true);
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
    FNagr.ShowModal;
end;

procedure TFZamerV2.enableispyt(f: Boolean);
begin
    BSoprot.Enabled := f;
    BHH.Enabled     := f;
    BKz.Enabled     := f;
    BNagr.Enabled   := f;
    // BRH.Enabled := f;
    // BMH.Enabled := f;
    // BPI.Enabled := f;
end;

procedure TFZamerV2.LoadIspyt(nomer: string);
var
    s  : string;
    tip: integer;
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
    enableispyt(true);
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
                FormHH.Radiobutton1Click(FormHH);
                FormHH.radiobutton1.Checked := true;
            end;
        2:
            begin
                FormHH.Radiobutton2Click(FormHH);
                FormHH.radiobutton2.Checked := true;
            end;
        3:
            begin
                FormHH.Radiobutton3Click(FormHH);
                FormHH.radiobutton3.Checked := true;
            end;
    end;

    tip                         := 1;
    FormHH.Stringgrid2.rowcount := QTemp.RecordCount + 2;
    while not(QTemp.Eof) do
    begin
        FormHH.Stringgrid2.Cells[1, tip] := QTemp.FieldByName('usred').Asstring;
        FormHH.Stringgrid2.Cells[2, tip] := QTemp.FieldByName('isred').Asstring;
        FormHH.Stringgrid2.Cells[3, tip] := QTemp.FieldByName('psred').Asstring;
        FormHH.Stringgrid2.Cells[4, tip] := QTemp.FieldByName('dumax').Asstring;
        FormHH.Stringgrid2.Cells[5, tip] := QTemp.FieldByName('r').Asstring;
        FormHH.Stringgrid2.Cells[6, tip] := QTemp.FieldByName('otklon')
          .Asstring;
        QTemp.Next;
        tip := tip + 1;
    end;
    case QTemp.FieldByName('vizol').AsInteger of
        0:
            FormHH.RadioButton6.Checked := true;
        1:
            FormHH.RadioButton4.Checked := true;
        2:
            FormHH.RadioButton5.Checked := true;
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
    if FSopr.ComboBox9.Text = '' then
        FSopr.ComboBox9.Text := 'Ом';
    FSopr.ComboBox10.Text    := QTemp.FieldByName('IZOLED').Asstring;
    if FSopr.ComboBox10.Text = '' then
        FSopr.ComboBox10.Text := 'МОм';

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
            FSopr.radiobutton3.Checked := true;
        1:
            FSopr.radiobutton1.Checked := true;
        2:
            FSopr.radiobutton2.Checked := true;
    end;
    /// ////////////////////////////////////////////////////////////
    // загрузить Короткое замыкание если есть
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.Open('select * from zkzsvod where nomer=' + Quotedstr(nomer) +
      ' order by uisp desc');
    FZamerV2.ImgSet(FZamerV2.Image3, QTemp.RecordCount <> 0);

    FKZ.StringGrid1.row      := 1;
    FKZ.StringGrid1.rowcount := 10;
    FKZ.Edit2.Enabled        := false;
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
        FKZ.Edit2.Text      := QTemp.FieldByName('r').Asstring;
        QTemp.Next;
    end;

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
        nomer          := LNOMER.Caption;
        LoadIspyt(nomer);
    end;
    if i = mrYes then
    begin
        LNOMER.Caption := Farc.Label1.Caption;
        nomer          := LNOMER.Caption;
        LoadIspyt(nomer);
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

    QTemp.SQL.Clear;
    QTemp.SQL.Add('Update version set maintotal=maintotal+1');
    QTemp.ExecSQL;
    cancloseapp := true;
    restoreini;
    restorecombo;
end;

procedure TFZamerV2.restoreini;
var
    i: tinifile;
begin
    i := tinifile.Create(extractfilepath(paramstr(0)) + 'ZAMERV2.INI');
    FZamerV2.Left := i.ReadInteger('POSITION', 'LEFT', 10);
    FZamerV2.Top := i.ReadInteger('POSITION', 'TOP', 10);
    FZamerV2.Repaint;
    i.free;
end;

end.
