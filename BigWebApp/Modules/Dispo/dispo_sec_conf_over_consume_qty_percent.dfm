inherited FrmDispoSecuredConfirmOverConsumeQtyPercent: TFrmDispoSecuredConfirmOverConsumeQtyPercent
  ClientHeight = 138
  Caption = 'Warning'
  OnCreate = FormCreate
  ExplicitHeight = 167
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Top = 94
    ExplicitTop = 94
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
    Height = 94
    ExplicitHeight = 94
    inherited Panel3: TUniPanel
      Height = 92
      ExplicitHeight = 92
    end
    inherited Panel4: TUniPanel
      Height = 92
      ExplicitHeight = 92
      inherited lblConfirmationText: TUniLabel
        Width = 37
        Caption = 'Confirm'
        ExplicitWidth = 37
      end
      inherited Bevel3: TUniPanel
        Top = 77
        ExplicitTop = 77
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmSecuredConfirmDispoConsumeQtyPercent')
    SecurityCode = 'FRMSECCONFDISPOCONSQTYPRCNT'
  end
end
