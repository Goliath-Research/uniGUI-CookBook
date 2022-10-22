inherited FrmPMConf: TFrmPMConf
  Left = 286
  Top = 232
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    object lblPrompt: TUniLabel
      Left = 1
      Top = 13
      Width = 44
      Height = 13
      Hint = ''
      Caption = 'lblPrompt'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
    end
  end
  inherited Panel2: TUniPanel
    object PnlButtonsRight: TUniPanel
      Left = 171
      Top = 5
      Width = 208
      Height = 33
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object btnYes: TUniBitBtn
        Left = 1
        Top = 1
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Yes'
        ModalResult = 1
        TabOrder = 0
      end
      object btnNo: TUniBitBtn
        Left = 104
        Top = 1
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&No'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'PMCONF'
      'FrmPMConf')
    SecurityItems.Strings = (
      'btnYes'
      'CheckBox')
    SecurityCode = 'PMCONF'
  end
end
