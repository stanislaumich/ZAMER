object FGraph: TFGraph
  Left = 0
  Top = 0
  Caption = 'FGraph'
  ClientHeight = 651
  ClientWidth = 987
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnMouseDown = FormMouseDown
  DesignSize = (
    987
    651)
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = -2
    Top = 598
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'START'
    TabOrder = 0
    OnClick = Button1Click
    ExplicitTop = 519
  end
  object Button2: TButton
    Left = 79
    Top = 598
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'STOP'
    TabOrder = 1
    ExplicitTop = 519
  end
  object Edit1: TEdit
    Left = 160
    Top = 599
    Width = 121
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 2
    Text = 'Edit1'
    ExplicitTop = 520
  end
  object Edit2: TEdit
    Left = 160
    Top = 626
    Width = 121
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 3
    Text = 'Edit2'
    ExplicitTop = 547
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 987
    Height = 45
    Align = alTop
    TabOrder = 4
    object Image1: TImage
      Left = 1
      Top = 1
      Width = 985
      Height = 43
      Align = alClient
      ExplicitLeft = 200
      ExplicitTop = 152
      ExplicitWidth = 105
      ExplicitHeight = 105
    end
  end
  object Button3: TButton
    Left = -2
    Top = 624
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Open'
    TabOrder = 5
    OnClick = Button3Click
  end
  object QTemp: TFDQuery
    Connection = FMain.FDOra
    Left = 300
    Top = 608
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 392
    Top = 608
  end
end
