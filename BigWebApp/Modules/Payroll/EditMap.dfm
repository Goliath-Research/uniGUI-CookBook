object FrmEditMap: TFrmEditMap
  Left = 66
  Top = 180
  ClientHeight = 374
  ClientWidth = 580
  Caption = 'Edit Mapping Table'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 27
    Width = 580
    Height = 347
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 363
    IQComponents.Grid.Height = 261
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcMap
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
    IQComponents.Navigator.DataSource = SrcMap
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.Navigator.BeforeAction = DBNavigator1BeforeAction
    IQComponents.HiddenPanel.Left = 363
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 261
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitLeft = 0
    IQComponents.FormTab.ExplicitTop = 0
    IQComponents.FormTab.ExplicitWidth = 256
    IQComponents.FormTab.ExplicitHeight = 128
    DataSource = SrcMap
    Columns = <
      item
        FieldName = 'LOOKUP_VALUE'
        Title.Caption = 'LookUp Value'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'LOOKUP_TABLE'
        Title.Caption = 'LookUp Table'
        Width = 140
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'USER_VALUE'
        Title.Caption = 'User Value'
        Width = 140
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
    object dbAllTables: TUniDBLookupComboBox
      Left = 40
      Top = 184
      Width = 121
      Height = 21
      Hint = ''
      ListField = 'TABLE_NAME'
      ListSource = ds_AllTables
      KeyField = 'TABLE_NAME'
      ListFieldIndex = 0
      TabOrder = 3
      Color = clWindow
    end
    object dbLookUpValue: TUniEdit
      Left = 48
      Top = 144
      Width = 121
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 2
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 580
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
  end
  object MainMenu1: TUniMainMenu
    Left = 368
    Top = 64
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Edit Mapping Table'
    Version = 'DEV.176554'
    BuildVersion = '176554'
    Left = 432
    Top = 64
  end
  object SrcMap: TDataSource
    DataSet = QryMap
    Left = 24
    Top = 147
  end
  object QryMap: TFDQuery
    BeforePost = QryMapBeforePost
    AfterPost = QryMapAfterPost
    AfterDelete = QryMapAfterPost
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'iq_mapping'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select id,'
      '       pr_import_tables_id,'
      '       lookup_value,'
      '       lookup_table,'
      '       user_value'
      '  from iq_mapping')
    Left = 88
    Top = 104
    object QryMapLOOKUP_VALUE: TBCDField
      DisplayLabel = 'LookUp Value'
      DisplayWidth = 10
      FieldName = 'LOOKUP_VALUE'
      Origin = 'LOOKUP_VALUE'
      Size = 0
    end
    object QryMapLOOKUP_TABLE: TStringField
      DisplayLabel = 'LookUp Table'
      DisplayWidth = 20
      FieldName = 'LOOKUP_TABLE'
      Origin = 'LOOKUP_TABLE'
      Size = 50
    end
    object QryMapUSER_VALUE: TStringField
      DisplayLabel = 'User Value'
      DisplayWidth = 20
      FieldName = 'USER_VALUE'
      Origin = 'USER_VALUE'
      Size = 250
    end
    object QryMapID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.IQ_MAPPING.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryMapPR_IMPORT_TABLES_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PR_IMPORT_TABLES_ID'
      Origin = 'PR_IMPORT_TABLES_ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into iq_mapping'
      '  (ID, PR_IMPORT_TABLES_ID, LOOKUP_VALUE, LOOKUP_TABLE, '
      'USER_VALUE)'
      'values'
      '  (:ID, :PR_IMPORT_TABLES_ID, :LOOKUP_VALUE, :LOOKUP_TABLE, '
      ':USER_VALUE)')
    ModifySQL.Strings = (
      'update iq_mapping'
      'set'
      '  ID = :ID,'
      '  PR_IMPORT_TABLES_ID = :PR_IMPORT_TABLES_ID,'
      '  LOOKUP_VALUE = :LOOKUP_VALUE,'
      '  LOOKUP_TABLE = :LOOKUP_TABLE,'
      '  USER_VALUE = :USER_VALUE'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from iq_mapping'
      'where'
      '  ID = :OLD_ID')
    Left = 240
    Top = 160
  end
  object QryAllTables: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select table_name '
      '  from all_tables '
      ' where owner = '#39'IQMS'#39
      ' order by table_name  ')
    Left = 187
    Top = 96
    object QryAllTablesTABLE_NAME: TStringField
      DisplayLabel = 'Table Name'
      DisplayWidth = 30
      FieldName = 'TABLE_NAME'
      Origin = 'ALL_TABLES.TABLE_NAME'
      Size = 30
    end
  end
  object Pk: TIQWebHpick
    ConnectionName = 'IQFD'
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 288
    Top = 99
  end
  object ds_AllTables: TDataSource
    DataSet = QryAllTables
    Left = 188
    Top = 152
  end
end
