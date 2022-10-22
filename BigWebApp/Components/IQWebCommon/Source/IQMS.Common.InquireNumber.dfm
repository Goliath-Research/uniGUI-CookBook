object FrmIQInputNumber: TFrmIQInputNumber
  Left = 404
  Top = 369
  ClientHeight = 102
  ClientWidth = 308
  Caption = ''
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblPrompt: TUniLabel
    Left = 24
    Top = 12
    Width = 89
    Height = 13
    Hint = ''
    Caption = 'Please enter value'
    TabOrder = 4
  end
  object edtValueFloat: TUniNumberEdit
    Left = 48
    Top = 31
    Width = 161
    Hint = ''
    TabOrder = 0
    DecimalSeparator = '.'
  end
  object btnOk: TUniBitBtn
    Left = 104
    Top = 72
    Width = 97
    Height = 25
    Hint = ''
    Caption = '&OK'
    ModalResult = 1
    TabOrder = 1
    Default = True
  end
  object btnCancel: TUniBitBtn
    Left = 208
    Top = 72
    Width = 97
    Height = 25
    Hint = ''
    Caption = '&Cancel'
    Cancel = True
    ModalResult = 2
    TabOrder = 2
  end
  object edtValueInt: TUniSpinEdit
    Left = 48
    Top = 31
    Width = 161
    Height = 22
    Hint = ''
    TabOrder = 3
  end
end
