inherited FrmMCQuotePriceBreaks: TFrmMCQuotePriceBreaks
  ClientWidth = 284
  Caption = 'Price Breaks Currency'
  ExplicitWidth = 300
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TUniPanel
    Width = 284
    ExplicitWidth = 284
    inherited cbCurrency: TUniDBLookupComboBox
      Width = 103
      ExplicitWidth = 103
    end
    inherited nav: TUniDBNavigator
      Left = 184
      ExplicitLeft = 184
    end
  end
  inherited grid: TUniDBGrid
    Width = 284
    Columns = <
      item
        FieldName = 'QUAN'
        Title.Caption = 'Quantity'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'QPRICE'
        Title.Caption = 'Price'
        Width = 165
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  inherited MainMenu1: TUniMainMenu
    Left = 64
    Top = 112
  end
  inherited tblCurrency: TFDTable
    Left = 28
    Top = 114
  end
  inherited Qry: TFDQuery
    SQL.Strings = (
      'select quan,'
      '         Round(qprice * :nFactor, 6) as qprice'
      '  from QOPMAT_QTY_BREAKS'
      ' where 1 = 1'
      ''
      '')
    ParamData = <
      item
        Name = 'nFactor'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryQUAN: TBCDField
      FieldName = 'QUAN'
      Origin = 'QOPMAT_QTY_BREAKS.QUAN'
      Size = 0
    end
    object QryQPRICE: TFMTBCDField
      FieldName = 'QPRICE'
      Origin = 'QOPMAT_QTY_BREAKS.QPRICE'
      DisplayFormat = '###,##0.000000;;'
      Size = 38
    end
  end
end
