object FSett: TFSett
  Left = 0
  Top = 0
  Caption = #1043#1083#1072#1074#1085#1086#1077' '#1086#1082#1085#1086' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1103' SborUIP'
  ClientHeight = 481
  ClientWidth = 820
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
    820
    481)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 138
    Width = 509
    Height = 189
    Anchors = [akLeft, akTop, akRight]
    Caption = #1055#1088#1080#1073#1086#1088#1099' '#1085#1072' '#1089#1090#1077#1085#1076#1072#1093
    Color = clMedGray
    ParentBackground = False
    ParentColor = False
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 156
      Width = 14
      Height = 13
      Caption = 'IP:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 164
      Top = 156
      Width = 24
      Height = 13
      Caption = 'Port:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 248
      Top = 156
      Width = 15
      Height = 13
      Caption = 'ID:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 12
      Top = 124
      Width = 52
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DBText1: TDBText
      Left = 76
      Top = 124
      Width = 65
      Height = 17
      DataField = 'name'
      DataSource = DataSource3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 288
      Top = 124
      Width = 41
      Height = 13
      Caption = #1055#1088#1080#1073#1086#1088':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DBText2: TDBText
      Left = 340
      Top = 124
      Width = 65
      Height = 17
      DataField = 'pribor'
      DataSource = DataSource3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DBGrid3: TDBGrid
      Left = 2
      Top = 15
      Width = 505
      Height = 98
      Align = alTop
      DataSource = DataSource3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'name'
          Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          Width = 111
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pribor'
          Title.Caption = #1056#1077#1075#1080#1089#1090#1088#1099
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IP'
          Width = 99
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PORT'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID'
          Visible = True
        end>
    end
    object BitBtn1: TBitBtn
      Left = 406
      Top = 151
      Width = 95
      Height = 26
      Caption = #1040#1082#1090#1080#1074#1080#1088#1086#1074#1072#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'System'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object DBEdit3: TDBEdit
      Left = 273
      Top = 153
      Width = 33
      Height = 24
      DataField = 'ID'
      DataSource = DataSource3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'System'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object DBEdit2: TDBEdit
      Left = 194
      Top = 153
      Width = 41
      Height = 24
      DataField = 'PORT'
      DataSource = DataSource3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'System'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object DBEdit1: TDBEdit
      Left = 33
      Top = 153
      Width = 121
      Height = 24
      DataField = 'IP'
      DataSource = DataSource3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'System'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object BitBtn2: TBitBtn
      Left = 317
      Top = 151
      Width = 88
      Height = 26
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'System'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = BitBtn2Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 513
    Top = 138
    Width = 305
    Height = 189
    Anchors = [akLeft, akTop, akRight]
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
    Color = clActiveCaption
    ParentBackground = False
    ParentColor = False
    TabOrder = 1
    object DBGrid2: TDBGrid
      Left = 3
      Top = 12
      Width = 299
      Height = 142
      DataSource = DataSource2
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'name'
          Title.Caption = #1055#1072#1088#1072#1084
          Width = 89
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'val'
          Title.Caption = #1047#1085#1072#1095
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dop'
          Title.Caption = #1044#1086#1087
          Width = 300
          Visible = True
        end>
    end
    object Button3: TButton
      Left = 8
      Top = 160
      Width = 289
      Height = 25
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1080' '#1089#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 1
      OnClick = Button3Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 0
    Width = 820
    Height = 138
    Align = alTop
    Caption = #1056#1077#1075#1080#1089#1090#1088#1099' MODBUS '#1087#1088#1080#1073#1086#1088#1086#1074
    Color = clMoneyGreen
    ParentBackground = False
    ParentColor = False
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 816
      Height = 114
      Align = alTop
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'name'
          Title.Caption = #1055#1088#1080#1073#1086#1088
          Width = 128
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'u'
          Width = 39
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'u1'
          Width = 39
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'u2'
          Width = 37
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'u3'
          Width = 34
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'i'
          Width = 32
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'i1'
          Width = 36
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'i2'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'i3'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'p'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'p1'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'p2'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'p3'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 't'
          Width = 31
          Visible = True
        end
        item
          Expanded = False
          FieldName = 't1'
          Width = 28
          Visible = True
        end
        item
          Expanded = False
          FieldName = 't2'
          Width = 26
          Visible = True
        end
        item
          Expanded = False
          FieldName = 't3'
          Width = 30
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 331
    Width = 573
    Height = 149
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 3
    object Label4: TLabel
      Left = 48
      Top = 2
      Width = 24
      Height = 39
      Caption = 'U'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 194
      Top = 2
      Width = 15
      Height = 39
      Caption = 'I'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clFuchsia
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 340
      Top = 2
      Width = 21
      Height = 39
      Caption = 'P'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 12
      Top = 36
      Width = 106
      Height = 39
      Caption = 'Label7'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 12
      Top = 72
      Width = 106
      Height = 39
      Caption = 'Label8'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 12
      Top = 108
      Width = 106
      Height = 39
      Caption = 'Label9'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 160
      Top = 36
      Width = 126
      Height = 39
      Caption = 'Label10'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clFuchsia
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 160
      Top = 72
      Width = 126
      Height = 39
      Caption = 'Label11'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clFuchsia
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 160
      Top = 108
      Width = 126
      Height = 39
      Caption = 'Label12'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clFuchsia
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 300
      Top = 36
      Width = 126
      Height = 39
      Caption = 'Label13'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 300
      Top = 72
      Width = 126
      Height = 39
      Caption = 'Label14'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 300
      Top = 108
      Width = 126
      Height = 39
      Caption = 'Label15'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Memo1: TMemo
      Left = 470
      Top = 2
      Width = 96
      Height = 143
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 574
    Top = 331
    Width = 244
    Height = 149
    TabOrder = 4
    object Label18: TLabel
      Left = 40
      Top = 2
      Width = 166
      Height = 13
      Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090#1099' '#1090#1088#1072#1085#1089#1092#1086#1088#1084#1072#1090#1086#1088#1072
    end
    object Label19: TLabel
      Left = 8
      Top = 24
      Width = 17
      Height = 13
      Caption = 'U1:'
    end
    object Label20: TLabel
      Left = 86
      Top = 23
      Width = 17
      Height = 13
      Caption = 'U2:'
    end
    object Label21: TLabel
      Left = 11
      Top = 51
      Width = 14
      Height = 13
      Caption = 'I1:'
    end
    object Label22: TLabel
      Left = 86
      Top = 51
      Width = 14
      Height = 13
      Caption = 'I2:'
    end
    object Edit1: TEdit
      Left = 31
      Top = 21
      Width = 46
      Height = 21
      TabOrder = 0
      Text = '0'
    end
    object Edit2: TEdit
      Left = 109
      Top = 21
      Width = 46
      Height = 21
      TabOrder = 1
      Text = '0'
    end
    object Edit3: TEdit
      Left = 32
      Top = 48
      Width = 45
      Height = 21
      TabOrder = 2
      Text = '0'
    end
    object Edit4: TEdit
      Left = 109
      Top = 48
      Width = 46
      Height = 21
      TabOrder = 3
      Text = '0'
    end
    object Button1: TButton
      Left = 5
      Top = 80
      Width = 115
      Height = 25
      Caption = #1055#1088#1086#1095#1080#1090#1072#1090#1100
      TabOrder = 4
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 124
      Top = 80
      Width = 115
      Height = 25
      Caption = #1047#1072#1087#1080#1089#1072#1090#1100
      TabOrder = 5
      OnClick = Button2Click
    end
  end
  object TPribor: TFDTable
    IndexFieldNames = 'name'
    Connection = FMain.ConLite
    TableName = 'pribor'
    Left = 56
    Top = 56
  end
  object DataSource1: TDataSource
    DataSet = TPribor
    Left = 120
    Top = 56
  end
  object DataSource2: TDataSource
    DataSet = TIni
    Left = 692
    Top = 260
  end
  object TIni: TFDTable
    IndexFieldNames = 'name'
    Connection = FMain.ConLite
    TableName = 'INI'
    Left = 740
    Top = 260
  end
  object TStend: TFDTable
    IndexFieldNames = 'name'
    Connection = FMain.ConLite
    TableName = 'Stend'
    Left = 312
    Top = 208
  end
  object DataSource3: TDataSource
    DataSet = TStend
    Left = 380
    Top = 208
  end
end
