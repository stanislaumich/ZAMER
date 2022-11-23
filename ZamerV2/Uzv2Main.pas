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
    FireDAC.DatS,
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
        procedure FormCreate(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
    private
        { Private declarations }
    public
        procedure saveini;
        procedure restoreini;
        procedure restorecombo;
        procedure savecombo;
        function checkcreatenew: boolean;
        procedure comboaddtext;
        procedure ImgSet(i: TImage; v: boolean);
        procedure LoadIspyt(nomer: string);
        procedure enableispyt(f:boolean);
    end;

var
    FZamerV2   : TFZamerV2;
    nomer      : String;
    cancloseapp: boolean;



implementation

{$R *.dfm}

uses UARC, UHH;

procedure TFZamerV2.ImgSet(i: TImage; v: boolean);
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
            TComboBox(Components[i]).Items.Add(TComboBox(Components[i]).Text);
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

function TFZamerV2.checkcreatenew: boolean;
var
    s: string;
begin
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

    checkcreatenew := true;
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
    FormHH.Label7.Caption := CombUisp.Text;
    FormHH.Label12.Caption := Nomer;
    FormHH.Show;
end;

procedure TFZamerV2.BitBtn1Click(Sender: TObject);
begin
    ExitBtn.Click;
end;

procedure TFZamerV2.BitStartIspClick(Sender: TObject);
begin
    if checkcreatenew then
    begin

        comboaddtext;
    end
    else
        ShowMessage('Проверьте поля, не все необходимые поля заполнены');
end;

procedure TFZamerV2.enableispyt(f:boolean);
 begin
   BSoprot.Enabled:=f;
 end;

procedure TFZamerV2.LoadIspyt(nomer: string);
var
    s: string;
    tip:integer;
begin
 // двигатель целиком
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add('select * from zdvigall where nomer='+Quotedstr(nomer));
    QTemp.Open;
        Datetimepicker1.DateTime:= Strtodate(QTemp.FieldByName('DATA').AsString);
        CombTipDvig.Text  := QTemp.FieldByName('tipdv').AsString;
        EditNumDvig.Text      := QTemp.FieldByName('nomdv').AsString;
        Combunom.Text  := QTemp.FieldByName('unom').AsString;
        Combuisp.Text  := QTemp.FieldByName('uisp').AsString;
        Combpnom.Text  := QTemp.FieldByName('pnom').AsString;
        Combpisp.Text  := QTemp.FieldByName('pisp').AsString;
        Combpolnom.Text  := QTemp.FieldByName('polnom').AsString;
        Combpolisp.Text  := QTemp.FieldByName('polisp').AsString;
        CombEnergo.Text  := QTemp.FieldByName('energo').AsString;
        EditHumi.Text    := QTemp.FieldByName('humid').AsString;
        EditPress.Text   := QTemp.FieldByName('pressur').AsString;
        CombRegim.Text  := QTemp.FieldByName('regim').AsString;
        CombStend.Text  := QTemp.FieldByName('stendn').AsString;
        Label19.Caption := QTemp.FieldByName('stenda').AsString;
        EditOsob.Text    := QTemp.FieldByName('ispoln').AsString;
        EditOsmotr.Text    := QTemp.FieldByName('dop1').AsString;
        CombSotrud.Text  := QTemp.FieldByName('fio').AsString;
        enableispyt(True);

 /// ////////////////////////////////////////////////////////////
    // загрузить Холостой ход если есть
    Qtemp.Close;
    Qtemp.SQL.Clear;
    Qtemp.Open('select * from zhhsvod where nomer=' + Quotedstr(Nomer) +
      ' order by uisp desc');
    ImgSet(Image2,Qtemp.RecordCount <> 0);

    tip := Qtemp.FieldByName('tip').AsInteger;
    case tip of
        1:
            begin
                formhh.Radiobutton1Click(formhh);
                formhh.radiobutton1.Checked := True;
            end;
        2:
            begin
                formhh.Radiobutton2Click(formhh);
                formhh.radiobutton2.Checked := True;
            end;
        3:
            begin
                formhh.Radiobutton3Click(formhh);
                formhh.radiobutton3.Checked := True;
            end;
    end;
    tip                        := 1;
    formhh.Stringgrid2.rowcount := Qtemp.RecordCount + 2;
    while not(Qtemp.Eof) do
    begin
        formhh.Stringgrid2.Cells[1, tip] := Qtemp.FieldByName('usred').Asstring;
        formhh.Stringgrid2.Cells[2, tip] := Qtemp.FieldByName('isred').Asstring;
        formhh.Stringgrid2.Cells[3, tip] := Qtemp.FieldByName('psred').Asstring;
        formhh.Stringgrid2.Cells[4, tip] := Qtemp.FieldByName('dumax').Asstring;
        formhh.Stringgrid2.Cells[5, tip] := Qtemp.FieldByName('r').Asstring;
        formhh.Stringgrid2.Cells[6, tip] := Qtemp.FieldByName('otklon').Asstring;
        Qtemp.Next;
        tip := tip + 1;
    end;
    case Qtemp.FieldByName('vizol').AsInteger of
    0: Formhh.RadioButton6.Checked:=true;
    1: Formhh.RadioButton4.Checked:=true;
    2: Formhh.RadioButton5.Checked:=true;
    end;
 ///////////////////////////////////////////////////////////////////////////////
end;

procedure TFZamerV2.BitArcClick(Sender: TObject);
var
 i:integer;
begin
    i:= Farc.ShowModal;
    if i = mrOk then
    begin
        LNOMER.Caption := Farc.Label1.Caption;
        Nomer          := LNOMER.Caption;
        LoadIspyt(nomer);
    end;
    if i = mrYes then
    begin
        LNOMER.Caption := Farc.Label1.Caption;
        Nomer          := LNOMER.Caption;
        LoadIspyt(nomer);
    end;

end;

procedure TFZamerV2.BitBtn5Click(Sender: TObject);
begin
    FSett.ShowModal;
end;

procedure TFZamerV2.BSoprotClick(Sender: TObject);
begin
    ImgSet(Image1, true);
end;

procedure TFZamerV2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    // saveini;
    // savecombo;
end;

procedure TFZamerV2.FormCreate(Sender: TObject);
begin
    QTEmp.SQL.Clear;
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
