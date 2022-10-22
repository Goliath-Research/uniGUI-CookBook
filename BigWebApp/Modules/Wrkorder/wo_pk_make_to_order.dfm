object FrmWO_PickMakeToOrder: TFrmWO_PickMakeToOrder
  Left = 313
  Top = 315
  ClientHeight = 253
  ClientWidth = 517
  Caption = 'Pick Make To Order'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 517
    Height = 212
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 300
    IQComponents.Grid.Height = 126
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
    IQComponents.HiddenPanel.Left = 300
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 126
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
        FieldName = 'ORDERNO'
        Title.Caption = 'Order #'
        Width = 105
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CUSTNO'
        Title.Caption = 'Customer #'
        Width = 77
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ORD_DET_SEQNO'
        Title.Caption = 'Line #'
        Width = 42
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ITEMNO'
        Title.Caption = 'Item #'
        Width = 175
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SHIP_QUAN'
        Title.Caption = 'Qty'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 245
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 212
    Width = 517
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel2: TUniPanel
      Left = 294
      Top = 1
      Width = 222
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 8
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 112
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object wwQuery1: TFDQuery
    BeforeOpen = wwQuery1BeforeOpen
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select o.orderno,'
      '       arcusto.custno,'
      '       d.ord_det_seqno,'
      '       a.itemno,'
      '       a.descrip,'
      '       v.ord_detail_id,'
      '       sum(v.ship_quan) as ship_quan'
      ''
      
        '  from v_backlog_releases v, arinvt a, arcusto, orders o, ord_de' +
        'tail d'
      ' where v.order_id = o.id'
      '   and v.ord_detail_id = d.id'
      ' '
      '  and v.arinvt_id = a.id'
      '   and v.onhold = '#39'N'#39' '
      '   and decode( a.id, 0, '#39'N'#39', NVL(a.non_material, '#39'N'#39')) = '#39'N'#39' '
      ''
      '   and v.arcusto_id = arcusto.id(+) '
      '   and (NVL(arcusto.is_intercomp, '#39'N'#39') <> '#39'Y'#39' '
      '        or '
      '        NVL(v.type, '#39'*'#39') = '#39'AUTO-MRP'#39' ) '
      '   and  arcusto.vendor_id_outsource is NULL '
      ''
      '   and v.is_make_to_order = '#39'Y'#39
      ''
      '   and v.arinvt_id in (select partno.arinvt_id'
      '                         from ptorder, partno'
      
        '                        where ptorder.workorder_id = :workorder_' +
        'id'
      '                          and ptorder.partno_id = partno.id)'
      ' group by '
      '       o.orderno,'
      '       arcusto.custno,'
      '       d.ord_det_seqno,'
      '       a.itemno,'
      '       a.descrip,'
      '       v.ord_detail_id '
      ' ')
    Left = 119
    Top = 77
    ParamData = <
      item
        Name = 'workorder_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object wwQuery1ORDERNO: TStringField
      DisplayLabel = 'Order #'
      DisplayWidth = 15
      FieldName = 'ORDERNO'
      Origin = 'o.orderno'
      Size = 15
    end
    object wwQuery1CUSTNO: TStringField
      DisplayLabel = 'Customer #'
      DisplayWidth = 11
      FieldName = 'CUSTNO'
      Origin = 'arcusto.custno'
      FixedChar = True
      Size = 10
    end
    object wwQuery1ORD_DET_SEQNO: TBCDField
      DisplayLabel = 'Line #'
      DisplayWidth = 6
      FieldName = 'ORD_DET_SEQNO'
      Origin = 'd.ord_det_seqno'
      Size = 0
    end
    object wwQuery1ITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 'a.itemno'
      FixedChar = True
      Size = 50
    end
    object wwQuery1SHIP_QUAN: TFMTBCDField
      DisplayLabel = 'Qty'
      DisplayWidth = 10
      FieldName = 'SHIP_QUAN'
      Origin = 'sum(v.ship_quan)'
      Size = 38
    end
    object wwQuery1DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Origin = 'a.descrip'
      Size = 100
    end
    object wwQuery1ORD_DETAIL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ORD_DETAIL_ID'
      Visible = False
      Size = 0
    end
  end
  object wwDataSource1: TDataSource
    DataSet = wwQuery1
    OnDataChange = wwDataSource1DataChange
    Left = 120
    Top = 143
  end
end
