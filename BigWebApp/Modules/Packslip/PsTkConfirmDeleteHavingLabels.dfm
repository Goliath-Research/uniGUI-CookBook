inherited FrmPsTkConfirmDeleteHavingLabels: TFrmPsTkConfirmDeleteHavingLabels
  ClientHeight = 194
  ClientWidth = 427
  OldCreateOrder = True
  ExplicitWidth = 443
  ExplicitHeight = 233
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlMain: TUniPanel
    Width = 427
    Height = 153
    ExplicitWidth = 427
    ExplicitHeight = 153
    inherited PnlLeft: TUniPanel
      Height = 151
      ExplicitHeight = 151
    end
    inherited PnlRTF: TUniPanel
      Width = 370
      Height = 151
      ExplicitWidth = 370
      ExplicitHeight = 151
      inherited Bevel1: TUniPanel
        Width = 368
        Height = 18
        ExplicitWidth = 368
        ExplicitHeight = 18
      end
      inherited Label1: TUniLabel
        Top = 48
        ExplicitTop = 48
      end
      inherited Bevel2: TUniPanel
        Width = 368
        ExplicitWidth = 368
      end
      inherited Label2: TUniLabel
        Width = 356
        Caption = 'You are about to delete record with associated/scanned labels.'
        ExplicitWidth = 356
      end
    end
  end
  inherited Panel1: TUniPanel
    Top = 153
    Width = 427
    ExplicitTop = 153
    ExplicitWidth = 427
    inherited PnlModalButtons: TUniPanel
      Left = 213
      ExplicitLeft = 213
    end
  end
  inherited SecurityRegister1: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmPsTkConfirmDeleteHavingLabels')
    SecurityCode = 'FRMPSTKCONFIRMDELETEHAVINGLABELS'
  end
end
