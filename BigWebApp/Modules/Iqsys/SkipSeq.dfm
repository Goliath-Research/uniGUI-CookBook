object FrmSkippedSeq: TFrmSkippedSeq
  Left = 251
  Top = 209
  ClientHeight = 164
  ClientWidth = 382
  Caption = 'Skipped Sequences'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 0
    Width = 382
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    ExplicitTop = 27
  end
  object DBGrid1: TUniDBGrid
    Left = 0
    Top = 3
    Width = 382
    Height = 161
    Hint = ''
    DataSource = DataSource1
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Columns = <
      item
        FieldName = 'ACTION'
        Title.Caption = 'Action'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ORIGINAL_VALUE'
        Title.Caption = 'Original Value'
        Width = 78
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'NEW_VALUE'
        Title.Caption = 'New Value'
        Width = 74
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DATETIME_STAMP'
        Title.Caption = 'Time Stamp'
        Width = 72
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'USERID'
        Title.Caption = 'User ID'
        Width = 58
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 112
    Top = 40
  end
  object Query1: TFDQuery
    BeforeOpen = Query1BeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select action,'
      '       original_value,'
      '       new_value,'
      '       datetime_stamp,'
      '       userid'
      '  from skipped_seq'
      ' where'
      '       module_name = :module_name'
      '   and table_name  = :table_name'
      '   and field_name  = :field_name'
      ' order by'
      '       datetime_stamp desc'
      '       ')
    Left = 112
    Top = 56
    ParamData = <
      item
        Name = 'module_name'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'table_name'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'field_name'
        DataType = ftString
        ParamType = ptInput
      end>
    object Query1ACTION: TStringField
      DisplayLabel = 'Action'
      DisplayWidth = 20
      FieldName = 'ACTION'
      Size = 50
    end
    object Query1ORIGINAL_VALUE: TStringField
      DisplayLabel = 'Original Value'
      DisplayWidth = 20
      FieldName = 'ORIGINAL_VALUE'
      Size = 50
    end
    object Query1NEW_VALUE: TStringField
      DisplayLabel = 'New Value'
      DisplayWidth = 20
      FieldName = 'NEW_VALUE'
      Size = 50
    end
    object Query1DATETIME_STAMP: TDateTimeField
      DisplayLabel = 'TimeStamp'
      FieldName = 'DATETIME_STAMP'
    end
    object Query1USERID: TStringField
      DisplayLabel = 'User ID'
      FieldName = 'USERID'
      Size = 35
    end
  end
end
