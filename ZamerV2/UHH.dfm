object FormHH: TFormHH
  Left = 0
  Top = 0
  Caption = #1061#1086#1083#1086#1089#1090#1086#1081' '#1093#1086#1076
  ClientHeight = 722
  ClientWidth = 1043
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 25
  object Label6: TLabel
    Left = 197
    Top = 666
    Width = 237
    Height = 33
    Alignment = taRightJustify
    Caption = #1055#1077#1088#1077#1082#1086#1089' '#1092#1072#1079', %:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 440
    Top = 666
    Width = 106
    Height = 33
    Caption = 'Label10'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 1043
    Height = 80
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 624
      Top = 10
      Width = 279
      Height = 25
      Alignment = taRightJustify
      Caption = #1042#1088#1077#1084#1103' '#1079#1072#1087#1080#1089#1080', '#1089#1077#1082'.:'
    end
    object Label2: TLabel
      Left = 624
      Top = 44
      Width = 279
      Height = 25
      Alignment = taRightJustify
      Caption = #1054#1090#1082#1083#1086#1085#1077#1085#1080#1077' '#1085#1072#1087#1088#1103#1078#1077#1085#1080#1103', '#1074'.'#30':'
    end
    object Label3: TLabel
      Left = 7
      Top = 0
      Width = 395
      Height = 33
      Alignment = taRightJustify
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1077' '#1085#1072#1087#1088#1103#1078#1077#1085#1080#1077', '#1074'.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 46
      Top = 38
      Width = 356
      Height = 33
      Alignment = taRightJustify
      Caption = #1058#1077#1082#1091#1097#1077#1077' '#1085#1072#1087#1088#1103#1078#1077#1085#1080#1077', '#1074'.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 408
      Top = 2
      Width = 17
      Height = 33
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 408
      Top = 38
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
    object Edit1: TEdit
      Left = 909
      Top = 7
      Width = 121
      Height = 33
      TabOrder = 0
      Text = '1'
    end
    object Edit2: TEdit
      Left = 909
      Top = 41
      Width = 121
      Height = 33
      TabOrder = 1
      Text = '1'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1043
    Height = 29
    Align = alTop
    TabOrder = 1
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
      Width = 71
      Height = 25
      Caption = 'Label12'
    end
    object Label5: TLabel
      Left = 164
      Top = 2
      Width = 313
      Height = 25
      Alignment = taRightJustify
      Caption = #1048#1089#1087#1099#1090#1072#1090#1077#1083#1100#1085#1086#1077' '#1085#1072#1087#1088#1103#1078#1077#1085#1080#1077', '#1074'.:'
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
  object TimUp: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TimUpTimer
    Left = 572
    Top = 49
  end
  object QUp: TFDQuery
    Connection = FZamerV2.FDC
    SQL.Strings = (
      '')
    Left = 640
    Top = 33
  end
  object QTemp: TFDQuery
    Connection = FZamerV2.FDC
    Left = 676
    Top = 33
  end
end
