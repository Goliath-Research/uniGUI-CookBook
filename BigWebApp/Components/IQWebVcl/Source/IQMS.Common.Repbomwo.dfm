object TFrmRepBomWo: TTFrmRepBomWo
  Left = 72
  Top = 192
  ClientHeight = 312
  ClientWidth = 461
  Caption = 'TFrmRepBomWo'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 461
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object Nav: TUniDBNavigator
      Left = 286
      Top = 1
      Width = 175
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = SrcMfg
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object grid: TIQUniGridControl
    Left = 0
    Top = 27
    Width = 461
    Height = 285
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 244
    IQComponents.Grid.Height = 199
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcMfg
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
    IQComponents.Navigator.DataSource = SrcMfg
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 244
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 199
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcMfg
    Columns = <
      item
        FieldName = 'MFGTYPE'
        Title.Caption = 'Mfg Type'
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
        FieldName = 'BOM_REPORT'
        Title.Caption = 'BOM Report'
        Width = 350
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'WO_REPORT'
        Title.Caption = 'WO Report'
        Width = 350
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BEFORE_BOM_REPORT'
        Title.Caption = 'Exec. before BOM report'
        Width = 350
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BEFORE_WO_REPORT'
        Title.Caption = 'Exec. before WO report'
        Width = 350
        CheckBoxField.FieldValues = 'true;false'
      end>
    ExplicitLeft = 56
    ExplicitTop = 139
    Marker = 0
  end
  object dbReportBom: TUniEdit
    Left = 240
    Top = 88
    Width = 121
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 2
  end
  object dbBeforeBom: TUniDBLookupComboBox
    Left = 239
    Top = 142
    Width = 114
    Height = 21
    Hint = ''
    ListFieldIndex = 0
    TabOrder = 3
    Color = clWindow
  end
  object dbReportWo: TUniEdit
    Left = 240
    Top = 112
    Width = 121
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 4
  end
  object dbBeforeWo: TUniDBLookupComboBox
    Left = 239
    Top = 166
    Width = 114
    Height = 21
    Hint = ''
    ListFieldIndex = 0
    TabOrder = 5
    Color = clWindow
  end
  object SrcMfg: TDataSource
    DataSet = tblMfg
    Left = 88
    Top = 56
  end
  object tblMfg: TFDTable
    BeforeInsert = tblMfgBeforeInsert
    BeforeDelete = tblMfgBeforeInsert
    IndexFieldNames = 'MFGTYPE'
    ConnectionName = 'IQFD'
    FormatOptions.AssignedValues = [fvStrsTrim]
    FormatOptions.StrsTrim = False
    UpdateOptions.UpdateTableName = 'MFGTYPE'
    UpdateOptions.KeyFields = 'MFGTYPE'
    TableName = 'MFGTYPE'
    Left = 104
    Top = 56
    object tblMfgMFGTYPE: TStringField
      DisplayLabel = 'Mfg Type'
      DisplayWidth = 10
      FieldName = 'MFGTYPE'
      ReadOnly = True
      Required = True
      Size = 10
    end
    object tblMfgDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      ReadOnly = True
    end
    object tblMfgBOM_REPORT: TStringField
      DisplayLabel = 'BOM Report'
      DisplayWidth = 50
      FieldName = 'BOM_REPORT'
      Size = 250
    end
    object tblMfgWO_REPORT: TStringField
      DisplayLabel = 'WO Report'
      DisplayWidth = 50
      FieldName = 'WO_REPORT'
      Size = 250
    end
    object tblMfgBEFORE_BOM_REPORT: TStringField
      DisplayLabel = 'Exec. before BOM report'
      DisplayWidth = 50
      FieldName = 'BEFORE_BOM_REPORT'
      Size = 50
    end
    object tblMfgBEFORE_WO_REPORT: TStringField
      DisplayLabel = 'Exec. before WO report'
      DisplayWidth = 50
      FieldName = 'BEFORE_WO_REPORT'
      Size = 50
    end
  end
  object QryAllProcsBom: TFDQuery
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct object_name'
      '  from all_arguments'
      ' where '
      '       owner = '#39'IQMS'#39
      '   and package_name = '#39'CRW_BEFORE_EXEC'#39
      ' order by '
      '       object_name'
      ''
      '--select object_name'
      '-- from all_objects'
      '--where owner = '#39'IQMS'#39
      '--and object_type = '#39'PROCEDURE'#39
      '--order by object_name'
      ''
      ''
      '')
    Left = 28
    Top = 194
    object QryAllProcsBomOBJECT_NAME: TStringField
      FieldName = 'OBJECT_NAME'
      Size = 128
    end
  end
  object QryAllProcsWo: TFDQuery
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct object_name'
      '  from all_arguments'
      ' where '
      '       owner = '#39'IQMS'#39
      '   and package_name = '#39'CRW_BEFORE_EXEC'#39
      ' order by '
      '       object_name'
      ''
      '--select object_name'
      '-- from all_objects'
      '--where owner = '#39'IQMS'#39
      '--and object_type = '#39'PROCEDURE'#39
      '--order by object_name'
      ''
      ''
      '')
    Left = 60
    Top = 194
    object StringField1: TStringField
      FieldName = 'OBJECT_NAME'
      Size = 128
    end
  end
  object UniFileUpload1: TUniFileUpload
    OnCompleted = UniFileUpload1Completed
    Title = 'Upload'
    Messages.Uploading = 'Uploading...'
    Messages.PleaseWait = 'Please Wait'
    Messages.Cancel = 'Cancel'
    Messages.Processing = 'Processing...'
    Messages.UploadError = 'Upload Error'
    Messages.Upload = 'Upload'
    Messages.NoFileError = 'Please Select a File'
    Messages.BrowseText = 'Browse...'
    Left = 224
    Top = 160
  end
end
