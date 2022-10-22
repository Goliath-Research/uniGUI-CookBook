object DM_Tax: TDM_Tax
  OldCreateOrder = True
  Height = 479
  Width = 741
  object SrcTaxElements: TDataSource
    DataSet = QryTaxElements
    Left = 104
    Top = 6
  end
  object SrcTaxCodeLink: TDataSource
    DataSet = TblTaxCodeLink
    Left = 96
    Top = 110
  end
  object TblTaxCodeLink2: TFDTable
    BeforeInsert = TblTaxCodeLink2BeforeInsert
    AfterInsert = TblTaxCodeLink2AfterInsert
    AfterPost = TblTaxCodeLink2AfterPost
    AfterDelete = TblTaxCodeLink2AfterPost
    IndexFieldNames = 'TAX_CODES_ID;ID'
    MasterSource = SrcTaxCodes
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'TAX_CODE_LINK'
    TableName = 'TAX_CODE_LINK'
    Left = 136
    Top = 110
    object TblTaxCodeLink2TAX_CODES_ID: TBCDField
      DisplayLabel = 'Link between Tax Code and Tax Element'
      FieldName = 'TAX_CODES_ID'
      Required = True
      Size = 0
    end
    object TblTaxCodeLink2TAX_ELEMENTS_ID: TBCDField
      DisplayLabel = 'Link Between Tax Code and Tax Element'
      FieldName = 'TAX_ELEMENTS_ID'
      Required = True
      Size = 0
    end
    object TblTaxCodeLink2SEQ: TBCDField
      FieldName = 'SEQ'
      Required = True
      Size = 0
    end
    object TblTaxCodeLink2Descrip: TStringField
      DisplayWidth = 60
      FieldKind = fkLookup
      FieldName = 'Descrip'
      LookupDataSet = QryTaxElements
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIP'
      KeyFields = 'TAX_ELEMENTS_ID'
      Size = 60
      Lookup = True
    end
    object TblTaxCodeLink2Rate: TFloatField
      FieldKind = fkLookup
      FieldName = 'Rate'
      LookupDataSet = QryTaxElements
      LookupKeyFields = 'ID'
      LookupResultField = 'TAX_RATE'
      KeyFields = 'TAX_ELEMENTS_ID'
      DisplayFormat = '0.000'
      Lookup = True
    end
    object TblTaxCodeLink2GlAcct: TStringField
      FieldKind = fkLookup
      FieldName = 'GlAcct'
      LookupDataSet = QryTaxElements
      LookupKeyFields = 'ID'
      LookupResultField = 'ACCT'
      KeyFields = 'TAX_ELEMENTS_ID'
      Size = 50
      Lookup = True
    end
    object TblTaxCodeLink2VAT_PAID: TStringField
      FieldName = 'VAT_PAID'
      Size = 1
    end
    object TblTaxCodeLink2ID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object TblTaxCodeLink2USE_TAX: TStringField
      FieldName = 'USE_TAX'
      Size = 1
    end
  end
  object SrcTaxCodes: TDataSource
    DataSet = QryTaxCodes
    Left = 104
    Top = 56
  end
  object TblGlAcct: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'V_GLACCT_GLSUB_ACCT_TYPE'
    TableName = 'V_GLACCT_GLSUB_ACCT_TYPE'
    Left = 216
    Top = 16
  end
  object PKAcct: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       acct,'
      '       descrip,'
      '       type'
      '  from V_GLACCT_GLSUB_ACCT_TYPE'
      'where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39)
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 24
    Top = 16
    object PKAcctID: TFloatField
      FieldName = 'ID'
      Visible = False
    end
    object PKAcctACCT: TStringField
      DisplayLabel = 'Account'
      FieldName = 'ACCT'
      Size = 50
    end
    object PKAcctDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object PKAcctTYPE: TStringField
      DisplayLabel = 'Account Type'
      FieldName = 'TYPE'
      Origin = 'V_GLACCT_GLSUB_ACCT_TYPE.TYPE'
      Size = 35
    end
  end
  object QryTaxCodes: TFDQuery
    BeforePost = QryTaxCodesBeforePost
    Connection = UniMainModule.FDConnection1
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select t.id,'
      '       t.tax_code,'
      '       t.tax_code_desc,'
      '       t.tot_tax_rate,'
      '       t.ecode,'
      '       t.eid,'
      '       t.edate_time,'
      '       t.ecopy,'
      '       t.vat_paid,'
      '       v.tax_rate,'
      '       t.include_freight,'
      '       t.state,'
      '       t.county'
      '  from TAX_CODES t,'
      '       v_tax_codes v'
      ' where t.id = v.id(+)'
      ''
      '')
    Left = 128
    Top = 64
    object QryTaxCodesTAX_CODE: TStringField
      DisplayLabel = 'Tax Code'
      DisplayWidth = 20
      FieldName = 'TAX_CODE'
      Origin = 't.TAX_CODE'
    end
    object QryTaxCodesTAX_CODE_DESC: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 50
      FieldName = 'TAX_CODE_DESC'
      Origin = 't.TAX_CODE_DESC'
      Size = 50
    end
    object QryTaxCodesTAX_RATE: TFMTBCDField
      DisplayLabel = 'Total Rate'
      DisplayWidth = 10
      FieldName = 'TAX_RATE'
      Origin = 'v.tax_rate'
      ReadOnly = True
      Size = 38
    end
    object QryTaxCodesINCLUDE_FREIGHT: TStringField
      DisplayLabel = 'Include Freight'
      DisplayWidth = 1
      FieldName = 'INCLUDE_FREIGHT'
      Origin = 't.INCLUDE_FREIGHT'
      Size = 1
    end
    object QryTaxCodesSTATE: TStringField
      DisplayLabel = 'State'
      DisplayWidth = 10
      FieldName = 'STATE'
      Origin = 't.STATE'
      Size = 10
    end
    object QryTaxCodesCOUNTY: TStringField
      DisplayLabel = 'County'
      DisplayWidth = 30
      FieldName = 'COUNTY'
      Origin = 't.COUNTY'
      Size = 30
    end
    object QryTaxCodesVAT_PAID: TStringField
      DisplayLabel = 'VAT Paid'
      DisplayWidth = 8
      FieldName = 'VAT_PAID'
      Origin = 't.VAT_PAID'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryTaxCodesTOT_TAX_RATE: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'TOT_TAX_RATE'
      Origin = 't.TOT_TAX_RATE'
      Visible = False
      Size = 6
    end
    object QryTaxCodesECODE: TStringField
      DisplayWidth = 10
      FieldName = 'ECODE'
      Origin = 't.ECODE'
      Visible = False
      Size = 10
    end
    object QryTaxCodesEID: TBCDField
      DisplayWidth = 10
      FieldName = 'EID'
      Origin = 't.EID'
      Visible = False
      Size = 0
    end
    object QryTaxCodesEDATE_TIME: TDateTimeField
      DisplayWidth = 18
      FieldName = 'EDATE_TIME'
      Origin = 't.EDATE_TIME'
      Visible = False
    end
    object QryTaxCodesECOPY: TStringField
      DisplayWidth = 1
      FieldName = 'ECOPY'
      Origin = 't.ECOPY'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryTaxCodesID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 't.ID'
      Visible = False
      Size = 0
    end
  end
  object QryTaxElements: TFDQuery
    BeforePost = QryTaxElementsBeforePost
    Connection = UniMainModule.FDConnection1
    UpdateObject = UpdateSQL2
    SQL.Strings = (
      'select t.id,'
      '       t.descrip,'
      '       t.tax_rate,'
      '       t.glacct_id,'
      '       t.ecode,'
      '       t.eid,'
      '       t.edate_time,'
      '       t.ecopy,'
      '       a.acct'
      '  from tax_elements t,'
      '       glacct a'
      ' where t.glacct_id = a.id(+)')
    Left = 120
    Top = 8
    object QryTaxElementsDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 60
      FieldName = 'DESCRIP'
      Origin = 't.DESCRIP'
      Size = 60
    end
    object QryTaxElementsTAX_RATE: TFMTBCDField
      DisplayLabel = 'Tax Rate'
      DisplayWidth = 10
      FieldName = 'TAX_RATE'
      Origin = 't.TAX_RATE'
      Size = 6
    end
    object QryTaxElementsACCT: TStringField
      DisplayLabel = 'GL Account'
      DisplayWidth = 20
      FieldName = 'ACCT'
      Origin = 'a.ACCT'
      Size = 50
    end
    object QryTaxElementsID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 't.ID'
      Visible = False
      Size = 0
    end
    object QryTaxElementsGLACCT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'GLACCT_ID'
      Origin = 't.GLACCT_ID'
      Visible = False
      Size = 0
    end
    object QryTaxElementsECODE: TStringField
      DisplayWidth = 10
      FieldName = 'ECODE'
      Origin = 't.ECODE'
      Visible = False
      Size = 10
    end
    object QryTaxElementsEID: TBCDField
      DisplayWidth = 10
      FieldName = 'EID'
      Origin = 't.EID'
      Visible = False
      Size = 0
    end
    object QryTaxElementsEDATE_TIME: TDateTimeField
      DisplayWidth = 18
      FieldName = 'EDATE_TIME'
      Origin = 't.EDATE_TIME'
      Visible = False
    end
    object QryTaxElementsECOPY: TStringField
      DisplayWidth = 1
      FieldName = 'ECOPY'
      Origin = 't.ECOPY'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into TAX_CODES'
      
        '  (ID, TAX_CODE, TAX_CODE_DESC, TOT_TAX_RATE, ECODE, EID, EDATE_' +
        'TIME, ECOPY, '
      '   VAT_PAID, INCLUDE_FREIGHT, STATE, COUNTY)'
      'values'
      
        '  (:ID, :TAX_CODE, :TAX_CODE_DESC, :TOT_TAX_RATE, :ECODE, :EID, ' +
        ':EDATE_TIME, '
      '   :ECOPY, :VAT_PAID, :INCLUDE_FREIGHT, :STATE, :COUNTY)')
    ModifySQL.Strings = (
      'update TAX_CODES'
      'set'
      '  ID = :ID,'
      '  TAX_CODE = :TAX_CODE,'
      '  TAX_CODE_DESC = :TAX_CODE_DESC,'
      '  TOT_TAX_RATE = :TOT_TAX_RATE,'
      '  ECODE = :ECODE,'
      '  EID = :EID,'
      '  EDATE_TIME = :EDATE_TIME,'
      '  ECOPY = :ECOPY,'
      '  VAT_PAID = :VAT_PAID,'
      '  INCLUDE_FREIGHT = :INCLUDE_FREIGHT,'
      '  STATE = :STATE,'
      '  COUNTY = :COUNTY'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from TAX_CODES'
      'where'
      '  ID = :OLD_ID')
    Left = 168
    Top = 64
  end
  object UpdateSQL2: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into tax_elements'
      
        '  (ID, DESCRIP, TAX_RATE, GLACCT_ID, ECODE, EID, EDATE_TIME, ECO' +
        'PY)'
      'values'
      
        '  (:ID, :DESCRIP, :TAX_RATE, :GLACCT_ID, :ECODE, :EID, :EDATE_TI' +
        'ME, :ECOPY)')
    ModifySQL.Strings = (
      'update tax_elements'
      'set'
      '  ID = :ID,'
      '  DESCRIP = :DESCRIP,'
      '  TAX_RATE = :TAX_RATE,'
      '  GLACCT_ID = :GLACCT_ID,'
      '  ECODE = :ECODE,'
      '  EID = :EID,'
      '  EDATE_TIME = :EDATE_TIME,'
      '  ECOPY = :ECOPY'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from tax_elements'
      'where'
      '  ID = :OLD_ID')
    Left = 144
    Top = 8
  end
  object TblTaxCodeLink: TFDTable
    BeforeInsert = TblTaxCodeLinkBeforeInsert
    AfterInsert = TblTaxCodeLinkAfterInsert
    BeforePost = TblTaxCodeLinkBeforePost
    AfterPost = TblTaxCodeLinkAfterPost
    AfterDelete = TblTaxCodeLinkAfterPost
    OnCalcFields = TblTaxCodeLinkCalcFields
    IndexFieldNames = 'TAX_CODES_ID;ID'
    MasterSource = SrcTaxCodes
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'TAX_CODE_LINK'
    TableName = 'TAX_CODE_LINK'
    Left = 136
    Top = 168
    object TblTaxCodeLinkSEQ: TBCDField
      DisplayWidth = 10
      FieldName = 'SEQ'
      Required = True
      Size = 0
    end
    object TblTaxCodeLinkDescrip: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 60
      FieldKind = fkCalculated
      FieldName = 'Descrip'
      Size = 60
      Calculated = True
    end
    object TblTaxCodeLinkRate: TFloatField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Rate'
      Calculated = True
    end
    object TblTaxCodeLinkGlAcct: TStringField
      DisplayLabel = 'GL Account'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'GlAcct'
      Calculated = True
    end
    object TblTaxCodeLinkVAT_PAID: TStringField
      DisplayLabel = 'VAT Paid'
      DisplayWidth = 1
      FieldName = 'VAT_PAID'
      Size = 1
    end
    object TblTaxCodeLinkUSE_TAX: TStringField
      DisplayLabel = 'Use Tax'
      DisplayWidth = 1
      FieldName = 'USE_TAX'
      Visible = False
      Size = 1
    end
    object TblTaxCodeLinkECODE: TStringField
      DisplayWidth = 10
      FieldName = 'ECODE'
      Visible = False
      Size = 10
    end
    object TblTaxCodeLinkEID: TBCDField
      DisplayWidth = 10
      FieldName = 'EID'
      Visible = False
      Size = 0
    end
    object TblTaxCodeLinkEDATE_TIME: TDateTimeField
      DisplayWidth = 18
      FieldName = 'EDATE_TIME'
      Visible = False
    end
    object TblTaxCodeLinkECOPY: TStringField
      DisplayWidth = 1
      FieldName = 'ECOPY'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object TblTaxCodeLinkID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object TblTaxCodeLinkSERVICE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SERVICE_ID'
      Visible = False
      Size = 0
    end
    object TblTaxCodeLinkTAX_CODES_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'TAX_CODES_ID'
      Required = True
      Visible = False
      Size = 0
    end
    object TblTaxCodeLinkTAX_ELEMENTS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'TAX_ELEMENTS_ID'
      Required = True
      Visible = False
      Size = 0
    end
  end
  object PkTaxElements: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select t.id as id,'
      '       t.descrip as descrip,'
      '       t.tax_rate as tax_rate,'
      '       a.acct as account'
      '  from tax_elements t,'
      '       glacct a'
      ' where t.glacct_id = a.id(+)')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 288
    Top = 24
    object PkTaxElementsID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkTaxElementsDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 60
    end
    object PkTaxElementsTAX_RATE: TFMTBCDField
      DisplayLabel = 'Rate'
      FieldName = 'TAX_RATE'
      Size = 6
    end
    object PkTaxElementsACCOUNT: TStringField
      DisplayLabel = 'GL Account'
      FieldName = 'ACCOUNT'
      Size = 50
    end
  end
end
