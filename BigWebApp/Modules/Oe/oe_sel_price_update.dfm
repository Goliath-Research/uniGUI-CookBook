object FrmOESelectPriceUpdate: TFrmOESelectPriceUpdate
  Left = 314
  Top = 153
  ClientHeight = 256
  ClientWidth = 302
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
    Top = 219
    Width = 302
    Height = 37
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel3: TUniPanel
      Left = 119
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
    Width = 302
    Height = 219
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object GroupBox1: TUniGroupBox
      Left = 1
      Top = 1
      Width = 300
      Height = 217
      Hint = ''
      Caption = '  Update Unit Price '
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object rbtnThisItem: TUniRadioButton
        Left = 17
        Top = 24
        Width = 185
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Selected item on this sales order'
        TabOrder = 0
        OnClick = EnableControls
      end
      object rbtnThisOrder: TUniRadioButton
        Left = 17
        Top = 52
        Width = 177
        Height = 17
        Hint = ''
        Caption = 'All items on this sales order'
        TabOrder = 1
        OnClick = EnableControls
      end
      object rbtnThisItemAllOrders: TUniRadioButton
        Left = 17
        Top = 81
        Width = 185
        Height = 17
        Hint = ''
        Caption = 'Selected item on all sales orders'
        TabOrder = 2
        OnClick = EnableControls
      end
      object rbtnAllItemsAllOrders: TUniRadioButton
        Left = 17
        Top = 135
        Width = 177
        Height = 17
        Hint = ''
        Caption = 'All items on all sales orders'
        TabOrder = 3
        OnClick = EnableControls
      end
      object chkIncludeUninvoicedThisItemAllOrders: TUniCheckBox
        Left = 41
        Top = 107
        Width = 169
        Height = 17
        Hint = ''
        Enabled = False
        Caption = 'Include uninvoiced shipments'
        TabOrder = 4
        OnClick = EnableControls
      end
      object chkIncludeUninvoicedAlltemsAllOrders: TUniCheckBox
        Left = 41
        Top = 162
        Width = 169
        Height = 17
        Hint = ''
        Enabled = False
        Caption = 'Include uninvoiced shipments'
        TabOrder = 5
      end
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'btnOK'
      'rbtnThisItem'
      'rbtnThisOrder'
      'rbtnThisItemAllOrders'
      'rbtnAllItemsAllOrders'
      'chkIncludeUninvoicedThisItemAllOrders'
      'chkIncludeUninvoicedAlltemsAllOrders')
    SecurityCode = 'FRMOESELECTPRICEUPDATE'
    Left = 24
    Top = 222
  end
end
