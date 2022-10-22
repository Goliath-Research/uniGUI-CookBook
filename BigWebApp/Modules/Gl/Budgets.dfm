object FrmBudgets: TFrmBudgets
  Left = 319
  Top = 192
  HelpContext = 1102373
  ClientHeight = 202
  ClientWidth = 332
  Caption = 'Budgets'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 332
    Height = 168
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 115
    IQComponents.Grid.Height = 82
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcBudgets
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
    IQComponents.Navigator.DataSource = SrcBudgets
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 115
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 82
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitHeight = 55
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitHeight = 84
    DataSource = SrcBudgets
    Columns = <
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Budget Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CODE'
        Title.Caption = 'Code'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PO_COMPARE'
        Title.Caption = 'PO Comparison'
        Width = 64
        CheckBoxField.FieldValues = 'Y;N'
      end>
    ExplicitTop = 27
    ExplicitHeight = 141
    Marker = 0
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 168
    Width = 332
    Height = 34
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel3: TUniPanel
      Tag = 1999
      Left = 124
      Top = 1
      Width = 208
      Height = 32
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnOk: TUniButton
        Left = 2
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 1
        OnClick = BtnOkClick
      end
      object BtnCancel: TUniButton
        Left = 104
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 184
    Top = 8
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
        Caption = '&Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object SrcBudgets: TDataSource
    DataSet = QryBudgets
    Left = 40
    Top = 80
  end
  object QryBudgets: TFDQuery
    BeforePost = QryBudgetsBeforePost
    AfterPost = QryBudgetsAfterDelete
    AfterDelete = QryBudgetsAfterDelete
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select id, descrip, code, PO_COMPARE from budgets')
    Left = 40
    Top = 96
    object QryBudgetsDESCRIP: TStringField
      DisplayLabel = 'Budget Description'
      DisplayWidth = 50
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Required = True
      Size = 50
    end
    object QryBudgetsCODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 10
      FieldName = 'CODE'
      Origin = 'CODE'
      Required = True
      Size = 10
    end
    object QryBudgetsPO_COMPARE: TStringField
      DisplayLabel = 'PO Comparison'
      DisplayWidth = 1
      FieldName = 'PO_COMPARE'
      Origin = 'PO_COMPARE'
      Size = 1
    end
    object QryBudgetsID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'ID'
      Visible = False
      Size = 0
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Budgets'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 193886 $'
    BuildVersion = '176554'
    Left = 80
    Top = 88
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into budgets'
      '  (ID, DESCRIP, CODE, PO_COMPARE)'
      'values'
      '  (:ID, :DESCRIP, :CODE, :PO_COMPARE)')
    ModifySQL.Strings = (
      'update budgets'
      'set'
      '  ID = :ID,'
      '  DESCRIP = :DESCRIP,'
      '  CODE = :CODE,'
      '  PO_COMPARE = :PO_COMPARE'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from budgets'
      'where'
      '  ID = :OLD_ID')
    Left = 40
    Top = 136
  end
end
