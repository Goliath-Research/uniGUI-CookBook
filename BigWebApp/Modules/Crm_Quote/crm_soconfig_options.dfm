inherited FrmSalesConfigOptions: TFrmSalesConfigOptions
  ClientHeight = 346
  ClientWidth = 415
  Caption = 'Sales Configuration Groups'
  ExplicitWidth = 431
  ExplicitHeight = 385
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TUniPanel
    Width = 415
    TabOrder = 3
    ExplicitWidth = 415
  end
  inherited Panel1: TUniPanel
    Width = 415
    ExplicitWidth = 415
    inherited NavMain: TUniDBNavigator
      Left = 190
      DataSource = SrcSalesOption
      ExplicitLeft = 190
    end
  end
  inherited Panel2: TUniPanel
    Width = 415
    Height = 316
    ExplicitWidth = 415
    ExplicitHeight = 316
    inherited Grid: TIQUniGridControl
      Width = 413
      Height = 314
      IQComponents.Grid.Width = 196
      IQComponents.Grid.Height = 228
      IQComponents.Grid.DataSource = SrcSalesOption
      IQComponents.Navigator.DataSource = SrcSalesOption
      IQComponents.HiddenPanel.Left = 196
      IQComponents.HiddenPanel.Height = 228
      DataSource = SrcSalesOption
      ExplicitWidth = 413
      ExplicitHeight = 314
      Marker = 0
      object wwDBComboDlgAttributes: TUniEdit
        Left = 96
        Top = 88
        Width = 121
        Height = 21
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 2
        ReadOnly = True
      end
    end
  end
  object cmbGridKind: TUniDBComboBox
    Left = 96
    Top = 144
    Width = 121
    Height = 21
    Hint = ''
    Style = csDropDownList
    Items.Strings = (
      'Default'#9'DEFAULT'
      'Primary Material'#9'PRIMARY MATERIAL'
      'Component'#9'COMPONENT'
      'Packaging'#9'PACKAGING')
    TabOrder = 2
  end
  object SrcSalesOption: TDataSource
    DataSet = QrySalesOption
    Left = 36
    Top = 110
  end
  object QrySalesOption: TFDQuery
    OnCalcFields = QrySalesOptionCalcFields
    OnNewRecord = QrySalesOptionNewRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.UpdateTableName = 'SALES_OPTION'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = FDUpdateSQL1
    SQL.Strings = (
      'SELECT id, descrip, kind'
      '  FROM sales_option')
    Left = 36
    Top = 140
    object QrySalesOptionDESCRIP: TStringField
      DisplayLabel = 'Sales Option'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'descrip'
      Size = 60
    end
    object QrySalesOptionID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Size = 0
    end
    object QrySalesOptionAttributes: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Attributes'
      Calculated = True
    end
    object QrySalesOptionKIND: TStringField
      DisplayLabel = 'Type'
      FieldName = 'KIND'
    end
  end
  object FDUpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'INSERT INTO SALES_OPTION'
      '(ID, DESCRIP, KIND)'
      'VALUES (:NEW_ID, :NEW_DESCRIP, :NEW_KIND)')
    ModifySQL.Strings = (
      'UPDATE SALES_OPTION'
      'SET ID = :NEW_ID, DESCRIP = :NEW_DESCRIP, KIND = :NEW_KIND'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM SALES_OPTION'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT ID, DESCRIP, KIND'
      'FROM SALES_OPTION'
      'WHERE ID = :ID')
    Left = 40
    Top = 176
  end
end
