object FrmInvRelieveToParentDialog: TFrmInvRelieveToParentDialog
  Left = 0
  Top = 0
  ClientHeight = 205
  ClientWidth = 467
  Caption = 'Relieve Inventory To ...'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 162
    Width = 467
    Height = 43
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitTop = 106
    ExplicitWidth = 438
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 465
      Height = 3
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
      ExplicitWidth = 436
    end
    object Panel2: TUniPanel
      Left = 280
      Top = 4
      Width = 186
      Height = 38
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitLeft = 251
      object btnOK: TUniButton
        Left = 9
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 98
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 467
    Height = 162
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitWidth = 438
    ExplicitHeight = 106
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 465
      Height = 41
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      ExplicitWidth = 436
      object Label1: TUniLabel
        Left = 32
        Top = 16
        Width = 283
        Height = 13
        Hint = ''
        Caption = 'About to relieve inventory and return Kanban card to rack.'
        TabOrder = 1
      end
    end
    object pnlRelieveTo: TUniPanel
      Left = 1
      Top = 42
      Width = 465
      Height = 119
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      ExplicitWidth = 436
      ExplicitHeight = 63
      object lblRelieveTo: TUniLabel
        Left = 32
        Top = 6
        Width = 101
        Height = 13
        Hint = ''
        Caption = 'Relieve Inventory To'
        TabOrder = 2
      end
      object wwDBComboDlgRelieveTo: TUniEdit
        Left = 32
        Top = 25
        Width = 283
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 0
        OnKeyDown = wwDBComboDlgRelieveToKeyDown
      end
    end
  end
  object PkWorkOrder: TIQWebHpick
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select  workorder.id as id,'
      '        standard.mfgno as mfgno,'
      '        arinvt.itemno as itemno,'
      '        arinvt.descrip as descrip,'
      '        arinvt.descrip2 as descrip2,'
      '        arinvt.rev as rev,'
      '        workorder.eplant_id as eplant_id,'
      '        workorder.cycles_req as cycles_req,'
      '        workorder.bucket as bucket,'
      '        workorder.origin as origin,'
      
        '        workorder_misc.is_item_consumed( arinvt.id ) as max_leve' +
        'l,'
      '        standard.mfg_type as mfg_type,'
      '        NVL(workorder.firm, '#39' '#39') as firm'
      '   from workorder, '
      '        standard, '
      '        partno, '
      '        arinvt'
      '  where workorder.standard_id = standard.id'
      '    and partno.arinvt_id = arinvt.id'
      '    and partno.standard_id = standard.id'
      '    and decode( standard.mfg_type, '
      '                '#39'EXTRUSION2'#39', NVL(partno.actcav,0), '
      '                '#39'COMPOUND1'#39', NVL(partno.actcav,0), '
      '                1 ) > 0'
      '    and misc.eplant_filter( workorder.eplant_id ) = 1'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 5
    Top = 115
    object PkWorkOrderID: TBCDField
      DisplayLabel = 'Work Order #'
      DisplayWidth = 10
      FieldName = 'ID'
      Size = 0
    end
    object PkWorkOrderMFGNO: TStringField
      DisplayLabel = 'Manufacturing #'
      FieldName = 'MFGNO'
      Size = 50
    end
    object PkWorkOrderITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 20
      FieldName = 'ITEMNO'
      Size = 50
    end
    object PkWorkOrderDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Size = 100
    end
    object PkWorkOrderDESCRIP2: TStringField
      DisplayLabel = 'Extended Description'
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object PkWorkOrderREV: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 3
      FieldName = 'REV'
      Size = 15
    end
    object PkWorkOrderEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'WORKORDER.EPLANT_ID'
      Size = 0
    end
    object PkWorkOrderCYCLES_REQ: TBCDField
      DisplayLabel = 'Required'
      FieldName = 'CYCLES_REQ'
      Origin = 'WORKORDER.CYCLES_REQ'
      Size = 2
    end
    object PkWorkOrderBUCKET: TBCDField
      DisplayLabel = 'Bucket'
      DisplayWidth = 5
      FieldName = 'BUCKET'
      Origin = 'WORKORDER.BUCKET'
      Size = 0
    end
    object PkWorkOrderORIGIN: TStringField
      DisplayLabel = 'Origin'
      FieldName = 'ORIGIN'
      Origin = 'WORKORDER.ORIGIN'
      Size = 10
    end
    object PkWorkOrderMFG_TYPE: TStringField
      DisplayLabel = 'Manufacturing Type'
      FieldName = 'MFG_TYPE'
      FixedChar = True
      Size = 10
    end
    object PkWorkOrderFIRM: TStringField
      DisplayLabel = 'Firm'
      FieldName = 'FIRM'
      Size = 1
    end
  end
  object PkOrdDetail: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select o.ID  as ID, '
      '       o.PONO as PoNo, '
      '       o.orderno as orderno, '
      '       a.custno  as CustNo, '
      '       a.addr1 as addr1, '
      '       a.addr2 as addr2, '
      '       a.addr3 as addr3, '
      '       a.status_id as Status, '
      '       a.company as Company, '
      '       a.phone_number as Telephone, '
      '       o.DATE_TAKEN as Date_Taken, '
      '       o.ORD_BY as Ord_By,'
      '       i.class as class,'
      '       i.rev as rev,'
      '       i.itemno as ItemNo,'
      
        '       decode(NVL(d.arinvt_id, 0), 0, misc_item, i.descrip) as d' +
        'escription,'
      '       i.descrip2 as description2,'
      
        '       (select cust_itemno  from aka where d.arinvt_id = aka.ari' +
        'nvt_id and o.arcusto_id = aka.arcusto_id and nvl(d.aka_kind, '#39'*'#39 +
        ') = nvl(aka.kind, '#39'*'#39') and misc.aka_ship_to_filter( o.arcusto_id' +
        ', d.arinvt_id, o.ship_to_id, aka.ship_to_id ) = 1) as cust_itemn' +
        'o,'
      
        '       (select cust_rev     from aka where d.arinvt_id = aka.ari' +
        'nvt_id and o.arcusto_id = aka.arcusto_id and nvl(d.aka_kind, '#39'*'#39 +
        ') = nvl(aka.kind, '#39'*'#39') and misc.aka_ship_to_filter( o.arcusto_id' +
        ', d.arinvt_id, o.ship_to_id, aka.ship_to_id ) = 1) as cust_rev,'
      
        '       (select cust_descrip from aka where d.arinvt_id = aka.ari' +
        'nvt_id and o.arcusto_id = aka.arcusto_id and nvl(d.aka_kind, '#39'*'#39 +
        ') = nvl(aka.kind, '#39'*'#39') and misc.aka_ship_to_filter( o.arcusto_id' +
        ', d.arinvt_id, o.ship_to_id, aka.ship_to_id ) = 1) as cust_descr' +
        'ip,'
      '       d.total_qty_ord as total_qty_ord,'
      
        '       NVL(d.total_qty_ord, 0) - NVL(d.cumm_shipped, 0) as Blank' +
        'et_Order_Backlog,'
      '       o.eplant_id as eplant_id,'
      '       ship_to.attn as attn,'
      '       d.is_drop_ship as is_drop_ship,'
      '       d.cumm_shipped as cumm_shipped,'
      '       o.arcusto_id as arcusto_id,'
      '       d.id as ord_detail_id'
      ''
      '-- DO NOT REMOVE THE FOLLOWING LINE       '
      '-- HPICK_FROM_START'
      '  from'
      
        '       orders o, v_arcusto a, ord_detail d, arinvt i, ship_to  /' +
        '* 08/01/2011 changed arcusto to v_arcusto CRM 533370 */'
      ' where'
      '       o.arcusto_id = a.id(+)'
      '   and misc.eplant_filter(o.eplant_id) = 1'
      '   and d.orders_id(+) = o.id '
      '   and d.arinvt_id = i.id(+)'
      '   and o.ship_to_id = ship_to.id(+)'
      '  '
      '-- HPICK_EMPTY_DATASET_FILTER_START'
      
        '-- This is used in order to speed up FieldDefs.Update inside HPi' +
        'ckFrm '
      '-- when building TFields objects'
      '   and 1 < 0'
      '-- HPICK_EMPTY_DATASET_FILTER_END'
      '  ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 34
    Top = 115
    object PkOrdDetailID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkOrdDetailPONO: TStringField
      DisplayLabel = 'PO #'
      DisplayWidth = 15
      FieldName = 'PONO'
      Size = 35
    end
    object PkOrdDetailCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      FieldName = 'CUSTNO'
      Size = 10
    end
    object PkOrdDetailCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 15
      FieldName = 'COMPANY'
      Size = 60
    end
    object PkOrdDetailDATE_TAKEN: TDateTimeField
      DisplayLabel = 'Order Date'
      FieldName = 'DATE_TAKEN'
    end
    object PkOrdDetailORD_BY: TStringField
      DisplayLabel = 'Taken By'
      DisplayWidth = 15
      FieldName = 'ORD_BY'
      Size = 30
    end
    object PkOrdDetailCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Size = 2
    end
    object PkOrdDetailREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 5
      FieldName = 'REV'
      Size = 15
    end
    object PkOrdDetailITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 15
      FieldName = 'ITEMNO'
      Size = 50
    end
    object PkOrdDetailDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIPTION'
      Size = 250
    end
    object PkOrdDetailDESCRIPTION2: TStringField
      DisplayLabel = 'Extended Description'
      DisplayWidth = 20
      FieldName = 'DESCRIPTION2'
      Size = 100
    end
    object PkOrdDetailADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 15
      FieldName = 'ADDR1'
      Size = 60
    end
    object PkOrdDetailADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 15
      FieldName = 'ADDR2'
      Size = 60
    end
    object PkOrdDetailADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 15
      FieldName = 'ADDR3'
      Size = 60
    end
    object PkOrdDetailSTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 10
      FieldName = 'STATUS'
      Origin = 'V_ORD_DETAIL_AKA.STATUS'
    end
    object PkOrdDetailCUST_ITEMNO: TStringField
      DisplayLabel = 'AKA Item #'
      DisplayWidth = 15
      FieldName = 'CUST_ITEMNO'
      Origin = 'V_ORD_DETAIL_AKA.CUST_ITEMNO'
      Size = 50
    end
    object PkOrdDetailCUST_DESCRIP: TStringField
      DisplayLabel = 'AKA Item Description'
      DisplayWidth = 25
      FieldName = 'CUST_DESCRIP'
      Origin = 'V_ORD_DETAIL_AKA.CUST_DESCRIP'
      Size = 35
    end
    object PkOrdDetailORDERNO: TStringField
      DisplayLabel = 'Order #'
      DisplayWidth = 10
      FieldName = 'ORDERNO'
      Origin = 'V_ORD_DETAIL_AKA.ORDERNO'
      Size = 15
    end
    object PkOrdDetailTOTAL_QTY_ORD: TBCDField
      DisplayLabel = 'Blanket Qty'
      FieldName = 'TOTAL_QTY_ORD'
    end
    object PkOrdDetailEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'V_ORD_DETAIL_AKA.EPLANT_ID'
      Size = 0
    end
    object PkOrdDetailATTN: TStringField
      DisplayLabel = 'Ship To '
      DisplayWidth = 20
      FieldName = 'ATTN'
      FixedChar = True
      Size = 60
    end
    object PkOrdDetailCUST_REV: TStringField
      DisplayLabel = 'AKA Rev'
      FieldName = 'CUST_REV'
      Size = 15
    end
    object PkOrdDetailIS_DROP_SHIP: TStringField
      DisplayLabel = 'Drop Ship'
      FieldName = 'IS_DROP_SHIP'
      Size = 1
    end
    object PkOrdDetailBLANKET_ORDER_BACKLOG: TFMTBCDField
      DisplayLabel = 'Blanket Order Backlog'
      FieldName = 'BLANKET_ORDER_BACKLOG'
      Size = 38
    end
    object PkOrdDetailCUMM_SHIPPED: TBCDField
      DisplayLabel = 'Qty. Shipped'
      FieldName = 'CUMM_SHIPPED'
    end
    object PkOrdDetailTELEPHONE: TStringField
      DisplayLabel = 'Telephone'
      FieldName = 'TELEPHONE'
      Size = 25
    end
    object PkOrdDetailORD_DETAIL_ID: TBCDField
      FieldName = 'ORD_DETAIL_ID'
      Visible = False
      Size = 0
    end
  end
  object PkWorkCenter: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select w.eqno as eqno,'
      '       w.cntr_desc as cntr_desc,'
      '       w.cntr_type as cntr_type,'
      '       w.ID as id,'
      '       w.eplant_id as eplant_id,'
      '       m.mfgcell as mfgcell,'
      '       d.name as division_name,'
      '       w.pk_hide as pk_hide,'
      '       w.mfg_type  as mfg_type'
      ' from work_center w,'
      '      mfgcell m,'
      '      division d'
      'where w.mfgcell_id = m.id(+)'
      '  and m.division_id = d.id(+)'
      
        '  and ( parent_id is null or mfg.work_center_belong_to_complex(w' +
        '.id) = 1)'
      '  and misc.eplant_filter( w.eplant_id ) = 1'
      '  '
      ' '
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 64
    Top = 115
    object PkWorkCenterEQNO: TStringField
      DisplayLabel = 'Work Center #'
      FieldName = 'EQNO'
      Origin = 'w.eqno'
      Size = 60
    end
    object PkWorkCenterCNTR_DESC: TStringField
      DisplayLabel = 'Description'
      FieldName = 'CNTR_DESC'
      Origin = 'w.cntr_desc'
      Size = 250
    end
    object PkWorkCenterCNTR_TYPE: TStringField
      DisplayLabel = 'Type'
      FieldName = 'CNTR_TYPE'
      Origin = 'w.cntr_type'
    end
    object PkWorkCenterID: TBCDField
      FieldName = 'ID'
      Origin = 'w.id'
      Visible = False
      Size = 0
    end
    object PkWorkCenterEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'w.eplant_id'
      Visible = False
      Size = 0
    end
    object PkWorkCenterMFGCELL: TStringField
      DisplayLabel = 'Manufacturing Cell'
      FieldName = 'MFGCELL'
      Origin = 'm.mfgcell'
      Size = 15
    end
    object PkWorkCenterDIVISION_NAME: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 15
      FieldName = 'DIVISION_NAME'
      Origin = 'd.name'
      Size = 25
    end
    object PkWorkCenterPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object PkWorkCenterMFG_TYPE: TStringField
      DisplayLabel = 'Mfg Type'
      FieldName = 'MFG_TYPE'
      FixedChar = True
      Size = 10
    end
  end
  object PkMasterLabel: TIQWebHpick
    BeforeOpen = PkMasterLabelBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select m.id as id,'
      '       m.serial as serial,'
      '       nvl(m.workorder_id, m.vin_wo_id) as workorder_id,'
      '       m.vin_no as vin_no,'
      '       m.mfgno as mfgno,'
      '       m.itemno as itemno,'
      '       m.descrip as descrip,'
      '       m.qty as qty  '
      '  from master_label m'
      ' where arinvt_id <> :arinvt_id')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 94
    Top = 115
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkMasterLabelSERIAL: TStringField
      DisplayLabel = 'Serial #'
      FieldName = 'SERIAL'
      Size = 13
    end
    object PkMasterLabelWORKORDER_ID: TFMTBCDField
      DisplayLabel = 'WO #'
      FieldName = 'WORKORDER_ID'
      Size = 38
    end
    object PkMasterLabelVIN_NO: TStringField
      DisplayLabel = 'VIN #'
      FieldName = 'VIN_NO'
      Size = 17
    end
    object PkMasterLabelMFGNO: TStringField
      DisplayLabel = 'Mfg #'
      FieldName = 'MFGNO'
      Size = 50
    end
    object PkMasterLabelITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      FixedChar = True
      Size = 50
    end
    object PkMasterLabelDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 100
    end
    object PkMasterLabelQTY: TFMTBCDField
      FieldName = 'QTY'
      Visible = False
      Size = 6
    end
    object PkMasterLabelID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
end
