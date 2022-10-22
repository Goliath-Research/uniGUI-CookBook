object IQDesignerSelectForm: TIQDesignerSelectForm
  Left = 0
  Top = 0
  ClientHeight = 421
  ClientWidth = 281
  Caption = 'IQDesignerSelectForm'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  DesignSize = (
    281
    421)
  PixelsPerInch = 96
  TextHeight = 13
  object UniListBox: TUniListBox
    Left = 0
    Top = 0
    Width = 281
    Height = 380
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    OnDblClick = UniListBoxDblClick
  end
  object UniButton1: TUniButton
    Left = 8
    Top = 386
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    ModalResult = 2
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object UniButton2: TUniButton
    Left = 196
    Top = 386
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'OK'
    ModalResult = 1
    Anchors = [akRight, akBottom]
    TabOrder = 2
    ScreenMask.Enabled = True
    ScreenMask.ShowMessage = False
    ScreenMask.Target = Owner
    ScreenMask.Color = clWhite
  end
end
