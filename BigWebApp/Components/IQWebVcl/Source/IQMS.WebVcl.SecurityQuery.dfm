object SecurityQuery: TSecurityQuery
  Left = 200
  Top = 108
  ClientHeight = 526
  ClientWidth = 461
  Caption = 'Roles - Forms - Components Query'
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter2: TUniSplitter
    Left = 0
    Top = 236
    Width = 461
    Height = 4
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 461
    Height = 236
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 228
      Top = 0
      Width = 4
      Height = 236
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object DBGrid2: TUniDBGrid
      Left = 232
      Top = 1
      Width = 229
      Height = 234
      Hint = ''
      DataSource = DataSource2
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Columns = <
        item
          FieldName = 'APP_S_CODE'
          Title.Caption = 'Sec Code (Form)'
          Width = 200
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 228
      Height = 234
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 1
      Caption = ''
      object DBGrid1: TUniDBGrid
        Left = 1
        Top = 1
        Width = 226
        Height = 232
        Hint = ''
        DataSource = DataSource1
        LoadMask.Message = 'Loading data...'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Columns = <
          item
            FieldName = 'ROLE_NAME'
            Title.Caption = 'Role'
            Width = 187
            CheckBoxField.FieldValues = 'true;false'
          end>
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 240
    Width = 461
    Height = 286
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object wwDBGrid3: TIQUniGridControl
      Left = 1
      Top = 28
      Width = 459
      Height = 258
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 242
      IQComponents.Grid.Height = 172
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = wwDataSource1
      IQComponents.Grid.LoadMask.Message = 'Loading data...'
      IQComponents.Grid.Align = alClient
      IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
      IQComponents.Grid.TabOrder = 0
      IQComponents.Grid.OnDrawColumnCell = wwDBGrid3DBGridDrawColumnCell
      IQComponents.Navigator.Left = 410
      IQComponents.Navigator.Top = 0
      IQComponents.Navigator.Width = 241
      IQComponents.Navigator.Height = 25
      IQComponents.Navigator.Hint = ''
      IQComponents.Navigator.ShowHint = True
      IQComponents.Navigator.DataSource = wwDataSource1
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 242
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 172
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
          FieldName = 'C_NAME'
          Title.Caption = 'Component Name'
          Width = 189
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'C_VISIBLE'
          Title.Caption = 'Visible'
          Width = 35
          CheckBoxField.FieldValues = 'Y;N'
        end
        item
          FieldName = 'C_ENABLED'
          Title.Caption = 'Enabled'
          Width = 49
          CheckBoxField.FieldValues = 'Y;N'
        end
        item
          FieldName = 'C_INSERT'
          Title.Caption = 'Insert'
          Width = 35
          CheckBoxField.FieldValues = 'Y;N'
        end
        item
          FieldName = 'C_DELETE'
          Title.Caption = 'Delete'
          Width = 35
          CheckBoxField.FieldValues = 'Y;N'
        end
        item
          FieldName = 'C_RD_WR'
          Title.Caption = 'Edit'
          Width = 35
          CheckBoxField.FieldValues = 'Y;N'
        end>
      Marker = 0
    end
    object Panel3: TUniPanel
      Left = 1
      Top = 1
      Width = 459
      Height = 28
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      object DBNavigator1: TUniDBNavigator
        Left = 233
        Top = 1
        Width = 226
        Height = 26
        Hint = ''
        DataSource = wwDataSource1
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel, nbRefresh]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
      object Panel5: TUniPanel
        Left = 213
        Top = 1
        Width = 20
        Height = 26
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object Shape4: TUniPanel
          Left = 1
          Top = 7
          Width = 10
          Height = 11
          Hint = 'Deny System Wide'
          ShowHint = True
          ParentShowHint = False
          TabOrder = 1
          Caption = ''
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 239
    Top = 192
  end
  object DataSource2: TDataSource
    DataSet = Table2
    Left = 283
    Top = 192
  end
  object Table1: TFDTable
    IndexFieldNames = 'ROLE_NAME'
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    UpdateOptions.UpdateTableName = 'S_ROLES'
    TableName = 'S_ROLES'
    Left = 238
    Top = 208
    object Table1ROLE_NAME: TStringField
      FieldName = 'ROLE_NAME'
      Required = True
      Size = 35
    end
  end
  object Table2: TFDTable
    IndexFieldNames = 'ROLE_NAME;APP_S_CODE'
    MasterSource = DataSource1
    MasterFields = 'ROLE_NAME'
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    UpdateOptions.UpdateTableName = 'S_MASTER'
    TableName = 'S_MASTER'
    Left = 283
    Top = 208
    object Table2APP_S_CODE: TStringField
      FieldName = 'APP_S_CODE'
      Required = True
      Size = 35
    end
    object Table2ROLE_NAME: TStringField
      FieldName = 'ROLE_NAME'
      Required = True
      Size = 35
    end
  end
  object wwDataSource1: TDataSource
    DataSet = wwTable1
    Left = 327
    Top = 192
  end
  object wwTable1: TFDTable
    IndexFieldNames = 'APP_S_CODE;ROLE_NAME;C_NAME'
    MasterSource = DataSource2
    MasterFields = 'APP_S_CODE;ROLE_NAME'
    ConnectionName = 'IQFD'
    UpdateOptions.UpdateTableName = 'S_DETAIL'
    TableName = 'S_DETAIL'
    Left = 327
    Top = 208
    object wwTable1C_NAME: TStringField
      DisplayLabel = 'Component Name'
      DisplayWidth = 27
      FieldName = 'C_NAME'
      ReadOnly = True
      Required = True
      Size = 60
    end
    object wwTable1C_VISIBLE: TStringField
      DisplayLabel = 'Visible'
      DisplayWidth = 5
      FieldName = 'C_VISIBLE'
      Size = 1
    end
    object wwTable1C_ENABLED: TStringField
      DisplayLabel = 'Enabled'
      DisplayWidth = 7
      FieldName = 'C_ENABLED'
      Size = 1
    end
    object wwTable1C_INSERT: TStringField
      DisplayLabel = 'Insert'
      DisplayWidth = 5
      FieldName = 'C_INSERT'
      Size = 1
    end
    object wwTable1C_DELETE: TStringField
      DisplayLabel = 'Delete'
      DisplayWidth = 5
      FieldName = 'C_DELETE'
      Size = 1
    end
    object wwTable1C_RD_WR: TStringField
      DisplayLabel = 'Edit'
      DisplayWidth = 5
      FieldName = 'C_RD_WR'
      Size = 1
    end
    object wwTable1APP_S_CODE: TStringField
      DisplayWidth = 35
      FieldName = 'APP_S_CODE'
      ReadOnly = True
      Required = True
      Visible = False
      Size = 35
    end
    object wwTable1ROLE_NAME: TStringField
      DisplayWidth = 35
      FieldName = 'ROLE_NAME'
      ReadOnly = True
      Required = True
      Visible = False
      Size = 35
    end
  end
  object PopupMenu1: TUniPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 212
    Top = 308
    object DenySystemWide1: TUniMenuItem
      Caption = 'Deny System Wide'
      OnClick = DenySystemWide1Click
    end
  end
end
