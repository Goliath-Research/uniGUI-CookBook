object FrmProjectedHoursShift: TFrmProjectedHoursShift
  Left = 200
  Top = 108
  ClientHeight = 195
  ClientWidth = 317
  Caption = ''
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 317
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object DBNavigator1: TUniDBNavigator
      Left = 217
      Top = 1
      Width = 100
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
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
    Width = 317
    Height = 168
    Hint = ''
    DataSource = DataSource1
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    ParentColor = False
    Color = clBtnFace
    Columns = <
      item
        FieldName = 'SHIFT'
        Title.Caption = 'Shift'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SHIFT_HRS'
        Title.Caption = 'Production Hours'
        Width = 106
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SETUPHRS'
        Title.Caption = 'Setup Hours'
        Width = 93
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 128
    Top = 104
  end
  object Query1: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select shift,'
      '       shift_hrs,'
      '       setuphrs'
      '  from day_labor '
      ' where day_hrs_id = :day_hrs_id'
      ' order by shift')
    Left = 64
    Top = 88
    ParamData = <
      item
        Name = 'day_hrs_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object Query1SHIFT: TBCDField
      DisplayLabel = 'Shift'
      FieldName = 'SHIFT'
      Origin = 'DAY_LABOR.SHIFT'
      Size = 0
    end
    object Query1SHIFT_HRS: TFMTBCDField
      DisplayLabel = 'Prod Hrs'
      FieldName = 'SHIFT_HRS'
      Origin = 'DAY_LABOR.SHIFT_HRS'
      Size = 6
    end
    object Query1SETUPHRS: TFMTBCDField
      DisplayLabel = 'Setup Hrs'
      FieldName = 'SETUPHRS'
      Origin = 'DAY_LABOR.SETUPHRS'
      Size = 6
    end
  end
end
