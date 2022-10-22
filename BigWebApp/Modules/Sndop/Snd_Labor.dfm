object FrmSndOp_Labor: TFrmSndOp_Labor
  Left = 213
  Top = 166
  ClientHeight = 271
  ClientWidth = 416
  Caption = 'Process Labor'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 27
    Width = 416
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
    Caption = ''
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 416
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object NavMain: TUniDBNavigator
      Left = 191
      Top = 1
      Width = 225
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = wwSrcSndOp_Labor
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 30
    Width = 416
    Height = 241
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 199
    IQComponents.Grid.Height = 155
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = wwSrcSndOp_Labor
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
    IQComponents.Navigator.DataSource = wwSrcSndOp_Labor
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 199
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 155
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = wwSrcSndOp_Labor
    Columns = <
      item
        FieldName = 'OPERATOR'
        Title.Caption = 'Operators'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Code'
        Title.Caption = 'Code'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Descrip'
        Title.Caption = 'Description'
        Width = 210
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Labor_Rate'
        Title.Caption = 'Labor Rate'
        Width = 70
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
    TabOrder = 2
    Color = clWindow
  end
  object wwDBLookupCombo2: TUniDBLookupComboBox
    Left = 187
    Top = 79
    Width = 105
    Height = 21
    Hint = ''
    ListFieldIndex = 0
    TabOrder = 3
    Color = clWindow
  end
  object wwSrcSndOp_Labor: TDataSource
    DataSet = wwQrySndOp_Labor
    Left = 30
    Top = 80
  end
  object wwQrySndOp_Labor: TFDQuery
    AfterPost = wwQrySndOp_LaborAfterPost
    AfterDelete = wwQrySndOp_LaborAfterPost
    OnCalcFields = wwQrySndOp_LaborCalcFields
    OnNewRecord = wwQrySndOp_LaborNewRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'SNDOP_LABOR'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select b.id,'
      '       b.sndop_id,'
      '       b.emp_level_id,'
      '       b.operator'
      '  from sndop_labor b'
      ' where sndop_id = :id'
      ' '
      ' ')
    Left = 30
    Top = 111
    ParamData = <
      item
        Name = 'id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object wwQrySndOp_LaborOPERATOR: TBCDField
      DisplayLabel = 'Operators'
      DisplayWidth = 10
      FieldName = 'OPERATOR'
      Origin = 'IQ.BOM_LABOR.OPERATOR'
      Required = True
      Size = 2
    end
    object wwQrySndOp_LaborCode: TStringField
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
    object wwQrySndOp_LaborDescrip: TStringField
      DisplayLabel = 'Description'
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
    object wwQrySndOp_LaborLabor_Rate: TFloatField
      DisplayLabel = 'Labor Rate'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Labor_Rate'
      ReadOnly = True
      Calculated = True
    end
    object wwQrySndOp_LaborID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.BOM_LABOR.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object wwQrySndOp_LaborEMP_LEVEL_ID: TBCDField
      DisplayLabel = 'Employee Level Code/Description'
      DisplayWidth = 10
      FieldName = 'EMP_LEVEL_ID'
      Origin = 'IQ.BOM_LABOR.EMP_LEVEL_ID'
      Required = True
      Visible = False
      Size = 0
    end
    object wwQrySndOp_LaborSNDOP_ID: TBCDField
      FieldName = 'SNDOP_ID'
      Origin = 'IQ.SNDOP_LABOR.SNDOP_ID'
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
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'INSERT INTO SNDOP_LABOR'
      '(ID, SNDOP_ID, EMP_LEVEL_ID, OPERATOR)'
      
        'VALUES (:NEW_ID, :NEW_SNDOP_ID, :NEW_EMP_LEVEL_ID, :NEW_OPERATOR' +
        ')')
    ModifySQL.Strings = (
      'UPDATE SNDOP_LABOR'
      
        'SET ID = :NEW_ID, SNDOP_ID = :NEW_SNDOP_ID, EMP_LEVEL_ID = :NEW_' +
        'EMP_LEVEL_ID, '
      '  OPERATOR = :NEW_OPERATOR'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM SNDOP_LABOR'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT ID, SNDOP_ID, EMP_LEVEL_ID, OPERATOR'
      'FROM SNDOP_LABOR'
      'WHERE ID = :ID')
    Left = 30
    Top = 141
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'wwQrySndOp_Labor'
      'wwQrySndOp_LaborLabor_Rate')
    SecurityCode = 'FRMSNDOP_LABOR'
    Left = 32
    Top = 176
  end
end
