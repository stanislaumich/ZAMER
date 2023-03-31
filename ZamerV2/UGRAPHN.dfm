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
    Left = 16
    Top = 16
    Width = 821
    Height = 433
    OnMouseMove = Image1MouseMove
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
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 236
    Top = 492
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Edit2'
  end
end
