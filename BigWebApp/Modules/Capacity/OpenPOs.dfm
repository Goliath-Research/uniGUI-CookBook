inherited FrmOpenPOs: TFrmOpenPOs
  Caption = 'Open Purchase Orders'
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBGrid1: TUniDBGrid
    Columns = <
      item
        FieldName = 'PONO'
        Title.Caption = 'PO #'
        Width = 214
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'VENDORNO'
        Title.Caption = 'Vendor #'
        Width = 93
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TOTAL_QTY_ORD'
        Title.Caption = 'Total Ordered'
        Width = 90
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'QTY_RECEIVED'
        Title.Caption = 'Quantity Received'
        Width = 101
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  inherited PnlDetail: TUniPanel
    inherited PnlDetailGrid: TUniPanel
      inherited DBGrid2: TUniDBGrid
        Columns = <
          item
            FieldName = 'SEQ'
            Title.Caption = '#'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'QUAN'
            Title.Caption = 'Quantity'
            Width = 73
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'REQUEST_DATE'
            Title.Caption = 'Request Date'
            Width = 95
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PROMISE_DATE'
            Title.Caption = 'Promise Date'
            Width = 91
            CheckBoxField.FieldValues = 'true;false'
          end>
      end
    end
  end
end
