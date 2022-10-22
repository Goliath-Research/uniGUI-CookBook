inherited FrmConfPOChange: TFrmConfPOChange
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TUniPanel
    object Panel3: TUniPanel
      Left = 150
      Top = 5
      Width = 229
      Height = 33
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object btnYes: TUniButton
        Tag = 1
        Left = 16
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Yes'
        TabOrder = 1
        OnClick = btnYesClick
      end
      object btnAbort: TUniButton
        Left = 119
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'No'
        ModalResult = 2
        TabOrder = 2
        OnClick = btnYesClick
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmConfPOChange')
    SecurityItems.Strings = (
      'btnYes'
      'CheckBox')
    SecurityCode = 'FRMCONFPOCHANGE'
  end
end
