object FrmJC_Elem_Log: TFrmJC_Elem_Log
  Left = 265
  Top = 186
  ClientHeight = 386
  ClientWidth = 753
  Caption = 'Process Cost Element Log'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  Font.Height = -14
  PixelsPerInch = 96
  TextHeight = 17
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 753
    Height = 386
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
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 536
    IQComponents.Grid.Height = 300
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
    IQComponents.HiddenPanel.Left = 536
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 300
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
        FieldName = 'TRANSLOG_ID'
        Title.Caption = 'Translog ID'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SOURCE'
        Title.Caption = 'Source'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ITEMNO'
        Title.Caption = 'Consumed Item #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ACT_PRICE'
        Title.Caption = 'Actual Price'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ACT_QTY'
        Title.Caption = 'Actual Qty'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'STD_PRICE'
        Title.Caption = 'Standard Price'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'STD_QTY'
        Title.Caption = 'Standard Qty'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PRICE_VARIANCE'
        Title.Caption = 'Price Variance'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'QTY_VARIANCE'
        Title.Caption = 'Qty Variance'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object wwDataInspectorTransLog: TwwDataInspector
    Left = 17
    Top = 47
    Width = 379
    Height = 307
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    DisableThemes = False
    TabOrder = 1
    DataSource = SrcTranslog
    Items = <
      item
        DataSource = SrcTranslog
        DataField = 'ID'
        Caption = 'ID'
        WordWrap = False
      end
      item
        DataSource = SrcTranslog
        DataField = 'BATCH'
        Caption = 'Batch #'
        WordWrap = False
      end
      item
        DataSource = SrcTranslog
        DataField = 'TRANS_QUAN'
        Caption = 'Transaction Quantity'
        WordWrap = False
      end
      item
        DataSource = SrcTranslog
        DataField = 'ACT_QTY'
        Caption = 'Actual Labor/Overhead'
        WordWrap = False
      end
      item
        DataSource = SrcTranslog
        DataField = 'ACT_COST'
        Caption = 'Actual Cost'
        WordWrap = False
      end
      item
        DataSource = SrcTranslog
        DataField = 'TRANS_IN_OUT'
        Caption = 'In/Out'
        WordWrap = False
      end
      item
        DataSource = SrcTranslog
        DataField = 'TRANS_DATE'
        Caption = 'Transaction Date'
        WordWrap = False
      end
      item
        DataSource = SrcTranslog
        DataField = 'TRANS_TYPE'
        Caption = 'Transaction Type'
        WordWrap = False
      end
      item
        DataSource = SrcTranslog
        DataField = 'LOC_DESC'
        Caption = 'Location Desc'
        WordWrap = False
      end
      item
        DataSource = SrcTranslog
        DataField = 'MFGNO'
        Caption = 'MFG #'
        WordWrap = False
      end
      item
        DataSource = SrcTranslog
        DataField = 'ORDERNO'
        Caption = 'Order #'
        WordWrap = False
      end
      item
        DataSource = SrcTranslog
        DataField = 'USERID'
        Caption = 'User ID'
        WordWrap = False
      end
      item
        DataSource = SrcTranslog
        DataField = 'LOTNO'
        Caption = 'Lot #'
        WordWrap = False
      end
      item
        DataSource = SrcTranslog
        DataField = 'FG_LOTNO'
        Caption = 'FG Lot #'
        WordWrap = False
      end
      item
        DataSource = SrcTranslog
        DataField = 'TRANS_REASON'
        Caption = 'Trans Reason'
        WordWrap = False
      end
      item
        DataSource = SrcTranslog
        DataField = 'COST_ELEMENT'
        Caption = 'Cost Element'
        WordWrap = False
      end
      item
        DataSource = SrcTranslog
        DataField = 'ARINVT_ID'
        Caption = 'Inventory Item ID'
        WordWrap = False
      end
      item
        DataSource = SrcTranslog
        DataField = 'PARENT_ARINVT_ID'
        Caption = 'Parent Inventory Item ID'
        WordWrap = False
      end
      item
        DataSource = SrcTranslog
        DataField = 'RECEIPTNO'
        Caption = 'Receipt #'
        WordWrap = False
      end
      item
        DataSource = SrcTranslog
        DataField = 'DIVISION_NAME'
        Caption = 'Division'
        WordWrap = False
      end
      item
        DataSource = SrcTranslog
        DataField = 'TRANS_CODE'
        Caption = 'Transaction Code'
        WordWrap = False
      end
      item
        DataSource = SrcTranslog
        DataField = 'TRANS_DESCRIP'
        Caption = 'Transaction Description'
        WordWrap = False
      end
      item
        DataSource = SrcTranslog
        DataField = 'PROD_DATE'
        Caption = 'Production Date'
        WordWrap = False
      end
      item
        DataSource = SrcTranslog
        DataField = 'FGMULTI_ID'
        Caption = 'Inventory Location ID'
        WordWrap = False
      end>
    CaptionWidth = 166
    Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = []
    LineStyleCaption = ovDottedLine
    LineStyleData = ovDottedLine
    Visible = False
  end
  object wwExpandButtonTranslog: TwwExpandButton
    Left = 21
    Top = 25
    Width = 119
    Height = 21
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    DisableThemes = False
    Grid = wwDataInspectorTransLog
    OnAfterExpand = wwExpandButtonTranslogAfterExpand
    Caption = 'wwExpandButtonTranslog'
    ShowText = True
    TabOrder = 2
  end
  object wwDataSource1: TwwDataSource
    DataSet = wwQuery1
    Left = 434
    Top = 53
  end
  object wwQuery1: TFDQuery
    BeforeOpen = wwQuery1BeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select a.id,'
      '       a.c_process_cost_elem_id,'
      '       a.translog_id,'
      '       a.arinvt_id,'
      '       a.source,'
      '       a.act_price,'
      '       a.act_qty,'
      '       a.std_price,'
      '       a.std_qty,'
      
        '       (a.act_price - a.std_price) * a.act_qty as price_variance' +
        ','
      '       (a.act_qty - a.std_qty) * a.std_price as qty_variance,'
      '       b.itemno,'
      '       b.rev,'
      '       b.class,'
      '       b.descrip'
      '       '
      '  from c_process_cost_log a,'
      '       arinvt b'
      ' where a.c_process_cost_elem_id = :c_process_cost_elem_id'
      '   and a.arinvt_id = b.id(+)'
      ' order by a.id'
      '')
    Left = 435
    Top = 108
    ParamData = <
      item
        Name = 'c_process_cost_elem_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object wwQuery1TRANSLOG_ID: TBCDField
      DisplayLabel = 'Translog ID'
      DisplayWidth = 10
      FieldName = 'TRANSLOG_ID'
      Origin = 'IQ.C_PROCESS_COST_LOG.TRANSLOG_ID'
      Size = 0
    end
    object wwQuery1SOURCE: TStringField
      DisplayLabel = 'Source'
      DisplayWidth = 24
      FieldName = 'SOURCE'
      Origin = 'IQ.C_PROCESS_COST_LOG.SOURCE'
      Size = 50
    end
    object wwQuery1ACT_PRICE: TFMTBCDField
      DisplayLabel = 'Act Price'
      DisplayWidth = 10
      FieldName = 'ACT_PRICE'
      Origin = 'IQ.C_PROCESS_COST_LOG.ACT_PRICE'
      OnGetText = AssignBlankIfZero
      DisplayFormat = '########0.000000'
      Size = 6
    end
    object wwQuery1ACT_QTY: TFMTBCDField
      DisplayLabel = 'Act Qty'
      DisplayWidth = 10
      FieldName = 'ACT_QTY'
      Origin = 'IQ.C_PROCESS_COST_LOG.ACT_QTY'
      OnGetText = AssignBlankIfZero
      DisplayFormat = '########0.000000'
      Size = 6
    end
    object wwQuery1STD_PRICE: TFMTBCDField
      DisplayLabel = 'Std Price'
      DisplayWidth = 10
      FieldName = 'STD_PRICE'
      Origin = 'IQ.C_PROCESS_COST_LOG.STD_PRICE'
      OnGetText = AssignBlankIfZero
      DisplayFormat = '########0.000000'
      Size = 6
    end
    object wwQuery1STD_QTY: TFMTBCDField
      DisplayLabel = 'Std Qty'
      DisplayWidth = 10
      FieldName = 'STD_QTY'
      Origin = 'IQ.C_PROCESS_COST_LOG.STD_QTY'
      OnGetText = AssignBlankIfZero
      DisplayFormat = '########0.000000'
      Size = 6
    end
    object wwQuery1PRICE_VARIANCE: TFMTBCDField
      DisplayLabel = 'Price Variance'
      DisplayWidth = 11
      FieldName = 'PRICE_VARIANCE'
      Origin = 'IQ.C_PROCESS_COST_LOG.ACT_PRICE'
      OnGetText = AssignBlankIfZero
      DisplayFormat = '########0.000000'
      Size = 38
    end
    object wwQuery1QTY_VARIANCE: TFMTBCDField
      DisplayLabel = 'Qty Variance'
      DisplayWidth = 10
      FieldName = 'QTY_VARIANCE'
      Origin = 'IQ.C_PROCESS_COST_LOG.ACT_QTY'
      OnGetText = AssignBlankIfZero
      DisplayFormat = '########0.000000'
      Size = 38
    end
    object wwQuery1ITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      FixedChar = True
      Size = 50
    end
    object wwQuery1REV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 15
      FieldName = 'REV'
      FixedChar = True
      Size = 15
    end
    object wwQuery1CLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 4
      FieldName = 'CLASS'
      FixedChar = True
      Size = 2
    end
    object wwQuery1DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Size = 100
    end
    object wwQuery1ID: TBCDField
      DisplayLabel = 'Process Cost Log ID'
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.C_PROCESS_COST_LOG.ID'
      Visible = False
      Size = 0
    end
    object wwQuery1C_PROCESS_COST_ELEM_ID: TBCDField
      FieldName = 'C_PROCESS_COST_ELEM_ID'
      Origin = 'IQ.C_PROCESS_COST_LOG.C_PROCESS_COST_ELEM_ID'
      Visible = False
      Size = 0
    end
    object wwQuery1ARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Origin = 'IQ.C_PROCESS_COST_LOG.ARINVT_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcTranslog: TDataSource
    DataSet = QryTranslog
    Left = 524
    Top = 52
  end
  object QryTranslog: TFDQuery
    Tag = 1
    BeforeOpen = QryTranslogBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       batch,'
      '       trans_in_out,'
      '       trans_date,'
      '       trans_quan,'
      '       act_qty,'
      '       act_cost,'
      '       std_cost,'
      '       trans_type,'
      '       loc_desc,'
      '       mfgno,'
      '       orderno,'
      '       userid,'
      '       lotno,'
      '       fg_lotno,'
      '       trans_reason,'
      '       cost_element,'
      '       arinvt_id,'
      '       parent_arinvt_id,'
      '       receiptno,'
      '       division_name,'
      '       trans_code,'
      '       trans_descrip,'
      '       prod_date,'
      '       fgmulti_id'
      '  from translog'
      ' where id = :translog_id')
    Left = 525
    Top = 106
    ParamData = <
      item
        Name = 'translog_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryTranslogID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.TRANSLOG.ID'
      Size = 0
    end
    object QryTranslogBATCH: TBCDField
      DisplayLabel = 'Batch #'
      FieldName = 'BATCH'
      Origin = 'IQ.TRANSLOG.BATCH'
      Size = 0
    end
    object QryTranslogTRANS_IN_OUT: TStringField
      DisplayLabel = 'In/Out'
      FieldName = 'TRANS_IN_OUT'
      Origin = 'IQ.TRANSLOG.TRANS_IN_OUT'
      FixedChar = True
      Size = 3
    end
    object QryTranslogTRANS_DATE: TDateTimeField
      DisplayLabel = 'Trans Date'
      FieldName = 'TRANS_DATE'
      Origin = 'IQ.TRANSLOG.TRANS_DATE'
    end
    object QryTranslogTRANS_QUAN: TFMTBCDField
      DisplayLabel = 'Trans Qty'
      FieldName = 'TRANS_QUAN'
      Origin = 'IQ.TRANSLOG.TRANS_QUAN'
      Size = 6
    end
    object QryTranslogACT_QTY: TFMTBCDField
      DisplayLabel = 'Act Labor/Overhead'
      FieldName = 'ACT_QTY'
      Origin = 'IQ.TRANSLOG.ACT_QTY'
      Size = 6
    end
    object QryTranslogACT_COST: TFMTBCDField
      DisplayLabel = 'Act Cost'
      FieldName = 'ACT_COST'
      Origin = 'IQ.TRANSLOG.ACT_COST'
      Size = 6
    end
    object QryTranslogTRANS_TYPE: TStringField
      DisplayLabel = 'Trans Type'
      FieldName = 'TRANS_TYPE'
      Origin = 'IQ.TRANSLOG.TRANS_TYPE'
      Size = 30
    end
    object QryTranslogLOC_DESC: TStringField
      DisplayLabel = 'Location Desc'
      FieldName = 'LOC_DESC'
      Origin = 'IQ.TRANSLOG.LOC_DESC'
      FixedChar = True
      Size = 30
    end
    object QryTranslogMFGNO: TStringField
      DisplayLabel = 'Mfg #'
      FieldName = 'MFGNO'
      Origin = 'IQ.TRANSLOG.MFGNO'
      Size = 50
    end
    object QryTranslogORDERNO: TStringField
      DisplayLabel = 'Order #'
      FieldName = 'ORDERNO'
      Origin = 'IQ.TRANSLOG.ORDERNO'
      Size = 15
    end
    object QryTranslogUSERID: TStringField
      DisplayLabel = 'User ID'
      FieldName = 'USERID'
      Origin = 'IQ.TRANSLOG.USERID'
      Size = 35
    end
    object QryTranslogLOTNO: TStringField
      DisplayLabel = 'Lot #'
      FieldName = 'LOTNO'
      Origin = 'IQ.TRANSLOG.LOTNO'
      FixedChar = True
      Size = 25
    end
    object QryTranslogFG_LOTNO: TStringField
      DisplayLabel = 'FG Lot #'
      FieldName = 'FG_LOTNO'
      Origin = 'IQ.TRANSLOG.FG_LOTNO'
      FixedChar = True
      Size = 25
    end
    object QryTranslogTRANS_REASON: TStringField
      DisplayLabel = 'Trans Reason'
      FieldName = 'TRANS_REASON'
      Origin = 'IQ.TRANSLOG.TRANS_REASON'
      Size = 50
    end
    object QryTranslogCOST_ELEMENT: TStringField
      DisplayLabel = 'Cost Element'
      FieldName = 'COST_ELEMENT'
      Origin = 'IQ.TRANSLOG.COST_ELEMENT'
      FixedChar = True
      Size = 30
    end
    object QryTranslogARINVT_ID: TBCDField
      DisplayLabel = 'Inventory Item ID'
      FieldName = 'ARINVT_ID'
      Origin = 'IQ.TRANSLOG.ARINVT_ID'
      Size = 0
    end
    object QryTranslogPARENT_ARINVT_ID: TBCDField
      DisplayLabel = 'Parent Inventory Item ID'
      FieldName = 'PARENT_ARINVT_ID'
      Origin = 'IQ.TRANSLOG.PARENT_ARINVT_ID'
      Size = 0
    end
    object QryTranslogRECEIPTNO: TStringField
      DisplayLabel = 'Receipt #'
      FieldName = 'RECEIPTNO'
      Origin = 'IQ.TRANSLOG.RECEIPTNO'
      Size = 50
    end
    object QryTranslogDIVISION_NAME: TStringField
      DisplayLabel = 'Division'
      FieldName = 'DIVISION_NAME'
      Origin = 'IQ.TRANSLOG.DIVISION_NAME'
      Size = 25
    end
    object QryTranslogTRANS_CODE: TStringField
      DisplayLabel = 'Trans Code'
      FieldName = 'TRANS_CODE'
      Origin = 'IQ.TRANSLOG.TRANS_CODE'
      Size = 10
    end
    object QryTranslogTRANS_DESCRIP: TStringField
      DisplayLabel = 'Trans Description'
      FieldName = 'TRANS_DESCRIP'
      Origin = 'IQ.TRANSLOG.TRANS_DESCRIP'
      Size = 25
    end
    object QryTranslogPROD_DATE: TDateTimeField
      DisplayLabel = 'Prod Date'
      FieldName = 'PROD_DATE'
      Origin = 'IQ.TRANSLOG.PROD_DATE'
    end
    object QryTranslogFGMULTI_ID: TBCDField
      DisplayLabel = 'Inventory Location ID'
      FieldName = 'FGMULTI_ID'
      Origin = 'IQ.TRANSLOG.FGMULTI_ID'
      Size = 0
    end
  end
end
