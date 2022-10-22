object FrmMon_Params: TFrmMon_Params
  Left = 185
  Top = 165
  ClientHeight = 67
  ClientWidth = 388
  Caption = ''
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -14
  PixelsPerInch = 96
  TextHeight = 17
  object CheckBox1: TUniCheckBox
    Left = 10
    Top = 11
    Width = 348
    Height = 21
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'On exception - use watch dog to auto restart IQAlert'
    TabOrder = 0
  end
  object DBCheckBox1: TUniDBCheckBox
    Left = 10
    Top = 37
    Width = 344
    Height = 21
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Register IQAlert to run only on this workstation'
    TabOrder = 1
  end
  object Button1: TUniButton
    Left = 320
    Top = 75
    Width = 92
    Height = 31
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Edit1: TUniEdit
    Left = 36
    Top = 70
    Width = 256
    Height = 24
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Text = 'Edit1'
    TabOrder = 3
  end
end
