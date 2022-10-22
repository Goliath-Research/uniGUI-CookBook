inherited FrmConfirmWithSecurity: TFrmConfirmWithSecurity
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TUniPanel
    object PnlButtonsRight: TUniPanel
      Left = 170
      Top = 6
      Width = 208
      Height = 31
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object btnYes: TUniBitBtn
        Left = 1
        Top = 1
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Yes'
        ModalResult = 1
        TabOrder = 0
      end
      object btnNo: TUniBitBtn
        Left = 104
        Top = 1
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&No'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'IQDialogCheckBox'
      'FRMCONFIRMWITHSECURITY')
    SecurityItems.Strings = (
      'btnYes'
      'CheckBox')
  end
end
