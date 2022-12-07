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
    GroupBox6: TGroupBox;
    CheckBox2: TCheckBox;
    QT: TFDQuery;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    CheckBox3: TCheckBox;
    QtmpUpd: TFDQuery;
    procedure TUpdateFormTimer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TCommTimer(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure GroupBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GroupBox3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GroupBox4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GroupBox5Click(Sender: TObject);
    procedure GroupBox5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GroupBox3MouseEnter(Sender: TObject);
    procedure GroupBox3MouseLeave(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
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
  prevstat         : Boolean;
  FBigLeft, FBigTop: Integer;

implementation

{$R *.dfm}

uses UBig;

procedure TForm1.saveini;
var
  i: tinifile;
  t: Integer;
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
    t := FBig.Left;
    i.WriteInteger('BIG', 'LEFT', t);
    t := FBig.Top;
    i.WriteInteger('BIG', 'TOP', t);

    i.WriteBool('PHASES', 'ON', CheckBox1.Checked);
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
  i          := tinifile.Create(extractfilepath(paramstr(0)) + 'SELSPEC.INI');
  Edit1.Text := i.ReadString('ELSPEC', 'IP', '127.0.0.1');
  Edit2.Text := i.ReadString('ELSPEC', 'PORT', '502');
  Edit3.Text := i.ReadString('ELSPEC', 'ID', '159');
  CheckBox1.Checked := i.ReadBool('PHASES', 'ON', false);
  Form1.Left := i.ReadInteger('POSITION', 'LEFT', 10);
  Form1.Top  := i.ReadInteger('POSITION', 'TOP', 10);
  FBigLeft   := i.ReadInteger('BIG', 'LEFT', 10);
  FBigTop    := i.ReadInteger('BIG', 'TOP', 10);
  Form1.Repaint;
  i.free;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  KRTCPConnector1.IP               := Edit1.Text;
  KRTCPConnector1.Port             := StrtoInt(Edit2.Text);
  KRModbusClient1.Addres           := StrtoInt(Edit3.Text);
  Activated                        := false;
  KRModbusClient1.Active           := false;
  KRModbusMaster1.Active           := false;
  KRTCPConnector1.Active           := false;
  KRTCPConnector1.IP               := Edit1.Text;
  KRTCPConnector1.Active           := True;
  KRModbusMaster1.Connector.Active := True;
  KRModbusMaster1.Active           := True;
  KRModbusClient1.Active           := True;
  Activated                        := True;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    Form1.height     := 740;
    GroupBox1.height := 524;
  end
  else
  begin
    Form1.height     := 353;
    GroupBox1.height := 134;
    Label10.Caption  := '0';
    Label11.Caption  := '0';
    Label12.Caption  := '0';
    Label15.Caption  := '0';
    Label16.Caption  := '0';
    Label17.Caption  := '0';
    Label18.Caption  := '0';
    Label19.Caption  := '0';
    Label20.Caption  := '0';
  end;
end;

procedure TForm1.CheckBox3Click(Sender: TObject);
begin
  FBig.Left := FBigLeft;
  FBig.Top  := FBigTop;
  if CheckBox3.Checked then
    FBig.Show
  else
    FBig.hide;
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
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('Update zini set value=' + Quotedstr(Form1.Caption) +
    ' where name=' + Quotedstr('ElspecFormHeader'));
  QTemp.ExecSQL;
  Button1.Click;
end;

procedure TForm1.GroupBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SysCommand, $F012, 0);
end;

procedure TForm1.GroupBox3MouseLeave(Sender: TObject);
begin
  Cursor := crDefault;
end;

procedure TForm1.GroupBox3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SysCommand, $F012, 0);
end;

procedure TForm1.GroupBox3MouseEnter(Sender: TObject);
begin
  Cursor := crSizeAll;
end;

procedure TForm1.GroupBox4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SysCommand, $F012, 0);
end;

procedure TForm1.GroupBox5Click(Sender: TObject);
begin
  ReleaseCapture;
  Perform(WM_SysCommand, $F012, 0);
end;

procedure TForm1.GroupBox5MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SysCommand, $F012, 0);
end;

