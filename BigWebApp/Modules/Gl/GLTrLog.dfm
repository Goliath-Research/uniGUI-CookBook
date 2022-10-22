object FrmGLTransLog: TFrmGLTransLog
  Left = 60
  Top = 166
  ClientHeight = 409
  ClientWidth = 837
  Caption = 'Translog records involved in the transaction'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 177
    Width = 837
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alBottom
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 180
    Width = 837
    Height = 229
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object StringGrid1: TUniStringGrid
      Left = 1
      Top = 1
      Width = 835
      Height = 227
      Hint = ''
      FixedCols = 0
      RowCount = 2
      ColCount = 2
      DefaultRowHeight = 18
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goColMoving]
      Columns = <>
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      ParentFont = False
      Font.Name = 'Courier New'
    end
  end
  object PC: TUniPageControl
    Left = 0
    Top = 0
    Width = 837
    Height = 177
    Hint = ''
    ActivePage = TabGlBatch
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object TabTranlog: TUniTabSheet
      Hint = ''
      TabVisible = False
      Caption = 'TabTranlog'
      object IQSearch1: TIQUniGridControl
        Left = 0
        Top = 0
        Width = 829
        Height = 149
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 612
        IQComponents.Grid.Height = 63
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcTransLog
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
        IQComponents.Navigator.DataSource = SrcTransLog
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 612
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 63
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcTransLog
        Columns = <
          item
            FieldName = 'TRANS_DATE'
            Title.Caption = 'Date'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'TRANS_IN_OUT'
            Title.Caption = 'In/Out'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'TRANS_QUAN'
            Title.Caption = 'Tran Qty'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'RG_QUAN'
            Title.Caption = 'RG Qty'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'TRANS_TYPE'
            Title.Caption = 'Tran Type'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'LOC_DESC'
            Title.Caption = 'Location'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'LOTNO'
            Title.Caption = 'Lot#'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ACT_COST'
            Title.Caption = 'Act Cost'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'TRANS_REASON'
            Title.Caption = 'Reason'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'BEGIN_QUAN'
            Title.Caption = 'Start Qty'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'BEGIN_RG_QUAN'
            Title.Caption = 'Start RG Qty'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'STD_COST'
            Title.Caption = 'Std Cost'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'FG_LOTNO'
            Title.Caption = 'FG Lot#'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'USERID'
            Title.Caption = 'User'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'RECEIPTNO'
            Title.Caption = 'Receipt#'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DIVISION_NAME'
            Title.Caption = 'Division'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'TRANS_CODE'
            Title.Caption = 'Tran Code'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'TRANS_DESCRIP'
            Title.Caption = 'Tran Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'LOCATION_DESCRIP'
            Title.Caption = 'Location Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'BEGIN_QUAN_TOTAL'
            Title.Caption = 'Total Start Qty'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'BEGIN_RG_QUAN_TOTAL'
            Title.Caption = 'Total Start RG'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ITEMNO'
            Title.Caption = 'Item#'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DESCRIP'
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
            Title.Caption = 'Rev.'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        TabsVisible = True
        Marker = 0
      end
    end
    object TabGlBatch: TUniTabSheet
      Hint = ''
      TabVisible = False
      ImageIndex = 1
      Caption = 'TabGlBatch'
      object IQSearch2: TIQUniGridControl
        Left = 0
        Top = 0
        Width = 829
        Height = 149
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 612
        IQComponents.Grid.Height = 63
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcGlBatch
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
        IQComponents.Navigator.DataSource = SrcGlBatch
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 612
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 63
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcGlBatch
        Columns = <
          item
            FieldName = 'TRANS_DATE'
            Title.Caption = 'Date'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'TRANS_IN_OUT'
            Title.Caption = 'In/Out'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'TRANS_QUAN'
            Title.Caption = 'Tran Qty'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'RG_QUAN'
            Title.Caption = 'RG Qty'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'TRANS_TYPE'
            Title.Caption = 'Tran Type'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'LOC_DESC'
            Title.Caption = 'Location'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'LOTNO'
            Title.Caption = 'Lot#'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ACT_COST'
            Title.Caption = 'Act Cost'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'TRANS_REASON'
            Title.Caption = 'Reason'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'BEGIN_QUAN'
            Title.Caption = 'Start Qty'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'BEGIN_RG_QUAN'
            Title.Caption = 'Start RG Qty'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'STD_COST'
            Title.Caption = 'Std Cost'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'FG_LOTNO'
            Title.Caption = 'FG Lot#'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'USERID'
            Title.Caption = 'User'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'RECEIPTNO'
            Title.Caption = 'Receipt#'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DIVISION_NAME'
            Title.Caption = 'Division'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'TRANS_CODE'
            Title.Caption = 'Tran Code'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'TRANS_DESCRIP'
            Title.Caption = 'Tran Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'LOCATION_DESCRIP'
            Title.Caption = 'Location Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'BEGIN_QUAN_TOTAL'
            Title.Caption = 'Total Start Qty'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'BEGIN_RG_QUAN_TOTAL'
            Title.Caption = 'Total Start RG'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ITEMNO'
            Title.Caption = 'Item#'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DESCRIP'
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
            Title.Caption = 'Rev.'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PoNumber'
            Title.Caption = 'PO Number'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ReceiptNum'
            Title.Caption = 'Receipt#'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'Quantity'
            Title.Caption = 'Quantity'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'StdCost'
            Title.Caption = 'Std Cost'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'TotalCost'
            Title.Caption = 'Total Cost'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ActCost'
            Title.Caption = 'Act Cost'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'TotalActCost'
            Title.Caption = 'Total Act Cost'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'Item'
            Title.Caption = 'Item'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'Description'
            Title.Caption = 'Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'User_Id'
            Title.Caption = 'User ID'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'Vendor'
            Title.Caption = 'Vendor'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'Location'
            Title.Caption = 'Location'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'LotNum'
            Title.Caption = 'Lot #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'Division'
            Title.Caption = 'Division'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'GlAcct'
            Title.Caption = 'GlAcct'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'BatchCost'
            Title.Caption = 'Batch Total'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'TotalBatchCost'
            Title.Caption = 'Batch Total Act Cost'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        TabsVisible = True
        Marker = 0
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 192
    Top = 104
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
  object QryTransLog: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select t.ID,'
      '       t.trans_date,'
      '       t.trans_in_out,'
      '       t.trans_quan,'
      '       t.rg_quan,'
      '       t.trans_type,'
      '       t.loc_desc,'
      '       t.lotno,'
      '       t.fg_lotno,'
      '       t.act_cost,'
      '       t.std_cost,'
      '       t.trans_reason,'
      '       t.userid,'
      '       t.begin_quan,'
      '       t.begin_rg_quan,'
      '       t.batch,'
      '       t.parent_arinvt_id,'
      '       t.arinvt_id,'
      '       t.fgmulti_cuser1,'
      '       t.fgmulti_cuser2,'
      '       t.fgmulti_cuser3,'
      '       t.receiptno,'
      '       t.division_name,'
      '       t.trans_code,'
      '       t.trans_descrip,'
      '       t.location_descrip,'
      '       t.exclude_rpt,'
      '       t.workorder_id,'
      '       t.source,'
      '       t.source_id,'
      '       t.begin_quan_total,'
      '       t.begin_rg_quan_total,'
      '       a.itemno,'
      '       a.descrip,'
      '       a.class,'
      '       a.rev,'
      '       t.day_part_id'
      '  from translog t,'
      '       gl_translog g,'
      '       arinvt a'
      ' where g.translog_id = t.id'
      '   and t.arinvt_id = a.id(+)'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 32
    Top = 87
    object QryTransLogTRANS_DATE: TDateTimeField
      DisplayLabel = 'Date'
      DisplayWidth = 18
      FieldName = 'TRANS_DATE'
      Origin = 't.trans_date'
    end
    object QryTransLogTRANS_IN_OUT: TStringField
      DisplayLabel = 'In/Out'
      DisplayWidth = 3
      FieldName = 'TRANS_IN_OUT'
      Origin = 't.trans_in_out'
      Size = 3
    end
    object QryTransLogTRANS_QUAN: TFMTBCDField
      DisplayLabel = 'Tran Qty'
      DisplayWidth = 10
      FieldName = 'TRANS_QUAN'
      Origin = 't.TRANS_QUAN'
      Size = 6
    end
    object QryTransLogRG_QUAN: TFMTBCDField
      DisplayLabel = 'RG Qty'
      DisplayWidth = 10
      FieldName = 'RG_QUAN'
      Origin = 't.RG_QUAN'
      Size = 6
    end
    object QryTransLogTRANS_TYPE: TStringField
      DisplayLabel = 'Tran Type'
      DisplayWidth = 30
      FieldName = 'TRANS_TYPE'
      Origin = 't.TRANS_TYPE'
      Size = 30
    end
    object QryTransLogLOC_DESC: TStringField
      DisplayLabel = 'Location'
      DisplayWidth = 30
      FieldName = 'LOC_DESC'
      Origin = 't.LOC_DESC'
      Size = 30
    end
    object QryTransLogLOTNO: TStringField
      DisplayLabel = 'Lot#'
      DisplayWidth = 25
      FieldName = 'LOTNO'
      Origin = 't.LOTNO'
      Size = 25
    end
    object QryTransLogACT_COST: TFMTBCDField
      DisplayLabel = 'Act Cost'
      DisplayWidth = 10
      FieldName = 'ACT_COST'
      Origin = 't.ACT_COST'
      Size = 6
    end
    object QryTransLogTRANS_REASON: TStringField
      DisplayLabel = 'Reason'
      DisplayWidth = 35
      FieldName = 'TRANS_REASON'
      Origin = 't.TRANS_REASON'
      Size = 50
    end
    object QryTransLogBEGIN_QUAN: TBCDField
      DisplayLabel = 'Start Qty'
      DisplayWidth = 10
      FieldName = 'BEGIN_QUAN'
      Origin = 't.BEGIN_QUAN'
      Size = 2
    end
    object QryTransLogBEGIN_RG_QUAN: TBCDField
      DisplayLabel = 'Start RG Qty'
      DisplayWidth = 10
      FieldName = 'BEGIN_RG_QUAN'
      Origin = 't.BEGIN_RG_QUAN'
      Size = 2
    end
    object QryTransLogSTD_COST: TFMTBCDField
      DisplayLabel = 'Std Cost'
      DisplayWidth = 10
      FieldName = 'STD_COST'
      Origin = 't.STD_COST'
      Size = 6
    end
    object QryTransLogFG_LOTNO: TStringField
      DisplayLabel = 'FG Lot#'
      DisplayWidth = 25
      FieldName = 'FG_LOTNO'
      Origin = 'T.FG_LOTNO'
      Size = 25
    end
    object QryTransLogUSERID: TStringField
      DisplayLabel = 'User'
      DisplayWidth = 15
      FieldName = 'USERID'
      Origin = 'T.USERID'
      Size = 35
    end
    object QryTransLogRECEIPTNO: TStringField
      DisplayLabel = 'Receipt#'
      DisplayWidth = 25
      FieldName = 'RECEIPTNO'
      Origin = 'T.RECEIPTNO'
      Size = 50
    end
    object QryTransLogDIVISION_NAME: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 25
      FieldName = 'DIVISION_NAME'
      Origin = 'T.DIVISION_NAME'
      Size = 25
    end
    object QryTransLogTRANS_CODE: TStringField
      DisplayLabel = 'Tran Code'
      DisplayWidth = 10
      FieldName = 'TRANS_CODE'
      Origin = 'T.TRANS_CODE'
      Size = 10
    end
    object QryTransLogTRANS_DESCRIP: TStringField
      DisplayLabel = 'Tran Description'
      DisplayWidth = 25
      FieldName = 'TRANS_DESCRIP'
      Origin = 'T.TRANS_DESCRIP'
      Size = 25
    end
    object QryTransLogLOCATION_DESCRIP: TStringField
      DisplayLabel = 'Location Description'
      DisplayWidth = 25
      FieldName = 'LOCATION_DESCRIP'
      Origin = 'T.LOCATION_DESCRIP'
      Size = 50
    end
    object QryTransLogBEGIN_QUAN_TOTAL: TBCDField
      DisplayLabel = 'Total Start Qty'
      DisplayWidth = 10
      FieldName = 'BEGIN_QUAN_TOTAL'
      Origin = 'T.BEGIN_QUAN_TOTAL'
      Size = 2
    end
    object QryTransLogBEGIN_RG_QUAN_TOTAL: TBCDField
      DisplayLabel = 'Total Start RG'
      DisplayWidth = 10
      FieldName = 'BEGIN_RG_QUAN_TOTAL'
      Origin = 'T.BEGIN_RG_QUAN_TOTAL'
      Size = 2
    end
    object QryTransLogITEMNO: TStringField
      DisplayLabel = 'Item#'
      DisplayWidth = 15
      FieldName = 'ITEMNO'
      Origin = 'a.itemno'
      Size = 50
    end
    object QryTransLogDESCRIP: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'a.descrip'
      Size = 100
    end
    object QryTransLogCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 2
      FieldName = 'CLASS'
      Origin = 'a.class'
      Size = 2
    end
    object QryTransLogREV: TStringField
      DisplayLabel = 'Rev.'
      DisplayWidth = 5
      FieldName = 'REV'
      Origin = 'a.rev'
      Size = 15
    end
    object QryTransLogBATCH: TBCDField
      DisplayWidth = 10
      FieldName = 'BATCH'
      Origin = 'T.BATCH'
      Visible = False
      Size = 0
    end
    object QryTransLogPARENT_ARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PARENT_ARINVT_ID'
      Origin = 'T.PARENT_ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryTransLogARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Origin = 'T.ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryTransLogFGMULTI_CUSER1: TStringField
      DisplayWidth = 25
      FieldName = 'FGMULTI_CUSER1'
      Origin = 'T.FGMULTI_CUSER1'
      Visible = False
      Size = 25
    end
    object QryTransLogFGMULTI_CUSER2: TStringField
      DisplayWidth = 25
      FieldName = 'FGMULTI_CUSER2'
      Origin = 'T.FGMULTI_CUSER2'
      Visible = False
      Size = 25
    end
    object QryTransLogFGMULTI_CUSER3: TStringField
      DisplayWidth = 25
      FieldName = 'FGMULTI_CUSER3'
      Origin = 'T.FGMULTI_CUSER3'
      Visible = False
      Size = 25
    end
    object QryTransLogID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'T.ID'
      Visible = False
      Size = 0
    end
    object QryTransLogEXCLUDE_RPT: TStringField
      DisplayWidth = 1
      FieldName = 'EXCLUDE_RPT'
      Origin = 'T.EXCLUDE_RPT'
      Visible = False
      Size = 1
    end
    object QryTransLogWORKORDER_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'WORKORDER_ID'
      Origin = 'T.WORKORDER_ID'
      Visible = False
      Size = 0
    end
    object QryTransLogSOURCE: TStringField
      DisplayWidth = 50
      FieldName = 'SOURCE'
      Origin = 'T.SOURCE'
      Visible = False
      Size = 50
    end
    object QryTransLogSOURCE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SOURCE_ID'
      Origin = 'T.SOURCE_ID'
      Visible = False
      Size = 0
    end
    object QryTransLogDAY_PART_ID: TBCDField
      FieldName = 'DAY_PART_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcTransLog: TDataSource
    DataSet = QryTransLog
    Left = 32
    Top = 104
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Translog Records'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 197404 $'
    BuildVersion = '176554'
    Left = 153
    Top = 103
  end
  object QryBatch: TFDQuery
    AfterScroll = QryBatchAfterScroll
    OnCalcFields = QryBatchCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select ID,'
      '       trans_date,'
      '       trans_in_out,'
      '       trans_quan,'
      '       rg_quan,'
      '       trans_type,'
      '       loc_desc,'
      '       lotno,'
      '       fg_lotno,'
      '       act_cost,'
      '       std_cost,'
      '       trans_reason,'
      '       userid,'
      '       begin_quan,'
      '       begin_rg_quan,'
      '       batch,'
      '       parent_arinvt_id,'
      '       arinvt_id,'
      '       fgmulti_cuser1,'
      '       fgmulti_cuser2,'
      '       fgmulti_cuser3,'
      '       receiptno,'
      '       division_name,'
      '       trans_code,'
      '       trans_descrip,'
      '       location_descrip,'
      '       exclude_rpt,'
      '       workorder_id,'
      '       source,'
      '       source_id,'
      '       begin_quan_total,'
      '       begin_rg_quan_total,'
      '       itemno,'
      '       descrip,'
      '       class,'
      '       rev,'
      '       day_part_id,'
      '       glacct_id'
      'from'
      '('
      'select distinct t.ID,'
      '       t.trans_date,'
      '       t.trans_in_out,'
      '       t.trans_quan,'
      '       t.rg_quan,'
      '       t.trans_type,'
      '       t.loc_desc,'
      '       t.lotno,'
      '       t.fg_lotno,'
      '       t.act_cost,'
      '       t.std_cost,'
      '       t.trans_reason,'
      '       t.userid,'
      '       t.begin_quan,'
      '       t.begin_rg_quan,'
      '       t.batch,'
      '       t.parent_arinvt_id,'
      '       t.arinvt_id,'
      '       t.fgmulti_cuser1,'
      '       t.fgmulti_cuser2,'
      '       t.fgmulti_cuser3,'
      '       t.receiptno,'
      '       t.division_name,'
      '       t.trans_code,'
      '       t.trans_descrip,'
      '       t.location_descrip,'
      '       t.exclude_rpt,'
      '       t.workorder_id,'
      '       t.source,'
      '       t.source_id,'
      '       t.begin_quan_total,'
      '       t.begin_rg_quan_total,'
      '       a.itemno,'
      '       a.descrip,'
      '       a.class,'
      '       a.rev,'
      '       t.day_part_id,'
      '       :AGlacctId2 as glacct_id'
      '  from translog t,'
      '       gl_translog g,'
      '       arinvt a,'
      '       glbatch b'
      ' where g.translog_id = t.id'
      '   and b.glbatchid_id = g.glbatchid_id'
      '   and b.glacct_id = :AGlacctId'
      '   and t.arinvt_id = a.id(+)'
      '   and g.glbatchid_id = :aId   '
      ')'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 72
    Top = 88
    ParamData = <
      item
        Name = 'AGlacctId2'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'AGlacctId'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'aId'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Date'
      DisplayWidth = 18
      FieldName = 'TRANS_DATE'
      Origin = 'trans_date'
    end
    object StringField1: TStringField
      DisplayLabel = 'In/Out'
      DisplayWidth = 3
      FieldName = 'TRANS_IN_OUT'
      Origin = 'trans_in_out'
      Size = 3
    end
    object FloatField1: TFMTBCDField
      DisplayLabel = 'Tran Qty'
      DisplayWidth = 10
      FieldName = 'TRANS_QUAN'
      Origin = 'TRANS_QUAN'
      Size = 6
    end
    object FloatField2: TFMTBCDField
      DisplayLabel = 'RG Qty'
      DisplayWidth = 10
      FieldName = 'RG_QUAN'
      Origin = 'RG_QUAN'
      Size = 6
    end
    object StringField2: TStringField
      DisplayLabel = 'Tran Type'
      DisplayWidth = 30
      FieldName = 'TRANS_TYPE'
      Origin = 'TRANS_TYPE'
      Size = 30
    end
    object StringField3: TStringField
      DisplayLabel = 'Location'
      DisplayWidth = 30
      FieldName = 'LOC_DESC'
      Origin = 'LOC_DESC'
      Size = 30
    end
    object StringField4: TStringField
      DisplayLabel = 'Lot#'
      DisplayWidth = 25
      FieldName = 'LOTNO'
      Origin = 'LOTNO'
      Size = 25
    end
    object FloatField3: TFMTBCDField
      DisplayLabel = 'Act Cost'
      DisplayWidth = 10
      FieldName = 'ACT_COST'
      Origin = 'ACT_COST'
      Size = 6
    end
    object StringField5: TStringField
      DisplayLabel = 'Reason'
      DisplayWidth = 35
      FieldName = 'TRANS_REASON'
      Origin = 'TRANS_REASON'
      Size = 50
    end
    object FloatField4: TFMTBCDField
      DisplayLabel = 'Start Qty'
      DisplayWidth = 10
      FieldName = 'BEGIN_QUAN'
      Origin = 'BEGIN_QUAN'
      Size = 2
    end
    object FloatField5: TFMTBCDField
      DisplayLabel = 'Start RG Qty'
      DisplayWidth = 10
      FieldName = 'BEGIN_RG_QUAN'
      Origin = 'BEGIN_RG_QUAN'
      Size = 2
    end
    object FloatField6: TFMTBCDField
      DisplayLabel = 'Std Cost'
      DisplayWidth = 10
      FieldName = 'STD_COST'
      Origin = 'STD_COST'
      Size = 6
    end
    object StringField6: TStringField
      DisplayLabel = 'FG Lot#'
      DisplayWidth = 25
      FieldName = 'FG_LOTNO'
      Origin = 'FG_LOTNO'
      Size = 25
    end
    object StringField7: TStringField
      DisplayLabel = 'User'
      DisplayWidth = 15
      FieldName = 'USERID'
      Origin = 'USERID'
      Size = 35
    end
    object StringField8: TStringField
      DisplayLabel = 'Receipt#'
      DisplayWidth = 25
      FieldName = 'RECEIPTNO'
      Origin = 'RECEIPTNO'
      Size = 50
    end
    object StringField9: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 25
      FieldName = 'DIVISION_NAME'
      Origin = 'DIVISION_NAME'
      Size = 25
    end
    object StringField10: TStringField
      DisplayLabel = 'Tran Code'
      DisplayWidth = 10
      FieldName = 'TRANS_CODE'
      Origin = 'TRANS_CODE'
      Size = 10
    end
    object StringField11: TStringField
      DisplayLabel = 'Tran Description'
      DisplayWidth = 25
      FieldName = 'TRANS_DESCRIP'
      Origin = 'TRANS_DESCRIP'
      Size = 25
    end
    object StringField12: TStringField
      DisplayLabel = 'Location Description'
      DisplayWidth = 25
      FieldName = 'LOCATION_DESCRIP'
      Origin = 'LOCATION_DESCRIP'
      Size = 50
    end
    object FloatField7: TFMTBCDField
      DisplayLabel = 'Total Start Qty'
      DisplayWidth = 10
      FieldName = 'BEGIN_QUAN_TOTAL'
      Origin = 'BEGIN_QUAN_TOTAL'
      Size = 2
    end
    object FloatField8: TFMTBCDField
      DisplayLabel = 'Total Start RG'
      DisplayWidth = 10
      FieldName = 'BEGIN_RG_QUAN_TOTAL'
      Origin = 'BEGIN_RG_QUAN_TOTAL'
      Size = 2
    end
    object StringField13: TStringField
      DisplayLabel = 'Item#'
      DisplayWidth = 15
      FieldName = 'ITEMNO'
      Origin = 'itemno'
      Size = 50
    end
    object StringField14: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'descrip'
      Size = 100
    end
    object StringField15: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 2
      FieldName = 'CLASS'
      Origin = 'class'
      Size = 2
    end
    object StringField16: TStringField
      DisplayLabel = 'Rev.'
      DisplayWidth = 5
      FieldName = 'REV'
      Origin = 'rev'
      Size = 15
    end
    object FloatField9: TBCDField
      DisplayWidth = 10
      FieldName = 'BATCH'
      Origin = 'BATCH'
      Visible = False
      Size = 0
    end
    object FloatField10: TBCDField
      DisplayWidth = 10
      FieldName = 'PARENT_ARINVT_ID'
      Origin = 'PARENT_ARINVT_ID'
      Visible = False
      Size = 0
    end
    object FloatField11: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Origin = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object StringField17: TStringField
      DisplayWidth = 25
      FieldName = 'FGMULTI_CUSER1'
      Origin = 'FGMULTI_CUSER1'
      Visible = False
      Size = 25
    end
    object StringField18: TStringField
      DisplayWidth = 25
      FieldName = 'FGMULTI_CUSER2'
      Origin = 'FGMULTI_CUSER2'
      Visible = False
      Size = 25
    end
    object StringField19: TStringField
      DisplayWidth = 25
      FieldName = 'FGMULTI_CUSER3'
      Origin = 'FGMULTI_CUSER3'
      Visible = False
      Size = 25
    end
    object FloatField12: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'ID'
      Visible = False
      Size = 0
    end
    object StringField20: TStringField
      DisplayWidth = 1
      FieldName = 'EXCLUDE_RPT'
      Origin = 'EXCLUDE_RPT'
      Visible = False
      Size = 1
    end
    object FloatField13: TBCDField
      DisplayWidth = 10
      FieldName = 'WORKORDER_ID'
      Origin = 'WORKORDER_ID'
      Visible = False
      Size = 0
    end
    object StringField21: TStringField
      DisplayWidth = 50
      FieldName = 'SOURCE'
      Origin = 'SOURCE'
      Visible = False
      Size = 50
    end
    object FloatField14: TBCDField
      DisplayWidth = 10
      FieldName = 'SOURCE_ID'
      Origin = 'SOURCE_ID'
      Visible = False
      Size = 0
    end
    object QryBatchDAY_PART_ID: TBCDField
      FieldName = 'DAY_PART_ID'
      Origin = 'day_part_id'
      Visible = False
      Size = 0
    end
    object QryBatchGLACCT_ID: TFMTBCDField
      FieldName = 'GLACCT_ID'
      Size = 0
    end
    object QryBatchPoNumber: TStringField
      FieldKind = fkCalculated
      FieldName = 'PoNumber'
      Calculated = True
    end
    object QryBatchReceiptNum: TStringField
      FieldKind = fkCalculated
      FieldName = 'ReceiptNum'
      Calculated = True
    end
    object QryBatchItem: TStringField
      FieldKind = fkCalculated
      FieldName = 'Item'
      Calculated = True
    end
    object QryBatchDescription: TStringField
      FieldKind = fkCalculated
      FieldName = 'Description'
      Calculated = True
    end
    object QryBatchUser_Id: TStringField
      FieldKind = fkCalculated
      FieldName = 'User_Id'
      Calculated = True
    end
    object QryBatchVendor: TStringField
      FieldKind = fkCalculated
      FieldName = 'Vendor'
      Calculated = True
    end
    object QryBatchLocation: TStringField
      FieldKind = fkCalculated
      FieldName = 'Location'
      Calculated = True
    end
    object QryBatchLotNum: TStringField
      FieldKind = fkCalculated
      FieldName = 'LotNum'
      Calculated = True
    end
    object QryBatchDivision: TStringField
      FieldKind = fkCalculated
      FieldName = 'Division'
      Calculated = True
    end
    object QryBatchGlAcct: TStringField
      FieldKind = fkCalculated
      FieldName = 'GlAcct'
      Calculated = True
    end
    object QryBatchQuantity: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Quantity'
      Calculated = True
    end
    object QryBatchStdCost: TFloatField
      FieldKind = fkCalculated
      FieldName = 'StdCost'
      currency = True
      Calculated = True
    end
    object QryBatchTotalCost: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalCost'
      currency = True
      Calculated = True
    end
    object QryBatchActCost: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ActCost'
      currency = True
      Calculated = True
    end
    object QryBatchTotalActCost: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalActCost'
      currency = True
      Calculated = True
    end
    object QryBatchBatchCost: TFloatField
      FieldKind = fkCalculated
      FieldName = 'BatchCost'
      currency = True
      Calculated = True
    end
    object QryBatchTotalBatchCost: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalBatchCost'
      currency = True
      Calculated = True
    end
  end
  object QryJournal: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select t.ID,'
      '       t.trans_date,'
      '       t.trans_in_out,'
      '       t.trans_quan,'
      '       t.rg_quan,'
      '       t.trans_type,'
      '       t.loc_desc,'
      '       t.lotno,'
      '       t.fg_lotno,'
      '       t.act_cost,'
      '       t.std_cost,'
      '       t.trans_reason,'
      '       t.userid,'
      '       t.begin_quan,'
      '       t.begin_rg_quan,'
      '       t.batch,'
      '       t.parent_arinvt_id,'
      '       t.arinvt_id,'
      '       t.fgmulti_cuser1,'
      '       t.fgmulti_cuser2,'
      '       t.fgmulti_cuser3,'
      '       t.receiptno,'
      '       t.division_name,'
      '       t.trans_code,'
      '       t.trans_descrip,'
      '       t.location_descrip,'
      '       t.exclude_rpt,'
      '       t.workorder_id,'
      '       t.source,'
      '       t.source_id,'
      '       t.begin_quan_total,'
      '       t.begin_rg_quan_total,'
      '       a.itemno,'
      '       a.descrip,'
      '       a.class,'
      '       a.rev,'
      '       t.day_part_id'
      '  from translog t,'
      '       gl_translog g,'
      '       arinvt a'
      ' where g.translog_id = t.id'
      '   and t.arinvt_id = a.id(+)'
      '   and glprepost_id = :aId'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 112
    Top = 88
    ParamData = <
      item
        Name = 'aId'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object DateTimeField2: TDateTimeField
      DisplayLabel = 'Date'
      DisplayWidth = 18
      FieldName = 'TRANS_DATE'
      Origin = 't.trans_date'
    end
    object StringField22: TStringField
      DisplayLabel = 'In/Out'
      DisplayWidth = 3
      FieldName = 'TRANS_IN_OUT'
      Origin = 't.trans_in_out'
      Size = 3
    end
    object FloatField15: TFMTBCDField
      DisplayLabel = 'Tran Qty'
      DisplayWidth = 10
      FieldName = 'TRANS_QUAN'
      Origin = 't.TRANS_QUAN'
      Size = 6
    end
    object FloatField16: TFMTBCDField
      DisplayLabel = 'RG Qty'
      DisplayWidth = 10
      FieldName = 'RG_QUAN'
      Origin = 't.RG_QUAN'
      Size = 6
    end
    object StringField23: TStringField
      DisplayLabel = 'Tran Type'
      DisplayWidth = 30
      FieldName = 'TRANS_TYPE'
      Origin = 't.TRANS_TYPE'
      Size = 30
    end
    object StringField24: TStringField
      DisplayLabel = 'Location'
      DisplayWidth = 30
      FieldName = 'LOC_DESC'
      Origin = 't.LOC_DESC'
      Size = 30
    end
    object StringField25: TStringField
      DisplayLabel = 'Lot#'
      DisplayWidth = 25
      FieldName = 'LOTNO'
      Origin = 't.LOTNO'
      Size = 25
    end
    object FloatField17: TFMTBCDField
      DisplayLabel = 'Act Cost'
      DisplayWidth = 10
      FieldName = 'ACT_COST'
      Origin = 't.ACT_COST'
      Size = 6
    end
    object StringField26: TStringField
      DisplayLabel = 'Reason'
      DisplayWidth = 35
      FieldName = 'TRANS_REASON'
      Origin = 't.TRANS_REASON'
      Size = 50
    end
    object FloatField18: TFMTBCDField
      DisplayLabel = 'Start Qty'
      DisplayWidth = 10
      FieldName = 'BEGIN_QUAN'
      Origin = 't.BEGIN_QUAN'
      Size = 2
    end
    object FloatField19: TFMTBCDField
      DisplayLabel = 'Start RG Qty'
      DisplayWidth = 10
      FieldName = 'BEGIN_RG_QUAN'
      Origin = 't.BEGIN_RG_QUAN'
      Size = 2
    end
    object FloatField20: TFMTBCDField
      DisplayLabel = 'Std Cost'
      DisplayWidth = 10
      FieldName = 'STD_COST'
      Origin = 't.STD_COST'
      Size = 6
    end
    object StringField27: TStringField
      DisplayLabel = 'FG Lot#'
      DisplayWidth = 25
      FieldName = 'FG_LOTNO'
      Origin = 'T.FG_LOTNO'
      Size = 25
    end
    object StringField28: TStringField
      DisplayLabel = 'User'
      DisplayWidth = 15
      FieldName = 'USERID'
      Origin = 'T.USERID'
      Size = 35
    end
    object StringField29: TStringField
      DisplayLabel = 'Receipt#'
      DisplayWidth = 25
      FieldName = 'RECEIPTNO'
      Origin = 'T.RECEIPTNO'
      Size = 50
    end
    object StringField30: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 25
      FieldName = 'DIVISION_NAME'
      Origin = 'T.DIVISION_NAME'
      Size = 25
    end
    object StringField31: TStringField
      DisplayLabel = 'Tran Code'
      DisplayWidth = 10
      FieldName = 'TRANS_CODE'
      Origin = 'T.TRANS_CODE'
      Size = 10
    end
    object StringField32: TStringField
      DisplayLabel = 'Tran Description'
      DisplayWidth = 25
      FieldName = 'TRANS_DESCRIP'
      Origin = 'T.TRANS_DESCRIP'
      Size = 25
    end
    object StringField33: TStringField
      DisplayLabel = 'Location Description'
      DisplayWidth = 25
      FieldName = 'LOCATION_DESCRIP'
      Origin = 'T.LOCATION_DESCRIP'
      Size = 50
    end
    object FloatField21: TFMTBCDField
      DisplayLabel = 'Total Start Qty'
      DisplayWidth = 10
      FieldName = 'BEGIN_QUAN_TOTAL'
      Origin = 'T.BEGIN_QUAN_TOTAL'
      Size = 2
    end
    object FloatField22: TFMTBCDField
      DisplayLabel = 'Total Start RG'
      DisplayWidth = 10
      FieldName = 'BEGIN_RG_QUAN_TOTAL'
      Origin = 'T.BEGIN_RG_QUAN_TOTAL'
      Size = 2
    end
    object StringField34: TStringField
      DisplayLabel = 'Item#'
      DisplayWidth = 15
      FieldName = 'ITEMNO'
      Origin = 'a.itemno'
      Size = 50
    end
    object StringField35: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'a.descrip'
      Size = 100
    end
    object StringField36: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 2
      FieldName = 'CLASS'
      Origin = 'a.class'
      Size = 2
    end
    object StringField37: TStringField
      DisplayLabel = 'Rev.'
      DisplayWidth = 5
      FieldName = 'REV'
      Origin = 'a.rev'
      Size = 15
    end
    object FloatField23: TBCDField
      DisplayWidth = 10
      FieldName = 'BATCH'
      Origin = 'T.BATCH'
      Visible = False
      Size = 0
    end
    object FloatField24: TBCDField
      DisplayWidth = 10
      FieldName = 'PARENT_ARINVT_ID'
      Origin = 'T.PARENT_ARINVT_ID'
      Visible = False
      Size = 0
    end
    object FloatField25: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Origin = 'T.ARINVT_ID'
      Visible = False
      Size = 0
    end
    object StringField38: TStringField
      DisplayWidth = 25
      FieldName = 'FGMULTI_CUSER1'
      Origin = 'T.FGMULTI_CUSER1'
      Visible = False
      Size = 25
    end
    object StringField39: TStringField
      DisplayWidth = 25
      FieldName = 'FGMULTI_CUSER2'
      Origin = 'T.FGMULTI_CUSER2'
      Visible = False
      Size = 25
    end
    object StringField40: TStringField
      DisplayWidth = 25
      FieldName = 'FGMULTI_CUSER3'
      Origin = 'T.FGMULTI_CUSER3'
      Visible = False
      Size = 25
    end
    object FloatField26: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'T.ID'
      Visible = False
      Size = 0
    end
    object StringField41: TStringField
      DisplayWidth = 1
      FieldName = 'EXCLUDE_RPT'
      Origin = 'T.EXCLUDE_RPT'
      Visible = False
      Size = 1
    end
    object FloatField27: TBCDField
      DisplayWidth = 10
      FieldName = 'WORKORDER_ID'
      Origin = 'T.WORKORDER_ID'
      Visible = False
      Size = 0
    end
    object StringField42: TStringField
      DisplayWidth = 50
      FieldName = 'SOURCE'
      Origin = 'T.SOURCE'
      Visible = False
      Size = 50
    end
    object FloatField28: TBCDField
      DisplayWidth = 10
      FieldName = 'SOURCE_ID'
      Origin = 'T.SOURCE_ID'
      Visible = False
      Size = 0
    end
    object QryJournalDAY_PART_ID: TBCDField
      FieldName = 'DAY_PART_ID'
      Origin = 't.day_part_id'
      Visible = False
      Size = 0
    end
  end
  object PopupMenu1: TUniPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 227
    Top = 104
    object JumpToProductionReporting1: TUniMenuItem
      Caption = 'Jump To Production Reporting'
      OnClick = JumpToProductionReporting1Click
    end
    object JumptoPO1: TUniMenuItem
      Caption = 'Jump to PO'
      OnClick = JumptoPO1Click
    end
  end
  object SrcGlBatch: TDataSource
    DataSet = QryBatch
    Left = 72
    Top = 104
  end
  object PopupMenu2: TUniPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 323
    Top = 104
    object JumpToProductionReporting2: TUniMenuItem
      Caption = 'Jump To Production Reporting'
      OnClick = JumpToProductionReporting2Click
    end
    object JumptoPO2: TUniMenuItem
      Caption = 'Jump to PO'
      OnClick = JumptoPO2Click
    end
  end
end
