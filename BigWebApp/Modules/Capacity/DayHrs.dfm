object FrmDayHrsCalc: TFrmDayHrsCalc
  Left = 168
  Top = 196
  ClientHeight = 212
  ClientWidth = 408
  Caption = ''
  BorderStyle = bsSizeToolWin
  OldCreateOrder = True
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 408
    Height = 175
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object GroupBox1: TUniGroupBox
      Left = 1
      Top = 1
      Width = 406
      Height = 173
      Hint = ''
      Caption = '  Progress  '
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      DesignSize = (
        406
        173)
      object lblStatus: TUniLabel
        Left = 16
        Top = 18
        Width = 352
        Height = 42
        Hint = ''
        AutoSize = False
        Caption = 'Idle'
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 7
      end
      object Bevel1: TUniPanel
        Left = 16
        Top = 95
        Width = 378
        Height = 3
        Hint = ''
        TabOrder = 8
        Caption = ''
      end
      object ProgressBar1: TUniProgressBar
        Left = 16
        Top = 70
        Width = 354
        Height = 16
        Hint = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object chkUpdateAvail: TUniCheckBox
        Left = 177
        Top = 105
        Width = 137
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Update Available Hours'
        TabOrder = 2
      end
      object chkIdealVsExistPOs: TUniCheckBox
        Left = 177
        Top = 123
        Width = 169
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Evaluate Ideal vs Existing POs'
        TabOrder = 3
      end
      object chkPlanning: TUniCheckBox
        Left = 16
        Top = 105
        Width = 113
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Capacity Planning'
        TabOrder = 1
      end
      object chkDayUseTotal: TUniCheckBox
        Left = 35
        Top = 141
        Width = 97
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Totals'
        TabOrder = 4
      end
      object chkProjected: TUniCheckBox
        Left = 35
        Top = 124
        Width = 73
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Projected'
        TabOrder = 5
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 175
    Width = 408
    Height = 37
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel3: TUniPanel
      Tag = 1999
      Left = 53
      Top = 1
      Width = 355
      Height = 35
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnStatistics: TUniButton
        Left = 1
        Top = 4
        Width = 120
        Height = 25
        Hint = ''
        Visible = False
        Caption = 'Statistics'
        TabOrder = 1
        OnClick = btnStatisticsClick
      end
      object btnCalc: TUniButton
        Left = 126
        Top = 4
        Width = 120
        Height = 25
        Hint = ''
        Caption = 'Calculate'
        TabOrder = 2
        OnClick = btnCalcClick
      end
      object btnCancel: TUniButton
        Left = 251
        Top = 4
        Width = 98
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 3
        OnClick = btnCancelClick
      end
    end
  end
  object QryWorkOrder: TFDQuery
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmTotal
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select '
      '       w.id, '
      '       s.mfgno,'
      '       w.standard_id,'
      '       /* in case of sched assy1 processes take the earliest */'
      
        '       min(decode( c.id, null, w.start_time, c.prod_start_time )' +
        ') start_time  '
      '  from workorder w, standard s, cntr_sched c'
      ' where w.standard_id = s.id'
      '   and w.id = c.workorder_id(+)'
      '   and w.prodhrs > 0'
      ''
      ' group by '
      '       w.id, '
      '       s.mfgno,'
      '       w.standard_id'
      ''
      'order by'
      
        '       min(decode( c.id, null, w.start_time, c.prod_start_time )' +
        '), '
      '       w.standard_id'
      '')
    Left = 92
    Top = 15
  end
  object procSave_Day_Hrs: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    PackageName = 'IQCAPACITY'
    StoredProcName = 'SAVE_DAY_HRS'
    Left = 152
    Top = 16
    ParamData = <
      item
        Position = 1
        Name = 'V_WORKORDER_ID'
        DataType = ftBCD
        FDDataType = dtBCD
        Precision = 15
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'V_STAGE_SCOPE'
        DataType = ftFMTBcd
        FDDataType = dtFmtBCD
        Precision = 38
        NumericScale = 38
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'V_ASSY_GROUP_BATCH'
        DataType = ftFMTBcd
        FDDataType = dtFmtBCD
        Precision = 38
        NumericScale = 38
        ParamType = ptInput
      end>
  end
  object QryCenterTypes: TFDQuery
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmTotal
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct cntr_type, mfgcell_id'
      '  from work_center'
      '  order by cntr_type'
      ' ')
    Left = 120
    Top = 15
    object QryCenterTypesCNTR_TYPE: TStringField
      FieldName = 'CNTR_TYPE'
    end
    object QryCenterTypesMFGCELL_ID: TBCDField
      FieldName = 'MFGCELL_ID'
      Origin = 'WORK_CENTER.MFGCELL_ID'
      Size = 0
    end
  end
  object procSave_Hrs_Avail: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    PackageName = 'IQCAPACITY'
    StoredProcName = 'SAVE_AVAIL_HRS'
    Left = 221
    Top = 15
    ParamData = <
      item
        Position = 1
        Name = 'V_CNTR_TYPE'
        DataType = ftFixedChar
        FDDataType = dtAnsiString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 2
        Name = 'V_MFGCELL_ID'
        DataType = ftFMTBcd
        FDDataType = dtFmtBCD
        Precision = 38
        NumericScale = 38
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'V_START_DATE'
        DataType = ftDateTime
        FDDataType = dtDateTime
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'V_END_DATE'
        DataType = ftDateTime
        FDDataType = dtDateTime
        ParamType = ptInput
      end>
  end
  object StoredProc1: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    Left = 257
    Top = 17
  end
  object TM: TIQWebTiming
    Left = 9
    Top = 130
  end
end
