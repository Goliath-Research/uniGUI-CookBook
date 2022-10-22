object Cust_DM: TCust_DM
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 585
  Width = 748
  object SrcArcusto: TDataSource
    DataSet = TblArcusto
    OnDataChange = SrcArcustoDataChange
    Left = 46
    Top = 10
  end
  object TblArcusto: TFDTable
    BeforeInsert = TblArcustoBeforeInsert
    BeforeEdit = TblArcustoBeforeEdit
    BeforePost = TblArcustoBeforePost
    AfterPost = TblArcustoAfterPost
    BeforeCancel = ConfirmCancel
    BeforeDelete = TblArcustoBeforeDelete
    AfterDelete = TblArcustoAfterDelete
    AfterScroll = TblArcustoAfterScroll
    AfterRefresh = TblArcustoAfterRefresh
    OnDeleteError = HandleError
    OnEditError = HandleError
    OnNewRecord = TblArcustoNewRecord
    OnPostError = HandleError
    Filtered = True
    OnFilterRecord = TblArcustoFilterRecord
    IndexName = 'PK_ARCUSTO'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'IQMS.ARCUSTO'
    TableName = 'IQMS.ARCUSTO'
    Left = 46
    Top = 27
    object TblArcustoID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object TblArcustoCUSTNO: TStringField
      DisplayLabel = 'Cust #'
      FieldName = 'CUSTNO'
      Required = True
      Size = 10
    end
    object TblArcustoCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Required = True
      Size = 60
    end
    object TblArcustoADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 30
      FieldName = 'ADDR1'
      Size = 60
    end
    object TblArcustoADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 30
      FieldName = 'ADDR2'
      Size = 60
    end
    object TblArcustoADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 30
      FieldName = 'ADDR3'
      Size = 60
    end
    object TblArcustoCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Size = 30
    end
    object TblArcustoSTATE: TStringField
      DisplayLabel = 'State'
      FieldName = 'STATE'
    end
    object TblArcustoZIP: TStringField
      DisplayLabel = 'Zip'
      FieldName = 'ZIP'
      Size = 10
    end
    object TblArcustoCOUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      Size = 30
    end
    object TblArcustoCUST_GROUP: TStringField
      DisplayLabel = 'Group'
      FieldName = 'CUST_GROUP'
      Size = 30
    end
    object TblArcustoPRIME_CONTACT: TStringField
      DisplayLabel = 'Contact'
      FieldName = 'PRIME_CONTACT'
      Size = 30
    end
    object TblArcustoPRIME_CONTACT_EMAIL: TStringField
      DisplayLabel = 'Contact Email'
      DisplayWidth = 35
      FieldName = 'PRIME_CONTACT_EMAIL'
      Size = 250
    end
    object TblArcustoPHONE_NUMBER: TStringField
      DisplayLabel = 'Phone'
      FieldName = 'PHONE_NUMBER'
      OnGetText = DoGetTelephoneText
      Size = 25
    end
    object TblArcustoEXT: TStringField
      DisplayLabel = 'Ext'
      FieldName = 'EXT'
      Size = 5
    end
    object TblArcustoFAX_NUMBER: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX_NUMBER'
      OnGetText = DoGetTelephoneText
      Size = 25
    end
    object TblArcustoINDUSTRY: TStringField
      DisplayLabel = 'Industry'
      FieldName = 'INDUSTRY'
    end
    object TblArcustoSOURCE: TStringField
      DisplayLabel = 'Source'
      FieldName = 'SOURCE'
      Size = 5
    end
    object TblArcustoSTATEMENTS: TStringField
      DisplayLabel = 'Statements'
      FieldName = 'STATEMENTS'
      Size = 1
    end
    object TblArcustoSTATUS_DATE: TDateTimeField
      DisplayLabel = 'Status Date'
      FieldName = 'STATUS_DATE'
      EditMask = '!99/99/0000;1; '
    end
    object TblArcustoCUST_SINCE: TDateTimeField
      DisplayLabel = 'Since'
      FieldName = 'CUST_SINCE'
      EditMask = '!99/99/0000;1; '
    end
    object TblArcustoCREDIT_LIMIT: TBCDField
      DisplayLabel = 'Credit Limit'
      FieldName = 'CREDIT_LIMIT'
      Size = 2
    end
    object TblArcustoYTD_SALES: TBCDField
      DisplayLabel = 'YTD Sales'
      FieldName = 'YTD_SALES'
      Size = 2
    end
    object TblArcustoFINANCE_CHARGE: TStringField
      DisplayLabel = 'FinCharge'
      FieldName = 'FINANCE_CHARGE'
      Size = 1
    end
    object TblArcustoTERRITORY: TStringField
      DisplayLabel = 'Territory'
      FieldName = 'TERRITORY'
      Size = 5
    end
    object TblArcustoCOMM_PCNT: TFMTBCDField
      DisplayLabel = 'Comm%'
      FieldName = 'COMM_PCNT'
      Size = 6
    end
    object TblArcustoCUSER1: TStringField
      DisplayLabel = 'Note 1'
      FieldName = 'CUSER1'
      Size = 60
    end
    object TblArcustoCUSER2: TStringField
      DisplayLabel = 'Note 2'
      FieldName = 'CUSER2'
      Size = 60
    end
    object TblArcustoCUSER3: TStringField
      DisplayLabel = 'Note 3'
      FieldName = 'CUSER3'
      Size = 60
    end
    object TblArcustoNUSER1: TFMTBCDField
      DisplayLabel = 'Value 1'
      FieldName = 'NUSER1'
      Size = 6
    end
    object TblArcustoNUSER2: TFMTBCDField
      DisplayLabel = 'Value 2'
      FieldName = 'NUSER2'
      Size = 6
    end
    object TblArcustoNUSER3: TFMTBCDField
      DisplayLabel = 'Value 3'
      FieldName = 'NUSER3'
      Size = 6
    end
    object TblArcustoTER_ID: TBCDField
      FieldName = 'TER_ID'
      Size = 0
    end
    object TblArcustoTERMS_ID: TBCDField
      FieldName = 'TERMS_ID'
      Size = 0
    end
    object TblArcustoTerms: TStringField
      FieldKind = fkCalculated
      FieldName = 'Terms'
      LookupDataSet = TblTerms
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIPTION'
      KeyFields = 'TERMS_ID'
      Calculated = True
    end
    object TblArcustoTax_Code: TStringField
      FieldKind = fkCalculated
      FieldName = 'Tax_Code'
      LookupDataSet = QryTaxCodes
      LookupKeyFields = 'ID'
      LookupResultField = 'TAX_CODE'
      KeyFields = 'TAX_CODES_ID'
      Calculated = True
    end
    object TblArcustoSalesPerson: TStringField
      FieldKind = fkCalculated
      FieldName = 'SalesPerson'
      LookupDataSet = TblSalesPeople
      LookupKeyFields = 'ID'
      LookupResultField = 'FIRST_NAME'
      KeyFields = 'SALESPEOPLE_ID'
      Calculated = True
    end
    object TblArcustoTAX_CODES_ID: TBCDField
      FieldName = 'TAX_CODES_ID'
      Size = 0
    end
    object TblArcustoSALESPEOPLE_ID: TBCDField
      FieldName = 'SALESPEOPLE_ID'
      Size = 0
    end
    object TblArcustoNOTE: TStringField
      FieldName = 'NOTE'
      Size = 2000
    end
    object TblArcustoDISCOUNT: TBCDField
      FieldName = 'DISCOUNT'
      Size = 2
    end
    object TblArcustoSTATUS_ID: TStringField
      FieldName = 'STATUS_ID'
    end
    object TblArcustoCUSER4: TStringField
      FieldName = 'CUSER4'
      Size = 60
    end
    object TblArcustoCUSER5: TStringField
      FieldName = 'CUSER5'
      Size = 60
    end
    object TblArcustoCUSER6: TStringField
      FieldName = 'CUSER6'
      Size = 60
    end
    object TblArcustoNUSER4: TFMTBCDField
      FieldName = 'NUSER4'
      Size = 6
    end
    object TblArcustoNUSER5: TFMTBCDField
      FieldName = 'NUSER5'
      Size = 6
    end
    object TblArcustoCUST_TYPE_ID: TBCDField
      FieldName = 'CUST_TYPE_ID'
      Size = 0
    end
    object TblArcustoCURRENCY_ID: TBCDField
      FieldName = 'CURRENCY_ID'
      Size = 0
    end
    object TblArcustoAUTOINVOICE_TECHNIQUE: TStringField
      FieldName = 'AUTOINVOICE_TECHNIQUE'
      Size = 50
    end
    object TblArcustoPS_DATE_ON_INVOICE: TStringField
      FieldName = 'PS_DATE_ON_INVOICE'
      Size = 1
    end
    object TblArcustoCOMMISSIONS_ID: TBCDField
      FieldName = 'COMMISSIONS_ID'
      OnChange = TblArcustoCOMMISSIONS_IDChange
      Size = 0
    end
    object TblArcustoCommission: TStringField
      FieldKind = fkCalculated
      FieldName = 'Commission'
      LookupDataSet = QryCommissions
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIP'
      KeyFields = 'COMMISSIONS_ID'
      Calculated = True
    end
    object TblArcustoUSE_USA_MASK: TStringField
      FieldName = 'USE_USA_MASK'
      Size = 1
    end
    object TblArcustoSTATEMENT_DATE: TBCDField
      FieldName = 'STATEMENT_DATE'
      Size = 0
    end
    object TblArcustoLAST_FINANCE_CHARGE_DATE: TDateTimeField
      FieldName = 'LAST_FINANCE_CHARGE_DATE'
    end
    object TblArcustoMIN_CHANGE_INTERVAL: TBCDField
      FieldName = 'MIN_CHANGE_INTERVAL'
      Size = 0
    end
    object TblArcustoPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      FixedChar = True
      Size = 1
    end
    object TblArcustoWEB_SITE_URL: TStringField
      FieldName = 'WEB_SITE_URL'
      Size = 255
    end
    object TblArcustoCRM_PROSPECT: TStringField
      FieldName = 'CRM_PROSPECT'
      FixedChar = True
      Size = 1
    end
    object TblArcustoONE_PO_PER_PS: TStringField
      FieldName = 'ONE_PO_PER_PS'
      FixedChar = True
      Size = 1
    end
    object TblArcustoOVERLAY_LABEL_REPORT: TStringField
      FieldName = 'OVERLAY_LABEL_REPORT'
      Size = 50
    end
    object TblArcustoBEFORE_OVERLAY_LABEL_REPORT: TStringField
      FieldName = 'BEFORE_OVERLAY_LABEL_REPORT'
      Size = 50
    end
    object TblArcustoSAFETY_LEAD_TIME: TBCDField
      FieldName = 'SAFETY_LEAD_TIME'
      Size = 0
    end
    object TblArcustoSHIP_FORECAST: TStringField
      FieldName = 'SHIP_FORECAST'
      FixedChar = True
      Size = 1
    end
    object TblArcustoQTY_PRICE_BREAK: TFMTBCDField
      FieldName = 'QTY_PRICE_BREAK'
      Size = 6
    end
    object TblArcustoPACKSLIP_REPORT: TStringField
      FieldName = 'PACKSLIP_REPORT'
      Size = 250
    end
    object TblArcustoORD_ACK_REPORT: TStringField
      FieldName = 'ORD_ACK_REPORT'
      Size = 250
    end
    object TblArcustoINVOICE_REPORT: TStringField
      FieldName = 'INVOICE_REPORT'
      Size = 250
    end
    object TblArcustoQLETTER_REPORT: TStringField
      FieldName = 'QLETTER_REPORT'
      Size = 250
    end
    object TblArcustoTL_RFQ_REPORT: TStringField
      FieldName = 'TL_RFQ_REPORT'
      Size = 250
    end
    object TblArcustoBOL_REPORT: TStringField
      FieldName = 'BOL_REPORT'
      Size = 250
    end
    object TblArcustoBOL_HEADER_REPORT: TStringField
      FieldName = 'BOL_HEADER_REPORT'
      Size = 250
    end
    object TblArcustoJOBSHOP_REPORT: TStringField
      FieldName = 'JOBSHOP_REPORT'
      Size = 250
    end
    object TblArcustoONE_SO_PER_PS: TStringField
      FieldName = 'ONE_SO_PER_PS'
      FixedChar = True
      Size = 1
    end
    object TblArcustoAR_GLACCT_ID: TBCDField
      FieldName = 'AR_GLACCT_ID'
      Size = 0
    end
    object TblArcustoAracct: TStringField
      FieldKind = fkCalculated
      FieldName = 'Aracct'
      LookupDataSet = QryGlAcct
      LookupKeyFields = 'ID'
      LookupResultField = 'ACCT'
      KeyFields = 'AR_GLACCT_ID'
      Calculated = True
    end
    object TblArcustoDUNNING_GROUP_ID: TBCDField
      FieldName = 'DUNNING_GROUP_ID'
      Size = 0
    end
    object TblArcustoDUNNING_EXCLUDE: TStringField
      FieldName = 'DUNNING_EXCLUDE'
      FixedChar = True
      Size = 1
    end
    object TblArcustoPS_PRESERVE_RAN: TStringField
      FieldName = 'PS_PRESERVE_RAN'
      FixedChar = True
      Size = 1
    end
    object TblArcustoCOC_REQUIRED: TStringField
      FieldName = 'COC_REQUIRED'
      FixedChar = True
      Size = 1
    end
    object TblArcustoTRAILER_OVER_MAX_INSTRUCTIONS: TStringField
      FieldName = 'TRAILER_OVER_MAX_INSTRUCTIONS'
      Size = 50
    end
    object TblArcustoTRAILER_MAX_LENGTH: TFMTBCDField
      FieldName = 'TRAILER_MAX_LENGTH'
      Size = 6
    end
    object TblArcustoPALLET_MAX_HEIGHT: TFMTBCDField
      FieldName = 'PALLET_MAX_HEIGHT'
      Size = 6
    end
    object TblArcustoPALLET_MIN_HEIGHT: TFMTBCDField
      FieldName = 'PALLET_MIN_HEIGHT'
      Size = 6
    end
    object TblArcustoIS_OVERHANG_ALLOWED: TStringField
      FieldName = 'IS_OVERHANG_ALLOWED'
      Size = 1
    end
    object TblArcustoPALLET_OVERHANG_LIMIT: TFMTBCDField
      FieldName = 'PALLET_OVERHANG_LIMIT'
      Size = 6
    end
    object TblArcustoPALLET_SIZE_REQUIRED: TStringField
      FieldName = 'PALLET_SIZE_REQUIRED'
      Size = 10
    end
    object TblArcustoPALLET_GRADE_REQUIRED: TStringField
      FieldName = 'PALLET_GRADE_REQUIRED'
      Size = 10
    end
    object TblArcustoPALLET_MAX_FLOOR_SPACES: TFMTBCDField
      FieldName = 'PALLET_MAX_FLOOR_SPACES'
      Size = 6
    end
    object TblArcustoPALLET_MAX_WEIGHT: TFMTBCDField
      FieldName = 'PALLET_MAX_WEIGHT'
      Size = 6
    end
    object TblArcustoIS_PALLET_LABELS_REQUIRED: TStringField
      FieldName = 'IS_PALLET_LABELS_REQUIRED'
      Size = 1
    end
    object TblArcustoPALLET_LABEL_PLACEMENT: TStringField
      FieldName = 'PALLET_LABEL_PLACEMENT'
    end
    object TblArcustoCARTON_MAX_HEIGHT: TFMTBCDField
      FieldName = 'CARTON_MAX_HEIGHT'
      Size = 6
    end
    object TblArcustoCARTON_MAX_LENGTH: TFMTBCDField
      FieldName = 'CARTON_MAX_LENGTH'
      Size = 6
    end
    object TblArcustoCARTON_MAX_WIDTH: TFMTBCDField
      FieldName = 'CARTON_MAX_WIDTH'
      Size = 6
    end
    object TblArcustoIS_FLOOR_LOADING_ALLOWED: TStringField
      FieldName = 'IS_FLOOR_LOADING_ALLOWED'
      Size = 1
    end
    object TblArcustoCARTON_MAX_FLOOR_LOADING: TFMTBCDField
      FieldName = 'CARTON_MAX_FLOOR_LOADING'
      Size = 6
    end
    object TblArcustoIS_ROUTING_REQUIRED: TStringField
      FieldName = 'IS_ROUTING_REQUIRED'
      Size = 1
    end
    object TblArcustoROUTING_TIME_DEADLINE: TDateTimeField
      FieldName = 'ROUTING_TIME_DEADLINE'
      DisplayFormat = 'hh:nn'
      EditMask = '!00:00>LL;1;_'
    end
    object TblArcustoSHIP_TO_PRIORITIZED: TStringField
      FieldName = 'SHIP_TO_PRIORITIZED'
      Size = 1
    end
    object TblArcustoTRAILER_MIN_CUBE: TFMTBCDField
      FieldName = 'TRAILER_MIN_CUBE'
      Size = 6
    end
    object TblArcustoTRAILER_MAX_CUBE: TFMTBCDField
      FieldName = 'TRAILER_MAX_CUBE'
      Size = 6
    end
    object TblArcustoPALLET_TYPE: TStringField
      FieldName = 'PALLET_TYPE'
    end
    object TblArcustoCARTON_LABELS_REQUIRED: TStringField
      FieldName = 'CARTON_LABELS_REQUIRED'
      Size = 1
    end
    object TblArcustoCARTON_LABEL_TYPE: TStringField
      FieldName = 'CARTON_LABEL_TYPE'
    end
    object TblArcustoCARTON_LABEL_SIZE: TStringField
      FieldName = 'CARTON_LABEL_SIZE'
    end
    object TblArcustoCARTON_LABEL_PLACEMENT: TStringField
      FieldName = 'CARTON_LABEL_PLACEMENT'
    end
    object TblArcustoPOSTED_INVOICE_REPORT: TStringField
      FieldName = 'POSTED_INVOICE_REPORT'
      Size = 250
    end
    object TblArcustoCOC_REPORT: TStringField
      FieldName = 'COC_REPORT'
      Size = 250
    end
    object TblArcustoUSE_DISCOUNT_TIER: TStringField
      FieldName = 'USE_DISCOUNT_TIER'
      Size = 1
    end
    object TblArcustoIS_MAKE_TO_ORDER: TStringField
      FieldName = 'IS_MAKE_TO_ORDER'
      Size = 1
    end
    object TblArcustoEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object TblArcustoTRACKING_REQUIRED: TStringField
      FieldName = 'TRACKING_REQUIRED'
      Visible = False
      Size = 1
    end
    object TblArcustoPS_CONVERT_INFO: TStringField
      FieldName = 'PS_CONVERT_INFO'
      Visible = False
      Size = 2000
    end
    object TblArcustoTAX_ID: TStringField
      DisplayLabel = 'Tax Identification #'
      FieldName = 'TAX_ID'
      Visible = False
    end
    object TblArcustoBOL_ALL_PS_REPORT: TStringField
      FieldName = 'BOL_ALL_PS_REPORT'
      Visible = False
      Size = 250
    end
    object TblArcustoCRM_QUOTE_REPORT: TStringField
      FieldName = 'CRM_QUOTE_REPORT'
      Size = 50
    end
    object TblArcustoREBATE_PARAMS_ID: TBCDField
      FieldName = 'REBATE_PARAMS_ID'
      Size = 0
    end
    object TblArcustoRebateParam: TStringField
      FieldKind = fkCalculated
      FieldName = 'RebateParam'
      Size = 100
      Calculated = True
    end
    object TblArcustoWEB_PAYMENT_TYPE: TStringField
      DisplayLabel = 'Web Payment Type'
      FieldName = 'WEB_PAYMENT_TYPE'
      Size = 15
    end
    object TblArcustoREF_TYPE: TStringField
      FieldName = 'REF_TYPE'
      Size = 15
    end
    object TblArcustoCSR_PR_EMP_ID: TBCDField
      FieldName = 'CSR_PR_EMP_ID'
      Size = 0
    end
    object TblArcustoAR_PR_EMP_ID: TBCDField
      FieldName = 'AR_PR_EMP_ID'
      Size = 0
    end
    object TblArcustocsr_emp_name: TStringField
      FieldKind = fkCalculated
      FieldName = 'csr_emp_name'
      Size = 50
      Calculated = True
    end
    object TblArcustoar_emp_name: TStringField
      FieldKind = fkCalculated
      FieldName = 'ar_emp_name'
      Size = 50
      Calculated = True
    end
    object TblArcustoCurrency: TStringField
      FieldKind = fkCalculated
      FieldName = 'Currency'
      Calculated = True
    end
    object TblArcustoTier: TStringField
      FieldKind = fkCalculated
      FieldName = 'Tier'
      Calculated = True
    end
    object TblArcustoCC_RETENTION_DAYS: TBCDField
      FieldName = 'CC_RETENTION_DAYS'
      Size = 0
    end
    object TblArcustoDROP_SHIP_VENDOR_ID: TBCDField
      FieldName = 'DROP_SHIP_VENDOR_ID'
      Visible = False
      Size = 0
    end
    object TblArcustoDropShipVendorDisp: TStringField
      FieldKind = fkCalculated
      FieldName = 'DropShipVendorDisp'
      Visible = False
      Size = 60
      Calculated = True
    end
    object TblArcustoUSE_EXTERNAL_LABELS: TStringField
      FieldName = 'USE_EXTERNAL_LABELS'
      Size = 1
    end
    object TblArcustoPS_VERIFY_INVENTORY: TStringField
      FieldName = 'PS_VERIFY_INVENTORY'
      Visible = False
      Size = 1
    end
    object TblArcustoCOMMER_INVOICE_REQUIRED: TStringField
      FieldName = 'COMMER_INVOICE_REQUIRED'
      Visible = False
      Size = 1
    end
    object TblArcustoCOMMER_INVOICE_REPORT: TStringField
      FieldName = 'COMMER_INVOICE_REPORT'
      Visible = False
      Size = 50
    end
    object TblArcustoINFO_SO: TStringField
      FieldName = 'INFO_SO'
      Size = 2000
    end
    object TblArcustoINFO_CR: TStringField
      FieldName = 'INFO_CR'
      Size = 2000
    end
    object TblArcustoINFO_AR: TStringField
      FieldName = 'INFO_AR'
      Size = 2000
    end
    object TblArcustoTERRITORY_ID: TBCDField
      FieldName = 'TERRITORY_ID'
      Size = 0
    end
    object TblArcustoTerritoryCode: TStringField
      FieldKind = fkCalculated
      FieldName = 'TerritoryCode'
      Size = 50
      Calculated = True
    end
    object TblArcustoCRM_OPPORTUNITY_ID: TBCDField
      FieldName = 'CRM_OPPORTUNITY_ID'
      Size = 0
    end
    object TblArcustoCRMOpportunityNo: TStringField
      FieldKind = fkCalculated
      FieldName = 'CRMOpportunityNo'
      Size = 10
      Calculated = True
    end
    object TblArcustoSalesStageCode: TStringField
      FieldKind = fkCalculated
      FieldName = 'SalesStageCode'
      Size = 10
      Calculated = True
    end
    object TblArcustoSIC_CODE: TStringField
      FieldName = 'SIC_CODE'
    end
    object TblArcustoFREIGHT_ID: TBCDField
      FieldName = 'FREIGHT_ID'
      Size = 0
    end
    object TblArcustoACCOUNT_NUMBER: TStringField
      FieldName = 'ACCOUNT_NUMBER'
      Size = 50
    end
    object TblArcustoFreightDescrip: TStringField
      FieldKind = fkCalculated
      FieldName = 'FreightDescrip'
      Size = 60
      Calculated = True
    end
    object TblArcustoREF_CODE_ID: TBCDField
      FieldName = 'REF_CODE_ID'
      Size = 0
    end
    object TblArcustoRefCodeDescrip: TStringField
      FieldKind = fkCalculated
      FieldName = 'RefCodeDescrip'
      Size = 100
      Calculated = True
    end
    object TblArcustoRefCodeCode: TStringField
      FieldKind = fkCalculated
      FieldName = 'RefCodeCode'
      Calculated = True
    end
    object TblArcustoCASH_IN_ADVANCE: TStringField
      FieldName = 'CASH_IN_ADVANCE'
      Size = 1
    end
    object TblArcustoECODE: TStringField
      FieldName = 'ECODE'
      Size = 10
    end
    object TblArcustoEID: TBCDField
      FieldName = 'EID'
      Size = 0
    end
    object TblArcustoEDATE_TIME: TDateTimeField
      FieldName = 'EDATE_TIME'
    end
    object TblArcustoECOPY: TStringField
      FieldName = 'ECOPY'
      FixedChar = True
      Size = 1
    end
    object TblArcustoGLYEAR_ID: TBCDField
      FieldName = 'GLYEAR_ID'
      Size = 0
    end
    object TblArcustoHIGHEST_BAL_BUCKET: TBCDField
      FieldName = 'HIGHEST_BAL_BUCKET'
      Size = 2
    end
    object TblArcustoALERTMSG: TStringField
      FieldName = 'ALERTMSG'
      Size = 255
    end
    object TblArcustoDISTLIST: TStringField
      FieldName = 'DISTLIST'
      FixedChar = True
      Size = 1
    end
    object TblArcustoIS_INTERCOMP: TStringField
      FieldName = 'IS_INTERCOMP'
      FixedChar = True
      Size = 1
    end
    object TblArcustoVENDOR_ID_OUTSOURCE: TBCDField
      FieldName = 'VENDOR_ID_OUTSOURCE'
      Size = 0
    end
    object TblArcustoCUST_CREDIT_DAYS: TBCDField
      FieldName = 'CUST_CREDIT_DAYS'
      Size = 0
    end
    object TblArcustoCUST_CREDIT_INCL_SHIP: TStringField
      FieldName = 'CUST_CREDIT_INCL_SHIP'
      Size = 1
    end
    object TblArcustoCUST_CREDIT_INCL_SO: TStringField
      FieldName = 'CUST_CREDIT_INCL_SO'
      Size = 1
    end
    object TblArcustoCREDIT_LIMIT_AUTOCALC: TStringField
      FieldName = 'CREDIT_LIMIT_AUTOCALC'
      Size = 1
    end
    object TblArcustoCREATED: TDateTimeField
      FieldName = 'CREATED'
    end
    object TblArcustoCREATEDBY: TStringField
      FieldName = 'CREATEDBY'
      Size = 30
    end
    object TblArcustoCHANGED: TDateTimeField
      FieldName = 'CHANGED'
    end
    object TblArcustoCHANGEDBY: TStringField
      FieldName = 'CHANGEDBY'
      Size = 30
    end
    object TblArcustoWEBUSER_NAME: TStringField
      FieldName = 'WEBUSER_NAME'
      Size = 255
    end
    object TblArcustoWEBUSER_LOG: TStringField
      FieldName = 'WEBUSER_LOG'
      Size = 40
    end
    object TblArcustoARCUSTO_LEVEL_ID: TBCDField
      FieldName = 'ARCUSTO_LEVEL_ID'
      Size = 0
    end
    object TblArcustoCREDIT_LIMIT_AUTO_UPDATE: TStringField
      FieldName = 'CREDIT_LIMIT_AUTO_UPDATE'
      Size = 1
    end
    object TblArcustoCREDIT_LIMIT_PAST_DUE_DAYS: TBCDField
      FieldName = 'CREDIT_LIMIT_PAST_DUE_DAYS'
      Size = 0
    end
    object TblArcustoHYPERLINK: TStringField
      FieldName = 'HYPERLINK'
      Size = 250
    end
    object TblArcustoHYPERLINKADDRESS: TStringField
      FieldName = 'HYPERLINKADDRESS'
      Size = 250
    end
    object TblArcustoHYPERLINKSUBADDRESS: TStringField
      FieldName = 'HYPERLINKSUBADDRESS'
      Size = 250
    end
    object TblArcustoOVERSHIP: TBCDField
      DisplayLabel = 'Overship %'
      FieldName = 'OVERSHIP'
      Size = 2
    end
    object TblArcustoUNDERSHIP: TBCDField
      DisplayLabel = 'Undership %'
      FieldName = 'UNDERSHIP'
      Size = 2
    end
    object TblArcustoUSE_DISCOUNT_PARAMS: TStringField
      FieldName = 'USE_DISCOUNT_PARAMS'
      Size = 1
    end
    object TblArcustoVAT_TAX_NO: TStringField
      FieldName = 'VAT_TAX_NO'
      Size = 22
    end
    object TblArcustoUsageTypeDescrip: TStringField
      DisplayWidth = 255
      FieldKind = fkCalculated
      FieldName = 'UsageTypeCode'
      Size = 255
      Calculated = True
    end
    object TblArcustoARCUSTO_USAGE_TYPE_ID: TBCDField
      FieldName = 'ARCUSTO_USAGE_TYPE_ID'
      Origin = 'ARCUSTO_USAGE_TYPE_ID'
      Precision = 15
      Size = 0
    end
    object TblArcustoSHIP_COMPLETE: TStringField
      FieldName = 'SHIP_COMPLETE'
      Origin = 'SHIP_COMPLETE'
      Visible = False
      Size = 1
    end
    object TblArcustoTAX_EXEMPT_NUM: TStringField
      FieldName = 'TAX_EXEMPT_NUM'
      Size = 25
    end
    object TblArcustoREV_DISC_ORDER: TStringField
      FieldName = 'REV_DISC_ORDER'
      Origin = 'REV_DISC_ORDER'
      Size = 1
    end
    object TblArcustoCOUNTRY_ID: TBCDField
      FieldName = 'COUNTRY_ID'
      Origin = 'COUNTRY_ID'
      Precision = 15
      Size = 0
    end
    object TblArcustoSTATE_ID: TBCDField
      FieldName = 'STATE_ID'
      Origin = 'STATE_ID'
      Precision = 15
      Size = 0
    end
    object TblArcustoCountryCode2Chr: TStringField
      FieldKind = fkCalculated
      FieldName = 'CountryCode2Chr'
      Visible = False
      Size = 2
      Calculated = True
    end
  end
  object SrcContact: TDataSource
    DataSet = TblContact
    OnDataChange = SrcContactDataChange
    Left = 130
    Top = 10
  end
  object TblContact: TFDTable
    BeforeOpen = TblContactBeforeOpen
    BeforeInsert = PostParentsBeforeEdit
    BeforeEdit = TblContactBeforeEdit
    BeforePost = TblContactBeforePost
    AfterPost = TblContactAfterPost
    BeforeCancel = ConfirmCancel
    AfterDelete = TblContactAfterDelete
    OnCalcFields = TblContactCalcFields
    OnDeleteError = HandleError
    OnEditError = HandleError
    OnNewRecord = TblContactNewRecord
    OnPostError = HandleError
    Filtered = True
    IndexFieldNames = 'ARCUSTO_ID'
    MasterSource = SrcArcusto
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereChanged
    UpdateOptions.UpdateTableName = 'IQMS.CONTACT'
    TableName = 'IQMS.CONTACT'
    Left = 130
    Top = 27
    object TblContactFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 30
      FieldName = 'FIRST_NAME'
      Size = 30
    end
    object TblContactLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 30
      FieldName = 'LAST_NAME'
      Size = 30
    end
    object TblContactTITLE: TStringField
      DisplayLabel = 'Title'
      DisplayWidth = 60
      FieldName = 'TITLE'
      Size = 60
    end
    object TblContactSALUTATION: TStringField
      DisplayLabel = 'Salutation'
      DisplayWidth = 9
      FieldName = 'SALUTATION'
      Size = 5
    end
    object TblContactPHONE_NUMBER: TStringField
      DisplayLabel = 'Telephone'
      DisplayWidth = 25
      FieldName = 'PHONE_NUMBER'
      OnGetText = TblContactPHONE_NUMBERGetText
      Size = 25
    end
    object TblContactEXT: TStringField
      DisplayLabel = 'Extension'
      DisplayWidth = 7
      FieldName = 'EXT'
      Size = 5
    end
    object TblContactFAX_NUMBER: TStringField
      DisplayLabel = 'Fax'
      DisplayWidth = 25
      FieldName = 'FAX_NUMBER'
      OnGetText = TblContactPHONE_NUMBERGetText
      Size = 25
    end
    object TblContactPAGER: TStringField
      DisplayLabel = 'Pager'
      DisplayWidth = 12
      FieldName = 'PAGER'
      OnGetText = DoGetTelephoneText
      Size = 25
    end
    object TblContactMOBILE: TStringField
      DisplayLabel = 'Mobile'
      DisplayWidth = 25
      FieldName = 'MOBILE'
      OnGetText = DoGetTelephoneText
      Size = 25
    end
    object TblContactEMAIL: TStringField
      DisplayLabel = 'E-mail'
      DisplayWidth = 250
      FieldName = 'EMAIL'
      Size = 255
    end
    object TblContactDEPARTMENT: TStringField
      DisplayLabel = 'Department'
      DisplayWidth = 30
      FieldName = 'DEPARTMENT'
      Size = 30
    end
    object TblContactDEFAULT_CONTACT: TStringField
      DisplayLabel = 'Default?'
      DisplayWidth = 6
      FieldName = 'DEFAULT_CONTACT'
      FixedChar = True
      Size = 1
    end
    object TblContactCUSER1: TStringField
      DisplayLabel = 'User 1'
      DisplayWidth = 60
      FieldName = 'CUSER1'
      Size = 60
    end
    object TblContactCUSER2: TStringField
      DisplayLabel = 'User 2'
      DisplayWidth = 60
      FieldName = 'CUSER2'
      Size = 60
    end
    object TblContactCUSER3: TStringField
      DisplayLabel = 'User 3'
      DisplayWidth = 60
      FieldName = 'CUSER3'
      Size = 60
    end
    object TblContactCUSER4: TStringField
      DisplayLabel = 'User 4'
      DisplayWidth = 60
      FieldName = 'CUSER4'
      Size = 60
    end
    object TblContactSOURCE: TStringField
      DisplayLabel = 'Source'
      DisplayWidth = 50
      FieldName = 'SOURCE'
      ReadOnly = True
      Size = 50
    end
    object TblContactARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object TblContactCONTACT_TYPE: TStringField
      DisplayLabel = 'Contact Type'
      FieldName = 'CONTACT_TYPE'
      Visible = False
      Size = 5
    end
    object TblContactCONTACT_SEQNO: TBCDField
      FieldName = 'CONTACT_SEQNO'
      Visible = False
      Size = 0
    end
    object TblContactID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object TblContactUSE_USA_MASK: TStringField
      DisplayWidth = 1
      FieldName = 'USE_USA_MASK'
      Visible = False
      Size = 1
    end
    object TblContactWEB_USERID: TStringField
      DisplayWidth = 35
      FieldName = 'WEB_USERID'
      Visible = False
      Size = 35
    end
    object TblContactBILL_TO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'BILL_TO_ID'
      Visible = False
      Size = 0
    end
    object TblContactSHIP_TO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SHIP_TO_ID'
      Visible = False
      Size = 0
    end
    object TblContactAUTO_EFORM_PS: TStringField
      DisplayLabel = 'Auto EForm PS'
      FieldName = 'AUTO_EFORM_PS'
      Size = 1
    end
    object TblContactAUTO_EFORM_AR: TStringField
      DisplayLabel = 'Auto EForm Invoice'
      FieldName = 'AUTO_EFORM_AR'
      Size = 1
    end
    object TblContactAUTO_EFORM_ORD_ACK: TStringField
      DisplayLabel = 'Auto EForm Ord Ack'
      FieldName = 'AUTO_EFORM_ORD_ACK'
      Size = 1
    end
    object TblContactAUTO_EFORM_BOL: TStringField
      DisplayLabel = 'Auto EForm BOL'
      FieldName = 'AUTO_EFORM_BOL'
      Size = 1
    end
    object TblContactCUSER5: TStringField
      FieldName = 'CUSER5'
      Size = 60
    end
    object TblContactCUSER6: TStringField
      FieldName = 'CUSER6'
      Size = 60
    end
    object TblContactCUSER7: TStringField
      FieldName = 'CUSER7'
      Size = 60
    end
    object TblContactCUSER8: TStringField
      FieldName = 'CUSER8'
      Size = 60
    end
    object TblContactCUSER9: TStringField
      FieldName = 'CUSER9'
      Size = 60
    end
    object TblContactNUSER1: TFMTBCDField
      FieldName = 'NUSER1'
      Size = 6
    end
    object TblContactNUSER2: TFMTBCDField
      FieldName = 'NUSER2'
      Size = 6
    end
    object TblContactNUSER3: TFMTBCDField
      FieldName = 'NUSER3'
      Size = 6
    end
    object TblContactNUSER4: TFMTBCDField
      FieldName = 'NUSER4'
      Size = 6
    end
    object TblContactNUSER5: TFMTBCDField
      FieldName = 'NUSER5'
      Size = 6
    end
    object TblContactNUSER6: TFMTBCDField
      FieldName = 'NUSER6'
      Size = 6
    end
    object TblContactNUSER7: TFMTBCDField
      FieldName = 'NUSER7'
      Size = 6
    end
    object TblContactNUSER8: TFMTBCDField
      FieldName = 'NUSER8'
      Size = 6
    end
    object TblContactNUSER9: TFMTBCDField
      FieldName = 'NUSER9'
      Size = 6
    end
    object TblContactAUTO_EFORM_CS: TStringField
      FieldName = 'AUTO_EFORM_CS'
      Size = 1
    end
    object TblContactPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Size = 1
    end
    object TblContactADDR1: TStringField
      FieldName = 'ADDR1'
      Size = 60
    end
    object TblContactADDR2: TStringField
      FieldName = 'ADDR2'
      Size = 60
    end
    object TblContactADDR3: TStringField
      FieldName = 'ADDR3'
      Size = 60
    end
    object TblContactCITY: TStringField
      FieldName = 'CITY'
      Size = 30
    end
    object TblContactSTATE: TStringField
      FieldName = 'STATE'
    end
    object TblContactZIP: TStringField
      FieldName = 'ZIP'
      Size = 10
    end
    object TblContactAUTO_EFORM_ORD_ACK_CONTACT: TStringField
      DisplayLabel = 'Auto EForm Ord Ack - Order Contact'
      FieldName = 'AUTO_EFORM_ORD_ACK_CONTACT'
      Size = 1
    end
    object TblContactCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Size = 30
    end
    object TblContactVERIFIED_DATE: TDateTimeField
      DisplayLabel = 'Verification Date'
      FieldName = 'VERIFIED_DATE'
    end
    object TblContactEMAIL_DUNNING: TStringField
      DisplayLabel = 'Email Dunning'
      FieldName = 'EMAIL_DUNNING'
      Size = 1
    end
    object TblContactAUTO_EFORM_SPC: TStringField
      DisplayLabel = 'Auto EForm SPC'
      FieldName = 'AUTO_EFORM_SPC'
      Size = 1
    end
    object TblContactWEB_USERLOG: TStringField
      FieldName = 'WEB_USERLOG'
      Size = 40
    end
    object TblContactAUTO_EFORM_COC: TStringField
      FieldName = 'AUTO_EFORM_COC'
      Visible = False
      Size = 1
    end
    object TblContactSOURCE_ID: TBCDField
      FieldName = 'SOURCE_ID'
      Size = 0
    end
    object TblContactAUTO_EFORM_PS_ORD_CONTACT: TStringField
      DisplayLabel = 'Auto EForm PS Sales Order Contact'
      FieldName = 'AUTO_EFORM_PS_ORD_CONTACT'
      Size = 1
    end
    object TblContactEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object TblContactEPlantName: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'EPlantName'
      Size = 30
      Calculated = True
    end
    object TblContactCOUNTRY_ID: TBCDField
      FieldName = 'COUNTRY_ID'
      Origin = 'COUNTRY_ID'
      Precision = 15
      Size = 0
    end
    object TblContactSTATE_ID: TBCDField
      FieldName = 'STATE_ID'
      Origin = 'STATE_ID'
      Precision = 15
      Size = 0
    end
  end
  object SrcShip_to: TDataSource
    DataSet = QryShipTo
    OnDataChange = SrcShip_toDataChange
    Left = 332
    Top = 308
  end
  object SrcBill_To: TDataSource
    DataSet = TblBill_to
    OnDataChange = SrcBill_ToDataChange
    Left = 207
    Top = 10
  end
  object TblBill_to: TFDTable
    BeforeInsert = PostParentsBeforeEdit
    BeforeEdit = PostParentsBeforeEdit
    BeforePost = TblBill_toBeforePost
    AfterPost = TblBill_toAfterPost
    BeforeCancel = ConfirmCancel
    OnCalcFields = TblBill_toCalcFields
    OnDeleteError = HandleError
    OnEditError = HandleError
    OnNewRecord = TblBill_toNewRecord
    OnPostError = HandleError
    IndexFieldNames = 'ARCUSTO_ID'
    MasterSource = SrcArcusto
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'BILL_TO'
    TableName = 'BILL_TO'
    Left = 207
    Top = 27
    object TblBill_toID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object TblBill_toARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object TblBill_toATTN: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 30
      FieldName = 'ATTN'
      Size = 60
    end
    object TblBill_toADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 30
      FieldName = 'ADDR1'
      Size = 60
    end
    object TblBill_toADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 30
      FieldName = 'ADDR2'
      Size = 60
    end
    object TblBill_toADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 30
      FieldName = 'ADDR3'
      Size = 60
    end
    object TblBill_toCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Size = 30
    end
    object TblBill_toSTATE: TStringField
      DisplayLabel = 'State'
      FieldName = 'STATE'
    end
    object TblBill_toCOUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      Size = 30
    end
    object TblBill_toZIP: TStringField
      DisplayLabel = 'Zip'
      FieldName = 'ZIP'
      Size = 10
    end
    object TblBill_toPRIME_CONTACT: TStringField
      DisplayLabel = 'Contact'
      FieldName = 'PRIME_CONTACT'
      Size = 30
    end
    object TblBill_toPHONE_NUMBER: TStringField
      DisplayLabel = 'Phone'
      FieldName = 'PHONE_NUMBER'
      OnGetText = TblBill_toPHONE_NUMBERGetText
      Size = 25
    end
    object TblBill_toEXT: TStringField
      DisplayLabel = 'Ext'
      FieldName = 'EXT'
      Size = 5
    end
    object TblBill_toFAX: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX'
      OnGetText = TblBill_toPHONE_NUMBERGetText
      Size = 25
    end
    object TblBill_toNOTES: TStringField
      FieldName = 'NOTES'
      Size = 2000
    end
    object TblBill_toCOMPANY_ID: TBCDField
      FieldName = 'COMPANY_ID'
      Size = 0
    end
    object TblBill_toUSE_USA_MASK: TStringField
      FieldName = 'USE_USA_MASK'
      Size = 1
    end
    object TblBill_toDEFAULT_BILL_TO: TStringField
      FieldName = 'DEFAULT_BILL_TO'
      FixedChar = True
      Size = 1
    end
    object TblBill_toINVOICE_REPORT: TStringField
      FieldName = 'INVOICE_REPORT'
      Size = 250
    end
    object TblBill_toPOSTED_INVOICE_REPORT: TStringField
      FieldName = 'POSTED_INVOICE_REPORT'
      Size = 250
    end
    object TblBill_toPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Size = 1
    end
    object TblBill_toTerms: TStringField
      FieldKind = fkCalculated
      FieldName = 'Terms'
      Calculated = True
    end
    object TblBill_toTERMS_ID: TBCDField
      FieldName = 'TERMS_ID'
      Size = 0
    end
    object TblBill_toSTATUS_ID: TStringField
      FieldName = 'STATUS_ID'
      FixedChar = True
    end
    object TblBill_toCOUNTRY_ID: TBCDField
      FieldName = 'COUNTRY_ID'
      Origin = 'COUNTRY_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object TblBill_toSTATE_ID: TBCDField
      FieldName = 'STATE_ID'
      Origin = 'STATE_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object PkArcusto: TIQWebHpick
    BeforeOpen = PkArcustoBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select custno as custno,'
      '       company as company,'
      '       addr1 as addr1,'
      '       addr2 as addr2,'
      '       addr3 as addr3,'
      '       city as city,'
      '       state as state,'
      '       country as country,'
      '       zip as zip,'
      '       phone_number as phone_number,'
      '       prime_contact as prime_contact,'
      '       id as id,'
      '       eplant_id as eplant_id,'
      
        '       decode(NVL(pk_hide, '#39'N'#39'), '#39'N'#39', '#39'Active'#39', '#39'InActive'#39') as a' +
        'ctive_type'
      '  from IQMS.v_arcusto'
      ' where misc.pk_hide_filter( pk_hide, :selected_view ) = 1'
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    AssociatedDataSource = SrcArcusto
    ForceShowWaitForPrompt = False
    Left = 63
    Top = 428
    ParamData = <
      item
        Name = 'selected_view'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkArcustoCUSTNO: TStringField
      DisplayLabel = 'Cust#'
      FieldName = 'CUSTNO'
      Size = 10
    end
    object PkArcustoCOMPANY: TStringField
      DisplayLabel = 'Customer Name'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Size = 60
    end
    object PkArcustoADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 30
      FieldName = 'ADDR1'
      Size = 60
    end
    object PkArcustoCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Size = 30
    end
    object PkArcustoSTATE: TStringField
      DisplayLabel = 'State or Region'
      FieldName = 'STATE'
    end
    object PkArcustoCOUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      Size = 30
    end
    object PkArcustoZIP: TStringField
      DisplayLabel = 'Postal Code'
      FieldName = 'ZIP'
      Size = 10
    end
    object PkArcustoPHONE_NUMBER: TStringField
      DisplayLabel = 'Telephone'
      FieldName = 'PHONE_NUMBER'
      Size = 25
    end
    object PkArcustoPRIME_CONTACT: TStringField
      DisplayLabel = 'Prime Contact'
      FieldName = 'PRIME_CONTACT'
      Size = 30
    end
    object PkArcustoID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkArcustoADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 30
      FieldName = 'ADDR2'
      Origin = 'ARCUSTO.ADDR2'
      Size = 60
    end
    object PkArcustoADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 30
      FieldName = 'ADDR3'
      Origin = 'ARCUSTO.ADDR3'
      Size = 60
    end
    object PkArcustoEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object PkArcustoACTIVE_TYPE: TStringField
      DisplayLabel = 'Active State'
      FieldName = 'ACTIVE_TYPE'
      Size = 8
    end
  end
  object SrcTerms: TDataSource
    DataSet = QryTerms
    Left = 115
    Top = 89
  end
  object TblTerms: TFDTable
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'TERMS'
    TableName = 'TERMS'
    Left = 131
    Top = 99
    object TblTermsID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object TblTermsDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 60
    end
    object TblTermsDAYS: TBCDField
      FieldName = 'DAYS'
      Size = 0
    end
    object TblTermsDISCOUNT: TBCDField
      FieldName = 'DISCOUNT'
      Size = 3
    end
    object TblTermsDISCOUNT_DAYS: TBCDField
      FieldName = 'DISCOUNT_DAYS'
      Size = 0
    end
    object TblTermsBASED_ON: TStringField
      FieldName = 'BASED_ON'
      Size = 1
    end
    object TblTermsEND_OF_MONTH: TStringField
      FieldName = 'END_OF_MONTH'
      FixedChar = True
      Size = 1
    end
    object TblTermsDAY_OF_MONTH: TBCDField
      FieldName = 'DAY_OF_MONTH'
      Size = 0
    end
    object TblTermsPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Size = 1
    end
    object TblTermsCASH_IN_ADVANCE: TStringField
      FieldName = 'CASH_IN_ADVANCE'
      Size = 1
    end
  end
  object SrcFreight: TDataSource
    DataSet = QryFreight
    Left = 207
    Top = 81
  end
  object TblFreight: TFDTable
    BeforeOpen = TblFreightBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'FREIGHT'
    TableName = 'FREIGHT'
    Left = 207
    Top = 99
  end
  object SrcTaxCodes: TDataSource
    DataSet = TblTaxCodes
    Left = 284
    Top = 81
  end
  object TblTaxCodes: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'TAX_CODES'
    TableName = 'TAX_CODES'
    Left = 284
    Top = 99
  end
  object SrcSalesPeople: TDataSource
    DataSet = TblSalesPeople
    Left = 46
    Top = 81
  end
  object TblSalesPeople: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'SALESPEOPLE'
    TableName = 'SALESPEOPLE'
    Left = 46
    Top = 99
  end
  object tblCurrency: TFDTable
    BeforeOpen = tblCurrencyBeforeOpen
    Filtered = True
    IndexName = 'PK_CURRENCY'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'CURRENCY'
    TableName = 'CURRENCY'
    Left = 284
    Top = 11
    object tblCurrencyDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Size = 50
    end
    object tblCurrencySPOT_RATE: TFMTBCDField
      DisplayLabel = 'Spot Rate'
      DisplayWidth = 10
      FieldName = 'SPOT_RATE'
      Size = 6
    end
    object tblCurrencyCURR_CODE: TStringField
      DisplayLabel = 'Curr. Code'
      DisplayWidth = 10
      FieldName = 'CURR_CODE'
      Size = 10
    end
    object tblCurrencyGLVALUE: TStringField
      DisplayLabel = 'GL Value'
      DisplayWidth = 10
      FieldName = 'GLVALUE'
      Size = 50
    end
    object tblCurrencyCURR_SYMBOL: TStringField
      DisplayLabel = 'Currency Symbol'
      DisplayWidth = 10
      FieldName = 'CURR_SYMBOL'
      Size = 10
    end
    object tblCurrencyNATIVE_CURR: TStringField
      DisplayLabel = 'Native Curr. Code'
      DisplayWidth = 3
      FieldName = 'NATIVE_CURR'
      Size = 3
    end
    object tblCurrencyID: TBCDField
      FieldName = 'ID'
      Required = True
      Visible = False
      Size = 0
    end
    object tblCurrencyECODE: TStringField
      FieldName = 'ECODE'
      Visible = False
      Size = 10
    end
    object tblCurrencyEID: TBCDField
      FieldName = 'EID'
      Visible = False
      Size = 0
    end
    object tblCurrencyEDATE_TIME: TDateTimeField
      FieldName = 'EDATE_TIME'
      Visible = False
    end
    object tblCurrencyECOPY: TStringField
      FieldName = 'ECOPY'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object QryCommissions: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select c.id,'
      
        '       substr(c.descrip, 1, 50) || '#39' ('#39' || To_Char(sum(d.commiss' +
        'ion_percent))  || '#39'%)'#39' as descrip,'
      '       sum(d.commission_percent) as commission_percent'
      '  from commissions c,'
      '       salespeople s,'
      '       commissions_detail d'
      ' where d.commissions_id = c.id'
      '   and d.salespeople_id = s.id'
      '   and NVL(s.inactive, '#39'N'#39') = '#39'N'#39
      ' group by c.id, c.descrip'
      
        'order by substr(c.descrip, 1, 50) || '#39' ('#39' || To_Char(sum(d.commi' +
        'ssion_percent))  || '#39'%)'#39
      '')
    Left = 360
    Top = 81
    object QryCommissionsDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 95
      FieldName = 'DESCRIP'
      Size = 94
    end
    object QryCommissionsID: TBCDField
      FieldName = 'ID'
      Origin = 'COMMISSIONS.ID'
      Visible = False
      Size = 0
    end
    object QryCommissionsCOMMISSION_PERCENT: TFMTBCDField
      FieldName = 'COMMISSION_PERCENT'
      Origin = 'COMMISSIONS_DETAIL.COMMISSION_PERCENT'
      Visible = False
      Size = 38
    end
  end
  object SrcComm: TDataSource
    DataSet = QryCommissions
    Left = 360
    Top = 100
  end
  object QryEPlant: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, name as plant_name '
      '  from eplant'
      ' order by id')
    Left = 361
    Top = 157
    object QryEPlantID: TBCDField
      FieldName = 'ID'
      Origin = 'EPLANT.ID'
      Size = 0
    end
    object QryEPlantPLANT_NAME: TStringField
      FieldName = 'PLANT_NAME'
      Origin = 'EPLANT.NAME'
      Size = 30
    end
  end
  object PkContact: TIQWebHpick
    BeforeOpen = PkContactBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT id,'
      '       salutation,'
      '       last_name,'
      '       first_name,'
      '       title,'
      '       phone_number,'
      '       ext,'
      '       fax_number,'
      '       email,'
      '       pager,'
      '       mobile,'
      '       pk_hide'
      '  FROM contact'
      ' WHERE arcusto_id = :nid AND'
      '       misc.eplant_filter_include_nulls(eplant_id) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 114
    Top = 429
    ParamData = <
      item
        Name = 'nId'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkContactID: TBCDField
      FieldName = 'ID'
      Origin = 'CONTACT.ID'
      Visible = False
      Size = 0
    end
    object PkContactSALUTATION: TStringField
      DisplayLabel = 'Salutation'
      FieldName = 'SALUTATION'
      Origin = 'CONTACT.SALUTATION'
      Size = 5
    end
    object PkContactLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      FieldName = 'LAST_NAME'
      Origin = 'CONTACT.LAST_NAME'
      Size = 30
    end
    object PkContactFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      FieldName = 'FIRST_NAME'
      Origin = 'CONTACT.FIRST_NAME'
      Size = 30
    end
    object PkContactTITLE: TStringField
      DisplayLabel = 'Title'
      FieldName = 'TITLE'
      Origin = 'CONTACT.TITLE'
      Size = 60
    end
    object PkContactPHONE_NUMBER: TStringField
      DisplayLabel = 'Telephone'
      FieldName = 'PHONE_NUMBER'
      Origin = 'CONTACT.PHONE_NUMBER'
      Size = 25
    end
    object PkContactEXT: TStringField
      DisplayLabel = 'Extension'
      FieldName = 'EXT'
      Origin = 'CONTACT.EXT'
      Size = 5
    end
    object PkContactFAX_NUMBER: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX_NUMBER'
      Origin = 'CONTACT.FAX_NUMBER'
      Size = 25
    end
    object PkContactEMAIL: TStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Origin = 'CONTACT.EMAIL'
      Size = 255
    end
    object PkContactPAGER: TStringField
      DisplayLabel = 'Pager'
      FieldName = 'PAGER'
      Origin = 'CONTACT.PAGER'
      Size = 25
    end
    object PkContactMOBILE: TStringField
      DisplayLabel = 'Cell Telephone'
      FieldName = 'MOBILE'
      Origin = 'CONTACT.MOBILE'
      Size = 25
    end
    object PkContactPK_HIDE: TStringField
      DisplayLabel = 'Hide from Pick Lists'
      FieldName = 'PK_HIDE'
      Origin = 'CONTACT.PK_HIDE'
      Visible = False
      Size = 1
    end
  end
  object QryFob: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select descrip from fob'
      'where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39)
    Left = 285
    Top = 157
    object QryFobDESCRIP: TStringField
      DisplayLabel = 'FOB'
      DisplayWidth = 15
      FieldName = 'DESCRIP'
      Origin = 'FOB.DESCRIP'
      Size = 15
    end
  end
  object wwSrcShipTo: TDataSource
    DataSet = wwQryShipTo
    Left = 46
    Top = 157
  end
  object wwQryShipTo: TFDQuery
    MasterSource = SrcArcusto
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       attn,'
      '       addr1,'
      '       addr2,'
      '       city,'
      '       state,'
      '       zip'
      '  from ship_to'
      ' where arcusto_id = :id'
      '   and nvl(pk_hide, '#39'N'#39') <> '#39'Y'#39
      'order by attn'
      ''
      ' ')
    Left = 54
    Top = 170
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object wwQryShipToATTN: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 20
      FieldName = 'ATTN'
      Origin = 'SHIP_TO.ATTN'
      Size = 60
    end
    object wwQryShipToADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 20
      FieldName = 'ADDR1'
      Origin = 'SHIP_TO.ADDR1'
      Size = 60
    end
    object wwQryShipToADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 20
      FieldName = 'ADDR2'
      Origin = 'SHIP_TO.ADDR2'
      Size = 60
    end
    object wwQryShipToCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 15
      FieldName = 'CITY'
      Origin = 'SHIP_TO.CITY'
      Size = 30
    end
    object wwQryShipToSTATE: TStringField
      DisplayLabel = 'State'
      DisplayWidth = 20
      FieldName = 'STATE'
      Origin = 'SHIP_TO.STATE'
    end
    object wwQryShipToZIP: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 10
      FieldName = 'ZIP'
      Origin = 'SHIP_TO.ZIP'
      Size = 10
    end
    object wwQryShipToID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'SHIP_TO.ID'
      Visible = False
      Size = 0
    end
  end
  object wwSrcBillTo: TDataSource
    DataSet = wwQryBillTo
    Left = 131
    Top = 157
  end
  object wwQryBillTo: TFDQuery
    MasterSource = SrcArcusto
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       attn,'
      '       addr1,'
      '       addr2,'
      '       city,'
      '       state,'
      '       zip'
      '  from bill_to'
      ' where arcusto_id = :id   '
      '   and nvl(pk_hide, '#39'N'#39') <> '#39'Y'#39'    '
      ' order by attn'
      ' ')
    Left = 139
    Top = 170
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object wwQryBillToATTN: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 20
      FieldName = 'ATTN'
      Origin = 'BILL_TO.ATTN'
      Size = 60
    end
    object wwQryBillToADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 20
      FieldName = 'ADDR1'
      Origin = 'BILL_TO.ADDR1'
      Size = 60
    end
    object wwQryBillToADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 20
      FieldName = 'ADDR2'
      Origin = 'BILL_TO.ADDR2'
      Size = 60
    end
    object wwQryBillToCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 15
      FieldName = 'CITY'
      Origin = 'BILL_TO.CITY'
      Size = 30
    end
    object wwQryBillToSTATE: TStringField
      DisplayLabel = 'State'
      DisplayWidth = 20
      FieldName = 'STATE'
      Origin = 'BILL_TO.STATE'
    end
    object wwQryBillToZIP: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 10
      FieldName = 'ZIP'
      Origin = 'BILL_TO.ZIP'
      Size = 10
    end
    object wwQryBillToID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'BILL_TO.ID'
      Visible = False
      Size = 0
    end
  end
  object wwQryAllUsers: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select a.username'
      '  from v_iqusers_ex  a,'
      '       s_user_general s,'
      '       dba_users u,'
      
        '       (select grantee, count(*) as the_count from dba_role_priv' +
        's where granted_role = '#39'DBA'#39' group by grantee ) x'
      ' where RTrim(a.username) = RTrim(s.user_name(+))'
      '   and a.username = u.username'
      '   and u.username = x.grantee(+)'
      '   and not a.username in ( '#39'SYS'#39', '#39'SYSTEM'#39' )'
      'order by a.username'
      ''
      ' '
      ' ')
    Left = 208
    Top = 157
    object wwQryAllUsersUSERNAME: TStringField
      DisplayLabel = 'Existing Users'
      DisplayWidth = 30
      FieldName = 'USERNAME'
      Size = 30
    end
  end
  object wwQryCust_Type: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, descrip from cust_type'
      'order by descrip')
    Left = 442
    Top = 157
    object wwQryCust_TypeDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Origin = 'CUST_TYPE.DESCRIP'
      Size = 50
    end
    object wwQryCust_TypeID: TBCDField
      FieldName = 'ID'
      Origin = 'CUST_TYPE.ID'
      Visible = False
      Size = 0
    end
  end
  object wwQryWebArcustoLookup: TFDQuery
    MasterSource = SrcArcusto
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select wm.name,'
      '       wm.descrip, '
      '       am.id as web_arcusto_module_id '
      '  from web_module wm,'
      '       web_arcusto_module am'
      ' where wm.id = am.web_module_id'
      '   and am.arcusto_id = :ID'
      ' '
      ' '
      ' ')
    Left = 208
    Top = 376
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object wwQryWebArcustoLookupNAME: TStringField
      DisplayLabel = 'Module Name'
      DisplayWidth = 25
      FieldName = 'NAME'
      Origin = 'WEB_MODULE.NAME'
      Size = 50
    end
    object wwQryWebArcustoLookupDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Origin = 'WEB_MODULE.DESCRIP'
      Size = 50
    end
    object wwQryWebArcustoLookupWEB_ARCUSTO_MODULE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'WEB_ARCUSTO_MODULE_ID'
      Origin = 'WEB_ARCUSTO_MODULE.ID'
      Visible = False
      Size = 0
    end
  end
  object wwSrcWeb_Arcusto_Module: TDataSource
    DataSet = wwTblWeb_Arcusto_Module
    Left = 59
    Top = 311
  end
  object wwTblWeb_Arcusto_Module: TFDTable
    BeforeInsert = PostParentsBeforeEdit
    BeforeEdit = PostParentsBeforeEdit
    BeforePost = AssignIDBeforePost
    AfterDelete = wwTblWeb_Arcusto_ModuleAfterDelete
    IndexFieldNames = 'ARCUSTO_ID'
    MasterSource = SrcArcusto
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'WEB_ARCUSTO_MODULE'
    TableName = 'WEB_ARCUSTO_MODULE'
    Left = 59
    Top = 327
    object wwTblWeb_Arcusto_ModuleWeb_Module_Name: TStringField
      DisplayLabel = 'Module Name'
      DisplayWidth = 42
      FieldKind = fkCalculated
      FieldName = 'Web_Module_Name'
      Size = 50
      Calculated = True
    end
    object wwTblWeb_Arcusto_ModuleID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object wwTblWeb_Arcusto_ModuleWEB_MODULE_ID: TBCDField
      FieldName = 'WEB_MODULE_ID'
      Visible = False
      Size = 0
    end
    object wwTblWeb_Arcusto_ModuleARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Visible = False
      Size = 0
    end
  end
  object wwQryWebModuleLookup: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from web_module'
      ' where substr(name,1,8) = '#39'CUSTOMER'#39
      'order by name'
      ' ')
    Left = 59
    Top = 375
    object wwQryWebModuleLookupNAME: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 25
      FieldName = 'NAME'
      Origin = 'WEB_MODULE.NAME'
      Size = 50
    end
    object wwQryWebModuleLookupDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Origin = 'WEB_MODULE.DESCRIP'
      Size = 50
    end
    object wwQryWebModuleLookupID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'WEB_MODULE.ID'
      Visible = False
      Size = 0
    end
  end
  object wwSrcWeb_Contact_Module: TDataSource
    DataSet = wwQryWeb_Contact_Module
    Left = 208
    Top = 311
  end
  object wwQryWeb_Contact_Module: TFDQuery
    BeforeInsert = PostParentsBeforeEdit
    BeforeEdit = PostParentsBeforeEdit
    BeforePost = wwQryWeb_Contact_ModuleBeforePost
    AfterPost = wwQryWeb_Contact_ModuleAfterPost
    BeforeDelete = wwQryWeb_Contact_ModuleBeforeDelete
    AfterDelete = wwQryWeb_Contact_ModuleAfterPost
    CachedUpdates = True
    MasterSource = SrcContact
    MasterFields = 'ID'
    OnUpdateRecord = wwQryWeb_Contact_ModuleUpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select web_contact_module_id,'
      '       web_module_id,'
      '       module_name,'
      '       web_arcusto_module_id,'
      '       contact_id'
      '  from v_web_contact_module'
      ' where contact_id = :id'
      ' order by module_name'
      ''
      ' '
      ' ')
    Left = 208
    Top = 327
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object wwQryWeb_Contact_ModuleMODULE_NAME: TStringField
      DisplayLabel = 'Module Name'
      DisplayWidth = 42
      FieldName = 'MODULE_NAME'
      Size = 50
    end
    object wwQryWeb_Contact_ModuleWEB_CONTACT_MODULE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'WEB_CONTACT_MODULE_ID'
      Visible = False
      Size = 0
    end
    object wwQryWeb_Contact_ModuleWEB_MODULE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'WEB_MODULE_ID'
      Visible = False
      Size = 0
    end
    object wwQryWeb_Contact_ModuleWEB_ARCUSTO_MODULE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'WEB_ARCUSTO_MODULE_ID'
      Visible = False
      Size = 0
    end
    object wwQryWeb_Contact_ModuleCONTACT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'CONTACT_ID'
      Visible = False
      Size = 0
    end
  end
  object wwQryCompany: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select'
      '      company,'
      '      code,'
      '      address1,'
      '      address2,'
      '      city,'
      '      state,'
      '      zip,'
      '      country,'
      '      phone,'
      '      id,'
      '      fax,'
      '      email,'
      '      internet,'
      '      address3'
      '  from company'
      ' order by company')
    Left = 441
    Top = 81
    object wwQryCompanyCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 20
      FieldName = 'COMPANY'
      Size = 60
    end
    object wwQryCompanyCODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 5
      FieldName = 'CODE'
    end
    object wwQryCompanyADDRESS1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 15
      FieldName = 'ADDRESS1'
      Size = 60
    end
    object wwQryCompanyADDRESS2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 15
      FieldName = 'ADDRESS2'
      Size = 60
    end
    object wwQryCompanyCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 10
      FieldName = 'CITY'
      Size = 30
    end
    object wwQryCompanySTATE: TStringField
      DisplayLabel = 'State'
      DisplayWidth = 20
      FieldName = 'STATE'
    end
    object wwQryCompanyZIP: TStringField
      DisplayLabel = 'Zip'
      DisplayWidth = 8
      FieldName = 'ZIP'
      Size = 10
    end
    object wwQryCompanyCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 10
      FieldName = 'COUNTRY'
      Size = 25
    end
    object wwQryCompanyPHONE: TStringField
      DisplayLabel = 'Phone'
      DisplayWidth = 17
      FieldName = 'PHONE'
      Size = 25
    end
    object wwQryCompanyID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Required = True
      Visible = False
      Size = 0
    end
    object wwQryCompanyFAX: TStringField
      DisplayWidth = 17
      FieldName = 'FAX'
      Visible = False
      Size = 25
    end
    object wwQryCompanyEMAIL: TStringField
      DisplayWidth = 50
      FieldName = 'EMAIL'
      Visible = False
      Size = 255
    end
    object wwQryCompanyINTERNET: TStringField
      DisplayWidth = 50
      FieldName = 'INTERNET'
      Visible = False
      Size = 50
    end
    object wwQryCompanyADDRESS3: TStringField
      DisplayWidth = 30
      FieldName = 'ADDRESS3'
      Visible = False
      Size = 60
    end
  end
  object SrcContactShipTo: TDataSource
    DataSet = QryContactShipTo
    Left = 60
    Top = 226
  end
  object QryContactShipTo: TFDQuery
    BeforeInsert = PostParentBeforeEdit
    BeforeEdit = PostParentBeforeEdit
    BeforePost = QryContactShipToBeforePost
    AfterPost = QryContactShipToAfterPost
    AfterDelete = QryContactShipToAfterPost
    OnNewRecord = QryContactShipToNewRecord
    CachedUpdates = True
    MasterSource = SrcShip_to
    MasterFields = 'ARCUSTO_ID;ID'
    Connection = UniMainModule.FDConnection1
    UpdateObject = UpdateSQLShipContact
    SQL.Strings = (
      'select id,'
      '       arcusto_id,'
      '       contact_seqno,'
      '       salutation,'
      '       last_name,'
      '       first_name,'
      '       title,'
      '       phone_number,'
      '       ext,'
      '       fax_number,'
      '       email,'
      '       pager,'
      '       cuser1,'
      '       cuser2,'
      '       source,'
      '       source_id,'
      '       mobile,'
      '       auto_eform_ps,'
      '       auto_eform_ar,'
      '       auto_eform_ord_ack,'
      '       auto_eform_ord_ack_contact,'
      '       auto_eform_bol,'
      '       AUTO_EFORM_CS,'
      '       auto_eform_spc,'
      '       auto_eform_coc,'
      '       verified_date,'
      '       msds_recipient,'
      '       auto_eform_ps_ord_contact,'
      '       eplant_id'
      '                 '
      '  from contact'
      ' where source = '#39'SHIP_TO'#39
      '   and arcusto_id = :arcusto_id'
      '   and source_id = :id'
      ' order by contact_seqno'
      '')
    Left = 67
    Top = 235
    ParamData = <
      item
        Name = 'ARCUSTO_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryContactShipToFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 15
      FieldName = 'FIRST_NAME'
      Origin = 'CONTACT.FIRST_NAME'
      FixedChar = True
      Size = 30
    end
    object QryContactShipToLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 15
      FieldName = 'LAST_NAME'
      Origin = 'CONTACT.LAST_NAME'
      FixedChar = True
      Size = 30
    end
    object QryContactShipToTITLE: TStringField
      DisplayLabel = 'Title'
      DisplayWidth = 10
      FieldName = 'TITLE'
      Origin = 'CONTACT.TITLE'
      FixedChar = True
      Size = 60
    end
    object QryContactShipToSALUTATION: TStringField
      DisplayLabel = 'Salutation'
      DisplayWidth = 5
      FieldName = 'SALUTATION'
      Origin = 'CONTACT.SALUTATION'
      FixedChar = True
      Size = 5
    end
    object QryContactShipToPHONE_NUMBER: TStringField
      DisplayLabel = 'Phone'
      DisplayWidth = 15
      FieldName = 'PHONE_NUMBER'
      Origin = 'CONTACT.PHONE_NUMBER'
      OnGetText = QryContactShipToPHONE_NUMBERGetText
      Size = 25
    end
    object QryContactShipToEXT: TStringField
      DisplayLabel = 'Ext'
      DisplayWidth = 5
      FieldName = 'EXT'
      Origin = 'CONTACT.EXT'
      FixedChar = True
      Size = 5
    end
    object QryContactShipToFAX_NUMBER: TStringField
      DisplayLabel = 'Fax'
      DisplayWidth = 15
      FieldName = 'FAX_NUMBER'
      Origin = 'CONTACT.FAX_NUMBER'
      OnGetText = QryContactShipToPHONE_NUMBERGetText
      Size = 25
    end
    object QryContactShipToPAGER: TStringField
      DisplayLabel = 'Pager'
      DisplayWidth = 15
      FieldName = 'PAGER'
      Origin = 'CONTACT.PAGER'
      OnGetText = QryContactShipToPHONE_NUMBERGetText
      FixedChar = True
      Size = 25
    end
    object QryContactShipToEMAIL: TStringField
      DisplayLabel = 'Email'
      DisplayWidth = 20
      FieldName = 'EMAIL'
      Origin = 'CONTACT.EMAIL'
      FixedChar = True
      Size = 255
    end
    object QryContactShipToCUSER1: TStringField
      DisplayLabel = 'User Text 1'
      DisplayWidth = 25
      FieldName = 'CUSER1'
      Origin = 'CONTACT.CUSER1'
      Size = 60
    end
    object QryContactShipToCUSER2: TStringField
      DisplayLabel = 'User Text 2'
      DisplayWidth = 25
      FieldName = 'CUSER2'
      Origin = 'CONTACT.CUSER2'
      Size = 60
    end
    object QryContactShipToAUTO_EFORM_AR: TStringField
      DisplayLabel = 'Auto EForm Invoice'
      DisplayWidth = 1
      FieldName = 'AUTO_EFORM_AR'
      Origin = 'CONTACT.AUTO_EFORM_AR'
      Size = 1
    end
    object QryContactShipToAUTO_EFORM_BOL: TStringField
      DisplayLabel = 'Auto EForm BOL'
      DisplayWidth = 1
      FieldName = 'AUTO_EFORM_BOL'
      Origin = 'CONTACT.AUTO_EFORM_BOL'
      Size = 1
    end
    object QryContactShipToAUTO_EFORM_ORD_ACK: TStringField
      DisplayLabel = 'Auto EForm Ord Ack'
      DisplayWidth = 1
      FieldName = 'AUTO_EFORM_ORD_ACK'
      Origin = 'CONTACT.AUTO_EFORM_ORD_ACK'
      Size = 1
    end
    object QryContactShipToAUTO_EFORM_ORD_ACK_CONTACT: TStringField
      DisplayLabel = 'Auto EForm Ord Ack - Order Contact'
      DisplayWidth = 1
      FieldName = 'AUTO_EFORM_ORD_ACK_CONTACT'
      Origin = 'CONTACT.AUTO_EFORM_ORD_ACK_CONTACT'
      Size = 1
    end
    object QryContactShipToAUTO_EFORM_PS: TStringField
      DisplayLabel = 'Auto EForm PS'
      DisplayWidth = 1
      FieldName = 'AUTO_EFORM_PS'
      Origin = 'CONTACT.AUTO_EFORM_PS'
      OnChange = TblContactAUTO_EFORM_PSChange
      Size = 1
    end
    object QryContactShipToAUTO_EFORM_CS: TStringField
      DisplayLabel = 'Auto EForm Statements'
      DisplayWidth = 1
      FieldName = 'AUTO_EFORM_CS'
      Origin = 'CONTACT.AUTO_EFORM_CS'
      Size = 1
    end
    object QryContactShipToAUTO_EFORM_SPC: TStringField
      DisplayLabel = 'Auto EForm SPC'
      DisplayWidth = 10
      FieldName = 'AUTO_EFORM_SPC'
      Origin = 'CONTACT.AUTO_EFORM_SPC'
      Size = 1
    end
    object QryContactShipToAUTO_EFORM_COC: TStringField
      DisplayLabel = 'Auto EForm COC'
      DisplayWidth = 10
      FieldName = 'AUTO_EFORM_COC'
      Origin = 'CONTACT.AUTO_EFORM_COC'
      Size = 1
    end
    object QryContactShipToVERIFIED_DATE: TDateTimeField
      DisplayLabel = 'Verification Date'
      DisplayWidth = 18
      FieldName = 'VERIFIED_DATE'
      Origin = 'CONTACT.VERIFIED_DATE'
    end
    object QryContactShipToMSDS_RECIPIENT: TStringField
      DisplayLabel = 'MSDS Notification Method'
      DisplayWidth = 1
      FieldName = 'MSDS_RECIPIENT'
      Origin = 'CONTACT.MSDS_RECIPIENT'
      Size = 1
    end
    object QryContactShipToAUTO_EFORM_PS_ORD_CONTACT: TStringField
      DisplayLabel = 'Auto EForm PS~Order Contact'
      DisplayWidth = 1
      FieldName = 'AUTO_EFORM_PS_ORD_CONTACT'
      OnChange = TblContactAUTO_EFORM_PSChange
      Size = 1
    end
    object QryContactShipToID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'CONTACT.ID'
      Visible = False
      Size = 0
    end
    object QryContactShipToARCUSTO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARCUSTO_ID'
      Origin = 'CONTACT.ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object QryContactShipToCONTACT_SEQNO: TBCDField
      DisplayWidth = 10
      FieldName = 'CONTACT_SEQNO'
      Origin = 'CONTACT.CONTACT_SEQNO'
      Visible = False
      Size = 0
    end
    object QryContactShipToSOURCE: TStringField
      DisplayWidth = 50
      FieldName = 'SOURCE'
      Origin = 'CONTACT.SOURCE'
      Visible = False
      Size = 50
    end
    object QryContactShipToSOURCE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SOURCE_ID'
      Origin = 'CONTACT.SOURCE_ID'
      Visible = False
      Size = 0
    end
    object QryContactShipToMOBILE: TStringField
      DisplayWidth = 25
      FieldName = 'MOBILE'
      Origin = 'CONTACT.MOBILE'
      Visible = False
      OnGetText = QryContactShipToPHONE_NUMBERGetText
      Size = 25
    end
    object QryContactShipToEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'IQ.CONTACT.EPLANT_ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQLShipContact: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into contact'
      
        '  (ID, ARCUSTO_ID, CONTACT_SEQNO, SALUTATION, LAST_NAME, FIRST_N' +
        'AME, '
      'TITLE, '
      
        '   PHONE_NUMBER, EXT, FAX_NUMBER, EMAIL, PAGER, CUSER1, CUSER2, ' +
        'SOURCE, '
      '   SOURCE_ID, MOBILE, AUTO_EFORM_PS, AUTO_EFORM_AR, '
      'AUTO_EFORM_ORD_ACK, '
      '   AUTO_EFORM_ORD_ACK_CONTACT, AUTO_EFORM_BOL, AUTO_EFORM_CS, '
      'AUTO_EFORM_SPC, '
      '   AUTO_EFORM_COC, VERIFIED_DATE, MSDS_RECIPIENT, '
      'AUTO_EFORM_PS_ORD_CONTACT, '
      '   EPLANT_ID)'
      'values'
      
        '  (:ID, :ARCUSTO_ID, :CONTACT_SEQNO, :SALUTATION, :LAST_NAME, :F' +
        'IRST_NAME, '
      
        '   :TITLE, :PHONE_NUMBER, :EXT, :FAX_NUMBER, :EMAIL, :PAGER, :CU' +
        'SER1, '
      ':CUSER2, '
      
        '   :SOURCE, :SOURCE_ID, :MOBILE, :AUTO_EFORM_PS, :AUTO_EFORM_AR,' +
        ' '
      ':AUTO_EFORM_ORD_ACK, '
      
        '   :AUTO_EFORM_ORD_ACK_CONTACT, :AUTO_EFORM_BOL, :AUTO_EFORM_CS,' +
        ' '
      ':AUTO_EFORM_SPC, '
      '   :AUTO_EFORM_COC, :VERIFIED_DATE, :MSDS_RECIPIENT, '
      ':AUTO_EFORM_PS_ORD_CONTACT, '
      '   :EPLANT_ID)')
    ModifySQL.Strings = (
      'update contact'
      'set'
      '  ID = :ID,'
      '  ARCUSTO_ID = :ARCUSTO_ID,'
      '  CONTACT_SEQNO = :CONTACT_SEQNO,'
      '  SALUTATION = :SALUTATION,'
      '  LAST_NAME = :LAST_NAME,'
      '  FIRST_NAME = :FIRST_NAME,'
      '  TITLE = :TITLE,'
      '  PHONE_NUMBER = :PHONE_NUMBER,'
      '  EXT = :EXT,'
      '  FAX_NUMBER = :FAX_NUMBER,'
      '  EMAIL = :EMAIL,'
      '  PAGER = :PAGER,'
      '  CUSER1 = :CUSER1,'
      '  CUSER2 = :CUSER2,'
      '  SOURCE = :SOURCE,'
      '  SOURCE_ID = :SOURCE_ID,'
      '  MOBILE = :MOBILE,'
      '  AUTO_EFORM_PS = :AUTO_EFORM_PS,'
      '  AUTO_EFORM_AR = :AUTO_EFORM_AR,'
      '  AUTO_EFORM_ORD_ACK = :AUTO_EFORM_ORD_ACK,'
      '  AUTO_EFORM_ORD_ACK_CONTACT = :AUTO_EFORM_ORD_ACK_CONTACT,'
      '  AUTO_EFORM_BOL = :AUTO_EFORM_BOL,'
      '  AUTO_EFORM_CS = :AUTO_EFORM_CS,'
      '  AUTO_EFORM_SPC = :AUTO_EFORM_SPC,'
      '  AUTO_EFORM_COC = :AUTO_EFORM_COC,'
      '  VERIFIED_DATE = :VERIFIED_DATE,'
      '  MSDS_RECIPIENT = :MSDS_RECIPIENT,'
      '  AUTO_EFORM_PS_ORD_CONTACT = :AUTO_EFORM_PS_ORD_CONTACT,'
      '  EPLANT_ID = :EPLANT_ID'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from contact'
      'where'
      '  ID = :OLD_ID')
    Left = 60
    Top = 262
  end
  object SrcContactBillTo: TDataSource
    DataSet = QryContactBillTo
    Left = 208
    Top = 226
  end
  object QryContactBillTo: TFDQuery
    BeforeInsert = PostParentBeforeEdit
    BeforeEdit = PostParentBeforeEdit
    BeforePost = QryContactShipToBeforePost
    AfterPost = QryContactShipToAfterPost
    AfterDelete = QryContactShipToAfterPost
    OnNewRecord = QryContactShipToNewRecord
    CachedUpdates = True
    MasterSource = SrcBill_To
    MasterFields = 'ARCUSTO_ID;ID'
    Connection = UniMainModule.FDConnection1
    UpdateObject = UpdateSQLBillContact
    SQL.Strings = (
      'select id,'
      '       arcusto_id,'
      '       contact_seqno,'
      '       salutation,'
      '       last_name,'
      '       first_name,'
      '       title,'
      '       phone_number,'
      '       ext,'
      '       fax_number,'
      '       email,'
      '       pager,'
      '       cuser1,'
      '       cuser2,'
      '       source,'
      '       source_id,'
      '       mobile,'
      '       auto_eform_ps,'
      '       auto_eform_ar,'
      '       auto_eform_ord_ack,'
      '       AUTO_EFORM_ORD_ACK_CONTACT,'
      '       auto_eform_bol,'
      '       auto_eform_cs,'
      '       auto_eform_spc,'
      '       auto_eform_coc,'
      '       verified_date,'
      '       email_dunning'
      '  from contact'
      ' where source = '#39'BILL_TO'#39
      '   and arcusto_id = :arcusto_id'
      '   and source_id = :id'
      ' order by contact_seqno'
      ''
      ' ')
    Left = 208
    Top = 242
    ParamData = <
      item
        Name = 'ARCUSTO_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryContactBillToFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 18
      FieldName = 'FIRST_NAME'
      Origin = 'CONTACT.FIRST_NAME'
      FixedChar = True
      Size = 30
    end
    object QryContactBillToLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 18
      FieldName = 'LAST_NAME'
      Origin = 'CONTACT.LAST_NAME'
      FixedChar = True
      Size = 30
    end
    object QryContactBillToTITLE: TStringField
      DisplayLabel = 'Title'
      DisplayWidth = 7
      FieldName = 'TITLE'
      Origin = 'CONTACT.TITLE'
      FixedChar = True
      Size = 60
    end
    object QryContactBillToSALUTATION: TStringField
      DisplayLabel = 'Salutation'
      DisplayWidth = 12
      FieldName = 'SALUTATION'
      Origin = 'CONTACT.SALUTATION'
      FixedChar = True
      Size = 5
    end
    object QryContactBillToPHONE_NUMBER: TStringField
      DisplayLabel = 'Telephone #'
      DisplayWidth = 18
      FieldName = 'PHONE_NUMBER'
      Origin = 'CONTACT.PHONE_NUMBER'
      OnGetText = QryContactBillToPHONE_NUMBERGetText
      Size = 25
    end
    object QryContactBillToEXT: TStringField
      DisplayLabel = 'Ext'
      DisplayWidth = 9
      FieldName = 'EXT'
      Origin = 'CONTACT.EXT'
      FixedChar = True
      Size = 5
    end
    object QryContactBillToFAX_NUMBER: TStringField
      DisplayLabel = 'Fax #'
      DisplayWidth = 18
      FieldName = 'FAX_NUMBER'
      Origin = 'CONTACT.FAX_NUMBER'
      OnGetText = QryContactBillToPHONE_NUMBERGetText
      Size = 25
    end
    object QryContactBillToPAGER: TStringField
      DisplayLabel = 'Pager'
      DisplayWidth = 18
      FieldName = 'PAGER'
      Origin = 'CONTACT.PAGER'
      OnGetText = QryContactBillToPHONE_NUMBERGetText
      FixedChar = True
      Size = 25
    end
    object QryContactBillToEMAIL: TStringField
      DisplayLabel = 'Email'
      DisplayWidth = 18
      FieldName = 'EMAIL'
      Origin = 'CONTACT.EMAIL'
      FixedChar = True
      Size = 255
    end
    object QryContactBillToCUSER1: TStringField
      DisplayLabel = 'User Text 1'
      DisplayWidth = 18
      FieldName = 'CUSER1'
      Origin = 'CONTACT.CUSER1'
      Size = 60
    end
    object QryContactBillToCUSER2: TStringField
      DisplayLabel = 'User Text 2'
      DisplayWidth = 18
      FieldName = 'CUSER2'
      Origin = 'CONTACT.CUSER2'
      Size = 60
    end
    object QryContactBillToAUTO_EFORM_AR: TStringField
      DisplayLabel = 'Auto EForm Invoice'
      DisplayWidth = 16
      FieldName = 'AUTO_EFORM_AR'
      Origin = 'CONTACT.AUTO_EFORM_AR'
      Size = 1
    end
    object QryContactBillToAUTO_EFORM_BOL: TStringField
      DisplayLabel = 'Auto EForm BOL'
      DisplayWidth = 14
      FieldName = 'AUTO_EFORM_BOL'
      Origin = 'CONTACT.AUTO_EFORM_BOL'
      Size = 1
    end
    object QryContactBillToAUTO_EFORM_ORD_ACK: TStringField
      DisplayLabel = 'Auto EForm Ord Ack'
      DisplayWidth = 16
      FieldName = 'AUTO_EFORM_ORD_ACK'
      Origin = 'CONTACT.AUTO_EFORM_ORD_ACK'
      Size = 1
    end
    object QryContactBillToAUTO_EFORM_PS: TStringField
      DisplayLabel = 'Auto EForm PS'
      DisplayWidth = 16
      FieldName = 'AUTO_EFORM_PS'
      Origin = 'CONTACT.AUTO_EFORM_PS'
      Size = 1
    end
    object QryContactBillToAUTO_EFORM_CS: TStringField
      DisplayLabel = 'Auto EForm Statements'
      DisplayWidth = 15
      FieldName = 'AUTO_EFORM_CS'
      Origin = 'CONTACT.AUTO_EFORM_CS'
      Size = 1
    end
    object QryContactBillToAUTO_EFORM_SPC: TStringField
      DisplayLabel = 'Auto EForm SPC'
      DisplayWidth = 10
      FieldName = 'AUTO_EFORM_SPC'
      Origin = 'CONTACT.AUTO_EFORM_SPC'
      Size = 1
    end
    object QryContactBillToAUTO_EFORM_COC: TStringField
      DisplayLabel = 'Auto EForm COC'
      DisplayWidth = 10
      FieldName = 'AUTO_EFORM_COC'
      Origin = 'CONTACT.AUTO_EFORM_COC'
      Size = 1
    end
    object QryContactBillToEMAIL_DUNNING: TStringField
      DisplayLabel = 'Email Dunning'
      DisplayWidth = 11
      FieldName = 'EMAIL_DUNNING'
      Origin = 'CONTACT.EMAIL_DUNNING'
      Size = 1
    end
    object QryContactBillToVERIFIED_DATE: TDateTimeField
      DisplayLabel = 'Verification Date'
      DisplayWidth = 18
      FieldName = 'VERIFIED_DATE'
      Origin = 'CONTACT.VERIFIED_DATE'
    end
    object QryContactBillToMOBILE: TStringField
      DisplayLabel = 'Cell Telephone'
      DisplayWidth = 25
      FieldName = 'MOBILE'
      Origin = 'CONTACT.MOBILE'
      OnGetText = QryContactBillToPHONE_NUMBERGetText
      Size = 25
    end
    object QryContactBillToAUTO_EFORM_ORD_ACK_CONTACT: TStringField
      DisplayLabel = 'Auto EForm Ord Ack - Order Contact'
      DisplayWidth = 31
      FieldName = 'AUTO_EFORM_ORD_ACK_CONTACT'
      Origin = 'CONTACT.AUTO_EFORM_ORD_ACK_CONTACT'
      Size = 1
    end
    object QryContactBillToCONTACT_SEQNO: TBCDField
      DisplayWidth = 10
      FieldName = 'CONTACT_SEQNO'
      Origin = 'CONTACT.CONTACT_SEQNO'
      Visible = False
      Size = 0
    end
    object QryContactBillToSOURCE: TStringField
      DisplayWidth = 50
      FieldName = 'SOURCE'
      Origin = 'CONTACT.SOURCE'
      Visible = False
      Size = 50
    end
    object QryContactBillToSOURCE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SOURCE_ID'
      Origin = 'CONTACT.SOURCE_ID'
      Visible = False
      Size = 0
    end
    object QryContactBillToID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'CONTACT.ID'
      Visible = False
      Size = 0
    end
    object QryContactBillToARCUSTO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARCUSTO_ID'
      Origin = 'CONTACT.ARCUSTO_ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQLBillContact: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into contact'
      
        '  (ID, ARCUSTO_ID, CONTACT_SEQNO, SALUTATION, LAST_NAME, FIRST_N' +
        'AME, TITLE, '
      
        '   PHONE_NUMBER, EXT, FAX_NUMBER, EMAIL, PAGER, CUSER1, CUSER2, ' +
        'SOURCE, '
      
        '   SOURCE_ID, MOBILE, AUTO_EFORM_PS, AUTO_EFORM_AR, AUTO_EFORM_O' +
        'RD_ACK, '
      
        '   AUTO_EFORM_ORD_ACK_CONTACT, AUTO_EFORM_BOL, AUTO_EFORM_CS, AU' +
        'TO_EFORM_SPC, '
      '   AUTO_EFORM_COC, VERIFIED_DATE, EMAIL_DUNNING)'
      'values'
      
        '  (:ID, :ARCUSTO_ID, :CONTACT_SEQNO, :SALUTATION, :LAST_NAME, :F' +
        'IRST_NAME, '
      
        '   :TITLE, :PHONE_NUMBER, :EXT, :FAX_NUMBER, :EMAIL, :PAGER, :CU' +
        'SER1, :CUSER2, '
      
        '   :SOURCE, :SOURCE_ID, :MOBILE, :AUTO_EFORM_PS, :AUTO_EFORM_AR,' +
        ' :AUTO_EFORM_ORD_ACK, '
      
        '   :AUTO_EFORM_ORD_ACK_CONTACT, :AUTO_EFORM_BOL, :AUTO_EFORM_CS,' +
        ' :AUTO_EFORM_SPC, '
      '   :AUTO_EFORM_COC, :VERIFIED_DATE, :EMAIL_DUNNING)')
    ModifySQL.Strings = (
      'update contact'
      'set'
      '  ID = :ID,'
      '  ARCUSTO_ID = :ARCUSTO_ID,'
      '  CONTACT_SEQNO = :CONTACT_SEQNO,'
      '  SALUTATION = :SALUTATION,'
      '  LAST_NAME = :LAST_NAME,'
      '  FIRST_NAME = :FIRST_NAME,'
      '  TITLE = :TITLE,'
      '  PHONE_NUMBER = :PHONE_NUMBER,'
      '  EXT = :EXT,'
      '  FAX_NUMBER = :FAX_NUMBER,'
      '  EMAIL = :EMAIL,'
      '  PAGER = :PAGER,'
      '  CUSER1 = :CUSER1,'
      '  CUSER2 = :CUSER2,'
      '  SOURCE = :SOURCE,'
      '  SOURCE_ID = :SOURCE_ID,'
      '  MOBILE = :MOBILE,'
      '  AUTO_EFORM_PS = :AUTO_EFORM_PS,'
      '  AUTO_EFORM_AR = :AUTO_EFORM_AR,'
      '  AUTO_EFORM_ORD_ACK = :AUTO_EFORM_ORD_ACK,'
      '  AUTO_EFORM_ORD_ACK_CONTACT = :AUTO_EFORM_ORD_ACK_CONTACT,'
      '  AUTO_EFORM_BOL = :AUTO_EFORM_BOL,'
      '  AUTO_EFORM_CS = :AUTO_EFORM_CS,'
      '  AUTO_EFORM_SPC = :AUTO_EFORM_SPC,'
      '  AUTO_EFORM_COC = :AUTO_EFORM_COC,'
      '  VERIFIED_DATE = :VERIFIED_DATE,'
      '  EMAIL_DUNNING = :EMAIL_DUNNING'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from contact'
      'where'
      '  ID = :OLD_ID')
    Left = 208
    Top = 272
  end
  object QryDistCtr: TFDQuery
    MasterSource = SrcArcusto
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       attn,'
      '       addr1,'
      '       addr2,'
      '       addr3,'
      '       city,'
      '       state,'
      '       country,'
      '       zip,'
      '       phone_number,'
      '       eplant_id'
      ' from dist_center'
      'where misc.eplant_filter(eplant_id) = 1'
      ' '
      ' ')
    Left = 361
    Top = 224
    object QryDistCtrATTN: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 30
      FieldName = 'ATTN'
      FixedChar = True
      Size = 60
    end
    object QryDistCtrADDR1: TStringField
      DisplayLabel = 'Address1'
      DisplayWidth = 15
      FieldName = 'ADDR1'
      FixedChar = True
      Size = 60
    end
    object QryDistCtrADDR2: TStringField
      DisplayLabel = 'Address2'
      DisplayWidth = 30
      FieldName = 'ADDR2'
      FixedChar = True
      Size = 60
    end
    object QryDistCtrADDR3: TStringField
      DisplayLabel = 'Address3'
      DisplayWidth = 15
      FieldName = 'ADDR3'
      FixedChar = True
      Size = 60
    end
    object QryDistCtrCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 15
      FieldName = 'CITY'
      FixedChar = True
      Size = 30
    end
    object QryDistCtrCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 15
      FieldName = 'COUNTRY'
      FixedChar = True
      Size = 30
    end
    object QryDistCtrPHONE_NUMBER: TStringField
      DisplayLabel = 'Phone#'
      DisplayWidth = 10
      FieldName = 'PHONE_NUMBER'
      Size = 25
    end
    object QryDistCtrSTATE: TStringField
      DisplayLabel = 'State'
      DisplayWidth = 2
      FieldName = 'STATE'
      FixedChar = True
    end
    object QryDistCtrZIP: TStringField
      DisplayWidth = 10
      FieldName = 'ZIP'
      FixedChar = True
      Size = 10
    end
    object QryDistCtrEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object QryDistCtrID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object SrcDistCtr: TDataSource
    DataSet = TblDistCtr
    Left = 443
    Top = 224
  end
  object TblDistCtr: TFDTable
    BeforeOpen = TblDistCtrBeforeOpen
    BeforePost = TblDistCtrBeforePost
    BeforeDelete = TblDistCtrBeforeDelete
    OnNewRecord = TblDistCtrNewRecord
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'DIST_CENTER'
    TableName = 'DIST_CENTER'
    Left = 443
    Top = 240
    object TblDistCtrEPlant_Name: TStringField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'EPlant_Name'
      LookupDataSet = QryEPlant
      LookupKeyFields = 'ID'
      LookupResultField = 'PLANT_NAME'
      KeyFields = 'EPLANT_ID'
      Lookup = True
    end
    object TblDistCtrATTN: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 30
      FieldName = 'ATTN'
      FixedChar = True
      Size = 60
    end
    object TblDistCtrADDR1: TStringField
      DisplayLabel = 'Address1'
      DisplayWidth = 30
      FieldName = 'ADDR1'
      FixedChar = True
      Size = 60
    end
    object TblDistCtrADDR2: TStringField
      DisplayLabel = 'Address2'
      DisplayWidth = 30
      FieldName = 'ADDR2'
      FixedChar = True
      Size = 60
    end
    object TblDistCtrADDR3: TStringField
      DisplayLabel = 'Address3'
      DisplayWidth = 30
      FieldName = 'ADDR3'
      FixedChar = True
      Size = 60
    end
    object TblDistCtrCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 30
      FieldName = 'CITY'
      FixedChar = True
      Size = 30
    end
    object TblDistCtrSTATE: TStringField
      DisplayLabel = 'State'
      DisplayWidth = 2
      FieldName = 'STATE'
      FixedChar = True
    end
    object TblDistCtrCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 30
      FieldName = 'COUNTRY'
      FixedChar = True
      Size = 30
    end
    object TblDistCtrZIP: TStringField
      DisplayWidth = 10
      FieldName = 'ZIP'
      FixedChar = True
      Size = 10
    end
    object TblDistCtrPHONE_NUMBER: TStringField
      DisplayLabel = 'Phone'
      DisplayWidth = 25
      FieldName = 'PHONE_NUMBER'
      OnGetText = TblDistCtrPHONE_NUMBERGetText
      Size = 25
    end
    object TblDistCtrEXT: TStringField
      DisplayLabel = 'Ext.'
      DisplayWidth = 5
      FieldName = 'EXT'
      FixedChar = True
      Size = 5
    end
    object TblDistCtrFAX: TStringField
      DisplayLabel = 'Fax'
      DisplayWidth = 25
      FieldName = 'FAX'
      OnGetText = TblDistCtrPHONE_NUMBERGetText
      Size = 25
    end
    object TblDistCtrPRIME_CONTACT: TStringField
      DisplayLabel = 'Contact'
      DisplayWidth = 30
      FieldName = 'PRIME_CONTACT'
      FixedChar = True
      Size = 30
    end
    object TblDistCtrUSE_USA_MASK: TStringField
      DisplayLabel = 'USa Mask'
      DisplayWidth = 1
      FieldName = 'USE_USA_MASK'
      FixedChar = True
      Size = 1
    end
    object TblDistCtrNOTES: TStringField
      DisplayWidth = 10
      FieldName = 'NOTES'
      Visible = False
      Size = 2000
    end
    object TblDistCtrEPLANT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
    object TblDistCtrID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object TblDistCtrSHIP_TIME: TBCDField
      FieldName = 'SHIP_TIME'
      Visible = False
      Size = 3
    end
  end
  object QryShipTo: TFDQuery
    BeforeOpen = QryShipToBeforeOpen
    AfterOpen = QryShipToAfterOpen
    BeforeInsert = PostArcustoBeforeEdit
    BeforeEdit = QryShipToBeforeEdit
    BeforePost = QryShipToBeforePost
    BeforeCancel = ConfirmCancel
    BeforeDelete = QryShipToBeforeDelete
    OnCalcFields = QryShipToCalcFields
    OnNewRecord = QryShipToNewRecord
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'SHIP_TO'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLShipTo
    SQL.Strings = (
      'SELECT ship_to.id,'
      '       ship_to.arcusto_id,'
      '       ship_to.attn,'
      '       ship_to.addr1,'
      '       ship_to.addr2,'
      '       ship_to.addr3,'
      '       ship_to.city,'
      '       ship_to.state,'
      '       ship_to.state_id,'
      '       ship_to.country,'
      '       ship_to.country_id,'
      '       ship_to.zip,'
      '       ship_to.ship_time,'
      '       ship_to.tax_code_id,'
      '       ship_to.phone_number,'
      '       ship_to.ext,'
      '       ship_to.fax,'
      '       ship_to.prime_contact,'
      '       ship_to.freight_id,'
      '       freight.descrip AS freight_descrip,'
      '       ship_to.notes,'
      '       ship_to.fob,'
      '       ship_to.use_usa_mask,'
      '       ship_to.eplant_id,'
      '       ship_to.days_margin,'
      '       ship_to.qty_pcnt_margin,'
      '       ship_to.locations_id,'
      '       ship_to.default_ship_to,'
      '       ship_to.cuser1,'
      '       ship_to.cuser2,'
      '       ship_to.vmi_invoice_on_ship,'
      '       ship_to.sun_ship,'
      '       ship_to.mon_ship,'
      '       ship_to.tue_ship,'
      '       ship_to.wed_ship,'
      '       ship_to.thu_ship,'
      '       ship_to.fri_ship,'
      '       ship_to.sat_ship,'
      '       ship_to.use_dockid_pickticket,'
      '       ship_to.dist_center_id,'
      '       ship_to.dockid,'
      '       ship_to.pool_code,'
      '       ship_to.bol_note,'
      '       ship_to.pk_tkt_keep_rel_separate,'
      '       ship_to.packslip_report,'
      '       ship_to.bol_report,'
      '       ship_to.bol_header_report,'
      '       ship_to.division_id,'
      '       ship_to.vmi_usesysdate_autoinv,'
      '       ship_to.cuser3,'
      '       ship_to.cuser4,'
      '       ship_to.cuser5,'
      '       ship_to.nuser1,'
      '       ship_to.nuser2,'
      '       ship_to.nuser3,'
      '       ship_to.nuser4,'
      '       ship_to.nuser5,'
      '       ship_to.no_printed_invoice,'
      '       ship_to.preferred_ship_day,'
      '       ship_to.pk_tkt_exclude_forecast_rel,'
      '       ship_to.supplier_code,'
      '       ship_to.billing_supplier_code,'
      '       ship_to.cuser6,'
      '       ship_to.cuser7,'
      '       ship_to.bill_to_id,'
      '       ship_to.match_release_based_on_ran,'
      '       ship_to.pk_hide,'
      '       ship_to.vmi_use_cons_date,'
      '       ship_to.trailer_id,'
      '       ship_to.commissions_id,'
      '       ship_to.cuser8,'
      '       ship_to.cuser9,'
      '       ship_to.cuser10,'
      '       ship_to.cuser11,'
      '       ship_to.cuser12,'
      '       ship_to.cuser13,'
      '       ship_to.cuser14,'
      '       ship_to.cuser15,'
      '       ship_to.comm_pcnt,'
      '       ship_to.consolidator_id,'
      '       ship_to.priority_level,'
      '       ship_to.coc_report,'
      '       ship_to.coc_required,'
      '       ship_to.importer_id,'
      '       ship_to.bol_all_ps_report,'
      '       ship_to.account_number,'
      '       ship_to.is_make_to_order,'
      '       ship_to.rebate_params_id,'
      '       ship_to.freight_rev_pcnt,'
      '       ship_to.fob_third_party_id,'
      '       ship_to.info_so,'
      '       ship_to.territory_id,'
      '       territory.code AS territory_code,'
      '       ship_to.direct_ship_locatons_id,'
      '       ship_to.commer_invoice_report,'
      '       ship_to.commer_invoice_required,'
      '       ship_to.reval_unit_price_inv_date,'
      '       ship_to.cust_type_id,'
      '       ship_to.ps_verify_inventory,'
      '       ship_to.tax_exempt_num,'
      '       ship_to.ARCUSTO_USAGE_TYPE_ID,'
      '       ship_to.SHIPMAN_PRINT_BOX_LABEL'
      '  /* _FROM_START */'
      '  FROM ship_to, freight, territory'
      ' /* _WHERE_START */'
      ' WHERE arcusto_id = :arcusto_id AND'
      '       misc.eplant_filter(ship_to.eplant_id) = 1 AND'
      '       freight.id(+) = ship_to.freight_id AND'
      '       territory.id(+) = ship_to.territory_id'
      ''
      ''
      '-- HPICK_PROPAGATE_SORT_START'
      '-- do not remove these comments'
      '-- HPICK_PROPAGATE_SORT_END')
    Left = 343
    Top = 321
    ParamData = <
      item
        Name = 'arcusto_id'
        DataType = ftBCD
        ParamType = ptInput
        Value = Null
      end>
    object QryShipToID: TBCDField
      FieldName = 'ID'
      Origin = 'SHIP_TO.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object QryShipToARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Origin = 'SHIP_TO.ARCUSTO_ID'
      Size = 0
    end
    object QryShipToATTN: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 30
      FieldName = 'ATTN'
      Origin = 'SHIP_TO.ATTN'
      FixedChar = True
      Size = 60
    end
    object QryShipToADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 30
      FieldName = 'ADDR1'
      Origin = 'SHIP_TO.ADDR1'
      FixedChar = True
      Size = 60
    end
    object QryShipToADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 30
      FieldName = 'ADDR2'
      Origin = 'SHIP_TO.ADDR2'
      FixedChar = True
      Size = 60
    end
    object QryShipToADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 30
      FieldName = 'ADDR3'
      Origin = 'SHIP_TO.ADDR3'
      FixedChar = True
      Size = 60
    end
    object QryShipToCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Origin = 'SHIP_TO.CITY'
      FixedChar = True
      Size = 30
    end
    object QryShipToSTATE: TStringField
      DisplayLabel = 'State or Region'
      FieldName = 'STATE'
      Origin = 'SHIP_TO.STATE'
    end
    object QryShipToCOUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      Origin = 'SHIP_TO.COUNTRY'
      FixedChar = True
      Size = 30
    end
    object QryShipToZIP: TStringField
      DisplayLabel = 'Zip'
      FieldName = 'ZIP'
      Origin = 'SHIP_TO.ZIP'
      FixedChar = True
      Size = 10
    end
    object QryShipToSHIP_TIME: TBCDField
      DisplayLabel = 'Ship Days'
      FieldName = 'SHIP_TIME'
      Origin = 'SHIP_TO.SHIP_TIME'
      Size = 3
    end
    object QryShipToPHONE_NUMBER: TStringField
      DisplayLabel = 'Phone Number'
      FieldName = 'PHONE_NUMBER'
      Origin = 'SHIP_TO.PHONE_NUMBER'
      OnGetText = QryShipToPHONE_NUMBERGetText
      Size = 25
    end
    object QryShipToEXT: TStringField
      DisplayLabel = 'Ext'
      FieldName = 'EXT'
      Origin = 'SHIP_TO.EXT'
      FixedChar = True
      Size = 5
    end
    object QryShipToFAX: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX'
      Origin = 'SHIP_TO.FAX'
      OnGetText = QryShipToPHONE_NUMBERGetText
      Size = 25
    end
    object QryShipToPRIME_CONTACT: TStringField
      DisplayLabel = 'Contact'
      FieldName = 'PRIME_CONTACT'
      Origin = 'SHIP_TO.PRIME_CONTACT'
      FixedChar = True
      Size = 30
    end
    object QryShipToTAX_CODE_ID: TBCDField
      FieldName = 'TAX_CODE_ID'
      Origin = 'SHIP_TO.TAX_CODE_ID'
      Size = 0
    end
    object QryShipToFREIGHT_ID: TBCDField
      FieldName = 'FREIGHT_ID'
      Origin = 'SHIP_TO.FREIGHT_ID'
      Size = 0
    end
    object QryShipToTax_Code: TStringField
      FieldKind = fkCalculated
      FieldName = 'Tax_Code'
      Calculated = True
    end
    object QryShipToFreight_Comp: TStringField
      DisplayLabel = 'Ship Via'
      FieldKind = fkCalculated
      FieldName = 'Freight_Comp'
      Calculated = True
    end
    object QryShipToNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'SHIP_TO.NOTES'
      Size = 2000
    end
    object QryShipToFOB: TStringField
      FieldName = 'FOB'
      Origin = 'SHIP_TO.FOB'
      Size = 60
    end
    object QryShipToUSE_USA_MASK: TStringField
      FieldName = 'USE_USA_MASK'
      Origin = 'SHIP_TO.USE_USA_MASK'
      FixedChar = True
      Size = 1
    end
    object QryShipToEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'SHIP_TO.EPLANT_ID'
      Size = 0
    end
    object QryShipToEPlant_Name: TStringField
      FieldKind = fkLookup
      FieldName = 'EPlant_Name'
      LookupDataSet = QryEPlant
      LookupKeyFields = 'ID'
      LookupResultField = 'PLANT_NAME'
      KeyFields = 'EPLANT_ID'
      Lookup = True
    end
    object QryShipToDAYS_MARGIN: TBCDField
      FieldName = 'DAYS_MARGIN'
      Origin = 'SHIP_TO.DAYS_MARGIN'
      Size = 0
    end
    object QryShipToQTY_PCNT_MARGIN: TBCDField
      FieldName = 'QTY_PCNT_MARGIN'
      Origin = 'SHIP_TO.QTY_PCNT_MARGIN'
      Size = 2
    end
    object QryShipToLOCATIONS_ID: TBCDField
      FieldName = 'LOCATIONS_ID'
      Origin = 'SHIP_TO.LOCATIONS_ID'
      Size = 0
    end
    object QryShipToDEFAULT_SHIP_TO: TStringField
      FieldName = 'DEFAULT_SHIP_TO'
      Origin = 'SHIP_TO.DEFAULT_SHIP_TO'
      FixedChar = True
      Size = 1
    end
    object QryShipToCUSER1: TStringField
      FieldName = 'CUSER1'
      Origin = 'SHIP_TO.CUSER1'
      Size = 60
    end
    object QryShipToCUSER2: TStringField
      FieldName = 'CUSER2'
      Origin = 'SHIP_TO.CUSER2'
      Size = 60
    end
    object QryShipToVMI_INVOICE_ON_SHIP: TStringField
      FieldName = 'VMI_INVOICE_ON_SHIP'
      Origin = 'SHIP_TO.VMI_INVOICE_ON_SHIP'
      FixedChar = True
      Size = 1
    end
    object QryShipToVMI_Invoice_On_Display: TStringField
      FieldKind = fkCalculated
      FieldName = 'VMI_Invoice_On_Display'
      Calculated = True
    end
    object QryShipToSUN_SHIP: TStringField
      FieldName = 'SUN_SHIP'
      Origin = 'SHIP_TO.SUN_SHIP'
      FixedChar = True
      Size = 1
    end
    object QryShipToMON_SHIP: TStringField
      FieldName = 'MON_SHIP'
      Origin = 'SHIP_TO.MON_SHIP'
      FixedChar = True
      Size = 1
    end
    object QryShipToTUE_SHIP: TStringField
      FieldName = 'TUE_SHIP'
      Origin = 'SHIP_TO.TUE_SHIP'
      FixedChar = True
      Size = 1
    end
    object QryShipToWED_SHIP: TStringField
      FieldName = 'WED_SHIP'
      Origin = 'SHIP_TO.WED_SHIP'
      FixedChar = True
      Size = 1
    end
    object QryShipToTHU_SHIP: TStringField
      FieldName = 'THU_SHIP'
      Origin = 'SHIP_TO.THU_SHIP'
      FixedChar = True
      Size = 1
    end
    object QryShipToFRI_SHIP: TStringField
      FieldName = 'FRI_SHIP'
      Origin = 'SHIP_TO.FRI_SHIP'
      FixedChar = True
      Size = 1
    end
    object QryShipToSAT_SHIP: TStringField
      FieldName = 'SAT_SHIP'
      Origin = 'SHIP_TO.SAT_SHIP'
      FixedChar = True
      Size = 1
    end
    object QryShipToUSE_DOCKID_PICKTICKET: TStringField
      FieldName = 'USE_DOCKID_PICKTICKET'
      Origin = 'SHIP_TO.USE_DOCKID_PICKTICKET'
      FixedChar = True
      Size = 1
    end
    object QryShipToDIST_CENTER_ID: TBCDField
      FieldName = 'DIST_CENTER_ID'
      Origin = 'SHIP_TO.DIST_CENTER_ID'
      Size = 0
    end
    object QryShipToDOCKID: TStringField
      FieldName = 'DOCKID'
      Origin = 'SHIP_TO.DOCKID'
      Size = 30
    end
    object QryShipToPOOL_CODE: TStringField
      FieldName = 'POOL_CODE'
      Origin = 'SHIP_TO.POOL_CODE'
      Size = 30
    end
    object QryShipToBOL_NOTE: TStringField
      DisplayLabel = 'BOL Note'
      FieldName = 'BOL_NOTE'
      Origin = 'SHIP_TO.BOL_NOTE'
      Size = 2000
    end
    object QryShipToPK_TKT_KEEP_REL_SEPARATE: TStringField
      FieldName = 'PK_TKT_KEEP_REL_SEPARATE'
      Origin = 'SHIP_TO.PK_TKT_KEEP_REL_SEPARATE'
      FixedChar = True
      Size = 1
    end
    object QryShipToPACKSLIP_REPORT: TStringField
      FieldName = 'PACKSLIP_REPORT'
      Origin = 'SHIP_TO.PACKSLIP_REPORT'
      Size = 250
    end
    object QryShipToBOL_REPORT: TStringField
      FieldName = 'BOL_REPORT'
      Origin = 'SHIP_TO.BOL_REPORT'
      Size = 250
    end
    object QryShipToBOL_HEADER_REPORT: TStringField
      FieldName = 'BOL_HEADER_REPORT'
      Origin = 'SHIP_TO.BOL_HEADER_REPORT'
      Size = 250
    end
    object QryShipToDIVISION_ID: TBCDField
      FieldName = 'DIVISION_ID'
      Origin = 'SHIP_TO.DIVISION_ID'
      Size = 0
    end
    object QryShipToDivision: TStringField
      FieldKind = fkLookup
      FieldName = 'Division'
      LookupDataSet = QryDivision
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'DIVISION_ID'
      Lookup = True
    end
    object QryShipToVMI_USESYSDATE_AUTOINV: TStringField
      FieldName = 'VMI_USESYSDATE_AUTOINV'
      Origin = 'SHIP_TO.VMI_USESYSDATE_AUTOINV'
      FixedChar = True
      Size = 1
    end
    object QryShipToCUSER3: TStringField
      FieldName = 'CUSER3'
      Origin = 'SHIP_TO.CUSER3'
      Size = 60
    end
    object QryShipToCUSER4: TStringField
      FieldName = 'CUSER4'
      Origin = 'SHIP_TO.CUSER4'
      Size = 60
    end
    object QryShipToCUSER5: TStringField
      FieldName = 'CUSER5'
      Origin = 'SHIP_TO.CUSER5'
      Size = 60
    end
    object QryShipToNUSER1: TFMTBCDField
      FieldName = 'NUSER1'
      Origin = 'SHIP_TO.NUSER1'
      Size = 6
    end
    object QryShipToNUSER2: TFMTBCDField
      FieldName = 'NUSER2'
      Origin = 'SHIP_TO.NUSER2'
      Size = 6
    end
    object QryShipToNUSER3: TFMTBCDField
      FieldName = 'NUSER3'
      Origin = 'SHIP_TO.NUSER3'
      Size = 6
    end
    object QryShipToNUSER4: TFMTBCDField
      FieldName = 'NUSER4'
      Origin = 'SHIP_TO.NUSER4'
      Size = 6
    end
    object QryShipToNUSER5: TFMTBCDField
      FieldName = 'NUSER5'
      Origin = 'SHIP_TO.NUSER5'
      Size = 6
    end
    object QryShipToNO_PRINTED_INVOICE: TStringField
      FieldName = 'NO_PRINTED_INVOICE'
      Origin = 'SHIP_TO.NO_PRINTED_INVOICE'
      FixedChar = True
      Size = 1
    end
    object QryShipToPREFERRED_SHIP_DAY: TBCDField
      DisplayLabel = 'Preferred Ship Day'
      FieldName = 'PREFERRED_SHIP_DAY'
      Origin = 'SHIP_TO.PREFERRED_SHIP_DAY'
      Size = 0
    end
    object QryShipToPK_TKT_EXCLUDE_FORECAST_REL: TStringField
      FieldName = 'PK_TKT_EXCLUDE_FORECAST_REL'
      Origin = 'SHIP_TO.PK_TKT_EXCLUDE_FORECAST_REL'
      FixedChar = True
      Size = 1
    end
    object QryShipToSUPPLIER_CODE: TStringField
      FieldName = 'SUPPLIER_CODE'
      Origin = 'SHIP_TO.SUPPLIER_CODE'
      Size = 30
    end
    object QryShipToBILLING_SUPPLIER_CODE: TStringField
      FieldName = 'BILLING_SUPPLIER_CODE'
      Origin = 'SHIP_TO.BILLING_SUPPLIER_CODE'
      Size = 30
    end
    object QryShipToCUSER6: TStringField
      FieldName = 'CUSER6'
      Origin = 'SHIP_TO.CUSER6'
      Size = 60
    end
    object QryShipToCUSER7: TStringField
      FieldName = 'CUSER7'
      Origin = 'SHIP_TO.CUSER7'
      Size = 60
    end
    object QryShipToBILL_TO_ID: TBCDField
      FieldName = 'BILL_TO_ID'
      Origin = 'SHIP_TO.BILL_TO_ID'
      Size = 0
    end
    object QryShipToBillTo: TStringField
      FieldKind = fkLookup
      FieldName = 'BillTo'
      LookupDataSet = QryEdiBillTo
      LookupKeyFields = 'ID'
      LookupResultField = 'ATTN'
      KeyFields = 'BILL_TO_ID'
      Lookup = True
    end
    object QryShipToMATCH_RELEASE_BASED_ON_RAN: TStringField
      FieldName = 'MATCH_RELEASE_BASED_ON_RAN'
      Origin = 'SHIP_TO.MATCH_RELEASE_BASED_ON_RAN'
      FixedChar = True
      Size = 1
    end
    object QryShipToPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'SHIP_TO.PK_HIDE'
      FixedChar = True
      Size = 1
    end
    object QryShipToVMI_USE_CONS_DATE: TStringField
      FieldName = 'VMI_USE_CONS_DATE'
      Origin = 'SHIP_TO.VMI_USE_CONS_DATE'
      FixedChar = True
      Size = 1
    end
    object QryShipToTRAILER_ID: TBCDField
      FieldName = 'TRAILER_ID'
      Origin = 'SHIP_TO.TRAILER_ID'
      Size = 0
    end
    object QryShipToCOMMISSIONS_ID: TBCDField
      FieldName = 'COMMISSIONS_ID'
      Origin = 'SHIP_TO.COMMISSIONS_ID'
      Size = 0
    end
    object QryShipToCOMM_PCNT: TFMTBCDField
      FieldName = 'COMM_PCNT'
      Origin = 'SHIP_TO.COMM_PCNT'
      Size = 6
    end
    object QryShipToCUSER8: TStringField
      FieldName = 'CUSER8'
      Origin = 'SHIP_TO.CUSER8'
      Size = 60
    end
    object QryShipToCUSER9: TStringField
      FieldName = 'CUSER9'
      Origin = 'SHIP_TO.CUSER9'
      Size = 60
    end
    object QryShipToCUSER10: TStringField
      FieldName = 'CUSER10'
      Origin = 'SHIP_TO.CUSER10'
      Size = 60
    end
    object QryShipToCUSER11: TStringField
      FieldName = 'CUSER11'
      Origin = 'SHIP_TO.CUSER11'
      Size = 60
    end
    object QryShipToCUSER12: TStringField
      FieldName = 'CUSER12'
      Origin = 'SHIP_TO.CUSER12'
      Size = 60
    end
    object QryShipToCUSER13: TStringField
      FieldName = 'CUSER13'
      Origin = 'SHIP_TO.CUSER13'
      Size = 60
    end
    object QryShipToCUSER14: TStringField
      FieldName = 'CUSER14'
      Origin = 'SHIP_TO.CUSER14'
      Size = 60
    end
    object QryShipToCUSER15: TStringField
      FieldName = 'CUSER15'
      Origin = 'SHIP_TO.CUSER15'
      Size = 60
    end
    object QryShipToCONSOLIDATOR_ID: TBCDField
      FieldName = 'CONSOLIDATOR_ID'
      Origin = 'SHIP_TO.CONSOLIDATOR_ID'
      Size = 0
    end
    object QryShipToPRIORITY_LEVEL: TBCDField
      DisplayLabel = 'Priority Level'
      FieldName = 'PRIORITY_LEVEL'
      Origin = 'SHIP_TO.PRIORITY_LEVEL'
      Size = 0
    end
    object QryShipToCOC_REPORT: TStringField
      FieldName = 'COC_REPORT'
      Origin = 'SHIP_TO.COC_REPORT'
      Size = 250
    end
    object QryShipToCOC_REQUIRED: TStringField
      FieldName = 'COC_REQUIRED'
      Origin = 'SHIP_TO.COC_REQUIRED'
      Size = 1
    end
    object QryShipToIMPORTER_ID: TBCDField
      FieldName = 'IMPORTER_ID'
      Origin = 'SHIP_TO.IMPORTER_ID'
      Visible = False
      Size = 0
    end
    object QryShipToBOL_ALL_PS_REPORT: TStringField
      FieldName = 'BOL_ALL_PS_REPORT'
      Origin = 'SHIP_TO.BOL_ALL_PS_REPORT'
      Visible = False
      Size = 250
    end
    object QryShipToACCOUNT_NUMBER: TStringField
      FieldName = 'ACCOUNT_NUMBER'
      Origin = 'SHIP_TO.ACCOUNT_NUMBER'
      Visible = False
      Size = 15
    end
    object QryShipToIS_MAKE_TO_ORDER: TStringField
      FieldName = 'IS_MAKE_TO_ORDER'
      Origin = 'SHIP_TO.IS_MAKE_TO_ORDER'
      Visible = False
      Size = 1
    end
    object QryShipToRebateParam: TStringField
      FieldKind = fkCalculated
      FieldName = 'RebateParam'
      Size = 100
      Calculated = True
    end
    object QryShipToREBATE_PARAMS_ID: TBCDField
      FieldName = 'REBATE_PARAMS_ID'
      Origin = 'SHIP_TO.REBATE_PARAMS_ID'
      Size = 0
    end
    object QryShipToFREIGHT_REV_PCNT: TBCDField
      FieldName = 'FREIGHT_REV_PCNT'
      Origin = 'SHIP_TO.FREIGHT_REV_PCNT'
      Size = 2
    end
    object QryShipToFOB_THIRD_PARTY_ID: TBCDField
      FieldName = 'FOB_THIRD_PARTY_ID'
      Origin = 'SHIP_TO.FOB_THIRD_PARTY_ID'
      Size = 0
    end
    object QryShipToINFO_SO: TStringField
      FieldName = 'INFO_SO'
      Origin = 'SHIP_TO.INFO_SO'
      Size = 255
    end
    object QryShipToTERRITORY_ID: TBCDField
      FieldName = 'TERRITORY_ID'
      Origin = 'TERRITORY_ID'
      Precision = 15
      Size = 0
    end
    object QryShipToTERRITORY_CODE: TStringField
      FieldName = 'TERRITORY_CODE'
      Origin = 'TERRITORY_CODE'
      Size = 50
    end
    object QryShipToDIRECT_SHIP_LOCATONS_ID: TBCDField
      FieldName = 'DIRECT_SHIP_LOCATONS_ID'
      Origin = 'SHIP_TO.DIRECT_SHIP_LOCATONS_ID'
      Size = 0
    end
    object QryShipToDIRECT_SHIP_LOCATON: TStringField
      FieldKind = fkCalculated
      FieldName = 'DIRECT_SHIP_LOCATON'
      Calculated = True
    end
    object QryShipToCOMMER_INVOICE_REPORT: TStringField
      FieldName = 'COMMER_INVOICE_REPORT'
      Origin = 'SHIP_TO.COMMER_INVOICE_REPORT'
      Visible = False
      Size = 50
    end
    object QryShipToCOMMER_INVOICE_REQUIRED: TStringField
      FieldName = 'COMMER_INVOICE_REQUIRED'
      Origin = 'SHIP_TO.COMMER_INVOICE_REQUIRED'
      Visible = False
      Size = 1
    end
    object QryShipToREVAL_UNIT_PRICE_INV_DATE: TStringField
      FieldName = 'REVAL_UNIT_PRICE_INV_DATE'
      Origin = 'SHIP_TO.REVAL_UNIT_PRICE_INV_DATE'
      Size = 1
    end
    object QryShipToCUST_TYPE_ID: TBCDField
      FieldName = 'CUST_TYPE_ID'
      Origin = 'SHIP_TO.CUST_TYPE_ID'
      Size = 0
    end
    object QryShipToFREIGHT_DESCRIP: TStringField
      FieldName = 'FREIGHT_DESCRIP'
      Size = 60
    end
    object QryShipToPS_VERIFY_INVENTORY: TStringField
      FieldName = 'PS_VERIFY_INVENTORY'
      Visible = False
      Size = 1
    end
    object QryShipToTAX_EXEMPT_NUM: TStringField
      FieldName = 'TAX_EXEMPT_NUM'
      Visible = False
      Size = 25
    end
    object QryShipToUsageTypeCode: TStringField
      FieldKind = fkCalculated
      FieldName = 'UsageTypeCode'
      Size = 255
      Calculated = True
    end
    object QryShipToARCUSTO_USAGE_TYPE_ID: TBCDField
      FieldName = 'ARCUSTO_USAGE_TYPE_ID'
      Origin = 'ARCUSTO_USAGE_TYPE_ID'
      Precision = 15
      Size = 0
    end
    object QryShipToSHIPMAN_PRINT_BOX_LABEL: TStringField
      FieldName = 'SHIPMAN_PRINT_BOX_LABEL'
      Origin = 'SHIPMAN_PRINT_BOX_LABEL'
      Size = 1
    end
    object QryShipToSTATE_ID: TBCDField
      FieldName = 'STATE_ID'
      Origin = 'STATE_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryShipToCOUNTRY_ID: TBCDField
      FieldName = 'COUNTRY_ID'
      Origin = 'COUNTRY_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object UpdateSQLShipTo: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'INSERT INTO IQMS.SHIP_TO'
      '(ID, ARCUSTO_ID, ATTN, ADDR1, ADDR2, '
      '  ADDR3, CITY, STATE, COUNTRY, ZIP, '
      '  SHIP_TIME, TAX_CODE_ID, PHONE_NUMBER, EXT, '
      '  FAX, PRIME_CONTACT, FREIGHT_ID, NOTES, '
      '  FOB, USE_USA_MASK, EPLANT_ID, DAYS_MARGIN, '
      '  QTY_PCNT_MARGIN, LOCATIONS_ID, DEFAULT_SHIP_TO, '
      '  CUSER1, CUSER2, VMI_INVOICE_ON_SHIP, SUN_SHIP, '
      '  MON_SHIP, TUE_SHIP, WED_SHIP, THU_SHIP, '
      '  FRI_SHIP, SAT_SHIP, USE_DOCKID_PICKTICKET, '
      '  DIST_CENTER_ID, DOCKID, POOL_CODE, BOL_NOTE, '
      '  PK_TKT_KEEP_REL_SEPARATE, PACKSLIP_REPORT, BOL_REPORT, '
      '  BOL_HEADER_REPORT, DIVISION_ID, VMI_USESYSDATE_AUTOINV, '
      '  CUSER3, CUSER4, CUSER5, NUSER1, NUSER2, '
      '  NUSER3, NUSER4, NUSER5, NO_PRINTED_INVOICE, '
      '  PREFERRED_SHIP_DAY, PK_TKT_EXCLUDE_FORECAST_REL, '
      '  SUPPLIER_CODE, BILLING_SUPPLIER_CODE, CUSER6, '
      '  CUSER7, BILL_TO_ID, MATCH_RELEASE_BASED_ON_RAN, '
      '  BOL_ALL_PS_REPORT, PK_HIDE, VMI_USE_CONS_DATE, '
      '  TRAILER_ID, COMM_PCNT, COMMISSIONS_ID, CUSER8, '
      '  CUSER9, CUSER10, CUSER11, CUSER12, CUSER13, '
      '  CUSER14, CUSER15, CONSOLIDATOR_ID, PRIORITY_LEVEL, '
      '  COC_REPORT, COC_REQUIRED, IMPORTER_ID, ACCOUNT_NUMBER, '
      '  IS_MAKE_TO_ORDER, REBATE_PARAMS_ID, FREIGHT_REV_PCNT, '
      '  FOB_THIRD_PARTY_ID, INFO_SO, DIRECT_SHIP_LOCATONS_ID, '
      '  COMMER_INVOICE_REQUIRED, COMMER_INVOICE_REPORT, '
      '  REVAL_UNIT_PRICE_INV_DATE, CUST_TYPE_ID, PS_VERIFY_INVENTORY, '
      '  TERRITORY_ID, TAX_EXEMPT_NUM, ARCUSTO_USAGE_TYPE_ID, '
      '  SHIPMAN_PRINT_BOX_LABEL, COUNTRY_ID, STATE_ID)'
      
        'VALUES (:NEW_ID, :NEW_ARCUSTO_ID, :NEW_ATTN, :NEW_ADDR1, :NEW_AD' +
        'DR2, '
      '  :NEW_ADDR3, :NEW_CITY, :NEW_STATE, :NEW_COUNTRY, :NEW_ZIP, '
      
        '  :NEW_SHIP_TIME, :NEW_TAX_CODE_ID, :NEW_PHONE_NUMBER, :NEW_EXT,' +
        ' '
      '  :NEW_FAX, :NEW_PRIME_CONTACT, :NEW_FREIGHT_ID, :NEW_NOTES, '
      
        '  :NEW_FOB, :NEW_USE_USA_MASK, :NEW_EPLANT_ID, :NEW_DAYS_MARGIN,' +
        ' '
      
        '  :NEW_QTY_PCNT_MARGIN, :NEW_LOCATIONS_ID, :NEW_DEFAULT_SHIP_TO,' +
        ' '
      
        '  :NEW_CUSER1, :NEW_CUSER2, :NEW_VMI_INVOICE_ON_SHIP, :NEW_SUN_S' +
        'HIP, '
      '  :NEW_MON_SHIP, :NEW_TUE_SHIP, :NEW_WED_SHIP, :NEW_THU_SHIP, '
      '  :NEW_FRI_SHIP, :NEW_SAT_SHIP, :NEW_USE_DOCKID_PICKTICKET, '
      
        '  :NEW_DIST_CENTER_ID, :NEW_DOCKID, :NEW_POOL_CODE, :NEW_BOL_NOT' +
        'E, '
      
        '  :NEW_PK_TKT_KEEP_REL_SEPARATE, :NEW_PACKSLIP_REPORT, :NEW_BOL_' +
        'REPORT, '
      
        '  :NEW_BOL_HEADER_REPORT, :NEW_DIVISION_ID, :NEW_VMI_USESYSDATE_' +
        'AUTOINV, '
      
        '  :NEW_CUSER3, :NEW_CUSER4, :NEW_CUSER5, :NEW_NUSER1, :NEW_NUSER' +
        '2, '
      
        '  :NEW_NUSER3, :NEW_NUSER4, :NEW_NUSER5, :NEW_NO_PRINTED_INVOICE' +
        ', '
      '  :NEW_PREFERRED_SHIP_DAY, :NEW_PK_TKT_EXCLUDE_FORECAST_REL, '
      '  :NEW_SUPPLIER_CODE, :NEW_BILLING_SUPPLIER_CODE, :NEW_CUSER6, '
      
        '  :NEW_CUSER7, :NEW_BILL_TO_ID, :NEW_MATCH_RELEASE_BASED_ON_RAN,' +
        ' '
      '  :NEW_BOL_ALL_PS_REPORT, :NEW_PK_HIDE, :NEW_VMI_USE_CONS_DATE, '
      
        '  :NEW_TRAILER_ID, :NEW_COMM_PCNT, :NEW_COMMISSIONS_ID, :NEW_CUS' +
        'ER8, '
      
        '  :NEW_CUSER9, :NEW_CUSER10, :NEW_CUSER11, :NEW_CUSER12, :NEW_CU' +
        'SER13, '
      
        '  :NEW_CUSER14, :NEW_CUSER15, :NEW_CONSOLIDATOR_ID, :NEW_PRIORIT' +
        'Y_LEVEL, '
      
        '  :NEW_COC_REPORT, :NEW_COC_REQUIRED, :NEW_IMPORTER_ID, :NEW_ACC' +
        'OUNT_NUMBER, '
      
        '  :NEW_IS_MAKE_TO_ORDER, :NEW_REBATE_PARAMS_ID, :NEW_FREIGHT_REV' +
        '_PCNT, '
      
        '  :NEW_FOB_THIRD_PARTY_ID, :NEW_INFO_SO, :NEW_DIRECT_SHIP_LOCATO' +
        'NS_ID, '
      '  :NEW_COMMER_INVOICE_REQUIRED, :NEW_COMMER_INVOICE_REPORT, '
      
        '  :NEW_REVAL_UNIT_PRICE_INV_DATE, :NEW_CUST_TYPE_ID, :NEW_PS_VER' +
        'IFY_INVENTORY, '
      
        '  :NEW_TERRITORY_ID, :NEW_TAX_EXEMPT_NUM, :NEW_ARCUSTO_USAGE_TYP' +
        'E_ID, '
      '  :NEW_SHIPMAN_PRINT_BOX_LABEL, :NEW_COUNTRY_ID, :NEW_STATE_ID)')
    ModifySQL.Strings = (
      'UPDATE IQMS.SHIP_TO'
      
        'SET ID = :NEW_ID, ARCUSTO_ID = :NEW_ARCUSTO_ID, ATTN = :NEW_ATTN' +
        ', '
      '  ADDR1 = :NEW_ADDR1, ADDR2 = :NEW_ADDR2, ADDR3 = :NEW_ADDR3, '
      '  CITY = :NEW_CITY, STATE = :NEW_STATE, COUNTRY = :NEW_COUNTRY, '
      
        '  ZIP = :NEW_ZIP, SHIP_TIME = :NEW_SHIP_TIME, TAX_CODE_ID = :NEW' +
        '_TAX_CODE_ID, '
      
        '  PHONE_NUMBER = :NEW_PHONE_NUMBER, EXT = :NEW_EXT, FAX = :NEW_F' +
        'AX, '
      
        '  PRIME_CONTACT = :NEW_PRIME_CONTACT, FREIGHT_ID = :NEW_FREIGHT_' +
        'ID, '
      
        '  NOTES = :NEW_NOTES, FOB = :NEW_FOB, USE_USA_MASK = :NEW_USE_US' +
        'A_MASK, '
      '  EPLANT_ID = :NEW_EPLANT_ID, DAYS_MARGIN = :NEW_DAYS_MARGIN, '
      
        '  QTY_PCNT_MARGIN = :NEW_QTY_PCNT_MARGIN, LOCATIONS_ID = :NEW_LO' +
        'CATIONS_ID, '
      '  DEFAULT_SHIP_TO = :NEW_DEFAULT_SHIP_TO, CUSER1 = :NEW_CUSER1, '
      
        '  CUSER2 = :NEW_CUSER2, VMI_INVOICE_ON_SHIP = :NEW_VMI_INVOICE_O' +
        'N_SHIP, '
      
        '  SUN_SHIP = :NEW_SUN_SHIP, MON_SHIP = :NEW_MON_SHIP, TUE_SHIP =' +
        ' :NEW_TUE_SHIP, '
      
        '  WED_SHIP = :NEW_WED_SHIP, THU_SHIP = :NEW_THU_SHIP, FRI_SHIP =' +
        ' :NEW_FRI_SHIP, '
      
        '  SAT_SHIP = :NEW_SAT_SHIP, USE_DOCKID_PICKTICKET = :NEW_USE_DOC' +
        'KID_PICKTICKET, '
      '  DIST_CENTER_ID = :NEW_DIST_CENTER_ID, DOCKID = :NEW_DOCKID, '
      
        '  POOL_CODE = :NEW_POOL_CODE, BOL_NOTE = :NEW_BOL_NOTE, PK_TKT_K' +
        'EEP_REL_SEPARATE = :NEW_PK_TKT_KEEP_REL_SEPARATE, '
      
        '  PACKSLIP_REPORT = :NEW_PACKSLIP_REPORT, BOL_REPORT = :NEW_BOL_' +
        'REPORT, '
      
        '  BOL_HEADER_REPORT = :NEW_BOL_HEADER_REPORT, DIVISION_ID = :NEW' +
        '_DIVISION_ID, '
      
        '  VMI_USESYSDATE_AUTOINV = :NEW_VMI_USESYSDATE_AUTOINV, CUSER3 =' +
        ' :NEW_CUSER3, '
      
        '  CUSER4 = :NEW_CUSER4, CUSER5 = :NEW_CUSER5, NUSER1 = :NEW_NUSE' +
        'R1, '
      
        '  NUSER2 = :NEW_NUSER2, NUSER3 = :NEW_NUSER3, NUSER4 = :NEW_NUSE' +
        'R4, '
      
        '  NUSER5 = :NEW_NUSER5, NO_PRINTED_INVOICE = :NEW_NO_PRINTED_INV' +
        'OICE, '
      
        '  PREFERRED_SHIP_DAY = :NEW_PREFERRED_SHIP_DAY, PK_TKT_EXCLUDE_F' +
        'ORECAST_REL = :NEW_PK_TKT_EXCLUDE_FORECAST_REL, '
      
        '  SUPPLIER_CODE = :NEW_SUPPLIER_CODE, BILLING_SUPPLIER_CODE = :N' +
        'EW_BILLING_SUPPLIER_CODE, '
      
        '  CUSER6 = :NEW_CUSER6, CUSER7 = :NEW_CUSER7, BILL_TO_ID = :NEW_' +
        'BILL_TO_ID, '
      '  MATCH_RELEASE_BASED_ON_RAN = :NEW_MATCH_RELEASE_BASED_ON_RAN, '
      
        '  BOL_ALL_PS_REPORT = :NEW_BOL_ALL_PS_REPORT, PK_HIDE = :NEW_PK_' +
        'HIDE, '
      
        '  VMI_USE_CONS_DATE = :NEW_VMI_USE_CONS_DATE, TRAILER_ID = :NEW_' +
        'TRAILER_ID, '
      
        '  COMM_PCNT = :NEW_COMM_PCNT, COMMISSIONS_ID = :NEW_COMMISSIONS_' +
        'ID, '
      
        '  CUSER8 = :NEW_CUSER8, CUSER9 = :NEW_CUSER9, CUSER10 = :NEW_CUS' +
        'ER10, '
      
        '  CUSER11 = :NEW_CUSER11, CUSER12 = :NEW_CUSER12, CUSER13 = :NEW' +
        '_CUSER13, '
      
        '  CUSER14 = :NEW_CUSER14, CUSER15 = :NEW_CUSER15, CONSOLIDATOR_I' +
        'D = :NEW_CONSOLIDATOR_ID, '
      
        '  PRIORITY_LEVEL = :NEW_PRIORITY_LEVEL, COC_REPORT = :NEW_COC_RE' +
        'PORT, '
      
        '  COC_REQUIRED = :NEW_COC_REQUIRED, IMPORTER_ID = :NEW_IMPORTER_' +
        'ID, '
      
        '  ACCOUNT_NUMBER = :NEW_ACCOUNT_NUMBER, IS_MAKE_TO_ORDER = :NEW_' +
        'IS_MAKE_TO_ORDER, '
      
        '  REBATE_PARAMS_ID = :NEW_REBATE_PARAMS_ID, FREIGHT_REV_PCNT = :' +
        'NEW_FREIGHT_REV_PCNT, '
      
        '  FOB_THIRD_PARTY_ID = :NEW_FOB_THIRD_PARTY_ID, INFO_SO = :NEW_I' +
        'NFO_SO, '
      '  DIRECT_SHIP_LOCATONS_ID = :NEW_DIRECT_SHIP_LOCATONS_ID, '
      '  COMMER_INVOICE_REQUIRED = :NEW_COMMER_INVOICE_REQUIRED, '
      
        '  COMMER_INVOICE_REPORT = :NEW_COMMER_INVOICE_REPORT, REVAL_UNIT' +
        '_PRICE_INV_DATE = :NEW_REVAL_UNIT_PRICE_INV_DATE, '
      
        '  CUST_TYPE_ID = :NEW_CUST_TYPE_ID, PS_VERIFY_INVENTORY = :NEW_P' +
        'S_VERIFY_INVENTORY, '
      
        '  TERRITORY_ID = :NEW_TERRITORY_ID, TAX_EXEMPT_NUM = :NEW_TAX_EX' +
        'EMPT_NUM, '
      
        '  ARCUSTO_USAGE_TYPE_ID = :NEW_ARCUSTO_USAGE_TYPE_ID, SHIPMAN_PR' +
        'INT_BOX_LABEL = :NEW_SHIPMAN_PRINT_BOX_LABEL, '
      '  COUNTRY_ID = :NEW_COUNTRY_ID, STATE_ID = :NEW_STATE_ID'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM IQMS.SHIP_TO'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, ARCUSTO_ID, ATTN, ADDR1, ADDR2, ADDR3, CITY, STATE, C' +
        'OUNTRY, '
      
        '  ZIP, SHIP_TIME, TAX_CODE_ID, PHONE_NUMBER, EXT, FAX, PRIME_CON' +
        'TACT, '
      
        '  FREIGHT_ID, NOTES, ECODE, EID, EDATE_TIME, ECOPY, FOB, USE_USA' +
        '_MASK, '
      
        '  EPLANT_ID, DAYS_MARGIN, QTY_PCNT_MARGIN, LOCATIONS_ID, DEFAULT' +
        '_SHIP_TO, '
      '  CUSER1, CUSER2, VMI_INVOICE_ON_SHIP, SUN_SHIP, MON_SHIP, '
      
        '  TUE_SHIP, WED_SHIP, THU_SHIP, FRI_SHIP, SAT_SHIP, USE_DOCKID_P' +
        'ICKTICKET, '
      
        '  DIST_CENTER_ID, DOCKID, POOL_CODE, BOL_NOTE, PK_TKT_KEEP_REL_S' +
        'EPARATE, '
      '  PACKSLIP_REPORT, BOL_REPORT, BOL_HEADER_REPORT, DIVISION_ID, '
      '  VMI_USESYSDATE_AUTOINV, CUSER3, CUSER4, CUSER5, NUSER1, '
      
        '  NUSER2, NUSER3, NUSER4, NUSER5, NO_PRINTED_INVOICE, PREFERRED_' +
        'SHIP_DAY, '
      
        '  PK_TKT_EXCLUDE_FORECAST_REL, SUPPLIER_CODE, BILLING_SUPPLIER_C' +
        'ODE, '
      '  CUSER6, CUSER7, BILL_TO_ID, MATCH_RELEASE_BASED_ON_RAN, '
      '  BOL_ALL_PS_REPORT, PK_HIDE, VMI_USE_CONS_DATE, TRAILER_ID, '
      '  COMM_PCNT, COMMISSIONS_ID, CUSER8, CUSER9, CUSER10, CUSER11, '
      
        '  CUSER12, CUSER13, CUSER14, CUSER15, CONSOLIDATOR_ID, PRIORITY_' +
        'LEVEL, '
      
        '  COC_REPORT, COC_REQUIRED, IMPORTER_ID, ACCOUNT_NUMBER, IS_MAKE' +
        '_TO_ORDER, '
      '  REBATE_PARAMS_ID, FREIGHT_REV_PCNT, FOB_THIRD_PARTY_ID, '
      
        '  INFO_SO, TERRITORY, DIRECT_SHIP_LOCATONS_ID, COMMER_INVOICE_RE' +
        'QUIRED, '
      
        '  COMMER_INVOICE_REPORT, REVAL_UNIT_PRICE_INV_DATE, CUST_TYPE_ID' +
        ', '
      
        '  PS_VERIFY_INVENTORY, TERRITORY_ID, TAX_EXEMPT_NUM, ARCUSTO_USA' +
        'GE_TYPE_ID, '
      '  SHIPMAN_PRINT_BOX_LABEL, COUNTRY_ID, STATE_ID'
      'FROM IQMS.SHIP_TO'
      'WHERE ID = :ID')
    Left = 332
    Top = 342
  end
  object PkShipTo: TIQWebHpick
    BeforeOpen = PkShipToBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select s.id,'
      '       s.arcusto_id,'
      '       s.attn,'
      '       s.addr1,'
      '       s.addr2,'
      '       s.addr3,'
      '       s.city,'
      '       s.state,'
      '       s.country,'
      '       s.zip,'
      '       s.ship_time,'
      '       s.phone_number,'
      '       s.ext,'
      '       s.fax,'
      '       s.prime_contact,       '
      '       s.tax_code_id,'
      '       t.tax_code,'
      '       s.freight_id,'
      '       f.descrip,'
      '       s.eplant_id,'
      '       e.name,'
      '       s.pk_hide'
      '  from ship_to s,'
      '       freight f,'
      '       eplant e,'
      '       tax_codes t '
      ' where s.arcusto_id = :nid'
      '   and s.freight_id = f.id(+)'
      '   and s.eplant_id = e.id(+)'
      '   and s.tax_code_id = t.id(+)'
      '   and misc.eplant_filter(s.eplant_id) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    AssociatedDataSource = SrcShip_to
    ForceShowWaitForPrompt = False
    Left = 323
    Top = 429
    ParamData = <
      item
        Name = 'nid'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkShipToID: TBCDField
      FieldName = 'ID'
      Origin = 's.id'
      Visible = False
      Size = 0
    end
    object PkShipToARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Origin = 's.arcusto_id'
      Visible = False
      Size = 0
    end
    object PkShipToATTN: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 30
      FieldName = 'ATTN'
      Origin = 's.attn'
      FixedChar = True
      Size = 60
    end
    object PkShipToADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 30
      FieldName = 'ADDR1'
      Origin = 's.addr1'
      FixedChar = True
      Size = 60
    end
    object PkShipToADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 30
      FieldName = 'ADDR2'
      Origin = 's.addr2'
      FixedChar = True
      Size = 60
    end
    object PkShipToADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 30
      FieldName = 'ADDR3'
      Origin = 's.addr3'
      FixedChar = True
      Size = 60
    end
    object PkShipToCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Origin = 's.city'
      FixedChar = True
      Size = 30
    end
    object PkShipToSTATE: TStringField
      DisplayLabel = 'State or Region'
      FieldName = 'STATE'
      Origin = 's.state'
      FixedChar = True
    end
    object PkShipToCOUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      Origin = 's.country'
      FixedChar = True
      Size = 30
    end
    object PkShipToZIP: TStringField
      DisplayLabel = 'Postal Code'
      FieldName = 'ZIP'
      Origin = 's.zip'
      FixedChar = True
      Size = 10
    end
    object PkShipToSHIP_TIME: TBCDField
      DisplayLabel = 'Ship Days'
      FieldName = 'SHIP_TIME'
      Origin = 's.ship_time'
      Size = 3
    end
    object PkShipToPHONE_NUMBER: TStringField
      DisplayLabel = 'Telephone'
      FieldName = 'PHONE_NUMBER'
      Origin = 's.phone_number'
      Size = 25
    end
    object PkShipToEXT: TStringField
      DisplayLabel = 'Extension'
      FieldName = 'EXT'
      Origin = 's.ext'
      FixedChar = True
      Size = 5
    end
    object PkShipToFAX: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX'
      Origin = 's.fax'
      Size = 25
    end
    object PkShipToPRIME_CONTACT: TStringField
      DisplayLabel = 'Primary Contact'
      FieldName = 'PRIME_CONTACT'
      Origin = 's.prime_contact'
      FixedChar = True
      Size = 30
    end
    object PkShipToTAX_CODE_ID: TBCDField
      FieldName = 'TAX_CODE_ID'
      Origin = 's.tax_code_id'
      Visible = False
      Size = 0
    end
    object PkShipToTAX_CODE: TStringField
      DisplayLabel = 'Tax Code'
      FieldName = 'TAX_CODE'
      Origin = 't.tax_code'
    end
    object PkShipToFREIGHT_ID: TBCDField
      FieldName = 'FREIGHT_ID'
      Origin = 's.freight_id'
      Visible = False
      Size = 0
    end
    object PkShipToDESCRIP: TStringField
      DisplayLabel = 'Ship Via'
      FieldName = 'DESCRIP'
      Origin = 'f.descrip'
      Size = 60
    end
    object PkShipToEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 's.eplant_id'
      Visible = False
      Size = 0
    end
    object PkShipToNAME: TStringField
      DisplayLabel = 'EPlant Name'
      FieldName = 'NAME'
      Origin = 'e.name'
      Size = 30
    end
    object PkShipToPK_HIDE: TStringField
      DisplayLabel = 'Inactive'
      FieldName = 'PK_HIDE'
      Origin = 's.pk_hide'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object PkBillTo: TIQWebHpick
    BeforeOpen = PkBillToBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       attn,'
      '       addr1,'
      '       addr2,'
      '       addr3,'
      '       city,'
      '       state,'
      '       country,'
      '       zip,'
      '       prime_contact,'
      '       phone_number,'
      '       ext,'
      '       fax,'
      '       pk_hide'
      '  from bill_to'
      ' where arcusto_id = :nid       '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 271
    Top = 429
    ParamData = <
      item
        Name = 'nid'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkBillToID: TBCDField
      FieldName = 'ID'
      Origin = 'BILL_TO.ID'
      Visible = False
      Size = 0
    end
    object PkBillToATTN: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 30
      FieldName = 'ATTN'
      Origin = 'BILL_TO.ATTN'
      FixedChar = True
      Size = 60
    end
    object PkBillToADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 30
      FieldName = 'ADDR1'
      Origin = 'BILL_TO.ADDR1'
      FixedChar = True
      Size = 60
    end
    object PkBillToADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 30
      FieldName = 'ADDR2'
      Origin = 'BILL_TO.ADDR2'
      FixedChar = True
      Size = 60
    end
    object PkBillToADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 30
      FieldName = 'ADDR3'
      Origin = 'BILL_TO.ADDR3'
      FixedChar = True
      Size = 60
    end
    object PkBillToCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Origin = 'BILL_TO.CITY'
      FixedChar = True
      Size = 30
    end
    object PkBillToSTATE: TStringField
      DisplayLabel = 'State or Region'
      FieldName = 'STATE'
      Origin = 'BILL_TO.STATE'
      FixedChar = True
    end
    object PkBillToCOUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      Origin = 'BILL_TO.COUNTRY'
      FixedChar = True
      Size = 30
    end
    object PkBillToZIP: TStringField
      DisplayLabel = 'Postal Code'
      FieldName = 'ZIP'
      Origin = 'BILL_TO.ZIP'
      FixedChar = True
      Size = 10
    end
    object PkBillToPRIME_CONTACT: TStringField
      DisplayLabel = 'Contact'
      FieldName = 'PRIME_CONTACT'
      Origin = 'BILL_TO.PRIME_CONTACT'
      FixedChar = True
      Size = 30
    end
    object PkBillToPHONE_NUMBER: TStringField
      DisplayLabel = 'Telephone'
      FieldName = 'PHONE_NUMBER'
      Origin = 'BILL_TO.PHONE_NUMBER'
      Size = 25
    end
    object PkBillToEXT: TStringField
      DisplayLabel = 'Extension'
      FieldName = 'EXT'
      Origin = 'BILL_TO.EXT'
      FixedChar = True
      Size = 5
    end
    object PkBillToFAX: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX'
      Origin = 'BILL_TO.FAX'
      Size = 25
    end
    object PkBillToPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'BILL_TO.PK_HIDE'
      Visible = False
      Size = 1
    end
  end
  object QryCurrency: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select c1.id,'
      '       c1.curr_code,'
      '       c1.descrip,'
      '       c1.glvalue,'
      '       c1.spot_rate,'
      '       c1.curr_symbol,'
      '       c1.ecode,'
      '       c1.eid,'
      '       c1.edate_time,'
      '       c1.ecopy,'
      '       c1.native_curr'
      '  from currency c1'
      ' where '
      
        '       c1.id = (select min(id) from currency where curr_code = c' +
        '1.curr_code)'
      '  order by c1.descrip ')
    Left = 328
    Top = 32
    object QryCurrencyDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Origin = 'CURRENCY.DESCRIP'
      Size = 50
    end
    object QryCurrencySPOT_RATE: TFMTBCDField
      DisplayLabel = 'Spot Rate'
      DisplayWidth = 10
      FieldName = 'SPOT_RATE'
      Origin = 'CURRENCY.SPOT_RATE'
      Visible = False
      Size = 6
    end
    object QryCurrencyCURR_CODE: TStringField
      DisplayLabel = 'Curr. Code'
      DisplayWidth = 10
      FieldName = 'CURR_CODE'
      Origin = 'CURRENCY.CURR_CODE'
      Visible = False
      Size = 10
    end
    object QryCurrencyGLVALUE: TStringField
      DisplayLabel = 'GL Value'
      DisplayWidth = 10
      FieldName = 'GLVALUE'
      Origin = 'CURRENCY.GLVALUE'
      Visible = False
      Size = 50
    end
    object QryCurrencyCURR_SYMBOL: TStringField
      DisplayLabel = 'Currency Symbol'
      DisplayWidth = 10
      FieldName = 'CURR_SYMBOL'
      Origin = 'CURRENCY.CURR_SYMBOL'
      Visible = False
      Size = 10
    end
    object QryCurrencyNATIVE_CURR: TStringField
      DisplayLabel = 'Native Curr. Code'
      DisplayWidth = 3
      FieldName = 'NATIVE_CURR'
      Origin = 'CURRENCY.NATIVE_CURR'
      Visible = False
      Size = 3
    end
    object QryCurrencyID: TBCDField
      FieldName = 'ID'
      Origin = 'CURRENCY.ID'
      Visible = False
      Size = 0
    end
    object QryCurrencyECODE: TStringField
      FieldName = 'ECODE'
      Origin = 'CURRENCY.ECODE'
      Visible = False
      Size = 10
    end
    object QryCurrencyEID: TBCDField
      FieldName = 'EID'
      Origin = 'CURRENCY.EID'
      Visible = False
      Size = 0
    end
    object QryCurrencyEDATE_TIME: TDateTimeField
      FieldName = 'EDATE_TIME'
      Origin = 'CURRENCY.EDATE_TIME'
      Visible = False
    end
    object QryCurrencyECOPY: TStringField
      FieldName = 'ECOPY'
      Origin = 'CURRENCY.ECOPY'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object QryDivision: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       name,'
      '       descrip,'
      '       eplant_id,'
      '       gl_plug_value'
      '  from division'
      ' where misc.eplant_filter(eplant_id) = 1')
    Left = 289
    Top = 228
    object QryDivisionNAME: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 15
      FieldName = 'NAME'
      Size = 25
    end
    object QryDivisionDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Size = 50
    end
    object QryDivisionEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object QryDivisionID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryDivisionGL_PLUG_VALUE: TStringField
      DisplayWidth = 50
      FieldName = 'GL_PLUG_VALUE'
      Visible = False
      Size = 50
    end
  end
  object QryGlAcct: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      '  SELECT id, eplant_id, acct, descrip'
      '    FROM glacct'
      '   WHERE NVL(pk_hide, '#39'N'#39') <> '#39'Y'#39' AND'
      '         NVL(ar_hide, '#39'N'#39') <> '#39'Y'#39
      'and misc.eplant_filter(eplant_id) = 1'
      'ORDER BY acct')
    Left = 476
    Top = 300
    object QryGlAcctACCT: TStringField
      DisplayLabel = 'G/L Account'
      DisplayWidth = 20
      FieldName = 'ACCT'
      Origin = 'GLACCT.ACCT'
      Size = 50
    end
    object QryGlAcctDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'GLACCT.DESCRIP'
      Size = 50
    end
    object QryGlAcctEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant_ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'GLACCT.EPLANT_ID'
      Size = 0
    end
    object QryGlAcctID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'GLACCT.ID'
      Visible = False
      Size = 0
    end
  end
  object QryTerms: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       description,'
      '       days,'
      '       discount,'
      '       discount_days,'
      '       ecode,'
      '       eid,'
      '       edate_time,'
      '       ecopy,'
      '       based_on,'
      '       end_of_month,'
      '       day_of_month'
      '  from terms'
      'where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      ' order by description')
    Left = 144
    Top = 112
    object QryTermsID: TBCDField
      FieldName = 'ID'
      Origin = 'TERMS.ID'
      Size = 0
    end
    object QryTermsDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Origin = 'TERMS.DESCRIPTION'
      Size = 60
    end
    object QryTermsDAYS: TBCDField
      FieldName = 'DAYS'
      Origin = 'TERMS.DAYS'
      Size = 0
    end
    object QryTermsDISCOUNT: TBCDField
      FieldName = 'DISCOUNT'
      Origin = 'TERMS.DISCOUNT'
      Size = 3
    end
    object QryTermsDISCOUNT_DAYS: TBCDField
      FieldName = 'DISCOUNT_DAYS'
      Origin = 'TERMS.DISCOUNT_DAYS'
      Size = 0
    end
    object QryTermsECODE: TStringField
      FieldName = 'ECODE'
      Origin = 'TERMS.ECODE'
      Size = 10
    end
    object QryTermsEID: TBCDField
      FieldName = 'EID'
      Origin = 'TERMS.EID'
      Size = 0
    end
    object QryTermsEDATE_TIME: TDateTimeField
      FieldName = 'EDATE_TIME'
      Origin = 'TERMS.EDATE_TIME'
    end
    object QryTermsECOPY: TStringField
      FieldName = 'ECOPY'
      Origin = 'TERMS.ECOPY'
      FixedChar = True
      Size = 1
    end
    object QryTermsBASED_ON: TStringField
      FieldName = 'BASED_ON'
      Origin = 'TERMS.BASED_ON'
      FixedChar = True
      Size = 1
    end
    object QryTermsEND_OF_MONTH: TStringField
      FieldName = 'END_OF_MONTH'
      Origin = 'TERMS.END_OF_MONTH'
      FixedChar = True
      Size = 1
    end
    object QryTermsDAY_OF_MONTH: TBCDField
      FieldName = 'DAY_OF_MONTH'
      Origin = 'TERMS.DAY_OF_MONTH'
      Size = 0
    end
  end
  object QryDunningGroup: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, descrip from dunning_group'
      'order by descrip')
    Left = 552
    Top = 300
    object QryDunningGroupDESCRIP: TStringField
      DisplayLabel = 'Dunning Group'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Origin = 'DUNNING_GROUP.DESCRIP'
      Size = 250
    end
    object QryDunningGroupID: TBCDField
      FieldName = 'ID'
      Origin = 'DUNNING_GROUP.ID'
      Visible = False
      Size = 0
    end
  end
  object SrcShipToLabels: TDataSource
    DataSet = TblShipToLabels
    OnDataChange = SrcShipToLabelsDataChange
    Left = 395
    Top = 7
  end
  object TblShipToLabels: TFDTable
    BeforePost = TblShipToLabelsBeforePost
    OnCalcFields = TblShipToLabelsCalcFields
    OnNewRecord = TblShipToLabelsNewRecord
    IndexFieldNames = 'SHIP_TO_ID'
    MasterSource = SrcShip_to
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'SHIP_TO_LABELS'
    TableName = 'SHIP_TO_LABELS'
    Left = 399
    Top = 29
    object TblShipToLabelsDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 15
      FieldName = 'DESCRIP'
      Size = 50
    end
    object TblShipToLabelsEVENT: TBCDField
      Tag = 1
      DisplayLabel = 'Event'
      DisplayWidth = 20
      FieldName = 'EVENT'
      Required = True
      Size = 0
    end
    object TblShipToLabelsTYPE: TBCDField
      Tag = 1
      DisplayLabel = 'Type'
      DisplayWidth = 14
      FieldName = 'TYPE'
      Required = True
      Size = 0
    end
    object TblShipToLabelsLM_Label_Menu_Name: TStringField
      DisplayLabel = 'Label '
      DisplayWidth = 18
      FieldKind = fkCalculated
      FieldName = 'LM_Label_Menu_Name'
      Size = 25
      Calculated = True
    end
    object TblShipToLabelsCRW_REPORT: TStringField
      DisplayLabel = 'CRW Report Name'
      DisplayWidth = 20
      FieldName = 'CRW_REPORT'
      Size = 250
    end
    object TblShipToLabelsCOPIES: TBCDField
      DisplayLabel = 'Copies'
      DisplayWidth = 7
      FieldName = 'COPIES'
      Size = 0
    end
    object TblShipToLabelsPROMPT_USER: TStringField
      DisplayLabel = 'Prompt'
      DisplayWidth = 7
      FieldName = 'PROMPT_USER'
      FixedChar = True
      Size = 1
    end
    object TblShipToLabelsSEQ: TBCDField
      DisplayLabel = 'Print sequence'
      DisplayWidth = 13
      FieldName = 'SEQ'
      Size = 0
    end
    object TblShipToLabelsLM_Label_Menu_Name_Child: TStringField
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'LM_Label_Menu_Name_Child'
      Visible = False
      Size = 25
      Calculated = True
    end
    object TblShipToLabelsID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object TblShipToLabelsSHIP_TO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SHIP_TO_ID'
      Visible = False
      Size = 0
    end
    object TblShipToLabelsLM_LABELS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'LM_LABELS_ID'
      Visible = False
      Size = 0
    end
    object TblShipToLabelsPALLET_CHILD_LM_LABELS_ID: TBCDField
      FieldName = 'PALLET_CHILD_LM_LABELS_ID'
      Visible = False
      Size = 0
    end
    object TblShipToLabelsPALLET_CHILD_CRW_REPORT: TStringField
      FieldName = 'PALLET_CHILD_CRW_REPORT'
      Visible = False
      Size = 250
    end
  end
  object PkLabels: TIQWebHpick
    BeforeOpen = AssignEPlantFilter
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select l.id as id,'
      '       l.label_file as label_file,'
      '       l.label_menu_name as label_menu,'
      '       l.label_type as label_type,'
      '       a.custno as custno,'
      '       a.company as customer,'
      '       l.eplant_id as eplant_id'
      '  from lm_labels l,'
      '       arcusto a'
      ' where l.arcusto_id = a.id(+)'
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 166
    Top = 429
    object PkLabelsID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkLabelsLABEL_FILE: TStringField
      DisplayLabel = 'Label'
      FieldName = 'LABEL_FILE'
      Size = 25
    end
    object PkLabelsLABEL_MENU: TStringField
      DisplayLabel = 'Menu Title'
      FieldName = 'LABEL_MENU'
      Size = 25
    end
    object PkLabelsLABEL_TYPE: TStringField
      DisplayLabel = 'Label Type'
      FieldName = 'LABEL_TYPE'
      Size = 25
    end
    object PkLabelsCUSTNO: TStringField
      DisplayLabel = 'Cust#'
      FieldName = 'CUSTNO'
      Size = 10
    end
    object PkLabelsCUSTOMER: TStringField
      DisplayLabel = 'Customer'
      FieldName = 'CUSTOMER'
      Size = 60
    end
    object PkLabelsEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object PkFreight: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'SELECT id, descrip, scac_iata_code, code_qualifier, transport_co' +
        'de,'
      '       equip_owners_code, pk_hide'
      '  FROM freight'
      ' WHERE misc.eplant_filter_include_nulls(eplant_id) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 219
    Top = 429
    object PkFreightID: TBCDField
      FieldName = 'ID'
      Origin = 'FREIGHT.ID'
      Visible = False
      Size = 0
    end
    object PkFreightDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'FREIGHT.DESCRIP'
      Size = 60
    end
    object PkFreightSCAC_IATA_CODE: TStringField
      DisplayLabel = 'SCAC IATA'
      FieldName = 'SCAC_IATA_CODE'
      Origin = 'FREIGHT.SCAC_IATA_CODE'
      FixedChar = True
      Size = 17
    end
    object PkFreightCODE_QUALIFIER: TStringField
      DisplayLabel = 'Code Qualifier'
      FieldName = 'CODE_QUALIFIER'
      Origin = 'FREIGHT.CODE_QUALIFIER'
      Size = 6
    end
    object PkFreightTRANSPORT_CODE: TStringField
      DefaultExpression = 'Transportation Method Code'
      DisplayLabel = 'Transportation Method Code'
      FieldName = 'TRANSPORT_CODE'
      Origin = 'FREIGHT.TRANSPORT_CODE'
      Size = 6
    end
    object PkFreightEQUIP_OWNERS_CODE: TStringField
      DisplayLabel = 'Equipment Owners Code'
      FieldName = 'EQUIP_OWNERS_CODE'
      Origin = 'FREIGHT.EQUIP_OWNERS_CODE'
      Size = 4
    end
    object PkFreightPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      Size = 1
    end
  end
  object QryEdiBillTo: TFDQuery
    MasterSource = SrcArcusto
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       attn,'
      '       addr1,'
      '       addr2,'
      '       city,'
      '       state,'
      '       zip'
      '  from bill_to'
      'where arcusto_id = :ID'
      '  order by attn'
      ' ')
    Left = 483
    Top = 18
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object StringField1: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 20
      FieldName = 'ATTN'
      Origin = 'BILL_TO.ATTN'
      Size = 60
    end
    object StringField2: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 20
      FieldName = 'ADDR1'
      Origin = 'BILL_TO.ADDR1'
      Size = 60
    end
    object StringField3: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 20
      FieldName = 'ADDR2'
      Origin = 'BILL_TO.ADDR2'
      Size = 60
    end
    object StringField4: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 15
      FieldName = 'CITY'
      Origin = 'BILL_TO.CITY'
      Size = 30
    end
    object StringField5: TStringField
      DisplayLabel = 'State'
      DisplayWidth = 20
      FieldName = 'STATE'
      Origin = 'BILL_TO.STATE'
    end
    object StringField6: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 10
      FieldName = 'ZIP'
      Origin = 'BILL_TO.ZIP'
      Size = 10
    end
    object FloatField1: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'BILL_TO.ID'
      Visible = False
      Size = 0
    end
  end
  object QryTrailer: TFDQuery
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       seq,'
      '       descrip,'
      '       width,'
      '       height,'
      '       length,'
      '       width * height * length as volume,'
      '       max_weight,'
      '       gap_percent,'
      '       eplant_id'
      '  from trailer'
      ' where misc.eplant_filter_include_nulls( eplant_id ) = 1'
      ' order by seq')
    Left = 409
    Top = 301
    object QryTrailerDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Required = True
      Size = 35
    end
    object QryTrailerWIDTH: TFMTBCDField
      DisplayLabel = 'Width'
      DisplayWidth = 10
      FieldName = 'WIDTH'
      Required = True
      Size = 6
    end
    object QryTrailerHEIGHT: TFMTBCDField
      DisplayLabel = 'Height'
      DisplayWidth = 10
      FieldName = 'HEIGHT'
      Required = True
      Size = 6
    end
    object QryTrailerLENGTH: TFMTBCDField
      DisplayLabel = 'Length'
      DisplayWidth = 10
      FieldName = 'LENGTH'
      Required = True
      Size = 6
    end
    object QryTrailerMAX_WEIGHT: TFMTBCDField
      DisplayLabel = 'Max Weight'
      DisplayWidth = 10
      FieldName = 'MAX_WEIGHT'
      Size = 6
    end
    object QryTrailerVOLUME: TFMTBCDField
      DisplayLabel = 'Volume'
      DisplayWidth = 10
      FieldName = 'VOLUME'
      Size = 38
    end
    object QryTrailerGAP_PERCENT: TBCDField
      DisplayLabel = 'Gap %'
      DisplayWidth = 10
      FieldName = 'GAP_PERCENT'
      Size = 2
    end
    object QryTrailerEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object QryTrailerSEQ: TBCDField
      DisplayLabel = '#'
      DisplayWidth = 4
      FieldName = 'SEQ'
      Required = True
      Visible = False
      Size = 0
    end
    object QryTrailerID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Required = True
      Visible = False
      Size = 0
    end
  end
  object QryShipToComm: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select c.id,'
      
        '       substr(c.descrip, 1, 50) || '#39' ('#39' || To_Char(sum(d.commiss' +
        'ion_percent))  || '#39'%)'#39' as descrip,'
      '       sum(d.commission_percent) as commission_percent'
      '  from commissions c,'
      '       commissions_detail d,'
      '       salespeople s'
      ' where d.commissions_id = c.id'
      '   and d.salespeople_id = s.id'
      '   and NVL(s.inactive, '#39'N'#39') = '#39'N'#39'   '
      ' group by c.id, c.descrip'
      
        'order by substr(c.descrip, 1, 50) || '#39' ('#39' || To_Char(sum(d.commi' +
        'ssion_percent))  || '#39'%)'#39
      '')
    Left = 529
    Top = 79
    object StringField7: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 95
      FieldName = 'DESCRIP'
      Size = 94
    end
    object FloatField2: TBCDField
      FieldName = 'ID'
      Origin = 'COMMISSIONS.ID'
      Visible = False
      Size = 0
    end
    object FloatField3: TFMTBCDField
      FieldName = 'COMMISSION_PERCENT'
      Origin = 'COMMISSIONS_DETAIL.COMMISSION_PERCENT'
      Visible = False
      Size = 38
    end
  end
  object QryConsolidator: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       attn,'
      '       addr1,'
      '       addr2,'
      '       addr3,'
      '       city,'
      '       state,'
      '       country,'
      '       zip,'
      '       phone_number,'
      '       eplant_id'
      ' from consolidator'
      'where misc.eplant_filter(eplant_id) = 1'
      ' '
      ' ')
    Left = 533
    Top = 221
    object StringField8: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 30
      FieldName = 'ATTN'
      FixedChar = True
      Size = 60
    end
    object StringField9: TStringField
      DisplayLabel = 'Address1'
      DisplayWidth = 15
      FieldName = 'ADDR1'
      FixedChar = True
      Size = 60
    end
    object StringField10: TStringField
      DisplayLabel = 'Address2'
      DisplayWidth = 30
      FieldName = 'ADDR2'
      FixedChar = True
      Size = 60
    end
    object StringField11: TStringField
      DisplayLabel = 'Address3'
      DisplayWidth = 15
      FieldName = 'ADDR3'
      FixedChar = True
      Size = 60
    end
    object StringField12: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 15
      FieldName = 'CITY'
      FixedChar = True
      Size = 30
    end
    object StringField13: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 15
      FieldName = 'COUNTRY'
      FixedChar = True
      Size = 30
    end
    object StringField14: TStringField
      DisplayLabel = 'Phone#'
      DisplayWidth = 10
      FieldName = 'PHONE_NUMBER'
      Size = 25
    end
    object StringField15: TStringField
      DisplayLabel = 'State'
      DisplayWidth = 2
      FieldName = 'STATE'
      FixedChar = True
    end
    object StringField16: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 10
      FieldName = 'ZIP'
      FixedChar = True
      Size = 10
    end
    object FloatField4: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object FloatField5: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object SrcFreightRules: TDataSource
    DataSet = QryFreightRules
    Left = 533
    Top = 137
  end
  object QryFreightRules: TFDQuery
    BeforePost = QryFreightRulesBeforePost
    OnCalcFields = QryFreightRulesCalcFields
    OnNewRecord = QryFreightRulesNewRecord
    MasterSource = SrcArcusto
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'freight_rules'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLFreightRules
    SQL.Strings = (
      'select id,'
      '       arcusto_id,'
      '       from_weight,'
      '       to_weight,'
      '       freight_id,'
      '       type,'
      '       max_cartons'
      '  from freight_rules'
      ' where arcusto_id = :ID'
      ' and ship_to_id is null'
      ' order by from_weight')
    Left = 533
    Top = 155
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryFreightRulesFROM_WEIGHT: TFMTBCDField
      DisplayLabel = 'From Weight'
      DisplayWidth = 15
      FieldName = 'FROM_WEIGHT'
      Origin = 'FREIGHT_RULES.FROM_WEIGHT'
      Required = True
      Size = 6
    end
    object QryFreightRulesTO_WEIGHT: TFMTBCDField
      DisplayLabel = 'To Weight'
      DisplayWidth = 15
      FieldName = 'TO_WEIGHT'
      Origin = 'FREIGHT_RULES.TO_WEIGHT'
      Required = True
      Size = 6
    end
    object QryFreightRulesFreight_Descrip: TStringField
      DisplayLabel = 'Ship Via'
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'Freight_Descrip'
      Size = 60
      Calculated = True
    end
    object QryFreightRulesTYPE: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 50
      FieldName = 'TYPE'
      Origin = 'FREIGHT_RULES.TYPE'
      Size = 50
    end
    object QryFreightRulesMAX_CARTONS: TBCDField
      DisplayLabel = 'Max Cartons'
      DisplayWidth = 10
      FieldName = 'MAX_CARTONS'
      Origin = 'FREIGHT_RULES.MAX_CARTONS'
      Size = 0
    end
    object QryFreightRulesID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'FREIGHT_RULES.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryFreightRulesFREIGHT_ID: TBCDField
      DisplayLabel = 'Ship Via'
      DisplayWidth = 10
      FieldName = 'FREIGHT_ID'
      Origin = 'FREIGHT_RULES.FREIGHT_ID'
      Required = True
      Visible = False
      Size = 0
    end
    object QryFreightRulesARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQLFreightRules: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into freight_rules'
      '  (ID, ARCUSTO_ID, FROM_WEIGHT, TO_WEIGHT, FREIGHT_ID, TYPE, '
      'MAX_CARTONS)'
      'values'
      
        '  (:ID, :ARCUSTO_ID, :FROM_WEIGHT, :TO_WEIGHT, :FREIGHT_ID, :TYP' +
        'E, '
      ':MAX_CARTONS)')
    ModifySQL.Strings = (
      'update freight_rules'
      'set'
      '  ID = :ID,'
      '  ARCUSTO_ID = :ARCUSTO_ID,'
      '  FROM_WEIGHT = :FROM_WEIGHT,'
      '  TO_WEIGHT = :TO_WEIGHT,'
      '  FREIGHT_ID = :FREIGHT_ID,'
      '  TYPE = :TYPE,'
      '  MAX_CARTONS = :MAX_CARTONS'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from freight_rules'
      'where'
      '  ID = :OLD_ID')
    Left = 533
    Top = 171
  end
  object QryFreightLookup: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      '  SELECT id, descrip, eplant_id'
      '    FROM freight'
      '   WHERE misc.eplant_filter_include_nulls(eplant_id) = 1'
      'ORDER BY descrip')
    Left = 657
    Top = 136
    object QryFreightLookupDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'FREIGHT.DESCRIP'
      Size = 60
    end
    object QryFreightLookupEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object QryFreightLookupID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'FREIGHT.ID'
      Visible = False
      Size = 0
    end
  end
  object QryFreight: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      
        '  SELECT id, descrip, glacct_id_freight, scac_iata_code, code_qu' +
        'alifier,'
      
        '         transport_code, equip_owners_code, glacct_id_freight_ap' +
        ', carrier_phone,'
      '         comment1, transit_on_weekend, pk_hide, eplant_id'
      '    FROM freight'
      '   WHERE misc.eplant_filter_include_nulls(eplant_id) = 1'
      'ORDER BY descrip')
    Left = 224
    Top = 120
    object QryFreightDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 60
      FieldName = 'DESCRIP'
      Origin = 'FREIGHT.DESCRIP'
      Size = 60
    end
    object QryFreightEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object QryFreightID: TBCDField
      Tag = 1
      FieldName = 'ID'
      Origin = 'FREIGHT.ID'
      Visible = False
      Size = 0
    end
    object QryFreightGLACCT_ID_FREIGHT: TBCDField
      Tag = 1
      FieldName = 'GLACCT_ID_FREIGHT'
      Origin = 'FREIGHT.GLACCT_ID_FREIGHT'
      Visible = False
      Size = 0
    end
    object QryFreightSCAC_IATA_CODE: TStringField
      FieldName = 'SCAC_IATA_CODE'
      Origin = 'FREIGHT.SCAC_IATA_CODE'
      Visible = False
      FixedChar = True
      Size = 17
    end
    object QryFreightCODE_QUALIFIER: TStringField
      FieldName = 'CODE_QUALIFIER'
      Origin = 'FREIGHT.CODE_QUALIFIER'
      Visible = False
      Size = 6
    end
    object QryFreightTRANSPORT_CODE: TStringField
      FieldName = 'TRANSPORT_CODE'
      Origin = 'FREIGHT.TRANSPORT_CODE'
      Visible = False
      Size = 6
    end
    object QryFreightEQUIP_OWNERS_CODE: TStringField
      FieldName = 'EQUIP_OWNERS_CODE'
      Origin = 'FREIGHT.EQUIP_OWNERS_CODE'
      Visible = False
      Size = 4
    end
    object QryFreightGLACCT_ID_FREIGHT_AP: TBCDField
      Tag = 1
      FieldName = 'GLACCT_ID_FREIGHT_AP'
      Origin = 'FREIGHT.GLACCT_ID_FREIGHT_AP'
      Visible = False
      Size = 0
    end
    object QryFreightCARRIER_PHONE: TStringField
      FieldName = 'CARRIER_PHONE'
      Origin = 'FREIGHT.CARRIER_PHONE'
      Visible = False
      Size = 25
    end
    object QryFreightCOMMENT1: TStringField
      FieldName = 'COMMENT1'
      Origin = 'FREIGHT.COMMENT1'
      Visible = False
      Size = 50
    end
    object QryFreightTRANSIT_ON_WEEKEND: TStringField
      FieldName = 'TRANSIT_ON_WEEKEND'
      Origin = 'FREIGHT.TRANSIT_ON_WEEKEND'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryFreightPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'FREIGHT.PK_HIDE'
      Visible = False
      Size = 1
    end
  end
  object QryTaxCodes: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       tax_code,'
      '       tax_code_desc,'
      '       tot_tax_rate,'
      '       ecode,'
      '       eid,'
      '       edate_time,'
      '       ecopy,'
      '       vat_paid'
      '  from tax_codes'
      'order by tax_code'
      '')
    Left = 504
    Top = 392
    object QryTaxCodesID: TBCDField
      FieldName = 'ID'
      Origin = 'TAX_CODES.ID'
      Size = 0
    end
    object QryTaxCodesTAX_CODE: TStringField
      FieldName = 'TAX_CODE'
      Origin = 'TAX_CODES.TAX_CODE'
    end
    object QryTaxCodesTAX_CODE_DESC: TStringField
      FieldName = 'TAX_CODE_DESC'
      Origin = 'TAX_CODES.TAX_CODE_DESC'
      Size = 50
    end
    object QryTaxCodesTOT_TAX_RATE: TFMTBCDField
      FieldName = 'TOT_TAX_RATE'
      Origin = 'TAX_CODES.TOT_TAX_RATE'
      Size = 6
    end
    object QryTaxCodesECODE: TStringField
      FieldName = 'ECODE'
      Origin = 'TAX_CODES.ECODE'
      Size = 10
    end
    object QryTaxCodesEID: TBCDField
      FieldName = 'EID'
      Origin = 'TAX_CODES.EID'
      Size = 0
    end
    object QryTaxCodesEDATE_TIME: TDateTimeField
      FieldName = 'EDATE_TIME'
      Origin = 'TAX_CODES.EDATE_TIME'
    end
    object QryTaxCodesECOPY: TStringField
      FieldName = 'ECOPY'
      Origin = 'TAX_CODES.ECOPY'
      FixedChar = True
      Size = 1
    end
    object QryTaxCodesVAT_PAID: TStringField
      FieldName = 'VAT_PAID'
      Origin = 'TAX_CODES.VAT_PAID'
      FixedChar = True
      Size = 1
    end
  end
  object SrcQryTaxCodes: TDataSource
    DataSet = QryTaxCodes
    Left = 492
    Top = 377
  end
  object QryImporter: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       attn,'
      '       addr1,'
      '       addr2,'
      '       addr3,'
      '       city,'
      '       state,'
      '       country,'
      '       zip,'
      '       phone_number,'
      '       eplant_id'
      ' from importer'
      'where misc.eplant_filter(eplant_id) = 1'
      ' '
      ' ')
    Left = 610
    Top = 221
    object StringField17: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 30
      FieldName = 'ATTN'
      FixedChar = True
      Size = 60
    end
    object StringField18: TStringField
      DisplayLabel = 'Address1'
      DisplayWidth = 15
      FieldName = 'ADDR1'
      FixedChar = True
      Size = 60
    end
    object StringField19: TStringField
      DisplayLabel = 'Address2'
      DisplayWidth = 30
      FieldName = 'ADDR2'
      FixedChar = True
      Size = 60
    end
    object StringField20: TStringField
      DisplayLabel = 'Address3'
      DisplayWidth = 15
      FieldName = 'ADDR3'
      FixedChar = True
      Size = 60
    end
    object StringField21: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 15
      FieldName = 'CITY'
      FixedChar = True
      Size = 30
    end
    object StringField22: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 15
      FieldName = 'COUNTRY'
      FixedChar = True
      Size = 30
    end
    object StringField23: TStringField
      DisplayLabel = 'Phone#'
      DisplayWidth = 10
      FieldName = 'PHONE_NUMBER'
      Size = 25
    end
    object StringField24: TStringField
      DisplayLabel = 'State'
      DisplayWidth = 2
      FieldName = 'STATE'
      FixedChar = True
    end
    object StringField25: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 10
      FieldName = 'ZIP'
      FixedChar = True
      Size = 10
    end
    object FloatField6: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object FloatField7: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object PkRebateParams: TIQWebHpick
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select p.id as id,'
      '       p.descrip as descrip,'
      '       p.based_on as based_on,'
      '       p.percent as percent,'
      '       p.flat_amount as flat_amount,'
      '       p.sql_formula as sql_formula,'
      '       p.exclude_commissions as exclude_commissions,'
      '       p.cash_back as cash_back,'
      '       p.effect_date as effect_date,'
      '       p.DEACTIVE_DATE as DEACTIVE_DATE,'
      '       p.glacct_id as glacct_id,'
      '       g.acct as acct'
      '  from rebate_params p,'
      '       glacct g'
      ' where p.glacct_id = g.id(+)'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 392
    Top = 432
    object PkRebateParamsID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkRebateParamsDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 100
    end
    object PkRebateParamsBASED_ON: TStringField
      DisplayLabel = 'Based On'
      FieldName = 'BASED_ON'
      Size = 100
    end
    object PkRebateParamsPERCENT: TFMTBCDField
      DisplayLabel = 'Percent'
      FieldName = 'PERCENT'
      Size = 6
    end
    object PkRebateParamsFLAT_AMOUNT: TBCDField
      DisplayLabel = 'Flat Amount'
      FieldName = 'FLAT_AMOUNT'
      Size = 2
    end
    object PkRebateParamsEXCLUDE_COMMISSIONS: TStringField
      DisplayLabel = 'Exclude Comissions'
      FieldName = 'EXCLUDE_COMMISSIONS'
      Size = 1
    end
    object PkRebateParamsCASH_BACK: TStringField
      DisplayLabel = 'Cash Back'
      FieldName = 'CASH_BACK'
      Size = 1
    end
    object PkRebateParamsEFFECT_DATE: TDateTimeField
      DisplayLabel = 'Effective Date'
      FieldName = 'EFFECT_DATE'
    end
    object PkRebateParamsDEACTIVE_DATE: TDateTimeField
      DisplayLabel = 'InActive Date'
      FieldName = 'DEACTIVE_DATE'
    end
    object PkRebateParamsGLACCT_ID: TBCDField
      FieldName = 'GLACCT_ID'
      Visible = False
      Size = 0
    end
    object PkRebateParamsACCT: TStringField
      DisplayLabel = 'GL Account'
      FieldName = 'ACCT'
      Size = 50
    end
  end
  object Pkterms: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      'description,'
      'days,'
      'discount,'
      'discount_days,'
      'ecode,'
      'eid,'
      'edate_time,'
      'ecopy,'
      'based_on,'
      'end_of_month,'
      'day_of_month'
      'from terms')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 633
    Top = 301
    object PktermsID: TBCDField
      FieldName = 'ID'
      Origin = 'TERMS.ID'
      Visible = False
      Size = 0
    end
    object PktermsDESCRIPTION: TStringField
      FieldName = 'Description'
      Origin = 'TERMS.DESCRIPTION'
      Size = 60
    end
    object PktermsDAYS: TBCDField
      DisplayLabel = 'Days'
      FieldName = 'DAYS'
      Origin = 'TERMS.DAYS'
      Size = 0
    end
    object PktermsDISCOUNT: TBCDField
      DisplayLabel = 'Discount'
      FieldName = 'DISCOUNT'
      Origin = 'TERMS.DISCOUNT'
      Size = 3
    end
    object PktermsDISCOUNT_DAYS: TBCDField
      DisplayLabel = 'Discount days'
      FieldName = 'DISCOUNT_DAYS'
      Origin = 'TERMS.DISCOUNT_DAYS'
      Size = 0
    end
    object PktermsECODE: TStringField
      FieldName = 'ECODE'
      Origin = 'TERMS.ECODE'
      Visible = False
      Size = 10
    end
    object PktermsEID: TBCDField
      FieldName = 'EID'
      Origin = 'TERMS.EID'
      Visible = False
      Size = 0
    end
    object PktermsEDATE_TIME: TDateTimeField
      FieldName = 'EDATE_TIME'
      Origin = 'TERMS.EDATE_TIME'
      Visible = False
    end
    object PktermsECOPY: TStringField
      FieldName = 'ECOPY'
      Origin = 'TERMS.ECOPY'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object PktermsBASED_ON: TStringField
      FieldName = 'BASED_ON'
      Origin = 'TERMS.BASED_ON'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object PktermsEND_OF_MONTH: TStringField
      FieldName = 'END_OF_MONTH'
      Origin = 'TERMS.END_OF_MONTH'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object PktermsDAY_OF_MONTH: TBCDField
      FieldName = 'DAY_OF_MONTH'
      Origin = 'TERMS.DAY_OF_MONTH'
      Visible = False
      Size = 0
    end
  end
  object QryShipToCarrier: TFDQuery
    BeforeInsert = PostParentBeforeEdit
    BeforeEdit = PostParentBeforeEdit
    BeforePost = QryShipToCarrierBeforePost
    AfterPost = QryShipToCarrierAfterPost
    AfterDelete = QryShipToCarrierAfterPost
    OnNewRecord = QryShipToCarrierNewRecord
    MasterSource = SrcShip_to
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = ' ship_to_carrier_account'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLShipToCarrier
    SQL.Strings = (
      
        'select ca.id, ca.account_number, ca.ship_to_id, ca.carrier_id, c' +
        'a.email, '
      'ca.ship, ca.delivery, ca.exception'
      'from ship_to_carrier_account ca'
      'where ca.ship_to_id = :ID')
    Left = 555
    Top = 11
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryShipToCarrierDescription: TStringField
      DisplayLabel = 'Carrier'
      DisplayWidth = 60
      FieldKind = fkLookup
      FieldName = 'DESCRIP'
      LookupDataSet = QryCarriers
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIP'
      KeyFields = 'CARRIER_ID'
      Lookup = True
    end
    object QryShipToCarrierACCOUNT_NUMBER: TStringField
      DisplayLabel = 'Account #'
      DisplayWidth = 50
      FieldName = 'ACCOUNT_NUMBER'
      Origin = 'SHIP_TO_CARRIER_ACCOUNT.ACCOUNT_NUMBER'
      Size = 50
    end
    object QryShipToCarrierEMAIL: TStringField
      DisplayLabel = 'Notification Email'
      DisplayWidth = 250
      FieldName = 'EMAIL'
      Size = 250
    end
    object QryShipToCarrierSHIP: TStringField
      DisplayLabel = 'Ship'
      DisplayWidth = 1
      FieldName = 'SHIP'
      Size = 1
    end
    object QryShipToCarrierDELIVERY: TStringField
      DisplayLabel = 'Delivery'
      DisplayWidth = 1
      FieldName = 'DELIVERY'
      Size = 1
    end
    object QryShipToCarrierEXCEPTION: TStringField
      DisplayLabel = 'Exception'
      DisplayWidth = 1
      FieldName = 'EXCEPTION'
      Size = 1
    end
    object QryShipToCarrierCARRIER_ID: TBCDField
      DisplayLabel = 'Carrier'
      DisplayWidth = 60
      FieldName = 'CARRIER_ID'
      Origin = 'SHIP_TO_CARRIER_ACCOUNT.CARRIER_ID'
      Visible = False
      Size = 0
    end
    object QryShipToCarrierID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'SHIP_TO_CARRIER_ACCOUNT.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryShipToCarrierSHIP_TO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SHIP_TO_ID'
      Origin = 'SHIP_TO_CARRIER_ACCOUNT.SHIP_TO_ID'
      Visible = False
      Size = 0
    end
  end
  object ScrShipToCarrier: TDataSource
    DataSet = QryShipToCarrier
    Left = 548
    Top = 2
  end
  object UpdateSQLShipToCarrier: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into ship_to_carrier_account'
      
        '  (ACCOUNT_NUMBER, SHIP_TO_ID, CARRIER_ID, EMAIL, SHIP, DELIVERY' +
        ', EXCEPTION)'
      'values'
      
        '  (:ACCOUNT_NUMBER, :SHIP_TO_ID, :CARRIER_ID, :EMAIL, :SHIP, :DE' +
        'LIVERY, '
      '   :EXCEPTION)')
    ModifySQL.Strings = (
      'update ship_to_carrier_account'
      'set'
      '  ACCOUNT_NUMBER = :ACCOUNT_NUMBER,'
      '  SHIP_TO_ID = :SHIP_TO_ID,'
      '  CARRIER_ID = :CARRIER_ID,'
      '  EMAIL = :EMAIL,'
      '  SHIP = :SHIP,'
      '  DELIVERY = :DELIVERY,'
      '  EXCEPTION = :EXCEPTION'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from ship_to_carrier_account'
      'where'
      '  ID = :OLD_ID')
    Left = 604
    Top = 30
  end
  object SrcCarriers: TDataSource
    DataSet = QryCarriers
    Left = 596
    Top = 74
  end
  object QryCarriers: TFDQuery
    OnNewRecord = QryShipToCarrierNewRecord
    CachedUpdates = True
    MasterSource = SrcShip_to
    MasterFields = 'EPLANT_ID'
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select c.id, c.descrip'
      'from freight_carrier c'
      'where nvl(c.eplant_id, 0) = nvl(:EPLANT_ID, 0)'
      'order by descrip')
    Left = 603
    Top = 83
    ParamData = <
      item
        Name = 'EPLANT_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryCarriersDESCRIP: TStringField
      DisplayLabel = 'Carrier'
      DisplayWidth = 60
      FieldName = 'DESCRIP'
      Size = 60
    end
    object QryCarriersID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object PkEmp: TIQWebHpick
    BeforeOpen = PkEmpBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select e.id as id,'
      '       e.empno as empno,'
      '       e.first_name           as first_name,'
      '       e.middle_name          as middle_name,'
      '       e.last_name            as last_name,'
      '       e.ssnmbr               as ssnmbr,'
      '       e.addr1                as addr1,'
      '       e.addr2                as addr2,'
      '       e.state                as state,'
      '       e.country              as country,'
      '       e.zip                  as zip,'
      '       e.phone_number         as phone_number,'
      '       e.city                 as city,'
      '       e.charge_rate          as charge_rate,'
      '       e.status_code          as status_code,'
      '       e.date_hired           as date_hired,'
      '       e.termination_date     as termination_date,'
      '       e.last_review_date     as last_review_date,'
      '       e.next_review_date     as next_review_date,'
      '       e.PK_HIDE              as PK_HIDE,'
      '       g.eplant_id            as eplant_id'
      '  from pr_emp e,'
      '       arcusto a,'
      '       pr_paygroup g'
      ' where g.eplant_id(+) = :AEplantId'
      '   and e.pr_paygroup_id = g.id(+)'
      '   and a.id = :AId'
      '   '
      ''
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 468
    Top = 441
    ParamData = <
      item
        Name = 'AEplantId'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'AId'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkEmpID: TBCDField
      FieldName = 'ID'
      Origin = 'PR_EMP.ID'
      Visible = False
      Size = 0
    end
    object PkEmpEMPNO: TStringField
      DisplayLabel = 'Emp#'
      FieldName = 'EMPNO'
      Origin = 'PR_EMP.EMPNO'
      Size = 25
    end
    object PkEmpFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      FieldName = 'FIRST_NAME'
      Origin = 'PR_EMP.FIRST_NAME'
      Size = 30
    end
    object PkEmpMIDDLE_NAME: TStringField
      DisplayLabel = 'Middle Name'
      FieldName = 'MIDDLE_NAME'
      Origin = 'PR_EMP.MIDDLE_NAME'
      Size = 30
    end
    object PkEmpLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      FieldName = 'LAST_NAME'
      Origin = 'PR_EMP.LAST_NAME'
      Size = 30
    end
    object PkEmpPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'PR_EMP.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object PkEmpEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object PKAcct: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT id, acct, descrip, type, eplant_id'
      '  FROM glacct'
      ' WHERE NVL(pk_hide, '#39'N'#39') <> '#39'Y'#39' AND'
      '       NVL(ar_hide, '#39'N'#39') <> '#39'Y'#39' AND'
      '       misc.eplant_filter(eplant_id) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 520
    Top = 443
    object PKAcctID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
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
      DisplayLabel = 'Type'
      FieldName = 'TYPE'
      Size = 25
    end
    object PKAcctEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object PkThirdParty: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id as id,'
      '       attn as attn,'
      '       addr1 as addr1,'
      '       addr2 as addr2,'
      '       addr3 as addr3,'
      '       city as city,'
      '       state as state,'
      '       country as country,'
      '       zip as zip,'
      '       phone_number as phone_number,'
      '       ext as ext,'
      '       fax as fax,'
      '       prime_contact as prime_contact,'
      '       use_usa_mask as use_usa_mask '
      ' from fob_third_party')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 600
    Top = 440
    object PkThirdPartyID: TBCDField
      FieldName = 'ID'
      Origin = 'FOB_THIRD_PARTY.ID'
      Visible = False
      Size = 0
    end
    object PkThirdPartyATTN: TStringField
      DisplayLabel = 'Company'
      FieldName = 'ATTN'
      Origin = 'FOB_THIRD_PARTY.ATTN'
      Size = 60
    end
    object PkThirdPartyADDR1: TStringField
      DisplayLabel = 'Address 1'
      FieldName = 'ADDR1'
      Origin = 'FOB_THIRD_PARTY.ADDR1'
      Size = 60
    end
    object PkThirdPartyADDR2: TStringField
      DisplayLabel = 'Address 2'
      FieldName = 'ADDR2'
      Origin = 'FOB_THIRD_PARTY.ADDR2'
      Size = 60
    end
    object PkThirdPartyADDR3: TStringField
      DisplayLabel = 'Address 3'
      FieldName = 'ADDR3'
      Origin = 'FOB_THIRD_PARTY.ADDR3'
      Size = 60
    end
    object PkThirdPartyCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Origin = 'FOB_THIRD_PARTY.CITY'
      FixedChar = True
      Size = 30
    end
    object PkThirdPartySTATE: TStringField
      DisplayLabel = 'State'
      FieldName = 'STATE'
      Origin = 'FOB_THIRD_PARTY.STATE'
    end
    object PkThirdPartyCOUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      Origin = 'FOB_THIRD_PARTY.COUNTRY'
      FixedChar = True
      Size = 30
    end
    object PkThirdPartyZIP: TStringField
      DisplayLabel = 'State or Region'
      FieldName = 'ZIP'
      Origin = 'FOB_THIRD_PARTY.ZIP'
      FixedChar = True
      Size = 10
    end
    object PkThirdPartyPHONE_NUMBER: TStringField
      DisplayLabel = 'Telephone'
      FieldName = 'PHONE_NUMBER'
      Origin = 'FOB_THIRD_PARTY.PHONE_NUMBER'
      Size = 25
    end
    object PkThirdPartyEXT: TStringField
      DisplayLabel = 'Extention'
      FieldName = 'EXT'
      Origin = 'FOB_THIRD_PARTY.EXT'
      FixedChar = True
      Size = 5
    end
    object PkThirdPartyFAX: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX'
      Origin = 'FOB_THIRD_PARTY.FAX'
      Size = 25
    end
    object PkThirdPartyPRIME_CONTACT: TStringField
      DisplayLabel = 'Contact'
      FieldName = 'PRIME_CONTACT'
      Origin = 'FOB_THIRD_PARTY.PRIME_CONTACT'
      FixedChar = True
      Size = 30
    end
  end
  object PkTempl: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id as id,'
      '       template_name as template_name,'
      '       template_descrip as template_descrip'
      '  from ARCUSTO_TEMPLATE')
    OnIQAfterHPickCreate = PkTemplIQAfterHPickCreate
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 656
    Top = 432
    object PkTemplID: TBCDField
      FieldName = 'ID'
      Origin = 'ARCUSTO_TEMPLATE.ID'
      Visible = False
      Size = 0
    end
    object PkTemplTEMPLATE_NAME: TStringField
      DisplayLabel = 'Template Name'
      FieldName = 'TEMPLATE_NAME'
      Origin = 'ARCUSTO_TEMPLATE.TEMPLATE_NAME'
      Size = 25
    end
    object PkTemplTEMPLATE_DESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'TEMPLATE_DESCRIP'
      Origin = 'ARCUSTO_TEMPLATE.TEMPLATE_DESCRIP'
      Size = 250
    end
  end
  object PkBillToOE: TIQWebHpick
    BeforeOpen = PkShipToBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       attn,'
      '       addr1,'
      '       addr2,'
      '       addr3,'
      '       city,'
      '       state,'
      '       country,'
      '       zip,'
      '       phone_number,'
      '       ext,'
      '       fax,'
      '       prime_contact,'
      '       ecode,'
      '       pk_hide'
      ' from bill_to'
      'where arcusto_id = :nid')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 270
    Top = 481
    ParamData = <
      item
        Name = 'nid'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object FloatField8: TBCDField
      FieldName = 'ID'
      Origin = 'SHIP_TO.ID'
      Visible = False
      Size = 0
    end
    object StringField26: TStringField
      DisplayLabel = 'Primary Contact'
      DisplayWidth = 20
      FieldName = 'PRIME_CONTACT'
      Origin = 'SHIP_TO.PRIME_CONTACT'
      Size = 30
    end
    object StringField27: TStringField
      DisplayLabel = 'Attention'
      DisplayWidth = 15
      FieldName = 'ATTN'
      Origin = 'SHIP_TO.ATTN'
      Size = 60
    end
    object StringField28: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 20
      FieldName = 'ADDR1'
      Origin = 'SHIP_TO.ADDR1'
      Size = 60
    end
    object StringField29: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 20
      FieldName = 'ADDR2'
      Origin = 'SHIP_TO.ADDR2'
      Size = 60
    end
    object StringField30: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 20
      FieldName = 'ADDR3'
      Origin = 'SHIP_TO.ADDR3'
      Size = 60
    end
    object StringField31: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 15
      FieldName = 'CITY'
      Origin = 'SHIP_TO.CITY'
      Size = 30
    end
    object StringField32: TStringField
      DisplayLabel = 'State'
      FieldName = 'STATE'
      Origin = 'SHIP_TO.STATE'
    end
    object StringField33: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 15
      FieldName = 'COUNTRY'
      Origin = 'SHIP_TO.COUNTRY'
      Size = 30
    end
    object StringField34: TStringField
      DisplayLabel = 'Zip'
      FieldName = 'ZIP'
      Origin = 'SHIP_TO.ZIP'
      Size = 10
    end
    object StringField35: TStringField
      DisplayLabel = 'Telephone'
      FieldName = 'PHONE_NUMBER'
      Origin = 'SHIP_TO.PHONE_NUMBER'
      Size = 25
    end
    object StringField36: TStringField
      DisplayLabel = 'Telephone Ext'
      DisplayWidth = 3
      FieldName = 'EXT'
      Origin = 'SHIP_TO.EXT'
      Size = 5
    end
    object StringField37: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX'
      Origin = 'SHIP_TO.FAX'
      Size = 25
    end
    object StringField38: TStringField
      DisplayLabel = 'ECode'
      FieldName = 'ECODE'
      Origin = 'SHIP_TO.ECODE'
      Size = 10
    end
    object PkBillToOEPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'BILL_TO.PK_HIDE'
      Visible = False
      Size = 1
    end
  end
  object PkVendor: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select vendorno,'
      '          company,'
      '          city,'
      '          state,'
      '          country,'
      '          id,'
      '          pk_hide'
      'from v_vendor'
      'order by vendorno'
      '         '
      '         '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 394
    Top = 482
    object PkVendorVENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      FieldName = 'VENDORNO'
      Size = 10
    end
    object StringField39: TStringField
      DisplayLabel = 'Company'
      FieldName = 'COMPANY'
      Size = 60
    end
    object StringField40: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Size = 30
    end
    object StringField41: TStringField
      DisplayLabel = 'State or Region'
      FieldName = 'STATE'
    end
    object StringField42: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      Size = 30
    end
    object FloatField11: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkVendorPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'VENDOR.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object QryStoreFrontUsers: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select trim(u.username) as Username,'
      '                     trim(a.custno) as CustomerNumber,'
      
        '                     trim(nvl(c.first_name,p.first_name)) as fir' +
        'st_name,'
      
        '                     trim(nvl(c.last_name,p.last_name)) as last_' +
        'name,'
      '                     trim(nvl(c.email,u.email)) as EmailAddress,'
      '                     trim(a.company) as company,'
      '                     trim(c.web_userlog) as Password,'
      '                     nvl(a.eplant_id,u.eplant_id) as eplant_id,'
      '                     c.id,'
      
        '                     decode(nvl(dbas.grantee,b2c_admins.user_nam' +
        'e),null,0,1) as isadmin,'
      '                     u.isoracleuser as isoracleuser,'
      '                     a.id as CustomerId'
      
        '                from (select x.username, g.pr_emp_id, g.eplant_i' +
        'd, g.email, decode(nvl(dbau.username,g.user_name),null,0,1) as i' +
        'soracleuser'
      '                        from (select distinct all_usrs.username'
      
        '                                from (select grantee as username' +
        ' from user_tab_privs where table_name = '#39'IQORDER2'#39' and privilege' +
        ' = '#39'SELECT'#39
      '                                        union'
      '                                      select '#39'IQMS'#39' from dual'
      '                                        union'
      
        '                                      select c.web_userid from c' +
        'ontact c) all_usrs) x,'
      '                              dba_users dbau,'
      '                              s_user_general g'
      '                       where x.username = dbau.username(+)'
      '                         and x.username = g.user_name(+) ) u,'
      '                     (select grantee'
      '                        from dba_role_privs'
      '                       where granted_role = '#39'DBA'#39') dbas,'
      '                     (select wur.user_name'
      '                        from web_roles wr, web_users_in_role wur'
      '                       where wur.web_roles_id = wr.id'
      
        '                         and UPPER(wr.name) = '#39'ADMINISTRATOR'#39') b' +
        '2c_admins,'
      '                     pr_emp p,'
      '                     contact c,'
      '                     arcusto a'
      '                     where u.username = dbas.grantee(+)'
      '                       and u.username = b2c_admins.user_name(+)'
      '                       and u.pr_emp_id = p.id(+)'
      '                       and u.username = c.web_userid(+)'
      '                       and c.arcusto_id = a.id(+)')
    Left = 642
    Top = 362
    object QryStoreFrontUsersUSERNAME: TStringField
      FieldName = 'USERNAME'
      Size = 35
    end
    object QryStoreFrontUsersCUSTOMERNUMBER: TStringField
      FieldName = 'CUSTOMERNUMBER'
      Size = 10
    end
    object QryStoreFrontUsersFIRST_NAME: TStringField
      FieldName = 'FIRST_NAME'
      Size = 30
    end
    object QryStoreFrontUsersLAST_NAME: TStringField
      FieldName = 'LAST_NAME'
      Size = 30
    end
    object QryStoreFrontUsersEMAILADDRESS: TStringField
      FieldName = 'EMAILADDRESS'
      Size = 255
    end
    object QryStoreFrontUsersCOMPANY: TStringField
      FieldName = 'COMPANY'
      Size = 60
    end
    object QryStoreFrontUsersPASSWORD: TStringField
      FieldName = 'PASSWORD'
      Size = 40
    end
    object QryStoreFrontUsersEPLANT_ID: TFMTBCDField
      FieldName = 'EPLANT_ID'
      Size = 38
    end
    object QryStoreFrontUsersID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object QryStoreFrontUsersISADMIN: TFMTBCDField
      FieldName = 'ISADMIN'
      Size = 38
    end
    object QryStoreFrontUsersISORACLEUSER: TFMTBCDField
      FieldName = 'ISORACLEUSER'
      Size = 38
    end
    object QryStoreFrontUsersCUSTOMERID: TBCDField
      FieldName = 'CUSTOMERID'
      Size = 0
    end
  end
  object PkGroups: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id, name, description from crm_group')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 64
    Top = 488
    object PkGroupsID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'CRM_GROUP.ID'
      Visible = False
      Size = 0
    end
    object PkGroupsNAME: TStringField
      DisplayLabel = 'Group Name'
      DisplayWidth = 10
      FieldName = 'NAME'
      Origin = 'CRM_GROUP.NAME'
      FixedChar = True
      Size = 35
    end
    object PkGroupsDESCRIPTION: TStringField
      DisplayLabel = 'Group Description'
      DisplayWidth = 10
      FieldName = 'DESCRIPTION'
      Origin = 'CRM_GROUP.DESCRIPTION'
      Size = 255
    end
  end
  object PkLoc: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select l.id as id,'
      '       l.loc_desc as location,'
      '       l.start_row as path,'
      '       l.descrip as description,'
      '       '#39'['#39' || e.ID || '#39']  '#39' || e.name as eplant_name,'
      '       d.name as division,'
      '       d.id as division_id,'
      '       l.pk_hide,         '
      '       l.building'
      '  from locations l,'
      '       eplant e,'
      '       division d'
      ' where l.eplant_id = e.id(+)'
      '   and l.division_id = d.id(+)'
      '   and misc.eplant_filter(l.eplant_id) = 1'
      ''
      ''
      ''
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 470
    Top = 488
    object PkLocID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkLocLOCATION: TStringField
      DisplayLabel = 'Location'
      FieldName = 'LOCATION'
      FixedChar = True
      Size = 30
    end
    object PkLocDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIPTION'
      Size = 50
    end
    object PkLocPATH: TBCDField
      DisplayLabel = 'Path'
      FieldName = 'PATH'
      Size = 0
    end
    object PkLocEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant Name'
      FieldName = 'EPLANT_NAME'
      Size = 74
    end
    object PkLocDIVISION: TStringField
      DisplayLabel = 'Division'
      FieldName = 'DIVISION'
      Size = 25
    end
    object PkLocPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      Size = 1
    end
    object PkLocBUILDING: TStringField
      DisplayLabel = 'Building'
      DisplayWidth = 30
      FieldName = 'BUILDING'
      Size = 60
    end
    object PkLocDIVISION_ID: TBCDField
      FieldName = 'DIVISION_ID'
      Visible = False
      Size = 0
    end
  end
  object QryFreightRulesShipTo: TFDQuery
    BeforePost = QryFreightRulesShipToBeforePost
    AfterPost = ApplyUpdateToTable2
    AfterDelete = ApplyUpdateToTable2
    OnNewRecord = QryFreightRulesShipToNewRecord
    CachedUpdates = True
    MasterSource = SrcShip_to
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateObject = UpdateSQLFreightRulesShipTo
    SQL.Strings = (
      'select id,'
      '       arcusto_id,'
      '       ship_to_id,'
      '       from_weight,'
      '       to_weight,'
      '       freight_id,'
      '       type,'
      '       max_cartons'
      '  from freight_rules'
      ' where ship_to_id = :ID'
      ' order by from_weight')
    Left = 589
    Top = 163
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryFreightRulesShipToFROM_WEIGHT: TFMTBCDField
      DisplayLabel = 'From Weight'
      DisplayWidth = 15
      FieldName = 'FROM_WEIGHT'
      Origin = 'FREIGHT_RULES.FROM_WEIGHT'
      Required = True
      Size = 6
    end
    object QryFreightRulesShipToTO_WEIGHT: TFMTBCDField
      DisplayLabel = 'To Weight'
      DisplayWidth = 15
      FieldName = 'TO_WEIGHT'
      Origin = 'FREIGHT_RULES.TO_WEIGHT'
      Required = True
      Size = 6
    end
    object QryFreightRulesShipToFreight_Descrip: TStringField
      DisplayLabel = 'Ship Via'
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'Freight_Descrip'
      Size = 60
      Calculated = True
    end
    object QryFreightRulesShipToTYPE: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 50
      FieldName = 'TYPE'
      Origin = 'FREIGHT_RULES.TYPE'
      Size = 50
    end
    object QryFreightRulesShipToMAX_CARTONS: TBCDField
      DisplayLabel = 'Max Cartons'
      DisplayWidth = 10
      FieldName = 'MAX_CARTONS'
      Origin = 'FREIGHT_RULES.MAX_CARTONS'
      Size = 0
    end
    object QryFreightRulesShipToID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'FREIGHT_RULES.ID'
      Visible = False
      Size = 0
    end
    object QryFreightRulesShipToFREIGHT_ID: TBCDField
      DisplayLabel = 'Ship Via'
      DisplayWidth = 10
      FieldName = 'FREIGHT_ID'
      Origin = 'FREIGHT_RULES.FREIGHT_ID'
      Required = True
      Visible = False
      Size = 0
    end
    object QryFreightRulesShipToARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object QryFreightRulesShipToSHIP_TO_ID: TBCDField
      FieldName = 'SHIP_TO_ID'
      Origin = 'FREIGHT_RULES.SHIP_TO_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcFreightRulesShipTo: TDataSource
    DataSet = QryFreightRulesShipTo
    Left = 581
    Top = 145
  end
  object UpdateSQLFreightRulesShipTo: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into freight_rules'
      
        '  (ID, ARCUSTO_ID, SHIP_TO_ID, FROM_WEIGHT, TO_WEIGHT, FREIGHT_I' +
        'D, TYPE, '
      '   MAX_CARTONS)'
      'values'
      
        '  (:ID, :ARCUSTO_ID, :SHIP_TO_ID, :FROM_WEIGHT, :TO_WEIGHT, :FRE' +
        'IGHT_ID, '
      '   :TYPE, :MAX_CARTONS)')
    ModifySQL.Strings = (
      'update freight_rules'
      'set'
      '  ID = :ID,'
      '  ARCUSTO_ID = :ARCUSTO_ID,'
      '  SHIP_TO_ID = :SHIP_TO_ID,'
      '  FROM_WEIGHT = :FROM_WEIGHT,'
      '  TO_WEIGHT = :TO_WEIGHT,'
      '  FREIGHT_ID = :FREIGHT_ID,'
      '  TYPE = :TYPE,'
      '  MAX_CARTONS = :MAX_CARTONS'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from freight_rules'
      'where'
      '  ID = :OLD_ID')
    Left = 597
    Top = 187
  end
  object PkTaxCode: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       tax_code,'
      '       tax_code_desc,'
      '       tot_tax_rate'
      '  from tax_codes')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 152
    Top = 488
    object PkTaxCodeTAX_CODE: TStringField
      DisplayLabel = 'Tax Code'
      DisplayWidth = 20
      FieldName = 'TAX_CODE'
      Origin = 'TAX_CODES.TAX_CODE'
    end
    object PkTaxCodeTAX_CODE_DESC: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 50
      FieldName = 'TAX_CODE_DESC'
      Origin = 'TAX_CODES.TAX_CODE_DESC'
      Size = 50
    end
    object PkTaxCodeTOT_TAX_RATE: TFMTBCDField
      DisplayLabel = 'Rate'
      DisplayWidth = 10
      FieldName = 'TOT_TAX_RATE'
      Origin = 'TAX_CODES.TOT_TAX_RATE'
      Size = 6
    end
    object PkTaxCodeID: TBCDField
      FieldName = 'ID'
      Origin = 'TAX_CODES.ID'
      Visible = False
      Size = 0
    end
  end
  object PkTerritory: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT a.id AS id,'
      '       a.code AS code,'
      '       a.descrip AS descrip,'
      '       a.parent_id AS parent_id,'
      '       b.code AS parent_code,'
      '       b.descrip AS parent_descrip'
      '  FROM territory a, territory b'
      ' WHERE b.id(+) = a.parent_id')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 600
    Top = 512
    object PkTerritoryID: TBCDField
      FieldName = 'ID'
      Origin = 'a.id'
      Visible = False
      Size = 0
    end
    object PkTerritoryCODE: TStringField
      DisplayLabel = 'Code'
      FieldName = 'CODE'
      Origin = 'a.code'
      Size = 50
    end
    object PkTerritoryDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Origin = 'a.descrip'
      Size = 250
    end
    object PkTerritoryPARENT_ID: TBCDField
      FieldName = 'PARENT_ID'
      Origin = 'a.parent_id'
      Visible = False
      Size = 0
    end
    object PkTerritoryPARENT_CODE: TStringField
      DisplayLabel = 'Parent Code'
      FieldName = 'PARENT_CODE'
      Origin = 'b.code'
      Size = 50
    end
    object PkTerritoryPARENT_DESCRIP: TStringField
      DisplayLabel = 'Parent Description'
      DisplayWidth = 25
      FieldName = 'PARENT_DESCRIP'
      Origin = 'b.descrip'
      Size = 250
    end
  end
  object PkRefCode: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT category_id,'
      '       category_descrip,'
      '       ref_code_id,'
      '       ref_code_descrip,'
      '       ref_code'
      '  FROM v_ref_code'
      ' WHERE misc.eplant_filter_include_nulls(eplant_id) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 336
    Top = 496
    object PkRefCodeCATEGORY_ID: TBCDField
      FieldName = 'CATEGORY_ID'
      Origin = 'CATEGORY_ID'
      Visible = False
      Size = 0
    end
    object PkRefCodeCATEGORY_DESCRIP: TStringField
      DisplayLabel = 'Category'
      DisplayWidth = 18
      FieldName = 'CATEGORY_DESCRIP'
      Origin = 'CATEGORY_DESCRIP'
      Size = 30
    end
    object PkRefCodeREF_CODE_ID: TBCDField
      FieldName = 'REF_CODE_ID'
      Origin = 'REF_CODE_ID'
      Visible = False
      Size = 0
    end
    object PkRefCodeREF_CODE_DESCRIP: TStringField
      DisplayLabel = 'Reference Code Description'
      DisplayWidth = 18
      FieldName = 'REF_CODE_DESCRIP'
      Origin = 'REF_CODE_DESCRIP'
      Size = 60
    end
    object PkRefCodeREF_CODE: TStringField
      DisplayLabel = 'Reference Code'
      FieldName = 'REF_CODE'
      Origin = 'REF_CODE'
      Size = 10
    end
  end
  object PkUsageType: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT id AS id,'
      '       code AS code,'
      '       description AS descrip'
      '  FROM arcusto_usage_type')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 648
    Top = 512
    object PkUsageTypeID: TBCDField
      FieldName = 'ID'
      Origin = 'id'
      Visible = False
      Size = 0
    end
    object PkUsageTypeCODE: TStringField
      DisplayLabel = 'Code'
      FieldName = 'CODE'
      Origin = 'code'
      Size = 10
    end
    object PkUsageTypeDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Origin = 'description'
      Size = 255
    end
  end
end
