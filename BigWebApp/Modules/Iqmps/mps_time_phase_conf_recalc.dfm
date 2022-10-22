inherited FrmMPSTimePhaseConfirmRecalc: TFrmMPSTimePhaseConfirmRecalc
  ClientHeight = 115
  ClientWidth = 414
  ExplicitWidth = 430
  ExplicitHeight = 154
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Width = 414
    Height = 77
    ExplicitWidth = 414
    ExplicitHeight = 77
    inherited lblConfBasMsgText: TUniLabel
      Width = 37
      Caption = 'Confirm'
      ExplicitWidth = 37
    end
  end
  inherited Panel2: TUniPanel
    Top = 77
    Width = 414
    ExplicitTop = 77
    ExplicitWidth = 414
    inherited Bevel1: TUniPanel
      Width = 412
      ExplicitWidth = 412
    end
    object Panel3: TUniPanel
      Left = 240
      Top = 6
      Width = 173
      Height = 31
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
        ModalResult = 1
        TabOrder = 1
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
      'FrmMPSTimePhaseConfirmRecalc')
    SecurityCode = 'FRMMPSTIMEPHASECONFIRMRECALC'
    Left = 373
    Top = 3
  end
end
