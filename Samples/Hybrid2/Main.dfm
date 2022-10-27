object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 65
  ClientWidth = 472
  Caption = 'Point of Sale (demo)'
  OldCreateOrder = False
  Menu = UniMainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object UniToolBar1: TUniToolBar
    Left = 0
    Top = 0
    Width = 472
    Height = 65
    Hint = ''
    ButtonHeight = 64
    ButtonWidth = 82
    Images = UniMainModule.UniNativeImageList1
    ShowCaptions = True
    ButtonAutoWidth = True
    Anchors = [akLeft, akTop, akRight]
    Align = alTop
    TabOrder = 0
    ParentColor = False
    Color = clBtnFace
    object btnEditUsers: TUniToolButton
      Left = 0
      Top = 0
      Action = UniMainModule.actEditUsers
      ImageIndex = 0
      TabOrder = 1
    end
    object btnEditOrders: TUniToolButton
      Left = 82
      Top = 0
      Action = UniMainModule.actEditOrders
      ImageIndex = 1
      TabOrder = 2
    end
    object btnReportSales: TUniToolButton
      Left = 164
      Top = 0
      Action = UniMainModule.actReportSales
      ImageIndex = 4
      TabOrder = 3
    end
  end
  object UniMainMenu1: TUniMainMenu
    Left = 352
    Top = 16
    object Main1: TUniMenuItem
      Caption = 'Main'
      object Logoff1: TUniMenuItem
        Caption = 'Log off'
        OnClick = Logoff1Click
      end
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Administration1: TUniMenuItem
      Caption = 'Administration'
      object EditUsers1: TUniMenuItem
        Action = UniMainModule.actEditUsers
      end
    end
    object Operations1: TUniMenuItem
      Caption = 'Operations'
      object EditOrders1: TUniMenuItem
        Action = UniMainModule.actEditUsers
      end
    end
    object Reports1: TUniMenuItem
      Caption = 'Reports'
      object ReportSales1: TUniMenuItem
        Action = UniMainModule.actReportSales
      end
    end
  end
end
