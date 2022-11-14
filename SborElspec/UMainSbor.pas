unit UMainSbor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, KRComponentCollection, KRVariables,
  KRModbusClient, KRModbusMaster, KRConnector, KRTCPConnector, Vcl.StdCtrls,
  Vcl.ExtCtrls, Math, UAdd, IniFiles;

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
    procedure TUpdateFormTimer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure saveini;
    procedure restoreini;
  end;

var
  Form1    : TForm1;
  Activated: boolean;

Const
  RazU = -1;
  RazI = -2;
  RazP = -1;

var
  prevstat: boolean;

implementation

{$R *.dfm}

procedure TForm1.saveini;
var
  i: tinifile;
begin
  i := tinifile.Create(extractfilepath(paramstr(0)) + 'SELSPEC.INI');
  i.WriteString('ELSPEC', 'IP', Edit1.Text);
  i.ReadString('ELSPEC', 'PORT', Edit2.Text);
  i.ReadString('ELSPEC', 'ID', Edit3.Text);

  i.free;
end;

procedure TForm1.restoreini;
var
  i: tinifile;
begin
  i          := tinifile.Create(extractfilepath(paramstr(0)) + 'SELSPEC.INI');
  Edit1.Text := i.ReadString('ELSPEC', 'IP', '127.0.0.1');
  Edit2.Text := i.ReadString('ELSPEC', 'PORT', '502');
  Edit3.Text := i.ReadString('ELSPEC', 'ID', '159');

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

procedure TForm1.FormCreate(Sender: TObject);
begin
  restoreini;
  prevstat := false;

  Button1.Click;
end;

procedure TForm1.TUpdateFormTimer(Sender: TObject);
begin
  Label4.Caption := Floattostr(Simpleroundto(USred.Value, RazU));
  Label5.Caption := Floattostr(Simpleroundto(ISred.Value, RazI));
  Label6.Caption := Floattostr(Simpleroundto(PSred.Value, RazP));
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
