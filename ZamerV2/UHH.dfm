object FormHH: TFormHH
  Left = 0
  Top = 0
  Caption = #1061#1086#1083#1086#1089#1090#1086#1081' '#1093#1086#1076
  ClientHeight = 759
  ClientWidth = 1043
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnHide = FormHide
  OnShow = FormShow
  DesignSize = (
    1043
    759)
  PixelsPerInch = 96
  TextHeight = 25
  object Label6: TLabel
    Left = 8
    Top = 718
    Width = 395
    Height = 33
    Alignment = taRightJustify
    Anchors = [akLeft, akBottom]
    Caption = #1055#1077#1088#1077#1082#1086#1089' '#1092#1072#1079' '#1087#1086' '#1090#1086#1082#1091' (I), %:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitTop = 621
  end
  object Label10: TLabel
    Left = 409
    Top = 718
    Width = 17
    Height = 33
    Anchors = [akLeft, akBottom]
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitTop = 621
  end
  object Label15: TLabel
    Left = 567
    Top = 215
    Width = 261
    Height = 57
    Caption = 
      #1055#1088#1080' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1080' '#1090#1072#1073#1083#1080#1094#1099' '#1080#1089#1087#1099#1090#1072#1085#1080#1081' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1074#1099#1093#1086#1076#1103#1097#1080#1077' '#1079#1072' '#1087#1088#1077#1076#1077#1083#1099' '#1076 +
      #1080#1072#1087#1072#1079#1086#1085#1072' '#1086#1090#1073#1088#1072#1089#1099#1074#1072#1102#1090#1089#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label8: TLabel
    Left = 582
    Top = 278
    Width = 199
    Height = 25
    Caption = #1045#1076'. '#1080#1079#1084'. '#1089#1086#1087#1088#1086#1090#1080#1074#1083'.:'
  end
  object Label9: TLabel
    Left = 280
    Top = 708
    Width = 7
    Height = 25
    Visible = False
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1043
    Height = 29
    Align = alTop
    TabOrder = 0
    object Label11: TLabel
      Left = 4
      Top = 2
      Width = 31
      Height = 25
      Caption = #8470':'
    end
    object Label12: TLabel
      Left = 41
      Top = 2
      Width = 11
      Height = 25
      Caption = '0'
    end
    object Label5: TLabel
      Left = 162
      Top = 2
      Width = 315
      Height = 25
      Alignment = taRightJustify
      Caption = #1048#1089#1087#1099#1090#1072#1090#1077#1083#1100#1085#1086#1077' '#1085#1072#1087#1088#1103#1078#1077#1085#1080#1077', '#1042'.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 483
      Top = 2
      Width = 11
      Height = 25
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 207
    Width = 561
    Height = 101
    Caption = #1048#1089#1087#1099#1090#1072#1085#1080#1077' '#1084#1077#1078#1074#1080#1090#1082#1086#1074#1086#1081' '#1080#1079#1086#1083#1103#1094#1080#1080
    TabOrder = 1
    object Label14: TLabel
      Left = 8
      Top = 28
      Width = 243
      Height = 25
      Caption = #1087#1088#1080' U=1,3U'#1085',3 (1**) '#1084#1080#1085
    end
    object Label4: TLabel
      Left = 8
      Top = 81
      Width = 194
      Height = 16
      Caption = '** '#1077#1089#1083#1080' I'#1093#1093'('#1087#1088#1080' 1,3 U'#1085') >I'#1085', 4'#1040#1057
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 59
      Width = 150
      Height = 16
      Caption = '* '#1086#1076#1085#1086#1092#1072#1079#1085#1099#1081' '#1076#1074#1080#1075#1072#1090#1077#1083#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object GroupBox2: TGroupBox
      Left = 362
      Top = 21
      Width = 191
      Height = 76
      TabOrder = 0
      object RadioButton4: TRadioButton
        Left = 8
        Top = 3
        Width = 177
        Height = 23
        Caption = #1042#1099#1076#1077#1088#1078#1072#1083
        TabOrder = 0
        OnClick = RadioButton4Click
      end
      object RadioButton5: TRadioButton
        Left = 8
        Top = 26
        Width = 177
        Height = 22
        Caption = #1053#1077' '#1074#1099#1076#1077#1088#1078#1072#1083
        TabOrder = 1
        OnClick = RadioButton5Click
      end
      object RadioButton6: TRadioButton
        Left = 8
        Top = 49
        Width = 177
        Height = 24
        Caption = #1053#1077' '#1087#1088#1086#1074#1086#1076#1080#1083#1086#1089#1100
        Checked = True
        TabOrder = 2
        TabStop = True
        OnClick = RadioButton6Click
      end
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 314
    Width = 273
    Height = 403
    Anchors = [akLeft, akTop, akBottom]
    Caption = #1042#1099#1073#1086#1088' '#1074#1072#1088#1080#1072#1085#1090#1072' '#1080#1089#1087#1099#1090#1072#1085#1080#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    DesignSize = (
      273
      403)
    object StringGrid1: TStringGrid
      Left = 3
      Top = 28
      Width = 266
      Height = 338
      Anchors = [akLeft, akTop, akBottom]
      ColCount = 4
      DrawingStyle = gdsClassic
      RowCount = 12
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goEditing, goFixedRowDefAlign]
      TabOrder = 2
      OnClick = StringGrid1Click
      OnDrawCell = StringGrid1DrawCell
    end
    object RadioButton1: TRadioButton
      Left = 94
      Top = 372
      Width = 13
      Height = 17
      Anchors = [akLeft, akBottom]
      TabOrder = 3
      OnClick = RadioButton1Click
    end
    object RadioButton2: TRadioButton
      Left = 158
      Top = 372
      Width = 21
      Height = 17
      Anchors = [akLeft, akBottom]
      TabOrder = 4
      OnClick = RadioButton2Click
    end
    object RadioButton3: TRadioButton
      Left = 220
      Top = 372
      Width = 20
      Height = 17
      Anchors = [akLeft, akBottom]
      TabOrder = 5
      OnClick = RadioButton3Click
    end
    object BitBtn1: TBitBtn
      Left = 7
      Top = 368
      Width = 32
      Height = 32
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1089' '#1076#1080#1089#1082#1072
      Anchors = [akLeft, akBottom]
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        080000000000000100000000000000000000000100000000000000000000FFFF
        FF00008E0300018C0400048F0A00048C0B0000800200FF00FF0000900200008A
        0400007B0400088E1100098F130000730200028006001BAA3400017903001294
        CF001190C900007F0200007C02000888100022B742000278060000710200006E
        0200A4E3F300058044000F941E0026BE49002AC550002BC85300139425000062
        02007BF9FF0046C6E700098467000C8A190027BE4A000B8517000980670079F7
        FF0079F7FE0078F6FE0077F5FE0076F4FE0075F3FE003AAF7E00006D020039AE
        7E00F2FEFF0075F2FD0074F2FD0073F1FD0073F0FD0072F0FD0071EFFD0071EE
        FD0070EDFC006FEDFC00D5FBFE0040BFE500108BC200B7F5FE0064E3F80047B9
        E000D6F8FC00E0FAFD00ACE9F6001291CA0097EEFC0036B6E1009CE7F600DCFD
        FF00A9F9FE00ADF9FE00ADF8FE00ACF8FE00ACF7FE0036AFDC000D73A20068DA
        F5001F9ED400C5F7FD0099F3FE0070EEFC006FECFC006EECFC006DEBFC006DEA
        FC004CCCEB002DAEDD005CC5E700ADF2FD006AE7FB0069E6FB0068E5FA0067E4
        FA0066E3FA0063E0F9001D9ED5000F77A70086DFF50078E3FA0062DFF9003CBC
        E5001194CF001186BC0048FF85006CFF9D0090FFB500B4FFCD00003E0000005D
        0000007C0000009B000000BA000000D9000000F0000024FF240048FF48006CFF
        6C0090FF9000B4FFB400143E00001E5D0000287C0000329B00003CBA000046D9
        000055F000006DFF240085FF48009DFF6C00B5FF9000CDFFB4002A3E00003F5D
        0000547C0000699B00007EBA000093D90000AAF00000B6FF2400C2FF4800CEFF
        6C00DAFF9000E6FFB4003E3E00005D5D00007C7C00009B9B0000BABA0000D9D9
        0000F0F00000FFFF2400FFFF4800FFFF6C00FFFF9000FFFFB4003E2A00005D3F
        00007C5400009B690000BA7E0000D9930000F0AA0000FFB62400FFC24800FFCE
        6C00FFDA9000FFE6B4003E1400005D1E00007C2800009B320000BA3C0000D946
        0000F0550000FF6D2400FF854800FF9D6C00FFB59000FFCDB4003E0000005D00
        00007C0000009B000000BA000000D9000000F0000000FF242400FF484800FF6C
        6C00FF909000FFB4B4003E0014005D001E007C0028009B003200BA003C00D900
        4600F0005500FF246D00FF488500FF6C9D00FF90B500FFB4CD003E002A005D00
        3F007C0054009B006900BA007E00D9009300F000AA00FF24B600FF48C200FF6C
        CE00FF90DA00FFB4E6003E003E005D005D007C007C009B009B00BA00BA00D900
        D900F000F000FF24FF00FF48FF00FF6CFF00FF90FF00FFB4FF002A003E003F00
        5D0054007C0069009B007E00BA009300D900AA00F000B624FF00C248FF00CE6C
        FF00DA90FF00E6B4FF0014003E001E005D0028007C0032009B003C00BA004600
        D9005500F0006D24FF008548FF009D6CFF00B590FF00CDB4FF00070707070707
        070707070707070707071111111111111111111111116B070707111166676868
        6868686868696A070707115B5C5D5E5F60606161626364650707115152535455
        3A3B565758595A45070711464748494A4B4B4C4C4D4E4E4F5007113F40414243
        43434343434343444507113C383D111111111111111111113E0711322E333435
        363738393A3B110707071101292A2B2C2C2D2E2F303111070707110122222222
        2311242526272807070711010101011A111B1C1D1E1F20210707111111111111
        121314151617181907070707070707070707070E0F1007070707070707070809
        07070A0B0C0D0707070707070707070702030405060707070707}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn3: TBitBtn
      Left = 45
      Top = 367
      Width = 32
      Height = 32
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1085#1072' '#1076#1080#1089#1082
      Anchors = [akLeft, akBottom]
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        080000000000000100000000000000000000000100000000000000000000FFFF
        FF00B37D6C00B27E6C00B27D6B00B17C6A00B17B6900B17B6800B17A6700B179
        6600B1796500B1786400B1776300B1776200B0766100B0756000AB705C00FF00
        FF00B17C6B00DBB79A00EBCDAC00DFBA9A00DEB89800B0735C00B17A6800D8B1
        9500E7C6A600DAB29400D9B09200B0715A00D5AC8F00E2C0A000D6AB8D00D4A9
        8B00AF6F5700D1A78A00DEB89900DBCBBD00D1A38500D0A18300AF6D5400CEA0
        8400D9B19300CD9B7D00CB997B00AF6B5100B0735D00CB9B7F00D5AA8C00C893
        7500C7917200AE694E00C8957900D0A28400C38A6D00C2886A00AE674C00C48E
        7300CB9A7D00C9927300C37D5800C27A5500C0775200BF744F00BE724D00BC6F
        4900BB6C4600BA694300B8664100BC7C5D00AE654900C1896C00C7927500C385
        6500BA613700B85E3400B75C3100B6592E00B4552A00B2522700B1502400B04D
        2100AE4A1E00B7715100AE634600AF6B5200BE826600C2896C00BE7C5C00DCB0
        9B00D8A79300AA421600A93F1200B1674700AD624300AE694F00BA7C5F00BD81
        6400BA735200A1999600B2B2B2005F514C00F5F5F500F0F0F000ECECEC00A537
        0A00A3340700AD5D3D00AD604100AE684C00B7755800B9775A00B5694900F3F3
        F300EEEEEE00EAEAEA00A02D0000AB5A3900AE664900B16A4D00B26A4D00AE5C
        3B00F1F1F100EDEDED00E8E8E800AC604100A8614500AC624400AD624500AA56
        3300AB59390094523700230000004C1B430000000000608143004C7011000000
        00000000000094120000130000000A000000C2EBE500EE000000982C1200982C
        1200C00400000000000000000000000000000000000000000000000000000800
        010000000000CC7543009C2C12000100000018010000500000000A000000AA08
        0000000000000101010000000000010300000000000054091200000000000F00
        0000D02D12000000F400B455120000000000F5FFFF0000000000000000000000
        0000000000001001000000000000000000000000000000000000000000000000
        000060C0440000000000000000000000000000000000C83755003C4D11009836
        55003C4D11000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000903F55003C4D110000000000000000007C23
        120000000000C83455003C4D110020E711005009120028000000000000000000
        00000000000000000000207343009C2C12005C0100001B000000000000000800
        0000627443006C6F720074010000770100004CE4500000000000000000000000
        0000000000000000000000000000000000000800010000000000CC754300102E
        1200150000000100000014000000140000008200000000000000111111111111
        111111111111111111117E7F8081646464646464647474828311767778796364
        657A7B7C647474757D116D6E6F70636465717273647474756C115F6061626364
        6566676864696A6B6C11555657585901010101015A5B5C5D5E11284748494A4B
        4C4D4E4F50515253541122393A3B3C3D3E3F40414243444546111D3435010101
        010101010101363738112E2F30012525252525252501313233110F292A010101
        0101010101012B2C2D110D2324012525252525252501262728110A1E1F010101
        0101010101012021221118191A0101010101010101011B1C1D11121314010101
        0101010101011516171102030405060708090A0B0C0D0E0F1011}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BitBtn3Click
    end
  end
  object GroupBox4: TGroupBox
    Left = 275
    Top = 314
    Width = 768
    Height = 392
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #1055#1088#1086#1074#1077#1076#1077#1085#1080#1077' '#1080#1089#1087#1099#1090#1072#1085#1080#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    DesignSize = (
      768
      392)
    object StringGrid2: TStringGrid
      Left = 3
      Top = 28
      Width = 762
      Height = 337
      Anchors = [akLeft, akTop, akRight, akBottom]
      ColCount = 7
      DefaultColWidth = 100
      DrawingStyle = gdsClassic
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goEditing, goFixedRowDefAlign]
      ParentFont = False
      TabOrder = 1
      OnClick = StringGrid2Click
      OnDrawCell = StringGrid2DrawCell
    end
    object ProgressBar1: TProgressBar
      Left = 3
      Top = 368
      Width = 762
      Height = 21
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 0
    end
  end
  object BitStart: TBitBtn
    Left = 604
    Top = 717
    Width = 149
    Height = 41
    Anchors = [akLeft, akBottom]
    Caption = #1057#1090#1072#1088#1090' F5'
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8EAD0EFCA8DE8B255E3A43AE6AC42E6AC
      42E3A43AE8B255EFCA8DF8EAD0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEEDCE0A13CE6AE49F0C86CF4D482
      F7DB8CF6DA8BF6DA8BF7DB8CF4D482F0C86CE6AE49E0A13CFAEEDCFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECC68CDEA23CF3CE75F7
      D88AF6D686F5D584F5D483F5D483F5D483F5D483F5D584F6D686F7D88AF3CE75
      DEA23CECC68CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7BB7AE3AA
      49F6D584F5D383F5D381F5D382F4D381F4D280F4D280F4D280F4D280F4D280F4
      D280F4D281F5D383F6D584E3AA49E7BB7AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      E8C089E0A845F6D584F3D07DF4D07DF3CF7AEABE65F9D884F4D17EF3CF7CF3CF
      7CF3CF7CF3CF7CF3CF7CF3CF7CF3CF7CF3D07DF6D584E0A845E8C089FFFFFFFF
      FFFFFFFFFFF8EBDAD79536F3CF79F3CD79F2CC78F6D37FB86B1E9B4508B86A18
      F1CB6FF5D27EF3CD79F2CC78F2CC78F2CC78F2CC78F2CC78F2CC78F3CD79F3CF
      79D79536F8EBDAFFFFFFFFFFFFD18A33ECC065F2CC74F1CA72F1CA72F6D279B6
      6213F0EBDFDABB939E4400CF8C34F3CC73F4CE75F1CB73F1CA72F1CA72F1CA72
      F1CA72F1CA72F2CC74ECC065D18A33FFFFFFF4E2CCD7963AF3CB73F0C66DF0C6
      6DF0C66DF5CE73B66615F2E7DFFFFFFFFEFFFFC58C4EAA5006DCA044F6CE74F1
      C96FF0C66DF0C66DF0C66DF0C66DF0C66DF3CB73D7963AF4E2CCE1B482E3AE51
      EFC46AEEC268EEC268EEC268F2C96EBC6918F1E7DFFFFFFFFFFFFFFFFFFFF3ED
      E3BB7228BA6918E3AF53F2C86EEFC369EEC268EEC268EEC268EFC46AE3AE51E1
      B482CE8A43EDC36FECBB60ECBD62ECBD62ECBD62EFC367BE6D19F2E8DFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFEBD9C4AF5A0CC97E27EDBF62EEBF65ECBC63ECBD
      62ECBB60EDC36FCE8A43C3741FF6D89CECC16BEAB858EABA5CEABA5CEDC060C1
      741CF3EBE0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBB988B45A0A
      D49136EEC061EAB85AECC16BF6D89CC3741FC57828F3D491F0CD8EEBBD63E9B3
      51E9B554ECBA58C8781DF4ECE1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFD09A56C06F1CEBBF64F0CD8EF3D491C37626BD7223F0D189
      ECCA82ECCB85EAC374E6AF4BE7B34ECB7D1EF4EBE2FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFDCAE70D3984BEDCA85ECCA82F0D189BD
      7223B36019EECB83EBC57CEBC57CEBC67EEBC67DEBBE62CF8220F5EDE1FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7CCA4CD882DE1B46BECC77CECC6
      7DEBC57CEECB83B36019BE7538E5C282EAC276E9C277E9C277E9C278EAC57BDD
      B064F7F1E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4EADBD9A253DFB166EAC377
      EAC379E9C278E9C277EAC276E5C282BE7538D2A279D39E57EED191E9C06DE8C0
      70E8C070E9C171E1B260F9F3EAFFFFFFFFFFFFFFFFFFFAF5F0E5BF83E0B061E6
      BD6CE9C271E8C171E8C070E8C070E9C06DEED191D39E57D2A279ECD8C8B86B22
      EFD49EE9C378E8BB66E8BB68E8BC68E4B462F9F4EDFFFFFFFFFEFFEED7AFE3B1
      60E5BA67E9BD69E8BD6AE8BD69E8BD69E8BB68E8BB66E9C378EFD49EB86B22EC
      D8C8FFFFFFAC5A1BD7A65FF0D69AE9C77EE5B75FE5B95EE7B864FBF5F2F5E5CC
      E7BE71E6B862E6BA5FE6BA61E6BA61E6BA61E6BA61E6B95FE5B75FE9C77EF0D6
      9AD7A65FAC5A1BFFFFFFFFFFFFF0E2D6AA5917E3BD78EED192EACB88E6BC67EA
      BC67EDC67DE9BB65E3B558E4B657E4B658E4B657E4B557E3B555E3B351E7BD68
      EACB88EED192E3BD78AA5917F0E2D6FFFFFFFFFFFFFFFFFFCD9C77B46922E5C2
      7AEBCE89EACB87E9C881E8C273E3B557E1B24CE1AE4BE1AE4BE1B24DE3B65AE6
      C16EEAC77FEACB88EBCE89E5C27AB46922CD9C77FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFC38A63B46820DFB46AE9CA7FEAC97EEAC87EEAC97FEAC980EACA81EACA
      81EAC980EAC97FEAC87EEAC97EE9CA7FDFB46AB46820C38A63FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFC79876A35014D19A4CE4BE71E8C87AE9C77B
      E8C579E8C579E8C579E8C579E9C77BE8C87AE4BE71D19A4CA35014C79876FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFD49D4A12AC
      5D19C6883AD9A95AE2B96CE6C274E6C274E2B96CD9A95AC6883AAC5D199D4A12
      EEDFD4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFE7D3C5C49271A65D2C97410AA15111A1511197410AA65D2CC4
      9271E7D3C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    TabOrder = 7
    OnClick = BitStartClick
  end
  object BitSave: TBitBtn
    Left = 758
    Top = 717
    Width = 282
    Height = 41
    Anchors = [akLeft, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1079#1072#1082#1088#1099#1090#1100
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
    TabOrder = 8
    OnClick = BitSaveClick
  end
  object BitClear: TBitBtn
    Left = 433
    Top = 717
    Width = 165
    Height = 41
    Anchors = [akLeft, akBottom]
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
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
    TabOrder = 6
    OnClick = BitClearClick
  end
  object GroupBox5: TGroupBox
    Left = 0
    Top = 33
    Width = 865
    Height = 176
    Caption = #1055#1086#1082#1072#1079#1072#1085#1080#1103' '#1076#1072#1090#1095#1080#1082#1086#1074
    TabOrder = 5
    DesignSize = (
      865
      176)
    object Label16: TLabel
      Left = 46
      Top = 60
      Width = 359
      Height = 33
      Caption = #1058#1077#1082#1091#1097#1077#1077' '#1085#1072#1087#1088#1103#1078#1077#1085#1080#1077', '#1042'.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label17: TLabel
      Left = 16
      Top = 99
      Width = 92
      Height = 29
      Caption = #1058#1086#1082', '#1040'.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label18: TLabel
      Left = 215
      Top = 99
      Width = 190
      Height = 29
      Caption = #1052#1086#1097#1085#1086#1089#1090#1100', '#1042#1090'.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label21: TLabel
      Left = 7
      Top = 28
      Width = 398
      Height = 33
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1077' '#1085#1072#1087#1088#1103#1078#1077#1085#1080#1077', '#1042'.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label22: TLabel
      Left = 411
      Top = 60
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
    object Label23: TLabel
      Left = 114
      Top = 99
      Width = 15
      Height = 29
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label24: TLabel
      Left = 413
      Top = 99
      Width = 15
      Height = 29
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label26: TLabel
      Left = 411
      Top = 28
      Width = 78
      Height = 33
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 500
      Top = 66
      Width = 281
      Height = 25
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1082#1083#1086#1085#1077#1085#1080#1077' '#1085#1072#1087#1088#1103#1078#1077#1085#1080#1103', '#1042'.'#30':'
      ExplicitLeft = 463
    end
    object Label1: TLabel
      Left = 590
      Top = 32
      Width = 191
      Height = 25
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = #1042#1088#1077#1084#1103' '#1079#1072#1087#1080#1089#1080', '#1089#1077#1082'.:'
      ExplicitLeft = 553
    end
    object BitBtn2: TBitBtn
      Left = 4
      Top = 63
      Width = 37
      Height = 29
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFF2C2BC13133E40A0DE30E0ED95A59D6E7E6F5FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFA6A4DD494AE6535CFF0F12F91618FC1010E5E6E5F5
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAA9DF4649E4535CFC12
        16F71619FB0D0DD8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6663D0FFFFFFFFFFFFFFFFFFFFFF
        FFE5E5F65659EA1318F7161AF71719FA9290D7FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5661EE252ADF
        FFFFFFFFFFFFFFFFFF4747DF2430FA171EF6171DF6171CFC4B49CDFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF5F6AEE1930FD2B2FDEFFFFFF4646E12939FB1722F81722F61821F6181FFC
        3936CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF4144E4364EF91D33FA131AE32D41FA1928F81B29F71A
        25F81923F81921FA6967D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4745DF7C94FF1931F61D31F81C2F
        F71C2EF71B2AF71C2CFC1117DD0D0ECF1113DFADABE9FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D6F74449E9
        7C95FF2036F7182DF7182BF71729F81017E00500A00803AC1010D6151AEDACAB
        EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFBEBCF22523DE7381F77089FE5C77FC6277FB4C58E70400A70905B8
        0A06BC1012DC151AECE9E8FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF918EEA5D58DF4943DA7D78E150
        59F14E57EA0500B80A07C60B07CA1112E2161EEFE7E6FAFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFACA9EF525AF14E57ED0500C70D07D20E08D51414E9161CEEE7
        E6FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFABA9F1525AF24F5AEF0700D30F08
        DB0E09E01314EE161EEDE8E7FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFACA9F1
        525BF1525BF20600DE0E09E60F0AE91415F3161EEDA4A2EE605CE14A46DC9593
        EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFACA9F2535BF2535BF50701E9100AEE1008F1161AF61924F8
        1924F91923F9161AF3110EDEACAAF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFACA9F3535CF1545EF80800F010
        09F31A24F61B2AF71A25F71822F61721F7181FF91212E8C7C5F6FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFACAA
        F54145EF4D5AF91827F61C2FF71B2AF71B29F71925F7212BF81822F6181EF93B
        38E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF7D78ED566DF91A30F71D31F71C2EF71B2BF71A2AF83A3C
        EF7283FC141EF71112EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5DF1516AFA1B31F71E33F71D31F7
        1D32F92D30EEFFFFFF4B4AF07383FC1217F1FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D5AF25F7BFA1B
        32F62036F72037F83235F1FFFFFFFFFFFFFFFFFF4C4BF2494DF3FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF938FF78599FB1F37F62038F71C29F4E5E4FDFFFFFFFFFFFFFFFFFFFFFFFF6B
        67F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF454BF7637EFA1832F6213AF71B26F5E7E6FEFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2D0FD5B67F87591FB334EF8
        1C37F71725F4E3E2FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7
        E6FE716FF95157F76370F85D65F84444F5FFFFFFFFFFFFFFFFFF}
      TabOrder = 2
      TabStop = False
      OnClick = BitBtn1Click
    end
    object Edit2: TEdit
      Left = 787
      Top = 63
      Width = 70
      Height = 33
      Anchors = [akTop, akRight]
      TabOrder = 1
      Text = '1'
    end
    object Edit1: TEdit
      Left = 787
      Top = 27
      Width = 70
      Height = 33
      Anchors = [akTop, akRight]
      TabOrder = 0
      Text = '15'
    end
  end
  object ComboBox1: TComboBox
    Left = 787
    Top = 275
    Width = 76
    Height = 33
    TabOrder = 4
    Text = #1052#1054#1084
  end
  object TimUp: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TimUpTimer
    Left = 308
    Top = 341
  end
  object QUp: TFDQuery
    Connection = FZamerV2.FDC
    SQL.Strings = (
      '')
    Left = 368
    Top = 389
  end
  object QTemp: TFDQuery
    Connection = FZamerV2.FDC
    Left = 424
    Top = 389
  end
  object ActionList1: TActionList
    Left = 304
    Top = 388
    object Action1: TAction
      Caption = 'Start'
      ShortCut = 116
      OnExecute = Action1Execute
    end
  end
  object TimWork1000: TTimer
    Enabled = False
    OnTimer = TimWork1000Timer
    Left = 371
    Top = 341
  end
  object QInsAll: TFDQuery
    Connection = FZamerV2.FDC
    SQL.Strings = (
      'INSERT INTO ZAMER.ZHHALL ('
      
        '   NOMER, UISP, U12, U23, U31, I1, I2, I3, P1, P2, P3, DUMAX, ps' +
        ', fu, fi, fp,ns) '
      'VALUES ( :NOMER, :UISP, :U12, '
      
        '   :U23, :U31, :I1, :I2, :I3, :P1, :P2, :P3, :DUMAX,:ps, :fu, :f' +
        'i, :fp, :ns )')
    Left = 547
    Top = 349
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
      end
      item
        Name = 'NS'
        ParamType = ptInput
      end>
  end
  object Qsred: TFDQuery
    Connection = FZamerV2.FDC
    SQL.Strings = (
      'select '
      
        'round(avg(fu),1) u, round(avg(fi),3) i, round(avg(fp),1) p, max(' +
        'dumax) m'
      'from zhhall'
      'where'
      'nomer=:nomer'
      'and uisp=:uisp'
      'and dumax<=:delta'
      'and ns=:ns')
    Left = 483
    Top = 397
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
      end
      item
        Name = 'NS'
        ParamType = ptInput
      end>
  end
  object OpenDialog1: TOpenDialog
    Left = 395
    Top = 534
  end
  object SaveDialog1: TSaveDialog
    Left = 455
    Top = 534
  end
end
