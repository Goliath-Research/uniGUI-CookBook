inherited FrmOEConfirmSameP0: TFrmOEConfirmSameP0
  ClientHeight = 93
  ClientWidth = 437
  ExplicitWidth = 453
  ExplicitHeight = 132
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Width = 437
    Height = 55
    ExplicitWidth = 437
    ExplicitHeight = 55
    inherited lblConfBasMsgText: TUniLabel
      Width = 91
      Caption = 'lblConfBasMsgText'
      ExplicitWidth = 91
    end
  end
  inherited Panel2: TUniPanel
    Top = 55
    Width = 437
    ExplicitTop = 55
    ExplicitWidth = 437
    inherited Bevel1: TUniPanel
      Width = 435
      ExplicitWidth = 435
    end
    object Panel3: TUniPanel
      Left = 264
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
    SecurityItems.Strings = (
      'btnYes'
      'CheckBox')
    SecurityCode = 'FRMOECONFIRMSAMEP0'
    Left = 181
    Top = 51
  end
end
