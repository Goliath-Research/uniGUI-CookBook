object GL_DM: TGL_DM
  OldCreateOrder = True
  OnCreate = GL_DMCreate
  Height = 479
  Width = 741
  object QryGLSubAcct: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select ID, descrip'
      'from GLSub_Acct_Type order by descrip'
      '')
    Left = 120
    Top = 24
    object QryGLSubAcctID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object QryGLSubAcctDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 35
    end
  end
  object SrcGLAcct: TDataSource
    DataSet = TblGLAcct
    OnStateChange = SrcGLAcctStateChange
    OnDataChange = SrcGLAcctDataChange
    Left = 18
    Top = 9
  end
  object TblGLAcct: TFDTable
    BeforeOpen = AssignEPlantFilter
    AfterOpen = TblGLAcctAfterDelete
    BeforeInsert = TblGLAcctBeforeInsert
    BeforePost = AssignIDBeforePost
    AfterPost = TblGLAcctAfterPost
    AfterCancel = TblGLAcctAfterDelete
    AfterDelete = TblGLAcctAfterDelete
    AfterScroll = TblGLAcctAfterScroll
    AfterRefresh = TblGLAcctAfterDelete
    OnCalcFields = TblGLAcctCalcFields
    OnNewRecord = TblGLAcctNewRecord
    Filtered = True
    IndexFieldNames = 'ACCT'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'GLACCT'
    TableName = 'GLACCT'
    Left = 34
    Top = 25
    object TblGLAcctACCT: TStringField
      DisplayLabel = 'Account #'
      DisplayWidth = 25
      FieldName = 'ACCT'
      Required = True
      Size = 50
    end
    object TblGLAcctDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Size = 50
    end
    object TblGLAcctEEXCLUDE: TStringField
      DisplayLabel = 'Exclude'
      DisplayWidth = 1
      FieldName = 'EEXCLUDE'
      Size = 1
    end
    object TblGLAcctSubAcctType1: TStringField
      DisplayLabel = 'Account Type'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'SubAcctType1'
      Size = 35
      Calculated = True
    end
    object TblGLAcctEPlant_Name: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'EPlant_Name'
      LookupDataSet = QryEPlant
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIP'
      KeyFields = 'EPLANT_ID'
      Lookup = True
    end
    object TblGLAcctGL_HIDE: TStringField
      DisplayLabel = 'Hide from GL transaction pick lists'
      DisplayWidth = 1
      FieldName = 'GL_HIDE'
      FixedChar = True
      Size = 1
    end
    object TblGLAcctAP_HIDE: TStringField
      DisplayLabel = 'Hide from Purchase Order and Accounts Payable pick lists'
      DisplayWidth = 1
      FieldName = 'AP_HIDE'
      FixedChar = True
      Size = 1
    end
    object TblGLAcctAR_HIDE: TStringField
      DisplayLabel = 'Hide from Sales Order and Accounts Receivable pick lists'
      DisplayWidth = 1
      FieldName = 'AR_HIDE'
      FixedChar = True
      Size = 1
    end
    object TblGLAcctPK_HIDE: TStringField
      DisplayLabel = 'Hide from Pick Lists'
      DisplayWidth = 1
      FieldName = 'PK_HIDE'
      Size = 1
    end
    object TblGLAcctCOST_SOURCE_RQD: TStringField
      DisplayLabel = 'Cost Source Required'
      DisplayWidth = 1
      FieldName = 'COST_SOURCE_RQD'
      Size = 1
    end
    object TblGLAcctSubAcctType: TStringField
      DisplayLabel = 'Account Type'
      DisplayWidth = 35
      FieldKind = fkLookup
      FieldName = 'SubAcctType'
      LookupDataSet = QryGLSubAcct
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIP'
      KeyFields = 'GL_SUBACCT_TYPE_ID'
      Visible = False
      Size = 35
      Lookup = True
    end
    object TblGLAcctEPLANT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
    object TblGLAcctCORVU_ACCT_TYPE: TStringField
      DisplayWidth = 30
      FieldName = 'CORVU_ACCT_TYPE'
      Visible = False
      Size = 30
    end
    object TblGLAcctGL_SUBACCT_TYPE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'GL_SUBACCT_TYPE_ID'
      Visible = False
      Size = 0
    end
    object TblGLAcctID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
  end
  object SrcGLPeriods: TDataSource
    DataSet = TblGlPeriods
    Left = 117
    Top = 74
  end
  object SrcGlYear: TDataSource
    DataSet = TblGlYear
    Left = 21
    Top = 74
  end
  object TblGlYear: TFDTable
    BeforePost = TblGlYearBeforePost
    Filtered = True
    OnFilterRecord = TblGlYearFilterRecord
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'GLYEAR'
    TableName = 'GLYEAR'
    Left = 37
    Top = 89
    object TblGlYearID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object TblGlYearDESCRIP: TStringField
      DisplayLabel = 'Fiscal Year description'
      FieldName = 'DESCRIP'
      Size = 25
    end
    object TblGlYearSTART_DATE: TDateTimeField
      DisplayLabel = 'Fiscal Year Start Date'
      FieldName = 'START_DATE'
      Required = True
    end
    object TblGlYearEND_DATE: TDateTimeField
      DisplayLabel = 'Fiscal Year End Date'
      FieldName = 'END_DATE'
      Required = True
    end
    object TblGlYearFRL_FISCAL_YEAR: TBCDField
      Tag = 1
      FieldName = 'FRL_FISCAL_YEAR'
      Required = True
      Size = 0
    end
    object TblGlYearEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object TblGlPeriods: TFDTable
    BeforeInsert = TblGlPeriodsBeforeInsert
    BeforeEdit = TblGlPeriodsBeforeEdit
    OnNewRecord = TblGlPeriodsNewRecord
    IndexFieldNames = 'GLYEAR_ID;PERIOD'
    MasterSource = SrcGlYear
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'GLPERIODS'
    TableName = 'GLPERIODS'
    Left = 141
    Top = 90
    object TblGlPeriodsPERIOD: TBCDField
      DisplayLabel = 'Period'
      DisplayWidth = 2
      FieldName = 'PERIOD'
      Required = True
      Size = 0
    end
    object TblGlPeriodsSTART_DATE: TDateTimeField
      DisplayLabel = 'Start Date'
      DisplayWidth = 18
      FieldName = 'START_DATE'
      Required = True
    end
    object TblGlPeriodsEND_DATE: TDateTimeField
      DisplayLabel = 'End Date'
      DisplayWidth = 18
      FieldName = 'END_DATE'
      Required = True
    end
    object TblGlPeriodsAP_STATUS: TStringField
      DisplayLabel = 'AP Status'
      DisplayWidth = 10
      FieldName = 'AP_STATUS'
      Size = 10
    end
    object TblGlPeriodsAR_STATUS: TStringField
      DisplayLabel = 'AR Status'
      DisplayWidth = 10
      FieldName = 'AR_STATUS'
      Size = 10
    end
    object TblGlPeriodsGL_STATUS: TStringField
      DisplayLabel = 'GL Status'
      DisplayWidth = 10
      FieldName = 'GL_STATUS'
      Size = 10
    end
    object TblGlPeriodsINV_STATUS: TStringField
      DisplayLabel = 'INV Status'
      DisplayWidth = 10
      FieldName = 'INV_STATUS'
      Size = 10
    end
    object TblGlPeriodsSTATUS: TStringField
      DisplayWidth = 2
      FieldName = 'STATUS'
      Visible = False
      Size = 2
    end
    object TblGlPeriodsID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object TblGlPeriodsGLYEAR_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'GLYEAR_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcIQSys: TDataSource
    DataSet = TblIQSys
    Left = 208
    Top = 74
  end
  object TblIQSys: TFDTable
    AfterOpen = TblIQSysAfterOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'IQSYS'
    TableName = 'IQSYS'
    Left = 224
    Top = 90
    object TblIQSysACCT_INIT: TStringField
      FieldName = 'ACCT_INIT'
      Size = 50
    end
    object TblIQSysACCT_MASK: TStringField
      FieldName = 'ACCT_MASK'
      Size = 255
    end
    object TblIQSysACCT_ACCOUNT_MASK: TStringField
      FieldName = 'ACCT_ACCOUNT_MASK'
      Size = 50
    end
    object TblIQSysACCT_DEPARTMENT_MASK: TStringField
      FieldName = 'ACCT_DEPARTMENT_MASK'
      Size = 50
    end
    object TblIQSysACCT_DIVISION_MASK: TStringField
      FieldName = 'ACCT_DIVISION_MASK'
      Size = 50
    end
    object TblIQSysCOMPANY: TStringField
      FieldName = 'COMPANY'
      Size = 60
    end
    object TblIQSysADDRESS1: TStringField
      FieldName = 'ADDRESS1'
      Size = 60
    end
    object TblIQSysADDRESS2: TStringField
      FieldName = 'ADDRESS2'
      Size = 60
    end
    object TblIQSysCITY: TStringField
      FieldName = 'CITY'
      Size = 30
    end
    object TblIQSysSTATE: TStringField
      FieldName = 'STATE'
    end
    object TblIQSysZIP: TStringField
      FieldName = 'ZIP'
      Size = 10
    end
    object TblIQSysCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Size = 60
    end
    object TblIQSysPHONE: TStringField
      FieldName = 'PHONE'
      EditMask = '!999-000-0000;1; '
      Size = 25
    end
    object TblIQSysFAX: TStringField
      FieldName = 'FAX'
      EditMask = '!999-000-0000;1; '
      Size = 25
    end
    object TblIQSysEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 250
    end
    object TblIQSysINTERNET: TStringField
      FieldName = 'INTERNET'
      Size = 50
    end
    object TblIQSysFED_ID: TStringField
      FieldName = 'FED_ID'
      Size = 15
    end
    object TblIQSysDEFAULTPERIOD: TStringField
      FieldName = 'DEFAULTPERIOD'
      Size = 4
    end
    object TblIQSysACCT_ID_CASH: TBCDField
      FieldName = 'ACCT_ID_CASH'
      Size = 0
    end
    object TblIQSysACCT_ID_AP: TBCDField
      FieldName = 'ACCT_ID_AP'
      Size = 0
    end
    object TblIQSysACCT_ID_AR: TBCDField
      FieldName = 'ACCT_ID_AR'
      Size = 0
    end
    object TblIQSysACCT_ID_FG: TBCDField
      FieldName = 'ACCT_ID_FG'
      Size = 0
    end
    object TblIQSysACCT_ID_FED: TBCDField
      FieldName = 'ACCT_ID_FED'
      Size = 0
    end
    object TblIQSysACCT_ID_SALES: TBCDField
      FieldName = 'ACCT_ID_SALES'
      Size = 0
    end
    object TblIQSysACCT_ID_SALESTAX: TBCDField
      FieldName = 'ACCT_ID_SALESTAX'
      Size = 0
    end
    object TblIQSysPERIODS_REP_BEG: TStringField
      FieldName = 'PERIODS_REP_BEG'
      Size = 4
    end
    object TblIQSysPERIODS_REP_END: TStringField
      FieldName = 'PERIODS_REP_END'
      Size = 4
    end
    object TblIQSysREFERENCE: TBCDField
      FieldName = 'REFERENCE'
      Size = 0
    end
    object TblIQSysNEXTBATCH: TBCDField
      FieldName = 'NEXTBATCH'
      Size = 0
    end
    object TblIQSysLAST_QUOTE: TBCDField
      FieldName = 'LAST_QUOTE'
      Size = 0
    end
    object TblIQSysLAST_ORDER: TBCDField
      FieldName = 'LAST_ORDER'
      Size = 0
    end
    object TblIQSysLAST_INVOICE: TBCDField
      FieldName = 'LAST_INVOICE'
      Size = 0
    end
    object TblIQSysLAST_PO: TBCDField
      FieldName = 'LAST_PO'
      Size = 0
    end
    object TblIQSysACCT_ID_DISC: TBCDField
      FieldName = 'ACCT_ID_DISC'
      Size = 0
    end
    object TblIQSysAPPERIOD: TStringField
      FieldName = 'APPERIOD'
      Size = 4
    end
    object TblIQSysARPERIOD: TStringField
      FieldName = 'ARPERIOD'
      Size = 4
    end
    object TblIQSysACCT_ID_INVSHRINK: TBCDField
      FieldName = 'ACCT_ID_INVSHRINK'
      Size = 0
    end
    object TblIQSysACCT_ID_APDISC: TBCDField
      FieldName = 'ACCT_ID_APDISC'
      Size = 0
    end
    object TblIQSysACCT_ID_ARDISC: TBCDField
      FieldName = 'ACCT_ID_ARDISC'
      Size = 0
    end
    object TblIQSysACCT_ID_COGS: TBCDField
      FieldName = 'ACCT_ID_COGS'
      Size = 0
    end
    object TblIQSysACCT_ID_SHIPPING: TBCDField
      FieldName = 'ACCT_ID_SHIPPING'
      Size = 0
    end
    object TblIQSysACCT_ID_EXTCHG: TBCDField
      FieldName = 'ACCT_ID_EXTCHG'
      Size = 0
    end
    object TblIQSysACCT_ID_WIP: TBCDField
      FieldName = 'ACCT_ID_WIP'
      Size = 0
    end
    object TblIQSysACCT_ID_CE: TBCDField
      FieldName = 'ACCT_ID_CE'
      Size = 0
    end
    object TblIQSysPSNUMBER: TBCDField
      FieldName = 'PSNUMBER'
      Size = 0
    end
    object TblIQSysFINANCE_CHG_: TBCDField
      FieldName = 'FINANCE_CHG_'
      Size = 0
    end
    object TblIQSysLAST_RMA: TBCDField
      FieldName = 'LAST_RMA'
      Size = 0
    end
    object TblIQSysLAST_TOOLPM: TBCDField
      FieldName = 'LAST_TOOLPM'
      Size = 0
    end
    object TblIQSysGJBATCH: TBCDField
      FieldName = 'GJBATCH'
      Size = 0
    end
    object TblIQSysCRBATCH: TBCDField
      FieldName = 'CRBATCH'
      Size = 0
    end
    object TblIQSysCDBATCH: TBCDField
      FieldName = 'CDBATCH'
      Size = 0
    end
    object TblIQSysPOBATCH: TBCDField
      FieldName = 'POBATCH'
      Size = 0
    end
    object TblIQSysAARBATCH: TBCDField
      FieldName = 'AARBATCH'
      Size = 0
    end
    object TblIQSysPRBATCH: TBCDField
      FieldName = 'PRBATCH'
      Size = 0
    end
    object TblIQSysARAGING: TStringField
      FieldName = 'ARAGING'
      Size = 6
    end
    object TblIQSysAPAGING: TStringField
      FieldName = 'APAGING'
      Size = 6
    end
    object TblIQSysCASHFLOW: TStringField
      FieldName = 'CASHFLOW'
      Size = 10
    end
    object TblIQSysSERVICECHG: TBCDField
      FieldName = 'SERVICECHG'
      Size = 2
    end
    object TblIQSysMINSERVICECHG: TBCDField
      FieldName = 'MINSERVICECHG'
      Size = 2
    end
    object TblIQSysRESTOCK: TBCDField
      FieldName = 'RESTOCK'
      Size = 2
    end
    object TblIQSysCLOSEPOWITHIN: TBCDField
      FieldName = 'CLOSEPOWITHIN'
      Size = 2
    end
    object TblIQSysCURRENCYCODE: TStringField
      FieldName = 'CURRENCYCODE'
      Size = 3
    end
    object TblIQSysMULTICURRENCY: TStringField
      FieldName = 'MULTICURRENCY'
      Size = 1
    end
    object TblIQSysGLYEAR_ID: TBCDField
      FieldName = 'GLYEAR_ID'
      Size = 0
    end
    object TblIQSysGLPERIOD_ID: TBCDField
      FieldName = 'GLPERIOD_ID'
      Size = 0
    end
    object TblIQSysCD_CHECK_LINES: TBCDField
      FieldName = 'CD_CHECK_LINES'
      Size = 0
    end
    object TblIQSysCD_CHECK_REPNAME: TStringField
      FieldName = 'CD_CHECK_REPNAME'
      Size = 50
    end
    object TblIQSysCD_CHECK_REMITANCE: TStringField
      FieldName = 'CD_CHECK_REMITANCE'
      Size = 50
    end
    object TblIQSysCD_AFTERPOST_REPORT: TStringField
      FieldName = 'CD_AFTERPOST_REPORT'
      Size = 50
    end
    object TblIQSysCR_AFTERPOST_REPORT: TStringField
      FieldName = 'CR_AFTERPOST_REPORT'
      Size = 50
    end
    object TblIQSysAP_AFTERPOST_REPORT: TStringField
      FieldName = 'AP_AFTERPOST_REPORT'
      Size = 50
    end
    object TblIQSysAR_AFTERPOST_REPORT: TStringField
      FieldName = 'AR_AFTERPOST_REPORT'
      Size = 50
    end
    object TblIQSysGJ_AFTERPOST_REPORT: TStringField
      FieldName = 'GJ_AFTERPOST_REPORT'
      Size = 50
    end
    object TblIQSysPACKSLIP_REPORT: TStringField
      FieldName = 'PACKSLIP_REPORT'
      Size = 50
    end
    object TblIQSysAP_CHECK_REPORT: TStringField
      FieldName = 'AP_CHECK_REPORT'
      Size = 50
    end
    object TblIQSysORD_ACK_REPORT: TStringField
      FieldName = 'ORD_ACK_REPORT'
      Size = 50
    end
    object TblIQSysINVOICE_REPORT: TStringField
      FieldName = 'INVOICE_REPORT'
      Size = 50
    end
    object TblIQSysPO_REPORT: TStringField
      FieldName = 'PO_REPORT'
      Size = 50
    end
    object TblIQSysCLOSEORDERWITHIN: TBCDField
      FieldName = 'CLOSEORDERWITHIN'
      Size = 2
    end
    object TblIQSysCOMPANY_ID: TBCDField
      FieldName = 'COMPANY_ID'
      Size = 0
    end
    object TblIQSysORD_REPORT: TStringField
      FieldName = 'ORD_REPORT'
      Size = 50
    end
    object TblIQSysORD_STAT_REPORT: TStringField
      FieldName = 'ORD_STAT_REPORT'
      Size = 50
    end
    object TblIQSysQLETTER_REPORT: TStringField
      FieldName = 'QLETTER_REPORT'
      Size = 50
    end
    object TblIQSysRE_BY_DIVISION: TStringField
      FieldName = 'RE_BY_DIVISION'
      Size = 1
    end
  end
  object PkGLAcct: TIQWebHpick
    BeforeOpen = AssignEPlantFilter
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select    g.id as id,'
      '          g.Acct as Acct,'
      '          g.Descrip as Descrip,'
      '          s.Descrip as Type,'
      '          g.eplant_id as eplant_id'
      '     from glacct g, '
      '          glsub_acct_type s'
      '    where g.gl_subacct_type_id = s.id'
      '    order by '
      '         g.acct'
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 208
    Top = 16
    object PkGLAcctACCT: TStringField
      DisplayLabel = 'Account #'
      FieldName = 'ACCT'
      Size = 50
    end
    object PkGLAcctDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object PkGLAcctID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkGLAcctTYPE: TStringField
      DisplayLabel = 'Account Type'
      FieldName = 'TYPE'
      Origin = 'GLSUB_ACCT_TYPE.DESCRIP'
      Size = 35
    end
    object PkGLAcctEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'GLACCT.EPLANT_ID'
      Size = 0
    end
  end
  object SrcQryGlSubAcctType: TDataSource
    DataSet = QryGLSubAcct
    Left = 104
    Top = 8
  end
  object QryEPlant: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       name,'
      '       '#39'['#39' || ID || '#39']  '#39' || name as descrip'
      '  from eplant'
      ' '
      ' ')
    Left = 17
    Top = 156
  end
  object PKGLYear: TIQWebHpick
    Filtered = True
    OnFilterRecord = PKGLYearFilterRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       descrip,'
      '       start_date,'
      '       end_date,'
      '       frl_fiscal_year,'
      '       eplant_id'
      '  from glyear'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 272
    Top = 24
    object PKGLYearID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.GLYEAR.ID'
      Visible = False
      Size = 0
    end
    object PKGLYearDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'IQ.GLYEAR.DESCRIP'
      Size = 25
    end
    object PKGLYearSTART_DATE: TDateTimeField
      DisplayLabel = 'Start Date'
      FieldName = 'START_DATE'
      Origin = 'IQ.GLYEAR.START_DATE'
    end
    object PKGLYearEND_DATE: TDateTimeField
      DisplayLabel = 'End Date'
      FieldName = 'END_DATE'
      Origin = 'IQ.GLYEAR.END_DATE'
    end
    object PKGLYearFRL_FISCAL_YEAR: TBCDField
      DisplayLabel = 'Frl Fiscal Year'
      FieldName = 'FRL_FISCAL_YEAR'
      Origin = 'IQ.GLYEAR.FRL_FISCAL_YEAR'
      Size = 0
    end
    object PKGLYearEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'IQ.GLYEAR.EPLANT_ID'
      Size = 0
    end
  end
  object PkSubAcctType: TIQWebHpick
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select ID, descrip'
      'from GLSub_Acct_Type'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 344
    Top = 24
    object PkSubAcctTypeID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.GLSUB_ACCT_TYPE.ID'
      Visible = False
      Size = 0
    end
    object PkSubAcctTypeDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'IQ.GLSUB_ACCT_TYPE.DESCRIP'
      Size = 35
    end
  end
end
