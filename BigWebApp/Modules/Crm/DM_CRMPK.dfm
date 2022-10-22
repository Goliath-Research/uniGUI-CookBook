object CRMPK_DM: TCRMPK_DM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 479
  Width = 741
  object PkArcusto: TIQWebHpick
    Tag = 1
    BeforeOpen = AssignProspectFilter
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'SELECT a.id AS id, a.custno AS custno, a.company AS company, a.a' +
        'ddr1 AS addr1,'
      '       a.addr2 AS addr2, a.city AS city, a.state AS state,'
      
        '       a.country AS country, a.zip AS zip, a.phone_number AS pho' +
        'ne_number,'
      '       a.status_id AS status_id, a.status_date AS status_date,'
      
        '       a.salesperson AS salesperson, a.crm_prospect AS crm_prosp' +
        'ect,'
      '       a.pk_hide AS pk_hide'
      '  FROM v_crm_arcusto a'
      ' WHERE (:BY_CRM_PROSPECT = 0 OR'
      
        '        :BY_CRM_PROSPECT = 1 AND NVL(crm_prospect, '#39'N'#39') = :CRM_P' +
        'ROSPECT)'
      ''
      '     -- HPICK_EMPTY_DATASET_FILTER_START'
      '     AND 1 < 0'
      '     -- HPICK_EMPTY_DATASET_FILTER_END'
      '     '
      '   -- HPICK_PROPAGATE_SORT_START'
      '   -- do not remove these comments'
      '   -- HPICK_PROPAGATE_SORT_END')
    OnIQModify = PkArcustoIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 32
    Top = 8
    ParamData = <
      item
        Name = 'BY_CRM_PROSPECT'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'CRM_PROSPECT'
        DataType = ftString
        ParamType = ptInput
      end>
    object PkArcustoCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Origin = 'A.CUSTNO'
      Size = 10
    end
    object PkArcustoCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 10
      FieldName = 'COMPANY'
      Origin = 'A.COMPANY'
      Size = 60
    end
    object PkArcustoADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 10
      FieldName = 'ADDR1'
      Origin = 'A.ADDR1'
      Size = 60
    end
    object PkArcustoADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 10
      FieldName = 'ADDR2'
      Origin = 'A.ADDR2'
      Size = 60
    end
    object PkArcustoCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 10
      FieldName = 'CITY'
      Origin = 'A.CITY'
      Size = 30
    end
    object PkArcustoSTATE: TStringField
      DisplayLabel = 'State'
      DisplayWidth = 10
      FieldName = 'STATE'
      Origin = 'A.STATE'
    end
    object PkArcustoCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 10
      FieldName = 'COUNTRY'
      Origin = 'A.COUNTRY'
      Size = 100
    end
    object PkArcustoZIP: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 10
      FieldName = 'ZIP'
      Origin = 'A.ZIP'
      Size = 10
    end
    object PkArcustoPHONE_NUMBER: TStringField
      DisplayLabel = 'Telephone #'
      DisplayWidth = 10
      FieldName = 'PHONE_NUMBER'
      Origin = 'A.PHONE_NUMBER'
      Size = 25
    end
    object PkArcustoID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'A.ID'
      Visible = False
      Size = 0
    end
    object PkArcustoSTATUS_ID: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_ID'
      Origin = 'A.STATUS_ID'
    end
    object PkArcustoSTATUS_DATE: TDateTimeField
      DisplayLabel = 'Status Date'
      FieldName = 'STATUS_DATE'
      Origin = 'A.STATUS_DATE'
    end
    object PkArcustoCRM_PROSPECT: TStringField
      DisplayLabel = 'CRM Prospect?'
      FieldName = 'CRM_PROSPECT'
      Origin = 'A.CRM_PROSPECT'
      Size = 1
    end
    object PkArcustoPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'A.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object PkArcustoSALESPERSON: TStringField
      DisplayLabel = 'Salesperson(s)'
      DisplayWidth = 12
      FieldName = 'SALESPERSON'
      Origin = 'a.salesperson'
      Size = 100
    end
  end
  object PkVendor: TIQWebHpick
    Tag = 1
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'SELECT id AS id, vendorno AS vendorno, company AS company, attn ' +
        'AS attn,'
      
        '       addr1 AS addr1, addr2 AS addr2, addr3 AS addr3, city AS c' +
        'ity,'
      
        '       state AS state, zip AS zip, country AS country, pk_hide A' +
        'S pk_hide'
      '  FROM v_vendor'
      ' WHERE (1 = 1)'
      '     -- HPICK_EMPTY_DATASET_FILTER_START'
      '     AND 1 < 0'
      '     -- HPICK_EMPTY_DATASET_FILTER_END'
      '     '
      '   -- HPICK_PROPAGATE_SORT_START'
      '   -- do not remove these comments'
      '   -- HPICK_PROPAGATE_SORT_END'
      ' ')
    OnIQModify = PkVendorIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 136
    Top = 8
    object PkVendorVENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      DisplayWidth = 10
      FieldName = 'VENDORNO'
      Origin = 'v_vendor.vendorno'
      Size = 10
    end
    object PkVendorCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 10
      FieldName = 'COMPANY'
      Origin = 'v_vendor.company'
      Size = 60
    end
    object PkVendorADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 22
      FieldName = 'ADDR1'
      Origin = 'v_vendor.addr1'
      Size = 60
    end
    object PkVendorADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 22
      FieldName = 'ADDR2'
      Origin = 'v_vendor.addr2'
      Size = 60
    end
    object PkVendorADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 22
      FieldName = 'ADDR3'
      Origin = 'v_vendor.addr3'
      Size = 60
    end
    object PkVendorCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 10
      FieldName = 'CITY'
      Origin = 'v_vendor.city'
      Size = 30
    end
    object PkVendorSTATE: TStringField
      DisplayLabel = 'State or Region'
      DisplayWidth = 10
      FieldName = 'STATE'
      Origin = 'v_vendor.state'
    end
    object PkVendorZIP: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 10
      FieldName = 'ZIP'
      Origin = 'v_vendor.zip'
      Size = 10
    end
    object PkVendorCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 22
      FieldName = 'COUNTRY'
      Origin = 'v_vendor.country'
      FixedChar = True
      Size = 100
    end
    object PkVendorID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'v_vendor.id'
      Visible = False
      Size = 0
    end
    object PkVendorPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'v_vendor.pk_hide'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object PkPartner: TIQWebHpick
    Tag = 1
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'SELECT id, partnerno, company, country, prime_contact, addr1, ad' +
        'dr2, addr3,'
      '       city, state, zip, partner_group, pk_hide'
      '  FROM partner'
      ' WHERE (1 = 1)'
      '     -- HPICK_EMPTY_DATASET_FILTER_START'
      '     AND 1 < 0'
      '     -- HPICK_EMPTY_DATASET_FILTER_END'
      '     '
      '   -- HPICK_PROPAGATE_SORT_START'
      '   -- do not remove these comments'
      '   -- HPICK_PROPAGATE_SORT_END'
      ' ')
    OnIQModify = PkPartnerIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 240
    Top = 8
    object PkPartnerID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'PARTNER.ID'
      Visible = False
      Size = 0
    end
    object PkPartnerPARTNERNO: TStringField
      DisplayLabel = 'Partner #'
      DisplayWidth = 10
      FieldName = 'PARTNERNO'
      Origin = 'PARTNER.PARTNERNO'
      FixedChar = True
      Size = 10
    end
    object PkPartnerCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 10
      FieldName = 'COMPANY'
      Origin = 'PARTNER.COMPANY'
      FixedChar = True
      Size = 60
    end
    object PkPartnerPRIME_CONTACT: TStringField
      DisplayLabel = 'Primary Contact'
      DisplayWidth = 10
      FieldName = 'PRIME_CONTACT'
      Origin = 'PARTNER.PRIME_CONTACT'
      FixedChar = True
      Size = 30
    end
    object PkPartnerADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 10
      FieldName = 'ADDR1'
      Origin = 'PARTNER.ADDR1'
      FixedChar = True
      Size = 60
    end
    object PkPartnerADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 10
      FieldName = 'ADDR2'
      Origin = 'PARTNER.ADDR2'
      FixedChar = True
      Size = 60
    end
    object PkPartnerADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 10
      FieldName = 'ADDR3'
      Origin = 'PARTNER.ADDR3'
      FixedChar = True
      Size = 60
    end
    object PkPartnerCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 10
      FieldName = 'CITY'
      Origin = 'PARTNER.CITY'
      FixedChar = True
      Size = 30
    end
    object PkPartnerSTATE: TStringField
      DisplayLabel = 'State or Region'
      DisplayWidth = 10
      FieldName = 'STATE'
      Origin = 'PARTNER.STATE'
      FixedChar = True
    end
    object PkPartnerZIP: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 10
      FieldName = 'ZIP'
      Origin = 'PARTNER.ZIP'
      FixedChar = True
      Size = 10
    end
    object PkPartnerCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 10
      FieldName = 'COUNTRY'
      Origin = 'PARTNER.COUNTRY'
      FixedChar = True
      Size = 100
    end
    object PkPartnerPARTNER_GROUP: TStringField
      DisplayLabel = 'Partner Group'
      DisplayWidth = 10
      FieldName = 'PARTNER_GROUP'
      Origin = 'PARTNER.PARTNER_GROUP'
      FixedChar = True
      Size = 10
    end
    object PkPartnerPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'PARTNER.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object PkEmployee: TIQWebHpick
    Tag = 1
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT pr_emp_id AS id, '
      '       empno AS empno, '
      '       first_name AS first_name,'
      '       middle_name AS middle_name, '
      '       last_name AS last_name,'
      '       display_name AS display_name, '
      '       email AS email, '
      '       user_name AS user_name,'
      '       eplant_id AS eplant_id, '
      '       eplant_name AS eplant_name, '
      '       pk_hide AS pk_hide'
      '  FROM v_empuser'
      ' WHERE NVL(used_crm, '#39'N'#39') = '#39'Y'#39)
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 344
    Top = 8
    object PkEmployeeID: TFloatField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'e.id'
      Visible = False
    end
    object PkEmployeeEMPNO: TStringField
      DisplayLabel = 'Employee #'
      DisplayWidth = 10
      FieldName = 'EMPNO'
      Origin = 'e.empno'
      Size = 25
    end
    object PkEmployeeFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 10
      FieldName = 'FIRST_NAME'
      Origin = 'e.first_name'
      Size = 30
    end
    object PkEmployeeMIDDLE_NAME: TStringField
      DisplayLabel = 'Middle Name'
      DisplayWidth = 10
      FieldName = 'MIDDLE_NAME'
      Origin = 'e.middle_name'
      Size = 30
    end
    object PkEmployeeLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 10
      FieldName = 'LAST_NAME'
      Origin = 'e.last_name'
      Size = 30
    end
    object PkEmployeeEMAIL: TStringField
      DisplayLabel = 'Email'
      DisplayWidth = 10
      FieldName = 'EMAIL'
      Origin = 'g.email'
      Size = 50
    end
    object PkEmployeeEPLANT_ID: TFloatField
      FieldName = 'EPLANT_ID'
      Origin = 'g.eplant_id'
      Visible = False
    end
    object PkEmployeeUSER_NAME: TStringField
      DisplayLabel = 'Login Name'
      DisplayWidth = 10
      FieldName = 'USER_NAME'
      Origin = 'g.user_name'
      Size = 35
    end
    object PkEmployeeEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 10
      FieldName = 'EPLANT_NAME'
      Origin = 'ep.name'
      Size = 30
    end
    object PkEmployeeDISPLAY_NAME: TStringField
      FieldName = 'DISPLAY_NAME'
      Origin = 'V_EMPUSER.DISPLAY_NAME'
      Visible = False
      Size = 61
    end
    object PkEmployeePK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.V_EMPUSER.PK_HIDE'
      Visible = False
      Size = 1
    end
  end
  object PkArcustoContacts: TIQWebHpick
    Tag = 1
    BeforeOpen = PkArcustoContactsBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'SELECT a.id AS id, a.arcusto_id AS arcusto_id, a.salutation AS s' +
        'alutation,'
      
        '       a.first_name AS first_name, a.last_name AS last_name, a.t' +
        'itle AS title,'
      '       a.phone_number AS phone_number, a.ext AS ext,'
      
        '       a.fax_number AS fax_number, a.email AS email, a.pager AS ' +
        'pager,'
      
        '       a.mobile AS mobile, a.custno AS custno, a.company AS comp' +
        'any,'
      
        '       a.addr1 AS addr1, a.addr2 AS addr2, a.addr3 AS addr3, a.c' +
        'ity AS city,'
      '       a.state AS state, a.zip AS zip, a.country AS country,'
      '       a.department AS department, a.salesperson AS salesperson,'
      '       a.pk_hide AS pk_hide, a.crm_prospect AS crm_prospect,'
      '       a.email_hide AS email_hide,'
      
        '       a.cuser1 AS cuser1, a.cuser2 AS cuser2, a.cuser3 AS cuser' +
        '3,'
      
        '       a.cuser4 AS cuser4, a.cuser5 AS cuser5, a.cuser6 AS cuser' +
        '6,'
      
        '       a.cuser7 AS cuser7, a.cuser8 AS cuser8, a.cuser9 AS cuser' +
        '9,'
      
        '       a.nuser1 AS nuser1, a.nuser2 AS nuser2, a.nuser3 AS nuser' +
        '3,'
      
        '       a.nuser4 AS nuser4, a.nuser5 AS nuser5, a.nuser6 AS nuser' +
        '6,'
      
        '       a.nuser7 AS nuser7, a.nuser8 AS nuser8, a.nuser9 AS nuser' +
        '9,'
      
        '       a.use_usa_mask AS use_usa_mask, a.default_contact AS defa' +
        'ult_contact'
      'FROM v_crm_contact a'
      'WHERE (:BY_MASTER_ID = 0 OR'
      '       :BY_MASTER_ID = 1 AND a.arcusto_id = :MASTER_ID) AND'
      '       (:BY_CRM_PROSPECT = 0 OR'
      
        '        :BY_CRM_PROSPECT = 1 AND NVL(crm_prospect, '#39'N'#39') = :CRM_P' +
        'ROSPECT)'
      '')
    OnIQModify = PkArcustoContactsIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 32
    Top = 72
    ParamData = <
      item
        Name = 'BY_MASTER_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'master_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'BY_CRM_PROSPECT'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'CRM_PROSPECT'
        DataType = ftString
        ParamType = ptInput
      end>
    object PkArcustoContactsID: TBCDField
      FieldName = 'ID'
      Origin = 'a.id'
      Visible = False
      Size = 0
    end
    object PkArcustoContactsARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Origin = 'a.arcusto_id'
      Visible = False
      Size = 0
    end
    object PkArcustoContactsSALUTATION: TStringField
      DisplayLabel = 'Salutation'
      FieldName = 'SALUTATION'
      Origin = 'a.salutation'
      Size = 5
    end
    object PkArcustoContactsLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 10
      FieldName = 'LAST_NAME'
      Origin = 'a.last_name'
      Size = 30
    end
    object PkArcustoContactsFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 10
      FieldName = 'FIRST_NAME'
      Origin = 'a.first_name'
      Size = 30
    end
    object PkArcustoContactsTITLE: TStringField
      DisplayLabel = 'Title'
      DisplayWidth = 10
      FieldName = 'TITLE'
      Origin = 'a.title'
      Size = 60
    end
    object PkArcustoContactsPHONE_NUMBER: TStringField
      DisplayLabel = 'Telephone #'
      DisplayWidth = 10
      FieldName = 'PHONE_NUMBER'
      Origin = 'a.phone_number'
      Size = 25
    end
    object PkArcustoContactsEXT: TStringField
      DisplayLabel = 'Extension'
      DisplayWidth = 10
      FieldName = 'EXT'
      Origin = 'a.ext'
      Size = 5
    end
    object PkArcustoContactsFAX_NUMBER: TStringField
      DisplayLabel = 'Fax #'
      DisplayWidth = 10
      FieldName = 'FAX_NUMBER'
      Origin = 'a.fax_number'
      Size = 25
    end
    object PkArcustoContactsEMAIL: TStringField
      DisplayLabel = 'Email'
      DisplayWidth = 10
      FieldName = 'EMAIL'
      Origin = 'a.email'
      Size = 250
    end
    object PkArcustoContactsPAGER: TStringField
      DisplayLabel = 'Pager'
      DisplayWidth = 10
      FieldName = 'PAGER'
      Origin = 'a.pager'
      Size = 25
    end
    object PkArcustoContactsMOBILE: TStringField
      DisplayLabel = 'Cell Telephone'
      DisplayWidth = 18
      FieldName = 'MOBILE'
      Origin = 'a.mobile'
      Size = 25
    end
    object PkArcustoContactsCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      FieldName = 'CUSTNO'
      Origin = 'a.custno'
      FixedChar = True
      Size = 10
    end
    object PkArcustoContactsCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 20
      FieldName = 'COMPANY'
      Origin = 'a.company'
      FixedChar = True
      Size = 60
    end
    object PkArcustoContactsADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 15
      FieldName = 'ADDR1'
      Origin = 'a.addr1'
      FixedChar = True
      Size = 60
    end
    object PkArcustoContactsADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 12
      FieldName = 'ADDR2'
      Origin = 'a.addr2'
      Size = 60
    end
    object PkArcustoContactsADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 12
      FieldName = 'ADDR3'
      Origin = 'a.addr3'
      Size = 60
    end
    object PkArcustoContactsCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 10
      FieldName = 'CITY'
      Origin = 'a.city'
      FixedChar = True
      Size = 30
    end
    object PkArcustoContactsSTATE: TStringField
      DisplayLabel = 'State'
      FieldName = 'STATE'
      Origin = 'a.state'
      FixedChar = True
    end
    object PkArcustoContactsZIP: TStringField
      DisplayLabel = 'Postal Code'
      FieldName = 'ZIP'
      Origin = 'a.zip'
      FixedChar = True
      Size = 10
    end
    object PkArcustoContactsCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 12
      FieldName = 'COUNTRY'
      Origin = 'a.country'
      Size = 100
    end
    object PkArcustoContactsSALESPERSON: TStringField
      DisplayLabel = 'Salesperson(s)'
      DisplayWidth = 12
      FieldName = 'SALESPERSON'
      Origin = 'a.salesperson'
      Size = 100
    end
    object PkArcustoContactsPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'a.pk_hide'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object PkArcustoContactsCRM_PROSPECT: TStringField
      DisplayLabel = 'CRM Prospect?'
      FieldName = 'CRM_PROSPECT'
      Origin = 'a.crm_prospect'
      Size = 1
    end
  end
  object PkVendorContacts: TIQWebHpick
    Tag = 1
    BeforeOpen = PkVendorContactsBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'SELECT a.id AS id, a.vendor_id AS vendor_id, a.salutation AS sal' +
        'utation,'
      
        '       a.last_name AS last_name, a.first_name AS first_name, a.t' +
        'itle AS title,'
      
        '       a.vendorno AS vendorno, a.company AS company, a.addr1 AS ' +
        'addr1,'
      
        '       a.addr2 AS addr2, a.addr3 AS addr3, a.city AS city, a.sta' +
        'te AS state,'
      
        '       a.zip AS zip, a.country AS country, a.phone_number AS pho' +
        'ne_number,'
      
        '       a.ext AS ext, a.fax_number AS fax_number, a.email AS emai' +
        'l,'
      '       a.pager AS pager, a.mobile AS mobile, a.cuser1 AS cuser1,'
      '       a.cuser2 AS cuser2, a.use_usa_mask AS use_usa_mask,'
      '       a.pk_hide AS pk_hide, a.email_hide AS email_hide'
      'FROM v_vendor_contact a'
      'WHERE (:BY_MASTER_ID = 0 OR'
      '       :BY_MASTER_ID = 1 AND a.vendor_id = :MASTER_ID)')
    OnIQModify = PkVendorContactsIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 136
    Top = 72
    ParamData = <
      item
        Name = 'BY_MASTER_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'master_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkVendorContactsID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'a.id'
      Visible = False
      Size = 0
    end
    object PkVendorContactsVENDOR_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'VENDOR_ID'
      Origin = 'a.vendor_id'
      Visible = False
      Size = 0
    end
    object PkVendorContactsSALUTATION: TStringField
      DisplayLabel = 'Salutation'
      DisplayWidth = 10
      FieldName = 'SALUTATION'
      Origin = 'a.salutation'
      FixedChar = True
      Size = 5
    end
    object PkVendorContactsLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 10
      FieldName = 'LAST_NAME'
      Origin = 'a.last_name'
      FixedChar = True
      Size = 30
    end
    object PkVendorContactsFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 10
      FieldName = 'FIRST_NAME'
      Origin = 'a.first_name'
      FixedChar = True
      Size = 30
    end
    object PkVendorContactsTITLE: TStringField
      DisplayLabel = 'Title'
      DisplayWidth = 10
      FieldName = 'TITLE'
      Origin = 'a.title'
      FixedChar = True
      Size = 60
    end
    object PkVendorContactsPHONE_NUMBER: TStringField
      DisplayLabel = 'Telephone #'
      DisplayWidth = 10
      FieldName = 'PHONE_NUMBER'
      Origin = 'a.phone_number'
      Size = 25
    end
    object PkVendorContactsEXT: TStringField
      DisplayLabel = 'Extension'
      DisplayWidth = 10
      FieldName = 'EXT'
      Origin = 'a.ext'
      FixedChar = True
      Size = 5
    end
    object PkVendorContactsFAX_NUMBER: TStringField
      DisplayLabel = 'Fax #'
      DisplayWidth = 10
      FieldName = 'FAX_NUMBER'
      Origin = 'a.fax_number'
      Size = 25
    end
    object PkVendorContactsEMAIL: TStringField
      DisplayLabel = 'Email'
      DisplayWidth = 10
      FieldName = 'EMAIL'
      Origin = 'a.email'
      FixedChar = True
      Size = 250
    end
    object PkVendorContactsPAGER: TStringField
      DisplayLabel = 'Pager #'
      DisplayWidth = 10
      FieldName = 'PAGER'
      Origin = 'a.pager'
      FixedChar = True
      Size = 25
    end
    object PkVendorContactsMOBILE: TStringField
      DisplayLabel = 'Cell Telephone'
      DisplayWidth = 18
      FieldName = 'MOBILE'
      Origin = 'a.mobile'
      Size = 25
    end
    object PkVendorContactsVENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      FieldName = 'VENDORNO'
      Origin = 'a.vendorno'
      FixedChar = True
      Size = 10
    end
    object PkVendorContactsCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 10
      FieldName = 'COMPANY'
      Origin = 'a.company'
      FixedChar = True
      Size = 60
    end
    object PkVendorContactsADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 12
      FieldName = 'ADDR1'
      Origin = 'a.addr1'
      FixedChar = True
      Size = 60
    end
    object PkVendorContactsADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 12
      FieldName = 'ADDR2'
      Origin = 'a.addr2'
      Size = 60
    end
    object PkVendorContactsADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 12
      FieldName = 'ADDR3'
      Origin = 'a.addr3'
      Size = 60
    end
    object PkVendorContactsCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 10
      FieldName = 'CITY'
      Origin = 'a.city'
      FixedChar = True
      Size = 30
    end
    object PkVendorContactsSTATE: TStringField
      DisplayLabel = 'State or Region'
      DisplayWidth = 10
      FieldName = 'STATE'
      Origin = 'a.state'
      FixedChar = True
    end
    object PkVendorContactsZIP: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 10
      FieldName = 'ZIP'
      Origin = 'a.zip'
      FixedChar = True
      Size = 10
    end
    object PkVendorContactsCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 12
      FieldName = 'COUNTRY'
      Origin = 'a.country'
      Size = 100
    end
    object PkVendorContactsPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'a.pk_hide'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object PkPartnerContacts: TIQWebHpick
    Tag = 1
    BeforeOpen = PkPartnerContactsBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'SELECT a.last_name AS last_name, a.first_name AS first_name, a.t' +
        'itle AS title,'
      '       a.phone_number AS phone_number, a.ext AS ext,'
      
        '       a.fax_number AS fax_number, a.email AS email, a.pager AS ' +
        'pager,'
      
        '       a.mobile AS mobile, a.partnerno AS partnerno, a.company A' +
        'S company,'
      
        '       a.addr1 AS addr1, a.addr2 AS addr2, a.addr3 AS addr3, a.c' +
        'ity AS city,'
      '       a.state AS state, a.zip AS zip, a.country AS country,'
      
        '       a.pk_hide AS pk_hide, a.email_hide AS email_hide, a.cuser' +
        '1 AS cuser1,'
      '       a.cuser2 AS cuser2, a.use_usa_mask AS use_usa_mask,'
      
        '       a.partner_id AS partner_id, a.salutation AS salutation, a' +
        '.id AS id'
      'FROM v_partner_contacts a'
      'WHERE (:BY_MASTER_ID = 0 OR'
      '       :BY_MASTER_ID = 1 AND a.partner_id = :MASTER_ID)')
    OnIQModify = PkPartnerContactsIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 240
    Top = 72
    ParamData = <
      item
        Name = 'BY_MASTER_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'master_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkPartnerContactsID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'a.id'
      Visible = False
      Size = 0
    end
    object PkPartnerContactsPARTNER_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PARTNER_ID'
      Origin = 'a.partner_id'
      Visible = False
      Size = 0
    end
    object PkPartnerContactsSALUTATION: TStringField
      DisplayLabel = 'Salutation'
      DisplayWidth = 10
      FieldName = 'SALUTATION'
      Origin = 'a.salutation'
      FixedChar = True
      Size = 5
    end
    object PkPartnerContactsLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 10
      FieldName = 'LAST_NAME'
      Origin = 'a.last_name'
      FixedChar = True
      Size = 30
    end
    object PkPartnerContactsFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 10
      FieldName = 'FIRST_NAME'
      Origin = 'a.first_name'
      FixedChar = True
      Size = 30
    end
    object PkPartnerContactsTITLE: TStringField
      DisplayLabel = 'Title'
      DisplayWidth = 10
      FieldName = 'TITLE'
      Origin = 'a.title'
      FixedChar = True
      Size = 60
    end
    object PkPartnerContactsPHONE_NUMBER: TStringField
      DisplayLabel = 'Telephone #'
      DisplayWidth = 10
      FieldName = 'PHONE_NUMBER'
      Origin = 'a.phone_number'
      Size = 25
    end
    object PkPartnerContactsEXT: TStringField
      DisplayLabel = 'Extension'
      DisplayWidth = 10
      FieldName = 'EXT'
      Origin = 'a.ext'
      FixedChar = True
      Size = 5
    end
    object PkPartnerContactsFAX_NUMBER: TStringField
      DisplayLabel = 'Fax #'
      DisplayWidth = 10
      FieldName = 'FAX_NUMBER'
      Origin = 'a.fax_number'
      Size = 25
    end
    object PkPartnerContactsEMAIL: TStringField
      DisplayLabel = 'Email'
      DisplayWidth = 10
      FieldName = 'EMAIL'
      Origin = 'a.email'
      FixedChar = True
      Size = 255
    end
    object PkPartnerContactsPAGER: TStringField
      DisplayLabel = 'Pager #'
      DisplayWidth = 10
      FieldName = 'PAGER'
      Origin = 'a.pager'
      Size = 25
    end
    object PkPartnerContactsMOBILE: TStringField
      DisplayLabel = 'Cell Telephone'
      DisplayWidth = 18
      FieldName = 'MOBILE'
      Origin = 'a.mobile'
      Size = 25
    end
    object PkPartnerContactsPARTNERNO: TStringField
      DisplayLabel = 'Partner #'
      FieldName = 'PARTNERNO'
      Origin = 'a.partnerno'
      FixedChar = True
      Size = 10
    end
    object PkPartnerContactsCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 10
      FieldName = 'COMPANY'
      Origin = 'a.company'
      FixedChar = True
      Size = 60
    end
    object PkPartnerContactsADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 10
      FieldName = 'ADDR1'
      Origin = 'a.addr1'
      FixedChar = True
      Size = 60
    end
    object PkPartnerContactsADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 12
      FieldName = 'ADDR2'
      Origin = 'a.addr2'
      Size = 60
    end
    object PkPartnerContactsADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 12
      FieldName = 'ADDR3'
      Origin = 'a.addr3'
      Size = 60
    end
    object PkPartnerContactsCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 10
      FieldName = 'CITY'
      Origin = 'a.city'
      FixedChar = True
      Size = 30
    end
    object PkPartnerContactsSTATE: TStringField
      DisplayLabel = 'State or Region'
      DisplayWidth = 10
      FieldName = 'STATE'
      Origin = 'a.state'
      FixedChar = True
    end
    object PkPartnerContactsZIP: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 10
      FieldName = 'ZIP'
      Origin = 'a.zip'
      FixedChar = True
      Size = 10
    end
    object PkPartnerContactsCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 12
      FieldName = 'COUNTRY'
      Origin = 'a.country'
      Size = 100
    end
    object PkPartnerContactsPK_HIDE: TStringField
      DisplayWidth = 10
      FieldName = 'PK_HIDE'
      Origin = 'a.pk_hide'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object PkGroups: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id, name, description from crm_group')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 32
    Top = 128
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
  object PkArinvt: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT a.id AS id, a.itemno AS itemno, a.descrip AS descrip,'
      '       a.descrip2 AS descrip2, a.class AS class, a.rev AS rev,'
      '       a.std_cost AS std_cost, a.config_code AS config_code,'
      '       a.pk_hide AS pk_hide, a.eplant_id AS eplant_id,'
      '       b.name AS eplant_name'
      '  FROM arinvt a, eplant b'
      ' WHERE b.id(+) = a.eplant_id AND'
      '       iqms.misc.eplant_filter(a.eplant_id) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    SubqueryModuleName = 'INVENTORY'
    SubqueryFieldName = 'a.id'
    Left = 136
    Top = 128
    object PkArinvtID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'A.ID'
      Visible = False
      Size = 0
    end
    object PkArinvtITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 10
      FieldName = 'ITEMNO'
      Origin = 'A.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object PkArinvtDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 10
      FieldName = 'DESCRIP'
      Origin = 'A.DESCRIP'
      Size = 100
    end
    object PkArinvtDESCRIP2: TStringField
      DisplayLabel = 'Extended Description'
      DisplayWidth = 10
      FieldName = 'DESCRIP2'
      Origin = 'A.DESCRIP2'
      Size = 100
    end
    object PkArinvtCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 10
      FieldName = 'CLASS'
      Origin = 'A.CLASS'
      FixedChar = True
      Size = 2
    end
    object PkArinvtREV: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 10
      FieldName = 'REV'
      Origin = 'A.REV'
      FixedChar = True
      Size = 15
    end
    object PkArinvtCONFIG_CODE: TStringField
      DisplayLabel = 'Config Code'
      DisplayWidth = 18
      FieldName = 'CONFIG_CODE'
      Origin = 'a.config_code'
      Size = 255
    end
    object PkArinvtEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 18
      FieldName = 'EPLANT_NAME'
      Origin = 'B.NAME'
      Size = 30
    end
    object PkArinvtEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'A.EPLANT_ID'
      Size = 0
    end
    object PkArinvtPK_HIDE: TStringField
      DisplayWidth = 10
      FieldName = 'PK_HIDE'
      Origin = 'A.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object PkArinvtSTD_COST: TFMTBCDField
      DisplayLabel = 'Standard Cost'
      FieldName = 'STD_COST'
      Origin = 'a.std_cost'
      Visible = False
      Size = 6
    end
  end
  object PkActivity: TIQWebHpick
    BeforeOpen = PkActivityBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'SELECT a.id AS id, a.startdate AS startdate, a.finishdate AS fin' +
        'ishdate,'
      '       a.subject AS subject, a.regarding255 AS regarding,'
      '       a.assignedto_login_name AS assignedto_login_name,'
      '       a.assignedto_display AS assignedto_display,'
      '       a.source_display AS source_display,'
      
        '       a.principle_source_disp AS principle_source_disp, a.compa' +
        'ny AS company,'
      
        '       a.customer_addr1 AS customer_addr1, a.customer_addr2 AS c' +
        'ustomer_addr2,'
      
        '       a.customer_addr3 AS customer_addr3, a.customer_city AS cu' +
        'stomer_city,'
      
        '       a.customer_state AS customer_state, a.customer_zip AS cus' +
        'tomer_zip,'
      '       a.principle_country AS principle_country,'
      '       a.customer_phone_number AS customer_phone_number,'
      '       a.customer_ext AS customer_ext,'
      '       a.customer_fax_number AS customer_fax_number,'
      '       a.first_name AS first_name, a.middle_name AS middle_name,'
      '       a.last_name AS last_name,'
      '       a.contact_title AS contact_title,'
      '       a.contact_phone_number AS contact_phone_number,'
      '       a.contact_ext AS contact_ext,'
      '       a.contact_fax_number AS contact_fax_number,'
      '       a.contact_email AS contact_email, a.user_id AS user_id,'
      
        '       a.created AS created, a.changed AS changed, a.changedby A' +
        'S changedby'
      'FROM v_crm_activity a'
      'WHERE a.type = :TYPE_INTEGER AND'
      ''
      '      (:ARCHIVED_SHOW_ALL = 1 OR'
      
        '       :ARCHIVED_SHOW_ALL = 0 AND NVL(a.archived, '#39'N'#39') = :ARCHIV' +
        'ED) AND'
      ''
      
        '      (:MY_CRM_TODAY = 0 AND iqms.iqcrm.assignedto_filter(a.assi' +
        'gnedto_login_name) = 1 OR'
      
        '       :MY_CRM_TODAY = 1 AND assignedto_login_name = iqms.misc.g' +
        'etusername ) AND'
      ''
      '      (:MY_CRM_TODAY = 1 OR'
      
        '       :MY_CRM_TODAY = 0 AND iqms.iqcrm.principle_filter(princip' +
        'le_source,'
      
        '        principle_source_id, contact_id, principle_crm_prospect)' +
        ' = 1) AND'
      ''
      '      (:BY_RANGE = 0 OR'
      '       :BY_RANGE = 1 AND'
      
        '           startdate BETWEEN TO_DATE(:START_DATETIME, '#39'MM/DD/RRR' +
        'R HH24:MI'#39')'
      
        '                         AND TO_DATE(:END_DATETIME, '#39'MM/DD/RRRR ' +
        'HH24:MI'#39')) '
      ''
      '      '
      '')
    OnIQModify = PkActivityIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 344
    Top = 128
    ParamData = <
      item
        Name = 'TYPE_INTEGER'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'ARCHIVED_SHOW_ALL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'ARCHIVED'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'MY_CRM_TODAY'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'BY_RANGE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'START_DATETIME'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'END_DATETIME'
        DataType = ftString
        ParamType = ptInput
      end>
    object PkActivityID: TBCDField
      DisplayLabel = 'Activity #'
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'a.id'
      Size = 0
    end
    object PkActivitySUBJECT: TStringField
      DisplayLabel = 'Subject'
      DisplayWidth = 20
      FieldName = 'SUBJECT'
      Origin = 'a.subject'
      Size = 250
    end
    object PkActivityREGARDING: TStringField
      DisplayLabel = 'Regarding'
      DisplayWidth = 25
      FieldName = 'REGARDING'
      Origin = 'a.regarding255'
      Size = 255
    end
    object PkActivitySTARTDATE: TDateTimeField
      DisplayLabel = 'Start Date'
      FieldName = 'STARTDATE'
      Origin = 'a.startdate'
    end
    object PkActivityFINISHDATE: TDateTimeField
      DisplayLabel = 'End Date'
      FieldName = 'FINISHDATE'
      Origin = 'a.finishdate'
    end
    object PkActivityCREATED: TDateTimeField
      DisplayLabel = 'Created'
      FieldName = 'CREATED'
      Origin = 'a.created'
    end
    object PkActivityUSER_ID: TStringField
      DisplayLabel = 'Created By'
      DisplayWidth = 10
      FieldName = 'USER_ID'
      Origin = 'a.user_id'
      Size = 35
    end
    object PkActivityASSIGNEDTO_DISPLAY: TStringField
      DisplayLabel = 'Assigned To'
      DisplayWidth = 35
      FieldName = 'ASSIGNEDTO_DISPLAY'
      Origin = 'a.assignedto_display'
      Size = 255
    end
    object PkActivityASSIGNEDTO_LOGIN_NAME: TStringField
      DisplayLabel = 'Assigned To Login Name'
      FieldName = 'ASSIGNEDTO_LOGIN_NAME'
      Origin = 'a.assignedto_login_name'
      Size = 35
    end
    object PkActivityCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 10
      FieldName = 'COMPANY'
      Origin = 'a.company'
      Size = 60
    end
    object PkActivityCUSTOMER_ADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 10
      FieldName = 'CUSTOMER_ADDR1'
      Origin = 'a.CUSTOMER_ADDR1'
      Size = 60
    end
    object PkActivityCUSTOMER_ADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 10
      FieldName = 'CUSTOMER_ADDR2'
      Origin = 'a.CUSTOMER_ADDR2'
      Size = 60
    end
    object PkActivityCUSTOMER_ADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 10
      FieldName = 'CUSTOMER_ADDR3'
      Origin = 'a.CUSTOMER_ADDR3'
      Size = 60
    end
    object PkActivityCUSTOMER_CITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 10
      FieldName = 'CUSTOMER_CITY'
      Origin = 'a.CUSTOMER_CITY'
      Size = 30
    end
    object PkActivityCUSTOMER_STATE: TStringField
      DisplayLabel = 'State or Region'
      DisplayWidth = 10
      FieldName = 'CUSTOMER_STATE'
      Origin = 'a.CUSTOMER_STATE'
    end
    object PkActivityCUSTOMER_ZIP: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 10
      FieldName = 'CUSTOMER_ZIP'
      Origin = 'a.CUSTOMER_ZIP'
      FixedChar = True
      Size = 10
    end
    object PkActivityCUSTOMER_PHONE_NUMBER: TStringField
      DisplayLabel = 'Company Telephone #'
      DisplayWidth = 10
      FieldName = 'CUSTOMER_PHONE_NUMBER'
      Origin = 'a.CUSTOMER_PHONE_NUMBER'
      Size = 25
    end
    object PkActivityCUSTOMER_EXT: TStringField
      DisplayLabel = 'Company Extension'
      DisplayWidth = 10
      FieldName = 'CUSTOMER_EXT'
      Origin = 'a.CUSTOMER_EXT'
      FixedChar = True
      Size = 5
    end
    object PkActivityCUSTOMER_FAX_NUMBER: TStringField
      DisplayLabel = 'Company Fax #'
      DisplayWidth = 10
      FieldName = 'CUSTOMER_FAX_NUMBER'
      Origin = 'a.CUSTOMER_FAX_NUMBER'
      Size = 25
    end
    object PkActivityPRINCIPLE_COUNTRY: TStringField
      DisplayLabel = 'Company Country'
      FieldName = 'PRINCIPLE_COUNTRY'
      Origin = 'a.principle_country'
      Size = 100
    end
    object PkActivityFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 10
      FieldName = 'FIRST_NAME'
      Origin = 'a.FIRST_NAME'
      Size = 30
    end
    object PkActivityMIDDLE_NAME: TStringField
      DisplayLabel = 'Middle Name'
      DisplayWidth = 10
      FieldName = 'MIDDLE_NAME'
      Origin = 'a.middle_name'
      Size = 30
    end
    object PkActivityLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 10
      FieldName = 'LAST_NAME'
      Origin = 'a.LAST_NAME'
      Size = 30
    end
    object PkActivityCONTACT_TITLE: TStringField
      DisplayLabel = 'Contact Title'
      DisplayWidth = 10
      FieldName = 'CONTACT_TITLE'
      Origin = 'a.CONTACT_TITLE'
      Size = 60
    end
    object PkActivityCONTACT_PHONE_NUMBER: TStringField
      DisplayLabel = 'Contact Telephone #'
      DisplayWidth = 10
      FieldName = 'CONTACT_PHONE_NUMBER'
      Origin = 'a.CONTACT_PHONE_NUMBER'
      Size = 25
    end
    object PkActivityCONTACT_EXT: TStringField
      DisplayLabel = 'Contact Ext'
      DisplayWidth = 10
      FieldName = 'CONTACT_EXT'
      Origin = 'a.CONTACT_EXT'
      Size = 25
    end
    object PkActivityCONTACT_FAX_NUMBER: TStringField
      DisplayLabel = 'Contact Fax #'
      DisplayWidth = 10
      FieldName = 'CONTACT_FAX_NUMBER'
      Origin = 'a.CONTACT_FAX_NUMBER'
      Size = 25
    end
    object PkActivityCONTACT_EMAIL: TStringField
      DisplayLabel = 'Contact Email'
      DisplayWidth = 10
      FieldName = 'CONTACT_EMAIL'
      Origin = 'a.CONTACT_EMAIL'
      Size = 250
    end
    object PkActivityPRINCIPLE_SOURCE_DISP: TStringField
      DisplayLabel = 'Principal'
      DisplayWidth = 60
      FieldName = 'PRINCIPLE_SOURCE_DISP'
      Origin = 'a.principle_source_disp'
      Visible = False
      Size = 250
    end
    object PkActivitySOURCE_DISPLAY: TStringField
      DisplayLabel = 'Assigned To'
      DisplayWidth = 10
      FieldName = 'SOURCE_DISPLAY'
      Origin = 'a.source_display'
      Visible = False
      Size = 250
    end
    object PkActivityCHANGED: TDateTimeField
      DisplayLabel = 'Changed'
      FieldName = 'CHANGED'
      Origin = 'a.changed'
    end
    object PkActivityCHANGEDBY: TStringField
      DisplayLabel = 'Changed By'
      FieldName = 'CHANGEDBY'
      Origin = 'a.changedby'
      Size = 30
    end
  end
  object PkWarranty: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select'
      '     id as id,'
      '     serial as serial,'
      '     active_date as active_date,'
      '     inactive_date as inactive_date,'
      '     duration_display as duration_display,'
      '     arinvt_itemno as arinvt_itemno,'
      '     arinvt_descrip as arinvt_descrip,'
      '     arinvt_descrip2 as arinvt_descrip2,'
      '     arinvt_class as arinvt_class,'
      '     arinvt_rev as arinvt_rev,'
      '     arcusto_custno as arcusto_custno,'
      '     arcusto_company as arcusto_company'
      'from v_crm_warranty'
      '')
    OnIQModify = PkWarrantyIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 32
    Top = 200
    object PkWarrantyID: TBCDField
      DisplayLabel = 'Service #'
      FieldName = 'ID'
      Origin = 'V_CRM_WARRANTY.ID'
      Size = 0
    end
    object PkWarrantySERIAL: TStringField
      DisplayLabel = 'Serial #'
      FieldName = 'SERIAL'
      Origin = 'V_CRM_WARRANTY.SERIAL'
      Size = 30
    end
    object PkWarrantyACTIVE_DATE: TDateTimeField
      DisplayLabel = 'Date Active'
      FieldName = 'ACTIVE_DATE'
      Origin = 'V_CRM_WARRANTY.ACTIVE_DATE'
    end
    object PkWarrantyINACTIVE_DATE: TDateTimeField
      DisplayLabel = 'Date Inactive'
      FieldName = 'INACTIVE_DATE'
      Origin = 'V_CRM_WARRANTY.INACTIVE_DATE'
    end
    object PkWarrantyDURATION_DISPLAY: TStringField
      DisplayLabel = 'Duration'
      FieldName = 'DURATION_DISPLAY'
      Origin = 'V_CRM_WARRANTY.DURATION_DISPLAY'
      Size = 35
    end
    object PkWarrantyARINVT_ITEMNO: TStringField
      DisplayLabel = 'Inventory Item #'
      FieldName = 'ARINVT_ITEMNO'
      Origin = 'V_CRM_WARRANTY.ARINVT_ITEMNO'
      Size = 50
    end
    object PkWarrantyARINVT_DESCRIP: TStringField
      DisplayLabel = 'Inventory Item Description'
      FieldName = 'ARINVT_DESCRIP'
      Origin = 'V_CRM_WARRANTY.ARINVT_DESCRIP'
      Size = 100
    end
    object PkWarrantyARINVT_DESCRIP2: TStringField
      DisplayLabel = 'Inventory Item Extended Description'
      FieldName = 'ARINVT_DESCRIP2'
      Origin = 'V_CRM_WARRANTY.ARINVT_DESCRIP2'
      Size = 100
    end
    object PkWarrantyARINVT_CLASS: TStringField
      DisplayLabel = 'Inventory Item Class'
      FieldName = 'ARINVT_CLASS'
      Origin = 'V_CRM_WARRANTY.ARINVT_CLASS'
      Size = 2
    end
    object PkWarrantyARINVT_REV: TStringField
      DisplayLabel = 'Inventory Item Revision'
      FieldName = 'ARINVT_REV'
      Origin = 'V_CRM_WARRANTY.ARINVT_REV'
      Size = 15
    end
    object PkWarrantyARCUSTO_CUSTNO: TStringField
      DisplayLabel = 'Customer #'
      FieldName = 'ARCUSTO_CUSTNO'
      Origin = 'V_CRM_WARRANTY.ARCUSTO_CUSTNO'
      Size = 10
    end
    object PkWarrantyARCUSTO_COMPANY: TStringField
      DisplayLabel = 'Company'
      FieldName = 'ARCUSTO_COMPANY'
      Origin = 'V_CRM_WARRANTY.ARCUSTO_COMPANY'
      Size = 60
    end
  end
  object PkCampaign: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id, code, description, pk_hide'
      'from campaign'
      'where NVL(archived, '#39'N'#39') <> '#39'Y'#39)
    OnIQModify = PkCampaignIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 24
    Top = 304
    object PkCampaignID: TFloatField
      DisplayLabel = 'Campaign #'
      FieldName = 'ID'
      Origin = 'CAMPAIGN.ID'
    end
    object PkCampaignCODE: TStringField
      DisplayLabel = 'Code'
      FieldName = 'CODE'
      Origin = 'CAMPAIGN.CODE'
      Size = 10
    end
    object PkCampaignDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIPTION'
      Origin = 'CAMPAIGN.DESCRIPTION'
      Size = 255
    end
    object PkCampaignPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      Size = 1
    end
  end
  object PkOpportunity: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT'
      '   a.status_description AS status_description,'
      '   a.status_date AS status_date,'
      '   a.value AS value,'
      '   a.date_opened AS date_opened,'
      '   a.date_closed_expect AS date_closed_expect,'
      '   a.date_closed_actual AS date_closed_actual,'
      '   a.pk_hide AS pk_hide,'
      '   a.opp_no AS opp_no,'
      '   a.description AS description,'
      '   a.principle_companyno AS principle_companyno,'
      '   a.principle_company AS principle_company,'
      '   a.principle_addr1 AS principle_addr1,'
      '   a.principle_addr2 AS principle_addr2,'
      '   a.principle_addr3 AS principle_addr3,'
      '   a.principle_city AS principle_city,'
      '   a.principle_state AS principle_state,'
      '   a.principle_zip AS principle_zip,'
      '   a.principle_country AS principle_country,'
      '   a.principle_company_ext AS principle_company_ext,'
      '   a.principle_company_fax AS principle_company_fax,'
      '   a.principle_company_phone AS principle_company_phone,'
      '   a.principle_company_url AS principle_company_url,'
      '   a.principle_first_name AS principle_first_name,'
      '   a.principle_middle_name AS principle_middle_name,'
      '   a.principle_last_name AS principle_last_name,'
      '   a.principle_title AS principle_title,'
      '   a.principle_contact_email AS principle_contact_email,'
      '   a.principle_contact_phone AS principle_contact_phone,'
      '   a.principle_contact_ext AS principle_contact_ext,'
      '   a.principle_contact_fax AS principle_contact_fax,'
      '   a.principle_crm_prospect AS principle_crm_prospect,'
      '   a.status_code AS status_code,'
      '   a.assignedto_display AS assignedto_display,'
      '   a.assignedto AS assignedto,'
      '   a.sales_stage_code AS sales_stage_code,'
      '   a.id AS id,'
      '   a.cuser1 AS cuser1,'
      '   a.cuser2 AS cuser2,'
      '   a.cuser3 AS cuser3,'
      '   a.cuser4 AS cuser4,'
      '   a.cuser5 AS cuser5'
      'FROM'
      '   v_crm_opportunity_central a'
      
        'WHERE iqms.iqcrm.principle_filter(a.principle_source, a.principl' +
        'e_source_id,'
      '          a.contact_id) = 1 AND'
      '       iqms.iqcrm.assignedto_filter(a.assignedto) = 1')
    OnIQModify = PkOpportunityIQModify
    OnIQCreateHPickColumn = PkOpportunityIQCreateHPickColumn
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 168
    Top = 304
    object PkOpportunityID: TBCDField
      DisplayWidth = 12
      FieldName = 'ID'
      Origin = 'A.ID'
      Visible = False
      Size = 0
    end
    object PkOpportunityOPP_NO: TStringField
      DisplayLabel = 'Opportunity #'
      DisplayWidth = 12
      FieldName = 'OPP_NO'
      Origin = 'A.OPP_NO'
      Size = 10
    end
    object PkOpportunityDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 18
      FieldName = 'DESCRIPTION'
      Origin = 'A.DESCRIPTION'
      Size = 60
    end
    object PkOpportunityPRINCIPLE_COMPANYNO: TStringField
      DisplayLabel = 'Company #'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_COMPANYNO'
      Origin = 'A.PRINCIPLE_COMPANYNO'
      Size = 25
    end
    object PkOpportunityPRINCIPLE_COMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_COMPANY'
      Origin = 'A.PRINCIPLE_COMPANY'
      Size = 60
    end
    object PkOpportunityPRINCIPLE_ADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_ADDR1'
      Origin = 'A.PRINCIPLE_ADDR1'
      Size = 60
    end
    object PkOpportunityPRINCIPLE_ADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_ADDR2'
      Origin = 'A.PRINCIPLE_ADDR2'
      Size = 60
    end
    object PkOpportunityPRINCIPLE_ADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_ADDR3'
      Origin = 'A.PRINCIPLE_ADDR3'
      Size = 60
    end
    object PkOpportunityPRINCIPLE_CITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_CITY'
      Origin = 'A.PRINCIPLE_CITY'
      Size = 30
    end
    object PkOpportunityPRINCIPLE_STATE: TStringField
      DisplayLabel = 'State or Region'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_STATE'
      Origin = 'A.PRINCIPLE_STATE'
    end
    object PkOpportunityPRINCIPLE_ZIP: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_ZIP'
      Origin = 'A.PRINCIPLE_ZIP'
      Size = 10
    end
    object PkOpportunityPRINCIPLE_COUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_COUNTRY'
      Origin = 'A.PRINCIPLE_COUNTRY'
      Size = 100
    end
    object PkOpportunityPRINCIPLE_COMPANY_PHONE: TStringField
      DisplayLabel = 'Company Telephone'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_COMPANY_PHONE'
      Origin = 'A.PRINCIPLE_COMPANY_PHONE'
      Size = 25
    end
    object PkOpportunityPRINCIPLE_COMPANY_EXT: TStringField
      DisplayLabel = 'Company Extension'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_COMPANY_EXT'
      Origin = 'A.PRINCIPLE_COMPANY_EXT'
      Size = 5
    end
    object PkOpportunityPRINCIPLE_COMPANY_FAX: TStringField
      DisplayLabel = 'Company Fax'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_COMPANY_FAX'
      Origin = 'A.PRINCIPLE_COMPANY_FAX'
      Size = 25
    end
    object PkOpportunityPRINCIPLE_COMPANY_URL: TStringField
      DisplayLabel = 'Company Web Site'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_COMPANY_URL'
      Origin = 'A.PRINCIPLE_COMPANY_URL'
      Size = 255
    end
    object PkOpportunityPRINCIPLE_FIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_FIRST_NAME'
      Origin = 'A.PRINCIPLE_FIRST_NAME'
      Size = 30
    end
    object PkOpportunityPRINCIPLE_MIDDLE_NAME: TStringField
      DisplayLabel = 'Middle Name'
      DisplayWidth = 10
      FieldName = 'PRINCIPLE_MIDDLE_NAME'
      Origin = 'A.PRINCIPLE_MIDDLE_NAME'
      Size = 30
    end
    object PkOpportunityPRINCIPLE_LAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_LAST_NAME'
      Origin = 'A.PRINCIPLE_LAST_NAME'
      Size = 30
    end
    object PkOpportunityPRINCIPLE_TITLE: TStringField
      DisplayLabel = 'Title'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_TITLE'
      Origin = 'A.PRINCIPLE_TITLE'
      Size = 60
    end
    object PkOpportunityPRINCIPLE_CONTACT_EMAIL: TStringField
      DisplayLabel = 'Email'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_CONTACT_EMAIL'
      Origin = 'A.PRINCIPLE_CONTACT_EMAIL'
      Size = 250
    end
    object PkOpportunityPRINCIPLE_CONTACT_PHONE: TStringField
      DisplayLabel = 'Telephone #'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_CONTACT_PHONE'
      Origin = 'A.PRINCIPLE_CONTACT_PHONE'
      Size = 25
    end
    object PkOpportunityPRINCIPLE_CONTACT_EXT: TStringField
      DisplayLabel = 'Extension'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_CONTACT_EXT'
      Origin = 'A.PRINCIPLE_CONTACT_EXT'
      Size = 25
    end
    object PkOpportunityPRINCIPLE_CONTACT_FAX: TStringField
      DisplayLabel = 'Fax #'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_CONTACT_FAX'
      Origin = 'A.PRINCIPLE_CONTACT_FAX'
      Size = 25
    end
    object PkOpportunityPRINCIPLE_CRM_PROSPECT: TStringField
      DisplayLabel = 'CRM Prospect?'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_CRM_PROSPECT'
      Origin = 'A.PRINCIPLE_CRM_PROSPECT'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object PkOpportunityVALUE: TFMTBCDField
      DisplayLabel = 'Value'
      DisplayWidth = 12
      FieldName = 'VALUE'
      Origin = 'A.DATE_OPENED'
      Size = 6
    end
    object PkOpportunitySTATUS_CODE: TStringField
      DisplayLabel = 'Status Code'
      DisplayWidth = 12
      FieldName = 'STATUS_CODE'
      Origin = 'A.STATUS_CODE'
      Size = 10
    end
    object PkOpportunitySTATUS_DESCRIPTION: TStringField
      DisplayLabel = 'Status Description'
      DisplayWidth = 12
      FieldName = 'STATUS_DESCRIPTION'
      Origin = 'A.STATUS_DESCRIPTION'
      Size = 60
    end
    object PkOpportunitySTATUS_DATE: TDateTimeField
      DisplayLabel = 'Status Date'
      DisplayWidth = 12
      FieldName = 'STATUS_DATE'
      Origin = 'A.STATUS_DATE'
    end
    object PkOpportunityDATE_OPENED: TDateTimeField
      DisplayLabel = 'Date Opened'
      DisplayWidth = 12
      FieldName = 'DATE_OPENED'
      Origin = 'A.DATE_CLOSED_EXPECT'
    end
    object PkOpportunityDATE_CLOSED_EXPECT: TDateTimeField
      DisplayLabel = 'Expected Date Closed'
      DisplayWidth = 12
      FieldName = 'DATE_CLOSED_EXPECT'
      Origin = 'A.DATE_CLOSED_ACTUAL'
    end
    object PkOpportunityDATE_CLOSED_ACTUAL: TDateTimeField
      DisplayLabel = 'Actual Date Closed'
      DisplayWidth = 12
      FieldName = 'DATE_CLOSED_ACTUAL'
      Origin = 'A.DATE_CLOSED_ACTUAL'
    end
    object PkOpportunityPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'A.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object PkOpportunityASSIGNEDTO_DISPLAY: TStringField
      DisplayLabel = 'Assigned To'
      DisplayWidth = 40
      FieldName = 'ASSIGNEDTO_DISPLAY'
      Origin = 'A.ASSIGNEDTO_DISPLAY'
      Size = 255
    end
    object PkOpportunityASSIGNEDTO: TStringField
      DisplayLabel = 'Assigned To User ID'
      DisplayWidth = 22
      FieldName = 'ASSIGNEDTO'
      Origin = 'A.ASSIGNEDTO'
      Size = 35
    end
    object PkOpportunitySALES_STAGE_CODE: TStringField
      DisplayLabel = 'Sales Stage'
      FieldName = 'SALES_STAGE_CODE'
      Origin = 'a.sales_stage_code'
      Size = 15
    end
    object PkOpportunityCUSER1: TStringField
      DisplayLabel = 'User Text 1'
      DisplayWidth = 18
      FieldName = 'CUSER1'
      Origin = 'a.cuser1'
      Size = 60
    end
    object PkOpportunityCUSER2: TStringField
      DisplayLabel = 'User Text 2'
      DisplayWidth = 18
      FieldName = 'CUSER2'
      Origin = 'a.cuser2'
      Size = 60
    end
    object PkOpportunityCUSER3: TStringField
      DisplayLabel = 'User Text 3'
      DisplayWidth = 18
      FieldName = 'CUSER3'
      Origin = 'a.cuser3'
      Size = 60
    end
    object PkOpportunityCUSER4: TStringField
      DisplayLabel = 'User Text 4'
      DisplayWidth = 18
      FieldName = 'CUSER4'
      Origin = 'a.cuser4'
      Size = 60
    end
    object PkOpportunityCUSER5: TStringField
      DisplayLabel = 'User Text 5'
      DisplayWidth = 18
      FieldName = 'CUSER5'
      Origin = 'a.cuser5'
      Size = 60
    end
  end
  object PkProject: TIQWebHpick
    Tag = 1
    BeforeOpen = AssignEPlantFilter
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select'
      '     id,'
      '     arcusto_id,'
      '     rfq, '
      '     project, '
      '     create_date, '
      '     workorderno,'
      '     wo_open,'
      '     archived,'
      '     company,'
      '     eqno,'
      '     eplant_name,'
      '     eplant_id,'
      '     plm_itemno,'
      '     plm_descrip,'
      '     plm_rev,'
      '     plm_class'
      'from '
      '     v_tool_rfq'
      ' ')
    OnIQModify = DoIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 96
    Top = 248
    object PkProjectID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'tool_rfq.id'
      Visible = False
      Size = 0
    end
    object PkProjectRFQ: TStringField
      DisplayLabel = 'Project #'
      DisplayWidth = 10
      FieldName = 'RFQ'
      Origin = 'tool_rfq.rfq'
    end
    object PkProjectPROJECT: TStringField
      DisplayLabel = 'Project Name'
      DisplayWidth = 10
      FieldName = 'PROJECT'
      Origin = 'tool_rfq.project'
      Size = 255
    end
    object PkProjectCREATE_DATE: TDateTimeField
      DisplayLabel = 'Create Date'
      DisplayWidth = 10
      FieldName = 'CREATE_DATE'
      Origin = 'tool_rfq.create_date'
    end
    object PkProjectCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 10
      FieldName = 'COMPANY'
      Origin = 'arcusto.company'
      Size = 60
    end
    object PkProjectWORKORDERNO: TStringField
      DisplayLabel = 'Work Order #'
      DisplayWidth = 10
      FieldName = 'WORKORDERNO'
      Origin = 'tool_rfq.workorderno'
    end
    object PkProjectEQNO: TStringField
      DisplayLabel = 'MRO Equipment #'
      DisplayWidth = 10
      FieldName = 'EQNO'
      Origin = 'pmeqmt.eqno'
      Size = 25
    end
    object PkProjectARCHIVED: TStringField
      DisplayLabel = 'Closed?'
      FieldName = 'ARCHIVED'
      Origin = 'tool_rfq.archived'
      Size = 1
    end
    object PkProjectEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      FieldName = 'EPLANT_NAME'
      Origin = 'V_TOOL_RFQ.EPLANT_NAME'
      Size = 30
    end
    object PkProjectEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'V_TOOL_RFQ.EPLANT_ID'
      Visible = False
      Size = 0
    end
    object PkProjectPLM_ITEMNO: TStringField
      DisplayLabel = 'PLM Item #'
      FieldName = 'PLM_ITEMNO'
      Origin = 'V_TOOL_RFQ.PLM_ITEMNO'
      Size = 50
    end
    object PkProjectPLM_DESCRIP: TStringField
      DisplayLabel = 'PLM Item Description'
      FieldName = 'PLM_DESCRIP'
      Origin = 'V_TOOL_RFQ.PLM_DESCRIP'
      Size = 100
    end
    object PkProjectPLM_REV: TStringField
      DisplayLabel = 'PLM Item Revision'
      FieldName = 'PLM_REV'
      Origin = 'V_TOOL_RFQ.PLM_REV'
      Size = 15
    end
    object PkProjectPLM_CLASS: TStringField
      DisplayLabel = 'PLM Item Class'
      FieldName = 'PLM_CLASS'
      Origin = 'V_TOOL_RFQ.PLM_CLASS'
      FixedChar = True
      Size = 2
    end
  end
  object PkWarrantyRegCust: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT'
      '     crm_warranty_customer.id as id,'
      '     crm_warranty_customer.crm_warranty_id as crm_warranty_id,'
      '     crm_warranty_customer.arcusto_id as arcusto_id,'
      '     crm_warranty_customer.arcusto_custno as arcusto_custno,'
      '     crm_warranty_customer.arcusto_company as arcusto_company,'
      '     crm_warranty_customer.transfer_date as transfer_date,'
      '     crm_warranty_customer.created as created,'
      '     crm_warranty_customer.createdby as createdby'
      'FROM crm_warranty_customer')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 96
    Top = 200
    object PkWarrantyRegCustID: TBCDField
      DisplayWidth = 12
      FieldName = 'ID'
      Origin = 'CRM_WARRANTY_CUSTOMER.ID'
      Visible = False
      Size = 0
    end
    object PkWarrantyRegCustCRM_WARRANTY_ID: TBCDField
      DisplayWidth = 12
      FieldName = 'CRM_WARRANTY_ID'
      Origin = 'CRM_WARRANTY_CUSTOMER.CRM_WARRANTY_ID'
      Visible = False
      Size = 0
    end
    object PkWarrantyRegCustARCUSTO_ID: TBCDField
      DisplayWidth = 12
      FieldName = 'ARCUSTO_ID'
      Origin = 'CRM_WARRANTY_CUSTOMER.ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object PkWarrantyRegCustARCUSTO_CUSTNO: TStringField
      DisplayLabel = 'Customer #'
      DisplayWidth = 18
      FieldName = 'ARCUSTO_CUSTNO'
      Origin = 'CRM_WARRANTY_CUSTOMER.ARCUSTO_CUSTNO'
      Size = 10
    end
    object PkWarrantyRegCustARCUSTO_COMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 25
      FieldName = 'ARCUSTO_COMPANY'
      Origin = 'CRM_WARRANTY_CUSTOMER.ARCUSTO_COMPANY'
      Size = 60
    end
    object PkWarrantyRegCustTRANSFER_DATE: TDateTimeField
      DisplayLabel = 'Transfer Date'
      DisplayWidth = 18
      FieldName = 'TRANSFER_DATE'
      Origin = 'CRM_WARRANTY_CUSTOMER.TRANSFER_DATE'
    end
    object PkWarrantyRegCustCREATED: TDateTimeField
      DisplayLabel = 'Created'
      DisplayWidth = 18
      FieldName = 'CREATED'
      Origin = 'CRM_WARRANTY_CUSTOMER.CREATED'
      Visible = False
    end
    object PkWarrantyRegCustCREATEDBY: TStringField
      DisplayLabel = 'Created By'
      DisplayWidth = 18
      FieldName = 'CREATEDBY'
      Origin = 'CRM_WARRANTY_CUSTOMER.CREATEDBY'
      Visible = False
      Size = 35
    end
  end
  object PkWarrantyComb: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select'
      '   crm_warranty.id as id, '
      '   crm_warranty.serial as serial, '
      '   crm_warranty.active_date as active_date, '
      '   crm_warranty.inactive_date as inactive_date, '
      '   crm_warranty.duration_display as duration_display, '
      '   crm_warranty.arinvt_id as arinvt_id, '
      '   crm_warranty.arinvt_itemno as arinvt_itemno, '
      '   crm_warranty.arinvt_descrip as arinvt_descrip, '
      '   crm_warranty.arinvt_descrip2 as arinvt_descrip2, '
      '   crm_warranty.arinvt_class as arinvt_class, '
      '   crm_warranty.arinvt_rev as arinvt_rev, '
      '   crm_warranty.sold_arcusto_id as sold_arcusto_id, '
      '   crm_warranty.arcusto_custno as arcusto_custno, '
      '   crm_warranty.arcusto_company as arcusto_company,'
      '   '
      '   crm_warranty_customer.id as regcust_id, '
      '   crm_warranty_customer.arcusto_id as regcust_arcusto_id, '
      
        '   crm_warranty_customer.arcusto_custno as regcust_arcusto_custn' +
        'o,'
      
        '   crm_warranty_customer.arcusto_company as regcust_arcusto_comp' +
        'any, '
      
        '   crm_warranty_customer.transfer_date as regcust_transfer_date,' +
        ' '
      '   crm_warranty_customer.created as regcust_created, '
      '   crm_warranty_customer.createdby as regcust_createdby'
      '   '
      '   '
      'from crm_warranty, crm_warranty_customer'
      'where crm_warranty_customer.crm_warranty_id(+) = crm_warranty.id'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 168
    Top = 200
    object PkWarrantyCombID: TBCDField
      FieldName = 'ID'
      Origin = 'CRM_WARRANTY.ID'
      Visible = False
      Size = 0
    end
    object PkWarrantyCombSERIAL: TStringField
      DisplayLabel = 'Serial #'
      FieldName = 'SERIAL'
      Origin = 'CRM_WARRANTY.SERIAL'
      Size = 30
    end
    object PkWarrantyCombACTIVE_DATE: TDateTimeField
      DisplayLabel = 'Date Active'
      FieldName = 'ACTIVE_DATE'
      Origin = 'CRM_WARRANTY.ACTIVE_DATE'
    end
    object PkWarrantyCombINACTIVE_DATE: TDateTimeField
      DisplayLabel = 'Date Inactive'
      FieldName = 'INACTIVE_DATE'
      Origin = 'CRM_WARRANTY.INACTIVE_DATE'
    end
    object PkWarrantyCombDURATION_DISPLAY: TStringField
      DisplayLabel = 'Duration'
      FieldName = 'DURATION_DISPLAY'
      Origin = 'CRM_WARRANTY.DURATION_DISPLAY'
      Size = 35
    end
    object PkWarrantyCombARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Origin = 'CRM_WARRANTY.ARINVT_ID'
      Visible = False
      Size = 0
    end
    object PkWarrantyCombARINVT_ITEMNO: TStringField
      DisplayLabel = 'Inventory Item #'
      FieldName = 'ARINVT_ITEMNO'
      Origin = 'CRM_WARRANTY.ARINVT_ITEMNO'
      Size = 50
    end
    object PkWarrantyCombARINVT_DESCRIP: TStringField
      DisplayLabel = 'Inventory Item Description'
      FieldName = 'ARINVT_DESCRIP'
      Origin = 'CRM_WARRANTY.ARINVT_DESCRIP'
      Size = 100
    end
    object PkWarrantyCombARINVT_DESCRIP2: TStringField
      DisplayLabel = 'Inventory Item Extended Description'
      FieldName = 'ARINVT_DESCRIP2'
      Origin = 'CRM_WARRANTY.ARINVT_DESCRIP2'
      Size = 100
    end
    object PkWarrantyCombARINVT_CLASS: TStringField
      DisplayLabel = 'Inventory Item Class'
      FieldName = 'ARINVT_CLASS'
      Origin = 'CRM_WARRANTY.ARINVT_CLASS'
      Size = 2
    end
    object PkWarrantyCombARINVT_REV: TStringField
      DisplayLabel = 'Inventory Item Revision'
      FieldName = 'ARINVT_REV'
      Origin = 'CRM_WARRANTY.ARINVT_REV'
      Size = 15
    end
    object PkWarrantyCombSOLD_ARCUSTO_ID: TBCDField
      FieldName = 'SOLD_ARCUSTO_ID'
      Origin = 'CRM_WARRANTY.SOLD_ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object PkWarrantyCombARCUSTO_CUSTNO: TStringField
      DisplayLabel = 'Customer #'
      FieldName = 'ARCUSTO_CUSTNO'
      Origin = 'CRM_WARRANTY.ARCUSTO_CUSTNO'
      Size = 10
    end
    object PkWarrantyCombARCUSTO_COMPANY: TStringField
      DisplayLabel = 'Customer Company'
      FieldName = 'ARCUSTO_COMPANY'
      Origin = 'CRM_WARRANTY.ARCUSTO_COMPANY'
      Size = 60
    end
    object PkWarrantyCombREGCUST_ID: TBCDField
      FieldName = 'REGCUST_ID'
      Origin = 'CRM_WARRANTY_CUSTOMER.ID'
      Visible = False
      Size = 0
    end
    object PkWarrantyCombREGCUST_ARCUSTO_ID: TBCDField
      FieldName = 'REGCUST_ARCUSTO_ID'
      Origin = 'CRM_WARRANTY_CUSTOMER.ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object PkWarrantyCombREGCUST_ARCUSTO_CUSTNO: TStringField
      DisplayLabel = 'Registered Customer #'
      FieldName = 'REGCUST_ARCUSTO_CUSTNO'
      Origin = 'CRM_WARRANTY_CUSTOMER.ARCUSTO_CUSTNO'
      Size = 10
    end
    object PkWarrantyCombREGCUST_ARCUSTO_COMPANY: TStringField
      DisplayLabel = 'Registered Customer Company'
      FieldName = 'REGCUST_ARCUSTO_COMPANY'
      Origin = 'CRM_WARRANTY_CUSTOMER.ARCUSTO_COMPANY'
      Size = 60
    end
    object PkWarrantyCombREGCUST_TRANSFER_DATE: TDateTimeField
      DisplayLabel = 'Transfer Date'
      FieldName = 'REGCUST_TRANSFER_DATE'
      Origin = 'CRM_WARRANTY_CUSTOMER.TRANSFER_DATE'
    end
  end
  object PkArcustoUD: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select'
      '   arcusto.id as id,'
      '   arcusto.custno as custno,'
      '   arcusto.company as company,'
      '   arcusto.addr1 as addr1,'
      '   arcusto.city as city,'
      '   arcusto.state as state,'
      '   arcusto.zip as zip,'
      '   arcusto.country as country,   '
      '   cust_type.descrip as cust_type_descrip,'
      '   arcusto.cuser1 as cuser1,'
      '   arcusto.cuser2 as cuser2,'
      '   arcusto.cuser3 as cuser3,'
      '   arcusto.cuser4 as cuser4,'
      '   arcusto.cuser5 as cuser5,'
      '   arcusto.cuser6 as cuser6,'
      '   crm_user_defined.cuser1 as crm_cuser1,'
      '   crm_user_defined.cuser2 as crm_cuser2,'
      '   crm_user_defined.cuser3 as crm_cuser3,'
      '   crm_user_defined.cuser4 as crm_cuser4,'
      '   crm_user_defined.cuser5 as crm_cuser5,'
      '   crm_user_defined.cuser6 as crm_cuser6,'
      '   crm_user_defined.cuser7 as crm_cuser7,'
      '   crm_user_defined.cuser8 as crm_cuser8,'
      '   crm_user_defined.cuser9 as crm_cuser9,'
      '   crm_user_defined.cuser10 as crm_cuser10'
      'from v_crm_arcusto arcusto, crm_user_defined, cust_type'
      'where crm_user_defined.arcusto_id(+) = arcusto.id'
      ' and cust_type.id(+) = arcusto.cust_type_id')
    IQInitialSeek = 'CUSTNO'
    OnIQCreateHPickColumn = PkArcustoUDIQCreateHPickColumn
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 80
    Top = 8
    object PkArcustoUDID: TBCDField
      DisplayWidth = 18
      FieldName = 'ID'
      Origin = 'ARCUSTO.ID'
      Visible = False
      Size = 0
    end
    object PkArcustoUDCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      DisplayWidth = 18
      FieldName = 'CUSTNO'
      Origin = 'ARCUSTO.CUSTNO'
      FixedChar = True
      Size = 10
    end
    object PkArcustoUDCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 18
      FieldName = 'COMPANY'
      Origin = 'ARCUSTO.COMPANY'
      Size = 60
    end
    object PkArcustoUDADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 20
      FieldName = 'ADDR1'
      Origin = 'ARCUSTO.ADDR1'
      Size = 60
    end
    object PkArcustoUDCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 18
      FieldName = 'CITY'
      Origin = 'ARCUSTO.CITY'
      FixedChar = True
      Size = 30
    end
    object PkArcustoUDSTATE: TStringField
      DisplayLabel = 'State or Region'
      DisplayWidth = 18
      FieldName = 'STATE'
      Origin = 'ARCUSTO.STATE'
    end
    object PkArcustoUDZIP: TStringField
      DisplayLabel = 'Postal Code'
      FieldName = 'ZIP'
      Origin = 'ARCUSTO.ZIP'
      FixedChar = True
      Size = 10
    end
    object PkArcustoUDCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 18
      FieldName = 'COUNTRY'
      Origin = 'ARCUSTO.COUNTRY'
      FixedChar = True
      Size = 100
    end
    object PkArcustoUDCUST_TYPE_DESCRIP: TStringField
      DisplayLabel = 'Tier Type'
      DisplayWidth = 12
      FieldName = 'CUST_TYPE_DESCRIP'
      Origin = 'CUST_TYPE.DESCRIP'
      Size = 50
    end
    object PkArcustoUDCUSER1: TStringField
      DisplayLabel = 'User Text 1'
      DisplayWidth = 18
      FieldName = 'CUSER1'
      Origin = 'ARCUSTO.CUSER1'
      Size = 60
    end
    object PkArcustoUDCUSER2: TStringField
      DisplayLabel = 'User Text 2'
      DisplayWidth = 18
      FieldName = 'CUSER2'
      Origin = 'ARCUSTO.CUSER2'
      Size = 60
    end
    object PkArcustoUDCUSER3: TStringField
      DisplayLabel = 'User Text 3'
      DisplayWidth = 18
      FieldName = 'CUSER3'
      Origin = 'ARCUSTO.CUSER3'
      Size = 60
    end
    object PkArcustoUDCUSER4: TStringField
      DisplayLabel = 'User Text 4'
      DisplayWidth = 18
      FieldName = 'CUSER4'
      Origin = 'ARCUSTO.CUSER4'
      Size = 60
    end
    object PkArcustoUDCUSER5: TStringField
      DisplayLabel = 'User Text 5'
      DisplayWidth = 18
      FieldName = 'CUSER5'
      Origin = 'ARCUSTO.CUSER5'
      Size = 60
    end
    object PkArcustoUDCUSER6: TStringField
      DisplayLabel = 'User Text 6'
      DisplayWidth = 18
      FieldName = 'CUSER6'
      Origin = 'ARCUSTO.CUSER6'
      Size = 60
    end
    object PkArcustoUDCRM_CUSER1: TStringField
      DisplayLabel = 'User Text 1 (CRM)'
      DisplayWidth = 18
      FieldName = 'CRM_CUSER1'
      Origin = 'CRM_USER_DEFINED.CUSER1'
      Size = 60
    end
    object PkArcustoUDCRM_CUSER2: TStringField
      DisplayLabel = 'User Text 2 (CRM)'
      DisplayWidth = 18
      FieldName = 'CRM_CUSER2'
      Origin = 'CRM_USER_DEFINED.CUSER2'
      Size = 60
    end
    object PkArcustoUDCRM_CUSER3: TStringField
      DisplayLabel = 'User Text 3 (CRM)'
      DisplayWidth = 18
      FieldName = 'CRM_CUSER3'
      Origin = 'CRM_USER_DEFINED.CUSER3'
      Size = 60
    end
    object PkArcustoUDCRM_CUSER4: TStringField
      DisplayLabel = 'User Text 4 (CRM)'
      DisplayWidth = 18
      FieldName = 'CRM_CUSER4'
      Origin = 'CRM_USER_DEFINED.CUSER4'
      Size = 60
    end
    object PkArcustoUDCRM_CUSER5: TStringField
      DisplayLabel = 'User Text 5 (CRM)'
      DisplayWidth = 18
      FieldName = 'CRM_CUSER5'
      Origin = 'CRM_USER_DEFINED.CUSER5'
      Size = 60
    end
    object PkArcustoUDCRM_CUSER6: TStringField
      DisplayLabel = 'User Text 6 (CRM)'
      DisplayWidth = 18
      FieldName = 'CRM_CUSER6'
      Origin = 'CRM_USER_DEFINED.CUSER6'
      Size = 60
    end
    object PkArcustoUDCRM_CUSER7: TStringField
      DisplayLabel = 'User Text 7 (CRM)'
      DisplayWidth = 18
      FieldName = 'CRM_CUSER7'
      Origin = 'CRM_USER_DEFINED.CUSER7'
      Size = 60
    end
    object PkArcustoUDCRM_CUSER8: TStringField
      DisplayLabel = 'User Text 8 (CRM)'
      DisplayWidth = 18
      FieldName = 'CRM_CUSER8'
      Origin = 'CRM_USER_DEFINED.CUSER8'
      Size = 60
    end
    object PkArcustoUDCRM_CUSER9: TStringField
      DisplayLabel = 'User Text 9 (CRM)'
      DisplayWidth = 18
      FieldName = 'CRM_CUSER9'
      Origin = 'CRM_USER_DEFINED.CUSER9'
      Size = 60
    end
    object PkArcustoUDCRM_CUSER10: TStringField
      DisplayLabel = 'User Text 10 (CRM)'
      DisplayWidth = 18
      FieldName = 'CRM_CUSER10'
      Origin = 'CRM_USER_DEFINED.CUSER10'
      Size = 60
    end
  end
  object PkCampaignArchived: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id, code, description'
      'from campaign'
      'where NVL(archived, '#39'N'#39') = '#39'Y'#39)
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 96
    Top = 304
    object PkCampaignArchivedID: TFloatField
      DisplayLabel = 'Campaign #'
      FieldName = 'ID'
      Origin = 'CAMPAIGN.ID'
    end
    object PkCampaignArchivedCODE: TStringField
      DisplayLabel = 'Code'
      FieldName = 'CODE'
      Origin = 'CAMPAIGN.CODE'
      Size = 10
    end
    object PkCampaignArchivedDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIPTION'
      Origin = 'CAMPAIGN.DESCRIPTION'
      Size = 255
    end
  end
  object PkJobShop: TIQWebHpick
    BeforeOpen = AssignEPlantFilter
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select'
      '   a.projectno as projectno,'
      '   a.project_descrip as project_descrip,'
      '   a.custno as custno,'
      '   a.company as company,'
      '   a.itemno as itemno,'
      '   a.descrip as descrip,'
      '   a.descrip2 as descrip2,'
      '   a.rev as rev,'
      '   a.mfgno as mfgno,'
      '   a.cntr_type as cntr_type,'
      '   a.mfg_type as mfg_type,'
      '   a.is_open as is_open,'
      '   a.status as status,'
      '   a.archived as archived,'
      '   a.started as started,'
      '   a.id as id'
      'from'
      '   v_jobshop a'
      '')
    OnIQModify = DoIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 168
    Top = 256
    object PkJobShopPROJECTNO: TStringField
      DisplayLabel = 'Project #'
      DisplayWidth = 18
      FieldName = 'PROJECTNO'
      Origin = 'A.PROJECTNO'
      Size = 25
    end
    object PkJobShopPROJECT_DESCRIP: TStringField
      DisplayLabel = 'Project Description'
      DisplayWidth = 18
      FieldName = 'PROJECT_DESCRIP'
      Origin = 'A.PROJECT_DESCRIP'
      Size = 255
    end
    object PkJobShopCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      DisplayWidth = 18
      FieldName = 'CUSTNO'
      Origin = 'A.CUSTNO'
      FixedChar = True
      Size = 10
    end
    object PkJobShopCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 18
      FieldName = 'COMPANY'
      Origin = 'A.COMPANY'
      Size = 60
    end
    object PkJobShopITEMNO: TStringField
      DisplayLabel = 'Inventory Item #'
      DisplayWidth = 18
      FieldName = 'ITEMNO'
      Origin = 'A.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object PkJobShopDESCRIP: TStringField
      DisplayLabel = 'Inventory Item Description'
      DisplayWidth = 18
      FieldName = 'DESCRIP'
      Origin = 'A.DESCRIP'
      Size = 100
    end
    object PkJobShopDESCRIP2: TStringField
      DisplayLabel = 'Inventory Item Extended Description'
      FieldName = 'DESCRIP2'
      Origin = 'A.DESCRIP2'
      Size = 100
    end
    object PkJobShopREV: TStringField
      DisplayLabel = 'Inventory Item Revision'
      DisplayWidth = 18
      FieldName = 'REV'
      Origin = 'A.REV'
      FixedChar = True
      Size = 15
    end
    object PkJobShopMFGNO: TStringField
      DisplayLabel = 'Manufacturing #'
      DisplayWidth = 18
      FieldName = 'MFGNO'
      Origin = 'A.MFGNO'
      Size = 50
    end
    object PkJobShopCNTR_TYPE: TStringField
      DisplayLabel = 'Center Type'
      DisplayWidth = 18
      FieldName = 'CNTR_TYPE'
      Origin = 'A.CNTR_TYPE'
      FixedChar = True
    end
    object PkJobShopMFG_TYPE: TStringField
      DisplayLabel = 'Manufacturing Type'
      DisplayWidth = 18
      FieldName = 'MFG_TYPE'
      Origin = 'A.MFG_TYPE'
      FixedChar = True
      Size = 10
    end
    object PkJobShopIS_OPEN: TStringField
      DisplayLabel = 'Open?'
      DisplayWidth = 18
      FieldName = 'IS_OPEN'
      Origin = 'A.IS_OPEN'
      Size = 1
    end
    object PkJobShopARCHIVED: TStringField
      DisplayLabel = 'Archived?'
      DisplayWidth = 18
      FieldName = 'ARCHIVED'
      Origin = 'A.ARCHIVED'
      Size = 1
    end
    object PkJobShopSTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 18
      FieldName = 'STATUS'
      Origin = 'A.STATUS'
      Size = 30
    end
    object PkJobShopSTARTED: TStringField
      DisplayLabel = 'Started?'
      DisplayWidth = 18
      FieldName = 'STARTED'
      Origin = 'A.STARTED'
      Size = 30
    end
    object PkJobShopID: TBCDField
      FieldName = 'ID'
      Origin = 'A.ID'
      Visible = False
      Size = 0
    end
  end
  object PkWorkFlow: TIQWebHpick
    BeforeOpen = AssignEPlantFilter
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select'
      '   a.id as id,'
      '   a.workflowno as workflowno,'
      '   a.kind as kind,'
      '   a.initiator as initiator,'
      '   a.arcusto_id as arcusto_id,'
      '   a.open_date as open_date,'
      '   a.complete_date as complete_date,'
      '   a.close_date as close_date,'
      '   a.conclusion as conclusion,'
      '   a.arcusto_custno as arcusto_custno,'
      '   a.arcusto_company as arcusto_company,'
      '   a.seq_workflow as seq_workflow,'
      '   a.wf_type_id as wf_type_id,'
      '   a.wf_type_name as wf_type_name,'
      '   a.eplant_id as eplant_id,'
      '   a.department as department,'
      '   a.dev_type as dev_type,'
      '   a.car_id as car_id,'
      '   a.eco_id as eco_id,'
      '   a.vendor_id as vendor_id,'
      '   a.vendor_vendorno as vendor_vendorno,'
      '   a.vendor_company as vendor_company,'
      '   a.effect_date as effect_date,'
      '   a.carno as carno,'
      '   a.econo as econo,'
      '   a.is_started as is_started'
      'from'
      '   v_wf_header_crm a'
      '')
    OnIQModify = DoIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 256
    Top = 200
    object PkWorkFlowWORKFLOWNO: TStringField
      DisplayLabel = 'Workflow #'
      DisplayWidth = 15
      FieldName = 'WORKFLOWNO'
      Origin = 'A.WORKFLOWNO'
      Size = 15
    end
    object PkWorkFlowWF_TYPE_NAME: TStringField
      DisplayLabel = 'Template Type'
      DisplayWidth = 10
      FieldName = 'WF_TYPE_NAME'
      Origin = 'A.WF_TYPE_NAME'
      Size = 10
    end
    object PkWorkFlowDEPARTMENT: TStringField
      DisplayLabel = 'Department'
      DisplayWidth = 50
      FieldName = 'DEPARTMENT'
      Origin = 'A.DEPARTMENT'
      Size = 50
    end
    object PkWorkFlowSEQ_WORKFLOW: TStringField
      DisplayLabel = 'Sequence #'
      DisplayWidth = 1
      FieldName = 'SEQ_WORKFLOW'
      Origin = 'A.SEQ_WORKFLOW'
      FixedChar = True
      Size = 1
    end
    object PkWorkFlowINITIATOR: TStringField
      DisplayLabel = 'Initiator'
      DisplayWidth = 30
      FieldName = 'INITIATOR'
      Origin = 'A.INITIATOR'
      Size = 30
    end
    object PkWorkFlowIS_STARTED: TStringField
      DisplayLabel = 'Started?'
      DisplayWidth = 1
      FieldName = 'IS_STARTED'
      Origin = 'A.IS_STARTED'
      FixedChar = True
      Size = 1
    end
    object PkWorkFlowOPEN_DATE: TDateTimeField
      DisplayLabel = 'Date Opened'
      DisplayWidth = 18
      FieldName = 'OPEN_DATE'
      Origin = 'A.OPEN_DATE'
    end
    object PkWorkFlowEFFECT_DATE: TDateTimeField
      DisplayLabel = 'Date Effective'
      DisplayWidth = 18
      FieldName = 'EFFECT_DATE'
      Origin = 'A.EFFECT_DATE'
    end
    object PkWorkFlowCOMPLETE_DATE: TDateTimeField
      DisplayLabel = 'Date Completed'
      DisplayWidth = 18
      FieldName = 'COMPLETE_DATE'
      Origin = 'A.COMPLETE_DATE'
    end
    object PkWorkFlowCLOSE_DATE: TDateTimeField
      DisplayLabel = 'Date Closed'
      DisplayWidth = 18
      FieldName = 'CLOSE_DATE'
      Origin = 'A.CLOSE_DATE'
    end
    object PkWorkFlowARCUSTO_CUSTNO: TStringField
      DisplayLabel = 'Customer #'
      DisplayWidth = 10
      FieldName = 'ARCUSTO_CUSTNO'
      Origin = 'A.ARCUSTO_CUSTNO'
      Size = 10
    end
    object PkWorkFlowARCUSTO_COMPANY: TStringField
      DisplayLabel = 'Customer Company'
      DisplayWidth = 60
      FieldName = 'ARCUSTO_COMPANY'
      Origin = 'A.ARCUSTO_COMPANY'
      Size = 60
    end
    object PkWorkFlowVENDOR_VENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      DisplayWidth = 10
      FieldName = 'VENDOR_VENDORNO'
      Origin = 'A.VENDOR_VENDORNO'
      Size = 10
    end
    object PkWorkFlowVENDOR_COMPANY: TStringField
      DisplayLabel = 'Vendor Company'
      DisplayWidth = 30
      FieldName = 'VENDOR_COMPANY'
      Origin = 'A.VENDOR_COMPANY'
      Size = 30
    end
    object PkWorkFlowCARNO: TStringField
      DisplayLabel = 'CAR #'
      DisplayWidth = 15
      FieldName = 'CARNO'
      Origin = 'A.CARNO'
      Size = 15
    end
    object PkWorkFlowECONO: TStringField
      DisplayLabel = 'ECO #'
      DisplayWidth = 15
      FieldName = 'ECONO'
      Origin = 'A.ECONO'
      Size = 15
    end
    object PkWorkFlowKIND: TStringField
      DisplayLabel = 'Kind'
      FieldName = 'KIND'
      Origin = 'A.KIND'
      Visible = False
      Size = 10
    end
    object PkWorkFlowDEV_TYPE: TStringField
      FieldName = 'DEV_TYPE'
      Origin = 'A.DEV_TYPE'
      Visible = False
      Size = 10
    end
    object PkWorkFlowID: TBCDField
      Tag = 1
      FieldName = 'ID'
      Origin = 'A.ID'
      Visible = False
      Size = 0
    end
    object PkWorkFlowARCUSTO_ID: TBCDField
      Tag = 1
      FieldName = 'ARCUSTO_ID'
      Origin = 'A.ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object PkWorkFlowEPLANT_ID: TBCDField
      Tag = 1
      FieldName = 'EPLANT_ID'
      Origin = 'A.EPLANT_ID'
      Visible = False
      Size = 0
    end
    object PkWorkFlowWF_TYPE_ID: TBCDField
      Tag = 1
      FieldName = 'WF_TYPE_ID'
      Origin = 'A.WF_TYPE_ID'
      Visible = False
      Size = 0
    end
  end
  object PkCRMQuote: TIQWebHpick
    Tag = 1
    BeforeOpen = DoCRMQuoteBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT a.id AS id,'
      '       a.arcusto_id AS arcusto_id,'
      '       a.contact_id AS contact_id,'
      '       a.rfq AS rfq,'
      '       a.rev AS rev,'
      '       a.project AS project,'
      '       a.quote_date AS quote_date,'
      '       a.expiration_date AS expiration_date,'
      '       a.custno AS arcusto_custno,'
      '       a.company AS arcusto_company,'
      '       a.arcusto_addr1 AS arcusto_addr1,'
      '       a.arcusto_addr2 AS arcusto_addr2,'
      '       a.arcusto_addr3 AS arcusto_addr3,'
      '       a.arcusto_city AS arcusto_city,'
      '       a.arcusto_state AS arcusto_state,'
      '       a.arcusto_zip AS arcusto_zip,'
      '       a.arcusto_country AS arcusto_country,'
      '       a.first_name AS first_name,'
      '       a.last_name AS last_name,'
      '       a.TYPE AS TYPE,'
      '       a.userid AS userid,'
      '       a.assignedto AS assignedto,'
      '       a.assignedby AS assignedby,'
      '       a.assigneddate AS assigneddate,'
      '       a.assignedto_display AS assignedto_display,'
      '       a.eplant_id AS eplant_id,'
      '       a.eplant_name AS eplant_name,'
      '       a.crm_prospect AS crm_prospect,'
      '       a.pk_hide AS pk_hide,'
      '       a.pono AS pono,'
      '       a.opp_no AS opp_no,'
      '       a.bill_to AS bill_to,'
      '       a.billto_addr1 AS billto_addr1,'
      '       a.billto_addr2 AS billto_addr2,'
      '       a.billto_addr3 AS billto_addr3,'
      '       a.billto_city AS billto_city,'
      '       a.billto_state AS billto_state,'
      '       a.billto_zip AS billto_zip,'
      '       a.billto_country AS billto_country,'
      '       a.ship_to AS ship_to,'
      '       a.shipto_addr1 AS shipto_addr1,'
      '       a.shipto_addr2 AS shipto_addr2,'
      '       a.shipto_addr3 AS shipto_addr3,'
      '       a.shipto_city AS shipto_city,'
      '       a.shipto_state AS shipto_state,'
      '       a.shipto_zip AS shipto_zip,'
      '       a.shipto_country AS shipto_country,'
      '       a.lastchangedby AS lastchangedby,'
      '       a.lastchangedate AS lastchangedate,'
      '       a.cuser1 AS cuser1,'
      '       a.cuser2 AS cuser2,'
      '       a.cuser3 AS cuser3,'
      '       a.cuser4 AS cuser4,'
      '       a.cuser5 AS cuser5,'
      '       a.cuser6 AS cuser6,'
      '       a.arinvt_itemno AS arinvt_itemno,'
      '       a.arinvt_descrip AS arinvt_descrip,'
      '       a.arinvt_descrip2 AS arinvt_descrip2,'
      '       a.arinvt_class AS arinvt_class,'
      '       a.arinvt_rev AS arinvt_rev,'
      '       a.cust_itemno AS cust_itemno,'
      '       a.cust_descrip AS cust_descrip,'
      '       a.cust_descrip2 AS cust_descrip2,'
      '       a.cust_rev AS cust_rev,'
      '       a.source_type_display AS source_type_display,'
      '       a.source_display AS source_display,'
      '       a.sales_config_name AS sales_config_name,'
      '       a.config_code AS config_code'
      '  -- HPICK_FROM_START'
      '  FROM v_pk_crm_quote a'
      ' -- HPICK_WHERE_START'
      ' WHERE (:ALL_CUSTOMERS = 1 OR'
      '        :ALL_CUSTOMERS = 0 AND'
      '        a.arcusto_id = :ARCUSTO_ID)')
    OnIQModify = DoIQModify
    OnIQCreateHPickColumn = PkCRMQuoteIQCreateHPickColumn
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 31
    Top = 252
    ParamData = <
      item
        Name = 'ALL_CUSTOMERS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'arcusto_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkCRMQuoteRFQ: TStringField
      DisplayLabel = 'RFQ #'
      FieldName = 'RFQ'
      Origin = 'a.rfq'
      Size = 10
    end
    object PkCRMQuotePROJECT: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 18
      FieldName = 'PROJECT'
      Origin = 'a.project'
      Size = 35
    end
    object PkCRMQuoteQUOTE_DATE: TDateTimeField
      DisplayLabel = 'Quote Date'
      FieldName = 'QUOTE_DATE'
      Origin = 'a.quote_date'
    end
    object PkCRMQuoteEXPIRATION_DATE: TDateTimeField
      DisplayLabel = 'Expiration Date'
      FieldName = 'EXPIRATION_DATE'
      Origin = 'a.expiration_date'
    end
    object PkCRMQuoteFIRST_NAME: TStringField
      DisplayLabel = 'Contact First Name'
      DisplayWidth = 18
      FieldName = 'FIRST_NAME'
      Origin = 'a.first_name'
      Size = 30
    end
    object PkCRMQuoteLAST_NAME: TStringField
      DisplayLabel = 'Contact Last Name'
      DisplayWidth = 18
      FieldName = 'LAST_NAME'
      Origin = 'a.last_name'
      Size = 30
    end
    object PkCRMQuoteTYPE: TBCDField
      DisplayLabel = 'Quote Type'
      FieldName = 'TYPE'
      Origin = 'a.type'
      Size = 0
    end
    object PkCRMQuoteREV: TBCDField
      DisplayLabel = 'Revision'
      FieldName = 'REV'
      Origin = 'a.rev'
      Size = 0
    end
    object PkCRMQuoteID: TBCDField
      Tag = 1
      FieldName = 'ID'
      Origin = 'a.id'
      Visible = False
      Size = 0
    end
    object PkCRMQuoteARCUSTO_ID: TBCDField
      Tag = 1
      FieldName = 'ARCUSTO_ID'
      Origin = 'a.arcusto_id'
      Visible = False
      Size = 0
    end
    object PkCRMQuoteCONTACT_ID: TBCDField
      Tag = 1
      FieldName = 'CONTACT_ID'
      Origin = 'a.contact_id'
      Visible = False
      Size = 0
    end
    object PkCRMQuoteUSERID: TStringField
      DisplayLabel = 'Created By (Login Name)'
      DisplayWidth = 10
      FieldName = 'USERID'
      Origin = 'a.userid'
      Size = 35
    end
    object PkCRMQuoteASSIGNEDTO_DISPLAY: TStringField
      DisplayLabel = 'Assigned To'
      DisplayWidth = 18
      FieldName = 'ASSIGNEDTO_DISPLAY'
      Origin = 'a.assignedto_display'
      Size = 255
    end
    object PkCRMQuoteASSIGNEDTO: TStringField
      DisplayLabel = 'Assigned To (Login Name)'
      DisplayWidth = 18
      FieldName = 'ASSIGNEDTO'
      Origin = 'a.assignedto'
      Size = 35
    end
    object PkCRMQuoteASSIGNEDBY: TStringField
      DisplayLabel = 'Assigned By (Login Name)'
      DisplayWidth = 18
      FieldName = 'ASSIGNEDBY'
      Origin = 'a.assignedby'
      Size = 35
    end
    object PkCRMQuoteASSIGNEDDATE: TDateTimeField
      DisplayLabel = 'Assigned Date'
      DisplayWidth = 18
      FieldName = 'ASSIGNEDDATE'
      Origin = 'a.assigneddate'
    end
    object PkCRMQuoteEPLANT_ID: TBCDField
      Tag = 1
      FieldName = 'EPLANT_ID'
      Origin = 'a.eplant_id'
      Visible = False
      Size = 0
    end
    object PkCRMQuoteCRM_PROSPECT: TStringField
      DisplayLabel = 'CRM Prospect?'
      FieldName = 'CRM_PROSPECT'
      Origin = 'a.crm_prospect'
      Visible = False
      Size = 1
    end
    object PkCRMQuotePK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'a.pk_hide'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object PkCRMQuotePONO: TStringField
      DisplayLabel = 'PO #'
      DisplayWidth = 12
      FieldName = 'PONO'
      Origin = 'a.pono'
      Size = 35
    end
    object PkCRMQuoteARCUSTO_CUSTNO: TStringField
      DisplayLabel = 'Customer #'
      FieldName = 'ARCUSTO_CUSTNO'
      Origin = 'a.custno'
      FixedChar = True
      Size = 10
    end
    object PkCRMQuoteARCUSTO_COMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 18
      FieldName = 'ARCUSTO_COMPANY'
      Origin = 'a.company'
      Size = 60
    end
    object PkCRMQuoteARCUSTO_ADDR1: TStringField
      DisplayLabel = 'Customer Address 1'
      DisplayWidth = 18
      FieldName = 'ARCUSTO_ADDR1'
      Origin = 'a.arcusto_addr1'
      Size = 60
    end
    object PkCRMQuoteARCUSTO_ADDR2: TStringField
      DisplayLabel = 'Customer Address 2'
      DisplayWidth = 18
      FieldName = 'ARCUSTO_ADDR2'
      Origin = 'a.arcusto_addr2'
      Size = 60
    end
    object PkCRMQuoteARCUSTO_ADDR3: TStringField
      DisplayLabel = 'Customer Address 3'
      DisplayWidth = 18
      FieldName = 'ARCUSTO_ADDR3'
      Origin = 'a.arcusto_addr3'
      Size = 60
    end
    object PkCRMQuoteARCUSTO_CITY: TStringField
      DisplayLabel = 'Customer City'
      DisplayWidth = 18
      FieldName = 'ARCUSTO_CITY'
      Origin = 'a.arcusto_city'
      FixedChar = True
      Size = 30
    end
    object PkCRMQuoteARCUSTO_STATE: TStringField
      DisplayLabel = 'Customer State or Region'
      DisplayWidth = 18
      FieldName = 'ARCUSTO_STATE'
      Origin = 'a.arcusto_state'
    end
    object PkCRMQuoteARCUSTO_ZIP: TStringField
      DisplayLabel = 'Customer Postal Code'
      FieldName = 'ARCUSTO_ZIP'
      Origin = 'a.arcusto_zip'
      FixedChar = True
      Size = 10
    end
    object PkCRMQuoteARCUSTO_COUNTRY: TStringField
      DisplayLabel = 'Customer Country'
      DisplayWidth = 18
      FieldName = 'ARCUSTO_COUNTRY'
      Origin = 'a.arcusto_country'
      FixedChar = True
      Size = 100
    end
    object PkCRMQuoteBILL_TO: TStringField
      DisplayLabel = 'Bill To Company'
      DisplayWidth = 18
      FieldName = 'BILL_TO'
      Origin = 'a.bill_to'
      Size = 60
    end
    object PkCRMQuoteBILLTO_ADDR1: TStringField
      DisplayLabel = 'Bill To Address 1'
      DisplayWidth = 18
      FieldName = 'BILLTO_ADDR1'
      Origin = 'a.billto_addr1'
      Size = 60
    end
    object PkCRMQuoteBILLTO_ADDR2: TStringField
      DisplayLabel = 'Bill To Address 2'
      DisplayWidth = 18
      FieldName = 'BILLTO_ADDR2'
      Origin = 'a.billto_addr2'
      Size = 60
    end
    object PkCRMQuoteBILLTO_ADDR3: TStringField
      DisplayLabel = 'Bill To Address 3'
      DisplayWidth = 18
      FieldName = 'BILLTO_ADDR3'
      Origin = 'a.billto_addr3'
      Size = 60
    end
    object PkCRMQuoteBILLTO_CITY: TStringField
      DisplayLabel = 'Bill To City'
      DisplayWidth = 18
      FieldName = 'BILLTO_CITY'
      Origin = 'a.billto_city'
      FixedChar = True
      Size = 30
    end
    object PkCRMQuoteBILLTO_STATE: TStringField
      DisplayLabel = 'Bill To State'
      DisplayWidth = 18
      FieldName = 'BILLTO_STATE'
      Origin = 'a.billto_state'
    end
    object PkCRMQuoteBILLTO_ZIP: TStringField
      DisplayLabel = 'Bill To Postal Code'
      DisplayWidth = 18
      FieldName = 'BILLTO_ZIP'
      Origin = 'a.billto_zip'
      FixedChar = True
      Size = 10
    end
    object PkCRMQuoteBILLTO_COUNTRY: TStringField
      DisplayLabel = 'Bill To Country'
      DisplayWidth = 18
      FieldName = 'BILLTO_COUNTRY'
      Origin = 'a.billto_country'
      FixedChar = True
      Size = 100
    end
    object PkCRMQuoteSHIP_TO: TStringField
      DisplayLabel = 'Ship To Company'
      DisplayWidth = 18
      FieldName = 'SHIP_TO'
      Origin = 'a.ship_to'
      Size = 60
    end
    object PkCRMQuoteSHIPTO_ADDR1: TStringField
      DisplayLabel = 'Ship To Address 1'
      DisplayWidth = 18
      FieldName = 'SHIPTO_ADDR1'
      Origin = 'a.shipto_addr1'
      Size = 60
    end
    object PkCRMQuoteSHIPTO_ADDR2: TStringField
      DisplayLabel = 'Ship To Address 2'
      DisplayWidth = 18
      FieldName = 'SHIPTO_ADDR2'
      Origin = 'a.shipto_addr2'
      Size = 60
    end
    object PkCRMQuoteSHIPTO_ADDR3: TStringField
      DisplayLabel = 'Ship To Address 3'
      DisplayWidth = 18
      FieldName = 'SHIPTO_ADDR3'
      Origin = 'a.shipto_addr3'
      Size = 60
    end
    object PkCRMQuoteSHIPTO_CITY: TStringField
      DisplayLabel = 'Ship To City'
      DisplayWidth = 18
      FieldName = 'SHIPTO_CITY'
      Origin = 'a.shipto_city'
      FixedChar = True
      Size = 30
    end
    object PkCRMQuoteSHIPTO_STATE: TStringField
      DisplayLabel = 'Ship To State'
      DisplayWidth = 18
      FieldName = 'SHIPTO_STATE'
      Origin = 'a.shipto_state'
    end
    object PkCRMQuoteSHIPTO_ZIP: TStringField
      DisplayLabel = 'Ship To Postal Code'
      DisplayWidth = 18
      FieldName = 'SHIPTO_ZIP'
      Origin = 'a.shipto_zip'
      FixedChar = True
      Size = 10
    end
    object PkCRMQuoteSHIPTO_COUNTRY: TStringField
      DisplayLabel = 'Ship To Country'
      DisplayWidth = 18
      FieldName = 'SHIPTO_COUNTRY'
      Origin = 'a.shipto_country'
      FixedChar = True
      Size = 100
    end
    object PkCRMQuoteOPP_NO: TStringField
      DisplayLabel = 'Opportunity #'
      FieldName = 'OPP_NO'
      Origin = 'a.opp_no'
      Size = 10
    end
    object PkCRMQuoteEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant Name'
      DisplayWidth = 18
      FieldName = 'EPLANT_NAME'
      Origin = 'a.eplant_name'
      Size = 30
    end
    object PkCRMQuoteLASTCHANGEDBY: TStringField
      DisplayLabel = 'Last Changed By (Login Name)'
      DisplayWidth = 18
      FieldName = 'LASTCHANGEDBY'
      Origin = 'a.lastchangedby'
      Visible = False
      Size = 35
    end
    object PkCRMQuoteLASTCHANGEDATE: TDateTimeField
      DisplayLabel = 'Last Changed Date'
      DisplayWidth = 18
      FieldName = 'LASTCHANGEDATE'
      Origin = 'a.lastchangedate'
      Visible = False
    end
    object PkCRMQuoteCUSER1: TStringField
      DisplayLabel = 'User Text 1'
      DisplayWidth = 18
      FieldName = 'CUSER1'
      Origin = 'a.cuser1'
      Size = 60
    end
    object PkCRMQuoteCUSER2: TStringField
      DisplayLabel = 'User Text 2'
      DisplayWidth = 18
      FieldName = 'CUSER2'
      Origin = 'a.cuser2'
      Size = 60
    end
    object PkCRMQuoteCUSER3: TStringField
      DisplayLabel = 'User Text 3'
      DisplayWidth = 18
      FieldName = 'CUSER3'
      Origin = 'a.cuser3'
      Size = 60
    end
    object PkCRMQuoteCUSER4: TStringField
      DisplayLabel = 'User Text 4'
      DisplayWidth = 18
      FieldName = 'CUSER4'
      Origin = 'a.cuser4'
      Size = 60
    end
    object PkCRMQuoteCUSER5: TStringField
      DisplayLabel = 'User Text 5'
      DisplayWidth = 18
      FieldName = 'CUSER5'
      Origin = 'a.cuser5'
      Size = 60
    end
    object PkCRMQuoteCUSER6: TStringField
      DisplayLabel = 'User Text 6'
      DisplayWidth = 18
      FieldName = 'CUSER6'
      Origin = 'a.cuser6'
      Size = 60
    end
    object PkCRMQuoteARINVT_ITEMNO: TStringField
      DisplayLabel = 'Inventory Item #'
      DisplayWidth = 18
      FieldName = 'ARINVT_ITEMNO'
      Origin = 'a.arinvt_itemno'
      Size = 50
    end
    object PkCRMQuoteARINVT_DESCRIP: TStringField
      DisplayLabel = 'Inventory Item Description'
      DisplayWidth = 18
      FieldName = 'ARINVT_DESCRIP'
      Origin = 'a.arinvt_descrip'
      Size = 100
    end
    object PkCRMQuoteARINVT_DESCRIP2: TStringField
      DisplayLabel = 'Inventory Item Ext. Description'
      DisplayWidth = 18
      FieldName = 'ARINVT_DESCRIP2'
      Origin = 'a.arinvt_descrip2'
      Size = 100
    end
    object PkCRMQuoteARINVT_CLASS: TStringField
      DisplayLabel = 'Inventory Item Class'
      DisplayWidth = 18
      FieldName = 'ARINVT_CLASS'
      Origin = 'a.arinvt_class'
      Size = 2
    end
    object PkCRMQuoteARINVT_REV: TStringField
      DisplayLabel = 'Inventory Item Revision'
      DisplayWidth = 18
      FieldName = 'ARINVT_REV'
      Origin = 'a.arinvt_rev'
      Size = 15
    end
    object PkCRMQuoteCUST_ITEMNO: TStringField
      DisplayLabel = 'AKA Item #'
      DisplayWidth = 18
      FieldName = 'CUST_ITEMNO'
      Origin = 'a.cust_itemno'
      Size = 50
    end
    object PkCRMQuoteCUST_DESCRIP: TStringField
      DisplayLabel = 'AKA Item Description'
      DisplayWidth = 18
      FieldName = 'CUST_DESCRIP'
      Origin = 'a.cust_descrip'
      Size = 100
    end
    object PkCRMQuoteCUST_DESCRIP2: TStringField
      DisplayLabel = 'AKA Item Ext. Description'
      DisplayWidth = 18
      FieldName = 'CUST_DESCRIP2'
      Origin = 'a.cust_descrip2'
      Size = 100
    end
    object PkCRMQuoteCUST_REV: TStringField
      DisplayLabel = 'AKA Item Revision'
      DisplayWidth = 18
      FieldName = 'CUST_REV'
      Origin = 'a.cust_rev'
      Size = 15
    end
    object PkCRMQuoteSOURCE_TYPE_DISPLAY: TStringField
      DisplayLabel = 'Source'
      DisplayWidth = 12
      FieldName = 'SOURCE_TYPE_DISPLAY'
      Origin = 'a.source_type_display'
      Size = 50
    end
    object PkCRMQuoteSOURCE_DISPLAY: TStringField
      DisplayLabel = 'Source Description'
      DisplayWidth = 18
      FieldName = 'SOURCE_DISPLAY'
      Origin = 'a.source_display'
      Size = 250
    end
    object PkCRMQuoteSALES_CONFIG_NAME: TStringField
      DisplayLabel = 'Sales Configuration'
      DisplayWidth = 22
      FieldName = 'SALES_CONFIG_NAME'
      Origin = 'a.sales_config_name'
      Size = 60
    end
    object PkCRMQuoteCONFIG_CODE: TStringField
      DisplayLabel = 'Config Code'
      DisplayWidth = 18
      FieldName = 'CONFIG_CODE'
      Origin = 'a.config_code'
      Size = 255
    end
  end
  object PkPLM: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT'
      '   a.id as id,'
      '   a.projectno as projectno,'
      '   a.descrip as descrip,'
      '   a.arcusto_id as arcusto_id,'
      '   a.arcusto_custno as arcusto_custno,'
      '   a.arcusto_company as arcusto_company,'
      '   a.contact_id as contact_id,'
      '   a.contact_first_name as contact_first_name,'
      '   a.contact_last_name as contact_last_name,'
      '   a.my_from_date as my_from_date,'
      '   a.my_to_date as my_to_date,'
      '   a.create_date as create_date,'
      '   a.receive_date as receive_date,'
      '   a.status as status,'
      '   a.comment1 as comment1,'
      '   a.archived as archived,'
      '   a.eplant_id as eplant_id,'
      '   a.userid as userid,'
      '   a.cuser1 as cuser1,'
      '   a.cuser2 as cuser2,'
      '   a.cuser3 as cuser3,'
      '   a.cuser4 as cuser4,'
      '   a.cuser5 as cuser5,'
      '   a.cuser6 as cuser6,'
      '   a.cuser7 as cuser7,'
      '   a.cuser8 as cuser8,'
      '   a.cuser9 as cuser9,'
      '   a.cuser10 as cuser10,'
      '   a.nuser1 as nuser1,'
      '   a.nuser2 as nuser2,'
      '   a.nuser3 as nuser3,'
      '   a.nuser4 as nuser4,'
      '   a.nuser5 as nuser5,'
      '   a.nuser6 as nuser6,'
      '   a.nuser7 as nuser7,'
      '   a.nuser8 as nuser8,'
      '   a.nuser9 as nuser9,'
      '   a.nuser10 as nuser10,'
      '   a.division_id as division_id,'
      '   a.alpha as alpha,'
      '   a.beta as beta,'
      '   a.job1 as job1,'
      '   a.pilot as pilot,'
      '   a.mfgtype as mfgtype,'
      '   a.project_name as project_name,'
      '   a.kind as kind,'
      '   a.pk_hide as pk_hide'
      'FROM'
      '   plm a')
    OnIQModify = DoIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 248
    Top = 256
    object PkPLMPROJECTNO: TStringField
      DisplayLabel = 'Project #'
      DisplayWidth = 12
      FieldName = 'PROJECTNO'
      Origin = 'A.PROJECTNO'
      Size = 25
    end
    object PkPLMPROJECT_NAME: TStringField
      DisplayLabel = 'Project Name'
      DisplayWidth = 12
      FieldName = 'PROJECT_NAME'
      Origin = 'A.PROJECT_NAME'
      Size = 100
    end
    object PkPLMDESCRIP: TStringField
      DisplayLabel = 'Project Description'
      DisplayWidth = 12
      FieldName = 'DESCRIP'
      Origin = 'A.DESCRIP'
      Size = 255
    end
    object PkPLMARCUSTO_CUSTNO: TStringField
      DisplayLabel = 'Customer #'
      DisplayWidth = 12
      FieldName = 'ARCUSTO_CUSTNO'
      Origin = 'A.ARCUSTO_CUSTNO'
      Size = 10
    end
    object PkPLMARCUSTO_COMPANY: TStringField
      DisplayLabel = 'Customer Company'
      DisplayWidth = 12
      FieldName = 'ARCUSTO_COMPANY'
      Origin = 'A.ARCUSTO_COMPANY'
      Size = 60
    end
    object PkPLMCONTACT_FIRST_NAME: TStringField
      DisplayLabel = 'Contact First Name'
      DisplayWidth = 12
      FieldName = 'CONTACT_FIRST_NAME'
      Origin = 'A.CONTACT_FIRST_NAME'
      Size = 30
    end
    object PkPLMCONTACT_LAST_NAME: TStringField
      DisplayLabel = 'Contact Last Name'
      DisplayWidth = 12
      FieldName = 'CONTACT_LAST_NAME'
      Origin = 'A.CONTACT_LAST_NAME'
      Size = 30
    end
    object PkPLMMY_FROM_DATE: TStringField
      DisplayLabel = 'Life of Project (From)'
      DisplayWidth = 12
      FieldName = 'MY_FROM_DATE'
      Origin = 'A.MY_FROM_DATE'
    end
    object PkPLMMY_TO_DATE: TStringField
      DisplayLabel = 'Life of Project (To)'
      DisplayWidth = 12
      FieldName = 'MY_TO_DATE'
      Origin = 'A.MY_TO_DATE'
    end
    object PkPLMCREATE_DATE: TDateTimeField
      DisplayLabel = 'Date Created'
      DisplayWidth = 12
      FieldName = 'CREATE_DATE'
      Origin = 'A.CREATE_DATE'
    end
    object PkPLMRECEIVE_DATE: TDateTimeField
      DisplayLabel = 'Date Received'
      DisplayWidth = 12
      FieldName = 'RECEIVE_DATE'
      Origin = 'A.RECEIVE_DATE'
    end
    object PkPLMSTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 12
      FieldName = 'STATUS'
      Origin = 'A.STATUS'
      Size = 25
    end
    object PkPLMKIND: TStringField
      DisplayLabel = 'Kind'
      DisplayWidth = 12
      FieldName = 'KIND'
      Origin = 'A.KIND'
      Visible = False
      Size = 10
    end
    object PkPLMARCHIVED: TStringField
      DisplayLabel = 'Archived'
      DisplayWidth = 12
      FieldName = 'ARCHIVED'
      Origin = 'A.ARCHIVED'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object PkPLMID: TBCDField
      Tag = 1
      DisplayWidth = 12
      FieldName = 'ID'
      Origin = 'A.ID'
      Visible = False
      Size = 0
    end
    object PkPLMARCUSTO_ID: TBCDField
      Tag = 1
      DisplayWidth = 12
      FieldName = 'ARCUSTO_ID'
      Origin = 'A.ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object PkPLMCONTACT_ID: TBCDField
      DisplayWidth = 12
      FieldName = 'CONTACT_ID'
      Origin = 'A.CONTACT_ID'
      Visible = False
      Size = 0
    end
    object PkPLMEPLANT_ID: TBCDField
      Tag = 1
      DisplayWidth = 12
      FieldName = 'EPLANT_ID'
      Origin = 'A.EPLANT_ID'
      Visible = False
      Size = 0
    end
    object PkPLMUSERID: TStringField
      DisplayWidth = 12
      FieldName = 'USERID'
      Origin = 'A.USERID'
      Visible = False
      Size = 35
    end
    object PkPLMCUSER1: TStringField
      DisplayLabel = 'User Text 1'
      DisplayWidth = 12
      FieldName = 'CUSER1'
      Origin = 'A.CUSER1'
      Visible = False
      Size = 60
    end
    object PkPLMCUSER2: TStringField
      DisplayLabel = 'User Text 2'
      DisplayWidth = 12
      FieldName = 'CUSER2'
      Origin = 'A.CUSER2'
      Visible = False
      Size = 60
    end
    object PkPLMCUSER3: TStringField
      DisplayLabel = 'User Text 3'
      DisplayWidth = 12
      FieldName = 'CUSER3'
      Origin = 'A.CUSER3'
      Visible = False
      Size = 60
    end
    object PkPLMCUSER4: TStringField
      DisplayLabel = 'User Text 4'
      DisplayWidth = 12
      FieldName = 'CUSER4'
      Origin = 'A.CUSER4'
      Visible = False
      Size = 60
    end
    object PkPLMCUSER5: TStringField
      DisplayLabel = 'User Text 5'
      DisplayWidth = 12
      FieldName = 'CUSER5'
      Origin = 'A.CUSER5'
      Visible = False
      Size = 60
    end
    object PkPLMCUSER6: TStringField
      DisplayLabel = 'User Text 6'
      DisplayWidth = 12
      FieldName = 'CUSER6'
      Origin = 'A.CUSER6'
      Visible = False
      Size = 60
    end
    object PkPLMCUSER7: TStringField
      DisplayLabel = 'User Text 7'
      DisplayWidth = 12
      FieldName = 'CUSER7'
      Origin = 'A.CUSER7'
      Visible = False
      Size = 60
    end
    object PkPLMCUSER8: TStringField
      DisplayLabel = 'User Text 8'
      DisplayWidth = 12
      FieldName = 'CUSER8'
      Origin = 'A.CUSER8'
      Visible = False
      Size = 60
    end
    object PkPLMCUSER9: TStringField
      DisplayLabel = 'User Text 9'
      DisplayWidth = 12
      FieldName = 'CUSER9'
      Origin = 'A.CUSER9'
      Visible = False
      Size = 60
    end
    object PkPLMCUSER10: TStringField
      DisplayLabel = 'User Text 10'
      DisplayWidth = 12
      FieldName = 'CUSER10'
      Origin = 'A.CUSER10'
      Visible = False
      Size = 60
    end
    object PkPLMNUSER1: TFMTBCDField
      DisplayLabel = 'User Numeric 1'
      DisplayWidth = 12
      FieldName = 'NUSER1'
      Origin = 'A.NUSER1'
      Visible = False
      Size = 6
    end
    object PkPLMNUSER2: TFMTBCDField
      DisplayLabel = 'User Numeric 2'
      DisplayWidth = 12
      FieldName = 'NUSER2'
      Origin = 'A.NUSER2'
      Visible = False
      Size = 6
    end
    object PkPLMNUSER3: TFMTBCDField
      DisplayLabel = 'User Numeric 3'
      DisplayWidth = 12
      FieldName = 'NUSER3'
      Origin = 'A.NUSER3'
      Visible = False
      Size = 6
    end
    object PkPLMNUSER4: TFMTBCDField
      DisplayLabel = 'User Numeric 4'
      DisplayWidth = 12
      FieldName = 'NUSER4'
      Origin = 'A.NUSER4'
      Visible = False
      Size = 6
    end
    object PkPLMNUSER5: TFMTBCDField
      DisplayLabel = 'User Numeric 5'
      DisplayWidth = 12
      FieldName = 'NUSER5'
      Origin = 'A.NUSER5'
      Visible = False
      Size = 6
    end
    object PkPLMNUSER6: TFMTBCDField
      DisplayLabel = 'User Numeric 6'
      DisplayWidth = 12
      FieldName = 'NUSER6'
      Origin = 'A.NUSER6'
      Visible = False
      Size = 6
    end
    object PkPLMNUSER7: TFMTBCDField
      DisplayLabel = 'User Numeric 7'
      DisplayWidth = 12
      FieldName = 'NUSER7'
      Origin = 'A.NUSER7'
      Visible = False
      Size = 6
    end
    object PkPLMNUSER8: TFMTBCDField
      DisplayLabel = 'User Numeric 8'
      DisplayWidth = 12
      FieldName = 'NUSER8'
      Origin = 'A.NUSER8'
      Visible = False
      Size = 6
    end
    object PkPLMNUSER9: TFMTBCDField
      DisplayLabel = 'User Numeric 9'
      DisplayWidth = 12
      FieldName = 'NUSER9'
      Origin = 'A.NUSER9'
      Visible = False
      Size = 6
    end
    object PkPLMNUSER10: TFMTBCDField
      DisplayLabel = 'User Numeric 10'
      DisplayWidth = 12
      FieldName = 'NUSER10'
      Origin = 'A.NUSER10'
      Visible = False
      Size = 6
    end
    object PkPLMDIVISION_ID: TBCDField
      Tag = 1
      DisplayWidth = 12
      FieldName = 'DIVISION_ID'
      Origin = 'A.DIVISION_ID'
      Visible = False
      Size = 0
    end
    object PkPLMALPHA: TDateTimeField
      DisplayWidth = 12
      FieldName = 'ALPHA'
      Origin = 'A.ALPHA'
      Visible = False
    end
    object PkPLMBETA: TDateTimeField
      DisplayWidth = 12
      FieldName = 'BETA'
      Origin = 'A.BETA'
      Visible = False
    end
    object PkPLMJOB1: TDateTimeField
      DisplayWidth = 12
      FieldName = 'JOB1'
      Origin = 'A.JOB1'
      Visible = False
    end
    object PkPLMPILOT: TDateTimeField
      DisplayWidth = 12
      FieldName = 'PILOT'
      Origin = 'A.PILOT'
      Visible = False
    end
    object PkPLMMFGTYPE: TStringField
      DisplayWidth = 12
      FieldName = 'MFGTYPE'
      Origin = 'A.MFGTYPE'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object PkPLMPK_HIDE: TStringField
      DisplayLabel = 'Inactive'
      DisplayWidth = 12
      FieldName = 'PK_HIDE'
      Origin = 'A.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object PkEngineeringQuote: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT b.rfq AS rfq, '
      '       b.project AS project,'
      '       b.quote_date AS quote_date, '
      '       b.quote_rev AS quote_rev,'
      '       b.id AS id,'
      '       b.eplant_id AS eplant_id,'
      '       b.mfgno AS mfgno,'
      '       b.mfg_type AS mfg_type,'
      '       b.mfgcell AS mfgcell,'
      '       b.expiry_date AS expiry_date,'
      '       b.due_date AS due_date,'
      '       a.custno AS custno,'
      '       a.company AS company,'
      '       a.addr1 AS addr1,'
      '       a.addr2 AS addr2,'
      '       a.addr3 AS addr3,'
      '       a.city AS city,'
      '       a.state AS state,'
      '       a.zip AS zip,'
      '       a.country AS country'
      '  FROM arcusto a, quote b'
      ' WHERE a.id(+) = b.arcusto_id AND'
      '       NVL(b.archived, '#39'N'#39') = '#39'N'#39' AND'
      '       misc.Eplant_Filter(b.eplant_id) = 1')
    OnIQModify = DoIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 344
    Top = 256
    object PkEngineeringQuoteRFQ: TStringField
      DisplayLabel = 'RFQ #'
      DisplayWidth = 18
      FieldName = 'RFQ'
      Origin = 'b.rfq'
      FixedChar = True
    end
    object PkEngineeringQuotePROJECT: TStringField
      DisplayLabel = 'Project'
      DisplayWidth = 18
      FieldName = 'PROJECT'
      Origin = 'b.project'
      Size = 255
    end
    object PkEngineeringQuoteQUOTE_DATE: TDateTimeField
      DisplayLabel = 'Quote Date'
      DisplayWidth = 18
      FieldName = 'QUOTE_DATE'
      Origin = 'b.quote_date'
    end
    object PkEngineeringQuoteQUOTE_REV: TBCDField
      DisplayLabel = 'Revision'
      DisplayWidth = 18
      FieldName = 'QUOTE_REV'
      Origin = 'b.quote_rev'
      Size = 0
    end
    object PkEngineeringQuoteID: TBCDField
      DisplayWidth = 18
      FieldName = 'ID'
      Origin = 'b.id'
      Visible = False
      Size = 0
    end
    object PkEngineeringQuoteEPLANT_ID: TBCDField
      DisplayWidth = 18
      FieldName = 'EPLANT_ID'
      Origin = 'b.eplant_id'
      Visible = False
      Size = 0
    end
    object PkEngineeringQuoteMFGNO: TStringField
      DisplayLabel = 'MFG #'
      DisplayWidth = 18
      FieldName = 'MFGNO'
      Origin = 'b.mfgno'
      Size = 50
    end
    object PkEngineeringQuoteMFG_TYPE: TStringField
      DisplayLabel = 'MFG Type'
      DisplayWidth = 18
      FieldName = 'MFG_TYPE'
      Origin = 'b.mfg_type'
      FixedChar = True
      Size = 10
    end
    object PkEngineeringQuoteMFGCELL: TStringField
      DisplayLabel = 'MFG Cell'
      DisplayWidth = 18
      FieldName = 'MFGCELL'
      Origin = 'b.mfgcell'
      FixedChar = True
      Size = 15
    end
    object PkEngineeringQuoteEXPIRY_DATE: TDateTimeField
      DisplayLabel = 'Expiration Date'
      DisplayWidth = 18
      FieldName = 'EXPIRY_DATE'
      Origin = 'b.expiry_date'
    end
    object PkEngineeringQuoteDUE_DATE: TDateTimeField
      DisplayLabel = 'Due Date'
      DisplayWidth = 18
      FieldName = 'DUE_DATE'
      Origin = 'b.due_date'
    end
    object PkEngineeringQuoteCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      DisplayWidth = 18
      FieldName = 'CUSTNO'
      Origin = 'a.custno'
      FixedChar = True
      Size = 10
    end
    object PkEngineeringQuoteCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 18
      FieldName = 'COMPANY'
      Origin = 'a.company'
      Size = 60
    end
    object PkEngineeringQuoteADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 18
      FieldName = 'ADDR1'
      Origin = 'a.addr1'
      Size = 60
    end
    object PkEngineeringQuoteADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 18
      FieldName = 'ADDR2'
      Origin = 'a.addr2'
      Size = 60
    end
    object PkEngineeringQuoteADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 18
      FieldName = 'ADDR3'
      Origin = 'a.addr3'
      Size = 60
    end
    object PkEngineeringQuoteCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 18
      FieldName = 'CITY'
      Origin = 'a.city'
      FixedChar = True
      Size = 30
    end
    object PkEngineeringQuoteSTATE: TStringField
      DisplayLabel = 'State or Region'
      DisplayWidth = 18
      FieldName = 'STATE'
      Origin = 'a.state'
    end
    object PkEngineeringQuoteZIP: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 18
      FieldName = 'ZIP'
      Origin = 'a.zip'
      FixedChar = True
      Size = 10
    end
    object PkEngineeringQuoteCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 18
      FieldName = 'COUNTRY'
      Origin = 'a.country'
      FixedChar = True
      Size = 100
    end
  end
  object PkSupport: TIQWebHpick
    Tag = 1
    BeforeOpen = PkSupportBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereChanged
    SQL.Strings = (
      'SELECT id AS id,'
      '       startdate AS startdate,'
      '       finishdate AS finishdate,'
      '       status AS status,'
      '       assignedto_login_name AS assignedto_login_name,'
      '       assignedto_display AS assignedto_display,'
      '       user_id AS user_id,'
      '       created AS created,'
      '       changed AS changed,'
      '       changedby AS changedby,'
      '       summary AS summary,'
      '       queue_name AS queue_name,'
      '       subqueue_name AS subqueue_name,'
      '       companyno AS companyno,'
      '       company AS company,'
      '       customer_addr1 AS customer_addr1,'
      '       customer_addr2 AS customer_addr2,'
      '       customer_addr3 AS customer_addr3,'
      '       customer_city AS customer_city,'
      '       customer_state AS customer_state,'
      '       customer_zip AS customer_zip,'
      '       customer_country AS customer_country,'
      '       customer_phone_number AS customer_phone_number,'
      '       customer_ext AS customer_ext,'
      '       customer_fax_number AS customer_fax_number,'
      '       first_name AS first_name,'
      '       middle_name AS middle_name,'
      '       last_name AS last_name,'
      '       contact_title AS contact_title,'
      '       contact_phone_number AS contact_phone_number,'
      '       contact_ext AS contact_ext,'
      '       contact_fax_number AS contact_fax_number,'
      '       contact_email AS contact_email,'
      '       bill_to_attn AS bill_to_attn,'
      '       ship_to_attn AS ship_to_attn,'
      '       activity_type_name AS activity_type_name,'
      '       severity_name AS severity_name,'
      '       severity_color AS severity_color'
      '  FROM v_pk_crm_support'
      ' WHERE (:ARCHIVED_SHOW_ALL = 1 OR'
      '        :archived_show_all = 0 AND'
      '        NVL(archived, '#39'N'#39') = :ARCHIVED) AND'
      '       (:MY_CRM_TODAY = 0 AND'
      
        '        iqms.iqcrm.assignedto_filter(assignedto_login_name) = 1 ' +
        'OR'
      '        :MY_CRM_TODAY = 1 AND'
      '        assignedto_login_name = iqms.misc.getusername) AND'
      '       (:MY_CRM_TODAY = 1 OR'
      '        :MY_CRM_TODAY = 0 AND'
      '        iqms.iqcrm.principle_filter(principle_source,'
      '                                    principle_source_id,'
      '                                    contact_id,'
      
        '                                    principle_crm_prospect) = 1)' +
        ' AND'
      '       (:BY_RANGE = 0 OR'
      '        :BY_RANGE = 1 AND'
      '        startdate BETWEEN TO_DATE(:START_DATETIME,'
      '                                  '#39'MM/DD/RRRR HH24:MI'#39')'
      '                      AND  TO_DATE(:END_DATETIME,'
      '                                   '#39'MM/DD/RRRR HH24:MI'#39'))')
    OnIQModify = DoIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 242
    Top = 129
    ParamData = <
      item
        Name = 'archived_show_all'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'ARCHIVED'
        DataType = ftString
        ParamType = ptInput
        Value = 'N'
      end
      item
        Name = 'MY_CRM_TODAY'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'BY_RANGE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'START_DATETIME'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'END_DATETIME'
        DataType = ftString
        ParamType = ptInput
      end>
    object PkSupportID: TBCDField
      DisplayLabel = 'Issue #'
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'a.id'
      Size = 0
    end
    object PkSupportSTARTDATE: TDateTimeField
      DisplayLabel = 'Issue Start'
      DisplayWidth = 10
      FieldName = 'STARTDATE'
      Origin = 'a.startdate'
    end
    object PkSupportFINISHDATE: TDateTimeField
      DisplayLabel = 'Issue Finish'
      DisplayWidth = 10
      FieldName = 'FINISHDATE'
      Origin = 'a.finishdate'
    end
    object PkSupportSTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 10
      FieldName = 'STATUS'
      Origin = 'a.status'
    end
    object PkSupportASSIGNEDTO_LOGIN_NAME: TStringField
      DisplayLabel = 'Assigned To Login Name'
      DisplayWidth = 30
      FieldName = 'ASSIGNEDTO_LOGIN_NAME'
      Origin = 'a.assignedto_login_name'
      Size = 35
    end
    object PkSupportASSIGNEDTO_DISPLAY: TStringField
      DisplayLabel = 'Assigned To'
      DisplayWidth = 35
      FieldName = 'ASSIGNEDTO_DISPLAY'
      Origin = 'a.assignedto_display'
      Size = 255
    end
    object PkSupportCREATED: TDateTimeField
      DisplayLabel = 'Created'
      FieldName = 'CREATED'
    end
    object PkSupportUSER_ID: TStringField
      DisplayLabel = 'Created By'
      DisplayWidth = 10
      FieldName = 'USER_ID'
      Origin = 'a.user_id'
      Size = 35
    end
    object PkSupportSUMMARY: TStringField
      DisplayLabel = 'Regarding'
      DisplayWidth = 10
      FieldName = 'SUMMARY'
      Origin = 'a.summary'
      Size = 255
    end
    object PkSupportQUEUE_NAME: TStringField
      DisplayLabel = 'Queue'
      DisplayWidth = 10
      FieldName = 'QUEUE_NAME'
      Origin = 'a.queue_name'
      FixedChar = True
      Size = 35
    end
    object PkSupportSUBQUEUE_NAME: TStringField
      DisplayLabel = 'Subqueue'
      DisplayWidth = 10
      FieldName = 'SUBQUEUE_NAME'
      Origin = 'a.subqueue_name'
      Size = 255
    end
    object PkSupportCOMPANYNO: TStringField
      DisplayLabel = 'Company #'
      DisplayWidth = 18
      FieldName = 'COMPANYNO'
      Origin = 'a.companyno'
      Size = 25
    end
    object PkSupportCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 10
      FieldName = 'COMPANY'
      Origin = 'a.company'
      Size = 60
    end
    object PkSupportCUSTOMER_ADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 10
      FieldName = 'CUSTOMER_ADDR1'
      Origin = 'a.CUSTOMER_ADDR1'
      Size = 60
    end
    object PkSupportCUSTOMER_ADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 10
      FieldName = 'CUSTOMER_ADDR2'
      Origin = 'a.CUSTOMER_ADDR2'
      Size = 60
    end
    object PkSupportCUSTOMER_ADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 10
      FieldName = 'CUSTOMER_ADDR3'
      Origin = 'a.CUSTOMER_ADDR3'
      Size = 60
    end
    object PkSupportCUSTOMER_CITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 10
      FieldName = 'CUSTOMER_CITY'
      Origin = 'a.CUSTOMER_CITY'
      Size = 30
    end
    object PkSupportCUSTOMER_STATE: TStringField
      DisplayLabel = 'State or Region'
      DisplayWidth = 10
      FieldName = 'CUSTOMER_STATE'
      Origin = 'a.CUSTOMER_STATE'
    end
    object PkSupportCUSTOMER_ZIP: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 10
      FieldName = 'CUSTOMER_ZIP'
      Origin = 'a.CUSTOMER_ZIP'
      FixedChar = True
      Size = 10
    end
    object PkSupportCUSTOMER_COUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 22
      FieldName = 'CUSTOMER_COUNTRY'
      Origin = 'a.customer_country'
      Size = 100
    end
    object PkSupportCUSTOMER_PHONE_NUMBER: TStringField
      DisplayLabel = 'Company Telephone #'
      DisplayWidth = 10
      FieldName = 'CUSTOMER_PHONE_NUMBER'
      Origin = 'a.CUSTOMER_PHONE_NUMBER'
      Size = 25
    end
    object PkSupportCUSTOMER_EXT: TStringField
      DisplayLabel = 'Company Extension'
      DisplayWidth = 10
      FieldName = 'CUSTOMER_EXT'
      Origin = 'a.CUSTOMER_EXT'
      FixedChar = True
      Size = 5
    end
    object PkSupportCUSTOMER_FAX_NUMBER: TStringField
      DisplayLabel = 'Company Fax #'
      DisplayWidth = 10
      FieldName = 'CUSTOMER_FAX_NUMBER'
      Origin = 'a.CUSTOMER_FAX_NUMBER'
      Size = 25
    end
    object PkSupportFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 10
      FieldName = 'FIRST_NAME'
      Origin = 'a.FIRST_NAME'
      Size = 30
    end
    object PkSupportMIDDLE_NAME: TStringField
      DisplayLabel = 'Middle Name'
      DisplayWidth = 10
      FieldName = 'MIDDLE_NAME'
      Origin = 'a.middle_name'
      Size = 30
    end
    object PkSupportLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 10
      FieldName = 'LAST_NAME'
      Origin = 'a.LAST_NAME'
      Size = 30
    end
    object PkSupportCONTACT_TITLE: TStringField
      DisplayLabel = 'Contact Title'
      DisplayWidth = 10
      FieldName = 'CONTACT_TITLE'
      Origin = 'a.CONTACT_TITLE'
      Size = 60
    end
    object PkSupportCONTACT_PHONE_NUMBER: TStringField
      DisplayLabel = 'Contact Telephone #'
      DisplayWidth = 10
      FieldName = 'CONTACT_PHONE_NUMBER'
      Origin = 'a.CONTACT_PHONE_NUMBER'
      Size = 25
    end
    object PkSupportCONTACT_EXT: TStringField
      DisplayLabel = 'Contact Ext'
      DisplayWidth = 10
      FieldName = 'CONTACT_EXT'
      Origin = 'a.CONTACT_EXT'
      Size = 25
    end
    object PkSupportCONTACT_FAX_NUMBER: TStringField
      DisplayLabel = 'Contact Fax #'
      DisplayWidth = 10
      FieldName = 'CONTACT_FAX_NUMBER'
      Origin = 'a.CONTACT_FAX_NUMBER'
      Size = 25
    end
    object PkSupportCONTACT_EMAIL: TStringField
      DisplayLabel = 'Contact Email'
      DisplayWidth = 10
      FieldName = 'CONTACT_EMAIL'
      Origin = 'a.CONTACT_EMAIL'
      Size = 250
    end
    object PkSupportBILL_TO_ATTN: TStringField
      DisplayLabel = 'Bill To'
      DisplayWidth = 25
      FieldName = 'BILL_TO_ATTN'
      Origin = 'b.attn'
      Size = 60
    end
    object PkSupportSHIP_TO_ATTN: TStringField
      DisplayLabel = 'Ship To'
      DisplayWidth = 25
      FieldName = 'SHIP_TO_ATTN'
      Origin = 's.attn'
      Size = 60
    end
    object PkSupportACTIVITY_TYPE_NAME: TStringField
      DisplayLabel = 'Status Type'
      DisplayWidth = 20
      FieldName = 'ACTIVITY_TYPE_NAME'
      Origin = 'A.ACTIVITY_TYPE_NAME'
      FixedChar = True
      Size = 35
    end
    object PkSupportSEVERITY_NAME: TStringField
      DisplayLabel = 'Severity Type'
      DisplayWidth = 18
      FieldName = 'SEVERITY_NAME'
      Origin = 'severity_name'
      Size = 35
    end
    object PkSupportSEVERITY_COLOR: TBCDField
      FieldName = 'SEVERITY_COLOR'
      Origin = 'severity_color'
      Visible = False
      Size = 0
    end
    object PkSupportCHANGED: TDateTimeField
      DisplayLabel = 'Changed'
      FieldName = 'CHANGED'
      Origin = 'a.changed'
    end
    object PkSupportCHANGEDBY: TStringField
      DisplayLabel = 'Changed By'
      FieldName = 'CHANGEDBY'
      Origin = 'a.changedby'
      Size = 30
    end
  end
  object PkBillTo: TIQWebHpick
    Tag = 1
    BeforeOpen = AssignMasterFilter
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT bill_to.id AS id, bill_to.arcusto_id AS arcusto_id,'
      
        '       bill_to.prime_contact AS prime_contact, bill_to.attn AS a' +
        'ttn,'
      
        '       bill_to.addr1 AS addr1, bill_to.addr2 AS addr2, bill_to.a' +
        'ddr3 AS addr3,'
      
        '       bill_to.city AS city, bill_to.state AS state, bill_to.zip' +
        ' AS zip,'
      '       arcusto.custno AS custno, arcusto.company AS company,'
      '       NVL(bill_to.pk_hide, '#39'N'#39') AS pk_hide'
      '  FROM arcusto, bill_to'
      ' WHERE (:BY_MASTER_ID = 0 OR'
      '        :BY_MASTER_ID = 1 AND arcusto.id = :MASTER_ID) AND'
      '       bill_to.arcusto_id = arcusto.id')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 24
    Top = 362
    ParamData = <
      item
        Name = 'BY_MASTER_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'MASTER_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkBillToID: TBCDField
      DisplayWidth = 12
      FieldName = 'ID'
      Origin = 'BILL_TO.ID'
      Visible = False
      Size = 0
    end
    object PkBillToARCUSTO_ID: TBCDField
      DisplayWidth = 12
      FieldName = 'ARCUSTO_ID'
      Origin = 'BILL_TO.ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object PkBillToPRIME_CONTACT: TStringField
      DisplayLabel = 'Prime Contact'
      DisplayWidth = 12
      FieldName = 'PRIME_CONTACT'
      Origin = 'BILL_TO.PRIME_CONTACT'
      FixedChar = True
      Size = 30
    end
    object PkBillToATTN: TStringField
      DisplayLabel = 'Attention'
      DisplayWidth = 12
      FieldName = 'ATTN'
      Origin = 'BILL_TO.ATTN'
      FixedChar = True
      Size = 60
    end
    object PkBillToADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 12
      FieldName = 'ADDR1'
      Origin = 'BILL_TO.ADDR1'
      FixedChar = True
      Size = 60
    end
    object PkBillToADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 12
      FieldName = 'ADDR2'
      Origin = 'BILL_TO.ADDR2'
      FixedChar = True
      Size = 60
    end
    object PkBillToADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 12
      FieldName = 'ADDR3'
      Origin = 'BILL_TO.ADDR3'
      FixedChar = True
      Size = 60
    end
    object PkBillToCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 12
      FieldName = 'CITY'
      Origin = 'BILL_TO.CITY'
      FixedChar = True
      Size = 30
    end
    object PkBillToSTATE: TStringField
      DisplayLabel = 'State or Region'
      DisplayWidth = 12
      FieldName = 'STATE'
      Origin = 'BILL_TO.STATE'
      FixedChar = True
    end
    object PkBillToZIP: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 12
      FieldName = 'ZIP'
      Origin = 'BILL_TO.ZIP'
      FixedChar = True
      Size = 10
    end
    object PkBillToPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      Size = 1
    end
    object PkBillToCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      FieldName = 'CUSTNO'
      Origin = 'ARCUSTO.CUSTNO'
      FixedChar = True
      Size = 10
    end
    object PkBillToCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 22
      FieldName = 'COMPANY'
      Origin = 'ARCUSTO.COMPANY'
      Size = 60
    end
  end
  object PkShipTo: TIQWebHpick
    Tag = 1
    BeforeOpen = AssignMasterFilter
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT ship_to.id AS id, ship_to.arcusto_id AS arcusto_id,'
      
        '       ship_to.prime_contact AS prime_contact, ship_to.attn AS a' +
        'ttn,'
      
        '       ship_to.addr1 AS addr1, ship_to.addr2 AS addr2, ship_to.a' +
        'ddr3 AS addr3,'
      
        '       ship_to.city AS city, ship_to.state AS state, ship_to.zip' +
        ' AS zip,'
      '       arcusto.custno AS custno, arcusto.company AS company,'
      '       eplant.name AS eplant, ship_to.pk_hide AS pk_hide'
      '  FROM arcusto, ship_to, eplant'
      ' WHERE (:BY_MASTER_ID = 0 OR'
      '        :BY_MASTER_ID = 1 AND arcusto.id = :MASTER_ID) AND'
      '       ship_to.arcusto_id = arcusto.id AND'
      '       eplant.id(+) = ship_to.eplant_id')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 80
    Top = 362
    ParamData = <
      item
        Name = 'BY_MASTER_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'MASTER_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkShipToID: TBCDField
      DisplayWidth = 12
      FieldName = 'ID'
      Origin = 'SHIP_TO.ID'
      Visible = False
      Size = 0
    end
    object PkShipToARCUSTO_ID: TBCDField
      DisplayWidth = 12
      FieldName = 'ARCUSTO_ID'
      Origin = 'SHIP_TO.ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object PkShipToPRIME_CONTACT: TStringField
      DisplayLabel = 'Prime Contact'
      DisplayWidth = 12
      FieldName = 'PRIME_CONTACT'
      Origin = 'SHIP_TO.PRIME_CONTACT'
      FixedChar = True
      Size = 30
    end
    object PkShipToATTN: TStringField
      DisplayLabel = 'Attention'
      DisplayWidth = 12
      FieldName = 'ATTN'
      Origin = 'SHIP_TO.ATTN'
      FixedChar = True
      Size = 60
    end
    object PkShipToADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 12
      FieldName = 'ADDR1'
      Origin = 'SHIP_TO.ADDR1'
      FixedChar = True
      Size = 60
    end
    object PkShipToADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 12
      FieldName = 'ADDR2'
      Origin = 'SHIP_TO.ADDR2'
      FixedChar = True
      Size = 60
    end
    object PkShipToADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 12
      FieldName = 'ADDR3'
      Origin = 'SHIP_TO.ADDR3'
      FixedChar = True
      Size = 60
    end
    object PkShipToCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 12
      FieldName = 'CITY'
      Origin = 'SHIP_TO.CITY'
      FixedChar = True
      Size = 30
    end
    object PkShipToSTATE: TStringField
      DisplayLabel = 'State or Region'
      DisplayWidth = 12
      FieldName = 'STATE'
      Origin = 'SHIP_TO.STATE'
      FixedChar = True
    end
    object PkShipToZIP: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 12
      FieldName = 'ZIP'
      Origin = 'SHIP_TO.ZIP'
      FixedChar = True
      Size = 10
    end
    object PkShipToEPLANT: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 12
      FieldName = 'EPLANT'
      Origin = 'eplant.name'
      Size = 30
    end
    object PkShipToPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'SHIP_TO.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object PkShipToCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      FieldName = 'CUSTNO'
      Origin = 'ARCUSTO.CUSTNO'
      FixedChar = True
      Size = 10
    end
    object PkShipToCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 22
      FieldName = 'COMPANY'
      Origin = 'ARCUSTO.COMPANY'
      Size = 60
    end
  end
  object PkArinvtBase: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select'
      '  a.id as id,'
      '  a.itemno as itemno,'
      '  a.descrip as descrip,'
      '  a.descrip2 as descrip2,'
      '  a.class as class,'
      '  a.rev as rev,'
      '  a.config_code as config_code,'
      '  a.pk_hide as pk_hide,'
      '  a.eplant_id as eplant_id,'
      '  b.name as eplant_name'
      'from'
      '  arinvt a, eplant b'
      'where'
      '  b.id(+) = a.eplant_id'
      '  and iqms.misc.Eplant_Filter(a.eplant_id) = 1'
      '  and a.cloned_from_arinvt_id is null'
      ''
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 432
    Top = 128
    object FloatField1: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'A.ID'
      Visible = False
      Size = 0
    end
    object StringField1: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 10
      FieldName = 'ITEMNO'
      Origin = 'A.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object StringField2: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 10
      FieldName = 'DESCRIP'
      Origin = 'A.DESCRIP'
      Size = 100
    end
    object StringField3: TStringField
      DisplayLabel = 'Extended Description'
      DisplayWidth = 10
      FieldName = 'DESCRIP2'
      Origin = 'A.DESCRIP2'
      Size = 100
    end
    object StringField4: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 10
      FieldName = 'CLASS'
      Origin = 'A.CLASS'
      FixedChar = True
      Size = 2
    end
    object StringField5: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 10
      FieldName = 'REV'
      Origin = 'A.REV'
      FixedChar = True
      Size = 15
    end
    object PkArinvtBaseCONFIG_CODE: TStringField
      DisplayLabel = 'Config Code'
      DisplayWidth = 18
      FieldName = 'CONFIG_CODE'
      Origin = 'a.config_code'
      Size = 255
    end
    object StringField6: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 18
      FieldName = 'EPLANT_NAME'
      Origin = 'B.NAME'
      Size = 30
    end
    object FloatField2: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'A.EPLANT_ID'
      Size = 0
    end
    object StringField7: TStringField
      DisplayWidth = 10
      FieldName = 'PK_HIDE'
      Origin = 'A.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object PkAddressLookup: TIQWebHpick
    BeforeOpen = PkAddressLookupBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'SELECT DISTINCT addr1 AS addr1, addr2 AS addr2, addr3 AS addr3, ' +
        'city AS city,'
      '                state AS state, zip AS zip, country AS country,'
      
        '                phone_number AS phone_number, fax_number AS fax_' +
        'number'
      '  FROM v_arcusto_address'
      ' WHERE id = :ARCUSTO_ID')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 168
    Top = 360
    ParamData = <
      item
        Name = 'ARCUSTO_ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object PkAddressLookupADDR1: TStringField
      DisplayLabel = 'Address 1'
      FieldName = 'ADDR1'
      Origin = '1'
      Size = 60
    end
    object PkAddressLookupADDR2: TStringField
      DisplayLabel = 'Address 2'
      FieldName = 'ADDR2'
      Origin = '2'
      Size = 60
    end
    object PkAddressLookupADDR3: TStringField
      DisplayLabel = 'Address 3'
      FieldName = 'ADDR3'
      Origin = '3'
      Size = 60
    end
    object PkAddressLookupCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Origin = '4'
      Size = 30
    end
    object PkAddressLookupSTATE: TStringField
      DisplayLabel = 'State or Region'
      FieldName = 'STATE'
      Origin = '5'
    end
    object PkAddressLookupZIP: TStringField
      DisplayLabel = 'Postal Code'
      FieldName = 'ZIP'
      Origin = '6'
      Size = 10
    end
    object PkAddressLookupCOUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      Origin = '7'
      Size = 100
    end
    object PkAddressLookupPHONE_NUMBER: TStringField
      DisplayLabel = 'Telephone #'
      FieldName = 'PHONE_NUMBER'
      Origin = '8'
      Size = 25
    end
    object PkAddressLookupFAX_NUMBER: TStringField
      DisplayLabel = 'Fax #'
      FieldName = 'FAX_NUMBER'
      Origin = '9'
      Size = 25
    end
  end
  object PkTiers: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        '  SELECT id, descrip, '#39'CUST_TYPE'#39' as source, '#39'Multiple Addresses' +
        #39' as email,'
      '         descrip as source_disp'
      '    FROM cust_type'
      'ORDER BY descrip')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 248
    Top = 360
    object PkTiersID: TBCDField
      FieldName = 'ID'
      Origin = 'a.id'
      Visible = False
      Size = 0
    end
    object PkTiersDESCRIP: TStringField
      DisplayLabel = 'Tier Type'
      FieldName = 'DESCRIP'
      Origin = 'a.descrip'
      Size = 50
    end
    object PkTiersSOURCE: TStringField
      FieldName = 'SOURCE'
      Visible = False
      FixedChar = True
      Size = 9
    end
    object PkTiersEMAIL: TStringField
      FieldName = 'EMAIL'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object PkTiersSOURCE_DISP: TStringField
      FieldName = 'SOURCE_DISP'
      Visible = False
      Size = 50
    end
  end
  object PkSalesStage: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT id,'
      '       code,'
      '       descrip,'
      '       access_level,'
      '       anchor'
      '  FROM sales_stage')
    OnIQModify = DoIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 332
    Top = 360
    object PkSalesStageID: TBCDField
      FieldName = 'ID'
      Origin = 'SALES_STAGE.ID'
      Visible = False
      Size = 0
    end
    object PkSalesStageCODE: TStringField
      DisplayLabel = 'Code'
      FieldName = 'CODE'
      Origin = 'SALES_STAGE.CODE'
      Size = 15
    end
    object PkSalesStageDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'SALES_STAGE.DESCRIP'
      Size = 25
    end
    object PkSalesStageACCESS_LEVEL: TBCDField
      DisplayLabel = 'Access Level'
      FieldName = 'ACCESS_LEVEL'
      Origin = 'SALES_STAGE.ACCESS_LEVEL'
      Size = 0
    end
    object PkSalesStageANCHOR: TStringField
      DisplayLabel = 'Anchor?'
      FieldName = 'ANCHOR'
      Origin = 'SALES_STAGE.ANCHOR'
      Size = 1
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
    Left = 344
    Top = 200
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
  object PkOpportunityForCustomer: TIQWebHpick
    BeforeOpen = PkOpportunityForCustomerBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT a.status_description AS status_description,'
      '       a.status_date AS status_date,'
      '       a.VALUE AS VALUE,'
      '       a.date_opened AS date_opened,'
      '       a.date_closed_expect AS date_closed_expect,'
      '       a.date_closed_actual AS date_closed_actual,'
      '       a.pk_hide AS pk_hide,'
      '       a.opp_no AS opp_no,'
      '       a.description AS description,'
      '       a.principle_companyno AS principle_companyno,'
      '       a.principle_company AS principle_company,'
      '       a.principle_addr1 AS principle_addr1,'
      '       a.principle_addr2 AS principle_addr2,'
      '       a.principle_addr3 AS principle_addr3,'
      '       a.principle_city AS principle_city,'
      '       a.principle_state AS principle_state,'
      '       a.principle_zip AS principle_zip,'
      '       a.principle_country AS principle_country,'
      '       a.principle_company_ext AS principle_company_ext,'
      '       a.principle_company_fax AS principle_company_fax,'
      '       a.principle_company_phone AS principle_company_phone,'
      '       a.principle_company_url AS principle_company_url,'
      '       a.principle_first_name AS principle_first_name,'
      '       a.principle_middle_name AS principle_middle_name,'
      '       a.principle_last_name AS principle_last_name,'
      '       a.principle_title AS principle_title,'
      '       a.principle_contact_email AS principle_contact_email,'
      '       a.principle_contact_phone AS principle_contact_phone,'
      '       a.principle_contact_ext AS principle_contact_ext,'
      '       a.principle_contact_fax AS principle_contact_fax,'
      '       a.principle_crm_prospect AS principle_crm_prospect,'
      '       a.status_code AS status_code,'
      '       a.assignedto_display AS assignedto_display,'
      '       a.assignedto AS assignedto,'
      '       a.sales_stage_code AS sales_stage_code,'
      '       a.id AS id,'
      '       a.cuser1 AS cuser1,'
      '       a.cuser2 AS cuser2,'
      '       a.cuser3 AS cuser3,'
      '       a.cuser4 AS cuser4,'
      '       a.cuser5 AS cuser5'
      '  FROM v_crm_opportunity_central a'
      ' WHERE a.principle_source = '#39'ARCUSTO'#39' AND'
      '       a.principle_source_id = :ARCUSTO_ID')
    OnIQModify = PkOpportunityForCustomerIQModify
    OnIQCreateHPickColumn = PkOpportunityIQCreateHPickColumn
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 248
    Top = 304
    ParamData = <
      item
        Name = 'ARCUSTO_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkOpportunityForCustomerID: TBCDField
      DisplayWidth = 12
      FieldName = 'ID'
      Origin = 'A.ID'
      Visible = False
      Size = 0
    end
    object PkOpportunityForCustomerOPP_NO: TStringField
      DisplayLabel = 'Opportunity #'
      DisplayWidth = 12
      FieldName = 'OPP_NO'
      Origin = 'A.OPP_NO'
      Size = 10
    end
    object PkOpportunityForCustomerDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 18
      FieldName = 'DESCRIPTION'
      Origin = 'A.DESCRIPTION'
      Size = 60
    end
    object PkOpportunityForCustomerPRINCIPLE_COMPANYNO: TStringField
      DisplayLabel = 'Company #'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_COMPANYNO'
      Origin = 'A.PRINCIPLE_COMPANYNO'
      Size = 25
    end
    object PkOpportunityForCustomerPRINCIPLE_COMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_COMPANY'
      Origin = 'A.PRINCIPLE_COMPANY'
      Size = 60
    end
    object PkOpportunityForCustomerPRINCIPLE_ADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_ADDR1'
      Origin = 'A.PRINCIPLE_ADDR1'
      Size = 60
    end
    object PkOpportunityForCustomerPRINCIPLE_ADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_ADDR2'
      Origin = 'A.PRINCIPLE_ADDR2'
      Size = 60
    end
    object PkOpportunityForCustomerPRINCIPLE_ADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_ADDR3'
      Origin = 'A.PRINCIPLE_ADDR3'
      Size = 60
    end
    object PkOpportunityForCustomerPRINCIPLE_CITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_CITY'
      Origin = 'A.PRINCIPLE_CITY'
      Size = 30
    end
    object PkOpportunityForCustomerPRINCIPLE_STATE: TStringField
      DisplayLabel = 'State or Region'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_STATE'
      Origin = 'A.PRINCIPLE_STATE'
    end
    object PkOpportunityForCustomerPRINCIPLE_ZIP: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_ZIP'
      Origin = 'A.PRINCIPLE_ZIP'
      Size = 10
    end
    object PkOpportunityForCustomerPRINCIPLE_COUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_COUNTRY'
      Origin = 'A.PRINCIPLE_COUNTRY'
      Size = 100
    end
    object PkOpportunityForCustomerPRINCIPLE_COMPANY_PHONE: TStringField
      DisplayLabel = 'Company Telephone'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_COMPANY_PHONE'
      Origin = 'A.PRINCIPLE_COMPANY_PHONE'
      Size = 25
    end
    object PkOpportunityForCustomerPRINCIPLE_COMPANY_EXT: TStringField
      DisplayLabel = 'Company Extension'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_COMPANY_EXT'
      Origin = 'A.PRINCIPLE_COMPANY_EXT'
      Size = 5
    end
    object PkOpportunityForCustomerPRINCIPLE_COMPANY_FAX: TStringField
      DisplayLabel = 'Company Fax'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_COMPANY_FAX'
      Origin = 'A.PRINCIPLE_COMPANY_FAX'
      Size = 25
    end
    object PkOpportunityForCustomerPRINCIPLE_COMPANY_URL: TStringField
      DisplayLabel = 'Company Web Site'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_COMPANY_URL'
      Origin = 'A.PRINCIPLE_COMPANY_URL'
      Size = 255
    end
    object PkOpportunityForCustomerPRINCIPLE_FIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_FIRST_NAME'
      Origin = 'A.PRINCIPLE_FIRST_NAME'
      Size = 30
    end
    object PkOpportunityForCustomerPRINCIPLE_MIDDLE_NAME: TStringField
      DisplayLabel = 'Middle Name'
      DisplayWidth = 10
      FieldName = 'PRINCIPLE_MIDDLE_NAME'
      Origin = 'A.PRINCIPLE_MIDDLE_NAME'
      Size = 30
    end
    object PkOpportunityForCustomerPRINCIPLE_LAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_LAST_NAME'
      Origin = 'A.PRINCIPLE_LAST_NAME'
      Size = 30
    end
    object PkOpportunityForCustomerPRINCIPLE_TITLE: TStringField
      DisplayLabel = 'Title'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_TITLE'
      Origin = 'A.PRINCIPLE_TITLE'
      Size = 60
    end
    object PkOpportunityForCustomerPRINCIPLE_CONTACT_EMAIL: TStringField
      DisplayLabel = 'Email'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_CONTACT_EMAIL'
      Origin = 'A.PRINCIPLE_CONTACT_EMAIL'
      Size = 250
    end
    object PkOpportunityForCustomerPRINCIPLE_CONTACT_PHONE: TStringField
      DisplayLabel = 'Telephone #'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_CONTACT_PHONE'
      Origin = 'A.PRINCIPLE_CONTACT_PHONE'
      Size = 25
    end
    object PkOpportunityForCustomerPRINCIPLE_CONTACT_EXT: TStringField
      DisplayLabel = 'Extension'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_CONTACT_EXT'
      Origin = 'A.PRINCIPLE_CONTACT_EXT'
      Size = 25
    end
    object PkOpportunityForCustomerPRINCIPLE_CONTACT_FAX: TStringField
      DisplayLabel = 'Fax #'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_CONTACT_FAX'
      Origin = 'A.PRINCIPLE_CONTACT_FAX'
      Size = 25
    end
    object PkOpportunityForCustomerPRINCIPLE_CRM_PROSPECT: TStringField
      DisplayLabel = 'CRM Prospect?'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_CRM_PROSPECT'
      Origin = 'A.PRINCIPLE_CRM_PROSPECT'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object PkOpportunityForCustomerVALUE: TFMTBCDField
      DisplayLabel = 'Value'
      DisplayWidth = 12
      FieldName = 'VALUE'
      Origin = 'A.DATE_OPENED'
      Size = 6
    end
    object PkOpportunityForCustomerSTATUS_CODE: TStringField
      DisplayLabel = 'Status Code'
      DisplayWidth = 12
      FieldName = 'STATUS_CODE'
      Origin = 'A.STATUS_CODE'
      Size = 10
    end
    object PkOpportunityForCustomerSTATUS_DESCRIPTION: TStringField
      DisplayLabel = 'Status Description'
      DisplayWidth = 12
      FieldName = 'STATUS_DESCRIPTION'
      Origin = 'A.STATUS_DESCRIPTION'
      Size = 60
    end
    object PkOpportunityForCustomerSTATUS_DATE: TDateTimeField
      DisplayLabel = 'Status Date'
      DisplayWidth = 12
      FieldName = 'STATUS_DATE'
      Origin = 'A.STATUS_DATE'
    end
    object PkOpportunityForCustomerDATE_OPENED: TDateTimeField
      DisplayLabel = 'Date Opened'
      DisplayWidth = 12
      FieldName = 'DATE_OPENED'
      Origin = 'A.DATE_CLOSED_EXPECT'
    end
    object PkOpportunityForCustomerDATE_CLOSED_EXPECT: TDateTimeField
      DisplayLabel = 'Expected Date Closed'
      DisplayWidth = 12
      FieldName = 'DATE_CLOSED_EXPECT'
      Origin = 'A.DATE_CLOSED_ACTUAL'
    end
    object PkOpportunityForCustomerDATE_CLOSED_ACTUAL: TDateTimeField
      DisplayLabel = 'Actual Date Closed'
      DisplayWidth = 12
      FieldName = 'DATE_CLOSED_ACTUAL'
      Origin = 'A.DATE_CLOSED_ACTUAL'
    end
    object PkOpportunityForCustomerPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'A.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object PkOpportunityForCustomerASSIGNEDTO_DISPLAY: TStringField
      DisplayLabel = 'Assigned To'
      DisplayWidth = 40
      FieldName = 'ASSIGNEDTO_DISPLAY'
      Origin = 'A.ASSIGNEDTO_DISPLAY'
      Size = 255
    end
    object PkOpportunityForCustomerASSIGNEDTO: TStringField
      DisplayLabel = 'Assigned To User ID'
      DisplayWidth = 22
      FieldName = 'ASSIGNEDTO'
      Origin = 'A.ASSIGNEDTO'
      Size = 35
    end
    object PkOpportunityForCustomerSALES_STAGE_CODE: TStringField
      DisplayLabel = 'Sales Stage'
      FieldName = 'SALES_STAGE_CODE'
      Origin = 'a.sales_stage_code'
      Size = 15
    end
    object PkOpportunityForCustomerCUSER1: TStringField
      DisplayLabel = 'User Text 1'
      DisplayWidth = 18
      FieldName = 'CUSER1'
      Origin = 'a.cuser1'
      Size = 60
    end
    object PkOpportunityForCustomerCUSER2: TStringField
      DisplayLabel = 'User Text 2'
      DisplayWidth = 18
      FieldName = 'CUSER2'
      Origin = 'a.cuser2'
      Size = 60
    end
    object PkOpportunityForCustomerCUSER3: TStringField
      DisplayLabel = 'User Text 3'
      DisplayWidth = 18
      FieldName = 'CUSER3'
      Origin = 'a.cuser3'
      Size = 60
    end
    object PkOpportunityForCustomerCUSER4: TStringField
      DisplayLabel = 'User Text 4'
      DisplayWidth = 18
      FieldName = 'CUSER4'
      Origin = 'a.cuser4'
      Size = 60
    end
    object PkOpportunityForCustomerCUSER5: TStringField
      DisplayLabel = 'User Text 5'
      DisplayWidth = 18
      FieldName = 'CUSER5'
      Origin = 'a.cuser5'
      Size = 60
    end
  end
  object PkSupportResolutionType: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT id,'
      '       name,'
      '       description'
      '  FROM crm_activity_resolution')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 432
    Top = 360
    object PkSupportResolutionTypeID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      Visible = False
      Size = 0
    end
    object PkSupportResolutionTypeNAME: TStringField
      DisplayLabel = 'Resolution Type'
      DisplayWidth = 18
      FieldName = 'NAME'
      Origin = 'NAME'
      Size = 35
    end
    object PkSupportResolutionTypeDESCRIPTION: TStringField
      DisplayLabel = 'Resolution Type Description'
      DisplayWidth = 30
      FieldName = 'DESCRIPTION'
      Origin = 'DESCRIPTION'
      Size = 255
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
    Left = 432
    Top = 295
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
  object PkOrders: TIQWebHpick
    BeforeOpen = PkOrdersBeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT a.id AS id, a.orderno AS orderno, a.pono AS pono,'
      
        '       a.date_taken AS date_taken, a.ord_by AS ord_by, b.custno ' +
        'AS custno,'
      
        '       b.company AS company, c.attn AS ship_to_attn, d.attn AS b' +
        'ill_to_attn,'
      '       e.rfq AS crm_quote_rfq, a.eplant_id AS eplant_id'
      '  FROM orders a, arcusto b, ship_to c, bill_to d, crm_quote e'
      ' WHERE b.id(+) = a.arcusto_id AND'
      '       c.id(+) = a.ship_to_id AND'
      '       d.id(+) = a.bill_to_id AND'
      '       e.id(+) = a.crm_quote_id AND'
      '       misc.eplant_filter(a.eplant_id) = 1 AND'
      '       (:BY_ARCUSTO_ID = 0 OR'
      '        :BY_ARCUSTO_ID = 1 AND a.arcusto_id = :ARCUSTO_ID)'
      '')
    OnIQModify = DoIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 344
    Top = 72
    ParamData = <
      item
        Name = 'BY_ARCUSTO_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'ARCUSTO_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkOrdersID: TBCDField
      FieldName = 'ID'
      Origin = 'a.id'
      Visible = False
      Size = 0
    end
    object PkOrdersORDERNO: TStringField
      DisplayLabel = 'Order #'
      FieldName = 'ORDERNO'
      Origin = 'a.orderno'
      Size = 15
    end
    object PkOrdersPONO: TStringField
      DisplayLabel = 'PO #'
      FieldName = 'PONO'
      Origin = 'a.pono'
      Size = 35
    end
    object PkOrdersDATE_TAKEN: TDateTimeField
      DisplayLabel = 'Date Taken'
      FieldName = 'DATE_TAKEN'
      Origin = 'a.date_taken'
    end
    object PkOrdersORD_BY: TStringField
      DisplayLabel = 'Order By'
      FieldName = 'ORD_BY'
      Origin = 'a.ord_by'
      FixedChar = True
      Size = 30
    end
    object PkOrdersCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      FieldName = 'CUSTNO'
      Origin = 'b.custno'
      FixedChar = True
      Size = 10
    end
    object PkOrdersCOMPANY: TStringField
      DisplayLabel = 'Company'
      FieldName = 'COMPANY'
      Origin = 'b.company'
      Size = 60
    end
    object PkOrdersSHIP_TO_ATTN: TStringField
      DisplayLabel = 'Ship To'
      FieldName = 'SHIP_TO_ATTN'
      Origin = 'c.attn'
      Size = 60
    end
    object PkOrdersBILL_TO_ATTN: TStringField
      DisplayLabel = 'Bill To'
      FieldName = 'BILL_TO_ATTN'
      Origin = 'd.attn'
      Size = 60
    end
    object PkOrdersCRM_QUOTE_RFQ: TStringField
      DisplayLabel = 'Sales Quotation'
      FieldName = 'CRM_QUOTE_RFQ'
      Origin = 'e.rfq'
      FixedChar = True
      Size = 10
    end
    object PkOrdersEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'a.eplant_id'
      Visible = False
      Size = 0
    end
  end
end
