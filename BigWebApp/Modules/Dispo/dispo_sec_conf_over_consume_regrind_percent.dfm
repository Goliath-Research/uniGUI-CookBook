inherited FrmDispoSecuredConfirmOverConsumeRegrindPercent: TFrmDispoSecuredConfirmOverConsumeRegrindPercent
  Caption = 'Warning'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    inherited btnYes: TUniButton
      Left = 205
      Top = 10
      ExplicitLeft = 205
      ExplicitTop = 10
    end
    inherited btnNo: TUniButton
      Left = 309
      Top = 10
      ExplicitLeft = 309
      ExplicitTop = 10
    end
    inherited btnCancel: TUniButton
      Left = 413
      Top = 10
      Visible = False
      ExplicitLeft = 413
      ExplicitTop = 10
    end
  end
  inherited Panel2: TUniPanel
    inherited Panel4: TUniPanel
      inherited lblConfirmationText: TUniLabel
        Width = 37
        Caption = 'Confirm'
        ExplicitWidth = 37
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmDispoSecuredConfirmOverConsumeRegrindPercent')
    SecurityCode = 'FRMDISPOSECCONFOVERCONSUMEREGPRCNT'
  end
end
