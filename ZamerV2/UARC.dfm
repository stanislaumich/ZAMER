object FARC: TFARC
  Left = 0
  Top = 0
  Caption = #1042#1089#1077' '#1080#1089#1087#1099#1090#1072#1085#1080#1103
  ClientHeight = 472
  ClientWidth = 1012
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  DesignSize = (
    1012
    472)
  PixelsPerInch = 96
  TextHeight = 13
  object GB1: TGroupBox
    Left = 3
    Top = 0
    Width = 1005
    Height = 469
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #1057#1087#1080#1089#1086#1082' '#1080#1089#1087#1099#1090#1072#1085#1080#1081
    TabOrder = 0
    DesignSize = (
      1005
      469)
    object Label1: TLabel
      Left = 884
      Top = 108
      Width = 6
      Height = 13
      Caption = '0'
      Visible = False
    end
    object Label2: TLabel
      Left = 884
      Top = 124
      Width = 6
      Height = 13
      Caption = '0'
      Visible = False
    end
    object GridSpis: TDBGrid
      Left = 2
      Top = 15
      Width = 871
      Height = 452
      Align = alLeft
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DSSpis
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = GridSpisDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'DATA'
          Title.Caption = #1044#1072#1090#1072
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMER'
          Title.Caption = #8470' '#1080#1089#1087'.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPDV'
          Title.Caption = #1058#1080#1087' '#1076#1074'.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMDV'
          Title.Caption = #1053#1086#1084#1077#1088' '#1076#1074'.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'POLUS'
          Title.Caption = #1055#1086#1083#1102#1089
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNOM'
          Title.Caption = 'U '#1085#1086#1084'.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UISP'
          Title.Caption = 'U '#1080#1089#1087'.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PNOM'
          Title.Caption = 'P '#1085#1086#1084'.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENERGO'
          Title.Caption = #1069#1085#1077#1088#1075#1086#1101#1092#1092'.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STENDN'
          Title.Caption = #1057#1090#1077#1085#1076
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REGIM'
          Title.Caption = #1056#1077#1078#1080#1084
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FIO'
          Title.Caption = #1060#1048#1054
          Visible = True
        end>
    end
    object BitSelect: TBitBtn
      Left = 879
      Top = 16
      Width = 120
      Height = 40
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1088#1072#1090#1100
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
      ModalResult = 1
      TabOrder = 1
      OnClick = BitSelectClick
    end
    object BitReport: TBitBtn
      Left = 879
      Top = 62
      Width = 120
      Height = 40
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1095#1077#1090
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFF7A4E0D7A4E0D7C4D087B4D087B4D087B4D087B4D087B4D087B4D087B4D
        087B4D087B4D087B4D087B4D087B4D087A4C07764708764708764708FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF7A4E0DF2EEE4F2EEE4F2EEE4F2EEE4F2EEE4F2EEE4
        F2EEE4F2EEE4F2EEE4F2EEE4F2EEE4F2EEE4F2EEE4F2EEE4F2EEE4F2EEE4F2EE
        E4764708FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F5314EEE9E1FFFFFF00A3FF00
        A3FFFFFFFF0000FF0000FFFFFFFF03E61803E618FFFFFFFFFFFFDE890ADE890A
        DE890AFFFFFFF2EEE47F5314FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF90682AEEE9
        E1FFFFFF0099E80099E3F2EFE30000E50000E5F2EFE503D81603D115ECE2DAED
        E5DBD07D09D17D09CA7808FFFFFFE4DBCC835410FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF90682AEEE9E1FFFFFF009BED009BEEF5F2EE0000EE0000EEF5F2EE03DA
        1603DC16F5F4EAF0F2EAF2F0EDF6F4F1F3EEE8FFFFFFE3DACA845611FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF9E7B41EEE9E1FFFFFF009BED009BEDF5F2EDF5F2ED
        F5F2EDF5F2ED03DA1603DA16F5F2EBF4F2E7D58209D58209D38009FFFFFFE3D9
        CA845611FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E7B41EEE9E1FFFFFF009BED00
        9BEDF5F2EDF5F2EDF5F2EDF5F2ED03DA1603DA16F6F2EEF6F3EED68309D68309
        D48209FFFFFFE3D9CA845611FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E7B41EEE9
        E1FFFFFF009BED009BEDF5F2EDF5F2EDF5F2EDF5F2ED03DD1703DA16F6F2EFF9
        F4F4F9F5F3F9F5F1F5F2EBFFFFFFE3D9C9845611FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF9E7B41EEE9E1FFFFFF009BED009BEDF5F2EDF5F2EDF5F2EDF5F1EC03DF
        1703DA16F8F4F0FCF6F4DA8409DC840AD58009FFFFFFE3D9C9845611FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF9E7B41EEE9E1FFFFFFF5F3EDF5F2EDF5F2EDF5F2ED
        F5F2EDF5F2EC03DD1603DD17FCF9F2FAF7F1DA8409DB850AD47F09FFFFFFE3DA
        CB845612FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E7B41EEE9E1FFFFFFF5F3EDF5
        F2EDF5F2ECF3F0EBF4F0EBF8F0F003DA1703E017FAFDF1FBFCF9FCF8F9F7F3EE
        EEE5DAFFFFFFE5DBCF845713FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C7D4EEEE9
        E1FFFFFFF7F4ECF6F2EFF5F2ECF7F4F0F9F5F3FAF4F303E11703E417FBFAF9FC
        F7F6D78409D47F09CB7808FFFFFFE2D3C4855915FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFA08659EEE9E1FFFFFFFBFAF4F9F8F3F8F8EFFAF8F6FBF9FBFAF9F8FAFB
        F6FBFCFCF9F8F9F5F4EED37F09CE7D09C67608F8F4F2DACAB6875B17FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFA58E65EEE9E1FFFFFFFCFFFCFAFCF6FAFCF4FAFAF9
        FAFAFDFAFAFDFAFAFDFCF7F9F5F5F2EEF1E7EFE5E0E7E4DBDED4C7EFE6E0D1BF
        A5885D1AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB1946EEEE9E1FFFFFFDB870ADA
        860ADA860ADA860ADA860ADA860ADB870AD78409D38009CF7E09CB7909C67708
        C06E07E3DBCCC7B6958A5E1DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB89E75EEE9
        E1FFFFFFDB870ADA860ADA860ADA860ADA870ADA870AD8860AD78209D27F09CD
        7D09CC7808C77408BE6B07DED2C1C1AE8F8B6220FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFBBA47DEEE9E1FFFFFFF9FCFCFAFAFAFAFAFAFAFBFCFAFCF9F8F9F0F5F1
        EBF0EEE5EBE3DAC5B395C5B395C4A688BEA57CBEA57CA480488E6527FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFBCA682EEE9E1FFFFFFF7FCFCFAFAFAFAFBFBFAFCFA
        F8F9F1F4F1E6F1EBE2EEEAE4E0D4C3BDA178FFFFFFF3F1F0F2EEE4DAD3C6B89D
        7490682AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCA584EEE9E1FFFFFFF9FCFCFA
        FAFBFCFCFCF8F9F4F3F0EAEFE9E0EEE3DAEDE3DAD1C1A9BDA178FFFFFFF2EEE4
        DCCEBDB89D749E7B41FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBEA886EEE9
        E1FFFFFFFCFCFCFAFBFCFDFBF6F5F3EEEBE8E5E8DFD8E7D7CCE2D4C6CEB89EAC
        9467F2EEE4EEE8E1B4986A9E7B41FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFBEAB89EEE9E1FFFFFFFAFAFCF6FAF3F9F0E9F4E8E0E8E2D8E3DBD0DED0
        BDDCCEB8CAB28FAC9467D8D0C1B5996F9E7B41FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFBEAB89EEE9E1FFFFFFFFFFFFFEFFFEF8F5F4F5EDE7
        ECE4D9E0D7CBDACCB4D7C4AFC3AD86997B41BCA17B9E7B41FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0AE8CEEE9E1EEE9E1F1EEE6EC
        E3DCE2DBCEDED3C2D9CCB7CEC1A5CBB494C5AC8BAC9467997B419A723AFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0AE8CC1AC
        8BBFA987BEA886BFA986BFA988C0AA89C0AB8BBEA27BBEA47EB59D6FA78D5C9A
        723AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ModalResult = 6
      TabOrder = 2
      OnClick = BitReportClick
    end
    object BitDelete: TBitBtn
      Left = 879
      Top = 427
      Width = 120
      Height = 40
      Anchors = [akRight, akBottom]
      Caption = #1059#1076#1072#1083#1080#1090#1100
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
      TabOrder = 3
    end
  end
  object DSSpis: TDataSource
    DataSet = QuerySpis
    Left = 72
    Top = 52
  end
  object QuerySpis: TFDQuery
    Active = True
    Connection = FZamerV2.FDC
    SQL.Strings = (
      'select * from zdvigall order by nomer desc')
    Left = 36
    Top = 52
  end
  object QTemp: TFDQuery
    Left = 60
    Top = 96
  end
end
