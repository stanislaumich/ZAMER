object FMain: TFMain
  Left = 0
  Top = 0
  Caption = #1053#1072#1087#1086#1084#1080#1085#1072#1083#1082#1072
  ClientHeight = 268
  ClientWidth = 330
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 330
    Height = 197
    Align = alTop
    Caption = #1057#1087#1080#1089#1086#1082' '#1076#1077#1083
    TabOrder = 0
    DesignSize = (
      330
      197)
    object Button2: TButton
      Left = 252
      Top = 166
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 0
      OnClick = Button2Click
    end
    object ListBox1: TListBox
      Left = 2
      Top = 15
      Width = 326
      Height = 145
      Align = alTop
      ItemHeight = 13
      TabOrder = 1
      OnClick = ListBox1Click
    end
    object Button3: TButton
      Left = 3
      Top = 166
      Width = 75
      Height = 25
      Caption = #1057#1074#1077#1088#1085#1091#1090#1100
      TabOrder = 2
      OnClick = Button3Click
    end
    object MediaPlayer1: TMediaPlayer
      Left = 13
      Top = 86
      Width = 253
      Height = 20
      EnabledButtons = [btPlay, btStop, btBack, btRecord, btEject]
      DoubleBuffered = True
      Visible = False
      ParentDoubleBuffered = False
      TabOrder = 3
    end
    object Button4: TButton
      Left = 128
      Top = 166
      Width = 75
      Height = 25
      Caption = #1057#1090#1086#1087
      TabOrder = 4
      OnClick = Button4Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 197
    Width = 330
    Height = 68
    Align = alTop
    Caption = #1047#1072#1076#1072#1095#1072
    TabOrder = 1
    DesignSize = (
      330
      68)
    object Button1: TButton
      Left = 252
      Top = 40
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 0
      OnClick = Button1Click
      ExplicitTop = 77
    end
    object Edit1: TEdit
      Left = 3
      Top = 15
      Width = 324
      Height = 21
      TabOrder = 1
      Text = 'Edit1'
    end
  end
  object BalloonHint1: TBalloonHint
    Style = bhsStandard
    Left = 264
    Top = 24
  end
  object Timer1: TTimer
    Interval = 30000
    OnTimer = Timer1Timer
    Left = 268
    Top = 72
  end
  object TrayIcon1: TTrayIcon
    OnDblClick = TrayIcon1DblClick
    Left = 156
    Top = 24
  end
end
