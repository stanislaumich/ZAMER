unit Umain;

interface

{
  Usr=3529
  Isr=3531
  Psr=3439

  U12=3511
  U23=3513
  U31=3515

  I1=3521
  I2=3523
  I3=3525

  P1=3427
  P2=3429
  P3=3431

  PRM_CODE_AUTHENTICATION	Authentication field for get write access through modbus	2	W	2 Bytes Integer	998	30999
  PRM_CODE_ACTIVE_CONNECTIONS_WEB	number of current active web interfaces	4	R	4 Bytes Integer	505	30506	Power Quality Analyzer G4400
  PRM_CODE_PT_PRIMARY	Potential Transformer Primary	4	RW	4 Bytes Integer	17	30018	Power Quality Analyzer G4400


}
uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
    KRTimer,
    KRVarLabel, KRComponentCollection, KRVariables, KRModbusClient,
    KRModbusMaster, KRConnector, KRTCPConnector, inifiles, ustr,
    Vcl.ComCtrls,
    FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
    FireDAC.UI.Intf,
    FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
    FireDAC.Stan.Async,
    FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
    FireDAC.Phys.Oracle, FireDAC.Phys.OracleDef, FireDAC.Stan.Param,
    FireDAC.DatS, ShellApi, ComObj, URepProgress, Math,
    FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.ExtCtrls;

