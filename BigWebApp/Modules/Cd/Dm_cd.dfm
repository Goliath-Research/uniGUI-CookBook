object CD_DM: TCD_DM
  OldCreateOrder = True
  Height = 479
  Width = 806
  object SrcPrePostCtrl: TDataSource
    DataSet = TblPrePostCtrl
    Left = 16
    Top = 16
  end
  object TblPrePostCtrl: TFDTable
    BeforeDelete = TblPrePostCtrlBeforeDelete
    BeforeScroll = TblPrePostCtrlBeforeScroll
    OnCalcFields = TblPrePostCtrlCalcFields
    Filtered = True
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'CDPREPOST_CONTROL'
    TableName = 'CDPREPOST_CONTROL'
    Left = 24
    Top = 32
    object TblPrePostCtrlID: TBCDField
      DisplayLabel = 'Group #'
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object TblPrePostCtrlCHECK_DATE: TDateTimeField
      DisplayLabel = 'Check Date'
      DisplayWidth = 18
      FieldName = 'CHECK_DATE'
      EditMask = '!99/99/0000;1; '
    end
    object TblPrePostCtrlBankAcct: TStringField
      DisplayLabel = 'Bank Account'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'BankAcct'
      LookupDataSet = TblBankInfoDtl
      LookupKeyFields = 'ID'
      LookupResultField = 'ACCOUNT_NUMBER'
      KeyFields = 'BANKINFO_DTL_ID'
      Lookup = True
    end
    object TblPrePostCtrlGlAcct: TStringField
      DisplayLabel = 'GL Account'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'GlAcct'
      LookupDataSet = TblGlAcct
      LookupKeyFields = 'ID'
      LookupResultField = 'ACCT'
      KeyFields = 'GlAcct_Id_Cash'
      Size = 50
      Lookup = True
    end
    object TblPrePostCtrlGlPeriod: TStringField
      DisplayLabel = 'GL Period'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'GlPeriod'
      LookupDataSet = TblGlPeriods
      LookupKeyFields = 'ID'
      LookupResultField = 'PERIOD'
      KeyFields = 'GLPERIODS_ID'
      Lookup = True
    end
    object TblPrePostCtrlStart_Date: TDateField
      DisplayLabel = 'Start Date'
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'Start_Date'
      LookupDataSet = TblGlPeriods
      LookupKeyFields = 'ID'
      LookupResultField = 'START_DATE'
      KeyFields = 'GLPERIODS_ID'
      Lookup = True
    end
    object TblPrePostCtrlEnd_Date: TDateField
      DisplayLabel = 'End Date'
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'End_Date'
      LookupDataSet = TblGlPeriods
      LookupKeyFields = 'ID'
      LookupResultField = 'END_DATE'
      KeyFields = 'GLPERIODS_ID'
      Lookup = True
    end
    object TblPrePostCtrlCurrency: TStringField
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'Currency'
      LookupDataSet = tblCurrency2
      LookupKeyFields = 'ID'
      LookupResultField = 'CURR_CODE'
      KeyFields = 'CURRENCY_ID'
      Lookup = True
    end
    object TblPrePostCtrlOUTLOOK_DATE: TDateTimeField
      DisplayLabel = 'Due Date'
      DisplayWidth = 18
      FieldName = 'OUTLOOK_DATE'
      EditMask = '!99/99/0000;1; '
    end
    object TblPrePostCtrlEFT: TStringField
      DisplayWidth = 10
      FieldName = 'EFT'
      FixedChar = True
      Size = 1
    end
    object TblPrePostCtrlAP_REMITTANCE_TYPE: TStringField
      DisplayLabel = 'Remittance Type'
      DisplayWidth = 12
      FieldName = 'AP_REMITTANCE_TYPE'
      OnValidate = TblPrePostCtrlAP_REMITTANCE_TYPEValidate
      Size = 12
    end
    object TblPrePostCtrlEPlant_Name: TStringField
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
    object TblPrePostCtrlBANKINFO_DTL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'BANKINFO_DTL_ID'
      Visible = False
      Size = 0
    end
    object TblPrePostCtrlGlAcct_Id_Cash: TFloatField
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'GlAcct_Id_Cash'
      LookupDataSet = TblBankInfoDtl
      LookupKeyFields = 'ID'
      LookupResultField = 'GLACCT_ID_CASH'
      KeyFields = 'BANKINFO_DTL_ID'
      Visible = False
      Lookup = True
    end
    object TblPrePostCtrlBATCH_TYPE: TStringField
      DisplayWidth = 10
      FieldName = 'BATCH_TYPE'
      Visible = False
      Size = 10
    end
    object TblPrePostCtrlCURRENCY_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'CURRENCY_ID'
      Visible = False
      Size = 0
    end
    object TblPrePostCtrlEPLANT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
    object TblPrePostCtrlSpotRate: TFloatField
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'SpotRate'
      LookupDataSet = TblCurremcy2
      LookupKeyFields = 'ID'
      LookupResultField = 'SPOT_RATE'
      KeyFields = 'CURRENCY_ID'
      Visible = False
      Lookup = True
    end
    object TblPrePostCtrlGlAcctIdSusp: TFloatField
      DisplayLabel = 'var'
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'GlAcctIdSusp'
      LookupDataSet = TblBankInfoDtl
      LookupKeyFields = 'ID'
      LookupResultField = 'GLACCT_ID_SUSPENSE'
      KeyFields = 'BANKINFO_DTL_ID'
      Visible = False
      Lookup = True
    end
    object TblPrePostCtrlGlacctSusp: TStringField
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'GlacctSusp'
      LookupDataSet = TblGlAcct
      LookupKeyFields = 'ID'
      LookupResultField = 'ACCT'
      KeyFields = 'GlAcctIdSusp'
      Visible = False
      Size = 50
      Lookup = True
    end
    object TblPrePostCtrlGlAcctAbs: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'GlAcctAbs'
      Visible = False
      Size = 50
      Calculated = True
    end
    object TblPrePostCtrlGLPERIODS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'GLPERIODS_ID'
      Visible = False
      Size = 0
    end
    object TblPrePostCtrlINTL_PAY_TYPE: TStringField
      DisplayWidth = 15
      FieldName = 'INTL_PAY_TYPE'
      Visible = False
      Size = 15
    end
  end
  object SrcPrePost: TDataSource
    DataSet = QryPrepost
    Left = 104
    Top = 24
  end
  object TblPrePost: TFDTable
    Tag = 1
    Filtered = True
    IndexFieldNames = 'CDPREPOST_CONTROL_ID;CHECK_NO'
    MasterSource = SrcPrePostCtrl
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'CDPREPOST'
    TableName = 'CDPREPOST'
    Left = 160
    Top = 32
    object TblPrePostID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object TblPrePostCDPREPOST_CONTROL_ID: TBCDField
      FieldName = 'CDPREPOST_CONTROL_ID'
      Size = 0
    end
    object TblPrePostCHECK_NO: TBCDField
      FieldName = 'CHECK_NO'
      Size = 0
    end
    object TblPrePostVENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Size = 0
    end
    object TblPrePostARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Size = 0
    end
    object TblPrePostEMPLOYEE_ID: TBCDField
      FieldName = 'EMPLOYEE_ID'
      Size = 0
    end
    object TblPrePostMISC_PAYTO: TStringField
      FieldName = 'MISC_PAYTO'
      Size = 50
    end
    object TblPrePostMISC_ADDR1: TStringField
      FieldName = 'MISC_ADDR1'
      Size = 60
    end
    object TblPrePostMISC_ADDR2: TStringField
      FieldName = 'MISC_ADDR2'
      Size = 60
    end
    object TblPrePostMISC_CITY: TStringField
      FieldName = 'MISC_CITY'
      Size = 30
    end
    object TblPrePostMISC_STATE: TStringField
      FieldName = 'MISC_STATE'
    end
    object TblPrePostMISC_ZIP: TStringField
      FieldName = 'MISC_ZIP'
      Size = 10
    end
    object TblPrePostCHECK_TYPE: TStringField
      FieldName = 'CHECK_TYPE'
      Size = 15
    end
    object TblPrePostVendor: TStringField
      FieldKind = fkLookup
      FieldName = 'Vendor'
      LookupDataSet = TblVendor
      LookupKeyFields = 'ID'
      LookupResultField = 'COMPANY'
      KeyFields = 'VENDOR_ID'
      Lookup = True
    end
    object TblPrePostVAddr1: TStringField
      FieldKind = fkLookup
      FieldName = 'VAddr1'
      LookupDataSet = TblVendor
      LookupKeyFields = 'ID'
      LookupResultField = 'ADDR1'
      KeyFields = 'VENDOR_ID'
      Lookup = True
    end
    object TblPrePostVAddr2: TStringField
      FieldKind = fkLookup
      FieldName = 'VAddr2'
      LookupDataSet = TblVendor
      LookupKeyFields = 'ID'
      LookupResultField = 'ADDR2'
      KeyFields = 'VENDOR_ID'
      Lookup = True
    end
    object TblPrePostVCity: TStringField
      FieldKind = fkLookup
      FieldName = 'VCity'
      LookupDataSet = TblVendor
      LookupKeyFields = 'ID'
      LookupResultField = 'CITY'
      KeyFields = 'VENDOR_ID'
      Lookup = True
    end
    object TblPrePostVState: TStringField
      FieldKind = fkLookup
      FieldName = 'VState'
      LookupDataSet = TblVendor
      LookupKeyFields = 'ID'
      LookupResultField = 'STATE'
      KeyFields = 'VENDOR_ID'
      Lookup = True
    end
    object TblPrePostDisc_taken: TFloatField
      FieldKind = fkLookup
      FieldName = 'Disc_taken'
      LookupDataSet = ViewCdPrepostCheck
      LookupKeyFields = 'CDPREPOST_ID'
      LookupResultField = 'DISCOUNT_TAKEN'
      KeyFields = 'ID'
      currency = True
      Lookup = True
    end
    object TblPrePostVZip: TStringField
      FieldKind = fkLookup
      FieldName = 'VZip'
      LookupDataSet = TblVendor
      LookupKeyFields = 'ID'
      LookupResultField = 'ZIP'
      KeyFields = 'VENDOR_ID'
      Lookup = True
    end
    object TblPrePostCheck_Amount: TFloatField
      FieldKind = fkLookup
      FieldName = 'Check_Amount'
      LookupDataSet = ViewCdPrepostCheck
      LookupKeyFields = 'CDPREPOST_ID'
      LookupResultField = 'AMOUNT_PAID'
      KeyFields = 'ID'
      currency = True
      Lookup = True
    end
    object TblPrePostVCityStateZip: TStringField
      FieldKind = fkCalculated
      FieldName = 'VCityStateZip'
      Calculated = True
    end
    object TblPrePostCustomer: TStringField
      FieldKind = fkLookup
      FieldName = 'Customer'
      LookupDataSet = TblArCusto
      LookupKeyFields = 'ID'
      LookupResultField = 'COMPANY'
      KeyFields = 'ARCUSTO_ID'
      Lookup = True
    end
    object TblPrePostCAddr1: TStringField
      FieldKind = fkLookup
      FieldName = 'CAddr1'
      LookupDataSet = TblArCusto
      LookupKeyFields = 'ID'
      LookupResultField = 'ADDR1'
      KeyFields = 'ARCUSTO_ID'
      Lookup = True
    end
    object TblPrePostCAddr2: TStringField
      FieldKind = fkLookup
      FieldName = 'CAddr2'
      LookupDataSet = TblArCusto
      LookupKeyFields = 'ID'
      LookupResultField = 'ADDR2'
      KeyFields = 'ARCUSTO_ID'
      Lookup = True
    end
    object TblPrePostCCity: TStringField
      FieldKind = fkLookup
      FieldName = 'CCity'
      LookupDataSet = TblArCusto
      LookupKeyFields = 'ID'
      LookupResultField = 'CITY'
      KeyFields = 'ARCUSTO_ID'
      Lookup = True
    end
    object TblPrePostCState: TStringField
      FieldKind = fkLookup
      FieldName = 'CState'
      LookupDataSet = TblArCusto
      LookupKeyFields = 'ID'
      LookupResultField = 'STATE'
      KeyFields = 'ARCUSTO_ID'
      Lookup = True
    end
    object TblPrePostCZip: TStringField
      FieldKind = fkLookup
      FieldName = 'CZip'
      LookupDataSet = TblArCusto
      LookupKeyFields = 'ID'
      LookupResultField = 'ZIP'
      KeyFields = 'ARCUSTO_ID'
      Lookup = True
    end
    object TblPrePostCcityStateZip: TStringField
      FieldKind = fkCalculated
      FieldName = 'CcityStateZip'
      Calculated = True
    end
    object TblPrePostRemitTo: TStringField
      FieldKind = fkCalculated
      FieldName = 'PayTo'
      Size = 50
      Calculated = True
    end
    object TblPrePostPRINT: TStringField
      FieldName = 'PRINT'
      Size = 1
    end
    object TblPrePostREMIT_TO_ID: TBCDField
      FieldName = 'REMIT_TO_ID'
      Size = 0
    end
    object TblPrePostRemitto2: TStringField
      FieldKind = fkCalculated
      FieldName = 'Remitto'
      Calculated = True
    end
    object TblPrePostVendorNo: TStringField
      FieldKind = fkLookup
      FieldName = 'VendorNo'
      LookupDataSet = TblVendor
      LookupKeyFields = 'ID'
      LookupResultField = 'VENDORNO'
      KeyFields = 'VENDOR_ID'
      Lookup = True
    end
    object TblPrePostEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object PkAcct: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '          acct,'
      '          descrip,'
      '          type,'
      '          eplant_id'
      '  from V_GLACCT_GLSUB_ACCT_TYPE'
      'where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      '  and misc.eplant_filter(eplant_id) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 264
    Top = 19
    object PkAcctID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkAcctACCT: TStringField
      DisplayLabel = 'Account #'
      FieldName = 'ACCT'
      Size = 50
    end
    object PkAcctDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object PkAcctTYPE: TStringField
      DisplayLabel = 'Account Type'
      FieldName = 'TYPE'
      Origin = 'V_GLACCT_GLSUB_ACCT_TYPE.TYPE'
      Size = 35
    end
    object PkAcctEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object TblGlAcct: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'GLACCT'
    TableName = 'GLACCT'
    Left = 32
    Top = 88
  end
  object TblGlPeriods: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'GLPERIODS'
    TableName = 'GLPERIODS'
    Left = 104
    Top = 136
  end
  object TblBankInfoDtl: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'BANKINFO_DTL'
    TableName = 'BANKINFO_DTL'
    Left = 168
    Top = 88
    object TblBankInfoDtlBANKINFO_ID: TBCDField
      FieldName = 'BANKINFO_ID'
      Required = True
      Size = 0
    end
    object TblBankInfoDtlACCOUNT_NUMBER: TStringField
      FieldName = 'ACCOUNT_NUMBER'
      Required = True
      Size = 25
    end
    object TblBankInfoDtlDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 60
    end
    object TblBankInfoDtlID: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object TblBankInfoDtlGLACCT_ID_CASH: TBCDField
      FieldName = 'GLACCT_ID_CASH'
      Size = 0
    end
    object TblBankInfoDtlLAST_CHECKNO: TBCDField
      FieldName = 'LAST_CHECKNO'
      Size = 0
    end
    object TblBankInfoDtlGLACCT_ID_SUSPENSE: TBCDField
      FieldName = 'GLACCT_ID_SUSPENSE'
      Size = 0
    end
    object TblBankInfoDtlEFT: TStringField
      FieldName = 'EFT'
      FixedChar = True
      Size = 1
    end
  end
  object PkBank: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select b.id as id,'
      '       b.account_number as account_number,'
      '       b.description as description,'
      '       b.last_checkno as last_checkno,'
      '       b.eplant_id as eplant_id,'
      '       a.acct as acct,'
      '       a.descrip as descrip'
      '  from bankinfo_dtl b, glacct a'
      'where b.glacct_id_cash = a.id'
      ''
      ' '
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 328
    Top = 24
    object PkBankID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkBankACCOUNT_NUMBER: TStringField
      DisplayLabel = 'Account #'
      FieldName = 'ACCOUNT_NUMBER'
      Size = 25
    end
    object PkBankDESCRIPTION: TStringField
      DisplayLabel = 'Bank Account Description'
      FieldName = 'DESCRIPTION'
      Size = 60
    end
    object PkBankLAST_CHECKNO: TBCDField
      DisplayLabel = 'Last-Used Check #'
      FieldName = 'LAST_CHECKNO'
      Size = 0
    end
    object PkBankACCT: TStringField
      DisplayLabel = 'Cash Account'
      FieldName = 'ACCT'
      Size = 50
    end
    object PkBankDESCRIP: TStringField
      DisplayLabel = 'GL Account Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object PkBankEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'IQ.BANKINFO_DTL.EPLANT_ID'
      Size = 0
    end
  end
  object TblVendor: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'VENDOR'
    TableName = 'VENDOR'
    Left = 240
    Top = 88
  end
  object SrcQryprepostCheck: TDataSource
    DataSet = QryPrePostCheck
    Left = 312
    Top = 88
  end
  object QryPrePostCheck: TFDQuery
    Tag = 1
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from v_cdprepost_cheque ')
    Left = 328
    Top = 104
    object QryPrePostCheckCDPREPOST_ID: TBCDField
      FieldName = 'CDPREPOST_ID'
      Size = 0
    end
    object QryPrePostCheckAMOUNT_PAID: TFMTBCDField
      FieldName = 'AMOUNT_PAID'
      Size = 38
    end
    object QryPrePostCheckDISCOUNT_TAKEN: TFMTBCDField
      FieldName = 'DISCOUNT_TAKEN'
      Size = 38
    end
  end
  object TblArCusto: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'ARCUSTO'
    TableName = 'ARCUSTO'
    Left = 168
    Top = 200
  end
  object SrcCtrlTotal: TDataSource
    DataSet = QryCtrlTotal
    Left = 232
    Top = 307
  end
  object QryCtrlTotal: TFDQuery
    Tag = 1
    MasterSource = SrcPrePostCtrl
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from v_cdprepost_ctrl_total'
      'where cdprepost_control_id = :ID')
    Left = 232
    Top = 323
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryCtrlTotalCDPREPOST_CONTROL_ID: TBCDField
      FieldName = 'CDPREPOST_CONTROL_ID'
      Size = 0
    end
    object QryCtrlTotalTOTAL_INV: TFMTBCDField
      FieldName = 'TOTAL_INV'
      currency = True
      Size = 38
    end
    object QryCtrlTotalTOTAL_PAID: TFMTBCDField
      FieldName = 'TOTAL_PAID'
      currency = True
      Size = 38
    end
    object QryCtrlTotalTOTAL_DISCOUNT: TFMTBCDField
      FieldName = 'TOTAL_DISCOUNT'
      currency = True
      Size = 38
    end
    object QryCtrlTotalINV_AMOUNT_PAID: TFMTBCDField
      FieldName = 'INV_AMOUNT_PAID'
      currency = True
      Size = 38
    end
    object QryCtrlTotalINV_BALANCE: TFMTBCDField
      FieldName = 'INV_BALANCE'
      currency = True
      Size = 38
    end
    object QryCtrlTotalTOTAL_INV_EX: TFMTBCDField
      FieldName = 'TOTAL_INV_EX'
      Origin = 'IQ.V_CDPREPOST_CTRL_TOTAL.TOTAL_INV_EX'
      currency = True
      Size = 38
    end
    object QryCtrlTotalTOTAL_PAID_EX: TFMTBCDField
      FieldName = 'TOTAL_PAID_EX'
      Origin = 'IQ.V_CDPREPOST_CTRL_TOTAL.TOTAL_PAID_EX'
      currency = True
      Size = 38
    end
    object QryCtrlTotalTOTAL_DISCOUNT_EX: TFMTBCDField
      FieldName = 'TOTAL_DISCOUNT_EX'
      Origin = 'IQ.V_CDPREPOST_CTRL_TOTAL.TOTAL_DISCOUNT_EX'
      currency = True
      Size = 38
    end
    object QryCtrlTotalINV_AMOUNT_PAID_EX: TFMTBCDField
      FieldName = 'INV_AMOUNT_PAID_EX'
      Origin = 'IQ.V_CDPREPOST_CTRL_TOTAL.INV_AMOUNT_PAID_EX'
      currency = True
      Size = 38
    end
    object QryCtrlTotalINV_BALANCE_EX: TFMTBCDField
      FieldName = 'INV_BALANCE_EX'
      Origin = 'IQ.V_CDPREPOST_CTRL_TOTAL.INV_BALANCE_EX'
      currency = True
      Size = 38
    end
  end
  object PkBatch: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select c.id as id,'
      '       c.check_date as check_date,'
      '       c.outlook_date as outlook_date,'
      '       c.Bank_Account as bank_account,'
      '       c.GL_Account as GL_Account,'
      '       c.gl_period as gl_period,'
      '       c.start_date as start_date,'
      '       c.end_date as end_date,'
      '       c.currency as currency,'
      '       c.eft as eft,'
      '       c.Remittance_Type as Remittance_Type,'
      '       c.eplant_id as eplant_id'
      '  from v_cdprepost_control c')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 384
    Top = 24
    object PkBatchID: TBCDField
      DisplayLabel = 'Group#'
      FieldName = 'ID'
      Size = 0
    end
    object PkBatchCHECK_DATE: TDateTimeField
      DisplayLabel = 'Check Date'
      FieldName = 'CHECK_DATE'
    end
    object PkBatchOUTLOOK_DATE: TDateTimeField
      DisplayLabel = 'Due Date'
      FieldName = 'OUTLOOK_DATE'
    end
    object PkBatchBANK_ACCOUNT: TStringField
      DisplayLabel = 'Bank Account'
      FieldName = 'BANK_ACCOUNT'
      Size = 25
    end
    object PkBatchGL_ACCOUNT: TStringField
      DisplayLabel = 'GL Account'
      FieldName = 'GL_ACCOUNT'
      Size = 50
    end
    object PkBatchGL_PERIOD: TBCDField
      DisplayLabel = 'GL Period'
      FieldName = 'GL_PERIOD'
      Size = 0
    end
    object PkBatchSTART_DATE: TDateTimeField
      DisplayLabel = 'Start Date'
      FieldName = 'START_DATE'
    end
    object PkBatchEND_DATE: TDateTimeField
      DisplayLabel = 'End Date'
      FieldName = 'END_DATE'
    end
    object PkBatchCURRENCY: TStringField
      DisplayLabel = 'Currency'
      FieldName = 'CURRENCY'
      Size = 10
    end
    object PkBatchEFT: TStringField
      FieldName = 'EFT'
      FixedChar = True
      Size = 1
    end
    object PkBatchREMITTANCE_TYPE: TStringField
      DisplayLabel = 'Remittance Type'
      FieldName = 'REMITTANCE_TYPE'
      Size = 12
    end
    object PkBatchEPLANT_ID: TBCDField
      DisplayLabel = 'Eplant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object SrcPrePostPr: TDataSource
    DataSet = QryPrePostPr
    Left = 328
    Top = 304
  end
  object SrcPrePostDtl: TDataSource
    DataSet = QryPrepostDtl
    Left = 448
    Top = 32
  end
  object wwGLAcct: TFDTable
    IndexName = 'PK_GLACCT'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'GLACCT'
    TableName = 'GLACCT'
    Left = 512
    Top = 32
  end
  object QryPrePostPr: TFDQuery
    OnCalcFields = QryPrePostPrCalcFields
    MasterSource = SrcPrePostCtrl
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select To_char(c.check_no) as check_no,'
      '       c.id,'
      '       c.cdprepost_control_id,'
      '       c.print,'
      '       c.check_type,'
      '       c.misc_payto,'
      '       c.order_seq,'
      '       NVL(v.amount_paid, 0) as amount_paid,'
      '       NVL(v.amount_paid_ex, 0) as amount_paid_ex,'
      '       NVL(r.attn, c.misc_payto) as CompRemitTo,'
      '       va.amount_paid as Check_Amount,'
      '       va.amount_paid_ex as Check_Amount_ex,'
      '       r.CD_CHECK_REPNAME as remit_to_CD_CHECK_REPNAME,'
      '       vr.CD_CHECK_REPNAME as vendor_CD_CHECK_REPNAME,'
      '       vr.vendorno'
      '  from cdprepost c,         '
      '       V_CDPREPOST_CHEQUE v,'
      '       remit_to r,'
      '       V_CDPREPOST_CHEQUE va,'
      '       vendor vr'
      ' where c.print = '#39'Y'#39
      '   and c.cdprepost_control_id = :ID'
      '   and c.id = v.cdprepost_id(+)'
      '   and c.id = va.cdprepost_id(+)'
      
        '   and 0 <> (select count(cdprepost_id) from cdprepost_detail wh' +
        'ere cdprepost_id = c.id)'
      '   and NVL(v.amount_paid, 0) > 0'
      '   and c.remit_to_id = r.id(+)'
      '   and c.vendor_id = vr.id(+)'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 328
    Top = 312
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryPrePostPrCOMPREMITTO: TStringField
      DisplayLabel = 'Remit To'
      DisplayWidth = 20
      FieldName = 'COMPREMITTO'
      Origin = 'NVL(r.attn, c.misc_payto)'
      Size = 60
    end
    object QryPrePostPrCHECK_NO: TStringField
      DisplayLabel = 'Check #'
      DisplayWidth = 40
      FieldName = 'CHECK_NO'
      Origin = 'c.Check_no'
      Size = 40
    end
    object QryPrePostPrCHECK_TYPE: TStringField
      DisplayLabel = 'Check Type'
      DisplayWidth = 15
      FieldName = 'CHECK_TYPE'
      Origin = 'C.CHECK_TYPE'
      Size = 15
    end
    object QryPrePostPrCHECK_AMOUNT: TFMTBCDField
      DisplayLabel = 'Check'
      DisplayWidth = 10
      FieldName = 'CHECK_AMOUNT'
      Origin = 'VA.AMOUNT_PAID'
      Size = 38
    end
    object QryPrePostPrORDER_SEQ: TBCDField
      DisplayLabel = '#'
      DisplayWidth = 10
      FieldName = 'ORDER_SEQ'
      Origin = 'C.ORDER_SEQ'
      Size = 0
    end
    object QryPrePostPrCHECK_AMOUNT_EX: TFMTBCDField
      DisplayLabel = 'Bank Check'
      DisplayWidth = 10
      FieldName = 'CHECK_AMOUNT_EX'
      Size = 38
    end
    object QryPrePostPrID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryPrePostPrCDPREPOST_CONTROL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'CDPREPOST_CONTROL_ID'
      Visible = False
      Size = 0
    end
    object QryPrePostPrPRINT: TStringField
      DisplayWidth = 1
      FieldName = 'PRINT'
      Visible = False
      Size = 1
    end
    object QryPrePostPrMISC_PAYTO: TStringField
      DisplayWidth = 50
      FieldName = 'MISC_PAYTO'
      Visible = False
      Size = 50
    end
    object QryPrePostPrAMOUNT_PAID: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'AMOUNT_PAID'
      Visible = False
      Size = 38
    end
    object QryPrePostPrAMOUNT_PAID_EX: TFMTBCDField
      FieldName = 'AMOUNT_PAID_EX'
      Visible = False
      Size = 38
    end
    object QryPrePostPrREMIT_TO_CD_CHECK_REPNAME: TStringField
      FieldName = 'REMIT_TO_CD_CHECK_REPNAME'
      Size = 250
    end
    object QryPrePostPrVENDOR_CD_CHECK_REPNAME: TStringField
      FieldName = 'VENDOR_CD_CHECK_REPNAME'
      Size = 250
    end
    object QryPrePostPrVENDORNO: TStringField
      FieldName = 'VENDORNO'
      FixedChar = True
      Size = 10
    end
  end
  object QryRemitto: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from remit_to where vendor_id = :nId'
      ' and  ((Intl_Pay_Type = :AIntl_Pay_Type) or (:ADummy = 1) )'
      '')
    Left = 216
    Top = 16
    ParamData = <
      item
        Name = 'nId'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'AIntl_Pay_Type'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'ADummy'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QryRemittoATTN: TStringField
      DisplayLabel = 'Attn.'
      DisplayWidth = 15
      FieldName = 'ATTN'
      Origin = 'REMIT_TO.ATTN'
      Size = 60
    end
    object QryRemittoADDR1: TStringField
      DisplayLabel = 'Addr1.'
      DisplayWidth = 15
      FieldName = 'ADDR1'
      Origin = 'REMIT_TO.ADDR1'
      Size = 60
    end
    object QryRemittoADDR2: TStringField
      DisplayLabel = 'Addr2.'
      DisplayWidth = 15
      FieldName = 'ADDR2'
      Origin = 'REMIT_TO.ADDR2'
      Size = 60
    end
    object QryRemittoCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 15
      FieldName = 'CITY'
      Origin = 'REMIT_TO.CITY'
      Size = 30
    end
    object QryRemittoSTATE: TStringField
      DisplayLabel = 'State'
      DisplayWidth = 2
      FieldName = 'STATE'
      Origin = 'REMIT_TO.STATE'
    end
    object QryRemittoZIP: TStringField
      DisplayLabel = 'Zip'
      DisplayWidth = 10
      FieldName = 'ZIP'
      Origin = 'REMIT_TO.ZIP'
      Size = 10
    end
    object QryRemittoID: TBCDField
      FieldName = 'ID'
      Origin = 'REMIT_TO.ID'
      Visible = False
      Size = 0
    end
    object QryRemittoVENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Origin = 'REMIT_TO.VENDOR_ID'
      Visible = False
      Size = 0
    end
    object QryRemittoADDR3: TStringField
      FieldName = 'ADDR3'
      Origin = 'REMIT_TO.ADDR3'
      Visible = False
      Size = 60
    end
    object QryRemittoCURRENCY_ID: TStringField
      FieldName = 'CURRENCY_ID'
      Origin = 'REMIT_TO.CURRENCY_ID'
      Visible = False
      Size = 3
    end
    object QryRemittoPHONE_NUMBER: TStringField
      FieldName = 'PHONE_NUMBER'
      Origin = 'REMIT_TO.PHONE_NUMBER'
      Visible = False
      Size = 25
    end
    object QryRemittoFAX_NUMBER: TStringField
      FieldName = 'FAX_NUMBER'
      Origin = 'REMIT_TO.FAX_NUMBER'
      Visible = False
      Size = 25
    end
    object QryRemittoPRIME_CONTACT: TStringField
      FieldName = 'PRIME_CONTACT'
      Origin = 'REMIT_TO.PRIME_CONTACT'
      Visible = False
      Size = 30
    end
    object QryRemittoCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Origin = 'REMIT_TO.COUNTRY'
      Visible = False
      Size = 30
    end
  end
  object tblCurrency: TFDTable
    BeforeOpen = tblCurrencyBeforeOpen
    IndexName = 'PK_CURRENCY'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'CURRENCY'
    TableName = 'CURRENCY'
    Left = 476
    Top = 242
    object tblCurrencyID: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object tblCurrencyCURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 10
    end
    object tblCurrencyDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 50
    end
    object tblCurrencyGLVALUE: TStringField
      FieldName = 'GLVALUE'
      Size = 50
    end
    object tblCurrencySPOT_RATE: TFMTBCDField
      FieldName = 'SPOT_RATE'
      Size = 6
    end
    object tblCurrencyCURR_SYMBOL: TStringField
      FieldName = 'CURR_SYMBOL'
      Size = 10
    end
    object tblCurrencyECODE: TStringField
      FieldName = 'ECODE'
      Size = 10
    end
    object tblCurrencyEID: TBCDField
      FieldName = 'EID'
      Size = 0
    end
    object tblCurrencyEDATE_TIME: TDateTimeField
      FieldName = 'EDATE_TIME'
    end
    object tblCurrencyECOPY: TStringField
      FieldName = 'ECOPY'
      FixedChar = True
      Size = 1
    end
    object tblCurrencyNATIVE_CURR: TStringField
      FieldName = 'NATIVE_CURR'
      Size = 3
    end
  end
  object tblCurrency2: TFDTable
    BeforeOpen = tblCurrency2BeforeOpen
    Filtered = True
    IndexName = 'PK_CURRENCY'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'CURRENCY'
    TableName = 'CURRENCY'
    Left = 484
    Top = 306
    object tblCurrency2ID: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object tblCurrency2CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 10
    end
    object tblCurrency2DESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 50
    end
    object tblCurrency2GLVALUE: TStringField
      FieldName = 'GLVALUE'
      Size = 50
    end
    object tblCurrency2SPOT_RATE: TFMTBCDField
      FieldName = 'SPOT_RATE'
      Size = 6
    end
    object tblCurrency2CURR_SYMBOL: TStringField
      FieldName = 'CURR_SYMBOL'
      Size = 10
    end
    object tblCurrency2ECODE: TStringField
      FieldName = 'ECODE'
      Size = 10
    end
    object tblCurrency2EID: TBCDField
      FieldName = 'EID'
      Size = 0
    end
    object tblCurrency2EDATE_TIME: TDateTimeField
      FieldName = 'EDATE_TIME'
    end
    object tblCurrency2ECOPY: TStringField
      FieldName = 'ECOPY'
      FixedChar = True
      Size = 1
    end
    object tblCurrency2NATIVE_CURR: TStringField
      FieldName = 'NATIVE_CURR'
      Size = 3
    end
  end
  object PkAllInv: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select v.id                as id,'
      '       v.vendor_id         as vendor_id,'
      '       v.on_hold           as on_hold,'
      '       v.invoice_no        as invoice_no,'
      '       v.invoice_amount    as invoice_amount,'
      '       v.terms_id          as terms_id,'
      '       v.invoice_date      as invoice_date,'
      '       v.due_date          as due_date,'
      '       v.discount_days     as discount_days,'
      '       v.discount          as discount,'
      '       v.amount_paid       as amount_paid,'
      '       v.discount_taken    as discount_taken,'
      '       v.amount_to_pay     as amount_to_pay,'
      '       v.current_discount  as current_discount,'
      '       v.remit_to_id       as remit_to_id,'
      '       v.remit_to_attn     as remit_to_attn,'
      '       v.disc_date         as disc_date,'
      '       v.curr_code         as curr_code,'
      '       v.currency_descrip  as currency_descrip,'
      '       n.Company           as Company'
      'from v_apinvoice_cheque v,'
      'vendor n'
      'where v.vendor_id = n.id(+)'
      'and NVL(v.amount_to_pay, 0) <> 0')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 40
    Top = 256
    object PkAllInvID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkAllInvVENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Visible = False
      Size = 0
    end
    object PkAllInvON_HOLD: TStringField
      DisplayLabel = 'On Hold'
      FieldName = 'ON_HOLD'
      Size = 1
    end
    object PkAllInvINVOICE_NO: TStringField
      DisplayLabel = 'Invoice #'
      FieldName = 'INVOICE_NO'
      Size = 50
    end
    object PkAllInvINVOICE_AMOUNT: TBCDField
      DisplayLabel = 'Invoice Amount'
      FieldName = 'INVOICE_AMOUNT'
      Size = 2
    end
    object PkAllInvTERMS_ID: TBCDField
      FieldName = 'TERMS_ID'
      Visible = False
      Size = 0
    end
    object PkAllInvINVOICE_DATE: TDateTimeField
      DisplayLabel = 'Invoice Date'
      FieldName = 'INVOICE_DATE'
    end
    object PkAllInvDUE_DATE: TDateTimeField
      DisplayLabel = 'Due Date'
      FieldName = 'DUE_DATE'
    end
    object PkAllInvDISCOUNT_DAYS: TFMTBCDField
      DisplayLabel = 'Discount Days'
      FieldName = 'DISCOUNT_DAYS'
      Size = 38
    end
    object PkAllInvDISCOUNT: TFMTBCDField
      DisplayLabel = 'Discount'
      FieldName = 'DISCOUNT'
      Size = 38
    end
    object PkAllInvAMOUNT_PAID: TFMTBCDField
      DisplayLabel = 'Amount Paid'
      FieldName = 'AMOUNT_PAID'
      Size = 38
    end
    object PkAllInvDISCOUNT_TAKEN: TFMTBCDField
      DisplayLabel = 'Discount Taken'
      FieldName = 'DISCOUNT_TAKEN'
      Size = 38
    end
    object PkAllInvAMOUNT_TO_PAY: TFMTBCDField
      DisplayLabel = 'Amount to Pay'
      FieldName = 'AMOUNT_TO_PAY'
      Size = 38
    end
    object PkAllInvCURRENT_DISCOUNT: TFMTBCDField
      DisplayLabel = 'Current Discount'
      FieldName = 'CURRENT_DISCOUNT'
      Size = 38
    end
    object PkAllInvREMIT_TO_ID: TBCDField
      FieldName = 'REMIT_TO_ID'
      Visible = False
      Size = 0
    end
    object PkAllInvREMIT_TO_ATTN: TStringField
      DisplayLabel = 'Remit To'
      FieldName = 'REMIT_TO_ATTN'
      Size = 60
    end
    object PkAllInvDISC_DATE: TDateTimeField
      DisplayLabel = 'Discount Date'
      FieldName = 'DISC_DATE'
    end
    object PkAllInvCURR_CODE: TStringField
      DisplayLabel = 'Currency Code'
      FieldName = 'CURR_CODE'
      Size = 10
    end
    object PkAllInvCURRENCY_DESCRIP: TStringField
      DisplayLabel = 'Currency'
      FieldName = 'CURRENCY_DESCRIP'
      Size = 50
    end
    object PkAllInvCOMPANY: TStringField
      DisplayLabel = 'Company'
      FieldName = 'COMPANY'
      Size = 60
    end
  end
  object PKCDPrepost: TIQWebHpick
    BeforeOpen = PKCDPrepostBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select c.id as id,'
      '       c.eplant_id as eplant_id,'
      '       NVL(c.check_no, 0) as check_no,'
      '       c.vendor_id as vendor_id,'
      
        '       decode(c.vendor_id, null, misc_payto, v.company) as payee' +
        ','
      '       decode(c.vendor_id, null, misc_addr1, v.addr1) as addr1,'
      '       decode(c.vendor_id, null, misc_addr2, v.addr2) as addr2,'
      '       decode(c.vendor_id, null, misc_city,  v.city) as city,'
      
        '       decode(c.vendor_id, null, misc_state, v.state, misc_state' +
        ') as state,'
      '       decode(c.vendor_id, null, misc_zip,   v.zip) as zip'
      ' from cdprepost c,'
      '      vendor v'
      ' where c.vendor_id = v.id(+)'
      '   and c.cdprepost_control_id = :nId'
      
        '   and (c.vendor_id is null or (c.vendor_id is not null and exis' +
        'ts (select id from v_vendor where id = c.vendor_id)))   '
      ''
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 120
    Top = 256
    ParamData = <
      item
        Name = 'nId'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PKCDPrepostID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PKCDPrepostCHECK_NO: TFMTBCDField
      DisplayLabel = 'Check #'
      FieldName = 'CHECK_NO'
      Size = 38
    end
    object PKCDPrepostVENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Visible = False
      Size = 0
    end
    object PKCDPrepostPAYEE: TStringField
      DisplayLabel = 'Payee'
      FieldName = 'PAYEE'
      Size = 60
    end
    object PKCDPrepostADDR1: TStringField
      DisplayLabel = 'Address 1'
      FieldName = 'ADDR1'
      Size = 60
    end
    object PKCDPrepostADDR2: TStringField
      DisplayLabel = 'Address 2'
      FieldName = 'ADDR2'
      Size = 60
    end
    object PKCDPrepostCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Size = 30
    end
    object PKCDPrepostSTATE: TStringField
      DisplayLabel = 'State or Region'
      FieldName = 'STATE'
    end
    object PKCDPrepostZIP: TStringField
      DisplayLabel = 'Postal Code'
      FieldName = 'ZIP'
      Size = 10
    end
    object PKCDPrepostEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object wwQryGLAcct: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from glacct'
      'where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      'and  NVL(AP_HIDE, '#39'N'#39') = '#39'N'#39
      '     and misc.eplant_filter(eplant_id) = 1'
      ' order by acct'
      ' ')
    Left = 512
    Top = 99
    object wwQryGLAcctACCT: TStringField
      DisplayLabel = 'G/L Account'
      DisplayWidth = 20
      FieldName = 'ACCT'
      Origin = 'GLACCT.ACCT'
      Size = 50
    end
    object wwQryGLAcctDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'GLACCT.DESCRIP'
      Size = 50
    end
    object wwQryGLAcctTYPE: TStringField
      DisplayWidth = 15
      FieldName = 'TYPE'
      Origin = 'GLACCT.TYPE'
      Size = 25
    end
    object wwQryGLAcctID: TBCDField
      FieldName = 'ID'
      Origin = 'GLACCT.ID'
      Visible = False
      Size = 0
    end
    object wwQryGLAcctGL_SUBACCT_TYPE_ID: TBCDField
      FieldName = 'GL_SUBACCT_TYPE_ID'
      Origin = 'GLACCT.GL_SUBACCT_TYPE_ID'
      Visible = False
      Size = 0
    end
    object wwQryGLAcctMAJORTYPE: TStringField
      FieldName = 'MAJORTYPE'
      Origin = 'GLACCT.MAJORTYPE'
      Visible = False
      Size = 35
    end
    object wwQryGLAcctECODE: TStringField
      FieldName = 'ECODE'
      Origin = 'GLACCT.ECODE'
      Visible = False
      Size = 10
    end
    object wwQryGLAcctEID: TBCDField
      FieldName = 'EID'
      Origin = 'GLACCT.EID'
      Visible = False
      Size = 0
    end
    object wwQryGLAcctEDATE_TIME: TDateTimeField
      FieldName = 'EDATE_TIME'
      Origin = 'GLACCT.EDATE_TIME'
      Visible = False
    end
    object wwQryGLAcctECOPY: TStringField
      FieldName = 'ECOPY'
      Origin = 'GLACCT.ECOPY'
      Visible = False
      Size = 1
    end
    object wwQryGLAcctOLD_SPOT_RATE: TFMTBCDField
      FieldName = 'OLD_SPOT_RATE'
      Origin = 'GLACCT.OLD_SPOT_RATE'
      Visible = False
      Size = 6
    end
    object wwQryGLAcctNEW_SPOT_RATE: TFMTBCDField
      FieldName = 'NEW_SPOT_RATE'
      Origin = 'GLACCT.NEW_SPOT_RATE'
      Visible = False
      Size = 6
    end
    object wwQryGLAcctFX_ACCT_ID: TBCDField
      FieldName = 'FX_ACCT_ID'
      Origin = 'GLACCT.FX_ACCT_ID'
      Visible = False
      Size = 0
    end
    object wwQryGLAcctFX_OFFSET_ACCT_ID: TBCDField
      FieldName = 'FX_OFFSET_ACCT_ID'
      Origin = 'GLACCT.FX_OFFSET_ACCT_ID'
      Visible = False
      Size = 0
    end
    object wwQryGLAcctEEXCLUDE: TStringField
      FieldName = 'EEXCLUDE'
      Origin = 'GLACCT.EEXCLUDE'
      Visible = False
      Size = 1
    end
    object wwQryGLAcctEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'GLACCT.EPLANT_ID'
      Size = 0
    end
  end
  object QryPrepostDtl: TFDQuery
    Tag = 1
    BeforeOpen = QryPrepostDtlBeforeOpen
    BeforeInsert = QryPrepostDtlBeforeEdit
    BeforeEdit = QryPrepostDtlBeforeEdit
    BeforePost = QryPrepostDtlBeforePost
    AfterPost = QryPrepostDtlAfterDelete
    BeforeDelete = QryPrepostDtlBeforeDelete
    AfterDelete = QryPrepostDtlAfterDelete
    OnCalcFields = QryPrepostDtlCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateObject = USPrepostDtl
    SQL.Strings = (
      'select c.id,'
      '       c.cdprepost_id,'
      '       c.amount_paid,'
      
        '       c.amount_paid * NVL(d.exchange_rate, 1) as amount_paid_ex' +
        ','
      '       c.apinvoice_id,'
      '       c.ap_discount_taken,'
      
        '       c.ap_discount_taken * NVL(d.exchange_rate, 1) as ap_disco' +
        'unt_taken_ex,'
      '       c.glacct_id_ap_disc,'
      '       c.glacct_id_misc_expense,'
      '       c.ref_no,'
      '       v1.invoice_no,'
      '       v1.amount_to_pay,'
      
        '       v1.amount_to_pay * NVL(d.exchange_rate, 1) as amount_to_p' +
        'ay_ex,'
      '       v1.due_date,'
      '       v1.disc_date,'
      
        '       v1.current_discount * NVL(d.exchange_rate, 1) as current_' +
        'discount_ex,'
      '       v1.current_discount,'
      '       v1.cuser1,'
      '       v1.cuser2,'
      '       v1.cuser3,'
      '       c.on_acct'
      '  from CDPREPOST_DETAIL c,'
      '       cdprepost d,'
      '       (select a.id,'
      '               a.invoice_no,'
      '               a.cuser1,'
      '               a.cuser2,'
      '               a.cuser3,'
      '               a.due_date,'
      
        '               NVL(a.disc_date, a.invoice_date + NVL(t.discount_' +
        'days, 0)) as disc_date,'
      
        '               Round(NVL(invoice_amount, 0) - NVL(v.amount_paid,' +
        ' 0), 2) - NVL(v.discount_taken, 0) as amount_to_pay,'
      
        '               Round((NVL(detail.amount_distributed, 0) - NVL(v.' +
        'amount_paid, 0) +'
      
        '               NVL(v.discount_taken, 0)) * decode(NVL(a.disc_amo' +
        'unt, 0), 0, NVL(t.discount, 0)/100, a.disc_amount/a.invoice_amou' +
        'nt), 2) as current_discount'
      '          from APINVOICE a,'
      '               C_AP_CHEQUE_DETAIL v,'
      '               terms t,'
      '               C_AP_DISTRIBUTED detail,'
      '               cdprepost_detail cd'
      '         where a.id = v.apinvoice_id(+)'
      '           and a.terms_id = t.id(+)'
      '           and detail.apinvoice_id(+) = a.id'
      '           and cd.apinvoice_id = a.id'
      '           and cd.cdprepost_id = :AId ) v1'
      ' where c.apinvoice_id = v1.id(+)'
      '   and c.cdprepost_id = d.id'
      '   and c.cdprepost_id = :AId'
      '')
    Left = 448
    Top = 48
    ParamData = <
      item
        Name = 'AId'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryPrepostDtlAMOUNT_PAID: TBCDField
      DisplayLabel = 'Amount Paid'
      DisplayWidth = 10
      FieldName = 'AMOUNT_PAID'
      Origin = 'C.AMOUNT_PAID'
      Size = 2
    end
    object QryPrepostDtlAMOUNT_PAID_EX: TFMTBCDField
      DisplayLabel = 'Ex. Amount Paid'
      DisplayWidth = 10
      FieldName = 'AMOUNT_PAID_EX'
      Origin = 'c.amount_paid * NVL(d.exchange_rate, 1)'
      currency = True
      Size = 38
    end
    object QryPrepostDtlAP_DISCOUNT_TAKEN: TBCDField
      DisplayLabel = 'Discount Taken'
      DisplayWidth = 12
      FieldName = 'AP_DISCOUNT_TAKEN'
      Origin = 'C.AP_DISCOUNT_TAKEN'
      Size = 2
    end
    object QryPrepostDtlAP_DISCOUNT_TAKEN_EX: TFMTBCDField
      DisplayLabel = 'Ex. Discount Taken'
      DisplayWidth = 10
      FieldName = 'AP_DISCOUNT_TAKEN_EX'
      Origin = 'c.ap_discount_taken * NVL(d.exchange_rate, 1) '
      currency = True
      Size = 38
    end
    object QryPrepostDtlINVOICE_NO: TStringField
      DisplayLabel = 'Invoice #'
      DisplayWidth = 9
      FieldName = 'INVOICE_NO'
      Origin = 'V1.INVOICE_NO'
      ReadOnly = True
      Size = 50
    end
    object QryPrepostDtlAMOUNT_TO_PAY: TFMTBCDField
      DisplayLabel = 'Balance Due'
      DisplayWidth = 10
      FieldName = 'AMOUNT_TO_PAY'
      Origin = 'V1.AMOUNT_TO_PAY'
      ReadOnly = True
      Size = 38
    end
    object QryPrepostDtlAMOUNT_TO_PAY_EX: TFMTBCDField
      DisplayLabel = 'Ex. Balance Due'
      DisplayWidth = 10
      FieldName = 'AMOUNT_TO_PAY_EX'
      Origin = 'v1.amount_to_pay * NVL(d.exchange_rate, 1)'
      currency = True
      Size = 38
    end
    object QryPrepostDtlDUE_DATE: TDateTimeField
      DisplayLabel = 'Due Date'
      DisplayWidth = 9
      FieldName = 'DUE_DATE'
      Origin = 'V1.DUE_DATE'
      ReadOnly = True
    end
    object QryPrepostDtlDISC_DATE: TDateTimeField
      DisplayLabel = 'Discount Date'
      DisplayWidth = 9
      FieldName = 'DISC_DATE'
      Origin = 'V1.DISC_DATE'
      ReadOnly = True
    end
    object QryPrepostDtlCURRENT_DISCOUNT: TFMTBCDField
      DisplayLabel = 'Discount Amount'
      DisplayWidth = 13
      FieldName = 'CURRENT_DISCOUNT'
      Origin = 'V1.CURRENT_DISCOUNT'
      ReadOnly = True
      Size = 38
    end
    object QryPrepostDtlCURRENT_DISCOUNT_EX: TFMTBCDField
      DisplayLabel = 'Ex. Discount Amount'
      DisplayWidth = 10
      FieldName = 'CURRENT_DISCOUNT_EX'
      Origin = 'v1.current_discount * NVL(d.exchange_rate, 1)'
      currency = True
      Size = 38
    end
    object QryPrepostDtlAcctMisc: TStringField
      Tag = 1
      DisplayLabel = 'Misc GL Account'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'AcctMisc'
      Size = 50
      Calculated = True
    end
    object QryPrepostDtlAcctDisc: TStringField
      Tag = 1
      DisplayLabel = 'Discount GL Account'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'AcctDisc'
      Size = 50
      Calculated = True
    end
    object QryPrepostDtlREF_NO: TStringField
      DisplayLabel = 'Ref/Invoice #'
      DisplayWidth = 15
      FieldName = 'REF_NO'
      Origin = 'c.ref_no'
      Size = 15
    end
    object QryPrepostDtlON_ACCT: TStringField
      DisplayLabel = 'On Account'
      DisplayWidth = 1
      FieldName = 'ON_ACCT'
      ReadOnly = True
      Size = 1
    end
    object QryPrepostDtlCUSER1: TStringField
      DisplayLabel = 'Note 1'
      DisplayWidth = 20
      FieldName = 'CUSER1'
      Origin = 'v1.CUSER1'
      Size = 100
    end
    object QryPrepostDtlCUSER2: TStringField
      DisplayLabel = 'Note 2'
      DisplayWidth = 20
      FieldName = 'CUSER2'
      Origin = 'v1.CUSER2'
      Size = 100
    end
    object QryPrepostDtlCUSER3: TStringField
      DisplayLabel = 'Note 3'
      DisplayWidth = 20
      FieldName = 'CUSER3'
      Origin = 'v1.CUSER3'
      Size = 100
    end
    object QryPrepostDtlAcctMiscDesc: TStringField
      DisplayLabel = 'Misc G/L Account Description'
      DisplayWidth = 50
      FieldKind = fkCalculated
      FieldName = 'AcctMiscDesc'
      Size = 50
      Calculated = True
    end
    object QryPrepostDtlAcctDiscDesc: TStringField
      DisplayLabel = 'Disc G/L Acct Description'
      DisplayWidth = 50
      FieldKind = fkCalculated
      FieldName = 'AcctDiscDesc'
      Size = 50
      Calculated = True
    end
    object QryPrepostDtlID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryPrepostDtlCDPREPOST_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'CDPREPOST_ID'
      Visible = False
      Size = 0
    end
    object QryPrepostDtlAPINVOICE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'APINVOICE_ID'
      Visible = False
      Size = 0
    end
    object QryPrepostDtlGLACCT_ID_AP_DISC: TBCDField
      DisplayWidth = 10
      FieldName = 'GLACCT_ID_AP_DISC'
      Origin = 'c.glacct_id_ap_disc'
      Visible = False
      Size = 0
    end
    object QryPrepostDtlGLACCT_ID_MISC_EXPENSE: TBCDField
      DisplayWidth = 10
      FieldName = 'GLACCT_ID_MISC_EXPENSE'
      Origin = 'c.glacct_id_misc_expense'
      Visible = False
      Size = 0
    end
  end
  object USPrepostDtl: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into CDPREPOST_DETAIL'
      
        '  (ID, CDPREPOST_ID, AMOUNT_PAID, APINVOICE_ID, AP_DISCOUNT_TAKE' +
        'N, '
      'GLACCT_ID_AP_DISC, '
      '   GLACCT_ID_MISC_EXPENSE, REF_NO, ON_ACCT)'
      'values'
      '  (:ID, :CDPREPOST_ID, :AMOUNT_PAID, :APINVOICE_ID, '
      ':AP_DISCOUNT_TAKEN, '
      
        '   :GLACCT_ID_AP_DISC, :GLACCT_ID_MISC_EXPENSE, :REF_NO, :ON_ACC' +
        'T)')
    ModifySQL.Strings = (
      'update CDPREPOST_DETAIL'
      'set'
      '  ID = :ID,'
      '  CDPREPOST_ID = :CDPREPOST_ID,'
      '  AMOUNT_PAID = :AMOUNT_PAID,'
      '  APINVOICE_ID = :APINVOICE_ID,'
      '  AP_DISCOUNT_TAKEN = :AP_DISCOUNT_TAKEN,'
      '  GLACCT_ID_AP_DISC = :GLACCT_ID_AP_DISC,'
      '  GLACCT_ID_MISC_EXPENSE = :GLACCT_ID_MISC_EXPENSE,'
      '  REF_NO = :REF_NO,'
      '  ON_ACCT = :ON_ACCT'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from CDPREPOST_DETAIL'
      'where'
      '  ID = :OLD_ID')
    Left = 448
    Top = 152
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
      '')
    Left = 240
    Top = 144
  end
  object QryPrepost: TFDQuery
    BeforeOpen = QryPrepostBeforeOpen
    BeforeInsert = QryPrepostBeforeEdit
    BeforeEdit = QryPrepostBeforeEdit
    AfterPost = QryPrepostAfterPost
    BeforeDelete = QryPrepostBeforeDelete
    AfterDelete = QryPrepostAfterDelete
    BeforeScroll = QryPrepostBeforeScroll
    OnCalcFields = QryPrepostCalcFields
    MasterSource = SrcPrePostCtrl
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'cdprepost'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select c.id,'
      '       c.cdprepost_control_id,'
      '       c.check_no,'
      '       c.vendor_id,'
      '       c.arcusto_id,'
      '       c.employee_id,'
      '       c.misc_payto,'
      '       c.misc_addr1,'
      '       c.misc_addr2,'
      '       c.misc_city,'
      '       c.misc_state,'
      '       c.misc_zip,'
      '       c.check_type,'
      '       c.print,'
      '       c.remit_to_id,'
      '       c.cd_print_batch,'
      '       c.order_seq,'
      '       c.eplant_id,'
      '       c.currency_id,'
      '       c.exchange_rate,'
      '       v.company as vendor,'
      '       v.addr1 as vaddr1,'
      '       v.addr2 as vaddr2,'
      '       v.city as vcity,'
      '       v.state as vstate,'
      '       v.zip as vzip,'
      '       v.vendorno,'
      '       vc.discount_taken as disc_taken,'
      '       vc.amount_paid as check_amount,'
      
        '       vc.amount_paid * NVL(c.exchange_rate, 1) as check_amount_' +
        'ex,'
      '       a.company as customer,'
      '       a.addr1 as caddr1,'
      '       a.addr2 as caddr2,'
      '       a.city as ccity,'
      '       a.state as cstate,'
      '       a.zip as czip,'
      '       r.attn as remitto,'
      '       cu.curr_code,'
      '       cu.spot_rate as spotrate,'
      '       cu.descrip as curr_descrip,'
      '       c.comment1'
      '  from cdprepost c,'
      '       vendor v,'
      '       V_CDPREPOST_CHEQUE vc,'
      '       arcusto a,'
      '       remit_to r,'
      '       currency cu'
      ' where c.vendor_id = v.id(+)'
      '   and c.id = vc.cdprepost_id(+)'
      '   and c.arcusto_id = a.id(+)'
      '   and c.remit_to_id = r.id(+)'
      '   and c.currency_id = cu.id(+)'
      '   and c.cdprepost_control_id = :ID'
      
        '   and (c.vendor_id is null or (c.vendor_id is not null and exis' +
        'ts (select id from v_vendor where id = c.vendor_id)))   '
      ' '
      ' '
      ' ')
    Left = 104
    Top = 48
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryPrepostVENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      DisplayWidth = 10
      FieldName = 'VENDORNO'
      Origin = 'V.VENDORNO'
      Size = 10
    end
    object QryPrepostPayTo: TStringField
      DisplayLabel = 'Vendor'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'PayTo'
      Origin = 'V.COMPANY'
      Calculated = True
    end
    object QryPrepostREMITTO: TStringField
      DisplayLabel = 'Remit To'
      DisplayWidth = 20
      FieldName = 'REMITTO'
      Origin = 'R.ATTN'
      Size = 60
    end
    object QryPrepostCHECK_NO: TBCDField
      Tag = 1
      DisplayLabel = 'Check #'
      DisplayWidth = 10
      FieldName = 'CHECK_NO'
      Origin = 'C.CHECK_NO'
      Size = 0
    end
    object QryPrepostCHECK_TYPE: TStringField
      DisplayLabel = 'Check Type'
      DisplayWidth = 15
      FieldName = 'CHECK_TYPE'
      Origin = 'C.CHECK_TYPE'
      Size = 15
    end
    object QryPrepostDISC_TAKEN: TFMTBCDField
      DisplayLabel = 'Discount'
      DisplayWidth = 10
      FieldName = 'DISC_TAKEN'
      Origin = 'vc.discount_taken'
      currency = True
      Size = 38
    end
    object QryPrepostCHECK_AMOUNT: TFMTBCDField
      DisplayLabel = 'Check'
      DisplayWidth = 10
      FieldName = 'CHECK_AMOUNT'
      Origin = 'vc.amount_paid'
      currency = True
      Size = 38
    end
    object QryPrepostCURR_CODE: TStringField
      DisplayLabel = 'Currency'
      DisplayWidth = 10
      FieldName = 'CURR_CODE'
      Size = 10
    end
    object QryPrepostEXCHANGE_RATE: TFMTBCDField
      DisplayLabel = 'Exchange Rate'
      DisplayWidth = 10
      FieldName = 'EXCHANGE_RATE'
      Size = 6
    end
    object QryPrepostCHECK_AMOUNT_EX: TFMTBCDField
      DisplayLabel = 'Ex. Check Amount'
      DisplayWidth = 10
      FieldName = 'CHECK_AMOUNT_EX'
      currency = True
      Size = 38
    end
    object QryPrepostCOMMENT1: TStringField
      DisplayLabel = 'Comment'
      DisplayWidth = 255
      FieldName = 'COMMENT1'
      Size = 255
    end
    object QryPrepostCSTATE: TStringField
      DisplayWidth = 2
      FieldName = 'CSTATE'
      Origin = 'A.STATE'
      Visible = False
    end
    object QryPrepostCUSTOMER: TStringField
      DisplayWidth = 30
      FieldName = 'CUSTOMER'
      Origin = 'A.COMPANY'
      Visible = False
      Size = 60
    end
    object QryPrepostCADDR1: TStringField
      DisplayWidth = 30
      FieldName = 'CADDR1'
      Origin = 'A.ADDR1'
      Visible = False
      Size = 60
    end
    object QryPrepostCADDR2: TStringField
      DisplayWidth = 30
      FieldName = 'CADDR2'
      Origin = 'A.ADDR2'
      Visible = False
      Size = 60
    end
    object QryPrepostCCITY: TStringField
      DisplayWidth = 30
      FieldName = 'CCITY'
      Origin = 'A.CITY'
      Visible = False
      Size = 30
    end
    object QryPrepostCZIP: TStringField
      DisplayWidth = 10
      FieldName = 'CZIP'
      Origin = 'A.ZIP'
      Visible = False
      Size = 10
    end
    object QryPrepostVCityStateZip: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'VCityStateZip'
      Visible = False
      Calculated = True
    end
    object QryPrepostCcityStateZip: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'CcityStateZip'
      Visible = False
      Calculated = True
    end
    object QryPrepostVENDOR: TStringField
      DisplayLabel = 'Vendor'
      DisplayWidth = 30
      FieldName = 'VENDOR'
      Origin = 'V.COMPANY'
      Visible = False
      Size = 60
    end
    object QryPrepostPRINT: TStringField
      DisplayWidth = 1
      FieldName = 'PRINT'
      Origin = 'C.PRINT'
      Visible = False
      Size = 1
    end
    object QryPrepostREMIT_TO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'REMIT_TO_ID'
      Origin = 'C.REMIT_TO_ID'
      Visible = False
      Size = 0
    end
    object QryPrepostEPLANT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'C.EPLANT_ID'
      Visible = False
      Size = 0
    end
    object QryPrepostVADDR1: TStringField
      DisplayWidth = 30
      FieldName = 'VADDR1'
      Origin = 'V.ADDR1'
      Visible = False
      Size = 60
    end
    object QryPrepostVADDR2: TStringField
      DisplayWidth = 30
      FieldName = 'VADDR2'
      Origin = 'V.ADDR2'
      Visible = False
      Size = 60
    end
    object QryPrepostVCITY: TStringField
      DisplayWidth = 30
      FieldName = 'VCITY'
      Origin = 'V.CITY'
      Visible = False
      Size = 30
    end
    object QryPrepostVSTATE: TStringField
      DisplayWidth = 2
      FieldName = 'VSTATE'
      Origin = 'V.SATATE'
      Visible = False
    end
    object QryPrepostVZIP: TStringField
      DisplayWidth = 10
      FieldName = 'VZIP'
      Origin = 'V.ZIP'
      Visible = False
      Size = 10
    end
    object QryPrepostVENDOR_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'VENDOR_ID'
      Origin = 'C.VENDOR_ID'
      Visible = False
      Size = 0
    end
    object QryPrepostARCUSTO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARCUSTO_ID'
      Origin = 'C.ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object QryPrepostEMPLOYEE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EMPLOYEE_ID'
      Origin = 'C.EMPLOYEE_ID'
      Visible = False
      Size = 0
    end
    object QryPrepostMISC_PAYTO: TStringField
      DisplayWidth = 50
      FieldName = 'MISC_PAYTO'
      Origin = 'C.MISC_PAYTO'
      Visible = False
      Size = 50
    end
    object QryPrepostMISC_ADDR1: TStringField
      DisplayWidth = 30
      FieldName = 'MISC_ADDR1'
      Origin = 'C.MISC_ADDR1'
      Visible = False
      Size = 60
    end
    object QryPrepostMISC_ADDR2: TStringField
      DisplayWidth = 30
      FieldName = 'MISC_ADDR2'
      Origin = 'C.MISC_ADDR2'
      Visible = False
      Size = 60
    end
    object QryPrepostMISC_CITY: TStringField
      DisplayWidth = 30
      FieldName = 'MISC_CITY'
      Origin = 'C.MISC_CITY'
      Visible = False
      Size = 30
    end
    object QryPrepostMISC_STATE: TStringField
      DisplayWidth = 5
      FieldName = 'MISC_STATE'
      Origin = 'C.MISC_STATE'
      Visible = False
    end
    object QryPrepostMISC_ZIP: TStringField
      DisplayWidth = 10
      FieldName = 'MISC_ZIP'
      Origin = 'C.MISC_ZIP'
      Visible = False
      Size = 10
    end
    object QryPrepostID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'C.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryPrepostCDPREPOST_CONTROL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'CDPREPOST_CONTROL_ID'
      Origin = 'C.CDPREPOST_CONTROL_ID'
      Visible = False
      Size = 0
    end
    object QryPrepostCURRENCY_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'CURRENCY_ID'
      Visible = False
      Size = 0
    end
    object QryPrepostCURR_DESCRIP: TStringField
      DisplayWidth = 50
      FieldName = 'CURR_DESCRIP'
      Visible = False
      Size = 50
    end
    object QryPrepostSPOTRATE: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'SPOTRATE'
      Visible = False
      Size = 6
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into cdprepost'
      '  (ID, CDPREPOST_CONTROL_ID, CHECK_NO, VENDOR_ID, ARCUSTO_ID, '
      'EMPLOYEE_ID, '
      '   MISC_PAYTO, MISC_ADDR1, MISC_ADDR2, MISC_CITY, MISC_STATE, '
      'MISC_ZIP, '
      '   CHECK_TYPE, PRINT, REMIT_TO_ID, EPLANT_ID, CURRENCY_ID, '
      'EXCHANGE_RATE, COMMENT1)'
      'values'
      
        '  (:ID, :CDPREPOST_CONTROL_ID, :CHECK_NO, :VENDOR_ID, :ARCUSTO_I' +
        'D, '
      ':EMPLOYEE_ID, '
      
        '   :MISC_PAYTO, :MISC_ADDR1, :MISC_ADDR2, :MISC_CITY, :MISC_STAT' +
        'E, '
      ':MISC_ZIP, '
      '   :CHECK_TYPE, :PRINT, :REMIT_TO_ID, :EPLANT_ID, :CURRENCY_ID, '
      ':EXCHANGE_RATE, :COMMENT1)')
    ModifySQL.Strings = (
      'update cdprepost'
      'set'
      '  ID = :ID,'
      '  CDPREPOST_CONTROL_ID = :CDPREPOST_CONTROL_ID,'
      '  CHECK_NO = :CHECK_NO,'
      '  VENDOR_ID = :VENDOR_ID,'
      '  ARCUSTO_ID = :ARCUSTO_ID,'
      '  EMPLOYEE_ID = :EMPLOYEE_ID,'
      '  MISC_PAYTO = :MISC_PAYTO,'
      '  MISC_ADDR1 = :MISC_ADDR1,'
      '  MISC_ADDR2 = :MISC_ADDR2,'
      '  MISC_CITY = :MISC_CITY,'
      '  MISC_STATE = :MISC_STATE,'
      '  MISC_ZIP = :MISC_ZIP,'
      '  CHECK_TYPE = :CHECK_TYPE,'
      '  PRINT = :PRINT,'
      '  REMIT_TO_ID = :REMIT_TO_ID,'
      '  CURRENCY_ID = :CURRENCY_ID,'
      '  EXCHANGE_RATE = :EXCHANGE_RATE,'
      '  EPLANT_ID = :EPLANT_ID,'
      '  COMMENT1 = :COMMENT1'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from cdprepost'
      'where'
      '  ID = :OLD_ID')
    Left = 104
    Top = 80
  end
  object TblCurremcy2: TFDTable
    IndexName = 'PK_CURRENCY'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'CURRENCY'
    TableName = 'CURRENCY'
    Left = 204
    Top = 258
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
      ' where c1.native_curr = c1.curr_code'
      '  order by c1.descrip'
      ''
      ''
      ''
      ' ')
    Left = 416
    Top = 232
    object QryCurrencyDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'IQ.CURRENCY.DESCRIP'
      Size = 50
    end
    object QryCurrencySPOT_RATE: TFMTBCDField
      DisplayLabel = 'Spot Rate'
      DisplayWidth = 10
      FieldName = 'SPOT_RATE'
      Origin = 'IQ.CURRENCY.SPOT_RATE'
      Size = 6
    end
    object QryCurrencyCURR_CODE: TStringField
      DisplayLabel = 'Currency Code'
      DisplayWidth = 10
      FieldName = 'CURR_CODE'
      Origin = 'IQ.CURRENCY.CURR_CODE'
      Size = 10
    end
    object QryCurrencyGLVALUE: TStringField
      DisplayLabel = 'GL Value'
      DisplayWidth = 10
      FieldName = 'GLVALUE'
      Origin = 'IQ.CURRENCY.GLVALUE'
      Size = 50
    end
    object QryCurrencyCURR_SYMBOL: TStringField
      DisplayLabel = 'Currency Symbol'
      DisplayWidth = 10
      FieldName = 'CURR_SYMBOL'
      Origin = 'IQ.CURRENCY.CURR_SYMBOL'
      Size = 10
    end
    object QryCurrencyNATIVE_CURR: TStringField
      DisplayLabel = 'Native Curr. Code'
      DisplayWidth = 3
      FieldName = 'NATIVE_CURR'
      Origin = 'IQ.CURRENCY.NATIVE_CURR'
      Size = 3
    end
    object QryCurrencyID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.CURRENCY.ID'
      Visible = False
      Size = 0
    end
    object QryCurrencyECODE: TStringField
      FieldName = 'ECODE'
      Origin = 'IQ.CURRENCY.ECODE'
      Visible = False
      Size = 10
    end
    object QryCurrencyEID: TBCDField
      FieldName = 'EID'
      Origin = 'IQ.CURRENCY.EID'
      Visible = False
      Size = 0
    end
    object QryCurrencyEDATE_TIME: TDateTimeField
      FieldName = 'EDATE_TIME'
      Origin = 'IQ.CURRENCY.EDATE_TIME'
      Visible = False
    end
    object QryCurrencyECOPY: TStringField
      FieldName = 'ECOPY'
      Origin = 'IQ.CURRENCY.ECOPY'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object QryCurrency2: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       curr_code,'
      '       descrip,'
      '       glvalue,'
      '       spot_rate,'
      '       curr_symbol,'
      '       ecode,'
      '       eid,'
      '       edate_time,'
      '       ecopy,'
      '       native_curr'
      '  from currency'
      ' order by descrip')
    Left = 424
    Top = 336
    object StringField1: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'IQ.CURRENCY.DESCRIP'
      Size = 50
    end
    object FloatField1: TFMTBCDField
      DisplayLabel = 'Spot Rate'
      DisplayWidth = 10
      FieldName = 'SPOT_RATE'
      Origin = 'IQ.CURRENCY.SPOT_RATE'
      Size = 6
    end
    object StringField2: TStringField
      DisplayLabel = 'Currency Code'
      DisplayWidth = 10
      FieldName = 'CURR_CODE'
      Origin = 'IQ.CURRENCY.CURR_CODE'
      Size = 10
    end
    object StringField3: TStringField
      DisplayLabel = 'GL Value'
      DisplayWidth = 10
      FieldName = 'GLVALUE'
      Origin = 'IQ.CURRENCY.GLVALUE'
      Size = 50
    end
    object StringField4: TStringField
      DisplayLabel = 'Currency Symbol'
      DisplayWidth = 10
      FieldName = 'CURR_SYMBOL'
      Origin = 'IQ.CURRENCY.CURR_SYMBOL'
      Size = 10
    end
    object StringField5: TStringField
      DisplayLabel = 'Native Curr. Code'
      DisplayWidth = 3
      FieldName = 'NATIVE_CURR'
      Origin = 'IQ.CURRENCY.NATIVE_CURR'
      Size = 3
    end
    object FloatField2: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.CURRENCY.ID'
      Visible = False
      Size = 0
    end
    object StringField6: TStringField
      FieldName = 'ECODE'
      Origin = 'IQ.CURRENCY.ECODE'
      Visible = False
      Size = 10
    end
    object FloatField3: TBCDField
      FieldName = 'EID'
      Origin = 'IQ.CURRENCY.EID'
      Visible = False
      Size = 0
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'EDATE_TIME'
      Origin = 'IQ.CURRENCY.EDATE_TIME'
      Visible = False
    end
    object StringField7: TStringField
      FieldName = 'ECOPY'
      Origin = 'IQ.CURRENCY.ECOPY'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object PkQCurr: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select distinct curr_code'
      ' from currency')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 104
    Top = 328
    object PkQCurrCURR_CODE: TStringField
      DisplayLabel = 'Currency Code'
      FieldName = 'CURR_CODE'
      Origin = 'IQ.CURRENCY.CURR_CODE'
      Size = 10
    end
  end
  object PkVendor: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select v.vendorno as vendorno,'
      '       v.company as company,'
      '       v.city as city,'
      '       v.state as state,'
      '       v.zip as zip,'
      '       v.addr1 as addr1,'
      '       v.addr2 as addr2,'
      '       v.addr3 as addr3,'
      '       v.ID as id,'
      '       v.cuser1 as cuser1,'
      '       v.pk_hide as pk_hide'
      '  from v_vendor v,'
      '       currency c'
      ' where v.currency_id = c.id(+)'
      '  and misc.multi_eplant_filter_incl_nulls(v.eplant_id, '#39'CD'#39') = 1'
      
        '   and ((:ADummy = 1 and c.curr_code = :ACurrcode) or (:ADummy =' +
        ' 0))       '
      '           '
      ' '
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 312
    Top = 168
    ParamData = <
      item
        Name = 'ACurrcode'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'ADummy'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object PkVendorVENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      FieldName = 'VENDORNO'
      Size = 10
    end
    object PkVendorCOMPANY: TStringField
      DisplayLabel = 'Vendor'
      FieldName = 'COMPANY'
      Size = 60
    end
    object PkVendorCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Size = 30
    end
    object PkVendorSTATE: TStringField
      DisplayLabel = 'State or Region'
      FieldName = 'STATE'
    end
    object PkVendorZIP: TStringField
      DisplayLabel = 'Postal Code'
      FieldName = 'ZIP'
      Size = 10
    end
    object PkVendorID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkVendorADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 20
      FieldName = 'ADDR1'
      Origin = 'VENDOR.ADDR1'
      Size = 60
    end
    object PkVendorADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 20
      FieldName = 'ADDR2'
      Origin = 'VENDOR.ADDR2'
      Size = 60
    end
    object PkVendorADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 20
      FieldName = 'ADDR3'
      Origin = 'IQ.VENDOR.ADDR3'
      FixedChar = True
      Size = 60
    end
    object PkVendorPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.VENDOR.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object PkVendorCUSER1: TStringField
      DisplayLabel = 'User Text'
      DisplayWidth = 30
      FieldName = 'CUSER1'
      Origin = 'IQ.VENDOR.CUSER1'
      Size = 60
    end
  end
  object QryINTL_Pay_type: TFDQuery
    BeforeOpen = QryPrepostDtlBeforeOpen
    BeforeInsert = QryPrepostDtlBeforeEdit
    BeforeEdit = QryPrepostDtlBeforeEdit
    BeforePost = QryPrepostDtlBeforePost
    AfterPost = QryPrepostDtlAfterDelete
    BeforeDelete = QryPrepostDtlBeforeDelete
    AfterDelete = QryPrepostDtlAfterDelete
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    SQL.Strings = (
      'select unique Intl_Pay_Type'
      ' from remit_to'
      '')
    Left = 32
    Top = 200
    object QryINTL_Pay_typeINTL_PAY_TYPE: TStringField
      DisplayLabel = 'EFT Payment Type'
      DisplayWidth = 15
      FieldName = 'INTL_PAY_TYPE'
      Size = 15
    end
  end
  object wwQryGLAcctDisc: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from glacct'
      'where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      '     and  NVL(AP_HIDE, '#39'N'#39') = '#39'N'#39
      '     and misc.eplant_filter(eplant_id) = 1'
      ' order by acct'
      ' ')
    Left = 592
    Top = 99
    object StringField8: TStringField
      DisplayLabel = 'G/L Account'
      DisplayWidth = 20
      FieldName = 'ACCT'
      Origin = 'GLACCT.ACCT'
      Size = 50
    end
    object StringField9: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'GLACCT.DESCRIP'
      Size = 50
    end
    object StringField10: TStringField
      DisplayWidth = 15
      FieldName = 'TYPE'
      Origin = 'GLACCT.TYPE'
      Size = 25
    end
    object FloatField4: TBCDField
      FieldName = 'ID'
      Origin = 'GLACCT.ID'
      Visible = False
      Size = 0
    end
    object FloatField5: TBCDField
      FieldName = 'GL_SUBACCT_TYPE_ID'
      Origin = 'GLACCT.GL_SUBACCT_TYPE_ID'
      Visible = False
      Size = 0
    end
    object StringField11: TStringField
      FieldName = 'MAJORTYPE'
      Origin = 'GLACCT.MAJORTYPE'
      Visible = False
      Size = 35
    end
    object StringField12: TStringField
      FieldName = 'ECODE'
      Origin = 'GLACCT.ECODE'
      Visible = False
      Size = 10
    end
    object FloatField6: TBCDField
      FieldName = 'EID'
      Origin = 'GLACCT.EID'
      Visible = False
      Size = 0
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'EDATE_TIME'
      Origin = 'GLACCT.EDATE_TIME'
      Visible = False
    end
    object StringField13: TStringField
      FieldName = 'ECOPY'
      Origin = 'GLACCT.ECOPY'
      Visible = False
      Size = 1
    end
    object FloatField7: TFMTBCDField
      FieldName = 'OLD_SPOT_RATE'
      Origin = 'GLACCT.OLD_SPOT_RATE'
      Visible = False
      Size = 6
    end
    object FloatField8: TFMTBCDField
      FieldName = 'NEW_SPOT_RATE'
      Origin = 'GLACCT.NEW_SPOT_RATE'
      Visible = False
      Size = 6
    end
    object FloatField9: TBCDField
      FieldName = 'FX_ACCT_ID'
      Origin = 'GLACCT.FX_ACCT_ID'
      Visible = False
      Size = 0
    end
    object FloatField10: TBCDField
      FieldName = 'FX_OFFSET_ACCT_ID'
      Origin = 'GLACCT.FX_OFFSET_ACCT_ID'
      Visible = False
      Size = 0
    end
    object StringField14: TStringField
      FieldName = 'EEXCLUDE'
      Origin = 'GLACCT.EEXCLUDE'
      Visible = False
      Size = 1
    end
    object FloatField11: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'GLACCT.EPLANT_ID'
      Size = 0
    end
  end
  object QryBankAcount: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select b.id              as id,               '
      '       b.account_number  as account_number,   '
      '       b.description     as description,      '
      '       b.last_checkno    as last_checkno,     '
      '       b.eplant_id       as eplant_id,        '
      '       a.acct            as acct,             '
      '       a.descrip         as descrip           '
      '  from bankinfo_dtl b, glacct a, bankinfo c   '
      'where b.glacct_id_cash = a.id                 '
      '  and b.bankinfo_id = c.id '
      '  and NVL(b.pk_hide, '#39'N'#39') <> '#39'Y'#39' '
      '  and NVL(c.pk_hide, '#39'N'#39') <> '#39'Y'#39' '
      
        '  and (misc.eplant_filter(b.eplant_id) = 1 or b.eplant_id is nul' +
        'l) '
      '')
    Left = 560
    Top = 176
    object QryBankAcountACCOUNT_NUMBER: TStringField
      DisplayLabel = 'Account'
      DisplayWidth = 25
      FieldName = 'ACCOUNT_NUMBER'
      Size = 25
    end
    object QryBankAcountDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 60
      FieldName = 'DESCRIPTION'
      Size = 60
    end
    object QryBankAcountEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object QryBankAcountACCT: TStringField
      DisplayWidth = 50
      FieldName = 'ACCT'
      Visible = False
      Size = 50
    end
    object QryBankAcountID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryBankAcountLAST_CHECKNO: TBCDField
      DisplayWidth = 10
      FieldName = 'LAST_CHECKNO'
      Visible = False
      Size = 0
    end
    object QryBankAcountDESCRIP: TStringField
      DisplayWidth = 50
      FieldName = 'DESCRIP'
      Visible = False
      Size = 50
    end
  end
  object ViewApInvoiceCheck: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from V_APINVOICE_CHEQUE')
    Left = 640
    Top = 256
  end
  object ViewCdPrepostCheck: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from V_CDPREPOST_CHEQUE')
    Left = 648
    Top = 328
  end
end
