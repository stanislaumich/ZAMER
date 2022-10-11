object FGraph: TFGraph
  Left = 0
  Top = 0
  Caption = 'FGraph'
  ClientHeight = 572
  ClientWidth = 987
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnMouseDown = FormMouseDown
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 2
    Top = 503
    Width = 75
    Height = 25
    Caption = 'START'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 83
    Top = 503
    Width = 75
    Height = 25
    Caption = 'STOP'
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 296
    Top = 504
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 296
    Top = 528
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'Edit2'
  end
  object QTemp: TFDQuery
    Left = 664
    Top = 516
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 792
    Top = 528
  end
end
