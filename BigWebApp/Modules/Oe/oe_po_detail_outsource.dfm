object FrmOE_PO_Detail_Outsource: TFrmOE_PO_Detail_Outsource
  Left = 0
  Top = 0
  ClientHeight = 337
  ClientWidth = 649
  Caption = 'Outsource Info'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 649
    Height = 337
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 432
    IQComponents.Grid.Height = 251
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
    IQComponents.HiddenPanel.Left = 432
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 251
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitHeight = 223
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitHeight = 252
    DataSource = DataSource1
    Columns = <
      item
        FieldName = 'PONO'
        Title.Caption = 'PO#'
        Width = 112
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SOURCE'
        Title.Caption = 'Origin'
        Width = 77
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'QUAN'
        Title.Caption = 'Qty'
        Width = 119
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'IN_TRANSIT_QUAN'
        Title.Caption = 'In-Transit Allocated'
        Width = 119
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PROMISE_DATE'
        Title.Caption = 'Date'
        Width = 98
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ITEMNO'
        Title.Caption = 'Item #'
        Width = 161
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 210
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REV'
        Title.Caption = 'Rev'
        Width = 42
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CLASS'
        Title.Caption = 'Class'
        Width = 49
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP2'
        Title.Caption = 'Ext Description'
        Width = 210
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ORDERNO'
        Title.Caption = 'Ship Order #'
        Width = 105
        CheckBoxField.FieldValues = 'true;false'
      end>
    TabsVisible = True
    ExplicitTop = 28
    ExplicitHeight = 309
    Marker = 0
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 44
    Top = 116
  end
  object FDQuery1: TFDQuery
    BeforeOpen = FDQuery1BeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select pdo.id,'
      '       pdo.po_detail_id,'
      '       pdo.source,'
      '       pdo.arcusto_id,'
      '       pdo.vendor_id,'
      '       pdo.arinvt_id,  /* consumed */'
      '       pdo.partno_id,'
      '       pdo.quan,'
      '       pdo.in_transit_quan,'
      '       pdo.promise_date,'
      '       po.pono,'
      '       po.id as po_id,'
      '       a.id as parent_arinvt_id,'
      '       a.itemno,'
      '       a.descrip,'
      '       a.descrip2,'
      '       a.rev,'
      '       a.class,'
      '       o.orderno'
      '  from '
      '       po_detail_outsource pdo,'
      '       po_detail d,'
      '       po,'
      '       partno,'
      '       arinvt a,'
      '       ord_detail od,'
      '       orders o'
      ' where '
      '       pdo.ord_detail_id = :ord_detail_id'
      '   and pdo.po_detail_id = d.id(+)'
      '   and d.po_id = po.id(+)'
      '   and pdo.ord_detail_id = od.id'
      '   and od.orders_id = o.id'
      ''
      '   and pdo.partno_id = partno.id(+)'
      '   and partno.arinvt_id = a.id(+)'
      '   ')
    Left = 44
    Top = 148
    ParamData = <
      item
        Name = 'ORD_DETAIL_ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object FDQuery1PONO: TStringField
      DisplayLabel = 'PO#'
      DisplayWidth = 16
      FieldName = 'PONO'
      Origin = 'PONO'
      Size = 35
    end
    object FDQuery1SOURCE: TStringField
      DisplayLabel = 'Origin'
      DisplayWidth = 11
      FieldName = 'SOURCE'
      Origin = 'SOURCE'
    end
    object FDQuery1QUAN: TFMTBCDField
      DisplayLabel = 'Qty'
      DisplayWidth = 16
      FieldName = 'QUAN'
      Origin = 'QUAN'
      Precision = 15
      Size = 6
    end
    object FDQuery1IN_TRANSIT_QUAN: TFMTBCDField
      DisplayLabel = 'In-Transit Allocated'
      DisplayWidth = 16
      FieldName = 'IN_TRANSIT_QUAN'
      Origin = 'IN_TRANSIT_QUAN'
      Precision = 15
      Size = 6
    end
    object FDQuery1PROMISE_DATE: TDateTimeField
      DisplayLabel = 'Date'
      DisplayWidth = 14
      FieldName = 'PROMISE_DATE'
      Origin = 'PROMISE_DATE'
    end
    object FDQuery1ITEMNO: TStringField
      DisplayLabel = 'Parent Item #'
      DisplayWidth = 23
      FieldName = 'ITEMNO'
      Origin = 'ITEMNO'
      FixedChar = True
      Size = 50
    end
    object FDQuery1DESCRIP: TStringField
      DisplayLabel = 'Parent Item Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 100
    end
    object FDQuery1REV: TStringField
      DisplayLabel = 'Parent Item Rev'
      DisplayWidth = 15
      FieldName = 'REV'
      Origin = 'REV'
      FixedChar = True
      Size = 15
    end
    object FDQuery1CLASS: TStringField
      DisplayLabel = 'Parent Item Class'
      DisplayWidth = 14
      FieldName = 'CLASS'
      Origin = 'CLASS'
      FixedChar = True
      Size = 2
    end
    object FDQuery1DESCRIP2: TStringField
      DisplayLabel = 'Parent Ext Item Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP2'
      Origin = 'DESCRIP2'
      Size = 100
    end
    object FDQuery1ID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object FDQuery1PO_DETAIL_ID: TBCDField
      FieldName = 'PO_DETAIL_ID'
      Origin = 'PO_DETAIL_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object FDQuery1ARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Origin = 'ARCUSTO_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object FDQuery1VENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Origin = 'VENDOR_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object FDQuery1ARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Origin = 'ARINVT_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object FDQuery1PARTNO_ID: TBCDField
      FieldName = 'PARTNO_ID'
      Origin = 'PARTNO_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object FDQuery1PO_ID: TBCDField
      FieldName = 'PO_ID'
      Origin = 'PO_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object FDQuery1PARENT_ARINVT_ID: TBCDField
      FieldName = 'PARENT_ARINVT_ID'
      Origin = 'PARENT_ARINVT_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object FDQuery1ORDERNO: TStringField
      DisplayLabel = 'Ship Order #'
      FieldName = 'ORDERNO'
      Origin = 'ORDERNO'
      Size = 15
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 128
    Top = 116
    object JumpToParentItem1: TUniMenuItem
      Caption = 'Jump To Parent Item'
      OnClick = JumpToParentItem1Click
    end
    object JumpToPO1: TUniMenuItem
      Caption = 'Jump To PO'
      OnClick = JumpToPO1Click
    end
  end
  object IQJumpInv: TIQWebJump
    DataField = 'PARENT_ARINVT_ID'
    DataSource = DataSource1
    JumpTo = jtInventory
    Left = 128
    Top = 148
  end
  object IQJumpPO: TIQWebJump
    DataField = 'PO_DETAIL_ID'
    DataSource = DataSource1
    JumpTo = jtPO
    Left = 128
    Top = 176
  end
  object FDQueryByArinvt: TFDQuery
    BeforeOpen = FDQueryByArinvtBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select pdo.id,'
      '       pdo.po_detail_id,'
      '       pdo.source,'
      '       pdo.arcusto_id,'
      '       pdo.vendor_id,'
      '       pdo.arinvt_id,  /* consumed */'
      '       pdo.partno_id,'
      '       pdo.quan,'
      '       pdo.in_transit_quan,'
      '       pdo.promise_date,'
      '       po.pono,'
      '       po.id as po_id,'
      '       a.id as parent_arinvt_id,'
      '       a.itemno,'
      '       a.descrip,'
      '       a.descrip2,'
      '       a.rev,'
      '       a.class,'
      '       o.orderno'
      '       '
      '  from '
      '       po_detail_outsource pdo,'
      '       po_detail d,'
      '       po,'
      '       partno,'
      '       arinvt a,'
      '       ord_detail od,'
      '       orders o'
      ' where '
      '       pdo.arinvt_id = :arinvt_id'
      '   and pdo.po_detail_id = d.id(+)'
      '   and d.po_id = po.id(+)'
      '   and pdo.ord_detail_id = od.id'
      '   and od.orders_id = o.id'
      '                '
      '   and pdo.partno_id = partno.id(+)'
      '   and partno.arinvt_id = a.id(+)'
      '   ')
    Left = 76
    Top = 148
    ParamData = <
      item
        Name = 'ARINVT_ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object FDQueryByArinvtPONO: TStringField
      DisplayLabel = 'PO#'
      DisplayWidth = 16
      FieldName = 'PONO'
      Origin = 'PONO'
      Size = 35
    end
    object FDQueryByArinvtSOURCE: TStringField
      DisplayLabel = 'Origin'
      DisplayWidth = 11
      FieldName = 'SOURCE'
      Origin = 'SOURCE'
    end
    object FDQueryByArinvtQUAN: TFMTBCDField
      DisplayLabel = 'Qty'
      DisplayWidth = 16
      FieldName = 'QUAN'
      Origin = 'QUAN'
      Precision = 15
      Size = 6
    end
    object FDQueryByArinvtIN_TRANSIT_QUAN: TFMTBCDField
      DisplayLabel = 'In-Transit Allocated'
      DisplayWidth = 16
      FieldName = 'IN_TRANSIT_QUAN'
      Origin = 'IN_TRANSIT_QUAN'
      Precision = 15
      Size = 6
    end
    object FDQueryByArinvtPROMISE_DATE: TDateTimeField
      DisplayLabel = 'Date'
      DisplayWidth = 14
      FieldName = 'PROMISE_DATE'
      Origin = 'PROMISE_DATE'
    end
    object FDQueryByArinvtITEMNO: TStringField
      DisplayLabel = 'Parent Item #'
      DisplayWidth = 23
      FieldName = 'ITEMNO'
      Origin = 'ITEMNO'
      FixedChar = True
      Size = 50
    end
    object FDQueryByArinvtDESCRIP: TStringField
      DisplayLabel = 'Parent Item Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 100
    end
    object FDQueryByArinvtREV: TStringField
      DisplayLabel = 'Parent Item Rev'
      DisplayWidth = 15
      FieldName = 'REV'
      Origin = 'REV'
      FixedChar = True
      Size = 15
    end
    object FDQueryByArinvtCLASS: TStringField
      DisplayLabel = 'Parent Item Class'
      DisplayWidth = 14
      FieldName = 'CLASS'
      Origin = 'CLASS'
      FixedChar = True
      Size = 2
    end
    object FDQueryByArinvtDESCRIP2: TStringField
      DisplayLabel = 'Parent Ext Item Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP2'
      Origin = 'DESCRIP2'
      Size = 100
    end
    object FDQueryByArinvtID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object FDQueryByArinvtPO_DETAIL_ID: TBCDField
      FieldName = 'PO_DETAIL_ID'
      Origin = 'PO_DETAIL_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object FDQueryByArinvtARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Origin = 'ARCUSTO_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object FDQueryByArinvtVENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Origin = 'VENDOR_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object FDQueryByArinvtARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Origin = 'ARINVT_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object FDQueryByArinvtPARTNO_ID: TBCDField
      FieldName = 'PARTNO_ID'
      Origin = 'PARTNO_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object FDQueryByArinvtPO_ID: TBCDField
      FieldName = 'PO_ID'
      Origin = 'PO_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object FDQueryByArinvtPARENT_ARINVT_ID: TBCDField
      FieldName = 'PARENT_ARINVT_ID'
      Origin = 'PARENT_ARINVT_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object FDQueryByArinvtORDERNO: TStringField
      DisplayLabel = 'Ship Order #'
      FieldName = 'ORDERNO'
      Origin = 'ORDERNO'
      Size = 15
    end
  end
end
