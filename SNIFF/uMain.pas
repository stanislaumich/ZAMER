//  *************************************************
//  * Project   : SnifferDemo
//  * Purpose   : ���������������� ������ ��������.
//  * Author    : ��������� (Rouse_) ������
//  * Version   : 1.01
//  *************************************************
//  �� ������:
//  � �� ������ ����� ����� ����� �������� ���-�� �������������,
//  ������ ���� ������� �������� ��� ������� ��������� �����������
//  ��������, ��� � � ���������� :)
//
//  ��, �� � �������� ��� ��� ����������, ������ ������� �
//  Windows 2000 :)

unit uMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, WinSock, ComCtrls;

const
  MAX_PACKET_SIZE = $10000; // 2^16
  SIO_RCVALL = $98000001;
  WSA_VER = $202;
  MAX_ADAPTER_NAME_LENGTH        = 256;
  MAX_ADAPTER_DESCRIPTION_LENGTH = 128;
  MAX_ADAPTER_ADDRESS_LENGTH     = 8;
  IPHelper = 'iphlpapi.dll';

  // ��� ICMP ������
  ICMP_ECHO             = 8;   // ������
  ICMP_ECHOREPLY        = 0;   // �����

resourcestring
  LOG_STR_0 = '==============================================================================' + sLineBreak;
  LOG_STR_1 = 'Packet ID: %-5d TTL: %d' + sLineBreak;
  LOG_STR_2 = 'Packet size: %-5d bytes type: %s' + sLineBreak;
  LOG_STR_3 = 'Source IP      : %15s: %d' + sLineBreak;
  LOG_STR_4 = 'Destination IP : %15s: %d' + sLineBreak;
  LOG_STR_5 = 'ARP Type: %s, operation: %s' + sLineBreak;
  LOG_STR_6 = 'ICMP Type: %s' + sLineBreak;
  LOG_STR_7 = '------------------------------ Packet dump -----------------------------------' + sLineBreak;

type
  USHORT = WORD;
  ULONG = DWORD;
  time_t = Longint;

  // ip ���������
  // ����� �������� � RFC 791
  // http://rtfm.vn.ua/inet/prot/rfc791r.html
  TIPHeader = packed record
    iph_verlen:   UCHAR;    // ������ � ����� ���������
    iph_tos:      UCHAR;    // ��� �������
    iph_length:   USHORT;   // ����� ����� ������
    iph_id:       USHORT;   // �������������
    iph_offset:   USHORT;   // ����� � ��������
    iph_ttl:      UCHAR;    // ����� ����� ������
    iph_protocol: UCHAR;    // ��������
    iph_xsum:     USHORT;   // ����������� �����
    iph_src:      ULONG;    // IP-����� �����������
    iph_dest:     ULONG;    // IP-����� ����������
  end;
  PIPHeader = ^TIPHeader;

  // tcp ���������
  // ����� �������� � RFC 793
  // http://rtfm.vn.ua/inet/prot/rfc793r.html
  TTCPHeader = packed record
    sourcePort: USHORT;       // ���� �����������
    destinationPort: USHORT;  // ���� ����������
    sequenceNumber: ULONG;    // ����� ������������������
    acknowledgeNumber: ULONG; // ����� �������������
    dataoffset: UCHAR;        // �������� �� ������� ������
    flags: UCHAR;             // �����
    windows: USHORT;          // ������ ����
    checksum: USHORT;         // ����������� �����
    urgentPointer: USHORT;    // ���������
  end;
  PTCPHeader = ^TTCPHeader;

  // udp ���������
  // ����� �������� � RFC 768
  // http://rtfm.vn.ua/inet/prot/rfc768r.html
  TUDPHeader = packed record
    sourcePort:       USHORT;  // ���� �����������
    destinationPort:  USHORT;  // ���� ����������
    len:              USHORT;  // ����� ������
    checksum:         USHORT;  // ����������� �����
  end;
  PUDPHeader = ^TUDPHeader;

  // ICMP ���������
  // ����� �������� � RFC 792
  // http://rtfm.vn.ua/inet/prot/rfc792r.html
  TICMPHeader = packed record
   IcmpType      : BYTE;      // ��� ������
   IcmpCode      : BYTE;      // ��� ������
   IcmpChecksum  : WORD;
   IcmpId        : WORD;
   IcmpSeq       : WORD;
   IcmpTimestamp : DWORD;
  end;
  PICMPHeader = ^TICMPHeader;


  // ��������� ��� ���������� GetAdaptersInfo
  IP_ADDRESS_STRING = record
    S: array [0..15] of Char;
  end;
  IP_MASK_STRING = IP_ADDRESS_STRING;
  PIP_MASK_STRING = ^IP_MASK_STRING;

  PIP_ADDR_STRING = ^IP_ADDR_STRING;
  IP_ADDR_STRING = record
    Next: PIP_ADDR_STRING;
    IpAddress: IP_ADDRESS_STRING;
    IpMask: IP_MASK_STRING;
    Context: DWORD;
  end;

  PIP_ADAPTER_INFO = ^IP_ADAPTER_INFO;
  IP_ADAPTER_INFO = record
    Next: PIP_ADAPTER_INFO;
    ComboIndex: DWORD;
    AdapterName: array [0..MAX_ADAPTER_NAME_LENGTH + 3] of Char;
    Description: array [0..MAX_ADAPTER_DESCRIPTION_LENGTH + 3] of Char;
    AddressLength: UINT;
    Address: array [0..MAX_ADAPTER_ADDRESS_LENGTH - 1] of BYTE;
    Index: DWORD;
    Type_: UINT;
    DhcpEnabled: UINT;
    CurrentIpAddress: PIP_ADDR_STRING;
    IpAddressList: IP_ADDR_STRING;
    GatewayList: IP_ADDR_STRING;
    DhcpServer: IP_ADDR_STRING;
    HaveWins: BOOL;
    PrimaryWinsServer: IP_ADDR_STRING;
    SecondaryWinsServer: IP_ADDR_STRING;
    LeaseObtained: time_t;
    LeaseExpires: time_t;
  end;                   

  // ����� ��������
  TSnifferThread = class(TThread)
  private
    WSA: TWSAData;
    hSocket: TSocket;
    Addr_in: sockaddr_in;
    Packet: array[0..MAX_PACKET_SIZE - 1] of Byte;
    LogData: String;
    procedure ShowPacket;
  protected
    function InitSocket: Boolean; virtual;
    procedure DeInitSocket(const ExitCode: Integer); virtual;
    procedure Execute; override;
    procedure ParcePacket(const PacketSize: Word); virtual;
  public
    Host: String;
  end;

  TfrmMain = class(TForm)
    btnStartStop: TButton;
    cbInterfaces: TComboBox;
    Label1: TLabel;
    RichEdit1: TRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnStartStopClick(Sender: TObject);
  private
    TotalPacketCount: Integer;
    FSnifferThread: TSnifferThread;
    procedure ReadLanInterfaces;
  end;

  // ��� ������ ������ ������� �� ��������� ������� ������� �����������
  // �� ��������� ���������� � ���������� � ���
  function GetAdaptersInfo(pAdapterInfo: PIP_ADAPTER_INFO;
    var pOutBufLen: ULONG): DWORD; stdcall; external IPHelper;

