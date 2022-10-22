object SVM_DM: TSVM_DM
  OldCreateOrder = False
  Height = 149
  Width = 451
  object dsFreight: TDataSource
    DataSet = QryFreight
    Left = 40
    Top = 72
  end
  object QryFreight: TFDQuery
    OnNewRecord = QryFreightNewRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.KeyFields = 'ID'
    SQL.Strings = (
      'SELECT f.id                 AS id,'
      '  f.descrip                 AS descrip,'
      '  f.glacct_id_freight       AS glacct_id_freight,'
      '  glf.acct                  AS glacct_acct_freight,'
      '  f.scac_iata_code          AS scac_iata_code,'
      '  f.code_qualifier          AS code_qualifier,'
      '  f.transport_code          AS transport_code,'
      '  f.equip_owners_code       AS equip_owners_code,'
      '  f.glacct_id_freight_ap    AS glacct_id_freight_ap,'
      '  glap.acct                 AS glacct_acct_ap,'
      '  f.carrier_phone           AS carrier_phone,'
      '  f.transit_on_weekend      AS transit_on_weekend,'
      '  f.service_code            AS service_code,'
      '  f.load_time               AS load_time,'
      '  f.eplant_id               AS eplant_id,'
      '  e.name                    AS eplant_name,'
      '  f.comment1                AS comment1,'
      '  f.pk_hide                 AS pk_hide,'
      '  f.vendor_id               AS vendor_id,'
      '  f.subject_to_freight_rev  AS subject_to_freight_rev,'
      '  fcl.id                    AS freight_carrier_link_id,'
      '  fc.id                     AS freight_carrier_id,'
      '  fc.type                   AS freight_carrier_type,'
      '  vfct.carrier              AS web_service_provider,'
      '  vfsc.carrier              AS freight_service_carrier'
      'FROM freight f'
      'LEFT OUTER JOIN eplant e'
      'ON f.eplant_id = e.id'
      'LEFT OUTER JOIN glacct glap'
      'ON f.glacct_id_freight_ap = glap.id'
      'LEFT OUTER JOIN glacct glf'
      'ON f.glacct_id_freight = glf.id'
      'LEFT OUTER JOIN freight_carrier_link fcl'
      'ON fcl.freight_id = f.id'
      'LEFT OUTER JOIN freight_carrier fc'
      'ON fc.id = fcl.carrier_id'
      'LEFT OUTER JOIN v_freight_carrier_type vfct'
      'ON fc.type = vfct.freight_carrier_type'
      'LEFT OUTER JOIN v_freight_service_carrier vfsc'
      
        'ON fcl.v_freight_service_carrier_id                      = vfsc.' +
        'id'
      'WHERE iqms.misc.eplant_filter_include_nulls(f.eplant_id) = 1')
    Left = 40
    Top = 24
    object QryFreightID: TBCDField
      DisplayWidth = 7
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryFreightDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 38
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 60
    end
    object QryFreightGLACCT_ID_FREIGHT: TBCDField
      DisplayWidth = 21
      FieldName = 'GLACCT_ID_FREIGHT'
      Origin = 'GLACCT_ID_FREIGHT'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryFreightGL_ACCT_FREIGHT: TStringField
      DisplayLabel = 'GL Account #'
      DisplayWidth = 19
      FieldKind = fkLookup
      FieldName = 'GLACCT_ACCT_FREIGHT'
      LookupDataSet = QryGLACCT
      LookupKeyFields = 'ID'
      LookupResultField = 'ACCT'
      KeyFields = 'GLACCT_ID_FREIGHT'
      Size = 50
      Lookup = True
    end
    object QryFreightSCAC_IATA_CODE: TStringField
      DisplayLabel = 'SCAC IATA'
      DisplayWidth = 15
      FieldName = 'SCAC_IATA_CODE'
      Origin = 'SCAC_IATA_CODE'
      FixedChar = True
      Size = 17
    end
    object QryFreightCODE_QUALIFIER: TStringField
      DisplayLabel = 'Code Qualifier'
      DisplayWidth = 17
      FieldName = 'CODE_QUALIFIER'
      Origin = 'CODE_QUALIFIER'
      Size = 6
    end
    object QryFreightTRANSPORT_CODE: TStringField
      DisplayLabel = 'Transportation Method Code'
      DisplayWidth = 30
      FieldName = 'TRANSPORT_CODE'
      Origin = 'TRANSPORT_CODE'
      Size = 6
    end
    object QryFreightEQUIP_OWNERS_CODE: TStringField
      DisplayLabel = 'Equipment Owners Code'
      DisplayWidth = 31
      FieldName = 'EQUIP_OWNERS_CODE'
      Origin = 'EQUIP_OWNERS_CODE'
      Size = 4
    end
    object QryFreightGLACCT_ID_FREIGHT_AP: TBCDField
      DisplayWidth = 24
      FieldName = 'GLACCT_ID_FREIGHT_AP'
      Origin = 'GLACCT_ID_FREIGHT_AP'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryFreightGL_ACCT_AP: TStringField
      DisplayLabel = 'GL Account AP #'
      FieldKind = fkLookup
      FieldName = 'GLACCT_ACCT_AP'
      LookupDataSet = QryGLACCT
      LookupKeyFields = 'ID'
      LookupResultField = 'ACCT'
      KeyFields = 'GLACCT_ID_FREIGHT_AP'
      Size = 50
      Lookup = True
    end
    object QryFreightCARRIER_PHONE: TStringField
      DisplayLabel = 'Carrier Telephone #'
      DisplayWidth = 25
      FieldName = 'CARRIER_PHONE'
      Origin = 'CARRIER_PHONE'
      Size = 25
    end
    object QryFreightSERVICE_CODE: TStringField
      DisplayWidth = 27
      FieldName = 'SERVICE_CODE'
      Origin = 'SERVICE_CODE'
      Visible = False
      Size = 50
    end
    object QryFreightLOAD_TIME: TBCDField
      DisplayLabel = 'Default Load Time'
      DisplayWidth = 22
      FieldName = 'LOAD_TIME'
      Origin = 'LOAD_TIME'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryFreightEPLANT_ID: TBCDField
      DisplayWidth = 19
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryFreightEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      FieldKind = fkLookup
      FieldName = 'EPLANT_NAME'
      LookupDataSet = QryEPLANT
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'EPLANT_ID'
      Size = 30
      Lookup = True
    end
    object QryFreightCOMMENT1: TStringField
      DisplayLabel = 'Comment'
      DisplayWidth = 31
      FieldName = 'COMMENT1'
      Origin = 'COMMENT1'
      Size = 50
    end
    object QryFreightVENDOR_ID: TBCDField
      DisplayLabel = 'Vendor'
      DisplayWidth = 26
      FieldName = 'VENDOR_ID'
      Origin = 'VENDOR_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryFreightSUBJECT_TO_FREIGHT_REV: TStringField
      DisplayWidth = 32
      FieldName = 'SUBJECT_TO_FREIGHT_REV'
      Origin = 'SUBJECT_TO_FREIGHT_REV'
      Visible = False
      Size = 1
    end
    object QryFreightFREIGHT_CARRIER_LINK_ID: TBCDField
      DisplayWidth = 32
      FieldName = 'FREIGHT_CARRIER_LINK_ID'
      Origin = 'FREIGHT_CARRIER_LINK_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryFreightFREIGHT_CARRIER_ID: TBCDField
      DisplayWidth = 25
      FieldName = 'FREIGHT_CARRIER_ID'
      Origin = 'FREIGHT_CARRIER_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryFreightFREIGHT_CARRIER_TYPE: TBCDField
      DisplayWidth = 28
      FieldName = 'FREIGHT_CARRIER_TYPE'
      Origin = 'FREIGHT_CARRIER_TYPE'
      Visible = False
      Precision = 3
      Size = 0
    end
    object QryFreightWEB_SERVICE_PROVIDER: TStringField
      DisplayLabel = 'Web Service Provider'
      DisplayWidth = 28
      FieldName = 'WEB_SERVICE_PROVIDER'
      Origin = 'WEB_SERVICE_PROVIDER'
      Size = 33
    end
    object QryFreightFREIGHT_SERVICE_CARRIER: TStringField
      DisplayLabel = 'Web Service Carrier'
      DisplayWidth = 28
      FieldName = 'FREIGHT_SERVICE_CARRIER'
      Origin = 'FREIGHT_SERVICE_CARRIER'
      Size = 37
    end
    object QryFreightVendor: TStringField
      FieldKind = fkLookup
      FieldName = 'Vendor'
      LookupDataSet = QryVendor
      LookupKeyFields = 'ID'
      LookupResultField = 'COMPANY'
      KeyFields = 'VENDOR_ID'
      Size = 60
      Lookup = True
    end
    object QryFreightTRANSIT_ON_WEEKEND: TStringField
      DisplayLabel = 'Transit on Weekends'
      DisplayWidth = 26
      FieldName = 'TRANSIT_ON_WEEKEND'
      Origin = 'TRANSIT_ON_WEEKEND'
      FixedChar = True
      Size = 1
    end
    object QryFreightPK_HIDE: TStringField
      DisplayLabel = 'Inactive'
      DisplayWidth = 12
      FieldName = 'PK_HIDE'
      Origin = 'PK_HIDE'
      Size = 1
    end
  end
  object QryGLACCT: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select * from glacct')
    Left = 120
    Top = 24
    object QryGLACCTID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
    object QryGLACCTACCT: TStringField
      DisplayLabel = 'GL Account'
      FieldName = 'ACCT'
      Origin = 'ACCT'
      Required = True
      Size = 50
    end
    object QryGLACCTDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 50
    end
    object QryGLACCTTYPE: TStringField
      DisplayLabel = 'Type'
      FieldName = 'TYPE'
      Origin = '"TYPE"'
      Size = 25
    end
    object QryGLACCTGL_SUBACCT_TYPE_ID: TBCDField
      FieldName = 'GL_SUBACCT_TYPE_ID'
      Origin = 'GL_SUBACCT_TYPE_ID'
      Precision = 15
      Size = 0
    end
    object QryGLACCTMAJORTYPE: TStringField
      FieldName = 'MAJORTYPE'
      Origin = 'MAJORTYPE'
      Size = 35
    end
    object QryGLACCTECODE: TStringField
      FieldName = 'ECODE'
      Origin = 'ECODE'
      Size = 10
    end
    object QryGLACCTEID: TBCDField
      FieldName = 'EID'
      Origin = 'EID'
      Precision = 15
      Size = 0
    end
    object QryGLACCTEDATE_TIME: TDateTimeField
      FieldName = 'EDATE_TIME'
      Origin = 'EDATE_TIME'
    end
    object QryGLACCTECOPY: TStringField
      FieldName = 'ECOPY'
      Origin = 'ECOPY'
      FixedChar = True
      Size = 1
    end
    object QryGLACCTOLD_SPOT_RATE: TFMTBCDField
      FieldName = 'OLD_SPOT_RATE'
      Origin = 'OLD_SPOT_RATE'
      Precision = 12
      Size = 6
    end
    object QryGLACCTNEW_SPOT_RATE: TFMTBCDField
      FieldName = 'NEW_SPOT_RATE'
      Origin = 'NEW_SPOT_RATE'
      Precision = 12
      Size = 6
    end
    object QryGLACCTFX_ACCT_ID: TBCDField
      FieldName = 'FX_ACCT_ID'
      Origin = 'FX_ACCT_ID'
      Precision = 15
      Size = 0
    end
    object QryGLACCTFX_OFFSET_ACCT_ID: TBCDField
      FieldName = 'FX_OFFSET_ACCT_ID'
      Origin = 'FX_OFFSET_ACCT_ID'
      Precision = 15
      Size = 0
    end
    object QryGLACCTEEXCLUDE: TStringField
      FieldName = 'EEXCLUDE'
      Origin = 'EEXCLUDE'
      FixedChar = True
      Size = 1
    end
    object QryGLACCTEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Precision = 15
      Size = 0
    end
    object QryGLACCTPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'PK_HIDE'
      FixedChar = True
      Size = 1
    end
    object QryGLACCTPOSTED_IN_FRX: TStringField
      FieldName = 'POSTED_IN_FRX'
      Origin = 'POSTED_IN_FRX'
      FixedChar = True
      Size = 1
    end
    object QryGLACCTFX_GAIN_ACCT_ID: TBCDField
      FieldName = 'FX_GAIN_ACCT_ID'
      Origin = 'FX_GAIN_ACCT_ID'
      Precision = 15
      Size = 0
    end
    object QryGLACCTGL_HIDE: TStringField
      FieldName = 'GL_HIDE'
      Origin = 'GL_HIDE'
      FixedChar = True
      Size = 1
    end
    object QryGLACCTAP_HIDE: TStringField
      FieldName = 'AP_HIDE'
      Origin = 'AP_HIDE'
      FixedChar = True
      Size = 1
    end
    object QryGLACCTAR_HIDE: TStringField
      FieldName = 'AR_HIDE'
      Origin = 'AR_HIDE'
      FixedChar = True
      Size = 1
    end
    object QryGLACCTCORVU_ACCT_TYPE: TStringField
      FieldName = 'CORVU_ACCT_TYPE'
      Origin = 'CORVU_ACCT_TYPE'
      Size = 30
    end
    object QryGLACCTCOST_SOURCE_RQD: TStringField
      FieldName = 'COST_SOURCE_RQD'
      Origin = 'COST_SOURCE_RQD'
      Size = 1
    end
    object QryGLACCTGROUP_CODE_COUNTRY: TStringField
      FieldName = 'GROUP_CODE_COUNTRY'
      Origin = 'GROUP_CODE_COUNTRY'
      Size = 100
    end
    object QryGLACCTGROUP_CODE: TStringField
      FieldName = 'GROUP_CODE'
      Origin = 'GROUP_CODE'
      Size = 50
    end
  end
  object dsGLACCT: TDataSource
    DataSet = QryGLACCT
    Left = 120
    Top = 72
  end
  object dsEPLANT: TDataSource
    DataSet = QryEPLANT
    Left = 192
    Top = 72
  end
  object QryEPLANT: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'select id, name, address1, address2, city, state, zip, country, ' +
        'phone, fax, email, company from eplant')
    Left = 192
    Top = 24
    object QryEPLANTID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
    object QryEPLANTNAME: TStringField
      FieldName = 'NAME'
      Origin = 'NAME'
      Required = True
      Size = 30
    end
    object QryEPLANTADDRESS1: TStringField
      FieldName = 'ADDRESS1'
      Origin = 'ADDRESS1'
      Size = 60
    end
    object QryEPLANTADDRESS2: TStringField
      FieldName = 'ADDRESS2'
      Origin = 'ADDRESS2'
      Size = 60
    end
    object QryEPLANTCITY: TStringField
      FieldName = 'CITY'
      Origin = 'CITY'
      Size = 30
    end
    object QryEPLANTSTATE: TStringField
      FieldName = 'STATE'
      Origin = 'STATE'
    end
    object QryEPLANTZIP: TStringField
      FieldName = 'ZIP'
      Origin = 'ZIP'
      Size = 10
    end
    object QryEPLANTCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Origin = 'COUNTRY'
      Size = 100
    end
    object QryEPLANTPHONE: TStringField
      FieldName = 'PHONE'
      Origin = 'PHONE'
      Size = 25
    end
    object QryEPLANTFAX: TStringField
      FieldName = 'FAX'
      Origin = 'FAX'
      Size = 25
    end
    object QryEPLANTEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 250
    end
    object QryEPLANTCOMPANY: TStringField
      FieldName = 'COMPANY'
      Origin = 'COMPANY'
      Size = 60
    end
  end
  object QryVendor: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'Select id,'
      '       vendorno,'
      '       company,'
      '       addr1,'
      '       addr2,'
      '       city,'
      '       state,'
      '       zip,'
      '       currency_id,'
      '       pk_hide  '
      '  from vendor ')
    Left = 256
    Top = 24
    object QryVendorID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
      Precision = 15
      Size = 0
    end
    object QryVendorVENDORNO: TStringField
      FieldName = 'VENDORNO'
      Origin = 'VENDORNO'
      Required = True
      FixedChar = True
      Size = 10
    end
    object QryVendorCOMPANY: TStringField
      FieldName = 'COMPANY'
      Origin = 'COMPANY'
      Size = 60
    end
    object QryVendorADDR1: TStringField
      FieldName = 'ADDR1'
      Origin = 'ADDR1'
      Size = 60
    end
    object QryVendorADDR2: TStringField
      FieldName = 'ADDR2'
      Origin = 'ADDR2'
      Size = 60
    end
    object QryVendorCITY: TStringField
      FieldName = 'CITY'
      Origin = 'CITY'
      FixedChar = True
      Size = 30
    end
    object QryVendorSTATE: TStringField
      FieldName = 'STATE'
      Origin = 'STATE'
    end
    object QryVendorZIP: TStringField
      FieldName = 'ZIP'
      Origin = 'ZIP'
      FixedChar = True
      Size = 10
    end
    object QryVendorCURRENCY_ID: TBCDField
      FieldName = 'CURRENCY_ID'
      Origin = 'CURRENCY_ID'
      Precision = 15
      Size = 0
    end
    object QryVendorPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'PK_HIDE'
      FixedChar = True
      Size = 1
    end
  end
  object dsVendor: TDataSource
    DataSet = QryVendor
    Left = 256
    Top = 72
  end
  object QryWebServiceCarrier: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT fc.id                AS freight_carrier_id,'
      '  vfct.freight_carrier_type AS freight_carrier_type,'
      '  vfsc.id                   AS v_freight_service_carrier_id,'
      '  vfct.carrier              AS web_service_provider,'
      '  vfsc.carrier              AS freight_service_carrier'
      'FROM freight_carrier fc'
      'JOIN v_freight_carrier_type vfct'
      'ON vfct.freight_carrier_type = fc.type'
      'JOIN v_freight_service_carrier vfsc'
      'ON vfsc.freight_carrier_type = vfct.freight_carrier_type')
    Left = 352
    Top = 24
    object QryWebServiceCarrierFREIGHT_CARRIER_ID: TBCDField
      FieldName = 'FREIGHT_CARRIER_ID'
      Origin = 'FREIGHT_CARRIER_ID'
      Required = True
      Precision = 15
      Size = 0
    end
    object QryWebServiceCarrierFREIGHT_CARRIER_TYPE: TFMTBCDField
      FieldName = 'FREIGHT_CARRIER_TYPE'
      Origin = 'FREIGHT_CARRIER_TYPE'
      Precision = 38
      Size = 38
    end
    object QryWebServiceCarrierV_FREIGHT_SERVICE_CARRIER_ID: TFMTBCDField
      FieldName = 'V_FREIGHT_SERVICE_CARRIER_ID'
      Origin = 'V_FREIGHT_SERVICE_CARRIER_ID'
      Precision = 38
      Size = 38
    end
    object QryWebServiceCarrierWEB_SERVICE_PROVIDER: TStringField
      FieldName = 'WEB_SERVICE_PROVIDER'
      Origin = 'WEB_SERVICE_PROVIDER'
      Size = 33
    end
    object QryWebServiceCarrierFREIGHT_SERVICE_CARRIER: TStringField
      FieldName = 'FREIGHT_SERVICE_CARRIER'
      Origin = 'FREIGHT_SERVICE_CARRIER'
      Size = 37
    end
  end
  object dsWebServiceCarrier: TDataSource
    DataSet = QryWebServiceCarrier
    Left = 352
    Top = 72
  end
end
