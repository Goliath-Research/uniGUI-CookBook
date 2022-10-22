object FrmToolConflict: TFrmToolConflict
  Left = 119
  Top = 113
  ClientHeight = 205
  ClientWidth = 608
  Caption = 'Potential Tools Conflict'
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 608
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Alignment = taLeftJustify
    Caption = ''
    object DBNavigator1: TUniDBNavigator
      Left = 508
      Top = 1
      Width = 100
      Height = 25
      Hint = ''
      DataSource = DataSource1
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object DBGrid1: TUniDBGrid
    Left = 0
    Top = 27
    Width = 608
    Height = 141
    Hint = ''
    DataSource = DataSource1
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Columns = <
      item
        FieldName = 'TOOL'
        Title.Caption = 'Tool'
        Width = 66
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TOOL_DESCRIP'
        Title.Caption = 'Tool Description'
        Width = 130
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EQNO'
        Title.Caption = 'Work Center'
        Width = 76
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CNTR_SEQ'
        Title.Caption = 'Schedule Position'
        Width = 97
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PROD_START_TIME'
        Title.Caption = 'Production Start'
        Width = 99
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PROD_END_TIME'
        Title.Caption = 'Production End'
        Width = 99
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 168
    Width = 608
    Height = 37
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Panel3: TUniPanel
      Left = 397
      Top = 1
      Width = 211
      Height = 35
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Button1: TUniButton
        Left = 2
        Top = 6
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Ignore'
        ModalResult = 5
        TabOrder = 1
      end
      object Button2: TUniButton
        Left = 106
        Top = 6
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 352
    Top = 64
  end
  object Query1: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select s.pmeqmt_id,'
      '       p.eqno as tool,'
      '       p.descrip as tool_descrip,'
      '       c.cntr_seq,'
      '       e.eqno,'
      '       c.prod_start_time,'
      '       c.prod_end_time'
      '  from cntr_sched c,'
      '       workorder w,'
      '       standard_pmeqmt s,'
      '       work_center e,'
      '       pmeqmt p'
      ' where c.workorder_id = w.id'
      '   and w.standard_id = s.standard_id'
      '   and e.id = c.work_center_id'
      '   and s.pmeqmt_id = p.id'
      '   '
      '   and s.pmeqmt_id in'
      '                 ( select s2.pmeqmt_id'
      '                     from standard_pmeqmt s2,'
      '                          workorder w2'
      '                    where w2.id = :workorder_id'
      '                      and s2.standard_id = w2.standard_id )'
      '   '
      '   and ( c.prod_start_time between :Start_Time and :End_Time '
      '         or '
      '         c.prod_end_time between :Start_Time and :End_Time '
      '         or'
      
        '         c.prod_start_time <= :Start_Time and c.prod_end_time >=' +
        ' :End_Time )'
      ' ')
    Left = 384
    Top = 64
    ParamData = <
      item
        Name = 'workorder_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'Start_Time'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'End_Time'
        DataType = ftDateTime
        ParamType = ptInput
      end>
    object Query1PMEQMT_ID: TBCDField
      FieldName = 'PMEQMT_ID'
      Size = 0
    end
    object Query1TOOL: TStringField
      DisplayLabel = 'Tool'
      FieldName = 'TOOL'
      Size = 25
    end
    object Query1TOOL_DESCRIP: TStringField
      DisplayLabel = 'Tool Description'
      FieldName = 'TOOL_DESCRIP'
      Size = 50
    end
    object Query1CNTR_SEQ: TBCDField
      DisplayLabel = 'Sched Pos'
      FieldName = 'CNTR_SEQ'
      Size = 0
    end
    object Query1EQNO: TStringField
      DisplayLabel = 'Work Center'
      FieldName = 'EQNO'
      Size = 60
    end
    object Query1PROD_START_TIME: TDateTimeField
      DisplayLabel = 'Prod Start'
      FieldName = 'PROD_START_TIME'
    end
    object Query1PROD_END_TIME: TDateTimeField
      DisplayLabel = 'Prod End'
      FieldName = 'PROD_END_TIME'
    end
  end
end
