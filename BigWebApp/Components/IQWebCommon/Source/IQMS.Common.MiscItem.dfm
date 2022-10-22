object FrmMiscItem: TFrmMiscItem
  Left = 367
  Top = 320
  ClientHeight = 183
  ClientWidth = 359
  Caption = 'Miscellaneous'
  OnShow = FormShow
  BorderStyle = bsDialog
  Position = poOwnerFormCenter
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlClient: TUniPanel
    Left = 0
    Top = 0
    Width = 359
    Height = 142
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlLabels: TUniPanel
      Left = 1
      Top = 1
      Width = 106
      Height = 140
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object lblDescription: TUniLabel
        Left = 16
        Top = 36
        Width = 53
        Height = 13
        Hint = ''
        Caption = 'Description'
        TabOrder = 1
      end
      object lblQuantity: TUniLabel
        Left = 16
        Top = 60
        Width = 42
        Height = 13
        Hint = ''
        Caption = 'Quantity'
        TabOrder = 2
      end
      object lblUnitPrice: TUniLabel
        Left = 16
        Top = 84
        Width = 45
        Height = 13
        Hint = ''
        Caption = 'Unit Price'
        TabOrder = 3
      end
      object lblUOM: TUniLabel
        Left = 16
        Top = 108
        Width = 23
        Height = 13
        Hint = ''
        Caption = 'UOM'
        TabOrder = 4
      end
      object lblItemno: TUniLabel
        Left = 16
        Top = 12
        Width = 33
        Height = 13
        Hint = ''
        Caption = 'Item #'
        TabOrder = 5
      end
    end
    object PnlControls: TUniPanel
      Left = 106
      Top = 1
      Width = 253
      Height = 140
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        253
        140)
      object edtQuantity: TUniFormattedNumberEdit
        Left = 1
        Top = 56
        Width = 171
        Hint = ''
        Constraints.MinWidth = 121
        FormattedInput.ShowThousandSeparator = False
        FormattedInput.DefaultCurrencySign = False
        FormattedInput.DecimalGroup = 0
        TabOrder = 4
        DecimalPrecision = 0
        DecimalSeparator = '.'
        ThousandSeparator = ','
      end
      object edtUnitPrice: TUniFormattedNumberEdit
        Left = 1
        Top = 80
        Width = 171
        Hint = ''
        Constraints.MinWidth = 121
        FormattedInput.DecimalGroup = 2
        TabOrder = 5
        DecimalPrecision = 6
        DecimalSeparator = '.'
        ThousandSeparator = ','
      end
      object cmbUOM: TUniComboBox
        Left = 1
        Top = 104
        Width = 171
        Height = 21
        Hint = ''
        Style = csDropDownList
        Text = ''
        TabOrder = 1
      end
      object cmbItemNumber: TUniComboBox
        Left = 1
        Top = 8
        Width = 246
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
      object cmbDescription: TUniComboBox
        Left = 1
        Top = 32
        Width = 246
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 3
      end
    end
  end
  object PnlBottom: TUniPanel
    Left = 0
    Top = 142
    Width = 359
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PnlButtons: TUniPanel
      Left = 146
      Top = 1
      Width = 213
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniBitBtn
        Left = 8
        Top = 8
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
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
end
