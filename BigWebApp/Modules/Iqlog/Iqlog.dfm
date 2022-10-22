object IQCenterLog: TIQCenterLog
  Left = 22
  Top = 151
  HelpContext = 1111663
  ClientHeight = 343
  ClientWidth = 807
  Caption = 'IQWin32 / Center Log'
  OnShow = UniFormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  KeyPreview = True
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter2: TUniSplitter
    Left = 0
    Top = 169
    Width = 807
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object pnlHeader: TUniPanel
    Left = 0
    Top = 0
    Width = 807
    Height = 169
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 267
      Top = 0
      Width = 6
      Height = 169
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object pnlMachLog: TUniPanel
      Left = 1
      Top = 1
      Width = 267
      Height = 167
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object IQSearch1: TIQUniGridControl
        Left = 1
        Top = 1
        Width = 265
        Height = 165
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 48
        IQComponents.Grid.Height = 79
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcMachLog
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
        IQComponents.Navigator.DataSource = SrcMachLog
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 48
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 79
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcMachLog
        Columns = <
          item
            FieldName = 'EQNO'
            Title.Caption = 'Work Center'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'MFGNO'
            Title.Caption = 'Mfg #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CNTR_DESC'
            Title.Caption = 'Work Center Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'EPLANT_ID'
            Title.Caption = 'EPlant ID'
            Width = 64
            ReadOnly = True
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
    end
    object Panel5: TUniPanel
      Left = 273
      Top = 1
      Width = 534
      Height = 167
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object searchLogDetail: TIQUniGridControl
        Left = 1
        Top = 1
        Width = 532
        Height = 165
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 315
        IQComponents.Grid.Height = 79
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcLog_Detail
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
        IQComponents.Navigator.DataSource = SrcLog_Detail
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 315
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 79
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcLog_Detail
        Columns = <
          item
            FieldName = 'LOG_DATE'
            Title.Caption = 'Log Date'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PROD_DATE'
            Title.Caption = 'Prod Date'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'SHIFT'
            Title.Caption = 'Shift'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'USERID'
            Title.Caption = 'User ID'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'WORKORDER_ID'
            Title.Caption = 'WO #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'FG_LOTNO'
            Title.Caption = 'FG Lot #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'BADGENO'
            Title.Caption = 'Badge #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
    end
  end
  object wwDBComboDlgWorkCenter: TUniEdit
    Left = 20
    Top = 265
    Width = 121
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 1
  end
  object wwDBComboDlgMfg: TUniEdit
    Left = 21
    Top = 289
    Width = 121
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 2
  end
  object pgctrlDetails: TUniPageControl
    Left = 0
    Top = 172
    Width = 807
    Height = 171
    Hint = ''
    ActivePage = TabUDForm
    TabBarVisible = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    OnChange = pgctrlDetailsChange
    object TabNote: TUniTabSheet
      Hint = ''
      Caption = 'Notes'
      object MemoLog_Deltail: TUniDBMemo
        Tag = 1
        Left = 0
        Top = 0
        Width = 799
        Height = 143
        Hint = ''
        DataField = 'LOG_TEXT'
        DataSource = SrcLog_Detail
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
    object TabUDForm: TUniTabSheet
      Hint = ''
      ImageIndex = 1
      Caption = 'User Defined Form'
      object pnlUDFormCarrier: TUniPanel
        Left = 0
        Top = 0
        Width = 799
        Height = 143
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
      end
    end
  end
  object PkWorkCenter: TIQWebHpick
    SQL.Strings = (
      'select id,'
      '       eqno,'
      '       cntr_desc'
      '  from work_center'
      ' where misc.eplant_filter( eplant_id ) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 439
    Top = 193
    object PkWorkCenterID: TFloatField
      FieldName = 'ID'
      Origin = 'WORK_CENTER.ID'
      Visible = False
    end
    object PkWorkCenterEQNO: TStringField
      DisplayLabel = 'Work Center'
      FieldName = 'EQNO'
      Origin = 'WORK_CENTER.EQNO'
      Size = 10
    end
    object PkWorkCenterCNTR_DESC: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'CNTR_DESC'
      Origin = 'IQ.WORK_CENTER.CNTR_DESC'
      FixedChar = True
      Size = 50
    end
  end
  object SrcMachLog: TDataSource
    DataSet = QryMachLog
    Left = 16
    Top = 216
  end
  object SrcLog_Detail: TDataSource
    DataSet = QryLog_Detail
    Left = 68
    Top = 216
  end
  object MainMenu1: TUniMainMenu
    Left = 168
    Top = 192
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = 'Exit'
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
        Caption = 'Printer &Setup'
        OnClick = PrinterSetup1Click
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
  object IQAbout1: TIQWebAbout
    ModuleName = 'Work Center Log'
    Version = 'Feature unsupported'
    ChangeListNumber = '$Change: 189052 $'
    Left = 196
    Top = 192
  end
  object PopupMenu1: TUniPopupMenu
    Left = 308
    Top = 192
    object JumptoBOM1: TUniMenuItem
      Caption = 'Jump to &BOM'
      OnClick = JumptoBOM1Click
    end
    object JumptoWorkCenter1: TUniMenuItem
      Caption = 'Jump to &Work Center'
      OnClick = JumptoWorkCenter1Click
    end
  end
  object IQJumpBOM: TIQWebJump
    DataField = 'STANDARD_ID'
    DataSource = SrcMachLog
    JumpTo = jtBom
    Left = 336
    Top = 192
  end
  object IQJumpWorkCenter: TIQWebJump
    DataField = 'WORK_CENTER_ID'
    DataSource = SrcMachLog
    JumpTo = jtWorkCenter
    Left = 360
    Top = 252
  end
  object QryMachLog: TFDQuery
    BeforePost = QryMachLogBeforePost
    AfterPost = QryMachLogAfterPost
    AfterDelete = ApplyUpdate
    OnNewRecord = QryMachLogNewRecord
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select m.id,'
      '       m.work_center_id,'
      '       m.standard_id,'
      '       c.eqno,'
      '       c.cntr_desc,'
      '       s.mfgno,'
      '       c.eplant_id,'
      '       c.mfg_type'
      '  from machlog m,'
      '       work_center c,'
      '       standard s'
      ' where m.work_center_id = c.id(+)'
      '   and m.standard_id = s.id(+)'
      '   and misc.eplant_filter( c.eplant_id ) = 1'
      '       '
      ' '
      ' ')
    Left = 15
    Top = 240
    object QryMachLogEQNO: TStringField
      DisplayLabel = 'Work Center'
      DisplayWidth = 16
      FieldName = 'EQNO'
      Origin = 'c.eqno'
      Size = 60
    end
    object QryMachLogMFGNO: TStringField
      DisplayLabel = 'Mfg #'
      DisplayWidth = 21
      FieldName = 'MFGNO'
      Origin = 's.mfgno'
      Size = 50
    end
    object QryMachLogCNTR_DESC: TStringField
      DisplayLabel = 'Work Center Description'
      DisplayWidth = 30
      FieldName = 'CNTR_DESC'
      Origin = 'c.CNTR_DESC'
      FixedChar = True
      Size = 250
    end
    object QryMachLogEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'c.eplant_id'
      ReadOnly = True
      Size = 0
    end
    object QryMachLogID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'm.id'
      Visible = False
      Size = 0
    end
    object QryMachLogWORK_CENTER_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'WORK_CENTER_ID'
      Origin = 'm.work_center_id'
      Visible = False
      Size = 0
    end
    object QryMachLogSTANDARD_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'STANDARD_ID'
      Origin = 'm.standard_id'
      Visible = False
      Size = 0
    end
    object QryMachLogMFG_TYPE: TStringField
      FieldName = 'MFG_TYPE'
      Visible = False
      FixedChar = True
      Size = 10
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into machlog'
      '  (ID, WORK_CENTER_ID, STANDARD_ID)'
      'values'
      '  (:ID, :WORK_CENTER_ID, :STANDARD_ID)')
    ModifySQL.Strings = (
      'update machlog'
      'set'
      '  WORK_CENTER_ID = :WORK_CENTER_ID,'
      '  STANDARD_ID = :STANDARD_ID'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from machlog'
      'where'
      '  ID = :OLD_ID')
    Left = 15
    Top = 270
  end
  object PkMfgNo: TIQWebHpick
    SQL.Strings = (
      'select id,'
      '       mfgno,'
      '       mfg_type,'
      '       mfgcell,'
      '       pk_hide'
      '  from standard'
      ' where misc.eplant_filter( eplant_id ) = 1 ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 400
    Top = 192
    object PkMfgNoID: TFloatField
      FieldName = 'ID'
      Origin = 'STANDARD.ID'
      Visible = False
    end
    object PkMfgNoMFGNO: TStringField
      DisplayLabel = 'Mfg #'
      DisplayWidth = 20
      FieldName = 'MFGNO'
      Origin = 'STANDARD.MFGNO'
      Size = 25
    end
    object PkMfgNoMFG_TYPE: TStringField
      DisplayLabel = 'Mfg Type'
      FieldName = 'MFG_TYPE'
      Origin = 'STANDARD.MFG_TYPE'
      Size = 10
    end
    object PkMfgNoMFGCELL: TStringField
      DisplayLabel = 'Mfg Cell'
      DisplayWidth = 10
      FieldName = 'MFGCELL'
      Origin = 'STANDARD.MFGCELL'
      Size = 15
    end
    object PkMfgNoPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.STANDARD.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object QryLog_Detail: TFDQuery
    BeforeInsert = QryLog_DetailBeforeInsert
    AfterInsert = TblLog_DetailAfterInsert
    BeforeEdit = PostParent
    BeforePost = AssignIDBeforePostEx
    AfterPost = ApplyUpdate
    AfterDelete = ApplyUpdate
    OnCalcFields = TblLog_DetailCalcFields
    OnNewRecord = TblLog_DetailNewRecord
    CachedUpdates = True
    MasterSource = SrcMachLog
    MasterFields = 'ID'
    DetailFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateObject = UpdateSQLLogDetail
    SQL.Strings = (
      'select id,'
      '       machlog_id,'
      '       log_date,'
      '       prod_date,'
      '       shift,'
      '       userid,'
      '       log_text,'
      '       illum_rt_id,'
      '       workorder_id,'
      '       fg_lotno,'
      '       badgeno'
      '  from log_detail'
      ' where machlog_id = :id'
      '')
    Left = 68
    Top = 244
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 20000c
      end>
    object QryLog_DetailID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      Visible = False
      Size = 0
    end
    object QryLog_DetailMACHLOG_ID: TBCDField
      FieldName = 'MACHLOG_ID'
      Visible = False
      Size = 0
    end
    object QryLog_DetailLOG_DATE: TDateTimeField
      DisplayLabel = 'Log Date'
      DisplayWidth = 18
      FieldName = 'LOG_DATE'
      Origin = 'LOG_DATE'
    end
    object QryLog_DetailPROD_DATE: TDateTimeField
      DisplayLabel = 'Prod Date'
      DisplayWidth = 18
      FieldName = 'PROD_DATE'
      Origin = 'PROD_DATE'
    end
    object QryLog_DetailSHIFT: TBCDField
      DisplayLabel = 'Shift'
      DisplayWidth = 10
      FieldName = 'SHIFT'
      Origin = 'SHIFT'
      Size = 0
    end
    object QryLog_DetailUSERID: TStringField
      DisplayLabel = 'User ID'
      DisplayWidth = 12
      FieldName = 'USERID'
      Origin = 'USERID'
      Size = 35
    end
    object QryLog_DetailMfg_Type: TStringField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Mfg_Type'
      Size = 10
      Calculated = True
    end
    object QryLog_DetailLOG_TEXT: TStringField
      DisplayWidth = 10
      FieldName = 'LOG_TEXT'
      Size = 2000
    end
    object QryLog_DetailILLUM_RT_ID: TBCDField
      DisplayWidth = 11
      FieldName = 'ILLUM_RT_ID'
      Size = 0
    end
    object QryLog_DetailWORKORDER_ID: TBCDField
      DisplayLabel = 'WO #'
      DisplayWidth = 10
      FieldName = 'WORKORDER_ID'
      Origin = 'WORKORDER_ID'
      Size = 0
    end
    object QryLog_DetailFG_LOTNO: TStringField
      DisplayLabel = 'FG Lot #'
      DisplayWidth = 25
      FieldName = 'FG_LOTNO'
      Origin = 'FG_LOTNO'
      Size = 25
    end
    object QryLog_DetailBADGENO: TStringField
      FieldName = 'BADGENO'
      Origin = 'BADGENO'
      Size = 25
    end
  end
  object UpdateSQLLogDetail: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into log_detail'
      
        '  (ID, MACHLOG_ID, LOG_DATE, PROD_DATE, SHIFT, USERID, LOG_TEXT,' +
        ' '
      'ILLUM_RT_ID, '
      '   WORKORDER_ID, FG_LOTNO, BADGENO)'
      'values'
      
        '  (:ID, :MACHLOG_ID, :LOG_DATE, :PROD_DATE, :SHIFT, :USERID, :LO' +
        'G_TEXT, '
      '   :ILLUM_RT_ID, :WORKORDER_ID, :FG_LOTNO, :BADGENO)')
    ModifySQL.Strings = (
      'update log_detail'
      'set'
      '  ID = :ID,'
      '  MACHLOG_ID = :MACHLOG_ID,'
      '  LOG_DATE = :LOG_DATE,'
      '  PROD_DATE = :PROD_DATE,'
      '  SHIFT = :SHIFT,'
      '  USERID = :USERID,'
      '  LOG_TEXT = :LOG_TEXT,'
      '  ILLUM_RT_ID = :ILLUM_RT_ID,'
      '  WORKORDER_ID = :WORKORDER_ID,'
      '  FG_LOTNO = :FG_LOTNO,'
      '  BADGENO = :BADGENO'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from log_detail'
      'where'
      '  ID = :OLD_ID')
    Left = 68
    Top = 272
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'IQCenterLog'
    WebUse = False
    TouchScreen = False
    Left = 236
    Top = 200
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 200
    Top = 264
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'navMachLog'
      'navLog_Detail'
      'gridMachLog'
      'gridLog_Detail'
      'memoLog_Deltail'
      'Print1'
      'PrinterSetup1'
      'JumpToBOM1'
      'QryMachLogEQNO'
      'QryMachLogMFGNO'
      'QryMachLogCNTR_DESC'
      'QryMachLogEPLANT_ID'
      'QryMachLogID'
      'QryMachLogWORK_CENTER_ID'
      'QryMachLogSTANDARD_ID'
      'QryMachLogMFG_TYPE'
      'QryLog_DetailLOG_DATE'
      'QryLog_DetailPROD_DATE'
      'QryLog_DetailSHIFT'
      'QryLog_DetailUSERID'
      'QryLog_DetailWORKORDER_ID'
      'QryLog_DetailFG_LOTNO'
      'QryLog_DetailBADGENO')
    SecurityCode = 'IQCENTERLOG'
    Left = 584
    Top = 240
  end
end
