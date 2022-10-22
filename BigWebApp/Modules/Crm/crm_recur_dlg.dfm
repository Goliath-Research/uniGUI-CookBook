object FrmCRMRecurrence: TFrmCRMRecurrence
  Left = 214
  Top = 149
  ClientHeight = 335
  ClientWidth = 566
  Caption = 'Recurrence'
  BorderStyle = bsDialog
  Position = poOwnerFormCenter
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlAppointment: TUniPanel
    Left = 0
    Top = 0
    Width = 566
    Height = 78
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object gbAppointment: TUniGroupBox
      Left = 1
      Top = 1
      Width = 564
      Height = 76
      Hint = ''
      Caption = ' Appointment Time '
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object lblStartTime: TUniLabel
        Left = 16
        Top = 28
        Width = 24
        Height = 13
        Hint = ''
        Caption = 'Start'
        TabOrder = 1
      end
      object lblEndTime: TUniLabel
        Left = 192
        Top = 28
        Width = 18
        Height = 13
        Hint = ''
        Caption = 'End'
        TabOrder = 4
      end
      object lblDuration: TUniLabel
        Left = 360
        Top = 28
        Width = 41
        Height = 13
        Hint = ''
        Caption = 'Duration'
        TabOrder = 5
      end
      object lblAllDayMsg: TUniLabel
        Left = 40
        Top = 32
        Width = 71
        Height = 13
        Hint = ''
        Visible = False
        Caption = 'Occurs all day.'
        TabOrder = 6
      end
      object cmbStartTime: TIQWebTimeComboBox
        Left = 48
        Top = 24
        Width = 112
        Height = 21
        Hint = ''
        Time = 0.000000000000000000
        OnChange = DoApptTimeChange
        DesignSize = (
          112
          21)
      end
      object cmbEndTime: TIQWebTimeComboBox
        Left = 232
        Top = 24
        Width = 112
        Height = 21
        Hint = ''
        Time = 0.000000000000000000
        OnChange = DoApptTimeChange
        DesignSize = (
          112
          21)
      end
      object cmbDuration: TIQWebDurationComboBox
        Left = 424
        Top = 24
        Width = 113
        Height = 21
        Hint = ''
        Text = '5 minutes'
        Items.Strings = (
          '0 minutes'
          '5 minutes'
          '10 minutes'
          '15 minutes'
          '30 minutes'
          '1 hours'
          '2 hours'
          '3 hours'
          '4 hours'
          '5 hours'
          '6 hours'
          '7 hours'
          '8 hours'
          '9 hours'
          '10 hours'
          '11 hours'
          '0.5 days'
          '1 days'
          '2 days'
          '3 days'
          '4 days'
          '18 hours'
          '1 weeks'
          '2 weeks')
        ItemIndex = 1
        TabOrder = 2
        OnChange = DoDurationChange
      end
      object chkAllDay: TUniCheckBox
        Left = 360
        Top = 48
        Width = 177
        Height = 17
        Hint = ''
        Caption = 'All-day event'
        TabOrder = 3
        OnClick = chkAllDayClick
      end
    end
  end
  object PnlPattern: TUniPanel
    Left = 0
    Top = 78
    Width = 566
    Height = 130
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object gbPattern: TUniGroupBox
      Left = 1
      Top = 1
      Width = 564
      Height = 128
      Hint = ''
      Caption = ' Recurrence Pattern '
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object PnlPatternClient1: TUniPanel
        Left = 2
        Top = 15
        Width = 560
        Height = 111
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object PnlPatternOption: TUniPanel
          Left = 1
          Top = 1
          Width = 110
          Height = 109
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          DesignSize = (
            110
            109)
          object bvPatternOption: TUniPanel
            Left = 107
            Top = 1
            Width = 3
            Height = 100
            Hint = ''
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 5
            Caption = ''
          end
          object rbDaily: TUniRadioButton
            Left = 8
            Top = 4
            Width = 94
            Height = 17
            Hint = ''
            Anchors = [akLeft, akTop, akRight]
            Checked = True
            Caption = 'Daily'
            TabOrder = 0
            OnClick = DoPatternChoiceRadioBtnClick
          end
          object rbWeekly: TUniRadioButton
            Tag = 1
            Left = 8
            Top = 24
            Width = 94
            Height = 17
            Hint = ''
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Weekly'
            TabOrder = 1
            OnClick = DoPatternChoiceRadioBtnClick
          end
          object rbMonthly: TUniRadioButton
            Tag = 2
            Left = 8
            Top = 44
            Width = 94
            Height = 17
            Hint = ''
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Monthly'
            TabOrder = 2
            OnClick = DoPatternChoiceRadioBtnClick
          end
          object rbYearly: TUniRadioButton
            Tag = 3
            Left = 8
            Top = 66
            Width = 94
            Height = 17
            Hint = ''
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Yearly'
            TabOrder = 3
            OnClick = DoPatternChoiceRadioBtnClick
          end
        end
        object PnlPatternPageCarrier: TUniPanel
          Left = 110
          Top = 1
          Width = 450
          Height = 109
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object pcPattern: TUniPageControl
            Left = 1
            Top = 1
            Width = 448
            Height = 107
            Hint = ''
            ActivePage = TabPatternMonthly
            TabBarVisible = True
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            object TabPatternDaily: TUniTabSheet
              Hint = ''
              Caption = 'TabPatternDaily'
              object Panel1: TUniPanel
                Tag = 1999
                Left = 0
                Top = 0
                Width = 440
                Height = 79
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 0
                Caption = ''
                object lblEveryXDay: TUniLabel
                  Left = 152
                  Top = 12
                  Width = 31
                  Height = 13
                  Hint = ''
                  Caption = 'day(s)'
                  TabOrder = 4
                end
                object rbEveryXDay: TUniRadioButton
                  Tag = 1
                  Left = 8
                  Top = 10
                  Width = 81
                  Height = 17
                  Hint = ''
                  Checked = True
                  Caption = 'Every'
                  TabOrder = 0
                end
                object edtEveryXDay: TUniEdit
                  Left = 96
                  Top = 8
                  Width = 33
                  Height = 21
                  Hint = ''
                  MaxLength = 2
                  Text = '1'
                  TabOrder = 1
                  OnChange = DoEditChange_Day
                  OnExit = DoEditBoxExit
                end
                object rbPatternDailyEveryWeekday: TUniRadioButton
                  Tag = 2
                  Left = 8
                  Top = 34
                  Width = 113
                  Height = 17
                  Hint = ''
                  Caption = 'Every weekday'
                  TabOrder = 2
                end
              end
            end
            object TabPatternWeekly: TUniTabSheet
              Hint = ''
              ImageIndex = 1
              Caption = 'TabPatternWeekly'
              object PnlWeekly: TUniPanel
                Tag = 1999
                Left = 0
                Top = 0
                Width = 440
                Height = 79
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 0
                Caption = ''
                object lblRecurPatternWeekly: TUniLabel
                  Left = 8
                  Top = 12
                  Width = 59
                  Height = 13
                  Hint = ''
                  Caption = 'Recur every'
                  TabOrder = 9
                end
                object Label1: TUniLabel
                  Left = 152
                  Top = 12
                  Width = 57
                  Height = 13
                  Hint = ''
                  Caption = 'week(s) on:'
                  TabOrder = 10
                end
                object edtRecurEveryXWeek: TUniEdit
                  Left = 96
                  Top = 8
                  Width = 33
                  Height = 21
                  Hint = ''
                  MaxLength = 2
                  Text = '1'
                  TabOrder = 0
                  OnExit = DoEditBoxExit
                end
                object chkSunday: TUniCheckBox
                  Tag = 1
                  Left = 8
                  Top = 32
                  Width = 97
                  Height = 17
                  Hint = ''
                  Caption = 'Sunday'
                  TabOrder = 1
                end
                object chkThursday: TUniCheckBox
                  Tag = 5
                  Left = 8
                  Top = 48
                  Width = 97
                  Height = 17
                  Hint = ''
                  Caption = 'Thursday'
                  TabOrder = 2
                end
                object chkMonday: TUniCheckBox
                  Tag = 2
                  Left = 112
                  Top = 32
                  Width = 97
                  Height = 17
                  Hint = ''
                  Caption = 'Monday'
                  TabOrder = 3
                end
                object chkFriday: TUniCheckBox
                  Tag = 6
                  Left = 112
                  Top = 48
                  Width = 97
                  Height = 17
                  Hint = ''
                  Caption = 'Friday'
                  TabOrder = 4
                end
                object chkTuesday: TUniCheckBox
                  Tag = 3
                  Left = 216
                  Top = 32
                  Width = 97
                  Height = 17
                  Hint = ''
                  Caption = 'Tuesday'
                  TabOrder = 5
                end
                object chkSaturday: TUniCheckBox
                  Tag = 7
                  Left = 216
                  Top = 48
                  Width = 97
                  Height = 17
                  Hint = ''
                  Caption = 'Saturday'
                  TabOrder = 6
                end
                object chkWednesday: TUniCheckBox
                  Tag = 4
                  Left = 326
                  Top = 32
                  Width = 97
                  Height = 17
                  Hint = ''
                  Caption = 'Wednesday'
                  TabOrder = 7
                end
              end
            end
            object TabPatternMonthly: TUniTabSheet
              Hint = ''
              ImageIndex = 2
              Caption = 'TabPatternMonthly'
              object Panel3: TUniPanel
                Tag = 1999
                Left = 0
                Top = 0
                Width = 440
                Height = 79
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 0
                Caption = ''
                object Label2: TUniLabel
                  Left = 144
                  Top = 12
                  Width = 41
                  Height = 13
                  Hint = ''
                  Caption = 'of every'
                  TabOrder = 5
                end
                object Label3: TUniLabel
                  Left = 272
                  Top = 12
                  Width = 43
                  Height = 13
                  Hint = ''
                  Caption = 'month(s)'
                  TabOrder = 7
                end
                object Label4: TUniLabel
                  Left = 272
                  Top = 36
                  Width = 41
                  Height = 13
                  Hint = ''
                  Caption = 'of every'
                  TabOrder = 8
                end
                object Label5: TUniLabel
                  Left = 368
                  Top = 36
                  Width = 43
                  Height = 13
                  Hint = ''
                  Caption = 'month(s)'
                  TabOrder = 9
                end
                object rbPatternMonthlyDayXOf1: TUniRadioButton
                  Tag = 1
                  Left = 8
                  Top = 10
                  Width = 81
                  Height = 17
                  Hint = ''
                  Checked = True
                  Caption = 'Day'
                  TabOrder = 0
                end
                object edtPatternMonthlyDayXOf: TUniEdit
                  Left = 96
                  Top = 8
                  Width = 33
                  Height = 21
                  Hint = ''
                  MaxLength = 2
                  Text = '1'
                  TabOrder = 1
                  OnChange = DoEditChange_Month1
                  OnExit = edtPatternMonthlyDayXOfExit
                end
                object edtPatternMonthlyEveryXMonth1: TUniEdit
                  Left = 208
                  Top = 8
                  Width = 33
                  Height = 21
                  Hint = ''
                  MaxLength = 2
                  Text = '1'
                  TabOrder = 2
                  OnChange = DoEditChange_Month1
                  OnExit = DoEditBoxExit
                end
                object rbPatternMonthlyDayXOf2: TUniRadioButton
                  Tag = 2
                  Left = 8
                  Top = 34
                  Width = 81
                  Height = 17
                  Hint = ''
                  Caption = 'The'
                  TabOrder = 3
                end
                object cmbPatternMonthlyCount: TUniComboBox
                  Left = 96
                  Top = 32
                  Width = 81
                  Height = 21
                  Hint = ''
                  Style = csDropDownList
                  Text = ''
                  Items.Strings = (
                    'first'
                    'second'
                    'third'
                    'fourth'
                    'last')
                  TabOrder = 10
                  OnChange = DoEditChange_Month2
                end
                object cmbPatternMonthlyDay: TUniComboBox
                  Left = 180
                  Top = 32
                  Width = 85
                  Height = 21
                  Hint = ''
                  Style = csDropDownList
                  Text = ''
                  TabOrder = 11
                  OnChange = DoEditChange_Month2
                end
                object edtPatternMonthlyEveryXMonth2: TUniEdit
                  Left = 320
                  Top = 32
                  Width = 33
                  Height = 21
                  Hint = ''
                  MaxLength = 2
                  Text = '1'
                  TabOrder = 6
                  OnChange = DoEditChange_Month2
                  OnExit = DoEditBoxExit
                end
              end
            end
            object TabPatternYearly: TUniTabSheet
              Hint = ''
              ImageIndex = 3
              Caption = 'TabPatternYearly'
              object Panel4: TUniPanel
                Tag = 1999
                Left = 0
                Top = 0
                Width = 440
                Height = 79
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 0
                Caption = ''
                object Label6: TUniLabel
                  Left = 272
                  Top = 36
                  Width = 10
                  Height = 13
                  Hint = ''
                  Caption = 'of'
                  TabOrder = 4
                end
                object rbPatternYearlyEvery: TUniRadioButton
                  Tag = 1
                  Left = 8
                  Top = 10
                  Width = 81
                  Height = 17
                  Hint = ''
                  Checked = True
                  Caption = 'Every'
                  TabOrder = 0
                end
                object cmbPatternYearlyMonth1: TUniComboBox
                  Left = 96
                  Top = 8
                  Width = 105
                  Height = 21
                  Hint = ''
                  Style = csDropDownList
                  Text = ''
                  TabOrder = 5
                  OnChange = DoEditChange_Year1
                end
                object edtPatternYearlyMonthDay: TUniEdit
                  Left = 205
                  Top = 8
                  Width = 33
                  Height = 21
                  Hint = ''
                  MaxLength = 2
                  Text = '1'
                  TabOrder = 2
                  OnChange = DoEditChange_Year1
                  OnExit = edtPatternYearlyMonthDayExit
                end
                object rbPatternYearlyInterval: TUniRadioButton
                  Tag = 2
                  Left = 8
                  Top = 34
                  Width = 81
                  Height = 17
                  Hint = ''
                  Caption = 'The'
                  TabOrder = 3
                end
                object cmbPatternYearlyCount: TUniComboBox
                  Left = 96
                  Top = 32
                  Width = 81
                  Height = 21
                  Hint = ''
                  Style = csDropDownList
                  Text = ''
                  Items.Strings = (
                    'first'
                    'second'
                    'third'
                    'fourth'
                    'last')
                  TabOrder = 6
                  OnChange = DoEditChange_Year2
                end
                object cmbPatternYearlyDay: TUniComboBox
                  Left = 180
                  Top = 32
                  Width = 85
                  Height = 21
                  Hint = ''
                  Style = csDropDownList
                  Text = ''
                  TabOrder = 7
                  OnChange = DoEditChange_Year2
                end
                object cmbPatternYearlyMonth2: TUniComboBox
                  Left = 288
                  Top = 32
                  Width = 105
                  Height = 21
                  Hint = ''
                  Style = csDropDownList
                  Text = ''
                  TabOrder = 8
                  OnChange = DoEditChange_Year2
                end
              end
            end
          end
        end
      end
    end
  end
  object PnlRange: TUniPanel
    Left = 0
    Top = 208
    Width = 566
    Height = 86
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object gbRange: TUniGroupBox
      Left = 1
      Top = 1
      Width = 564
      Height = 84
      Hint = ''
      Caption = ' Range of Recurrence '
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object lblStartDate: TUniLabel
        Left = 16
        Top = 28
        Width = 24
        Height = 13
        Hint = ''
        Caption = 'Start'
        TabOrder = 6
      end
      object Label7: TUniLabel
        Left = 352
        Top = 28
        Width = 66
        Height = 13
        Hint = ''
        Caption = 'occurrence(s)'
        TabOrder = 7
      end
      object cmbStartDate: TUniDateTimePicker
        Left = 64
        Top = 24
        Width = 121
        Height = 21
        Hint = ''
        DateTime = 42684.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 0
      end
      object rbRangeEndAfter: TUniRadioButton
        Left = 224
        Top = 26
        Width = 81
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'End after:'
        TabOrder = 1
      end
      object edtEndAfterCount: TUniEdit
        Left = 304
        Top = 24
        Width = 33
        Height = 21
        Hint = ''
        Text = '1'
        TabOrder = 2
        OnChange = DoEditChange_Range1
        OnExit = DoEditBoxExit
      end
      object rbRangeEndBy: TUniRadioButton
        Left = 224
        Top = 50
        Width = 81
        Height = 17
        Hint = ''
        Caption = 'End by:'
        TabOrder = 3
      end
      object cmbEndByDate: TUniDateTimePicker
        Left = 304
        Top = 48
        Width = 121
        Height = 21
        Hint = ''
        DateTime = 42684.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 4
        OnChange = DoEditChange_Range2
      end
    end
  end
  object PnlButtons: TUniPanel
    Left = 0
    Top = 294
    Width = 566
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 3
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Left = 175
      Top = 1
      Width = 391
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniBitBtn
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 0
        Default = True
        OnClick = btnOkClick
      end
      object btnCancel: TUniBitBtn
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
      end
      object btnRemove: TUniBitBtn
        Left = 208
        Top = 8
        Width = 177
        Height = 25
        Hint = ''
        Caption = 'Remove Recurrence'
        ModalResult = 1
        TabOrder = 2
        OnClick = btnRemoveClick
      end
    end
  end
end
