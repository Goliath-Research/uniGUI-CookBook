inherited FrmReceivedPOExcep: TFrmReceivedPOExcep
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    inherited TabSheet1: TUniTabSheet
      inherited Label1: TUniLabel
        Width = 22
        Caption = 'PO#'
        ExplicitWidth = 22
      end
      inherited Label3: TUniLabel
        Width = 23
        Caption = 'Date'
        ExplicitWidth = 23
      end
      inherited DBEdit1: TUniDBEdit
        DataField = 'PONO'
      end
      inherited DBEdit2: TUniDBEdit
        DataField = 'PO_DATE'
      end
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select pono, '
      '       po_date,'
      '       id, '
      '       '#39'Receipts made against this PO'#39' as status_id'
      '  from po'
      ' where id = :id'
      '')
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FRMRECEIVEDPOEXCEP')
    SecurityCode = 'FRMRECEIVEDPOEXCEP'
  end
end
