inherited FrmPrintConf: TFrmPrintConf
  Caption = 'Warning'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TUniPanel
    object Panel3: TUniPanel
      Left = 166
      Top = 5
      Width = 213
      Height = 33
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        213
        33)
      object BtnYes: TUniButton
        Left = 7
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Yes'
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 1
        OnClick = BtnYesClick
      end
      object BtnNo: TUniButton
        Tag = 1
        Left = 111
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&No'
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 2
        OnClick = BtnYesClick
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FRMPRINTCONF')
    SecurityItems.Strings = (
      'BtnNo'
      'btnYes'
      'CheckBox')
    SecurityCode = 'FRMPRINTCONF'
  end
end
