object FrmBOMProdRepParams: TFrmBOMProdRepParams
  Left = 274
  Top = 161
  HelpContext = 1106765
  ClientHeight = 203
  ClientWidth = 400
  Caption = 'Production Reporting Parameters'
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TUniGroupBox
    Left = 7
    Top = 103
    Width = 386
    Height = 62
    Hint = ''
    Caption = '  Regrind Option  '
    TabOrder = 1
    object chkBackflush: TUniCheckBox
      Left = 8
      Top = 18
      Width = 230
      Height = 17
      Hint = ''
      Caption = 'Backflush Regrind from Inventory'
      TabOrder = 0
    end
  end
  object btnOK: TUniButton
    Left = 188
    Top = 173
    Width = 97
    Height = 25
    Hint = ''
    Caption = '&OK'
    ModalResult = 1
    TabOrder = 2
  end
  object btnCancel: TUniButton
    Left = 292
    Top = 173
    Width = 97
    Height = 25
    Hint = ''
    Caption = '&Cancel'
    Cancel = True
    ModalResult = 2
    TabOrder = 3
  end
  object GroupBox2: TUniGroupBox
    Left = 8
    Top = 6
    Width = 385
    Height = 89
    Hint = ''
    Caption = '  Backflush Based On  '
    TabOrder = 0
    object rbtnShotWeight: TUniRadioButton
      Left = 8
      Top = 18
      Width = 161
      Height = 17
      Hint = ''
      Caption = 'Total Cycles at Shot Weight'
      TabOrder = 0
    end
    object rbtnPartWeight: TUniRadioButton
      Left = 8
      Top = 41
      Width = 161
      Height = 17
      Hint = ''
      Caption = 'Total Cycles at Part Weight'
      TabOrder = 1
    end
    object rbtnGoodParts: TUniRadioButton
      Left = 8
      Top = 64
      Width = 185
      Height = 17
      Hint = ''
      Caption = 'Good Parts Only at Part Weight'
      TabOrder = 2
    end
  end
end
