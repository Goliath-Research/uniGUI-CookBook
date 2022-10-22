object FrmLotDrlDn: TFrmLotDrlDn
  Left = 92
  Top = 216
  ClientHeight = 496
  ClientWidth = 685
  Caption = 'Lot Number Drill Down'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 176
    Width = 685
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alBottom
    ParentColor = False
    Color = clBtnFace
  end
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 685
    Height = 176
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 468
    IQComponents.Grid.Height = 90
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
    IQComponents.HiddenPanel.Left = 468
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 90
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
        FieldName = 'MFGNO'
        Title.Caption = 'Mfg#'
        Width = 175
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ORDERNO'
        Title.Caption = 'Order#'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PROD_DATE'
        Title.Caption = 'Prod. Date'
        Width = 126
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SHIFT'
        Title.Caption = 'Shift'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TRANS_QUAN'
        Title.Caption = 'Trans. Qty.'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'WORKORDER_ID'
        Title.Caption = 'Work Order#'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BATCH'
        Title.Caption = 'Batch'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TRANS_DATE'
        Title.Caption = 'Trans. Date'
        Width = 126
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 179
    Width = 685
    Height = 317
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = 'Panel1'
    object Panel2: TUniPanel
      Left = 1
      Top = 1
      Width = 683
      Height = 20
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Alignment = taLeftJustify
      Caption = 'Details'
    end
    object IQSearch2: TIQUniGridControl
      Left = 1
      Top = 20
      Width = 683
      Height = 297
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 466
      IQComponents.Grid.Height = 211
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcDetail
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
      IQComponents.Navigator.DataSource = SrcDetail
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 466
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 211
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcDetail
      Columns = <
        item
          FieldName = 'CLASS'
          Title.Caption = 'Class'
          Width = 14
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ITEMNO'
          Title.Caption = 'Item#'
          Width = 175
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Description'
          Width = 245
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'REV'
          Title.Caption = 'Rev'
          Width = 105
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'UNIT'
          Title.Caption = 'Unit'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'RG_QUAN'
          Title.Caption = 'RG Qty.'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TRANS_QUAN'
          Title.Caption = 'Trans. Qty.'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'LOTNO'
          Title.Caption = 'RM Lot#'
          Width = 175
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 304
    Top = 5
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Reports1: TUniMenuItem
      Caption = '&Reports'
      object Print1: TUniMenuItem
        Caption = '&Print'
        OnClick = Print1Click
      end
      object PrinterSetup1: TUniMenuItem
        Caption = '&Printer &Setup'
        OnClick = PrinterSetup1Click
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
    AfterScroll = QryTransLogAfterScroll
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select t.trans_quan,'
      '       t.mfgno,'
      '       t.workorder_id,'
      '       t.orderno,'
      '       d.prod_date,'
      '       t.arinvt_id,'
      '       d.shift,'
      '       t.batch,'
      '       t.id,'
      '       t.trans_date'
      '  from translog t,'
      '       day_part p,'
      '       dayprod d'
      ' where t.day_part_id = p.id(+)'
      '   and p.dayprod_id = d.id(+)'
      '   and t.arinvt_id = :AID'
      '   and NVL(RTrim(LTrim(t.lotno)), '#39' '#39') = :ALotno'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 179
    Top = 83
    ParamData = <
      item
        Name = 'AID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'ALotno'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryTransLogMFGNO: TStringField
      DisplayLabel = 'Mfg#'
      DisplayWidth = 25
      FieldName = 'MFGNO'
      Origin = 't.mfgno'
      Size = 50
    end
    object QryTransLogORDERNO: TStringField
      DisplayLabel = 'Order#'
      DisplayWidth = 10
      FieldName = 'ORDERNO'
      Origin = 't.orderno'
      Size = 15
    end
    object QryTransLogPROD_DATE: TDateTimeField
      DisplayLabel = 'Prod. Date'
      DisplayWidth = 18
      FieldName = 'PROD_DATE'
      Origin = 'd.prod_date'
    end
    object QryTransLogSHIFT: TBCDField
      DisplayLabel = 'Shift'
      DisplayWidth = 10
      FieldName = 'SHIFT'
      Origin = 'd.shift'
      Size = 0
    end
    object QryTransLogTRANS_QUAN: TFMTBCDField
      DisplayLabel = 'Trans. Qty.'
      DisplayWidth = 10
      FieldName = 'TRANS_QUAN'
      Origin = 't.TRANS_QUAN'
      Size = 6
    end
    object QryTransLogWORKORDER_ID: TBCDField
      DisplayLabel = 'Work Order#'
      DisplayWidth = 10
      FieldName = 'WORKORDER_ID'
      Origin = 't.WORKORDER_ID'
      Size = 0
    end
    object QryTransLogBATCH: TBCDField
      DisplayLabel = 'Batch'
      DisplayWidth = 10
      FieldName = 'BATCH'
      Origin = 't.batch'
      Size = 0
    end
    object QryTransLogTRANS_DATE: TDateTimeField
      DisplayLabel = 'Trans. Date'
      DisplayWidth = 18
      FieldName = 'TRANS_DATE'
    end
    object QryTransLogARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryTransLogID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object SrcTransLog: TDataSource
    DataSet = QryTransLog
    Left = 192
    Top = 83
  end
  object PopupMenu1: TUniPopupMenu
    Left = 224
    Top = 84
    object ShowDetails1: TUniMenuItem
      Caption = '&Show Details'
      OnClick = ShowDetails1Click
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Lot Number Drill Down'
    Version = 'DEV.176554'
    BuildVersion = '176554'
    Left = 264
    Top = 88
  end
  object SrcDetail: TDataSource
    DataSet = QryDtl
    Left = 180
    Top = 284
  end
  object QryDtl: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select arinvt_id,'
      '       class,'
      '       itemno,'
      '       descrip,'
      '       rev,'
      '       unit,'
      '       trans_quan,'
      '       rg_quan,'
      '       lotno'
      '  from translog'
      ' where parent_arinvt_id = :aId'
      '   and batch = :aBatch'
      '   and lotno is not null'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 196
    Top = 285
    ParamData = <
      item
        Name = 'aId'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'aBatch'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryDtlCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 2
      FieldName = 'CLASS'
      Origin = 'TRANSLOG.CLASS'
      Size = 2
    end
    object QryDtlITEMNO: TStringField
      DisplayLabel = 'Item#'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 'TRANSLOG.ITEMNO'
      Size = 50
    end
    object QryDtlDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Origin = 'TRANSLOG.DESCRIP'
      Size = 100
    end
    object QryDtlREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 15
      FieldName = 'REV'
      Origin = 'TRANSLOG.REV'
      Size = 15
    end
    object QryDtlUNIT: TStringField
      DisplayLabel = 'Unit'
      DisplayWidth = 10
      FieldName = 'UNIT'
      Origin = 'TRANSLOG.UNIT'
      Size = 10
    end
    object QryDtlRG_QUAN: TFMTBCDField
      DisplayLabel = 'RG Qty.'
      DisplayWidth = 10
      FieldName = 'RG_QUAN'
      Origin = 'TRANSLOG.RG_QUAN'
      Size = 6
    end
    object QryDtlTRANS_QUAN: TFMTBCDField
      DisplayLabel = 'Trans. Qty.'
      DisplayWidth = 10
      FieldName = 'TRANS_QUAN'
      Origin = 'TRANSLOG.TRANS_QUAN'
      Size = 6
    end
    object QryDtlLOTNO: TStringField
      DisplayLabel = 'RM Lot#'
      DisplayWidth = 25
      FieldName = 'LOTNO'
      Origin = 'TRANSLOG.LOTNO'
      Size = 25
    end
    object QryDtlARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 302
    Top = 89
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmLotDrlDn'
    WebUse = False
    TouchScreen = False
    Left = 335
    Top = 89
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'Reports1'
      'Print1'
      'PrinterSetup1'
      'ShowDetails1'
      'PrinterSetupDialog1')
    SecurityCode = 'FRMLOTDRLDN'
    Left = 372
    Top = 89
  end
end
