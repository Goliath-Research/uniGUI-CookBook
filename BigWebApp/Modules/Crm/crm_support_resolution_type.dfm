inherited FrmCRMSupportResolutionType: TFrmCRMSupportResolutionType
  Caption = 'CRM Support Resolution Types'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    inherited NavMain: TUniDBNavigator
      DataSource = SrcData
    end
  end
  inherited Panel2: TUniPanel
    inherited Grid: TIQUniGridControl
      IQComponents.Grid.DataSource = SrcData
      IQComponents.Navigator.DataSource = SrcData
      DataSource = SrcData
      Marker = 0
    end
  end
  object SrcData: TDataSource
    DataSet = QryData
    Left = 168
    Top = 112
  end
  object QryData: TFDQuery
    OnNewRecord = QryDataNewRecord
    IndexesActive = False
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.RefreshMode = rmManual
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    UpdateOptions.UpdateTableName = 'CRM_ACTIVITY_RESOLUTION'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = FDUpdateSQL1
    SQL.Strings = (
      'SELECT id,'
      '       name,'
      '       description'
      '  FROM crm_activity_resolution')
    Left = 176
    Top = 120
    object QryDataID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryDataNAME: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 18
      FieldName = 'NAME'
      Origin = 'NAME'
      Size = 35
    end
    object QryDataDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIPTION'
      Origin = 'DESCRIPTION'
      Size = 255
    end
  end
  object FDUpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'INSERT INTO CRM_ACTIVITY_RESOLUTION'
      '(ID, NAME, DESCRIPTION)'
      'VALUES (:NEW_ID, :NEW_NAME, :NEW_DESCRIPTION)')
    ModifySQL.Strings = (
      'UPDATE CRM_ACTIVITY_RESOLUTION'
      'SET NAME = :NEW_NAME, DESCRIPTION = :NEW_DESCRIPTION'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM CRM_ACTIVITY_RESOLUTION'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT ID, NAME, DESCRIPTION'
      'FROM CRM_ACTIVITY_RESOLUTION'
      'WHERE ID = :ID')
    Left = 184
    Top = 128
  end
end
