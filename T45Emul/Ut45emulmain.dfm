object Ft45emulmain: TFt45emulmain
  Left = 0
  Top = 0
  Caption = 'Ft45emulmain'
  ClientHeight = 367
  ClientWidth = 236
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
    Left = 32
    Top = 239
    Width = 29
    Height = 13
    Caption = 'TORQ'
  end
  object Label2: TLabel
    Left = 40
    Top = 263
    Width = 21
    Height = 13
    Caption = 'ROT'
  end
  object Label3: TLabel
    Left = 29
    Top = 287
    Width = 37
    Height = 13
    Caption = 'POWER'
  end
  object Label4: TLabel
    Left = 128
    Top = 11
    Width = 53
    Height = 13
    Caption = 'UPD Zamer'
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 16
    Top = 320
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 72
    Top = 236
    Width = 45
    Height = 21
    TabOrder = 2
    Text = '250'
  end
  object Edit2: TEdit
    Left = 123
    Top = 236
    Width = 42
    Height = 21
    TabOrder = 3
    Text = '1000'
  end
  object Edit3: TEdit
    Left = 72
    Top = 260
    Width = 45
    Height = 21
    TabOrder = 4
    Text = '1800'
  end
  object Edit4: TEdit
    Left = 123
    Top = 260
    Width = 42
    Height = 21
    TabOrder = 5
    Text = '5000'
  end
  object Edit5: TEdit
    Left = 72
    Top = 284
    Width = 45
    Height = 21
    TabOrder = 6
    Text = '800'
  end
  object Edit6: TEdit
    Left = 123
    Top = 284
    Width = 42
    Height = 21
    TabOrder = 7
    Text = '1000'
  end
  object Button3: TButton
    Left = 96
    Top = 320
    Width = 75
    Height = 25
    Caption = 'Stop'
    TabOrder = 8
    OnClick = Button3Click
  end
  object Edit7: TEdit
    Left = 187
    Top = 8
    Width = 37
    Height = 21
    TabOrder = 9
    Text = '50'
  end
  object UniConnection1: TUniConnection
    ProviderName = 'Oracle'
    Username = 'zamer'
    Server = 'XE'
    Connected = True
    Left = 16
    Top = 96
    EncryptedPassword = '85FF9EFF92FF9AFF8DFF'
  end
  object QTemp: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'select * from zamertmp')
    Left = 144
    Top = 96
  end
  object OracleUniProvider1: TOracleUniProvider
    Left = 80
    Top = 96
  end
  object QUpdZamer: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'UPDATE ZAMER.ZAMER SET'
      '   TORQ=:TORQ,ROT=:ROT, POWER=:POWER')
    Left = 140
    Top = 44
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TORQ'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'ROT'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'POWER'
        Value = nil
      end>
  end
  object TimerUPDZamer: TTimer
    Enabled = False
    Interval = 50
    OnTimer = TimerUPDZamerTimer
    Left = 16
    Top = 44
  end
  object Timer1000: TTimer
    OnTimer = Timer1000Timer
    Left = 80
    Top = 44
  end
  object QCommand: TUniQuery
    Connection = UniConnection1
    Left = 16
    Top = 148
  end
  object QClearCommand: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'truncate table command')
    Left = 80
    Top = 148
  end
  object QInsZamerTmp: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'INSERT INTO ZAMER.ZAMERTMP ('
      '   TORQ, ROT, POWER, '
      '   NOMER, PNOM) '
      'VALUES ( :TORQ ,'
      ' :ROT ,'
      ' :POWER ,'
      ' :NOMER ,'
      ' :PNOM  );')
    Left = 144
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TORQ'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'ROT'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'POWER'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'NOMER'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'PNOM'
        Value = nil
      end>
  end
end
