object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1057#1073#1086#1088' '#1087#1086#1082#1072#1079#1072#1085#1080#1081' '#1058'45'
  ClientHeight = 228
  ClientWidth = 450
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
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
      object Label3: TLabel
        Left = 10
        Top = 13
        Width = 67
        Height = 13
        AutoSize = False
        Caption = #1048#1044' '#1044#1072#1090#1095#1080#1082#1072
      end
      object Label4: TLabel
        Left = 188
        Top = 13
        Width = 73
        Height = 13
        AutoSize = False
        Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072
        Visible = False
      end
      object Label5: TLabel
        Left = 25
        Top = 42
        Width = 52
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = #1052#1086#1084#1077#1085#1090
      end
      object Label6: TLabel
        Left = 237
        Top = 42
        Width = 113
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = #1063#1072#1089#1090#1086#1090#1072' '#1074#1088#1072#1097#1077#1085#1080#1103
      end
      object Label7: TLabel
        Left = 356
        Top = 42
        Width = 77
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = #1052#1086#1097#1085#1086#1089#1090#1100' '
      end
      object Label2: TLabel
        Left = 99
        Top = 42
        Width = 61
        Height = 13
        Caption = #1050#1072#1083#1080#1073#1088#1086#1074#1082#1072
      end
      object STOsnIzmVel: TStaticText
        AlignWithMargins = True
        Left = 16
        Top = 63
        Width = 77
        Height = 33
        Margins.Top = 5
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkSoft
        BorderStyle = sbsSingle
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
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
        Left = 244
        Top = 63
        Width = 94
        Height = 33
        Margins.Top = 5
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkSoft
        BorderStyle = sbsSingle
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
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
        Left = 344
        Top = 63
        Width = 93
        Height = 33
        Margins.Top = 5
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkSoft
        BorderStyle = sbsSingle
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clGreen
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
        Left = 267
        Top = 8
        Width = 97
        Height = 23
        Margins.Top = 5
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkSoft
        BorderStyle = sbsSingle
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -107
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 3
        Transparent = False
        Visible = False
      end
      object EDatchikID: TEdit
        Left = 80
        Top = 10
        Width = 97
        Height = 21
        ReadOnly = True
        TabOrder = 4
      end
      object Edit1: TEdit
        Left = 98
        Top = 63
        Width = 61
        Height = 33
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Text = '0'
      end
      object BitBtn1: TBitBtn
        Left = 167
        Top = 63
        Width = 33
        Height = 33
        Hint = #1042#1099#1089#1090#1072#1074#1080#1090#1100' '#1082#1072#1083#1080#1073#1088#1086#1074#1082#1091' '#1087#1086' '#1090#1077#1082#1091#1097#1080#1084' '#1087#1086#1082#1072#1079#1072#1085#1080#1103#1084
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF169C16169C16FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF169C1624B72C22B62A22B62A
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF17A61721B4282F
          D4442ED34128C63422B62AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF18AB
          181DAE2330D4462FD4442ED2422DD03F28C63422B62AFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF18B0181BAD1E30D24732D74A30D4472CD24125CF3A2BD03C28C63422B6
          2AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF18B2181BAD1E2FD04636DA5132D64A2FD5474DDF66AAF1BA
          37D64A29D03C28C63423B92DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF18B61819AD192ECD4239DB5735D75033D74C81
          EB9858EF7BB3F8CCAAF1BA38D64B2AD03D28C63421B428FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF92DD9218B1182BC83C3ADC5C38DA
          5636D85281EB9821C72821C52821C728B4F9CDAAF1BA2ED3422BD13E28C6341C
          AA22FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF18B1182EC83A
          3DDD6238DA5A38DA5681EB9821C72816A116FFFFFF16A11629D133C9FADB93ED
          A72AD13E2CD34028C6341AA31EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF22BB2938DA5A3FDE6438DA5AB6F4D121C72816A116FFFFFFFFFFFFFFFFFF
          17A9173ADA47D6FAE380EA9629D13D2DD44228C63423B92DFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF20BA286CE89038DA5AB6F4D121C72816A116FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF16A51646E05ADDFBE868E57D28CF3C2ED44328C634
          179C19FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF18B2184AD95FB6F4D155DE6B16A1
          16FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF16A5165EE974DFFBEA4F
          DE6528D03D2FD54427C032179A17FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF18B719
          16A11616A116FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF18A81877EF92DCFBE843DB582BD13E2FD64423B92D169C16FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF18AD1996F4B1D6FAE34FDE652CD2412FD5441FB1
          27169C16FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF21BB2AB6F7CDD6FAE3
          4FDE652DD3422ED3421CA922169F16FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF22BD2B96F4B1D6FAE34FDE652FD5442DCF3F1AA31E92DD92FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF22BD2B96F4B1D6FAE34FDE6530D7472ACB3B1A
          A31EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF22BD2B4AD95ED6FA
          E34FDE6531D7481CA723FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF22BD2B4AD95ED6FAE32ECD411FB127FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF92DD924AD95E27C032FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        TabOrder = 6
        OnClick = BitBtn1Click
      end
      object BitBtn2: TBitBtn
        Left = 206
        Top = 64
        Width = 35
        Height = 33
        Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1082#1072#1083#1080#1073#1088#1086#1074#1082#1091
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFC8C7FFDCDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBEBDE90607EE5E5DC4FFFFFFFF
          FFFFFFFFFFFFFFFF3135FF243CFF1D2EFF4D4BFDFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF100FDD1720
          FF3534B2FFFFFFFFFFFFFFFFFF615CFF3357FF2E51FF2A4AFF233EFF3734FBFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          716EDC0909FF0B13FF5B5AC2FFFFFFFFFFFFFFFFFF201EFF325BFF2C4FFF2948
          FF233FFF1628FFA8A5FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFE0DFF70200EA1414FF0509EFA6A4DEFFFFFFFFFFFFFFFFFF231FFF
          4E76FF2B4DFF2948FF233DFF203CFF191BFAFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF2522DE100CFF1414FF0000D0EFEEF9FFFFFFFF
          FFFFFFFFFF3A36FF7190FF284BFF2847FF233DFF1F3AFF182BFF8380F7FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5E5ADD0500FF100CFF0708FF4A48
          BEFFFFFFFFFFFFFFFFFFFFFFFFA6A3FF4248FF5275FF2645FF233DFF1F39FF1D
          34FF0B10FBF3F2FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAA7ED0500FD0F07FF
          100CFF0200D9CBCAEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3332FF697AFF3454
          FF213CFF1F39FF1C32FF1728FF3834F3FFFFFFFFFFFFFFFFFFFFFFFFA7A5EF05
          00F80F08FF0E07FF0602FF3935BEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF0400FF7F98FF213DFF1E38FF1C32FF192CFF0C15FF9592F4FFFFFFFFFF
          FFE1E0FA0601FB0F09FF0E07FF0F08FF0400CECBCAF0FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFCECDFF110EFF7591FF1D38FF1B31FF192BFF1824FF
          0708F5F8F7FFE4E3FB0702F4110DFF0F09FF0E07FF0500F8716ED7FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF817FFE2625FD607DFF17
          2DFF192BFF1825FF131CFF201BEC0E0DFB100FFF110DFF100AFF0C06FF130FC7
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF5D59FB414AFF5570FF1728FF1825FF1820FF1317FF1616FF1210FF120EFF12
          0CFF0300DBCDCBF4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF221FF7474EFE5568FF1723FF1920FF171CFF1616
          FF1310FF1211FF0803EB827FE5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1C19F3444CFF2937FF
          1B23FF191CFF1817FF1513FF0C08F64E4DDEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8AFC2E
          3AFF2638FF1B25FF1D24FF1B1FFF1C1CFF1816FF0D09E9D8D7F8FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCB8
          FF545BFF637AFF6279FF5F70FF5F6CFF4952FF4B4FFF4142FF2524FF2624FF13
          0DEAE0DFF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          D7D5FF797CFF6A7EFF6C85FF687EFF6378FF6172FF5D6AFF6972FF9A9CFFA7A8
          FF6F6CFF5853FF5B56FF4F48F7C8C7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF9895FF6F83FF7894FF738DFF6F85FF6C81FF667BFF6373FF7D8AFF
          8485FC615AF05B54EF9F9DFF8F8DFF5B55FF5B52FF514BF8ACA9EDFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFABA7FF7D94FF809CFF7B94FF7790FF7389FF6F84FF66
          7CFF95A3FF8989FC6560F4FFFFFFD9D8FB5751EC807DF7AAA6FF7770FF5C56FF
          5754FF7A77E7FFFFFFFFFFFFFFFFFFFFFFFF7175FF89A5FF839EFF7F98FF7C94
          FF768BFF788DFFA1B0FF7978FA8C87F7FEFEFFFFFFFFFFFFFFFFFFFF7D7BEC69
          65ED9A98FEA7A0FF7D7BFF6060FF5757ECB8B7EBFFFFFFFFFFFF9093FF9EB6FF
          839FFF8098FF7D95FF95A5FFA9B3FF706CFBB2AEFBFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFD7D5F96B67E47873EDA19BFDAAACFF979DFF7680FB7276E8E5
          E5F87973FFB1BDFFBCCDFFB4C5FFBDCBFF979CFD706AFCD9D7FEFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCB9F26C69DF6C68E28C8D
          F29FA7FAC5D3FF797EE6E7E6FF837CFF7D78FF827FFF6D67FE938EFEFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFE3E2F9A3A1E87675DA7674D88282D8FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        TabOrder = 7
        OnClick = BitBtn2Click
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
    Text = '10'
  end
  object UpDown5: TUpDown
    Left = 723
    Top = 190
    Width = 16
    Height = 21
    Associate = EAveragingFactor
    Min = 1
    Position = 10
    TabOrder = 15
    Thousands = False
  end
  object ReflectionTimer: TTimer
    Enabled = False
    Interval = 50
    OnTimer = ReflectionTimerTimer
    Left = 28
    Top = 280
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=Ora'
      'Database=XE'
      'Password=zamer'
      'User_Name=zamer')
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    Connected = True
    LoginPrompt = False
    Left = 212
    Top = 120
  end
  object Query1: TFDQuery
    Connection = FDConnection1
    Left = 108
    Top = 284
  end
  object QUpd: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'UPDATE ZAMER'
      'SET    TORQ  = :TORQ,'
      '       ROT   = :ROT,'
      '       POWER = :POWER')
    Left = 184
    Top = 228
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
  object TimerCommand: TTimer
    Interval = 500
    OnTimer = TimerCommandTimer
    Left = 29
    Top = 229
  end
  object QCommand: TFDQuery
    Connection = FDConnection1
    Left = 108
    Top = 228
  end
  object QIns: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'INSERT INTO ZAMER.ZAMERTMP ('
      '   TORQ, ROT, POWER, '
      '   NOMER, PNOM)'
      'VALUES ( :TORQ, :ROT, :POWER, '
      '   :NOMER, :PNOM )')
    Left = 252
    Top = 228
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
      end
      item
        Name = 'NOMER'
        ParamType = ptInput
      end
      item
        Name = 'PNOM'
        ParamType = ptInput
      end>
  end
end
