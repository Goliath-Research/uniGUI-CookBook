object FrmDBTransDebug: TFrmDBTransDebug
  Left = 391
  Top = 167
  ClientHeight = 259
  ClientWidth = 475
  Caption = 'Data View'
  OnShow = UniFormShow
  OldCreateOrder = False
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 0
    Width = 475
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
  end
  object PnlDisplay: TUniPanel
    Tag = 1999
    Left = 0
    Top = 3
    Width = 475
    Height = 256
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object pcMain: TUniPageControl
      Left = 1
      Top = 1
      Width = 473
      Height = 254
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 304
    Top = 40
    object File1: TUniMenuItem
      Caption = '&File'
      object Close1: TUniMenuItem
        Caption = '&Close'
        OnClick = Close1Click
      end
    end
    object Options1: TUniMenuItem
      Caption = '&Options'
      OnClick = Options1Click
      object StayOnTop1: TUniMenuItem
        Caption = 'Stay On Top'
        OnClick = StayOnTop1Click
      end
    end
  end
  object SrcQuery: TDataSource
    Left = 124
    Top = 150
  end
end
