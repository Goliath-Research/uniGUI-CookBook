inherited FrmSecuredConfirmSchedRunHold: TFrmSecuredConfirmSchedRunHold
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    inherited btnYes: TUniButton
      Left = 204
      Top = 9
      ExplicitLeft = 204
      ExplicitTop = 9
    end
    inherited btnNo: TUniButton
      Left = 308
      Top = 9
      ExplicitLeft = 308
      ExplicitTop = 9
    end
    inherited btnCancel: TUniButton
      Left = 412
      Top = 9
      Visible = False
      ExplicitLeft = 412
      ExplicitTop = 9
    end
  end
  inherited Panel2: TUniPanel
    inherited Panel4: TUniPanel
      inherited lblConfirmationText: TUniLabel
        Width = 290
        Caption = 'This Work Order is on a Run Hold - do you want to continue?'
        ExplicitWidth = 290
      end
    end
  end
  inherited SR: TSecurityRegister
    Left = 28
    Top = 50
  end
end
