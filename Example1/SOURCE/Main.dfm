object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1057#1073#1086#1088' '#1087#1086#1082#1072#1079#1072#1085#1080#1081' '#1058'45'
  ClientHeight = 471
  ClientWidth = 745
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object LPortNumber: TLabel
    Left = 464
    Top = 148
    Width = 115
    Height = 17
    AutoSize = False
    Caption = 'Base port number'
  end
  object LServerAddress: TLabel
    Left = 464
    Top = 121
    Width = 115
    Height = 13
    AutoSize = False
    Caption = 'Server address'
  end
  object LComPortNumber: TLabel
    Left = 464
    Top = 38
    Width = 115
    Height = 13
    AutoSize = False
    Caption = 'COM port number'
  end
  object LBaudRate: TLabel
    Left = 464
    Top = 66
    Width = 147
    Height = 19
    AutoSize = False
    Caption = 'Read/Write speed'
  end
  object LUnitNumber: TLabel
    Left = 464
    Top = 93
    Width = 147
    Height = 13
    AutoSize = False
    Caption = 'Unit number'
  end
  object LAveragingFactor: TLabel
    Left = 464
    Top = 204
    Width = 147
    Height = 17
    AutoSize = False
    Caption = 'Averaging factor'
  end
  object LProtocol: TLabel
    Left = 464
    Top = 176
    Width = 147
    Height = 17
    AutoSize = False
    Caption = 'Protocol'
  end
  object EComPortNumber: TEdit
    Left = 617
    Top = 35
    Width = 66
    Height = 21
    TabOrder = 18
    Text = '1'
  end
  object EUnitNumber: TEdit
    Left = 617
    Top = 90
    Width = 66
    Height = 21
    NumbersOnly = True
    TabOrder = 19
    Text = '1'
  end
  object EAveragingFactor: TEdit
    Left = 617
    Top = 201
    Width = 66
    Height = 21
    TabOrder = 17
    Text = '1'
  end
  object EPortNumber: TEdit
    Left = 617
    Top = 145
    Width = 49
    Height = 21
    HideSelection = False
    NumbersOnly = True
    TabOrder = 9
    Text = '4000'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 449
    Height = 471
    Align = alLeft
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 447
      Height = 112
      Align = alTop
      TabOrder = 0
      object Label3: TLabel
        Left = 16
        Top = 13
        Width = 73
        Height = 13
        AutoSize = False
        Caption = 'Transducer ID'
      end
      object Label4: TLabel
        Left = 240
        Top = 13
        Width = 81
        Height = 13
        AutoSize = False
        Caption = 'Temperature'
      end
      object Label5: TLabel
        Left = 16
        Top = 42
        Width = 97
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Torque'
      end
      object Label6: TLabel
        Left = 144
        Top = 42
        Width = 113
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Rotation frequency'
      end
      object Label7: TLabel
        Left = 272
        Top = 42
        Width = 153
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Power'
      end
      object STOsnIzmVel: TStaticText
        AlignWithMargins = True
        Left = 16
        Top = 63
        Width = 110
        Height = 33
        Margins.Top = 5
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkSoft
        BorderStyle = sbsSingle
        Color = clNavy
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clLime
        Font.Height = -24
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        Transparent = False
      end
      object STSkorost: TStaticText
        AlignWithMargins = True
        Left = 144
        Top = 63
        Width = 113
        Height = 33
        Margins.Top = 5
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkSoft
        BorderStyle = sbsSingle
        Color = clNavy
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clLime
        Font.Height = -24
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 1
        Transparent = False
      end
      object STMoschnost: TStaticText
        AlignWithMargins = True
        Left = 272
        Top = 63
        Width = 153
        Height = 33
        Margins.Top = 5
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkSoft
        BorderStyle = sbsSingle
        Color = clNavy
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clLime
        Font.Height = -24
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 2
        Transparent = False
      end
      object STTemper: TStaticText
        AlignWithMargins = True
        Left = 327
        Top = 5
        Width = 97
        Height = 33
        Margins.Top = 5
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkSoft
        BorderStyle = sbsSingle
        Color = clNavy
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clLime
        Font.Height = -24
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 3
        Transparent = False
      end
      object EDatchikID: TEdit
        Left = 96
        Top = 10
        Width = 97
        Height = 21
        ReadOnly = True
        TabOrder = 4
      end
      object Panel3: TPanel
        Left = 204
        Top = 8
        Width = 33
        Height = 25
        ParentBackground = False
        TabOrder = 5
      end
    end
    object Memo1: TMemo
      Left = 1
      Top = 113
      Width = 447
      Height = 357
      Align = alClient
      ScrollBars = ssBoth
      TabOrder = 1
    end
  end
  object EServerAddress: TEdit
    Left = 617
    Top = 118
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'IT42E9'
  end
  object BConnect: TButton
    Left = 464
    Top = 243
    Width = 121
    Height = 33
    Caption = 'Open'
    TabOrder = 2
    OnClick = BConnectClick
  end
  object BDisconnect: TButton
    Left = 464
    Top = 287
    Width = 121
    Height = 33
    Caption = 'Close'
    TabOrder = 3
    OnClick = BDisconnectClick
  end
  object BReadBase: TButton
    Left = 591
    Top = 228
    Width = 121
    Height = 33
    Caption = 'BReadBase'
    TabOrder = 4
    Visible = False
    OnClick = BReadBaseClick
  end
  object BReadSpeed: TButton
    Left = 617
    Top = 235
    Width = 121
    Height = 33
    Caption = 'BReadSpeed'
    TabOrder = 5
    Visible = False
    OnClick = BReadSpeedClick
  end
  object BReadTemperature: TButton
    Left = 591
    Top = 255
    Width = 121
    Height = 33
    Caption = 'BReadTemperature'
    TabOrder = 6
    Visible = False
    OnClick = BReadTemperatureClick
  end
  object BReadComplex: TButton
    Left = 600
    Top = 287
    Width = 121
    Height = 33
    Caption = 'BReadComplex'
    TabOrder = 7
    OnClick = BReadComplexClick
  end
  object UpDown1: TUpDown
    Left = 666
    Top = 145
    Width = 17
    Height = 21
    Associate = EPortNumber
    Min = 1000
    Max = 9999
    Position = 4000
    TabOrder = 8
    Thousands = False
  end
  object BReadMessage: TButton
    Left = 617
    Top = 422
    Width = 121
    Height = 33
    Caption = 'BReadMessage'
    TabOrder = 10
    OnClick = BReadMessageClick
  end
  object BClear: TButton
    Left = 464
    Top = 422
    Width = 121
    Height = 33
    Caption = 'BClear'
    TabOrder = 11
    OnClick = BClearClick
  end
  object CBDecoderType: TComboBox
    Left = 464
    Top = 8
    Width = 257
    Height = 21
    TabOrder = 12
    Text = 'Decoder T45 (USB)'
    OnChange = CBDecoderTypeChange
    Items.Strings = (
      'Decoder T26 (MODBUS)'
      'Decoder T32 (RS-232)'
      'Decoder T35 (USB)'
      'Decoder T36 (MODBUS)'
      'Decoder T42 (RS-232)'
      'Decoder T45 (USB)'
      'Decoder T46 (MODBUS)'
      'Decoder Simulator'
      'Indicator T42(USB)'
      'Indicator T42(RS-232)'
      'Indicator T42(RS-485)'
      'Indicator T42(Ethernet)')
  end
  object UpDown2: TUpDown
    Left = 683
    Top = 35
    Width = 16
    Height = 21
    Associate = EComPortNumber
    Min = 1
    Max = 20
    Position = 1
    TabOrder = 13
    Thousands = False
  end
  object UpDown3: TUpDown
    Left = 683
    Top = 90
    Width = 16
    Height = 21
    Associate = EUnitNumber
    Min = 1
    Max = 99
    Position = 1
    TabOrder = 14
    Thousands = False
  end
  object CBBaudRate: TComboBox
    Left = 617
    Top = 63
    Width = 72
    Height = 21
    ItemIndex = 4
    TabOrder = 15
    Text = '115200'
    Items.Strings = (
      '9600'
      '19200'
      '38400'
      '57600'
      '115200')
  end
  object UpDown4: TUpDown
    Left = 683
    Top = 201
    Width = 16
    Height = 21
    Associate = EAveragingFactor
    Min = 1
    Position = 1
    TabOrder = 16
    Thousands = False
  end
  object CB_Protocol: TComboBox
    Left = 617
    Top = 173
    Width = 121
    Height = 21
    ItemIndex = 0
    TabOrder = 20
    Text = 'Modbus TCP'
    OnChange = CBDecoderTypeChange
    Items.Strings = (
      'Modbus TCP'
      'TILKOM protocol')
  end
  object Button1: TButton
    Left = 612
    Top = 321
    Width = 121
    Height = 33
    Caption = 'Start/Stop'
    Enabled = False
    TabOrder = 21
    Visible = False
    OnClick = Button1Click
  end
  object Memo2: TMemo
    Left = 468
    Top = 360
    Width = 270
    Height = 57
    Lines.Strings = (
      'Memo2')
    ScrollBars = ssVertical
    TabOrder = 22
    Visible = False
  end
  object TimerMain: TTimer
    Interval = 50
    OnTimer = TimerMainTimer
    Left = 96
    Top = 204
  end
  object TimerCommand: TTimer
    Interval = 500
    OnTimer = TimerCommandTimer
    Left = 168
    Top = 204
  end
  object FDC: TFDConnection
    Params.Strings = (
      'Database=XE'
      'DriverID=Ora'
      'Password=zamer'
      'User_Name=zamer')
    ResourceOptions.AssignedValues = [rvAutoReconnect, rvSilentMode]
    ResourceOptions.SilentMode = True
    ResourceOptions.AutoReconnect = True
    UpdateOptions.AssignedValues = [uvAutoCommitUpdates]
    UpdateOptions.AutoCommitUpdates = True
    Connected = True
    LoginPrompt = False
    Left = 24
    Top = 292
  end
  object QCommand: TFDQuery
    Connection = FDC
    ResourceOptions.AssignedValues = [rvCmdExecMode]
    SQL.Strings = (
      'select * from command where command between 0 and 1')
    Left = 72
    Top = 292
  end
  object QUpd: TFDQuery
    Connection = FDC
    ResourceOptions.AssignedValues = [rvCmdExecMode]
    SQL.Strings = (
      'UPDATE ZAMER.ZAMER'
      'SET    TORQ  = :TORQ,'
      '       ROT   = :ROT,'
      '       POWER = :POWER')
    Left = 152
    Top = 292
    ParamData = <
      item
        Name = 'TORQ'
        ParamType = ptInput
      end
      item
        Name = 'ROT'
        ParamType = ptInput
      end
      item
        Name = 'POWER'
        ParamType = ptInput
      end>
  end
  object Qtemp: TFDQuery
    Connection = FDC
    ResourceOptions.AssignedValues = [rvCmdExecMode]
    Left = 212
    Top = 292
  end
  object QIns: TFDQuery
    Connection = FDC
    ResourceOptions.AssignedValues = [rvCmdExecMode]
    SQL.Strings = (
      'INSERT INTO ZAMER.ZAMERTMP (TORQ, ROT, POWER) '
      'VALUES ( :TORQ , :ROT , :POWER  )')
    Left = 284
    Top = 292
    ParamData = <
      item
        Name = 'TORQ'
        ParamType = ptInput
      end
      item
        Name = 'ROT'
        ParamType = ptInput
      end
      item
        Name = 'POWER'
        ParamType = ptInput
      end>
  end
end
