unit UMainSbor;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, KRComponentCollection, KRVariables,
    KRModbusClient, KRModbusMaster, KRConnector, KRTCPConnector, Vcl.StdCtrls,
    Vcl.ExtCtrls, Math, UAdd, IniFiles, FireDAC.Stan.Intf, FireDAC.Stan.Option,
    FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
    FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.Oracle,
    FireDAC.Phys.OracleDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
    FireDAC.DatS,
    FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
    FireDAC.Comp.Client;

type
    TForm1 = class(TForm)
        GroupBox1: TGroupBox;
        GroupBox2: TGroupBox;
        Label1: TLabel;
        Label2: TLabel;
        Label3: TLabel;
        Label4: TLabel;
        Label5: TLabel;
        Label6: TLabel;
        GroupBox3: TGroupBox;
        KRTCPConnector1: TKRTCPConnector;
        KRModbusMaster1: TKRModbusMaster;
        KRModbusClient1: TKRModbusClient;
        USred: TKRMBRegister;
        TUpdateForm: TTimer;
        Edit1: TEdit;
        Edit2: TEdit;
        Edit3: TEdit;
        Button1: TButton;
        ISred: TKRMBRegister;
        PSred: TKRMBRegister;
        Label7: TLabel;
        Label8: TLabel;
        Label9: TLabel;
        FDC: TFDConnection;
        QTemp: TFDQuery;
        CheckBox1: TCheckBox;
        Label10: TLabel;
        Label11: TLabel;
        Label12: TLabel;
        U1: TKRMBRegister;
        U2: TKRMBRegister;
        U3: TKRMBRegister;
        Label13: TLabel;
        GroupBox4: TGroupBox;
        Label14: TLabel;
        Label15: TLabel;
        Label16: TLabel;
        Label17: TLabel;
        GroupBox5: TGroupBox;
        P: TLabel;
        Label18: TLabel;
        Label19: TLabel;
        Label20: TLabel;
        I1: TKRMBRegister;
        I2: TKRMBRegister;
        I3: TKRMBRegister;
        P1: TKRMBRegister;
        P2: TKRMBRegister;
        P3: TKRMBRegister;
    QComm: TFDQuery;
    TComm: TTimer;
        procedure TUpdateFormTimer(Sender: TObject);
        procedure Button1Click(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TCommTimer(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
        procedure saveini;
        procedure restoreini;
    end;

var
    Form1    : TForm1;
    Activated: Boolean;

Const
    RazU = -1;
    RazI = -2;
    RazP = -1;

var
    prevstat: Boolean;

implementation

{$R *.dfm}

procedure TForm1.saveini;
var
    i: tinifile;
    t: integer;
begin
    try
        i := tinifile.Create(extractfilepath(paramstr(0)) + 'SELSPEC.INI');
        i.WriteString('ELSPEC', 'IP', Edit1.Text);
        i.WriteString('ELSPEC', 'PORT', Edit2.Text);
        i.WriteString('ELSPEC', 'ID', Edit3.Text);
        t := Form1.Left;
        i.WriteInteger('POSITION', 'LEFT', t);
        t := Form1.Top;
        i.WriteInteger('POSITION', 'TOP', t);
        i.free;
    except
        on e: exception do
            e := NIL;
    end;
end;

procedure TForm1.restoreini;
var
    i: tinifile;
begin
    i := tinifile.Create(extractfilepath(paramstr(0)) + 'SELSPEC.INI');
    Edit1.Text := i.ReadString('ELSPEC', 'IP', '127.0.0.1');
    Edit2.Text := i.ReadString('ELSPEC', 'PORT', '502');
    Edit3.Text := i.ReadString('ELSPEC', 'ID', '159');

    Form1.Left := i.ReadInteger('POSITION', 'LEFT', 10);
    Form1.Top  := i.ReadInteger('POSITION', 'TOP', 10);
    Form1.Repaint;
    i.free;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
    KRTCPConnector1.IP     := Edit1.Text;
    KRTCPConnector1.Port   := StrtoInt(Edit2.Text);
    KRModbusClient1.Addres := StrtoInt(Edit3.Text);

    // ----------------------------
    Activated := false;
    // KRTimer1.Enabled                             := false;
    KRModbusClient1.Active := false;
    KRModbusMaster1.Active := false;
    KRTCPConnector1.Active := false;
    KRTCPConnector1.IP     := Edit1.Text;
    { KRTCPConnector1.Port                         := strtoint(Edit2.Text);
      KRModbusClient1.Addres                       := strtoint(Edit3.Text);
      KRTCPConnector1.Interval                     := strtoint(Edit14.Text);
      KRTCPConnector1.ReadTimeout                  := strtoint(Edit15.Text);
    }
    KRTCPConnector1.Active := True;
    // KRModbusMaster1.Connector.OnConnectionStatus :=
    // KRTCPConnector1ConnectionStatus;
    KRModbusMaster1.Connector.Active := True;
    KRModbusMaster1.Active           := True;
    KRModbusClient1.Active           := True;
    // KRTimer1.Enabled                 := True;
    Activated := True;
    // --------------------------------

end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    saveini;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

    TUpdateForm.Enabled := false;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    restoreini;
    prevstat := false;

    Button1.Click;
end;

procedure TForm1.TCommTimer(Sender: TObject);
begin
 QComm.SQL.Clear;
 QComm.SQL.Add('select * from command where command =''10'' or command=''11''');
 QComm.Open;
 if QComm.FieldByName('command').Asstring='11' then // start
  begin

   QComm.Close;
   QComm.SQL.Clear;
   QComm.SQL.Add('delete from command where command =''10'' or command=''11''');
   QComm.ExecSQL;
  end;
 if QComm.FieldByName('command').Asstring='10' then// stop
  begin

   QComm.Close;
   QComm.SQL.Clear;
   QComm.SQL.Add('delete from command where command =''10'' or command=''11''');
   QComm.ExecSQL;
  end;

  QComm.Close;
end;

procedure TForm1.TUpdateFormTimer(Sender: TObject);
begin
    Label4.Caption := Floattostr(Simpleroundto(USred.Value, RazU));
    Label5.Caption := Floattostr(Simpleroundto(ISred.Value, RazI));
    Label6.Caption := Floattostr(Simpleroundto(PSred.Value, RazP));
    if CheckBox1.Checked then
    begin
        Label10.Caption := Floattostr(Simpleroundto(U1.Value, RazU));
        Label11.Caption := Floattostr(Simpleroundto(U2.Value, RazU));
        Label12.Caption := Floattostr(Simpleroundto(U3.Value, RazU));

        Label15.Caption := Floattostr(Simpleroundto(I1.Value, RazI));
        Label16.Caption := Floattostr(Simpleroundto(I2.Value, RazI));
        Label17.Caption := Floattostr(Simpleroundto(I3.Value, RazI));

        Label18.Caption := Floattostr(Simpleroundto(P1.Value, RazP));
        Label19.Caption := Floattostr(Simpleroundto(P2.Value, RazP));
        Label20.Caption := Floattostr(Simpleroundto(P3.Value, RazP));
    end;
    QTemp.ParamByName('u').AsFloat := Simpleroundto(USred.Value, RazU);
    QTemp.ParamByName('i').AsFloat := Simpleroundto(USred.Value, RazI);
    QTemp.ParamByName('p').AsFloat := Simpleroundto(USred.Value, RazP);

    QTemp.ParamByName('u1').AsFloat := Simpleroundto(U1.Value, RazU);
    QTemp.ParamByName('u2').AsFloat := Simpleroundto(U2.Value, RazU);
    QTemp.ParamByName('u3').AsFloat := Simpleroundto(U3.Value, RazU);

    QTemp.ParamByName('i1').AsFloat := Simpleroundto(I1.Value, RazI);
    QTemp.ParamByName('i2').AsFloat := Simpleroundto(I2.Value, RazI);
    QTemp.ParamByName('i3').AsFloat := Simpleroundto(I3.Value, RazI);

    QTemp.ParamByName('p1').AsFloat := Simpleroundto(P1.Value, RazP);
    QTemp.ParamByName('p2').AsFloat := Simpleroundto(P2.Value, RazP);
    QTemp.ParamByName('p3').AsFloat := Simpleroundto(P3.Value, RazP);

    QTemp.ParamByName('id').AsFloat   := 0;
    QTemp.ParamByName('dop').AsString := '';
    QTemp.ExecSQL;

    if KRTCPConnector1.Stat = cstConnected <> prevstat then
    begin
        if KRTCPConnector1.Stat = cstConnected then
        begin
            // StatusBar1.Panels[1].Text := 'янедхмем';
            // StatusBar1.Panels[2].Text := KRTCPConnector1.IP + ':' +
            // inttostr(KRTCPConnector1.Port) + '@' +
            // inttostr(KRModbusClient1.Addres);
            Edit1.Color      := clGreen;
            Edit1.Font.Color := clWhite;
            Edit2.Color      := clGreen;
            Edit2.Font.Color := clWhite;
            Edit3.Color      := clGreen;
            Edit3.Font.Color := clWhite;
            prevstat         := KRTCPConnector1.Stat = cstConnected;
        end
        else
        begin
            // StatusBar1.Panels[1].Text := 'мер янедхмемхъ';
            // StatusBar1.Panels[2].Text := KRTCPConnector1.IP + ':' +
            // inttostr(KRTCPConnector1.Port) + '@' +
            // inttostr(KRModbusClient1.Addres);
            Edit1.Color      := clRed;
            Edit1.Font.Color := clWhite;
            Edit2.Color      := clRed;
            Edit2.Font.Color := clWhite;
            Edit3.Color      := clRed;
            Edit3.Font.Color := clWhite;
            prevstat         := KRTCPConnector1.Stat = cstConnected;
        end;
    end;
end;

end.
