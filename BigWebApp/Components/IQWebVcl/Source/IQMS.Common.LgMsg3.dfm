inherited FrmMsg3: TFrmMsg3
  Left = 68
  Top = 135
  Caption = 'FrmMsg3'
  OnShow = UniFormShow
  PixelsPerInch = 96
  TextHeight = 19
  inherited Panel1: TUniPanel
    Top = 309
    Height = 73
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    ExplicitTop = 309
    ExplicitHeight = 73
    inherited lblMessage: TUniLabel
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
    end
  end
  inherited Panel3: TUniPanel
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    inherited btnYes: TUniBitBtn
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
    end
  end
  inherited Panel2: TUniPanel
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    inherited Memo1: TUniMemo
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
    end
  end
  object Panel4: TUniPanel [3]
    Left = 0
    Top = 35
    Width = 634
    Height = 274
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Caption = ''
    object Panel5: TUniPanel
      Left = 1
      Top = 1
      Width = 632
      Height = 24
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = 'ASSY1 Labor Schedule'
    end
  end
  inherited Timer1: TUniTimer
    Enabled = False
  end
  object DataSourceASSY1: TDataSource
    DataSet = StoredProcASSY1
    Left = 258
    Top = 108
  end
  object StoredProcASSY1: TFDStoredProc
    PackageName = 'IQMS.ASSY1_SCHED'
    StoredProcName = 'EMP_CURRENT_LABOR_SCHEDULE'
    Left = 258
    Top = 165
    ParamData = <
      item
        Position = 1
        Name = 'V_CURSOR'
        DataType = ftCursor
        FDDataType = dtCursorRef
        ParamType = ptInputOutput
      end
      item
        Position = 2
        Name = 'V_PR_EMP_ID'
        DataType = ftFMTBcd
        FDDataType = dtFmtBCD
        Precision = 38
        NumericScale = 38
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'V_PROD_DATE_IN'
        DataType = ftDateTime
        FDDataType = dtDateTime
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'V_SHIFT_IN'
        DataType = ftFMTBcd
        FDDataType = dtFmtBCD
        Precision = 38
        NumericScale = 38
        ParamType = ptInput
      end>
  end
  object StoredProcDate_To_Shift: TFDStoredProc
    StoredProcName = 'IQMS.IQCALENDAR.DATE_TO_SHIFT'
    Left = 416
    Top = 150
    ParamData = <
      item
        Name = 'v_date'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'v_shift'
        DataType = ftFMTBcd
        ParamType = ptInputOutput
        Value = '0'
      end
      item
        Name = 'v_time_left'
        DataType = ftFMTBcd
        ParamType = ptInputOutput
        Value = '0'
      end
      item
        Name = 'v_mfgcell_id'
        DataType = ftFMTBcd
        ParamType = ptInput
      end>
  end
end
