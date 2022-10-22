object FrmAccyTrackCostInfoDetails: TFrmAccyTrackCostInfoDetails
  Left = 467
  Top = 345
  ClientHeight = 453
  ClientWidth = 700
  Caption = 'Costing Info Details'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 220
    Width = 700
    Height = 4
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
    ExplicitTop = 178
    ExplicitWidth = 555
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 700
    Height = 220
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object Panel3: TUniPanel
      Left = 1
      Top = 1
      Width = 698
      Height = 28
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Alignment = taLeftJustify
      Caption = ' Translog'
      ExplicitWidth = 553
    end
    object wwDBGrid1: TIQUniGridControl
      Left = 1
      Top = 29
      Width = 698
      Height = 190
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 481
      IQComponents.Grid.Height = 104
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcTranslog
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
      IQComponents.Navigator.DataSource = SrcTranslog
      IQComponents.Navigator.VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 481
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 104
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.HiddenPanel.ExplicitLeft = 336
      IQComponents.HiddenPanel.ExplicitHeight = 62
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      IQComponents.FormTab.ExplicitWidth = 545
      IQComponents.FormTab.ExplicitHeight = 91
      DataSource = SrcTranslog
      Columns = <
        item
          FieldName = 'ID'
          Title.Caption = 'Translog ID'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ITEMNO'
          Title.Caption = 'Item #'
          Width = 175
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ACT_COST'
          Title.Caption = 'Act Cost'
          Width = 91
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TRANS_QUAN'
          Title.Caption = 'Trans Qty'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'COST_ELEMENT'
          Title.Caption = 'Cost Element'
          Width = 182
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CLASS'
          Title.Caption = 'Class'
          Width = 35
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'REV'
          Title.Caption = 'Item Rev'
          Width = 105
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Item Description'
          Width = 189
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'UNIT'
          Title.Caption = 'UOM'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TRANS_IN_OUT'
          Title.Caption = 'Type'
          Width = 35
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TRANS_DATE'
          Title.Caption = 'Trans Date'
          Width = 126
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TRANS_REASON'
          Title.Caption = 'Reason'
          Width = 224
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'BATCH'
          Title.Caption = 'Batch #'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TRANS_CODE'
          Title.Caption = 'Trans Code'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EPLANT_ID'
          Title.Caption = 'EPlant ID'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SUB_BATCH'
          Title.Caption = 'Sub Batch'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PARENT_WIP_QUAN'
          Title.Caption = 'Parent WIP Qty'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end>
      ExplicitWidth = 553
      ExplicitHeight = 148
      Marker = 0
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 224
    Width = 700
    Height = 229
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitTop = 182
    ExplicitWidth = 555
    ExplicitHeight = 177
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 698
      Height = 28
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Alignment = taLeftJustify
      Caption = ' Labor'
      ExplicitWidth = 553
    end
    object wwDBGrid2: TIQUniGridControl
      Left = 1
      Top = 29
      Width = 698
      Height = 199
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 481
      IQComponents.Grid.Height = 113
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcTALabor
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
      IQComponents.Navigator.DataSource = SrcTALabor
      IQComponents.Navigator.VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 481
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 113
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.HiddenPanel.ExplicitLeft = 336
      IQComponents.HiddenPanel.ExplicitHeight = 61
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      IQComponents.FormTab.ExplicitWidth = 545
      IQComponents.FormTab.ExplicitHeight = 90
      DataSource = SrcTALabor
      Columns = <
        item
          FieldName = 'TA_LABOR_ID'
          Title.Caption = 'Labor ID'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TIME_SPENT'
          Title.Caption = 'Labor Hours'
          Width = 84
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CHARGE_RATE'
          Title.Caption = 'Rate'
          Width = 91
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PROCESS_QTY'
          Title.Caption = 'Produced Qty'
          Width = 98
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Elem_Descrip'
          Title.Caption = 'Cost Element'
          Width = 245
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'OH_HRS'
          Title.Caption = 'Additional ~Overhead Hours'
          Width = 98
          CheckBoxField.FieldValues = 'true;false'
        end>
      ExplicitWidth = 553
      ExplicitHeight = 147
      Marker = 0
    end
  end
  object SrcTranslog: TDataSource
    DataSet = QryTranslog
    Left = 23
    Top = 66
  end
  object QryTranslog: TFDQuery
    BeforeOpen = AssignParamsBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       arinvt_id,'
      '       class,'
      '       itemno,'
      '       rev,'
      '       descrip,'
      '       unit,'
      '       trans_in_out,'
      '       trans_date,'
      '       trans_quan,'
      '       act_cost,'
      '       loc_desc,'
      '       lotno,'
      '       fg_lotno,'
      '       trans_reason,'
      '       batch,'
      '       cost_element,'
      '       parent_arinvt_id,'
      '       source,'
      '       source_id,'
      '       trans_code,'
      '       trans_descrip,'
      '       location_descrip,'
      '       workorder_id,'
      '       eplant_id,'
      '       fgmulti_id,'
      '       top_phantom_arinvt_id,'
      '       sub_batch,'
      
        '       (select sum(wip_quan) from translog t where sub_batch = t' +
        'ranslog.sub_batch and t.trans_in_out = '#39'IN'#39' and t.wip_quan > 0) ' +
        'as parent_wip_quan'
      '  from translog'
      ' where '
      '       source_id = :sndop_id '
      '  and  source = '#39'SNDOP'#39
      '  and trans_type = '#39'PROCESS WIP'#39' '
      '  and workorder_id = :workorder_id'
      '  and trans_in_out = '#39'OUT'#39
      '  and trans_quan > 0'
      
        '  and nvl(trans_reason, '#39'*'#39') <> '#39'BACKFLUSH phantom in/out on-fly' +
        #39
      '  and (ptoper_id is null or ptoper_id = :ptoper_id)'
      'order by id'
      ''
      '  '
      '')
    Left = 23
    Top = 124
    ParamData = <
      item
        Name = 'sndop_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'workorder_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'ptoper_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryTranslogID: TBCDField
      DisplayLabel = 'Translog ID'
      DisplayWidth = 10
      FieldName = 'ID'
      Size = 0
    end
    object QryTranslogITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryTranslogACT_COST: TFMTBCDField
      DisplayLabel = 'Act Cost'
      DisplayWidth = 13
      FieldName = 'ACT_COST'
    end
    object QryTranslogTRANS_QUAN: TFMTBCDField
      DisplayLabel = 'Trans Qty'
      DisplayWidth = 10
      FieldName = 'TRANS_QUAN'
    end
    object QryTranslogCOST_ELEMENT: TStringField
      DisplayLabel = 'Cost Element'
      DisplayWidth = 26
      FieldName = 'COST_ELEMENT'
      FixedChar = True
      Size = 30
    end
    object QryTranslogCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 5
      FieldName = 'CLASS'
      FixedChar = True
      Size = 2
    end
    object QryTranslogREV: TStringField
      DisplayLabel = 'Item Rev'
      DisplayWidth = 15
      FieldName = 'REV'
      FixedChar = True
      Size = 15
    end
    object QryTranslogDESCRIP: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 27
      FieldName = 'DESCRIP'
      Size = 35
    end
    object QryTranslogUNIT: TStringField
      DisplayLabel = 'UOM'
      DisplayWidth = 10
      FieldName = 'UNIT'
      Size = 10
    end
    object QryTranslogTRANS_IN_OUT: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 5
      FieldName = 'TRANS_IN_OUT'
      FixedChar = True
      Size = 3
    end
    object QryTranslogTRANS_DATE: TDateTimeField
      DisplayLabel = 'Trans Date'
      DisplayWidth = 18
      FieldName = 'TRANS_DATE'
    end
    object QryTranslogTRANS_REASON: TStringField
      DisplayLabel = 'Reason'
      DisplayWidth = 32
      FieldName = 'TRANS_REASON'
      Size = 50
    end
    object QryTranslogBATCH: TBCDField
      DisplayLabel = 'Batch #'
      DisplayWidth = 10
      FieldName = 'BATCH'
      Size = 0
    end
    object QryTranslogTRANS_CODE: TStringField
      DisplayLabel = 'Trans Code'
      DisplayWidth = 10
      FieldName = 'TRANS_CODE'
      Size = 10
    end
    object QryTranslogEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object QryTranslogSUB_BATCH: TBCDField
      DisplayLabel = 'Sub Batch'
      DisplayWidth = 10
      FieldName = 'SUB_BATCH'
      Size = 0
    end
    object QryTranslogPARENT_WIP_QUAN: TFMTBCDField
      DisplayLabel = 'Parent WIP Qty'
      DisplayWidth = 10
      FieldName = 'PARENT_WIP_QUAN'
    end
    object QryTranslogLOCATION_DESCRIP: TStringField
      DisplayWidth = 50
      FieldName = 'LOCATION_DESCRIP'
      Visible = False
      Size = 50
    end
    object QryTranslogLOC_DESC: TStringField
      DisplayWidth = 30
      FieldName = 'LOC_DESC'
      Visible = False
      FixedChar = True
      Size = 30
    end
    object QryTranslogLOTNO: TStringField
      DisplayWidth = 25
      FieldName = 'LOTNO'
      Visible = False
      FixedChar = True
      Size = 25
    end
    object QryTranslogFG_LOTNO: TStringField
      DisplayWidth = 25
      FieldName = 'FG_LOTNO'
      Visible = False
      FixedChar = True
      Size = 25
    end
    object QryTranslogPARENT_ARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PARENT_ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryTranslogSOURCE: TStringField
      DisplayWidth = 50
      FieldName = 'SOURCE'
      Visible = False
      Size = 50
    end
    object QryTranslogSOURCE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SOURCE_ID'
      Visible = False
      Size = 0
    end
    object QryTranslogTRANS_DESCRIP: TStringField
      DisplayWidth = 25
      FieldName = 'TRANS_DESCRIP'
      Visible = False
      Size = 25
    end
    object QryTranslogWORKORDER_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'WORKORDER_ID'
      Visible = False
      Size = 0
    end
    object QryTranslogFGMULTI_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'FGMULTI_ID'
      Visible = False
      Size = 0
    end
    object QryTranslogTOP_PHANTOM_ARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'TOP_PHANTOM_ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryTranslogARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcTALabor: TDataSource
    DataSet = QryTALabor
    Left = 155
    Top = 60
  end
  object QryTALabor: TFDQuery
    BeforeOpen = AssignParamsBeforeOpen
    OnCalcFields = QryTALaborCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select ta.id as ta_labor_id,'
      
        '       nvl(pr_emp.elements_id, sndop.elements_id_lbr) as element' +
        's_id,'
      
        '       decode( ta.time_in, null, reg_hrs, TA_Misc.GetTotalSplitT' +
        'ime( ta.id )) as time_spent,'
      '       ta.charge_rate,'
      '       ta.process_qty,'
      '       ta.oh_hrs'
      '  from ta_labor ta, pr_emp, sndop'
      ' where ta.source in ('#39'WO'#39', '#39'JS'#39')'
      '   and ta.workorder_id = :workorder_id'
      '   and ta.partno_id = :partno_id'
      '   and ta.sndop_id = :sndop_id'
      '   and ta.ptoper_id = :ptoper_id'
      '   and ta.pr_emp_id = pr_emp.id'
      '   and ta.sndop_id = sndop.id'
      ' order by ta.id')
    Left = 156
    Top = 126
    ParamData = <
      item
        Name = 'workorder_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'partno_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'sndop_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'ptoper_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryTALaborTA_LABOR_ID: TBCDField
      DisplayLabel = 'Labor ID'
      DisplayWidth = 10
      FieldName = 'TA_LABOR_ID'
      Size = 0
    end
    object QryTALaborTIME_SPENT: TFMTBCDField
      DisplayLabel = 'Labor Hours'
      DisplayWidth = 12
      FieldName = 'TIME_SPENT'
      Size = 38
    end
    object QryTALaborCHARGE_RATE: TFMTBCDField
      DisplayLabel = 'Rate'
      DisplayWidth = 13
      FieldName = 'CHARGE_RATE'
      Size = 6
    end
    object QryTALaborPROCESS_QTY: TFMTBCDField
      DisplayLabel = 'Produced Qty'
      DisplayWidth = 14
      FieldName = 'PROCESS_QTY'
      Size = 6
    end
    object QryTALaborElem_Descrip: TStringField
      DisplayLabel = 'Cost Element'
      DisplayWidth = 35
      FieldKind = fkCalculated
      FieldName = 'Elem_Descrip'
      Size = 35
      Calculated = True
    end
    object QryTALaborOH_HRS: TFMTBCDField
      DisplayLabel = 'Additional ~Overhead Hours'
      DisplayWidth = 14
      FieldName = 'OH_HRS'
      Size = 6
    end
    object QryTALaborELEMENTS_ID: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'ELEMENTS_ID'
      Visible = False
      Size = 38
    end
  end
end
