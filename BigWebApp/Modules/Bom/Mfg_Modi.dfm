object MfgModi: TMfgModi
  Left = 44
  Top = 154
  HelpContext = 1181494
  ClientHeight = 644
  ClientWidth = 729
  Caption = 'MFG Types'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  KeyPreview = True
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  ActiveControl = Panel1
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 315
    Top = 27
    Width = 4
    Height = 617
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 729
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      729
      27)
    object SpeedButton1: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Assign default report names'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF404040404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF404040404040FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00800000E00000C020404040FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DC1C1C1A6A6A640
        4040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00800000E00000E00000C020404040FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DC1C1C1C1C1C1A6
        A6A6404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00800000E00000E00000E00000C020404040FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DC1C1C1C1C1C1C1
        C1C1A6A6A6404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00800000E00000FF0000E00000E00000C020404040FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DC1C1C1DCDCDCC1
        C1C1C1C1C1A6A6A6404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00800000E02000E00000FF0000E00000E00000C020404040FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DC2C2C2C1C1C1DC
        DCDCC1C1C1C1C1C1A6A6A6404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00800040E00000E02000E00000FF0000E00000E00000C0204040
        40FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DC2C2C2C2C2C2C1
        C1C1DCDCDCC1C1C1C1C1C1A6A6A6404040FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00800040E0A000FF0000E02000E00000FF0000E00000E0000080
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DCDCDCDDCDCDCC2
        C2C2C1C1C1DCDCDCC1C1C1C1C1C16D6D6DFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00800040E0A000FF0000FF0000E02000E00040E0A0008000FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DCDCDCDDCDCDCDC
        DCDCC2C2C2C1C1C1CDCDCD6D6D6DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00800080E02000FF0000FF0000FF0000E020008000FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DC4C4C4DCDCDCDC
        DCDCDCDCDCC2C2C26D6D6DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00800080E02000FF0000FF0080E020008000FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DC4C4C4DCDCDCDC
        DCDCC4C4C46D6D6DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF008000C0DCC000FF0080E020008000FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DD5D5D5DCDCDCC4
        C4C46D6D6DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF008000C0DCC0C0DCC0008000FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DD5D5D5D5D5D56D
        6D6DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF008000C0DCC0008000FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DD5D5D56D6D6DFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF008000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = SpeedButton1Click
    end
    object Shape4: TUniPanel
      Left = 462
      Top = 8
      Width = 10
      Height = 11
      Hint = 
        'User defined manufacturing type, will default to calculations ba' +
        'sed on a generic type'
      ShowHint = True
      ParentShowHint = False
      Anchors = [akTop, akRight]
      TabOrder = 3
      Caption = ''
    end
    object sbtnMfgConv: TUniSpeedButton
      Left = 27
      Top = 1
      Width = 25
      Height = 25
      Hint = 'User-defined conversion factor'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDD0DDDDDDDDDDDDDDDD00DDDDDDDDDDDDDDD0DDD00D0
        0DDDDDDD00DDD000D0DDDDDD00DD0D000DDDDDDD000DD00D00DDDDDDD00DDDDD
        DDDDDDDDD00DDDDDDDDDDDDD00000DDDDDDDDDDDDD00DDDDDDDDDDDDDD00D00D
        DDDDDDDDDDD000DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnMfgConvClick
    end
    object DBNavigator: TUniDBNavigator
      Left = 504
      Top = 1
      Width = 225
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = DataSource1
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object DBGrid1: TUniDBGrid
    Left = 0
    Top = 27
    Width = 315
    Height = 617
    Hint = ''
    DataSource = DataSource1
    LoadMask.Message = 'Loading data...'
    OnDblClick = sbtnMfgConvClick
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 1
    Columns = <
      item
        FieldName = 'MFGTYPE'
        Title.Caption = 'Manufacturing Type'
        Width = 100
        ReadOnly = True
        PickList.Strings = (
          'BLOWMOLD'
          'DIECAST'
          'EXTRUSION'
          'EXTRUSION2'
          'EXTRUSION3'
          'GENERIC'
          'INJECTION'
          'OUTSOURCE'
          'ROTATIONAL'
          'THERMOSET'
          'JOBSHOP'
          'STAMPING'
          'FAB'
          'THERMOFORM'
          'MBATCH'
          'TFORM2'
          'ASSY1')
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 138
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'STANDARD_MFGTYPE'
        Title.Caption = 'Default To (UD Only)'
        Width = 137
        Color = clBtnFace
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  object ScrollBox1: TUniScrollBox
    Left = 319
    Top = 27
    Width = 410
    Height = 617
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    object pnlDetails: TUniPanel
      Tag = 1999
      Left = 0
      Top = 0
      Width = 408
      Height = 615
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object PageControl1: TUniPageControl
        Left = 1
        Top = 1
        Width = 406
        Height = 613
        Hint = ''
        ActivePage = TabSheet2
        TabBarVisible = True
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        ExplicitWidth = 408
        ExplicitHeight = 615
        object TabSheet1: TUniTabSheet
          Hint = ''
          Caption = 'Report Names'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 256
          ExplicitHeight = 128
          object Panel2: TUniPanel
            Tag = 1999
            Left = 0
            Top = 0
            Width = 398
            Height = 585
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            object Splitter2: TUniSplitter
              Left = 0
              Top = 135
              Width = 398
              Height = 3
              Cursor = crVSplit
              Hint = ''
              Align = alTop
              ParentColor = False
              Color = clBtnFace
            end
            object Panel5: TUniPanel
              Left = 1
              Top = 1
              Width = 396
              Height = 135
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              Caption = ''
              object Label6: TUniLabel
                Left = 1
                Top = 4
                Width = 86
                Height = 13
                Hint = ''
                Caption = '  Report Names'
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Style = [fsBold]
                Transparent = False
                TabOrder = 2
              end
              object Bevel4: TUniPanel
                Left = 1
                Top = 17
                Width = 394
                Height = 6
                Hint = ''
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 3
                Caption = ''
              end
              object Bevel1: TUniPanel
                Left = 1
                Top = 23
                Width = 19
                Height = 112
                Hint = ''
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                TabOrder = 4
                Caption = ''
              end
              object Bevel6: TUniPanel
                Left = 1
                Top = 1
                Width = 394
                Height = 4
                Hint = ''
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 5
                Caption = ''
              end
              object wwDataInsReportNames: TwwDataInspector
                Left = 19
                Top = 23
                Width = 377
                Height = 112
                DisableThemes = False
                Align = alClient
                TabOrder = 0
                DataSource = DataSource1
                Items = <
                  item
                    DataSource = DataSource1
                    DataField = 'BOM_REPORT'
                    Caption = 'BOM Default'
                    PickList.AllowClearKey = True
                    PickList.ButtonStyle = cbsEllipsis
                    TagString = 'BOM_REPORT'
                    WordWrap = False
                    OnEditButtonClick = AssignMfgtypeReport
                  end
                  item
                    DataSource = DataSource1
                    DataField = 'WO_REPORT'
                    Caption = 'WO Default'
                    PickList.AllowClearKey = True
                    PickList.ButtonStyle = cbsEllipsis
                    TagString = 'WO_REPORT'
                    WordWrap = False
                    OnEditButtonClick = AssignMfgtypeReport
                  end
                  item
                    DataSource = DataSource1
                    DataField = 'CR_TA_MSG_REPORT'
                    Caption = 'ASSY1 Labor Schedule'
                    PickList.AllowClearKey = True
                    PickList.ButtonStyle = cbsEllipsis
                    TagString = 'CR_TA_MSG_REPORT'
                    WordWrap = False
                    OnEditButtonClick = AssignMfgtypeReport
                  end
                  item
                    DataSource = DataSource1
                    DataField = 'ASSY1_TRAVELER_REPORT'
                    Caption = 'ASSY1 Traveler'
                    PickList.AllowClearKey = True
                    PickList.ButtonStyle = cbsEllipsis
                    TagString = 'ASSY1_TRAVELER_REPORT'
                    WordWrap = False
                    OnEditButtonClick = AssignMfgtypeReport
                  end
                  item
                    DataSource = DataSource1
                    DataField = 'ASSY1_DATA_REPORT'
                    Caption = 'Assembly Data'
                    PickList.AllowClearKey = True
                    PickList.ButtonStyle = cbsEllipsis
                    TagString = 'ASSY1_DATA_REPORT'
                    WordWrap = False
                    OnEditButtonClick = AssignMfgtypeReport
                  end
                  item
                    DataSource = DataSource1
                    DataField = 'ASSY1_TOTE_REPORT'
                    Caption = 'ASSY1 Tote Label'
                    PickList.AllowClearKey = True
                    PickList.ButtonStyle = cbsEllipsis
                    TagString = 'ASSY1_TOTE_REPORT'
                    WordWrap = False
                    OnEditButtonClick = AssignMfgtypeReport
                  end>
                DefaultRowHeight = 18
                CaptionWidth = 138
                Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
                CaptionFont.Charset = DEFAULT_CHARSET
                CaptionFont.Color = clWindowText
                CaptionFont.Height = -11
                CaptionFont.Name = 'Tahoma'
                CaptionFont.Style = []
                LineStyleCaption = ovLight3DLine
                LineStyleData = ovLight3DLine
              end
            end
            object Panel6: TUniPanel
              Left = 1
              Top = 138
              Width = 396
              Height = 447
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              object Bevel5: TUniPanel
                Left = 1
                Top = 26
                Width = 19
                Height = 421
                Hint = ''
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                TabOrder = 3
                Caption = ''
              end
              object Panel7: TUniPanel
                Left = 1
                Top = 1
                Width = 394
                Height = 26
                Hint = ''
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                Caption = ''
                ParentColor = True
                object Label10: TUniLabel
                  Left = 6
                  Top = 8
                  Width = 81
                  Height = 13
                  Hint = ''
                  Caption = 'EPlant Specific'
                  ParentFont = False
                  Font.Style = [fsBold]
                  TabOrder = 2
                end
                object navEplantReports: TUniDBNavigator
                  Left = 162
                  Top = 1
                  Width = 232
                  Height = 24
                  Hint = ''
                  DataSource = SrcMfgtypeEPlantRep
                  VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
                  Align = alRight
                  Anchors = [akTop, akRight, akBottom]
                  TabOrder = 0
                end
              end
              object TUniPanel
                Left = 19
                Top = 26
                Width = 377
                Height = 421
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
                Caption = ''
                object gridEPlantReport: TIQUniGridControl
                  Left = 1
                  Top = 1
                  Width = 375
                  Height = 419
                  Layout = 'border'
                  ParentAlignmentControl = False
                  AlignmentControl = uniAlignmentClient
                  Align = alClient
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  TabOrder = 0
                  IQComponents.Grid.Left = 0
                  IQComponents.Grid.Top = 29
                  IQComponents.Grid.Width = 158
                  IQComponents.Grid.Height = 333
                  IQComponents.Grid.Hint = ''
                  IQComponents.Grid.DataSource = SrcMfgtypeEPlantRep
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
                  IQComponents.Navigator.DataSource = SrcMfgtypeEPlantRep
                  IQComponents.Navigator.LayoutConfig.Region = 'east'
                  IQComponents.Navigator.TabOrder = 3
                  IQComponents.HiddenPanel.Left = 158
                  IQComponents.HiddenPanel.Top = 29
                  IQComponents.HiddenPanel.Width = 209
                  IQComponents.HiddenPanel.Height = 333
                  IQComponents.HiddenPanel.Hint = ''
                  IQComponents.HiddenPanel.Visible = True
                  IQComponents.HiddenPanel.Align = alRight
                  IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
                  IQComponents.FormTab.Hint = ''
                  IQComponents.FormTab.ImageIndex = 1
                  IQComponents.FormTab.Caption = 'Form'
                  IQComponents.FormTab.Layout = 'border'
                  IQComponents.FormTab.ExplicitLeft = 0
                  IQComponents.FormTab.ExplicitTop = 0
                  IQComponents.FormTab.ExplicitWidth = 256
                  IQComponents.FormTab.ExplicitHeight = 128
                  DataSource = SrcMfgtypeEPlantRep
                  Columns = <
                    item
                      FieldName = 'EPLANT_ID'
                      Title.Caption = 'EPlant ID'
                      Width = 64
                      CheckBoxField.FieldValues = 'true;false'
                    end
                    item
                      FieldName = 'REPORT_KIND'
                      Title.Caption = 'Report'
                      Width = 106
                      CheckBoxField.FieldValues = 'true;false'
                    end
                    item
                      FieldName = 'REPORT_NAME'
                      Title.Caption = 'Report File Name'
                      Width = 64
                      CheckBoxField.FieldValues = 'true;false'
                    end>
                  Marker = 0
                end
                object wwDBComboDlgEplant: TUniEdit
                  Left = 44
                  Top = 51
                  Width = 121
                  Height = 21
                  Hint = ''
                  Text = ''
                  TabOrder = 1
                end
                object wwDBComboDlgEPlantReportName: TUniEdit
                  Left = 188
                  Top = 53
                  Width = 121
                  Height = 21
                  Hint = ''
                  Text = ''
                  TabOrder = 2
                  OnKeyDown = CheckEplantSpecificDeleteKey
                end
                object wwDBComboBoxReportKind: TUniDBComboBox
                  Left = 45
                  Top = 84
                  Width = 121
                  Height = 21
                  Hint = ''
                  Style = csDropDownList
                  TabOrder = 3
                  OnCloseUp = wwDBComboBoxReportKindCloseUp
                  OnDropDown = wwDBComboBoxReportKindDropDown
                end
              end
            end
          end
        end
        object TabSheet2: TUniTabSheet
          Hint = ''
          ImageIndex = 1
          Caption = 'Labor/Overhead'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 256
          ExplicitHeight = 128
          object Panel4: TUniPanel
            Left = 0
            Top = 0
            Width = 398
            Height = 585
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            ExplicitWidth = 402
            ExplicitHeight = 589
            object Panel8: TUniPanel
              Left = 1
              Top = 1
              Width = 396
              Height = 583
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
              Caption = ''
              DesignSize = (
                396
                583)
              object Label1: TUniLabel
                Left = 20
                Top = 58
                Width = 63
                Height = 13
                Hint = ''
                Caption = 'Current Rate'
                TabOrder = 15
              end
              object Label4: TUniLabel
                Left = 20
                Top = 34
                Width = 93
                Height = 13
                Hint = ''
                Caption = 'Labor Cost Element'
                TabOrder = 16
              end
              object Label5: TUniLabel
                Left = 20
                Top = 232
                Width = 114
                Height = 13
                Hint = ''
                Caption = 'Overhead Cost Element'
                TabOrder = 17
              end
              object Bevel2: TUniPanel
                Left = 7
                Top = 21
                Width = 397
                Height = 3
                Hint = ''
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 18
                Caption = ''
              end
              object Label7: TUniLabel
                Left = 7
                Top = 6
                Width = 32
                Height = 13
                Hint = ''
                Caption = 'Labor'
                ParentFont = False
                Font.Style = [fsBold]
                TabOrder = 19
              end
              object Bevel3: TUniPanel
                Left = 7
                Top = 220
                Width = 397
                Height = 3
                Hint = ''
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 20
                Caption = ''
              end
              object Label8: TUniLabel
                Left = 7
                Top = 207
                Width = 161
                Height = 13
                Hint = ''
                Caption = 'Variable and Fixed Overhead'
                ParentFont = False
                Font.Style = [fsBold]
                TabOrder = 21
              end
              object Label2: TUniLabel
                Left = 71
                Top = 256
                Width = 38
                Height = 13
                Hint = ''
                Caption = 'Variable'
                TabOrder = 22
              end
              object Label3: TUniLabel
                Left = 71
                Top = 282
                Width = 26
                Height = 13
                Hint = ''
                Caption = 'Fixed'
                TabOrder = 23
              end
              object Label11: TUniLabel
                Left = 71
                Top = 352
                Width = 38
                Height = 13
                Hint = ''
                Caption = 'Variable'
                TabOrder = 24
              end
              object Label14: TUniLabel
                Left = 71
                Top = 378
                Width = 26
                Height = 13
                Hint = ''
                Caption = 'Fixed'
                TabOrder = 25
              end
              object Label16: TUniLabel
                Left = 20
                Top = 82
                Width = 58
                Height = 13
                Hint = ''
                Caption = 'Future Rate'
                TabOrder = 26
              end
              object Label17: TUniLabel
                Left = 20
                Top = 106
                Width = 60
                Height = 13
                Hint = ''
                Caption = 'Budget Rate'
                TabOrder = 27
              end
              object Label18: TUniLabel
                Left = 20
                Top = 130
                Width = 68
                Height = 13
                Hint = ''
                Caption = 'Forecast Rate'
                TabOrder = 28
              end
              object DBEdit1: TUniDBEdit
                Left = 143
                Top = 54
                Width = 120
                Height = 21
                Hint = ''
                DataField = 'LABOR_RATE'
                DataSource = DataSource1
                TabOrder = 1
              end
              object DBLookupComboBox1: TUniDBLookupComboBox
                Left = 143
                Top = 30
                Width = 250
                Height = 21
                Hint = ''
                ListFieldIndex = 0
                DataField = 'LaborElem'
                DataSource = DataSource1
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                Color = clWindow
                OnKeyDown = CheckDelKey
              end
              object DBLookupComboBox2: TUniDBLookupComboBox
                Left = 143
                Top = 252
                Width = 250
                Height = 21
                Hint = ''
                ListFieldIndex = 0
                DataField = 'OverheadElem'
                DataSource = DataSource1
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 3
                Color = clWindow
                OnKeyDown = CheckDelKey
              end
              object rbtnWrkCntrOH: TUniRadioButton
                Left = 20
                Top = 306
                Width = 120
                Height = 17
                Hint = ''
                Caption = 'Work center based'
                TabOrder = 5
                OnClick = AssignIsOHLaborBased
              end
              object rbtnLaborOH: TUniRadioButton
                Left = 20
                Top = 329
                Width = 119
                Height = 17
                Hint = ''
                Caption = 'Labor based rate'
                TabOrder = 6
                OnClick = AssignIsOHLaborBased
              end
              object dbeLaborOHRate: TUniDBEdit
                Left = 143
                Top = 349
                Width = 120
                Height = 21
                Hint = ''
                DataField = 'LABOR_BASED_OH_RATE'
                DataSource = DataSource1
                TabOrder = 7
              end
              object dbchkLaborByTA: TUniDBCheckBox
                Left = 20
                Top = 154
                Width = 210
                Height = 17
                Hint = ''
                DataField = 'LABOR_POSTED_BY_TA'
                DataSource = DataSource1
                ValueChecked = 'Y'
                ValueUnchecked = 'N'
                Caption = 'Labor posted from Time &&  Attendance'
                TabOrder = 2
                OnClick = dbchkLaborByTAClick
              end
              object DBLookupComboBox3: TUniDBLookupComboBox
                Left = 143
                Top = 278
                Width = 250
                Height = 21
                Hint = ''
                ListFieldIndex = 0
                DataField = 'FixedOverheadElem'
                DataSource = DataSource1
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 4
                Color = clWindow
                OnKeyDown = CheckDelKey
              end
              object dbeLaborFixedOHRate: TUniDBEdit
                Left = 143
                Top = 375
                Width = 120
                Height = 21
                Hint = ''
                DataField = 'FIXED_LABOR_BASED_OH_RATE'
                DataSource = DataSource1
                TabOrder = 8
              end
              object dbchkUseLaborRateActLabor: TUniDBCheckBox
                Left = 20
                Top = 174
                Width = 217
                Height = 17
                Hint = ''
                DataField = 'USE_LABOR_RATE_FOR_ACT_LABOR'
                DataSource = DataSource1
                ValueChecked = 'Y'
                ValueUnchecked = 'N'
                Caption = 'Use Labor Rate to calculate Actual Labor'
                TabOrder = 9
              end
              object dbeFutureRate: TUniDBEdit
                Left = 143
                Top = 79
                Width = 120
                Height = 21
                Hint = ''
                DataField = 'FUTURE_LABOR_RATE'
                DataSource = DataSource1
                TabOrder = 10
              end
              object dbeBudgetRate: TUniDBEdit
                Left = 143
                Top = 103
                Width = 120
                Height = 21
                Hint = ''
                DataField = 'BUDGET_LABOR_RATE'
                DataSource = DataSource1
                TabOrder = 11
              end
              object dbeForecastRate: TUniDBEdit
                Left = 143
                Top = 127
                Width = 120
                Height = 21
                Hint = ''
                DataField = 'FORECAST_LABOR_RATE'
                DataSource = DataSource1
                TabOrder = 12
              end
              object dbchkOverheadByTA: TUniDBCheckBox
                Left = 71
                Top = 402
                Width = 246
                Height = 17
                Hint = ''
                DataField = 'OVERHEAD_POSTED_BY_TA'
                DataSource = DataSource1
                ValueChecked = 'Y'
                ValueUnchecked = 'N'
                Caption = 'Overhead Posted from Time and Attendance'
                TabOrder = 13
              end
            end
          end
        end
        object TabSheet3: TUniTabSheet
          Hint = ''
          ImageIndex = 2
          Caption = 'General'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 256
          ExplicitHeight = 128
          object Panel3: TUniPanel
            Left = 0
            Top = 0
            Width = 398
            Height = 585
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            DesignSize = (
              398
              585)
            object BevelGeneral: TUniPanel
              Left = 7
              Top = 21
              Width = 397
              Height = 3
              Hint = ''
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 22
              Caption = ''
            end
            object Label9: TUniLabel
              Left = 7
              Top = 8
              Width = 44
              Height = 13
              Hint = ''
              Caption = 'General'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 23
            end
            object lblAssy1ProcessCertification: TUniLabel
              Left = 23
              Top = 29
              Width = 98
              Height = 13
              Hint = ''
              Caption = 'Process Certification'
              TabOrder = 24
            end
            object dbchkFloorDispo: TUniDBCheckBox
              Left = 23
              Top = 269
              Width = 145
              Height = 17
              Hint = 'Popup Floor Dispo dialog box on clock out ( ShopData )'
              ShowHint = True
              ParentShowHint = False
              DataField = 'FLOOR_DISPO_ON_CLOCK_OUT'
              DataSource = DataSource1
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'Backflush on Clock Out'
              TabOrder = 4
              OnClick = dbChkMultiCBsClick
            end
            object dbchkNonRTBkFlsh: TUniDBCheckBox
              Left = 23
              Top = 285
              Width = 124
              Height = 17
              Hint = ''
              DataField = 'NON_RT_BACKFLUSH'
              DataSource = DataSource1
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'Non RT Backflush'
              TabOrder = 5
            end
            object dbchkFabAutoLogin: TUniDBCheckBox
              Left = 23
              Top = 301
              Width = 97
              Height = 17
              Hint = ''
              DataField = 'FAB_AUTO_LOGIN'
              DataSource = DataSource1
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'LOT Auto Login'
              TabOrder = 6
            end
            object dbchkFabPasswordOnLogin: TUniDBCheckBox
              Left = 23
              Top = 317
              Width = 205
              Height = 17
              Hint = ''
              DataField = 'FAB_PASSWORD_ON_LOGIN'
              DataSource = DataSource1
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'Password required on LOT log in/out'
              TabOrder = 7
            end
            object dbchkRTCountScanBased: TUniDBCheckBox
              Left = 23
              Top = 333
              Width = 169
              Height = 17
              Hint = ''
              ShowHint = True
              ParentShowHint = False
              DataField = 'RT_COUNT_BASED_ON_SCAN'
              DataSource = DataSource1
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'RT parts to go based on scans'
              TabOrder = 8
              OnClick = dbchkRTCountScanBasedClick
            end
            object dbchkAssy1FinalNoSuperReq: TUniDBCheckBox
              Left = 23
              Top = 349
              Width = 227
              Height = 17
              Hint = ''
              ShowHint = True
              ParentShowHint = False
              DataField = 'ASSY1_FINAL_NO_SUPER_REQUIRED'
              DataSource = DataSource1
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'No supervisor required for Final Assembly'
              TabOrder = 9
              OnClick = dbChkMultiCBsClick
            end
            object wwDBComboBoxProcessCertification: TUniDBComboBox
              Left = 23
              Top = 46
              Width = 144
              Height = 21
              Hint = ''
              DataField = 'ASSY1_PROCESS_CERTIFICATION'
              DataSource = DataSource1
              Style = csDropDownList
              Items.Strings = (
                'Certified Jobs'#9'J'
                'Certified Employees'#9'E')
              TabOrder = 0
            end
            object dbchkIncludeScrapInByProduct: TUniDBCheckBox
              Left = 23
              Top = 365
              Width = 227
              Height = 17
              Hint = ''
              ShowHint = True
              ParentShowHint = False
              DataField = 'INCLUDE_SCRAP_IN_BYPRODUCT'
              DataSource = DataSource1
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'Include scrap in By-Product weight calc'
              TabOrder = 10
              OnClick = dbChkMultiCBsClick
            end
            object pnlDispoLocations: TUniPanel
              Left = 23
              Top = 67
              Width = 309
              Height = 88
              Hint = ''
              TabOrder = 1
              Caption = ''
              DesignSize = (
                309
                88)
              object Label12: TUniLabel
                Left = 1
                Top = 3
                Width = 83
                Height = 13
                Hint = ''
                Caption = 'Dispo IN Location'
                TabOrder = 3
              end
              object Label13: TUniLabel
                Left = 1
                Top = 47
                Width = 93
                Height = 13
                Hint = ''
                Caption = 'Dispo OUT Location'
                TabOrder = 4
              end
              object wwDBComboDlgDispoLocIN: TUniEdit
                Left = 1
                Top = 20
                Width = 255
                Height = 21
                Hint = ''
                Text = ''
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                ReadOnly = True
                OnKeyDown = CheckDeleteKey
              end
              object wwDBComboDlgDispoLocOUT: TUniEdit
                Left = 1
                Top = 64
                Width = 255
                Height = 21
                Hint = ''
                Text = ''
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
                ReadOnly = True
                OnKeyDown = CheckDeleteKey
              end
            end
            object dbchkAssy1UsePercentComplete: TUniDBCheckBox
              Left = 23
              Top = 380
              Width = 189
              Height = 17
              Hint = ''
              ShowHint = True
              ParentShowHint = False
              DataField = 'ASSY1_USE_PERCENT_COMPLETE'
              DataSource = DataSource1
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'Use Percent Complete Reporting'
              TabOrder = 11
              OnClick = dbChkMultiCBsClick
            end
            object dbchkLogicalWorkCenterSupport: TUniDBCheckBox
              Left = 23
              Top = 410
              Width = 189
              Height = 17
              Hint = ''
              ShowHint = True
              ParentShowHint = False
              DataField = 'LOGICAL_WORK_CENTER_SUPPORT'
              DataSource = DataSource1
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'Logical Work Center Support'
              TabOrder = 13
              OnClick = dbChkMultiCBsClick
            end
            object dbchkAssy3BackflushProcess: TUniDBCheckBox
              Left = 23
              Top = 425
              Width = 146
              Height = 17
              Hint = ''
              ShowHint = True
              ParentShowHint = False
              DataField = 'ASSY3_BACKFLUSH_EACH_PROCESS'
              DataSource = DataSource1
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'Backflush Each Process'
              TabOrder = 14
              OnClick = dbChkMultiCBsClick
            end
            object dbchkAssy1FinalAssyOnProcess: TUniDBCheckBox
              Left = 23
              Top = 253
              Width = 218
              Height = 17
              Hint = 'Launch Final Assembly Reporting on designated process'
              ShowHint = True
              ParentShowHint = False
              DataField = 'ASSY1_FINAL_ASSY_ON_PROCESS'
              DataSource = DataSource1
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'Launch Final Assy on designated process'
              TabOrder = 3
              OnClick = dbChkMultiCBsClick
            end
            object dbchkUseYieldOnBOM: TUniDBCheckBox
              Left = 23
              Top = 440
              Width = 146
              Height = 17
              Hint = 'Use Yield % instead of Scrap % on BOM'
              ShowHint = True
              ParentShowHint = False
              DataField = 'USE_YIELD_ON_BOM'
              DataSource = DataSource1
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'Use Yield % on BOM'
              TabOrder = 15
              OnClick = dbChkMultiCBsClick
            end
            object dbchkDoNotRoundUpDependent: TUniDBCheckBox
              Left = 23
              Top = 455
              Width = 194
              Height = 17
              Hint = ''
              ShowHint = True
              ParentShowHint = False
              DataField = 'DONOT_ROUNDUP_DEPENDENT'
              DataSource = DataSource1
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'Do not round up dependent demand'
              TabOrder = 16
              OnClick = dbChkMultiCBsClick
            end
            object pnlShiftBackflushRule: TUniPanel
              Left = 23
              Top = 157
              Width = 309
              Height = 45
              Hint = ''
              TabOrder = 2
              Caption = ''
              object Label15: TUniLabel
                Left = 1
                Top = 3
                Width = 99
                Height = 13
                Hint = ''
                Caption = 'Shift Backflush Rules'
                TabOrder = 2
              end
              object wwDBComboBoxShiftBackflushRule: TUniDBComboBox
                Left = 1
                Top = 20
                Width = 253
                Height = 21
                Hint = ''
                DataField = 'SHIFT_BACKFLUSH_RULE'
                DataSource = DataSource1
                Style = csDropDownList
                Items.Strings = (
                  'Total Cycles at Shot Weight'#9'S'
                  'Total Cycles at Part Weight'#9'P'
                  'Good Parts at Part Weight'#9'G')
                TabOrder = 0
              end
            end
            object dbchkTForm2StdCostBasedPtWt: TUniDBCheckBox
              Left = 23
              Top = 470
              Width = 258
              Height = 17
              Hint = ''
              ShowHint = True
              ParentShowHint = False
              DataField = 'TFORM2_STD_COST_BASED_PTWT'
              DataSource = DataSource1
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'Std costing calc to consider family tool part weights'
              TabOrder = 17
              OnClick = dbChkMultiCBsClick
            end
            object dbchkConsumeMaterialByProcess: TUniDBCheckBox
              Left = 40
              Top = 395
              Width = 189
              Height = 17
              Hint = ''
              ShowHint = True
              ParentShowHint = False
              DataField = 'ASSY1_CONSUME_MAT_BY_PROCESS'
              DataSource = DataSource1
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'Consume Raw Material by Process'
              TabOrder = 12
              OnClick = dbChkMultiCBsClick
            end
            object pnlDefaultUOM: TUniPanel
              Left = 23
              Top = 205
              Width = 309
              Height = 45
              Hint = ''
              TabOrder = 18
              Caption = ''
              object lblDefaultUOM: TUniLabel
                Left = 1
                Top = 3
                Width = 61
                Height = 13
                Hint = ''
                Caption = 'Default UOM'
                TabOrder = 2
              end
              object wwDBComboBoxDefaultUOM: TUniDBComboBox
                Left = 1
                Top = 20
                Width = 144
                Height = 21
                Hint = ''
                DataField = 'DEFAULT_UOM'
                DataSource = DataSource1
                Style = csDropDownList
                Items.Strings = (
                  'GR'
                  'LBS'
                  'OZ'
                  'FT'
                  'IN'
                  'M'
                  'KM'
                  'YD')
                TabOrder = 0
                OnDropDown = wwDBComboBoxDefaultUOMDropDown
              end
            end
            object dbchkAddFloorDispoOut: TUniDBCheckBox
              Left = 23
              Top = 485
              Width = 258
              Height = 17
              Hint = ''
              ShowHint = True
              ParentShowHint = False
              DataField = 'PROD_REP_ADD_FLOOR_DISPO_OUT'
              DataSource = DataSource1
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'Add Floor Disposition Out Qty to Calculated Usage'
              TabOrder = 19
              OnClick = dbChkMultiCBsClick
            end
            object pnlUseSNToControlMTO: TUniPanel
              Left = 23
              Top = 506
              Width = 309
              Height = 45
              Hint = ''
              TabOrder = 20
              Caption = ''
              object Label19: TUniLabel
                Left = 1
                Top = 3
                Width = 202
                Height = 13
                Hint = ''
                Caption = 'Use SN Labels to Control MTO Dispositions'
                TabOrder = 2
              end
              object wwDBComboBoxUseSNToControlMTO: TUniDBComboBox
                Left = 1
                Top = 20
                Width = 144
                Height = 21
                Hint = ''
                DataField = 'LABELS_CONTROL_MTO_DISPO'
                DataSource = DataSource1
                Style = csDropDownList
                Items.Strings = (
                  'System Default'#9'D'
                  'Yes'#9'Y'
                  'No'#9'N')
                TabOrder = 0
              end
            end
          end
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = Table1
    OnDataChange = DataSource1DataChange
    Left = 132
    Top = 91
  end
  object Table1: TFDTable
    BeforeInsert = Table1BeforeInsert
    BeforePost = Table1BeforePost
    AfterPost = Table1AfterPost
    BeforeScroll = Table1BeforeScroll
    AfterScroll = Table1AfterScroll
    OnCalcFields = Table1CalcFields
    IndexFieldNames = 'MFGTYPE'
    Connection = UniMainModule.FDConnection1
    FormatOptions.AssignedValues = [fvStrsTrim]
    UpdateOptions.UpdateTableName = 'MFGTYPE'
    UpdateOptions.KeyFields = 'MFGTYPE'
    UpdateObject = FDUpdateSQLMfgType
    TableName = 'MFGTYPE'
    Left = 131
    Top = 120
    object Table1MFGTYPE: TStringField
      DisplayLabel = 'Mfg Type'
      FieldName = 'MFGTYPE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object Table1DESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
    end
    object Table1LABOR_RATE: TFMTBCDField
      DisplayLabel = 'Labor Rate'
      FieldName = 'LABOR_RATE'
      Size = 6
    end
    object Table1BOM_REPORT: TStringField
      FieldName = 'BOM_REPORT'
      Size = 250
    end
    object Table1WO_REPORT: TStringField
      FieldName = 'WO_REPORT'
      Size = 250
    end
    object Table1ELEMENTS_ID: TBCDField
      FieldName = 'ELEMENTS_ID'
      Size = 0
    end
    object Table1Element: TStringField
      FieldKind = fkLookup
      FieldName = 'LaborElem'
      LookupDataSet = QryElementsLabor
      LookupKeyFields = 'ID'
      LookupResultField = 'ELEM_DESCRIP'
      KeyFields = 'ELEMENTS_ID'
      Lookup = True
    end
    object Table1ELEMENTS_ID_OH: TBCDField
      FieldName = 'ELEMENTS_ID_OH'
      Size = 0
    end
    object Table1OverheadElem: TStringField
      FieldKind = fkLookup
      FieldName = 'OverheadElem'
      LookupDataSet = QryElemOH
      LookupKeyFields = 'ID'
      LookupResultField = 'ELEM_DESCRIP'
      KeyFields = 'ELEMENTS_ID_OH'
      Size = 30
      Lookup = True
    end
    object Table1FLOOR_DISPO_ON_CLOCK_OUT: TStringField
      FieldName = 'FLOOR_DISPO_ON_CLOCK_OUT'
      FixedChar = True
      Size = 1
    end
    object Table1IS_LABOR_BASED_OH: TStringField
      FieldName = 'IS_LABOR_BASED_OH'
      FixedChar = True
      Size = 1
    end
    object Table1LABOR_BASED_OH_RATE: TFMTBCDField
      FieldName = 'LABOR_BASED_OH_RATE'
      Size = 6
    end
    object Table1NON_RT_BACKFLUSH: TStringField
      FieldName = 'NON_RT_BACKFLUSH'
      FixedChar = True
      Size = 1
    end
    object Table1LBSK_PERCENT_RUNNER: TFMTBCDField
      FieldName = 'LBSK_PERCENT_RUNNER'
      Size = 6
    end
    object Table1FAB_AUTO_LOGIN: TStringField
      FieldName = 'FAB_AUTO_LOGIN'
      FixedChar = True
      Size = 1
    end
    object Table1FAB_PASSWORD_ON_LOGIN: TStringField
      FieldName = 'FAB_PASSWORD_ON_LOGIN'
      FixedChar = True
      Size = 1
    end
    object Table1LABOR_POSTED_BY_TA: TStringField
      FieldName = 'LABOR_POSTED_BY_TA'
      Size = 1
    end
    object Table1STANDARD_MFGTYPE: TStringField
      FieldName = 'STANDARD_MFGTYPE'
      Size = 10
    end
    object Table1RT_COUNT_BASED_ON_SCAN: TStringField
      FieldName = 'RT_COUNT_BASED_ON_SCAN'
      Visible = False
      Size = 1
    end
    object Table1ASSY1_FINAL_NO_SUPER_REQUIRED: TStringField
      FieldName = 'ASSY1_FINAL_NO_SUPER_REQUIRED'
      Size = 1
    end
    object Table1ASSY1_PROCESS_CERTIFICATION: TStringField
      FieldName = 'ASSY1_PROCESS_CERTIFICATION'
      Visible = False
      Size = 1
    end
    object Table1INCLUDE_SCRAP_IN_BYPRODUCT: TStringField
      FieldName = 'INCLUDE_SCRAP_IN_BYPRODUCT'
      Visible = False
      Size = 1
    end
    object Table1LOCATIONS_ID_IN: TBCDField
      FieldName = 'LOCATIONS_ID_IN'
      Visible = False
      Size = 0
    end
    object Table1LOCATIONS_ID_OUT: TBCDField
      FieldName = 'LOCATIONS_ID_OUT'
      Visible = False
      Size = 0
    end
    object Table1Loc_Desc_IN: TStringField
      FieldKind = fkCalculated
      FieldName = 'Loc_Desc_IN'
      Visible = False
      Size = 30
      Calculated = True
    end
    object Table1Loc_Desc_OUT: TStringField
      FieldKind = fkCalculated
      FieldName = 'Loc_Desc_OUT'
      Visible = False
      Size = 30
      Calculated = True
    end
    object Table1CR_TA_MSG_REPORT: TStringField
      FieldName = 'CR_TA_MSG_REPORT'
      Size = 50
    end
    object Table1ASSY1_DATA_REPORT: TStringField
      FieldName = 'ASSY1_DATA_REPORT'
      Size = 50
    end
    object Table1ASSY1_TRAVELER_REPORT: TStringField
      FieldName = 'ASSY1_TRAVELER_REPORT'
      Size = 50
    end
    object Table1ASSY1_TOTE_REPORT: TStringField
      FieldName = 'ASSY1_TOTE_REPORT'
      Size = 50
    end
    object Table1FIXED_ELEMENTS_ID_OH: TBCDField
      FieldName = 'FIXED_ELEMENTS_ID_OH'
      Visible = False
      Size = 0
    end
    object Table1FIXED_LABOR_BASED_OH_RATE: TFMTBCDField
      FieldName = 'FIXED_LABOR_BASED_OH_RATE'
      Visible = False
      Size = 6
    end
    object Table1FixedOverheadElem: TStringField
      FieldKind = fkLookup
      FieldName = 'FixedOverheadElem'
      LookupDataSet = QryElemFixedOH
      LookupKeyFields = 'ID'
      LookupResultField = 'ELEM_DESCRIP'
      KeyFields = 'FIXED_ELEMENTS_ID_OH'
      Size = 30
      Lookup = True
    end
    object Table1ASSY1_USE_PERCENT_COMPLETE: TStringField
      FieldName = 'ASSY1_USE_PERCENT_COMPLETE'
      Visible = False
      Size = 1
    end
    object Table1LOGICAL_WORK_CENTER_SUPPORT: TStringField
      DisplayLabel = 'Logical Work Center Support'
      FieldName = 'LOGICAL_WORK_CENTER_SUPPORT'
      Visible = False
      Size = 1
    end
    object Table1ASSY3_BACKFLUSH_EACH_PROCESS: TStringField
      FieldName = 'ASSY3_BACKFLUSH_EACH_PROCESS'
      Size = 1
    end
    object Table1ASSY1_FINAL_ASSY_ON_PROCESS: TStringField
      FieldName = 'ASSY1_FINAL_ASSY_ON_PROCESS'
      Size = 1
    end
    object Table1USE_YIELD_ON_BOM: TStringField
      FieldName = 'USE_YIELD_ON_BOM'
      Size = 1
    end
    object Table1DONOT_ROUNDUP_DEPENDENT: TStringField
      FieldName = 'DONOT_ROUNDUP_DEPENDENT'
      Size = 1
    end
    object Table1SHIFT_BACKFLUSH_RULE: TStringField
      FieldName = 'SHIFT_BACKFLUSH_RULE'
      Size = 1
    end
    object Table1USE_LABOR_RATE_FOR_ACT_LABOR: TStringField
      FieldName = 'USE_LABOR_RATE_FOR_ACT_LABOR'
      Visible = False
      Size = 1
    end
    object Table1TFORM2_STD_COST_BASED_PTWT: TStringField
      FieldName = 'TFORM2_STD_COST_BASED_PTWT'
      Size = 1
    end
    object Table1ASSY1_CONSUME_MAT_BY_PROCESS: TStringField
      FieldName = 'ASSY1_CONSUME_MAT_BY_PROCESS'
      Size = 1
    end
    object Table1DEFAULT_UOM: TStringField
      FieldName = 'DEFAULT_UOM'
      Size = 10
    end
    object Table1PROD_REP_ADD_FLOOR_DISPO_OUT: TStringField
      FieldName = 'PROD_REP_ADD_FLOOR_DISPO_OUT'
      Visible = False
      Size = 1
    end
    object Table1FUTURE_LABOR_RATE: TFMTBCDField
      DisplayLabel = 'Future Rate'
      FieldName = 'FUTURE_LABOR_RATE'
      Size = 6
    end
    object Table1BUDGET_LABOR_RATE: TFMTBCDField
      DisplayLabel = 'Budget Rate'
      FieldName = 'BUDGET_LABOR_RATE'
      Size = 6
    end
    object Table1FORECAST_LABOR_RATE: TFMTBCDField
      DisplayLabel = 'Forecast Rate'
      FieldName = 'FORECAST_LABOR_RATE'
      Size = 6
    end
    object Table1LABELS_CONTROL_MTO_DISPO: TStringField
      DisplayLabel = 'Use SN Labels to Control MTO Dispositions'
      FieldName = 'LABELS_CONTROL_MTO_DISPO'
      Size = 1
    end
    object Table1OVERHEAD_POSTED_BY_TA: TStringField
      FieldName = 'OVERHEAD_POSTED_BY_TA'
      Origin = 'OVERHEAD_POSTED_BY_TA'
      Size = 1
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '.RPT'
    Left = 176
    Top = 91
  end
  object QryElementsLabor: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from elements where ELEM_TYPE = '#39'LABOR'#39)
    Left = 88
    Top = 91
  end
  object QryElemOH: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from elements '
      ' where ELEM_TYPE = '#39'OVERHEAD'#39
      ' ')
    Left = 88
    Top = 122
  end
  object MainMenu1: TUniMainMenu
    Left = 209
    Top = 90
    object File1: TUniMenuItem
      Caption = 'File'
      object AlterLbsKCalculation1: TUniMenuItem
        Caption = 'Alter Lbs/K Calculation'
        OnClick = AlterLbsKCalculation1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        OnClick = Contents1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'MfgModi'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 192915 $'
    BuildVersion = '176554'
    Left = 181
    Top = 121
  end
  object SrcMfgtypeEPlantRep: TDataSource
    DataSet = QryMfgtypeEPlantRep
    Left = 96
    Top = 180
  end
  object QryMfgtypeEPlantRep: TFDQuery
    BeforePost = QryMfgtypeEPlantRepBeforePost
    AfterPost = QryMfgtypeEPlantRepAfterPost
    AfterDelete = QryMfgtypeEPlantRepAfterPost
    OnNewRecord = QryMfgtypeEPlantRepNewRecord
    MasterSource = DataSource1
    MasterFields = 'MFGTYPE'
    DetailFields = 'MFGTYPE'
    OnUpdateRecord = QryMfgtypeEPlantRepUpdateRecord
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'select mfgtype,'
      '       eplant_id,'
      '       report_kind,'
      '       report_name,'
      '       field_name'
      '  from V_MFGTYPE_EPLANT_REPORTS'
      ' where rtrim(mfgtype) = rtrim(:mfgtype)'
      '   and misc.eplant_filter( eplant_id ) = 1'
      ' order by '
      '       eplant_id,'
      '       report_kind'
      ' ')
    Left = 95
    Top = 206
    ParamData = <
      item
        Name = 'MFGTYPE'
        DataType = ftString
        ParamType = ptInput
        Size = 11
        Value = '04-GENERIC'
      end>
    object QryMfgtypeEPlantRepEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'IQ.MFGTYPE_EPLANT_REPORT.EPLANT_ID'
      Required = True
      Size = 0
    end
    object QryMfgtypeEPlantRepREPORT_KIND: TStringField
      DisplayLabel = 'Report'
      DisplayWidth = 17
      FieldName = 'REPORT_KIND'
    end
    object QryMfgtypeEPlantRepREPORT_NAME: TStringField
      DisplayLabel = 'Report File Name'
      DisplayWidth = 29
      FieldName = 'REPORT_NAME'
      Required = True
      Size = 250
    end
    object QryMfgtypeEPlantRepFIELD_NAME: TStringField
      DisplayWidth = 21
      FieldName = 'FIELD_NAME'
      Visible = False
      Size = 21
    end
    object QryMfgtypeEPlantRepMFGTYPE: TStringField
      FieldName = 'MFGTYPE'
      Origin = 'IQ.MFGTYPE_EPLANT_REPORT.MFGTYPE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      FixedChar = True
      Size = 10
    end
  end
  object PkStandardMfgType: TIQWebHpick
    Filtered = True
    OnFilterRecord = PkStandardMfgTypeFilterRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select mfgtype, descrip from mfgtype')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 231
    Top = 184
    object PkStandardMfgTypeMFGTYPE: TStringField
      DisplayLabel = 'Standard Mfg Type'
      FieldName = 'MFGTYPE'
      Origin = 'IQ.MFGTYPE.MFGTYPE'
      FixedChar = True
      Size = 10
    end
    object PkStandardMfgTypeDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'IQ.MFGTYPE.DESCRIP'
      FixedChar = True
    end
  end
  object PkLocation: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select l.id as id,'
      '       l.loc_desc as location,'
      '       l.descrip as description,'
      '       l.eplant_id,'
      '       d.name as division'
      '  from locations l,'
      '       division d'
      ' where '
      '       l.division_id = d.id(+)'
      '   and misc.eplant_filter(l.eplant_id) = 1'
      '   and nvl(l.non_conform, '#39'N'#39') <> '#39'Y'#39
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 196
    Top = 183
    object PkLocationID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkLocationLOCATION: TStringField
      DisplayLabel = 'Location'
      DisplayWidth = 25
      FieldName = 'LOCATION'
      FixedChar = True
      Size = 30
    end
    object PkLocationDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIPTION'
      Size = 50
    end
    object PkLocationEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant _ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object PkLocationDIVISION: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 20
      FieldName = 'DIVISION'
      Size = 25
    end
  end
  object QryElemFixedOH: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from elements '
      ' where ELEM_TYPE = '#39'OVERHEADF'#39
      ' ')
    Left = 57
    Top = 121
  end
  object AppDef1: TIQWebAppDef
    AppCode = 'BOM'
    DataField = 'MFGTYPE'
    DataSource = DataSource1
    Left = 148
    Top = 283
  end
  object FDUpdateSQLMfgType: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'INSERT INTO MFGTYPE'
      '(MFGTYPE, DESCRIP, LABOR_RATE, BOM_REPORT, '
      
        '  WO_REPORT, ELEMENTS_ID, ELEMENTS_ID_OH, FLOOR_DISPO_ON_CLOCK_O' +
        'UT, '
      '  NON_RT_BACKFLUSH, IS_LABOR_BASED_OH, LABOR_BASED_OH_RATE, '
      '  LBSK_PERCENT_RUNNER, FAB_AUTO_LOGIN, FAB_PASSWORD_ON_LOGIN, '
      '  LABOR_POSTED_BY_TA, STANDARD_MFGTYPE, RT_COUNT_BASED_ON_SCAN, '
      '  ASSY1_FINAL_NO_SUPER_REQUIRED, ASSY1_PROCESS_CERTIFICATION, '
      
        '  INCLUDE_SCRAP_IN_BYPRODUCT, LOCATIONS_ID_IN, LOCATIONS_ID_OUT,' +
        ' '
      '  CR_TA_MSG_REPORT, ASSY1_DATA_REPORT, ASSY1_TRAVELER_REPORT, '
      
        '  ASSY1_TOTE_REPORT, FIXED_ELEMENTS_ID_OH, FIXED_LABOR_BASED_OH_' +
        'RATE, '
      '  ASSY1_USE_PERCENT_COMPLETE, LOGICAL_WORK_CENTER_SUPPORT, '
      '  ASSY3_BACKFLUSH_EACH_PROCESS, ASSY1_FINAL_ASSY_ON_PROCESS, '
      
        '  USE_YIELD_ON_BOM, DONOT_ROUNDUP_DEPENDENT, SHIFT_BACKFLUSH_RUL' +
        'E, '
      '  USE_LABOR_RATE_FOR_ACT_LABOR, TFORM2_STD_COST_BASED_PTWT, '
      
        '  ASSY1_CONSUME_MAT_BY_PROCESS, DEFAULT_UOM, PROD_REP_ADD_FLOOR_' +
        'DISPO_OUT, '
      '  FUTURE_LABOR_RATE, BUDGET_LABOR_RATE, FORECAST_LABOR_RATE, '
      '  LABELS_CONTROL_MTO_DISPO, OVERHEAD_POSTED_BY_TA)'
      
        'VALUES (:NEW_MFGTYPE, :NEW_DESCRIP, :NEW_LABOR_RATE, :NEW_BOM_RE' +
        'PORT, '
      
        '  :NEW_WO_REPORT, :NEW_ELEMENTS_ID, :NEW_ELEMENTS_ID_OH, :NEW_FL' +
        'OOR_DISPO_ON_CLOCK_OUT, '
      
        '  :NEW_NON_RT_BACKFLUSH, :NEW_IS_LABOR_BASED_OH, :NEW_LABOR_BASE' +
        'D_OH_RATE, '
      
        '  :NEW_LBSK_PERCENT_RUNNER, :NEW_FAB_AUTO_LOGIN, :NEW_FAB_PASSWO' +
        'RD_ON_LOGIN, '
      
        '  :NEW_LABOR_POSTED_BY_TA, :NEW_STANDARD_MFGTYPE, :NEW_RT_COUNT_' +
        'BASED_ON_SCAN, '
      
        '  :NEW_ASSY1_FINAL_NO_SUPER_REQUIRED, :NEW_ASSY1_PROCESS_CERTIFI' +
        'CATION, '
      
        '  :NEW_INCLUDE_SCRAP_IN_BYPRODUCT, :NEW_LOCATIONS_ID_IN, :NEW_LO' +
        'CATIONS_ID_OUT, '
      
        '  :NEW_CR_TA_MSG_REPORT, :NEW_ASSY1_DATA_REPORT, :NEW_ASSY1_TRAV' +
        'ELER_REPORT, '
      
        '  :NEW_ASSY1_TOTE_REPORT, :NEW_FIXED_ELEMENTS_ID_OH, :NEW_FIXED_' +
        'LABOR_BASED_OH_RATE, '
      
        '  :NEW_ASSY1_USE_PERCENT_COMPLETE, :NEW_LOGICAL_WORK_CENTER_SUPP' +
        'ORT, '
      
        '  :NEW_ASSY3_BACKFLUSH_EACH_PROCESS, :NEW_ASSY1_FINAL_ASSY_ON_PR' +
        'OCESS, '
      
        '  :NEW_USE_YIELD_ON_BOM, :NEW_DONOT_ROUNDUP_DEPENDENT, :NEW_SHIF' +
        'T_BACKFLUSH_RULE, '
      
        '  :NEW_USE_LABOR_RATE_FOR_ACT_LABOR, :NEW_TFORM2_STD_COST_BASED_' +
        'PTWT, '
      
        '  :NEW_ASSY1_CONSUME_MAT_BY_PROCESS, :NEW_DEFAULT_UOM, :NEW_PROD' +
        '_REP_ADD_FLOOR_DISPO_OUT, '
      
        '  :NEW_FUTURE_LABOR_RATE, :NEW_BUDGET_LABOR_RATE, :NEW_FORECAST_' +
        'LABOR_RATE, '
      '  :NEW_LABELS_CONTROL_MTO_DISPO, :NEW_OVERHEAD_POSTED_BY_TA)')
    ModifySQL.Strings = (
      'UPDATE MFGTYPE'
      
        'SET MFGTYPE = :NEW_MFGTYPE, DESCRIP = :NEW_DESCRIP, LABOR_RATE =' +
        ' :NEW_LABOR_RATE, '
      '  BOM_REPORT = :NEW_BOM_REPORT, WO_REPORT = :NEW_WO_REPORT, '
      
        '  ELEMENTS_ID = :NEW_ELEMENTS_ID, ELEMENTS_ID_OH = :NEW_ELEMENTS' +
        '_ID_OH, '
      '  FLOOR_DISPO_ON_CLOCK_OUT = :NEW_FLOOR_DISPO_ON_CLOCK_OUT, '
      
        '  NON_RT_BACKFLUSH = :NEW_NON_RT_BACKFLUSH, IS_LABOR_BASED_OH = ' +
        ':NEW_IS_LABOR_BASED_OH, '
      
        '  LABOR_BASED_OH_RATE = :NEW_LABOR_BASED_OH_RATE, LBSK_PERCENT_R' +
        'UNNER = :NEW_LBSK_PERCENT_RUNNER, '
      
        '  FAB_AUTO_LOGIN = :NEW_FAB_AUTO_LOGIN, FAB_PASSWORD_ON_LOGIN = ' +
        ':NEW_FAB_PASSWORD_ON_LOGIN, '
      
        '  LABOR_POSTED_BY_TA = :NEW_LABOR_POSTED_BY_TA, STANDARD_MFGTYPE' +
        ' = :NEW_STANDARD_MFGTYPE, '
      
        '  RT_COUNT_BASED_ON_SCAN = :NEW_RT_COUNT_BASED_ON_SCAN, ASSY1_FI' +
        'NAL_NO_SUPER_REQUIRED = :NEW_ASSY1_FINAL_NO_SUPER_REQUIRED, '
      
        '  ASSY1_PROCESS_CERTIFICATION = :NEW_ASSY1_PROCESS_CERTIFICATION' +
        ', '
      '  INCLUDE_SCRAP_IN_BYPRODUCT = :NEW_INCLUDE_SCRAP_IN_BYPRODUCT, '
      
        '  LOCATIONS_ID_IN = :NEW_LOCATIONS_ID_IN, LOCATIONS_ID_OUT = :NE' +
        'W_LOCATIONS_ID_OUT, '
      
        '  CR_TA_MSG_REPORT = :NEW_CR_TA_MSG_REPORT, ASSY1_DATA_REPORT = ' +
        ':NEW_ASSY1_DATA_REPORT, '
      
        '  ASSY1_TRAVELER_REPORT = :NEW_ASSY1_TRAVELER_REPORT, ASSY1_TOTE' +
        '_REPORT = :NEW_ASSY1_TOTE_REPORT, '
      
        '  FIXED_ELEMENTS_ID_OH = :NEW_FIXED_ELEMENTS_ID_OH, FIXED_LABOR_' +
        'BASED_OH_RATE = :NEW_FIXED_LABOR_BASED_OH_RATE, '
      '  ASSY1_USE_PERCENT_COMPLETE = :NEW_ASSY1_USE_PERCENT_COMPLETE, '
      
        '  LOGICAL_WORK_CENTER_SUPPORT = :NEW_LOGICAL_WORK_CENTER_SUPPORT' +
        ', '
      
        '  ASSY3_BACKFLUSH_EACH_PROCESS = :NEW_ASSY3_BACKFLUSH_EACH_PROCE' +
        'SS, '
      
        '  ASSY1_FINAL_ASSY_ON_PROCESS = :NEW_ASSY1_FINAL_ASSY_ON_PROCESS' +
        ', '
      
        '  USE_YIELD_ON_BOM = :NEW_USE_YIELD_ON_BOM, DONOT_ROUNDUP_DEPEND' +
        'ENT = :NEW_DONOT_ROUNDUP_DEPENDENT, '
      
        '  SHIFT_BACKFLUSH_RULE = :NEW_SHIFT_BACKFLUSH_RULE, USE_LABOR_RA' +
        'TE_FOR_ACT_LABOR = :NEW_USE_LABOR_RATE_FOR_ACT_LABOR, '
      '  TFORM2_STD_COST_BASED_PTWT = :NEW_TFORM2_STD_COST_BASED_PTWT, '
      
        '  ASSY1_CONSUME_MAT_BY_PROCESS = :NEW_ASSY1_CONSUME_MAT_BY_PROCE' +
        'SS, '
      
        '  DEFAULT_UOM = :NEW_DEFAULT_UOM, PROD_REP_ADD_FLOOR_DISPO_OUT =' +
        ' :NEW_PROD_REP_ADD_FLOOR_DISPO_OUT, '
      
        '  FUTURE_LABOR_RATE = :NEW_FUTURE_LABOR_RATE, BUDGET_LABOR_RATE ' +
        '= :NEW_BUDGET_LABOR_RATE, '
      
        '  FORECAST_LABOR_RATE = :NEW_FORECAST_LABOR_RATE, LABELS_CONTROL' +
        '_MTO_DISPO = :NEW_LABELS_CONTROL_MTO_DISPO, '
      '  OVERHEAD_POSTED_BY_TA = :NEW_OVERHEAD_POSTED_BY_TA'
      'WHERE rtrim(MFGTYPE) = rtrim(:OLD_MFGTYPE)')
    DeleteSQL.Strings = (
      'DELETE FROM MFGTYPE'
      'WHERE rtrim(MFGTYPE) = rtrim(:OLD_MFGTYPE)')
    FetchRowSQL.Strings = (
      
        'SELECT MFGTYPE, DESCRIP, LABOR_RATE, BOM_REPORT, WO_REPORT, ID, ' +
        'ELEMENTS_ID, '
      
        '  ELEMENTS_ID_OH, BEFORE_BOM_REPORT, BEFORE_WO_REPORT, FLOOR_DIS' +
        'PO_ON_CLOCK_OUT, '
      '  NON_RT_BACKFLUSH, IS_LABOR_BASED_OH, LABOR_BASED_OH_RATE, '
      '  LBSK_PERCENT_RUNNER, FAB_AUTO_LOGIN, FAB_PASSWORD_ON_LOGIN, '
      
        '  LABOR_POSTED_BY_TA, ASSY1_BACKFLUSH_EACH_PROCESS, STANDARD_MFG' +
        'TYPE, '
      
        '  RT_COUNT_BASED_ON_SCAN, ASSY1_FINAL_NO_SUPER_REQUIRED, ASSY1_P' +
        'ROCESS_CERTIFICATION, '
      
        '  INCLUDE_SCRAP_IN_BYPRODUCT, LOCATIONS_ID_IN, LOCATIONS_ID_OUT,' +
        ' '
      '  CR_TA_MSG_REPORT, ASSY1_DATA_REPORT, ASSY1_TRAVELER_REPORT, '
      
        '  ASSY1_TOTE_REPORT, FIXED_ELEMENTS_ID_OH, FIXED_LABOR_BASED_OH_' +
        'RATE, '
      '  ASSY1_USE_PERCENT_COMPLETE, LOGICAL_WORK_CENTER_SUPPORT, '
      '  ASSY3_BACKFLUSH_EACH_PROCESS, ASSY1_FINAL_ASSY_ON_PROCESS, '
      
        '  USE_YIELD_ON_BOM, DONOT_ROUNDUP_DEPENDENT, SHIFT_BACKFLUSH_RUL' +
        'E, '
      '  USE_LABOR_RATE_FOR_ACT_LABOR, TFORM2_STD_COST_BASED_PTWT, '
      '  ASSY1_CONSUME_MAT_BY_PROCESS, PLANTLAYOUT_IMAGE, DEFAULT_UOM, '
      
        '  PROD_REP_ADD_FLOOR_DISPO_OUT, FUTURE_LABOR_RATE, BUDGET_LABOR_' +
        'RATE, '
      
        '  FORECAST_LABOR_RATE, LABELS_CONTROL_MTO_DISPO, OVERHEAD_POSTED' +
        '_BY_TA'
      'FROM MFGTYPE'
      'WHERE MFGTYPE = :MFGTYPE')
    Left = 132
    Top = 152
  end
end
