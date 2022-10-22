object UniPackSlip: TUniPackSlip
  Left = 0
  Top = 0
  Width = 1040
  Height = 794
  OnCreate = UniFrameCreate
  OnDestroy = UniFrameDestroy
  Layout = 'border'
  TabOrder = 0
  ParentFont = False
  object pnlTop: TUniPanel
    Left = 0
    Top = 29
    Width = 1033
    Height = 250
    Hint = ''
    CreateOrder = 1
    TabOrder = 1
    Caption = ''
    Layout = 'border'
    LayoutConfig.Split = True
    LayoutConfig.Region = 'north'
    object pnlColumn1: TUniPanel
      Left = 1
      Top = 1
      Width = 100
      Height = 248
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 1
      BorderStyle = ubsNone
      Caption = ''
      Color = clWhite
      AlignmentControl = uniAlignmentClient
      ParentAlignmentControl = False
      Layout = 'vbox'
      LayoutConfig.Split = True
      LayoutConfig.Region = 'west'
      DesignSize = (
        100
        248)
      object UniGenericControl1: TUniGenericControl
        Left = 0
        Top = 0
        Width = 100
        Height = 17
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        Color = clWhite
      end
      object lblPSNo: TUniLabel
        Left = 21
        Top = 23
        Width = 46
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        AutoSize = False
        Caption = 'Packslip #'
        Anchors = []
        TabOrder = 6
        LayoutConfig.Width = '100%'
        LayoutConfig.Margin = '3'
      end
      object lblCustomer: TUniLabel
        Left = 21
        Top = 43
        Width = 46
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        AutoSize = False
        Caption = 'Customer'
        Anchors = []
        TabOrder = 1
        LayoutConfig.Width = '100%'
        LayoutConfig.Margin = '3'
      end
      object lblBillTo: TUniLabel
        Left = 25
        Top = 71
        Width = 46
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        AutoSize = False
        Caption = 'Bill To'
        Anchors = []
        TabOrder = 2
        LayoutConfig.Width = '100%'
        LayoutConfig.Margin = '3'
      end
      object lblShipTo: TUniLabel
        Left = 24
        Top = 102
        Width = 46
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        AutoSize = False
        Caption = 'Ship To'
        Anchors = []
        TabOrder = 3
        LayoutConfig.Width = '100%'
        LayoutConfig.Margin = '3'
      end
      object lblEplant: TUniLabel
        Left = 21
        Top = 132
        Width = 46
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        AutoSize = False
        Caption = 'EPlant'
        Anchors = []
        TabOrder = 4
        LayoutConfig.Width = '100%'
        LayoutConfig.Margin = '3'
      end
      object lblPsDate: TUniLabel
        Left = 22
        Top = 162
        Width = 46
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        AutoSize = False
        Caption = 'PS Date'
        Anchors = []
        TabOrder = 5
        LayoutConfig.Width = '100%'
        LayoutConfig.Margin = '3'
      end
    end
    object pnlColumn2: TUniPanel
      Left = 100
      Top = 1
      Width = 317
      Height = 248
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 2
      BorderStyle = ubsNone
      Caption = ''
      Color = clWhite
      AlignmentControl = uniAlignmentClient
      ParentAlignmentControl = False
      Layout = 'vbox'
      LayoutConfig.Split = True
      LayoutConfig.Region = 'west'
      object UniGenericControl2: TUniGenericControl
        Left = 0
        Top = 0
        Width = 317
        Height = 17
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        Color = clWhite
      end
      object uniDBEdtPackslipNo: TUniDBEdit
        Left = 32
        Top = 17
        Width = 121
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        DataField = 'PACKSLIPNO'
        DataSource = DemoPackslip_DM.SrcPSHeader
        TabOrder = 9
        ReadOnly = True
        LayoutConfig.Width = '100%'
      end
      object dbeCustomer: TUniDBEdit
        Left = 33
        Top = 45
        Width = 121
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        DataField = 'ARCUSTO_COMPANY'
        DataSource = DemoPackslip_DM.SrcPSHeader
        TabOrder = 1
        LayoutConfig.Width = '100%'
      end
      object dbeBillTo: TUniDBEdit
        Left = 33
        Top = 73
        Width = 121
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        DataField = 'BILL_TO_ATTN'
        DataSource = DemoPackslip_DM.SrcPSHeader
        TabOrder = 2
        LayoutConfig.Width = '100%'
      end
      object dbeShipTo: TUniDBEdit
        Left = 31
        Top = 101
        Width = 121
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        DataField = 'SHIP_TO_ATTN'
        DataSource = DemoPackslip_DM.SrcPSHeader
        TabOrder = 3
        LayoutConfig.Width = '100%'
      end
      object dbeEplant: TUniDBEdit
        Left = 31
        Top = 129
        Width = 121
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        DataField = 'EPLANT_NAME'
        DataSource = DemoPackslip_DM.SrcPSHeader
        TabOrder = 4
        LayoutConfig.Width = '100%'
      end
      object dbePsDate: TUniDBEdit
        Left = 31
        Top = 157
        Width = 121
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        DataField = 'PS_DATE'
        DataSource = DemoPackslip_DM.SrcPSHeader
        TabOrder = 5
        LayoutConfig.Width = '100%'
      end
      object chkDoNotinvoice: TUniDBCheckBox
        Left = 28
        Top = 185
        Width = 124
        Height = 17
        Hint = ''
        DataField = 'TO_INVOICE'
        DataSource = DemoPackslip_DM.SrcPSHeader
        Caption = 'Do not Invoice'
        TabOrder = 6
        LayoutConfig.Width = '100%'
      end
      object chkAwaitsInventoryVerification: TUniDBCheckBox
        Left = 28
        Top = 208
        Width = 213
        Height = 17
        Hint = ''
        DataSource = DemoPackslip_DM.SrcPSHeader
        Caption = 'Awaits Inventory Verification'
        TabOrder = 7
        LayoutConfig.Width = '100%'
      end
    end
    object pnlColumn3: TUniPanel
      Left = 417
      Top = 1
      Width = 100
      Height = 248
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 3
      BorderStyle = ubsNone
      Caption = ''
      Color = clWhite
      AlignmentControl = uniAlignmentClient
      ParentAlignmentControl = False
      Layout = 'vbox'
      LayoutConfig.Split = True
      LayoutConfig.Region = 'west'
      DesignSize = (
        100
        248)
      object UniGenericControl3: TUniGenericControl
        Left = 0
        Top = 0
        Width = 100
        Height = 17
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        Color = clWhite
      end
      object lblShipVia: TUniLabel
        Left = 25
        Top = 28
        Width = 46
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        AutoSize = False
        Caption = 'Ship Via'
        Anchors = []
        TabOrder = 2
        LayoutConfig.Width = '100%'
        LayoutConfig.Margin = '3'
      end
      object lblShipDays: TUniLabel
        Left = 25
        Top = 58
        Width = 69
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        AutoSize = False
        Caption = 'Ship Days'
        Anchors = []
        TabOrder = 3
        LayoutConfig.Width = '100%'
        LayoutConfig.Margin = '3'
      end
      object lblShipDate: TUniLabel
        Left = 22
        Top = 88
        Width = 46
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        AutoSize = False
        Caption = 'Ship Date'
        Anchors = []
        TabOrder = 4
        LayoutConfig.Width = '100%'
        LayoutConfig.Margin = '3'
      end
      object lblFob: TUniLabel
        Left = 22
        Top = 119
        Width = 46
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        AutoSize = False
        Caption = 'FOB'
        Anchors = []
        TabOrder = 5
        LayoutConfig.Width = '100%'
        LayoutConfig.Margin = '3'
      end
      object lblPalletCount: TUniLabel
        Left = 22
        Top = 149
        Width = 83
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        AutoSize = False
        Caption = 'Pallet Count'
        Anchors = []
        TabOrder = 6
        LayoutConfig.Width = '100%'
        LayoutConfig.Margin = '3'
      end
      object lblUserText1: TUniLabel
        Left = 22
        Top = 174
        Width = 72
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        AutoSize = False
        Caption = 'User Text 1'
        Anchors = []
        TabOrder = 7
        LayoutConfig.Width = '100%'
        LayoutConfig.Margin = '3'
      end
      object lblNote: TUniLabel
        Left = 22
        Top = 204
        Width = 75
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        AutoSize = False
        Caption = 'Note'
        Anchors = []
        TabOrder = 8
        LayoutConfig.Width = '100%'
        LayoutConfig.Margin = '3'
      end
    end
    object pnlColumn4: TUniPanel
      Left = 517
      Top = 1
      Width = 200
      Height = 248
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 4
      BorderStyle = ubsNone
      Caption = ''
      Color = clWhite
      AlignmentControl = uniAlignmentClient
      ParentAlignmentControl = False
      Layout = 'vbox'
      LayoutConfig.Split = True
      LayoutConfig.Region = 'west'
      object UniGenericControl4: TUniGenericControl
        Left = 0
        Top = 0
        Width = 200
        Height = 17
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        Color = clWhite
      end
      object dbeShipVia: TUniDBEdit
        Left = 57
        Top = 37
        Width = 121
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        DataField = 'SHIP_VIA'
        DataSource = DemoPackslip_DM.SrcPSHeader
        TabOrder = 2
        LayoutConfig.Width = '100%'
      end
      object dbeShipDays: TUniDBEdit
        Left = 57
        Top = 65
        Width = 121
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        DataField = 'SHIP_TO_SHIP_TIME'
        DataSource = DemoPackslip_DM.SrcPSHeader
        TabOrder = 3
        LayoutConfig.Width = '100%'
      end
      object dbeShipDate: TUniDBEdit
        Left = 56
        Top = 93
        Width = 129
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        DataField = 'SHIPDATE'
        DataSource = DemoPackslip_DM.SrcPSHeader
        TabOrder = 8
        LayoutConfig.Width = '100%'
      end
      object dbeFob: TUniDBEdit
        Left = 65
        Top = 121
        Width = 121
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        DataField = 'FOB'
        DataSource = DemoPackslip_DM.SrcPSHeader
        TabOrder = 4
        LayoutConfig.Width = '100%'
      end
      object dbePalletCount: TUniDBEdit
        Left = 63
        Top = 149
        Width = 121
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        DataField = 'PALLET_COUNT'
        DataSource = DemoPackslip_DM.SrcPSHeader
        TabOrder = 5
        LayoutConfig.Width = '100%'
      end
      object dbeUserText1: TUniDBEdit
        Left = 63
        Top = 176
        Width = 121
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        DataField = 'CUSER1'
        DataSource = DemoPackslip_DM.SrcPSHeader
        TabOrder = 6
        LayoutConfig.Width = '100%'
      end
      object dbeNote: TUniDBEdit
        Left = 63
        Top = 204
        Width = 121
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        DataField = 'NOTE'
        DataSource = DemoPackslip_DM.SrcPSHeader
        TabOrder = 7
        LayoutConfig.Width = '100%'
      end
    end
    object pnlColumn5: TUniPanel
      Left = 717
      Top = 1
      Width = 100
      Height = 248
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 5
      BorderStyle = ubsNone
      Caption = ''
      Color = clWhite
      AlignmentControl = uniAlignmentClient
      ParentAlignmentControl = False
      Layout = 'vbox'
      LayoutConfig.Split = True
      LayoutConfig.Region = 'west'
      DesignSize = (
        100
        248)
      object UniGenericControl5: TUniGenericControl
        Left = 0
        Top = 0
        Width = 100
        Height = 17
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        Color = clWhite
      end
      object lblFreightCharge: TUniLabel
        Left = 6
        Top = 26
        Width = 91
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        AutoSize = False
        Caption = 'Freight Charge'
        Anchors = []
        TabOrder = 0
        LayoutConfig.Width = '100%'
        LayoutConfig.Margin = '3'
      end
      object lblTerms: TUniLabel
        Left = 6
        Top = 56
        Width = 70
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        AutoSize = False
        Caption = 'Terms'
        Anchors = []
        TabOrder = 1
        LayoutConfig.Width = '100%'
        LayoutConfig.Margin = '3'
      end
      object lblTrackingNumber: TUniLabel
        Left = 6
        Top = 80
        Width = 70
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        AutoSize = False
        Caption = 'Tracking #'
        Anchors = []
        TabOrder = 2
        LayoutConfig.Width = '100%'
        LayoutConfig.Margin = '3'
      end
      object lblBolNote: TUniLabel
        Left = 3
        Top = 110
        Width = 100
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        AutoSize = False
        Caption = 'BOL Note'
        Anchors = []
        TabOrder = 3
        LayoutConfig.Width = '100%'
        LayoutConfig.Margin = '3'
      end
      object lblPoolBillNumber: TUniLabel
        Left = 6
        Top = 141
        Width = 73
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        AutoSize = False
        Caption = 'Pool Bill #'
        Anchors = []
        TabOrder = 4
        LayoutConfig.Width = '100%'
        LayoutConfig.Margin = '3'
      end
      object lblBatch: TUniLabel
        Left = 6
        Top = 174
        Width = 99
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        AutoSize = False
        Caption = 'Batch'
        Anchors = []
        TabOrder = 5
        LayoutConfig.Width = '100%'
        LayoutConfig.Margin = '3'
      end
      object lblTruckLoadNumber: TUniLabel
        Left = 6
        Top = 205
        Width = 70
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        AutoSize = False
        Caption = 'Truck Load #'
        Anchors = []
        TabOrder = 6
        LayoutConfig.Width = '100%'
        LayoutConfig.Margin = '3'
      end
    end
    object pnlColumn6: TUniPanel
      Left = 817
      Top = 1
      Width = 256
      Height = 248
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 6
      BorderStyle = ubsNone
      Caption = ''
      Color = clWhite
      AlignmentControl = uniAlignmentClient
      ParentAlignmentControl = False
      Layout = 'vbox'
      LayoutConfig.Split = True
      LayoutConfig.Region = 'center'
      object UniGenericControl6: TUniGenericControl
        Left = 0
        Top = 0
        Width = 256
        Height = 17
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        Color = clWhite
      end
      object dbeFreightCharge: TUniDBEdit
        Left = 73
        Top = 23
        Width = 121
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        DataField = 'AUTO_FREIGHT_PRICE'
        DataSource = DemoPackslip_DM.SrcPSHeader
        TabOrder = 0
        LayoutConfig.Width = '100%'
      end
      object dbeTerms: TUniDBEdit
        Left = 73
        Top = 51
        Width = 121
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        DataField = 'TERMS_DESCRIP'
        DataSource = DemoPackslip_DM.SrcPSHeader
        TabOrder = 1
        LayoutConfig.Width = '100%'
      end
      object dbeTrackingNumber: TUniDBEdit
        Left = 79
        Top = 79
        Width = 121
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        DataField = 'TRACKING_NUM'
        DataSource = DemoPackslip_DM.SrcPSHeader
        TabOrder = 2
        LayoutConfig.Width = '100%'
      end
      object dbeBolNote: TUniDBMemo
        Left = 72
        Top = 101
        Width = 121
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        DataField = 'BOL_COMMENT1'
        DataSource = DemoPackslip_DM.SrcPSHeader
        TabOrder = 3
        LayoutConfig.Width = '100%'
      end
      object dbePoolBillNumber: TUniDBMemo
        Left = 72
        Top = 129
        Width = 121
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        DataField = 'POOL_BILL_NUMBER'
        DataSource = DemoPackslip_DM.SrcPSHeader
        TabOrder = 4
        LayoutConfig.Width = '100%'
      end
      object dbeBatch: TUniDBEdit
        Left = 71
        Top = 176
        Width = 121
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        DataField = 'PS_TICKET_BATCH'
        DataSource = DemoPackslip_DM.SrcPSHeader
        TabOrder = 5
        LayoutConfig.Width = '100%'
      end
      object dbeTruckLoadNumber: TUniDBEdit
        Left = 71
        Top = 204
        Width = 121
        Height = 22
        Hint = ''
        Constraints.MaxHeight = 22
        Constraints.MinHeight = 22
        DataField = 'TRAILNO'
        DataSource = DemoPackslip_DM.SrcPSHeader
        TabOrder = 6
        LayoutConfig.Width = '100%'
      end
    end
  end
  object pnlMiddle: TUniPanel
    Left = 0
    Top = 280
    Width = 1033
    Height = 190
    Hint = ''
    CreateOrder = 2
    TabOrder = 0
    Caption = 'pnlMiddle'
    Layout = 'border'
    LayoutConfig.Split = True
    LayoutConfig.Region = 'north'
    object UniDBGrid1: TUniDBGrid
      Left = 1
      Top = 29
      Width = 1031
      Height = 161
      Hint = ''
      DataSource = DemoPackslip_DM.SrcShip_Dtl
      WebOptions.Paged = False
      WebOptions.PageSize = 2
      LoadMask.Message = 'Loading data...'
      LayoutConfig.Region = 'center'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      OnDrawColumnCell = UniDBGrid1DrawColumnCell
      Columns = <
        item
          FieldName = 'ID'
          Title.Caption = 'ID'
          Width = 100
          Visible = False
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ORDERNO'
          Title.Caption = 'Order #'
          Width = 94
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ITEMNO'
          Title.Caption = 'Item #'
          Width = 304
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Item Description'
          Width = 1504
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'QTYSHIPPED'
          Title.Caption = 'Quantity Shipped'
          Width = 94
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'BACKORDER_QTY'
          Title.Caption = 'Backlog'
          Width = 94
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'INVOICED_QTY'
          Title.Caption = 'Packing Slip Invoiced Quantity'
          Width = 148
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ORD_INVOICED_QTY'
          Title.Caption = ' Order Invoiced Quantity'
          Width = 124
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SHIPMENT_TYPE'
          Title.Caption = 'Shipment Type'
          Width = 304
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SHIPMENTS'
          Title.Caption = 'Shipments'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'UOM'
          Title.Caption = 'Order UOM'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ORDER_DTL_ID'
          Title.Caption = 'Order Detail Id'
          Width = 100
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CMTLINE'
          Title.Caption = 'Comment'
          Width = 12004
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ORD_DETAIL_CMTLINE'
          Title.Caption = 'Detailed Comment'
          Width = 12004
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CRM_QUOTE_ID'
          Title.Caption = 'CRM_QUOTE_ID'
          Width = 100
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CRM_QUOTE_RFQ'
          Title.Caption = 'Sales Quotation #'
          Width = 91
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CRM_QUOTE_DESCRIP'
          Title.Caption = 'CRM_QUOTE_DESCRIP'
          Width = 214
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'RAN'
          Title.Caption = 'R.A.N. / Kanban'
          Width = 184
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PONO'
          Title.Caption = 'PONO'
          Width = 214
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PHANTOM_PS_TICKET_DTL_ID'
          Title.Caption = 'PHANTOM_PS_TICKET_DTL_ID'
          Width = 153
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PS_TICKET_DTL_ARINVT_ID'
          Title.Caption = 'PS_TICKET_DTL_ARINVT_ID'
          Width = 141
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PHANTOM_ORD_DETAIL_ID'
          Title.Caption = 'Phantom Order Detail Id'
          Width = 120
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EXTDESCRIP'
          Title.Caption = 'AKA Ext Description'
          Width = 604
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'REV'
          Title.Caption = 'AKA Rev'
          Width = 94
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CLASS'
          Title.Caption = 'Item Class'
          Width = 54
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
    object pnlToolbar: TUniPanel
      Left = 1
      Top = 1
      Width = 1031
      Height = 29
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = 'pnlToolbar'
      Layout = 'hbox'
      object UniToolBar2: TUniToolBar
        Left = 1
        Top = 1
        Width = 915
        Height = 27
        Hint = ''
        Images = UniImageList1
        LayoutConfig.Width = '100%'
        LayoutConfig.Region = 'west'
        Anchors = [akLeft, akTop, akRight, akBottom]
        Align = alClient
        TabOrder = 1
        ParentColor = False
        Color = clBtnFace
        object UniToolButton15: TUniToolButton
          Left = 0
          Top = 0
          Hint = 'Certificate of Conformance'
          ShowHint = True
          ParentShowHint = False
          ImageIndex = 10
          Caption = 'UniToolButton15'
        end
        object UniToolButton16: TUniToolButton
          Left = 23
          Top = 0
          Hint = 'Show or Print SPC Data'
          ShowHint = True
          ParentShowHint = False
          ImageIndex = 11
          Caption = 'UniToolButton16'
        end
        object UniToolButton17: TUniToolButton
          Left = 46
          Top = 0
          Hint = 'Print Labels'
          ShowHint = True
          ParentShowHint = False
          ImageIndex = 12
          Caption = 'UniToolButton17'
        end
        object pnlColorTiles: TUniPanel
          Left = 75
          Top = 0
          Width = 840
          Height = 27
          Hint = ''
          Margins.Top = 1
          Margins.Bottom = 1
          Align = alRight
          Anchors = [akRight]
          TabOrder = 4
          BorderStyle = ubsNone
          Alignment = taRightJustify
          Caption = ''
          Color = clNone
          AlignmentControl = uniAlignmentClient
          ParentAlignmentControl = False
          LayoutConfig.IgnorePosition = False
          LayoutConfig.Width = '100%'
          LayoutConfig.Region = 'east'
          DesignSize = (
            840
            27)
          object swatchNegShipment: TUniPanel
            Left = 791
            Top = 8
            Width = 13
            Height = 13
            Hint = 'Negative Shipment (ex: RMA)'
            ShowHint = True
            ParentShowHint = False
            Constraints.MaxHeight = 13
            Constraints.MaxWidth = 13
            Constraints.MinHeight = 13
            Constraints.MinWidth = 13
            Anchors = []
            TabOrder = 1
            BorderStyle = ubsSolid
            Caption = ''
            Color = clTeal
          end
          object swatchOverinvoiced: TUniPanel
            Left = 776
            Top = 8
            Width = 13
            Height = 13
            Hint = 'Overinvoiced'
            ShowHint = True
            ParentShowHint = False
            Constraints.MaxHeight = 13
            Constraints.MaxWidth = 13
            Constraints.MinHeight = 13
            Constraints.MinWidth = 13
            Anchors = []
            TabOrder = 2
            BorderStyle = ubsSolid
            Caption = ''
            Color = clRed
          end
          object swatchPartialInvoiced: TUniPanel
            Left = 761
            Top = 8
            Width = 13
            Height = 13
            Hint = 'Invoiced Partially'
            ShowHint = True
            ParentShowHint = False
            Constraints.MaxHeight = 13
            Constraints.MaxWidth = 13
            Constraints.MinHeight = 13
            Constraints.MinWidth = 13
            Anchors = []
            TabOrder = 3
            BorderStyle = ubsSolid
            Caption = ''
            Color = clYellow
          end
          object swatchNotInvoiced: TUniPanel
            Left = 746
            Top = 8
            Width = 13
            Height = 13
            Hint = 'Not Invoiced'
            ShowHint = True
            ParentShowHint = False
            Constraints.MaxHeight = 13
            Constraints.MaxWidth = 13
            Constraints.MinHeight = 13
            Constraints.MinWidth = 13
            Anchors = []
            TabOrder = 4
            BorderStyle = ubsSolid
            Caption = ''
            Color = clPurple
          end
          object swatchInvoiced: TUniPanel
            Left = 730
            Top = 8
            Width = 13
            Height = 13
            Hint = 'Quality Shipped equals Qty Invoiced'
            ShowHint = True
            ParentShowHint = False
            Constraints.MaxHeight = 13
            Constraints.MaxWidth = 13
            Constraints.MinHeight = 13
            Constraints.MinWidth = 13
            Anchors = []
            TabOrder = 5
            BorderStyle = ubsSolid
            Caption = ''
            Color = clLime
          end
        end
      end
      object UniDBNavigator2: TUniDBNavigator
        Left = 915
        Top = 1
        Width = 116
        Height = 27
        Hint = ''
        Constraints.MaxHeight = 27
        Constraints.MinHeight = 27
        DataSource = DemoPackslip_DM.SrcShip_Dtl
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        LayoutConfig.Region = 'east'
        Align = alRight
        Anchors = [akRight]
        TabOrder = 2
      end
    end
  end
  object pnlBottom: TUniPanel
    Left = 0
    Top = 470
    Width = 1033
    Height = 319
    Hint = ''
    CreateOrder = 3
    TabOrder = 3
    Caption = ''
    Layout = 'border'
    LayoutConfig.Split = True
    LayoutConfig.Region = 'center'
    object UniPageControl1: TUniPageControl
      Left = 1
      Top = 1
      Width = 1031
      Height = 317
      Hint = ''
      ActivePage = UniTabSheet1
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      LayoutConfig.Region = 'center'
      TabOrder = 1
      object UniTabSheet1: TUniTabSheet
        Hint = ''
        Caption = 'Line Locations and Lot #'
        Layout = 'border'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        object UniPanel1: TUniPanel
          Left = 0
          Top = 0
          Width = 1023
          Height = 29
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = 'pnlToolbar'
          Layout = 'hbox'
          object UniToolBar5: TUniToolBar
            Left = 1
            Top = 1
            Width = 907
            Height = 27
            Hint = ''
            Images = UniImageList1
            LayoutConfig.Width = '100%'
            LayoutConfig.Region = 'west'
            Anchors = [akLeft, akTop, akRight, akBottom]
            Align = alClient
            TabOrder = 1
            ParentColor = False
            Color = clBtnFace
          end
          object UniDBNavigator4: TUniDBNavigator
            Left = 907
            Top = 1
            Width = 116
            Height = 27
            Hint = ''
            Constraints.MaxHeight = 27
            Constraints.MinHeight = 27
            DataSource = DemoPackslip_DM.SrcShip_Rel
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            LayoutConfig.Region = 'east'
            Align = alRight
            Anchors = [akRight]
            TabOrder = 2
          end
        end
        object UniDBGrid2: TUniDBGrid
          Left = 0
          Top = 29
          Width = 1023
          Height = 260
          Hint = ''
          DataSource = DemoPackslip_DM.SrcShip_Rel
          WebOptions.Paged = False
          WebOptions.PageSize = 2
          LoadMask.Message = 'Loading data...'
          LayoutConfig.Region = 'center'
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Columns = <
            item
              FieldName = 'LOC_DESC'
              Title.Caption = 'Location'
              Width = 184
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'LOTNO'
              Title.Caption = 'Lot #'
              Width = 154
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'QTYSHIPPED'
              Title.Caption = 'Shipped'
              Width = 94
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'LOT_DATE'
              Title.Caption = 'Lot Date'
              Width = 112
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'LOT_EXPIRY_DATE'
              Title.Caption = 'Exp. Date'
              Width = 112
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
        object PkrHeader: TIQUniEditorDlgPickDataSet
          Left = 58
          Top = 129
          Width = 145
          Hint = ''
          Visible = False
          TabOrder = 2
          Triggers = <
            item
              ImageIndex = 0
              ButtonId = 1
              HandleClicks = True
            end>
          OnDialogResult = PkrHeaderDialogResult
          ListField = 'ID'
          ListSource = DemoPackslip_DM.SrcPSHeader
          KeyField = 'ID'
          ListFieldIndex = 0
        end
      end
      object UniTabSheet2: TUniTabSheet
        Hint = ''
        Caption = 'Comments'
        Layout = 'border'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        object pnlMemoTop: TUniPanel
          Left = 0
          Top = 0
          Width = 1023
          Height = 100
          Hint = ''
          TabOrder = 0
          Caption = 'pnlMemoTop'
          Layout = 'border'
          LayoutConfig.Split = True
          LayoutConfig.Region = 'north'
          object UniToolBar3: TUniToolBar
            Left = 1
            Top = 1
            Width = 1021
            Height = 23
            Hint = ''
            Constraints.MaxHeight = 29
            Constraints.MinHeight = 29
            Anchors = [akLeft, akTop, akRight]
            Align = alTop
            TabOrder = 1
            ParentColor = False
            Color = clBtnFace
            object UniToolButton14: TUniToolButton
              Left = 0
              Top = 0
              Width = 146
              Hint = ''
              Style = tbsContainer
              Caption = 'UniToolButton14'
              LayoutConfig.Padding = '10'
              Layout = 'absolute'
              object UniLabel1: TUniLabel
                Left = 16
                Top = 5
                Width = 103
                Height = 13
                Hint = ''
                Caption = 'Packing Slip Comment'
                TabOrder = 1
              end
            end
            object UniDBNavigator1: TUniDBNavigator
              Left = 943
              Top = 0
              Width = 78
              Height = 23
              Hint = ''
              Visible = False
              Constraints.MaxHeight = 23
              Constraints.MinHeight = 23
              DataSource = DemoPackslip_DM.SrcShip_Dtl
              VisibleButtons = [nbPost, nbCancel, nbRefresh]
              Align = alRight
              Anchors = [akTop, akRight, akBottom]
              TabOrder = 1
            end
          end
          object UniDBMemo3: TUniDBMemo
            Left = 1
            Top = 23
            Width = 1021
            Height = 77
            Hint = ''
            DataField = 'CMTLINE'
            DataSource = DemoPackslip_DM.SrcShip_Dtl
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 2
          end
        end
        object pnlMemoBottom: TUniPanel
          Left = 0
          Top = 106
          Width = 1023
          Height = 100
          Hint = ''
          TabOrder = 1
          Caption = 'pnlMemoBottom'
          Layout = 'border'
          LayoutConfig.Region = 'center'
          object UniToolBar4: TUniToolBar
            Left = 1
            Top = 1
            Width = 1021
            Height = 23
            Hint = ''
            Constraints.MaxHeight = 29
            Constraints.MinHeight = 29
            Anchors = [akLeft, akTop, akRight]
            Align = alTop
            TabOrder = 1
            ParentColor = False
            Color = clBtnFace
            object UniToolButton18: TUniToolButton
              Left = 0
              Top = 0
              Width = 148
              Hint = ''
              Style = tbsContainer
              Caption = 'UniToolButton18'
              LayoutConfig.Padding = '10'
              Layout = 'absolute'
              object UniLabel2: TUniLabel
                Left = 16
                Top = 5
                Width = 104
                Height = 13
                Hint = ''
                Caption = 'Sales Order Comment'
                TabOrder = 1
              end
            end
            object UniDBNavigator3: TUniDBNavigator
              Left = 943
              Top = 0
              Width = 78
              Height = 23
              Hint = ''
              Visible = False
              Constraints.MaxHeight = 23
              Constraints.MinHeight = 23
              DataSource = DemoPackslip_DM.SrcShip_Dtl
              VisibleButtons = [nbPost, nbCancel, nbRefresh]
              Align = alRight
              Anchors = [akTop, akRight, akBottom]
              TabOrder = 1
            end
          end
          object UniDBMemo4: TUniDBMemo
            Left = 1
            Top = 23
            Width = 1021
            Height = 77
            Hint = ''
            DataField = 'ORD_DETAIL_CMTLINE'
            DataSource = DemoPackslip_DM.SrcShip_Dtl
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 2
          end
        end
      end
    end
  end
  object pnlToolbar0: TUniPanel
    Left = 0
    Top = 0
    Width = 1040
    Height = 29
    Hint = ''
    Constraints.MaxHeight = 29
    Constraints.MinHeight = 29
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = 'pnlToolbar0'
    object UniToolBar1: TUniToolBar
      Left = 1
      Top = 1
      Width = 851
      Height = 27
      Hint = ''
      Images = UniImageList1
      LayoutConfig.Width = '100%'
      Anchors = [akLeft, akTop, akRight, akBottom]
      Align = alClient
      TabOrder = 1
      ParentColor = False
      Color = clBtnFace
      object UniToolButton1: TUniToolButton
        Left = 0
        Top = 0
        Hint = 'Search'
        ShowHint = True
        ParentShowHint = False
        ImageIndex = 0
        Caption = 'UniToolButton1'
        OnClick = UniToolButton1Click
      end
      object UniToolButton2: TUniToolButton
        Left = 23
        Top = 0
        Width = 8
        Hint = ''
        Style = tbsSeparator
        Caption = 'UniToolButton2'
      end
      object UniToolButton3: TUniToolButton
        Left = 31
        Top = 0
        Hint = 'Customer Status'
        ShowHint = True
        ParentShowHint = False
        ImageIndex = 1
        Caption = 'UniToolButton3'
      end
      object UniToolButton4: TUniToolButton
        Left = 54
        Top = 0
        Width = 8
        Hint = ''
        Style = tbsSeparator
        Caption = 'UniToolButton4'
      end
      object UniToolButton5: TUniToolButton
        Left = 62
        Top = 0
        Hint = 'Print Packing Slip'
        ShowHint = True
        ParentShowHint = False
        ImageIndex = 2
        Caption = 'UniToolButton5'
      end
      object UniToolButton6: TUniToolButton
        Left = 85
        Top = 0
        Hint = 'Advanced Shipping Notice / Bill of Lading'
        ShowHint = True
        ParentShowHint = False
        ImageIndex = 3
        Caption = 'UniToolButton6'
      end
      object UniToolButton7: TUniToolButton
        Left = 108
        Top = 0
        Hint = 'Inventory Needs to be Verified'
        ShowHint = True
        ParentShowHint = False
        ImageIndex = 4
        Caption = 'UniToolButton7'
      end
      object UniToolButton8: TUniToolButton
        Left = 131
        Top = 0
        Hint = 'EDI'
        ShowHint = True
        ParentShowHint = False
        ImageIndex = 5
        Caption = 'UniToolButton8'
      end
      object UniToolButton9: TUniToolButton
        Left = 154
        Top = 0
        Width = 8
        Hint = ''
        Style = tbsSeparator
        Caption = 'UniToolButton9'
      end
      object UniToolButton10: TUniToolButton
        Left = 162
        Top = 0
        Hint = 'Shipping Manager'
        ShowHint = True
        ParentShowHint = False
        ImageIndex = 6
        Caption = 'UniToolButton10'
      end
      object UniToolButton11: TUniToolButton
        Left = 185
        Top = 0
        Hint = 'Return Shipment'
        ShowHint = True
        ParentShowHint = False
        ImageIndex = 7
        Caption = 'UniToolButton11'
      end
      object UniToolButton12: TUniToolButton
        Left = 208
        Top = 0
        Hint = 'Shipping Manager Freight'
        ShowHint = True
        ParentShowHint = False
        ImageIndex = 8
        Caption = 'UniToolButton12'
      end
      object UniToolButton13: TUniToolButton
        Left = 231
        Top = 0
        Hint = 'Create a quick Invoice for this packing slip'
        ShowHint = True
        ParentShowHint = False
        ImageIndex = 9
        Caption = 'UniToolButton13'
      end
    end
    object UniPanel2: TUniPanel
      Left = 851
      Top = 1
      Width = 189
      Height = 27
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 2
      Caption = 'UniPanel2'
      object UniDBNavigator5: TUniDBNavigator
        Left = 1
        Top = 1
        Width = 187
        Height = 25
        Hint = ''
        DataSource = DemoPackslip_DM.SrcPSHeader
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel, nbRefresh]
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
      end
    end
  end
  object UniImageList1: TUniImageList
    Left = 536
    Bitmap = {
      494C01010E001100040010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CCCBCBFFCDC5BEFFC4BBAFFFC2B9ADFFC6C1B8FFCAC9
      C6FF000000000000000000000000000000000000000080675FFF805F4FFF6F57
      3FFF6F573FFF6F4F3FFF6F4F3FFF5F4F3FFF5F4F2FFF5F4F2FFF6F4F3FFFE0E0
      E0FF000000FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CEA483FFBB875CFFBD9871FFBF9A75FFB68B62FFA87A
      4CFFA57949FFAB875AFFB7A180FF00000000877665FFD0C0B0FFD0B8B0FFD0B0
      A0FFC0B0A0FFC0A8A0FFC0A8A0FFC0A090FFC0A090FFB0A090FFE0E0E0FF0000
      00FF000000FF000000FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6AFA6FFB87D62FFC38F
      6DFFC7A289FFCEAA8FFFE79976FFE3B79BFFF9F5F0FFF4EDE7FFEEE3DAFFE8DA
      CDFFE0CDBBFFD8BDA3FFB08859FF00000000967D65FFF0E0D0FFD0C0B0FFD0B8
      B0FFD0B0B0FFC0B0A0FFC0A8A0FFC0A8A0FFD0C8C0FFE0E0E0FF000000FF0000
      00FF000000FF000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B87B5BFFC1865FFFE292
      51FFD58348FFD8926BFFEDA888FFEFD8C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFDFDFFCBAD8AFFCFA27DFF00000000967D74FFF0E0D0FFC0886FFFB06F
      4FFFD0B8B0FFC0886FFFB06F4FFFC0B0A0FFE0E0E0FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C4A89AFFCB8653FFC8ADA6FFFFFD
      FDFFC1A08EFFC58E68FFE6C1A3FFFDF9F4FFFDFDFAFFFFFFFFFFFFFFFFFFFFFD
      FDFFCFB291FFD59670FFD2BAA5FF00000000968674FFF0E0E0FFFFC8B0FFC088
      6FFFD0C0B0FFF0C8B0FFC0886FFFC0B0A0FFE0E0E0FFD0C8C0FFC6A891FFC6A8
      91FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C18D70FFE6B387FFCBAFA3FFFFF6
      EDFFAB6F57FFAF6D3CFF9D6B3FFFAF7A4BFFC8905CFFD59F71FFEDBB94FFCBA3
      79FFC89B74FFD08D5FFFCCC6C1FF00000000968D85FFF0E8E0FFE0D0C0FFD0C8
      C0FFD0C0C0FFD0C0B0FFD0B8B0FFD0B8B0FFC0B0A0FFC0B0A0FFC0A8A0FF7665
      54FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C79476FFEAD3BEFFD3B19FFFFDEC
      D5FFC86F54FFDA673BFFE67644FFD27346FFBA6C43FFA6623AFF90552AFFB167
      3AFFF9F0E8FFDBAC8DFFCCC1B9FF00000000A58D85FFFFE8E0FFC0906FFFB06F
      4FFFE0C8C0FFC09080FFB06F4FFFD0B8B0FFC0906FFFB06F4FFFC0B0A0FF8665
      54FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CB9F84FFE0D3CFFFEAC19DFFFDE0
      C1FFDA613FFFF4683BFFFA7143FFFA6F42FFFA6B3BFFFA6D3EFFF77041FFE773
      4EFFFBEDDDFFD8A380FFCCC6C1FF00000000A59585FFFFF0F0FFFFC8B0FFC088
      6FFFE0D0C0FFF0C8B0FFC0886FFFD0C0B0FFF0C8B0FFC0886FFFD0B0A0FF866C
      54FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CAAB9DFFDAB6A3FFFFCB92FFE0AA
      8EFFC85836FFE07A55FFE78B69FF644318FF644318FF644318FF644318FF6443
      18FF644318FF644318FF644318FF00000000A59C94FFFFF0F0FFE0E0E0FFE0D8
      D0FFE0D0D0FFE0D0D0FFE0C8C0FFD0C8C0FFD0C0B0FFD0C0B0FFD0B8B0FF866C
      54FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6AA9EFFD7A078FFE8B17EFFC475
      54FFC47753FFBE7653FF644318FFEFD6BDFFEFD6BDFFEFD6BDFFEFD6BDFFEFD6
      BDFFEFD6BDFFEFD6BDFFE4CAB1FF644318FFB4A494FFFFF8F0FF9080D0FF3F2F
      A0FFE0D8D0FF9080D0FF3F2FA0FFE0C8C0FF9080D0FF3F2FA0FFD0C0B0FF8674
      63FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CCC7C3FFCCAF9AFFB97A
      57FFBC7050FFC27353FF644318FFFFEAD5FFC7B7A6FF948B82FF0E0E0EFF544F
      4AFF948B82FFAFA59AFFFFEAD5FF644318FFB4A4A3FFFFF8F0FFC0C0E0FF9080
      D0FFE0E0E0FFC0C0E0FF9080D0FFE0D0D0FFC0C0E0FF9080D0FFD0C0C0FF9574
      63FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CB98
      76FFE38C6EFFD39E7CFF644318FFFFF3E6FF060606FFD2D2D2FF0E0E0EFFD2D2
      D2FF0E0E0EFF7E7B78FFFFF3E6FF644318FFB4ABA3FFFFF8FFFFFFE0D0FFFFD0
      B0FFFFD0B0FFFFC090FFF0B890FFD0A080FFD0A080FFD0B0A0FFD0C8C0FF957B
      72FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AE75
      55FFA3684DFFB67C5AFF644318FFFFF7F0FF060606FFD2D2D2FF0E0E0EFFD2D2
      D2FF0E0E0EFF7E7D7DFFFFF7F0FF644318FFB4ABA3FFFFFFFFFFFF985FFFFFA0
      5FFFFFA05FFFFFA05FFFFFA05FFFFFA05FFFFFA05FFFB0674FFFC0A890FF9584
      72FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CFB1
      97FFB98861FFB17B57FF644318FFFFFFFFFF060606FFD2D2D2FF0E0E0EFFD2D2
      D2FF0E0E0EFF7E7E7EFFFFFFFFFF644318FFB4B3A3FFFFFFFFFFE0773FFFF0D8
      D0FFF0D8D0FFF0C8B0FFE0B0A0FFE0A080FFE0804FFFA0572FFFD0A090FF9584
      72FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000644318FFFFFFFFFF2D2821FFD2D2D2FF0E0E0EFFD2D2
      D2FF0E0E0EFF88837BFFFFFFFFFF644318FFDAC7C0FFBEB3A9FFF0B8A0FFD090
      6FFFD0885FFFD0804FFFD06F3FFFD0672FFFC05F2FFFD0805FFFA08880FFC6A8
      91FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A38F74FFA38F74FFA38F74FFA38F74FFA38F
      74FFA38F74FFA38F74FFA38F74FF0000000000000000CCC4B3FFB0A8A0FFB0A8
      A0FFB0A090FFB09890FFB09890FFA09890FFA09080FFA08880FFC9AE98FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E2E2E2FFD4D4D4FFC6C6
      C5FF757473FF201F1AFFB8B8B7FFFDFDFDFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AEAEADFF8D8D8CFF605E
      63FF000445FF000656FF454452FF848483FFCDCCCCFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A17956FFA17956FFA17956FFA179
      56FFA17956FF709A70FF429962FF429962FF429962FF429962FF597594FF424E
      99FF424E99FF424E99FF424E99FF7A82AEFF9B9BA2FF2D2F49FF000045FF0017
      6AFF003889FF00368FFF003392FF0C1E5BFF2F3046FF6C6C71FF000000000000
      000000000000000000000000000000000000C7C2C0FFA69C96FFA79D98FFA89E
      98FFA79D97FFA89E97FFA9A19AFFA9A19BFFA8A29CFFA8A09BFFA69A94FFA79E
      99FFA7A19EFFA6A19DFFA69D98FFC0BDBBFF00000000000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FFA37753FFC85728FFC85728FFC857
      28FFC95728FF429962FF2E9544FF2E9545FF2E9545FF2F9545FF424E99FF1E35
      CCFF1E36CDFF1F35CCFF1F35CDFF424E99FF656587FF002A77FF003B8BFF003A
      88FF0048A5FF0042A0FF004CABFF003B8CFF002F7DFF282B67FF000000000000
      000000000000000000000000000000000000BB9578FFE8B077FFE5AF75FFEBB7
      7BFFF2C085FFF0BB7EFFDC8E4AFFE4924DFFEC9852FFEEA161FFE5AB84FFF8D2
      ACFFF7A86DFFF7AD79FFFDECD7FFA79B93FF008200FF008200FF008200FF0082
      00FF008200FF008200FF008200FF008200FF008200FF008200FF008200FF0082
      00FF008200FF008200FF008200FF000000FFA47854FFDC6B37FFDC6C37FFDC6B
      38FFDC6B37FF429962FF21A936FF21A937FF21A936FF21A936FF424E99FF3248
      D9FF3248D9FF3248D9FF3247D9FF424E99FF6B6A8AFF00398BFF0152B3FF0762
      C8FF127DEAFF015CC7FF0D75E6FF0255B4FF003F93FF2F3572FFA3A3A3FF9C9C
      9CFF828282FF000000000000000000000000B8A190FFF5BB81FFF0BC82FFF6C5
      88FFFDD094FFFACB8FFFD9823BFFE18238FFEE873BFFF49951FFECBA98FFFEDC
      BAFFFF944BFFFE9452FFFFF9EBFFABA39CFF008200FF848284FFC6C3C6FFC6C3
      C6FFC6C3C6FF848284FFC6C3C6FFC6C3C6FFC6C3C6FFC6C3C6FF848284FFC6C3
      C6FFC6C3C6FF848284FF008200FF000000FFA57955FFE47A46FFE57A46FFE47A
      47FFE47946FF429962FF20BD38FF20BC38FF20BD37FF20BC38FF424E99FF4C60
      E6FF4D61E6FF4C60E6FF4D61E5FF424E99FF6D6B93FF046FD9FF127EEBFF0968
      C6FF137EE5FF0962C3FF0969D0FF055CBFFF0365D9FF2C4495FF292929FF1514
      14FF565757FF777575FF0000000000000000BFB3ADFFE1945CFFDD935BFFE39C
      64FFE49E67FFE7A570FFE8AB7AFFE8AF83FFE7B18AFFE7B491FFD88E6CFFE4B0
      96FFE5C0AEFFE6C4B7FFEAC0B3FFA6948BFF008200FFC6C3C6FFFFFFFFFFFFFF
      FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFF
      FFFFFFFFFFFFC6C3C6FF008200FF000000FFA57A56FFEA8957FFEA8957FFEA8A
      57FFEA8957FF429962FF2FCD4EFF2FCE4DFF2FCD4EFF2FCE4DFF424E99FF6879
      F1FF6879F1FF6879F0FF6879F1FF424E99FF767497FF2173D1FF0088EFFF0072
      CEFF1179D7FF1583E3FF0A72CDFF0064BEFF0069D5FF2E4A9CFF20201FFF1503
      02FF71AFB5FF93E7EFFF817473FF00000000DCD9D8FFE6B279FFC27234FFE7AA
      6DFFCE6E26FFD86E23FFE4782AFFF6CB9CFFFAE3C1FFFAE7CBFFE6B59BFFEEC8
      B0FFEC7E42FFE97B47FFF9D9CBFFA99E98FF008200FFC6C3C6FFFFFFFFFFFFFF
      FFFF840000FF840000FF840000FF840000FF840000FF840000FF840000FF8400
      00FF840000FFC6C3C6FF008200FF000000FFA67B57FFEF986AFFEF9869FFEF98
      6AFFEF9869FF429962FF46DF6DFF47DE6EFF54E078FF5FE281FF737CB4FFA0AB
      FAFFA2ADFAFFA2ADFAFFA2ADFAFF717AB3FFB9B9BDFF999CAEFF7790C1FF4481
      D1FF056CC3FF0671CCFF1E6FC0FF5C91DFFF54658FFF2C2E42FF151A1BFF131B
      1DFF474C4CFF636E6EFF4B5558FFB2B2B2FFF7F7F7FFD7AD82FFF3C182FFF9CB
      90FFF0B679FFF0B174FFF3B478FFFCDDB4FFFFF2D5FFFFFAE5FFEBC4AEFFF7E3
      D5FFF8B996FFF5B290FFFFF4ECFFAAA19CFF008200FF848284FF00FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF848284FF008200FF000000FFA67C58FFF2A77DFFF3A77DFFF3A7
      7DFFF3A77DFF4FA06DFF7BEE9FFF86F0A6FF87F0A7FF87F0A7FF848CBCFFB8C1
      FBFFB8C1FBFFB8C1FBFFB8C1FBFF717AB3FF00000000CBCBCCFF7C7D7CFF706A
      6AFF6F80B3FF5074BDFF9897A6FFA78F8BFF3B3634FF081416FF1E2527FF8A51
      44FF874537FFC2381BFF9F8E87FFC4D7D8FF00000000C2A990FFEBA15CFFE3A1
      62FFEC9B54FFED8032FFF88C3CFFFC9244FFFFE3C3FFFFFFF9FFEDCBB9FFFAED
      E6FFF1AA87FFEC9E7CFFFFEFE7FFAAA29CFF008200FFC6C3C6FFFFFFFFFFFFFF
      FFFF00FFFFFFFFFFFFFFFFFFFFFF840000FFFFFFFFFFFFFFFFFF840000FF00FF
      FFFFFFFFFFFFC6C3C6FF008200FF000000FFA67C59FFF6B48FFFF6B58FFFF6B5
      90FFF7BE9DFF7AB892FF99F5B5FF98F5B6FF98F5B5FF98F4B6FF848CBCFFC7CE
      FBFFC7CEFBFFC7CEFBFFC7CEFBFF717AB3FF000000009A8C82FF6C5E53FF967E
      6CFFF4E1D4FFFFE6E4FFFFDCE1FFDBB9BDFF373435FF3D3532FFEC9E87FFFFBB
      9AFF9F6A5CFFFF9878FFFF9C80FF747776FF00000000B9A89CFFEEAD74FFE5A3
      6FFFE9AB79FFE59E6DFFE4996AFFE69A6DFFE8B89CFFEAC7B6FFDB9E88FFE6BC
      AEFFE3916EFFE08560FFF4CDBEFFA99D96FF008200FFC6C3C6FFFFFFFFFFC6C3
      C6FF008284FFC6C3C6FF840000FF00FFFFFFC6C3C6FF840000FFFFFFFFFF8400
      00FFFFFFFFFFC6C3C6FF008200FF000000FFA67D5AFFF8C09DFFF9C4A5FFFACE
      B3FFFAD0B6FF7CB994FFAEF7C4FFAEF8C4FFADF7C4FFADF8C4FF849FAEFF717A
      B3FF717AB3FF717AB3FF717AB3FF9DA2C2FFC2B7AFFFDCBAA6FFFFFFFCFFFFFF
      FFFFFFFFFFFFF4DDDEFFE1BFBFFFEAC5C6FF625756FF695148FFE1B19DFF9D85
      79FF6F5B56FFFFD0B6FFFFD1B5FF635C5AFF00000000CAC5C1FFF5BA7DFFED92
      49FFF4A768FFF46E1AFFF67825FFF57C33FFF37B3BFFF6CAAFFFEACCC2FFF2DC
      D5FFE29677FFDA7C60FFF1C7B9FFA89B94FF008200FF848284FFFFFFFFFF0082
      84FF848284FF008284FFFFFFFFFF840000FFFFFFFFFFFFFFFFFFC6C3C6FFFFFF
      FFFFFFFFFFFF848284FF008200FF000000FFA7805CFFFBD0B5FFFBD7BEFFFBD6
      BEFFFBD7BEFF7CB994FFC0FAD1FFC0FAD1FFC1FAD1FFC1FAD1FF5AA676FF0000
      000000000000000000000000000000000000B6A294FFFFF9F9FFFFFFFFFFFFFF
      FFFFFFF5F6FFF3DADBFFD8B4B4FFFBD3D3FFB1A4A4FF0F1211FF1E2628FF121E
      22FF1D2427FF958982FFD5B9AAFF818180FF00000000E7E5E5FFD1A382FFC1A4
      94FFD0AF99FFDBAC8DFFE3A785FFE9A37CFFE6956FFFE9B7A2FFE2B4A6FFE7C0
      B4FFE09070FFD66C4CFFF6D0C1FFAAA09AFF008200FFC6C3C6FFFFFFFFFFC6C3
      C6FF008284FFC6C3C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF
      FFFFFFFFFFFFC6C3C6FF008200FF000000FFB49475FFFCDCC5FFFCDDC5FFFCDD
      C5FFFBDCC5FF7CB994FFCEFBDAFFCEFBDAFFCEFBDAFFCEFBDAFF5AA676FF0000
      000000000000000000000000000000000000B69B8BFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFF7F9FFF2D8D9FFE3C4C5FFF4D9DAFFFFFFFFFFB3B8BBFF5B6164FF1F25
      2AFF292A2BFF2E3437FF4E5052FFC6C6C6FF00000000FCFCFCFFADABA6FF1AA2
      FCFF08B0FFFF0992FFFF579AF6FFFBF5EBFFFBF7F2FFFAF4F2FFFAF1EEFFEFCC
      BEFFE09C8DFFECCEC3FFF3DDD6FFA79890FF008200FFC6C3C6FF00FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFC6C3C6FF008200FF000000FFBC9F86FFFCE1CBFFFCE2CBFFFCE1
      CBFFFCE1CBFF96AE8EFF66AD81FF66AD81FF66AD81FF66AD81FF88B699FF0000
      000000000000000000000000000000000000B79682FFFFFFFFFFFFFFFFFFFFF6
      FCFFF4DCE0FFFAE4EAFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF5F2FF9884
      76FF808080FFABABABFF00000000000000000000000000000000CDB6ACFFB8B7
      B8FF9DB8C6FF8AABDAFF9AB7ECFFFCF6F0FFFFFFFDFFFFFFFFFFFFFFFFFFF9E6
      DDFFDF9078FFE19E8CFFF0C6BAFFA99F99FF008200FF848284FFC6C3C6FFC6C3
      C6FFC6C3C6FFC6C3C6FF848284FFC6C3C6FFC6C3C6FFC6C3C6FF848284FFC6C3
      C6FFC6C3C6FF848284FF008200FF000000FFBCA086FFFCE6D1FFFCE6D0FFFCE6
      D1FFFCE6D1FFB7997EFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000BFB4ACFFB89F8EFFC3A293FFDBB8
      B0FFE7C9C6FFD8B7AEFFCFAFA2FFC2A797FFBAA392FFBAA596FFBEACA0FFC8C5
      C2FF00000000000000000000000000000000000000000000000000000000FDF9
      F8FFFCF5F3FFF9ECE7FFF4DED6FFEED3CAFFEBCBC1FFE9C4B9FFE8C1B5FFE6BC
      AFFFE3B3A6FFE4B5A7FFEBBFB1FFB5A9A3FF008200FF008200FF008200FF0082
      00FF008200FF008200FF008200FF008200FF008200FF008200FF008200FF0082
      00FF008200FF008200FF008200FF00000000BCA086FFFCECD8FFFCECD8FFFCEC
      D8FFFCECD8FFB7997EFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BFB4ACFFB8A2
      93FFBBA191FFB8A293FFB9A99DFFC3BBB6FFCAC8C7FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6B5A5FFB99B81FFB99B81FFB99B
      81FFB99B81FFC4B3A3FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF5459FFF70307FFFF2B30FFFFA2A5FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A8B9D0FF4174AAFF6291
      BAFF9DB7CCFFDBE8F3FFE0E9F2FFE8ECF2FFF7F7F8FF00000000000000000000
      0000000000000000000000000000000000008F877AFF909DB2FF006794FF8997
      9CFFE5E0DDFFE0DCD9FFE0DCD9FFE0DCD9FFE0DCD9FFE0DCD9FFE5E0DDFF0000
      0000000000000000000000000000000000000000000000000000000000007156
      58AAFF2B30FFFF4851FFFF2B30FFF70307FF715658AA00000000000000000000
      000000000000000000000000000000000000000000000000000000000000C7C1
      BAFFA57653FF93562CFF804417FF713A11FF8D572EFF9E795AFFA8998DFF0000
      000000000000000000000000000000000000EEF0F2FF7C8EA4FF2A8CBFFF24BA
      F4FF23A3E0FF2994CEFF3C93C7FF5B9DC6FF91B6D0FFC1D5E7FFECF0F5FF0000
      0000000000000000000000000000000000008FB6D3FF1B9BDCFFA89F8DFFCBB7
      90FFCEBA99FFD1C1A2FFD0C1A2FFCFC0A2FFD0C1A2FFD1C1A2FF916F31FF0000
      000000000000000000000000000000000000000000000000000000000000FF37
      38FFFF4851FFFF4851FFFF4851FFFF2B30FFFF3738FF00000000000000000000
      0000000000000000000000000000000000000000000000000000C8C5C1FF9C60
      37FF8D4C28FF874A28FFA05C37FFB86F4AFFCA916BFFD4AB8DFF7B685AFF9B85
      76FF00000000000000000000000000000000E6EAF0FF798699FF498AA9FF35C8
      F2FF33D2FBFF33D2FBFF37D3FAFF3ACFF6FF33B6E3FF3F9CCAFFA8BFD2FFFAFA
      FAFF000000000000000000000000000000009ACAE8FF84D4FEFF779AB6FFB5AA
      9AFFF5DFBBFFF8E3C2FFF5E1C1FFF5E2C1FFF5E2C1FFF6E3C1FFB09873FF0000
      0000000000000000000000000000000000000000000000000000FF787AFFFF48
      51FFFF646AFFFF4851FFFF646AFFFF4851FFFF2B30FF715658AA000000000000
      0000000000000000000000000000000000000000000000000000B79D88FFB15F
      37FF90502EFF63361FFF5E3823FF6B432FFF9E715AFFC3A895FFCFB6A1FFD1B4
      A1FFC6A695FFCCBBB1FF0000000000000000DFE6EEFF6C7A93FF698496FF3FC6
      ECFF32D4FCFF35D6FCFF45E0FDFF59EDFDFF5FF0FDFF4BD1EEFF7AADCAFFEEF0
      F3FF00000000000000000000000000000000D9E4EEFF9BDAFAFF86CFFDFF2B8C
      CAFFAA9F8FFFF5D9AEFFF3D9B3FFEFD6B1FFEFD6B0FFF0D7B1FFAE936BFF0000
      00000000000000000000000000000000000000000000715658AAFF3738FFFF64
      6AFFFF646AFFFF646AFFFF646AFFFF4851FFFF4851FFFF3738FF000000000000
      0000000000000000000000000000000000000000000000000000BCAA9CFFA862
      3FFF73432BFF6A422DFFAA8269FFD3B5A3FFE0C2ADFFDCBFA7FFE7C8AFFFF0CF
      B6FFF0D3BBFFDFBDA7FFC6B8B1FF00000000DAE3EDFF5E7390FF8D8B8FFF4193
      BDFF30D5FEFF2FD3FEFF46E1FFFF6DF2FFFF85FAFEFF71EDFDFF5CAACEFF9097
      A0FF828282FF000000000000000000000000000000007DB6E0FFA5D5EDFF88CC
      EFFF009CDCFFB7B9B0FFFAE7C2FFFBE9C7FFF9E7C6FFF9E7C4FFB09872FF7778
      89FF555576FFC7C7C8FF000000000000000000000000FF3B41FFFF5459FFFF64
      6AFFFF646AFFFF646AFFFF646AFFFF646AFFFF646AFFFF2B30FFFF787AFF0000
      0000000000000000000000000000000000000000000000000000000000009B78
      60FFA07E69FFD9BBA8FFD3AD93FFD6B39AFFE0C0A8FFEAC6B1FFFEDFC8FFFFF1
      DAFFFFF0D6FFF9D8BCFFD2A98FFF00000000D6E2ECFF577492FF9A908DFF8E9B
      A9FF6393B1FF5698BDFF58AED2FF77D8EEFFA4F6FFFFA4F7FFFF60C0E0FF9DB5
      C6FF565757FF777575FF000000000000000000000000E2E9F2FFBDB6AAFFECE7
      D1FFA4D4E9FF60AECFFFF3E9D2FFFFF6DBFFFFF4D9FFFEF1D5FFB19A77FF0000
      4BFF4F4D38FF75717BFF0000000000000000FF9A9CFFFF3738FFFF747AFFFF70
      72FFFF7072FFFF646AFFFF646AFFFF646AFFFF646AFFFF4851FFFF3738FF4031
      3180000000000000000000000000000000000000000000000000C5BAB6FFC09D
      8AFFDAB194FFCA9F84FFBA947AFFAC8B73FFE1BAA5FFF0D2BCFFFFE9D3FFFFFF
      ECFFFFFFF6FFFFEBD8FFCE9A7EFF00000000B8CADAFF618AA5FF998D8BFFCBC8
      C7FFE9E9E9FFF1F1F2FFCFD6DEFF77A1BCFF8DE2F2FFA7F3FDFF86EAF9FF5F95
      BBFF71AFB5FF93E7EFFF817473FF000000000000000000000000DCD2C4FFFEF1
      D7FFFEF6DFFFF6F2E1FFFBF6DFFFF6F6D8FFFFFAE6FFFEF2DBFFAE9976FF0000
      EEFF73C1FFFFAAFFD9FF8E7E77FF00000000FF3738FFFF747AFFFF7C7AFFFF74
      7AFFFF747AFFFF7072FFFF4851FFFF2B30FFFF646AFFFF646AFFFF4851FFFF54
      59FF0000000000000000000000000000000000000000CAC7C6FFB38C78FFDAAD
      8DFFD8A787FFDAAB8DFFB59079FF886A5BFF9E8679FFFFDCCDFFFFEBDCFFFFF9
      ECFFFFFFF5FFFFF0DFFFCC9C7EFF000000005E80A8FF71A0B5FFA39997FFB0A7
      A5FFC0B8B6FFC5BEBCFFC4BDBBFFBFC6CFFF96C6DDFF8FCCE3FF87C8DDFF5993
      BBFF474C4CFF636E6EFF4B5558FFB2B2B2FF0000000000000000DED6CBFFFAF2
      E1FFFFFAE9FFFFFCEEFF9FDB94FF00C900FFD5EBC8FFFEF3E3FFB09878FF0000
      FFFF0912FFFF4259E7FF474763FFBCBCB9FFFF3738FFFF868CFFFF868CFFFF86
      8CFFFF7C7AFFFF7072FFFF3738FFFF5459FFFF4851FFFF646AFFFF646AFFFF2B
      30FF4031318000000000000000000000000000000000A5887BFFE0B89EFFD9A5
      86FFE0AD90FFEABB9FFFEFC2AAFF58463EFF312B27FFFBDAC6FFFFEADAFFFFEF
      E0FFFFF0E3FFFFE5D4FFC49E89FF000000005C7DA8FF5388ABFF728698FF7D8A
      95FF9A9FA1FFA9A4A2FFAEA4A2FFADA3A0FF9A9599FF83858EFF7E8289FF7A69
      6FFF874537FFC2381BFF9F8E87FFC4D7D8FF0000000000000000C4BDB2FFFFFC
      F2FFFFFFF8FFFFFFF9FFCAE2C4FFB3D8ACFF00BC00FFD6E3C3FFC3A295FF3200
      8EFF34006FFF410012FF6276C1FFDCE1E1FFFF787AFFFF646AFFFFA2A5FFFF8E
      94FFFF868CFFFF3738FF715658AA00000000FF2B30FFFF646AFFFF646AFFFF48
      51FFFF3738FF00000000000000000000000000000000AA8472FFD6A383FFE0AE
      91FFF0C3A8FFFFD9C0FFFFE4CCFFF3C8B4FF231E1AFF7D695FFFFFE3D0FFFFE5
      D3FFFFE6D3FFE5B69BFFCCC3BEFF00000000E6EBF2FF9B9DA0FFABB4BEFF9BA9
      BAFF8A9CB4FF7D92B0FF748AABFF617393FF7A7D8DFFA29795FFC5998BFFFBB8
      98FF9F6A5CFFFF9878FFFF9C80FF747776FF00000000A19287FFBDB0A2FFCFC2
      ABFFEDE3D2FFF4ECE0FFFFFFFDFFFFFFFEFFDEF0DBFFE8EAD8FFB39880FFD54E
      00FF5E1774FFC33D00FF9A3F47FF7C7DC1FF00000000FF3738FFFF646AFFFFA2
      A5FFFF5459FFFF787AFF0000000000000000715658AAFF2B30FFFF646AFFFF48
      51FFFF2B30FF715658AA000000000000000000000000784833FFD8A78AFFE9BC
      9EFFFFE0C2FFFFFFECFFFFFFF5FFFFF0D8FF50453CFF2E2925FFF1CCB8FFFFE3
      CEFFF6CAB3FFCAB2A4FF0000000000000000C2B7AFFFDCBAA6FFFFFFFCFFFFFF
      FFFFFFFFFFFFF4DDDEFFE1BFBFFFEAC5C6FF625756FF695148FFE1B19DFF9D85
      79FF6F5B56FFFFD0B6FFFFD1B5FF635C5AFFC6BDB9FFEFBB9EFFFFFFFFFFFFFF
      FFFFFFFFFFFFE6E1DBFFE3DED5FFEBE2D9FFF5DDD2FFDAC5AEFFC0464DFF6625
      B5FF3E11C4FFFF6700FFE14D14FF6D6DA7FF0000000000000000FF787AFFFF37
      38FFFF3738FF00000000000000000000000000000000FF8A8CFFFF4851FFFF64
      6AFFFF4851FFFF2B30FF000000000000000000000000AF8065FFD8AA8CFFECC1
      A7FFFFECD3FFFFFFFEFFFFFFFFFFFFFBE7FFBDA291FF272323FF6D6158FFE4BC
      A6FFCEB6A7FF000000000000000000000000B6A294FFFFF9F9FFFFFFFFFFFFFF
      FFFFFFF5F6FFF3DADBFFD8B4B4FFFBD3D3FFB1A4A4FF0F1211FF1E2628FF121E
      22FF1D2427FF958982FFD5B9AAFF818180FFBCA99AFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFCD1D1FFFFE8D0FFCCB6D7FF0000D5FF0000FFFF0000
      FFFF0000FFFF7C32CEFFAE476FFF9494B7FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF3B41FFFF48
      51FFFF4851FFFF2B30FFFF5459FF0000000000000000BE9F8DFFCE9E7EFFE7BC
      A3FFFFD9C4FFFFF1DAFFFFF8DBFFFFE9D4FFFDDBC8FF73716EFF33312FFF5551
      4FFF00000000000000000000000000000000B69B8BFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFF7F9FFF2D8D9FFE3C4C5FFF4D9DAFFFFFFFFFFB3B8BBFF5B6164FF1F25
      2AFF292A2BFF2E3437FF4E5052FFC6C6C6FFBB9D89FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFCFEFFFFE4E4FFFFF0EFFFFFFFFFFFDFEBFFFF555FFFFF0000
      FFFF0000FFFF070CFDFF4D4EBBFF000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF2B
      30FFFF4851FFFF4851FFFF2B30FF715658AA00000000CCCACAFFC19A84FFC891
      73FFEBBDA3FFFACDB8FFF5C8B4FFE9BAA2FFC3A08AFF636260FF1B1817FF433F
      3CFF00000000000000000000000000000000B79682FFFFFFFFFFFFFFFFFFFFF6
      FCFFF4DCE0FFFAE4EAFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF5F2FF9884
      76FF808080FFABABABFF0000000000000000BC967CFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFFA58A
      92FF8686AEFFB9B9C4FF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFD3
      D6FFEF0307FFFF2B30FFFF2B30FFFF2B30FF000000000000000000000000CCC6
      C2FFCBB7A9FFC9B2A3FFCAB6AAFFCDC2BBFF00000000C8C8C8FF676461FF706F
      6CFF00000000000000000000000000000000BFB4ACFFB89F8EFFC3A293FFDBB8
      B0FFE7C9C6FFD8B7AEFFCFAFA2FFC2A797FFBAA392FFBAA596FFBEACA0FFC8C5
      C2FF00000000000000000000000000000000C4BAB3FFBDA18DFFCFA893FFEEC2
      B3FFFED3CCFFEBC0B3FFDDB8A5FFCBA993FFC4A691FFBCA492FFC4B19FFFCBCA
      C9FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFEFF7FFFF787AFFF70307FFEF0307FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BFB4ACFFB8A2
      93FFBBA191FFB8A293FFB9A99DFFC3BBB6FFCAC8C7FF00000000000000000000
      0000000000000000000000000000000000000000000000000000C5BCB7FFBEA5
      93FFC2A38FFFBCA290FFBFAFA2FFC7C1BEFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C1BBFFB097
      81FFA68467FF997051FF9D6D48FF676666FF6E6560FFB3967DFFC7C2BDFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000C6928FF0B6D26FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B8A593FF90572FFF863A0DFF913E
      0FFF853B0FFF8A3F08FF754728FF6D6D6DFF3C2C1DFF1FA02CFF1EA02BFF9662
      3CFFC9C6C3FF00000000000000000000000000000000DAB395FF80674FFF805F
      4FFF805F4FFF6F5F4FFF6F573FFF6F573FFF6F4F3FFF6F4F3FFF5F472FFF5F47
      2FFF5F472FFFAF8C6EFF0000000000000000086424FF177932FF177932FF1779
      32FF187933FF0F712FFF0FB24CFF097128FF0000000000000000000000000000
      000000000000000000000000000000000000B18C75FFA0775FFF905F3FFF9057
      3FFF90573FFF874829FF000000000000000000000000B48564FF9C745CFFA06F
      4FFF90573FFF904F2FFF763717FF0000000083441AFF963A08FFAA470FFFAA4A
      0FFF99490DFF9B4B0BFF836A5EFF717171FF1FA02CFF43EE74FF40FF7CFF1EA0
      2BFFADA892FF0B000B370000000000000000D3B39AFFA48B82FFE0D0C0FFB0A0
      90FFB0A090FFB0A090FFB0A090FFB0A090FFB0A090FFB0A090FFB0A090FFB0A0
      90FFB0A090FF5F472FFF000000000000000009762DFF14D860FF14D860FF14D8
      60FF14D861FF16DB63FF16DC65FF17D35FFF0A7D2EFF89B07EFFA87556FFA876
      56FFA8704EFFA56D4BFFA76F4EFFB48F76FFB09080FFFFF8FFFFE0C8C0FFD0A0
      90FFC0805FFF803F1FFF000000000000000000000000B0805FFFF0E8E0FFE0C8
      C0FFD0A890FFB0774FFF80471FFF0000000094623CFFA34711FFBB5A17FFB05A
      17FFA95811FFA97347FF736B67FF1EA02BFF26F54AFF2CFF58FF47E878FF3DFF
      70FF1EA02BFF2F7D3AFF61A267FFBFC8C0FFC8AD97FFB39B91FFFFE8E0FFFFF8
      F0FFFFF0E0FFFFE8E0FFF0D8D0FFF0D0B0FFF0C0A0FF00A000FF00A000FF00A0
      00FF6F573FFF5F472FFF8D6F56FF0000000009752DFF14C85BFF14C85BFF14C8
      5BFF14C85BFF14C85BFF14C95CFF13C258FF0D863AFF297537FFC0A692FFFFF0
      D4FFFFEDCBFFE3C195FFCD9A73FFA8826AFFB09080FFFFF8FFFFE0C8C0FFD0A0
      90FFC0805FFF803F1FFF000000000000000000000000B0805FFFF0E8E0FFF0E0
      E0FFE0C0B0FFC0886FFF80472FFF00000000B9A695FF984D21FFB76934FFAC5F
      30FFA95C2BFFE9E3DCFF1FA02CFF26F54AFF22E541FF1EA02BFF1FA02CFF3FE2
      6CFF31FF61FF1EA02BFF006319FF2E8535FFB49383FFE0D8D0FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFF0F0FFF0E0E0FFF0D8C0FF00FF0FFF00FFB0FF00A0
      00FF80674FFF6F4F3FFF5F472FFF00000000056222FF087230FF087230FF0872
      30FF087431FF12BB55FF12C158FF0D9C44FF43662BFFF9EBD3FFC3AB9CFFFFF3
      DCFFFFF0D4FFE0C19CFFC7946DFF9F7962FFB09080FFFFF8FFFFE0C8C0FFD0A0
      90FFC0805FFF803F1FFF000000000000000000000000B0805FFFF0E8E0FFF0E0
      E0FFE0C0B0FFC0886FFF80472FFF0000000000000000A07454FFA96B41FFB45E
      36FFBD876DFFD8CFCAFF86A3B2FF1FA02CFF1FA02CFFAD613BFF956136FF1EA0
      2BFF4AFF8CFF25FF4AFF1EA02BFF49974EFFB09080FFF0E8E0FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0FFF0E8E0FF00FF0FFF00FF0FFF00A0
      00FF906F5FFF6F5F4FFF5F472FFF0000000000000000957669FF857665FF8576
      65FF857665FF045F20FF0A913EFF43652BFF94766CFF93756BFFAD907EFFA385
      6CFFA27E66FFA58161FFBE8963FF9F7862FFC09880FFFFFFFFFFF0E8E0FFE0C8
      C0FFD0A080FF803F1FFF000000000000000000000000B0805FFFF0E8E0FFF0E0
      E0FFE0C0B0FFC0886FFF80472FFF000000000000000000000000AF947EFFB46D
      47FFCFB09FFF6D9AB3FF41A7E8FF3E80B1FFC58B6FFF6B5E27FF2A7328FFB3CB
      B7FF1EA02BFF3DFF79FF24FF4AFF1EA02BFFB09880FFD0C0B0FFD0B8B0FFC0B0
      A0FFB0A090FFB09880FFA08880FF90806FFF906F5FFF80675FFF805F4FFF6F57
      4FFF90806FFF80675FFF6F573FFF0000000000000000A87657FFFDF7EBFFF8F0
      E4FFFAF3E7FF076020FF44662DFFEDF0F3FFEDEEF3FFEFEDEEFFBCA496FFFEF8
      EEFFFEF6E8FFF8EAD6FFBF8860FF9F7862FFC3A494FFB0886FFFA0674FFF904F
      2FFF80472FFF80471FFF80370FFF8F4B25FFB0886FFFA0674FFF90572FFF9047
      2FFF803F1FFF6F370FFF90572FFF00000000000000000000000000000000C9C9
      C8FF5B80A0FF3899E0FF4CB1EAFF2FA0E7FF196B95FF43602BFFA09F8BFFB6A2
      98FF336324FF1EA02BFF45FF82FF1FA02CFFC0A090FFFFF8F0FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0FFFFF0F0FFF0F0F0FFF0E8
      E0FFA08880FF90775FFF805F4FFF0000000000000000AA795AFFFEF8EDFFFAF3
      E7FFFEF8EDFFA0897AFFEDF4F3FFEDF4F3FFEDF2F3FFEFEFF0FFB19586FFFEFA
      F2FFFEF8EEFFFAF0DFFFBD865FFF9F7761FFDEC4B4FFB0886FFFFFFFFFFFE0D0
      C0FFD0A090FFA06F4FFF803F0FFFD5B89CFFB0906FFFE0D8D0FFF0D8D0FFD0A0
      90FFB0774FFF80371FFFCFA98AFF00000000000000000000000000000000AEC2
      CDFF2E8FE8FF57BAF9FF54B8F0FF35AAEEFF1692E8FF7994ABFFBDBBBAFFA9A5
      A3FF33492BFF16363EFF1EA02CFF00000000DFC5AEFFB9A089FFD0B0A0FFC0A8
      A0FFD0B0A0FFC0A090FFB09080FFA0806FFF906F5FFF805F4FFF6F5F4FFF806F
      5FFFB0A090FFA0886FFF805F4FFF0000000000000000A87658FFA99184FFA890
      82FFA89184FFA2897AFFA28B7CFFA28B7CFFA78B7CFFA88878FFA68575FFAA8A
      7AFFA98875FFA7856FFFA36D4BFF9E7660FF00000000C09080FFF0F0F0FFFFF8
      F0FFF0D8C0FFB0805FFF80471FFF965631FFB0906FFFFFFFFFFFFFF8F0FFF0D0
      C0FFB0774FFF80471FFF00000000000000000000000000000000BAC6CCFF4693
      DDFF58A5ECFF74CAFDFF57BDF4FF35AAEEFF1799EEFF1C70B4FF3C9FE3FF3180
      BAFF062E59FF23446CFFB3BAC0FF0000000000000000D9C3AFFFC0B0A0FFE0C8
      C0FFFFFFFFFFFFF8FFFFFFF8FFFFFFF0F0FFF0F0E0FFF0E0E0FFC0A8A0FF805F
      4FFFA09080FFC0B0A0FF805F4FFF0000000000000000AA795CFFEEE8E3FFE6DD
      D7FFF0EAE6FFB09583FFF9F7F6FFF9F7F6FFFDFCFCFFFCFCFBFFAD8E7EFFFFFF
      FFFFFFFDFBFFFDF7F0FFBE8B66FF9E755FFF00000000F8E2D2FFC09880FFB080
      5FFFA0674FFF904F2FFF90573FFF9D6741FFB0775FFFB0886FFFA06F4FFF8047
      2FFF80471FFFECC4A7FF00000000000000000000000000000000BAC6CCFF4273
      AAFF7DACD8FFB6E3FFFF68C7FAFF35AAEEFF1799EEFF146AB6FF55B6F0FF40B0
      EEFF0F6FBFFF335A89FF00000000000000000000000000000000F0D9C5FFC0B0
      A0FFFFFFFFFFF0E8E0FFD0C8C0FFD0C8C0FFD0B8B0FFD0C0B0FFE0D0D0FF8067
      5FFF805F4FFFB09890FFB0A090FF0000000000000000B49481FFFFFFFDFFEFE8
      E4FFFFFFFDFFB19785FFFDFDFDFFFDFDFDFFFDFDFDFFFBFAFAFFAD8D80FFFFFF
      FFFFF5F5F9FFE9E8EFFFA9816EFF9F7561FF0000000000000000C09880FFFFF8
      FFFFE0C0B0FFC0906FFF80471FFF00000000C09880FFFFF8FFFFE0C8B0FFD0A0
      80FF80471FFF000000000000000000000000000000000000000000000000234B
      80FF083574FF244E86FF4B9FD2FF36ABF0FF1690E3FF2765A3FF66C4F9FF40B0
      EEFF1691E4FF35689AFF0000000000000000000000000000000000000000E0C8
      B1FFF0E8E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FFFFFFF0F0FFF0E0D0FFD0B8
      B0FF805F4FFFC5AA97FF0000000000000000CBCBCBFF5A508DFF5453AFFF3C38
      98FF3B3BA5FF3333A3FF453F98FF302FA1FF1C1C99FF191798FF141497FF1212
      99FF11119CFF11119DFF111194FF51436FFF0000000000000000CFB1A1FFB090
      80FFA0674FFF904F2FFF875038FF00000000C0A890FFB09080FFA0674FFF904F
      2FFF864E36FF00000000000000000000000000000000000000000000000098A9
      B8FF134B8EFF0F4B97FF0F4689FF1F69A3FF0F4B8AFF366298FF9EDDFFFF43B4
      F1FF1489DDFF7493ADFF0000000000000000000000000000000000000000F6DF
      CCFFD0B8B0FFFFFFFFFFF0F0F0FFD0C8C0FFD0C8C0FFD0B8B0FFC0B0B0FFE0D8
      D0FF806F5FFF876656FF000000000000000000000000393495FF3B3ACAFF3A3A
      CFFF3636D0FF3333CDFF2F2FC7FF2A2AC7FF2424C2FF2222BFFF1D1DBEFF1A1A
      B8FF1616BAFF1414B7FF1212AAFF282894FF000000000000000000000000B183
      6CFFFFF8F0FF814426FF000000000000000000000000B08067FFFFF8F0FF8042
      23FF000000000000000000000000000000000000000000000000000000000000
      0000A4B2BDFF4977A0FF276198FF1F568DFF114A8AFF11498EFF316A9FFF3CA7
      E3FF1488DBFF8CA7BAFF00000000000000000000000000000000000000000000
      0000E9D1C3FFE1D1D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FFFFF0E8
      E0FFD0B8B0FF805F4FFFEDD5C2FF00000000000000007170A9FF3331A3FF6363
      82FF4C4B99FF403F98FF74747DFF3A38AAFF4A498EFF5F5F8AFF2F2EA5FF5F5F
      80FF3F3C90FF2322A0FF191792FF4D4DA9FF000000000000000000000000C7A8
      98FFB48D74FF9D6742FF000000000000000000000000CEAE9CFFB48C73FF9C65
      3FFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000829AB0FF145499FF1155A0FF1253
      97FF104E8DFF9BABB9FF00000000000000000000000000000000000000000000
      000000000000E9D2C4FFD0C0B0FFD0C0B0FFD0C0B0FFD0C0B0FFD0C0B0FFD0C0
      B0FFD0C0B0FFD0C0B0FF000000000000000000000000000000009B9BB9FF8181
      86FF8E8E92FF747475FF9A9A9AFF7C7C83FF72727AFF97979FFF757579FF8181
      85FF8D8D92FF787881FFA1A1BCFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B98AEFF1A5794FF1554
      93FF6387A5FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000ABAB
      ABFF8F8F8FFFC2C2C2FF8F8F8FFF919191FFC9C9C9FF8A8A8AFF959595FFC2C2
      C2FF8F8F8FFFAAAAAAFF0000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
end