const
  // ������� ������������ ��������
  IPHeaderSize = SizeOf(TIPHeader);
  ICMPHeaderSize = SizeOf(TICMPHeader);
  TCPHeaderSize = SizeOf(TTCPHeader);
  UDPHeaderSize = SizeOf(TUDPHeader);

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

{ TSnifferThread }

// ������������� ���������� ������
function TSnifferThread.InitSocket: Boolean;
var
  PromiscuousMode: Integer;
begin
  // �������������� WinSock
  Result := WSAStartup(WSA_VER, WSA) = NOERROR;
  if not Result then
  begin
    LogData := '������: ' + SysErrorMessage(WSAGetLastError);
    Synchronize(ShowPacket);
    Exit;
  end;
  // ������� �����
  hSocket := socket(AF_INET, SOCK_RAW, IPPROTO_IP);
  if hSocket = INVALID_SOCKET then
  begin
    DeInitSocket(WSAGetLastError);
    Exit;
  end;
  FillChar(Addr_in, SizeOf(sockaddr_in), 0);
  Addr_in.sin_family:= AF_INET;
  // ��������� �� ����� ����������� ����� �������
  Addr_in.sin_addr.s_addr := inet_addr(PAnsiChar(Host));
  // ��������� ����� � ��������� �������
  if bind(hSocket, Addr_in, SizeOf(sockaddr_in)) <> 0 then
  begin
    DeInitSocket(WSAGetLastError);
    Exit;
  end;
  // ����������� ��������� �� ����� ���� ������� ���������� ����� ��������� - promiscuous mode.
  PromiscuousMode := 1;
  if ioctlsocket(hSocket, SIO_RCVALL, PromiscuousMode) <> 0 then
  begin
    DeInitSocket(WSAGetLastError);
    Exit;
  end;
  Result := True;
end;

