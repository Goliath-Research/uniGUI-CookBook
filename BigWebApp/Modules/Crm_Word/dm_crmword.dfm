object CRMWORD_DM: TCRMWORD_DM
  OldCreateOrder = False
  Height = 413
  Width = 393
  object SrcCRMWordCriteria: TDataSource
    DataSet = TblCRMWordCriteria
    Left = 64
    Top = 96
  end
  object TblCRMWordCriteria: TFDQuery
    BeforeEdit = DoBeforeEdit
    BeforePost = TblCRMWordCriteriaBeforePost
    OnNewRecord = TblCRMWordCriteriaNewRecord
    MasterSource = SrcCRMWordDoc
    MasterFields = 'ID'
    DetailFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereChanged
    UpdateOptions.UpdateTableName = 'CRM_WORD_CRITERIA'
    UpdateOptions.KeyFields = 'ID'
    SQL.Strings = (
      '  SELECT id,'
      '         crm_word_doc_id,'
      '         seq,'
      '         col_name,'
      '         descrip,'
      '         unary_operator,'
      '         binary_operator,'
      '         range_end,'
      '         range_start,'
      '         include_nulls'
      '    FROM crm_word_criteria'
      '   WHERE crm_word_doc_id = :ID'
      'ORDER BY seq')
    Left = 72
    Top = 104
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 40000c
      end>
    object TblCRMWordCriteriaSEQ: TBCDField
      DisplayLabel = '#'
      DisplayWidth = 2
      FieldName = 'SEQ'
      Size = 0
    end
    object TblCRMWordCriteriaCOL_NAME: TStringField
      DisplayLabel = 'Column'
      DisplayWidth = 15
      FieldName = 'COL_NAME'
      OnChange = TblCRMWordCriteriaCOL_NAMEChange
      Size = 60
    end
    object TblCRMWordCriteriaDESCRIP: TStringField
      DisplayLabel = 'Label'
      DisplayWidth = 17
      FieldName = 'DESCRIP'
      Size = 60
    end
    object TblCRMWordCriteriaRANGE_START: TStringField
      DisplayLabel = 'From'
      DisplayWidth = 13
      FieldName = 'RANGE_START'
      Size = 60
    end
    object TblCRMWordCriteriaUNARY_OPERATOR: TStringField
      DisplayLabel = '=?'
      DisplayWidth = 4
      FieldName = 'UNARY_OPERATOR'
      Size = 3
    end
    object TblCRMWordCriteriaRANGE_END: TStringField
      DisplayLabel = 'To'
      DisplayWidth = 14
      FieldName = 'RANGE_END'
      Size = 60
    end
    object TblCRMWordCriteriaBINARY_OPERATOR: TStringField
      DisplayLabel = 'And/Or'
      DisplayWidth = 7
      FieldName = 'BINARY_OPERATOR'
      Size = 3
    end
    object TblCRMWordCriteriaINCLUDE_NULLS: TStringField
      DisplayLabel = 'Include Empty ~Values?'
      DisplayWidth = 14
      FieldName = 'INCLUDE_NULLS'
      Size = 1
    end
    object TblCRMWordCriteriaID: TBCDField
      Tag = 1
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object TblCRMWordCriteriaCRM_WORD_DOC_ID: TBCDField
      Tag = 1
      DisplayWidth = 10
      FieldName = 'CRM_WORD_DOC_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcCRMWordDoc: TDataSource
    DataSet = TblCRMWordDoc
    Left = 64
    Top = 24
  end
  object TblCRMWordDoc: TFDQuery
    BeforePost = TblCRMWordDocBeforePost
    OnCalcFields = TblCRMWordDocCalcFields
    OnNewRecord = TblCRMWordDocNewRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereChanged
    UpdateOptions.UpdateTableName = 'CRM_WORD_DOC'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = FDUpdateSQL_Doc
    SQL.Strings = (
      'SELECT id,'
      '       userid,'
      '       name,'
      '       description,'
      '       filename,'
      '       last_printed,'
      '       dataset_index,'
      '       templatename,'
      '       datafilename,'
      '       datatablename,'
      '       published,'
      '       massmail,'
      '       email_field_name,'
      '       datatabletype,'
      '       campaign_id'
      '  FROM crm_word_doc')
    Left = 72
    Top = 32
    object TblCRMWordDocID: TBCDField
      Tag = 1
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object TblCRMWordDocUSERID: TStringField
      DisplayWidth = 10
      FieldName = 'USERID'
      Size = 35
    end
    object TblCRMWordDocNAME: TStringField
      DisplayWidth = 10
      FieldName = 'NAME'
      Size = 35
    end
    object TblCRMWordDocDESCRIPTION: TStringField
      DisplayWidth = 10
      FieldName = 'DESCRIPTION'
      Size = 255
    end
    object TblCRMWordDocFILENAME: TStringField
      DisplayWidth = 10
      FieldName = 'FILENAME'
      Size = 255
    end
    object TblCRMWordDocLAST_PRINTED: TDateTimeField
      DisplayWidth = 10
      FieldName = 'LAST_PRINTED'
    end
    object TblCRMWordDocDATASET_INDEX: TFMTBCDField
      Tag = 1
      DisplayWidth = 10
      FieldName = 'DATASET_INDEX'
      Size = 0
    end
    object TblCRMWordDocTEMPLATENAME: TStringField
      FieldName = 'TEMPLATENAME'
      Size = 255
    end
    object TblCRMWordDocDatasetDescrip: TStringField
      FieldKind = fkCalculated
      FieldName = 'DatasetDescrip'
      Calculated = True
    end
    object TblCRMWordDocDATAFILENAME: TStringField
      FieldName = 'DATAFILENAME'
      Size = 255
    end
    object TblCRMWordDocDATATABLENAME: TStringField
      FieldName = 'DATATABLENAME'
      Size = 30
    end
    object TblCRMWordDocMASSMAIL: TStringField
      FieldName = 'MASSMAIL'
      FixedChar = True
      Size = 1
    end
    object TblCRMWordDocEMAIL_FIELD_NAME: TStringField
      FieldName = 'EMAIL_FIELD_NAME'
      Size = 30
    end
    object TblCRMWordDocPUBLISHED: TStringField
      FieldName = 'PUBLISHED'
      FixedChar = True
      Size = 1
    end
    object TblCRMWordDocDATATABLETYPE: TFMTBCDField
      Tag = 1
      FieldName = 'DATATABLETYPE'
      Size = 0
    end
    object TblCRMWordDocCAMPAIGN_ID: TBCDField
      FieldName = 'CAMPAIGN_ID'
      Size = 0
    end
  end
  object SrcCRMWordCriteria_QK: TDataSource
    DataSet = TblCRMWordCriteria_QK
    Left = 64
    Top = 168
  end
  object TblCRMWordCriteria_QK: TFDQuery
    BeforeEdit = DoBeforeEdit
    BeforePost = TblCRMWordCriteriaBeforePost
    IndexFieldNames = 'CRM_WORD_DOC_ID'
    MasterSource = SrcCRMWordDoc
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereChanged
    UpdateOptions.UpdateTableName = 'CRM_WORD_CRITERIA'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = FDUpdateSQL_CriteriaQK
    SQL.Strings = (
      '  SELECT id,'
      '         crm_word_doc_id,'
      '         seq,'
      '         col_name,'
      '         descrip,'
      '         unary_operator,'
      '         binary_operator,'
      '         range_end,'
      '         range_start,'
      '         include_nulls'
      '    FROM crm_word_criteria'
      '   WHERE crm_word_doc_id = :ID'
      'ORDER BY seq'
      '')
    Left = 72
    Top = 176
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 40000c
      end>
    object TblCRMWordCriteria_QKDESCRIP: TStringField
      DisplayLabel = 'Field'
      DisplayWidth = 17
      FieldName = 'DESCRIP'
      ReadOnly = True
      Size = 60
    end
    object TblCRMWordCriteria_QKRANGE_START: TStringField
      DisplayLabel = 'From'
      DisplayWidth = 13
      FieldName = 'RANGE_START'
      Size = 60
    end
    object TblCRMWordCriteria_QKUNARY_OPERATOR: TStringField
      DisplayLabel = '=?'
      DisplayWidth = 3
      FieldName = 'UNARY_OPERATOR'
      Size = 3
    end
    object TblCRMWordCriteria_QKRANGE_END: TStringField
      DisplayLabel = 'To'
      DisplayWidth = 14
      FieldName = 'RANGE_END'
      Size = 60
    end
    object TblCRMWordCriteria_QKBINARY_OPERATOR: TStringField
      DisplayLabel = 'And/Or'
      DisplayWidth = 7
      FieldName = 'BINARY_OPERATOR'
      Size = 3
    end
    object TblCRMWordCriteria_QKINCLUDE_NULLS: TStringField
      DisplayLabel = 'Include Empty ~Values?'
      DisplayWidth = 1
      FieldName = 'INCLUDE_NULLS'
      Size = 1
    end
    object TblCRMWordCriteria_QKSEQ: TBCDField
      DisplayLabel = '#'
      DisplayWidth = 2
      FieldName = 'SEQ'
      Visible = False
      Size = 0
    end
    object TblCRMWordCriteria_QKCOL_NAME: TStringField
      DisplayLabel = 'Column'
      DisplayWidth = 15
      FieldName = 'COL_NAME'
      Visible = False
      Size = 60
    end
    object TblCRMWordCriteria_QKID: TBCDField
      Tag = 1
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object TblCRMWordCriteria_QKCRM_WORD_DOC_ID: TBCDField
      Tag = 1
      FieldName = 'CRM_WORD_DOC_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcSortBy: TDataSource
    DataSet = QrySortBy
    Left = 64
    Top = 240
  end
  object QrySortBy: TFDQuery
    BeforeEdit = DoBeforeEdit
    AfterPost = DoAfterPost
    BeforeDelete = QrySortByBeforeDelete
    AfterDelete = DoAfterPost
    OnNewRecord = QrySortByNewRecord
    CachedUpdates = True
    MasterSource = SrcCRMWordDoc
    MasterFields = 'ID'
    OnUpdateRecord = QrySortByUpdateRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereChanged
    SQL.Strings = (
      'select'
      '     id,'
      '     crm_word_doc_id,'
      '     seq,'
      '     substrB(iqeval.substrW63Max( text, 1, 30 ), 1, 30) as text'
      'from crm_word_sql'
      'where sort_field = '#39'Y'#39
      'and crm_word_doc_id = :ID '
      'order by seq ')
    Left = 72
    Top = 248
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QrySortBySEQ: TBCDField
      DisplayLabel = '#'
      DisplayWidth = 4
      FieldName = 'SEQ'
      Origin = 'IQ.CRM_WORD_SQL.SEQ'
      Size = 0
    end
    object QrySortByTEXT: TStringField
      DisplayLabel = 'Sort By Field'
      DisplayWidth = 26
      FieldName = 'TEXT'
      Size = 30
    end
    object QrySortByID: TBCDField
      Tag = 1
      FieldName = 'ID'
      Origin = 'CRM_WORD_SQL.ID'
      Visible = False
      Size = 0
    end
    object QrySortByCRM_WORD_DOC_ID: TBCDField
      Tag = 1
      FieldName = 'CRM_WORD_DOC_ID'
      Origin = 'IQ.CRM_WORD_SQL.CRM_WORD_DOC_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcCampaign: TDataSource
    DataSet = QryCampaign
    Left = 188
    Top = 245
  end
  object QryCampaign: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT 0 AS id,'
      '       '#39'<None>'#39' AS campaign_no,'
      '       '#39#39' AS code,'
      '       '#39#39' AS description'
      '  FROM DUAL'
      'UNION'
      'SELECT id,'
      '       TO_CHAR(id),'
      '       code,'
      '       description'
      '  FROM campaign'
      ' WHERE NVL(pk_hide, '#39'N'#39') <> '#39'Y'#39
      'ORDER BY 1')
    Left = 200
    Top = 256
    object QryCampaignCAMPAIGN_NO: TStringField
      DisplayLabel = 'Campaign #'
      DisplayWidth = 15
      FieldName = 'CAMPAIGN_NO'
      Size = 40
    end
    object QryCampaignCODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 10
      FieldName = 'CODE'
      Origin = 'IQ.CAMPAIGN.CODE'
      Size = 10
    end
    object QryCampaignDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 150
      FieldName = 'DESCRIPTION'
      Origin = 'IQ.CAMPAIGN.DESCRIPTION'
      Size = 255
    end
    object QryCampaignID: TFMTBCDField
      DisplayLabel = 'Campaign #'
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.CAMPAIGN.ID'
      Visible = False
      Size = 38
    end
  end
  object FDUpdateSQL_Doc: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'INSERT INTO CRM_WORD_DOC'
      '(ID, USERID, NAME, DESCRIPTION, FILENAME, '
      '  LAST_PRINTED, DATASET_INDEX, TEMPLATENAME, '
      '  DATAFILENAME, DATATABLENAME, PUBLISHED, MASSMAIL, '
      '  EMAIL_FIELD_NAME, DATATABLETYPE, CAMPAIGN_ID)'
      
        'VALUES (:NEW_ID, :NEW_USERID, :NEW_NAME, :NEW_DESCRIPTION, :NEW_' +
        'FILENAME, '
      '  :NEW_LAST_PRINTED, :NEW_DATASET_INDEX, :NEW_TEMPLATENAME, '
      
        '  :NEW_DATAFILENAME, :NEW_DATATABLENAME, :NEW_PUBLISHED, :NEW_MA' +
        'SSMAIL, '
      '  :NEW_EMAIL_FIELD_NAME, :NEW_DATATABLETYPE, :NEW_CAMPAIGN_ID)')
    ModifySQL.Strings = (
      'UPDATE CRM_WORD_DOC'
      
        'SET ID = :NEW_ID, USERID = :NEW_USERID, NAME = :NEW_NAME, DESCRI' +
        'PTION = :NEW_DESCRIPTION, '
      '  FILENAME = :NEW_FILENAME, LAST_PRINTED = :NEW_LAST_PRINTED, '
      
        '  DATASET_INDEX = :NEW_DATASET_INDEX, TEMPLATENAME = :NEW_TEMPLA' +
        'TENAME, '
      
        '  DATAFILENAME = :NEW_DATAFILENAME, DATATABLENAME = :NEW_DATATAB' +
        'LENAME, '
      
        '  PUBLISHED = :NEW_PUBLISHED, MASSMAIL = :NEW_MASSMAIL, EMAIL_FI' +
        'ELD_NAME = :NEW_EMAIL_FIELD_NAME, '
      
        '  DATATABLETYPE = :NEW_DATATABLETYPE, CAMPAIGN_ID = :NEW_CAMPAIG' +
        'N_ID'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM CRM_WORD_DOC'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, USERID, NAME, DESCRIPTION, FILENAME, LAST_PRINTED, DA' +
        'TASET_INDEX, '
      
        '  TEMPLATENAME, DATAFILENAME, DATATABLENAME, PUBLISHED, MASSMAIL' +
        ', '
      '  EMAIL_FIELD_NAME, DATATABLETYPE, CAMPAIGN_ID'
      'FROM CRM_WORD_DOC'
      'WHERE ID = :ID')
    Left = 112
    Top = 32
  end
  object FDUpdateSQL_Criteria: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'INSERT INTO CRM_WORD_CRITERIA'
      '(ID, CRM_WORD_DOC_ID, SEQ, COL_NAME, DESCRIP, '
      '  UNARY_OPERATOR, BINARY_OPERATOR, RANGE_END, '
      '  RANGE_START, INCLUDE_NULLS)'
      
        'VALUES (:NEW_ID, :NEW_CRM_WORD_DOC_ID, :NEW_SEQ, :NEW_COL_NAME, ' +
        ':NEW_DESCRIP, '
      '  :NEW_UNARY_OPERATOR, :NEW_BINARY_OPERATOR, :NEW_RANGE_END, '
      '  :NEW_RANGE_START, :NEW_INCLUDE_NULLS)')
    ModifySQL.Strings = (
      'UPDATE CRM_WORD_CRITERIA'
      
        'SET ID = :NEW_ID, CRM_WORD_DOC_ID = :NEW_CRM_WORD_DOC_ID, SEQ = ' +
        ':NEW_SEQ, '
      
        '  COL_NAME = :NEW_COL_NAME, DESCRIP = :NEW_DESCRIP, UNARY_OPERAT' +
        'OR = :NEW_UNARY_OPERATOR, '
      
        '  BINARY_OPERATOR = :NEW_BINARY_OPERATOR, RANGE_END = :NEW_RANGE' +
        '_END, '
      
        '  RANGE_START = :NEW_RANGE_START, INCLUDE_NULLS = :NEW_INCLUDE_N' +
        'ULLS'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM CRM_WORD_CRITERIA'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, CRM_WORD_DOC_ID, SEQ, COL_NAME, DESCRIP, UNARY_OPERAT' +
        'OR, '
      '  BINARY_OPERATOR, RANGE_END, RANGE_START, INCLUDE_NULLS'
      'FROM CRM_WORD_CRITERIA'
      'WHERE ID = :ID')
    Left = 112
    Top = 96
  end
  object FDUpdateSQL_CriteriaQK: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'INSERT INTO CRM_WORD_CRITERIA'
      '(ID, CRM_WORD_DOC_ID, SEQ, COL_NAME, DESCRIP, '
      '  UNARY_OPERATOR, BINARY_OPERATOR, RANGE_END, '
      '  RANGE_START, INCLUDE_NULLS)'
      
        'VALUES (:NEW_ID, :NEW_CRM_WORD_DOC_ID, :NEW_SEQ, :NEW_COL_NAME, ' +
        ':NEW_DESCRIP, '
      '  :NEW_UNARY_OPERATOR, :NEW_BINARY_OPERATOR, :NEW_RANGE_END, '
      '  :NEW_RANGE_START, :NEW_INCLUDE_NULLS)')
    ModifySQL.Strings = (
      'UPDATE CRM_WORD_CRITERIA'
      
        'SET ID = :NEW_ID, CRM_WORD_DOC_ID = :NEW_CRM_WORD_DOC_ID, SEQ = ' +
        ':NEW_SEQ, '
      
        '  COL_NAME = :NEW_COL_NAME, DESCRIP = :NEW_DESCRIP, UNARY_OPERAT' +
        'OR = :NEW_UNARY_OPERATOR, '
      
        '  BINARY_OPERATOR = :NEW_BINARY_OPERATOR, RANGE_END = :NEW_RANGE' +
        '_END, '
      
        '  RANGE_START = :NEW_RANGE_START, INCLUDE_NULLS = :NEW_INCLUDE_N' +
        'ULLS'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM CRM_WORD_CRITERIA'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, CRM_WORD_DOC_ID, SEQ, COL_NAME, DESCRIP, UNARY_OPERAT' +
        'OR, '
      '  BINARY_OPERATOR, RANGE_END, RANGE_START, INCLUDE_NULLS'
      'FROM CRM_WORD_CRITERIA'
      'WHERE ID = :ID')
    Left = 136
    Top = 176
  end
end
