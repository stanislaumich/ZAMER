object FMain: TFMain
  Left = 0
  Top = 0
  Caption = 'FMain'
  ClientHeight = 164
  ClientWidth = 219
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    219
    164)
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 63
    Top = 138
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'SHOW'
    TabOrder = 0
    Visible = False
    OnClick = Button1Click
    ExplicitLeft = 479
    ExplicitTop = 272
  end
  object Button2: TButton
    Left = 144
    Top = 137
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
    TabOrder = 1
    OnClick = Button2Click
    ExplicitLeft = 560
    ExplicitTop = 272
  end
  object Timer1: TTimer
    Interval = 500
    OnTimer = Timer1Timer
    Left = 160
    Top = 60
  end
end