procedure TForm1.TCommTimer(Sender: TObject);
begin
  QComm.SQL.Clear;
  QComm.SQL.Add
    ('select * from command where command =''10'' or command=''11''');
  QComm.Open;
  if QComm.FieldByName('command').Asstring = '11' then // start
  begin
    QT.Close;
    QT.SQL.Clear;
    QT.SQL.Add('truncate table zelspec');
    QT.ExecSQL();
    QT.Close;
    QT.SQL.Clear;
    QT.SQL.Add('delete from command where command =''10'' or command=''11''');
    QT.ExecSQL;
    CheckBox2.Checked := True;
  end;
  if QComm.FieldByName('command').Asstring = '10' then // stop
  begin
    CheckBox2.Checked := false;
    QT.Close;
    QT.SQL.Clear;
    QT.SQL.Add('delete from command where command =''10'' or command=''11''');
    QT.ExecSQL;
  end;
  QComm.Close;
end;

procedure TForm1.TUpdateFormTimer(Sender: TObject);
begin
  Label4.Caption := FormatFloat('0.0', Simpleroundto(USred.Value, RazU));
  Label5.Caption := FormatFloat('0.00', Simpleroundto(ISred.Value, RazI));
  Label6.Caption := FormatFloat('0.0', Simpleroundto(PSred.Value, RazP));
  if CheckBox3.Checked then
  begin
    FBig.Label4.Caption := Label4.Caption;
    FBig.Label5.Caption := Label5.Caption;
    FBig.Label6.Caption := Label6.Caption;
  end;
  if CheckBox1.Checked then
  begin
    Label10.Caption := FormatFloat('0.0', Simpleroundto(U1.Value, RazU));
    Label11.Caption := FormatFloat('0.0', Simpleroundto(U2.Value, RazU));
    Label12.Caption := FormatFloat('0.0', Simpleroundto(U3.Value, RazU));

    Label15.Caption := FormatFloat('0.00', Simpleroundto(I1.Value, RazI));
    Label16.Caption := FormatFloat('0.00', Simpleroundto(I2.Value, RazI));
    Label17.Caption := FormatFloat('0.00', Simpleroundto(I3.Value, RazI));

    Label18.Caption := FormatFloat('0.0', Simpleroundto(P1.Value, RazP));
    Label19.Caption := FormatFloat('0.0', Simpleroundto(P2.Value, RazP));
    Label20.Caption := FormatFloat('0.0', Simpleroundto(P3.Value, RazP));
  end;

  QtmpUpd.ParamByName('u').AsFloat := Simpleroundto(USred.Value, RazU);
  QtmpUpd.ParamByName('i').AsFloat := Simpleroundto(ISred.Value, RazI);
  QtmpUpd.ParamByName('p').AsFloat := Simpleroundto(PSred.Value, RazP);

  QtmpUpd.ParamByName('u1').AsFloat := Simpleroundto(U1.Value, RazU);
  QtmpUpd.ParamByName('u2').AsFloat := Simpleroundto(U2.Value, RazU);
  QtmpUpd.ParamByName('u3').AsFloat := Simpleroundto(U3.Value, RazU);

  QtmpUpd.ParamByName('i1').AsFloat := Simpleroundto(I1.Value, RazI);
  QtmpUpd.ParamByName('i2').AsFloat := Simpleroundto(I2.Value, RazI);
  QtmpUpd.ParamByName('i3').AsFloat := Simpleroundto(I3.Value, RazI);

  QtmpUpd.ParamByName('p1').AsFloat := Simpleroundto(P1.Value, RazP);
  QtmpUpd.ParamByName('p2').AsFloat := Simpleroundto(P2.Value, RazP);
  QtmpUpd.ParamByName('p3').AsFloat := Simpleroundto(P3.Value, RazP);

  QtmpUpd.ParamByName('dop').Asstring := '';
  QtmpUpd.ExecSQL;

  if CheckBox2.Checked then
  begin
    QTemp.Close;
    QTemp.SQL.Clear;
    QTemp.SQL.Add
      ('INSERT INTO ZAMER.ZELSPEC (ID, U, I, P, U1, U2,U3, I1, I2, I3, DOP, p1, p2, p3) VALUES '+
      '( :ID ,:u ,:I ,:P ,:U1,:U2,:U3,:I1,:I2,:I3, :DOP,:p1,:p2,:p3)');
    QTemp.ParamByName('u').AsFloat := Simpleroundto(USred.Value, RazU);
    QTemp.ParamByName('i').AsFloat := Simpleroundto(ISred.Value, RazI);
    QTemp.ParamByName('p').AsFloat := Simpleroundto(PSred.Value, RazP);

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
    QTemp.ParamByName('dop').Asstring := '';
    QTemp.ExecSQL;
  end;
  if KRTCPConnector1.Stat = cstConnected <> prevstat then
  begin
    if KRTCPConnector1.Stat = cstConnected then
    begin
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
