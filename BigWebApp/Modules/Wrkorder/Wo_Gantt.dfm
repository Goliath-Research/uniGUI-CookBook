object FrmPtAllocGantt: TFrmPtAllocGantt
  Left = 86
  Top = 184
  HelpContext = 1011279
  ClientHeight = 348
  ClientWidth = 563
  Caption = 'Gantt Chart'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TUniPageControl
    Left = 0
    Top = 0
    Width = 563
    Height = 348
    Hint = ''
    ActivePage = TabSheet1
    TabBarVisible = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TabSheet1: TUniTabSheet
      Hint = ''
      Caption = 'Calculated'
      object GanttChart1: TUniChart
        Left = 0
        Top = 0
        Width = 555
        Height = 320
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        Title.Text.Strings = (
          'TChart')
        Legend.Visible = False
        LayoutConfig.BodyPadding = '10'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
      end
    end
    object TabSheet2: TUniTabSheet
      Hint = ''
      Caption = 'Tabular'
      object gridPtAllocate: TUniDBGrid
        Left = 0
        Top = 0
        Width = 555
        Height = 320
        Hint = ''
        DataSource = SrcPtAllocParentChild
        LoadMask.Message = 'Loading data...'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Columns = <
          item
            FieldName = 'STR_WORKORDER_ID'
            Title.Caption = 'WO #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'START_TIME'
            Title.Caption = 'Must Start'
            Width = 85
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'END_TIME'
            Title.Caption = 'Must End'
            Width = 82
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'MFGNO'
            Title.Caption = 'Mfg #'
            Width = 125
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'BUCKET'
            Title.Caption = 'Bkt'
            Width = 25
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PRODHRS'
            Title.Caption = 'Prod Hrs'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
      end
    end
  end
  object QryPtAllocParentChild: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select'
      
        '       SubStrB(iqeval.substrW63Max( LPad('#39' '#39', 6*(v.tree_level-1)' +
        ')|| v.workorder_id, 1, 250), 1, 250) as str_workorder_id,'
      '       v.workorder_id,'
      '       v.parent_workorder_id,'
      '       w.start_time,'
      '       w.end_time,'
      '       w.prodhrs,'
      '       s.mfgno,'
      '       w.standard_id,'
      '       w.bucket,'
      '       v.tree_level,'
      '       v.nodes_order       '
      '  from workorder w,'
      '       standard s,'
      '      ( select workorder_id,'
      '               parent_workorder_id,'
      '               level as tree_level,'
      '               rownum as nodes_order'
      '          from '
      '               wo_depend_flat x'
      ''
      
        '               -- start with the workorder that corresponds to t' +
        'his ptallocate'
      '         start with workorder_id in '
      
        '                                (select workorder_id from v_wo_p' +
        'tallocate where ptallocate_id = :ptallocate_id)'
      '                                '
      
        '               -- grab first main_workorder_id in wo_depend_flat' +
        ' and stick with it'
      '           and main_workorder_id in '
      '                                (select flat.main_workorder_id '
      '                                   from v_wo_ptallocate v,'
      '                                        wo_depend_flat flat'
      
        '                                  where v.ptallocate_id = :ptall' +
        'ocate_id'
      
        '                                    and v.workorder_id = flat.wo' +
        'rkorder_id'
      
        '                                    and flat.main_workorder_id i' +
        's not NULL'
      '                                    and rownum < 2)'
      '       connect by '
      '               parent_workorder_id = prior workorder_id'
      '           and main_workorder_id = prior main_workorder_id ) v'
      '           '
      ' where w.id = v.workorder_id'
      '   and s.id(+) = w.standard_id'
      ' order by '
      '       v.nodes_order'
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 95
    Top = 32
    ParamData = <
      item
        Name = 'ptallocate_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryPtAllocParentChildWORKORDER_ID: TBCDField
      DisplayLabel = 'WO #'
      FieldName = 'WORKORDER_ID'
      Size = 0
    end
    object QryPtAllocParentChildSTART_TIME: TDateTimeField
      DisplayLabel = 'Must Start'
      FieldName = 'START_TIME'
      DisplayFormat = 'c'
    end
    object QryPtAllocParentChildEND_TIME: TDateTimeField
      DisplayLabel = 'Must End'
      FieldName = 'END_TIME'
      DisplayFormat = 'c'
    end
    object QryPtAllocParentChildMFGNO: TStringField
      DisplayLabel = 'Mfg #'
      FieldName = 'MFGNO'
      Size = 50
    end
    object QryPtAllocParentChildSTANDARD_ID: TBCDField
      FieldName = 'STANDARD_ID'
      Size = 0
    end
    object QryPtAllocParentChildTREE_LEVEL: TFMTBCDField
      DisplayLabel = 'Tree Level'
      FieldName = 'TREE_LEVEL'
      Size = 38
    end
    object QryPtAllocParentChildNODES_ORDER: TFMTBCDField
      FieldName = 'NODES_ORDER'
      Size = 38
    end
    object QryPtAllocParentChildBUCKET: TBCDField
      DisplayLabel = 'Bkt'
      FieldName = 'BUCKET'
      Size = 0
    end
    object QryPtAllocParentChildPRODHRS: TFMTBCDField
      DisplayLabel = 'Prod Hrs'
      FieldName = 'PRODHRS'
      Size = 6
    end
    object QryPtAllocParentChildSTR_WORKORDER_ID: TStringField
      DisplayLabel = 'WO #'
      DisplayWidth = 50
      FieldName = 'STR_WORKORDER_ID'
      Size = 250
    end
    object QryPtAllocParentChildPARENT_WORKORDER_ID: TBCDField
      FieldName = 'PARENT_WORKORDER_ID'
      Size = 0
    end
  end
  object SrcPtAllocParentChild: TDataSource
    DataSet = QryPtAllocParentChild
    OnDataChange = SrcPtAllocParentChildDataChange
    Left = 128
    Top = 33
  end
end
