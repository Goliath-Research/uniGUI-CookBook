object TestRegisteredForms: TTestRegisteredForms
  Left = 0
  Top = 0
  ClientHeight = 339
  ClientWidth = 768
  Caption = 'Test Registered Forms'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pc: TUniPageControl
    Left = 0
    Top = 0
    Width = 768
    Height = 339
    Hint = ''
    ActivePage = tsIssues
    TabBarVisible = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    LayoutConfig.Region = 'center'
    TabOrder = 0
    object tsIssues: TUniTabSheet
      Hint = ''
      Caption = 'Issues'
      LayoutConfig.Region = 'center'
      object dbgIssues: TUniDBGrid
        Left = 0
        Top = 0
        Width = 101
        Height = 311
        Hint = ''
        DataSource = dsIssues
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgTabs, dgCancelOnExit]
        LoadMask.Message = 'Loading data...'
        LayoutConfig.Split = True
        LayoutConfig.Region = 'west'
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        OnColumnFilter = dbgIssuesColumnFilter
        Columns = <
          item
            FieldName = 'Issue'
            Filtering.Enabled = True
            Filtering.Editor = edIssueFilter
            Title.Alignment = taCenter
            Title.Caption = 'Issue'
            Width = 70
            ReadOnly = True
            Editor = edIssueFilter
            CheckBoxField.FieldValues = 'true;false'
            Menu.ColumnHideable = False
          end>
      end
      object dbgIssueTests: TUniDBGrid
        Left = 107
        Top = 0
        Width = 653
        Height = 311
        Hint = ''
        DataSource = dsIssueTests
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete]
        ReadOnly = True
        LoadMask.Message = 'Loading data...'
        OnDblClick = dbgIssueTestsDblClick
        LayoutConfig.Region = 'center'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Columns = <
          item
            FieldName = 'Issue'
            Title.Alignment = taCenter
            Title.Caption = 'Issue'
            Width = 64
            Visible = False
            ReadOnly = True
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'Module'
            Title.Alignment = taCenter
            Title.Caption = 'Module'
            Width = 110
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'Form'
            Title.Alignment = taCenter
            Title.Caption = 'Form'
            Width = 158
            ReadOnly = True
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'Descrip'
            Title.Alignment = taCenter
            Title.Caption = 'Test Description'
            Width = 366
            ReadOnly = True
            CheckBoxField.FieldValues = 'true;false'
          end>
      end
      object UniSplitter1: TUniSplitter
        Left = 101
        Top = 0
        Width = 6
        Height = 311
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
    end
    object tsModules: TUniTabSheet
      Hint = ''
      Caption = 'Modules'
      Layout = 'fit'
      LayoutConfig.Region = 'center'
      object dbgModules: TUniDBGrid
        Left = 0
        Top = 0
        Width = 147
        Height = 311
        Hint = ''
        DataSource = dsModules
        LoadMask.Message = 'Loading data...'
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Columns = <
          item
            FieldName = 'Module'
            Title.Alignment = taCenter
            Title.Caption = 'Module'
            Width = 120
            CheckBoxField.FieldValues = 'true;false'
            Menu.ColumnHideable = False
          end>
      end
      object dbgModuleForms: TUniDBGrid
        Left = 153
        Top = 0
        Width = 252
        Height = 311
        Hint = ''
        DataSource = dsModuleForms
        LoadMask.Message = 'Loading data...'
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 1
        Columns = <
          item
            FieldName = 'Module'
            Title.Alignment = taCenter
            Title.Caption = 'Module'
            Width = 388
            Visible = False
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'Form'
            Title.Alignment = taCenter
            Title.Caption = 'Form'
            Width = 159
            CheckBoxField.FieldValues = 'true;false'
            Menu.ColumnHideable = False
          end
          item
            FieldName = 'Issue'
            Title.Alignment = taCenter
            Title.Caption = 'Issue'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
            Menu.ColumnHideable = False
          end>
      end
      object UniSplitter2: TUniSplitter
        Left = 147
        Top = 0
        Width = 6
        Height = 311
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object UniSplitter3: TUniSplitter
        Left = 405
        Top = 0
        Width = 6
        Height = 311
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object dbgFormTests: TUniDBGrid
        Left = 411
        Top = 0
        Width = 349
        Height = 311
        Hint = ''
        DataSource = dsFormTests
        LoadMask.Message = 'Loading data...'
        OnDblClick = dbgFormTestsDblClick
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 4
        Columns = <
          item
            FieldName = 'Issue'
            Title.Alignment = taCenter
            Title.Caption = 'Issue'
            Width = 64
            Visible = False
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'Descrip'
            Title.Alignment = taCenter
            Title.Caption = 'Test Description'
            Width = 324
            CheckBoxField.FieldValues = 'true;false'
            Menu.ColumnHideable = False
          end>
      end
    end
  end
  object UniHiddenPanel1: TUniHiddenPanel
    Left = 264
    Top = 112
    Width = 129
    Height = 96
    Hint = ''
    Visible = True
    object edIssueFilter: TUniEdit
      Left = 3
      Top = 3
      Width = 121
      Hint = ''
      Text = 'edIssueFilter'
      TabOrder = 1
    end
  end
  object mtIssues: TFDMemTable
    AfterScroll = mtIssuesAfterScroll
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 40
    Top = 72
    object mtIssuesIssue: TStringField
      FieldName = 'Issue'
      Size = 10
    end
  end
  object dsIssues: TDataSource
    DataSet = mtIssues
    Left = 40
    Top = 136
  end
  object mtIssueTests: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    LocalSQL = FDLocalSQL1
    StoreDefs = True
    Left = 184
    Top = 72
    object mtIssueTestsIssue: TStringField
      FieldName = 'Issue'
      Size = 10
    end
    object mtIssueTestsModule: TStringField
      FieldName = 'Module'
      Size = 64
    end
    object mtIssueTestsForm: TStringField
      FieldName = 'Form'
      Size = 64
    end
    object mtIssueTestsDescrip: TStringField
      FieldName = 'Descrip'
      Size = 128
    end
    object mtIssueTestsTest: TIntegerField
      FieldName = 'Test'
    end
  end
  object dsIssueTests: TDataSource
    DataSet = mtIssueTests
    Left = 184
    Top = 136
  end
  object mtModules: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 40
    Top = 224
    object mtModulesModule: TStringField
      FieldName = 'Module'
      Size = 64
    end
  end
  object dsModules: TDataSource
    DataSet = mtModules
    Left = 40
    Top = 280
  end
  object mtModuleForms: TFDMemTable
    MasterSource = dsModules
    MasterFields = 'Module'
    DetailFields = 'Module'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 184
    Top = 224
    object mtModuleFormsModule: TStringField
      FieldName = 'Module'
      Size = 64
    end
    object mtModuleFormsForm: TStringField
      FieldName = 'Form'
      Size = 64
    end
    object mtModuleFormsIssue: TStringField
      FieldName = 'Issue'
      Size = 10
    end
  end
  object dsModuleForms: TDataSource
    DataSet = mtModuleForms
    Left = 184
    Top = 280
  end
  object mtFormTests: TFDMemTable
    MasterSource = dsModuleForms
    MasterFields = 'Issue'
    DetailFields = 'Issue'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 536
    Top = 224
    object mtFormTestsIssue: TStringField
      FieldName = 'Issue'
      Size = 10
    end
    object mtFormTestsDescrip: TStringField
      FieldName = 'Descrip'
      Size = 128
    end
    object mtFormTestsTest: TIntegerField
      FieldName = 'Test'
    end
  end
  object dsFormTests: TDataSource
    DataSet = mtFormTests
    Left = 536
    Top = 280
  end
  object Qry: TFDQuery
    Connection = SQLiteConn
    SQL.Strings = (
      'select distinct Module from IssueTests')
    Left = 532
    Top = 96
  end
  object FDLocalSQL1: TFDLocalSQL
    Connection = SQLiteConn
    Active = True
    DataSets = <>
    Left = 532
    Top = 160
  end
  object SQLiteConn: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    Left = 628
    Top = 160
  end
end
