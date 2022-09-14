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
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, KRTimer,
    KRVarLabel, KRComponentCollection, KRVariables, KRModbusClient,
    KRModbusMaster, KRConnector, KRTCPConnector, inifiles, ustr, Vcl.ComCtrls,
    FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
    FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
    FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
    FireDAC.Phys.Oracle, FireDAC.Phys.OracleDef, FireDAC.Stan.Param,
    FireDAC.DatS, ShellApi, ComObj,
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
        Label7: TLabel;
        Label8: TLabel;
        Label9: TLabel;
        Label33: TLabel;
        Label34: TLabel;
        Edit14: TEdit;
        Edit15: TEdit;
        Button3: TButton;
        BitBtn15: TBitBtn;
        Label35: TLabel;
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

        procedure FormCurrentReport;
        procedure LoadIspyt(Nomer: String);
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

implementation

{$R *.dfm}

uses UHH, USoprot, UProdol, UKZam, UNagrev, URH, UMehan, UArc, UDatchik, Uproch,
    UMH;

procedure TFMain.enableispyt(p: Boolean);
begin
    BitBtn3.Enabled  := p;
    BitBtn1.Enabled  := p;
    BitBtn5.Enabled  := p;
    BitBtn4.Enabled  := p;
    BitBtn2.Enabled  := p;
    BitBtn6.Enabled  := p;
    BitBtn11.Enabled := p;
    // BitBtn12.Enabled := p;
end;

procedure TFMain.savecombo;
var
    i: Integer;
begin
    for i := 0 to FMain.ComponentCount - 1 do
    begin
        if Components[i] is TComboBox then
        begin
            if TComboBox(Components[i]).Tag <> 500 then
                TComboBox(Components[i]).Items.savetofile
                  (Extractfilepath(paramstr(0)) + '\' + TComboBox(Components[i])
                  .name + '.txt');
        end;
    end;
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
                TComboBox(Components[i]).Items.loadfromfile
                  (Extractfilepath(paramstr(0)) + '\' + TComboBox(Components[i])
                  .name + '.txt');
        end;
    end;
    ComboBox4.Items.Clear;
    Qtemp.Close;
    Qtemp.Open('select Name from stend');
    while not Qtemp.eof do
    begin
        ComboBox4.Items.Add(Qtemp.FieldByName('name').Asstring);
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

procedure TFMain.BitBtn13Click(Sender: TObject);
begin
    FArc.BitBtn3.Click();
    FArc.ShowModal;
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
            QInsertNewDvig.ParamByName('PNOM').AsInteger :=
              strtoint(Edit7.Text);
            QInsertNewDvig.ParamByName('HUMID').AsFloat :=
              Strtofloat(Edit8.Text);
            QInsertNewDvig.ParamByName('PRESSUR').AsFloat :=
              Strtofloat(Edit9.Text);
            QInsertNewDvig.ParamByName('ENERGO').Asstring := ComboBox3.Text;
            QInsertNewDvig.ParamByName('STENDN').Asstring := ComboBox4.Text;
            QInsertNewDvig.ParamByName('STENDA').Asstring := Label24.Caption;
            QInsertNewDvig.ParamByName('DOP1').Asstring   := Edit11.Text;
            QInsertNewDvig.ParamByName('ISPOLN').Asstring := Edit10.Text;
            QInsertNewDvig.ParamByName('READY').AsInteger := 0;
            QInsertNewDvig.ParamByName('NOMER').Asstring  := Nomer;
            QInsertNewDvig.ExecSQL;
            Label28.Caption := '';
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
begin
    b := i = 1;
end;

