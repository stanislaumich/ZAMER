object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1055#1088#1080#1084#1077#1088' '#1087#1088#1086#1075#1088#1072#1084#1084#1099' '#1076#1083#1103' '#1088#1072#1073#1086#1090#1099' '#1074' '#1087#1086#1090#1086#1082#1086#1074#1086#1084' '#1088#1077#1078#1080#1084#1077' (RAD Studio XE3)'
  ClientHeight = 455
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
  object LComPortNumber: TLabel
    Left = 464
    Top = 43
    Width = 115
    Height = 13
    AutoSize = False
    Caption = #1053#1086#1084#1077#1088' COM '#1087#1086#1088#1090#1072
  end
  object LBaudRate: TLabel
    Left = 464
    Top = 73
    Width = 147
    Height = 19
    AutoSize = False
    Caption = #1057#1082#1086#1088#1086#1089#1090#1100' '#1087#1088#1080#1077#1084#1072'/'#1087#1077#1088#1077#1076#1072#1095#1080
  end
  object LUnitNumber: TLabel
    Left = 464
    Top = 103
    Width = 147
    Height = 13
    AutoSize = False
    Caption = #1053#1086#1084#1077#1088'  '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1072' '#1074' '#1089#1077#1090#1080
  end
  object LServerAddress: TLabel
    Left = 464
    Top = 133
    Width = 115
    Height = 13
    AutoSize = False
    Caption = #1040#1076#1088#1077#1089' '#1089#1077#1088#1074#1077#1088#1072
  end
  object LPortNumber: TLabel
    Left = 464
    Top = 163
    Width = 115
    Height = 17
    AutoSize = False
    Caption = #1053#1086#1084#1077#1088' '#1087#1086#1088#1090#1072' '#1073#1072#1079#1086#1074#1099#1081
  end
  object LAveragingFactor: TLabel
    Left = 464
    Top = 193
    Width = 147
    Height = 17
    AutoSize = False
    Caption = #1050#1086#1101#1092#1080#1094#1080#1077#1085#1090' '#1091#1089#1088#1077#1076#1085#1077#1085#1080#1103
  end
  object Label1: TLabel
    Left = 464
    Top = 14
    Width = 100
    Height = 13
    AutoSize = False
    Caption = #1058#1080#1087' '#1076#1077#1082#1086#1076#1077#1088#1072
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 449
    Height = 185
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 447
      Height = 112
      Align = alTop
      TabOrder = 0
      ExplicitTop = 4
      object Label3: TLabel
        Left = 31
        Top = 13
        Width = 67
        Height = 13
        AutoSize = False
        Caption = #1048#1044' '#1044#1072#1090#1095#1080#1082#1072
      end
      object Label4: TLabel
        Left = 248
        Top = 13
        Width = 73
        Height = 13
        AutoSize = False
        Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072
      end
      object Label5: TLabel
        Left = 24
        Top = 42
        Width = 97
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = #1050#1088#1091#1090#1103#1097#1080#1081' '#1084#1086#1084#1077#1085#1090
      end
      object Label6: TLabel
        Left = 144
        Top = 42
        Width = 113
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = #1063#1072#1089#1090#1086#1090#1072' '#1074#1088#1072#1097#1077#1085#1080#1103
      end
      object Label7: TLabel
        Left = 272
        Top = 42
        Width = 153
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = #1052#1086#1097#1085#1086#1089#1090#1100' '
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
        Color = clWhite
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
        Color = clWhite
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
        Color = clWhite
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
        Color = clWhite
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
        Left = 104
        Top = 10
        Width = 97
        Height = 21
        ReadOnly = True
        TabOrder = 4
      end
    end
    object Memo1: TMemo
      Left = 1
      Top = 113
      Width = 447
      Height = 67
      ScrollBars = ssBoth
      TabOrder = 1
    end
  end
  object BConnect: TButton
    Left = 1
    Top = 191
    Width = 110
    Height = 33
    Caption = 'Open'
    TabOrder = 1
    OnClick = BConnectClick
  end
  object BStart: TButton
    Left = 117
    Top = 191
    Width = 104
    Height = 33
    Caption = 'Start'
    TabOrder = 2
    OnClick = BStartClick
  end
  object BStop: TButton
    Left = 225
    Top = 191
    Width = 109
    Height = 33
    Caption = 'Stop'
    TabOrder = 3
    OnClick = BStopClick
  end
  object BDisconnect: TButton
    Left = 340
    Top = 191
    Width = 109
    Height = 33
    Caption = 'Close'
    TabOrder = 4
    OnClick = BDisconnectClick
  end
  object CBDecoderType: TComboBox
    Left = 568
    Top = 11
    Width = 171
    Height = 21
    ItemIndex = 0
    TabOrder = 5
    Text = #1044#1077#1082#1086#1076#1077#1088' '#1058'25 (USB)'
    OnChange = CBDecoderTypeChange
    Items.Strings = (
      #1044#1077#1082#1086#1076#1077#1088' '#1058'25 (USB)'
      #1044#1077#1082#1086#1076#1077#1088' '#1058'26 (MODBUS)'
      #1044#1077#1082#1086#1076#1077#1088' '#1058'32 (RS-232)'
      #1044#1077#1082#1086#1076#1077#1088' '#1058'35 (USB)'
      #1044#1077#1082#1086#1076#1077#1088' '#1058'36 (MODBUS)'
      #1044#1077#1082#1086#1076#1077#1088' '#1058'37 (ETHERNET)'
      #1044#1077#1082#1086#1076#1077#1088' '#1058'42 (RS-232)'
      #1044#1077#1082#1086#1076#1077#1088' '#1058'45 (USB)'
      #1044#1077#1082#1086#1076#1077#1088' '#1058'46 (MODBUS)'
      #1044#1077#1082#1086#1076#1077#1088' '#1057#1080#1084#1091#1083#1103#1090#1086#1088
      #1044#1077#1082#1086#1076#1077#1088' '#1058'22')
  end
  object EComPortNumber: TEdit
    Left = 653
    Top = 40
    Width = 70
    Height = 21
    TabOrder = 6
    Text = '1'
  end
  object CBBaudRate: TComboBox
    Left = 653
    Top = 70
    Width = 83
    Height = 21
    ItemIndex = 0
    TabOrder = 7
    Text = '9600'
    Items.Strings = (
      '9600'
      '19200'
      '38400'
      '57600'
      '115200')
  end
  object UpDown2: TUpDown
    Left = 723
    Top = 40
    Width = 16
    Height = 21
    Associate = EComPortNumber
    Min = 1
    Max = 20
    Position = 1
    TabOrder = 8
    Thousands = False
  end
  object EUnitNumber: TEdit
    Left = 654
    Top = 100
    Width = 66
    Height = 21
    NumbersOnly = True
    TabOrder = 9
    Text = '1'
  end
  object UpDown3: TUpDown
    Left = 720
    Top = 100
    Width = 16
    Height = 21
    Associate = EUnitNumber
    Min = 1
    Max = 99
    Position = 1
    TabOrder = 10
    Thousands = False
  end
  object EServerAddress: TEdit
    Left = 615
    Top = 130
    Width = 121
    Height = 21
    TabOrder = 11
    Text = 'T37E01'
  end
  object EPortNumber: TEdit
    Left = 654
    Top = 160
    Width = 69
    Height = 21
    HideSelection = False
    NumbersOnly = True
    TabOrder = 12
    Text = '4000'
  end
  object UpDown4: TUpDown
    Left = 723
    Top = 160
    Width = 16
    Height = 21
    Associate = EPortNumber
    Min = 1000
    Max = 9999
    Position = 4000
    TabOrder = 13
    Thousands = False
  end
  object EAveragingFactor: TEdit
    Left = 654
    Top = 190
    Width = 69
    Height = 21
    TabOrder = 14
    Text = '15'
  end
  object UpDown5: TUpDown
    Left = 723
    Top = 190
    Width = 16
    Height = 21
    Associate = EAveragingFactor
    Min = 1
    Position = 15
    TabOrder = 15
    Thousands = False
  end
  object ReflectionTimer: TTimer
    Enabled = False
    Interval = 50
    OnTimer = ReflectionTimerTimer
    Left = 32
    Top = 120
  end
  object TS: TTimer
    Enabled = False
    OnTimer = TSTimer
    Left = 96
    Top = 120
  end
  object TQ: TTimer
    Interval = 100
    OnTimer = TQTimer
    Left = 148
    Top = 120
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=Ora'
      'Database=XE'
      'Password=zamer'
      'User_Name=zamer')
    Connected = True
    LoginPrompt = False
    Left = 212
    Top = 120
  end
  object Query1: TFDQuery
    Connection = FDConnection1
    Left = 292
    Top = 124
  end
  object Query2: TFDQuery
    Connection = FDConnection1
    Left = 364
    Top = 120
  end
end
