object FrmServiceGroups: TFrmServiceGroups
  Left = 308
  Top = 170
  ClientHeight = 206
  ClientWidth = 429
  Caption = 'Service Groups'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 429
    Height = 28
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    ExplicitWidth = 320
  end
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 28
    Width = 429
    Height = 178
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 212
    IQComponents.Grid.Height = 92
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = DataSource1
    IQComponents.Grid.LoadMask.Message = 'Loading data...'
    IQComponents.Grid.Align = alClient
    IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
    IQComponents.Grid.TabOrder = 0
    IQComponents.Grid.OnDrawColumnCell = wwDBGrid1DBGridDrawColumnCell
    IQComponents.Navigator.Left = 410
    IQComponents.Navigator.Top = 0
    IQComponents.Navigator.Width = 241
    IQComponents.Navigator.Height = 25
    IQComponents.Navigator.Hint = ''
    IQComponents.Navigator.ShowHint = True
    IQComponents.Navigator.DataSource = DataSource1
    IQComponents.Navigator.VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 212
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 92
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitLeft = 103
    IQComponents.HiddenPanel.ExplicitHeight = 33
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitWidth = 312
    IQComponents.FormTab.ExplicitHeight = 62
    DataSource = DataSource1
    Columns = <
      item
        FieldName = 'ID'
        Title.Caption = 'Group ID'
        Width = 56
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 280
        CheckBoxField.FieldValues = 'true;false'
      end>
    ExplicitWidth = 320
    ExplicitHeight = 119
    Marker = 0
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 39
    Top = 69
  end
  object Table1: TFDTable
    BeforePost = Table1BeforePost
    Filtered = True
    IndexFieldNames = 'ID'
    ConnectionName = 'IQFD'
    UpdateOptions.UpdateTableName = 'PCMON_SERVICE_GROUP'
    TableName = 'PCMON_SERVICE_GROUP'
    Left = 139
    Top = 68
    object Table1ID: TBCDField
      DisplayLabel = 'Group ID'
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object Table1DESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Required = True
      Size = 25
    end
  end
end
