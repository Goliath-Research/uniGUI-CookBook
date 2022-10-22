object IQCore_DM: TIQCore_DM
  OldCreateOrder = False
  Height = 532
  Width = 407
  object MainMenu1: TMainMenu
    Left = 16
    Top = 16
  end
  object IQPickTreeNode: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.UpdateTableName = 'IQPickTreeNode'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'IQPickTreeNode'
    Left = 168
    Top = 256
    object IQPickTreeNodeID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Precision = 5
      Size = 0
    end
    object IQPickTreeNodeTEXT: TStringField
      FieldName = 'TEXT'
      Origin = 'TEXT'
      Required = True
      Size = 64
    end
    object IQPickTreeNodeSEQ: TBCDField
      FieldName = 'SEQ'
      Origin = 'SEQ'
      Precision = 2
      Size = 0
    end
    object IQPickTreeNodePARENT_ID: TBCDField
      FieldName = 'PARENT_ID'
      Origin = 'PARENT_ID'
      Precision = 5
      Size = 0
    end
  end
  object QryPickTreeNodes: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.KeyFields = 'ID'
    SQL.Strings = (
      'select ID, Text, level'
      'from IQPickTreeNode'
      'connect by prior id = Parent_ID'
      'start with id = :RootNode_ID'
      'order siblings by Seq, Text')
    Left = 256
    Top = 256
    ParamData = <
      item
        Name = 'ROOTNODE_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object QryPickTreeNodesID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 5
      Size = 0
    end
    object QryPickTreeNodesTEXT: TStringField
      FieldName = 'TEXT'
      Origin = 'TEXT'
      Required = True
      Size = 64
    end
    object QryPickTreeNodesLEVEL: TFMTBCDField
      FieldName = 'LEVEL'
      Origin = '"LEVEL"'
      Precision = 38
      Size = 38
    end
  end
  object IQPickTree: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'IQPickTree'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'IQPickTree'
    Left = 96
    Top = 256
    object IQPickTreeID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Precision = 5
      Size = 0
    end
    object IQPickTreeNAME: TStringField
      FieldName = 'NAME'
      Origin = 'NAME'
      Required = True
      Size = 64
    end
    object IQPickTreeLEVELS: TBCDField
      FieldName = 'LEVELS'
      Origin = 'LEVELS'
      Precision = 3
      Size = 0
    end
    object IQPickTreePICKTREENODE_ID: TBCDField
      FieldName = 'PICKTREENODE_ID'
      Origin = 'PICKTREENODE_ID'
      Precision = 5
      Size = 0
    end
  end
  object IQField: TFDTable
    IndexFieldNames = 'DATASET_ID'
    MasterSource = dsIQDataSet
    MasterFields = 'ID'
    DetailFields = 'DATASET_ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'IQField'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'IQField'
    Left = 264
    Top = 136
    object IQFieldID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 5
      Size = 0
    end
    object IQFieldNAME: TStringField
      FieldName = 'NAME'
      Origin = 'NAME'
      Required = True
      Size = 64
    end
    object IQFieldDISPLAYLABEL: TStringField
      FieldName = 'DISPLAYLABEL'
      Origin = 'DISPLAYLABEL'
      Size = 64
    end
    object IQFieldDISPLAYWIDTH: TBCDField
      FieldName = 'DISPLAYWIDTH'
      Origin = 'DISPLAYWIDTH'
      Precision = 5
      Size = 0
    end
    object IQFieldFIELDSIZE: TBCDField
      FieldName = 'FIELDSIZE'
      Origin = 'FIELDSIZE'
      Precision = 5
      Size = 0
    end
    object IQFieldPRECISION: TBCDField
      FieldName = 'PRECISION'
      Origin = '"PRECISION"'
      Precision = 5
      Size = 0
    end
    object IQFieldFIXEDCHAR: TStringField
      FieldName = 'FIXEDCHAR'
      Origin = 'FIXEDCHAR'
      FixedChar = True
      Size = 1
    end
    object IQFieldDATATYPE: TBCDField
      FieldName = 'DATATYPE'
      Origin = 'DATATYPE'
      Required = True
      Precision = 2
      Size = 0
    end
    object IQFieldFIELDTYPE: TBCDField
      FieldName = 'FIELDTYPE'
      Origin = 'FIELDTYPE'
      Required = True
      Precision = 2
      Size = 0
    end
    object IQFieldFIELDTYPEID: TBCDField
      FieldName = 'FIELDTYPEID'
      Origin = 'FIELDTYPEID'
      Precision = 5
      Size = 0
    end
    object IQFieldEDITOR_ID: TBCDField
      FieldName = 'EDITOR_ID'
      Origin = 'EDITOR_ID'
      Precision = 2
      Size = 0
    end
    object IQFieldDATASET_ID: TBCDField
      FieldName = 'DATASET_ID'
      Origin = 'DATASET_ID'
      Required = True
      Precision = 5
      Size = 0
    end
  end
  object IQPickList: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'IQPickList'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'IQPickList'
    Left = 96
    Top = 360
    object IQPickListID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 5
      Size = 0
    end
    object IQPickListNAME: TStringField
      DisplayLabel = 'Pick List'
      FieldName = 'NAME'
      Origin = 'NAME'
      Required = True
      Size = 64
    end
  end
  object IQPickListItem: TFDTable
    IndexFieldNames = 'Seq;Text'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'IQPickListItem'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'IQPickListItem'
    Left = 160
    Top = 360
    object IQPickListItemID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Precision = 5
      Size = 0
    end
    object IQPickListItemTEXT: TStringField
      FieldName = 'TEXT'
      Origin = 'TEXT'
      Required = True
      Size = 64
    end
    object IQPickListItemSEQ: TBCDField
      FieldName = 'SEQ'
      Origin = 'SEQ'
      Precision = 3
      Size = 0
    end
    object IQPickListItemPICKLIST_ID: TBCDField
      FieldName = 'PICKLIST_ID'
      Origin = 'PICKLIST_ID'
      Precision = 5
      Size = 0
    end
  end
  object IQDataSet: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'IQDataSet'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'IQDataSet'
    Left = 192
    Top = 136
    object IQDataSetID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 5
      Size = 0
    end
    object IQDataSetNAME: TStringField
      FieldName = 'NAME'
      Origin = 'NAME'
      Required = True
      Size = 64
    end
    object IQDataSetMASTERDATASET_ID: TBCDField
      FieldName = 'MASTERDATASET_ID'
      Origin = 'MASTERDATASET_ID'
      Precision = 5
      Size = 0
    end
    object IQDataSetKEYFIELD_ID: TBCDField
      FieldName = 'KEYFIELD_ID'
      Origin = 'KEYFIELD_ID'
      Precision = 5
      Size = 0
    end
    object IQDataSetDETAILFIELD_ID: TBCDField
      FieldName = 'DETAILFIELD_ID'
      Origin = 'DETAILFIELD_ID'
      Precision = 5
      Size = 0
    end
    object IQDataSetTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Origin = 'TABLENAME'
      Size = 64
    end
    object IQDataSetSQLQUERY: TStringField
      FieldName = 'SQLQUERY'
      Origin = 'SQLQUERY'
      Size = 2000
    end
    object IQDataSetDATAMODULE_ID: TBCDField
      FieldName = 'DATAMODULE_ID'
      Origin = 'DATAMODULE_ID'
      Required = True
      Precision = 5
      Size = 0
    end
  end
  object dsIQDataSet: TDataSource
    DataSet = IQDataSet
    Left = 128
    Top = 136
  end
  object IQDataModule: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'IQDataModule'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'IQDataModule'
    Left = 96
    Top = 80
    object IQDataModuleID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 5
      Size = 0
    end
    object IQDataModuleNAME: TStringField
      FieldName = 'NAME'
      Origin = 'NAME'
      Required = True
      Size = 64
    end
    object IQDataModuleMODULE_ID: TBCDField
      FieldName = 'MODULE_ID'
      Origin = 'MODULE_ID'
      Required = True
      Precision = 5
      Size = 0
    end
  end
  object IQPickDataSet: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'IQPickDataSet'
    TableName = 'IQPickDataSet'
    Left = 96
    Top = 208
    object IQPickDataSetID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 5
      Size = 0
    end
    object IQPickDataSetNAME: TStringField
      FieldName = 'NAME'
      Origin = 'NAME'
      Required = True
      Size = 64
    end
    object IQPickDataSetDATASET_ID: TBCDField
      FieldName = 'DATASET_ID'
      Origin = 'DATASET_ID'
      Precision = 5
      Size = 0
    end
    object IQPickDataSetLISTFIELD_ID: TBCDField
      FieldName = 'LISTFIELD_ID'
      Origin = 'LISTFIELD_ID'
      Precision = 5
      Size = 0
    end
  end
  object IQForm: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'IQForm'
    TableName = 'IQForm'
    Left = 192
    Top = 64
    object IQFormID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 5
      Size = 0
    end
    object IQFormNAME: TStringField
      FieldName = 'NAME'
      Origin = 'NAME'
      Required = True
      Size = 64
    end
    object IQFormPARENT_ID: TBCDField
      FieldName = 'PARENT_ID'
      Origin = 'PARENT_ID'
      Precision = 5
      Size = 0
    end
    object IQFormMODULE_ID: TBCDField
      FieldName = 'MODULE_ID'
      Origin = 'MODULE_ID'
      Required = True
      Precision = 5
      Size = 0
    end
  end
  object IQFormDesign: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'IQFormDesign'
    TableName = 'IQFormDesign'
    Left = 264
    Top = 64
    object IQFormDesignID: TBCDField
      FieldName = 'ID'
      Required = True
      Precision = 5
      Size = 0
    end
    object IQFormDesignNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 64
    end
    object IQFormDesignFORM_ID: TBCDField
      FieldName = 'FORM_ID'
      Required = True
      Precision = 5
      Size = 0
    end
    object IQFormDesignDFM: TStringField
      FieldName = 'DFM'
      Size = 2000
    end
  end
  object dsIQPickList: TDataSource
    DataSet = IQPickList
    Left = 40
    Top = 360
  end
  object QryPickListItem: TFDQuery
    IndexFieldNames = 'Seq;Text'
    MasterSource = dsPickLists
    MasterFields = 'ID'
    DetailFields = 'PICKLIST_ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.KeyFields = 'ID'
    SQL.Strings = (
      'select * from IQPickListItem where PickList_ID = :ID')
    Left = 160
    Top = 408
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 20000c
      end>
    object QryPickListItemID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Precision = 5
      Size = 0
    end
    object QryPickListItemTEXT: TStringField
      FieldName = 'TEXT'
      Origin = 'TEXT'
      Required = True
      Size = 64
    end
    object QryPickListItemSEQ: TBCDField
      FieldName = 'SEQ'
      Origin = 'SEQ'
      Precision = 3
      Size = 0
    end
    object QryPickListItemPICKLIST_ID: TBCDField
      FieldName = 'PICKLIST_ID'
      Origin = 'PICKLIST_ID'
      Precision = 5
      Size = 0
    end
  end
  object QryPickListItems: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select ID, Text, Seq'
      'from IQPickListItem'
      'where PickList_ID = :PickList_ID'
      'order by Seq, Text')
    Left = 160
    Top = 464
    ParamData = <
      item
        Name = 'PICKLIST_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object QryPickListItemsID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 5
      Size = 0
    end
    object QryPickListItemsTEXT: TStringField
      FieldName = 'TEXT'
      Origin = 'TEXT'
      Required = True
      Size = 64
    end
    object QryPickListItemsSEQ: TBCDField
      FieldName = 'SEQ'
      Origin = 'SEQ'
      Precision = 3
      Size = 0
    end
  end
  object IQPickLists: TFDQuery
    IndexFieldNames = 'NAME'
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select pl.*, pl.rowid'
      'from IQPickList pl')
    Left = 96
    Top = 408
    object IQPickListsID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      Visible = False
      Precision = 5
      Size = 0
    end
    object IQPickListsNAME: TStringField
      DisplayLabel = 'Pick List'
      FieldName = 'NAME'
      Origin = 'NAME'
      Required = True
      Size = 64
    end
    object IQPickListsROWID: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ROWID'
      Origin = '"ROWID"'
      Visible = False
      Size = 23
    end
  end
  object dsPickLists: TDataSource
    DataSet = IQPickLists
    Left = 40
    Top = 408
  end
  object IQPickTrees: TFDQuery
    IndexFieldNames = 'NAME'
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select pt.*, pt.rowid'
      'from IQPickTree pt')
    Left = 96
    Top = 312
    object IQPickTreesID: TBCDField
      FieldName = 'ID'
      Precision = 5
      Size = 0
    end
    object IQPickTreesNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 64
    end
    object IQPickTreesLEVELS: TBCDField
      FieldName = 'LEVELS'
      Precision = 3
      Size = 0
    end
    object IQPickTreesPICKTREENODE_ID: TBCDField
      FieldName = 'PICKTREENODE_ID'
      Precision = 5
      Size = 0
    end
    object IQPickTreesROWID: TStringField
      FieldName = 'ROWID'
      Size = 23
    end
  end
  object IQModule: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'IQDataModule'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'IQDataModule'
    Left = 96
    Top = 24
    object BCDField2: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 5
      Size = 0
    end
    object StringField3: TStringField
      FieldName = 'NAME'
      Origin = 'NAME'
      Required = True
      Size = 64
    end
  end
end
