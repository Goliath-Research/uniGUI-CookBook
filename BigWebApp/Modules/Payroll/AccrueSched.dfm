object FrmAccrueShed: TFrmAccrueShed
  Left = 78
  Top = 155
  HelpContext = 9814
  ClientHeight = 385
  ClientWidth = 492
  Caption = 'Accrue Schedule'
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
    Top = 126
    Width = 492
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
    ExplicitTop = 153
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 492
    Height = 126
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    ExplicitTop = 27
    object IQSearchHdr: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 490
      Height = 124
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 273
      IQComponents.Grid.Height = 38
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
      IQComponents.HiddenPanel.Left = 273
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 38
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
          FieldName = 'DESCRIP'
          Title.Caption = 'Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'NUM_OF_DAYS_TO_NEXT_EVAL'
          Title.Caption = 'Num of Days to Next Evaluation'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'HRS_PER_DAY'
          Title.Caption = 'Hrs. allocated per day'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DATE_FIELD'
          Title.Caption = 'Date Field'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      ExplicitLeft = -1
      Marker = 0
      object dbDateField: TUniEdit
        Left = 304
        Top = 48
        Width = 121
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 2
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 129
    Width = 492
    Height = 256
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitTop = 156
    ExplicitHeight = 229
    object IQSearchDtl: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 490
      Height = 254
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 273
      IQComponents.Grid.Height = 168
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
      IQComponents.HiddenPanel.Left = 273
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 168
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.HiddenPanel.ExplicitHeight = 116
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      IQComponents.FormTab.ExplicitHeight = 145
      DataSource = SrcDtl
      Columns = <
        item
          FieldName = 'YEARS_WORKED'
          Title.Caption = 'Years Worked'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'NUM_DAYS_ACCRUED'
          Title.Caption = 'Num. of Accrued Days'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ADD_DAYS_PER_YEAR'
          Title.Caption = 'Add Days Per Year'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'NOT_TO_EXCEED_DAYS'
          Title.Caption = 'Not to Exceed days'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'MAX_QTY'
          Title.Caption = 'Max. Qty. to Accrue'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      ExplicitTop = 27
      ExplicitHeight = 202
      Marker = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 104
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
        Caption = '&Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object SrcHdr: TDataSource
    DataSet = QryHdr
    Left = 88
    Top = 43
  end
  object SrcDtl: TDataSource
    DataSet = QryDtl
    Left = 48
    Top = 220
  end
  object QryHdr: TFDQuery
    Active = True
    BeforePost = QryHdrBeforePost
    AfterPost = QryHdrAfterPost
    AfterDelete = QryHdrAfterPost
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PR_ACCR_SCHED'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      
        'select id, descrip, num_of_days_to_next_eval, hrs_per_day, date_' +
        'field'
      ' from PR_ACCR_SCHED'
      ''
      '')
    Left = 104
    Top = 56
    object QryHdrDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 250
    end
    object QryHdrNUM_OF_DAYS_TO_NEXT_EVAL: TBCDField
      DisplayLabel = 'Num of Days to Next Evaluation'
      DisplayWidth = 10
      FieldName = 'NUM_OF_DAYS_TO_NEXT_EVAL'
      Origin = 'NUM_OF_DAYS_TO_NEXT_EVAL'
      Size = 0
    end
    object QryHdrHRS_PER_DAY: TBCDField
      DisplayLabel = 'Hrs. allocated per day'
      DisplayWidth = 10
      FieldName = 'HRS_PER_DAY'
      Origin = 'HRS_PER_DAY'
      Size = 1
    end
    object QryHdrDATE_FIELD: TStringField
      DisplayLabel = 'Date Field'
      DisplayWidth = 30
      FieldName = 'DATE_FIELD'
      Origin = 'DATE_FIELD'
      Size = 30
    end
    object QryHdrID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.PR_ACCR_SCHED.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into PR_ACCR_SCHED'
      '  (ID, DESCRIP, NUM_OF_DAYS_TO_NEXT_EVAL, '
      '   HRS_PER_DAY, DATE_FIELD)'
      'values'
      '  (:ID, :DESCRIP, :NUM_OF_DAYS_TO_NEXT_EVAL, '
      '   :HRS_PER_DAY, :DATE_FIELD)')
    ModifySQL.Strings = (
      'update PR_ACCR_SCHED'
      'set'
      '  ID = :ID,'
      '  DESCRIP = :DESCRIP,'
      '  NUM_OF_DAYS_TO_NEXT_EVAL = :NUM_OF_DAYS_TO_NEXT_EVAL,'
      '  HRS_PER_DAY = :HRS_PER_DAY,'
      '  DATE_FIELD = :DATE_FIELD'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from PR_ACCR_SCHED'
      'where'
      '  ID = :OLD_ID')
    Left = 120
    Top = 72
  end
  object UpdateSQL2: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into PR_ACCR_SCHED_DETAIL'
      
        '  (ID, PR_ACCR_SCHED_ID, YEARS_WORKED, NUM_DAYS_ACCRUED, ADD_DAY' +
        'S_PER_YEAR, '
      '   NOT_TO_EXCEED_DAYS, MAX_QTY)'
      'values'
      
        '  (:ID, :PR_ACCR_SCHED_ID, :YEARS_WORKED, :NUM_DAYS_ACCRUED, :AD' +
        'D_DAYS_PER_YEAR, '
      '   :NOT_TO_EXCEED_DAYS, :MAX_QTY)')
    ModifySQL.Strings = (
      'update PR_ACCR_SCHED_DETAIL'
      'set'
      '  ID = :ID,'
      '  PR_ACCR_SCHED_ID = :PR_ACCR_SCHED_ID,'
      '  YEARS_WORKED = :YEARS_WORKED,'
      '  NUM_DAYS_ACCRUED = :NUM_DAYS_ACCRUED,'
      '  ADD_DAYS_PER_YEAR = :ADD_DAYS_PER_YEAR,'
      '  NOT_TO_EXCEED_DAYS = :NOT_TO_EXCEED_DAYS,'
      ' MAX_QTY = :MAX_QTY'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from PR_ACCR_SCHED_DETAIL'
      'where'
      '  ID = :OLD_ID')
    Left = 88
    Top = 247
  end
  object QryDtl: TFDQuery
    Active = True
    BeforeInsert = QryDtlBeforeEdit
    BeforeEdit = QryDtlBeforeEdit
    BeforePost = QryDtlBeforePost
    AfterPost = QryDtlAfterPost
    AfterDelete = QryDtlAfterPost
    MasterSource = SrcHdr
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.UpdateTableName = 'PR_ACCR_SCHED_DETAIL'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL2
    SQL.Strings = (
      'select id,'
      'pr_accr_sched_id,'
      'years_worked,'
      'num_days_accrued,'
      'add_days_per_year,'
      'not_to_exceed_days,'
      'max_qty'
      ' from PR_ACCR_SCHED_DETAIL'
      'where pr_accr_sched_id = :ID'
      ''
      ''
      '')
    Left = 64
    Top = 232
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 150000c
      end>
    object QryDtlYEARS_WORKED: TBCDField
      DisplayLabel = 'Years Worked'
      DisplayWidth = 10
      FieldName = 'YEARS_WORKED'
      Origin = 'YEARS_WORKED'
      Required = True
      Size = 2
    end
    object QryDtlNUM_DAYS_ACCRUED: TBCDField
      DisplayLabel = 'Num. of Accrued Days'
      DisplayWidth = 10
      FieldName = 'NUM_DAYS_ACCRUED'
      Origin = 'NUM_DAYS_ACCRUED'
      Required = True
      Size = 1
    end
    object QryDtlADD_DAYS_PER_YEAR: TBCDField
      DisplayLabel = 'Add Days Per Year'
      DisplayWidth = 10
      FieldName = 'ADD_DAYS_PER_YEAR'
      Origin = 'ADD_DAYS_PER_YEAR'
      Size = 1
    end
    object QryDtlNOT_TO_EXCEED_DAYS: TBCDField
      DisplayLabel = 'Not to Exceed days'
      DisplayWidth = 10
      FieldName = 'NOT_TO_EXCEED_DAYS'
      Origin = 'NOT_TO_EXCEED_DAYS'
      Size = 1
    end
    object QryDtlMAX_QTY: TBCDField
      DisplayLabel = 'Max. Qty. to Accrue'
      DisplayWidth = 10
      FieldName = 'MAX_QTY'
      Origin = 'IQ.PR_ACCR_SCHED_DETAIL.MAX_QTY'
      Size = 3
    end
    object QryDtlID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryDtlPR_ACCR_SCHED_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PR_ACCR_SCHED_ID'
      Origin = 'PR_ACCR_SCHED_ID'
      Visible = False
      Size = 0
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Accrue Schedule'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 192280 $'
    BuildVersion = '176554'
    Left = 152
    Top = 75
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'IQSearchHdr'
      'IQSearchDtl'
      'NavHdr'
      'NavDtl'
      'dbDateField'
      'ClearDateField1')
    SecurityCode = 'FRMACCRUESHED'
    Left = 264
    Top = 83
  end
  object PkDate_Field: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select column_name from ALL_TAB_COLUMNS'
      '  where table_name = '#39'PR_EMP'#39
      '  and data_type = '#39'DATE'#39)
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 208
    Top = 83
    object PkDate_FieldCOLUMN_NAME: TStringField
      DisplayLabel = 'Date Field'
      FieldName = 'COLUMN_NAME'
      Origin = 'IQ.ALL_TAB_COLUMNS.COLUMN_NAME'
      Size = 30
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 168
    Top = 115
    object ClearDateField1: TUniMenuItem
      Caption = 'Clear Date Field'
      OnClick = ClearDateField1Click
    end
  end
end
