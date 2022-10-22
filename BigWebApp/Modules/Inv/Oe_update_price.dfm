object FrmOEUpdatePrice: TFrmOEUpdatePrice
  Left = 193
  Top = 141
  ClientHeight = 271
  ClientWidth = 506
  Caption = 'Update Current Sales Orders'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 218
    Width = 506
    Height = 34
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 294
      Top = 1
      Width = 211
      Height = 32
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 2
        Top = 5
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 107
        Top = 5
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 43
    Width = 506
    Height = 175
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 289
    IQComponents.Grid.Height = 89
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcOrdDetail
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
    IQComponents.Navigator.DataSource = SrcOrdDetail
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 289
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 89
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcOrdDetail
    Columns = <
      item
        FieldName = 'ORDERNO'
        Title.Caption = 'Order #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CUSTNO'
        Title.Caption = 'Customer #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PONO'
        Title.Caption = 'PO #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ITEMNO'
        Title.Caption = 'Item #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIPTION'
        Title.Caption = 'Item Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CLASS'
        Title.Caption = 'Class'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REV'
        Title.Caption = 'Revision'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIPTION2'
        Title.Caption = 'Extended Item Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DATE_TAKEN'
        Title.Caption = 'Order Date'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ORD_BY'
        Title.Caption = 'Order By'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'COMPANY'
        Title.Caption = 'Company'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ATTN'
        Title.Caption = 'Ship To'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ADDR1'
        Title.Caption = 'Address 1'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ADDR2'
        Title.Caption = 'Address 2'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ADDR3'
        Title.Caption = 'Address 3'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'STATUS'
        Title.Caption = 'Status'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CUST_ITEMNO'
        Title.Caption = 'AKA Item #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CUST_DESCRIP'
        Title.Caption = 'AKA Item Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TOTAL_QTY_ORD'
        Title.Caption = 'Blanket Quantity'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EPLANT_ID'
        Title.Caption = 'EPlant ID'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'UNIT_PRICE'
        Title.Caption = 'Unit Price'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'UNIT'
        Title.Caption = 'UOM'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    TabsVisible = True
    Marker = 0
  end
  object StatusBar1: TUniStatusBar
    Left = 0
    Top = 252
    Width = 506
    Height = 19
    Hint = ''
    Panels = <>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
  end
  object PnlCaption: TUniPanel
    Left = 0
    Top = 0
    Width = 506
    Height = 43
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Caption = ''
    object lblCaption1: TUniLabel
      Left = 8
      Top = 8
      Width = 37
      Height = 13
      Hint = ''
      Caption = 'Item #:'
      TabOrder = 1
    end
    object lblCaption2: TUniLabel
      Left = 8
      Top = 24
      Width = 179
      Height = 13
      Hint = ''
      Caption = 'Do you wish to update the unit price?'
      TabOrder = 2
    end
  end
  object SrcOrdDetail: TDataSource
    DataSet = QryOrdDetail
    Left = 31
    Top = 97
  end
  object QryOrdDetail: TFDQuery
    BeforeOpen = QryOrdDetailBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select s.ID,'
      '       s.PONO,'
      '       s.orderno,'
      '       s.custno,'
      '       s.addr1,'
      '       s.addr2,'
      '       s.addr3,'
      '       s.status,'
      '       s.company,'
      '       s.Date_Taken,'
      '       s.Ord_By,'
      '       s.class,'
      '       s.rev,'
      '       s.ItemNo,'
      '       s.description,'
      '       s.description2,'
      '       s.cust_itemno,'
      '       s.cust_descrip,'
      '       s.total_qty_ord,'
      '       s.ecode,'
      '       s.eplant_id,'
      '       s.web_orders_id,'
      '       ship_to.attn,'
      '       s.unit_price,'
      '       s.unit,'
      '       s.ord_detail_id'
      '  from v_ord_detail_aka s,'
      '       ship_to'
      ' where s.ship_to_id = ship_to.id(+)'
      '   and s.arinvt_id = :arinvt_id'
      '   and misc.eplant_filter( s.eplant_id ) = 1'
      ' ')
    Left = 32
    Top = 111
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryOrdDetailORDERNO: TStringField
      DisplayLabel = 'Order #'
      DisplayWidth = 9
      FieldName = 'ORDERNO'
      Origin = 's.orderno'
      Size = 15
    end
    object QryOrdDetailCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Origin = 's.custno'
      FixedChar = True
      Size = 10
    end
    object QryOrdDetailPONO: TStringField
      DisplayLabel = 'PO #'
      DisplayWidth = 10
      FieldName = 'PONO'
      Origin = 's.pono'
      Size = 35
    end
    object QryOrdDetailITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 's.itemno'
      FixedChar = True
      Size = 50
    end
    object QryOrdDetailDESCRIPTION: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 30
      FieldName = 'DESCRIPTION'
      Origin = 's.description'
      Size = 250
    end
    object QryOrdDetailCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 5
      FieldName = 'CLASS'
      Origin = 's.class'
      FixedChar = True
      Size = 2
    end
    object QryOrdDetailREV: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 8
      FieldName = 'REV'
      Origin = 's.rev'
      FixedChar = True
      Size = 15
    end
    object QryOrdDetailDESCRIPTION2: TStringField
      DisplayLabel = 'Extended Item Description'
      DisplayWidth = 37
      FieldName = 'DESCRIPTION2'
      Origin = 's.description2'
      Size = 100
    end
    object QryOrdDetailDATE_TAKEN: TDateTimeField
      DisplayLabel = 'Order Date'
      DisplayWidth = 18
      FieldName = 'DATE_TAKEN'
      Origin = 's.date_taken'
    end
    object QryOrdDetailORD_BY: TStringField
      DisplayLabel = 'Order By'
      DisplayWidth = 30
      FieldName = 'ORD_BY'
      Origin = 's.ord_by'
      FixedChar = True
      Size = 30
    end
    object QryOrdDetailCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 18
      FieldName = 'COMPANY'
      Origin = 's.company'
      Size = 60
    end
    object QryOrdDetailATTN: TStringField
      DisplayLabel = 'Ship To'
      DisplayWidth = 24
      FieldName = 'ATTN'
      Origin = 'ship_to.attn'
      Size = 60
    end
    object QryOrdDetailADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 30
      FieldName = 'ADDR1'
      Origin = 's.addr1'
      Size = 60
    end
    object QryOrdDetailADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 30
      FieldName = 'ADDR2'
      Origin = 's.addr2'
      Size = 60
    end
    object QryOrdDetailADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 30
      FieldName = 'ADDR3'
      Origin = 's.addr3'
      Size = 60
    end
    object QryOrdDetailSTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 20
      FieldName = 'STATUS'
      Origin = 's.status'
      FixedChar = True
    end
    object QryOrdDetailCUST_ITEMNO: TStringField
      DisplayLabel = 'AKA Item #'
      DisplayWidth = 25
      FieldName = 'CUST_ITEMNO'
      Origin = 's.cust_itemno'
      FixedChar = True
      Size = 50
    end
    object QryOrdDetailCUST_DESCRIP: TStringField
      DisplayLabel = 'AKA Item Description'
      DisplayWidth = 30
      FieldName = 'CUST_DESCRIP'
      Origin = 's.cust_descrip'
      Size = 35
    end
    object QryOrdDetailTOTAL_QTY_ORD: TBCDField
      DisplayLabel = 'Blanket Quantity'
      DisplayWidth = 10
      FieldName = 'TOTAL_QTY_ORD'
      Origin = 's.total_qty_ord'
    end
    object QryOrdDetailEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 's.eplant_id'
      Size = 0
    end
    object QryOrdDetailUNIT_PRICE: TFMTBCDField
      DisplayLabel = 'Unit Price'
      DisplayWidth = 10
      FieldName = 'UNIT_PRICE'
      Origin = 's.unit_price'
      Size = 6
    end
    object QryOrdDetailUNIT: TStringField
      DisplayLabel = 'UOM'
      DisplayWidth = 10
      FieldName = 'UNIT'
      Origin = 's.unit'
      Size = 10
    end
    object QryOrdDetailID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryOrdDetailECODE: TStringField
      DisplayWidth = 10
      FieldName = 'ECODE'
      Visible = False
      Size = 10
    end
    object QryOrdDetailWEB_ORDERS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'WEB_ORDERS_ID'
      Visible = False
      Size = 0
    end
    object QryOrdDetailORD_DETAIL_ID: TBCDField
      FieldName = 'ORD_DETAIL_ID'
      Visible = False
      Size = 0
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 66
    Top = 111
    object JumptoSalesOrder1: TUniMenuItem
      Caption = 'Jump to Sales Order'
      OnClick = JumptoSalesOrder1Click
    end
  end
  object IQJumpOrdDetail: TIQWebJump
    DataField = 'ORD_DETAIL_ID'
    DataSource = SrcOrdDetail
    JumpTo = jtSalesOrderDetail
    Left = 66
    Top = 140
  end
end
