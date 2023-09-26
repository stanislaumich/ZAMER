unit Umain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls,
  Vcl.ExtCtrls, inifiles, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, KRComponentCollection, KRVariables,
  KRModbusClient, KRModbusMaster, KRConnector, KRTCPConnector, Math,
  FireDAC.Phys.Oracle, FireDAC.Phys.OracleDef, CPortCtl, CPort,
  System.Actions,
  Vcl.ActnList;

CONST
  RAZU = -2;
  FormatU = '0.00';
  RAZI = -3;
  FormatI = '0.000';
  RAZP = -1;
  FormatP = '0.0';

type
  TFMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    StatusBar1: TStatusBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ConLite: TFDConnection;
    QLite: TFDQuery;
    QIni: TFDQuery;
    CheckBox1: TCheckBox;
    BitBtn3: TBitBtn;
    TUpd: TTimer;
    KRTCPConnector1: TKRTCPConnector;
    KRModbusMaster1: TKRModbusMaster;
    KRModbusClient1: TKRModbusClient;
    U: TKRMBRegister;
    I: TKRMBRegister;
    P: TKRMBRegister;
    QTemp: TFDQuery;
    U1: TKRMBRegister;
    U2: TKRMBRegister;
    U3: TKRMBRegister;
    I1: TKRMBRegister;
    I2: TKRMBRegister;
    I3: TKRMBRegister;
    P1: TKRMBRegister;
    P2: TKRMBRegister;
    P3: TKRMBRegister;
    QtmpUpd: TFDQuery;
    ConOra: TFDConnection;
    QTempIns: TFDQuery;
    T1: TKRMBRegister;
    T2: TKRMBRegister;
    T3: TKRMBRegister;
    T4: TKRMBRegister;
    QTempOra: TFDQuery;
    Tstart: TTimer;
    Label7: TLabel;
    Edit1: TEdit;
    Label8: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Com: TComPort;
    Button7: TButton;
    Edit2: TEdit;
    Label9: TLabel;
    Button8: TButton;
    TimerCom: TTimer;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    ComComboBox1: TComboBox;
    ActionList1: TActionList;
    Action3: TAction;
    Panel4: TPanel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    Label10: TLabel;
    Label12: TLabel;

    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    function GetIni(s: string): string;
    procedure SetIni(s: string; v: string);
    procedure BitBtn3Click(Sender: TObject);
    procedure TUpdTimer(Sender: TObject);
    procedure UReadCallBack(Sender: TObject; var AError: Integer;
      AData: Pointer);
    procedure IReadCallBack(Sender: TObject; var AError: Integer;
      AData: Pointer);
    procedure PReadCallBack(Sender: TObject; var AError: Integer;
      AData: Pointer);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel1MouseEnter(Sender: TObject);
    procedure Panel1MouseLeave(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure TstartTimer(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure TimerComTimer(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure ComAfterOpen(Sender: TObject);
    procedure ComAfterClose(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
  private
    procedure GetData(var MessageData: TWMCopyData); message WM_COPYDATA;
  public
    CURRPribor: string;
    procedure set_params;
    procedure get_params;
    procedure WriteUp;
    procedure WriteDown;
    procedure WriteZero;
    procedure Log(s:string);
  end;




var
  FMain: TFMain;
  ur, u1r, u2r, u3r, ir, i1r, i2r, i3r, pr, p1r, p2r, p3r: Integer;
  sText: array [0 .. 99] of Char;
  prevstat, Activated: Boolean;
  act: Integer;
  S1, S3: String;

  // *********/ ���������� �������
  Maxsred : integer;
  Nsred: Integer; // �������
  Asred: array [1 .. 50] of real; // ��� ������
  Rsred: real; // ����������� ������� dU
  // *********/

  pU: real;
  STEP_MS, STOP_MS, Auto_start_reg_after_volt: Integer;

  press: Integer;
  // ��� ���������� ������� ����������� ������ ���������� � ����������
  // ���� ����������� � 1 �� ������� ������ ���� ����, ���� � 0 - �� ���
  // ����� ������� ����� ����������� ����

implementation

{$R *.dfm}

uses USett;

procedure TFMain.Log(s:string);
 begin
  FSett.Memo1.Lines.Add(s);
 end;

procedure TFMain.WriteUp;
begin
  Com.WriteStr('2');
  FSett.Memo1.Lines.Add('��� ������ ');
  BitBtn4.Caption := '<������>';
  BitBtn4.Font.Color := clRed;
  BitBtn5.Caption := '������';
  BitBtn5.Font.Color := clBlue;
end;

procedure TFMain.WriteDown;
begin
  Com.WriteStr('1');
  FSett.Memo1.Lines.Add('��� ������ ');
  BitBtn5.Caption := '<������>';
  BitBtn5.Font.Color := clRed;
  BitBtn4.Caption := '������';
  BitBtn4.Font.Color := clBlue;
end;

procedure TFMain.WriteZero;
begin
  Com.WriteStr('0');
  FSett.Memo1.Lines.Add('��� ���� ');
  BitBtn5.Caption := '������';
  BitBtn5.Font.Color := clBlue;
  BitBtn4.Caption := '������';
  BitBtn4.Font.Color := clBlue;
end;

// ***************************************************************************** Message
procedure TFMain.GetData(var MessageData: TWMCopyData);
var
  s: string;
   t, t1,t2,t3:integer;

begin
  StrLCopy(sText, MessageData.CopyDataStruct.lpData,
    MessageData.CopyDataStruct.cbData);
  s := sText;
  if s[1] = '1' then
  begin
      Com.Open;
      t1:=strtoint(s[2]);
      t2:=strtoint(s[3]);
      t3:=strtoint(s[4]);
      t:=t1*100+t2*10+t3;
      //showmessage(inttostr(t));
      Edit1.Text:=inttostr(t);


    CheckBox1.Checked := true;
    CheckBox1.Caption := '���� ������';
    Panel2.Color := clGreen;
    // ***********************
     BitBtn7.Click;
    // ***********************
    MessageData.Result := 1;
  end;
  if s[1] = '2' then
  begin
      t1:=strtoint(s[2]);
      t2:=strtoint(s[3]);
      t3:=strtoint(s[4]);
      t:=t1*100+t2*10+t3;
      //showmessage(inttostr(t));
      Edit1.Text:=inttostr(t);
    CheckBox1.Checked := false;
    CheckBox1.Caption := '����������';
    Panel2.Color := clbtnface;
    // ***********************
     BitBtn7.Click;
    // ***********************
    MessageData.Result := 1;
  end;
end;

// ***************************************************************************** Message
procedure TFMain.SetIni(s: string; v: string);
begin
  QLite.Close;
  QLite.sql.Clear;
  QLite.sql.Add('update ini set val=' + QUotedstr(v) + ' where name=' +
    QUotedstr(s));
  QLite.ExecSQL;
end;


function getsred(s:real):real;
 var
  i:integer;
  res:real;
 begin
  // *********/ ���������� �������
  // Maxsred:integer // ����� ���������
  // Nsred:integer;// �������
  // Asred:array[1..Maxsred] of real;// ��� ������
  // Rsred:real;// ����������� ������� dU
  // *********/
  Nsred:=Nsred+1;
  if Nsred>Maxsred then Nsred:=1;
  Asred[Nsred]:=s;
  res:=0;
  for i:=1 to Maxsred do res:=res+Asred[i];
  res:=res/Maxsred;
  getsred:=res;
 end;

 procedure initsred(f:real);
  var
   i:integer;
  begin
   NSred:=1;
   for I := 1 to maxsred do Asred[i]:=f;
  end;


procedure TFMain.TimerComTimer(Sender: TObject);
var
  dU, cU: single;
  P: Integer;
  s: string;
begin
  // *********/ ���������� �������
  // Nsred:integer;// �������
  // Asred:array[1..Maxsred] of real;// ��� ������
  // Rsred:real;// ����������� ������� dU
  // *********/
  if strtofloat(Label1.Caption)<10 then
   begin
    WriteZero;
    Exit;
   end;

  if not Com.Connected then
  begin
    TimerCom.Enabled := false;
    Label10.Visible := false;
    ShowMessage('���� �� ��������');
    Exit;
  end;

  Edit2.Text := StringReplace(Edit2.Text, '.', ',',
    [rfReplaceAll, rfIgnoreCase]);
  if Edit1.Text = '' then
    Edit1.Text := '2';

  cU := strtofloat(Label1.Caption);

  dU := cU - strtofloat(Edit1.Text);
   if dU<strtofloat(edit2.text) then initsred(du);

  dU:=getsred(dU);
  StatusBar1.Panels[3].Text := 'dU=' + floattostr(dU);
  fsett.memo1.lines.Add(floattostr(dU));

    if dU<-1*strtofloat(S3) then
    begin // ���������� ����� ����� ��� �� S3
    // �������� ��� �������� ���� �� ������� � �������� S3
    Exit;// �� ������� � �����
    end
    else
    begin //�� ���������, ���������� � ��������
    pU:=cU;
    end;

  if abs(dU) > strtofloat(S1) { ������� ��� }
  then
  begin { ������� ��� }
    if dU > 0 then { ���� ��������� ��� ������ ��� }
    begin
      WriteDown;
    end
    else
    begin { ���� ��������� }
      WriteUp;
    end;
  end { ����� �������� ���� }
  else { ����� ��� ��� ���� }
  begin
    if abs(dU) > strtofloat(Edit2.Text)
    { ��� ��� �� ������ - ����� ��� }
    then
    begin
      if dU > 0 then { ��������� ����� }
      begin
        TimerCom.Enabled := false;
        WriteDown;
        Sleep(STEP_MS);
        WriteZero;
        TimerCom.Enabled := true;
      end;
      if dU < 0 then { ������� ����� }
      begin { ���� ��������� }
        TimerCom.Enabled := false;
        WriteUp;
        Sleep(STEP_MS);
        WriteZero;
        TimerCom.Enabled := true;
      end;
      Sleep(STOP_MS);
    end
    else { ������ � ����������� }
    begin
      BitBtn6.Click; // 6
      Com.WriteStr('4');
    end;
  end;

end;

procedure TFMain.TstartTimer(Sender: TObject);
begin
  Tstart.Enabled := false;
  BitBtn3.Click;
end;

procedure TFMain.TUpdTimer(Sender: TObject);
begin
  Label1.Caption := FormatFloat(FormatU, Roundto(U.Value, RAZU));
  Label2.Caption := FormatFloat(FormatI, Roundto(I.Value, RAZI));
  Label3.Caption := FormatFloat(FormatP, Roundto(P.Value, RAZP));
  if fsett.Visible then
  begin
    fsett.Label7.Caption := FormatFloat(FormatU, Simpleroundto(U1.Value, RAZU));
    fsett.Label8.Caption := FormatFloat(FormatU, Simpleroundto(U2.Value, RAZU));
    fsett.Label9.Caption := FormatFloat(FormatU, Simpleroundto(U3.Value, RAZU));

    fsett.Label10.Caption := FormatFloat(FormatI,
      Simpleroundto(I1.Value, RAZI));
    fsett.Label11.Caption := FormatFloat(FormatI,
      Simpleroundto(I2.Value, RAZI));
    fsett.Label12.Caption := FormatFloat(FormatI,
      Simpleroundto(I3.Value, RAZI));

    fsett.Label13.Caption := FormatFloat(FormatP,
      Simpleroundto(P1.Value, RAZP));
    fsett.Label14.Caption := FormatFloat(FormatP,
      Simpleroundto(P2.Value, RAZP));
    fsett.Label15.Caption := FormatFloat(FormatP,
      Simpleroundto(P3.Value, RAZP));

  end;

  QtmpUpd.ParamByName('u').AsFloat := Simpleroundto(U.Value, RAZU);
  QtmpUpd.ParamByName('i').AsFloat := Simpleroundto(I.Value, RAZI);
  QtmpUpd.ParamByName('p').AsFloat := Simpleroundto(P.Value, RAZP);

  QtmpUpd.ParamByName('u1').AsFloat := Simpleroundto(U1.Value, RAZU);
  QtmpUpd.ParamByName('u2').AsFloat := Simpleroundto(U2.Value, RAZU);
  QtmpUpd.ParamByName('u3').AsFloat := Simpleroundto(U3.Value, RAZU);

  QtmpUpd.ParamByName('i1').AsFloat := Simpleroundto(I1.Value, RAZI);
  QtmpUpd.ParamByName('i2').AsFloat := Simpleroundto(I2.Value, RAZI);
  QtmpUpd.ParamByName('i3').AsFloat := Simpleroundto(I3.Value, RAZI);

  QtmpUpd.ParamByName('p1').AsFloat := Simpleroundto(P1.Value, RAZP);
  QtmpUpd.ParamByName('p2').AsFloat := Simpleroundto(P2.Value, RAZP);
  QtmpUpd.ParamByName('p3').AsFloat := Simpleroundto(P3.Value, RAZP);

  QtmpUpd.ParamByName('dop').Asstring := CURRPribor;
  QtmpUpd.ExecSQL;

  if CheckBox1.Checked then
  begin
    QTempIns.Close;
    QTempIns.ParamByName('u').AsFloat := Simpleroundto(U.Value, RAZU);
    QTempIns.ParamByName('i').AsFloat := Simpleroundto(I.Value, RAZI);
    QTempIns.ParamByName('p').AsFloat := Simpleroundto(P.Value, RAZP);
    QTempIns.ParamByName('u1').AsFloat := Simpleroundto(U1.Value, RAZU);
    QTempIns.ParamByName('u2').AsFloat := Simpleroundto(U2.Value, RAZU);
    QTempIns.ParamByName('u3').AsFloat := Simpleroundto(U3.Value, RAZU);
    QTempIns.ParamByName('i1').AsFloat := Simpleroundto(I1.Value, RAZI);
    QTempIns.ParamByName('i2').AsFloat := Simpleroundto(I2.Value, RAZI);
    QTempIns.ParamByName('i3').AsFloat := Simpleroundto(I3.Value, RAZI);
    QTempIns.ParamByName('p1').AsFloat := Simpleroundto(P1.Value, RAZP);
    QTempIns.ParamByName('p2').AsFloat := Simpleroundto(P2.Value, RAZP);
    QTempIns.ParamByName('p3').AsFloat := Simpleroundto(P3.Value, RAZP);
    QTempIns.ParamByName('id').AsFloat := 0;
    QTempIns.ParamByName('dop').Asstring := CURRPribor;
    QTempIns.ExecSQL;
  end;
  if KRTCPConnector1.Stat = cstConnected <> prevstat then
  begin
    if KRTCPConnector1.Stat = cstConnected then
    begin
      Panel1.Color := clGreen;
      Panel1.Font.Color := clWhite;
      Panel1.Caption := '    ��������';
      StatusBar1.Panels[0].Text := '��������';
      prevstat := KRTCPConnector1.Stat = cstConnected;
    end
    else
    begin
      Panel1.Color := clRed;
      Panel1.Font.Color := clBlack;
      Panel1.Caption := '  ����������';
      StatusBar1.Panels[0].Text := '����������';
      prevstat := KRTCPConnector1.Stat = cstConnected;
    end;
  end;

end;

procedure TFMain.UReadCallBack(Sender: TObject; var AError: Integer;
  AData: Pointer);
begin
  // Label1.Caption := FormatFloat('0.00', roundto(U.Value, RazU));
end;

function TFMain.GetIni(s: string): string;
begin
  QIni.Close;
  QIni.ParamByName('name').Asstring := s;
  QIni.Open;
  if QIni.RecordCount <> 0 then
    GetIni := QIni.FieldByName('val').Asstring
  else
  begin
    QLite.Close;
    QLite.sql.Clear;
    QLite.sql.Add('insert into ini (name, val,dop) values(' + QUotedstr(s) + ','
      + QUotedstr('0') + ',' + QUotedstr('AUTO') + ');');
    QLite.ExecSQL;
    GetIni := '0';
  end;
end;

procedure TFMain.IReadCallBack(Sender: TObject; var AError: Integer;
  AData: Pointer);
begin
  // Label2.Caption := FormatFloat('0.00', roundto(I.Value, RazI));
end;

procedure TFMain.Panel1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SysCommand, $F012, 0);
end;

procedure TFMain.Panel1MouseEnter(Sender: TObject);
begin
  Cursor := crSizeAll;
end;

procedure TFMain.Panel1MouseLeave(Sender: TObject);
begin
  Cursor := crDefault;
end;

procedure TFMain.PReadCallBack(Sender: TObject; var AError: Integer;
  AData: Pointer);
begin
  // Label3.Caption := FormatFloat('0.00', roundto(P.Value, RazP));
end;

procedure TFMain.Action1Execute(Sender: TObject);
begin
  BitBtn4.Click;
end;

procedure TFMain.Action2Execute(Sender: TObject);
begin
  BitBtn5.Click;
end;

procedure TFMain.Action3Execute(Sender: TObject);
begin
  BitBtn6.Click;
end;

procedure TFMain.BitBtn1Click(Sender: TObject);
begin
  fsett.ShowModal;
end;

procedure TFMain.BitBtn2Click(Sender: TObject);
begin
  FMain.Close;
end;

procedure TFMain.BitBtn3Click(Sender: TObject);
begin
  KRTCPConnector1.IP := GetIni('CURR_IP');
  KRTCPConnector1.Port := Strtoint(GetIni('CURR_PORT'));
  KRModbusClient1.Addres := Strtoint(GetIni('CURR_ID'));
  Activated := false;
  KRModbusClient1.Active := false;
  KRModbusMaster1.Active := false;
  KRTCPConnector1.Active := false;
  KRTCPConnector1.IP := GetIni('CURR_IP');

  QTemp.Close;
  QTemp.sql.Clear;
  QTemp.sql.Add('select Dop from ini where name=' + QUotedstr('CURR_IP'));
  QTemp.Open;
  CURRPribor := QTemp.FieldByName('dop').Asstring;
  QTemp.Close;
  QTemp.sql.Clear;
  QTemp.sql.Add('select * from pribor where name=' + QUotedstr(CURRPribor));
  QTemp.Open;

  U.RegisterIndex := QTemp.FieldByName('U').AsInteger;
  U1.RegisterIndex := QTemp.FieldByName('U1').AsInteger;
  U2.RegisterIndex := QTemp.FieldByName('U2').AsInteger;
  U3.RegisterIndex := QTemp.FieldByName('U3').AsInteger;
  I.RegisterIndex := QTemp.FieldByName('I').AsInteger;
  I1.RegisterIndex := QTemp.FieldByName('I1').AsInteger;
  I2.RegisterIndex := QTemp.FieldByName('I2').AsInteger;
  I3.RegisterIndex := QTemp.FieldByName('I3').AsInteger;
  P.RegisterIndex := QTemp.FieldByName('P').AsInteger;
  P1.RegisterIndex := QTemp.FieldByName('P1').AsInteger;
  P2.RegisterIndex := QTemp.FieldByName('P2').AsInteger;
  P3.RegisterIndex := QTemp.FieldByName('P3').AsInteger;
  KRTCPConnector1.Active := true;
  KRModbusMaster1.Connector.Active := true;
  KRModbusMaster1.Active := true;
  KRModbusClient1.Active := true;
  Activated := true;
end;

procedure TFMain.BitBtn4Click(Sender: TObject);
begin
  try
    if Not Com.Connected then
      Com.Open;
  except
    On e: exception do
    begin
      ShowMessage('���������� ������� ����, ��������� ���������');
      Exit;
    end;
  end;

  if press = 0 then
  begin
    if act <> 2 then
    begin
      WriteZero;
      WriteUp;
      BitBtn4.Caption := '<������>';
      BitBtn4.Font.Color := clRed;
      act := 2;
      StatusBar1.Panels[1].Text := '������';
    end
    else
      act := 0;
    press := 1;
  end
  else
  begin
    WriteZero;
    BitBtn4.Caption := '������';
    BitBtn4.Font.Color := clBlue;
    StatusBar1.Panels[1].Text := '����';
    press := 0;
    act := 0;
  end;
end;

procedure TFMain.BitBtn5Click(Sender: TObject);
begin
  try
    if Not Com.Connected then
      Com.Open;
  except
    On e: exception do
    begin
      ShowMessage('���������� ������� ����, ��������� ���������');
      Exit;
    end;
  end;
  if press = 0 then
  begin
    if act <> 1 then
    begin
      WriteZero;
      WriteDown;
      BitBtn5.Caption := '<������>';
      BitBtn5.Font.Color := clRed;
      act := 1;
      StatusBar1.Panels[1].Text := '������';
    end
    else
      act := 0;
    press := 1;
  end
  else
  begin
    WriteZero;
    BitBtn5.Caption := '������';
    BitBtn5.Font.Color := clBlue;
    StatusBar1.Panels[1].Text := '����';
    press := 0;
    act := 0;
  end;
end;

procedure TFMain.BitBtn6Click(Sender: TObject);
begin
  Com.WriteStr('0');
  act := 0;
  press := 0;
  BitBtn5.Caption := '������';
  BitBtn5.Font.Color := clBlue;
  BitBtn4.Caption := '������';
  BitBtn4.Font.Color := clBlue;
  StatusBar1.Panels[1].Text := '����';
end;

procedure TFMain.BitBtn7Click(Sender: TObject);
begin
  Label10.Visible := true;
  try
    if Not Com.Connected then
      Com.Open;
  except
    On e: exception do
    begin
      ShowMessage('���������� ������� ����, ��������� ���������');
      Exit;
    end;
  end;
  CheckBox1.Caption := '���� ������';
  TimerCom.Enabled := true;
  // StatusBar1.Panels[2].Text := inttostr(STEP_MS) + '/' + inttostr(STOP_MS);
end;

procedure TFMain.BitBtn8Click(Sender: TObject);
begin
  Label10.Visible := false;
  CheckBox1.Caption := '����������';
  TimerCom.Enabled := false;
  // StatusBar1.Panels[2].Text:=''
  BitBtn6.Click;
end;

procedure TFMain.Button1Click(Sender: TObject);
begin
  Edit1.Text := Button1.Caption;
  act := 0;
  SetIni('LAST', Edit1.Text);
  if Auto_start_reg_after_volt = 1 then
    BitBtn7.Click;

end;

procedure TFMain.Button2Click(Sender: TObject);
begin
  Edit1.Text := Button2.Caption;
  act := 0;
  SetIni('LAST', Edit1.Text);
end;

procedure TFMain.Button3Click(Sender: TObject);
begin
  Edit1.Text := Button3.Caption;
  act := 0;
  SetIni('LAST', Edit1.Text);
  if Auto_start_reg_after_volt = 1 then
    BitBtn7.Click;
end;

procedure TFMain.Button4Click(Sender: TObject);
begin
  Edit1.Text := Button4.Caption;
  act := 0;
  SetIni('LAST', Edit1.Text);
  if Auto_start_reg_after_volt = 1 then
    BitBtn7.Click;
end;

procedure TFMain.Button5Click(Sender: TObject);
begin
  Edit1.Text := Button5.Caption;
  act := 0;
  SetIni('LAST', Edit1.Text);
  if Auto_start_reg_after_volt = 1 then
    BitBtn7.Click;
end;

procedure TFMain.Button6Click(Sender: TObject);
begin
  Edit1.Text := Button6.Caption;
  act := 0;
  SetIni('LAST', Edit1.Text);
  if Auto_start_reg_after_volt = 1 then
    BitBtn7.Click;
end;

procedure TFMain.Button7Click(Sender: TObject);
var
  s: string;
begin
  Com.ShowSetupDialog;
  ComComboBox1.Text := Com.Port;
  try
    Com.Open;
    Com.WriteStr('5');
    Com.ReadStr(s, 1);
    if length(s) > 0 then
    begin
      ShowMessage('��������� ������ - ' + s);
    end
    else
    begin
      ShowMessage('������ �� �������');
    end;
    Com.Close;
  except
    on e: exception do
    begin
      ShowMessage('������ �������� �����');
    end;
  end;
end;

procedure TFMain.Button8Click(Sender: TObject);
begin
  // Com.BaudRate:=
  Com.Port := ComComboBox1.Text;
  Com.Open;
  // TimerCom.Enabled := true;
end;

procedure TFMain.ComAfterClose(Sender: TObject);
begin
  Panel4.Color := clRed;
end;

procedure TFMain.ComAfterOpen(Sender: TObject);
begin
  Panel4.Color := clGreen;
end;

procedure TFMain.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    CheckBox1.Caption := '���� ������';
    TimerCom.Enabled := true;
  end
  else
  begin
    CheckBox1.Caption := '����������';
    TimerCom.Enabled := false;;
  end;
end;

procedure TFMain.set_params;
begin
  SetIni('LEFT', inttostr(FMain.Left));
  SetIni('TOP', inttostr(FMain.Top));
  SetIni('COMPORT', Com.Port);

  SetIni('LAST', Edit1.Text);
  SetIni('dU', Edit2.Text);
  SetIni('S1', S1);
  SetIni('S3', S3);
  SetIni('FACTOR',inttostr(Maxsred));
  SetIni('STEP_MS', inttostr(STEP_MS));
  SetIni('STOP_MS', inttostr(STOP_MS));
  SetIni('COMSPEED',BaudRateToStr(Com.BaudRate));
  SetIni('AUTO_REG_VOLT', inttostr(Auto_start_reg_after_volt));

end;

procedure TFMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Com.Close;
  CheckBox1.Checked := false;
  KRModbusClient1.Active := false;
  KRModbusMaster1.Active := false;
  KRTCPConnector1.Active := false;

  set_params;

  ConLite.Connected := false;
end;

procedure TFMain.get_params;
begin
  FMain.Left := Strtoint(GetIni('LEFT'));
  FMain.Top := Strtoint(GetIni('TOP'));
  ComComboBox1.Text := GetIni('COMPORT');
  Com.BaudRate:=StrtoBaudRate(GetIni('COMSPEED'));
  Com.Port := ComComboBox1.Text;
  Edit1.Text := GetIni('LAST');
  Button1.Caption := GetIni('B1');
  Button2.Caption := GetIni('B2');
  Button3.Caption := GetIni('B3');
  Button4.Caption := GetIni('B4');
  Button5.Caption := GetIni('B5');
  Button6.Caption := GetIni('B6');

  Edit2.Text := GetIni('dU');
  S1 := GetIni('S1');
  S3 := GetIni('S3');
  Maxsred :=StrtoInt(GetIni('FACTOR'));
  STEP_MS := Strtoint(GetIni('STEP_MS'));
  STOP_MS := Strtoint(GetIni('STOP_MS'));

  Auto_start_reg_after_volt := Strtoint(GetIni('AUTO_REG_VOLT'));
  StatusBar1.Panels[2].Text := 'STEP/STOP=' + inttostr(STEP_MS) + '/' +
    inttostr(STOP_MS) + ' | AUTOREG=' + inttostr(Auto_start_reg_after_volt);

end;

procedure TFMain.FormCreate(Sender: TObject);
begin
  ConLite.Params.Database := Extractfilepath(Application.ExeName) +
    'SborUIP.sqlite';

  ConLite.Connected := true;
  QLite.sql.Add
    ('CREATE TABLE IF NOT EXISTS pribor ( name VARCHAR (100) PRIMARY KEY  UNIQUE, ');
  QLite.sql.Add
    ('u    INTEGER,     u1   INTEGER,     u2   INTEGER,     u3   INTEGER, ');
  QLite.sql.Add
    ('i    INTEGER,     i1   INTEGER,     i2   INTEGER,      i3   INTEGER, ');
  QLite.sql.Add
    ('p    INTEGER,     p1   INTEGER,     p2   INTEGER,      p3   INTEGER,  ');
  QLite.sql.Add
    ('t    INTEGER,     t1   INTEGER,     t2   INTEGER,      t3   INTEGER);  ');
  QLite.ExecSQL;
  QLite.Close;
  QLite.sql.Clear;
  QLite.sql.Add
    ('CREATE TABLE IF NOT EXISTS ini ( name VARCHAR (100) PRIMARY KEY  UNIQUE, ');
  QLite.sql.Add('   val    varchar(1000),     dop varchar(1000));');
  QLite.ExecSQL;
  QLite.Close;
  QLite.sql.Clear;
  QLite.sql.Add
    ('CREATE TABLE IF NOT EXISTS Stend ( name   VARCHAR (100) PRIMARY KEY  UNIQUE, ');
  QLite.sql.Add
    ('   pribor VARCHAR (100) REFERENCES pribor (name) ON DELETE NO ACTION, ');
  QLite.sql.Add('   IP     VARCHAR (20), PORT   INTEGER, ID     INTEGER ); ');
  QLite.ExecSQL;
  QLite.Close;
  QLite.sql.Clear;
  QTempOra.Close;
  QTempOra.sql.Clear;
  QTempOra.sql.Add('Update zini set value=' + QUotedstr(FMain.Caption) +
    ' where name=' + QUotedstr('ElspecFormHeader'));
  QTempOra.ExecSQL;
  QTempOra.Close;

  get_params;

  FMain.Repaint;
  prevstat := false;
  // BitBtn3.Click;
end;

end.
