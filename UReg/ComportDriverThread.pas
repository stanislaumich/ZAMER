{$A+,B-,C+,D-,E-,F-,G+,H+,I+,J+,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y-,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $51000000}
{$APPTYPE GUI}
unit ComportDriverThread;

interface

uses
  //Include "ExtCtrl" for the TTimer component.
  Windows, Messages, SysUtils, Classes, Forms, ExtCtrls;

type

  TComPortNumber        = (pnCOM1,pnCOM2,pnCOM3,pnCOM4,pnCom5);
  TComPortBaudRate      = (br110,br300,br600,br1200,br2400,br4800,br9600,
                           br14400,br19200,br38400,br56000,br57600,br115200);
  TComPortDataBits      = (db5BITS,db6BITS,db7BITS,db8BITS);
  TComPortStopBits      = (sb1BITS,sb1HALFBITS,sb2BITS);
  TComPortParity        = (ptNONE,ptODD,ptEVEN,ptMARK,ptSPACE);
  TComportHwHandshaking = (hhNONE,hhRTSCTS);
  TComPortSwHandshaking = (shNONE,shXONXOFF);

  TTimerThread   = class(TThread)
  private
    { Private declarations }
    FOnTimer : TThreadMethod;
    FEnabled: Boolean;
  protected
    { Protected declarations }
    procedure Execute; override;
    procedure SupRes;
  public
    { Public declarations }
  published
    { Published declarations }
    property Enabled: Boolean read FEnabled write FEnabled;
  end;

  TComportDriverThread = class(TComponent)
  private
    { Private declarations }
    FTimer         : TTimerThread;
    FOnReceiveData : TNotifyEvent;
    FReceiving     : Boolean;
  public//protected
    { Protected declarations }
    FComPortActive           : Boolean;
    FComportHandle           : THandle;
    FComportNumber           : TComPortNumber;
    FComportBaudRate         : TComPortBaudRate;
    FComportDataBits         : TComPortDataBits;
    FComportStopBits         : TComPortStopBits;
    FComportParity           : TComPortParity;
    FComportHwHandshaking    : TComportHwHandshaking;
    FComportSwHandshaking    : TComPortSwHandshaking;
    FComportInputBufferSize  : Word;
    FComportOutputBufferSize : Word;
    FComportPollingDelay     : Word;
    FTimeOut                 : Integer;
    FTempInputBuffer         : Pointer;
    procedure SetComPortActive(Value: Boolean);
    procedure SetComPortNumber(Value: TComPortNumber);
    procedure SetComPortBaudRate(Value: TComPortBaudRate);
    procedure SetComPortDataBits(Value: TComPortDataBits);
    procedure SetComPortStopBits(Value: TComPortStopBits);
    procedure SetComPortParity(Value: TComPortParity);
    procedure SetComPortHwHandshaking(Value: TComportHwHandshaking);
    procedure SetComPortSwHandshaking(Value: TComPortSwHandshaking);
    procedure SetComPortInputBufferSize(Value: Word);
    procedure SetComPortOutputBufferSize(Value: Word);
    procedure SetComPortPollingDelay(Value: Word);
    procedure ApplyComPortSettings;
    procedure TimerEvent; virtual;
    procedure doDataReceived; virtual;

    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function Connect: Boolean;
    function Disconnect: Boolean;
    function Connected: Boolean;
    function Disconnected: Boolean;
    function SendData(DataPtr: Pointer; DataSize: Integer): Boolean;
    function SendString(Input: String): Boolean;
    function ReadString(var Str: string): Integer;
  published
    { Published declarations }
    property Active: Boolean read FComPortActive write SetComPortActive default False;
    property ComPort: TComPortNumber read FComportNumber write SetComportNumber
                                                         default pnCOM1;
    property ComPortSpeed: TComPortBaudRate read FComportBaudRate write
                           SetComportBaudRate default br9600;
    property ComPortDataBits: TComPortDataBits read FComportDataBits write
                              SetComportDataBits default db8BITS;
    property ComPortStopBits: TComPortStopBits read FComportStopBits write
                              SetComportStopBits default sb1BITS;
    property ComPortParity: TComPortParity read FComportParity write
                            SetComportParity default ptNONE;
    property ComPortHwHandshaking: TComportHwHandshaking read FComportHwHandshaking
                                   write SetComportHwHandshaking default
                                   hhNONE;
    property ComPortSwHandshaking: TComPortSwHandshaking read FComportSwHandshaking
                                   write SetComportSwHandshaking default
                                   shNONE;
    property ComPortInputBufferSize: Word read FComportInputBufferSize
                                     write SetComportInputBufferSize default
                                     2048;
    property ComPortOutputBufferSize: Word read FComportOutputBufferSize
                                      write SetComportOutputBufferSize default
                                      2048;
    property ComPortPollingDelay: Word read FComportPollingDelay write
                                  SetComportPollingDelay default 100;
    property OnReceiveData: TNotifyEvent read FOnReceiveData
                            write FOnReceiveData;
    property TimeOut: Integer read FTimeOut write FTimeOut default 30;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Self-made Components', [TComportDriverThread]);
