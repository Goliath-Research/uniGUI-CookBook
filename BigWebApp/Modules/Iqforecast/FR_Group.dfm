object FrmForeGroups: TFrmForeGroups
  Left = 424
  Top = 176
  HelpContext = 1000064
  ClientHeight = 416
  ClientWidth = 487
  Caption = 'Forecast Groups'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 123
    Width = 487
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object pnlGroups: TUniPanel
    Left = 0
    Top = 0
    Width = 487
    Height = 123
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = 'pnlGroups'
    ExplicitTop = 33
    object wwGrdGroup: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 485
      Height = 121
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 268
      IQComponents.Grid.Height = 35
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = wwSrcFR_Group
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
      IQComponents.Navigator.DataSource = wwSrcFR_Group
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 268
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 35
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = wwSrcFR_Group
      Columns = <
        item
          FieldName = 'CODE'
          Title.Caption = 'Group Code'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Group Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
    object wwLookupComboSrcPeriod: TUniDBLookupComboBox
      Left = 225
      Top = 54
      Width = 51
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ListOnlyMode = lmFollowSource
      ListField = 'PERIOD;START_DATE;END_DATE'
      ListSource = wwSrcGLPeriods
      KeyField = 'PERIOD'
      ListFieldIndex = 0
      DataField = 'PERIOD_SRC'
      DataSource = wwSrcFR_Group_Dtl_Period
      TabOrder = 1
      Color = clWindow
      OnDropDown = wwLookupComboSrcPeriodDropDown
    end
    object wwLookupComboTrgPeriod: TUniDBLookupComboBox
      Left = 225
      Top = 84
      Width = 51
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ListOnlyMode = lmFollowSource
      ListField = 'PERIOD;START_DATE;END_DATE'
      ListSource = wwSrcGLPeriods
      KeyField = 'PERIOD'
      ListFieldIndex = 0
      DataField = 'PERIOD_TRG'
      DataSource = wwSrcFR_Group_Dtl_Period
      TabOrder = 2
      Color = clWindow
      OnDropDown = wwLookupComboSrcPeriodDropDown
    end
    object wwComboLookupGLYearPeriod: TUniDBLookupComboBox
      Left = 225
      Top = 23
      Width = 90
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ListOnlyMode = lmFollowSource
      ListField = 'DESCRIP;START_DATE;END_DATE'
      ListSource = wwSrcGLYear
      KeyField = 'ID'
      ListFieldIndex = 0
      DataField = 'GLYEAR_ID'
      DataSource = wwSrcFR_Group_Dtl_Period
      TabOrder = 3
      Color = clWindow
    end
  end
  object wwComboTrgQuarter: TUniDBComboBox
    Left = 345
    Top = 89
    Width = 50
    Height = 21
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    DataField = 'SEQ'
    DataSource = wwSrcFR_Group_Dtl
    Style = csDropDownList
    Items.Strings = (
      '1st'#9'1'
      '2nd'#9'2'
      '3rd'#9'3'
      '4th'#9'4')
    TabOrder = 1
  end
  object wwComboLookupGLYear: TUniDBLookupComboBox
    Left = 345
    Top = 59
    Width = 89
    Height = 21
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ListOnlyMode = lmFollowSource
    ListField = 'DESCRIP;START_DATE;END_DATE'
    ListSource = wwSrcGLYear
    KeyField = 'DESCRIP'
    ListFieldIndex = 0
    DataField = 'GLYEAR_ID'
    DataSource = wwSrcFR_Group_Dtl
    TabOrder = 2
    Color = clWindow
  end
  object wwComboSrcQuarter: TUniDBComboBox
    Left = 345
    Top = 118
    Width = 50
    Height = 21
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    DataField = 'QUARTER'
    DataSource = wwSrcFR_Group_Dtl
    Style = csDropDownList
    Items.Strings = (
      '1st'#9'1'
      '2nd'#9'2'
      '3rd'#9'3'
      '4th'#9'4')
    TabOrder = 3
  end
  object PageControl1: TUniPageControl
    Left = 0
    Top = 126
    Width = 487
    Height = 290
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ActivePage = TabSheet1
    TabBarVisible = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 4
    OnChange = PageControl1Change
    object TabSheet1: TUniTabSheet
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Forecast By GL Period'
      object wwGrdGroup_Dtl_Period: TIQUniGridControl
        Left = 0
        Top = 0
        Width = 479
        Height = 262
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 262
        IQComponents.Grid.Height = 176
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = wwSrcFR_Group_Dtl_Period
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
        IQComponents.Navigator.DataSource = wwSrcFR_Group_Dtl_Period
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 262
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 176
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = wwSrcFR_Group_Dtl_Period
        Columns = <
          item
            FieldName = 'GLYear'
            Title.Caption = 'Ref~Fiscal Year'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PERIOD_SRC'
            Title.Caption = 'Ref~Period'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PERIOD_TRG'
            Title.Caption = 'Trg~Period'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PRCNT_CHANGE'
            Title.Caption = 'Percent~Change'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'START_DATE'
            Title.Caption = '~Start Date'
            Width = 64
            ReadOnly = True
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'END_DATE'
            Title.Caption = '~End Date'
            Width = 64
            ReadOnly = True
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
    end
    object TabSheet2: TUniTabSheet
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ImageIndex = 1
      Caption = 'By Fiscal Quarter'
      object wwGrdGroup_Dtl: TIQUniGridControl
        Left = 0
        Top = 0
        Width = 479
        Height = 262
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 262
        IQComponents.Grid.Height = 176
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = wwSrcFR_Group_Dtl
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
        IQComponents.Navigator.DataSource = wwSrcFR_Group_Dtl
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 262
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 176
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = wwSrcFR_Group_Dtl
        Columns = <
          item
            FieldName = 'GLYear'
            Title.Caption = 'Ref~Fiscal Year'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'QUARTER'
            Title.Caption = 'Ref~Quarter'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'SEQ'
            Title.Caption = 'Trg~Quarter'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PRCNT_CHANGE'
            Title.Caption = 'Percent~Change'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'END_DATE'
            Title.Caption = '~End Date'
            Width = 64
            ReadOnly = True
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'START_DATE'
            Title.Caption = '~Start Date'
            Width = 64
            ReadOnly = True
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
    end
  end
  object wwSrcFR_Group: TDataSource
    DataSet = wwTblFR_Group
    Left = 445
    Top = 304
  end
  object wwSrcFR_Group_Dtl: TDataSource
    DataSet = wwTblFR_Group_Dtl
    Left = 46
    Top = 248
  end
  object wwTblFR_Group: TFDTable
    BeforePost = wwTblFR_GroupBeforePost
    AfterPost = CheckQuarters
    BeforeScroll = CheckQuarters
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'FR_GROUP'
    TableName = 'FR_GROUP'
    Left = 237
    Top = 336
    object wwTblFR_GroupCODE: TStringField
      DisplayLabel = 'Group Code'
      DisplayWidth = 13
      FieldName = 'CODE'
      Required = True
      Size = 10
    end
    object wwTblFR_GroupDESCRIP: TStringField
      DisplayLabel = 'Group Description'
      DisplayWidth = 39
      FieldName = 'DESCRIP'
      Size = 35
    end
    object wwTblFR_GroupID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object wwTblFR_Group_Dtl: TFDTable
    BeforeInsert = PostParentsBeforeEdit
    BeforeEdit = PostParentsBeforeEdit
    BeforePost = AssignIDBeforePost
    AfterPost = wwTblFR_Group_DtlAfterPost
    IndexFieldNames = 'FR_GROUP_ID;SEQ'
    MasterSource = wwSrcFR_Group
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'FR_GROUP_DTL'
    TableName = 'FR_GROUP_DTL'
    Left = 110
    Top = 280
    object wwTblFR_Group_DtlSEQ: TBCDField
      DisplayLabel = 'Target~Quarter'
      DisplayWidth = 6
      FieldName = 'SEQ'
      Size = 0
    end
    object wwTblFR_Group_DtlPRCNT_CHANGE: TFMTBCDField
      DisplayLabel = 'Percent~Change'
      DisplayWidth = 7
      FieldName = 'PRCNT_CHANGE'
      Size = 6
    end
    object wwTblFR_Group_DtlGLYear: TStringField
      DisplayLabel = 'Ref~Fiscal Year'
      DisplayWidth = 9
      FieldKind = fkLookup
      FieldName = 'GLYear'
      LookupDataSet = wwQryGLYear
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIP'
      KeyFields = 'GLYEAR_ID'
      Size = 25
      Lookup = True
    end
    object wwTblFR_Group_DtlQUARTER: TBCDField
      DisplayLabel = 'Ref~Period'
      DisplayWidth = 6
      FieldName = 'QUARTER'
      Required = True
      Size = 0
    end
    object wwTblFR_Group_DtlSTART_DATE: TDateTimeField
      DisplayLabel = '~Start Date'
      DisplayWidth = 10
      FieldName = 'START_DATE'
      ReadOnly = True
    end
    object wwTblFR_Group_DtlEND_DATE: TDateTimeField
      DisplayLabel = '~End Date'
      DisplayWidth = 10
      FieldName = 'END_DATE'
      ReadOnly = True
    end
    object wwTblFR_Group_DtlGLYEAR_ID: TBCDField
      DisplayLabel = 'Lookup~Fiscal Year'
      DisplayWidth = 9
      FieldName = 'GLYEAR_ID'
      Visible = False
      Size = 0
    end
    object wwTblFR_Group_DtlID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object wwTblFR_Group_DtlFR_GROUP_ID: TBCDField
      FieldName = 'FR_GROUP_ID'
      Visible = False
      Size = 0
    end
  end
  object wwQryGLYear: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from glyear')
    Left = 269
    Top = 263
    object wwQryGLYearDESCRIP: TStringField
      DisplayLabel = 'Fiscal Year'
      DisplayWidth = 18
      FieldName = 'DESCRIP'
      Origin = 'GLYEAR.DESCRIP'
      Size = 25
    end
    object wwQryGLYearSTART_DATE: TDateTimeField
      DisplayLabel = 'Start Date'
      DisplayWidth = 18
      FieldName = 'START_DATE'
      Origin = 'GLYEAR.START_DATE'
    end
    object wwQryGLYearEND_DATE: TDateTimeField
      DisplayLabel = 'End Date'
      DisplayWidth = 18
      FieldName = 'END_DATE'
      Origin = 'GLYEAR.END_DATE'
    end
    object wwQryGLYearID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'GLYEAR.ID'
      Visible = False
      Size = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 336
    Top = 300
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
      object Contents1: TUniMenuItem
        Caption = '&Contents'
        OnClick = Contents1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Forecast Groups'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 190418 $'
    BuildVersion = '176554'
    Left = 408
    Top = 228
  end
  object wwQryGLPeriods: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select *'
      '  from glperiods'
      ' where glyear_id = :glyear_id'
      ' ')
    Left = 205
    Top = 271
    ParamData = <
      item
        Name = 'glyear_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object wwQryGLPeriodsPERIOD: TBCDField
      DisplayLabel = 'Period'
      DisplayWidth = 10
      FieldName = 'PERIOD'
      Origin = 'GLPERIODS.PERIOD'
      Size = 0
    end
    object wwQryGLPeriodsSTART_DATE: TDateTimeField
      DisplayLabel = 'Start Date'
      DisplayWidth = 18
      FieldName = 'START_DATE'
      Origin = 'GLPERIODS.START_DATE'
    end
    object wwQryGLPeriodsEND_DATE: TDateTimeField
      DisplayLabel = 'End Date'
      DisplayWidth = 18
      FieldName = 'END_DATE'
      Origin = 'GLPERIODS.END_DATE'
    end
  end
  object wwSrcFR_Group_Dtl_Period: TDataSource
    DataSet = wwTblFR_Group_Dtl_Period
    Left = 440
    Top = 306
  end
  object wwTblFR_Group_Dtl_Period: TFDTable
    BeforeInsert = wwTblFR_Group_Dtl_PeriodBeforeInsert
    AfterInsert = wwTblFR_Group_Dtl_PeriodAfterInsert
    BeforeEdit = PostParentsBeforeEdit
    BeforePost = AssignIDBeforePost
    AfterPost = wwTblFR_Group_DtlAfterPost
    IndexFieldNames = 'FR_GROUP_ID;PERIOD_TRG'
    MasterSource = wwSrcFR_Group
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'FR_GROUP_DTL_PERIOD'
    TableName = 'FR_GROUP_DTL_PERIOD'
    Left = 400
    Top = 272
    object wwTblFR_Group_Dtl_PeriodID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object wwTblFR_Group_Dtl_PeriodFR_GROUP_ID: TBCDField
      DisplayLabel = 'Forecast Group ID'
      FieldName = 'FR_GROUP_ID'
      Required = True
      Size = 0
    end
    object wwTblFR_Group_Dtl_PeriodGLYEAR_ID: TBCDField
      FieldName = 'GLYEAR_ID'
      Size = 0
    end
    object wwTblFR_Group_Dtl_PeriodSTART_DATE: TDateTimeField
      FieldName = 'START_DATE'
      ReadOnly = True
    end
    object wwTblFR_Group_Dtl_PeriodGLYear: TStringField
      DisplayLabel = 'Ref~Fiscal Year'
      DisplayWidth = 9
      FieldKind = fkLookup
      FieldName = 'GLYear'
      LookupDataSet = wwQryGLYear
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIP'
      KeyFields = 'GLYEAR_ID'
      Size = 25
      Lookup = True
    end
    object wwTblFR_Group_Dtl_PeriodEND_DATE: TDateTimeField
      FieldName = 'END_DATE'
      ReadOnly = True
    end
    object wwTblFR_Group_Dtl_PeriodPRCNT_CHANGE: TFMTBCDField
      FieldName = 'PRCNT_CHANGE'
      Size = 6
    end
    object wwTblFR_Group_Dtl_PeriodPERIOD_SRC: TBCDField
      FieldName = 'PERIOD_SRC'
      Size = 0
    end
    object wwTblFR_Group_Dtl_PeriodPERIOD_TRG: TBCDField
      FieldName = 'PERIOD_TRG'
      Size = 0
    end
  end
  object wwSrcGLPeriods: TDataSource
    DataSet = wwQryGLPeriods
    Left = 200
    Top = 216
  end
  object wwSrcGLYear: TDataSource
    DataSet = wwQryGLYear
    Left = 320
    Top = 216
  end
end
