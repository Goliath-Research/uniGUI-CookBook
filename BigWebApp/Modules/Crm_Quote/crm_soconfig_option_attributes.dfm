object FrmSalesConfigOptionAttributes: TFrmSalesConfigOptionAttributes
  Left = 0
  Top = 0
  ClientHeight = 344
  ClientWidth = 437
  Caption = 'Sales Option Attributes'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 437
    Height = 28
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnAttributes: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Sales Attributes'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDFFFFFFFFFFDDDDD00000000
        00DDDDDD7777777777FDDDDD0FFFFFFFF0DDDDDD7FDDDDDDD7FDDDDD0FFFFFFF
        F0DDDDDD7FDDDDDDD7FDDDDD0FF80FFFF0DDDDDD7FD87FDDD7FDDDDD0F800FFF
        F0DDDDDD7F877FDDD7FDDDDD080B0FFFF0DDDDDD787F7DDDD7FDDDDD00B0FFFF
        F0DDDDDD77F7DDDDD7FDDDDD0B0FFFFFF0DDDDDD7F7DDDDDD7FDDDD0B0FFFFFF
        F0DDDDD7F7DDDDDDD7FDDD0B0FFFFFFFF0DDDD7F7FDDDDDDD7FDD0B07FFFFFFF
        F0DDD7F77FFFFFFFF7FDD90D0000000000DDD77D7777777777DDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnAttributesClick
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 28
    Width = 437
    Height = 316
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object wwDBGrid1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 435
      Height = 314
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 218
      IQComponents.Grid.Height = 228
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcSalesOptionAttributes
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
      IQComponents.Navigator.DataSource = SrcSalesOptionAttributes
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 218
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 228
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcSalesOptionAttributes
      Columns = <
        item
          FieldName = 'SEQ'
          Title.Caption = 'Seq #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SalesAttribute'
          Title.Caption = 'Attribute Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
    object wwDBComboDlgAttribute: TUniEdit
      Left = 100
      Top = 64
      Width = 121
      Height = 21
      Hint = ''
      Visible = False
      Text = ''
      TabOrder = 1
    end
  end
  object SrcSalesOptionAttributes: TDataSource
    DataSet = QrySalesOptionAttributes
    Left = 52
    Top = 252
  end
  object QrySalesOptionAttributes: TFDQuery
    Active = True
    BeforeOpen = QrySalesOptionAttributesBeforeOpen
    BeforePost = QrySalesOptionAttributesBeforePost
    OnCalcFields = QrySalesOptionAttributesCalcFields
    OnNewRecord = QrySalesOptionAttributesNewRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       sales_option_id, '
      '       sales_attribute_id,'
      '       seq   '
      '  from sales_option_attribute'
      ' where sales_option_id = :sales_option_id        '
      ' order by seq')
    Left = 44
    Top = 193
    ParamData = <
      item
        Name = 'SALES_OPTION_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 72
      end>
    object QrySalesOptionAttributesSEQ: TBCDField
      DisplayLabel = 'Seq #'
      DisplayWidth = 6
      FieldName = 'SEQ'
      Origin = 'SEQ'
      Precision = 5
      Size = 0
    end
    object QrySalesOptionAttributesSalesAttribute: TStringField
      DisplayLabel = 'Attribute Description'
      DisplayWidth = 60
      FieldKind = fkCalculated
      FieldName = 'SalesAttribute'
      Size = 60
      Calculated = True
    end
    object QrySalesOptionAttributesID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QrySalesOptionAttributesSALES_OPTION_ID: TBCDField
      FieldName = 'SALES_OPTION_ID'
      Origin = 'SALES_OPTION_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QrySalesOptionAttributesSALES_ATTRIBUTE_ID: TBCDField
      DisplayLabel = 'Attribute Description'
      FieldName = 'SALES_ATTRIBUTE_ID'
      Origin = 'SALES_ATTRIBUTE_ID'
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object PkAttribute: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       descrip,'
      '       uom   '
      '  from sales_attribute')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 132
    Top = 192
    object PkAttributeID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      Visible = False
      Size = 0
    end
    object PkAttributeDESCRIP: TStringField
      DisplayLabel = 'Attribute'
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 60
    end
    object PkAttributeUOM: TStringField
      FieldName = 'UOM'
      Origin = 'UOM'
      Size = 10
    end
  end
end
