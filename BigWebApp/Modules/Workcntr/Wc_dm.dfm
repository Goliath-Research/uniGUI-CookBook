object DM_WC: TDM_WC
  OldCreateOrder = True
  Height = 479
  Width = 741
  object Src_WorkCenter: TDataSource
    DataSet = Tbl_Work_Center
    Left = 36
    Top = 10
  end
  object Tbl_Work_Center: TFDTable
    BeforeOpen = Tbl_Work_CenterBeforeOpen
    BeforePost = Tbl_Work_CenterBeforePost
    BeforeCancel = Tbl_Work_CenterBeforeCancel
    BeforeDelete = Tbl_Work_CenterBeforeDelete
    OnCalcFields = Tbl_Work_CenterCalcFields
    OnDeleteError = HandleError
    OnEditError = HandleError
    OnNewRecord = Tbl_Work_CenterNewRecord
    OnPostError = HandleError
    Filtered = True
    OnFilterRecord = Tbl_Work_CenterFilterRecord
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'WORK_CENTER'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'WORK_CENTER'
    Left = 45
    Top = 23
    object Tbl_Work_CenterEQNO: TStringField
      DisplayLabel = 'Work Center #'
      DisplayWidth = 11
      FieldName = 'EQNO'
      Required = True
      Size = 60
    end
    object Tbl_Work_CenterCNTR_TYPE: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 14
      FieldName = 'CNTR_TYPE'
      Required = True
    end
    object Tbl_Work_CenterCNTR_DESC: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 27
      FieldName = 'CNTR_DESC'
      Required = True
      Size = 250
    end
    object Tbl_Work_CenterCNTR_RATE: TBCDField
      DisplayLabel = 'Rate'
      DisplayWidth = 10
      FieldName = 'CNTR_RATE'
      DisplayFormat = '###.00'
      Size = 2
    end
    object Tbl_Work_CenterCNTR_COST: TFMTBCDField
      DisplayLabel = 'Cost'
      DisplayWidth = 10
      FieldName = 'CNTR_COST'
      DisplayFormat = '########0.00####'
      currency = True
      Size = 6
    end
    object Tbl_Work_CenterCAPACITY: TBCDField
      DisplayLabel = 'Capacity'
      DisplayWidth = 10
      FieldName = 'CAPACITY'
      Size = 2
    end
    object Tbl_Work_CenterMFGCELL: TStringField
      DisplayLabel = 'Manufacturing Cell'
      DisplayWidth = 15
      FieldName = 'MFGCELL'
      Size = 15
    end
    object Tbl_Work_CenterMFG_TYPE: TStringField
      DisplayLabel = 'Manufacturing Type'
      DisplayWidth = 10
      FieldName = 'MFG_TYPE'
      Required = True
      Size = 10
    end
    object Tbl_Work_CenterSET_UP: TBCDField
      DisplayLabel = 'Setup Hours'
      DisplayWidth = 10
      FieldName = 'SET_UP'
      Size = 2
    end
    object Tbl_Work_CenterSTART_SHOTS: TBCDField
      DisplayLabel = 'Startup Shots'
      DisplayWidth = 10
      FieldName = 'START_SHOTS'
      Size = 0
    end
    object Tbl_Work_CenterIS_RT: TStringField
      DisplayLabel = 'RT?'
      DisplayWidth = 3
      FieldName = 'IS_RT'
      Size = 1
    end
    object Tbl_Work_CenterRT_ADDRESS: TStringField
      DisplayWidth = 20
      FieldName = 'RT_ADDRESS'
    end
    object Tbl_Work_CenterEPlant_Name: TStringField
      DisplayLabel = 'EPlant Name'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'EPlant_Name'
      LookupDataSet = QryEPlant
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'EPLANT_ID'
      Visible = False
      Lookup = True
    end
    object Tbl_Work_CenterRTSERVER_NOT_SIGNALED: TStringField
      DisplayLabel = 'RTServer Not Signaled'
      DisplayWidth = 18
      FieldName = 'RTSERVER_NOT_SIGNALED'
      Visible = False
      Size = 1
    end
    object Tbl_Work_CenterTIME_FENCE: TBCDField
      DisplayLabel = 'Time Fence'
      DisplayWidth = 10
      FieldName = 'TIME_FENCE'
      Visible = False
      Size = 0
    end
    object Tbl_Work_CenterRTSERVER_PREFIX: TStringField
      DisplayLabel = 'RTServer Prefix'
      DisplayWidth = 12
      FieldName = 'RTSERVER_PREFIX'
      Visible = False
      Size = 25
    end
    object Tbl_Work_CenterIS_DART: TStringField
      DisplayWidth = 7
      FieldName = 'IS_DART'
      Visible = False
      Size = 1
    end
    object Tbl_Work_CenterFLOOR_BACKFLUSH: TStringField
      DisplayLabel = 'Floor Backflush?'
      DisplayWidth = 13
      FieldName = 'FLOOR_BACKFLUSH'
      Visible = False
      OnValidate = Tbl_Work_CenterFLOOR_BACKFLUSHValidate
      FixedChar = True
      Size = 1
    end
    object Tbl_Work_CenterID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object Tbl_Work_CenterASY_MACH: TStringField
      DisplayLabel = 'Assembly?'
      DisplayWidth = 1
      FieldName = 'ASY_MACH'
      Visible = False
      Size = 1
    end
    object Tbl_Work_CenterPMEQMT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PMEQMT_ID'
      Visible = False
      Size = 0
    end
    object Tbl_Work_CenterEPLANT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
    object Tbl_Work_CenterMFGCELL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'MFGCELL_ID'
      Visible = False
      Size = 0
    end
    object Tbl_Work_CenterLOCATIONS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'LOCATIONS_ID'
      Visible = False
      Size = 0
    end
    object Tbl_Work_CenterLOCATIONS_ID_IN: TBCDField
      DisplayWidth = 10
      FieldName = 'LOCATIONS_ID_IN'
      Visible = False
      Size = 0
    end
    object Tbl_Work_CenterSNAP_TO_LAST: TBCDField
      FieldName = 'SNAP_TO_LAST'
      Visible = False
      Size = 0
    end
    object Tbl_Work_CenterPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object Tbl_Work_CenterRT_ARCHIVE_CYCLE_TIME: TStringField
      FieldName = 'RT_ARCHIVE_CYCLE_TIME'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object Tbl_Work_CenterCONNECTED_STATUS_INDICATOR: TStringField
      FieldName = 'CONNECTED_STATUS_INDICATOR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object Tbl_Work_CenterIS_VIRTUAL: TStringField
      FieldName = 'IS_VIRTUAL'
      Visible = False
      Size = 1
    end
    object Tbl_Work_CenterPARENT_ID: TBCDField
      FieldName = 'PARENT_ID'
      Visible = False
      Size = 0
    end
    object Tbl_Work_CenterRT_ADDRESS_OUT: TBCDField
      FieldName = 'RT_ADDRESS_OUT'
      Visible = False
      Size = 0
    end
    object Tbl_Work_CenterIS_DEDICATED_LIGHTSTICK_PORT: TStringField
      FieldName = 'IS_DEDICATED_LIGHTSTICK_PORT'
      Visible = False
      Size = 1
    end
    object Tbl_Work_CenterLIGHTSTICK_OUTPUT_TYPE: TBCDField
      FieldName = 'LIGHTSTICK_OUTPUT_TYPE'
      Visible = False
      Size = 0
    end
    object Tbl_Work_CenterLIGHTSTICK_COM_PORT: TBCDField
      FieldName = 'LIGHTSTICK_COM_PORT'
      Visible = False
      Size = 0
    end
    object Tbl_Work_CenterLIGHTSTICK_CLIENT_IP: TStringField
      FieldName = 'LIGHTSTICK_CLIENT_IP'
      Visible = False
    end
    object Tbl_Work_CenterLIGHTSTICK_HOST_IP: TStringField
      FieldName = 'LIGHTSTICK_HOST_IP'
      Visible = False
    end
    object Tbl_Work_CenterLookup_Mfgtype: TStringField
      FieldKind = fkCalculated
      FieldName = 'Lookup_Mfgtype'
      Visible = False
      Size = 10
      Calculated = True
    end
    object Tbl_Work_CenterEXCLUDE_AUTO_LOAD: TStringField
      FieldName = 'EXCLUDE_AUTO_LOAD'
      Visible = False
      Size = 1
    end
    object Tbl_Work_CenterFIXED_CNTR_COST: TFMTBCDField
      FieldName = 'FIXED_CNTR_COST'
      Visible = False
      Size = 6
    end
    object Tbl_Work_CenterFLOOR_ACT_MTRL: TStringField
      FieldName = 'FLOOR_ACT_MTRL'
      Visible = False
      Size = 1
    end
    object Tbl_Work_CenterCUSER1: TStringField
      FieldName = 'CUSER1'
      Visible = False
      Size = 60
    end
    object Tbl_Work_CenterCUSER2: TStringField
      FieldName = 'CUSER2'
      Visible = False
      Size = 60
    end
    object Tbl_Work_CenterCUSER3: TStringField
      FieldName = 'CUSER3'
      Visible = False
      Size = 60
    end
    object Tbl_Work_CenterCUSER4: TStringField
      FieldName = 'CUSER4'
      Visible = False
      Size = 60
    end
    object Tbl_Work_CenterCUSER5: TStringField
      FieldName = 'CUSER5'
      Visible = False
      Size = 60
    end
    object Tbl_Work_CenterNUSER1: TFMTBCDField
      FieldName = 'NUSER1'
      Visible = False
      Size = 6
    end
    object Tbl_Work_CenterNUSER2: TFMTBCDField
      FieldName = 'NUSER2'
      Visible = False
      Size = 6
    end
    object Tbl_Work_CenterNUSER3: TFMTBCDField
      FieldName = 'NUSER3'
      Visible = False
      Size = 6
    end
    object Tbl_Work_CenterNUSER4: TFMTBCDField
      FieldName = 'NUSER4'
      Visible = False
      Size = 6
    end
    object Tbl_Work_CenterNUSER5: TFMTBCDField
      FieldName = 'NUSER5'
      Visible = False
      Size = 6
    end
    object Tbl_Work_CenterPCMON_SERVICE_GROUP_ID: TBCDField
      FieldName = 'PCMON_SERVICE_GROUP_ID'
      Visible = False
      Size = 0
    end
    object Tbl_Work_CenterFRAME_ID: TBCDField
      FieldName = 'FRAME_ID'
      Visible = False
      Size = 0
    end
    object Tbl_Work_CenterFRAME_ARINVT_ID_MAT: TBCDField
      FieldName = 'FRAME_ARINVT_ID_MAT'
      Visible = False
      Size = 0
    end
    object Tbl_Work_CenterFrameNo: TStringField
      FieldKind = fkCalculated
      FieldName = 'FrameNo'
      Visible = False
      Size = 25
      Calculated = True
    end
    object Tbl_Work_CenterFrameDescrip: TStringField
      FieldKind = fkCalculated
      FieldName = 'FrameDescrip'
      Visible = False
      Size = 100
      Calculated = True
    end
    object Tbl_Work_CenterFramePmEqmtNo: TStringField
      FieldKind = fkCalculated
      FieldName = 'FramePmEqmtNo'
      Visible = False
      Size = 25
      Calculated = True
    end
    object Tbl_Work_CenterFrameMatItemNo: TStringField
      FieldKind = fkCalculated
      FieldName = 'FrameMatItemNo'
      Visible = False
      Size = 25
      Calculated = True
    end
    object Tbl_Work_CenterFrameMatDescrip: TStringField
      FieldKind = fkCalculated
      FieldName = 'FrameMatDescrip'
      Visible = False
      Size = 100
      Calculated = True
    end
    object Tbl_Work_CenterFrameMatRev: TStringField
      FieldKind = fkCalculated
      FieldName = 'FrameMatRev'
      Visible = False
      Calculated = True
    end
    object Tbl_Work_CenterFrameMatClass: TStringField
      FieldKind = fkCalculated
      FieldName = 'FrameMatClass'
      Visible = False
      Calculated = True
    end
    object Tbl_Work_CenterRT_Address_Descrip: TStringField
      FieldKind = fkCalculated
      FieldName = 'RT_Address_Descrip'
      Visible = False
      Size = 100
      Calculated = True
    end
    object Tbl_Work_CenterFRAME_SET_ID: TBCDField
      FieldName = 'FRAME_SET_ID'
      Visible = False
      Size = 0
    end
    object Tbl_Work_CenterFramePMEqmt_ID: TFloatField
      FieldKind = fkCalculated
      FieldName = 'FramePMEqmt_ID'
      Visible = False
      Calculated = True
    end
    object Tbl_Work_CenterAUTO_LABEL_GROUP_ID: TBCDField
      FieldName = 'AUTO_LABEL_GROUP_ID'
      Visible = False
      Size = 0
    end
    object Tbl_Work_CenterUSE_DEFAULT_CNTR_TYPE: TStringField
      FieldName = 'USE_DEFAULT_CNTR_TYPE'
      Visible = False
      Size = 1
    end
    object Tbl_Work_CenterEXCLUDE_PM: TStringField
      FieldName = 'EXCLUDE_PM'
      Visible = False
      Size = 1
    end
    object Tbl_Work_CenterSTAGING_HRS: TFMTBCDField
      FieldName = 'STAGING_HRS'
      Visible = False
      Size = 6
    end
    object Tbl_Work_CenterPICKUP_PACKAGES: TBCDField
      FieldName = 'PICKUP_PACKAGES'
      Visible = False
      Size = 0
    end
    object Tbl_Work_CenterPICKUP_PALLETS: TBCDField
      FieldName = 'PICKUP_PALLETS'
      Visible = False
      Size = 0
    end
    object Tbl_Work_CenterTRANS_PRIORITY: TBCDField
      FieldName = 'TRANS_PRIORITY'
      Visible = False
      Size = 0
    end
    object Tbl_Work_CenterTREATMENT_CUBE_CAPACITY: TFMTBCDField
      FieldName = 'TREATMENT_CUBE_CAPACITY'
      Visible = False
      Size = 6
    end
  end
  object PkWorkCntr: TIQWebHpick
    BeforeOpen = AssignEPlantFilter
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select w.eqno as eqno,'
      '       w.cntr_desc as cntr_desc,'
      '       w.cntr_type as cntr_type,'
      '       w.ID as id,'
      '       w.eplant_id as eplant_id,'
      '       e.name as eplant_name,'
      '       m.mfgcell as mfgcell,'
      '       d.name as division_name,'
      '       w.pk_hide as pk_hide,'
      '       w.mfg_type  as mfg_type'
      ' from work_center w,'
      '      mfgcell m,'
      '      division d,'
      '      eplant e'
      'where w.mfgcell_id = m.id(+)'
      '  and m.division_id = d.id(+)'
      '  and e.id(+) = w.eplant_id'
      
        '  and ( parent_id is null or mfg.work_center_belong_to_complex(w' +
        '.id) = 1)'
      
        '  and mfg.lookup_mfgtype( w.mfg_type ) not in ('#39'ASSY2'#39', '#39'ASSY3'#39',' +
        ' '#39'COMPLEX'#39')'
      '  '
      ' '
      ' '
      ' ')
    OnIQModify = PkWorkCntrIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    AssociatedDataSource = Src_WorkCenter
    ForceShowWaitForPrompt = False
    Left = 44
    Top = 140
    object PkWorkCntrEQNO: TStringField
      DisplayLabel = 'Work Center #'
      FieldName = 'EQNO'
      Origin = 'w.eqno'
      Size = 60
    end
    object PkWorkCntrCNTR_DESC: TStringField
      DisplayLabel = 'Description'
      FieldName = 'CNTR_DESC'
      Origin = 'w.cntr_desc'
      Size = 250
    end
    object PkWorkCntrCNTR_TYPE: TStringField
      DisplayLabel = 'Type'
      FieldName = 'CNTR_TYPE'
      Origin = 'w.cntr_type'
    end
    object PkWorkCntrID: TBCDField
      FieldName = 'ID'
      Origin = 'w.id'
      Visible = False
      Size = 0
    end
    object PkWorkCntrEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'w.eplant_id'
      Visible = False
      Size = 0
    end
    object PkWorkCntrMFGCELL: TStringField
      DisplayLabel = 'Manufacturing Cell'
      FieldName = 'MFGCELL'
      Origin = 'm.mfgcell'
      Size = 15
    end
    object PkWorkCntrDIVISION_NAME: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 15
      FieldName = 'DIVISION_NAME'
      Origin = 'd.name'
      Size = 25
    end
    object PkWorkCntrEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 12
      FieldName = 'EPLANT_NAME'
      Origin = 'e.name'
      Size = 30
    end
    object PkWorkCntrPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object PkWorkCntrMFG_TYPE: TStringField
      DisplayLabel = 'Mfg Type'
      FieldName = 'MFG_TYPE'
      FixedChar = True
      Size = 10
    end
  end
  object SrcILLUM_RT: TDataSource
    DataSet = TblILLUM_RT
    Left = 40
    Top = 76
  end
  object TblILLUM_RT: TFDTable
    BeforeInsert = PostParentsBeforeEdit
    BeforeEdit = PostParentsBeforeEdit
    OnDeleteError = HandleError
    OnEditError = HandleError
    OnPostError = HandleError
    IndexFieldNames = 'WORK_CENTER_ID'
    MasterSource = Src_WorkCenter
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'ILLUM_RT'
    TableName = 'ILLUM_RT'
    Left = 48
    Top = 88
  end
  object SrcRT_Address: TDataSource
    DataSet = TblRT_Address
    Left = 136
    Top = 76
  end
  object TblRT_Address: TFDQuery
    OnDeleteError = HandleError
    OnEditError = HandleError
    OnPostError = HandleError
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'RT_ADDRESS'
    UpdateOptions.KeyFields = 'ADDRESS'
    UpdateObject = FDUpdateSQL_RT_Address
    SQL.Strings = (
      '  SELECT address,'
      '         board_position,'
      '         is_virtual,'
      '         descrip'
      '    FROM rt_address'
      'ORDER BY address')
    Left = 152
    Top = 88
    object TblRT_AddressADDRESS: TStringField
      FieldName = 'ADDRESS'
      Origin = 'ADDRESS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TblRT_AddressBOARD_POSITION: TStringField
      FieldName = 'BOARD_POSITION'
      Origin = 'BOARD_POSITION'
      FixedChar = True
      Size = 4
    end
    object TblRT_AddressIS_VIRTUAL: TStringField
      FieldName = 'IS_VIRTUAL'
      Origin = 'IS_VIRTUAL'
      Size = 1
    end
    object TblRT_AddressDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 50
    end
  end
  object PkVendor: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select vendorno,'
      '           company,'
      '           city, state,zip,'
      '           ID,'
      '           pk_hide'
      '  from v_vendor'
      'order by vendorno'
      '           '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 104
    Top = 140
    object PkVendorVENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      FieldName = 'VENDORNO'
      Size = 10
    end
    object PkVendorCOMPANY: TStringField
      DisplayLabel = 'Company'
      FieldName = 'COMPANY'
      Size = 60
    end
    object PkVendorCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Size = 30
    end
    object PkVendorSTATE: TStringField
      DisplayLabel = 'State or Region'
      FieldName = 'STATE'
    end
    object PkVendorZIP: TStringField
      DisplayLabel = 'Postal Code'
      FieldName = 'ZIP'
      Size = 10
    end
    object PkVendorID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkVendorPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.VENDOR.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object SrcWorkCenterElem: TDataSource
    DataSet = TblWorkCenterElem
    Left = 240
    Top = 76
  end
  object TblWorkCenterElem: TFDQuery
    BeforeOpen = TblWorkCenterElemBeforeOpen
    BeforeInsert = PostParentsBeforeEdit
    BeforeEdit = PostParentsBeforeEdit
    BeforePost = AssignIDBeforePost
    AfterPost = TblWorkCenterElemAfterPost
    BeforeDelete = PostParentsBeforeEdit
    AfterDelete = TblWorkCenterElemAfterPost
    OnNewRecord = TblWorkCenterElemNewRecord
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evItems]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.UpdateTableName = 'WORK_CENTER_ELEMENTS'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = FDUpdateSQL_WorkCenterElem
    SQL.Strings = (
      'SELECT a.id,'
      '       a.work_center_id,'
      '       a.elements_id,'
      '       b.elem_descrip AS description,'
      '       a.std_cost,'
      '       a.fixed_std_cost'
      '  FROM work_center_elements a, elements b'
      ' WHERE a.work_center_id = :ID AND'
      '       b.id(+) = a.elements_id')
    Left = 248
    Top = 88
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object TblWorkCenterElemDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'DESCRIPTION'
      Origin = 'DESCRIPTION'
      ReadOnly = True
      FixedChar = True
      Size = 30
    end
    object TblWorkCenterElemSTD_COST: TFMTBCDField
      DisplayLabel = 'Cost'
      DisplayWidth = 10
      FieldName = 'STD_COST'
      DisplayFormat = '#########.######'
      Size = 6
    end
    object TblWorkCenterElemFIXED_STD_COST: TFMTBCDField
      DisplayLabel = 'Fixed Cost'
      DisplayWidth = 10
      FieldName = 'FIXED_STD_COST'
      DisplayFormat = '#########.######'
      Size = 6
    end
    object TblWorkCenterElemID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object TblWorkCenterElemWORK_CENTER_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'WORK_CENTER_ID'
      Visible = False
      Size = 0
    end
    object TblWorkCenterElemELEMENTS_ID: TBCDField
      DisplayLabel = 'Cost Element Description'
      DisplayWidth = 10
      FieldName = 'ELEMENTS_ID'
      Required = True
      Visible = False
      Size = 0
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
      '       name'
      '  from eplant')
    Left = 164
    Top = 140
  end
  object wwQryMfgType: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select RTrim(mfgtype) as mfgtype,'
      '       descrip'
      '  from v_mfgtype_ex'
      'order by RTrim(mfgtype)'
      ' ')
    Left = 323
    Top = 22
    object wwQryMfgTypeMFGTYPE: TStringField
      DisplayLabel = 'Mfg Type'
      DisplayWidth = 10
      FieldName = 'MFGTYPE'
      Size = 10
    end
    object wwQryMfgTypeDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
    end
  end
  object wwTblMfgType1: TFDTable
    IndexFieldNames = 'MFGTYPE'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'MFGTYPE'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'MFGTYPE'
    Left = 48
    Top = 206
    object wwTblMfgType1MFGTYPE: TStringField
      DisplayLabel = 'Mfg Type'
      DisplayWidth = 10
      FieldName = 'MFGTYPE'
      Required = True
      Size = 10
    end
    object wwTblMfgType1DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
    end
    object wwTblMfgType1ID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object wwQryMfgCell: TFDQuery
    Filtered = True
    IndexFieldNames = 'MFGTYPE'
    MasterSource = Src_WorkCenter
    MasterFields = 'MFG_TYPE'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select mfgcell,'
      '       descrip,'
      '       mfgtype,'
      '       eplant_id,'
      '       id'
      '  from v_mfgcell'
      ' where rtrim(mfgtype) = rtrim(:mfg_type)'
      ' order by descrip'
      ' ')
    Left = 160
    Top = 22
    ParamData = <
      item
        Name = 'MFG_TYPE'
        DataType = ftString
        ParamType = ptInput
        Size = 11
      end>
    object wwQryMfgCellMFGCELL: TStringField
      DisplayLabel = 'Mfg Cell'
      DisplayWidth = 15
      FieldName = 'MFGCELL'
      Origin = 'MFGCELL.MFGCELL'
      Size = 15
    end
    object wwQryMfgCellDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Origin = 'MFGCELL.DESCRIP'
      Size = 25
    end
    object wwQryMfgCellMFGTYPE: TStringField
      FieldName = 'MFGTYPE'
      Origin = 'MFGCELL.MFGTYPE'
      Visible = False
      Size = 10
    end
    object wwQryMfgCellMfgTypeLookup: TStringField
      FieldKind = fkLookup
      FieldName = 'MfgTypeLookup'
      LookupDataSet = wwQryMfgType
      LookupKeyFields = 'MFGTYPE'
      LookupResultField = 'MFGTYPE'
      KeyFields = 'MFGTYPE'
      Visible = False
      Lookup = True
    end
    object wwQryMfgCellEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'MFGCELL.EPLANT_ID'
      Visible = False
      Size = 0
    end
    object wwQryMfgCellID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'MFGCELL.ID'
      Size = 0
    end
  end
  object wwQryLocations: TFDQuery
    BeforeOpen = AssignEPlantFilter
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select l.id,'
      '       l.loc_desc,'
      '       l.eplant_id,'
      '       e.name as eplant_name,'
      '       d.name as division_name'
      '  from locations l,'
      '       eplant e,'
      '       division d'
      ' where l.eplant_id = e.id(+)'
      '   and l.division_id = d.id(+)'
      ' order by'
      '      l.loc_desc')
    Left = 240
    Top = 140
    object wwQryLocationsLOC_DESC: TStringField
      DisplayLabel = 'Location'
      DisplayWidth = 25
      FieldName = 'LOC_DESC'
      Size = 30
    end
    object wwQryLocationsEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object wwQryLocationsEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 10
      FieldName = 'EPLANT_NAME'
      Size = 30
    end
    object wwQryLocationsDIVISION_NAME: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 10
      FieldName = 'DIVISION_NAME'
      Size = 25
    end
    object wwQryLocationsID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object SrcChildWorkCenter: TDataSource
    DataSet = QryChildWorkCenter
    Left = 166
    Top = 212
  end
  object QryChildWorkCenter: TFDQuery
    Tag = 1
    BeforeInsert = PostParentVirtualWorkCenterBeforeEdit
    BeforeEdit = PostParentVirtualWorkCenterBeforeEdit
    BeforePost = QryChildWorkCenterBeforePost
    OnNewRecord = QryChildWorkCenterNewRecord
    MasterSource = Src_WorkCenter
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'WORK_CENTER'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLChildWorkCenter
    SQL.Strings = (
      'select w.id,'
      '       w.eqno,'
      '       w.cntr_desc,'
      '       w.cntr_type,'
      '       w.capacity,'
      '       w.set_up,'
      '       w.is_rt,'
      '       w.rtserver_prefix,'
      '       rt.rt_address,'
      '       w.parent_id,'
      '       w.pk_hide,'
      '       w.pmeqmt_id,'
      '       w.is_virtual'
      '  from work_center w, illum_rt rt'
      ' where w.parent_id = :id'
      '   and w.id = rt.work_center_id(+)'
      ' order by '
      '       id')
    Left = 166
    Top = 230
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryChildWorkCenterEQNO: TStringField
      DisplayLabel = 'Work Center #'
      DisplayWidth = 11
      FieldName = 'EQNO'
      FixedChar = True
      Size = 60
    end
    object QryChildWorkCenterCNTR_DESC: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 28
      FieldName = 'CNTR_DESC'
      FixedChar = True
      Size = 250
    end
    object QryChildWorkCenterCNTR_TYPE: TStringField
      DisplayLabel = 'Center Type'
      DisplayWidth = 12
      FieldName = 'CNTR_TYPE'
      FixedChar = True
    end
    object QryChildWorkCenterCAPACITY: TBCDField
      DisplayLabel = 'Capacity'
      DisplayWidth = 10
      FieldName = 'CAPACITY'
      Size = 2
    end
    object QryChildWorkCenterSET_UP: TBCDField
      DisplayLabel = 'Setup Hours'
      DisplayWidth = 10
      FieldName = 'SET_UP'
      Size = 2
    end
    object QryChildWorkCenterIS_RT: TStringField
      DisplayLabel = 'Connected To~RTServer'
      DisplayWidth = 11
      FieldName = 'IS_RT'
      FixedChar = True
      Size = 1
    end
    object QryChildWorkCenterRTSERVER_PREFIX: TStringField
      DisplayLabel = 'RT Server~Prefix'
      DisplayWidth = 10
      FieldName = 'RTSERVER_PREFIX'
      Size = 25
    end
    object QryChildWorkCenterRT_ADDRESS: TStringField
      DisplayLabel = 'RealTime~Address'
      DisplayWidth = 11
      FieldName = 'RT_ADDRESS'
      ReadOnly = True
    end
    object QryChildWorkCenterPARENT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PARENT_ID'
      Visible = False
      Size = 0
    end
    object QryChildWorkCenterID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryChildWorkCenterPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryChildWorkCenterPMEQMT_ID: TBCDField
      FieldName = 'PMEQMT_ID'
      Visible = False
      Size = 0
    end
    object QryChildWorkCenterIS_VIRTUAL: TStringField
      FieldName = 'IS_VIRTUAL'
      Visible = False
      Size = 1
    end
  end
  object UpdateSQLChildWorkCenter: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into work_center'
      
        '  (ID, EQNO, CNTR_DESC, CNTR_TYPE, CAPACITY, SET_UP, IS_RT, RTSE' +
        'RVER_PREFIX, '
      '   PARENT_ID, PK_HIDE, PMEQMT_ID, IS_VIRTUAL)'
      'values'
      
        '  (:ID, :EQNO, :CNTR_DESC, :CNTR_TYPE, :CAPACITY, :SET_UP, :IS_R' +
        'T, :RTSERVER_PREFIX, '
      '   :PARENT_ID, :PK_HIDE, :PMEQMT_ID, :IS_VIRTUAL)')
    ModifySQL.Strings = (
      'update work_center'
      'set'
      '  ID = :ID,'
      '  EQNO = :EQNO,'
      '  CNTR_DESC = :CNTR_DESC,'
      '  CNTR_TYPE = :CNTR_TYPE,'
      '  CAPACITY = :CAPACITY,'
      '  SET_UP = :SET_UP,'
      '  IS_RT = :IS_RT,'
      '  RTSERVER_PREFIX = :RTSERVER_PREFIX,'
      '  PARENT_ID = :PARENT_ID,'
      '  PK_HIDE = :PK_HIDE,'
      '  PMEQMT_ID = :PMEQMT_ID,'
      '  IS_VIRTUAL = :IS_VIRTUAL'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from work_center'
      'where'
      '  ID = :OLD_ID')
    Left = 167
    Top = 252
  end
  object QryPMLookup: TFDQuery
    MasterSource = Src_WorkCenter
    MasterFields = 'PMEQMT_ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select'
      '  id as id,'
      '  trim(eqno) as eqno,'
      '  trim(descrip) as descrip,'
      '  trim(class) as class,'
      '  trim(location) as location'
      'from pmeqmt  '
      'where id = :PMEQMT_ID')
    Left = 400
    Top = 24
    ParamData = <
      item
        Name = 'PMEQMT_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryPMLookupID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.PMEQMT.ID'
      Size = 0
    end
    object QryPMLookupEQNO: TStringField
      FieldName = 'EQNO'
      Origin = 'IQ.PMEQMT.EQNO'
      Size = 25
    end
    object QryPMLookupDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'IQ.PMEQMT.DESCRIP'
      Size = 50
    end
    object QryPMLookupCLASS: TStringField
      FieldName = 'CLASS'
      Origin = 'IQ.PMEQMT.CLASS'
      FixedChar = True
      Size = 2
    end
    object QryPMLookupLOCATION: TStringField
      FieldName = 'LOCATION'
      Origin = 'IQ.PMEQMT.LOCATION'
      Size = 30
    end
  end
  object SrcWork_Center_RejectCode: TDataSource
    DataSet = TblWork_Center_RejectCode
    Left = 301
    Top = 212
  end
  object TblWork_Center_RejectCode: TFDTable
    BeforeInsert = PostParentsBeforeEdit
    BeforeEdit = PostParentsBeforeEdit
    BeforePost = AssignIDBeforePost
    OnCalcFields = TblWork_Center_RejectCodeCalcFields
    IndexFieldNames = 'WORK_CENTER_ID'
    MasterSource = Src_WorkCenter
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'WORK_CENTER_REJECT_CODE'
    TableName = 'WORK_CENTER_REJECT_CODE'
    Left = 300
    Top = 227
    object TblWork_Center_RejectCodeReject_Code_Disp: TStringField
      DisplayLabel = 'Reject Code'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Reject_Code_Disp'
      Calculated = True
    end
    object TblWork_Center_RejectCodeReject_Desc_Disp: TStringField
      DisplayLabel = 'Reject Description'
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'Reject_Desc_Disp'
      Size = 30
      Calculated = True
    end
    object TblWork_Center_RejectCodeID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object TblWork_Center_RejectCodeREJECT_CODE_ID: TBCDField
      FieldName = 'REJECT_CODE_ID'
      Visible = False
      Size = 0
    end
    object TblWork_Center_RejectCodeWORK_CENTER_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'WORK_CENTER_ID'
      Visible = False
      Size = 0
    end
  end
  object PkRejectCode: TIQWebHpick
    BeforeOpen = PkRejectCodeBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id, reject_code, attribute, eplant_id,'
      '       pk_hide'
      '  from reject_code'
      ' where misc.eplant_filter_include_nulls(eplant_id) = 1'
      '   and (:mfgcell_id = 0'
      '        or'
      '        :mfgcell_id > 0 and :mfgcell_id = reject_code.mfgcell_id'
      '        or'
      '        reject_code.mfgcell_id is null )'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 299
    Top = 272
    ParamData = <
      item
        Name = 'mfgcell_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkRejectCodeID: TBCDField
      FieldName = 'ID'
      Origin = 'id'
      Visible = False
      Size = 0
    end
    object PkRejectCodeREJECT_CODE: TStringField
      DisplayLabel = 'Reject Code'
      FieldName = 'REJECT_CODE'
      Origin = 'REJECT_CODE'
      FixedChar = True
      Size = 5
    end
    object PkRejectCodeATTRIBUTE: TStringField
      DisplayLabel = 'Description'
      FieldName = 'ATTRIBUTE'
      Origin = 'ATTRIBUTE'
      FixedChar = True
      Size = 100
    end
    object PkRejectCodeEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Size = 0
    end
    object PkRejectCodePK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      Size = 1
    end
  end
  object TblPCMonSrvcGrp: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PCMON_SERVICE_GROUP'
    TableName = 'PCMON_SERVICE_GROUP'
    Left = 48
    Top = 296
  end
  object PkFrame: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select f.id as id,'
      '       f.frame_no as frame_no,'
      '       f.descrip as descrip,'
      '       p.eqno as eqno'
      '  from frame f,'
      '       pmeqmt p'
      ' where f.pmeqmt_id = p.id(+)'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 56
    Top = 368
    object PkFrameID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkFrameFRAME_NO: TStringField
      DisplayLabel = 'Frame #'
      FieldName = 'FRAME_NO'
      Size = 25
    end
    object PkFrameDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Size = 100
    end
    object PkFrameEQNO: TStringField
      DisplayLabel = 'Tool Equipment #'
      FieldName = 'EQNO'
      Size = 25
    end
  end
  object SrcLogicalMachines: TDataSource
    DataSet = QryLogicalMachines
    Left = 192
    Top = 360
  end
  object QryLogicalMachines: TFDQuery
    MasterSource = Src_WorkCenter
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select w.id,'
      '       w.eqno,'
      '       w.cntr_desc,'
      '       w.cntr_type,'
      '       w.rt_address'
      '  from work_center w'
      ' where w.frame_parent_work_center_id = :id'
      ' order by'
      '       w.id')
    Left = 192
    Top = 376
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryLogicalMachinesEQNO: TStringField
      DisplayLabel = 'Work Center #'
      DisplayWidth = 28
      FieldName = 'EQNO'
      Origin = 'IQ.WORK_CENTER.EQNO'
      FixedChar = True
      Size = 60
    end
    object QryLogicalMachinesCNTR_DESC: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 36
      FieldName = 'CNTR_DESC'
      Origin = 'IQ.WORK_CENTER.CNTR_DESC'
      Size = 250
    end
    object QryLogicalMachinesCNTR_TYPE: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 16
      FieldName = 'CNTR_TYPE'
      Origin = 'IQ.WORK_CENTER.CNTR_TYPE'
      FixedChar = True
    end
    object QryLogicalMachinesRT_ADDRESS: TStringField
      DisplayLabel = 'RT Address'
      DisplayWidth = 19
      FieldName = 'RT_ADDRESS'
      Origin = 'IQ.WORK_CENTER.RT_ADDRESS'
    end
    object QryLogicalMachinesID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.WORK_CENTER.ID'
      Visible = False
      Size = 0
    end
  end
  object PkArinvtPL: TIQWebHpick
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.itemno    as itemno, '
      '       a.rev       as rev, '
      '       a.descrip   as descrip, '
      '       a.descrip2  as descrip2, '
      '       a.unit      as unit, '
      '       a.id        as id,'
      '       a.eplant_id as eplant_id,'
      '       a.pk_hide   as pk_hide'
      '  from '
      '       arinvt a, arinvt_class b'
      ' where '
      '       a.class = b.class'
      '   and b.primary_material = '#39'Y'#39
      '   and misc.eplant_filter( a.eplant_id ) = 1'
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 108
    Top = 371
    object PkArinvtPLITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object PkArinvtPLREV: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 3
      FieldName = 'REV'
      Size = 15
    end
    object PkArinvtPLDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 100
    end
    object PkArinvtPLDESCRIP2: TStringField
      DisplayLabel = 'Extended Description'
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object PkArinvtPLUNIT: TStringField
      DisplayLabel = 'Unit'
      FieldName = 'UNIT'
      Size = 10
    end
    object PkArinvtPLID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkArinvtPLEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object PkArinvtPLPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object QryAutoLabelGroup: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, descrip from auto_label_group')
    Left = 296
    Top = 352
    object QryAutoLabelGroupDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 50
      FieldName = 'DESCRIP'
      Origin = 'IQ.AUTO_LABEL_GROUP.DESCRIP'
      Size = 50
    end
    object QryAutoLabelGroupID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.AUTO_LABEL_GROUP.ID'
      Visible = False
      Size = 0
    end
  end
  object PkCntrType: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       name,'
      '       eplant_id'
      '  from cntr_type'
      ' where misc.eplant_filter_include_nulls( eplant_id ) = 1')
    OnIQModify = PkCntrTypeIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 384
    Top = 356
    object PkCntrTypeID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.CNTR_TYPE.ID'
      Visible = False
      Size = 0
    end
    object PkCntrTypeNAME: TStringField
      DisplayLabel = 'Center Type'
      FieldName = 'NAME'
      Origin = 'IQ.CNTR_TYPE.NAME'
    end
    object PkCntrTypeEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object QryWorkCenterDownCode: TFDQuery
    BeforePost = QryWorkCenterDownCodeBeforePost
    OnCalcFields = QryWorkCenterDownCodeCalcFields
    OnNewRecord = QryWorkCenterDownCodeNewRecord
    MasterSource = Src_WorkCenter
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'WORK_CENTER_DOWN_CODE'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLDownCode
    SQL.Strings = (
      'select id,'
      '       work_center_id,'
      '       down_code,'
      '       seq'
      '  from work_center_down_code'
      ' where work_center_id = :id'
      'order by seq  ')
    Left = 444
    Top = 120
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryWorkCenterDownCodeSEQ: TBCDField
      DisplayLabel = 'Seq'
      DisplayWidth = 7
      FieldName = 'SEQ'
      Origin = 'IQ.WORK_CENTER_DOWN_CODE.SEQ'
      Size = 0
    end
    object QryWorkCenterDownCodeDOWN_CODE: TStringField
      DisplayLabel = 'Downtime Code'
      DisplayWidth = 18
      FieldName = 'DOWN_CODE'
      Origin = 'IQ.WORK_CENTER_DOWN_CODE.DOWN_CODE'
      Required = True
      Size = 5
    end
    object QryWorkCenterDownCodeDescrip: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 40
      FieldKind = fkCalculated
      FieldName = 'Descrip'
      ReadOnly = True
      Calculated = True
    end
    object QryWorkCenterDownCodeID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.WORK_CENTER_DOWN_CODE.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryWorkCenterDownCodeWORK_CENTER_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'WORK_CENTER_ID'
      Origin = 'IQ.WORK_CENTER_DOWN_CODE.WORK_CENTER_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcWorkCenterDownCode: TDataSource
    DataSet = QryWorkCenterDownCode
    Left = 444
    Top = 84
  end
  object UpdateSQLDownCode: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into work_center_down_code'
      '  (ID, WORK_CENTER_ID, DOWN_CODE, SEQ)'
      'values'
      '  (:ID, :WORK_CENTER_ID, :DOWN_CODE, :SEQ)')
    ModifySQL.Strings = (
      'update work_center_down_code'
      'set'
      '  ID = :ID,'
      '  WORK_CENTER_ID = :WORK_CENTER_ID,'
      '  DOWN_CODE = :DOWN_CODE,'
      '  SEQ = :SEQ'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from work_center_down_code'
      'where'
      '  ID = :OLD_ID')
    Left = 444
    Top = 152
  end
  object PkDownCode: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select down_code,'
      '       down_descrip,'
      '       eplant_id,'
      '       pk_hide '
      '  from down_code'
      ' where misc.eplant_filter_include_nulls(eplant_id) = 1'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 444
    Top = 196
    object PkDownCodeDOWN_CODE: TStringField
      DisplayLabel = 'Downtime Code'
      FieldName = 'DOWN_CODE'
      FixedChar = True
      Size = 5
    end
    object PkDownCodeDOWN_DESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DOWN_DESCRIP'
      FixedChar = True
    end
    object PkDownCodeEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object PkDownCodePK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      Size = 1
    end
  end
  object FDUpdateSQL_RT_Address: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'INSERT INTO RT_ADDRESS'
      '(ADDRESS, BOARD_POSITION, IS_VIRTUAL, DESCRIP)'
      
        'VALUES (:NEW_ADDRESS, :NEW_BOARD_POSITION, :NEW_IS_VIRTUAL, :NEW' +
        '_DESCRIP)')
    ModifySQL.Strings = (
      'UPDATE RT_ADDRESS'
      
        'SET ADDRESS = :NEW_ADDRESS, BOARD_POSITION = :NEW_BOARD_POSITION' +
        ', '
      '  IS_VIRTUAL = :NEW_IS_VIRTUAL, DESCRIP = :NEW_DESCRIP'
      'WHERE ADDRESS = :OLD_ADDRESS')
    DeleteSQL.Strings = (
      'DELETE FROM RT_ADDRESS'
      'WHERE ADDRESS = :OLD_ADDRESS')
    FetchRowSQL.Strings = (
      'SELECT ADDRESS, BOARD_POSITION, IS_VIRTUAL, DESCRIP'
      'FROM RT_ADDRESS'
      'WHERE ADDRESS = :ADDRESS')
    Left = 168
    Top = 104
  end
  object FDUpdateSQL_WorkCenterElem: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'INSERT INTO WORK_CENTER_ELEMENTS'
      '(ID, WORK_CENTER_ID, ELEMENTS_ID, STD_COST, '
      '  FIXED_STD_COST)'
      
        'VALUES (:NEW_ID, :NEW_WORK_CENTER_ID, :NEW_ELEMENTS_ID, :NEW_STD' +
        '_COST, '
      '  :NEW_FIXED_STD_COST)')
    ModifySQL.Strings = (
      'UPDATE WORK_CENTER_ELEMENTS'
      
        'SET ID = :NEW_ID, WORK_CENTER_ID = :NEW_WORK_CENTER_ID, ELEMENTS' +
        '_ID = :NEW_ELEMENTS_ID, '
      '  STD_COST = :NEW_STD_COST, FIXED_STD_COST = :NEW_FIXED_STD_COST'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM WORK_CENTER_ELEMENTS'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT ID, WORK_CENTER_ID, ELEMENTS_ID, STD_COST, FIXED_STD_COST'
      'FROM WORK_CENTER_ELEMENTS'
      'WHERE ID = :ID')
    Left = 264
    Top = 104
  end
  object PkElements: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT id,'
      '       elem_descrip,'
      '       elem_type,'
      '       glacct_id'
      '  FROM elements')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 456
    Top = 352
    object PkElementsID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object PkElementsELEM_DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 18
      FieldName = 'ELEM_DESCRIP'
      Origin = 'ELEM_DESCRIP'
      Required = True
      FixedChar = True
      Size = 30
    end
    object PkElementsELEM_TYPE: TStringField
      DisplayLabel = 'Element Type'
      FieldName = 'ELEM_TYPE'
      Origin = 'ELEM_TYPE'
      FixedChar = True
      Size = 10
    end
    object PkElementsGLACCT_ID: TBCDField
      FieldName = 'GLACCT_ID'
      Origin = 'GLACCT_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
  end
end
