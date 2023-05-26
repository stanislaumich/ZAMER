unit UReg;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
    KRConnector,
    KRCOMPortConnector, KRTypes, CPortCtl, CPort, System.Actions, Vcl.ActnList,
    FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
    FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
    FireDAC.Phys, FireDAC.Phys.Oracle, FireDAC.Phys.OracleDef,
    FireDAC.VCLUI.Wait,
    FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
    Vcl.ExtCtrls, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Inifiles;

type
    TFormReg = class(TForm)
        Label1: TLabel;
        Label2: TLabel;
        Label6: TLabel;
        ComboBox1: TComboBox;
        Edit1: TEdit;
        Label8: TLabel;
        Label9: TLabel;
        Edit4: TEdit;
        BitBtn1: TBitBtn;
        ComLed1: TComLed;
        Com: TComPort;
        BitBtn2: TBitBtn;
        BitBtn3: TBitBtn;
        BitBtn4: TBitBtn;
        ActionList1: TActionList;
        Up: TAction;
        Down: TAction;
        Stop: TAction;
        FDC: TFDConnection;
        Query1: TFDQuery;
        Timer1: TTimer;
        Label3: TLabel;
        BitBtn5: TBitBtn;
        Query2: TFDQuery;
        Timer2: TTimer;
        Query3: TFDQuery;
        Label4: TLabel;
        Edit2: TEdit;
        Timer3: TTimer;
        Label5: TLabel;
        Edit3: TEdit;
        Timer4: TTimer;
    Button1: TButton;
        procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
        procedure ComRxChar(Sender: TObject; Count: Integer);
        procedure Button7Click(Sender: TObject);
        procedure BitBtn1Click(Sender: TObject);
        procedure BitBtn2Click(Sender: TObject);
        procedure BitBtn3Click(Sender: TObject);
        procedure BitBtn4Click(Sender: TObject);
        procedure UpExecute(Sender: TObject);
        procedure DownExecute(Sender: TObject);
        procedure StopExecute(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure Timer1Timer(Sender: TObject);
        procedure BitBtn5Click(Sender: TObject);
        procedure Timer2Timer(Sender: TObject);
        procedure Step(d: Boolean; s: string);
        procedure Timer4Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    private
        { Private declarations }
    public
        // buf: PByte;//PKRBuffer;
        procedure Mycallback(AError: Integer; APack: PByte; ALength: Integer;
          AData: Pointer);
    end;

var
    FormReg: TFormReg;
    ComStr: string;
    act: Integer;

const
    plen = 20; // длина пакета

implementation

{$R *.dfm}

procedure TFormReg.Mycallback(AError: Integer; APack: PByte; ALength: Integer;
  AData: Pointer);
begin

end;

procedure TFormReg.StopExecute(Sender: TObject);
begin
    BitBtn4.Click;
end;

procedure TFormReg.Step(d: Boolean; s: string);
begin
    if d then
    begin
        Com.WriteStr('2');
        Sleep(round(strtofloat(s)));
        Com.WriteStr('0');
        // Sleep(round(strtofloat(Edit3.Text)));
    end
    else
    begin
        Com.WriteStr('1');
        Sleep(round(strtofloat(s)));
        Com.WriteStr('0');
        // Sleep(round(strtofloat(Edit3.Text)));
    end;
end;

procedure TFormReg.Timer1Timer(Sender: TObject);
var
    dU: single;
begin
        dU := strtofloat(Label8.Caption) - strtofloat(Edit4.Text);
        if abs(dU) > 5 { большой шаг }
        then
        begin { большой шаг }
            if dU > 0 then { надо уменьшить тек больше зад }
            begin
                BitBtn3.Click;
            end
            else
            begin { надо увеличить }
                BitBtn2.Click;
            end;
        end { конец большого шага }
        else { малый шаг или стоп }
        begin
            if abs(dU) > strtofloat(Edit1.Text)
            { все ещё не попали - малый шаг }
            then
            begin
                if dU > 0 then { прибавить шажок }
                begin
                    Timer1.Enabled := false;
                    Com.WriteStr('1');
                    Sleep(round(strtofloat(Edit2.Text)));
                    Com.WriteStr('0');
                    Timer1.Enabled := true;
                end;
                if dU < 0 then { убавить шажок }
                begin { надо увеличить }
                    Timer1.Enabled := false;
                    Com.WriteStr('2');
                    Sleep(round(strtofloat(Edit2.Text)));
                    Com.WriteStr('0');
                    Timer1.Enabled := true;
                end;
                Sleep(round(strtofloat(Edit3.Text)));
            end
            else { попали в погрешность }
            begin
                BitBtn4.Click;
                Com.WriteStr('4');
            end;
        end;

end;

procedure TFormReg.Timer2Timer(Sender: TObject);
begin
    Query2.Open;
    case Query2.fieldbyname('Command').asinteger of
        1:
            begin
                // запустить установку
                Edit1.Text := Query2.fieldbyname('interval').asString;
                Edit4.Text := Query2.fieldbyname('dat').asString;
                BitBtn1.Click;
            end;
        2:
            begin
                // закрыть программу
                if Com.Connected then
                begin
                    Com.WriteStr('0');
                    Com.Close;
                end;
                FormReg.Close;
            end;
        3:
            begin
                // запустить старт
                BitBtn1.Click;
            end;
        4:
            begin
                // остановить стоп
                BitBtn5.Click;
            end;
    end;

    Query3.ExecSQL;

end;

procedure TFormReg.Timer4Timer(Sender: TObject);
var
    tstate: Integer;
begin
    Query1.Open;
    Label8.Caption := Query1.fieldbyname('U').asString;
    //U:= Query1.fieldbyname('U').asFloat;
    Query1.Close;

    if Com.Connected and (strtofloat(Label8.Caption) > 10) then
        Timer1.Enabled := true
    else
     begin
        if Com.Connected then Com.WriteStr('0');
        Timer1.Enabled := false;
     end;



    //if timer1.Enabled then button1.Caption:='tr' else button1.Caption:='fl';

end;

procedure TFormReg.UpExecute(Sender: TObject);
begin
    BitBtn2.Click;
end;

procedure TFormReg.BitBtn1Click(Sender: TObject);
begin
    Com.Port := ComboBox1.Text;
    Com.Open;
    BitBtn2.Enabled := true;
    BitBtn3.Enabled := true;
    BitBtn4.Enabled := true;
    Timer1.Enabled := true;
    BitBtn1.Enabled := false;
    BitBtn5.Enabled := true;
end;

procedure TFormReg.BitBtn2Click(Sender: TObject);
begin

    if act <> 2 then
    begin
        Com.WriteStr('0');
        Com.WriteStr('2');
        act := 2;
        Label3.Caption := '+';
    end
    else
        act := 0;
end;

procedure TFormReg.BitBtn3Click(Sender: TObject);
begin

    if act <> 1 then
    begin
        Com.WriteStr('0');
        Com.WriteStr('1');
        act := 1;
        Label3.Caption := '-';
    end
    else
        act := 0;
end;

procedure TFormReg.BitBtn4Click(Sender: TObject);
begin
    Com.WriteStr('0');
    act := 0;
    Label3.Caption := '0';
end;

procedure TFormReg.BitBtn5Click(Sender: TObject);
begin
    Timer1.Enabled := false;
    if Not Com.Connected then
        Exit;
    act := 0;
    Com.WriteStr('0');
    Com.Close;
    BitBtn5.Enabled := false;
    BitBtn1.Enabled := true;
end;

procedure TFormReg.Button1Click(Sender: TObject);
begin
 Timer1.Enabled:=true;
end;

procedure TFormReg.Button7Click(Sender: TObject);
begin
    Com.WriteStr('3');
    act := 3;
end;

procedure TFormReg.ComRxChar(Sender: TObject; Count: Integer);
var
    i: Integer;
    res: string;
begin
    Com.ReadStr(res, Count);
    ComStr := '';
    for i := 1 to length(res) do
    begin
        ComStr := ComStr + ' ' + inttostr(byte(res[i]));
    end;

    ComStr := '';
end;

procedure TFormReg.DownExecute(Sender: TObject);
begin
    BitBtn3.Click;
end;

procedure TFormReg.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
    ini: TIniFile;
    s: string;
begin
    ini := TIniFile.Create(Extractfilepath(Application.Exename) + 'UReg.ini');
    s := ComboBox1.Text;
    ini.WriteString('MAIN', 'PORT', s);
    s := Edit2.Text;
    ini.WriteString('MAIN', 'STEP', s);
    s := Edit3.Text;
    ini.WriteString('MAIN', 'STOP', s);
    ini.Free;
    if Not Com.Connected then
        Exit;
    Com.WriteStr('0');
    Com.Close;
end;

procedure TFormReg.FormCreate(Sender: TObject);
var
    ini: TIniFile;
    s: string;
begin
    act := 0;
    ini := TIniFile.Create(Extractfilepath(Application.Exename) + 'UReg.ini');
    s := ini.ReadString('MAIN', 'PORT', 'Com1');
    ComboBox1.Text := s;
    s := ini.ReadString('MAIN', 'STEP', '500');
    Edit2.Text := s;
    s := ini.ReadString('MAIN', 'STOP', '500');
    Edit3.Text := s;
    ini.Free;
end;

end.
