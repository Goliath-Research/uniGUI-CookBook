inherited CheckPoBlanketQty: TCheckPoBlanketQty
  Caption = 'Warning'
  ExplicitWidth = 395
  ExplicitHeight = 205
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TUniPanel
    inherited CheckBox: TUniCheckBox
      TabStop = False
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
        ModalResult = 1
        TabOrder = 1
      end
      object BtnContinue: TUniButton
        Left = 105
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Continue'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'CheckOeBlanketQty')
    SecurityItems.Strings = (
      'BtnContinue'
      'BtnUpdate')
    SecurityCode = 'CHECHPOBLANKETQTY'
  end
end