end;

{ TComportDriver }

constructor TComportDriverThread.Create(AOwner: TComponent);
begin
  inherited;
  FReceiving               := False;
  FComportHandle           := 0;
  FComportNumber           := pnCOM1;
  FComportBaudRate         := br9600;
  FComportDataBits         := db8BITS;
  FComportStopBits         := sb1BITS;
  FComportParity           := ptNONE;
  FComportHwHandshaking    := hhNONE;
  FComportSwHandshaking    := shNONE;
  FComportInputBufferSize  := 2048;
  FComportOutputBufferSize := 2048;
  FOnReceiveData           := nil;
  FTimeOut                 := 30;
  FComportPollingDelay     := 500;
  GetMem(FTempInputBuffer,FComportInputBufferSize);

  if csDesigning in ComponentState then
    Exit;

  FTimer := TTimerThread.Create(False);
  FTimer.FOnTimer := TimerEvent;

  if FComPortActive then
    FTimer.Enabled := True;
  FTimer.SupRes;
end;

destructor TComportDriverThread.Destroy;
begin
  Disconnect;
  FreeMem(FTempInputBuffer,FComportInputBufferSize);
  inherited Destroy;
end;

function TComportDriverThread.Connect: Boolean;
var
  comName: array[0..4] of Char;
  tms: TCommTimeouts;
begin
  if Connected then
    Exit;
  StrPCopy(comName,'COM');
  comName[3] := chr(ord('1') + ord(FComportNumber));
  comName[4] := #0;
  FComportHandle := CreateFile(comName,GENERIC_READ OR GENERIC_WRITE,0,nil,
                               OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0);
  if not Connected then
    Exit;
  ApplyComPortSettings;
  tms.ReadIntervalTimeout         := 1;
  tms.ReadTotalTimeoutMultiplier  := 0;
  tms.ReadTotalTimeoutConstant    := 1;
  tms.WriteTotalTimeoutMultiplier := 0;
  tms.WriteTotalTimeoutConstant   := 0;
  SetCommTimeouts(FComportHandle,tms);
  Sleep(1000);
end;

function TComportDriverThread.Connected: Boolean;
begin
  Result := FComportHandle > 0;
end;

function TComportDriverThread.Disconnect: Boolean;
begin
  Result := False;
  if Connected then
  begin
    CloseHandle(FComportHandle);
    FComportHandle := 0;
  end;
  Result := True;
end;

function TComportDriverThread.Disconnected: Boolean;
begin
  if (FComportHandle <> 0) then
    Result := False
  else
    Result := True;
end;

const
  Win32BaudRates: array[br110..br115200] of DWORD =
   (CBR_110,CBR_300,CBR_600,CBR_1200,CBR_2400,CBR_4800,CBR_9600,CBR_14400,
    CBR_19200,CBR_38400,CBR_56000,CBR_57600,CBR_115200);

