object FZamerV2: TFZamerV2
  Left = 0
  Top = 0
  Caption = #1048#1089#1087#1099#1090#1072#1085#1080#1103' '#1076#1074#1080#1075#1072#1090#1077#1083#1103
  ClientHeight = 634
  ClientWidth = 351
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 351
    Height = 33
    Align = alTop
    TabOrder = 0
    DesignSize = (
      351
      33)
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 155
      Height = 19
      Caption = #1053#1086#1084#1077#1088' '#1080#1089#1087#1099#1090#1072#1085#1080#1103':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object NOMER: TLabel
      Left = 169
      Top = 8
      Width = 10
      Height = 19
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 271
      Top = 8
      Width = 72
      Height = 19
      Anchors = [akTop, akRight]
      Caption = '00:00:00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 597
    Width = 351
    Height = 37
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 200
    ExplicitTop = 756
    ExplicitWidth = 265
  end
  object TGroupBox
    Left = 0
    Top = 33
    Width = 349
    Height = 564
    Align = alLeft
    TabOrder = 2
    ExplicitTop = 32
    ExplicitHeight = 737
    object GroupBox2: TGroupBox
      Left = 2
      Top = 324
      Width = 345
      Height = 238
      Align = alBottom
      Caption = #1055#1088#1086#1074#1077#1076#1077#1085#1080#1077' '#1080#1089#1087#1099#1090#1072#1085#1080#1081
      TabOrder = 0
      ExplicitTop = 524
      DesignSize = (
        345
        238)
      object Button1: TButton
        Left = 3
        Top = 16
        Width = 339
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Button1'
        TabOrder = 0
      end
      object Button2: TButton
        Left = 3
        Top = 49
        Width = 339
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Button2'
        TabOrder = 1
      end
      object Button3: TButton
        Left = 3
        Top = 80
        Width = 339
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Button3'
        TabOrder = 2
      end
      object Button4: TButton
        Left = 3
        Top = 111
        Width = 339
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Button4'
        TabOrder = 3
      end
      object Button5: TButton
        Left = 3
        Top = 142
        Width = 339
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Button5'
        TabOrder = 4
      end
      object Button6: TButton
        Left = 3
        Top = 173
        Width = 339
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Button6'
        TabOrder = 5
      end
      object Button7: TButton
        Left = 3
        Top = 204
        Width = 339
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Button7'
        TabOrder = 6
      end
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 15
      Width = 345
      Height = 309
      Align = alClient
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1080#1089#1087#1099#1090#1072#1085#1080#1103
      TabOrder = 1
      ExplicitHeight = 298
    end
  end
end
