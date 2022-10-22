object DM_PO: TDM_PO
  OldCreateOrder = True
  Height = 561
  Width = 728
  object SrcPo: TDataSource
    DataSet = QryPO
    OnDataChange = SrcPoDataChange
    Left = 32
    Top = 24
  end
  object SrcFreight: TDataSource
    DataSet = QryFreight
    Left = 112
    Top = 152
  end
  object SrcTerms: TDataSource
    DataSet = QryTerms
    Left = 208
    Top = 152
  end
  object PKVendors: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'Select id,'
      '       vendorno,'
      '       attn,'
      '       company,'
      '       addr1,'
      '       addr2,'
      '       city,'
      '       state,'
      '       terms_id,'
      '       zip,'
      '       pk_hide  '
      '  from v_vendor       ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 32
    Top = 328
    object PKVendorsVENDORNO: TStringField
      DisplayLabel = 'Vendor#'
      FieldName = 'VENDORNO'
      Size = 10
    end
    object PKVendorsID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PKVendorsATTN: TStringField
      DisplayLabel = 'Contact'
      FieldName = 'ATTN'
      Size = 30
    end
    object PKVendorsCOMPANY: TStringField
      DisplayLabel = 'Vendor'
      FieldName = 'COMPANY'
      Size = 60
    end
    object PKVendorsADDR1: TStringField
      DisplayLabel = 'Addr1'
      FieldName = 'ADDR1'
      Size = 60
    end
    object PKVendorsADDR2: TStringField
      DisplayLabel = 'Addr2'
      FieldName = 'ADDR2'
      Size = 60
    end
    object PKVendorsCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Size = 30
    end
    object PKVendorsSTATE: TStringField
      DisplayLabel = 'State'
      FieldName = 'STATE'
    end
    object PKVendorsTERMS_ID: TBCDField
      FieldName = 'TERMS_ID'
      Visible = False
      Size = 0
    end
    object PKVendorsZIP: TStringField
      DisplayLabel = 'Zip'
      FieldName = 'ZIP'
      Size = 10
    end
    object PKVendorsPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.VENDOR.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object PKRemitTo: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'Select id,'
      '       vendor_id,'
      '       attn,'
      '       addr1,'
      '       addr2,'
      '       city,'
      '       state,'
      '       zip  '
      '  from remit_to       ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 120
    Top = 328
    object PKRemitToID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PKRemitToVENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Visible = False
      Size = 0
    end
    object PKRemitToATTN: TStringField
      DisplayLabel = 'Attn.'
      FieldName = 'ATTN'
      Size = 60
    end
    object PKRemitToADDR1: TStringField
      DisplayLabel = 'Address1'
      FieldName = 'ADDR1'
      Size = 60
    end
    object PKRemitToADDR2: TStringField
      DisplayLabel = 'Address2'
      FieldName = 'ADDR2'
      Size = 60
    end
    object PKRemitToCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Size = 30
    end
    object PKRemitToSTATE: TStringField
      DisplayLabel = 'State'
      FieldName = 'STATE'
    end
    object PKRemitToZIP: TStringField
      FieldName = 'ZIP'
      Size = 10
    end
  end
  object PkAka: TIQWebHpick
    BeforeOpen = PkAkaBeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select v.id as id,'
      '       v.vend_itemno  as vend_itemno,'
      '       v.vend_descrip as vend_descrip,'
      '       v.vend_descrip2 as vend_descrip2,'
      '       v.vend_rev as vend_rev,       '
      '       a.itemno as itemno,'
      '       a.descrip as descrip,'
      '       a.descrip2 as descrip2,'
      '       a.class as class,'
      '       a.rev as rev,'
      '       a.eplant_id   as eplant_id,'
      '       v.arinvt_id as arinvt_id'
      '  from arinvt_vendors v,'
      '       arinvt a'
      ' where a.id = v.arinvt_id'
      '   and v.vendor_id = :VENDOR_ID'
      '   and NVL(a.PK_HIDE, '#39'N'#39') = '#39'N'#39
      '   and misc.eplant_filter(a.eplant_id) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 200
    Top = 400
    ParamData = <
      item
        Name = 'vendor_id'
        DataType = ftBCD
      end>
    object PkAkaVEND_ITEMNO: TStringField
      DisplayLabel = 'Vendor Item #'
      FieldName = 'VEND_ITEMNO'
      Origin = 'v.vend_itemno'
      Size = 25
    end
    object PkAkaVEND_DESCRIP: TStringField
      DisplayLabel = 'Vendor Item Description'
      DisplayWidth = 25
      FieldName = 'VEND_DESCRIP'
      Origin = 'v.vend_descrip'
      Size = 35
    end
    object PkAkaARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Origin = 'v.arinvt_id'
      Visible = False
      Size = 0
    end
    object PkAkaITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Origin = 'a.itemno'
      FixedChar = True
      Size = 50
    end
    object PkAkaDESCRIP: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Origin = 'a.descrip'
      Size = 100
    end
    object PkAkaCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Origin = 'a.class'
      FixedChar = True
      Size = 2
    end
    object PkAkaREV: TStringField
      DisplayLabel = 'Rev '
      DisplayWidth = 5
      FieldName = 'REV'
      Origin = 'a.rev'
      FixedChar = True
      Size = 15
    end
    object PkAkaEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'a.eplant_id'
      Size = 0
    end
    object PkAkaDESCRIP2: TStringField
      DisplayLabel = 'Ext. Description'
      FieldName = 'DESCRIP2'
      Origin = 'a.descrip2'
      Size = 100
    end
    object PkAkaVEND_DESCRIP2: TStringField
      DisplayLabel = 'Vendor Item Description2'
      FieldName = 'VEND_DESCRIP2'
      Origin = 'v.vend_descrip2'
      Size = 100
    end
    object PkAkaID: TBCDField
      FieldName = 'ID'
      Origin = 'v.id'
      Visible = False
      Size = 0
    end
    object PkAkaVEND_REV: TStringField
      DisplayLabel = 'Vendor Item Rev'
      FieldName = 'VEND_REV'
      Origin = 'v.vend_rev'
      Size = 15
    end
  end
  object PkArInvt: TIQWebHpick
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT id,'
      '       itemno,'
      '       descrip,'
      '       descrip2,'
      '       rev,'
      '       class,'
      '       eplant_id,'
      '       pk_hide'
      '  FROM arinvt'
      ' WHERE misc.eplant_filter(eplant_id) = 1')
    OnIQModify = PkArInvtIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 32
    Top = 400
    object PkArInvtID: TBCDField
      FieldName = 'ID'
      Origin = 'id'
      Visible = False
      Size = 0
    end
    object PkArInvtITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Origin = 'itemno'
      Size = 50
    end
    object PkArInvtDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'descrip'
      Size = 100
    end
    object PkArInvtDESCRIP2: TStringField
      DisplayLabel = 'Extended Description'
      FieldName = 'DESCRIP2'
      Origin = 'descrip2'
      Size = 100
    end
    object PkArInvtREV: TStringField
      DisplayLabel = 'Revision'
      FieldName = 'REV'
      Origin = 'rev'
      Size = 15
    end
    object PkArInvtCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Origin = 'class'
      Size = 2
    end
    object PkArInvtEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'eplant_id'
      Size = 0
    end
    object PkArInvtPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'pk_hide'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object PKLineItems: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id             as id,'
      '       pono           as pono,'
      '       vendor_id      as vendor_id,'
      '       po_date        as po_date,'
      '       terms_id       as terms_id,'
      '       remit_to_id    as remit_to_id,'
      '       ship_to_id     as ship_to_id,'
      '       userid         as userid,'
      '       freight_id     as freight_id,'
      '       fob            as fob,'
      '       tax_code_id    as tax_code_id,'
      '       comment1       as comment1,'
      '       po_detail_id   as po_detail_id,'
      '       seq            as seq,'
      '       arinvt_id      as arinvt_id,'
      '       substr(cmtline,1,255) as cmtline,'
      '       total_qty_ord  as total_qty_ord,'
      '       unit_price     as unit_price,'
      '       total          as total,'
      '       item_descrip   as item_descrip,'
      '       item_number    as item_number,'
      '       req_date       as req_date,'
      '       cost_object_id as cost_object_id,'
      '       glacct_id_inv  as glacct_id_inv,'
      '       closed         as closed, '
      '       taxable        as taxable,'
      '       misc_item      as misc_item,'
      '       vcomp          as vcomp,'
      '       vaddr1         as vaddr1,'
      '       vaddr2         as vaddr2,'
      '       vcity          as vcity,'
      '       vstate         as vstate,'
      '       vzip           as vzip, '
      '       rcomp          as rcomp,'
      '       raddr1         as raddr1,'
      '       raddr2         as raddr2,'
      '       rcity          as rcity,'
      '       rstate         as rstate,'
      '       rzip           as rzip,'
      '       tax_rate       as tax_rate,'
      '       acct           as acct,'
      '       terms          as terms, '
      '       freight        as freight,'
      '       itemno         as itemno,'
      '       descrip        as descrip,'
      '       descrip2        as descrip2,'
      '       rev            as rev,'
      '       class          as class'
      ' from v_po_detail'
      'where (NVL(arinvt_id, 0) <> 0 or NVL(misc_item, '#39' '#39') <> '#39' '#39')'
      '  and misc.eplant_filter(eplant_id) = 1'
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 280
    Top = 400
    object PKLineItemsID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PKLineItemsPONO: TStringField
      DisplayLabel = 'PO#'
      FieldName = 'PONO'
      Size = 35
    end
    object PKLineItemsVENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Visible = False
      Size = 0
    end
    object PKLineItemsPO_DATE: TDateTimeField
      DisplayLabel = 'PO Date'
      FieldName = 'PO_DATE'
    end
    object PKLineItemsTERMS_ID: TBCDField
      FieldName = 'TERMS_ID'
      Visible = False
      Size = 0
    end
    object PKLineItemsREMIT_TO_ID: TBCDField
      FieldName = 'REMIT_TO_ID'
      Visible = False
      Size = 0
    end
    object PKLineItemsFREIGHT_ID: TBCDField
      FieldName = 'FREIGHT_ID'
      Visible = False
      Size = 0
    end
    object PKLineItemsFOB: TStringField
      FieldName = 'FOB'
      Visible = False
      Size = 60
    end
    object PKLineItemsTAX_CODE_ID: TFMTBCDField
      FieldName = 'TAX_CODE_ID'
      Visible = False
      Size = 38
    end
    object PKLineItemsSEQ: TBCDField
      FieldName = 'SEQ'
      Visible = False
      Size = 0
    end
    object PKLineItemsARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object PKLineItemsTOTAL_QTY_ORD: TBCDField
      DisplayLabel = 'Qty. Ordered'
      FieldName = 'TOTAL_QTY_ORD'
    end
    object PKLineItemsUNIT_PRICE: TFMTBCDField
      DisplayLabel = 'Unit Price'
      FieldName = 'UNIT_PRICE'
      currency = True
      Size = 6
    end
    object PKLineItemsTOTAL: TFMTBCDField
      DisplayLabel = 'Total.'
      FieldName = 'TOTAL'
      currency = True
      Size = 38
    end
    object PKLineItemsITEM_DESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'ITEM_DESCRIP'
      Size = 100
    end
    object PKLineItemsITEM_NUMBER: TStringField
      DisplayLabel = 'Item#'
      FieldName = 'ITEM_NUMBER'
      Size = 50
    end
    object PKLineItemsREQ_DATE: TDateTimeField
      DisplayLabel = 'Req.Date'
      FieldName = 'REQ_DATE'
    end
    object PKLineItemsGLACCT_ID_INV: TFMTBCDField
      FieldName = 'GLACCT_ID_INV'
      Visible = False
      Size = 38
    end
    object PKLineItemsCLOSED: TStringField
      DisplayLabel = 'Closed'
      FieldName = 'CLOSED'
      Size = 1
    end
    object PKLineItemsTAXABLE: TStringField
      DisplayLabel = 'Taxable'
      FieldName = 'TAXABLE'
      Size = 1
    end
    object PKLineItemsMISC_ITEM: TStringField
      FieldName = 'MISC_ITEM'
      Visible = False
      Size = 100
    end
    object PKLineItemsVCOMP: TStringField
      FieldName = 'VCOMP'
      Visible = False
      Size = 60
    end
    object PKLineItemsVADDR1: TStringField
      FieldName = 'VADDR1'
      Visible = False
      Size = 60
    end
    object PKLineItemsVADDR2: TStringField
      FieldName = 'VADDR2'
      Visible = False
      Size = 60
    end
    object PKLineItemsVCITY: TStringField
      FieldName = 'VCITY'
      Visible = False
      Size = 30
    end
    object PKLineItemsVSTATE: TStringField
      FieldName = 'VSTATE'
      Visible = False
    end
    object PKLineItemsVZIP: TStringField
      FieldName = 'VZIP'
      Visible = False
      Size = 10
    end
    object PKLineItemsRCOMP: TStringField
      FieldName = 'RCOMP'
      Visible = False
      Size = 60
    end
    object PKLineItemsRADDR1: TStringField
      FieldName = 'RADDR1'
      Visible = False
      Size = 60
    end
    object PKLineItemsRADDR2: TStringField
      FieldName = 'RADDR2'
      Visible = False
      Size = 60
    end
    object PKLineItemsRCITY: TStringField
      FieldName = 'RCITY'
      Visible = False
      Size = 30
    end
    object PKLineItemsRSTATE: TStringField
      FieldName = 'RSTATE'
      Visible = False
    end
    object PKLineItemsRZIP: TStringField
      FieldName = 'RZIP'
      Visible = False
      Size = 10
    end
    object PKLineItemsTAX_RATE: TFMTBCDField
      FieldName = 'TAX_RATE'
      Visible = False
      Size = 38
    end
    object PKLineItemsACCT: TStringField
      DisplayLabel = 'Inv. Acct'
      FieldName = 'ACCT'
      Size = 50
    end
    object PKLineItemsTERMS: TStringField
      FieldName = 'TERMS'
      Visible = False
      Size = 60
    end
    object PKLineItemsFREIGHT: TStringField
      FieldName = 'FREIGHT'
      Visible = False
      Size = 60
    end
    object PKLineItemsITEMNO: TStringField
      FieldName = 'ITEMNO'
      Visible = False
      Size = 50
    end
    object PKLineItemsDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Visible = False
      Size = 100
    end
    object PKLineItemsREV: TStringField
      DisplayLabel = 'Rev'
      FieldName = 'REV'
      Size = 15
    end
    object PKLineItemsCLASS: TStringField
      FieldName = 'CLASS'
      Visible = False
      Size = 2
    end
    object PKLineItemsPO_DETAIL_ID: TBCDField
      FieldName = 'PO_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object PKLineItemsCOST_OBJECT_ID: TBCDField
      FieldName = 'COST_OBJECT_ID'
      Visible = False
      Size = 0
    end
    object PKLineItemsSHIP_TO_ID: TBCDField
      FieldName = 'SHIP_TO_ID'
      Visible = False
      Size = 0
    end
    object PKLineItemsUSERID: TStringField
      DisplayLabel = 'User ID'
      FieldName = 'USERID'
      Size = 35
    end
    object PKLineItemsCOMMENT1: TStringField
      DisplayLabel = 'PO Header Note'
      FieldName = 'COMMENT1'
      Size = 255
    end
    object PKLineItemsCMTLINE: TStringField
      DisplayLabel = 'PO Detail Note'
      DisplayWidth = 50
      FieldName = 'CMTLINE'
      Size = 255
    end
    object PKLineItemsDESCRIP2: TStringField
      DisplayLabel = 'Ext. Description'
      FieldName = 'DESCRIP2'
      Size = 100
    end
  end
  object SrcViewPoTotal: TDataSource
    DataSet = ViewPoTotal
    Left = 32
    Top = 152
  end
  object SrcPoDetail: TDataSource
    DataSet = TblPoDetail
    Left = 120
    Top = 24
  end
  object TblPoDetail: TFDTable
    BeforeOpen = AssignEPlantFilter
    BeforeInsert = TblPoDetailBeforeInsert
    AfterInsert = TblPoDetailAfterInsert
    BeforeEdit = TblPoDetailBeforeEdit
    BeforePost = TblPoDetailBeforePost
    AfterPost = TblPoDetailAfterPost
    BeforeDelete = TblPoDetailBeforeDelete
    AfterDelete = TblPoDetailAfterDelete
    AfterScroll = TblPoDetailAfterScroll
    OnCalcFields = TblPoDetailCalcFields
    OnNewRecord = TblPoDetailNewRecord
    Filtered = True
    IndexFieldNames = 'PO_ID;SEQ'
    MasterSource = SrcPo
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvRefreshMode]
    UpdateOptions.RefreshMode = rmManual
    UpdateOptions.UpdateTableName = 'PO_DETAIL'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'PO_DETAIL'
    Left = 128
    Top = 32
    object TblPoDetailSEQ: TBCDField
      DisplayLabel = '#'
      DisplayWidth = 2
      FieldName = 'SEQ'
      Size = 0
    end
    object TblPoDetailDisp_Descript: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'Disp_Descript'
      ReadOnly = True
      Size = 100
      Calculated = True
    end
    object TblPoDetailItemNumber: TStringField
      DisplayLabel = 'Item#'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'ItemNumber'
      LookupKeyFields = 'ID'
      LookupResultField = 'ITEMNO'
      KeyFields = 'ARINVT_ID'
      ReadOnly = True
      Size = 50
      Calculated = True
    end
    object TblPoDetailTOTAL_QTY_ORD: TBCDField
      DisplayLabel = 'Qty Ordered'
      DisplayWidth = 10
      FieldName = 'TOTAL_QTY_ORD'
      DisplayFormat = '##########.####'
    end
    object TblPoDetailQty_Received: TFloatField
      DisplayLabel = 'Qty Rec.'
      DisplayWidth = 12
      FieldKind = fkCalculated
      FieldName = 'Qty_Received'
      ReadOnly = True
      Calculated = True
    end
    object TblPoDetailQty_OnOrder: TFMTBCDField
      DisplayLabel = 'Qty On Order'
      DisplayWidth = 11
      FieldKind = fkCalculated
      FieldName = 'Qty_OnOrder'
      Calculated = True
    end
    object TblPoDetailUNIT_PRICE: TFMTBCDField
      DisplayLabel = 'Unit Price'
      DisplayWidth = 10
      FieldName = 'UNIT_PRICE'
      Origin = 'UNIT_PRICE'
      DisplayFormat = '0.000000'
      currency = True
      Precision = 15
      Size = 6
    end
    object TblPoDetailTotal: TFloatField
      DisplayWidth = 7
      FieldKind = fkCalculated
      FieldName = 'Total'
      ReadOnly = True
      currency = True
      Calculated = True
    end
    object TblPoDetailCMTLINE: TStringField
      DisplayLabel = 'Note'
      DisplayWidth = 19
      FieldName = 'CMTLINE'
      Origin = 'CMTLINE'
      Size = 2000
    end
    object TblPoDetailCLOSED: TStringField
      DisplayLabel = 'Closed'
      DisplayWidth = 6
      FieldName = 'CLOSED'
      Origin = 'CLOSED'
      FixedChar = True
      Size = 1
    end
    object TblPoDetailTAXABLE: TStringField
      DisplayLabel = 'Taxable'
      DisplayWidth = 7
      FieldName = 'TAXABLE'
      Origin = 'TAXABLE'
      FixedChar = True
      Size = 1
    end
    object TblPoDetailGLAcct: TStringField
      DisplayLabel = 'GLAcct'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'GlAcct'
      Size = 50
      Calculated = True
    end
    object TblPoDetailPRICE_PER_1000: TFMTBCDField
      DisplayLabel = 'Price/1000'
      DisplayWidth = 10
      FieldName = 'PRICE_PER_1000'
      Origin = 'PRICE_PER_1000'
      Precision = 18
      Size = 6
    end
    object TblPoDetailUNIT: TStringField
      DisplayLabel = 'UOM'
      DisplayWidth = 5
      FieldName = 'UNIT'
      Origin = 'UNIT'
      Size = 10
    end
    object TblPoDetailCost_Source: TStringField
      DisplayLabel = 'Cost Source'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Cost_Source'
      ReadOnly = True
      Size = 60
      Calculated = True
    end
    object TblPoDetailDONT_POST_PPV: TStringField
      DisplayLabel = 'Exclude from PPV, Std Cost'
      DisplayWidth = 22
      FieldName = 'DONT_POST_PPV'
      Origin = 'DONT_POST_PPV'
      FixedChar = True
      Size = 1
    end
    object TblPoDetailEPlant_Name: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 18
      FieldKind = fkLookup
      FieldName = 'EPlant_Name'
      LookupDataSet = QryEPlant
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIP'
      KeyFields = 'EPLANT_ID'
      ReadOnly = True
      Lookup = True
    end
    object TblPoDetailDivision_Name: TStringField
      DisplayLabel = 'Division Name'
      DisplayWidth = 17
      FieldKind = fkCalculated
      FieldName = 'Division_Name'
      Size = 25
      Calculated = True
    end
    object TblPoDetailDescrip2: TStringField
      DisplayLabel = 'Ext. Description'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Descrip2'
      Size = 100
      Calculated = True
    end
    object TblPoDetailRev: TStringField
      DisplayWidth = 7
      FieldKind = fkCalculated
      FieldName = 'Rev'
      LookupKeyFields = 'ID'
      LookupResultField = 'REV'
      KeyFields = 'ARINVT_ID'
      Calculated = True
    end
    object TblPoDetailClass: TStringField
      DisplayWidth = 2
      FieldKind = fkCalculated
      FieldName = 'Class'
      Size = 2
      Calculated = True
    end
    object TblPoDetailVendor_ItemNo: TStringField
      DisplayLabel = 'AKA Item #'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Vendor_ItemNo'
      Size = 25
      Calculated = True
    end
    object TblPoDetailVendor_Descrip: TStringField
      DisplayLabel = 'AKA Item Description'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Vendor_Descrip'
      Size = 35
      Calculated = True
    end
    object TblPoDetailVendor_Descrip2: TStringField
      DisplayLabel = 'AKA Ext Description'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Vendor_Descrip2'
      Size = 100
      Calculated = True
    end
    object TblPoDetailVend_Aka_Rev: TStringField
      DisplayLabel = 'AKA Rev'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Vend_Aka_Rev'
      Calculated = True
    end
    object TblPoDetailREF_CODE: TStringField
      DisplayLabel = 'Ref. Code'
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'REF_CODE'
      LookupDataSet = QryRefCode
      LookupKeyFields = 'REF_CODE_ID'
      LookupResultField = 'REF_CODE'
      KeyFields = 'REF_CODE_ID'
      Lookup = True
    end
    object TblPoDetailREF_CODE_DESCRIP: TStringField
      DisplayLabel = 'Ref. Code Description'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'REF_CODE_DESCRIP'
      LookupDataSet = QryRefCode
      LookupKeyFields = 'REF_CODE_ID'
      LookupResultField = 'REF_CODE_DESCRIP'
      KeyFields = 'REF_CODE_ID'
      Size = 60
      Lookup = True
    end
    object TblPoDetailCUSER1: TStringField
      DisplayLabel = 'User Text 1'
      DisplayWidth = 18
      FieldName = 'CUSER1'
      Size = 255
    end
    object TblPoDetailCUSER2: TStringField
      DisplayLabel = 'User Text 2'
      DisplayWidth = 18
      FieldName = 'CUSER2'
      Size = 255
    end
    object TblPoDetailCUSER3: TStringField
      DisplayLabel = 'User Text 3'
      DisplayWidth = 18
      FieldName = 'CUSER3'
      Size = 255
    end
    object TblPoDetailOEM_Vendor: TStringField
      DisplayLabel = 'OEM Vendor'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'OEM_Vendor'
      Size = 10
      Calculated = True
    end
    object TblPoDetailTaxCode: TStringField
      DisplayLabel = 'Tax'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'TaxCode'
      Calculated = True
    end
    object TblPoDetailREQ_DATE: TDateTimeField
      DisplayLabel = 'Req. Date'
      DisplayWidth = 10
      FieldName = 'REQ_DATE'
      Visible = False
      EditMask = '!99/99/0000;1; '
    end
    object TblPoDetailPROMISE_DATE: TDateTimeField
      DisplayLabel = 'Prom. Date'
      DisplayWidth = 10
      FieldName = 'PROMISE_DATE'
      Visible = False
      EditMask = '!99/99/0000;1; '
    end
    object TblPoDetailTAX_CODE_ID: TBCDField
      Tag = 1
      FieldName = 'TAX_CODE_ID'
      Origin = 'TAX_CODE_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object TblPoDetailVENDOR_RMA_RETURNS_ID: TBCDField
      Tag = 1
      FieldName = 'VENDOR_RMA_RETURNS_ID'
      Origin = 'VENDOR_RMA_RETURNS_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object TblPoDetailEXPORTED_DATE_TIME: TDateTimeField
      FieldName = 'EXPORTED_DATE_TIME'
      Origin = 'EXPORTED_DATE_TIME'
      Visible = False
    end
    object TblPoDetailMISC_NOTE: TStringField
      DisplayWidth = 255
      FieldName = 'MISC_NOTE'
      Visible = False
      Size = 255
    end
    object TblPoDetailDescription: TStringField
      DisplayWidth = 50
      FieldKind = fkCalculated
      FieldName = 'Description'
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIP'
      KeyFields = 'ARINVT_ID'
      Visible = False
      Size = 100
      Calculated = True
    end
    object TblPoDetailArinvt_Unit: TStringField
      FieldKind = fkCalculated
      FieldName = 'Arinvt_Unit'
      LookupKeyFields = 'ID'
      LookupResultField = 'UNIT'
      KeyFields = 'ARINVT_ID'
      Visible = False
      Size = 10
      Calculated = True
    end
    object TblPoDetailStd_Cost_Arinvt: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Std_Cost_Arinvt'
      LookupKeyFields = 'ID'
      LookupResultField = 'STD_COST'
      KeyFields = 'ARINVT_ID'
      Visible = False
      currency = True
      Calculated = True
    end
    object TblPoDetailCOST_OBJECT_SOURCE: TStringField
      FieldName = 'COST_OBJECT_SOURCE'
      Visible = False
      Size = 50
    end
    object TblPoDetailArinvtEplant_id: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ArinvtEplant_id'
      LookupKeyFields = 'ID'
      LookupResultField = 'EPLANT_ID'
      KeyFields = 'ARINVT_ID'
      Visible = False
      Calculated = True
    end
    object TblPoDetailMISC_ITEMNO: TStringField
      FieldName = 'MISC_ITEMNO'
      Visible = False
      Size = 50
    end
    object TblPoDetailNon_Material: TStringField
      DisplayLabel = 'Non Material'
      FieldKind = fkCalculated
      FieldName = 'Non_Material'
      Visible = False
      Size = 1
      Calculated = True
    end
    object TblPoDetailID: TBCDField
      Tag = 1
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object TblPoDetailPO_ID: TBCDField
      Tag = 1
      FieldName = 'PO_ID'
      Origin = 'PO_ID'
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object TblPoDetailGLACCT_ID_INV: TBCDField
      Tag = 1
      FieldName = 'GLACCT_ID_INV'
      Origin = 'GLACCT_ID_INV'
      Visible = False
      Precision = 15
      Size = 0
    end
    object TblPoDetailMISC_ITEM: TStringField
      FieldName = 'MISC_ITEM'
      Origin = 'MISC_ITEM'
      Visible = False
      Size = 100
    end
    object TblPoDetailCOST_OBJECT_ID: TBCDField
      Tag = 1
      FieldName = 'COST_OBJECT_ID'
      Origin = 'COST_OBJECT_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object TblPoDetailSTD_COST: TFMTBCDField
      FieldName = 'STD_COST'
      Origin = 'STD_COST'
      Visible = False
      Precision = 15
      Size = 6
    end
    object TblPoDetailEPLANT_ID: TBCDField
      Tag = 1
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object TblPoDetailDIVISION_ID: TBCDField
      Tag = 1
      FieldName = 'DIVISION_ID'
      Origin = 'DIVISION_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object TblPoDetailREF_CODE_ID: TBCDField
      Tag = 1
      FieldName = 'REF_CODE_ID'
      Origin = 'REF_CODE_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object TblPoDetailDROP_SHIP_ORD_DETAIL_ID: TBCDField
      Tag = 1
      FieldName = 'DROP_SHIP_ORD_DETAIL_ID'
      Origin = 'DROP_SHIP_ORD_DETAIL_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object TblPoDetailARINVT_VENDORS_ID: TBCDField
      Tag = 1
      FieldName = 'ARINVT_VENDORS_ID'
      Origin = 'ARINVT_VENDORS_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object TblPoDetailC_PO_MISC_ID: TBCDField
      Tag = 1
      FieldName = 'C_PO_MISC_ID'
      Origin = 'C_PO_MISC_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object TblPoDetailARINVT_ID: TBCDField
      Tag = 1
      FieldName = 'ARINVT_ID'
      Origin = 'ARINVT_ID'
      Visible = False
      OnChange = TblPoDetailARINVT_IDChange
      Precision = 15
      Size = 0
    end
    object TblPoDetailUOM_FACTOR: TFMTBCDField
      Tag = 1
      FieldName = 'UOM_FACTOR'
      Origin = 'UOM_FACTOR'
      Visible = False
      Precision = 16
    end
  end
  object PKShipTo: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       company,'
      '       address1,'
      '       address2,'
      '       city,'
      '       state,'
      '       zip,'
      '       country,'
      '       phone,'
      '       fax,'
      '       email,'
      '       internet,'
      '       eplant_id'
      '  from company'
      'where misc.Eplant_Filter_Include_nulls(eplant_id) = 1'
      ''
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 368
    Top = 400
    object PKShipToID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PKShipToCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 25
      FieldName = 'COMPANY'
      Size = 60
    end
    object PKShipToADDRESS1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 25
      FieldName = 'ADDRESS1'
      Size = 60
    end
    object PKShipToADDRESS2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 15
      FieldName = 'ADDRESS2'
      Size = 60
    end
    object PKShipToCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 15
      FieldName = 'CITY'
      Size = 30
    end
    object PKShipToSTATE: TStringField
      DisplayLabel = 'State'
      FieldName = 'STATE'
    end
    object PKShipToZIP: TStringField
      DisplayLabel = 'Zip'
      FieldName = 'ZIP'
      Size = 10
    end
    object PKShipToCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 15
      FieldName = 'COUNTRY'
      Size = 100
    end
    object PKShipToPHONE: TStringField
      DisplayLabel = 'Phone'
      DisplayWidth = 15
      FieldName = 'PHONE'
      Size = 25
    end
    object PKShipToFAX: TStringField
      DisplayLabel = 'Fax'
      DisplayWidth = 15
      FieldName = 'FAX'
      Size = 25
    end
    object PKShipToEMAIL: TStringField
      DisplayLabel = 'E-Mail'
      DisplayWidth = 20
      FieldName = 'EMAIL'
      Size = 250
    end
    object PKShipToINTERNET: TStringField
      DisplayLabel = 'Internet'
      DisplayWidth = 25
      FieldName = 'INTERNET'
      Size = 50
    end
    object PKShipToEPLANT_ID: TBCDField
      DisplayLabel = 'EPant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object PKPOrders: TIQWebHpick
    BeforeOpen = PKPOrdersBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select p.id as id,'
      ''
      '       case'
      
        '         when po_misc.disp_po_id_as_requisition() = 1 and upper(' +
        'nvl(p.approved_by,'#39'not approved'#39')) in ('#39'NOT APPROVED'#39', '#39'DENIED'#39')' +
        ' then null'
      '         else p.pono'
      '       end as pono,'
      ''
      '       p.vendor_id as vendor_id,'
      '       p.po_date as po_date,'
      '       v.company as company,'
      '       v.vendorno as vendorno,'
      '       d.total_qty_ord as total_ordered,'
      
        '       decode(d.arinvt_id, null, d.misc_itemno, a.itemno) as ite' +
        'mno,'
      '       a.class as class,'
      
        '       decode(d.arinvt_id, null, misc_item, a.descrip) as descri' +
        'ption,'
      '       p.approved_by as approved_by,'
      '       d.eplant_id as eplant_id,'
      '       d.division_id as division_id,'
      '       dv.name as division_name,'
      '       a.rev as rev,'
      '       a.descrip2 as descrip2,'
      '       p.buyerid as buyerid,'
      '       NVL(d.closed, '#39'N'#39') as closed,'
      '       NVL(c.qty_received, 0) as qty_received,'
      
        '       decode( d.drop_ship_ord_detail_id, null, '#39'N'#39', '#39'Y'#39') as dro' +
        'p_ship,'
      '       decode(NVL(e.id, 0), 0, p.buyerid, '
      
        '             substrB( iqstring.Concat3W( e.first_name, e.middle_' +
        'name, e.last_name), 1, 255)) as buyername,'
      '       p.userid as userid,'
      
        '       substrB( iqstring.Concat3W( e2.first_name, e2.middle_name' +
        ', e2.last_name), 1, 255) as req_by,'
      '       po_type as po_type,'
      '       d.cuser1 as cuser1,'
      '       d.cuser2 as cuser2,'
      '       d.cuser3 as cuser3,'
      
        '       substrb(IQEVAL.SUBSTRW63MAX(d.cmtline, 1, 255), 1, 255) a' +
        's cmtline'
      '  from po p,'
      '       po_detail d,'
      '       arinvt a,'
      '       v_vendor v,'
      '       c_po_receipts_total c,'
      '       division dv,'
      '       s_user_general s, '
      '       pr_emp e,'
      '       v_pr_emp e2'
      'where p.vendor_id = v.id                         '
      '  and d.po_id(+) = p.id'
      '  and a.id(+) = d.arinvt_id'
      '  and d.division_id = dv.id(+)'
      '  and d.id = c.po_detail_id(+)'
      '  and s.user_name(+) = p.buyerid'
      '  and s.pr_emp_id = e.id(+)'
      '  and p.PR_EMP_ID_RQSTNR = e2.id(+)'
      '  and iqms.misc.eplant_filter(p.eplant_id) = 1'
      '  and ( misc.eplant_filter( d.eplant_id ) = 1'
      '        or'
      '        d.id is NULL and misc.eplant_filter( p.eplant_id ) = 1 )'
      ''
      '  and (:requisition_only = 0'
      '       or'
      
        '       :requisition_only = 1 and (upper(nvl(p.approved_by,'#39'Not A' +
        'pproved'#39')) = '#39'NOT APPROVED'#39' or upper(p.approved_by) = '#39'DENIED'#39'))' +
        '        '
      ''
      '  and (:filter_by_user = 0'
      '       or'
      '       :filter_by_user = 1 and p.userid = :userid)     '
      ''
      '-- HPICK_EMPTY_DATASET_FILTER_START'
      
        '-- This is used in order to speed up FieldDefs.Update inside HPi' +
        'ckFrm '
      '-- when building TFields objects'
      '   and 1 < 0'
      '-- HPICK_EMPTY_DATASET_FILTER_END'
      '')
    OnIQModify = PKPOrdersIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    AssociatedDataSource = SrcPo
    ForceShowWaitForPrompt = False
    Left = 288
    Top = 464
    ParamData = <
      item
        Name = 'requisition_only'
        DataType = ftBCD
      end
      item
        Name = 'filter_by_user'
        DataType = ftBCD
      end
      item
        Name = 'userid'
        DataType = ftString
      end>
    object PKPOrdersPONO: TStringField
      DisplayLabel = 'PO#'
      FieldName = 'PONO'
      Origin = 'PONO'
      Size = 35
    end
    object PKPOrdersPO_DATE: TDateTimeField
      DisplayLabel = 'PO Date'
      FieldName = 'PO_DATE'
      Origin = 'PO_DATE'
    end
    object PKPOrdersCOMPANY: TStringField
      DisplayLabel = 'Vendor'
      FieldName = 'COMPANY'
      Origin = 'COMPANY'
      Size = 60
    end
    object PKPOrdersID: TBCDField
      DisplayLabel = 'Requisition #'
      FieldName = 'ID'
      Origin = 'ID'
      Size = 0
    end
    object PKPOrdersVENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Origin = 'VENDOR_ID'
      Visible = False
      Size = 0
    end
    object PKPOrdersTOTAL_ORDERED: TBCDField
      DisplayLabel = 'Blanket Qty'
      FieldName = 'TOTAL_ORDERED'
      Origin = 'TOTAL_ORDERED'
    end
    object PKPOrdersDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIPTION'
      Origin = 'DESCRIPTION'
      Size = 100
    end
    object PKPOrdersITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Origin = 'ITEMNO'
      Size = 50
    end
    object PKPOrdersCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Origin = 'CLASS'
      Size = 2
    end
    object PKPOrdersVENDORNO: TStringField
      DisplayLabel = 'Vendor#'
      FieldName = 'VENDORNO'
      Origin = 'VENDORNO'
      Size = 10
    end
    object PKPOrdersAPPROVED_BY: TStringField
      DisplayLabel = 'Approved By'
      DisplayWidth = 20
      FieldName = 'APPROVED_BY'
      Origin = 'APPROVED_BY'
      Size = 35
    end
    object PKPOrdersEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Size = 0
    end
    object PKPOrdersDIVISION_ID: TBCDField
      FieldName = 'DIVISION_ID'
      Origin = 'DIVISION_ID'
      Visible = False
      Size = 0
    end
    object PKPOrdersDIVISION_NAME: TStringField
      DisplayLabel = 'Division'
      FieldName = 'DIVISION_NAME'
      Origin = 'DIVISION_NAME'
      Size = 25
    end
    object PKPOrdersREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 5
      FieldName = 'REV'
      Origin = 'REV'
      Size = 15
    end
    object PKPOrdersDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP2'
      Origin = 'DESCRIP2'
      Size = 100
    end
    object PKPOrdersBUYERID: TStringField
      DisplayWidth = 20
      FieldName = 'BUYERID'
      Origin = 'BUYERID'
      Visible = False
      Size = 35
    end
    object PKPOrdersDROP_SHIP: TStringField
      DisplayLabel = 'Drop Ship'
      FieldName = 'DROP_SHIP'
      Origin = 'DROP_SHIP'
      Size = 1
    end
    object PKPOrdersCLOSED: TStringField
      DisplayLabel = 'Closed'
      FieldName = 'CLOSED'
      Origin = 'CLOSED'
      Size = 1
    end
    object PKPOrdersQTY_RECEIVED: TFMTBCDField
      DisplayLabel = 'Qty. Received'
      FieldName = 'QTY_RECEIVED'
      Origin = 'QTY_RECEIVED'
      Size = 38
    end
    object PKPOrdersBUYERNAME: TStringField
      DisplayLabel = 'Buyer'
      DisplayWidth = 30
      FieldName = 'BUYERNAME'
      Origin = 'BUYERNAME'
      Size = 255
    end
    object iqms: TStringField
      DisplayLabel = 'Taken By'
      FieldName = 'USERID'
      Origin = 'USERID'
      Size = 35
    end
    object PKPOrdersREQ_BY: TStringField
      DisplayLabel = 'Req. By'
      DisplayWidth = 30
      FieldName = 'REQ_BY'
      Origin = 'REQ_BY'
      Size = 255
    end
    object PKPOrdersPO_TYPE: TStringField
      DisplayLabel = 'PO Type'
      DisplayWidth = 10
      FieldName = 'PO_TYPE'
      Origin = 'PO_TYPE'
    end
    object PKPOrdersCUSER1: TStringField
      DisplayLabel = 'User Text 1'
      FieldName = 'CUSER1'
      Origin = 'CUSER1'
      Size = 255
    end
    object PKPOrdersCUSER2: TStringField
      DisplayLabel = 'User Text 2'
      FieldName = 'CUSER2'
      Origin = 'CUSER2'
      Size = 255
    end
    object PKPOrdersCUSER3: TStringField
      DisplayLabel = 'User Text 3'
      FieldName = 'CUSER3'
      Origin = 'CUSER3'
      Size = 255
    end
    object PKPOrdersCMTLINE: TStringField
      DisplayLabel = 'Note'
      FieldName = 'CMTLINE'
      Origin = 'cmtline'
      Size = 255
    end
  end
  object QryFreight: TFDQuery
    Tag = 1
    AggregatesActive = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      
        '  SELECT id AS id, descrip AS descrip, code_qualifier AS code_qu' +
        'alifier,'
      '         transport_code AS transport_code,'
      '         glacct_id_freight AS glacct_id_freight,'
      '         scac_iata_code AS scac_iata_code, pk_hide AS pk_hide,'
      '         eplant_id AS eplant_id,'
      '         comment1 AS comment1'
      '    FROM freight'
      '   WHERE misc.eplant_filter_include_nulls(eplant_id) = 1'
      'ORDER BY descrip')
    Left = 112
    Top = 168
    object QryFreightID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryFreightDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 60
    end
    object QryFreightCODE_QUALIFIER: TStringField
      DisplayLabel = 'Code Qualifier'
      FieldName = 'CODE_QUALIFIER'
      Size = 6
    end
    object QryFreightTRANSPORT_CODE: TStringField
      DisplayLabel = 'Transport Code'
      FieldName = 'TRANSPORT_CODE'
      Size = 6
    end
    object QryFreightSCAC_IATA_CODE: TStringField
      DisplayLabel = 'SCAC IATA Code'
      FieldName = 'SCAC_IATA_CODE'
      FixedChar = True
      Size = 17
    end
    object QryFreightPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Size = 1
    end
    object QryFreightEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
    object QryFreightCOMMENT1: TStringField
      DisplayLabel = 'Comment'
      FieldName = 'COMMENT1'
      Size = 50
    end
    object QryFreightGLACCT_ID_FREIGHT: TBCDField
      FieldName = 'GLACCT_ID_FREIGHT'
      Origin = 'GLACCT_ID_FREIGHT'
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object QryTerms: TFDQuery
    Tag = 1
    AggregatesActive = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      '  SELECT id,'
      '         description,'
      '         days,'
      '         discount,'
      '         discount_days'
      '    FROM terms'
      '   WHERE NVL(pk_hide, '#39'N'#39') = '#39'N'#39
      'ORDER BY description')
    Left = 208
    Top = 168
    object QryTermsDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIPTION'
      Origin = 'TERMS.DESCRIPTION'
      Size = 60
    end
    object QryTermsDAYS: TBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Days'
      FieldName = 'DAYS'
      ProviderFlags = []
      Precision = 3
      Size = 0
    end
    object QryTermsDISCOUNT: TBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Discount'
      FieldName = 'DISCOUNT'
      ProviderFlags = []
      Precision = 5
      Size = 3
    end
    object QryTermsID: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ID'
      ProviderFlags = []
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryTermsDISCOUNT_DAYS: TBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Discount Days'
      FieldName = 'DISCOUNT_DAYS'
      ProviderFlags = []
      Precision = 3
      Size = 0
    end
  end
  object QryCurrency: TFDQuery
    Tag = 1
    BeforeOpen = QryCurrencyBeforeOpen
    Filtered = True
    AggregatesActive = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT id,'
      '       curr_code,'
      '       descrip,'
      '       spot_rate,'
      '       curr_symbol,'
      '       glvalue,'
      '       native_curr'
      '  FROM currency')
    Left = 200
    Top = 96
    object QryCurrencyCURR_CODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 10
      FieldName = 'CURR_CODE'
      Origin = 'CURRENCY.CURR_CODE'
      Size = 10
    end
    object QryCurrencyDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'CURRENCY.DESCRIP'
      Size = 50
    end
    object QryCurrencyCURR_SYMBOL: TStringField
      DisplayLabel = 'Symbol'
      DisplayWidth = 10
      FieldName = 'CURR_SYMBOL'
      Origin = 'CURRENCY.CURR_SYMBOL'
      Size = 10
    end
    object QryCurrencySPOT_RATE: TFMTBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Spot Rate'
      FieldName = 'SPOT_RATE'
      ProviderFlags = []
      Precision = 12
      Size = 6
    end
    object QryCurrencyID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'CURRENCY.ID'
      Visible = False
      Size = 0
    end
    object QryCurrencyGLVALUE: TStringField
      DisplayWidth = 50
      FieldName = 'GLVALUE'
      Origin = 'CURRENCY.GLVALUE'
      Visible = False
      Size = 50
    end
    object QryCurrencyNATIVE_CURR: TStringField
      DisplayLabel = 'Native'
      FieldName = 'NATIVE_CURR'
      Origin = 'IQ.CURRENCY.NATIVE_CURR'
      Size = 3
    end
  end
  object QryBreakDownTaxes: TFDQuery
    Tag = 1
    AggregatesActive = True
    MasterSource = SrcPo
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select e.descrip,'
      '       e.tax_rate,'
      
        '       Sum( Round( NVL( d.total_qty_ord, 0) * NVL( d.unit_price,' +
        ' 0)'
      
        '            * ( decode(d.taxable, '#39'Y'#39', NVL(e.tax_rate, 0), 0)/10' +
        '0), 2 )) as tax_amount'
      '  from tax_codes t,'
      '       tax_code_link l,'
      '       tax_elements e,'
      '       PO_DETAIL d,'
      '       po p'
      ' where p.id = :ID'
      '   and d.po_id = p.id'
      '   and t.id = p.tax_code_id'
      '   and l.tax_codes_id = t.id'
      '   and l.tax_elements_id = e.id'
      'group by e.id,'
      '         e.descrip,'
      '         e.tax_rate,'
      '         l.seq'
      'order by l.seq'
      '')
    Left = 288
    Top = 96
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryBreakDownTaxesDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 60
    end
    object QryBreakDownTaxesTAX_RATE: TFMTBCDField
      DisplayLabel = 'Tax Rate'
      FieldName = 'TAX_RATE'
      Precision = 9
      Size = 6
    end
    object QryBreakDownTaxesTAX_AMOUNT: TFMTBCDField
      DisplayLabel = 'Tax Amount'
      FieldName = 'TAX_AMOUNT'
      Precision = 38
      Size = 38
    end
  end
  object wwQryPr_Emp: TFDQuery
    Tag = 1
    AggregatesActive = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      
        'select ltrim(rtrim(p.first_name) || '#39' '#39') || ltrim(rtrim(p.middle' +
        '_name) || '#39' '#39') || rtrim(p.last_name) as full_name, '
      '       p.first_name,'
      '       p.last_name,'
      '       p.empno, '
      '       p.id, '
      '       p.pk_hide'
      '  from pr_emp p, pr_paygroup g'
      ' where misc.Eplant_Filter_Include_nulls(g.eplant_id) = 1'
      '   and p.pr_paygroup_id = g.id(+)'
      ' order by '
      '       p.first_name,'
      '       p.last_name'
      '')
    Left = 32
    Top = 96
    object wwQryPr_EmpFULL_NAME: TStringField
      DisplayLabel = 'Full Name'
      DisplayWidth = 61
      FieldName = 'FULL_NAME'
      Size = 92
    end
    object wwQryPr_EmpEMPNO: TStringField
      DisplayLabel = 'Emp #'
      DisplayWidth = 15
      FieldName = 'EMPNO'
      Size = 25
    end
    object wwQryPr_EmpID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Required = True
      Visible = False
      Size = 0
    end
    object wwQryPr_EmpPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.PR_EMP.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object wwQryPr_EmpFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 20
      FieldName = 'FIRST_NAME'
      Visible = False
      Size = 30
    end
    object wwQryPr_EmpLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 20
      FieldName = 'LAST_NAME'
      Visible = False
      Size = 30
    end
  end
  object PkTooling: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select rfq.workorderno as workorderno,'
      '       rfq.project as project,'
      '       rfq.buyerid as buyerid,'
      '       arcusto.custno as custno,  '
      '       arcusto.company as company,'
      '       task.taskno as taskno,'
      '       task_master.descrip as task_descrip,       '
      '       decode(elem.arinvt_id, NULL, '#39#39', a.itemno) as itemno, '
      
        '       decode(elem.arinvt_id, NULL, elem.misc_item, a.descrip) a' +
        's item_descrip,        '
      '       elements.elem_descrip as element_description,'
      '       elem.id as tool_task_element_id'
      '  from '
      '       tool_task_element elem,'
      '       arinvt a,'
      '       elements,'
      '       tool_task task,'
      '       tool_task_list task_master,'
      '       tool_rfq rfq,'
      '       arcusto'
      ' where '
      '       rfq.id = task.tool_rfq_id'
      '   and task.tool_task_list_id = task_master.id(+)'
      '   and elem.tool_task_id = task.id'
      '   and elem.elements_id = elements.id(+)             '
      '   and elem.arinvt_id = a.id(+)                  '
      '   and rfq.arcusto_id = arcusto.id(+)'
      '   and rfq.open_wo = '#39'Y'#39
      '   and rfq.archived is NULL')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 288
    Top = 328
    object PkToolingWORKORDERNO: TStringField
      DisplayLabel = 'WO #'
      DisplayWidth = 10
      FieldName = 'WORKORDERNO'
    end
    object PkToolingPROJECT: TStringField
      DisplayLabel = 'Project'
      DisplayWidth = 15
      FieldName = 'PROJECT'
      Size = 255
    end
    object PkToolingBUYERID: TStringField
      DisplayLabel = 'Buyer ID'
      DisplayWidth = 15
      FieldName = 'BUYERID'
      Size = 35
    end
    object PkToolingCUSTNO: TStringField
      DisplayLabel = 'Cust #'
      FieldName = 'CUSTNO'
      Size = 10
    end
    object PkToolingCOMPANY: TStringField
      DisplayLabel = 'Company Name'
      DisplayWidth = 20
      FieldName = 'COMPANY'
      Size = 30
    end
    object PkToolingTASKNO: TStringField
      DisplayLabel = 'Task #'
      FieldName = 'TASKNO'
      Size = 10
    end
    object PkToolingTASK_DESCRIP: TStringField
      DisplayLabel = 'Task Description'
      DisplayWidth = 20
      FieldName = 'TASK_DESCRIP'
      Size = 50
    end
    object PkToolingITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 20
      FieldName = 'ITEMNO'
      Size = 50
    end
    object PkToolingITEM_DESCRIP: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 20
      FieldName = 'ITEM_DESCRIP'
      Size = 35
    end
    object PkToolingELEMENT_DESCRIPTION: TStringField
      DisplayLabel = 'Cost Element'
      DisplayWidth = 20
      FieldName = 'ELEMENT_DESCRIPTION'
      Size = 30
    end
    object PkToolingTOOL_TASK_ELEMENT_ID: TFloatField
      FieldName = 'TOOL_TASK_ELEMENT_ID'
      Visible = False
    end
  end
  object PkPM: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select'
      '    pmwo_dtl.id as id,'
      '    pmwo.id as work_order_no,'
      '    pmwo.wo_date as wo_date,'
      '    pmeqmt.eqno as eqno,'
      '           '
      '    pmtasks.taskno as taskno,'
      '    pmtasks.descrip as task_descrip'
      'from'
      '    pmeqmt,'
      '    pmjob,'
      '    pmtasks,'
      '    pmwo_dtl,'
      '    pmwo'
      'where'
      '    pmjob.pmeqmt_id = pmeqmt.id'
      '    and pmtasks.id = pmjob.pmtasks_id '
      '    and pmwo_dtl.pmjob_id = pmjob.id '
      '    and pmwo_dtl.pmwo_id = pmwo.id')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 32
    Top = 464
    object PkPMID: TBCDField
      FieldName = 'ID'
      Origin = 'PMWO_DTL.ID'
      Visible = False
      Size = 0
    end
    object PkPMWORK_ORDER_NO: TBCDField
      DisplayLabel = 'WO #'
      FieldName = 'WORK_ORDER_NO'
      Origin = 'PMWO.ID'
      Size = 0
    end
    object PkPMWO_DATE: TDateTimeField
      DisplayLabel = 'WO Date'
      FieldName = 'WO_DATE'
      Origin = 'PMWO.WO_DATE'
    end
    object PkPMEQNO: TStringField
      DisplayLabel = 'Equip. #'
      FieldName = 'EQNO'
      Origin = 'PMEQMT.EQNO'
      Size = 25
    end
    object PkPMTASKNO: TStringField
      DisplayLabel = 'Task #'
      FieldName = 'TASKNO'
      Origin = 'PMTASKS.TASKNO'
      Size = 50
    end
    object PkPMTASK_DESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'TASK_DESCRIP'
      Origin = 'PMTASKS.DESCRIP'
      Size = 50
    end
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
    Left = 360
    Top = 240
  end
  object PkPO_Detail: TIQWebHpick
    BeforeOpen = PkPO_DetailBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select d.id as po_detail_id,'
      '       d.seq as seq,'
      '       a.class as class,'
      
        '       decode(NVL(d.arinvt_id, 0), 0, d.misc_itemno, a.itemno) a' +
        's itemno,'
      
        '       decode(d.arinvt_id, null, d.misc_item, a.descrip) as desc' +
        'ription,'
      
        '       decode(NVL(d.arinvt_id, 0), 0, '#39#39', a.descrip2) as descrip' +
        '2,'
      '       d.total_qty_ord as total_ordered,'
      '       d.req_date as required_date,'
      '       d.promise_date as promised_date,'
      '       d.eplant_id as eplant_id'
      '  from po_detail d,'
      '       arinvt a'
      ' where d.po_id = :PO_ID'
      '  and a.id(+) = d.arinvt_id'
      ''
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 120
    Top = 464
    ParamData = <
      item
        Name = 'Po_id'
        DataType = ftBCD
      end>
    object PkPO_DetailPO_DETAIL_ID: TBCDField
      DisplayWidth = 18
      FieldName = 'PO_DETAIL_ID'
      Origin = 'd.id'
      Visible = False
      Size = 0
    end
    object PkPO_DetailSEQ: TBCDField
      DisplayLabel = 'Line #'
      DisplayWidth = 10
      FieldName = 'SEQ'
      Origin = 'd.seq'
      Size = 0
    end
    object PkPO_DetailCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 10
      FieldName = 'CLASS'
      Origin = 'a.class'
      Size = 2
    end
    object PkPO_DetailITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 12
      FieldName = 'ITEMNO'
      Origin = '4'
      Size = 50
    end
    object PkPO_DetailDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 18
      FieldName = 'DESCRIPTION'
      Origin = '5'
      Size = 100
    end
    object PkPO_DetailDESCRIP2: TStringField
      DisplayLabel = 'Ext. Description'
      DisplayWidth = 18
      FieldName = 'DESCRIP2'
      Origin = '6'
      Size = 100
    end
    object PkPO_DetailTOTAL_ORDERED: TBCDField
      DisplayLabel = 'Qty Ordered'
      DisplayWidth = 18
      FieldName = 'TOTAL_ORDERED'
      Origin = 'd.total_qty_ord'
    end
    object PkPO_DetailREQUIRED_DATE: TDateTimeField
      DisplayLabel = 'Required Date'
      DisplayWidth = 18
      FieldName = 'REQUIRED_DATE'
      Origin = 'd.req_date'
    end
    object PkPO_DetailPROMISED_DATE: TDateTimeField
      DisplayLabel = 'Promised Date'
      DisplayWidth = 18
      FieldName = 'PROMISED_DATE'
      Origin = 'd.promise_date'
    end
    object PkPO_DetailEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 18
      FieldName = 'EPLANT_ID'
      Origin = 'd.eplant_id'
      Size = 0
    end
  end
  object wwQryDivision: TFDQuery
    Tag = 1
    AggregatesActive = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, name from division')
    Left = 360
    Top = 96
    object wwQryDivisionNAME: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 25
      FieldName = 'NAME'
      Origin = 'DIVISION.NAME'
      Size = 25
    end
    object wwQryDivisionID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'DIVISION.ID'
      Visible = False
      Size = 0
    end
  end
  object wwQryRemit: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'Select id,'
      '       vendor_id,'
      '       attn,'
      '       addr1,'
      '       addr2,'
      '       city,'
      '       state,'
      '       zip,'
      '       country  '
      '  from remit_to       '
      '  order by attn'
      ' '
      ' ')
    Left = 208
    Top = 240
    object wwQryRemitATTN: TStringField
      DisplayLabel = 'Attn'
      DisplayWidth = 25
      FieldName = 'ATTN'
      Size = 60
    end
    object wwQryRemitADDR1: TStringField
      DisplayLabel = 'Address1'
      DisplayWidth = 20
      FieldName = 'ADDR1'
      Size = 60
    end
    object wwQryRemitCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 15
      FieldName = 'CITY'
      Size = 30
    end
    object wwQryRemitSTATE: TStringField
      DisplayLabel = 'State'
      DisplayWidth = 2
      FieldName = 'STATE'
    end
    object wwQryRemitZIP: TStringField
      DisplayWidth = 10
      FieldName = 'ZIP'
      Size = 10
    end
    object wwQryRemitCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 15
      FieldName = 'COUNTRY'
      Origin = 'IQ.REMIT_TO.COUNTRY'
      FixedChar = True
      Size = 100
    end
    object wwQryRemitID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object wwQryRemitVENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Visible = False
      Size = 0
    end
    object wwQryRemitADDR2: TStringField
      FieldName = 'ADDR2'
      Origin = 'REMIT_TO.ADDR2'
      Visible = False
      Size = 60
    end
  end
  object wwQryShip: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       company,'
      '       address1,'
      '       address2,'
      '       city,'
      '       state,'
      '       zip,'
      '       country'
      '  from company     '
      'where misc.eplant_filter_include_nulls(eplant_id) = 1'
      ' order by company')
    Left = 360
    Top = 160
    object wwQryShipCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 25
      FieldName = 'COMPANY'
      Size = 60
    end
    object wwQryShipADDRESS1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 20
      FieldName = 'ADDRESS1'
      Size = 60
    end
    object wwQryShipCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 15
      FieldName = 'CITY'
      Size = 30
    end
    object wwQryShipSTATE: TStringField
      DisplayLabel = 'State'
      DisplayWidth = 2
      FieldName = 'STATE'
    end
    object wwQryShipZIP: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 10
      FieldName = 'ZIP'
      Size = 10
    end
    object wwQryShipCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 15
      FieldName = 'COUNTRY'
      Origin = 'IQ.COMPANY.COUNTRY'
      Size = 100
    end
    object wwQryShipID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object wwQryShipADDRESS2: TStringField
      FieldName = 'ADDRESS2'
      Origin = 'COMPANY.ADDRESS2'
      Visible = False
      Size = 60
    end
  end
  object wwQryTaxCodes: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       tax_code,'
      '       tax_code_desc,'
      '       tot_tax_rate'
      '  from tax_codes   '
      ' order by tax_code_desc'
      ' ')
    Left = 112
    Top = 240
    object wwQryTaxCodesTAX_CODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 20
      FieldName = 'TAX_CODE'
      Origin = 'TAX_CODES.TAX_CODE'
    end
    object wwQryTaxCodesTAX_CODE_DESC: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 50
      FieldName = 'TAX_CODE_DESC'
      Origin = 'TAX_CODES.TAX_CODE_DESC'
      Size = 50
    end
    object wwQryTaxCodesID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'TAX_CODES.ID'
      Visible = False
      Size = 0
    end
    object wwQryTaxCodesTOT_TAX_RATE: TFMTBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Rate'
      FieldName = 'TOT_TAX_RATE'
      ProviderFlags = []
      Precision = 9
      Size = 6
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
      ' order by descrip')
    Left = 32
    Top = 240
    object QryFobDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 60
      FieldName = 'DESCRIP'
      Origin = 'FOB.DESCRIP'
      Size = 60
    end
  end
  object wwSrcPOReleases: TDataSource
    DataSet = QryPOReleases
    Left = 208
    Top = 24
  end
  object QryPOReleases: TFDQuery
    BeforeInsert = QryPOReleasesBeforeInsert
    AfterInsert = QryPOReleasesAfterInsert
    BeforeEdit = QryPOReleasesBeforeEdit
    BeforePost = QryPOReleasesBeforePost
    AfterPost = QryPOReleasesAfterPost
    BeforeDelete = QryPOReleasesBeforeDelete
    AfterDelete = QryPOReleasesAfterDelete
    OnCalcFields = QryPOReleasesCalcFields
    OnNewRecord = QryPOReleasesNewRecord
    IndexesActive = False
    IndexFieldNames = 'ID'
    MasterSource = SrcPoDetail
    MasterFields = 'ID'
    DetailFields = 'PO_DETAIL_ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.RefreshMode = rmManual
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    UpdateOptions.UpdateTableName = 'PO_RELEASES'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select id,'
      '       po_detail_id,'
      '       request_date,'
      '       seq,'
      '       promise_date,'
      '       quan,'
      '       forecast,'
      '       date_received,'
      '       cuser1,'
      '       unit_price,'
      '       user_date,'
      '       user_date2,'
      '       user_date3,'
      '       orig_quan,'
      '       ack,'
      '       BUDGET_STATE'
      '  from '
      '       po_releases'
      ' where '
      '       po_detail_id = :ID'
      '    -- do not remove this line'
      '    '
      ' order by           '
      '       po_detail_id,'
      '       promise_date,'
      '       id'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 216
    Top = 32
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 53350000c
      end>
    object QryPOReleasesSEQ: TBCDField
      DisplayLabel = '#'
      DisplayWidth = 2
      FieldName = 'SEQ'
      Origin = 'SEQ'
      Precision = 4
      Size = 0
    end
    object QryPOReleasesQUAN: TBCDField
      DisplayLabel = 'Qty'
      DisplayWidth = 8
      FieldName = 'QUAN'
      Origin = 'QUAN'
      Required = True
      Precision = 14
    end
    object QryPOReleasesREQUEST_DATE: TDateTimeField
      DisplayLabel = 'Request Date'
      DisplayWidth = 12
      FieldName = 'REQUEST_DATE'
      Origin = 'PO_RELEASES.REQUEST_DATE'
      OnChange = QryPOReleasesREQUEST_DATEChange
    end
    object QryPOReleasesPROMISE_DATE: TDateTimeField
      DisplayLabel = 'Promise Date'
      DisplayWidth = 12
      FieldName = 'PROMISE_DATE'
      Origin = 'PROMISE_DATE'
    end
    object QryPOReleasesFORECAST: TStringField
      DisplayLabel = 'Forecast'
      DisplayWidth = 6
      FieldName = 'FORECAST'
      Origin = 'FORECAST'
      FixedChar = True
      Size = 1
    end
    object QryPOReleasesLeft_To_Recv: TFloatField
      DisplayLabel = 'Left To Recv'
      DisplayWidth = 11
      FieldKind = fkCalculated
      FieldName = 'Left_To_Recv'
      Calculated = True
    end
    object QryPOReleasesCUSER1: TStringField
      DisplayLabel = 'Comment'
      DisplayWidth = 16
      FieldName = 'CUSER1'
      Origin = 'CUSER1'
      Size = 255
    end
    object QryPOReleasesORIG_QUAN: TBCDField
      DisplayLabel = 'Original Qty'
      DisplayWidth = 10
      FieldName = 'ORIG_QUAN'
      Origin = 'ORIG_QUAN'
      Precision = 14
    end
    object QryPOReleasesACK: TStringField
      DisplayLabel = 'Acknowledged'
      DisplayWidth = 1
      FieldName = 'ACK'
      Origin = 'ACK'
      FixedChar = True
      Size = 1
    end
    object QryPOReleasesUSER_DATE: TDateTimeField
      DisplayLabel = 'User Date'
      DisplayWidth = 18
      FieldName = 'USER_DATE'
      Origin = 'USER_DATE'
    end
    object QryPOReleasesUSER_DATE2: TDateTimeField
      DisplayLabel = 'User Date2'
      DisplayWidth = 18
      FieldName = 'USER_DATE2'
      Origin = 'USER_DATE2'
    end
    object QryPOReleasesUSER_DATE3: TDateTimeField
      DisplayLabel = 'User Date3'
      DisplayWidth = 18
      FieldName = 'USER_DATE3'
      Origin = 'USER_DATE3'
    end
    object QryPOReleasesID: TBCDField
      Tag = 1
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryPOReleasesPO_DETAIL_ID: TBCDField
      Tag = 1
      FieldName = 'PO_DETAIL_ID'
      Origin = 'PO_DETAIL_ID'
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryPOReleasesDATE_RECEIVED: TDateTimeField
      FieldName = 'DATE_RECEIVED'
      Origin = 'DATE_RECEIVED'
      Visible = False
    end
    object QryPOReleasesUNIT_PRICE: TFMTBCDField
      FieldName = 'UNIT_PRICE'
      Origin = 'UNIT_PRICE'
      Visible = False
      Precision = 15
      Size = 6
    end
    object QryPOReleasesBUDGET_STATE: TStringField
      FieldName = 'BUDGET_STATE'
      Origin = 'BUDGET_STATE'
      Visible = False
      Size = 1
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'INSERT INTO PO_RELEASES'
      '(ID, PO_DETAIL_ID, REQUEST_DATE, SEQ, PROMISE_DATE, '
      '  QUAN, FORECAST, DATE_RECEIVED, CUSER1, '
      '  UNIT_PRICE, USER_DATE, ORIG_QUAN, ACK, '
      '  USER_DATE2, USER_DATE3, BUDGET_STATE)'
      
        'VALUES (:NEW_ID, :NEW_PO_DETAIL_ID, :NEW_REQUEST_DATE, :NEW_SEQ,' +
        ' :NEW_PROMISE_DATE, '
      '  :NEW_QUAN, :NEW_FORECAST, :NEW_DATE_RECEIVED, :NEW_CUSER1, '
      '  :NEW_UNIT_PRICE, :NEW_USER_DATE, :NEW_ORIG_QUAN, :NEW_ACK, '
      '  :NEW_USER_DATE2, :NEW_USER_DATE3, :NEW_BUDGET_STATE)')
    ModifySQL.Strings = (
      'UPDATE PO_RELEASES'
      
        'SET PO_DETAIL_ID = :NEW_PO_DETAIL_ID, REQUEST_DATE = :NEW_REQUES' +
        'T_DATE, '
      
        '  SEQ = :NEW_SEQ, PROMISE_DATE = :NEW_PROMISE_DATE, QUAN = :NEW_' +
        'QUAN, '
      '  FORECAST = :NEW_FORECAST, DATE_RECEIVED = :NEW_DATE_RECEIVED, '
      
        '  CUSER1 = :NEW_CUSER1, UNIT_PRICE = :NEW_UNIT_PRICE, USER_DATE ' +
        '= :NEW_USER_DATE, '
      
        '  ORIG_QUAN = :NEW_ORIG_QUAN, ACK = :NEW_ACK, USER_DATE2 = :NEW_' +
        'USER_DATE2, '
      '  USER_DATE3 = :NEW_USER_DATE3, BUDGET_STATE = :NEW_BUDGET_STATE'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM PO_RELEASES'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, PO_DETAIL_ID, REQUEST_DATE, SEQ, PROMISE_DATE, QUAN, ' +
        'FORECAST, '
      '  DATE_RECEIVED, CUSER1, UNIT_PRICE, USER_DATE, ORIG_QUAN, '
      
        '  QUAN_RECV, RECEIVED_CRW, DIVISION_ID, ACK, ESERVER_XCPT_MAT_RE' +
        'Q_ID, '
      '  DROP_SHIP_RELEASES_ID, USER_DATE2, USER_DATE3, BUDGET_STATE'
      'FROM PO_RELEASES'
      'WHERE ID = :ID')
    Left = 232
    Top = 40
  end
  object ViewPoTotal: TFDQuery
    Tag = 1
    AggregatesActive = True
    MasterSource = SrcPo
    MasterFields = 'ID'
    DetailFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       total,'
      '       tax,'
      '       total_after_tax'
      '  from v_po_total'
      ' where id = NVL(:id,0)'
      '  '
      ''
      ' ')
    Left = 32
    Top = 168
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object ViewPoTotalID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object ViewPoTotalTOTAL: TFMTBCDField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      currency = True
      Precision = 38
      Size = 38
    end
    object ViewPoTotalTAX: TFMTBCDField
      DisplayLabel = 'Tax'
      FieldName = 'TAX'
      Origin = 'TAX'
      currency = True
      Precision = 38
      Size = 38
    end
    object ViewPoTotalTOTAL_AFTER_TAX: TFMTBCDField
      DisplayLabel = 'Grand Total'
      FieldName = 'TOTAL_AFTER_TAX'
      Origin = 'TOTAL_AFTER_TAX'
      currency = True
      Precision = 38
      Size = 38
    end
  end
  object QryRefCode: TFDQuery
    Tag = 1
    AggregatesActive = True
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
      '  order by ref_code_descrip')
    Left = 288
    Top = 160
    object QryRefCodeCATEGORY_ID: TBCDField
      FieldName = 'CATEGORY_ID'
      Origin = 'IQ.V_REF_CODE.CATEGORY_ID'
      Visible = False
      Size = 0
    end
    object QryRefCodeCATEGORY_DESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'CATEGORY_DESCRIP'
      Origin = 'IQ.V_REF_CODE.CATEGORY_DESCRIP'
      Size = 30
    end
    object QryRefCodeREF_CODE_ID: TBCDField
      FieldName = 'REF_CODE_ID'
      Origin = 'IQ.V_REF_CODE.REF_CODE_ID'
      Visible = False
      Size = 0
    end
    object QryRefCodeREF_CODE_DESCRIP: TStringField
      DisplayLabel = 'Ref. Code Description'
      FieldName = 'REF_CODE_DESCRIP'
      Origin = 'IQ.V_REF_CODE.REF_CODE_DESCRIP'
      Size = 60
    end
    object QryRefCodeREF_CODE: TStringField
      DisplayLabel = 'Reference Code'
      FieldName = 'REF_CODE'
      Origin = 'IQ.V_REF_CODE.REF_CODE'
      Size = 10
    end
  end
  object PkBuyer: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select '
      '       NVL(e.first_name, s.user_name ) as first_name,'
      '       e.middle_name as middle_name,'
      '       e.last_name as last_name,'
      '       e.empno as empno, '
      '       s.user_name as user_name,'
      '       NVL(s.email, e.email) as email'
      '  from s_user_general s, pr_emp e'
      ' where '
      '       s.pr_emp_id = e.id(+)'
      '   and po_buyer = '#39'Y'#39
      ' '
      ' '
      ' '
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 464
    Top = 464
    object PkBuyerFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      FieldName = 'FIRST_NAME'
      Size = 35
    end
    object PkBuyerMIDDLE_NAME: TStringField
      DisplayLabel = 'Middle Name'
      FieldName = 'MIDDLE_NAME'
      Size = 30
    end
    object PkBuyerLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 30
      FieldName = 'LAST_NAME'
      Size = 30
    end
    object PkBuyerEMPNO: TStringField
      DisplayLabel = 'Emp #'
      FieldName = 'EMPNO'
      Size = 25
    end
    object PkBuyerEMAIL: TStringField
      DisplayLabel = 'EMail'
      FieldName = 'EMAIL'
      Size = 250
    end
    object PkBuyerUSER_NAME: TStringField
      DisplayLabel = 'User Name'
      FieldName = 'USER_NAME'
      Size = 35
    end
  end
  object QryVendorContact: TFDQuery
    Tag = 1
    BeforeOpen = QryVendorContactBeforeOpen
    AggregatesActive = True
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select'
      '   id,'
      '   vendor_id,'
      '   first_name,'
      '   last_name,'
      
        '   ltrim(trim(first_name) || '#39' '#39' || trim(last_name )) as display' +
        '_name,'
      '   eplant_id'
      'from vendor_contact'
      'where vendor_id = :vendor_id')
    Left = 120
    Top = 96
    ParamData = <
      item
        Name = 'VENDOR_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryVendorContactDISPLAY_NAME: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 61
      FieldName = 'DISPLAY_NAME'
      Size = 61
    end
    object QryVendorContactID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.VENDOR_CONTACT.ID'
      Visible = False
      Size = 0
    end
    object QryVendorContactVENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Origin = 'IQ.VENDOR_CONTACT.VENDOR_ID'
      Visible = False
      Size = 0
    end
    object QryVendorContactFIRST_NAME: TStringField
      FieldName = 'FIRST_NAME'
      Origin = 'IQ.VENDOR_CONTACT.FIRST_NAME'
      Visible = False
      FixedChar = True
      Size = 30
    end
    object QryVendorContactLAST_NAME: TStringField
      FieldName = 'LAST_NAME'
      Origin = 'IQ.VENDOR_CONTACT.LAST_NAME'
      Visible = False
      FixedChar = True
      Size = 30
    end
    object QryVendorContactEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object PkRequisition: TIQWebHpick
    BeforeOpen = PKPOrdersBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select p.id as id,'
      '       p.pono as pono,'
      '       p.vendor_id as vendor_id,'
      '       p.po_date as po_date,'
      '       v.company as company,'
      '       v.vendorno as vendorno,'
      '       d.total_qty_ord as total_ordered,'
      
        '       decode(d.arinvt_id, null, d.misc_itemno, a.itemno) as ite' +
        'mno,'
      '       a.class as class,'
      
        '       decode(d.arinvt_id, null, misc_item, a.descrip) as descri' +
        'ption,'
      '       p.approved_by as approved_by,'
      '       d.eplant_id as eplant_id,'
      '       d.division_id as division_id,'
      '       dv.name as division_name,'
      '       a.rev as rev,'
      '       a.descrip2 as descrip2,'
      '       p.buyerid as buyerid,'
      '       NVL(d.closed, '#39'N'#39') as closed,'
      '       NVL(c.qty_received, 0) as qty_received,'
      
        '       decode( d.drop_ship_ord_detail_id, null, '#39'N'#39', '#39'Y'#39') as dro' +
        'p_ship,'
      '       decode(NVL(e.id, 0), 0, p.buyerid, '
      
        '             substrB( iqstring.Concat3W( e.first_name, e.middle_' +
        'name, e.last_name), 1, 255)) as buyername,'
      '       p.userid as userid,'
      
        '       substrB( iqstring.Concat3W( e2.first_name, e2.middle_name' +
        ', e2.last_name), 1, 255) as req_by,'
      '       po_type as po_type,'
      '       d.cuser1 as cuser1,'
      '       d.cuser2 as cuser2,'
      '       d.cuser3 as cuser3,'
      
        '       substrb(IQEVAL.SUBSTRW63MAX(d.cmtline, 1, 255), 1, 255) a' +
        's cmtline'
      '  from po p,'
      '       po_detail d,'
      '       arinvt a,'
      '       v_vendor v,'
      '       c_po_receipts_total c,'
      '       division dv,'
      '       s_user_general s, '
      '       pr_emp e,'
      '       v_pr_emp e2'
      'where p.vendor_id = v.id'
      '  and d.po_id(+) = p.id'
      '  and a.id(+) = d.arinvt_id'
      '  and d.division_id = dv.id(+)'
      '  and d.id = c.po_detail_id(+)'
      '  and s.user_name(+) = p.buyerid'
      '  and s.pr_emp_id = e.id(+)'
      '  and p.PR_EMP_ID_RQSTNR = e2.id(+)'
      '                '
      ''
      '  and ( misc.eplant_filter( d.eplant_id ) = 1'
      '        or'
      '        d.id is NULL and misc.eplant_filter( p.eplant_id ) = 1 )'
      ''
      '  and (:requisition_only = 0'
      '       or'
      
        '       :requisition_only = 1 and (upper(nvl(p.approved_by,'#39'Not A' +
        'pproved'#39')) = '#39'NOT APPROVED'#39' or upper(p.approved_by) = '#39'DENIED'#39'))' +
        '        '
      ''
      'and (:filter_by_user = 0'
      '       or'
      '       :filter_by_user = 1 and p.userid = :userid)     '
      ''
      '-- HPICK_EMPTY_DATASET_FILTER_START'
      
        '-- This is used in order to speed up FieldDefs.Update inside HPi' +
        'ckFrm '
      '-- when building TFields objects'
      '   and 1 < 0'
      '-- HPICK_EMPTY_DATASET_FILTER_END'
      '')
    OnIQModify = PKPOrdersIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    AssociatedDataSource = SrcPo
    ForceShowWaitForPrompt = False
    Left = 368
    Top = 464
    ParamData = <
      item
        Name = 'requisition_only'
        DataType = ftBCD
      end
      item
        Name = 'filter_by_user'
        DataType = ftBCD
      end
      item
        Name = 'userid'
        DataType = ftString
      end>
    object StringField1: TStringField
      DisplayLabel = 'PO#'
      FieldName = 'PONO'
      Origin = 'PONO'
      Size = 35
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'PO Date'
      FieldName = 'PO_DATE'
      Origin = 'PO_DATE'
    end
    object StringField2: TStringField
      DisplayLabel = 'Vendor'
      FieldName = 'COMPANY'
      Origin = 'COMPANY'
      Size = 60
    end
    object FloatField1: TBCDField
      DisplayLabel = 'Requisition #'
      FieldName = 'ID'
      Origin = 'ID'
      Visible = False
      Size = 0
    end
    object FloatField2: TBCDField
      FieldName = 'VENDOR_ID'
      Origin = 'VENDOR_ID'
      Visible = False
      Size = 0
    end
    object FloatField3: TBCDField
      DisplayLabel = 'Blanket Qty'
      FieldName = 'TOTAL_ORDERED'
      Origin = 'TOTAL_ORDERED'
    end
    object StringField3: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIPTION'
      Origin = 'DESCRIPTION'
      Size = 100
    end
    object StringField4: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Origin = 'ITEMNO'
      Size = 50
    end
    object StringField5: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Origin = 'CLASS'
      Size = 2
    end
    object StringField7: TStringField
      DisplayLabel = 'Vendor#'
      FieldName = 'VENDORNO'
      Origin = 'VENDORNO'
      Size = 10
    end
    object StringField8: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 20
      FieldName = 'APPROVED_BY'
      Origin = 'APPROVED_BY'
      Size = 35
    end
    object FloatField4: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Size = 0
    end
    object FloatField5: TBCDField
      FieldName = 'DIVISION_ID'
      Origin = 'DIVISION_ID'
      Visible = False
      Size = 0
    end
    object StringField9: TStringField
      DisplayLabel = 'Division'
      FieldName = 'DIVISION_NAME'
      Origin = 'DIVISION_NAME'
      Size = 25
    end
    object StringField10: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 5
      FieldName = 'REV'
      Origin = 'REV'
      Size = 15
    end
    object StringField11: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP2'
      Origin = 'DESCRIP2'
      Size = 100
    end
    object StringField12: TStringField
      DisplayWidth = 20
      FieldName = 'BUYERID'
      Origin = 'BUYERID'
      Visible = False
      Size = 35
    end
    object StringField13: TStringField
      DisplayLabel = 'Drop Ship'
      FieldName = 'DROP_SHIP'
      Origin = 'DROP_SHIP'
      Size = 1
    end
    object PkRequisitionCLOSED: TStringField
      DisplayLabel = 'Closed'
      FieldName = 'CLOSED'
      Origin = 'CLOSED'
      Size = 1
    end
    object PkRequisitionQTY_RECEIVED: TFMTBCDField
      DisplayLabel = 'Qty. Received'
      FieldName = 'QTY_RECEIVED'
      Origin = 'QTY_RECEIVED'
      Size = 38
    end
    object PkRequisitionBUYERNAME: TStringField
      DisplayLabel = 'Buyer'
      DisplayWidth = 30
      FieldName = 'BUYERNAME'
      Origin = 'BUYERNAME'
      Size = 255
    end
    object PkRequisitionUSERID: TStringField
      DisplayLabel = 'Taken By'
      FieldName = 'USERID'
      Origin = 'USERID'
      Size = 35
    end
    object PkRequisitionREQ_BY: TStringField
      DisplayLabel = 'Req. By'
      DisplayWidth = 30
      FieldName = 'REQ_BY'
      Origin = 'REQ_BY'
      Size = 255
    end
    object PkRequisitionPO_TYPE: TStringField
      DisplayLabel = 'PO Type'
      DisplayWidth = 10
      FieldName = 'PO_TYPE'
      Origin = 'PO_TYPE'
    end
    object PkRequisitionCUSER1: TStringField
      DisplayLabel = 'User Text 1'
      FieldName = 'CUSER1'
      Origin = 'CUSER1'
      Size = 255
    end
    object PkRequisitionCUSER2: TStringField
      DisplayLabel = 'User Text 2'
      FieldName = 'CUSER2'
      Origin = 'CUSER2'
      Size = 255
    end
    object PkRequisitionCUSER3: TStringField
      DisplayLabel = 'User Text 3'
      FieldName = 'CUSER3'
      Origin = 'CUSER3'
      Size = 255
    end
    object PkRequisitionCMTLINE: TStringField
      DisplayLabel = 'Note'
      FieldName = 'CMTLINE'
      Origin = 'cmtline'
      Size = 255
    end
  end
  object PkAcct: TIQWebHpick
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '          acct,'
      '          descrip,'
      '          type,'
      '          eplant_id'
      '  from V_GLACCT_GLSUB_ACCT_TYPE'
      'where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      '  and NVL(AP_HIDE, '#39'N'#39') = '#39'N'#39
      'and misc.eplant_filter(eplant_id) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 368
    Top = 328
    object PkAcctID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkAcctACCT: TStringField
      DisplayLabel = 'Acct#'
      FieldName = 'ACCT'
      Size = 50
    end
    object PkAcctDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object PkAcctTYPE: TStringField
      DisplayLabel = 'Acct. Type'
      FieldName = 'TYPE'
      Origin = 'V_GLACCT_GLSUB_ACCT_TYPE.TYPE'
      Size = 35
    end
    object PkAcctEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'V_GLACCT_GLSUB_ACCT_TYPE.EPLANT_ID'
      Size = 0
    end
  end
  object QryPOType: TFDQuery
    BeforeOpen = QryPOTypeBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select b.name, b.descrip '
      '  from s_user_po_type a,'
      '       po_type b'
      ' where a.user_name = :user_name'
      '   and a.po_type_id = b.id'
      'order by b.name'
      '       ')
    Left = 288
    Top = 240
    ParamData = <
      item
        Name = 'user_name'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryPOTypeNAME: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 20
      FieldName = 'NAME'
      Origin = 'IQ.PO_TYPE.NAME'
    end
    object QryPOTypeDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'IQ.PO_TYPE.DESCRIP'
      Size = 60
    end
  end
  object PkContact: TIQWebHpick
    BeforeOpen = PkContactBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT id,'
      '       last_name,'
      '       first_name,'
      '       title,'
      '       phone_number,'
      '       ext,'
      '       fax_number,'
      '       email,'
      '       pager,'
      '       contact_type,'
      '       eplant_id'
      '  FROM vendor_contact'
      ' WHERE vendor_id = :ID AND'
      '       misc.eplant_filter_include_nulls(eplant_id) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 448
    Top = 400
    ParamData = <
      item
        Name = 'id'
        DataType = ftBCD
      end>
    object PkContactID: TBCDField
      FieldName = 'ID'
      Origin = 'CONTACT.ID'
      Visible = False
      Size = 0
    end
    object PkContactFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      FieldName = 'FIRST_NAME'
      Origin = 'CONTACT.FIRST_NAME'
      Size = 30
    end
    object PkContactLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      FieldName = 'LAST_NAME'
      Origin = 'CONTACT.LAST_NAME'
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
      DisplayLabel = 'Telephone Ext'
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
      DisplayLabel = 'E-Mail'
      FieldName = 'EMAIL'
      Origin = 'CONTACT.EMAIL'
      Size = 250
    end
    object PkContactPAGER: TStringField
      DisplayLabel = 'Pager'
      FieldName = 'PAGER'
      Origin = 'CONTACT.PAGER'
      Size = 25
    end
    object PkContactCONTACT_TYPE: TStringField
      DisplayLabel = 'Contact Type'
      FieldName = 'CONTACT_TYPE'
      Origin = 'CONTACT.CONTACT_TYPE'
      Size = 5
    end
    object PkContactEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
  end
  object PkArcusto: TIQWebHpick
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       custno,'
      '       cust_group,'
      '       company,'
      '       addr1,'
      '       addr2,'
      '       addr3,'
      '       city,'
      '       state,'
      '       country,'
      '       zip,'
      '       phone_number,'
      '       pk_hide'
      '  from v_arcusto')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 464
    Top = 328
    object PkArcustoID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.V_ARCUSTO.ID'
      Visible = False
      Size = 0
    end
    object PkArcustoCUSTNO: TStringField
      DisplayLabel = 'Cust#'
      FieldName = 'CUSTNO'
      Origin = 'IQ.V_ARCUSTO.CUSTNO'
      FixedChar = True
      Size = 10
    end
    object PkArcustoCUST_GROUP: TStringField
      FieldName = 'CUST_GROUP'
      Origin = 'IQ.V_ARCUSTO.CUST_GROUP'
      Visible = False
      FixedChar = True
      Size = 30
    end
    object PkArcustoCOMPANY: TStringField
      DisplayLabel = 'Customer Name'
      FieldName = 'COMPANY'
      Origin = 'IQ.V_ARCUSTO.COMPANY'
      Size = 60
    end
    object PkArcustoADDR1: TStringField
      DisplayLabel = 'Address 1'
      FieldName = 'ADDR1'
      Origin = 'IQ.V_ARCUSTO.ADDR1'
      Size = 60
    end
    object PkArcustoADDR2: TStringField
      DisplayLabel = 'Address 2'
      FieldName = 'ADDR2'
      Origin = 'IQ.V_ARCUSTO.ADDR2'
      Size = 60
    end
    object PkArcustoADDR3: TStringField
      DisplayLabel = 'Address 3'
      FieldName = 'ADDR3'
      Origin = 'IQ.V_ARCUSTO.ADDR3'
      Size = 60
    end
    object PkArcustoCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Origin = 'IQ.V_ARCUSTO.CITY'
      FixedChar = True
      Size = 30
    end
    object PkArcustoSTATE: TStringField
      DisplayLabel = 'State or Region'
      FieldName = 'STATE'
      Origin = 'IQ.V_ARCUSTO.STATE'
    end
    object PkArcustoCOUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      Origin = 'IQ.V_ARCUSTO.COUNTRY'
      FixedChar = True
      Size = 100
    end
    object PkArcustoZIP: TStringField
      DisplayLabel = 'Postal Code'
      FieldName = 'ZIP'
      Origin = 'IQ.V_ARCUSTO.ZIP'
      FixedChar = True
      Size = 10
    end
    object PkArcustoPHONE_NUMBER: TStringField
      FieldName = 'PHONE_NUMBER'
      Origin = 'IQ.V_ARCUSTO.PHONE_NUMBER'
      Visible = False
      Size = 25
    end
    object PkArcustoPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.V_ARCUSTO.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object PKFreight: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        '  SELECT id as id, descrip AS descrip, code_qualifier AS code_qu' +
        'alifier,'
      '         transport_code AS transport_code,'
      '         glacct_id_freight AS glacct_id_freight,'
      '         scac_iata_code AS scac_iata_code, pk_hide AS pk_hide,'
      '         eplant_id AS eplant_id,'
      '         comment1 AS comment1'
      '    FROM freight'
      '   WHERE misc.eplant_filter_include_nulls(eplant_id) = 1'
      'ORDER BY descrip')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 200
    Top = 328
    object PKFreightID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PKFreightDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 60
    end
    object PKFreightCODE_QUALIFIER: TStringField
      DisplayLabel = 'Code Qualifier'
      FieldName = 'CODE_QUALIFIER'
      Size = 6
    end
    object PKFreightTRANSPORT_CODE: TStringField
      DisplayLabel = 'Transportation Method Code'
      FieldName = 'TRANSPORT_CODE'
      Size = 6
    end
    object PKFreightGLACCT_ID_FREIGHT: TBCDField
      DisplayLabel = 'GL Freight Acct ID'
      FieldName = 'GLACCT_ID_FREIGHT'
      Size = 0
    end
    object PKFreightSCAC_IATA_CODE: TStringField
      DisplayLabel = 'SCAC IATA'
      FieldName = 'SCAC_IATA_CODE'
      FixedChar = True
      Size = 17
    end
    object PKFreightPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      Size = 1
    end
    object PKFreightEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object PKFreightCOMMENT1: TStringField
      DisplayLabel = 'Comment'
      FieldName = 'COMMENT1'
      Size = 50
    end
  end
  object PkAkaOEM: TIQWebHpick
    BeforeOpen = PkAkaOEMBeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select v.id as id,'
      '       v.vend_itemno  as vend_itemno,'
      '       v.vend_descrip as vend_descrip,'
      '       v.vend_descrip2 as vend_descrip2,'
      '       v.vend_rev as vend_rev,       '
      '       a.itemno as itemno,'
      '       a.descrip as descrip,'
      '       a.descrip2 as descrip2,'
      '       a.class as class,'
      '       a.rev as rev,'
      '       a.eplant_id   as eplant_id,'
      '       v.arinvt_id as arinvt_id,'
      '       ven.vendorno as vendorno,'
      '       ven.company as company'
      '  from arinvt_vendors v,'
      '       arinvt a,'
      '       vendor ven'
      ' where a.id = v.arinvt_id'
      '   and v.vendor_id in (select v.oem_vendor_id'
      '                         from po p,'
      '                              vendor_oem_dist v'
      '                         where p.id = :PO_ID'
      '                           and p.vendor_id = v.dist_vendor_id)'
      '   and v.vendor_id = ven.id'
      '   and NVL(a.PK_HIDE, '#39'N'#39') = '#39'N'#39
      '   and misc.eplant_filter(a.eplant_id) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 200
    Top = 464
    ParamData = <
      item
        Name = 'PO_ID'
        DataType = ftBCD
      end>
    object PkAkaOEMVEND_ITEMNO: TStringField
      DisplayLabel = 'OEM Vendor Item #'
      FieldName = 'VEND_ITEMNO'
      Origin = 'v.vend_itemno'
      Size = 25
    end
    object PkAkaOEMVEND_DESCRIP: TStringField
      DisplayLabel = 'OEM Vendor Item Description'
      DisplayWidth = 25
      FieldName = 'VEND_DESCRIP'
      Origin = 'v.vend_descrip'
      Size = 35
    end
    object PkAkaOEMARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Origin = 'v.arinvt_id'
      Visible = False
      Size = 0
    end
    object PkAkaOEMITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Origin = 'a.itemno'
      FixedChar = True
      Size = 50
    end
    object PkAkaOEMDESCRIP: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Origin = 'a.descrip'
      Size = 100
    end
    object PkAkaOEMCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Origin = 'a.class'
      FixedChar = True
      Size = 2
    end
    object PkAkaOEMREV: TStringField
      DisplayLabel = 'Rev '
      DisplayWidth = 5
      FieldName = 'REV'
      Origin = 'a.rev'
      FixedChar = True
      Size = 15
    end
    object PkAkaOEMEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'a.eplant_id'
      Size = 0
    end
    object PkAkaOEMDESCRIP2: TStringField
      DisplayLabel = 'Ext. Description'
      DisplayWidth = 60
      FieldName = 'DESCRIP2'
      Origin = 'a.descrip2'
      Size = 100
    end
    object PkAkaOEMVEND_DESCRIP2: TStringField
      DisplayLabel = 'OEM Vendor Item Ext Description'
      DisplayWidth = 60
      FieldName = 'VEND_DESCRIP2'
      Origin = 'v.vend_descrip2'
      Size = 100
    end
    object PkAkaOEMID: TBCDField
      FieldName = 'ID'
      Origin = 'v.id'
      Visible = False
      Size = 0
    end
    object PkAkaOEMVEND_REV: TStringField
      DisplayLabel = 'OEM Vendor Item Rev'
      FieldName = 'VEND_REV'
      Origin = 'v.vend_rev'
      Size = 15
    end
    object PkAkaOEMVENDORNO: TStringField
      DisplayLabel = 'OEM Vendor'
      FieldName = 'VENDORNO'
      Origin = 'ven.vendorno'
      FixedChar = True
      Size = 10
    end
    object PkAkaOEMCOMPANY: TStringField
      DisplayLabel = 'OEM Vendor Name'
      FieldName = 'COMPANY'
      Origin = 'ven.company'
      Size = 60
    end
  end
  object SrcWFHeader: TDataSource
    DataSet = QryWFHeader
    Left = 320
    Top = 24
  end
  object QryWFHeader: TFDQuery
    Tag = 1
    BeforeInsert = AbortOnInsert
    IndexesActive = False
    IndexFieldNames = 'ID'
    MasterSource = SrcPo
    MasterFields = 'ID'
    DetailFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.RefreshMode = rmManual
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    UpdateOptions.UpdateTableName = 'WF_HEADER'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLWFHeader
    SQL.Strings = (
      'select id,'
      '       is_started'
      '  from wf_header'
      ' where kind = '#39'PO'#39'        '
      '   and source_id = :id'
      '                 ')
    Left = 328
    Top = 32
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryWFHeaderIS_STARTED: TStringField
      DisplayLabel = 'Active'
      FieldName = 'IS_STARTED'
      Origin = 'IQ.WF_HEADER.IS_STARTED'
      FixedChar = True
      Size = 1
    end
    object QryWFHeaderID: TBCDField
      Tag = 1
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object UpdateSQLWFHeader: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into wf_header'
      '  (ID, IS_STARTED)'
      'values'
      '  (:ID, :IS_STARTED)')
    ModifySQL.Strings = (
      'update wf_header'
      'set'
      '  ID = :ID,'
      '  IS_STARTED = :IS_STARTED'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from wf_header'
      'where'
      '  ID = :OLD_ID')
    Left = 336
    Top = 40
  end
  object PkTaxCode: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select t.id as id,'
      '       t.tax_code as tax_code,'
      '       t.tax_code_desc as description,'
      '       t.tot_tax_rate as rate'
      '  from tax_codes t  '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 544
    Top = 400
    object PkTaxCodeID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.TAX_CODES.ID'
      Visible = False
      Size = 0
    end
    object PkTaxCodeTAX_CODE: TStringField
      FieldName = 'Tax'
      Origin = 'IQ.TAX_CODES.TAX_CODE'
    end
    object PkTaxCodeDESCRIPTION: TStringField
      FieldName = 'Description'
      Origin = 'IQ.TAX_CODES.TAX_CODE_DESC'
      Size = 50
    end
    object PkTaxCodeRATE: TFMTBCDField
      FieldName = 'Rate'
      Origin = 'IQ.TAX_CODES.TOT_TAX_RATE'
      Size = 6
    end
    object PkTaxCodeTAX_CODE2: TStringField
      DisplayLabel = 'Tax Code'
      FieldName = 'TAX_CODE'
      Origin = 'IQ.TAX_CODES.TAX_CODE'
    end
  end
  object QryPO: TFDQuery
    BeforeOpen = QryPOBeforeOpen
    BeforeInsert = QryPOBeforeInsert
    AfterInsert = QryPOAfterInsert
    BeforeEdit = QryPOBeforeEdit
    BeforePost = QryPOBeforePost
    AfterPost = QryPOAfterPost
    BeforeCancel = QryPOBeforeCancel
    AfterCancel = QryPOAfterCancel
    BeforeDelete = QryPOBeforeDelete
    BeforeScroll = QryPOBeforeScroll
    AfterScroll = QryPOAfterScroll
    OnCalcFields = QryPOCalcFields
    OnNewRecord = QryPONewRecord
    IndexesActive = False
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.RefreshMode = rmManual
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    UpdateOptions.UpdateTableName = 'PO'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = FDUpdateSQL_PO
    SQL.Strings = (
      'SELECT a.id,'
      '       a.pono,'
      '       a.vendor_id,'
      '       (SELECT vendorno'
      '          FROM vendor'
      '         WHERE id = a.vendor_id)'
      '          AS vendorno,'
      '       (SELECT company'
      '          FROM vendor'
      '         WHERE id = a.vendor_id)'
      '          AS vendor_company,'
      '       (SELECT addr1'
      '          FROM vendor'
      '         WHERE id = a.vendor_id)'
      '          AS vendor_addr1,'
      '       (SELECT addr2'
      '          FROM vendor'
      '         WHERE id = a.vendor_id)'
      '          AS vendor_addr2,'
      '       (SELECT city'
      '          FROM vendor'
      '         WHERE id = a.vendor_id)'
      '          AS vendor_city,'
      '       (SELECT state'
      '          FROM vendor'
      '         WHERE id = a.vendor_id)'
      '          AS vendor_state,'
      '       (SELECT zip'
      '          FROM vendor'
      '         WHERE id = a.vendor_id)'
      '          AS vendor_zip,'
      '       (SELECT country'
      '          FROM vendor'
      '         WHERE id = a.vendor_id)'
      '          AS vendor_country,'
      ''
      '       a.po_date,'
      '       a.terms_id,'
      '       a.terms_id,'
      '       (SELECT description'
      '         FROM terms'
      '        WHERE id = a.terms_id)'
      '        AS terms_description,'
      ''
      '       a.remit_to_id,'
      '       (SELECT attn'
      '          FROM remit_to'
      '         WHERE id = a.vendor_id)'
      '          AS remit_to_attn,'
      '       (SELECT addr1'
      '          FROM remit_to'
      '         WHERE id = a.vendor_id)'
      '          AS remit_to_addr1,'
      '       (SELECT addr2'
      '          FROM remit_to'
      '         WHERE id = a.vendor_id)'
      '          AS remit_to_addr2,'
      '       (SELECT city'
      '          FROM remit_to'
      '         WHERE id = a.vendor_id)'
      '          AS remit_to_city,'
      '       (SELECT state'
      '          FROM remit_to'
      '         WHERE id = a.vendor_id)'
      '          AS remit_to_state,'
      '       (SELECT zip'
      '          FROM remit_to'
      '         WHERE id = a.vendor_id)'
      '          AS remit_to_zip,'
      '       (SELECT country'
      '          FROM remit_to'
      '         WHERE id = a.vendor_id)'
      '          AS remit_to_country,'
      ''
      '       a.ship_to_id,'
      '       a.userid,'
      '       a.buyerid,'
      '       (SELECT LTRIM(RTRIM(pr_emp.first_name) || '#39' '#39') ||'
      '               RTRIM(pr_emp.last_name)'
      '          FROM s_user_general, pr_emp'
      '         WHERE RTRIM(s_user_general.user_name) = a.buyerid AND'
      '               s_user_general.pr_emp_id = pr_emp.id)'
      '          AS buyer_name,'
      '       a.freight_id,'
      '       a.fob,'
      '       a.tax_code_id,'
      '       a.comment1,'
      '       a.company_id,'
      '       a.confirm_to,'
      '       a.currency_id,'
      '       a.rev,'
      '       a.po_control,'
      '       a.pr_emp_id_rqstnr,'
      '       a.approved_by,'
      '       a.eplant_id,'
      '       a.arcusto_id,'
      '       (SELECT custno'
      '          FROM arcusto'
      '         WHERE id = a.arcusto_id)'
      '          AS arcusto_custno,'
      '       a.print_count,'
      '       a.print_last_user,'
      '       a.print_last_date,'
      '       a.po_type,'
      '       a.create_edi,'
      '       a.signoff_email_sent,'
      '       a.signoff_userid,'
      '       a.signoff_date,'
      '       a.signoff_text,'
      '       a.export_created_date,'
      '       a.signoff_notify_userid,'
      '       a.signoff_userid_agree,'
      '       a.vendor_contact_id,'
      '       a.workflow_enabled,'
      '       a.signoff_link,'
      '       a.signoff_subject,'
      '       a.cuser1,'
      '       a.cuser2,'
      '       a.cuser3,'
      '       a.cuser4,'
      '       a.cuser5,'
      '       a.cuser6,'
      '       a.on_hold,'
      '       a.reason,'
      '       (SELECT descrip'
      '         FROM freight'
      '        WHERE id = a.freight_id)'
      '        AS freight_descrip,'
      '       f.tax_code,'
      '       f.tax_code_desc,'
      '       g.curr_code,'
      '       g.descrip AS curr_descrip,'
      '       (SELECT name'
      '          FROM eplant'
      '         WHERE id = a.eplant_id)'
      '          AS eplant_name'
      '/* _FROM_START */'
      '  FROM po a, tax_codes f, currency g'
      '/* _WHERE_START */'
      ' WHERE f.id(+) = a.tax_code_id AND'
      '       g.id(+) = a.currency_id AND'
      '       iqms.misc.eplant_filter(a.eplant_id) = 1 AND'
      '       (:SHOW_ALL = 1 OR'
      '        :SHOW_ALL = 0 AND'
      '-- _NAV_WHERE_START'
      
        '   ((SELECT COUNT( * ) FROM gtt_picklist_scope WHERE batch = :SC' +
        'OPE_BATCH) = 0 AND a.id = :ID'
      '     OR'
      
        '     EXISTS (SELECT 1 FROM gtt_picklist_scope WHERE batch = :SCO' +
        'PE_BATCH AND id = a.id ))'
      '-- _NAV_WHERE_END'
      '       )'
      ''
      '-- HPICK_PROPAGATE_SORT_START'
      '-- do not remove these comments'
      'ORDER BY a.id'
      '-- HPICK_PROPAGATE_SORT_END'
      '')
    Left = 40
    Top = 32
    ParamData = <
      item
        Name = 'SHOW_ALL'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'SCOPE_BATCH'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryPOPONO: TStringField
      DisplayLabel = 'PO#'
      DisplayWidth = 7
      FieldName = 'PONO'
      Origin = 'a.pono'
      Size = 35
    end
    object QryPOPO_DATE: TDateTimeField
      DisplayLabel = 'PO Date'
      DisplayWidth = 11
      FieldName = 'PO_DATE'
      Origin = 'a.po_date'
    end
    object QryPOVENDOR_COMPANY: TStringField
      DisplayLabel = 'Vendor Company'
      DisplayWidth = 13
      FieldName = 'VENDOR_COMPANY'
      Origin = 'VENDOR_COMPANY'
      Size = 60
    end
    object QryPOVENDOR_ADDR1: TStringField
      DisplayLabel = 'Vendor Address 1'
      DisplayWidth = 14
      FieldName = 'VENDOR_ADDR1'
      Origin = 'VENDOR_ADDR1'
      Size = 60
    end
    object QryPOVENDOR_ADDR2: TStringField
      DisplayLabel = 'Vendor Address 2'
      DisplayWidth = 14
      FieldName = 'VENDOR_ADDR2'
      Origin = 'VENDOR_ADDR2'
      Size = 60
    end
    object QryPOVENDOR_CITY: TStringField
      DisplayLabel = 'Vendor City'
      DisplayWidth = 12
      FieldName = 'VENDOR_CITY'
      Origin = 'VENDOR_CITY'
      FixedChar = True
      Size = 30
    end
    object QryPOVENDOR_STATE: TStringField
      DisplayLabel = 'Vendor State'
      DisplayWidth = 12
      FieldName = 'VENDOR_STATE'
      Origin = 'VENDOR_STATE'
    end
    object QryPOVENDOR_ZIP: TStringField
      DisplayLabel = 'Vendor Postal Code'
      DisplayWidth = 15
      FieldName = 'VENDOR_ZIP'
      Origin = 'VENDOR_ZIP'
      FixedChar = True
      Size = 10
    end
    object QryPOVENDOR_COUNTRY: TStringField
      DisplayLabel = 'Vendor Country'
      DisplayWidth = 12
      FieldName = 'VENDOR_COUNTRY'
      Origin = 'VENDOR_COUNTRY'
      FixedChar = True
      Size = 100
    end
    object QryPOREMIT_TO_ATTN: TStringField
      DisplayLabel = 'Remit To'
      DisplayWidth = 12
      FieldName = 'REMIT_TO_ATTN'
      Origin = 'REMIT_TO_ATTN'
      Size = 60
    end
    object QryPOREMIT_TO_ADDR1: TStringField
      DisplayLabel = 'Remittance Address 1'
      DisplayWidth = 17
      FieldName = 'REMIT_TO_ADDR1'
      Origin = 'REMIT_TO_ADDR1'
      Size = 60
    end
    object QryPOREMIT_TO_ADDR2: TStringField
      DisplayLabel = 'Remittance Address 2'
      DisplayWidth = 17
      FieldName = 'REMIT_TO_ADDR2'
      Origin = 'REMIT_TO_ADDR2'
      Size = 60
    end
    object QryPOREMIT_TO_CITY: TStringField
      DisplayLabel = 'Remittance City'
      DisplayWidth = 12
      FieldName = 'REMIT_TO_CITY'
      Origin = 'REMIT_TO_CITY'
      FixedChar = True
      Size = 30
    end
    object QryPOREMIT_TO_STATE: TStringField
      DisplayLabel = 'Remittance State'
      DisplayWidth = 13
      FieldName = 'REMIT_TO_STATE'
      Origin = 'REMIT_TO_STATE'
    end
    object QryPOREMIT_TO_ZIP: TStringField
      DisplayLabel = 'Remittance Postal Code'
      DisplayWidth = 19
      FieldName = 'REMIT_TO_ZIP'
      Origin = 'REMIT_TO_ZIP'
      FixedChar = True
      Size = 10
    end
    object QryPOREMIT_TO_COUNTRY: TStringField
      DisplayLabel = 'Remittance Country'
      DisplayWidth = 15
      FieldName = 'REMIT_TO_COUNTRY'
      Origin = 'REMIT_TO_COUNTRY'
      FixedChar = True
      Size = 100
    end
    object QryPOTERMS_DESCRIPTION: TStringField
      DisplayLabel = 'Terms'
      DisplayWidth = 12
      FieldName = 'TERMS_DESCRIPTION'
      Origin = 'TERMS_DESCRIPTION'
      Size = 60
    end
    object QryPOFREIGHT_DESCRIP: TStringField
      DisplayLabel = 'Freight'
      DisplayWidth = 12
      FieldName = 'FREIGHT_DESCRIP'
      Origin = 'FREIGHT_DESCRIP'
      Size = 60
    end
    object QryPOFOB: TStringField
      DisplayWidth = 14
      FieldName = 'FOB'
      Origin = 'a.fob'
      Size = 60
    end
    object QryPOTAX_CODE_DESC: TStringField
      DisplayLabel = 'Tax Code Description'
      DisplayWidth = 17
      FieldName = 'TAX_CODE_DESC'
      Origin = 'f.tax_code_desc'
      Size = 50
    end
    object QryPOCURR_CODE: TStringField
      DisplayLabel = 'Currency Code'
      DisplayWidth = 12
      FieldName = 'CURR_CODE'
      Origin = 'g.curr_code'
      Size = 10
    end
    object QryPOID: TBCDField
      Tag = 1
      DisplayLabel = 'Requisition #'
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'a.id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
    object QryPOVENDOR_ID: TBCDField
      Tag = 1
      FieldName = 'VENDOR_ID'
      Origin = 'a.vendor_id'
      Visible = False
      OnChange = TblPoVENDOR_IDChange
      Precision = 15
      Size = 0
    end
    object QryPOVENDORNO: TStringField
      FieldName = 'VENDORNO'
      Origin = 'VENDORNO'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object QryPOTERMS_ID: TBCDField
      FieldName = 'TERMS_ID'
      Origin = 'a.terms_id'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryPOREMIT_TO_ID: TBCDField
      Tag = 1
      FieldName = 'REMIT_TO_ID'
      Origin = 'a.remit_to_id'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryPOSHIP_TO_ID: TBCDField
      Tag = 1
      FieldName = 'SHIP_TO_ID'
      Origin = 'a.ship_to_id'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryPOUSERID: TStringField
      FieldName = 'USERID'
      Origin = 'a.userid'
      Visible = False
      Size = 35
    end
    object QryPOBUYERID: TStringField
      FieldName = 'BUYERID'
      Origin = 'a.buyerid'
      Visible = False
      Size = 35
    end
    object QryPOBUYER_NAME: TStringField
      FieldName = 'BUYER_NAME'
      Origin = 'BUYER_NAME'
      Visible = False
      Size = 61
    end
    object QryPOFREIGHT_ID: TBCDField
      Tag = 1
      FieldName = 'FREIGHT_ID'
      Origin = 'a.freight_id'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryPOTAX_CODE_ID: TBCDField
      Tag = 1
      FieldName = 'TAX_CODE_ID'
      Origin = 'a.tax_code_id'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryPOCOMMENT1: TStringField
      FieldName = 'COMMENT1'
      Origin = 'a.comment1'
      Visible = False
      Size = 255
    end
    object QryPOCOMPANY_ID: TBCDField
      Tag = 1
      FieldName = 'COMPANY_ID'
      Origin = 'a.company_id'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryPOCONFIRM_TO: TStringField
      FieldName = 'CONFIRM_TO'
      Origin = 'a.confirm_to'
      Visible = False
      Size = 50
    end
    object QryPOCURRENCY_ID: TBCDField
      Tag = 1
      FieldName = 'CURRENCY_ID'
      Origin = 'a.currency_id'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryPOREV: TBCDField
      FieldName = 'REV'
      Origin = 'a.rev'
      Visible = False
      Precision = 5
      Size = 0
    end
    object QryPOPO_CONTROL: TStringField
      FieldName = 'PO_CONTROL'
      Origin = 'a.po_control'
      Visible = False
      Size = 60
    end
    object QryPOPR_EMP_ID_RQSTNR: TBCDField
      FieldName = 'PR_EMP_ID_RQSTNR'
      Origin = 'a.pr_emp_id_rqstnr'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryPOAPPROVED_BY: TStringField
      FieldName = 'APPROVED_BY'
      Origin = 'a.approved_by'
      Visible = False
      Size = 35
    end
    object QryPOEPLANT_ID: TBCDField
      Tag = 1
      FieldName = 'EPLANT_ID'
      Origin = 'a.eplant_id'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryPOARCUSTO_ID: TBCDField
      Tag = 1
      FieldName = 'ARCUSTO_ID'
      Origin = 'a.arcusto_id'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryPOARCUSTO_CUSTNO: TStringField
      FieldName = 'ARCUSTO_CUSTNO'
      Origin = 'ARCUSTO_CUSTNO'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object QryPOPRINT_COUNT: TBCDField
      FieldName = 'PRINT_COUNT'
      Origin = 'a.print_count'
      Visible = False
      Precision = 5
      Size = 0
    end
    object QryPOPRINT_LAST_USER: TStringField
      FieldName = 'PRINT_LAST_USER'
      Origin = 'a.print_last_user'
      Visible = False
      Size = 35
    end
    object QryPOPRINT_LAST_DATE: TDateTimeField
      FieldName = 'PRINT_LAST_DATE'
      Origin = 'a.print_last_date'
      Visible = False
    end
    object QryPOPO_TYPE: TStringField
      FieldName = 'PO_TYPE'
      Origin = 'a.po_type'
      Visible = False
    end
    object QryPOCREATE_EDI: TStringField
      FieldName = 'CREATE_EDI'
      Origin = 'a.create_edi'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryPOSIGNOFF_EMAIL_SENT: TDateTimeField
      FieldName = 'SIGNOFF_EMAIL_SENT'
      Origin = 'SIGNOFF_EMAIL_SENT'
      Visible = False
    end
    object QryPOSIGNOFF_USERID: TStringField
      FieldName = 'SIGNOFF_USERID'
      Origin = 'SIGNOFF_USERID'
      Visible = False
      Size = 35
    end
    object QryPOSIGNOFF_DATE: TDateTimeField
      FieldName = 'SIGNOFF_DATE'
      Origin = 'SIGNOFF_DATE'
      Visible = False
    end
    object QryPOSIGNOFF_TEXT: TStringField
      FieldName = 'SIGNOFF_TEXT'
      Origin = 'SIGNOFF_TEXT'
      Visible = False
      Size = 2000
    end
    object QryPOEXPORT_CREATED_DATE: TDateTimeField
      FieldName = 'EXPORT_CREATED_DATE'
      Origin = 'EXPORT_CREATED_DATE'
      Visible = False
    end
    object QryPOSIGNOFF_NOTIFY_USERID: TStringField
      FieldName = 'SIGNOFF_NOTIFY_USERID'
      Origin = 'SIGNOFF_NOTIFY_USERID'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryPOSIGNOFF_USERID_AGREE: TStringField
      FieldName = 'SIGNOFF_USERID_AGREE'
      Origin = 'SIGNOFF_USERID_AGREE'
      Visible = False
      Size = 35
    end
    object QryPOVENDOR_CONTACT_ID: TBCDField
      Tag = 1
      FieldName = 'VENDOR_CONTACT_ID'
      Origin = 'a.vendor_contact_id'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryPOWORKFLOW_ENABLED: TStringField
      FieldName = 'WORKFLOW_ENABLED'
      Origin = 'a.workflow_enabled'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryPOSIGNOFF_LINK: TStringField
      FieldName = 'SIGNOFF_LINK'
      Origin = 'a.signoff_link'
      Visible = False
      Size = 1000
    end
    object QryPOSIGNOFF_SUBJECT: TStringField
      FieldName = 'SIGNOFF_SUBJECT'
      Origin = 'a.signoff_subject'
      Visible = False
      Size = 1000
    end
    object QryPOCUSER1: TStringField
      FieldName = 'CUSER1'
      Origin = 'a.cuser1'
      Visible = False
      Size = 60
    end
    object QryPOCUSER2: TStringField
      FieldName = 'CUSER2'
      Origin = 'a.cuser2'
      Visible = False
      Size = 60
    end
    object QryPOCUSER3: TStringField
      FieldName = 'CUSER3'
      Origin = 'a.cuser3'
      Visible = False
      Size = 60
    end
    object QryPOCUSER4: TStringField
      FieldName = 'CUSER4'
      Origin = 'a.cuser4'
      Visible = False
      Size = 60
    end
    object QryPOCUSER5: TStringField
      FieldName = 'CUSER5'
      Origin = 'a.cuser5'
      Visible = False
      Size = 60
    end
    object QryPOCUSER6: TStringField
      FieldName = 'CUSER6'
      Origin = 'a.cuser6'
      Visible = False
      Size = 60
    end
    object QryPOON_HOLD: TStringField
      FieldName = 'ON_HOLD'
      Origin = 'a.on_hold'
      Visible = False
      Size = 1
    end
    object QryPOREASON: TStringField
      FieldName = 'REASON'
      Origin = 'a.reason'
      Visible = False
      Size = 60
    end
    object QryPOTAX_CODE: TStringField
      FieldName = 'TAX_CODE'
      Origin = 'f.tax_code'
      Visible = False
    end
    object QryPOCURR_DESCRIP: TStringField
      FieldName = 'CURR_DESCRIP'
      Origin = 'g.descrip'
      Visible = False
      Size = 50
    end
    object QryPOEPLANT_NAME: TStringField
      FieldName = 'EPLANT_NAME'
      Origin = 'EPLANT_NAME'
      Visible = False
      Size = 30
    end
    object QryPOBuyerName: TStringField
      FieldKind = fkCalculated
      FieldName = 'BuyerName'
      Visible = False
      Size = 60
      Calculated = True
    end
    object QryPOTERMS_ID_1: TBCDField
      FieldName = 'TERMS_ID_1'
      Origin = 'TERMS_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object FDUpdateSQL_PO: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'INSERT INTO PO'
      '(ID, PONO, VENDOR_ID, PO_DATE, TERMS_ID, '
      '  REMIT_TO_ID, SHIP_TO_ID, USERID, BUYERID, '
      '  FREIGHT_ID, FOB, TAX_CODE_ID, COMMENT1, '
      '  COMPANY_ID, CONFIRM_TO, CURRENCY_ID, REV, '
      '  PO_CONTROL, PR_EMP_ID_RQSTNR, APPROVED_BY, '
      '  EPLANT_ID, ARCUSTO_ID, PRINT_COUNT, PRINT_LAST_USER, '
      '  PRINT_LAST_DATE, PO_TYPE, CREATE_EDI, SIGNOFF_EMAIL_SENT, '
      '  SIGNOFF_USERID, SIGNOFF_DATE, SIGNOFF_TEXT, '
      
        '  EXPORT_CREATED_DATE, SIGNOFF_NOTIFY_USERID, SIGNOFF_USERID_AGR' +
        'EE, '
      '  VENDOR_CONTACT_ID, WORKFLOW_ENABLED, SIGNOFF_LINK, '
      '  SIGNOFF_SUBJECT, CUSER1, CUSER2, CUSER3, '
      '  CUSER4, CUSER5, CUSER6, ON_HOLD, REASON)'
      
        'VALUES (:NEW_ID, :NEW_PONO, :NEW_VENDOR_ID, :NEW_PO_DATE, :NEW_T' +
        'ERMS_ID, '
      '  :NEW_REMIT_TO_ID, :NEW_SHIP_TO_ID, :NEW_USERID, :NEW_BUYERID, '
      '  :NEW_FREIGHT_ID, :NEW_FOB, :NEW_TAX_CODE_ID, :NEW_COMMENT1, '
      '  :NEW_COMPANY_ID, :NEW_CONFIRM_TO, :NEW_CURRENCY_ID, :NEW_REV, '
      '  :NEW_PO_CONTROL, :NEW_PR_EMP_ID_RQSTNR, :NEW_APPROVED_BY, '
      
        '  :NEW_EPLANT_ID, :NEW_ARCUSTO_ID, :NEW_PRINT_COUNT, :NEW_PRINT_' +
        'LAST_USER, '
      
        '  :NEW_PRINT_LAST_DATE, :NEW_PO_TYPE, :NEW_CREATE_EDI, :NEW_SIGN' +
        'OFF_EMAIL_SENT, '
      '  :NEW_SIGNOFF_USERID, :NEW_SIGNOFF_DATE, :NEW_SIGNOFF_TEXT, '
      
        '  :NEW_EXPORT_CREATED_DATE, :NEW_SIGNOFF_NOTIFY_USERID, :NEW_SIG' +
        'NOFF_USERID_AGREE, '
      
        '  :NEW_VENDOR_CONTACT_ID, :NEW_WORKFLOW_ENABLED, :NEW_SIGNOFF_LI' +
        'NK, '
      '  :NEW_SIGNOFF_SUBJECT, :NEW_CUSER1, :NEW_CUSER2, :NEW_CUSER3, '
      
        '  :NEW_CUSER4, :NEW_CUSER5, :NEW_CUSER6, :NEW_ON_HOLD, :NEW_REAS' +
        'ON)')
    ModifySQL.Strings = (
      'UPDATE PO'
      'SET PONO = :NEW_PONO, VENDOR_ID = :NEW_VENDOR_ID, '
      
        '  PO_DATE = :NEW_PO_DATE, TERMS_ID = :NEW_TERMS_ID, REMIT_TO_ID ' +
        '= :NEW_REMIT_TO_ID, '
      
        '  SHIP_TO_ID = :NEW_SHIP_TO_ID, USERID = :NEW_USERID, BUYERID = ' +
        ':NEW_BUYERID, '
      
        '  FREIGHT_ID = :NEW_FREIGHT_ID, FOB = :NEW_FOB, TAX_CODE_ID = :N' +
        'EW_TAX_CODE_ID, '
      '  COMMENT1 = :NEW_COMMENT1, COMPANY_ID = :NEW_COMPANY_ID, '
      '  CONFIRM_TO = :NEW_CONFIRM_TO, CURRENCY_ID = :NEW_CURRENCY_ID, '
      
        '  REV = :NEW_REV, PO_CONTROL = :NEW_PO_CONTROL, PR_EMP_ID_RQSTNR' +
        ' = :NEW_PR_EMP_ID_RQSTNR, '
      '  APPROVED_BY = :NEW_APPROVED_BY, EPLANT_ID = :NEW_EPLANT_ID, '
      '  ARCUSTO_ID = :NEW_ARCUSTO_ID, PRINT_COUNT = :NEW_PRINT_COUNT, '
      
        '  PRINT_LAST_USER = :NEW_PRINT_LAST_USER, PRINT_LAST_DATE = :NEW' +
        '_PRINT_LAST_DATE, '
      
        '  PO_TYPE = :NEW_PO_TYPE, CREATE_EDI = :NEW_CREATE_EDI, SIGNOFF_' +
        'EMAIL_SENT = :NEW_SIGNOFF_EMAIL_SENT, '
      
        '  SIGNOFF_USERID = :NEW_SIGNOFF_USERID, SIGNOFF_DATE = :NEW_SIGN' +
        'OFF_DATE, '
      
        '  SIGNOFF_TEXT = :NEW_SIGNOFF_TEXT, EXPORT_CREATED_DATE = :NEW_E' +
        'XPORT_CREATED_DATE, '
      
        '  SIGNOFF_NOTIFY_USERID = :NEW_SIGNOFF_NOTIFY_USERID, SIGNOFF_US' +
        'ERID_AGREE = :NEW_SIGNOFF_USERID_AGREE, '
      
        '  VENDOR_CONTACT_ID = :NEW_VENDOR_CONTACT_ID, WORKFLOW_ENABLED =' +
        ' :NEW_WORKFLOW_ENABLED, '
      
        '  SIGNOFF_LINK = :NEW_SIGNOFF_LINK, SIGNOFF_SUBJECT = :NEW_SIGNO' +
        'FF_SUBJECT, '
      
        '  CUSER1 = :NEW_CUSER1, CUSER2 = :NEW_CUSER2, CUSER3 = :NEW_CUSE' +
        'R3, '
      
        '  CUSER4 = :NEW_CUSER4, CUSER5 = :NEW_CUSER5, CUSER6 = :NEW_CUSE' +
        'R6, '
      '  ON_HOLD = :NEW_ON_HOLD, REASON = :NEW_REASON'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM PO'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, PONO, VENDOR_ID, PO_DATE, TERMS_ID, REMIT_TO_ID, SHIP' +
        '_TO_ID, '
      '  USERID, BUYERID, FREIGHT_ID, FOB, TAX_CODE_ID, COMMENT1, '
      
        '  COMPANY_ID, ECODE, EID, EDATE_TIME, ECOPY, CONFIRM_TO, CURRENC' +
        'Y_ID, '
      '  REV, PO_CONTROL, PR_EMP_ID_RQSTNR, APPROVED_BY, EPLANT_ID, '
      '  ARCUSTO_ID, PRINT_COUNT, PRINT_LAST_USER, PRINT_LAST_DATE, '
      '  PO_TYPE, CREATE_EDI, SIGNOFF_EMAIL_SENT, SIGNOFF_USERID, '
      
        '  SIGNOFF_DATE, SIGNOFF_TEXT, EXPORT_CREATED_DATE, SIGNOFF_NOTIF' +
        'Y_USERID, '
      '  SIGNOFF_USERID_AGREE, VENDOR_CONTACT_ID, WORKFLOW_ENABLED, '
      
        '  SIGNOFF_LINK, SIGNOFF_SUBJECT, CUSER1, CUSER2, CUSER3, CUSER4,' +
        ' '
      '  CUSER5, CUSER6, ON_HOLD, REASON'
      'FROM PO'
      'WHERE ID = :ID')
    Left = 56
    Top = 48
  end
  object PkArInvtEx: TIQWebHpick
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT id,'
      '       itemno,'
      '       descrip,'
      '       descrip2,'
      '       rev,'
      '       class,'
      '       eplant_id,'
      '       pk_hide'
      '  FROM arinvt'
      ' WHERE misc.eplant_filter(eplant_id) = 1')
    OnIQModify = PkArInvtIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 121
    Top = 398
    object PkArInvtExID: TBCDField
      FieldName = 'ID'
      Origin = 'id'
      Visible = False
      Size = 0
    end
    object PkArInvtExITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Origin = 'itemno'
      Size = 50
    end
    object PkArInvtExDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'descrip'
      Size = 100
    end
    object PkArInvtExDESCRIP2: TStringField
      DisplayLabel = 'Extended Description'
      FieldName = 'DESCRIP2'
      Origin = 'descrip2'
      Size = 100
    end
    object PkArInvtExREV: TStringField
      DisplayLabel = 'Revision'
      FieldName = 'REV'
      Origin = 'rev'
      Size = 15
    end
    object PkArInvtExCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Origin = 'class'
      Size = 2
    end
    object PkArInvtExEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'eplant_id'
      Size = 0
    end
    object PkArInvtExPK_HIDE: TStringField
      DisplayLabel = 'Inactive?'
      FieldName = 'PK_HIDE'
      Origin = 'pk_hide'
      FixedChar = True
      Size = 1
    end
  end
end
