object FrmPrintWithDlg: TFrmPrintWithDlg
  Left = 458
  Top = 337
  ClientHeight = 91
  ClientWidth = 275
  Caption = 'Print With'
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  DesignSize = (
    275
    91)
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TUniLabel
    Left = 8
    Top = 7
    Width = 115
    Height = 13
    Hint = ''
    Caption = 'Print with this document'
    TabOrder = 3
  end
  object comboPrintWith: TUniDBComboBox
    Left = 31
    Top = 26
    Width = 234
    Height = 21
    Hint = ''
    Anchors = [akLeft, akTop, akRight]
    Style = csDropDownList
    TabOrder = 0
  end
  object btnCancel: TUniBitBtn
    Left = 172
    Top = 59
    Width = 97
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    Cancel = True
    ModalResult = 2
    Anchors = [akRight, akBottom]
    TabOrder = 1
  end
  object btnOk: TUniBitBtn
    Left = 70
    Top = 59
    Width = 97
    Height = 25
    Hint = ''
    Caption = 'OK'
    ModalResult = 1
    Anchors = [akRight, akBottom]
    TabOrder = 2
  end
end
