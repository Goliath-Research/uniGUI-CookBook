inherited FrmRMAReworkException: TFrmRMAReworkException
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    inherited TabSheet1: TUniTabSheet
      inherited Label1: TUniLabel
        Width = 30
        Caption = 'RMA#'
        ExplicitWidth = 30
      end
      inherited Label3: TUniLabel
        Width = 48
        Caption = 'RMA Date'
        ExplicitWidth = 48
      end
      inherited DBEdit1: TUniDBEdit
        Left = 64
        Width = 225
        DataField = 'RMANO'
        ExplicitLeft = 64
        ExplicitWidth = 225
      end
      inherited DBEdit2: TUniDBEdit
        Left = 64
        Width = 225
        DataField = 'RMA_DATE'
        ExplicitLeft = 64
        ExplicitWidth = 225
      end
      inherited DBEdit3: TUniDBEdit
        Left = 64
        Width = 225
        ExplicitLeft = 64
        ExplicitWidth = 225
      end
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select rma.rmano,'
      '       rma.rma_date,'
      '       '#39'Mfg Rework Order'#39' as status_id'
      '  from rma_detail d, rma'
      ' where d.rework_workorder_id = :id'
      '   and d.rma_id = rma.id'
      '')
  end
end
