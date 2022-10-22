object FrmInvRelieveParams: TFrmInvRelieveParams
  Left = 0
  Top = 0
  ClientHeight = 291
  ClientWidth = 332
  Caption = 'Parameters'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 332
    Height = 291
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 115
    IQComponents.Grid.Height = 205
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
    IQComponents.HiddenPanel.Left = 115
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 205
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitHeight = 175
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitHeight = 204
    DataSource = DataSource1
    Columns = <
      item
        FieldName = 'KIND'
        Title.Caption = 'Kind'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SOURCE_NAME'
        Title.Caption = 'Name'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'RELIEVE_TO_PARENT_METHOD'
        Title.Caption = 'Relieve Inventory To ...'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    ExplicitTop = 30
    ExplicitHeight = 261
    Marker = 0
  end
  object wwDBComboBox1: TUniDBComboBox
    Left = 184
    Top = 56
    Width = 121
    Height = 21
    Hint = ''
    Style = csDropDownList
    Items.Strings = (
      'Work Order'#9'W'
      'Sales Order'#9'O'
      'Work Center'#9'C'
      'Parent Serial #'#9'S')
    TabOrder = 1
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 32
    Top = 192
  end
  object Query1: TFDQuery
    AfterPost = ApplyUpdates
    AfterDelete = ApplyUpdates
    CachedUpdates = True
    OnUpdateRecord = Query1UpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select source_name,'
      '       source_table,'
      '       source_id,'
      
        '       decode( source_table, '#39'PARAMS'#39', '#39'System'#39', '#39'EPlant'#39') as ki' +
        'nd,'
      '       relieve_to_parent_method'
      '  from v_relieve_to_parent_params '
      ' where source_id = 0'
      '       or'
      '       misc.eplant_filter( source_id ) = 1'
      ' order by decode( source_table, '#39'PARAMS'#39', 1, 2),'
      '       source_name')
    Left = 32
    Top = 211
    object Query1SOURCE_NAME: TStringField
      DisplayLabel = 'Domain Name'
      DisplayWidth = 18
      FieldName = 'SOURCE_NAME'
      ReadOnly = True
      Size = 30
    end
    object Query1KIND: TStringField
      DisplayLabel = 'Kind'
      DisplayWidth = 8
      FieldName = 'KIND'
      ReadOnly = True
      Size = 6
    end
    object Query1RELIEVE_TO_PARENT_METHOD: TStringField
      DisplayLabel = 'Relieve Inventory To ...'
      DisplayWidth = 21
      FieldName = 'RELIEVE_TO_PARENT_METHOD'
      Size = 1
    end
    object Query1SOURCE_TABLE: TStringField
      DisplayWidth = 6
      FieldName = 'SOURCE_TABLE'
      ReadOnly = True
      Visible = False
      FixedChar = True
      Size = 6
    end
    object Query1SOURCE_ID: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'SOURCE_ID'
      ProviderFlags = []
      Precision = 38
      Size = 38
    end
  end
end
