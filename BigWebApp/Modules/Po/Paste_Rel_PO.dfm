inherited FrmPasteReleases_PO: TFrmPasteReleases_PO
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBGrid1: TUniDBGrid
    Columns = <
      item
        FieldName = 'QUAN'
        Title.Caption = 'Quantity'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PROMISE_DATE'
        Title.Caption = 'Promise Date'
        Width = 104
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REQUEST_DATE'
        Title.Caption = 'Request Date'
        Width = 100
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select promise_date,'
      '       quan,'
      '       request_date'
      '  from po_releases'
      ' where po_detail_id = :detail_id'
      'order by promise_date'
      ' ')
  end
end
