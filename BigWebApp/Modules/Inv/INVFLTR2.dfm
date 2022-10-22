inherited FrmInvClassFilter2: TFrmInvClassFilter2
  ClientHeight = 283
  Caption = 'Inventory Filter Box'
  ExplicitHeight = 312
  DesignSize = (
    295
    283)
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMainInvParams: TUniPanel
    Top = 5
    Height = 161
    ExplicitTop = 5
    ExplicitHeight = 161
    inherited Label1: TUniLabel
      Top = 11
      ExplicitTop = 11
    end
    inherited wwLookupClass: TUniDBLookupComboBox
      Top = 31
      ExplicitTop = 31
    end
    inherited rbtnAllItems: TUniRadioButton
      Top = 127
      TabOrder = 5
      ExplicitTop = 127
    end
    inherited rbtnClass: TUniRadioButton
      Top = 9
      Checked = False
      TabStop = False
      ExplicitTop = 9
    end
    inherited rbtnManu: TUniRadioButton
      Top = 79
      TabOrder = 3
      ExplicitTop = 79
    end
    inherited rbtnPurch: TUniRadioButton
      Top = 103
      TabOrder = 4
      ExplicitTop = 103
    end
    object rbtnThisItem: TUniRadioButton
      Left = 15
      Top = 55
      Width = 265
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'This Item'
      TabOrder = 2
    end
  end
  inherited PnlButtons: TUniPanel
    Top = 237
    TabOrder = 0
    ExplicitTop = 237
  end
  inherited GroupBox1: TUniGroupBox
    Top = 167
    TabOrder = 1
    ExplicitTop = 167
    inherited PnlClient02: TUniPanel
      inherited PnlClient01: TUniPanel
        inherited wwLookupDivision: TUniDBLookupComboBox
          Enabled = False
          Color = clBtnFace
        end
        inherited wwLookupBuyerCode: TUniDBLookupComboBox
          Enabled = False
          Color = clBtnFace
        end
      end
    end
  end
end
