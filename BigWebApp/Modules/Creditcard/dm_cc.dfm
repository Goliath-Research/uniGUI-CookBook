object CC_DM: TCC_DM
  OldCreateOrder = False
  Height = 388
  Width = 516
  object PkArPrePost: TIQWebHpick
    BeforeOpen = ApplyArcustoParams
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'SELECT a.id, a.invoice_no, a.invoice_date, a.due_date, a.eplant_' +
        'id,'
      
        '       a.prior_entry, b.custno, b.company, c.attn, d.start_date,' +
        ' d.end_date,'
      '       e.acct'
      '  FROM arprepost a, arcusto b, bill_to c, glperiods d, glacct e'
      ' WHERE a.arcusto_id = b.id AND'
      '       a.bill_to_id = c.id AND'
      '       a.glperiods_id_ar = d.id AND'
      '       a.glacct_id_ar = e.id AND'
      '       misc.eplant_filter(a.eplant_id) = 1 AND'
      '       (:BY_ARCUSTO_ID = 0 OR'
      '        :BY_ARCUSTO_ID = 1 AND a.arcusto_id = :ARCUSTO_ID) ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 40
    Top = 24
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
    object PkArPrePostID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkArPrePostINVOICE_NO: TStringField
      DisplayLabel = 'Invoice #'
      FieldName = 'INVOICE_NO'
      Size = 25
    end
    object PkArPrePostINVOICE_DATE: TDateTimeField
      DisplayLabel = 'Invoice Date'
      FieldName = 'INVOICE_DATE'
    end
    object PkArPrePostDUE_DATE: TDateTimeField
      DisplayLabel = 'Due Date'
      FieldName = 'DUE_DATE'
    end
    object PkArPrePostCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      FieldName = 'CUSTNO'
      Size = 10
    end
    object PkArPrePostCOMPANY: TStringField
      DisplayLabel = 'Company'
      FieldName = 'COMPANY'
      Size = 60
    end
    object PkArPrePostATTN: TStringField
      DisplayLabel = 'Bill To'
      FieldName = 'ATTN'
      Size = 60
    end
    object PkArPrePostSTART_DATE: TDateTimeField
      DisplayLabel = 'Period Start date'
      FieldName = 'START_DATE'
    end
    object PkArPrePostEND_DATE: TDateTimeField
      DisplayLabel = 'Period End date'
      FieldName = 'END_DATE'
    end
    object PkArPrePostACCT: TStringField
      DisplayLabel = 'GL Account'
      FieldName = 'ACCT'
      Size = 50
    end
    object PkArPrePostEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'ARPREPOST.EPLANT_ID'
      Visible = False
      Size = 0
    end
    object PkArPrePostPRIOR_ENTRY: TStringField
      FieldName = 'PRIOR_ENTRY'
      Origin = 'ARPREPOST.PRIOR_ENTRY'
      Visible = False
      Size = 1
    end
  end
  object PkOrders: TIQWebHpick
    BeforeOpen = ApplyArcustoParams
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
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 248
    Top = 24
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
  object PkPO: TIQWebHpick
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT id, pono, po_date, eplant_id'
      '  FROM po'
      ' WHERE misc.eplant_filter(eplant_id) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 352
    Top = 24
    object PkPOPONO: TStringField
      DisplayLabel = 'PO #'
      FieldName = 'PONO'
      Size = 35
    end
    object PkPOPO_DATE: TDateTimeField
      DisplayLabel = 'Date'
      FieldName = 'PO_DATE'
    end
    object PkPOID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkPOEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'PO.EPLANT_ID'
      Visible = False
      Size = 0
    end
  end
  object PkBillTo: TIQWebHpick
    BeforeOpen = ApplyArcustoParams
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select'
      '  arcusto.id as arcusto_id,'
      '  arcusto.custno as custno,'
      '  bill_to.id as bill_to_id,'
      '  bill_to.attn as attn,'
      '  bill_to.addr1 as addr1,'
      '  bill_to.addr2 as addr2,'
      '  bill_to.addr3 as addr3,'
      '  bill_to.city as city,'
      '  bill_to.state as state,'
      '  bill_to.zip as zip,'
      '  bill_to.country as country,'
      '  bill_to.id as id'
      'from arcusto, bill_to'
      
        'where arcusto.id = bill_to.arcusto_id and bill_to.arcusto_id = :' +
        'ARCUSTO_ID'
      ''
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 144
    Top = 88
    ParamData = <
      item
        Name = 'ARCUSTO_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkBillToARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Origin = 'ARCUSTO.ID'
      Visible = False
      Size = 0
    end
    object PkBillToBILL_TO_ID: TBCDField
      FieldName = 'BILL_TO_ID'
      Origin = 'BILL_TO.ID'
      Visible = False
      Size = 0
    end
    object PkBillToCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      FieldName = 'CUSTNO'
      Origin = 'ARCUSTO.CUSTNO'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object PkBillToATTN: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 18
      FieldName = 'ATTN'
      Origin = 'BILL_TO.ATTN'
      Size = 60
    end
    object PkBillToADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 18
      FieldName = 'ADDR1'
      Origin = 'BILL_TO.ADDR1'
      Size = 60
    end
    object PkBillToADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 18
      FieldName = 'ADDR2'
      Origin = 'BILL_TO.ADDR2'
      Size = 60
    end
    object PkBillToADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 18
      FieldName = 'ADDR3'
      Origin = 'BILL_TO.ADDR3'
      Size = 60
    end
    object PkBillToCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 18
      FieldName = 'CITY'
      Origin = 'BILL_TO.CITY'
      FixedChar = True
      Size = 30
    end
    object PkBillToSTATE: TStringField
      DisplayLabel = 'State or Region'
      DisplayWidth = 18
      FieldName = 'STATE'
      Origin = 'BILL_TO.STATE'
    end
    object PkBillToZIP: TStringField
      DisplayLabel = 'Postal Code'
      FieldName = 'ZIP'
      Origin = 'BILL_TO.ZIP'
      FixedChar = True
      Size = 10
    end
    object PkBillToCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 18
      FieldName = 'COUNTRY'
      Origin = 'BILL_TO.COUNTRY'
      FixedChar = True
      Size = 100
    end
    object PkBillToID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.BILL_TO.ID'
      Visible = False
      Size = 0
    end
  end
  object PkArcusto: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'select custno, company, addr1, addr2, addr3, city, state, zip, c' +
        'ountry,'
      ' phone_number, prime_contact, id, pk_hide'
      'from v_arcusto'
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 248
    Top = 88
    object PkArcustoCUSTNO: TStringField
      DisplayLabel = 'Customer#'
      FieldName = 'CUSTNO'
      Size = 10
    end
    object PkArcustoCOMPANY: TStringField
      DisplayLabel = 'Customer Name'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Size = 60
    end
    object PkArcustoPHONE_NUMBER: TStringField
      DisplayLabel = 'Phone'
      FieldName = 'PHONE_NUMBER'
      Origin = 'ARCUSTO.PHONE_NUMBER'
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
    object PkArcustoPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'V_ARCUSTO.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object PkArcustoADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 12
      FieldName = 'ADDR1'
      Origin = 'V_ARCUSTO.ADDR1'
      Visible = False
      Size = 60
    end
    object PkArcustoADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 12
      FieldName = 'ADDR2'
      Origin = 'V_ARCUSTO.ADDR2'
      Visible = False
      Size = 60
    end
    object PkArcustoADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 12
      FieldName = 'ADDR3'
      Origin = 'V_ARCUSTO.ADDR3'
      Visible = False
      Size = 60
    end
    object PkArcustoCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 12
      FieldName = 'CITY'
      Origin = 'V_ARCUSTO.CITY'
      Visible = False
      FixedChar = True
      Size = 30
    end
    object PkArcustoSTATE: TStringField
      DisplayLabel = 'State or Region'
      DisplayWidth = 12
      FieldName = 'STATE'
      Origin = 'V_ARCUSTO.STATE'
      Visible = False
    end
    object PkArcustoZIP: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 12
      FieldName = 'ZIP'
      Origin = 'V_ARCUSTO.ZIP'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object PkArcustoCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 12
      FieldName = 'COUNTRY'
      Origin = 'V_ARCUSTO.COUNTRY'
      Visible = False
      FixedChar = True
      Size = 100
    end
  end
  object PkEmployee: TIQWebHpick
    Tag = 1
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select'
      '    pr_emp_id as id,'
      '    empno as empno,'
      '    first_name as first_name,'
      '    middle_name as middle_name,'
      '    last_name as last_name,'
      '    display_name as display_name,'
      '    addr1 as addr1,'
      '    city as city,'
      '    state as state,'
      '    country as country,'
      '    zip as zip,'
      '    email as email,'
      '    user_name as user_name,'
      '    eplant_id as eplant_id,'
      '    eplant_name as eplant_name'
      'from v_empuser')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 352
    Top = 88
    object PkEmployeeID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'e.id'
      Visible = False
      Size = 0
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
    object PkEmployeeLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 10
      FieldName = 'LAST_NAME'
      Origin = 'e.last_name'
      Size = 30
    end
    object PkEmployeeADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 10
      FieldName = 'ADDR1'
      Origin = 'e.addr1'
      Size = 60
    end
    object PkEmployeeCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 10
      FieldName = 'CITY'
      Origin = 'e.city'
      Size = 30
    end
    object PkEmployeeSTATE: TStringField
      DisplayLabel = 'State or Region'
      DisplayWidth = 10
      FieldName = 'STATE'
      Origin = 'e.state'
      FixedChar = True
    end
    object PkEmployeeCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 10
      FieldName = 'COUNTRY'
      Origin = 'e.country'
      Size = 100
    end
    object PkEmployeeZIP: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 10
      FieldName = 'ZIP'
      Origin = 'e.zip'
      Size = 10
    end
    object PkEmployeeEMAIL: TStringField
      DisplayLabel = 'Email'
      DisplayWidth = 10
      FieldName = 'EMAIL'
      Origin = 'g.email'
      Size = 250
    end
    object PkEmployeeEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'g.eplant_id'
      Visible = False
      Size = 0
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
      Size = 255
    end
  end
  object PkCurrencyCode: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT'
      '  a.descrip as descrip,'
      '  a.native_curr as native_curr,'
      '  a.curr_code as chr3,'
      '  a.digit3 as digit3'
      'FROM v_currency a'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 40
    Top = 152
    object PkCurrencyCodeDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'A.DESCRIP'
      Size = 50
    end
    object PkCurrencyCodeCHR3: TStringField
      DisplayLabel = 'Alphabetic Code'
      DisplayWidth = 12
      FieldName = 'CHR3'
      Origin = 'A.CHR3'
      FixedChar = True
      Size = 10
    end
    object PkCurrencyCodeDIGIT3: TStringField
      DisplayLabel = 'Numeric Code'
      DisplayWidth = 18
      FieldName = 'DIGIT3'
      Origin = 'A.DIGIT3'
      Size = 3
    end
    object PkCurrencyCodeNATIVE_CURR: TStringField
      DisplayLabel = 'Native Currency Code'
      DisplayWidth = 18
      FieldName = 'NATIVE_CURR'
      Origin = 'A.NATIVE_CURR'
      Size = 3
    end
  end
  object PkCountryCode: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT a.chr2, a.chr3, a.digit3, a.country'
      'FROM v_country_codes a'
      'WHERE NVL(a.default_spelling,'#39'N'#39') = '#39'Y'#39
      'ORDER BY a.country')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 248
    Top = 152
    object PkCountryCodeCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 20
      FieldName = 'COUNTRY'
      Size = 52
    end
    object PkCountryCodeCHR2: TStringField
      DisplayLabel = 'Two-Character Alphabetic Code'
      DisplayWidth = 12
      FieldName = 'CHR2'
      FixedChar = True
      Size = 2
    end
    object PkCountryCodeCHR3: TStringField
      DisplayLabel = 'Three-Character Alphabetic Code'
      DisplayWidth = 12
      FieldName = 'CHR3'
      FixedChar = True
      Size = 3
    end
    object PkCountryCodeDIGIT3: TStringField
      DisplayLabel = 'Numeric Code'
      DisplayWidth = 12
      FieldName = 'DIGIT3'
      FixedChar = True
      Size = 3
    end
  end
  object PkCurrencyISO: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT a.descrip as descrip, a.chr3 as chr3, a.digit3 as digit3'
      'FROM v_currency_codes a')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 144
    Top = 152
    object PkCurrencyISODESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'A.DESCRIP'
      Size = 29
    end
    object PkCurrencyISOCHR3: TStringField
      DisplayLabel = 'Alphabetic Code'
      DisplayWidth = 18
      FieldName = 'CHR3'
      Origin = 'A.CHR3'
      FixedChar = True
      Size = 3
    end
    object PkCurrencyISODIGIT3: TStringField
      DisplayLabel = 'Numeric Code'
      DisplayWidth = 18
      FieldName = 'DIGIT3'
      Origin = 'A.DIGIT3'
      FixedChar = True
      Size = 3
    end
  end
  object PkShipToCustomer: TIQWebHpick
    BeforeOpen = ApplyArcustoParams
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select distinct'
      ' a.id as ship_to_id,'
      ' a.attn as attn,'
      ' a.addr1 as addr1,'
      ' a.city as city,'
      ' a.state as state,'
      ' a.zip as zip,'
      ' a.country as country'
      'from ship_to a'
      'where a.arcusto_id = :ARCUSTO_ID'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 40
    Top = 216
    ParamData = <
      item
        Name = 'ARCUSTO_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkShipToCustomerSHIP_TO_ID: TBCDField
      DisplayWidth = 18
      FieldName = 'SHIP_TO_ID'
      Origin = 'a.id'
      Visible = False
      Size = 0
    end
    object PkShipToCustomerATTN: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 18
      FieldName = 'ATTN'
      Origin = 'a.attn'
      Size = 60
    end
    object PkShipToCustomerADDR1: TStringField
      DisplayLabel = 'Address'
      DisplayWidth = 18
      FieldName = 'ADDR1'
      Origin = 'a.addr1'
      Size = 60
    end
    object PkShipToCustomerCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 18
      FieldName = 'CITY'
      Origin = 'a.city'
      FixedChar = True
      Size = 30
    end
    object PkShipToCustomerSTATE: TStringField
      DisplayLabel = 'State or Region'
      DisplayWidth = 18
      FieldName = 'STATE'
      Origin = 'a.state'
    end
    object PkShipToCustomerZIP: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 18
      FieldName = 'ZIP'
      Origin = 'a.zip'
      FixedChar = True
      Size = 10
    end
    object PkShipToCustomerCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 18
      FieldName = 'COUNTRY'
      Origin = 'a.country'
      FixedChar = True
      Size = 100
    end
  end
  object PkShipToInvoice: TIQWebHpick
    BeforeOpen = PkShipToInvoiceBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT a.ship_to_id as ship_to_id,'
      '       a.attn as attn,'
      '       a.addr1 as addr1,'
      '       a.city as city,'
      '       a.state as state,'
      '       a.zip as zip,'
      '       a.country as country'
      'FROM v_arprepost_ship_to a'
      'WHERE a.arprepost_id = :ARPREPOST_ID'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 144
    Top = 216
    ParamData = <
      item
        Name = 'ARPREPOST_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkShipToInvoiceSHIP_TO_ID: TBCDField
      DisplayWidth = 18
      FieldName = 'SHIP_TO_ID'
      Origin = 'a.id'
      Visible = False
      Size = 0
    end
    object PkShipToInvoiceATTN: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 18
      FieldName = 'ATTN'
      Origin = 'a.attn'
      Size = 60
    end
    object PkShipToInvoiceADDR1: TStringField
      DisplayLabel = 'Address'
      DisplayWidth = 18
      FieldName = 'ADDR1'
      Origin = 'a.addr1'
      Size = 60
    end
    object PkShipToInvoiceCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 18
      FieldName = 'CITY'
      Origin = 'a.city'
      FixedChar = True
      Size = 30
    end
    object PkShipToInvoiceSTATE: TStringField
      DisplayLabel = 'State or Region'
      DisplayWidth = 18
      FieldName = 'STATE'
      Origin = 'a.state'
    end
    object PkShipToInvoiceZIP: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 18
      FieldName = 'ZIP'
      Origin = 'a.zip'
      FixedChar = True
      Size = 10
    end
    object PkShipToInvoiceCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 18
      FieldName = 'COUNTRY'
      Origin = 'a.country'
      FixedChar = True
      Size = 100
    end
  end
  object PkShipToOrder: TIQWebHpick
    BeforeOpen = PkShipToOrderBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select distinct'
      ' b.id as ship_to_id,'
      ' b.attn as attn,'
      ' b.addr1 as addr1,'
      ' b.city as city,'
      ' b.state as state,'
      ' b.zip as zip,'
      ' b.country as country'
      'from orders a, ship_to b'
      'where b.id = a.ship_to_id'
      ' and a.id = :ORDERS_ID'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 248
    Top = 216
    ParamData = <
      item
        Name = 'ORDERS_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkShipToOrderSHIP_TO_ID: TBCDField
      DisplayWidth = 18
      FieldName = 'SHIP_TO_ID'
      Origin = 'a.id'
      Visible = False
      Size = 0
    end
    object PkShipToOrderATTN: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 18
      FieldName = 'ATTN'
      Origin = 'a.attn'
      Size = 60
    end
    object PkShipToOrderADDR1: TStringField
      DisplayLabel = 'Address'
      DisplayWidth = 18
      FieldName = 'ADDR1'
      Origin = 'a.addr1'
      Size = 60
    end
    object PkShipToOrderCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 18
      FieldName = 'CITY'
      Origin = 'a.city'
      FixedChar = True
      Size = 30
    end
    object PkShipToOrderSTATE: TStringField
      DisplayLabel = 'State or Region'
      DisplayWidth = 18
      FieldName = 'STATE'
      Origin = 'a.state'
    end
    object PkShipToOrderZIP: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 18
      FieldName = 'ZIP'
      Origin = 'a.zip'
      FixedChar = True
      Size = 10
    end
    object PkShipToOrderCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 18
      FieldName = 'COUNTRY'
      Origin = 'a.country'
      FixedChar = True
      Size = 100
    end
  end
  object PkARInvoice: TIQWebHpick
    BeforeOpen = ApplyArcustoParams
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'SELECT p.id AS id, p.invoice_no AS invoice_no, p.invoice_date AS' +
        ' invoice_date,'
      
        '       p.due_date AS due_date, p.eplant_id AS eplant_id, a.custn' +
        'o AS custno,'
      '       a.company AS company, p.bill_to_attn AS attn,'
      '       g.start_date AS start_date, g.end_date AS end_date,'
      '       p.prior_entry AS prior_entry, l.acct AS acct'
      '  FROM arinvoice p, arcusto a, bill_to b, glperiods g, glacct l'
      ' WHERE p.arcusto_id = a.id AND'
      '       p.bill_to_id = b.id AND'
      '       p.glperiods_id_ar = g.id AND'
      '       p.glacct_id_ar = l.id AND'
      '       misc.eplant_filter(p.eplant_id) = 1 AND'
      '       (:BY_ARCUSTO_ID = 0 OR'
      '        :BY_ARCUSTO_ID = 1 AND'
      '        p.arcusto_id = :ARCUSTO_ID)'
      ''
      ' '
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 144
    Top = 24
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
    object PkARInvoiceID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkARInvoiceINVOICE_NO: TStringField
      DisplayLabel = 'Invoice #'
      FieldName = 'INVOICE_NO'
      Size = 25
    end
    object PkARInvoiceINVOICE_DATE: TDateTimeField
      DisplayLabel = 'Invoice Date'
      FieldName = 'INVOICE_DATE'
    end
    object PkARInvoiceDUE_DATE: TDateTimeField
      DisplayLabel = 'Due Date'
      FieldName = 'DUE_DATE'
    end
    object PkARInvoiceCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      FieldName = 'CUSTNO'
      Size = 10
    end
    object PkARInvoiceCOMPANY: TStringField
      DisplayLabel = 'Company'
      FieldName = 'COMPANY'
      Size = 60
    end
    object PkARInvoiceATTN: TStringField
      DisplayLabel = 'Bill To'
      FieldName = 'ATTN'
      Size = 60
    end
    object PkARInvoiceSTART_DATE: TDateTimeField
      DisplayLabel = 'Start date'
      FieldName = 'START_DATE'
      Visible = False
    end
    object PkARInvoiceEND_DATE: TDateTimeField
      DisplayLabel = 'End Date'
      FieldName = 'END_DATE'
      Visible = False
    end
    object PkARInvoiceACCT: TStringField
      DisplayLabel = 'AR Account #'
      FieldName = 'ACCT'
      Size = 50
    end
    object PkARInvoiceEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'ARINVOICE.EPLANT_ID'
      Visible = False
      Size = 0
    end
  end
  object PkMerchantAccount: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'SELECT id, description, gateway, gateway_descrip, bankinfo_dtl_i' +
        'd,'
      
        '       bank_account_number, bank_account_description, bank_accou' +
        'nt_eplant_id,'
      
        '       currency_id, curr_descrip, curr_code, eplant_id, is_defau' +
        'lt, archived,'
      '       merchant_name'
      '  FROM v_credit_card_account'
      ' WHERE iqms.misc.eplant_filter_include_nulls(eplant_id) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 352
    Top = 152
    object PkMerchantAccountID: TBCDField
      DisplayWidth = 18
      FieldName = 'ID'
      Origin = 'V_CREDIT_CARD_ACCOUNT.ID'
      Visible = False
      Size = 0
    end
    object PkMerchantAccountDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 18
      FieldName = 'DESCRIPTION'
      Origin = 'V_CREDIT_CARD_ACCOUNT.DESCRIPTION'
      Size = 60
    end
    object PkMerchantAccountGATEWAY: TBCDField
      DisplayWidth = 18
      FieldName = 'GATEWAY'
      Origin = 'V_CREDIT_CARD_ACCOUNT.GATEWAY'
      Visible = False
      Size = 0
    end
    object PkMerchantAccountGATEWAY_DESCRIP: TStringField
      DisplayLabel = 'Gateway'
      DisplayWidth = 18
      FieldName = 'GATEWAY_DESCRIP'
      Origin = 'V_CREDIT_CARD_ACCOUNT.GATEWAY_DESCRIP'
      Size = 50
    end
    object PkMerchantAccountBANKINFO_DTL_ID: TBCDField
      DisplayWidth = 18
      FieldName = 'BANKINFO_DTL_ID'
      Origin = 'V_CREDIT_CARD_ACCOUNT.BANKINFO_DTL_ID'
      Visible = False
      Size = 0
    end
    object PkMerchantAccountBANK_ACCOUNT_NUMBER: TStringField
      DisplayLabel = 'Bank Account #'
      DisplayWidth = 18
      FieldName = 'BANK_ACCOUNT_NUMBER'
      Origin = 'V_CREDIT_CARD_ACCOUNT.BANK_ACCOUNT_NUMBER'
      Size = 25
    end
    object PkMerchantAccountBANK_ACCOUNT_DESCRIPTION: TStringField
      DisplayLabel = 'Bank Account Description'
      DisplayWidth = 18
      FieldName = 'BANK_ACCOUNT_DESCRIPTION'
      Origin = 'V_CREDIT_CARD_ACCOUNT.BANK_ACCOUNT_DESCRIPTION'
      Size = 60
    end
    object PkMerchantAccountBANK_ACCOUNT_EPLANT_ID: TBCDField
      DisplayWidth = 18
      FieldName = 'BANK_ACCOUNT_EPLANT_ID'
      Origin = 'V_CREDIT_CARD_ACCOUNT.BANK_ACCOUNT_EPLANT_ID'
      Visible = False
      Size = 0
    end
    object PkMerchantAccountCURRENCY_ID: TBCDField
      DisplayWidth = 18
      FieldName = 'CURRENCY_ID'
      Origin = 'V_CREDIT_CARD_ACCOUNT.CURRENCY_ID'
      Visible = False
      Size = 0
    end
    object PkMerchantAccountCURR_DESCRIP: TStringField
      DisplayLabel = 'Currency'
      DisplayWidth = 18
      FieldName = 'CURR_DESCRIP'
      Origin = 'V_CREDIT_CARD_ACCOUNT.CURR_DESCRIP'
      Size = 50
    end
    object PkMerchantAccountCURR_CODE: TStringField
      DisplayLabel = 'Currency Code'
      DisplayWidth = 10
      FieldName = 'CURR_CODE'
      Origin = 'V_CREDIT_CARD_ACCOUNT.CURR_CODE'
      Size = 10
    end
    object PkMerchantAccountEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 18
      FieldName = 'EPLANT_ID'
      Origin = 'V_CREDIT_CARD_ACCOUNT.EPLANT_ID'
      Size = 0
    end
    object PkMerchantAccountIS_DEFAULT: TStringField
      DisplayLabel = 'Is Default?'
      DisplayWidth = 18
      FieldName = 'IS_DEFAULT'
      Origin = 'V_CREDIT_CARD_ACCOUNT.IS_DEFAULT'
      Size = 1
    end
    object PkMerchantAccountARCHIVED: TStringField
      DisplayLabel = 'Archived'
      DisplayWidth = 18
      FieldName = 'ARCHIVED'
      Origin = 'V_CREDIT_CARD_ACCOUNT.ARCHIVED'
      Visible = False
      Size = 1
    end
    object PkMerchantAccountMERCHANT_NAME: TStringField
      DisplayLabel = 'Merchant Name'
      DisplayWidth = 18
      FieldName = 'MERCHANT_NAME'
      Origin = 'V_CREDIT_CARD_ACCOUNT.MERCHANT_NAME'
      Size = 50
    end
  end
  object PkTokenizationMerchantAccount: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'SELECT id, description, gateway, gateway_descrip, bankinfo_dtl_i' +
        'd,'
      
        '       bank_account_number, bank_account_description, bank_accou' +
        'nt_eplant_id,'
      
        '       currency_id, curr_descrip, curr_code, eplant_id, is_defau' +
        'lt, archived,'
      '       merchant_name'
      '  FROM v_credit_card_account'
      ' WHERE iqms.misc.eplant_filter_include_nulls(eplant_id) = 1 AND'
      '       gateway IS NOT NULL AND gateway IN (0, /* 5, */ 6, 61)')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 352
    Top = 216
    object PkTokenizationMerchantAccountID: TBCDField
      DisplayWidth = 18
      FieldName = 'ID'
      Origin = 'V_CREDIT_CARD_ACCOUNT.ID'
      Visible = False
      Size = 0
    end
    object PkTokenizationMerchantAccountDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 18
      FieldName = 'DESCRIPTION'
      Origin = 'V_CREDIT_CARD_ACCOUNT.DESCRIPTION'
      Size = 60
    end
    object PkTokenizationMerchantAccountGATEWAY: TBCDField
      DisplayWidth = 18
      FieldName = 'GATEWAY'
      Origin = 'V_CREDIT_CARD_ACCOUNT.GATEWAY'
      Visible = False
      Size = 0
    end
    object PkTokenizationMerchantAccountGATEWAY_DESCRIP: TStringField
      DisplayLabel = 'Gateway'
      DisplayWidth = 18
      FieldName = 'GATEWAY_DESCRIP'
      Origin = 'V_CREDIT_CARD_ACCOUNT.GATEWAY_DESCRIP'
      Size = 50
    end
    object PkTokenizationMerchantAccountBANKINFO_DTL_ID: TBCDField
      DisplayWidth = 18
      FieldName = 'BANKINFO_DTL_ID'
      Origin = 'V_CREDIT_CARD_ACCOUNT.BANKINFO_DTL_ID'
      Visible = False
      Size = 0
    end
    object PkTokenizationMerchantAccountBANK_ACCOUNT_NUMBER: TStringField
      DisplayLabel = 'Bank Account #'
      DisplayWidth = 18
      FieldName = 'BANK_ACCOUNT_NUMBER'
      Origin = 'V_CREDIT_CARD_ACCOUNT.BANK_ACCOUNT_NUMBER'
      Size = 25
    end
    object PkTokenizationMerchantAccountBANK_ACCOUNT_DESCRIPTION: TStringField
      DisplayLabel = 'Bank Account Description'
      DisplayWidth = 18
      FieldName = 'BANK_ACCOUNT_DESCRIPTION'
      Origin = 'V_CREDIT_CARD_ACCOUNT.BANK_ACCOUNT_DESCRIPTION'
      Size = 60
    end
    object PkTokenizationMerchantAccountBANK_ACCOUNT_EPLANT_ID: TBCDField
      DisplayWidth = 18
      FieldName = 'BANK_ACCOUNT_EPLANT_ID'
      Origin = 'V_CREDIT_CARD_ACCOUNT.BANK_ACCOUNT_EPLANT_ID'
      Visible = False
      Size = 0
    end
    object PkTokenizationMerchantAccountCURRENCY_ID: TBCDField
      DisplayWidth = 18
      FieldName = 'CURRENCY_ID'
      Origin = 'V_CREDIT_CARD_ACCOUNT.CURRENCY_ID'
      Visible = False
      Size = 0
    end
    object PkTokenizationMerchantAccountCURR_DESCRIP: TStringField
      DisplayLabel = 'Currency'
      DisplayWidth = 18
      FieldName = 'CURR_DESCRIP'
      Origin = 'V_CREDIT_CARD_ACCOUNT.CURR_DESCRIP'
      Size = 50
    end
    object PkTokenizationMerchantAccountCURR_CODE: TStringField
      DisplayLabel = 'Currency Code'
      DisplayWidth = 10
      FieldName = 'CURR_CODE'
      Origin = 'V_CREDIT_CARD_ACCOUNT.CURR_CODE'
      Size = 10
    end
    object PkTokenizationMerchantAccountEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 18
      FieldName = 'EPLANT_ID'
      Origin = 'V_CREDIT_CARD_ACCOUNT.EPLANT_ID'
      Size = 0
    end
    object PkTokenizationMerchantAccountIS_DEFAULT: TStringField
      DisplayLabel = 'Is Default?'
      DisplayWidth = 18
      FieldName = 'IS_DEFAULT'
      Origin = 'V_CREDIT_CARD_ACCOUNT.IS_DEFAULT'
      Size = 1
    end
    object PkTokenizationMerchantAccountARCHIVED: TStringField
      DisplayLabel = 'Archived'
      DisplayWidth = 18
      FieldName = 'ARCHIVED'
      Origin = 'V_CREDIT_CARD_ACCOUNT.ARCHIVED'
      Visible = False
      Size = 1
    end
    object PkTokenizationMerchantAccountMERCHANT_NAME: TStringField
      DisplayLabel = 'Merchant Name'
      DisplayWidth = 18
      FieldName = 'MERCHANT_NAME'
      Origin = 'V_CREDIT_CARD_ACCOUNT.MERCHANT_NAME'
      Size = 50
    end
  end
  object ResponseImageList: TUniImageList
    Width = 48
    Height = 48
    Left = 40
    Top = 287
    Bitmap = {
      494C010105000900140030003000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000C00000006000000001002000000000000020
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BFBEBE00A2A09D008A857E008A857E00A2A09D00C2C1
      BF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDBBBA009A94930088847C009F968200A5998400A59984009D9386008A85
      7E0099989600BFBEBE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C7C6009998
      96008A857E00A5998400A59984008F8484006C63A7006C63A7008F848400A599
      8400A59984008A857E009D9B9B00C9C9C8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B6B4B10088847C009D93
      8600A59984008F848400615CAF004343D5003B3CE4003B3CE4004343D500615C
      AF008F848400A99D86009D9386008F848400BABBBA0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A7A5A30088847C00A99D86008F84
      84006C63A7004343D5003C3DDB003A3AD3003637D1003637D1003535D6003434
      DC003A3AD300615CAF009D938600AEA590008A857E00ACABAB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A2A09D008F887C00A599840083799C004746
      CA003C3DDB00393ACE003333CA003333CA002E2EC5002A2ACC002A2ACC002A2A
      CC002F30D4002A2BDB00423FCA0083799C00AEA59000928D8800AAA8A7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A7A5A3008F887C00A5998400726AA5004343D5003A3A
      D3003637C7003232C4002E2EC5002828BE002828BE002424C3002424C3002424
      C3002222C9002A2ACC002A2BDB003131D800726AA500B3AA9700928D8800B1AF
      AD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B6B6B60088847C00A99D86006C63A7004343D5003B3CCB003637
      C7003030C1002B2BBA002828BE002222BB002222BB002222BB001E1EBC001E1E
      BC001E1EC4002222C9002222C9002424D3002A2BDB006C63A700B3AA9700928D
      8800BBBDBE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C9C9C80088847C00A99D86007B759D003C3DDB003A3ACA003535C2002E2E
      BC002B2BBA002626B6002121B6001F1FB5001F1FB5001F1FB5001F1FB5001F1F
      B5001E1EBC001E1EBC001E1EC4002222C9002424D3002526DD007774AD00B3AA
      970092918F00CBCBCB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A2A09D009F968200918698004746CA003A3ACA003535C2002E2EBC002A2A
      B5002626B6002222B0001F1FB1001F1FB1001F1FAE001F1FAE001F1FB1001F1F
      B1001F1FB5001E1EBC001E1EBC001E1EC4001C1CCB001E1ED2002C2CD5009D9B
      9B00A5A09600ACABAB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C5C5
      C50088847C00A69C8A005652C000393ACE003535C2002E2EBC002A2AB5002626
      B2001F1FAE001D1DAB001D1DAB001F1FAE001D1DAB001D1DAB001A1AAD001A1A
      AD001A1AAD001919B2001919B2001919B2001515C4001C1CCB001313DB004746
      CA00B3AA970092918F00C9C9C800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A4A2
      A0009F96820083799C003D3DCE003838C4003131BB002A2AB5002222B0001919
      9700191997001E1EA2001718A7001718A7001010A1001010A1001010A1001010
      A1001010A1000E0E8E00191997000E0EAF001414BA001515C4001313CD001313
      DB00817FB300AAA39400B1AFAD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008A85
      7E00A69C8A005652C0003A3ACA003131BB002B2BBA002626B200191997003535
      9100BBBCCE00B2B1D5002828A000040497000404970004049700040497000404
      970000007700817FB300DDDBE5007574CD000808A8001414BA001515C4000A0B
      D500423FCA00B6B3A60092918F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDBBBA00948D
      7B00918698003D3DCE003838C4002E2EBC002A2AB5001919970035359100BBBC
      CE00DBDBD300E0E4DE00BBBCD700191997000202870004049700020287000000
      7700817FB300F6F7F200F6F7F200F6F7F2007574CD000101AF000B0BC4000C0C
      CC001414D3009793B90099989600C4C4C3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009D9B9B009F96
      8200726AA500393ACE003535C2002D2DBA001E1EA20035359100B1B3C200C8CA
      C600C6C9CA00CDD0D100E0E4DE00BBBCD7001919970002028700000077007774
      AD00EFF1ED00E7E8E800E7E8E800EFF1ED00F6F7F2007574CD000303B8000B0B
      C4000202E1006A68B800AEA99D00ACABAB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000928D8800A89E
      8F005652C0003637C7003131BB002A2AB5001E1EA200A5A5C900C4C3BA00B9BB
      BD00C1C4C500C8CBCC00CDD0D100E0E4DE00BBBCD7001E1E81007774AD00EFF1
      ED00E2E4E400E2E4E400E2E4E400E7E7E800EFF1ED00F6F7F2002E2EC5000303
      C1000303D3003D39CD00B6B3A6009D9B9B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CBCBCB008F887C009A94
      9300423FCA003637C7002E2EBC002A2AB5001D1DAB007171BD00C4C4C300B6B6
      B600BBBDBE00C1C4C500C8CBCC00CFD3D400E0E4DE00CECFDA00E2E4E400DEE2
      E200DEE2E200E2E4E400E2E4E400E2E4E400F5F5EA00B6B6E2001414BA000303
      C1000303D3001313DB00AAA6B400999896000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BFBEBE008F887C009186
      98003D3DCE003535C2002D2DBA002626B6002222B0001919AA007171BD00C3C3
      C300B6B7B900BBBDBE00C2C4C600C8CBCC00CFD3D400DBDFDE00DBDFDE00DBDF
      DE00DEE2E200DEE2E200DEE2E200EEEFE600B6B6E2001413B2000101AF000303
      C1000202CD000202E1009793B9009D9B9B00C9C9C80000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B1AFAD00948D7B008379
      9C00393ACE003232C4002B2BBA002626B6002222B0001F1FAE001010A1006A68
      B800C6C7C600B9B9B900BDBFC000C4C7C800CBCECF00D2D6D700D6DADA00DBDF
      DE00DBDFDE00DBDFDE00EEEFE600B6B6E2001919AA000101AF000101AF000303
      C1000202CD000202E1009793B900AAA69C00BDBEBE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AAA8A7009F9682007774
      AD003637D1003232C4002B2BBA002626B6002222B0002222B0001718A7000404
      97006A68B800BDBFC000B9B9B900BDBFC000C4C7C800CBCECF00D2D6D700DBDF
      DE00DBDFDE00E2E4E400B2B1D5002222B0000808A8000E0EAF000303B8000303
      C1000202CD000202E1007574CD00B6B3A600B6B6B60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A7A5A300A69C8A006A68
      B8003333D1003030C1002828BE002626B6002222B0001F1FAE001919AA000404
      9700000077009793B900BABBBA00B9BBBD00BEC1C300C6C9CA00CDD0D100D2D6
      D700DBDFDE00DEE2E2003B3AAF000808A8001A1AAD001413B2000B0BBD000B0B
      C4000202CD000202E1006460CD00C0BFB100B6B6B60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A2A09D00A69C8A00605C
      C5003333D1002E2EC5002828BE002222BB002121B6001F1FB5001010A1000202
      87007774AD00BDBEBE00B1B2B400B6B7B900B9BBBD00BEC1C300C6C9CA00CDD0
      D100D6DADA00E0E4DE00BBBCD7002A2AB5001413B2001414BA001414BA000B0B
      C4000A0BD5000202E1005654DD00C4C3BA00B6B6B60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A2A09D00A89E8F00605C
      C5003333D1002E2EC5002828BE002222BB002121B6001919AA00020287007774
      AD00C8CAC600B3B3B600B1B2B400B3B3B600B6B7B900BBBDBE00C1C4C500C8CB
      CC00CFD3D400D6DADA00E8EAE200BBBCD7003131BB001414BA001515C4001313
      CD000A0BD5000202E1005654DD00CAC7C100B6B6B60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A2A09D00A89E8F00605C
      C5002F30D4002A2ACC002424C3002222BB001F1FB5000E0E8E00817FB300D6D6
      D200BFBEBE00B6B7B900B3B3B600B1B2B400B3B3B600BABBBA00BBBDBE00C1C4
      C500C8CBCC00CFD3D400D6DADA00E8EAE200C3C3E2003131BB001515C4001313
      CD000C0CDA000101EC005654DD00CFCDC400B9B9B90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A2A09D00AAA39400605C
      C5002C2CD5002A2ACC002424C3001E1EC4001313AC007171BD00E8EAE200CDD0
      D100C5C5C700BDBEBE00B6B7B900B1B2B400B6B6B600A5A5C900BEC1C300BDBE
      BE00C2C4C600C8CBCC00CFD3D400D6DADA00E8EAE200B6B6E2001C1CCB001414
      D3001313DB000101EC005A58EA00CFCDC400BABBBA0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A2A000AAA39400605C
      C5002A2BDB002A2ACC002222C9001E1EC4001414BA008E8DD700F5F5EA00D6D6
      D800CBCECF00C2C4C600B9BBBD00C4C3BA00A5A5C9001414BA00605CC500C6C7
      C600BBBDBE00C2C4C600CBCECF00CFD3D400E0E4DE00D2D4E5002F30D4001D1D
      DA001919E2000101EC006968E700CFCDC400BDBEBE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A7A5A300AAA394006460
      CD002526DD002424D3001C1CCB001E1EC4001515C4001414BA00A8A7DA00EEEF
      E600D6D6D800CBCBCB00CFCDC400A8A7DA001515C4000303B8000303B8007574
      CD00C8CAC600BDBFC000C4C7C800CFD3CE00D2D4E5006F6EE3003434DC003434
      E0002323E900191AF9007676EC00D7D4C900BFBEBE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A7A5A300AAA394006460
      CD002526DD001E1ED2001E1ED2001C1CCB001515C4000303C1000B0BBD00A8A7
      DA00EEEDE100E7E5D900B6B6E2002222C9000B0BBD001515C4001E1EC4001E1E
      C4007574CD00C9C9C800C4C3BA00CECFDA008181E6005654DD004A4AE4004A4A
      E4003D3CF0002827FA007676EC00D7D4C900C2C2C10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A7A5A300AAA69C005654
      DD002323E9001D1DDA001414D3001414D3000C0CCC000202CD000303C1003030
      CF00A7A6EA00A8A7DA003A3AD3002222C9002A2ACC003030CF003A3AD3004343
      D5004848DB008E8DD700BBBCD700908EEE006968E7006968E700605FE8005A58
      EA004949F8003434FC00706FF300D7D4C900C2C2C10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A3A300AAA69C005654
      DD002323E9001919E2001313DB000C0CDA000303D3000303D3001414D3003131
      D8003535D6003131D8003535D6003C3DDB004343D5004848DB005654DD00605F
      E8006968E7006968E7007171EC007676EC007676EC007171EC006B6AF5006262
      F6005757FA004949F8006B6AF500D6D6D200C2C2C10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A2A000AEABA2004848
      DB00191AF9001010EA001010EA000202E1000202E1000C0CDA001D1DDA003434
      E0003C3DDB003C3DDB004848DB004A4AE4005654DD00605FE8006968E7007171
      EC007676EC007676EC007979F1007979F1007979F1007676F5007272F8006D6C
      FC006363FF005757FA006D6CFC00D7D5D500C3C3C30000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009D9B9B00AAA8A7003937
      E600191AF9000707FB000707FB000101EC000101EC001010EA002323E9003433
      EE003B3CE4003B3CE4004A4AE4004A4AE400605FE8006968E7007171EC007676
      EC007979F1007979F1007979F1007979F8007979F8007575FD007575FD007272
      FE00696AFF006363FF006D6CFC00D2D6D700C4C4C30000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099989600ACABAB002323
      E9000707FB000707FB000707FB000707FB000707FB00191AF9002827FA003433
      EE003433EE003D3CF0003D3CF0004949F8005A58EA006768F6007272F8007676
      F5007676F5007575FA007575FA007575FD007272FE00696AFF00696AFF00696A
      FF00696AFF006363FF006363FF00CECFDA00C2C2C10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000092918F00BDB7AD005654
      DD002827FA003433EE003D3CF0003D3CF0002827FA00191AF900191AF9002827
      FA003434FC003434FC003D3CF000605CC5007B759D007B759D007574CD007272
      FE007272FE007272FE00696AFF006363FF007272FE00908EEE00A7A6EA00B6B6
      E200B6B6E200908EEE00908EEE00D5D3D300BFBEBE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099989600AAA8A700B3AE
      A600A6A5A700AEABA200B6B3A600BDB7AD00C0BAC1008E8DD7005A58EA002827
      FA002827FA003434FC005652C0009D9379009F968200A59984009A9493006F6E
      E300696AFF006363FF007575FA00A7A6EA00DDDBE500E7E5D900E7E5D900E1DD
      D600DBDBD300DBDBD300DBDBD300D6D6D200BBBDBE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3C3C300A6A5A700AAA8
      A700ACABAB00AAA8A700A4A3A30099989600A2A09D00C0BFB100D7D4C900B2B1
      D500605FE8002827FA00615CAF00A69C8A00A2A09D00AAA69C00AEABA2006F6E
      E3006363FF00A7A6EA00DDDBE500EEEDE100DBDBD300CCCCCD00C3C3C300C3C3
      C300C4C4C300C5C5C500C5C5C500C4C4C300C3C3C30000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C2C1BF00ACABAB00A2A2A400C4C3
      BA00D7D4C900908EEE006C63A700AAA39400B3AEA600B1AFAD00B6B4B1008E8D
      D700C3C3E200EEEDE100DBDBD300C9C9C800C5C5C500C9C9C800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C9C9C800B1B2
      B400ACABAB00D7D4C900A2A09D00A5A09600BAB6B300BAB6B300B7B4B300C9C9
      C800E8EAE200CCCCCD00C6C7C600CCCCCD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C5C5C500B6B6B600928D8800A5A09600BEBCB800C2C1BF00BDBBBA00C2C2
      C100CCCCCD00CBCBCB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CCCCCD0092918F00AAA39400BEBCB800CAC7C100C2C1BF00B9B9
      B900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000092918F00AEA99D00C4C3BA00CFCDC400CAC7C100B9B9
      B900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099989600AEABA200D7D4C900E1DDD600D7D5D500C4C4
      C300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C7C6009D9B9B00C4C4C300D7D5D500CDD0D100CCCC
      CD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C1C4
      BF00AAB6A50096A98E008CA28200829C7600829C76008CA2820096A98E00AAB6
      A500C1C4BF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C1C4
      BF00AAB6A50096A98E008CA28200829C7600829C76008CA2820099AA9200B1AB
      A9009D8283009D8484009E8486009E8586009E8586009E8586009E8586009E85
      86009E8586009E8586009E8486009E8586009E8586009E8486009E8585009D84
      86009E848500A07F7F00B1A3A400E7E9EA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B8BFB5008CA2820056814900386B
      2700245E0C001957020019570200165C0200195702001957020019570200245E
      0C00386B270056814900829C7600B8BFB5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B8BFB5008CA2820056814900386B
      2700245E0C001957020019570200165C0200195702001D651F00409E9D003D7D
      910030697F00306A7F00306A7F00306A7F00306A7F002F6A7F002F6A80002F6B
      80002F6A80002F6A7F00306B7F00306A7F00306A7F00306A7F00306A7F002F6C
      8200306F850058383D0072282500AD9E9F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CACACC00A6A6C7006E6EB9004646
      AB002A2AA90015159D000C0C980004049300040493000C0C980015159D001F1F
      A7004646AB006E6EB9009D9DC600C7C7CB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009CAD940056814900245E0C00165C0200136201000E65
      00000E6500000964000009640000096400000660000009640000096400000E65
      00000E650000165C0200165C0200245E0C004B793B009CAD9400CFCBCF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009CAD940056814900245E0C00165C0200136201000E65
      00000E650000096400000964000009640000066000003BB5BC0007B1D90000B0
      D90000AFDA0000AFDA0000AFDA0000AFDA0000AFDA0000B0DC0000B9E40000C1
      F00000B9E70000B1DC0000B0DA0000AFDA0000AFDA0000AFDA0000AFDA0000B2
      DD0000BAE7001E9ABB00632A2A00987473000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5B5C8006E6EB9002A2AA90000049B0000008E000000
      86000000810000007E0000007E0000007E0000007E0000007E0000007E000000
      7E0000007E000000860000008E002A2AA9006E6EB900B5B5C800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009CAD94004B793B0019570200136201000B6E01000E65000006600000035B
      0100045800000456000004530000045300000453000004530000045300000453
      000004580000035B0100096400000E650000165C020019570200386B270096A9
      8E00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009CAD94004B793B0019570200136201000B6E01000E65000006600000035B
      0100045800000456000004530000045300000453000026C5E70000B8E20001C5
      F10001CBF80001CBF70001CCF70001CBF70001CDF80000D1F9000E8EAA00424B
      60005F98B1000CC9F20000CEF90000CCF70001CBF70001CBF70000CBF80002CB
      F60000C4F1000DBBE10056454B00BAA2A2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BBBDCE005A5AC3001010A8000000910000008A0000008100000086000000
      86000000860000008A0000008E0000008E0000008E0000008E0000008A000000
      860000007E0000007E0000007E0000007E00000086000C0C98005959B600B5B5
      C800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B8BFB5005681
      49001B5B0200136201000B6E0100096400000456000004560000066000000472
      0100068403000696040003A3030003A3030003A3030003A30300069604000684
      030004720100035B010004530000045300000660000009640000136201001957
      020056814900B8BFB50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B8BFB5005681
      49001B5B0200136201000B6E0100096400000456000004560000066000000472
      0100068403000696040003A3030003A3030003A3030060D3EC0000BDE60004CE
      F90006DBFF0000D5FF0000D4FF0000D5FF0000D7FF0001CEE900101218004409
      16009F586A0034A8C10000DDFF0000D5FF0000D4FF0000D4FF0006DAFF000EDF
      FE0001CEF90015ABCC007B515200E5DBDA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008181
      C4001F1FB4000000950000008A0000008A0000008A000000950000049B00000A
      A700000DB300001ABC00001ABC00011EC500011EC500001ABC00001ABC000014
      B300000CAB0000049B0004049300000086000000810000007E00000086001515
      9D008181C4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009CAD9400386B27001A61
      02000B6E01000767000004580000035B0100027A010003A3030001C0010000CD
      000000D3000000D0000000CD000000CD000000D0000000D3000000D3000000D0
      000001D1020001C0010003A30300027A0100035B010004530000066000000E65
      0000165C02002D65170096A98E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009CAD9400386B27001A61
      02000B6E01000767000004580000035B0100027A010003A3030001C0010000CD
      000000D3000000D0000000CD000000CD000000D0000024D268000AC3E80001C9
      F1000CE0FF0002D7FF0000D4FF0000D5FF0000D7FF0001CFE8000A0C11001C03
      07003C0F16001D96AD0000DFFF0000D5FF0000D4FF0000D4FF0011E5FF000FE0
      FC0000D8FC003A768700A47D7C00F2F4F4000000000000000000000000000000
      0000AFAFAF006A68670055555500575757005757570057575700565656005757
      5700575757005757570056565600575757005757570057575700575757005656
      5600565656005656560056565600565656005656560056565600565656005656
      5600565656005656560056565600565656005656560056565600565656005656
      5600565656005656560056565600565656005656560056565600565656005555
      55006A6A6A00B9B9B90000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BBBDCE005A5AC3000000
      A2000000910000008A0000008E00000095000007A800091CBF001924CA001F2E
      F2001F2EF2001D1DF100141FFB00141FFB00141FFB00141FFB002224FE001F2E
      F2001F2EF200192EDC000E1DC400000CAB000000950000008A00000081000000
      810000008E004646AB00BBBDCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008CA28200245E0C00146D02000B6E
      0100035B010004580000097B020001B5040001D1020000D6000000D0000000CD
      000000D0000000CA000000CA000000CA000000CA000000CA000000CA000000CD
      000000D0000000D4000000D9000000D5020001B5040006840300045800000458
      0000076700001362010019570200829C76000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008CA28200245E0C00146D02000B6E
      0100035B010004580000097B020001B5040001D1020000D6000000D0000000CD
      000000D0000000CA000000CA000000CA000000CA000019CE2E002FCCCD0000C5
      EA000ADDFD0009E1FF0000D8FF0000D7FF0000D9FF0000E0FB00078CA000083C
      3F00125D6D0000DCFD0000DBFF0000D8FF0000D6FF0005DDFF001DF4FE0004D9
      FE0007C4E800784D4D00D9D2D10000000000000000000000000000000000BEBE
      BE004444440011111100100A09000B0B0B000D0908000D0908000C0707000C07
      07000C0707000C0707000A060600080504000604040006040400050201000604
      0400030000000100000000040400000000000000000000000000000000000000
      0000010000000100000001000000000000000100000003000000010000000100
      0000000000000000000000000000000000000000000000000000000000000000
      0000111111008282820000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B3B6CF003434C50000009E000000
      8E0000008E0000008E000303A400091CBF002531E3002E34FB002C2CFF001A1A
      FF001414FF00100FFF000B0BFF000B0BFF00100FFF00100FFF001A1AFF002020
      FF002C2CFF003737FF003737FF00373AED001924CA000005AE0000008E000000
      860000007E0000008A002A2AA900B5B5C8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000829C7600165C0200146D0200076700000458
      00000767000003A3030000D3000000D6000000D0000000D0000000D0000000D0
      0000006500000696040000CD000000CA000000CA000000CA000000CD000000CD
      000000CD000000D0000000D0000000D3000000D9000000D9000003A303000167
      060004530000066000000E650000195702007694690000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000829C7600165C0200146D0200076700000458
      00000767000003A3030000D3000000D6000000D0000000D0000000D0000000D0
      0000006500000696040000CD000000CA000000CA000000CA000023D17A000FC9
      E90005D4F5000EE7FE0002DDFF0000DAFF0000DBFF0000DEFF0000E7FF0005D5
      EB0001E3FA0000E1FF0000DBFF0000DBFF0001DAFF0017EFFF0013EBFE0000D9
      FD0032809000AA84810000000000000000000000000000000000000000007C7C
      7C00282727001823250018232500182325000E2123001521230015212300131E
      20000F1C1E000F1C1E000F1C1E000F1C1E000F1C1E000F191A000F191A000F19
      1A000F191A000F191A000F1C1E000E2123000E2123000E2123000E2123000511
      1300051113000511130005111300051113000310110003101100010D0F00010D
      0F00010D0F00010D0F00010D0F00010D0F00010D0F00010D0F00010D0F000000
      0000000000004444440000000000000000000000000000000000000000000000
      0000000000000000000000000000B5B5C8002727BD0000009A0000008E000000
      8E00000095000A0CB8002531E3004140FF003737FF002C2CFF002020FF001A1A
      FF001414FF000B0BFF000505FF000505FF000505FF00100FFF001414FF001A1A
      FF002224FE002C2CFF003737FF004140FF004B4BFC004446E8000E1DC4000000
      9A0000008A0000007E00000086001F1FA700A6A6C70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008CA282001B5B02001773020007670000045300000472
      010001C0010000D9000000D4000000D0000000D0000000D0000000D900000167
      060048324000386B270001B5040000CD000000CA000000CA000000CD000000CD
      000000D0000000D0000000D0000000D3000000D3000000D6030000DD010003C2
      0C000975030004530000066000000E65000019570200829C7600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008CA282001B5B02001773020007670000045300000472
      010001C0010000D9000000D4000000D0000000D0000000D0000000D900000167
      060048324000386B270001B5040000CD000000CA000000CA000010D01E0015CF
      C30000CCEC000AE2FA0008E5FF0000DCFF0000DDFF0000DEFF0000E0FD002274
      8B0007CAE70000E2FF0000DCFF0000DCFF0008E4FF001CF7FF0004DCFC0010C1
      D80064505300D5D7D80000000000000000000000000000000000000000008282
      8200413938000E5A650001CBE90008C4E00008C4E00008C4E00013C6E10013C6
      E1001CC8E3001DC7E10025C9E20025C9E2002DCAE3002DCAE30033CCE40033CC
      E40033CCE40039D8F000258E9E00153D430010363B001E454B00258E9E0039D8
      F00033CCE40033CCE4002DCAE30030C5DD0025C9E20025C9E2001DC7E1001DC7
      E10013C6E10013C6E10008C4E00008C4E00008C4E00008C4E00004A6BE00010D
      0F00010000005555550000000000000000000000000000000000000000000000
      00000000000000000000BBBDCE002828C70000009A0000008E00000091000000
      9A000E1DC4004B4BFC004B4BFC004140FF002E34FB002C2CFF002020FF001A1A
      FF00100FFF000505FF000505FF000505FF000505FF000B0BFF001414FF001A1A
      FF002224FE002C2CFF003737FF004140FF004B4BFC005555FF005C5CFA002930
      D3000000A20000008A0000008100000081001F1FA700B5B5C800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A2B09B00245E0C00146D020007670000045600000684030001CE
      080000DD010000D4000000D3000000D0000001D1020000D90000067208002027
      2000C1C4BF00A29DA3000065000000D0000000CA000000CA000000CA000000CD
      000000CD000000D0000000D0000000D3000000D3000000D6000000D5020000D9
      120009D821000C7D0B0001500000066000000E650000195702009CAD94000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A2B09B00245E0C00146D020007670000045600000684030001CE
      080000DD010000D4000000D3000000D0000001D1020000D90000067208002027
      2000C1C4BF00A29DA3000065000000D0000000CA000000CA000000CA00004BD8
      8D0002CCE80002D6F2000DEBFD0001E2FF0000DFFF0000E3FF0005D5E500393D
      4A000CAFCB0000EBFF0000E0FF0001E0FF0014F2FF000DE8FD0002DAF800367E
      8B00A2868700000000000000000000000000000000000000000000000000B5B5
      B500515151003537370009B3CC0007E1FF000BDAF90011D7F50011D7F5001DD9
      F50021DEFB0028DFFB0028DFFB0031DCF70034E2FD003CE3FD003CE3FD003CE3
      FD0045EAFF00277A880007090A002D2524003E3635004A41400021272800277A
      880045EAFF003CE3FD003CE3FD0034E2FD0034E2FD0028DFFB0028DFFB0021DE
      FB0021DEFB001BDEFC0011D7F5000BDAF9000BDAF90007E1FF000E5A65000300
      000011111100A3A3A20000000000000000000000000000000000000000000000
      000000000000CACACC003434C50000009E0000008E000000910000009E002324
      D1005C5CFA005555FF004140FF004140FF002E34FB002C2CFF002020FF001A1A
      FF00100FFF000B0BFF000505FF000505FF000505FF000B0BFF001414FF001A1A
      FF002224FE002C2CFF003737FF004140FF004B4BFC005555FF006060FF006F6F
      FF004044DE000000A20000008A0000008100000086003939AA00C7C7CB000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C1C4BF002D651700146D02000B6E010004580000057B0B0004D41A0000D9
      0F0000D6000000D3000000D3000000D3000000D900000472010020272000B6AF
      B500CFCBCF00CFCBCF00726F71000684030000D6000000CA000000CD000000CD
      000000D0000000D0000000D0000000D3000000D3000000D6000000D5020000D9
      0F0009DD24001ADA31000C860E000453000006600000136201002D651700B8BF
      B500000000000000000000000000000000000000000000000000000000000000
      0000C1C4BF002D651700146D02000B6E010004580000057B0B0004D41A0000D9
      0F0000D6000000D3000000D3000000D3000000D900000472010020272000B6AF
      B500CFCBCF00CFCBCF00726F71000684030000D6000000CA000000CD000002CE
      070034D6EB0000CEE90009E5FA0007EAFF0000E3FF0000E8FF000AC6CC005124
      2C001996AC0000F1FF0000E3FF0005E7FF0016F6FE0005E0FA000EC9DF006C5B
      5D00D2C8C9000000000000000000000000000000000000000000000000000000
      00008F8D8D004A41400029575E000BDAF9000BDAF90017D8F6001DD9F5001DD9
      F50029DBF6002EDCF70031DCF7003ADEF8003EDFF80042DFF90044DFF9004CEA
      FF003290A0000F0E0E0086817F00C2C2C200C5C5C500C5C5C500A19F9F002D25
      24003290A0004CEAFF0042DFF9003EDFF8003ADEF80035DDF80031DCF70029DB
      F60023D9F6001DD9F50017D8F60011D7F50007E1FF0004A6BE000A0606000604
      04005E5F5F000000000000000000000000000000000000000000000000000000
      0000000000006767CC000000A5000000910000008E0000009E002324D1006767
      FF006060FF005555FF004B4BFC004140FF003737FF002C2CFF002224FE001A1A
      FF001414FF000B0BFF000B0BFF000B0BFF000B0BFF00100FFF001414FF002020
      FF002525F7002C2CFF003737FF004140FF004B4BFC005555FF006060FF006A69
      FF007B7BFF004446E80000009E0000008A000000810000008E005959B6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000638855001A6102000B6E0100035B01000B6E010014D1250005DC210000D7
      0C0000D4000000D4000000D6000000DD01000472010020272000B6AFB500D5D7
      D500F4F3F400F4F3F400CFCBCF002A472A0001B5040000D0000000CD000000D0
      000000D0000000D0000000D3000000D0000000D3000000D6000000D6030000D9
      0F0005D81F0018DD310025DB3A000C750C000150000007670000165C02005681
      4900000000000000000000000000000000000000000000000000000000000000
      0000638855001A6102000B6E0100035B01000B6E010014D1250005DC210000D7
      0C0000D4000000D4000000D6000000DD01000472010020272000B6AFB500D5D7
      D500F4F3F400F4F3F400CFCBCF002A472A0001B5040000D0000000CD000001CF
      01001CD46D0006CFE70003DAF3000BF0FF0001E6FF0000EDFF000CA5B6007537
      44003570820000F0FF0000E5FF000DF1FF0012F2FD0000E6FC00318D99009E74
      7100F0F1F1000000000000000000000000000000000000000000000000000000
      0000C2C2C2006A686700413938001996A90013DDFC0017D8F60023D9F60029DB
      F6002EDCF70036DDF7003ADEF80042DFF90046E0F9004BE1F90050E1FA004EDC
      F300162F3300827B7A00D8D7D600C5C5C500C5C5C500C7C5C500D6D5D5008681
      7F001E454B0051E6FE004DE1F90048E0F90042DFF90040DDF20036DDF70031DC
      F70029DBF60023D9F6001DD9F50017D8F60011D7F50010363B000C0302002423
      2300B5B5B5000000000000000000000000000000000000000000000000000000
      0000ABABD2000606B700000095000000910000009A001E1DCC007171FC006C6B
      FF005C5CFA004B4BFC00373AED00373AED002A2AED002A2AED001616E7001616
      E7000F0FF1000F0FF100100FFF00100FFF00100FFF001414FF001A1AFF001D1D
      F1001D1DF1002A2AED002A2AED00373AED004446E8005154E7005355EC005B5B
      EF007070F9008384FF004044DE00000095000000860000008100040493009D9D
      C60000000000000000000000000000000000000000000000000000000000A2B0
      9B001B5B020017730200006500000660000016B82C001CE0340009D8210000D9
      120000D6000000DD010000D90000035B010020272000B6AFB500D5D7D500F7F6
      F700FFFFFF00FFFFFF00EFEFEF00ACA4AC000F510F0000CA000000D3000000D0
      000000D0000000D0000000D3000000D3000000D3000000D6000000D4000000D9
      0F0005D81F0016DA2D0029DC3E002CCB3D0007650500045800000E6500001957
      02009CAD9400000000000000000000000000000000000000000000000000A2B0
      9B001B5B020017730200006500000660000016B82C001CE0340009D8210000D9
      120000D6000000DD010000D90000035B010020272000B6AFB500D5D7D500F7F6
      F700FFFFFF00FFFFFF00EFEFEF00ACA4AC000F510F0000CA000000D3000000D0
      000019D4340028D6CE0000D5EB000BEFFD0006EFFF0000F3F9000D7581006122
      2D004B485A0000EEFA0001EDFF001AFBFF0008ECFF0006D5EB00714D4F006D80
      5A009CAD94000000000000000000000000000000000000000000000000000000
      000000000000A3A3A20056504F00455658001ACFEA001BDEFC0029DBF6002EDC
      F70036DDF7003ADEF80042DFF90046E0F9004DE1F90053E3F90059E6FD0058DB
      F1000310110076757500DFDFDF00C5C5C500C5C5C500C5C5C500D8D7D6008987
      86001D32360059E6FD0056E3FA004DE1F9004BE1F90044DFF9003EDFF80036DD
      F70031DCF70029DBF60023D9F6001BDEFC001996A900100A09000B0B0B007C7C
      7C0000000000000000000000000000000000000000000000000000000000CACA
      CB003434C50000009E000000910000009A000A0CB8006D6DF7007878FF006969
      FD005B5BEF006767CC005959B6004646AB004646AB003939AA003939AA003939
      AA003939AA002A2AA9001616E7001414FF001A1AFF001A1AFF001616E7002828
      C7003939AA003939AA004646AB004646AB004646AB004646AB005C5CAA006E6E
      B9006B6BE0007A7AFB008989FF002930D3000000950000008600000086002A2A
      A900CACACB000000000000000000000000000000000000000000000000004B79
      3B00146D020004720100035B010015A0260030DE45001CDB33000CD9250000D8
      160000DE130001C00100014E080039353900B8BFB500D5D7D500F7F6F700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E3E3E300928B92000065000000D9000000D0
      000000D0000000D0000000D3000000D3000000D4000000D6000001D1020000D9
      120005D81F0013DA2C0025DB3A0036DC4A0025B03400035B0100076505001362
      01004B793B00C8CAC70000000000000000000000000000000000000000004B79
      3B00146D020004720100035B010015A0260030DE45001CDB33000CD9250000D8
      160000DE130001C00100014E080039353900B8BFB500D5D7D500F7F6F700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E3E3E300928B92000065000000D9000000D0
      000000D0000022D782000CD5E80006E7F7000BF7FF0001F0F300144D5700480C
      1A0044283F0006CBDA000DFBFF0017F8FE0000EAFD002F909700886158004784
      3F004B793B00C8CAC70000000000000000000000000000000000000000000000
      000000000000C9C8C800827B7A004D4746003290A00028DFFB0029DBF60036DD
      F7003ADEF80042DFF9004BE1F90050E1FA0056E3FA005AE3FA005FE4FB0063E8
      FD00356F780016111000B9B9B900DFDFDF00D6D5D500D6D5D500B5B5B5001F15
      1400277A880064EEFE005DE4FB0056E3FA0053E3F9004BE1F90046E0F90040DD
      F20036DDF70031DCF70028DFFB0022D1EC001D3236001611100039393900C5C5
      C500000000000000000000000000000000000000000000000000000000009497
      D4000000B20000009A00000095000000A5005154E7008484FF007474FF006A69
      FF005756D900ABABD200F3F3ED00D4D4D300CFCFC800C6C6C400BBBBB600BBBB
      B600BBBBB600A9A9B3002A2AA9001616E7002020FF001D1DF1001F1FB400A9A9
      B300C1C1BE00BBBBB600BBBBB600BBBBB600BBBBB600BBBBB600C1C1BE00A9A9
      B3006767CC007474FA008686FF007C7FFB001013BB0000008E00000086000000
      91008181C4000000000000000000000000000000000000000000A2B09B001A61
      0200117F0400016706000C750C0037D549002DDD42001EDB35000DDD2B0000E4
      1C0003A303000038010054595400C2BEC200DCDCDC00F7F6F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FBFCFB00DCDCDC0054595400027A010000DD
      010000D3000000D3000000D3000000D4000000D6000000D6000000D7080000D8
      160005D81F0013DA2C0021DB370030DE45003EE052001484180000600100096B
      0900195702009CAD940000000000000000000000000000000000A2B09B001A61
      0200117F0400016706000C750C0037D549002DDD42001EDB35000DDD2B0000E4
      1C0003A303000038010054595400C2BEC200DCDCDC00F7F6F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FBFCFB00DCDCDC0054595400027A010000DD
      010000D3000010D620000AD6C70001DEEF000CF6FD0004E8E900101116003401
      0E003D0D1700139FAE0017FFFF0007F1FE000BD6E2005C5153009AA79500096B
      0900195702009CAD940000000000000000000000000000000000000000000000
      00000000000000000000B5B5B500626464004556580030C5DD0034E2FD003ADE
      F80042DFF9004AE1FA0051E2FA0056E3FA005DE4FB005FE5FC0065E5FB006AEB
      FF006CE5F6001E454B0011111100797473008F8D8D00615B5900161110001E45
      4B0066DEF00069E6FC0062E5FB005FE4FB005AE3FA0053E3F9004BE1F90044DF
      F9003EDFF80036DDF7002BE3FE00277A88001F1514001A191A00929292000000
      0000000000000000000000000000000000000000000000000000000000003134
      D5000303A40000009A0000009E002324D1008989FF008082FC007576FF006C6C
      FF005355EC004D4DB700EDEDED00F9F9F800E9E9E800D7D7D700CECECD00C6C6
      C400C1C1BE00C1C1BE008686A6001013BB002525F7001717C7007171A600CFCF
      C800C6C6C400C6C6C400C6C6C400C6C6C400C1C1BE00C1C1BE00C6C6C4007171
      A6005756D9007A7AFB008282FF009494FF005154E7000000A20000008E000000
      8A002A2AA900CACACC0000000000000000000000000000000000638855001773
      0200057B0B000167060025B0340045DC550034E34C001CE0340009DD2400027A
      010000380100726F7100CFCBCF00DCDCDC00FBFCFB00FFFFFF00FFFFFF00FFFF
      FF00FFFAFF00FFFDFF00FFFEFF00FFFFFF00F7F6F700CFCBCF00545954000696
      040000DD010000D6000000D3000000D6000000D6000000D5020000D70C0000D8
      160009D8210013DA2C0021DB37002DDD42003EE052002DC13A0005610B00036C
      0A00136201005681490000000000000000000000000000000000638855001773
      0200057B0B000167060025B0340045DC550034E34C001CE0340009DD2400027A
      010000380100726F7100CFCBCF00DCDCDC00FBFCFB00FFFFFF00FFFFFF00FFFF
      FF00FFFAFF00FFFDFF00FFFEFF00FFFFFF00F7F6F700CFCBCF00545954000696
      040000DD010000D600003ADE950000DAE90006EFF8000BE5E600070000002D00
      0C003C080D00238A950012FDFF0002EEFB002D989F009875750010641300036C
      0A00136201005681490000000000000000000000000000000000000000000000
      00000000000000000000000000008F8D8D005C545300417B850034E2FD003CE3
      FD0046E0F90050E1FA0056E3FA005DE4FB0062E5FB0069E6FC006CE6FC006FE7
      FC0075ECFF0073E9FD00529DAA00294E55001E454B00294E5500529DAA0073E9
      FD0070EDFF006CE6FC0069E6FC0065E5FB005DE4FB0056E3FA0053E3F9004BE1
      F90044DFF9003CE3FD0030C5DD0028272700201D1C0051515100000000000000
      0000000000000000000000000000000000000000000000000000ABABD2000101
      BE000000A20000009E000000B2006769F3008E8EFF008080FF007878FF007170
      FF006767FF004746C7009393B800FEFEFE00FEFEFE00F6F6F600E9E9E800D7D7
      D700CACACB00C1C1BE00BBBBB6004646AB001717C7003939AA00C1C1BE00D4D4
      D000D7D7D700D7D7D700D4D4D300D4D4D300CECECD00D4D4D000A9A9B3004D4D
      B7006D6DF7007A79FF008080FF008B8BFF008A8CFF001924CA00000095000000
      8A0000009A009D9DC600000000000000000000000000C1C4BF002D6517000C86
      0E0001771000087712003EE0520044E45B002DDD42000AA81B00003801003935
      3900A29DA300CFCBCF00E3E3E300FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEF
      EF0075C97C00FBFCFB00FFFDFF00FFFFFF00FDFDFD00EFEFEF00C2BEC2002A47
      2A0003A3030000DD010000D6000000D6000000D6000000D5020000D70C0000D8
      16000BD9230017DA2F0021DB370029DC3E0039DC4C003EE0520007891800036C
      0A0009750300245E0C00B8BFB5000000000000000000C1C4BF002D6517000C86
      0E0001771000087712003EE0520044E45B002DDD42000AA81B00003801003935
      3900A29DA300CFCBCF00E3E3E300FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEF
      EF0075C97C00FBFCFB00FFFDFF00FFFFFF00FDFDFD00EFEFEF00C2BEC2002A47
      2A0003A3030000DD010003D70F0023E0EB0000E4F2000DEBED00093535001000
      03001D13150022BFC40008F6FE0009E3E9005F60620089AC7C000D8C1E00036C
      0A0009750300245E0C00B8BFB500000000000000000000000000000000000000
      0000000000000000000000000000C2C2C200706F6E005555550046B6CA0045E7
      FF004DE1F90056E3FA005DE4FB0062E5FB0069E6FC006CE6FC0072E7FC0072E7
      FC0076E9FD0078ECFB00529DAA00153D4300162F3300294E55004EAABA007BEF
      FF0076E9FD0072E7FC006FE7FC006CE6FC0065E5FB005FE4FB005AE3FA0053E3
      F90048E0F9003CE3FD00356F78002D25240028272700A8A8A800000000000000
      00000000000000000000000000000000000000000000000000005B67DB000000
      B9000000A5000000A5001E1DCC009090FF008989FF008282FF00797AFF007170
      FF006767FF005B5BEF003D3DBE00D9D9E500FFFFFF00FFFFFF00FEFEFE00F0F0
      F000DDDDDD00CECECD00C6C6C4009898AA001A1A7E008686A600DADAD500DDDD
      DD00E9E9E800E9E9E800E9E9E800E3E3E400DADAD500DADAD5005C5CAA005756
      D9007273FF007A79FF008080FF008686FF009494FF005355EC000001A9000000
      9500000095005959B60000000000000000000000000096A98E001C6A09000789
      18000177100015A026004DE25E002DC13A000150000020272000726F7100C2BE
      C200D5D7D500EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FFFDFF008ECB
      930001C00100B8E7BC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9EAE900ACA4
      AC002A472A0001B5040000DD010000D6030000D5020000D7080000D9120000D8
      190009D8210013DA2C0021DB370029DC3E0036DC4A003EE0520025B03400036C
      0A00087712001B5B0200829C7600000000000000000096A98E001C6A09000789
      18000177100015A026004DE25E002DC13A000150000020272000726F7100C2BE
      C200D5D7D500EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FFFDFF008ECB
      930001C00100B8E7BC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9EAE900ACA4
      AC002A472A0001B504000CDE10007EE5EB0000E0EA0006F2F9000CD7D900019C
      A3000BBFC00017F8FA0001FAFE0022ADB1009462610067D4730025B03400036C
      0A00087712001B5B0200829C7600000000000000000000000000000000000000
      000000000000000000000000000000000000A19F9F006A646200577176004EDC
      F30053E3F9005AE3FA005FE5FC0069E6FC006FE7FC0072E7FC0076E7FA0078E9
      FD007CF1FF00417B85000C0707006A64620086817F00797473002D252400417B
      85007AF2FF0078E9FD0072E7FC006FE7FC0069E6FC0065E5FB005DE4FB0053E3
      F9004CEAFF0046B6CA0036302F00282727006A6A6A0000000000000000000000
      00000000000000000000000000000000000000000000C7C7CB002930D3000306
      B1000001A9000001AD005154E7009B9BFF008989FF008383FF00797AFF007170
      FF006767FF006060FF004746C7006E6EB900FDFDFD00FFFFFF00FFFFFF00FFFF
      FF00F0F0F000DADAD500CACACB00C6C6C4009898AA00C7C7CB00DDDDDD00E9E9
      E800F0F0F000F3F3F300F0F0F000E3E3E400E9E9E8009D9DC6004D4DB7006969
      FA007474FF007A79FF008080FF008484FF008E8EFF008082FC000B15C1000000
      9A00000095001F1FA700C7C7CB00000000000000000063885500148418000694
      2900007D140037C646004DE25E0006680E0048324000CFCBCF00E7E8E800E7E8
      E800F9F9F900FFFFFF00FFFFFF00FFFFFF00FFFEFF00FFFDFF00EAE5E90020C5
      220000D600003CC33D00FFFAFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00E3E3
      E300ACA4AC001449130001C0010000DD010000D7080000D70C0000D8160000D8
      19000BD9230013DA2C001EDB350029DC3E0036DC4A0039DC4C0037C646000177
      1000007D1400146D020056814900000000000000000063885500148418000694
      2900007D140037C646004DE25E0006680E0048324000CFCBCF00E7E8E800E7E8
      E800F9F9F900FFFFFF00FFFFFF00FFFFFF00FFFEFF00FFFDFF00EAE5E90020C5
      220000D600003CC33D00FFFAFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00E3E3
      E300ACA4AC001449130001C0010016E03B001DE2D20001E7EF000BFDFE0005FF
      FF0019FEFE000AFAFE0003F0F400615757007AAA6D0039DC4C0037C646000177
      1000007D1400146D020056814900000000000000000000000000000000000000
      000000000000000000000000000000000000C7C5C50082828200615B59004EAA
      BA0059E6FD005FE5FC0065E5FB006CE6FC0072E7FC0074E8FD0078E9FD007AEE
      FF0066D0E20021272800A3A3A200E9E9E900E2E2E200E5E5E500A8A8A8002127
      280072DAEC0078EBFE0076E9FD0072E7FC006FE7FC0065E5FB0062E5FB0059E6
      FD0053E3F900405F650036302F0035373700B9B9B90000000000000000000000
      00000000000000000000000000000000000000000000B3B6CF00070FD400000D
      B3000001AD000606BF007A7AF4009494FF008B8BFF008383FF00797AFF007170
      FF006767FF006060FF005555FF003D3DBE00C5C5D700FEFEFE00FFFFFF00FFFF
      FF00FDFDFD00EDEDED00DDDDDD00D4D4D300D7D7D700DADAD500E3E3E400F3F3
      F300F6F6F600F9F9F800F3F3ED00E9E9E800DDDDDD005C5CAA005355EC006F6F
      FF007273FF00797AFF007E7FFF008484FF008989FF009090FF002930D3000004
      A500000095000303A400A6A6C70000000000C8CAC700386B2700168828000694
      29000789180048C7560044E45B002DC13A0035824200D5D7D500FFFAFF00FFFA
      FF00FFFEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFDFF0075C97C0000D0
      000000D9000000CA00009ECCA300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFC
      FB00E3E3E300A29DA3001449130001C0010000DE130000D8160000D8190003D8
      1D000CD9250011DA29001ADA310025DB3A002DDD420039DC4C0037D549000694
      2900017710000C750C00386B2700C1C4BF00C8CAC700386B2700168828000694
      29000789180048C7560044E45B002DC13A0035824200D5D7D500FFFAFF00FFFA
      FF00FFFEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFDFF0075C97C0000D0
      000000D9000000CA00009ECCA300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFC
      FB00E3E3E300A29DA3001449130001C001001BE3910007E4E90008F5F80019FF
      FF001EFDFE0000F9FD0022AEAF007C5B4C005BD96C0039DC4C0037D549000694
      2900017710000C750C00386B2700C1C4BF000000000000000000000000000000
      00000000000000000000000000000000000000000000AFAFAF00706F6E005771
      76005FDAEE0065E5FB0069E6FC006FE7FC0072E7FC0078E9FD0078E9FD007CF1
      FF005DBACB0024232300D3D2D100DFDFDF00D8D7D600DFDFDF00C7C5C5002A2C
      2D0062C5D7007BEFFF0078E9FD0076E7FA006FE7FC006CE6FC0065E5FB005EEC
      FE00529DAA00413938002E303000828282000000000000000000000000000000
      000000000000000000000000000000000000000000008B93D7000015CC000008
      B6000001AD001E1DCC009090FF009090FF008989FF008282FF007878FF007170
      FF006969FF006464FF006060FF004446E8005C5CAA00FBFBFB00FFFFFF00FFFF
      FF00FFFFFF00FBFBFB00EDEDED00E3E3E400E3E3E400E9E9E800F0F0F000F6F6
      F600F6F6F600F0F0F000E9E9E800E9E9E8008686A6004746C7006C6BFF006F6F
      FF007273FF007878FF007E7FFF008484FF008686FF009090FF005154E7000001
      AD0000009A000000A2008181C40000000000B8BFB5002D6517000FA23D000694
      29000694290045DC55003EE0520030DE45001CE034002DC13A008ECB9300EFE9
      EF00FDFDFD00FDFDFD00FFFFFF00FFFFFF00FFFFFF00D5D7D50012CA1A0000D6
      000000D4000000D600002DC13A00F4F3F400FDFDFD00FFFFFF00FFFFFF00FFFF
      FF00FBFCFB00DCDCDC00928B92001449130003C20C0000E41C0003D81D0009D8
      21000EDA270013DA2B0016DB310021DB370029DC3E0030DE450034E34C0015A0
      2600007D1400097E1200245E0C00AAB6A500B8BFB5002D6517000FA23D000694
      29000694290045DC55003EE0520030DE45001CE034002DC13A008ECB9300EFE9
      EF00FDFDFD00FDFDFD00FFFFFF00FFFFFF00FFFFFF00D5D7D50012CA1A0000D6
      000000D4000000D600002DC13A00F4F3F400FDFDFD00FFFFFF00FFFFFF00FFFF
      FF00FBFCFB00DCDCDC00928B92001449130067D88E001CE6E90008F0F20040FE
      FE0018FEFE0006ECED004E605F009BAB900029DC3E0030DE450034E34C0015A0
      2600007D1400097E1200245E0C00AAB6A5000000000000000000000000000000
      00000000000000000000000000000000000000000000CCCBCA008F8D8D006A64
      6200529DAA0064EEFE0069E6FC0072E7FC0076E9FD0078E9FD0078E9FD007CF3
      FF005DBACB001B1C1D00CCCBCA00E2E2E200DDDCDC00E2E2E200C7C5C5002A2F
      300064C7D8007BEFFF0078E9FD0078E9FD0074E8FD006FE7FC006AEBFF005FDA
      EE00455658003F3E3D0044444400C7C7C7000000000000000000000000000000
      00000000000000000000000000000000000000000000737FDC000015CC000012
      BA000000B2003134D5009B9BFF008E8EFF008686FF007E7DFF007676FF007170
      FF006A6AFF006464FF006060FF005C5CFA003434C500A6A6C700FEFEFE00FEFE
      FE00FFFFFF00FFFFFF00FBFBFB00F6F6F600F3F3F300F3F3F300F6F6F600F6F6
      F600F3F3F300E9E9E800E3E3E400C1C3CD004D4DB7005B5BEF006C6CFF006F6F
      FF007474FF007878FF007C7DFF008080FF008484FF008B8BFF006769F3000000
      B90000009E0000009E006767CC00000000009CAD94001D731E000FA23D000094
      370015A026003EE0520036DC4A0029DC3E001CDB330009DD240000D8160037C6
      4600B6D1B800F7F6F700FDFDFD00FDFDFD00FDF5FD0075C97C0000D4000000D7
      080000D70C0000D90F0000D300008ECB9300FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F9F9F900D5D7D500A29DA3001449130001B5040007E425000CD9
      250011DA290013DA2B0017DA2F0021DB370025DB3A0029DC3E0030DE450016B8
      2C00007D14000C860E00195702009CAD94009CAD94001D731E000FA23D000094
      370015A026003EE0520036DC4A0029DC3E001CDB330009DD240000D8160037C6
      4600B6D1B800F7F6F700FDFDFD00FDFDFD00FDF5FD0075C97C0000D4000000D7
      080000D70C0000D90F0000D300008ECB9300FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F9F9F900D5D7D500A29DA3001449130055E4C80000F0F10015FC
      FD0005FDFD002DBABA007B886B002BD53C0025DB3A0029DC3E0030DE450016B8
      2C00007D14000C860E00195702009CAD94000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B9B9B9007675
      75006264640066D0E20070EDFF0074E8FD0078E9FD0078E9FD0078E9FD007CF1
      FF005EBCCD001B1C1D00D0CFCF00E5E5E500DDDCDC00E5E5E500C9C8C8002A2F
      300064C7D8007BEFFF0078E9FD0076E7FA0076E9FD006FE7FC006AEBFF005693
      9D004A414000333232009A9A9A00000000000000000000000000000000000000
      000000000000000000000000000000000000000000005B67DB000013C4000012
      BA000000B5003939DC009B9BFF008989FF008282FF007C7DFF007474FF006F6F
      FF006C6BFF006767FF006060FF006060FF005154E7004D4DB700EDEDED00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00FDFDFD00FDFDFD00FBFBFB00F6F6
      F600E9E9E800E3E3E400DDDDDD007171A6005756D9006C6CFF006F6FFF007170
      FF007474FF007676FF007B7BFF007E7DFF008080FF008989FF006B70F7000005
      BF000000A2000000A2004D4DB7000000000096A98E001D731E000CAC52000094
      370015A0260036DC4A002DDD420025DB3A0017DA2F000ED5250005D81F0000D9
      0F0004D1130060BF6600D5D7D500FFFAFF00DBE4DC0012CA1A0000D90F0000D8
      160003D81D0005D81F0008D51A001FC43000DBE4DC00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F9F9F900DCDCDC00A29DA3002027200003A303000DE7
      2B0013DC2C0013DA2C0016DA2D001CDB33001EDB350025DB3A0025E13D0016B8
      2C00007D140007891800165C02008CA2820096A98E001D731E000CAC52000094
      370015A0260036DC4A002DDD420025DB3A0017DA2F000ED5250005D81F0000D9
      0F0004D1130060BF6600D5D7D500FFFAFF00DBE4DC0012CA1A0000D90F0000D8
      160003D81D0005D81F0008D51A001FC43000DBE4DC00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F9F9F900DCDCDC00A29DA30068827F003EF3F40005FD
      FD0026F7F80070C9A90031CD3F001CDB33001EDB350025DB3A0025E13D0016B8
      2C00007D140007891800165C02008CA282000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009A9A
      9A006A6462006290990070EDFF0073E9FD0078E9FD0078E9FD0078E9FD007CF1
      FF005EBCCD001B1C1D00D3D2D100E9E9E900E2E2E200E9E9E900C9C8C8002A2F
      300064C7D8007BEFFF0078E9FD0078E9FD0078E9FD0070EDFF006BCBDC005151
      510044444400615B590000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004B5DDE000015CC000012
      BA000000B5003939DC009090FF008484FF008082FC007A79FF007474FF006F6F
      FF006C6BFF006767FF006464FF006464FF006060FF004746C7008686B600FDFD
      FD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FBFBFB00F3F3
      F300E3E3E400DADAD5009898AA004D4DB7006769F3006F6FFF007170FF007172
      FF007474FF007777FF007A79FF007B7BFF007C7CFD008282FF006B70F7000005
      BF000000A2000000A2003D3DBE00000000008CA282001D731E000CAC52000094
      370015A026002DDD420025DB3A001EDB350016DA2D000CD9250005D81F0000D8
      190000D8160000D7080015CE23008ECB930060BF660000D9120009D821000ED5
      250011DA290016DA2D001CDB33000ED5250075C97C00FDFDFD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F9F9F900DCDCDC00B6AFB5002A472A000472
      01000CDD26000DE72B0016DB310016DB31001ADA31001CDB330021DB370016B8
      2C00007D14000C860E0013620100829C76008CA282001D731E000CAC52000094
      370015A026002DDD420025DB3A001EDB350016DA2D000CD9250005D81F0000D8
      190000D8160000D7080015CE23008ECB930060BF660000D9120009D821000ED5
      250011DA290016DA2D001CDB33000ED5250075C97C00FDFDFD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F9F9F900DCDCDC00B6B0B600699C900084F1
      F30028E56E002BE6460016DB310016DB31001ADA31001CDB330021DB370016B8
      2C00007D14000C860E0013620100829C76000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C2C2
      C2007C7C7C005E5F5F0069BAC90077EFFF0078E9FD0078E9FD0078E9FD007CF1
      FF005EBCCD001B1C1D00D3D2D100E9E9E900E5E5E500E9E9E900CECDCD002A2C
      2D0064C7D8007AEEFF0078E9FD0078E9FD0078E9FD0073E9FD005E8187004D47
      460039393900AFAFAF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004B5DDE000021CF000012
      BA000000B2003939DC008E8EFF007E7DFF007B7BFF007878FF007474FF006F6F
      FF006C6CFF006969FF006767FF006767FF006767FF005756D9005C5CAA00F9F9
      F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FAFAF900EDED
      ED00DDDDDD00D4D4D0007F7F9B004D4DB7006D6DF7007172FF007273FF007273
      FF007676FF007676FF007676FF007777FF007A79FF008080FF006B70F7000005
      BF000000A2000000A2003D3DBE00000000008CA28200207A2F000CAC52000094
      37000AA81B0029DC3E001ADA310013DA2C0011DA29000BD9230005D81F0000D8
      190000D8190000D8190000D9120000D8160009D821000EDA270016DA2D001EDB
      350025DB3A0025DB3A002DDD420036DC4A002CCB3D00B6D1B800FDFDFD00FDFD
      FD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00DCDCDC00C2BEC2005459
      5400003801000AA81B000DDD2B0013DA2C0013DA2C0016DA2D001CE0340016B8
      2C00007D140007891800165C0200829C76008CA28200207A2F000CAC52000094
      37000AA81B0029DC3E001ADA310013DA2C0011DA29000BD9230005D81F0000D8
      190000D8190000D8190000D9120000D8160009D821000EDA270016DA2D001EDB
      350025DB3A0025DB3A002DDD420036DC4A002CCB3D00B6D1B800FDFDFD00FDFD
      FD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00DCDCDC00C2BEC2005459
      5400003801000AA81B000DDD2B0013DA2C0013DA2C0016DA2D001CE0340016B8
      2C00007D140007891800165C0200829C76000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A3A3A2006A68670060787D0072E7FC0077EAFE0078E9FD0078E9FD007CF1
      FF005EBCCD001B1C1D00D6D5D500EEEEEE00E9E9E900EEEEEE00CECDCD002A2F
      300063C7D8007BEFFF0078E9FD0076E7FA007CF1FF0069BAC90056504F004444
      4400706F6E000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004B5DDE00011EC5000012
      BA000000B2003939DC008989FF007B7BFF007777FF007474FF007172FF006F6F
      FF006C6CFF006A6AFF006969FF006C6BFF006A6AFC004D4DB700BBBDCE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFB00F0F0
      F000DDDDDD00CACACB00BBBBB6005C5CAA006E6EEC007576FF007474FF007474
      FF007576FF007576FF007576FF007676FF007676FF007E7DFF006B70F7000101
      BE000000A20000009E003D3DBE000000000096A98E00207A2F000CAC5200049B
      4A00099818001ADA310013DA2C000EDA27000BD9230005D81F0003D81D0000D8
      190000D8190003D81D0009D821000EDA270013DA2B001EDB350029DC3E002DDD
      420037D5490045DC550045DC550045DC55003EE0520060BF6600E7E8E800FFFE
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00E3E3E300CFCB
      CF00928B920020272000045800000ED5250013DC2C0013DA2C0013E2300012B8
      1D00007D14000C860E001A6102008CA2820096A98E00207A2F000CAC5200049B
      4A00099818001ADA310013DA2C000EDA27000BD9230005D81F0003D81D0000D8
      190000D8190003D81D0009D821000EDA270013DA2B001EDB350029DC3E002DDD
      420037D5490045DC550045DC550045DC55003EE0520060BF6600E7E8E800FFFE
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00E3E3E300CFCB
      CF00928B920020272000045800000ED5250013DC2C0013DA2C0013E2300012B8
      1D00007D14000C860E001A6102008CA282000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C7C7C70082828200615B590067ABB7007AF2FF0078E9FD0078E9FD007CF1
      FF005DBACB001B1C1D00D6D5D500F1F1F100E9E9E900F1F1F100D0CFCF002A2F
      300063C7D8007BEFFF0078E9FD0078E9FD0076E7FA00577176004B4848004444
      4400BEBEBE000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005B67DB000021CF000012
      BA000001AD003939DC008989FF007576FF007172FF007170FF006F6FFF006C6C
      FF006C6CFF006C6BFF006C6CFF006F6FFF005756D9007171A600F3F3ED00F9F9
      F800FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F3F3
      F300E3E3E400CECECD00C1C1BE008686A6005A5AC3007A7AFB007A79FF007676
      FF007474FF007474FF007474FF007474FF007374FF007B7BFF006B70F7000004
      B9000000A2000000A2004746C70000000000A2B09B00207A2F000CAC52000094
      37000998180013DA2C000CD9250009D8210005D81F0000D8190000D8190000D8
      190005D81F000CD9250011DA29001CDB330025DB3A0037D5490037D5490045DC
      550054DD630054DD630054DD630054DD63005CE06C0054DD63008ECB9300F7F6
      F700FFFFFF00FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEF
      EF00DCDCDC00D4CFD300545954000AC31A0013DA2C0011DA290014DF2D000AA8
      1B00057B0B000C860E001B5B020096A98E00A2B09B00207A2F000CAC52000094
      37000998180013DA2C000CD9250009D8210005D81F0000D8190000D8190000D8
      190005D81F000CD9250011DA29001CDB330025DB3A0037D5490037D5490045DC
      550054DD630054DD630054DD630054DD63005CE06C0054DD63008ECB9300F7F6
      F700FFFFFF00FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEF
      EF00DCDCDC00D4CFD300545954000AC31A0013DA2C0011DA290014DF2D000AA8
      1B00057B0B000C860E001B5B020096A98E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AFAFAF006A6867005E5F5F0072DAEC0077EFFF0078E9FD007CF1
      FF005EBCCD001B1C1D00D9D9D800F5F5F500EEEEEE00F5F5F500D4D3D3002A2F
      300063C7D8007BEFFF0078E9FD007AF2FF0067ABB700524B4A003F3E3D008989
      8900000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000737FDC000021CF00001A
      BC000001AD003134D5008484FF007373FC006F6FFF006F6FFF006C6CFF006C6B
      FF006C6CFF006C6CFF007171FC006E6EEC005959B600C1C3CD00F3F3ED00F3F3
      F300FBFBFB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFD
      FD00EDEDED00D4D4D300C6C6C400BBBBB6007171A6006B6BE0007E7DFF007878
      FF007676FF007474FF007172FF007273FF007172FF007E7DFF006769F3000000
      B20000009E000000A5005A5AC30000000000B0BAAC00386B27000CAC5200049B
      4A000998180008D51A000BD9230003D81D0000D8190000D8190000D8190003D8
      1D000BD9230013DA2B001CDB330029DC3E0036DC4A0039DC4C004DE25E0054DD
      63005CE06C0062E0710069E4790070E27F0070E27F0070E27F0062E07100B6D1
      B800FBFCFB00FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FDFDFD0060BF660004D41A0013DA2C0011DA290011DA29000998
      1800057B0B000C7D0B00245E0C00A2B09B00B0BAAC00386B27000CAC5200049B
      4A000998180008D51A000BD9230003D81D0000D8190000D8190000D8190003D8
      1D000BD9230013DA2B001CDB330029DC3E0036DC4A0039DC4C004DE25E0054DD
      63005CE06C0062E0710069E4790070E27F0070E27F0070E27F0062E07100B6D1
      B800FBFCFB00FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FDFDFD0060BF660004D41A0013DA2C0011DA290011DA29000998
      1800057B0B000C7D0B00245E0C00A2B09B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000898989005C5453006290990077EFFF0078E9FD007CF1
      FF005EBCCD001B1C1D00DDDCDC00F5F5F500EEEEEE00F5F5F500D6D5D5002A2F
      300063C7D8007AEEFF0079EDFF0072DAEC005E5F5F004B4848004D4D4D00C9C8
      C800000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008B93D700002DD900001E
      B8000001AD001E1DCC008082FC007170FF006C6CFF006C6BFF006A6AFF006A6A
      FF006C6CFF006F6FFF007373FC005756D9008686B600E9E9E800EDEDED00F3F3
      F300FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFF
      FF00F9F9F800E3E3E400CACACB00C1C1BE009898AA005C5CAA007A7AF4007C7C
      FD007777FF007474FF007170FF007170FF006F6FFF008080FF005B5BEF000001
      A90000009E000001A9008181C40000000000C8CAC7003582420017A35F00049B
      4A00078918000AC31A0003D81D0000D8190000D8160000D8190000D8190005D8
      1F0011DA29001CDB330029DC3E0037D5490045DC550054DD63005CE06C0062E0
      710070E27F007BE388007BE3880082E28E0082E28E0082E28E007BE3880075C9
      7C00D5D7D500FFFFFF00FFFEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FDF5FD0048C756000BD9230011DA29000EDA27000ED525000C86
      0E00057B0B00117F0400386B2700C1C4BF00C8CAC7003582420017A35F00049B
      4A00078918000AC31A0003D81D0000D8190000D8160000D8190000D8190005D8
      1F0011DA29001CDB330029DC3E0037D5490045DC550054DD63005CE06C0062E0
      710070E27F007BE388007BE3880082E28E0082E28E0082E28E007BE3880075C9
      7C00D5D7D500FFFFFF00FFFEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FDF5FD0048C756000BD9230011DA29000EDA27000ED525000C86
      0E00057B0B00117F0400386B2700C1C4BF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B9B9B9006A686700515151006BCBDC0077EFFF007CF1
      FF005EBCCD001B1C1D00DDDCDC00FAFAFA00F1F1F100FAFAFA00D8D7D6002A2F
      300063C7D8007AEEFF007CF1FF00629099004D47460039393900A19F9F000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ABABD200002DD9000023
      BE000007A8000A0CB8007272F7007474FF00696AFF00696AFF006969FF006A6A
      FF006C6CFF007373FC006769F3005C5CAA00D4D4D300F0F0F000F6F6F600FBFB
      FB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0F0F000FAFAF700FFFFFD00FFFF
      FF00FFFFFF00F3F3F300DDDDDD00CACACB00C1C1BE007171A6006B6BE0007C7C
      FD007777FF007576FF007170FF007170FF006F6FFF008686FF004044DE000000
      A20000009A000001AD009D9DC60000000000000000006388550017A35F000CAC
      52000781250009B6100000DE190000D8160000D8160000D8160003D81D000ED5
      250017DA2F0025DB3A0037D5490045DC550054DD630062E0710070E27F007BE3
      880082E28E008AE396008AE3960091E49C0091E49C0091E49C0091E49C008AE3
      96008ECB9300E3E3E300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFDFD00EFE9EF002CCB3D000EDA270011DA29000CDD26000AC31A00057B
      0B0006840300177302005681490000000000000000006388550017A35F000CAC
      52000781250009B6100000DE190000D8160000D8160000D8160003D81D000ED5
      250017DA2F0025DB3A0037D5490045DC550054DD630062E0710070E27F007BE3
      880082E28E008AE396008AE3960091E49C0091E49C0091E49C0091E49C008AE3
      96008ECB9300E3E3E300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFDFD00EFE9EF002CCB3D000EDA270011DA29000CDD26000AC31A00057B
      0B00068403001773020056814900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009292920056504F005771760077EAFE007AF2
      FF005EBCCD001B1C1D00E1DFDF00FAFAFA00F5F5F500FAFAFA00D8D7D6002A2F
      300062C5D7007CF3FF006FC7D6004D4D4D003F3E3D005E5F5F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C4001A48E600002A
      C7000014B3000001A9005154E7007E7DFF006767FF006767FF006767FF006A6A
      FF006C6CFF006C6CFC005A5AC300A6A6C700FDFDF900FBFBFB00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FDFDF9007F7F9B00B5B5C800FFFFFD00FFFF
      FF00FFFFFF00FFFFFF00F3F3F300DDDDDD00CECECD00A9A9B3005C5CAA007A7A
      F4007B7BFF007676FF007170FF006F6FFF007373FC008282FF001924CA000000
      9E0000009E001013BB00C1C3CD0000000000000000008CA282001F874A000AAD
      6400009437000C860E0000D8160000D8160000D8160000D8190005D81F0011DA
      290021DB370030DE450045DC550054DD630062E0710070E27F007BE388008AE3
      960091E49C009AE6A4009AE6A400A2E7AA00A2E7AA00A2E7AA009AE6A4009AE6
      A4008AE396009ECCA300EAE5E900FFFDFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFEFF00DBE4DC001FC4300016DB31000DDD2B000CDD26000AA81B000472
      0100068403001A610200829C760000000000000000008CA282001F874A000AAD
      6400009437000C860E0000D8160000D8160000D8160000D8190005D81F0011DA
      290021DB370030DE450045DC550054DD630062E0710070E27F007BE388008AE3
      960091E49C009AE6A4009AE6A400A2E7AA00A2E7AA00A2E7AA009AE6A4009AE6
      A4008AE396009ECCA300EAE5E900FFFDFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFEFF00DBE4DC001FC4300016DB31000DDD2B000CDD26000AA81B000472
      0100068403001A610200829C7600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C2C2C2006A6867004444440067ABB7007FFB
      FF005DBACB001B1C1D00E1DFDF00FEFEFE00FAFAFA00FEFEFE00DDDCDC002A2F
      300062C5D7007AF2FF00577176003F3E3D0035373700B5B5B500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004B77E5000031
      CF00001EB8000000A2002828C7007E7FFF006A69FF006464FF006767FF006C6B
      FF007170FF006B6BE0006E6EB900F0F0F000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFD00CACACC007171A6008686A600F3F3F300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F6F6F600E3E3E400D4D4D0008686A6006767
      CC007A7AFB007778FF007172FF006F6FFF007E7DFF006769F3000306B1000000
      9E000000A2004746C700000000000000000000000000B8BFB500358242000DB1
      7400049B4A00097E120003C20C0000D8160000D8160000D819000BD923001ADA
      310029DC3E0037D549004DE25E005CE06C0070E27F0082E28E008AE3960091E4
      9C00A2E7AA00ABE7B200ABE7B200B1E8B600B1E8B600B1E8B600ABE7B200ABE7
      B200A2E7AA0091E49C009ECCA300EFE9EF00FFFDFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D4E3D5001FC4300016DB310011DA29000ED525000C860E000472
      0100117F0400245E0C00B8BFB5000000000000000000B8BFB500358242000DB1
      7400049B4A00097E120003C20C0000D8160000D8160000D819000BD923001ADA
      310029DC3E0037D549004DE25E005CE06C0070E27F0082E28E008AE3960091E4
      9C00A2E7AA00ABE7B200ABE7B200B1E8B600B1E8B600B1E8B600ABE7B200ABE7
      B200A2E7AA0091E49C009ECCA300EFE9EF00FFFDFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D4E3D5001FC4300016DB310011DA29000ED525000C860E000472
      0100117F0400245E0C00B8BFB500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A19F9F004D4D4D004556580078EC
      FB005EBCCD001A191A00E5E5E500FEFEFE00FAFAFA00FEFEFE00E1DFDF002A2F
      300066D0E20069BAC900393939002E3030007675750000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000095A7D7000038
      DB000023BE00000CAB000504B3006769F3007676FD006464FF006767FF006C6C
      FF006D6DF7005A5AC300C5C5D700FDFDFD00FFFFFF00FEFEFE00FEFEFE00FEFE
      FE00FFFFFF00FFFFFF00F0F0F0009393B800ABABEB009D9DC600A6A6C700FFFF
      FD00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FDFDFD00EDEDED00CECECD006E6E
      B9006B6BE0007A79FF007171FC007273FF008282FF003939DC000000A2000000
      9E000001AD008788D200000000000000000000000000000000006388550008A2
      6D000AAD6400078125000696040000D9120000D8190003D81D000ED525001EDB
      350030DE450045DC55005CE06C0062E071007BE388008AE396009AE6A400ABE7
      B200B1E8B600B8E7BC00B8E7BC00BDE8C200BDE8C200BDE8C200B8E7BC00B1E8
      B600ABE7B200A2E7AA0091E49C009ECCA300EFE9EF00FFFFFF00FFFFFF00FFFF
      FF00FFFEFF00DBE4DC001FC4300016DB310013DC2C0012B81D0004720100097B
      0200177302004B793B00000000000000000000000000000000006388550008A2
      6D000AAD6400078125000696040000D9120000D8190003D81D000ED525001EDB
      350030DE450045DC55005CE06C0062E071007BE388008AE396009AE6A400ABE7
      B200B1E8B600B8E7BC00B8E7BC00BDE8C200BDE8C200BDE8C200B8E7BC00B1E8
      B600ABE7B200A2E7AA0091E49C009ECCA300EFE9EF00FFFFFF00FFFFFF00FFFF
      FF00FFFEFF00DBE4DC001FC4300016DB310013DC2C0012B81D0004720100097B
      0200177302004B793B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C7C7C700706F6E003E363500529D
      AA0066D0E2000D090800CECDCD00FEFEFE00FEFEFE00FEFEFE00D8D7D6002127
      280062C5D7004556580036302F003F3E3D00C2C2C20000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C7C7CB001D56
      E8000031CF00001EB8000000A2002C2AD8007E7DFF006A69FF006767FF006C6B
      FF006E6EEC008788D200F9F9F800F3F3F300F6F6F600F9F9F800F9F9F800F9F9
      F800FAFAF700F9F9F800BBBDCE009D9DC600C9C9FF00C2C2F2009393B800E3E3
      E400FBFBFB00FAFAF900FAFAF900F9F9F800F9F9FA00F3F3F300EDEDED00B5B5
      C8006B6BE0007676FD007273FF007C7DFF006969FA000A0CB8000000A2000000
      A2001E1DCC00C1C3CD0000000000000000000000000000000000A2B09B001F87
      4A0012B67800049B4A00097E120003C20C0000DE130005D81F0013DA2B0025DB
      3A0037D549004DE25E005CE06C007BE3880082E28E009AE6A400A2E7AA00B1E8
      B600BDE8C200C1E9C600C9EACC00C9EACC00C9EACC00C4E9C800C4E9C800BDE8
      C200B8E7BC00ABE7B200A2E7AA008AE396009ECCA300EAE5E900FFFFFF00FFFF
      FF00FFFEFF00E9EAE9002DC13A001CE034001BD32D000C860E0004720100117F
      04001A6102009CAD940000000000000000000000000000000000A2B09B001F87
      4A0012B67800049B4A00097E120003C20C0000DE130005D81F0013DA2B0025DB
      3A0037D549004DE25E005CE06C007BE3880082E28E009AE6A400A2E7AA00B1E8
      B600BDE8C200C1E9C600C9EACC00C9EACC00C9EACC00C4E9C800C4E9C800BDE8
      C200B8E7BC00ABE7B200A2E7AA008AE396009ECCA300EAE5E900FFFFFF00FFFF
      FF00FFFEFF00E9EAE9002DC13A001CE034001BD32D000C860E0004720100117F
      04001A6102009CAD940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A8A8A8004B4848003F3E
      3D0066D0E200153D43003E363500D6D5D500FEFEFE00CACAC900413938001E45
      4B0056939D00312C2B0028272700929292000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007996
      DD000038DB00002AC700000DB3000000B5005B5BEF007C7DFF006A6AFF006C6C
      FF007070F900737FDC008181C4008686B6008686B6008686B6009393B8009393
      B8009393B800A9A9B300ABABD200C9C9F400D3D3FF00CFCEFF00B8B7EC00A6A6
      C7009393B8009393B8008686B6008686B6008686B6008686B6008181C4008788
      D2007A7AF4007778FF007676FF007C7DFF003134D5000000A5000000A2000000
      B5006767CC000000000000000000000000000000000000000000C8CAC7005681
      49001AAA78000AAD6400058736000C860E0008D51A0005DC210017DA2F0029DC
      3E003EE0520054DD630069E479007BE3880091E49C00A2E7AA00B1E8B600BDE8
      C200C4E9C800CEEBD100CEEBD100D3EBD500D3EBD500CEEBD100C9EACC00C4E9
      C800BDE8C200B1E8B600ABE7B2009AE6A4008AE396008ECB9300DCDCDC00FDFD
      FD00FFFFFF00F7F6F7003ABC44001CE0340010A6120001670600097B02001773
      0200386B2700CFCBCF0000000000000000000000000000000000C8CAC7005681
      49001AAA78000AAD6400058736000C860E0008D51A0005DC210017DA2F0029DC
      3E003EE0520054DD630069E479007BE3880091E49C00A2E7AA00B1E8B600BDE8
      C200C4E9C800CEEBD100CEEBD100D3EBD500D3EBD500CEEBD100C9EACC00C4E9
      C800BDE8C200B1E8B600ABE7B2009AE6A4008AE396008ECB9300DCDCDC00FDFD
      FD00FFFFFF00F7F6F7003ABC44001CE0340010A6120001670600097B02001773
      0200386B2700CFCBCF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000767575003630
      2F00417B850066DEF000153D4300201D1C004A4140000A060600153D43005DBA
      CB00353E3F00242323004D4D4D00CCCBCA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C1C3
      CD001D56E8000031CF000023BE000005AE001717C7007070F9007676FF006F6F
      FF007676FD007A7AF4008181F2008989ED009A9AED009A9AED00ABABEB00B8B7
      EC00B8B7EC00C2C2F200D3D3FF00D9D9FF00D9D9FF00D3D3FF00CFCEFF00C2C2
      F200B8B7EC00ABABEB00ABABEB009A9AED009A9AED008989ED008989ED008181
      F2008082FC007676FF007B7BFF005355EC000504B3000000A2000001AD001717
      C700BBBDCE00000000000000000000000000000000000000000000000000A2B0
      9B001F874A0012B67800069359000781250010A6120010DB280018DD31002DDD
      420045DC550054DD630070E27F0082E28E0091E49C00ABE7B200B8E7BC00C4E9
      C800CEEBD100D6EBD900DBECDD00DBECDD00DBECDD00D3EBD500CEEBD100C9EA
      CC00C1E9C600B8E7BC00ABE7B200A2E7AA0091E49C007BE3880075C97C00C8CA
      C700F7F6F700FFFFFF0048C7560012B81D000672080006720800117F04001B5B
      020096A98E00000000000000000000000000000000000000000000000000A2B0
      9B001F874A0012B67800069359000781250010A6120010DB280018DD31002DDD
      420045DC550054DD630070E27F0082E28E0091E49C00ABE7B200B8E7BC00C4E9
      C800CEEBD100D6EBD900DBECDD00DBECDD00DBECDD00D3EBD500CEEBD100C9EA
      CC00C1E9C600B8E7BC00ABE7B200A2E7AA0091E49C007BE3880075C97C00C8CA
      C700F7F6F700FFFFFF0048C7560012B81D000672080006720800117F04001B5B
      020096A98E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B9B9B9004B48
      48002A2C2D0058BBCC0063E8FD004EAABA003290A0004EAABA005FE4FB00356F
      7800231C1B0024232300A3A3A200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000095A7D7000038DB000031CF000014B3000005AE002C2AD8007676FD007273
      FF007777FF008383FF008E8EFF009B9BFF00A6A6FF00B2B2FF00BCBCFF00C9C9
      FF00D3D3FF00D9D9FF00E0E0FF00E0E0FF00E0E0FF00D9D9FF00D3D3FF00C9C9
      FF00C9C9FF00BCBCFF00BCBCFF00B2B2FF00A6A6FF009B9BFF009494FF008B8B
      FF007B7BFF007878FF006969FA001013BB000001A9000001AD000101BE008788
      D200000000000000000000000000000000000000000000000000000000000000
      0000568149001AAA78000DB1740004894D00097E120010A612001CDB330030DE
      450045DC55005CE06C0070E27F008AE396009AE6A400B1E8B600BDE8C200C9EA
      CC00D6EBD900DEECDF00E3ECE400E3ECE400E3ECE400DBECDD00D3EBD500C9EA
      CC00C1E9C600BDE8C200ABE7B200A2E7AA0091E49C0082E28E0070E27F005CE0
      6C009ECCA300EAE5E90060BF6600027A0100036C0A00117F0400177302004B79
      3B00000000000000000000000000000000000000000000000000000000000000
      0000568149001AAA78000DB1740004894D00097E120010A612001CDB330030DE
      450045DC55005CE06C0070E27F008AE396009AE6A400B1E8B600BDE8C200C9EA
      CC00D6EBD900DEECDF00E3ECE400E3ECE400E3ECE400DBECDD00D3EBD500C9EA
      CC00C1E9C600BDE8C200ABE7B200A2E7AA0091E49C0082E28E0070E27F005CE0
      6C009ECCA300EAE5E90060BF6600027A0100036C0A00117F0400177302004B79
      3B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008987
      8600312C2B00294E55005EECFE0064EEFE0064EEFE0064F7FF0058BBCC00201D
      1C001A191A006264640000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004B77E5000038DB00002AC7000012BA000000B9003939DC007676
      FF007474FF007E7DFF009090FF009B9BFF00A6A6FF00B2B2FF00BCBCFF00C9C9
      FF00D3D3FF00D9D9FF00E0E0FF00E0E0FF00E0E0FF00D9D9FF00D3D3FF00CFCE
      FF00C4C4FF00BCBCFF00B2B2FF00A6A6FF00A6A6FF009B9BFF009090FF007A79
      FF007576FF006A6AFC001E1DCC000001AD000005AE000004B9003939DC00CACA
      CC00000000000000000000000000000000000000000000000000000000000000
      0000B8BFB500358242001AAA78000AAD6400048244000877120012B81D0025E1
      3D004DE25E005CE06C0070E27F008AE396009AE6A400ABE7B200C1E9C600CEEB
      D100D6EBD900E3ECE400EAEEEB00EAEEEB00E3ECE400DEECDF00D3EBD500CEEB
      D100C4E9C800B8E7BC00B1E8B600A2E7AA0091E49C0082E28E0070E27F0069E4
      790034E34C003ABC44001D731E00036C0A000C7D0B00177302002D651700B8BF
      B500000000000000000000000000000000000000000000000000000000000000
      0000B8BFB500358242001AAA78000AAD6400048244000877120012B81D0025E1
      3D004DE25E005CE06C0070E27F008AE396009AE6A400ABE7B200C1E9C600CEEB
      D100D6EBD900E3ECE400EAEEEB00EAEEEB00E3ECE400DEECDF00D3EBD500CEEB
      D100C4E9C800B8E7BC00B1E8B600A2E7AA0091E49C0082E28E0070E27F0069E4
      790034E34C003ABC44001D731E00036C0A000C7D0B00177302002D651700B8BF
      B500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C2C2
      C20051515100231C1B003E9BAB0057EDFF0053E3F90056E3FA001E454B00150D
      0C0028272700B9B9B90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BBBDCE001D56E8000038DB00002AC7000012BA000101BE003134
      D5007273FF007474FF007E7DFF009494FF00A6A6FF00B2B2FF00BCBCFF00C4C4
      FF00CFCEFF00D9D9FF00E0E0FF00E0E0FF00D9D9FF00D9D9FF00CFCEFF00C9C9
      FF00C4C4FF00BCBCFF00B2B2FF00B2B2FF00A6A6FF008B8BFF007474FF007474
      FF006969FD001E1DCC000001AD000306B1000004B9001718D200B3B6CF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009CAD94001F874A0014B88E0006935900048244000C750C0010A6
      12002DDD42005CE06C007BE388008AE396009AE6A400B1E8B600BDE8C200CEEB
      D100D6EBD900E3ECE400EAEEEB00EAEEEB00E3ECE400DEECDF00D6EBD900CEEB
      D100C1E9C600B8E7BC00ABE7B2009AE6A40091E49C0082E28E0070E27F003EE0
      520012B81D00027A01000167060008771200117F04001B5B020096A98E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009CAD94001F874A0014B88E0006935900048244000C750C0010A6
      12002DDD42005CE06C007BE388008AE396009AE6A400B1E8B600BDE8C200CEEB
      D100D6EBD900E3ECE400EAEEEB00EAEEEB00E3ECE400DEECDF00D6EBD900CEEB
      D100C1E9C600B8E7BC00ABE7B2009AE6A40091E49C0082E28E0070E27F003EE0
      520012B81D00027A01000167060008771200117F04001B5B020096A98E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009A9A9A00312C2B001D32360047D4EB0050F2FF003290A000100A09000F0E
      0E007C7C7C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A7B2D4000C4DEC000031CF00002AC7000012BA000101
      BE002C2AD8006464FF007170FF007474FF008989FF00A6A6FF00BCBCFF00C9C9
      FF00CFCEFF00D3D3FF00D9D9FF00D9D9FF00D9D9FF00D3D3FF00CFCEFF00C9C9
      FF00C4C4FF00BCBCFF00B2B2FF009494FF007E7DFF006F6FFF007474FF005C5C
      FA001717C7000000B5000008B6000005BF00070FD4009497D400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000829C76001D8D530014B88E0008A26D00048244000877
      1200069604001BD32D004DE25E008AE39600A2E7AA00B1E8B600BDE8C200C9EA
      CC00D3EBD500DBECDD00E3ECE400E3ECE400DEECDF00D6EBD900D3EBD500C9EA
      CC00BDE8C200B1E8B600ABE7B200A2E7AA0091E49C005CE06C0025E13D0003A3
      03000B6E010006680E0008771200148418001D650B0076946900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000829C76001D8D530014B88E0008A26D00048244000877
      1200069604001BD32D004DE25E008AE39600A2E7AA00B1E8B600BDE8C200C9EA
      CC00D3EBD500DBECDD00E3ECE400E3ECE400DEECDF00D6EBD900D3EBD500C9EA
      CC00BDE8C200B1E8B600ABE7B200A2E7AA0091E49C005CE06C0025E13D0003A3
      03000B6E010006680E0008771200148418001D650B0076946900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CACAC9005E5F5F001F151400277A880040DDF20014282B000C0302003537
      3700C5C5C5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000095A7D7000C4DEC000038DB00002AC7000013
      C4000000B9001717C7005355EC006C6CFF006C6BFF006F6FFF008484FF009B9B
      FF00BCBCFF00C4C4FF00CFCEFF00D3D3FF00CFCEFF00CFCEFF00C4C4FF00BCBC
      FF00A6A6FF008E8EFF007777FF006C6CFF006F6FFF006A69FF004446E8000606
      BF000000B5000008B600000ABE00070FD4008788D20000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000769469001D8D530014B88E0008A26D000489
      4D00056F2300097B020009B6100025E13D005CE06C0091E49C00BDE8C200CEEB
      D100D6EBD900DBECDD00DEECDF00DEECDF00DBECDD00D6EBD900D3EBD500C9EA
      CC00C9EACC00B8E7BC009AE6A40069E4790030DE45000AC31A00068403000765
      050005691800097A1900148418001D6610006388550000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000769469001D8D530014B88E0008A26D000489
      4D00056F2300097B020009B6100025E13D005CE06C0091E49C00BDE8C200CEEB
      D100D6EBD900DBECDD00DEECDF00DEECDF00DBECDD00D6EBD900D3EBD500C9EA
      CC00C9EACC00B8E7BC009AE6A40069E4790030DE45000AC31A00068403000765
      050005691800097A1900148418001D6610006388550000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A8A8A80036302F001823250010363B000805040007090A009A9A
      9A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000095A7D7000C4DEC000038DB000031
      CF00011EC5000101BE000101BE002C2AD8005B5BEF006F6FFF007171FC006C6C
      FC007170FF007676FF008080FF008484FF008686FF008383FF007A79FF007474
      FF006C6BFF006A69FF006F6FFF006A69FF005355EC002324D1000000B9000004
      B900000ABE00000DC500070FD4008B93D7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000829C76001F874A0014B88E000CAA
      7B00069359000378390006680E00097B020009B6100014D1250034E34C0069E4
      790091E49C00B1E8B600BDE8C200C9EACC00C9EACC00BDE8C200ABE7B20091E4
      9C0069E479003EE052001BD32D0009B61000069604000765050005610B000569
      1800097A1900168828001D661000769469000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000829C76001F874A0014B88E000CAA
      7B00069359000378390006680E00097B020009B6100014D1250034E34C0069E4
      790091E49C00B1E8B600BDE8C200C9EACC00C9EACC00BDE8C200ABE7B20091E4
      9C0069E479003EE052001BD32D0009B61000069604000765050005610B000569
      1800097A1900168828001D661000769469000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000076757500242323000D09080006040400626464000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A7B2D4003265E9000142
      E9000038DB00002AC7000013C4000004B9000606BF002324D1004446E8005C5C
      FA006969FD006C6BFF006F6FFF006F6FFF006F6FFF007170FF007170FF006A69
      FF006767FF005B5BEF004446E8001E1DCC000101BE000000B9000005BF00000D
      C500000DC5002531E30095A7D700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000096A98E00358242001AAA
      780014B88E0008A26D0004894D00056F230005691800076505000696040003A3
      03000AC31A000ED525001BD32D0023D2330023D233001BD32D0015CE23000AC3
      1A0001B5040006840300097503000660000005610B0005691800078125001688
      2800168828002D6517008CA28200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000096A98E00358242001AAA
      780014B88E0008A26D0004894D00056F230005691800076505000696040003A3
      03000AC31A000ED525001BD32D0023D2330023D233001BD32D0015CE23000AC3
      1A0001B5040006840300097503000660000005610B0005691800078125001688
      2800168828002D6517008CA28200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5B5B5006A6A6A00555555006A686700BEBEBE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C1C3CD004B77
      E5000C4DEC000142E9000038DB000021CF000015CC000005BF000005BF000C0B
      C4001E1DCC002C2AD8002C2AD8002C2AD8002C2AD8002C2AD8002C2AD8002C2A
      D8001E1DCC000C0BC4000003C2000005BF00000DC5000015CC000015CC00031B
      DC004B5DDE00BBBDCE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B8BFB5005681
      49001C945F0014B88E0014B88E000CAA7B000693590004824400056F23000569
      180005610B00067208000975030004720100097503000472010004720100096B
      090005610B0005691800056F2300037839000587360013903D0013903D00207A
      2F004B793B00B0BAAC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B8BFB5005681
      49001C945F0014B88E0014B88E000CAA7B000693590004824400056F23000569
      180005610B00067208000975030004720100097503000472010004720100096B
      090005610B0005691800056F2300037839000587360013903D0013903D00207A
      2F004B793B00B0BAAC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000095A7D7003265E9000142E9000142E9000038DB00002DD9000021CF000015
      CC00000DC500000DC5000003C2000101BE000003C2000101BE000003C2000606
      BF00000DC5000015CC00011EC5000021CF000021CF00002DD900324DE4008B93
      D700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000096A98E00358242001C9C6A0014B88E0014B88E000CAA7B000CAA7B000693
      590004894D000482440003783900037839000378390003783900037839000378
      390004894D0004894D0006935900159A5200159A5200207A2F00386B27008CA2
      8200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000096A98E00358242001C9C6A0014B88E0014B88E000CAA7B000CAA7B000693
      590004894D000482440003783900037839000378390003783900037839000378
      390004894D0004894D0006935900159A5200159A5200207A2F00386B27008CA2
      8200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000095A7D7004B77E5000C4DEC000142E9000142E9000142
      E9000038DB00002DD900002DD900002DD900002DD9000021CF00002DD900002D
      D900002DD900002DD9000630E6000630E600324DE4008B93D700CACACC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C8CAC7008CA28200568149001D8D53001AAA780014B88E0014B8
      8E0014B88E0014B88E000CAA7B000CAA7B000CAA7B000CAA7B000CAA7B001AAA
      780008A26D0017A35F001D8D5300207A2F004B793B008CA28200C1C4BF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C8CAC7008CA28200568149001D8D53001AAA780014B88E0014B8
      8E0014B88E0014B88E000CAA7B000CAA7B000CAA7B000CAA7B000CAA7B001AAA
      780008A26D0017A35F001D8D5300207A2F004B793B008CA28200C1C4BF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B3B6CF007996DD004B77E5001D56
      E8000C4DEC000C4DEC000142E9000142E9000142E9000142E9000142E9000142
      E9001A48E6003265E900737FDC00A7B2D4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B0BAAC00829C7600568149003582
      42001D8D53001C945F001C9C6A001C9C6A001C9C6A001C945F001D8D53001F87
      4A003582420056814900829C7600AAB6A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B0BAAC00829C7600568149003582
      42001D8D53001C945F001C9C6A001C9C6A001C9C6A001C945F001D8D53001F87
      4A003582420056814900829C7600AAB6A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BBBDCE0095A7
      D7007996DD004B77E5004B77E5004B77E5003265E9004B77E5004B77E5007996
      DD0095A7D700BBBDCE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B8BF
      B500A2B09B008CA28200829C76007694690076946900829C76008CA28200A2B0
      9B00B8BFB5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B8BF
      B500A2B09B008CA28200829C76007694690076946900829C76008CA28200A2B0
      9B00B8BFB5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      28000000C0000000600000000100010000000000000900000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF00000000000000000000
      0000000000000000FFFFFFFFFFFF000000000000000000000000000000000000
      FFFFFFFFFFFF000000000000000000000000000000000000FFFFFC0FFFFF0000
      00000000000000000000000000000000FFFFF003FFFF00000000000000000000
      0000000000000000FFFFC000FFFF000000000000000000000000000000000000
      FFFF80007FFF000000000000000000000000000000000000FFFF00003FFF0000
      00000000000000000000000000000000FFFE00001FFF00000000000000000000
      0000000000000000FFFC00000FFF000000000000000000000000000000000000
      FFF8000007FF000000000000000000000000000000000000FFF0000003FF0000
      00000000000000000000000000000000FFF0000003FF00000000000000000000
      0000000000000000FFE0000001FF000000000000000000000000000000000000
      FFE0000001FF000000000000000000000000000000000000FFE0000001FF0000
      00000000000000000000000000000000FFC0000000FF00000000000000000000
      0000000000000000FFC0000000FF000000000000000000000000000000000000
      FFC0000000FF000000000000000000000000000000000000FF80000000FF0000
      00000000000000000000000000000000FF800000007F00000000000000000000
      0000000000000000FF800000007F000000000000000000000000000000000000
      FF800000007F000000000000000000000000000000000000FF800000007F0000
      00000000000000000000000000000000FF800000007F00000000000000000000
      0000000000000000FF800000007F000000000000000000000000000000000000
      FF800000007F000000000000000000000000000000000000FF800000007F0000
      00000000000000000000000000000000FF800000007F00000000000000000000
      0000000000000000FF800000007F000000000000000000000000000000000000
      FF800000007F000000000000000000000000000000000000FF800000007F0000
      00000000000000000000000000000000FF800000007F00000000000000000000
      0000000000000000FF800000007F000000000000000000000000000000000000
      FF800000007F000000000000000000000000000000000000FF800000007F0000
      00000000000000000000000000000000FF800000007F00000000000000000000
      0000000000000000FF800000007F000000000000000000000000000000000000
      FF800000007F000000000000000000000000000000000000FFFF00003FFF0000
      00000000000000000000000000000000FFFFC000FFFF00000000000000000000
      0000000000000000FFFFF003FFFF000000000000000000000000000000000000
      FFFFF80FFFFF000000000000000000000000000000000000FFFFFC0FFFFF0000
      00000000000000000000000000000000FFFFFC0FFFFF00000000000000000000
      0000000000000000FFFFFC0FFFFF000000000000000000000000000000000000
      FFFFFFFFFFFF000000000000000000000000000000000000FFFFFFFFFFFF0000
      00000000000000000000000000000000FFFFE007FFFFFFFFE0000000FFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000FFFFFFFF00000000FFFFFFFFFFFFFFFF0000FFFF
      FFFC00001FFFFFFC00000000FFFFFFFFFFFFFFFC00003FFFFFF000000FFFFFF0
      00000000FFFFFFFFFFFFFFF000000FFFFFC0000003FFFFC000000000FFFFFFFF
      FFFFFFE0000007FFFF80000001FFFF8000000000F00000000003FF80000001FF
      FF00000000FFFF0000000001E00000000003FF00000000FFFE000000007FFE00
      00000003E00000000003FE000000007FFC000000003FFC0000000003E0000000
      0003FC000000003FF8000000001FF80000000007E00000000003F8000000001F
      F0000000000FF00000000007F00000000007F8000000001FF0000000000FF000
      00000007F00000000007F0000000000FE00000000007E00000000007F8000000
      000FE00000000007E00000000003E00000000003F8000000000FE00000000007
      C00000000003C00000000003FC000000001FE00000000003C00000000003C000
      00000003FE000000003FC00000000003800000000001800000000001FE000000
      003FC00000000003800000000001800000000001FF000000007F800000000001
      800000000001800000000001FF000000007F8000000000010000000000000000
      00000000FF80000000FF800000000001000000000000000000000000FF800000
      00FF800000000001000000000000000000000000FFC0000001FF800000000001
      000000000000000000000000FFE0000003FF8000000000010000000000000000
      00000000FFE0000003FF800000000001000000000000000000000000FFF00000
      07FF800000000001000000000000000000000000FFF0000007FF800000000001
      000000000000000000000000FFF800000FFF8000000000010000000000000000
      00000000FFFC00000FFF800000000001000000000000000000000000FFFC0000
      1FFF800000000001800000000001800000000001FFFE00003FFF800000000001
      800000000001800000000001FFFE00003FFFC000000000038000000000018000
      00000001FFFF00007FFFC00000000003C00000000003C00000000003FFFF0000
      7FFFC00000000003C00000000003C00000000003FFFF8000FFFFE00000000007
      C00000000003C00000000003FFFFC000FFFFE00000000007E00000000007E000
      00000007FFFFC001FFFFF0000000000FF0000000000FF0000000000FFFFFE003
      FFFFF8000000000FF0000000000FF0000000000FFFFFE003FFFFF8000000001F
      F8000000001FF8000000001FFFFFF007FFFFFC000000003FFC000000003FFC00
      0000003FFFFFF007FFFFFE000000007FFE000000007FFE000000007FFFFFF80F
      FFFFFF00000000FFFF00000000FFFF00000000FFFFFFFC1FFFFFFF80000001FF
      FF80000001FFFF80000001FFFFFFFC1FFFFFFFC0000003FFFFC0000003FFFFC0
      000003FFFFFFFFFFFFFFFFF000000FFFFFF000000FFFFFF000000FFFFFFFFFFF
      FFFFFFFC00001FFFFFF800001FFFFFF800001FFFFFFFFFFFFFFFFFFF0000FFFF
      FFFF0000FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFC003FFFFFFFFE007FFFFFFFF
      E007FFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
end
