object FrmColorGroup: TFrmColorGroup
  Left = 282
  Top = 154
  HelpContext = 1134067
  ClientHeight = 319
  ClientWidth = 498
  Caption = 'Color Codes'
  OnShow = UniFormShow
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
    Width = 498
    Height = 319
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 281
    IQComponents.Grid.Height = 233
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
    IQComponents.HiddenPanel.Left = 281
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 233
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = wwDataSource1
    Columns = <
      item
        FieldName = 'ID'
        Title.Caption = 'ID'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DispColor'
        Title.Caption = 'Color'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object wwDBComboDlgColorCode: TUniEdit
    Left = 66
    Top = 108
    Width = 121
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 1
  end
  object ColorBoxDummy: TColorBox
    Left = 59
    Top = 203
    Width = 145
    Height = 22
    Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
    TabOrder = 2
    Visible = False
  end
  object wwDataSource1: TDataSource
    DataSet = wwTable1
    Left = 47
    Top = 57
  end
  object wwTable1: TFDTable
    BeforePost = wwTable1BeforePost
    OnCalcFields = wwTable1CalcFields
    OnNewRecord = wwTable1NewRecord
    IndexName = 'PK_COLOR_GROUP'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'COLOR_GROUP'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'COLOR_GROUP'
    Left = 47
    Top = 72
    object wwTable1ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object wwTable1CODE: TBCDField
      DisplayLabel = 'Color'
      DisplayWidth = 10
      FieldName = 'CODE'
      Required = True
      Size = 0
    end
    object wwTable1DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 50
      FieldName = 'DESCRIP'
      Required = True
      Size = 50
    end
    object wwTable1DispColor: TStringField
      FieldKind = fkCalculated
      FieldName = 'DispColor'
      Calculated = True
    end
  end
  object ColorDialog1: TColorDialog
    Options = [cdAnyColor]
    Left = 64
    Top = 139
  end
end
