object FrmInvWMSEquipment: TFrmInvWMSEquipment
  Left = 0
  Top = 0
  ClientHeight = 292
  ClientWidth = 591
  Caption = 'WMS Equipment'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 591
    Height = 292
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 374
    IQComponents.Grid.Height = 206
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcWmsEqmt
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
    IQComponents.Navigator.DataSource = SrcWmsEqmt
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 374
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 206
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitHeight = 178
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitHeight = 207
    DataSource = SrcWmsEqmt
    Columns = <
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Equipment Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EPlantDisp'
        Title.Caption = 'EPlant Name'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DivisionDisp'
        Title.Caption = 'Division Name'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    ExplicitTop = 28
    ExplicitHeight = 264
    Marker = 0
  end
  object wwDBLookupComboDivision: TUniDBLookupComboBox
    Left = 89
    Top = 144
    Width = 176
    Height = 21
    Hint = ''
    ListField = 'ID'
    ListSource = SrcwwQryDivisionLookup
    KeyField = 'NAME'
    ListFieldIndex = 0
    DataField = 'DIVISION_ID'
    DataSource = SrcWmsEqmt
    TabStop = False
    TabOrder = 1
    Color = clBtnFace
  end
  object wwDBComboDlgEplant: TUniEdit
    Left = 89
    Top = 117
    Width = 176
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 2
    Color = clBtnFace
    ReadOnly = True
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'QryWmsEqmt'
      'NavMain')
    SecurityCode = 'FRMINVWMSEQUIPMENT'
    Left = 88
    Top = 80
  end
  object SrcWmsEqmt: TDataSource
    DataSet = QryWmsEqmt
    Left = 44
    Top = 80
  end
  object QryWmsEqmt: TFDQuery
    BeforePost = QryWmsEqmtBeforePost
    AfterPost = ApplyUpdate
    AfterDelete = ApplyUpdate
    OnCalcFields = QryWmsEqmtCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'wms_eqmt'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLWmsEqmt
    SQL.Strings = (
      'select id, descrip, eplant_id, division_id from wms_eqmt'
      'order by descrip')
    Left = 44
    Top = 164
    object QryWmsEqmtDESCRIP: TStringField
      DisplayLabel = 'Equipment Description'
      DisplayWidth = 50
      FieldName = 'DESCRIP'
      Size = 50
    end
    object QryWmsEqmtEPlantDisp: TStringField
      DisplayLabel = 'EPlant Name'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'EPlantDisp'
      Size = 30
      Calculated = True
    end
    object QryWmsEqmtDivisionDisp: TStringField
      DisplayLabel = 'Division Name'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'DivisionDisp'
      LookupDataSet = wwQryDivisionLookup
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'DIVISION_ID'
      Size = 30
      Lookup = True
    end
    object QryWmsEqmtDIVISION_ID: TBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Division Name'
      DisplayWidth = 16
      FieldName = 'DIVISION_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryWmsEqmtID: TBCDField
      AutoGenerateValue = arDefault
      DisplayWidth = 16
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryWmsEqmtEPLANT_ID: TBCDField
      AutoGenerateValue = arDefault
      DisplayWidth = 16
      FieldName = 'EPLANT_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object UpdateSQLWmsEqmt: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into wms_eqmt'
      '  (ID, DESCRIP, EPLANT_ID, DIVISION_ID)'
      'values'
      '  (:ID, :DESCRIP, :EPLANT_ID, :DIVISION_ID)')
    ModifySQL.Strings = (
      'update wms_eqmt'
      'set'
      '  ID = :ID,'
      '  DESCRIP = :DESCRIP,'
      '  EPLANT_ID = :EPLANT_ID,'
      '  DIVISION_ID = :DIVISION_ID'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from wms_eqmt'
      'where'
      '  ID = :OLD_ID')
    Left = 164
    Top = 208
  end
  object wwQryDivisionLookup: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select d.id, '
      '       d.name,'
      '       e.name as eplant_name'
      '  from division d,'
      '       eplant e'
      ' where d.eplant_id = e.id(+)'
      ' ')
    Left = 268
    Top = 203
    object wwQryDivisionLookupNAME: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 15
      FieldName = 'NAME'
      Size = 25
    end
    object wwQryDivisionLookupEPLANT_NAME: TStringField
      DisplayLabel = 'Division EPlant'
      DisplayWidth = 15
      FieldName = 'EPLANT_NAME'
      Size = 30
    end
    object wwQryDivisionLookupID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object SrcwwQryDivisionLookup: TDataSource
    DataSet = wwQryDivisionLookup
    Left = 288
    Top = 152
  end
end
