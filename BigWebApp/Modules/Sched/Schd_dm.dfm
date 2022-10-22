object SchdDM: TSchdDM
  OldCreateOrder = True
  OnCreate = SchdDMCreate
  OnDestroy = SchdDMDestroy
  Height = 465
  Width = 438
  object QryV_Sched: TFDQuery
    Tag = 1
    BeforeOpen = QryV_SchedBeforeOpen
    OnCalcFields = QryV_SchedCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select x.cycles_to_go,'
      '       case x.lookup_mfgtype'
      '          when '#39'EXTRUSION'#39' then'
      
        '               UOM.IQConvert( '#39'FT'#39', x.uom, x.cycles_to_go, -1, '#39 +
        'Y'#39' )'
      '          when '#39'EXTRUSION2'#39' then'
      '               uom.IQConvert( '#39'LBS'#39', '
      
        '                              uom.native_uom_ExA('#39'LBS'#39', x.eplant' +
        '_id), '
      
        '                              x.Cycles_To_Go * (select sprue_dis' +
        'p from standard where id = x.standard_id),'
      '                              -1,'
      '                              '#39'Y'#39')'
      '          when '#39'COMPOUND1'#39' then'
      
        '               x.Cycles_To_Go * (select lbsk from standard where' +
        ' id = x.standard_id) / 1000'
      '          when '#39'SLITTING'#39' then'
      
        '               decode(mfg.is_weight(x.mfgtype), 1, x.Cycles_To_G' +
        'o, UOM.IQConvert( '#39'FT'#39', x.uom, x.cycles_to_go, -1, '#39'Y'#39' ))'
      '          else'
      '               x.Cycles_To_Go'
      '       end as units_to_go,'
      ''
      '       x.hours_to_go,'
      ''
      '       x.uom'
      ''
      '  from ( select /*+ ORDERED */'
      '                sched.CNTR_SEQ,'
      '                wo.standard_id,'
      '                sched.HOURS_TO_GO,'
      '                sched.setuphrs,'
      ''
      '                case'
      
        '                  when rtrim(nvl(m.standard_mfgtype, m.mfgtype))' +
        ' = '#39'ASSY1'#39' then'
      '                     decode( sched.illum_rt_id, '
      
        '                             NULL, assy1_sched.get_process_data(' +
        ' sched.sndop_dispatch_id, '#39'PARTS_TO_GO'#39'),'
      
        '                             RT_Cycles_To_Go( sched.WORK_CENTER_' +
        'ID ))'
      '                  else '
      '                     decode( sched.illum_rt_id, '
      '                             NULL, wo.cycles_req, '
      
        '                             RT_Cycles_To_Go( sched.WORK_CENTER_' +
        'ID ))'
      '                end as Cycles_To_Go,'
      '                                '
      '                s.uom,'
      '                m.mfgtype,'
      
        '                rtrim(nvl(m.standard_mfgtype, m.mfgtype)) as loo' +
        'kup_mfgtype,'
      '                s.eplant_id'
      ''
      '           from v_sched_hrs_to_go_EX sched,'
      '                workorder wo,'
      '                standard s,'
      '                mfgtype m'
      '          where sched.workorder_id = wo.id(+)'
      '            and wo.standard_id = s.id(+)'
      '            and rtrim(s.mfg_type) = rtrim(m.mfgtype(+))'
      '            and sched.ID = :cntr_sched_id) x'
      ''
      '')
    Left = 119
    Top = 75
    ParamData = <
      item
        Name = 'cntr_sched_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryV_SchedCYCLES_TO_GO: TFMTBCDField
      FieldName = 'CYCLES_TO_GO'
      Origin = 'IQ.V_SCHED_A.CYCLES_TO_GO'
      Size = 38
    end
    object QryV_SchedHOURS_TO_GO: TFMTBCDField
      FieldName = 'HOURS_TO_GO'
      Origin = 'IQ.V_SCHED_A.HOURS_TO_GO'
      Size = 38
    end
    object QryV_SchedUNITS_TO_GO: TFMTBCDField
      FieldName = 'UNITS_TO_GO'
      Origin = 'IQ.V_SCHED_A.UNITS_TO_GO'
      Size = 38
    end
    object QryV_SchedUOM: TStringField
      FieldName = 'UOM'
      Origin = 'IQ.V_SCHED_A.UOM'
      Size = 10
    end
  end
  object SrcParams: TDataSource
    DataSet = TblParams
    Left = 24
    Top = 138
  end
  object TblParams: TFDTable
    OnDeleteError = HandleError
    OnEditError = HandleError
    OnPostError = HandleError
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode, uvLockWait]
    UpdateOptions.LockWait = True
    UpdateOptions.UpdateTableName = 'IQMS.PARAMS'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'IQMS.PARAMS'
    Left = 36
    Top = 150
    object TblParamsSCHED_SCOPE: TBCDField
      FieldName = 'SCHED_SCOPE'
      Size = 0
    end
    object TblParamsMFG_SCOPE: TBCDField
      FieldName = 'MFG_SCOPE'
      Size = 0
    end
    object TblParamsSHIFTS: TBCDField
      FieldName = 'SHIFTS'
      Size = 0
    end
    object TblParamsSHIFT_START1: TStringField
      FieldName = 'SHIFT_START1'
      Size = 8
    end
    object TblParamsSHIFT_START2: TStringField
      FieldName = 'SHIFT_START2'
      Size = 8
    end
    object TblParamsSHIFT_START3: TStringField
      FieldName = 'SHIFT_START3'
      Size = 8
    end
    object TblParamsMFG_DAYS_WEEK: TBCDField
      FieldName = 'MFG_DAYS_WEEK'
      Size = 0
    end
    object TblParamsASSY_DAYS_WEEK: TBCDField
      FieldName = 'ASSY_DAYS_WEEK'
      Size = 0
    end
    object TblParamsSCHED_POOL_OVERRIDE: TStringField
      FieldName = 'SCHED_POOL_OVERRIDE'
      Size = 1
    end
    object TblParamsMFG_SHIFT1: TStringField
      FieldName = 'MFG_SHIFT1'
      Size = 1
    end
    object TblParamsMFG_SHIFT2: TStringField
      FieldName = 'MFG_SHIFT2'
      Size = 1
    end
    object TblParamsMFG_SHIFT3: TStringField
      FieldName = 'MFG_SHIFT3'
      Size = 1
    end
    object TblParamsASSY_SHIFT1: TStringField
      FieldName = 'ASSY_SHIFT1'
      Size = 1
    end
    object TblParamsASSY_SHIFT2: TStringField
      FieldName = 'ASSY_SHIFT2'
      Size = 1
    end
    object TblParamsASSY_SHIFT3: TStringField
      FieldName = 'ASSY_SHIFT3'
      Size = 1
    end
    object TblParamsTIME_FENCE: TBCDField
      FieldName = 'TIME_FENCE'
      Size = 0
    end
    object TblParamsSAFETY_LEAD_TIME: TBCDField
      FieldName = 'SAFETY_LEAD_TIME'
      Size = 0
    end
    object TblParamsCAPACITY_SCOPE: TBCDField
      FieldName = 'CAPACITY_SCOPE'
      Size = 0
    end
    object TblParamsFR_HIDE: TStringField
      FieldName = 'FR_HIDE'
      FixedChar = True
      Size = 1
    end
    object TblParamsSCHED_EVAL_NEG_CONS: TStringField
      FieldName = 'SCHED_EVAL_NEG_CONS'
      FixedChar = True
      Size = 1
    end
    object TblParamsWO_CASCADE_FIRM: TStringField
      FieldName = 'WO_CASCADE_FIRM'
      FixedChar = True
      Size = 1
    end
    object TblParamsSCHED_MOVE_SAME_TOOL_WO: TStringField
      FieldName = 'SCHED_MOVE_SAME_TOOL_WO'
      FixedChar = True
      Size = 1
    end
    object TblParamsSCHED_INC_LOT_ON_SETUP: TStringField
      FieldName = 'SCHED_INC_LOT_ON_SETUP'
      FixedChar = True
      Size = 1
    end
    object TblParamsSCHED_CHK_RUNSBEST_ON_INSERT: TStringField
      FieldName = 'SCHED_CHK_RUNSBEST_ON_INSERT'
      FixedChar = True
      Size = 1
    end
    object TblParamsDEL_FIRM_WO: TStringField
      FieldName = 'DEL_FIRM_WO'
      FixedChar = True
      Size = 1
    end
    object TblParamsSCHED_INC_LOT_EXCLUDE_SAME_MFG: TStringField
      FieldName = 'SCHED_INC_LOT_EXCLUDE_SAME_MFG'
      FixedChar = True
      Size = 1
    end
    object TblParamsSCHED_USE_WO_FOR_LOTNO: TStringField
      FieldName = 'SCHED_USE_WO_FOR_LOTNO'
      FixedChar = True
      Size = 1
    end
    object TblParamsAUTO_LOAD_EVAL_CONF: TStringField
      FieldName = 'AUTO_LOAD_EVAL_CONF'
      Size = 1
    end
    object TblParamsSCHED_RESET_MANUAL_WO_QTY: TStringField
      FieldName = 'SCHED_RESET_MANUAL_WO_QTY'
      Size = 1
    end
    object TblParamsCAPACITY_AVAIL_THRESHOLD: TBCDField
      FieldName = 'CAPACITY_AVAIL_THRESHOLD'
      Size = 2
    end
    object TblParamsCAPACITY_BOOKED_THRESHOLD: TBCDField
      FieldName = 'CAPACITY_BOOKED_THRESHOLD'
      Size = 2
    end
    object TblParamsSCHED_FIRM_ON_SETUP: TStringField
      FieldName = 'SCHED_FIRM_ON_SETUP'
      Visible = False
      Size = 1
    end
    object TblParamsSCHED_ALLOC_BY_DIVISION: TStringField
      FieldName = 'SCHED_ALLOC_BY_DIVISION'
      Visible = False
      Size = 1
    end
    object TblParamsFR_WO_SCOPE: TBCDField
      FieldName = 'FR_WO_SCOPE'
      Visible = False
      Size = 0
    end
    object TblParamsSCHED_AUTO_REMOVE_EMPTY_WO: TStringField
      FieldName = 'SCHED_AUTO_REMOVE_EMPTY_WO'
      Visible = False
      Size = 1
    end
    object TblParamsSCHED_COMBINE_SO_FORECAST_WO: TStringField
      FieldName = 'SCHED_COMBINE_SO_FORECAST_WO'
      Visible = False
      Size = 1
    end
    object TblParamsAUTO_LOAD_SCOPE: TBCDField
      FieldName = 'AUTO_LOAD_SCOPE'
      Visible = False
      Size = 2
    end
    object TblParamsAUTO_LOAD_BACKPASS: TStringField
      FieldName = 'AUTO_LOAD_BACKPASS'
      Size = 1
    end
    object TblParamsSCHED_CHECK_MRO: TStringField
      FieldName = 'SCHED_CHECK_MRO'
      Size = 1
    end
    object TblParamsUSE_MFG_MIN_QTY_BUCKET: TStringField
      FieldName = 'USE_MFG_MIN_QTY_BUCKET'
      Size = 1
    end
    object TblParamsSCHED_RUN_AUTO_LOAD: TStringField
      FieldName = 'SCHED_RUN_AUTO_LOAD'
      Size = 1
    end
    object TblParamsMAT_REQ_IGNORE_HARD_ALLOC: TStringField
      FieldName = 'MAT_REQ_IGNORE_HARD_ALLOC'
      Size = 1
    end
    object TblParamsID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object SrcWorkOrder: TDataSource
    Left = 114
    Top = 6
  end
  object SrcWork_Center: TDataSource
    DataSet = TblWork_Center
    OnDataChange = SrcWork_CenterDataChange
    Left = 22
    Top = 72
  end
  object TblWork_Center: TFDTable
    BeforeOpen = AssignEPlantFilter
    OnCalcFields = TblWork_CenterCalcFields
    OnDeleteError = HandleError
    OnEditError = HandleError
    OnPostError = HandleError
    Filtered = True
    OnFilterRecord = TblWork_CenterFilterRecord
    IndexFieldNames = 'EQNO'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'IQMS.WORK_CENTER'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'IQMS.WORK_CENTER'
    Left = 33
    Top = 84
    object TblWork_CenterID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 0
    end
    object TblWork_CenterEQNO: TStringField
      FieldName = 'EQNO'
      Required = True
      Size = 60
    end
    object TblWork_CenterCNTR_TYPE: TStringField
      FieldName = 'CNTR_TYPE'
      Required = True
    end
    object TblWork_CenterMFGCELL: TStringField
      FieldName = 'MFGCELL'
      Size = 15
    end
    object TblWork_CenterMFG_TYPE: TStringField
      FieldName = 'MFG_TYPE'
      Size = 10
    end
    object TblWork_CenterCNTR_DESC: TStringField
      FieldName = 'CNTR_DESC'
      Size = 250
    end
    object TblWork_CenterCAPACITY: TBCDField
      FieldName = 'CAPACITY'
      Size = 2
    end
    object TblWork_CenterIS_RT: TStringField
      FieldName = 'IS_RT'
      Size = 1
    end
    object TblWork_CenterASY_MACH: TStringField
      FieldName = 'ASY_MACH'
      Size = 1
    end
    object TblWork_CenterEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object TblWork_CenterEPlant_Name: TStringField
      DisplayLabel = 'EPlant Name'
      FieldKind = fkLookup
      FieldName = 'EPlant_Name'
      LookupDataSet = QryEPlant
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIP'
      KeyFields = 'EPLANT_ID'
      Lookup = True
    end
    object TblWork_CenterSNAP_TO_LAST: TBCDField
      FieldName = 'SNAP_TO_LAST'
      Size = 0
    end
    object TblWork_CenterPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object TblWork_CenterSCHED_JIT: TStringField
      FieldName = 'SCHED_JIT'
      FixedChar = True
      Size = 1
    end
    object TblWork_CenterLookup_Mfgtype: TStringField
      FieldKind = fkCalculated
      FieldName = 'Lookup_Mfgtype'
      Size = 10
      Calculated = True
    end
    object TblWork_CenterMFGCELL_ID: TBCDField
      FieldName = 'MFGCELL_ID'
      Visible = False
      Size = 0
    end
    object TblWork_CenterFRAME_ID: TBCDField
      FieldName = 'FRAME_ID'
      Visible = False
      Size = 0
    end
    object TblWork_CenterFRAME_SET_ID: TBCDField
      FieldName = 'FRAME_SET_ID'
      Visible = False
      Size = 0
    end
    object TblWork_CenterFRAME_ARINVT_ID_MAT: TBCDField
      FieldName = 'FRAME_ARINVT_ID_MAT'
      Visible = False
      Size = 0
    end
    object TblWork_CenterFRAME_PARENT_WORK_CENTER_ID: TBCDField
      FieldName = 'FRAME_PARENT_WORK_CENTER_ID'
      Visible = False
      Size = 0
    end
    object TblWork_CenterPARENT_ID: TBCDField
      FieldName = 'PARENT_ID'
      Visible = False
      Size = 0
    end
  end
  object QryPMEqmt: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select s.id,'
      '       s.pmeqmt_id,'
      '       p.eqno,'
      '       p.service_date_in,'
      '       p.service_date_out'
      '  from standard s, pmeqmt p'
      ' where s.pmeqmt_id = p.id'
      '   '
      ' '
      ' ')
    Left = 252
    Top = 76
    object QryPMEqmtID: TBCDField
      FieldName = 'ID'
      Origin = 'STANDARD.ID'
      Size = 0
    end
    object QryPMEqmtPMEQMT_ID: TBCDField
      FieldName = 'PMEQMT_ID'
      Origin = 'STANDARD.PMEQMT_ID'
      Size = 0
    end
    object QryPMEqmtEQNO: TStringField
      FieldName = 'EQNO'
      Origin = 'PMEQMT.EQNO'
      Size = 25
    end
    object QryPMEqmtSERVICE_DATE_IN: TDateTimeField
      FieldName = 'SERVICE_DATE_IN'
      Origin = 'PMEQMT.SERVICE_DATE_IN'
    end
    object QryPMEqmtSERVICE_DATE_OUT: TDateTimeField
      FieldName = 'SERVICE_DATE_OUT'
      Origin = 'PMEQMT.SERVICE_DATE_OUT'
    end
  end
  object SrcPtOrder: TDataSource
    DataSet = QryPtOrder
    Left = 192
    Top = 6
  end
  object QryPtOrder: TFDQuery
    OnCalcFields = QryPtOrderCalcFields
    Filtered = True
    MasterSource = SrcCntr_Sched
    MasterFields = 'WORKORDER_ID;SNDOP_DISPATCH_ID'
    DetailFields = 'WORKORDER_ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select v.id,'
      '       v.workorder_id,'
      '       v.partno_id,'
      '       v.rel_date,'
      '       v.rel_quan,'
      '       v.orderno,'
      '       v.pono,'
      '       v.ptallocate_id,'
      '       v.arinvt_id,'
      '       s.id as standard_id, '
      '       v.class,'
      '       v.itemno,'
      '       v.rev,'
      '       v.descrip,'
      '       v.descrip2,'
      '       v.unit,'
      '       decode( a1.id, NULL, a2.company, a1.company) as company,'
      '       decode( a1.id, NULL, a2.id, a1.id) as arcusto_id,'
      ''
      '       decode( mfg.lookup_mfgtype(s.mfg_type), '#39'EXTRUSION'#39', '
      '               UOM.IQConvert( '#39'FT'#39','
      '                              s.uom,'
      '                              DECODE( r.id, NULL,'
      
        '                                      Get_Sched_Order_Rel_Qty( s' +
        'ched.workorder_id, v.partno_id ),'
      
        '                                      RT_Parts_To_Go_Part( r.id,' +
        ' v.partno_id )),'
      '                              -1,'
      '                              '#39'Y'#39' ),'
      '               '#39'SLITTING'#39', decode(mfg.is_weight(s.mfg_type), 1,'
      '                   DECODE( r.id, NULL,'
      
        '                           Get_Sched_Order_Rel_Qty( sched.workor' +
        'der_id, v.partno_id ),'
      
        '                           RT_Parts_To_Go_Part( r.id, v.partno_i' +
        'd )),'
      '                   UOM.IQConvert( '#39'FT'#39','
      '                                  s.uom,'
      '                                  DECODE( r.id, NULL,'
      
        '                                          Get_Sched_Order_Rel_Qt' +
        'y( sched.workorder_id, v.partno_id ),'
      
        '                                          RT_Parts_To_Go_Part( r' +
        '.id, v.partno_id )), -1, '#39'Y'#39')),'
      '               DECODE( r.id, NULL,'
      
        '                       Get_Sched_Order_Rel_Qty( sched.workorder_' +
        'id, v.partno_id ),'
      
        '                       RT_Parts_To_Go_Part( r.id, v.partno_id ))' +
        ' ) as parts_to_go,'
      ''
      '       p.order_id as orders_id,'
      
        '       nvl(p.PROMISE_DATE, v.promise_date) as promise_date,  /* ' +
        'for compatability get promise and */'
      
        '       nvl(p.REQUEST_DATE, v.request_date ) as request_date, /* ' +
        'and request from ptallocate defaulting to ptorder_rel */'
      '       decode( mfg.lookup_mfgtype(s.mfg_type),'
      
        '               '#39'EXTRUSION'#39',  v.rel_quan / decode(v.ptwt/12,0,1,v' +
        '.ptwt/12),'
      '               '#39'EXTRUSION2'#39', v.rel_quan_disp,'
      '               '#39'COMPOUND1'#39', v.rel_quan_disp,'
      
        '               '#39'SLITTING'#39', decode(mfg.is_weight(s.mfg_type), 1, ' +
        'v.rel_quan_disp,'
      '                v.rel_quan / decode(v.ptwt/12,0,1,v.ptwt/12)),'
      '               v.rel_quan ) as Rel_Quan_Disp,'
      ''
      '       v.ord_detail_id,  -- p.ord_detail_id'
      '       v.id as ptorder_id,'
      '       p.releases_id,'
      
        '       (select wo_note from releases where id = p.releases_id) a' +
        's wo_note,'
      '       ship_to.attn  as ship_to_company, '
      '       ship_to.addr1 as ship_to_addr1,'
      '       ship_to.city  as ship_to_city,'
      '       ship_to.state as ship_to_state,'
      '       ship_to.zip   as ship_to_zip,'
      '       i.onhand'
      '  from V_PTORDER_PARTNO v,'
      '       arcusto a1,'
      '       arcusto a2,'
      '       workorder w,'
      '       ptallocate p,'
      '       standard s,'
      '       orders o,'
      '       cntr_sched sched, '
      '       ILLUM_RT r,'
      '       ship_to,'
      '       arinvt i'
      ' where '
      '       w.id = :workorder_id'
      
        '   and w.id = v.workorder_id           -- to get arcusto_id from' +
        ' workorder'
      '   and p.arinvt_id = i.id(+)'
      '   and v.ptallocate_id = p.id(+)       -- ptallocate'
      '   and w.standard_id = s.id(+)         -- to get mfgtype'
      '   and p.order_id = o.id(+)            -- to get arcusto_id'
      '   and o.arcusto_id = a1.id(+)         -- to get company name'
      '   and w.arcusto_id = a2.id(+)         -- to get company name'
      '   and o.ship_to_id = ship_to.id(+)    -- ship to info'
      ''
      '   and w.id = sched.workorder_id(+)    -- to get to illum_rt'
      
        '   and nvl(sched.sndop_dispatch_id,0) = nvl(:sndop_dispatch_id,0' +
        ')'
      '   and sched.id = r.cntr_sched_id(+)  -- and calc parts to go'
      
        '   and rt.consider_work_center( r.parent_work_center_id, r.compl' +
        'ex_child ) = 1 '
      ' '
      'order by'
      '   v.rel_date')
    Left = 207
    Top = 18
    ParamData = <
      item
        Name = 'WORKORDER_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 12832950000c
      end
      item
        Name = 'SNDOP_DISPATCH_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryPtOrderID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object QryPtOrderWORKORDER_ID: TBCDField
      FieldName = 'WORKORDER_ID'
      Size = 0
    end
    object QryPtOrderPARTNO_ID: TBCDField
      FieldName = 'PARTNO_ID'
      Size = 0
    end
    object QryPtOrderREL_DATE: TDateTimeField
      FieldName = 'REL_DATE'
    end
    object QryPtOrderREL_QUAN: TBCDField
      FieldName = 'REL_QUAN'
      Size = 2
    end
    object QryPtOrderORDERNO: TStringField
      DisplayWidth = 10
      FieldName = 'ORDERNO'
      Size = 15
    end
    object QryPtOrderPONO: TStringField
      FieldName = 'PONO'
      Size = 35
    end
    object QryPtOrderPTALLOCATE_ID: TBCDField
      FieldName = 'PTALLOCATE_ID'
      Size = 0
    end
    object QryPtOrderARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Size = 0
    end
    object QryPtOrderCLASS: TStringField
      FieldName = 'CLASS'
      Size = 2
    end
    object QryPtOrderITEMNO: TStringField
      FieldName = 'ITEMNO'
      Size = 50
    end
    object QryPtOrderREV: TStringField
      FieldName = 'REV'
      Size = 15
    end
    object QryPtOrderDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 100
    end
    object QryPtOrderDESCRIP2: TStringField
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object QryPtOrderUNIT: TStringField
      FieldName = 'UNIT'
      Size = 10
    end
    object QryPtOrderCOMPANY: TStringField
      FieldName = 'COMPANY'
      Size = 60
    end
    object QryPtOrderPARTS_TO_GO: TFMTBCDField
      FieldName = 'PARTS_TO_GO'
      DisplayFormat = '#########0.##'
      Size = 38
    end
    object QryPtOrderPROMISE_DATE: TDateTimeField
      FieldName = 'PROMISE_DATE'
    end
    object QryPtOrderREQUEST_DATE: TDateTimeField
      FieldName = 'REQUEST_DATE'
    end
    object QryPtOrderREL_QUAN_DISP: TFMTBCDField
      FieldName = 'REL_QUAN_DISP'
      DisplayFormat = '#########0.##'
      Size = 38
    end
    object QryPtOrderORDERS_ID: TBCDField
      FieldName = 'ORDERS_ID'
      Size = 0
    end
    object QryPtOrderSTANDARD_ID: TBCDField
      FieldName = 'STANDARD_ID'
      Size = 0
    end
    object QryPtOrderORD_DETAIL_ID: TBCDField
      FieldName = 'ORD_DETAIL_ID'
      Size = 0
    end
    object QryPtOrderSO_comment_exists: TStringField
      FieldKind = fkCalculated
      FieldName = 'SO_comment_exists'
      Size = 1
      Calculated = True
    end
    object QryPtOrderPTORDER_ID: TBCDField
      FieldName = 'PTORDER_ID'
      Visible = False
      Size = 0
    end
    object QryPtOrderARCUSTO_ID: TFMTBCDField
      FieldName = 'ARCUSTO_ID'
      Visible = False
      Size = 38
    end
    object QryPtOrderRELEASES_ID: TBCDField
      FieldName = 'RELEASES_ID'
      Visible = False
      Size = 0
    end
    object QryPtOrderWO_NOTE: TStringField
      DisplayLabel = 'WO Note'
      DisplayWidth = 30
      FieldName = 'WO_NOTE'
      Size = 255
    end
    object QryPtOrderSHIP_TO_COMPANY: TStringField
      DisplayLabel = 'Ship To Company'
      DisplayWidth = 30
      FieldName = 'SHIP_TO_COMPANY'
      Size = 60
    end
    object QryPtOrderSHIP_TO_ADDR1: TStringField
      DisplayLabel = 'Ship To Address 1'
      DisplayWidth = 30
      FieldName = 'SHIP_TO_ADDR1'
      Size = 60
    end
    object QryPtOrderSHIP_TO_CITY: TStringField
      DisplayLabel = 'Ship To City'
      FieldName = 'SHIP_TO_CITY'
      FixedChar = True
      Size = 30
    end
    object QryPtOrderSHIP_TO_STATE: TStringField
      DisplayLabel = 'Ship To State/Region'
      FieldName = 'SHIP_TO_STATE'
    end
    object QryPtOrderSHIP_TO_ZIP: TStringField
      DisplayLabel = 'Ship To Postal Code'
      FieldName = 'SHIP_TO_ZIP'
      FixedChar = True
      Size = 10
    end
    object QryPtOrderONHAND: TBCDField
      FieldName = 'ONHAND'
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
      '  from eplant')
    Left = 28
    Top = 211
  end
  object SrcCntr_Sched: TDataSource
    DataSet = TblCntr_Sched
    OnDataChange = SrcCntr_SchedDataChange
    Left = 24
    Top = 6
  end
  object PkCenter: TIQWebHpick
    BeforeOpen = AssignEPlantFilter
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select eqno,'
      '       cntr_desc,'
      '       capacity,'
      '       cntr_type,'
      '       id,'
      '       eplant_id,'
      '       pk_hide,'
      '       assy_parent_id'
      '  from iqms.work_center'
      ' where parent_id is null'
      '   and (frame_id is null or frame_set_id > 0)'
      '   and ( nvl(parent_id,0) = 0 '
      '         or'
      
        '         nvl(parent_id,0) > 0  and mfg.work_center_belong_to_com' +
        'plex( id ) = 0 )'
      '   '
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 114
    Top = 138
    object PkCenterEQNO: TStringField
      DisplayLabel = 'Center#'
      FieldName = 'EQNO'
      Size = 60
    end
    object PkCenterCNTR_DESC: TStringField
      DisplayLabel = 'Description'
      FieldName = 'CNTR_DESC'
      Size = 250
    end
    object PkCenterCAPACITY: TBCDField
      DisplayLabel = 'Capacity'
      FieldName = 'CAPACITY'
      Size = 2
    end
    object PkCenterCNTR_TYPE: TStringField
      DisplayLabel = 'Type'
      FieldName = 'CNTR_TYPE'
    end
    object PkCenterID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkCenterEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'WORK_CENTER.EPLANT_ID'
      Size = 0
    end
    object PkCenterPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.WORK_CENTER.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object QryIsOnExceptionList: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select /*+ ORDERED */'
      '       '#39'Y'#39' as On_Exception_List'
      '  from day_hrs h,'
      '       day_pts p,'
      '       day_use u'
      ' where h.workorder_id = :workorder_id'
      '   and rownum < 2'
      '   and h.id = p.day_hrs_id'
      '   and p.id = u.day_pts_id'
      '   and exists (select 1 from xcpt_mat_req x'
      '                where u.arinvt_id = x.arinvt_id'
      '                  and h.prod_date >= x.must_arrive'
      
        '                  and NVL(h.division_id,0) = NVL(x.division_id,0' +
        '))'
      ' '
      ' ')
    Left = 112
    Top = 212
    ParamData = <
      item
        Name = 'workorder_id'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  object QryPMEqmtDown: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select p.eqno,'
      '       p.service_date_out,'
      '       p.service_date_in'
      '  from '
      '       standard_pmeqmt,'
      '       pmeqmt p'
      ' where '
      '       standard_pmeqmt.standard_id = :standard_id'
      '   and standard_pmeqmt.pmeqmt_id = p.id'
      ''
      
        '   and ( :start_time between p.service_date_out and p.service_da' +
        'te_in'
      '         or '
      
        '         :end_time between p.service_date_out and p.service_date' +
        '_in'
      '         or'
      
        '         :start_time <= p.service_date_out and p.service_date_in' +
        ' <= :end_time '
      '         or'
      
        '         p.service_date_out <= :start_time and p.service_date_ou' +
        't is not null and p.service_date_in is null )'
      '   and rownum < 2')
    Left = 276
    Top = 136
    ParamData = <
      item
        Name = 'standard_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'end_time'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'start_time'
        DataType = ftDateTime
        ParamType = ptInput
      end>
    object QryPMEqmtDownEQNO: TStringField
      FieldName = 'EQNO'
      Origin = 'IQ.PMEQMT.EQNO'
      Size = 25
    end
    object QryPMEqmtDownSERVICE_DATE_OUT: TDateTimeField
      FieldName = 'SERVICE_DATE_OUT'
      Origin = 'IQ.PMEQMT.SERVICE_DATE_OUT'
    end
    object QryPMEqmtDownSERVICE_DATE_IN: TDateTimeField
      FieldName = 'SERVICE_DATE_IN'
      Origin = 'IQ.PMEQMT.SERVICE_DATE_IN'
    end
  end
  object SrcPmEqmtWODetails: TDataSource
    DataSet = QryPmEqmtWODetails
    Left = 44
    Top = 284
  end
  object QryPmEqmtWODetails: TFDQuery
    Tag = 1
    MasterSource = SrcCntr_Sched
    MasterFields = 'PMWO_ID'
    DetailFields = 'PMWO_ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT a.id AS pmwo_id,'
      
        '       SUBSTRB(DECODE(NVL(b.wo_open, '#39'N'#39'), '#39'Y'#39', nls_pm.lookup(7)' +
        ', nls_pm.lookup(8)),'
      '               1,'
      '               20)'
      '          AS status,'
      '       d.pmeqmt_id,'
      '       f.eqno,'
      '       f.descrip AS equip_descrip,'
      '       f.class AS equip_class,'
      '       f.location,'
      
        '       SUBSTRB(DECODE(d.pmtasks_id, NULL, nls_pm.lookup(4), e.ta' +
        'skno),'
      '               1,'
      '               50)'
      '          AS task_number,'
      
        '       SUBSTRB(DECODE(d.pmtasks_id, NULL, b.misc_item, e.descrip' +
        '),'
      '               1,'
      '               250)'
      '          AS task_description,'
      '       b.start_units,'
      '       d.total_units'
      
        '  FROM pmwo a, pmwo_dtl b, pmjob d, pmtasks e, pmeqmt f, eplant ' +
        'g'
      ' WHERE a.id = :pmwo_id AND'
      '       b.pmwo_id(+) = a.id AND'
      '       d.id(+) = b.pmjob_id AND'
      '       e.id(+) = d.pmtasks_id AND'
      '       f.id(+) = d.pmeqmt_id AND'
      '       g.id(+) = a.eplant_id')
    Left = 44
    Top = 328
    ParamData = <
      item
        Name = 'PMWO_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryPmEqmtWODetailsPMWO_ID: TBCDField
      FieldName = 'PMWO_ID'
      Visible = False
      Size = 0
    end
    object QryPmEqmtWODetailsSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
    end
    object QryPmEqmtWODetailsPMEQMT_ID: TBCDField
      FieldName = 'PMEQMT_ID'
      Visible = False
      Size = 0
    end
    object QryPmEqmtWODetailsEQNO: TStringField
      DisplayLabel = 'Equipment #'
      FieldName = 'EQNO'
      Size = 25
    end
    object QryPmEqmtWODetailsEQUIP_DESCRIP: TStringField
      DisplayLabel = 'Equipment Description'
      FieldName = 'EQUIP_DESCRIP'
      Size = 50
    end
    object QryPmEqmtWODetailsEQUIP_CLASS: TStringField
      DisplayLabel = 'Equipment Class'
      FieldName = 'EQUIP_CLASS'
      FixedChar = True
      Size = 2
    end
    object QryPmEqmtWODetailsLOCATION: TStringField
      DisplayLabel = 'Location'
      FieldName = 'LOCATION'
      Size = 30
    end
    object QryPmEqmtWODetailsTASK_NUMBER: TStringField
      DisplayLabel = 'Task #'
      DisplayWidth = 20
      FieldName = 'TASK_NUMBER'
      Size = 50
    end
    object QryPmEqmtWODetailsTASK_DESCRIPTION: TStringField
      DisplayLabel = 'Task Description'
      DisplayWidth = 50
      FieldName = 'TASK_DESCRIPTION'
      Size = 250
    end
    object QryPmEqmtWODetailsSTART_UNITS: TBCDField
      DisplayLabel = 'Starting Units'
      FieldName = 'START_UNITS'
      Size = 2
    end
    object QryPmEqmtWODetailsTOTAL_UNITS: TBCDField
      DisplayLabel = 'Total Units'
      FieldName = 'TOTAL_UNITS'
    end
  end
  object TblCntr_Sched: TFDQuery
    BeforePost = TblCntr_Sched1BeforePost
    AfterScroll = TblCntr_Sched1AfterScroll
    OnCalcFields = TblCntr_Sched1CalcFields
    OnDeleteError = HandleError
    OnEditError = HandleError
    OnPostError = HandleError
    MasterSource = SrcWork_Center
    MasterFields = 'ID'
    DetailFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.UpdateTableName = 'CNTR_SCHED'
    UpdateOptions.KeyFields = 'ID'
    SQL.Strings = (
      'select cs.work_center_id,'
      '       cs.cntr_seq,'
      '       cs.workorder_id,'
      '       cs.prod_start_time,'
      '       cs.prod_end_time,'
      '       cs.force_reason,'
      '       cs.down_idle,'
      '       cs.prodhrs,'
      '       cs.setuphrs,'
      '       cs.priority_note,'
      '       cs.force_source,'
      '       cs.prod_bucket_end,'
      '       cs.pmwo_id,'
      '       cs.id,'
      '       cs.force_setuphrs,'
      '       cs.sndop_dispatch_id,'
      '       cs.priority_note2,'
      '       cs.force_start_date,'
      '       cs.force_start_date_disp,'
      '       cs.userid'
      '  from cntr_sched cs'
      ' where cs.work_center_id = :id'
      ' order by cs.cntr_seq'
      '')
    Left = 32
    Top = 28
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 4090000c
      end>
    object TblCntr_SchedWORK_CENTER_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'WORK_CENTER_ID'
      Size = 0
    end
    object TblCntr_SchedCNTR_SEQ: TBCDField
      DisplayWidth = 10
      FieldName = 'CNTR_SEQ'
      Size = 0
    end
    object TblCntr_SchedWORKORDER_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'WORKORDER_ID'
      Size = 0
    end
    object TblCntr_SchedPROD_START_TIME: TDateTimeField
      DisplayWidth = 18
      FieldName = 'PROD_START_TIME'
      DisplayFormat = 'c'
    end
    object TblCntr_SchedPROD_END_TIME: TDateTimeField
      DisplayWidth = 18
      FieldName = 'PROD_END_TIME'
      DisplayFormat = 'c'
    end
    object TblCntr_SchedFORCE_REASON: TStringField
      DisplayWidth = 35
      FieldName = 'FORCE_REASON'
      Size = 35
    end
    object TblCntr_SchedDOWN_IDLE: TBCDField
      DisplayWidth = 10
      FieldName = 'DOWN_IDLE'
      Size = 0
    end
    object TblCntr_SchedPRODHRS: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'PRODHRS'
    end
    object TblCntr_SchedSETUPHRS: TBCDField
      DisplayWidth = 10
      FieldName = 'SETUPHRS'
      Size = 2
    end
    object TblCntr_SchedPRIORITY_NOTE: TStringField
      DisplayLabel = 'Priority Note'
      DisplayWidth = 255
      FieldName = 'PRIORITY_NOTE'
      Size = 255
    end
    object TblCntr_SchedFORCE_SOURCE: TStringField
      DisplayWidth = 1
      FieldName = 'FORCE_SOURCE'
      Size = 1
    end
    object TblCntr_SchedMfgNo: TStringField
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'MfgNo'
      LookupKeyFields = 'ID'
      LookupResultField = 'MfgNo'
      KeyFields = 'WORKORDER_ID'
      Size = 25
      Calculated = True
    end
    object TblCntr_SchedCycles: TFloatField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Cycles'
      LookupKeyFields = 'ID'
      LookupResultField = 'CYCLES_REQ'
      KeyFields = 'WORKORDER_ID'
      Calculated = True
    end
    object TblCntr_SchedBucket: TIntegerField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Bucket'
      LookupKeyFields = 'ID'
      LookupResultField = 'BUCKET'
      KeyFields = 'WORKORDER_ID'
      Calculated = True
    end
    object TblCntr_SchedJobMfgNo: TStringField
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'JobMfgNo'
      Size = 25
      Calculated = True
    end
    object TblCntr_SchedStart_Time: TDateTimeField
      DisplayWidth = 18
      FieldKind = fkCalculated
      FieldName = 'Start_Time'
      LookupKeyFields = 'ID'
      LookupResultField = 'START_TIME'
      KeyFields = 'WORKORDER_ID'
      DisplayFormat = 'c'
      Calculated = True
    end
    object TblCntr_SchedEnd_Time: TDateTimeField
      DisplayWidth = 18
      FieldKind = fkCalculated
      FieldName = 'End_Time'
      LookupKeyFields = 'ID'
      LookupResultField = 'END_TIME'
      KeyFields = 'WORKORDER_ID'
      DisplayFormat = 'c'
      Calculated = True
    end
    object TblCntr_SchedMatItemNo: TStringField
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'MatItemNo'
      LookupKeyFields = 'ID'
      LookupResultField = 'ITEMNO'
      KeyFields = 'WORKORDER_ID'
      Size = 25
      Calculated = True
    end
    object TblCntr_SchedMatDescrip: TStringField
      DisplayWidth = 35
      FieldKind = fkCalculated
      FieldName = 'MatDescrip'
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIP'
      KeyFields = 'WORKORDER_ID'
      Size = 35
      Calculated = True
    end
    object TblCntr_SchedCycles_To_Go: TFloatField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Cycles_To_Go'
      LookupKeyFields = 'ID'
      LookupResultField = 'CYCLES_TO_GO'
      KeyFields = 'ID'
      DisplayFormat = '#########0.##'
      Calculated = True
    end
    object TblCntr_SchedUnits_To_Go: TFloatField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Units_To_Go'
      LookupKeyFields = 'ID'
      LookupResultField = 'UNITS_TO_GO'
      KeyFields = 'ID'
      DisplayFormat = '#########0.##'
      Calculated = True
    end
    object TblCntr_SchedHours_To_Go: TFloatField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Hours_To_Go'
      LookupKeyFields = 'ID'
      LookupResultField = 'Hours_To_Go_Disp'
      KeyFields = 'ID'
      DisplayFormat = '######0.00'
      Calculated = True
    end
    object TblCntr_SchedStandard_ID: TFloatField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Standard_ID'
      LookupKeyFields = 'ID'
      LookupResultField = 'STANDARD_ID'
      KeyFields = 'WORKORDER_ID'
      Calculated = True
    end
    object TblCntr_SchedLBSK: TFMTBCDField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'LBSK'
      LookupKeyFields = 'ID'
      LookupResultField = 'LBSK'
      KeyFields = 'WORKORDER_ID'
      Calculated = True
    end
    object TblCntr_SchedMat_Req: TFloatField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Mat_Req'
      DisplayFormat = '#######0.0###'
      Calculated = True
    end
    object TblCntr_SchedArinvt_ID_Mat: TFloatField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Arinvt_ID_Mat'
      LookupKeyFields = 'ID'
      LookupResultField = 'ARINVT_ID_MAT'
      KeyFields = 'WORKORDER_ID'
      Calculated = True
    end
    object TblCntr_SchedSched_Scope: TFloatField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Sched_Scope'
      LookupKeyFields = 'ID'
      LookupResultField = 'SCHED_SCOPE'
      KeyFields = 'WORKORDER_ID'
      Calculated = True
    end
    object TblCntr_SchedMfg_Scope: TFloatField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Mfg_Scope'
      LookupKeyFields = 'ID'
      LookupResultField = 'MFG_SCOPE'
      KeyFields = 'WORKORDER_ID'
      Calculated = True
    end
    object TblCntr_SchedPROD_BUCKET_END: TDateTimeField
      DisplayWidth = 18
      FieldName = 'PROD_BUCKET_END'
    end
    object TblCntr_SchedWO_Bucket_Start: TDateTimeField
      DisplayWidth = 18
      FieldKind = fkCalculated
      FieldName = 'WO_Bucket_Start'
      LookupKeyFields = 'ID'
      LookupResultField = 'BUCKET_START_TIME'
      KeyFields = 'WORKORDER_ID'
      Calculated = True
    end
    object TblCntr_SchedWO_Bucket_End: TDateTimeField
      DisplayWidth = 18
      FieldKind = fkCalculated
      FieldName = 'WO_Bucket_End'
      LookupKeyFields = 'ID'
      LookupResultField = 'BUCKET_END_TIME'
      KeyFields = 'WORKORDER_ID'
      Calculated = True
    end
    object TblCntr_SchedBucket_End_Disp: TDateTimeField
      DisplayWidth = 18
      FieldKind = fkCalculated
      FieldName = 'Bucket_End_Disp'
      Calculated = True
    end
    object TblCntr_SchedTool_EqNo: TStringField
      DisplayWidth = 65
      FieldKind = fkCalculated
      FieldName = 'Tool_EqNo'
      LookupDataSet = QryPMEqmt
      LookupKeyFields = 'ID'
      LookupResultField = 'EQNO'
      KeyFields = 'Standard_ID'
      Size = 65
      Calculated = True
    end
    object TblCntr_SchedMaybe_On_Time_Count: TIntegerField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Maybe_On_Time_Count'
      LookupKeyFields = 'CNTR_SCHED_ID'
      LookupResultField = 'MAYBE_ON_TIME_COUNT'
      KeyFields = 'ID'
      Calculated = True
    end
    object TblCntr_SchedMfgType: TStringField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'MfgType'
      LookupKeyFields = 'ID'
      LookupResultField = 'MFG_TYPE'
      KeyFields = 'WORKORDER_ID'
      Size = 10
      Calculated = True
    end
    object TblCntr_SchedPMWO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PMWO_ID'
      Size = 0
    end
    object TblCntr_SchedDays_Diff: TFloatField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Days_Diff'
      LookupKeyFields = 'ID'
      LookupResultField = 'Days_Diff'
      KeyFields = 'ID'
      DisplayFormat = '#####0.00'
      Calculated = True
    end
    object TblCntr_SchedProd_Start_Time_Disp: TStringField
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'Prod_Start_Time_Disp'
      Size = 30
      Calculated = True
    end
    object TblCntr_SchedWO_Origin: TStringField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'WO_Origin'
      Size = 10
      Calculated = True
    end
    object TblCntr_SchedStart_Time_Disp: TStringField
      DisplayWidth = 22
      FieldKind = fkCalculated
      FieldName = 'Start_Time_Disp'
      Size = 22
      Calculated = True
    end
    object TblCntr_SchedEnd_Time_Disp: TStringField
      DisplayWidth = 22
      FieldKind = fkCalculated
      FieldName = 'End_Time_Disp'
      Size = 22
      Calculated = True
    end
    object TblCntr_SchedWO_IsOnExceptionList: TStringField
      DisplayWidth = 1
      FieldKind = fkCalculated
      FieldName = 'WO_IsOnExceptionList'
      Size = 1
      Calculated = True
    end
    object TblCntr_SchedSets: TFloatField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Sets'
      Calculated = True
    end
    object TblCntr_SchedWO_Type: TStringField
      DisplayLabel = 'WO Type'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'WO_Type'
      Size = 10
      Calculated = True
    end
    object TblCntr_SchedBom_UOM: TStringField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Bom_UOM'
      LookupKeyFields = 'ID'
      LookupResultField = 'UOM'
      KeyFields = 'ID'
      Size = 10
      Calculated = True
    end
    object TblCntr_SchedTool_Is_Down: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Tool_Is_Down'
      Calculated = True
    end
    object TblCntr_SchedTool_Service_Date_In: TDateTimeField
      DisplayWidth = 18
      FieldKind = fkCalculated
      FieldName = 'Tool_Service_Date_In'
      Calculated = True
    end
    object TblCntr_SchedTool_Service_Date_Out: TDateTimeField
      DisplayWidth = 18
      FieldKind = fkCalculated
      FieldName = 'Tool_Service_Date_Out'
      Calculated = True
    end
    object TblCntr_SchedOperator: TFloatField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Operator'
      Calculated = True
    end
    object TblCntr_SchedPriority: TStringField
      DisplayWidth = 1
      FieldKind = fkCalculated
      FieldName = 'Priority'
      Size = 1
      Calculated = True
    end
    object TblCntr_SchedDel_Firm_WO: TStringField
      DisplayLabel = 'Del Firm WO'
      DisplayWidth = 14
      FieldKind = fkCalculated
      FieldName = 'Del_Firm_WO'
      Size = 14
      Calculated = True
    end
    object TblCntr_SchedScrap: TFloatField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Scrap'
      Calculated = True
    end
    object TblCntr_SchedEPlant_ID_Arinvt_Mat: TFloatField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'EPlant_ID_Arinvt_Mat'
      Calculated = True
    end
    object TblCntr_SchedMfg_Descrip: TStringField
      DisplayWidth = 50
      FieldKind = fkCalculated
      FieldName = 'Mfg_Descrip'
      Size = 50
      Calculated = True
    end
    object TblCntr_SchedOpNo: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'OpNo'
      Calculated = True
    end
    object TblCntr_SchedOpDesc: TStringField
      DisplayWidth = 60
      FieldKind = fkCalculated
      FieldName = 'OpDesc'
      Size = 60
      Calculated = True
    end
    object TblCntr_SchedOpSeq: TFloatField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'OpSeq'
      Calculated = True
    end
    object TblCntr_SchedAssy1_End_Time: TDateTimeField
      DisplayWidth = 18
      FieldKind = fkCalculated
      FieldName = 'Assy1_End_Time'
      Calculated = True
    end
    object TblCntr_SchedHasQualityException: TStringField
      DisplayLabel = 'Quality Issues'
      DisplayWidth = 1
      FieldKind = fkCalculated
      FieldName = 'HasQualityException'
      Size = 1
      Calculated = True
    end
    object TblCntr_SchedID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object TblCntr_SchedFORCE_SETUPHRS: TStringField
      FieldName = 'FORCE_SETUPHRS'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object TblCntr_SchedSNDOP_DISPATCH_ID: TBCDField
      FieldName = 'SNDOP_DISPATCH_ID'
      Visible = False
      Size = 0
    end
    object TblCntr_SchedPriority_Level: TFloatField
      DisplayLabel = 'Priority Level'
      FieldKind = fkCalculated
      FieldName = 'Priority_Level'
      Calculated = True
    end
    object TblCntr_SchedFG_LotNo: TStringField
      FieldKind = fkCalculated
      FieldName = 'FG_LotNo'
      Size = 25
      Calculated = True
    end
    object TblCntr_SchedPRIORITY_NOTE2: TStringField
      DisplayLabel = 'Priority Note 2'
      DisplayWidth = 50
      FieldName = 'PRIORITY_NOTE2'
      Size = 255
    end
    object TblCntr_SchedRunHold: TStringField
      FieldKind = fkCalculated
      FieldName = 'RunHold'
      Size = 1
      Calculated = True
    end
    object TblCntr_SchedMatClass: TStringField
      FieldKind = fkCalculated
      FieldName = 'MatClass'
      Size = 2
      Calculated = True
    end
    object TblCntr_SchedMatDryTime: TFloatField
      FieldKind = fkCalculated
      FieldName = 'MatDryTime'
      Calculated = True
    end
    object TblCntr_SchedFORCE_START_DATE: TDateTimeField
      FieldName = 'FORCE_START_DATE'
      Visible = False
    end
    object TblCntr_SchedProd_End_Time_Disp: TStringField
      FieldKind = fkCalculated
      FieldName = 'Prod_End_Time_Disp'
      Size = 30
      Calculated = True
    end
    object TblCntr_SchedFORCE_START_DATE_DISP: TDateTimeField
      FieldName = 'FORCE_START_DATE_DISP'
      Visible = False
    end
    object TblCntr_SchedProd_Start_Time_DispAsDate: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'Prod_Start_Time_DispAsDate'
      Calculated = True
    end
    object TblCntr_SchedProcess_IsOnExceptionList: TStringField
      FieldKind = fkCalculated
      FieldName = 'Process_IsOnExceptionList'
      Size = 1
      Calculated = True
    end
    object TblCntr_SchedWOGroupID: TFloatField
      DisplayLabel = 'Group ID'
      FieldKind = fkCalculated
      FieldName = 'WOGroupID'
      Calculated = True
    end
    object TblCntr_SchedUSERID: TStringField
      DisplayLabel = 'User ID'
      FieldName = 'USERID'
      Size = 35
    end
  end
  object TblWorkOrder: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       standard_id,'
      '       bucket,'
      '       cycles_req,'
      '       prodhrs,'
      '       arcusto_id,'
      '       start_time,'
      '       end_time,'
      '       cntr_type,'
      '       setuphrs,'
      '       mfgno,'
      '       itemno,'
      '       descrip,'
      '       company,'
      '       mfg_type,'
      '       mfgcell,'
      '       lbsk,'
      '       arinvt_id_mat,'
      '       sched_scope,'
      '       mfg_scope,'
      '       bucket_start_time,'
      '       bucket_end_time,'
      '       origin,'
      '       sets,'
      '       firm,'
      '       operator,'
      '       priority,'
      '       del_firm_wo,'
      '       scrap,'
      '       bom_descrip,'
      '       assy_start_time,'
      '       assy_end_time,'
      '       priority_level,'
      '       fg_lotno,'
      '       run_hold,'
      '       drytime,'
      '       class,'
      '       groupid'
      '  from v_workorder_standard'
      ' order by id         '
      '')
    Left = 120
    Top = 32
    object TblWorkOrderID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 0
    end
    object TblWorkOrderSTANDARD_ID: TBCDField
      FieldName = 'STANDARD_ID'
      Required = True
      Size = 0
    end
    object TblWorkOrderBUCKET: TBCDField
      FieldName = 'BUCKET'
      Size = 0
    end
    object TblWorkOrderCYCLES_REQ: TBCDField
      FieldName = 'CYCLES_REQ'
      Size = 2
    end
    object TblWorkOrderPRODHRS: TFMTBCDField
      FieldName = 'PRODHRS'
    end
    object TblWorkOrderARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Size = 0
    end
    object TblWorkOrderSTART_TIME: TDateTimeField
      FieldName = 'START_TIME'
    end
    object TblWorkOrderEND_TIME: TDateTimeField
      FieldName = 'END_TIME'
    end
    object TblWorkOrderCNTR_TYPE: TStringField
      FieldName = 'CNTR_TYPE'
    end
    object TblWorkOrderSETUPHRS: TBCDField
      FieldName = 'SETUPHRS'
      Size = 2
    end
    object TblWorkOrderMFGNO: TStringField
      FieldName = 'MFGNO'
      Required = True
      Size = 50
    end
    object TblWorkOrderITEMNO: TStringField
      FieldName = 'ITEMNO'
      Size = 50
    end
    object TblWorkOrderDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 35
    end
    object TblWorkOrderCOMPANY: TStringField
      FieldName = 'COMPANY'
      Size = 30
    end
    object TblWorkOrderMFG_TYPE: TStringField
      FieldName = 'MFG_TYPE'
      Size = 10
    end
    object TblWorkOrderMFGCELL: TStringField
      FieldName = 'MFGCELL'
      Size = 15
    end
    object TblWorkOrderLBSK: TFMTBCDField
      FieldName = 'LBSK'
    end
    object TblWorkOrderARINVT_ID_MAT: TBCDField
      FieldName = 'ARINVT_ID_MAT'
      Size = 0
    end
    object TblWorkOrderSCHED_SCOPE: TFMTBCDField
      FieldName = 'SCHED_SCOPE'
      Size = 0
    end
    object TblWorkOrderMFG_SCOPE: TFMTBCDField
      FieldName = 'MFG_SCOPE'
      Size = 0
    end
    object TblWorkOrderBUCKET_START_TIME: TDateTimeField
      FieldName = 'BUCKET_START_TIME'
    end
    object TblWorkOrderBUCKET_END_TIME: TDateTimeField
      FieldName = 'BUCKET_END_TIME'
    end
    object TblWorkOrderORIGIN: TStringField
      FieldName = 'ORIGIN'
      Size = 10
    end
    object TblWorkOrderSETS: TFMTBCDField
      FieldName = 'SETS'
    end
    object TblWorkOrderFIRM: TStringField
      FieldName = 'FIRM'
      Size = 1
    end
    object TblWorkOrderOPERATOR: TBCDField
      FieldName = 'OPERATOR'
      Size = 2
    end
    object TblWorkOrderPRIORITY: TStringField
      FieldName = 'PRIORITY'
      FixedChar = True
      Size = 1
    end
    object TblWorkOrderDEL_FIRM_WO: TStringField
      FieldName = 'DEL_FIRM_WO'
      FixedChar = True
      Size = 1
    end
    object TblWorkOrderSCRAP: TBCDField
      FieldName = 'SCRAP'
    end
    object TblWorkOrderBOM_DESCRIP: TStringField
      FieldName = 'BOM_DESCRIP'
      Size = 50
    end
    object TblWorkOrderASSY_START_TIME: TDateTimeField
      FieldName = 'ASSY_START_TIME'
      Visible = False
    end
    object TblWorkOrderASSY_END_TIME: TDateTimeField
      FieldName = 'ASSY_END_TIME'
      Visible = False
    end
    object TblWorkOrderPRIORITY_LEVEL: TBCDField
      FieldName = 'PRIORITY_LEVEL'
      Size = 0
    end
    object TblWorkOrderFG_LOTNO: TStringField
      FieldName = 'FG_LOTNO'
      Visible = False
      FixedChar = True
      Size = 25
    end
    object TblWorkOrderRUN_HOLD: TStringField
      FieldName = 'RUN_HOLD'
      Size = 1
    end
    object TblWorkOrderDRYTIME: TBCDField
      FieldName = 'DRYTIME'
      Visible = False
      Size = 0
    end
    object TblWorkOrderCLASS: TStringField
      FieldName = 'CLASS'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object TblWorkOrderGROUPID: TBCDField
      FieldName = 'GROUPID'
      Size = 3
    end
  end
end
