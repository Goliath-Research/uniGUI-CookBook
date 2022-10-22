object CostSourceDataModule: TCostSourceDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 617
  Width = 806
  object PkProject: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'SELECT r.id AS tool_rfq_id,'
      '       r.workorderno AS workorderno,'
      '       r.rfq AS rfq,'
      '       r.project AS project,'
      '       r.buyerid AS buyerid,'
      '       o.custno AS custno,'
      '       o.company AS company,'
      '       e.id AS eplant_id,'
      '       e.name AS eplant_name'
      '  FROM tool_rfq r, arcusto o, eplant e'
      ' WHERE NVL(r.archived, '#39'N'#39') <> '#39'Y'#39' AND'
      '       NVL(r.open_wo, '#39'N'#39') = '#39'Y'#39' AND'
      '       o.id(+) = r.arcusto_id AND'
      '       e.id(+) = r.eplant_id AND'
      '       iqtool.workflow_filter(r.id) = 1 AND'
      '       misc.eplant_filter(r.eplant_id) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 40
    Top = 16
    object PkProjectTOOL_RFQ_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'TOOL_RFQ_ID'
      Origin = 'r.id'
      Visible = False
      Size = 0
    end
    object PkProjectWORKORDERNO: TStringField
      DisplayLabel = 'Work Order #'
      DisplayWidth = 10
      FieldName = 'WORKORDERNO'
      Origin = 'r.workorderno'
    end
    object PkProjectRFQ: TStringField
      DisplayLabel = 'Project #'
      DisplayWidth = 10
      FieldName = 'RFQ'
      Origin = 'r.rfq'
    end
    object PkProjectPROJECT: TStringField
      DisplayLabel = 'Project Name'
      DisplayWidth = 10
      FieldName = 'PROJECT'
      Origin = 'r.project'
      Size = 255
    end
    object PkProjectBUYERID: TStringField
      DisplayLabel = 'Buyer ID'
      DisplayWidth = 10
      FieldName = 'BUYERID'
      Origin = 'r.buyerid'
      Size = 35
    end
    object PkProjectCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Origin = 'o.custno'
      Size = 10
    end
    object PkProjectCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 10
      FieldName = 'COMPANY'
      Origin = 'o.company'
      Size = 60
    end
    object PkProjectEPLANT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'e.id'
      Visible = False
      Size = 0
    end
    object PkProjectEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 10
      FieldName = 'EPLANT_NAME'
      Origin = 'e.name'
      Size = 30
    end
  end
  object PkMROWorkOrder: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'SELECT a.id AS id,'
      '       a.id AS pmwo_dtl_id,'
      '       a.pmwo_id AS work_order_no,'
      '       a.pmjob_id AS pmjob_id,'
      '       a.wo_date AS wo_date,'
      '       a.eqno AS eqno,'
      '       a.task_number AS task_number,'
      '       a.task_description AS task_description,'
      '       a.company AS company,'
      '       a.eplant_id AS eplant_id'
      '  -- HPICK_FROM_START'
      '  FROM v_pmwo_dtl a'
      ' -- HPICK_WHERE_START'
      ' WHERE NVL(a.pk_hide, '#39'N'#39') <> '#39'Y'#39' AND'
      '       iqms.misc.eplant_filter(a.eplant_id) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 40
    Top = 136
    object PkMROWorkOrderWORK_ORDER_NO: TBCDField
      DisplayLabel = 'Work Order #'
      DisplayWidth = 10
      FieldName = 'WORK_ORDER_NO'
      Origin = 'a.pmwo_id'
      Size = 0
    end
    object PkMROWorkOrderPMWO_DTL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PMWO_DTL_ID'
      Origin = 'a.id'
      Visible = False
      Size = 0
    end
    object PkMROWorkOrderWO_DATE: TDateTimeField
      DisplayLabel = 'Work Order Date'
      FieldName = 'WO_DATE'
      Origin = 'a.wo_date'
    end
    object PkMROWorkOrderEQNO: TStringField
      DisplayLabel = 'Equipment #'
      DisplayWidth = 10
      FieldName = 'EQNO'
      Origin = 'a.eqno'
      Size = 25
    end
    object PkMROWorkOrderTASK_NUMBER: TStringField
      DisplayLabel = 'Task #'
      DisplayWidth = 25
      FieldName = 'TASK_NUMBER'
      Origin = 'a.task_number'
      Size = 50
    end
    object PkMROWorkOrderTASK_DESCRIPTION: TStringField
      DisplayLabel = 'Task Description'
      DisplayWidth = 25
      FieldName = 'TASK_DESCRIPTION'
      Origin = 'a.task_description'
      Size = 250
    end
    object PkMROWorkOrderCOMPANY: TStringField
      DisplayLabel = 'Company'
      FieldName = 'COMPANY'
      Origin = 'a.company'
      Size = 60
    end
    object PkMROWorkOrderEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'a.eplant_id'
      Visible = False
      Size = 0
    end
  end
  object PkProjectTask: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'SELECT tool_rfq_id,'
      '       tool_task_information_id,'
      '       workorderno,'
      '       rfq,'
      '       project,'
      '       buyerid,'
      '       custno,'
      '       company,'
      '       name,'
      '       itemno,'
      '       descrip,'
      '       elem_descrip,'
      '       eplant_id,'
      '       eplant_name'
      '  FROM v_pk_tool_task_cost_source')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 40
    Top = 80
    object PkProjectTaskTOOL_RFQ_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'TOOL_RFQ_ID'
      Origin = 'TOOL_RFQ_ID'
      Visible = False
      Size = 0
    end
    object PkProjectTaskTOOL_TASK_INFORMATION_ID: TBCDField
      FieldName = 'TOOL_TASK_INFORMATION_ID'
      Origin = 'TOOL_TASK_INFORMATION_ID'
      Visible = False
      Size = 0
    end
    object PkProjectTaskWORKORDERNO: TStringField
      DisplayLabel = 'Work Order #'
      DisplayWidth = 10
      FieldName = 'WORKORDERNO'
      Origin = 'WORKORDERNO'
    end
    object PkProjectTaskRFQ: TStringField
      DisplayLabel = 'Project #'
      DisplayWidth = 10
      FieldName = 'RFQ'
      Origin = 'RFQ'
    end
    object PkProjectTaskPROJECT: TStringField
      DisplayLabel = 'Project Name'
      DisplayWidth = 10
      FieldName = 'PROJECT'
      Origin = 'PROJECT'
      Size = 255
    end
    object PkProjectTaskCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Origin = 'CUSTNO'
      Size = 10
    end
    object PkProjectTaskCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 10
      FieldName = 'COMPANY'
      Origin = 'COMPANY'
      Size = 60
    end
    object PkProjectTaskBUYERID: TStringField
      DisplayLabel = 'Buyer ID'
      DisplayWidth = 10
      FieldName = 'BUYERID'
      Origin = 'BUYERID'
      Size = 35
    end
    object PkProjectTaskNAME: TStringField
      DisplayLabel = 'Task Name'
      DisplayWidth = 10
      FieldName = 'NAME'
      Origin = 'NAME'
      Size = 255
    end
    object PkProjectTaskITEMNO: TStringField
      DisplayLabel = 'Inventory Item #'
      DisplayWidth = 10
      FieldName = 'ITEMNO'
      Origin = 'ITEMNO'
      Size = 50
    end
    object PkProjectTaskDESCRIP: TStringField
      DisplayLabel = 'Inventory Item Description'
      DisplayWidth = 10
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 100
    end
    object PkProjectTaskELEM_DESCRIP: TStringField
      DisplayLabel = 'Cost Element'
      DisplayWidth = 10
      FieldName = 'ELEM_DESCRIP'
      Origin = 'ELEM_DESCRIP'
      Size = 30
    end
    object PkProjectTaskEPLANT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
    object PkProjectTaskEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 10
      FieldName = 'EPLANT_NAME'
      Origin = 'EPLANT_NAME'
      Size = 30
    end
  end
  object PkJobShop: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'SELECT t.id AS id,'
      '       q.projectno AS projectno,'
      '       q.descrip AS project_descrip,'
      '       c.custno AS custno,'
      '       c.company AS company,'
      '       a.itemno AS itemno,'
      '       a.descrip AS descrip,'
      '       a.rev AS rev,'
      '       s.mfgno AS mfgno,'
      '       s.cntr_type AS cntr_type,'
      '       s.mfg_type AS mfg_type,'
      '       q.arinvt_id AS main_arinvt_id,'
      '       q.standard_id AS main_standard_id,'
      '       t.arinvt_id AS task_arinvt_id,'
      '       t.standard_id AS task_standard_id,'
      '       sndop.opno AS opno,'
      '       sndop.opdesc AS opdesc,'
      '       t.sndop_dispatch_id AS sndop_dispatch_id'
      '  FROM jobshop_rfq q,'
      '       jobshop_task t,'
      '       arinvt a,'
      '       arcusto c,'
      '       STANDARD s,'
      '       sndop'
      ' WHERE q.id = t.jobshop_rfq_id AND'
      '       t.arinvt_id = a.id(+) AND'
      '       t.standard_id = s.id(+) AND'
      '       q.arcusto_id = c.id(+) AND'
      '       t.sndop_id = sndop.id(+)')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 40
    Top = 200
    object PkJobShopID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkJobShopPROJECTNO: TStringField
      DisplayLabel = 'Project #'
      DisplayWidth = 10
      FieldName = 'PROJECTNO'
      Size = 25
    end
    object PkJobShopPROJECT_DESCRIP: TStringField
      DisplayLabel = 'Project Description'
      DisplayWidth = 35
      FieldName = 'PROJECT_DESCRIP'
      Size = 255
    end
    object PkJobShopCUSTNO: TStringField
      DisplayLabel = 'Cust #'
      FieldName = 'CUSTNO'
      FixedChar = True
      Size = 10
    end
    object PkJobShopCOMPANY: TStringField
      DisplayLabel = 'Company'
      FieldName = 'COMPANY'
      FixedChar = True
      Size = 60
    end
    object PkJobShopITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 15
      FieldName = 'ITEMNO'
      FixedChar = True
      Size = 50
    end
    object PkJobShopDESCRIP: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Size = 100
    end
    object PkJobShopREV: TStringField
      DisplayLabel = 'Item Rev'
      DisplayWidth = 10
      FieldName = 'REV'
      FixedChar = True
      Size = 15
    end
    object PkJobShopMFGNO: TStringField
      DisplayLabel = 'Mfg #'
      DisplayWidth = 15
      FieldName = 'MFGNO'
      Size = 50
    end
    object PkJobShopCNTR_TYPE: TStringField
      DisplayLabel = 'Center Type'
      DisplayWidth = 15
      FieldName = 'CNTR_TYPE'
      FixedChar = True
    end
    object PkJobShopMFG_TYPE: TStringField
      DisplayLabel = 'Mfg Type'
      FieldName = 'MFG_TYPE'
      FixedChar = True
      Size = 10
    end
    object PkJobShopMAIN_ARINVT_ID: TBCDField
      FieldName = 'MAIN_ARINVT_ID'
      Visible = False
      Size = 0
    end
    object PkJobShopMAIN_STANDARD_ID: TBCDField
      FieldName = 'MAIN_STANDARD_ID'
      Visible = False
      Size = 0
    end
    object PkJobShopTASK_ARINVT_ID: TBCDField
      FieldName = 'TASK_ARINVT_ID'
      Visible = False
      Size = 0
    end
    object PkJobShopTASK_STANDARD_ID: TBCDField
      FieldName = 'TASK_STANDARD_ID'
      Visible = False
      Size = 0
    end
    object PkJobShopOPNO: TStringField
      DisplayLabel = 'Process #'
      FieldName = 'OPNO'
      Visible = False
      Size = 15
    end
    object PkJobShopOPDESC: TStringField
      DisplayLabel = 'Process Description'
      DisplayWidth = 30
      FieldName = 'OPDESC'
      Visible = False
      Size = 60
    end
    object PkJobShopSNDOP_DISPATCH_ID: TBCDField
      DisplayLabel = 'Dispatch ID'
      FieldName = 'SNDOP_DISPATCH_ID'
      Visible = False
      Size = 0
    end
  end
  object PkJobShopTopItem: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'SELECT t.id AS id,'
      '       q.projectno AS projectno,'
      '       q.descrip AS project_descrip,'
      '       c.custno AS custno,'
      '       c.company AS company,'
      '       a.itemno AS itemno,'
      '       a.descrip AS descrip,'
      '       a.rev AS rev,'
      '       s.mfgno AS mfgno,'
      '       s.cntr_type AS cntr_type,'
      '       s.mfg_type AS mfg_type,'
      '       sndop.opno AS opno,'
      '       sndop.opdesc AS opdesc,'
      '       t.sndop_dispatch_id AS sndop_dispatch_id'
      '  FROM jobshop_rfq q,'
      '       jobshop_task t,'
      '       arinvt a,'
      '       arcusto c,'
      '       standard s,'
      '       sndop'
      ' WHERE q.arinvt_id = a.id AND'
      '       q.standard_id = s.id AND'
      '       q.arcusto_id = c.id(+) AND'
      '       q.id = t.jobshop_rfq_id AND'
      '       q.arinvt_id = t.arinvt_id AND'
      '       q.standard_id = t.standard_id AND'
      '       t.sndop_id = sndop.id(+)')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 40
    Top = 264
    object FloatField1: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object StringField1: TStringField
      DisplayLabel = 'Project #'
      DisplayWidth = 10
      FieldName = 'PROJECTNO'
      Size = 25
    end
    object StringField2: TStringField
      DisplayLabel = 'Project Description'
      DisplayWidth = 35
      FieldName = 'PROJECT_DESCRIP'
      Size = 255
    end
    object StringField3: TStringField
      DisplayLabel = 'Cust #'
      FieldName = 'CUSTNO'
      FixedChar = True
      Size = 10
    end
    object StringField4: TStringField
      DisplayLabel = 'Company'
      FieldName = 'COMPANY'
      FixedChar = True
      Size = 60
    end
    object StringField5: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 15
      FieldName = 'ITEMNO'
      FixedChar = True
      Size = 50
    end
    object StringField6: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Size = 100
    end
    object StringField7: TStringField
      DisplayLabel = 'Item Rev'
      DisplayWidth = 10
      FieldName = 'REV'
      FixedChar = True
      Size = 15
    end
    object StringField8: TStringField
      DisplayLabel = 'Mfg #'
      DisplayWidth = 15
      FieldName = 'MFGNO'
      Size = 50
    end
    object StringField9: TStringField
      DisplayLabel = 'Center Type'
      DisplayWidth = 15
      FieldName = 'CNTR_TYPE'
      FixedChar = True
    end
    object StringField10: TStringField
      DisplayLabel = 'Mfg Type'
      FieldName = 'MFG_TYPE'
      FixedChar = True
      Size = 10
    end
    object PkJobShopTopItemOPNO: TStringField
      DisplayLabel = 'Process #'
      FieldName = 'OPNO'
      Visible = False
      Size = 15
    end
    object PkJobShopTopItemOPDESC: TStringField
      DisplayLabel = 'Process Description'
      DisplayWidth = 30
      FieldName = 'OPDESC'
      Visible = False
      Size = 60
    end
    object PkJobShopTopItemSNDOP_DISPATCH_ID: TBCDField
      DisplayLabel = 'Dispatch ID'
      FieldName = 'SNDOP_DISPATCH_ID'
      Visible = False
      Size = 0
    end
  end
  object PkFixedAssets: TIQWebHpick
    Filtered = True
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'SELECT a.id AS id,'
      '       a.asset_no AS asset_no,'
      '       a.descrip AS descrip,'
      '       a.serial_number AS serial_number,'
      '       a.eplant_id AS eplant_id,'
      '       b.name AS eplant_name'
      '  FROM fa_main a, eplant b'
      ' WHERE misc.eplant_filter(a.eplant_id) = 1 AND '
      '       b.id(+) = a.eplant_id')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 40
    Top = 328
    object PkFixedAssetsID: TBCDField
      FieldName = 'ID'
      Origin = 'a.id'
      Visible = False
      Size = 0
    end
    object PkFixedAssetsASSET_NO: TStringField
      DisplayLabel = 'Asset #'
      FieldName = 'ASSET_NO'
      Origin = 'a.asset_no'
      Size = 15
    end
    object PkFixedAssetsDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'a.descrip'
      Size = 60
    end
    object PkFixedAssetsSERIAL_NUMBER: TStringField
      DisplayLabel = 'Serial #'
      FieldName = 'SERIAL_NUMBER'
      Origin = 'a.serial_number'
      Size = 60
    end
    object PkFixedAssetsEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'a.eplant_id'
      Visible = False
      Size = 0
    end
    object PkFixedAssetsEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 20
      FieldName = 'EPLANT_NAME'
      Origin = 'b.name'
      Size = 30
    end
  end
  object SrcProjectArprepost: TDataSource
    DataSet = QryProjectArprepost
    Left = 144
    Top = 16
  end
  object QryProjectArprepost: TFDQuery
    BeforeOpen = AssignQueryParams
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select'
      '       h.invoice_no,'
      
        '       decode( d.arinvt_id, NULL, SubStr( g.misc_comment, 1, 35 ' +
        '), d.itemno) as invoice_itemno,'
      '       tl_rfq.rfq,'
      '       tl_rfq.workorderno,'
      '       tl_rfq.project,'
      '       tl_rfq.id as tool_rfq_id,'
      '       '#39'CURRENT'#39' as source'
      ''
      '  from'
      '       arprepost h,'
      '       arprepost_detail g,'
      '       v_arprepost_detail d,'
      '       tool_rfq tl_rfq'
      ' where'
      '   d.id = :id and'
      '   h.id = d.arprepost_id'
      '   and d.cost_object_source = :cost_object_source   '
      '   and d.cost_object_id = tl_rfq.id'
      '   and g.id = d.id'
      ''
      'UNION'
      ''
      'select'
      '       h.invoice_no,'
      
        '       decode( d.arinvt_id, NULL, SubStr( g.misc_comment, 1, 35 ' +
        '), d.itemno) as invoice_itemno,'
      '       tl_rfq.rfq,'
      '       tl_rfq.workorderno,'
      '       tl_rfq.project,'
      '       tl_rfq.id as tool_rfq_id,'
      '       '#39'HISTORY'#39' as source'
      '       '
      '  from'
      '       arprepost h,'
      '       arprepost_detail g,'
      '       v_arprepost_detail d,'
      '       tool_rfq_history tl_rfq'
      ' where'
      '   d.id = :id and'
      '   h.id = d.arprepost_id'
      '   and d.cost_object_source = :cost_object_source   '
      '   and d.cost_object_id = tl_rfq.TOOL_RFQ_ID_ORIG'
      '   and g.id = d.id')
    Left = 152
    Top = 24
    ParamData = <
      item
        Name = 'ID'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'COST_OBJECT_SOURCE'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryProjectArprepostINVOICE_NO: TStringField
      DisplayLabel = 'Invoice #'
      FieldName = 'INVOICE_NO'
      Size = 25
    end
    object QryProjectArprepostINVOICE_ITEMNO: TStringField
      DisplayLabel = 'Invoice Item #'
      FieldName = 'INVOICE_ITEMNO'
      Size = 35
    end
    object QryProjectArprepostRFQ: TStringField
      DisplayLabel = 'Project #'
      FieldName = 'RFQ'
    end
    object QryProjectArprepostWORKORDERNO: TStringField
      DisplayLabel = 'Work Order #'
      FieldName = 'WORKORDERNO'
    end
    object QryProjectArprepostPROJECT: TStringField
      DisplayLabel = 'Project'
      FieldName = 'PROJECT'
      Size = 255
    end
    object QryProjectArprepostTOOL_RFQ_ID: TBCDField
      FieldName = 'TOOL_RFQ_ID'
      Visible = False
      Size = 0
    end
    object QryProjectArprepostSOURCE: TStringField
      FieldName = 'SOURCE'
      Visible = False
      FixedChar = True
      Size = 7
    end
  end
  object SrcProjectARInvoice: TDataSource
    DataSet = QryProjectARInvoice
    Left = 144
    Top = 72
  end
  object QryProjectARInvoice: TFDQuery
    BeforeOpen = AssignQueryParams
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select'
      '       tl_rfq.id as tool_rfq_id,'
      '       h.invoice_no as invoice_no,'
      
        '       decode( NVL( d.arinvt_itemno, '#39#39'), '#39#39', SubStr( d.misc_com' +
        'ment, 1, 35 ), d.arinvt_itemno ) as invoice_itemno,'
      '       tl_rfq.rfq,'
      '       tl_rfq.workorderno,'
      '       tl_rfq.project,'
      '       '#39'CURRENT'#39' as source'
      ''
      '  from'
      '       arinvoice h,'
      '       arinvoice_detail d,'
      '       tool_rfq tl_rfq'
      ' where'
      '   d.id = :id and                               '
      '   h.id = d.arinvoice_id'
      '   and d.cost_object_source = :cost_object_source   '
      '   and d.cost_object_id = tl_rfq.id'
      ''
      'UNION'
      ''
      'select'
      '       tl_rfq.id as tool_rfq_id,'
      '       h.invoice_no as invoice_no,'
      
        '       decode( NVL( d.arinvt_itemno, '#39#39'), '#39#39', SubStr( d.misc_com' +
        'ment, 1, 35 ), d.arinvt_itemno ) as invoice_itemno,'
      '       tl_rfq.rfq,'
      '       tl_rfq.workorderno,'
      '       tl_rfq.project,'
      '       '#39'HISTORY'#39' as source'
      '       '
      '  from'
      '       arinvoice h,'
      '       arinvoice_detail d,'
      '       tool_rfq_history tl_rfq'
      ' where'
      '   d.id = :id and                               '
      '   h.id = d.arinvoice_id'
      '   and d.cost_object_source = :cost_object_source   '
      '   and d.cost_object_id = tl_rfq.TOOL_RFQ_ID_ORIG'
      '')
    Left = 152
    Top = 80
    ParamData = <
      item
        Name = 'ID'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'COST_OBJECT_SOURCE'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryProjectARInvoiceTOOL_RFQ_ID: TBCDField
      FieldName = 'TOOL_RFQ_ID'
      Origin = 'TOOL_RFQ.ID'
      Visible = False
      Size = 0
    end
    object QryProjectARInvoiceINVOICE_NO: TStringField
      DisplayLabel = 'Invoice #'
      FieldName = 'INVOICE_NO'
      Origin = 'ARINVOICE.INVOICE_NO'
      Size = 25
    end
    object QryProjectARInvoiceINVOICE_ITEMNO: TStringField
      DisplayLabel = 'Invoice Item #'
      FieldName = 'INVOICE_ITEMNO'
      Size = 35
    end
    object QryProjectARInvoiceRFQ: TStringField
      DisplayLabel = 'Project #'
      FieldName = 'RFQ'
      Origin = 'TOOL_RFQ.RFQ'
    end
    object QryProjectARInvoiceWORKORDERNO: TStringField
      DisplayLabel = 'Work Order #'
      FieldName = 'WORKORDERNO'
      Origin = 'TOOL_RFQ.WORKORDERNO'
    end
    object QryProjectARInvoicePROJECT: TStringField
      DisplayLabel = 'Project'
      FieldName = 'PROJECT'
      Origin = 'TOOL_RFQ.PROJECT'
      Size = 255
    end
    object QryProjectARInvoiceSOURCE: TStringField
      FieldName = 'SOURCE'
      Visible = False
      FixedChar = True
      Size = 7
    end
  end
  object SrcProjectTaskArprepost: TDataSource
    DataSet = QryProjectTaskArprepost
    Left = 272
    Top = 16
  end
  object QryProjectTaskArprepost: TFDQuery
    BeforeOpen = AssignQueryParams
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT h.invoice_no,'
      '       DECODE(d.arinvt_id,'
      '              NULL, SUBSTR(g.misc_comment,'
      '                           1,'
      '                           35),'
      '              d.itemno)'
      '          AS invoice_itemno,'
      '       tl_rfq.rfq,'
      '       tl_rfq.workorderno,'
      '       tl_rfq.project,'
      '       tl_rfq.id AS tool_rfq_id,'
      '       tl_task.name,'
      '       tl_task.elem_descrip,'
      
        '       DECODE(tl_task.arinvt_id, NULL, tl_task.misc_item, a.item' +
        'no) AS itemno,'
      
        '       DECODE(tl_task.arinvt_id, NULL, tl_task.misc_item, a.desc' +
        'rip)'
      '          AS item_descrip,'
      '       '#39'CURRENT'#39' AS source'
      '  FROM arprepost h,'
      '       arprepost_detail g,'
      '       v_arprepost_detail d,'
      '       tool_rfq tl_rfq,'
      '       tool_task_information tl_task,'
      '       arinvt a'
      ' WHERE d.id = :id AND'
      '       h.id = d.arprepost_id AND'
      '       d.cost_object_source = :cost_object_source AND'
      '       d.cost_object_id = tl_task.id AND'
      '       tl_rfq.id = tl_task.tool_rfq_id AND'
      '       g.id = d.id AND'
      '       a.id(+) = tl_task.arinvt_id'
      'UNION'
      'SELECT h.invoice_no,'
      '       DECODE(d.arinvt_id,'
      '              NULL, SUBSTR(g.misc_comment,'
      '                           1,'
      '                           35),'
      '              d.itemno)'
      '          AS invoice_itemno,'
      '       tl_rfq.rfq,'
      '       tl_rfq.workorderno,'
      '       tl_rfq.project,'
      '       tl_rfq.id AS tool_rfq_id,'
      '       tl_task.name,'
      '       tl_task.costelement AS elem_descrip,'
      
        '       DECODE(NVL(tl_task.itemno, '#39#39'), '#39#39', tl_task.misc_item, tl' +
        '_task.itemno)'
      '          AS itemno,'
      '       DECODE(NVL(tl_task.itemno, '#39#39'),'
      '              '#39#39', tl_task.misc_item,'
      '              tl_task.arinvt_descrip)'
      '          AS item_descrip,'
      '       '#39'HISTORY'#39' AS source'
      '  FROM arprepost h,'
      '       arprepost_detail g,'
      '       v_arprepost_detail d,'
      '       tool_rfq_history tl_rfq,'
      '       tool_task_history tl_task'
      ' WHERE d.id = :id AND'
      '       h.id = d.arprepost_id AND'
      '       d.cost_object_source = :cost_object_source AND'
      '       d.cost_object_id = tl_task.tool_task_info_id_orig AND'
      '       tl_rfq.id = tl_task.tool_rfq_hist_id AND'
      '       g.id = d.id')
    Left = 280
    Top = 24
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'COST_OBJECT_SOURCE'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryProjectTaskArprepostINVOICE_NO: TStringField
      DisplayLabel = 'Invoice #'
      FieldName = 'INVOICE_NO'
      Origin = 'INVOICE_NO'
      Size = 25
    end
    object QryProjectTaskArprepostINVOICE_ITEMNO: TStringField
      DisplayLabel = 'Invoice Item #'
      FieldName = 'INVOICE_ITEMNO'
      Origin = 'INVOICE_ITEMNO'
      Size = 50
    end
    object QryProjectTaskArprepostRFQ: TStringField
      DisplayLabel = 'Project #'
      FieldName = 'RFQ'
      Origin = 'RFQ'
    end
    object QryProjectTaskArprepostWORKORDERNO: TStringField
      DisplayLabel = 'Work Order #'
      FieldName = 'WORKORDERNO'
      Origin = 'WORKORDERNO'
    end
    object QryProjectTaskArprepostPROJECT: TStringField
      DisplayLabel = 'Project'
      FieldName = 'PROJECT'
      Origin = 'PROJECT'
      Size = 255
    end
    object QryProjectTaskArprepostNAME: TStringField
      DisplayLabel = 'Project Task'
      FieldName = 'NAME'
      Origin = 'NAME'
      Size = 255
    end
    object QryProjectTaskArprepostELEM_DESCRIP: TStringField
      DisplayLabel = 'Cost Element'
      FieldName = 'ELEM_DESCRIP'
      Origin = 'ELEM_DESCRIP'
      Size = 35
    end
    object QryProjectTaskArprepostITEMNO: TStringField
      DisplayLabel = 'Task Item #'
      FieldName = 'ITEMNO'
      Origin = 'ITEMNO'
      Size = 50
    end
    object QryProjectTaskArprepostITEM_DESCRIP: TStringField
      DisplayLabel = 'Task Item Description'
      FieldName = 'ITEM_DESCRIP'
      Origin = 'ITEM_DESCRIP'
      Size = 100
    end
    object QryProjectTaskArprepostSOURCE: TStringField
      FieldName = 'SOURCE'
      Origin = 'SOURCE'
      Visible = False
      FixedChar = True
      Size = 7
    end
    object QryProjectTaskArprepostTOOL_RFQ_ID: TBCDField
      FieldName = 'TOOL_RFQ_ID'
      Origin = 'TOOL_RFQ_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object SrcProjectTaskARInvoice: TDataSource
    DataSet = QryProjectTaskARInvoice
    Left = 272
    Top = 72
  end
  object QryProjectTaskARInvoice: TFDQuery
    BeforeOpen = AssignQueryParams
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT tl_rfq.id AS tool_rfq_id,'
      '       h.invoice_no AS invoice_no,'
      '       DECODE(NVL(d.arinvt_itemno, '#39#39'),'
      '              '#39#39', SUBSTR(d.misc_comment,'
      '                         1,'
      '                         35),'
      '              d.arinvt_itemno)'
      '          AS invoice_itemno,'
      '       tl_rfq.rfq,'
      '       tl_rfq.workorderno,'
      '       tl_rfq.project,'
      '       tl_task.name,'
      '       tl_task.elem_descrip,'
      
        '       DECODE(tl_task.arinvt_id, NULL, tl_task.misc_item, a.item' +
        'no) AS itemno,'
      
        '       DECODE(tl_task.arinvt_id, NULL, tl_task.misc_item, a.desc' +
        'rip)'
      '          AS item_descrip,'
      '       '#39'CURRENT'#39' AS source'
      '  FROM arinvoice h,'
      '       arinvoice_detail d,'
      '       tool_rfq tl_rfq,'
      '       tool_task_information tl_task,'
      '       arinvt a'
      ' WHERE d.id = :ID AND'
      '       h.id = d.arinvoice_id AND'
      '       d.cost_object_source = :COST_OBJECT_SOURCE AND'
      '       d.cost_object_id = tl_task.id AND'
      '       tl_rfq.id = tl_task.tool_rfq_id AND'
      '       a.id(+) = tl_task.arinvt_id'
      'UNION'
      'SELECT tl_rfq.id AS tool_rfq_id,'
      '       h.invoice_no AS invoice_no,'
      '       DECODE(NVL(d.arinvt_itemno, '#39#39'),'
      '              '#39#39', SUBSTR(d.misc_comment,'
      '                         1,'
      '                         35),'
      '              d.arinvt_itemno)'
      '          AS invoice_itemno,'
      '       tl_rfq.rfq,'
      '       tl_rfq.workorderno,'
      '       tl_rfq.project,'
      '       tl_task.name,'
      '       tl_task.costelement AS elem_descrip,'
      
        '       DECODE(NVL(tl_task.itemno, '#39#39'), '#39#39', tl_task.misc_item, tl' +
        '_task.itemno)'
      '          AS itemno,'
      '       DECODE(NVL(tl_task.itemno, '#39#39'),'
      '              '#39#39', tl_task.misc_item,'
      '              tl_task.arinvt_descrip)'
      '          AS item_descrip,'
      '       '#39'HISTORY'#39' AS source'
      '  FROM arinvoice h,'
      '       arinvoice_detail d,'
      '       tool_rfq_history tl_rfq,'
      '       tool_task_history tl_task'
      ' WHERE d.id = :ID AND'
      '       h.id = d.arinvoice_id AND'
      '       d.cost_object_source = :COST_OBJECT_SOURCE AND'
      '       d.cost_object_id = tl_task.tool_task_info_id_orig AND'
      '       tl_rfq.id = tl_task.tool_rfq_hist_id')
    Left = 280
    Top = 80
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'COST_OBJECT_SOURCE'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryProjectTaskARInvoiceINVOICE_NO: TStringField
      DisplayLabel = 'Invoice #'
      FieldName = 'INVOICE_NO'
      Origin = 'INVOICE_NO'
      Size = 25
    end
    object QryProjectTaskARInvoiceINVOICE_ITEMNO: TStringField
      DisplayLabel = 'Invoice Item #'
      FieldName = 'INVOICE_ITEMNO'
      Origin = 'INVOICE_ITEMNO'
      Size = 50
    end
    object QryProjectTaskARInvoiceRFQ: TStringField
      DisplayLabel = 'Project #'
      FieldName = 'RFQ'
      Origin = 'RFQ'
    end
    object QryProjectTaskARInvoiceWORKORDERNO: TStringField
      DisplayLabel = 'Work Order #'
      FieldName = 'WORKORDERNO'
      Origin = 'WORKORDERNO'
    end
    object QryProjectTaskARInvoicePROJECT: TStringField
      DisplayLabel = 'Project'
      FieldName = 'PROJECT'
      Origin = 'PROJECT'
      Size = 255
    end
    object QryProjectTaskARInvoiceNAME: TStringField
      DisplayLabel = 'Project Task'
      FieldName = 'NAME'
      Origin = 'NAME'
      Size = 255
    end
    object QryProjectTaskARInvoiceELEM_DESCRIP: TStringField
      DisplayLabel = 'Cost Element'
      FieldName = 'ELEM_DESCRIP'
      Origin = 'ELEM_DESCRIP'
      Size = 35
    end
    object QryProjectTaskARInvoiceITEMNO: TStringField
      DisplayLabel = 'Task Item #'
      FieldName = 'ITEMNO'
      Origin = 'ITEMNO'
      Size = 50
    end
    object QryProjectTaskARInvoiceITEM_DESCRIP: TStringField
      DisplayLabel = 'Task Item Description'
      FieldName = 'ITEM_DESCRIP'
      Origin = 'ITEM_DESCRIP'
      Size = 100
    end
    object QryProjectTaskARInvoiceSOURCE: TStringField
      FieldName = 'SOURCE'
      Origin = 'SOURCE'
      Visible = False
      FixedChar = True
      Size = 7
    end
    object QryProjectTaskARInvoiceTOOL_RFQ_ID: TBCDField
      Tag = 1
      FieldName = 'TOOL_RFQ_ID'
      Origin = 'TOOL_RFQ_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object SrcProjectAPInvoice: TDataSource
    DataSet = QryProjectAPInvoice
    Left = 144
    Top = 184
  end
  object QryProjectAPInvoice: TFDQuery
    BeforeOpen = AssignQueryParams
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT d.id AS id,'
      '       tl_rfq.id AS tool_rfq_id,'
      '       h.invoice_no AS invoice_no,'
      '       DECODE(NVL(d.arinvt_itemno, '#39#39'),'
      '              '#39#39', SUBSTR(d.misc_comment,'
      '                         1,'
      '                         35),'
      '              d.arinvt_itemno)'
      '          AS ap_itemno,'
      '       tl_rfq.workorderno,'
      '       tl_rfq.project,'
      
        '       DECODE(ti.arinvt_id, NULL, ti.misc_item, a.itemno) AS ite' +
        'mno,'
      
        '       DECODE(ti.arinvt_id, NULL, ti.misc_item, a.descrip) AS it' +
        'em_descrip,'
      '       ti.name,'
      '       e.elem_descrip,'
      '       '#39'CURRENT'#39' AS source'
      '  FROM apinvoice h,'
      '       apinvoice_detail d,'
      '       tool_task_information ti,'
      '       arinvt a,'
      '       elements e,'
      '       tool_rfq tl_rfq'
      ' WHERE d.id = :ID AND'
      '       h.id = d.apinvoice_id AND'
      '       d.cost_object_source = :COST_OBJECT_SOURCE AND'
      '       d.cost_object_id = ti.id AND'
      '       ti.arinvt_id = a.id(+) AND'
      '       ti.elements_id = e.id(+) AND'
      '       tl_rfq.id = ti.tool_rfq_id'
      'UNION'
      'SELECT d.id AS id,'
      '       tl_rfq.id AS tool_rfq_id,'
      '       h.invoice_no AS invoice_no,'
      '       DECODE(NVL(d.arinvt_itemno, '#39#39'),'
      '              '#39#39', SUBSTR(d.misc_comment,'
      '                         1,'
      '                         35),'
      '              d.arinvt_itemno)'
      '          AS ap_itemno,'
      '       tl_rfq.workorderno,'
      '       tl_rfq.project,'
      
        '       DECODE(NVL(ti.itemno, '#39#39'), '#39#39', ti.misc_item, ti.itemno) A' +
        'S itemno,'
      
        '       DECODE(NVL(ti.itemno, '#39#39'), '#39#39', '#39#39', ti.arinvt_descrip) AS ' +
        'item_descrip,'
      '       ti.name,'
      '       ti.costelement AS elem_descrip,'
      '       '#39'HISTORY'#39' AS source'
      '  FROM apinvoice h,'
      '       apinvoice_detail d,'
      '       tool_rfq_history tl_rfq,'
      '       tool_task_history ti'
      ' WHERE d.id = :ID AND'
      '       h.id = d.apinvoice_id AND'
      '       d.cost_object_source = :COST_OBJECT_SOURCE AND'
      '       d.cost_object_id = ti.tool_task_info_id_orig AND'
      '       tl_rfq.id = ti.tool_rfq_hist_id')
    Left = 152
    Top = 192
    ParamData = <
      item
        Name = 'ID'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'COST_OBJECT_SOURCE'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryProjectAPInvoiceINVOICE_NO: TStringField
      DisplayLabel = 'Invoice #'
      FieldName = 'INVOICE_NO'
      Size = 50
    end
    object QryProjectAPInvoiceAP_ITEMNO: TStringField
      DisplayLabel = 'Invoice Item #'
      FieldName = 'AP_ITEMNO'
      Size = 35
    end
    object QryProjectAPInvoiceWORKORDERNO: TStringField
      DisplayLabel = 'Work Order #'
      FieldName = 'WORKORDERNO'
    end
    object QryProjectAPInvoicePROJECT: TStringField
      DisplayLabel = 'Project'
      FieldName = 'PROJECT'
      Origin = 'PROJECT'
      Size = 255
    end
    object QryProjectAPInvoiceNAME: TStringField
      DisplayLabel = 'Project Task'
      FieldName = 'NAME'
      Size = 255
    end
    object QryProjectAPInvoiceELEM_DESCRIP: TStringField
      DisplayLabel = 'Cost Element'
      FieldName = 'ELEM_DESCRIP'
      Size = 30
    end
    object QryProjectAPInvoiceITEMNO: TStringField
      DisplayLabel = 'Task Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object QryProjectAPInvoiceITEM_DESCRIP: TStringField
      DisplayLabel = 'Task Item Description'
      FieldName = 'ITEM_DESCRIP'
      Origin = 'ITEM_DESCRIP'
      Size = 100
    end
    object QryProjectAPInvoiceSOURCE: TStringField
      FieldName = 'SOURCE'
      Visible = False
      FixedChar = True
      Size = 7
    end
    object QryProjectAPInvoiceTOOL_RFQ_ID: TBCDField
      Tag = 1
      FieldName = 'TOOL_RFQ_ID'
      Visible = False
      Size = 0
    end
    object QryProjectAPInvoiceID: TBCDField
      Tag = 1
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object SrcProjectApprepost: TDataSource
    DataSet = QryProjectApprepost
    Left = 144
    Top = 128
  end
  object QryProjectApprepost: TFDQuery
    BeforeOpen = AssignQueryParams
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select'
      '       h.invoice_no,'
      
        '       decode( po.arinvt_id, NULL, SubStr( d.misc_comment, 1, 35' +
        ' ), po.item_number ) as invoice_itemno, '
      '       d.po_detail_id,'
      
        '       decode(ti.arinvt_id, NULL, ti.misc_item, a.itemno) as ite' +
        'mno, '
      
        '       decode(ti.arinvt_id, NULL, ti.misc_item, a.descrip) as it' +
        'em_descrip,        '
      '       e.elem_descrip,'
      '       ti.name,'
      '       tl_rfq.rfq,'
      '       tl_rfq.workorderno,'
      '       tl_rfq.project,'
      '       ti.elements_id,'
      '       ti.arinvt_id,'
      '       tl_rfq.id as tool_rfq_id,'
      '       tl_rfq.arcusto_id as tool_arcusto_id,'
      '       '#39'CURRENT'#39' as source'
      ''
      '  from '
      '       apprepost h,'
      '       apprepost_detail d,'
      '       v_po_detail po,'
      '       tool_task_information ti,'
      '       arinvt a,'
      '       elements e,'
      '       tool_rfq tl_rfq'
      ' where '
      '   d.id = :id and -- dataset id = or source id'
      '   h.id = d.apprepost_id'
      '   and po.po_detail_id(+) = d.po_detail_id  '
      '   and d.cost_object_source = :cost_object_source'
      '   and d.cost_object_id = ti.id'
      '   and ti.arinvt_id = a.id(+) '
      '   and ti.elements_id = e.id(+)  '
      '   and ti.tool_rfq_id = tl_rfq.id(+)'
      '   '
      'UNION   '
      ''
      'select '
      '       h.invoice_no,'
      
        '       decode( po.arinvt_id, NULL, SubStr( d.misc_comment, 1, 35' +
        ' ), po.item_number ) as invoice_itemno, '
      '       d.po_detail_id,'
      
        '       decode(nvl(ti.itemno, '#39#39'), '#39#39', ti.misc_item, ti.itemno) a' +
        's itemno, '
      
        '       decode(nvl(ti.itemno, '#39#39'), '#39#39', ti.misc_item, ti.arinvt_de' +
        'scrip) as item_descrip,        '
      '       ti.costelement,'
      '       ti.name,'
      '       tl_rfq.rfq,'
      '       tl_rfq.workorderno,'
      '       tl_rfq.project,'
      '       0, -- elements_id'
      '       0, -- arinvt_id'
      '       tl_rfq.id as tool_rfq_id,'
      '       0, -- arcusto_id'
      '       '#39'HISTORY'#39' as source'
      '       '
      '  from '
      '       apprepost h,'
      '       apprepost_detail d,'
      '       v_po_detail po,'
      '       tool_task_history ti,'
      '       tool_rfq_history tl_rfq'
      ' where '
      '   d.id = :id and -- dataset id = or source id'
      '   h.id = d.apprepost_id'
      '   and po.po_detail_id(+) = d.po_detail_id  '
      '   and d.cost_object_source = :cost_object_source'
      '   and d.cost_object_id = ti.TOOL_TASK_INFO_ID_ORIG'
      '   and ti.tool_rfq_hist_id = tl_rfq.id(+)')
    Left = 152
    Top = 136
    ParamData = <
      item
        Name = 'ID'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'COST_OBJECT_SOURCE'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryProjectApprepostINVOICE_NO: TStringField
      DisplayLabel = 'Invoice #'
      FieldName = 'INVOICE_NO'
      Size = 50
    end
    object QryProjectApprepostINVOICE_ITEMNO: TStringField
      DisplayLabel = 'Invoice Item #'
      FieldName = 'INVOICE_ITEMNO'
      Size = 35
    end
    object QryProjectApprepostRFQ: TStringField
      DisplayLabel = 'Project #'
      FieldName = 'RFQ'
      Origin = 'RFQ'
    end
    object QryProjectApprepostWORKORDERNO: TStringField
      DisplayLabel = 'Work Order #'
      FieldName = 'WORKORDERNO'
    end
    object QryProjectApprepostPROJECT: TStringField
      DisplayLabel = 'Project'
      FieldName = 'PROJECT'
      Origin = 'PROJECT'
      Size = 255
    end
    object QryProjectApprepostNAME: TStringField
      DisplayLabel = 'Project Task'
      FieldName = 'NAME'
      Size = 255
    end
    object QryProjectApprepostELEM_DESCRIP: TStringField
      DisplayLabel = 'Cost Element'
      FieldName = 'ELEM_DESCRIP'
      Size = 30
    end
    object QryProjectApprepostITEMNO: TStringField
      DisplayLabel = 'Task Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object QryProjectApprepostITEM_DESCRIP: TStringField
      DisplayLabel = 'Task Item Description'
      FieldName = 'ITEM_DESCRIP'
      Size = 50
    end
    object QryProjectApprepostELEMENTS_ID: TFMTBCDField
      Tag = 1
      FieldName = 'ELEMENTS_ID'
      Visible = False
      Size = 0
    end
    object QryProjectApprepostARINVT_ID: TFMTBCDField
      Tag = 1
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryProjectApprepostTOOL_RFQ_ID: TBCDField
      Tag = 1
      FieldName = 'TOOL_RFQ_ID'
      Visible = False
      Size = 0
    end
    object QryProjectApprepostTOOL_ARCUSTO_ID: TFMTBCDField
      Tag = 1
      FieldName = 'TOOL_ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object QryProjectApprepostSOURCE: TStringField
      Tag = 1
      FieldName = 'SOURCE'
      Visible = False
      FixedChar = True
      Size = 7
    end
    object QryProjectApprepostPO_DETAIL_ID: TBCDField
      Tag = 1
      FieldName = 'PO_DETAIL_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcProjectOrders: TDataSource
    DataSet = QryProjectOrders
    Left = 144
    Top = 240
  end
  object QryProjectOrders: TFDQuery
    BeforeOpen = AssignQueryParams
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select'
      '       o.orderno,'
      
        '       decode( a.id, NULL, SubStr( d.misc_item, 1, 35 ), a.itemn' +
        'o) as oe_itemno,'
      '       tl_rfq.rfq,'
      '       tl_rfq.workorderno,'
      '       tl_rfq.project,'
      '       tl_rfq.id as tool_rfq_id,'
      '       '#39'CURRENT'#39' as source'
      ''
      '  from'
      '       orders o,'
      '       ord_detail d,'
      '       tool_rfq tl_rfq,'
      '       arinvt a'
      ' where'
      '   d.id = :id and'
      '   o.id = d.orders_id'
      '   and d.cost_object_source = :cost_object_source'
      '   and d.cost_object_id = tl_rfq.id'
      '   and a.id(+) = d.arinvt_id'
      ''
      'UNION'
      ''
      'select'
      '       o.orderno,'
      
        '       decode( a.id, NULL, SubStr( d.misc_item, 1, 35 ), a.itemn' +
        'o) as oe_itemno,'
      '       tl_rfq.rfq,'
      '       tl_rfq.workorderno,'
      '       tl_rfq.project,'
      '       tl_rfq.id as tool_rfq_id,'
      '       '#39'HISTORY'#39' as source'
      '       '
      '  from'
      '       orders o,'
      '       ord_detail d,'
      '       tool_rfq_history tl_rfq,'
      '       arinvt a'
      ' where'
      '   d.id = :id and'
      '   o.id = d.orders_id'
      '   and d.cost_object_source = :cost_object_source    '
      '   and d.cost_object_id = tl_rfq.TOOL_RFQ_ID_ORIG'
      '   and a.id(+) = d.arinvt_id')
    Left = 152
    Top = 248
    ParamData = <
      item
        Name = 'ID'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'COST_OBJECT_SOURCE'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryProjectOrdersORDERNO: TStringField
      DisplayLabel = 'Order #'
      FieldName = 'ORDERNO'
      Size = 15
    end
    object QryProjectOrdersOE_ITEMNO: TStringField
      DisplayLabel = 'Order Item #'
      FieldName = 'OE_ITEMNO'
      Size = 35
    end
    object QryProjectOrdersRFQ: TStringField
      DisplayLabel = 'Project #'
      FieldName = 'RFQ'
    end
    object QryProjectOrdersWORKORDERNO: TStringField
      DisplayLabel = 'Work Order #'
      FieldName = 'WORKORDERNO'
    end
    object QryProjectOrdersPROJECT: TStringField
      DisplayLabel = 'Project'
      FieldName = 'PROJECT'
      Size = 255
    end
    object QryProjectOrdersTOOL_RFQ_ID: TBCDField
      Tag = 1
      FieldName = 'TOOL_RFQ_ID'
      Visible = False
      Size = 0
    end
    object QryProjectOrdersSOURCE: TStringField
      FieldName = 'SOURCE'
      Visible = False
      FixedChar = True
      Size = 7
    end
  end
  object SrcProjectTaskOrders: TDataSource
    DataSet = QryProjectTaskOrders
    Left = 272
    Top = 240
  end
  object QryProjectTaskOrders: TFDQuery
    BeforeOpen = AssignQueryParams
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT o.orderno,'
      '       DECODE(d.arinvt_id,'
      '              NULL, SUBSTR(d.misc_item,'
      '                           1,'
      '                           35),'
      '              d.arinvt_itemno)'
      '          AS oe_itemno,'
      '       tl_rfq.rfq,'
      '       tl_rfq.workorderno,'
      '       tl_rfq.project,'
      '       tl_rfq.id AS tool_rfq_id,'
      '       tl_task.name,'
      '       tl_task.elem_descrip,'
      
        '       DECODE(tl_task.arinvt_id, NULL, tl_task.misc_item, a.item' +
        'no) AS itemno,'
      
        '       DECODE(tl_task.arinvt_id, NULL, tl_task.misc_item, a.desc' +
        'rip)'
      '          AS item_descrip,'
      '       '#39'CURRENT'#39' AS source'
      '  FROM hist_orders o,'
      '       hist_ord_detail d,'
      '       tool_rfq tl_rfq,'
      '       tool_task_information tl_task,'
      '       arinvt a'
      ' WHERE d.id = :id AND'
      '       o.id = d.orders_id AND'
      '       d.cost_object_source = :cost_object_source AND'
      '       d.cost_object_id = tl_task.id AND'
      '       tl_rfq.id = tl_task.tool_rfq_id AND'
      '       a.id(+) = tl_task.arinvt_id'
      'UNION'
      'SELECT o.orderno,'
      '       DECODE(d.arinvt_id,'
      '              NULL, SUBSTR(d.misc_item,'
      '                           1,'
      '                           35),'
      '              d.arinvt_itemno)'
      '          AS oe_itemno,'
      '       tl_rfq.rfq,'
      '       tl_rfq.workorderno,'
      '       tl_rfq.project,'
      '       tl_rfq.id AS tool_rfq_id,'
      '       tl_task.name,'
      '       tl_task.costelement AS elem_descrip,'
      
        '       DECODE(NVL(tl_task.itemno, '#39#39'), '#39#39', tl_task.misc_item, tl' +
        '_task.itemno)'
      '          AS itemno,'
      '       DECODE(NVL(tl_task.itemno, '#39#39'),'
      '              '#39#39', tl_task.misc_item,'
      '              tl_task.arinvt_descrip)'
      '          AS item_descrip,'
      '       '#39'HISTORY'#39' AS source'
      '  FROM hist_orders o,'
      '       hist_ord_detail d,'
      '       tool_rfq_history tl_rfq,'
      '       tool_task_history tl_task'
      ' WHERE d.id = :id AND'
      '       o.id = d.orders_id AND'
      '       d.cost_object_source = :cost_object_source AND'
      '       d.cost_object_id = tl_task.tool_task_info_id_orig AND'
      '       tl_rfq.id = tl_task.tool_rfq_hist_id')
    Left = 280
    Top = 248
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'COST_OBJECT_SOURCE'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryProjectTaskOrdersORDERNO: TStringField
      DisplayLabel = 'Order #'
      FieldName = 'ORDERNO'
      Origin = 'ORDERNO'
      Size = 15
    end
    object QryProjectTaskOrdersOE_ITEMNO: TStringField
      DisplayLabel = 'Order Item #'
      FieldName = 'OE_ITEMNO'
      Origin = 'OE_ITEMNO'
      Size = 50
    end
    object QryProjectTaskOrdersRFQ: TStringField
      DisplayLabel = 'Project #'
      FieldName = 'RFQ'
      Origin = 'RFQ'
    end
    object QryProjectTaskOrdersWORKORDERNO: TStringField
      DisplayLabel = 'Work Order #'
      FieldName = 'WORKORDERNO'
      Origin = 'WORKORDERNO'
    end
    object QryProjectTaskOrdersPROJECT: TStringField
      DisplayLabel = 'Project'
      FieldName = 'PROJECT'
      Origin = 'PROJECT'
      Size = 255
    end
    object QryProjectTaskOrdersNAME: TStringField
      DisplayLabel = 'Project Task'
      FieldName = 'NAME'
      Origin = 'NAME'
      Size = 255
    end
    object QryProjectTaskOrdersELEM_DESCRIP: TStringField
      DisplayLabel = 'Cost Element'
      FieldName = 'ELEM_DESCRIP'
      Origin = 'ELEM_DESCRIP'
      Size = 35
    end
    object QryProjectTaskOrdersITEMNO: TStringField
      DisplayLabel = 'Task Item #'
      FieldName = 'ITEMNO'
      Origin = 'ITEMNO'
      Size = 50
    end
    object QryProjectTaskOrdersITEM_DESCRIP: TStringField
      DisplayLabel = 'Task Item Description'
      FieldName = 'ITEM_DESCRIP'
      Origin = 'ITEM_DESCRIP'
      Size = 100
    end
    object QryProjectTaskOrdersSOURCE: TStringField
      FieldName = 'SOURCE'
      Origin = 'SOURCE'
      Visible = False
      FixedChar = True
      Size = 7
    end
    object QryProjectTaskOrdersTOOL_RFQ_ID: TBCDField
      Tag = 1
      FieldName = 'TOOL_RFQ_ID'
      Origin = 'TOOL_RFQ_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object SrcProjectOrderHist: TDataSource
    DataSet = QryProjectOrderHist
    Left = 144
    Top = 296
  end
  object QryProjectOrderHist: TFDQuery
    BeforeOpen = AssignQueryParams
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select'
      '       o.orderno,'
      
        '       decode( d.arinvt_id, NULL, SubStr( d.misc_item, 1, 35 ), ' +
        'd.arinvt_itemno) as oe_itemno,'
      '       tl_rfq.rfq,'
      '       tl_rfq.workorderno,'
      '       tl_rfq.project,'
      '       tl_rfq.id as tool_rfq_id,'
      '       '#39'CURRENT'#39' as source'
      ''
      '  from'
      '       hist_orders o,'
      '       hist_ord_detail d,'
      '       tool_rfq tl_rfq'
      ' where'
      '   d.id = :id and'
      '   o.id = d.orders_id'
      '   and d.cost_object_source = :cost_object_source   '
      '   and d.cost_object_id = tl_rfq.id'
      ''
      'UNION'
      ''
      'select'
      '       o.orderno,'
      
        '       decode( d.arinvt_id, NULL, SubStr( d.misc_item, 1, 35 ), ' +
        'd.arinvt_itemno) as oe_itemno,'
      '       tl_rfq.rfq,'
      '       tl_rfq.workorderno,'
      '       tl_rfq.project,'
      '       tl_rfq.id as tool_rfq_id,'
      '       '#39'HISTORY'#39' as source'
      '       '
      '  from'
      '       hist_orders o,'
      '       hist_ord_detail d,'
      '       tool_rfq_history tl_rfq'
      ' where'
      '   d.id = :id and'
      '   o.id = d.orders_id'
      '   and d.cost_object_source = :cost_object_source   '
      '   and d.cost_object_id = tl_rfq.TOOL_RFQ_ID_ORIG'
      '')
    Left = 152
    Top = 304
    ParamData = <
      item
        Name = 'ID'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'COST_OBJECT_SOURCE'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryProjectOrderHistORDERNO: TStringField
      DisplayLabel = 'Order #'
      FieldName = 'ORDERNO'
      Size = 15
    end
    object QryProjectOrderHistOE_ITEMNO: TStringField
      DisplayLabel = 'Order Item #'
      FieldName = 'OE_ITEMNO'
      Size = 35
    end
    object QryProjectOrderHistRFQ: TStringField
      DisplayLabel = 'Project #'
      FieldName = 'RFQ'
    end
    object QryProjectOrderHistWORKORDERNO: TStringField
      DisplayLabel = 'Work Order #'
      FieldName = 'WORKORDERNO'
    end
    object QryProjectOrderHistPROJECT: TStringField
      DisplayLabel = 'Project'
      FieldName = 'PROJECT'
      Size = 255
    end
    object QryProjectOrderHistTOOL_RFQ_ID: TBCDField
      Tag = 1
      FieldName = 'TOOL_RFQ_ID'
      Visible = False
      Size = 0
    end
    object QryProjectOrderHistSOURCE: TStringField
      FieldName = 'SOURCE'
      Visible = False
      FixedChar = True
      Size = 7
    end
  end
  object SrcProjectTaskOrderHist: TDataSource
    DataSet = QryProjectTaskOrderHist
    Left = 272
    Top = 296
  end
  object QryProjectTaskOrderHist: TFDQuery
    BeforeOpen = AssignQueryParams
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT o.orderno,'
      '       DECODE(d.arinvt_id,'
      '              NULL, SUBSTR(d.misc_item,'
      '                           1,'
      '                           35),'
      '              d.arinvt_itemno)'
      '          AS oe_itemno,'
      '       tl_rfq.rfq,'
      '       tl_rfq.workorderno,'
      '       tl_rfq.project,'
      '       tl_rfq.id AS tool_rfq_id,'
      '       tl_task.name,'
      '       tl_task.elem_descrip,'
      
        '       DECODE(tl_task.arinvt_id, NULL, tl_task.misc_item, a.item' +
        'no) AS itemno,'
      
        '       DECODE(tl_task.arinvt_id, NULL, tl_task.misc_item, a.desc' +
        'rip)'
      '          AS item_descrip,'
      '       '#39'CURRENT'#39' AS source'
      '  FROM hist_orders o,'
      '       hist_ord_detail d,'
      '       tool_rfq tl_rfq,'
      '       tool_task_information tl_task,'
      '       arinvt a'
      ' WHERE d.id = :id AND'
      '       o.id = d.orders_id AND'
      '       d.cost_object_source = :cost_object_source AND'
      '       d.cost_object_id = tl_task.id AND'
      '       tl_rfq.id = tl_task.tool_rfq_id AND'
      '       a.id(+) = tl_task.arinvt_id'
      'UNION'
      'SELECT o.orderno,'
      '       DECODE(d.arinvt_id,'
      '              NULL, SUBSTR(d.misc_item,'
      '                           1,'
      '                           35),'
      '              d.arinvt_itemno)'
      '          AS oe_itemno,'
      '       tl_rfq.rfq,'
      '       tl_rfq.workorderno,'
      '       tl_rfq.project,'
      '       tl_rfq.id AS tool_rfq_id,'
      '       tl_task.name,'
      '       tl_task.costelement AS elem_descrip,'
      
        '       DECODE(NVL(tl_task.itemno, '#39#39'), '#39#39', tl_task.misc_item, tl' +
        '_task.itemno)'
      '          AS itemno,'
      '       DECODE(NVL(tl_task.itemno, '#39#39'),'
      '              '#39#39', tl_task.misc_item,'
      '              tl_task.arinvt_descrip)'
      '          AS item_descrip,'
      '       '#39'HISTORY'#39' AS source'
      '  FROM hist_orders o,'
      '       hist_ord_detail d,'
      '       tool_rfq_history tl_rfq,'
      '       tool_task_history tl_task'
      ' WHERE d.id = :id AND'
      '       o.id = d.orders_id AND'
      '       d.cost_object_source = :cost_object_source AND'
      '       d.cost_object_id = tl_task.tool_task_info_id_orig AND'
      '       tl_rfq.id = tl_task.tool_rfq_hist_id')
    Left = 280
    Top = 304
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'COST_OBJECT_SOURCE'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryProjectTaskOrderHistORDERNO: TStringField
      DisplayLabel = 'Order #'
      FieldName = 'ORDERNO'
      Origin = 'ORDERNO'
      Size = 15
    end
    object QryProjectTaskOrderHistOE_ITEMNO: TStringField
      DisplayLabel = 'Order Item #'
      FieldName = 'OE_ITEMNO'
      Origin = 'OE_ITEMNO'
      Size = 50
    end
    object QryProjectTaskOrderHistRFQ: TStringField
      DisplayLabel = 'Project #'
      FieldName = 'RFQ'
      Origin = 'RFQ'
    end
    object QryProjectTaskOrderHistWORKORDERNO: TStringField
      DisplayLabel = 'Work Order #'
      FieldName = 'WORKORDERNO'
      Origin = 'WORKORDERNO'
    end
    object QryProjectTaskOrderHistPROJECT: TStringField
      DisplayLabel = 'Project'
      FieldName = 'PROJECT'
      Origin = 'PROJECT'
      Size = 255
    end
    object QryProjectTaskOrderHistNAME: TStringField
      DisplayLabel = 'Project Task'
      FieldName = 'NAME'
      Origin = 'NAME'
      Size = 255
    end
    object QryProjectTaskOrderHistELEM_DESCRIP: TStringField
      DisplayLabel = 'Cost Element'
      FieldName = 'ELEM_DESCRIP'
      Origin = 'ELEM_DESCRIP'
      Size = 35
    end
    object QryProjectTaskOrderHistITEMNO: TStringField
      DisplayLabel = 'Task Item #'
      FieldName = 'ITEMNO'
      Origin = 'ITEMNO'
      Size = 50
    end
    object QryProjectTaskOrderHistITEM_DESCRIP: TStringField
      DisplayLabel = 'Task Item Description'
      FieldName = 'ITEM_DESCRIP'
      Origin = 'ITEM_DESCRIP'
      Size = 100
    end
    object QryProjectTaskOrderHistSOURCE: TStringField
      FieldName = 'SOURCE'
      Origin = 'SOURCE'
      Visible = False
      FixedChar = True
      Size = 7
    end
    object QryProjectTaskOrderHistTOOL_RFQ_ID: TBCDField
      Tag = 1
      FieldName = 'TOOL_RFQ_ID'
      Origin = 'TOOL_RFQ_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object SrcProjectPO: TDataSource
    DataSet = QryProjectPO
    Left = 144
    Top = 352
  end
  object QryProjectPO: TFDQuery
    AfterOpen = AssignQueryParams
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select '
      '       po.pono,'
      
        '       decode(d.arinvt_id, NULL, SubStr( d.misc_item, 1, 35 ), p' +
        'o_arinvt.itemno) as po_itemno, '
      '       d.id as po_detail_id,'
      
        '       decode(ti.arinvt_id, NULL, ti.misc_item, a.itemno) as ite' +
        'mno, '
      
        '       decode(ti.arinvt_id, NULL, ti.misc_item, a.descrip) as it' +
        'em_descrip,        '
      '       e.elem_descrip,'
      '       ti.name,'
      '       tl_rfq.rfq,'
      '       tl_rfq.workorderno,'
      '       tl_rfq.project,'
      '       ti.elements_id,'
      '       ti.arinvt_id,'
      '       tl_rfq.id as tool_rfq_id,'
      '       tl_rfq.arcusto_id as tool_arcusto_id,'
      '       '#39'CURRENT'#39' as source'
      '  from po,'
      '       po_detail d,'
      '       arinvt po_arinvt,'
      '       tool_task_information ti,'
      '       arinvt a,'
      '       elements e,'
      '       tool_rfq tl_rfq'
      'where '
      '   d.id = :id                                '
      '   and po.id = d.po_id'
      '   and d.arinvt_id = po_arinvt.id(+)'
      '   and d.cost_object_source = :cost_object_source'
      '   and d.cost_object_id = ti.id                 '
      '   and ti.arinvt_id = a.id(+)                      '
      '   and ti.elements_id = e.id(+)                    '
      '   and ti.tool_rfq_id = tl_rfq.id'
      ''
      'UNION'
      ''
      'select '
      '       po.pono,'
      
        '       decode(d.arinvt_id, NULL, SubStr( d.misc_item, 1, 35 ), p' +
        'o_arinvt.itemno) as po_itemno, '
      '       d.id as po_detail_id,'
      
        '       decode(nvl(ti.itemno, '#39#39'), '#39#39', ti.misc_item, ti.itemno) a' +
        's itemno,'
      
        '       decode(nvl(ti.itemno, '#39#39'), '#39#39', ti.misc_item, ti.arinvt_de' +
        'scrip) as item_descrip,'
      '       ti.costelement as elem_descrip,'
      '       ti.name,'
      '       tl_rfq.rfq,'
      '       tl_rfq.workorderno,'
      '       tl_rfq.project,'
      '       0 as elements_id,'
      '       0 as arinvt_id,'
      '       tl_rfq.id as tool_rfq_id,'
      '       0 as tool_arcusto_id,'
      '       '#39'HISTORY'#39' as source'
      '  from po,'
      '       po_detail d,'
      '       arinvt po_arinvt,'
      '       tool_rfq_history tl_rfq,'
      '       tool_task_history ti'
      'where'
      '   d.id = :id'
      '   and po.id = d.po_id'
      '   and d.arinvt_id = po_arinvt.id(+)'
      '   and d.cost_object_source = :cost_object_source'
      
        '   and d.cost_object_id = ti.TOOL_TASK_INFO_ID_ORIG             ' +
        '    '
      '   and tl_rfq.id = ti.tool_rfq_hist_id')
    Left = 152
    Top = 360
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'COST_OBJECT_SOURCE'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryProjectPOPONO: TStringField
      DisplayLabel = 'PO #'
      FieldName = 'PONO'
      Size = 15
    end
    object QryProjectPOPO_ITEMNO: TStringField
      DisplayLabel = 'PO Item #'
      FieldName = 'PO_ITEMNO'
      Size = 35
    end
    object QryProjectPORFQ: TStringField
      DisplayLabel = 'Project #'
      FieldName = 'RFQ'
      Origin = 'RFQ'
    end
    object QryProjectPOWORKORDERNO: TStringField
      DisplayLabel = 'Work Order #'
      FieldName = 'WORKORDERNO'
    end
    object QryProjectPOPROJECT: TStringField
      DisplayLabel = 'Project'
      FieldName = 'PROJECT'
      Origin = 'PROJECT'
      Size = 255
    end
    object QryProjectPONAME: TStringField
      DisplayLabel = 'Project Task'
      FieldName = 'NAME'
      Size = 255
    end
    object QryProjectPOELEM_DESCRIP: TStringField
      DisplayLabel = 'Cost Element'
      FieldName = 'ELEM_DESCRIP'
      Size = 30
    end
    object QryProjectPOITEMNO: TStringField
      DisplayLabel = 'Task Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object QryProjectPOITEM_DESCRIP: TStringField
      DisplayLabel = 'Task Item Description'
      FieldName = 'ITEM_DESCRIP'
      Size = 50
    end
    object QryProjectPOELEMENTS_ID: TFMTBCDField
      Tag = 1
      FieldName = 'ELEMENTS_ID'
      Visible = False
      Size = 0
    end
    object QryProjectPOARINVT_ID: TFMTBCDField
      Tag = 1
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryProjectPOTOOL_RFQ_ID: TBCDField
      Tag = 1
      FieldName = 'TOOL_RFQ_ID'
      Visible = False
      Size = 0
    end
    object QryProjectPOTOOL_ARCUSTO_ID: TFMTBCDField
      Tag = 1
      FieldName = 'TOOL_ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object QryProjectPOPO_DETAIL_ID: TBCDField
      Tag = 1
      FieldName = 'PO_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object QryProjectPOSOURCE: TStringField
      FieldName = 'SOURCE'
      Visible = False
      Size = 7
    end
  end
  object SrcProjectPOHist: TDataSource
    DataSet = QryProjectPOHist
    Left = 144
    Top = 408
  end
  object QryProjectPOHist: TFDQuery
    BeforeOpen = AssignQueryParams
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select'
      '       po.pono,'
      
        '       decode(d.arinvt_id, NULL, SubStr( d.misc_item, 1, 35 ), d' +
        '.arinvt_itemno) as po_itemno,'
      '       tl_rfq.rfq,'
      '       tl_rfq.workorderno,'
      '       tl_rfq.project,'
      
        '       decode(ti.arinvt_id, NULL, ti.misc_item, a.itemno) as ite' +
        'mno,'
      
        '       decode(ti.arinvt_id, NULL, '#39#39', a.descrip) as item_descrip' +
        ','
      '       ti.name,'
      '       e.elem_descrip,'
      '       tl_rfq.id as tool_rfq_id,'
      '       '#39'CURRENT'#39' as source'
      ''
      '  from'
      '       po_hist po,'
      '       po_detail_hist d,'
      '       arinvt a,'
      '       tool_task_information ti,'
      '       elements e,'
      '       tool_rfq tl_rfq'
      ' where'
      '   d.id = :id and'
      '   po.id = d.po_id'
      '   and d.cost_object_source(+) = :cost_object_source'
      '   and d.cost_object_id = ti.id(+)'
      '   and ti.arinvt_id = a.id(+)'
      '   and ti.elements_id = e.id(+)'
      '   and ti.tool_rfq_id = tl_rfq.id(+)'
      ''
      'UNION'
      ''
      'select'
      '       po.pono,'
      
        '       decode(d.arinvt_id, NULL, SubStr( d.misc_item, 1, 35 ), d' +
        '.arinvt_itemno) as po_itemno,'
      '       tl_rfq.rfq,'
      '       tl_rfq.workorderno,'
      '       tl_rfq.project,'
      
        '       decode(nvl(ti.itemno, '#39#39'), '#39#39', ti.misc_item, ti.itemno) a' +
        's itemno,'
      
        '       decode(nvl(ti.itemno, '#39#39'), '#39#39', '#39#39', ti.arinvt_descrip) as ' +
        'item_descrip,'
      '       ti.name,'
      '       ti.costelement as elem_descrip,'
      '       tl_rfq.id as tool_rfq_id,'
      '       '#39'HISTORY'#39' as source'
      ''
      '  from'
      '       po_hist po,'
      '       po_detail_hist d,'
      '       tool_rfq_history tl_rfq,'
      '       tool_task_history ti,'
      '       arinvt a'
      ' where'
      '   d.id = :id and'
      '   po.id = d.po_id'
      '   and d.cost_object_source(+) = :cost_object_source'
      '   and d.cost_object_id = ti.TOOL_TASK_INFO_ID_ORIG'
      '   and ti.tool_rfq_hist_id = tl_rfq.id'
      '   and a.id(+) = d.arinvt_id'
      '')
    Left = 152
    Top = 416
    ParamData = <
      item
        Name = 'ID'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'COST_OBJECT_SOURCE'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryProjectPOHistPONO: TStringField
      DisplayLabel = 'PO #'
      FieldName = 'PONO'
      Size = 15
    end
    object QryProjectPOHistPO_ITEMNO: TStringField
      DisplayLabel = 'PO Item #'
      FieldName = 'PO_ITEMNO'
      Size = 35
    end
    object QryProjectPOHistRFQ: TStringField
      DisplayLabel = 'Project #'
      FieldName = 'RFQ'
      Origin = 'RFQ'
    end
    object QryProjectPOHistWORKORDERNO: TStringField
      DisplayLabel = 'Work Order #'
      FieldName = 'WORKORDERNO'
    end
    object QryProjectPOHistPROJECT: TStringField
      DisplayLabel = 'Project'
      FieldName = 'PROJECT'
      Origin = 'PROJECT'
      Size = 255
    end
    object QryProjectPOHistNAME: TStringField
      DisplayLabel = 'Project Task'
      FieldName = 'NAME'
      Size = 255
    end
    object QryProjectPOHistELEM_DESCRIP: TStringField
      DisplayLabel = 'Cost Element'
      FieldName = 'ELEM_DESCRIP'
      Size = 30
    end
    object QryProjectPOHistITEMNO: TStringField
      DisplayLabel = 'Task Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object QryProjectPOHistITEM_DESCRIP: TStringField
      DisplayLabel = 'Task Item Description'
      FieldName = 'ITEM_DESCRIP'
      Origin = 'ITEM_DESCRIP'
      Size = 100
    end
    object QryProjectPOHistTOOL_RFQ_ID: TBCDField
      Tag = 1
      FieldName = 'TOOL_RFQ_ID'
      Visible = False
      Size = 0
    end
    object QryProjectPOHistSOURCE: TStringField
      FieldName = 'SOURCE'
      Visible = False
      FixedChar = True
      Size = 7
    end
  end
  object SrcProjectGL: TDataSource
    DataSet = QryProjectGL
    Left = 144
    Top = 464
  end
  object QryProjectGL: TFDQuery
    BeforeOpen = AssignQueryParams
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT d.descrip AS gj_descrip,'
      '       NVL(d.debit, 0) + NVL(d.credit, 0) AS debit_credit,'
      '       tl_rfq.id AS tool_rfq_id, tl_rfq.workorderno, tl_rfq.rfq,'
      
        '       tl_rfq.project, ti.name, e.elem_descrip, '#39'CURRENT'#39' AS sou' +
        'rce'
      '  FROM glbatch d, tool_task_information ti, elements e,'
      '       tool_rfq tl_rfq'
      ' WHERE d.id = :ID AND'
      '       d.cost_object_source = :COST_OBJECT_SOURCE AND'
      '       d.cost_object_id = ti.id AND'
      '       ti.elements_id = e.id(+) AND'
      '       tl_rfq.id = ti.tool_rfq_id'
      'UNION'
      'SELECT d.descrip AS gj_descrip,'
      '       NVL(d.debit, 0) + NVL(d.credit, 0) AS debit_credit,'
      '       tl_rfq.id AS tool_rfq_id, tl_rfq.workorderno, tl_rfq.rfq,'
      '       tl_rfq.project, ti.name, ti.costelement AS elem_descrip,'
      '       '#39'HISTORY'#39' AS source'
      '  FROM glbatch d, tool_rfq_history tl_rfq, tool_task_history ti'
      ' WHERE d.id = :ID AND'
      '       d.cost_object_source = :COST_OBJECT_SOURCE AND'
      '       d.cost_object_id = ti.tool_task_info_id_orig AND'
      '       tl_rfq.id = ti.tool_rfq_hist_id')
    Left = 152
    Top = 472
    ParamData = <
      item
        Name = 'ID'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'COST_OBJECT_SOURCE'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryProjectGLGJ_DESCRIP: TStringField
      DisplayLabel = 'GJ Description'
      FieldName = 'GJ_DESCRIP'
      Origin = 'GJ_DESCRIP'
      Size = 120
    end
    object QryProjectGLDEBIT_CREDIT: TFMTBCDField
      DisplayLabel = 'Debit/Credit'
      FieldName = 'DEBIT_CREDIT'
      Size = 0
    end
    object QryProjectGLRFQ: TStringField
      DisplayLabel = 'Project #'
      FieldName = 'RFQ'
    end
    object QryProjectGLWORKORDERNO: TStringField
      DisplayLabel = 'Work Order #'
      FieldName = 'WORKORDERNO'
    end
    object QryProjectGLPROJECT: TStringField
      DisplayLabel = 'Project'
      FieldName = 'PROJECT'
      Size = 255
    end
    object QryProjectGLNAME: TStringField
      DisplayLabel = 'Task Name'
      FieldName = 'NAME'
      Size = 255
    end
    object QryProjectGLELEM_DESCRIP: TStringField
      DisplayLabel = 'Cost Element'
      FieldName = 'ELEM_DESCRIP'
      Size = 35
    end
    object QryProjectGLTOOL_RFQ_ID: TBCDField
      Tag = 1
      FieldName = 'TOOL_RFQ_ID'
      Visible = False
      Size = 0
    end
    object QryProjectGLSOURCE: TStringField
      FieldName = 'SOURCE'
      Visible = False
      FixedChar = True
      Size = 7
    end
  end
  object SrcProjectGJ: TDataSource
    DataSet = QryProjectGJ
    Left = 144
    Top = 520
  end
  object QryProjectGJ: TFDQuery
    BeforeOpen = AssignQueryParams
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT d.descrip AS gj_descrip,'
      '       NVL(d.debit, 0) + NVL(d.credit, 0) AS debit_credit,'
      '       tl_rfq.id AS tool_rfq_id, tl_rfq.workorderno, tl_rfq.rfq,'
      
        '       tl_rfq.project, ti.name, e.elem_descrip, '#39'CURRENT'#39' AS sou' +
        'rce'
      '  FROM glprepost_detail d, tool_task_information ti, elements e,'
      '       tool_rfq tl_rfq'
      ' WHERE d.id = :ID AND'
      '       d.cost_object_source = :COST_OBJECT_SOURCE AND'
      '       d.cost_object_id = ti.id AND'
      '       ti.elements_id = e.id(+) AND'
      '       tl_rfq.id = ti.tool_rfq_id'
      'UNION'
      'SELECT d.descrip AS gj_descrip,'
      '       NVL(d.debit, 0) + NVL(d.credit, 0) AS debit_credit,'
      '       tl_rfq.id AS tool_rfq_id, tl_rfq.workorderno, tl_rfq.rfq,'
      '       tl_rfq.project, ti.name, ti.costelement AS elem_descrip,'
      '       '#39'HISTORY'#39' AS source'
      
        '  FROM glprepost_detail d, tool_rfq_history tl_rfq, tool_task_hi' +
        'story ti'
      ' WHERE d.id = :ID AND'
      '       d.cost_object_source = :COST_OBJECT_SOURCE AND'
      '       d.cost_object_id = ti.tool_task_info_id_orig AND'
      '       tl_rfq.id = ti.tool_rfq_hist_id')
    Left = 152
    Top = 528
    ParamData = <
      item
        Name = 'ID'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'COST_OBJECT_SOURCE'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryProjectGJGJ_DESCRIP: TStringField
      DisplayLabel = 'GJ Description'
      FieldName = 'GJ_DESCRIP'
      Size = 100
    end
    object QryProjectGJDEBIT_CREDIT: TFMTBCDField
      DisplayLabel = 'Debit/Credit'
      FieldName = 'DEBIT_CREDIT'
      Size = 0
    end
    object QryProjectGJRFQ: TStringField
      DisplayLabel = 'Project #'
      FieldName = 'RFQ'
    end
    object QryProjectGJWORKORDERNO: TStringField
      DisplayLabel = 'Work Order #'
      FieldName = 'WORKORDERNO'
    end
    object QryProjectGJPROJECT: TStringField
      DisplayLabel = 'Project'
      FieldName = 'PROJECT'
      Size = 255
    end
    object QryProjectGJNAME: TStringField
      DisplayLabel = 'Project Task'
      FieldName = 'NAME'
      Size = 255
    end
    object QryProjectGJELEM_DESCRIP: TStringField
      DisplayLabel = 'Cost Element'
      FieldName = 'ELEM_DESCRIP'
      Size = 35
    end
    object QryProjectGJSOURCE: TStringField
      FieldName = 'SOURCE'
      Visible = False
      FixedChar = True
      Size = 7
    end
    object QryProjectGJTOOL_RFQ_ID: TBCDField
      Tag = 1
      FieldName = 'TOOL_RFQ_ID'
      Visible = False
      Size = 0
    end
  end
  object ActionList1: TActionList
    Left = 40
    Top = 400
    object JumpToProjectManager1: TAction
      Caption = 'Jump to Project Manager'
      OnExecute = JumpToProjectManager1Execute
    end
    object JumpToMRO1: TAction
      Caption = 'Jump to MRO'
      OnExecute = JumpToMRO1Execute
    end
    object JumpToMROWorkOrder1: TAction
      Caption = 'Jump to MRO Work Order'
      OnExecute = JumpToMROWorkOrder1Execute
    end
    object JumpToFixedAssets1: TAction
      Caption = 'Jump to Fixed Assets'
      OnExecute = JumpToFixedAssets1Execute
    end
    object JumpToJobShopProject1: TAction
      Caption = 'Jump to JobShop Project'
      OnExecute = JumpToJobShopProject1Execute
    end
    object JumpToBOM1: TAction
      Caption = 'Jump to BOM'
      OnExecute = JumpToBOM1Execute
    end
    object JumpToInventory1: TAction
      Caption = 'Jump to Inventory'
      OnExecute = JumpToInventory1Execute
    end
  end
  object SrcFixedAssetsArprepost: TDataSource
    DataSet = QryFixedAssetsArprepost
    Left = 432
    Top = 16
  end
  object QryFixedAssetsArprepost: TFDQuery
    BeforeOpen = AssignQueryParams
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select'
      '       a.invoice_no,'
      
        '       decode( c.arinvt_id, NULL, SubStr( b.misc_comment, 1, 35 ' +
        '), c.itemno) as invoice_itemno,'
      '       d.id as fa_main_id,'
      '       d.asset_no,'
      '       d.descrip,'
      '       d.serial_number,'
      '       d.in_service_date'
      '  from'
      '       arprepost a,'
      '       arprepost_detail b,'
      '       v_arprepost_detail c,'
      '       fa_main d'
      ' where'
      '   c.id = :id and'
      '   a.id = b.arprepost_id'
      '   and c.cost_object_source = '#39'FA_MAIN'#39'    '
      '   and c.cost_object_id = d.id'
      '   and b.id = c.id(+)'
      '')
    Left = 440
    Top = 24
    ParamData = <
      item
        Name = 'id'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object QryFixedAssetsArprepostINVOICE_NO: TStringField
      DisplayLabel = 'Invoice #'
      FieldName = 'INVOICE_NO'
      Size = 25
    end
    object QryFixedAssetsArprepostINVOICE_ITEMNO: TStringField
      DisplayLabel = 'Invoice Item #'
      FieldName = 'INVOICE_ITEMNO'
      Size = 35
    end
    object QryFixedAssetsArprepostASSET_NO: TStringField
      DisplayLabel = 'Asset #'
      FieldName = 'ASSET_NO'
      Size = 15
    end
    object QryFixedAssetsArprepostDESCRIP: TStringField
      DisplayLabel = 'Asset Description'
      FieldName = 'DESCRIP'
      Size = 60
    end
    object QryFixedAssetsArprepostSERIAL_NUMBER: TStringField
      DisplayLabel = 'Serial #'
      FieldName = 'SERIAL_NUMBER'
      Size = 60
    end
    object QryFixedAssetsArprepostIN_SERVICE_DATE: TDateTimeField
      DisplayLabel = 'In-Service Date'
      FieldName = 'IN_SERVICE_DATE'
    end
    object QryFixedAssetsArprepostFA_MAIN_ID: TBCDField
      Tag = 1
      FieldName = 'FA_MAIN_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcFixedAssetsARInvoice: TDataSource
    DataSet = QryFixedAssetsARInvoice
    Left = 432
    Top = 72
  end
  object QryFixedAssetsARInvoice: TFDQuery
    BeforeOpen = AssignQueryParams
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select'
      '       a.invoice_no as invoice_no,'
      
        '       decode( NVL( b.arinvt_itemno, '#39#39'), '#39#39', SubStr( b.misc_com' +
        'ment, 1, 35 ), b.arinvt_itemno ) as invoice_itemno,'
      '       c.id as fa_main_id,'
      '       c.asset_no,'
      '       c.descrip,'
      '       c.serial_number,'
      '       c.in_service_date'
      '  from'
      '       arinvoice a,'
      '       arinvoice_detail b,'
      '       fa_main c'
      ' where'
      '   b.id = :id and                               '
      '   a.id = b.arinvoice_id'
      '   and b.cost_object_source = '#39'FA_MAIN'#39'   '
      '   and b.cost_object_id = c.id'
      '')
    Left = 440
    Top = 80
    ParamData = <
      item
        Name = 'id'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object QryFixedAssetsARInvoiceINVOICE_NO: TStringField
      DisplayLabel = 'Invoice #'
      FieldName = 'INVOICE_NO'
      Size = 25
    end
    object QryFixedAssetsARInvoiceINVOICE_ITEMNO: TStringField
      DisplayLabel = 'Invoice Item #'
      FieldName = 'INVOICE_ITEMNO'
      Size = 35
    end
    object QryFixedAssetsARInvoiceASSET_NO: TStringField
      DisplayLabel = 'Asset #'
      FieldName = 'ASSET_NO'
      Size = 15
    end
    object QryFixedAssetsARInvoiceDESCRIP: TStringField
      DisplayLabel = 'Asset Description'
      FieldName = 'DESCRIP'
      Size = 60
    end
    object QryFixedAssetsARInvoiceSERIAL_NUMBER: TStringField
      DisplayLabel = 'Serial #'
      FieldName = 'SERIAL_NUMBER'
      Size = 60
    end
    object QryFixedAssetsARInvoiceIN_SERVICE_DATE: TDateTimeField
      DisplayLabel = 'In-Service Date'
      FieldName = 'IN_SERVICE_DATE'
    end
    object QryFixedAssetsARInvoiceFA_MAIN_ID: TBCDField
      FieldName = 'FA_MAIN_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcFixedAssetsApprepost: TDataSource
    DataSet = QryFixedAssetsApprepost
    Left = 432
    Top = 128
  end
  object QryFixedAssetsApprepost: TFDQuery
    BeforeOpen = AssignQueryParams
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select '
      '       h.invoice_no,'
      
        '       decode( po.arinvt_id, NULL, SubStr( d.misc_comment, 1, 35' +
        ' ), po.item_number ) as itemno, '
      '       d.po_detail_id,'
      '       f.asset_no,'
      '       f.descrip,'
      '       f.serial_number,'
      '       f.in_service_date,'
      '       f.id as fa_main_id       '
      '  from '
      '       apprepost h,'
      '       apprepost_detail d,'
      '       v_po_detail po,'
      '       arinvt a,'
      '       fa_main f'
      ' where '
      '   d.id = :id and'
      '   h.id = d.apprepost_id'
      '   and po.po_detail_id(+) = d.po_detail_id  '
      '   and d.cost_object_source(+) = '#39'FA_MAIN'#39
      '   and d.cost_object_id = f.id'
      '')
    Left = 440
    Top = 136
    ParamData = <
      item
        Name = 'id'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object QryFixedAssetsApprepostINVOICE_NO: TStringField
      DisplayLabel = 'Invoice #'
      FieldName = 'INVOICE_NO'
      Size = 50
    end
    object QryFixedAssetsApprepostITEMNO: TStringField
      DisplayLabel = 'Invoice Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object QryFixedAssetsApprepostASSET_NO: TStringField
      DisplayLabel = 'Asset #'
      FieldName = 'ASSET_NO'
      Size = 15
    end
    object QryFixedAssetsApprepostDESCRIP: TStringField
      DisplayLabel = 'Asset Description'
      FieldName = 'DESCRIP'
      Size = 60
    end
    object QryFixedAssetsApprepostSERIAL_NUMBER: TStringField
      DisplayLabel = 'Serial #'
      FieldName = 'SERIAL_NUMBER'
      Size = 60
    end
    object QryFixedAssetsApprepostIN_SERVICE_DATE: TDateTimeField
      DisplayLabel = 'In-Service Date'
      FieldName = 'IN_SERVICE_DATE'
    end
    object QryFixedAssetsApprepostFA_MAIN_ID: TBCDField
      Tag = 1
      FieldName = 'FA_MAIN_ID'
      Visible = False
      Size = 0
    end
    object QryFixedAssetsApprepostPO_DETAIL_ID: TBCDField
      Tag = 1
      FieldName = 'PO_DETAIL_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcFixedAssetsAPInvoice: TDataSource
    DataSet = QryFixedAssetsAPInvoice
    Left = 432
    Top = 184
  end
  object QryFixedAssetsAPInvoice: TFDQuery
    BeforeOpen = AssignQueryParams
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select'
      '       a.invoice_no as invoice_no,'
      
        '       decode( NVL( d.arinvt_itemno, '#39#39'), '#39#39', SubStr( d.misc_com' +
        'ment, 1, 35 ), d.arinvt_itemno ) as ap_itemno,'
      '       c.id as fa_main_id,'
      '       c.asset_no,'
      '       c.descrip,'
      '       c.serial_number,'
      '       c.in_service_date'
      '       '
      'from'
      '       apinvoice a,'
      '       apinvoice_detail d,'
      '       fa_main c'
      'where'
      '   d.id = :ID and'
      '   a.id = d.apinvoice_id'
      '   and d.cost_object_source = '#39'FA_MAIN'#39
      '   and d.cost_object_id = c.id'
      '')
    Left = 440
    Top = 192
    ParamData = <
      item
        Name = 'ID'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object QryFixedAssetsAPInvoiceINVOICE_NO: TStringField
      DisplayLabel = 'Invoice #'
      FieldName = 'INVOICE_NO'
      Size = 50
    end
    object QryFixedAssetsAPInvoiceAP_ITEMNO: TStringField
      DisplayLabel = 'Invoice Item #'
      FieldName = 'AP_ITEMNO'
      Size = 35
    end
    object QryFixedAssetsAPInvoiceASSET_NO: TStringField
      DisplayLabel = 'Asset #'
      FieldName = 'ASSET_NO'
      Size = 15
    end
    object QryFixedAssetsAPInvoiceDESCRIP: TStringField
      DisplayLabel = 'Asset Description'
      FieldName = 'DESCRIP'
      Size = 60
    end
    object QryFixedAssetsAPInvoiceSERIAL_NUMBER: TStringField
      DisplayLabel = 'Serial #'
      FieldName = 'SERIAL_NUMBER'
      Size = 60
    end
    object QryFixedAssetsAPInvoiceIN_SERVICE_DATE: TDateTimeField
      DisplayLabel = 'In-Service Date'
      FieldName = 'IN_SERVICE_DATE'
    end
    object QryFixedAssetsAPInvoiceFA_MAIN_ID: TBCDField
      Tag = 1
      FieldName = 'FA_MAIN_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcFixedAssetsOrders: TDataSource
    DataSet = QryFixedAssetsOrders
    Left = 432
    Top = 240
  end
  object QryFixedAssetsOrders: TFDQuery
    BeforeOpen = AssignQueryParams
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select'
      '       o.orderno,'
      
        '       decode( a.id, NULL, SubStr( d.misc_item, 1, 35 ), a.itemn' +
        'o) as itemno,'
      '       c.id as fa_main_id,'
      '       c.asset_no,'
      '       c.descrip,'
      '       c.serial_number,'
      '       c.in_service_date'
      '  from'
      '       orders o,'
      '       ord_detail d,'
      '       arinvt a,'
      '       fa_main c'
      ' where'
      '   d.id = :id and'
      '   o.id = d.orders_id'
      '   and d.cost_object_source = '#39'FA_MAIN'#39'    '
      '   and d.cost_object_id = c.id'
      '   and a.id(+) = d.arinvt_id'
      '')
    Left = 440
    Top = 248
    ParamData = <
      item
        Name = 'id'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object QryFixedAssetsOrdersORDERNO: TStringField
      DisplayLabel = 'Order #'
      FieldName = 'ORDERNO'
      Size = 15
    end
    object QryFixedAssetsOrdersITEMNO: TStringField
      DisplayLabel = 'Order Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object QryFixedAssetsOrdersASSET_NO: TStringField
      DisplayLabel = 'Asset #'
      FieldName = 'ASSET_NO'
      Size = 15
    end
    object QryFixedAssetsOrdersDESCRIP: TStringField
      DisplayLabel = 'Asset Description'
      FieldName = 'DESCRIP'
      Size = 60
    end
    object QryFixedAssetsOrdersSERIAL_NUMBER: TStringField
      DisplayLabel = 'Serial #'
      FieldName = 'SERIAL_NUMBER'
      Size = 60
    end
    object QryFixedAssetsOrdersIN_SERVICE_DATE: TDateTimeField
      DisplayLabel = 'In-Service Date'
      FieldName = 'IN_SERVICE_DATE'
    end
    object QryFixedAssetsOrdersFA_MAIN_ID: TBCDField
      Tag = 1
      FieldName = 'FA_MAIN_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcFixedAssetsOrderHist: TDataSource
    DataSet = QryFixedAssetsOrderHist
    Left = 432
    Top = 296
  end
  object QryFixedAssetsOrderHist: TFDQuery
    BeforeOpen = AssignQueryParams
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select'
      '       o.orderno,'
      
        '       decode( d.arinvt_id, NULL, SubStr( d.misc_item, 1, 35 ), ' +
        'd.arinvt_itemno) as itemno,'
      '       c.id as fa_main_id,'
      '       c.asset_no,'
      '       c.descrip,'
      '       c.serial_number,'
      '       c.in_service_date'
      '       '
      '  from'
      '       hist_orders o,'
      '       hist_ord_detail d,'
      '       fa_main c'
      ' where'
      '   d.id = :id and'
      '   o.id = d.orders_id'
      '   and d.cost_object_source = '#39'FA_MAIN'#39'    '
      '   and d.cost_object_id = c.id'
      '')
    Left = 440
    Top = 304
    ParamData = <
      item
        Name = 'id'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object QryFixedAssetsOrderHistORDERNO: TStringField
      DisplayLabel = 'Order #'
      FieldName = 'ORDERNO'
      Size = 15
    end
    object QryFixedAssetsOrderHistITEMNO: TStringField
      DisplayLabel = 'Order Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object QryFixedAssetsOrderHistASSET_NO: TStringField
      DisplayLabel = 'Asset #'
      FieldName = 'ASSET_NO'
      Size = 15
    end
    object QryFixedAssetsOrderHistDESCRIP: TStringField
      DisplayLabel = 'Asset Description'
      FieldName = 'DESCRIP'
      Size = 60
    end
    object QryFixedAssetsOrderHistSERIAL_NUMBER: TStringField
      DisplayLabel = 'Serial #'
      FieldName = 'SERIAL_NUMBER'
      Size = 60
    end
    object QryFixedAssetsOrderHistIN_SERVICE_DATE: TDateTimeField
      DisplayLabel = 'In-Service Date'
      FieldName = 'IN_SERVICE_DATE'
    end
    object QryFixedAssetsOrderHistFA_MAIN_ID: TBCDField
      Tag = 1
      FieldName = 'FA_MAIN_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcFixedAssetsPO: TDataSource
    DataSet = QryFixedAssetsPO
    Left = 432
    Top = 352
  end
  object QryFixedAssetsPO: TFDQuery
    BeforeOpen = AssignQueryParams
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select '
      '       po.pono,'
      
        '       decode(d.arinvt_id, NULL, SubStr( d.misc_item, 1, 35 ), p' +
        'o_arinvt.itemno) as itemno, '
      '       d.id as po_detail_id,'
      '       f.id as fa_main_id,'
      '       f.asset_no,'
      '       f.descrip,'
      '       f.serial_number,'
      '       f.in_service_date'
      '  from po,'
      '       po_detail d,'
      '       arinvt po_arinvt,'
      '       fa_main f'
      'where '
      '   d.id = :id and                               '
      '   po.id = d.po_id'
      '   and d.arinvt_id = po_arinvt.id(+)'
      '   and d.cost_object_source(+) = '#39'FA_MAIN'#39'  '
      '   and d.cost_object_id = f.id'
      '')
    Left = 440
    Top = 360
    ParamData = <
      item
        Name = 'id'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object QryFixedAssetsPOPONO: TStringField
      DisplayLabel = 'PO #'
      FieldName = 'PONO'
      Size = 15
    end
    object QryFixedAssetsPOITEMNO: TStringField
      DisplayLabel = 'PO Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object QryFixedAssetsPOASSET_NO: TStringField
      DisplayLabel = 'Asset #'
      FieldName = 'ASSET_NO'
      Size = 15
    end
    object QryFixedAssetsPODESCRIP: TStringField
      DisplayLabel = 'Asset Description'
      FieldName = 'DESCRIP'
      Size = 60
    end
    object QryFixedAssetsPOSERIAL_NUMBER: TStringField
      DisplayLabel = 'Serial #'
      FieldName = 'SERIAL_NUMBER'
      Size = 60
    end
    object QryFixedAssetsPOIN_SERVICE_DATE: TDateTimeField
      DisplayLabel = 'In-Service Date'
      FieldName = 'IN_SERVICE_DATE'
    end
    object QryFixedAssetsPOPO_DETAIL_ID: TBCDField
      Tag = 1
      FieldName = 'PO_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object QryFixedAssetsPOFA_MAIN_ID: TBCDField
      Tag = 1
      FieldName = 'FA_MAIN_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcFixedAssetsPOHist: TDataSource
    DataSet = QryFixedAssetsPOHist
    Left = 432
    Top = 408
  end
  object QryFixedAssetsPOHist: TFDQuery
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select'
      '       a.pono,'
      '       b.arinvt_itemno as itemno,'
      '       c.id as fa_main_id,'
      '       c.asset_no,'
      '       c.descrip,'
      '       c.serial_number,'
      '       c.in_service_date'
      '        '
      '  from'
      '       po_hist a,'
      '       po_detail_hist b,'
      '       fa_main c'
      ' where'
      '   b.id = :id and'
      '   a.id = b.po_id'
      '   and b.cost_object_source(+) = '#39'FA_MAIN'#39'  '
      '   and b.cost_object_id = c.id'
      '')
    Left = 440
    Top = 416
    ParamData = <
      item
        Name = 'id'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object QryFixedAssetsPOHistPONO: TStringField
      DisplayLabel = 'PO #'
      FieldName = 'PONO'
      Size = 15
    end
    object QryFixedAssetsPOHistITEMNO: TStringField
      DisplayLabel = 'PO Item #'
      FieldName = 'ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryFixedAssetsPOHistASSET_NO: TStringField
      DisplayLabel = 'Asset #'
      FieldName = 'ASSET_NO'
      Size = 15
    end
    object QryFixedAssetsPOHistDESCRIP: TStringField
      DisplayLabel = 'Asset Description'
      FieldName = 'DESCRIP'
      Size = 60
    end
    object QryFixedAssetsPOHistSERIAL_NUMBER: TStringField
      DisplayLabel = 'Serial #'
      FieldName = 'SERIAL_NUMBER'
      Size = 60
    end
    object QryFixedAssetsPOHistIN_SERVICE_DATE: TDateTimeField
      DisplayLabel = 'In-Service Date'
      FieldName = 'IN_SERVICE_DATE'
    end
    object QryFixedAssetsPOHistFA_MAIN_ID: TBCDField
      Tag = 1
      FieldName = 'FA_MAIN_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcFixedAssetsGL: TDataSource
    DataSet = QryFixedAssetsGL
    Left = 432
    Top = 464
  end
  object QryFixedAssetsGL: TFDQuery
    BeforeOpen = AssignQueryParams
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select'
      '       d.descrip as GJ_Descrip,'
      '       NVL(d.debit, 0) + NVL(d.credit, 0) as debit_credit,'
      '       f.asset_no,'
      '       f.descrip,'
      '       f.serial_number,'
      '       f.in_service_date,'
      '       f.id as fa_main_id'
      '  from glbatch d,'
      '       fa_main f'
      ' where d.id = :id'
      '   and d.cost_object_source(+) = '#39'FA_MAIN'#39
      '   and d.cost_object_id = f.id'
      '')
    Left = 440
    Top = 472
    ParamData = <
      item
        Name = 'id'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object QryFixedAssetsGLGJ_DESCRIP: TStringField
      DisplayLabel = 'GJ Description'
      FieldName = 'GJ_DESCRIP'
      Size = 100
    end
    object QryFixedAssetsGLDEBIT_CREDIT: TFMTBCDField
      DisplayLabel = 'Debit/Credit'
      FieldName = 'DEBIT_CREDIT'
      Size = 0
    end
    object QryFixedAssetsGLASSET_NO: TStringField
      DisplayLabel = 'Asset #'
      FieldName = 'ASSET_NO'
      Size = 15
    end
    object QryFixedAssetsGLDESCRIP: TStringField
      DisplayLabel = 'Asset Description'
      FieldName = 'DESCRIP'
      Size = 60
    end
    object QryFixedAssetsGLSERIAL_NUMBER: TStringField
      DisplayLabel = 'Serial #'
      FieldName = 'SERIAL_NUMBER'
      Size = 60
    end
    object QryFixedAssetsGLIN_SERVICE_DATE: TDateTimeField
      DisplayLabel = 'In-Service Date'
      FieldName = 'IN_SERVICE_DATE'
    end
    object QryFixedAssetsGLFA_MAIN_ID: TBCDField
      Tag = 1
      FieldName = 'FA_MAIN_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcFixedAssetsGJ: TDataSource
    DataSet = QryFixedAssetsGJ
    Left = 440
    Top = 520
  end
  object QryFixedAssetsGJ: TFDQuery
    BeforeOpen = AssignQueryParams
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select'
      '       d.descrip as GJ_Descrip,'
      '       NVL(d.debit, 0) + NVL(d.credit, 0) as debit_credit,'
      '       f.asset_no,'
      '       f.descrip,'
      '       f.serial_number,'
      '       f.in_service_date,'
      '       f.id AS fa_main_id'
      '  from glprepost_detail d,'
      '       fa_main f'
      ' where d.id = :id'
      '   and d.cost_object_source(+) = '#39'FA_MAIN'#39
      '   and d.cost_object_id = f.id'
      '')
    Left = 440
    Top = 528
    ParamData = <
      item
        Name = 'id'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object QryFixedAssetsGJGJ_DESCRIP: TStringField
      DisplayLabel = 'GJ Description'
      FieldName = 'GJ_DESCRIP'
      Size = 100
    end
    object QryFixedAssetsGJDEBIT_CREDIT: TFMTBCDField
      DisplayLabel = 'Debit/Credit'
      FieldName = 'DEBIT_CREDIT'
      Size = 0
    end
    object QryFixedAssetsGJASSET_NO: TStringField
      DisplayLabel = 'Asset #'
      FieldName = 'ASSET_NO'
      Size = 15
    end
    object QryFixedAssetsGJDESCRIP: TStringField
      DisplayLabel = 'Asset Description'
      FieldName = 'DESCRIP'
      Size = 60
    end
    object QryFixedAssetsGJSERIAL_NUMBER: TStringField
      DisplayLabel = 'Serial #'
      FieldName = 'SERIAL_NUMBER'
      Size = 60
    end
    object QryFixedAssetsGJIN_SERVICE_DATE: TDateTimeField
      DisplayLabel = 'In-Service Date'
      FieldName = 'IN_SERVICE_DATE'
    end
    object QryFixedAssetsGJFA_MAIN_ID: TBCDField
      Tag = 1
      FieldName = 'FA_MAIN_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcJobShopArprepost: TDataSource
    DataSet = QryJobShopArprepost
    Left = 560
    Top = 16
  end
  object QryJobShopArprepost: TFDQuery
    BeforeOpen = AssignQueryParams
    OnCalcFields = JobShopCalcFields
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select t.id as jobshop_task_id,'
      '       h.invoice_no,'
      
        '       decode( d.arinvt_id, NULL, SubStr( d.misc_item, 1, 35 ), ' +
        'd.itemno) as itemno,'
      '       s.mfgno,'
      '       s.route_seq,'
      '       s.mfg_type,'
      '       t.standard_id,'
      '       t.arinvt_id,'
      '       t.sndop_dispatch_id,'
      '       sndop.opno,'
      '       sndop.opdesc,'
      '       r.projectno'
      '  from jobshop_task t,'
      '       standard s,'
      '       arprepost h,'
      '       V_ARPREPOST_DETAIL d,'
      '       sndop,'
      '       jobshop_rfq r'
      ' where d.id = :ID'
      '   and h.id = d.arprepost_id'
      '   and d.cost_object_source = '#39'JOBSHOP_TASK'#39
      '   and d.cost_object_id = t.id(+)'
      '   and t.standard_id = s.id(+)'
      '   and t.sndop_id = sndop.id(+)'
      '   and t.jobshop_rfq_id = r.id'
      '             '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 568
    Top = 24
    ParamData = <
      item
        Name = 'ID'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object QryJobShopArprepostINVOICE_NO: TStringField
      DisplayLabel = 'Invoice #'
      FieldName = 'INVOICE_NO'
      Size = 25
    end
    object QryJobShopArprepostITEMNO: TStringField
      DisplayLabel = 'Invoice Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object QryJobShopArprepostMFGNO: TStringField
      DisplayLabel = 'Manufacturing #'
      FieldName = 'MFGNO'
      Origin = 'IQ.STANDARD.MFGNO'
      Size = 50
    end
    object QryJobShopArprepostROUTE_SEQ: TBCDField
      DisplayLabel = 'Route #'
      FieldName = 'ROUTE_SEQ'
      Origin = 'IQ.STANDARD.ROUTE_SEQ'
      Size = 0
    end
    object QryJobShopArprepostMFG_TYPE: TStringField
      DisplayLabel = 'Manufacturing Type'
      FieldName = 'MFG_TYPE'
      Origin = 'IQ.STANDARD.MFG_TYPE'
      FixedChar = True
      Size = 10
    end
    object QryJobShopArprepostSph: TBCDField
      DisplayLabel = 'Rate/Hour'
      FieldKind = fkCalculated
      FieldName = 'Sph'
      DisplayFormat = '######0.00'
      Size = 0
      Calculated = True
    end
    object QryJobShopArprepostPROJECTNO: TStringField
      DisplayLabel = 'Project #'
      FieldName = 'PROJECTNO'
      Size = 25
    end
    object QryJobShopArprepostOPNO: TStringField
      DisplayLabel = 'Process #'
      FieldName = 'OPNO'
      Size = 15
    end
    object QryJobShopArprepostOPDESC: TStringField
      DisplayLabel = 'Process Description'
      DisplayWidth = 30
      FieldName = 'OPDESC'
      Size = 60
    end
    object QryJobShopArprepostSNDOP_DISPATCH_ID: TBCDField
      Tag = 1
      DisplayLabel = 'Dispatch ID'
      FieldName = 'SNDOP_DISPATCH_ID'
      Size = 0
    end
    object QryJobShopArprepostJOBSHOP_TASK_ID: TBCDField
      Tag = 1
      FieldName = 'JOBSHOP_TASK_ID'
      Visible = False
      Size = 0
    end
    object QryJobShopArprepostSTANDARD_ID: TBCDField
      Tag = 1
      FieldName = 'STANDARD_ID'
      Origin = 'IQ.ORD_DETAIL_TASK.STANDARD_ID'
      Visible = False
      Size = 0
    end
    object QryJobShopArprepostARINVT_ID: TBCDField
      Tag = 1
      FieldName = 'ARINVT_ID'
      Origin = 'IQ.ORD_DETAIL_TASK.ARINVT_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcJobShopARInvoice: TDataSource
    DataSet = QryJobShopARInvoice
    Left = 560
    Top = 72
  end
  object QryJobShopARInvoice: TFDQuery
    BeforeOpen = AssignQueryParams
    OnCalcFields = JobShopCalcFields
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select t.id as jobshop_task_id,'
      '       h.invoice_no,'
      
        '       decode( NVL( d.arinvt_itemno, '#39#39'), '#39#39', SubStr( d.misc_com' +
        'ment, 1, 35 ), d.arinvt_itemno ) as itemno,'
      '       s.mfgno,'
      '       s.route_seq,'
      '       s.mfg_type,'
      '       t.standard_id,'
      '       t.arinvt_id,'
      '       t.sndop_dispatch_id,'
      '       sndop.opno,'
      '       sndop.opdesc,'
      '       r.projectno'
      '  from jobshop_task t,'
      '       standard s,'
      '       arinvoice h,'
      '       arinvoice_detail d,'
      '       sndop,'
      '       jobshop_rfq r'
      ' where d.id = :ID   '
      '   and h.id = d.arinvoice_id'
      '   and d.cost_object_source = '#39'JOBSHOP_TASK'#39'     '
      '   and d.cost_object_id = t.id(+)'
      '   and t.standard_id = s.id(+)'
      '   and t.sndop_id = sndop.id(+)'
      '   and t.jobshop_rfq_id = r.id'
      '                             '
      ' '
      ' ')
    Left = 568
    Top = 80
    ParamData = <
      item
        Name = 'ID'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object QryJobShopARInvoiceINVOICE_NO: TStringField
      DisplayLabel = 'Invoice #'
      FieldName = 'INVOICE_NO'
      Size = 25
    end
    object QryJobShopARInvoiceITEMNO: TStringField
      DisplayLabel = 'Invoice Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object QryJobShopARInvoiceMFGNO: TStringField
      DisplayLabel = 'Manufacturing #'
      FieldName = 'MFGNO'
      Origin = 'IQ.STANDARD.MFGNO'
      Size = 50
    end
    object QryJobShopARInvoiceROUTE_SEQ: TBCDField
      DisplayLabel = 'Route #'
      FieldName = 'ROUTE_SEQ'
      Origin = 'IQ.STANDARD.ROUTE_SEQ'
      Size = 0
    end
    object QryJobShopARInvoiceMFG_TYPE: TStringField
      DisplayLabel = 'Manufacturing Type'
      FieldName = 'MFG_TYPE'
      Origin = 'IQ.STANDARD.MFG_TYPE'
      FixedChar = True
      Size = 10
    end
    object QryJobShopARInvoiceSph: TBCDField
      DisplayLabel = 'Rate/Hour'
      FieldKind = fkCalculated
      FieldName = 'Sph'
      DisplayFormat = '######0.00'
      Size = 0
      Calculated = True
    end
    object QryJobShopARInvoicePROJECTNO: TStringField
      DisplayLabel = 'Project #'
      FieldName = 'PROJECTNO'
      Size = 25
    end
    object QryJobShopARInvoiceOPNO: TStringField
      DisplayLabel = 'Process #'
      FieldName = 'OPNO'
      Size = 15
    end
    object QryJobShopARInvoiceOPDESC: TStringField
      DisplayLabel = 'Process Description'
      DisplayWidth = 30
      FieldName = 'OPDESC'
      Size = 60
    end
    object QryJobShopARInvoiceSNDOP_DISPATCH_ID: TBCDField
      Tag = 1
      DisplayLabel = 'Dispatch ID'
      FieldName = 'SNDOP_DISPATCH_ID'
      Size = 0
    end
    object QryJobShopARInvoiceJOBSHOP_TASK_ID: TBCDField
      Tag = 1
      FieldName = 'JOBSHOP_TASK_ID'
      Visible = False
      Size = 0
    end
    object QryJobShopARInvoiceSTANDARD_ID: TBCDField
      Tag = 1
      FieldName = 'STANDARD_ID'
      Origin = 'IQ.ORD_DETAIL_TASK.STANDARD_ID'
      Visible = False
      Size = 0
    end
    object QryJobShopARInvoiceARINVT_ID: TBCDField
      Tag = 1
      FieldName = 'ARINVT_ID'
      Origin = 'IQ.ORD_DETAIL_TASK.ARINVT_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcJobShopApprepost: TDataSource
    DataSet = QryJobShopApprepost
    Left = 560
    Top = 128
  end
  object QryJobShopApprepost: TFDQuery
    BeforeOpen = AssignQueryParams
    OnCalcFields = JobShopCalcFields
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select t.id as jobshop_task_id,'
      '       h.invoice_no,'
      
        '       decode( po.arinvt_id, NULL, SubStr( d.misc_comment, 1, 35' +
        ' ), po.item_number ) as itemno,'
      '       s.mfgno,'
      '       s.route_seq,'
      '       s.mfg_type,'
      '       t.standard_id,'
      '       t.arinvt_id,'
      '       t.sndop_dispatch_id,'
      '       sndop.opno,'
      '       sndop.opdesc,'
      '       r.projectno'
      '  from jobshop_task t,'
      '       standard s,'
      '       apprepost h,'
      '       apprepost_detail d,'
      '       v_po_detail po,'
      '       sndop,'
      '       jobshop_rfq r'
      ' where '
      '       d.id = :ID '
      '   and h.id = d.apprepost_id'
      '   and d.po_detail_id =  po.po_detail_id(+)'
      '   and d.cost_object_source = '#39'JOBSHOP_TASK'#39
      '   and d.cost_object_id = t.id(+)'
      '   and t.standard_id = s.id(+)'
      '   and t.sndop_id = sndop.id(+)'
      '   and t.jobshop_rfq_id = r.id'
      '')
    Left = 568
    Top = 136
    ParamData = <
      item
        Name = 'ID'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object QryJobShopApprepostINVOICE_NO: TStringField
      DisplayLabel = 'Invoice #'
      FieldName = 'INVOICE_NO'
      Size = 50
    end
    object QryJobShopApprepostITEMNO: TStringField
      DisplayLabel = 'Invoice Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object QryJobShopApprepostMFGNO: TStringField
      DisplayLabel = 'Manufacturing #'
      FieldName = 'MFGNO'
      Origin = 'IQ.STANDARD.MFGNO'
      Size = 50
    end
    object QryJobShopApprepostROUTE_SEQ: TBCDField
      DisplayLabel = 'Route #'
      FieldName = 'ROUTE_SEQ'
      Origin = 'IQ.STANDARD.ROUTE_SEQ'
      Size = 0
    end
    object QryJobShopApprepostMFG_TYPE: TStringField
      DisplayLabel = 'Manufacturing Type'
      FieldName = 'MFG_TYPE'
      Origin = 'IQ.STANDARD.MFG_TYPE'
      FixedChar = True
      Size = 10
    end
    object QryJobShopApprepostSph: TBCDField
      DisplayLabel = 'Rate/Hour'
      FieldKind = fkCalculated
      FieldName = 'Sph'
      DisplayFormat = '######0.00'
      Size = 0
      Calculated = True
    end
    object QryJobShopApprepostPROJECTNO: TStringField
      DisplayLabel = 'Project #'
      FieldName = 'PROJECTNO'
      Size = 25
    end
    object QryJobShopApprepostOPNO: TStringField
      DisplayLabel = 'Process #'
      FieldName = 'OPNO'
      Size = 15
    end
    object QryJobShopApprepostOPDESC: TStringField
      DisplayLabel = 'Process Description'
      DisplayWidth = 30
      FieldName = 'OPDESC'
      Size = 60
    end
    object QryJobShopApprepostSNDOP_DISPATCH_ID: TBCDField
      Tag = 1
      DisplayLabel = 'Dispatch ID'
      FieldName = 'SNDOP_DISPATCH_ID'
      Size = 0
    end
    object QryJobShopApprepostJOBSHOP_TASK_ID: TBCDField
      Tag = 1
      FieldName = 'JOBSHOP_TASK_ID'
      Size = 0
    end
    object QryJobShopApprepostSTANDARD_ID: TBCDField
      Tag = 1
      FieldName = 'STANDARD_ID'
      Origin = 'IQ.ORD_DETAIL_TASK.STANDARD_ID'
      Size = 0
    end
    object QryJobShopApprepostARINVT_ID: TBCDField
      Tag = 1
      FieldName = 'ARINVT_ID'
      Origin = 'IQ.ORD_DETAIL_TASK.ARINVT_ID'
      Size = 0
    end
  end
  object SrcJobShopAPInvoice: TDataSource
    DataSet = QryJobShopAPInvoice
    Left = 560
    Top = 184
  end
  object QryJobShopAPInvoice: TFDQuery
    BeforeOpen = AssignQueryParams
    OnCalcFields = JobShopCalcFields
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select t.id as jobshop_task_id,'
      '       h.invoice_no,'
      
        '       decode( NVL( d.arinvt_itemno, '#39#39'), '#39#39', SubStr( d.misc_com' +
        'ment, 1, 35 ), d.arinvt_itemno ) as itemno,'
      '       s.mfgno,'
      '       s.route_seq,'
      '       s.mfg_type,'
      '       t.standard_id,'
      '       t.arinvt_id,'
      '       t.sndop_dispatch_id,'
      '       sndop.opno,'
      '       sndop.opdesc,'
      '       r.projectno'
      '  from jobshop_task t,'
      '       standard s,'
      '       apinvoice h,'
      '       apinvoice_detail d,'
      '       sndop,'
      '       jobshop_rfq r'
      ' where       '
      '       d.id = :ID '
      '   and h.id = d.apinvoice_id'
      '   and d.cost_object_source = '#39'JOBSHOP_TASK'#39
      '   and d.cost_object_id = t.id(+)'
      '   and t.standard_id = s.id(+)'
      '   and t.sndop_id = sndop.id(+)'
      '   and t.jobshop_rfq_id = r.id'
      '                     '
      ''
      ' '
      ' ')
    Left = 568
    Top = 192
    ParamData = <
      item
        Name = 'ID'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object QryJobShopAPInvoiceINVOICE_NO: TStringField
      DisplayLabel = 'Invoice #'
      FieldName = 'INVOICE_NO'
      Size = 50
    end
    object QryJobShopAPInvoiceITEMNO: TStringField
      DisplayLabel = 'Invoice Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object QryJobShopAPInvoiceMFGNO: TStringField
      DisplayLabel = 'Manufacturing #'
      FieldName = 'MFGNO'
      Origin = 'IQ.STANDARD.MFGNO'
      Size = 50
    end
    object QryJobShopAPInvoiceROUTE_SEQ: TBCDField
      DisplayLabel = 'Route #'
      FieldName = 'ROUTE_SEQ'
      Origin = 'IQ.STANDARD.ROUTE_SEQ'
      Size = 0
    end
    object QryJobShopAPInvoiceMFG_TYPE: TStringField
      DisplayLabel = 'Manufacturing Type'
      FieldName = 'MFG_TYPE'
      Origin = 'IQ.STANDARD.MFG_TYPE'
      FixedChar = True
      Size = 10
    end
    object QryJobShopAPInvoiceSph: TBCDField
      DisplayLabel = 'Rate/Hour'
      FieldKind = fkCalculated
      FieldName = 'Sph'
      DisplayFormat = '######0.00'
      Size = 0
      Calculated = True
    end
    object QryJobShopAPInvoicePROJECTNO: TStringField
      DisplayLabel = 'Project #'
      FieldName = 'PROJECTNO'
      Size = 25
    end
    object QryJobShopAPInvoiceOPNO: TStringField
      DisplayLabel = 'Process #'
      FieldName = 'OPNO'
      Size = 15
    end
    object QryJobShopAPInvoiceOPDESC: TStringField
      DisplayLabel = 'Process Description'
      DisplayWidth = 30
      FieldName = 'OPDESC'
      Size = 60
    end
    object QryJobShopAPInvoiceSNDOP_DISPATCH_ID: TBCDField
      Tag = 1
      DisplayLabel = 'Dispatch ID'
      FieldName = 'SNDOP_DISPATCH_ID'
      Size = 0
    end
    object QryJobShopAPInvoiceJOBSHOP_TASK_ID: TBCDField
      Tag = 1
      FieldName = 'JOBSHOP_TASK_ID'
      Visible = False
      Size = 0
    end
    object QryJobShopAPInvoiceSTANDARD_ID: TBCDField
      Tag = 1
      FieldName = 'STANDARD_ID'
      Origin = 'IQ.ORD_DETAIL_TASK.STANDARD_ID'
      Visible = False
      Size = 0
    end
    object QryJobShopAPInvoiceARINVT_ID: TBCDField
      Tag = 1
      FieldName = 'ARINVT_ID'
      Origin = 'IQ.ORD_DETAIL_TASK.ARINVT_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcJobShopOrders: TDataSource
    DataSet = QryJobShopOrders
    Left = 560
    Top = 240
  end
  object QryJobShopOrders: TFDQuery
    BeforeOpen = AssignQueryParams
    OnCalcFields = JobShopCalcFields
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select t.id as jobshop_task_id,'
      '       o.orderno,'
      '       a.itemno,'
      '       s.mfgno,'
      '       s.route_seq,'
      '       s.mfg_type,'
      '       t.standard_id,'
      '       t.arinvt_id,'
      '       t.sndop_dispatch_id,'
      '       sndop.opno,'
      '       sndop.opdesc,'
      '       r.projectno'
      '  from jobshop_task t,'
      '       ord_detail d,'
      '       orders o,'
      '       arinvt a,'
      '       standard s,'
      '       sndop,'
      '       jobshop_rfq r'
      ' where d.id = :ID'
      '   and d.cost_object_source = '#39'JOBSHOP_TASK'#39'     '
      '   and d.cost_object_id = t.id'
      '   and t.arinvt_id = a.id'
      '   and t.standard_id = s.id'
      '   and d.orders_id = o.id'
      '   and t.sndop_id = sndop.id(+)'
      '   and t.jobshop_rfq_id = r.id'
      '     '
      ' '
      ' ')
    Left = 568
    Top = 248
    ParamData = <
      item
        Name = 'ID'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object QryJobShopOrdersORDERNO: TStringField
      DisplayLabel = 'Order #'
      FieldName = 'ORDERNO'
      Origin = 'IQ.ORDERS.ORDERNO'
      FixedChar = True
      Size = 15
    end
    object QryJobShopOrdersITEMNO: TStringField
      DisplayLabel = 'Order Item #'
      FieldName = 'ITEMNO'
      Origin = 'IQ.ARINVT.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryJobShopOrdersMFGNO: TStringField
      DisplayLabel = 'Manufacturing #'
      FieldName = 'MFGNO'
      Origin = 'IQ.STANDARD.MFGNO'
      Size = 50
    end
    object QryJobShopOrdersROUTE_SEQ: TBCDField
      DisplayLabel = 'Route #'
      FieldName = 'ROUTE_SEQ'
      Origin = 'IQ.STANDARD.ROUTE_SEQ'
      Size = 0
    end
    object QryJobShopOrdersMFG_TYPE: TStringField
      DisplayLabel = 'Manufacturing Type'
      FieldName = 'MFG_TYPE'
      Origin = 'IQ.STANDARD.MFG_TYPE'
      FixedChar = True
      Size = 10
    end
    object QryJobShopOrdersSph: TBCDField
      DisplayLabel = 'Rate/Hour'
      FieldKind = fkCalculated
      FieldName = 'Sph'
      DisplayFormat = '######0.00'
      Size = 0
      Calculated = True
    end
    object QryJobShopOrdersPROJECTNO: TStringField
      DisplayLabel = 'Project #'
      FieldName = 'PROJECTNO'
      Size = 25
    end
    object QryJobShopOrdersOPNO: TStringField
      DisplayLabel = 'Process #'
      FieldName = 'OPNO'
      Size = 15
    end
    object QryJobShopOrdersOPDESC: TStringField
      DisplayLabel = 'Process Description'
      DisplayWidth = 30
      FieldName = 'OPDESC'
      Size = 60
    end
    object QryJobShopOrdersSNDOP_DISPATCH_ID: TBCDField
      Tag = 1
      DisplayLabel = 'Dispatch ID'
      FieldName = 'SNDOP_DISPATCH_ID'
      Size = 0
    end
    object QryJobShopOrdersJOBSHOP_TASK_ID: TBCDField
      Tag = 1
      FieldName = 'JOBSHOP_TASK_ID'
      Visible = False
      Size = 0
    end
    object QryJobShopOrdersSTANDARD_ID: TBCDField
      Tag = 1
      FieldName = 'STANDARD_ID'
      Origin = 'IQ.ORD_DETAIL_TASK.STANDARD_ID'
      Visible = False
      Size = 0
    end
    object QryJobShopOrdersARINVT_ID: TBCDField
      Tag = 1
      FieldName = 'ARINVT_ID'
      Origin = 'IQ.ORD_DETAIL_TASK.ARINVT_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcJobShopOrderHist: TDataSource
    DataSet = QryJobShopOrderHist
    Left = 560
    Top = 296
  end
  object QryJobShopOrderHist: TFDQuery
    BeforeOpen = AssignQueryParams
    OnCalcFields = JobShopCalcFields
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select t.id as jobshop_task_id,'
      '       o.orderno,'
      '       a.itemno,'
      '       s.mfgno,'
      '       s.route_seq,'
      '       s.mfg_type,'
      '       t.standard_id,'
      '       t.arinvt_id,'
      '       t.sndop_dispatch_id,'
      '       sndop.opno,'
      '       sndop.opdesc,'
      '       r.projectno'
      '  from jobshop_task t,'
      '       hist_ord_detail d,'
      '       hist_orders o,'
      '       arinvt a,'
      '       standard s,'
      '       sndop,'
      '       jobshop_rfq r'
      ' where d.id = :ID'
      '   and d.cost_object_source = '#39'JOBSHOP_TASK'#39'     '
      '   and d.cost_object_id = t.id'
      '   and t.arinvt_id = a.id'
      '   and t.standard_id = s.id'
      '   and d.orders_id = o.id'
      '   and t.sndop_id = sndop.id(+)'
      '   and t.jobshop_rfq_id = r.id'
      '         ')
    Left = 568
    Top = 304
    ParamData = <
      item
        Name = 'ID'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object QryJobShopOrderHistORDERNO: TStringField
      DisplayLabel = 'Order #'
      FieldName = 'ORDERNO'
      Origin = 'IQ.HIST_ORDERS.ORDERNO'
      FixedChar = True
      Size = 15
    end
    object QryJobShopOrderHistITEMNO: TStringField
      DisplayLabel = 'Order Item #'
      FieldName = 'ITEMNO'
      Origin = 'IQ.ARINVT.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryJobShopOrderHistMFGNO: TStringField
      DisplayLabel = 'Manufacturing #'
      FieldName = 'MFGNO'
      Origin = 'IQ.STANDARD.MFGNO'
      Size = 50
    end
    object QryJobShopOrderHistROUTE_SEQ: TBCDField
      DisplayLabel = 'Route #'
      FieldName = 'ROUTE_SEQ'
      Origin = 'IQ.STANDARD.ROUTE_SEQ'
      Size = 0
    end
    object QryJobShopOrderHistMFG_TYPE: TStringField
      DisplayLabel = 'Manufacturing Type'
      FieldName = 'MFG_TYPE'
      Origin = 'IQ.STANDARD.MFG_TYPE'
      FixedChar = True
      Size = 10
    end
    object QryJobShopOrderHistSph: TBCDField
      FieldKind = fkCalculated
      FieldName = 'Rate/Hour'
      DisplayFormat = '######0.00'
      Size = 0
      Calculated = True
    end
    object QryJobShopOrderHistPROJECTNO: TStringField
      DisplayLabel = 'Project #'
      FieldName = 'PROJECTNO'
      Size = 25
    end
    object QryJobShopOrderHistOPNO: TStringField
      DisplayLabel = 'Process #'
      FieldName = 'OPNO'
      Size = 15
    end
    object QryJobShopOrderHistOPDESC: TStringField
      DisplayLabel = 'Process Description'
      DisplayWidth = 30
      FieldName = 'OPDESC'
      Size = 60
    end
    object QryJobShopOrderHistSNDOP_DISPATCH_ID: TBCDField
      Tag = 1
      DisplayLabel = 'Dispatch ID'
      FieldName = 'SNDOP_DISPATCH_ID'
      Size = 0
    end
    object QryJobShopOrderHistJOBSHOP_TASK_ID: TBCDField
      Tag = 1
      FieldName = 'JOBSHOP_TASK_ID'
      Visible = False
      Size = 0
    end
    object QryJobShopOrderHistSTANDARD_ID: TBCDField
      Tag = 1
      FieldName = 'STANDARD_ID'
      Origin = 'IQ.ORD_DETAIL_TASK.STANDARD_ID'
      Visible = False
      Size = 0
    end
    object QryJobShopOrderHistARINVT_ID: TBCDField
      Tag = 1
      FieldName = 'ARINVT_ID'
      Origin = 'IQ.ORD_DETAIL_TASK.ARINVT_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcJobShopPO: TDataSource
    DataSet = QryJobShopPO
    Left = 560
    Top = 352
  end
  object QryJobShopPO: TFDQuery
    BeforeOpen = AssignQueryParams
    OnCalcFields = JobShopCalcFields
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select t.id as jobshop_task_id,'
      '       po.pono,'
      '       a2.itemno,'
      '       s.mfgno,'
      '       s.route_seq,'
      '       s.mfg_type,'
      '       t.standard_id,'
      '       t.arinvt_id,'
      '       r.projectno,'
      '       t.sndop_dispatch_id,'
      '       sndop.opno,'
      '       sndop.opdesc'
      '  from '
      '       po_detail d,'
      '       po,'
      '       arinvt a2,'
      '       jobshop_task t,'
      '       jobshop_rfq r,'
      '       arinvt a,'
      '       standard s,'
      '       sndop'
      ' where '
      '       d.id = :ID'
      '   and d.po_id = po.id'
      '   and d.arinvt_id = a2.id(+)'
      '   and d.cost_object_source = '#39'JOBSHOP_TASK'#39'     '
      '   and t.id = d.cost_object_id'
      '   and t.arinvt_id = a.id'
      '   and t.standard_id = s.id'
      '   and t.jobshop_rfq_id = r.id'
      '   and t.sndop_id = sndop.id(+)'
      '   '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 568
    Top = 360
    ParamData = <
      item
        Name = 'ID'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object QryJobShopPOPONO: TStringField
      DisplayLabel = 'PO #'
      FieldName = 'PONO'
      Size = 15
    end
    object QryJobShopPOITEMNO: TStringField
      DisplayLabel = 'PO Item #'
      FieldName = 'ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryJobShopPOMFGNO: TStringField
      DisplayLabel = 'Manufacturing #'
      FieldName = 'MFGNO'
      Origin = 'IQ.STANDARD.MFGNO'
      Size = 50
    end
    object QryJobShopPOROUTE_SEQ: TBCDField
      DisplayLabel = 'Route #'
      FieldName = 'ROUTE_SEQ'
      Origin = 'IQ.STANDARD.ROUTE_SEQ'
      Size = 0
    end
    object QryJobShopPOMFG_TYPE: TStringField
      DisplayLabel = 'Manufacturing Type'
      FieldName = 'MFG_TYPE'
      Origin = 'IQ.STANDARD.MFG_TYPE'
      FixedChar = True
      Size = 10
    end
    object QryJobShopPOSph: TBCDField
      DisplayLabel = 'Rate/Hour'
      FieldKind = fkCalculated
      FieldName = 'Sph'
      DisplayFormat = '######0.00'
      Size = 0
      Calculated = True
    end
    object QryJobShopPOPROJECTNO: TStringField
      DisplayLabel = 'Project #'
      FieldName = 'PROJECTNO'
      Size = 25
    end
    object QryJobShopPOOPNO: TStringField
      DisplayLabel = 'Process #'
      FieldName = 'OPNO'
      Size = 15
    end
    object QryJobShopPOOPDESC: TStringField
      DisplayLabel = 'Process Description'
      DisplayWidth = 30
      FieldName = 'OPDESC'
      Size = 60
    end
    object QryJobShopPOSNDOP_DISPATCH_ID: TBCDField
      Tag = 1
      DisplayLabel = 'Dispatch ID'
      FieldName = 'SNDOP_DISPATCH_ID'
      Size = 0
    end
    object QryJobShopPOJOBSHOP_TASK_ID: TBCDField
      Tag = 1
      FieldName = 'JOBSHOP_TASK_ID'
      Visible = False
      Size = 0
    end
    object QryJobShopPOSTANDARD_ID: TBCDField
      Tag = 1
      FieldName = 'STANDARD_ID'
      Origin = 'IQ.ORD_DETAIL_TASK.STANDARD_ID'
      Visible = False
      Size = 0
    end
    object QryJobShopPOARINVT_ID: TBCDField
      Tag = 1
      FieldName = 'ARINVT_ID'
      Origin = 'IQ.ORD_DETAIL_TASK.ARINVT_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcJobShopPOHist: TDataSource
    DataSet = QryJobShopPOHist
    Left = 560
    Top = 408
  end
  object QryJobShopPOHist: TFDQuery
    BeforeOpen = AssignQueryParams
    OnCalcFields = JobShopCalcFields
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select t.id as jobshop_task_id,'
      '       po.pono,'
      '       a2.itemno,'
      '       s.mfgno,'
      '       s.route_seq,'
      '       s.mfg_type,'
      '       t.standard_id,'
      '       t.arinvt_id,'
      '       r.projectno,'
      '       t.sndop_dispatch_id,'
      '       sndop.opno,'
      '       sndop.opdesc'
      '  from '
      '       po_detail_hist d,'
      '       po_hist po,'
      '       arinvt a2,'
      '       jobshop_task t,'
      '       jobshop_rfq r,'
      '       arinvt a,'
      '       standard s,'
      '       sndop'
      ' where '
      '       d.id = :ID'
      '   and d.po_id = po.id'
      '   and d.arinvt_id = a2.id(+)'
      '   and d.cost_object_source = '#39'JOBSHOP_TASK'#39'     '
      '   and t.id = d.cost_object_id'
      '   and t.arinvt_id = a.id'
      '   and t.standard_id = s.id'
      '   and t.jobshop_rfq_id = r.id'
      '   and t.sndop_id = sndop.id(+)'
      '                 '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 568
    Top = 416
    ParamData = <
      item
        Name = 'ID'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object QryJobShopPOHistPONO: TStringField
      DisplayLabel = 'PO #'
      FieldName = 'PONO'
      Size = 15
    end
    object QryJobShopPOHistITEMNO: TStringField
      DisplayLabel = 'PO Item #'
      FieldName = 'ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryJobShopPOHistMFGNO: TStringField
      DisplayLabel = 'Manufacturing #'
      FieldName = 'MFGNO'
      Origin = 'IQ.STANDARD.MFGNO'
      Size = 50
    end
    object QryJobShopPOHistROUTE_SEQ: TBCDField
      DisplayLabel = 'Route #'
      FieldName = 'ROUTE_SEQ'
      Origin = 'IQ.STANDARD.ROUTE_SEQ'
      Size = 0
    end
    object QryJobShopPOHistMFG_TYPE: TStringField
      DisplayLabel = 'Manufacturing Type'
      FieldName = 'MFG_TYPE'
      Origin = 'IQ.STANDARD.MFG_TYPE'
      FixedChar = True
      Size = 10
    end
    object QryJobShopPOHistSph: TBCDField
      DisplayLabel = 'Rate/Hour'
      FieldKind = fkCalculated
      FieldName = 'Sph'
      DisplayFormat = '######0.00'
      Size = 0
      Calculated = True
    end
    object QryJobShopPOHistPROJECTNO: TStringField
      DisplayLabel = 'Project #'
      FieldName = 'PROJECTNO'
      Size = 25
    end
    object QryJobShopPOHistOPNO: TStringField
      DisplayLabel = 'Process #'
      FieldName = 'OPNO'
      Size = 15
    end
    object QryJobShopPOHistOPDESC: TStringField
      DisplayLabel = 'Process Description'
      DisplayWidth = 30
      FieldName = 'OPDESC'
      Size = 60
    end
    object QryJobShopPOHistSNDOP_DISPATCH_ID: TBCDField
      Tag = 1
      DisplayLabel = 'Dispatch ID'
      FieldName = 'SNDOP_DISPATCH_ID'
      Size = 0
    end
    object QryJobShopPOHistJOBSHOP_TASK_ID: TBCDField
      Tag = 1
      FieldName = 'JOBSHOP_TASK_ID'
      Visible = False
      Size = 0
    end
    object QryJobShopPOHistSTANDARD_ID: TBCDField
      Tag = 1
      FieldName = 'STANDARD_ID'
      Origin = 'IQ.ORD_DETAIL_TASK.STANDARD_ID'
      Visible = False
      Size = 0
    end
    object QryJobShopPOHistARINVT_ID: TBCDField
      Tag = 1
      FieldName = 'ARINVT_ID'
      Origin = 'IQ.ORD_DETAIL_TASK.ARINVT_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcJobShopGL: TDataSource
    DataSet = QryJobShopGL
    Left = 560
    Top = 464
  end
  object QryJobShopGL: TFDQuery
    BeforeOpen = AssignQueryParams
    OnCalcFields = JobShopCalcFields
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select t.id as jobshop_task_id,'
      '       '#39#39' as pono,'
      '       '#39#39' as itemno,'
      '       s.mfgno,'
      '       s.route_seq,'
      '       s.mfg_type,'
      '       t.standard_id,'
      '       t.arinvt_id,'
      '       r.projectno,'
      '       t.sndop_dispatch_id,'
      '       sndop.opno,'
      '       sndop.opdesc,'
      '       d.descrip,'
      '       g.acct'
      '  from '
      '       glbatch d,'
      '       glacct g,'
      '       jobshop_task t,'
      '       jobshop_rfq r,'
      '       arinvt a,'
      '       standard s,'
      '       sndop'
      ' where '
      '       d.id = :ID'
      '   and d.glacct_id = g.id(+)    '
      '   and d.cost_object_source = '#39'JOBSHOP_TASK'#39'     '
      '   and t.id = d.cost_object_id'
      '   and t.arinvt_id = a.id'
      '   and t.standard_id = s.id'
      '   and t.jobshop_rfq_id = r.id'
      '   and t.sndop_id = sndop.id(+)'
      '   ')
    Left = 568
    Top = 472
    ParamData = <
      item
        Name = 'ID'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object QryJobShopGLDESCRIP: TStringField
      DisplayLabel = 'Detail Description'
      FieldName = 'DESCRIP'
      Size = 100
    end
    object QryJobShopGLACCT: TStringField
      DisplayLabel = 'GL Account'
      FieldName = 'ACCT'
      Size = 50
    end
    object QryJobShopGLMFGNO: TStringField
      DisplayLabel = 'Manufacturing #'
      FieldName = 'MFGNO'
      Origin = 'IQ.STANDARD.MFGNO'
      Size = 50
    end
    object QryJobShopGLROUTE_SEQ: TBCDField
      DisplayLabel = 'Route #'
      FieldName = 'ROUTE_SEQ'
      Origin = 'IQ.STANDARD.ROUTE_SEQ'
      Size = 0
    end
    object QryJobShopGLMFG_TYPE: TStringField
      DisplayLabel = 'Manufacturing Type'
      FieldName = 'MFG_TYPE'
      Origin = 'IQ.STANDARD.MFG_TYPE'
      FixedChar = True
      Size = 10
    end
    object QryJobShopGLSph: TBCDField
      DisplayLabel = 'Rate/Hour'
      FieldKind = fkCalculated
      FieldName = 'Sph'
      DisplayFormat = '######0.00'
      Size = 0
      Calculated = True
    end
    object QryJobShopGLOPNO: TStringField
      DisplayLabel = 'Process #'
      FieldName = 'OPNO'
      Size = 15
    end
    object QryJobShopGLOPDESC: TStringField
      DisplayLabel = 'Process Description'
      DisplayWidth = 30
      FieldName = 'OPDESC'
      Size = 60
    end
    object QryJobShopGLSNDOP_DISPATCH_ID: TBCDField
      Tag = 1
      DisplayLabel = 'Dispatch ID'
      FieldName = 'SNDOP_DISPATCH_ID'
      Size = 0
    end
    object QryJobShopGLJOBSHOP_TASK_ID: TBCDField
      Tag = 1
      FieldName = 'JOBSHOP_TASK_ID'
      Visible = False
      Size = 0
    end
    object QryJobShopGLSTANDARD_ID: TBCDField
      Tag = 1
      FieldName = 'STANDARD_ID'
      Origin = 'IQ.ORD_DETAIL_TASK.STANDARD_ID'
      Visible = False
      Size = 0
    end
    object QryJobShopGLARINVT_ID: TBCDField
      Tag = 1
      FieldName = 'ARINVT_ID'
      Origin = 'IQ.ORD_DETAIL_TASK.ARINVT_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcJobShopGJ: TDataSource
    DataSet = QryJobShopGJ
    Left = 560
    Top = 520
  end
  object QryJobShopGJ: TFDQuery
    BeforeOpen = AssignQueryParams
    OnCalcFields = JobShopCalcFields
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select t.id as jobshop_task_id,'
      '       '#39#39' as pono,'
      '       '#39#39' as itemno,'
      '       s.mfgno,'
      '       s.route_seq,'
      '       s.mfg_type,'
      '       t.standard_id,'
      '       t.arinvt_id,'
      '       r.projectno,'
      '       t.sndop_dispatch_id,'
      '       sndop.opno,'
      '       sndop.opdesc,'
      '       d.descrip,'
      '       g.acct'
      '  from '
      '       glprepost_detail d,'
      '       glacct g,'
      '       jobshop_task t,'
      '       jobshop_rfq r,'
      '       arinvt a,'
      '       standard s,'
      '       sndop'
      ' where '
      '       d.id = :ID'
      '   and d.glacct_id = g.id(+)    '
      '   and d.cost_object_source = '#39'JOBSHOP_TASK'#39'     '
      '   and t.id = d.cost_object_id'
      '   and t.arinvt_id = a.id'
      '   and t.standard_id = s.id'
      '   and t.jobshop_rfq_id = r.id'
      '   and t.sndop_id = sndop.id(+)'
      '   ')
    Left = 568
    Top = 528
    ParamData = <
      item
        Name = 'ID'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object QryJobShopGJDESCRIP: TStringField
      DisplayLabel = 'Detail Description'
      FieldName = 'DESCRIP'
      Size = 100
    end
    object QryJobShopGJACCT: TStringField
      DisplayLabel = 'GL Account'
      FieldName = 'ACCT'
      Size = 50
    end
    object QryJobShopGJMFGNO: TStringField
      DisplayLabel = 'Manufacturing #'
      FieldName = 'MFGNO'
      Origin = 'IQ.STANDARD.MFGNO'
      Size = 50
    end
    object QryJobShopGJROUTE_SEQ: TBCDField
      DisplayLabel = 'Route #'
      FieldName = 'ROUTE_SEQ'
      Origin = 'IQ.STANDARD.ROUTE_SEQ'
      Size = 0
    end
    object QryJobShopGJMFG_TYPE: TStringField
      DisplayLabel = 'Manufacturing Type'
      FieldName = 'MFG_TYPE'
      Origin = 'IQ.STANDARD.MFG_TYPE'
      FixedChar = True
      Size = 10
    end
    object QryJobShopGJSph: TBCDField
      DisplayLabel = 'Rate/Hour'
      FieldKind = fkCalculated
      FieldName = 'Sph'
      DisplayFormat = '######0.00'
      Size = 0
      Calculated = True
    end
    object QryJobShopGJOPNO: TStringField
      DisplayLabel = 'Process #'
      FieldName = 'OPNO'
      Size = 15
    end
    object QryJobShopGJOPDESC: TStringField
      DisplayLabel = 'Process Description'
      DisplayWidth = 30
      FieldName = 'OPDESC'
      Size = 60
    end
    object QryJobShopGJSNDOP_DISPATCH_ID: TBCDField
      Tag = 1
      DisplayLabel = 'Dispatch ID'
      FieldName = 'SNDOP_DISPATCH_ID'
      Size = 0
    end
    object QryJobShopGJJOBSHOP_TASK_ID: TBCDField
      Tag = 1
      FieldName = 'JOBSHOP_TASK_ID'
      Visible = False
      Size = 0
    end
    object QryJobShopGJSTANDARD_ID: TBCDField
      Tag = 1
      FieldName = 'STANDARD_ID'
      Origin = 'IQ.ORD_DETAIL_TASK.STANDARD_ID'
      Visible = False
      Size = 0
    end
    object QryJobShopGJARINVT_ID: TBCDField
      Tag = 1
      FieldName = 'ARINVT_ID'
      Origin = 'IQ.ORD_DETAIL_TASK.ARINVT_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcMROArprepost: TDataSource
    DataSet = QryMROArprepost
    Left = 680
    Top = 16
  end
  object QryMROArprepost: TFDQuery
    BeforeOpen = AssignQueryParams
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select'
      '       pmwo_dtl.id as id,        '
      '       h.invoice_no as invoice_no,'
      
        '       decode( d.arinvt_id, NULL, SubStr( d.misc_item, 1, 35 ), ' +
        'd.itemno) as itemno,'
      '       pmwo.id as work_order_no,'
      '       pmwo.wo_date as wo_date, '
      
        '       decode( NVL( pmwo_dtl.pmjob_id, 0 ), 0, '#39'MISC'#39', v_pmjob.t' +
        'askno ) as taskno,       '
      '       pmeqmt.eqno as eqno,'
      '       pmeqmt.id as pmeqmt_id'
      'from'
      '       arprepost h,'
      '       V_ARPREPOST_DETAIL d,'
      '       pmwo,     '
      '       pmeqmt,             '
      '       pmwo_dtl,'
      '       v_pmjob'
      'where'
      '   d.id = :id and                     '
      '   h.id = d.arprepost_id'
      '   and d.cost_object_source = '#39'PMWO_DTL'#39'     '
      '   and d.cost_object_id = pmwo_dtl.id'
      '   and pmwo.id = pmwo_dtl.pmwo_id'
      '   and v_pmjob.id(+) = pmwo_dtl.pmjob_id   '
      '   and pmeqmt.id(+) = v_pmjob.pmeqmt_id'
      '')
    Left = 688
    Top = 24
    ParamData = <
      item
        Name = 'id'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object QryMROArprepostINVOICE_NO: TStringField
      DisplayLabel = 'Invoice #'
      FieldName = 'INVOICE_NO'
      Size = 25
    end
    object QryMROArprepostITEMNO: TStringField
      DisplayLabel = 'Invoice Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object QryMROArprepostWORK_ORDER_NO: TBCDField
      Tag = 1
      DisplayLabel = 'Work Order #'
      FieldName = 'WORK_ORDER_NO'
      Size = 0
    end
    object QryMROArprepostTASKNO: TStringField
      DisplayLabel = 'Task #'
      FieldName = 'TASKNO'
      Size = 50
    end
    object QryMROArprepostWO_DATE: TDateTimeField
      DisplayLabel = 'Work Order Date'
      FieldName = 'WO_DATE'
    end
    object QryMROArprepostEQNO: TStringField
      DisplayLabel = 'Equipment #'
      FieldName = 'EQNO'
      Size = 25
    end
    object QryMROArprepostPMEQMT_ID: TBCDField
      Tag = 1
      FieldName = 'PMEQMT_ID'
      Visible = False
      Size = 0
    end
    object QryMROArprepostID: TBCDField
      Tag = 1
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object SrcMROARInvoice: TDataSource
    DataSet = QryMROARInvoice
    Left = 680
    Top = 72
  end
  object QryMROARInvoice: TFDQuery
    BeforeOpen = AssignQueryParams
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select'
      '       pmwo_dtl.id as id,        '
      '       arinvoice.invoice_no as invoice_no,'
      
        '       decode( NVL( arinvoice_detail.arinvt_itemno, '#39#39'), '#39#39', Sub' +
        'Str( arinvoice_detail.misc_comment, 1, 35 ), arinvoice_detail.ar' +
        'invt_itemno ) as arinvt_itemno,'
      '       pmwo.id as work_order_no,'
      '       pmwo.wo_date as wo_date,'
      
        '       decode( pmwo_dtl.pmjob_id, NULL, '#39'MISC'#39', v_pmjob.taskno )' +
        ' as taskno, '
      '       pmeqmt.eqno as eqno,'
      '       pmeqmt.id as pmeqmt_id'
      'from'
      '       arinvoice,'
      '       arinvoice_detail,'
      '       pmwo,            '
      '       pmeqmt,             '
      '       pmwo_dtl,'
      '       v_pmjob'
      'where'
      '   arinvoice_detail.id = :id and                     '
      '   arinvoice.id = arinvoice_detail.arinvoice_id'
      '   and arinvoice_detail.cost_object_source = '#39'PMWO_DTL'#39'     '
      '   and pmwo_dtl.id = arinvoice_detail.cost_object_id'
      '   and pmwo.id = pmwo_dtl.pmwo_id   '
      '   and v_pmjob.id(+) = pmwo_dtl.pmjob_id   '
      '   and pmeqmt.id(+) = v_pmjob.pmeqmt_id')
    Left = 688
    Top = 80
    ParamData = <
      item
        Name = 'id'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object QryMROARInvoiceINVOICE_NO: TStringField
      DisplayLabel = 'Invoice #'
      FieldName = 'INVOICE_NO'
      Origin = 'ARINVOICE.INVOICE_NO'
      Size = 25
    end
    object QryMROARInvoiceARINVT_ITEMNO: TStringField
      DisplayLabel = 'Invoice Item #'
      FieldName = 'ARINVT_ITEMNO'
      Size = 50
    end
    object QryMROARInvoiceWORK_ORDER_NO: TBCDField
      Tag = 1
      DisplayLabel = 'Work Order #'
      FieldName = 'WORK_ORDER_NO'
      Origin = 'PMWO.ID'
      Size = 0
    end
    object QryMROARInvoiceTASKNO: TStringField
      DisplayLabel = 'Task #'
      FieldName = 'TASKNO'
      Origin = 'PMTASKS.TASKNO'
      Size = 50
    end
    object QryMROARInvoiceWO_DATE: TDateTimeField
      DisplayLabel = 'Work Order Date'
      FieldName = 'WO_DATE'
      Origin = 'PMWO.WO_DATE'
    end
    object QryMROARInvoiceEQNO: TStringField
      DisplayLabel = 'Equipment #'
      FieldName = 'EQNO'
      Origin = 'PMEQMT.EQNO'
      Size = 25
    end
    object QryMROARInvoicePMEQMT_ID: TBCDField
      Tag = 1
      FieldName = 'PMEQMT_ID'
      Origin = 'PMEQMT.ID'
      Visible = False
      Size = 0
    end
    object QryMROARInvoiceID: TBCDField
      Tag = 1
      FieldName = 'ID'
      Origin = 'PMWO_DTL.ID'
      Visible = False
      Size = 0
    end
  end
  object SrcMROApprepost: TDataSource
    DataSet = QryMROApprepost
    Left = 680
    Top = 128
  end
  object QryMROApprepost: TFDQuery
    BeforeOpen = AssignQueryParams
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select'
      '       h.invoice_no as invoice_no,'
      
        '       decode( po.arinvt_id, NULL, SubStr( d.misc_comment, 1, 35' +
        ' ), po.item_number ) as invoice_itemno,'
      '       pmwo.id as work_order_no,'
      
        '       decode( pmwo_dtl.pmjob_id, NULL, '#39'MISC'#39', v_pmjob.taskno )' +
        ' as taskno,'
      '       pmeqmt.eqno as eqno,'
      '       pmeqmt.id as pmeqmt_id,'
      '       d.po_detail_id,'
      '       pmwo.wo_date'
      'from'
      '       apprepost h,'
      '       apprepost_detail d,'
      '       v_po_detail po,'
      '       pmwo,'
      '       pmeqmt,'
      '       pmwo_dtl,'
      '       v_pmjob'
      'where'
      '   d.id = :id and'
      '   h.id = d.apprepost_id'
      '   and po.po_detail_id(+) = d.po_detail_id  '
      '   and d.cost_object_source = '#39'PMWO_DTL'#39
      '   and d.cost_object_id = pmwo_dtl.id'
      '   and pmwo.id = pmwo_dtl.pmwo_id'
      '   and v_pmjob.id(+) = pmwo_dtl.pmjob_id'
      '   and pmeqmt.id(+) = v_pmjob.pmeqmt_id')
    Left = 688
    Top = 136
    ParamData = <
      item
        Name = 'id'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object QryMROApprepostINVOICE_NO: TStringField
      DisplayLabel = 'Invoice #'
      FieldName = 'INVOICE_NO'
      Size = 50
    end
    object QryMROApprepostINVOICE_ITEMNO: TStringField
      DisplayLabel = 'Invoice Item #'
      FieldName = 'INVOICE_ITEMNO'
      Size = 35
    end
    object QryMROApprepostWORK_ORDER_NO: TBCDField
      Tag = 1
      DisplayLabel = 'Work Order #'
      FieldName = 'WORK_ORDER_NO'
      Size = 0
    end
    object QryMROApprepostTASKNO: TStringField
      DisplayLabel = 'Task #'
      FieldName = 'TASKNO'
      Size = 50
    end
    object QryMROApprepostWO_DATE: TDateTimeField
      DisplayLabel = 'Work Order Date'
      FieldName = 'WO_DATE'
    end
    object QryMROApprepostEQNO: TStringField
      DisplayLabel = 'Equipment #'
      FieldName = 'EQNO'
      Size = 25
    end
    object QryMROApprepostPMEQMT_ID: TBCDField
      Tag = 1
      FieldName = 'PMEQMT_ID'
      Visible = False
      Size = 0
    end
    object QryMROApprepostPO_DETAIL_ID: TBCDField
      Tag = 1
      FieldName = 'PO_DETAIL_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcMROAPInvoice: TDataSource
    DataSet = QryMROAPInvoice
    Left = 680
    Top = 184
  end
  object QryMROAPInvoice: TFDQuery
    BeforeOpen = AssignQueryParams
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select'
      '       apinvoice.invoice_no as invoice_no,'
      
        '       decode( NVL( d.arinvt_itemno, '#39#39'), '#39#39', SubStr( d.misc_com' +
        'ment, 1, 35 ), d.arinvt_itemno ) as ap_itemno,'
      '       pmwo.id as work_order_no,'
      
        '       decode( pmwo_dtl.pmjob_id, NULL, '#39'MISC'#39', v_pmjob.taskno )' +
        ' as taskno,'
      '       pmeqmt.eqno as eqno,'
      '       pmeqmt.id as pmeqmt_id,'
      '       pmwo.wo_date'
      'from'
      '       apinvoice,'
      '       apinvoice_detail d,'
      '       pmwo,       '
      '       pmeqmt,'
      '       pmwo_dtl,'
      '       v_pmjob'
      'where'
      '   d.id = :ID and'
      '   apinvoice.id = d.apinvoice_id'
      '   and d.cost_object_source = '#39'PMWO_DTL'#39
      '   and d.cost_object_id = pmwo_dtl.id'
      '   and pmwo.id = pmwo_dtl.pmwo_id'
      '   and v_pmjob.id(+) = pmwo_dtl.pmjob_id'
      '   and pmeqmt.id(+) = v_pmjob.pmeqmt_id')
    Left = 688
    Top = 192
    ParamData = <
      item
        Name = 'id'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object QryMROAPInvoiceINVOICE_NO: TStringField
      DisplayLabel = 'Invoice #'
      FieldName = 'INVOICE_NO'
      Size = 50
    end
    object QryMROAPInvoiceAP_ITEMNO: TStringField
      DisplayLabel = 'Invoice Item #'
      FieldName = 'AP_ITEMNO'
      Size = 35
    end
    object QryMROAPInvoiceWORK_ORDER_NO: TBCDField
      Tag = 1
      DisplayLabel = 'Work Order #'
      FieldName = 'WORK_ORDER_NO'
      Size = 0
    end
    object QryMROAPInvoiceTASKNO: TStringField
      DisplayLabel = 'Task #'
      FieldName = 'TASKNO'
      Size = 50
    end
    object QryMROAPInvoiceWO_DATE: TDateTimeField
      DisplayLabel = 'Work Order Date'
      FieldName = 'WO_DATE'
    end
    object QryMROAPInvoiceEQNO: TStringField
      DisplayLabel = 'Equipment #'
      FieldName = 'EQNO'
      Size = 25
    end
    object QryMROAPInvoicePMEQMT_ID: TBCDField
      Tag = 1
      FieldName = 'PMEQMT_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcMROOrders: TDataSource
    DataSet = QryMROOrders
    Left = 680
    Top = 240
  end
  object QryMROOrders: TFDQuery
    BeforeOpen = AssignQueryParams
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select'
      '       orders.orderno,'
      
        '       decode( arinvt.id, NULL, SubStr( d.misc_item, 1, 35 ), ar' +
        'invt.itemno) as oe_itemno,'
      '       pmwo.id as work_order_no,'
      
        '       decode( pmwo_dtl.pmjob_id, NULL, '#39'MISC'#39', v_pmjob.taskno )' +
        ' as taskno,'
      '       pmeqmt.eqno as eqno,'
      '       pmeqmt.id as pmeqmt_id,'
      '       pmwo.wo_date'
      'from'
      '       orders,'
      '       ord_detail d,'
      '       pmwo,       '
      '       pmeqmt,'
      '       pmwo_dtl,'
      '       v_pmjob,'
      '       arinvt'
      'where'
      '   d.id = :id and'
      '   orders.id = d.orders_id'
      '   and d.cost_object_source = '#39'PMWO_DTL'#39
      '   and d.cost_object_id = pmwo_dtl.id'
      '   and pmwo.id = pmwo_dtl.pmwo_id'
      '   and v_pmjob.id(+) = pmwo_dtl.pmjob_id'
      '   and pmeqmt.id(+) = v_pmjob.pmeqmt_id'
      '   and arinvt.id(+) = d.arinvt_id')
    Left = 688
    Top = 248
    ParamData = <
      item
        Name = 'id'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object QryMROOrdersORDERNO: TStringField
      DisplayLabel = 'Order #'
      FieldName = 'ORDERNO'
      Size = 15
    end
    object QryMROOrdersOE_ITEMNO: TStringField
      DisplayLabel = 'Order Item #'
      FieldName = 'OE_ITEMNO'
      Size = 35
    end
    object QryMROOrdersWORK_ORDER_NO: TBCDField
      Tag = 1
      DisplayLabel = 'Work Order #'
      FieldName = 'WORK_ORDER_NO'
      Size = 0
    end
    object QryMROOrdersTASKNO: TStringField
      DisplayLabel = 'Task #'
      FieldName = 'TASKNO'
      Size = 50
    end
    object QryMROOrdersWO_DATE: TDateTimeField
      DisplayLabel = 'Work Order Date'
      FieldName = 'WO_DATE'
    end
    object QryMROOrdersEQNO: TStringField
      DisplayLabel = 'Equipment #'
      FieldName = 'EQNO'
      Size = 25
    end
    object QryMROOrdersPMEQMT_ID: TBCDField
      Tag = 1
      FieldName = 'PMEQMT_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcMROOrderHist: TDataSource
    DataSet = QryMROOrderHist
    Left = 680
    Top = 296
  end
  object QryMROOrderHist: TFDQuery
    BeforeOpen = AssignQueryParams
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select'
      '       o.orderno,'
      
        '       decode( d.arinvt_id, NULL, SubStr( d.misc_item, 1, 35 ), ' +
        'd.arinvt_itemno) as oe_itemno,'
      '       pmwo.id as work_order_no,'
      
        '       decode( pmwo_dtl.pmjob_id, NULL, '#39'MISC'#39', v_pmjob.taskno )' +
        ' as taskno,'
      '       pmeqmt.eqno as eqno,'
      '       pmeqmt.id as pmeqmt_id,'
      '       pmwo.wo_date'
      'from'
      '       hist_orders o,'
      '       hist_ord_detail d,'
      '       pmwo,       '
      '       pmeqmt,'
      '       pmwo_dtl,'
      '       v_pmjob,'
      '       arinvt'
      'where'
      '   d.id = :id and'
      '   o.id = d.orders_id'
      '   and d.cost_object_source = '#39'PMWO_DTL'#39
      '   and d.cost_object_id = pmwo_dtl.id'
      '   and pmwo.id = pmwo_dtl.pmwo_id'
      '   and v_pmjob.id(+) = pmwo_dtl.pmjob_id'
      '   and pmeqmt.id(+) = v_pmjob.pmeqmt_id'
      '   and arinvt.id(+) = d.arinvt_id')
    Left = 688
    Top = 304
    ParamData = <
      item
        Name = 'id'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object QryMROOrderHistORDERNO: TStringField
      DisplayLabel = 'Order #'
      FieldName = 'ORDERNO'
      Size = 15
    end
    object QryMROOrderHistOE_ITEMNO: TStringField
      DisplayLabel = 'Order Item #'
      FieldName = 'OE_ITEMNO'
      Size = 35
    end
    object QryMROOrderHistWORK_ORDER_NO: TBCDField
      Tag = 1
      DisplayLabel = 'Work Order #'
      FieldName = 'WORK_ORDER_NO'
      Size = 0
    end
    object QryMROOrderHistTASKNO: TStringField
      DisplayLabel = 'Task #'
      FieldName = 'TASKNO'
      Size = 50
    end
    object QryMROOrderHistWO_DATE: TDateTimeField
      DisplayLabel = 'Work Order Date'
      FieldName = 'WO_DATE'
    end
    object QryMROOrderHistEQNO: TStringField
      DisplayLabel = 'Equipment #'
      FieldName = 'EQNO'
      Size = 25
    end
    object QryMROOrderHistPMEQMT_ID: TBCDField
      Tag = 1
      FieldName = 'PMEQMT_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcMROPO: TDataSource
    DataSet = QryMROPO
    Left = 680
    Top = 352
  end
  object QryMROPO: TFDQuery
    BeforeOpen = AssignQueryParams
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct'
      '       po_detail.id as Pid,'
      '       pmwo_dtl.id as id,        '
      '       po.pono,'
      
        '       decode( po_detail.arinvt_id, NULL, SubStr( po_detail.misc' +
        '_item, 1, 35 ), arinvt.itemno ) as itemno,'
      '       pmwo.id as work_order_no,'
      '       pmwo.wo_date as wo_date, '
      
        '       decode( NVL( pmwo_dtl.pmjob_id, 0 ), 0, '#39'MISC'#39', v_pmjob.t' +
        'askno ) as taskno,'
      
        '       SubStr( decode( NVL( pmwo_dtl.pmjob_id, 0 ), 0, pmwo_dtl.' +
        'comment1, v_pmjob.descrip ) , 0, 250 ) as task_descrip,       '
      '       pmeqmt.eqno as eqno,'
      '       pmeqmt.id as pmeqmt_id'
      'from'
      '       po,'
      '       po_detail,'
      '       pmwo,      '
      '       arinvt, '
      '       pmeqmt,             '
      '       pmwo_dtl,'
      '       v_pmjob'
      'where'
      '   po_detail.id = :ID and                     '
      '   po.id = po_detail.po_id   '
      '   and NVL( po_detail.cost_object_source, '#39#39' ) = '#39'PMWO_DTL'#39'     '
      '   and pmwo_dtl.id = po_detail.cost_object_id'
      '   and v_pmjob.id(+) = pmwo_dtl.pmjob_id   '
      '   and pmwo.id = pmwo_dtl.pmwo_id'
      '   and arinvt.id(+) = po_detail.arinvt_id'
      '   and pmeqmt.id(+) = v_pmjob.pmeqmt_id')
    Left = 688
    Top = 360
    ParamData = <
      item
        Name = 'id'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object QryMROPOPONO: TStringField
      DisplayLabel = 'PO #'
      FieldName = 'PONO'
      Size = 15
    end
    object QryMROPOITEMNO: TStringField
      DisplayLabel = 'PO Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object QryMROPOWORK_ORDER_NO: TBCDField
      Tag = 1
      DisplayLabel = 'Work Order #'
      FieldName = 'WORK_ORDER_NO'
      Size = 0
    end
    object QryMROPOTASKNO: TStringField
      DisplayLabel = 'Task #'
      FieldName = 'TASKNO'
      Size = 50
    end
    object QryMROPOWO_DATE: TDateTimeField
      DisplayLabel = 'Work Order Date'
      FieldName = 'WO_DATE'
    end
    object QryMROPOEQNO: TStringField
      DisplayLabel = 'Equipment #'
      FieldName = 'EQNO'
      Size = 25
    end
    object QryMROPOPMEQMT_ID: TBCDField
      Tag = 1
      FieldName = 'PMEQMT_ID'
      Visible = False
      Size = 0
    end
    object QryMROPOID: TBCDField
      Tag = 1
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object SrcMROPOHist: TDataSource
    DataSet = QryMROPOHist
    Left = 680
    Top = 408
  end
  object QryMROPOHist: TFDQuery
    BeforeOpen = AssignQueryParams
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select'
      '       dtl.id as id,        '
      '       po.pono,'
      
        '       decode( NVL( dtl.arinvt_itemno, '#39#39' ), '#39#39', SubStr( dtl.mis' +
        'c_item, 1, 35 ), dtl.arinvt_itemno ) as itemno,       '
      '       pmwo.id as work_order_no,'
      '       pmwo.wo_date as wo_date, '
      
        '       decode( pmwo_dtl.pmjob_id, NULL, '#39'MISC'#39', v_pmjob.taskno )' +
        ' as taskno,'
      '       pmeqmt.eqno as eqno,'
      '       pmeqmt.id as pmeqmt_id'
      'from'
      '       po_hist po,'
      '       po_detail_hist dtl,'
      '       pmwo,      '
      '       pmeqmt,             '
      '       pmwo_dtl,'
      '       v_pmjob'
      'where'
      '   dtl.id = :ID and                     '
      '   po.id = dtl.po_id   '
      '   and dtl.cost_object_source = '#39'PMWO_DTL'#39'     '
      '   and pmwo_dtl.id = dtl.cost_object_id'
      '   and pmwo.id = pmwo_dtl.pmwo_id'
      '   and v_pmjob.id(+) = pmwo_dtl.pmjob_id   '
      '   and pmeqmt.id(+) = v_pmjob.pmeqmt_id')
    Left = 688
    Top = 416
    ParamData = <
      item
        Name = 'id'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object QryMROPOHistPONO: TStringField
      DisplayLabel = 'PO #'
      FieldName = 'PONO'
      Size = 15
    end
    object QryMROPOHistITEMNO: TStringField
      DisplayLabel = 'PO Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object QryMROPOHistWORK_ORDER_NO: TBCDField
      Tag = 1
      DisplayLabel = 'Work Order #'
      FieldName = 'WORK_ORDER_NO'
      Size = 0
    end
    object QryMROPOHistTASKNO: TStringField
      DisplayLabel = 'Task #'
      FieldName = 'TASKNO'
      Size = 50
    end
    object QryMROPOHistWO_DATE: TDateTimeField
      DisplayLabel = 'Work Order Date'
      FieldName = 'WO_DATE'
    end
    object QryMROPOHistEQNO: TStringField
      DisplayLabel = 'Equipment #'
      FieldName = 'EQNO'
      Size = 25
    end
    object QryMROPOHistPMEQMT_ID: TBCDField
      Tag = 1
      FieldName = 'PMEQMT_ID'
      Visible = False
      Size = 0
    end
    object QryMROPOHistID: TBCDField
      Tag = 1
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object SrcMROGL: TDataSource
    DataSet = QryMROGL
    Left = 680
    Top = 464
  end
  object QryMROGL: TFDQuery
    BeforeOpen = AssignQueryParams
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select d.descrip as GJ_Descrip,'
      '       NVL(d.debit, 0) + NVL(d.credit, 0) as debit_credit,'
      ''
      '       pmwo.id as work_order_no,'
      
        '       decode( pmwo_dtl.pmjob_id, NULL, '#39'MISC'#39', v_pmjob.taskno )' +
        ' as taskno,'
      '       pmeqmt.eqno as eqno,'
      '       pmeqmt.id as pmeqmt_id,'
      '       pmwo.wo_date'
      'from  glbatch d,'
      '       pmwo,'
      '       pmeqmt,'
      '       pmwo_dtl,'
      '       v_pmjob'
      'where d.id = :id'
      '   and d.cost_object_source = '#39'PMWO_DTL'#39
      '   and d.cost_object_id = pmwo_dtl.id'
      '   and pmwo.id = pmwo_dtl.pmwo_id'
      '   and v_pmjob.id(+) = pmwo_dtl.pmjob_id'
      '   and pmeqmt.id(+) = v_pmjob.pmeqmt_id')
    Left = 688
    Top = 472
    ParamData = <
      item
        Name = 'id'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object QryMROGLGJ_DESCRIP: TStringField
      DisplayLabel = 'GJ Description'
      FieldName = 'GJ_DESCRIP'
      Size = 100
    end
    object QryMROGLDEBIT_CREDIT: TFMTBCDField
      DisplayLabel = 'Debit/Credit'
      FieldName = 'DEBIT_CREDIT'
      Size = 0
    end
    object QryMROGLWORK_ORDER_NO: TBCDField
      Tag = 1
      DisplayLabel = 'Work Order #'
      FieldName = 'WORK_ORDER_NO'
      Size = 0
    end
    object QryMROGLTASKNO: TStringField
      DisplayLabel = 'Task #'
      FieldName = 'TASKNO'
      Size = 50
    end
    object QryMROGLWO_DATE: TDateTimeField
      DisplayLabel = 'Work Order Date'
      FieldName = 'WO_DATE'
    end
    object QryMROGLEQNO: TStringField
      DisplayLabel = 'Equipment #'
      FieldName = 'EQNO'
      Size = 25
    end
    object QryMROGLPMEQMT_ID: TBCDField
      Tag = 1
      FieldName = 'PMEQMT_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcMROGJ: TDataSource
    DataSet = QryMROGJ
    Left = 680
    Top = 520
  end
  object QryMROGJ: TFDQuery
    BeforeOpen = AssignQueryParams
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select d.descrip as GJ_Descrip,'
      '       NVL(d.debit, 0) + NVL(d.credit, 0) as debit_credit,'
      ''
      '       pmwo.id as work_order_no,'
      
        '       decode( pmwo_dtl.pmjob_id, NULL, '#39'MISC'#39', v_pmjob.taskno )' +
        ' as taskno,'
      '       pmeqmt.eqno as eqno,'
      '       pmeqmt.id as pmeqmt_id,'
      '       pmwo.wo_date'
      'from  glprepost_detail d,'
      '       pmwo,'
      '       pmeqmt,'
      '       pmwo_dtl,'
      '       v_pmjob'
      'where d.id = :id'
      '   and d.cost_object_source = '#39'PMWO_DTL'#39
      '   and d.cost_object_id = pmwo_dtl.id'
      '   and pmwo.id = pmwo_dtl.pmwo_id'
      '   and v_pmjob.id(+) = pmwo_dtl.pmjob_id'
      '   and pmeqmt.id(+) = v_pmjob.pmeqmt_id')
    Left = 688
    Top = 528
    ParamData = <
      item
        Name = 'id'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object QryMROGJGJ_DESCRIP: TStringField
      DisplayLabel = 'GJ Description'
      FieldName = 'GJ_DESCRIP'
      Size = 100
    end
    object QryMROGJDEBIT_CREDIT: TFMTBCDField
      DisplayLabel = 'Debit/Credit'
      FieldName = 'DEBIT_CREDIT'
      Size = 0
    end
    object QryMROGJWORK_ORDER_NO: TBCDField
      Tag = 1
      DisplayLabel = 'Work Order #'
      FieldName = 'WORK_ORDER_NO'
      Size = 0
    end
    object QryMROGJTASKNO: TStringField
      DisplayLabel = 'Task #'
      FieldName = 'TASKNO'
      Size = 50
    end
    object QryMROGJWO_DATE: TDateTimeField
      DisplayLabel = 'Work Order Date'
      FieldName = 'WO_DATE'
    end
    object QryMROGJEQNO: TStringField
      DisplayLabel = 'Equipment #'
      FieldName = 'EQNO'
      Size = 25
    end
    object QryMROGJPMEQMT_ID: TBCDField
      Tag = 1
      FieldName = 'PMEQMT_ID'
      Visible = False
      Size = 0
    end
  end
  object JobShopAppDef1: TIQWebAppDef
    AppCode = 'BOM'
    DataField = 'MFG_TYPE'
    Left = 40
    Top = 464
  end
end
