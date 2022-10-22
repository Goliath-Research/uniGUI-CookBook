object FrmInvTransShuttleLocs: TFrmInvTransShuttleLocs
  Left = 0
  Top = 0
  HelpContext = 25745
  ClientHeight = 337
  ClientWidth = 744
  Caption = 'Shuttle Transfer Locations'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 744
    Height = 337
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitTop = 28
    ExplicitHeight = 309
    object wwDBGrid1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 742
      Height = 335
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 525
      IQComponents.Grid.Height = 249
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcDivStaging
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
      IQComponents.Navigator.DataSource = SrcDivStaging
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 525
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 249
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.HiddenPanel.ExplicitHeight = 221
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      IQComponents.FormTab.ExplicitHeight = 250
      DataSource = SrcDivStaging
      Columns = <
        item
          FieldName = 'FromDivision'
          Title.Caption = 'Division/Warehouse'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'FromLocation'
          Title.Caption = 'Location'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ToDivision'
          Title.Caption = 'Division/Warehouse'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ToLocation'
          Title.Caption = 'Location'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      ExplicitHeight = 307
      Marker = 0
    end
    object wwDBComboDlgFromDiv: TUniEdit
      Left = 40
      Top = 176
      Width = 121
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 1
      ReadOnly = True
    end
    object wwDBComboDlgFromLoc: TUniEdit
      Left = 180
      Top = 176
      Width = 121
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 2
      ReadOnly = True
    end
    object wwDBComboDlgToDiv: TUniEdit
      Left = 316
      Top = 176
      Width = 121
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 3
      ReadOnly = True
    end
    object wwDBComboDlgToLoc: TUniEdit
      Left = 448
      Top = 176
      Width = 121
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 4
      ReadOnly = True
    end
  end
  object SrcDivStaging: TDataSource
    DataSet = QryDivStaging
    Left = 40
    Top = 96
  end
  object QryDivStaging: TFDQuery
    BeforePost = QryDivStagingBeforePost
    AfterPost = ApplyUpdate
    AfterDelete = ApplyUpdate
    OnCalcFields = QryDivStagingCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = ' div_staging_loc'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLDivStaging
    SQL.Strings = (
      'select dsl.id,'
      '       dsl.from_division_id,'
      '       dsl.to_division_id,'
      '       dsl.from_locations_id,'
      '       dsl.to_locations_id'
      '  from div_staging_loc dsl'
      ' order by dsl.id        ')
    Left = 40
    Top = 128
    object QryDivStagingFromDivision: TStringField
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'FromDivision'
      Size = 25
      Calculated = True
    end
    object QryDivStagingToDivision: TStringField
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'ToDivision'
      Size = 30
      Calculated = True
    end
    object QryDivStagingFromLocation: TStringField
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'FromLocation'
      Size = 30
      Calculated = True
    end
    object QryDivStagingToLocation: TStringField
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'ToLocation'
      Size = 30
      Calculated = True
    end
    object QryDivStagingID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
    object QryDivStagingFROM_DIVISION_ID: TBCDField
      DisplayLabel = 'From Division/Warehouse'
      FieldName = 'FROM_DIVISION_ID'
      Origin = 'FROM_DIVISION_ID'
      Precision = 15
      Size = 0
    end
    object QryDivStagingTO_DIVISION_ID: TBCDField
      DisplayLabel = 'To Division/Warehouse'
      FieldName = 'TO_DIVISION_ID'
      Origin = 'TO_DIVISION_ID'
      Precision = 15
      Size = 0
    end
    object QryDivStagingFROM_LOCATIONS_ID: TBCDField
      DisplayLabel = 'From Location'
      FieldName = 'FROM_LOCATIONS_ID'
      Origin = 'FROM_LOCATIONS_ID'
      Precision = 15
      Size = 0
    end
    object QryDivStagingTO_LOCATIONS_ID: TBCDField
      DisplayLabel = 'To Location'
      FieldName = 'TO_LOCATIONS_ID'
      Origin = 'TO_LOCATIONS_ID'
      Precision = 15
      Size = 0
    end
  end
  object UpdateSQLDivStaging: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into div_staging_loc'
      
        '  (ID, FROM_DIVISION_ID, TO_DIVISION_ID, FROM_LOCATIONS_ID, TO_L' +
        'OCATIONS_ID)'
      'values'
      
        '  (:ID, :FROM_DIVISION_ID, :TO_DIVISION_ID, :FROM_LOCATIONS_ID, ' +
        ':TO_LOCATIONS_ID)')
    ModifySQL.Strings = (
      'update div_staging_loc'
      'set'
      '  ID = :ID,'
      '  FROM_DIVISION_ID = :FROM_DIVISION_ID,'
      '  TO_DIVISION_ID = :TO_DIVISION_ID,'
      '  FROM_LOCATIONS_ID = :FROM_LOCATIONS_ID,'
      '  TO_LOCATIONS_ID = :TO_LOCATIONS_ID'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from div_staging_loc'
      'where'
      '  ID = :OLD_ID')
    Left = 40
    Top = 160
  end
  object PkLocation: TIQWebHpick
    BeforeOpen = PkLocationBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select l.id as id,'
      '       l.loc_desc as location,'
      '       l.descrip as description,'
      '       l.eplant_id  as eplant_id'
      '  from locations l'
      ' where '
      '       misc.eplant_filter( l.eplant_id ) = 1'
      '   and l.division_id = :division_id'
      '   and l.division_id > 0'
      '          ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 110
    Top = 95
    ParamData = <
      item
        Name = 'division_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkLocationID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkLocationLOCATION: TStringField
      DisplayLabel = 'Location'
      DisplayWidth = 25
      FieldName = 'LOCATION'
      FixedChar = True
      Size = 30
    end
    object PkLocationDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIPTION'
      Size = 50
    end
    object PkLocationEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant _ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object PkDivision: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select d.id,'
      '       d.name, '
      '       d.descrip,'
      '       d.eplant_id'
      '  from division d'
      ' where misc.eplant_filter(d.eplant_id) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 76
    Top = 95
    object PkDivisionID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkDivisionNAME: TStringField
      DisplayLabel = 'Division'
      FieldName = 'NAME'
      Size = 25
    end
    object PkDivisionDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object PkDivisionEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 142
    Top = 95
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        OnClick = Contents1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmInvTransShuttleLocs'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 195548 $'
    BuildVersion = '176554'
    Left = 143
    Top = 128
  end
  object SR: TIQWebSecurityRegister
    SecurityCode = 'FRMINVTRANSSHUTTLELOCS'
    Left = 203
    Top = 93
  end
end
