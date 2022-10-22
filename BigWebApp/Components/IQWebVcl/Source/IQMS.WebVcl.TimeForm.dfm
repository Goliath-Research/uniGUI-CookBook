object TimeForm: TTimeForm
  Left = 0
  Top = 0
  ClientHeight = 299
  ClientWidth = 635
  Caption = ''
  OldCreateOrder = False
  Menu = MMainMenu
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Alist: TUniListBox
    Left = 0
    Top = 0
    Width = 635
    Height = 299
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    ParentFont = False
    Font.Name = 'Courier New'
    MultiSelect = True
    ExplicitLeft = 216
    ExplicitTop = 144
    ExplicitWidth = 121
    ExplicitHeight = 97
  end
  object MMainMenu: TUniMainMenu
    Left = 304
    Top = 152
    object File1: TUniMenuItem
      Caption = ''
      object SaveToTextFile1: TUniMenuItem
        Caption = ''
        OnClick = SaveToTextFile1Click
      end
      object SaveToBitmapFile1: TUniMenuItem
        Caption = ''
        OnClick = SaveToBitmapFile1Click
      end
    end
  end
end
