object FrmSalesConfigChoiceAttributes: TFrmSalesConfigChoiceAttributes
  Left = 0
  Top = 0
  ClientHeight = 305
  ClientWidth = 585
  Caption = 'Choice Attribute High and Low Ranges '
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 585
    Height = 305
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 368
    IQComponents.Grid.Height = 219
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcSAlesChoiceAttribute
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
    IQComponents.Navigator.DataSource = SrcSAlesChoiceAttribute
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 368
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 219
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitHeight = 191
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitHeight = 220
    DataSource = SrcSAlesChoiceAttribute
    Columns = <
      item
        FieldName = 'SEQ'
        Title.Caption = 'Seq #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Attribute Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'RANGE_START'
        Title.Caption = 'Low'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'RANGE_END'
        Title.Caption = 'High'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'UOM'
        Title.Caption = 'UOM'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    ExplicitTop = 28
    ExplicitHeight = 277
    Marker = 0
  end
  object SrcSAlesChoiceAttribute: TDataSource
    DataSet = QrySalesChoiceAttribute
    Left = 56
    Top = 128
  end
  object QrySalesChoiceAttribute: TFDQuery
    BeforeOpen = QrySalesChoiceAttributeBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    SQL.Strings = (
      'select a.id,'
      '       a.sales_option_choice_id,'
      '       a.sales_attribute_id,'
      '       a.seq,'
      '       b.descrip,'
      '       a.range_start,'
      '       a.range_end,'
      '       b.uom'
      '  from sales_choice_attribute a,'
      '       sales_attribute b'
      ' where a.sales_option_choice_id = :sales_option_choice_id'
      '   and a.sales_attribute_id = b.id'
      '  order by'
      '       a.seq'
      '')
    Left = 56
    Top = 160
    ParamData = <
      item
        Name = 'SALES_OPTION_CHOICE_ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QrySalesChoiceAttributeSEQ: TBCDField
      DisplayLabel = 'Seq #'
      DisplayWidth = 6
      FieldName = 'SEQ'
      Origin = 'SEQ'
      ReadOnly = True
      Precision = 5
      Size = 0
    end
    object QrySalesChoiceAttributeDESCRIP: TStringField
      DisplayLabel = 'Attribute Description'
      DisplayWidth = 41
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      ReadOnly = True
      Required = True
      Size = 60
    end
    object QrySalesChoiceAttributeRANGE_START: TFMTBCDField
      DisplayLabel = 'Low'
      DisplayWidth = 16
      FieldName = 'RANGE_START'
      Origin = 'RANGE_START'
      Precision = 15
      Size = 6
    end
    object QrySalesChoiceAttributeRANGE_END: TFMTBCDField
      DisplayLabel = 'High'
      DisplayWidth = 16
      FieldName = 'RANGE_END'
      Origin = 'RANGE_END'
      Precision = 15
      Size = 6
    end
    object QrySalesChoiceAttributeUOM: TStringField
      DisplayWidth = 10
      FieldName = 'UOM'
      Origin = 'UOM'
      ReadOnly = True
      Size = 10
    end
    object QrySalesChoiceAttributeID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QrySalesChoiceAttributeSALES_OPTION_CHOICE_ID: TBCDField
      FieldName = 'SALES_OPTION_CHOICE_ID'
      Origin = 'SALES_OPTION_CHOICE_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QrySalesChoiceAttributeSALES_ATTRIBUTE_ID: TBCDField
      FieldName = 'SALES_ATTRIBUTE_ID'
      Origin = 'SALES_ATTRIBUTE_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'AssignDefaultAttributes1')
    SecurityCode = 'FRMSALESCONFIGCHOICEATTRIBUTES'
    Left = 96
    Top = 128
  end
  object PopupMenu1: TUniPopupMenu
    Left = 132
    Top = 128
    object AssignDefaultAttributes1: TUniMenuItem
      Caption = 'Assign Default Attributes'
      OnClick = AssignDefaultAttributes1Click
    end
  end
end
