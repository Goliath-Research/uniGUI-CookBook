object FrmViewExceptions: TFrmViewExceptions
  Left = 57
  Top = 183
  ClientHeight = 291
  ClientWidth = 397
  Caption = 'View Exception Records'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo: TUniMemo
    Left = 0
    Top = 0
    Width = 397
    Height = 291
    Hint = ''
    Lines.Strings = (
      '')
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    ReadOnly = True
    TabOrder = 0
  end
  object MainMenu1: TUniMainMenu
    Left = 64
    Top = 104
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
  end
end
