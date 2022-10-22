inherited FrmCheckMrb: TFrmCheckMrb
  ExplicitWidth = 395
  ExplicitHeight = 205
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TUniPanel
    object Panel3: TUniPanel
      Left = 168
      Top = 5
      Width = 211
      Height = 33
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object BtnYes: TUniButton
        Tag = 1
        Left = 2
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Yes'
        ModalResult = 1
        TabOrder = 1
      end
      object BtnNo: TUniButton
        Left = 106
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&No'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmCheckMrb')
    SecurityItems.Strings = (
      'BtnYes'
      'BtnNo')
    SecurityCode = 'FRMCHECKMRB'
  end
end
