object FrmARCustMaterial: TFrmARCustMaterial
  Left = 125
  Top = 168
  Caption = 'Customer Supplied Material'
  ClientHeight = 318
  ClientWidth = 607
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Style = []
  FormStyle = fsStayOnTop
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 171
    Width = 607
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitWidth = 615
  end
  object IQSearch1: TIQSearch
    Left = 0
    Top = 20
    Width = 607
    Height = 151
    SaveFilter = False
    SortDirection = sdAscending
    ShowFilter = True
    ShowRecordView = True
    Align = alTop
    BevelOuter = bvNone
    ComponentParentFont = True
    DefaultDrawing = True
    RowHeightPercent = 100
    FixedCols = 0
    TitleAlignment = taLeftJustify
    TitleLines = 1
    MemoAttributes = [mSizeable, mWordWrap, mGridShow]
    DBNavVisible = True
    DBNavWidth = 100
    TabOrder = 0
    DataSource = Src
    Selected.Strings = (
      'ABS_DESCRIP'#9'25'#9'Description'#9#9
      'QTY_TO_CREDIT'#9'10'#9'Avail. to credit'#9#9
      'QTY_RECEIVED'#9'10'#9'Received'#9#9
      'QTY_REJECTED'#9'10'#9'Rejected'#9#9
      'PREPOST_INVOICE_QTY'#9'10'#9'Preposted credit'#9#9
      'CREDITED_INVOICE_QTY'#9'10'#9'Posted credit'#9#9
      'TOTAL_CREDITED_QTY'#9'10'#9'Total credited'#9#9
      'AP_QTY_INVOICED'#9'10'#9'Invoiced in AP'#9#9
      'ITEMNO'#9'25'#9'Item#'#9#9
      'CLASS'#9'2'#9'Class'#9#9
      'REV'#9'15'#9'Rev'#9#9
      'UNIT_PRICE'#9'10'#9'Unit Price'#9#9
      'PRICE_PER_1000'#9'10'#9'Price/1000'#9#9
      'PONO'#9'15'#9'PO#'#9#9)
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
  end
  object Panel2: TPanel
    Left = 0
    Top = 288
    Width = 607
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object BtnAssign: TSpeedButton
      Left = 3
      Top = 2
      Width = 102
      Height = 25
      Hint = 'Assign to the A.R'
      Caption = 'Apply'
      Flat = True
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        0800000000000002000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
        FDFDFD000000FDFDFDFDFDFDFDFDFDFDFDFDFD000000FDFDFDFDFDFDFDFDFDFD
        FDFDFDFD002A00FDFDFDFDFDFDFDFDFDFDFDFDFD00A400FDFDFDFDFDFDFDFDFD
        FDFDFDFDFD00B21AFDFDFDFDFDFDFDFDFDFDFDFDFD00F75BFDFDFDFDFDFDFDFD
        FDFDFDFDFD00BA1AFDFDFDFDFDFDFDFDFDFDFDFDFD00075BFDFDFDFDFDFDFDFD
        00FDFDFDFD00BA1AFDFDFDFDFDFDFDFD00FDFDFDFD00075BFDFDFDFDFDFDFD00
        00FDFDFDFD00BE1AFDFDFDFDFDFDFD0000FDFDFDFD00085BFDFDFDFDFDFD002A
        00FDFDFD00B2F61AFDFDFDFDFDFD00A400FDFDFD00F7FF5BFDFDFDFDFD002AB2
        00000000B2BE1AFDFDFDFDFDFD00A4F700000000F7085BFDFDFDFDFD002AB2B2
        B22A2ABABEF61AFDFDFDFDFD00A4F7F7F7A4A40708FF5BFDFDFDFD002AB2BABA
        BABABEF6F61AFDFDFDFDFD00A4F70707070708FFFF5BFDFDFDFDFDFD00BABABE
        F6F6F61A1AFDFDFDFDFDFDFD00070708FFFFFF5B5BFDFDFDFDFDFDFDFD00BEF6
        1A1A1AFDFDFDFDFDFDFDFDFDFD0008FF5B5B5BFDFDFDFDFDFDFDFDFDFDFD00F6
        1AFDFDFDFDFDFDFDFDFDFDFDFDFD00FF5BFDFDFDFDFDFDFDFDFDFDFDFDFDFD00
        1AFDFDFDFDFDFDFDFDFDFDFDFDFDFD005BFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
        1AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD5BFDFDFDFDFDFDFDFDFD}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnAssignClick
    end
  end
  object IQSearch2: TIQSearch
    Left = 0
    Top = 194
    Width = 607
    Height = 94
    SaveFilter = False
    SortDirection = sdAscending
    ShowFilter = True
    ShowRecordView = True
    Align = alClient
    BevelOuter = bvNone
    ComponentParentFont = True
    DefaultDrawing = True
    RowHeightPercent = 100
    FixedCols = 0
    TitleAlignment = taLeftJustify
    TitleLines = 1
    MemoAttributes = [mSizeable, mWordWrap, mGridShow]
    DBNavVisible = True
    DBNavWidth = 100
    TabOrder = 2
    DataSource = SrcRec
    Selected.Strings = (
      'RECEIPTNO'#9'25'#9'Receipt#'#9#9
      'QTY_RECEIVED'#9'10'#9'Qty Received'#9#9
      'DATE_RECEIVED'#9'18'#9'Date Received'#9#9
      'QTY_REJECTED'#9'10'#9'Qty Rejected'#9#9
      'QTY_INVOICED'#9'10'#9'Qty Invoiced'#9#9
      'QTY_TO_INVOICE'#9'10'#9'Qty to Invoice'#9#9
      'COMMENT1'#9'50'#9'Comment'#9#9)
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ExplicitTop = 190
  end
  object Panel1: TPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 607
    Height = 20
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 3
    Color = clBtnShadow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Style = []
    ParentBackground = False
    TabOrder = 3
    object Label1: TLabel
      Left = 3
      Top = 3
      Width = 61
      Height = 13
      Align = alLeft
      Caption = 'PO Details'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Style = [fsBold]
    end
  end
  object Panel3: TPanel
    Tag = 1999
    Left = 0
    Top = 174
    Width = 607
    Height = 20
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 3
    Color = clBtnShadow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Style = []
    ParentBackground = False
    TabOrder = 4
    object Label2: TLabel
      Left = 3
      Top = 3
      Width = 72
      Height = 13
      Align = alLeft
      Caption = 'PO Receipts'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Style = [fsBold]
    end
  end
  object Src: TwwDataSource
    DataSet = Qry
    Left = 48
    Top = 96
  end
  object Qry: TFDQuery
    BeforeOpen = QryBeforeOpen
    AfterScroll = QryAfterScroll
    Filtered = True
    Connection = DB_DataModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select po_detail_id,'
      '       arcusto_id,'
      '       qty_received,'
      '       qty_rejected,'
      '       prepost_invoice_qty,'
      '       credited_invoice_qty,'
      '       total_credited_qty,'
      '       ap_qty_invoiced,'
      '       qty_to_credit,'
      '       arinvt_id,'
      '       itemno,'
      '       descrip,'
      '       class,'
      '       rev,'
      '       misc_item,'
      '       unit_price,'
      '       PRICE_PER_1000,'
      '       glacct_id_inv,'
      '       abs_descrip,'
      '       eplant_id,'
      '       pono'
      '  from v_arinvoice_credit'
      ' where arcusto_id = :nId'
      ' '
      ' '
      ' '
      ' ')
    Left = 64
    Top = 96
    ParamData = <
      item
        Name = 'nId'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryABS_DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'ABS_DESCRIP'
      Origin = 'V_ARINVOICE_CREDIT.ABS_DESCRIP'
      Size = 100
    end
    object QryQTY_TO_CREDIT: TFMTBCDField
      DisplayLabel = 'Avail. to credit'
      DisplayWidth = 10
      FieldName = 'QTY_TO_CREDIT'
      Origin = 'V_ARINVOICE_CREDIT.QTY_TO_CREDIT'
      Size = 38
    end
    object QryQTY_RECEIVED: TFMTBCDField
      DisplayLabel = 'Received'
      DisplayWidth = 10
      FieldName = 'QTY_RECEIVED'
      Origin = 'V_ARINVOICE_CREDIT.QTY_RECEIVED'
      Size = 38
    end
    object QryQTY_REJECTED: TFMTBCDField
      DisplayLabel = 'Rejected'
      DisplayWidth = 10
      FieldName = 'QTY_REJECTED'
      Origin = 'V_ARINVOICE_CREDIT.QTY_REJECTED'
      Size = 38
    end
    object QryPREPOST_INVOICE_QTY: TFMTBCDField
      DisplayLabel = 'Preposted credit'
      DisplayWidth = 10
      FieldName = 'PREPOST_INVOICE_QTY'
      Origin = 'V_ARINVOICE_CREDIT.PREPOST_INVOICE_QTY'
      Size = 38
    end
    object QryCREDITED_INVOICE_QTY: TFMTBCDField
      DisplayLabel = 'Posted credit'
      DisplayWidth = 10
      FieldName = 'CREDITED_INVOICE_QTY'
      Origin = 'V_ARINVOICE_CREDIT.CREDITED_INVOICE_QTY'
      Size = 38
    end
    object QryTOTAL_CREDITED_QTY: TFMTBCDField
      DisplayLabel = 'Total credited'
      DisplayWidth = 10
      FieldName = 'TOTAL_CREDITED_QTY'
      Origin = 'V_ARINVOICE_CREDIT.TOTAL_CREDITED_QTY'
      Size = 38
    end
    object QryAP_QTY_INVOICED: TFMTBCDField
      DisplayLabel = 'Invoiced in AP'
      DisplayWidth = 10
      FieldName = 'AP_QTY_INVOICED'
      Origin = 'V_ARINVOICE_CREDIT.AP_QTY_INVOICED'
      Size = 38
    end
    object QryITEMNO: TStringField
      DisplayLabel = 'Item#'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 'V_ARINVOICE_CREDIT.ITEMNO'
      Size = 50
    end
    object QryCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 2
      FieldName = 'CLASS'
      Origin = 'V_ARINVOICE_CREDIT.CLASS'
      Size = 2
    end
    object QryREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 15
      FieldName = 'REV'
      Origin = 'V_ARINVOICE_CREDIT.REV'
      Size = 15
    end
    object QryUNIT_PRICE: TFMTBCDField
      DisplayLabel = 'Unit Price'
      DisplayWidth = 10
      FieldName = 'UNIT_PRICE'
      Origin = 'V_ARINVOICE_CREDIT.UNIT_PRICE'
      Size = 6
    end
    object QryPRICE_PER_1000: TFMTBCDField
      DisplayLabel = 'Price/1000'
      DisplayWidth = 10
      FieldName = 'PRICE_PER_1000'
      Origin = 'V_ARINVOICE_CREDIT.PRICE_PER_1000'
      Size = 6
    end
    object QryPONO: TStringField
      DisplayLabel = 'PO#'
      DisplayWidth = 15
      FieldName = 'PONO'
      Origin = 'V_ARINVOICE_CREDIT.PONO'
      Size = 35
    end
    object QryPO_DETAIL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PO_DETAIL_ID'
      Origin = 'V_ARINVOICE_CREDIT.PO_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object QryARCUSTO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARCUSTO_ID'
      Origin = 'V_ARINVOICE_CREDIT.ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object QryARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Origin = 'V_ARINVOICE_CREDIT.ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryDESCRIP: TStringField
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Origin = 'V_ARINVOICE_CREDIT.DESCRIP'
      Visible = False
      Size = 100
    end
    object QryMISC_ITEM: TStringField
      DisplayWidth = 50
      FieldName = 'MISC_ITEM'
      Origin = 'V_ARINVOICE_CREDIT.MISC_ITEM'
      Visible = False
      Size = 100
    end
    object QryGLACCT_ID_INV: TBCDField
      FieldName = 'GLACCT_ID_INV'
      Origin = 'V_ARINVOICE_CREDIT.GLACCT_ID_INV'
      Visible = False
      Size = 0
    end
    object QryEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'V_ARINVOICE_CREDIT.EPLANT_ID'
      Visible = False
      Size = 0
    end
  end
  object MainMenu1: TMainMenu
    Left = 256
    Top = 64
    object File1: TMenuItem
      Caption = '&File'
      object Exit1: TMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Options1: TMenuItem
      Caption = '&Options'
      object SelectbyPOdetail1: TMenuItem
        Caption = 'Select by PO &detail'
        Checked = True
        OnClick = SelectbyPOdetail1Click
      end
      object SelectbyPOreceipt1: TMenuItem
        Caption = 'Select by PO &receipt'
        OnClick = SelectbyPOreceipt1Click
      end
    end
    object Help1: TMenuItem
      Caption = '&Help'
      object About1: TMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object SrcRec: TwwDataSource
    DataSet = QryRec
    Left = 88
    Top = 156
  end
  object QryRec: TFDQuery
    Tag = 1
    AfterScroll = QryRecAfterScroll
    MasterSource = Src
    MasterFields = 'PO_DETAIL_ID'
    Connection = DB_DataModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select p.id,'
      '       p.po_detail_id,'
      '       p.receiptno,'
      '       p.qty_received,'
      '       p.date_received,'
      '       p.posted,'
      '       p.ecode,'
      '       p.eid,'
      '       p.edate_time,'
      '       p.ecopy,'
      '       p.comment1,'
      '       p.eplant_id,'
      '       r.qty_rejected,'
      '       p.qty_invoiced,'
        '       NVL(p.qty_received, 0) - NVL(r.qty_rejected, 0) - NVL(p.q' +
        'ty_invoiced, 0) as qty_to_invoice,'
      '       p.comment1'
      '  from po_receipts p,'
        '       (select NVL(sum(NVL(qty_rejected, 0)), 0) as qty_rejected' +
        ','
      '               po_receipts_id'
      '          from po_rejects'
      '         group by po_receipts_id) r'
      ' where p.po_detail_id = :PO_DETAIL_ID'
      '   and r.po_receipts_id(+) = p.id'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 104
    Top = 158
    ParamData = <
      item
        Name = 'PO_DETAIL_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryRecRECEIPTNO: TStringField
      DisplayLabel = 'Receipt#'
      DisplayWidth = 25
      FieldName = 'RECEIPTNO'
      Origin = 'P.RECEIPTNO'
      Size = 50
    end
    object QryRecQTY_RECEIVED: TBCDField
      DisplayLabel = 'Qty Received'
      DisplayWidth = 10
      FieldName = 'QTY_RECEIVED'
      Origin = 'P.QTY_RECEIVED'
    end
    object QryRecDATE_RECEIVED: TDateTimeField
      DisplayLabel = 'Date Received'
      DisplayWidth = 18
      FieldName = 'DATE_RECEIVED'
      Origin = 'P.DATE_RECEIVED'
    end
    object QryRecQTY_REJECTED: TFMTBCDField
      DisplayLabel = 'Qty Rejected'
      DisplayWidth = 10
      FieldName = 'QTY_REJECTED'
      Origin = 'R.QTY_REJECTED'
      Size = 38
    end
    object QryRecQTY_INVOICED: TBCDField
      DisplayLabel = 'Qty Invoiced'
      DisplayWidth = 10
      FieldName = 'QTY_INVOICED'
      Origin = 'P.QTY_INVOICED'
    end
    object QryRecQTY_TO_INVOICE: TFMTBCDField
      DisplayLabel = 'Qty to Invoice'
      DisplayWidth = 10
      FieldName = 'QTY_TO_INVOICE'
      Origin =
        'NVL(p.qty_received, 0) - NVL(r.qty_rejected, 0) - NVL(p.qty_invo' +
        'iced, 0)'
      Size = 38
    end
    object QryRecCOMMENT1: TStringField
      DisplayLabel = 'Comment'
      DisplayWidth = 50
      FieldName = 'COMMENT1'
      Origin = 'P.COMMENT1'
      Size = 250
    end
    object QryRecID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'P.ID'
      Visible = False
      Size = 0
    end
    object QryRecPO_DETAIL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PO_DETAIL_ID'
      Origin = 'P.PO_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object QryRecPOSTED: TStringField
      DisplayWidth = 1
      FieldName = 'POSTED'
      Origin = 'P.POSTED'
      Visible = False
      Size = 1
    end
    object QryRecECODE: TStringField
      DisplayWidth = 10
      FieldName = 'ECODE'
      Origin = 'P.ECODE'
      Visible = False
      Size = 10
    end
    object QryRecEID: TBCDField
      DisplayWidth = 10
      FieldName = 'EID'
      Origin = 'P.EID'
      Visible = False
      Size = 0
    end
    object QryRecEDATE_TIME: TDateTimeField
      DisplayWidth = 18
      FieldName = 'EDATE_TIME'
      Origin = 'P.EDATE_TIME'
      Visible = False
    end
    object QryRecECOPY: TStringField
      DisplayWidth = 1
      FieldName = 'ECOPY'
      Origin = 'P.ECOPY'
      Visible = False
      Size = 1
    end
    object QryRecEPLANT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'P.EPLANT_ID'
      Visible = False
      Size = 0
    end
  end
  object IQAbout1: TIQAbout
    ModuleName = 'Customer Supplied Material'
    Version = 'DEV.151528'
    DatabaseName = 'IQ'
    ChangeListNumber = '$Change: 181501 $'
    BuildVersion = '151528'
    Left = 56
    Top = 64
  end
end
