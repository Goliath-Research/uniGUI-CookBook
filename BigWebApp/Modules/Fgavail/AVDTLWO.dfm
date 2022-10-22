inherited FrmFGAvailDetailWO: TFrmFGAvailDetailWO
  ClientWidth = 510
  Caption = 'FrmFGAvailDetailWO'
  OnCreate = UniFormCreate
  ExplicitWidth = 526
  ExplicitHeight = 401
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBGrid1: TUniDBGrid
    Width = 510
    Columns = <
      item
        FieldName = 'EQNO'
        Title.Caption = 'Center'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'POS'
        Title.Caption = 'Pos'
        Width = 23
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'WORKORDER_ID'
        Title.Caption = 'WO #'
        Width = 45
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'MFGNO'
        Title.Caption = 'Mfg#'
        Width = 105
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'QTY'
        Title.Caption = 'Day Qty'
        Width = 44
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CUSTNO'
        Title.Caption = 'Cust#'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'COMPANY'
        Title.Caption = 'Company'
        Width = 145
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  inherited PnlTouchScreenButtons: TUniPanel
    Width = 510
    ExplicitWidth = 510
    inherited PnlTouchScreenButtonsInner: TUniPanel
      Left = 367
      ExplicitLeft = 367
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select day_hrs.workorder_id,'
      '       work_center.eqno,'
      '       cntr_sched.cntr_seq as pos,'
      '       day_pts.qty,'
      '       arcusto.custno,'
      '       arcusto.company,'
      '       standard.mfgno,'
      '       standard.id as standard_id'
      '  from day_hrs,'
      '       day_pts,'
      '       workorder wo,'
      '       partno,'
      '       arcusto,'
      '       cntr_sched,'
      '       work_center,'
      '       standard'
      ' where Trunc(day_hrs.prod_date) = :tran_date'
      '   and partno.arinvt_id = :arinvt_id'
      '   and day_hrs.id = day_pts.day_hrs_id'
      '   and wo.id = day_hrs.workorder_id'
      '   and wo.arcusto_id = arcusto.id(+)'
      '   and partno.id = day_pts.partno_id'
      '   and wo.id = cntr_sched.workorder_id(+)'
      '   and cntr_sched.work_center_id = work_center.id(+)'
      '   and standard.id = wo.standard_id'
      
        '   and mfg.lookup_mfgtype(standard.mfg_type) not in ('#39'ASSY1'#39', '#39'A' +
        'SSY2'#39', '#39'ASSY3'#39')'
      '   and (:inc_non_sched_wo = 1'
      '        or'
      '        :inc_non_sched_wo = 0 and cntr_sched.id is not null)'
      ''
      'UNION'
      ''
      'select v.id as workorder_id,'
      
        '       '#39'Process# '#39' || rtrim(sndop.opno) || decode( d.work_center' +
        '_id, null, '#39'- Not Dispatched'#39', '#39' @ '#39' || w.eqno ),'
      '       d.seq as pos,'
      
        '       (select sum(nvl(rel_quan_origin, rel_quan_disp)) from pto' +
        'rder_rel '
      
        '         where ptorder_id = (select id from ptorder where workor' +
        'der_id = v.id and partno_id = v.partno_id)) as qty,'
      '       a.custno,'
      '       a.company,'
      '       s.mfgno,'
      '       s.id as standard_id'
      '  from '
      '       V_WORKORDERS_ASSY1 v,'
      '       sndop_dispatch d,'
      '       work_center w,'
      '       standard s,'
      '       sndop,'
      '       arcusto a'
      ' where '
      '       trunc(v.end_time) = :tran_date'
      '   and v.arinvt_id = :arinvt_id'
      ''
      '       -- sndop_dispatch'
      '   and v.id = d.workorder_id(+)'
      '   and v.partno_id = d.partno_id(+)'
      '   and v.ptoper_id = d.ptoper_id(+)'
      ''
      '       -- work center'
      '   and d.work_center_id = w.id(+)'
      ''
      '       -- mfgno'
      '   and v.standard_id = s.id'
      ''
      '       -- sndop'
      '   and v.sndop_id = sndop.id(+)'
      ''
      '       -- arcusto'
      '   and v.arcusto_id = a.id(+)'
      ''
      '   and (:inc_non_sched_wo = 1'
      '        or'
      '        :inc_non_sched_wo = 0 and v.assy_run = '#39'Y'#39')'
      '   ')
    Left = 64
    ParamData = <
      item
        Name = 'tran_date'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'inc_non_sched_wo'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object Query1WORKORDER_ID: TBCDField
      DisplayLabel = 'WO #'
      FieldName = 'WORKORDER_ID'
      Size = 0
    end
    object Query1QTY: TFMTBCDField
      FieldName = 'QTY'
      Size = 38
    end
    object Query1CUSTNO: TStringField
      FieldName = 'CUSTNO'
      Size = 10
    end
    object Query1COMPANY: TStringField
      FieldName = 'COMPANY'
      Size = 60
    end
    object Query1EQNO: TStringField
      FieldName = 'EQNO'
      Size = 87
    end
    object Query1POS: TFMTBCDField
      FieldName = 'POS'
      Size = 38
    end
    object Query1MFGNO: TStringField
      FieldName = 'MFGNO'
      Size = 50
    end
    object Query1STANDARD_ID: TBCDField
      FieldName = 'STANDARD_ID'
      Size = 0
    end
  end
  inherited DataSource1: TDataSource
    Left = 59
  end
  inherited PopupMenu1: TUniPopupMenu
    object JumpToWO1: TUniMenuItem
      Caption = 'Jump To WO'
      OnClick = JumpToWO1Click
    end
    object JumpToBOM1: TUniMenuItem
      Caption = 'Jump To BOM'
      OnClick = JumpToBOM1Click
    end
  end
  object IQJump1: TIQWebJump
    DataField = 'WORKORDER_ID'
    DataSource = DataSource1
    JumpTo = jtWorkOrder
    Left = 160
    Top = 56
  end
  object IQJump2: TIQWebJump
    DataField = 'STANDARD_ID'
    DataSource = DataSource1
    JumpTo = jtBom
    Left = 188
    Top = 56
  end
  object QueryByDivision: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select day_hrs.workorder_id,'
      '       work_center.eqno,'
      '       cntr_sched.cntr_seq as pos,'
      '       sum(day_pts.qty) as qty,'
      '       arcusto.custno,'
      '       arcusto.company,'
      '       s.mfgno,'
      '       s.id as standard_id'
      '  from'
      '       day_hrs,'
      '       day_pts,'
      '       partno,'
      '       workorder wo,'
      '       arcusto,'
      '       work_center,'
      '       iqms.standard s,'
      '       cntr_sched'
      ' where'
      '       Trunc(day_hrs.prod_date) = :tran_date'
      '   and day_hrs.id = day_pts.day_hrs_id'
      
        '   and (:division_id = -1 or :division_id = nvl(day_hrs.division' +
        '_id,0))'
      ''
      '       -- look at arinvt_id'
      '   and day_pts.partno_id = partno.id'
      '   and partno.arinvt_id = :arinvt_id'
      ''
      '       -- look only at sched'
      '   and day_hrs.workorder_id = cntr_sched.workorder_id(+)'
      '   '
      '       -- link arcusto'
      '   and day_hrs.workorder_id = wo.id'
      '   and wo.arcusto_id = arcusto.id(+)'
      '   '
      '       -- link work_center for eqno'
      '   and cntr_sched.work_center_id = work_center.id(+)'
      '       -- link standard for get mfgno'
      '   and s.id = wo.standard_id                             '
      '   '
      
        '   and mfg.lookup_mfgtype(s.mfg_type) not in ('#39'ASSY1'#39', '#39'ASSY2'#39', ' +
        #39'ASSY3'#39')'
      '                                                 '
      '   and (:inc_non_sched_wo = 1'
      '        or'
      '        :inc_non_sched_wo = 0 and cntr_sched.id is not null)'
      '                            '
      'group by day_hrs.workorder_id,'
      '         work_center.eqno,'
      '         cntr_sched.cntr_seq,'
      '         arcusto.custno,'
      '         arcusto.company,'
      '         s.mfgno,'
      '         s.id'
      ''
      'UNION'
      ''
      'select v.id as workorder_id,'
      
        '       '#39'Process# '#39' || rtrim(sndop.opno) || decode( d.work_center' +
        '_id, null, '#39'- Not Dispatched'#39', '#39' @ '#39' || w.eqno ),'
      '       d.seq as pos,'
      
        '       (select sum(nvl(rel_quan_origin, rel_quan_disp)) from pto' +
        'rder_rel '
      
        '         where ptorder_id = (select id from ptorder where workor' +
        'der_id = v.id and partno_id = v.partno_id)) as qty,'
      '       a.custno,'
      '       a.company,'
      '       s.mfgno,'
      '       s.id as standard_id'
      '  from '
      '       V_WORKORDERS_ASSY1 v,'
      '       sndop_dispatch d,'
      '       work_center w,'
      '       standard s,'
      '       sndop,'
      '       arcusto a'
      ' where '
      
        '       :tran_date between trunc(v.start_time) and trunc(v.end_ti' +
        'me) '
      '   and v.arinvt_id = :arinvt_id'
      ''
      '       -- sndop_dispatch'
      '   and v.id = d.workorder_id(+)'
      '   and v.partno_id = d.partno_id(+)'
      '   and v.ptoper_id = d.ptoper_id(+)'
      ''
      '       -- work center'
      '   and d.work_center_id = w.id(+)'
      ''
      '       -- mfgno'
      '   and v.standard_id = s.id'
      ''
      '       -- sndop'
      '   and v.sndop_id = sndop.id(+)'
      ''
      '       -- arcusto'
      '   and v.arcusto_id = a.id(+)'
      ''
      '   and (:inc_non_sched_wo = 1'
      '        or'
      '        :inc_non_sched_wo = 0 and v.assy_run = '#39'Y'#39')'
      '    '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 97
    Top = 38
    ParamData = <
      item
        Name = 'division_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'tran_date'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'inc_non_sched_wo'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QueryByDivisionWORKORDER_ID: TBCDField
      DisplayLabel = 'WO #'
      FieldName = 'WORKORDER_ID'
      Size = 0
    end
    object QueryByDivisionQTY: TFMTBCDField
      FieldName = 'QTY'
      Size = 38
    end
    object QueryByDivisionCUSTNO: TStringField
      FieldName = 'CUSTNO'
      FixedChar = True
      Size = 10
    end
    object QueryByDivisionCOMPANY: TStringField
      FieldName = 'COMPANY'
      FixedChar = True
      Size = 60
    end
    object QueryByDivisionEQNO: TStringField
      FieldName = 'EQNO'
      FixedChar = True
      Size = 87
    end
    object QueryByDivisionPOS: TFMTBCDField
      FieldName = 'POS'
      Size = 38
    end
    object QueryByDivisionMFGNO: TStringField
      FieldName = 'MFGNO'
      Size = 50
    end
    object QueryByDivisionSTANDARD_ID: TBCDField
      FieldName = 'STANDARD_ID'
      Size = 0
    end
  end
end
