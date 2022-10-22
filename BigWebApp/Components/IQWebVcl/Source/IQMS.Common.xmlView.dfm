object FrmXMLViewer: TFrmXMLViewer
  Left = 0
  Top = 0
  ClientHeight = 542
  ClientWidth = 784
  Caption = 'XML Viewer'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object UniHTMLFrame1: TUniHTMLFrame
    Left = 0
    Top = 0
    Width = 784
    Height = 542
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    ExplicitLeft = 616
    ExplicitTop = 232
    ExplicitWidth = 256
    ExplicitHeight = 128
  end
  object MainMenu1: TUniMainMenu
    Left = 224
    Top = 179
    object File1: TUniMenuItem
      Caption = '&File'
      object SavetoFile1: TUniMenuItem
        Caption = 'Save to File'
        ShortCut = 16467
        OnClick = SavetoFile1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object PMain: TUniPopupMenu
    Left = 256
    Top = 179
    object SavetoFile2: TUniMenuItem
      Caption = 'Save to File'
      OnClick = SavetoFile1Click
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'XMLViewer'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 190858 $'
    BuildVersion = '176554'
    Left = 384
    Top = 288
  end
end
