object Fhhod: TFhhod
  Left = 0
  Top = 0
  Caption = #1061#1086#1083#1086#1089#1090#1086#1081' '#1093#1086#1076
  ClientHeight = 539
  ClientWidth = 1022
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnHide = FormHide
  DesignSize = (
    1022
    539)
  PixelsPerInch = 96
  TextHeight = 23
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 174
    Height = 23
    Caption = #1042#1088#1077#1084#1103' '#1079#1072#1087#1080#1089#1080', '#1089#1077#1082'.:'
  end
  object Label2: TLabel
    Left = 251
    Top = 8
    Width = 289
    Height = 23
    Caption = #1054#1090#1082#1083#1086#1085#1077#1085#1080#1077' '#1085#1072#1087#1088#1103#1078#1077#1085#1080#1103', '#1074#1086#1083#1100#1090':'
  end
  object Label3: TLabel
    Left = 721
    Top = 8
    Width = 45
    Height = 29
    Caption = '380'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 632
    Top = 8
    Width = 83
    Height = 29
    Caption = 'U'#1080#1089#1087'='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 1
    Top = 502
    Width = 421
    Height = 39
    Anchors = [akLeft]
    Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1077' '#1085#1072#1087#1088#1103#1078#1077#1085#1080#1077':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitTop = 558
  end
  object Label6: TLabel
    Left = 428
    Top = 503
    Width = 20
    Height = 39
    Anchors = [akLeft]
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitTop = 559
  end
  object Label7: TLabel
    Left = 503
    Top = 503
    Width = 156
    Height = 39
    Anchors = [akLeft]
    Caption = #1058#1077#1082#1091#1097#1077#1077':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitTop = 559
  end
  object Label8: TLabel
    Left = 661
    Top = 503
    Width = 20
    Height = 39
    Anchors = [akLeft]
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitTop = 559
  end
  object Label11: TLabel
    Left = 4
    Top = 425
    Width = 237
    Height = 33
    Caption = #1055#1077#1088#1077#1082#1086#1089' '#1092#1072#1079', %:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label12: TLabel
    Left = 256
    Top = 425
    Width = 17
    Height = 33
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 772
    Top = 8
    Width = 74
    Height = 29
    Caption = #1042#1086#1083#1100#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 188
    Top = 5
    Width = 57
    Height = 31
    TabOrder = 0
    Text = '15'
  end
  object Edit2: TEdit
    Left = 546
    Top = 5
    Width = 51
    Height = 31
    TabOrder = 1
    Text = '1'
  end
  object GroupBox1: TGroupBox
    Left = 4
    Top = 37
    Width = 273
    Height = 368
    Caption = #1042#1099#1073#1086#1088' '#1074#1072#1088#1080#1072#1085#1090#1072' '#1080#1089#1087#1099#1090#1072#1085#1080#1081
    TabOrder = 2
    object StringGrid1: TStringGrid
      Left = 3
      Top = 28
      Width = 266
      Height = 309
      ColCount = 4
      RowCount = 12
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goEditing, goFixedRowDefAlign]
      TabOrder = 0
    end
    object RadioButton1: TRadioButton
      Left = 95
      Top = 343
      Width = 13
      Height = 17
      TabOrder = 1
      OnClick = RadioButton1Click
    end
    object RadioButton2: TRadioButton
      Left = 159
      Top = 343
      Width = 21
      Height = 17
      TabOrder = 2
      OnClick = RadioButton2Click
    end
    object RadioButton3: TRadioButton
      Left = 221
      Top = 343
      Width = 20
      Height = 17
      TabOrder = 3
      OnClick = RadioButton3Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 279
    Top = 37
    Width = 738
    Height = 368
    Anchors = [akLeft, akTop, akRight]
    Caption = #1055#1088#1086#1074#1077#1076#1077#1085#1080#1077' '#1080#1089#1087#1099#1090#1072#1085#1080#1081
    TabOrder = 3
    DesignSize = (
      738
      368)
    object StringGrid2: TStringGrid
      Left = 3
      Top = 28
      Width = 732
      Height = 309
      Anchors = [akLeft, akTop, akRight]
      ColCount = 7
      DefaultColWidth = 100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goEditing, goFixedRowDefAlign]
      ParentFont = False
      TabOrder = 0
      OnClick = StringGrid2Click
      OnDrawCell = StringGrid2DrawCell
    end
  end
  object ProgressBar1: TProgressBar
    Left = 1
    Top = 467
    Width = 1020
    Height = 33
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
  end
  object BitBtn1: TBitBtn
    Left = 536
    Top = 411
    Width = 176
    Height = 53
    Anchors = [akTop, akRight]
    Caption = #1064#1040#1043' F5'
    Enabled = False
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
    TabOrder = 5
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 718
    Top = 411
    Width = 149
    Height = 53
    Anchors = [akTop, akRight]
    Caption = #1047#1072#1087#1080#1089#1072#1090#1100
    Enabled = False
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCD0BB638F602A65252A63232A63
      232A63232A63232A63232A63232A63232A63232A63232A64242C6A288EAF8CFF
      FFFF2A68272F7E302E7C2F2E7C2F2F7D302A6E2AFFFFFF769E7429682736A246
      3AB2523DC35E3DC25E3DC25E3DC25E3EC25E3EC45F3FC5613FC5613FC5613FC9
      63328D39497F47FFFFFF2A65253FC7623DC05D3DC05D3FC4612F7F31FFFFFF2B
      68273AB5533DBE5D3CBB5B3CBA5A3CBA5A3CBA5A3CBA5A3DBD5C359E4434933D
      34943D34943D35973F2E7A2F8CAE8AFFFFFF2A65253DC4603CBC5B3CBC5B3DC2
      5E2E7F31356F3334973F3DC15E3CBD5B3CBC5B3CBC5B3CBC5B3CBC5B3CBC5B3D
      C15E2C772C2860222861232861232862232A6525588B58FFFFFF2B67263DC461
      3CBC5C3CBC5C3DC25F2F80322A66253BBA593CBD5D3CBC5C3CBC5C3CBC5C3CBC
      5C3CBC5C3CBC5C3CBD5C3DC15F3DC4603DC4613DC4613DC4613EC3612D742CFF
      FFFF2B69263DC5643CBD5F3CBD5F3DC3632F7F332E7A2E3DC4643CBD603CBD5F
      3CBD5F3CBD5F3CBD5F3CBD5F3CBD5F3CBE603DC3643DC5653DC5653DC5653DC5
      653EC4632D782DFFFFFF2B6B263CC5623CBE5E3CBE5F3DC463308033318D3A3D
      C2623CBE5F3CBE5F3CBE5F3CBE5F3CBE5F3CBE5F3CBE5F3DC4622A601F2A6623
      2A66232A66232A6622286722296D26FFFFFF3377304DCD7732BB5B35BC5D38C2
      632E8033339A433BC1653BBE623BBE623BBE623BBE623BBE623BBE623BBE623A
      BF6337AE5335B05334AF5232AE503AB3584FB76966B06F4C864A3A7F3898E3B6
      94DCAF78D59A64D38C378B3D40A25134BF5E34BC5C34BC5D36BD5D36BD5D35BC
      5D34BC5D34BC5C3FC36849C8725BCF836ED49187DCA793DEAF91DEAF97E5B53D
      823A39823891E2B28ADAA88CDBA992E1B2529E5873BD8194E0B292DDAE92DDB0
      7FD89F77D69A8BDCAA92DDAF92DDAE92DCAC95D9AB95DAAC93DAAC92DAA990DA
      A992DAAA83CA92327D333A843991E2B58ADAAB8ADAAB8FDFB351A259519E568F
      E0B38ADAAB8ADAAC8BDAAC8CDAAC8BDAAC8ADAAB8ADAAC8DDCAB2877241D6D1B
      1E6D1C1E6D1C1E6D1C1E6E1D227122D1E3D23D893D97E9BF91E2B691E2B695E6
      BC58A96432823491E1B48BDCAD8ADBAC8ADBAC8ADBAC8ADBAC8ADBAC8ADBAC8B
      DDAF8DD9A98FDCAC8FDCAC8FDCAC8FDCAC90DCAD8CD39F3281353285373F9042
      3C8D403C8D403E8E4136883B3F8A416BB57590E2B58ADDAE8ADCAD8ADCAD8ADC
      AD8ADCAD8ADCAD8ADDAE8BDEB08DDFB18DDFB28DDFB28DDFB28DDFB295E5BB3E
      8F42FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF45934A7BC68D8EE2B5
      8ADEAF8ADDAE8ADDAE8ADDAE8DE0B28EDEB08AD6A372C68973C78A73C78A73C7
      8A74C78C70C07F4B9650FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF2D87337BC88D8DE2B78ADEB28ADEB18CE0B478C9903C9241599F5E579E5B
      579E5B579E5B579E5B549C5982B886FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF2D8B348BD7A68BE0B58ADEB28EE1B857B066FF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3D994790E0B78BE1
      B58DE3B965BD7989C190FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      77B98065BE7A8BE3BD89E1BA8AD9AB30953CFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFF9FCFA3B9F488FE3BB88E2B98EE7C24EAE5EFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EB36A90E1B988E2BB8DE4C15C
      BF77FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4CAD5C8FE3
      BC88E4BE8EE8C650B564FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF30A6438FE5C088E6C191E4BF34A848FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF49B45C8FE0BA91E9C95EC47798D5A4FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFECD53DB35441B55983CE91FF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    TabOrder = 6
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 873
    Top = 411
    Width = 141
    Height = 54
    Anchors = [akTop, akRight]
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    Enabled = False
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0906
      AA0906A86866CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF2422B9130EE31712F80C09BA8281D7FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF0B08B31614EC1A18F71613EA0B08B3FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2E2BC21716EC1B1BF51B1CFA0D
      09BCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4541CC1919
      ED1B1EF51C1EF7100FD1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF0E08C21B1FF31D21F51F24F90F0AC6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF7775E11210D51E28F71E27F5181CE80F0BC7FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFD6D6F70F0AC91D24F11F2AF5202BF61414DB8B
      89E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7FB100ACF191EE82231F7212F
      F52232F81411DACECDF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFF110AD31817E1
      2236F82133F52133F52235F6181CE51009D24741DD413CDC413CDC413CDC413C
      DC3E39DD726FE6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D
      25DB1718E3253CF82339F52338F52338F52338F5243BF7212FF21D26EC191FE7
      191FE7191FE7191FE7191FE81717E23732DE130DD9120AD81109D71109D7110A
      D8120DD92924DD1515E12843F9273EF6263DF6263DF6263DF6263DF6263DF627
      3EF72740F72741F82741F82741F82740F82841F82840F8120BD8110ADD2A48FB
      2844F92844F92A48FA1817E31109DB273BF62741F62740F62740F62740F62740
      F62740F6263FF62640F72740F72740F72740F72740F72740F72740F72031F219
      13DD1109DE2B48F82A44F62A44F62B48F71815E51611E22C49F82A44F62A44F6
      2A44F62A44F62A44F62A44F62741F52031F20B04D30D06D60D06D60D06D70E06
      D70E06D70F09DACCCBF8180EE23858F9243FF62842F62C49F71714E71C21EA2D
      4AF72C47F62C47F62C47F62C47F62C47F62C47F62B47F62841F42434F22535F2
      2635F32334F22232F31F31F31F23EB1C16E31B12E794AEFA8098F95B79F84465
      F81513E91B21ED2B4AF72B48F62C49F62C49F62C49F62C49F62C49F62C49F62C
      49F62A49F72949F62746F63C5EF85575F97A95FA9AB8FC1D15E71910E890ACFA
      87A0F98AA2F993AEFA3630ED5A61F27694FA5C7DF85775F85877F84B69F74B69
      F75877F85776F85777F87186F7788CF88EA0F88C9DF88A9CF88999F85251F036
      30EB1A11EA91ADFB87A0FA87A0FA8EAAFB3432EF5252F18FAAFB8AA3FA8BA3FA
      8BA4FA8CA5FA8CA5FA8BA4FA8BA3FA91ACFB1F10EA1206E81106E81106E81106
      E8140AE96764F1FFFFFF1A11ED94B0FB8AA3FA8AA3FA92ADFB3733F0342FF092
      AEFB8AA3FA8AA3FA8AA3FA8AA3FA8AA3FA8AA3FA8AA3FA8BA4FA92ADFB94B0FB
      94B0FB94B0FB94B0FB9AB5FB342EF0FFFFFF1B12EF97B4FB8DA7FA8DA7FA95B1
      FB3A37F1130AEE91ACFA8EA8FA8DA7FA8DA7FA8DA7FA8DA7FA8DA7FA8DA7FA8E
      A8FA93B0FB97B4FB97B5FB97B5FB97B6FB9BB8FA352FF3FFFFFF1B12EF98B5FB
      8EA8FA8EA8FA96B2FB3C39F4160FEF7680F891AEFA8EA8FA8EA8FA8EA8FA8EA8
      FA8EA8FA8EA8FA93AFFB3E39F31207F0150AF0150AF0150BF01B12F04440F2FF
      FFFF1C13F1A2C2FB99B5FB99B5FBA0BFFB3F3CF4FFFFFF2219F298AFFA94B1FA
      92ACFA91ABFA91ABFA91ABFA91ABFA94AFFA7582F8626AF7646CF7646CF76871
      F73E3BF47E7CF8FFFFFF1A13F1413FF73E3AF63E3AF6403EF6251FF4FFFFFF66
      62F7281EF48998FA95ACFAA0BDFB9FBCFB9FBCFB9FBCFB9FBDFBA2C0FBA3C2FB
      A3C2FBA3C2FBA8C9FB676FF8342EF4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFB5B3FC4E49F6140BF31C13F31C12F31C12F31C12F31C
      12F31C12F31C12F31C12F31C12F31D14F3150FF56E6BF7FFFFFF}
    TabOrder = 7
    OnClick = BitBtn3Click
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 311
    Top = 205
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 70
    OnTimer = Timer2Timer
    Left = 371
    Top = 205
  end
  object QinsAll: TFDQuery
    Connection = FMain.FDOra
    SQL.Strings = (
      'INSERT INTO ZAMER.ZHHALL ('
      '   NOMER, UISP, U12, '
      '   U23, U31, I1, '
      '   I2, I3, P1, '
      '   P2, P3, DUMAX, ps, fu, fi, fp) '
      'VALUES ( :NOMER, :UISP, :U12, '
      '   :U23, :U31, :I1, '
      '   :I2, :I3, :P1, '
      '   :P2, :P3, :DUMAX,:ps, :fu, :fi, :fp )')
    Left = 427
    Top = 205
    ParamData = <
      item
        Name = 'NOMER'
        ParamType = ptInput
      end
      item
        Name = 'UISP'
        ParamType = ptInput
      end
      item
        Name = 'U12'
        ParamType = ptInput
      end
      item
        Name = 'U23'
        ParamType = ptInput
      end
      item
        Name = 'U31'
        ParamType = ptInput
      end
      item
        Name = 'I1'
        ParamType = ptInput
      end
      item
        Name = 'I2'
        ParamType = ptInput
      end
      item
        Name = 'I3'
        ParamType = ptInput
      end
      item
        Name = 'P1'
        ParamType = ptInput
      end
      item
        Name = 'P2'
        ParamType = ptInput
      end
      item
        Name = 'P3'
        ParamType = ptInput
      end
      item
        Name = 'DUMAX'
        ParamType = ptInput
      end
      item
        Name = 'PS'
        ParamType = ptInput
      end
      item
        Name = 'FU'
        ParamType = ptInput
      end
      item
        Name = 'FI'
        ParamType = ptInput
      end
      item
        Name = 'FP'
        ParamType = ptInput
      end>
  end
  object QTemp: TFDQuery
    Connection = FMain.FDOra
    Left = 475
    Top = 205
  end
  object QInsSvod: TFDQuery
    Connection = FMain.FDOra
    SQL.Strings = (
      'INSERT INTO ZAMER.ZHHSVOD ('
      '   NOMER, UISP, USRED, '
      '   ISRED, PSRED, TIP, '
      '   DUMAX, R, otklon) '
      'VALUES ( :NOMER, :UISP, :USRED, '
      '   :ISRED, :PSRED, :TIP, '
      '   :DUMAX, :R, :otklon )')
    Left = 523
    Top = 205
    ParamData = <
      item
        Name = 'NOMER'
        ParamType = ptInput
      end
      item
        Name = 'UISP'
        ParamType = ptInput
      end
      item
        Name = 'USRED'
        ParamType = ptInput
      end
      item
        Name = 'ISRED'
        ParamType = ptInput
      end
      item
        Name = 'PSRED'
        ParamType = ptInput
      end
      item
        Name = 'TIP'
        ParamType = ptInput
      end
      item
        Name = 'DUMAX'
        ParamType = ptInput
      end
      item
        Name = 'R'
        ParamType = ptInput
      end
      item
        Name = 'OTKLON'
        ParamType = ptInput
      end>
  end
  object Qselectsred: TFDQuery
    Connection = FMain.FDOra
    SQL.Strings = (
      'select'
      'NOMER, UISP,'
      'round(sum(afu),1) u,'
      'round(sum(afi),1) i,'
      'round(sum(sp),2) ps,'
      'round(sum(mumax),4) umax'
      'from'
      '('
      'SELECT'
      'NOMER, UISP,'
      'avg(fu) afu,'
      'avg(fi) afi,'
      'avg(ps) sp,0 mumax'
      'FROM ZAMER.ZHHALL'
      'where nomer=:nomer and uisp=:uisp and dumax<=:delta'
      'group by nomer, uisp'
      'union all'
      'SELECT nomer,  UISP,'
      '0 afu,'
      '0 afi,'
      '0 sp, max(dumax) mumax'
      'FROM ZAMER.ZHHALL'
      'where nomer=:nomer and uisp=:uisp and dumax<=:delta'
      'group by nomer, uisp'
      ')'
      'group by nomer, uisp')
    Left = 575
    Top = 205
    ParamData = <
      item
        Name = 'NOMER'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'UISP'
        ParamType = ptInput
      end
      item
        Name = 'DELTA'
        ParamType = ptInput
      end>
  end
  object TimerUpd: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TimerUpdTimer
    Left = 311
    Top = 257
  end
  object ActionList1: TActionList
    Left = 636
    Top = 204
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 116
      OnExecute = Action1Execute
    end
  end
end
