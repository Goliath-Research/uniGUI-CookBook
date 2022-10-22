object FrmPeriodVal: TFrmPeriodVal
  Left = 103
  Top = 185
  HelpContext = 1544359
  ClientHeight = 681
  ClientWidth = 669
  Caption = 'Inventory Period Valuation'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 241
    Width = 669
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Splitter2: TUniSplitter
    Left = 0
    Top = 516
    Width = 669
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alBottom
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 669
    Height = 241
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object IQSearchHdr: TIQUniGridControl
      Left = 1
      Top = 28
      Width = 667
      Height = 212
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 450
      IQComponents.Grid.Height = 126
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcHdr
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
      IQComponents.Navigator.DataSource = SrcHdr
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 450
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 126
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcHdr
      Columns = <
        item
          FieldName = 'DATE_CREATED'
          Title.Caption = 'Date Created'
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
          FieldName = 'PERIOD_START_DATE'
          Title.Caption = 'B.O.M./E.O.M. Period Start'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PERIOD_END_DATE'
          Title.Caption = 'B.O.M./E.O.M. Period End'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'COMMENT1'
          Title.Caption = 'Comment'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      TabsVisible = True
      Marker = 0
      object wwDBPeriod: TUniEdit
        Left = 208
        Top = 56
        Width = 121
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 3
      end
      object wwDBComment: TUniEdit
        Left = 208
        Top = 88
        Width = 121
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 2
      end
    end
    object Panel3: TUniPanel
      Left = 1
      Top = 1
      Width = 667
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = '  Header'
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 244
    Width = 669
    Height = 272
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object IQSearchDtl: TIQUniGridControl
      Left = 1
      Top = 28
      Width = 667
      Height = 243
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 450
      IQComponents.Grid.Height = 157
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcDtl
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
      IQComponents.Navigator.DataSource = SrcDtl
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 450
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 157
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcDtl
      Columns = <
        item
          FieldName = 'CLASS'
          Title.Caption = 'Class'
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
          FieldName = 'REV'
          Title.Caption = 'Rev.'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP2'
          Title.Caption = 'Ext. Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'STD_COST'
          Title.Caption = 'Std. Cost.'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ONHAND'
          Title.Caption = 'On Hand'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'NON_CONFORM_TOTAL'
          Title.Caption = 'Total Non Conform'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      TabsVisible = True
      Marker = 0
    end
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 667
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = '  Item Details'
    end
  end
  object Panel5: TUniPanel
    Left = 0
    Top = 519
    Width = 669
    Height = 162
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Panel6: TUniPanel
      Left = 1
      Top = 1
      Width = 667
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Alignment = taLeftJustify
      Caption = '  Details'
    end
    object IQSearch1: TIQUniGridControl
      Left = 1
      Top = 28
      Width = 667
      Height = 133
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 450
      IQComponents.Grid.Height = 47
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcFgMulti
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
      IQComponents.Navigator.DataSource = SrcFgMulti
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 450
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 47
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcFgMulti
      Columns = <
        item
          FieldName = 'LOC_DESC'
          Title.Caption = 'Location'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ONHAND'
          Title.Caption = 'Qty'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'NON_CONFORM_DESCRIP'
          Title.Caption = 'Non-Conform Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ACT_COST'
          Title.Caption = 'Actual Cost'
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
          FieldName = 'LOTNO'
          Title.Caption = 'Lot #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      TabsVisible = True
      Marker = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 152
    Top = 32
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Inventory Period Valuation'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 197090 $'
    BuildVersion = '176554'
    Left = 184
    Top = 32
  end
  object SrcHdr: TDataSource
    DataSet = QryHdr
    Left = 88
    Top = 75
  end
  object QryHdr: TFDQuery
    BeforePost = QryHdrBeforePost
    AfterPost = QryHdrAfterPost
    AfterDelete = QryHdrAfterDelete
    OnNewRecord = QryHdrNewRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = ' Arinvt_period_val'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select id,'
      '       date_created,'
      '       timestamp,'
      '       userid,'
      '       glperiod_id,'
      '       period_start_date,'
      '       period_end_date,'
      '       comment1'
      '  from Arinvt_period_val')
    Left = 104
    Top = 88
    object QryHdrDATE_CREATED: TDateTimeField
      DisplayLabel = 'Date Created'
      DisplayWidth = 18
      FieldName = 'DATE_CREATED'
      Origin = 'DATE_CREATED'
      ReadOnly = True
    end
    object QryHdrUSERID: TStringField
      DisplayLabel = 'User'
      DisplayWidth = 35
      FieldName = 'USERID'
      Origin = 'USERID'
      ReadOnly = True
      Size = 35
    end
    object QryHdrPERIOD_START_DATE: TDateTimeField
      DisplayLabel = 'B.O.M./E.O.M. Period Start'
      DisplayWidth = 18
      FieldName = 'PERIOD_START_DATE'
      Origin = 'PERIOD_START_DATE'
    end
    object QryHdrPERIOD_END_DATE: TDateTimeField
      DisplayLabel = 'B.O.M./E.O.M. Period End'
      DisplayWidth = 18
      FieldName = 'PERIOD_END_DATE'
      Origin = 'PERIOD_END_DATE'
    end
    object QryHdrCOMMENT1: TStringField
      DisplayLabel = 'Comment'
      DisplayWidth = 30
      FieldName = 'COMMENT1'
      Origin = 'COMMENT1'
      Size = 255
    end
    object QryHdrID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryHdrTIMESTAMP: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TIMESTAMP'
      Origin = 'TIMESTAMP'
      Visible = False
    end
    object QryHdrGLPERIOD_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'GLPERIOD_ID'
      Origin = 'GLPERIOD_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcDtl: TDataSource
    DataSet = QryDtl
    Left = 88
    Top = 327
  end
  object QryDtl: TFDQuery
    BeforeInsert = QryDtlBeforeInsert
    BeforeEdit = QryDtlBeforeInsert
    BeforeDelete = QryDtlBeforeInsert
    MasterSource = SrcHdr
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       arinvt_period_val_id,'
      '       arinvt_id,'
      '       class,'
      '       itemno,'
      '       rev,'
      '       descrip,'
      '       descrip2,'
      '       std_cost,'
      '       onhand,'
      '       non_conform_total'
      '  from Arinvt_period_val_dtl'
      ' where arinvt_period_val_id = :ID')
    Left = 104
    Top = 336
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryDtlCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 2
      FieldName = 'CLASS'
      Origin = 'CLASS'
      FixedChar = True
      Size = 2
    end
    object QryDtlITEMNO: TStringField
      DisplayLabel = 'Item#'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 'ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryDtlREV: TStringField
      DisplayLabel = 'Rev.'
      DisplayWidth = 15
      FieldName = 'REV'
      Origin = 'REV'
      FixedChar = True
      Size = 15
    end
    object QryDtlDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 100
    end
    object QryDtlDESCRIP2: TStringField
      DisplayLabel = 'Ext. Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP2'
      Origin = 'DESCRIP2'
      Size = 100
    end
    object QryDtlSTD_COST: TFMTBCDField
      DisplayLabel = 'Std. Cost.'
      DisplayWidth = 10
      FieldName = 'STD_COST'
      Origin = 'STD_COST'
      Size = 6
    end
    object QryDtlONHAND: TBCDField
      DisplayLabel = 'On Hand'
      DisplayWidth = 10
      FieldName = 'ONHAND'
      Origin = 'ONHAND'
    end
    object QryDtlNON_CONFORM_TOTAL: TBCDField
      DisplayLabel = 'Total Non Conform'
      DisplayWidth = 10
      FieldName = 'NON_CONFORM_TOTAL'
      Origin = 'NON_CONFORM_TOTAL'
    end
    object QryDtlID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'ID'
      Visible = False
      Size = 0
    end
    object QryDtlARINVT_PERIOD_VAL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_PERIOD_VAL_ID'
      Origin = 'ARINVT_PERIOD_VAL_ID'
      Visible = False
      Size = 0
    end
    object QryDtlARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Origin = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into Arinvt_period_val'
      '  (ID, DATE_CREATED, TIMESTAMP, USERID, GLPERIOD_ID, '
      'PERIOD_START_DATE, '
      '   PERIOD_END_DATE, COMMENT1)'
      'values'
      '  (:ID, :DATE_CREATED, :TIMESTAMP, :USERID, :GLPERIOD_ID, '
      ':PERIOD_START_DATE, '
      '   :PERIOD_END_DATE, :COMMENT1)')
    ModifySQL.Strings = (
      'update Arinvt_period_val'
      'set'
      '  ID = :ID,'
      '  DATE_CREATED = :DATE_CREATED,'
      '  TIMESTAMP = :TIMESTAMP,'
      '  USERID = :USERID,'
      '  GLPERIOD_ID = :GLPERIOD_ID,'
      '  PERIOD_START_DATE = :PERIOD_START_DATE,'
      '  PERIOD_END_DATE = :PERIOD_END_DATE,'
      '  COMMENT1 = :COMMENT1'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from Arinvt_period_val'
      'where'
      '  ID = :OLD_ID')
    Left = 120
    Top = 96
  end
  object PopupMenu1: TUniPopupMenu
    Left = 352
    Top = 83
    object ClearPeriod1: TUniMenuItem
      Caption = 'Clear Period'
      OnClick = ClearPeriod1Click
    end
  end
  object wwMemoDialog1: TwwMemoDialog
    DataSource = SrcHdr
    DataField = 'COMMENT1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    DlgLeft = 0
    DlgTop = 0
    DlgWidth = 561
    DlgHeight = 396
    Left = 384
    Top = 83
  end
  object SrcFgMulti: TDataSource
    DataSet = QryFgMulti
    Left = 96
    Top = 583
  end
  object QryFgMulti: TFDQuery
    BeforeInsert = QryDtlBeforeInsert
    BeforeEdit = QryDtlBeforeInsert
    BeforeDelete = QryDtlBeforeInsert
    MasterSource = SrcDtl
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       arinvt_period_val_dtl_id,'
      '       loc_id,'
      '       loc_desc,'
      '       onhand,'
      '       non_conform_descrip,'
      '       act_cost,'
      '       division_id,'
      '       division_name,'
      '       lotno'
      '  from ARINVT_PERIOD_FGMULTI'
      ' where arinvt_period_val_dtl_id = :ID'
      '')
    Left = 112
    Top = 592
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryFgMultiLOC_DESC: TStringField
      DisplayLabel = 'Location'
      DisplayWidth = 30
      FieldName = 'LOC_DESC'
      Origin = 'LOC_DESC'
      FixedChar = True
      Size = 30
    end
    object QryFgMultiONHAND: TBCDField
      DisplayLabel = 'Qty'
      DisplayWidth = 10
      FieldName = 'ONHAND'
      Origin = 'ONHAND'
    end
    object QryFgMultiNON_CONFORM_DESCRIP: TStringField
      DisplayLabel = 'Non-Conform Description'
      DisplayWidth = 30
      FieldName = 'NON_CONFORM_DESCRIP'
      Origin = 'NON_CONFORM_DESCRIP'
      Size = 30
    end
    object QryFgMultiACT_COST: TFMTBCDField
      DisplayLabel = 'Actual Cost'
      DisplayWidth = 10
      FieldName = 'ACT_COST'
      Origin = 'ACT_COST'
      Size = 6
    end
    object QryFgMultiDIVISION_NAME: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 25
      FieldName = 'DIVISION_NAME'
      Origin = 'DIVISION_NAME'
      Size = 25
    end
    object QryFgMultiID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.ARINVT_PERIOD_FGMULTI.ID'
      Visible = False
      Size = 0
    end
    object QryFgMultiARINVT_PERIOD_VAL_DTL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_PERIOD_VAL_DTL_ID'
      Origin = 'IQ.ARINVT_PERIOD_FGMULTI.ARINVT_PERIOD_VAL_DTL_ID'
      Visible = False
      Size = 0
    end
    object QryFgMultiLOC_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'LOC_ID'
      Origin = 'IQ.ARINVT_PERIOD_FGMULTI.LOC_ID'
      Visible = False
      Size = 0
    end
    object QryFgMultiDIVISION_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'DIVISION_ID'
      Origin = 'IQ.ARINVT_PERIOD_FGMULTI.DIVISION_ID'
      Visible = False
      Size = 0
    end
    object QryFgMultiLOTNO: TStringField
      FieldName = 'LOTNO'
      Origin = 'LOTNO'
      Size = 25
    end
  end
end
