object FrmClonePrompt: TFrmClonePrompt
  Left = 442
  Top = 288
  HelpContext = 4381
  ClientHeight = 239
  ClientWidth = 444
  Caption = 'Clone Equipment'
  BorderStyle = bsDialog
  Position = poOwnerFormCenter
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  DesignSize = (
    444
    239)
  PixelsPerInch = 96
  TextHeight = 13
  object lblEquipmentNo: TUniLabel
    Left = 8
    Top = 60
    Width = 61
    Height = 13
    Hint = ''
    Caption = 'Equipment #'
    TabOrder = 5
  end
  object lblEquipmentDescrip: TUniLabel
    Left = 8
    Top = 84
    Width = 106
    Height = 13
    Hint = ''
    Caption = 'Equipment Description'
    TabOrder = 6
  end
  object lblPrompt: TUniLabel
    Left = 8
    Top = 8
    Width = 397
    Height = 13
    Hint = ''
    Caption = 
      'Enter the new Equipment number and description.  The equipment m' +
      'ust be unique.'
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 7
  end
  object edtEqno: TUniEdit
    Left = 136
    Top = 56
    Width = 185
    Height = 21
    Hint = ''
    MaxLength = 25
    Text = 'XXXXXXXXXXXXXXXXXXXXXXXXX'
    TabOrder = 0
  end
  object edtDesc: TUniEdit
    Left = 136
    Top = 80
    Width = 302
    Height = 21
    Hint = ''
    MaxLength = 30
    Text = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
  end
  object gbOption: TUniGroupBox
    Left = 8
    Top = 112
    Width = 430
    Height = 57
    Hint = ''
    Caption = ' Include '
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    object chkParts: TUniCheckBox
      Left = 208
      Top = 16
      Width = 97
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'Parts'
      TabOrder = 0
    end
    object chkComponents: TUniCheckBox
      Left = 208
      Top = 32
      Width = 97
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'Components'
      TabOrder = 1
    end
    object chkInventory: TUniCheckBox
      Left = 8
      Top = 32
      Width = 97
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'Task Inventory'
      TabOrder = 2
    end
    object chkDocuments: TUniCheckBox
      Left = 8
      Top = 16
      Width = 163
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'Equipment Documents '
      TabOrder = 3
    end
  end
  object chkResetTaskUnits: TUniCheckBox
    Left = 16
    Top = 176
    Width = 169
    Height = 17
    Hint = ''
    Caption = 'Reset task total units to zero'
    TabOrder = 3
  end
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 207
    Width = 444
    Height = 32
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 4
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 225
      Top = 1
      Width = 219
      Height = 30
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniBitBtn
        Left = 8
        Top = 1
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 0
        OnClick = btnOkClick
      end
      object btnCancel: TUniBitBtn
        Left = 112
        Top = 1
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  object PMain: TUniPopupMenu
    Left = 360
    Top = 144
    object Help1: TUniMenuItem
      Caption = '&Help'
      ShortCut = 112
      OnClick = Help1Click
    end
  end
end
