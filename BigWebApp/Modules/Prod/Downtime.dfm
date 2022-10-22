object FrmDown: TFrmDown
  Left = 168
  Top = 184
  HelpContext = 1064142
  ClientHeight = 315
  ClientWidth = 866
  Caption = 'Downtime '
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 0
    Width = 866
    Height = 4
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    ExplicitTop = 27
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 273
    Width = 866
    Height = 42
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 735
      Top = 1
      Width = 131
      Height = 40
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Button1: TUniButton
        Left = 30
        Top = 5
        Width = 97
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Close'
        ModalResult = 1
        TabOrder = 1
      end
    end
  end
  object Grid: TIQUniGridControl
    Left = 0
    Top = 4
    Width = 866
    Height = 269
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 649
    IQComponents.Grid.Height = 183
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcILLM_DRT
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
    IQComponents.Navigator.DataSource = SrcILLM_DRT
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 649
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 183
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitHeight = 156
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitHeight = 185
    DataSource = SrcILLM_DRT
    Columns = <
      item
        FieldName = 'Descrip'
        Title.Caption = 'Reason'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DWN_ST_TIME'
        Title.Caption = 'Start'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DWN_END_TIME'
        Title.Caption = 'End'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TOTAL_DT'
        Title.Caption = 'Total Downtime'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DWN_MEMO'
        Title.Caption = 'Comments'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    ExplicitTop = 31
    ExplicitHeight = 242
    Marker = 0
  end
  object dbStart: TUniDBDateTimePicker
    Left = 30
    Top = 128
    Width = 148
    Height = 21
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    DateTime = 42663.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    TimeFormat = 'HH:mm:ss'
    TabOrder = 3
  end
  object wwDBComboDlgReason: TUniEdit
    Left = 33
    Top = 89
    Width = 149
    Height = 21
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Text = ''
    TabOrder = 4
  end
  object wwDBComboDlgMemo: TUniEdit
    Left = 217
    Top = 89
    Width = 149
    Height = 21
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Text = ''
    TabOrder = 5
    OnKeyDown = wwDBComboDlgMemoKeyDown
  end
  object SrcILLM_DRT: TDataSource
    DataSet = QryILLM_DRT
    Left = 8
    Top = 168
  end
  object Query1: TFDQuery
    Tag = 1
    Active = True
    BeforeOpen = Query1BeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select RTrim(down_code) as down_code, '
      '       down_descrip,'
      '       eplant_id'
      '  from DOWN_CODE'
      ' where misc.eplant_filter( eplant_id ) = 1'
      '   and nvl(pk_hide, '#39'N'#39') <> '#39'Y'#39
      ' order by down_code'
      ' ')
    Left = 136
    Top = 168
    object Query1DOWN_DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DOWN_DESCRIP'
    end
    object Query1DOWN_CODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 10
      FieldName = 'DOWN_CODE'
      Size = 5
    end
    object Query1EPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object QryILLM_DRT: TFDQuery
    Active = True
    AfterOpen = QryILLM_DRTAfterOpen
    BeforeClose = QryILLM_DRTBeforeClose
    BeforePost = QryILLM_DRTBeforePost
    AfterPost = QryILLM_DRTAfterPost
    AfterDelete = QryILLM_DRTAfterPost
    OnCalcFields = QryILLM_DRTCalcFields
    OnNewRecord = QryILLM_DRTNewRecord
    CachedUpdates = True
    OnUpdateRecord = QryILLM_DRTUpdateRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select id,'
      '       hist_illum_rt_id,'
      '       prod_date,'
      '       shift,'
      '       dwn_st_time,'
      '       dwn_end_time,'
      '       dwn_memo,'
      '       down_code,'
      '       total_dt,'
      '       dayprod_id'
      '  from ILLM_DRT'
      ' where '
      '       dayprod_id = :id'
      ' order by HIST_ILLUM_RT_ID,'
      '          PROD_DATE,'
      '          SHIFT,'
      '          DWN_ST_TIME'
      ''
      ' '
      ' '
      ' ')
    Left = 24
    Top = 168
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryILLM_DRTDescrip: TStringField
      DisplayLabel = 'Reason'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'Descrip'
      LookupDataSet = Query1
      LookupKeyFields = 'DOWN_CODE'
      LookupResultField = 'DOWN_DESCRIP'
      KeyFields = 'DOWN_CODE'
      Lookup = True
    end
    object QryILLM_DRTDWN_ST_TIME: TDateTimeField
      DisplayLabel = 'Start'
      DisplayWidth = 18
      FieldName = 'DWN_ST_TIME'
      Origin = 'ILLM_DRT.DWN_ST_TIME'
    end
    object QryILLM_DRTDWN_END_TIME: TDateTimeField
      DisplayLabel = 'End'
      DisplayWidth = 18
      FieldName = 'DWN_END_TIME'
      Origin = 'ILLM_DRT.DWN_END_TIME'
    end
    object QryILLM_DRTTOTAL_DT: TBCDField
      DisplayLabel = 'Total Downtime'
      DisplayWidth = 15
      FieldName = 'TOTAL_DT'
      Origin = 'ILLM_DRT.TOTAL_DT'
      Size = 2
    end
    object QryILLM_DRTDWN_MEMO: TStringField
      DisplayLabel = 'Comments'
      DisplayWidth = 36
      FieldName = 'DWN_MEMO'
      Origin = 'ILLM_DRT.DWN_MEMO'
      Size = 2000
    end
    object QryILLM_DRTID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'ILLM_DRT.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryILLM_DRTHIST_ILLUM_RT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'HIST_ILLUM_RT_ID'
      Origin = 'ILLM_DRT.HIST_ILLUM_RT_ID'
      Visible = False
      Size = 0
    end
    object QryILLM_DRTPROD_DATE: TDateTimeField
      DisplayWidth = 18
      FieldName = 'PROD_DATE'
      Origin = 'ILLM_DRT.PROD_DATE'
      Visible = False
    end
    object QryILLM_DRTSHIFT: TBCDField
      DisplayWidth = 10
      FieldName = 'SHIFT'
      Origin = 'ILLM_DRT.SHIFT'
      Visible = False
      Size = 0
    end
    object QryILLM_DRTDOWN_CODE: TStringField
      DisplayWidth = 5
      FieldName = 'DOWN_CODE'
      Origin = 'ILLM_DRT.DOWN_CODE'
      Visible = False
      Size = 5
    end
    object QryILLM_DRTDAYPROD_ID: TBCDField
      FieldName = 'DAYPROD_ID'
      Origin = 'IQ.ILLM_DRT.DAYPROD_ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into ILLM_DRT'
      
        '  (ID, HIST_ILLUM_RT_ID, PROD_DATE, SHIFT, DWN_ST_TIME, DWN_END_' +
        'TIME, DWN_MEMO, '
      '   DOWN_CODE, TOTAL_DT, DAYPROD_ID)'
      'values'
      
        '  (:ID, :HIST_ILLUM_RT_ID, :PROD_DATE, :SHIFT, :DWN_ST_TIME, :DW' +
        'N_END_TIME, '
      '   :DWN_MEMO, :DOWN_CODE, :TOTAL_DT, :DAYPROD_ID)')
    ModifySQL.Strings = (
      'update ILLM_DRT'
      'set'
      '  ID = :ID,'
      '  HIST_ILLUM_RT_ID = :HIST_ILLUM_RT_ID,'
      '  PROD_DATE = :PROD_DATE,'
      '  SHIFT = :SHIFT,'
      '  DWN_ST_TIME = :DWN_ST_TIME,'
      '  DWN_END_TIME = :DWN_END_TIME,'
      '  DWN_MEMO = :DWN_MEMO,'
      '  DOWN_CODE = :DOWN_CODE,'
      '  TOTAL_DT = :TOTAL_DT,'
      '  DAYPROD_ID = :DAYPROD_ID'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from ILLM_DRT'
      'where'
      '  ID = :OLD_ID')
    Left = 93
    Top = 168
  end
  object PkDownCode: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select rtrim(down_code) as down_code,'
      '       down_descrip as down_descrip,'
      '       eplant_id as eplant_id'
      '  from DOWN_CODE'
      ' where misc.eplant_filter_include_nulls( eplant_id ) = 1'
      '   and nvl(pk_hide, '#39'N'#39') <> '#39'Y'#39
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 200
    Top = 136
    object PkDownCodeDOWN_CODE: TStringField
      DisplayLabel = 'Code'
      FieldName = 'DOWN_CODE'
      FixedChar = True
      Size = 5
    end
    object PkDownCodeDOWN_DESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DOWN_DESCRIP'
      FixedChar = True
    end
    object PkDownCodeEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
end
