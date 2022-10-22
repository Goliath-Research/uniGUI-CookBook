inherited FrmQuote_Labor: TFrmQuote_Labor
  ClientWidth = 520
  Caption = 'Prepare Quote Labor'
  OldCreateOrder = True
  ExplicitWidth = 536
  PixelsPerInch = 96
  TextHeight = 13
  inherited wwDBGrid1: TIQUniGridControl
    Width = 520
    IQComponents.Grid.Width = 303
    IQComponents.HiddenPanel.Left = 303
    IQComponents.FormTab.ExplicitWidth = 512
    Columns = <
      item
        FieldName = 'OPERATOR'
        Title.Caption = 'Operators'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Code'
        Title.Caption = 'Code'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Descrip'
        Title.Caption = 'Descrip'
        Width = 184
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Labor_Rate'
        Title.Caption = 'Labor Rate'
        Width = 76
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end>
    ExplicitWidth = 520
    Marker = 0
  end
  inherited wwQryBom_Labor: TFDQuery
    SQL.Strings = (
      'select b.id,'
      '       cast(0 as number(15)) as standard_id,'
      '       b.quote_id,'
      '       b.emp_level_id,'
      '       b.operator,'
      '       b.last_used_labor_rate'
      '  from quote_labor b'
      ' where quote_id = :id'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 29
    inherited wwQryBom_LaborLabor_Rate: TFloatField
      DisplayLabel = 'Current ~Labor Rate'
    end
    inherited wwQryBom_LaborSTANDARD_ID: TBCDField
      Required = False
    end
    object wwQryBom_LaborLAST_USED_LABOR_RATE: TFMTBCDField
      DisplayLabel = 'Last Used ~Labor Rate'
      DisplayWidth = 10
      FieldName = 'LAST_USED_LABOR_RATE'
      ReadOnly = True
    end
    object wwQryBom_LaborQUOTE_ID: TBCDField
      FieldName = 'QUOTE_ID'
      Visible = False
      Size = 0
    end
  end
  inherited wwQryLookupCode: TFDQuery
    Active = True
  end
  inherited wwQryLookupDescrip: TFDQuery
    Active = True
  end
  inherited UpdateSQL1: TFDUpdateSQL
    InsertSQL.Strings = (
      'insert into quote_labor'
      '  (ID, QUOTE_ID, EMP_LEVEL_ID, OPERATOR)'
      'values'
      '  (:ID, :QUOTE_ID, :EMP_LEVEL_ID, :OPERATOR)')
    ModifySQL.Strings = (
      'update quote_labor'
      'set'
      '  ID = :ID,'
      '  QUOTE_ID = :QUOTE_ID,'
      '  EMP_LEVEL_ID = :EMP_LEVEL_ID,'
      '  OPERATOR = :OPERATOR'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from quote_labor'
      'where'
      '  ID = :OLD_ID')
  end
end