const
  dcb_Binary              = $00000001;
  dcb_ParityCheck         = $00000002;
  dcb_OutxCtsFlow         = $00000004;
  dcb_OutxDsrFlow         = $00000008;
  dcb_DtrControlMask      = $00000030;
  dcb_DtrControlDisable   = $00000000;
  dcb_DtrControlEnable    = $00000010;
  dcb_DtrControlHandshake = $00000020;
  dcb_DsrSensitvity       = $00000040;
  dcb_TXContinueOnXoff    = $00000080;
  dcb_OutX                = $00000100;
  dcb_InX                 = $00000200;
  dcb_ErrorChar           = $00000400;
  dcb_NullStrip           = $00000800;
  dcb_RtsControlMask      = $00003000;
  dcb_RtsControlDisable   = $00000000;
  dcb_RtsControlEnable    = $00001000;
  dcb_RtsControlHandshake = $00002000;
  dcb_RtsControlToggle    = $00003000;
  dcb_AbortOnError        = $00004000;
  dcb_Reserveds           = $FFFF8000;

procedure TComportDriverThread.ApplyComPortSettings;
var
  //Device Control Block (= dcb)
  dcb: TDCB;
begin
  if not Connected then
    Exit;
  FillChar(dcb,sizeOf(dcb),0);
  dcb.DCBlength := sizeOf(dcb);

  dcb.Flags := dcb_Binary or dcb_RtsControlEnable;
  dcb.BaudRate := Win32BaudRates[FComPortBaudRate];

  case FComportHwHandshaking  of
    hhNONE  : ;
    hhRTSCTS:
      dcb.Flags := dcb.Flags or dcb_OutxCtsFlow or dcb_RtsControlHandshake;
  end;

  case FComportSwHandshaking of
    shNONE   : ;
    shXONXOFF:
      dcb.Flags := dcb.Flags or dcb_OutX or dcb_Inx;
  end;

  dcb.XonLim   := FComportInputBufferSize div 4;
  dcb.XoffLim  := 1;
  dcb.ByteSize := 5 + ord(FComportDataBits);
  dcb.Parity   := ord(FComportParity);
  dcb.StopBits := ord(FComportStopBits);
  dcb.XonChar  := #17;
  dcb.XoffChar := #19;
  SetCommState(FComportHandle,dcb);
  SetupComm(FComportHandle,FComPortInputBufferSize,FComPortOutputBufferSize);
end;

function TComportDriverThread.ReadString(var Str: string): Integer;
var
  BytesTrans, nRead: DWORD;
  Buffer           : String;
  i                : Integer;
  temp             : string;
begin
  BytesTrans := 0;
  Str := '';
  SetLength(Buffer,1);
  ReadFile(FComportHandle,PChar(Buffer)^, 1, nRead, nil);
  while nRead > 0 do
  begin
    temp := temp + PChar(Buffer);
    ReadFile(FComportHandle,PChar(Buffer)^, 1, nRead, nil);
  end;
  //Remove the end token.
  BytesTrans := Length(temp);
  SetLength(str,BytesTrans-2);
  for i:=0 to BytesTrans-2 do
  begin
    str[i] := temp[i];
  end;

  Result := BytesTrans;
end;

function TComportDriverThread.SendData(DataPtr: Pointer;
  DataSize: Integer): Boolean;
var
  nsent : DWORD;
begin
  Result := WriteFile(FComportHandle,DataPtr^,DataSize,nsent,nil);
  Result := Result and (nsent = DataSize);
end;

function TComportDriverThread.SendString(Input: String): Boolean;
begin
  if not Connected then
    if not Connect then
      raise Exception.CreateHelp('Could not connect to COM-port !',101);
  Result := SendData(PChar(Input),Length(Input));
  if not Result then
    raise Exception.CreateHelp('Could not send to COM-port !',102);
end;

