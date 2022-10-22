object FrmRepDefRemove: TFrmRepDefRemove
  Left = 121
  Top = 135
  ClientHeight = 154
  ClientWidth = 384
  Caption = 'About to remove report'
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 5
    Top = 115
    Width = 375
    Height = 5
    Hint = ''
    TabOrder = 2
    Caption = ''
  end
  object Label2: TUniLabel
    Left = 28
    Top = 25
    Width = 334
    Height = 28
    Hint = ''
    AutoSize = False
    Caption = 
      'Report will be deleted from the menu. If this is a Standard repo' +
      'rt it will be restored during software upgrade.'
    TabOrder = 3
  end
  object Label1: TUniLabel
    Left = 28
    Top = 80
    Width = 334
    Height = 28
    Hint = ''
    AutoSize = False
    Caption = 
      'Report will no longer display on the menu. The report will remai' +
      'n hidden after software update.'
    TabOrder = 4
  end
  object rbtnRemove: TUniRadioButton
    Left = 11
    Top = 10
    Width = 113
    Height = 17
    Hint = ''
    Checked = True
    Caption = 'Remove'
    TabOrder = 0
  end
  object rbtnHide: TUniRadioButton
    Left = 11
    Top = 64
    Width = 113
    Height = 17
    Hint = ''
    Caption = 'Hide'
    TabOrder = 1
  end
  object btnOK: TUniButton
    Left = 179
    Top = 124
    Width = 97
    Height = 25
    Hint = ''
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 5
  end
  object btnCancel: TUniButton
    Left = 281
    Top = 124
    Width = 97
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    Cancel = True
    ModalResult = 2
    TabOrder = 6
  end
end
