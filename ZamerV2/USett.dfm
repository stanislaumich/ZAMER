object FSett: TFSett
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 656
  ClientWidth = 1059
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 3
    Top = 3
    Width = 301
    Height = 117
    Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1080'-'#1080#1089#1087#1099#1090#1072#1090#1077#1083#1080
    TabOrder = 0
    object GridSotrud: TDBGrid
      Left = 2
      Top = 15
      Width = 297
      Height = 100
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
  object TabSotrud: TFDTable
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
    IndexFieldNames = 'NAME'
    Connection = FZamerV2.FDC
    TableName = 'Zstend'
    Left = 332
    Top = 56
  end
end
