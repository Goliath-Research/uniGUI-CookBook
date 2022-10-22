object FrmRunsTheBest: TFrmRunsTheBest
  Left = 182
  Top = 143
  HelpContext = 1167945
  ClientHeight = 484
  ClientWidth = 967
  Caption = 'Runs The Best'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 207
    Width = 967
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 445
    Width = 967
    Height = 39
    Hint = ''
    ShowHint = True
    ParentShowHint = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Label1: TUniLabel
      Left = 9
      Top = 12
      Width = 50
      Height = 13
      Hint = ''
      ShowHint = True
      Caption = 'From Date'
      TabOrder = 3
    end
    object Panel2: TUniPanel
      Left = 611
      Top = 1
      Width = 356
      Height = 37
      Hint = ''
      ShowHint = True
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnCopy: TUniButton
        Left = 129
        Top = 6
        Width = 97
        Height = 25
        Hint = ''
        ShowHint = True
        Caption = 'Copy'
        TabOrder = 1
        OnClick = btnCopyClick
      end
      object btnLog: TUniButton
        Left = 229
        Top = 6
        Width = 120
        Height = 25
        Hint = ''
        ShowHint = True
        Caption = 'Work Center Log'
        TabOrder = 2
        OnClick = btnLogClick
      end
      object btnRecalc: TIQWebDropDownButton
        Left = 4
        Top = 6
        Width = 120
        Height = 25
        Hint = ''
        ShowHint = True
        OnClick = btnRecalcClick
        AssociatedPopupMenu = PopupMenu1
        Flat = False
        Caption = 'Calculate'
      end
    end
    object wwdbTmPkFromDate: TUniDBDateTimePicker
      Left = 72
      Top = 8
      Width = 89
      Height = 21
      Hint = 'Start prod date used in calculations'
      ShowHint = True
      DateTime = 42653.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 1
    end
  end
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 967
    Height = 207
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 750
    IQComponents.Grid.Height = 121
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = wwSrcRuns_Best
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
    IQComponents.Navigator.DataSource = wwSrcRuns_Best
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 750
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 121
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = wwSrcRuns_Best
    Columns = <
      item
        FieldName = 'SEQ'
        Title.Caption = '#'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EQNO_CALC'
        Title.Caption = 'Calculated Work Center'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CNTR_DESC_CALC'
        Title.Caption = 'Calculated Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CNTR_TYPE'
        Title.Caption = 'Type'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CAPACITY'
        Title.Caption = 'Capacity'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PERFORMANCE'
        Title.Caption = 'Perform %'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EQNO_Act'
        Title.Caption = 'Actual Work Center'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CNTR_DESC_ACT'
        Title.Caption = 'Actual Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'COMMENT1'
        Title.Caption = 'Comment'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EXCLUDE_AUTOLOAD'
        Title.Caption = 'Do Not Autoload'
        Width = 64
        CheckBoxField.FieldValues = 'Y;N'
      end>
    Marker = 0
    object wwDBLookupComboWorkCenter: TUniDBLookupComboBox
      Left = 148
      Top = 73
      Width = 121
      Height = 21
      Hint = ''
      ListOnlyMode = lmFollowSource
      ListField = 'EQNO;CNTR_DESC'
      ListSource = SrcWorkCenter
      KeyField = 'EQNO'
      ListFieldIndex = 0
      TabOrder = 2
      Color = clWindow
      OnDropDown = wwDBLookupComboWorkCenterDropDown
    end
  end
  object PageControl1: TUniPageControl
    Left = 0
    Top = 210
    Width = 967
    Height = 235
    Hint = ''
    ActivePage = tabGraph
    TabBarVisible = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    OnChange = PageControl1Change
    object tabGraph: TUniTabSheet
      Hint = ''
      Caption = 'Graph'
      object Panel4: TUniPanel
        Left = 0
        Top = 0
        Width = 959
        Height = 207
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object DBChart1: TDBChart
          Left = 0
          Top = 0
          Width = 959
          Height = 207
          BackWall.Brush.Style = bsClear
          BackWall.Brush.Gradient.Direction = gdBottomTop
          BackWall.Brush.Gradient.EndColor = clWhite
          BackWall.Brush.Gradient.StartColor = 15395562
          BackWall.Brush.Gradient.Visible = True
          BackWall.Transparent = False
          BottomWall.Color = 8421440
          Foot.Font.Color = clBlue
          Foot.Font.Name = 'Verdana'
          Gradient.Direction = gdBottomTop
          Gradient.EndColor = clWhite
          Gradient.MidColor = 15395562
          Gradient.StartColor = 15395562
          Gradient.Visible = True
          LeftWall.Color = 8421440
          RightWall.Color = 14745599
          SubFoot.Font.Name = 'Verdana'
          SubTitle.Font.Name = 'Verdana'
          Title.Font.Name = 'Verdana'
          Title.Text.Strings = (
            'TDBChart')
          Title.Visible = False
          BottomAxis.Axis.Color = 4210752
          BottomAxis.Grid.Color = 11119017
          BottomAxis.LabelsFormat.Font.Name = 'Verdana'
          BottomAxis.TicksInner.Color = 11119017
          BottomAxis.Title.Font.Name = 'Verdana'
          DepthAxis.Axis.Color = 4210752
          DepthAxis.Grid.Color = 11119017
          DepthAxis.LabelsFormat.Font.Name = 'Verdana'
          DepthAxis.TicksInner.Color = 11119017
          DepthAxis.Title.Font.Name = 'Verdana'
          DepthTopAxis.Axis.Color = 4210752
          DepthTopAxis.Grid.Color = 11119017
          DepthTopAxis.LabelsFormat.Font.Name = 'Verdana'
          DepthTopAxis.TicksInner.Color = 11119017
          DepthTopAxis.Title.Font.Name = 'Verdana'
          LeftAxis.Axis.Color = 4210752
          LeftAxis.Grid.Color = 11119017
          LeftAxis.LabelsFormat.Font.Name = 'Verdana'
          LeftAxis.TicksInner.Color = 11119017
          LeftAxis.Title.Font.Name = 'Verdana'
          Legend.Font.Name = 'Verdana'
          Legend.Shadow.Transparency = 0
          Legend.Visible = False
          RightAxis.Axis.Color = 4210752
          RightAxis.Grid.Color = 11119017
          RightAxis.LabelsFormat.Font.Name = 'Verdana'
          RightAxis.TicksInner.Color = 11119017
          RightAxis.Title.Font.Name = 'Verdana'
          TopAxis.Axis.Color = 4210752
          TopAxis.Grid.Color = 11119017
          TopAxis.LabelsFormat.Font.Name = 'Verdana'
          TopAxis.TicksInner.Color = 11119017
          TopAxis.Title.Font.Name = 'Verdana'
          Align = alClient
          BevelOuter = bvNone
          Color = clSilver
          TabOrder = 1
          DefaultCanvas = 'TGDIPlusCanvas'
          ColorPaletteIndex = 13
          object Series1: TBarSeries
            Marks.Style = smsValue
            DataSource = wwQryRuns_Best
            XLabelsSource = 'EQNO_ACT'
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            YValues.ValueSource = 'PERFORMANCE'
          end
        end
      end
    end
    object tabUDForm: TUniTabSheet
      Hint = ''
      ImageIndex = 1
      Caption = 'UD Form'
      object IQUDEmbeddedForm1: TIQWebUDEmbeddedForm
        Left = 0
        Top = 0
        Width = 959
        Height = 207
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        Active = False
        DataField = 'ID'
        DataSource = wwSrcRuns_Best
        Source = 'RUNS_BEST'
        TableName = 'RUNS_BEST'
        SecurityRegister = SecurityRegister1
        BevelOuter = bvNone
        BevelInner = bvNone
      end
    end
  end
  object procCalc_Mfg_Performance: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    StoredProcName = 'IQMS.PROD_REP.CALC_MFG_PERFORMANCE'
    Left = 304
    Top = 92
    ParamData = <
      item
        Name = 'V_STANDARD_ID'
        DataType = ftFMTBcd
        ParamType = ptInput
      end>
  end
  object PopupMenu1: TUniPopupMenu
    Left = 400
    Top = 93
    object RecalcthisBOM1: TUniMenuItem
      Caption = 'Recalc this BOM'
      OnClick = btnRecalcClick
    end
    object RecalcRollAllBOMs1: TUniMenuItem
      Caption = 'Recalc && Roll All BOMs'
      OnClick = RecalcRollAllBOMs1Click
    end
    object RecalcRollAllBOMsSetFromDate1: TUniMenuItem
      Caption = 'Recalc && Roll All BOMs - Set '#39'From Date'#39
      OnClick = RecalcRollAllBOMsSetFromDate1Click
    end
  end
  object QryMfgs: TFDQuery
    Tag = 1
    BeforeOpen = QryMfgsBeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, mfgno, eplant_id'
      '  from standard'
      ' where   '
      '      ( :mfgcell_id = 0 '
      '       or'
      '        :mfgcell_id > 0 and standard.mfgcell_id = :mfgcell_id )'
      '  and nvl(pk_hide, '#39'N'#39') <> '#39'Y'#39
      ' order by mfgno')
    Left = 368
    Top = 93
    ParamData = <
      item
        Name = 'mfgcell_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryMfgsID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.STANDARD.ID'
      Size = 0
    end
    object QryMfgsMFGNO: TStringField
      FieldName = 'MFGNO'
      Origin = 'IQ.STANDARD.MFGNO'
      Size = 50
    end
    object QryMfgsEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'IQ.STANDARD.EPLANT_ID'
      Size = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 337
    Top = 93
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
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
    ModuleName = 'FrmRunsTheBest'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 191367 $'
    BuildVersion = '176554'
    Left = 432
    Top = 92
  end
  object wwSrcRuns_Best: TDataSource
    DataSet = wwQryRuns_Best
    Left = 71
    Top = 81
  end
  object wwQryRuns_Best: TFDQuery
    BeforeOpen = AssignEplantFilter
    BeforeEdit = PostParentsBeforeEdit
    BeforePost = wwQryRuns_BestBeforePost
    AfterPost = wwQryRuns_BestAfterPost
    BeforeDelete = wwQryRuns_BestBeforeDelete
    AfterDelete = wwQryRuns_BestAfterPost
    OnNewRecord = wwQryRuns_BestNewRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select r.id,'
      '       r.work_center_id_act,'
      '       r.work_center_id_calc,'
      '       r.standard_id,'
      '       r.seq,'
      '       r.performance,'
      '       w1.eqno as eqno_calc,'
      '       w1.cntr_desc as cntr_desc_calc,'
      '       w1.capacity,'
      '       w1.cntr_type,'
      '       -- w2.eqno as eqno_act,'
      '       w2.cntr_desc as cntr_desc_act,'
      '       r.comment1,'
      '       r.exclude_autoload'
      '  from runs_best r,'
      '       work_center w1,'
      '       work_center w2'
      ' where r.standard_id = :id'
      '   and r.work_center_id_calc = w1.id(+)'
      '   and r.work_center_id_act  = w2.id(+)'
      ' ')
    Left = 70
    Top = 103
    ParamData = <
      item
        Name = 'id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object wwQryRuns_BestSEQ: TBCDField
      DisplayLabel = '#'
      DisplayWidth = 4
      FieldName = 'SEQ'
      Origin = 'r.seq'
      Required = True
      Size = 0
    end
    object wwQryRuns_BestEQNO_CALC: TStringField
      DisplayLabel = 'Calculated Work Center'
      DisplayWidth = 20
      FieldName = 'EQNO_CALC'
      Origin = 'w1.eqno'
      ReadOnly = True
      FixedChar = True
      Size = 60
    end
    object wwQryRuns_BestCNTR_DESC_CALC: TStringField
      DisplayLabel = 'Calculated Description'
      DisplayWidth = 19
      FieldName = 'CNTR_DESC_CALC'
      Origin = 'w1.cntr_desc'
      ReadOnly = True
      FixedChar = True
      Size = 250
    end
    object wwQryRuns_BestCNTR_TYPE: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 9
      FieldName = 'CNTR_TYPE'
      Origin = 'w1.cntr_type'
      ReadOnly = True
      FixedChar = True
    end
    object wwQryRuns_BestCAPACITY: TBCDField
      DisplayLabel = 'Capacity'
      DisplayWidth = 10
      FieldName = 'CAPACITY'
      Origin = 'w1.capacity'
      ReadOnly = True
      Size = 2
    end
    object wwQryRuns_BestPERFORMANCE: TBCDField
      DisplayLabel = 'Perform %'
      DisplayWidth = 10
      FieldName = 'PERFORMANCE'
      Origin = 'r.performance'
      ReadOnly = True
      Size = 2
    end
    object wwQryRuns_BestEQNO_ACT: TStringField
      DisplayLabel = 'Actual Work Center'
      DisplayWidth = 17
      FieldKind = fkLookup
      FieldName = 'EQNO_Act'
      LookupDataSet = wwQryWorkCenter
      LookupKeyFields = 'ID'
      LookupResultField = 'EQNO'
      KeyFields = 'WORK_CENTER_ID_ACT'
      Origin = 'w2.eqno'
      Required = True
      FixedChar = True
      Size = 60
      Lookup = True
    end
    object wwQryRuns_BestCNTR_DESC_ACT: TStringField
      DisplayLabel = 'Actual Description'
      DisplayWidth = 19
      FieldName = 'CNTR_DESC_ACT'
      Origin = 'w2.cntr_desc'
      FixedChar = True
      Size = 250
    end
    object wwQryRuns_BestCOMMENT1: TStringField
      DisplayLabel = 'Comment'
      DisplayWidth = 48
      FieldName = 'COMMENT1'
      Origin = 'r.comment1'
      Size = 60
    end
    object wwQryRuns_BestEXCLUDE_AUTOLOAD: TStringField
      DisplayLabel = 'Do Not Autoload'
      DisplayWidth = 16
      FieldName = 'EXCLUDE_AUTOLOAD'
      Origin = 'r.exclude_autoload'
      Size = 1
    end
    object wwQryRuns_BestID: TBCDField
      DisplayWidth = 5
      FieldName = 'ID'
      Origin = 'r.id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object wwQryRuns_BestWORK_CENTER_ID_CALC: TBCDField
      DisplayWidth = 10
      FieldName = 'WORK_CENTER_ID_CALC'
      Origin = 'r.work_center_id_calc'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object wwQryRuns_BestSTANDARD_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'STANDARD_ID'
      Visible = False
      Size = 0
    end
    object wwQryRuns_BestWORK_CENTER_ID_ACT: TBCDField
      DisplayLabel = 'Act Work Center ID'
      DisplayWidth = 10
      FieldName = 'WORK_CENTER_ID_ACT'
      Required = True
      Visible = False
      Size = 0
    end
  end
  object wwQryWorkCenter: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       eqno,'
      '       cntr_desc,'
      '       cntr_type,'
      '       capacity,'
      '       eplant_id'
      '  from work_center'
      ' where misc.eplant_filter( eplant_id ) = 1'
      '   and nvl(pk_hide, '#39'N'#39') <> '#39'Y'#39
      ' order by '
      '       eqno'
      ' '
      ' ')
    Left = 104
    Top = 104
    object wwQryWorkCenterEQNO: TStringField
      DisplayLabel = 'Work Center'
      DisplayWidth = 10
      FieldName = 'EQNO'
      Origin = 'IQ.WORK_CENTER.EQNO'
      FixedChar = True
      Size = 60
    end
    object wwQryWorkCenterCNTR_DESC: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'CNTR_DESC'
      Origin = 'IQ.WORK_CENTER.CNTR_DESC'
      FixedChar = True
      Size = 250
    end
    object wwQryWorkCenterCNTR_TYPE: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 15
      FieldName = 'CNTR_TYPE'
      Origin = 'IQ.WORK_CENTER.CNTR_TYPE'
      FixedChar = True
    end
    object wwQryWorkCenterCAPACITY: TBCDField
      DisplayLabel = 'Capacity'
      DisplayWidth = 10
      FieldName = 'CAPACITY'
      Origin = 'IQ.WORK_CENTER.CAPACITY'
      Size = 2
    end
    object wwQryWorkCenterEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'IQ.WORK_CENTER.EPLANT_ID'
      Size = 0
    end
    object wwQryWorkCenterID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.WORK_CENTER.ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into runs_best'
      
        '  (ID, WORK_CENTER_ID_ACT, STANDARD_ID, SEQ, COMMENT1, EXCLUDE_A' +
        'UTOLOAD)'
      'values'
      
        '  (:ID, :WORK_CENTER_ID_ACT, :STANDARD_ID, :SEQ, :COMMENT1, :EXC' +
        'LUDE_AUTOLOAD)')
    ModifySQL.Strings = (
      'update runs_best'
      'set'
      '  ID = :ID,'
      '  WORK_CENTER_ID_ACT = :WORK_CENTER_ID_ACT,'
      '  STANDARD_ID = :STANDARD_ID,'
      '  SEQ = :SEQ,'
      '  COMMENT1 = :COMMENT1,'
      '  EXCLUDE_AUTOLOAD = :EXCLUDE_AUTOLOAD'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from runs_best'
      'where'
      '  ID = :OLD_ID')
    Left = 71
    Top = 134
  end
  object SecurityRegister1: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'btnRecalc'
      'btnCopy'
      'btnLog'
      'wwQryRuns_Best'
      'RecalcThisBOM1'
      'RecalcRollAllBOMs1')
    SecurityCode = 'FRMRUNSTHEBEST'
    Left = 465
    Top = 92
  end
  object SrcLocalStandard: TDataSource
    DataSet = TblLocalStandard
    Left = 224
    Top = 102
  end
  object TblLocalStandard: TFDTable
    Tag = 1
    IndexName = 'PK_STANDARD'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'STANDARD'
    TableName = 'STANDARD'
    Left = 224
    Top = 125
  end
  object SrcWorkCenter: TDataSource
    DataSet = wwQryWorkCenter
    Left = 160
    Top = 160
  end
end
