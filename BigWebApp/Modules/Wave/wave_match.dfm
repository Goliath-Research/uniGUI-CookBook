object FrmWaveMatch: TFrmWaveMatch
  Left = 0
  Top = 0
  ClientHeight = 284
  ClientWidth = 691
  Caption = 'Hierarchy for Matching SO Releases'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 467
    Top = 0
    Width = 4
    Height = 284
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 467
    Height = 284
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 1
      Top = 29
      Width = 465
      Height = 28
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
    end
    object wwDBGrid1: TIQUniGridControl
      Left = 1
      Top = 57
      Width = 465
      Height = 226
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 248
      IQComponents.Grid.Height = 140
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcWaveMatch
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
      IQComponents.Navigator.DataSource = SrcWaveMatch
      IQComponents.Navigator.VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.Navigator.BeforeAction = CheckRefresh
      IQComponents.HiddenPanel.Left = 248
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 140
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcWaveMatch
      Columns = <
        item
          FieldName = 'SEQ'
          Title.Caption = 'Seq #'
          Width = 49
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Match Description'
          Width = 441
          CheckBoxField.FieldValues = 'true;false'
        end>
      ExplicitLeft = 0
      ExplicitTop = 63
      Marker = 0
    end
    object Panel13: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 465
      Height = 28
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Alignment = taLeftJustify
      Caption = '  Matching Hierarchy'
      Color = clWindow
    end
  end
  object Panel3: TUniPanel
    Left = 471
    Top = 0
    Width = 220
    Height = 284
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel4: TUniPanel
      Left = 1
      Top = 29
      Width = 218
      Height = 28
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
    end
    object wwDBGrid2: TIQUniGridControl
      Left = 1
      Top = 57
      Width = 218
      Height = 226
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 1
      IQComponents.Grid.Height = 140
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcWaveMatchDtl
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
      IQComponents.Navigator.DataSource = SrcWaveMatchDtl
      IQComponents.Navigator.VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.Navigator.BeforeAction = CheckRefresh
      IQComponents.HiddenPanel.Left = 1
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 140
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcWaveMatchDtl
      Columns = <
        item
          FieldName = 'CRITERIA'
          Title.Caption = 'Criteria Name'
          Width = 210
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
    object Panel5: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 218
      Height = 28
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Alignment = taLeftJustify
      Caption = '  Criteria List'
      Color = clWindow
    end
    object wwDBComboBoxCriteriaName: TUniDBComboBox
      Left = 20
      Top = 116
      Width = 157
      Height = 21
      Hint = ''
      Visible = False
      Style = csDropDownList
      Items.Strings = (
        'Customer'#9'arcusto_id'
        'Ship To'#9'ship_to_id'
        'Division'#9'division_id'
        'Ship Via'#9'freight_id'
        'EPlant'#9'eplant_id'
        'Salesperson'#9'salespeople_id'
        'CSR'#9'pr_emp_id'
        'Must Ship Date'#9'must_ship_date'
        'Must Ship Date & Time'#9'must_ship_date_time')
      TabOrder = 3
    end
  end
  object SrcWaveMatch: TDataSource
    DataSet = QryWaveMatch
    Left = 44
    Top = 104
  end
  object SrcWaveMatchDtl: TDataSource
    DataSet = QryWaveMatchDtl
    Left = 81
    Top = 104
  end
  object QryWaveMatch: TFDQuery
    BeforePost = QryWaveMatchBeforePost
    AfterPost = ApplyUpdates
    AfterDelete = ApplyUpdates
    OnNewRecord = QryWaveMatchNewRecord
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    UpdateObject = UpdateSQLMatch
    SQL.Strings = (
      'select id,'
      '       seq,'
      '       descrip'
      '  from wave_match       '
      ' order by seq')
    Left = 44
    Top = 136
    object QryWaveMatchSEQ: TBCDField
      DisplayLabel = 'Seq #'
      DisplayWidth = 7
      FieldName = 'SEQ'
      Origin = 'IQ.WAVE_MATCH.SEQ'
      Size = 0
    end
    object QryWaveMatchDESCRIP: TStringField
      DisplayLabel = 'Match Description'
      DisplayWidth = 63
      FieldName = 'DESCRIP'
      Origin = 'IQ.WAVE_MATCH.DESCRIP'
      Size = 100
    end
    object QryWaveMatchID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.WAVE_MATCH.ID'
      Visible = False
      Size = 0
    end
  end
  object QryWaveMatchDtl: TFDQuery
    BeforeInsert = PostParentBeforeEdit
    BeforeEdit = PostParentBeforeEdit
    BeforePost = QryWaveMatchDtlBeforePost
    AfterPost = ApplyUpdates
    AfterDelete = ApplyUpdates
    OnNewRecord = QryWaveMatchDtlNewRecord
    CachedUpdates = True
    MasterSource = SrcWaveMatch
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateObject = UpdateSQLDetail
    SQL.Strings = (
      'select id,'
      '       wave_match_id,'
      '       criteria'
      '  from wave_match_dtl       '
      ' where wave_match_id = :id'
      ' order by id')
    Left = 81
    Top = 136
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 1050000c
      end>
    object QryWaveMatchDtlCRITERIA: TStringField
      DisplayLabel = 'Criteria Name'
      DisplayWidth = 30
      FieldName = 'CRITERIA'
      Origin = 'IQ.WAVE_MATCH_DTL.CRITERIA'
      Size = 30
    end
    object QryWaveMatchDtlID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.WAVE_MATCH_DTL.ID'
      Visible = False
      Size = 0
    end
    object QryWaveMatchDtlWAVE_MATCH_ID: TBCDField
      FieldName = 'WAVE_MATCH_ID'
      Origin = 'IQ.WAVE_MATCH_DTL.WAVE_MATCH_ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQLMatch: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into wave_match'
      '  (ID, SEQ, DESCRIP)'
      'values'
      '  (:ID, :SEQ, :DESCRIP)')
    ModifySQL.Strings = (
      'update wave_match'
      'set'
      '  ID = :ID,'
      '  SEQ = :SEQ,'
      '  DESCRIP = :DESCRIP'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from wave_match'
      'where'
      '  ID = :OLD_ID')
    Left = 44
    Top = 172
  end
  object UpdateSQLDetail: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into wave_match_dtl'
      '  (ID, WAVE_MATCH_ID, CRITERIA)'
      'values'
      '  (:ID, :WAVE_MATCH_ID, :CRITERIA)')
    ModifySQL.Strings = (
      'update wave_match_dtl'
      'set'
      '  ID = :ID,'
      '  WAVE_MATCH_ID = :WAVE_MATCH_ID,'
      '  CRITERIA = :CRITERIA'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from wave_match_dtl'
      'where'
      '  ID = :OLD_ID')
    Left = 82
    Top = 171
  end
end
