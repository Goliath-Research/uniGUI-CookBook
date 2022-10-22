object FrmSerDD: TFrmSerDD
  Left = 80
  Top = 176
  ClientHeight = 388
  ClientWidth = 343
  Caption = 'TransLog Records'
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
    Width = 343
    Height = 388
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 126
    IQComponents.Grid.Height = 302
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
    IQComponents.HiddenPanel.Left = 126
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 302
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
        FieldName = 'CLASS'
        Title.Caption = 'Class'
        Width = 63
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ITEMNO'
        Title.Caption = 'Item #'
        Width = 175
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REV'
        Title.Caption = 'Rev'
        Width = 105
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 245
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'UNIT'
        Title.Caption = 'UOM'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TRANS_IN_OUT'
        Title.Caption = 'In/Out'
        Width = 21
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TRANS_DATE'
        Title.Caption = 'Date'
        Width = 126
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TRANS_QUAN'
        Title.Caption = 'Tran Qty'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'RG_QUAN'
        Title.Caption = 'Tran RG'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TRANS_TYPE'
        Title.Caption = 'Trans Type'
        Width = 210
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'LOC_DESC'
        Title.Caption = 'Location'
        Width = 210
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ACT_COST'
        Title.Caption = 'Act Cost'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'MFGNO'
        Title.Caption = 'Mfg#'
        Width = 175
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'USERID'
        Title.Caption = 'User'
        Width = 245
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'LOTNO'
        Title.Caption = 'Lot#'
        Width = 175
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FG_LOTNO'
        Title.Caption = 'FG Lot#'
        Width = 175
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TRANS_REASON'
        Title.Caption = 'Reason'
        Width = 245
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BATCH'
        Title.Caption = 'Batch'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BEGIN_QUAN'
        Title.Caption = 'Start Qty'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BEGIN_RG_QUAN'
        Title.Caption = 'Start RG'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'STD_COST'
        Title.Caption = 'Std Cost'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'COST_ELEMENT'
        Title.Caption = 'Cost Element'
        Width = 210
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'RECEIPTNO'
        Title.Caption = 'Receipt#'
        Width = 350
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TRANS_CODE'
        Title.Caption = 'Tran Code'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TRANS_DESCRIP'
        Title.Caption = 'Tran Description'
        Width = 175
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'LOCATION_DESCRIP'
        Title.Caption = 'Location Description'
        Width = 350
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EPLANT_ID'
        Title.Caption = 'Eplant ID'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BEGIN_QUAN_TOTAL'
        Title.Caption = 'Total Start Qty'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BEGIN_RG_QUAN_TOTAL'
        Title.Caption = 'Total Start RG'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP2'
        Title.Caption = 'Ext. Description'
        Width = 140
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object MainMenu1: TUniMainMenu
    Left = 176
    Top = 40
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
  object SrcTransLog: TDataSource
    DataSet = QryTransLog
    Left = 216
    Top = 40
  end
  object QryTransLog: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select translog.class,'
      '       translog.itemno,'
      '       translog.rev,'
      '       translog.descrip,'
      '       translog.unit,'
      '       translog.trans_in_out,'
      '       translog.trans_date,'
      '       translog.trans_quan,'
      '       translog.rg_quan,'
      '       translog.trans_type,'
      '       translog.loc_desc,'
      '       translog.act_cost,'
      '       translog.mfgno,'
      '       translog.orderno,'
      '       translog.userid,'
      '       translog.lotno,'
      '       translog.fg_lotno,'
      '       translog.trans_reason,'
      '       translog.batch,'
      '       translog.begin_quan,'
      '       translog.begin_rg_quan,'
      '       translog.std_cost,'
      '       translog.cost_element,'
      '       translog.receiptno,'
      '       translog.trans_code,'
      '       translog.trans_descrip,'
      '       translog.location_descrip,'
      '       translog.eplant_id,'
      '       translog.begin_quan_total,'
      '       translog.begin_rg_quan_total,'
      '       translog.recv_date,'
      '       translog.prod_date,'
      '       a.descrip2'
      '  from translog translog, arinvt a'
      ' where translog.source = '#39'MASTER_LABEL'#39
      '   and translog.source_id = :nId'
      '   and translog.arinvt_id = a.id(+)')
    Left = 216
    Top = 56
    ParamData = <
      item
        Name = 'nId'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryTransLogCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 2
      FieldName = 'CLASS'
      Origin = 'TRANSLOG.CLASS'
      Size = 2
    end
    object QryTransLogITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 'TRANSLOG.ITEMNO'
      Size = 50
    end
    object QryTransLogREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 15
      FieldName = 'REV'
      Origin = 'TRANSLOG.REV'
      Size = 15
    end
    object QryTransLogDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Origin = 'TRANSLOG.DESCRIP'
      Size = 100
    end
    object QryTransLogUNIT: TStringField
      DisplayLabel = 'UOM'
      DisplayWidth = 10
      FieldName = 'UNIT'
      Origin = 'TRANSLOG.UNIT'
      Size = 10
    end
    object QryTransLogTRANS_IN_OUT: TStringField
      DisplayLabel = 'In/Out'
      DisplayWidth = 3
      FieldName = 'TRANS_IN_OUT'
      Origin = 'TRANSLOG.TRANS_IN_OUT'
      Size = 3
    end
    object QryTransLogTRANS_DATE: TDateTimeField
      DisplayLabel = 'Date'
      DisplayWidth = 18
      FieldName = 'TRANS_DATE'
      Origin = 'TRANSLOG.TRANS_DATE'
    end
    object QryTransLogTRANS_QUAN: TFMTBCDField
      DisplayLabel = 'Tran Qty'
      DisplayWidth = 10
      FieldName = 'TRANS_QUAN'
      Origin = 'TRANSLOG.TRANS_QUAN'
      Size = 6
    end
    object QryTransLogRG_QUAN: TFMTBCDField
      DisplayLabel = 'Tran RG'
      DisplayWidth = 10
      FieldName = 'RG_QUAN'
      Origin = 'TRANSLOG.RG_QUAN'
      Size = 6
    end
    object QryTransLogTRANS_TYPE: TStringField
      DisplayLabel = 'Trans Type'
      DisplayWidth = 30
      FieldName = 'TRANS_TYPE'
      Origin = 'TRANSLOG.TRANS_TYPE'
      Size = 30
    end
    object QryTransLogLOC_DESC: TStringField
      DisplayLabel = 'Location'
      DisplayWidth = 30
      FieldName = 'LOC_DESC'
      Origin = 'TRANSLOG.LOC_DESC'
      Size = 30
    end
    object QryTransLogACT_COST: TFMTBCDField
      DisplayLabel = 'Act Cost'
      DisplayWidth = 10
      FieldName = 'ACT_COST'
      Origin = 'TRANSLOG.ACT_COST'
      Size = 6
    end
    object QryTransLogMFGNO: TStringField
      DisplayLabel = 'Mfg#'
      DisplayWidth = 25
      FieldName = 'MFGNO'
      Origin = 'TRANSLOG.MFGNO'
      Size = 50
    end
    object QryTransLogUSERID: TStringField
      DisplayLabel = 'User'
      DisplayWidth = 35
      FieldName = 'USERID'
      Origin = 'TRANSLOG.USERID'
      Size = 35
    end
    object QryTransLogLOTNO: TStringField
      DisplayLabel = 'Lot#'
      DisplayWidth = 25
      FieldName = 'LOTNO'
      Origin = 'TRANSLOG.LOTNO'
      Size = 25
    end
    object QryTransLogFG_LOTNO: TStringField
      DisplayLabel = 'FG Lot#'
      DisplayWidth = 25
      FieldName = 'FG_LOTNO'
      Origin = 'TRANSLOG.FG_LOTNO'
      Size = 25
    end
    object QryTransLogTRANS_REASON: TStringField
      DisplayLabel = 'Reason'
      DisplayWidth = 35
      FieldName = 'TRANS_REASON'
      Origin = 'TRANSLOG.TRANS_REASON'
      Size = 50
    end
    object QryTransLogBATCH: TBCDField
      DisplayLabel = 'Batch'
      DisplayWidth = 10
      FieldName = 'BATCH'
      Origin = 'TRANSLOG.BATCH'
      Size = 0
    end
    object QryTransLogBEGIN_QUAN: TFMTBCDField
      DisplayLabel = 'Start Qty'
      DisplayWidth = 10
      FieldName = 'BEGIN_QUAN'
      Origin = 'TRANSLOG.BEGIN_QUAN'
      Size = 6
    end
    object QryTransLogBEGIN_RG_QUAN: TFMTBCDField
      DisplayLabel = 'Start RG'
      DisplayWidth = 10
      FieldName = 'BEGIN_RG_QUAN'
      Origin = 'TRANSLOG.BEGIN_RG_QUAN'
      Size = 6
    end
    object QryTransLogSTD_COST: TFMTBCDField
      DisplayLabel = 'Std Cost'
      DisplayWidth = 10
      FieldName = 'STD_COST'
      Origin = 'TRANSLOG.STD_COST'
      Size = 6
    end
    object QryTransLogCOST_ELEMENT: TStringField
      DisplayLabel = 'Cost Element'
      DisplayWidth = 30
      FieldName = 'COST_ELEMENT'
      Origin = 'TRANSLOG.COST_ELEMENT'
      Size = 30
    end
    object QryTransLogRECEIPTNO: TStringField
      DisplayLabel = 'Receipt#'
      DisplayWidth = 50
      FieldName = 'RECEIPTNO'
      Origin = 'TRANSLOG.RECEIPTNO'
      Size = 50
    end
    object QryTransLogTRANS_CODE: TStringField
      DisplayLabel = 'Tran Code'
      DisplayWidth = 10
      FieldName = 'TRANS_CODE'
      Origin = 'TRANSLOG.TRANS_CODE'
      Size = 10
    end
    object QryTransLogTRANS_DESCRIP: TStringField
      DisplayLabel = 'Tran Description'
      DisplayWidth = 25
      FieldName = 'TRANS_DESCRIP'
      Origin = 'TRANSLOG.TRANS_DESCRIP'
      Size = 25
    end
    object QryTransLogLOCATION_DESCRIP: TStringField
      DisplayLabel = 'Location Description'
      DisplayWidth = 50
      FieldName = 'LOCATION_DESCRIP'
      Origin = 'TRANSLOG.LOCATION_DESCRIP'
      Size = 50
    end
    object QryTransLogEPLANT_ID: TBCDField
      DisplayLabel = 'Eplant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'TRANSLOG.EPLANT_ID'
      Size = 0
    end
    object QryTransLogBEGIN_QUAN_TOTAL: TFMTBCDField
      DisplayLabel = 'Total Start Qty'
      DisplayWidth = 10
      FieldName = 'BEGIN_QUAN_TOTAL'
      Origin = 'TRANSLOG.BEGIN_QUAN_TOTAL'
      Size = 6
    end
    object QryTransLogBEGIN_RG_QUAN_TOTAL: TFMTBCDField
      DisplayLabel = 'Total Start RG'
      DisplayWidth = 10
      FieldName = 'BEGIN_RG_QUAN_TOTAL'
      Origin = 'TRANSLOG.BEGIN_RG_QUAN_TOTAL'
      Size = 6
    end
    object QryTransLogDESCRIP2: TStringField
      DisplayLabel = 'Ext. Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP2'
      Origin = 'a.DESCRIP2'
      Size = 100
    end
    object QryTransLogRECV_DATE: TDateTimeField
      DisplayWidth = 18
      FieldName = 'RECV_DATE'
      Origin = 'TRANSLOG.RECV_DATE'
      Visible = False
    end
    object QryTransLogPROD_DATE: TDateTimeField
      DisplayWidth = 18
      FieldName = 'PROD_DATE'
      Origin = 'TRANSLOG.PROD_DATE'
      Visible = False
    end
    object QryTransLogORDERNO: TStringField
      DisplayWidth = 15
      FieldName = 'ORDERNO'
      Origin = 'IQ.TRANSLOG.ORDERNO'
      Visible = False
      Size = 15
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'TransLog Records'
    Version = 'DEV.176554'
    BuildVersion = '176554'
    Left = 256
    Top = 48
  end
end
