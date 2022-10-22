object FrmVendSalesAnalysis: TFrmVendSalesAnalysis
  Left = 203
  Top = 170
  HelpContext = 1036158
  ClientHeight = 519
  ClientWidth = 771
  Caption = 'Current Year Vendor Sales Analysis'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 47
    Width = 771
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
  end
  object PageControl1: TUniPageControl
    Left = 0
    Top = 50
    Width = 771
    Height = 469
    Hint = ''
    ActivePage = TabSheet2
    TabBarVisible = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TabSheet1: TUniTabSheet
      Hint = ''
      Caption = 'Sales Analysis'
      object Splitter1: TUniSplitter
        Left = 0
        Top = 201
        Width = 763
        Height = 3
        Cursor = crVSplit
        Hint = ''
        Align = alTop
        ParentColor = False
        Color = clBtnFace
      end
      object Bevel2: TUniPanel
        Left = 0
        Top = 27
        Width = 763
        Height = 3
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
        Caption = ''
      end
      object Bevel3: TUniPanel
        Left = 0
        Top = 231
        Width = 763
        Height = 3
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 6
        Caption = ''
      end
      object GridPeriod: TUniDBGrid
        Left = 0
        Top = 30
        Width = 763
        Height = 171
        Hint = ''
        DataSource = SrcV_APINVOICE_VEND_PERIOD_YTD
        LoadMask.Message = 'Loading data...'
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Columns = <
          item
            FieldName = 'PERIOD'
            Title.Caption = 'Period'
            Width = 47
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'START_DATE'
            Title.Caption = 'From'
            Width = 112
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'END_DATE'
            Title.Caption = 'To'
            Width = 112
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'TOTAL'
            Title.Caption = 'Period Total'
            Width = 74
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'YTD'
            Title.Caption = 'YTD'
            Width = 74
            CheckBoxField.FieldValues = 'true;false'
          end>
      end
      object PnlDetailToolbar: TUniPanel
        Tag = 1999
        Left = 0
        Top = 204
        Width = 763
        Height = 27
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Alignment = taLeftJustify
        Caption = ' Period Details'
        object DBNavigator1: TUniDBNavigator
          Left = 663
          Top = 1
          Width = 100
          Height = 25
          Hint = ''
          ShowHint = True
          ParentShowHint = False
          DataSource = SrcPeriodDtl
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
      object GridDetail: TUniDBGrid
        Left = 0
        Top = 234
        Width = 763
        Height = 207
        Hint = ''
        DataSource = SrcPeriodDtl
        LoadMask.Message = 'Loading data...'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 2
        Columns = <
          item
            FieldName = 'ITEMNO'
            Title.Caption = 'Item #'
            Width = 115
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DESCRIPTION'
            Title.Caption = 'Description'
            Width = 146
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'AMOUNT_DISTRIBUTED'
            Title.Caption = 'Amount Distributed'
            Width = 110
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DESCRIP2'
            Title.Caption = 'Ext. Description'
            Width = 200
            CheckBoxField.FieldValues = 'true;false'
          end>
      end
      object PnlYearToolbar: TUniPanel
        Tag = 1999
        Left = 0
        Top = 0
        Width = 763
        Height = 27
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        Alignment = taLeftJustify
        Caption = ' GL Year'
        object DBNavigator2: TUniDBNavigator
          Left = 663
          Top = 1
          Width = 100
          Height = 25
          Hint = ''
          ShowHint = True
          ParentShowHint = False
          DataSource = SrcV_APINVOICE_VEND_PERIOD_YTD
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
        object wwComboGLYear: TUniDBLookupComboBox
          Left = 82
          Top = 3
          Width = 127
          Height = 21
          Hint = ''
          ListField = 'DESCRIP;START_DATE;END_DATE'
          ListSource = ds_GLYear
          KeyField = 'DESCRIP'
          ListFieldIndex = 0
          TabOrder = 1
          Color = clWindow
        end
      end
    end
    object TabSheet2: TUniTabSheet
      Hint = ''
      Caption = 'Graph'
      object DBChart1: TDBChart
        Left = 16
        Top = 27
        Width = 627
        Height = 349
        AllowPanning = pmHorizontal
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'TDBChart')
        Title.Visible = False
        Legend.Visible = False
        Zoom.Animated = True
        TabOrder = 0
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 0
        object Series1: TAreaSeries
          Marks.Style = smsValue
          DataSource = QryV_APInvoice_Vend_Period_Ytd
          AreaChartBrush.Color = clGray
          AreaChartBrush.BackColor = clDefault
          DrawArea = True
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.Name = 'X'
          XValues.Order = loAscending
          XValues.ValueSource = 'PERIOD'
          YValues.Name = 'Y'
          YValues.Order = loNone
          YValues.ValueSource = 'TOTAL'
        end
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 771
    Height = 47
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      771
      47)
    object Label1: TUniLabel
      Left = 6
      Top = 7
      Width = 91
      Height = 13
      Hint = ''
      Caption = 'Invoices paid in full'
      TabOrder = 3
    end
    object Label2: TUniLabel
      Left = 6
      Top = 27
      Width = 266
      Height = 13
      Hint = ''
      Caption = 'Average number of days for an invoice to be paid in full'
      TabOrder = 4
    end
    object edTotalInv: TUniDBEdit
      Left = 633
      Top = 4
      Width = 130
      Height = 18
      Cursor = crArrow
      Hint = ''
      DataField = 'NO_OF_INVOICES'
      DataSource = SrcAvrg
      Anchors = [akTop, akRight]
      TabOrder = 0
      Color = clBtnFace
    end
    object edAvrg: TUniDBEdit
      Left = 633
      Top = 24
      Width = 130
      Height = 18
      Cursor = crArrow
      Hint = ''
      DataField = 'AVERAGE'
      DataSource = SrcAvrg
      Anchors = [akTop, akRight]
      TabOrder = 1
      Color = clBtnFace
    end
  end
  object SrcV_APINVOICE_VEND_PERIOD_YTD: TDataSource
    DataSet = QryV_APInvoice_Vend_Period_Ytd
    Left = 44
    Top = 216
  end
  object QryV_APInvoice_Vend_Period_Ytd: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select p.period,'
      '       p.start_date,'
      '       p.end_date,'
      '       v.total,'
      '       v.ytd,'
      '       v.glperiods_id_ap,'
      '       v.vendor_id'
      '  from v_apinvoice_vend_period_ytd v,'
      '       glperiods p'
      ' where v.vendor_id = :vendor_id'
      '   and v.glyear_id = :glyear_id'
      '   and v.glperiods_id_ap = p.id'
      ' order by p.period'
      ''
      '')
    Left = 44
    Top = 176
    ParamData = <
      item
        Name = 'vendor_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'glyear_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryV_APInvoice_Vend_Period_YtdPERIOD: TBCDField
      FieldName = 'PERIOD'
      Size = 0
    end
    object QryV_APInvoice_Vend_Period_YtdSTART_DATE: TDateTimeField
      FieldName = 'START_DATE'
    end
    object QryV_APInvoice_Vend_Period_YtdEND_DATE: TDateTimeField
      FieldName = 'END_DATE'
    end
    object QryV_APInvoice_Vend_Period_YtdTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      currency = True
      Size = 38
    end
    object QryV_APInvoice_Vend_Period_YtdYTD: TFMTBCDField
      FieldName = 'YTD'
      currency = True
      Size = 38
    end
    object QryV_APInvoice_Vend_Period_YtdGLPERIODS_ID_AP: TBCDField
      FieldName = 'GLPERIODS_ID_AP'
      Size = 0
    end
    object QryV_APInvoice_Vend_Period_YtdVENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Size = 0
    end
  end
  object SrcPeriodDtl: TDataSource
    DataSet = QryPeriodDtl
    Left = 172
    Top = 216
  end
  object QryPeriodDtl: TFDQuery
    MasterSource = SrcV_APINVOICE_VEND_PERIOD_YTD
    MasterFields = 'VENDOR_ID;GLPERIODS_ID_AP'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select d.itemno,'
      '       d.description,'
      '       d.descrip2,'
      '       d.qty_invoiced as invoice_qty,'
      '       d.amount_distributed,'
      '       d.unit_cost * d.qty_invoiced as total'
      '  from v_apinvoice_detail d, apinvoice h'
      ' where h.vendor_id = :vendor_id'
      '   and h.glperiods_id_ap = :glperiods_id_ap'
      '   and d.apinvoice_id = h.id'
      '')
    Left = 172
    Top = 176
    ParamData = <
      item
        Name = 'VENDOR_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end
      item
        Name = 'GLPERIODS_ID_AP'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryPeriodDtlITEMNO: TStringField
      FieldName = 'ITEMNO'
      Origin = 'V_APINVOICE_DETAIL.ITEMNO'
      Size = 50
    end
    object QryPeriodDtlDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Origin = 'V_APINVOICE_DETAIL.DESCRIPTION'
      Size = 100
    end
    object QryPeriodDtlINVOICE_QTY: TBCDField
      FieldName = 'INVOICE_QTY'
      Origin = 'V_APINVOICE_DETAIL.QTY_INVOICED'
    end
    object QryPeriodDtlTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'V_APINVOICE_DETAIL.UNIT_COST'
      Size = 38
    end
    object QryPeriodDtlAMOUNT_DISTRIBUTED: TBCDField
      FieldName = 'AMOUNT_DISTRIBUTED'
      Origin = 'V_APINVOICE_DETAIL.AMOUNT_DISTRIBUTED'
      currency = True
      Size = 2
    end
    object QryPeriodDtlDESCRIP2: TStringField
      FieldName = 'DESCRIP2'
      Origin = 'IQ.V_APINVOICE_DETAIL.DESCRIP2'
      Size = 100
    end
  end
  object wwQryGLYear: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       descrip, '
      '       start_date,'
      '       end_date'
      '  from glyear'
      ' order by descrip')
    Left = 244
    Top = 176
    object wwQryGLYearID: TBCDField
      FieldName = 'ID'
      Origin = 'GLYEAR.ID'
      Size = 0
    end
    object wwQryGLYearDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'GLYEAR.DESCRIP'
      Size = 25
    end
    object wwQryGLYearSTART_DATE: TDateTimeField
      DisplayLabel = 'Start Date'
      FieldName = 'START_DATE'
      Origin = 'GLYEAR.START_DATE'
    end
    object wwQryGLYearEND_DATE: TDateTimeField
      DisplayLabel = 'End Date'
      FieldName = 'END_DATE'
      Origin = 'GLYEAR.END_DATE'
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 116
    Top = 88
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Reports1: TUniMenuItem
      Caption = '&Reports'
      object Print1: TUniMenuItem
        Caption = '&Print'
        OnClick = Print1Click
      end
      object SetupPrinter1: TUniMenuItem
        Caption = '&Setup Printer'
        OnClick = SetupPrinter1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmVendSalesAnalysis'
    WebUse = False
    TouchScreen = False
    Left = 148
    Top = 88
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Vendor Sales'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 193261 $'
    BuildVersion = '176554'
    Left = 180
    Top = 88
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 212
    Top = 88
  end
  object SrcAvrg: TDataSource
    DataSet = QryAvrg
    Left = 100
    Top = 217
  end
  object QryAvrg: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'Select * from v_vendor_apinvoice_average'
      '  where vendor_id = :vendor_id')
    Left = 100
    Top = 177
    ParamData = <
      item
        Name = 'vendor_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryAvrgAVERAGE: TFMTBCDField
      FieldName = 'AVERAGE'
      Origin = 'V_ARCUSTO_ARINVOICE_AVERAGE.AVERAGE'
      DisplayFormat = '########0'
      Size = 38
    end
    object QryAvrgDIFFERENCE: TFMTBCDField
      FieldName = 'DIFFERENCE'
      Origin = 'V_ARCUSTO_ARINVOICE_AVERAGE.DIFFERENCE'
      Size = 38
    end
    object QryAvrgNO_OF_INVOICES: TFMTBCDField
      FieldName = 'NO_OF_INVOICES'
      Origin = 'V_ARCUSTO_ARINVOICE_AVERAGE.NO_OF_INVOICES'
      Size = 38
    end
    object QryAvrgVENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Origin = 'V_VENDOR_APINVOICE_AVERAGE.VENDOR_ID'
      Size = 0
    end
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmVendSalesAnalysis')
    SecurityCode = 'FRMVENDSALESANALYSIS'
    Left = 244
    Top = 90
  end
  object ds_GLYear: TDataSource
    DataSet = wwQryGLYear
    Left = 244
    Top = 226
  end
end
