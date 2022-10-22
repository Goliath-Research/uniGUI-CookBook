object LM_DM: TLM_DM
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 479
  Width = 741
  object QryVendor: TFDQuery
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select  id,'
      '           vendorno, '
      '           company, '
      '           addr1, '
      '           addr2, '
      '           city, '
      '           state, '
      '           zip '
      '   from vendor'
      
        ' where id in (select vendor_id from ARINVT_VENDORS where arinvt_' +
        'id = :nId)')
    Left = 80
    Top = 8
    ParamData = <
      item
        Name = 'nId'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryVendorCOMPANY: TStringField
      DisplayLabel = 'Vendor'
      DisplayWidth = 20
      FieldName = 'COMPANY'
      Size = 60
    end
    object QryVendorVENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      DisplayWidth = 10
      FieldName = 'VENDORNO'
      Size = 10
    end
    object QryVendorADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 20
      FieldName = 'ADDR1'
      Size = 60
    end
    object QryVendorADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 30
      FieldName = 'ADDR2'
      Size = 60
    end
    object QryVendorCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 15
      FieldName = 'CITY'
      Size = 30
    end
    object QryVendorSTATE: TStringField
      DisplayLabel = 'State or Region'
      DisplayWidth = 2
      FieldName = 'STATE'
    end
    object QryVendorZIP: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 10
      FieldName = 'ZIP'
      Size = 10
    end
    object QryVendorID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object QryLocation: TFDQuery
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select  f.id as id,'
      '        f.lotno as lotno,'
      '        f.onhand as onhand,'
      '        l.loc_desc as loc_desc'
      '   from fgmulti f, locations l'
      'where f.loc_id = l.id   '
      ' and f.arinvt_id = :nId')
    Left = 256
    Top = 11
    ParamData = <
      item
        Name = 'nId'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryLocationLOC_DESC: TStringField
      DisplayLabel = 'Location'
      DisplayWidth = 15
      FieldName = 'LOC_DESC'
      Size = 30
    end
    object QryLocationLOTNO: TStringField
      DisplayLabel = 'Lot#'
      DisplayWidth = 15
      FieldName = 'LOTNO'
      Size = 25
    end
    object QryLocationONHAND: TBCDField
      DisplayLabel = 'On Hand'
      DisplayWidth = 10
      FieldName = 'ONHAND'
    end
    object QryLocationID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object QryPoOrders: TFDQuery
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select o.id,'
      '       o.pono as pono,'
      '       o.orderno as orderno,'
      '       d.total_qty_ord as ord_quan'
      ' from orders o, ord_detail d'
      'where d.arinvt_id = :nId'
      '  and d.orders_id = o.id       ')
    Left = 144
    Top = 11
    ParamData = <
      item
        Name = 'nId'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryPoOrdersORDERNO: TStringField
      DisplayLabel = 'Order#'
      DisplayWidth = 10
      FieldName = 'ORDERNO'
      Size = 15
    end
    object QryPoOrdersORD_QUAN: TBCDField
      DisplayLabel = 'Qty.'
      DisplayWidth = 10
      FieldName = 'ORD_QUAN'
    end
    object QryPoOrdersPONO: TStringField
      DisplayLabel = 'PO#'
      DisplayWidth = 20
      FieldName = 'PONO'
      Size = 35
    end
    object QryPoOrdersID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object QryLabels: TFDQuery
    BeforeOpen = QryLabelsBeforeOpen
    Filtered = True
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       arcusto_id,'
      '       label_file,'
      '       label_menu_name,'
      '       label_type,'
      '       label_kind,'
      '       remote_server,'
      '       eplant_id,'
      '       comm_port,'
      '       2 as sort_column,'
      '       '#39'LABELS'#39' as origin,'
      '       report_name,'
      '       crw_label_copies,'
      '       upper(label_menu_name) as upper_label_menu_name,'
      '       label_template_id'
      '  from lm_labels'
      ' where'
      '       ( LABEL_TYPE = :cLabelType'
      '         or'
      '         :include_mixed = '#39'Y'#39')'
      '   and misc.eplant_filter(eplant_id) = 1'
      '   and (RTrim(report_name) is not NULL'
      '        or'
      '   label_template_id is not null'
      '        or'
      
        '        EXISTS ( select 1 from lm_labels_detail where lm_labels_' +
        'id = lm_labels.id ))'
      ''
      'UNION'
      ''
      '-- label attached directly to arinvt'
      'select l.id,'
      '       l.arcusto_id,'
      '       l.label_file,'
      '       l.label_menu_name,'
      '       l.label_type,'
      '       l.label_kind,'
      '       l.remote_server,'
      '       l.eplant_id,'
      '       l.comm_port,'
      '       1 as sort_column,'
      '       '#39'INVENTORY'#39' as origin,'
      '       l.report_name,'
      '       l.crw_label_copies,'
      '       upper(l.label_menu_name) as upper_label_menu_name,'
      '       l.label_template_id'
      '  from'
      '       lm_labels l,'
      '       arinvt a'
      ' where a.lm_labels_id = l.id'
      '   and a.id = :arinvt_id'
      '   and misc.eplant_filter(l.eplant_id) = 1'
      ' order by'
      '       10,  -- sort_column'
      '       14   -- label_menu_name'
      ''
      ''
      ''
      '')
    Left = 252
    Top = 120
    ParamData = <
      item
        Name = 'cLabelType'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'INCLUDE_MIXED'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryLabelsLABEL_MENU_NAME: TStringField
      DisplayLabel = 'Label'
      DisplayWidth = 25
      FieldName = 'LABEL_MENU_NAME'
      Size = 25
    end
    object QryLabelsORIGIN: TStringField
      DisplayLabel = 'Label Origin'
      DisplayWidth = 15
      FieldName = 'ORIGIN'
      Size = 9
    end
    object QryLabelsREMOTE_SERVER: TStringField
      DisplayWidth = 50
      FieldName = 'REMOTE_SERVER'
      Visible = False
      Size = 50
    end
    object QryLabelsEPLANT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
    object QryLabelsCOMM_PORT: TStringField
      DisplayWidth = 10
      FieldName = 'COMM_PORT'
      Visible = False
      Size = 10
    end
    object QryLabelsREPORT_NAME: TStringField
      DisplayWidth = 100
      FieldName = 'REPORT_NAME'
      Visible = False
      Size = 100
    end
    object QryLabelsCRW_LABEL_COPIES: TBCDField
      DisplayWidth = 10
      FieldName = 'CRW_LABEL_COPIES'
      Visible = False
      Size = 0
    end
    object QryLabelsLABEL_KIND: TStringField
      DisplayWidth = 10
      FieldName = 'LABEL_KIND'
      Visible = False
      Size = 10
    end
    object QryLabelsID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryLabelsARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object QryLabelsLABEL_FILE: TStringField
      FieldName = 'LABEL_FILE'
      Visible = False
      Size = 25
    end
    object QryLabelsLABEL_TYPE: TStringField
      FieldName = 'LABEL_TYPE'
      Visible = False
      Size = 25
    end
    object QryLabelsLABEL_TEMPLATE_ID: TBCDField
      FieldName = 'LABEL_TEMPLATE_ID'
      Size = 0
    end
  end
  object QryLabelCust: TFDQuery
    BeforeOpen = QryLabelCustBeforeOpen
    Filtered = True
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      '-- labels based on customer'
      'select id,'
      '       arcusto_id,'
      '       label_file,'
      '       label_menu_name,'
      '       label_type,'
      '       label_kind,'
      '       remote_server,'
      '       eplant_id,'
      '       comm_port,'
      '       3 as sort_column,'
      '       '#39'CUSTOMER'#39' as origin,'
      '       report_name,'
      '       upper(label_menu_name) as upper_label_menu_name,'
      '       label_template_id'
      '  from'
      '       lm_labels l'
      ' where l.label_type in ('#39'MANUFACTURED'#39', '#39'MIXED'#39')'
      
        '   and (   EXISTS (select 1 from lm_labels_detail d where d.lm_l' +
        'abels_id = l.id)'
      '        or'
      '           RTrim(report_name) is not NULL '
      '        or'
      '           label_template_id is not NULL)'
      '   and (   :nID = -1'
      '        or arcusto_id = :nId'
      '        or arcusto_id is null )'
      'UNION'
      '-- label attached directly to arinvt'
      'select l.id,'
      '       l.arcusto_id,'
      '       l.label_file,'
      '       l.label_menu_name,'
      '       l.label_type,'
      '       l.label_kind,'
      '       l.remote_server,'
      '       l.eplant_id,'
      '       l.comm_port,'
      '       2 as sort_column,'
      '       '#39'INVENTORY'#39' as origin,'
      '       l.report_name,'
      '       upper(label_menu_name) as upper_label_menu_name,'
      '       l.label_template_id'
      '  from'
      '       lm_labels l,'
      '       arinvt a'
      ' where a.lm_labels_id = l.id'
      '   and a.id = :arinvt_id'
      ''
      'UNION'
      '-- label attached to AKA'
      'select l.id,'
      '       l.arcusto_id,'
      '       l.label_file,'
      '       l.label_menu_name,'
      '       l.label_type,'
      '       l.label_kind,'
      '       l.remote_server,'
      '       l.eplant_id,'
      '       l.comm_port,'
      '       1 as sort_column,'
      '       '#39'AKA'#39' as origin,'
      '       l.report_name,'
      '       upper(label_menu_name) as upper_label_menu_name,'
      '       l.label_template_id'
      '  from'
      '       lm_labels l,'
      '       aka'
      ' where aka.lm_labels_id = l.id'
      '   and aka.arinvt_id = :arinvt_id'
      '   and aka.arcusto_id = :nId'
      
        '   and misc.aka_ship_to_filter( aka.arcusto_id, aka.arinvt_id, :' +
        'ship_to_id, aka.ship_to_id ) = 1'
      ' order by'
      '       10,  -- sort_column'
      '        2,  -- arcusto_id'
      '       13   -- label_menu_name')
    Left = 296
    Top = 120
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'nId'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'ship_to_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryLabelCustID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object QryLabelCustARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Size = 0
    end
    object QryLabelCustLABEL_FILE: TStringField
      FieldName = 'LABEL_FILE'
      Size = 25
    end
    object QryLabelCustLABEL_MENU_NAME: TStringField
      FieldName = 'LABEL_MENU_NAME'
      Size = 25
    end
    object QryLabelCustLABEL_TYPE: TStringField
      FieldName = 'LABEL_TYPE'
      Size = 25
    end
    object QryLabelCustREMOTE_SERVER: TStringField
      FieldName = 'REMOTE_SERVER'
      Size = 50
    end
    object QryLabelCustEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object QryLabelCustCOMM_PORT: TStringField
      FieldName = 'COMM_PORT'
      Size = 10
    end
    object QryLabelCustREPORT_NAME: TStringField
      FieldName = 'REPORT_NAME'
      Size = 100
    end
    object QryLabelCustLABEL_KIND: TStringField
      FieldName = 'LABEL_KIND'
      Size = 10
    end
    object QryLabelCustORIGIN: TStringField
      FieldName = 'ORIGIN'
      Size = 9
    end
    object QryLabelCustLABEL_TEMPLATE_ID: TBCDField
      FieldName = 'LABEL_TEMPLATE_ID'
      Size = 0
    end
  end
  object QryMfgNo: TFDQuery
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select s.mfgno,'
      '       s.id'
      '  from standard s,'
      '       partno a'
      ' where a.arinvt_id = :nID'
      '   and a.standard_id = s.id'
      '   and ( NVL(s.pk_hide, '#39'N'#39') = '#39'N'#39
      '         or'
      '         s.id = :this_standard_id'
      '         or'
      
        '         exists (select 1 from workorder where standard_id = s.i' +
        'd) )'
      ''
      'UNION ALL'
      ''
      'select standard.mfgno,'
      '       standard.id'
      '  from standard,'
      '       partno,'
      '       ptoper,'
      '       opmat'
      ' where standard.id = partno.standard_id'
      '   and partno.id = ptoper.partno_id'
      '   and ptoper.sndop_id = opmat.sndop_id'
      '   and opmat.arinvt_id = :nID'
      '   and opmat.standard_id is not NULL'
      '   and ( NVL(standard.pk_hide, '#39'N'#39') = '#39'N'#39
      '         or'
      '         standard.id = :this_standard_id'
      '         or'
      
        '         exists (select 1 from workorder where standard_id = sta' +
        'ndard.id) )'
      '         '
      '                                ')
    Left = 256
    Top = 64
    ParamData = <
      item
        Name = 'nID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'this_standard_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryMfgNoMFGNO: TStringField
      DisplayLabel = 'MfgNo'
      DisplayWidth = 25
      FieldName = 'MFGNO'
      Size = 50
    end
    object QryMfgNoID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object QryPoRec: TFDQuery
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select po.pono, po.id '
      'from po, '
      '       po_detail '
      'where po_detail.po_id = po.id'
      ' and po.vendor_id = :nId'
      ' and po_detail.arinvt_id = :nArinvtId')
    Left = 16
    Top = 120
    ParamData = <
      item
        Name = 'nId'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'nArinvtId'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryPoRecPONO: TStringField
      DisplayLabel = 'PoNo'
      DisplayWidth = 15
      FieldName = 'PONO'
      Size = 35
    end
    object QryPoRecID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object SrcVendor: TDataSource
    DataSet = QryVendor
    Left = 64
    Top = 8
  end
  object QryPackage: TFDQuery
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select Rtrim(a.descrip) as descrip,'
      '       Rtrim(a.itemno) as itemno,'
      '       o.weight,'
      '       o.arinvt_id,'
      
        '       UOM.IQConvert( o.unit, a.unit, o.ptsper, o.arinvt_id, '#39'Y'#39 +
        ' ) as ptsper,'
      '       o.seq,'
      '       s.id,'
      '       p.boxno,'
      '       p.id as partno_id,'
      '       o.tare_weight,'
      '       a.volume'
      '  from partno p,'
      '       sndop s,'
      '       opmat o,'
      '       arinvt a,'
      '       ptoper t,'
      '       arinvt a2,'
      '       standard std'
      ' where ( s.op_class = '#39'PK'#39
      '         or'
      
        '         t.use_for_label_print = '#39'Y'#39' )    /* 03-13-2012 support ' +
        'for assy1 */'
      '   and p.arinvt_id = :nId'
      '   and t.partno_id = p.id'
      '   and t.sndop_id = s.id'
      '   and o.sndop_id = s.id'
      '   and o.arinvt_id = a.id(+)'
      '   and a2.id = :nId'
      '   and p.standard_id = std.id'
      '   and ( NVL(std.pk_hide, '#39'N'#39') = '#39'N'#39
      '         or'
      '         std.id = :this_standard_id )'
      ' order by '
      '       decode( sign(a2.standard_id - p.standard_id), 0, 1, 2 ),'
      '       o.seq       '
      ''
      '  '
      ''
      ' ')
    Left = 108
    Top = 92
    ParamData = <
      item
        Name = 'nId'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'this_standard_id'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  object QryBillTo: TFDQuery
    BeforeOpen = QryBillToBeforeOpen
    AfterOpen = QryBillToAfterOpen
    ConnectionName = 'IQFD'
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
      ' from  bill_to '
      'where arcusto_id = :nId      '
      'and NVL(pk_hide, '#39'N'#39') = '#39'N'#39
      'and (nvl(:ForceBillToId, 0) = 0 or (id = :ForceBillToId))')
    Left = 16
    Top = 176
    ParamData = <
      item
        Name = 'nId'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'FORCEBILLTOID'
        DataType = ftBCD
        ParamType = ptInput
        Value = Null
      end>
    object QryBillToATTN: TStringField
      DisplayLabel = 'Ship To'
      DisplayWidth = 15
      FieldName = 'ATTN'
      Origin = 'IQ.BILL_TO.ATTN'
      Size = 60
    end
    object QryBillToADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 15
      FieldName = 'ADDR1'
      Origin = 'IQ.BILL_TO.ADDR1'
      Size = 60
    end
    object QryBillToADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 15
      FieldName = 'ADDR2'
      Origin = 'IQ.BILL_TO.ADDR2'
      Size = 60
    end
    object QryBillToCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 15
      FieldName = 'CITY'
      Origin = 'IQ.BILL_TO.CITY'
      FixedChar = True
      Size = 30
    end
    object QryBillToSTATE: TStringField
      DisplayLabel = 'State or Region'
      DisplayWidth = 2
      FieldName = 'STATE'
      Origin = 'IQ.BILL_TO.STATE'
      FixedChar = True
      Size = 5
    end
    object QryBillToZIP: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 10
      FieldName = 'ZIP'
      Origin = 'IQ.BILL_TO.ZIP'
      FixedChar = True
      Size = 10
    end
    object QryBillToID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object QrylabelDtl: TFDQuery
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * '
      '  from lm_Labels_detail '
      ' where lm_labels_id = :nID'
      ' order by field_name')
    Left = 424
    Top = 120
    ParamData = <
      item
        Name = 'nID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QrylabelDtlLM_LABELS_ID: TBCDField
      FieldName = 'LM_LABELS_ID'
      Size = 0
    end
    object QrylabelDtlFIELD_NAME: TStringField
      FieldName = 'FIELD_NAME'
      Size = 10
    end
    object QrylabelDtlFIELD_TYPE: TStringField
      FieldName = 'FIELD_TYPE'
      Size = 9
    end
    object QrylabelDtlWIDTH: TBCDField
      FieldName = 'WIDTH'
      Size = 0
    end
    object QrylabelDtlDEC: TBCDField
      FieldName = 'DEC'
      Size = 0
    end
    object QrylabelDtlACT_WIDTH: TBCDField
      FieldName = 'ACT_WIDTH'
      Size = 0
    end
  end
  object SrcLabels: TDataSource
    DataSet = QryLabels
    Left = 268
    Top = 165
  end
  object SrcPackage: TDataSource
    DataSet = QryPackage
    Left = 112
    Top = 180
  end
  object wwQryCustomer: TFDQuery
    BeforeOpen = wwQryCustomerBeforeOpen
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       custno,'
      '       company,'
      '       pk_hide'
      '  from v_arcusto'
      ' where id in '
      '          (select arcusto_id'
      '             from arinvt'
      '            where id = :arinvt_id'
      '            UNION'
      '           select arcusto_id'
      '             from aka'
      '            where arinvt_id = :arinvt_id)'
      '       and'
      '          case '
      
        '            when nvl(:arcusto_id,0) = 0 then 0   /* when arcusto' +
        '_id is not assigned allow aka and default */'
      
        '            else nvl(:do_not_default_arcusto,0)  /* arinvt only ' +
        'if do_not_default_arcusto = 0 */'
      
        '          end = nvl(:do_not_default_arcusto,0)   /* otherwise do' +
        ' not show these customers     */'
      '    or'
      '      id = :arcusto_id'
      ' '
      ' ')
    Left = 324
    Top = 184
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'do_not_default_arcusto'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'arcusto_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object wwQryCustomerCOMPANY: TStringField
      DisplayLabel = 'Customer Name'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Size = 60
    end
    object wwQryCustomerCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Size = 10
    end
    object wwQryCustomerID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object wwQryCustomerPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object SrcPORecvLables: TDataSource
    DataSet = QryPORecvLables
    Left = 105
    Top = 237
  end
  object QryPORecvLables: TFDQuery
    Tag = 1
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select qty, id'
      '  from po_receipts_labels'
      ' where po_receipts_id = :po_receipts_id'
      '   and NVL(qty,0) > 0 '
      ' order by id')
    Left = 161
    Top = 286
    ParamData = <
      item
        Name = 'po_receipts_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryPORecvLablesQTY: TBCDField
      DisplayWidth = 25
      FieldName = 'QTY'
      Origin = 'IQ.PO_RECEIPTS_LABELS.QTY'
    end
    object QryPORecvLablesID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
  end
  object SrcRMALabels: TDataSource
    DataSet = QryRMALabels
    Left = 260
    Top = 239
  end
  object QryRMALabels: TFDQuery
    Tag = 1
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select '
      '       w.qty,'
      '       m.serial,'
      '       v.loc_desc,'
      '       v.lotno,'
      '       w.reprint,'
      '       w.id,'
      '       w.fgmulti_id,'
      '       w.master_label_id'
      '  from work_rma_labels w,'
      '       v_fgmulti_locations v,'
      '       master_label m'
      ' where w.batch = :batch'
      '   and w.fgmulti_id = v.id'
      '   and w.master_label_id = m.id(+)'
      ' order by w.fgmulti_id, w.id')
    Left = 261
    Top = 252
    ParamData = <
      item
        Name = 'batch'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryRMALabelsQTY: TFMTBCDField
      DisplayLabel = 'Qty'
      FieldName = 'QTY'
      Size = 6
    end
    object QryRMALabelsSERIAL: TStringField
      DisplayLabel = 'Serial #'
      FieldName = 'SERIAL'
      Size = 13
    end
    object QryRMALabelsLOC_DESC: TStringField
      DisplayLabel = 'Location'
      DisplayWidth = 20
      FieldName = 'LOC_DESC'
      FixedChar = True
      Size = 30
    end
    object QryRMALabelsLOTNO: TStringField
      DisplayLabel = 'Lot #'
      DisplayWidth = 10
      FieldName = 'LOTNO'
      FixedChar = True
      Size = 25
    end
    object QryRMALabelsREPRINT: TStringField
      DisplayLabel = 'Print'
      FieldName = 'REPRINT'
      FixedChar = True
      Size = 1
    end
    object QryRMALabelsID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryRMALabelsFGMULTI_ID: TBCDField
      FieldName = 'FGMULTI_ID'
      Visible = False
      Size = 0
    end
    object QryRMALabelsMASTER_LABEL_ID: TBCDField
      FieldName = 'MASTER_LABEL_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcMasterLabelPlan: TDataSource
    DataSet = QryMasterLabelPlan
    Left = 103
    Top = 326
  end
  object QryMasterLabelPlan: TFDQuery
    Tag = 1
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       batch,'
      '       labels_count,'
      '       qty,'
      '       exist_master_label_id'
      '  from master_label_plan'
      ' where batch = :batch '
      'order by id')
    Left = 104
    Top = 345
    ParamData = <
      item
        Name = 'batch'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryMasterLabelPlanID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.MASTER_LABEL_PLAN.ID'
      Size = 0
    end
    object QryMasterLabelPlanBATCH: TBCDField
      FieldName = 'BATCH'
      Origin = 'IQ.MASTER_LABEL_PLAN.BATCH'
      Size = 0
    end
    object QryMasterLabelPlanLABELS_COUNT: TBCDField
      FieldName = 'LABELS_COUNT'
      Origin = 'IQ.MASTER_LABEL_PLAN.LABELS_COUNT'
      Size = 0
    end
    object QryMasterLabelPlanQTY: TBCDField
      FieldName = 'QTY'
      Origin = 'IQ.MASTER_LABEL_PLAN.QTY'
    end
    object QryMasterLabelPlanEXIST_MASTER_LABEL_ID: TBCDField
      FieldName = 'EXIST_MASTER_LABEL_ID'
      Origin = 'IQ.MASTER_LABEL_PLAN.EXIST_MASTER_LABEL_ID'
      Visible = False
      Size = 0
    end
  end
  object QryPackageWorkorderBOM: TFDQuery
    BeforeOpen = QryPackageWorkorderBOMBeforeOpen
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select rtrim(a.descrip) as descrip,'
      '       rtrim(a.itemno) as itemno,'
      '       o.weight,'
      '       w.arinvt_id,'
      '       w.ptsper_internal as ptsper,'
      '       o.seq,'
      '       o.sndop_id as id,'
      '       p.boxno,'
      '       p.id as partno_id,'
      '       o.tare_weight,'
      '       a.volume       '
      '  from workorder_bom w, '
      '       arinvt a, '
      '       opmat o,'
      '       partno p'
      ' where w.workorder_id = :workorder_id'
      '   and w.arinvt_id = a.id'
      '   and w.kind <> '#39'TOP ITEM'#39
      '   and nvl(a.phantom, '#39'N'#39') <> '#39'Y'#39
      '   and w.opmat_id = o.id(+)'
      '   and w.parent_arinvt_id = p.arinvt_id(+)'
      '   and w.parent_standard_id = p.standard_id(+)'
      '   and a.class = '#39'PK'#39
      ' order by o.seq, '
      '          w.id'
      '                 '
      '          ')
    Left = 108
    Top = 136
    ParamData = <
      item
        Name = 'workorder_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryPackageWorkorderBOMDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Size = 100
    end
    object QryPackageWorkorderBOMITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object QryPackageWorkorderBOMWEIGHT: TFMTBCDField
      DisplayLabel = 'Weight'
      FieldName = 'WEIGHT'
      Size = 6
    end
    object QryPackageWorkorderBOMARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryPackageWorkorderBOMPTSPER: TFMTBCDField
      DisplayLabel = 'Pts Per'
      FieldName = 'PTSPER'
      Size = 6
    end
    object QryPackageWorkorderBOMSEQ: TBCDField
      DisplayLabel = 'Seq'
      FieldName = 'SEQ'
      Size = 0
    end
    object QryPackageWorkorderBOMID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryPackageWorkorderBOMBOXNO: TBCDField
      DisplayLabel = 'Box #'
      FieldName = 'BOXNO'
      Size = 0
    end
    object QryPackageWorkorderBOMPARTNO_ID: TBCDField
      FieldName = 'PARTNO_ID'
      Visible = False
      Size = 0
    end
    object QryPackageWorkorderBOMTARE_WEIGHT: TFMTBCDField
      DisplayLabel = 'Tare'
      FieldName = 'TARE_WEIGHT'
      Size = 6
    end
    object QryPackageWorkorderBOMVOLUME: TFMTBCDField
      DisplayLabel = 'Volume'
      FieldName = 'VOLUME'
      Size = 6
    end
  end
  object dbxCalcTotalWeight: TFDStoredProc
    ConnectionName = 'IQFD'
    StoredProcName = 'IQMS.BOL_MISC.CALC_TOTAL_WEIGHT_VOLUME'
    Left = 424
    Top = 16
    ParamData = <
      item
        Position = 1
        Name = 'V_STANDARD_ID'
        DataType = ftFMTBcd
        FDDataType = dtFmtBCD
        Precision = 38
        NumericScale = 38
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'V_ARINVT_ID'
        DataType = ftFMTBcd
        FDDataType = dtFmtBCD
        Precision = 38
        NumericScale = 38
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'V_WORKORDER_ID'
        DataType = ftFMTBcd
        FDDataType = dtFmtBCD
        Precision = 38
        NumericScale = 38
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'V_MAIN_QTY'
        DataType = ftFMTBcd
        FDDataType = dtFmtBCD
        Precision = 38
        NumericScale = 38
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'V_IS_WORKORDER_BOM'
        DataType = ftString
        FDDataType = dtAnsiString
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'V_WEIGHT'
        DataType = ftFMTBcd
        FDDataType = dtFmtBCD
        Precision = 38
        NumericScale = 38
        ParamType = ptInputOutput
      end
      item
        Position = 7
        Name = 'V_VOLUME'
        DataType = ftFMTBcd
        FDDataType = dtFmtBCD
        Precision = 38
        NumericScale = 38
        ParamType = ptInputOutput
      end>
  end
  object SrcDimInv: TDataSource
    DataSet = QryDimInv
    OnDataChange = SrcDimInvDataChange
    Left = 248
    Top = 328
  end
  object QryDimInv: TFDQuery
    Tag = 1
    BeforePost = QryDimInvBeforePost
    AfterPost = QryDimInvAfterPost
    CachedUpdates = True
    ConnectionName = 'IQFD'
    UpdateObject = UpdateSQLDimInv
    SQL.Strings = (
      '  SELECT id,'
      '         DECODE(RTRIM(uom),'
      '                NULL, name,'
      '                name || '#39' ('#39' || RTRIM(LOWER(uom)) || '#39')'#39')'
      '            AS name,'
      '         nvalue,'
      '         arinvt_dim_id,'
      '         calculated,'
      '         formula'
      '    FROM gtt_master_label_dim'
      'ORDER BY name')
    Left = 456
    Top = 376
    object QryDimInvNAME: TStringField
      DisplayLabel = 'Dim/Characteristic'
      DisplayWidth = 30
      FieldName = 'NAME'
      Origin = 'IQ.GTT_MASTER_LABEL_DIM.NAME'
      ReadOnly = True
      Size = 73
    end
    object QryDimInvNVALUE: TFMTBCDField
      DisplayLabel = 'Value'
      DisplayWidth = 13
      FieldName = 'NVALUE'
      Origin = 'IQ.GTT_MASTER_LABEL_DIM.NVALUE'
      Size = 6
    end
    object QryDimInvID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.GTT_MASTER_LABEL_DIM.ID'
      Visible = False
      Size = 0
    end
    object QryDimInvARINVT_DIM_ID: TBCDField
      Tag = 1
      FieldName = 'ARINVT_DIM_ID'
      Visible = False
      Size = 0
    end
    object QryDimInvCALCULATED: TStringField
      FieldName = 'CALCULATED'
      Visible = False
      Size = 1
    end
    object QryDimInvFORMULA: TStringField
      FieldName = 'FORMULA'
      Visible = False
      Size = 2000
    end
  end
  object UpdateSQLDimInv: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into gtt_master_label_dim'
      '  (NVALUE)'
      'values'
      '  (:NVALUE)')
    ModifySQL.Strings = (
      'update gtt_master_label_dim'
      'set'
      '  NVALUE = :NVALUE'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from gtt_master_label_dim'
      'where'
      '  ID = :OLD_ID')
    Left = 248
    Top = 392
  end
  object QryShipTo: TFDQuery
    BeforeOpen = QryShipToBeforeOpen
    AfterOpen = QryShipToAfterOpen
    ConnectionName = 'IQFD'
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
      ' from  ship_to '
      'where arcusto_id = :nId      '
      'and NVL(pk_hide, '#39'N'#39') = '#39'N'#39
      'and (nvl(:ForceShipToId, 0) = 0 or (id = :ForceShipToId))'
      '')
    Left = 16
    Top = 240
    ParamData = <
      item
        Name = 'nId'
        DataType = ftBCD
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'FORCESHIPTOID'
        DataType = ftBCD
        ParamType = ptInput
        Value = Null
      end>
    object QryShipToATTN: TStringField
      DisplayLabel = 'Bill To'
      DisplayWidth = 15
      FieldName = 'ATTN'
      Origin = 'SHIP_TO.ATTN'
      Size = 60
    end
    object QryShipToADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 15
      FieldName = 'ADDR1'
      Origin = 'SHIP_TO.ADDR1'
      Size = 60
    end
    object QryShipToADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 15
      FieldName = 'ADDR2'
      Origin = 'SHIP_TO.ADDR2'
      Size = 60
    end
    object QryShipToCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 15
      FieldName = 'CITY'
      Origin = 'SHIP_TO.CITY'
      FixedChar = True
      Size = 30
    end
    object QryShipToSTATE: TStringField
      DisplayLabel = 'State or Region'
      DisplayWidth = 2
      FieldName = 'STATE'
      Origin = 'SHIP_TO.STATE'
      FixedChar = True
    end
    object QryShipToZIP: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 10
      FieldName = 'ZIP'
      Origin = 'SHIP_TO.ZIP'
      FixedChar = True
      Size = 10
    end
    object QryShipToID: TBCDField
      FieldName = 'ID'
      Origin = 'SHIP_TO.ID'
      Visible = False
      Size = 0
    end
  end
  object QryNonSerialLabels: TFDQuery
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT id,'
      '       arcusto_id,'
      '       label_file,'
      '       label_menu_name,'
      '       label_type,'
      '       label_kind,'
      '       remote_server,'
      '       eplant_id,'
      '       comm_port,'
      '       2 AS sort_column,'
      '       '#39'LABELS'#39' AS origin,'
      '       report_name,'
      '       crw_label_copies,'
      '       UPPER(label_menu_name) AS upper_label_menu_name,'
      '       label_template_id'
      '  FROM lm_labels'
      ' WHERE label_type = '#39'MANUFACTURED'#39' AND'
      '       label_kind = '#39'NONSERIAL'#39' AND'
      '       misc.eplant_filter(eplant_id) = 1 AND'
      '       (RTRIM(report_name) IS NOT NULL OR'
      '        label_template_id IS NOT NULL OR'
      '        EXISTS (SELECT 1'
      '                  FROM lm_labels_detail'
      '                 WHERE lm_labels_id = lm_labels.id))')
    Left = 352
    Top = 120
    object QryNonSerialLabelsLABEL_MENU_NAME: TStringField
      DisplayLabel = 'Label'
      DisplayWidth = 25
      FieldName = 'LABEL_MENU_NAME'
      Size = 25
    end
    object QryNonSerialLabelsORIGIN: TStringField
      DisplayLabel = 'Label Origin'
      DisplayWidth = 15
      FieldName = 'ORIGIN'
      Size = 6
    end
    object QryNonSerialLabelsREMOTE_SERVER: TStringField
      DisplayWidth = 50
      FieldName = 'REMOTE_SERVER'
      Visible = False
      Size = 50
    end
    object QryNonSerialLabelsEPLANT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
    object QryNonSerialLabelsCOMM_PORT: TStringField
      DisplayWidth = 10
      FieldName = 'COMM_PORT'
      Visible = False
      Size = 10
    end
    object QryNonSerialLabelsREPORT_NAME: TStringField
      DisplayWidth = 100
      FieldName = 'REPORT_NAME'
      Visible = False
      Size = 100
    end
    object QryNonSerialLabelsCRW_LABEL_COPIES: TBCDField
      DisplayWidth = 10
      FieldName = 'CRW_LABEL_COPIES'
      Visible = False
      Size = 0
    end
    object QryNonSerialLabelsLABEL_KIND: TStringField
      DisplayWidth = 10
      FieldName = 'LABEL_KIND'
      Visible = False
      Size = 10
    end
    object QryNonSerialLabelsID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryNonSerialLabelsARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object QryNonSerialLabelsLABEL_FILE: TStringField
      FieldName = 'LABEL_FILE'
      Visible = False
      Size = 25
    end
    object QryNonSerialLabelsLABEL_TYPE: TStringField
      FieldName = 'LABEL_TYPE'
      Visible = False
      Size = 25
    end
    object QryNonSerialLabelsLABEL_TEMPLATE_ID: TBCDField
      FieldName = 'LABEL_TEMPLATE_ID'
      Size = 0
    end
  end
end
