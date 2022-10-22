inherited FrmApConfComissions: TFrmApConfComissions
  ExplicitWidth = 320
  ExplicitHeight = 240
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
        TabOrder = 1
        OnClick = BtnYesClick
      end
      object BtnNo: TUniButton
        Left = 105
        Top = 1
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&No'
        TabOrder = 2
        OnClick = BtnYesClick
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmApConfComissions')
    SecurityItems.Strings = (
      'BtnYes'
      'BtnNo'
      'CheckBox')
    SecurityCode = 'FRMAPCONFCOMISSIONS'
  end
end
