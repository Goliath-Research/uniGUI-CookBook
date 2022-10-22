object FrmVerMainWizard: TFrmVerMainWizard
  Left = 249
  Top = 155
  ClientHeight = 377
  ClientWidth = 624
  Caption = ''
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 119
    Top = 5
    Width = 6
    Height = 336
    Hint = ''
    Visible = False
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object Bevel5: TUniPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 5
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
    Caption = ''
  end
  object PnlMain: TUniPanel
    Left = 125
    Top = 5
    Width = 499
    Height = 336
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitLeft = 122
    ExplicitWidth = 502
    object pcMain: TUniPageControl
      Left = 1
      Top = 1
      Width = 497
      Height = 334
      Hint = ''
      ActivePage = TabSheet3
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabSheet1: TUniTabSheet
        Hint = ''
        Caption = 'Table and Column'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 328
        object PnlColumn: TUniPanel
          Left = 0
          Top = 73
          Width = 489
          Height = 233
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object Label9: TUniLabel
            Left = 16
            Top = 52
            Width = 55
            Height = 13
            Hint = ''
            Caption = 'Table name'
            TabOrder = 3
          end
          object Label10: TUniLabel
            Left = 16
            Top = 76
            Width = 64
            Height = 13
            Hint = ''
            Caption = 'Column name'
            TabOrder = 4
          end
          object cmbTableName: TUniDBLookupComboBox
            Left = 136
            Top = 48
            Width = 145
            Height = 21
            Hint = ''
            ListFieldIndex = 0
            DataField = 'TABLE_NAME'
            DataSource = SrcColumn
            TabOrder = 0
            Color = clWindow
          end
          object cmbColumnName: TUniDBLookupComboBox
            Left = 136
            Top = 72
            Width = 145
            Height = 21
            Hint = ''
            ShowHint = True
            ParentShowHint = False
            ListFieldIndex = 0
            DataField = 'COLUMN_NAME'
            DataSource = SrcColumn
            TabOrder = 1
            Color = clWindow
            OnDropDown = cmbColumnNameDropDown
          end
        end
        object Panel5: TUniPanel
          Left = 0
          Top = 0
          Width = 489
          Height = 73
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Caption = ''
          DesignSize = (
            489
            73)
          object Label3: TUniLabel
            Left = 8
            Top = 12
            Width = 146
            Height = 13
            Hint = ''
            Caption = 'Verification Table/Column'
            ParentFont = False
            Font.Style = [fsBold]
            TabOrder = 1
          end
          object Label4: TUniLabel
            Left = 8
            Top = 32
            Width = 487
            Height = 35
            Hint = ''
            AutoSize = False
            Caption = 
              'Select the table and column that you would like to setup to be v' +
              'erified.'
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 2
          end
        end
      end
      object TabSheet3: TUniTabSheet
        Hint = ''
        ImageIndex = 2
        Caption = 'Conditions'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 328
        object PnlCondition: TUniPanel
          Left = 0
          Top = 73
          Width = 489
          Height = 233
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object Bevel1: TUniPanel
            Left = 1
            Top = 27
            Width = 487
            Height = 3
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
            Caption = ''
          end
          object PnlConditionToolbar: TUniPanel
            Left = 1
            Top = 1
            Width = 487
            Height = 27
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Caption = ''
            object NavCondition: TUniDBNavigator
              Left = 262
              Top = 1
              Width = 225
              Height = 25
              Hint = ''
              DataSource = SrcCondition
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
              Align = alRight
              Anchors = [akTop, akRight, akBottom]
              TabOrder = 0
            end
          end
          object PnlConditionGrid: TUniPanel
            Left = 1
            Top = 30
            Width = 487
            Height = 203
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            ExplicitLeft = 6
            ExplicitTop = 36
            ExplicitWidth = 482
            ExplicitHeight = 213
            object GridCondition: TIQUniGridControl
              Left = 1
              Top = 1
              Width = 485
              Height = 201
              Layout = 'border'
              ParentAlignmentControl = False
              AlignmentControl = uniAlignmentClient
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
              IQComponents.Grid.Left = 0
              IQComponents.Grid.Top = 29
              IQComponents.Grid.Width = 268
              IQComponents.Grid.Height = 115
              IQComponents.Grid.Hint = ''
              IQComponents.Grid.DataSource = SrcCondition
              IQComponents.Grid.LoadMask.Message = 'Loading data...'
              IQComponents.Grid.Align = alClient
              IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
              IQComponents.Grid.TabOrder = 0
              IQComponents.Grid.OnDrawColumnCell = GridConditionDBGridDrawColumnCell
              IQComponents.Navigator.Left = 410
              IQComponents.Navigator.Top = 0
              IQComponents.Navigator.Width = 241
              IQComponents.Navigator.Height = 25
              IQComponents.Navigator.Hint = ''
              IQComponents.Navigator.ShowHint = True
              IQComponents.Navigator.DataSource = SrcCondition
              IQComponents.Navigator.LayoutConfig.Region = 'east'
              IQComponents.Navigator.TabOrder = 3
              IQComponents.HiddenPanel.Left = 268
              IQComponents.HiddenPanel.Top = 29
              IQComponents.HiddenPanel.Width = 209
              IQComponents.HiddenPanel.Height = 115
              IQComponents.HiddenPanel.Hint = ''
              IQComponents.HiddenPanel.Visible = True
              IQComponents.HiddenPanel.Align = alRight
              IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
              IQComponents.FormTab.Hint = ''
              IQComponents.FormTab.ImageIndex = 1
              IQComponents.FormTab.Caption = 'Form'
              IQComponents.FormTab.Layout = 'border'
              DataSource = SrcCondition
              Columns = <
                item
                  FieldName = 'CONDITION_COLUMN'
                  Title.Caption = 'Condition Column'
                  Width = 140
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'CONDITION_VALUE'
                  Title.Caption = 'Condition Value'
                  Width = 140
                  CheckBoxField.FieldValues = 'true;false'
                end>
              Marker = 0
            end
            object cmbGridConditionColumnName: TUniDBLookupComboBox
              Left = 136
              Top = 72
              Width = 121
              Height = 21
              Hint = ''
              ShowHint = True
              ParentShowHint = False
              ListFieldIndex = 0
              TabOrder = 1
              Color = clWindow
              OnDropDown = cmbColumnNameDropDown
            end
          end
        end
        object Panel2: TUniPanel
          Left = 0
          Top = 0
          Width = 489
          Height = 73
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Caption = ''
          DesignSize = (
            489
            73)
          object Label5: TUniLabel
            Left = 8
            Top = 12
            Width = 157
            Height = 13
            Hint = ''
            Caption = 'Conditional Value (Optional)'
            ParentFont = False
            Font.Style = [fsBold]
            TabOrder = 1
          end
          object Label6: TUniLabel
            Left = 8
            Top = 32
            Width = 481
            Height = 27
            Hint = ''
            AutoSize = False
            Caption = 
              'Specify column and value that must apply for verification to occ' +
              'ur.'
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 2
          end
        end
      end
      object TabSheet2: TUniTabSheet
        Hint = ''
        ImageIndex = 1
        Caption = 'Segments'
        object PnlSegmentDisplay: TUniPanel
          Left = 0
          Top = 73
          Width = 489
          Height = 233
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object Splitter2: TUniSplitter
            Left = 332
            Top = 0
            Width = 6
            Height = 233
            Hint = ''
            Align = alRight
            ParentColor = False
            Color = clBtnFace
          end
          object PnlSegmentGrids: TUniPanel
            Left = 1
            Top = 1
            Width = 332
            Height = 231
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            object Bevel4: TUniPanel
              Left = 1
              Top = 159
              Width = 330
              Height = 3
              Hint = ''
              Align = alBottom
              Anchors = [akLeft, akRight, akBottom]
              TabOrder = 3
              Caption = ''
            end
            object PnlSegment: TUniPanel
              Left = 1
              Top = 1
              Width = 330
              Height = 159
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
              Caption = ''
              object Bevel3: TUniPanel
                Left = 1
                Top = 47
                Width = 328
                Height = 3
                Hint = ''
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 4
                Caption = ''
              end
              object PnlSegmentToolbar: TUniPanel
                Left = 1
                Top = 20
                Width = 328
                Height = 27
                Hint = ''
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                Caption = ''
                object sbtnMoveUp: TUniSpeedButton
                  Left = 1
                  Top = 1
                  Width = 25
                  Height = 25
                  Hint = 'Move Up'
                  ShowHint = True
                  ParentShowHint = False
                  Glyph.Data = {
                    46010000424D460100000000000076000000280000001A0000000D0000000100
                    040000000000D000000000000000000000001000000000000000000000000000
                    8000008000000080800080000000800080008080000080808000C0C0C0000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                    DDDDDDDDDDDDDD000000DDDDDDDDDDDDDDDDDDFFFFFDDD000000DDDD00000DDD
                    DDDDD77777FDDD000000DDDD06660DDDDDDDD7F887FDDD000000DDDD06660DDD
                    DDDDD7F887FDDD000000DDDD06660DDDDDDDD7F887FDDD000000D00006660000
                    DD77778887777F000000DD066666660DDDD78F888887FD000000DDD0666660DD
                    DDDD78F8887FDD000000DDDD06660DDDDDDDD78F87FDDD000000DDDDD060DDDD
                    DDDDDD787FDDDD000000DDDDDD0DDDDDDDDDDDD7FDDDDD000000DDDDDDDDDDDD
                    DDDDDDDDDDDDDD000000}
                  Caption = ''
                  ParentColor = False
                  Color = clWindow
                  OnClick = sbtnMoveUpClick
                end
                object sbtnMoveDown: TUniSpeedButton
                  Left = 26
                  Top = 1
                  Width = 25
                  Height = 25
                  Hint = 'Move Down'
                  ShowHint = True
                  ParentShowHint = False
                  Glyph.Data = {
                    46010000424D460100000000000076000000280000001A0000000D0000000100
                    040000000000D000000000000000000000001000000000000000000000000000
                    8000008000000080800080000000800080008080000080808000C0C0C0000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                    DDDDDDDDDDDDDD000000DDDDDD0DDDDDDDDDDDD7FDDDDD000000DDDDD060DDDD
                    DDDDDD787FDDDD000000DDDD06660DDDDDDDD78F87FDDD000000DDD0666660DD
                    DDDD78F8887FDD000000DD066666660DDDD78F888887FD000000D00006660000
                    DD77778887777F000000DDDD06660DDDDDDDD7F887FDDD000000DDDD06660DDD
                    DDDDD7F887FDDD000000DDDD06660DDDDDDDD7F887FDDD000000DDDD00000DDD
                    DDDDD77777DDDD000000DDDDDDDDDDDDDDDDDDDDDDDDDD000000DDDDDDDDDDDD
                    DDDDDDDDDDDDDD000000}
                  Caption = ''
                  ParentColor = False
                  Color = clWindow
                  OnClick = sbtnMoveDownClick
                end
                object sbtnCheckMask: TUniSpeedButton
                  Left = 56
                  Top = 1
                  Width = 25
                  Height = 25
                  Hint = 'Check segments'
                  ShowHint = True
                  ParentShowHint = False
                  Glyph.Data = {
                    F6000000424DF600000000000000760000002800000010000000100000000100
                    0400000000008000000000000000000000001000000000000000000000000000
                    8000008000000080800080000000800080008080000080808000C0C0C0000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                    DDDDD700000000000DDDD7FFFFFFFFFF0DDDD7FFFFFFFFFF0DDDD7FFFFF800FF
                    0DDDD7FFFF7000FF0DDDD7FFF700000F0DDDD7FFF000F00F7DDDD7FFF00FFF00
                    7DDDD7FFFFFFFF007DDDD7FFFFFFFFF00DDDD7FFFFFFF77800DDD7FFFFFFF7F7
                    D00DD7FFFFFFF77DDDDDD777777777DDDDDDDDDDDDDDDDDDDDDD}
                  Caption = ''
                  ParentColor = False
                  Color = clWindow
                  OnClick = sbtnCheckMaskClick
                end
                object NavSegment: TUniDBNavigator
                  Left = 103
                  Top = 1
                  Width = 225
                  Height = 25
                  Hint = ''
                  DataSource = SrcSegment
                  VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
                  Align = alRight
                  Anchors = [akTop, akRight, akBottom]
                  TabOrder = 0
                end
              end
              object PnlSegmentGrid: TUniPanel
                Left = 1
                Top = 50
                Width = 328
                Height = 109
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
                Caption = ''
                object GridSegment: TIQUniGridControl
                  Left = 1
                  Top = 1
                  Width = 326
                  Height = 107
                  Layout = 'border'
                  ParentAlignmentControl = False
                  AlignmentControl = uniAlignmentClient
                  Align = alClient
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  TabOrder = 0
                  IQComponents.Grid.Left = 0
                  IQComponents.Grid.Top = 29
                  IQComponents.Grid.Width = 109
                  IQComponents.Grid.Height = 21
                  IQComponents.Grid.Hint = ''
                  IQComponents.Grid.DataSource = SrcSegment
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
                  IQComponents.Navigator.DataSource = SrcSegment
                  IQComponents.Navigator.LayoutConfig.Region = 'east'
                  IQComponents.Navigator.TabOrder = 3
                  IQComponents.HiddenPanel.Left = 109
                  IQComponents.HiddenPanel.Top = 29
                  IQComponents.HiddenPanel.Width = 209
                  IQComponents.HiddenPanel.Height = 21
                  IQComponents.HiddenPanel.Hint = ''
                  IQComponents.HiddenPanel.Visible = True
                  IQComponents.HiddenPanel.Align = alRight
                  IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
                  IQComponents.FormTab.Hint = ''
                  IQComponents.FormTab.ImageIndex = 1
                  IQComponents.FormTab.Caption = 'Form'
                  IQComponents.FormTab.Layout = 'border'
                  DataSource = SrcSegment
                  Columns = <
                    item
                      FieldName = 'SEQ'
                      Title.Caption = '#'
                      Width = 70
                      CheckBoxField.FieldValues = 'true;false'
                    end
                    item
                      FieldName = 'NAME'
                      Title.Caption = 'Name'
                      Width = 105
                      CheckBoxField.FieldValues = 'true;false'
                    end
                    item
                      FieldName = 'START_POS'
                      Title.Caption = 'Start'
                      Width = 70
                      CheckBoxField.FieldValues = 'true;false'
                    end
                    item
                      FieldName = 'LENGTH'
                      Title.Caption = 'Length'
                      Width = 70
                      CheckBoxField.FieldValues = 'true;false'
                    end
                    item
                      FieldName = 'ALLOW_NULL'
                      Title.Caption = 'Allow Null?'
                      Width = 7
                      CheckBoxField.FieldValues = 'Y;N'
                    end>
                  Marker = 0
                end
              end
              object Panel7: TUniPanel
                Left = 1
                Top = 1
                Width = 328
                Height = 20
                Hint = ''
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Color = clWhite
                TabOrder = 2
                Caption = ''
                Color = clBtnShadow
                object Label11: TUniLabel
                  Left = 1
                  Top = 1
                  Width = 57
                  Height = 13
                  Hint = ''
                  Caption = 'Segments'
                  Align = alTop
                  Anchors = [akLeft, akTop, akRight]
                  ParentFont = False
                  Font.Color = clWhite
                  Font.Style = [fsBold]
                  TabOrder = 1
                end
              end
            end
            object PnlDisplayOuter: TUniPanel
              Left = 1
              Top = 162
              Width = 330
              Height = 69
              Hint = ''
              Align = alBottom
              Anchors = [akLeft, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              object PnlDisplay: TUniPanel
                Left = 1
                Top = 17
                Width = 328
                Height = 52
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 0
                Caption = ''
                Color = clWhite
                object sbDisplay: TUniScrollBox
                  Left = 0
                  Top = 0
                  Width = 328
                  Height = 52
                  Hint = ''
                  Align = alClient
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  Color = clWhite
                  TabOrder = 0
                  ScrollHeight = 17
                  ScrollWidth = 185
                  object PnlRuler: TUniPanel
                    Left = 0
                    Top = 0
                    Width = 185
                    Height = 17
                    Hint = ''
                    TabOrder = 0
                    Alignment = taLeftJustify
                    Caption = ''
                  end
                end
              end
              object Panel4: TUniPanel
                Left = 1
                Top = 1
                Width = 328
                Height = 17
                Hint = ''
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Color = clWhite
                TabOrder = 1
                Caption = ''
                Color = clBtnShadow
                object Label8: TUniLabel
                  Left = 1
                  Top = 1
                  Width = 45
                  Height = 13
                  Hint = ''
                  Caption = 'Preview'
                  Align = alTop
                  Anchors = [akLeft, akTop, akRight]
                  ParentFont = False
                  Font.Color = clWhite
                  Font.Style = [fsBold]
                  TabOrder = 1
                end
              end
            end
          end
          object PnlValue: TUniPanel
            Left = 338
            Top = 1
            Width = 151
            Height = 231
            Hint = ''
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            object Panel8: TUniPanel
              Left = 1
              Top = 1
              Width = 149
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
                Width = 37
                Height = 13
                Hint = ''
                Caption = 'Values'
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Color = clWhite
                Font.Style = [fsBold]
                TabOrder = 1
              end
            end
            object Panel6: TUniPanel
              Left = 1
              Top = 20
              Width = 149
              Height = 24
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              Caption = ''
              DesignSize = (
                149
                24)
              object cmbValueType: TUniDBComboBox
                Left = 1
                Top = 2
                Width = 147
                Height = 21
                Hint = 'Specify the type of data used for validation'
                ShowHint = True
                ParentShowHint = False
                Anchors = [akLeft, akTop, akRight]
                DataField = 'TYPE'
                DataSource = SrcSegment
                Style = csDropDownList
                Items.Strings = (
                  'Text Values'#9'0'
                  'Numeric Range'#9'1')
                TabOrder = 0
                OnChange = cmbValueTypeChange
              end
            end
            object PnlPcValues: TUniPanel
              Left = 1
              Top = 44
              Width = 149
              Height = 187
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 2
              Caption = ''
              object pcValues: TUniPageControl
                Left = 1
                Top = 1
                Width = 147
                Height = 185
                Hint = ''
                ActivePage = TabNumber
                TabBarVisible = True
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 0
                object TabText: TUniTabSheet
                  Hint = ''
                  ImageIndex = 1
                  Caption = 'TabText'
                  object Bevel2: TUniPanel
                    Left = 0
                    Top = 27
                    Width = 139
                    Height = 3
                    Hint = ''
                    Align = alTop
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    Caption = ''
                  end
                  object PnlValueToolbar: TUniPanel
                    Left = 0
                    Top = 0
                    Width = 139
                    Height = 27
                    Hint = ''
                    Align = alTop
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 0
                    Caption = ''
                    object NavValue: TUniDBNavigator
                      Left = 14
                      Top = 1
                      Width = 125
                      Height = 25
                      Hint = ''
                      DataSource = SrcValue
                      VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
                      Align = alRight
                      Anchors = [akTop, akRight, akBottom]
                      TabOrder = 0
                    end
                  end
                  object PnlValueGrid: TUniPanel
                    Left = 0
                    Top = 30
                    Width = 139
                    Height = 127
                    Hint = ''
                    Align = alClient
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    TabOrder = 1
                    Caption = ''
                    object GridValue: TIQUniGridControl
                      Left = 1
                      Top = 1
                      Width = 137
                      Height = 125
                      Layout = 'border'
                      ParentAlignmentControl = False
                      AlignmentControl = uniAlignmentClient
                      Align = alClient
                      Anchors = [akLeft, akTop, akRight, akBottom]
                      TabOrder = 0
                      IQComponents.Grid.Left = 0
                      IQComponents.Grid.Top = 29
                      IQComponents.Grid.Width = 434
                      IQComponents.Grid.Height = 39
                      IQComponents.Grid.Hint = ''
                      IQComponents.Grid.DataSource = SrcValue
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
                      IQComponents.Navigator.DataSource = SrcValue
                      IQComponents.Navigator.LayoutConfig.Region = 'east'
                      IQComponents.Navigator.TabOrder = 3
                      IQComponents.HiddenPanel.Left = -80
                      IQComponents.HiddenPanel.Top = 29
                      IQComponents.HiddenPanel.Width = 209
                      IQComponents.HiddenPanel.Height = 39
                      IQComponents.HiddenPanel.Hint = ''
                      IQComponents.HiddenPanel.Visible = True
                      IQComponents.HiddenPanel.Align = alRight
                      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
                      IQComponents.FormTab.Hint = ''
                      IQComponents.FormTab.ImageIndex = 1
                      IQComponents.FormTab.Caption = 'Form'
                      IQComponents.FormTab.Layout = 'border'
                      DataSource = SrcValue
                      Columns = <
                        item
                          FieldName = 'VALUE'
                          Title.Caption = 'Value'
                          Width = 175
                          CheckBoxField.FieldValues = 'true;false'
                        end>
                      Marker = 0
                    end
                  end
                end
                object TabNumber: TUniTabSheet
                  Hint = ''
                  Caption = 'TabNumber'
                  object Label14: TUniLabel
                    Left = 0
                    Top = 48
                    Width = 73
                    Height = 13
                    Hint = ''
                    Caption = 'High Value (To)'
                    TabOrder = 2
                  end
                  object Label15: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 83
                    Height = 13
                    Hint = ''
                    Caption = 'Low Value (From)'
                    TabOrder = 3
                  end
                  object dbeValHigh: TUniDBEdit
                    Left = 0
                    Top = 64
                    Width = 97
                    Height = 21
                    Hint = ''
                    DataField = 'VAL_HIGH'
                    DataSource = SrcSegment
                    TabOrder = 0
                  end
                  object dbeValLow: TUniDBEdit
                    Left = 0
                    Top = 16
                    Width = 97
                    Height = 21
                    Hint = ''
                    DataField = 'VAL_LOW'
                    DataSource = SrcSegment
                    TabOrder = 1
                  end
                end
              end
            end
          end
        end
        object Panel1: TUniPanel
          Left = 0
          Top = 0
          Width = 489
          Height = 73
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = ''
          DesignSize = (
            489
            73)
          object Label1: TUniLabel
            Tag = 999999999
            Left = 8
            Top = 12
            Width = 136
            Height = 13
            Hint = ''
            Caption = 'Column Segment Values'
            ParentFont = False
            Font.Style = [fsBold]
            TabOrder = 1
          end
          object Label2: TUniLabel
            Left = 8
            Top = 32
            Width = 487
            Height = 34
            Hint = ''
            AutoSize = False
            Caption = 
              'Create segments that make up the column structure and specify ac' +
              'ceptable values for each.'
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 2
          end
        end
      end
      object TabFinish: TUniTabSheet
        Hint = ''
        ImageIndex = 4
        Caption = 'Finish'
        DesignSize = (
          489
          306)
        object Label7: TUniLabel
          Left = 8
          Top = 12
          Width = 32
          Height = 13
          Hint = ''
          Caption = 'Done!'
          ParentFont = False
          Font.Style = [fsBold]
          TabOrder = 0
        end
        object Label13: TUniLabel
          Left = 8
          Top = 32
          Width = 482
          Height = 0
          Hint = ''
          AutoSize = False
          Caption = 
            'That is all the information the wizard needs to process the data' +
            '.  Click the Finish button to begin.'
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
        end
      end
    end
  end
  object PnlMenu: TUniPanel
    Left = 0
    Top = 5
    Width = 119
    Height = 336
    Hint = ''
    Visible = False
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 1
    Caption = ''
    object lstMenu: TUniStringGrid
      Left = 1
      Top = 1
      Width = 117
      Height = 334
      Hint = ''
      FixedCols = 0
      FixedRows = 0
      ColCount = 1
      Options = [goVertLine, goHorzLine]
      Columns = <
        item
          Width = 100
        end>
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 341
    Width = 624
    Height = 36
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Panel9: TUniPanel
      Left = 204
      Top = 1
      Width = 420
      Height = 34
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnCancel: TUniBitBtn
        Left = 5
        Top = 5
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Close'
        ModalResult = 2
        TabOrder = 0
        OnClick = Exit1Click
      end
      object btnBack: TUniBitBtn
        Left = 113
        Top = 5
        Width = 97
        Height = 25
        Hint = ''
        Caption = '<< &Back'
        TabOrder = 1
        OnClick = btnBackClick
      end
      object btnNext: TUniBitBtn
        Left = 215
        Top = 5
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Next >>'
        TabOrder = 2
        OnClick = btnNextClick
      end
      object btnFinish: TUniBitBtn
        Left = 317
        Top = 5
        Width = 97
        Height = 25
        Hint = ''
        Enabled = False
        Caption = 'Finish'
        TabOrder = 3
        OnClick = btnFinishClick
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 184
    Top = 80
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Reports1: TUniMenuItem
      Caption = '&Reports'
      object Print1: TUniMenuItem
        Caption = '&Print'
        OnClick = Print1Click
      end
      object PrinterSetup1: TUniMenuItem
        Caption = 'Printer &Setup'
        OnClick = PrinterSetup1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'IQVerify Wizard'
    Version = 'Feature unsupported'
    Left = 216
    Top = 80
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'IQVerify'
    WebUse = False
    TouchScreen = False
    Left = 248
    Top = 80
  end
  object SrcColumn: TDataSource
    DataSet = TblColumn
    Left = 104
    Top = 30
  end
  object TblColumn: TFDTable
    BeforePost = TblColumnBeforePost
    AfterPost = TblColumnAfterPost
    OnNewRecord = AssignIDBeforePost
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'VERIFY_COLUMN'
    TableName = 'VERIFY_COLUMN'
    Left = 112
    Top = 40
    object TblColumnTABLE_NAME: TStringField
      DisplayLabel = 'Table Name'
      DisplayWidth = 20
      FieldName = 'TABLE_NAME'
      Size = 30
    end
    object TblColumnCOLUMN_NAME: TStringField
      DisplayLabel = 'Column Name'
      DisplayWidth = 20
      FieldName = 'COLUMN_NAME'
      Size = 30
    end
    object TblColumnTRIGGER_NAME: TStringField
      FieldName = 'TRIGGER_NAME'
      Size = 30
    end
    object TblColumnID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Required = True
      Visible = False
      Size = 0
    end
  end
  object SrcCondition: TDataSource
    DataSet = TblCondition
    Left = 74
    Top = 150
  end
  object TblCondition: TFDTable
    BeforeInsert = PostParentsBeforeEdit
    BeforeEdit = PostParentsBeforeEdit
    BeforePost = AssignIDBeforePost
    OnNewRecord = AssignIDBeforePost
    IndexFieldNames = 'VERIFY_COLUMN_ID'
    MasterSource = SrcColumn
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'VERIFY_CONDITION'
    TableName = 'VERIFY_CONDITION'
    Left = 80
    Top = 160
    object TblConditionCONDITION_COLUMN: TStringField
      DisplayLabel = 'Condition Column'
      DisplayWidth = 20
      FieldName = 'CONDITION_COLUMN'
      Size = 30
    end
    object TblConditionCONDITION_VALUE: TStringField
      DisplayLabel = 'Condition Value'
      DisplayWidth = 20
      FieldName = 'CONDITION_VALUE'
      Size = 30
    end
    object TblConditionID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Required = True
      Visible = False
      Size = 0
    end
    object TblConditionVERIFY_COLUMN_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'VERIFY_COLUMN_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcSegment: TDataSource
    DataSet = TblSegment
    OnDataChange = SrcSegmentDataChange
    Left = 144
    Top = 154
  end
  object TblSegment: TFDTable
    BeforeInsert = PostParentsBeforeEdit
    BeforeEdit = PostParentsBeforeEdit
    BeforePost = TblSegmentBeforePost
    AfterPost = DoSegmentDataSetAfterPost
    OnNewRecord = TblSegmentNewRecord
    IndexFieldNames = 'VERIFY_COLUMN_ID;SEQ'
    MasterSource = SrcColumn
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'VERIFY_SEGMENT'
    TableName = 'VERIFY_SEGMENT'
    Left = 152
    Top = 163
    object TblSegmentSEQ: TBCDField
      DisplayLabel = '#'
      DisplayWidth = 10
      FieldName = 'SEQ'
      Size = 0
    end
    object TblSegmentNAME: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 15
      FieldName = 'NAME'
      Size = 30
    end
    object TblSegmentSTART_POS: TBCDField
      DisplayLabel = 'Start'
      DisplayWidth = 10
      FieldName = 'START_POS'
      Size = 0
    end
    object TblSegmentLENGTH: TBCDField
      DisplayLabel = 'Length'
      DisplayWidth = 10
      FieldName = 'LENGTH'
      Size = 0
    end
    object TblSegmentALLOW_NULL: TStringField
      DisplayLabel = 'Allow Null?'
      DisplayWidth = 1
      FieldName = 'ALLOW_NULL'
      FixedChar = True
      Size = 1
    end
    object TblSegmentTYPE: TBCDField
      DisplayLabel = 'type'
      DisplayWidth = 10
      FieldName = 'TYPE'
      Visible = False
      Size = 0
    end
    object TblSegmentVAL_HIGH: TBCDField
      DisplayLabel = 'High Value'
      DisplayWidth = 10
      FieldName = 'VAL_HIGH'
      Visible = False
      Size = 0
    end
    object TblSegmentVAL_LOW: TBCDField
      DisplayLabel = 'Low Value'
      DisplayWidth = 10
      FieldName = 'VAL_LOW'
      Visible = False
      Size = 0
    end
    object TblSegmentID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Required = True
      Visible = False
      Size = 0
    end
    object TblSegmentVERIFY_COLUMN_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'VERIFY_COLUMN_ID'
      Visible = False
      Size = 0
    end
  end
  object QryUserTables: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select table_name from user_tables'
      'order by table_name')
    Left = 96
    Top = 86
    object QryUserTablesTABLE_NAME: TStringField
      DisplayLabel = 'Table Name'
      DisplayWidth = 30
      FieldName = 'TABLE_NAME'
      Origin = 'IQ.USER_TABLES.TABLE_NAME'
      Size = 128
    end
  end
  object QryUserCols: TFDQuery
    BeforeOpen = QryUserColsBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select'
      '     column_name,'
      '     data_type,'
      '     data_length,'
      '     data_precision,'
      '     nullable'
      'from cols'
      'where table_name = :table_name'
      ' and data_type in ( '#39'CHAR'#39', '#39'VARCHAR'#39', '#39'VARCHAR2'#39' )'
      'order by column_id')
    Left = 128
    Top = 86
    ParamData = <
      item
        Name = 'table_name'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryUserColsCOLUMN_NAME: TStringField
      DisplayLabel = 'Column Name'
      DisplayWidth = 30
      FieldName = 'COLUMN_NAME'
      Origin = 'IQ.COLS.COLUMN_NAME'
      Size = 128
    end
    object QryUserColsDATA_TYPE: TStringField
      DisplayLabel = 'Data Type'
      DisplayWidth = 16
      FieldName = 'DATA_TYPE'
      Origin = 'IQ.COLS.DATA_TYPE'
      Size = 128
    end
    object QryUserColsDATA_LENGTH: TFMTBCDField
      DisplayLabel = 'Length'
      DisplayWidth = 10
      FieldName = 'DATA_LENGTH'
      Origin = 'IQ.COLS.DATA_LENGTH'
      Size = 38
    end
    object QryUserColsDATA_PRECISION: TFMTBCDField
      DisplayLabel = 'Precision'
      DisplayWidth = 10
      FieldName = 'DATA_PRECISION'
      Origin = 'IQ.COLS.DATA_PRECISION'
      Size = 38
    end
    object QryUserColsNULLABLE: TStringField
      DisplayLabel = 'Nullable?'
      DisplayWidth = 10
      FieldName = 'NULLABLE'
      Origin = 'IQ.COLS.NULLABLE'
      Size = 1
    end
  end
  object SrcValue: TDataSource
    DataSet = TblValue
    Left = 226
    Top = 146
  end
  object TblValue: TFDTable
    BeforeInsert = PostParentsBeforeEdit
    BeforeEdit = PostParentsBeforeEdit
    BeforePost = TblValueBeforePost
    AfterPost = DoSegmentDataSetAfterPost
    BeforeDelete = DoSegmentDataSetAfterPost
    OnNewRecord = AssignIDBeforePost
    IndexFieldNames = 'VERIFY_SEGMENT_ID'
    MasterSource = SrcSegment
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'VERIFY_VALUE'
    TableName = 'VERIFY_VALUE'
    Left = 232
    Top = 160
    object TblValueVALUE: TStringField
      DisplayLabel = 'Value'
      DisplayWidth = 25
      FieldName = 'VALUE'
      Size = 60
    end
    object TblValueID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Required = True
      Visible = False
      Size = 0
    end
    object TblValueVERIFY_SEGMENT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'VERIFY_SEGMENT_ID'
      Visible = False
      Size = 0
    end
  end
  object PkColumn: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select'
      '    id,'
      '    table_name,'
      '    column_name'
      'from verify_column')
    OnIQModify = PkColumnIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 48
    Top = 256
    object PkColumnID: TBCDField
      FieldName = 'ID'
      Origin = 'VERIFY_COLUMN.ID'
      Visible = False
      Size = 0
    end
    object PkColumnTABLE_NAME: TStringField
      DisplayLabel = 'Table'
      DisplayWidth = 25
      FieldName = 'TABLE_NAME'
      Origin = 'VERIFY_COLUMN.TABLE_NAME'
      Size = 30
    end
    object PkColumnCOLUMN_NAME: TStringField
      DisplayLabel = 'Column'
      DisplayWidth = 25
      FieldName = 'COLUMN_NAME'
      Origin = 'VERIFY_COLUMN.COLUMN_NAME'
      Size = 30
    end
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 280
    Top = 80
  end
end
