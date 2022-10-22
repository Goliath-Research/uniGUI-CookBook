object DDOptions: TDDOptions
  Left = 212
  Top = 154
  ClientHeight = 196
  ClientWidth = 344
  Caption = 'Options'
  BorderStyle = bsSingle
  OldCreateOrder = True
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TUniPageControl
    Left = 8
    Top = 8
    Width = 329
    Height = 145
    Hint = ''
    ActivePage = shGeneral
    TabBarVisible = True
    TabOrder = 0
    object shGeneral: TUniTabSheet
      Hint = ''
      Caption = 'General'
      object Label1: TUniLabel
        Left = 8
        Top = 16
        Width = 89
        Height = 13
        Hint = ''
        Caption = 'Output Buffer Size'
        TabOrder = 1
      end
      object Label2: TUniLabel
        Left = 146
        Top = 40
        Width = 104
        Height = 13
        Hint = ''
        Caption = '0 - Unlimited, show all'
        TabOrder = 2
      end
      object eSize: TUniEdit
        Left = 146
        Top = 12
        Width = 33
        Height = 21
        Hint = ''
        Text = '0'
        TabOrder = 0
      end
    end
  end
  object Button1: TUniButton
    Left = 136
    Top = 160
    Width = 97
    Height = 25
    Hint = ''
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TUniButton
    Left = 240
    Top = 160
    Width = 97
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
