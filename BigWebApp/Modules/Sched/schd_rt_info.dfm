object FrmSchedRTInfo: TFrmSchedRTInfo
  Left = 207
  Top = 223
  ClientHeight = 225
  ClientWidth = 875
  Caption = 'RT Info'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 236
    Top = 0
    Width = 6
    Height = 225
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 236
    Height = 225
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    Caption = ''
    object wwDataInspector1: TwwDataInspector
      Left = 1
      Top = 1
      Width = 234
      Height = 223
      DisableThemes = False
      Align = alClient
      TabOrder = 0
      DataSource = SrcSingleMachine
      Items = <
        item
          DataSource = SrcSingleMachine
          DataField = 'STD_CYCLE'
          Caption = 'Std Cycle'
          WordWrap = False
        end
        item
          DataSource = SrcSingleMachine
          DataField = 'LAST_CYCLE'
          Caption = 'Last Cycle'
          WordWrap = False
        end
        item
          DataSource = SrcSingleMachine
          DataField = 'AVG_CYCLE'
          Caption = 'Avg Cycle'
          WordWrap = False
        end
        item
          DataSource = SrcSingleMachine
          DataField = 'SHIFT_UP'
          Caption = 'Shift Up Hours'
          WordWrap = False
        end
        item
          DataSource = SrcSingleMachine
          DataField = 'HOURS_LEFT'
          Caption = 'Hours To Go'
          WordWrap = False
        end
        item
          DataSource = SrcSingleMachine
          DataField = 'SHIFT_DWN'
          Caption = 'Shift Down Time'
          WordWrap = False
        end
        item
          DataSource = SrcSingleMachine
          DataField = 'Job_Down_Time'
          Caption = 'Continuously Down'
          WordWrap = False
        end
        item
          DataSource = SrcSingleMachine
          DataField = 'CYCLES_TOTAL'
          Caption = 'Cycles To Date'
          WordWrap = False
        end
        item
          DataSource = SrcSingleMachine
          DataField = 'CYCLES_DAY'
          Caption = 'Daily Cycles'
          WordWrap = False
        end
        item
          DataSource = SrcSingleMachine
          DataField = 'CYCLES_SHFT'
          Caption = 'Shift Cycles'
          WordWrap = False
        end
        item
          DataSource = SrcSingleMachine
          DataField = 'CYCLESREQ'
          Caption = 'Cycles Required'
          WordWrap = False
        end
        item
          DataSource = SrcSingleMachine
          DataField = 'CYCLES_LEFT'
          Caption = 'Cycles Left'
          WordWrap = False
        end
        item
          DataSource = SrcSingleMachine
          DataField = 'EFF_PRCNT'
          Caption = 'Cycle Effective %'
          WordWrap = False
        end
        item
          DataSource = SrcSingleMachine
          DataField = 'CYCLES_PLANNED'
          Caption = 'Planned Cycles'
          WordWrap = False
        end>
      DefaultRowHeight = 19
      CaptionWidth = 119
      Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'Tahoma'
      CaptionFont.Style = []
      LineStyleCaption = ovDottedLine
      LineStyleData = ovDottedLine
    end
  end
  object Panel2: TUniPanel
    Left = 242
    Top = 0
    Width = 633
    Height = 225
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object wwDBGrid1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 631
      Height = 223
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 414
      IQComponents.Grid.Height = 137
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcParts
      IQComponents.Grid.LoadMask.Message = 'Loading data...'
      IQComponents.Grid.Align = alClient
      IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
      IQComponents.Grid.TabOrder = 0
      IQComponents.Navigator.Left = 410
      IQComponents.Navigator.Top = 0
      IQComponents.Navigator.Width = 241
      IQComponents.Navigator.Height = 25
      IQComponents.Navigator.Hint = ''
      IQComponents.Navigator.ShowHint = True
      IQComponents.Navigator.DataSource = SrcParts
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 414
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 137
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcParts
      Columns = <
        item
          FieldName = 'ITEMNO'
          Title.Caption = 'Item #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Item Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TOTAL_QTY'
          Title.Caption = 'Total Parts'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'FLOOR_DISPO_QTY'
          Title.Caption = 'Total Floor Dispo'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SHIFT_QTY'
          Title.Caption = 'Shift Parts'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DAY_QTY'
          Title.Caption = 'Daily Parts'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PARTSTOGO'
          Title.Caption = 'Parts To Go'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ACTCAV'
          Title.Caption = 'Act Cav'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'STDCAV'
          Title.Caption = 'Std Cav'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'HOURSTOGO'
          Title.Caption = 'Hours To Go'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'BADPARTS'
          Title.Caption = 'Bad Parts'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SCRAP_PRCNT'
          Title.Caption = 'Scrap %'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Planned_Qty'
          Title.Caption = 'Planned Qty'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      TabsVisible = True
      Marker = 0
    end
  end
  object SrcSingleMachine: TDataSource
    DataSet = QrySingleMachine
    Left = 132
    Top = 62
  end
  object QrySingleMachine: TFDQuery
    BeforeOpen = QrySingleMachineBeforeOpen
    OnCalcFields = QrySingleMachineCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select v.eqno,'
      '       v.mfgno,'
      '       v.bucket,'
      '       v.work_center_id,'
      '       v.custno,'
      '       v.company,'
      '       v.std_cycle,'
      '       v.last_cycle,'
      '       v.avg_cycle,'
      '       v.cycles_shft,'
      '       v.cycles_day,'
      '       v.cycles_total,'
      '       v.cyclesreq,'
      '       v.cycles_left,'
      '       v.illum_rt_id,'
      '       v.eff_prcnt,'
      '       v.shift_up,'
      '       v.shift_dwn,'
      '       v.hours_left,'
      '       v.down_code,'
      '       v.down_descrip,'
      '       v.dwn_st_time,'
      '       v.orig_dwn_st_time,'
      '       v.mfgcell,'
      '       v.mfg_type,'
      '       v.next_mfgno,'
      '       v.next_material_itemno,'
      '       v.next_material_descrip,'
      '       v.orderno,'
      '       v.cntr_desc,'
      '       v.rtserver_not_signaled,'
      '       v.next_orderno,'
      '       v.priority_note,'
      '       v.cntr_sched_id,'
      '       v.next_priority_note,'
      '       v.workorder_id,'
      '       v.eplant_id,'
      '       v.operator,'
      '       v.pk_hide,'
      '       v.mfgno_disp,'
      '       v.force_reason,'
      '       v.pmwo_id,'
      '       v.is_virtual,'
      '       v.parent_work_center_id,'
      '       v.lookup_mfgtype,'
      '       i.cycles_planned,'
      '       i.priority_note2'
      '  from V_RT_SINGLE_MACHINE v,'
      '       hist_illum_rt i'
      ' where v.work_center_id = :work_center_id'
      '   and v.illum_rt_id = i.id'
      '')
    Left = 133
    Top = 76
    ParamData = <
      item
        Name = 'work_center_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QrySingleMachineEQNO: TStringField
      FieldName = 'EQNO'
      Size = 60
    end
    object QrySingleMachineMFGNO: TStringField
      FieldName = 'MFGNO'
      Size = 50
    end
    object QrySingleMachineBUCKET: TBCDField
      FieldName = 'BUCKET'
      Size = 0
    end
    object QrySingleMachineWORK_CENTER_ID: TBCDField
      FieldName = 'WORK_CENTER_ID'
      Size = 0
    end
    object QrySingleMachineCUSTNO: TStringField
      FieldName = 'CUSTNO'
      Size = 10
    end
    object QrySingleMachineCOMPANY: TStringField
      FieldName = 'COMPANY'
      Size = 60
    end
    object QrySingleMachineSTD_CYCLE: TFMTBCDField
      FieldName = 'STD_CYCLE'
      DisplayFormat = '#####0.00'
      Size = 38
    end
    object QrySingleMachineLAST_CYCLE: TFMTBCDField
      FieldName = 'LAST_CYCLE'
      Size = 38
    end
    object QrySingleMachineAVG_CYCLE: TFMTBCDField
      FieldName = 'AVG_CYCLE'
      DisplayFormat = '#####0.00'
      Size = 38
    end
    object QrySingleMachineCYCLES_SHFT: TFMTBCDField
      FieldName = 'CYCLES_SHFT'
      Size = 38
    end
    object QrySingleMachineCYCLES_DAY: TFMTBCDField
      FieldName = 'CYCLES_DAY'
      Size = 38
    end
    object QrySingleMachineCYCLES_TOTAL: TFMTBCDField
      FieldName = 'CYCLES_TOTAL'
      Size = 38
    end
    object QrySingleMachineCYCLESREQ: TFMTBCDField
      FieldName = 'CYCLESREQ'
      Size = 38
    end
    object QrySingleMachineCYCLES_LEFT: TFMTBCDField
      FieldName = 'CYCLES_LEFT'
      Size = 38
    end
    object QrySingleMachineEFF_PRCNT: TFMTBCDField
      FieldName = 'EFF_PRCNT'
      DisplayFormat = '###0.00'
      Size = 38
    end
    object QrySingleMachineSHIFT_UP: TFMTBCDField
      FieldName = 'SHIFT_UP'
      DisplayFormat = '#####0.00'
      Size = 38
    end
    object QrySingleMachineSHIFT_DWN: TFMTBCDField
      FieldName = 'SHIFT_DWN'
      DisplayFormat = '#####0.00'
      Size = 38
    end
    object QrySingleMachineHOURS_LEFT: TFMTBCDField
      FieldName = 'HOURS_LEFT'
      DisplayFormat = '#####0.00'
      Size = 38
    end
    object QrySingleMachineDOWN_CODE: TStringField
      FieldName = 'DOWN_CODE'
      Size = 5
    end
    object QrySingleMachineDWN_ST_TIME: TDateTimeField
      FieldName = 'DWN_ST_TIME'
    end
    object QrySingleMachineMFGCELL: TStringField
      FieldName = 'MFGCELL'
      Size = 15
    end
    object QrySingleMachineMFG_TYPE: TStringField
      FieldName = 'MFG_TYPE'
      Size = 10
    end
    object QrySingleMachineNEXT_MFGNO: TStringField
      FieldName = 'NEXT_MFGNO'
      Size = 50
    end
    object QrySingleMachineNEXT_MATERIAL_ITEMNO: TStringField
      FieldName = 'NEXT_MATERIAL_ITEMNO'
      Size = 50
    end
    object QrySingleMachineNEXT_MATERIAL_DESCRIP: TStringField
      FieldName = 'NEXT_MATERIAL_DESCRIP'
      Size = 100
    end
    object QrySingleMachineILLUM_RT_ID: TBCDField
      FieldName = 'ILLUM_RT_ID'
      Size = 0
    end
    object QrySingleMachineDOWN_DESCRIP: TStringField
      FieldName = 'DOWN_DESCRIP'
    end
    object QrySingleMachineORIG_DWN_ST_TIME: TDateTimeField
      FieldName = 'ORIG_DWN_ST_TIME'
    end
    object QrySingleMachineJob_Down_Time: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Job_Down_Time'
      DisplayFormat = '#####0.00'
      Calculated = True
    end
    object QrySingleMachineORDERNO: TStringField
      DisplayWidth = 10
      FieldName = 'ORDERNO'
      Size = 15
    end
    object QrySingleMachineNEXT_ORDERNO: TStringField
      DisplayWidth = 10
      FieldName = 'NEXT_ORDERNO'
      Size = 15
    end
    object QrySingleMachinePRIORITY_NOTE: TStringField
      FieldName = 'PRIORITY_NOTE'
      Size = 255
    end
    object QrySingleMachineNEXT_PRIORITY_NOTE: TStringField
      FieldName = 'NEXT_PRIORITY_NOTE'
      Size = 255
    end
    object QrySingleMachineCNTR_DESC: TStringField
      FieldName = 'CNTR_DESC'
      Size = 250
    end
    object QrySingleMachineCNTR_SCHED_ID: TBCDField
      FieldName = 'CNTR_SCHED_ID'
      Size = 0
    end
    object QrySingleMachineWORKORDER_ID: TBCDField
      FieldName = 'WORKORDER_ID'
      Size = 0
    end
    object QrySingleMachineRTSERVER_NOT_SIGNALED: TStringField
      FieldName = 'RTSERVER_NOT_SIGNALED'
      Size = 1
    end
    object QrySingleMachineEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object QrySingleMachineOPERATOR: TBCDField
      DisplayLabel = 'Labor'
      FieldName = 'OPERATOR'
      DisplayFormat = '##0.00'
      Size = 2
    end
    object QrySingleMachinePK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QrySingleMachineMFGNO_DISP: TStringField
      DisplayLabel = 'Mfg #'
      FieldName = 'MFGNO_DISP'
      Size = 50
    end
    object QrySingleMachineFORCE_REASON: TStringField
      DisplayLabel = 'Down-Time Reason'
      FieldName = 'FORCE_REASON'
      Size = 35
    end
    object QrySingleMachinePMWO_ID: TBCDField
      FieldName = 'PMWO_ID'
      Visible = False
      Size = 0
    end
    object QrySingleMachineIS_VIRTUAL: TStringField
      FieldName = 'IS_VIRTUAL'
      Size = 1
    end
    object QrySingleMachinePARENT_WORK_CENTER_ID: TBCDField
      FieldName = 'PARENT_WORK_CENTER_ID'
      Size = 0
    end
    object QrySingleMachineLOOKUP_MFGTYPE: TStringField
      FieldName = 'LOOKUP_MFGTYPE'
      Size = 10
    end
    object QrySingleMachineCYCLES_PLANNED: TBCDField
      FieldName = 'CYCLES_PLANNED'
      Origin = 'IQ.HIST_ILLUM_RT.CYCLES_PLANNED'
      Size = 2
    end
    object QrySingleMachinePRIORITY_NOTE2: TStringField
      FieldName = 'PRIORITY_NOTE2'
      Origin = 'IQ.HIST_ILLUM_RT.PRIORITY_NOTE2'
      Size = 255
    end
  end
  object SrcParts: TDataSource
    DataSet = QryParts
    Left = 171
    Top = 62
  end
  object QryParts: TFDQuery
    OnCalcFields = QryPartsCalcFields
    MasterSource = SrcSingleMachine
    MasterFields = 'WORK_CENTER_ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select itemno,'
      '       descrip,'
      '       total_qty, '
      '       floor_dispo_qty,'
      '       shift_qty,'
      '       day_qty,'
      '       partstogo,'
      '       actcav,'
      '       stdcav,'
      '       hourstogo,'
      '       badparts,'
      '       scrap_prcnt'
      '  from V_RT_SINGLE_MACHINE_PARTS'
      ' where work_center_id = :work_center_id')
    Left = 172
    Top = 77
    ParamData = <
      item
        Name = 'WORK_CENTER_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryPartsITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 17
      FieldName = 'ITEMNO'
      Origin = 'IQ.V_RT_SINGLE_MACHINE_PARTS.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryPartsDESCRIP: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Origin = 'IQ.V_RT_SINGLE_MACHINE_PARTS.DESCRIP'
      Size = 100
    end
    object QryPartsTOTAL_QTY: TFMTBCDField
      DisplayLabel = 'Total Parts'
      DisplayWidth = 10
      FieldName = 'TOTAL_QTY'
      Origin = 'IQ.V_RT_SINGLE_MACHINE_PARTS.TOTAL_QTY'
      Size = 38
    end
    object QryPartsFLOOR_DISPO_QTY: TFMTBCDField
      DisplayLabel = 'Total Floor Dispo'
      DisplayWidth = 13
      FieldName = 'FLOOR_DISPO_QTY'
      Origin = 'IQ.V_RT_SINGLE_MACHINE_PARTS.FLOOR_DISPO_QTY'
      Size = 38
    end
    object QryPartsSHIFT_QTY: TFMTBCDField
      DisplayLabel = 'Shift Parts'
      DisplayWidth = 10
      FieldName = 'SHIFT_QTY'
      Origin = 'IQ.V_RT_SINGLE_MACHINE_PARTS.SHIFT_QTY'
      Size = 38
    end
    object QryPartsDAY_QTY: TFMTBCDField
      DisplayLabel = 'Daily Parts'
      DisplayWidth = 10
      FieldName = 'DAY_QTY'
      Origin = 'IQ.V_RT_SINGLE_MACHINE_PARTS.DAY_QTY'
      Size = 38
    end
    object QryPartsPARTSTOGO: TFMTBCDField
      DisplayLabel = 'Parts To Go'
      DisplayWidth = 10
      FieldName = 'PARTSTOGO'
      Origin = 'IQ.V_RT_SINGLE_MACHINE_PARTS.PARTSTOGO'
      Size = 38
    end
    object QryPartsACTCAV: TFMTBCDField
      DisplayLabel = 'Act Cav'
      DisplayWidth = 10
      FieldName = 'ACTCAV'
      Origin = 'IQ.V_RT_SINGLE_MACHINE_PARTS.ACTCAV'
      Size = 6
    end
    object QryPartsSTDCAV: TFMTBCDField
      DisplayLabel = 'Std Cav'
      DisplayWidth = 10
      FieldName = 'STDCAV'
      Origin = 'IQ.V_RT_SINGLE_MACHINE_PARTS.STDCAV'
      Size = 6
    end
    object QryPartsHOURSTOGO: TFMTBCDField
      DisplayLabel = 'Hours To Go'
      DisplayWidth = 10
      FieldName = 'HOURSTOGO'
      Origin = 'IQ.V_RT_SINGLE_MACHINE_PARTS.HOURSTOGO'
      DisplayFormat = '########0.00'
      Size = 38
    end
    object QryPartsBADPARTS: TFMTBCDField
      DisplayLabel = 'Bad Parts'
      DisplayWidth = 10
      FieldName = 'BADPARTS'
      Origin = 'IQ.V_RT_SINGLE_MACHINE_PARTS.BADPARTS'
      Size = 38
    end
    object QryPartsSCRAP_PRCNT: TFMTBCDField
      DisplayLabel = 'Scrap %'
      DisplayWidth = 10
      FieldName = 'SCRAP_PRCNT'
      Origin = 'IQ.V_RT_SINGLE_MACHINE_PARTS.SCRAP_PRCNT'
      DisplayFormat = '#####0.00'
      Size = 38
    end
    object QryPartsPlanned_Qty: TFloatField
      DisplayLabel = 'Planned Qty'
      DisplayWidth = 12
      FieldKind = fkCalculated
      FieldName = 'Planned_Qty'
      Calculated = True
    end
  end
end