// ���������� ������ ������
procedure TSnifferThread.DeInitSocket(const ExitCode: Integer);
begin
  // ���� ���� ������ - ������� ��
  if ExitCode <> 0 then
  begin
    LogData := '������: ' + SysErrorMessage(ExitCode);
    Synchronize(ShowPacket);
  end;
  // ��������� �����
  if hSocket <> INVALID_SOCKET then closesocket(hSocket);
  // ���������������� WinSock
  WSACleanup;
end;

// ������� ��������� ������ ��������
procedure TSnifferThread.Execute;
var
  PacketSize: Integer;
begin
  // ���������� �������������
  if InitSocket then
  try
    // ������ ����� �� �����
    while not Terminated do
    begin
      // ���� ��������� ������ (����������� �����)
      PacketSize := recv(hSocket, Packet, MAX_PACKET_SIZE, 0);
      // ���� ���� ������ - ���������� �� ������
      if PacketSize > SizeOf(TIPHeader) then ParcePacket(PacketSize);
    end;
  finally
    // � ����� ����������� ������� �������
    DeInitSocket(NO_ERROR);
  end;
end;

// ��������� �������� ������
procedure TSnifferThread.ParcePacket(const PacketSize: Word);
var
  IPHeader: TIPHeader;
  ICMPHeader: TICMPHeader;
  TCPHeader: TTCPHeader;
  UDPHeader: TUDPHeader;
  SrcPort, DestPort: Word;
  I, Octets, PartOctets: Integer;
  PacketType, DumpData, ExtendedInfo: String;
  Addr, A, B: TInAddr;
begin
  Inc(frmMain.TotalPacketCount);
  // ������ �� ������ IP ���������
  Move(Packet[0], IPHeader, IPHeaderSize);
  // ����� ����� ����� ������
  LogData := LOG_STR_0 +
    Format(LOG_STR_1, [frmMain.TotalPacketCount, IPHeader.iph_ttl]);
  SrcPort := 0;
  DestPort := 0;
  ExtendedInfo := '';
  // ���������� ��� ���������
  case IPHeader.iph_protocol of
    IPPROTO_ICMP: // ICMP
    begin
      PacketType := 'ICMP';
	    // ������ ICMP ���������
      Move(Packet[IPHeaderSize], ICMPHeader, ICMPHeaderSize);
	    // ������� ��� ������
      case ICMPHeader.IcmpCode of
        ICMP_ECHO: ExtendedInfo := Format(LOG_STR_6, ['Echo']);
        ICMP_ECHOREPLY: ExtendedInfo := Format(LOG_STR_6, ['Echo reply']);
      else
        ExtendedInfo := Format(LOG_STR_6, ['Unknown']);
      end;
    end;
    IPPROTO_TCP: // TCP
    begin
      PacketType := 'TCP';
	    // ������ ��� ���������
      Move(Packet[IPHeaderSize], TCPHeader, TCPHeaderSize);
	    // ������� ���� ����������� � ����������
      SrcPort := TCPHeader.sourcePort;
      DestPort := TCPHeader.destinationPort;
    end;
    IPPROTO_UDP: // UDP
    begin
      PacketType := 'UDP';
	    // ������ UDP ���������
      Move(Packet[IPHeaderSize], UDPHeader, UDPHeaderSize);
	    // ������� ���� ����������� � ����������
      SrcPort := UDPHeader.sourcePort;
      DestPort := UDPHeader.destinationPort;
    end;
  else
    PacketType := 'Unsupported (0x' + IntToHex(IPHeader.iph_protocol, 2) + ')';
  end;
  // ����� ������ ������
  LogData := LogData + Format(LOG_STR_2, [PacketSize, PacketType]);
  if ExtendedInfo <> '' then
    LogData := LogData + ExtendedInfo;

  // ����� IP ����� ����������� � ������
  Addr.S_addr := IPHeader.iph_src;
  LogData := LogData + Format(LOG_STR_3, [inet_ntoa(Addr), SrcPort]);
  // ����� IP ����� ���������� � ������
  Addr.S_addr := IPHeader.iph_dest;
  LogData := LogData + Format(LOG_STR_4, [inet_ntoa(Addr), DestPort]) + LOG_STR_7;

  // ������� ���������� ������ �� ����� (������� �������������� �� ����, ��� ��� ������)
  // ���������� ���-�� ����� �����:
  //
  // ------------------------------ Packet dump -----------------------------------
  // 000000 45 00 00 4E D8 91 00 00 | 80 11 DB 3B C0 A8 02 82     E..N.......;....
  // 000010 C0 A8 02 FF 00 89 00 89 | 00 3A AC 6A 83 BD 01 10     .........:.j....
  // 000020 00 01 00 00 00 00 00 00 | 20 45 43 46 46 45 49 44     ........ ECFFEID
  // 000030 44 43 41 43 41 43 41 43 | 41 43 41 43 41 43 41 43     DCACACACACACACAC
  // 000040 41 43 41 43 41 43 41 43 | 41 00 00 20 00 01           ACACACACA.. ..
  I := 0;
  Octets := 0;
  PartOctets := 0;
  while I < PacketSize do
  begin
    case PartOctets of
      0: LogData := LogData + Format('%.6d ', [Octets]);
      9: LogData := LogData + '| ';
      18:
      begin
        Inc(Octets, 10);
        PartOctets := -1;
        LogData := LogData + '    ' + DumpData + sLineBreak;
        DumpData := '';
      end;
    else
      begin
        LogData := LogData + Format('%s ', [IntToHex(Packet[I], 2)]);
        if Packet[I] in [$19..$7F] then
          DumpData := DumpData + Chr(Packet[I])
        else
          DumpData := DumpData + '.';
        Inc(I);
      end;
    end;
    Inc(PartOctets);
  end;
  if PartOctets <> 0 then
  begin
    PartOctets := (16 - Length(DumpData)) * 3;
    if PartOctets >= 24 then Inc(PartOctets, 2);
    Inc(PartOctets, 4);
    LogData := LogData + StringOfChar(' ', PartOctets) +
      DumpData + sLineBreak + sLineBreak
  end
  else
    LogData := LogData + sLineBreak + sLineBreak;
  // ������� ��� ��� ����������� � Memo
  Synchronize(ShowPacket);
