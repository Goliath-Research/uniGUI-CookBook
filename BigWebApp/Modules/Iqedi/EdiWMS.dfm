object FrmWMS: TFrmWMS
  Left = 82
  Top = 167
  ClientHeight = 137
  ClientWidth = 309
  Caption = 'WMS'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 21
    Top = 21
    Width = 45
    Height = 13
    Hint = ''
    Caption = 'Packslip#'
    TabOrder = 1
  end
  object Edit1: TUniEdit
    Left = 86
    Top = 18
    Width = 121
    Height = 21
    Hint = ''
    Text = '25945806'
    TabOrder = 0
  end
  object Button1: TUniButton
    Left = 223
    Top = 49
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Process'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TUniButton
    Left = 223
    Top = 13
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Populate'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TUniButton
    Left = 224
    Top = 88
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    TabOrder = 4
  end
end
