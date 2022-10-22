object FrmShip_To_VMI: TFrmShip_To_VMI
  Left = 375
  Top = 195
  ClientHeight = 225
  ClientWidth = 380
  Caption = 'VMI Locations'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 27
    Width = 380
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Caption = ''
  end
  object Panel1: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 380
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnMasterLocations: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Edit Master Locations'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDFFFFFFFFFFDDDDD00000000
        00DDDDDD7777777777FDDDDD0FFFFFFFF0DDDDDD7FDDDDDDD7FDDDDD0FFFFFFF
        F0DDDDDD7FDDDDDDD7FDDDDD0FF80FFFF0DDDDDD7FD87FDDD7FDDDDD0F800FFF
        F0DDDDDD7F877FDDD7FDDDDD080B0FFFF0DDDDDD787F7DDDD7FDDDDD00B0FFFF
        F0DDDDDD77F7DDDDD7FDDDDD0B0FFFFFF0DDDDDD7F7DDDDDD7FDDDD0B0FFFFFF
        F0DDDDD7F7DDDDDDD7FDDD0B0FFFFFFFF0DDDD7F7FDDDDDDD7FDD0B07FFFFFFF
        F0DDD7F77FFFFFFFF7FDD90D0000000000DDD77D7777777777DDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnMasterLocationsClick
    end
  end
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 30
    Width = 380
    Height = 195
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 163
    IQComponents.Grid.Height = 109
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
    IQComponents.HiddenPanel.Left = 163
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 109
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = wwDataSource1
    Columns = <
      item
        FieldName = 'Loc_Desc'
        Title.Caption = 'VMI Location'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Loc_Full_Description'
        Title.Caption = 'Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    TabsVisible = True
    Marker = 0
  end
  object wwDBLookupCombo1: TUniDBLookupComboBox
    Left = 72
    Top = 110
    Width = 121
    Height = 21
    Hint = ''
    ListField = 'DESCRIP'
    ListSource = SrcQryLocation
    KeyField = 'ID'
    ListFieldIndex = 0
    DataField = 'LOCATIONS_ID'
    DataSource = wwDataSource1
    TabOrder = 2
    Color = clWindow
  end
  object wwDataSource1: TDataSource
    DataSet = wwTblShip_To_VMI
    Left = 67
    Top = 58
  end
  object wwTblShip_To_VMI: TFDTable
    BeforePost = wwTblShip_To_VMIBeforePost
    OnCalcFields = wwTblShip_To_VMICalcFields
    IndexFieldNames = 'SHIP_TO_ID'
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'SHIP_TO_VMI'
    TableName = 'SHIP_TO_VMI'
    Left = 283
    Top = 155
    object wwTblShip_To_VMILoc_Desc: TStringField
      DisplayLabel = 'VMI Location'
      DisplayWidth = 23
      FieldKind = fkCalculated
      FieldName = 'Loc_Desc'
      Size = 30
      Calculated = True
    end
    object wwTblShip_To_VMILoc_Full_Description: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 33
      FieldKind = fkCalculated
      FieldName = 'Loc_Full_Description'
      Size = 50
      Calculated = True
    end
    object wwTblShip_To_VMIID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object wwTblShip_To_VMISHIP_TO_ID: TBCDField
      FieldName = 'SHIP_TO_ID'
      Visible = False
      Size = 0
    end
    object wwTblShip_To_VMILOCATIONS_ID: TBCDField
      DisplayLabel = 'Locations ID'
      FieldName = 'LOCATIONS_ID'
      Required = True
      Visible = False
      Size = 0
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'wwTblShip_To_VMI'
      'NavMain'
      'sbtnMasterLocations')
    SecurityCode = 'FRMSHIP_TO_VMI'
    Left = 135
    Top = 78
  end
  object wwQryLocationsLookup: TFDQuery
    BeforeOpen = AssignEPlantFilter
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, '
      '       loc_desc,'
      '       descrip,'
      '       eplant_id'
      '  from locations'
      ' where NVL(vmi, '#39'N'#39') = '#39'Y'#39
      ' order by loc_desc'
      ' ')
    Left = 228
    Top = 60
    object wwQryLocationsLookupLOC_DESC: TStringField
      DisplayLabel = 'Location'
      DisplayWidth = 15
      FieldName = 'LOC_DESC'
      Size = 30
    end
    object wwQryLocationsLookupDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Size = 50
    end
    object wwQryLocationsLookupEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object wwQryLocationsLookupID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object SrcQryLocation: TDataSource
    DataSet = wwQryLocationsLookup
    Left = 184
    Top = 40
  end
end
