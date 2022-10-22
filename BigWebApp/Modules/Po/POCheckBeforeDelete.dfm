inherited FrmCheckPoBeforeDelete: TFrmCheckPoBeforeDelete
  ExplicitWidth = 413
  ExplicitHeight = 191
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 399
      ExplicitHeight = 92
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
      'select pono, po_date, '#39'Pending PO Receipts'#39' as status_id'
      '  from po'
      ' where id = :id')
    object Query1PONO: TStringField
      FieldName = 'PONO'
      Size = 35
    end
    object Query1PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object Query1STATUS_ID: TStringField
      FieldName = 'STATUS_ID'
      FixedChar = True
      Size = 19
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FRMCHECKPOBEFOREDELETE')
    SecurityCode = 'FRMCHECKPOBEFOREDELETE'
  end
end
