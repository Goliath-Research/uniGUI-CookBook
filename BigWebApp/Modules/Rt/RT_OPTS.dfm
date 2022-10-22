object FrmOptions: TFrmOptions
  Left = 315
  Top = 184
  ClientHeight = 122
  ClientWidth = 226
  Caption = 'RealTime Options'
  BorderStyle = bsDialog
  OldCreateOrder = True
  MonitoredKeys.Keys = <>
  PixelsPerInch = 120
  TextHeight = 13
  object RadioGroup1: TUniRadioGroup
    Left = 8
    Top = 8
    Width = 209
    Height = 73
    Hint = ''
    Items.Strings = (
      'Single Machine Reject Entry View'
      'Multi Machine Reject Entry View')
    Caption = ' Reject Display Options '
    TabOrder = 0
  end
  object BitBtn1: TUniBitBtn
    Left = 12
    Top = 88
    Width = 97
    Height = 25
    Hint = ''
    Caption = ''
    TabOrder = 1
  end
  object BitBtn2: TUniBitBtn
    Left = 116
    Top = 88
    Width = 97
    Height = 25
    Hint = ''
    Caption = ''
    TabOrder = 2
  end
end
