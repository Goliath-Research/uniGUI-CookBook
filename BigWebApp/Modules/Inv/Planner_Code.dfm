object FrmPlannerCode: TFrmPlannerCode
  Left = 229
  Top = 100
  HelpContext = 1126335
  ClientHeight = 222
  ClientWidth = 274
  Caption = 'Planner Codes'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 274
    Height = 222
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 57
    IQComponents.Grid.Height = 136
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
    IQComponents.HiddenPanel.Left = 57
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 136
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitHeight = 109
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitHeight = 138
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
      end>
    ExplicitTop = 27
    ExplicitHeight = 195
    Marker = 0
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 100
    Top = 66
  end
  object Table1: TFDTable
    BeforePost = Table1BeforePost
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PLANNER_CODE'
    TableName = 'PLANNER_CODE'
    Left = 100
    Top = 80
    object Table1CODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 10
      FieldName = 'CODE'
      Required = True
      Size = 10
    end
    object Table1DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Size = 30
    end
    object Table1ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
end
