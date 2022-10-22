object FrmSelectDate: TFrmSelectDate
  Left = 359
  Top = 257
  ClientHeight = 236
  ClientWidth = 356
  Caption = 'Select Date'
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyDown = DoCalendarKeyDown
  KeyPreview = True
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlCalendar: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 244
    Height = 236
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel1: TUniPanel
      Left = 7
      Top = 33
      Width = 234
      Height = 184
      Hint = ''
      TabOrder = 0
      Caption = ''
      object Calendar: TUniCalendar
        Left = 3
        Top = 1
        Width = 225
        Height = 180
        Hint = ''
        Date = 39967.000000000000000000
        FirstDayOfWeek = dowMonday
        TabStop = False
        TabOrder = 1
        OnClick = CalendarClick
      end
    end
    object cmbMonth: TUniComboBox
      Left = 7
      Top = 8
      Width = 118
      Height = 21
      Hint = ''
      Style = csDropDownList
      Text = ''
      TabOrder = 2
      OnChange = cmbMonthChange
    end
    object udYear: TUniSpinEdit
      Left = 130
      Top = 7
      Width = 71
      Height = 22
      Hint = ''
      Value = 2000
      MaxValue = 3000
      MinValue = 1950
      TabOrder = 3
    end
  end
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 244
    Top = 0
    Width = 112
    Height = 236
    Hint = ''
    Align = alRight
    Anchors = [akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object btnOk: TUniBitBtn
      Left = 8
      Top = 8
      Width = 97
      Height = 25
      Hint = ''
      Caption = '&OK'
      ModalResult = 1
      TabOrder = 0
      Default = True
    end
    object btnCancel: TUniBitBtn
      Left = 8
      Top = 40
      Width = 97
      Height = 25
      Hint = ''
      Caption = '&Cancel'
      Cancel = True
      ModalResult = 2
      TabOrder = 1
    end
  end
end
