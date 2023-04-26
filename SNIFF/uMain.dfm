object frmMain: TfrmMain
  Left = 214
  Top = 118
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'SnifferDemo v1.01'
  ClientHeight = 579
  ClientWidth = 652
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    652
    579)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 558
    Width = 133
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Select Network Connection:'
  end
  object btnStartStop: TButton
    Left = 559
    Top = 553
    Width = 85
    Height = 20
    Caption = 'Start'
    TabOrder = 0
    OnClick = btnStartStopClick
  end
  object cbInterfaces: TComboBox
    Left = 147
    Top = 553
    Width = 404
    Height = 21
    Style = csDropDownList
    TabOrder = 2
  end
  object RichEdit1: TRichEdit
    Left = 7
    Top = 7
    Width = 637
    Height = 540
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    PlainText = True
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
    WordWrap = False
    Zoom = 100
  end
end
