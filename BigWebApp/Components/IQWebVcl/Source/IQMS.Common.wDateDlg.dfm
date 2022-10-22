object FrmSelectWWDate: TFrmSelectWWDate
  Left = 354
  Top = 245
  ClientHeight = 92
  ClientWidth = 270
  Caption = 'Date'
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblPrompt: TUniLabel
    Left = 0
    Top = 0
    Width = 63
    Height = 13
    Hint = ''
    Caption = 'Select a date'
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 58
    Width = 270
    Height = 34
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      270
      34)
    object btnOK: TUniButton
      Left = 63
      Top = 6
      Width = 97
      Height = 25
      Hint = ''
      Caption = 'OK'
      ModalResult = 1
      Anchors = [akTop, akRight]
      TabOrder = 1
    end
    object btnCancel: TUniButton
      Left = 168
      Top = 6
      Width = 97
      Height = 25
      Hint = ''
      Caption = 'Cancel'
      ModalResult = 2
      Anchors = [akTop, akRight]
      TabOrder = 2
    end
  end
  object cmbDate: TUniDateTimePicker
    Left = 16
    Top = 16
    Width = 186
    Height = 21
    Hint = ''
    DateTime = 42635.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    TimeFormat = 'HH:mm:ss'
    TabOrder = 1
  end
end
