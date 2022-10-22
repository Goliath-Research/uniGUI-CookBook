inherited FrmSecuredConfirmClosePO: TFrmSecuredConfirmClosePO
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    inherited btnYes: TUniButton
      Left = 205
      ExplicitLeft = 205
    end
    inherited btnNo: TUniButton
      Left = 309
      ExplicitLeft = 309
    end
    inherited btnCancel: TUniButton
      Left = 414
      Visible = False
      ExplicitLeft = 414
    end
  end
  inherited Panel2: TUniPanel
    inherited Panel4: TUniPanel
      inherited lblConfirmationText: TUniLabel
        Width = 143
        Caption = 'Close all line items on this PO?'
        ExplicitWidth = 143
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    SecurityCode = 'FRMSECUREDCONFIRM_CLOSE_PO'
  end
end
