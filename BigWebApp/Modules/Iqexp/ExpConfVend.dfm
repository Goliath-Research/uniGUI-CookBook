inherited FrmConfVendor: TFrmConfVendor
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TUniPanel
    object Panel3: TUniPanel
      Left = 144
      Top = 5
      Width = 235
      Height = 33
      Align = alRight
      TabOrder = 1
      object BtnOk: TUniButton
        Tag = 1
        Left = 29
        Top = 3
        Width = 97
        Height = 25
        Caption = '&OK'
        OnClick = BtnOkClick
      end
      object btnCancel: TUniButton
        Left = 133
        Top = 3
        Width = 97
        Height = 25
        Caption = 'Cancel'
        OnClick = BtnOkClick
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmConfVendor')
    SecurityItems.Strings = (
      'CheckBox'
      'BtnOk')
    SecurityCode = 'FRMCONFVENDOR'
  end
end
