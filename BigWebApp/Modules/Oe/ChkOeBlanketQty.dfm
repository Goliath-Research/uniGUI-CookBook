inherited CheckOeBlanketQty: TCheckOeBlanketQty
  Caption = 'Warning'
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TUniPanel
    inherited CheckBox: TUniCheckBox
      Visible = False
    end
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
      object BtnUpdate: TUniButton
        Tag = 1
        Left = 2
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Update'
        TabOrder = 1
        OnClick = BtnUpdateClick
      end
      object BtnContinue: TUniButton
        Left = 105
        Top = 1
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Continue'
        TabOrder = 2
        OnClick = BtnUpdateClick
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'CheckOeBlanketQty')
    SecurityItems.Strings = (
      'BtnContinue'
      'BtnUpdate')
    SecurityCode = 'CHECHOEBLANKETQTY'
  end
end
