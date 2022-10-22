inherited FrmSecuredConfirmHideMatchRFQ: TFrmSecuredConfirmHideMatchRFQ
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    inherited btnYes: TUniButton
      Left = 204
      Top = 11
      ExplicitLeft = 204
      ExplicitTop = 11
    end
    inherited btnNo: TUniButton
      Left = 313
      Top = 11
      ExplicitLeft = 313
      ExplicitTop = 11
    end
    inherited btnCancel: TUniButton
      Left = 412
      Visible = False
      ExplicitLeft = 412
    end
  end
  inherited Panel2: TUniPanel
    inherited Panel4: TUniPanel
      Left = 55
      Width = 364
      inherited lblConfirmationText: TUniLabel
        Top = 18
        Width = 221
        Caption = 'Would you like to inactivate Quote Inventory?'
        ExplicitWidth = 221
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
    SecurityCode = 'FRMSECUREDCONFIRMHIDEMATCHRFQ'
  end
end
