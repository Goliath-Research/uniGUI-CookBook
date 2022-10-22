inherited FrmConfCost: TFrmConfCost
  Caption = 'Warning'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TUniPanel
    object Panel3: TUniPanel
      Left = 168
      Top = 5
      Width = 211
      Height = 33
      Align = alRight
      TabOrder = 1
      object BtnYes: TUniButton
        Tag = 1
        Left = 2
        Top = 3
        Width = 97
        Height = 25
        Caption = '&Yes'
        OnClick = BtnYesClick
      end
      object BtnNo: TUniButton
        Left = 106
        Top = 3
        Width = 97
        Height = 25
        Caption = '&No'
        OnClick = BtnYesClick
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmConfCost')
    SecurityItems.Strings = (
      'BtnYes'
      'BtnNo'
      'CheckBox')
    SecurityCode = 'FRMCONFCOST'
  end
end
