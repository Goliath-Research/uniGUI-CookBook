inherited FrmInvClassEx: TFrmInvClassEx
  ClientHeight = 120
  ExplicitWidth = 308
  ExplicitHeight = 149
  DesignSize = (
    302
    120)
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMainInvParams: TUniPanel
    TabOrder = 2
    inherited wwLookupClass: TUniDBLookupComboBox
      Top = 3
      ExplicitTop = 3
    end
  end
  inherited PnlButtons: TUniPanel
    Top = 79
    Height = 41
    ExplicitTop = 79
    ExplicitHeight = 41
    inherited btnOK: TUniButton
      Top = 8
      ExplicitTop = 8
    end
    inherited btnCancel: TUniButton
      Top = 8
      ExplicitTop = 8
    end
  end
  object chkNonMaterial: TUniCheckBox [2]
    Left = 5
    Top = 51
    Width = 288
    Height = 17
    Hint = ''
    ShowHint = True
    ParentShowHint = False
    Caption = 'Non-Material'
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
  end
  inherited SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'wwLookupClass'
      'btnOK'
      'chkNonMaterial')
    Top = 80
  end
end
