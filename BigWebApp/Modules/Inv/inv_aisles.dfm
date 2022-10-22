object FrmInvAisles: TFrmInvAisles
  Left = 0
  Top = 0
  HelpContext = 19697
  ClientHeight = 459
  ClientWidth = 845
  Caption = 'Inventory Aisles'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel9: TUniPanel
    Left = 0
    Top = 0
    Width = 845
    Height = 459
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter4: TUniSplitter
      Left = 308
      Top = 0
      Width = 5
      Height = 459
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object pnlAislesMain: TUniPanel
      Left = 1
      Top = 1
      Width = 308
      Height = 457
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Splitter5: TUniSplitter
        Left = 0
        Top = 217
        Width = 308
        Height = 5
        Cursor = crVSplit
        Hint = ''
        Align = alTop
        ParentColor = False
        Color = clBtnFace
      end
      object pnlAislesTop: TUniPanel
        Left = 1
        Top = 1
        Width = 306
        Height = 217
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        DesignSize = (
          306
          217)
        object gridAisles: TIQUniGridControl
          Left = 1
          Top = 28
          Width = 304
          Height = 189
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 87
          IQComponents.Grid.Height = 103
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcAisles
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
          IQComponents.Navigator.DataSource = SrcAisles
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 87
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 103
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.HiddenPanel.ExplicitHeight = 75
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          IQComponents.FormTab.ExplicitHeight = 104
          DataSource = SrcAisles
          Columns = <
            item
              FieldName = 'NAME'
              Title.Caption = 'Aisle'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DivsionName'
              Title.Caption = 'Division'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'EplantDisp'
              Title.Caption = 'EPlant'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
          ExplicitTop = 56
          ExplicitHeight = 161
          Marker = 0
        end
        object Panel13: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 304
          Height = 28
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Alignment = taLeftJustify
          Caption = '  Aisles'
          Color = clWindow
        end
        object wwDBLookupComboDivision: TUniDBLookupComboBox
          Left = 97
          Top = 99
          Width = 131
          Height = 21
          Hint = ''
          ListFieldIndex = 0
          Anchors = [akLeft, akTop, akRight]
          TabStop = False
          TabOrder = 2
          Color = clBtnFace
        end
        object wwDBComboDlgEplant: TUniEdit
          Left = 97
          Top = 126
          Width = 131
          Height = 21
          Hint = ''
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          Color = clBtnFace
          ReadOnly = True
        end
      end
      object Panel15: TUniPanel
        Left = 1
        Top = 222
        Width = 306
        Height = 235
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object Panel16: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 304
          Height = 28
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Alignment = taLeftJustify
          Caption = '  Locations in the aisle'
          Color = clWindow
        end
        object gridAisleLocations: TIQUniGridControl
          Left = 1
          Top = 28
          Width = 304
          Height = 207
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 87
          IQComponents.Grid.Height = 121
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcAisleLoc
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
          IQComponents.Navigator.DataSource = SrcAisleLoc
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 87
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 121
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.HiddenPanel.ExplicitHeight = 93
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          IQComponents.FormTab.ExplicitHeight = 122
          DataSource = SrcAisleLoc
          Columns = <
            item
              FieldName = 'LOC_DESC'
              Title.Caption = 'Location'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DESCRIP'
              Title.Caption = 'Description'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
          ExplicitTop = 56
          ExplicitHeight = 179
          Marker = 0
        end
      end
    end
    object Panel22: TUniPanel
      Left = 313
      Top = 1
      Width = 532
      Height = 457
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Splitter1: TUniSplitter
        Left = 233
        Top = 28
        Width = 5
        Height = 429
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object Panel5: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 530
        Height = 28
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = '  Proximity to other aisles'
        Color = clWindow
      end
      object pnlProxAisles: TUniPanel
        Left = 1
        Top = 28
        Width = 233
        Height = 429
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 1
        Caption = ''
        object Panel24: TUniPanel
          Left = 1
          Top = 1
          Width = 231
          Height = 427
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          ExplicitTop = 28
          ExplicitHeight = 401
          object srchProxAisles: TIQUniGridControl
            Left = 1
            Top = 1
            Width = 229
            Height = 425
            Layout = 'border'
            ParentAlignmentControl = False
            AlignmentControl = uniAlignmentClient
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            IQComponents.Grid.Left = 0
            IQComponents.Grid.Top = 29
            IQComponents.Grid.Width = 12
            IQComponents.Grid.Height = 339
            IQComponents.Grid.Hint = ''
            IQComponents.Grid.DataSource = SrcProxAisles
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
            IQComponents.Navigator.DataSource = SrcProxAisles
            IQComponents.Navigator.LayoutConfig.Region = 'east'
            IQComponents.Navigator.TabOrder = 3
            IQComponents.HiddenPanel.Left = 12
            IQComponents.HiddenPanel.Top = 29
            IQComponents.HiddenPanel.Width = 209
            IQComponents.HiddenPanel.Height = 339
            IQComponents.HiddenPanel.Hint = ''
            IQComponents.HiddenPanel.Visible = True
            IQComponents.HiddenPanel.Align = alRight
            IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
            IQComponents.HiddenPanel.ExplicitHeight = 313
            IQComponents.FormTab.Hint = ''
            IQComponents.FormTab.ImageIndex = 1
            IQComponents.FormTab.Caption = 'Form'
            IQComponents.FormTab.Layout = 'border'
            IQComponents.FormTab.ExplicitHeight = 342
            DataSource = SrcProxAisles
            Columns = <
              item
                FieldName = 'AISLE_NAME'
                Title.Caption = 'Aisle'
                Width = 64
                ReadOnly = True
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'PROXIMITY_LEVEL'
                Title.Caption = 'Proximity Level'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end>
            ExplicitHeight = 399
            Marker = 0
          end
        end
      end
      object Panel25: TUniPanel
        Left = 238
        Top = 28
        Width = 294
        Height = 429
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 2
        Caption = ''
        object Panel26: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 292
          Height = 28
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Alignment = taLeftJustify
          Caption = '  Locations in the aisle'
          Color = clWindow
        end
        object gridProxAisleLocations: TIQUniGridControl
          Left = 1
          Top = 28
          Width = 292
          Height = 401
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 75
          IQComponents.Grid.Height = 315
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcProxAisleLoc
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
          IQComponents.Navigator.DataSource = SrcProxAisleLoc
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 75
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 315
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.HiddenPanel.ExplicitHeight = 287
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          IQComponents.FormTab.ExplicitHeight = 316
          DataSource = SrcProxAisleLoc
          Columns = <
            item
              FieldName = 'LOC_DESC'
              Title.Caption = 'Location'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DESCRIP'
              Title.Caption = 'Description'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
          ExplicitTop = 56
          ExplicitHeight = 373
          Marker = 0
        end
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 324
    Top = 279
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Reports1: TUniMenuItem
      Caption = 'Reports'
      object Print1: TUniMenuItem
        Caption = 'Print'
        OnClick = Print1Click
      end
      object PrintSetup1: TUniMenuItem
        Caption = 'Print Setup'
        OnClick = PrintSetup1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 354
    Top = 278
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmInvAisles'
    Version = 'Feature unsupported'
    ChangeListNumber = '$Change: 189467 $'
    Left = 325
    Top = 311
  end
  object QryAisles: TFDQuery
    BeforePost = QryAislesBeforePost
    AfterPost = ApplyUpdate
    AfterDelete = ApplyUpdate
    OnCalcFields = QryAislesCalcFields
    OnNewRecord = QryAislesNewRecord
    UpdateOptions.UpdateTableName = 'inv_aisles'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLAisles
    SQL.Strings = (
      'select id,'
      '       name,'
      '       eplant_id,'
      '       division_id'
      '  from inv_aisles'
      ' where misc.eplant_filter( eplant_id ) = 1'
      ' order by name ')
    Left = 16
    Top = 124
    object QryAislesNAME: TStringField
      DisplayLabel = 'Aisle'
      DisplayWidth = 11
      FieldName = 'NAME'
      Origin = 'IQ.INV_AISLES.NAME'
      Size = 9
    end
    object QryAislesDivsionName: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'DivsionName'
      Size = 30
      Calculated = True
    end
    object QryAislesEplantDisp: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'EplantDisp'
      Size = 40
      Calculated = True
    end
    object QryAislesDIVISION_ID: TBCDField
      DisplayLabel = 'Division'
      DisplayWidth = 11
      FieldName = 'DIVISION_ID'
      Origin = 'IQ.INV_AISLES.DIVISION_ID'
      Visible = False
      Size = 0
    end
    object QryAislesID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.INV_AISLES.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryAislesEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'IQ.INV_AISLES.EPLANT_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcAisles: TDataSource
    DataSet = QryAisles
    Left = 17
    Top = 96
  end
  object wwQryDivisionLookup: TFDQuery
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
    Left = 52
    Top = 95
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
  object UpdateSQLAisles: TFDUpdateSQL
    InsertSQL.Strings = (
      'insert into inv_aisles'
      '  (ID, NAME, EPLANT_ID, DIVISION_ID)'
      'values'
      '  (:ID, :NAME, :EPLANT_ID, :DIVISION_ID)')
    ModifySQL.Strings = (
      'update inv_aisles'
      'set'
      '  ID = :ID,'
      '  NAME = :NAME,'
      '  EPLANT_ID = :EPLANT_ID,'
      '  DIVISION_ID = :DIVISION_ID'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from inv_aisles'
      'where'
      '  ID = :OLD_ID')
    Left = 16
    Top = 152
  end
  object PkAisle: TIQWebHpick
    SQL.Strings = (
      'select a.id as id,'
      '       a.name as name,'
      '       a.eplant_id as eplant_id,'
      '       d.name as division_name'
      '  from inv_aisles a,'
      '       division d'
      ' where a.division_id = d.id(+)'
      '   and misc.eplant_filter( a.eplant_id ) = 1'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 48
    Top = 152
    object PkAisleID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkAisleNAME: TStringField
      DisplayLabel = 'Aisle'
      FieldName = 'NAME'
      Size = 9
    end
    object PkAisleEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object PkAisleDIVISION_NAME: TStringField
      DisplayLabel = 'Division'
      FieldName = 'DIVISION_NAME'
      Size = 25
    end
  end
  object SrcAisleLoc: TDataSource
    DataSet = QryAisleLoc
    Left = 16
    Top = 316
  end
  object QryAisleLoc: TFDQuery
    CachedUpdates = True
    MasterSource = SrcAisles
    MasterFields = 'ID'
    SQL.Strings = (
      'select id,'
      '       loc_desc,'
      '       descrip'
      '  from locations'
      ' where inv_aisles_id = :id        '
      ' order by loc_desc')
    Left = 16
    Top = 344
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryAisleLocLOC_DESC: TStringField
      DisplayLabel = 'Location'
      DisplayWidth = 21
      FieldName = 'LOC_DESC'
      Origin = 'IQ.LOCATIONS.LOC_DESC'
      FixedChar = True
      Size = 30
    end
    object QryAisleLocDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 22
      FieldName = 'DESCRIP'
      Origin = 'IQ.LOCATIONS.DESCRIP'
      Size = 50
    end
    object QryAisleLocID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.LOCATIONS.ID'
      Visible = False
      Size = 0
    end
  end
  object PkAislesLocations: TIQWebHpick
    SQL.Strings = (
      'select l.id as id,'
      '       l.loc_desc as loc_desc,'
      '       l.descrip as descrip,'
      '       l.eplant_id as eplant_id,'
      '       a.name as aisle_name, '
      '       d.name as division_name,'
      '       l.inv_aisles_id as inv_aisles_id'
      '  from '
      '       locations l,'
      '       inv_aisles a,'
      '       division d'
      ' where l.inv_aisles_id = a.id(+)  '
      '   and misc.eplant_filter( l.eplant_id ) = 1'
      '   and l.division_id = d.id(+)'
      '   '
      '         ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 100
    Top = 316
    object PkAislesLocationsID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkAislesLocationsLOC_DESC: TStringField
      DisplayLabel = 'Location'
      FieldName = 'LOC_DESC'
      Origin = 'l.loc_desc '
      FixedChar = True
      Size = 30
    end
    object PkAislesLocationsDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'l.descrip'
      Size = 50
    end
    object PkAislesLocationsEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'l.eplant_id'
      Size = 0
    end
    object PkAislesLocationsAISLE_NAME: TStringField
      DisplayLabel = 'Aisle'
      FieldName = 'AISLE_NAME'
      Origin = 'a.name'
      Size = 9
    end
    object PkAislesLocationsDIVISION_NAME: TStringField
      DisplayLabel = 'Division'
      FieldName = 'DIVISION_NAME'
      Origin = 'd.name'
      Size = 25
    end
    object PkAislesLocationsINV_AISLES_ID: TBCDField
      FieldName = 'INV_AISLES_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcProxAisles: TDataSource
    DataSet = QryProxAisles
    Left = 328
    Top = 124
  end
  object QryProxAisles: TFDQuery
    AfterPost = ApplyUpdate
    AfterDelete = ApplyUpdate
    CachedUpdates = True
    MasterSource = SrcAisles
    MasterFields = 'ID'
    UpdateOptions.UpdateTableName = 'inv_aisles_proximity'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLProxAisles
    SQL.Strings = (
      'select p.id,'
      '       p.inv_aisles_id1,'
      '       p.inv_aisles_id2,'
      '       p.proximity_level,'
      ''
      '       case'
      '          when p.inv_aisles_id1 = :id then a2.name'
      '          when p.inv_aisles_id2 = :id then a1.name'
      '       end as aisle_name,'
      ''
      '       case'
      '          when p.inv_aisles_id1 = :id then p.inv_aisles_id2'
      '          when p.inv_aisles_id2 = :id then p.inv_aisles_id1'
      '       end as inv_aisle_id'
      '       '
      '  from inv_aisles_proximity p,'
      '       inv_aisles a1,'
      '       inv_aisles a2'
      ' where'
      '       (p.inv_aisles_id1 = :id'
      '        or'
      '        p.inv_aisles_id2 = :id)'
      '        '
      '   and p.inv_aisles_id1 = a1.id(+)'
      '   and p.inv_aisles_id2 = a2.id(+)'
      '       '
      '')
    Left = 328
    Top = 152
    ParamData = <
      item
        Name = 'id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryProxAislesAISLE_NAME: TStringField
      DisplayLabel = 'Aisle'
      DisplayWidth = 14
      FieldName = 'AISLE_NAME'
      Origin = 
        'case when p.inv_aisles_id1 = :id then a2.name when p.inv_aisles_' +
        'id2 = :id then a1.name end'
      ReadOnly = True
      Size = 9
    end
    object QryProxAislesPROXIMITY_LEVEL: TBCDField
      DisplayLabel = 'Proximity Level'
      DisplayWidth = 17
      FieldName = 'PROXIMITY_LEVEL'
      Origin = 'p.proximity_level'
      Size = 0
    end
    object QryProxAislesID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryProxAislesINV_AISLES_ID1: TBCDField
      FieldName = 'INV_AISLES_ID1'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryProxAislesINV_AISLES_ID2: TBCDField
      FieldName = 'INV_AISLES_ID2'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryProxAislesINV_AISLE_ID: TFMTBCDField
      FieldName = 'INV_AISLE_ID'
      Visible = False
      Size = 38
    end
  end
  object PkProxAisle: TIQWebHpick
    BeforeOpen = PkProxAisleBeforeOpen
    SQL.Strings = (
      'select a.id as id,'
      '       a.name as name,'
      '       a.eplant_id as eplant_id,'
      '       d.name as division_name'
      '  from inv_aisles a,'
      '       division d'
      ' where a.division_id = d.id(+)'
      '   and not a.id in'
      '       ( select case '
      
        '                  when inv_aisles_id1 = :inv_aisles_id then inv_' +
        'aisles_id2'
      
        '                  when inv_aisles_id2 = :inv_aisles_id then inv_' +
        'aisles_id1'
      '                end as inv_aisles_id'
      '           from inv_aisles_proximity'
      
        '          where (inv_aisles_id1 = :inv_aisles_id or inv_aisles_i' +
        'd2 = :inv_aisles_id))'
      '                '
      '                '
      '                '
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 360
    Top = 152
    ParamData = <
      item
        Name = 'inv_aisles_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkProxAisleID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkProxAisleName: TStringField
      DisplayLabel = 'Aisle'
      DisplayWidth = 12
      FieldName = 'NAME'
      Origin = ' a.name'
      Size = 9
    end
    object PkProxAisleEplant_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 12
      FieldName = 'EPLANT_ID'
      Origin = 'a.eplant_id '
      Size = 0
    end
    object PkProxAisleDivision_Name: TStringField
      DisplayLabel = 'Division'
      FieldName = 'DIVISION_NAME'
      Origin = 'd.name'
      Size = 25
    end
  end
  object UpdateSQLProxAisles: TFDUpdateSQL
    InsertSQL.Strings = (
      'insert into inv_aisles_proximity'
      '  (ID, INV_AISLES_ID1, INV_AISLES_ID2, PROXIMITY_LEVEL)'
      'values'
      '  (:ID, :INV_AISLES_ID1, :INV_AISLES_ID2, :PROXIMITY_LEVEL)')
    ModifySQL.Strings = (
      'update inv_aisles_proximity'
      'set'
      '  ID = :ID,'
      '  INV_AISLES_ID1 = :INV_AISLES_ID1,'
      '  INV_AISLES_ID2 = :INV_AISLES_ID2,'
      '  PROXIMITY_LEVEL = :PROXIMITY_LEVEL'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from inv_aisles_proximity'
      'where'
      '  ID = :OLD_ID')
    Left = 328
    Top = 180
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmInvAisles'
    WebUse = False
    TouchScreen = False
    Left = 324
    Top = 344
  end
  object SrcProxAisleLoc: TDataSource
    DataSet = QryProxAisleLoc
    Left = 560
    Top = 124
  end
  object QryProxAisleLoc: TFDQuery
    CachedUpdates = True
    MasterSource = SrcProxAisles
    MasterFields = 'INV_AISLE_ID'
    SQL.Strings = (
      'select id,'
      '       loc_desc,'
      '       descrip'
      '  from locations'
      ' where inv_aisles_id = :inv_aisle_id        '
      ' order by loc_desc')
    Left = 560
    Top = 156
    ParamData = <
      item
        Name = 'INV_AISLE_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryProxAisleLocLOC_DESC: TStringField
      DisplayLabel = 'Location'
      DisplayWidth = 21
      FieldName = 'LOC_DESC'
      Origin = 'IQ.LOCATIONS.LOC_DESC'
      FixedChar = True
      Size = 30
    end
    object QryProxAisleLocDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 22
      FieldName = 'DESCRIP'
      Origin = 'IQ.LOCATIONS.DESCRIP'
      Size = 50
    end
    object QryProxAisleLocID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.LOCATIONS.ID'
      Visible = False
      Size = 0
    end
  end
  object PkProxAisleLocations: TIQWebHpick
    SQL.Strings = (
      'select l.id as id,'
      '       l.loc_desc as loc_desc,'
      '       l.descrip as descrip,'
      '       l.eplant_id as eplant_id,'
      '       a.name as aisle_name, '
      '       d.name as division_name,'
      '       l.inv_aisles_id as inv_aisles_id'
      '  from '
      '       locations l,'
      '       inv_aisles a,'
      '       division d'
      ' where l.inv_aisles_id = a.id(+)  '
      '   and misc.eplant_filter( l.eplant_id ) = 1'
      '   and l.division_id = d.id(+)'
      '   '
      '         ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 652
    Top = 124
    object PkProxAisleLocationsID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkProxAisleLocationsLOC_DESC: TStringField
      DisplayLabel = 'Location'
      FieldName = 'LOC_DESC'
      Origin = 'l.loc_desc '
      FixedChar = True
      Size = 30
    end
    object PkProxAisleLocationsDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'l.descrip'
      Size = 50
    end
    object PkProxAisleLocationsEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'l.eplant_id'
      Size = 0
    end
    object PkProxAisleLocationsAISLE_NAME: TStringField
      DisplayLabel = 'Aisle'
      FieldName = 'AISLE_NAME'
      Origin = 'a.name'
      Size = 9
    end
    object PkProxAisleLocationsDIVISION_NAME: TStringField
      DisplayLabel = 'Division'
      FieldName = 'DIVISION_NAME'
      Origin = 'd.name'
      Size = 25
    end
    object PkProxAisleLocationsINV_AISLES_ID: TBCDField
      FieldName = 'INV_AISLES_ID'
      Visible = False
      Size = 0
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityCode = 'FRMINVAISLES'
    Left = 356
    Top = 311
  end
end
