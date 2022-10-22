inherited FrmTranAdjQtyOut: TFrmTranAdjQtyOut
  ClientHeight = 171
  OnShow = UniFormShow
  Constraints.MinHeight = 209
  OldCreateOrder = True
  ExplicitHeight = 210
  PixelsPerInch = 96
  TextHeight = 13
  inherited Label2: TUniLabel
    TabOrder = 7
  end
  inherited Bevel1: TUniPanel
    Top = 130
    TabOrder = 8
    ExplicitTop = 130
  end
  inherited Label6: TUniLabel
    TabOrder = 10
  end
  inherited lblReason: TUniLabel
    TabOrder = 6
  end
  inherited btkOK: TUniButton
    Top = 142
    TabOrder = 4
    ExplicitTop = 142
  end
  inherited btnCancel: TUniButton
    Top = 142
    TabOrder = 5
    ExplicitTop = 142
  end
  inherited edReason: TUniComboBox
    TabOrder = 9
  end
  object chkScrap: TUniCheckBox [11]
    Left = 110
    Top = 111
    Width = 97
    Height = 17
    Hint = ''
    Caption = 'Scrap'
    TabOrder = 11
  end
  inherited wwQryTransCode: TFDQuery
    Left = 25
  end
end
