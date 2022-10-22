object dmDataSetAdmin: TdmDataSetAdmin
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 86
  Width = 184
  object dsIQDataSets: TDataSource
    DataSet = IQDataSets
    Left = 24
    Top = 16
  end
  object IQDataSets: TFDQuery
    AfterPost = IQDataSetsAfterPost
    AfterScroll = IQDataSetsAfterScroll
    IndexFieldNames = 'NAME'
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select ds.*, ds.rowid from IQDataSet ds')
    Left = 104
    Top = 16
    object IQDataSetsID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Precision = 5
      Size = 0
    end
    object IQDataSetsNAME: TStringField
      FieldName = 'NAME'
      Origin = 'NAME'
      Required = True
      Size = 64
    end
    object IQDataSetsKEYFIELD_ID: TBCDField
      FieldName = 'KEYFIELD_ID'
      Origin = 'KEYFIELD_ID'
      Precision = 5
      Size = 0
    end
    object IQDataSetsMASTERDATASET_ID: TBCDField
      FieldName = 'MASTERDATASET_ID'
      Origin = 'MASTERDATASET_ID'
      Precision = 5
      Size = 0
    end
    object IQDataSetsDETAILFIELD_ID: TBCDField
      FieldName = 'DETAILFIELD_ID'
      Origin = 'DETAILFIELD_ID'
      Precision = 5
      Size = 0
    end
    object IQDataSetsTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Origin = 'TABLENAME'
      Size = 64
    end
    object IQDataSetsSQLQUERY: TStringField
      FieldName = 'SQLQUERY'
      Origin = 'SQLQUERY'
      Size = 2000
    end
    object IQDataSetsDATAMODULE_ID: TBCDField
      FieldName = 'DATAMODULE_ID'
      Origin = 'DATAMODULE_ID'
      Required = True
      Precision = 5
      Size = 0
    end
    object IQDataSetsROWID: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ROWID'
      Origin = '"ROWID"'
      Size = 23
    end
  end
end
