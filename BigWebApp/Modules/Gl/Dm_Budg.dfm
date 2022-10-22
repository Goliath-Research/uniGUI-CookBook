object Budg_DM: TBudg_DM
  OldCreateOrder = True
  OnCreate = GL_DMCreate
  OnDestroy = GL_DMDestroy
  Height = 479
  Width = 741
  object SrcGLPeriods: TDataSource
    DataSet = TblGLPeriods
    Left = 117
    Top = 18
  end
  object SrcGlYear: TDataSource
    DataSet = TblGlYear
    Left = 21
    Top = 18
  end
  object TblGlYear: TFDTable
    BeforePost = AssignIDBeforePost
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'GLYEAR'
    TableName = 'GLYEAR'
    Left = 37
    Top = 34
    object TblGlYearID: TBCDField
      FieldName = 'ID'
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
      EditMask = '!99/99/0000;1; '
    end
    object TblGlYearEND_DATE: TDateTimeField
      DisplayLabel = 'Fiscal Year End Date'
      FieldName = 'END_DATE'
      Required = True
      EditMask = '!99/99/0000;1; '
    end
  end
  object TblGLPeriods: TFDTable
    BeforeInsert = PostParentsBeforeEdit
    BeforeEdit = PostParentsBeforeEdit
    IndexFieldNames = 'GLYEAR_ID;PERIOD'
    MasterSource = SrcGlYear
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'GLPERIODS'
    TableName = 'GLPERIODS'
    Left = 141
    Top = 34
    object TblGLPeriodsID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object TblGLPeriodsGLYEAR_ID: TBCDField
      FieldName = 'GLYEAR_ID'
      Size = 0
    end
    object TblGLPeriodsSTART_DATE: TDateTimeField
      DisplayLabel = 'Period Start Date'
      FieldName = 'START_DATE'
      Required = True
      EditMask = '!99/99/0000;1; '
    end
    object TblGLPeriodsEND_DATE: TDateTimeField
      DisplayLabel = 'Period End Date'
      FieldName = 'END_DATE'
      Required = True
      EditMask = '!99/99/0000;1; '
    end
    object TblGLPeriodsSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 2
    end
    object TblGLPeriodsPERIOD: TBCDField
      DisplayWidth = 2
      FieldName = 'PERIOD'
      Required = True
      Size = 0
    end
  end
  object SrcIQSys: TDataSource
    DataSet = TblIQSys
    Left = 208
    Top = 18
  end
  object TblIQSys: TFDTable
    BeforeOpen = TblIQSysBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'IQSYS'
    TableName = 'IQSYS'
    Left = 224
    Top = 34
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
  end
  object PkGLAcct: TIQWebHpick
    BeforeOpen = PkGLAcctBeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select ID,'
      '          Acct,'
      '          Descrip, '
      '          Type,'
      '          eplant_id'
      '  from V_GLACCT_GLSUB_ACCT_TYPE '
      'where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      'order by Acct')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 232
    Top = 152
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
      Origin = 'V_GLACCT_GLSUB_ACCT_TYPE.TYPE'
      Size = 35
    end
    object PkGLAcctEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'V_GLACCT_GLSUB_ACCT_TYPE.EPLANT_ID'
      Size = 0
    end
  end
  object QryGLAcct_Budget: TFDQuery
    BeforeOpen = QryGLAcct_BudgetBeforeOpen
    BeforeClose = QryGLAcct_BudgetBeforeClose
    BeforeInsert = QryGLAcct_BudgetBeforeInsert
    AfterEdit = QryGLAcct_BudgetAfterEdit
    AfterPost = QryGLAcct_BudgetAfterPost
    BeforeScroll = QryGLAcct_BudgetBeforeScroll
    OnCalcFields = QryGLAcct_BudgetCalcFields
    Filtered = True
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select f.glacct_id,'
      '       f.glacct,'
      '       f.glacct_descrip,'
      '       f.glacct_type,'
      '       f.account,'
      '       f.division,'
      '       f.department,'
      '       f.glsub_acct_ID,'
      '       f.glsub_acct_descrip,'
      '       f.glacct_FY_ID,'
      '       f.glyear_id,'
      '       f.ytdbudget,'
      '       f.glyear_start_date,'
      '       f.glyear_end_date,'
      '       f.eplant_id,'
      '       f.bud_calc_amount '
      '  from v_glacct_fy_budget f,'
      '       v_glacct v'
      ' where f.glyear_id = :glyear_id'
      '   and f.glacct_id = v.id'
      
        '   and (f.glsub_acct_ID = :glsub_acct_ID or :all_glsub_acct_ID =' +
        ' 1)'
      '   and (f.account = :account or :all_account = 1)'
      '   and (f.department = :department or :all_department = 1)'
      '   and (f.division = :division or :all_division = 1)'
      ' order by f.glacct'
      '       '
      ' '
      ' ')
    Left = 56
    Top = 104
    ParamData = <
      item
        Name = 'glyear_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'glsub_acct_ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'all_glsub_acct_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'account'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'all_account'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'department'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'all_department'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'division'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'all_division'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QryGLAcct_BudgetGLACCT_DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'GLACCT_DESCRIP'
      Size = 50
    end
    object QryGLAcct_BudgetACCOUNT: TStringField
      DisplayLabel = 'Account#'
      DisplayWidth = 20
      FieldName = 'ACCOUNT'
      Origin = 'V_GLACCT_FY_BUDGET.ACCOUNT'
      Size = 16
    end
    object QryGLAcct_BudgetGLACCT_ID: TBCDField
      FieldName = 'GLACCT_ID'
      Visible = False
      Size = 0
    end
    object QryGLAcct_BudgetDEPARTMENT: TStringField
      DisplayLabel = 'Department'
      DisplayWidth = 2
      FieldName = 'DEPARTMENT'
      Origin = 'V_GLACCT_FY_BUDGET.DEPARTMENT'
      Size = 8
    end
    object QryGLAcct_BudgetDIVISION: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 2
      FieldName = 'DIVISION'
      Origin = 'V_GLACCT_FY_BUDGET.DIVISION'
      Size = 8
    end
    object QryGLAcct_BudgetGLACCT: TStringField
      FieldName = 'GLACCT'
      Visible = False
      Size = 50
    end
    object QryGLAcct_BudgetGLSUB_ACCT_ID: TBCDField
      FieldName = 'GLSUB_ACCT_ID'
      Visible = False
      Size = 0
    end
    object QryGLAcct_BudgetGLSUB_ACCT_DESCRIP: TStringField
      FieldName = 'GLSUB_ACCT_DESCRIP'
      Visible = False
      Size = 35
    end
    object QryGLAcct_BudgetGLACCT_FY_ID: TBCDField
      FieldName = 'GLACCT_FY_ID'
      Visible = False
      Size = 0
    end
    object QryGLAcct_BudgetGLYEAR_ID: TBCDField
      FieldName = 'GLYEAR_ID'
      Visible = False
      Size = 0
    end
    object QryGLAcct_BudgetYTDBUDGET: TBCDField
      FieldName = 'YTDBUDGET'
      Visible = False
      currency = True
      Size = 2
    end
    object QryGLAcct_BudgetPrevYTD: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PrevYTD'
      Visible = False
      currency = True
      Calculated = True
    end
    object QryGLAcct_BudgetPrevBudget: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PrevBudget'
      Visible = False
      currency = True
      Calculated = True
    end
    object QryGLAcct_BudgetPrevVar: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PrevVar'
      Visible = False
      currency = True
      Calculated = True
    end
    object QryGLAcct_BudgetPrevGLAcct_FY_ID: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PrevGLAcct_FY_ID'
      Visible = False
      Calculated = True
    end
    object QryGLAcct_BudgetGLACCT_TYPE: TStringField
      FieldName = 'GLACCT_TYPE'
      Origin = 'V_GLACCT_FY_BUDGET.GLACCT_TYPE'
      Visible = False
      Size = 35
    end
    object QryGLAcct_BudgetEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'V_GLACCT_FY_BUDGET.EPLANT_ID'
      Visible = False
      Size = 0
    end
    object QryGLAcct_BudgetBUD_CALC_AMOUNT: TBCDField
      DisplayLabel = 'Calc Budget'
      FieldName = 'BUD_CALC_AMOUNT'
      Origin = 'V_GLACCT_FY_BUDGET.BUD_CALC_AMOUNT'
      Visible = False
      currency = True
      Size = 2
    end
  end
  object SrcGLAcct_Budget: TDataSource
    DataSet = QryGLAcct_Budget
    Left = 40
    Top = 88
  end
  object SrcGLBudget: TDataSource
    DataSet = TblGLBudget
    Left = 136
    Top = 88
  end
  object SrcPrevPeriodBudget: TDataSource
    DataSet = QryPrevPeriodBudget
    Left = 224
    Top = 88
  end
  object QryPrevPeriodBudget: TFDQuery
    OnCalcFields = TblGLBudgetOldCalcFields
    MasterSource = SrcGLAcct_Budget
    MasterFields = 'PrevGLAcct_FY_ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select v.glacct_fy_id,'
      '       v.glyear_id,'
      '       v.glacct_id,'
      '       v.glperiods_id,'
      '       v.period,'
      '       v.budamount,'
      '       v.budpercent,'
      '       V.BUDGETS_ID,'
      '       V.BUDGETS_NAME'
      '  from v_glbudget v, glacct a'
      ' where glacct_fy_id = :PrevGLAcct_FY_ID'
      '   and v.glacct_id = a.id'
      '   and Misc.Eplant_Filter(a.eplant_id) = 1'
      'order by V.BUDGETS_ID, v.period'
      ''
      ' '
      ' ')
    Left = 232
    Top = 104
    ParamData = <
      item
        Name = 'PrevGLAcct_FY_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryPrevPeriodBudgetGLACCT_FY_ID: TBCDField
      FieldName = 'GLACCT_FY_ID'
      Size = 0
    end
    object QryPrevPeriodBudgetGLYEAR_ID: TBCDField
      FieldName = 'GLYEAR_ID'
      Size = 0
    end
    object QryPrevPeriodBudgetGLACCT_ID: TBCDField
      FieldName = 'GLACCT_ID'
      Size = 0
    end
    object QryPrevPeriodBudgetGLPERIODS_ID: TBCDField
      FieldName = 'GLPERIODS_ID'
      Size = 0
    end
    object QryPrevPeriodBudgetPERIOD: TBCDField
      FieldName = 'PERIOD'
      Size = 0
    end
    object QryPrevPeriodBudgetBUDAMOUNT: TBCDField
      FieldName = 'BUDAMOUNT'
      currency = True
      Size = 2
    end
    object QryPrevPeriodBudgetBUDPERCENT: TBCDField
      FieldName = 'BUDPERCENT'
      Size = 2
    end
    object QryPrevPeriodBudgetPeriodActual: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PeriodActual'
      currency = True
      Calculated = True
    end
    object QryPrevPeriodBudgetPeriodVariance: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PeriodVariance'
      currency = True
      Calculated = True
    end
    object QryPrevPeriodBudgetBUDGETS_ID: TBCDField
      FieldName = 'BUDGETS_ID'
      Size = 0
    end
    object QryPrevPeriodBudgetBUDGETS_NAME: TStringField
      FieldName = 'BUDGETS_NAME'
      Size = 50
    end
  end
  object updSQLAcctBudget: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into glacct_fy'
      '  (ID, GLACCT_ID, GLYEAR_ID, YTDBUDGET)'
      'values'
      '  (:GLACCT_FY_ID, :GLACCT_ID, :GLYEAR_ID, :YTDBUDGET)')
    ModifySQL.Strings = (
      'update glacct_fy'
      'set'
      '  YTDBUDGET = :YTDBUDGET'
      'where'
      '  ID = :GLACCT_FY_ID')
    DeleteSQL.Strings = (
      'delete from v_glacct_fy_budget'
      'where'
      '  GLACCT_FY_ID = :OLD_GLACCT_FY_ID')
    Left = 40
    Top = 152
  end
  object updSQLBudget: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into GLBUDGET '
      
        '  (ID, glacct_fy_id, glperiods_id, budamount, budpercent, bud_ca' +
        'lc_amount, budgets_fy_id)'
      'values'
      
        '  (:GLBUDGET_ID, :glacct_fy_id, :GLPERIODS_ID, :BUDAMOUNT, :BUDP' +
        'ERCENT, :bud_calc_amount, :budgets_fy_id)'
      ''
      ''
      ''
      '')
    ModifySQL.Strings = (
      'update GLBUDGET'
      'set'
      '  BUDAMOUNT = :BUDAMOUNT,'
      '  BUDPERCENT = :BUDPERCENT,'
      '  glacct_fy_id = :glacct_fy_id,'
      '  glperiods_id = :glperiods_id,'
      '  bud_calc_amount = :bud_calc_amount,'
      '  budgets_fy_id = :budgets_fy_id'
      'where'
      '        ID = :GLBUDGET_ID'
      '')
    DeleteSQL.Strings = (
      'delete from GLBUDGET'
      'where'
      '  ID = :GLBUDGET_ID')
    Left = 144
    Top = 152
  end
  object QryBudgets: TFDQuery
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'select id, descrip || '#39' ('#39' || code || '#39')'#39' as descrip from budget' +
        's order by descrip || '#39'('#39' || code || '#39')'#39
      ' ')
    Left = 40
    Top = 208
    object QryBudgetsDESCRIP: TStringField
      DisplayLabel = 'Budget Name (Code)'
      DisplayWidth = 50
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 63
    end
    object QryBudgetsID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'ID'
      Visible = False
      Size = 0
    end
  end
  object SrcBudgets_fy: TDataSource
    DataSet = TblBudgets_fy
    Left = 136
    Top = 208
  end
  object TblBudgets_fy: TFDTable
    AfterPost = TblBudgets_fyAfterPost
    BeforeScroll = TblBudgets_fyBeforeScroll
    AfterScroll = TblBudgets_fyAfterScroll
    OnCalcFields = TblBudgets_fyCalcFields
    IndexFieldNames = 'GLACCT_FY_ID'
    MasterSource = SrcGLAcct_Budget
    MasterFields = 'GLACCT_FY_ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'BUDGETS_FY'
    TableName = 'BUDGETS_FY'
    Left = 136
    Top = 224
    object TblBudgets_fyYTDBUDGET: TBCDField
      DisplayLabel = 'Budget'
      DisplayWidth = 10
      FieldName = 'YTDBUDGET'
      Required = True
      currency = True
      Size = 2
    end
    object TblBudgets_fyBudget_Name: TStringField
      DisplayLabel = 'Budget Name'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'Budget_Name'
      LookupDataSet = QryBudgets
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIP'
      KeyFields = 'BUDGETS_ID'
      Lookup = True
    end
    object TblBudgets_fyPrevBudget: TFloatField
      DisplayLabel = 'Previous Budget'
      DisplayWidth = 13
      FieldKind = fkCalculated
      FieldName = 'PrevBudget'
      currency = True
      Calculated = True
    end
    object TblBudgets_fyPrevYTD: TFloatField
      DisplayLabel = 'Actual Budget'
      DisplayWidth = 11
      FieldKind = fkCalculated
      FieldName = 'PrevYTD'
      currency = True
      Calculated = True
    end
    object TblBudgets_fyPrevVar: TFloatField
      DisplayLabel = 'Variance'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'PrevVar'
      currency = True
      Calculated = True
    end
    object TblBudgets_fyBUD_CALC_AMOUNT: TBCDField
      DisplayLabel = 'Calculated Budget'
      DisplayWidth = 14
      FieldName = 'BUD_CALC_AMOUNT'
      ReadOnly = True
      currency = True
      Size = 2
    end
    object TblBudgets_fyID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object TblBudgets_fyGLACCT_FY_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'GLACCT_FY_ID'
      Visible = False
      Size = 0
    end
    object TblBudgets_fyBUDGETS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'BUDGETS_ID'
      Required = True
      Visible = False
      Size = 0
    end
    object TblBudgets_fySTATUS: TStringField
      DisplayWidth = 2
      FieldName = 'STATUS'
      Visible = False
      Size = 2
    end
  end
  object PkForeHead: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id as id,'
      '       name as name,'
      '       description as description,'
      '       start_date as start_date,'
      '       end_date as end_date,'
      
        '       decode( kind, '#39'P'#39', '#39'Production Forecast'#39',  '#39'S'#39', '#39'Sales An' +
        'alysis Forecast'#39', null ) as kind'
      '  from fore_head       ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 256
    Top = 224
    object PkForeHeadID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.FORE_HEAD.ID'
      Size = 0
    end
    object PkForeHeadNAME: TStringField
      DisplayLabel = 'Name'
      FieldName = 'NAME'
      Origin = 'IQ.FORE_HEAD.NAME'
      Size = 30
    end
    object PkForeHeadDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 50
      FieldName = 'DESCRIPTION'
      Origin = 'IQ.FORE_HEAD.DESCRIPTION'
      Size = 100
    end
    object PkForeHeadSTART_DATE: TDateTimeField
      DisplayLabel = 'Start Date'
      FieldName = 'START_DATE'
      Origin = 'IQ.FORE_HEAD.START_DATE'
    end
    object PkForeHeadEND_DATE: TDateTimeField
      DisplayLabel = 'End Date'
      FieldName = 'END_DATE'
      Origin = 'IQ.FORE_HEAD.END_DATE'
    end
    object PkForeHeadKIND: TStringField
      DisplayLabel = 'Kind'
      FieldName = 'KIND'
      Size = 23
    end
  end
  object TblGLBudget: TFDQuery
    BeforeInsert = TblGLBudgetBeforeInsert
    BeforeEdit = TblGLBudgetBeforeEdit
    AfterPost = TblGLBudgetAfterPost
    AfterDelete = TblGLBudgetAfterDelete
    OnCalcFields = TblGLBudgetCalcFields
    OnUpdateRecord = TblGLBudgetUpdateRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'GLBUDGET'
    UpdateOptions.KeyFields = 'GLBUDGET_ID'
    UpdateObject = updSQLBudget
    SQL.Strings = (
      'select glbudget_id,'
      '       glacct_fy_id,'
      '       glyear_id,'
      '       glacct_id,'
      '       glperiods_id,'
      '       budamount,'
      '       budpercent,'
      '       period,'
      '       period_start_date,'
      '       period_end_date,'
      '       bud_calc_amount,'
      '       budgets_id,'
      '       budgets_name,'
      '       budgets_fy_id'
      ' from V_GLBUDGET'
      'where BUDGETS_FY_ID = :AID'
      'order by period '
      ''
      ''
      ' '
      ' ')
    Left = 144
    Top = 104
    ParamData = <
      item
        Name = 'AID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object TblGLBudgetGLACCT_FY_ID: TBCDField
      FieldName = 'GLACCT_FY_ID'
      Origin = 'IQ.V_GLBUDGET.GLACCT_FY_ID'
      Size = 0
    end
    object TblGLBudgetGLYEAR_ID: TBCDField
      FieldName = 'GLYEAR_ID'
      Origin = 'IQ.V_GLBUDGET.GLYEAR_ID'
      Size = 0
    end
    object TblGLBudgetGLACCT_ID: TBCDField
      FieldName = 'GLACCT_ID'
      Origin = 'IQ.V_GLBUDGET.GLACCT_ID'
      Size = 0
    end
    object TblGLBudgetGLPERIODS_ID: TBCDField
      FieldName = 'GLPERIODS_ID'
      Origin = 'IQ.V_GLBUDGET.GLPERIODS_ID'
      Size = 0
    end
    object TblGLBudgetBUDAMOUNT: TBCDField
      FieldName = 'BUDAMOUNT'
      Origin = 'IQ.V_GLBUDGET.BUDAMOUNT'
      OnChange = TblGLBudgetBUDAMOUNTChange
      Size = 2
    end
    object TblGLBudgetBUDPERCENT: TBCDField
      FieldName = 'BUDPERCENT'
      Origin = 'IQ.V_GLBUDGET.BUDPERCENT'
      OnChange = TblGLBudgetBUDPERCENTChange
      Size = 2
    end
    object TblGLBudgetPERIOD: TBCDField
      FieldName = 'PERIOD'
      Origin = 'IQ.V_GLBUDGET.PERIOD'
      Size = 0
    end
    object TblGLBudgetPERIOD_START_DATE: TDateTimeField
      FieldName = 'PERIOD_START_DATE'
      Origin = 'IQ.V_GLBUDGET.PERIOD_START_DATE'
    end
    object TblGLBudgetPERIOD_END_DATE: TDateTimeField
      FieldName = 'PERIOD_END_DATE'
      Origin = 'IQ.V_GLBUDGET.PERIOD_END_DATE'
    end
    object TblGLBudgetBUD_CALC_AMOUNT: TBCDField
      FieldName = 'BUD_CALC_AMOUNT'
      Origin = 'IQ.V_GLBUDGET.BUD_CALC_AMOUNT'
      Size = 2
    end
    object TblGLBudgetBUDGETS_ID: TBCDField
      FieldName = 'BUDGETS_ID'
      Origin = 'IQ.V_GLBUDGET.BUDGETS_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object TblGLBudgetBUDGETS_NAME: TStringField
      FieldName = 'BUDGETS_NAME'
      Origin = 'IQ.V_GLBUDGET.BUDGETS_NAME'
      Size = 50
    end
    object TblGLBudgetBUDGETS_FY_ID: TBCDField
      FieldName = 'BUDGETS_FY_ID'
      Origin = 'IQ.V_GLBUDGET.BUDGETS_FY_ID'
      Size = 0
    end
    object TblGLBudgetPeriodActual: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PeriodActual'
      Calculated = True
    end
    object TblGLBudgetPeriodVariance: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PeriodVariance'
      Calculated = True
    end
    object TblGLBudgetGLBUDGET_ID: TBCDField
      FieldName = 'GLBUDGET_ID'
      Origin = 'IQ.V_GLBUDGET.GLBUDGET_ID'
      Size = 0
    end
  end
end
