object FrmWhereUsedWO: TFrmWhereUsedWO
  Left = 149
  Top = 165
  ClientHeight = 256
  ClientWidth = 548
  Caption = 'Where Used Workorder'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 548
    Height = 256
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 331
    IQComponents.Grid.Height = 170
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = DataSource1
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
    IQComponents.Navigator.DataSource = DataSource1
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 331
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 170
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = DataSource1
    Columns = <
      item
        FieldName = 'ID'
        Title.Caption = 'WO #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'MFGNO'
        Title.Caption = 'Manufacturing #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ITEMNO'
        Title.Caption = 'Item #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP2'
        Title.Caption = 'Ext Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REV'
        Title.Caption = 'Revision'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EPLANT_ID'
        Title.Caption = 'EPlant ID'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CYCLES_REQ'
        Title.Caption = 'Cycles Required'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BUCKET'
        Title.Caption = 'Bucket'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ORIGIN'
        Title.Caption = 'Origin'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'MAX_LEVEL'
        Title.Caption = 'Level'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'MFG_TYPE'
        Title.Caption = 'Manufacturing Type'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FIRM'
        Title.Caption = 'Is Firm'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SCHEDULED_ON'
        Title.Caption = 'Scheduled On'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 77
    Top = 84
  end
  object Query1: TFDQuery
    BeforeOpen = Query1BeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
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
      '        v.max_level as max_level,'
      '        standard.mfg_type as mfg_type,'
      '        NVL(workorder.firm, '#39' '#39') as firm,'
      
        '        substrB(iqeval.substrW63Max( workorder_misc.scheduled_on' +
        '_work_center_disp( workorder.id ), 1, 255),1, 255) as scheduled_' +
        'on'
      '   from workorder, '
      '        standard, '
      '        partno, '
      '        arinvt,'
      '        v_bom_levels v'
      '  where workorder.standard_id = standard.id'
      '    and partno.arinvt_id = arinvt.id'
      '    and partno.standard_id = standard.id'
      '    and arinvt.id = v.opmat_arinvt_id(+) '
      ''
      
        '    and (( :standard_id > 0 and workorder.standard_id = :standar' +
        'd_id )'
      '        or'
      '         ( :standard_id = 0 and workorder.standard_id in '
      '                                ( select s.id'
      '                                    from standard s, '
      '                                         partno p,'
      '                                         ptoper, '
      '                                         opmat'
      
        '                                   where opmat.arinvt_id = :arin' +
        'vt_id'
      '                                     and s.id = p.standard_id'
      '                                     and p.id = ptoper.partno_id'
      
        '                                     and ptoper.sndop_id = opmat' +
        '.sndop_id'
      '                                 UNION ALL'
      '                                  select s.id '
      '                                    from standard s'
      
        '                                   where s.arinvt_id_mat = :arin' +
        'vt_id )))'
      '        '
      '       '
      '')
    Left = 77
    Top = 113
    ParamData = <
      item
        Name = 'standard_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object Query1MFGNO: TStringField
      DisplayLabel = 'Manufacturing #'
      DisplayWidth = 25
      FieldName = 'MFGNO'
      Origin = 'standard.mfgno'
      Size = 50
    end
    object Query1ITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 'arinvt.itemno'
      FixedChar = True
      Size = 50
    end
    object Query1DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Origin = 'arinvt.descrip'
      Size = 35
    end
    object Query1DESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Origin = 'arinvt.descrip2'
      Size = 100
    end
    object Query1REV: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 15
      FieldName = 'REV'
      Origin = 'arinvt.rev'
      FixedChar = True
      Size = 15
    end
    object Query1ORIGIN: TStringField
      DisplayLabel = 'Origin'
      DisplayWidth = 10
      FieldName = 'ORIGIN'
      Origin = 'workorder.origin'
      Size = 10
    end
    object Query1MFG_TYPE: TStringField
      DisplayLabel = 'Manufacturing Type'
      DisplayWidth = 10
      FieldName = 'MFG_TYPE'
      Origin = 'standard.mfg_type'
      FixedChar = True
      Size = 10
    end
    object Query1FIRM: TStringField
      DisplayLabel = 'Is Firm '
      DisplayWidth = 5
      FieldName = 'FIRM'
      Origin = 'NVL(workorder.firm, '#39' '#39')'
      Size = 1
    end
    object Query1SCHEDULED_ON: TStringField
      DisplayLabel = 'Scheduled On'
      DisplayWidth = 255
      FieldName = 'SCHEDULED_ON'
      Size = 255
    end
    object Query1ID: TBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'WO #'
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      Required = True
      Precision = 15
      Size = 0
    end
    object Query1EPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Precision = 15
      Size = 0
    end
    object Query1CYCLES_REQ: TBCDField
      DisplayLabel = 'Cycles Required'
      FieldName = 'CYCLES_REQ'
      Origin = 'CYCLES_REQ'
      Precision = 14
      Size = 2
    end
    object Query1BUCKET: TBCDField
      DisplayLabel = 'Bucket'
      FieldName = 'BUCKET'
      Origin = 'BUCKET'
      Precision = 3
      Size = 0
    end
    object Query1MAX_LEVEL: TFMTBCDField
      DisplayLabel = 'Level'
      FieldName = 'MAX_LEVEL'
      Origin = 'MAX_LEVEL'
      Precision = 38
      Size = 38
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 137
    Top = 98
    object JumptoWorkorder1: TUniMenuItem
      Caption = 'Jump to Workorder'
      OnClick = JumptoWorkorder1Click
    end
  end
  object IQJumpWO: TIQWebJump
    DataField = 'ID'
    DataSource = DataSource1
    JumpTo = jtWorkOrder
    Left = 169
    Top = 98
  end
end
