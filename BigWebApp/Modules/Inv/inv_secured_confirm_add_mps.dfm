inherited FrmSecuredConfirmAddMPS: TFrmSecuredConfirmAddMPS
  ExplicitWidth = 426
  ExplicitHeight = 140
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TUniPanel
    inherited Panel4: TUniPanel
      inherited lblConfirmationText: TUniLabel
        Width = 166
        Caption = 'Add item to MPS Time Phase Data?'
        ExplicitWidth = 166
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmSecuredConfirmAddMPS')
    SecurityItems.Strings = (
      'btnYes'
      'btnNo')
    SecurityCode = 'FRMSECUREDCONFIRMADDMPS'
  end
end
