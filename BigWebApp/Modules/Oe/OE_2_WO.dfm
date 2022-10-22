object FrmOE2WO: TFrmOE2WO
  Left = 234
  Top = 166
  ClientHeight = 470
  ClientWidth = 575
  Caption = 'Work Orders Information'
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 219
    Width = 575
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object pnlGrid: TUniPanel
    Left = 0
    Top = 0
    Width = 575
    Height = 219
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object DBGrid1: TUniDBGrid
      Left = 1
      Top = 1
      Width = 573
      Height = 217
      Hint = ''
      DataSource = SrcOe2Wo
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Columns = <
        item
          FieldName = 'INDENTED_WO_ID'
          Title.Caption = 'Work Order #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ITEMNO'
          Title.Caption = 'Item #'
          Width = 61
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Item Description'
          Width = 87
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'MFGNO'
          Title.Caption = 'MFG #'
          Width = 58
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'BUCKET'
          Title.Caption = 'Bucket'
          Width = 58
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PRODHRS'
          Title.Caption = 'Production Hours'
          Width = 95
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CYCLES_REQ'
          Title.Caption = 'Cycles Required'
          Width = 87
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'START_TIME'
          Title.Caption = 'Must Start'
          Width = 65
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'END_TIME'
          Title.Caption = 'Must End'
          Width = 53
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EQNO'
          Title.Caption = 'Work Center #'
          Width = 76
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CNTR_SEQ'
          Title.Caption = 'Schedule Position'
          Width = 99
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PROD_START_TIME'
          Title.Caption = 'Schedule Start Time'
          Width = 110
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PROD_END_TIME'
          Title.Caption = 'Schedule End Time'
          Width = 99
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'MFG_QUAN'
          Title.Caption = 'MFG Quantity'
          Width = 72
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ROUTE_SEQ'
          Title.Caption = 'Route #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PTALLOCATE_ID'
          Title.Caption = 'PTAllocate ID'
          Width = 80
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PTORDER_REL_ID'
          Title.Caption = 'PTOrder Release ID'
          Width = 107
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'FIRM'
          Title.Caption = 'Firm'
          Width = 24
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
  end
  object pnlCarrier: TUniPanel
    Left = 0
    Top = 222
    Width = 575
    Height = 248
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
  end
  object SrcOe2Wo: TDataSource
    DataSet = QryOe2Wo
    OnDataChange = SrcOe2WoDataChange
    Left = 16
    Top = 48
  end
  object QryOe2Wo: TFDQuery
    Active = True
    BeforeOpen = QryOe2WoBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select v.workorder_id as workorder_id,'
      
        '       substrB(iqeval.substrW63Max( LPad('#39' '#39', 3*(v.tree_level-1)' +
        ')|| v.workorder_id, 1, 255), 1, 255) as indented_wo_id,'
      '       v.arinvt_id,'
      '       a.itemno, '
      '       a.descrip,'
      '       std.mfgno,'
      '       v.ord_detail_id,'
      '       v.start_time,'
      '       v.end_time,'
      '       v.standard_id,'
      '       v.bucket,'
      '       v.ptallocate_id,'
      '       v.prodhrs,'
      '       v.cycles_req,'
      '       v.mfg_quan,'
      '       v.parent_id,'
      '       s.cntr_seq,'
      '       c.eqno,'
      '       c.id as work_center_id,'
      '       s.id as cntr_sched_id,'
      '       s.prod_start_time,'
      '       s.prod_end_time,'
      '       std.route_seq,'
      '       v.ptorder_rel_id,'
      '       v.firm,'
      '       v.assy_run'
      '       '
      'from '
      '     arinvt a,'
      '     standard std,'
      '     cntr_sched s,'
      '     work_center c,'
      '     '
      '     (select /*ptallocate_parent_id*/'
      
        '             wo_route.get_parent_ptallocate_id( ptallocate_paren' +
        't_id ) as parent_id,'
      '             ptallocate_id,'
      '             arinvt_id,'
      '             ord_detail_id,'
      '             rel_quan as mfg_quan,'
      '             prodhrs,'
      '             cycles_req,'
      '             start_time,'
      '             end_time,'
      '             standard_id,'
      '             bucket,'
      '             workorder_id,'
      '             level as tree_level,'
      '             rownum as nodes_order,'
      '             v.id as ptorder_rel_id,'
      '             v.firm,'
      '             v.assy_run'
      '        from'
      '             v_wo_ptallocate v'
      '       start with'
      '             id in (select id'
      '                      from ptorder_rel'
      
        '                     where ( :ord_detail_id > 0 and ord_detail_i' +
        'd = :ord_detail_id and ptallocate_parent_id is NULL)'
      '                             or'
      
        '                             nvl(:ord_detail_id, 0) = 0 and ptor' +
        'der_id = :ptorder_id)'
      '      connect by'
      
        '              wo_route.get_parent_ptallocate_id( ptallocate_pare' +
        'nt_id ) = prior ptallocate_id  ) v'
      ''
      'where '
      '      v.arinvt_id = a.id'
      '  and v.standard_id = std.id '
      '  and v.workorder_id = s.workorder_id(+)'
      '  and s.work_center_id = c.id(+)'
      'order by '
      '      nvl(v.bucket,0),'
      '      v.nodes_order'
      ''
      ' '
      ' ')
    Left = 16
    Top = 64
    ParamData = <
      item
        Name = 'ord_detail_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'ptorder_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryOe2WoWORKORDER_ID: TBCDField
      FieldName = 'WORKORDER_ID'
      Size = 0
    end
    object QryOe2WoINDENTED_WO_ID: TStringField
      FieldName = 'INDENTED_WO_ID'
      Size = 255
    end
    object QryOe2WoARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Size = 0
    end
    object QryOe2WoITEMNO: TStringField
      FieldName = 'ITEMNO'
      Size = 50
    end
    object QryOe2WoDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 100
    end
    object QryOe2WoMFGNO: TStringField
      FieldName = 'MFGNO'
      Size = 50
    end
    object QryOe2WoORD_DETAIL_ID: TBCDField
      FieldName = 'ORD_DETAIL_ID'
      Size = 0
    end
    object QryOe2WoSTART_TIME: TDateTimeField
      FieldName = 'START_TIME'
    end
    object QryOe2WoEND_TIME: TDateTimeField
      FieldName = 'END_TIME'
    end
    object QryOe2WoSTANDARD_ID: TBCDField
      FieldName = 'STANDARD_ID'
      Size = 0
    end
    object QryOe2WoBUCKET: TBCDField
      FieldName = 'BUCKET'
      Size = 0
    end
    object QryOe2WoPTALLOCATE_ID: TBCDField
      FieldName = 'PTALLOCATE_ID'
      Size = 0
    end
    object QryOe2WoPRODHRS: TFMTBCDField
      FieldName = 'PRODHRS'
      Size = 6
    end
    object QryOe2WoCYCLES_REQ: TBCDField
      FieldName = 'CYCLES_REQ'
      Size = 2
    end
    object QryOe2WoMFG_QUAN: TBCDField
      FieldName = 'MFG_QUAN'
      DisplayFormat = '##########0.00'
      Size = 2
    end
    object QryOe2WoPARENT_ID: TFMTBCDField
      FieldName = 'PARENT_ID'
      Size = 38
    end
    object QryOe2WoCNTR_SEQ: TBCDField
      FieldName = 'CNTR_SEQ'
      Size = 0
    end
    object QryOe2WoEQNO: TStringField
      FieldName = 'EQNO'
      Size = 60
    end
    object QryOe2WoWORK_CENTER_ID: TBCDField
      FieldName = 'WORK_CENTER_ID'
      Size = 0
    end
    object QryOe2WoCNTR_SCHED_ID: TBCDField
      FieldName = 'CNTR_SCHED_ID'
      Size = 0
    end
    object QryOe2WoPROD_START_TIME: TDateTimeField
      FieldName = 'PROD_START_TIME'
    end
    object QryOe2WoPROD_END_TIME: TDateTimeField
      FieldName = 'PROD_END_TIME'
    end
    object QryOe2WoROUTE_SEQ: TBCDField
      DisplayLabel = 'Route #'
      FieldName = 'ROUTE_SEQ'
      Size = 0
    end
    object QryOe2WoPTORDER_REL_ID: TBCDField
      FieldName = 'PTORDER_REL_ID'
      Size = 0
    end
    object QryOe2WoFIRM: TStringField
      DisplayLabel = 'Firm'
      FieldName = 'FIRM'
      FixedChar = True
      Size = 1
    end
    object QryOe2WoASSY_RUN: TStringField
      FieldName = 'ASSY_RUN'
      Visible = False
      Size = 1
    end
  end
  object PopupMenu1: TUniPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 58
    Top = 67
    object JumptoWorkOrder1: TUniMenuItem
      Caption = 'Jump to &Work Order'
      OnClick = JumptoWorkOrder1Click
    end
    object JumptoBOM1: TUniMenuItem
      Caption = 'Jump to &BOM'
      OnClick = JumptoBOM1Click
    end
    object N1: TUniMenuItem
      Caption = 'Jump to &Inventory'
      OnClick = N1Click
    end
    object JumptoScheduling1: TUniMenuItem
      Caption = 'Jump to Scheduling'
      OnClick = JumptoScheduling1Click
    end
    object JumptoAssyTrack1: TUniMenuItem
      Caption = 'Jump to Assembly Track'
      OnClick = JumptoAssyTrack1Click
    end
    object N2: TUniMenuItem
      Caption = '-'
    end
    object SchedulingWindow1: TUniMenuItem
      Caption = 'Scheduling Window'
      OnClick = SchedulingWindow1Click
    end
    object N3: TUniMenuItem
      Caption = '-'
    end
    object GanttChart1: TUniMenuItem
      Caption = '&Gantt Chart'
      OnClick = GanttChart1Click
    end
    object N4: TUniMenuItem
      Caption = '-'
    end
    object About1: TUniMenuItem
      Caption = 'About'
      OnClick = About1Click
    end
  end
  object IQJumpInv: TIQWebJump
    DataField = 'ARINVT_ID'
    DataSource = SrcOe2Wo
    JumpTo = jtInventory
    Left = 55
    Top = 95
  end
  object IQJumpBom: TIQWebJump
    DataField = 'STANDARD_ID'
    DataSource = SrcOe2Wo
    JumpTo = jtBom
    Left = 84
    Top = 95
  end
  object IQJumpWO: TIQWebJump
    DataField = 'WORKORDER_ID'
    DataSource = SrcOe2Wo
    JumpTo = jtWorkOrder
    Left = 112
    Top = 95
  end
  object IQJumpSched: TIQWebJump
    DataField = 'CNTR_SCHED_ID'
    DataSource = SrcOe2Wo
    JumpTo = jtSchedule
    Left = 140
    Top = 95
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmOE2WO'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 197415 $'
    BuildVersion = '176554'
    Left = 182
    Top = 93
  end
  object SecurityRegister1: TIQWebSecurityRegister
    SecurityCode = 'FRMOE2WO'
    Left = 216
    Top = 96
  end
end
