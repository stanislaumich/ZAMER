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
  end
  object Button2: TButton
    Left = 79
    Top = 598
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'STOP'
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 160
    Top = 599
    Width = 121
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 2
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 160
    Top = 626
    Width = 121
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 3
    Text = 'Edit2'
  end
  object Button3: TButton
    Left = -2
    Top = 624
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Open'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Chart1: TChart
    Left = 0
    Top = 0
    Width = 987
    Height = 593
    Title.Font.Height = -41
    Title.Text.Strings = (
      #1047#1072#1084#1077#1088' '#1084#1080#1085#1080#1084#1072#1083#1100#1085#1086#1075#1086' '#1084#1086#1084#1077#1085#1090#1072)
    OnClickSeries = Chart1ClickSeries
    View3D = False
    Align = alTop
    TabOrder = 5
    Anchors = [akLeft, akTop, akRight, akBottom]
    DefaultCanvas = 'TGDIPlusCanvas'
    PrintMargins = (
      15
      24
      15
      24)
    ColorPaletteIndex = 13
    object Series1: TFastLineSeries
      Selected.Hover.Visible = True
      Title = #1052#1086#1084#1077#1085#1090
      LinePen.Color = 10708548
      LinePen.Width = 3
      TreatNulls = tnDontPaint
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object Series2: TFastLineSeries
      Selected.Hover.Visible = True
      Title = #1054#1073#1086#1088#1086#1090#1099
      LinePen.Color = 3513587
      LinePen.Width = 3
      TreatNulls = tnDontPaint
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object Button4: TButton
    Left = 79
    Top = 624
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Graph'
    TabOrder = 6
    OnClick = Button4Click
  end
  object ScrollBar1: TScrollBar
    Left = 452
    Top = 596
    Width = 517
    Height = 17
    Anchors = [akLeft, akBottom]
    Max = 1000
    Min = 10
    PageSize = 0
    Position = 10
    TabOrder = 7
    OnChange = ScrollBar1Change
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
