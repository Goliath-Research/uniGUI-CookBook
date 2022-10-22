inherited FrmQ_Batch_Compare: TFrmQ_Batch_Compare
  HelpContext = 1255407
  Caption = 'RFQ Comparison'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlAvail: TUniPanel
    inherited IQSearch1: TIQUniGridControl
      Columns = <
        item
          FieldName = 'RFQ'
          Title.Caption = 'RFQ #'
          Width = 140
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'QUOTE_REV'
          Title.Caption = 'Rev'
          Width = 46
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  inherited pnlSelected: TUniPanel
    inherited wwDBGridSelected: TIQUniGridControl
      Columns = <
        item
          FieldName = 'RFQ'
          Title.Caption = 'RFQ #'
          Width = 251
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  inherited UpdateSQLQuoteBatchDetail: TFDUpdateSQL
    Top = 158
  end
  inherited UpdateSQLQuoteBatch: TFDUpdateSQL
    Left = 85
    Top = 157
  end
  inherited IQAbout1: TIQWebAbout
    ModuleName = 'RFQ Comparison'
  end
end
