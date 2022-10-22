inherited PMInfo_WorkCenter: TPMInfo_WorkCenter
  ClientHeight = 195
  Caption = 'MRO WorkCenter'
  Constraints.MaxHeight = 234
  Constraints.MinHeight = 234
  ExplicitHeight = 234
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlMain: TUniPanel
    Height = 195
    inherited GroupBox1: TUniGroupBox
      Height = 193
      inherited PnlClient01: TUniPanel
        Height = 176
        inherited Splitter1: TUniSplitter
          Height = 174
          ExplicitHeight = 174
        end
        inherited PnlLeft01: TUniPanel
          Height = 174
          ExplicitHeight = 174
        end
        inherited PnlClient02: TUniPanel
          Height = 174
          inherited Eqno: TUniDBEdit
            Color = clBtnFace
            ReadOnly = True
          end
          inherited DBComboBox1: TUniDBComboBox
            Style = csSimple
            TabStop = False
            Color = clBtnFace
            ReadOnly = True
          end
        end
      end
    end
  end
  inherited PnlButtons: TUniPanel
    Height = 195
    ExplicitHeight = 195
    inherited bbtnNew: TUniBitBtn
      Visible = False
    end
    inherited bbtnPick: TUniBitBtn
      Visible = False
    end
  end
  inherited wwQryLocations: TFDQuery
    Left = 256
  end
  object popmPM: TUniPopupMenu
    Left = 216
    Top = 37
    object JumptoPMEquipment1: TUniMenuItem
      Caption = 'Jump to MRO Equipment'
      OnClick = JumptoPMEquipment1Click
    end
    object PMWorkorderReferences1: TUniMenuItem
      Caption = 'MRO Workorder References'
      OnClick = PMWorkorderReferences1Click
    end
  end
  object IQJumpPM: TIQWebJump
    DataField = 'ID'
    DataSource = SrcPmEqmt
    JumpTo = jtPM
    Left = 216
    Top = 65
  end
end
