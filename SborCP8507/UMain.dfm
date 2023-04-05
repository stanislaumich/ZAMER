object Fmain: TFmain
  Left = 0
  Top = 0
  Caption = #1057#1073#1086#1088' '#1062#1055'8507/14'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 8
    Top = 27
    Width = 31
    Height = 13
    Caption = 'Label2'
  end
  object Label3: TLabel
    Left = 8
    Top = 48
    Width = 31
    Height = 13
    Caption = 'Label3'
  end
  object Label4: TLabel
    Left = 56
    Top = 8
    Width = 31
    Height = 13
    Caption = 'Label4'
  end
  object Label5: TLabel
    Left = 56
    Top = 28
    Width = 31
    Height = 13
    Caption = 'Label5'
  end
  object Label6: TLabel
    Left = 56
    Top = 48
    Width = 31
    Height = 13
    Caption = 'Label6'
  end
  object Button1: TButton
    Left = 8
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
  end
  object FDC: TFDConnection
    Params.Strings = (
      'DriverID=Ora'
      'Database=XE'
      'Password=zamer'
      'User_Name=zamer')
    Connected = True
    LoginPrompt = False
    Left = 564
    Top = 12
  end
end
