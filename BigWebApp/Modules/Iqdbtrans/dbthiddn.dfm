object FrmDBTransHidden: TFrmDBTransHidden
  Left = 98
  Top = 195
  ClientHeight = 422
  ClientWidth = 680
  Caption = 'FrmDBTransHidden'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel4: TUniPanel
    Left = 0
    Top = 0
    Width = 680
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
  end
  object PnlMain: TUniPanel
    Left = 0
    Top = 3
    Width = 680
    Height = 419
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
  end
  object MainMenu1: TUniMainMenu
    Left = 288
    Top = 72
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
  end
end
