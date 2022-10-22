object FrmInput: TFrmInput
  Left = 124
  Top = 261
  ClientHeight = 271
  ClientWidth = 436
  Caption = 'Parsed File'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 436
    Height = 271
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 219
    IQComponents.Grid.Height = 185
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcImp
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
    IQComponents.Navigator.DataSource = SrcImp
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 219
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 185
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcImp
    Columns = <
      item
        FieldName = 'ORDERNO'
        Title.Caption = 'Order#'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ARINVT_ITEMNO'
        Title.Caption = 'Item#'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    TabsVisible = True
    Marker = 0
  end
  object MainMenu1: TUniMainMenu
    Left = 232
    Top = 64
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object QryImp: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select i.id,'
      '       i.input_file_id,'
      '       i.arcusto_id,'
      '       i.pono,'
      '       i.ord_date,'
      '       i.ship_attn,'
      '       i.ship_addr1,'
      '       i.ship_city,'
      '       i.ship_state,'
      '       i.ship_country,'
      '       i.ship_zip,'
      '       i.ship_to_id,'
      '       i.itemno,'
      '       i.descrip,'
      '       i.arinvt_id,'
      '       i.promise_date,'
      '       i.request_date,'
      '       i.qty,'
      '       i.cuser1,'
      '       i.cuser2,'
      '       i.cuser3,'
      '       i.cuser4,'
      '       i.cuser5,'
      '       i.orders_id,'
      '       i.ord_detail_id,'
      '       i.releases_id,'
      '       i.edi_ord_detail_id,'
      '       i.edi_ship_id,'
      '       i.uom,'
      '       i.last_receipt_qty,'
      '       i.last_receipt_date,'
      '       i.delorderno,'
      '       i.pt_descrip,'
      '       i.forecast,'
      '       i.bill_to_id,'
      '       i.cust_cum_ath_pq,'
      '       i.fa_asset_no,'
      '       i.fa_descrip,'
      '       i.fa_serial_number,'
      '       i.fa_purchase_date,'
      '       i.fa_in_service_date,'
      '       i.fa_glacct_id_asset,'
      '       i.fa_salvage_value,'
      '       i.fa_useful_life,'
      '       i.fa_acquisition_cost,'
      '       i.fa_disposal_date,'
      '       i.fa_disposal_type,'
      '       i.fa_sale_amount,'
      '       i.fa_depreciation_method,'
      '       i.fa_book_type,'
      '       i.fa_declining_bal_percent,'
      '       i.fa_convention,'
      '       i.fa_property_class,'
      '       i.fa_sec_1250_real_property,'
      '       i.fa_sec_1245_property,'
      '       i.fa_listed_property,'
      '       i.fa_ny_liberty__zone,'
      '       i.fa_amortized,'
      '       i.fa_business_use_prcnt,'
      '       i.fa_itc_amount,'
      '       i.fa_section_179_ded,'
      '       i.fa_main_id,'
      '       i.fa_posting_basis,'
      '       i.fa_book_id,'
      '       i.fa_post_date,'
      '       i.fa_amount,'
      '       o.orderno,'
      '       a.itemno as arinvt_itemno'
      '  from input_file_rec i,'
      '       orders o,'
      '       arinvt a'
      ' where i.orders_id = o.id(+)'
      '   and input_file_id = :ID'
      '   and i.arinvt_id = a.id(+)'
      ' '
      ' '
      ' '
      ' ')
    Left = 184
    Top = 64
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryImpPONO: TStringField
      DisplayWidth = 20
      FieldName = 'PONO'
      Origin = 'i.pono'
      Size = 35
    end
    object QryImpORD_DATE: TDateTimeField
      DisplayWidth = 18
      FieldName = 'ORD_DATE'
      Origin = 'i.ord_date'
    end
    object QryImpSHIP_ATTN: TStringField
      DisplayWidth = 30
      FieldName = 'SHIP_ATTN'
      Origin = 'i.SHIP_ATTN'
      FixedChar = True
      Size = 60
    end
    object QryImpSHIP_ADDR1: TStringField
      DisplayWidth = 30
      FieldName = 'SHIP_ADDR1'
      Origin = 'i.SHIP_ADDR1'
      FixedChar = True
      Size = 60
    end
    object QryImpSHIP_CITY: TStringField
      DisplayWidth = 30
      FieldName = 'SHIP_CITY'
      Origin = 'i.SHIP_CITY'
      FixedChar = True
      Size = 30
    end
    object QryImpSHIP_STATE: TStringField
      DisplayWidth = 2
      FieldName = 'SHIP_STATE'
      Origin = 'i.SHIP_STATE'
      FixedChar = True
    end
    object QryImpSHIP_COUNTRY: TStringField
      DisplayWidth = 30
      FieldName = 'SHIP_COUNTRY'
      Origin = 'i.SHIP_COUNTRY'
      FixedChar = True
      Size = 30
    end
    object QryImpSHIP_ZIP: TStringField
      DisplayWidth = 10
      FieldName = 'SHIP_ZIP'
      Origin = 'i.SHIP_ZIP'
      FixedChar = True
      Size = 10
    end
    object QryImpITEMNO: TStringField
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 'i.ITEMNO'
      Size = 50
    end
    object QryImpDESCRIP: TStringField
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Origin = 'i.DESCRIP'
      Size = 100
    end
    object QryImpPROMISE_DATE: TDateTimeField
      DisplayWidth = 18
      FieldName = 'PROMISE_DATE'
      Origin = 'i.PROMISE_DATE'
    end
    object QryImpREQUEST_DATE: TDateTimeField
      DisplayWidth = 18
      FieldName = 'REQUEST_DATE'
      Origin = 'i.REQUEST_DATE'
    end
    object QryImpQTY: TBCDField
      DisplayWidth = 10
      FieldName = 'QTY'
      Origin = 'i.QTY'
    end
    object QryImpORDERNO: TStringField
      DisplayLabel = 'Order#'
      DisplayWidth = 15
      FieldName = 'ORDERNO'
      Origin = 'o.orderno'
      Size = 15
    end
    object QryImpARINVT_ITEMNO: TStringField
      DisplayLabel = 'Item#'
      DisplayWidth = 25
      FieldName = 'ARINVT_ITEMNO'
      Origin = 'a.itemno'
      FixedChar = True
      Size = 50
    end
    object QryImpARCUSTO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARCUSTO_ID'
      Size = 0
    end
    object QryImpARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Size = 0
    end
    object QryImpBILL_TO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'BILL_TO_ID'
      Size = 0
    end
    object QryImpCUSER1: TStringField
      DisplayWidth = 60
      FieldName = 'CUSER1'
      Size = 60
    end
    object QryImpCUSER2: TStringField
      DisplayWidth = 60
      FieldName = 'CUSER2'
      Size = 60
    end
    object QryImpCUSER3: TStringField
      DisplayWidth = 60
      FieldName = 'CUSER3'
      Size = 60
    end
    object QryImpCUSER4: TStringField
      DisplayWidth = 60
      FieldName = 'CUSER4'
      Size = 60
    end
    object QryImpCUSER5: TStringField
      DisplayWidth = 60
      FieldName = 'CUSER5'
      Size = 60
    end
    object QryImpCUST_CUM_ATH_PQ: TBCDField
      DisplayWidth = 10
      FieldName = 'CUST_CUM_ATH_PQ'
    end
    object QryImpDELORDERNO: TStringField
      DisplayWidth = 20
      FieldName = 'DELORDERNO'
    end
    object QryImpEDI_ORD_DETAIL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EDI_ORD_DETAIL_ID'
      Size = 0
    end
    object QryImpEDI_SHIP_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EDI_SHIP_ID'
      Size = 0
    end
    object QryImpFA_ACQUISITION_COST: TBCDField
      DisplayWidth = 10
      FieldName = 'FA_ACQUISITION_COST'
      Size = 2
    end
    object QryImpFA_AMORTIZED: TStringField
      DisplayWidth = 1
      FieldName = 'FA_AMORTIZED'
      FixedChar = True
      Size = 1
    end
    object QryImpFA_AMOUNT: TBCDField
      DisplayWidth = 10
      FieldName = 'FA_AMOUNT'
      Size = 2
    end
    object QryImpFA_ASSET_NO: TStringField
      DisplayWidth = 15
      FieldName = 'FA_ASSET_NO'
      Size = 15
    end
    object QryImpFA_BOOK_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'FA_BOOK_ID'
      Size = 0
    end
    object QryImpFA_BOOK_TYPE: TStringField
      DisplayWidth = 15
      FieldName = 'FA_BOOK_TYPE'
      Size = 15
    end
    object QryImpFA_BUSINESS_USE_PRCNT: TBCDField
      DisplayWidth = 10
      FieldName = 'FA_BUSINESS_USE_PRCNT'
    end
    object QryImpFA_CONVENTION: TStringField
      DisplayWidth = 2
      FieldName = 'FA_CONVENTION'
      Size = 2
    end
    object QryImpFA_DECLINING_BAL_PERCENT: TBCDField
      DisplayWidth = 10
      FieldName = 'FA_DECLINING_BAL_PERCENT'
    end
    object QryImpFA_DEPRECIATION_METHOD: TStringField
      DisplayWidth = 15
      FieldName = 'FA_DEPRECIATION_METHOD'
      Size = 15
    end
    object QryImpFA_DESCRIP: TStringField
      DisplayWidth = 60
      FieldName = 'FA_DESCRIP'
      Size = 60
    end
    object QryImpFA_DISPOSAL_DATE: TDateTimeField
      DisplayWidth = 18
      FieldName = 'FA_DISPOSAL_DATE'
    end
    object QryImpFA_DISPOSAL_TYPE: TStringField
      DisplayWidth = 15
      FieldName = 'FA_DISPOSAL_TYPE'
      Size = 15
    end
    object QryImpFA_GLACCT_ID_ASSET: TBCDField
      DisplayWidth = 10
      FieldName = 'FA_GLACCT_ID_ASSET'
      Size = 0
    end
    object QryImpFA_IN_SERVICE_DATE: TDateTimeField
      DisplayWidth = 18
      FieldName = 'FA_IN_SERVICE_DATE'
    end
    object QryImpFA_ITC_AMOUNT: TBCDField
      DisplayWidth = 10
      FieldName = 'FA_ITC_AMOUNT'
      Size = 2
    end
    object QryImpFA_LISTED_PROPERTY: TStringField
      DisplayWidth = 1
      FieldName = 'FA_LISTED_PROPERTY'
      FixedChar = True
      Size = 1
    end
    object QryImpFA_MAIN_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'FA_MAIN_ID'
      Size = 0
    end
    object QryImpFA_NY_LIBERTY__ZONE: TStringField
      DisplayWidth = 1
      FieldName = 'FA_NY_LIBERTY__ZONE'
      FixedChar = True
      Size = 1
    end
    object QryImpFA_POST_DATE: TDateTimeField
      DisplayWidth = 18
      FieldName = 'FA_POST_DATE'
    end
    object QryImpFA_POSTING_BASIS: TStringField
      DisplayWidth = 2
      FieldName = 'FA_POSTING_BASIS'
      Size = 2
    end
    object QryImpFA_PROPERTY_CLASS: TStringField
      DisplayWidth = 25
      FieldName = 'FA_PROPERTY_CLASS'
      Size = 25
    end
    object QryImpFA_PURCHASE_DATE: TDateTimeField
      DisplayWidth = 18
      FieldName = 'FA_PURCHASE_DATE'
    end
    object QryImpFA_SALE_AMOUNT: TBCDField
      DisplayWidth = 10
      FieldName = 'FA_SALE_AMOUNT'
      Size = 2
    end
    object QryImpFA_SALVAGE_VALUE: TBCDField
      DisplayWidth = 10
      FieldName = 'FA_SALVAGE_VALUE'
      Size = 2
    end
    object QryImpFA_SEC_1245_PROPERTY: TStringField
      DisplayWidth = 1
      FieldName = 'FA_SEC_1245_PROPERTY'
      FixedChar = True
      Size = 1
    end
    object QryImpFA_SEC_1250_REAL_PROPERTY: TStringField
      DisplayWidth = 1
      FieldName = 'FA_SEC_1250_REAL_PROPERTY'
      FixedChar = True
      Size = 1
    end
    object QryImpFA_SECTION_179_DED: TBCDField
      DisplayWidth = 10
      FieldName = 'FA_SECTION_179_DED'
      Size = 2
    end
    object QryImpFA_SERIAL_NUMBER: TStringField
      DisplayWidth = 60
      FieldName = 'FA_SERIAL_NUMBER'
      Size = 60
    end
    object QryImpFA_USEFUL_LIFE: TBCDField
      DisplayWidth = 10
      FieldName = 'FA_USEFUL_LIFE'
      Size = 2
    end
    object QryImpFORECAST: TStringField
      DisplayWidth = 1
      FieldName = 'FORECAST'
      FixedChar = True
      Size = 1
    end
    object QryImpID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Size = 0
    end
    object QryImpINPUT_FILE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'INPUT_FILE_ID'
      Size = 0
    end
    object QryImpLAST_RECEIPT_DATE: TDateTimeField
      DisplayWidth = 18
      FieldName = 'LAST_RECEIPT_DATE'
    end
    object QryImpLAST_RECEIPT_QTY: TBCDField
      DisplayWidth = 10
      FieldName = 'LAST_RECEIPT_QTY'
    end
    object QryImpORD_DETAIL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ORD_DETAIL_ID'
      Size = 0
    end
    object QryImpORDERS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ORDERS_ID'
      Size = 0
    end
    object QryImpPT_DESCRIP: TStringField
      DisplayWidth = 30
      FieldName = 'PT_DESCRIP'
      Size = 35
    end
    object QryImpRELEASES_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'RELEASES_ID'
      Size = 0
    end
    object QryImpSHIP_TO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SHIP_TO_ID'
      Size = 0
    end
    object QryImpUOM: TStringField
      DisplayWidth = 2
      FieldName = 'UOM'
      Size = 10
    end
  end
  object SrcImp: TDataSource
    DataSet = QryImp
    Left = 168
    Top = 64
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Parsed File'
    Version = 'DEV.176554'
    BuildVersion = '176554'
    Left = 272
    Top = 64
  end
  object PopupMenu1: TUniPopupMenu
    Left = 208
    Top = 112
    object Jumptoorders1: TUniMenuItem
      Caption = '&Jump to orders'
      OnClick = Jumptoorders1Click
    end
  end
end