type
    TFMain = class(TForm)
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
        KRTCPConnector1: TKRTCPConnector;
        KRModbusMaster1: TKRModbusMaster;
        KRModbusClient1: TKRModbusClient;
        KRTimer1: TKRTimer;
        Label10: TLabel;
        Edit1: TEdit;
        Label11: TLabel;
        Edit2: TEdit;
        Edit3: TEdit;
        Label12: TLabel;
        Usred: TKRMBRegister;
        Isred: TKRMBRegister;
        Psred: TKRMBRegister;
        BitBtn10: TBitBtn;
        Label13: TLabel;
        DateTimePicker1: TDateTimePicker;
        Label14: TLabel;
        Label15: TLabel;
        ComboBox1: TComboBox;
        Edit4: TEdit;
        Label16: TLabel;
        ComboBox2: TComboBox;
        Label17: TLabel;
        Edit5: TEdit;
        Label18: TLabel;
        Edit6: TEdit;
        Edit7: TEdit;
        Label19: TLabel;
        Label20: TLabel;
        ComboBox3: TComboBox;
        Label21: TLabel;
        Label22: TLabel;
        Edit8: TEdit;
        Edit9: TEdit;
        Label23: TLabel;
        ComboBox4: TComboBox;
        Label24: TLabel;
        Label25: TLabel;
        Edit10: TEdit;
        Label26: TLabel;
        Edit11: TEdit;
        Timer500: TTimer;
        FDOra: TFDConnection;
        Qm45Getsred: TFDQuery;
        QCommand: TFDQuery;
        Label27: TLabel;
        Edit12: TEdit;
        Button1: TButton;
        OpenDialog1: TOpenDialog;
        QInsertNewDvig: TFDQuery;
        Qtemp: TFDQuery;
        BitBtn11: TBitBtn;
        Label28: TLabel;
        QAttestat: TFDQuery;
        StatusBar1: TStatusBar;
        Edit13: TEdit;
        RU1: TKRMBRegister;
        RU2: TKRMBRegister;
        RU3: TKRMBRegister;
        RI1: TKRMBRegister;
        RI2: TKRMBRegister;
        RI3: TKRMBRegister;
        RP1: TKRMBRegister;
        RP2: TKRMBRegister;
        RP3: TKRMBRegister;
        Label29: TLabel;
        Label30: TLabel;
        Label31: TLabel;
        KRPASSWORD: TKRMBRegister;
        KRTrans: TKRMBRegister;
        Label32: TLabel;
        BitBtn13: TBitBtn;
        GroupBox4: TGroupBox;
        Label4: TLabel;
        KRVarLabel1: TKRVarLabel;
        KRVarLabel2: TKRVarLabel;
        KRVarLabel3: TKRVarLabel;
        Label5: TLabel;
        Label6: TLabel;
        BitBtn14: TBitBtn;
        Button2: TButton;
        Label1: TLabel;
        Label2: TLabel;
        Label3: TLabel;
        Label35: TLabel;
        QUpdDvig: TFDQuery;
        Qinserr: TFDQuery;
        QDelta: TFDQuery;
        Psredq: TKRMBRegister;
        BitBtn12: TBitBtn;
        Label36: TLabel;
        ComboBox5: TComboBox;
        Label37: TLabel;
        GroupBox5: TGroupBox;
        BitBtn15: TBitBtn;
        Edit15: TEdit;
        Label34: TLabel;
        Label33: TLabel;
        Edit14: TEdit;
        Button3: TButton;
        Label7: TLabel;
        Label8: TLabel;
        CheckBox1: TCheckBox;
        Label9: TLabel;
        ComboBox6: TComboBox;
        Button4: TButton;
        procedure BitBtn10Click(Sender: TObject);
        procedure KRTCPConnector1ConnectionStatus(Sender: TObject;
          AStat: TKRConnectorStat; AReconnectTime: Cardinal);
        procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
        procedure ReadIni;
        Procedure WriteIni;
        procedure FormCreate(Sender: TObject);
        procedure Timer500Timer(Sender: TObject);
        procedure KRTimer1Timer(Sender: TObject);
        procedure Commandstart(c: Integer; n: string);
        procedure Button1Click(Sender: TObject);
        procedure restoredvigall;
        procedure savegrids;
        procedure restoregrids;
        procedure savecombo;
        procedure restorecombo;

        procedure BitBtn1Click(Sender: TObject);
        procedure BitBtn3Click(Sender: TObject);
        procedure BitBtn7Click(Sender: TObject);
        procedure ComboBox4Change(Sender: TObject);
        procedure Edit13Change(Sender: TObject);
        procedure BitBtn8Click(Sender: TObject);
        procedure enableispyt(p: Boolean);
        procedure BitBtn9Click(Sender: TObject);
        procedure BitBtn5Click(Sender: TObject);
        procedure BitBtn4Click(Sender: TObject);
        procedure BitBtn2Click(Sender: TObject);
        procedure BitBtn6Click(Sender: TObject);
        procedure BitBtn13Click(Sender: TObject);
        procedure Button2Click(Sender: TObject);
        procedure IsredError(Sender: TObject; Variable: TKRVariable);
        procedure PsredError(Sender: TObject; Variable: TKRVariable);
        procedure UsredError(Sender: TObject; Variable: TKRVariable);
        procedure Button3Click(Sender: TObject);
        procedure BitBtn15Click(Sender: TObject);
        procedure BitBtn11Click(Sender: TObject);

        procedure loaddelta;
        procedure savedelta;
        procedure FormCurrentReport;
        procedure LoadIspyt(Nomer: String);
        procedure BitBtn14Click(Sender: TObject);
        procedure BitBtn12Click(Sender: TObject);
        procedure CheckBox1Click(Sender: TObject);
        procedure Button4Click(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    FMain    : TFMain;
    Activated: Boolean;
    /// //////////////////////////
    USR, ISR, PSR: Integer;
    U12, U23, U31: Integer;
    I1, I2, I3   : Integer;
    P1, P2, P3   : Integer;
    /// /////////////////////////
    M45Exe, M45Path     : String;
    ReportPath, SettPAth: String;
    Nomer               : string;
    ReadM45             : Boolean;

CONST
    RazU = -1;
    RazP = -2;
    RazI = -3;
    RAZN = -1;
    RazM = -2;
    RazR = -1;

implementation

{$R *.dfm}

uses UHH, USoprot, UProdol, UKZam, UNagrev, URH, UMehan, UArc, UDatchik, Uproch,
    UMH, USettings, UGraph;

procedure TFMain.enableispyt(p: Boolean);
begin
    BitBtn3.Enabled  := p;
    BitBtn1.Enabled  := p;
    BitBtn5.Enabled  := p;
    BitBtn4.Enabled  := p;
    BitBtn2.Enabled  := p;
    BitBtn6.Enabled  := p;
    BitBtn11.Enabled := p;
end;

function NVLToZero(s:string):string;
 begin
  if s='' then NVLToZero:='0' else NVLToZero:=s;
 end;

function NVLToEmp(s:string):string;
 begin
  if s='0' then NVLToEmp:='' else NVLToEmp:=s;
 end;


function Point(s: string): string;
begin
  Point := strReplace(s, ',', '.');
end;

function Comma(s: string): string;
begin
  Comma := strReplace(s, '.', ',');
end;

procedure TFMain.savecombo;
var
    i, j: Integer;
begin
    for i := 0 to FMain.ComponentCount - 1 do
    begin
        if Components[i] is TComboBox then
        begin
            if TComboBox(Components[i]).Tag <> 500 then
            begin
                Qtemp.Close;
                Qtemp.SQL.Clear;
                Qtemp.SQL.Add('delete from ini where name=' +
                  Quotedstr(TComboBox(Components[i]).name));
                Qtemp.ExecSQL;
                for j := 0 to TComboBox(Components[i]).Items.Count - 1 do
                begin
                    Qtemp.Close;
                    Qtemp.SQL.Clear;
                    Qtemp.SQL.Add('insert into ini (name, value) values(');
                    Qtemp.SQL.Add(Quotedstr(TComboBox(Components[i]).name) +
                      ', ' + Quotedstr(TComboBox(Components[i])
                      .Items[j]) + ')');
                    Qtemp.ExecSQL;
                end;
            end;

        end;
    end;
end;

procedure TFMain.loaddelta;
begin
    // холостой ход
    QDelta.Open('select value from zdelta where name=' + Quotedstr('uhh'));
    Fhhod.Edit2.Text := QDelta.FieldByName('value').Asstring;
    //
end;

procedure TFMain.savedelta;
begin
    // холостой ход
    QDelta.SQL.Clear;
    QDelta.SQL.Add('delete from zdelta where name=' + Quotedstr('uhh'));
    QDelta.ExecSQL;
    QDelta.SQL.Clear;
    QDelta.SQL.Add('insert into zdelta (name,value) values(' + Quotedstr('uhh')
      + ',' + Fhhod.Edit2.Text + ')');
    QDelta.ExecSQL;
    //
end;

procedure TFMain.restorecombo;
var
    i: Integer;
begin
    for i := 0 to FMain.ComponentCount - 1 do
    begin
        if Components[i] is TComboBox then
        begin
            if TComboBox(Components[i]).Tag <> 500 then
            begin
                TComboBox(Components[i]).Items.Clear;
                Qtemp.Close;
                Qtemp.Open('select distinct(value) v from ini where name=' +
                  Quotedstr(TComboBox(Components[i]).name));
                while not Qtemp.Eof do
                begin
                    TComboBox(Components[i])
                      .Items.Add(Qtemp.FieldByName('v').Asstring);
                    Qtemp.Next;
                end;
            end;
        end;
    end;

    ComboBox4.Items.Clear;
    Qtemp.Close;
    Qtemp.Open('select Name from stend');
    while not Qtemp.Eof do
    begin
        ComboBox4.Items.Add(Qtemp.FieldByName('name').Asstring);
        Qtemp.Next;
    end;
    ComboBox5.Items.Clear;
    Qtemp.Close;
    Qtemp.Open('select fio from zsotr order by id');
    while not Qtemp.Eof do
    begin
        ComboBox5.Items.Add(Qtemp.FieldByName('fio').Asstring);
        Qtemp.Next;
    end;

end;

procedure TFMain.savegrids;
var
    s   : string;
    i, j: Integer;
begin

end;

procedure TFMain.restoregrids;
var
    s   : string;
    i, j: Integer;
begin

end;

procedure TFMain.restoredvigall;
var
    s: string;
begin

end;

function RoundMax1000(Num: real): real;
begin
    result := round(Num * 1000 + 0.5) / 1000;
end;

procedure TFMain.BitBtn11Click(Sender: TObject);
begin
    Fproch.Edit4.Text := Edit8.Text;
    Fproch.Edit5.Text := Edit9.Text;
    Fproch.ShowModal;
end;

procedure TFMain.BitBtn12Click(Sender: TObject);
begin
    FSettings.ShowModal;
end;

procedure TFMain.BitBtn13Click(Sender: TObject);
begin
    FArc.BitBtn3.Click();
    FArc.ShowModal;
end;

procedure TFMain.BitBtn14Click(Sender: TObject);
var
    s: string;
begin
    s := Extractfilepath(paramstr(0)) + 'backup.bat';
    ShellExecute(Handle, 'open', PWideChar(s), nil, nil, SW_SHOWNORMAL);
end;

procedure TFMain.BitBtn15Click(Sender: TObject);
begin
    FDatchik.Show;
end;

procedure TFMain.BitBtn1Click(Sender: TObject);
begin
    Fhhod.ShowModal;
end;

procedure TFMain.BitBtn2Click(Sender: TObject);
begin
    Frh.ShowModal;
end;

procedure TFMain.BitBtn3Click(Sender: TObject);
begin
    FSoprot.Label1.Caption := Nomer;
    FSoprot.ShowModal;
end;

procedure TFMain.BitBtn4Click(Sender: TObject);
begin
    Fnagrev.ShowModal;
end;

procedure TFMain.BitBtn5Click(Sender: TObject);
begin
    FKZam.Label12.Caption := Nomer;
    FKZam.ShowModal;
end;

procedure TFMain.BitBtn6Click(Sender: TObject);
begin
    FMehan.ShowModal;
end;

procedure TFMain.BitBtn7Click(Sender: TObject);
var
    buttonSelected: Integer;
begin
    buttonSelected :=
      MessageDlg('Все ли поля условий испытания заполнены верно?',
      mtConfirmation, mbYesNo, 0);
    if buttonSelected = mrYes then
    begin
        ComboBox1.Items.Add(ComboBox1.Text);
        ComboBox2.Items.Add(ComboBox2.Text);
        ComboBox6.Items.Add(ComboBox6.Text);
        Qtemp.Open('select getnomer nomer from dual');
        Edit13.Text := Qtemp.FieldByName('nomer').Asstring;
        Nomer       := Edit13.Text;
        try
            QInsertNewDvig.Close;
            QInsertNewDvig.ParamByName('DATA').Asstring :=
              DateToStr(DateTimePicker1.Date);
            QInsertNewDvig.ParamByName('TIPDV').Asstring := ComboBox1.Text;
            QInsertNewDvig.ParamByName('NOMDV').Asstring := Edit4.Text;
            QInsertNewDvig.ParamByName('POLUS').Asstring := ComboBox2.Text;
            QInsertNewDvig.ParamByName('UNOM').AsInteger :=
              strtoint(Edit5.Text);
            QInsertNewDvig.ParamByName('UISP').AsInteger :=
              strtoint(Edit6.Text);
            QInsertNewDvig.ParamByName('PNOM').AsFloat :=
              strtofloat(Comma(Edit7.Text));
            QInsertNewDvig.ParamByName('HUMID').AsFloat :=
              strtofloat(Edit8.Text);
            QInsertNewDvig.ParamByName('PRESSUR').AsFloat :=
              strtofloat(Edit9.Text);
            QInsertNewDvig.ParamByName('ENERGO').Asstring := ComboBox3.Text;
            QInsertNewDvig.ParamByName('STENDN').Asstring := ComboBox4.Text;
            QInsertNewDvig.ParamByName('STENDA').Asstring := Label24.Caption;
            QInsertNewDvig.ParamByName('DOP1').Asstring   := Edit11.Text;
            QInsertNewDvig.ParamByName('ISPOLN').Asstring := Edit10.Text;
            QInsertNewDvig.ParamByName('READY').AsInteger := 0;
            QInsertNewDvig.ParamByName('NOMER').Asstring  := Nomer;
            QInsertNewDvig.ParamByName('fio').Asstring    := ComboBox5.Text;
            QInsertNewDvig.ParamByName('regim').Asstring  := ComboBox6.Text;
            QInsertNewDvig.ExecSQL;
            Label28.Caption    := 'X';
            Label28.Font.Color := clRed;
            Label29.Caption    := 'X';
            Label29.Font.Color := clRed;
            Label31.Caption    := 'X';
            Label31.Font.Color := clRed;
            Label30.Caption    := 'X';
            Label30.Font.Color := clRed;
            Label32.Caption    := 'X';
            Label32.Font.Color := clRed;
            Label35.Caption    := 'X';
            Label35.Font.Color := clRed;
            Label9.Caption     := 'X';
            Label9.Font.Color  := clRed;

            ShowMessage('Можно приступать к испытаниям двигателя');
            enableispyt(True);
        Except
            on E: Exception do
            begin
                ShowMessage
                  ('Проверьте, все ли параметры текущего испытания указаны верно');
                E := NIL;
            end;
        end;
    end;
end;

function b(i: Integer): Boolean;
begin // нужна для расстановки галочек из базы
    b := i = 1;
end;

procedure TFMain.LoadIspyt(Nomer: String);
var
    tip : Integer;
    i, j: Integer;
begin
    // загрузить сопротивление если есть
    Qtemp.Close;
    Qtemp.SQL.Clear;
    Qtemp.Open('select * from zsoprot where nomer=' + Quotedstr(Nomer));
    if Qtemp.RecordCount = 0 then
    begin
        Label28.Caption    := 'X';
        Label28.Font.Color := clRed;
    end
    else
    begin
        Label28.Caption    := 'ПРОЙДЕН';
        Label28.Font.Color := clGreen;
    end;
    // Label1.Caption := nomer;
    FSoprot.Edit8.Text              := Qtemp.FieldByName('TEMPER').Asstring;
    FSoprot.ComboBox7.Text          := Qtemp.FieldByName('PHAS').Asstring;
    FSoprot.ComboBox8.Text          := Qtemp.FieldByName('SOED').Asstring;
    FSoprot.ComboBox9.Text          := Qtemp.FieldByName('SOPRED').Asstring;
    if FSoprot.ComboBox9.Text='' then FSoprot.ComboBox9.TExt:='Ом';
    FSoprot.ComboBox10.Text         := Qtemp.FieldByName('IZOLED').Asstring;
    if FSoprot.ComboBox10.Text='' then FSoprot.ComboBox10.Text:='МОм';
    FSoprot.Edit13.Text             := Qtemp.FieldByName('IZOLKORP').Asstring;
    FSoprot.Edit16.Text             := Qtemp.FieldByName('IZOLOBMOT').Asstring;
    FSoprot.StringGrid3.Cells[1, 1] := Qtemp.FieldByName('IZM1U1U2').Asstring;
    FSoprot.StringGrid3.Cells[1, 2] := Qtemp.FieldByName('IZM2U1U2').Asstring;
    FSoprot.StringGrid3.Cells[1, 3] := Qtemp.FieldByName('IZM3U1U2').Asstring;
    FSoprot.StringGrid3.Cells[2, 1] := Qtemp.FieldByName('IZM1V1V2').Asstring;
    FSoprot.StringGrid3.Cells[2, 2] := Qtemp.FieldByName('IZM2V1V2').Asstring;
    FSoprot.StringGrid3.Cells[2, 3] := Qtemp.FieldByName('IZM3V1V2').Asstring;
    FSoprot.StringGrid3.Cells[3, 1] := Qtemp.FieldByName('IZM1W1W2').Asstring;
    FSoprot.StringGrid3.Cells[3, 2] := Qtemp.FieldByName('IZM2W1W2').Asstring;
    FSoprot.StringGrid3.Cells[3, 3] := Qtemp.FieldByName('IZM3W1W2').Asstring;
    // FSoprot.Edit1.Text              := Qtemp.FieldByName('BOLT').Asstring;
    case Qtemp.FieldByName('BOLT').AsInteger of
        0:
            FSoprot.radiobutton3.Checked := True;
        1:
            FSoprot.radiobutton1.Checked := True;
        2:
            FSoprot.radiobutton2.Checked := True;
    end;

    case Qtemp.FieldByName('ispyt13').AsInteger of
        0:
            FSoprot.radiobutton6.Checked := True;
        1:
            FSoprot.radiobutton4.Checked := True;
        2:
            FSoprot.radiobutton5.Checked := True;
    end;

    /// ////////////////////////////////////////////////////////////
    // загрузить Холостой ход если есть
    Qtemp.Close;
    Qtemp.SQL.Clear;
    Qtemp.Open('select * from zhhsvod where nomer=' + Quotedstr(Nomer) +
      ' order by uisp desc');
    if Qtemp.RecordCount = 0 then
    begin
        Label29.Caption    := 'X';
        Label29.Font.Color := clRed;
    end
    else
    begin
        Label29.Caption    := 'ПРОЙДЕН';
        Label29.Font.Color := clGreen;
    end;
    tip := Qtemp.FieldByName('tip').AsInteger;
    case tip of
        1:
            begin
                Fhhod.Radiobutton1Click(Fhhod);
                Fhhod.radiobutton1.Checked := True;
            end;
        2:
            begin
                Fhhod.Radiobutton2Click(Fhhod);
                Fhhod.radiobutton2.Checked := True;
            end;
        3:
            begin
                Fhhod.Radiobutton3Click(Fhhod);
                Fhhod.radiobutton3.Checked := True;
            end;
    end;
    tip                        := 1;
    Fhhod.Stringgrid2.rowcount := Qtemp.RecordCount + 2;
    while not(Qtemp.Eof) do
    begin
        Fhhod.Stringgrid2.Cells[1, tip] := Qtemp.FieldByName('usred').Asstring;
        Fhhod.Stringgrid2.Cells[2, tip] := Qtemp.FieldByName('isred').Asstring;
        Fhhod.Stringgrid2.Cells[3, tip] := Qtemp.FieldByName('psred').Asstring;
        Fhhod.Stringgrid2.Cells[4, tip] := Qtemp.FieldByName('dumax').Asstring;
        Fhhod.Stringgrid2.Cells[5, tip] := Qtemp.FieldByName('r').Asstring;
        Qtemp.Next;
        tip := tip + 1;
    end;

    /// ////////////////////////////////////////////////////////////
    // загрузить Рабочую характеристику если есть
    // FRH.BitBtn3.Click;
    for i                               := 0 to Frh.Stringgrid2.colcount - 1 do
        for j                           := 1 to Frh.Stringgrid2.rowcount - 1 do
            Frh.Stringgrid2.Cells[i, j] := '';
    Frh.Stringgrid2.rowcount            := 2;

    Qtemp.Close;
    Qtemp.SQL.Clear;
    Qtemp.Open('select * from zrhsvod where nomer=' + Quotedstr(Nomer) +
      ' order by pisp desc');
    if Qtemp.RecordCount = 0 then
    begin
        Label30.Caption    := 'X';
        Label30.Font.Color := clRed;
    end

    else
    begin
        Label30.Caption    := 'ПРОЙДЕН';
        Label30.Font.Color := clGreen;
    end;

    tip := Qtemp.FieldByName('tip').AsInteger;
    case tip of
        1:
            begin
                Frh.Radiobutton1Click(Frh);
                Frh.radiobutton1.Checked := True;
            end;
        2:
            begin
                Frh.Radiobutton2Click(Frh);
                Frh.radiobutton2.Checked := True;
            end;
        3:
            begin
                Frh.Radiobutton3Click(Frh);
                Frh.radiobutton3.Checked := True;
            end;
    end;
    tip                      := 1;
    Frh.Stringgrid2.rowcount := Qtemp.RecordCount + 2;
    if Qtemp.FieldByName('t1').Asstring = '' then
        Frh.Edit4.Text := '0'
    else
        Frh.Edit4.Text := Qtemp.FieldByName('t1').Asstring;
    if Qtemp.FieldByName('t2').Asstring = '' then
        Frh.Edit5.Text := '0'
    else
        Frh.Edit5.Text := Qtemp.FieldByName('t2').Asstring;
    if Qtemp.FieldByName('t3').Asstring = '' then
        Frh.Edit6.Text := '0'
    else
        Frh.Edit6.Text := Qtemp.FieldByName('t3').Asstring;
    if Qtemp.FieldByName('r').Asstring = '' then
        Frh.Edit7.Text := '0'
    else
        Frh.Edit7.Text := Qtemp.FieldByName('r').Asstring;

    while not(Qtemp.Eof) do
    begin
        Frh.Stringgrid2.Cells[0, tip] := Qtemp.FieldByName('pisp').Asstring;
        Frh.Stringgrid2.Cells[1, tip] := Qtemp.FieldByName('usred').Asstring;
        Frh.Stringgrid2.Cells[2, tip] := Qtemp.FieldByName('isred').Asstring;
        Frh.Stringgrid2.Cells[3, tip] := Qtemp.FieldByName('psred').Asstring;
        Frh.Stringgrid2.Cells[4, tip] := Qtemp.FieldByName('rot').Asstring;
        Frh.Stringgrid2.Cells[5, tip] := Qtemp.FieldByName('torq').Asstring;
        Frh.Stringgrid2.Cells[6, tip] := Qtemp.FieldByName('dumax').Asstring;
        Frh.Stringgrid2.Cells[7, tip] := Qtemp.FieldByName('dpmax').Asstring;
        Qtemp.Next;
        tip := tip + 1;
    end;

    /// ////////////////////////////////////////////////////////////
    // загрузить Короткое замыкание если есть
    Qtemp.Close;
    Qtemp.SQL.Clear;
    Qtemp.Open('select * from zkzsvod where nomer=' + Quotedstr(Nomer) +
      ' order by uisp desc');
    if Qtemp.RecordCount = 0 then
    begin
        Label31.Caption    := 'X';
        Label31.Font.Color := clRed;
    end
    else
    begin
        Label31.Caption    := 'ПРОЙДЕН';
        Label31.Font.Color := clGreen;
    end;
    FKZam.StringGrid1.row      := 1;
    FKZam.StringGrid1.rowcount := 10;
    while not(Qtemp.Eof) do
    begin
        FKZam.StringGrid1.Cells[0, FKZam.StringGrid1.row] :=
          Qtemp.FieldByName('uisp').Asstring;
        FKZam.StringGrid1.Cells[1, FKZam.StringGrid1.row] :=
          Qtemp.FieldByName('u').Asstring;
        FKZam.StringGrid1.Cells[2, FKZam.StringGrid1.row] :=
          Qtemp.FieldByName('i').Asstring;
        FKZam.StringGrid1.Cells[3, FKZam.StringGrid1.row] :=
          Qtemp.FieldByName('p').Asstring;
        FKZam.StringGrid1.Cells[4, FKZam.StringGrid1.row] :=
          Qtemp.FieldByName('m').Asstring;
        FKZam.StringGrid1.row := FKZam.StringGrid1.row + 1;
        FKZam.Edit2.Text      := Qtemp.FieldByName('r').Asstring;
        Qtemp.Next;

    end;

    /// ////////////////////////////////////////////////////////////
    // загрузить Механическую характеристику если есть
    Qtemp.Close;
    Qtemp.SQL.Clear;
    Qtemp.Open('select * from zmehsvod where nomer=' + Quotedstr(Nomer));
    if Qtemp.RecordCount = 0 then
    begin
        Label32.Caption    := 'X';
        Label32.Font.Color := clRed;
    end
    else
    begin
        Label32.Caption    := 'ПРОЙДЕН';
        Label32.Font.Color := clGreen;
    end;

    Qtemp.Close;
    Qtemp.SQL.Clear;
    Qtemp.Open('select * from zmehsvod where nomer=' + Quotedstr(Nomer) +
      ' and tip=1');
    while not(Qtemp.Eof) do
    begin
        FMehan.StringGrid7.Cells[1, Qtemp.FieldByName('numisp').AsInteger] :=
          Qtemp.FieldByName('u').Asstring;
        FMehan.StringGrid7.Cells[2, Qtemp.FieldByName('numisp').AsInteger] :=
          Qtemp.FieldByName('torq').Asstring;
        FMehan.StringGrid7.Cells[3, Qtemp.FieldByName('numisp').AsInteger] :=
          Qtemp.FieldByName('rot').Asstring;
        if Qtemp.FieldByName('checked').AsInteger = 1 then
        begin
            case Qtemp.FieldByName('numisp').AsInteger of
                1:
                    FMehan.RadioButton11.Checked := True;
                2:
                    FMehan.RadioButton12.Checked := True;
                3:
                    FMehan.RadioButton13.Checked := True;
                4:
                    FMehan.RadioButton14.Checked := True;
                5:
                    FMehan.RadioButton15.Checked := True;
            end;
        end;
        Qtemp.Next;
    end;
    Qtemp.Close;
    Qtemp.SQL.Clear;
    Qtemp.Open('select * from zmehsvod where nomer=' + Quotedstr(Nomer) +
      ' and tip=2');
    while not(Qtemp.Eof) do
    begin
        FMehan.StringGrid8.Cells[1, Qtemp.FieldByName('numisp').AsInteger] :=
          Qtemp.FieldByName('u').Asstring;
        FMehan.StringGrid8.Cells[2, Qtemp.FieldByName('numisp').AsInteger] :=
          Qtemp.FieldByName('torq').Asstring;
        FMehan.StringGrid8.Cells[3, Qtemp.FieldByName('numisp').AsInteger] :=
          Qtemp.FieldByName('rot').Asstring;
        if Qtemp.FieldByName('checked').AsInteger = 1 then
        begin
            case Qtemp.FieldByName('numisp').AsInteger of
                1:
                    FMehan.RadioButton16.Checked := True;
                2:
                    FMehan.RadioButton17.Checked := True;
                3:
                    FMehan.RadioButton18.Checked := True;
                4:
                    FMehan.RadioButton19.Checked := True;
                5:
                    FMehan.RadioButton20.Checked := True;
            end;
        end;
        Qtemp.Next;

    end;
    /// ////////////////////////////////////////////////////////////
    // загрузить прочие сипытания
    Qtemp.Close;
    Qtemp.SQL.Clear;
    Qtemp.Open('select * from zproch where nomer=' + Quotedstr(Nomer));
    if Qtemp.RecordCount = 0 then
    begin
        Label35.Caption    := 'X';
        Label35.Font.Color := clRed;
    end
    else
    begin
        Label35.Caption    := 'ПРОЙДЕН';
        Label35.Font.Color := clGreen;
    end;
    //
    Qtemp.Close;
    Qtemp.SQL.Clear;
    Qtemp.Open('select * from zproch where nomer=' + Quotedstr(Nomer));
    if Qtemp.FieldByName('eprochu').Asstring = '' then
        Fproch.Edit1.Text := '380'
    else
        Fproch.Edit1.Text := Qtemp.FieldByName('eprochu').Asstring;
    if Qtemp.FieldByName('massa').Asstring = '' then
        Fproch.Edit2.Text := '0'
    else
        Fproch.Edit2.Text := Qtemp.FieldByName('massa').Asstring;

    case Qtemp.FieldByName('eproch').AsInteger of
        1:
            Fproch.radiobutton1.Checked := True;
        2:
            Fproch.radiobutton2.Checked := True;
        0:
            Fproch.radiobutton3.Checked := True;
    end;
    case Qtemp.FieldByName('hifreq').AsInteger of
        1:
            Fproch.radiobutton4.Checked := True;
        2:
            Fproch.radiobutton5.Checked := True;
        0:
            Fproch.radiobutton6.Checked := True;
    end;
    case Qtemp.FieldByName('peregruz').AsInteger of
        1:
            Fproch.RadioButton7.Checked := True;
        2:
            Fproch.RadioButton8.Checked := True;
        0:
            Fproch.RadioButton9.Checked := True;
    end;
    case Qtemp.FieldByName('rizol').AsInteger of
        1:
            Fproch.RadioButton10.Checked := True;
        2:
            Fproch.RadioButton11.Checked := True;
        0:
            Fproch.RadioButton12.Checked := True;
    end;
    case Qtemp.FieldByName('u074').AsInteger of
        1:
            Fproch.RadioButton13.Checked := True;
        2:
            Fproch.RadioButton14.Checked := True;
        0:
            Fproch.RadioButton15.Checked := True;
    end;
    case Qtemp.FieldByName('u113').AsInteger of
        1:
            Fproch.RadioButton16.Checked := True;
        2:
            Fproch.RadioButton17.Checked := True;
        0:
            Fproch.RadioButton18.Checked := True;
    end;

    Qtemp.Close;
    Qtemp.SQL.Clear;
    Qtemp.Open('select * from zvibro where nomer=' + Quotedstr(Nomer));
    while not(Qtemp.Eof) do
    begin
        Fproch.StringGrid1.Cells[Qtemp.FieldByName('y').AsInteger,
          Qtemp.FieldByName('x').AsInteger] := Qtemp.FieldByName('val')
          .Asstring;
        Qtemp.Next;
    end;
    Qtemp.Close;
    Qtemp.SQL.Clear;
    Qtemp.Open('select * from zzvuk where nomer=' + Quotedstr(Nomer));
    while not(Qtemp.Eof) do
    begin
        Fproch.Stringgrid2.Cells[Qtemp.FieldByName('y').AsInteger,
          Qtemp.FieldByName('x').AsInteger] := Qtemp.FieldByName('val')
          .Asstring;
        Qtemp.Next;
    end;

    /// ////////////////////////////////////////////////////////////
    // загрузить нагрев
    Qtemp.Open('select * from znagrevsvod where nomer=' + Quotedstr(Nomer));
    if Qtemp.RecordCount = 0 then
    begin
        Label9.Caption    := 'X';
        Label9.Font.Color := clRed;
    end
    else
    begin
        Label9.Caption    := 'ПРОЙДЕН';
        Label9.Font.Color := clGreen;
    end;
    { SELECT NOMER, U, I, P, N, M,  T1, R, TIP, DOP1, RKORP, ROBM, T2, T3, T }
    Qtemp.first;
    if Qtemp.FieldByName('t1').Asstring = '' then
        Fnagrev.Edit6.Text := '0'
    else
        Fnagrev.Edit6.Text := Qtemp.FieldByName('t1').Asstring;

    if Qtemp.FieldByName('t2').Asstring = '' then
        Fnagrev.Edit7.Text := '0'
    else
        Fnagrev.Edit7.Text := Qtemp.FieldByName('t2').Asstring;

    if Qtemp.FieldByName('t3').Asstring = '' then
        Fnagrev.Edit8.Text := '0'
    else
        Fnagrev.Edit8.Text := Qtemp.FieldByName('t3').Asstring;

    if Qtemp.FieldByName('RKORP').Asstring = '' then
        Fnagrev.Edit4.Text := '0'
    else
        Fnagrev.Edit4.Text := Qtemp.FieldByName('RKORP').Asstring;

    if Qtemp.FieldByName('ROBM').Asstring = '' then
        Fnagrev.Edit5.Text := '0'
    else
        Fnagrev.Edit5.Text := Qtemp.FieldByName('ROBM').Asstring;
    while not Qtemp.Eof do
    begin
        Fnagrev.StringGrid1.Cells[1, Qtemp.FieldByName('tip').AsInteger] :=
          Qtemp.FieldByName('u').Asstring;
        Fnagrev.StringGrid1.Cells[2, Qtemp.FieldByName('tip').AsInteger] :=
          Qtemp.FieldByName('i').Asstring;
        Fnagrev.StringGrid1.Cells[3, Qtemp.FieldByName('tip').AsInteger] :=
          Qtemp.FieldByName('p').Asstring;
        Fnagrev.StringGrid1.Cells[4, Qtemp.FieldByName('tip').AsInteger] :=
          Qtemp.FieldByName('n').Asstring;
        Fnagrev.StringGrid1.Cells[5, Qtemp.FieldByName('tip').AsInteger] :=
          Qtemp.FieldByName('m').Asstring;
        Fnagrev.StringGrid1.Cells[6, Qtemp.FieldByName('tip').AsInteger] :=
          Qtemp.FieldByName('t').Asstring;
        Fnagrev.StringGrid1.Cells[7, Qtemp.FieldByName('tip').AsInteger] := '0';
        Qtemp.Next;
    end;

end;

procedure TFMain.BitBtn8Click(Sender: TObject);
var
    tip: Integer;
begin
    Fprodol.Qselectneokon.Close;
    Fprodol.Qselectneokon.Open;
    Fprodol.ShowModal;
    if Nomer <> '0' then
    begin
        ComboBox1.Text  := Fprodol.ComboBox1.Text;
        Edit4.Text      := Fprodol.Edit4.Text;
        ComboBox2.Text  := Fprodol.ComboBox2.Text;
        Edit7.Text      := Fprodol.Edit7.Text;
        ComboBox3.Text  := Fprodol.ComboBox3.Text;
        Edit5.Text      := Fprodol.Edit5.Text;
        Edit6.Text      := Fprodol.Edit6.Text;
        Edit8.Text      := Fprodol.Edit8.Text;
        Edit9.Text      := Fprodol.Edit9.Text;
        ComboBox4.Text  := Fprodol.ComboBox4.Text;
        Label24.Caption := Fprodol.Label24.Caption;
        Edit11.Text     := Fprodol.Edit11.Text;
        Edit10.Text     := Fprodol.Edit10.Text;
        ComboBox6.Text  := Fprodol.Edit2.Text;
        ComboBox5.Text  := Fprodol.Edit1.Text;
        LoadIspyt(Nomer);
        enableispyt(True);
    end;
end;

/// /////////////////////////////////////////////////////////////////////////////////////////////////////////

procedure TFMain.FormCurrentReport;
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

    ans: array [0 .. 2] of string;

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
    Qtemp.Close;
    Qtemp.Open('select * from ini where name=' + Quotedstr('set_yes'));
    ans[1] := Qtemp.FieldByName('value').Asstring;
    Qtemp.Close;
    Qtemp.Open('select * from ini where name=' + Quotedstr('set_no'));
    ans[2] := Qtemp.FieldByName('value').Asstring;
    Qtemp.Close;
    Qtemp.Open('select * from ini where name=' + Quotedstr('set_un'));
    ans[0] := Qtemp.FieldByName('value').Asstring;
    // *****************
    Blank := Extractfilepath(paramstr(0)) + 'REPORT\BLANK.docx';
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
        // холостой ход
        FrepP.Label1.Caption := 'Холостой ход';
        // wrepl('p' + inttostr(i) + 'hh', Fhhod.Stringgrid2.Cells[3, i]);
        // wrepl('p' + inttostr(i) + 'hh', Fhhod.Stringgrid2.Cells[3, i]);
        for i := 1 to 10 do
        begin
            wrepl('u' + inttostr(i) + 'hh', Fhhod.Stringgrid2.Cells[1, i]);
        end;
        for i := 1 to 10 do
        begin
            wrepl('i' + inttostr(i) + 'hh', Fhhod.Stringgrid2.Cells[2, i]);
        end;
        for i := 1 to 10 do
        begin
            wrepl('p' + inttostr(i) + 'hh', Fhhod.Stringgrid2.Cells[3, i]);
        end;
        for i := 1 to 10 do
        begin
            wrepl('R' + inttostr(i) + 'hh', Fhhod.Stringgrid2.Cells[5, i]);
        end;
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
        // сопротивление
        FrepP.Label1.Caption := 'Сопротивление';
        for i                := 1 to 3 do
            for j            := 1 to 3 do
            begin
                wrepl('st' + inttostr(i) + inttostr(j),
                  FSoprot.StringGrid3.Cells[j, i]);
            end;
        wrepl('fsoed', FSoprot.ComboBox7.Text);
        wrepl('fprizn', FSoprot.ComboBox8.Text);
        wrepl('stred', FSoprot.ComboBox9.Text);
        wrepl('rizoled', FSoprot.ComboBox10.Text);
        wrepl('rizolvk', FSoprot.Edit13.Text);
        wrepl('rizolob', FSoprot.Edit16.Text);
        wrepl('temper', FSoprot.Edit8.Text);
        // wrepl('bolt', FSoprot.Edit1.Text);
        if FSoprot.radiobutton1.Checked then
            wrepl('bolt', 'ВЫДЕРЖАЛ');
        if FSoprot.radiobutton2.Checked then
            wrepl('bolt', 'НЕ ВЫДЕРЖАЛ');
        if FSoprot.radiobutton3.Checked then
            wrepl('bolt', 'НЕ ИСПЫТЫВАЛОСЬ');

        if FSoprot.radiobutton4.Checked then
            wrepl('mvit', ans[2]);
        if FSoprot.radiobutton5.Checked then
            wrepl('mvit', ans[0]);
        if FSoprot.radiobutton6.Checked then
            wrepl('mvit', ans[1]);

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

        wrepl('N35x',Floattostr(simpleroundto((Strtofloat(FRH.Edit4.TExt) + Strtofloat(FRH.Edit5.TExt) + Strtofloat(FRH.Edit6.TExt))/3,-1)));

        // прочие хар-ки
        FrepP.Label1.Caption := 'Прочие характеристики';
        for j                := 1 to 18 do
        begin
            wrepl('Pr' + inttostr(j + 100), NVLToEmp(Fproch.StringGrid1.Cells[j, 1]));
        end;
        for j := 1 to 18 do
        begin
            wrepl('Pz' + inttostr(j + 100), NVLToEmp(Fproch.StringGrid1.Cells[j, 2]));
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

/// //////////////////////////////////////////////////////////////////////////////////////////////
procedure TFMain.BitBtn9Click(Sender: TObject);
var
    buttonSelected: Integer;
    i             : Integer;
begin
    /// ////
    QUpdDvig.Close;
    QUpdDvig.ParamByName('DATA').Asstring   := DateToStr(DateTimePicker1.Date);
    QUpdDvig.ParamByName('TIPDV').Asstring  := ComboBox1.Text;
    QUpdDvig.ParamByName('NOMDV').Asstring  := Edit4.Text;
    QUpdDvig.ParamByName('POLUS').Asstring  := ComboBox2.Text;
    QUpdDvig.ParamByName('fio').Asstring    := ComboBox5.Text;
    QUpdDvig.ParamByName('UNOM').AsInteger  := strtoint(Edit5.Text);
    QUpdDvig.ParamByName('UISP').AsInteger  := strtoint(Edit6.Text);
    QUpdDvig.ParamByName('PNOM').AsFloat    := strtofloat(Edit7.Text);
    QUpdDvig.ParamByName('HUMID').AsFloat   := strtofloat(Edit8.Text);
    QUpdDvig.ParamByName('PRESSUR').AsFloat := strtofloat(Edit9.Text);
    QUpdDvig.ParamByName('ENERGO').Asstring := ComboBox3.Text;
    QUpdDvig.ParamByName('STENDN').Asstring := ComboBox4.Text;
    QUpdDvig.ParamByName('STENDA').Asstring := Label24.Caption;
    QUpdDvig.ParamByName('DOP1').Asstring   := Edit11.Text;
    QUpdDvig.ParamByName('ISPOLN').Asstring := Edit10.Text;
    QUpdDvig.ParamByName('regim').Asstring  := ComboBox6.Text;
    QUpdDvig.ParamByName('READY').AsInteger := 1;
    QUpdDvig.ParamByName('NOMER').Asstring  := Nomer;
    QUpdDvig.ExecSQL;
    /// /////
    // добавляем комбобокс двигателя в базу данных
    // Qtemp.close;
    // Qtemp.SQL.Clear;
    // QTEmp.SQL.Add('delete from ini where ');
    // QTemp.ExecSQL;
    // for i:=0 to ComboBox1.Items.Count-1 do
    // begin
    Qtemp.Close;
    Qtemp.SQL.Clear;
    Qtemp.SQL.Add('insert into ini(name, value, tag) values (');
    Qtemp.SQL.Add(Quotedstr('TIPDVIG') + ', ' + Quotedstr(ComboBox1.Text)
      + ', 0)');
    Qtemp.ExecSQL;
    // end;

    buttonSelected := MessageDlg('Сформировать отчет?', mtCustom,
      [mbYes, mbNo], 0);

    if buttonSelected = mrYes then
    begin
        // ShowMessage('Была нажата Yes');
        FormCurrentReport;
    end;
    enableispyt(false);
end;

procedure TFMain.Button1Click(Sender: TObject);
begin
    OpenDialog1.Filename := M45Exe;
    if OpenDialog1.Execute then
        M45Exe := OpenDialog1.Filename;
end;

procedure TFMain.Button2Click(Sender: TObject);
begin
    Timer500.Enabled := not Timer500.Enabled;
    Label1.Visible   := not Label1.Visible;
    Label2.Visible   := not Label2.Visible;
    Label3.Visible   := not Label3.Visible;
end;

procedure TFMain.Button3Click(Sender: TObject);
begin
    KRTCPConnector1.Interval    := strtoint(Edit14.Text);
    KRTCPConnector1.ReadTimeout := strtoint(Edit15.Text);
    BitBtn10.Click;
end;

procedure TFMain.Button4Click(Sender: TObject);
begin
    FGRAPH.ShowModal;
end;

procedure TFMain.CheckBox1Click(Sender: TObject);
begin
    GroupBox5.Visible := CheckBox1.Checked;
end;

procedure TFMain.ComboBox4Change(Sender: TObject);
begin
    QAttestat.ParamByName('name').Asstring := ComboBox4.Text;
    QAttestat.Open;
    Label24.Caption := QAttestat.FieldByName('attest').Asstring;
    QAttestat.Close;
end;

procedure TFMain.Commandstart(c: Integer; n: string);
var
    dectype: Integer;
begin
    {
      #define SIMULATOR_DECODER             4
      #define USB_DECODER_T45               10
    }
    dectype                                    := 10;
    QCommand.ParamByName('nomer').Asstring     := n;
    QCommand.ParamByName('filename').Asstring  := 'fn';
    QCommand.ParamByName('comand').AsInteger   := c;
    QCommand.ParamByName('dat').AsInteger      := dectype;
    QCommand.ParamByName('interval').AsInteger := 50;
    QCommand.ExecSQL;
end;

procedure TFMain.Edit13Change(Sender: TObject);
begin
    StatusBar1.Panels[3].Text := Edit13.Text;
end;

Procedure TFMain.ReadIni;
var
    Ini : Tinifile;
    l, t: Integer;
begin
    Ini := Tinifile.Create(Extractfilepath(paramstr(0)) + 'settings.ini');
    Edit1.Text := Ini.ReadString('ELSPEC', 'IP', '169.254.249.247');
    Edit2.Text  := Ini.ReadString('ELSPEC', 'PORT', '502');
    Edit3.Text  := Ini.ReadString('ELSPEC', 'ID', '159');
    USR         := Ini.ReadInteger('ELSPEC', 'Usr', 3529);
    ISR         := Ini.ReadInteger('ELSPEC', 'Isr', 3531);
    PSR         := Ini.ReadInteger('ELSPEC', 'Psr', 3439);
    U12         := Ini.ReadInteger('ELSPEC', 'U12', 3511);
    U23         := Ini.ReadInteger('ELSPEC', 'U23', 3513);
    U31         := Ini.ReadInteger('ELSPEC', 'U31', 3515);
    I1          := Ini.ReadInteger('ELSPEC', 'I1', 3521);
    I2          := Ini.ReadInteger('ELSPEC', 'I2', 3523);
    I3          := Ini.ReadInteger('ELSPEC', 'I3', 3525);
    P1          := Ini.ReadInteger('ELSPEC', 'P1', 3427);
    P2          := Ini.ReadInteger('ELSPEC', 'P2', 3429);
    P3          := Ini.ReadInteger('ELSPEC', 'P3', 3431);
    Edit14.Text := Ini.ReadString('ELSPEC', 'Interval', '50');
    Edit15.Text := Ini.ReadString('ELSPEC', 'Timeout', '50');
    Edit12.Text := Ini.ReadString('M45', 'Interval', '50');
    M45Exe      := Ini.ReadString('DATCHIK', 'EXENAME',
      'Укажите файл сбора показаний');
    M45Path    := Extractfilepath(M45Exe);
    l          := Ini.ReadInteger('Position', 'Left', 100);
    t          := Ini.ReadInteger('Position', 'Top', 100);
    FMain.Left := l;
    FMain.Top  := t;
    Ini.Free;

end;

procedure TFMain.Timer500Timer(Sender: TObject);
begin
    Qm45Getsred.Open;
    Label2.Caption := Qm45Getsred.FieldByName('torq').Asstring;
    Label1.Caption := Qm45Getsred.FieldByName('rot').Asstring;
    Label3.Caption := Qm45Getsred.FieldByName('power').Asstring;
    Qm45Getsred.Close;
end;

procedure TFMain.UsredError(Sender: TObject; Variable: TKRVariable);
begin
    Label8.Caption := inttostr(strtoint(Label8.Caption) + 1);
end;

Procedure TFMain.WriteIni;
var
    Ini: Tinifile;
begin
    Ini := Tinifile.Create(Extractfilepath(paramstr(0)) + 'settings.ini');
    Ini.WriteString('DATCHIK', 'EXENAME', M45Exe);
    Ini.WriteInteger('Position', 'Left', FMain.Left);
    Ini.WriteInteger('Position', 'Top', FMain.Top);
    Ini.WriteString('ELSPEC', 'IP', Edit1.Text);
    Ini.WriteString('ELSPEC', 'PORT', Edit2.Text);
    Ini.WriteString('ELSPEC', 'ID', Edit3.Text);
    // REGISTERS
    Ini.WriteInteger('ELSPEC', 'Usr', USR);
    Ini.WriteInteger('ELSPEC', 'Isr', ISR);
    Ini.WriteInteger('ELSPEC', 'Psr', PSR);
    Ini.WriteInteger('ELSPEC', 'U12', U12);
    Ini.WriteInteger('ELSPEC', 'U23', U23);
    Ini.WriteInteger('ELSPEC', 'U31', U31);
    Ini.WriteInteger('ELSPEC', 'I1', I1);
    Ini.WriteInteger('ELSPEC', 'I2', I2);
    Ini.WriteInteger('ELSPEC', 'I3', I3);
    Ini.WriteInteger('ELSPEC', 'P1', P1);
    Ini.WriteInteger('ELSPEC', 'P2', P2);
    Ini.WriteInteger('ELSPEC', 'P3', P3);
    Ini.WriteString('ELSPEC', 'Interval', Edit14.Text);
    Ini.WriteString('ELSPEC', 'Timeout', Edit15.Text);
    Ini.WriteString('M45', 'Interval', Edit12.Text);
    Ini.Free;

end;

procedure TFMain.BitBtn10Click(Sender: TObject);
begin
    Activated                                    := false;
    KRTimer1.Enabled                             := false;
    KRModbusClient1.Active                       := false;
    KRModbusMaster1.Active                       := false;
    KRTCPConnector1.Active                       := false;
    KRTCPConnector1.IP                           := Edit1.Text;
    KRTCPConnector1.Port                         := strtoint(Edit2.Text);
    KRModbusClient1.Addres                       := strtoint(Edit3.Text);
    KRTCPConnector1.Interval                     := strtoint(Edit14.Text);
    KRTCPConnector1.ReadTimeout                  := strtoint(Edit15.Text);
    KRTCPConnector1.Active                       := True;
    KRModbusMaster1.Connector.OnConnectionStatus :=
      KRTCPConnector1ConnectionStatus;
    KRModbusMaster1.Connector.Active := True;
    KRModbusMaster1.Active           := True;
    KRModbusClient1.Active           := True;
    KRTimer1.Enabled                 := True;
    Activated                        := True;
end;

procedure TFMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
    i: Integer;
begin
    Qinserr.ParamByName('num').AsInteger := strtoint(Label8.Caption);
    Qinserr.ExecSQL;
    KRTimer1.Enabled                 := false;
    KRModbusClient1.Active           := false;
    KRModbusMaster1.Active           := false;
    KRModbusMaster1.Connector.Active := false;
    PostMessage(FindWindow(nil, 'Сбор показаний Т45'), WM_QUIT, 0, 0);
    {
      Qtemp.Close;
      Qtemp.sql.clear;
      Qtemp.sql.Add('delete from ini where name=' + Quotedstr('TIPDVIG'));
      Qtemp.ExecSQL;
      for i := 0 to ComboBox1.Items.Count - 1 do
      begin
      Qtemp.Close;
      Qtemp.sql.clear;
      Qtemp.sql.Add('insert into ini(name, value, tag) values (');
      Qtemp.sql.Add(Quotedstr('TIPDVIG') + ', ' + Quotedstr(ComboBox1.Items[i]
      ) + ', 0)');
      Qtemp.ExecSQL;
      end;
    }
    savecombo;
    savegrids;
    WriteIni;
end;

procedure TFMain.FormCreate(Sender: TObject);
var
    i: Integer;
begin
    ReadIni;
    ReportPath := Extractfilepath(Application.ExeName) + 'REPORT\';
    CreateDirEx(ReportPath);
    SettPAth := Extractfilepath(paramstr(0)) + 'SETTINGS\';
    CreateDirEx(SettPAth);
    DateTimePicker1.Date := Date;
    Qtemp.SQL.Add('update version set maintotal=maintotal+1');
    Qtemp.ExecSQL;
    Qtemp.SQL.Clear;
    Qtemp.Open('select * from version');
    StatusBar1.Panels[0].Text := Qtemp.FieldByName('maintotal').Asstring;
    restorecombo;
    restoregrids;
    BitBtn10.Click();
    ReadM45 := false;
    enableispyt(false);
    ShellExecute(Handle, 'open', PWideChar(M45Exe), nil, nil, SW_SHOWNORMAL);
    // типы двигателей из базы
    Qtemp.Close;
    Qtemp.SQL.Clear;
    Qtemp.SQL.Add
      ('select distinct("VALUE") from ini where name= ''TIPDVIG'' order by value');
    Qtemp.Open;
    while not Qtemp.Eof do
    begin
        ComboBox1.Items.Add(Qtemp.FieldByName('value').Asstring);
        Qtemp.Next;
    end;
    // loaddelta;
end;

procedure TFMain.IsredError(Sender: TObject; Variable: TKRVariable);
begin
    Label8.Caption := inttostr(strtoint(Label8.Caption) + 1);
end;

procedure TFMain.KRTCPConnector1ConnectionStatus(Sender: TObject;
  AStat: TKRConnectorStat; AReconnectTime: Cardinal);
begin
    KRModbusClient1.updateAllWaitingVariabels;
end;

procedure TFMain.KRTimer1Timer(Sender: TObject);
begin
    if KRTCPConnector1.Stat = cstConnected then
    begin
        StatusBar1.Panels[1].Text := 'СОЕДИНЕН';
        StatusBar1.Panels[2].Text := KRTCPConnector1.IP + ':' +
          inttostr(KRTCPConnector1.Port) + '@' +
          inttostr(KRModbusClient1.Addres);
        Edit1.Color      := clGreen;
        Edit1.Font.Color := clWhite;
        Edit2.Color      := clGreen;
        Edit2.Font.Color := clWhite;
        Edit3.Color      := clGreen;
        Edit3.Font.Color := clWhite;
    end
    else
    begin
        StatusBar1.Panels[1].Text := 'НЕТ СОЕДИНЕНИЯ';
        StatusBar1.Panels[2].Text := KRTCPConnector1.IP + ':' +
          inttostr(KRTCPConnector1.Port) + '@' +
          inttostr(KRModbusClient1.Addres);
        Edit1.Color      := clRed;
        Edit1.Font.Color := clWhite;
        Edit2.Color      := clRed;
        Edit2.Font.Color := clWhite;
        Edit3.Color      := clRed;
        Edit3.Font.Color := clWhite;
    end;
end;

procedure TFMain.PsredError(Sender: TObject; Variable: TKRVariable);
begin
    Label8.Caption := inttostr(strtoint(Label8.Caption) + 1);
end;

end.
