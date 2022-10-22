object FrmTariffCode: TFrmTariffCode
  Left = 249
  Top = 155
  HelpContext = 16278
  ClientHeight = 275
  ClientWidth = 378
  Caption = 'Tariff Codes'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 378
    Height = 275
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 161
    IQComponents.Grid.Height = 189
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcTrariff
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
    IQComponents.Navigator.DataSource = SrcTrariff
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 161
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 189
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitHeight = 162
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitHeight = 191
    DataSource = SrcTrariff
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
      end>
    ExplicitTop = 27
    ExplicitHeight = 248
    Marker = 0
  end
  object MainMenu1: TUniMainMenu
    Left = 48
    Top = 24
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      HelpContext = 16278
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
      object Content1: TUniMenuItem
        Caption = '&Contents'
        OnClick = Content1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Tariff Codes'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 193642 $'
    BuildVersion = '176554'
    Left = 80
    Top = 32
  end
  object SrcTrariff: TDataSource
    DataSet = QryTariff
    Left = 48
    Top = 72
  end
  object QryTariff: TFDQuery
    BeforePost = QryTariffBeforePost
    AfterPost = QryTariffAfterPost
    AfterDelete = QryTariffAfterPost
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'tariff_code'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select id,'
      'code,'
      'descrip'
      'from tariff_code')
    Left = 64
    Top = 80
    object QryTariffCODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 25
      FieldName = 'CODE'
      Origin = 'CODE'
      Size = 25
    end
    object QryTariffDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 50
    end
    object QryTariffID: TBCDField
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
      'insert into tariff_code'
      '  (ID, CODE, DESCRIP)'
      'values'
      '  (:ID, :CODE, :DESCRIP)')
    ModifySQL.Strings = (
      'update tariff_code'
      'set'
      '  ID = :ID,'
      '  CODE = :CODE,'
      '  DESCRIP = :DESCRIP'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from tariff_code'
      'where'
      '  ID = :OLD_ID')
    Left = 80
    Top = 96
  end
end
