object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1058#1069#1057#1040'-1 '#1087#1088#1086#1074#1077#1088#1086#1095#1085#1072#1103' '#1087#1088#1086#1075#1088#1072#1084#1084#1072
  ClientHeight = 337
  ClientWidth = 569
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
  object Label1: TLabel
    Left = 428
    Top = 37
    Width = 12
    Height = 23
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Open: TButton
    Left = 339
    Top = 4
    Width = 75
    Height = 25
    Caption = 'Open'
    TabOrder = 0
    OnClick = OpenClick
  end
  object Read: TButton
    Left = 339
    Top = 35
    Width = 75
    Height = 25
    Caption = 'Read'
    TabOrder = 1
    OnClick = ReadClick
  end
  object Close: TButton
    Left = 339
    Top = 66
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 2
    OnClick = CloseClick
  end
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 329
    Height = 337
    Align = alLeft
    TabOrder = 3
  end
  object ComboBox1: TComboBox
    Left = 420
    Top = 4
    Width = 145
    Height = 21
    TabOrder = 4
    Text = 'COM1'
  end
  object Button1: TButton
    Left = 339
    Top = 112
    Width = 75
    Height = 25
    Caption = #1058#1072#1081#1084#1077#1088' '#1089#1090#1072#1088#1090
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 339
    Top = 139
    Width = 75
    Height = 25
    Caption = #1058#1072#1081#1084#1077#1088' '#1089#1090#1086#1087
    TabOrder = 6
    OnClick = Button2Click
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 440
    Top = 68
  end
end
