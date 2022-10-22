object FrmShopSU_Shift: TFrmShopSU_Shift
  Left = 338
  Top = 234
  ClientHeight = 261
  ClientWidth = 277
  Caption = 'Assign Time Off By Shift'
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 277
    Height = 242
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Bevel1: TUniPanel
      Left = 3
      Top = 3
      Width = 278
      Height = 193
      Hint = ''
      TabOrder = 9
      Caption = ''
    end
    object Label5: TUniLabel
      Left = 11
      Top = 70
      Width = 55
      Height = 13
      Hint = ''
      Caption = 'Days/Week'
      TabOrder = 10
    end
    object Label4: TUniLabel
      Left = 11
      Top = 101
      Width = 39
      Height = 13
      Hint = ''
      Caption = 'Working'
      TabOrder = 11
    end
    object Label1: TUniLabel
      Left = 11
      Top = 41
      Width = 24
      Height = 13
      Hint = ''
      Caption = 'From'
      TabOrder = 12
    end
    object Label2: TUniLabel
      Left = 152
      Top = 41
      Width = 12
      Height = 13
      Hint = ''
      Caption = 'To'
      TabOrder = 13
    end
    object lblSelected: TUniLabel
      Left = 11
      Top = 15
      Width = 117
      Height = 13
      Hint = ''
      Caption = 'Selected Work Centers: '
      TabOrder = 14
    end
    object edDaysWeek: TUniEdit
      Left = 81
      Top = 66
      Width = 54
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 2
    end
    object chkShift1: TUniCheckBox
      Left = 81
      Top = 99
      Width = 53
      Height = 17
      Hint = ''
      Caption = 'Shift 1'
      TabOrder = 3
    end
    object chkShift2: TUniCheckBox
      Left = 81
      Top = 120
      Width = 53
      Height = 17
      Hint = ''
      Caption = 'Shift 2'
      TabOrder = 4
    end
    object chkShift3: TUniCheckBox
      Left = 81
      Top = 140
      Width = 53
      Height = 17
      Hint = ''
      Caption = 'Shift 3'
      TabOrder = 5
    end
    object DateTimePicker1: TUniDateTimePicker
      Left = 43
      Top = 37
      Width = 93
      Height = 21
      Hint = ''
      DateTime = 42662.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 0
    end
    object DateTimePicker2: TUniDateTimePicker
      Left = 174
      Top = 37
      Width = 93
      Height = 21
      Hint = ''
      DateTime = 42662.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 1
    end
    object pnlBtnBottm: TUniPanel
      Left = 1
      Top = 202
      Width = 275
      Height = 40
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 6
      Caption = ''
      object pnlBtnRight: TUniPanel
        Left = 64
        Top = 1
        Width = 211
        Height = 38
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object btnApply: TUniButton
          Left = 2
          Top = 7
          Width = 97
          Height = 25
          Hint = ''
          Caption = 'Apply'
          TabOrder = 1
          OnClick = btnApplyClick
        end
        object btnCancel: TUniButton
          Left = 107
          Top = 7
          Width = 97
          Height = 25
          Hint = ''
          Caption = 'Cancel'
          ModalResult = 2
          TabOrder = 2
        end
      end
    end
    object chkShift4: TUniCheckBox
      Left = 81
      Top = 160
      Width = 53
      Height = 17
      Hint = ''
      Caption = 'Shift 4'
      TabOrder = 7
    end
  end
  object StatusBar1: TUniStatusBar
    Left = 0
    Top = 242
    Width = 277
    Height = 19
    Hint = ''
    Panels = <>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
  end
  object procProd_Date: TFDStoredProc
    ConnectionName = 'IQFD'
    PackageName = 'IQCALENDAR'
    StoredProcName = 'PROD_DATE'
    Left = 192
    Top = 120
    ParamData = <
      item
        Position = 1
        Name = 'RESULT'
        DataType = ftDateTime
        FDDataType = dtDateTime
        ParamType = ptResult
      end
      item
        Position = 2
        Name = 'V_CALENDAR_DATE'
        DataType = ftDateTime
        FDDataType = dtDateTime
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'V_MFGCELL_ID'
        DataType = ftFMTBcd
        FDDataType = dtFmtBCD
        Precision = 38
        NumericScale = 38
        ParamType = ptInput
      end>
  end
end
