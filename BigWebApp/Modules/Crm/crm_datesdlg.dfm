object FrmCRMDatesDialog: TFrmCRMDatesDialog
  Left = 417
  Top = 174
  HelpContext = 5000285
  ClientHeight = 188
  ClientWidth = 371
  Caption = 'Date Range'
  OnShow = FormShow
  BorderStyle = bsDialog
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 152
    Width = 371
    Height = 36
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 53
      Top = 1
      Width = 317
      Height = 34
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnNone: TUniButton
        Left = 5
        Top = 5
        Width = 97
        Height = 25
        Hint = 'Click to remove date range'
        ShowHint = True
        ParentShowHint = False
        Caption = 'None'
        ModalResult = 1
        TabOrder = 1
        OnClick = btnNoneClick
      end
      object btnOK: TUniButton
        Left = 109
        Top = 5
        Width = 97
        Height = 25
        Hint = 'Apply selected date range'
        ShowHint = True
        ParentShowHint = False
        Caption = 'OK'
        ModalResult = 1
        TabOrder = 2
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 213
        Top = 5
        Width = 97
        Height = 25
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 3
      end
    end
  end
  object PnlMain: TUniPanel
    Left = 0
    Top = 0
    Width = 371
    Height = 152
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object GroupBox1: TUniGroupBox
      Left = 1
      Top = 1
      Width = 369
      Height = 150
      Hint = ''
      Caption = '  Select a Date Range  '
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      DesignSize = (
        369
        150)
      object Label1: TUniLabel
        Left = 8
        Top = 28
        Width = 24
        Height = 13
        Hint = ''
        Caption = 'From'
        TabOrder = 5
      end
      object Label2: TUniLabel
        Left = 8
        Top = 52
        Width = 12
        Height = 13
        Hint = ''
        Caption = 'To'
        TabOrder = 6
      end
      object lblCRMTodayDateRange: TUniLabel
        Left = 10
        Top = 112
        Width = 344
        Height = 21
        Hint = ''
        AutoSize = False
        Caption = 'Date range:  No range has been applied.'
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 7
      end
      object dtpStartDate: TUniDateTimePicker
        Left = 108
        Top = 24
        Width = 136
        Height = 21
        Hint = ''
        DateTime = 42676.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Anchors = [akTop, akRight]
        TabOrder = 0
      end
      object dtpEndDate: TUniDateTimePicker
        Left = 108
        Top = 48
        Width = 136
        Height = 21
        Hint = ''
        DateTime = 42676.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Anchors = [akTop, akRight]
        TabOrder = 1
      end
      object dtpStartTime: TUniDateTimePicker
        Left = 248
        Top = 24
        Width = 106
        Height = 21
        Hint = ''
        DateTime = 42676.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Anchors = [akTop, akRight]
        TabOrder = 2
      end
      object dtpEndTime: TUniDateTimePicker
        Left = 248
        Top = 48
        Width = 106
        Height = 21
        Hint = ''
        DateTime = 42676.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Anchors = [akTop, akRight]
        TabOrder = 3
      end
      object btnToday: TUniButton
        Left = 108
        Top = 73
        Width = 135
        Height = 25
        Hint = 'Show only today (full twenty-four hours)'
        ShowHint = True
        ParentShowHint = False
        Caption = 'Today'
        Anchors = [akTop, akRight]
        TabOrder = 8
        OnClick = btnTodayClick
      end
    end
  end
  object PMain: TUniPopupMenu
    Left = 210
    Top = 90
    object Help1: TUniMenuItem
      Caption = '&Help'
      ShortCut = 112
      OnClick = Help1Click
    end
  end
end
