inherited FrmOEConfirmReleaseDateInPast: TFrmOEConfirmReleaseDateInPast
  ClientHeight = 137
  ClientWidth = 426
  OnCreate = UniFormCreate
  ExplicitWidth = 442
  ExplicitHeight = 176
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Width = 426
    Height = 99
    ExplicitWidth = 426
    ExplicitHeight = 99
    inherited lblConfBasMsgText: TUniLabel
      Width = 37
      Caption = 'Confirm'
      ExplicitWidth = 37
    end
  end
  inherited Panel2: TUniPanel
    Top = 99
    Width = 426
    ExplicitTop = 99
    ExplicitWidth = 426
    inherited Bevel1: TUniPanel
      Width = 424
      ExplicitWidth = 424
    end
    object Panel3: TUniPanel
      Left = 253
      Top = 5
      Width = 173
      Height = 33
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object btnYes: TUniButton
        Tag = 1
        Left = 7
        Top = 3
        Width = 75
        Height = 25
        Hint = ''
        Caption = '&Yes'
        TabOrder = 1
        OnClick = btnYesClick
      end
      object btnAbort: TUniButton
        Left = 91
        Top = 3
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'No'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmOEConfirmReleaseDateInPast')
    SecurityItems.Strings = (
      'btnYes')
    SecurityCode = 'FRMOECONFIRMRELEASEDATEINPAST'
  end
end
