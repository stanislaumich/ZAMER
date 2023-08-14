object Form1: TForm1
  Left = 191
  Top = 154
  BorderStyle = bsDialog
  Caption = 'Service Program RS232'
  ClientHeight = 433
  ClientWidth = 403
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object Label2: TLabel
    Left = 32
    Top = 360
    Width = 3
    Height = 16
  end
  object Label3: TLabel
    Left = 19
    Top = 16
    Width = 64
    Height = 16
    Caption = 'Input Code'
  end
  object Label4: TLabel
    Left = 29
    Top = 299
    Width = 74
    Height = 16
    Caption = 'Output Code'
  end
  object Button1: TButton
    Left = 29
    Top = 389
    Width = 89
    Height = 33
    Caption = 'Exit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 130
    Top = 389
    Width = 153
    Height = 33
    Caption = 'Out Code'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 29
    Top = 323
    Width = 241
    Height = 24
    TabOrder = 2
    OnChange = Edit1Change
  end
  object StringGrid1: TStringGrid
    Left = 15
    Top = 40
    Width = 356
    Height = 246
    Color = clBtnHighlight
    ColCount = 16
    Ctl3D = True
    DefaultColWidth = 22
    DefaultRowHeight = 15
    FixedCols = 0
    RowCount = 16
    FixedRows = 0
    GridLineWidth = 0
    ParentCtl3D = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 101
    Top = 190
  end
  object MainMenu1: TMainMenu
    Left = 45
    Top = 185
    object File1: TMenuItem
      Caption = 'File'
      object Save1: TMenuItem
        Caption = 'Save'
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Port1: TMenuItem
      Caption = 'Port'
    end
    object Help1: TMenuItem
      Caption = 'Help'
    end
  end
end
