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
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    987
    651)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 81
    Top = 612
    Width = 122
    Height = 29
    Anchors = [akLeft, akBottom]
    Caption = #1047#1072#1084#1077#1088' '#8470':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitTop = 599
  end
  object Label2: TLabel
    Left = 209
    Top = 612
    Width = 15
    Height = 29
    Anchors = [akLeft, akBottom]
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitTop = 599
  end
  object Label3: TLabel
    Left = 296
    Top = 612
    Width = 106
    Height = 29
    Anchors = [akLeft, akBottom]
    Caption = #1052#1086#1084#1077#1085#1090':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitTop = 599
  end
  object Label4: TLabel
    Left = 408
    Top = 612
    Width = 15
    Height = 29
    Anchors = [akLeft, akBottom]
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitTop = 599
  end
  object Label5: TLabel
    Left = 615
    Top = 612
    Width = 15
    Height = 29
    Anchors = [akLeft, akBottom]
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitTop = 599
  end
  object Label6: TLabel
    Left = 489
    Top = 612
    Width = 120
    Height = 29
    Anchors = [akLeft, akBottom]
    Caption = #1054#1073#1086#1088#1086#1090#1099':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitTop = 599
  end
  object Label7: TLabel
    Left = 697
    Top = 599
    Width = 49
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = #1058#1086#1083#1097#1080#1085#1072':'
    ExplicitTop = 586
  end
  object Label8: TLabel
    Left = 677
    Top = 623
    Width = 49
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = #1052#1072#1089#1096#1090#1072#1073':'
    ExplicitTop = 610
  end
  object Chart1: TChart
    Left = 0
    Top = 0
    Width = 987
    Height = 590
    Legend.Alignment = laLeft
    Title.Font.Height = -41
    Title.Text.Strings = (
      #1047#1072#1084#1077#1088' '#1084#1080#1085#1080#1084#1072#1083#1100#1085#1086#1075#1086' '#1084#1086#1084#1077#1085#1090#1072)
    OnClickSeries = Chart1ClickSeries
    View3D = False
    Align = alTop
    TabOrder = 0
    Anchors = [akLeft, akTop, akRight, akBottom]
    ExplicitHeight = 577
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
      LinePen.Width = 5
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
      LinePen.Width = 5
      TreatNulls = tnDontPaint
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object Series3: TPointSeries
      Legend.Text = #1052#1040#1056#1050#1045#1056
      LegendTitle = #1052#1040#1056#1050#1045#1056
      ClickableLine = False
      Pointer.Emboss.Color = clRed
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object Button4: TButton
    Left = 0
    Top = 612
    Width = 75
    Height = 31
    Anchors = [akLeft, akBottom]
    Caption = #1055#1086#1089#1090#1088#1086#1080#1090#1100
    TabOrder = 1
    OnClick = Button4Click
    ExplicitTop = 599
  end
  object BitBtn1: TBitBtn
    Left = 788
    Top = 606
    Width = 199
    Height = 44
    Anchors = [akRight, akBottom]
    Caption = 'F9 '#1047#1072#1087#1080#1089#1072#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF169C16169C16FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF169C1624B72C22B62A22B62A
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF17A61721B4282F
      D4442ED34128C63422B62AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF18AB
      181DAE2330D4462FD4442ED2422DD03F28C63422B62AFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF18B0181BAD1E30D24732D74A30D4472CD24125CF3A2BD03C28C63422B6
      2AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF18B2181BAD1E2FD04636DA5132D64A2FD5474DDF66AAF1BA
      37D64A29D03C28C63423B92DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF18B61819AD192ECD4239DB5735D75033D74C81
      EB9858EF7BB3F8CCAAF1BA38D64B2AD03D28C63421B428FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF92DD9218B1182BC83C3ADC5C38DA
      5636D85281EB9821C72821C52821C728B4F9CDAAF1BA2ED3422BD13E28C6341C
      AA22FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF18B1182EC83A
      3DDD6238DA5A38DA5681EB9821C72816A116FFFFFF16A11629D133C9FADB93ED
      A72AD13E2CD34028C6341AA31EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF22BB2938DA5A3FDE6438DA5AB6F4D121C72816A116FFFFFFFFFFFFFFFFFF
      17A9173ADA47D6FAE380EA9629D13D2DD44228C63423B92DFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF20BA286CE89038DA5AB6F4D121C72816A116FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF16A51646E05ADDFBE868E57D28CF3C2ED44328C634
      179C19FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF18B2184AD95FB6F4D155DE6B16A1
      16FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF16A5165EE974DFFBEA4F
      DE6528D03D2FD54427C032179A17FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF18B719
      16A11616A116FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF18A81877EF92DCFBE843DB582BD13E2FD64423B92D169C16FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF18AD1996F4B1D6FAE34FDE652CD2412FD5441FB1
      27169C16FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF21BB2AB6F7CDD6FAE3
      4FDE652DD3422ED3421CA922169F16FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF22BD2B96F4B1D6FAE34FDE652FD5442DCF3F1AA31E92DD92FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF22BD2B96F4B1D6FAE34FDE6530D7472ACB3B1A
      A31EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF22BD2B4AD95ED6FA
      E34FDE6531D7481CA723FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF22BD2B4AD95ED6FAE32ECD411FB127FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF92DD924AD95E27C032FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn1Click
    ExplicitTop = 593
  end
  object Edit1: TEdit
    Left = 752
    Top = 596
    Width = 30
    Height = 21
    Anchors = [akRight, akBottom]
    TabOrder = 3
    Text = '6'
    ExplicitTop = 583
  end
  object UpDown1: TUpDown
    Left = 765
    Top = 620
    Width = 16
    Height = 21
    Anchors = [akRight, akBottom]
    Associate = Edit2
    Position = 10
    TabOrder = 4
    OnClick = UpDown1Click
    ExplicitTop = 607
  end
  object Edit2: TEdit
    Left = 732
    Top = 620
    Width = 33
    Height = 21
    Anchors = [akRight, akBottom]
    TabOrder = 5
    Text = '10'
    ExplicitTop = 607
  end
  object QTemp: TFDQuery
    Connection = FMain.FDOra
    Left = 876
    Top = 128
  end
  object ActionList1: TActionList
    Left = 40
    Top = 260
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 120
      OnExecute = Action1Execute
    end
  end
end
