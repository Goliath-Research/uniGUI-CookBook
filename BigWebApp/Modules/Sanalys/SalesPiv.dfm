object FrmSalesPivot: TFrmSalesPivot
  Left = 73
  Top = 151
  HelpContext = 1103625
  ClientHeight = 320
  ClientWidth = 399
  Caption = 'Sales Analysis via Pivot Tables'
  BorderStyle = bsDialog
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 399
    Height = 279
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Bevel1: TUniPanel
      Left = 1
      Top = 117
      Width = 397
      Height = 14
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      Caption = ''
    end
    object GroupBox1: TUniGroupBox
      Left = 1
      Top = 1
      Width = 397
      Height = 116
      Hint = ''
      Caption = '  General  '
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      object Label1: TUniLabel
        Left = 24
        Top = 28
        Width = 24
        Height = 13
        Hint = ''
        Caption = 'From'
        TabOrder = 4
      end
      object Label2: TUniLabel
        Left = 227
        Top = 28
        Width = 12
        Height = 13
        Hint = ''
        Caption = 'To'
        TabOrder = 5
      end
      object Label3: TUniLabel
        Left = 24
        Top = 58
        Width = 120
        Height = 13
        Hint = ''
        Caption = 'Temporary Working Area'
        TabOrder = 6
      end
      object DateTimePicker1: TUniDateTimePicker
        Left = 56
        Top = 24
        Width = 118
        Height = 21
        Hint = ''
        DateTime = 42682.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 0
      end
      object DateTimePicker2: TUniDateTimePicker
        Left = 251
        Top = 24
        Width = 118
        Height = 21
        Hint = ''
        DateTime = 42682.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 1
      end
      object wwDBComboDlgFileName: TUniEdit
        Left = 24
        Top = 74
        Width = 345
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 2
      end
    end
    object GroupBox2: TUniGroupBox
      Left = 1
      Top = 131
      Width = 397
      Height = 147
      Hint = ''
      Caption = '  Sales Analysis Query  '
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      object rbtnDefault: TUniRadioButton
        Left = 24
        Top = 24
        Width = 113
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Default Query'
        TabOrder = 0
        OnClick = EnableComponents
      end
      object rbtnUserDefined: TUniRadioButton
        Left = 24
        Top = 80
        Width = 113
        Height = 17
        Hint = ''
        Caption = 'User Defined Query'
        TabOrder = 1
        OnClick = EnableComponents
      end
      object CheckBox1: TUniCheckBox
        Left = 42
        Top = 47
        Width = 161
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Include history sales orders'
        TabOrder = 2
      end
      object wwDBComboDlgUserDefinedQuery: TUniEdit
        Left = 42
        Top = 103
        Width = 327
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 3
        ReadOnly = True
        OnKeyDown = wwDBComboDlgUserDefinedQueryKeyDown
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 279
    Width = 399
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel3: TUniPanel
      Left = 212
      Top = 1
      Width = 186
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 6
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 97
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        TabOrder = 2
        OnClick = btnCancelClick
      end
    end
  end
  object QryAllSales: TFDQuery
    BeforeOpen = QryAllSalesBeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select o.orderno,'
      '       o.date_taken as ord_date_taken,'
      '       a.itemno,'
      '       a.descrip,'
      '       a.descrip2,'
      '       r.quan as rel_quan,'
      '       r.request_date as rel_request_date,'
      '       r.promise_date as rel_promise_date,'
      '       d.unit_price,'
      '       c.custno,'
      '       c.company,'
      
        '       NVL(r.quan,0) * NVL(d.unit_price,0) * Multicurrency.IQ_Ge' +
        'tFXRateDate( o.currency_id, o.date_taken ) as extended_price,'
      
        '       Multicurrency.IQ_GetFXRateDate( o.currency_id, o.date_tak' +
        'en ) as fx_rate,'
      '       o.eplant_id,'
      '       '#39'CURRENT'#39' as order_type,'
      '       d.unit,'
      '       a.class,'
      '       c.territory,'
      '       c.industry,'
      '       p.code as prod_code,'
      '       IQCalendar.WeekOf( r.promise_date ) as week,'
      '       currency.curr_code,'
      '       case NVL(e.ids, 0)'
      '         when 1 then'
      
        '          (select ltrim(rtrim(s.first_name) || '#39' '#39' || s.last_nam' +
        'e) from salespeople s, ORD_DETAIL_COMMISSIONS e1 where e1.salesp' +
        'eople_id = s.id and e1.ord_detail_id = d.id)'
      '         when 0 then'
      '           null'
      '         else'
      '           '#39'Split'#39
      '         end as salesperson,'
      '       r.forecast,'
      '       r.ship_date,'
      
        '       (select min(period) from glperiods where  r.promise_date ' +
        'between start_date and end_date and GL.CheckGLYearEplant(id) = 1' +
        ') as period'
      ''
      ' from orders o,'
      '      ord_detail d,'
      '      arinvt a,'
      '      releases r,'
      '      arcusto c,'
      '      prod_code p,'
      '      currency,'
      '      (select count(id) as ids,'
      '              ord_detail_id'
      '         from ORD_DETAIL_COMMISSIONS'
      '        group by ord_detail_id) e'
      'where'
      '      o.id = d.orders_id'
      '  and d.arinvt_id = a.id'
      '  and r.ord_detail_id = d.id'
      '  and o.arcusto_id = c.id'
      '  and a.prod_code_id = p.id(+)'
      '  and c.currency_id = currency.id(+)'
      '  and e.ord_detail_id(+) = d.id'
      '  and r.promise_date between :date1 and :date2'
      ''
      'UNION ALL'
      ''
      'select o.orderno,'
      '       o.date_taken as ord_date_taken,'
      '       d.arinvt_itemno,'
      '       d.arinvt_descrip,'
      '       d.arinvt_descrip2,'
      '       r.quan as rel_quan,'
      '       r.request_date as rel_request_date,'
      '       r.promise_date as rel_promise_date,'
      '       d.unit_price,'
      '       o.arcusto_custno,'
      '       o.arcusto_company,'
      
        '       NVL(r.quan,0) * NVL(d.unit_price,0) * Multicurrency.IQ_Ge' +
        'tFXRateDate( o.currency_id, o.date_taken ) as extended_price,'
      
        '       Multicurrency.IQ_GetFXRateDate( o.currency_id, o.date_tak' +
        'en ) as fx_rate,'
      '       o.eplant_id,'
      '       '#39'ARCHIVED'#39' as order_type,'
      '       d.unit,'
      '       a.class,'
      '       c.territory,'
      '       c.industry,'
      '       p.code as prod_code,'
      '       IQCalendar.WeekOf( r.promise_date ) as week,'
      '       currency.curr_code,'
      '       case NVL(e.ids, 0)'
      '         when 1 then'
      
        '           (select ltrim(rtrim(e1.first_name) || '#39' '#39' || e1.last_' +
        'name) from hist_ORD_DETAIL_COMM e1 where e1.ord_detail_id = d.id' +
        ')'
      '         when 0 then'
      '           null'
      '         else'
      '           '#39'Split'#39
      '         end as salesperson,'
      '       r.forecast,'
      '       r.ship_date,'
      
        '       (select min(period) from glperiods where  r.promise_date ' +
        'between start_date and end_date and GL.CheckGLYearEplant(id) = 1' +
        ') as period'
      ''
      '  from'
      '       hist_orders o,'
      '       hist_ord_detail d,'
      '       arcusto c,'
      '       arinvt a,'
      '       hist_releases r,'
      '       prod_code p,'
      '       currency,'
      '      (select count(id) as ids, '
      '              ord_detail_id'
      '         from hist_ORD_DETAIL_COMM'
      '        group by ord_detail_id) e'
      ' where'
      '       o.id = d.orders_id'
      '   and r.ord_detail_id = d.id'
      '   and d.arinvt_id = a.id(+)'
      '   and o.arcusto_id = c.id(+)'
      '   and a.prod_code_id = p.id(+)'
      '   and c.currency_id = currency.id(+)'
      '   and e.ord_detail_id(+) = d.id'
      '   and r.promise_date between :date1 and :date2'
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 243
    Top = 147
    ParamData = <
      item
        Name = 'date1'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'date2'
        DataType = ftDateTime
        ParamType = ptInput
      end>
    object QryAllSalesORDERNO: TStringField
      DisplayWidth = 10
      FieldName = 'ORDERNO'
      Size = 15
    end
    object QryAllSalesORD_DATE_TAKEN: TDateTimeField
      FieldName = 'ORD_DATE_TAKEN'
    end
    object QryAllSalesITEMNO: TStringField
      FieldName = 'ITEMNO'
      Size = 50
    end
    object QryAllSalesDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 100
    end
    object QryAllSalesREL_QUAN: TBCDField
      FieldName = 'REL_QUAN'
    end
    object QryAllSalesREL_REQUEST_DATE: TDateTimeField
      FieldName = 'REL_REQUEST_DATE'
    end
    object QryAllSalesREL_PROMISE_DATE: TDateTimeField
      FieldName = 'REL_PROMISE_DATE'
    end
    object QryAllSalesUNIT_PRICE: TFMTBCDField
      FieldName = 'UNIT_PRICE'
      Size = 6
    end
    object QryAllSalesCUSTNO: TStringField
      FieldName = 'CUSTNO'
      Size = 10
    end
    object QryAllSalesCOMPANY: TStringField
      FieldName = 'COMPANY'
      Size = 60
    end
    object QryAllSalesEXTENDED_PRICE: TFMTBCDField
      FieldName = 'EXTENDED_PRICE'
      Size = 38
    end
    object QryAllSalesORDER_TYPE: TStringField
      FieldName = 'ORDER_TYPE'
      Size = 8
    end
    object QryAllSalesEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object QryAllSalesFX_RATE: TFMTBCDField
      FieldName = 'FX_RATE'
      Size = 38
    end
    object QryAllSalesUNIT: TStringField
      FieldName = 'UNIT'
      Size = 10
    end
    object QryAllSalesCLASS: TStringField
      FieldName = 'CLASS'
      FixedChar = True
      Size = 2
    end
    object QryAllSalesTERRITORY: TStringField
      FieldName = 'TERRITORY'
      FixedChar = True
      Size = 50
    end
    object QryAllSalesINDUSTRY: TStringField
      FieldName = 'INDUSTRY'
      FixedChar = True
    end
    object QryAllSalesPROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 25
    end
    object QryAllSalesWEEK: TFMTBCDField
      FieldName = 'WEEK'
      Size = 38
    end
    object QryAllSalesCURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 10
    end
    object QryAllSalesSALESPERSON: TStringField
      FieldName = 'SALESPERSON'
      Size = 61
    end
    object QryAllSalesFORECAST: TStringField
      FieldName = 'FORECAST'
      FixedChar = True
      Size = 1
    end
    object QryAllSalesSHIP_DATE: TDateTimeField
      FieldName = 'SHIP_DATE'
    end
    object QryAllSalesPERIOD: TFMTBCDField
      FieldName = 'PERIOD'
      Size = 38
    end
    object QryAllSalesDESCRIP2: TStringField
      FieldName = 'DESCRIP2'
      Size = 100
    end
  end
  object QryCurrentSales: TFDQuery
    BeforeOpen = QryAllSalesBeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select o.orderno,'
      '       o.date_taken as ord_date_taken,'
      '       a.itemno,'
      '       a.descrip,'
      '       a.descrip2,'
      '       r.quan as rel_quan,'
      '       r.request_date as rel_request_date,'
      '       r.promise_date as rel_promise_date,'
      '       d.unit_price,'
      '       c.custno,'
      '       c.company,'
      
        '       NVL(r.quan,0) * NVL(d.unit_price,0) * Multicurrency.IQ_Ge' +
        'tFXRateDate( o.currency_id, o.date_taken ) as extended_price,'
      
        '       Multicurrency.IQ_GetFXRateDate( o.currency_id, o.date_tak' +
        'en ) as fx_rate,'
      '       o.eplant_id,'
      '       '#39'CURRENT'#39' as order_type,'
      '       d.unit,'
      '       a.class,'
      '       c.territory,'
      '       c.industry,'
      '       p.code as prod_code,'
      '       IQCalendar.WeekOf( r.promise_date ) as week,'
      '       currency.curr_code,'
      '       case NVL(e.ids, 0)'
      '         when 1 then'
      
        '          (select ltrim(rtrim(s.first_name) || '#39' '#39' || s.last_nam' +
        'e) from salespeople s, ORD_DETAIL_COMMISSIONS e1 where e1.salesp' +
        'eople_id = s.id and e1.ord_detail_id = d.id)'
      '         when 0 then'
      '           null'
      '         else'
      '           '#39'Split'#39
      '         end as salesperson,'
      '       r.forecast,'
      '       r.ship_date,'
      
        '       (select min(period) from glperiods where  r.promise_date ' +
        'between start_date and end_date and GL.CheckGLYearEplant(id) = 1' +
        ') as period'
      ' from '
      '      orders o,'
      '      ord_detail d,'
      '      arinvt a,'
      '      releases r,'
      '      arcusto c,'
      '      prod_code p,'
      '      currency,'
      '      (select count(id) as ids,'
      '              ord_detail_id'
      '         from ORD_DETAIL_COMMISSIONS'
      '        group by ord_detail_id) e'
      'where o.id = d.orders_id'
      '  and d.arinvt_id = a.id'
      '  and r.ord_detail_id = d.id'
      '  and o.arcusto_id = c.id'
      '  and a.prod_code_id = p.id(+)'
      '  and c.currency_id = currency.id(+)'
      '  and e.ord_detail_id(+) = d.id'
      '  and r.promise_date between :date1 and :date2'
      'order by r.promise_date'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 273
    Top = 147
    ParamData = <
      item
        Name = 'date1'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'date2'
        DataType = ftDateTime
        ParamType = ptInput
      end>
    object QryCurrentSalesORDERNO: TStringField
      DisplayWidth = 10
      FieldName = 'ORDERNO'
      Size = 15
    end
    object QryCurrentSalesORD_DATE_TAKEN: TDateTimeField
      FieldName = 'ORD_DATE_TAKEN'
    end
    object QryCurrentSalesITEMNO: TStringField
      FieldName = 'ITEMNO'
      Size = 50
    end
    object QryCurrentSalesDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 100
    end
    object QryCurrentSalesREL_QUAN: TBCDField
      FieldName = 'REL_QUAN'
    end
    object QryCurrentSalesREL_REQUEST_DATE: TDateTimeField
      FieldName = 'REL_REQUEST_DATE'
    end
    object QryCurrentSalesREL_PROMISE_DATE: TDateTimeField
      FieldName = 'REL_PROMISE_DATE'
    end
    object QryCurrentSalesUNIT_PRICE: TFMTBCDField
      FieldName = 'UNIT_PRICE'
      Size = 6
    end
    object QryCurrentSalesCUSTNO: TStringField
      FieldName = 'CUSTNO'
      Size = 10
    end
    object QryCurrentSalesCOMPANY: TStringField
      FieldName = 'COMPANY'
      Size = 60
    end
    object QryCurrentSalesEXTENDED_PRICE: TFMTBCDField
      FieldName = 'EXTENDED_PRICE'
      Size = 38
    end
    object QryCurrentSalesORDER_TYPE: TStringField
      FieldName = 'ORDER_TYPE'
      Size = 7
    end
    object QryCurrentSalesEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object QryCurrentSalesFX_RATE: TFMTBCDField
      FieldName = 'FX_RATE'
      Size = 38
    end
    object QryCurrentSalesUNIT: TStringField
      FieldName = 'UNIT'
      Size = 10
    end
    object QryCurrentSalesCLASS: TStringField
      FieldName = 'CLASS'
      FixedChar = True
      Size = 2
    end
    object QryCurrentSalesTERRITORY: TStringField
      FieldName = 'TERRITORY'
      FixedChar = True
      Size = 50
    end
    object QryCurrentSalesINDUSTRY: TStringField
      FieldName = 'INDUSTRY'
      FixedChar = True
    end
    object QryCurrentSalesPROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 25
    end
    object QryCurrentSalesWEEK: TFMTBCDField
      FieldName = 'WEEK'
      Size = 38
    end
    object QryCurrentSalesCURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 10
    end
    object QryCurrentSalesSALESPERSON: TStringField
      FieldName = 'SALESPERSON'
      Size = 61
    end
    object QryCurrentSalesFORECAST: TStringField
      FieldName = 'FORECAST'
      FixedChar = True
      Size = 1
    end
    object QryCurrentSalesSHIP_DATE: TDateTimeField
      FieldName = 'SHIP_DATE'
    end
    object QryCurrentSalesPERIOD: TFMTBCDField
      FieldName = 'PERIOD'
      Size = 38
    end
    object QryCurrentSalesDESCRIP2: TStringField
      FieldName = 'DESCRIP2'
      Size = 100
    end
  end
  object PivotTable1: TIQWebPivotTable
    Active = False
    ExportFileName = 'c:\temp.txt'
    DataSet = QryAllSales
    ExcelWindowState = wsNormal
    ExportMethod = emTextFile
    ReportTitle = 'Sales Orders Analysis'
    DataSheetName = 'DataSheet'
    AnalysisSheetName = 'AnalysisSheet'
    RowFields.Strings = (
      'COMPANY')
    ValueFields.Strings = (
      'EXTENDED_PRICE')
    DataFieldCalculation = dcNormal
    DataFieldFunction = dfSum
    Left = 67
    Top = 282
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'btnOK'
      'CheckBox1'
      'rbtnDefault'
      'rbtnUserDefined'
      'EditUserDefinedQuery1')
    SecurityCode = 'FRMSALESPIVOT'
    Left = 97
    Top = 282
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmSalesPivot'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 195759 $'
    BuildVersion = '176554'
    Left = 183
    Top = 282
  end
  object PopupMenu1: TUniPopupMenu
    Left = 153
    Top = 282
    object About1: TUniMenuItem
      Caption = 'About'
      OnClick = About1Click
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'TXT'
    Filter = 'TXT|*.txt|All files|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 124
    Top = 282
  end
  object popmUserDefinedQuery: TUniPopupMenu
    Left = 344
    Top = 192
    object SelectUserDefinedQuery1: TUniMenuItem
      Caption = 'Select User Defined Query'
      OnClick = SelectUserDefinedQuery1Click
    end
    object N1: TUniMenuItem
      Caption = '-'
    end
    object EditUserDefinedQuery1: TUniMenuItem
      Caption = 'Edit User Defined Query'
      OnClick = EditUserDefinedQuery1Click
    end
  end
  object PkUD_QUery: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id, name, descrip from ud_query')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 312
    Top = 192
    object PkUD_QUeryNAME: TStringField
      DisplayLabel = 'Query Name'
      FieldName = 'NAME'
      Origin = 'IQ.UD_QUERY.NAME'
      Size = 30
    end
    object PkUD_QUeryDESCRIP: TStringField
      DisplayLabel = 'Query Description'
      FieldName = 'DESCRIP'
      Origin = 'IQ.UD_QUERY.DESCRIP'
      Size = 60
    end
    object PkUD_QUeryID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.UD_QUERY.ID'
      Visible = False
      Size = 0
    end
  end
  object QryUD: TFDQuery
    BeforeOpen = QryAllSalesBeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    Left = 304
    Top = 147
  end
end
