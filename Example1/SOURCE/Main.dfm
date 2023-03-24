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
    Visible = False
  end
  object LProtocol: TLabel
    Left = 464
    Top = 176
    Width = 147
    Height = 17
    AutoSize = False
    Caption = 'Protocol'
  end
  object Label2: TLabel
    Left = 448
    Top = 428
    Width = 101
    Height = 13
    Caption = #1047#1072#1084#1077#1088' '#1089#1082#1086#1088#1086#1089#1090#1080', '#1084#1089'.'
  end
  object Label8: TLabel
    Left = 447
    Top = 451
    Width = 105
    Height = 13
    Caption = #1060#1072#1082#1090#1086#1088' '#1091#1089#1088#1077#1076#1085#1077#1085#1080#1103':'
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
    Visible = False
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
    Width = 433
    Height = 471
    Align = alLeft
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 431
      Height = 148
      Align = alTop
      TabOrder = 0
      object Label3: TLabel
        Left = 8
        Top = 10
        Width = 22
        Height = 13
        AutoSize = False
        Caption = 'ID:'
      end
      object Label4: TLabel
        Left = 211
        Top = 10
        Width = 81
        Height = 13
        AutoSize = False
        Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072':'
      end
      object Label5: TLabel
        Left = 229
        Top = 85
        Width = 49
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = #1052#1086#1084#1077#1085#1090':'
      end
      object Label6: TLabel
        Left = 228
        Top = 43
        Width = 50
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = #1054#1073#1086#1088#1086#1090#1099':'
      end
      object Label7: TLabel
        Left = 222
        Top = 116
        Width = 56
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1052#1086#1097#1085#1086#1089#1090#1100':'
      end
      object Label1: TLabel
        Left = 12
        Top = 50
        Width = 28
        Height = 13
        Caption = #1058#1072#1088#1072':'
      end
      object STOsnIzmVel: TStaticText
        AlignWithMargins = True
        Left = 284
        Top = 72
        Width = 141
        Height = 33
        Margins.Top = 5
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkSoft
        BorderStyle = sbsSingle
        Caption = '0'
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
        Left = 284
        Top = 36
        Width = 141
        Height = 33
        Margins.Top = 5
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkSoft
        BorderStyle = sbsSingle
        Caption = '0'
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
        Left = 284
        Top = 108
        Width = 141
        Height = 33
        Margins.Top = 5
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkSoft
        BorderStyle = sbsSingle
        Caption = '0'
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
        Left = 284
        Top = 0
        Width = 141
        Height = 33
        Margins.Top = 5
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkSoft
        BorderStyle = sbsSingle
        Caption = '0'
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
        Left = 36
        Top = 7
        Width = 97
        Height = 21
        ReadOnly = True
        TabOrder = 4
      end
      object Panel3: TPanel
        Left = 139
        Top = 4
        Width = 66
        Height = 25
        Caption = #1055#1056#1054#1057#1058#1054#1049
        ParentBackground = False
        TabOrder = 5
      end
      object Edit1: TEdit
        Left = 46
        Top = 34
        Width = 87
        Height = 37
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        Text = '0'
        OnExit = Edit1Exit
      end
      object BitBtn1: TBitBtn
        Left = 139
        Top = 34
        Width = 38
        Height = 37
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1A751C1A751C0B6F0F0B6F0F0B6F
          0D0B6F0D086B0B086B0BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1A751C72D288
          22C34D22C34D22C24B22C24B1DAC3B086B0BFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF1A751C6ED08421C04D21BE4C21BE4A21BE4A1CA839086B0BFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF1A751C6ED18421C04F21C04F21C04D21BE4C1CAA3B08
          6B0BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1A751C6ED08621C25021C24F21C0
          4F21C04F1CAB3C086B0BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1A751C6ED287
          1EC3531EC25221C25021C24F1CAD3E086B0BFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF1A751C6FD58C21C55521C3531EC3531EC2521CAF3F086B0BFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF1A751C5CCB7C1FC6581FC65721C55521C3551BAE4208
          6B0BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2083291A751C
          1A751C1A751C1A751C1A751C1A751C1A751C086B0B5CCB7C1FC85B1FC65A1FC6
          581FC6581BAE42086B0B086B0B086B0B086B0B086B0B086B0B086B0B086B0B08
          6B0B278D3446CE781BB44D1BB44D1BB44D1BB44D1BB44D1BB44D1BB44D5CCB7C
          1FC95E1FC95D1FC85B1FC65A1BAE421BAE421BB44D1BB44D1BB44D1BB44D1BB4
          4D1BB44D1BAE4210801C28903555ED9F18D16D1ED36E1ED16D1ED16B1ED0691E
          D0681ECE661FCD631FCD621FCB601FC95E1FC95D1FC85B1FC65A1FC6581FC658
          1FC55721C55521C3531EC35321C04F12831D28933855F0A218D4711CD5731CD5
          711CD36E1ED16D1ED16B1ED0691ED0681ECE661FCD651FCD621FCB601FC95E1F
          C95D1FC85B1FC85B1FC6571FC6581FC55721C55521C04F12872029963B53F2A5
          17D8751CD8761CD6741CD5731CD5711CD36E1ED36D1ED16B1ED0691ED0681ECE
          661FCE651FCD631FCB601FCB5E1FC95D1FC85D1FC85B1FC65A1FC65821C04F12
          8B23299B3E4FF4A714DA7717DA7917D87718D77618D47118D57019D46F1BD370
          1ED36E1ED16B1ED0691ED0681ECE661DCD641CCC611BC95F1BC95D1BC75B1BC6
          5A1BC6581FC65A128E262B9E416CFFBD4CEFA34EF0A24FEE9F4FEE9E4FED9C51
          EB9B53E89A18D5701CD5711CD3701ED36E1ED16D1DCF681CCC6154E38F52E38D
          52E28B52E08952E08852DD8655E28A1E9832249E3C249E3C249E3C249E3C249E
          3C249E3C249E3C249E3C249E3C6EE5A01CD8761CD6731CD5711CD37019C35E12
          8C23128C23128C23128C23128C23128C23128C23128C23128C23FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E98326EE5A01BD9791CD9781CD8
          761CD67419C35E1E9832FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E98326DEAA6
          1BDC7E1BDB7C1BDB7B1BD9781BC8641E9832FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF1E983270ECA619E08319DE8119DC7E1BDB7C1BCB681E9832FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF1E983270ECA819E08419E08419E08319DE8119CF6D1E
          9832FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E98326FEEAA19E08419E08419E0
          8419E08419D2731E9832FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E98326EF0AA
          12DE7F12DE7F12DE7F12DE7F14D3701E9832FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF249E3C6EF0AC8AFFCE8AFFCE8AFFCE8AFFCE72F2AF249E3CFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF249E3C2CBB5331C15731C15731C15731C1572CBB5324
          9E3CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        TabOrder = 7
        OnClick = BitBtn1Click
      end
      object BitBtn2: TBitBtn
        Left = 183
        Top = 35
        Width = 37
        Height = 36
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C006000000000000000000000000000000000000FFFFFF0F0A9D
          110CA3130DAA100BA00F0B9EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0B9E100BA0130DAA110CA30F0A9DFF
          FFFF120DA21611B1201BD9231EE41D17CB120DA8120DA3FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF120DA3120DA81D17CB231E
          E4201BD91611B1120DA21B16AD2E2ADD2623F42825F02825F1201DD51510AC13
          0EA7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF130EA71510AC
          201DD52825F12825F02623F42E2ADD1B16AD2B27B95758EE2526EF2828EE2929
          EF2A2AF12221D71511AF140FABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF14
          0FAB1511AF2221D72A2AF12929EF2828EE2526EF5758EE2E2ABA1E18B36867DE
          5A5DF6282BEE2A2DEE2A2EEE2B2FF12324D91712B21610B0FFFFFFFFFFFFFFFF
          FFFFFFFF1610B01712B22324D92B2FF12A2EEE2A2DEE272BEE5A5DF66867DE1E
          18B3150EB32E28BD7374E65359F32A31EE2B32EE2C33EE2D34F12428DA1A14B8
          1812B4FFFFFFFFFFFF1812B41A14B82428DA2D34F12C33EE2B32EE2A30EE595E
          F47374E62D27BC150EB3FFFFFF150EB62D27BF7375E85A63F32A35EE2C36EE2D
          38EF2E39F0272BDB1C16BC1912B81912B81C16BC272BDB2E39F02D38EF2C36EE
          2A35EF5A63F37072E42D27BF150EB6FFFFFFFFFFFFFFFFFF1610BB302AC47679
          E85B67F42D39EE2E3BEE2F3CEF2F3DF0282FDE1E1BC51E1BC5282FDE2F3DF02F
          3CEF2E3BEE2C39EF5C67F46A6CE1251EC01610B9FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF1711BE302CC8757BEA5664F42C3EEF3142EF3042EF3142F02F3FED2F3F
          ED3142F03042EF3042EF2F40EF5C6AF36A6CE2251FC31811BEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF1711C2302ACA7278E95363F33043EF3345EF
          3245EF3346F03346F03245EF3345EF2F43EF5868F36F74E7261FC71810C1FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1911C5362FCE6C
          73EA4055F13247EF3449EF3449EF3449EF3449EF3348EF3A4FF06870E9322BCD
          1811C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF1C13C9342FD34254EE354DF0374DEF374DEF374DEF374DEF354CEF40
          55F0322FD41C13C9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF1E15CD221DD33649EC3A52F13950F03950F03950
          F03950F03951F03A50EF2321D41D14CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F17D2221BD3323FE53C54F13C53F0
          3C53F03951F03951F03C53F03C53F03C54F1313FE52018D22017D2FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F16D5211AD53341E63F
          59F23D57F03D56F03A54F0465EF1475FF13A54F03D56F03D57F03E58F13039E3
          2017D42018D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2017D8241D
          DA3643E8415DF2405BF1405AF13E58F15D73F48494F68595F76076F43E59F140
          5AF1415BF2415CF23139E32018D82018D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          2017DB231CDD3746E94460F2435EF1425CF1415CF16B81F57F88F14B47E4443F
          E37F86F16B81F4405CF1425CF1445FF1445FF2323AE62017DB2018DDFFFFFFFF
          FFFFFFFFFF2118DE231CE03848EB4663F24561F1445FF1425FF16C83F47E86F2
          3F37E41D14DD1C13DD3931E38088F26C84F5425EF1445FF14661F24662F1343E
          E8231BDF2118DEFFFFFF2017E1231DE33B4AEB4866F34764F24663F24562F270
          87F57378F03B34E51E16DFFFFFFFFFFFFF1E15DF433BE67F89F27087F54561F2
          4663F24764F24867F33B4AEB231DE22118E1271FE5404DED4A69F34A67F24966
          F24765F27089F5757AF13B33E81D15E2FFFFFFFFFFFFFFFFFFFFFFFF1D14E244
          3DE9828BF37189F54765F24966F24A67F24C6AF33744EC221AE43834EB647AF3
          4767F24865F24967F2738CF58189F43831EA1F17E6FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF1F16E54039EB848CF4738BF54967F24865F24767F26178F337
          33EB322BEB7C88F46B87F55B78F47A93F6838DF5443DEE1F17E8FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F16E83730ED838DF57A93F65C78
          F46B87F57C89F4322BEB221AEA4E4BEF8B95F797A6F87B81F53831ED1F16EAFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F16EA
          3831ED7B81F596A6F88993F74E4BEF221AEAFFFFFF2219EC322BEE3C36EF2A23
          ED2118EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF2118EB2A23ED433EF0312BEE2219ECFFFFFF}
        TabOrder = 8
        OnClick = BitBtn2Click
      end
    end
    object Memo1: TMemo
      Left = 1
      Top = 149
      Width = 431
      Height = 321
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
    Top = 232
    Width = 121
    Height = 33
    Caption = 'Open'
    TabOrder = 2
    OnClick = BConnectClick
  end
  object BDisconnect: TButton
    Left = 612
    Top = 232
    Width = 121
    Height = 33
    Caption = 'Close'
    TabOrder = 3
    OnClick = BDisconnectClick
  end
  object BReadBase: TButton
    Left = 718
    Top = 232
    Width = 121
    Height = 33
    Caption = 'BReadBase'
    TabOrder = 4
    Visible = False
    OnClick = BReadBaseClick
  end
  object BReadSpeed: TButton
    Left = 718
    Top = 200
    Width = 121
    Height = 33
    Caption = 'BReadSpeed'
    TabOrder = 5
    Visible = False
    OnClick = BReadSpeedClick
  end
  object BReadTemperature: TButton
    Left = 718
    Top = 263
    Width = 121
    Height = 33
    Caption = 'BReadTemperature'
    TabOrder = 6
    Visible = False
    OnClick = BReadTemperatureClick
  end
  object BReadComplex: TButton
    Left = 718
    Top = 295
    Width = 121
    Height = 33
    Caption = 'BReadComplex'
    TabOrder = 7
    Visible = False
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
    Left = 718
    Top = 422
    Width = 121
    Height = 33
    Caption = 'BReadMessage'
    TabOrder = 10
    Visible = False
    OnClick = BReadMessageClick
  end
  object BClear: TButton
    Left = 727
    Top = 35
    Width = 121
    Height = 33
    Caption = 'BClear'
    TabOrder = 11
    Visible = False
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
    Visible = False
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
    Left = 718
    Top = 329
    Width = 121
    Height = 33
    Caption = 'Start/Stop'
    Enabled = False
    TabOrder = 21
    Visible = False
    OnClick = Button1Click
  end
  object Memo2: TMemo
    Left = 634
    Top = 342
    Width = 270
    Height = 57
    Lines.Strings = (
      'Memo2')
    ScrollBars = ssVertical
    TabOrder = 22
    Visible = False
  end
  object RadioButton1: TRadioButton
    Left = 444
    Top = 272
    Width = 177
    Height = 17
    Caption = #1057#1088#1077#1076#1085#1077#1077' '#1072#1088#1080#1092#1084' 10'
    TabOrder = 23
  end
  object RadioButton2: TRadioButton
    Left = 444
    Top = 296
    Width = 177
    Height = 17
    Caption = #1041#1077#1075#1091#1097#1077#1077' '#1072#1088#1080#1092#1084' 10'
    TabOrder = 24
  end
  object RadioButton3: TRadioButton
    Left = 444
    Top = 320
    Width = 177
    Height = 17
    Caption = #1069#1082#1089#1087#1086#1085#1077#1085#1090' '#1073#1077#1075' 0,1'
    TabOrder = 25
  end
  object RadioButton4: TRadioButton
    Left = 444
    Top = 344
    Width = 177
    Height = 17
    Caption = #1069#1082#1089#1087#1086#1085#1077#1085#1090' '#1072#1076#1072#1087#1090#1080#1074' ('#1088#1077#1079#1082#1080#1081')'
    TabOrder = 26
  end
  object RadioButton5: TRadioButton
    Left = 444
    Top = 368
    Width = 177
    Height = 17
    Caption = #1050#1072#1083#1084#1072#1085' ('#1072#1083#1100#1092#1072'-'#1073#1077#1090#1072')'
    TabOrder = 27
  end
  object RadioButton6: TRadioButton
    Left = 444
    Top = 391
    Width = 177
    Height = 18
    Caption = #1041#1077#1079' '#1092#1080#1083#1100#1090#1088#1072
    Checked = True
    TabOrder = 28
    TabStop = True
  end
  object ESpeed: TEdit
    Left = 555
    Top = 425
    Width = 34
    Height = 21
    TabOrder = 29
    Text = '500'
  end
  object EAvF: TEdit
    Left = 556
    Top = 448
    Width = 33
    Height = 21
    TabOrder = 30
    Text = '1'
  end
  object TimerMain: TTimer
    Interval = 50
    OnTimer = TimerMainTimer
    Left = 96
    Top = 204
  end
  object TimerCommand: TTimer
    Enabled = False
    Interval = 500
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
  object TimerStart: TTimer
    Interval = 500
    OnTimer = TimerStartTimer
    Left = 368
    Top = 200
  end
end
