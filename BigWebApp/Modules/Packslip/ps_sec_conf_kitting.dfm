inherited FrmPS_SecConfirmKitting: TFrmPS_SecConfirmKitting
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TUniPanel
    inherited Panel4: TUniPanel
      inherited lblConfirmationText: TUniLabel
        Width = 335
        Caption = 
          'Items marked Phantom have been assigned, do you wish to continue' +
          '?'
        ExplicitWidth = 335
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    SecurityCode = 'FRMPS_SECCONFIRMKITTING'
  end
end
