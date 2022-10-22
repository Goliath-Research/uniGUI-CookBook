inherited FrmSecuredConfirmWoFinished: TFrmSecuredConfirmWoFinished
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    inherited btnYes: TUniButton
      Left = 202
      Top = 10
      Caption = 'Continue'
      ExplicitLeft = 202
      ExplicitTop = 10
    end
    inherited btnNo: TUniButton
      Left = 311
      Top = 10
      Caption = 'Cancel'
      ExplicitLeft = 311
      ExplicitTop = 10
    end
    inherited btnCancel: TUniButton
      Left = 410
      Top = 10
      Visible = False
      ExplicitLeft = 410
      ExplicitTop = 10
    end
  end
  inherited Panel2: TUniPanel
    inherited Panel4: TUniPanel
      inherited lblConfirmationText: TUniLabel
        Width = 195
        Caption = 'This Work Order has production required'
        ExplicitWidth = 195
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmSecuredConfirmWoFinished')
    SecurityCode = 'FRMSECUREDCONFIRMWOFINISHED'
  end
end
