object FrmSndRunsBest: TFrmSndRunsBest
  Left = 208
  Top = 221
  ClientHeight = 375
  ClientWidth = 588
  Caption = 'Runs the best'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 185
    Width = 588
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 334
    Width = 588
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel4: TUniPanel
      Left = 457
      Top = 1
      Width = 131
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnLog: TUniButton
        Left = 4
        Top = 7
        Width = 120
        Height = 25
        Hint = ''
        Caption = 'Work Center Log'
        TabOrder = 1
        OnClick = btnLogClick
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 188
    Width = 588
    Height = 146
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitTop = 190
    object DBChart1: TDBChart
      Left = 0
      Top = 0
      Width = 588
      Height = 146
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
      PrintMargins = (
        15
        41
        15
        41)
      ColorPaletteIndex = 0
      object Series1: TBarSeries
        Marks.Style = smsValue
        DataSource = QryRunsBest
        XLabelsSource = 'EQNO_ACT'
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
        YValues.ValueSource = 'PERFORMANCE'
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 588
    Height = 185
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    object IQSearch1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 586
      Height = 183
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 369
      IQComponents.Grid.Height = 97
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcRunsBest
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
      IQComponents.Navigator.DataSource = SrcRunsBest
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 369
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 97
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcRunsBest
      Columns = <
        item
          FieldName = 'SEQ'
          Title.Caption = '#'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EQNO_ACT'
          Title.Caption = 'Work Center'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CNTR_DESC_ACT'
          Title.Caption = 'Work Center Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CNTR_TYPE'
          Title.Caption = 'Type'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PERFORMANCE'
          Title.Caption = 'Perform %'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'COMMENT1'
          Title.Caption = 'Comment'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
      object wwDBLookupComboWorkCenter: TUniDBLookupComboBox
        Left = 148
        Top = 73
        Width = 121
        Height = 21
        Hint = ''
        Visible = False
        ListOnlyMode = lmFollowSource
        ListField = 'EQNO;CNTR_DESC;CNTR_TYPE;EPLANT_ID'
        ListSource = SrcWorkCenter
        KeyField = 'EQNO'
        ListFieldIndex = 0
        TabOrder = 2
        Color = clWindow
        OnDropDown = wwDBLookupComboWorkCenterDropDown
      end
    end
  end
  object SrcRunsBest: TDataSource
    DataSet = QryRunsBest
    Left = 63
    Top = 201
  end
  object QryRunsBest: TFDQuery
    AfterPost = ApplyUpdates
    AfterDelete = ApplyUpdates
    OnNewRecord = QryRunsBestNewRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select r.id,'
      '       r.work_center_id_act,'
      '       r.work_center_id_calc,'
      '       r.sndop_id,'
      '       r.seq,'
      '       r.performance,'
      '       w1.eqno as eqno_calc,'
      '       w1.cntr_desc as cntr_desc_calc,'
      '       w2.cntr_type,'
      '       w2.eqno as eqno_act,'
      '       w2.cntr_desc as cntr_desc_act,'
      '       r.comment1'
      '  from sndop_runs_best r,'
      '       work_center w1,'
      '       work_center w2'
      ' where r.sndop_id = :sndop_id'
      '   and r.work_center_id_calc = w1.id(+)'
      '   and r.work_center_id_act  = w2.id(+)'
      ' ')
    Left = 71
    Top = 98
    ParamData = <
      item
        Name = 'sndop_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryRunsBestSEQ: TBCDField
      DisplayLabel = '#'
      DisplayWidth = 4
      FieldName = 'SEQ'
      Origin = 'r.seq'
      Required = True
      Size = 0
    end
    object QryRunsBestEQNO_ACT: TStringField
      DisplayLabel = 'Work Center'
      DisplayWidth = 17
      FieldName = 'EQNO_ACT'
      Origin = 'w2.eqno'
      Required = True
      FixedChar = True
      Size = 60
    end
    object QryRunsBestCNTR_DESC_ACT: TStringField
      DisplayLabel = 'Work Center Description'
      DisplayWidth = 21
      FieldName = 'CNTR_DESC_ACT'
      Origin = 'w2.cntr_desc'
      FixedChar = True
      Size = 250
    end
    object QryRunsBestCNTR_TYPE: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 9
      FieldName = 'CNTR_TYPE'
      Origin = 'w1.cntr_type'
      ReadOnly = True
      FixedChar = True
    end
    object QryRunsBestPERFORMANCE: TBCDField
      DisplayLabel = 'Perform %'
      DisplayWidth = 10
      FieldName = 'PERFORMANCE'
      Origin = 'r.performance'
      Size = 2
    end
    object QryRunsBestCOMMENT1: TStringField
      DisplayLabel = 'Comment'
      DisplayWidth = 48
      FieldName = 'COMMENT1'
      Origin = 'r.comment1'
      Size = 60
    end
    object QryRunsBestSNDOP_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SNDOP_ID'
      Visible = False
      Size = 0
    end
    object QryRunsBestEQNO_CALC: TStringField
      DisplayLabel = 'Calculated Work Center'
      DisplayWidth = 20
      FieldName = 'EQNO_CALC'
      Origin = 'w1.eqno'
      ReadOnly = True
      Visible = False
      FixedChar = True
      Size = 60
    end
    object QryRunsBestCNTR_DESC_CALC: TStringField
      DisplayLabel = 'Calculated Description'
      DisplayWidth = 19
      FieldName = 'CNTR_DESC_CALC'
      Origin = 'w1.cntr_desc'
      ReadOnly = True
      Visible = False
      FixedChar = True
      Size = 250
    end
    object QryRunsBestID: TBCDField
      DisplayWidth = 5
      FieldName = 'ID'
      Origin = 'r.id'
      Visible = False
      Size = 0
    end
    object QryRunsBestWORK_CENTER_ID_CALC: TBCDField
      DisplayWidth = 10
      FieldName = 'WORK_CENTER_ID_CALC'
      Origin = 'r.work_center_id_calc'
      Visible = False
      Size = 0
    end
    object QryRunsBestWORK_CENTER_ID_ACT: TBCDField
      DisplayLabel = 'Act Work Center ID'
      DisplayWidth = 10
      FieldName = 'WORK_CENTER_ID_ACT'
      Required = True
      Visible = False
      Size = 0
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into sndop_runs_best'
      
        '  (ID, WORK_CENTER_ID_ACT, WORK_CENTER_ID_CALC, SNDOP_ID, SEQ, P' +
        'ERFORMANCE, '
      '   COMMENT1)'
      'values'
      
        '  (:ID, :WORK_CENTER_ID_ACT, :WORK_CENTER_ID_CALC, :SNDOP_ID, :S' +
        'EQ, :PERFORMANCE, '
      '   :COMMENT1)')
    ModifySQL.Strings = (
      'update sndop_runs_best'
      'set'
      '  ID = :ID,'
      '  WORK_CENTER_ID_ACT = :WORK_CENTER_ID_ACT,'
      '  WORK_CENTER_ID_CALC = :WORK_CENTER_ID_CALC,'
      '  SNDOP_ID = :SNDOP_ID,'
      '  SEQ = :SEQ,'
      '  PERFORMANCE = :PERFORMANCE,'
      '  COMMENT1 = :COMMENT1'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from sndop_runs_best'
      'where'
      '  ID = :OLD_ID')
    Left = 71
    Top = 128
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
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmSndRunsBest'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 190706 $'
    BuildVersion = '176554'
    Left = 374
    Top = 94
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
      '   and mfg.lookup_mfgtype(mfg_type) in ('#39'ASSY1'#39', '#39'ASSY2'#39')'
      ' order by '
      '       eqno'
      ' '
      ' ')
    Left = 105
    Top = 96
    object wwQryWorkCenterEQNO: TStringField
      DisplayLabel = 'Work Center'
      DisplayWidth = 12
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
  object SrcWorkCenter: TDataSource
    DataSet = wwQryWorkCenter
    Left = 136
    Top = 200
  end
end
