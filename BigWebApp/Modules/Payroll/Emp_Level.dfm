object FrmEmpLevel: TFrmEmpLevel
  Left = 147
  Top = 139
  HelpContext = 1111444
  ClientHeight = 255
  ClientWidth = 644
  Caption = 'Employee Level'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 644
    Height = 28
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
  end
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 28
    Width = 644
    Height = 227
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 427
    IQComponents.Grid.Height = 141
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = DataSource1
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
    IQComponents.Navigator.DataSource = DataSource1
    IQComponents.Navigator.VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 427
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 141
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = DataSource1
    Columns = <
      item
        FieldName = 'CODE'
        Title.Caption = 'Code'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 140
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'LABOR_RATE'
        Title.Caption = 'Current Rate'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TYPE'
        Title.Caption = 'Labor Type'
        Width = 119
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Elem_Descrip'
        Title.Caption = 'Labor Cost Element'
        Width = 126
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'QUOTE_RATE'
        Title.Caption = 'Quote Rate'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EXCLUDE_FROM_RT_LABOR'
        Title.Caption = 'Exclude from ~RT Labor'
        Width = 7
        CheckBoxField.FieldValues = 'Y;N'
      end
      item
        FieldName = 'FUTURE_LABOR_RATE'
        Title.Caption = 'Future Rate'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BUDGET_LABOR_RATE'
        Title.Caption = 'Budget Rate'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FORECAST_LABOR_RATE'
        Title.Caption = 'Forecast Rate'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object wwDBComboBoxType: TUniDBComboBox
    Left = 292
    Top = 68
    Width = 121
    Height = 21
    Hint = ''
    Style = csDropDownList
    Items.Strings = (
      'PRODUCTION'
      'SETUP')
    TabOrder = 2
  end
  object wwDBLookupComboCostElement: TUniDBLookupComboBox
    Left = 292
    Top = 91
    Width = 121
    Height = 21
    Hint = ''
    ListField = 'ELEM_DESCRIP'
    ListSource = ds_Elements
    KeyField = 'ID'
    ListFieldIndex = 0
    TabOrder = 3
    Color = clWindow
  end
  object DataSource1: TDataSource
    DataSet = TblEmp_Level
    Left = 104
    Top = 170
  end
  object TblEmp_Level: TFDTable
    BeforePost = TblEmp_LevelBeforePost
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'EMP_LEVEL'
    TableName = 'EMP_LEVEL'
    Left = 104
    Top = 107
    object TblEmp_LevelCODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 10
      FieldName = 'CODE'
      Required = True
      Size = 10
    end
    object TblEmp_LevelDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Size = 30
    end
    object TblEmp_LevelLABOR_RATE: TFMTBCDField
      DisplayLabel = 'Current Rate'
      DisplayWidth = 10
      FieldName = 'LABOR_RATE'
      Size = 6
    end
    object TblEmp_LevelTYPE: TStringField
      DisplayLabel = 'Labor Type'
      DisplayWidth = 17
      FieldName = 'TYPE'
      Size = 10
    end
    object TblEmp_LevelElem_Descrip: TStringField
      DisplayLabel = 'Labor Cost Element'
      DisplayWidth = 18
      FieldKind = fkLookup
      FieldName = 'Elem_Descrip'
      LookupDataSet = QryElements
      LookupKeyFields = 'ID'
      LookupResultField = 'ELEM_DESCRIP'
      KeyFields = 'ELEMENTS_ID'
      Size = 30
      Lookup = True
    end
    object TblEmp_LevelQUOTE_RATE: TFMTBCDField
      DisplayLabel = 'Quote Rate'
      DisplayWidth = 10
      FieldName = 'QUOTE_RATE'
      Size = 6
    end
    object TblEmp_LevelEXCLUDE_FROM_RT_LABOR: TStringField
      DisplayLabel = 'Exclude from ~RT Labor'
      DisplayWidth = 1
      FieldName = 'EXCLUDE_FROM_RT_LABOR'
      Size = 1
    end
    object TblEmp_LevelFUTURE_LABOR_RATE: TFMTBCDField
      DisplayLabel = 'Future Rate'
      DisplayWidth = 10
      FieldName = 'FUTURE_LABOR_RATE'
      Size = 6
    end
    object TblEmp_LevelBUDGET_LABOR_RATE: TFMTBCDField
      DisplayLabel = 'Budget Rate'
      DisplayWidth = 10
      FieldName = 'BUDGET_LABOR_RATE'
      Size = 6
    end
    object TblEmp_LevelFORECAST_LABOR_RATE: TFMTBCDField
      DisplayLabel = 'Forecast Rate'
      DisplayWidth = 10
      FieldName = 'FORECAST_LABOR_RATE'
      Size = 6
    end
    object TblEmp_LevelELEMENTS_ID: TBCDField
      DisplayLabel = 'Cost Element'
      DisplayWidth = 12
      FieldName = 'ELEMENTS_ID'
      Visible = False
      Size = 0
    end
    object TblEmp_LevelID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 137
    Top = 50
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmEmpLevel'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 194036 $'
    BuildVersion = '176554'
    Left = 167
    Top = 50
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'TblEmp_Level')
    SecurityCode = 'FRMEMPLEVEL'
    Left = 198
    Top = 50
  end
  object QryElements: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       elem_descrip'
      '  from elements'
      ' where Rtrim(elem_type) = '#39'LABOR'#39
      ''
      ' ')
    Left = 249
    Top = 107
    object QryElementsELEM_DESCRIP: TStringField
      DisplayLabel = 'Element'
      DisplayWidth = 30
      FieldName = 'ELEM_DESCRIP'
      Origin = 'IQ.ELEMENTS.ELEM_DESCRIP'
      FixedChar = True
      Size = 30
    end
    object QryElementsID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.ELEMENTS.ID'
      Visible = False
      Size = 0
    end
  end
  object ds_Elements: TDataSource
    DataSet = QryElements
    Left = 252
    Top = 169
  end
end
