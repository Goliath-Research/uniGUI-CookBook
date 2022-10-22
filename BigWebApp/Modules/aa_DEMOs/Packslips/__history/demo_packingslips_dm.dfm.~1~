object DemoPackslip_DM: TDemoPackslip_DM
  OldCreateOrder = False
  Height = 157
  Width = 424
  object FDQryPSHeader: TFDQuery
    DetailFields = 'ARCUSTO_CUSTNO'
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select s.packslipno,'
      '       s.fob,'
      '       s.shipdate,'
      '       s.ps_date,'
      '       s.arcusto_custno,'
      '       s.arcusto_addr1,'
      '       s.arcusto_addr2,'
      '       s.arcusto_addr3,'
      '       s.arcusto_city,'
      '       s.arcusto_state,'
      '       s.arcusto_country,'
      '       s.arcusto_zip,'
      '       s.arcusto_ext,'
      '       s.arcusto_prime_contact,'
      '       s.ship_to_attn,'
      '       s.ship_to_addr1,'
      '       s.ship_to_addr2,'
      '       s.ship_to_addr3,'
      '       s.ship_to_city,'
      '       s.ship_to_state,'
      '       s.ship_to_country,'
      '       s.ship_to_zip,'
      '       s.ship_to_tax_code_id,'
      '       s.ship_to_phone_number,'
      '       s.ship_to_ext,'
      '       s.ship_to_fax,'
      '       s.ship_to_prime_contact,'
      '       s.ship_to_ship_time,'
      '       s.bill_to_attn,'
      '       s.bill_to_addr1,'
      '       s.bill_to_addr2,'
      '       s.bill_to_addr3,'
      '       s.bill_to_city,'
      '       s.bill_to_state,'
      '       s.bill_to_country,'
      '       s.bill_to_zip,'
      '       s.bill_to_phone_number,'
      '       s.bill_to_ext,'
      '       s.bill_to_fax,'
      '       s.bill_to_prime_contact,'
      '       s.terms_descrip,'
      '       s.terms_days,'
      '       s.terms_discount,'
      '       s.terms_discount_days,'
      '       s.arcusto_company,'
      '       s.arcusto_phone_number,'
      '       s.arcusto_fax_number,'
      '       s.pool_bill_number,'
      '       s.ship_via,'
      '       s.freight_descrip,'
      '       s.pro_no,'
      '       s.ship_time,'
      '       s.est_arrival,'
      '       s.conveyance_no,'
      '       s.box_code,'
      '       s.to_invoice,'
      '       s.arcusto_id,'
      '       s.userid,'
      '       s.bol_comment1,'
      '       s.shipment_type,'
      '       s.eplant_id,'
      
        '       (select name from EPLANT where id = s.eplant_id) as eplan' +
        't_name,'
      '       s.archived,'
      '       s.edi_created,'
      '       s.tracking_num,'
      '       s.vmi,'
      '       s.id,'
      '       s.pallet_count,'
      '       s.ship_to_id,'
      '       s.bill_to_id,'
      '       s.freight_id,'
      '       s.ps_ticket_id,'
      '       s.auto_freight_price,'
      '       s.ps_ticket_batch,'
      '       s.bol_id,'
      '       s.fob_third_party_id,'
      
        '       (select attn from fob_third_party where id = s.fob_third_' +
        'party_id) as fob_attn,'
      '       s.cuser1,'
      '       s.trailno,'
      '       s.note,'
      '       s.accrued_freight'
      ''
      '  from shipments s')
    Left = 32
    Top = 13
    object FDQryPSHeaderPACKSLIPNO: TStringField
      DisplayLabel = 'Packing Slip#'
      FieldName = 'PACKSLIPNO'
      Origin = 'PACKSLIPNO'
      Required = True
      Size = 15
    end
    object FDQryPSHeaderARCUSTO_COMPANY: TStringField
      DisplayLabel = 'Company'
      FieldName = 'ARCUSTO_COMPANY'
      Origin = 'ARCUSTO_COMPANY'
      Size = 60
    end
    object FDQryPSHeaderBILL_TO_PRIME_CONTACT: TStringField
      DisplayLabel = 'Contact'
      FieldName = 'BILL_TO_PRIME_CONTACT'
      Origin = 'BILL_TO_PRIME_CONTACT'
      FixedChar = True
      Size = 30
    end
    object FDQryPSHeaderSHIP_TO_ADDR1: TStringField
      DisplayLabel = 'Address'
      FieldName = 'SHIP_TO_ADDR1'
      Origin = 'SHIP_TO_ADDR1'
      Size = 60
    end
    object FDQryPSHeaderSHIP_TO_CITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'SHIP_TO_CITY'
      Origin = 'SHIP_TO_CITY'
      FixedChar = True
      Size = 30
    end
    object FDQryPSHeaderSHIP_TO_ZIP: TStringField
      DisplayLabel = 'Postal Code'
      FieldName = 'SHIP_TO_ZIP'
      Origin = 'SHIP_TO_ZIP'
    end
    object FDQryPSHeaderBILL_TO_STATE: TStringField
      DisplayLabel = 'State'
      FieldName = 'BILL_TO_STATE'
      Origin = 'BILL_TO_STATE'
    end
    object FDQryPSHeaderFOB: TStringField
      FieldName = 'FOB'
      Origin = 'FOB'
      Visible = False
      Size = 60
    end
    object FDQryPSHeaderSHIPDATE: TDateTimeField
      FieldName = 'SHIPDATE'
      Origin = 'SHIPDATE'
      Visible = False
    end
    object FDQryPSHeaderPS_DATE: TDateTimeField
      FieldName = 'PS_DATE'
      Origin = 'PS_DATE'
      Visible = False
    end
    object FDQryPSHeaderARCUSTO_CUSTNO: TStringField
      FieldName = 'ARCUSTO_CUSTNO'
      Origin = 'ARCUSTO_CUSTNO'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object FDQryPSHeaderARCUSTO_ADDR1: TStringField
      FieldName = 'ARCUSTO_ADDR1'
      Origin = 'ARCUSTO_ADDR1'
      Visible = False
      Size = 60
    end
    object FDQryPSHeaderARCUSTO_ADDR2: TStringField
      FieldName = 'ARCUSTO_ADDR2'
      Origin = 'ARCUSTO_ADDR2'
      Visible = False
      Size = 60
    end
    object FDQryPSHeaderARCUSTO_ADDR3: TStringField
      FieldName = 'ARCUSTO_ADDR3'
      Origin = 'ARCUSTO_ADDR3'
      Visible = False
      Size = 60
    end
    object FDQryPSHeaderARCUSTO_CITY: TStringField
      FieldName = 'ARCUSTO_CITY'
      Origin = 'ARCUSTO_CITY'
      Visible = False
      FixedChar = True
      Size = 30
    end
    object FDQryPSHeaderARCUSTO_STATE: TStringField
      FieldName = 'ARCUSTO_STATE'
      Origin = 'ARCUSTO_STATE'
      Visible = False
    end
    object FDQryPSHeaderARCUSTO_COUNTRY: TStringField
      FieldName = 'ARCUSTO_COUNTRY'
      Origin = 'ARCUSTO_COUNTRY'
      Visible = False
      Size = 100
    end
    object FDQryPSHeaderARCUSTO_ZIP: TStringField
      FieldName = 'ARCUSTO_ZIP'
      Origin = 'ARCUSTO_ZIP'
      Visible = False
    end
    object FDQryPSHeaderARCUSTO_EXT: TStringField
      FieldName = 'ARCUSTO_EXT'
      Origin = 'ARCUSTO_EXT'
      Visible = False
      FixedChar = True
      Size = 5
    end
    object FDQryPSHeaderARCUSTO_PRIME_CONTACT: TStringField
      FieldName = 'ARCUSTO_PRIME_CONTACT'
      Origin = 'ARCUSTO_PRIME_CONTACT'
      Visible = False
      FixedChar = True
      Size = 30
    end
    object FDQryPSHeaderSHIP_TO_ATTN: TStringField
      FieldName = 'SHIP_TO_ATTN'
      Origin = 'SHIP_TO_ATTN'
      Visible = False
      Size = 60
    end
    object FDQryPSHeaderSHIP_TO_ADDR3: TStringField
      FieldName = 'SHIP_TO_ADDR3'
      Origin = 'SHIP_TO_ADDR3'
      Visible = False
      Size = 60
    end
    object FDQryPSHeaderSHIP_TO_STATE: TStringField
      FieldName = 'SHIP_TO_STATE'
      Origin = 'SHIP_TO_STATE'
      Visible = False
    end
    object FDQryPSHeaderSHIP_TO_COUNTRY: TStringField
      FieldName = 'SHIP_TO_COUNTRY'
      Origin = 'SHIP_TO_COUNTRY'
      Visible = False
      Size = 100
    end
    object FDQryPSHeaderSHIP_TO_TAX_CODE_ID: TBCDField
      FieldName = 'SHIP_TO_TAX_CODE_ID'
      Origin = 'SHIP_TO_TAX_CODE_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object FDQryPSHeaderSHIP_TO_PHONE_NUMBER: TStringField
      FieldName = 'SHIP_TO_PHONE_NUMBER'
      Origin = 'SHIP_TO_PHONE_NUMBER'
      Visible = False
      Size = 25
    end
    object FDQryPSHeaderSHIP_TO_EXT: TStringField
      FieldName = 'SHIP_TO_EXT'
      Origin = 'SHIP_TO_EXT'
      Visible = False
      FixedChar = True
      Size = 5
    end
    object FDQryPSHeaderSHIP_TO_FAX: TStringField
      FieldName = 'SHIP_TO_FAX'
      Origin = 'SHIP_TO_FAX'
      Visible = False
      Size = 25
    end
    object FDQryPSHeaderSHIP_TO_PRIME_CONTACT: TStringField
      FieldName = 'SHIP_TO_PRIME_CONTACT'
      Origin = 'SHIP_TO_PRIME_CONTACT'
      Visible = False
      FixedChar = True
      Size = 30
    end
    object FDQryPSHeaderSHIP_TO_SHIP_TIME: TBCDField
      FieldName = 'SHIP_TO_SHIP_TIME'
      Origin = 'SHIP_TO_SHIP_TIME'
      Visible = False
      Precision = 7
      Size = 3
    end
    object FDQryPSHeaderBILL_TO_ATTN: TStringField
      FieldName = 'BILL_TO_ATTN'
      Origin = 'BILL_TO_ATTN'
      Visible = False
      Size = 60
    end
    object FDQryPSHeaderBILL_TO_ADDR1: TStringField
      FieldName = 'BILL_TO_ADDR1'
      Origin = 'BILL_TO_ADDR1'
      Visible = False
      Size = 60
    end
    object FDQryPSHeaderBILL_TO_ADDR2: TStringField
      FieldName = 'BILL_TO_ADDR2'
      Origin = 'BILL_TO_ADDR2'
      Visible = False
      Size = 60
    end
    object FDQryPSHeaderBILL_TO_ADDR3: TStringField
      FieldName = 'BILL_TO_ADDR3'
      Origin = 'BILL_TO_ADDR3'
      Visible = False
      Size = 60
    end
    object FDQryPSHeaderBILL_TO_CITY: TStringField
      FieldName = 'BILL_TO_CITY'
      Origin = 'BILL_TO_CITY'
      Visible = False
      FixedChar = True
      Size = 30
    end
    object FDQryPSHeaderSHIP_TO_ADDR2: TStringField
      FieldName = 'SHIP_TO_ADDR2'
      Origin = 'SHIP_TO_ADDR2'
      Visible = False
      Size = 60
    end
    object FDQryPSHeaderBILL_TO_COUNTRY: TStringField
      FieldName = 'BILL_TO_COUNTRY'
      Origin = 'BILL_TO_COUNTRY'
      Visible = False
      Size = 100
    end
    object FDQryPSHeaderBILL_TO_ZIP: TStringField
      FieldName = 'BILL_TO_ZIP'
      Origin = 'BILL_TO_ZIP'
      Visible = False
    end
    object FDQryPSHeaderBILL_TO_PHONE_NUMBER: TStringField
      FieldName = 'BILL_TO_PHONE_NUMBER'
      Origin = 'BILL_TO_PHONE_NUMBER'
      Visible = False
      Size = 25
    end
    object FDQryPSHeaderBILL_TO_EXT: TStringField
      FieldName = 'BILL_TO_EXT'
      Origin = 'BILL_TO_EXT'
      Visible = False
      FixedChar = True
      Size = 5
    end
    object FDQryPSHeaderBILL_TO_FAX: TStringField
      FieldName = 'BILL_TO_FAX'
      Origin = 'BILL_TO_FAX'
      Visible = False
      Size = 25
    end
    object FDQryPSHeaderTERMS_DESCRIP: TStringField
      FieldName = 'TERMS_DESCRIP'
      Origin = 'TERMS_DESCRIP'
      Visible = False
      Size = 60
    end
    object FDQryPSHeaderTERMS_DAYS: TBCDField
      FieldName = 'TERMS_DAYS'
      Origin = 'TERMS_DAYS'
      Visible = False
      Precision = 3
      Size = 0
    end
    object FDQryPSHeaderTERMS_DISCOUNT: TBCDField
      FieldName = 'TERMS_DISCOUNT'
      Origin = 'TERMS_DISCOUNT'
      Visible = False
      Precision = 5
      Size = 3
    end
    object FDQryPSHeaderTERMS_DISCOUNT_DAYS: TBCDField
      FieldName = 'TERMS_DISCOUNT_DAYS'
      Origin = 'TERMS_DISCOUNT_DAYS'
      Visible = False
      Precision = 3
      Size = 0
    end
    object FDQryPSHeaderARCUSTO_PHONE_NUMBER: TStringField
      FieldName = 'ARCUSTO_PHONE_NUMBER'
      Origin = 'ARCUSTO_PHONE_NUMBER'
      Visible = False
      Size = 25
    end
    object FDQryPSHeaderARCUSTO_FAX_NUMBER: TStringField
      FieldName = 'ARCUSTO_FAX_NUMBER'
      Origin = 'ARCUSTO_FAX_NUMBER'
      Visible = False
      Size = 25
    end
    object FDQryPSHeaderPOOL_BILL_NUMBER: TStringField
      FieldName = 'POOL_BILL_NUMBER'
      Origin = 'POOL_BILL_NUMBER'
      Visible = False
      Size = 50
    end
    object FDQryPSHeaderSHIP_VIA: TStringField
      FieldName = 'SHIP_VIA'
      Origin = 'SHIP_VIA'
      Visible = False
      Size = 30
    end
    object FDQryPSHeaderFREIGHT_DESCRIP: TStringField
      FieldName = 'FREIGHT_DESCRIP'
      Origin = 'FREIGHT_DESCRIP'
      Visible = False
      Size = 60
    end
    object FDQryPSHeaderPRO_NO: TStringField
      FieldName = 'PRO_NO'
      Origin = 'PRO_NO'
      Visible = False
      Size = 25
    end
    object FDQryPSHeaderSHIP_TIME: TDateTimeField
      FieldName = 'SHIP_TIME'
      Origin = 'SHIP_TIME'
      Visible = False
    end
    object FDQryPSHeaderEST_ARRIVAL: TDateTimeField
      FieldName = 'EST_ARRIVAL'
      Origin = 'EST_ARRIVAL'
      Visible = False
    end
    object FDQryPSHeaderCONVEYANCE_NO: TStringField
      FieldName = 'CONVEYANCE_NO'
      Origin = 'CONVEYANCE_NO'
      Visible = False
      Size = 25
    end
    object FDQryPSHeaderBOX_CODE: TStringField
      FieldName = 'BOX_CODE'
      Origin = 'BOX_CODE'
      Visible = False
      Size = 10
    end
    object FDQryPSHeaderTO_INVOICE: TStringField
      FieldName = 'TO_INVOICE'
      Origin = 'TO_INVOICE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object FDQryPSHeaderARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Origin = 'ARCUSTO_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object FDQryPSHeaderUSERID: TStringField
      FieldName = 'USERID'
      Origin = 'USERID'
      Visible = False
      Size = 35
    end
    object FDQryPSHeaderBOL_COMMENT1: TStringField
      FieldName = 'BOL_COMMENT1'
      Origin = 'BOL_COMMENT1'
      Visible = False
      Size = 2000
    end
    object FDQryPSHeaderSHIPMENT_TYPE: TStringField
      FieldName = 'SHIPMENT_TYPE'
      Origin = 'SHIPMENT_TYPE'
      Visible = False
      Size = 50
    end
    object FDQryPSHeaderEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object FDQryPSHeaderEPLANT_NAME: TStringField
      FieldName = 'EPLANT_NAME'
      Origin = 'EPLANT_NAME'
      Visible = False
      Size = 30
    end
    object FDQryPSHeaderARCHIVED: TStringField
      FieldName = 'ARCHIVED'
      Origin = 'ARCHIVED'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object FDQryPSHeaderEDI_CREATED: TStringField
      FieldName = 'EDI_CREATED'
      Origin = 'EDI_CREATED'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object FDQryPSHeaderTRACKING_NUM: TStringField
      FieldName = 'TRACKING_NUM'
      Origin = 'TRACKING_NUM'
      Visible = False
      Size = 50
    end
    object FDQryPSHeaderVMI: TStringField
      FieldName = 'VMI'
      Origin = 'VMI'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object FDQryPSHeaderID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object FDQryPSHeaderPALLET_COUNT: TBCDField
      FieldName = 'PALLET_COUNT'
      Origin = 'PALLET_COUNT'
      Visible = False
      Precision = 6
      Size = 0
    end
    object FDQryPSHeaderSHIP_TO_ID: TBCDField
      FieldName = 'SHIP_TO_ID'
      Origin = 'SHIP_TO_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object FDQryPSHeaderBILL_TO_ID: TBCDField
      FieldName = 'BILL_TO_ID'
      Origin = 'BILL_TO_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object FDQryPSHeaderFREIGHT_ID: TBCDField
      FieldName = 'FREIGHT_ID'
      Origin = 'FREIGHT_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object FDQryPSHeaderPS_TICKET_ID: TBCDField
      FieldName = 'PS_TICKET_ID'
      Origin = 'PS_TICKET_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object FDQryPSHeaderAUTO_FREIGHT_PRICE: TBCDField
      FieldName = 'AUTO_FREIGHT_PRICE'
      Origin = 'AUTO_FREIGHT_PRICE'
      Visible = False
      Precision = 12
      Size = 2
    end
    object FDQryPSHeaderPS_TICKET_BATCH: TBCDField
      FieldName = 'PS_TICKET_BATCH'
      Origin = 'PS_TICKET_BATCH'
      Visible = False
      Precision = 15
      Size = 0
    end
    object FDQryPSHeaderBOL_ID: TBCDField
      FieldName = 'BOL_ID'
      Origin = 'BOL_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object FDQryPSHeaderFOB_THIRD_PARTY_ID: TBCDField
      FieldName = 'FOB_THIRD_PARTY_ID'
      Origin = 'FOB_THIRD_PARTY_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object FDQryPSHeaderFOB_ATTN: TStringField
      FieldName = 'FOB_ATTN'
      Origin = 'FOB_ATTN'
      Visible = False
      Size = 60
    end
    object FDQryPSHeaderCUSER1: TStringField
      FieldName = 'CUSER1'
      Origin = 'CUSER1'
      Visible = False
      Size = 60
    end
    object FDQryPSHeaderTRAILNO: TStringField
      FieldName = 'TRAILNO'
      Origin = 'TRAILNO'
      Visible = False
      Size = 30
    end
    object FDQryPSHeaderNOTE: TStringField
      FieldName = 'NOTE'
      Origin = 'NOTE'
      Visible = False
      Size = 255
    end
    object FDQryPSHeaderACCRUED_FREIGHT: TBCDField
      FieldName = 'ACCRUED_FREIGHT'
      Origin = 'ACCRUED_FREIGHT'
      Visible = False
      Precision = 16
      Size = 2
    end
  end
  object SrcPSHeader: TDataSource
    DataSet = FDQryPSHeader
    Left = 32
    Top = 64
  end
  object SrcShip_Dtl: TDataSource
    DataSet = FDQryShipDetail
    Left = 104
    Top = 64
  end
  object FDQryShipDetail: TFDQuery
    Active = True
    MasterSource = SrcPSHeader
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select s.id,'
      '       s.shipments_id,'
      '       s.order_dtl_id,'
      '       s.qtyshipped,'
      '       s.backorder_qty,'
      '       a.invoiced_qty as invoiced_qty,'
      '       b.invoiced_qty as ord_invoiced_qty,'
      '       s.cmtline,'
      
        '       decode( h.id, NULL,  d.comment1, h.comment1 ) as ord_deta' +
        'il_cmtline,'
      '       decode( ho.id, NULL, o.orderno,  ho.orderno ) as orderno,'
      '       m.shipment_type,'
      '       decode( h.id, NULL, d.unit,  h.unit ) as uom,'
      '       o.crm_quote_id,'
      '       q.rfq as crm_quote_rfq,'
      '       q.project as crm_quote_descrip,'
      '       s.ran,'
      '       decode( ho.id, NULL, o.pono,  ho.pono ) as pono,'
      '       s.phantom_ps_ticket_dtl_id,'
      '       s.ps_ticket_dtl_arinvt_id,'
      '       s.phantom_ord_detail_id,'
      
        '       (select decode( arinvt_id, NULL, RTrim(misc_item), rtrim(' +
        ' descrip  )) from c_ship_hist where shipment_dtl_id = s.id) as d' +
        'escrip,'
      
        '       (select decode( arinvt_id, NULL, NULL,             rtrim(' +
        ' descrip2 )) from c_ship_hist where shipment_dtl_id = s.id) as e' +
        'xtdescrip,'
      
        '       (select decode( arinvt_id, NULL, rtrim(misc_itemno), rtri' +
        'm( itemno )) from c_ship_hist where shipment_dtl_id = s.id) as i' +
        'temno,'
      
        '       (select decode( arinvt_id, NULL, NULL,             rtrim(' +
        ' rev ))      from c_ship_hist where shipment_dtl_id = s.id) as r' +
        'ev,'
      
        '       (select decode( arinvt_id, NULL, NULL,             rtrim(' +
        ' class ))    from c_ship_hist where shipment_dtl_id = s.id) as c' +
        'lass'
      '  from shipments m,'
      '       shipment_dtl s,'
      '       ord_detail d,'
      '       hist_ord_detail h,'
      '       orders o,'
      '       hist_orders ho,'
      '       c_arinvoice_ship_sum a,'
      '       c_arinvoice_ord_sum b,'
      '       crm_quote q'
      ' where'
      '       s.shipments_id = :ID'
      
        '   and m.id = s.shipments_id                -- to get shipment_t' +
        'ype'
      '   and s.id = a.shipment_dtl_id(+)'
      '   and s.order_dtl_id = b.ord_detail_id(+)'
      
        '   and s.order_dtl_id = d.id(+)             -- link in current o' +
        'rders for comment1'
      
        '   and s.order_dtl_id = h.id(+)             -- same for hist ord' +
        'ers'
      
        '   and d.orders_id = o.id(+)                -- link in orders to' +
        ' get orderno'
      
        '   and h.orders_id = ho.id(+)               -- link in hist orde' +
        'rs to get orderno'
      
        '   and q.id(+) = o.crm_quote_id             -- linked CRM Quotat' +
        'ion'
      ''
      'order by s.id'
      '')
    Left = 104
    Top = 16
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object FDQryShipDetailID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
    object FDQryShipDetailSHIPMENTS_ID: TBCDField
      FieldName = 'SHIPMENTS_ID'
      Origin = 'SHIPMENTS_ID'
      Precision = 15
      Size = 0
    end
    object FDQryShipDetailORDER_DTL_ID: TBCDField
      FieldName = 'ORDER_DTL_ID'
      Origin = 'ORDER_DTL_ID'
      Precision = 15
      Size = 0
    end
    object FDQryShipDetailQTYSHIPPED: TBCDField
      FieldName = 'QTYSHIPPED'
      Origin = 'QTYSHIPPED'
      Precision = 14
    end
    object FDQryShipDetailBACKORDER_QTY: TBCDField
      FieldName = 'BACKORDER_QTY'
      Origin = 'BACKORDER_QTY'
      Precision = 14
    end
    object FDQryShipDetailINVOICED_QTY: TBCDField
      FieldName = 'INVOICED_QTY'
      Origin = 'INVOICED_QTY'
      Precision = 14
    end
    object FDQryShipDetailORD_INVOICED_QTY: TBCDField
      FieldName = 'ORD_INVOICED_QTY'
      Origin = 'ORD_INVOICED_QTY'
      Precision = 14
    end
    object FDQryShipDetailCMTLINE: TStringField
      FieldName = 'CMTLINE'
      Origin = 'CMTLINE'
      Size = 2000
    end
    object FDQryShipDetailORD_DETAIL_CMTLINE: TStringField
      FieldName = 'ORD_DETAIL_CMTLINE'
      Origin = 'ORD_DETAIL_CMTLINE'
      Size = 2000
    end
    object FDQryShipDetailORDERNO: TStringField
      FieldName = 'ORDERNO'
      Origin = 'ORDERNO'
      Size = 15
    end
    object FDQryShipDetailSHIPMENT_TYPE: TStringField
      FieldName = 'SHIPMENT_TYPE'
      Origin = 'SHIPMENT_TYPE'
      Size = 50
    end
    object FDQryShipDetailUOM: TStringField
      FieldName = 'UOM'
      Origin = 'UOM'
      Size = 10
    end
    object FDQryShipDetailCRM_QUOTE_ID: TBCDField
      FieldName = 'CRM_QUOTE_ID'
      Origin = 'CRM_QUOTE_ID'
      Precision = 15
      Size = 0
    end
    object FDQryShipDetailCRM_QUOTE_RFQ: TStringField
      FieldName = 'CRM_QUOTE_RFQ'
      Origin = 'CRM_QUOTE_RFQ'
      FixedChar = True
      Size = 10
    end
    object FDQryShipDetailCRM_QUOTE_DESCRIP: TStringField
      FieldName = 'CRM_QUOTE_DESCRIP'
      Origin = 'CRM_QUOTE_DESCRIP'
      Size = 35
    end
    object FDQryShipDetailRAN: TStringField
      FieldName = 'RAN'
      Origin = 'RAN'
      Size = 30
    end
    object FDQryShipDetailPONO: TStringField
      FieldName = 'PONO'
      Origin = 'PONO'
      Size = 35
    end
    object FDQryShipDetailPHANTOM_PS_TICKET_DTL_ID: TBCDField
      FieldName = 'PHANTOM_PS_TICKET_DTL_ID'
      Origin = 'PHANTOM_PS_TICKET_DTL_ID'
      Precision = 15
      Size = 0
    end
    object FDQryShipDetailPS_TICKET_DTL_ARINVT_ID: TBCDField
      FieldName = 'PS_TICKET_DTL_ARINVT_ID'
      Origin = 'PS_TICKET_DTL_ARINVT_ID'
      Precision = 15
      Size = 0
    end
    object FDQryShipDetailPHANTOM_ORD_DETAIL_ID: TBCDField
      FieldName = 'PHANTOM_ORD_DETAIL_ID'
      Origin = 'PHANTOM_ORD_DETAIL_ID'
      Precision = 15
      Size = 0
    end
    object FDQryShipDetailDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 250
    end
    object FDQryShipDetailEXTDESCRIP: TStringField
      FieldName = 'EXTDESCRIP'
      Origin = 'EXTDESCRIP'
      Size = 100
    end
    object FDQryShipDetailITEMNO: TStringField
      FieldName = 'ITEMNO'
      Origin = 'ITEMNO'
      Size = 50
    end
    object FDQryShipDetailREV: TStringField
      FieldName = 'REV'
      Origin = 'REV'
      Size = 15
    end
    object FDQryShipDetailCLASS: TStringField
      FieldName = 'CLASS'
      Origin = 'CLASS'
      Size = 2
    end
  end
  object SrcShip_Rel: TDataSource
    DataSet = FDQryShipReleases
    Left = 176
    Top = 64
  end
  object FDQryShipReleases: TFDQuery
    Active = True
    MasterSource = SrcShip_Dtl
    MasterFields = 'ID'
    DetailFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'SELECT shipment_dtl_id,'
      '       loc_desc,'
      '       lotno,'
      '       qtyshipped,'
      '       lot_date,'
      '       lot_expiry_date, id'
      '  FROM shipment_releases'
      ' where shipment_dtl_id = :ID')
    Left = 184
    Top = 16
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object FDQryShipReleasesSHIPMENT_DTL_ID: TBCDField
      FieldName = 'SHIPMENT_DTL_ID'
      Origin = 'SHIPMENT_DTL_ID'
      Precision = 15
      Size = 0
    end
    object FDQryShipReleasesLOC_DESC: TStringField
      FieldName = 'LOC_DESC'
      Origin = 'LOC_DESC'
      FixedChar = True
      Size = 30
    end
    object FDQryShipReleasesLOTNO: TStringField
      FieldName = 'LOTNO'
      Origin = 'LOTNO'
      Size = 25
    end
    object FDQryShipReleasesQTYSHIPPED: TBCDField
      FieldName = 'QTYSHIPPED'
      Origin = 'QTYSHIPPED'
      Precision = 14
    end
    object FDQryShipReleasesLOT_DATE: TDateTimeField
      FieldName = 'LOT_DATE'
      Origin = 'LOT_DATE'
    end
    object FDQryShipReleasesLOT_EXPIRY_DATE: TDateTimeField
      FieldName = 'LOT_EXPIRY_DATE'
      Origin = 'LOT_EXPIRY_DATE'
    end
    object FDQryShipReleasesID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
  end
end
