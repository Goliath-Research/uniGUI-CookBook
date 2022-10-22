object FrmSDWebView: TFrmSDWebView
  Left = 198
  Top = 147
  HelpContext = 16912
  ClientHeight = 442
  ClientWidth = 680
  Caption = 'Internet'
  OldCreateOrder = False
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlCarrier: TUniPanel
    Left = 0
    Top = 0
    Width = 680
    Height = 442
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object WebBrowser1: TWebBrowser
      Left = 0
      Top = 0
      Width = 680
      Height = 442
      Align = alClient
      TabOrder = 1
      ExplicitTop = 172
      ExplicitWidth = 688
      ExplicitHeight = 274
      ControlData = {
        4C00000048460000AF2D00000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 593
    Top = 114
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmSDWebView'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 195523 $'
    BuildVersion = '176554'
    Left = 593
    Top = 33
  end
end
