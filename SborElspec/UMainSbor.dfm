object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1057#1073#1086#1088' ELSPEC'
  ClientHeight = 332
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 4
    Top = 4
    Width = 153
    Height = 325
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      153
      325)
    object Label1: TLabel
      Left = 8
      Top = 3
      Width = 42
      Height = 33
      Caption = 'U='
    end
    object Label2: TLabel
      Left = 15
      Top = 36
      Width = 35
      Height = 33
      Caption = 'I='
    end
    object Label3: TLabel
      Left = 10
      Top = 67
      Width = 40
      Height = 33
      Caption = 'P='
    end
    object Label4: TLabel
      Left = 56
      Top = 3
      Width = 17
      Height = 33
      Caption = '0'
    end
    object Label5: TLabel
      Left = 56
      Top = 36
      Width = 17
      Height = 33
      Caption = '0'
    end
    object Label6: TLabel
      Left = 56
      Top = 67
      Width = 17
      Height = 33
      Caption = '0'
    end
    object GroupBox3: TGroupBox
      Left = 3
      Top = 100
      Width = 147
      Height = 9
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 160
    Top = 4
    Width = 169
    Height = 117
    TabOrder = 1
    object Label7: TLabel
      Left = 3
      Top = 6
      Width = 35
      Height = 13
      Caption = #1040#1076#1088#1077#1089':'
    end
    object Label8: TLabel
      Left = 11
      Top = 33
      Width = 29
      Height = 13
      Caption = #1055#1086#1088#1090':'
    end
    object Label9: TLabel
      Left = 11
      Top = 61
      Width = 15
      Height = 13
      Caption = 'ID:'
    end
    object Edit1: TEdit
      Left = 41
      Top = 3
      Width = 121
      Height = 21
      TabOrder = 0
      Text = '127.0.0.1'
    end
    object Edit2: TEdit
      Left = 41
      Top = 30
      Width = 121
      Height = 21
      TabOrder = 1
      Text = '502'
    end
    object Edit3: TEdit
      Left = 41
      Top = 58
      Width = 121
      Height = 21
      TabOrder = 2
      Text = '159'
    end
    object Button1: TButton
      Left = 41
      Top = 82
      Width = 121
      Height = 25
      Caption = #1058#1045#1057#1058
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  object KRTCPConnector1: TKRTCPConnector
    IP = '127.0.0.1'
    ConnectTimeout = 300
    Left = 192
    Top = 124
  end
  object KRModbusMaster1: TKRModbusMaster
    Connector = KRTCPConnector1
    CheckID = False
    Left = 192
    Top = 172
  end
  object KRModbusClient1: TKRModbusClient
    Modbus = KRModbusMaster1
    Addres = 159
    BatchUpdates = <>
    Left = 276
    Top = 172
    object USred: TKRMBRegister
      ReadFunction = mbrfReadInputRegisters
      MCVarType = MCT_SINGLE
      RegisterIndex = 3529
      ArrayLen = 4
      AskLimit = 5
      HighWordFirst = True
      HighDWordFirst = True
      Interval = 50
    end
    object ISred: TKRMBRegister
      ReadFunction = mbrfReadInputRegisters
      MCVarType = MCT_SINGLE
      RegisterIndex = 3531
      ArrayLen = 4
      AskLimit = 5
      HighWordFirst = True
      HighDWordFirst = True
      Interval = 50
    end
    object PSred: TKRMBRegister
      ReadFunction = mbrfReadInputRegisters
      MCVarType = MCT_SINGLE
      RegisterIndex = 3439
      ArrayLen = 4
      AskLimit = 5
      HighWordFirst = True
      HighDWordFirst = True
      Interval = 50
    end
  end
  object TUpdateForm: TTimer
    Interval = 100
    OnTimer = TUpdateFormTimer
    Left = 276
    Top = 124
  end
end
