object FrmPrImport: TFrmPrImport
  Left = 487
  Top = 140
  HelpContext = 1103836
  ClientHeight = 660
  ClientWidth = 844
  Caption = 'Import External File'
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 417
    Width = 844
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
    ExplicitTop = 323
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 844
    Height = 417
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object Splitter2: TUniSplitter
      Left = 319
      Top = 1
      Width = 6
      Height = 415
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
      ExplicitHeight = 321
    end
    object PnlPC2Carrier: TUniPanel
      Tag = 1999
      Left = 325
      Top = 1
      Width = 518
      Height = 415
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      ExplicitHeight = 321
      object PC2: TUniPageControl
        Left = 1
        Top = 1
        Width = 516
        Height = 413
        Hint = ''
        ActivePage = TabGeneral
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 356
        ExplicitHeight = 323
        object TabGeneral: TUniTabSheet
          Hint = ''
          Caption = 'TabGeneral'
          ExplicitHeight = 291
          object Panel5: TUniPanel
            Tag = 1999
            Left = 0
            Top = 0
            Width = 508
            Height = 385
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            ExplicitWidth = 348
            ExplicitHeight = 295
            object Splitter3: TUniSplitter
              Left = 1
              Top = 206
              Width = 506
              Height = 3
              Cursor = crVSplit
              Hint = ''
              Align = alTop
              ParentColor = False
              Color = clBtnFace
              ExplicitTop = 114
            end
            object Panel6: TUniPanel
              Left = 1
              Top = 1
              Width = 506
              Height = 205
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              Caption = ''
              object Bevel3: TUniPanel
                Left = 1
                Top = 24
                Width = 504
                Height = 3
                Hint = ''
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 3
                Caption = ''
                ExplicitTop = 48
              end
              object GridTables: TIQUniGridControl
                Left = 1
                Top = 27
                Width = 504
                Height = 177
                Layout = 'border'
                ParentAlignmentControl = False
                AlignmentControl = uniAlignmentClient
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 0
                IQComponents.Grid.Left = 0
                IQComponents.Grid.Top = 29
                IQComponents.Grid.Width = 287
                IQComponents.Grid.Height = 91
                IQComponents.Grid.Hint = ''
                IQComponents.Grid.DataSource = SrcTables
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
                IQComponents.Navigator.DataSource = SrcTables
                IQComponents.Navigator.LayoutConfig.Region = 'east'
                IQComponents.Navigator.TabOrder = 3
                IQComponents.HiddenPanel.Left = 287
                IQComponents.HiddenPanel.Top = 29
                IQComponents.HiddenPanel.Width = 209
                IQComponents.HiddenPanel.Height = 91
                IQComponents.HiddenPanel.Hint = ''
                IQComponents.HiddenPanel.Visible = True
                IQComponents.HiddenPanel.Align = alRight
                IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
                IQComponents.HiddenPanel.ExplicitHeight = 434
                IQComponents.FormTab.Hint = ''
                IQComponents.FormTab.ImageIndex = 1
                IQComponents.FormTab.Caption = 'Form'
                IQComponents.FormTab.Layout = 'border'
                IQComponents.FormTab.ExplicitHeight = 4
                DataSource = SrcTables
                Columns = <
                  item
                    FieldName = 'IQ_TABLE_NAME'
                    Title.Caption = 'IQMS Table'
                    Width = 140
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'IMPORT_SEQ'
                    Title.Caption = 'Import Sequence'
                    Width = 119
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'SQL_STATEMENT'
                    Title.Caption = 'SQL Statement'
                    Width = 91
                    CheckBoxField.FieldValues = 'true;false'
                  end>
                ExplicitTop = 51
                ExplicitHeight = 61
                Marker = 0
              end
              object dbAllTables: TUniDBLookupComboBox
                Left = 8
                Top = 72
                Width = 121
                Height = 21
                Hint = ''
                ListFieldIndex = 0
                TabOrder = 1
                Color = clWindow
              end
              object Panel19: TUniPanel
                Tag = 1999
                Left = 1
                Top = 1
                Width = 504
                Height = 23
                Hint = ''
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 4
                Caption = ''
                object Panel20: TUniPanel
                  Tag = 1999
                  Left = 1
                  Top = 1
                  Width = 502
                  Height = 23
                  Hint = ''
                  Align = alTop
                  Anchors = [akLeft, akTop, akRight]
                  ParentFont = False
                  Font.Color = clWhite
                  TabOrder = 0
                  Caption = ''
                  Color = clBtnShadow
                  object Label11: TUniLabel
                    Left = 1
                    Top = 1
                    Width = 83
                    Height = 13
                    Hint = ''
                    Caption = 'System Tables'
                    Align = alLeft
                    Anchors = [akLeft, akTop, akBottom]
                    ParentFont = False
                    Font.Color = clWhite
                    Font.Style = [fsBold]
                    TabOrder = 1
                  end
                end
              end
            end
            object Panel8: TUniPanel
              Tag = 1999
              Left = 1
              Top = 209
              Width = 506
              Height = 175
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              ExplicitTop = 117
              ExplicitHeight = 173
              object Bevel4: TUniPanel
                Left = 1
                Top = 48
                Width = 504
                Height = 3
                Hint = ''
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 3
                Caption = ''
              end
              object GridFields: TUniDBGrid
                Left = 1
                Top = 51
                Width = 504
                Height = 123
                Hint = ''
                ParentShowHint = False
                DataSource = SrcFields
                LoadMask.Message = 'Loading data...'
                OnKeyDown = GridFieldsKeyDown
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 0
                DragDrop.Enabled = True
                DragDrop.EnableDrop = True
                DragDrop.DropGroup = 'D1'
                DragDrop.PromptDrop = False
                Columns = <
                  item
                    FieldName = 'SEQ'
                    Title.Caption = 'Delimited Sequence'
                    Width = 97
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'START_POS'
                    Title.Caption = 'Flat Start Position'
                    Width = 89
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'FIELD_LENGTH'
                    Title.Caption = 'Flat Field Length'
                    Width = 83
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'DESCRIP'
                    Title.Caption = 'Description'
                    Width = 176
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'SQL_STATEMENT'
                    Title.Caption = 'SQL Statement'
                    Width = 84
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'IqFieldName'
                    Title.Caption = 'IQMS Field Name'
                    Width = 124
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'FIELD_NAME'
                    Title.Caption = 'Field Name'
                    Width = 64
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'DATE_FORMAT'
                    Title.Caption = 'Date Format'
                    Width = 104
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'LoopkUpTable'
                    Title.Caption = 'Look Up Table'
                    Width = 83
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'LITERAL'
                    Title.Caption = 'Literal Value'
                    Width = 62
                    PickList.Strings = (
                      'N'
                      'Y')
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'DO_NOT_APPEND_IF_ZERO'
                    Title.Caption = 'Do Not Append If Blank'
                    Width = 116
                    PickList.Strings = (
                      'Y'
                      'N')
                    CheckBoxField.FieldValues = 'true;false'
                  end>
              end
              object Panel21: TUniPanel
                Tag = 1999
                Left = 1
                Top = 1
                Width = 504
                Height = 47
                Hint = ''
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
                Caption = ''
                object Panel22: TUniPanel
                  Tag = 1999
                  Left = 1
                  Top = 1
                  Width = 502
                  Height = 20
                  Hint = ''
                  Align = alTop
                  Anchors = [akLeft, akTop, akRight]
                  ParentFont = False
                  Font.Color = clWhite
                  TabOrder = 0
                  Caption = ''
                  Color = clBtnShadow
                  object Label12: TUniLabel
                    Left = 1
                    Top = 1
                    Width = 75
                    Height = 13
                    Hint = ''
                    Caption = 'Import Fields'
                    Align = alLeft
                    Anchors = [akLeft, akTop, akBottom]
                    ParentFont = False
                    Font.Color = clWhite
                    Font.Style = [fsBold]
                    TabOrder = 1
                  end
                end
                object Panel9: TUniPanel
                  Tag = 1999
                  Left = 1
                  Top = 21
                  Width = 502
                  Height = 25
                  Hint = ''
                  Align = alClient
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  TabOrder = 1
                  Caption = ''
                  object NavFields: TUniDBNavigator
                    Left = 276
                    Top = 1
                    Width = 225
                    Height = 23
                    Hint = ''
                    ShowHint = True
                    ParentShowHint = False
                    DataSource = SrcFields
                    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
                    Align = alRight
                    Anchors = [akTop, akRight, akBottom]
                    TabOrder = 0
                  end
                end
              end
            end
          end
        end
        object TabBudget: TUniTabSheet
          Hint = ''
          ImageIndex = 1
          Caption = 'TabBudget'
          ExplicitHeight = 291
          object Panel17: TUniPanel
            Left = 0
            Top = 0
            Width = 508
            Height = 385
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            ExplicitHeight = 291
            object Bevel9: TUniPanel
              Left = 1
              Top = 28
              Width = 506
              Height = 3
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 5
              Caption = ''
            end
            object Panel18: TUniPanel
              Left = 1
              Top = 1
              Width = 506
              Height = 27
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              Alignment = taLeftJustify
              Caption = 'Budget Import setup'
              object NavBudget: TUniDBNavigator
                Left = 280
                Top = 1
                Width = 225
                Height = 25
                Hint = ''
                ShowHint = True
                ParentShowHint = False
                DataSource = SrcBudgetFields
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
                Align = alRight
                Anchors = [akTop, akRight, akBottom]
                TabOrder = 0
              end
            end
            object GridBudget: TIQUniGridControl
              Left = 1
              Top = 31
              Width = 506
              Height = 353
              Layout = 'border'
              ParentAlignmentControl = False
              AlignmentControl = uniAlignmentClient
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              IQComponents.Grid.Left = 0
              IQComponents.Grid.Top = 29
              IQComponents.Grid.Width = 289
              IQComponents.Grid.Height = 267
              IQComponents.Grid.Hint = ''
              IQComponents.Grid.DataSource = SrcBudgetFields
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
              IQComponents.Navigator.DataSource = SrcBudgetFields
              IQComponents.Navigator.LayoutConfig.Region = 'east'
              IQComponents.Navigator.TabOrder = 3
              IQComponents.HiddenPanel.Left = 289
              IQComponents.HiddenPanel.Top = 29
              IQComponents.HiddenPanel.Width = 209
              IQComponents.HiddenPanel.Height = 267
              IQComponents.HiddenPanel.Hint = ''
              IQComponents.HiddenPanel.Visible = True
              IQComponents.HiddenPanel.Align = alRight
              IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
              IQComponents.HiddenPanel.ExplicitHeight = 173
              IQComponents.FormTab.Hint = ''
              IQComponents.FormTab.ImageIndex = 1
              IQComponents.FormTab.Caption = 'Form'
              IQComponents.FormTab.Layout = 'border'
              IQComponents.FormTab.ExplicitHeight = 202
              DataSource = SrcBudgetFields
              Columns = <
                item
                  FieldName = 'ACCT_SEQ'
                  Title.Caption = 'Account # Sequence'
                  Width = 70
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'SEQ'
                  Title.Caption = 'Sequence'
                  Width = 70
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'START_POS'
                  Title.Caption = 'Flat Start Position'
                  Width = 70
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'FIELD_LENGTH'
                  Title.Caption = 'Flat Field Length'
                  Width = 70
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'FIELD_NAME'
                  Title.Caption = 'Field Name'
                  Width = 70
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'DESCRIP'
                  Title.Caption = 'Description'
                  Width = 350
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'FIELD_TYPE'
                  Title.Caption = 'Field Type'
                  Width = 70
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'Period'
                  Title.Caption = 'Period'
                  Width = 140
                  CheckBoxField.FieldValues = 'true;false'
                end>
              ExplicitHeight = 259
              Marker = 0
            end
            object dbFieldType: TUniDBComboBox
              Left = 40
              Top = 96
              Width = 121
              Height = 21
              Hint = ''
              Items.Strings = (
                'ACCOUNT'
                'PERIOD')
              TabOrder = 2
            end
            object dbPeriods: TUniEdit
              Left = 40
              Top = 72
              Width = 121
              Height = 21
              Hint = ''
              Text = ''
              TabOrder = 3
            end
          end
        end
      end
    end
    object Panel3: TUniPanel
      Left = 1
      Top = 1
      Width = 318
      Height = 415
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitHeight = 321
      object Bevel5: TUniPanel
        Left = 1
        Top = 56
        Width = 316
        Height = 3
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        Caption = ''
        ExplicitTop = 78
      end
      object Bevel6: TUniPanel
        Left = 1
        Top = 28
        Width = 316
        Height = 3
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
        Caption = ''
      end
      object PnlPCCarrier: TUniPanel
        Tag = 1999
        Left = 1
        Top = 59
        Width = 316
        Height = 355
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 2
        Caption = ''
        ExplicitTop = 81
        ExplicitHeight = 239
        object PC: TUniPageControl
          Left = 1
          Top = 1
          Width = 314
          Height = 353
          Hint = ''
          ActivePage = TabGrid
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          ExplicitHeight = 237
          object TabForm: TUniTabSheet
            Hint = ''
            Caption = 'TabForm'
            ExplicitHeight = 209
            object sbFormView: TUniScrollBox
              Left = 0
              Top = 0
              Width = 306
              Height = 325
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
              ExplicitHeight = 209
              ScrollHeight = 301
              object PnlFormView1: TUniPanel
                Tag = 1999
                Left = 0
                Top = 0
                Width = 304
                Height = 203
                Hint = ''
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                Caption = ''
                ExplicitWidth = 287
                object Splitter4: TUniSplitter
                  Left = 92
                  Top = 1
                  Width = 6
                  Height = 201
                  Hint = ''
                  Align = alLeft
                  ParentColor = False
                  Color = clBtnFace
                end
                object PnlFormViewLeft1: TUniPanel
                  Tag = 1999
                  Left = 1
                  Top = 1
                  Width = 91
                  Height = 201
                  Hint = ''
                  Align = alLeft
                  Anchors = [akLeft, akTop, akBottom]
                  TabOrder = 0
                  Caption = ''
                  object Label1: TUniLabel
                    Left = 8
                    Top = 12
                    Width = 60
                    Height = 13
                    Hint = ''
                    Caption = 'Import Code'
                    TabOrder = 1
                  end
                  object Label2: TUniLabel
                    Left = 8
                    Top = 36
                    Width = 53
                    Height = 13
                    Hint = ''
                    Caption = 'Description'
                    TabOrder = 2
                  end
                  object Label3: TUniLabel
                    Left = 8
                    Top = 60
                    Width = 43
                    Height = 13
                    Hint = ''
                    Caption = 'File Type'
                    TabOrder = 3
                  end
                  object Label4: TUniLabel
                    Left = 8
                    Top = 84
                    Width = 70
                    Height = 13
                    Hint = ''
                    Caption = 'Record Length'
                    TabOrder = 4
                  end
                  object Label5: TUniLabel
                    Left = 8
                    Top = 108
                    Width = 83
                    Height = 13
                    Hint = ''
                    Caption = 'Record Delimiters'
                    TabOrder = 5
                  end
                  object Label6: TUniLabel
                    Left = 8
                    Top = 132
                    Width = 66
                    Height = 13
                    Hint = ''
                    Caption = 'Field Delimiter'
                    TabOrder = 6
                  end
                  object Label7: TUniLabel
                    Left = 8
                    Top = 156
                    Width = 72
                    Height = 13
                    Hint = ''
                    Caption = 'String Delimiter'
                    TabOrder = 7
                  end
                  object Label8: TUniLabel
                    Left = 8
                    Top = 180
                    Width = 73
                    Height = 13
                    Hint = ''
                    Caption = 'Records to skip'
                    TabOrder = 8
                  end
                end
                object PnlFormViewClient1: TUniPanel
                  Tag = 1999
                  Left = 98
                  Top = 1
                  Width = 205
                  Height = 201
                  Hint = ''
                  Align = alClient
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  TabOrder = 1
                  Caption = ''
                  ExplicitWidth = 188
                  DesignSize = (
                    205
                    201)
                  object dbImportCode: TUniDBEdit
                    Left = 0
                    Top = 8
                    Width = 214
                    Height = 21
                    Hint = ''
                    DataField = 'IMPORT_CODE'
                    DataSource = SrcHeader
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 0
                    ExplicitWidth = 197
                  end
                  object dbDescrip: TUniDBEdit
                    Left = 0
                    Top = 32
                    Width = 214
                    Height = 21
                    Hint = ''
                    DataField = 'DESCRIP'
                    DataSource = SrcHeader
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ExplicitWidth = 197
                  end
                  object dbTableType2: TUniDBComboBox
                    Left = 0
                    Top = 56
                    Width = 214
                    Height = 21
                    Hint = ''
                    ShowHint = True
                    ParentShowHint = False
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'TABLE_TYPE'
                    DataSource = SrcHeader
                    Items.Strings = (
                      'DBF Format'#9'DBF'
                      'ASCII Flat Format (CR+LF)'#9'AFL'
                      'ASCII Flat Format (NO CR+LF)'#9'ANC'
                      'ASCII Delimited Format (CR + LF)'#9'ADL'
                      'ASCII Delimited Format (NO CR + LF)'#9'ANL'
                      'Excel'#9'AXL')
                    TabOrder = 2
                    ExplicitWidth = 197
                  end
                  object dbRecordLen: TUniDBEdit
                    Left = 0
                    Top = 80
                    Width = 58
                    Height = 21
                    Hint = 'Must be entered if Flat ASCII (NO CR+LF)'
                    ShowHint = True
                    ParentShowHint = False
                    DataField = 'RECORD_LENGTH'
                    DataSource = SrcHeader
                    TabOrder = 3
                  end
                  object dbRecordDelim: TUniDBEdit
                    Left = 0
                    Top = 104
                    Width = 58
                    Height = 21
                    Hint = 
                      '(For ASCII Delimited NO CR+LF). Must be entered in ASCII represe' +
                      'ntation, comma delimited if more than one'
                    ShowHint = True
                    ParentShowHint = False
                    DataField = 'RECORD_DELIMITERS'
                    DataSource = SrcHeader
                    TabOrder = 4
                  end
                  object dbFieldDelim: TUniDBEdit
                    Left = 0
                    Top = 128
                    Width = 58
                    Height = 21
                    Hint = 
                      '(For ASCII Delimited). Must be entered in ASCII representation, ' +
                      'only one delimiter allowed'
                    ShowHint = True
                    ParentShowHint = False
                    DataField = 'FIELD_DELIMITER'
                    DataSource = SrcHeader
                    TabOrder = 5
                  end
                  object dbCharDelim: TUniDBEdit
                    Left = 0
                    Top = 152
                    Width = 58
                    Height = 21
                    Hint = 
                      '(For ASCII Delimited). Must be entered in ASCII representation, ' +
                      'only one delimiter allowed'
                    ShowHint = True
                    ParentShowHint = False
                    DataField = 'CHARACTER_DELIMITERS'
                    DataSource = SrcHeader
                    TabOrder = 6
                  end
                  object DBEdit1: TUniDBEdit
                    Left = 0
                    Top = 176
                    Width = 58
                    Height = 21
                    Hint = 'Must be entered if Flat ASCII (NO CR+LF)'
                    ShowHint = True
                    ParentShowHint = False
                    DataField = 'RECS_TO_SKIP'
                    DataSource = SrcHeader
                    TabOrder = 7
                  end
                end
              end
              object PnlFormViewBudget: TUniPanel
                Tag = 1999
                Left = 0
                Top = 203
                Width = 304
                Height = 84
                Hint = ''
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
                Caption = ''
                ExplicitWidth = 287
                object GroupBox1: TUniGroupBox
                  Left = 1
                  Top = 1
                  Width = 302
                  Height = 82
                  Hint = ''
                  Caption = 'Budget Information '
                  Align = alClient
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  TabOrder = 0
                  ExplicitWidth = 285
                  object Panel26: TUniPanel
                    Tag = 1999
                    Left = 2
                    Top = 15
                    Width = 298
                    Height = 65
                    Hint = ''
                    Align = alClient
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    TabOrder = 0
                    Caption = ''
                    ExplicitWidth = 281
                    object Splitter5: TUniSplitter
                      Left = 82
                      Top = 1
                      Width = 6
                      Height = 63
                      Hint = ''
                      Align = alLeft
                      ParentColor = False
                      Color = clBtnFace
                    end
                    object PnlFormViewBudgetLeft1: TUniPanel
                      Tag = 1999
                      Left = 1
                      Top = 1
                      Width = 81
                      Height = 63
                      Hint = ''
                      Align = alLeft
                      Anchors = [akLeft, akTop, akBottom]
                      TabOrder = 0
                      Caption = ''
                      object Label9: TUniLabel
                        Left = 8
                        Top = 12
                        Width = 62
                        Height = 13
                        Hint = ''
                        Caption = 'Budget Code'
                        TabOrder = 1
                      end
                      object Label10: TUniLabel
                        Left = 8
                        Top = 36
                        Width = 51
                        Height = 13
                        Hint = ''
                        Caption = 'Fiscal Year'
                        TabOrder = 2
                      end
                    end
                    object PnlFormViewBudgetClient1: TUniPanel
                      Tag = 1999
                      Left = 88
                      Top = 1
                      Width = 209
                      Height = 63
                      Hint = ''
                      Align = alClient
                      Anchors = [akLeft, akTop, akRight, akBottom]
                      TabOrder = 1
                      Caption = ''
                      ExplicitWidth = 192
                      DesignSize = (
                        209
                        63)
                      object dbCode: TUniDBEdit
                        Left = 0
                        Top = 8
                        Width = 198
                        Height = 21
                        Cursor = crArrow
                        Hint = 'Double click to edit'
                        ShowHint = True
                        ParentShowHint = False
                        DataField = 'BUDGET_CODE'
                        DataSource = SrcHeader
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 0
                        TabStop = False
                        Color = clBtnFace
                        ReadOnly = True
                        OnDblClick = dbCodeDblClick
                        ExplicitWidth = 181
                      end
                      object dbYear: TUniDBEdit
                        Left = 0
                        Top = 32
                        Width = 198
                        Height = 21
                        Cursor = crArrow
                        Hint = 'Double click to edit'
                        ShowHint = True
                        ParentShowHint = False
                        DataField = 'GLYear'
                        DataSource = SrcHeader
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        TabStop = False
                        Color = clBtnFace
                        ReadOnly = True
                        OnDblClick = dbYearDblClick
                        ExplicitWidth = 181
                      end
                    end
                  end
                end
              end
              object PnlFormViewSpacer: TUniPanel
                Tag = 1999
                Left = 0
                Top = 287
                Width = 304
                Height = 14
                Hint = ''
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
                Caption = ''
                ExplicitWidth = 287
              end
            end
          end
          object TabGrid: TUniTabSheet
            Hint = ''
            Caption = 'TabGrid'
            ExplicitHeight = 209
            object GridHeader: TIQUniGridControl
              Left = 0
              Top = 0
              Width = 306
              Height = 325
              Layout = 'border'
              ParentAlignmentControl = False
              AlignmentControl = uniAlignmentClient
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
              IQComponents.Grid.Left = 0
              IQComponents.Grid.Top = 29
              IQComponents.Grid.Width = 89
              IQComponents.Grid.Height = 239
              IQComponents.Grid.Hint = ''
              IQComponents.Grid.DataSource = SrcHeader
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
              IQComponents.Navigator.DataSource = SrcHeader
              IQComponents.Navigator.LayoutConfig.Region = 'east'
              IQComponents.Navigator.TabOrder = 3
              IQComponents.HiddenPanel.Left = 89
              IQComponents.HiddenPanel.Top = 29
              IQComponents.HiddenPanel.Width = 209
              IQComponents.HiddenPanel.Height = 239
              IQComponents.HiddenPanel.Hint = ''
              IQComponents.HiddenPanel.Visible = True
              IQComponents.HiddenPanel.Align = alRight
              IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
              IQComponents.HiddenPanel.ExplicitHeight = 123
              IQComponents.FormTab.Hint = ''
              IQComponents.FormTab.ImageIndex = 1
              IQComponents.FormTab.Caption = 'Form'
              IQComponents.FormTab.Layout = 'border'
              IQComponents.FormTab.ExplicitHeight = 152
              DataSource = SrcHeader
              Columns = <
                item
                  FieldName = 'IMPORT_CODE'
                  Title.Caption = 'Import Code'
                  Width = 140
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'DESCRIP'
                  Title.Caption = 'Description'
                  Width = 84
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'FIELD_DELIMITER'
                  Title.Caption = 'Field Delimiter'
                  Width = 84
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'RECORD_DELIMITERS'
                  Title.Caption = 'Record Delimiters'
                  Width = 98
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'RECORD_LENGTH'
                  Title.Caption = 'Record Length'
                  Width = 84
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'TABLE_TYPE'
                  Title.Caption = 'Table Type'
                  Width = 175
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'CHARACTER_DELIMITERS'
                  Title.Caption = 'String Delimiter'
                  Width = 119
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'BUDGET_CODE'
                  Title.Caption = 'Budget Code'
                  Width = 70
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'RECS_TO_SKIP'
                  Title.Caption = 'Records to Skip'
                  Width = 84
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'GLYear'
                  Title.Caption = 'GL Year'
                  Width = 119
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'EXP_USER_ID'
                  Title.Caption = 'EXP_USER_ID'
                  Width = 70
                  CheckBoxField.FieldValues = 'true;false'
                end>
              ExplicitHeight = 209
              Marker = 0
            end
            object dbTableType1: TUniDBComboBox
              Left = 16
              Top = 96
              Width = 121
              Height = 21
              Hint = ''
              ShowHint = True
              ParentShowHint = False
              Items.Strings = (
                'DBF Format'#9'DBF'
                'ASCII Flat Format (CR+LF)'#9'AFL'
                'ASCII Flat Format (NO CR+LF)'#9'ANC'
                'ASCII Delimited Format (CR + LF)'#9'ADL'
                'ASCII Delimited Format (NO CR + LF)'#9'ANL'
                'Excel'#9'AXL')
              TabOrder = 1
            end
          end
        end
      end
      object Panel11: TUniPanel
        Left = 1
        Top = 1
        Width = 316
        Height = 27
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        object SBSearch: TUniSpeedButton
          Left = 1
          Top = 1
          Width = 25
          Height = 25
          Hint = 'Search '
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            1800000000000006000000000000000000000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB18C76A07860
            90604090584090584087492AFF00FFFF00FFFF00FFB485659C755DA070509058
            40905030773818FF00FF8B8B8B7777775F5F5F5A5A5A5A5A5A4A4A4AFF00FFFF
            00FFFF00FF8484847474746F6F6F5A5A5A5151513B3B3BFF00FFB09080FFF8FF
            E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0E0C8C0D0A8
            90B07850804820FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
            00FFFF00FF7F7F7FE7E7E7C9C9C9A7A7A7777777484848FF00FFB09080FFF8FF
            E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
            B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
            00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFB09080FFF8FF
            E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
            B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
            00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC09880FFFFFF
            F0E8E0E0C8C0D0A080804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
            B0C08870804830FF00FF979797FFFFFFE7E7E7C9C9C99E9E9E424242FF00FFFF
            00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC3A494B08870
            A068509050308048308048208038108F4C26B08870A068509058309048308040
            20703810905830FF00FFA4A4A48787876969695151514A4A4A4848483B3B3B4E
            4E4E8787876969695757574C4C4C424242393939575757FF00FFDEC4B4B08870
            FFFFFFE0D0C0D0A090A07050804010D5B89CB09070E0D8D0F0D8D0D0A090B078
            50803820CFA98AFF00FFC3C3C3878787FFFFFFCECECEA1A1A16F6F6F414141B5
            B5B58D8D8DD7D7D7D9D9D9A1A1A17777773D3D3DA7A7A7FF00FFFF00FFC09080
            F0F0F0FFF8F0F0D8C0B08060804820965732B09070FFFFFFFFF8F0F0D0C0B078
            50804820FF00FFFF00FFFF00FFFF00FFF0F0F0F7F7F7D5D5D57F7F7F48484857
            57578D8D8DFFFFFFF7F7F7D0D0D0777777484848FF00FFFF00FFFF00FFF8E2D2
            C09880B08060A068509050309058409D6842B07860B08870A070508048308048
            20ECC4A7FF00FFFF00FFFF00FFE1E1E19797977F7F7F6969695151515A5A5A67
            67677979798787876F6F6F4A4A4A484848C2C2C2FF00FFFF00FFFF00FFFF00FF
            C09880FFF8FFE0C0B0C09070804820FF00FFC09880FFF8FFE0C8B0D0A0808048
            20FF00FFFF00FFFF00FFFF00FFFF00FF979797FAFAFAC0C0C08E8E8E484848FF
            00FF979797FAFAFAC5C5C59E9E9E484848FF00FFFF00FFFF00FFFF00FFFF00FF
            CFB1A1B09080A06850905030875139FF00FFC0A890B09080A06850905030864F
            37FF00FFFF00FFFF00FFFF00FFFF00FFB0B0B08F8F8F696969515151525252FF
            00FFA5A5A58F8F8F696969515151505050FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFB1836DFFF8F0814527FF00FFFF00FFFF00FFB08068FFF8F0804324FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF838383F7F7F7464646FF00FFFF
            00FFFF00FF808080F7F7F7444444FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFC7A898B48D759D6843FF00FFFF00FFFF00FFCEAE9CB48C749C6640FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA7A7A78C8C8C676767FF00FFFF
            00FFFF00FFADADAD8B8B8B656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Caption = ''
          ParentColor = False
          Color = clWindow
          OnClick = SBSearchClick
        end
        object SBGridView: TUniSpeedButton
          Left = 26
          Top = 1
          Width = 25
          Height = 25
          Hint = 'Toggle table/form view'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            36060000424D3606000000000000360400002800000020000000100000000100
            08000000000000020000A0860100A08601000001000000000000000000001212
            1200282828003E3E3E006A6A6A006F6F6F00800000008B09020097130300A21C
            0500AA230600AD250700B52C0800B92F0900C0340A00C4380A00CA3D0B00CF41
            0C00D5460D00D8511900DA5A2400DD663100E06E3A00E37C4900E5825000F08C
            6800E9916100EA966700EFAB7E00FF00FF00808080008A8A8A008F8F8F009494
            9400999999009F9F9F00A4A4A400A9A9A900ADADAD00AEAEAE00B0B0B000B3B3
            B300B4B4B400B7B7B700B8B8B800BABABA00BDBDBD00F4BF9400FAD3AA00C0C0
            C000C2C2C200C3C3C300C6C6C600C8C8C800C9C9C900CDCDCD00E0E0E000F9F9
            FB00FFFFFF000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000001D1D1D1D0505
            050505050505050505051D1D1D1D0505050505050505050505051D1D1D1D1E2C
            29272524232221201F051D1D1D1D1E2C29272524232221201F051D1D1D1D1E2E
            2C2927250302010020051D1D1D1D1E2E2C2927250302010020051D1D1D1D1E32
            2E2C29271E3A3A0021051D1D1D1D1E322E2C29271E3A3A0021051D1D1D1D1E35
            2A2004291E1E1E1E22051D1D1D1D1E352A2004291E1E1E1E22051D1D1D1D1E37
            35322E2C2927252423051D1D1D1D1E3735322E2C2927252423051E1E1E1E1A17
            1513110F0D0B090807061E1E1E1E211E050403030303030202021E3838381A19
            191919191919191919061E3838382120202020202020202020021E3939391A17
            1513110F0D0B090807061E393939211E050403030303030202021E393331392D
            2B392826391E1D1D1D1D1E393331392D2B392826391E1D1D1D1D1E3939393939
            39393939391E1D1D1D1D1E393939393939393939391E1D1D1D1D1E3936343931
            2E392B2A391E1D1D1D1D1E39363439312E392B2A391E1D1D1D1D1E3939393939
            39393939391E1D1D1D1D1E393939393939393939391E1D1D1D1D302F1C1B1816
            1412100E0C0A1D1D1D1D372E25211E050404030303031D1D1D1D301919191919
            19191919190A1D1D1D1D3720202020202020202020031D1D1D1D302F1C1B1816
            1412100E0C0A1D1D1D1D372E25211E050404030303031D1D1D1D}
          Caption = ''
          ParentColor = False
          Color = clWindow
          OnClick = SBGridViewClick
        end
        object sbStop: TUniSpeedButton
          Left = 83
          Top = 1
          Width = 25
          Height = 25
          Hint = 'Stop Loading ASCII file'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000130B0000130B00000000000000000000FF00FFFF00FF
            F6F6FCCBCBEC7777D13838C01E1EBE1818BE2020BD3D3DC18080D4D2D2EFF7F7
            FCFF00FFFF00FFFF00FFFF00FFFF00FFF7F7F7D3D3D391919169696961616160
            60606161616C6C6C979797D9D9D9F8F8F8FF00FFFF00FFFF00FFFF00FFF0F0F9
            9C9CDD3535C01E1ECC1C1CE21717EA1919EA2020E92626E32525CA3D3DC1A5A5
            E0F2F2FAFF00FFFF00FFFF00FFF2F2F2ADADAD69696968686873737376767676
            76767777777676766868686C6C6CB4B4B4F4F4F4FF00FFFF00FFF5F5FB9B9BDD
            3636C33939DF4443ED6969DC7A7AD88989D68080D65757E04848F54040DB3939
            C3A6A6E0F7F7FCFF00FFF6F6F6ACACAC6A6A6A7979798282828C8C8C9595959D
            9D9D9898988585858888887979796B6B6BB5B5B5F8F8F8FF00FFC8C8EC3B3BC2
            4B4BDF5959F49494E1E3E3E7EFEFEEF3F3F0EEEEEBC1C1D56B6CD96464F54C4C
            DB4444C3D3D3EFFF00FFD0D0D06B6B6B7F7F7F8F8F8FA8A8A8E4E4E4EFEFEFF3
            F3F3EEEEEEC5C5C58D8D8D9494947E7E7E707070D9D9D9FF00FF766EC33A3CD0
            7272F97776EFE0E0F1FFFFFDFFFFFFFFFFFFFFFFFEFAFAF7C1C1D27A7ADD7475
            F63838CA8787D6FF00FF8787877373739C9C9C9B9B9BE4E4E4FFFFFFFFFFFFFF
            FFFFFFFFFFFAFAFAC5C5C59797979D9D9D6E6E6E9C9C9CFF00FF2D27AF6465E7
            7A7AFD8989EFEEEEF9FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF2F2F4B7B7D48383
            E85C5DE24646C3FF00FF5C5C5C8F8F8FA3A3A3A6A6A6F0F0F0FFFFFFFFFFFFFF
            FFFFFFFFFFFEFEFEF2F2F2BEBEBEA0A0A0898989717171FF00FF2121BA7576F2
            7575FB9797EDF1F1FBFFFFFFFFFFFFFFFFFFFFFFFEF1F1F3B7B7E7D8D8E7AAAA
            D96E6EE52D2DBEFF00FF6060609C9C9C9F9F9FAEAEAEF3F3F3FFFFFFFFFFFFFF
            FFFFFFFFFFF1F1F1C3C3C3DBDBDBB6B6B6939393656565FF00FF2120BA6F6FF5
            7474F7B4B4EDE2E2F2F2F2F8FFFFFFFFFFFFFFFFFED6D6DB6C6CE3A8A8EED5D5
            E18D8DD62828BAFF00FF6060609999999D9D9DC2C2C2E6E6E6F3F3F3FFFFFFFF
            FFFFFFFFFFD7D7D7919191BABABAD8D8D8A0A0A0626262FF00FF1E1EB96162F3
            7F7FF2CACAE7A1A1E1DDDDEFF1F1F3F1F1F4E9E9EFDCDCDD7B7BE07D7DF7A5A5
            ED8B8BDB2B2BBAFF00FF5F5F5F929292A1A1A1D1D1D1B1B1B1E1E1E1F1F1F1F2
            F2F2EAEAEADCDCDC989898A2A2A2B8B8B8A0A0A0626262FF00FF2623B45051E7
            9B9BECB8B8DD8282E7E2E2EDCECEDCDBDBE5C3C3D5E5E5E69494D67B7BFD7777
            FB5B5BE43B3BC0FF00FF5D5D5D858585B1B1B1C1C1C19F9F9FE5E5E5D1D1D1DD
            DDDDC7C7C7E5E5E5A5A5A5A3A3A3A0A0A08888886A6A6AFF00FF5B53B23133CE
            A6A6E9A4A4E78C8CF2DDDDE5BEBED7D8D8E5BABAD3DCDCEAAEAED48282F97676
            FC3939D16668D0FF00FF7171716E6E6EB7B7B7B5B5B5A9A9A9DFDFDFC4C4C4DB
            DBDBC0C0C0DFDFDFB7B7B7A5A5A5A0A0A0727272878787FF00FFA7A7E12D2AB8
            5151DD7F80F89999F8D7D7E2C8C8DBDADAE5BFBFD7CACAE8C5C5DB8383F25555
            E52D2CBCA7A8E1FF00FFB6B6B6616161808080A4A4A4B3B3B3D9D9D9CCCCCCDC
            DCDCC4C4C4D1D1D1CACACAA3A3A3868686646464B6B6B6FF00FFEEEDF57872C1
            2F2DC15556E58B8CF7C6C6EBCFCFEAD9D9E8C3C3E1BABAF0A8A8E65757E03030
            C68A8CDBF3F3FBFF00FFEFEFEF898989666666868686ABABABCFCFCFD5D5D5DC
            DCDCCACACAC7C7C7B8B8B88585856A6A6AA1A1A1F5F5F5FF00FFFF00FFD1D1EC
            938ECD3F3CC03738D06565E28686ED8F8FE98383E76565E43737CC3C3DC68F90
            DBEAEAF8FF00FFFF00FFFF00FFD7D7D79F9F9F6B6B6B7171718C8C8CA3A3A3A8
            A8A89F9F9F8D8D8D6F6F6F6E6E6EA4A4A4EDEDEDFF00FFFF00FFFF00FFFF00FF
            F3F1F6C0BFE67571CA3A39C12A29C22828C22929C13939C37272D2BFBFEAF2F2
            FBFF00FFFF00FFFF00FFFF00FFFF00FFF2F2F2C9C9C98B8B8B6A6A6A66666666
            66666565656B6B6B8E8E8ECACACAF4F4F4FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFCFCFEF1F0F8DEDDF1CAC5E4C0BEE5C7C7EBDEDEF3F0F0FAFCFCFEFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFCFCFCF2F2F2E2E2E2CCCCCCC8
            C8C8CFCFCFE3E3E3F2F2F2FCFCFCFF00FFFF00FFFF00FFFF00FF}
          Caption = ''
          ParentColor = False
          Color = clWindow
          OnClick = StoptReadingFile1Click
        end
        object sbOpen: TUniSpeedButton
          Left = 58
          Top = 1
          Width = 25
          Height = 25
          Hint = 'Open Import file to view'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            1800000000000006000000000000000000000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF708890608090
            6078805070805060704058604048503038402030302020301018201010101010
            20FF00FFFF00FFFF00FF88888882828278787872727263636358585849494939
            39392F2F2F242424191919101010141414FF00FFFF00FFFF00FF70889090A0B0
            70B0D00090D00090D00090D00090C01088C01080B01080B02078A02070902048
            60AE9783FF00FFFF00FF888888A3A3A3B4B4B49D9D9D9D9D9D9D9D9D98989892
            92928888888888887E7E7E7474744C4C4C959595FF00FFFF00FF80889080C0D0
            90A8B080E0FF60D0FF50C8FF50C8FF40C0F030B0F030A8F020A0E01090D02068
            80615A57FF00FFFF00FF898989C0C0C0A8A8A8E2E2E2D6D6D6D1D1D1D1D1D1C6
            C6C6BBBBBBB6B6B6ACACAC9D9D9D6B6B6B5A5A5AFF00FFFF00FF8090A080D0F0
            90A8B090C0D070D8FF60D0FF60D0FF50C8FF50C0FF40B8F030B0F030A8F01088
            D0204860D8BBA5FF00FF939393D3D3D3A8A8A8C1C1C1DCDCDCD6D6D6D6D6D6D1
            D1D1CBCBCBC1C1C1BBBBBBB6B6B69797974C4C4CB9B9B9FF00FF8090A080D8F0
            80C8E090A8B080E0FF70D0FF60D8FF60D0FF60D0FF50C8FF40C0F040B8F030B0
            F0206880748588FF00FF939393D9D9D9CACACAA8A8A8E2E2E2D7D7D7DCDCDCD6
            D6D6D6D6D6D1D1D1C6C6C6C1C1C1BBBBBB6B6B6B858585FF00FF8098A090E0F0
            90E0FF90A8B090B8C070D8FF60D8FF60D8FF60D8FF60D0FF50D0FF50C8FF40B8
            F030A0E04A6774D9C3B4989898E0E0E0E3E3E3A8A8A8B7B7B7DCDCDCDCDCDCDC
            DCDCDCDCDCD6D6D6D6D6D6D1D1D1C1C1C1ACACAC686868C2C2C28098A090E0F0
            A0E8FF80C8E090A8B080E0FF80E0FF80E0FF80E0FF80E0FF80E0FF80E0FF70D8
            FF70D8FF50A8D0909091989898E0E0E0E9E9E9CACACAA8A8A8E2E2E2E2E2E2E2
            E2E2E2E2E2E2E2E2E2E2E2E2E2E2DCDCDCDCDCDCAEAEAE90909090A0A0A0E8F0
            A0E8FFA0E8FF90B0C090B0C090A8B090A8B080A0B080A0B08098A08098A08090
            A08090A08088907088909F9F9FE6E6E6E9E9E9E9E9E9B2B2B2B2B2B2A8A8A8A8
            A8A8A2A2A2A2A2A298989898989893939393939389898988888890A0B0A0E8F0
            A0F0FFA0E8FFA0E8FF80D8FF60D8FF60D8FF60D8FF60D8FF60D8FF60D8FF7088
            90FF00FFFF00FFFF00FFA3A3A3E6E6E6EFEFEFE9E9E9E9E9E9DDDDDDDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDC888888FF00FFFF00FFFF00FF90A0B0A0F0F0
            B0F0F0A0F0FFA0E8FFA0E8FF70D8FF90A0A08098A08098A08090A08090907088
            90FF00FFFF00FFFF00FFA3A3A3ECECECEDEDEDEFEFEFE9E9E9E9E9E9DCDCDC9F
            9F9F9898989898989393938F8F8F888888FF00FFFF00FFFF00FF90A8B0A0D0E0
            B0F0F0B0F0F0A0F0FFA0E8FF90A0B0BDC5BFFF00FFFF00FFFF00FFFF00FFFF00
            FF906850906850906850A8A8A8D1D1D1EDEDEDEDEDEDEFEFEFE9E9E9A3A3A3C4
            C4C4FF00FFFF00FFFF00FFFF00FFFF00FF676767676767676767DAD1C690A8B0
            90A8B090A8B090A8B090A8B0BFC2BEFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFDFC2B2906850906850D0D0D0A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8C1C1C1FF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1C1C1676767676767FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF907860D3B6A1FF00FFF7DF
            CCA09080DFC8B3907860FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FF757575B4B4B4FF00FFDEDEDE8E8E8EC6C6C6757575FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE5D3BFA09080A08880B098
            80CEBBAAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFD1D1D18E8E8E888888959595B9B9B9FF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Caption = ''
          ParentColor = False
          Color = clWindow
          OnClick = OpenImportFile1Click
        end
        object sbProcess: TUniSpeedButton
          Left = 114
          Top = 1
          Width = 25
          Height = 25
          Hint = 'Load the import file to the system table(s)'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            1800000000000006000000000000000000000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFC0A8906048306048306048306048306048
            30604830FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA5
            A5A5464646464646464646464646464646464646FF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFC0B0A0FFFFFFFFF8F0FFE8E0F0D8C0F0D0
            B0604830FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAE
            AEAEFFFFFFF7F7F7E9E9E9D5D5D5CDCDCD464646FF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFD0B0A0FFFFFFE0C8C0D0C0B0C0B0A0F0D8
            C0604830FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAF
            AFAFFFFFFFC9C9C9BEBEBEAEAEAED5D5D5464646FF00FFFF00FFFF00FFFF00FF
            FF00FFC0A890604830604830604830D0B8A0FFFFFFFFFFFFFFFFFFFFF8F0FFE8
            E0604830FF00FFFF00FFFF00FFFF00FFFF00FFA5A5A5464646464646464646B5
            B5B5FFFFFFFFFFFFFFFFFFF7F7F7E9E9E9464646FF00FFFF00FFFF00FFFF00FF
            FF00FFC0B0A0FFFFFFFFF8F0FFE8E0F0A890F0A880F0A070E09070E08860E080
            50D06830FF00FFFF00FFFF00FFFF00FFFF00FFAEAEAEFFFFFFF7F7F7E9E9E9AA
            AAAAA8A8A8A0A0A09292928A8A8A8282826C6C6CFF00FFFF00FFFF00FFFF00FF
            FF00FFD0B0A0FFFFFFE0C8C0D0C0B0F0A890FFC0A0FFC0A0FFB890F0A070F098
            60D06830FF00FFFF00FFFF00FFFF00FFFF00FFAFAFAFFFFFFFC9C9C9BEBEBEAA
            AAAAC0C0C0C0C0C0B8B8B8A0A0A09898986C6C6CFF00FFFF00FFFF00FFFF00FF
            FF00FFD0B8A0FFFFFFFFFFFFFFFFFFF0A890F0A880F0A070E09070E08860E080
            50E07840FF00FFFF00FFFF00FFFF00FFFF00FFB5B5B5FFFFFFFFFFFFFFFFFFAA
            AAAAA8A8A8A0A0A09292928A8A8A8282827B7B7BFF00FFFF00FFFF00FFFF00FF
            FF00FFF0A890F0A880F0A070E09070E08860E08050D06830FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAAAAAAA8A8A8A0A0A09292928A
            8A8A8282826C6C6CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFF0A890FFC0A0FFC0A0FFB890F0A070F09860D06830FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAAAAAAC0C0C0C0C0C0B8B8B8A0
            A0A09898986C6C6CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFF0A890F0A880F0A070E09070E08860E08050E07840FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAAAAAAA8A8A8A0A0A09292928A
            8A8A8282827B7B7BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFF3D1B8FF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCF
            CFCFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFF3C5AAB06040CC9573FF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC4C4C464
            6464939393FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFF3CBB1C08060E09870B07050CB8E67FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCACACA81818198
            98987171718D8D8DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFF0CCB4E09870F0B8A0F0A880E09870B06840CE936DFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCBCBCB989898B8B8B8A8
            A8A8989898696969919191FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FCE2CEF2C5ADE09870F0C8B0F0C8B0F0B8A0F0A890E09060B06840CE916BFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFE1E1E1C4C4C4989898C7C7C7C7C7C7B8
            B8B8AAAAAA909090696969909090FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            F7D6BEF0A880F0B090F0B090F0A890E0A080E0A080E09870D08060B06840CE9D
            7FE9C3A7FF00FFFF00FFFF00FFFF00FFD4D4D4A8A8A8B0B0B0B0B0B0AAAAAAA0
            A0A0A0A0A09898988383836969699C9C9CC1C1C1FF00FFFF00FF}
          Caption = ''
          ParentColor = False
          Color = clWindow
          OnClick = ProcessImport1Click
        end
        object SBGL: TUniSpeedButton
          Left = 139
          Top = 1
          Width = 25
          Height = 25
          Hint = 'Load the import file to the system GL Prepost table(s)'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            1800000000000006000000000000000000000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFB0A0906048306048306048306050407050
            40705040705040705040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9E
            9E9E4646464646464646464E4E4E505050505050505050505050FF00FFFF00FF
            FF00FFA04820FF00FFFF00FFFF00FFC0B0A0FFFFFFE0E8E0E0E0E0E0D8D0E0C8
            C0D0C8B0C0B8A0605040FF00FFFF00FFFF00FF4D4D4DFF00FFFF00FFFF00FFAE
            AEAEFFFFFFE6E6E6E0E0E0D7D7D7C9C9C9C4C4C4B4B4B44E4E4EFF00FFFF00FF
            FF00FFB05830A05830FF00FFFF00FFC0B0A0FFF8F0E0C8C0E0C8C0D0C0B0D0B8
            B0F0E0D0D0B8B0705040FF00FFFF00FFFF00FF5C5C5C5A5A5AFF00FFFF00FFAE
            AEAEF7F7F7C9C9C9C9C9C9BEBEBEB8B8B8DEDEDEB8B8B8505050C07850A05030
            A05030C06840E08050A05830FF00FFD0B8A0FFF8F0FFFFFFFFFFFFFFF8F0FFF0
            E0FFE8E0D0C0B07050407979795454545454546B6B6B8282825A5A5AFF00FFB5
            B5B5F7F7F7FFFFFFFFFFFFF7F7F7EEEEEEE9E9E9BEBEBE505050E09870F0B8A0
            F0B090E09870E09060D08860E07040D0B8A0FFF8FFE0C8C0E0C8C0D0C0C0D0B8
            B0F0E8E0D0C0C0705040989898B8B8B8B0B0B0989898909090888888767676B5
            B5B5FAFAFAC9C9C9C9C9C9C2C2C2B8B8B8E7E7E7C2C2C2505050F0B090F09870
            E08860E08050F0A880E07840FF00FFD0B8A0FFFFFFFFFFFFFFFFFFFFFFFFFFF8
            F0FFF0E0FFE8E0705040B0B0B09A9A9A8A8A8A828282A8A8A87B7B7BFF00FFB5
            B5B5FFFFFFFFFFFFFFFFFFFFFFFFF7F7F7EEEEEEE9E9E9505050FF00FFFF00FF
            FF00FFE08850E07840FF00FFFF00FFF0B090F0A880F0A080F09870E09060E088
            60E08050E07840D16D36FF00FFFF00FFFF00FF8888887B7B7BFF00FFFF00FFB0
            B0B0A8A8A8A2A2A29A9A9A9090908A8A8A8282827B7B7B717171FF00FFFF00FF
            FF00FFF0A080FF00FFFF00FFFF00FFF0B090FFC0A0FFC0A0FFC0A0FFB890FFB0
            80FFA880F0A070D17445FF00FFFF00FFFF00FFA2A2A2FF00FFFF00FFFF00FFB0
            B0B0C0C0C0C0C0C0C0C0C0B8B8B8AFAFAFA9A9A9A0A0A0777777FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFF0B090F0A880F0A080F0A070F09870E090
            60E08850E08050E07840FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB0
            B0B0A8A8A8A2A2A2A0A0A09A9A9A9090908888888282827B7B7BFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Caption = ''
          ParentColor = False
          Color = clWindow
          OnClick = SBGLClick
        end
        object Bevel2: TUniPanel
          Left = 53
          Top = 3
          Width = 2
          Height = 21
          Hint = ''
          TabOrder = 7
          Caption = ''
        end
        object Bevel1: TUniPanel
          Left = 110
          Top = 3
          Width = 2
          Height = 21
          Hint = ''
          TabOrder = 8
          Caption = ''
        end
        object SBExp: TUniSpeedButton
          Left = 166
          Top = 1
          Width = 25
          Height = 25
          Hint = 'Load the import file to the system Exp.Report table(s)'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            1800000000000006000000000000000000000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFB0A0906048306048306048306050407050
            40705040705040705040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9E
            9E9E4646464646464646464E4E4E505050505050505050505050FF00FFFF00FF
            FF00FFA04820FF00FFFF00FFFF00FFC0B0A0FFFFFFE0E8E0E0E0E0E0D8D0E0C8
            C0D0C8B0C0B8A0605040FF00FFFF00FFFF00FF4D4D4DFF00FFFF00FFFF00FFAE
            AEAEFFFFFFE6E6E6E0E0E0D7D7D7C9C9C9C4C4C4B4B4B44E4E4EFF00FFFF00FF
            FF00FFB05830A05830FF00FFFF00FFC0B0A0FFF8F0E0C8C0E0C8C0D0C0B0D0B8
            B0F0E0D0D0B8B0705040FF00FFFF00FFFF00FF5C5C5C5A5A5AFF00FFFF00FFAE
            AEAEF7F7F7C9C9C9C9C9C9BEBEBEB8B8B8DEDEDEB8B8B8505050C07850A05030
            A05030C06840E08050A05830FF00FFD0B8A0FFF8F0FFFFFFFFFFFFFFF8F0FFF0
            E0FFE8E0D0C0B07050407979795454545454546B6B6B8282825A5A5AFF00FFB5
            B5B5F7F7F7FFFFFFFFFFFFF7F7F7EEEEEEE9E9E9BEBEBE505050E09870F0B8A0
            F0B090E09870E09060D08860E07040D0B8A0FFF8FFE0C8C0E0C8C0D0C0C0D0B8
            B0F0E8E0D0C0C0705040989898B8B8B8B0B0B0989898909090888888767676B5
            B5B5FAFAFAC9C9C9C9C9C9C2C2C2B8B8B8E7E7E7C2C2C2505050F0B090F09870
            E08860E08050F0A880E07840FF00FFD0B8A0FFFFFFFFFFFFFFFFFFFFFFFFFFF8
            F0FFF0E0FFE8E0705040B0B0B09A9A9A8A8A8A828282A8A8A87B7B7BFF00FFB5
            B5B5FFFFFFFFFFFFFFFFFFFFFFFFF7F7F7EEEEEEE9E9E9505050FF00FFFF00FF
            FF00FFE08850E07840FF00FFFF00FFF0B090F0A880F0A080F09870E09060E088
            60E08050E07840D16D36FF00FFFF00FFFF00FF8888887B7B7BFF00FFFF00FFB0
            B0B0A8A8A8A2A2A29A9A9A9090908A8A8A8282827B7B7B717171FF00FFFF00FF
            FF00FFF0A080FF00FFFF00FFFF00FFF0B090FFC0A0FFC0A0FFC0A0FFB890FFB0
            80FFA880F0A070D17445FF00FFFF00FFFF00FFA2A2A2FF00FFFF00FFFF00FFB0
            B0B0C0C0C0C0C0C0C0C0C0B8B8B8AFAFAFA9A9A9A0A0A0777777FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFF0B090F0A880F0A080F0A070F09870E090
            60E08850E08050E07840FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB0
            B0B0A8A8A8A2A2A2A0A0A09A9A9A9090908888888282827B7B7BFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Caption = ''
          ParentColor = False
          Color = clWindow
          OnClick = SBExpClick
        end
      end
      object Panel23: TUniPanel
        Tag = 1999
        Left = 1
        Top = 31
        Width = 316
        Height = 25
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Caption = ''
        object Panel24: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 314
          Height = 23
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          TabOrder = 0
          Caption = ''
          Color = clBtnShadow
          object Label13: TUniLabel
            Left = 1
            Top = 1
            Width = 51
            Height = 13
            Hint = ''
            Caption = 'Schemas'
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            ParentFont = False
            Font.Color = clWhite
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 420
    Width = 844
    Height = 240
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitTop = 326
    ExplicitHeight = 289
    object PCFile: TUniPageControl
      Left = 1
      Top = 1
      Width = 842
      Height = 238
      Hint = ''
      ActivePage = TabDbf
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      ExplicitHeight = 287
      object TabEmpty: TUniTabSheet
        Hint = ''
        Caption = 'TabEmpty'
        ExplicitHeight = 259
        object PnlEmptyDefault: TUniPanel
          Tag = 1999
          Left = 0
          Top = 0
          Width = 834
          Height = 210
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = 'No file loaded.'
          ExplicitHeight = 259
          object Shape2: TUniPanel
            Left = 4
            Top = 1
            Width = 826
            Height = 205
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            ExplicitHeight = 254
          end
          object Bevel10: TUniPanel
            Left = 1
            Top = 1
            Width = 3
            Height = 205
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 2
            Caption = ''
            ExplicitHeight = 254
          end
          object Bevel11: TUniPanel
            Left = 830
            Top = 1
            Width = 3
            Height = 205
            Hint = ''
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 3
            Caption = ''
            ExplicitHeight = 254
          end
          object Bevel12: TUniPanel
            Left = 1
            Top = 206
            Width = 832
            Height = 3
            Hint = ''
            Align = alBottom
            Anchors = [akLeft, akRight, akBottom]
            TabOrder = 4
            Caption = ''
            ExplicitTop = 255
          end
        end
        object PnlEmptyCarrier: TUniPanel
          Tag = 1999
          Left = 0
          Top = 0
          Width = 834
          Height = 210
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          ExplicitHeight = 259
          object Panel14: TUniPanel
            Left = 1
            Top = 1
            Width = 832
            Height = 208
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            ExplicitHeight = 257
            object SBRecords: TUniStatusBar
              Left = 1
              Top = 188
              Width = 830
              Height = 19
              Hint = ''
              Panels = <
                item
                  Width = 830
                end>
              SizeGrip = False
              Align = alBottom
              Anchors = [akLeft, akRight, akBottom]
              ParentColor = False
              Color = clWindow
              ExplicitTop = 237
            end
            object Panel12: TUniPanel
              Tag = 1999
              Left = 1
              Top = 171
              Width = 830
              Height = 17
              Hint = ''
              Align = alBottom
              Anchors = [akLeft, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              ExplicitTop = 220
              object PB: TUniProgressBar
                Left = 1
                Top = 1
                Width = 828
                Height = 15
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 0
              end
            end
            object Panel15: TUniPanel
              Tag = 1999
              Left = 1
              Top = 1
              Width = 830
              Height = 27
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              Caption = ''
              object SbStopImport: TUniSpeedButton
                Left = 1
                Top = 1
                Width = 25
                Height = 25
                Hint = 'Stop Import'
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  36060000424D3606000000000000360000002800000020000000100000000100
                  18000000000000060000130B0000130B00000000000000000000FF00FFFF00FF
                  F6F6FCCBCBEC7777D13838C01E1EBE1818BE2020BD3D3DC18080D4D2D2EFF7F7
                  FCFF00FFFF00FFFF00FFFF00FFFF00FFF7F7F7D3D3D391919169696961616160
                  60606161616C6C6C979797D9D9D9F8F8F8FF00FFFF00FFFF00FFFF00FFF0F0F9
                  9C9CDD3535C01E1ECC1C1CE21717EA1919EA2020E92626E32525CA3D3DC1A5A5
                  E0F2F2FAFF00FFFF00FFFF00FFF2F2F2ADADAD69696968686873737376767676
                  76767777777676766868686C6C6CB4B4B4F4F4F4FF00FFFF00FFF5F5FB9B9BDD
                  3636C33939DF4443ED6969DC7A7AD88989D68080D65757E04848F54040DB3939
                  C3A6A6E0F7F7FCFF00FFF6F6F6ACACAC6A6A6A7979798282828C8C8C9595959D
                  9D9D9898988585858888887979796B6B6BB5B5B5F8F8F8FF00FFC8C8EC3B3BC2
                  4B4BDF5959F49494E1E3E3E7EFEFEEF3F3F0EEEEEBC1C1D56B6CD96464F54C4C
                  DB4444C3D3D3EFFF00FFD0D0D06B6B6B7F7F7F8F8F8FA8A8A8E4E4E4EFEFEFF3
                  F3F3EEEEEEC5C5C58D8D8D9494947E7E7E707070D9D9D9FF00FF766EC33A3CD0
                  7272F97776EFE0E0F1FFFFFDFFFFFFFFFFFFFFFFFEFAFAF7C1C1D27A7ADD7475
                  F63838CA8787D6FF00FF8787877373739C9C9C9B9B9BE4E4E4FFFFFFFFFFFFFF
                  FFFFFFFFFFFAFAFAC5C5C59797979D9D9D6E6E6E9C9C9CFF00FF2D27AF6465E7
                  7A7AFD8989EFEEEEF9FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF2F2F4B7B7D48383
                  E85C5DE24646C3FF00FF5C5C5C8F8F8FA3A3A3A6A6A6F0F0F0FFFFFFFFFFFFFF
                  FFFFFFFFFFFEFEFEF2F2F2BEBEBEA0A0A0898989717171FF00FF2121BA7576F2
                  7575FB9797EDF1F1FBFFFFFFFFFFFFFFFFFFFFFFFEF1F1F3B7B7E7D8D8E7AAAA
                  D96E6EE52D2DBEFF00FF6060609C9C9C9F9F9FAEAEAEF3F3F3FFFFFFFFFFFFFF
                  FFFFFFFFFFF1F1F1C3C3C3DBDBDBB6B6B6939393656565FF00FF2120BA6F6FF5
                  7474F7B4B4EDE2E2F2F2F2F8FFFFFFFFFFFFFFFFFED6D6DB6C6CE3A8A8EED5D5
                  E18D8DD62828BAFF00FF6060609999999D9D9DC2C2C2E6E6E6F3F3F3FFFFFFFF
                  FFFFFFFFFFD7D7D7919191BABABAD8D8D8A0A0A0626262FF00FF1E1EB96162F3
                  7F7FF2CACAE7A1A1E1DDDDEFF1F1F3F1F1F4E9E9EFDCDCDD7B7BE07D7DF7A5A5
                  ED8B8BDB2B2BBAFF00FF5F5F5F929292A1A1A1D1D1D1B1B1B1E1E1E1F1F1F1F2
                  F2F2EAEAEADCDCDC989898A2A2A2B8B8B8A0A0A0626262FF00FF2623B45051E7
                  9B9BECB8B8DD8282E7E2E2EDCECEDCDBDBE5C3C3D5E5E5E69494D67B7BFD7777
                  FB5B5BE43B3BC0FF00FF5D5D5D858585B1B1B1C1C1C19F9F9FE5E5E5D1D1D1DD
                  DDDDC7C7C7E5E5E5A5A5A5A3A3A3A0A0A08888886A6A6AFF00FF5B53B23133CE
                  A6A6E9A4A4E78C8CF2DDDDE5BEBED7D8D8E5BABAD3DCDCEAAEAED48282F97676
                  FC3939D16668D0FF00FF7171716E6E6EB7B7B7B5B5B5A9A9A9DFDFDFC4C4C4DB
                  DBDBC0C0C0DFDFDFB7B7B7A5A5A5A0A0A0727272878787FF00FFA7A7E12D2AB8
                  5151DD7F80F89999F8D7D7E2C8C8DBDADAE5BFBFD7CACAE8C5C5DB8383F25555
                  E52D2CBCA7A8E1FF00FFB6B6B6616161808080A4A4A4B3B3B3D9D9D9CCCCCCDC
                  DCDCC4C4C4D1D1D1CACACAA3A3A3868686646464B6B6B6FF00FFEEEDF57872C1
                  2F2DC15556E58B8CF7C6C6EBCFCFEAD9D9E8C3C3E1BABAF0A8A8E65757E03030
                  C68A8CDBF3F3FBFF00FFEFEFEF898989666666868686ABABABCFCFCFD5D5D5DC
                  DCDCCACACAC7C7C7B8B8B88585856A6A6AA1A1A1F5F5F5FF00FFFF00FFD1D1EC
                  938ECD3F3CC03738D06565E28686ED8F8FE98383E76565E43737CC3C3DC68F90
                  DBEAEAF8FF00FFFF00FFFF00FFD7D7D79F9F9F6B6B6B7171718C8C8CA3A3A3A8
                  A8A89F9F9F8D8D8D6F6F6F6E6E6EA4A4A4EDEDEDFF00FFFF00FFFF00FFFF00FF
                  F3F1F6C0BFE67571CA3A39C12A29C22828C22929C13939C37272D2BFBFEAF2F2
                  FBFF00FFFF00FFFF00FFFF00FFFF00FFF2F2F2C9C9C98B8B8B6A6A6A66666666
                  66666565656B6B6B8E8E8ECACACAF4F4F4FF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFCFCFEF1F0F8DEDDF1CAC5E4C0BEE5C7C7EBDEDEF3F0F0FAFCFCFEFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFCFCFCF2F2F2E2E2E2CCCCCCC8
                  C8C8CFCFCFE3E3E3F2F2F2FCFCFCFF00FFFF00FFFF00FFFF00FF}
                Caption = ''
                ParentColor = False
                Color = clWindow
                OnClick = StoptReadingFile1Click
              end
            end
            object Panel16: TUniPanel
              Tag = 1999
              Left = 1
              Top = 28
              Width = 830
              Height = 143
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 3
              Caption = ''
              ExplicitHeight = 192
              object Shape1: TUniPanel
                Left = 4
                Top = 4
                Width = 822
                Height = 135
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
                Caption = ''
                ExplicitHeight = 184
              end
              object bvTopBuffer: TUniPanel
                Left = 1
                Top = 1
                Width = 828
                Height = 3
                Hint = ''
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
                Caption = ''
              end
              object bvLeftBuffer: TUniPanel
                Left = 1
                Top = 4
                Width = 3
                Height = 135
                Hint = ''
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                TabOrder = 3
                Caption = ''
                ExplicitHeight = 184
              end
              object bvRightBuffer: TUniPanel
                Left = 826
                Top = 4
                Width = 3
                Height = 135
                Hint = ''
                Align = alRight
                Anchors = [akTop, akRight, akBottom]
                TabOrder = 4
                Caption = ''
                ExplicitHeight = 184
              end
              object bvBottomBuffer: TUniPanel
                Left = 1
                Top = 139
                Width = 828
                Height = 3
                Hint = ''
                Align = alBottom
                Anchors = [akLeft, akRight, akBottom]
                TabOrder = 5
                Caption = ''
                ExplicitTop = 188
              end
              object Label14: TUniLabel
                Left = 4
                Top = 4
                Width = 179
                Height = 13
                Hint = ''
                Alignment = taCenter
                Caption = 'Processing Import file.  Please wait...'
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 6
              end
            end
          end
        end
      end
      object TabDbf: TUniTabSheet
        Hint = ''
        Caption = 'TabDbf'
        ExplicitHeight = 259
        object Bevel7: TUniPanel
          Left = 0
          Top = 27
          Width = 834
          Height = 3
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          Caption = ''
        end
        object GridDbf: TUniDBGrid
          Left = 0
          Top = 30
          Width = 834
          Height = 161
          Hint = ''
          DataSource = SrcDBF
          LoadMask.Message = 'Loading data...'
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          DragDrop.Enabled = True
          DragDrop.EnableDrag = True
          DragDrop.DragGroup = 'D1'
          DragDrop.PromptDrop = False
        end
        object Panel10: TUniPanel
          Tag = 1999
          Left = 0
          Top = 0
          Width = 834
          Height = 27
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Caption = ''
          object NavDbf: TUniDBNavigator
            Left = 733
            Top = 1
            Width = 100
            Height = 25
            Hint = ''
            ShowHint = True
            ParentShowHint = False
            DataSource = SrcDBF
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
          end
        end
        object SBDBF: TUniStatusBar
          Left = 0
          Top = 191
          Width = 834
          Height = 19
          Hint = ''
          Panels = <
            item
              Width = 834
            end>
          SizeGrip = False
          Align = alBottom
          Anchors = [akLeft, akRight, akBottom]
          ParentColor = False
          Color = clWindow
          ExplicitTop = 240
        end
      end
      object TabAscii: TUniTabSheet
        Hint = ''
        Caption = 'TabAscii'
        ExplicitHeight = 259
        object SBASCII: TUniStatusBar
          Left = 0
          Top = 191
          Width = 834
          Height = 19
          Hint = ''
          Panels = <
            item
              Text = 'Row#'
              Width = 100
            end
            item
              Text = 'Col#'
              Width = 100
            end
            item
              Text = 'File:'
              Width = 50
            end>
          SizeGrip = False
          Align = alBottom
          Anchors = [akLeft, akRight, akBottom]
          ParentColor = False
          Color = clWindow
          ExplicitTop = 240
        end
        object RE: TUniMemo
          Left = 0
          Top = 0
          Width = 834
          Height = 191
          Hint = ''
          Lines.Strings = (
            'RE')
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          ExplicitHeight = 240
        end
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 192
    object File1: TUniMenuItem
      Caption = '&File'
      object NewSchema1: TUniMenuItem
        Caption = '&New Schema'
        OnClick = NewSchema1Click
      end
      object Search1: TUniMenuItem
        Caption = 'S&earch'
        OnClick = SBSearchClick
      end
      object Toggle1: TUniMenuItem
        Caption = '&Toggle'
        OnClick = SBGridViewClick
      end
      object N3: TUniMenuItem
        Caption = '-'
      end
      object StoptReadingFile1: TUniMenuItem
        Caption = '&Stop Reading Ascii File'
        OnClick = StoptReadingFile1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object OpenImportFile1: TUniMenuItem
        Caption = '&Open Import File'
        OnClick = OpenImportFile1Click
      end
      object ProcessImport1: TUniMenuItem
        Caption = '&Load Import File'
        OnClick = ProcessImport1Click
      end
      object N2: TUniMenuItem
        Caption = '-'
      end
      object ExportSchematoDBF1: TUniMenuItem
        Caption = '&Export Schema'
        OnClick = ExportSchematoDBF1Click
      end
      object ImportSchemafromDBF1: TUniMenuItem
        Caption = 'Import Schema'
        OnClick = ImportSchemafromDBF1Click
      end
      object N5: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Options1: TUniMenuItem
      Caption = '&Options'
      object EditMappingTable1: TUniMenuItem
        Caption = '&Edit Mapping Table'
        OnClick = EditMappingTable1Click
      end
      object AssociateschemawithExpUser1: TUniMenuItem
        Caption = 'Associate schema with Exp. User'
        OnClick = AssociateschemawithExpUser1Click
      end
    end
    object Reports1: TUniMenuItem
      Caption = '&Reports'
      object Print1: TUniMenuItem
        Caption = '&Print'
        OnClick = Print1Click
      end
      object PrintSetup1: TUniMenuItem
        Caption = 'Print Setup'
        OnClick = PrintSetup1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Import'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 195311 $'
    BuildVersion = '176554'
    Left = 336
  end
  object SrcHeader: TDataSource
    DataSet = TblHeader
    Left = 512
    Top = 208
  end
  object TblHeader: TFDTable
    BeforePost = TblHeaderBeforePost
    AfterPost = TblHeaderAfterScroll
    AfterDelete = TblHeaderAfterScroll
    AfterScroll = TblHeaderAfterScroll
    OnCalcFields = TblHeaderCalcFields
    OnNewRecord = TblHeaderNewRecord
    Filtered = True
    OnFilterRecord = TblHeaderFilterRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'PR_IMPORT_TABLES'
    TableName = 'PR_IMPORT_TABLES'
    Left = 520
    Top = 216
    object TblHeaderIMPORT_CODE: TStringField
      DisplayLabel = 'Import Code'
      DisplayWidth = 20
      FieldName = 'IMPORT_CODE'
      Required = True
      Size = 50
    end
    object TblHeaderDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 12
      FieldName = 'DESCRIP'
      Size = 250
    end
    object TblHeaderFIELD_DELIMITER: TStringField
      DisplayLabel = 'Field Delimiter'
      DisplayWidth = 12
      FieldName = 'FIELD_DELIMITER'
      Size = 250
    end
    object TblHeaderRECORD_DELIMITERS: TStringField
      DisplayLabel = 'Record Delimiters'
      DisplayWidth = 14
      FieldName = 'RECORD_DELIMITERS'
      Size = 250
    end
    object TblHeaderRECORD_LENGTH: TBCDField
      DisplayLabel = 'Record Length'
      DisplayWidth = 12
      FieldName = 'RECORD_LENGTH'
      Size = 0
    end
    object TblHeaderTABLE_TYPE: TStringField
      DisplayLabel = 'Table Type'
      DisplayWidth = 25
      FieldName = 'TABLE_TYPE'
      Required = True
      Size = 3
    end
    object TblHeaderCHARACTER_DELIMITERS: TStringField
      DisplayLabel = 'String Delimiter'
      DisplayWidth = 17
      FieldName = 'CHARACTER_DELIMITERS'
      Size = 50
    end
    object TblHeaderBUDGET_CODE: TStringField
      DisplayLabel = 'Budget Code'
      DisplayWidth = 10
      FieldName = 'BUDGET_CODE'
      Size = 10
    end
    object TblHeaderRECS_TO_SKIP: TBCDField
      DisplayLabel = 'Records to Skip'
      DisplayWidth = 12
      FieldName = 'RECS_TO_SKIP'
      Size = 0
    end
    object TblHeaderGLYear: TStringField
      DisplayLabel = 'GL Year'
      DisplayWidth = 17
      FieldKind = fkCalculated
      FieldName = 'GLYear'
      Calculated = True
    end
    object TblHeaderEXP_USER_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EXP_USER_ID'
      Size = 0
    end
    object TblHeaderGLYEAR_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'GLYEAR_ID'
      Visible = False
      Size = 0
    end
    object TblHeaderID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object TblHeaderIMPORT_TABLE_NAME: TStringField
      FieldName = 'IMPORT_TABLE_NAME'
      Visible = False
      Size = 50
    end
  end
  object SrcTables: TDataSource
    DataSet = TblTables
    Left = 496
    Top = 88
  end
  object TblTables: TFDTable
    BeforeInsert = TblTablesBeforeEdit
    BeforeEdit = TblTablesBeforeEdit
    BeforePost = TblTablesBeforePost
    IndexFieldNames = 'PR_IMPORT_TABLES_ID'
    MasterSource = SrcHeader
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'IQ_IMPORT_TABLES'
    TableName = 'IQ_IMPORT_TABLES'
    Left = 504
    Top = 96
    object TblTablesIQ_TABLE_NAME: TStringField
      DisplayLabel = 'IQMS Table '
      DisplayWidth = 20
      FieldName = 'IQ_TABLE_NAME'
      Required = True
      Size = 50
    end
    object TblTablesIMPORT_SEQ: TBCDField
      DisplayLabel = 'Import Sequence'
      DisplayWidth = 17
      FieldName = 'IMPORT_SEQ'
      Size = 0
    end
    object TblTablesSQL_STATEMENT: TStringField
      DisplayLabel = 'SQL Statement'
      DisplayWidth = 13
      FieldName = 'SQL_STATEMENT'
      Size = 2000
    end
    object TblTablesID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object TblTablesPR_IMPORT_TABLES_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PR_IMPORT_TABLES_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcFields: TDataSource
    DataSet = TblFields
    Left = 448
    Top = 152
  end
  object TblFields: TFDTable
    BeforeInsert = TblTablesBeforeEdit
    BeforeEdit = TblTablesBeforeEdit
    BeforePost = TblFieldsBeforePost
    IndexFieldNames = 'IQ_IMPORT_TABLES_ID'
    MasterSource = SrcTables
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PR_FIELDS_MATCH'
    TableName = 'PR_FIELDS_MATCH'
    Left = 456
    Top = 160
    object TblFieldsIQ_FIELD_NAME: TStringField
      DisplayLabel = 'IQ Field Name'
      DisplayWidth = 50
      FieldName = 'IQ_FIELD_NAME'
      Required = True
      Size = 50
    end
    object TblFieldsSEQ: TBCDField
      DisplayLabel = 'Sequence'
      DisplayWidth = 10
      FieldName = 'SEQ'
      Size = 0
    end
    object TblFieldsSTART_POS: TBCDField
      DisplayLabel = 'Start Pos.'
      DisplayWidth = 10
      FieldName = 'START_POS'
      Size = 0
    end
    object TblFieldsFIELD_LENGTH: TBCDField
      DisplayLabel = 'Field Length'
      DisplayWidth = 10
      FieldName = 'FIELD_LENGTH'
      Size = 0
    end
    object TblFieldsFIELD_NAME: TStringField
      DisplayLabel = 'Field Name'
      DisplayWidth = 10
      FieldName = 'FIELD_NAME'
      Size = 10
    end
    object TblFieldsDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 250
      FieldName = 'DESCRIP'
      Size = 250
    end
    object TblFieldsSQL_STATEMENT: TStringField
      DisplayLabel = 'Sql Statement'
      DisplayWidth = 10
      FieldName = 'SQL_STATEMENT'
      Size = 2000
    end
    object TblFieldsID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object TblFieldsIQ_IMPORT_TABLES_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'IQ_IMPORT_TABLES_ID'
      Visible = False
      Size = 0
    end
    object TblFieldsIqFieldName: TStringField
      FieldKind = fkLookup
      FieldName = 'IqFieldName'
      LookupDataSet = qryColumns
      LookupKeyFields = 'COLUMN_NAME'
      LookupResultField = 'COLUMN_NAME'
      KeyFields = 'IQ_FIELD_NAME'
      Lookup = True
    end
    object TblFieldsDATE_FORMAT: TStringField
      FieldName = 'DATE_FORMAT'
      Size = 50
    end
    object TblFieldsLOOKUP_TABLE: TStringField
      FieldName = 'LOOKUP_TABLE'
      Size = 50
    end
    object TblFieldsLITERAL: TStringField
      FieldName = 'LITERAL'
      Size = 1
    end
    object TblFieldsLoopkUpTable: TStringField
      FieldKind = fkLookup
      FieldName = 'LoopkUpTable'
      LookupDataSet = QryAllTables
      LookupKeyFields = 'TABLE_NAME'
      LookupResultField = 'TABLE_NAME'
      KeyFields = 'LOOKUP_TABLE'
      Lookup = True
    end
    object TblFieldsDO_NOT_APPEND_IF_ZERO: TStringField
      FieldName = 'DO_NOT_APPEND_IF_ZERO'
      Size = 1
    end
  end
  object SrcDBF: TDataSource
    DataSet = TblDbf
    Left = 168
    Top = 208
  end
  object TblDbf: TFDTable
    Tag = 1
    Left = 176
    Top = 216
  end
  object QryAllTables: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select table_name '
      '  from all_tables '
      ' where owner = '#39'IQMS'#39
      ' order by table_name  ')
    Left = 456
    Top = 88
    object QryAllTablesTABLE_NAME: TStringField
      DisplayLabel = 'Table Name'
      DisplayWidth = 30
      FieldName = 'TABLE_NAME'
      Origin = 'ALL_TABLES.TABLE_NAME'
      Size = 30
    end
  end
  object wwMemo: TwwMemoDialog
    DataSource = SrcFields
    DataField = 'SQL_STATEMENT'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    DlgLeft = 0
    DlgTop = 0
    DlgWidth = 561
    DlgHeight = 396
    Left = 572
  end
  object OpenFile: TOpenDialog
    Filter = 
      'Text Files (*.txt)|*.TXT|DBF Files (*.dbf)|*.DBF|Excel (*.xls)|*' +
      '.XLS|All Files (*.*)|*.*'
    Left = 448
  end
  object PKEmp: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select To_Char(id) as id,'
      '       empno,'
      '       first_name,'
      '       middle_name,'
      '       last_name,'
      '       ssnmbr,'
      '       addr1,'
      '       addr2,'
      '       state,'
      '       country,'
      '       zip,'
      '       phone_number,'
      '       city'
      '  from pr_emp    '
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 25
    Top = 164
    object PKEmpID: TStringField
      FieldName = 'ID'
      Visible = False
      Size = 40
    end
    object PKEmpEMPNO: TStringField
      DisplayLabel = 'Emp#'
      FieldName = 'EMPNO'
      Size = 25
    end
    object PKEmpFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      FieldName = 'FIRST_NAME'
      Size = 30
    end
    object PKEmpMIDDLE_NAME: TStringField
      DisplayLabel = 'Middle Name'
      FieldName = 'MIDDLE_NAME'
      Size = 30
    end
    object PKEmpLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      FieldName = 'LAST_NAME'
      Size = 30
    end
    object PKEmpSSNMBR: TStringField
      DisplayLabel = 'SSN'
      FieldName = 'SSNMBR'
      Size = 11
    end
    object PKEmpADDR1: TStringField
      DisplayLabel = 'Addr1'
      FieldName = 'ADDR1'
      Size = 60
    end
    object PKEmpADDR2: TStringField
      DisplayLabel = 'Addr2'
      FieldName = 'ADDR2'
      Size = 60
    end
    object PKEmpSTATE: TStringField
      DisplayLabel = 'State'
      FieldName = 'STATE'
    end
    object PKEmpCOUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      Size = 30
    end
    object PKEmpZIP: TStringField
      FieldName = 'ZIP'
      Size = 10
    end
    object PKEmpPHONE_NUMBER: TStringField
      DisplayLabel = 'Phone#.'
      FieldName = 'PHONE_NUMBER'
      Size = 25
    end
    object PKEmpCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Size = 30
    end
  end
  object PKPayType: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select To_Char(id) as id,'
      '       description'
      '  from pr_paytype')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 53
    Top = 164
    object PKPayTypeID: TStringField
      FieldName = 'ID'
      Visible = False
      Size = 40
    end
    object PKPayTypeDESCRIPTION: TStringField
      DisplayLabel = 'PayType'
      FieldName = 'DESCRIPTION'
      Size = 50
    end
  end
  object qryColumns: TFDQuery
    MasterSource = SrcTables
    MasterFields = 'IQ_TABLE_NAME'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select column_name'
      '  from all_tab_columns'
      ' where table_name =  :iq_table_name'
      '   and owner = '#39'IQMS'#39
      ' order by column_name')
    Left = 496
    Top = 152
    ParamData = <
      item
        Name = 'IQ_TABLE_NAME'
        DataType = ftString
        ParamType = ptInput
        Size = 51
      end>
    object qryColumnsCOLUMN_NAME: TStringField
      DisplayLabel = 'Fields to match'
      DisplayWidth = 34
      FieldName = 'COLUMN_NAME'
      Origin = 'ALL_TAB_COLUMNS.COLUMN_NAME'
      Size = 30
    end
  end
  object PKImport: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       import_code,'
      '       descrip,'
      '       table_type'
      '  from pr_import_tables     '
      'where exp_user_id is null')
    OnIQModify = PKImportIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 149
    Top = 136
    object PKImportID: TBCDField
      FieldName = 'ID'
      Origin = 'PR_IMPORT_TABLES.ID'
      Visible = False
      Size = 0
    end
    object PKImportIMPORT_CODE: TStringField
      DisplayLabel = 'Import Code'
      FieldName = 'IMPORT_CODE'
      Origin = 'PR_IMPORT_TABLES.IMPORT_CODE'
      Size = 50
    end
    object PKImportDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'PR_IMPORT_TABLES.DESCRIP'
      Size = 250
    end
    object PKImportTABLE_TYPE: TStringField
      DisplayLabel = 'Table Type'
      FieldName = 'TABLE_TYPE'
      Size = 3
    end
  end
  object PkAcct: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '          acct,'
      '          descrip,'
      '          type'
      '  from V_GLACCT_GLSUB_ACCT_TYPE')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 81
    Top = 164
    object PkAcctID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkAcctACCT: TStringField
      DisplayLabel = 'Acct#'
      FieldName = 'ACCT'
      Size = 50
    end
    object PkAcctDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object PkAcctTYPE: TStringField
      DisplayLabel = 'Acct. Type'
      FieldName = 'TYPE'
      Origin = 'V_GLACCT_GLSUB_ACCT_TYPE.TYPE'
      Size = 35
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 304
    object CopyRecord1: TUniMenuItem
      Caption = '&Copy Record'
      OnClick = CopyRecord1Click
    end
    object PasteRecord1: TUniMenuItem
      Caption = '&Paste Record'
      OnClick = PasteRecord1Click
    end
    object N4: TUniMenuItem
      Caption = '-'
    end
    object CopyAllRecords1: TUniMenuItem
      Caption = 'Copy &All Records'
      OnClick = CopyAllRecords1Click
    end
    object PasteAllRecords1: TUniMenuItem
      Caption = 'Paste All &Records'
      OnClick = PasteAllRecords1Click
    end
  end
  object QryBatchMove: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select  import_code,'
      '        descrip,'
      '        import_table_name,'
      '        table_type,'
      '        field_delimiter,'
      '        record_delimiters,'
      '        record_length,'
      '        character_delimiters'
      '  from PR_IMPORT_TABLES'
      '')
    Left = 520
    Top = 264
  end
  object BatchMove1: TFDDataMove
    TextDataDef.Fields = <>
    TextFileName = 'Data.txt'
    Mappings = <>
    LogFileName = 'Data.log'
    Left = 456
    Top = 264
  end
  object PkGlYear: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id as id,'
      '       descrip as descrip,'
      '       start_date as start_date,'
      '       end_date   as end_date'
      ' from glyear')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 93
    Top = 136
    object PkGlYearID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.GLYEAR.ID'
      Visible = False
      Size = 0
    end
    object PkGlYearDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'IQ.GLYEAR.DESCRIP'
      Size = 25
    end
    object PkGlYearSTART_DATE: TDateTimeField
      DisplayLabel = 'Start Date'
      FieldName = 'START_DATE'
      Origin = 'IQ.GLYEAR.START_DATE'
    end
    object PkGlYearEND_DATE: TDateTimeField
      DisplayLabel = 'End Date'
      FieldName = 'END_DATE'
      Origin = 'IQ.GLYEAR.END_DATE'
    end
  end
  object PkBudgets: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id as id,'
      '       descrip as descrip,'
      '       code    as code'
      '  from budgets')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 121
    Top = 136
    object PkBudgetsID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.BUDGETS.ID'
      Visible = False
      Size = 0
    end
    object PkBudgetsDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'IQ.BUDGETS.DESCRIP'
      Size = 50
    end
    object PkBudgetsCODE: TStringField
      DisplayLabel = 'Code'
      FieldName = 'CODE'
      Origin = 'IQ.BUDGETS.CODE'
      Size = 10
    end
  end
  object PopupMenu2: TUniPopupMenu
    Left = 220
    object ClearBudgetCode1: TUniMenuItem
      Caption = 'Clear Budget Code'
      OnClick = ClearBudgetCode1Click
    end
  end
  object PopupMenu3: TUniPopupMenu
    Left = 248
    object ClearFiscalYear1: TUniMenuItem
      Caption = 'Clear Fiscal Year'
      OnClick = ClearFiscalYear1Click
    end
  end
  object SrcBudgetFields: TDataSource
    DataSet = TblBudgetFields
    Left = 448
    Top = 208
  end
  object TblBudgetFields: TFDTable
    BeforeInsert = TblBudgetFieldsBeforeEdit
    BeforeEdit = TblBudgetFieldsBeforeEdit
    BeforePost = TblBudgetFieldsBeforePost
    OnCalcFields = TblBudgetFieldsCalcFields
    IndexFieldNames = 'PR_IMPORT_TABLES_ID'
    MasterSource = SrcHeader
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'BUDGET_FIELDS_MATCH'
    TableName = 'BUDGET_FIELDS_MATCH'
    Left = 456
    Top = 216
    object TblBudgetFieldsACCT_SEQ: TBCDField
      DisplayLabel = 'Account # Sequence'
      DisplayWidth = 10
      FieldName = 'ACCT_SEQ'
      Size = 0
    end
    object TblBudgetFieldsSEQ: TBCDField
      DisplayLabel = 'Sequence'
      DisplayWidth = 10
      FieldName = 'SEQ'
      Size = 0
    end
    object TblBudgetFieldsSTART_POS: TBCDField
      DisplayLabel = 'Flat Start Position'
      DisplayWidth = 10
      FieldName = 'START_POS'
      Size = 0
    end
    object TblBudgetFieldsFIELD_LENGTH: TBCDField
      DisplayLabel = 'Flat Field Length'
      DisplayWidth = 10
      FieldName = 'FIELD_LENGTH'
      Size = 0
    end
    object TblBudgetFieldsFIELD_NAME: TStringField
      DisplayLabel = 'Field Name'
      DisplayWidth = 10
      FieldName = 'FIELD_NAME'
      Size = 10
    end
    object TblBudgetFieldsDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 50
      FieldName = 'DESCRIP'
      Size = 250
    end
    object TblBudgetFieldsFIELD_TYPE: TStringField
      DisplayLabel = 'Field Type'
      DisplayWidth = 10
      FieldName = 'FIELD_TYPE'
      Size = 10
    end
    object TblBudgetFieldsPeriod: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Period'
      Calculated = True
    end
    object TblBudgetFieldsSQL_STATEMENT: TStringField
      DisplayWidth = 10
      FieldName = 'SQL_STATEMENT'
      Visible = False
      Size = 2000
    end
    object TblBudgetFieldsGLPERIODS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'GLPERIODS_ID'
      Visible = False
      Size = 0
    end
    object TblBudgetFieldsID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object TblBudgetFieldsPR_IMPORT_TABLES_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PR_IMPORT_TABLES_ID'
      Visible = False
      Size = 0
    end
  end
  object PkPeriods: TIQWebHpick
    BeforeOpen = PkPeriodsBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id as id,'
      '       period as period,'
      '       start_date as start_date,'
      '       end_date as end_date'
      '  from glperiods'
      ' where glyear_id = :AID'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 65
    Top = 136
    ParamData = <
      item
        Name = 'AID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkPeriodsID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.GLPERIODS.ID'
      Visible = False
      Size = 0
    end
    object PkPeriodsPERIOD: TBCDField
      DisplayLabel = 'Period'
      FieldName = 'PERIOD'
      Origin = 'IQ.GLPERIODS.PERIOD'
      Size = 0
    end
    object PkPeriodsSTART_DATE: TDateTimeField
      DisplayLabel = 'Start Date'
      FieldName = 'START_DATE'
      Origin = 'IQ.GLPERIODS.START_DATE'
    end
    object PkPeriodsEND_DATE: TDateTimeField
      DisplayLabel = 'End Date'
      FieldName = 'END_DATE'
      Origin = 'IQ.GLPERIODS.END_DATE'
    end
  end
  object PopupMenu4: TUniPopupMenu
    Left = 276
    object ClearPeriod1: TUniMenuItem
      Caption = 'Clear Period'
      OnClick = ClearPeriod1Click
    end
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmPrImport'
    WebUse = False
    TouchScreen = False
    Left = 364
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 420
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'NavHeader'
      'SBSearch'
      'SBGridView'
      'sbStop'
      'sbOpen'
      'sbProcess'
      'SBGL'
      'PC'
      'GridHeader'
      'dbTableType1'
      'dbImportCode'
      'dbDescrip'
      'dbFieldDelim'
      'dbRecordDelim'
      'dbRecordLen'
      'dbCharDelim'
      'dbTableType2'
      'DBEdit1'
      'dbCode'
      'dbYear'
      'NavTables'
      'GridTables'
      'NavFields'
      'GridFields'
      'TabBudget'
      'NavBudget'
      'GridBudget'
      'dbFieldType'
      'dbPeriods'
      'PCFile'
      'TabDbf'
      'GridDbf'
      'NavDbf'
      'SBDBF'
      'TabAscii'
      'RE'
      'SBASCII'
      'TabEmpty'
      'SBRecords'
      'PB'
      'SbStopImport'
      'NewSchema1'
      'Search1'
      'Toggle1'
      'StoptReadingFile1'
      'OpenImportFile1'
      'ProcessImport1'
      'ExportSchematoDBF1'
      'ImportSchemafromDBF1'
      'EditMappingTable1'
      'Print1'
      'PrintSetup1'
      'About1'
      'Contents1'
      'Help1'
      'IQAbout1'
      'TblHeader'
      'TblTables'
      'TblDbf'
      'wwMemo'
      'OpenFile'
      'qryColumns'
      'CopyRecord1'
      'PasteRecord1'
      'CopyAllRecords1'
      'PasteAllRecords1'
      'BatchMove1'
      'ClearBudgetCode1'
      'ClearFiscalYear1'
      'ClearPeriod1'
      '')
    SecurityCode = 'FRMPRIMPORT'
    Left = 392
  end
  object PkImportExp: TIQWebHpick
    BeforeOpen = PkImportExpBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       import_code,'
      '       descrip,'
      '       table_type'
      '  from pr_import_tables     '
      'where exp_user_id = :AId')
    OnIQModify = PKImportIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 181
    Top = 136
    ParamData = <
      item
        Name = 'AId'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object FloatField1: TBCDField
      FieldName = 'ID'
      Origin = 'PR_IMPORT_TABLES.ID'
      Visible = False
      Size = 0
    end
    object StringField1: TStringField
      DisplayLabel = 'Import Code'
      FieldName = 'IMPORT_CODE'
      Origin = 'PR_IMPORT_TABLES.IMPORT_CODE'
      Size = 50
    end
    object StringField2: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'PR_IMPORT_TABLES.DESCRIP'
      Size = 250
    end
    object StringField3: TStringField
      DisplayLabel = 'Table Type'
      FieldName = 'TABLE_TYPE'
      Size = 3
    end
  end
  object PkAssoc: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       import_code,'
      '       descrip,'
      '       table_type'
      '  from pr_import_tables     ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 213
    Top = 136
    object FloatField2: TBCDField
      FieldName = 'ID'
      Origin = 'PR_IMPORT_TABLES.ID'
      Visible = False
      Size = 0
    end
    object StringField4: TStringField
      DisplayLabel = 'Import Code'
      FieldName = 'IMPORT_CODE'
      Origin = 'PR_IMPORT_TABLES.IMPORT_CODE'
      Size = 50
    end
    object StringField5: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'PR_IMPORT_TABLES.DESCRIP'
      Size = 250
    end
    object StringField6: TStringField
      DisplayLabel = 'Table Type'
      FieldName = 'TABLE_TYPE'
      Size = 3
    end
  end
  object OpenDialog3: TOpenDialog
    DefaultExt = 'SQLite3'
    Left = 208
    Top = 216
  end
  object QrySqlShema: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    Left = 32
    Top = 408
  end
  object QrySqlFiles: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    Left = 112
    Top = 408
  end
  object QrySqlFields: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    Left = 192
    Top = 408
  end
  object QrySqlBudgetFields: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    Left = 295
    Top = 408
  end
end
