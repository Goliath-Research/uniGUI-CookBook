object BOM_DM: TBOM_DM
  OldCreateOrder = True
  OnCreate = BOM_DMCreate
  OnDestroy = DataModuleDestroy
  Height = 809
  Width = 779
  object TblPmEqmt: TFDTable
    OnDeleteError = HandleError
    OnEditError = HandleError
    OnPostError = HandleError
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'IQMS.PMEQMT'
    TableName = 'IQMS.PMEQMT'
    Left = 38
    Top = 163
  end
  object SrcPmEqmt: TDataSource
    DataSet = TblPmEqmt
    Left = 24
    Top = 143
  end
  object SrcPartNo: TDataSource
    DataSet = TblPartNo
    Left = 28
    Top = 11
  end
  object TblPartNo: TFDTable
    BeforeInsert = PostParentsBeforeEdit
    BeforeEdit = PostParentsBeforeEdit
    BeforePost = AssignIDBeforePost
    OnCalcFields = TblPartNoCalcFields
    OnDeleteError = HandleError
    OnEditError = HandleError
    OnNewRecord = TblPartNoNewRecord
    OnPostError = HandleError
    IndexFieldNames = 'STANDARD_ID;ARINVT_ID'
    MasterSource = SrcStandard
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'IQMS.PARTNO'
    TableName = 'IQMS.PARTNO'
    Left = 35
    Top = 14
    object TblPartNoID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object TblPartNoSTANDARD_ID: TBCDField
      FieldName = 'STANDARD_ID'
      Required = True
      Size = 0
    end
    object TblPartNoARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Required = True
      Size = 0
    end
    object TblPartNoSTDCAV: TFMTBCDField
      FieldName = 'STDCAV'
      Required = True
      Size = 6
    end
    object TblPartNoACTCAV: TFMTBCDField
      FieldName = 'ACTCAV'
      Required = True
      Size = 6
    end
    object TblPartNoPTWT: TFMTBCDField
      FieldName = 'PTWT'
      Size = 6
    end
    object TblPartNoBOXNO: TBCDField
      FieldName = 'BOXNO'
      Size = 0
    end
    object TblPartNoCLASS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CLASS'
      Size = 2
      Calculated = True
    end
    object TblPartNoITEMNO: TStringField
      FieldKind = fkCalculated
      FieldName = 'ITEMNO'
      Size = 50
      Calculated = True
    end
    object TblPartNoDESCRIP: TStringField
      DisplayWidth = 35
      FieldKind = fkCalculated
      FieldName = 'DESCRIP'
      Size = 100
      Calculated = True
    end
    object TblPartNoREV: TStringField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'REV'
      Size = 15
      Calculated = True
    end
    object TblPartNoPTWT_DISP: TFMTBCDField
      FieldName = 'PTWT_DISP'
      DisplayFormat = '######0.########'
      EditFormat = '######0.########'
    end
    object TblPartNoEcno: TStringField
      FieldKind = fkCalculated
      FieldName = 'Ecno'
      Size = 25
      Calculated = True
    end
    object TblPartNoDrawing: TStringField
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'Drawing'
      Size = 30
      Calculated = True
    end
    object TblPartNoUnit: TStringField
      FieldKind = fkCalculated
      FieldName = 'Unit'
      Size = 10
      Calculated = True
    end
    object TblPartNodescrip2: TStringField
      FieldKind = fkCalculated
      FieldName = 'descrip2'
      Size = 100
      Calculated = True
    end
    object TblPartNoArinvt_EPlant_ID: TBCDField
      FieldKind = fkCalculated
      FieldName = 'Arinvt_EPlant_ID'
      Calculated = True
    end
    object TblPartNoNUSER1: TFMTBCDField
      FieldName = 'NUSER1'
      Size = 6
    end
    object TblPartNoROUTING_NOTE: TStringField
      FieldName = 'ROUTING_NOTE'
      Size = 2000
    end
    object TblPartNoIsFabStart: TStringField
      FieldKind = fkCalculated
      FieldName = 'IsFabStart'
      Size = 1
      Calculated = True
    end
    object TblPartNoPlannerCode: TStringField
      FieldKind = fkCalculated
      FieldName = 'PlannerCode'
      Size = 10
      Calculated = True
    end
    object TblPartNoPlanner_Code_ID: TBCDField
      FieldKind = fkCalculated
      FieldName = 'Planner_Code_ID'
      Calculated = True
    end
    object TblPartNoIs_By_Product: TStringField
      FieldKind = fkCalculated
      FieldName = 'Is_By_Product'
      Calculated = True
    end
    object TblPartNoSkeleton_Weight_Disp: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Skeleton_Weight_Disp'
      DisplayFormat = '########0.########'
      Calculated = True
    end
    object TblPartNoPTWT_THERMO_DISP: TFMTBCDField
      FieldName = 'PTWT_THERMO_DISP'
      DisplayFormat = '######0.########'
      Size = 6
    end
    object TblPartNoDefaultMfgNo: TStringField
      FieldKind = fkCalculated
      FieldName = 'DefaultMfgNo'
      Size = 50
      Calculated = True
    end
    object TblPartNoSPACE_TRIM_LENGTH: TFMTBCDField
      FieldName = 'SPACE_TRIM_LENGTH'
      Visible = False
      Size = 6
    end
    object TblPartNoSPACE_TRIM_WIDTH: TFMTBCDField
      FieldName = 'SPACE_TRIM_WIDTH'
      Visible = False
      Size = 6
    end
    object TblPartNoSPACE_EDGE_LENGTH: TFMTBCDField
      FieldName = 'SPACE_EDGE_LENGTH'
      Visible = False
      Size = 6
    end
    object TblPartNoSPACE_EDGE_WIDTH: TFMTBCDField
      FieldName = 'SPACE_EDGE_WIDTH'
      Visible = False
      Size = 6
    end
    object TblPartNoPT_VOL: TFMTBCDField
      FieldName = 'PT_VOL'
      Visible = False
      Size = 6
    end
    object TblPartNoPhantom: TStringField
      FieldKind = fkCalculated
      FieldName = 'Phantom'
      Calculated = True
    end
  end
  object SrcPtOper: TDataSource
    DataSet = TblPtOper
    Left = 28
    Top = 67
  end
  object SrcSndOp: TDataSource
    DataSet = TblSndOp
    OnDataChange = SrcSndOpDataChange
    Left = 220
    Top = 67
  end
  object SrcOpMat: TDataSource
    DataSet = TblOpMat
    OnDataChange = SrcOpMatDataChange
    Left = 307
    Top = 67
  end
  object TblPtOper: TFDTable
    BeforeInsert = PostParentsBeforeEdit
    AfterInsert = TblPtOperAfterInsert
    BeforeEdit = PostParentsBeforeEdit
    BeforePost = TblPtOperBeforePost
    OnCalcFields = TblPtOperCalcFields
    OnDeleteError = HandleError
    OnEditError = HandleError
    OnPostError = HandleError
    IndexFieldNames = 'PARTNO_ID;OPSEQ'
    MasterSource = SrcPartNo
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'IQMS.PTOPER'
    TableName = 'IQMS.PTOPER'
    Left = 36
    Top = 83
    object TblPtOperPARTNO_ID: TBCDField
      FieldName = 'PARTNO_ID'
      Required = True
      Size = 0
    end
    object TblPtOperSNDOP_ID: TBCDField
      FieldName = 'SNDOP_ID'
      Required = True
      Size = 0
    end
    object TblPtOperOPSEQ: TBCDField
      FieldName = 'OPSEQ'
      Required = True
      Size = 0
    end
    object TblPtOperCYCLETM: TFMTBCDField
      FieldName = 'CYCLETM'
      DisplayFormat = '#####0.######'
      Size = 6
    end
    object TblPtOperOP_Cost: TFloatField
      FieldKind = fkCalculated
      FieldName = 'OP_Cost'
      DisplayFormat = '##########.######'
      Calculated = True
    end
    object TblPtOperLOGIN_REQUIRED: TStringField
      FieldName = 'LOGIN_REQUIRED'
      FixedChar = True
      Size = 1
    end
    object TblPtOperLOGOUT_REQUIRED: TStringField
      FieldName = 'LOGOUT_REQUIRED'
      FixedChar = True
      Size = 1
    end
    object TblPtOperCYCLETM_DISP: TBCDField
      FieldName = 'CYCLETM_DISP'
    end
    object TblPtOperOVERLAP_HRS: TBCDField
      FieldName = 'OVERLAP_HRS'
      Size = 2
    end
    object TblPtOperMULTIPLES: TBCDField
      FieldName = 'MULTIPLES'
      Size = 0
    end
    object TblPtOperSCRAP_DISP: TBCDField
      FieldName = 'SCRAP_DISP'
    end
    object TblPtOperUOM: TStringField
      FieldName = 'UOM'
      Size = 10
    end
    object TblPtOperOVERLAP_PROCESS: TStringField
      FieldName = 'OVERLAP_PROCESS'
      Visible = False
      Size = 1
    end
    object TblPtOperMOVE_SIZE: TFMTBCDField
      FieldName = 'MOVE_SIZE'
      Size = 6
    end
    object TblPtOperMOVE_TIME: TFMTBCDField
      FieldName = 'MOVE_TIME'
      Size = 6
    end
    object TblPtOperID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object TblPtOperParentOpNo: TStringField
      FieldKind = fkCalculated
      FieldName = 'ParentOpNo'
      Calculated = True
    end
    object TblPtOperPROCESS_SCRAP: TBCDField
      FieldName = 'PROCESS_SCRAP'
      Visible = False
    end
    object TblPtOperREPORT_FINAL_ASSY: TStringField
      FieldName = 'REPORT_FINAL_ASSY'
      Visible = False
      Size = 1
    end
    object TblPtOperUSE_FOR_LABEL_PRINT: TStringField
      FieldName = 'USE_FOR_LABEL_PRINT'
      Visible = False
      Size = 1
    end
    object TblPtOperGROUPING_PROCESS: TStringField
      FieldName = 'GROUPING_PROCESS'
      Visible = False
      Size = 1
    end
  end
  object TblSndOp: TFDTable
    Tag = 1
    BeforeInsert = PostParentsBeforeEdit
    BeforeEdit = PostParentsBeforeEdit
    BeforePost = AssignIDBeforePost
    BeforeCancel = ConfirmCancel
    OnCalcFields = TblSndOpCalcFields
    OnDeleteError = HandleError
    OnEditError = HandleError
    OnPostError = HandleError
    IndexFieldNames = 'ID'
    MasterSource = SrcPtOper
    MasterFields = 'SNDOP_ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evItems]
    FetchOptions.Items = [fiBlobs, fiDetails]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvUpdateMode]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    UpdateOptions.UpdateTableName = 'IQMS.SNDOP'
    TableName = 'IQMS.SNDOP'
    Left = 228
    Top = 83
    object TblSndOpID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object TblSndOpVENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Size = 0
    end
    object TblSndOpVEN_LEAD: TBCDField
      FieldName = 'VEN_LEAD'
      Size = 0
    end
    object TblSndOpCYCLETM: TBCDField
      FieldName = 'CYCLETM'
    end
    object TblSndOpSCRAP: TBCDField
      FieldName = 'SCRAP'
    end
    object TblSndOpOPERATOR: TBCDField
      FieldName = 'OPERATOR'
      Size = 2
    end
    object TblSndOpSETUPHRS: TBCDField
      FieldName = 'SETUPHRS'
      Size = 2
    end
    object TblSndOpPRICEDATE: TDateTimeField
      FieldName = 'PRICEDATE'
    end
    object TblSndOpLABOR_RATES_ID: TBCDField
      FieldName = 'LABOR_RATES_ID'
      Size = 0
    end
    object TblSndOpOP_CLASS: TStringField
      FieldName = 'OP_CLASS'
      EditMask = '>aa;1;_'
      Size = 2
    end
    object TblSndOpOPNO: TStringField
      FieldName = 'OPNO'
      EditMask = '>aaaaaaaaaaaaaaa;1;_'
      Size = 15
    end
    object TblSndOpOPDESC: TStringField
      FieldName = 'OPDESC'
      Size = 25
    end
    object TblSndOpCNTR_TYPE: TStringField
      FieldName = 'CNTR_TYPE'
      EditMask = '>aaaaaaaaaa;1;_'
    end
    object TblSndOpATPRESS: TStringField
      FieldName = 'ATPRESS'
      Size = 1
    end
    object TblSndOpCNTR_RATE: TBCDField
      FieldName = 'CNTR_RATE'
      Size = 2
    end
    object TblSndOpOpNoDisp: TStringField
      FieldKind = fkCalculated
      FieldName = 'OpNoDisp'
      Size = 80
      Calculated = True
    end
    object TblSndOpNOTE1: TStringField
      FieldName = 'NOTE1'
      Visible = False
      Size = 2000
    end
    object TblSndOpMultiplesOfDisp: TStringField
      FieldKind = fkCalculated
      FieldName = 'MultiplesOfDisp'
      Visible = False
      Calculated = True
    end
    object TblSndOpUSE_MULTIPLIER: TStringField
      FieldName = 'USE_MULTIPLIER'
      Visible = False
      Size = 1
    end
  end
  object TblOpMat: TFDTable
    BeforeInsert = TblOpMatBeforeInsert
    AfterInsert = TblOpMatAfterInsert
    BeforeEdit = PostParentsBeforeEdit
    BeforePost = TblOpMatBeforePost
    AfterPost = TblOpMatAfterPost
    OnCalcFields = TblOpMatCalcFields
    OnDeleteError = HandleError
    OnEditError = HandleError
    OnPostError = HandleError
    IndexFieldNames = 'SNDOP_ID;SEQ'
    MasterSource = SrcSndOp
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'IQMS.OPMAT'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'IQMS.OPMAT'
    Left = 315
    Top = 84
    object TblOpMatSEQ: TBCDField
      DisplayLabel = '#'
      DisplayWidth = 4
      FieldName = 'SEQ'
      Size = 0
    end
    object TblOpMatItemNo: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 22
      FieldKind = fkCalculated
      FieldName = 'ItemNo'
      Size = 25
      Calculated = True
    end
    object TblOpMatMBATCH_PERCENT: TFMTBCDField
      DisplayLabel = 'Batch Percent'
      DisplayWidth = 12
      FieldName = 'MBATCH_PERCENT'
      Size = 6
    end
    object TblOpMatDESCRIP: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 29
      FieldKind = fkCalculated
      FieldName = 'DESCRIP'
      Size = 100
      Calculated = True
    end
    object TblOpMatDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 26
      FieldKind = fkCalculated
      FieldName = 'DESCRIP2'
      Size = 100
      Calculated = True
    end
    object TblOpMatPTSPER_DISP: TFMTBCDField
      DisplayLabel = 'Pts Per'
      DisplayWidth = 12
      FieldName = 'PTSPER_DISP'
      OnValidate = TblOpMatPTSPERValidate
      DisplayFormat = '########0.######'
      Size = 6
    end
    object TblOpMatClass: TStringField
      DisplayWidth = 6
      FieldKind = fkCalculated
      FieldName = 'Class'
      Calculated = True
    end
    object TblOpMatRev: TStringField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Rev'
      Size = 25
      Calculated = True
    end
    object TblOpMatUNIT: TStringField
      DisplayLabel = 'UOM'
      DisplayWidth = 10
      FieldName = 'UNIT'
      Size = 10
    end
    object TblOpMatVERIFY_ASN_QTY: TStringField
      DisplayWidth = 1
      FieldName = 'VERIFY_ASN_QTY'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object TblOpMatNon_Material: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Non_Material'
      Visible = False
      Calculated = True
    end
    object TblOpMatALLOC_REQ: TStringField
      DisplayWidth = 1
      FieldName = 'ALLOC_REQ'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object TblOpMatOFFSET_DAYS: TBCDField
      DisplayLabel = 'Offset Days'
      DisplayWidth = 10
      FieldName = 'OFFSET_DAYS'
      Visible = False
      Size = 2
    end
    object TblOpMatFAB_ALLOC_MULTI: TStringField
      DisplayWidth = 1
      FieldName = 'FAB_ALLOC_MULTI'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object TblOpMatDISPO_CYCLES_BASED: TStringField
      DisplayWidth = 1
      FieldName = 'DISPO_CYCLES_BASED'
      Visible = False
      Size = 1
    end
    object TblOpMatSCRAP: TBCDField
      DisplayWidth = 10
      FieldName = 'SCRAP'
      Visible = False
      Size = 2
    end
    object TblOpMatID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object TblOpMatSTANDARD_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'STANDARD_ID'
      Visible = False
      Size = 0
    end
    object TblOpMatArinvt_EPLant_ID: TFloatField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Arinvt_EPLant_ID'
      Visible = False
      Calculated = True
    end
    object TblOpMatEXCLUDE_SCRAP_DISPO: TStringField
      DisplayWidth = 1
      FieldName = 'EXCLUDE_SCRAP_DISPO'
      Visible = False
      Size = 1
    end
    object TblOpMatOVERLAP_HRS: TBCDField
      DisplayWidth = 10
      FieldName = 'OVERLAP_HRS'
      Visible = False
      Size = 2
    end
    object TblOpMatArinvt_Standard_ID: TFloatField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Arinvt_Standard_ID'
      Visible = False
      Calculated = True
    end
    object TblOpMatEXCLUDE_BACKFLUSH: TStringField
      DisplayWidth = 1
      FieldName = 'EXCLUDE_BACKFLUSH'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object TblOpMatTARE_WEIGHT: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'TARE_WEIGHT'
      Visible = False
      Size = 6
    end
    object TblOpMatCUSER1: TStringField
      DisplayWidth = 60
      FieldName = 'CUSER1'
      Visible = False
      Size = 255
    end
    object TblOpMatCUSER2: TStringField
      DisplayWidth = 60
      FieldName = 'CUSER2'
      Visible = False
      Size = 255
    end
    object TblOpMatCUSER3: TStringField
      DisplayWidth = 60
      FieldName = 'CUSER3'
      Visible = False
      Size = 255
    end
    object TblOpMatNUSER1: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'NUSER1'
      Visible = False
      Size = 6
    end
    object TblOpMatNUSER2: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'NUSER2'
      Visible = False
      Size = 6
    end
    object TblOpMatNUSER3: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'NUSER3'
      Visible = False
      Size = 6
    end
    object TblOpMatRETURNABLE_CONTAINER: TStringField
      DisplayWidth = 1
      FieldName = 'RETURNABLE_CONTAINER'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object TblOpMatSNDOP_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SNDOP_ID'
      Required = True
      Visible = False
      Size = 0
    end
    object TblOpMatARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Required = True
      Visible = False
      Size = 0
    end
    object TblOpMatWEIGHT: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'WEIGHT'
      Visible = False
      Size = 6
    end
    object TblOpMatLBL_FORMAT: TBCDField
      DisplayWidth = 10
      FieldName = 'LBL_FORMAT'
      Visible = False
      Size = 0
    end
    object TblOpMatIs_By_Product: TStringField
      FieldKind = fkCalculated
      FieldName = 'Is_By_Product'
      Size = 1
      Calculated = True
    end
    object TblOpMatEXCLUDE_SHIP_ORDER: TStringField
      FieldName = 'EXCLUDE_SHIP_ORDER'
      Size = 1
    end
    object TblOpMatINCLUDE_STD_COST: TStringField
      DisplayLabel = 'Include In Std Cost Calc'
      FieldName = 'INCLUDE_STD_COST'
      Visible = False
      Size = 1
    end
    object TblOpMatSTD_BATCH_QTY: TFMTBCDField
      FieldName = 'STD_BATCH_QTY'
      Size = 6
    end
    object TblOpMatEXCLUDE_KIT_MTO: TStringField
      FieldName = 'EXCLUDE_KIT_MTO'
      Visible = False
      Size = 1
    end
    object TblOpMatEXCLUDE_STD_COST: TStringField
      FieldName = 'EXCLUDE_STD_COST'
      Visible = False
      Size = 1
    end
    object TblOpMatEXCLUDE_REJECTS_BACKFLUSH: TStringField
      FieldName = 'EXCLUDE_REJECTS_BACKFLUSH'
      Visible = False
      Size = 1
    end
    object TblOpMatSTARTUP_QTY: TFMTBCDField
      FieldName = 'STARTUP_QTY'
      Visible = False
      Size = 6
    end
    object TblOpMatINCLUDE_STARTUP_QTY_STD_COST: TStringField
      FieldName = 'INCLUDE_STARTUP_QTY_STD_COST'
      Visible = False
      Size = 1
    end
    object TblOpMatStd_Cost: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Std_Cost'
      Calculated = True
    end
    object TblOpMatSpg: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Spg'
      Calculated = True
    end
    object TblOpMatPTSPER_TEMP: TFMTBCDField
      FieldName = 'PTSPER_TEMP'
      Visible = False
      Size = 6
    end
    object TblOpMatPARENT_BATCH_SIZE: TFMTBCDField
      FieldName = 'PARENT_BATCH_SIZE'
      Origin = 'PARENT_BATCH_SIZE'
      Visible = False
      Precision = 15
      Size = 6
    end
  end
  object SrcMfg_Aux: TDataSource
    DataSet = TblMfg_Aux
    Left = 220
    Top = 8
  end
  object TblMfg_Aux: TFDTable
    BeforeInsert = PostParentsBeforeEdit
    BeforeEdit = PostParentsBeforeEdit
    BeforePost = TblMfg_AuxBeforePost
    BeforeCancel = ConfirmCancel
    OnCalcFields = TblMfg_AuxCalcFields
    OnDeleteError = HandleError
    OnEditError = HandleError
    OnNewRecord = TblMfg_AuxNewRecord
    OnPostError = HandleError
    IndexFieldNames = 'STANDARD_ID'
    MasterSource = SrcStandard
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'IQMS.MFG_AUX'
    TableName = 'IQMS.MFG_AUX'
    Left = 237
    Top = 14
    object TblMfg_AuxAUX_ID: TBCDField
      FieldName = 'AUX_ID'
      Visible = False
      Size = 0
    end
    object TblMfg_AuxSTANDARD_ID: TBCDField
      FieldName = 'STANDARD_ID'
      Visible = False
      Size = 0
    end
    object TblMfg_AuxDesc: TStringField
      DisplayLabel = 'Description'
      FieldKind = fkLookup
      FieldName = 'Desc'
      LookupDataSet = QryAux
      LookupKeyFields = 'ID'
      LookupResultField = 'AUX_DESC'
      KeyFields = 'AUX_ID'
      Size = 50
      Lookup = True
    end
    object TblMfg_AuxRate: TFloatField
      FieldKind = fkLookup
      FieldName = 'Rate'
      LookupDataSet = QryAux
      LookupKeyFields = 'ID'
      LookupResultField = 'AUX_RATE'
      KeyFields = 'AUX_ID'
      Lookup = True
    end
    object TblMfg_AuxHOW_MANY: TBCDField
      DisplayLabel = 'How Many'
      FieldName = 'HOW_MANY'
      Size = 0
    end
    object TblMfg_AuxElem_Descrip: TStringField
      DisplayLabel = 'Cost Element'
      FieldKind = fkCalculated
      FieldName = 'Elem_Descrip'
      Size = 30
      Calculated = True
    end
    object TblMfg_AuxSetupHrs1: TFloatField
      DisplayLabel = 'Setup 1'
      FieldKind = fkCalculated
      FieldName = 'SetupHrs1'
      Calculated = True
    end
    object TblMfg_AuxSetupHrs2: TFloatField
      DisplayLabel = 'Setup 2'
      FieldKind = fkCalculated
      FieldName = 'SetupHrs2'
      Calculated = True
    end
    object TblMfg_AuxID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object SrcStandard: TDataSource
    DataSet = TblStandard
    Left = 124
    Top = 8
  end
  object TblStandard: TFDTable
    BeforeOpen = AssignEPlantFilter
    AfterInsert = TblStandardAfterInsert
    BeforePost = TblStandardBeforePost
    AfterPost = TblStandardAfterPost
    BeforeDelete = TblStandardBeforeDelete
    OnDeleteError = HandleError
    OnEditError = HandleError
    Filtered = True
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'IQMS.STANDARD'
    TableName = 'IQMS.STANDARD'
    Left = 137
    Top = 19
    object TblStandardID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object TblStandardMFGNO: TStringField
      DisplayLabel = 'Mfg #'
      FieldName = 'MFGNO'
      Size = 50
    end
    object TblStandardSETS: TFMTBCDField
      FieldName = 'SETS'
      Size = 5
    end
    object TblStandardCYCLETM: TBCDField
      FieldName = 'CYCLETM'
    end
    object TblStandardSCRAP: TBCDField
      FieldName = 'SCRAP'
    end
    object TblStandardREGRIND: TBCDField
      FieldName = 'REGRIND'
      Size = 0
    end
    object TblStandardOPERATOR: TBCDField
      FieldName = 'OPERATOR'
      Size = 2
    end
    object TblStandardLBSK: TFMTBCDField
      FieldName = 'LBSK'
      DisplayFormat = '######0.00'
      Size = 6
    end
    object TblStandardSHOTWT: TFMTBCDField
      FieldName = 'SHOTWT'
      DisplayFormat = '######0.00'
      Size = 6
    end
    object TblStandardSETUPHRS: TBCDField
      FieldName = 'SETUPHRS'
      Size = 2
    end
    object TblStandardSPRUE: TFMTBCDField
      FieldName = 'SPRUE'
      Size = 6
    end
    object TblStandardMFG_TYPE: TStringField
      FieldName = 'MFG_TYPE'
      EditMask = '>aaaaaaaaaa;1;_'
      Size = 10
    end
    object TblStandardMFGCELL: TStringField
      FieldName = 'MFGCELL'
      EditMask = '>aaaaaaaaaaaaaaa;1;_'
      Size = 15
    end
    object TblStandardFG_LOTNO: TStringField
      DisplayLabel = 'FG Lot#'
      FieldName = 'FG_LOTNO'
      Size = 25
    end
    object TblStandardORDSCOPE: TBCDField
      FieldName = 'ORDSCOPE'
      Size = 0
    end
    object TblStandardRUNSCOPE: TBCDField
      FieldName = 'RUNSCOPE'
      Size = 0
    end
    object TblStandardBOM_CNTRL: TStringField
      FieldName = 'BOM_CNTRL'
      Size = 60
    end
    object TblStandardCNTR_TYPE: TStringField
      DisplayLabel = 'Center Type'
      FieldName = 'CNTR_TYPE'
    end
    object TblStandardARINVT_ID_MAT: TBCDField
      DisplayLabel = 'Material'
      FieldName = 'ARINVT_ID_MAT'
      OnChange = TblStandardARINVT_ID_MATChange
      Size = 0
    end
    object TblStandardTIMESTAMP: TDateTimeField
      FieldName = 'TIMESTAMP'
    end
    object TblStandardARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Size = 0
    end
    object TblStandardPLANFENCE: TBCDField
      FieldName = 'PLANFENCE'
      Size = 0
    end
    object TblStandardRFQ: TStringField
      FieldName = 'RFQ'
      EditMask = '>aaaaaaaaaaaaaaaaaaaa;1;_'
    end
    object TblStandardFIRST_ARTICLE_DATE: TDateTimeField
      FieldName = 'FIRST_ARTICLE_DATE'
      EditMask = '##/##/####'
    end
    object TblStandardCustName: TStringField
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'CustName'
      LookupDataSet = TblArCusto
      LookupKeyFields = 'ID'
      LookupResultField = 'COMPANY'
      KeyFields = 'ARCUSTO_ID'
      Size = 60
      Lookup = True
    end
    object TblStandardMatDescrip: TStringField
      DisplayWidth = 35
      FieldKind = fkCalculated
      FieldName = 'MatDescrip'
      Size = 100
      Calculated = True
    end
    object TblStandardCycleSPH: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CycleSPH'
      DisplayFormat = '######0.00'
      EditFormat = '######0.00'
      Calculated = True
    end
    object TblStandardHrsK: TFloatField
      FieldKind = fkCalculated
      FieldName = 'HrsK'
      DisplayFormat = '######0.00'
      EditFormat = '######0.00'
      Calculated = True
    end
    object TblStandardCYCLE: TBCDField
      FieldName = 'CYCLE'
    end
    object TblStandardSPH_Net: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SPH_Net'
      DisplayFormat = '######0.00'
      Calculated = True
    end
    object TblStandardRG_DISPO: TStringField
      FieldName = 'RG_DISPO'
      Size = 1
    end
    object TblStandardREUSE: TStringField
      FieldName = 'REUSE'
      Size = 1
    end
    object TblStandardASSEM: TStringField
      FieldName = 'ASSEM'
      Size = 1
    end
    object TblStandardSPRUE_DISP: TFMTBCDField
      FieldName = 'SPRUE_DISP'
      Size = 6
    end
    object TblStandardUOM: TStringField
      FieldName = 'UOM'
      Size = 10
    end
    object TblStandardPMEQMT_ID: TBCDField
      FieldName = 'PMEQMT_ID'
      Size = 0
    end
    object TblStandardEqNo: TStringField
      FieldKind = fkLookup
      FieldName = 'EqNo'
      LookupDataSet = TblPmEqmt
      LookupKeyFields = 'ID'
      LookupResultField = 'EQNO'
      KeyFields = 'PMEQMT_ID'
      Lookup = True
    end
    object TblStandardLocation: TStringField
      FieldKind = fkLookup
      FieldName = 'Location'
      LookupDataSet = TblPmEqmt
      LookupKeyFields = 'ID'
      LookupResultField = 'LOCATION'
      KeyFields = 'PMEQMT_ID'
      Lookup = True
    end
    object TblStandardEFF_FACTOR: TBCDField
      FieldName = 'EFF_FACTOR'
      Size = 2
    end
    object TblStandardDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 50
    end
    object TblStandardLABOR_RATE: TFMTBCDField
      FieldName = 'LABOR_RATE'
      Size = 6
    end
    object TblStandardUSERID: TStringField
      FieldName = 'USERID'
      Size = 35
    end
    object TblStandardCUSER1: TStringField
      FieldName = 'CUSER1'
      Size = 60
    end
    object TblStandardCUSER2: TStringField
      FieldName = 'CUSER2'
      Size = 60
    end
    object TblStandardCUSER3: TStringField
      FieldName = 'CUSER3'
      Size = 60
    end
    object TblStandardCUSER4: TStringField
      FieldName = 'CUSER4'
      Size = 60
    end
    object TblStandardCUSER5: TStringField
      FieldName = 'CUSER5'
      Size = 60
    end
    object TblStandardCUSER6: TStringField
      FieldName = 'CUSER6'
      Size = 60
    end
    object TblStandardNUSER1: TFMTBCDField
      FieldName = 'NUSER1'
      Size = 6
    end
    object TblStandardNUSER2: TFMTBCDField
      FieldName = 'NUSER2'
      Size = 6
    end
    object TblStandardNUSER3: TFMTBCDField
      FieldName = 'NUSER3'
      Size = 6
    end
    object TblStandardNUSER4: TFMTBCDField
      FieldName = 'NUSER4'
      Size = 6
    end
    object TblStandardNUSER5: TFMTBCDField
      FieldName = 'NUSER5'
      Size = 6
    end
    object TblStandardWITH_ASSY_AT_PRESS: TStringField
      FieldName = 'WITH_ASSY_AT_PRESS'
      Size = 1
    end
    object TblStandardLBSK_Disp: TFloatField
      FieldKind = fkCalculated
      FieldName = 'LBSK_Disp'
      DisplayFormat = '######0.00'
      Calculated = True
    end
    object TblStandardShotWt_Disp: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ShotWt_Disp'
      DisplayFormat = '######0.00'
      Calculated = True
    end
    object TblStandardSETS_DISP: TFMTBCDField
      FieldName = 'SETS_DISP'
      DisplayFormat = '#####.########'
    end
    object TblStandardCYCLETM_DISP: TBCDField
      FieldName = 'CYCLETM_DISP'
      DisplayFormat = '#####0.####'
      EditFormat = '#####0.####'
    end
    object TblStandardMfgTypeDescrip: TStringField
      FieldKind = fkCalculated
      FieldName = 'MfgTypeDescrip'
      LookupDataSet = TblMfgType
      LookupKeyFields = 'MFGTYPE'
      LookupResultField = 'DESCRIP'
      KeyFields = 'MFG_TYPE'
      Calculated = True
    end
    object TblStandardBATCH_TYPE: TStringField
      FieldName = 'BATCH_TYPE'
      Size = 1
    end
    object TblStandardEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object TblStandardEPlant_Name: TStringField
      DisplayLabel = 'EPlant Name'
      FieldKind = fkLookup
      FieldName = 'EPlant_Name'
      LookupDataSet = QryEPlant
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIP'
      KeyFields = 'EPLANT_ID'
      Lookup = True
    end
    object TblStandardMFGCELL_ID: TBCDField
      FieldName = 'MFGCELL_ID'
      Size = 0
    end
    object TblStandardRUNS_BEST_FROM_DATE: TDateTimeField
      FieldName = 'RUNS_BEST_FROM_DATE'
    end
    object TblStandardFLAT_CYCLETM: TStringField
      FieldName = 'FLAT_CYCLETM'
      Size = 1
    end
    object TblStandardEFFECT_DATE: TDateTimeField
      FieldName = 'EFFECT_DATE'
      EditMask = '!99/99/0000;1; '
    end
    object TblStandardDEACTIVE_DATE: TDateTimeField
      FieldName = 'DEACTIVE_DATE'
      EditMask = '!99/99/0000;1; '
    end
    object TblStandardPLANNING_FENCE: TBCDField
      FieldName = 'PLANNING_FENCE'
      Size = 0
    end
    object TblStandardMatEPlant_ID: TFloatField
      FieldKind = fkCalculated
      FieldName = 'MatEPlant_ID'
      Calculated = True
    end
    object TblStandardROUTE_SEQ: TBCDField
      FieldName = 'ROUTE_SEQ'
      Size = 0
    end
    object TblStandardPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      FixedChar = True
      Size = 1
    end
    object TblStandardREUSE_SPRUE: TStringField
      FieldName = 'REUSE_SPRUE'
      FixedChar = True
      Size = 1
    end
    object TblStandardBackflushProdParam: TStringField
      FieldKind = fkCalculated
      FieldName = 'BackflushProdParam'
      Size = 70
      Calculated = True
    end
    object TblStandardRegrindProdParam: TStringField
      FieldKind = fkCalculated
      FieldName = 'RegrindProdParam'
      Size = 50
      Calculated = True
    end
    object TblStandardCHK_AVAIL_RG_PRCNT: TStringField
      FieldName = 'CHK_AVAIL_RG_PRCNT'
      FixedChar = True
      Size = 1
    end
    object TblStandardSETUPHRS2: TBCDField
      FieldName = 'SETUPHRS2'
      Size = 2
    end
    object TblStandardSCRAP_DISP: TBCDField
      FieldName = 'SCRAP_DISP'
    end
    object TblStandardHR_JOB_DESCRIP_ID: TBCDField
      FieldName = 'HR_JOB_DESCRIP_ID'
      Size = 0
    end
    object TblStandardCERT_LEVEL: TBCDField
      FieldName = 'CERT_LEVEL'
      Size = 0
    end
    object TblStandardSTART_MAT_QTY: TFMTBCDField
      FieldName = 'START_MAT_QTY'
      Size = 6
    end
    object TblStandardINFO_SCHED: TStringField
      FieldName = 'INFO_SCHED'
      Size = 250
    end
    object TblStandardIS_OUTSOURCE_DROPSHIP: TStringField
      FieldName = 'IS_OUTSOURCE_DROPSHIP'
      FixedChar = True
      Size = 1
    end
    object TblStandardSHEET_WIDTH: TFMTBCDField
      FieldName = 'SHEET_WIDTH'
      Size = 6
    end
    object TblStandardRAIL: TFMTBCDField
      FieldName = 'RAIL'
      Size = 6
    end
    object TblStandardSHEET_LENGTH: TFMTBCDField
      FieldName = 'SHEET_LENGTH'
      Size = 6
    end
    object TblStandardCLAMP: TFMTBCDField
      FieldName = 'CLAMP'
      Size = 6
    end
    object TblStandardSheet_Weight: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Sheet_Weight'
      DisplayFormat = '########0.########'
      Calculated = True
    end
    object TblStandardMatSPG: TFloatField
      FieldKind = fkCalculated
      FieldName = 'MatSPG'
      Calculated = True
    end
    object TblStandardMatGauge: TFloatField
      FieldKind = fkCalculated
      FieldName = 'MatGauge'
      Calculated = True
    end
    object TblStandardSheet_Weight_Disp: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Sheet_Weight_Disp'
      DisplayFormat = '########0.########'
      Calculated = True
    end
    object TblStandardMatLength: TFloatField
      FieldKind = fkCalculated
      FieldName = 'MatLength'
      Calculated = True
    end
    object TblStandardMatWidth: TFloatField
      FieldKind = fkCalculated
      FieldName = 'MatWidth'
      Calculated = True
    end
    object TblStandardIS_VIRTUAL: TStringField
      FieldName = 'IS_VIRTUAL'
      Size = 1
    end
    object TblStandardVIRTUAL_WORK_CENTERS_COUNT: TBCDField
      FieldName = 'VIRTUAL_WORK_CENTERS_COUNT'
      Size = 0
    end
    object TblStandardINCLUDE_START_MAT_IN_STD_COST: TStringField
      FieldName = 'INCLUDE_START_MAT_IN_STD_COST'
      Visible = False
      Size = 1
    end
    object TblStandardTotalPartsPerHr: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalPartsPerHr'
      DisplayFormat = '######0.00'
      Calculated = True
    end
    object TblStandardBATCH_SIZE: TFMTBCDField
      FieldName = 'BATCH_SIZE'
      Size = 6
    end
    object TblStandardLookupMfgType: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookupMfgType'
      Size = 10
      Calculated = True
    end
    object TblStandardCalcType: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcType'
      Calculated = True
    end
    object TblStandardASSY1_STD_QUAN: TFMTBCDField
      FieldName = 'ASSY1_STD_QUAN'
      Size = 6
    end
    object TblStandardASSY1_STD_PROCESSING_TIME: TFMTBCDField
      FieldName = 'ASSY1_STD_PROCESSING_TIME'
      DisplayFormat = '#########.######'
      Size = 6
    end
    object TblStandardQUOTE_ID: TBCDField
      FieldName = 'QUOTE_ID'
      Visible = False
      Size = 0
    end
    object TblStandardGAUGE: TFMTBCDField
      FieldName = 'GAUGE'
      Size = 6
    end
    object TblStandardFinalAssyOnProcess: TStringField
      FieldKind = fkLookup
      FieldName = 'FinalAssyOnProcess'
      LookupDataSet = TblMfgType
      LookupKeyFields = 'MFGTYPE'
      LookupResultField = 'ASSY1_FINAL_ASSY_ON_PROCESS'
      KeyFields = 'MFG_TYPE'
      Visible = False
      Size = 1
      Lookup = True
    end
    object TblStandardUseYieldOnBOM: TStringField
      FieldKind = fkLookup
      FieldName = 'UseYieldOnBOM'
      LookupDataSet = TblMfgType
      LookupKeyFields = 'MFGTYPE'
      LookupResultField = 'USE_YIELD_ON_BOM'
      KeyFields = 'MFG_TYPE'
      Size = 1
      Lookup = True
    end
    object TblStandardADC: TStringField
      FieldName = 'ADC'
      Visible = False
      Size = 1
    end
    object TblStandardCORE_SIZE: TFMTBCDField
      FieldName = 'CORE_SIZE'
      Visible = False
      Size = 6
    end
    object TblStandardOD: TFMTBCDField
      FieldName = 'OD'
      Visible = False
      Size = 6
    end
    object TblStandardMIN_WIDTH: TFMTBCDField
      FieldName = 'MIN_WIDTH'
      Size = 6
    end
    object TblStandardMAX_WIDTH: TFMTBCDField
      FieldName = 'MAX_WIDTH'
      Size = 6
    end
    object TblStandardTRIM_WIDTH: TFMTBCDField
      FieldName = 'TRIM_WIDTH'
      Size = 6
    end
    object TblStandardALTERNATE_ITEM_CODE_ID: TBCDField
      FieldName = 'ALTERNATE_ITEM_CODE_ID'
      Visible = False
      Size = 0
    end
    object TblStandardAlternateItemCode: TStringField
      FieldKind = fkCalculated
      FieldName = 'AlternateItemCode'
      Visible = False
      Size = 25
      Calculated = True
    end
    object TblStandardFUTURE_LABOR_RATE: TFMTBCDField
      DisplayLabel = 'Future Rate'
      FieldName = 'FUTURE_LABOR_RATE'
      Size = 6
    end
    object TblStandardBUDGET_LABOR_RATE: TFMTBCDField
      DisplayLabel = 'Budget Rate'
      FieldName = 'BUDGET_LABOR_RATE'
      Size = 6
    end
    object TblStandardFORECAST_LABOR_RATE: TFMTBCDField
      DisplayLabel = 'Forecast Rate'
      FieldName = 'FORECAST_LABOR_RATE'
      Size = 6
    end
    object TblStandardORIGIN: TStringField
      FieldName = 'ORIGIN'
      Visible = False
    end
    object TblStandardTREATMENT_INFO: TStringField
      FieldName = 'TREATMENT_INFO'
      Visible = False
      Size = 2000
    end
    object TblStandardTreatmentTotalCycle: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TreatmentTotalCycle'
      Calculated = True
    end
    object TblStandardBATCH_SIZE_SCALABLE: TFMTBCDField
      FieldName = 'BATCH_SIZE_SCALABLE'
      Origin = 'BATCH_SIZE_SCALABLE'
      Precision = 15
      Size = 6
    end
  end
  object SrcArCusto: TDataSource
    DataSet = TblArCusto
    Left = 124
    Top = 67
  end
  object TblArCusto: TFDTable
    OnDeleteError = HandleError
    OnEditError = HandleError
    OnPostError = HandleError
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'IQMS.ARCUSTO'
    TableName = 'IQMS.ARCUSTO'
    Left = 134
    Top = 83
    object TblArCustoID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 0
    end
    object TblArCustoCUSTNO: TStringField
      FieldName = 'CUSTNO'
      Size = 10
    end
    object TblArCustoCOMPANY: TStringField
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Size = 60
    end
    object TblArCustoADDR1: TStringField
      DisplayWidth = 30
      FieldName = 'ADDR1'
      Size = 60
    end
    object TblArCustoADDR2: TStringField
      DisplayWidth = 30
      FieldName = 'ADDR2'
      Size = 60
    end
    object TblArCustoADDR3: TStringField
      DisplayWidth = 30
      FieldName = 'ADDR3'
      Size = 60
    end
    object TblArCustoCITY: TStringField
      FieldName = 'CITY'
      Size = 30
    end
    object TblArCustoSTATE: TStringField
      FieldName = 'STATE'
    end
    object TblArCustoCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Size = 30
    end
    object TblArCustoZIP: TStringField
      FieldName = 'ZIP'
      Size = 10
    end
    object TblArCustoPHONE_NUMBER: TStringField
      FieldName = 'PHONE_NUMBER'
      Size = 25
    end
    object TblArCustoEXT: TStringField
      FieldName = 'EXT'
      Size = 5
    end
    object TblArCustoFAX_NUMBER: TStringField
      FieldName = 'FAX_NUMBER'
      Size = 25
    end
    object TblArCustoPRIME_CONTACT: TStringField
      FieldName = 'PRIME_CONTACT'
      Size = 30
    end
  end
  object SrcMfgType: TDataSource
    DataSet = TblMfgType
    Left = 384
    Top = 67
  end
  object TblMfgType: TFDTable
    OnDeleteError = HandleError
    OnEditError = HandleError
    OnPostError = HandleError
    IndexFieldNames = 'MFGTYPE'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'IQMS.MFGTYPE'
    TableName = 'IQMS.MFGTYPE'
    Left = 386
    Top = 83
    object TblMfgTypeMFGTYPE: TStringField
      FieldName = 'MFGTYPE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      EditMask = '>aaaaaaaaaa;1;_'
      Size = 10
    end
    object TblMfgTypeDESCRIP: TStringField
      FieldName = 'DESCRIP'
    end
    object TblMfgTypeLABOR_RATE: TFMTBCDField
      FieldName = 'LABOR_RATE'
      Size = 6
    end
    object TblMfgTypeBOM_REPORT: TStringField
      FieldName = 'BOM_REPORT'
      Size = 250
    end
    object TblMfgTypeWO_REPORT: TStringField
      FieldName = 'WO_REPORT'
      Size = 250
    end
    object TblMfgTypeElement: TStringField
      FieldKind = fkLookup
      FieldName = 'Element'
      LookupDataSet = QryElements
      LookupKeyFields = 'ID'
      LookupResultField = 'ELEM_DESCRIP'
      KeyFields = 'ELEMENTS_ID'
      Lookup = True
    end
    object TblMfgTypeELEMENTS_ID: TBCDField
      FieldName = 'ELEMENTS_ID'
      Size = 0
    end
    object TblMfgTypeFAB_PASSWORD_ON_LOGIN: TStringField
      FieldName = 'FAB_PASSWORD_ON_LOGIN'
      FixedChar = True
      Size = 1
    end
    object TblMfgTypeSTANDARD_MFGTYPE: TStringField
      FieldName = 'STANDARD_MFGTYPE'
      Visible = False
      Size = 10
    end
    object TblMfgTypeASSY1_FINAL_ASSY_ON_PROCESS: TStringField
      FieldName = 'ASSY1_FINAL_ASSY_ON_PROCESS'
      Size = 1
    end
    object TblMfgTypeUSE_YIELD_ON_BOM: TStringField
      FieldName = 'USE_YIELD_ON_BOM'
      Visible = False
      Size = 1
    end
  end
  object PkMfg: TIQWebHpick
    BeforeOpen = AssignEPlantFilter
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select STANDARD.MFGNO          as MfgNo,'
      '       standard.descrip        as standard_descrip,'
      '       STANDARD.MFG_TYPE       as Mfg_TYPE,'
      '       ARINVT.ITEMNO           as ITEMNO,'
      '       ARINVT.REV              as REV,'
      '       ARINVT.DESCRIP          as DESCRIP,'
      '       ARINVT.DESCRIP2         as DESCRIP2,'
      '       ARCUSTO.COMPANY         as COMPANY,'
      '       STANDARD.ID             as ID,'
      '       standard.eplant_id      as eplant_id,'
      '       standard.route_seq      as route_seq,'
      '       standard.effect_date    as effect_date,'
      '       standard.deactive_date  as deactive_date,'
      '       standard.pk_hide        as pk_hide,'
      '       standard.cuser1         as cuser1,'
      '       standard.cuser2         as cuser2,'
      '       standard.cuser3         as cuser3,'
      '       standard.cuser4         as cuser4,'
      '       standard.cuser5         as cuser5,'
      '       standard.cuser6         as cuser6'
      '       '
      '  from IQMS.STANDARD, IQMS.PARTNO, IQMS.ARINVT, IQMS.ARCUSTO'
      ' where IQMS.STANDARD.ID = IQMS.PARTNO.STANDARD_ID(+)'
      '   and IQMS.PARTNO.ARINVT_ID = IQMS.ARINVT.ID(+)'
      '   and IQMS.ARCUSTO.ID(+) = IQMS.STANDARD.ARCUSTO_ID '
      ' '
      '-- HPICK_EMPTY_DATASET_FILTER_START'
      'and 1 < 0'
      '-- HPICK_EMPTY_DATASET_FILTER_END'
      ' ')
    OnIQModify = PkMfgIQModify
    OnIQCreateHPickColumn = PkMfgIQCreateHPickColumn
    Title = 'Select from Pick List'
    Touchscreen = False
    AssociatedDataSource = SrcStandard
    ForceShowWaitForPrompt = False
    SubqueryModuleName = 'INVENTORY'
    SubqueryFieldName = 'ARINVT.ID'
    Left = 36
    Top = 462
    object PkMfgMFGNO: TStringField
      DisplayLabel = 'MFG #'
      FieldName = 'MFGNO'
      Size = 50
    end
    object PkMfgITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object PkMfgREV: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 3
      FieldName = 'REV'
      Size = 15
    end
    object PkMfgDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 18
      FieldName = 'DESCRIP'
      Size = 100
    end
    object PkMfgCOMPANY: TStringField
      DisplayLabel = 'Customer Name'
      DisplayWidth = 15
      FieldName = 'COMPANY'
      Size = 60
    end
    object PkMfgID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkMfgMFG_TYPE: TStringField
      DisplayLabel = 'MFG Type'
      FieldName = 'MFG_TYPE'
      Size = 10
    end
    object PkMfgDESCRIP2: TStringField
      DisplayLabel = 'Extended Description'
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object PkMfgEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object PkMfgEFFECT_DATE: TDateTimeField
      DisplayLabel = 'Effective Date'
      FieldName = 'EFFECT_DATE'
    end
    object PkMfgDEACTIVE_DATE: TDateTimeField
      DisplayLabel = 'Inactive Date'
      FieldName = 'DEACTIVE_DATE'
    end
    object PkMfgROUTE_SEQ: TBCDField
      DisplayLabel = 'Route #'
      FieldName = 'ROUTE_SEQ'
      Size = 0
    end
    object PkMfgPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object PkMfgSTANDARD_DESCRIP: TStringField
      DisplayLabel = 'Mfg Description'
      DisplayWidth = 30
      FieldName = 'STANDARD_DESCRIP'
      Size = 50
    end
    object PkMfgCUSER1: TStringField
      DisplayLabel = 'CUser1'
      DisplayWidth = 20
      FieldName = 'CUSER1'
      Size = 60
    end
    object PkMfgCUSER2: TStringField
      DisplayLabel = 'CUser2'
      DisplayWidth = 20
      FieldName = 'CUSER2'
      Size = 60
    end
    object PkMfgCUSER3: TStringField
      DisplayLabel = 'CUser3'
      DisplayWidth = 20
      FieldName = 'CUSER3'
      Size = 60
    end
    object PkMfgCUSER4: TStringField
      DisplayLabel = 'CUser4'
      DisplayWidth = 20
      FieldName = 'CUSER4'
      Size = 60
    end
    object PkMfgCUSER5: TStringField
      DisplayLabel = 'CUser5'
      DisplayWidth = 20
      FieldName = 'CUSER5'
      Size = 60
    end
    object PkMfgCUSER6: TStringField
      DisplayLabel = 'CUser6'
      DisplayWidth = 20
      FieldName = 'CUSER6'
      Size = 60
    end
  end
  object PkArcusto: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select custno, company, phone_number, prime_contact, id, pk_hide'
      'from v_arcusto'
      ' ')
    OnIQModify = PkArcustoIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 36
    Top = 517
    object PkArcustoCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      FieldName = 'CUSTNO'
      Size = 10
    end
    object PkArcustoCOMPANY: TStringField
      DisplayLabel = 'Customer Name'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Size = 60
    end
    object PkArcustoPHONE_NUMBER: TStringField
      DisplayLabel = 'Phone'
      FieldName = 'PHONE_NUMBER'
      Origin = 'ARCUSTO.PHONE_NUMBER'
      Size = 25
    end
    object PkArcustoPRIME_CONTACT: TStringField
      DisplayLabel = 'Prime Contact'
      FieldName = 'PRIME_CONTACT'
      Size = 30
    end
    object PkArcustoID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkArcustoPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.V_ARCUSTO.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object PkArinvtPL: TIQWebHpick
    BeforeOpen = PkArinvtPLBeforeOpen
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
      '       a.class as class,'
      '       a.pk_hide   as pk_hide'
      '  from '
      '       arinvt a, arinvt_class b'
      ' where '
      '       a.class = b.class'
      '   and b.primary_material = '#39'Y'#39
      '   and (:only_each = 0'
      '        or'
      '        :only_each = 1 and a.unit in ('#39'EACH'#39', '#39'EA'#39'))'
      ' '
      ' ')
    OnIQModify = PkArinvtPLIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 124
    Top = 462
    ParamData = <
      item
        Name = 'only_each'
        DataType = ftBCD
        ParamType = ptInput
      end>
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
      DisplayWidth = 35
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
    object PkArinvtPLCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      FixedChar = True
      Size = 2
    end
    object PkArinvtPLPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object PkArinvt: TIQWebHpick
    BeforeOpen = AssignEPlantFilter
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.itemno    as itemno,'
      '       a.class     as class,'
      '       a.rev       as rev,  '
      '       a.descrip   as descrip,'
      '       a.descrip2  as descrip2,'
      '       a.unit      as unit, '
      '       c.custno    as custno,'
      '       c.company   as company,'
      '       a.id        as id,'
      '       a.eplant_id as eplant_id,'
      '       a.pk_hide   as pk_hide,'
      '       a.non_material as non_material'
      ' from arinvt a, v_arcusto c'
      'where a.arcusto_id = c.id(+)'
      ' '
      ' ')
    OnIQModify = PkArinvtIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 207
    Top = 462
    object StringField1: TStringField
      DisplayLabel = 'Item#'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object PkArinvtCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Size = 2
    end
    object StringField2: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 3
      FieldName = 'REV'
      Size = 15
    end
    object StringField3: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Size = 100
    end
    object PkArinvtDESCRIP2: TStringField
      DisplayLabel = 'Ext. Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object StringField4: TStringField
      DisplayLabel = 'Unit'
      FieldName = 'UNIT'
      Size = 10
    end
    object PkArinvtCUSTNO: TStringField
      DisplayLabel = 'Cust#'
      FieldName = 'CUSTNO'
      Size = 10
    end
    object PkArinvtCOMPANY: TStringField
      DisplayLabel = 'Customer Name'
      FieldName = 'COMPANY'
      Size = 60
    end
    object FloatField1: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkArinvtEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object PkArinvtPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object PkArinvtNON_MATERIAL: TStringField
      DisplayLabel = 'Non Material'
      FieldName = 'NON_MATERIAL'
      FixedChar = True
      Size = 1
    end
  end
  object PkSndOp: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select opno, '
      '       opdesc, '
      '       op_class, '
      '       id,'
      '       pk_hide'
      '  from sndop'
      ' where not op_class in ( '#39'IN'#39', '#39'PK'#39', '#39'BL'#39', '#39'FB'#39', '#39'AS'#39' )'
      '   and misc.eplant_filter_include_nulls( eplant_id ) = 1'
      '                              '
      ' '
      ' ')
    OnIQModify = PkSndOpIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 132
    Top = 517
    object PkSndOpOPNO: TStringField
      DisplayLabel = 'Operation #'
      FieldName = 'OPNO'
      Size = 15
    end
    object PkSndOpOPDESC: TStringField
      DisplayLabel = 'Description'
      FieldName = 'OPDESC'
      Size = 60
    end
    object PkSndOpOP_CLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 6
      FieldName = 'OP_CLASS'
      Size = 2
    end
    object PkSndOpID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkSndOpPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      Size = 1
    end
  end
  object SrcAux: TDataSource
    DataSet = wwQryAux
    Left = 320
    Top = 8
  end
  object AppDef1: TIQWebAppDef
    AppCode = 'BOM'
    DataField = 'MFG_TYPE'
    DataSource = SrcStandard
    Left = 148
    Top = 283
  end
  object procBOM_Clone_Standard: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    StoredProcName = 'BOM_CLONE_STANDARD'
    Left = 36
    Top = 291
    ParamData = <
      item
        Name = 'V_CLONED_ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'V_NEW_STANDARD_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
  end
  object PkArinvtPk: TIQWebHpick
    BeforeOpen = AssignEPlantFilter
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.itemno    as itemno  , '
      '       a.class     as class   ,'
      '       a.rev       as rev     , '
      '       a.descrip   as descrip , '
      '       a.descrip2  as descrip2,'
      '       a.unit      as unit    , '
      '       c.custno    as custno  ,'
      '       c.company   as company ,'
      '       a.id        as id      ,'
      '       a.eplant_id as eplant_id,'
      '       a.pk_hide   as pk_hide'
      ' from arinvt a, v_arcusto c'
      'where a.arcusto_id = c.id(+) '
      '    and a.class = '#39'PK'#39
      ' ')
    OnIQModify = PkArinvtPkIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 515
    Top = 517
    object PkArinvtPkITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object PkArinvtPkCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Size = 2
    end
    object PkArinvtPkREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 10
      FieldName = 'REV'
      Size = 15
    end
    object PkArinvtPkDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Size = 100
    end
    object PkArinvtPkDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object PkArinvtPkUNIT: TStringField
      DisplayLabel = 'Unit'
      FieldName = 'UNIT'
      Size = 10
    end
    object PkArinvtPkCUSTNO: TStringField
      DisplayLabel = 'Cust #'
      FieldName = 'CUSTNO'
      Size = 10
    end
    object PkArinvtPkCOMPANY: TStringField
      DisplayLabel = 'Customer Name'
      FieldName = 'COMPANY'
      Size = 60
    end
    object PkArinvtPkID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkArinvtPkEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object PkArinvtPkPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object QryArCusto: TFDQuery
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       company,'
      '       addr1,'
      '       addr2,'
      
        '       RTrim(RTrim(Ltrim(city)) || '#39' '#39' || RTrim(RTrim(LTrim(Stat' +
        'e)) || '#39', '#39' || RTrim(LTrim(ZIP))) ) as citystatezip,'
      '       pk_hide'
      'from v_arcusto'
      'order by company'
      ' ')
    Left = 227
    Top = 147
  end
  object wwQryMfgCell: TFDQuery
    BeforeOpen = AssignEPlantFilter
    Filtered = True
    OnFilterRecord = wwQryMfgCellFilterRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * '
      '  from v_mfgcell')
    Left = 124
    Top = 147
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
      DisplayWidth = 10
      FieldName = 'MFGTYPE'
      Origin = 'MFGCELL.MFGTYPE'
      Size = 10
    end
    object wwQryMfgCellEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'MFGCELL.EPLANT_ID'
      Size = 0
    end
    object wwQryMfgCellID: TBCDField
      FieldName = 'ID'
      Origin = 'MFGCELL.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
  end
  object wwQryWork_Center: TFDQuery
    BeforeOpen = wwQryWork_CenterBeforeOpen
    Filtered = True
    OnFilterRecord = wwQryWork_CenterFilterRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct '
      '       cntr_type, '
      '       mfg_type,'
      '       eplant_id,'
      '       mfgcell_id'
      '  from work_center'
      ' where rtrim(mfg_type) = :mfg_type'
      'order by cntr_type'
      '')
    Left = 519
    Top = 73
    ParamData = <
      item
        Name = 'mfg_type'
        DataType = ftString
        ParamType = ptInput
      end>
    object wwQryWork_CenterCNTR_TYPE: TStringField
      DisplayLabel = 'Type/Size'
      DisplayWidth = 20
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
    object wwQryWork_CenterMFGCELL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'MFGCELL_ID'
      Origin = 'IQ.WORK_CENTER.MFGCELL_ID'
      Visible = False
      Size = 0
    end
  end
  object wwQryArinvtPL: TFDQuery
    BeforeOpen = PkArinvtPLBeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select a.itemno    as itemno, '
      '       a.descrip   as descrip, '
      '       a.rev       as rev, '
      '       a.id        as id,'
      '       a.eplant_id as eplant_id,'
      '       a.class,'
      '       a.pk_hide   as pk_hide'
      '  from '
      '       arinvt a, arinvt_class b'
      ' where '
      '       a.class = b.class'
      '   and b.primary_material = '#39'Y'#39
      '   and misc.eplant_filter( a.eplant_id ) = 1'
      '   and (:only_each = 0'
      '        or'
      '        :only_each = 1 and a.unit in ('#39'EACH'#39', '#39'EA'#39'))'
      ' order by '
      '       a.itemno'
      ' ')
    Left = 318
    Top = 147
    ParamData = <
      item
        Name = 'only_each'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object wwQryArinvtPLITEMNO: TStringField
      DisplayLabel = 'Item#'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 'ARINVT.ITEMNO'
      Size = 50
    end
    object wwQryArinvtPLDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Origin = 'ARINVT.DESCRIP'
      Size = 100
    end
    object wwQryArinvtPLREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 15
      FieldName = 'REV'
      Origin = 'ARINVT.REV'
      Size = 15
    end
    object wwQryArinvtPLID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'ARINVT.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object wwQryArinvtPLEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'ARINVT.EPLANT_ID'
      Size = 0
    end
    object wwQryArinvtPLCLASS: TStringField
      FieldName = 'CLASS'
      FixedChar = True
      Size = 2
    end
    object wwQryArinvtPLPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.ARINVT.PK_HIDE'
      FixedChar = True
      Size = 1
    end
  end
  object QryElements: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from elements where ELEM_TYPE = '#39'LABOR'#39)
    Left = 28
    Top = 219
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
    Left = 124
    Top = 219
  end
  object QryAux: TFDQuery
    BeforeOpen = AssignEPlantFilter
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       aux_desc,'
      '       aux_rate,'
      '       how_many,'
      '       eplant_id'
      ' from aux'
      ''
      ' ')
    Left = 224
    Top = 219
    object QryAuxID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.AUX.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object QryAuxAUX_DESC: TStringField
      FieldName = 'AUX_DESC'
      Origin = 'IQ.AUX.AUX_DESC'
      FixedChar = True
      Size = 50
    end
    object QryAuxAUX_RATE: TBCDField
      FieldName = 'AUX_RATE'
      Origin = 'IQ.AUX.AUX_RATE'
      Size = 2
    end
    object QryAuxHOW_MANY: TBCDField
      FieldName = 'HOW_MANY'
      Origin = 'IQ.AUX.HOW_MANY'
      Size = 0
    end
    object QryAuxEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'IQ.AUX.EPLANT_ID'
      Size = 0
    end
  end
  object wwSrcStandard: TDataSource
    DataSet = wwQryStandard
    Left = 304
    Top = 219
  end
  object wwQryStandard: TFDQuery
    MasterSource = SrcOpMat
    MasterFields = 'ARINVT_ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select p.standard_id, '
      '       s.mfgno,'
      '       decode( a.id, NULL, '#39' '#39', '#39'Default BOM'#39') as Default_BOM'
      '  from standard s,'
      '       partno p,'
      '       arinvt a'
      ' where p.standard_id = s.id'
      '   and p.arinvt_id = :arinvt_id'
      '   and p.arinvt_id = a.id(+)'
      '   and p.standard_id = a.standard_id(+)'
      '   '
      ''
      ' '
      ' '
      ' ')
    Left = 315
    Top = 243
    ParamData = <
      item
        Name = 'ARINVT_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object wwQryStandardMFGNO: TStringField
      DisplayLabel = 'Mfg #'
      DisplayWidth = 25
      FieldName = 'MFGNO'
      Origin = 'STANDARD.MFGNO'
      Size = 50
    end
    object wwQryStandardDEFAULT_BOM: TStringField
      DisplayLabel = 'Default BOM'
      DisplayWidth = 11
      FieldName = 'DEFAULT_BOM'
      Size = 11
    end
    object wwQryStandardSTANDARD_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'STANDARD_ID'
      Origin = 'PARTNO.STANDARD_ID'
      Visible = False
      Size = 0
    end
  end
  object wwQryWork_Center_OutSource: TFDQuery
    BeforeOpen = wwQryWork_CenterBeforeOpen
    Filtered = True
    OnFilterRecord = wwQryWork_CenterFilterRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct'
      '       w.cntr_type, '
      '       w.mfg_type,'
      '       w.eplant_id,'
      '       v.company,'
      '       w.mfgcell_id'
      '  from work_center w,'
      '       vendor v'
      ' where'
      '       mfg.lookup_mfgtype(w.mfg_type) = '#39'OUTSOURCE'#39
      '   and w.cntr_type = v.vendorno(+)')
    Left = 516
    Top = 130
    object wwQryWork_Center_OutSourceCNTR_TYPE: TStringField
      DisplayLabel = 'Vendor #'
      DisplayWidth = 10
      FieldName = 'CNTR_TYPE'
    end
    object wwQryWork_Center_OutSourceCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Size = 60
    end
    object wwQryWork_Center_OutSourceMFG_TYPE: TStringField
      DisplayLabel = 'Mfg Type'
      DisplayWidth = 10
      FieldName = 'MFG_TYPE'
      Size = 10
    end
    object wwQryWork_Center_OutSourceEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object wwQryWork_Center_OutSourceMFGCELL_ID: TBCDField
      FieldName = 'MFGCELL_ID'
      Size = 0
    end
  end
  object wwQryAux: TFDQuery
    BeforePost = wwQryAuxBeforePost
    AfterPost = TblAuxAfterPost
    AfterDelete = TblAuxAfterPost
    OnCalcFields = wwQryAuxCalcFields
    OnNewRecord = wwQryAuxNewRecord
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateObject = UpdateSQLAux
    SQL.Strings = (
      'select aux.id,'
      '       aux.aux_desc,'
      '       aux.aux_rate,'
      '       aux.how_many,'
      '       aux.eplant_id,'
      '       aux.division_id,'
      '       div.name as division_name,'
      '       aux.elements_id,'
      '       aux.setuphrs1,'
      '       aux.setuphrs2'
      '  from aux,'
      '       division div'
      ' where aux.division_id = div.id(+)'
      '   and misc.eplant_filter( aux.eplant_id )  = 1'
      '  '
      ' '
      ' '
      ' '
      ' ')
    Left = 346
    Top = 17
    object wwQryAuxAUX_DESC: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 17
      FieldName = 'AUX_DESC'
      Origin = 'AUX.AUX_DESC'
      FixedChar = True
      Size = 50
    end
    object wwQryAuxAUX_RATE: TBCDField
      DisplayLabel = 'Rate'
      DisplayWidth = 10
      FieldName = 'AUX_RATE'
      Origin = 'AUX.AUX_RATE'
      Size = 2
    end
    object wwQryAuxHOW_MANY: TBCDField
      DisplayLabel = 'How Many'
      DisplayWidth = 10
      FieldName = 'HOW_MANY'
      Origin = 'AUX.HOW_MANY'
      Size = 0
    end
    object wwQryAuxSETUPHRS1: TBCDField
      DisplayLabel = 'Setup 1'
      DisplayWidth = 10
      FieldName = 'SETUPHRS1'
      Origin = 'aux.SETUPHRS1'
      Size = 2
    end
    object wwQryAuxSETUPHRS2: TBCDField
      DisplayLabel = 'Setup 2'
      DisplayWidth = 10
      FieldName = 'SETUPHRS2'
      Origin = 'aux.SETUPHRS2'
      Size = 2
    end
    object wwQryAuxEPLant_ID_Disp: TFloatField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 8
      FieldKind = fkCalculated
      FieldName = 'EPLant_ID_Disp'
      Origin = 'aux.eplant_id'
      Calculated = True
    end
    object wwQryAuxDivisionName: TStringField
      DisplayLabel = 'Division Name'
      DisplayWidth = 25
      FieldKind = fkLookup
      FieldName = 'DivisionName'
      LookupDataSet = QryDivisionLookup
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'DIVISION_ID'
      Origin = 'div.name'
      Size = 25
      Lookup = True
    end
    object wwQryAuxElem_Descrip: TStringField
      DisplayLabel = 'Cost Element'
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'Elem_Descrip'
      Size = 30
      Calculated = True
    end
    object wwQryAuxEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 8
      FieldName = 'EPLANT_ID'
      Origin = 'AUX.EPLANT_ID'
      Visible = False
      Size = 0
    end
    object wwQryAuxDIVISION_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'DIVISION_ID'
      Origin = 'IQ.AUX.DIVISION_ID'
      Visible = False
      Size = 0
    end
    object wwQryAuxID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'AUX.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object wwQryAuxDIVISION_NAME: TStringField
      DisplayWidth = 25
      FieldName = 'DIVISION_NAME'
      Origin = 'div.name'
      Visible = False
      Size = 25
    end
    object wwQryAuxELEMENTS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ELEMENTS_ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQLAux: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into aux'
      
        '  (ID, AUX_DESC, AUX_RATE, HOW_MANY, EPLANT_ID, DIVISION_ID, ELE' +
        'MENTS_ID, '
      '   SETUPHRS1, SETUPHRS2)'
      'values'
      
        '  (:ID, :AUX_DESC, :AUX_RATE, :HOW_MANY, :EPLANT_ID, :DIVISION_I' +
        'D, :ELEMENTS_ID, '
      '   :SETUPHRS1, :SETUPHRS2)')
    ModifySQL.Strings = (
      'update aux'
      'set'
      '  ID = :ID,'
      '  AUX_DESC = :AUX_DESC,'
      '  AUX_RATE = :AUX_RATE,'
      '  HOW_MANY = :HOW_MANY,'
      '  EPLANT_ID = :EPLANT_ID,'
      '  DIVISION_ID = :DIVISION_ID,'
      '  ELEMENTS_ID = :ELEMENTS_ID,'
      '  SETUPHRS1 = :SETUPHRS1,'
      '  SETUPHRS2 = :SETUPHRS2'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from aux'
      'where'
      '  ID = :OLD_ID')
    Left = 376
    Top = 18
  end
  object SrcStandard_Pmeqmt: TDataSource
    DataSet = TblStandard_Pmeqmt
    Left = 422
    Top = 225
  end
  object TblStandard_Pmeqmt: TFDTable
    BeforeInsert = PostParentsBeforeEdit
    BeforeEdit = PostParentsBeforeEdit
    BeforePost = TblStandard_PmeqmtBeforePost
    AfterPost = TblStandard_PmeqmtAfterPost
    AfterDelete = TblStandard_PmeqmtAfterPost
    OnCalcFields = TblStandard_PmeqmtCalcFields
    OnNewRecord = TblStandard_PmeqmtNewRecord
    IndexFieldNames = 'STANDARD_ID'
    MasterSource = SrcStandard
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'STANDARD_PMEQMT'
    TableName = 'STANDARD_PMEQMT'
    Left = 440
    Top = 245
    object TblStandard_PmeqmtEqno: TStringField
      DisplayLabel = 'Tool Equipment #'
      DisplayWidth = 17
      FieldKind = fkCalculated
      FieldName = 'Eqno'
      Size = 25
      Calculated = True
    end
    object TblStandard_PmeqmtLocation: TStringField
      DisplayWidth = 21
      FieldKind = fkCalculated
      FieldName = 'Location'
      Size = 30
      Calculated = True
    end
    object TblStandard_PmeqmtIS_PRIMARY: TStringField
      DisplayLabel = 'Primary'
      DisplayWidth = 7
      FieldName = 'IS_PRIMARY'
      FixedChar = True
      Size = 1
    end
    object TblStandard_PmeqmtDescrip: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 37
      FieldKind = fkCalculated
      FieldName = 'Descrip'
      Size = 50
      Calculated = True
    end
    object TblStandard_PmeqmtService_IN: TStringField
      DisplayLabel = 'Service IN'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Service_IN'
      Calculated = True
    end
    object TblStandard_PmeqmtServiceOUT: TStringField
      DisplayLabel = 'Service OUT'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'ServiceOUT'
      Calculated = True
    end
    object TblStandard_PmeqmtPMEQMT_ID: TBCDField
      DisplayLabel = 'Tool Equipment #'
      DisplayWidth = 10
      FieldName = 'PMEQMT_ID'
      Required = True
      Visible = False
      Size = 0
    end
    object TblStandard_PmeqmtID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object TblStandard_PmeqmtSTANDARD_ID: TBCDField
      DisplayLabel = 'BOM ID'
      DisplayWidth = 10
      FieldName = 'STANDARD_ID'
      Required = True
      Visible = False
      Size = 0
    end
  end
  object QryHr_Job_Descrip: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       descrip'
      '  from hr_job_descrip'
      ' ')
    Left = 242
    Top = 290
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
  object PkSndOpFAB: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select opno, '
      '       opdesc, '
      '       op_class, '
      '       id,'
      '       pk_hide'
      '  from sndop'
      ' where op_class = '#39'FB'#39
      '   and misc.eplant_filter_include_nulls( eplant_id ) = 1'
      ' '
      ' '
      ' ')
    OnIQModify = PkSndOpFABIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 302
    Top = 462
    object StringField5: TStringField
      DisplayLabel = 'Process #'
      FieldName = 'OPNO'
      Size = 15
    end
    object StringField6: TStringField
      DisplayLabel = 'Description'
      FieldName = 'OPDESC'
      Size = 60
    end
    object StringField7: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 6
      FieldName = 'OP_CLASS'
      Size = 2
    end
    object FloatField2: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkSndOpFABPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      Size = 1
    end
  end
  object QryDivisionLookup: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, name, descrip from division'
      'order by name')
    Left = 520
    Top = 18
    object QryDivisionLookupNAME: TStringField
      DisplayLabel = 'Division Name'
      DisplayWidth = 25
      FieldName = 'NAME'
      Origin = 'IQ.DIVISION.NAME'
      Size = 25
    end
    object QryDivisionLookupDESCRIP: TStringField
      DisplayLabel = 'Division Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'IQ.DIVISION.DESCRIP'
      Size = 50
    end
    object QryDivisionLookupID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.DIVISION.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
  end
  object PkArinvtByProduct: TIQWebHpick
    BeforeOpen = AssignEPlantFilter
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.itemno    as itemno,'
      '       a.class     as class,'
      '       a.rev       as rev,  '
      '       a.descrip   as descrip,'
      '       a.descrip2  as descrip2,'
      '       a.unit      as unit, '
      '       c.custno    as custno,'
      '       c.company   as company,'
      '       a.id        as id,'
      '       a.eplant_id as eplant_id,'
      '       a.pk_hide   as pk_hide,'
      '       a.non_material as non_material'
      ' from arinvt a, arcusto c'
      'where a.arcusto_id = c.id(+)'
      '  and a.is_by_product = '#39'Y'#39
      ' '
      ' ')
    OnIQModify = PkArinvtByProductIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 211
    Top = 517
    object StringField8: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object StringField9: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Size = 2
    end
    object StringField10: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 3
      FieldName = 'REV'
      Size = 15
    end
    object StringField11: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Size = 100
    end
    object StringField12: TStringField
      DisplayLabel = 'Extended Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object StringField13: TStringField
      DisplayLabel = 'Unit'
      FieldName = 'UNIT'
      Size = 10
    end
    object StringField14: TStringField
      DisplayLabel = 'Customer #'
      FieldName = 'CUSTNO'
      Size = 10
    end
    object StringField15: TStringField
      DisplayLabel = 'Customer Name'
      FieldName = 'COMPANY'
      Size = 60
    end
    object FloatField3: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object FloatField4: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object StringField16: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object StringField17: TStringField
      DisplayLabel = 'Non-Material'
      FieldName = 'NON_MATERIAL'
      FixedChar = True
      Size = 1
    end
  end
  object PkSndOpAssy1: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select opno, '
      '       opdesc, '
      '       op_class, '
      '       id,'
      '       pk_hide'
      '  from sndop'
      ' where op_class = '#39'AS'#39
      '   and misc.eplant_filter_include_nulls( eplant_id ) = 1'
      ' '
      ' '
      ' ')
    OnIQModify = PkSndOpAssy1IQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 393
    Top = 462
    object StringField18: TStringField
      DisplayLabel = 'Process #'
      FieldName = 'OPNO'
      Size = 15
    end
    object StringField19: TStringField
      DisplayLabel = 'Description'
      FieldName = 'OPDESC'
      Size = 60
    end
    object StringField20: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 6
      FieldName = 'OP_CLASS'
      Size = 2
    end
    object FloatField5: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkSndOpAssy1PK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      Size = 1
    end
  end
  object PkArinvtForRework: TIQWebHpick
    BeforeOpen = AssignEPlantFilter
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.itemno    as itemno,'
      '       a.class     as class,'
      '       a.rev       as rev,  '
      '       a.descrip   as descrip,'
      '       a.descrip2  as descrip2,'
      '       a.unit      as unit, '
      '       c.custno    as custno,'
      '       c.company   as company,'
      '       a.id        as id,'
      '       a.eplant_id as eplant_id,'
      '       a.pk_hide   as pk_hide,'
      '       a.non_material as non_material'
      ' from arinvt a, v_arcusto c'
      'where a.arcusto_id = c.id(+)'
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 297
    Top = 517
    object StringField21: TStringField
      DisplayLabel = 'Item#'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object StringField22: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Size = 2
    end
    object StringField23: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 3
      FieldName = 'REV'
      Size = 15
    end
    object StringField24: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Size = 100
    end
    object StringField25: TStringField
      DisplayLabel = 'Ext. Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object StringField26: TStringField
      DisplayLabel = 'Unit'
      FieldName = 'UNIT'
      Size = 10
    end
    object StringField27: TStringField
      DisplayLabel = 'Cust#'
      FieldName = 'CUSTNO'
      Size = 10
    end
    object StringField28: TStringField
      DisplayLabel = 'Customer Name'
      FieldName = 'COMPANY'
      Size = 60
    end
    object FloatField6: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object FloatField7: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object StringField29: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object StringField30: TStringField
      DisplayLabel = 'Non Material'
      FieldName = 'NON_MATERIAL'
      FixedChar = True
      Size = 1
    end
  end
  object PkWorkCenterType: TIQWebHpick
    BeforeOpen = PkWorkCenterTypeBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select distinct'
      '       w.cntr_type as cntr_type, '
      '       w.mfg_type as mfg_type,'
      '       w.eplant_id as eplant_id,'
      '       w.mfgcell_id as mfgcell_id,'
      '       cell.descrip as mfgcell_descrip'
      '  from work_center w,'
      '       mfgcell cell'
      ' where '
      '       misc.eplant_filter(w.eplant_id) = 1'
      '   and ( :mfgcell_id > 0 and w.mfgcell_id = :mfgcell_id'
      '         or'
      '         :mfgcell_id = 0 and rtrim(w.mfg_type) = :mfg_type )'
      '   and w.mfgcell_id = cell.id(+)'
      ''
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 510
    Top = 462
    ParamData = <
      item
        Name = 'mfgcell_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'mfg_type'
        DataType = ftString
        ParamType = ptInput
      end>
    object PkWorkCenterTypeCNTR_TYPE: TStringField
      DisplayLabel = 'Type/Size'
      FieldName = 'CNTR_TYPE'
      FixedChar = True
    end
    object PkWorkCenterTypeMFG_TYPE: TStringField
      DisplayLabel = 'Mfg Type'
      FieldName = 'MFG_TYPE'
      FixedChar = True
      Size = 10
    end
    object PkWorkCenterTypeEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object PkWorkCenterTypeMFGCELL_ID: TBCDField
      FieldName = 'MFGCELL_ID'
      Visible = False
      Size = 0
    end
    object PkWorkCenterTypeMFGCELL_DESCRIP: TStringField
      DisplayLabel = 'MfgCell'
      FieldName = 'MFGCELL_DESCRIP'
      FixedChar = True
      Size = 25
    end
  end
  object PkWorkCenterOutsourceType: TIQWebHpick
    BeforeOpen = PkWorkCenterTypeBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select distinct'
      '       w.cntr_type as cntr_type, '
      '       w.mfg_type as mfg_type,'
      '       w.eplant_id as eplant_id,'
      '       v.company  as company,'
      '       w.mfgcell_id as mfgcell_id,'
      '       cell.descrip as mfgcell_descrip'
      '  from work_center w,'
      '       vendor v,'
      '       mfgcell cell'
      ' where '
      '       misc.eplant_filter(w.eplant_id) = 1'
      '   and w.cntr_type = v.vendorno(+)'
      '   and ( :mfgcell_id > 0 and w.mfgcell_id = :mfgcell_id'
      '         or'
      '         :mfgcell_id = 0 and rtrim(w.mfg_type) = :mfg_type )'
      '   and w.mfgcell_id = cell.id(+)'
      ''
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 395
    Top = 517
    ParamData = <
      item
        Name = 'mfgcell_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'mfg_type'
        DataType = ftString
        ParamType = ptInput
      end>
    object PkWorkCenterOutsourceTypeCNTR_TYPE: TStringField
      DisplayLabel = 'Vendor #'
      FieldName = 'CNTR_TYPE'
      FixedChar = True
    end
    object PkWorkCenterOutsourceTypeCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Size = 60
    end
    object PkWorkCenterOutsourceTypeMFG_TYPE: TStringField
      DisplayLabel = 'Mfg Type'
      FieldName = 'MFG_TYPE'
      FixedChar = True
      Size = 10
    end
    object PkWorkCenterOutsourceTypeEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object PkWorkCenterOutsourceTypeMFGCELL_ID: TBCDField
      FieldName = 'MFGCELL_ID'
      Visible = False
      Size = 0
    end
    object PkWorkCenterOutsourceTypeMFGCELL_DESCRIP: TStringField
      DisplayLabel = 'MfgCell'
      FieldName = 'MFGCELL_DESCRIP'
      FixedChar = True
      Size = 25
    end
  end
  object SrcStandardPrEmp: TDataSource
    DataSet = TblStandard_Pr_Emp
    Left = 42
    Top = 358
  end
  object TblStandard_Pr_Emp: TFDTable
    BeforeInsert = PostParentsBeforeEdit
    BeforeEdit = PostParentsBeforeEdit
    BeforePost = AssignIDBeforePost
    OnCalcFields = TblStandard_Pr_EmpCalcFields
    OnNewRecord = TblStandard_Pr_EmpNewRecord
    IndexFieldNames = 'STANDARD_ID'
    MasterSource = SrcStandard
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'STANDARD_PR_EMP'
    TableName = 'STANDARD_PR_EMP'
    Left = 42
    Top = 379
    object TblStandard_Pr_EmpEmpNo: TStringField
      DisplayLabel = 'Employee #'
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'EmpNo'
      Size = 25
      Calculated = True
    end
    object TblStandard_Pr_EmpFirstName: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'FirstName'
      ReadOnly = True
      Size = 30
      Calculated = True
    end
    object TblStandard_Pr_EmpMiddleName: TStringField
      DisplayLabel = 'Middle Name'
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'MiddleName'
      ReadOnly = True
      Calculated = True
    end
    object TblStandard_Pr_EmpLastName: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'LastName'
      ReadOnly = True
      Size = 30
      Calculated = True
    end
    object TblStandard_Pr_EmpID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Size = 0
    end
    object TblStandard_Pr_EmpSTANDARD_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'STANDARD_ID'
      Visible = False
      Size = 0
    end
    object TblStandard_Pr_EmpPR_EMP_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PR_EMP_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcStandardEmpDocs: TDataSource
    DataSet = QryStandardEmpDocs
    Left = 151
    Top = 360
  end
  object QryStandardEmpDocs: TFDQuery
    BeforeInsert = AbortInsert
    AfterPost = ApplyUpdate
    BeforeDelete = QryStandardEmpDocsBeforeDelete
    AfterDelete = ApplyUpdate
    OnCalcFields = QryStandardEmpDocsCalcFields
    MasterSource = SrcStandardPrEmp
    MasterFields = 'STANDARD_ID;ID'
    DetailFields = 'ID'
    OnUpdateRecord = QryStandardEmpDocsUpdateRecord
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
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
      '        from'
      '             v_external_docs v'
      '       where v.source = '#39'STANDARD'#39
      '         and v.source_id = :standard_id ) a,'
      ''
      '    ( select d.id,'
      '             r.id as assigned_doc_revision_id,'
      '             r.revision as assigned_revision,'
      '             r.external_doc_id,'
      '             d.certified_date'
      '        from'
      '             standard_pr_emp e,'
      '             standard_pr_emp_doc d,'
      '             doc_revision r'
      '       where'
      '             e.id = :id'
      '         and e.id = d.standard_pr_emp_id'
      '         and d.doc_revision_id = r.id(+)) b'
      ' where'
      '        a.external_doc_id = b.external_doc_id(+)'
      ''
      '')
    Left = 151
    Top = 377
    ParamData = <
      item
        Name = 'STANDARD_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 320730000c
      end
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 140000c
      end>
    object QryStandardEmpDocsDOC_DESCRIP: TStringField
      DisplayLabel = 'Document Description'
      DisplayWidth = 38
      FieldName = 'DOC_DESCRIP'
      Size = 250
    end
    object QryStandardEmpDocsCURRENT_REVISION: TStringField
      DisplayLabel = 'Document~Revision'
      DisplayWidth = 10
      FieldName = 'CURRENT_REVISION'
    end
    object QryStandardEmpDocsASSIGNED_REVISION: TStringField
      DisplayLabel = 'Last Certified~Revision'
      DisplayWidth = 12
      FieldName = 'ASSIGNED_REVISION'
    end
    object QryStandardEmpDocsStatus: TStringField
      DisplayWidth = 29
      FieldKind = fkCalculated
      FieldName = 'Status'
      Size = 50
      Calculated = True
    end
    object QryStandardEmpDocsCERTIFIED_DATE: TDateTimeField
      DisplayLabel = 'Certified Date'
      DisplayWidth = 18
      FieldName = 'CERTIFIED_DATE'
    end
    object QryStandardEmpDocsCERT_TRAINING_DESCRIP: TStringField
      DisplayLabel = 'Certification Test'
      DisplayWidth = 50
      FieldName = 'CERT_TRAINING_DESCRIP'
      Size = 50
    end
    object QryStandardEmpDocsCERT_TRAINING_ID: TBCDField
      DisplayLabel = 'Certification Test ID'
      DisplayWidth = 10
      FieldName = 'CERT_TRAINING_ID'
      Visible = False
      Size = 0
    end
    object QryStandardEmpDocsCURRENT_DOC_REVISION_ID: TBCDField
      FieldName = 'CURRENT_DOC_REVISION_ID'
      Visible = False
      Size = 0
    end
    object QryStandardEmpDocsASSIGNED_DOC_REVISION_ID: TBCDField
      FieldName = 'ASSIGNED_DOC_REVISION_ID'
      Visible = False
      Size = 0
    end
    object QryStandardEmpDocsID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
  end
  object PkEmp: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       empno,'
      '       first_name,'
      '       middle_name,'
      '       last_name'
      ' from pr_emp'
      'where nvl(pk_hide, '#39'N'#39') <> '#39'Y'#39)
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 600
    Top = 462
    object PkEmpID: TBCDField
      FieldName = 'ID'
      Origin = 'PR_EMP.ID'
      Visible = False
      Size = 0
    end
    object PkEmpEMPNO: TStringField
      DisplayLabel = 'Employee #'
      FieldName = 'EMPNO'
      Origin = 'PR_EMP.EMPNO'
      Size = 10
    end
    object PkEmpFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      FieldName = 'FIRST_NAME'
      Origin = 'PR_EMP.FIRST_NAME'
      Size = 30
    end
    object PkEmpMIDDLE_NAME: TStringField
      DisplayLabel = 'Middle Name'
      FieldName = 'MIDDLE_NAME'
      Origin = 'PR_EMP.MIDDLE_NAME'
      Size = 30
    end
    object PkEmpLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      FieldName = 'LAST_NAME'
      Origin = 'PR_EMP.LAST_NAME'
      Size = 30
    end
  end
  object PkAuxCostElements: TIQWebHpick
    Tag = 1
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select'
      '       id,'
      '       elem_descrip,'
      '       elem_type,'
      '       glacct_id'
      'from'
      '       elements'
      ' where'
      '       elem_type = '#39'OVERHEAD'#39
      ''
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 600
    Top = 517
    object PkAuxCostElementsID: TBCDField
      FieldName = 'ID'
      Origin = 'id'
      Visible = False
      Size = 0
    end
    object PkAuxCostElementsELEM_DESCRIP: TStringField
      DisplayLabel = 'Cost Element'
      FieldName = 'ELEM_DESCRIP'
      Origin = 'elem_descrip'
      Size = 30
    end
    object PkAuxCostElementsELEM_TYPE: TStringField
      DisplayLabel = 'Type'
      FieldName = 'ELEM_TYPE'
      Origin = 'elem_type'
      Size = 10
    end
    object PkAuxCostElementsGLACCT_ID: TBCDField
      DisplayLabel = 'GL Account'
      FieldName = 'GLACCT_ID'
      Origin = 'glacct_id'
      Visible = False
      Size = 0
    end
  end
  object PkQuote: TIQWebHpick
    BeforeOpen = PkQuoteBeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select quote.rfq as RFQ,'
      '       quote.project as project,'
      '       quote.quote_date as quote_date,'
      '       quote.quote_rev  as quote_rev,'
      '       qinvt.descrip as descrip,'
      '       qinvt.itemno as itemno,'
      '       qinvt.descrip2 as descrip2,'
      '       a.company  as company,'
      '       quote.id as id,'
      '       quote.eplant_id as eplant_id,'
      '       quote.mfg_type as mfg_type'
      '  from v_arcusto a,'
      '       Quote,'
      '       Qinvt'
      ' where quote.id = qinvt.quote_id(+)'
      '   and a.id(+) = quote.arcusto_id'
      '   and misc.eplant_filter_include_nulls(quote.eplant_id) = 1'
      '   and qinvt.itemno in '
      '       (select a1.itemno from arinvt a1, partno p '
      '         where p.standard_id = :standard_id '
      '           and p.arinvt_id = a1.id)'
      '        '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    UserBtn1Hint = 'ByName()'
    ForceShowWaitForPrompt = False
    Left = 37
    Top = 578
    ParamData = <
      item
        Name = 'standard_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkQuoteID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object PkQuoteRFQ: TStringField
      DisplayLabel = 'RFQ #'
      DisplayWidth = 10
      FieldName = 'RFQ'
    end
    object PkQuotePROJECT: TStringField
      DisplayLabel = 'RFQ Description'
      FieldName = 'PROJECT'
      Size = 255
    end
    object PkQuoteQUOTE_DATE: TDateTimeField
      DisplayLabel = 'Date'
      FieldName = 'QUOTE_DATE'
    end
    object PkQuoteQUOTE_REV: TBCDField
      DisplayLabel = 'Revision'
      DisplayWidth = 3
      FieldName = 'QUOTE_REV'
      Size = 0
    end
    object PkQuoteITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object PkQuoteDESCRIP: TStringField
      DisplayLabel = 'Item Description'
      FieldName = 'DESCRIP'
      Size = 100
    end
    object PkQuoteDESCRIP2: TStringField
      DisplayLabel = 'Extended Item Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object PkQuoteCOMPANY: TStringField
      DisplayLabel = 'Customer Name'
      FieldName = 'COMPANY'
      Size = 60
    end
    object PkQuoteEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
    object PkQuoteMFG_TYPE: TStringField
      DisplayLabel = 'Manufacturing Type'
      FieldName = 'MFG_TYPE'
      Size = 10
    end
  end
  object PkSalesConfigTemplatesForThisStandard: TIQWebHpick
    Tag = 1
    BeforeOpen = PkSalesConfigTemplatesForThisStandardBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'SELECT c.id AS id, c.descrip AS descrip, a.itemno AS arinvt_item' +
        'no,'
      
        '       a.descrip AS arinvt_descrip, a.descrip2 AS arinvt_descrip' +
        '2,'
      
        '       a.class AS arinvt_class, a.rev AS arinvt_rev, c.price AS ' +
        'price,'
      
        '       c.pk_hide AS pk_hide, c.eplant_id AS eplant_id, d.name AS' +
        ' eplant_name'
      '  FROM sales_config c, arinvt a, eplant d'
      ' WHERE a.id = c.arinvt_id AND'
      
        '       iqms.misc.eplant_filter_include_nulls(c.eplant_id) = 1 AN' +
        'D'
      '       d.id(+) = c.eplant_id AND'
      '       a.standard_id = :STANDARD_ID')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 131
    Top = 583
    ParamData = <
      item
        Name = 'STANDARD_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkSalesConfigTemplatesForThisStandardID: TBCDField
      FieldName = 'ID'
      Origin = 'c.id'
      Visible = False
      Size = 0
    end
    object PkSalesConfigTemplatesForThisStandardDESCRIP: TStringField
      DisplayLabel = 'Template'
      DisplayWidth = 22
      FieldName = 'DESCRIP'
      Origin = 'c.descrip'
      Size = 60
    end
    object PkSalesConfigTemplatesForThisStandardARINVT_ITEMNO: TStringField
      DisplayLabel = 'Inventory Item #'
      DisplayWidth = 12
      FieldName = 'ARINVT_ITEMNO'
      Origin = 'a.itemno'
      FixedChar = True
      Size = 50
    end
    object PkSalesConfigTemplatesForThisStandardARINVT_DESCRIP: TStringField
      DisplayLabel = 'Inventory Item Description'
      DisplayWidth = 18
      FieldName = 'ARINVT_DESCRIP'
      Origin = 'a.descrip'
      Size = 100
    end
    object PkSalesConfigTemplatesForThisStandardARINVT_DESCRIP2: TStringField
      DisplayLabel = 'Inventory Item Extended Description'
      DisplayWidth = 18
      FieldName = 'ARINVT_DESCRIP2'
      Origin = 'a.descrip2'
      Size = 100
    end
    object PkSalesConfigTemplatesForThisStandardARINVT_CLASS: TStringField
      DisplayLabel = 'Inventory Item Class'
      FieldName = 'ARINVT_CLASS'
      Origin = 'a.class'
      FixedChar = True
      Size = 2
    end
    object PkSalesConfigTemplatesForThisStandardARINVT_REV: TStringField
      DisplayLabel = 'Inventory Item Revision'
      DisplayWidth = 12
      FieldName = 'ARINVT_REV'
      Origin = 'a.rev'
      FixedChar = True
      Size = 15
    end
    object PkSalesConfigTemplatesForThisStandardPRICE: TFMTBCDField
      DisplayLabel = 'Price'
      FieldName = 'PRICE'
      Origin = 'c.price'
      Visible = False
      Size = 6
    end
    object PkSalesConfigTemplatesForThisStandardEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 18
      FieldName = 'EPLANT_NAME'
      Origin = 'd.name'
      Size = 30
    end
    object PkSalesConfigTemplatesForThisStandardEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'c.eplant_id'
      Size = 0
    end
    object PkSalesConfigTemplatesForThisStandardPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'c.pk_hide'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object PkVendorAka: TIQWebHpick
    BeforeOpen = AssignEPlantFilter
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select k.id as aka_id,'
      '       k.arinvt_id as id,'
      '       k.vendor_id as vendor_id,'
      '       k.vend_itemno as vendor_itemno,'
      '       k.vend_descrip as vendor_descrip,'
      '       k.vend_descrip2 as vendor_descrip2,'
      '       k.vend_rev as vendor_rev,'
      '       v.vendorno as vendorno,'
      '       v.company as vendor,'
      '       a.eplant_id as eplant_id,'
      '       a.onhand as onhand,'
      '       a.itemno as arinvt_itemno,'
      '       a.descrip as arinvt_descrip,'
      '       a.descrip2 as arinvt_descrip2,'
      '       a.rev as arinvt_rev,'
      '       a.NON_CONFORM_TOTAL as NON_CONFORM_TOTAL,'
      '       a.NON_ALLOCATE_TOTAL as NON_ALLOCATE_TOTAL'
      '  from arinvt_vendors k,'
      '       vendor v,'
      '       arinvt a'
      '  where k.vendor_id = v.id'
      '    and k.arinvt_id = a.id(+)')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 320
    Top = 590
    object PkVendorAkaAKA_ID: TBCDField
      FieldName = 'AKA_ID'
      Origin = 'IQ.ARINVT_VENDORS.ID'
      Visible = False
      Size = 0
    end
    object PkVendorAkaVENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Origin = 'IQ.ARINVT_VENDORS.VENDOR_ID'
      Visible = False
      Size = 0
    end
    object PkVendorAkaVENDOR_ITEMNO: TStringField
      DisplayLabel = 'AKA Item#'
      FieldName = 'VENDOR_ITEMNO'
      Origin = 'IQ.ARINVT_VENDORS.VEND_ITEMNO'
      Size = 25
    end
    object PkVendorAkaVENDOR_DESCRIP: TStringField
      DisplayLabel = 'AKA Descrip'
      FieldName = 'VENDOR_DESCRIP'
      Origin = 'IQ.ARINVT_VENDORS.VEND_DESCRIP'
      Size = 35
    end
    object PkVendorAkaVENDOR_REV: TStringField
      DisplayLabel = 'AKA Rev.'
      FieldName = 'VENDOR_REV'
      Origin = 'IQ.ARINVT_VENDORS.VEND_REV'
      Size = 15
    end
    object PkVendorAkaVENDORNO: TStringField
      DisplayLabel = 'Vendor#'
      FieldName = 'VENDORNO'
      Origin = 'IQ.VENDOR.VENDORNO'
      FixedChar = True
      Size = 10
    end
    object PkVendorAkaVENDOR: TStringField
      DisplayLabel = 'Vendor'
      FieldName = 'VENDOR'
      Origin = 'IQ.VENDOR.COMPANY'
      FixedChar = True
      Size = 60
    end
    object PkVendorAkaEPLANT_ID: TBCDField
      DisplayLabel = 'Eplant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object PkVendorAkaONHAND: TBCDField
      DisplayLabel = 'On Hand'
      FieldName = 'ONHAND'
    end
    object PkVendorAkaARINVT_ITEMNO: TStringField
      DisplayLabel = 'Inventory Item #'
      FieldName = 'ARINVT_ITEMNO'
      FixedChar = True
      Size = 50
    end
    object PkVendorAkaARINVT_DESCRIP: TStringField
      DisplayLabel = 'Inventory Item Description'
      FieldName = 'ARINVT_DESCRIP'
      Size = 100
    end
    object PkVendorAkaARINVT_DESCRIP2: TStringField
      DisplayLabel = 'Ext. Description'
      FieldName = 'ARINVT_DESCRIP2'
      Size = 100
    end
    object PkVendorAkaARINVT_REV: TStringField
      DisplayLabel = 'Rev'
      FieldName = 'ARINVT_REV'
      FixedChar = True
      Size = 15
    end
    object PkVendorAkaNON_CONFORM_TOTAL: TBCDField
      DisplayLabel = 'Non-Conform Qty'
      FieldName = 'NON_CONFORM_TOTAL'
    end
    object PkVendorAkaNON_ALLOCATE_TOTAL: TBCDField
      DisplayLabel = 'Non-Allocate Qty'
      FieldName = 'NON_ALLOCATE_TOTAL'
    end
    object PkVendorAkaVENDOR_DESCRIP2: TStringField
      DisplayLabel = 'AKA Ext Description'
      FieldName = 'VENDOR_DESCRIP2'
      Size = 100
    end
    object PkVendorAkaID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object PkVendorAkaPk: TIQWebHpick
    BeforeOpen = AssignEPlantFilter
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select k.id as aka_id,'
      '       k.arinvt_id as id,'
      '       k.vendor_id as vendor_id,'
      '       k.vend_itemno as vendor_itemno,'
      '       k.vend_descrip as vendor_descrip,'
      '       k.vend_descrip2 as vendor_descrip2,'
      '       k.vend_rev as vendor_rev,'
      '       v.vendorno as vendorno,'
      '       v.company as vendor,'
      '       a.eplant_id as eplant_id,'
      '       a.onhand as onhand,'
      '       a.itemno as arinvt_itemno,'
      '       a.descrip as arinvt_descrip,'
      '       a.descrip2 as arinvt_descrip2,'
      '       a.rev as arinvt_rev,'
      '       a.NON_CONFORM_TOTAL as NON_CONFORM_TOTAL,'
      '       a.NON_ALLOCATE_TOTAL as NON_ALLOCATE_TOTAL'
      '  from arinvt_vendors k,'
      '       vendor v,'
      '       arinvt a'
      '  where k.vendor_id = v.id'
      '    and k.arinvt_id = a.id'
      '    and a.class = '#39'PK'#39
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 400
    Top = 592
    object FloatField8: TBCDField
      FieldName = 'AKA_ID'
      Origin = 'IQ.ARINVT_VENDORS.ID'
      Visible = False
      Size = 0
    end
    object FloatField10: TBCDField
      FieldName = 'VENDOR_ID'
      Origin = 'IQ.ARINVT_VENDORS.VENDOR_ID'
      Visible = False
      Size = 0
    end
    object StringField31: TStringField
      DisplayLabel = 'AKA Item#'
      FieldName = 'VENDOR_ITEMNO'
      Origin = 'IQ.ARINVT_VENDORS.VEND_ITEMNO'
      Size = 25
    end
    object StringField32: TStringField
      DisplayLabel = 'AKA Descrip'
      FieldName = 'VENDOR_DESCRIP'
      Origin = 'IQ.ARINVT_VENDORS.VEND_DESCRIP'
      Size = 35
    end
    object StringField33: TStringField
      DisplayLabel = 'AKA Rev.'
      FieldName = 'VENDOR_REV'
      Origin = 'IQ.ARINVT_VENDORS.VEND_REV'
      Size = 15
    end
    object StringField34: TStringField
      DisplayLabel = 'Vendor#'
      FieldName = 'VENDORNO'
      Origin = 'IQ.VENDOR.VENDORNO'
      FixedChar = True
      Size = 10
    end
    object StringField35: TStringField
      DisplayLabel = 'Vendor'
      FieldName = 'VENDOR'
      Origin = 'IQ.VENDOR.COMPANY'
      FixedChar = True
      Size = 60
    end
    object FloatField11: TBCDField
      DisplayLabel = 'Eplant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object FloatField12: TBCDField
      DisplayLabel = 'On Hand'
      FieldName = 'ONHAND'
    end
    object StringField36: TStringField
      DisplayLabel = 'Inventory Item #'
      FieldName = 'ARINVT_ITEMNO'
      FixedChar = True
      Size = 50
    end
    object StringField37: TStringField
      DisplayLabel = 'Inventory Item Description'
      FieldName = 'ARINVT_DESCRIP'
      Size = 100
    end
    object StringField38: TStringField
      DisplayLabel = 'Ext. Description'
      FieldName = 'ARINVT_DESCRIP2'
      Size = 100
    end
    object StringField39: TStringField
      DisplayLabel = 'Rev'
      FieldName = 'ARINVT_REV'
      FixedChar = True
      Size = 15
    end
    object FloatField13: TBCDField
      DisplayLabel = 'Non-Conform Qty'
      FieldName = 'NON_CONFORM_TOTAL'
    end
    object FloatField14: TBCDField
      DisplayLabel = 'Non-Allocate Qty'
      FieldName = 'NON_ALLOCATE_TOTAL'
    end
    object StringField40: TStringField
      DisplayLabel = 'AKA Ext Description'
      FieldName = 'VENDOR_DESCRIP2'
      Size = 100
    end
    object PkVendorAkaPkID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.ARINVT_VENDORS.ARINVT_ID'
      Visible = False
      Size = 0
    end
  end
end
