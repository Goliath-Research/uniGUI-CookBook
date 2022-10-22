inherited FrmConfInherCalc: TFrmConfInherCalc
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TUniPanel
    object Panel3: TUniPanel
      Left = 166
      Top = 5
      Width = 213
      Height = 33
      Align = alRight
      TabOrder = 1
      DesignSize = (
        213
        33)
      object BtnYes: TUniButton
        Tag = 1
        Left = 7
        Top = 3
        Width = 97
        Height = 25
        Anchors = [akLeft, akTop, akBottom]
        Caption = '&Yes'
        OnClick = BtnYesClick
      end
      object BtnNo: TUniButton
        Left = 111
        Top = 3
        Width = 97
        Height = 25
        Anchors = [akLeft, akTop, akBottom]
        Caption = '&No'
        OnClick = BtnYesClick
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FRMCONFINHERCALC')
    SecurityItems.Strings = (
      'BtnNo'
      'btnYes'
      'CheckBox')
    SecurityCode = 'FRMCONFINHERCALC'
  end
end
