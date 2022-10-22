object FrmBOM_Labor: TFrmBOM_Labor
  Left = 213
  Top = 166
  HelpContext = 1250433
  ClientHeight = 175
  ClientWidth = 428
  Caption = 'BOM Labor'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 428
    Height = 175
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 211
    IQComponents.Grid.Height = 89
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = wwSrcBom_Labor
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
    IQComponents.Navigator.DataSource = wwSrcBom_Labor
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 211
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 89
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = wwSrcBom_Labor
    Columns = <
      item
        FieldName = 'OPERATOR'
        Title.Caption = 'Operators'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Code'
        Title.Caption = 'Code'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Descrip'
        Title.Caption = 'Descrip'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Labor_Rate'
        Title.Caption = 'Labor Rate'
        Width = 64
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object wwDBLookupCombo1: TUniDBLookupComboBox
    Left = 79
    Top = 79
    Width = 95
    Height = 21
    Hint = ''
    ListFieldIndex = 0
    TabOrder = 1
    Color = clWindow
  end
  object wwDBLookupCombo2: TUniDBLookupComboBox
    Left = 187
    Top = 79
    Width = 105
    Height = 21
    Hint = ''
    ListFieldIndex = 0
    TabOrder = 2
    Color = clWindow
  end
  object wwSrcBom_Labor: TDataSource
    DataSet = wwQryBom_Labor
    Left = 30
    Top = 80
  end
  object wwQryBom_Labor: TFDQuery
    AfterPost = wwQryBom_LaborAfterPost
    AfterDelete = wwQryBom_LaborAfterPost
    OnCalcFields = wwQryBom_LaborCalcFields
    OnNewRecord = wwQryBom_LaborNewRecord
    Connection = UniMainModule.FDConnection1
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select b.id,'
      '       b.standard_id,'
      '       b.emp_level_id,'
      '       b.operator'
      '  from bom_labor b'
      ' where standard_id = :id'
      ' ')
    Left = 30
    Top = 99
    ParamData = <
      item
        Name = 'id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object wwQryBom_LaborOPERATOR: TBCDField
      DisplayLabel = 'Operators'
      DisplayWidth = 10
      FieldName = 'OPERATOR'
      Origin = 'IQ.BOM_LABOR.OPERATOR'
      Required = True
      Size = 2
    end
    object wwQryBom_LaborCode: TStringField
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'Code'
      LookupDataSet = wwQryLookupCode
      LookupKeyFields = 'ID'
      LookupResultField = 'CODE'
      KeyFields = 'EMP_LEVEL_ID'
      Required = True
      Size = 10
      Lookup = True
    end
    object wwQryBom_LaborDescrip: TStringField
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'Descrip'
      LookupDataSet = wwQryLookupDescrip
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIP'
      KeyFields = 'EMP_LEVEL_ID'
      Size = 30
      Lookup = True
    end
    object wwQryBom_LaborLabor_Rate: TFloatField
      DisplayLabel = 'Labor Rate'
      DisplayWidth = 12
      FieldKind = fkCalculated
      FieldName = 'Labor_Rate'
      ReadOnly = True
      Calculated = True
    end
    object wwQryBom_LaborID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.BOM_LABOR.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object wwQryBom_LaborSTANDARD_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'STANDARD_ID'
      Origin = 'IQ.BOM_LABOR.STANDARD_ID'
      Required = True
      Visible = False
      Size = 0
    end
    object wwQryBom_LaborEMP_LEVEL_ID: TBCDField
      DisplayLabel = 'Employee Level Code'
      DisplayWidth = 10
      FieldName = 'EMP_LEVEL_ID'
      Origin = 'IQ.BOM_LABOR.EMP_LEVEL_ID'
      Required = True
      Visible = False
      Size = 0
    end
  end
  object wwQryLookupCode: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, code, descrip'
      '  from emp_level'
      '  order by code')
    Left = 80
    Top = 101
    object wwQryLookupCodeCODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 10
      FieldName = 'CODE'
      Origin = 'IQ.EMP_LEVEL.CODE'
      Size = 10
    end
    object wwQryLookupCodeDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'IQ.EMP_LEVEL.DESCRIP'
      Size = 30
    end
    object wwQryLookupCodeID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.EMP_LEVEL.ID'
      Visible = False
      Size = 0
    end
  end
  object wwQryLookupDescrip: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, code, descrip'
      '  from emp_level'
      '  order by descrip')
    Left = 187
    Top = 100
    object wwQryLookupDescripDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'IQ.EMP_LEVEL.DESCRIP'
      Size = 30
    end
    object wwQryLookupDescripCODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 10
      FieldName = 'CODE'
      Origin = 'IQ.EMP_LEVEL.CODE'
      Size = 10
    end
    object wwQryLookupDescripID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.EMP_LEVEL.ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into bom_labor'
      '  (ID, STANDARD_ID, EMP_LEVEL_ID, OPERATOR)'
      'values'
      '  (:ID, :STANDARD_ID, :EMP_LEVEL_ID, :OPERATOR)')
    ModifySQL.Strings = (
      'update bom_labor'
      'set'
      '  ID = :ID,'
      '  STANDARD_ID = :STANDARD_ID,'
      '  EMP_LEVEL_ID = :EMP_LEVEL_ID,'
      '  OPERATOR = :OPERATOR'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from bom_labor'
      'where'
      '  ID = :OLD_ID')
    Left = 30
    Top = 129
  end
  object SrcCode: TDataSource
    DataSet = wwQryLookupCode
    Left = 136
    Top = 29
  end
  object SrcDescrip: TDataSource
    DataSet = wwQryLookupDescrip
    Left = 264
    Top = 29
  end
end
