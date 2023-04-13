object FSett: TFSett
  Left = 0
  Top = 0
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 569
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object FDC: TFDConnection
    Params.Strings = (
      'DriverID=Ora'
      'ApplicationName=BIG'
      'Password=zamer'
      'User_Name=zamer')
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    Connected = True
    LoginPrompt = False
    Left = 456
    Top = 444
  end
  object QTemp: TFDQuery
    Connection = FDC
    Left = 500
    Top = 444
  end
end
