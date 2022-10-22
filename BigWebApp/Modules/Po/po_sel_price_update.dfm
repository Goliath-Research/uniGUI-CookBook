object FrmPOSelectPriceUpdate: TFrmPOSelectPriceUpdate
  Left = 768
  Top = 204
  ClientHeight = 185
  ClientWidth = 312
  Caption = 'Confirm'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 148
    Width = 312
    Height = 37
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel3: TUniPanel
      Left = 129
      Top = 1
      Width = 182
      Height = 35
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 13
        Top = 3
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'OK'
        ModalResult = 1
        TabOrder = 1
      end
      object btnCancel: TUniButton
        Left = 101
        Top = 3
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 312
    Height = 148
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object GroupBox1: TUniGroupBox
      Left = 1
      Top = 1
      Width = 310
      Height = 146
      Hint = ''
      Caption = '  Update Unit Price '
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object rbtnThisItem: TUniRadioButton
        Left = 17
        Top = 24
        Width = 198
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Selected item on this purchase order'
        TabOrder = 0
      end
      object rbtnThisPO: TUniRadioButton
        Left = 17
        Top = 52
        Width = 177
        Height = 17
        Hint = ''
        Caption = 'All items on this purchase order'
        TabOrder = 1
      end
      object rbtnThisItemAllPOs: TUniRadioButton
        Left = 17
        Top = 81
        Width = 197
        Height = 17
        Hint = ''
        Caption = 'Selected item on all purchase orders'
        TabOrder = 2
      end
      object rbtnAllItemsAllPos: TUniRadioButton
        Left = 17
        Top = 108
        Width = 177
        Height = 17
        Hint = ''
        Caption = 'All items on all purchase orders'
        TabOrder = 3
      end
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'btnOK'
      'rbtnThisItem'
      'rbtnThisPO'
      'rbtnThisItemAllPOs'
      'rbtnAllItemsAllPOs')
    SecurityCode = 'FRMPOSELECTPRICEUPDATE'
    Left = 264
    Top = 26
  end
end
