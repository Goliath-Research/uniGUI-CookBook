object UD_DataModule: TUD_DataModule
  OldCreateOrder = False
  Height = 407
  Width = 475
  object FDPhysOracleDriverLink1: TFDPhysOracleDriverLink
    Left = 168
    Top = 24
  end
  object FDConnection1: TFDConnection
    ConnectionName = 'IQFD'
    Params.Strings = (
      'Database=IQORA'
      'User_Name=IQMS'
      'Password=IQMS'
      'DriverID=Ora')
    ResourceOptions.AssignedValues = [rvAutoConnect]
    ResourceOptions.AutoConnect = False
    LoginPrompt = False
    Left = 40
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 171
    Top = 88
  end
  object tblUD_Tables: TFDTable
    IndexFieldNames = 'ID'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'UD_TABLES'
    TableName = 'UD_TABLES'
    Left = 40
    Top = 152
    object tblUD_TablesID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
      Precision = 15
      Size = 0
    end
    object tblUD_TablesTABLE_NAME: TStringField
      FieldName = 'TABLE_NAME'
      Origin = 'TABLE_NAME'
      Size = 50
    end
    object tblUD_TablesFORM_CAPTION: TStringField
      FieldName = 'FORM_CAPTION'
      Origin = 'FORM_CAPTION'
      Size = 100
    end
    object tblUD_TablesMENU_CAPTION: TStringField
      FieldName = 'MENU_CAPTION'
      Origin = 'MENU_CAPTION'
      Size = 50
    end
    object tblUD_TablesSOURCE_ATTRIBUTE: TStringField
      FieldName = 'SOURCE_ATTRIBUTE'
      Origin = 'SOURCE_ATTRIBUTE'
      Size = 50
    end
    object tblUD_TablesSOURCE: TStringField
      FieldName = 'SOURCE'
      Origin = 'SOURCE'
      Size = 255
    end
    object tblUD_TablesIS_NATIVE: TStringField
      FieldName = 'IS_NATIVE'
      Origin = 'IS_NATIVE'
      Size = 1
    end
    object tblUD_TablesAPP_NAME: TStringField
      FieldName = 'APP_NAME'
      Origin = 'APP_NAME'
      Size = 50
    end
    object tblUD_TablesOWNER_NAME: TStringField
      FieldName = 'OWNER_NAME'
      Origin = 'OWNER_NAME'
      Size = 255
    end
  end
  object tblUD_Cols: TFDTable
    IndexFieldNames = 'ID'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'UD_COLS'
    TableName = 'UD_COLS'
    Left = 136
    Top = 320
    object tblUD_ColsID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
    object tblUD_ColsUD_TABLES_ID: TBCDField
      FieldName = 'UD_TABLES_ID'
      Origin = 'UD_TABLES_ID'
      Precision = 15
      Size = 0
    end
    object tblUD_ColsCOL_NAME: TStringField
      FieldName = 'COL_NAME'
      Origin = 'COL_NAME'
      Size = 50
    end
    object tblUD_ColsCOL_LABEL: TStringField
      FieldName = 'COL_LABEL'
      Origin = 'COL_LABEL'
      Size = 50
    end
    object tblUD_ColsCOL_TYPE: TStringField
      FieldName = 'COL_TYPE'
      Origin = 'COL_TYPE'
      FixedChar = True
      Size = 1
    end
    object tblUD_ColsSEQ: TBCDField
      FieldName = 'SEQ'
      Origin = 'SEQ'
      Precision = 3
      Size = 0
    end
    object tblUD_ColsUSE_COMPONENT: TStringField
      FieldName = 'USE_COMPONENT'
      Origin = 'USE_COMPONENT'
    end
    object tblUD_ColsTAB_NAME: TStringField
      FieldName = 'TAB_NAME'
      Origin = 'TAB_NAME'
      Size = 60
    end
    object tblUD_ColsCOL_KIND: TStringField
      FieldName = 'COL_KIND'
      Origin = 'COL_KIND'
      Size = 1
    end
    object tblUD_ColsSQL_TEXT: TStringField
      FieldName = 'SQL_TEXT'
      Origin = 'SQL_TEXT'
      Size = 4000
    end
    object tblUD_ColsUD_GROUPBOX_ID: TBCDField
      FieldName = 'UD_GROUPBOX_ID'
      Origin = 'UD_GROUPBOX_ID'
      Precision = 15
      Size = 0
    end
    object tblUD_ColsGROUPBOX_SEQ: TBCDField
      FieldName = 'GROUPBOX_SEQ'
      Origin = 'GROUPBOX_SEQ'
      Precision = 3
      Size = 0
    end
    object tblUD_ColsLINKED_COL_NAME: TStringField
      FieldName = 'LINKED_COL_NAME'
      Origin = 'LINKED_COL_NAME'
      Size = 30
    end
    object tblUD_ColsUD_COLS_PARENT_ID: TBCDField
      FieldName = 'UD_COLS_PARENT_ID'
      Origin = 'UD_COLS_PARENT_ID'
      Precision = 15
      Size = 0
    end
    object tblUD_ColsPKLIST_FIELD_NAME: TStringField
      FieldName = 'PKLIST_FIELD_NAME'
      Origin = 'PKLIST_FIELD_NAME'
      Size = 30
    end
  end
  object tblUD_Tabs: TFDTable
    IndexFieldNames = 'ID'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'UD_TABSHEET'
    TableName = 'UD_TABSHEET'
    Left = 72
    Top = 208
    object tblUD_TabsID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
      Precision = 15
      Size = 0
    end
    object tblUD_TabsUD_TABLES_ID: TBCDField
      FieldName = 'UD_TABLES_ID'
      Origin = 'UD_TABLES_ID'
      Precision = 15
      Size = 0
    end
    object tblUD_TabsNAME: TStringField
      FieldName = 'NAME'
      Origin = 'NAME'
      Size = 50
    end
    object tblUD_TabsCAPTION: TStringField
      FieldName = 'CAPTION'
      Origin = 'CAPTION'
      Size = 50
    end
    object tblUD_TabsSEQ: TBCDField
      FieldName = 'SEQ'
      Origin = 'SEQ'
      Precision = 3
      Size = 0
    end
  end
  object tblUD_Groups: TFDTable
    IndexFieldNames = 'ID'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'UD_GROUPBOX'
    TableName = 'UD_GROUPBOX'
    Left = 104
    Top = 264
    object tblUD_GroupsID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
    object tblUD_GroupsUD_TABSHEET_ID: TBCDField
      FieldName = 'UD_TABSHEET_ID'
      Origin = 'UD_TABSHEET_ID'
      Precision = 15
      Size = 0
    end
    object tblUD_GroupsNAME: TStringField
      FieldName = 'NAME'
      Origin = 'NAME'
      Size = 50
    end
    object tblUD_GroupsCAPTION: TStringField
      FieldName = 'CAPTION'
      Origin = 'CAPTION'
      Size = 50
    end
    object tblUD_GroupsROW_NUM: TBCDField
      FieldName = 'ROW_NUM'
      Origin = 'ROW_NUM'
      Precision = 3
      Size = 0
    end
    object tblUD_GroupsCOL_NUM: TBCDField
      FieldName = 'COL_NUM'
      Origin = 'COL_NUM'
      Precision = 3
      Size = 0
    end
  end
end