procedure TFMain.LoadIspyt(Nomer: String);
var
    tip: Integer;
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
    FSoprot.Edit8.Text      := Qtemp.FieldByName('TEMPER').Asstring;
    FSoprot.ComboBox7.Text  := Qtemp.FieldByName('PHAS').Asstring;
    FSoprot.ComboBox8.Text  := Qtemp.FieldByName('SOED').Asstring;
    FSoprot.ComboBox9.Text  := Qtemp.FieldByName('SOPRED').Asstring;
    FSoprot.ComboBox10.Text := Qtemp.FieldByName('IZOLED').Asstring;
    FSoprot.Edit13.Text     := Qtemp.FieldByName('IZOLKORP').Asstring;
    FSoprot.Edit16.Text     := Qtemp.FieldByName('IZOLOBMOT').Asstring;

    FSoprot.StringGrid3.Cells[1, 1] := Qtemp.FieldByName('IZM1U1U2').Asstring;
    FSoprot.StringGrid3.Cells[1, 2] := Qtemp.FieldByName('IZM2U1U2').Asstring;
    FSoprot.StringGrid3.Cells[1, 3] := Qtemp.FieldByName('IZM3U1U2').Asstring;
    FSoprot.StringGrid3.Cells[2, 1] := Qtemp.FieldByName('IZM1V1V2').Asstring;
    FSoprot.StringGrid3.Cells[2, 2] := Qtemp.FieldByName('IZM2V1V2').Asstring;
    FSoprot.StringGrid3.Cells[2, 3] := Qtemp.FieldByName('IZM3V1V2').Asstring;
    FSoprot.StringGrid3.Cells[3, 1] := Qtemp.FieldByName('IZM1W1W2').Asstring;
    FSoprot.StringGrid3.Cells[3, 2] := Qtemp.FieldByName('IZM2W1W2').Asstring;
    FSoprot.StringGrid3.Cells[3, 3] := Qtemp.FieldByName('IZM3W1W2').Asstring;

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
                Fhhod.RadioButton1.Checked := True;
            end;
        2:
            begin
                Fhhod.Radiobutton2Click(Fhhod);
                Fhhod.RadioButton2.Checked := True;
            end;
        3:
            begin
                Fhhod.Radiobutton3Click(Fhhod);
                Fhhod.RadioButton3.Checked := True;
            end;
    end;
    tip := 1;
    while not(Qtemp.eof) do
    begin
        Fhhod.Stringgrid2.Cells[1, tip] := Qtemp.FieldByName('usred').Asstring;
        Fhhod.Stringgrid2.Cells[2, tip] := Qtemp.FieldByName('isred').Asstring;
        Fhhod.Stringgrid2.Cells[3, tip] := Qtemp.FieldByName('psred').Asstring;
        Fhhod.Stringgrid2.Cells[4, tip] := Qtemp.FieldByName('dumax').Asstring;
        Qtemp.Next;
        tip := tip + 1;
    end;

    /// ////////////////////////////////////////////////////////////
    // загрузить Рабочую характеристику если есть
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
                Frh.Radiobutton1Click(Fhhod);
                Frh.RadioButton1.Checked := True;
            end;
        2:
            begin
                Frh.Radiobutton2Click(Fhhod);
                Frh.RadioButton2.Checked := True;
            end;
        3:
            begin
                Frh.Radiobutton3Click(Fhhod);
                Frh.RadioButton3.Checked := True;
            end;
    end;
    tip := 1;
    while not(Qtemp.eof) do
    begin
        Frh.Stringgrid2.Cells[1, tip] := Qtemp.FieldByName('usred').Asstring;
        Frh.Stringgrid2.Cells[2, tip] := Qtemp.FieldByName('isred').Asstring;
        Frh.Stringgrid2.Cells[3, tip] := Qtemp.FieldByName('psred').Asstring;
        Frh.Stringgrid2.Cells[4, tip] := Qtemp.FieldByName('dumax').Asstring;
        Frh.Stringgrid2.Cells[5, tip] := Qtemp.FieldByName('usred').Asstring;
        Frh.Stringgrid2.Cells[6, tip] := Qtemp.FieldByName('isred').Asstring;
        Frh.Stringgrid2.Cells[7, tip] := Qtemp.FieldByName('psred').Asstring;
        Frh.Stringgrid2.Cells[8, tip] := Qtemp.FieldByName('dumax').Asstring;
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
    FKZam.StringGrid1.rowCount := 10;
    while not(Qtemp.eof) do
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
    while not(Qtemp.eof) do
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
    while not(Qtemp.eof) do
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
    Fproch.Edit1.Text        := Qtemp.FieldByName('eprochu').Asstring;
    Fproch.Edit2.Text        := Qtemp.FieldByName('massa').Asstring;
    Fproch.CheckBox1.Checked := b(Qtemp.FieldByName('eproch').AsInteger);
    Fproch.CheckBox2.Checked := b(Qtemp.FieldByName('hifreq').AsInteger);
    Fproch.CheckBox3.Checked := b(Qtemp.FieldByName('peregruz').AsInteger);
    Fproch.CheckBox4.Checked := b(Qtemp.FieldByName('rizol').AsInteger);
    Fproch.CheckBox5.Checked := b(Qtemp.FieldByName('u074').AsInteger);
    Fproch.CheckBox6.Checked := b(Qtemp.FieldByName('u113').AsInteger);
    Qtemp.Close;
    Qtemp.SQL.Clear;
    Qtemp.Open('select * from zvibro where nomer=' + Quotedstr(Nomer));
    while not(Qtemp.eof) do
    begin
        Fproch.StringGrid1.Cells[Qtemp.FieldByName('y').AsInteger,
          Qtemp.FieldByName('x').AsInteger] := Qtemp.FieldByName('val')
          .Asstring;
        Qtemp.Next;
    end;
    Qtemp.Close;
    Qtemp.SQL.Clear;
    Qtemp.Open('select * from zzvuk where nomer=' + Quotedstr(Nomer));
    while not(Qtemp.eof) do
    begin
        Fproch.Stringgrid2.Cells[Qtemp.FieldByName('y').AsInteger,
          Qtemp.FieldByName('x').AsInteger] := Qtemp.FieldByName('val')
          .Asstring;
        Qtemp.Next;
    end;

    /// ////////////////////////////////////////////////////////////
    // загрузить нагрев

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
    Blank:string;
