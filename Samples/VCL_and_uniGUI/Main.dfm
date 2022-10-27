object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 128
  ClientWidth = 434
  Caption = 'MainForm'
  OldCreateOrder = False
  Menu = UniMainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  TextHeight = 15
  object UniLabel1: TUniLabel
    Left = 40
    Top = 24
    Width = 196
    Height = 21
    Hint = ''
    Caption = 'Text to modify by the service'
    ParentFont = False
    Font.Height = -16
    TabOrder = 0
  end
  object UniButton1: TUniButton
    Left = 112
    Top = 80
    Width = 209
    Height = 25
    Hint = ''
    Caption = 'Modify the text'
    TabOrder = 1
    OnClick = UniButton1Click
  end
  object UnimMenu1: TUnimMenu
    Items = <
      item
        Caption = 'TUnimMenuItem-0'
        MenuId = 0
      end>
    Left = 160
    Top = 16
  end
  object MainMenu1: TMainMenu
    Left = 264
    Top = 16
  end
  object UniMainMenu1: TUniMainMenu
    Left = 368
    Top = 16
  end
end
