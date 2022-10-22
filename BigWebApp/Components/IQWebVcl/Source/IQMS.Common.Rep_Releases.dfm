object FrmRepeatingReleases: TFrmRepeatingReleases
  Left = 0
  Top = 0
  ClientHeight = 205
  ClientWidth = 523
  Caption = 'Advanced Interval Options'
  Position = poOwnerFormCenter
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlButtons: TUniPanel
    Left = 0
    Top = 166
    Width = 523
    Height = 39
    Hint = ''
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitWidth = 482
    object btnCancel: TUniButton
      Left = 376
      Top = 5
      Width = 97
      Height = 25
      Hint = ''
      Caption = '&Cancel'
      Cancel = True
      ModalResult = 2
      Align = alCustom
      ParentFont = False
      TabOrder = 1
    end
    object btnOK: TUniButton
      Left = 274
      Top = 5
      Width = 97
      Height = 25
      Hint = ''
      Caption = '&OK'
      ModalResult = 1
      ParentFont = False
      TabOrder = 2
      Default = True
    end
  end
  object pnlBody: TUniPanel
    Left = 125
    Top = 0
    Width = 398
    Height = 166
    Hint = ''
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitLeft = 102
    ExplicitWidth = 380
    object pc: TUniPageControl
      Left = 1
      Top = 1
      Width = 396
      Height = 164
      Hint = ''
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      ActivePage = tsWeekly
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      ExplicitWidth = 378
      object tsDaily: TUniTabSheet
        Hint = ''
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Daily'
        ExplicitWidth = 370
        object pnlDaily: TUniPanel
          Left = 0
          Top = 0
          Width = 388
          Height = 136
          Hint = ''
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          ParentFont = False
          TabOrder = 0
          Caption = ''
          ExplicitWidth = 370
          object lblDays: TUniLabel
            Left = 131
            Top = 62
            Width = 31
            Height = 13
            Hint = ''
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'day(s)'
            ParentFont = False
            TabOrder = 4
          end
          object rbtnEverySomeDays: TUniRadioButton
            Left = 51
            Top = 62
            Width = 46
            Height = 14
            Hint = ''
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Checked = True
            Caption = 'Every'
            ParentFont = False
            TabOrder = 0
            OnClick = rbtnEverySomeDaysClick
          end
          object rbtnEveryWeekday: TUniRadioButton
            Left = 51
            Top = 94
            Width = 91
            Height = 14
            Hint = ''
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'Every weekday'
            ParentFont = False
            TabOrder = 1
            OnClick = rbtnEveryWeekdayClick
          end
          object edtDays: TUniEdit
            Left = 102
            Top = 59
            Width = 23
            Height = 21
            Hint = ''
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Text = '1'
            ParentFont = False
            TabOrder = 2
          end
        end
      end
      object tsWeekly: TUniTabSheet
        Hint = ''
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Weekly'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        object pnlWeekly: TUniPanel
          Left = 0
          Top = 0
          Width = 388
          Height = 136
          Hint = ''
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          ParentFont = False
          TabOrder = 0
          Caption = ''
          ExplicitWidth = 370
          object lblRecurEvery: TUniLabel
            Left = 90
            Top = 19
            Width = 59
            Height = 13
            Hint = ''
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'Recur every'
            ParentFont = False
            TabOrder = 3
          end
          object lblWeeksOn: TUniLabel
            Left = 188
            Top = 19
            Width = 57
            Height = 13
            Hint = ''
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'week(s) on:'
            ParentFont = False
            TabOrder = 4
          end
          object GroupBox1: TUniGroupBox
            Left = 13
            Top = 47
            Width = 340
            Height = 82
            Hint = ''
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = ''
            TabOrder = 1
            ParentFont = False
            object cboxSunday: TUniCheckBox
              Left = 9
              Top = 26
              Width = 77
              Height = 13
              Hint = ''
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Checked = True
              Caption = 'Sunday'
              ParentFont = False
              TabOrder = 0
            end
            object cboxMonday: TUniCheckBox
              Left = 91
              Top = 26
              Width = 78
              Height = 13
              Hint = ''
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Monday'
              ParentFont = False
              TabOrder = 1
            end
            object cboxTuesday: TUniCheckBox
              Left = 174
              Top = 26
              Width = 77
              Height = 13
              Hint = ''
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Tuesday'
              ParentFont = False
              TabOrder = 2
            end
            object cboxWednesday: TUniCheckBox
              Left = 256
              Top = 26
              Width = 78
              Height = 13
              Hint = ''
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Wednesday'
              ParentFont = False
              TabOrder = 3
            end
            object cboxThursday: TUniCheckBox
              Left = 9
              Top = 58
              Width = 77
              Height = 13
              Hint = ''
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Thursday'
              ParentFont = False
              TabOrder = 4
            end
            object cboxFriday: TUniCheckBox
              Left = 91
              Top = 58
              Width = 78
              Height = 13
              Hint = ''
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Friday'
              ParentFont = False
              TabOrder = 5
            end
            object cboxSaturday: TUniCheckBox
              Left = 174
              Top = 58
              Width = 77
              Height = 13
              Hint = ''
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Saturday'
              ParentFont = False
              TabOrder = 6
            end
          end
          object edtWeeks: TUniEdit
            Left = 155
            Top = 17
            Width = 27
            Height = 21
            Hint = ''
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Text = '1'
            ParentFont = False
            TabOrder = 0
          end
        end
      end
      object tsMonthly: TUniTabSheet
        Hint = ''
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Monthly'
        ExplicitWidth = 370
        object pnlMonthly: TUniPanel
          Left = 0
          Top = 0
          Width = 388
          Height = 136
          Hint = ''
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          ParentFont = False
          TabOrder = 0
          Caption = ''
          ExplicitWidth = 370
          object lblMonths: TUniLabel
            Left = 188
            Top = 19
            Width = 43
            Height = 13
            Hint = ''
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'month(s)'
            TabOrder = 5
          end
          object lblRecurEveryMonths: TUniLabel
            Left = 90
            Top = 19
            Width = 59
            Height = 13
            Hint = ''
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'Recur every'
            TabOrder = 6
          end
          object rbtnMonthlyDay: TUniRadioButton
            Left = 51
            Top = 62
            Width = 60
            Height = 14
            Hint = ''
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Checked = True
            Caption = 'On day'
            TabOrder = 1
            OnClick = rbtnMonthlyDayClick
          end
          object edtMonthlyDay: TUniEdit
            Left = 116
            Top = 59
            Width = 23
            Height = 21
            Hint = ''
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Text = '1'
            TabOrder = 2
          end
          object edtMonthlyEveryMonths: TUniEdit
            Left = 156
            Top = 17
            Width = 27
            Height = 21
            Hint = ''
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Text = '1'
            TabOrder = 0
          end
          object rbtnMonthlyThe: TUniRadioButton
            Left = 51
            Top = 94
            Width = 49
            Height = 14
            Hint = ''
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'On the'
            TabOrder = 3
            OnClick = rbtnMonthlyTheClick
          end
          object cboxMonthlyDayPos: TUniComboBox
            Left = 105
            Top = 91
            Width = 56
            Height = 21
            Hint = ''
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Text = 'First'
            Items.Strings = (
              'First'
              'Second'
              'Third'
              'Fourth'
              'Last')
            TabOrder = 7
          end
          object cboxMonthlyDayOfWeek: TUniComboBox
            Left = 166
            Top = 91
            Width = 79
            Height = 21
            Hint = ''
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Text = 'Sunday'
            Items.Strings = (
              'Sunday'
              'Monday'
              'Tuesday'
              'Wednesday'
              'Thursday'
              'Friday'
              'Saturday')
            TabOrder = 8
          end
        end
      end
      object tsYearly: TUniTabSheet
        Hint = ''
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        ImageIndex = 3
        Caption = 'Yearly'
        ExplicitWidth = 370
        object pnlYearly: TUniPanel
          Left = 0
          Top = 0
          Width = 388
          Height = 136
          Hint = ''
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          ParentFont = False
          TabOrder = 0
          Caption = ''
          ExplicitWidth = 370
          object lblRecurEveryYears: TUniLabel
            Left = 90
            Top = 19
            Width = 59
            Height = 13
            Hint = ''
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'Recur every'
            ParentFont = False
            TabOrder = 5
          end
          object lblYears: TUniLabel
            Left = 192
            Top = 19
            Width = 35
            Height = 13
            Hint = ''
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'year(s)'
            TabOrder = 6
          end
          object lblOf: TUniLabel
            Left = 254
            Top = 94
            Width = 10
            Height = 13
            Hint = ''
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'of'
            TabOrder = 7
          end
          object edtYears: TUniEdit
            Left = 156
            Top = 17
            Width = 27
            Height = 21
            Hint = ''
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Text = '1'
            TabOrder = 0
          end
          object rbtnYearlyOnMonth: TUniRadioButton
            Left = 51
            Top = 62
            Width = 39
            Height = 14
            Hint = ''
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Checked = True
            Caption = 'On'
            TabOrder = 1
            OnClick = rbtnYearlyOnMonthClick
          end
          object edtYearDayOfMonth: TUniEdit
            Left = 197
            Top = 59
            Width = 27
            Height = 21
            Hint = ''
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Text = '1'
            TabOrder = 3
          end
          object rbtnYearlyOnThe: TUniRadioButton
            Left = 51
            Top = 94
            Width = 55
            Height = 14
            Hint = ''
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'On the'
            ParentFont = False
            TabOrder = 4
            OnClick = rbtnYearlyOnTheClick
          end
          object cboxYearlyMonth: TUniComboBox
            Left = 110
            Top = 59
            Width = 81
            Height = 21
            Hint = ''
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Text = 'January'
            Items.Strings = (
              'January'
              'February'
              'March'
              'April'
              'May'
              'June'
              'July'
              'August'
              'September'
              'October'
              'November'
              'December')
            TabOrder = 8
          end
          object cboxYearlyDayPos: TUniComboBox
            Left = 110
            Top = 91
            Width = 56
            Height = 21
            Hint = ''
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Text = 'First'
            Items.Strings = (
              'First'
              'Second'
              'Third'
              'Fourth'
              'Last')
            TabOrder = 9
          end
          object cboxYearlyDayOfWeek: TUniComboBox
            Left = 171
            Top = 91
            Width = 79
            Height = 21
            Hint = ''
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Text = 'Sunday'
            Items.Strings = (
              'Sunday'
              'Monday'
              'Tuesday'
              'Wednesday'
              'Thursday'
              'Friday'
              'Saturday')
            TabOrder = 10
          end
          object cboxYearlyMonth2: TUniComboBox
            Left = 268
            Top = 91
            Width = 81
            Height = 21
            Hint = ''
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Text = 'January'
            Items.Strings = (
              'January'
              'February'
              'March'
              'April'
              'May'
              'June'
              'July'
              'August'
              'September'
              'October'
              'November'
              'December')
            TabOrder = 11
          end
        end
      end
    end
  end
  object pnlRadioButtons: TUniPanel
    Left = 0
    Top = 0
    Width = 125
    Height = 166
    Hint = ''
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 2
    Caption = ''
    object rgRecurrence: TUniRadioGroup
      Left = 1
      Top = 1
      Width = 123
      Height = 164
      Hint = ''
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Items.Strings = (
        'Daily'
        'Weekly'
        'Monthly'
        'Yearly')
      ItemIndex = 0
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Recurrence Pattern'
      TabOrder = 0
      ParentFont = False
      OnClick = rgRecurrenceClick
      ExplicitWidth = 100
    end
  end
end
