object LoadPromptForm: TLoadPromptForm
  Left = 0
  Top = 0
  ClientHeight = 356
  ClientWidth = 363
  Caption = 'Select Module'
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = UniFormClose
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  DesignSize = (
    363
    356)
  PixelsPerInch = 96
  TextHeight = 13
  object TreeView: TUniTreeView
    Left = 0
    Top = 0
    Width = 363
    Height = 314
    Hint = ''
    Items.FontData = {0100000000}
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Color = clWindow
  end
  object UniButton1: TUniButton
    Left = 280
    Top = 323
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Select'
    ModalResult = 1
    Anchors = [akRight, akBottom]
    TabOrder = 1
  end
  object UniButton2: TUniButton
    Left = 11
    Top = 323
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    ModalResult = 2
    Anchors = [akLeft, akBottom]
    TabOrder = 2
  end
end
