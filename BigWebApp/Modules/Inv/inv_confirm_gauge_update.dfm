inherited FrmInvConfirmGaugeUpdate: TFrmInvConfirmGaugeUpdate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    inherited lblConfBasMsgText: TUniLabel
      Width = 61
      Caption = 'Confirmation'
      ExplicitWidth = 61
    end
  end
  inherited Panel2: TUniPanel
    object Panel3: TUniPanel
      Left = 174
      Top = 5
      Width = 205
      Height = 33
      Align = alRight
      TabOrder = 1
      object btnYes: TUniButton
        Tag = 1
        Left = 2
        Top = 3
        Width = 90
        Height = 25
        Caption = '&Yes'
        OnClick = btnYesClick
      end
      object btnNo: TUniButton
        Left = 106
        Top = 3
        Width = 90
        Height = 25
        Caption = 'No'
        Default = True
        ModalResult = 2
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    SecurityCode = 'FRMINVCONFIRMGAUGEUPDATE'
  end
end
