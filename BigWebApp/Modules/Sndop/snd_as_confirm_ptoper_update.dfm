inherited FrmSndAssy1ConfirmPtoperUpdate: TFrmSndAssy1ConfirmPtoperUpdate
  ClientHeight = 112
  ExplicitWidth = 395
  ExplicitHeight = 151
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Height = 74
    ExplicitHeight = 74
    inherited lblConfBasMsgText: TUniLabel
      Width = 89
      Caption = 'lblConfirmMessage'
      ExplicitWidth = 89
    end
  end
  inherited Panel2: TUniPanel
    Top = 74
    ExplicitTop = 74
    object Panel3: TUniPanel
      Left = 173
      Top = 6
      Width = 205
      Height = 31
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object btnYes: TUniButton
        Tag = 1
        Left = 2
        Top = 3
        Width = 90
        Height = 25
        Hint = ''
        Caption = '&Yes'
        ModalResult = 1
        TabOrder = 1
      end
      object btnNo: TUniButton
        Left = 106
        Top = 3
        Width = 90
        Height = 25
        Hint = ''
        Caption = 'No'
        ModalResult = 2
        TabOrder = 2
        Default = True
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'btnYes'
      'CheckBox')
    Left = 345
    Top = 9
  end
end
