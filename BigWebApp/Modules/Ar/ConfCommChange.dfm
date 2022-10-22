inherited FrmConfCommChange: TFrmConfCommChange
  Caption = 'Warning'
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TUniPanel
    object Panel3: TUniPanel
      Left = 272
      Top = 5
      Width = 107
      Height = 33
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        107
        33)
      object BtnYes: TUniButton
        Left = 7
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Ok'
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 1
        OnClick = BtnYesClick
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmConfCommChange')
    SecurityCode = 'FRMCONFCOMMCHANGE'
  end
end
