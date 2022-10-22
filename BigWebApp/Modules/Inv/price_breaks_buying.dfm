object FrmPriceBreaksBuying: TFrmPriceBreaksBuying
  Left = 0
  Top = 0
  ClientHeight = 408
  ClientWidth = 695
  Caption = 'Price Breaks'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 165
    Width = 695
    Height = 4
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 695
    Height = 165
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object Panel28: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 693
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      TabOrder = 0
      Alignment = taLeftJustify
      Caption = ' Price Breaks (Inventory)'
    end
    object GridInventoryBreaks: TIQUniGridControl
      Left = 1
      Top = 27
      Width = 693
      Height = 138
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 476
      IQComponents.Grid.Height = 52
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcArinvtBreaks
      IQComponents.Grid.LoadMask.Message = 'Loading data...'
      IQComponents.Grid.Align = alClient
      IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
      IQComponents.Grid.TabOrder = 0
      IQComponents.Navigator.Left = 410
      IQComponents.Navigator.Top = 0
      IQComponents.Navigator.Width = 100
      IQComponents.Navigator.Height = 25
      IQComponents.Navigator.Hint = ''
      IQComponents.Navigator.ShowHint = True
      IQComponents.Navigator.DataSource = SrcArinvtBreaks
      IQComponents.Navigator.VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 476
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 52
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcArinvtBreaks
      Columns = <
        item
          FieldName = 'QUAN'
          Title.Caption = 'Qty'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'QPRICE'
          Title.Caption = 'Price'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PRICE_DATE'
          Title.Caption = 'Price Date'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EFFECT_DATE'
          Title.Caption = 'Effective Date'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DEACTIVE_DATE'
          Title.Caption = 'Inactive Date'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'COMMENT1'
          Title.Caption = 'Comment'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 169
    Width = 695
    Height = 239
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter2: TUniSplitter
      Left = 193
      Top = 27
      Width = 6
      Height = 212
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object Panel3: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 693
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      TabOrder = 0
      Alignment = taLeftJustify
      Caption = ' Price Breaks (AKA)'
    end
    object Panel4: TUniPanel
      Left = 1
      Top = 27
      Width = 193
      Height = 212
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 1
      Caption = ''
      object GridArinvtVendor: TIQUniGridControl
        Left = 1
        Top = 1
        Width = 191
        Height = 210
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 434
        IQComponents.Grid.Height = 124
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcArinvtVendors
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
        IQComponents.Navigator.DataSource = SrcArinvtVendors
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = -26
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 124
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcArinvtVendors
        Columns = <
          item
            FieldName = 'VEND_ITEMNO'
            Title.Caption = 'AKA Item #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'VEND_DESCRIP'
            Title.Caption = 'AKA Item Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
    end
    object Panel5: TUniPanel
      Left = 199
      Top = 27
      Width = 496
      Height = 212
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      Caption = ''
      object GridArinvtVendorBreaks: TIQUniGridControl
        Left = 1
        Top = 1
        Width = 494
        Height = 210
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 277
        IQComponents.Grid.Height = 124
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcArinvtVendorBreaks
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
        IQComponents.Navigator.DataSource = SrcArinvtVendorBreaks
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 277
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 124
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcArinvtVendorBreaks
        Columns = <
          item
            FieldName = 'QUAN'
            Title.Caption = 'Qty'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'QPRICE'
            Title.Caption = 'Price'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PRICE_DATE'
            Title.Caption = 'Price Date'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'EFFECT_DATE'
            Title.Caption = 'Effective Date'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DEACTIVE_DATE'
            Title.Caption = 'Inactive Date'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'COMMENT1'
            Title.Caption = 'Comment'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
    end
  end
  object QryArinvtBreaks: TFDQuery
    BeforeOpen = AssignParams
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       arinvt_id,'
      '       quan,'
      '       qprice,'
      '       price_date,'
      '       effect_date,'
      '       deactive_date,'
      '       comment1'
      '  from arinvt_breaks'
      ' where arinvt_id = :arinvt_id'
      '   and buying = '#39'Y'#39
      ' order by '
      '       effect_date, '
      '       quan  '
      ''
      '')
    Left = 44
    Top = 88
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryArinvtBreaksID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.ARINVT_BREAKS.ID'
      Size = 0
    end
    object QryArinvtBreaksARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Origin = 'IQ.ARINVT_BREAKS.ARINVT_ID'
      Size = 0
    end
    object QryArinvtBreaksQUAN: TBCDField
      FieldName = 'QUAN'
      Origin = 'IQ.ARINVT_BREAKS.QUAN'
      Size = 2
    end
    object QryArinvtBreaksQPRICE: TFMTBCDField
      FieldName = 'QPRICE'
      Origin = 'IQ.ARINVT_BREAKS.QPRICE'
      Size = 6
    end
    object QryArinvtBreaksPRICE_DATE: TDateTimeField
      FieldName = 'PRICE_DATE'
      Origin = 'IQ.ARINVT_BREAKS.PRICE_DATE'
    end
    object QryArinvtBreaksEFFECT_DATE: TDateTimeField
      FieldName = 'EFFECT_DATE'
      Origin = 'IQ.ARINVT_BREAKS.EFFECT_DATE'
    end
    object QryArinvtBreaksDEACTIVE_DATE: TDateTimeField
      FieldName = 'DEACTIVE_DATE'
      Origin = 'IQ.ARINVT_BREAKS.DEACTIVE_DATE'
    end
    object QryArinvtBreaksCOMMENT1: TStringField
      FieldName = 'COMMENT1'
      Origin = 'IQ.ARINVT_BREAKS.COMMENT1'
      Size = 255
    end
  end
  object SrcArinvtBreaks: TDataSource
    DataSet = QryArinvtBreaks
    Left = 44
    Top = 60
  end
  object SrcArinvtVendors: TDataSource
    DataSet = QryArinvtVendors
    Left = 20
    Top = 228
  end
  object QryArinvtVendors: TFDQuery
    BeforeOpen = AssignParams
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       vend_itemno,'
      '       vend_descrip'
      '  from arinvt_vendors'
      ' where vendor_id = :vendor_id'
      '   and arinvt_id = :arinvt_id'
      ' order by seq')
    Left = 20
    Top = 256
    ParamData = <
      item
        Name = 'vendor_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryArinvtVendorsVEND_ITEMNO: TStringField
      DisplayLabel = 'AKA Item #'
      DisplayWidth = 25
      FieldName = 'VEND_ITEMNO'
      Origin = 'IQ.ARINVT_VENDORS.VEND_ITEMNO'
      Size = 25
    end
    object QryArinvtVendorsVEND_DESCRIP: TStringField
      DisplayLabel = 'AKA Item Description'
      DisplayWidth = 35
      FieldName = 'VEND_DESCRIP'
      Origin = 'IQ.ARINVT_VENDORS.VEND_DESCRIP'
      Size = 35
    end
    object QryArinvtVendorsID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.ARINVT_VENDORS.ID'
      Visible = False
      Size = 0
    end
  end
  object SrcArinvtVendorBreaks: TDataSource
    DataSet = QryArinvtVendorBreaks
    Left = 208
    Top = 236
  end
  object QryArinvtVendorBreaks: TFDQuery
    MasterSource = SrcArinvtVendors
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       arinvt_vendors_id,'
      '       quan,'
      '       qprice,'
      '       price_date,'
      '       effect_date,'
      '       deactive_date,'
      '       comment1'
      '  from arinvt_vendors_breaks'
      ' where arinvt_vendors_id = :id'
      ' order by effect_date, quan'
      ''
      ''
      '')
    Left = 208
    Top = 264
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryArinvtVendorBreaksQUAN: TBCDField
      DisplayLabel = 'Qty'
      DisplayWidth = 10
      FieldName = 'QUAN'
      Origin = 'IQ.ARINVT_VENDORS_BREAKS.QUAN'
      Size = 2
    end
    object QryArinvtVendorBreaksQPRICE: TFMTBCDField
      DisplayLabel = 'Price'
      DisplayWidth = 10
      FieldName = 'QPRICE'
      Origin = 'IQ.ARINVT_VENDORS_BREAKS.QPRICE'
      Size = 6
    end
    object QryArinvtVendorBreaksPRICE_DATE: TDateTimeField
      DisplayLabel = 'Price Date'
      DisplayWidth = 18
      FieldName = 'PRICE_DATE'
      Origin = 'IQ.ARINVT_VENDORS_BREAKS.PRICE_DATE'
    end
    object QryArinvtVendorBreaksEFFECT_DATE: TDateTimeField
      DisplayLabel = 'Effective Date'
      DisplayWidth = 18
      FieldName = 'EFFECT_DATE'
      Origin = 'IQ.ARINVT_VENDORS_BREAKS.EFFECT_DATE'
    end
    object QryArinvtVendorBreaksDEACTIVE_DATE: TDateTimeField
      DisplayLabel = 'Inactive Date'
      DisplayWidth = 18
      FieldName = 'DEACTIVE_DATE'
      Origin = 'IQ.ARINVT_VENDORS_BREAKS.DEACTIVE_DATE'
    end
    object QryArinvtVendorBreaksCOMMENT1: TStringField
      DisplayLabel = 'Comment'
      DisplayWidth = 50
      FieldName = 'COMMENT1'
      Origin = 'IQ.ARINVT_VENDORS_BREAKS.COMMENT1'
      Size = 255
    end
    object QryArinvtVendorBreaksID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.ARINVT_VENDORS_BREAKS.ID'
      Visible = False
      Size = 0
    end
    object QryArinvtVendorBreaksARINVT_VENDORS_ID: TBCDField
      FieldName = 'ARINVT_VENDORS_ID'
      Origin = 'IQ.ARINVT_VENDORS_BREAKS.ARINVT_VENDORS_ID'
      Visible = False
      Size = 0
    end
  end
end
