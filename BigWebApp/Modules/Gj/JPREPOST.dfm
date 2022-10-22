object FrmPrePost: TFrmPrePost
  Left = 301
  Top = 201
  ClientHeight = 311
  ClientWidth = 509
  Caption = 'Create New Group'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 273
    Width = 509
    Height = 38
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel3: TUniPanel
      Left = 302
      Top = 1
      Width = 207
      Height = 36
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnOk: TUniButton
        Left = 1
        Top = 6
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 1
        OnClick = BtnOkClick
      end
      object BtnCancel: TUniButton
        Left = 104
        Top = 6
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        TabOrder = 2
        OnClick = BtnCancelClick
      end
    end
  end
  object PnlHeader: TUniPanel
    Left = 0
    Top = 0
    Width = 509
    Height = 73
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object Label1: TUniLabel
      Left = 8
      Top = 9
      Width = 56
      Height = 13
      Hint = ''
      Caption = 'Group Type'
      TabOrder = 2
    end
    object ListBoxType: TUniListBox
      Left = 103
      Top = 8
      Width = 114
      Height = 59
      Hint = ''
      Items.Strings = (
        'FREE FORM'
        'RECURRING'
        'REVERSING'
        'STATISTICAL')
      TabOrder = 0
      OnClick = ListBoxTypeClick
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 73
    Width = 509
    Height = 200
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object PageControl1: TUniPageControl
      Left = 1
      Top = 1
      Width = 507
      Height = 198
      Hint = ''
      ActivePage = TabRecurring
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabFreeForm: TUniTabSheet
        Hint = ''
        HelpContext = 1007630
        TabVisible = False
        Caption = 'TabFreeForm'
        object Splitter2: TUniSplitter
          Left = 222
          Top = 17
          Width = 6
          Height = 153
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object DBGridPeriod2: TUniDBGrid
          Left = 228
          Top = 17
          Width = 271
          Height = 153
          Hint = ''
          DataSource = SrcGlPeriods
          ReadOnly = True
          LoadMask.Message = 'Loading data...'
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Columns = <
            item
              FieldName = 'PERIOD'
              Title.Caption = 'Period'
              Width = 38
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'START_DATE'
              Title.Caption = 'Start Date'
              Width = 71
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'END_DATE'
              Title.Caption = 'End Date'
              Width = 68
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
        object Panel7: TUniPanel
          Left = 0
          Top = 17
          Width = 222
          Height = 153
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 1
          Caption = ''
          object GridYear2: TUniDBGrid
            Left = 1
            Top = 1
            Width = 220
            Height = 151
            Hint = ''
            DataSource = SrcGlYear
            ReadOnly = True
            LoadMask.Message = 'Loading data...'
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Columns = <
              item
                FieldName = 'DESCRIP'
                Title.Caption = 'GL Year'
                Width = 56
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'START_DATE'
                Title.Caption = 'Start Date'
                Width = 65
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'END_DATE'
                Title.Caption = 'End Date'
                Width = 66
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'EPLANT_ID'
                Title.Caption = 'EPlant ID'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end>
          end
        end
        object Panel8: TUniPanel
          Left = 0
          Top = 0
          Width = 499
          Height = 17
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          Alignment = taLeftJustify
          Caption = 'Please Choose GL Year and Period'
        end
      end
      object TabRecurring: TUniTabSheet
        Hint = ''
        HelpContext = 1011066
        TabVisible = False
        Caption = 'TabRecurring'
        object PageControl2: TUniPageControl
          Left = 0
          Top = 0
          Width = 499
          Height = 170
          Hint = ''
          ActivePage = TabQuarter
          TabBarVisible = True
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          object TabPeriod: TUniTabSheet
            Hint = ''
            Caption = 'By Period'
            object Splitter1: TUniSplitter
              Left = 217
              Top = 22
              Width = 6
              Height = 95
              Hint = ''
              Align = alLeft
              ParentColor = False
              Color = clBtnFace
            end
            object Panel5: TUniPanel
              Left = 0
              Top = 117
              Width = 491
              Height = 25
              Hint = ''
              Align = alBottom
              Anchors = [akLeft, akRight, akBottom]
              TabOrder = 0
              Caption = ''
              object Panel10: TUniPanel
                Left = 1
                Top = 1
                Width = 143
                Height = 23
                Hint = ''
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                TabOrder = 0
                Caption = ''
                object lblNumberOfPeriods: TUniLabel
                  Left = 2
                  Top = 7
                  Width = 88
                  Height = 13
                  Hint = ''
                  Caption = 'Number of Periods'
                  TabOrder = 1
                end
              end
              object EditPeriods: TUniEdit
                Left = 128
                Top = 3
                Width = 63
                Height = 21
                Hint = ''
                Text = ''
                TabOrder = 1
                OnKeyPress = EditPeriodsKeyPress
              end
            end
            object GridPeriod1: TUniDBGrid
              Left = 223
              Top = 22
              Width = 268
              Height = 95
              Hint = ''
              DataSource = SrcGlPeriods
              ReadOnly = True
              LoadMask.Message = 'Loading data...'
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Columns = <
                item
                  FieldName = 'PERIOD'
                  Title.Caption = 'Period'
                  Width = 46
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'START_DATE'
                  Title.Caption = 'Start Date'
                  Width = 112
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'END_DATE'
                  Title.Caption = 'End Date'
                  Width = 112
                  CheckBoxField.FieldValues = 'true;false'
                end>
            end
            object Panel6: TUniPanel
              Left = 0
              Top = 22
              Width = 217
              Height = 95
              Hint = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 2
              Caption = ''
              object GridYear1: TUniDBGrid
                Left = 1
                Top = 1
                Width = 215
                Height = 93
                Hint = ''
                DataSource = SrcGlYear
                ReadOnly = True
                LoadMask.Message = 'Loading data...'
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 0
                Columns = <
                  item
                    FieldName = 'DESCRIP'
                    Title.Caption = 'Description'
                    Width = 88
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'START_DATE'
                    Title.Caption = 'Start Date'
                    Width = 63
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'END_DATE'
                    Title.Caption = 'End Date'
                    Width = 63
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'EPLANT_ID'
                    Title.Caption = 'EPlant ID'
                    Width = 64
                    CheckBoxField.FieldValues = 'true;false'
                  end>
              end
            end
            object Panel9: TUniPanel
              Left = 0
              Top = 0
              Width = 491
              Height = 22
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 3
              Alignment = taLeftJustify
              Caption = ''
              object Label16: TUniLabel
                Left = 1
                Top = 3
                Width = 164
                Height = 13
                Hint = ''
                Caption = 'Please Choose GL Year and Period'
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                TabOrder = 1
              end
              object bvTopBuffer: TUniPanel
                Left = 1
                Top = 1
                Width = 489
                Height = 3
                Hint = ''
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
                Caption = ''
              end
              object bvBottomBuffer: TUniPanel
                Left = 1
                Top = 19
                Width = 489
                Height = 3
                Hint = ''
                Align = alBottom
                Anchors = [akLeft, akRight, akBottom]
                TabOrder = 3
                Caption = ''
              end
            end
          end
          object TabMonth: TUniTabSheet
            Hint = ''
            Caption = 'Monthly'
            object Splitter4: TUniSplitter
              Left = 130
              Top = 0
              Width = 6
              Height = 142
              Hint = ''
              Align = alLeft
              ParentColor = False
              Color = clBtnFace
            end
            object PnlMonthlyLeft1: TUniPanel
              Left = 0
              Top = 0
              Width = 130
              Height = 142
              Hint = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 0
              Caption = ''
              object Splitter3: TUniSplitter
                Left = 50
                Top = 0
                Width = 6
                Height = 142
                Hint = ''
                Align = alLeft
                ParentColor = False
                Color = clBtnFace
              end
              object PnlMonthlyLeft2: TUniPanel
                Left = 1
                Top = 1
                Width = 50
                Height = 140
                Hint = ''
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                TabOrder = 0
                Caption = ''
                object Label8: TUniLabel
                  Left = 8
                  Top = 21
                  Width = 22
                  Height = 13
                  Hint = ''
                  Caption = 'Year'
                  TabOrder = 1
                end
              end
              object PnlClient02: TUniPanel
                Left = 56
                Top = 1
                Width = 74
                Height = 140
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
                Caption = ''
                object EditMonthlyYear: TUniSpinEdit
                  Left = 1
                  Top = 16
                  Width = 67
                  Height = 22
                  Hint = ''
                  Value = 2500
                  MaxValue = 2500
                  MinValue = 1940
                  TabOrder = 0
                end
              end
            end
            object Panel4: TUniPanel
              Left = 136
              Top = 0
              Width = 355
              Height = 142
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              object Splitter5: TUniSplitter
                Left = 120
                Top = 0
                Width = 6
                Height = 142
                Hint = ''
                Align = alLeft
                ParentColor = False
                Color = clBtnFace
              end
              object PnlMonthlyLeft3: TUniPanel
                Left = 1
                Top = 1
                Width = 120
                Height = 140
                Hint = ''
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                TabOrder = 0
                Caption = ''
                object Label9: TUniLabel
                  Left = 8
                  Top = 20
                  Width = 30
                  Height = 13
                  Hint = ''
                  Caption = 'Month'
                  TabOrder = 1
                end
                object Label3: TUniLabel
                  Left = 8
                  Top = 44
                  Width = 88
                  Height = 13
                  Hint = ''
                  Caption = 'Number of Months'
                  TabOrder = 2
                end
                object Label2: TUniLabel
                  Left = 8
                  Top = 72
                  Width = 28
                  Height = 13
                  Hint = ''
                  Caption = 'Every'
                  TabOrder = 3
                end
              end
              object Panel12: TUniPanel
                Left = 126
                Top = 1
                Width = 229
                Height = 140
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
                Caption = ''
                object EditMonthlyMonth: TUniSpinEdit
                  Left = 6
                  Top = 16
                  Width = 75
                  Height = 22
                  Hint = ''
                  MaxValue = 12
                  MinValue = 1
                  TabOrder = 0
                end
                object RBMonth1st: TUniRadioButton
                  Left = 7
                  Top = 72
                  Width = 163
                  Height = 17
                  Hint = ''
                  Caption = 'First day of the month'
                  TabOrder = 1
                end
                object RBMonth15th: TUniRadioButton
                  Left = 7
                  Top = 96
                  Width = 171
                  Height = 17
                  Hint = ''
                  Caption = '15th day of the month'
                  TabOrder = 2
                end
                object EditMonthlyCycle: TUniSpinEdit
                  Left = 6
                  Top = 40
                  Width = 74
                  Height = 22
                  Hint = ''
                  Value = 1
                  MaxValue = 999
                  TabOrder = 3
                end
              end
            end
          end
          object TabQuarter: TUniTabSheet
            Hint = ''
            Caption = 'Quarterly'
            object Splitter7: TUniSplitter
              Left = 130
              Top = 0
              Width = 6
              Height = 142
              Hint = ''
              Align = alLeft
              ParentColor = False
              Color = clBtnFace
            end
            object PnlQuarterlyLeft1: TUniPanel
              Left = 0
              Top = 0
              Width = 130
              Height = 142
              Hint = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 0
              Caption = ''
              object Splitter6: TUniSplitter
                Left = 50
                Top = 0
                Width = 6
                Height = 142
                Hint = ''
                Align = alLeft
                ParentColor = False
                Color = clBtnFace
              end
              object PnlQuarterlyLeft2: TUniPanel
                Left = 1
                Top = 1
                Width = 50
                Height = 140
                Hint = ''
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                TabOrder = 0
                Caption = ''
                object Label14: TUniLabel
                  Left = 8
                  Top = 21
                  Width = 22
                  Height = 13
                  Hint = ''
                  Caption = 'Year'
                  TabOrder = 1
                end
              end
              object Panel11: TUniPanel
                Left = 56
                Top = 1
                Width = 74
                Height = 140
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
                Caption = ''
                object EditQuarterYear: TUniSpinEdit
                  Left = 1
                  Top = 16
                  Width = 67
                  Height = 22
                  Hint = ''
                  Value = 2500
                  MaxValue = 2500
                  MinValue = 1940
                  TabOrder = 0
                end
              end
            end
            object Panel13: TUniPanel
              Left = 136
              Top = 0
              Width = 355
              Height = 142
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              object Splitter8: TUniSplitter
                Left = 120
                Top = 0
                Width = 6
                Height = 142
                Hint = ''
                Align = alLeft
                ParentColor = False
                Color = clBtnFace
              end
              object PnlQuarterlyLeft3: TUniPanel
                Left = 1
                Top = 1
                Width = 120
                Height = 140
                Hint = ''
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                TabOrder = 0
                Caption = ''
                object Label15: TUniLabel
                  Left = 8
                  Top = 20
                  Width = 30
                  Height = 13
                  Hint = ''
                  Caption = 'Month'
                  TabOrder = 1
                end
                object Label13: TUniLabel
                  Left = 8
                  Top = 44
                  Width = 96
                  Height = 13
                  Hint = ''
                  Caption = 'Number of Quarters'
                  TabOrder = 2
                end
                object Label6: TUniLabel
                  Left = 8
                  Top = 72
                  Width = 28
                  Height = 13
                  Hint = ''
                  Caption = 'Every'
                  TabOrder = 3
                end
              end
              object Panel15: TUniPanel
                Left = 126
                Top = 1
                Width = 229
                Height = 140
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
                Caption = ''
                object EditQuarterMonth: TUniSpinEdit
                  Left = 1
                  Top = 16
                  Width = 73
                  Height = 22
                  Hint = ''
                  Value = 12
                  MaxValue = 12
                  MinValue = 1
                  TabOrder = 0
                end
                object RBQuarter1st: TUniRadioButton
                  Left = 1
                  Top = 72
                  Width = 211
                  Height = 17
                  Hint = ''
                  Caption = 'First day of the month'
                  TabOrder = 1
                end
                object RBQuarter15th: TUniRadioButton
                  Left = 1
                  Top = 96
                  Width = 203
                  Height = 17
                  Hint = ''
                  Caption = '15th day of the month'
                  TabOrder = 2
                end
                object EditQuarterCycle: TUniSpinEdit
                  Left = 1
                  Top = 40
                  Width = 74
                  Height = 22
                  Hint = ''
                  Value = 12
                  MaxValue = 999
                  TabOrder = 3
                end
              end
            end
          end
          object TabBiWeekly: TUniTabSheet
            Hint = ''
            Caption = 'Bi-Weekly'
            object PnlBiWeekly: TUniPanel
              Left = 0
              Top = 0
              Width = 491
              Height = 142
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
              Caption = ''
              object Splitter9: TUniSplitter
                Left = 120
                Top = 0
                Width = 6
                Height = 142
                Hint = ''
                Align = alLeft
                ParentColor = False
                Color = clBtnFace
              end
              object PnlBiWeeklyLeft1: TUniPanel
                Left = 1
                Top = 1
                Width = 120
                Height = 140
                Hint = ''
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                TabOrder = 0
                Caption = ''
                object Label4: TUniLabel
                  Left = 8
                  Top = 20
                  Width = 50
                  Height = 13
                  Hint = ''
                  Caption = 'Start Date'
                  TabOrder = 1
                end
                object Label5: TUniLabel
                  Left = 8
                  Top = 44
                  Width = 84
                  Height = 13
                  Hint = ''
                  Caption = 'Number of Cycles'
                  TabOrder = 2
                end
              end
              object Panel14: TUniPanel
                Left = 126
                Top = 1
                Width = 365
                Height = 140
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
                Caption = ''
                object EditBiWeeklyDate: TUniDBDateTimePicker
                  Left = 1
                  Top = 16
                  Width = 120
                  Height = 21
                  Hint = ''
                  DateTime = 42630.000000000000000000
                  DateFormat = 'dd/MM/yyyy'
                  TimeFormat = 'HH:mm:ss'
                  TabOrder = 0
                end
                object EditBiWeeklyCycles: TUniSpinEdit
                  Left = 1
                  Top = 40
                  Width = 74
                  Height = 22
                  Hint = ''
                  Value = 1
                  MaxValue = 999
                  TabOrder = 1
                end
              end
            end
          end
          object TabNth: TUniTabSheet
            Hint = ''
            Caption = 'Every Nth Day'
            object PnlClient01: TUniPanel
              Left = 0
              Top = 0
              Width = 491
              Height = 142
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
              Caption = ''
              object Splitter10: TUniSplitter
                Left = 120
                Top = 0
                Width = 6
                Height = 142
                Hint = ''
                Align = alLeft
                ParentColor = False
                Color = clBtnFace
              end
              object PnlEveryNLeft1: TUniPanel
                Left = 1
                Top = 1
                Width = 120
                Height = 140
                Hint = ''
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                TabOrder = 0
                Caption = ''
                object Label10: TUniLabel
                  Left = 8
                  Top = 20
                  Width = 50
                  Height = 13
                  Hint = ''
                  Caption = 'Start Date'
                  TabOrder = 1
                end
                object Label11: TUniLabel
                  Left = 8
                  Top = 44
                  Width = 84
                  Height = 13
                  Hint = ''
                  Caption = 'Number of Cycles'
                  TabOrder = 2
                end
                object Label12: TUniLabel
                  Left = 8
                  Top = 68
                  Width = 73
                  Height = 13
                  Hint = ''
                  Caption = 'Days in a Cycle'
                  TabOrder = 3
                end
              end
              object Panel16: TUniPanel
                Left = 126
                Top = 1
                Width = 365
                Height = 140
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
                Caption = ''
                object EditNthDate: TUniDBDateTimePicker
                  Left = 1
                  Top = 16
                  Width = 119
                  Height = 21
                  Hint = ''
                  DateTime = 42630.000000000000000000
                  DateFormat = 'dd/MM/yyyy'
                  TimeFormat = 'HH:mm:ss'
                  TabOrder = 0
                end
                object EditNthCycles: TUniSpinEdit
                  Left = 1
                  Top = 41
                  Width = 74
                  Height = 22
                  Hint = ''
                  Value = 1
                  MaxValue = 999
                  TabOrder = 1
                end
                object EditNthDays: TUniSpinEdit
                  Left = 1
                  Top = 66
                  Width = 74
                  Height = 22
                  Hint = ''
                  Value = 1
                  MaxValue = 999
                  TabOrder = 2
                end
              end
            end
          end
        end
      end
    end
  end
  object SrcGlYear: TDataSource
    DataSet = TblGlYear
    Left = 304
    Top = 11
  end
  object TblGlYear: TFDTable
    Filtered = True
    OnFilterRecord = TblGlYearFilterRecord
    IndexName = 'PK_GLYEAR'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'GLYEAR'
    TableName = 'GLYEAR'
    Left = 328
    Top = 8
    object TblGlYearID: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object TblGlYearDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Required = True
      Size = 25
    end
    object TblGlYearSTART_DATE: TDateTimeField
      FieldName = 'START_DATE'
      Required = True
    end
    object TblGlYearEND_DATE: TDateTimeField
      FieldName = 'END_DATE'
      Required = True
    end
    object TblGlYearEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object SrcGlPeriods: TDataSource
    DataSet = TblGlPeriods
    Left = 364
    Top = 10
  end
  object SrcGlPrePost: TDataSource
    DataSet = TblGlPrePost
    Left = 356
    Top = 46
  end
  object TblGlPrePost: TFDTable
    BeforePost = TblGlPrePostBeforePost
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'GLPREPOST'
    TableName = 'GLPREPOST'
    Left = 376
    Top = 48
    object TblGlPrePostID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object TblGlPrePostTYPE: TStringField
      FieldName = 'TYPE'
    end
    object TblGlPrePostTOTAL_CYCLES: TBCDField
      FieldName = 'TOTAL_CYCLES'
      Size = 0
    end
    object TblGlPrePostFREQUENCY: TStringField
      FieldName = 'FREQUENCY'
    end
    object TblGlPrePostSTART_DATE: TDateTimeField
      FieldName = 'START_DATE'
    end
    object TblGlPrePostEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object SrcGlPrePostCycle: TDataSource
    DataSet = TblGlPrePostCycle
    Left = 248
    Top = 11
  end
  object TblGlPrePostCycle: TFDTable
    BeforePost = TblGlPrePostCycleBeforePost
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'GLPREPOST_CYCLE'
    TableName = 'GLPREPOST_CYCLE'
    Left = 264
    Top = 16
    object TblGlPrePostCycleID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object TblGlPrePostCycleGLPREPOST_ID: TBCDField
      FieldName = 'GLPREPOST_ID'
      Size = 0
    end
    object TblGlPrePostCycleCYCLE_DATE: TDateTimeField
      FieldName = 'CYCLE_DATE'
    end
    object TblGlPrePostCycleCYCLE_NUMBER: TBCDField
      FieldName = 'CYCLE_NUMBER'
      Size = 0
    end
  end
  object TblGlPeriods: TFDQuery
    MasterSource = SrcGlYear
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from glperiods'
      'where glyear_id  = :ID'
      'order by period')
    Left = 376
    Top = 8
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object TblGlPeriodsID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.GLPERIODS.ID'
      Size = 0
    end
    object TblGlPeriodsGLYEAR_ID: TBCDField
      FieldName = 'GLYEAR_ID'
      Origin = 'IQ.GLPERIODS.GLYEAR_ID'
      Size = 0
    end
    object TblGlPeriodsPERIOD: TBCDField
      FieldName = 'PERIOD'
      Origin = 'IQ.GLPERIODS.PERIOD'
      Size = 0
    end
    object TblGlPeriodsSTART_DATE: TDateTimeField
      FieldName = 'START_DATE'
      Origin = 'IQ.GLPERIODS.START_DATE'
    end
    object TblGlPeriodsEND_DATE: TDateTimeField
      FieldName = 'END_DATE'
      Origin = 'IQ.GLPERIODS.END_DATE'
    end
    object TblGlPeriodsSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'IQ.GLPERIODS.STATUS'
      Size = 2
    end
  end
end
