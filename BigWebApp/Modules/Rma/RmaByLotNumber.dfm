object FrmRmaByLotNumber: TFrmRmaByLotNumber
  Left = 0
  Top = 0
  ClientHeight = 392
  ClientWidth = 830
  Caption = 'Search By Lot #'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  Font.Height = -14
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object Panel1: TUniPanel
    Left = 0
    Top = 340
    Width = 830
    Height = 52
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 557
      Top = 1
      Width = 273
      Height = 50
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnCancel: TUniButton
        Left = 131
        Top = 10
        Width = 127
        Height = 33
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Cancel'
        TabOrder = 1
        OnClick = BtnCancelClick
      end
      object BtnSelect: TUniButton
        Left = 1
        Top = 10
        Width = 127
        Height = 33
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Select'
        TabOrder = 2
        OnClick = BtnSelectClick
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 830
    Height = 52
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      830
      52)
    object Label1: TUniLabel
      Left = 9
      Top = 17
      Width = 34
      Height = 17
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Lot #'
      TabOrder = 2
    end
    object sbtnSearch: TUniSpeedButton
      Left = 378
      Top = 9
      Width = 33
      Height = 33
      Hint = 'Filter Lot #'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5A585740
        4040202820000800FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF606060706870404040000800FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF60586090
        9090606060302830FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF505850B0A8B0808080404840FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE0C9B9605850C0
        C0C0A0A0A0404040CEB3A0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFE0CABA505850A0A0A0D0D0D0B0B0B0707070201820CCAE9BFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE1CCBC706870C0B8C0E0E8E0E0
        E0E0C0C0C0909890605860201820CBAB96FF00FFFF00FFFF00FFFF00FFFF00FF
        E1CDBE707070C0C0C0F0E8F0FFF8FFF0F0F0D0D8D0C0C0C0A098A06058601018
        10C9A791FF00FFFF00FFFF00FFE1CDC0808080D0D0D0F0F0F0FFFFFFFFFFFFFF
        F8FFE0E8E0D0D8D0C0B8C0909090505050201820C8A38CFF00FFFF00FF808080
        D0D0D0F0F0F0FFF8FFFFF8FFF0F8F0F0F0F0E0E8E0D0D0D0C0C0C0A098A06068
        60505850101810FF00FFFF00FFB0B8B0C0C8C0D0D0D0D0D0D0C0C0C0C0B8C0B0
        B0B0A0A8A0A0A0A0A098A0909090707870606060504850FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      Anchors = [akTop, akRight]
      ParentColor = False
      Color = clWindow
      OnClick = sbtnSearchClick
    end
    object edLotNumber: TUniEdit
      Left = 58
      Top = 12
      Width = 319
      Height = 25
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Text = ''
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnKeyDown = edLotNumberKeyDown
      OnKeyPress = edLotNumberKeyPress
    end
  end
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 52
    Width = 830
    Height = 288
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Height = -14
    TabOrder = 2
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 613
    IQComponents.Grid.Height = 202
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = Src
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
    IQComponents.Navigator.DataSource = Src
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 613
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 202
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = Src
    Columns = <
      item
        FieldName = 'SHIPDATE'
        Title.Caption = 'Ship Date'
        Width = 126
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CUSTNO'
        Title.Caption = 'Cust#'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'QTYSHIPPED'
        Title.Caption = 'Qty. Shipped'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PONO'
        Title.Caption = 'PO#'
        Width = 245
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ITEMNO'
        Title.Caption = 'Item#'
        Width = 210
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 350
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CUST_ITEMNO'
        Title.Caption = 'AKA Item#'
        Width = 350
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CUST_DESCRIP'
        Title.Caption = 'AKA Description'
        Width = 245
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EPLANT_ID'
        Title.Caption = 'EPlant ID'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'UOM'
        Title.Caption = 'UOM'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PACKSLIPNO'
        Title.Caption = 'Pack Slip#'
        Width = 105
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REV'
        Title.Caption = 'Rev'
        Width = 105
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP2'
        Title.Caption = 'Ext.Description'
        Width = 350
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ORDERNO'
        Title.Caption = 'Order#'
        Width = 105
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SHIP_TO_ATTN'
        Title.Caption = 'Ship To Attn.'
        Width = 420
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'LOTNO'
        Title.Caption = 'Lot #'
        Width = 224
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object Qry: TFDQuery
    AutoCalcFields = False
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select v.shipdate as shipdate,'
      '       v.packslipno as packslipno,'
      '       v.custno as custno,'
      '       v.arcusto_id as arcusto_id,'
      '       v.qtyshipped as qtyshipped,'
      '       v.shipment_dtl_id as shipment_dtl_id,'
      '       v.order_dtl_id as order_dtl_id,'
      '       v.pono as pono,'
      '       v.rev as rev,'
      
        '       decode( v.phantom_ord_detail_id, null, null, '#39'     '#39') || ' +
        'v.itemno as itemno,'
      '       v.descrip as descrip,'
      '       v.descrip2 as descrip2,'
      '       v.orders_id as orders_id,'
      '       v.hist_orders_id as hist_orders_id,'
      '       v.arinvt_id as arinvt_id,'
      '       v.arinvt_hist_id as arinvt_hist_id, '
      '       v.cust_itemno as cust_itemno,'
      '       v.cust_descrip as cust_descrip,'
      '       v.eplant_id as eplant_id,'
      '       v.uom as uom,'
      '       v.phantom as phantom, '
      '       v.orderno as orderno,'
      '       v.phantom_ps_ticket_dtl_id as phantom_ps_ticket_dtl_id,'
      '       v.ship_to_attn as ship_to_attn,'
      '       :aLotno as lotno'
      'from v_rma v'
      'where v.arcusto_id = :nArCustoId'
      '  and v.from_rma = '#39'N'#39
      
        '--  AND NOT EXISTS (SELECT 1 FROM ord_detail_cum_ship WHERE ord_' +
        'detail_id = v.order_dtl_id)'
      
        '  and rma_misc.LotnoExistsInShipmentReleases(:aLotno, v.shipment' +
        '_dtl_id) > 0'
      ''
      ' '
      ' ')
    Left = 72
    Top = 152
    ParamData = <
      item
        Name = 'nArCustoId'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'aLotno'
        DataType = ftString
        ParamType = ptInput
      end>
    object QrySHIPDATE: TDateTimeField
      DisplayWidth = 18
      FieldName = 'SHIPDATE'
      Origin = 'v.shipdate'
    end
    object QryPACKSLIPNO: TStringField
      DisplayWidth = 15
      FieldName = 'PACKSLIPNO'
      Origin = 'v.packslipno'
      Size = 15
    end
    object QryCUSTNO: TStringField
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Origin = 'v.custno'
      FixedChar = True
      Size = 10
    end
    object QryARCUSTO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARCUSTO_ID'
      Size = 0
    end
    object QryQTYSHIPPED: TBCDField
      DisplayWidth = 10
      FieldName = 'QTYSHIPPED'
      Origin = 'v.qtyshipped'
    end
    object QrySHIPMENT_DTL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SHIPMENT_DTL_ID'
      Size = 0
    end
    object QryORDER_DTL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ORDER_DTL_ID'
      Size = 0
    end
    object QryPONO: TStringField
      DisplayWidth = 35
      FieldName = 'PONO'
      Origin = 'v.pono'
      Size = 35
    end
    object QryREV: TStringField
      DisplayWidth = 15
      FieldName = 'REV'
      Origin = 'v.rev'
      Size = 15
    end
    object QryITEMNO: TStringField
      DisplayWidth = 30
      FieldName = 'ITEMNO'
      Origin = 
        'decode( v.phantom_ord_detail_id, null, null, '#39'     '#39') || v.itemn' +
        'o'
      Size = 55
    end
    object QryDESCRIP: TStringField
      DisplayWidth = 250
      FieldName = 'DESCRIP'
      Origin = 'v.descrip'
      Size = 250
    end
    object QryDESCRIP2: TStringField
      DisplayWidth = 100
      FieldName = 'DESCRIP2'
      Origin = 'v.descrip2'
      Size = 100
    end
    object QryORDERS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ORDERS_ID'
      Size = 0
    end
    object QryHIST_ORDERS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'HIST_ORDERS_ID'
      Size = 0
    end
    object QryARINVT_ID: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Size = 38
    end
    object QryARINVT_HIST_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_HIST_ID'
      Size = 0
    end
    object QryCUST_ITEMNO: TStringField
      DisplayWidth = 50
      FieldName = 'CUST_ITEMNO'
      Origin = 'v.cust_itemno'
      Size = 50
    end
    object QryCUST_DESCRIP: TStringField
      DisplayWidth = 35
      FieldName = 'CUST_DESCRIP'
      Origin = 'v.cust_descrip'
      Size = 35
    end
    object QryEPLANT_ID: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'v.eplant_id'
      Size = 38
    end
    object QryUOM: TStringField
      DisplayWidth = 10
      FieldName = 'UOM'
      Origin = 'v.uom'
      Size = 10
    end
    object QryPHANTOM: TStringField
      DisplayWidth = 1
      FieldName = 'PHANTOM'
      Origin = 'v.phantom'
      Size = 1
    end
    object QryORDERNO: TStringField
      DisplayWidth = 15
      FieldName = 'ORDERNO'
      Origin = 'v.orderno'
      Size = 15
    end
    object QryPHANTOM_PS_TICKET_DTL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PHANTOM_PS_TICKET_DTL_ID'
      Size = 0
    end
    object QrySHIP_TO_ATTN: TStringField
      DisplayWidth = 60
      FieldName = 'SHIP_TO_ATTN'
      Origin = 'v.ship_to_attn'
      Size = 60
    end
    object QryLOTNO: TStringField
      FieldName = 'LOTNO'
      Size = 4000
    end
  end
  object Src: TDataSource
    DataSet = Qry
    Left = 112
    Top = 152
  end
end
