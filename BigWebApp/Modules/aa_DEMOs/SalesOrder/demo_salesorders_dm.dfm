object OE_DM: TOE_DM
  OldCreateOrder = True
  OnCreate = OE_DMCreate
  OnDestroy = OE_DMDestroy
  Height = 650
  Width = 861
  object SrcOrders: TDataSource
    DataSet = TblOrders
    OnDataChange = SrcOrdersDataChange
    Left = 22
    Top = 8
  end
  object TblOrders: TFDQuery
    BeforeInsert = TblOrdersBeforeInsert
    AfterInsert = TblOrdersAfterInsert
    BeforeEdit = TblOrdersBeforeEdit
    BeforePost = TblOrdersBeforePost
    AfterPost = TblOrdersAfterPost
    AfterDelete = TblOrdersAfterDelete
    BeforeScroll = TblOrdersBeforeScroll
    AfterScroll = TblOrdersAfterScroll
    OnCalcFields = TblOrdersCalcFields
    OnNewRecord = TblOrdersNewRecord
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'ORDERS'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = FDUpdateSQL_Orders
    SQL.Strings = (
      '  SELECT a.id,'
      '         a.orderno,'
      '         a.pono,'
      '         a.arcusto_id,'
      '         a.ord_date,'
      '         a.ord_by,'
      '         a.userid,'
      '         a.date_taken,'
      '         a.bill_to_id,'
      '         a.ship_to_id,'
      '         a.cuser1,'
      '         a.cuser2,'
      '         a.cuser3,'
      '         a.cuser5,'
      '         a.cuser6,'
      '         a.timestamp,'
      '         a.fob,'
      '         a.changeuser_id,'
      '         a.terms_id,'
      '         a.freight_id,'
      '         a.free_form,'
      '         a.discount,'
      '         a.contact_id,'
      '         a.currency_id,'
      '         a.rev,'
      '         a.oe_control,'
      '         a.eplant_id,'
      '         a.edi_855_created,'
      '         a.web_orders_id,'
      '         a.edi_change_date,'
      '         a.arcusto_credit_card_id,'
      '         a.division_id,'
      '         a.cuser4,'
      '         a.crm_quote_id,'
      '         a.comment1,'
      '         a.payment_type,'
      '         a.ext_comment1,'
      '         a.ord_line_date,'
      '         a.freight_charge,'
      '         a.freight_quoteno,'
      '         a.contact_id2,'
      '         a.campaign_id,'
      '         a.crm_opportunity_id,'
      '         a.fob_third_party_id,'
      '         a.drop_ship_po_id,'
      '         a.edi_865_created,'
      '         a.approved,'
      '         a.approval_required,'
      '         a.freight_account_number,'
      '         a.is_manual_outsource,'
      '         a.ship_complete,'
      '         b.custno AS custno,'
      '         b.company,'
      '         b.is_intercomp,'
      '         b.status_id AS arcusto_status,'
      
        '         DECODE(b.vendor_id_outsource, NULL, '#39'N'#39', '#39'Y'#39') AS is_out' +
        'source_vendor,'
      '         b.info_so AS cust_so_note,'
      '         (SELECT misc.format_name2(first_name, last_name)'
      '            FROM contact'
      '           WHERE id = a.contact_id)'
      '            AS contactname,'
      '         (SELECT curr_code'
      '            FROM currency'
      '           WHERE id = a.currency_id)'
      '            AS currencycode,'
      '         (SELECT opp_no'
      '            FROM crm_opportunity'
      '           WHERE id = a.crm_opportunity_id)'
      '            AS crm_opportunity_no,'
      '         (SELECT attn'
      '            FROM bill_to'
      '           WHERE id = a.bill_to_id)'
      '            AS bill_to_attn,'
      '         c.attn AS ship_to_attn,'
      '         c.info_so AS ship_to_so_note,'
      '         (SELECT name || '#39' ['#39' || id || '#39']'#39
      '            FROM eplant'
      '           WHERE id = a.eplant_id)'
      '            AS eplant_name,'
      '         (SELECT last_four'
      '            FROM arcusto_credit_card'
      '           WHERE id = a.arcusto_credit_card_id)'
      '            AS credit_card_last_four,'
      '         (SELECT rfq'
      '            FROM crm_quote'
      '           WHERE id = a.crm_quote_id)'
      '            AS crm_rfqno,'
      '         (SELECT pono'
      '            FROM po'
      '           WHERE id = a.drop_ship_po_id)'
      '            AS dropshippono,'
      '         (SELECT descrip'
      '            FROM freight'
      '           WHERE id = a.freight_id)'
      '            AS freight_comp,'
      '         (SELECT code'
      '            FROM campaign'
      '           WHERE id = a.campaign_id)'
      '            AS campaigncode,'
      
        '         shipman.get_carrier_acct_number(a.ship_to_id, a.freight' +
        '_id)'
      '            AS carrier_acct_number'
      '/* _FROM_START */'
      '    FROM orders a,'
      '         arcusto b,'
      '         ship_to c,'
      '         (SELECT COUNT( * ) cust_count'
      '            FROM s_user_crm_customers'
      
        '           WHERE user_name = misc.getusername AND ROWNUM < 2) x1' +
        ','
      
        '         (SELECT NVL(x.exclude_customers, '#39'N'#39') AS exclude_custom' +
        'ers'
      
        '            FROM (SELECT exclude_customers, user_name, 0 AS sort' +
        '_order'
      '                    FROM s_user_general'
      '                   WHERE user_name = misc.getusername'
      '                  UNION'
      '                  SELECT NULL, NULL, 1 FROM DUAL'
      '                  ORDER BY sort_order) x'
      '           WHERE ROWNUM < 2) x2'
      '/* _WHERE_START */'
      '   WHERE b.id(+) = a.arcusto_id AND c.id(+) = a.ship_to_id AND'
      '         (x1.cust_count = 0 OR'
      '          x2.exclude_customers = '#39'N'#39' AND'
      '          EXISTS'
      '             (SELECT 1'
      '                FROM s_user_crm_customers'
      
        '               WHERE user_name = misc.getusername AND arcusto_id' +
        ' = a.arcusto_id) OR'
      '          x2.exclude_customers = '#39'Y'#39' AND'
      '          NOT EXISTS'
      '             (SELECT 1'
      '                FROM s_user_crm_customers'
      
        '               WHERE user_name = misc.getusername AND arcusto_id' +
        ' = a.arcusto_id)) AND'
      '         misc.eplant_filter(a.eplant_id) = 1'
      'ORDER BY a.id')
    Left = 24
    Top = 29
    object TblOrdersID: TBCDField
      Tag = 1
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object TblOrdersORDERNO: TStringField
      DisplayLabel = 'Order #'
      DisplayWidth = 10
      FieldName = 'ORDERNO'
      Size = 15
    end
    object TblOrdersARCUSTO_ID: TBCDField
      Tag = 1
      DisplayLabel = 'Cust #'
      FieldName = 'ARCUSTO_ID'
      Required = True
      Visible = False
      OnChange = TblOrdersARCUSTO_IDChange
      Size = 0
    end
    object TblOrdersPONO: TStringField
      DisplayLabel = 'PO#'
      FieldName = 'PONO'
      Size = 35
    end
    object TblOrdersORD_DATE: TDateTimeField
      DisplayLabel = 'Order Date'
      FieldName = 'ORD_DATE'
      EditMask = '!99/99/0000;1; '
    end
    object TblOrdersORD_BY: TStringField
      DisplayLabel = 'Taken By'
      FieldName = 'ORD_BY'
      Size = 30
    end
    object TblOrdersDATE_TAKEN: TDateTimeField
      DisplayLabel = 'Date'
      FieldName = 'DATE_TAKEN'
      EditMask = '!99/99/0000;1; '
    end
    object TblOrdersBILL_TO_ID: TBCDField
      Tag = 1
      FieldName = 'BILL_TO_ID'
      Visible = False
      Size = 0
    end
    object TblOrdersSHIP_TO_ID: TBCDField
      Tag = 1
      FieldName = 'SHIP_TO_ID'
      Visible = False
      OnChange = TblOrdersSHIP_TO_IDChange
      Size = 0
    end
    object TblOrdersCUSER1: TStringField
      FieldName = 'CUSER1'
      Visible = False
      Size = 60
    end
    object TblOrdersCUSER2: TStringField
      FieldName = 'CUSER2'
      Visible = False
      Size = 60
    end
    object TblOrdersCUSER3: TStringField
      FieldName = 'CUSER3'
      Visible = False
      Size = 60
    end
    object TblOrdersCUSER5: TStringField
      FieldName = 'CUSER5'
      Visible = False
      Size = 60
    end
    object TblOrdersCUSER6: TStringField
      FieldName = 'CUSER6'
      Visible = False
      Size = 60
    end
    object TblOrdersTIMESTAMP: TDateTimeField
      FieldName = 'TIMESTAMP'
      Visible = False
    end
    object TblOrdersCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      FieldName = 'CUSTNO'
      Size = 10
    end
    object TblOrdersFOB: TStringField
      FieldName = 'FOB'
      Size = 60
    end
    object TblOrdersCHANGEUSER_ID: TStringField
      Tag = 1
      FieldName = 'CHANGEUSER_ID'
      Visible = False
      Size = 30
    end
    object TblOrdersTERMS_ID: TBCDField
      Tag = 1
      FieldName = 'TERMS_ID'
      Visible = False
      Size = 0
    end
    object TblOrdersCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 20
      FieldName = 'COMPANY'
      Size = 60
    end
    object TblOrdersFREIGHT_ID: TBCDField
      Tag = 1
      FieldName = 'FREIGHT_ID'
      Visible = False
      OnChange = TblOrdersFREIGHT_IDChange
      Size = 0
    end
    object TblOrdersFREIGHT_COMP: TStringField
      DisplayWidth = 30
      FieldName = 'FREIGHT_COMP'
      Visible = False
      Size = 30
    end
    object TblOrdersFREE_FORM: TStringField
      FieldName = 'FREE_FORM'
      Visible = False
      Size = 1
    end
    object TblOrdersDISCOUNT: TBCDField
      DisplayLabel = 'Discount'
      FieldName = 'DISCOUNT'
      OnChange = TblOrdersDISCOUNTChange
      Size = 2
    end
    object TblOrdersUSERID: TStringField
      DisplayLabel = 'User ID'
      FieldName = 'USERID'
      Size = 35
    end
    object TblOrdersCONTACT_ID: TBCDField
      Tag = 1
      FieldName = 'CONTACT_ID'
      Visible = False
      Size = 0
    end
    object TblOrdersCONTACTNAME: TStringField
      DisplayLabel = 'Contact Name'
      DisplayWidth = 20
      FieldName = 'CONTACTNAME'
      Size = 60
    end
    object TblOrdersCURRENCY_ID: TBCDField
      Tag = 1
      FieldName = 'CURRENCY_ID'
      Visible = False
      Size = 0
    end
    object TblOrdersREV: TBCDField
      DisplayLabel = 'Revision'
      FieldName = 'REV'
      Size = 0
    end
    object TblOrdersOE_CONTROL: TStringField
      DisplayLabel = 'OE Control'
      FieldName = 'OE_CONTROL'
      Size = 60
    end
    object TblOrdersEPLANT_ID: TBCDField
      Tag = 1
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object TblOrdersEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant Name'
      FieldName = 'EPLANT_NAME'
    end
    object TblOrdersEDI_855_CREATED: TStringField
      FieldName = 'EDI_855_CREATED'
      Visible = False
      Size = 1
    end
    object TblOrdersWEB_ORDERS_ID: TBCDField
      Tag = 1
      FieldName = 'WEB_ORDERS_ID'
      Visible = False
      Size = 0
    end
    object TblOrdersARCUSTO_CREDIT_CARD_ID: TBCDField
      Tag = 1
      FieldName = 'ARCUSTO_CREDIT_CARD_ID'
      Visible = False
      Size = 0
    end
    object TblOrdersDIVISION_ID: TBCDField
      Tag = 1
      DisplayLabel = 'Division ID'
      FieldName = 'DIVISION_ID'
      Visible = False
      Size = 0
    end
    object TblOrdersCRM_QUOTE_ID: TBCDField
      Tag = 1
      FieldName = 'CRM_QUOTE_ID'
      Visible = False
      Size = 0
    end
    object TblOrdersIS_INTERCOMP: TStringField
      FieldName = 'IS_INTERCOMP'
      Visible = False
      Size = 1
    end
    object TblOrdersCOMMENT1: TStringField
      FieldName = 'COMMENT1'
      Visible = False
      Size = 255
    end
    object TblOrdersARCUSTO_STATUS: TStringField
      FieldName = 'ARCUSTO_STATUS'
      Visible = False
    end
    object TblOrdersIS_OUTSOURCE_VENDOR: TStringField
      FieldName = 'IS_OUTSOURCE_VENDOR'
      Visible = False
    end
    object TblOrdersPAYMENT_TYPE: TFMTBCDField
      FieldName = 'PAYMENT_TYPE'
      Visible = False
      Size = 38
    end
    object TblOrdersPaymentTypeStr: TStringField
      DisplayLabel = 'Payment Type'
      FieldKind = fkCalculated
      FieldName = 'PaymentTypeStr'
      Visible = False
      Calculated = True
    end
    object TblOrdersEXT_COMMENT1: TStringField
      DisplayLabel = 'Extended Comment'
      FieldName = 'EXT_COMMENT1'
      Visible = False
      Size = 2000
    end
    object TblOrdersEDI_CHANGE_DATE: TDateTimeField
      FieldName = 'EDI_CHANGE_DATE'
      Visible = False
    end
    object TblOrdersCUSER4: TStringField
      FieldName = 'CUSER4'
      Visible = False
      Size = 60
    end
    object TblOrdersORD_LINE_DATE: TDateTimeField
      FieldName = 'ORD_LINE_DATE'
      Visible = False
      OnChange = TblOrdersORD_LINE_DATEChange
    end
    object TblOrdersCRM_RFQNO: TStringField
      FieldName = 'CRM_RFQNO'
      Visible = False
    end
    object TblOrdersFREIGHT_CHARGE: TFMTBCDField
      FieldName = 'FREIGHT_CHARGE'
      Visible = False
      OnGetText = DoGetText_NullToZeroCurrency
      currency = True
      Size = 6
    end
    object TblOrdersFREIGHT_QUOTENO: TStringField
      FieldName = 'FREIGHT_QUOTENO'
      Visible = False
      Size = 30
    end
    object TblOrdersCONTACT_ID2: TBCDField
      Tag = 1
      FieldName = 'CONTACT_ID2'
      Visible = False
      Size = 0
    end
    object TblOrdersCRM_OPPORTUNITY_ID: TBCDField
      Tag = 1
      FieldName = 'CRM_OPPORTUNITY_ID'
      Visible = False
      Size = 0
    end
    object TblOrdersCRM_OPPORTUNITY_NO: TStringField
      FieldName = 'CRM_OPPORTUNITY_NO'
      Visible = False
    end
    object TblOrdersFOB_THIRD_PARTY_ID: TBCDField
      Tag = 1
      FieldName = 'FOB_THIRD_PARTY_ID'
      Visible = False
      Size = 0
    end
    object TblOrdersCURRENCYCODE: TStringField
      DisplayLabel = 'Currency Code'
      FieldName = 'CURRENCYCODE'
      Size = 10
    end
    object TblOrdersCUST_SO_NOTE: TStringField
      DisplayWidth = 2000
      FieldName = 'CUST_SO_NOTE'
      Visible = False
      Size = 2000
    end
    object TblOrdersSHIP_TO_SO_NOTE: TStringField
      FieldName = 'SHIP_TO_SO_NOTE'
      Visible = False
      Size = 255
    end
    object TblOrdersEDI_865_CREATED: TStringField
      FieldName = 'EDI_865_CREATED'
      Visible = False
      Size = 1
    end
    object TblOrdersDROP_SHIP_PO_ID: TBCDField
      Tag = 1
      FieldName = 'DROP_SHIP_PO_ID'
      Visible = False
      Size = 0
    end
    object TblOrdersDROPSHIPPONO: TStringField
      FieldName = 'DROPSHIPPONO'
      Visible = False
      Size = 35
    end
    object TblOrdersCAMPAIGN_ID: TBCDField
      Tag = 1
      FieldName = 'CAMPAIGN_ID'
      Visible = False
      Size = 0
    end
    object TblOrdersCAMPAIGNCODE: TStringField
      DisplayLabel = 'Campaign Code'
      DisplayWidth = 20
      FieldName = 'CAMPAIGNCODE'
      Visible = False
      Size = 10
    end
    object TblOrdersCARRIER_ACCT_NUMBER: TStringField
      FieldName = 'CARRIER_ACCT_NUMBER'
      Visible = False
      Size = 15
    end
    object TblOrdersAPPROVED: TStringField
      DisplayLabel = 'Approved'
      FieldName = 'APPROVED'
      Visible = False
      Size = 1
    end
    object TblOrdersAPPROVAL_REQUIRED: TStringField
      FieldName = 'APPROVAL_REQUIRED'
      Visible = False
      Size = 1
    end
    object TblOrdersFREIGHT_ACCOUNT_NUMBER: TStringField
      FieldName = 'FREIGHT_ACCOUNT_NUMBER'
      Visible = False
      Size = 15
    end
    object TblOrdersIS_MANUAL_OUTSOURCE: TStringField
      FieldName = 'IS_MANUAL_OUTSOURCE'
      Visible = False
      Size = 1
    end
    object TblOrdersCustDiscount: TStringField
      FieldKind = fkCalculated
      FieldName = 'CustDiscount'
      Visible = False
      Calculated = True
    end
    object TblOrdersSHIP_COMPLETE: TStringField
      FieldName = 'SHIP_COMPLETE'
      Origin = 'SHIP_COMPLETE'
      Visible = False
      Size = 1
    end
    object TblOrdersBILL_TO_ATTN: TStringField
      DisplayLabel = 'Bill To'
      FieldName = 'BILL_TO_ATTN'
      Origin = 'BILL_TO_ATTN'
      Size = 60
    end
    object TblOrdersSHIP_TO_ATTN: TStringField
      DisplayLabel = 'Ship To'
      FieldName = 'SHIP_TO_ATTN'
      Origin = 'SHIP_TO_ATTN'
      Size = 60
    end
    object TblOrdersCREDIT_CARD_LAST_FOUR: TStringField
      FieldName = 'CREDIT_CARD_LAST_FOUR'
      Origin = 'CREDIT_CARD_LAST_FOUR'
      Visible = False
      Size = 4
    end
  end
  object tblOrd_detail: TFDTable
    BeforeOpen = AssignEPlantFilter
    BeforeInsert = tblOrd_detailBeforeInsert
    BeforeEdit = tblOrd_detailBeforeEdit
    BeforePost = tblOrd_detailBeforePost
    AfterPost = tblOrd_detailAfterPost
    AfterCancel = tblOrd_detailAfterCancel
    BeforeDelete = tblOrd_detailBeforeDelete
    AfterDelete = tblOrd_detailAfterPost
    OnCalcFields = tblOrd_detailCalcFields
    OnNewRecord = TblOrd_detailNewRecord
    Filtered = True
    OnFilterRecord = tblOrd_detailFilterRecord
    IndexFieldNames = 'ORDERS_ID;ORD_DET_SEQNO'
    MasterSource = SrcOrders
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'ORD_DETAIL'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'ORD_DETAIL'
    Left = 218
    Top = 39
    object tblOrd_detailORD_DET_SEQNO: TBCDField
      DisplayLabel = '#'
      DisplayWidth = 5
      FieldName = 'ORD_DET_SEQNO'
      Required = True
      DisplayFormat = '#####'
      Size = 0
    end
    object tblOrd_detailItemNumber: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'ItemNumber'
      Size = 30
      Calculated = True
    end
    object tblOrd_detailDisp_Descript: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Disp_Descript'
      Required = True
      Size = 100
      Calculated = True
    end
    object tblOrd_detailArinvtRev: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 6
      FieldKind = fkCalculated
      FieldName = 'ArinvtRev'
      ReadOnly = True
      Size = 15
      Calculated = True
    end
    object tblOrd_detailArinvtClass: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 6
      FieldKind = fkCalculated
      FieldName = 'ArinvtClass'
      ReadOnly = True
      Size = 15
      Calculated = True
    end
    object tblOrd_detailTOTAL_QTY_ORD: TBCDField
      DisplayLabel = 'Blanket Qty'
      DisplayWidth = 10
      FieldName = 'TOTAL_QTY_ORD'
      OnChange = tblOrd_detailTOTAL_QTY_ORDChange
    end
    object tblOrd_detailBackLog: TFloatField
      DisplayLabel = 'Backlog'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'BackLog'
      Calculated = True
    end
    object tblOrd_detailCUMM_SHIPPED: TBCDField
      DisplayLabel = 'Qty Shipped'
      DisplayWidth = 10
      FieldName = 'CUMM_SHIPPED'
      ReadOnly = True
    end
    object TblOrd_detailUNIT_PRICE: TFMTBCDField
      DisplayLabel = 'Price'
      DisplayWidth = 10
      FieldName = 'UNIT_PRICE'
      OnChange = TblOrd_detailUNIT_PRICEChange
      DisplayFormat = '###,###,##0.#######'
      Size = 6
    end
    object tblOrd_detailTax_Code: TStringField
      DisplayLabel = 'Tax Code'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Tax_Code'
      Calculated = True
    end
    object tblOrd_detailTot_Releases: TFloatField
      DisplayLabel = 'Total Releases'
      DisplayWidth = 11
      FieldKind = fkCalculated
      FieldName = 'Tot_Releases'
      Calculated = True
    end
    object tblOrd_detailTotalPrice: TFloatField
      DisplayLabel = 'Total Price'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'TotalPrice'
      currency = True
      Calculated = True
    end
    object tblOrd_detailONHOLD: TStringField
      DisplayLabel = 'On Hold'
      DisplayWidth = 7
      FieldName = 'ONHOLD'
      EditMask = '>L'
      Size = 1
    end
    object tblOrd_detailSHIPHOLD: TStringField
      DisplayLabel = 'Ship Hold'
      DisplayWidth = 7
      FieldName = 'SHIPHOLD'
      Size = 1
    end
    object TblOrd_detailPRICE_PER_1000: TFMTBCDField
      DisplayLabel = 'Price/1000'
      DisplayWidth = 10
      FieldName = 'PRICE_PER_1000'
      Size = 6
    end
    object tblOrd_detailSalesPerson: TStringField
      DisplayLabel = 'Salesperson(s)'
      DisplayWidth = 11
      FieldKind = fkCalculated
      FieldName = 'SalesPerson'
      Calculated = True
    end
    object TblOrd_detailLIST_UNIT_PRICE: TFMTBCDField
      DisplayLabel = 'List Unit Price'
      DisplayWidth = 10
      FieldName = 'LIST_UNIT_PRICE'
      ReadOnly = True
      Size = 6
    end
    object tblOrd_detailDISCOUNT: TBCDField
      DisplayLabel = 'Discount %'
      DisplayWidth = 10
      FieldName = 'DISCOUNT'
      Size = 2
    end
    object tblOrd_detailAkaDescrip: TStringField
      DisplayLabel = 'AKA Description'
      DisplayWidth = 13
      FieldKind = fkCalculated
      FieldName = 'AkaDescrip'
      Size = 35
      Calculated = True
    end
    object tblOrd_detailAkaItemNo: TStringField
      DisplayLabel = 'AKA Item #'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'AkaItemNo'
      Size = 50
      Calculated = True
    end
    object tblOrd_detailUNIT: TStringField
      DisplayLabel = 'UOM'
      DisplayWidth = 10
      FieldName = 'UNIT'
      Size = 10
    end
    object tblOrd_detailCOMMENT1: TStringField
      DisplayLabel = 'Note'
      DisplayWidth = 20
      FieldName = 'COMMENT1'
      Size = 2000
    end
    object tblOrd_detailTotalComm: TFloatField
      DisplayLabel = 'Total Commissions'
      DisplayWidth = 14
      FieldKind = fkCalculated
      FieldName = 'TotalComm'
      currency = True
      Calculated = True
    end
    object tblOrd_detailCommPrcnt: TFloatField
      DisplayLabel = 'Commission %'
      DisplayWidth = 11
      FieldKind = fkCalculated
      FieldName = 'CommPrcnt'
      Calculated = True
    end
    object tblOrd_detailCost_Source: TStringField
      DisplayLabel = 'Cost Source'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Cost_Source'
      Size = 60
      Calculated = True
    end
    object tblOrd_detailEPlant_Name: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'EPlant_Name'
      LookupDataSet = QryEPlant
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIP'
      KeyFields = 'EPLANT_ID'
      ReadOnly = True
      Calculated = True
    end
    object tblOrd_detailDOCKID: TStringField
      DisplayLabel = 'Dock ID'
      DisplayWidth = 10
      FieldName = 'DOCKID'
      Size = 30
    end
    object tblOrd_detailLINEFEED: TStringField
      DisplayLabel = 'Line Feed'
      DisplayWidth = 10
      FieldName = 'LINEFEED'
      Size = 30
    end
    object tblOrd_detailRESERVELOCATION: TStringField
      DisplayLabel = 'Reserve Location'
      DisplayWidth = 14
      FieldName = 'RESERVELOCATION'
      Size = 30
    end
    object tblOrd_detailTotal_invoiced: TFloatField
      DisplayLabel = 'Quantity Invoiced'
      DisplayWidth = 13
      FieldKind = fkCalculated
      FieldName = 'Total_invoiced'
      Calculated = True
    end
    object tblOrd_detailKBTRIGGER: TStringField
      DisplayLabel = 'KB Trigger'
      DisplayWidth = 30
      FieldName = 'KBTRIGGER'
      Size = 30
    end
    object tblOrd_detailCUST_CUM_START: TBCDField
      DisplayLabel = 'Customer Cum. Start'
      DisplayWidth = 16
      FieldName = 'CUST_CUM_START'
    end
    object tblOrd_detailLAST_RECEIPT_QTY: TBCDField
      DisplayLabel = 'Last Receipt Quantity'
      DisplayWidth = 17
      FieldName = 'LAST_RECEIPT_QTY'
    end
    object tblOrd_detailLAST_RECEIPT_DATE: TDateTimeField
      DisplayLabel = 'Last Receipt Date'
      DisplayWidth = 18
      FieldName = 'LAST_RECEIPT_DATE'
    end
    object tblOrd_detailREF_CODE: TStringField
      DisplayLabel = 'Reference Code'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'REF_CODE'
      LookupDataSet = QryRefCode
      LookupKeyFields = 'REF_CODE_ID'
      LookupResultField = 'REF_CODE'
      KeyFields = 'REF_CODE_ID'
      Calculated = True
    end
    object tblOrd_detailREF_CODE_DESCRIP: TStringField
      DisplayLabel = 'Reference Code Description'
      DisplayWidth = 60
      FieldKind = fkCalculated
      FieldName = 'REF_CODE_DESCRIP'
      LookupDataSet = QryRefCode
      LookupKeyFields = 'REF_CODE_ID'
      LookupResultField = 'REF_CODE_DESCRIP'
      KeyFields = 'REF_CODE_ID'
      Size = 60
      Calculated = True
    end
    object tblOrd_detailFAB_END_DATE: TDateTimeField
      DisplayLabel = 'Fab End Date'
      DisplayWidth = 18
      FieldName = 'FAB_END_DATE'
      ReadOnly = True
    end
    object tblOrd_detailFAB_QTY: TBCDField
      DisplayLabel = 'Fab Quantity'
      DisplayWidth = 10
      FieldName = 'FAB_QTY'
      ReadOnly = True
    end
    object tblOrd_detailFAB_START_DATE: TDateTimeField
      DisplayLabel = 'Fab Start Date'
      DisplayWidth = 18
      FieldName = 'FAB_START_DATE'
      ReadOnly = True
    end
    object tblOrd_detailRAW_MT_QTY: TBCDField
      DisplayLabel = 'Raw Material Quantity'
      DisplayWidth = 17
      FieldName = 'RAW_MT_QTY'
      ReadOnly = True
    end
    object tblOrd_detailCONTAINERS: TBCDField
      DisplayLabel = 'Containers'
      DisplayWidth = 10
      FieldName = 'CONTAINERS'
    end
    object tblOrd_detailAkaRev: TStringField
      DisplayLabel = 'AKA Revision'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'AkaRev'
      Calculated = True
    end
    object tblOrd_detailAcct: TStringField
      DisplayLabel = 'GL Account'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'ACCT'
      Size = 50
      Calculated = True
    end
    object tblOrd_detailIS_DROP_SHIP: TStringField
      DisplayLabel = 'Drop Ship'
      DisplayWidth = 7
      FieldName = 'IS_DROP_SHIP'
      Size = 1
    end
    object tblOrd_detailIS_MAKE_TO_ORDER: TStringField
      DisplayLabel = 'Make To Order'
      DisplayWidth = 13
      FieldName = 'IS_MAKE_TO_ORDER'
      Size = 1
    end
    object tblOrd_detailHardAllocatedVia: TStringField
      DisplayLabel = 'Hard Allocated Via'
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'HardAllocatedVia'
      Calculated = True
    end
    object tblOrd_detailPO_INFO: TStringField
      DisplayLabel = 'PO Info'
      DisplayWidth = 60
      FieldName = 'PO_INFO'
      Size = 60
    end
    object tblOrd_detailICT_Ship_To_From_Attn: TStringField
      DisplayLabel = 'ICT Ship From'
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'ICT_Ship_To_From_Attn'
      Size = 60
      Calculated = True
    end
    object tblOrd_detailDescription2: TStringField
      DisplayLabel = 'Ext. Description'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Description2'
      Size = 100
      Calculated = True
    end
    object tblOrd_detailCampaignCode: TStringField
      DisplayLabel = 'Campaign Code'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'CampaignCode'
      LookupDataSet = QryCampaign
      LookupKeyFields = 'ID'
      LookupResultField = 'CODE'
      KeyFields = ' '
      Calculated = True
    end
    object tblOrd_detailCUSER1: TStringField
      DisplayLabel = 'User Text 1'
      DisplayWidth = 18
      FieldName = 'CUSER1'
      Size = 255
    end
    object tblOrd_detailCUSER2: TStringField
      DisplayLabel = 'User Text 2'
      DisplayWidth = 18
      FieldName = 'CUSER2'
      Size = 255
    end
    object tblOrd_detailCUSER3: TStringField
      DisplayLabel = 'User Text 3'
      DisplayWidth = 18
      FieldName = 'CUSER3'
      Size = 255
    end
    object tblOrd_detailRebateParam: TStringField
      DisplayLabel = 'Rebate Parameter'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'RebateParam'
      Calculated = True
    end
    object tblOrd_detailHIDE: TStringField
      DisplayLabel = 'Hide'
      DisplayWidth = 5
      FieldName = 'HIDE'
      Size = 1
    end
    object tblOrd_detailAkaDescrip2: TStringField
      DisplayLabel = 'AKA Ext Description'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'AkaDescrip2'
      ReadOnly = True
      Size = 100
      Calculated = True
    end
    object tblOrd_detailDivision: TStringField
      DisplayLabel = 'Ship Division'
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'Division'
      Size = 30
      Calculated = True
    end
    object tblOrd_detailMfgNo: TStringField
      DisplayLabel = 'Mfg #'
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'MfgNo'
      Size = 25
      Calculated = True
    end
    object tblOrd_detailAKA_KIND: TStringField
      DisplayLabel = 'AKA Kind'
      DisplayWidth = 10
      FieldName = 'AKA_KIND'
      ReadOnly = True
      Size = 10
    end
    object tblOrd_detailMfgnoDefault: TStringField
      DisplayLabel = 'Default Mfg #'
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'MfgnoDefault'
      Size = 25
      Calculated = True
    end
    object tblOrd_detailAUTO_INVOICE: TStringField
      DisplayLabel = 'Auto Invoice'
      DisplayWidth = 10
      FieldName = 'AUTO_INVOICE'
      Size = 1
    end
    object tblOrd_detailNonCommitted: TFloatField
      DisplayLabel = 'Non-Committed'
      DisplayWidth = 12
      FieldKind = fkCalculated
      FieldName = 'NonCommitted'
      Calculated = True
    end
    object tblOrd_detailOnHand: TFloatField
      DisplayLabel = 'On Hand'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'OnHand'
      Calculated = True
    end
    object tblOrd_detailHasQualityException: TStringField
      DisplayLabel = 'Quality Issues'
      DisplayWidth = 11
      FieldKind = fkCalculated
      FieldName = 'HasQualityException'
      ReadOnly = True
      Size = 1
      Calculated = True
    end
    object tblOrd_detailSAMPLE: TStringField
      DisplayLabel = 'Sample'
      DisplayWidth = 1
      FieldName = 'SAMPLE'
      OnChange = tblOrd_detailSAMPLEChange
      OnValidate = tblOrd_detailSAMPLEValidate
      Size = 1
    end
    object tblOrd_detailTotalShipInv: TFloatField
      DisplayLabel = 'Shipped Qty Invoiced'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'TotalShipInv'
      Calculated = True
    end
    object tblOrd_detailConfigCode: TStringField
      DisplayLabel = 'Config Code'
      DisplayWidth = 12
      FieldKind = fkCalculated
      FieldName = 'ConfigCode'
      Size = 255
      Calculated = True
    end
    object tblOrd_detailDetailDiscount: TStringField
      DisplayLabel = 'Discount'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'DetailDiscount'
      Calculated = True
    end
    object tblOrd_detailECODE: TStringField
      DisplayLabel = 'ECode'
      DisplayWidth = 10
      FieldName = 'ECODE'
      ReadOnly = True
      Visible = False
      Size = 10
    end
    object tblOrd_detailMISC_ITEM: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 250
      FieldName = 'MISC_ITEM'
      Visible = False
      Size = 250
    end
    object tblOrd_detailArinvt_Unit: TStringField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Arinvt_Unit'
      Visible = False
      Size = 10
      Calculated = True
    end
    object tblOrd_detailDescription: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Description'
      Visible = False
      Size = 100
      Calculated = True
    end
    object tblOrd_detailLookupItemNumber: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'LookupItemNumber'
      Visible = False
      Size = 25
      Calculated = True
    end
    object tblOrd_detailID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object tblOrd_detailORDERS_ID: TBCDField
      FieldName = 'ORDERS_ID'
      Visible = False
      Size = 0
    end
    object tblOrd_detailARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Visible = False
      OnChange = TblOrd_detailARINVT_IDChange
      Size = 0
    end
    object tblOrd_detailTAX_CODE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'TAX_CODE_ID'
      Visible = False
      Size = 0
    end
    object tblOrd_detailSALESPEOPLE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SALESPEOPLE_ID'
      Visible = False
      Size = 0
    end
    object tblOrd_detailEPLANT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
    object tblOrd_detailCOMM_PCT: TBCDField
      FieldName = 'COMM_PCT'
      Visible = False
      Size = 3
    end
    object tblOrd_detailCOST_OBJECT_SOURCE: TStringField
      DisplayWidth = 50
      FieldName = 'COST_OBJECT_SOURCE'
      Visible = False
      Size = 50
    end
    object tblOrd_detailCOST_OBJECT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'COST_OBJECT_ID'
      Visible = False
      Size = 0
    end
    object tblOrd_detailUOM_FACTOR: TFMTBCDField
      FieldName = 'UOM_FACTOR'
      Visible = False
    end
    object tblOrd_detailGLACCT_ID: TBCDField
      FieldName = 'GLACCT_ID'
      Visible = False
      Size = 0
    end
    object tblOrd_detailRMA_DETAIL_ID: TBCDField
      FieldName = 'RMA_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object tblOrd_detailMISC_ITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 18
      FieldName = 'MISC_ITEMNO'
      Visible = False
      Size = 50
    end
    object tblOrd_detailREF_CODE_ID: TBCDField
      FieldName = 'REF_CODE_ID'
      Visible = False
      Size = 0
    end
    object tblOrd_detailSHIP_TO_ID_FROM: TBCDField
      FieldName = 'SHIP_TO_ID_FROM'
      Visible = False
      Size = 0
    end
    object tblOrd_detailMAKE_TO_ORDER_PS_TICKET_DTL_ID: TBCDField
      FieldName = 'MAKE_TO_ORDER_PS_TICKET_DTL_ID'
      Visible = False
      Size = 0
    end
    object tblOrd_detailCAMPAIGN_ID: TBCDField
      FieldName = 'CAMPAIGN_ID'
      Visible = False
      Size = 0
    end
    object tblOrd_detailIN_TRANSIT_PARTNO_ID: TBCDField
      FieldName = 'IN_TRANSIT_PARTNO_ID'
      Visible = False
      Size = 0
    end
    object tblOrd_detailCRM_QUOTE_DETAIL_ID: TBCDField
      FieldName = 'CRM_QUOTE_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object tblOrd_detailREBATE_PARAMS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'REBATE_PARAMS_ID'
      Visible = False
      Size = 0
    end
    object tblOrd_detailPhantom: TStringField
      FieldKind = fkCalculated
      FieldName = 'Phantom'
      Visible = False
      Size = 1
      Calculated = True
    end
    object tblOrd_detailPHANTOM_ORD_DETAIL_ID: TBCDField
      FieldName = 'PHANTOM_ORD_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object tblOrd_detailPHANTOM_PTSPER: TFMTBCDField
      FieldName = 'PHANTOM_PTSPER'
      Visible = False
      Size = 6
    end
    object tblOrd_detailIncludePhantomComponents: TStringField
      FieldKind = fkCalculated
      FieldName = 'IncludePhantomComponents'
      Visible = False
      Size = 1
      Calculated = True
    end
    object tblOrd_detailSTANDARD_ID: TBCDField
      FieldName = 'STANDARD_ID'
      Visible = False
      Size = 0
    end
    object tblOrd_detailDIVISION_ID: TBCDField
      FieldName = 'DIVISION_ID'
      Visible = False
      Size = 0
    end
    object tblOrd_detailMfg_Division: TStringField
      FieldKind = fkCalculated
      FieldName = 'Mfg_Division'
      ReadOnly = True
      Visible = False
      Size = 30
      Calculated = True
    end
    object tblOrd_detailC_PO_MISC_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'C_PO_MISC_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcOrd_Detail: TDataSource
    DataSet = tblOrd_detail
    OnDataChange = SrcOrd_DetailDataChange
    Left = 216
    Top = 8
  end
  object SrcReleases: TDataSource
    DataSet = QryReleases
    OnDataChange = SrcReleasesDataChange
    Left = 312
    Top = 8
  end
  object SrcBill_To: TDataSource
    DataSet = TblBill_to
    Left = 24
    Top = 179
  end
  object TblBill_to: TFDTable
    Tag = 1
    OnCalcFields = TblBill_toCalcFields
    IndexFieldNames = 'ID'
    MasterSource = SrcOrders
    MasterFields = 'BILL_TO_ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'BILL_TO'
    TableName = 'BILL_TO'
    Left = 24
    Top = 200
    object TblBill_toID: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object TblBill_toARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Required = True
      Size = 0
    end
    object TblBill_toATTN: TStringField
      DisplayWidth = 30
      FieldName = 'ATTN'
      Size = 60
    end
    object TblBill_toADDR1: TStringField
      DisplayWidth = 30
      FieldName = 'ADDR1'
      Size = 60
    end
    object TblBill_toADDR2: TStringField
      DisplayWidth = 30
      FieldName = 'ADDR2'
      Size = 60
    end
    object TblBill_toADDR3: TStringField
      DisplayWidth = 30
      FieldName = 'ADDR3'
      Size = 60
    end
    object TblBill_toCITY: TStringField
      FieldName = 'CITY'
      Size = 30
    end
    object TblBill_toSTATE: TStringField
      FieldName = 'STATE'
    end
    object TblBill_toCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Size = 100
    end
    object TblBill_toZIP: TStringField
      FieldName = 'ZIP'
      Size = 10
    end
    object TblBill_toPHONE_NUMBER: TStringField
      FieldName = 'PHONE_NUMBER'
      Size = 25
    end
    object TblBill_toFAX: TStringField
      FieldName = 'FAX'
      Size = 25
    end
    object TblBill_toPRIME_CONTACT: TStringField
      FieldName = 'PRIME_CONTACT'
      Size = 30
    end
    object TblBill_toEXT: TStringField
      FieldName = 'EXT'
      Size = 5
    end
    object TblBill_toCityStateZip: TStringField
      FieldKind = fkCalculated
      FieldName = 'CityStateZip'
      Calculated = True
    end
  end
  object SrcShip_To: TDataSource
    DataSet = TblShip_To
    Left = 88
    Top = 179
  end
  object TblShip_To: TFDTable
    Tag = 1
    OnCalcFields = TblShip_ToCalcFields
    IndexFieldNames = 'ID'
    MasterSource = SrcOrders
    MasterFields = 'SHIP_TO_ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'SHIP_TO'
    TableName = 'SHIP_TO'
    Left = 88
    Top = 200
    object TblShip_ToID: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object TblShip_ToARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Required = True
      Size = 0
    end
    object TblShip_ToATTN: TStringField
      DisplayWidth = 30
      FieldName = 'ATTN'
      Size = 60
    end
    object TblShip_ToADDR1: TStringField
      DisplayWidth = 30
      FieldName = 'ADDR1'
      Size = 60
    end
    object TblShip_ToADDR2: TStringField
      DisplayWidth = 30
      FieldName = 'ADDR2'
      Size = 60
    end
    object TblShip_ToADDR3: TStringField
      DisplayWidth = 30
      FieldName = 'ADDR3'
      Size = 60
    end
    object TblShip_ToCITY: TStringField
      FieldName = 'CITY'
      Size = 30
    end
    object TblShip_ToSTATE: TStringField
      FieldName = 'STATE'
    end
    object TblShip_ToCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Size = 100
    end
    object TblShip_ToZIP: TStringField
      FieldName = 'ZIP'
      Size = 10
    end
    object TblShip_ToSHIP_TIME: TBCDField
      FieldName = 'SHIP_TIME'
      Size = 3
    end
    object TblShip_ToPHONE_NUMBER: TStringField
      FieldName = 'PHONE_NUMBER'
      Size = 25
    end
    object TblShip_ToFAX: TStringField
      FieldName = 'FAX'
      Size = 25
    end
    object TblShip_ToPRIME_CONTACT: TStringField
      FieldName = 'PRIME_CONTACT'
      Size = 30
    end
    object TblShip_ToEXT: TStringField
      FieldName = 'EXT'
      Size = 5
    end
    object TblShip_ToCityStateZip: TStringField
      FieldKind = fkCalculated
      FieldName = 'CityStateZip'
      Calculated = True
    end
    object TblShip_ToTAX_CODE_ID: TBCDField
      FieldName = 'TAX_CODE_ID'
      Size = 0
    end
    object TblShip_ToFREIGHT_ID: TBCDField
      FieldName = 'FREIGHT_ID'
      Size = 0
    end
    object TblShip_ToFreight_comp: TStringField
      FieldKind = fkLookup
      FieldName = 'Freight_comp'
      LookupDataSet = TblFreight
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIP'
      KeyFields = 'FREIGHT_ID'
      Lookup = True
    end
    object TblShip_ToFOB: TStringField
      FieldName = 'FOB'
      Size = 60
    end
    object TblShip_ToFOB_THIRD_PARTY_ID: TBCDField
      FieldName = 'FOB_THIRD_PARTY_ID'
      Size = 0
    end
  end
  object QryBillTo: TFDQuery
    Tag = 1
    BeforeOpen = QryBillToBeforeOpen
    Filtered = True
    Filter = 'PK_HIDE='#39'N'#39' or PK_HIDE=NULL'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      '  SELECT id,'
      '         arcusto_id,'
      '         attn,'
      '         addr1,'
      '         addr2,'
      '         addr3,'
      '         city,'
      '         state,'
      '         country,'
      '         zip,'
      '         phone_number,'
      '         ext,'
      '         fax,'
      '         prime_contact,'
      '         pk_hide'
      '    FROM bill_to a'
      '   WHERE arcusto_id = :ARCUSTO_ID'
      'ORDER BY attn')
    Left = 152
    Top = 124
    ParamData = <
      item
        Name = 'ARCUSTO_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryBillToATTN: TStringField
      DisplayLabel = 'Bill To'
      DisplayWidth = 20
      FieldName = 'ATTN'
      Size = 60
    end
    object QryBillToADDR1: TStringField
      DisplayLabel = 'Addr1'
      DisplayWidth = 20
      FieldName = 'ADDR1'
      Size = 60
    end
    object QryBillToADDR2: TStringField
      DisplayLabel = 'Addr2'
      DisplayWidth = 20
      FieldName = 'ADDR2'
      Size = 60
    end
    object QryBillToCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 15
      FieldName = 'CITY'
      Size = 30
    end
    object QryBillToSTATE: TStringField
      DisplayLabel = 'State'
      DisplayWidth = 2
      FieldName = 'STATE'
    end
    object QryBillToZIP: TStringField
      DisplayWidth = 10
      FieldName = 'ZIP'
      Size = 10
    end
    object QryBillToCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 15
      FieldName = 'COUNTRY'
      Size = 100
    end
    object QryBillToID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryBillToARCUSTO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object QryBillToADDR3: TStringField
      DisplayWidth = 20
      FieldName = 'ADDR3'
      Visible = False
      Size = 60
    end
    object QryBillToPHONE_NUMBER: TStringField
      DisplayWidth = 25
      FieldName = 'PHONE_NUMBER'
      Visible = False
      Size = 25
    end
    object QryBillToEXT: TStringField
      DisplayWidth = 5
      FieldName = 'EXT'
      Visible = False
      Size = 5
    end
    object QryBillToFAX: TStringField
      DisplayWidth = 25
      FieldName = 'FAX'
      Visible = False
      Size = 25
    end
    object QryBillToPRIME_CONTACT: TStringField
      DisplayWidth = 30
      FieldName = 'PRIME_CONTACT'
      Visible = False
      Size = 30
    end
    object QryBillToPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.BILL_TO.PK_HIDE'
      Visible = False
      Size = 1
    end
  end
  object SrcQryBillTo2: TDataSource
    DataSet = QryBillTo
    Left = 152
    Top = 92
  end
  object QryShipTo: TFDQuery
    Tag = 1
    BeforeOpen = QryShipToBeforeOpen
    Filtered = True
    Filter = 'PK_HIDE='#39'N'#39
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      '  SELECT s.attn,'
      '         s.addr1,'
      '         s.addr2,'
      '         s.eplant_id,'
      '         s.city,'
      '         s.state,'
      '         s.zip,'
      '         s.country,'
      '         s.id,'
      '         s.arcusto_id,'
      '         s.addr3,'
      '         s.ship_time,'
      '         s.tax_code_id,'
      '         s.phone_number,'
      '         s.ext,'
      '         s.fax,'
      '         s.prime_contact,'
      '         d.name AS division_name,'
      '         NVL(s.pk_hide, '#39'N'#39') AS pk_hide,'
      '         f.descrip AS ship_via'
      '    FROM ship_to s, division d, freight f'
      '   WHERE s.arcusto_id = :ARCUSTO_ID AND'
      '         s.division_id = d.id(+) AND'
      '         s.freight_id = f.id(+) AND'
      '         misc.eplant_filter(s.eplant_id) = 1'
      'ORDER BY s.attn')
    Left = 217
    Top = 124
    ParamData = <
      item
        Name = 'ARCUSTO_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryShipToATTN: TStringField
      DisplayLabel = 'Ship To'
      DisplayWidth = 20
      FieldName = 'ATTN'
      Size = 60
    end
    object QryShipToADDR1: TStringField
      DisplayLabel = 'Addr1'
      DisplayWidth = 20
      FieldName = 'ADDR1'
      Size = 60
    end
    object QryShipToADDR2: TStringField
      DisplayLabel = 'Addr2'
      DisplayWidth = 20
      FieldName = 'ADDR2'
      Size = 60
    end
    object QryShipToEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'SHIP_TO.EPLANT_ID'
      Size = 0
    end
    object QryShipToDIVISION_NAME: TStringField
      DisplayLabel = 'Division Name'
      DisplayWidth = 15
      FieldName = 'DIVISION_NAME'
      Size = 25
    end
    object QryShipToCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 15
      FieldName = 'CITY'
      Size = 30
    end
    object QryShipToSTATE: TStringField
      DisplayLabel = 'State'
      DisplayWidth = 2
      FieldName = 'STATE'
    end
    object QryShipToZIP: TStringField
      DisplayWidth = 10
      FieldName = 'ZIP'
      Size = 10
    end
    object QryShipToCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 10
      FieldName = 'COUNTRY'
      Size = 100
    end
    object QryShipToID: TBCDField
      DisplayLabel = 'Ship To ID'
      DisplayWidth = 10
      FieldName = 'ID'
      Size = 0
    end
    object QryShipToSHIP_VIA: TStringField
      DisplayLabel = 'Ship Via'
      DisplayWidth = 30
      FieldName = 'SHIP_VIA'
      Size = 60
    end
    object QryShipToPK_HIDE: TStringField
      DisplayWidth = 1
      FieldName = 'PK_HIDE'
      Visible = False
      Size = 1
    end
    object QryShipToARCUSTO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object QryShipToADDR3: TStringField
      DisplayWidth = 20
      FieldName = 'ADDR3'
      Visible = False
      Size = 60
    end
    object QryShipToSHIP_TIME: TBCDField
      DisplayWidth = 10
      FieldName = 'SHIP_TIME'
      Visible = False
      Size = 3
    end
    object QryShipToTAX_CODE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'TAX_CODE_ID'
      Visible = False
      Size = 0
    end
    object QryShipToPHONE_NUMBER: TStringField
      DisplayWidth = 25
      FieldName = 'PHONE_NUMBER'
      Visible = False
      Size = 25
    end
    object QryShipToEXT: TStringField
      DisplayWidth = 5
      FieldName = 'EXT'
      Visible = False
      Size = 5
    end
    object QryShipToFAX: TStringField
      DisplayWidth = 25
      FieldName = 'FAX'
      Visible = False
      Size = 25
    end
    object QryShipToPRIME_CONTACT: TStringField
      DisplayWidth = 30
      FieldName = 'PRIME_CONTACT'
      Visible = False
      Size = 30
    end
  end
  object SrcQryShipTo2: TDataSource
    DataSet = QryShipTo
    Left = 216
    Top = 92
  end
  object procArchiveOrder: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    StoredProcName = 'OE_ARCHIVE_ORDER'
    Left = 24
    Top = 368
    ParamData = <
      item
        Name = 'V_ORDER_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
  end
  object TblFreight: TFDTable
    Tag = 1
    IndexFieldNames = 'DESCRIP'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'FREIGHT'
    TableName = 'FREIGHT'
    Left = 152
    Top = 179
  end
  object SrcFreight: TDataSource
    DataSet = TblFreight
    Left = 152
    Top = 200
  end
  object QryTerms: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'Select Description, Days, Discount, Discount_days, id from terms'
      'where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      'order by description')
    Left = 715
    Top = 137
  end
  object TblSales: TFDTable
    Tag = 1
    IndexName = 'PK_SALESPEOPLE'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'SALESPEOPLE'
    TableName = 'SALESPEOPLE'
    Left = 24
    Top = 305
    object TblSalesFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 15
      FieldName = 'FIRST_NAME'
      Size = 30
    end
    object TblSalesLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 15
      FieldName = 'LAST_NAME'
      Size = 30
    end
    object TblSalesID: TBCDField
      FieldName = 'ID'
      Required = True
      Visible = False
      Size = 0
    end
    object TblSalesEMPLOYEE_ID: TBCDField
      FieldName = 'EMPLOYEE_ID'
      Visible = False
      Size = 0
    end
    object TblSalesSALES_CODE: TStringField
      FieldName = 'SALES_CODE'
      Visible = False
      Size = 25
    end
    object TblSalesVENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Visible = False
      Size = 0
    end
    object TblSalesMIDDLE_NAME: TStringField
      FieldName = 'MIDDLE_NAME'
      Size = 30
    end
  end
  object TblAKA: TFDTable
    Tag = 1
    Filtered = True
    IndexFieldNames = 'CUST_ITEMNO'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'AKA'
    TableName = 'AKA'
    Left = 141
    Top = 305
    object TblAKAID: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object TblAKAARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Required = True
      Size = 0
    end
    object TblAKACUST_ITEMNO: TStringField
      FieldName = 'CUST_ITEMNO'
      Required = True
      Size = 50
    end
    object TblAKACUST_DESCRIP: TStringField
      FieldName = 'CUST_DESCRIP'
      Size = 100
    end
    object TblAKAARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Size = 0
    end
  end
  object QryReleases: TFDQuery
    BeforeInsert = QryReleasesBeforeInsert
    AfterInsert = QryReleasesAfterInsert
    BeforeEdit = TblReleasesBeforeEdit
    BeforePost = QryReleasesBeforePost
    AfterPost = TblReleasesAfterPost
    BeforeDelete = QryReleasesBeforeDelete
    AfterDelete = TblReleasesAfterPost
    OnCalcFields = TblReleasesCalcFields
    OnNewRecord = TblReleasesNewRecord
    MasterSource = SrcOrd_Detail
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'RELEASES'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select r1.ID,'
      '       r1.ord_detail_id,'
      '       r1.request_date,'
      '       r1.promise_date,'
      '       r1.seq,'
      '       r1.quan,'
      '       r1.orig_quan,'
      '       r1.forecast,'
      '       r1.ship_date,'
      '       r1.cuser1,'
      '       r1.unit_price,'
      '       r1.user_date,'
      '       r1.user_date_2,'
      '       r1.user_date_3,'
      '       r1.ran,'
      '       r1.ship_to_id,'
      
        '       (select attn from ship_to where id = r1.ship_to_id) as sh' +
        'ip_to_attn,'
      '       r1.shipped_quan,'
      '       r1.date_type,'
      '       r1.cuser2,'
      '       r1.cuser3,'
      '       r1.batch_no,'
      '       r1.job_seq,'
      '       r1.must_ship_date,'
      '       r1.ack,'
      '       r1.internal_update_type,'
      '       r1.lock_must_ship_date,'
      '       r1.request_date as rel_date,'
      '       0 as ptorder_id,            /*for oe_2_wo*/'
      '       r1.freight_id,'
      
        '       (select descrip from freight where id = r1.freight_id) as' +
        ' shipvia,'
      '       r1.wo_note,'
      '       r1.phantom_releases_id,'
      '       r1.pending_verification,'
      '       r1.inventory_verified_date,'
      '       r1.exclude_sched,'
      '       r1.expedite,'
      
        '       (select '#39'Y'#39' from ps_ticket_dtl where release_id = r1.id a' +
        'nd rownum < 2) as is_on_pickticket'
      '  from releases r1'
      ' where r1.ord_detail_id = :ID'
      '    -- do not remove this line'
      ' order by r1.ord_detail_id,'
      '          r1.promise_date,'
      '          r1.id'
      '')
    Left = 312
    Top = 30
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryReleasesSEQ: TBCDField
      DisplayLabel = '#'
      DisplayWidth = 1
      FieldName = 'SEQ'
      Origin = 'RELEASES.SEQ'
      Required = True
      DisplayFormat = '#####'
      Size = 0
    end
    object QryReleasesQUAN: TBCDField
      DisplayLabel = 'Quantity'
      DisplayWidth = 6
      FieldName = 'QUAN'
      Origin = 'RELEASES.QUAN'
      Required = True
      OnChange = UpdateMirrorField
    end
    object QryReleasesCum_Quan: TFloatField
      DisplayLabel = 'Cumulative Quantity'
      DisplayWidth = 12
      FieldKind = fkCalculated
      FieldName = 'Cum_Quan'
      Calculated = True
    end
    object QryReleasesLeftToShip: TFloatField
      DisplayLabel = 'Left To Ship'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'LeftToShip'
      ReadOnly = True
      Calculated = True
    end
    object QryReleasesREQUEST_DATE: TDateTimeField
      DisplayLabel = 'Requested'
      DisplayWidth = 10
      FieldName = 'REQUEST_DATE'
      Origin = 'RELEASES.REQUEST_DATE'
      Required = True
      OnChange = TblReleasesREQUEST_DATEChange
      EditMask = '!99/99/0000;1;_'
    end
    object QryReleasesPROMISE_DATE: TDateTimeField
      DisplayLabel = 'Promised'
      DisplayWidth = 10
      FieldName = 'PROMISE_DATE'
      Origin = 'RELEASES.PROMISE_DATE'
      EditMask = '!99/99/0000;1;_'
    end
    object QryReleasesReleased: TFloatField
      DisplayLabel = 'Quantity Shipped'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Released'
      ReadOnly = True
      Calculated = True
    end
    object QryReleasesFORECAST: TStringField
      DisplayLabel = 'Forecast'
      DisplayWidth = 9
      FieldName = 'FORECAST'
      Origin = 'RELEASES.FORECAST'
      Size = 1
    end
    object QryReleasesSHIP_DATE: TDateTimeField
      DisplayLabel = 'Ship Date'
      DisplayWidth = 10
      FieldName = 'SHIP_DATE'
      Origin = 'RELEASES.SHIP_DATE'
      ReadOnly = True
      EditMask = '!99/99/0000;1;_'
    end
    object QryReleasesORIG_QUAN: TBCDField
      DisplayLabel = 'Original Quantity'
      DisplayWidth = 10
      FieldName = 'ORIG_QUAN'
    end
    object QryReleasesRAN: TStringField
      DisplayLabel = 'R.A.N. / Kanban'
      DisplayWidth = 15
      FieldName = 'RAN'
      Size = 30
    end
    object QryReleasesSHIP_TO_ATTN: TStringField
      DisplayLabel = 'Ship To'
      DisplayWidth = 20
      FieldName = 'SHIP_TO_ATTN'
      Size = 60
    end
    object QryReleasesDATE_TYPE: TStringField
      DisplayLabel = 'Date Type'
      DisplayWidth = 9
      FieldName = 'DATE_TYPE'
      FixedChar = True
      Size = 2
    end
    object QryReleasesBATCH_NO: TStringField
      DisplayLabel = 'Batch #'
      DisplayWidth = 30
      FieldName = 'BATCH_NO'
      Size = 30
    end
    object QryReleasesJOB_SEQ: TBCDField
      DisplayLabel = 'Job Sequence'
      DisplayWidth = 10
      FieldName = 'JOB_SEQ'
      Size = 0
    end
    object QryReleasesMUST_SHIP_DATE: TDateTimeField
      DisplayLabel = 'Must Ship Date'
      DisplayWidth = 18
      FieldName = 'MUST_SHIP_DATE'
    end
    object QryReleasesLOCK_MUST_SHIP_DATE: TStringField
      DisplayLabel = 'Lock Must Ship Date'
      DisplayWidth = 1
      FieldName = 'LOCK_MUST_SHIP_DATE'
      OnChange = QryReleasesLOCK_MUST_SHIP_DATEChange
      Size = 1
    end
    object QryReleasesACK: TStringField
      DisplayLabel = 'Acknowledged'
      DisplayWidth = 14
      FieldName = 'ACK'
      FixedChar = True
      Size = 1
    end
    object QryReleasesCUSER1: TStringField
      DisplayLabel = 'Comment'
      DisplayWidth = 10
      FieldName = 'CUSER1'
      Origin = 'RELEASES.CUSER1'
      Size = 255
    end
    object QryReleasesCUSER2: TStringField
      DisplayLabel = 'Comment 2'
      DisplayWidth = 60
      FieldName = 'CUSER2'
      Size = 255
    end
    object QryReleasesUSER_DATE: TDateTimeField
      DisplayLabel = 'User Date 1'
      DisplayWidth = 10
      FieldName = 'USER_DATE'
      Origin = 'RELEASES.USER_DATE'
      EditMask = '!99/99/0000;1;_'
    end
    object QryReleasesUSER_DATE_2: TDateTimeField
      DisplayLabel = 'User Date 2'
      DisplayWidth = 18
      FieldName = 'USER_DATE_2'
    end
    object QryReleasesUSER_DATE_3: TDateTimeField
      DisplayLabel = 'User Date 3'
      DisplayWidth = 18
      FieldName = 'USER_DATE_3'
    end
    object QryReleasesUNIT_PRICE: TFMTBCDField
      DisplayLabel = 'Unit Price'
      DisplayWidth = 10
      FieldName = 'UNIT_PRICE'
      Origin = 'RELEASES.UNIT_PRICE'
      Visible = False
      currency = True
      Size = 6
    end
    object QryReleasesID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'RELEASES.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryReleasesORD_DETAIL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ORD_DETAIL_ID'
      Origin = 'RELEASES.ORD_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object QryReleasesSHIP_TO_ID: TBCDField
      FieldName = 'SHIP_TO_ID'
      Visible = False
      Size = 0
    end
    object QryReleasesSHIPPED_QUAN: TBCDField
      FieldName = 'SHIPPED_QUAN'
      Visible = False
    end
    object QryReleasesINTERNAL_UPDATE_TYPE: TStringField
      FieldName = 'INTERNAL_UPDATE_TYPE'
      Visible = False
      Size = 10
    end
    object QryReleasesREL_DATE: TDateTimeField
      FieldName = 'REL_DATE'
      Visible = False
    end
    object QryReleasesPTORDER_ID: TFMTBCDField
      FieldName = 'PTORDER_ID'
      Visible = False
      Size = 38
    end
    object QryReleasesCUSER3: TStringField
      FieldName = 'CUSER3'
      Size = 60
    end
    object QryReleasesFREIGHT_ID: TBCDField
      FieldName = 'FREIGHT_ID'
      Size = 0
    end
    object QryReleasesSHIPVIA: TStringField
      DisplayLabel = 'Ship Via'
      FieldName = 'SHIPVIA'
      Size = 60
    end
    object QryReleasesWO_NOTE: TStringField
      DisplayLabel = 'WO Note'
      FieldName = 'WO_NOTE'
      Size = 255
    end
    object QryReleasesPHANTOM_RELEASES_ID: TBCDField
      FieldName = 'PHANTOM_RELEASES_ID'
      Size = 0
    end
    object QryReleasesPENDING_VERIFICATION: TStringField
      FieldName = 'PENDING_VERIFICATION'
      ReadOnly = True
      Visible = False
      Size = 1
    end
    object QryReleasesINVENTORY_VERIFIED_DATE: TDateTimeField
      DisplayLabel = 'Verified Date'
      FieldName = 'INVENTORY_VERIFIED_DATE'
      ReadOnly = True
    end
    object QryReleasesEXCLUDE_SCHED: TStringField
      DisplayLabel = 'Exclude From Schedule'
      FieldName = 'EXCLUDE_SCHED'
      Size = 1
    end
    object QryReleasesEXPEDITE: TStringField
      FieldName = 'EXPEDITE'
      Size = 1
    end
    object QryReleasesIS_ON_PICKTICKET: TStringField
      FieldName = 'IS_ON_PICKTICKET'
      FixedChar = True
      Size = 1
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'INSERT INTO RELEASES'
      '(ID, ORD_DETAIL_ID, REQUEST_DATE, SEQ, PROMISE_DATE, '
      '  QUAN, FORECAST, SHIP_DATE, CUSER1, UNIT_PRICE, '
      '  ORIG_QUAN, RAN, SHIP_TO_ID, SHIPPED_QUAN, '
      '  DATE_TYPE, CUSER2, BATCH_NO, JOB_SEQ, '
      '  MUST_SHIP_DATE, ACK, USER_DATE_2, USER_DATE_3, '
      '  INTERNAL_UPDATE_TYPE, LOCK_MUST_SHIP_DATE, CUSER3, '
      '  FREIGHT_ID, WO_NOTE, PHANTOM_RELEASES_ID, '
      '  PENDING_VERIFICATION, INVENTORY_VERIFIED_DATE, '
      '  EXCLUDE_SCHED, EXPEDITE)'
      
        'VALUES (:NEW_ID, :NEW_ORD_DETAIL_ID, :NEW_REQUEST_DATE, :NEW_SEQ' +
        ', :NEW_PROMISE_DATE, '
      
        '  :NEW_QUAN, :NEW_FORECAST, :NEW_SHIP_DATE, :NEW_CUSER1, :NEW_UN' +
        'IT_PRICE, '
      '  :NEW_ORIG_QUAN, :NEW_RAN, :NEW_SHIP_TO_ID, :NEW_SHIPPED_QUAN, '
      '  :NEW_DATE_TYPE, :NEW_CUSER2, :NEW_BATCH_NO, :NEW_JOB_SEQ, '
      
        '  :NEW_MUST_SHIP_DATE, :NEW_ACK, :NEW_USER_DATE_2, :NEW_USER_DAT' +
        'E_3, '
      
        '  :NEW_INTERNAL_UPDATE_TYPE, :NEW_LOCK_MUST_SHIP_DATE, :NEW_CUSE' +
        'R3, '
      '  :NEW_FREIGHT_ID, :NEW_WO_NOTE, :NEW_PHANTOM_RELEASES_ID, '
      '  :NEW_PENDING_VERIFICATION, :NEW_INVENTORY_VERIFIED_DATE, '
      '  :NEW_EXCLUDE_SCHED, :NEW_EXPEDITE)')
    ModifySQL.Strings = (
      'UPDATE RELEASES'
      
        'SET ID = :NEW_ID, ORD_DETAIL_ID = :NEW_ORD_DETAIL_ID, REQUEST_DA' +
        'TE = :NEW_REQUEST_DATE, '
      
        '  SEQ = :NEW_SEQ, PROMISE_DATE = :NEW_PROMISE_DATE, QUAN = :NEW_' +
        'QUAN, '
      
        '  FORECAST = :NEW_FORECAST, SHIP_DATE = :NEW_SHIP_DATE, CUSER1 =' +
        ' :NEW_CUSER1, '
      '  UNIT_PRICE = :NEW_UNIT_PRICE, ORIG_QUAN = :NEW_ORIG_QUAN, '
      
        '  RAN = :NEW_RAN, SHIP_TO_ID = :NEW_SHIP_TO_ID, SHIPPED_QUAN = :' +
        'NEW_SHIPPED_QUAN, '
      
        '  DATE_TYPE = :NEW_DATE_TYPE, CUSER2 = :NEW_CUSER2, BATCH_NO = :' +
        'NEW_BATCH_NO, '
      '  JOB_SEQ = :NEW_JOB_SEQ, MUST_SHIP_DATE = :NEW_MUST_SHIP_DATE, '
      
        '  ACK = :NEW_ACK, USER_DATE_2 = :NEW_USER_DATE_2, USER_DATE_3 = ' +
        ':NEW_USER_DATE_3, '
      
        '  INTERNAL_UPDATE_TYPE = :NEW_INTERNAL_UPDATE_TYPE, LOCK_MUST_SH' +
        'IP_DATE = :NEW_LOCK_MUST_SHIP_DATE, '
      
        '  CUSER3 = :NEW_CUSER3, FREIGHT_ID = :NEW_FREIGHT_ID, WO_NOTE = ' +
        ':NEW_WO_NOTE, '
      
        '  PHANTOM_RELEASES_ID = :NEW_PHANTOM_RELEASES_ID, PENDING_VERIFI' +
        'CATION = :NEW_PENDING_VERIFICATION, '
      '  INVENTORY_VERIFIED_DATE = :NEW_INVENTORY_VERIFIED_DATE, '
      '  EXCLUDE_SCHED = :NEW_EXCLUDE_SCHED, EXPEDITE = :NEW_EXPEDITE'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM RELEASES'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, ORD_DETAIL_ID, REQUEST_DATE, SEQ, PROMISE_DATE, QUAN,' +
        ' FORECAST, '
      '  SHIP_DATE, CUSER1, UNIT_PRICE, ECODE, EID, EDATE_TIME, ECOPY, '
      
        '  USER_DATE, SHIPPED_CRW, ORIG_QUAN, RAN, SHIP_TO_ID, SHIPPED_QU' +
        'AN, '
      '  DATE_TYPE, CUSER2, BATCH_NO, JOB_SEQ, MUST_SHIP_DATE, ACK, '
      
        '  USER_DATE_2, USER_DATE_3, INTERNAL_UPDATE_TYPE, LOCK_MUST_SHIP' +
        '_DATE, '
      
        '  CUSER3, FREIGHT_ID, WO_NOTE, PHANTOM_RELEASES_ID, PENDING_VERI' +
        'FICATION, '
      '  INVENTORY_VERIFIED_DATE, EXCLUDE_SCHED, EXPEDITE'
      'FROM RELEASES'
      'WHERE ID = :ID')
    Left = 311
    Top = 47
  end
  object QryInvoiced: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select NVL(invoiced_qty, 0) as invoiced_qty,'
      '       ord_detail_id'
      ' from c_arinvoice_ord_sum'
      ''
      ''
      ' ')
    Left = 296
    Top = 124
  end
  object SrcPtAllocate: TDataSource
    DataSet = QryPtAllocate
    Left = 384
    Top = 92
  end
  object QryPtAllocate: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id  as ptallocate_id'
      ' from ptallocate'
      ' where ord_detail_id = :ord_detail_id'
      '   and request_date = :request_date'
      '   and promise_date = :promise_date'
      '   and parent_id is NULL'
      '')
    Left = 384
    Top = 124
    ParamData = <
      item
        Name = 'ORD_DETAIL_ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'REQUEST_DATE'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'PROMISE_DATE'
        DataType = ftDateTime
        ParamType = ptInput
      end>
    object QryPtAllocatePTALLOCATE_ID: TBCDField
      FieldName = 'PTALLOCATE_ID'
      Origin = 'PTALLOCATE.ID'
      Size = 0
    end
  end
  object QryOrdTotal: TFDQuery
    MasterSource = SrcOrders
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT oe_misc.get_order_price_total(id) AS total_price,'
      '       oe_misc.get_order_tax_total(id) AS total_tax,'
      '       oe_misc.get_order_freight(id) AS freight_charge,'
      '       oe_misc.get_order_grand_total(id) AS grand_total,'
      '       id AS orders_id'
      '  FROM orders'
      ' WHERE id = :ID')
    Left = 218
    Top = 179
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryOrdTotalTOTAL_PRICE: TFMTBCDField
      FieldName = 'TOTAL_PRICE'
      Origin = 'TOTAL_PRICE'
      Precision = 38
      Size = 38
    end
    object QryOrdTotalTOTAL_TAX: TFMTBCDField
      FieldName = 'TOTAL_TAX'
      Origin = 'TOTAL_TAX'
      Precision = 38
      Size = 38
    end
    object QryOrdTotalFREIGHT_CHARGE: TFMTBCDField
      FieldName = 'FREIGHT_CHARGE'
      Origin = 'FREIGHT_CHARGE'
      Precision = 38
      Size = 38
    end
    object QryOrdTotalGRAND_TOTAL: TFMTBCDField
      FieldName = 'GRAND_TOTAL'
      Origin = 'GRAND_TOTAL'
      Precision = 38
      Size = 38
    end
    object QryOrdTotalORDERS_ID: TBCDField
      FieldName = 'ORDERS_ID'
      Origin = 'ORDERS_ID'
      Required = True
      Precision = 15
      Size = 0
    end
  end
  object SrcOrdTotal: TDataSource
    DataSet = QryOrdTotal
    OnDataChange = SrcOrdTotalDataChange
    Left = 222
    Top = 204
  end
  object QryContact: TFDQuery
    Tag = 1
    BeforeOpen = QryContactBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      
        '          LTrim(RTrim(First_name)) || '#39' '#39' || LTrim(RTrim(Last_Na' +
        'me)) as name,'
      '          first_name,'
      '          last_name,'
      '          eplant_id'
      '  from contact'
      ' where arcusto_id = :arcusto_id'
      '   and (:show_all = 1'
      '        or'
      '        :show_all = 0 and NVL(pk_hide, '#39'N'#39') = '#39'N'#39')'
      
        ' order by LTrim(RTrim(First_name)) || '#39' '#39' || LTrim(RTrim(Last_Na' +
        'me))')
    Left = 460
    Top = 140
    ParamData = <
      item
        Name = 'ARCUSTO_ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'SHOW_ALL'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QryContactNAME: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 25
      FieldName = 'NAME'
      Size = 61
    end
    object QryContactID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryContactFIRST_NAME: TStringField
      FieldName = 'FIRST_NAME'
      Visible = False
      Size = 30
    end
    object QryContactLAST_NAME: TStringField
      FieldName = 'LAST_NAME'
      Visible = False
      Size = 30
    end
    object QryContactEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
  end
  object tblCurrency: TFDTable
    Tag = 1
    BeforeOpen = tblCurrencyBeforeOpen
    Filtered = True
    IndexName = 'PK_CURRENCY'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'CURRENCY'
    TableName = 'CURRENCY'
    Left = 300
    Top = 200
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
  object QryBreakDownTaxes: TFDQuery
    Tag = 1
    MasterSource = SrcOrders
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select e.descrip,'
      '       e.tax_rate,'
      
        '       Sum( NVL(d.total_qty_ord,0) * NVL(d.unit_price, 0) * NVL(' +
        'e.tax_rate, 0)/100 ) as tax_amount'
      '  from tax_codes t,'
      '       tax_code_link l,'
      '       tax_elements e,'
      '       ORD_DETAIL d'
      ' where d.orders_id = :ID'
      '   and t.id = d.tax_code_id'
      '   and l.tax_codes_id = t.id'
      '   and l.tax_elements_id = e.id'
      'group by e.id,'
      '         e.descrip,'
      '         e.tax_rate,'
      '         l.seq'
      'order by l.seq')
    Left = 384
    Top = 199
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryBreakDownTaxesDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 60
    end
    object QryBreakDownTaxesTAX_RATE: TFMTBCDField
      FieldName = 'TAX_RATE'
      Size = 6
    end
    object QryBreakDownTaxesTAX_AMOUNT: TFMTBCDField
      FieldName = 'TAX_AMOUNT'
      currency = True
      Size = 38
    end
  end
  object SrcComm: TDataSource
    DataSet = TblComm
    Left = 344
    Top = 368
  end
  object TblComm: TFDTable
    Tag = 1
    BeforeInsert = TblCommBeforeEdit
    BeforeEdit = TblCommBeforeEdit
    BeforePost = TblCommBeforePost
    AfterPost = TblCommAfterPost
    BeforeDelete = TblCommBeforeDelete
    AfterDelete = TblCommAfterPost
    OnNewRecord = TblCommNewRecord
    IndexFieldNames = 'ORD_DETAIL_ID'
    MasterSource = SrcOrd_Detail
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'ORD_DETAIL_COMMISSIONS'
    TableName = 'ORD_DETAIL_COMMISSIONS'
    Left = 360
    Top = 368
    object TblCommID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object TblCommORD_DETAIL_ID: TBCDField
      FieldName = 'ORD_DETAIL_ID'
      Size = 0
    end
    object TblCommSALESPEOPLE_ID: TBCDField
      FieldName = 'SALESPEOPLE_ID'
      Size = 0
    end
    object TblCommCOMMISSION_PERCENT: TFMTBCDField
      FieldName = 'COMMISSION_PERCENT'
      Size = 6
    end
    object TblCommFirstName: TStringField
      FieldKind = fkLookup
      FieldName = 'FIRST_NAME'
      LookupDataSet = TblSales
      LookupKeyFields = 'ID'
      LookupResultField = 'FIRST_NAME'
      KeyFields = 'SALESPEOPLE_ID'
      Lookup = True
    end
    object TblCommLastName: TStringField
      FieldKind = fkLookup
      FieldName = 'LAST_NAME'
      LookupDataSet = TblSales
      LookupKeyFields = 'ID'
      LookupResultField = 'LAST_NAME'
      KeyFields = 'SALESPEOPLE_ID'
      Lookup = True
    end
    object TblCommSalesCode: TStringField
      FieldKind = fkLookup
      FieldName = 'SALES_CODE'
      LookupDataSet = TblSales
      LookupKeyFields = 'ID'
      LookupResultField = 'SALES_CODE'
      KeyFields = 'SALESPEOPLE_ID'
      Lookup = True
    end
    object TblCommAMOUNT: TBCDField
      FieldName = 'AMOUNT'
      Size = 2
    end
    object TblCommMIDDLE_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'MIDDLE_NAME'
      LookupDataSet = TblSales
      LookupKeyFields = 'ID'
      LookupResultField = 'MIDDLE_NAME'
      KeyFields = 'SALESPEOPLE_ID'
      Lookup = True
    end
    object TblCommCOMMISSIONS_ID: TBCDField
      FieldName = 'COMMISSIONS_ID'
      Visible = False
      Size = 0
    end
  end
  object QryEPlant: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       name,'
      '       name || '#39' ['#39' || ID || '#39']'#39' as descrip'
      '  from eplant'
      ' '
      ' '
      ' ')
    Left = 365
    Top = 303
  end
  object QryFreight: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, descrip, pk_hide, eplant_id '
      '  from freight'
      ' where misc.eplant_filter_include_nulls( eplant_id ) = 1'
      'order by descrip')
    Left = 780
    Top = 136
    object QryFreightDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Origin = 'IQ.FREIGHT.DESCRIP'
      Size = 60
    end
    object QryFreightEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object QryFreightPK_HIDE: TStringField
      DisplayWidth = 1
      FieldName = 'PK_HIDE'
      Origin = 'IQ.FREIGHT.PK_HIDE'
      Visible = False
      Size = 1
    end
    object QryFreightID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.FREIGHT.ID'
      Visible = False
      Size = 0
    end
  end
  object QryFob: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select descrip from fob'
      'where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      'order by descrip')
    Left = 660
    Top = 136
    object QryFobDESCRIP: TStringField
      DisplayLabel = 'FOB'
      DisplayWidth = 15
      FieldName = 'DESCRIP'
      Origin = 'FOB.DESCRIP'
      Size = 60
    end
  end
  object QryRefCode: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select category_id,'
      '       category_descrip,'
      '       ref_code_id,'
      '       ref_code_descrip,'
      '       ref_code'
      '  from v_ref_code'
      '  where misc.Eplant_Filter_Include_nulls(eplant_id) = 1'
      '    and NVL(pk_hide, '#39'N'#39') = '#39'N'#39
      ' order by ref_code_descrip')
    Left = 104
    Top = 488
    object QryRefCodeCATEGORY_ID: TBCDField
      FieldName = 'CATEGORY_ID'
      Origin = 'IQ.V_REF_CODE.CATEGORY_ID'
      Size = 0
    end
    object QryRefCodeCATEGORY_DESCRIP: TStringField
      FieldName = 'CATEGORY_DESCRIP'
      Origin = 'IQ.V_REF_CODE.CATEGORY_DESCRIP'
      Size = 30
    end
    object QryRefCodeREF_CODE_ID: TBCDField
      FieldName = 'REF_CODE_ID'
      Origin = 'IQ.V_REF_CODE.REF_CODE_ID'
      Size = 0
    end
    object QryRefCodeREF_CODE_DESCRIP: TStringField
      FieldName = 'REF_CODE_DESCRIP'
      Origin = 'IQ.V_REF_CODE.REF_CODE_DESCRIP'
      Size = 60
    end
    object QryRefCodeREF_CODE: TStringField
      FieldName = 'REF_CODE'
      Origin = 'IQ.V_REF_CODE.REF_CODE'
      Size = 10
    end
  end
  object QryCurrency: TFDQuery
    Tag = 1
    BeforeOpen = QryCurrencyBeforeOpen
    Filtered = True
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
      ' order by curr_code')
    Left = 312
    Top = 216
    object QryCurrencyCURR_CODE: TStringField
      DisplayLabel = 'Currency Code'
      DisplayWidth = 10
      FieldName = 'CURR_CODE'
      Origin = 'IQ.CURRENCY.CURR_CODE'
      Size = 10
    end
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
      Visible = False
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
  object QryDivision: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, name, descrip'
      '  from division'
      ' where misc.eplant_filter( eplant_id ) = 1'
      '  order by name')
    Left = 597
    Top = 137
    object QryDivisionNAME: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 25
      FieldName = 'NAME'
      Size = 25
    end
    object QryDivisionDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 50
      FieldName = 'DESCRIP'
      Size = 50
    end
    object QryDivisionID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object ProcOverdue: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    StoredProcName = 'IQMS.GL.GET_OVERDUE_SUM_PROC'
    Left = 433
    Top = 309
    ParamData = <
      item
        Name = 'V_ARCUSTO_ID'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'V_CURRENT'
        DataType = ftFMTBcd
        ParamType = ptOutput
      end
      item
        Name = 'V_1_30'
        DataType = ftFMTBcd
        ParamType = ptOutput
      end
      item
        Name = 'V_30_60'
        DataType = ftFMTBcd
        ParamType = ptOutput
      end
      item
        Name = 'V_60_90'
        DataType = ftFMTBcd
        ParamType = ptOutput
      end
      item
        Name = 'V_90'
        DataType = ftFMTBcd
        ParamType = ptOutput
      end
      item
        Name = 'V_TOTAL_OVERDUE'
        DataType = ftFMTBcd
        ParamType = ptOutput
      end
      item
        Name = 'V_TOTAL_TO_PAY'
        DataType = ftFMTBcd
        ParamType = ptOutput
      end>
  end
  object ProcOverdueInv: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    StoredProcName = 'IQMS.GL.GET_OVERDUE_SUM_PROC_INV'
    Left = 529
    Top = 310
  end
  object QryCampaign: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT id, code, description, archived, pk_hide'
      'FROM campaign')
    Left = 88
    Top = 304
    object QryCampaignCODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 10
      FieldName = 'CODE'
      Origin = 'IQ.CAMPAIGN.CODE'
      Size = 10
    end
    object QryCampaignDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIPTION'
      Origin = 'IQ.CAMPAIGN.DESCRIPTION'
      Size = 255
    end
    object QryCampaignID: TBCDField
      DisplayLabel = 'Campaign #'
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.CAMPAIGN.ID'
      Size = 0
    end
    object QryCampaignARCHIVED: TStringField
      DisplayLabel = 'Archived'
      FieldName = 'ARCHIVED'
      Origin = 'IQ.CAMPAIGN.ARCHIVED'
      Visible = False
      Size = 1
    end
    object QryCampaignPK_HIDE: TStringField
      DisplayLabel = 'Inactive'
      FieldName = 'PK_HIDE'
      Origin = 'IQ.CAMPAIGN.PK_HIDE'
      Visible = False
      Size = 1
    end
  end
  object SrcQuickOE: TDataSource
    DataSet = QryQuickOE
    OnDataChange = SrcQuickOEDataChange
    Left = 401
    Top = 7
  end
  object QryQuickOE: TFDQuery
    Tag = 1
    BeforeInsert = QryQuickOEBeforeInsert
    BeforeEdit = QryQuickOEBeforeEdit
    BeforePost = QryQuickOEBeforePost
    AfterPost = QryQuickOEAfterPost
    BeforeDelete = QryQuickOEBeforeDelete
    AfterDelete = QryQuickOEAfterDelete
    OnCalcFields = QryQuickOECalcFields
    OnNewRecord = QryQuickOENewRecord
    CachedUpdates = True
    MasterSource = SrcOrders
    MasterFields = 'ID'
    OnUpdateRecord = QryQuickOEUpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select d.id,'
      '       d.orders_id,'
      '       d.arinvt_id,'
      '       d.glacct_id,'
      '       d.ord_det_seqno,'
      '       d.unit,'
      '       d.unit_price,'
      '       d.eplant_id,'
      '       r.id as releases_id,'
      '       r.quan,'
      '       r.promise_date,'
      '       single_release.releases_count,'
      '       d.total_qty_ord,'
      '       d.uom_factor,'
      '       d.misc_itemno,'
      '       d.misc_item,'
      '       d.discount,'
      '       d.list_unit_price,'
      '       d.price_per_1000,'
      '       r.orig_quan,'
      '       r.internal_update_type,'
      '       d.cumm_shipped,'
      '       d.tax_code_id,'
      '       d.is_make_to_order,'
      '       d.rma_detail_id,'
      '       d.comment1,'
      '       d.COST_OBJECT_SOURCE,'
      '       d.SALESPEOPLE_ID,'
      '       d.COST_OBJECT_ID,'
      '       d.REBATE_PARAMS_ID,'
      '       d.phantom_ord_detail_id,'
      '       d.phantom_ptsper,'
      '       d.standard_id,'
      '       d.division_id,'
      '       d.aka_kind,'
      '       d.po_info,'
      '       d.cuser1,'
      '       d.is_drop_ship,'
      '       d.auto_invoice,'
      '       d.c_po_misc_id'
      '  from '
      '       ord_detail d,'
      ''
      '       ( select r.ord_detail_id,'
      '                min(r.id) as id,'
      '                count(r.id) as releases_count'
      '           from releases r, ord_detail d'
      '          where d.orders_id = :id'
      '            and d.id = r.ord_detail_id'
      '          group by r.ord_detail_id ) single_release,'
      '       '
      '       releases r'
      ' where'
      '       d.orders_id = :id'
      '   and d.id = single_release.ord_detail_id(+)'
      '   and single_release.id = r.id(+)'
      '   and misc.eplant_filter( d.eplant_id ) = 1'
      ''
      'order by d.ord_det_seqno'
      ''
      ''
      '')
    Left = 401
    Top = 26
    ParamData = <
      item
        Name = 'id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryQuickOEORD_DET_SEQNO: TBCDField
      DisplayLabel = 'Line #'
      DisplayWidth = 8
      FieldName = 'ORD_DET_SEQNO'
      Size = 0
    end
    object QryQuickOEItemNumber: TStringField
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'ItemNumber'
      Size = 30
      Calculated = True
    end
    object QryQuickOETOTAL_QTY_ORD: TBCDField
      DisplayWidth = 10
      FieldName = 'TOTAL_QTY_ORD'
      OnChange = QryQuickOETOTAL_QTY_ORDChange
    end
    object QryQuickOEPROMISE_DATE: TDateTimeField
      DisplayLabel = 'Date'
      DisplayWidth = 22
      FieldName = 'PROMISE_DATE'
    end
    object QryQuickOEUNIT_PRICE: TFMTBCDField
      DisplayLabel = 'Price'
      DisplayWidth = 10
      FieldName = 'UNIT_PRICE'
      OnChange = QryQuickOEUNIT_PRICEChange
      Size = 6
    end
    object QryQuickOEUNIT: TStringField
      DisplayLabel = 'UOM'
      DisplayWidth = 10
      FieldName = 'UNIT'
      Size = 10
    end
    object QryQuickOEDisp_Descript: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Disp_Descript'
      Size = 100
      Calculated = True
    end
    object QryQuickOEDescrip2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 35
      FieldKind = fkCalculated
      FieldName = 'Descrip2'
      ReadOnly = True
      Size = 100
      Calculated = True
    end
    object QryQuickOERev: TStringField
      DisplayWidth = 6
      FieldKind = fkCalculated
      FieldName = 'Rev'
      ReadOnly = True
      FixedChar = True
      Size = 15
      Calculated = True
    end
    object QryQuickOEClass: TStringField
      DisplayWidth = 4
      FieldKind = fkCalculated
      FieldName = 'Class'
      ReadOnly = True
      FixedChar = True
      Size = 2
      Calculated = True
    end
    object QryQuickOEAkaDescrip: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'AkaDescrip'
      Size = 100
      Calculated = True
    end
    object QryQuickOEAkaItemNo: TStringField
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'AkaItemNo'
      Size = 25
      Calculated = True
    end
    object QryQuickOEIS_MAKE_TO_ORDER: TStringField
      DisplayLabel = 'Make To Order'
      DisplayWidth = 1
      FieldName = 'IS_MAKE_TO_ORDER'
      Size = 1
    end
    object QryQuickOEIS_DROP_SHIP: TStringField
      DisplayLabel = 'Drop Ship'
      DisplayWidth = 1
      FieldName = 'IS_DROP_SHIP'
      Size = 1
    end
    object QryQuickOESalesPerson: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'SalesPerson'
      Calculated = True
    end
    object QryQuickOENote: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Note'
      Size = 250
      Calculated = True
    end
    object QryQuickOEPO_INFO: TStringField
      DisplayWidth = 60
      FieldName = 'PO_INFO'
      Size = 60
    end
    object QryQuickOECOMMENT1: TStringField
      DisplayWidth = 10
      FieldName = 'COMMENT1'
      Visible = False
      Size = 2000
    end
    object QryQuickOEQUAN: TBCDField
      DisplayLabel = 'Qty'
      DisplayWidth = 18
      FieldName = 'QUAN'
      Visible = False
    end
    object QryQuickOeDescrip: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 35
      FieldKind = fkCalculated
      FieldName = 'Descrip'
      ReadOnly = True
      Visible = False
      Size = 100
      Calculated = True
    end
    object QryQuickOEEPLANT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
    object QryQuickOERELEASES_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'RELEASES_ID'
      Visible = False
      Size = 0
    end
    object QryQuickOERELEASES_COUNT: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'RELEASES_COUNT'
      Visible = False
      Size = 38
    end
    object QryQuickOEID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryQuickOEORDERS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ORDERS_ID'
      Visible = False
      Size = 0
    end
    object QryQuickOEARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Visible = False
      OnChange = QryQuickOEARINVT_IDChange
      OnSetText = QryQuickOEARINVT_IDSetText
      Size = 0
    end
    object QryQuickOEUOM_FACTOR: TFMTBCDField
      FieldName = 'UOM_FACTOR'
      Visible = False
    end
    object QryQuickOEMISC_ITEM: TStringField
      FieldName = 'MISC_ITEM'
      Visible = False
      Size = 250
    end
    object QryQuickOEArinvt_Unit: TStringField
      FieldKind = fkCalculated
      FieldName = 'Arinvt_Unit'
      Visible = False
      Calculated = True
    end
    object QryQuickOEDISCOUNT: TBCDField
      FieldName = 'DISCOUNT'
      Visible = False
      Size = 2
    end
    object QryQuickOELIST_UNIT_PRICE: TFMTBCDField
      FieldName = 'LIST_UNIT_PRICE'
      Visible = False
      Size = 6
    end
    object QryQuickOEPRICE_PER_1000: TFMTBCDField
      FieldName = 'PRICE_PER_1000'
      Visible = False
      Size = 6
    end
    object QryQuickOEORIG_QUAN: TBCDField
      FieldName = 'ORIG_QUAN'
      Visible = False
    end
    object QryQuickOEINTERNAL_UPDATE_TYPE: TStringField
      FieldName = 'INTERNAL_UPDATE_TYPE'
      Visible = False
      Size = 10
    end
    object QryQuickOEItemNo_Disp: TStringField
      FieldKind = fkCalculated
      FieldName = 'ItemNo_Disp'
      Visible = False
      Size = 25
      Calculated = True
    end
    object QryQuickOECUMM_SHIPPED: TBCDField
      FieldName = 'CUMM_SHIPPED'
      Visible = False
    end
    object QryQuickOEGLACCT_ID: TBCDField
      FieldName = 'GLACCT_ID'
      Visible = False
      Size = 0
    end
    object QryQuickOEAcct: TStringField
      FieldKind = fkCalculated
      FieldName = 'Acct'
      Visible = False
      Calculated = True
    end
    object QryQuickOEMISC_ITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 18
      FieldName = 'MISC_ITEMNO'
      Size = 50
    end
    object QryQuickOETAX_CODE_ID: TBCDField
      FieldName = 'TAX_CODE_ID'
      Visible = False
      Size = 0
    end
    object QryQuickOETax_Code: TStringField
      DisplayLabel = 'Tax Code'
      FieldKind = fkCalculated
      FieldName = 'Tax_Code'
      Calculated = True
    end
    object QryQuickOERMA_DETAIL_ID: TBCDField
      FieldName = 'RMA_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object QryQuickOECOST_OBJECT_SOURCE: TStringField
      FieldName = 'COST_OBJECT_SOURCE'
      Visible = False
      Size = 50
    end
    object QryQuickOECOST_OBJECT_ID: TBCDField
      FieldName = 'COST_OBJECT_ID'
      Visible = False
      Size = 0
    end
    object QryQuickOEBackLog: TFloatField
      FieldKind = fkCalculated
      FieldName = 'BackLog'
      Visible = False
      Calculated = True
    end
    object QryQuickOESALESPEOPLE_ID: TBCDField
      FieldName = 'SALESPEOPLE_ID'
      Visible = False
      Size = 0
    end
    object QryQuickOEREBATE_PARAMS_ID: TBCDField
      FieldName = 'REBATE_PARAMS_ID'
      Visible = False
      Size = 0
    end
    object QryQuickOEPhantom: TStringField
      FieldKind = fkCalculated
      FieldName = 'Phantom'
      Visible = False
      Size = 1
      Calculated = True
    end
    object QryQuickOEPHANTOM_ORD_DETAIL_ID: TBCDField
      FieldName = 'PHANTOM_ORD_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object QryQuickOEPHANTOM_PTSPER: TFMTBCDField
      FieldName = 'PHANTOM_PTSPER'
      Visible = False
      Size = 6
    end
    object QryQuickOEIncludePhantomComponents: TStringField
      FieldKind = fkCalculated
      FieldName = 'IncludePhantomComponents'
      Visible = False
      Size = 1
      Calculated = True
    end
    object QryQuickOESTANDARD_ID: TBCDField
      FieldName = 'STANDARD_ID'
      Visible = False
      Size = 0
    end
    object QryQuickOEDIVISION_ID: TBCDField
      FieldName = 'DIVISION_ID'
      Visible = False
      Size = 0
    end
    object QryQuickOEAKA_KIND: TStringField
      FieldName = 'AKA_KIND'
      Visible = False
      Size = 10
    end
    object QryQuickOECUSER1: TStringField
      FieldName = 'CUSER1'
      Visible = False
      Size = 255
    end
    object QryQuickOEAUTO_INVOICE: TStringField
      FieldName = 'AUTO_INVOICE'
      Size = 1
    end
    object QryQuickOEDivision: TStringField
      FieldKind = fkCalculated
      FieldName = 'Division'
      Size = 25
      Calculated = True
    end
    object QryQuickOEC_PO_MISC_ID: TBCDField
      FieldName = 'C_PO_MISC_ID'
      Size = 0
    end
  end
  object QryLookupArinvt: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, itemno, descrip, rev, eplant_id, class'
      '  from arinvt'
      ' where misc.eplant_filter( eplant_id ) = 1'
      '   and nvl(non_salable, '#39'N'#39') <> '#39'Y'#39
      '   and nvl(pk_hide, '#39'N'#39') <> '#39'Y'#39
      ' order by itemno')
    Left = 479
    Top = 27
    object QryLookupArinvtITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryLookupArinvtDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 50
      FieldName = 'DESCRIP'
      Size = 100
    end
    object QryLookupArinvtREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 10
      FieldName = 'REV'
      FixedChar = True
      Size = 15
    end
    object QryLookupArinvtEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object QryLookupArinvtCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 2
      FieldName = 'CLASS'
      Size = 2
    end
    object QryLookupArinvtID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object SrcCommQuick: TDataSource
    DataSet = TblCommQuick
    Left = 400
    Top = 368
  end
  object TblCommQuick: TFDTable
    Tag = 1
    BeforeInsert = TblCommBeforeEdit
    BeforeEdit = TblCommBeforeEdit
    BeforePost = TblCommQuickBeforePost
    AfterPost = TblCommAfterPost
    AfterDelete = TblCommAfterPost
    IndexFieldNames = 'ORD_DETAIL_ID'
    MasterSource = SrcQuickOE
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'ORD_DETAIL_COMMISSIONS'
    TableName = 'ORD_DETAIL_COMMISSIONS'
    Left = 416
    Top = 368
    object FloatField4: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object FloatField5: TBCDField
      FieldName = 'ORD_DETAIL_ID'
      Size = 0
    end
    object FloatField6: TBCDField
      FieldName = 'SALESPEOPLE_ID'
      Size = 0
    end
    object FloatField8: TFMTBCDField
      FieldName = 'COMMISSION_PERCENT'
      Size = 6
    end
    object StringField3: TStringField
      FieldKind = fkLookup
      FieldName = 'FIRST_NAME'
      LookupDataSet = TblSales
      LookupKeyFields = 'ID'
      LookupResultField = 'FIRST_NAME'
      KeyFields = 'SALESPEOPLE_ID'
      Lookup = True
    end
    object StringField4: TStringField
      FieldKind = fkLookup
      FieldName = 'LAST_NAME'
      LookupDataSet = TblSales
      LookupKeyFields = 'ID'
      LookupResultField = 'LAST_NAME'
      KeyFields = 'SALESPEOPLE_ID'
      Lookup = True
    end
    object StringField5: TStringField
      FieldKind = fkLookup
      FieldName = 'SALES_CODE'
      LookupDataSet = TblSales
      LookupKeyFields = 'ID'
      LookupResultField = 'SALES_CODE'
      KeyFields = 'SALESPEOPLE_ID'
      Lookup = True
    end
    object TblCommQuickAMOUNT: TBCDField
      FieldName = 'AMOUNT'
      Size = 2
    end
    object TblCommQuickCOMMISSIONS_ID: TBCDField
      FieldName = 'COMMISSIONS_ID'
      Visible = False
      Size = 0
    end
  end
  object QrySOContact: TFDQuery
    BeforeOpen = QryContactBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      
        '          LTrim(RTrim(First_name)) || '#39' '#39' || LTrim(RTrim(Last_Na' +
        'me)) as name,'
      '          first_name,'
      '          last_name, '
      '         source,'
      '         eplant_id'
      '  from contact'
      ' where arcusto_id = :ARCUSTO_ID'
      '   and (:SHOW_ALL = 1'
      '        or'
      '        :SHOW_ALL = 0 and NVL(pk_hide, '#39'N'#39') = '#39'N'#39')'
      ' order by 2')
    Left = 532
    Top = 136
    ParamData = <
      item
        Name = 'ARCUSTO_ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'SHOW_ALL'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object StringField42: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 25
      FieldName = 'NAME'
      Size = 61
    end
    object QrySOContactSOURCE: TStringField
      DisplayLabel = 'Source'
      DisplayWidth = 20
      FieldName = 'SOURCE'
      Size = 50
    end
    object FloatField10: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object StringField43: TStringField
      FieldName = 'FIRST_NAME'
      Visible = False
      Size = 30
    end
    object StringField44: TStringField
      FieldName = 'LAST_NAME'
      Visible = False
      Size = 30
    end
    object QrySOContactEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
  end
  object QryOrdTotalQuick: TFDQuery
    Tag = 1
    OnCalcFields = QryOrdTotalQuickCalcFields
    MasterSource = SrcOrders
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select d.orders_id as orders_id,      '
      
        '       Sum(Round(NVL(d.total_qty_ord,0) * NVL(d.unit_price, 0), ' +
        '2)) as total_price,'
      
        '       Sum(Round(NVL(t.tax_amount, 0) + decode(d.id, v.min_id, N' +
        'VL(t2.tax_amount, 0), 0), 2))  as total_tax,'
      
        '       Sum( Round(NVL(d.total_qty_ord,0) * NVL(d.unit_price, 0),' +
        ' 2)) + '
      
        '       Sum(Round(NVL(t.tax_amount, 0) + decode(d.id, v.min_id, N' +
        'VL(t2.tax_amount, 0), 0), 2)) as Grand_Total'
      '  from ORD_DETAIL d,'
      
        '   (select min(id) as min_id from ord_detail where orders_id = :' +
        'ID) v,'
      '       (select sum(tax_amount) as tax_amount, '
      '               ord_detail_id '
      '          from ord_detail_tax '
      '         group by ord_detail_id) t,'
      '       (select sum(tax_amount) as tax_amount, '
      '               orders_id '
      '          from orders_tax '
      '         group by orders_id) t2,'
      '       orders o'
      ' where d.orders_id = :ID'
      '   and t.ord_detail_id(+) = d.id'
      '   and t2.orders_id(+) = o.id'
      '   and d.orders_id = o.id'
      ' group by d.orders_id'
      ' ')
    Left = 506
    Top = 179
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryOrdTotalQuickORDERS_ID: TBCDField
      FieldName = 'ORDERS_ID'
      Size = 0
    end
    object QryOrdTotalQuickTOTAL_PRICE: TFMTBCDField
      FieldName = 'TOTAL_PRICE'
      currency = True
      Size = 38
    end
    object QryOrdTotalQuickTOTAL_TAX: TFMTBCDField
      FieldName = 'TOTAL_TAX'
      currency = True
      Size = 38
    end
    object QryOrdTotalQuickGRAND_TOTAL: TFMTBCDField
      FieldName = 'GRAND_TOTAL'
      currency = True
      Size = 38
    end
    object QryOrdTotalQuickGrand: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Grand'
      currency = True
      Calculated = True
    end
  end
  object SrcOrdTotalQuick: TDataSource
    DataSet = QryOrdTotalQuick
    OnDataChange = SrcOrdTotalDataChange
    Left = 506
    Top = 200
  end
  object FDUpdateSQL_Orders: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'INSERT INTO ORDERS'
      '(ID, ORDERNO, PONO, ARCUSTO_ID, ORD_DATE, '
      '  ORD_BY, USERID, DATE_TAKEN, BILL_TO_ID, '
      '  SHIP_TO_ID, CUSER1, CUSER2, CUSER3, '
      '  CUSER5, CUSER6, TIMESTAMP, FOB, CHANGEUSER_ID, '
      '  TERMS_ID, FREIGHT_ID, FREE_FORM, DISCOUNT, '
      '  CONTACT_ID, CURRENCY_ID, REV, OE_CONTROL, '
      '  EPLANT_ID, EDI_855_CREATED, WEB_ORDERS_ID, '
      '  EDI_CHANGE_DATE, ARCUSTO_CREDIT_CARD_ID, DIVISION_ID, '
      '  CUSER4, CRM_QUOTE_ID, COMMENT1, PAYMENT_TYPE, '
      '  EXT_COMMENT1, ORD_LINE_DATE, FREIGHT_CHARGE, '
      '  FREIGHT_QUOTENO, CONTACT_ID2, CAMPAIGN_ID, '
      '  CRM_OPPORTUNITY_ID, FOB_THIRD_PARTY_ID, DROP_SHIP_PO_ID, '
      '  EDI_865_CREATED, APPROVED, APPROVAL_REQUIRED, '
      '  FREIGHT_ACCOUNT_NUMBER, IS_MANUAL_OUTSOURCE, SHIP_COMPLETE)'
      
        'VALUES (:NEW_ID, :NEW_ORDERNO, :NEW_PONO, :NEW_ARCUSTO_ID, :NEW_' +
        'ORD_DATE, '
      '  :NEW_ORD_BY, :NEW_USERID, :NEW_DATE_TAKEN, :NEW_BILL_TO_ID, '
      '  :NEW_SHIP_TO_ID, :NEW_CUSER1, :NEW_CUSER2, :NEW_CUSER3, '
      
        '  :NEW_CUSER5, :NEW_CUSER6, :NEW_TIMESTAMP, :NEW_FOB, :NEW_CHANG' +
        'EUSER_ID, '
      
        '  :NEW_TERMS_ID, :NEW_FREIGHT_ID, :NEW_FREE_FORM, :NEW_DISCOUNT,' +
        ' '
      '  :NEW_CONTACT_ID, :NEW_CURRENCY_ID, :NEW_REV, :NEW_OE_CONTROL, '
      '  :NEW_EPLANT_ID, :NEW_EDI_855_CREATED, :NEW_WEB_ORDERS_ID, '
      
        '  :NEW_EDI_CHANGE_DATE, :NEW_ARCUSTO_CREDIT_CARD_ID, :NEW_DIVISI' +
        'ON_ID, '
      
        '  :NEW_CUSER4, :NEW_CRM_QUOTE_ID, :NEW_COMMENT1, :NEW_PAYMENT_TY' +
        'PE, '
      '  :NEW_EXT_COMMENT1, :NEW_ORD_LINE_DATE, :NEW_FREIGHT_CHARGE, '
      '  :NEW_FREIGHT_QUOTENO, :NEW_CONTACT_ID2, :NEW_CAMPAIGN_ID, '
      
        '  :NEW_CRM_OPPORTUNITY_ID, :NEW_FOB_THIRD_PARTY_ID, :NEW_DROP_SH' +
        'IP_PO_ID, '
      '  :NEW_EDI_865_CREATED, :NEW_APPROVED, :NEW_APPROVAL_REQUIRED, '
      
        '  :NEW_FREIGHT_ACCOUNT_NUMBER, :NEW_IS_MANUAL_OUTSOURCE, :NEW_SH' +
        'IP_COMPLETE)')
    ModifySQL.Strings = (
      'UPDATE ORDERS'
      
        'SET ID = :NEW_ID, ORDERNO = :NEW_ORDERNO, PONO = :NEW_PONO, ARCU' +
        'STO_ID = :NEW_ARCUSTO_ID, '
      
        '  ORD_DATE = :NEW_ORD_DATE, ORD_BY = :NEW_ORD_BY, USERID = :NEW_' +
        'USERID, '
      '  DATE_TAKEN = :NEW_DATE_TAKEN, BILL_TO_ID = :NEW_BILL_TO_ID, '
      
        '  SHIP_TO_ID = :NEW_SHIP_TO_ID, CUSER1 = :NEW_CUSER1, CUSER2 = :' +
        'NEW_CUSER2, '
      
        '  CUSER3 = :NEW_CUSER3, CUSER5 = :NEW_CUSER5, CUSER6 = :NEW_CUSE' +
        'R6, '
      
        '  TIMESTAMP = :NEW_TIMESTAMP, FOB = :NEW_FOB, CHANGEUSER_ID = :N' +
        'EW_CHANGEUSER_ID, '
      '  TERMS_ID = :NEW_TERMS_ID, FREIGHT_ID = :NEW_FREIGHT_ID, '
      
        '  FREE_FORM = :NEW_FREE_FORM, DISCOUNT = :NEW_DISCOUNT, CONTACT_' +
        'ID = :NEW_CONTACT_ID, '
      
        '  CURRENCY_ID = :NEW_CURRENCY_ID, REV = :NEW_REV, OE_CONTROL = :' +
        'NEW_OE_CONTROL, '
      
        '  EPLANT_ID = :NEW_EPLANT_ID, EDI_855_CREATED = :NEW_EDI_855_CRE' +
        'ATED, '
      
        '  WEB_ORDERS_ID = :NEW_WEB_ORDERS_ID, EDI_CHANGE_DATE = :NEW_EDI' +
        '_CHANGE_DATE, '
      
        '  ARCUSTO_CREDIT_CARD_ID = :NEW_ARCUSTO_CREDIT_CARD_ID, DIVISION' +
        '_ID = :NEW_DIVISION_ID, '
      '  CUSER4 = :NEW_CUSER4, CRM_QUOTE_ID = :NEW_CRM_QUOTE_ID, '
      '  COMMENT1 = :NEW_COMMENT1, PAYMENT_TYPE = :NEW_PAYMENT_TYPE, '
      
        '  EXT_COMMENT1 = :NEW_EXT_COMMENT1, ORD_LINE_DATE = :NEW_ORD_LIN' +
        'E_DATE, '
      
        '  FREIGHT_CHARGE = :NEW_FREIGHT_CHARGE, FREIGHT_QUOTENO = :NEW_F' +
        'REIGHT_QUOTENO, '
      
        '  CONTACT_ID2 = :NEW_CONTACT_ID2, CAMPAIGN_ID = :NEW_CAMPAIGN_ID' +
        ', '
      
        '  CRM_OPPORTUNITY_ID = :NEW_CRM_OPPORTUNITY_ID, FOB_THIRD_PARTY_' +
        'ID = :NEW_FOB_THIRD_PARTY_ID, '
      
        '  DROP_SHIP_PO_ID = :NEW_DROP_SHIP_PO_ID, EDI_865_CREATED = :NEW' +
        '_EDI_865_CREATED, '
      
        '  APPROVED = :NEW_APPROVED, APPROVAL_REQUIRED = :NEW_APPROVAL_RE' +
        'QUIRED, '
      
        '  FREIGHT_ACCOUNT_NUMBER = :NEW_FREIGHT_ACCOUNT_NUMBER, IS_MANUA' +
        'L_OUTSOURCE = :NEW_IS_MANUAL_OUTSOURCE, '
      '  SHIP_COMPLETE = :NEW_SHIP_COMPLETE'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM ORDERS'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, ORDERNO, PONO, ARCUSTO_ID, ORD_DATE, ORD_BY, USERID, ' +
        'DATE_TAKEN, '
      '  BILL_TO_ID, SHIP_TO_ID, CUSER1, CUSER2, CUSER3, CUSER5, '
      '  CUSER6, TIMESTAMP, FOB, CHANGEUSER_ID, TERMS_ID, FREIGHT_ID, '
      '  FREE_FORM, DISCOUNT, CONTACT_ID, ECODE, EID, EDATE_TIME, '
      
        '  ECOPY, CURRENCY_ID, "TYPE" AS "TYPE", REV, OE_CONTROL, EPLANT_' +
        'ID, '
      
        '  EDI_855_CREATED, PRINT_COUNT, PRINT_LAST_USER, PRINT_LAST_DATE' +
        ', '
      
        '  WEB_ORDERS_ID, EDI_CHANGE_DATE, WEB_CHANGE_DATE, AGGREGATE_CAL' +
        'CULATED, '
      '  INTER_CONSIGN, ARCUSTO_CREDIT_CARD_ID, DIVISION_ID, CUSER4, '
      
        '  CRM_QUOTE_ID, ALT_DIVISION_ID, COMMENT1, PAYMENT_TYPE, EXT_COM' +
        'MENT1, '
      
        '  ORD_LINE_DATE, FREIGHT_CHARGE, FREIGHT_QUOTENO, APPLY_FREIGHT_' +
        'BOL_TO_PS, '
      
        '  CONTACT_ID2, CAMPAIGN_ID, CRM_OPPORTUNITY_ID, FOB_THIRD_PARTY_' +
        'ID, '
      
        '  DROP_SHIP_PO_ID, EDI_865_CREATED, APPROVED, APPROVAL_REQUIRED,' +
        ' '
      
        '  FREIGHT_ACCOUNT_NUMBER, IS_DRAFT, IS_MANUAL_OUTSOURCE, IS_QUIC' +
        'K_ORDER, '
      '  ACCRUED_FREIGHT, TAX_CALCULATED, SHIP_COMPLETE'
      'FROM ORDERS'
      'WHERE ID = :ID')
    Left = 24
    Top = 56
  end
  object SrcContact: TDataSource
    DataSet = QryContact
    Left = 460
    Top = 96
  end
  object SrcSOContact: TDataSource
    DataSet = QrySOContact
    Left = 532
    Top = 96
  end
  object SrcDivision: TDataSource
    DataSet = QryDivision
    Left = 592
    Top = 96
  end
  object SrcFob: TDataSource
    DataSet = QryFob
    Left = 660
    Top = 96
  end
  object SrcTerms: TDataSource
    DataSet = QryTerms
    Left = 716
    Top = 96
  end
  object SrcFreightLookup: TDataSource
    DataSet = QryFreight
    Left = 776
    Top = 92
  end
end
