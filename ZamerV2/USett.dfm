object FSett: TFSett
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 501
  ClientWidth = 883
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    883
    501)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 3
    Top = 3
    Width = 301
    Height = 150
    Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1080'-'#1080#1089#1087#1099#1090#1072#1090#1077#1083#1080
    TabOrder = 0
    object GridSotrud: TDBGrid
      Left = 2
      Top = 15
      Width = 297
      Height = 133
      Align = alClient
      DataSource = DSSotrud
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'FIO'
          Title.Caption = #1060#1048#1054
          Visible = True
        end>
    end
  end
  object GroupBox2: TGroupBox
    Left = 308
    Top = 3
    Width = 405
    Height = 150
    Caption = #1057#1090#1077#1085#1076#1099
    TabOrder = 1
    object GridStend: TDBGrid
      Left = 2
      Top = 15
      Width = 401
      Height = 133
      Align = alClient
      DataSource = DSStend
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NAME'
          Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ATTEST'
          Title.Caption = #1040#1090#1090#1077#1089#1090#1072#1094#1080#1103
          Width = 180
          Visible = True
        end>
    end
  end
  object GroupBox3: TGroupBox
    Left = 3
    Top = 157
    Width = 710
    Height = 65
    Caption = #1057#1073#1086#1088' '#1087#1086#1082#1072#1079#1072#1085#1080#1081' '#1074#1085#1077#1096#1085#1080#1084#1080' '#1087#1088#1080#1073#1086#1088#1072#1084#1080
    TabOrder = 2
    DesignSize = (
      710
      65)
    object Label1: TLabel
      Left = 12
      Top = 17
      Width = 110
      Height = 13
      Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1089#1073#1086#1088#1072' UIP:'
    end
    object Label2: TLabel
      Left = 8
      Top = 44
      Width = 114
      Height = 13
      Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1089#1073#1086#1088#1072' MNT:'
    end
    object Edit1: TEdit
      Left = 128
      Top = 14
      Width = 473
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 128
      Top = 41
      Width = 473
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object Button1: TButton
      Left = 603
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1088#1072#1090#1100
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 603
      Top = 39
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1088#1072#1090#1100
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = Button2Click
    end
    object BitBtn3: TBitBtn
      Left = 682
      Top = 12
      Width = 25
      Height = 25
      Hint = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1087#1091#1090#1100
      Caption = '?'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = BitBtn3Click
    end
    object BitBtn4: TBitBtn
      Left = 682
      Top = 39
      Width = 25
      Height = 25
      Hint = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1087#1091#1090#1100
      Caption = '?'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = BitBtn4Click
    end
  end
  object BitBtn1: TBitBtn
    Left = 719
    Top = 3
    Width = 162
    Height = 46
    Anchors = [akTop, akRight]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
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
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 719
    Top = 453
    Width = 162
    Height = 47
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C006000000000000000000000000000000000000FFFFFF3E3BC1
      0703BC0803C30803C20803C20804BF0805C00904C10804C00905C10804BF0805
      C00805C00804C00805C00805BD0804BD0805BD0703BD0804BE0902BA3D3ABCFF
      FFFF3F3CC40C07E41108FF1108FF1108FF1108FF1109FF1108FF1109FF1109FF
      1108FF1109FF1005FF0F06FE1109FF1108FF1108FF1109FF1108FF1108FF1109
      FF110AFF0E06E33E3BC10904C6110BFF100AFB100AFA100AFB100AFB100CFB10
      0AFA100AFA100AFA100BFA0D04F71128F50611F30D06F7100BFA100AFA100AFA
      100CFB100BFA100AFA100AFA110CFF0805C20907CC1213FE1112FA1112FB1112
      FB1212FB1112FB1112FB1112FA1112FB1113FC0200F3CCE6FDE0F3FD0000EE10
      11FA1212FB1112FB1112FB1111FA1112FA1112FA1313FF0906C80A07CF1419FF
      1217FB1318FB1318FB1319FB1319FB1217FB1217FB1318FB1319FC0000F1FFFF
      FFFFFFFF3E6FF30A08F41319FC1319FB1318FB1318FB1318FB1217FB1318FF09
      05CB0B08D2151EFF141CFB1419FB141DFC1419FB1419FB141AFB141CFB141CFB
      151DFD0000EEFFFFFFFFFFFF608CF40807F1151BFC1419FB141CFC141CFB1419
      FB141CFC151EFF0A08CE0B09D61622FE1520FC1520FC151FFB1520FB1520FB15
      20FC1520FC1520FC1622FE0000EAFFFFFFFFFFFF4C7CF10B0BEE1621FC1520FC
      1520FC1520FC1520FB1520FC1622FF0B09D20C0BD91826FF1724FC1623FB1623
      FB1724FC1724FC1724FC1724FC1825FD0F14F2133BEBFFFFFFFFFFFF0000E114
      21F91623FD1724FC1724FC1724FC1724FC1724FC1826FF0C0AD40D0BDB192AFF
      1827FC182AFC1827FC1827FC1827FC1827FC1828FD1725F80000E3D1E6FAFFFF
      FFFFFFFF0000E3192AFF1928FD1928FD1928FD1928FD1827FD1827FC192AFF0C
      0AD80C08DD1B2EFF1A2CFC1A2CFC1A2DFD1A2DFD1A2CFC1A2DFD192BFA0000E4
      6B9AF3FFFFFFFFFFFFFFFFFF0000DC1019F0111DF1111DF0111CF0121DF01728
      F71B2FFE1B2EFF0B07DA2B4BE91A2FFE192DFC1D33FE1E34FE1E34FE1C33FD1E
      36FF0501E5305EEBFFFFFFFFFFFFFFFFFFFFFFFF7BA3F02148E41638DF1637DD
      1637DD1839DA0003CC0F18ED1A30FF2B4BE74669EE618BFF1F3AEB0000E30000
      E00000DE0200DF0400DF133AE6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFADC9F31129D9608AFF4669EC4466EF618AFF
      3C66F1DEEFFAFFFFFFFFFFFF5D8DF10000D7E8F8FDFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFD2DFF8D2DFF8D2DFF8CDDBF6D2DFF87294E71129D96389FF41
      64ED4569F0648AFF375BEECDDEF9FFFFFFFFFFFF94B4F42D56E8FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0006D00626D41B40D7183DD7193DD6193D
      D6486BE56389FF4568EF466AF2658FFF385EECCDDEFAFFFFFFFFFFFF8DACF15C
      83ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFA3BDEF3958DF658EFF4469F0456BF36990FF365AE9CCDDF9FFFF
      FFFFFFFF88A8EF7C9FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF8EACE93756DB6991FF4569F2476CF46D96FF
      3659E8CCDAF8FFFFFFFFFFFF8BA8EF496FE5FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF1038D31538CF1437CD1437CD1837CB2946CF5C82F76894FF46
      6BF3476FF56F98FF3558E7CBDCF6FFFFFFFFFFFF8BA9EE3259E0FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5E3F7D5E3F7D5E3F7D5E3F7D5E3F72E4E
      CD6288F96D93FF476CF44A6FF7709AFF3558E6CBD9F7FFFFFFFFFFFF8CA9EE1F
      41D6EEF4FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFCFFFD2949C86189F86E96FF486FF54A70F8749DFF3457E1CDDDF7FFFF
      FFFFFFFF8EACEC2645D3799BE7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F
      58D3082CC40B2EC30C2BC11B38C2486BE5719BFF7098FF4870F64B71F9789FFF
      3758DEA5BEF1CCD9F5CFDDF67193E54668E62243CEE3EDFAFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7E9EE34568E07398FF739AFF4B
      72F8496FFA7DA2FF486BE63758DC3356DC3356DB3655DA587BEF597CF0203EC9
      3A5DD16183DDA3BDEFA3BDEFA3BDEFA3BDEFA3BDEFA3BDEFA3BDEF3D5CCB4B6E
      E5759AFF779DFF4970F9597AFE638CFE7EA2FF7EA3FF7DA2FF7DA2FF7EA3FF7C
      A1FF79A2FF7DA6FF6387F36287F34A6CE2496CE1496AE04A6CE14A6CE2496AE0
      496AE15C80EC7BA4FF79A1FF618BFC6D8AFCFFFFFF708FFF4A72FD4D74FE4D74
      FE4E76FD4C75FD4D74FE4D74FE4D74FE4D77FE4F76FF5077FF5078FF5079FF50
      79FE5079FE5079FF5179FE5077FD4D75FC4A70FC6E8CFDFFFFFF}
    TabOrder = 4
    OnClick = BitBtn2Click
  end
  object GroupBox4: TGroupBox
    Left = 3
    Top = 225
    Width = 710
    Height = 44
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1103' '#1085#1072#1087#1088#1103#1078#1077#1085#1080#1077#1084
    TabOrder = 5
    object Label3: TLabel
      Left = 12
      Top = 20
      Width = 29
      Height = 13
      Caption = #1055#1086#1088#1090':'
    end
    object Label4: TLabel
      Left = 140
      Top = 20
      Width = 162
      Height = 13
      Caption = #1053#1072#1087#1088#1103#1078#1077#1085#1080#1077' '#1082#1088#1091#1087#1085#1086#1075#1086' '#1096#1072#1075#1072', '#1074'.:'
    end
    object Label5: TLabel
      Left = 352
      Top = 20
      Width = 93
      Height = 13
      Caption = #1050#1088#1091#1087#1085#1099#1081' '#1096#1072#1075', '#1084#1089'.:'
    end
    object Label6: TLabel
      Left = 510
      Top = 20
      Width = 86
      Height = 13
      Caption = #1052#1077#1083#1082#1080#1081' '#1096#1072#1075', '#1084#1089'.:'
    end
    object CombCom: TComboBox
      Left = 48
      Top = 16
      Width = 81
      Height = 21
      TabOrder = 0
      Text = 'CombCom'
    end
    object Edit3: TEdit
      Left = 305
      Top = 16
      Width = 36
      Height = 21
      TabOrder = 1
      Text = 'Edit3'
    end
    object Edit4: TEdit
      Left = 451
      Top = 16
      Width = 53
      Height = 21
      TabOrder = 2
      Text = 'Edit4'
    end
    object Edit5: TEdit
      Left = 602
      Top = 16
      Width = 59
      Height = 21
      TabOrder = 3
      Text = 'Edit5'
    end
  end
  object GroupBox5: TGroupBox
    Left = 3
    Top = 268
    Width = 710
    Height = 229
    Caption = #1045#1076#1080#1085#1080#1094#1099' '#1080#1079#1084#1077#1088#1077#1085#1080#1103' '#1089#1086#1087#1088#1086#1090#1080#1074#1083#1077#1085#1080#1103
    TabOrder = 6
    object ListBox1: TListBox
      Left = 2
      Top = 15
      Width = 408
      Height = 212
      Align = alLeft
      ItemHeight = 13
      TabOrder = 0
      OnClick = ListBox1Click
    end
    object Memo1: TMemo
      Left = 416
      Top = 15
      Width = 214
      Height = 211
      ScrollBars = ssVertical
      TabOrder = 1
    end
    object Button3: TButton
      Left = 632
      Top = 15
      Width = 75
      Height = 25
      Caption = #1047#1072#1087#1080#1089#1072#1090#1100
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object TabSotrud: TFDTable
    Active = True
    Connection = FZamerV2.FDC
    TableName = 'zsotr'
    Left = 44
    Top = 40
  end
  object DSSotrud: TDataSource
    DataSet = TabSotrud
    Left = 108
    Top = 40
  end
  object DSStend: TDataSource
    DataSet = TablStend
    Left = 388
    Top = 56
  end
  object TablStend: TFDTable
    Active = True
    IndexFieldNames = 'NAME'
    Connection = FZamerV2.FDC
    TableName = 'Zstend'
    Left = 332
    Top = 56
  end
  object OpenDialog1: TOpenDialog
    Left = 264
    Top = 20
  end
  object QTemp: TFDQuery
    Connection = FZamerV2.FDC
    Left = 648
    Top = 84
  end
end
