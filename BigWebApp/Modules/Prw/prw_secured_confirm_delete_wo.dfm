inherited FrmPRWSecuredConfirmDeleteWO: TFrmPRWSecuredConfirmDeleteWO
  ClientWidth = 519
  OnCreate = FormCreate
  ExplicitWidth = 525
  ExplicitHeight = 140
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Width = 519
    ExplicitWidth = 519
    inherited Bevel1: TUniPanel
      Width = 517
      ExplicitWidth = 517
    end
    inherited btnYes: TUniButton
      Left = 301
      Top = 9
      ExplicitLeft = 301
      ExplicitTop = 9
    end
    inherited btnNo: TUniButton
      Left = 410
      Top = 11
      ExplicitLeft = 410
      ExplicitTop = 11
    end
    inherited btnCancel: TUniButton
      Left = 515
      Visible = False
      ExplicitLeft = 515
    end
  end
  inherited Panel2: TUniPanel
    Width = 519
    ExplicitWidth = 519
    inherited Panel4: TUniPanel
      Width = 465
      ExplicitWidth = 465
      inherited lblConfirmationText: TUniLabel
        Width = 37
        Caption = 'Confirm'
        ExplicitWidth = 37
      end
      inherited Bevel2: TUniPanel
        Width = 463
        ExplicitWidth = 463
      end
      inherited Bevel3: TUniPanel
        Width = 463
        ExplicitWidth = 463
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmPRWSecuredConfirmDeleteWO')
    SecurityCode = 'FRMPRWSECUREDCONFIRMDELETEWO'
  end
end
