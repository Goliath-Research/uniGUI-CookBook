inherited FrmIQLMChkBoxQty: TFrmIQLMChkBoxQty
  ClientHeight = 102
  ClientWidth = 472
  ExplicitWidth = 488
  ExplicitHeight = 141
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Width = 472
    Height = 64
    ExplicitWidth = 472
    ExplicitHeight = 64
    inherited lblConfBasMsgText: TUniLabel
      Width = 42
      Caption = 'Message'
      ExplicitWidth = 42
    end
  end
  inherited Panel2: TUniPanel
    Top = 64
    Width = 472
    ExplicitTop = 64
    ExplicitWidth = 472
    inherited Bevel1: TUniPanel
      Width = 470
      ExplicitWidth = 470
    end
    object pnlButtons: TUniPanel
      Left = 260
      Top = 6
      Width = 211
      Height = 31
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object btnContinue: TUniButton
        Tag = 1
        Left = 2
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'C&ontinue'
        ModalResult = 1
        TabOrder = 1
      end
      object btnCancel: TUniButton
        Left = 106
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'btnContinue'
      'CheckBox')
    SecurityCode = 'FRMIQLMCHKBOXQTY'
    Top = 59
  end
end
