object FrmBuyerCode: TFrmBuyerCode
  Left = 342
  Top = 231
  HelpContext = 1137550
  ClientHeight = 229
  ClientWidth = 445
  Caption = 'Buyer Code'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 445
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    ExplicitWidth = 319
  end
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 27
    Width = 445
    Height = 202
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 228
    IQComponents.Grid.Height = 116
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcBC
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
    IQComponents.Navigator.DataSource = SrcBC
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.Navigator.BeforeAction = NavBeforeAction
    IQComponents.HiddenPanel.Left = 228
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 116
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitLeft = 102
    IQComponents.HiddenPanel.ExplicitHeight = 78
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitWidth = 311
    IQComponents.FormTab.ExplicitHeight = 107
    DataSource = SrcBC
    Columns = <
      item
        FieldName = 'BUYER_CODE'
        Title.Caption = 'Code'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 350
        CheckBoxField.FieldValues = 'true;false'
      end>
    ExplicitWidth = 319
    ExplicitHeight = 164
    Marker = 0
  end
  object MainMenu1: TUniMainMenu
    Left = 56
    Top = 48
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
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
  object SrcBC: TDataSource
    DataSet = QryBC
    Left = 32
    Top = 110
  end
  object QryBC: TFDQuery
    BeforePost = QryBCBeforePost
    AfterPost = QryBCAfterPost
    AfterDelete = QryBCAfterPost
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'buyer_code'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select id,'
      '       buyer_code,'
      '       descrip'
      '  from buyer_code')
    Left = 48
    Top = 112
    object QryBCBUYER_CODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 10
      FieldName = 'BUYER_CODE'
      Origin = 'BUYER_CODE'
      Size = 10
    end
    object QryBCDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 50
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 50
    end
    object QryBCID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into buyer_code'
      '  (ID, BUYER_CODE, DESCRIP)'
      'values'
      '  (:ID, :BUYER_CODE, :DESCRIP)')
    ModifySQL.Strings = (
      'update buyer_code'
      'set'
      '  ID = :ID,'
      '  BUYER_CODE = :BUYER_CODE,'
      '  DESCRIP = :DESCRIP'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from buyer_code'
      'where'
      '  ID = :OLD_ID')
    Left = 88
    Top = 110
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Buyer Code'
    Version = 'DEV.176554'
    BuildVersion = '176554'
    Left = 120
    Top = 110
  end
end
