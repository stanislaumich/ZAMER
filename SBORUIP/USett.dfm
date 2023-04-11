object FSett: TFSett
  Left = 0
  Top = 0
  Caption = #1043#1083#1072#1074#1085#1086#1077' '#1086#1082#1085#1086' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1103' SborUIP'
  ClientHeight = 483
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
    483)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 138
    Width = 573
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
    end
    object Label2: TLabel
      Left = 164
      Top = 156
      Width = 24
      Height = 13
      Caption = 'Port:'
    end
    object Label3: TLabel
      Left = 248
      Top = 156
      Width = 15
      Height = 13
      Caption = 'ID:'
    end
    object Edit1: TEdit
      Left = 32
      Top = 153
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 194
      Top = 153
      Width = 39
      Height = 21
      TabOrder = 1
      Text = 'Edit2'
    end
    object Edit3: TEdit
      Left = 269
      Top = 153
      Width = 44
      Height = 21
      TabOrder = 2
      Text = 'Edit3'
    end
    object DBGrid3: TDBGrid
      Left = 2
      Top = 15
      Width = 569
      Height = 120
      Align = alTop
      DataSource = DataSource3
      TabOrder = 3
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
          Width = 88
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
  end
  object GroupBox2: TGroupBox
    Left = 572
    Top = 138
    Width = 246
    Height = 189
    Anchors = [akLeft, akTop, akRight]
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
    Color = clActiveCaption
    ParentBackground = False
    ParentColor = False
    TabOrder = 1
    object DBGrid2: TDBGrid
      Left = 2
      Top = 15
      Width = 242
      Height = 172
      Align = alClient
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
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'val'
          Title.Caption = #1047#1085#1072#1095
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dop'
          Title.Caption = #1044#1086#1087
          Width = 50
          Visible = True
        end>
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
          Width = 109
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
          Width = 38
          Visible = True
        end
        item
          Expanded = False
          FieldName = 't2'
          Width = 41
          Visible = True
        end
        item
          Expanded = False
          FieldName = 't3'
          Width = 37
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
    ExplicitHeight = 250
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
      Left = 137
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
      Left = 137
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
      Left = 137
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
      Left = 287
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
      Left = 287
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
      Left = 287
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
  end
  object TPribor: TFDTable
    Active = True
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
    Active = True
    IndexFieldNames = 'name'
    Connection = FMain.ConLite
    TableName = 'INI'
    Left = 728
    Top = 260
  end
  object TStend: TFDTable
    Active = True
    IndexFieldNames = 'name'
    Connection = FMain.ConLite
    TableName = 'Stend'
    Left = 312
    Top = 208
  end
  object DataSource3: TDataSource
    DataSet = TStend
    Left = 416
    Top = 204
  end
end
