object UniDlgMemoForm: TUniDlgMemoForm
  Left = 0
  Top = 0
  ClientHeight = 288
  ClientWidth = 635
  Caption = 'UniDlgMemoForm'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  ActiveControl = UniMemo1
  DesignSize = (
    635
    288)
  PixelsPerInch = 96
  TextHeight = 13
  object UniMemo1: TUniMemo
    Left = 0
    Top = 0
    Width = 635
    Height = 249
    Hint = ''
    Lines.Strings = (
      'UniMemo1')
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
  end
  object UniButton1: TUniButton
    Left = 544
    Top = 255
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'OK'
    ModalResult = 1
    Anchors = [akRight, akBottom]
    TabOrder = 1
  end
  object UniButton2: TUniButton
    Left = 8
    Top = 255
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    ModalResult = 2
    Anchors = [akLeft, akBottom]
    TabOrder = 2
  end
end
