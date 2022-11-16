object FARC: TFARC
  Left = 0
  Top = 0
  Caption = #1042#1089#1077' '#1080#1089#1087#1099#1090#1072#1085#1080#1103
  ClientHeight = 660
  ClientWidth = 928
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  DesignSize = (
    928
    660)
  PixelsPerInch = 96
  TextHeight = 13
  object GB1: TGroupBox
    Left = 4
    Top = 0
    Width = 921
    Height = 449
    Anchors = [akLeft, akTop, akRight]
    Caption = #1057#1087#1080#1089#1086#1082' '#1080#1089#1087#1099#1090#1072#1085#1080#1081
    TabOrder = 0
    object GridSpis: TDBGrid
      Left = 2
      Top = 15
      Width = 823
      Height = 432
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
  end
  object TableSpis: TFDTable
    Active = True
    IndexFieldNames = 'NOMER'
    Connection = FZamerV2.FDC
    TableName = 'ZDvigAll'
    Left = 32
    Top = 52
  end
  object DSSpis: TDataSource
    DataSet = TableSpis
    Left = 72
    Top = 52
  end
end
