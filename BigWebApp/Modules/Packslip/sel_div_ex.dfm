inherited FrmSelectDivisionExtended: TFrmSelectDivisionExtended
  ClientHeight = 172
  ExplicitHeight = 201
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TUniPanel
    Height = 122
    ExplicitHeight = 122
  end
  inherited wwDBLookupCombo1: TUniDBLookupComboBox
    Top = 95
    ListField = 'NAME'
    ExplicitTop = 95
  end
  inherited btnOK: TUniButton
    Left = 84
    Top = 138
    ExplicitLeft = 84
    ExplicitTop = 138
  end
  inherited btnCancel: TUniButton
    Top = 138
    TabOrder = 6
    ExplicitTop = 138
  end
  inherited rbtnOneDiv: TUniRadioButton
    Top = 73
    TabOrder = 5
    ExplicitTop = 73
  end
  object rbtnNoDiv: TUniRadioButton [6]
    Left = 15
    Top = 45
    Width = 126
    Height = 17
    Hint = ''
    Caption = 'No Division Assigned'
    TabOrder = 4
    OnClick = rbtnAllDivClick
  end
  inherited wwQryDivision: TFDQuery
    Active = True
  end
end
