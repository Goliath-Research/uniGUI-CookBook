object FrmWorkCenterRTLabelGroup: TFrmWorkCenterRTLabelGroup
  Left = 308
  Top = 243
  ClientHeight = 272
  ClientWidth = 383
  Caption = 'RTLabel Groups'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 383
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    ExplicitWidth = 338
  end
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 27
    Width = 383
    Height = 245
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 166
    IQComponents.Grid.Height = 159
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
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.Navigator.BeforeAction = CheckRefresh
    IQComponents.HiddenPanel.Left = 166
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 159
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitLeft = 121
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitWidth = 330
    DataSource = DataSource1
    Columns = <
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 350
        CheckBoxField.FieldValues = 'true;false'
      end>
    ExplicitWidth = 338
    Marker = 0
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 48
    Top = 104
  end
  object Query1: TFDQuery
    OnNewRecord = Query1NewRecord
    ConnectionName = 'IQFD'
    UpdateOptions.UpdateTableName = 'AUTO_LABEL_GROUP'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select id, descrip'
      '  from auto_label_group'
      'order by descrip')
    Left = 48
    Top = 160
    object Query1DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 50
      FieldName = 'DESCRIP'
      Origin = 'IQ.AUTO_LABEL_GROUP.DESCRIP'
      Required = True
      Size = 50
    end
    object Query1ID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.AUTO_LABEL_GROUP.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into auto_label_group'
      '  (ID, DESCRIP)'
      'values'
      '  (:ID, :DESCRIP)')
    ModifySQL.Strings = (
      'update auto_label_group'
      'set'
      '  ID = :ID,'
      '  DESCRIP = :DESCRIP'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from auto_label_group'
      'where'
      '  ID = :OLD_ID')
    Left = 176
    Top = 160
  end
end
