object FrmInvEnvRegulation: TFrmInvEnvRegulation
  Left = 161
  Top = 274
  HelpContext = 15581
  ClientHeight = 215
  ClientWidth = 575
  Caption = 'Environmental Regulations'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 575
    Height = 215
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 358
    IQComponents.Grid.Height = 129
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = wwDataSource1
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
    IQComponents.Navigator.DataSource = wwDataSource1
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 358
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 129
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitHeight = 99
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitHeight = 128
    DataSource = wwDataSource1
    TabsVisible = True
    ExplicitTop = 30
    ExplicitHeight = 185
    Marker = 0
  end
  object wwDataSource1: TDataSource
    DataSet = wwQuery1
    Left = 70
    Top = 96
  end
  object wwQuery1: TFDQuery
    BeforePost = wwQuery1BeforePost
    AfterPost = ApplyUpdate
    AfterDelete = ApplyUpdate
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'env_reg'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select id,'
      '       regno,'
      '       descrip'
      '  from env_reg'
      'order by regno  '
      '  ')
    Left = 69
    Top = 109
    object wwQuery1REGNO: TStringField
      DisplayLabel = 'Regulation'
      FieldName = 'REGNO'
      Origin = 'IQ.ENV_REG.REGNO'
      Size = 30
    end
    object wwQuery1DESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'IQ.ENV_REG.DESCRIP'
      Size = 60
    end
    object wwQuery1ID: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into env_reg'
      '  (ID, REGNO, DESCRIP)'
      'values'
      '  (:ID, :REGNO, :DESCRIP)')
    ModifySQL.Strings = (
      'update env_reg'
      'set'
      '  ID = :ID,'
      '  REGNO = :REGNO,'
      '  DESCRIP = :DESCRIP'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from env_reg'
      'where'
      '  ID = :OLD_ID')
    Left = 70
    Top = 122
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'wwQuery1')
    SecurityCode = 'FRMINVENVREGULATION'
    Left = 123
    Top = 109
  end
end
