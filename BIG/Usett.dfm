object FSett: TFSett
  Left = 0
  Top = 0
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 215
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 635
    Height = 149
    Align = alTop
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'NAME'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COLOR'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SZ'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'X'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Y'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BEFORE'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AFTER'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOP1'
        Width = 50
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 8
    Top = 155
    Width = 185
    Height = 54
    Caption = #1058#1045#1050#1057#1058
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object Button1: TButton
    Left = 204
    Top = 156
    Width = 113
    Height = 49
    Caption = #1042#1099#1073#1088#1072#1090#1100' '#1094#1074#1077#1090
    TabOrder = 2
    OnClick = Button1Click
  end
  object DBEdit1: TDBEdit
    Left = 320
    Top = 156
    Width = 73
    Height = 21
    DataField = 'COLOR'
    DataSource = DataSource1
    TabOrder = 3
    OnClick = DBEdit1Click
  end
  object Button2: TButton
    Left = 404
    Top = 156
    Width = 105
    Height = 49
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    TabOrder = 4
    OnClick = Button2Click
  end
  object FDC: TFDConnection
    Params.Strings = (
      'DriverID=Ora'
      'ApplicationName=BIG'
      'Password=zamer'
      'User_Name=zamer')
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    Connected = True
    LoginPrompt = False
    Left = 440
    Top = 56
  end
  object QTemp: TFDQuery
    Connection = FDC
    Left = 500
    Top = 56
  end
  object DataSource1: TDataSource
    DataSet = FDTable1
    Left = 440
    Top = 4
  end
  object FDTable1: TFDTable
    Active = True
    IndexFieldNames = 'NAME'
    Connection = FDC
    TableName = 'zbig'
    Left = 500
    Top = 4
  end
  object ColorDialog1: TColorDialog
    Left = 556
    Top = 4
  end
end
