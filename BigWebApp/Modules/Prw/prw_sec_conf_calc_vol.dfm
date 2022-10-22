inherited FrmPRWSecConfCalcVolume: TFrmPRWSecConfCalcVolume
  ExplicitWidth = 426
  ExplicitHeight = 140
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TUniPanel
    inherited Panel4: TUniPanel
      inherited lblConfirmationText: TUniLabel
        Width = 293
        Caption = 'Would you like to recalculate the label total weight && volume?'
        ExplicitWidth = 293
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmPRWSecConfCalcVolume')
    SecurityItems.Strings = (
      'btnYes'
      'btnNo')
    SecurityCode = 'FRMPRWSECCONFCALCVOLUME'
  end
end
