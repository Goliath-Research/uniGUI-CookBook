object dmModulesAdmin: TdmModulesAdmin
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 200
  Width = 173
  object dsIQModules: TDataSource
    DataSet = IQModules
    Left = 24
    Top = 16
  end
  object IQModules: TFDQuery
    AfterPost = IQDataSetAfterPost
    IndexFieldNames = 'NAME'
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select m.*, m.rowid from IQModule m')
    Left = 104
    Top = 16
    object IQModulesID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      Visible = False
      Precision = 5
      Size = 0
    end
    object IQModulesNAME: TStringField
      DisplayLabel = 'Module'
      FieldName = 'NAME'
      Origin = 'NAME'
      Required = True
      Size = 64
    end
    object IQModulesROWID: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ROWID'
      Origin = '"ROWID"'
      Visible = False
      Size = 23
    end
  end
  object dsIQForms: TDataSource
    DataSet = IQForms
    Left = 24
    Top = 72
  end
  object dsQryForms: TDataSource
    Left = 24
    Top = 128
  end
  object QryForms: TFDQuery
    IndexFieldNames = 'NAME'
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select ID, NAME from IQForm order by NAME')
    Left = 104
    Top = 128
    object QryFormsID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 5
      Size = 0
    end
    object QryFormsNAME: TStringField
      DisplayLabel = 'Form'
      FieldName = 'NAME'
      Origin = 'NAME'
      Required = True
      Size = 64
    end
  end
  object IQForms: TFDQuery
    MasterSource = dsIQModules
    MasterFields = 'ID'
    DetailFields = 'MODULE_ID'
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select'
      '  f.*, '
      '  f.rowid'
      'from '
      '  IQForm f'
      'where'
      '  f.Module_ID = :ID')
    Left = 104
    Top = 72
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Value = 30000c
      end>
    object IQFormsID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Precision = 5
      Size = 0
    end
    object IQFormsNAME: TStringField
      FieldName = 'NAME'
      Origin = 'NAME'
      Required = True
      Size = 64
    end
    object IQFormsPARENT_ID: TBCDField
      FieldName = 'PARENT_ID'
      Origin = 'PARENT_ID'
      Visible = False
      Precision = 5
      Size = 0
    end
    object IQFormsMODULE_ID: TBCDField
      FieldName = 'MODULE_ID'
      Origin = 'MODULE_ID'
      Required = True
      Visible = False
      Precision = 5
      Size = 0
    end
    object IQFormsROWID: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ROWID'
      Origin = '"ROWID"'
      Visible = False
      Size = 23
    end
    object IQFormsSINGLETON: TStringField
      DisplayLabel = 'Singleton'
      FieldName = 'SINGLETON'
      Origin = 'SINGLETON'
      FixedChar = True
      Size = 1
    end
    object IQFormsDATAMODULE_ID: TBCDField
      FieldName = 'DATAMODULE_ID'
      Origin = 'DATAMODULE_ID'
      Visible = False
      Precision = 5
      Size = 0
    end
    object IQFormsDEFAULTDESIGN_ID: TBCDField
      FieldName = 'DEFAULTDESIGN_ID'
      Origin = 'DEFAULTDESIGN_ID'
      Visible = False
      Precision = 5
      Size = 0
    end
    object IQFormsPARENT: TStringField
      FieldKind = fkLookup
      FieldName = 'PARENT'
      LookupDataSet = QryForms
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'PARENT_ID'
      Size = 64
      Lookup = True
    end
  end
end
