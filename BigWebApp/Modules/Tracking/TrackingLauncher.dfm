object FormTrackingLauncher: TFormTrackingLauncher
  Left = 192
  Top = 107
  ClientHeight = 98
  ClientWidth = 156
  Caption = 'FormTrackingLauncher'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TUniButton
    Left = 40
    Top = 16
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Serial'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TUniButton
    Left = 40
    Top = 56
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Lot'
    TabOrder = 1
    OnClick = Button2Click
  end
end
