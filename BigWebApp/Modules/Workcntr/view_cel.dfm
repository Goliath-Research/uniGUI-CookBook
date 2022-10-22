object ViewCells: TViewCells
  Left = 187
  Top = 177
  HelpContext = 5079
  ClientHeight = 458
  ClientWidth = 821
  Caption = 'View Manufacturing Cells'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  ActiveControl = Panel1
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 27
    Width = 821
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 821
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnAssignEPlant: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Assign EPlant'
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
      OnClick = sbtnAssignEPlantClick
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 30
    Width = 821
    Height = 428
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 514
      Top = 1
      Width = 4
      Height = 426
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object pnlGrid: TUniPanel
      Left = 1
      Top = 1
      Width = 513
      Height = 426
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object GridCell: TIQUniGridControl
        Left = 1
        Top = 1
        Width = 511
        Height = 424
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 294
        IQComponents.Grid.Height = 338
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcCell
        IQComponents.Grid.LoadMask.Message = 'Loading data...'
        IQComponents.Grid.OnDblClick = GridCellDBGridDblClick
        IQComponents.Grid.Align = alClient
        IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
        IQComponents.Grid.TabOrder = 0
        IQComponents.Grid.OnDrawColumnCell = GridCellDBGridDrawColumnCell
        IQComponents.Navigator.Left = 410
        IQComponents.Navigator.Top = 0
        IQComponents.Navigator.Width = 241
        IQComponents.Navigator.Height = 25
        IQComponents.Navigator.Hint = ''
        IQComponents.Navigator.ShowHint = True
        IQComponents.Navigator.DataSource = SrcCell
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 294
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 338
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcCell
        Columns = <
          item
            FieldName = 'MFGCELL'
            Title.Caption = 'Manufacturing Cell'
            Width = 112
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DESCRIP'
            Title.Caption = 'Description'
            Width = 112
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'MFGTYPE'
            Title.Caption = 'Manufacturing Type'
            Width = 119
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'EPLANTNAME'
            Title.Caption = 'EPlant Name'
            Width = 84
            ReadOnly = True
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DIVISIONNAME'
            Title.Caption = 'Division'
            Width = 98
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
      object cmbGridMFGType: TUniDBLookupComboBox
        Left = 217
        Top = 87
        Width = 121
        Height = 21
        Hint = ''
        ListField = 'MFGTYPE'
        ListSource = ds_MFGTypeLookup
        KeyField = 'MFGTYPE'
        ListFieldIndex = 0
        DataField = 'MFGTYPE'
        DataSource = SrcCell
        TabOrder = 1
        Color = clWindow
      end
      object cmbGridDivision: TUniDBLookupComboBox
        Left = 217
        Top = 114
        Width = 121
        Height = 21
        Hint = ''
        ListField = 'NAME'
        ListSource = ds_DivisionLookup
        KeyField = 'ID'
        ListFieldIndex = 0
        DataField = 'DIVISION_ID'
        DataSource = SrcCell
        TabOrder = 2
        Color = clWindow
        OnKeyDown = cmbGridDivisionKeyDown
      end
    end
    object Panel3: TUniPanel
      Left = 518
      Top = 1
      Width = 302
      Height = 426
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Panel4: TUniPanel
        Left = 1
        Top = 176
        Width = 300
        Height = 140
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Caption = ''
        object Splitter2: TUniSplitter
          Left = 133
          Top = 33
          Width = 4
          Height = 106
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object Panel5: TUniPanel
          Left = 1
          Top = 33
          Width = 132
          Height = 106
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Label1: TUniLabel
            AlignWithMargins = True
            Left = 17
            Top = 10
            Width = 63
            Height = 13
            Hint = ''
            Caption = 'Current Rate'
            TabOrder = 1
          end
          object Label5: TUniLabel
            Left = 17
            Top = 34
            Width = 58
            Height = 13
            Hint = ''
            Caption = 'Future Rate'
            TabOrder = 2
          end
          object Label6: TUniLabel
            Left = 17
            Top = 58
            Width = 60
            Height = 13
            Hint = ''
            Caption = 'Budget Rate'
            TabOrder = 3
          end
          object Label7: TUniLabel
            Left = 17
            Top = 82
            Width = 68
            Height = 13
            Hint = ''
            Caption = 'Forecast Rate'
            TabOrder = 4
          end
        end
        object Panel6: TUniPanel
          Left = 137
          Top = 33
          Width = 162
          Height = 106
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          DesignSize = (
            162
            106)
          object dbeLaborRate: TUniDBEdit
            Left = 0
            Top = 7
            Width = 158
            Height = 21
            Hint = ''
            DataField = 'LABOR_RATE'
            DataSource = SrcCell
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object dbeFutureRate: TUniDBEdit
            Left = 0
            Top = 31
            Width = 158
            Height = 21
            Hint = ''
            DataField = 'FUTURE_LABOR_RATE'
            DataSource = SrcCell
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object dbeBudgetRate: TUniDBEdit
            Left = 0
            Top = 55
            Width = 158
            Height = 21
            Hint = ''
            DataField = 'BUDGET_LABOR_RATE'
            DataSource = SrcCell
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
          object dbeForecastRate: TUniDBEdit
            Left = 0
            Top = 79
            Width = 158
            Height = 21
            Hint = ''
            DataField = 'FORECAST_LABOR_RATE'
            DataSource = SrcCell
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
          end
        end
        object Panel7: TUniPanel
          Left = 1
          Top = 1
          Width = 298
          Height = 32
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          Alignment = taLeftJustify
          Caption = '  Labor'
        end
      end
      object Panel8: TUniPanel
        Left = 1
        Top = 1
        Width = 300
        Height = 90
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        object Splitter3: TUniSplitter
          Left = 133
          Top = 33
          Width = 4
          Height = 56
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object Panel9: TUniPanel
          Left = 1
          Top = 33
          Width = 132
          Height = 56
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Label3: TUniLabel
            AlignWithMargins = True
            Left = 17
            Top = 10
            Width = 86
            Height = 13
            Hint = ''
            Caption = 'Reporting Method'
            TabOrder = 1
          end
          object Label4: TUniLabel
            Left = 17
            Top = 35
            Width = 55
            Height = 13
            Hint = ''
            Caption = 'Actual Cost'
            TabOrder = 2
          end
        end
        object Panel10: TUniPanel
          Left = 137
          Top = 33
          Width = 162
          Height = 56
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          DesignSize = (
            162
            56)
          object wwDBComboBoxProdRepMethod: TUniDBComboBox
            Left = 1
            Top = 7
            Width = 157
            Height = 21
            Hint = ''
            Anchors = [akLeft, akTop, akRight]
            DataField = 'PROD_REP_METHOD'
            DataSource = SrcCell
            Style = csDropDownList
            Items.Strings = (
              'By Shift ( PRS )'#9'S'
              'By Labor/Shift ( PRLS )'#9'L'
              'By Work Order ( PRW )'#9'W')
            TabOrder = 0
            OnChange = wwDBComboBoxProdRepMethodChange
          end
          object wwDBComboBoxActCostMethod: TUniDBComboBox
            Left = 1
            Top = 34
            Width = 157
            Height = 21
            Hint = ''
            Anchors = [akLeft, akTop, akRight]
            DataField = 'ACT_COST_METHOD'
            DataSource = SrcCell
            Style = csDropDownList
            Items.Strings = (
              'By Shift'#9'S'
              'By Work Order Reconciliation'#9'W')
            TabOrder = 1
          end
        end
        object Panel11: TUniPanel
          Left = 1
          Top = 1
          Width = 298
          Height = 32
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          Alignment = taLeftJustify
          Caption = '  Production Reporting'
        end
      end
      object pnlMaterialStaging: TUniPanel
        Left = 1
        Top = 91
        Width = 300
        Height = 85
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Caption = ''
        object Splitter4: TUniSplitter
          Left = 133
          Top = 33
          Width = 4
          Height = 51
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object Panel13: TUniPanel
          Left = 1
          Top = 33
          Width = 132
          Height = 51
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Label2: TUniLabel
            AlignWithMargins = True
            Left = 17
            Top = 31
            Width = 64
            Height = 13
            Hint = ''
            Caption = 'OUT Location'
            TabOrder = 1
          end
          object Label8: TUniLabel
            Left = 17
            Top = 10
            Width = 54
            Height = 13
            Hint = ''
            Caption = 'IN Location'
            TabOrder = 2
          end
        end
        object Panel14: TUniPanel
          Left = 137
          Top = 33
          Width = 162
          Height = 51
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          DesignSize = (
            162
            51)
          object wwDBComboDlgStagingLocation: TUniEdit
            Left = 1
            Top = 26
            Width = 157
            Height = 21
            Hint = ''
            Text = ''
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            ReadOnly = True
            OnKeyDown = wwDBComboDlgStagingLocationKeyDown
          end
          object wwDBComboDlgINLocation: TUniEdit
            Left = 1
            Top = 4
            Width = 157
            Height = 21
            Hint = ''
            Text = ''
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            ReadOnly = True
            OnKeyDown = wwDBComboDlgINLocationKeyDown
          end
        end
        object Panel15: TUniPanel
          Left = 1
          Top = 1
          Width = 298
          Height = 32
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          Alignment = taLeftJustify
          Caption = '  Disposition Parameters'
        end
      end
      object PnlRejectOptions: TUniPanel
        Left = 1
        Top = 316
        Width = 300
        Height = 85
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        Caption = ''
        object Panel17: TUniPanel
          Left = 1
          Top = 33
          Width = 298
          Height = 51
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object DBCheckBox1: TUniDBCheckBox
            Left = 8
            Top = 8
            Width = 227
            Height = 17
            Hint = ''
            DataField = 'COMPONENT_REJECT_LOC_MANDATORY'
            DataSource = SrcCell
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = 'Component rejection location is mandatory'
            TabOrder = 0
          end
        end
        object Panel18: TUniPanel
          Left = 1
          Top = 1
          Width = 298
          Height = 32
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Alignment = taLeftJustify
          Caption = ' Rejects'
        end
      end
    end
  end
  object TblCell: TFDQuery
    BeforeInsert = TblCellBeforeInsert
    BeforeEdit = TblCellBeforeEdit
    BeforePost = TblCellBeforePost
    BeforeDelete = TblCellBeforeDelete
    OnNewRecord = TblCellNewRecord
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'MFGCELL'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = FDUpdateSQL_Cell
    SQL.Strings = (
      '  select id,'
      '         mfgcell,'
      '         descrip,'
      '         mfgtype,'
      '         eplant_id,'
      
        '         (select name from eplant where id = mfgcell.eplant_id) ' +
        'as eplantname,'
      '         mfgcell_param_id,'
      '         division_id,'
      
        '         (select name from division where id = mfgcell.division_' +
        'id) as divisionname,'
      '         labor_rate,'
      '         prod_rep_method,'
      '         act_cost_method,'
      '         staging_locations_id,'
      
        '         (select loc_desc from locations  where id = mfgcell.sta' +
        'ging_locations_id) as staginglocdesc,'
      '         locations_id_in,'
      
        '         (select loc_desc from locations where id = mfgcell.loca' +
        'tions_id_in) as inlocationdesc,'
      '         future_labor_rate,'
      '         budget_labor_rate,'
      '         forecast_labor_rate,'
      '         component_reject_loc_mandatory'
      '    from mfgcell'
      'order by id')
    Left = 24
    Top = 108
    object TblCellMFGCELL: TStringField
      DisplayLabel = 'Manufacturing Cell'
      DisplayWidth = 16
      FieldName = 'MFGCELL'
      Required = True
      OnSetText = TblCellMFGCELLSetText
      Size = 15
    end
    object TblCellDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 16
      FieldName = 'DESCRIP'
      Size = 25
    end
    object TblCellMFGTYPE: TStringField
      DisplayLabel = 'Manufacturing Type'
      DisplayWidth = 17
      FieldName = 'MFGTYPE'
      Size = 10
    end
    object TblCellEPLANTNAME: TStringField
      DisplayLabel = 'EPlant Name'
      DisplayWidth = 12
      FieldName = 'EPLANTNAME'
      ReadOnly = True
    end
    object TblCellDIVISIONNAME: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 14
      FieldName = 'DIVISIONNAME'
      Size = 25
    end
    object TblCellLABOR_RATE: TFMTBCDField
      DisplayLabel = 'Labor Rate'
      DisplayWidth = 16
      FieldName = 'LABOR_RATE'
      Visible = False
      Size = 6
    end
    object TblCellEPLANT_ID: TBCDField
      Tag = 1
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
    object TblCellDIVISION_ID: TBCDField
      Tag = 1
      DisplayWidth = 10
      FieldName = 'DIVISION_ID'
      Visible = False
      Size = 0
    end
    object TblCellPROD_REP_METHOD: TStringField
      FieldName = 'PROD_REP_METHOD'
      Visible = False
      Size = 1
    end
    object TblCellACT_COST_METHOD: TStringField
      FieldName = 'ACT_COST_METHOD'
      Visible = False
      Size = 1
    end
    object TblCellSTAGING_LOCATIONS_ID: TBCDField
      Tag = 1
      FieldName = 'STAGING_LOCATIONS_ID'
      Visible = False
      Size = 0
    end
    object TblCellSTAGINGLOCDESC: TStringField
      FieldName = 'STAGINGLOCDESC'
      Origin = 'STAGINGLOCDESC'
      Visible = False
      FixedChar = True
      Size = 30
    end
    object TblCellFORECAST_LABOR_RATE: TFMTBCDField
      DisplayLabel = 'Forecast Rate'
      FieldName = 'FORECAST_LABOR_RATE'
      Visible = False
      Size = 6
    end
    object TblCellBUDGET_LABOR_RATE: TFMTBCDField
      DisplayLabel = 'Budget Rate'
      FieldName = 'BUDGET_LABOR_RATE'
      Visible = False
      Size = 6
    end
    object TblCellFUTURE_LABOR_RATE: TFMTBCDField
      DisplayLabel = 'Future Rate'
      FieldName = 'FUTURE_LABOR_RATE'
      Visible = False
      Size = 6
    end
    object TblCellLOCATIONS_ID_IN: TBCDField
      Tag = 1
      FieldName = 'LOCATIONS_ID_IN'
      Visible = False
      Size = 0
    end
    object TblCellINLOCATIONDESC: TStringField
      FieldName = 'INLOCATIONDESC'
      Origin = 'INLOCATIONDESC'
      Visible = False
      FixedChar = True
      Size = 30
    end
    object TblCellID: TBCDField
      Tag = 1
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object TblCellCOMPONENT_REJECT_LOC_MANDATORY: TStringField
      DisplayLabel = 'Component Reject Location is Mandatory'
      FieldName = 'COMPONENT_REJECT_LOC_MANDATORY'
      Origin = 'COMPONENT_REJECT_LOC_MANDATORY'
      Visible = False
      Size = 1
    end
  end
  object SrcCell: TDataSource
    DataSet = TblCell
    OnDataChange = SrcCellDataChange
    Left = 56
    Top = 108
  end
  object QryMFGTypeLookup: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select mfgtype from mfgtype')
    Left = 232
    Top = 284
    object QryMFGTypeLookupMFGTYPE: TStringField
      DisplayLabel = 'Mfg Type'
      DisplayWidth = 10
      FieldName = 'MFGTYPE'
      Origin = 'MFGTYPE.MFGTYPE'
      Size = 10
    end
  end
  object QryDivisionLookup: TFDQuery
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
    Left = 334
    Top = 292
    object QryDivisionLookupNAME: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 15
      FieldName = 'NAME'
      Size = 25
    end
    object QryDivisionLookupEPLANT_NAME: TStringField
      DisplayLabel = 'Division EPlant'
      DisplayWidth = 15
      FieldName = 'EPLANT_NAME'
      Size = 30
    end
    object QryDivisionLookupID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object PkLocation: TIQWebHpick
    BeforeOpen = PkLocationBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select l.id as id,'
      '       l.loc_desc as location,'
      '       l.descrip as description,'
      '       l.eplant_id as eplant_id,'
      '       d.name as division,'
      '       l.pk_hide as pk_hide'
      '  from locations l,'
      '       division d'
      ' where '
      '       l.division_id = d.id(+)'
      '   and (:eplant_id = 0'
      '        or'
      '        l.eplant_id = :eplant_id)'
      '   and (:division_id = 0'
      '        or      '
      '        l.division_id = :division_id)'
      '        '
      '          ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 26
    Top = 60
    ParamData = <
      item
        Name = 'eplant_id'
        DataType = ftBCD
        ParamType = ptInput
      end
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
      DisplayLabel = 'EPlant'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object PkLocationDIVISION: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 20
      FieldName = 'DIVISION'
      Size = 25
    end
    object PkLocationPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      Size = 1
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 448
    Top = 232
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
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
  object IQAbout1: TIQWebAbout
    ModuleName = 'ViewCells'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 194264 $'
    BuildVersion = '176554'
    Left = 376
    Top = 232
  end
  object FDUpdateSQL_Cell: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'INSERT INTO IQMS.MFGCELL'
      '(MFGCELL, DESCRIP, MFGTYPE, EPLANT_ID, ID, '
      '  DIVISION_ID, LABOR_RATE, PROD_REP_METHOD, '
      '  ACT_COST_METHOD, STAGING_LOCATIONS_ID, LOCATIONS_ID_IN, '
      '  FUTURE_LABOR_RATE, BUDGET_LABOR_RATE, FORECAST_LABOR_RATE, '
      '  COMPONENT_REJECT_LOC_MANDATORY)'
      
        'VALUES (:NEW_MFGCELL, :NEW_DESCRIP, :NEW_MFGTYPE, :NEW_EPLANT_ID' +
        ', :NEW_ID, '
      '  :NEW_DIVISION_ID, :NEW_LABOR_RATE, :NEW_PROD_REP_METHOD, '
      
        '  :NEW_ACT_COST_METHOD, :NEW_STAGING_LOCATIONS_ID, :NEW_LOCATION' +
        'S_ID_IN, '
      
        '  :NEW_FUTURE_LABOR_RATE, :NEW_BUDGET_LABOR_RATE, :NEW_FORECAST_' +
        'LABOR_RATE, '
      '  :NEW_COMPONENT_REJECT_LOC_MANDATORY)')
    ModifySQL.Strings = (
      'UPDATE IQMS.MFGCELL'
      
        'SET MFGCELL = :NEW_MFGCELL, DESCRIP = :NEW_DESCRIP, MFGTYPE = :N' +
        'EW_MFGTYPE, '
      
        '  EPLANT_ID = :NEW_EPLANT_ID, ID = :NEW_ID, DIVISION_ID = :NEW_D' +
        'IVISION_ID, '
      
        '  LABOR_RATE = :NEW_LABOR_RATE, PROD_REP_METHOD = :NEW_PROD_REP_' +
        'METHOD, '
      
        '  ACT_COST_METHOD = :NEW_ACT_COST_METHOD, STAGING_LOCATIONS_ID =' +
        ' :NEW_STAGING_LOCATIONS_ID, '
      
        '  LOCATIONS_ID_IN = :NEW_LOCATIONS_ID_IN, FUTURE_LABOR_RATE = :N' +
        'EW_FUTURE_LABOR_RATE, '
      
        '  BUDGET_LABOR_RATE = :NEW_BUDGET_LABOR_RATE, FORECAST_LABOR_RAT' +
        'E = :NEW_FORECAST_LABOR_RATE, '
      
        '  COMPONENT_REJECT_LOC_MANDATORY = :NEW_COMPONENT_REJECT_LOC_MAN' +
        'DATORY'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM IQMS.MFGCELL'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT MFGCELL, DESCRIP, MFGTYPE, EPLANT_ID, ID, MFGCELL_PARAM_I' +
        'D, '
      '  DIVISION_ID, LABOR_RATE, PROD_REP_METHOD, ACT_COST_METHOD, '
      '  STAGING_LOCATIONS_ID, LOCATIONS_ID_IN, FUTURE_LABOR_RATE, '
      
        '  BUDGET_LABOR_RATE, FORECAST_LABOR_RATE, COMPONENT_REJECT_LOC_M' +
        'ANDATORY'
      'FROM IQMS.MFGCELL'
      'WHERE ID = :ID')
    Left = 24
    Top = 152
  end
  object ds_MFGTypeLookup: TDataSource
    DataSet = QryMFGTypeLookup
    Left = 230
    Top = 333
  end
  object ds_DivisionLookup: TDataSource
    DataSet = QryDivisionLookup
    Left = 334
    Top = 349
  end
end