procedure TComportDriverThread.TimerEvent;
var
  InQueue, OutQueue: Integer;
  Buffer : String;
  nRead : DWORD;

  procedure DataInBuffer(Handle: THandle; var aInQueue, aOutQueue: Integer);
  var
    ComStat : TComStat;
    e       : Cardinal;
  begin
    aInQueue  := 0;
    aOutQueue := 0;
    if ClearCommError(Handle,e,@ComStat) then
    begin
      aInQueue  := ComStat.cbInQue;
      aOutQueue := ComStat.cbOutQue;
    end;
  end;
begin
  if csDesigning in ComponentState then
    Exit;
  if not Connected then
    if not Connect then
      raise Exception.CreateHelp('TimerEvent: Could not connect to COM-port !',101);
  Application.ProcessMessages;
  if Connected then
  begin
    DataInBuffer(FComportHandle,InQueue,OutQueue);
    if InQueue > 0 then
    begin
      if (Assigned(FOnReceiveData) ) then
      begin
        FReceiving := True;
        FOnReceiveData(Self);
      end;
    end;
  end;
end;

procedure TComportDriverThread.SetComportBaudRate(Value: TComPortBaudRate);
begin
  FComportBaudRate := Value;
  if Connected then
    ApplyComPortSettings;
end;

procedure TComportDriverThread.SetComportDataBits(Value: TComPortDataBits);
begin
  FComportDataBits := Value;
  if Connected then
    ApplyComPortSettings;
end;

procedure TComportDriverThread.SetComportHwHandshaking(Value: TComportHwHandshaking);
begin
  FComportHwHandshaking := Value;
  if Connected then
    ApplyComPortSettings;
end;

procedure TComportDriverThread.SetComportInputBufferSize(Value: Word);
begin
  FreeMem(FTempInputBuffer,FComportInputBufferSize);
  FComportInputBufferSize := Value;
  GetMem(FTempInputBuffer,FComportInputBufferSize);
  if Connected then
    ApplyComPortSettings;
end;

procedure TComportDriverThread.SetComportNumber(Value: TComPortNumber);
begin
  if Connected then
    exit;
  FComportNumber := Value;
end;

procedure TComportDriverThread.SetComportOutputBufferSize(Value: Word);
begin
  FComportOutputBufferSize := Value;
  if Connected then
    ApplyComPortSettings;
end;

procedure TComportDriverThread.SetComportParity(Value: TComPortParity);
begin
  FComportParity := Value;
  if Connected then
    ApplyComPortSettings;
end;

procedure TComportDriverThread.SetComportPollingDelay(Value: Word);
begin
  FComportPollingDelay := Value;
end;

procedure TComportDriverThread.SetComportStopBits(Value: TComPortStopBits);
begin
  FComportStopBits := Value;
  if Connected then
    ApplyComPortSettings;
end;

procedure TComportDriverThread.SetComportSwHandshaking(Value: TComPortSwHandshaking);
begin
  FComportSwHandshaking := Value;
  if Connected then
    ApplyComPortSettings;
end;

procedure TComportDriverThread.DoDataReceived;
begin
  if Assigned(FOnReceiveData) then FOnReceiveData(Self);
end;

procedure TComportDriverThread.SetComPortActive(Value: Boolean);
var
  DumpString : String;
begin
  FComPortActive := Value;
  if csDesigning in ComponentState then
    Exit;
  if FComPortActive then
  begin
    //Just dump the contents of the input buffer of the com-port.
    ReadString(DumpString);
    FTimer.Enabled := True;
  end
  else
    FTimer.Enabled := False;
  FTimer.SupRes;
end;

{ TTimerThread }

procedure TTimerThread.Execute;
begin
  Priority := tpNormal;
  repeat
    Sleep(500);
    if Assigned(FOnTimer) then Synchronize(FOnTimer);
  until Terminated;
end;

procedure TTimerThread.SupRes;
begin
  if not Suspended then
    Suspend;
  if FEnabled then
    Resume;
end;

end.
