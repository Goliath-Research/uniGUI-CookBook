object FrmSalesConfigAttributes: TFrmSalesConfigAttributes
  Left = 0
  Top = 0
  ClientHeight = 327
  ClientWidth = 535
  Caption = 'Sales Option Attribute'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 535
    Height = 327
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 318
    IQComponents.Grid.Height = 241
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcSalesAttribute
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
    IQComponents.Navigator.DataSource = SrcSalesAttribute
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 318
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 241
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitHeight = 213
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitHeight = 242
    DataSource = SrcSalesAttribute
    Columns = <
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'UOM'
        Title.Caption = 'UOM'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TYPE'
        Title.Caption = 'Attribute Type'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    ExplicitTop = 28
    ExplicitHeight = 299
    Marker = 0
    object wwDBLookupComboUOM: TUniDBLookupComboBox
      Left = 164
      Top = 72
      Width = 121
      Height = 21
      Hint = ''
      Visible = False
      ListOnlyMode = lmFollowSource
      ListField = 'UOM'
      ListSource = SrcArinvtUom
      KeyField = 'UOM'
      ListFieldIndex = 0
      TabOrder = 2
      Color = clWindow
    end
    object wwDBComboBoxType: TUniDBComboBox
      Left = 320
      Top = 72
      Width = 121
      Height = 21
      Hint = ''
      Visible = False
      Items.Strings = (
        'Length'#9'L'
        'Width'#9'W'
        'Gauge'#9'G'
        'Thickness'#9'T'
        'Height'#9'H')
      TabOrder = 3
    end
  end
  object SrcSalesAttribute: TDataSource
    DataSet = QrySalesAttribute
    Left = 96
    Top = 96
  end
  object QrySalesAttribute: TFDQuery
    BeforePost = QrySalesAttributeBeforePost
    OnNewRecord = QrySalesAttributeNewRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       descrip,'
      '       uom,'
      '       type'
      '  from sales_attribute'
      '         '
      '')
    Left = 80
    Top = 148
    object QrySalesAttributeDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 60
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Required = True
      Size = 60
    end
    object QrySalesAttributeUOM: TStringField
      DisplayWidth = 10
      FieldName = 'UOM'
      Origin = 'UOM'
      Size = 10
    end
    object QrySalesAttributeID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QrySalesAttributeTYPE: TStringField
      DisplayLabel = 'Attribute Type'
      FieldName = 'TYPE'
      Origin = '"TYPE"'
      Size = 1
    end
  end
  object QryArinvtUom: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       uom'
      '  from arinvt_uom       '
      ' order by seq, '
      '          uom')
    Left = 188
    Top = 140
    object QryArinvtUomUOM: TStringField
      DisplayWidth = 10
      FieldName = 'UOM'
      Origin = 'UOM'
      Size = 10
    end
    object QryArinvtUomID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object SrcArinvtUom: TDataSource
    DataSet = QryArinvtUom
    Left = 208
    Top = 112
  end
end
