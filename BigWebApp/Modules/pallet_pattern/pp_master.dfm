object FrmPP_Master: TFrmPP_Master
  Left = 159
  Top = 227
  ClientHeight = 327
  ClientWidth = 410
  Caption = 'Master Pallet Pattern'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  Font.Name = 'MS Sans Serif'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 410
    Height = 28
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    ExplicitWidth = 595
    object DBNavigator1: TUniDBNavigator
      Left = 170
      Top = 1
      Width = 240
      Height = 26
      Hint = ''
      DataSource = DataSource1
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      ExplicitLeft = 355
    end
  end
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 28
    Width = 410
    Height = 299
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Name = 'MS Sans Serif'
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 193
    IQComponents.Grid.Height = 213
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
    IQComponents.HiddenPanel.Left = 193
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 213
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitLeft = 378
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitWidth = 587
    DataSource = DataSource1
    Columns = <
      item
        FieldName = 'PATTERN_KEY'
        Title.Caption = 'Pattern Key'
        Width = 67
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 62
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'LAYERS'
        Title.Caption = 'Layers'
        Width = 42
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'LAYER_SIZE_FACTOR'
        Title.Caption = 'Layer Size Factor'
        Width = 53
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DOUBLE_STACKED'
        Title.Caption = 'Double Stacked'
        Width = 84
        CheckBoxField.FieldValues = 'Y;N'
      end
      item
        FieldName = 'PALLET_TYPE'
        Title.Caption = 'Pallet Type'
        Width = 60
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CASES_PER_PALLET'
        Title.Caption = 'Cases / Pallet'
        Width = 69
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FORCETOFULLPALLET'
        Title.Caption = 'Force Full Pallet'
        Width = 1
        CheckBoxField.FieldValues = 'Y;N'
      end>
    ExplicitTop = 33
    ExplicitWidth = 595
    Marker = 0
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 96
    Top = 34
  end
  object Table1: TFDTable
    BeforePost = Table1BeforePost
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PALLET_PATTERN'
    TableName = 'PALLET_PATTERN'
    Left = 105
    Top = 58
    object Table1DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 31
      FieldName = 'DESCRIP'
      Size = 60
    end
    object Table1PATTERN_KEY: TBCDField
      DisplayLabel = 'Pattern Key'
      DisplayWidth = 10
      FieldName = 'PATTERN_KEY'
      Size = 0
    end
    object Table1PALLET_TYPE: TBCDField
      DisplayLabel = 'Pallet Type'
      DisplayWidth = 10
      FieldName = 'PALLET_TYPE'
      Size = 0
    end
    object Table1LAYERS: TBCDField
      DisplayLabel = 'Layers'
      DisplayWidth = 10
      FieldName = 'LAYERS'
      Size = 0
    end
    object Table1LAYER_SIZE_FACTOR: TBCDField
      DisplayLabel = 'Layer Size Factor'
      DisplayWidth = 13
      FieldName = 'LAYER_SIZE_FACTOR'
      Size = 0
    end
    object Table1CASES_PER_PALLET: TBCDField
      DisplayLabel = 'Cases / Pallet'
      DisplayWidth = 12
      FieldName = 'CASES_PER_PALLET'
      Size = 0
    end
    object Table1DOUBLE_STACKED: TStringField
      DisplayLabel = 'Double Stacked'
      DisplayWidth = 12
      FieldName = 'DOUBLE_STACKED'
      Size = 1
    end
    object Table1FORCETOFULLPALLET: TStringField
      DisplayLabel = 'Force Full Pallet'
      DisplayWidth = 1
      FieldName = 'FORCETOFULLPALLET'
      Size = 1
    end
    object Table1ID: TBCDField
      FieldName = 'ID'
      Required = True
      Visible = False
      Size = 0
    end
  end
end
