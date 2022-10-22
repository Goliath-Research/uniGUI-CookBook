object FRMPRGLDate: TFRMPRGLDate
  Left = 188
  Top = 143
  ClientHeight = 78
  ClientWidth = 271
  Caption = 'GL Prepost date'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 13
    Top = 17
    Width = 140
    Height = 13
    Hint = ''
    Caption = 'Please enter GL Prepost date'
    TabOrder = 0
  end
  object btnOk: TUniButton
    Left = 107
    Top = 45
    Width = 75
    Height = 25
    Hint = ''
    Caption = '&Ok'
    ModalResult = 1
    TabOrder = 1
    OnClick = btnOkClick
  end
  object btnCancel: TUniButton
    Left = 188
    Top = 45
    Width = 75
    Height = 25
    Hint = ''
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object DT: TUniDateTimePicker
    Left = 157
    Top = 13
    Width = 106
    Height = 21
    Hint = ''
    DateTime = 42660.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    TimeFormat = 'HH:mm:ss'
    TabOrder = 2
  end
end
