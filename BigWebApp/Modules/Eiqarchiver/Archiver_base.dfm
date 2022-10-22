object FrmArciver_base: TFrmArciver_base
  Left = 104
  Top = 200
  ClientHeight = 339
  ClientWidth = 664
  Caption = 'IQ Archiver'
  OldCreateOrder = False
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TUniMainMenu
    Left = 256
    Top = 32
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
  end
end
