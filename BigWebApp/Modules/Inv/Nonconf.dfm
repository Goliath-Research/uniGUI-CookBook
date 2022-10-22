object NonConformTable: TNonConformTable
  Left = 166
  Top = 205
  HelpContext = 1096436
  ClientHeight = 297
  ClientWidth = 286
  Caption = 'Non Conform Codes'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  Font.Name = 'MS Sans Serif'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 286
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
  end
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 27
    Width = 286
    Height = 270
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Name = 'MS Sans Serif'
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 69
    IQComponents.Grid.Height = 184
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
    IQComponents.HiddenPanel.Left = 69
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 184
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
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PK_HIDE'
        Title.Caption = 'Inactive'
        Width = 64
        CheckBoxField.FieldValues = 'Y;N'
      end>
    TabsVisible = True
    Marker = 0
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 23
    Top = 153
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'DBNavigator'
      'DBNavigator1'
      'DataSource1'
      'TblIQSys')
    SecurityCode = 'NONCONFORMTABLE'
    Left = 236
    Top = 160
  end
  object Query1: TFDQuery
    BeforePost = Query1BeforePost
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'non_conform'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select id, '
      'code, '
      'descrip, '
      'pk_hide '
      'from non_conform')
    Left = 104
    Top = 184
    object Query1CODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 10
      FieldName = 'CODE'
      Origin = 'CODE'
      FixedChar = True
      Size = 10
    end
    object Query1DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 30
    end
    object Query1PK_HIDE: TStringField
      DisplayLabel = 'Inactive'
      DisplayWidth = 1
      FieldName = 'PK_HIDE'
      Origin = 'PK_HIDE'
      Size = 1
    end
    object Query1ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into non_conform'
      '  (ID, CODE, DESCRIP, PK_HIDE)'
      'values'
      '  (:NEW_ID, :CODE, :DESCRIP, :PK_HIDE)')
    ModifySQL.Strings = (
      'update non_conform'
      'set'
      '  CODE = :CODE,'
      '  DESCRIP = :DESCRIP,'
      '  PK_HIDE = :PK_HIDE'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from non_conform'
      'where'
      '  ID = :OLD_ID')
    Left = 144
    Top = 192
  end
end
