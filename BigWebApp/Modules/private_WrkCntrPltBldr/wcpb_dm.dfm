object DM_WCPB: TDM_WCPB
  OldCreateOrder = False
  Height = 205
  Width = 291
  object wwQryWorkCenterList: TFDQuery
    BeforeOpen = wwQryWorkCenterListBeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select'
      '     w.id as work_center_id,'
      '     w.eqno,'
      '     w.cntr_desc,'
      '     w.cntr_type,'
      '     w.eplant_id,'
      '     w.mfgcell,'
      '     w.mfg_type,'
      '     csc.id as center_scan_config_id,'
      '     wo.standard_id,'
      
        '     (select mfgno from standard where id = wo.standard_id) as s' +
        'tandard_mfgno,'
      '     csc.standard_id as csc_standard_id,'
      
        '     (select mfgno from standard where id = csc.standard_id) as ' +
        'csc_standard_mfgno'
      'from work_center w,'
      '     center_scan_config csc,'
      '     cntr_sched cs,'
      '     workorder wo'
      'where'
      '   NVL(w.is_rt, '#39'N'#39') = '#39'Y'#39
      '   and NVL(w.pk_hide, '#39'N'#39') = '#39'N'#39
      '   and NVL(w.parent_id, 0) = 0'
      '   and w.id = csc.work_center_id(+)'
      '   and w.id = cs.work_center_id(+)'
      '   and (cs.cntr_seq = 1 or cs.cntr_seq is null)'
      '   and cs.workorder_id = wo.id(+)'
      ''
      '-- HPICK_PROPAGATE_SORT_START'
      'order by w.eqno'
      '-- HPICK_PROPAGATE_SORT_END'
      '')
    Left = 168
    Top = 32
    object wwQryWorkCenterListWORK_CENTER_ID: TBCDField
      FieldName = 'WORK_CENTER_ID'
      Size = 0
    end
    object wwQryWorkCenterListEQNO: TStringField
      FieldName = 'EQNO'
      Origin = 'EQNO'
      Size = 60
    end
    object wwQryWorkCenterListCNTR_DESC: TStringField
      FieldName = 'CNTR_DESC'
      Origin = 'CNTR_DESC'
      Size = 250
    end
    object wwQryWorkCenterListCNTR_TYPE: TStringField
      FieldName = 'CNTR_TYPE'
      Origin = 'CNTR_TYPE'
    end
    object wwQryWorkCenterListMFGCELL: TStringField
      FieldName = 'MFGCELL'
      Origin = 'MFGCELL'
      Size = 15
    end
    object wwQryWorkCenterListMFG_TYPE: TStringField
      FieldName = 'MFG_TYPE'
      Origin = 'MFG_TYPE'
      Size = 10
    end
    object wwQryWorkCenterListEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Size = 0
    end
    object wwQryWorkCenterListCENTER_SCAN_CONFIG_ID: TBCDField
      FieldName = 'CENTER_SCAN_CONFIG_ID'
      Size = 0
    end
    object wwQryWorkCenterListSTANDARD_ID: TBCDField
      FieldName = 'STANDARD_ID'
      Visible = False
      Size = 0
    end
    object wwQryWorkCenterListCSC_STANDARD_ID: TBCDField
      FieldName = 'CSC_STANDARD_ID'
      Visible = False
      Size = 0
    end
    object wwQryWorkCenterListSTANDARD_MFGNO: TStringField
      FieldName = 'STANDARD_MFGNO'
      Size = 50
    end
    object wwQryWorkCenterListCSC_STANDARD_MFGNO: TStringField
      FieldName = 'CSC_STANDARD_MFGNO'
      Size = 50
    end
  end
  object wwSrcWorkCenterList: TDataSource
    DataSet = wwQryWorkCenterList
    Left = 152
    Top = 16
  end
  object PkWorkCenters: TIQWebHpick
    Tag = 1
    BeforeOpen = PkWorkCentersBeforeOpen
    Filtered = True
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select'
      '     w.id as id,'
      '     w.eqno as eqno,'
      '     w.cntr_desc as cntr_desc,'
      '     w.cntr_type as cntr_type,'
      '     w.eplant_id as eplant_id,'
      '     wo.id as workorder_id,'
      '     a.itemno as itemno,'
      '     a.descrip as descrip,'
      '     a.class as class,'
      '     a.rev as rev,'
      '     w.mfgcell as mfgcell'
      'from work_center w,'
      '     cntr_sched cs,'
      '     workorder wo,'
      '     partno pno,'
      '     arinvt a'
      'where'
      '   NVL(w.is_rt, '#39'N'#39') = '#39'Y'#39
      '   and NVL(w.pk_hide, '#39'N'#39') = '#39'N'#39
      '   and NVL(w.parent_id, 0) = 0'
      '   and w.id = cs.work_center_id(+)'
      '   and (cs.cntr_seq = 1 or cs.cntr_seq is null)'
      '   and cs.workorder_id = wo.id(+)'
      '   and wo.standard_id = pno.standard_id(+)'
      '   and pno.arinvt_id = a.id(+)')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 26
    Top = 19
    object PkWorkCentersID: TBCDField
      FieldName = 'ID'
      Origin = 'id'
      Visible = False
      Size = 0
    end
    object PkWorkCentersEQNO: TStringField
      DisplayLabel = 'Work Center #'
      DisplayWidth = 20
      FieldName = 'EQNO'
      Origin = 'eqno'
      Size = 10
    end
    object PkWorkCentersCNTR_DESC: TStringField
      DisplayLabel = 'Work Center ~Description'
      DisplayWidth = 30
      FieldName = 'CNTR_DESC'
      Origin = 'cntr_desc'
      Size = 50
    end
    object PkWorkCentersCNTR_TYPE: TStringField
      DisplayLabel = 'Work Center ~Type'
      DisplayWidth = 20
      FieldName = 'CNTR_TYPE'
      Origin = 'cntr_type'
    end
    object PkWorkCentersEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'eplant_id'
      Visible = False
      Size = 0
    end
    object PkWorkCentersWORKORDER_ID: TBCDField
      DisplayLabel = 'Work Order #'
      FieldName = 'WORKORDER_ID'
      Origin = 'workorder_id'
      Size = 0
    end
    object PkWorkCentersITEMNO: TStringField
      DisplayLabel = 'Inventory Item #'
      DisplayWidth = 35
      FieldName = 'ITEMNO'
      Origin = 'itemno'
      FixedChar = True
      Size = 25
    end
    object PkWorkCentersDESCRIP: TStringField
      DisplayLabel = 'Inventory Item Description'
      DisplayWidth = 45
      FieldName = 'DESCRIP'
      Origin = 'descrip'
      Size = 35
    end
    object PkWorkCentersCLASS: TStringField
      DisplayLabel = 'Inventory Item Class'
      DisplayWidth = 35
      FieldName = 'CLASS'
      Origin = 'class'
      FixedChar = True
      Size = 2
    end
    object PkWorkCentersREV: TStringField
      DisplayLabel = 'Inventory Item Revision'
      DisplayWidth = 35
      FieldName = 'REV'
      Origin = 'rev'
      FixedChar = True
      Size = 15
    end
    object PkWorkCentersMFGCELL: TStringField
      DisplayLabel = 'MFG Cell'
      FieldName = 'MFGCELL'
      Origin = 'mfgcell'
      FixedChar = True
      Size = 15
    end
  end
  object qryBOM: TFDQuery
    BeforeOpen = qryBOMBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select st.id as standard_id,'
      '       st.mfgno,'
      '       a.class,'
      '       a.itemno,'
      '       a.rev,'
      '       a.id as arinvt_id'
      '  from standard st,'
      '       partno pno,'
      '       arinvt a'
      '  where st.id = :STANDARD_ID'
      '   and st.id = pno.standard_id'
      '   and pno.arinvt_id = a.id')
    Left = 72
    Top = 112
    ParamData = <
      item
        Name = 'STANDARD_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object qryBOMSTANDARD_ID: TBCDField
      FieldName = 'STANDARD_ID'
      Origin = 'IQ.WORKORDER.STANDARD_ID'
      Size = 0
    end
    object qryBOMMFGNO: TStringField
      FieldName = 'MFGNO'
      Origin = 'IQ.STANDARD.MFGNO'
      Size = 50
    end
    object qryBOMCLASS: TStringField
      FieldName = 'CLASS'
      Origin = 'IQ.ARINVT.CLASS'
      FixedChar = True
      Size = 2
    end
    object qryBOMITEMNO: TStringField
      FieldName = 'ITEMNO'
      Origin = 'IQ.ARINVT.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object qryBOMREV: TStringField
      FieldName = 'REV'
      Origin = 'IQ.ARINVT.REV'
      FixedChar = True
      Size = 15
    end
    object qryBOMARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Origin = 'IQ.ARINVT.ID'
      Size = 0
    end
  end
  object srcBOM: TDataSource
    DataSet = qryBOM
    Left = 56
    Top = 104
  end
  object qryPallets: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvUpdateMode]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    UpdateOptions.UpdateMode = upWhereChanged
    SQL.Strings = (
      'SELECT csp.ID,'
      '  csp.CUSER1'
      'FROM partno p,'
      '  illum_part i,'
      '  work_center w,'
      '  hist_illum_rt h,'
      '  standard s,'
      '  CENTER_SCAN_PALLETS csp,'
      '  CENTER_SCAN_CONFIG csc'
      'WHERE p.ID                    = i.PARTNO_ID'
      'AND i.ILLUM_RT_WORK_CENTER_ID = w.ID'
      'AND i.ILLUM_RT_ID             = h.ID'
      'AND h.STANDARD_ID             = s.ID'
      'AND csc.ID                    = csp.CENTER_SCAN_CONFIG_ID'
      'AND csc.WORK_CENTER_ID        = w.ID'
      'AND csc.STANDARD_ID           = s.ID'
      'AND p.ARINVT_ID               = :ARINVT_ID'
      'AND w.PARENT_ID              IS NULL'
      'AND csp.CENTER_SCAN_CONFIG_ID = :CENTER_SCAN_CONFIG_ID'
      'order by csp.ID')
    Left = 160
    Top = 112
    ParamData = <
      item
        Name = 'ARINVT_ID'
        ParamType = ptInput
      end
      item
        Name = 'CENTER_SCAN_CONFIG_ID'
        DataType = ftBCD
        ParamType = ptInput
        Value = '64'
      end>
    object qryPalletsID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.CENTER_SCAN_PALLETS.ID'
      Size = 0
    end
    object qryPalletsCUSER1: TStringField
      FieldName = 'CUSER1'
      Origin = 'IQ.CENTER_SCAN_PALLETS.CUSER1'
      Size = 60
    end
  end
  object srcPallets: TDataSource
    DataSet = qryPallets
    Left = 136
    Top = 104
  end
end
