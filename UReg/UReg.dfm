object FormReg: TFormReg
  Left = 0
  Top = 0
  Caption = 'FRegMain'
  ClientHeight = 190
  ClientWidth = 634
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 29
    Height = 13
    Caption = #1055#1086#1088#1090':'
  end
  object Label2: TLabel
    Left = 120
    Top = 8
    Width = 66
    Height = 13
    Caption = #1054#1090#1082#1083#1086#1085#1077#1085#1080#1077':'
  end
  object Label6: TLabel
    Left = 159
    Top = 80
    Width = 378
    Height = 39
    Caption = #1058#1077#1082#1091#1097#1077#1077' '#1085#1072#1087#1088#1103#1078#1077#1085#1080#1077', '#1042'.:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 543
    Top = 79
    Width = 17
    Height = 39
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 120
    Top = 35
    Width = 417
    Height = 39
    Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1085#1072#1087#1088#1103#1078#1077#1085#1080#1077', '#1042'.:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ComLed1: TComLed
    Left = 607
    Top = 1
    Width = 25
    Height = 25
    ComPort = Com
    LedSignal = lsConn
    Kind = lkGreenLight
  end
  object Label3: TLabel
    Left = 140
    Top = 80
    Width = 6
    Height = 13
    Caption = '0'
  end
  object Label4: TLabel
    Left = 248
    Top = 8
    Width = 73
    Height = 13
    Caption = #1052#1080#1082#1088#1086#1096#1072#1075', '#1084#1089':'
  end
  object Label5: TLabel
    Left = 381
    Top = 8
    Width = 82
    Height = 13
    Caption = #1059#1089#1087#1086#1082#1086#1077#1085#1080#1077', '#1084#1089':'
  end
  object ComboBox1: TComboBox
    Left = 43
    Top = 5
    Width = 71
    Height = 21
    TabOrder = 0
    Text = 'Com3'
    Items.Strings = (
      'Com1'
      'Com2'
      'Com3'
      'Com4'
      'Com5'
      'Com6'
      'Com7'
      'Com8'
      'Com9'
      'Com10'
      'Com11'
      'Com12'
      'Com13'
      'Com14'
      'Com15')
  end
  object Edit1: TEdit
    Left = 192
    Top = 5
    Width = 42
    Height = 21
    TabOrder = 1
    Text = '5'
  end
  object Edit4: TEdit
    Left = 543
    Top = 32
    Width = 62
    Height = 47
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = '380'
  end
  object BitBtn1: TBitBtn
    Left = 4
    Top = 27
    Width = 110
    Height = 38
    Caption = #1057#1090#1072#1088#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC15700C157
      00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFC15700C76B18C15700FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFC15700E08800C96510C15700FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC15700F4C239E08800C9630FC1
      5700FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBC5300E590
      00F1B929E08800C96310C15700FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFC45C04E28E00E28B00EEAF1DE08800C96310C15700FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFC76110C45B0CC2580BC0580BC1550BBE550ABD530ABC
      5409BC530ABA5208BA5109C35B08EB9700E28B00E08800F1B01AE08800C16016
      C7620FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCE6E13EFB13CF5BC42F2B53AF0B1
      35F0AB2FEEA82AECA126EB9E22EA991BE89616E79511EB990BE99506E58E00E0
      8800EEA60DE18700C16016C6600EFFFFFFFFFFFFFFFFFFFFFFFFD47B20F7CC57
      FAD562F9CE58F8CC4FF7C648F6C342F5C03CF4B833F2B12DF2AF24EFA81FEDA1
      17EB9E10EA9709E89302E18800EBA107E18700C16016C55F0EFFFFFFFFFFFFFF
      FFFFD88021F7D05BFCD86AF9CD5EF8CB57F6CA51F6C64AF6C445F4BE3DF3BA38
      F2B531F1AD2AEFA823EDA51CEDA115EC9C0FEA9708E18700EC9F02E18700C05F
      15C55E0CFFFFFFFFFFFFDC8524F9D564FDDC75FAD668F9D261F8CE5EF7CC56F6
      C84FF6C449F5C142F4BD3DF3B734F1B02EF0AD27EFA922EDA41AEC9F13EB9B0C
      EA9000EA9600F0B83BD07621C45D0CFFFFFFE08C27FBD96DFEE07DFBDB72FBD7
      6BFAD365F9D160F8CD59F6CA52F7CB4DF6C447F4BF41F4BA3AF3B533F1B12DF0
      AC26EEA71EEEA318EB9E10E28A00F4BE2AF6D67FE19A3BC5600EE49128FCDE76
      FEE586FDE079FBDD77FBDA70FBD76BFAD366F8D05EF8CB57F7CA51F7C64EF5C3
      45F4BE3FF3BA39F3B432F1AF2DEFAC22ED9F11F4C43DF6D67FE19A3BD37E25C5
      5F0EE69929FDE277FFE88CFEE381FDE27BFDDE77FBDC71FBDA6CFAD666F9D060
      F8CC59F7CA54F6CB4FF6C549F5C141F4BD3EF3B632F0AA23F4C43DF6D67FE19B
      37D37E25C45E0CFFFFFFE99E2EFCE380FFEA95FEE68BFDE585FEE27EFDE07EFD
      DF76FADC72FBDA6CFBD669F9D261F8CF59F7CB57F6CA50F6C245F4BB35F4C43D
      F6D67FF0AA23D37E25C55F0EFFFFFFFFFFFFEDAC3BFFF5CFFFF8DBFFF6D4FFF6
      D5FFF5D3FFF4D2FFF3CEFFF2CBFFF1C7FFF1C9FDEBB2FAD461F9D161F8CB55F7
      C94DF6D67FF6D67FF0AA23D37E25C55F0EFFFFFFFFFFFFFFFFFFEC9E20FAE6A4
      FBEAACFBE8A8FBE7A8FAE8A6F9E7A6F9E6A4F9E5A3F9E4A1F8E3A0F9DF93FBDB
      6FFAD462F8D05BF6D67FFAEBB9F4BB35D37E25C55F0EFFFFFFFFFFFFFFFFFFFF
      FFFFEDA429EA9A1CE8961AE8961AE7941AE79319E69018E68F19E59118E48C18
      E28B14E49427FDE274FCDD76FEF1C0FCEEBEF4BB35D37E25C5600EFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFEEAB2CFEE88AFFF6D3F8E8B1F5CD67D37E25C5600E
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2B439FFFCE4FAEBB3F5CD67D3
      7E25C55F0EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEAB2CFDEC
      ABF5CD67D37E25C55F0EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFF3B632F5CD67D37E25CD6E1CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFEEAB2CD37E25CA6918FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD37E25CA6918FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 8
    Top = 125
    Width = 185
    Height = 56
    Caption = #1041#1054#1051#1068#1064#1045' F4'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFE05A0CCE4703CF4603CF4803CF4302C93F02C53D
      03C43E00C43A00C43700C44100D8480CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE77616F1A529F2A220F09517
      ED9319EC8D14EA8912E77E0BE47809DD7206DA6D00D85F0CFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE76F0CF4
      BC4DF3C663EE9B1EED941AEE9419ED9117ED8C13EF8D0FEC870ED36A09E06A0C
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFE7700DF3BC51F5D890EFA52FED951EED941EED931CEB9018ED8E17EA
      8811D36F0BE06A11FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFE9740FF4C056F7D794EFAB32EF9B23EE9C24ED98
      21ED951DEE9418EB8D17D37412DF6E11FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEA7B0FF4C85FF7DBA2F1B03D
      EFA32AEFA22BEFA129EE9C24F09A21ED931CD67814E27415FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEB8011F6
      CC6BF8DFACF1B444F1A531F0A634EFA42FEFA12AF09F27ED9922D67D1CE27717
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFEC8610F6CF74F9E2B6F2B94AF2AB37F1AB3AF1A935F0A630F2A52AEF
      9F27DD8522DD741BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFED8813F8D47EF9E5BFF4BE55F2B140F2B340F1AE
      3DF1AB38F2AA34EFA430D89127E26F1DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEE8D14F8D788FAE9C4F3C25D
      F3B442F2B545F2B642F2B13EF2B03AF1A834D3932DE77820FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFED8111F9
      DE97FDECD6F6C76AF4B94DF4BA51F3B94EF2B546F4B743F1AF3ED99333E57F20
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF850CE9820FEE9929EC8B17EB85
      10E9740CEE9820FADB94FAE3B4F6C56AF5C059F4BF58F4BD53F3BA4EF5B749F2
      B545DA9037D46C19DA700CDE710FE36911E77B17E36F10E66A0CF0840CEB870B
      F1BC54FCE59DF7CF79F6C866F7CB6DF9CF77F7CA6DF6C766F6C662F6C360F5C1
      5BF4BF55F4BE51F3B74FD99338DB8D30E58D2CE7912CEDAA36EA9C2ADB5904E7
      6C0CFFFFFFF1850CEA7F12F9DE90FFF9EAFEF3DFFCE5B5F8D074F8CC71F8CE75
      F7C96EF6C768F6C663F6C25EF5C05AF5BC55F0B249F2B84CF3BA4CF8C858F4BE
      46E57011EA6B0CFFFFFFFFFFFFFFFFFFEF730CE76C01F9DE97FFF8F2FCEBD2F9
      D583F9D079F8D180F8CE78F7CC73F7C96EF6C768F6C362F6C25EF7C45AF7BE52
      F8C75EF4BC4BE36E0CE7680CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1790CE874
      00FAE098FFF7EEFCE9C8FAD586F9D080F9D27FF8D17CF8CE77F7CC6FF7C869F6
      C666F6C25CF9CA6CF5C45DE67711E96E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF07A0CE97903FAE3A2FFF8EFFCE9C8FAD688F9D584F9D484F8D2
      7FF8CF78F7CD73F7C769F9D277F6CE6CE68317EB6F0CFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1780CEA7D04FBE9B0FFF7EFFCE9C6
      FAD789F9D789F9D589F9D383F8CD7AFAD483F9D782E8881BEC6F0CFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF17E0CEB
      870BFDEBBCFFF7EFFCE9C4FBD78CFAD889F9D485FBDA93FADD97EC9522ED750C
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFF3800CEE9116FDEDC1FFF6EBFCE7C1FBDB97FBE0A3FCE3A5EE
      A02CEF780CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4830CEE9113FEF1CBFFF3E8FDEE
      D8FEEBC2EFA730EF7D0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4870C
      EF9B1DFFF5DAFFF4DFF1B43DF17E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFF68E0CF1AC36F5C857F3890CFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3920CF38F0CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    ParentFont = False
    TabOrder = 4
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 227
    Top = 125
    Width = 185
    Height = 56
    Caption = #1052#1045#1053#1068#1064#1045' F5'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC55F0EC560
      0EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      C45E0CD37E25E19A3BC45D0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFC55F0ED37E25E19A3BF6D67FD07621C55E0CFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFC55F0ED37E25E19B37F6D67FF4BE2AF0B83BC05F15C5
      5F0EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC55F0ED37E25F0AA23F6D67FF4C43DE28A
      00EA9600E18700C16016C6600EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5600ED37E25F0AA23F6D67F
      F4C43DED9F11EB9E10EA9000EC9F02E18700C16016C7620FFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5600ED37E25F4
      BB35F6D67FF4C43DF0AA23EFAC22EEA318EB9B0CE18700EBA107E18700C16016
      C15700FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC55F
      0ED37E25F4BB35FAEBB9F6D67FF4BB35F3B632F1AF2DEEA71EEC9F13EA9708E1
      8800EEA60DE08800C96310C15700FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFC55F0ED37E25F5CD67FCEEBEF6D67FF7C94DF6C245F4BD3EF3B432F0AC
      26EDA41AEC9C0FE89302E08800F1B01AE08800C96310C15700FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFCD6E1CD37E25F5CD67F8E8B1FEF1C0F8D05BF8CB55F6CA50
      F5C141F3BA39F1B12DEFA922EDA115EA9709E58E00E08800EEAF1DE08800C963
      0FC15700FFFFFFFFFFFFFFFFFFCA6918D37E25F5CD67FAEBB3FFF6D3FCDD76FA
      D462F9D161F7CB57F6C549F4BE3FF3B533F0AD27EDA51CEB9E10E99506E28B00
      E28B00F1B929E08800C96510C15700FFFFFFCA6918D37E25F5CD67FDECABFFFC
      E4FEE88AFDE274FBDB6FFAD461F8CF59F6CB4FF5C345F4BA3AF1B02EEFA823ED
      A117EB990BEB9700E28E00E59000F4C239E08800C76B18C15700D37E25EEAB2C
      F3B632EEAB2CF2B439EEAB2CE49427F9DF93FDEBB2F9D261F7CA54F7C64EF4BF
      41F3B734F1AD2AEFA81FE79511C35B08C45C04BC5300C15700C15700C15700C1
      5700FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE28B14F8E3A0FFF1C9FBD669
      F8CC59F7CA51F6C447F4BD3DF2B531F2AF24E89616BA5109FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE48C18F9
      E4A1FFF1C7FBDA6CF9D060F8CB57F7CB4DF5C142F3BA38F2B12DEA991BBA5208
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFE59118F9E5A3FFF2CBFADC72FAD666F8D05EF6CA52F6C449F4BE3DF4
      B833EB9E22BC530AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFE68F19F9E6A4FFF3CEFDDF76FBDA6CFAD366F8CD
      59F6C84FF6C445F5C03CECA126BC5409FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE69018F9E7A6FFF4D2FDE07E
      FBDC71FBD76BF9D160F7CC56F6C64AF6C342EEA82ABD530AFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE79319FA
      E8A6FFF5D3FEE27EFDDE77FBDA70FAD365F8CE5EF6CA51F7C648F0AB2FBE550A
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFE7941AFBE7A8FFF6D5FDE585FDE27BFBDD77FBD76BF9D261F8CB57F8
      CC4FF0B135C1550BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFE8961AFBE8A8FFF6D4FEE68BFEE381FDE079FBDB
      72FAD668F9CD5EF9CE58F2B53AC0580BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8961AFBEAACFFF8DBFFEA95
      FFE88CFEE586FEE07DFDDC75FCD86AFAD562F5BC42C2580BFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEA9A1CFA
      E6A4FFF5CFFCE380FDE277FCDE76FBD96DF9D564F7D05BF7CC57EFB13CC45B0C
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFEDA429EC9E20EDAC3BE99E2EE69929E49128E08C27DC8524D88021D4
      7B20CE6E13C76110FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    ParentFont = False
    TabOrder = 5
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 440
    Top = 125
    Width = 185
    Height = 56
    Caption = #1057#1058#1054#1055' F9'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
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
    ParentFont = False
    TabOrder = 6
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 4
    Top = 68
    Width = 110
    Height = 37
    Caption = #1057#1090#1086#1087
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF6262BB0503A20200A30300A002019C02019A0201
      9A02019B02019C0301A00301A16362BBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5858B90F0DB90C0DF60605EF0605EE
      0403EE0403EC0303EC0402EE0503ED0703EE0806F30402BC5958BBFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5A58BD0F0EBC0C0CEF01
      01E20000DC0000D70704D70602D00602CD0000C60000CF0101E70605E80908F3
      0603C25A58C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5958C51211
      C60E10F40101E40000D8ABA6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBAE801
      00BE0000D80705EC0B09F30705C65A58C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      5A58C91514CB1317F60408E60000E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF706AD40000DC0A0BEF0A0BF40706CA5C59C9FFFFFFFF
      FFFFFFFFFF5A58CE1514CF151CF60A0DEC0000E4938BF5FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0E0CB20305F00B0CEE0E0F
      F50806CE5B59CEFFFFFF6563D51513D31722F70D14EF090DEB0000E5FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F5
      0000C30A0CED0D0FEE0F13F60907D16664D50C09CB2E3FF91019F30F19F0080F
      EB0F14ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF00009E070CED0C10EE0E13F11016F60705CA100CD12E42F7
      111DF20F1AF00912EC0F15EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF080ECD060BEA0C11ED0F17F01118F308
      07D0100ED32F47F71220F2101FF00913EC1117EEFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4B54E8FFFFFFFFFFFF080ECB070DEC0D14
      EF1019F1121DF40807D2110ED7324BF61223F3131FF10A15EC111AEEFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF080ECDFFFFFFFFFFFF
      0911CB070FEC0D17EE111DF1131FF40907D60E0CD9334DF71525F31224F10B18
      ED111BEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF08
      0ECDFFFFFFFFFFFF0C16CE0912ED0E1AEE1221F11322F40807D83633E44A68F8
      1526F21322F00A17ED101BEEFFFFFFE7E3FCF7F7FDFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF080ECDFFFFFFFFFFFF1520D60A15EE0F1CF00F1EF0192BF51C
      1BE1423EE8748DF94D6AF83650F51B2FF01D2AF0FFFFFF332FEEC6C3F8FFFFFF
      4139E9FFFFFFC2BEF9E5E5F8FFFFFF080ECDFFFFFFFFFFFF242EDB1728F4283D
      F33F58F74A67F83633E6403DEA758FFA4B67F74964F63853F3515CF5FFFFFF38
      34EDD6D5FBFFFFFF2019E2FFFFFF4F61E8CAC5F1FFFFFF4B54E83333D3E4DFED
      4750DE4761F74760F64861F64A64F73331E9413EEB7694FA4A6DF74C6AF63D5C
      F55965F6FFFFFF3633EDD6D4FBFFFFFF3B35E4FFFFFF4A5CE6D5D1F3FFFFFF6C
      78EE4866FA3A4EEC4A65F94966F84965F74A64F64C68F73432EB3C38EC94B0FB
      5372F75071F74B6BF66475F7FFFFFF3B37EED4D2FBFFFFFF2F2AE1FFFFFF2430
      E3D3CFF2FFFFFF6D7AED4B69F84F6BF84E6AF74F6AF74D69F74E6AF75070F934
      31EB7E7AF34F51F195B3FA5474F74F72F77483F9FFFFFF3F3CEFD5D2F9FFFFFF
      2C27DFFFFFFF2430E3D5CFF2FFFFFF6E7AED4E6EF85170F74F70F74F6EF74F6F
      F75275F83B3DF0807CF3FFFFFF7570F35152F19AB3FA5779F74E63F7ADA2F849
      44F0D5D2FBFFFFFF2C26DFFFFFFF2430E3D5D0F2FFFFFF717EED5071F85373F7
      5373F75474F7567AF83C3EF07772F4FFFFFFFFFFFFFFFFFF7671F65354F39BB7
      FA587AF74D71F62F45F1DED7FBFFFFFF312AE2FFFFFF2430E3DAD5F3FFFFFF75
      85ED5676F85677F75777F75A7DF83C3FF27873F6FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF7671F55354F49DB9FB5477F7405EF39D90F4C6C1F6393BE6FFFFFF2430
      E3B4AAECFFFFFF404FE6597EF85A7BF75D82F83D40F37873F6FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF7671F75354F59DB8FB5778F7496AF64663F3
      445FF36865EA3E48E84660F23546E95A7EF85A7CF76084F73E41F47873F7FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7771F85555F6A1
      BBFB83A2FB84A4FB84A5FB84A5FB85A8FC85A5FB88A6FB84A4FB88A9FB3E43F5
      7973F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFF7F7BF93F3BF44642F54642F54642F54642F54642F54642F54642F546
      42F5413DF4807BF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    ParentFont = False
    TabOrder = 7
    OnClick = BitBtn5Click
  end
  object Edit2: TEdit
    Left = 324
    Top = 5
    Width = 45
    Height = 21
    TabOrder = 8
    Text = '300'
  end
  object Edit3: TEdit
    Left = 472
    Top = 5
    Width = 45
    Height = 21
    TabOrder = 9
    Text = '200'
  end
  object Button1: TButton
    Left = 120
    Top = 96
    Width = 41
    Height = 21
    Caption = 'Button1'
    TabOrder = 10
    Visible = False
    OnClick = Button1Click
  end
  object Com: TComPort
    BaudRate = br115200
    Port = 'COM6'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    StoredProps = [spBasic]
    TriggersOnRxChar = True
    OnRxChar = ComRxChar
    Left = 384
    Top = 136
  end
  object ActionList1: TActionList
    Left = 588
    Top = 136
    object Up: TAction
      Caption = 'Up'
      ShortCut = 115
      OnExecute = UpExecute
    end
    object Down: TAction
      Caption = 'Down'
      ShortCut = 116
      OnExecute = DownExecute
    end
    object Stop: TAction
      Caption = 'Stop'
      ShortCut = 120
      OnExecute = StopExecute
    end
  end
  object FDC: TFDConnection
    Params.Strings = (
      'DriverID=Ora'
      'Database=XE'
      'User_Name=zamer'
      'Password=zamer')
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    Connected = True
    LoginPrompt = False
    Left = 240
    Top = 136
  end
  object Query1: TFDQuery
    Connection = FDC
    SQL.Strings = (
      'select round(U) u from zelspectmp')
    Left = 20
    Top = 140
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 200
    OnTimer = Timer1Timer
    Left = 460
    Top = 140
  end
  object Query2: TFDQuery
    Connection = FDC
    SQL.Strings = (
      'select * from command')
    Left = 100
    Top = 140
  end
  object Timer2: TTimer
    Interval = 500
    OnTimer = Timer2Timer
    Left = 504
    Top = 140
  end
  object Query3: TFDQuery
    Connection = FDC
    SQL.Strings = (
      'truncate table command')
    Left = 156
    Top = 144
  end
  object Timer3: TTimer
    Enabled = False
    Left = 548
    Top = 140
  end
  object Timer4: TTimer
    Interval = 50
    OnTimer = Timer4Timer
    Left = 304
    Top = 140
  end
end
