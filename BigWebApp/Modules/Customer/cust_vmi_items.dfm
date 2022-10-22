object FrmCustVMIItems: TFrmCustVMIItems
  Left = 0
  Top = 0
  ClientHeight = 225
  ClientWidth = 532
  Caption = 'VMI Items'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 0
    Width = 532
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Caption = ''
    ExplicitTop = 27
  end
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 3
    Width = 532
    Height = 222
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 315
    IQComponents.Grid.Height = 136
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = wwDataSource1
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
    IQComponents.Navigator.DataSource = wwDataSource1
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 315
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 136
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitHeight = 109
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitHeight = 138
    DataSource = wwDataSource1
    Columns = <
      item
        FieldName = 'Itemno'
        Title.Caption = 'Item #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Rev'
        Title.Caption = 'Rev'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Descrip'
        Title.Caption = 'Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Eplant_name'
        Title.Caption = 'EPlant'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'LocationDescrip'
        Title.Caption = 'VMI Location'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    TabsVisible = True
    ExplicitTop = 30
    ExplicitHeight = 195
    Marker = 0
  end
  object wwDBLookupInventory: TUniDBLookupComboBox
    Left = 144
    Top = 52
    Width = 121
    Height = 21
    Hint = ''
    ListFieldIndex = 0
    DataField = 'ARINVT_ID'
    DataSource = wwDataSource1
    TabOrder = 1
    Color = clWindow
  end
  object wwDBLookupVMILocation: TUniDBLookupComboBox
    Left = 144
    Top = 94
    Width = 121
    Height = 21
    Hint = ''
    ListFieldIndex = 0
    DataField = 'LOCATIONS_ID'
    DataSource = wwDataSource1
    TabOrder = 2
    Color = clWindow
  end
  object wwDataSource1: TDataSource
    DataSet = wwTblVMI_ARINVT
    Left = 43
    Top = 58
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'wwTblVMI_ARINVT')
    SecurityCode = 'FRMSHIP_TO_VMI'
    Left = 23
    Top = 182
  end
  object wwTblVMI_ARINVT: TFDTable
    BeforePost = wwTblVMI_ARINVTBeforePost
    OnCalcFields = wwTblVMI_ARINVTCalcFields
    OnNewRecord = wwTblVMI_ARINVTNewRecord
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'VMI_ARINVT'
    TableName = 'VMI_ARINVT'
    Left = 64
    Top = 88
    object wwTblVMI_ARINVTItemno: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Itemno'
      Calculated = True
    end
    object wwTblVMI_ARINVTRev: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Rev'
      Calculated = True
    end
    object wwTblVMI_ARINVTDescrip: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Descrip'
      Calculated = True
    end
    object wwTblVMI_ARINVTEPlant_name: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Eplant_name'
      LookupDataSet = wwQryArinvt
      LookupKeyFields = 'ID'
      LookupResultField = 'EPLANT_NAME'
      Calculated = True
    end
    object wwTblVMI_ARINVTLocationDescrip: TStringField
      DisplayLabel = 'VMI Location'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'LocationDescrip'
      Calculated = True
    end
    object wwTblVMI_ARINVTID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Size = 0
    end
    object wwTblVMI_ARINVTARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object wwTblVMI_ARINVTSHIP_TO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SHIP_TO_ID'
      Visible = False
      Size = 0
    end
    object wwTblVMI_ARINVTLOCATIONS_ID: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'LOCATIONS_ID'
      Required = True
      Visible = False
      Size = 0
    end
    object wwTblVMI_ARINVTEPLANT_ID: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
  end
  object wwQryArinvt: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select a.id as id,'
      '       a.itemno as itemno,'
      '       a.descrip as descrip,'
      '       a.rev as rev,'
      '       e.id as eplant_id,'
      '       e.name as eplant_name'
      '  from arinvt a,eplant e'
      ' where e.id(+) = a.eplant_id'
      '   and misc.eplant_filter(e.id) = 1'
      'order by a.itemno')
    Left = 304
    Top = 40
    object wwQryArinvtREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 15
      FieldName = 'REV'
      Size = 15
    end
    object wwQryArinvtDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 100
      FieldName = 'DESCRIP'
      Size = 100
    end
    object wwQryArinvtEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 30
      FieldName = 'EPLANT_NAME'
      Size = 30
    end
    object wwQryArinvtID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object wwQryArinvtEPLANT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
    object wwQryArinvtITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Origin = 'ITEMNO'
      Required = True
      FixedChar = True
      Size = 50
    end
  end
  object wwQryShiptoVMILocations: TFDQuery
    BeforeOpen = wwQryShiptoVMILocationsBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select v.locations_id "ID",'
      '       l.loc_desc "LOC_DESC",'
      '       l.eplant_id "EPLANT_ID"'
      '  from ship_to_vmi v, locations l'
      ' where l.id = v.locations_id'
      '   and v.ship_to_id = :ship_to_id'
      '   and misc.eplant_filter(l.eplant_id) = 1')
    Left = 352
    Top = 56
    ParamData = <
      item
        Name = 'ship_to_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object wwQryShiptoVMILocationsLOC_DESC: TStringField
      DisplayLabel = 'VMI Location'
      DisplayWidth = 30
      FieldName = 'LOC_DESC'
      Size = 30
    end
    object wwQryShiptoVMILocationsEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object wwQryShiptoVMILocationsID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
end
