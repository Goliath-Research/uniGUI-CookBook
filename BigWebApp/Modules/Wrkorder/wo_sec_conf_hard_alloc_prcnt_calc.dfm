inherited FrmWOSecConfHardAllocPrcntCalc: TFrmWOSecConfHardAllocPrcntCalc
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    inherited btnYes: TUniButton
      Left = 207
      Top = 10
      ExplicitLeft = 207
      ExplicitTop = 10
    end
    inherited btnNo: TUniButton
      Left = 313
      Top = 10
      ExplicitLeft = 313
      ExplicitTop = 10
    end
    inherited btnCancel: TUniButton
      Left = 415
      Top = 10
      Visible = False
      ExplicitLeft = 415
      ExplicitTop = 10
    end
  end
  inherited Panel2: TUniPanel
    inherited Panel4: TUniPanel
      Left = 55
      Width = 364
      inherited lblConfirmationText: TUniLabel
        Top = 18
        Width = 450
        Caption = 
          'Would you like to recalculate the Percent and Parts Per columns ' +
          'based on the Total Allocated?'
        ExplicitWidth = 450
      end
      inherited Bevel2: TUniPanel
        Width = 362
      end
      inherited Bevel3: TUniPanel
        Top = 49
        Width = 362
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmWOSecConfHardAllocPrcntCalc')
    SecurityCode = 'FRMWOSECCONFHARDALLOCPRCNTCALC'
  end
end
