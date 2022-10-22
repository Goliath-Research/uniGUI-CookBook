inherited FrmSecuredConfirmTransQtyZero: TFrmSecuredConfirmTransQtyZero
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    inherited btnYes: TUniButton
      Left = 207
      ExplicitLeft = 207
    end
    inherited btnNo: TUniButton
      Left = 311
      ExplicitLeft = 311
    end
    inherited btnCancel: TUniButton
      Left = 415
      Visible = False
      ExplicitLeft = 415
    end
  end
  inherited Panel2: TUniPanel
    inherited Panel4: TUniPanel
      inherited lblConfirmationText: TUniLabel
        Width = 337
        Caption = 
          'Transaction Quantity is Zero. Are you sure you would like to con' +
          'tinue?'
        ExplicitWidth = 337
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    SecurityCode = 'FRMSECUREDCONFIRMTRANSQTYZERO'
  end
end
