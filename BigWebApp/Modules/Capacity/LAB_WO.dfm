inherited FrmLabor_WO: TFrmLabor_WO
  Left = 160
  Top = 142
  ClientHeight = 277
  ClientWidth = 608
  Caption = 'Labor Capacity Planning by Day'
  ExplicitWidth = 624
  ExplicitHeight = 316
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Width = 608
    ExplicitWidth = 608
    inherited DBNavigator1: TUniDBNavigator
      Left = 508
      ExplicitLeft = 508
    end
  end
  inherited DBGrid1: TUniDBGrid
    Width = 608
    Height = 250
    DataSource = DataSource1
    OnDblClick = gridDayDblClick
    Columns = <
      item
        FieldName = 'PROD_DATE'
        Title.Caption = 'Production Date'
        Width = 112
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'WORKORDER_ID'
        Title.Caption = 'Work Order #'
        Width = 95
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'MFGNO'
        Title.Caption = 'Manufacturing #'
        Width = 121
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SHIFT_HRS'
        Title.Caption = 'Production Hours'
        Width = 95
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'LABOR_HRS'
        Title.Caption = 'Labor Hours'
        Width = 74
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SETUPHRS'
        Title.Caption = 'Setup Hours'
        Width = 85
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  inherited Query1: TFDQuery
    OnCalcFields = Query1CalcFields
    SQL.Strings = (
      'select day_hrs_id,'
      '       prod_date,'
      '       workorder_id,'
      '       mfgno,'
      '       emp_level_id,'
      '       Sum( shift_hrs ) as shift_hrs,'
      '       Sum( labor_hrs ) as labor_hrs,'
      '       Sum( setuphrs  ) as setuphrs'
      '  from v_day_labor'
      ' where mfgtype = :mfgtype'
      '   and ( :mfgcell = '#39'*'#39
      '         or '
      '         NVL(mfgcell,'#39'*'#39') = NVL(:mfgcell, '#39'*'#39'))'
      '   and prod_date = :prod_date'
      
        '   and ( :sched_only = '#39'Y'#39' and is_scheduled = '#39'Y'#39' or :sched_only' +
        ' <> '#39'Y'#39' )'
      '   and NVL(emp_level_id,0) = NVL(:emp_level_id,0)'
      ' group by day_hrs_id,'
      '          prod_date,'
      '          workorder_id,'
      '          mfgno,'
      '          emp_level_id'
      '')
    ParamData = <
      item
        Name = 'mfgtype'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'mfgcell'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'prod_date'
        DataType = ftDateTime
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
    object Query1DAY_HRS_ID: TBCDField
      FieldName = 'DAY_HRS_ID'
      Size = 0
    end
    object Query1PROD_DATE: TDateTimeField
      FieldName = 'PROD_DATE'
    end
    object Query1WORKORDER_ID: TBCDField
      FieldName = 'WORKORDER_ID'
      Size = 0
    end
    object Query1MFGNO: TStringField
      FieldName = 'MFGNO'
      Size = 50
    end
    object Query1SHIFT_HRS: TFMTBCDField
      FieldName = 'SHIFT_HRS'
      DisplayFormat = '#####0.00'
      Size = 38
    end
    object Query1LABOR_HRS: TFMTBCDField
      FieldName = 'LABOR_HRS'
      DisplayFormat = '#####0.00'
      Size = 38
    end
    object Query1SETUPHRS: TFMTBCDField
      FieldName = 'SETUPHRS'
      DisplayFormat = '#####0.00'
      Size = 38
    end
    object Query1Sched_Only: TStringField
      FieldKind = fkCalculated
      FieldName = 'Sched_Only'
      Visible = False
      Size = 1
      Calculated = True
    end
    object Query1EMP_LEVEL_ID: TBCDField
      FieldName = 'EMP_LEVEL_ID'
      Visible = False
      Size = 0
    end
  end
end
