object D4WDialogA: TD4WDialogA
  Left = 0
  Top = 0
  ClientHeight = 313
  ClientWidth = 645
  Caption = 'IQUniDialogA'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  ActiveControl = UniEdit1
  PixelsPerInch = 96
  TextHeight = 13
  object UniGroupBox1: TUniGroupBox
    Left = 0
    Top = 0
    Width = 645
    Height = 273
    Hint = ''
    Caption = 'UniGroupBox1'
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    object UniEdit1: TUniEdit
      Left = 192
      Top = 120
      Width = 225
      Hint = ''
      Text = 'UniEdit1'
      TabOrder = 1
    end
    object UniEdit2: TUniEdit
      Left = 192
      Top = 152
      Width = 121
      Hint = ''
      Text = 'UniEdit2'
      TabOrder = 2
    end
  end
  object UniButton1: TUniButton
    Left = 562
    Top = 280
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
  end
  object UniButton2: TUniButton
    Left = 8
    Top = 280
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
