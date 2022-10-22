object FrmMainOrder: TFrmMainOrder
  Left = 0
  Top = 0
  ClientHeight = 776
  ClientWidth = 867
  Caption = ''
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFrameCreate
  PixelsPerInch = 96
  TextHeight = 13
  object HeaderPageCOntrol: TUniPageControl
    Left = 0
    Top = 28
    Width = 867
    Height = 344
    Hint = ''
    ActivePage = UniTabSheet1
    TabBarVisible = True
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    LayoutConfig.Region = 'north'
    TabOrder = 0
    object UniTabSheet1: TUniTabSheet
      Hint = ''
      Caption = 'General'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object UniFieldSet1: TUniFieldSet
        Left = 0
        Top = 0
        Width = 285
        Height = 316
        Hint = ''
        Title = ' '
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        ExplicitHeight = 292
        object dbeOrderNo: TUniDBEdit
          Left = 20
          Top = 3
          Width = 150
          Height = 22
          Hint = ''
          DataField = 'ORDERNO'
          DataSource = OE_DM.SrcOrders
          TabOrder = 1
          FieldLabel = 'Order#'
          FieldLabelSeparator = ' '
        end
        object dbeCustNo: TUniDBEdit
          Left = 19
          Top = 26
          Width = 150
          Height = 22
          Hint = ''
          DataField = 'CUSTNO'
          DataSource = OE_DM.SrcOrders
          TabOrder = 2
          FieldLabel = 'Customer #'
          FieldLabelSeparator = ' '
        end
        object dblcbBillTo: TUniDBLookupComboBox
          Left = 19
          Top = 50
          Width = 150
          Hint = ''
          ListField = 'ATTN'
          ListSource = OE_DM.SrcBill_To
          KeyField = 'ID'
          ListFieldIndex = 0
          DataField = 'BILL_TO_ID'
          DataSource = OE_DM.SrcOrders
          TabOrder = 3
          Color = clWindow
          FieldLabel = 'Bill To'
        end
        object dblcbShipTo: TUniDBLookupComboBox
          Left = 19
          Top = 73
          Width = 150
          Hint = ''
          ListField = 'ATTN'
          ListSource = OE_DM.SrcShip_To
          KeyField = 'ID'
          ListFieldIndex = 0
          DataField = 'SHIP_TO_ID'
          DataSource = OE_DM.SrcOrders
          TabOrder = 4
          Color = clWindow
          FieldLabel = 'Ship To'
          FieldLabelSeparator = ' '
        end
        object dbContact1: TUniDBLookupComboBox
          Left = 19
          Top = 96
          Width = 150
          Hint = ''
          ListField = 'NAME'
          ListSource = OE_DM.SrcContact
          KeyField = 'ID'
          ListFieldIndex = 0
          DataField = 'CONTACT_ID'
          DataSource = OE_DM.SrcOrders
          TabOrder = 5
          Color = clWindow
          FieldLabel = 'Contact'
        end
        object UniDBLookupComboBox1: TUniDBLookupComboBox
          Left = 19
          Top = 120
          Width = 150
          Hint = ''
          ListField = 'NAME'
          ListSource = OE_DM.SrcSOContact
          KeyField = 'ID'
          ListFieldIndex = 0
          DataField = 'CONTACT_ID2'
          DataSource = OE_DM.SrcOrders
          TabOrder = 6
          Color = clWindow
          FieldLabel = 'SO Contact'
        end
        object wwDBLookupComboOrderDivision: TUniDBLookupComboBox
          Left = 19
          Top = 145
          Width = 150
          Hint = ''
          ListField = 'NAME'
          ListSource = OE_DM.SrcDivision
          KeyField = 'ID'
          ListFieldIndex = 0
          DataField = 'DIVISION_ID'
          DataSource = OE_DM.SrcOrders
          TabOrder = 7
          Color = clWindow
          FieldLabel = 'Division'
          FieldLabelSeparator = ' '
        end
        object UniDBEdit1: TUniDBEdit
          Left = 19
          Top = 168
          Width = 150
          Height = 22
          Hint = ''
          DataField = 'DROPSHIPPONO'
          DataSource = OE_DM.SrcOrders
          TabOrder = 8
          ReadOnly = True
          FieldLabel = 'Drop Ship PO#'
        end
        object UniDBCheckBox1: TUniDBCheckBox
          Left = 19
          Top = 193
          Width = 150
          Height = 17
          Hint = ''
          DataField = 'FREE_FORM'
          DataSource = OE_DM.SrcOrders
          Caption = 'Free Form'
          TabOrder = 9
          FieldLabelWidth = 120
        end
        object UniDBCheckBox2: TUniDBCheckBox
          Left = 19
          Top = 214
          Width = 150
          Height = 17
          Hint = ''
          DataField = 'SHIP_COMPLETE'
          DataSource = OE_DM.SrcOrders
          Caption = 'Ship Complete'
          TabOrder = 10
          FieldLabelWidth = 120
        end
        object DBComment1: TUniDBEdit
          Left = 19
          Top = 231
          Width = 150
          Height = 22
          Hint = ''
          DataField = 'COMMENT1'
          DataSource = OE_DM.SrcOrders
          TabOrder = 11
          FieldLabel = 'SO Note'
        end
      end
      object UniSplitter4: TUniSplitter
        Left = 285
        Top = 0
        Width = 6
        Height = 316
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object UniFieldSet3: TUniFieldSet
        Left = 291
        Top = 0
        Width = 262
        Height = 316
        Hint = ''
        Title = ' '
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 2
        ExplicitLeft = 289
        ExplicitTop = -440
        ExplicitHeight = 320
        object UniDBEdit2: TUniDBEdit
          Left = 6
          Top = 3
          Width = 121
          Height = 22
          Hint = ''
          DataField = 'ORD_BY'
          DataSource = OE_DM.SrcOrders
          TabOrder = 1
          FieldLabel = 'Taken By'
        end
        object dbFob: TUniDBLookupComboBox
          Left = 6
          Top = 27
          Width = 145
          Hint = ''
          ListField = 'DESCRIP'
          ListSource = OE_DM.SrcFob
          KeyField = 'DESCRIP'
          ListFieldIndex = 0
          DataField = 'FOB'
          DataSource = OE_DM.SrcOrders
          TabOrder = 2
          Color = clWindow
          FieldLabel = 'FOB'
        end
        object UniDBEdit5: TUniDBEdit
          Left = 6
          Top = 51
          Width = 121
          Height = 22
          Hint = ''
          DataField = 'PONO'
          DataSource = OE_DM.SrcOrders
          TabOrder = 3
          FieldLabel = 'PO #'
        end
        object UniDBLookupComboBox2: TUniDBLookupComboBox
          Left = 6
          Top = 75
          Width = 145
          Hint = ''
          ListField = 'DESCRIPTION'
          ListSource = OE_DM.SrcTerms
          KeyField = 'ID'
          ListFieldIndex = 0
          DataField = 'TERMS_ID'
          DataSource = OE_DM.SrcOrders
          TabOrder = 4
          Color = clWindow
          FieldLabel = 'Terms'
        end
        object UniDBLookupComboBox3: TUniDBLookupComboBox
          Left = 6
          Top = 98
          Width = 145
          Hint = ''
          ListField = 'DESCRIP'
          ListSource = OE_DM.SrcFreightLookup
          KeyField = 'ID'
          ListFieldIndex = 0
          DataField = 'FREIGHT_ID'
          DataSource = OE_DM.SrcOrders
          TabOrder = 5
          Color = clWindow
          FieldLabel = 'Ship Via'
        end
        object UniDBEdit6: TUniDBEdit
          Left = 6
          Top = 122
          Width = 121
          Height = 22
          Hint = ''
          DataField = 'CRM_RFQNO'
          DataSource = OE_DM.SrcOrders
          TabOrder = 6
          FieldLabel = 'CRM RFQ #'
        end
        object UniDBEdit7: TUniDBEdit
          Left = 6
          Top = 147
          Width = 121
          Height = 22
          Hint = ''
          DataField = 'REV'
          DataSource = OE_DM.SrcOrders
          TabOrder = 7
          FieldLabel = 'Revision'
        end
        object UniDBEdit8: TUniDBEdit
          Left = 6
          Top = 172
          Width = 121
          Height = 22
          Hint = ''
          DataField = 'CRM_OPPORTUNITY_NO'
          DataSource = OE_DM.SrcOrders
          TabOrder = 8
          FieldLabel = 'Opportunity #'
        end
        object UniDBEdit9: TUniDBEdit
          Left = 6
          Top = 197
          Width = 121
          Height = 22
          Hint = ''
          DataSource = OE_DM.SrcOrders
          TabOrder = 9
          FieldLabel = 'Campaign Code'
        end
        object UniDBEdit10: TUniDBEdit
          Left = 6
          Top = 223
          Width = 121
          Height = 22
          Hint = ''
          DataField = 'SHIP_TO_SO_NOTE'
          DataSource = OE_DM.SrcOrders
          TabOrder = 10
          FieldLabel = 'Ship To Note'
        end
        object UniDBEdit3: TUniDBEdit
          Left = 6
          Top = 248
          Width = 150
          Height = 22
          Hint = ''
          DataField = 'CUST_SO_NOTE'
          DataSource = OE_DM.SrcOrders
          TabOrder = 11
          FieldLabel = 'Customer Note'
        end
      end
      object UniSplitter5: TUniSplitter
        Left = 553
        Top = 0
        Width = 6
        Height = 316
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object UniFieldSet4: TUniFieldSet
        Left = 559
        Top = 0
        Width = 300
        Height = 316
        Hint = ''
        Title = ' '
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 4
        ExplicitLeft = 599
        ExplicitWidth = 276
        ExplicitHeight = 320
        object UniDBEdit4: TUniDBEdit
          Left = 6
          Top = 3
          Width = 121
          Height = 22
          Hint = ''
          DataField = 'EPLANT_NAME'
          DataSource = OE_DM.SrcOrders
          TabOrder = 1
          ReadOnly = True
          FieldLabel = 'EPlant'
        end
        object UniDBEdit11: TUniDBEdit
          Left = 6
          Top = 25
          Width = 121
          Height = 22
          Hint = ''
          DataField = 'DISCOUNT'
          DataSource = OE_DM.SrcOrders
          TabOrder = 2
          FieldLabel = 'Discount %'
        end
        object UniDBDateTimePicker1: TUniDBDateTimePicker
          Left = 6
          Top = 48
          Width = 120
          Hint = ''
          DataField = 'DATE_TAKEN'
          DataSource = OE_DM.SrcOrders
          DateTime = 42629.000000000000000000
          DateFormat = 'MM/dd/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 3
          FieldLabel = 'Date'
        end
        object UniDBEdit12: TUniDBEdit
          Left = 6
          Top = 71
          Width = 121
          Height = 22
          Hint = ''
          DataField = 'CURRENCYCODE'
          DataSource = OE_DM.SrcOrders
          TabOrder = 4
          FieldLabel = 'Currency'
        end
        object UniDBDateTimePicker2: TUniDBDateTimePicker
          Left = 6
          Top = 94
          Width = 120
          Hint = ''
          DataField = 'ORD_LINE_DATE'
          DataSource = OE_DM.SrcOrders
          DateTime = 42629.000000000000000000
          DateFormat = 'MM/dd/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 5
          FieldLabel = 'Delivery Date'
        end
        object UniDBEdit13: TUniDBEdit
          Left = 6
          Top = 116
          Width = 121
          Height = 22
          Hint = ''
          DataField = 'PaymentTypeStr'
          DataSource = OE_DM.SrcOrders
          TabOrder = 6
          FieldLabel = 'Web Payment'
        end
        object UniDBEdit14: TUniDBEdit
          Left = 6
          Top = 139
          Width = 121
          Height = 22
          Hint = ''
          DataField = 'WEB_ORDERS_ID'
          DataSource = OE_DM.SrcOrders
          TabOrder = 7
          FieldLabel = 'Web Ref #'
        end
        object UniDBEdit15: TUniDBEdit
          Left = 6
          Top = 162
          Width = 121
          Height = 22
          Hint = ''
          DataField = 'CARRIER_ACCT_NUMBER'
          DataSource = OE_DM.SrcOrders
          TabOrder = 8
          FieldLabel = 'Carrier Account #'
        end
        object UniDBCheckBox3: TUniDBCheckBox
          Left = 6
          Top = 185
          Width = 97
          Height = 17
          Hint = ''
          DataField = 'APPROVAL_REQUIRED'
          DataSource = OE_DM.SrcOrders
          Caption = 'Required'
          TabOrder = 9
        end
        object UniDBCheckBox4: TUniDBCheckBox
          Left = 6
          Top = 208
          Width = 97
          Height = 17
          Hint = ''
          DataField = 'APPROVED'
          DataSource = OE_DM.SrcOrders
          Caption = 'Approved'
          TabOrder = 10
        end
      end
    end
  end
  object UniSplitter1: TUniSplitter
    Left = 0
    Top = 372
    Width = 867
    Height = 5
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object DetailPanel: TUniPanel
    Left = 0
    Top = 377
    Width = 867
    Height = 187
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object UniDBGrid1: TUniDBGrid
      Left = 1
      Top = 28
      Width = 865
      Height = 159
      Hint = ''
      DataSource = OE_DM.SrcOrd_Detail
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      OnDrawColumnCell = UniDBGrid1DrawColumnCell
      Columns = <
        item
          FieldName = 'ORD_DET_SEQNO'
          Title.Caption = '#'
          Width = 34
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ItemNumber'
          Title.Caption = 'Item #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Disp_Descript'
          Title.Caption = 'Item Description'
          Width = 124
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ArinvtRev'
          Title.Caption = 'Revision'
          Width = 44
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ArinvtClass'
          Title.Caption = 'Class'
          Width = 40
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TOTAL_QTY_ORD'
          Title.Caption = 'Blanket Qty'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'BackLog'
          Title.Caption = 'Backlog'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CUMM_SHIPPED'
          Title.Caption = 'Qty Shipped'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'UNIT_PRICE'
          Title.Caption = 'Price'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Tax_Code'
          Title.Caption = 'Tax Code'
          Width = 124
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Tot_Releases'
          Title.Caption = 'Total Releases'
          Width = 74
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TotalPrice'
          Title.Caption = 'Total Price'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ONHOLD'
          Title.Caption = 'On Hold'
          Width = 46
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SHIPHOLD'
          Title.Caption = 'Ship Hold'
          Width = 48
          CheckBoxField.FieldValues = 'Y;N'
        end
        item
          FieldName = 'PRICE_PER_1000'
          Title.Caption = 'Price/1000'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SalesPerson'
          Title.Caption = 'Salesperson(s)'
          Width = 75
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'LIST_UNIT_PRICE'
          Title.Caption = 'List Unit Price'
          Width = 68
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DISCOUNT'
          Title.Caption = 'Discount %'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'AkaDescrip'
          Title.Caption = 'AKA Description'
          Width = 82
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'AkaItemNo'
          Title.Caption = 'AKA Item #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'UNIT'
          Title.Caption = 'UOM'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'COMMENT1'
          Title.Caption = 'Note'
          Width = 124
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TotalComm'
          Title.Caption = 'Total Commissions'
          Width = 91
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CommPrcnt'
          Title.Caption = 'Commission %'
          Width = 73
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Cost_Source'
          Title.Caption = 'Cost Source'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EPlant_Name'
          Title.Caption = 'EPlant'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DOCKID'
          Title.Caption = 'Dock ID'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'LINEFEED'
          Title.Caption = 'Line Feed'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'RESERVELOCATION'
          Title.Caption = 'Reserve Location'
          Width = 88
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Total_invoiced'
          Title.Caption = 'Quantity Invoiced'
          Width = 90
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'KBTRIGGER'
          Title.Caption = 'KB Trigger'
          Width = 184
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CUST_CUM_START'
          Title.Caption = 'Customer Cum. Start'
          Width = 105
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'LAST_RECEIPT_QTY'
          Title.Caption = 'Last Receipt Quantity'
          Width = 108
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'LAST_RECEIPT_DATE'
          Title.Caption = 'Last Receipt Date'
          Width = 112
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'REF_CODE'
          Title.Caption = 'Reference Code'
          Width = 124
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'REF_CODE_DESCRIP'
          Title.Caption = 'Reference Code Description'
          Width = 364
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'FAB_END_DATE'
          Title.Caption = 'Fab End Date'
          Width = 112
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'FAB_QTY'
          Title.Caption = 'Fab Quantity'
          Width = 67
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'FAB_START_DATE'
          Title.Caption = 'Fab Start Date'
          Width = 112
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'RAW_MT_QTY'
          Title.Caption = 'Raw Material Quantity'
          Width = 111
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CONTAINERS'
          Title.Caption = 'Containers'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'AkaRev'
          Title.Caption = 'AKA Revision'
          Width = 124
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ACCT'
          Title.Caption = 'GL Account'
          Width = 124
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'IS_DROP_SHIP'
          Title.Caption = 'Drop Ship'
          Width = 50
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'IS_MAKE_TO_ORDER'
          Title.Caption = 'Make To Order'
          Width = 82
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'HardAllocatedVia'
          Title.Caption = 'Hard Allocated Via'
          Width = 154
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PO_INFO'
          Title.Caption = 'PO Info'
          Width = 364
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ICT_Ship_To_From_Attn'
          Title.Caption = 'ICT Ship From'
          Width = 154
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Description2'
          Title.Caption = 'Ext. Description'
          Width = 124
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CampaignCode'
          Title.Caption = 'Campaign Code'
          Width = 124
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CUSER1'
          Title.Caption = 'User Text 1'
          Width = 112
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CUSER2'
          Title.Caption = 'User Text 2'
          Width = 112
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CUSER3'
          Title.Caption = 'User Text 3'
          Width = 112
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'RebateParam'
          Title.Caption = 'Rebate Parameter'
          Width = 124
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'HIDE'
          Title.Caption = 'Hide'
          Width = 34
          CheckBoxField.FieldValues = 'Y;N'
        end
        item
          FieldName = 'AkaDescrip2'
          Title.Caption = 'AKA Ext Description'
          Width = 124
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Division'
          Title.Caption = 'Ship Division'
          Width = 184
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'MfgNo'
          Title.Caption = 'Mfg #'
          Width = 154
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'AKA_KIND'
          Title.Caption = 'AKA Kind'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'MfgnoDefault'
          Title.Caption = 'Default Mfg #'
          Width = 154
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'AUTO_INVOICE'
          Title.Caption = 'Auto Invoice'
          Width = 65
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'NonCommitted'
          Title.Caption = 'Non-Committed'
          Width = 78
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'OnHand'
          Title.Caption = 'On Hand'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'HasQualityException'
          Title.Caption = 'Quality Issues'
          Width = 72
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SAMPLE'
          Title.Caption = 'Sample'
          Width = 38
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TotalShipInv'
          Title.Caption = 'Shipped Qty Invoiced'
          Width = 107
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ConfigCode'
          Title.Caption = 'Config Code'
          Width = 76
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DetailDiscount'
          Title.Caption = 'Discount'
          Width = 124
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
    object UniPanel11: TUniPanel
      Left = 1
      Top = 1
      Width = 865
      Height = 28
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      BorderStyle = ubsNone
      Caption = ''
      object UniPanel12: TUniPanel
        Left = 536
        Top = 0
        Width = 329
        Height = 28
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 1
        BorderStyle = ubsNone
        Caption = ''
        object NavDetail: TUniDBNavigator
          Left = 88
          Top = 0
          Width = 241
          Height = 28
          Hint = ''
          DataSource = OE_DM.SrcOrd_Detail
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 1
        end
        object UniPanel2: TUniPanel
          Left = 2
          Top = 0
          Width = 86
          Height = 28
          Hint = ''
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 2
          BorderStyle = ubsNone
          Caption = ''
          Layout = 'border'
          object UniPanel3: TUniPanel
            Left = 1
            Top = 7
            Width = 13
            Height = 13
            Hint = 'Miscellaneous item'
            ShowHint = True
            ParentShowHint = False
            TabOrder = 1
            Caption = ''
            Color = clAqua
          end
          object UniPanel4: TUniPanel
            Left = 17
            Top = 7
            Width = 13
            Height = 13
            Hint = 'On Hold'
            ShowHint = True
            ParentShowHint = False
            TabOrder = 2
            Caption = ''
            Color = clRed
          end
          object UniPanel5: TUniPanel
            Left = 33
            Top = 7
            Width = 13
            Height = 13
            Hint = 'On Ship Hold'
            ShowHint = True
            ParentShowHint = False
            TabOrder = 3
            Caption = ''
            Color = clYellow
          end
          object UniPanel6: TUniPanel
            Left = 49
            Top = 7
            Width = 13
            Height = 13
            Hint = 'Drop Ship'
            ShowHint = True
            ParentShowHint = False
            TabOrder = 4
            Caption = ''
            Color = clMoneyGreen
          end
          object UniPanel7: TUniPanel
            Left = 65
            Top = 7
            Width = 13
            Height = 13
            Hint = 'Make To Order'
            ShowHint = True
            ParentShowHint = False
            TabOrder = 5
            Caption = ''
            Color = 16764134
          end
        end
      end
      object UniPanel13: TUniPanel
        Left = 0
        Top = 0
        Width = 536
        Height = 28
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 2
        BorderStyle = ubsNone
        Caption = ''
        object UniToolBar2: TUniToolBar
          Left = 0
          Top = 0
          Width = 536
          Height = 29
          Hint = ''
          Images = UniNativeImageListDetail
          Anchors = [akLeft, akTop, akRight]
          Align = alTop
          TabOrder = 1
          ParentColor = False
          Color = clBtnFace
          object UniToolButton7: TUniToolButton
            Left = 0
            Top = 0
            Hint = ''
            ImageIndex = 0
            Caption = 'UniToolButton7'
          end
          object UniToolButton17: TUniToolButton
            Left = 23
            Top = 0
            Width = 8
            Hint = ''
            Style = tbsSeparator
            Caption = 'UniToolButton17'
          end
          object UniToolButton8: TUniToolButton
            Left = 31
            Top = 0
            Hint = ''
            ImageIndex = 1
            Caption = 'UniToolButton8'
          end
          object UniToolButton9: TUniToolButton
            Left = 54
            Top = 0
            Hint = ''
            ImageIndex = 2
            Caption = 'UniToolButton9'
          end
          object UniToolButton10: TUniToolButton
            Left = 77
            Top = 0
            Hint = ''
            ImageIndex = 3
            Caption = 'UniToolButton10'
          end
          object UniToolButton11: TUniToolButton
            Left = 100
            Top = 0
            Width = 8
            Hint = ''
            Style = tbsSeparator
            Caption = 'UniToolButton11'
          end
          object UniToolButton12: TUniToolButton
            Left = 108
            Top = 0
            Hint = ''
            ImageIndex = 4
            Caption = 'UniToolButton12'
          end
          object UniToolButton13: TUniToolButton
            Left = 131
            Top = 0
            Hint = ''
            ImageIndex = 5
            Caption = 'UniToolButton13'
          end
          object UniToolButton14: TUniToolButton
            Left = 154
            Top = 0
            Hint = ''
            ImageIndex = 6
            Caption = 'UniToolButton14'
          end
          object UniToolButton15: TUniToolButton
            Left = 177
            Top = 0
            Hint = ''
            ImageIndex = 7
            Caption = 'UniToolButton15'
          end
          object UniToolButton16: TUniToolButton
            Left = 200
            Top = 0
            Width = 8
            Hint = ''
            Style = tbsSeparator
            Caption = 'UniToolButton16'
          end
          object UniToolButton43: TUniToolButton
            Left = 208
            Top = 0
            Width = 153
            Hint = ''
            Style = tbsContainer
            Caption = 'UniToolButton43'
            object UniCheckBox1: TUniCheckBox
              Left = 12
              Top = 3
              Width = 129
              Height = 17
              Hint = ''
              Caption = 'Filter Customer Items'
              TabOrder = 1
            end
          end
        end
      end
    end
  end
  object UniSplitter2: TUniSplitter
    Left = 0
    Top = 564
    Width = 867
    Height = 5
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object ReleasesPanel: TUniPanel
    Left = 0
    Top = 569
    Width = 867
    Height = 207
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 4
    Caption = ''
    LayoutConfig.Region = 'center'
    ExplicitTop = 490
    ExplicitWidth = 883
    ExplicitHeight = 275
    object UniDBGrid2: TUniDBGrid
      Left = 1
      Top = 28
      Width = 634
      Height = 179
      Hint = ''
      DataSource = OE_DM.SrcReleases
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      OnDrawColumnCell = UniDBGrid2DrawColumnCell
      Columns = <
        item
          FieldName = 'SEQ'
          Title.Caption = '#'
          Width = 12
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'QUAN'
          Title.Caption = 'Quantity'
          Width = 46
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Cum_Quan'
          Title.Caption = 'Cumulative Quantity'
          Width = 102
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'LeftToShip'
          Title.Caption = 'Left To Ship'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'REQUEST_DATE'
          Title.Caption = 'Requested'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PROMISE_DATE'
          Title.Caption = 'Promised'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Released'
          Title.Caption = 'Quantity Shipped'
          Width = 87
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'FORECAST'
          Title.Caption = 'Forecast'
          Width = 58
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SHIP_DATE'
          Title.Caption = 'Ship Date'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ORIG_QUAN'
          Title.Caption = 'Original Quantity'
          Width = 85
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'RAN'
          Title.Caption = 'R.A.N. / Kanban'
          Width = 94
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SHIP_TO_ATTN'
          Title.Caption = 'Ship To'
          Width = 124
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DATE_TYPE'
          Title.Caption = 'Date Type'
          Width = 58
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'BATCH_NO'
          Title.Caption = 'Batch #'
          Width = 184
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'JOB_SEQ'
          Title.Caption = 'Job Sequence'
          Width = 71
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'MUST_SHIP_DATE'
          Title.Caption = 'Must Ship Date'
          Width = 112
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'LOCK_MUST_SHIP_DATE'
          Title.Caption = 'Lock Must Ship Date'
          Width = 100
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ACK'
          Title.Caption = 'Acknowledged'
          Width = 88
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CUSER1'
          Title.Caption = 'Comment'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CUSER2'
          Title.Caption = 'Comment 2'
          Width = 364
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'USER_DATE'
          Title.Caption = 'User Date 1'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'USER_DATE_2'
          Title.Caption = 'User Date 2'
          Width = 112
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'USER_DATE_3'
          Title.Caption = 'User Date 3'
          Width = 112
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'UNIT_PRICE'
          Title.Caption = 'Unit Price'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SHIPVIA'
          Title.Caption = 'Ship Via'
          Width = 364
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'WO_NOTE'
          Title.Caption = 'WO Note'
          Width = 1534
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'INVENTORY_VERIFIED_DATE'
          Title.Caption = 'Verified Date'
          Width = 112
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EXCLUDE_SCHED'
          Title.Caption = 'Exclude From Schedule'
          Width = 114
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
    object UniPanel1: TUniPanel
      Left = 640
      Top = 28
      Width = 227
      Height = 179
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 2
      BorderStyle = ubsNone
      Caption = ''
      object UniFieldSet2: TUniFieldSet
        Left = 0
        Top = 30
        Width = 227
        Height = 149
        Hint = ''
        Margins.Left = 0
        Margins.Top = 22
        Margins.Right = 0
        Margins.Bottom = 0
        Title = ' Totals '
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        ExplicitTop = 0
        ExplicitHeight = 247
        DesignSize = (
          227
          149)
        object DBTotal: TUniDBEdit
          Left = 6
          Top = 19
          Width = 77
          Height = 20
          Cursor = crArrow
          Hint = ''
          DataField = 'TOTAL_PRICE'
          DataSource = OE_DM.SrcOrdTotal
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          FieldLabel = 'Total'
          FieldLabelWidth = 80
        end
        object DBTax: TUniDBEdit
          Left = 6
          Top = 45
          Width = 77
          Height = 21
          Cursor = crArrow
          Hint = ''
          ShowHint = True
          ParentShowHint = False
          DataField = 'TOTAL_TAX'
          DataSource = OE_DM.SrcOrdTotal
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          FieldLabel = 'Tax'
          FieldLabelWidth = 80
        end
        object DBFreightCharge: TUniDBEdit
          Left = 6
          Top = 74
          Width = 77
          Height = 21
          Cursor = crArrow
          Hint = ''
          ShowHint = True
          ParentShowHint = False
          DataField = 'FREIGHT_CHARGE'
          DataSource = OE_DM.SrcOrdTotal
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          FieldLabel = 'Freight'
          FieldLabelWidth = 80
        end
        object DBGrand: TUniDBEdit
          Left = 6
          Top = 102
          Width = 77
          Height = 21
          Cursor = crArrow
          Hint = ''
          DataField = 'GRAND_TOTAL'
          DataSource = OE_DM.SrcOrdTotal
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          FieldLabel = 'Grand'
          FieldLabelWidth = 80
        end
      end
      object UniPanel27: TUniPanel
        Left = 0
        Top = 0
        Width = 227
        Height = 30
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        BorderStyle = ubsNone
        Caption = ''
        object UniSpeedButton1: TUniSpeedButton
          Left = 3
          Top = 4
          Width = 23
          Height = 22
          Hint = ''
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000A0860100A08601000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            09760B54AB5CFF00FFCFCFECBFBFE6BFBFE6BFBFE6BFBFE6F3F3FAFF00FFECD9
            CFEDDCD3FF00FFFF00FF9CCA9F499B4C0C7B0F2A8B2CDEEFDE4752C0132CB811
            27B51125B30C1AACCFCFECFF00FFB56940BA7550FF00FFFF00FF138519138519
            0B7A0F128516489B4AA9A9DD060FA48686CFBFBFE6BFBFE6E0CDCAB66B40A649
            10A64914B46840F0E2DB91CE97E3F4E50D7B110D7C111184167070C60C1EAE2E
            35B24040B3DBDBF0ECD9CFB66B40A74A10A64A14B46840F0E2DBA6D2AA15891E
            178C2015891C4EA5534040B30C1EAE0917AA00009ACFCFECFF00FFF7EFEBA94D
            15AC5520FF00FFFF00FF1B91261C932709740C219C2C90CD95CFCFEC243EBE43
            52C1BFBFE6FF00FFFF00FFCA9477A44200A44100D3A68FFF00FF219A30219B2F
            12821915891D15881CFF00FF3247BF2B43C0B2B2E0BFBFE6E1CAB9AB4A00B86D
            3EB76A3AA44100FAF5F3CEF0D554AB5C14851C168A2057B361FF00FFC3C6E912
            31BB2B43BF1B2AB19E6257AF4F00F3E7E1EEDED5A44100C78E6FFF00FFFF00FF
            14861E54AB5CFF00FFFF00FFFF00FFEEEEF8BBBBE4D5D5EEE7D0C6EBD7CDFF00
            FFFF00FFE9D4C9EAD5CBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Caption = ''
          ParentColor = False
          Color = clWindow
        end
      end
    end
    object UniSplitter3: TUniSplitter
      Left = 634
      Top = 28
      Width = 6
      Height = 179
      Hint = ''
      Align = alRight
      ParentColor = False
      Color = clBtnFace
    end
    object UniPanel14: TUniPanel
      Left = 1
      Top = 1
      Width = 865
      Height = 28
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      BorderStyle = ubsNone
      Caption = ''
      object NavReleases: TUniDBNavigator
        Left = 624
        Top = 0
        Width = 241
        Height = 28
        Hint = ''
        DataSource = OE_DM.SrcReleases
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 1
      end
      object UniPanel15: TUniPanel
        Left = 0
        Top = 0
        Width = 520
        Height = 28
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 2
        BorderStyle = ubsNone
        Caption = ''
        object UniToolBar3: TUniToolBar
          Left = 0
          Top = 0
          Width = 520
          Height = 29
          Hint = ''
          Images = UniNativeImageListReleases
          Anchors = [akLeft, akTop, akRight]
          Align = alTop
          TabOrder = 1
          ParentColor = False
          Color = clBtnFace
          object sbtnSigma: TUniToolButton
            Left = 0
            Top = 0
            Hint = ''
            ImageIndex = 0
            Caption = 'sbtnSigma'
          end
          object UniToolButton37: TUniToolButton
            Left = 23
            Top = 0
            Hint = ''
            ImageIndex = 1
            Caption = 'UniToolButton37'
          end
          object UniToolButton38: TUniToolButton
            Left = 46
            Top = 0
            Width = 8
            Hint = ''
            Style = tbsSeparator
            Caption = 'UniToolButton38'
          end
          object UniToolButton39: TUniToolButton
            Left = 54
            Top = 0
            Hint = ''
            ImageIndex = 2
            Caption = 'UniToolButton39'
          end
          object UniToolButton40: TUniToolButton
            Left = 77
            Top = 0
            Hint = ''
            ImageIndex = 3
            Caption = 'UniToolButton40'
          end
          object UniToolButton41: TUniToolButton
            Left = 100
            Top = 0
            Width = 102
            Hint = ''
            Style = tbsContainer
            Caption = ''
            object UniLabel1: TUniLabel
              Left = 26
              Top = 3
              Width = 70
              Height = 13
              Hint = ''
              Margins.Left = 10
              Margins.Top = 4
              Margins.Right = 0
              Margins.Bottom = 0
              Caption = 'Total Releases'
              TabOrder = 1
            end
          end
          object UniToolButton42: TUniToolButton
            Left = 202
            Top = 0
            Width = 127
            Hint = ''
            Style = tbsContainer
            Caption = 'UniToolButton42'
            object edTotRel: TUniEdit
              Left = 2
              Top = -1
              Width = 121
              Height = 24
              Hint = ''
              Text = 'edTotRel'
              TabOrder = 1
            end
          end
        end
      end
      object UniPanel16: TUniPanel
        Left = 520
        Top = 0
        Width = 104
        Height = 28
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 3
        BorderStyle = ubsNone
        Caption = ''
        Layout = 'border'
        object UniPanel17: TUniPanel
          Left = 4
          Top = 7
          Width = 13
          Height = 13
          Hint = 'Shipped'
          ShowHint = True
          ParentShowHint = False
          TabOrder = 1
          Caption = ''
          Color = clLime
        end
        object UniPanel18: TUniPanel
          Left = 20
          Top = 7
          Width = 13
          Height = 13
          Hint = 'Not Shipped'
          ShowHint = True
          ParentShowHint = False
          TabOrder = 2
          Caption = ''
          Color = clMaroon
        end
        object UniPanel19: TUniPanel
          Left = 36
          Top = 7
          Width = 13
          Height = 13
          Hint = 'Partially Shipped'
          ShowHint = True
          ParentShowHint = False
          TabOrder = 3
          Caption = ''
          Color = clYellow
        end
        object UniPanel20: TUniPanel
          Left = 52
          Top = 7
          Width = 13
          Height = 13
          Hint = 'On Pick Ticket'
          ShowHint = True
          ParentShowHint = False
          TabOrder = 4
          Caption = ''
          Color = clAqua
        end
        object UniPanel21: TUniPanel
          Left = 68
          Top = 7
          Width = 13
          Height = 13
          Hint = 'Pending Inventory Verification'
          ShowHint = True
          ParentShowHint = False
          TabOrder = 5
          Caption = ''
          Color = 33023
        end
        object UniPanel22: TUniPanel
          Left = 84
          Top = 7
          Width = 13
          Height = 13
          Hint = 'Pending Inventory Verification'
          ShowHint = True
          ParentShowHint = False
          TabOrder = 6
          Caption = ''
          Color = clRed
        end
      end
    end
    object OrderPicker: TIQUniEditorDlgPickDataSet
      Left = 58
      Top = 129
      Width = 145
      Hint = ''
      Visible = False
      TabOrder = 5
      Triggers = <
        item
          ImageIndex = 0
          ButtonId = 1
          HandleClicks = True
        end>
      OnDialogResult = OrderPickerDialogResult
      ListField = 'ID'
      ListSource = OE_DM.SrcOrders
      KeyField = 'ID'
      ListFieldIndex = 0
    end
  end
  object UniPanel8: TUniPanel
    Left = 0
    Top = 0
    Width = 867
    Height = 28
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 5
    BorderStyle = ubsNone
    Caption = ''
    object UniPanel9: TUniPanel
      Left = 0
      Top = 0
      Width = 867
      Height = 28
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      BorderStyle = ubsNone
      Caption = ''
      object UniToolBar1: TUniToolBar
        Left = 0
        Top = 0
        Width = 537
        Height = 28
        Hint = ''
        Images = UniNativeImageListHeader
        Anchors = [akLeft, akTop, akRight, akBottom]
        Align = alClient
        TabOrder = 1
        ParentColor = False
        Color = clBtnFace
        object sbtnSearchOrder: TUniToolButton
          Left = 0
          Top = 0
          Hint = ''
          ImageIndex = 0
          Caption = 'sbtnSearchOrder'
          OnClick = sbtnSearchOrderClick
        end
        object UniToolButton2: TUniToolButton
          Left = 23
          Top = 0
          Hint = ''
          ImageIndex = 1
          Caption = 'UniToolButton2'
        end
        object UniToolButton3: TUniToolButton
          Left = 46
          Top = 0
          Width = 8
          Hint = ''
          Style = tbsSeparator
          Caption = 'UniToolButton3'
        end
        object UniToolButton4: TUniToolButton
          Left = 54
          Top = 0
          Hint = ''
          ImageIndex = 2
          Caption = 'UniToolButton4'
        end
        object UniToolButton5: TUniToolButton
          Left = 77
          Top = 0
          Hint = ''
          ImageIndex = 3
          Caption = 'UniToolButton5'
        end
        object UniToolButton6: TUniToolButton
          Left = 100
          Top = 0
          Width = 8
          Hint = ''
          Style = tbsSeparator
          Caption = 'UniToolButton6'
        end
        object UniToolButton18: TUniToolButton
          Left = 108
          Top = 0
          Hint = ''
          ImageIndex = 4
          Caption = 'UniToolButton18'
        end
        object UniToolButton19: TUniToolButton
          Left = 131
          Top = 0
          Hint = ''
          ImageIndex = 5
          Caption = 'UniToolButton19'
        end
        object UniToolButton20: TUniToolButton
          Left = 154
          Top = 0
          Hint = ''
          ImageIndex = 6
          Caption = 'UniToolButton20'
        end
        object UniToolButton21: TUniToolButton
          Left = 177
          Top = 0
          Width = 8
          Hint = ''
          Style = tbsSeparator
          Caption = 'UniToolButton21'
        end
        object UniToolButton22: TUniToolButton
          Left = 185
          Top = 0
          Hint = ''
          ImageIndex = 7
          Caption = 'UniToolButton22'
        end
        object UniToolButton23: TUniToolButton
          Left = 208
          Top = 0
          Hint = ''
          ImageIndex = 8
          Caption = 'UniToolButton23'
        end
        object UniToolButton24: TUniToolButton
          Left = 231
          Top = 0
          Width = 8
          Hint = ''
          Style = tbsSeparator
          Caption = 'UniToolButton24'
        end
        object UniToolButton25: TUniToolButton
          Left = 239
          Top = 0
          Hint = ''
          ImageIndex = 9
          Caption = 'UniToolButton25'
        end
        object UniToolButton26: TUniToolButton
          Left = 262
          Top = 0
          Width = 8
          Hint = ''
          Style = tbsSeparator
          Caption = 'UniToolButton26'
        end
        object UniToolButton27: TUniToolButton
          Left = 270
          Top = 0
          Hint = ''
          ImageIndex = 10
          Caption = 'UniToolButton27'
        end
        object UniToolButton28: TUniToolButton
          Left = 293
          Top = 0
          Hint = ''
          ImageIndex = 11
          Caption = 'UniToolButton28'
        end
        object UniToolButton29: TUniToolButton
          Left = 316
          Top = 0
          Hint = ''
          ImageIndex = 12
          Caption = 'UniToolButton29'
        end
        object UniToolButton30: TUniToolButton
          Left = 339
          Top = 0
          Hint = ''
          ImageIndex = 13
          Caption = 'UniToolButton30'
        end
        object UniToolButton31: TUniToolButton
          Left = 362
          Top = 0
          Width = 8
          Hint = ''
          Style = tbsSeparator
          Caption = 'UniToolButton31'
        end
        object UniToolButton32: TUniToolButton
          Left = 370
          Top = 0
          Hint = ''
          ImageIndex = 14
          Caption = 'UniToolButton32'
        end
        object UniToolButton33: TUniToolButton
          Left = 393
          Top = 0
          Hint = ''
          ImageIndex = 15
          Caption = 'UniToolButton33'
        end
        object UniToolButton34: TUniToolButton
          Left = 416
          Top = 0
          Hint = ''
          ImageIndex = 16
          Caption = 'UniToolButton34'
        end
        object UniToolButton35: TUniToolButton
          Left = 439
          Top = 0
          Hint = ''
          ImageIndex = 17
          Caption = 'UniToolButton35'
        end
      end
      object UniPanel10: TUniPanel
        Left = 537
        Top = 0
        Width = 330
        Height = 28
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 2
        BorderStyle = ubsNone
        Caption = 'UniPanel10'
        object NavHeader: TUniDBNavigator
          Left = 88
          Top = 0
          Width = 242
          Height = 28
          Hint = ''
          DataSource = OE_DM.SrcOrders
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 1
        end
        object UniPanel23: TUniPanel
          Left = 17
          Top = 0
          Width = 71
          Height = 28
          Hint = ''
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 2
          BorderStyle = ubsNone
          Caption = ''
          object UniPanel24: TUniPanel
            Left = 2
            Top = 9
            Width = 13
            Height = 13
            Hint = 'On Credit, Ship or Mfg Hold'
            ShowHint = True
            ParentShowHint = False
            TabOrder = 1
            Caption = ''
            Color = clRed
          end
          object UniPanel25: TUniPanel
            Left = 19
            Top = 9
            Width = 13
            Height = 13
            Hint = 'VMI'
            ShowHint = True
            ParentShowHint = False
            TabOrder = 2
            Caption = ''
            Color = clYellow
          end
          object UniPanel26: TUniPanel
            Left = 36
            Top = 9
            Width = 13
            Height = 13
            Hint = 'Not matching Division/Warehouse between Order & Ship-To'
            ShowHint = True
            ParentShowHint = False
            TabOrder = 3
            Caption = ''
            Color = clAqua
          end
          object UniPanel28: TUniPanel
            Left = 53
            Top = 9
            Width = 13
            Height = 13
            Hint = 'Cash In Advance'
            ShowHint = True
            ParentShowHint = False
            TabOrder = 4
            Caption = ''
            Color = clFuchsia
          end
        end
      end
    end
  end
  object UniNativeImageListHeader: TUniNativeImageList
    Left = 56
    Top = 658
    Images = {
      12000000FF00FF000136030000424D3603000000000000360000002800000010
      0000001000000001001800000000000003000000000000000000000000000000
      000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFB18C76A0786090604090584090584087492AFF00FFFF00FFFF00FFB485
      659C755DA07050905840905030773818FF00FFB09080FFF8FFE0C8C0D0A090C0
      8060804020FF00FFFF00FFFF00FFB08060F0E8E0E0C8C0D0A890B07850804820
      FF00FFB09080FFF8FFE0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB080
      60F0E8E0F0E0E0E0C0B0C08870804830FF00FFB09080FFF8FFE0C8C0D0A090C0
      8060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0B0C08870804830
      FF00FFC09880FFFFFFF0E8E0E0C8C0D0A080804020FF00FFFF00FFFF00FFB080
      60F0E8E0F0E0E0E0C0B0C08870804830FF00FFC3A494B08870A0685090503080
      48308048208038108F4C26B08870A06850905830904830804020703810905830
      FF00FFDEC4B4B08870FFFFFFE0D0C0D0A090A07050804010D5B89CB09070E0D8
      D0F0D8D0D0A090B07850803820CFA98AFF00FFFF00FFC09080F0F0F0FFF8F0F0
      D8C0B08060804820965732B09070FFFFFFFFF8F0F0D0C0B07850804820FF00FF
      FF00FFFF00FFF8E2D2C09880B08060A068509050309058409D6842B07860B088
      70A07050804830804820ECC4A7FF00FFFF00FFFF00FFFF00FFC09880FFF8FFE0
      C0B0C09070804820FF00FFC09880FFF8FFE0C8B0D0A080804820FF00FFFF00FF
      FF00FFFF00FFFF00FFCFB1A1B09080A06850905030875139FF00FFC0A890B090
      80A06850905030864F37FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1836DFF
      F8F0814527FF00FFFF00FFFF00FFB08068FFF8F0804324FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFC7A898B48D759D6843FF00FFFF00FFFF00FFCEAE
      9CB48C749C6640FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF000136050000424D360500000000000036040000280000001000
      000010000000010008000000000000010000A0860100A0860100000000000000
      000000000000000080000080000000808000800000008000800080800000C0C0
      C000C0DCC000F0CAA6000020400000206000002080000020A0000020C0000020
      E00000400000004020000040400000406000004080000040A0000040C0000040
      E00000600000006020000060400000606000006080000060A0000060C0000060
      E00000800000008020000080400000806000008080000080A0000080C0000080
      E00000A0000000A0200000A0400000A0600000A0800000A0A00000A0C00000A0
      E00000C0000000C0200000C0400000C0600000C0800000C0A00000C0C00000C0
      E00000E0000000E0200000E0400000E0600000E0800000E0A00000E0C00000E0
      E00040000000400020004000400040006000400080004000A0004000C0004000
      E00040200000402020004020400040206000402080004020A0004020C0004020
      E00040400000404020004040400040406000404080004040A0004040C0004040
      E00040600000406020004060400040606000406080004060A0004060C0004060
      E00040800000408020004080400040806000408080004080A0004080C0004080
      E00040A0000040A0200040A0400040A0600040A0800040A0A00040A0C00040A0
      E00040C0000040C0200040C0400040C0600040C0800040C0A00040C0C00040C0
      E00040E0000040E0200040E0400040E0600040E0800040E0A00040E0C00040E0
      E00080000000800020008000400080006000800080008000A0008000C0008000
      E00080200000802020008020400080206000802080008020A0008020C0008020
      E00080400000804020008040400080406000804080008040A0008040C0008040
      E00080600000806020008060400080606000806080008060A0008060C0008060
      E00080800000808020008080400080806000808080008080A0008080C0008080
      E00080A0000080A0200080A0400080A0600080A0800080A0A00080A0C00080A0
      E00080C0000080C0200080C0400080C0600080C0800080C0A00080C0C00080C0
      E00080E0000080E0200080E0400080E0600080E0800080E0A00080E0C00080E0
      E000C0000000C0002000C0004000C0006000C0008000C000A000C000C000C000
      E000C0200000C0202000C0204000C0206000C0208000C020A000C020C000C020
      E000C0400000C0402000C0404000C0406000C0408000C040A000C040C000C040
      E000C0600000C0602000C0604000C0606000C0608000C060A000C060C000C060
      E000C0800000C0802000C0804000C0806000C0808000C080A000C080C000C080
      E000C0A00000C0A02000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0
      E000C0C00000C0C02000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0
      A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
      FF00FDFDFDFD9B9B9B9B9B9B9B9B9B9B9B9BFDFDFDFDA40707F7F7F7F7F7F7A4
      A49BFDFDFDFDA4070707F7F752490000A49BFDFDFDFDA407070707F7A4FFFF00
      F79BFDFDFDFDA40707A49B07A4A4A4A4F79BFDFDFDFDA4070707070707F7F7F7
      F79BA4A4A4A4EBE2DAD9D0D0C8C8C8880404A4F6F6F6EBE3E3E3E3E3E3E3E3E3
      E304A4FFFFFFEBE2DAD9D0D0C8C8C8880404A4FF0707FF0707FF07F7FFA4FDFD
      FDFDA4FFFFFFFFFFFFFFFFFFFFA4FDFDFDFDA4FF0707FF0707FF0707FFA4FDFD
      FDFDA4FFFFFFFFFFFFFFFFFFFFA4FDFDFDFD0909ECEBE3DAD9D0D0D0C8C8FDFD
      FDFD09E3E3E3E3E3E3E3E3E3E3C8FDFDFDFD0909ECEBE3DAD9D0D0D0C8C8FDFD
      FDFDFF00FF000136030000424D36030000000000003600000028000000100000
      0010000000010018000000000000030000120B0000120B000000000000000000
      00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFC7C2C0A69C96A79D98A89E98A79D97A89E97A9A19AA9A19BA8A29CA8A09BA6
      9A94A79E99A7A19EA6A19DA69D98C0BDBBBB9579E8B078E5AF76EBB77CF2C085
      F0BB7FDC8E4BE4924EEC9853EEA162E5AB84F8D2ACF7A86EF7AD7AFDECD7A79B
      93B8A190F5BB81F0BC82F6C588FDD094FACB8FD9823CE18239EE873CF49952EC
      BA98FEDCBAFF944CFE9453FFF9EBABA39CBFB3ADE1945DDD935CE39C65E49E68
      E7A571E8AB7BE8AF83E7B18AE7B491D88E6DE4B096E5C0AEE6C4B7EAC0B3A694
      8BDCD9D8E6B27AC27335E7AA6ECE6F27D86F24E4792BF6CB9CFAE3C1FAE7CBE6
      B59BEEC8B0EC7F43E97C48F9D9CBA99E98F7F7F7D7AD82F3C182F9CB90F0B67A
      F0B175F3B479FCDDB4FFF2D5FFFAE5EBC4AEF7E3D5F8B996F5B290FFF4ECAAA1
      9CFF00FFC2A990EBA15DE3A163EC9B55ED8033F88C3DFC9245FFE3C3FFFFF9ED
      CBB9FAEDE6F1AA87EC9E7DFFEFE7AAA29CFF00FFB9A89CEEAD75E5A370E9AB7A
      E59E6EE4996BE69A6EE8B89CEAC7B6DB9E88E6BCAEE3916FE08561F4CDBEA99D
      96FF00FFCAC5C1F5BA7EED924AF4A769F46F1BF67926F57D34F37C3CF6CAAFEA
      CCC2F2DCD5E29678DA7D61F1C7B9A89B94FF00FFE7E5E5D1A382C1A494D0AF99
      DBAC8DE3A785E9A37DE69570E9B7A2E2B4A6E7C0B4E09071D66D4DF6D0C1AAA0
      9AFF00FFFCFCFCADABA61BA2FC09B0FF0A92FF589AF6FBF5EBFBF7F2FAF4F2FA
      F1EEEFCCBEE09C8DECCEC3F3DDD6A79890FF00FFFF00FFCDB6ACB8B7B89DB8C6
      8AABDA9AB7ECFCF6F0FFFFFDFFFFFFFFFFFFF9E6DDDF9079E19E8CF0C6BAA99F
      99FF00FFFF00FFFF00FFFDF9F8FCF5F3F9ECE7F4DED6EED3CAEBCBC1E9C4B9E8
      C1B5E6BCAFE3B3A6E4B5A7EBBFB1B5A9A3FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FF000136030000424D3603000000000000360000002800000010000000
      10000000010018000000000000030000120B0000120B00000000000000000000
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFCCCCCCCCCCCCCCCCCCCCCCCCFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFCCCCCCAFA5A3958987867270887572A098
      97C5C2C2CCCCCCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCCC7C672
      5F5D755D5294876DDDC0B7A68E89C99E937E5B55705F5DC3BBBAFF00FFFF00FF
      FF00FFFF00FFFF00FFBCC1BB5B5B4C465C321D5A1C71916DF8F1EFEBDDD9D1AC
      A28B625A8E4D425B423EC6C2C1FF00FFC4C8C4357C362C882C1F7B1E2689262E
      912D206820D1D5CCF5EFEDE4D0CBC99E92B17467995549673C35796967FF00FF
      FF00FF9BB09C2C832E34CD3435B63530963032622FE6D9D6E2D0CBD1B1A8AA7E
      747D5851A264578F5A505F4440C7C1C0FF00FFBBC2BB2F8C2F37C63735B1342F
      8E2F4C6B44DCC6C0D3B7AF8168634F403E66504CBB8578BA8477825F576B5855
      FF00FF4C874C38CD3837C2372A952A2491256C7F5ED9C0B9796764514543AA83
      79C49C91CEA99FB090898068644B3E3CABB9AC30AD3039CD3934B2336081574A
      8946879978DFCBC6C4AFAA786A68C9ACA5D8BEB7E2CCC6DFC8C393827F837170
      598E5A3AD53A38C6382380238B8A80EDE8E1D2D7CAF2EBEAEDE7E59B8F8EEFE5
      E3F7EDEBF4EAE7B4A8A6766A69CFCDCD3D8C3E39D13937BE361F6F1F8D8D88FF
      FEFDFEFCFCF8F7F6F3F1F09E9494F9F7F6FFFFFFFFFFFFA59E9DA6A1A0FF00FF
      408C4134CD3534B3342677252B4729D8D7D7CEC9C9F7F7F7CCC8C88A8181F7F7
      F7BFB9B9E9E7E7827B7BD0D0D0FF00FF8BA78C21B32330AE302D882D1C531C22
      3D217C7C7AC9C8C8D9D9D9AAA6A6DEDDDD898383908A8AD3D3D3FF00FFFF00FF
      FF00FF719972238D252099212391251D6B1F144C151C341B646362656262908B
      8BCBC9C9CDCDCDFF00FFFF00FFFF00FFFF00FFFF00FFC8CAC8799B7B467B483F
      77415482559CB09CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF000136030000424D360300000000000036000000280000001000000010
      000000010018000000000000030000120B0000120B00000000000000000000FF
      00FFFF00FFC6C1BBB09781A684689971529D6E496867676F6661B3967EC7C2BD
      FF00FFFF00FFFF00FFFF00FFFF00FFB8A593905830863B0E913F10853C108A40
      097648296E6E6E3D2D1E20A02D1FA02C96633DC9C6C3FF00FFFF00FFFF00FF83
      451B963B09AA4810AA4B10994A0E9B4C0C836B5F72727220A02D44EE7541FF7D
      1FA02CADA892FF00FFFF00FFFF00FF94633DA34812BB5B18B05B18A95912A974
      48746C681FA02C27F54B2DFF5948E8793EFF711FA02C307E3B62A268BFC8C0B9
      A695984E22B76A35AC6031A95D2CE9E3DC20A02D27F54B23E5421FA02C20A02D
      40E26D32FF621FA02C00641A2F8536FF00FFA07555A96C42B45F37BD876ED8CF
      CA86A3B220A02D20A02DAD623C9562371FA02C4BFF8C26FF4B1FA02C4A974FFF
      00FFFF00FFAF947FB46E48CFB09F6E9AB342A7E83F80B1C58B706C5F282B7429
      B3CBB71FA02C3EFF7A25FF4B1FA02CFF00FFFF00FFFF00FFC9C9C85C80A03999
      E04DB1EA30A0E71A6C9544612CA09F8BB6A2983464251FA02C46FF8220A02DFF
      00FFFF00FFFF00FFAEC2CD2F8FE858BAF955B8F036AAEE1792E87A94ABBDBBBA
      A9A5A3344A2C17373F1FA02DFF00FFFF00FFFF00FFBAC6CC4793DD59A5EC75CA
      FD58BDF436AAEE1899EE1D71B43D9FE33280BA072F5A24456DB3BAC0FF00FFFF
      00FFFF00FFBAC6CC4374AA7EACD8B6E3FF69C7FA36AAEE1899EE156BB656B6F0
      41B0EE1070BF345B89FF00FFFF00FFFF00FFFF00FFFF00FF244C80093675254F
      864C9FD237ABF01790E32866A367C4F941B0EE1791E436699AFF00FFFF00FFFF
      00FFFF00FFFF00FF98A9B8144C8E104C97104789206AA3104C8A3763989EDDFF
      44B4F11589DD7593ADFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA4B2BD4A78
      A028629820578D124B8A124A8E326B9F3DA7E31588DB8CA7BAFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF829AB01555991256A0
      135497114F8D9BABB9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF7C98AE1B58941655936487A5FF00FFFF00FFFF00FFFF
      00FF000136030000424D36030000000000003600000028000000100000001000
      0000010018000000000000030000232E0000232E00000000000000000000FF00
      FFFF00FFF2F1F098693E98693E98693E98693EE2B17BDFB17DD8B180D1A87BBE
      AD96FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF98693ECD9E6DB47B47D19961
      CF966098693E98693E98693E98693ED8CABBFF00FFFF00FFFF00FFFF00FFFF00
      FFBBA380DFCAA6B47B47D89D64B47B47B47B47B47B47B47B47B47B47DCAE7ABB
      A380FF00FFFF00FFFF00FFFF00FFFF00FFBBA380BBA380E7BC88ECC694EDC795
      EDC795EDC695EBC492EDBD89BBA380F9F8F5FF00FFFF00FFFF00FFFF00FFE4E0
      DABBA380BBA380FCE6BEFBE6C0FBE6BFFBE6C0FBE6BFFBE5BEBBA380A5A4A09C
      9C9C828282FF00FFFF00FFFF00FFBBA380E5D2BABBA380FFF8DBFFF4D7FFF4D7
      FFF4D7FFF4D7FFF7DABBA3802A2A2A161515575858787676FF00FFFF00FFBBA3
      80ECDFCEBBA380FFFCE8FFFAE5FFFAE5FFFAE5FFFAE3BBA380625E5621212016
      040372AFB593E7EF817574FF00FFBBA380BBA380EFE5D4FFFDEFFFFDEFFFFDEE
      FFFCEFFFFCF0BBA380161617161B1C141C1E484D4D646F6F4C5659B2B2B2E4DF
      D6BBA380FEFDF9FEFDF6FFFCF6FFFDF5FFFBF3BBA380524A420915171F26288A
      5245874638C2391C9F8E87C4D7D8DED8CFBBA380BBA380BBA380BBA380BBA380
      BBA380CEBCAF3835363E3633EC9E87FFBB9A9F6B5DFF9879FF9C80757877C2B7
      AFDCBAA6FFFFFCFFFFFFFFFFFFF4DDDEE1BFBFEAC5C66358576A5249E1B19D9D
      857A705C57FFD0B6FFD1B5645D5BB6A294FFF9F9FFFFFFFFFFFFFFF5F6F3DADB
      D8B4B4FBD3D3B1A4A41013121F2729131F231E2528958982D5B9AA818180B69B
      8BFFFFFFFFFFFFFFFFFFFFF7F9F2D8D9E3C4C5F4D9DAFFFFFFB3B8BB5C626520
      262B2A2B2C2F35384F5153C6C6C6B79682FFFFFFFFFFFFFFF6FCF4DCE0FAE4EA
      FFFEFFFFFFFFFFFFFFFFFFFFFAF5F2988477808080ABABABFF00FFFF00FFBFB4
      ACB89F8EC3A293DBB8B0E7C9C6D8B7AECFAFA2C2A797BAA392BAA596BEACA0C8
      C5C2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBFB4ACB8A293BBA191B8A293
      B9A99DC3BBB6CAC8C7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FF000136030000424D3603000000000000360000002800000010000000100000
      00010018000000000000030000130B0000130B00000000000000000000FF00FF
      FF00FFFF00FFFF00FFC8C5C2A587659B774D98754B976F419B6B39A9703C9869
      399C754AFF00FFFF00FFFF00FFFF00FFC9C6C19B774D9E7445A67848AD7E4DE6
      C195EAC799C8A377A07647A1703DD9B58A987041B0997FFF00FFFF00FFFF00FF
      FF00FFAC8C57ECCBA0B68553AE7F4DA97645A5703DA27849AA8051E8C396A373
      41B086579B7345FF00FFFF00FFFF00FFC3BBB1A67341AE7947ECCDA5EDCFA7E0
      C199B081519B7243A27849996F40976D3E916A3C9B764BC8C6C2FF00FFFF00FF
      CBCAC7AE844FA37744A37A4BA67E4FAD8454B48A5AE0AF78E3B27BE3B37DE3B3
      7DB98955B89D739D825EFF00FFFF00FFFF00FFCAC9C6A37D4065441965441965
      4419654419654419654419654419654419E8C190947043C6AD87BDB4A7FF00FF
      FF00FFFF00FF654419EFD6BDEFD6BDEFD6BDEFD6BDEFD6BDEFD6BDEFD6BDE4CA
      B16544199C7747D4C1A39A805DFF00FFFF00FFFF00FF654419FFEAD5C7B7A694
      8B820F0F0F55504B948B82AFA59AFFEAD5654419BDA075B2956EBCA07DFF00FF
      654419654419654419FFF3E6070707D2D2D20F0F0FD2D2D20F0F0F7F7C79FFF3
      E6654419BDA277E8DABCAA895E654419EFD6BDEFD6BD654419FFF7F0070707D2
      D2D20F0F0FD2D2D20F0F0F7F7E7EFFF7F0654419D7C19FE2D7C1A98A66654419
      FFEAD5C7B7A6654419FFFFFF070707D2D2D20F0F0FD2D2D20F0F0F7F7F7FFFFF
      FF654419F9F3E0BC9F7DDFC4A3654419FFF3E6070707654419FFFFFF2E2922D2
      D2D20F0F0FD2D2D20F0F0F88837CFFFFFF654419FDFAEFB69972B4A485654419
      FFF7F0070707D2D2D2A38F75A38F75A38F75A38F75A38F75A38F75A38F75A38F
      75FAEADBF1E0CBE3CAAB9B7D54654419FFFFFF070707D2D2D20F0F0FD2D2D20F
      0F0F7F7F7FFFFFFF654419A68954A48A55A9915FB09C71B7A887BFB49D654419
      FFFFFF2E2922D2D2D20F0F0FD2D2D20F0F0F88837CFFFFFF654419FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFA38F75A38F75A38F75A38F75A38F75A3
      8F75A38F75A38F75FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      000136030000424D360300000000000036000000280000001000000010000000
      010018000000000000030000130B0000130B00000000000000000000FF00FF46
      47483D3D3E3332302727261A1A1A0F100FCECECEFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFAFB0B0152427100000250303210303101A
      1ECACBCBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFF1F1F090B3CA479ABA1D64850A0000785C3B976F419B6B39A9703C986939
      9C754AFF00FFFF00FFFF00FFFF00FFC9C6C19B774DA2C5CD65E6FF2EB2D80000
      02E2C6A1C8A377A07647A1703DD9B58A987041B0997FFF00FFFF00FFFF00FFFF
      00FFAC8C57A9D3E162DFF43ACBEF004F75B4895FA27849AA8051E8C396A37341
      B086579B7345FF00FFFF00FFFF00FFC4BCB2A673419FBBC854CDF133BAF0004F
      7BBB956D9B7243A27849996F40976D3E916A3C9B764BC8C6C2FF00FFFF00FFCB
      CAC7B9966B6BA5CF52BBF52391D800204ABF9D76E0AF78E3B27BE3B37DE3B37D
      B98955B89D739D825EFF00FFFF00FFFF00FFB6B3AD0068C347A6FB196CBC0000
      00EFD4AFF1CFA2F1CFA2F1CFA2F1CFA2E8C190947043C6AD87BDB4A771717171
      7171454440001A4202214B102E4D299ACBABC8D7FAE3BDFAE3BDFAE3BDFAE3BD
      F6DBB39C7747D4C1A39A805D0606060000000000021910000D000001010156C2
      D25ED8FAFFF1D3FFF1D3FFF1D3FFF1D3FDEECFBDA075B2956EBCA07D6362636C
      6B6C6B6C6C6B6B6C6D6D6E42000065C8D072EAFFFFF7DFFFF7DFFFF7DFFFF7DF
      FFF7DDBDA277E8DABCAA895E6261626565666565656465656867684A12003AB7
      CD66DCFDFFFBE8FFFBE8FFFBE8FFFBE8FFFBE8D7C19FE2D7C1A98A662C2C2C12
      12131312131313131405001806271D89D17BC9F0FFFDF0FFFDF0FFFDF0FFFDF0
      FFFDF0F9F3E0BC9F7DDFC4A3FF00FFFF00FFFF00FFFF00FFFF00FFCAC9C6BDA0
      72FFF1E2FFFAF0FFFFFFFFFFFFFFFFFFFFFFFFFDFAEFB69972B4A485FF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFBFB49DDABC99FFF0E0FFF3E7FFF3E6FFF1E4
      FAEADBF1E0CBE3CAAB9B7D54FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFB6A580AD8C59A98A57A68954A48A55A9915FB09C71B7A887BFB49DFF00FF00
      0136030000424D36030000000000003600000028000000100000001000000001
      0018000000000000030000120B0000120B00000000000000000000FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
      0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF000000000000000000FF00FFFF00FFFF00FFFF00
      FFC7C1BAA5775493572D804518723B128D582F9E7A5BCCCBCB00000000000000
      0000000000000000FF00FFFF00FFC8C5C19C61388D4D29874B29A05D38B8704B
      CA916CD4AB8D000000000000000000000000000000000000000000FF00FFB79D
      88B1603890512F6437205F39246C44309E725BC3A895CFB6A1D2B3A1C3A392C7
      BAB4FF00FFFF00FFFF00FFFF00FFBCAA9CA8634074442C6B432EAA826AD3B5A3
      E0C2ADDCBFA7E7C8AFF0CFB6F0D3BBDFBDA7C6B8B1FF00FFFF00FFFF00FFFF00
      FF9B7961A07F6AD9BBA8D3AD93D6B39AE0C0A8EAC6B1FEDFC8FFF1DAFFF0D6F9
      D8BCD2A98FFF00FFFF00FFFF00FFC5BAB6C09D8ADAB194CA9F84BA947BAC8B74
      E1BAA5F0D2BCFFE9D3FFFFECFFFFF6FFEBD8CE9A7FFF00FFFF00FFCAC7C6B38C
      79DAAD8DD8A787DAAB8DB5907A886B5C9E867AFFDCCDFFEBDCFFF9ECFFFFF5FF
      F0DFCC9C7FFF00FFFF00FFA5887CE0B89ED9A586E0AD90EABB9FEFC2AA59473F
      322C28FBDAC6FFEADAFFEFE0FFF0E3FFE5D4C49E89FF00FFFF00FFAA8473D6A3
      83E0AE91F0C3A8FFD9C0FFE4CCF3C8B4241F1B7E6A60FFE3D0FFE5D3FFE6D3E5
      B69BCCC3BEFF00FFFF00FF794934D8A78AE9BC9EFFE0C2FFFFECFFFFF5FFF0D8
      51463D2F2A26F1CCB8FFE3CEF6CAB3CAB2A4FF00FFFF00FFFF00FFAF8066D8AA
      8CECC1A7FFECD3FFFFFEFFFFFFFFFBE7BDA2912824246E6259E4BCA6CEB6A7FF
      00FFFF00FFFF00FFFF00FFBE9F8DCE9E7FE7BCA3FFD9C4FFF1DAFFF8DBFFE9D4
      FDDBC874726F343230565250FF00FFFF00FFFF00FFFF00FFFF00FFCCCACAC19A
      84C89174EBBDA3FACDB8F5C8B4E9BAA2C3A08A6463611C191844403DFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFCCC6C2CBB7A9C9B2A3CAB6AACDC2BB
      FF00FFC8C8C868656271706DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0001
      36030000424D360300000000000036000000280000000F000000100000000100
      1800000000000003000000000000000000000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FF000000FF00FFDAB39580685080605080605070605070584070
      5840705040705040604830604830604830AF8C6FFF00FF000000D3B39AA48B82
      E0D0C0B0A090B0A090B0A090B0A090B0A090B0A090B0A090B0A090B0A090B0A0
      90604830FF00FF000000C8AD97B39B91FFE8E0FFF8F0FFF0E0FFE8E0F0D8D0F0
      D0B0F0C0A000A00000A00000A0007058406048308D7057000000B49383E0D8D0
      FFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F0E0E0F0D8C000FF1000FFB000A0008068
      50705040604830000000B09080F0E8E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      F8F0F0E8E000FF1000FF1000A000907060706050604830000000B09880D0C0B0
      D0B8B0C0B0A0B0A090B09880A088809080709070608068608060507058509080
      70806860705840000000C0A090FFF8F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFF8F0FFF0F0F0F0F0F0E8E0A08880907860806050000000DFC5AEB9A089
      D0B0A0C0A8A0D0B0A0C0A090B09080A08070907060806050706050807060B0A0
      90A08870806050000000FF00FFD9C3AFC0B0A0E0C8C0FFFFFFFFF8FFFFF8FFFF
      F0F0F0F0E0F0E0E0C0A8A0806050A09080C0B0A0806050000000FF00FFFF00FF
      F0D9C5C0B0A0FFFFFFF0E8E0D0C8C0D0C8C0D0B8B0D0C0B0E0D0D08068608060
      50B09890B0A090000000FF00FFFF00FFFF00FFE0C8B1F0E8E0FFFFFFFFFFFFFF
      FFFFFFF8FFFFF0F0F0E0D0D0B8B0806050C5AA97FF00FF000000FF00FFFF00FF
      FF00FFF6DFCCD0B8B0FFFFFFF0F0F0D0C8C0D0C8C0D0B8B0C0B0B0E0D8D08070
      60876757FF00FF000000FF00FFFF00FFFF00FFFF00FFE9D1C3E1D1D0FFFFFFFF
      FFFFFFFFFFFFFFFFFFF8FFF0E8E0D0B8B0806050EDD5C2000000FF00FFFF00FF
      FF00FFFF00FFFF00FFE9D2C4D0C0B0D0C0B0D0C0B0D0C0B0D0C0B0D0C0B0D0C0
      B0D0C0B0FF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FF000136
      030000424D360300000000000036000000280000001000000010000000010018
      000000000000030000120B0000120B00000000000000000000FF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FF729AAE3A90B75DA2C2739FB7BBC1C5
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC8C5C2A587659B774D98754B976F
      412471926BDBF9B5EDFE578598489FC84A85A6FF00FFFF00FFC9C6C19B774D9E
      7445A67848AD7E4DE6C195EAC799C8A377186E9E42D7FEA7E9F91D282B63BADF
      0C5784FF00FFFF00FFFF00FFAC8C57ECCBA0B68553AE7F4DA97645A5703DA278
      491372AC21C5F988E7FD3F505680CCEB156693FF00FFFF00FFC3BBB1A67341AE
      7947ECCDA5EDCFA7E0C199B081519B72430588C122B2ED4AC5F08BD0EE96DDF9
      2476A2FF00FFFF00FFCBCAC7AE844FA37744A37A4BA67E4FAD8454B48A5AE0AF
      78558896516E7D299CCA2DB7E351B0D44198BBFF00FFFF00FFFF00FFCAC9C6A3
      7D40F1C694F1CF9FF1CFA2F1CFA2F1CFA2CEB594999997E4C79E3C4240919190
      A09C85BDB4A7FF00FFFF00FFFF00FFB9AA8AECC594FAE0B7FAE3BDFAE3BDFAE3
      BDD9C7AAA2A19FF4DEB9454945A9A6A2D4C1A39A805DFF00FFFF00FFFF00FFFF
      00FFBD9E69FFE9C5FFF1D0FFF1D3FFF1D3FBEDD0A5A39E9E9B97A3A29F978C7B
      B2956EBCA07DCAC9C7FF00FFFF00FFFF00FFB39E76F9E2BDFFF5D8FFF7DFFFF7
      DFFFF7DFE4DDC9BFBEBBB9B6ADBBA076E8DABCAA895EC4BFB6FF00FFFF00FFFF
      00FFCAC8C4C8AC7CFFF4DBFFFBE7FFFBE8FFFBE8FFFBE8FFFBE8FFFBE8D7C19F
      E2D7C1A98A66CCCBCBFF00FFFF00FFFF00FFFF00FFB29C72F9E6CBFFFAE9FFFD
      F0FFFDF0FFFDF0FFFDF0FFFDF0F9F3E0BC9F7DDFC4A3C4BFB6FF00FFFF00FFFF
      00FFFF00FFCAC9C6BDA072FFF1E2FFFAF0FFFDF4FFFDF4FFFBF3FFFBF3FDFAEF
      B69972B4A485CBCAC8FF00FFFF00FFFF00FFFF00FFFF00FFBFB49DDABC99FFF0
      E0FFF3E7FFF3E6FFF1E4FAEADBF1E0CBE3CAAB9B7D54FF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFB6A580AD8C59A98A57A68954A48A55A9915FB09C71
      B7A887BFB49DCCCBCBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00013603
      0000424D36030000000000003600000028000000100000001000000001001800
      0000000000030000120B0000120B00000000000000000000FF00FFFF00FFFF00
      FFFF00FFFF00FFCBCBCAC3C0BDAAA2979A9080968A799B8F81FF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFC7C6C4BEB9B3ADA4969C8E7A938470
      8B7E689F917ECFBFB3A49C93FF00FFFF00FFFF00FFFF00FFFF00FFC9C8C7B2AA
      A0A1927FA0917D9F8E7BAE9F8AB7AB99BBAE9C71BEA2A4B29EA4988DFF00FFFF
      00FFFF00FFFF00FFCBCAC89D9282A59886AEA08FB1A596B0A697B3A999B9AF9F
      C4BCADC5CFC3DCD8CFE7DFD7AFA89FFF00FFFF00FFFF00FFC1B9ACAEA496B0A7
      98BFB6A8CFC6BBD9D2C6E2DCD0E7E0D5E0CFC1D8B39FD5AA97EFEBE4E7DFD7AC
      A59DFF00FFFF00FFBEB5A8D9D4C9E7DFD4EAD3BDE9BD9FE6A781E2956CDD8256
      DD7E53DD8156DF8A60ECD3C1EFEBE4B6ACA1D0CFCFFF00FFFF00FFFF00FFD8D7
      D4DAC3B5D9996CED9B5AF5A660F7BC89F9C7A0F9CBA8FAD2B3FAD7BCF4E6D7E8
      E3D9BCB4ABCDCDCCFF00FFFF00FFFF00FFFF00FFD5D4D3DACCBCC89F66EABF7B
      F5E0C6F5E0C7F5E0C7F5E0C7F5E0C6EFE6D3E0DBD1CDCDCBFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFDCDAD8CABEA1CABE94D7CCADCABD9CCDC1A2C5B697C5
      B89DA89B8ECCCCCCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB0AAA5
      E4DCCDE6DFD0D8CFC1CABDADC1B5A57E6E5FC1BBB5FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFBAB6B4897A73B3A79CB0A297B0A297AFA19696877C9C
      9088CCCCCCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCACACA81746EB7ADA5
      B2A79DB2A79DB1A69CAEA29775665FC9C7C5FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FF968D88A0958CADA298ADA298ADA298ACA1979080779C928CFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA9A3A184776EA29589A09487
      9E9286928579928479958981C7C6C4FF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFD2D2D2DBD7D3E5E2E0E7E5E3F5F4F2F5F3F3F2F0F0EEEDEDDDDDDCFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFDFDEDEDCDBDBCFCFCFCCCCCCFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0001360500
      00424D3605000000000000360400002800000010000000100000000100080000
      0000000001000000000000000000000000000000000000000000000000800000
      80000000808000800000008000800080800000C0C0C000C0DCC000F0CAA60000
      20400000206000002080000020A0000020C0000020E000004000000040200000
      40400000406000004080000040A0000040C0000040E000006000000060200000
      60400000606000006080000060A0000060C0000060E000008000000080200000
      80400000806000008080000080A0000080C0000080E00000A0000000A0200000
      A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0200000
      C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0200000
      E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000200040
      00400040006000400080004000A0004000C0004000E000402000004020200040
      20400040206000402080004020A0004020C0004020E000404000004040200040
      40400040406000404080004040A0004040C0004040E000406000004060200040
      60400040606000406080004060A0004060C0004060E000408000004080200040
      80400040806000408080004080A0004080C0004080E00040A0000040A0200040
      A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0200040
      C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0200040
      E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000200080
      00400080006000800080008000A0008000C0008000E000802000008020200080
      20400080206000802080008020A0008020C0008020E000804000008040200080
      40400080406000804080008040A0008040C0008040E000806000008060200080
      60400080606000806080008060A0008060C0008060E000808000008080200080
      80400080806000808080008080A0008080C0008080E00080A0000080A0200080
      A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0200080
      C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0200080
      E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C0002000C0
      004000C0006000C0008000C000A000C000C000C000E000C0200000C0202000C0
      204000C0206000C0208000C020A000C020C000C020E000C0400000C0402000C0
      404000C0406000C0408000C040A000C040C000C040E000C0600000C0602000C0
      604000C0606000C0608000C060A000C060C000C060E000C0800000C0802000C0
      804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A02000C0
      A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C02000C0
      C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000FF0000
      FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDA40000A4FDFDFDFD
      FDFDFDFDFDFDFDA400FFFF00A4FDFDFDFDFDFDFDFDFDFD00FF0000FF00FDFDFD
      FDFDFDFDFDFDFD0000FFFF000000FDFDFDFDFDFDFDFDFD0000FFFF0000070000
      000000000000FD0000FFFF000007BFBFBFBFBFBFBFFF000000FFFF0000072F2F
      2F2F2F2F2FBF00FD00FFFFFF000737373737373737BF00FD00FFFFFF0007FFFF
      FFFFFFFFFFFF00FDFD00000007FFFFFFFFFFFFFFFFFF00FDFDFDA40990909090
      90909090900900FDFDFDA4099090909090909090900900FDFDFDA4FF09090909
      0909090909FF00FDFDFDFDA4A4A4A4A4A4A4A4A4A4A4FDFDFDFDFDFDFDFDFDFD
      FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFF00FF000136030000
      424D360300000000000036000000280000001000000010000000010018000000
      00000003000000000000000000000000000000000000FF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF800000FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FF800000800000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF6633FF6633CC0033CC0033CC0033CC0033800000FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF9966FFFF66FFCC66CC
      9900CC9900CC9900FF6633CC0033000000000000000000000000000000000000
      000000FF00FFFFCC66FF9966FF9966FF6633FF6633FF6633CC003380E0E080E0
      E080E0E080E0E080E0E080E0E080E0E0FFFFFF000000FF00FFFF00FFFF00FF80
      8080CC0033CC003300A0E000A0E000A0E000A0E000A0E000A0E000A0E000A0E0
      80E0E0000000FF00FFFF00FFFF00FF808080CC003300C0E000C0E000C0E000C0
      E000C0E000C0E000C0E000C0E000C0E080E0E0000000FF00FFFF00FFFF00FF80
      8080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF000000FF00FFFF00FFFF00FF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FF80
      8080F0CAA6804000804000804000804000804000804000804000804000804000
      F0CAA6000000FF00FFFF00FFFF00FF808080F0CAA68040008040008040008040
      00804000804000804000804000804000F0CAA6000000FF00FFFF00FFFF00FF80
      8080FFFFFFF0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6
      FFFFFF000000FF00FFFF00FFFF00FFFF00FF8080808080808080808080808080
      80808080808080808080808080808080808080FF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00013603000042
      4D36030000000000003600000028000000100000001000000001001800000000
      0000030000130B0000130B00000000000000000000FF00FFFF00FF7E7E7E7E7E
      7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7EC1C1C1FF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF7E7E7EF3F3F3D5D5D5D5D5D5D5D5D5F3F3F37E7E7E
      C3C3C3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7E7E7E7E7E7E7E7E7EF3F3
      F3F3F3F3F3F3F3F3F3F3F3F3F37E7E7EC4C4C4FF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FF7E7E7ED5D5D57E7E7EF3F3F3D5D5D5D5D5D5D5D5D5F3F3F37E7E7E
      C3C3C3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7E7E7ED4D4D47E7E7EF3F3
      F3F3F3F3F3F3F3F3F3F3F3F3F37E7E7EC4C4C4B0AFADA7A4B29494ADFF00FFFF
      00FFFF00FF7E7E7EE0E0E07E7E7EF3F3F3D5D5D5D5D5D5D5D5D5F3F3F37E7E7E
      C5C5C522222E27375F5346447D7A84FF00FFFF00FF7E7E7EEEEEEE7E7E7EF3F3
      F3F3F3F3F3F3F3F3F3F3F3F3F37E7E7EC4C4C429346746CDEC89F7EA92C1C08C
      7C7BFF00FF7E7E7EF8F8F87E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E
      41698F40CBED4CFFFF67FBFF72CDDD53656ABBB9B87E7E7EF7F7F7FFFFFFFFFF
      FFFFFFFFFFFFFF7E7E7ED48F8E58A2DD40FFFF51FFFFB0C2C085949756373379
      B5BDD0D7D97E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7EDBA5B655A0D2
      64DFE2F47D61FF6D409A938D9627069B61538994BDC5BDB7D4AC94FFFFFAFFFF
      FFFFFFFFF9E2E5E3C2C1E7B6B7748EBC81A4B0EA8A6BA9BDAF79C0C3DE481CCA
      4B297478A5B9A99EF9E7E5FFFFFFFFFFFFFFFBFCF7DFE0DDBBBBF3C2B6B79EC3
      2A9BD619F4FF03F0FF15E8FF91DBCAB986769696B4B69E8FFFF6F8FFFFFFFFFF
      FFFFFCFDF5DEDEE8C9CAF0D5D3FFF5F7BCCAEF55B3F212B6FF10C7FC28CCF963
      83B8CBCBCCB49481FFFFFFFFFFFFFFF9FFF6DFE4FAE4EBFFFBFFFFFFFFFFFFFF
      FFFFFFFFDEDB9E888F8C90ACB7B6C2FF00FFFF00FFC1B8B2B6A090C0A191D5B2
      A7E1BFBAD1AFA4C9AB9DBDA392BBA393B8A598C0B1A4CAC9C7FF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFC3BBB6B8A496BAA292B7A396BCAFA5C6C1BDFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000136030000424D
      3603000000000000360000002800000010000000100000000100180000000000
      00030000130B0000130B00000000000000000000FF00FFFF00FFFF00FFFF00FF
      4984A15A9AB8669EBA5F97B45B91AD779DB0C4C8C9FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF769AAD238DC160CBF0ACECFFA5E6FD88D7F63C
      92C12A89BD4C8AA9B3BEC4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF457E9D
      30A9E04ED8FFA2ECFFACEAFD92D7EF15212970CAF12BA2E22179ACFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF2F749B32B1EA34CFFF87E8FFAFEDFF54748029
      3B4760C4F32CAAEA2081B8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF216D9C
      2CABEC23C1FB67E0FFA3EDFF3F4E54202F377ED0F537B2EE1C87BEFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF176CA1259DE417B3F445D7FF87E8FFB0EDFFB6
      E3F374CFF547BAF0258BBFFF00FFFF00FFFF00FFFF00FFFF00FFCACBCB0974B1
      207ECB25A3E62CC7FB5FD8F99DE9FDA6E7FD82D5F758C1F12D91C1FF00FFFF00
      FFFF00FFFF00FFFF00FFC3C7C90488C61881B13A7797439DCB47AAE2379BDA3C
      A0DB76CAF06EC1EC3F92BDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF536F7F
      4F4F4F4C4C4C5068720586BC17A5D531A3C2377A9652C1EA478EAFFF00FFFF00
      FFFF00FFFF00FFFF00FFA9A9A95B5B5B565656727272919FA96491A8448AA629
      7E9F32617B3789A795ACB9FF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B5E5E5E
      7D7D7D9A9A9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFA6A6A66464646E6E6E797979FF00FFFF00FFA2A2A26E6E6EA2
      A2A2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9595958D8D8D787878
      898989FF00FF757575696969CBCBCB959595FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFC9C9C99F9F9F929292C3C3C3818181848484F8F8F8BEBEBEB4
      B4B4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFACACACC0C0C0
      BEBEBEABABABB4B4B4A1A1A1ACACACFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFB2B2B28A8A8A8686868A8A8ABABABAFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000136030000424D36
      0300000000000036000000280000001000000010000000010018000000000000
      030000C40E0000C40E00000000000000000000FF00FFFF00FFFF00FFFF00FF90
      90913341537C7F82CACACAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFC8C8C88F8F8F4B5563215E9A25649E717C879F9F9FADAD
      ADB0B0B0BEBEBEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8F9091143F7715
      447D3588C83789C71D5A971C568F1F517D235A86285C8375828CC7C7C7FF00FF
      FF00FFFF00FFCACACA3A4D6513488E1A528F3F96D33889C52781C72D8ED03092
      CB39AAE23EB5E93BACDD4A778FB3B3B4FF00FFFF00FF95959714407A195BA626
      6298459ED8348BC83579A5378FBE3BADE1439DC24790AB4CB0D23DAED83C8BB3
      A5AAAECBCBCB48586B144C8D1D60A03C8BC0459DD33591C7466E823BA4D242BB
      E84F85984F809148C6F33BAEE236A9EA4C89B4C4C4C435618A2C7CBD2865984E
      ACE03D95CB4079953C88A941B8E6164E010963000963001750013EA5DF4195CC
      C0C4C8A7A7A72A567F27699F499DCE4DA8DA4CA3CE56B9DC72B1C2045E0000D8
      1D00D70000D70400DA391C5D0594AABBFF00FF676B6F28619161B7E362BAE64C
      ABDA5598AE67AEBF04600100DC5700D820FFFFFFFAFAFA00DA3600DC671C5D05
      FF00FF445669549CC77DC8EC56A3CF5BB7DF6AC2D81C5D0531DF8800DC5E00DA
      39FFFFFFFAFAFA00DA4800DD6B43E4971C5A01ADB4BB76A1BF6AA9CFA6B8C5B5
      BDC37BA2B81C5D0523DD80FEFEFEFAFAFAFFFFFFFAFAFAFAFAFAFFFFFF18DD79
      1C5D05FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1C5D0500DD6BFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF00DD6E1C5D05FF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FF1C5D0500DC6200DD6E4FDF95FFFFFFFFFFFF5BDF9B18DD791DE282
      1C5D05FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1C5D0512DD7779E0
      AAFFFFFFFFFFFF70E0A623DD801C5D05FF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF1C5D0500DD6775E0A859E09900DF691C5D05FF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1C5D
      051C5D051C5D051C5D05FF00FFFF00FFFF00FFFF00FF000136030000424D3603
      0000000000003600000028000000100000001000000001001800000000000003
      0000120B0000120B00000000000000000000FF00FFFF00FFFF00FFFF00FFFF00
      FFC6C6C9B6B6C1A4A5B79094AC164E0109630009630017500180839EFF00FFFF
      00FFFF00FFFF00FF4151832B41731C366913316012345C254962045E0000D81D
      00D70000D70400DA391C5D05FF00FFFF00FFFF00FFFF00FF44648A8C97A7BCB8
      BACFC5C3DACDC504600100DC5700D820FFFFFFFAFAFA00DA3600DC671C5D05FF
      00FFFF00FFFF00FF6F839EE0D2C9E5D8D0ECDFDA1C5D0531DF8800DC5E00DA39
      FFFFFFFAFAFA00DA4800DD6B43E4971C5A01FF00FFFF00FF7B89A1EADDD7F5EA
      E7F6EDE91C5D0523DD80FEFEFEFAFAFAFFFFFFFAFAFAFAFAFAFFFFFF18DD791C
      5D05FF00FFFF00FF73819EEBDFDAF7EFEDF9F1EE1C5D0500DD6BFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF00DD6E1C5D05FF00FFFF00FF6B799EEDE1DDFAF4
      F1FAF6F41C5D0500DC6200DD6E4FDF95FFFFFFFFFFFF5BDF9B18DD791DE2821C
      5D05FF00FFFF00FF66759AEEE5E0FBF9F7FDFAF9FDFBFB1C5D0512DD7779E0AA
      FFFFFFFFFFFF70E0A623DD801C5D05FF00FFFF00FFFF00FF637296EFE8E3FDFD
      FBFDFDFDFFFDFDFFFDFD1C5D0500DD6775E0A859E09900DF691C5D05FF00FFFF
      00FFFF00FFFF00FF617197EFE9E5FFFDFDFFFFFFFFFFFFFDFDFDFDFDFD1C5D05
      1C5D051C5D051C5D05203868FF00FFFF00FFFF00FFFF00FF7A82A0EEE8E3FFFD
      FDFDFDFDFDFDFBFDFAF9FBF7F6FAF5F4FAF3F0F9F0EDB5B7C0203969C9C9CAFF
      00FFFF00FFFF00FF495C91DEDCDDFAF9F8FDF8F8FAF4F3F9F2F1F8EEECF6ECE9
      F5E8E4F3E6E2B2B2B81F3A6AC0C0C6FF00FFFF00FFFF00FF5160909B8171A68C
      7FAA9181B09687A187769E8272A48977AE9281B497867C7B801C3A68B5B5C0FF
      00FFFF00FFFF00FF5E67944F7098AA9C94B4A7A1B9ADA7C3B8B3CCC0BDD4CAC7
      C9BFBBB2A19674747A1F4071ACACBBFF00FFFF00FFFF00FF9899B24258943E4F
      7F826F70B2A29AAC9C95AFA099AA9689817E7F456894276AC1234F86A3A3B6FF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFC7C6C7AE9483B7A08FAD9380A9A3AA
      9195AD8B91AC8B93B09097AEC6C6C9FF00FF}
  end
  object UniNativeImageListDetail: TUniNativeImageList
    Left = 88
    Top = 658
    Images = {
      08000000FF00FF000136030000424D3603000000000000360000002800000010
      00000010000000010018000000000000030000120B0000120B00000000000000
      000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFB5B8C66986BA5E7FB4B0B4C5FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFC7C8CB8595BC3C78BD3781CF2364A9365F
      A38C99BDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9FA6C15C84BA37
      7CC64C93DC62AAEF69ADF24181C1256BAD1A66AD2664AD7589B7C3C4CAFF00FF
      FF00FFA3ACC33579BF4C91DB6DAEEF75B7F96BAEF362A7EF69A9EC438BD3287A
      CB3A86D24189D1307DC7176BB96280B8BBBFC96F8ABA7DBBF889C7FF74B4F671
      B0F572B1F572B3F676B3F35298E23C8CE04390E04290E04894E556A2EC428CD8
      758AB97B93BD7EB8F68BC6FF82BEFC82BEFC82BEFC84C1FE84BDFA5A9FE64B97
      E6519BE7519BE7519BE756A0EC519BE4728DBB7B93BD89C1FD99CFFF90C7FF90
      C7FF90C7FF91CBFF91C7FF67A9ED58A2ED5DA5EF5DA5EF5DA5EF64AAF35AA2E8
      738DBB7A94BD92C9FFA2D8FF98CFFF98CFFF98CFFF9BD2FF98CCFF75B4F66FB4
      FC6FB0F66DAEF56EB0F674B6FC6BACEF728EBB7E95BF93C9FFA3D8FF9BCFFF9B
      CFFF99CCFF99CCFF9BCBFF78AEEA5E9CE484C2FF92D1FF82C1FF85C1FF7AB7F6
      6F8DBB7C95BF97CCFFA2D2FF96C8FF98CBFF9BCFFF9BCFFF9FD6FF9FD6FF7DB5
      E04179B3437EBC78B3F096D1FF94CCFF6D8EBC7A8FBC9BCCFDC4FAFFACE6FFA3
      DFFFAAE8FFADEFFFA7E8FFA2E0FF9FD9FA6092C24374A671A6DC89BFF098CBF9
      5E86BABABDC86089BB70AEDAADF3FFC8FFFFBDFFFFB0F2FF9BD9FC9BD8FAA7E0
      FFBFF8FFC5FFFF99D2FF5E99D13573B19DA7C1FF00FFFF00FFC6C6CA7C99C060
      99C74986BE67A9DCA3E5FEA5E8FF7CBFEE639DD05C8FBE8D9CBEB8BAC7FF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAFB3C57A98BE8298BEB8B8
      C6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF000136050000424D360500000000000036040000280000001000
      0000100000000100080000000000000100000000000000000000000100000000
      000000000000000080000080000000808000800000008000800080800000C0C0
      C000C0DCC000F0CAA6000020400000206000002080000020A0000020C0000020
      E00000400000004020000040400000406000004080000040A0000040C0000040
      E00000600000006020000060400000606000006080000060A0000060C0000060
      E00000800000008020000080400000806000008080000080A0000080C0000080
      E00000A0000000A0200000A0400000A0600000A0800000A0A00000A0C00000A0
      E00000C0000000C0200000C0400000C0600000C0800000C0A00000C0C00000C0
      E00000E0000000E0200000E0400000E0600000E0800000E0A00000E0C00000E0
      E00040000000400020004000400040006000400080004000A0004000C0004000
      E00040200000402020004020400040206000402080004020A0004020C0004020
      E00040400000404020004040400040406000404080004040A0004040C0004040
      E00040600000406020004060400040606000406080004060A0004060C0004060
      E00040800000408020004080400040806000408080004080A0004080C0004080
      E00040A0000040A0200040A0400040A0600040A0800040A0A00040A0C00040A0
      E00040C0000040C0200040C0400040C0600040C0800040C0A00040C0C00040C0
      E00040E0000040E0200040E0400040E0600040E0800040E0A00040E0C00040E0
      E00080000000800020008000400080006000800080008000A0008000C0008000
      E00080200000802020008020400080206000802080008020A0008020C0008020
      E00080400000804020008040400080406000804080008040A0008040C0008040
      E00080600000806020008060400080606000806080008060A0008060C0008060
      E00080800000808020008080400080806000808080008080A0008080C0008080
      E00080A0000080A0200080A0400080A0600080A0800080A0A00080A0C00080A0
      E00080C0000080C0200080C0400080C0600080C0800080C0A00080C0C00080C0
      E00080E0000080E0200080E0400080E0600080E0800080E0A00080E0C00080E0
      E000C0000000C0002000C0004000C0006000C0008000C000A000C000C000C000
      E000C0200000C0202000C0204000C0206000C0208000C020A000C020C000C020
      E000C0400000C0402000C0404000C0406000C0408000C040A000C040C000C040
      E000C0600000C0602000C0604000C0606000C0608000C060A000C060C000C060
      E000C0800000C0802000C0804000C0806000C0808000C080A000C080C000C080
      E000C0A00000C0A02000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0
      E000C0C00000C0C02000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0
      A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
      FF00FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD0404040404040404040404FDFD
      FDFDFDFD04C0D9D9E1E1E1E104FDFDFDFDFDFDFDFD04C0D9D9E1E104FDFDFDFD
      FDFDFDFDFDFD04C0D9D904FDFDFDFDFDFDFDFDFDFDFDFD04C004FDFDFDFDFDFD
      FDFDFDFDFDFDFDFD04FDFDFD12121D1DFDFDFDFDFDFDFDFDFDFDFD12373F3F3F
      1DFDFDFDFDFDFDFDFDFD1237FBFBFB3F3F1D0C454545454545FD1237FBFBFFFB
      3F1D0C1FF9F9F9F945FD1237FBFFFBFB3F1D0C1F1FF9F9F945FD120337FBFBFB
      3F1D0C0F1F1FF9F945FDFD120337373712FD0C0F1F1F1FF945FDFDFD12121212
      FDFD0C47470F1F1F45FDFDFDFDFDFDFDFDFD0C0C0C0C0C0C0CFDFDFDFDFDFDFD
      FDFDFF00FF000136030000424D36030000000000003600000028000000100000
      0010000000010018000000000000030000000000000000000000000000000000
      00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFB05840A04030803030602820503030FF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB07060FFA070FFB890
      B04830D06040904830603830FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFC08070FFC8A0FF9860B04830D06040D0604070384030583030
      4030FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF0D8D0C09080E09880
      FFC090C05840904040B0C8B040B05040A050304030FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF606860606870907060B0D8C040A84050B86040
      B850407840FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF303030C0C8C0
      B0A8A060687090B09090D0A040A840509050C0C8C0FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF505850D0D8D0C0C8C0A0A0A0807880706060609060D0
      D8D0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF606060807880
      808880D0D0D0909890B0B0B0606060707070FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF606860C0C0C0908890504850707070C0C8C0B0B0B070
      7070FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707870
      606860404840807880908890D0D0D0A0A8A0FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF706870C0C8C090889050505070
      7870FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFE0D8D0707060505850706860D0C8C0FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FF000136030000424D3603000000000000360000002800000010000000
      1000000001001800000000000003000000000000000000000000000000000000
      FF00FFFF00FFCDB6A88068608060507058407058407050407050406050406050
      30605030705040B89A83FF00FFFF00FFFF00FFFF00FF877766D0C0B0D0B8B0D0
      B0A0C0B0A0C0A8A0C0A8A0C0A090C0A090B0A090B09890775E46FF00FFFF00FF
      FF00FFFF00FF967E66F0E0D0D0C0B0D0B8B0D0B0B0C0B0A0C0A8A0C0A8A0C0A0
      90C0A090B0A090775E46FF00FFFF00FFFF00FFFF00FF967E75F0E0D0C08870B0
      7050D0B8B0C08870B07050C0B0A0C08870B07050C0A090775E46FF00FFFF00FF
      FF00FFFF00FF968675F0E0E0FFC8B0C08870D0C0B0F0C8B0C08870C0B0A0F0C8
      B0C08070C0A890775E46FF00FFFF00FFFF00FFFF00FF968D85F0E8E0E0D0C0D0
      C8C0D0C0C0D0C0B0D0B8B0D0B8B0C0B0A0C0B0A0C0A8A0776655FF00FFFF00FF
      FF00FFFF00FFA58D85FFE8E0C09070B07050E0C8C0C09080B07050D0B8B0C090
      70B07050C0B0A0866655FF00FFFF00FFFF00FFFF00FFA59585FFF0F0FFC8B0C0
      8870E0D0C0F0C8B0C08870D0C0B0F0C8B0C08870D0B0A0866D55FF00FFFF00FF
      FF00FFFF00FFA59C94FFF0F0E0E0E0E0D8D0E0D0D0E0D0D0E0C8C0D0C8C0D0C0
      B0D0C0B0D0B8B0866D55FF00FFFF00FFFF00FFFF00FFB4A494FFF8F09080D040
      30A0E0D8D09080D04030A0E0C8C09080D04030A0D0C0B0867564FF00FFFF00FF
      FF00FFFF00FFB4A4A3FFF8F0C0C0E09080D0E0E0E0C0C0E09080D0E0D0D0C0C0
      E09080D0D0C0C0957564FF00FFFF00FFFF00FFFF00FFB4ABA3FFF8FFFFE0D0FF
      D0B0FFD0B0FFC090F0B890D0A080D0A080D0B0A0D0C8C0957C73FF00FFFF00FF
      FF00FFFF00FFB4ABA3FFFFFFFF9860FFA060FFA060FFA060FFA060FFA060FFA0
      60B06850C0A890958473FF00FFFF00FFFF00FFFF00FFB4B3A3FFFFFFE07840F0
      D8D0F0D8D0F0C8B0E0B0A0E0A080E08050A05830D0A090958473FF00FFFF00FF
      FF00FFFF00FFDAC7C0BEB3A9F0B8A0D09070D08860D08050D07040D06830C060
      30D08060A08880C6A891FF00FFFF00FFFF00FFFF00FFFF00FFCCC4B3B0A8A0B0
      A8A0B0A090B09890B09890A09890A09080A08880C9AE98FF00FFFF00FFFF00FF
      FF00FF000136030000424D360300000000000036000000280000001000000010
      000000010018000000000000030000C21E0000C21E00000000000000000000FF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDBEEF2CAE3F0
      A3BCED9FB7EAA1B3DAD2D9E1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFC2F0FB52D1F45AC2DF62D6F442A3DA0249D00044CA01339B48655E97A18AFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FF9FE9FE00BFF726B2DA60DCFB41A3DB
      0051D6004FD0003B9D375C44627549FF00FFFF00FFFF00FFFF00FFC7C8CB8595
      BCA0ECFE00C6F80499C364B3B15A917D035FDC035CD60146A3446D4E6E8552FF
      00FFFF00FF9FA6C15C84BA377CC64C93DCA1EFFE02CDF8009CC370AFA06B956E
      156DE2146ADC0C51A8517B5A78925AA3ACC33579BF4C91DB6DAEEF75B7F96BAE
      F3A8F2FE11D7F905A2C87EB6A67BA27C2679E72576E31C5BAE72937FAABB976F
      8ABA7DBBF889C7FF74B4F671B0F572B1F5ADF4FE1FDCF911A7CB88BBAE90AE77
      6A989672A6E07A9FC9DEE4E5758AB97B93BD7EB8F68BC6FF82BEFC82BEFC82BE
      FCB2F6FE2AE2F91AACCE96C8CAD3DEC6CDD7C1519BE756A0EC519BE4728DBB7B
      93BD89C1FD99CFFF90C7FF90C7FF90C7FFDDF5F781E8F361C7DDBCDCE35DA5EF
      5DA5EF5DA5EF64AAF35AA2E8738DBB7A94BD92C9FFA2D8FF98CFFF98CFFF98CF
      FF9BD2FF98CCFF75B4F66FB4FC6FB0F66DAEF56EB0F674B6FC6BACEF728EBB7E
      95BF93C9FFA3D8FF9BCFFF9BCFFF99CCFF99CCFF9BCBFF78AEEA5E9CE484C2FF
      92D1FF82C1FF85C1FF7AB7F66F8DBB7C95BF97CCFFA2D2FF96C8FF98CBFF9BCF
      FF9BCFFF9FD6FF9FD6FF7DB5E04179B3437EBC78B3F096D1FF94CCFF6D8EBC7A
      8FBC9BCCFDC4FAFFACE6FFA3DFFFAAE8FFADEFFFA7E8FFA2E0FF9FD9FA6092C2
      4374A671A6DC89BFF098CBF95E86BABABDC86089BB70AEDAADF3FFC8FFFFBDFF
      FFB0F2FF9BD9FC9BD8FAA7E0FFBFF8FFC5FFFF99D2FF5E99D13573B19DA7C1FF
      00FFFF00FFC6C6CA7C99C06099C74986BE67A9DCA3E5FEA5E8FF7CBFEE639DD0
      5C8FBE8D9CBEB8BAC7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFAFB3C57A98BE8298BEB8B8C6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FF000136030000424D36030000000000003600000028000000100000001000
      0000010018000000000000030000232E0000232E00000000000000000000FF00
      FFFF00FFFF00FFFF00FFC9D2DE698FBF597FADC9D2DEFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFE8EBEF99B0CD6894C8619ADA71A9E6
      5181B74475AF5F85B4B6C5DAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF85A0
      C06C9FD97BB0EA79AFEB76ACE879ADE8588FD0538DCF5690D0538BCB5A89C1A7
      B8CEFF00FFFF00FFFF00FFFF00FF6C94C392C3F886B9F186B8F186B8F188BAF0
      649DDD629BDE629BDE629BDE6BA4E6618ABDFF00FFFF00FFFF00FFFF00FF6F96
      C4A1CEFC95C4FA95C4FA95C4FA96C6F970A7E66FA7E86FA7E86FA7E877AEEE62
      8CBEFF00FFFF00FFFF00FFFF00FF7198C5ABD7FF9ECCFF9ECCFF9ECCFF9FCCFE
      80B5F07EB3EF7DB3EE7DB3EF87BCF6668FC1FF00FFFF00FFFF00FFFF00FF7398
      C7ACD8FF9FCDFF9DC9FB9EC9F8A0CCF989B5E76F9CCF8CC0F393C5F997C8FB6B
      93C3FF00FFFF00FFFF00FFFF00FF7398C4B7E1FCA2D2FAA6D9FDA8DEFFABE2FF
      A8DEFE92C3E94D729D6A95CA99C6F27197C63F527FACAEC3F0F0F1FF00FFD0D7
      E08EAED098CEEAB3EEFFADE3FB9AD0FBA4D5F2AEDEFAABDEF792C1E17DA0C66E
      8CB31B4E8E123E762A4272A5A7BAFF00FFFF00FFEAEBEFAFC1D96B88B18DBBDB
      8AB4D76692C25486BE4C86C81F61B32871C42567B0205A9E154680545D87FF00
      FFFF00FFFF00FFFF00FF495A8C256DBB2A76C82D7ED73188E13084D8226DBF2E
      80D92B79CE276EBE1C5AA0545F8CFF00FFFF00FFFF00FFFF00FF4960952D84DE
      328BE23793E63A99E73186D52269B6338BE03088E12D7ED7236ABD505F8EFF00
      FFFF00FFFF00FFFF00FF4D659B3999EC3892E13083CF2A77C4358AD12B75B71B
      56992977C82F86DC2677D0516192FF00FFFF00FFFF00FFFF00FF4B6295267AC8
      2978CB348DE249AFFA4FBAFF49AEE52B76B91B50861F5EA11C65B34D5D90FF00
      FFFF00FFFF00FFFF00FFD3D2DA7B8BB33571BC3287D92673BF246DBE2C80D239
      98E8419ED44B87C05E779DB9BACBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      EDECEEB8B8C98F97B45175AE5C76A7A3A9C3CFCED7FF00FFFF00FFFF00FFFF00
      FF000136030000424D3603000000000000360000002800000010000000100000
      00010018000000000000030000A0860100A08601000000000000000000FF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF09760B54AB5CFF00FFCFCFECBFBFE6BFBFE6BFBFE6BFBFE6F3F3FAFF00
      FFECD9CFEDDCD3FF00FFFF00FF9CCA9F499B4C0C7B0F2A8B2CDEEFDE4752C013
      2CB81127B51125B30C1AACCFCFECFF00FFB56940BA7550FF00FFFF00FF138519
      1385190B7A0F128516489B4AA9A9DD060FA48686CFBFBFE6BFBFE6E0CDCAB66B
      40A64910A64914B46840F0E2DB91CE97E3F4E50D7B110D7C111184167070C60C
      1EAE2E35B24040B3DBDBF0ECD9CFB66B40A74A10A64A14B46840F0E2DBA6D2AA
      15891E178C2015891C4EA5534040B30C1EAE0917AA00009ACFCFECFF00FFF7EF
      EBA94D15AC5520FF00FFFF00FF1B91261C932709740C219C2C90CD95CFCFEC24
      3EBE4352C1BFBFE6FF00FFFF00FFCA9477A44200A44100D3A68FFF00FF219A30
      219B2F12821915891D15881CFF00FF3247BF2B43C0B2B2E0BFBFE6E1CAB9AB4A
      00B86D3EB76A3AA44100FAF5F3CEF0D554AB5C14851C168A2057B361FF00FFC3
      C6E91231BB2B43BF1B2AB19E6257AF4F00F3E7E1EEDED5A44100C78E6FFF00FF
      FF00FF14861E54AB5CFF00FFFF00FFFF00FFEEEEF8BBBBE4D5D5EEE7D0C6EBD7
      CDFF00FFFF00FFE9D4C9EAD5CBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      000136030000424D360300000000000036000000280000001000000010000000
      01001800000000000003000000000000000000000000000000000000FF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD08050D08050D08050D08050FF00
      FFD08060D08860D08860D08860FF00FFD08860D08860D08860D08860FF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000000000000000000000FF00
      FF000000000000000000000000FF00FF000000000000000000000000FF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD08050D08050D08050D08050FF00
      FFD08060D08060D08860D08860FF00FFD08860D08860D08860D08860FF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7070704040400008
      00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FF707070505050100810FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7070707070704040
      40FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FF707070909890504850E3CCB8FF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD3C8B9909090D0C8C05058
      50BAA69CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFDACBBF808880F0F0F0E0D8D0909890404840D0BCACFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFE5D3C9707070F0E8F0FFF8FFF0E8E0D0D0
      D0707070404840D9C1AEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDFCFC770
      7070C0C8C0FFFFFFF0F8F0F0F0F0D0D8D0B0A8B0606060404840CDB5A2FF00FF
      FF00FFFF00FFFF00FFFF00FFC0B8C0C0C0C0D0C8D0C0C0C0B0B8B0B0B0B0B0B0
      B0A0A0A0808080606060404840FF00FFFF00FFFF00FFFF00FFFF00FF}
  end
  object UniNativeImageListReleases: TUniNativeImageList
    Left = 120
    Top = 658
    Images = {
      04000000FF00FF0001F6000000424DF600000000000000760000002800000010
      00000010000000010004000000000080000000C40E0000C40E00001000000000
      0000000000000000008000008000000080800080000000800080008080000080
      808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FF
      FFFF00DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
      DDDDDDDDD000000000DDDDDDDD00DDDDD0DDDDDDDDD00DDDDDDDDDDDDDDD00DD
      DDDDDDDDDDDDD00DDDDDDDDDDDDD00DDDDDDDDDDDDD00DDDDDDDDDDDDD00DDDD
      D0DDDDDDD000000000DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
      DDDDDDFF00FF000136030000424D360300000000000036000000280000001000
      0000100000000100180000000000000300000000000000000000000000000000
      0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD08050D08050D080
      50D08050FF00FFD08060D08860D08860D08860FF00FFD08860D08860D08860D0
      8860FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000000000000000
      00000000FF00FF000000000000000000000000FF00FF00000000000000000000
      0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD08050D08050D080
      50D08050FF00FFD08060D08060D08860D08860FF00FFD08860D08860D08860D0
      8860FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7070
      70404040000800FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FF707070505050100810FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7070
      70707070404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FF707070909890504850E3CCB8FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD3C8B99090
      90D0C8C0505850BAA69CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFDACBBF808880F0F0F0E0D8D0909890404840D0BCACFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE5D3C9707070F0E8F0FFF8
      FFF0E8E0D0D0D0707070404840D9C1AEFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFDFCFC7707070C0C8C0FFFFFFF0F8F0F0F0F0D0D8D0B0A8B0606060404840
      CDB5A2FF00FFFF00FFFF00FFFF00FFFF00FFC0B8C0C0C0C0D0C8D0C0C0C0B0B8
      B0B0B0B0B0B0B0A0A0A0808080606060404840FF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FF000136030000424D36030000000000003600000028000000100000
      0010000000010018000000000000030000000000000000000000000000000000
      00FF00FFFF00FFCDB6A880686080605070584070584070504070504060504060
      5030605030705040B89A83FF00FFFF00FFFF00FFFF00FF877766D0C0B0D0B8B0
      D0B0A0C0B0A0C0A8A0C0A8A0C0A090C0A090B0A090B09890775E46FF00FFFF00
      FFFF00FFFF00FF967E66F0E0D0D0C0B0D0B8B0D0B0B0C0B0A0C0A8A0C0A8A0C0
      A090C0A090B0A090775E46FF00FFFF00FFFF00FFFF00FF967E75F0E0D0C08870
      B07050D0B8B0C08870B07050C0B0A0C08870B07050C0A090775E46FF00FFFF00
      FFFF00FFFF00FF968675F0E0E0FFC8B0C08870D0C0B0F0C8B0C08870C0B0A0F0
      C8B0C08070C0A890775E46FF00FFFF00FFFF00FFFF00FF968D85F0E8E0E0D0C0
      D0C8C0D0C0C0D0C0B0D0B8B0D0B8B0C0B0A0C0B0A0C0A8A0776655FF00FFFF00
      FFFF00FFFF00FFA58D85FFE8E0C09070B07050E0C8C0C09080B07050D0B8B0C0
      9070B07050C0B0A0866655FF00FFFF00FFFF00FFFF00FFA59585FFF0F0FFC8B0
      C08870E0D0C0F0C8B0C08870D0C0B0F0C8B0C08870D0B0A0866D55FF00FFFF00
      FFFF00FFFF00FFA59C94FFF0F0E0E0E0E0D8D0E0D0D0E0D0D0E0C8C0D0C8C0D0
      C0B0D0C0B0D0B8B0866D55FF00FFFF00FFFF00FFFF00FFB4A494FFF8F09080D0
      4030A0E0D8D09080D04030A0E0C8C09080D04030A0D0C0B0867564FF00FFFF00
      FFFF00FFFF00FFB4A4A3FFF8F0C0C0E09080D0E0E0E0C0C0E09080D0E0D0D0C0
      C0E09080D0D0C0C0957564FF00FFFF00FFFF00FFFF00FFB4ABA3FFF8FFFFE0D0
      FFD0B0FFD0B0FFC090F0B890D0A080D0A080D0B0A0D0C8C0957C73FF00FFFF00
      FFFF00FFFF00FFB4ABA3FFFFFFFF9860FFA060FFA060FFA060FFA060FFA060FF
      A060B06850C0A890958473FF00FFFF00FFFF00FFFF00FFB4B3A3FFFFFFE07840
      F0D8D0F0D8D0F0C8B0E0B0A0E0A080E08050A05830D0A090958473FF00FFFF00
      FFFF00FFFF00FFDAC7C0BEB3A9F0B8A0D09070D08860D08050D07040D06830C0
      6030D08060A08880C6A891FF00FFFF00FFFF00FFFF00FFFF00FFCCC4B3B0A8A0
      B0A8A0B0A090B09890B09890A09890A09080A08880C9AE98FF00FFFF00FFFF00
      FFFF00FF000136030000424D3603000000000000360000002800000010000000
      10000000010018000000000000030000A0860100A08601000000000000000000
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF09760B54AB5CFF00FFCFCFECBFBFE6BFBFE6BFBFE6BFBFE6F3F3
      FAFF00FFECD9CFEDDCD3FF00FFFF00FF9CCA9F499B4C0C7B0F2A8B2CDEEFDE47
      52C0132CB81127B51125B30C1AACCFCFECFF00FFB56940BA7550FF00FFFF00FF
      1385191385190B7A0F128516489B4AA9A9DD060FA48686CFBFBFE6BFBFE6E0CD
      CAB66B40A64910A64914B46840F0E2DB91CE97E3F4E50D7B110D7C1111841670
      70C60C1EAE2E35B24040B3DBDBF0ECD9CFB66B40A74A10A64A14B46840F0E2DB
      A6D2AA15891E178C2015891C4EA5534040B30C1EAE0917AA00009ACFCFECFF00
      FFF7EFEBA94D15AC5520FF00FFFF00FF1B91261C932709740C219C2C90CD95CF
      CFEC243EBE4352C1BFBFE6FF00FFFF00FFCA9477A44200A44100D3A68FFF00FF
      219A30219B2F12821915891D15881CFF00FF3247BF2B43C0B2B2E0BFBFE6E1CA
      B9AB4A00B86D3EB76A3AA44100FAF5F3CEF0D554AB5C14851C168A2057B361FF
      00FFC3C6E91231BB2B43BF1B2AB19E6257AF4F00F3E7E1EEDED5A44100C78E6F
      FF00FFFF00FF14861E54AB5CFF00FFFF00FFFF00FFEEEEF8BBBBE4D5D5EEE7D0
      C6EBD7CDFF00FFFF00FFE9D4C9EAD5CBFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
  end
end
