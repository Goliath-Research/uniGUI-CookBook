object SndDM: TSndDM
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 623
  Width = 578
  object SrcSndOp: TDataSource
    DataSet = TblSndop
    Left = 16
    Top = 12
  end
  object SrcOpMat: TDataSource
    DataSet = TblOpMat
    Left = 109
    Top = 12
  end
  object SrcLabor_Rates: TDataSource
    DataSet = TblLabor_Rates
    Left = 193
    Top = 12
  end
  object SrcSndOp_Qty_Breaks: TDataSource
    DataSet = TblSndOp_Qty_Breaks
    Left = 296
    Top = 12
  end
  object TblOpMat: TFDTable
    BeforeInsert = CheckConditionsBeforeEditOpmat
    BeforeEdit = CheckConditionsBeforeEditOpmat
    BeforePost = AssignIDBeforePostOpmat
    AfterPost = TblOpMatAfterPost
    OnCalcFields = TblOpMatCalcFields
    OnDeleteError = HandleError
    OnEditError = HandleError
    OnNewRecord = TblOpMatNewRecord
    OnPostError = HandleError
    IndexFieldNames = 'SNDOP_ID;ARINVT_ID'
    MasterSource = SrcSndOp
    MasterFields = 'ID'
    UpdateOptions.UpdateTableName = 'OPMAT'
    TableName = 'OPMAT'
    Left = 117
    Top = 24
    object TblOpMatSNDOP_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SNDOP_ID'
      Required = True
      Size = 0
    end
    object TblOpMatARINVT_ID: TBCDField
      DisplayLabel = 'Item ID'
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Required = True
      Size = 0
    end
    object TblOpMatPTSPER: TFMTBCDField
      DisplayLabel = 'Items Per'
      DisplayWidth = 10
      FieldName = 'PTSPER'
      DisplayFormat = '########0.######'
      Size = 6
    end
    object TblOpMatWEIGHT: TFMTBCDField
      DisplayLabel = 'Weight'
      DisplayWidth = 10
      FieldName = 'WEIGHT'
      Size = 6
    end
    object TblOpMatLBL_FORMAT: TBCDField
      DisplayLabel = 'Label Format'
      DisplayWidth = 10
      FieldName = 'LBL_FORMAT'
      Size = 0
    end
    object TblOpMatClass: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Class'
      LookupResultField = 'CLASS'
      Calculated = True
    end
    object TblOpMatItemNo: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'ItemNo'
      LookupResultField = 'ITEMNO'
      Size = 25
      Calculated = True
    end
    object TblOpMatDescrip: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldKind = fkCalculated
      FieldName = 'Descrip'
      LookupResultField = 'DESCRIP'
      Size = 100
      Calculated = True
    end
    object TblOpMatRev: TStringField
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'Rev'
      LookupResultField = 'REV'
      Size = 15
      Calculated = True
    end
    object TblOpMatID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object TblOpMatLET_DOWN_RATIO: TBCDField
      DisplayLabel = 'Let Down Ratio'
      DisplayWidth = 10
      FieldName = 'LET_DOWN_RATIO'
      DisplayFormat = '##0.##'
      Size = 2
    end
    object TblOpMatPTSPER_DISP: TFMTBCDField
      DisplayLabel = 'Parts Per'
      DisplayWidth = 10
      FieldName = 'PTSPER_DISP'
      DisplayFormat = '########0.######'
      Size = 6
    end
    object TblOpMatALLOC_REQ: TStringField
      DisplayWidth = 1
      FieldName = 'ALLOC_REQ'
      FixedChar = True
      Size = 1
    end
    object TblOpMatFAB_ALLOC_MULTI: TStringField
      DisplayWidth = 1
      FieldName = 'FAB_ALLOC_MULTI'
      FixedChar = True
      Size = 1
    end
    object TblOpMatUOM: TStringField
      DisplayLabel = 'Native UOM'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Uom'
      LookupResultField = 'UNIT'
      Calculated = True
    end
    object TblOpMatDescrip2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 35
      FieldKind = fkCalculated
      FieldName = 'Descrip2'
      LookupResultField = 'DESCRIP2'
      Size = 100
      Calculated = True
    end
    object TblOpMatSpg: TFloatField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Spg'
      Calculated = True
    end
    object TblOpMatUNIT: TStringField
      DisplayLabel = 'UOM'
      DisplayWidth = 10
      FieldName = 'UNIT'
      ReadOnly = True
      Size = 10
    end
    object TblOpMatNonMaterial: TStringField
      DisplayWidth = 1
      FieldKind = fkCalculated
      FieldName = 'NonMaterial'
      Size = 1
      Calculated = True
    end
    object TblOpMatSTARTUP_QTY: TFMTBCDField
      DisplayLabel = 'Startup Qty'
      DisplayWidth = 10
      FieldName = 'STARTUP_QTY'
      Size = 6
    end
    object TblOpMatINCLUDE_STARTUP_QTY_STD_COST: TStringField
      DisplayLabel = 'Include Startup Qty in Std Cost'
      DisplayWidth = 1
      FieldName = 'INCLUDE_STARTUP_QTY_STD_COST'
      Size = 1
    end
    object TblOpMatCUSER1: TStringField
      DisplayLabel = 'CUser1'
      DisplayWidth = 20
      FieldName = 'CUSER1'
      Size = 255
    end
    object TblOpMatCUSER2: TStringField
      DisplayLabel = 'CUser2'
      DisplayWidth = 20
      FieldName = 'CUSER2'
      Size = 255
    end
    object TblOpMatCUSER3: TStringField
      DisplayLabel = 'CUser3'
      DisplayWidth = 20
      FieldName = 'CUSER3'
      Size = 255
    end
    object TblOpMatNUSER1: TFMTBCDField
      DisplayLabel = 'NUser1'
      DisplayWidth = 10
      FieldName = 'NUSER1'
      Size = 6
    end
    object TblOpMatNUSER2: TFMTBCDField
      DisplayLabel = 'NUser2'
      DisplayWidth = 10
      FieldName = 'NUSER2'
      Size = 6
    end
    object TblOpMatNUSER3: TFMTBCDField
      DisplayLabel = 'NUser3'
      DisplayWidth = 10
      FieldName = 'NUSER3'
      Size = 6
    end
    object TblOpMatSEQ: TBCDField
      DisplayLabel = 'Seq #'
      DisplayWidth = 10
      FieldName = 'SEQ'
      Size = 0
    end
    object TblOpMatMTRL_INFO: TMemoField
      DisplayLabel = 'Material Info'
      DisplayWidth = 10
      FieldName = 'MTRL_INFO'
      OnGetText = TblOpMatMTRL_INFOGetText
      OnSetText = TblOpMatMTRL_INFOSetText
      BlobType = ftMemo
    end
  end
  object TblLabor_Rates: TFDTable
    BeforePost = AssignIDBeforePost
    OnDeleteError = HandleError
    OnEditError = HandleError
    OnPostError = HandleError
    IndexFieldNames = 'ID'
    UpdateOptions.UpdateTableName = 'LABOR_RATES'
    TableName = 'LABOR_RATES'
    Left = 201
    Top = 24
    object TblLabor_RatesID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object TblLabor_RatesLABOR_RATE: TFMTBCDField
      FieldName = 'LABOR_RATE'
      Size = 6
    end
  end
  object TblSndOp_Qty_Breaks: TFDTable
    BeforeInsert = PostParentsBeforeEdit
    BeforeEdit = PostParentsBeforeEdit
    OnDeleteError = HandleError
    OnEditError = HandleError
    OnPostError = HandleError
    IndexFieldNames = 'SNDOP_ID'
    MasterSource = SrcSndOp
    MasterFields = 'ID'
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereAll
    UpdateOptions.UpdateTableName = 'SNDOP_QTY_BREAKS'
    TableName = 'SNDOP_QTY_BREAKS'
    Left = 304
    Top = 28
    object TblSndOp_Qty_BreaksSNDOP_ID: TBCDField
      FieldName = 'SNDOP_ID'
      Required = True
      Size = 0
    end
    object TblSndOp_Qty_BreaksQUAN: TBCDField
      FieldName = 'QUAN'
      Required = True
      Size = 0
    end
    object TblSndOp_Qty_BreaksQPRICE: TFMTBCDField
      FieldName = 'QPRICE'
      Size = 6
    end
    object TblSndOp_Qty_BreaksPRICE_DATE: TDateTimeField
      FieldName = 'PRICE_DATE'
      EditMask = '!99/99/00;1;_'
    end
    object TblSndOp_Qty_BreaksEFFECT_DATE: TDateTimeField
      FieldName = 'EFFECT_DATE'
      EditMask = '!99/99/00;1;_'
    end
    object TblSndOp_Qty_BreaksDEACTIVE_DATE: TDateTimeField
      FieldName = 'DEACTIVE_DATE'
    end
  end
  object SrcArinvt: TDataSource
    DataSet = TblArinvt
    Left = 26
    Top = 102
  end
  object TblArinvt: TFDTable
    Tag = 1
    BeforePost = AssignIDBeforePost
    OnDeleteError = HandleError
    OnEditError = HandleError
    OnPostError = HandleError
    IndexFieldNames = 'ID'
    FetchOptions.AssignedValues = [evItems]
    FetchOptions.Items = [fiBlobs, fiDetails]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    UpdateOptions.UpdateTableName = 'ARINVT'
    TableName = 'ARINVT'
    Left = 14
    Top = 74
    object TblArinvtID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object TblArinvtCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Required = True
      Size = 2
    end
    object TblArinvtITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Required = True
      Size = 50
    end
    object TblArinvtREV: TStringField
      DisplayLabel = 'Revision'
      FieldName = 'REV'
      Required = True
      Size = 15
    end
    object TblArinvtDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Required = True
      Size = 35
    end
    object TblArinvtVENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Size = 0
    end
    object TblArinvtUNIT: TStringField
      DisplayLabel = 'Unit'
      FieldName = 'UNIT'
      Required = True
      Size = 10
    end
    object TblArinvtEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object TblArinvtDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP2'
      Size = 100
    end
  end
  object SrcArinvt_Breaks: TDataSource
    DataSet = TblArinvt_Breaks
    Left = 97
    Top = 90
  end
  object TblArinvt_Breaks: TFDTable
    Tag = 1
    BeforeInsert = PostParentsBeforeEdit
    BeforeEdit = PostParentsBeforeEdit
    BeforePost = TblArinvt_BreaksBeforePost
    OnDeleteError = HandleError
    OnEditError = HandleError
    OnNewRecord = TblArinvt_BreaksNewRecord
    OnPostError = HandleError
    Filtered = True
    Filter = 'BUYING='#39'Y'#39
    OnFilterRecord = FilterNativeCurrency
    IndexFieldNames = 'ARINVT_ID;QUAN'
    MasterSource = SrcOpMat
    MasterFields = 'ARINVT_ID'
    UpdateOptions.UpdateTableName = 'ARINVT_BREAKS'
    TableName = 'ARINVT_BREAKS'
    Left = 109
    Top = 102
    object TblArinvt_BreaksARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Required = True
      Size = 0
    end
    object TblArinvt_BreaksQUAN: TBCDField
      FieldName = 'QUAN'
      Required = True
      Size = 2
    end
    object TblArinvt_BreaksQPRICE: TFMTBCDField
      FieldName = 'QPRICE'
      Size = 6
    end
    object TblArinvt_BreaksPRICE_DATE: TDateTimeField
      FieldName = 'PRICE_DATE'
    end
    object TblArinvt_BreaksEFFECT_DATE: TDateTimeField
      FieldName = 'EFFECT_DATE'
    end
    object TblArinvt_BreaksBUYING: TStringField
      FieldName = 'BUYING'
      Visible = False
      Size = 1
    end
    object TblArinvt_BreaksDEACTIVE_DATE: TDateTimeField
      FieldName = 'DEACTIVE_DATE'
    end
    object TblArinvt_BreaksCURRENCY_ID: TBCDField
      FieldName = 'CURRENCY_ID'
      Size = 0
    end
    object TblArinvt_BreaksID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 0
    end
  end
  object SrcVendor: TDataSource
    DataSet = TblVendor
    Left = 180
    Top = 90
  end
  object TblVendor: TFDTable
    OnDeleteError = HandleError
    OnEditError = HandleError
    OnPostError = HandleError
    IndexFieldNames = 'ID'
    UpdateOptions.UpdateTableName = 'VENDOR'
    TableName = 'VENDOR'
    Left = 192
    Top = 102
  end
  object SrcBlendArinvt_Breaks: TDataSource
    DataSet = TblBlendArinvt_Breaks
    Left = 289
    Top = 90
  end
  object TblBlendArinvt_Breaks: TFDTable
    Tag = 1
    BeforeInsert = PostParentsBeforeEdit
    BeforeEdit = PostParentsBeforeEdit
    BeforePost = AssignIDBeforePost
    OnDeleteError = HandleError
    OnEditError = HandleError
    OnNewRecord = TblArinvt_BreaksNewRecord
    OnPostError = HandleError
    Filtered = True
    Filter = 'BUYING='#39'Y'#39
    OnFilterRecord = FilterNativeCurrency
    IndexFieldNames = 'ARINVT_ID;QUAN'
    MasterSource = SrcSndOp
    MasterFields = 'ARINVT_ID'
    UpdateOptions.UpdateTableName = 'ARINVT_BREAKS'
    TableName = 'ARINVT_BREAKS'
    Left = 301
    Top = 102
    object TblBlendArinvt_BreaksARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Required = True
      Size = 0
    end
    object TblBlendArinvt_BreaksQUAN: TBCDField
      FieldName = 'QUAN'
      Required = True
      Size = 2
    end
    object TblBlendArinvt_BreaksQPRICE: TFMTBCDField
      FieldName = 'QPRICE'
      Size = 6
    end
    object TblBlendArinvt_BreaksPRICE_DATE: TDateTimeField
      FieldName = 'PRICE_DATE'
    end
    object TblBlendArinvt_BreaksEFFECT_DATE: TDateTimeField
      FieldName = 'EFFECT_DATE'
    end
    object TblBlendArinvt_BreaksBUYING: TStringField
      FieldName = 'BUYING'
      Visible = False
      Size = 1
    end
    object TblBlendArinvt_BreaksID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Size = 0
    end
    object TblBlendArinvt_BreaksDEACTIVE_DATE: TDateTimeField
      FieldName = 'DEACTIVE_DATE'
    end
    object TblBlendArinvt_BreaksCURRENCY_ID: TBCDField
      FieldName = 'CURRENCY_ID'
      Size = 0
    end
  end
  object wwQryElements: TFDQuery
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, '
      '       elem_descrip,'
      '       elem_type'
      '  from elements'
      ' where Upper(RTrim(elem_type)) in ('#39'LABOR'#39', '#39'OVERHEAD'#39')')
    Left = 32
    Top = 224
    object wwQryElementsELEM_DESCRIP: TStringField
      DisplayLabel = 'Element'
      DisplayWidth = 30
      FieldName = 'ELEM_DESCRIP'
      Size = 30
    end
    object wwQryElementsELEM_TYPE: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 10
      FieldName = 'ELEM_TYPE'
      Size = 10
    end
    object wwQryElementsID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
  end
  object SrcSndop_PmEqmt: TDataSource
    DataSet = TblSndop_PmEqmt
    Left = 36
    Top = 287
  end
  object TblSndop_PmEqmt: TFDTable
    BeforeInsert = PostParentsBeforeEdit
    BeforeEdit = PostParentsBeforeEdit
    BeforePost = TblSndop_PmEqmtBeforePost
    AfterPost = TblSndop_PmEqmtAfterPost
    AfterDelete = TblSndop_PmEqmtAfterPost
    OnCalcFields = TblSndop_PmEqmtCalcFields
    OnNewRecord = TblSndop_PmEqmtNewRecord
    IndexFieldNames = 'SNDOP_ID'
    MasterSource = SrcSndOp
    MasterFields = 'ID'
    UpdateOptions.UpdateTableName = 'SNDOP_PMEQMT'
    TableName = 'SNDOP_PMEQMT'
    Left = 36
    Top = 302
    object TblSndop_PmEqmtEqno: TStringField
      DisplayLabel = 'Tool Eq #'
      DisplayWidth = 18
      FieldKind = fkCalculated
      FieldName = 'Eqno'
      Size = 25
      Calculated = True
    end
    object TblSndop_PmEqmtLocation: TStringField
      DisplayWidth = 28
      FieldKind = fkCalculated
      FieldName = 'Location'
      Size = 30
      Calculated = True
    end
    object TblSndop_PmEqmtIS_PRIMARY: TStringField
      DisplayLabel = 'Primary'
      DisplayWidth = 7
      FieldName = 'IS_PRIMARY'
      FixedChar = True
      Size = 1
    end
    object TblSndop_PmEqmtID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object TblSndop_PmEqmtSNDOP_ID: TBCDField
      FieldName = 'SNDOP_ID'
      Required = True
      Visible = False
      Size = 0
    end
    object TblSndop_PmEqmtPMEQMT_ID: TBCDField
      DisplayLabel = 'Tool Eq #'
      FieldName = 'PMEQMT_ID'
      Required = True
      Visible = False
      Size = 0
    end
  end
  object wwQryWork_Center: TFDQuery
    Filtered = True
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct '
      '       w.cntr_type, '
      '       w.mfg_type,'
      '       w.eplant_id,'
      '       w.mfgcell_id,'
      '       m.mfgcell'
      '  from work_center w,'
      '       mfgcell m'
      ' where misc.eplant_filter( w.eplant_id  ) = 1'
      '   and w.mfgcell_id = m.id(+)')
    Left = 143
    Top = 287
    object wwQryWork_CenterCNTR_TYPE: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 10
      FieldName = 'CNTR_TYPE'
      Origin = 'WORK_CENTER.CNTR_TYPE'
    end
    object wwQryWork_CenterMFG_TYPE: TStringField
      DisplayLabel = 'Mfg Type'
      DisplayWidth = 10
      FieldName = 'MFG_TYPE'
      Origin = 'WORK_CENTER.MFG_TYPE'
      Size = 10
    end
    object wwQryWork_CenterEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'WORK_CENTER.EPLANT_ID'
      Size = 0
    end
    object wwQryWork_CenterMFGCELL: TStringField
      DisplayLabel = 'MfgCell'
      DisplayWidth = 15
      FieldName = 'MFGCELL'
      FixedChar = True
      Size = 15
    end
    object wwQryWork_CenterMFGCELL_ID: TBCDField
      DisplayLabel = 'MfgCell ID'
      DisplayWidth = 10
      FieldName = 'MFGCELL_ID'
      Origin = 'IQ.WORK_CENTER.MFGCELL_ID'
      Visible = False
      Size = 0
    end
  end
  object QryHr_Job_Descrip: TFDQuery
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       descrip'
      '  from hr_job_descrip'
      ' ')
    Left = 146
    Top = 221
    object QryHr_Job_DescripDESCRIP: TStringField
      DisplayLabel = 'Job Description'
      DisplayWidth = 50
      FieldName = 'DESCRIP'
      Origin = 'IQ.HR_JOB_DESCRIP.DESCRIP'
      Size = 250
    end
    object QryHr_Job_DescripID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.HR_JOB_DESCRIP.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
  end
  object SrcSndop_WC: TDataSource
    DataSet = TblSndop_WorkCenter
    Left = 253
    Top = 219
  end
  object TblSndop_WorkCenter: TFDTable
    BeforeInsert = PostParentsBeforeEdit
    BeforeEdit = PostParentsBeforeEdit
    BeforePost = AssignIDBeforePost
    OnCalcFields = TblSndop_WorkCenterCalcFields
    OnNewRecord = TblSndop_WorkCenterNewRecord
    IndexFieldNames = 'SNDOP_ID;SEQ'
    MasterSource = SrcSndOp
    MasterFields = 'ID'
    UpdateOptions.UpdateTableName = 'SNDOP_WORKCENTER'
    TableName = 'SNDOP_WORKCENTER'
    Left = 261
    Top = 238
    object TblSndop_WorkCenterSEQ: TBCDField
      DisplayLabel = '#'
      DisplayWidth = 4
      FieldName = 'SEQ'
      Size = 0
    end
    object TblSndop_WorkCenterEqNo: TStringField
      DisplayLabel = 'Work Center #'
      DisplayWidth = 17
      FieldKind = fkCalculated
      FieldName = 'EqNo'
      Size = 60
      Calculated = True
    end
    object TblSndop_WorkCenterCntr_desc: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'Cntr_Desc'
      Size = 50
      Calculated = True
    end
    object TblSndop_WorkCenterCntr_Type: TStringField
      DisplayLabel = 'Center Type'
      DisplayWidth = 14
      FieldKind = fkCalculated
      FieldName = 'Cntr_Type'
      ReadOnly = True
      Calculated = True
    end
    object TblSndop_WorkCenterWORKCENTER_ID: TBCDField
      DisplayWidth = 15
      FieldName = 'WORKCENTER_ID'
      Required = True
      Visible = False
      Size = 0
    end
    object TblSndop_WorkCenterSNDOP_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SNDOP_ID'
      Required = True
      Visible = False
      Size = 0
    end
    object TblSndop_WorkCenterID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
  end
  object SrcSndop_Insp: TDataSource
    DataSet = TblSndop_Insp
    Left = 383
    Top = 296
  end
  object TblSndop_Insp: TFDTable
    BeforeInsert = PostParentsBeforeEdit
    BeforeEdit = PostParentsBeforeEdit
    BeforePost = AssignIDBeforePost
    OnCalcFields = TblSndop_InspCalcFields
    OnNewRecord = TblSndop_InspNewRecord
    IndexFieldNames = 'SNDOP_ID;SEQ'
    MasterSource = SrcSndOp
    MasterFields = 'ID'
    UpdateOptions.UpdateTableName = 'SNDOP_INSPECTION'
    TableName = 'SNDOP_INSPECTION'
    Left = 394
    Top = 309
    object TblSndop_InspSEQ: TBCDField
      DisplayLabel = '#'
      DisplayWidth = 5
      FieldName = 'SEQ'
      Size = 0
    end
    object TblSndop_InspName: TStringField
      DisplayLabel = 'Inspection'
      DisplayWidth = 19
      FieldKind = fkCalculated
      FieldName = 'Name'
      Size = 35
      Calculated = True
    end
    object TblSndop_InspDescrip: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 36
      FieldKind = fkCalculated
      FieldName = 'Descrip'
      Size = 250
      Calculated = True
    end
    object TblSndop_InspPRE_INSPECT: TStringField
      DisplayLabel = 'Pre-Inspection '
      DisplayWidth = 11
      FieldName = 'PRE_INSPECT'
      FixedChar = True
      Size = 1
    end
    object TblSndop_InspPOST_INSPECT: TStringField
      DisplayLabel = 'Post-Inspection '
      DisplayWidth = 12
      FieldName = 'POST_INSPECT'
      FixedChar = True
      Size = 1
    end
    object TblSndop_InspID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object TblSndop_InspSNDOP_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SNDOP_ID'
      Required = True
      Visible = False
      Size = 0
    end
    object TblSndop_InspSPC_INSPECTION_ID: TBCDField
      DisplayLabel = 'Inspection'
      DisplayWidth = 10
      FieldName = 'SPC_INSPECTION_ID'
      Required = True
      Visible = False
      Size = 0
    end
  end
  object SrcSndopJobs: TDataSource
    DataSet = TblSndopJobs
    Left = 292
    Top = 294
  end
  object TblSndopJobs: TFDTable
    BeforeInsert = PostParentsBeforeEdit
    BeforeEdit = PostParentsBeforeEdit
    BeforePost = AssignIDBeforePost
    OnCalcFields = TblSndopJobsCalcFields
    IndexFieldNames = 'SNDOP_ID'
    MasterSource = SrcSndOp
    MasterFields = 'ID'
    UpdateOptions.UpdateTableName = 'SNDOP_JOB_DESCRIP'
    TableName = 'SNDOP_JOB_DESCRIP'
    Left = 306
    Top = 309
    object TblSndopJobsJobDescrip: TStringField
      DisplayLabel = 'Job Description'
      DisplayWidth = 42
      FieldKind = fkCalculated
      FieldName = 'JobDescrip'
      Size = 50
      Calculated = True
    end
    object TblSndopJobsCERT_LEVEL: TBCDField
      DisplayLabel = 'Certification Level'
      DisplayWidth = 16
      FieldName = 'CERT_LEVEL'
      Size = 0
    end
    object TblSndopJobsSUPERVISOR_RIGHTS: TStringField
      DisplayLabel = 'Supervisor Rights'
      DisplayWidth = 15
      FieldName = 'SUPERVISOR_RIGHTS'
      FixedChar = True
      Size = 1
    end
    object TblSndopJobsID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object TblSndopJobsSNDOP_ID: TBCDField
      DisplayLabel = 'Process ID'
      DisplayWidth = 10
      FieldName = 'SNDOP_ID'
      Required = True
      Visible = False
      Size = 0
    end
    object TblSndopJobsHR_JOB_DESCRIP_ID: TBCDField
      DisplayLabel = 'Job Description ID'
      DisplayWidth = 10
      FieldName = 'HR_JOB_DESCRIP_ID'
      Required = True
      Visible = False
      Size = 0
    end
  end
  object SrcSndop_RejectCode: TDataSource
    DataSet = TblSndop_RejectCode
    Left = 255
    Top = 424
  end
  object TblSndop_RejectCode: TFDTable
    BeforeInsert = PostParentsBeforeEdit
    BeforeEdit = PostParentsBeforeEdit
    BeforePost = AssignIDBeforePost
    OnCalcFields = TblSndop_RejectCodeCalcFields
    IndexFieldNames = 'SNDOP_ID'
    MasterSource = SrcSndOp
    MasterFields = 'ID'
    UpdateOptions.UpdateTableName = 'SNDOP_REJECT_CODE'
    TableName = 'SNDOP_REJECT_CODE'
    Left = 254
    Top = 439
    object TblSndop_RejectCodeReject_Code_Disp: TStringField
      DisplayLabel = 'Reject Code'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Reject_Code_Disp'
      Calculated = True
    end
    object TblSndop_RejectCodeReject_Desc_Disp: TStringField
      DisplayLabel = 'Reject Description'
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'Reject_Desc_Disp'
      Size = 30
      Calculated = True
    end
    object TblSndop_RejectCodeID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object TblSndop_RejectCodeSNDOP_ID: TBCDField
      FieldName = 'SNDOP_ID'
      Visible = False
      Size = 0
    end
    object TblSndop_RejectCodeREJECT_CODE_ID: TBCDField
      FieldName = 'REJECT_CODE_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcSndop_Aux: TDataSource
    DataSet = TblSndop_Aux
    Left = 249
    Top = 506
  end
  object TblSndop_Aux: TFDTable
    BeforeInsert = PostParentsBeforeEdit
    BeforeEdit = PostParentsBeforeEdit
    BeforePost = AssignIDBeforePost
    OnCalcFields = TblSndop_AuxCalcFields
    IndexFieldNames = 'SNDOP_ID'
    MasterSource = SrcSndOp
    MasterFields = 'ID'
    UpdateOptions.UpdateTableName = 'SNDOP_AUX'
    TableName = 'SNDOP_AUX'
    Left = 260
    Top = 521
    object TblSndop_AuxDescrip: TStringField
      DisplayLabel = 'Auxiliary Equipment Description'
      DisplayWidth = 50
      FieldKind = fkCalculated
      FieldName = 'Descrip'
      Size = 50
      Calculated = True
    end
    object TblSndop_AuxID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Size = 0
    end
    object TblSndop_AuxSNDOP_ID: TBCDField
      FieldName = 'SNDOP_ID'
      Visible = False
      Size = 0
    end
    object TblSndop_AuxAUX_ID: TBCDField
      FieldName = 'AUX_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcSndop_PR_Emp: TDataSource
    DataSet = TblSndop_PR_Emp
    Left = 41
    Top = 438
  end
  object TblSndop_PR_Emp: TFDTable
    BeforeInsert = PostParentsBeforeEdit
    BeforeEdit = PostParentsBeforeEdit
    BeforePost = AssignIDBeforePost
    OnCalcFields = TblSndop_PR_EmpCalcFields
    Filtered = True
    OnFilterRecord = TblSndop_PR_EmpFilterRecord
    IndexFieldNames = 'SNDOP_ID'
    MasterSource = SrcSndOp
    MasterFields = 'ID'
    UpdateOptions.UpdateTableName = 'SNDOP_PR_EMP'
    TableName = 'SNDOP_PR_EMP'
    Left = 42
    Top = 459
    object TblSndop_PR_EmpEmpNo: TStringField
      DisplayLabel = 'Employee #'
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'EmpNo'
      Size = 25
      Calculated = True
    end
    object TblSndop_PR_EmpFirstName: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'FirstName'
      ReadOnly = True
      Size = 30
      Calculated = True
    end
    object TblSndop_PR_EmpLastName: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'LastName'
      ReadOnly = True
      Size = 30
      Calculated = True
    end
    object TblSndop_PR_EmpIS_ACTIVE: TStringField
      DisplayLabel = 'Active'
      DisplayWidth = 1
      FieldName = 'IS_ACTIVE'
      Size = 1
    end
    object TblSndop_PR_EmpID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Size = 0
    end
    object TblSndop_PR_EmpSNDOP_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SNDOP_ID'
      Visible = False
      Size = 0
    end
    object TblSndop_PR_EmpPR_EMP_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PR_EMP_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcSndopEmpDocs: TDataSource
    DataSet = QrySndopEmpDocs
    Left = 46
    Top = 515
  end
  object QrySndopEmpDocs: TFDQuery
    BeforeInsert = QrySndopEmpDocsBeforeInsert
    AfterPost = CommitUpdate
    BeforeDelete = QrySndopEmpDocsBeforeDelete
    AfterDelete = CommitUpdate
    OnCalcFields = QrySndopEmpDocsCalcFields
    MasterSource = SrcSndop_PR_Emp
    MasterFields = 'SNDOP_ID;ID'
    OnUpdateRecord = QrySndopEmpDocsUpdateRecord
    SQL.Strings = (
      'select a.current_doc_revision_id,'
      '       a.doc_descrip,'
      '       a.current_revision,'
      '       b.id,'
      '       b.assigned_doc_revision_id,'
      '       b.assigned_revision,'
      '       b.certified_date,'
      '       a.cert_training_id,'
      '       a.cert_training_descrip'
      '  from'
      '    ( select v.doc_revision_id as current_doc_revision_id,'
      '             v.doc_descrip,'
      '             v.revision as current_revision,'
      '             v.external_doc_id,'
      '             v.cert_training_id,'
      '             v.cert_training_descrip'
      '        from '
      '             v_external_docs v'
      '       where v.source = '#39'SNDOP'#39
      '         and v.source_id = :sndop_id ) a,'
      ''
      '    ( select d.id,'
      '             r.id as assigned_doc_revision_id,'
      '             r.revision as assigned_revision,'
      '             r.external_doc_id,'
      '             d.certified_date'
      '        from '
      '             sndop_pr_emp e,'
      '             sndop_pr_emp_doc d,'
      '             doc_revision r'
      '       where '
      '             e.id = :id'
      '         and e.id = d.sndop_pr_emp_id'
      '         and d.doc_revision_id = r.id(+)) b'
      ' where '
      '        a.external_doc_id = b.external_doc_id(+)'
      ''
      '')
    Left = 43
    Top = 533
    ParamData = <
      item
        Name = 'SNDOP_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QrySndopEmpDocsDOC_DESCRIP: TStringField
      DisplayLabel = 'Document Description'
      DisplayWidth = 38
      FieldName = 'DOC_DESCRIP'
      Size = 250
    end
    object QrySndopEmpDocsCURRENT_REVISION: TStringField
      DisplayLabel = 'Document~Revision'
      DisplayWidth = 10
      FieldName = 'CURRENT_REVISION'
    end
    object QrySndopEmpDocsASSIGNED_REVISION: TStringField
      DisplayLabel = 'Last Certified~Revision'
      DisplayWidth = 12
      FieldName = 'ASSIGNED_REVISION'
    end
    object QrySndopEmpDocsStatus: TStringField
      DisplayWidth = 29
      FieldKind = fkCalculated
      FieldName = 'Status'
      Size = 50
      Calculated = True
    end
    object QrySndopEmpDocsCERTIFIED_DATE: TDateTimeField
      DisplayLabel = 'Certified Date'
      DisplayWidth = 18
      FieldName = 'CERTIFIED_DATE'
    end
    object QrySndopEmpDocsCERT_TRAINING_DESCRIP: TStringField
      DisplayLabel = 'Certification Test'
      DisplayWidth = 50
      FieldName = 'CERT_TRAINING_DESCRIP'
      Size = 50
    end
    object QrySndopEmpDocsCURRENT_DOC_REVISION_ID: TBCDField
      FieldName = 'CURRENT_DOC_REVISION_ID'
      Visible = False
      Size = 0
    end
    object QrySndopEmpDocsASSIGNED_DOC_REVISION_ID: TBCDField
      FieldName = 'ASSIGNED_DOC_REVISION_ID'
      Visible = False
      Size = 0
    end
    object QrySndopEmpDocsID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QrySndopEmpDocsCERT_TRAINING_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'CERT_TRAINING_ID'
      Visible = False
      Size = 0
    end
  end
  object TblSndop: TFDQuery
    BeforeOpen = TblSndopBeforeOpen
    BeforeEdit = TblSndOpBeforeEdit
    AfterPost = TblSndOpAfterPost
    BeforeScroll = TblSndOpBeforeScroll
    AfterScroll = TblSndOpAfterScroll
    OnCalcFields = TblSndOpCalcFields
    OnDeleteError = HandleError
    OnEditError = HandleError
    OnPostError = HandleError
    OnFilterRecord = TblSndOpFilterRecord
    UpdateOptions.UpdateTableName = 'SNDOP'
    SQL.Strings = (
      'select op_class,'
      '       opno,'
      '       opdesc,'
      '       cuser1,'
      '       cuser2,'
      '       cuser3,'
      '       cuser4,'
      '       cuser5,'
      '       cuser6,'
      '       cuser7,'
      '       cuser8,'
      '       cuser9,'
      '       cuser10,'
      '       nuser1,'
      '       nuser2,'
      '       nuser3,'
      '       nuser4,'
      '       nuser5,'
      '       nuser6,'
      '       nuser7,'
      '       nuser8,'
      '       nuser9,'
      '       nuser10,'
      '       is_supermarket,'
      '       cntr_type,'
      '       multiples,'
      '       scrap,'
      '       uom,'
      '       cycletm_disp,'
      '       scrap_disp,'
      '       id,'
      '       vendor_id,'
      '       ven_lead,'
      '       cycletm,'
      '       operator,'
      '       setuphrs,'
      '       pricedate,'
      '       labor_rates_id,'
      '       cntr_rate,'
      '       setup_rate,'
      '       arinvt_id,'
      '       atpress,'
      '       elements_id,'
      '       use_let_down_ratio,'
      '       eplant_id,'
      '       elements_id_lbr,'
      '       elements_id_oh,'
      '       std_cost_lbr,'
      '       std_cost_oh,'
      '       setuphrs2,'
      '       fab_allow_all_wc,'
      '       clear_line_required,'
      '       assy1_seq_processing,'
      '       note1,'
      '       emp_certification_not_required,'
      '       pk_hide,'
      '       assy1_rework,'
      '       assy1_oh_rate,'
      '       batch_type,'
      '       move_time,'
      '       move_size,'
      '       exclude_sched,'
      '       fixed_elements_id_oh,'
      '       fixed_assy1_oh_rate,'
      '       fixed_std_cost_oh,'
      '       excl_task_clock_rep,'
      '       use_multiplier'
      '  from sndop       '
      ' where op_class = :op_class'
      ''
      '-- HPICK_PROPAGATE_SORT_START'
      '-- do not remove these comments'
      ' order by opno'
      '-- HPICK_PROPAGATE_SORT_END'
      ''
      ' ')
    Left = 24
    Top = 28
    ParamData = <
      item
        Name = 'OP_CLASS'
        DataType = ftString
        ParamType = ptInput
      end>
    object TblSndopOP_CLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 6
      FieldName = 'OP_CLASS'
      Size = 2
    end
    object TblSndopOPNO: TStringField
      DisplayLabel = 'Oper #'
      DisplayWidth = 18
      FieldName = 'OPNO'
      Required = True
      OnValidate = TblSndOp2OPNOValidate
      Size = 15
    end
    object TblSndopOPDESC: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 37
      FieldName = 'OPDESC'
      Size = 60
    end
    object TblSndopCUSER1: TStringField
      DisplayWidth = 60
      FieldName = 'CUSER1'
      Size = 60
    end
    object TblSndopCUSER2: TStringField
      DisplayWidth = 60
      FieldName = 'CUSER2'
      Size = 60
    end
    object TblSndopCUSER3: TStringField
      DisplayWidth = 60
      FieldName = 'CUSER3'
      Size = 60
    end
    object TblSndopCUSER4: TStringField
      DisplayWidth = 60
      FieldName = 'CUSER4'
      Size = 60
    end
    object TblSndopCUSER5: TStringField
      DisplayWidth = 60
      FieldName = 'CUSER5'
      Size = 60
    end
    object TblSndopCUSER6: TStringField
      DisplayWidth = 60
      FieldName = 'CUSER6'
      Size = 60
    end
    object TblSndopCUSER7: TStringField
      DisplayWidth = 60
      FieldName = 'CUSER7'
      Size = 60
    end
    object TblSndopCUSER8: TStringField
      DisplayWidth = 60
      FieldName = 'CUSER8'
      Size = 60
    end
    object TblSndopCUSER9: TStringField
      DisplayWidth = 60
      FieldName = 'CUSER9'
      Size = 60
    end
    object TblSndopCUSER10: TStringField
      DisplayWidth = 60
      FieldName = 'CUSER10'
      Size = 60
    end
    object TblSndopNUSER1: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'NUSER1'
    end
    object TblSndopNUSER2: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'NUSER2'
    end
    object TblSndopNUSER3: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'NUSER3'
    end
    object TblSndopNUSER4: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'NUSER4'
    end
    object TblSndopNUSER5: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'NUSER5'
    end
    object TblSndopNUSER6: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'NUSER6'
    end
    object TblSndopNUSER7: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'NUSER7'
    end
    object TblSndopNUSER8: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'NUSER8'
    end
    object TblSndopNUSER9: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'NUSER9'
    end
    object TblSndopNUSER10: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'NUSER10'
    end
    object TblSndopIS_SUPERMARKET: TStringField
      DisplayLabel = 'Supermarket'
      DisplayWidth = 1
      FieldName = 'IS_SUPERMARKET'
      Size = 1
    end
    object TblSndopCNTR_TYPE: TStringField
      DisplayLabel = 'Center Type'
      DisplayWidth = 20
      FieldName = 'CNTR_TYPE'
      Visible = False
    end
    object TblSndopMULTIPLES: TBCDField
      DisplayLabel = 'Multiples Of'
      DisplayWidth = 10
      FieldName = 'MULTIPLES'
      Visible = False
      Size = 0
    end
    object TblSndopSCRAP: TBCDField
      DisplayLabel = 'Yield %'
      DisplayWidth = 10
      FieldName = 'SCRAP'
      Visible = False
    end
    object TblSndopEPlantID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'EPlantID'
      LookupResultField = 'EPLANT_ID'
      Visible = False
      Calculated = True
    end
    object TblSndopUOM: TStringField
      DisplayWidth = 10
      FieldName = 'UOM'
      Visible = False
      Size = 10
    end
    object TblSndopCYCLETM_DISP: TBCDField
      DisplayLabel = 'Cycle Time'
      DisplayWidth = 10
      FieldName = 'CYCLETM_DISP'
      Visible = False
    end
    object TblSndopSCRAP_DISP: TBCDField
      DisplayLabel = 'Yield %'
      DisplayWidth = 10
      FieldName = 'SCRAP_DISP'
      Visible = False
      MaxValue = 999.999900000000000000
    end
    object TblSndopID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object TblSndopVENDOR_ID: TBCDField
      DisplayLabel = 'Vendor'
      DisplayWidth = 10
      FieldName = 'VENDOR_ID'
      Visible = False
      Size = 0
    end
    object TblSndopVEN_LEAD: TBCDField
      DisplayWidth = 10
      FieldName = 'VEN_LEAD'
      Visible = False
      Size = 0
    end
    object TblSndopCYCLETM: TBCDField
      DisplayWidth = 10
      FieldName = 'CYCLETM'
      Visible = False
    end
    object TblSndopOPERATOR: TBCDField
      DisplayWidth = 10
      FieldName = 'OPERATOR'
      Visible = False
      OnChange = MarkCostMemberNeedsRecalc
      Size = 2
    end
    object TblSndopSETUPHRS: TBCDField
      DisplayLabel = 'Setup Hrs'
      DisplayWidth = 10
      FieldName = 'SETUPHRS'
      Visible = False
      Size = 2
    end
    object TblSndopPRICEDATE: TDateTimeField
      DisplayWidth = 18
      FieldName = 'PRICEDATE'
      Visible = False
    end
    object TblSndopLABOR_RATES_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'LABOR_RATES_ID'
      Visible = False
      Size = 0
    end
    object TblSndopLabor_Rate: TFMTBCDField
      DisplayLabel = 'Labor Rate'
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'Labor_Rate'
      LookupDataSet = TblLabor_Rates
      LookupKeyFields = 'ID'
      LookupResultField = 'LABOR_RATE'
      KeyFields = 'LABOR_RATES_ID'
      Visible = False
      Lookup = True
    end
    object TblSndopCNTR_RATE: TBCDField
      DisplayLabel = 'Center Rate'
      DisplayWidth = 10
      FieldName = 'CNTR_RATE'
      Visible = False
      Size = 2
    end
    object TblSndopSETUP_RATE: TBCDField
      DisplayLabel = 'Setup Rate'
      DisplayWidth = 10
      FieldName = 'SETUP_RATE'
      Visible = False
      Size = 2
    end
    object TblSndopVendorName: TStringField
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'VendorName'
      LookupDataSet = TblVendor
      LookupKeyFields = 'ID'
      LookupResultField = 'COMPANY'
      KeyFields = 'VENDOR_ID'
      Visible = False
      Lookup = True
    end
    object TblSndopARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object TblSndopItemNo: TStringField
      DisplayLabel = 'Item#'
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'ItemNo'
      LookupResultField = 'ITEMNO'
      Visible = False
      Size = 25
      Calculated = True
    end
    object TblSndopDescrip: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 100
      FieldKind = fkCalculated
      FieldName = 'Descrip'
      LookupResultField = 'DESCRIP'
      Visible = False
      Size = 100
      Calculated = True
    end
    object TblSndopRev: TStringField
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'Rev'
      LookupResultField = 'REV'
      Visible = False
      Size = 15
      Calculated = True
    end
    object TblSndopUnit: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Unit'
      LookupResultField = 'UNIT'
      Visible = False
      Calculated = True
    end
    object TblSndopATPRESS: TStringField
      DisplayWidth = 1
      FieldName = 'ATPRESS'
      Visible = False
      Size = 1
    end
    object TblSndopCalc_Cost: TFMTBCDField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Calc_Cost'
      Visible = False
      DisplayFormat = '#########.######'
      Calculated = True
    end
    object TblSndopELEMENTS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ELEMENTS_ID'
      Visible = False
      OnChange = MarkCostMemberNeedsRecalc
      Size = 0
    end
    object TblSndopUSE_LET_DOWN_RATIO: TStringField
      DisplayWidth = 1
      FieldName = 'USE_LET_DOWN_RATIO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object TblSndopEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
    object TblSndopELEMENTS_ID_LBR: TBCDField
      FieldName = 'ELEMENTS_ID_LBR'
      Visible = False
      OnChange = MarkCostMemberNeedsRecalc
      Size = 0
    end
    object TblSndopELEMENTS_ID_OH: TBCDField
      FieldName = 'ELEMENTS_ID_OH'
      Visible = False
      OnChange = MarkCostMemberNeedsRecalc
      Size = 0
    end
    object TblSndopSTD_COST_LBR: TFMTBCDField
      DisplayLabel = 'Std Labor'
      FieldName = 'STD_COST_LBR'
      Visible = False
    end
    object TblSndopSTD_COST_OH: TFMTBCDField
      DisplayLabel = 'Std Overhead'
      FieldName = 'STD_COST_OH'
      Visible = False
    end
    object TblSndopSETUPHRS2: TBCDField
      DisplayLabel = 'Take Down Hrs'
      FieldName = 'SETUPHRS2'
      Visible = False
      Size = 2
    end
    object TblSndopFAB_ALLOW_ALL_WC: TStringField
      FieldName = 'FAB_ALLOW_ALL_WC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object TblSndopCLEAR_LINE_REQUIRED: TStringField
      FieldName = 'CLEAR_LINE_REQUIRED'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object TblSndopASSY1_SEQ_PROCESSING: TStringField
      DisplayLabel = 'Sequential Processing'
      FieldName = 'ASSY1_SEQ_PROCESSING'
      Visible = False
      Size = 1
    end
    object TblSndopNOTE1: TStringField
      FieldName = 'NOTE1'
      Visible = False
      Size = 2000
    end
    object TblSndopEMP_CERTIFICATION_NOT_REQUIRED: TStringField
      DisplayLabel = 'Employee Certification Not Required'
      FieldName = 'EMP_CERTIFICATION_NOT_REQUIRED'
      Visible = False
      Size = 1
    end
    object TblSndopPK_HIDE: TStringField
      DisplayLabel = 'Inactive'
      FieldName = 'PK_HIDE'
      Visible = False
      Size = 1
    end
    object TblSndopASSY1_REWORK: TStringField
      DisplayLabel = 'Rework'
      FieldName = 'ASSY1_REWORK'
      Visible = False
      Size = 1
    end
    object TblSndopASSY1_OH_RATE: TFMTBCDField
      FieldName = 'ASSY1_OH_RATE'
      Visible = False
      OnChange = MarkCostMemberNeedsRecalc
    end
    object TblSndopSndOp_ID: TBCDField
      FieldKind = fkCalculated
      FieldName = 'SndOp_ID'
      Visible = False
      Size = 0
      Calculated = True
    end
    object TblSndopBATCH_TYPE: TStringField
      DisplayLabel = 'Batch'
      FieldName = 'BATCH_TYPE'
      Visible = False
      Size = 1
    end
    object TblSndopExtDescrip: TStringField
      FieldKind = fkCalculated
      FieldName = 'ExtDescrip'
      LookupResultField = 'DESCRIP2'
      Visible = False
      Size = 100
      Calculated = True
    end
    object TblSndopMOVE_TIME: TFMTBCDField
      FieldName = 'MOVE_TIME'
      Visible = False
    end
    object TblSndopMOVE_SIZE: TFMTBCDField
      FieldName = 'MOVE_SIZE'
      Visible = False
    end
    object TblSndopEXCLUDE_SCHED: TStringField
      FieldName = 'EXCLUDE_SCHED'
      Visible = False
      Size = 1
    end
    object TblSndopSetupLaborCost: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'SetupLaborCost'
      Visible = False
      Calculated = True
    end
    object TblSndopFIXED_ELEMENTS_ID_OH: TBCDField
      FieldName = 'FIXED_ELEMENTS_ID_OH'
      Visible = False
      OnChange = MarkCostMemberNeedsRecalc
      Size = 0
    end
    object TblSndopFIXED_ASSY1_OH_RATE: TFMTBCDField
      FieldName = 'FIXED_ASSY1_OH_RATE'
      Visible = False
      OnChange = MarkCostMemberNeedsRecalc
    end
    object TblSndopFIXED_STD_COST_OH: TFMTBCDField
      FieldName = 'FIXED_STD_COST_OH'
      Visible = False
    end
    object TblSndopSPG: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'SPG'
      Visible = False
      DisplayFormat = '###,###,##0.######'
      Calculated = True
    end
    object TblSndopEXCL_TASK_CLOCK_REP: TStringField
      FieldName = 'EXCL_TASK_CLOCK_REP'
      Visible = False
      Size = 1
    end
    object TblSndopUSE_MULTIPLIER: TStringField
      FieldName = 'USE_MULTIPLIER'
      Visible = False
      Size = 1
    end
    object TblSndopUseMultiplesDisp: TStringField
      FieldKind = fkCalculated
      FieldName = 'UseMultiplesDisp'
      Visible = False
      Calculated = True
    end
  end
end