end;

procedure TSnifferThread.ShowPacket;
begin
 frmMain.RichEdit1.Lines.BeginUpdate;
 frmMain.RichEdit1.Text:=frmMain.RichEdit1.Text+sLineBreak+LogData;
 SendMessage(frmMain.RichEdit1.Handle, WM_VSCROLL, SB_BOTTOM, 0);
 frmMain.RichEdit1.Lines.EndUpdate;
{  frmMain.memReport.Lines.BeginUpdate;
  frmMain.memReport.Text :=
    frmMain.memReport.Text + sLineBreak + LogData;
  SendMessage(frmMain.memReport.Handle, WM_VSCROLL, SB_BOTTOM, 0);
  frmMain.memReport.Lines.EndUpdate;   }
end;

{ TfrmMain }

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  TotalPacketCount := 0;
  ReadLanInterfaces;
end;

// ������ ��� IP ������ �� ���� ��������������
// � ������� ������� �����������
procedure TfrmMain.ReadLanInterfaces;
var
  InterfaceInfo,
  TmpPointer: PIP_ADAPTER_INFO;
  IP: PIP_ADDR_STRING;
  Len: ULONG;
begin
  // ������� ������� ������ ��� ���������?
  if GetAdaptersInfo(nil, Len) = ERROR_BUFFER_OVERFLOW then
  begin
    // ����� ������ ���-��
    GetMem(InterfaceInfo, Len);
    try
      // ���������� �������
      if GetAdaptersInfo(InterfaceInfo, Len) = ERROR_SUCCESS then
      begin
        // ����������� ��� ������� ����������
        TmpPointer := InterfaceInfo;
        repeat
          // ����������� ��� IP ������ ������� ����������
          IP := @TmpPointer.IpAddressList;
          repeat
            cbInterfaces.Items.Add({IP^.IpAddress.S}TmpPointer.Description);
            IP := IP.Next;
          until IP = nil;
          TmpPointer := TmpPointer.Next;
        until TmpPointer = nil;
      end;
    finally
      // ����������� ������� ������
      FreeMem(InterfaceInfo);
    end;
  end;
  // ������� - ����� �� �� ���������� ������ ���������?
  if cbInterfaces.Items.Count = 0 then
  begin
    RichEdit1.Text := '������� ���������� �� ����������.' + sLineBreak +
      '����������� ������ ��������� �� ��������.';
    btnStartStop.Enabled := False;
    Exit;
  end
  else
    cbInterfaces.ItemIndex := 0;
end;

// ������ ��������� ������
procedure TfrmMain.btnStartStopClick(Sender: TObject);
begin
  if FSnifferThread <> nil then
  begin
    FSnifferThread.Terminate;
    FSnifferThread := nil;
    btnStartStop.Caption := 'Start';
  end
  else
  begin
    FSnifferThread := TSnifferThread.Create(True);
    FSnifferThread.Host := Copy(cbInterfaces.Text, 1, Pos(' ', cbInterfaces.Text));
    FSnifferThread.FreeOnTerminate := True;
    FSnifferThread.Resume;
    btnStartStop.Caption := 'Stop';
  end;
end;

end.