begin
    Blank:=Extractfilepath(ParamStr(0))+'REPORT\BLANK.docx';
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
    // FormReport.Show;
    try
        WordApp.Visible := false;
        WordApp.Documents.Open(Blank);
        // холостой ход
        for i := 1 to 10 do
        begin
            SearchString  := 'u' + inttostr(i) + 'hh';
            ReplaceString := FHHod.Stringgrid2.Cells[1, i];
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
        for i := 1 to 10 do
        begin
            SearchString  := 'i' + inttostr(i) + 'hh';
            ReplaceString := FHHod.Stringgrid2.Cells[2, i];
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
        for i := 1 to 10 do
        begin
            SearchString  := 'p' + inttostr(i) + 'hh';
            ReplaceString := FHHod.Stringgrid2.Cells[3, i];
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
        // рабочая характеристика i p rot torq
        i := 1;
        //while FRH.StringGrid2.Cells[0, i] <> '' do
        for i := 1 to 10 do
        begin
            SearchString  := 'i' + inttostr(i) + 'rh';
            ReplaceString := FRH.StringGrid2.Cells[2, i];
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
            //i := i + 1;
        end;
        i := 1;
        for i := 1 to 10 do
        //while FRH.StringGrid2.Cells[0, i] <> '' do
        begin
            SearchString  := 'p' + inttostr(i) + 'rh';
            ReplaceString := FRH.StringGrid2.Cells[6, i];
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
            //i := i + 1;
        end;
        i := 1;
        for i := 1 to 10 do
        //while FRH.StringGrid2.Cells[0, i] <> '' do
        begin
            SearchString  := 'rot' + inttostr(i) + 'rh';
            ReplaceString := FRH.StringGrid2.Cells[4, i];
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
            //i := i + 1;
        end;
        i := 1;
        for i := 1 to 10 do
        //while FRH.StringGrid2.Cells[0, i] <> '' do
        begin
            SearchString  := 'torq' + inttostr(i) + 'rh';
            ReplaceString := FRH.StringGrid2.Cells[5, i];
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
            //i := i + 1;
        end;
        // рабочая характеристика


        // сохранение документа
        WordApp.ActiveDocument.SaveAs(ReportPath + '\' + Edit5.Text + '.docx');
        WordApp.ActiveDocument.Close(wdDoNotSaveChanges);
    finally
        WordApp.Quit;
        WordApp := Unassigned;
    end;
    // FormReport.Close;
    ShowMessage('Отчет сформирован!');
end;

/// //////////////////////////////////////////////////////////////////////////////////////////////
procedure TFMain.BitBtn9Click(Sender: TObject);
var
    buttonSelected: Integer;
begin
    buttonSelected := MessageDlg('Сформировать отчет?', mtCustom,
      [mbYes, mbNo], 0);

    if buttonSelected = mrYes then
    begin
        ShowMessage('Была нажата Yes');
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
      #define USB_DECODER_T35               6
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
    Ini.WriteString('M45', 'Interval', Edit12.Text);
    Ini.Free;

end;

procedure TFMain.BitBtn10Click(Sender: TObject);
begin
    Activated                                    := false;
    KRTimer1.Enabled                             := false;
    KRModbusClient1.Active                       := false;
    KRModbusMaster1.Active                       := false;
    KRTCPConnector1.IP                           := Edit1.Text;
    KRTCPConnector1.Port                         := strtoint(Edit2.Text);
    KRModbusClient1.Addres                       := strtoint(Edit3.Text);
    KRModbusMaster1.Connector.OnConnectionStatus :=
      KRTCPConnector1ConnectionStatus;
    KRModbusMaster1.Connector.Active := True;
    KRModbusMaster1.Active           := True;
    KRModbusClient1.Active           := True;
    KRTimer1.Enabled                 := True;
    Activated                        := True;
end;

procedure TFMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
    KRTimer1.Enabled                 := false;
    KRModbusClient1.Active           := false;
    KRModbusMaster1.Active           := false;
    KRModbusMaster1.Connector.Active := false;
    PostMessage(FindWindow(nil, 'Сбор показаний датчика M45'), WM_QUIT, 0, 0);
    savecombo;
    savegrids;
    WriteIni;
end;

procedure TFMain.FormCreate(Sender: TObject);
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
