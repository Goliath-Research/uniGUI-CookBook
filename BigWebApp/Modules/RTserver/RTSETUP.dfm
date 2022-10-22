object RTserialCom: TRTserialCom
  Left = 303
  Top = 159
  ClientHeight = 203
  ClientWidth = 276
  Caption = 'RT Serial Comunication Setup'
  OldCreateOrder = True
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 16
    Top = 16
    Width = 44
    Height = 13
    Hint = ''
    Caption = 'Com Port'
    TabOrder = 0
  end
  object Label2: TUniLabel
    Left = 8
    Top = 48
    Width = 50
    Height = 13
    Hint = ''
    Caption = 'Baud Rate'
    TabOrder = 1
  end
  object Label3: TUniLabel
    Left = 16
    Top = 80
    Width = 43
    Height = 13
    Hint = ''
    Caption = 'Data Bits'
    TabOrder = 2
  end
  object Label4: TUniLabel
    Left = 22
    Top = 112
    Width = 37
    Height = 13
    Hint = ''
    Caption = 'Stop Bit'
    TabOrder = 3
  end
  object Label5: TUniLabel
    Left = 33
    Top = 144
    Width = 28
    Height = 13
    Hint = ''
    Caption = 'Parity'
    TabOrder = 4
  end
  object Label6: TUniLabel
    Left = 26
    Top = 176
    Width = 32
    Height = 13
    Hint = ''
    Caption = 'RxSize'
    TabOrder = 6
  end
  object ComboBox1: TUniComboBox
    Left = 72
    Top = 12
    Width = 73
    Height = 21
    Hint = ''
    Text = ''
    Items.Strings = (
      'NO PORT'
      'COM1'
      'COM2'
      'COM3')
    TabOrder = 7
  end
  object ComboBox2: TUniComboBox
    Left = 72
    Top = 44
    Width = 73
    Height = 21
    Hint = ''
    Text = ''
    Items.Strings = (
      '110'
      '300'
      '600'
      '1200'
      '2400'
      '4800'
      '9600'
      '14400'
      '19200'
      '38400'
      '56000'
      '57600'
      '115200'
      '128000'
      '256000')
    TabOrder = 8
  end
  object ComboBox3: TUniComboBox
    Left = 72
    Top = 76
    Width = 73
    Height = 21
    Hint = ''
    Text = ''
    Items.Strings = (
      '4'
      '5'
      '6'
      '7'
      '8')
    TabOrder = 9
  end
  object ComboBox4: TUniComboBox
    Left = 72
    Top = 108
    Width = 73
    Height = 21
    Hint = ''
    Text = ''
    Items.Strings = (
      '1'
      '1, 5'
      '2')
    TabOrder = 10
  end
  object ComboBox5: TUniComboBox
    Left = 72
    Top = 140
    Width = 73
    Height = 21
    Hint = ''
    Text = ''
    Items.Strings = (
      'NONE'
      'ODD'
      'EVEN'
      'MARK'
      'SPACE')
    TabOrder = 11
  end
  object Edit1: TUniEdit
    Left = 72
    Top = 172
    Width = 73
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 5
  end
  object Button1: TUniButton
    Left = 196
    Top = 12
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'OK'
    TabOrder = 12
  end
  object Button2: TUniButton
    Left = 196
    Top = 53
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    TabOrder = 13
  end
end
