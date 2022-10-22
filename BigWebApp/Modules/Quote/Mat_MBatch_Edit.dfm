inherited MatMBatchEdit: TMatMBatchEdit
  Caption = 'Modify Material'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TUniPanel
    inherited PnlLeft: TUniPanel
      inherited Label6: TUniLabel
        Width = 67
        Caption = 'Batch Percent'
        ExplicitWidth = 67
      end
    end
    inherited PnlClient: TUniPanel
      inherited dbePtsPer: TUniDBEdit
        DataField = 'MBATCH_PERCENT'
      end
      inherited dbeSPG: TUniDBEdit
        TabOrder = 9
      end
      inherited dbeGauge: TUniDBEdit
        TabOrder = 10
      end
    end
  end
end
