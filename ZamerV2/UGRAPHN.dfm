object FGraphn: TFGraphn
  Left = 0
  Top = 0
  Caption = 'GRAPHN'
  ClientHeight = 549
  ClientWidth = 853
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 853
    Height = 433
    Align = alTop
    OnMouseMove = Image1MouseMove
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 821
  end
  object Button1: TButton
    Left = 36
    Top = 496
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 236
    Top = 464
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '1'
  end
  object Edit2: TEdit
    Left = 236
    Top = 492
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '1'
  end
  object QTemp: TFDQuery
    Connection = FZamerV2.FDC
    Left = 508
    Top = 120
  end
end
