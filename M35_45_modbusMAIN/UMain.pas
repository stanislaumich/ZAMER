unit UMain;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Menus,
    Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, FireDAC.Stan.Intf,
    FireDAC.Stan.Option,
    FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
    FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
    Data.DB, FireDAC.Comp.Client, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
    FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Stan.Param,
    FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, ustr,
    inifiles, ShellApi,
    Vcl.DBGrids, ComObj, KRField, KRComponentCollection, KRVariables,
    KRModbusClient, KRModbusMaster, KRConnector, KRTCPConnector, KRVarLabel,
    KRTimer, FireDAC.Phys.Oracle, FireDAC.Phys.OracleDef;

type
    TForm1 = class(TForm)
        Panel1: TPanel;
        PageControl1: TPageControl;
        StatusBar1: TStatusBar;
        TabSheet2: TTabSheet;
        TabSheet3: TTabSheet;
        TabSheet4: TTabSheet;
        TabSheet5: TTabSheet;
        TabSheet6: TTabSheet;
        GroupBox6: TGroupBox;
        GroupBox7: TGroupBox;
        Label8: TLabel;
        Label9: TLabel;
        Edit2: TEdit;
        Label10: TLabel;
        Edit3: TEdit;
        StringGrid1: TStringGrid;
        Label12: TLabel;
        Label13: TLabel;
        StringGrid2: TStringGrid;
        Label14: TLabel;
        TabSheet7: TTabSheet;
        OpenDialog1: TOpenDialog;
        SaveDialog1: TSaveDialog;
        Timer500: TTimer;
        Label20: TLabel;
        CheckBox2: TCheckBox;
        RadioButton5: TRadioButton;
        RadioButton6: TRadioButton;
        RadioButton7: TRadioButton;
        BitBtn12: TBitBtn;
        BitBtn13: TBitBtn;
        BitBtn11: TBitBtn;
        BitBtn14: TBitBtn;
        BitBtn15: TBitBtn;
        GroupBox19: TGroupBox;
        Label63: TLabel;
        Label64: TLabel;
        Label65: TLabel;
        Label66: TLabel;
        Label67: TLabel;
        Edit4: TEdit;
        Edit6: TEdit;
        StringGrid5: TStringGrid;
        RadioButton8: TRadioButton;
        RadioButton9: TRadioButton;
        RadioButton10: TRadioButton;
        BitBtn16: TBitBtn;
        BitBtn17: TBitBtn;
        Label68: TLabel;
        Edit7: TEdit;
        Label51: TLabel;
        GroupBox2: TGroupBox;
        Label29: TLabel;
        Label30: TLabel;
        StringGrid6: TStringGrid;
        CheckBox3: TCheckBox;
        BitBtn2: TBitBtn;
        BitBtn3: TBitBtn;
        BitBtn4: TBitBtn;
        Label31: TLabel;
        Label32: TLabel;
        BitBtn18: TBitBtn;
        BitBtn19: TBitBtn;
        Label52: TLabel;
        FDQCurrIspyt: TFDQuery;
        Panel2: TPanel;
        GroupBox1: TGroupBox;
        Label1: TLabel;
        Label2: TLabel;
        Label3: TLabel;
        Label4: TLabel;
        Label5: TLabel;
        Label6: TLabel;
        Label7: TLabel;
        ComboBox1: TComboBox;
        ComboBox2: TComboBox;
        ComboBox3: TComboBox;
        ComboBox4: TComboBox;
        ComboBox5: TComboBox;
        Edit1: TEdit;
        DateTimePicker1: TDateTimePicker;
        Button1: TButton;
        KRTimer1: TKRTimer;
        KRTCPConnector1: TKRTCPConnector;
        KRModbusMaster1: TKRModbusMaster;
        KRModbusClient1: TKRModbusClient;
        Usred: TKRMBRegister;
        Isred: TKRMBRegister;
        Psred: TKRMBRegister;
        KRMBRegister12: TKRMBRegister;
        KRMBRegister23: TKRMBRegister;
        KRMBRegister31: TKRMBRegister;
        KRMBRegisterI3: TKRMBRegister;
        TabSheet1: TTabSheet;
        Timer1000: TTimer;
        ProgressBar1: TProgressBar;
        Timer50: TTimer;
        KRVarLabel5: TKRVarLabel;
        KRVarLabel6: TKRVarLabel;
        KRVarLabel7: TKRVarLabel;
        KRVarLabel8: TKRVarLabel;
        KRVarLabel9: TKRVarLabel;
        Label11: TLabel;
        KRMBRegisterI1: TKRMBRegister;
        KRMBRegisterI2: TKRMBRegister;
        KRMBRegisterP1: TKRMBRegister;
        KRMBRegisterP2: TKRMBRegister;
        KRMBRegisterP3: TKRMBRegister;
        Label15: TLabel;
        KRVarLabel4: TKRVarLabel;
        KRVarLabel10: TKRVarLabel;
        Label50: TLabel;
        Label54: TLabel;
        KRVarLabel11: TKRVarLabel;
        Query2: TFDQuery;
        Query3: TFDQuery;
        Query4: TFDQuery;
        FDCOra: TFDConnection;
        GroupBox8: TGroupBox;
        Label19: TLabel;
        Edit9: TEdit;
        Button5: TButton;
        GroupBox9: TGroupBox;
        RadioButton1: TRadioButton;
        RadioButton4: TRadioButton;
        GroupBox10: TGroupBox;
        Label21: TLabel;
        Label22: TLabel;
        Label23: TLabel;
        Edit10: TEdit;
        Edit11: TEdit;
        Edit12: TEdit;
        CheckBox1: TCheckBox;
        Button2: TButton;
        GroupBox5: TGroupBox;
        Label16: TLabel;
        Label17: TLabel;
        Label18: TLabel;
        Label57: TLabel;
        Label60: TLabel;
        Label58: TLabel;
        Label61: TLabel;
        Label59: TLabel;
        Label62: TLabel;
        KRVarLabel1: TKRVarLabel;
        KRVarLabel2: TKRVarLabel;
        KRVarLabel3: TKRVarLabel;
        Querystart: TFDQuery;
        Label24: TLabel;
        Label33: TLabel;
        Edit5: TEdit;
        FDQCurrIspyt1: TFDQuery;
        QCommand: TFDQuery;
        Label34: TLabel;
        Label35: TLabel;
        Label36: TLabel;
        GroupBox3: TGroupBox;
        GroupBox4: TGroupBox;
        BitBtn1: TBitBtn;
        StringGrid3: TStringGrid;
        Label37: TLabel;
        Label38: TLabel;
        Label39: TLabel;
        Label40: TLabel;
        Edit8: TEdit;
        ComboBox7: TComboBox;
        ComboBox8: TComboBox;
        ComboBox9: TComboBox;
        ComboBox10: TComboBox;
        Edit13: TEdit;
        Edit16: TEdit;
        BitBtn5: TBitBtn;
        GroupBox12: TGroupBox;
        Label41: TLabel;
        Label42: TLabel;
        Label43: TLabel;
        Label44: TLabel;
        Label45: TLabel;
        ComboBox11: TComboBox;
        ComboBox12: TComboBox;
        Edit17: TEdit;
        Edit18: TEdit;
        Label46: TLabel;
        GroupBox13: TGroupBox;
        GridStend: TDBGrid;
        DataStend: TDataSource;
        TableStend: TFDTable;
        BitBtn20: TBitBtn;
        GroupBox14: TGroupBox;
        GroupBox15: TGroupBox;
        StringGrid4: TStringGrid;
        Button3: TButton;
        Button4: TButton;
        Button6: TButton;
        Button7: TButton;
        Button8: TButton;
        Button9: TButton;
        Button10: TButton;
        Button11: TButton;
        Button12: TButton;
        Button13: TButton;
        Button14: TButton;
        Button15: TButton;
        Button16: TButton;
        Button17: TButton;
        Button18: TButton;
        Button19: TButton;
        Label47: TLabel;
        Edit19: TEdit;
        Label48: TLabel;
        Label49: TLabel;
        GroupBox16: TGroupBox;
        Label53: TLabel;
        Button20: TButton;
        Button21: TButton;
        Button22: TButton;
        Button23: TButton;
        Button24: TButton;
        Button25: TButton;
        Button26: TButton;
        QAttestat: TFDQuery;
        Label69: TLabel;
        Label70: TLabel;
        Label71: TLabel;
        Label72: TLabel;
        Label76: TLabel;
        KRVarLabel12: TKRVarLabel;
        KRVarLabel13: TKRVarLabel;
        KRVarLabel14: TKRVarLabel;
        QIni: TFDQuery;
        QSoprot: TFDQuery;
        FDQuery1: TFDQuery;
        GroupBox11: TGroupBox;
        GroupBox17: TGroupBox;
        GroupBox18: TGroupBox;
        Label25: TLabel;
        Edit14: TEdit;
        StringGrid7: TStringGrid;
        StringGrid8: TStringGrid;
        Button27: TButton;
        Button28: TButton;
        Button29: TButton;
        Button30: TButton;
        Button31: TButton;
        Button37: TButton;
        Button38: TButton;
        Button39: TButton;
        Button40: TButton;
        Button41: TButton;
        Button32: TButton;
        Button33: TButton;
        Button34: TButton;
        Button35: TButton;
        Button36: TButton;
        Button42: TButton;
        Button43: TButton;
        Button44: TButton;
        Button45: TButton;
        Button46: TButton;
        RadioButton11: TRadioButton;
        RadioButton12: TRadioButton;
        RadioButton13: TRadioButton;
        RadioButton14: TRadioButton;
        RadioButton15: TRadioButton;
        RadioButton16: TRadioButton;
        RadioButton17: TRadioButton;
        RadioButton18: TRadioButton;
        RadioButton19: TRadioButton;
        RadioButton20: TRadioButton;
        Button47: TButton;
        Button48: TButton;
        Button49: TButton;
        Button50: TButton;
        BitBtn6: TBitBtn;
        BitBtn7: TBitBtn;
        BitBtn10: TBitBtn;
        Edit15: TEdit;
        Label26: TLabel;
        QIspytCommon: TFDQuery;
    Qispytcommgetlast: TFDQuery;
    Q: TFDQuery;
    TabSheet8: TTabSheet;
    Label27: TLabel;
    Button51: TButton;
    Label28: TLabel;
    Edit20: TEdit;
    Memo1: TMemo;
        procedure BitBtn2Click(Sender: TObject);
        procedure Button5Click(Sender: TObject);
        procedure FormActivate(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure Button6Click(Sender: TObject);
        procedure N2Click(Sender: TObject);
        procedure ComboAdds;
        procedure Widths(sg: TStringGrid);
        procedure BitBtn9Click(Sender: TObject);
        procedure BitBtn8Click(Sender: TObject);
        procedure Timer500Timer(Sender: TObject);
        procedure Button10Click(Sender: TObject);
        procedure NastrFill();
        procedure RadioButton8Click(Sender: TObject);
        procedure Button1Click(Sender: TObject);
        procedure Button2Click(Sender: TObject);
        procedure Stringgridfill;
        procedure RadioButton5Click(Sender: TObject);
        procedure BitBtn11Click(Sender: TObject);
        procedure RadioButton6Click(Sender: TObject);
        procedure RadioButton7Click(Sender: TObject);
        procedure Button3Click(Sender: TObject);
        procedure StringGrid2Click(Sender: TObject);
        procedure BitBtn12Click(Sender: TObject);
        procedure BitBtn16Click(Sender: TObject);
        procedure BitBtn17Click(Sender: TObject);
        procedure BitBtn14Click(Sender: TObject);
        procedure BitBtn15Click(Sender: TObject);
        procedure RadioButton9Click(Sender: TObject);
        procedure RadioButton10Click(Sender: TObject);
        procedure PageControl1Change(Sender: TObject);
        procedure StringGrid6Click(Sender: TObject);
        procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
          Rect: TRect; State: TGridDrawState);
        procedure BitBtn19Click(Sender: TObject);
        procedure BitBtn13Click(Sender: TObject);
        procedure ComboBox3Change(Sender: TObject);
        procedure KRTCPConnector1ConnectionStatus(Sender: TObject;
          AStat: TKRConnectorStat; AReconnectTime: Cardinal);
        procedure KRTimer1Timer(Sender: TObject);
        procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
        procedure BitBtn20Click(Sender: TObject);
        procedure UsredValUpdated(Sender: TObject; Variable: TKRVariable);
        procedure Timer1000Timer(Sender: TObject);
        procedure Timer50Timer(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure FillBlank(ADocument: string);
        procedure BitBtn18Click(Sender: TObject);
        procedure commandstart(c: Integer; n: string);
        procedure EditAdds;
        Procedure EditIns;

        procedure BitBtn4Click(Sender: TObject);
        procedure BitBtn3Click(Sender: TObject);
        procedure Button11Click(Sender: TObject);
        procedure ComboBox12Change(Sender: TObject);
        procedure SpeedButton1Click(Sender: TObject);
        procedure Button20Click(Sender: TObject);
        procedure Button21Click(Sender: TObject);
        procedure Button22Click(Sender: TObject);
        procedure Button23Click(Sender: TObject);
        procedure Button24Click(Sender: TObject);
        procedure Button25Click(Sender: TObject);
        procedure Button26Click(Sender: TObject);
        procedure BitBtn5Click(Sender: TObject);
        procedure Button47Click(Sender: TObject);
        procedure Button48Click(Sender: TObject);
        procedure Button49Click(Sender: TObject);
        procedure Button50Click(Sender: TObject);
        procedure BitBtn6Click(Sender: TObject);
        procedure BitBtn7Click(Sender: TObject);
    procedure ComboBox9Change(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
        activated, PLCConnected: Boolean;
    end;

    {
      предоставляем имеющуюся информацию:    IP: 169.254.249.247
    }
var
    Form1: TForm1;
    ini  : tinifile;
    // --------------------
    DatchikPath: string;
    DatchikExe : string;
    ArcPath    : string;
    SettPAth   : string;
    BasePath   : string;
    ReportPath : string;
    AnswerPath : string;
    // --------------------
    currentrow : Integer;
    currentvolt: Integer;
    rowtopaint : Integer;
    tipispyt   : Integer;
    c, cnt     : Integer;

    /// ////////////////////////////
    USR, ISR, PSR: Integer;
    U12, U23, U31: Integer;
    I1, I2, I3   : Integer;
    P1, P2, P3   : Integer;
    /// /////////////////////////

    /// /////////////////////////
    a       : array [1 .. 500, 1 .. 12] of real;
    timercnt: Integer;
    //bad:boolean;

    ///
implementation

{$R *.dfm}

uses Unit2, UnitBig, UnitHH, Uformreport, Ugetlast;

procedure strwidth(grid:TStringgrid);
   const
     DEFBORDER = 8;
   var
     max, temp, i, n: Integer;
   begin
     with Grid do
     begin
       Canvas.Font := Font;
       for n := 0 to grid.colcount-1 do
       begin
         max := 0;
         for i := 0 to RowCount - 1 do
         begin
           temp := Canvas.TextWidth(Cells[n, i]) + DEFBORDER;
           if temp > max then
             max := temp;
         end; { For }
         if max > 0 then
           ColWidths[n] := max;
       end; { For }
     end; { With }
   end; {SetGridColumnWidths  }



function RoundMax100(Num: real): real;
begin
    result := round(Num * 100 + 0.5) / 100;
end;

/// //////////////////////////////////////////////////////////////
procedure TForm1.commandstart(c: Integer; n: string);
var
    s      : string;
    dectype: string;
begin
    QCommand.SQL.Clear;
    QCommand.SQL.Add
      ('insert into command (nomer, filename, command,dat, interval)values(');
        {
	 #define USB_DECODER                   0
	 #define MODBUS_DECODER                1
	 #define COMPORT_DECODER               2
	 #define REMOTE_DECODER                3
	   #define SIMULATOR_DECODER             4
	 #define ETHERNET_DECODER_T37          5
	   #define USB_DECODER_T35               6
	 #define MODBUS_DECODER_T36            7
	 #define COMPORT_DECODER_T32           8
	 #define COMPORT_DECODER_T42           9
	   #define USB_DECODER_T45               10
	 #define MODBUS_DECODER_T46            11
	 #define USB_INDICATOR                 15
	 #define COMPORT_INDICATOR             16
	 #define MODBUS_INDICATOR              17
	 #define ETHERNET_INDICATOR            18
	 }
    if (RadioButton1.Checked) then
        dectype := '4';
    if (RadioButton4.Checked) then
        dectype := '10';
    QCommand.SQL.Add(n + ',' + Quotedstr('fn') + ',' + inttostr(c) + ',' +
      dectype + ','+Edit20.Text+' )');
    QCommand.ExecSQL;
end;

/// //////////////////////////////////////////////////////////////
procedure TForm1.Stringgridfill;
var
    s: string;
    i: Integer;
begin
    StringGrid2.Cells[0, 0]  := 'U хх';
    StringGrid2.Cells[1, 0]  := 'U сред';
    StringGrid2.Cells[2, 0]  := 'I сред';
    StringGrid2.Cells[3, 0]  := 'P сред';
    StringGrid6.Cells[0, 0]  := 'Нагр.';
    StringGrid6.Cells[1, 0]  := 'U сред';
    StringGrid6.Cells[2, 0]  := 'I сред';
    StringGrid6.Cells[3, 0]  := 'P сред';
    StringGrid6.Cells[4, 0]  := 'N сред';
    StringGrid6.Cells[5, 0]  := 'M сред';
    StringGrid6.Cells[6, 0]  := 'P сред';
    StringGrid3.Cells[1, 0]  := 'U1-U2 (U-V)/главная';
    StringGrid3.Cells[2, 0]  := 'V1-V2 (V-W)/вспом.';
    StringGrid3.Cells[3, 0]  := 'W1-W2 (W-U)';
    StringGrid3.Cells[0, 1]  := 'Измерение 1';
    StringGrid3.Cells[0, 2]  := 'Измерение 2';
    StringGrid3.Cells[0, 3]  := 'Измерение 3';
    StringGrid3.ColWidths[0] := 100;
    StringGrid3.ColWidths[1] := 165;
    StringGrid3.ColWidths[2] := 160;
    StringGrid3.ColWidths[3] := 110;

end;

/// //////////////////////////////////////////////////////////////
procedure TForm1.NastrFill();
begin

end;

/// //////////////////////////////////////////////////////////////
procedure TForm1.PageControl1Change(Sender: TObject);
begin
    Label51.Caption := PageControl1.ActivePage.Caption;
    case PageControl1.ActivePageIndex of
        0:
            Label51.Font.Color := clGreen;
        1:
            Label51.Font.Color := clRed;
    else
        Label51.Font.Color := clBlack;
    end;
end;

/// //////////////////////////////////////////////////////////////

procedure TForm1.RadioButton9Click(Sender: TObject);
var
    i  : Integer;
    cod: Integer;
begin
    val(ComboBox5.Text, currentvolt, cod);
    if cod = 0 then
    begin
        StringGrid6.RowCount := 2;
        for i                := 1 to StringGrid5.RowCount - 1 do
            if StringGrid5.Cells[2, i] <> '' then
            begin
                StringGrid6.RowCount    := StringGrid6.RowCount + 1;
                StringGrid6.Cells[0, i] :=
                  floattostr
                  (round(currentvolt / 100 * strtoint(StringGrid5.Cells
                  [2, i])));
            end;

        StringGrid6.Cells[0, StringGrid6.RowCount - 1] := '';
        StringGrid6.row                                := 1;
        currentrow                                     := 1;
        Label32.Caption := StringGrid6.Cells[0, 1];
        BitBtn18.Enabled := true;
    end
    else
        ShowMessage
          ('Не удалось получить номинальную мощность двигателя из установок текущего испытания');
end;

procedure TForm1.RadioButton10Click(Sender: TObject);
var
    i  : Integer;
    cod: Integer;
begin
    val(ComboBox5.Text, currentvolt, cod);
    if cod = 0 then
    begin
        StringGrid6.RowCount := 2;
        for i                := 1 to StringGrid5.RowCount - 1 do
            if StringGrid5.Cells[3, i] <> '' then
            begin
                StringGrid6.RowCount    := StringGrid6.RowCount + 1;
                StringGrid6.Cells[0, i] :=
                  floattostr
                  (round(currentvolt / 100 * strtoint(StringGrid5.Cells
                  [3, i])));
            end;

        StringGrid6.Cells[0, StringGrid6.RowCount - 1] := '';
        StringGrid6.row                                := 1;
        currentrow                                     := 1;
        Label32.Caption := StringGrid6.Cells[0, 1];
        BitBtn18.Enabled := true;
    end
    else
        ShowMessage
          ('Не удалось получить номинальную мощность двигателя из установок текущего испытания');
end;

procedure TForm1.RadioButton8Click(Sender: TObject);
var
    i  : Integer;
    cod: Integer;
begin
    val(ComboBox5.Text, currentvolt, cod);
    if cod = 0 then
    begin
        StringGrid6.RowCount := 2;
        for i                := 1 to StringGrid5.RowCount - 1 do
            if StringGrid5.Cells[1, i] <> '' then
            begin
                StringGrid6.RowCount    := StringGrid6.RowCount + 1;
                StringGrid6.Cells[0, i] :=
                  floattostr
                  (round(currentvolt / 100 * strtoint(StringGrid5.Cells
                  [1, i])));
            end;

        StringGrid6.Cells[0, StringGrid6.RowCount - 1] := '';
        StringGrid6.row                                := 1;
        currentrow                                     := 1;
        Label32.Caption := StringGrid6.Cells[0, 1];
        BitBtn18.Enabled := true;
    end
    else
        ShowMessage
          ('Не удалось получить номинальную мощность двигателя из установок текущего испытания');
end;

/// /////////////////////////////////////////////////////////////
procedure TForm1.RadioButton5Click(Sender: TObject);
var
    i  : Integer;
    cod: Integer;
begin
    if StringGrid1.Cells[1, 1] = '' then
    begin
        ShowMessage('Нет данных для испытания');
        exit;
    end;
    val(ComboBox4.Text, currentvolt, cod);
    if cod = 0 then
    begin
        StringGrid2.RowCount := 2;
        for i                := 1 to StringGrid1.RowCount - 1 do
            if StringGrid1.Cells[1, i] <> '' then
            begin
                StringGrid2.RowCount    := StringGrid2.RowCount + 1;
                StringGrid2.Cells[0, i] :=
                  floattostr
                  (round(currentvolt / 100 * strtoint(StringGrid1.Cells
                  [1, i])));
            end;
        StringGrid2.Cells[0, StringGrid2.RowCount - 1] := '';
        StringGrid2.row                                := 1;
        currentrow                                     := 1;
        Label20.Caption := StringGrid2.Cells[0, 1];
        BitBtn19.Enabled := true;
    end
    else
        ShowMessage
          ('Не удалось получить испытательное напряжение двигателя из установок текущего испытания');
end;

/// /////////////////////////////////////////////////////////////
procedure TForm1.RadioButton6Click(Sender: TObject);
var
    i  : Integer;
    cod: Integer;
begin
    if StringGrid1.Cells[2, 1] = '' then
    begin
        ShowMessage('Нет данных для испытания');
        exit;
    end;
    val(ComboBox4.Text, currentvolt, cod);
    if cod = 0 then
    begin
        StringGrid2.RowCount := 2;
        for i                := 1 to StringGrid1.RowCount - 1 do
            if StringGrid1.Cells[2, i] <> '' then
            begin
                StringGrid2.RowCount    := StringGrid2.RowCount + 1;
                StringGrid2.Cells[0, i] :=
                  floattostr
                  (round(currentvolt / 100 * strtoint(StringGrid1.Cells
                  [2, i])));
            end;
        StringGrid2.Cells[0, StringGrid2.RowCount - 1] := '';
        StringGrid2.row                                := 1;
        currentrow                                     := 1;
        Label20.Caption := StringGrid2.Cells[0, 1];
        BitBtn19.Enabled := true;
    end
    else
        ShowMessage
          ('Не удалось получить испытательное напряжение двигателя из установок текущего испытания');
end;

/// //////////////////////////////////////////////////////////////
procedure TForm1.RadioButton7Click(Sender: TObject);
var
    i  : Integer;
    cod: Integer;
begin
    if StringGrid1.Cells[3, 1] = '' then
    begin
        ShowMessage('Нет данных для испытания');
        exit;
    end;
    val(ComboBox4.Text, currentvolt, cod);
    if cod = 0 then
    begin
        StringGrid2.RowCount := 2;
        for i                := 1 to StringGrid1.RowCount - 1 do
            if StringGrid1.Cells[3, i] <> '' then
            begin
                StringGrid2.RowCount    := StringGrid2.RowCount + 1;
                StringGrid2.Cells[0, i] :=
                  floattostr
                  (round(currentvolt / 100 * strtoint(StringGrid1.Cells
                  [3, i])));
            end;
        StringGrid2.Cells[0, StringGrid2.RowCount - 1] := '';
        StringGrid2.row                                := 1;
        currentrow                                     := 1;
        Label20.Caption := StringGrid2.Cells[0, 1];
        BitBtn19.Enabled := true;
    end
    else
        ShowMessage
          ('Не удалось получить испытательное напряжение двигателя из установок текущего испытания');
end;

/// /////////////////////////////////////////////////////////////
procedure TForm1.Widths(sg: TStringGrid);
var
    x, y, w : Integer;
    s       : string;
    MaxWidth: Integer;
begin
    with sg do
        ClientHeight := DefaultRowHeight * RowCount + 5;
    with sg do
    begin
        for x := 0 to ColCount - 1 do
        begin
            MaxWidth := 0;
            for y    := 0 to RowCount - 1 do
            begin
                w := Canvas.TextWidth(Cells[x, y]);
                if w > MaxWidth then
                    MaxWidth := w;
            end;
            ColWidths[x] := MaxWidth + 10;
        end;
    end;
end;

/// //////////////////////////////////////////////////////////////
procedure TForm1.ComboAdds;
var
    i  : Integer;
    tsr: tsearchrec;
begin
    for i := 0 to Form1.ComponentCount - 1 do
    begin
        if Components[i] is TComboBox then
        begin

            if TComboBox(Components[i]).Tag <> 500 then
                if TComboBox(Components[i])
                  .Items.IndexOf(TComboBox(Components[i]).Text) < 0 then
                    TComboBox(Components[i])
                      .Items.Add(TComboBox(Components[i]).Text);
        end;
    end;

end;

procedure TForm1.EditAdds;
var
    i: Integer;
begin
    for i := 0 to Form1.ComponentCount - 1 do
    begin
        if Components[i] is TEdit then
        if TEdit(Components[i]).Tag<>500 then
        begin
            QIni.Close;
            QIni.ParamByName('name').Asstring := TEdit(Components[i]).name;
            QIni.Open;
            TEdit(Components[i]).Text := QIni.FieldByName('Value').Asstring;
        end;
    end;

end;

procedure TForm1.EditIns;
var
    i: Integer;
begin
    QIni.Close;
    QIni.SQL.Text := 'delete from ini where tip=' + Quotedstr('edit');
    QIni.ExecSQL;
    for i := 0 to Form1.ComponentCount - 1 do
    begin
        if Components[i] is TEdit then
        begin
            QIni.Close;
            QIni.SQL.Clear;
            QIni.SQL.Add('insert into ini (name,value,tip,tag) values(');
            QIni.SQL.Add(Quotedstr(TEdit(Components[i]).name) + ',');
            QIni.SQL.Add(Quotedstr(TEdit(Components[i]).Text) + ',');
            QIni.SQL.Add(Quotedstr('edit') + ',');
            QIni.SQL.Add(Quotedstr(TEdit(Components[i]).Hint) + ')');
            QIni.ExecSQL;
        end;
    end;
end;

/// /////////////////////////////////////////////////////////////
procedure TForm1.ComboBox12Change(Sender: TObject);
begin
    QAttestat.ParamByName('name').Asstring := ComboBox12.Text;
    QAttestat.Open;
    Label46.Caption := QAttestat.FieldByName('attest').Asstring;
    QAttestat.Close;
end;

procedure TForm1.ComboBox3Change(Sender: TObject);
begin
    RadioButton8.Checked  := false;
    RadioButton9.Checked  := false;
    RadioButton10.Checked := false;
end;



procedure TForm1.ComboBox9Change(Sender: TObject);
begin

end;

/// //////////////////////////////////////////////////////////////


/// /////////////////////////////////////////////////////////////
procedure TForm1.FillBlank(ADocument: string);
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

/// /////////////////////////////////////////////////////////////
{ Проведение испытаний холостого хода шагом по процентам }
procedure TForm1.BitBtn11Click(Sender: TObject);
var
    i, j : Integer;
    s: string;
    //Ap   : Variant;
begin

    for i := 1 to StringGrid2.RowCount - 2 do
    begin
        s := 'insert into ispyttmphh (nomer, unom,usred,isred,psred,tip) values(';
        s := s + Quotedstr(Edit5.Text) + ',';
        s := s + strreplace(StringGrid2.Cells[0, i], ',', '.') + ',';
        s := s + strreplace(StringGrid2.Cells[1, i], ',', '.') + ',';
        s := s + strreplace(StringGrid2.Cells[2, i], ',', '.') + ',';
        s := s + strreplace(StringGrid2.Cells[3, i], ',', '.') + ',';
        if RadioButton5.Checked then
            s := s + '1)';
        if RadioButton6.Checked then
            s := s + '2)';
        if RadioButton7.Checked then
            s := s + '3)';
        FDQCurrIspyt.SQL.Clear;
        FDQCurrIspyt.SQL.Add(s);
        FDQCurrIspyt.ExecSQL;
    end;

    BitBtn11.Enabled     := false;
    BitBtn12.Enabled     := false;
    BitBtn13.Enabled     := false;
    BitBtn19.Enabled     := true;
    RadioButton5.Checked := false;
    RadioButton6.Checked := false;
    RadioButton7.Checked := false;

    //FillBlank(ReportPath + '\' + 'BLANK.docx');
end;

/// /////////////////////////////////////////////////////////////
procedure TForm1.BitBtn2Click(Sender: TObject);
var
    s1, s2: string;
    i, j  : Integer;
begin
    for i           := 1 to 500 do
        for j       := 1 to 12 do
            a[i, j] := 0;
    if StringGrid6.row = StringGrid6.RowCount - 1 then
        ShowMessage
          ('Испытания завершены, выберите строку для повторного испытания')
    else
    begin
        FDQCurrIspyt.SQL.Clear;
        FDQCurrIspyt.SQL.Add('delete from elspectmprh where unom=' +
          StringGrid6.Cells[0, StringGrid6.row]);
        FDQCurrIspyt.ExecSQL;

        s1                    := StringGrid6.Cells[4, currentrow];
        s2                    := Edit3.Text;
        c                     := 0;
        timercnt              := 0;
        cnt                   := 0;
        Label11.Caption       := 'Запущено испытание рабочей характеристики';
        c                     := 0;
        cnt                   := 0;
        ProgressBar1.Position := 0;
        commandstart(1, Edit5.Text);
        Timer50.Enabled              := true;
        Timer1000.Enabled            := true;
        PageControl1.ActivePageIndex := 6;
        tipispyt                     := 1; // рабочая характеристика
    end;
end;

/// /////////////////////////////////////////////////////////////
procedure TForm1.BitBtn3Click(Sender: TObject);
var
    i, j: Integer;
begin
    for i                           := 1 to StringGrid6.ColCount - 1 do
        for j                       := 1 to StringGrid6.RowCount - 1 do
            StringGrid6.Cells[i, j] := '';
    StringGrid6.row                 := 1;
    BitBtn2.Enabled                 := false;
    BitBtn3.Enabled                 := false;
    BitBtn4.Enabled                 := false;
    BitBtn18.Enabled                := true;
    RadioButton8.Checked            := false;
    RadioButton9.Checked            := false;
    RadioButton10.Checked           := false;
end;

/// /////////////////////////////////////////////////////////////
procedure TForm1.BitBtn4Click(Sender: TObject);
var
 i:integer;
 s:string;
begin

    for i := 1 to StringGrid6.RowCount - 2 do
    begin
        s := 'insert into ispyttmprh (nomer, unom,usred,isred,psred,tip,torq,rot,power) values(';
        s := s + Quotedstr(Edit5.Text) + ',';
        s := s + strreplace(StringGrid6.Cells[0, i], ',', '.') + ',';
        s := s + strreplace(StringGrid6.Cells[1, i], ',', '.') + ',';
        s := s + strreplace(StringGrid6.Cells[2, i], ',', '.') + ',';
        s := s + strreplace(StringGrid6.Cells[3, i], ',', '.') + ',';
        if RadioButton8.Checked then
            s := s + '1,';
        if RadioButton9.Checked then
            s := s + '2,';
        if RadioButton10.Checked then
            s := s + '3,';
        s := s + strreplace(StringGrid6.Cells[5, i], ',', '.') + ',';
        s := s + strreplace(StringGrid6.Cells[4, i], ',', '.') + ',';
        s := s + strreplace(StringGrid6.Cells[6, i], ',', '.') + ')';
        FDQCurrIspyt.SQL.Clear;
        FDQCurrIspyt.SQL.Add(s);
        FDQCurrIspyt.ExecSQL;
    end;

    BitBtn2.Enabled       := false;
    BitBtn3.Enabled       := false;
    BitBtn4.Enabled       := false;
    BitBtn18.Enabled      := true;
    RadioButton8.Checked  := false;
    RadioButton9.Checked  := false;
    RadioButton10.Checked := false;
    FillBlank(ReportPath + '\' + 'BLANK' + '.docx');
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
    Q.Close;
    Q.SQL.Clear;
    Q.SQL.add('delete from ELSPECTMPSOPROT where nomer='+Quotedstr(Edit5.Text));
    Q.ExecSQL;
    QSoprot.Close;
    try
        QSoprot.ParamByName('NOMER').Asstring    := Edit5.Text;
        QSoprot.ParamByName('TEMPER').AsFloat    := Strtofloat(strreplace(Edit8.Text,'.',','));
        QSoprot.ParamByName('PHAS').Asstring     := ComboBox7.Text;
        QSoprot.ParamByName('SOED').Asstring     := ComboBox8.Text;
        QSoprot.ParamByName('SOPRED').Asstring   := ComboBox9.Text;
        QSoprot.ParamByName('IZOLED').Asstring   := ComboBox10.Text;
        QSoprot.ParamByName('IZOLKORP').AsFloat  := Strtofloat(Edit13.Text);
        QSoprot.ParamByName('IZOLOBMOT').AsFloat := Strtofloat(Edit16.Text);

        QSoprot.ParamByName('IZM1U1U2').AsFloat :=
          Strtofloat(StringGrid3.Cells[1, 1]);
        QSoprot.ParamByName('IZM2U1U2').AsFloat :=
          Strtofloat(StringGrid3.Cells[1, 2]);
        QSoprot.ParamByName('IZM3U1U2').AsFloat :=
          Strtofloat(StringGrid3.Cells[1, 3]);
        QSoprot.ParamByName('IZM1V1V2').AsFloat :=
          Strtofloat(StringGrid3.Cells[2, 1]);
        QSoprot.ParamByName('IZM2V1V2').AsFloat :=
          Strtofloat(StringGrid3.Cells[2, 2]);
        QSoprot.ParamByName('IZM3V1V2').AsFloat :=
          Strtofloat(StringGrid3.Cells[2, 3]);
        QSoprot.ParamByName('IZM1W1W2').AsFloat :=
          Strtofloat(StringGrid3.Cells[3, 1]);
        QSoprot.ParamByName('IZM2W1W2').AsFloat :=
          Strtofloat(StringGrid3.Cells[3, 2]);
        QSoprot.ParamByName('IZM3W1W2').AsFloat :=
          Strtofloat(StringGrid3.Cells[3, 3]);
    except
        on E: Exception do
        begin
            ShowMessage
              ('Проверьте введенные данные, все поля должны быть заполнены!');
            E := NIL;
        end;
    end;
    QSoprot.ExecSQL;
    ShowMessage('Внесено!');
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
var
    buttonSelected: Integer;
begin
    buttonSelected := MessageDlg('Все ли поля условий испытания заполнены верно?', mtConfirmation, mbYesNo, 0);
    if buttonSelected = mrYes then
    begin
        FDQCurrIspyt.Open('select getnomer nomer from dual');
        Edit5.Text := FDQCurrIspyt.FieldByName('nomer').Asstring;
        try
            QIspytCommon.Close;
            QIspytCommon.ParamByName('DATA').Asstring :=
              DateToStr(DateTimePicker1.Date);
            QIspytCommon.ParamByName('TIPDV').Asstring := ComboBox1.Text;
            QIspytCommon.ParamByName('NOMDV').Asstring := Edit1.Text;
            QIspytCommon.ParamByName('POLUS').Asstring := ComboBox2.Text;
            QIspytCommon.ParamByName('UNOM').AsInteger :=
              strtoint(ComboBox3.Text);
            QIspytCommon.ParamByName('UISP').AsInteger :=
              strtoint(ComboBox4.Text);
            QIspytCommon.ParamByName('PNOM').AsInteger :=
              strtoint(ComboBox5.Text);
            QIspytCommon.ParamByName('HUMID').AsFloat :=
              Strtofloat(Edit17.Text);
            QIspytCommon.ParamByName('PRESSUR').AsFloat :=
              Strtofloat(Edit18.Text);
            QIspytCommon.ParamByName('ENERGO').Asstring := ComboBox11.Text;
            QIspytCommon.ParamByName('STENDN').Asstring := ComboBox12.Text;
            QIspytCommon.ParamByName('STENDA').Asstring := Label46.Caption;
            QIspytCommon.ParamByName('DOP1').Asstring   := Edit15.Text;
            QIspytCommon.ParamByName('READY').AsInteger := 0;
            QIspytCommon.ParamByName('NOMER').Asstring  := Edit5.Text;
            QIspytCommon.ExecSQL;
        Except
            on E: Exception do
            begin
                ShowMessage
                  ('Проверьте, все ли параметры текущего испытания указаны верно');
                E := NIL;
            end;
        end;
      BitBtn18.Enabled:=true;
      BitBtn19.Enabled:=true;

    end;
end;

procedure TForm1.BitBtn7Click(Sender: TObject);
var
 i,j:integer;
begin
    qispytcommgetlast.close;
    qispytcommgetlast.open;{select * from ispytcommon where ready=0}
    with fgetlast do
     begin
      for I := 1 to Stringgrid1.Rowcount-1 do
        for j := 0 to Stringgrid1.ColCount-1 do
           StringGrid1.Cells[j,i]:='';
      StringGrid1.Rowcount:=2;

      while not qispytcommgetlast.eof do
        begin
          StringGrid1.Row:=StringGrid1.RowCount-1;
          StringGrid1.cells[0,StringGrid1.Row]:=qispytcommgetlast.FieldByName('nomer').AsString;
          StringGrid1.cells[1,StringGrid1.Row]:=qispytcommgetlast.FieldByName('data').AsString;
          StringGrid1.cells[2,StringGrid1.Row]:=qispytcommgetlast.FieldByName('nomdv').AsString;
          StringGrid1.cells[3,StringGrid1.Row]:=qispytcommgetlast.FieldByName('stendn').AsString;
          qispytcommgetlast.Next;
          StringGrid1.RowCount:=StringGrid1.RowCount+1;
        end;
      StringGrid1.RowCount:=StringGrid1.RowCount-1;
     end;
    strwidth(fgetlast.StringGrid1);
    fgetlast.showmodal;
end;

/// /////////////////////////////////////////////////////////////
procedure TForm1.BitBtn12Click(Sender: TObject);
var
    s1, s2: string;
    i, j  : Integer;
begin
    for i           := 1 to 500 do
        for j       := 1 to 9 do
            a[i, j] := 0;
    if StringGrid2.row = StringGrid2.RowCount - 1 then
        ShowMessage
          ('Испытания завершены, выберите строку для повторного испытания')
    else
    begin
        FDQCurrIspyt.SQL.Clear;
        FDQCurrIspyt.SQL.Add('delete from elspectmphh where unom=' +
          StringGrid2.Cells[0, StringGrid2.row]);
        FDQCurrIspyt.ExecSQL;

        s1                           := StringGrid2.Cells[4, currentrow];
        s2                           := Edit3.Text;
        c                            := 0;
        timercnt                     := 0;
        cnt                          := 0;
        Label11.Caption              := 'Запущено испытание холостого хода';
        tipispyt                     := 1;
        c                            := 0;
        cnt                          := 0;
        ProgressBar1.Position        := 0;
        Timer50.Enabled              := true;
        Timer1000.Enabled            := true;
        PageControl1.ActivePageIndex := 7;
        tipispyt                     := 0; // холостой ход
    end;
end;

/// //////////////////////////////////////////////////////////////
procedure TForm1.BitBtn13Click(Sender: TObject);
var
    i, j: Integer;
begin
    for i                           := 1 to StringGrid2.ColCount - 1 do
        for j                       := 1 to StringGrid2.RowCount - 1 do
            StringGrid2.Cells[i, j] := '';
    StringGrid2.row                 := 1;
    BitBtn11.Enabled                := false;
    BitBtn12.Enabled                := false;
    BitBtn13.Enabled                := false;
    BitBtn19.Enabled                := true;
end;

/// /////////////////////////////////////////////////////////////
procedure TForm1.BitBtn14Click(Sender: TObject);
var
    i, j: Integer;
    f   : textfile;
begin
    assignfile(f, 'isptablehh.txt');
    Rewrite(f);
    Writeln(f, inttostr(StringGrid1.RowCount));
    Writeln(f, inttostr(StringGrid1.ColCount));
    for i     := 0 to StringGrid1.RowCount - 1 do
        for j := 0 to StringGrid1.ColCount - 1 do
            Writeln(f, StringGrid1.Cells[j, i]);
    closefile(f);
    ShowMessage('Сохранено');
end;

/// /////////////////////////////////////////////////////////////
procedure TForm1.BitBtn15Click(Sender: TObject);
var
    i, j: Integer;
    f   : textfile;
    s   : string;
begin
    assignfile(f, 'isptablehh.txt');
    Reset(f);
    Readln(f, s);
    StringGrid1.RowCount := strtoint(s);
    Readln(f, s);
    StringGrid1.ColCount := strtoint(s);
    for i                := 0 to StringGrid1.RowCount - 1 do
        for j            := 0 to StringGrid1.ColCount - 1 do
        begin
            Readln(f, s);
            StringGrid1.Cells[j, i] := s;
        end;
    closefile(f);
    // ShowMessage('Загружено');
end;

/// /////////////////////////////////////////////////////////////
procedure TForm1.BitBtn16Click(Sender: TObject);
var
    i, j: Integer;
    f   : textfile;
begin
    assignfile(f, 'isptablerh.txt');
    Rewrite(f);
    Writeln(f, inttostr(StringGrid5.RowCount));
    Writeln(f, inttostr(StringGrid5.ColCount));
    for i     := 0 to StringGrid5.RowCount - 1 do
        for j := 0 to StringGrid5.ColCount - 1 do
            Writeln(f, StringGrid5.Cells[j, i]);
    closefile(f);
    ShowMessage('Сохранено');
end;

/// /////////////////////////////////////////////////////////////
procedure TForm1.BitBtn17Click(Sender: TObject);
var
    i, j: Integer;
    f   : textfile;
    s   : string;
begin
    assignfile(f, 'isptablerh.txt');
    Reset(f);
    Readln(f, s);
    StringGrid5.RowCount := strtoint(s);
    Readln(f, s);
    StringGrid5.ColCount := strtoint(s);
    for i                := 0 to StringGrid5.RowCount - 1 do
        for j            := 0 to StringGrid5.ColCount - 1 do
        begin
            Readln(f, s);
            StringGrid5.Cells[j, i] := s;
        end;
    closefile(f);
    // ShowMessage('Загружено');
end;

procedure TForm1.BitBtn18Click(Sender: TObject);
var
    i, j: Integer;
begin
    if Edit5.Text = '0' then
    begin
        FDQCurrIspyt.Open('select getnomer nomer from dual');
        Edit5.Text := FDQCurrIspyt.FieldByName('nomer').Asstring;
    end;
    ///
    for i           := 1 to 500 do
        for j       := 1 to 12 do
            a[i, j] := 0;
    FDQCurrIspyt.SQL.Clear;
    FDQCurrIspyt.SQL.Add('truncate table elspectmprh');
    FDQCurrIspyt.ExecSQL;
    if (RadioButton8.Checked or RadioButton9.Checked or RadioButton10.Checked)
    then
    begin
        BitBtn18.Enabled := false;
        BitBtn2.Enabled  := true;
        BitBtn3.Enabled  := true;
        BitBtn4.Enabled  := true;
    end
    else
    begin
        ShowMessage('Укажите вариант испытания');
    end;
    ///

end;

/// /////////////////////////////////////////////////////////////

/// /////////////////////////////////////////////////////////////
procedure TForm1.BitBtn19Click(Sender: TObject);
var
    i, j: Integer;
begin
    if Edit5.Text = '0' then
    begin
        FDQCurrIspyt.Open('select getnomer nomer from dual');
        Edit5.Text := FDQCurrIspyt.FieldByName('nomer').Asstring;
    end;
    for i           := 1 to 500 do
        for j       := 1 to 9 do
            a[i, j] := 0;
    FDQCurrIspyt.SQL.Clear;
    FDQCurrIspyt.SQL.Add('truncate table elspectmphh');
    FDQCurrIspyt.ExecSQL;
    if (RadioButton5.Checked or RadioButton6.Checked or RadioButton7.Checked)
    then
    begin
        BitBtn19.Enabled := false;
        BitBtn11.Enabled := true;
        BitBtn12.Enabled := true;
        BitBtn13.Enabled := true;
    end
    else
    begin
        ShowMessage('Укажите вариант испытания');
    end;
end;

/// /////////////////////////////////////////////////////////////

/// /////////////////////////////////////////////////////////////
procedure TForm1.BitBtn20Click(Sender: TObject);
begin
    FormBig.Show;
end;

/// /////////////////////////////////////////////////////////////
procedure TForm1.BitBtn8Click(Sender: TObject);
var
    ini: tinifile;
    s  : String;
begin
    SaveDialog1.InitialDir := SettPAth;
    if SaveDialog1.Execute then
    begin
        ini := tinifile.Create(SaveDialog1.FileName);
        ini.WriteString('Settings', 'EngineType', ComboBox1.Text);
        ini.WriteString('Settings', 'Pulus', ComboBox2.Text);
        ini.WriteString('Settings', 'U nominal', ComboBox3.Text);
        ini.WriteString('Settings', 'U ispyt', ComboBox4.Text);
        ini.WriteString('Settings', 'P ispyt', ComboBox5.Text);
        ini.WriteString('Settings', 'Humidity', Edit17.Text);
        ini.WriteString('Settings', 'Pressure', Edit18.Text);
        ini.WriteString('Settings', 'Energo', ComboBox11.Text);
        ini.WriteString('Settings', 'Stend', ComboBox12.Text);
        ini.Free;
        NastrFill();
    end;
end;

/// /////////////////////////////////////////////////////////////
procedure TForm1.BitBtn9Click(Sender: TObject);
var
    ini: tinifile;
    s  : String;
begin
    OpenDialog1.InitialDir := SettPAth;
    if OpenDialog1.Execute then
    begin
        ini             := tinifile.Create(OpenDialog1.FileName);
        ComboBox1.Text  := ini.ReadString('Settings', 'EngineType', '-');
        ComboBox2.Text  := ini.ReadString('Settings', 'Pulus', '-');
        ComboBox3.Text  := ini.ReadString('Settings', 'U nominal', '-');
        ComboBox4.Text  := ini.ReadString('Settings', 'U ispyt', '-');
        ComboBox5.Text  := ini.ReadString('Settings', 'P ispyt', '-');
        Edit17.Text     := ini.ReadString('Settings', 'Humidity', '-');
        Edit18.Text     := ini.ReadString('Settings', 'Pressure', '-');
        ComboBox11.Text := ini.ReadString('Settings', 'Energo', '-');
        ComboBox12.Text := ini.ReadString('Settings', 'Stend', '-');
        Edit1.Text      := '-------';
        ini.Free;
    end;
end;

/// /////////////////////////////////////////////////////////////
procedure TForm1.Button10Click(Sender: TObject);
//var
//    ini: tinifile;
begin
    {ini := tinifile.Create(DatchikIni + '\' + 'start.ini');
    ini.WriteString('Position', 'Left', '100');
    ini.WriteString('Position', 'Top', '100');
    ini.WriteBool('DECODER', 'Emulator', RadioButton1.Checked);
    ini.WriteBool('DECODER', 'M25', RadioButton2.Checked);
    ini.WriteBool('DECODER', 'M35', RadioButton3.Checked);
    ini.WriteBool('DECODER', 'M45', RadioButton4.Checked);
    ini.WriteBool('MAIN', 'ClearZero', CheckBox1.Checked); //
    ini.WriteBool('MAIN', 'AutoStart', true);
    ini.Free;}
end;

procedure TForm1.Button11Click(Sender: TObject);
begin

end;

/// //////////////////////////////////////////////////////////////
procedure TForm1.Button1Click(Sender: TObject);
begin
    ComboBox1.Text := '';
    ComboBox2.Text := '';
    ComboBox3.Text := '';
    ComboBox4.Text := '';
    ComboBox5.Text := '';
    Edit1.Text     := '';
end;

/// /////////////////////////////////////////////////////////////
procedure TForm1.Button20Click(Sender: TObject);
begin
    Label53.Caption := Button20.Caption;
end;

procedure TForm1.Button21Click(Sender: TObject);
begin
    Label53.Caption := Button21.Caption;
end;

procedure TForm1.Button22Click(Sender: TObject);
begin
    Label53.Caption := Button22.Caption;
end;

procedure TForm1.Button23Click(Sender: TObject);
begin
    Label53.Caption := Button23.Caption;
end;

procedure TForm1.Button24Click(Sender: TObject);
begin
    Label53.Caption := Button24.Caption;
end;

procedure TForm1.Button25Click(Sender: TObject);
begin
    Label53.Caption := Button25.Caption;
end;

procedure TForm1.Button26Click(Sender: TObject);
begin
    Label53.Caption := Button26.Caption;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
    activated              := false;
    KRTimer1.Enabled       := false;
    KRModbusClient1.Active := false;
    KRModbusMaster1.Active := false;

    KRTCPConnector1.IP                           := Edit10.Text;
    KRTCPConnector1.Port                         := strtoint(Edit11.Text);
    KRModbusClient1.Addres                       := strtoint(Edit12.Text);
    KRModbusMaster1.Connector.OnConnectionStatus :=
      KRTCPConnector1ConnectionStatus;
    KRModbusMaster1.Connector.Active := true;
end;

/// /////////////////////////////////////////////////////////////
procedure TForm1.Button3Click(Sender: TObject);
var
    s      : string;
    dectype: string;
begin
    Query4.ExecSQL;
    Query2.Open;
    Label60.Caption := Query2.FieldByName('torq').Asstring;
    Label61.Caption := Query2.FieldByName('rot').Asstring;
    Label62.Caption := Query2.FieldByName('power').Asstring;
    Query2.Close;
    Query3.ParamByName('nom').Asstring := Edit5.Text;
    // Query3.paramByName('fil').AsString := Edit5.Text + '.db3';
    Query3.ParamByName('dop').Asstring := '1';
    if (RadioButton1.Checked) then
        dectype := '4';
    if (RadioButton4.Checked) then
        dectype                        := '10';
    Query3.ParamByName('dat').Asstring := dectype;
    Query3.ExecSQL;
end;

procedure TForm1.Button47Click(Sender: TObject);
var
    i, j: Integer;
begin
    for i                           := 1 to StringGrid7.RowCount - 1 do
        for j                       := 1 to StringGrid7.ColCount - 1 do
            StringGrid7.Cells[j, i] := '0';
    RadioButton11.Checked           := false;
    RadioButton12.Checked           := false;
    RadioButton13.Checked           := false;
    RadioButton14.Checked           := false;
    RadioButton15.Checked           := false;

end;

procedure TForm1.Button48Click(Sender: TObject);
var
    i, j: Integer;
begin
    for i                           := 1 to StringGrid8.RowCount - 1 do
        for j                       := 1 to StringGrid8.ColCount - 1 do
            StringGrid8.Cells[j, i] := '0';
    RadioButton16.Checked           := false;
    RadioButton17.Checked           := false;
    RadioButton18.Checked           := false;
    RadioButton19.Checked           := false;
    RadioButton20.Checked           := false;

end;

procedure TForm1.Button49Click(Sender: TObject);
var
    i, j: Integer;
begin
    for i                           := 1 to StringGrid4.RowCount - 1 do
        for j                       := 1 to StringGrid4.ColCount - 1 do
            StringGrid4.Cells[j, i] := '0';
end;

/// /////////////////////////////////////////////////////////////

/// /////////////////////////////////////////////////////////////
procedure TForm1.Button50Click(Sender: TObject);
var
    i, j: Integer;
begin
    for i                           := 1 to StringGrid3.RowCount - 1 do
        for j                       := 1 to StringGrid3.ColCount - 1 do
            StringGrid3.Cells[j, i] := '0';
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
    if OpenDialog1.Execute() then
    begin
        Edit9.Text := OpenDialog1.FileName;
        ini := tinifile.Create(Extractfilepath(paramstr(0)) + 'settings.ini');
        ini.WriteString('DATCHIK', 'EXENAME', DatchikExe);
        ini.Free;
    end;
end;

/// /////////////////////////////////////////////////////////////
procedure TForm1.Button6Click(Sender: TObject);
var
    wnd: HWND;
begin
    ShellExecute(wnd, 'open', PChar(DatchikExe), nil, nil, SW_RESTORE);
end;

/// /////////////////////////////////////////////////////////////

/// /////////////////////////////////////////////////////////////
//Function GetDatchikLastBase: string;
//var
//    ini: tinifile;
//    s  : string;
//begin
//    ini := tinifile.Create(DatchikPath + 'settings.ini');
    // s                  := ini.ReadString('Base', 'Last', 'unknown.db3');
//    s                  := DatchikPath + s;
//    GetDatchikLastBase := s;
//    ini.Free;
//end;

/// /////////////////////////////////////////////////////////////

procedure TForm1.FormActivate(Sender: TObject);
var
    l, t, i: Integer;
    s      : string;
begin
    // Beep();

end;

/// /////////////////////////////////////////////////////////////
procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
    i: Integer;
begin
    // -----------------------------------
    for i := 0 to Form1.ComponentCount - 1 do
    begin
        if Components[i] is TComboBox then
        begin
            TComboBox(Components[i]).Items.SaveToFile
              (Extractfilepath(Application.ExeName) +
              TComboBox(Components[i]).name);
        end;
    end;
    // -----------------------------------
    ini := tinifile.Create(Extractfilepath(paramstr(0)) + 'settings.ini');
    ini.WriteString('DATCHIK', 'EXENAME', Edit9.Text);
    ini.WriteInteger('Position', 'Left', Form1.Left);
    ini.WriteInteger('Position', 'Top', Form1.Top);
    // REGISTERS
    ini.WriteInteger('ELSPEC', 'Usr', USR);
    ini.WriteInteger('ELSPEC', 'Isr', ISR);
    ini.WriteInteger('ELSPEC', 'Psr', PSR);
    ini.WriteInteger('ELSPEC', 'U12', U12);
    ini.WriteInteger('ELSPEC', 'U23', U23);
    ini.WriteInteger('ELSPEC', 'U31', U31);
    ini.WriteInteger('ELSPEC', 'I1', I1);
    ini.WriteInteger('ELSPEC', 'I2', I2);
    ini.WriteInteger('ELSPEC', 'I3', I3);
    ini.WriteInteger('ELSPEC', 'P1', P1);
    ini.WriteInteger('ELSPEC', 'P2', P2);
    ini.WriteInteger('ELSPEC', 'P3', P3);
    ini.WriteString('M45', 'Interval', Edit20.Text);
    ini.Free;
end;

/// //////////////////////////////////////////////////////////////
procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
    KRTimer1.Enabled                 := false;
    KRModbusClient1.Active           := false;
    KRModbusMaster1.Active           := false;
    KRModbusMaster1.Connector.Active := false;
    PostMessage(FindWindow(nil, 'Сбор показаний датчика M45'), WM_QUIT, 0, 0);
    EditIns();
end;

procedure TForm1.FormCreate(Sender: TObject);
var
    l, t, i: Integer;
    s      : string;
begin
    Querystart.SQL.Add('update version set maintotal=maintotal+1');
    Querystart.ExecSQL;
    Querystart.SQL.Clear;
    Querystart.Open('select * from version');
    Label33.Caption := Querystart.FieldByName('maintotal').Asstring;
    ini := tinifile.Create(Extractfilepath(paramstr(0)) + 'settings.ini');
    USR := ini.ReadInteger('ELSPEC', 'Usr', 3529);
    ISR := ini.ReadInteger('ELSPEC', 'Isr', 3531);
    PSR := ini.ReadInteger('ELSPEC', 'Psr', 3439);
    U12 := ini.ReadInteger('ELSPEC', 'U12', 3511);
    U23 := ini.ReadInteger('ELSPEC', 'U23', 3513);
    U31 := ini.ReadInteger('ELSPEC', 'U31', 3515);
    I1  := ini.ReadInteger('ELSPEC', 'I1', 3521);
    I2  := ini.ReadInteger('ELSPEC', 'I2', 3523);
    I3  := ini.ReadInteger('ELSPEC', 'I3', 3525);
    P1  := ini.ReadInteger('ELSPEC', 'P1', 3427);
    P2  := ini.ReadInteger('ELSPEC', 'P2', 3429);
    P3  := ini.ReadInteger('ELSPEC', 'P3', 3431);
    Edit20.Text := ini.ReadString('M45', 'Interval', '50');
    DatchikExe := ini.ReadString('DATCHIK', 'EXENAME',
      'Укажите файл сбора показаний');
    Edit9.Text  := DatchikExe;
    DatchikPath := Extractfilepath(DatchikExe);
    //DatchikIni  := DatchikPath + '\ini\';
    l           := ini.ReadInteger('Position', 'Left', 100);
    t           := ini.ReadInteger('Position', 'Top', 100);
    Form1.Left  := l;
    Form1.Top   := t;
    ini.Free;
    PageControl1.ActivePageIndex := 0;
    ReportPath := Extractfilepath(Application.ExeName) + 'REPORT';
    CreateDirEx(ReportPath);
    SettPAth := Extractfilepath(paramstr(0)) + 'SETTINGS\';
    CreateDirEx(SettPAth);
    DateTimePicker1.Date := Date;

    // ------------------------
    try
        for i := 0 to Form1.ComponentCount - 1 do
        begin
            if Components[i] is TComboBox then
            begin
                if TComboBox(Components[i]).Tag <> 500 then
                    TComboBox(Components[i]).Items.LoadFromFile
                      (Extractfilepath(Application.ExeName) +
                      TComboBox(Components[i]).name);
            end;
        end;
    except
        on E: Exception do
            E := nil;
    end;

    NastrFill();
    Stringgridfill();
    BitBtn15.Click();
    BitBtn17.Click();
    ComboAdds();
    EditAdds();

    Button1.Click;

    Usred.RegisterIndex          := USR;
    Isred.RegisterIndex          := ISR;
    Psred.RegisterIndex          := PSR;
    KRMBRegister12.RegisterIndex := U12;
    KRMBRegister23.RegisterIndex := U23;
    KRMBRegister31.RegisterIndex := U31;
    KRMBRegisterI1.RegisterIndex := I1;
    KRMBRegisterI2.RegisterIndex := I2;
    KRMBRegisterI3.RegisterIndex := I3;

    KRTCPConnector1.IP                           := Edit10.Text;
    KRTCPConnector1.Port                         := strtoint(Edit11.Text);
    KRModbusClient1.Addres                       := strtoint(Edit12.Text);
    KRModbusMaster1.Connector.OnConnectionStatus :=
      KRTCPConnector1ConnectionStatus;
    KRModbusMaster1.Connector.Active := true;
    KRModbusMaster1.Active           := true;
    KRModbusClient1.Active           := true;
    KRTimer1.Enabled                 := true;
    activated                        := true;
    s                                := Edit9.Text;
    ShellExecute(Handle, 'open', PWideChar(DatchikExe), nil, nil,
      SW_SHOWNORMAL);
    // start(edit9.text)
    {
      - Открыть текстовый файл c:\text.txt в блокноте

      ShellExecute(Handle, 'open',
      'c:\windows\notepad.exe', 'c:\text.txt', < BR > nil,
      SW_SHOWNORMAL);
    }
    ComboBox12.Text := '';
    ComboBox12.Items.Clear;
    QAttestat.Open('Select name from stend');
    while not QAttestat.Eof do
    begin
        ComboBox12.Items.Add(QAttestat.FieldByName('name').Asstring);
        QAttestat.Next;
    end;
    QAttestat.Close;
    QAttestat.SQL.Clear;
    QAttestat.SQL.Add('select attest from stend where name=:name');
    Button47.Click;
    Button48.Click;
    Button49.Click;
    Button50.Click;
end;

/// //////////////////////////////////////////////////////////////
procedure TForm1.KRTCPConnector1ConnectionStatus(Sender: TObject;
  AStat: TKRConnectorStat; AReconnectTime: Cardinal);
begin
    KRModbusClient1.updateAllWaitingVariabels;
end;

/// //////////////////////////////////////////////////////////////
procedure TForm1.KRTimer1Timer(Sender: TObject);
begin

    if KRTCPConnector1.Stat = cstConnected then
    begin
        StatusBar1.Panels[1].Text := 'СОЕДИНЕН';
        LAbel27.Font.Color:=clGreen;
        Label27.Caption:= StatusBar1.Panels[1].Text;
        StatusBar1.Panels[2].Text := KRTCPConnector1.IP + ':' +
          inttostr(KRTCPConnector1.Port) + '@' +
          inttostr(KRModbusClient1.Addres);
    end
    else
    begin
        StatusBar1.Panels[1].Text := 'НЕТ СОЕДИНЕНИЯ';
        LAbel27.Font.Color:=clRed;
        Label27.Caption:= StatusBar1.Panels[1].Text;
        StatusBar1.Panels[2].Text := KRTCPConnector1.IP + ':' +
          inttostr(KRTCPConnector1.Port) + '@' +
          inttostr(KRModbusClient1.Addres);
    end;
end;

/// /////////////////////////////////////////////////////////////
/// /////////////////////////////////////////////////////////////
procedure TForm1.N2Click(Sender: TObject);
begin
    PostMessage(FindWindow(nil, 'Сбор показаний датчиков M40 и Elspec G4400'),
      WM_QUIT, 0, 0);
    Application.Terminate();
end;

/// /////////////////////////////////////////////////////////////
procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
    Edit5.Text := inttostr(strtoint(Edit5.Text) - 1);
end;

procedure TForm1.StringGrid2Click(Sender: TObject);
begin
    case tipispyt of
        0:
            begin
                currentrow := StringGrid2.row;
                if currentrow < StringGrid2.RowCount - 1 then
                begin
                    Label20.Caption := StringGrid2.Cells[0, currentrow];
                end
                else
                    ShowMessage('Внимание, выбрано завершение испытания!');
            end;
        1:
            begin
                currentrow := StringGrid6.row;
                if currentrow < StringGrid6.RowCount - 1 then
                begin
                    Label30.Caption := StringGrid6.Cells[0, currentrow];

                end
                else
                    ShowMessage('Внимание, выбрано завершение испытания!');
            end;
    end;
end;

/// /////////////////////////////////////////////////////////////
procedure TForm1.StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
 var ok:boolean;
begin
     if (ACol=0) Or (ARow=0) Then Exit;
     ok:= (StringGrid2.Cells[4,arow]='0') or (StringGrid2.Cells[4,arow]='');
      if (ACol = 4) and (not ok) then
      begin
      //выбираем зеленный цвет и закрашиваем что нам нужно
      stringGrid2.Canvas.Brush.Color := clYellow;
      stringGrid2.Canvas.FillRect(Rect);
      stringGrid2.Canvas.TextOut(Rect.Left, Rect.Top, stringGrid2.Cells[ACol, ARow]);
      end;
end;

/// /////////////////////////////////////////////////////////////
procedure TForm1.StringGrid6Click(Sender: TObject);
begin
   case tipispyt of
        0:
            begin
                currentrow := StringGrid2.row;
                if currentrow < StringGrid2.RowCount - 1 then
                begin
                    Label32.Caption := StringGrid2.Cells[0, currentrow];
                end
                else
                    ShowMessage('Внимание, выбрано завершение испытания!');
            end;
        1:
            begin
                currentrow := StringGrid6.row;
                if currentrow < StringGrid6.RowCount - 1 then
                begin
                    Label30.Caption := StringGrid6.Cells[0, currentrow];

                end
                else
                    ShowMessage('Внимание, выбрано завершение испытания!');
            end;
    end;

    currentrow := StringGrid6.row;
    if currentrow < StringGrid6.RowCount - 1 then
    begin
        Label32.Caption := StringGrid6.Cells[0, currentrow];
    end;
end;

/// /////////////////////////////////////////////////////////////
procedure TForm1.Timer500Timer(Sender: TObject);
begin
    StatusBar1.Panels[0].Text := TimetoStr(Time);
    Query2.Open;
    Label60.Caption := Query2.FieldByName('torq').Asstring;
    Label76.Caption := Query2.FieldByName('torq').Asstring;
    Label61.Caption := Query2.FieldByName('rot').Asstring;
    Label62.Caption := Query2.FieldByName('power').Asstring;
    Query2.Close;
end;
/// //////////////////////////////////////////////////////////////

procedure TForm1.Timer1000Timer(Sender: TObject);
var
    i, j: Integer;
    zi1, zi2, zi3, zu12, zu23, zu31, zp1, zp2, zp3, zu, zi, zp: single;
    torq, rot, pow: single;
    s, ts         : string;
    bad:boolean;
    maxbad:single;
    t1,t2,t3,v:single;
begin

    if timercnt >= 15 then
    begin
        Timer1000.Enabled := false;
        Timer50.Enabled   := false;
        Label11.Caption   := 'Завершено';
        // тут считаем среднее значение и вносим его в основную таблицу
        zi1   := 0;
        zi2   := 0;
        zi3   := 0;
        zu12  := 0;
        zu23  := 0;
        zu31  := 0;
        zp1   := 0;
        zp2   := 0;
        zp3   := 0;
        torq  := 0;
        rot   := 0;
        pow   := 0;
        bad:=false;
        maxbad:=0;
        for i := 1 to cnt do
        begin
            zu12 := zu12 + a[i, 1];
            zu23 := zu23 + a[i, 2];
            zu31 := zu31 + a[i, 3];
            zi1  := zi1 + a[i, 4];
            zi2  := zi2 + a[i, 5];
            zi3  := zi3 + a[i, 6];
            zp1  := zp1 + a[i, 7];
            zp2  := zp2 + a[i, 8];
            zp3  := zp3 + a[i, 9];
            // тут найти максимальное отклонение напряжения от уставки
            v:=StrToFloat(Stringgrid2.cells[0,StringGrid2.Row]);
            t1:= ABS(v-a[i, 1]);
            if t1>Strtofloat(Edit3.Text) then
             begin
               bad:=true;
               if t1>maxbad then maxbad:=t1;
             end;
            t2:= ABS(v-a[i, 2]);
            if t2>Strtofloat(Edit3.Text) then
             begin
               bad:=true;
               if t2>maxbad then maxbad:=t2;
             end;
            t3:= ABS(v-a[i, 3]);
            if t3>Strtofloat(Edit3.Text) then
             begin
               bad:=true;
               if t3>maxbad then maxbad:=t3;
             end;

        end;

        zu12 := zu12 / cnt;
        zu23 := zu23 / cnt;
        zu31 := zu31 / cnt;
        zi1  := zi1 / cnt;
        zi2  := zi2 / cnt;
        zi3  := zi3 / cnt;
        zp1  := zp1 / cnt;
        zp2  := zp2 / cnt;
        zp3  := zp3 / cnt;
        zi   := (zi1 + zi2 + zi3) / 3;
        zp   := (zp1 + zp2 + zp3) / 3;
        zu   := (zu12 + zu23 + zu31) / 3;

        case tipispyt of
            0:
                begin // hh
                    for i := 1 to cnt do
                    begin
                        FDQCurrIspyt.SQL.Clear;
                        s := 'INSERT INTO elspectmphh (nomer,Unom,u12,u23,u31,i1,i2,i3,p1,p2,p3) ';
                        s := s + 'values(' + Quotedstr(Edit5.Text) + ',' +
                          StringGrid2.Cells[0, StringGrid2.row];
                        for j := 1 to 9 do
                        begin
                            s := s + ',' + strreplace(floattostr(a[i, j]),
                              ',', '.');
                        end;
                        FDQCurrIspyt.SQL.Add(s + ')');
                        Memo1.lines.add(s);
                        FDQCurrIspyt.ExecSQL;
                    end;
                    cnt                                   := 0;
                    PageControl1.ActivePageIndex          := 0;
                    StringGrid2.Cells[1, StringGrid2.row] :=
                      floattostr(RoundMax100(zu));
                    StringGrid2.Cells[2, StringGrid2.row] :=
                      floattostr(RoundMax100(zi));
                    StringGrid2.Cells[3, StringGrid2.row] :=
                      floattostr(RoundMax100(zp));
                    if bad then
                     StringGrid2.Cells[4, StringGrid2.row]:= floattostr(maxbad)
                     else
                      StringGrid2.Cells[4, StringGrid2.row]:='0';
                    StringGrid2.row := StringGrid2.row + 1;
                end;

            1:
                begin // rh
                    FDQCurrIspyt.SQL.Clear;
                    FDQCurrIspyt.Open('select count (*) a from zamertmp');
                    if cnt > FDQCurrIspyt.FieldByName('a').AsInteger then
                        cnt := FDQCurrIspyt.FieldByName('a').AsInteger;
                    FDQCurrIspyt1.SQL.Clear;
                    FDQCurrIspyt1.Open('select * from zamertmp order by rowid');
                    FDQCurrIspyt1.First;
                    for i := 1 to cnt do
                    begin
                        FDQCurrIspyt.SQL.Clear;
                        s := 'INSERT INTO elspectmprh (nomer,Unom,u12,u23,u31,i1,i2,i3,p1,p2,p3,torq,power,rot) ';
                        s := s + 'values(' + Quotedstr(Edit5.Text) + ',' +
                          StringGrid6.Cells[0, StringGrid6.row];
                        for j := 1 to 9 do
                        begin
                            s := s + ',' + strreplace(floattostr(a[i, j]),
                              ',', '.');
                        end;
                        // torq power rot
                        s := s + ',' +
                          strreplace(FDQCurrIspyt1.FieldByName('torq').Asstring,
                          ',', '.');
                        s := s + ',' +
                          strreplace(FDQCurrIspyt1.FieldByName('power')
                          .Asstring, ',', '.');
                        s := s + ',' +
                          strreplace(FDQCurrIspyt1.FieldByName('rot').Asstring,
                          ',', '.');
                        { torq := torq + a[i, 10];
                          rot  := rot  + a[i, 11];
                          pow  := pow  + a[i, 12]; }
                        FDQCurrIspyt.SQL.Add(s + ')');
                        FDQCurrIspyt.ExecSQL;
                        FDQCurrIspyt1.Next;
                    end;
                    torq                         := torq / cnt;
                    rot                          := rot / cnt;
                    pow                          := pow / cnt;
                    cnt                          := 0;
                    PageControl1.ActivePageIndex := 1;
                    FDQCurrIspyt.SQL.Clear;
                    FDQCurrIspyt.SQL.Add
                      ('select avg(u12) u12, avg(u23) u23,avg(u31) u31, ');
                    FDQCurrIspyt.SQL.Add
                      (' avg(i1) i1, avg(i2) i2,avg(i3) i3, ');
                    FDQCurrIspyt.SQL.Add
                      (' avg(p1) p1, avg(p2) p2,avg(p3) p3, ');
                    FDQCurrIspyt.SQL.Add
                      (' avg(torq) torq, avg(rot) rot,avg(power) power ');
                    FDQCurrIspyt.SQL.Add('from elspectmprh where unom=' +
                      StringGrid6.Cells[0, StringGrid6.row]);
                    FDQCurrIspyt.Open;
                    StringGrid6.Cells[1, StringGrid6.row] :=
                      floattostr
                      (RoundMax100((FDQCurrIspyt.FieldByName('u12').AsFloat +
                      FDQCurrIspyt.FieldByName('u23').AsFloat +
                      FDQCurrIspyt.FieldByName('u31').AsFloat) / 3));
                    StringGrid6.Cells[2, StringGrid6.row] :=
                      floattostr
                      (RoundMax100((FDQCurrIspyt.FieldByName('i1').AsFloat +
                      FDQCurrIspyt.FieldByName('i2').AsFloat +
                      FDQCurrIspyt.FieldByName('i3').AsFloat) / 3));
                    StringGrid6.Cells[3, StringGrid6.row] :=
                      floattostr
                      (RoundMax100((FDQCurrIspyt.FieldByName('p1').AsFloat +
                      FDQCurrIspyt.FieldByName('p2').AsFloat +
                      FDQCurrIspyt.FieldByName('p3').AsFloat) / 3));
                    StringGrid6.Cells[4, StringGrid6.row] :=
                      floattostr(RoundMax100(FDQCurrIspyt.FieldByName('torq')
                      .AsFloat));
                    StringGrid6.Cells[5, StringGrid6.row] :=
                      floattostr(RoundMax100(FDQCurrIspyt.FieldByName('rot')
                      .AsFloat));
                    StringGrid6.Cells[6, StringGrid6.row] :=
                      floattostr(RoundMax100(FDQCurrIspyt.FieldByName('power')
                      .AsFloat));
                    StringGrid6.row := StringGrid6.row + 1;

                end;
        end;
        commandstart(0, Edit5.Text);
    end;
    timercnt := timercnt + 1;
    ProgressBar1.Stepit;
end;

/// //////////////////////////////////////////////////////////////
procedure TForm1.Timer50Timer(Sender: TObject);
begin
    cnt       := cnt + 1;
    a[cnt, 1] := KRMBRegister12.Value;
    a[cnt, 2] := KRMBRegister23.Value;
    a[cnt, 3] := KRMBRegister31.Value;
    a[cnt, 4] := KRMBRegisterI1.Value;
    a[cnt, 5] := KRMBRegisterI2.Value;
    a[cnt, 6] := KRMBRegisterI3.Value;
    a[cnt, 7] := KRMBRegisterP1.Value;
    a[cnt, 8] := KRMBRegisterP2.Value;
    a[cnt, 9] := KRMBRegisterP3.Value;

end;

/// //////////////////////////////////////////////////////////////
procedure TForm1.UsredValUpdated(Sender: TObject; Variable: TKRVariable);
begin
    // напряжение
    if abs(Variable.Value - Strtofloat(Label20.Caption)) <=
      Strtofloat(Edit3.Text) then
    begin
        KRVarLabel1.FontColor         := clGreen;
        Label20.Font.Color            := clGreen;
        FormBig.KRVarLabel1.FontColor := clGreen;
        FormBig.Color                 := clBtnFace;
    end
    else
    begin
        KRVarLabel1.FontColor         := clRed;
        Label20.Font.Color            := clRed;
        FormBig.KRVarLabel1.FontColor := clRed;
        FormBig.Color                 := clYellow;
    end;
end;

/// /////////////////////////////////////////////////////////////
end.
