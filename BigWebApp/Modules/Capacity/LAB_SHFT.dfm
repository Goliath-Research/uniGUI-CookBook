inherited FrmLabor_Shift: TFrmLabor_Shift
  ClientHeight = 220
  ClientWidth = 390
  Caption = 'Labor Capacity by Shift'
  ExplicitWidth = 406
  ExplicitHeight = 258
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Width = 390
    ExplicitWidth = 390
    inherited DBNavigator1: TUniDBNavigator
      Left = 289
      ExplicitLeft = 289
    end
  end
  inherited DBGrid1: TUniDBGrid
    Width = 390
    Height = 193
    DataSource = DataSource1
    Columns = <
      item
        FieldName = 'SHIFT'
        Title.Caption = 'Shift '
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SHIFT_HRS'
        Title.Caption = 'Production Hours'
        Width = 103
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'LABOR_HRS'
        Title.Caption = 'Labor Hours'
        Width = 83
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SETUPHRS'
        Title.Caption = 'Setup Hours'
        Width = 89
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select shift,'
      '       shift_hrs,'
      '       labor_hrs,'
      '       setuphrs'
      '  from v_day_labor'
      ' where day_hrs_id = :day_hrs_id'
      
        '   and ( :sched_only = '#39'Y'#39' and is_scheduled = '#39'Y'#39' or :sched_only' +
        ' <> '#39'Y'#39' )'
      '   and NVL(emp_level_id,0) = NVL(:emp_level_id,0)'
      ' order by shift'
      '                ')
    ParamData = <
      item
        Name = 'day_hrs_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'sched_only'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'emp_level_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object Query1SHIFT: TBCDField
      DisplayLabel = 'Shift '
      FieldName = 'SHIFT'
      Origin = 'V_DAY_LABOR_COMB.SHIFT'
      Size = 0
    end
    object Query1SHIFT_HRS: TFMTBCDField
      DisplayLabel = 'Prod Hrs'
      FieldName = 'SHIFT_HRS'
      Origin = 'V_DAY_LABOR_COMB.SHIFT_HRS'
      DisplayFormat = '#####0.00'
      Size = 6
    end
    object Query1LABOR_HRS: TFMTBCDField
      DisplayLabel = 'Labor Hrs'
      FieldName = 'LABOR_HRS'
      Origin = 'V_DAY_LABOR_COMB.LABOR_HRS'
      DisplayFormat = '#####0.00'
      Size = 6
    end
    object Query1SETUPHRS: TFMTBCDField
      DisplayLabel = 'SU'
      FieldName = 'SETUPHRS'
      Origin = 'V_DAY_LABOR_COMB.SETUPHRS'
      DisplayFormat = '#####0.00'
      Size = 6
    end
  end
end
