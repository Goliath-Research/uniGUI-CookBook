object FrmPayTypeSettings: TFrmPayTypeSettings
  Left = 56
  Top = 207
  ClientHeight = 581
  ClientWidth = 705
  Caption = 'Pay Type Settings'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 705
    Height = 581
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 488
    IQComponents.Grid.Height = 495
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcPayType
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
    IQComponents.Navigator.DataSource = SrcPayType
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 488
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 495
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcPayType
    Columns = <
      item
        FieldName = 'DESCRIPTION'
        Title.Caption = 'Pay Type'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TA_OT'
        Title.Caption = 'Default to OT Avail.'
        Width = 64
        CheckBoxField.FieldValues = 'Y;N'
      end>
    Marker = 0
  end
  object MainMenu1: TUniMainMenu
    Left = 160
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
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Pay Type Settings'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 192075 $'
    BuildVersion = '176554'
    Left = 192
    Top = 24
  end
  object SrcPayType: TDataSource
    DataSet = QryPayType
    Left = 220
    Top = 89
  end
  object QryPayType: TFDQuery
    Active = True
    BeforeInsert = QryPayTypeBeforeDelete
    AfterPost = QryPayTypeAfterPost
    BeforeDelete = QryPayTypeBeforeDelete
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select id,'
      '       description,'
      '       ta_ot '
      '  from pr_paytype'
      'where NVL(pk_hide, '#39'N'#39') = '#39'N'#39)
    Left = 200
    Top = 88
    object QryPayTypeDESCRIPTION: TStringField
      DisplayLabel = 'Pay Type'
      DisplayWidth = 50
      FieldName = 'DESCRIPTION'
      Origin = 'DESCRIPTION'
      Size = 50
    end
    object QryPayTypeTA_OT: TStringField
      DisplayLabel = 'Default to OT Avail.'
      DisplayWidth = 1
      FieldName = 'TA_OT'
      Origin = 'TA_OT'
      Size = 1
    end
    object QryPayTypeID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    ModifySQL.Strings = (
      'update pr_paytype'
      'set'
      '  TA_OT = :TA_OT'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      '')
    Left = 240
    Top = 112
  end
end
