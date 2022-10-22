inherited OEConfirmLeadDays: TOEConfirmLeadDays
  ClientHeight = 103
  ClientWidth = 456
  ExplicitWidth = 472
  ExplicitHeight = 142
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Width = 456
    Height = 65
    ExplicitWidth = 456
    ExplicitHeight = 65
    inherited lblConfBasMsgText: TUniLabel
      Width = 40
      Caption = 'Warning'
      ExplicitWidth = 40
    end
  end
  inherited Panel2: TUniPanel
    Top = 65
    Width = 456
    ExplicitTop = 65
    ExplicitWidth = 456
    inherited Bevel1: TUniPanel
      Width = 454
      ExplicitWidth = 454
    end
    object Panel3: TUniPanel
      Left = 349
      Top = 5
      Width = 107
      Height = 33
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object btnOK: TUniButton
        Left = 1
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        ModalResult = 1
        TabOrder = 1
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'OEConfirmLeadDays')
    Left = 173
    Top = 67
  end
end
