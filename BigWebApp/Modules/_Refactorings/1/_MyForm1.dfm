object MyForm1: TMyForm1
  Left = 0
  Top = 0
  ClientHeight = 102
  ClientWidth = 305
  Caption = ''
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object lblSomeText: TUniLabel
    Left = 16
    Top = 19
    Width = 77
    Height = 13
    Hint = ''
    Caption = 'Enter some text'
    TabOrder = 1
  end
  object edtSomeText: TUniEdit
    Left = 99
    Top = 16
    Width = 198
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 0
  end
  object btnOk: TUniButton
    Left = 32
    Top = 57
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 2
  end
  object btnCancel: TUniButton
    Left = 208
    Top = 57
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
end
