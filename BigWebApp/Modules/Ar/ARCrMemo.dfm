object FrmICrMemo: TFrmICrMemo
  Left = 316
  Top = 217
  ClientHeight = 85
  ClientWidth = 273
  Caption = 'Credit Memo'
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = UniFormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  DesignSize = (
    273
    85)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 9
    Top = 17
    Width = 100
    Height = 13
    Hint = ''
    Caption = 'Credit Memo Amount'
    TabOrder = 1
  end
  object Edit1: TUniEdit
    Left = 177
    Top = 13
    Width = 89
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 0
  end
  object BtnOk: TUniButton
    Left = 64
    Top = 54
    Width = 97
    Height = 25
    Hint = ''
    Caption = '&OK'
    Anchors = [akRight, akBottom]
    TabOrder = 2
    OnClick = BtnOkClick
  end
  object BtnCancel: TUniButton
    Left = 168
    Top = 54
    Width = 97
    Height = 25
    Hint = ''
    Caption = '&Cancel'
    ModalResult = 2
    Anchors = [akRight, akBottom]
    TabOrder = 3
  end
end
