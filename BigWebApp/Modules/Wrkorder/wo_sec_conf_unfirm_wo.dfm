inherited FrmSecuredConfirmUnfirmWO: TFrmSecuredConfirmUnfirmWO
  ClientHeight = 149
  ClientWidth = 431
  OnCreate = FormCreate
  ExplicitWidth = 437
  ExplicitHeight = 178
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Top = 105
    Width = 431
    ExplicitTop = 105
    ExplicitWidth = 431
    inherited Bevel1: TUniPanel
      Width = 429
      ExplicitWidth = 429
    end
    inherited btnYes: TUniButton
      Left = 214
      ExplicitLeft = 214
    end
    inherited btnNo: TUniButton
      Left = 321
      ExplicitLeft = 321
    end
    inherited btnCancel: TUniButton
      Left = 425
      Visible = False
      ExplicitLeft = 425
    end
  end
  inherited Panel2: TUniPanel
    Width = 431
    Height = 105
    ExplicitWidth = 431
    ExplicitHeight = 105
    inherited Panel3: TUniPanel
      Height = 103
      ExplicitHeight = 103
    end
    inherited Panel4: TUniPanel
      Left = 55
      Width = 375
      Height = 103
      ExplicitWidth = 375
      ExplicitHeight = 103
      inherited lblConfirmationText: TUniLabel
        Top = 18
        Width = 831
        Height = 39
        Caption = 
          'Unfirming this Work Order will transform it into a Manual Work O' +
          'rder which must then be manually deleted from the system. Demand' +
          ' is NOT allocated to Manual Work Orders.'#13#13'Are you sure you want ' +
          'to continue?'
        ExplicitWidth = 831
        ExplicitHeight = 39
      end
      inherited Bevel2: TUniPanel
        Width = 373
        ExplicitWidth = 373
      end
      inherited Bevel3: TUniPanel
        Top = 87
        Width = 373
        ExplicitTop = 87
        ExplicitWidth = 373
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    SecurityCode = 'FRMSECUREDCONFIRMUNFIRMWO'
  end
end
