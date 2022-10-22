object FrmTagSelect: TFrmTagSelect
  Left = 43
  Top = 123
  HelpContext = 1117219
  ClientHeight = 499
  ClientWidth = 832
  Caption = 'Worksheet Selection  Criteria'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter3: TUniSplitter
    Left = 0
    Top = 392
    Width = 832
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alBottom
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 395
    Width = 832
    Height = 104
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Label5: TUniLabel
      Left = 1
      Top = 5
      Width = 115
      Height = 14
      Hint = ''
      Caption = ' Additional Criteria'
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Height = -12
      Font.Style = [fsBold]
      TabOrder = 4
    end
    object Bevel4: TUniPanel
      Left = 1
      Top = 19
      Width = 21
      Height = 84
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 5
      Caption = ''
    end
    object lblDivision: TUniLabel
      Left = 27
      Top = 22
      Width = 36
      Height = 13
      Hint = ''
      Caption = 'Division'
      TabOrder = 6
    end
    object Bevel5: TUniPanel
      Left = 1
      Top = 1
      Width = 830
      Height = 4
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 7
      Caption = ''
    end
    object wwDBLookupDivision: TUniDBLookupComboBox
      Left = 27
      Top = 38
      Width = 292
      Height = 21
      Hint = ''
      ListOnlyMode = lmFollowSource
      ListField = 'NAME;DESCRIP'
      ListSource = SrcDivision
      KeyField = 'NAME'
      ListFieldIndex = 0
      TabOrder = 0
      Color = clWindow
    end
    object cbDoNotAutoCreatetags: TUniCheckBox
      Left = 27
      Top = 63
      Width = 163
      Height = 17
      Hint = ''
      Caption = 'Do Not Auto-Create Tags'
      TabOrder = 1
      OnClick = cbDoNotAutoCreatetagsClick
    end
    object chkRequireAlLCounted: TUniCheckBox
      Left = 27
      Top = 81
      Width = 182
      Height = 17
      Hint = ''
      Caption = 'Require All Tags to Be Counted'
      TabOrder = 2
      OnClick = chkRequireAlLCountedClick
    end
  end
  object Panel15: TUniPanel
    Left = 719
    Top = 0
    Width = 113
    Height = 392
    Hint = ''
    Align = alRight
    Anchors = [akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Bevel6: TUniPanel
      Left = 1
      Top = 1
      Width = 3
      Height = 390
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 1
      Caption = ''
    end
    object btnOk: TUniButton
      Left = 10
      Top = 8
      Width = 97
      Height = 25
      Hint = ''
      Caption = 'OK'
      TabOrder = 2
      OnClick = btnOkClick
    end
    object btnCancel: TUniButton
      Left = 10
      Top = 43
      Width = 97
      Height = 25
      Hint = ''
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 3
    end
  end
  object Panel20: TUniPanel
    Left = 0
    Top = 0
    Width = 719
    Height = 392
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Splitter5: TUniSplitter
      Left = 193
      Top = 1
      Width = 6
      Height = 390
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object Bevel3: TUniPanel
      Left = 715
      Top = 1
      Width = 3
      Height = 390
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 4
      Caption = ''
    end
    object Panel21: TUniPanel
      Left = 1
      Top = 1
      Width = 192
      Height = 390
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label6: TUniLabel
        Left = 0
        Top = 5
        Width = 81
        Height = 14
        Hint = ''
        Caption = ' Main Criteria'
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 5
      end
      object rbFullInv: TUniRadioButton
        Left = 13
        Top = 28
        Width = 169
        Height = 17
        Hint = ''
        Caption = 'Full Physical Inventory'
        TabOrder = 0
        OnClick = rbFullInvClick
      end
      object RBCycleCountCode: TUniRadioButton
        Left = 13
        Top = 56
        Width = 158
        Height = 17
        Hint = ''
        Caption = 'Based on Cycle Count Code'
        TabOrder = 1
        OnClick = RBCycleCountCodeClick
      end
      object rbProduction: TUniRadioButton
        Left = 13
        Top = 84
        Width = 169
        Height = 17
        Hint = ''
        Caption = 'Based On Production Need'
        TabOrder = 2
        OnClick = rbProductionClick
      end
      object rbClass: TUniRadioButton
        Left = 13
        Top = 112
        Width = 169
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Based On Location'
        TabOrder = 3
        OnClick = rbClassClick
      end
    end
    object pnlMainClient: TUniPanel
      Left = 199
      Top = 1
      Width = 516
      Height = 390
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Bevel2: TUniPanel
        Left = 1
        Top = 33
        Width = 514
        Height = 3
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        Caption = ''
      end
      object pnlMain: TUniPanel
        Left = 1
        Top = 36
        Width = 514
        Height = 353
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        ExplicitLeft = 0
        ExplicitTop = 35
        ExplicitWidth = 521
        ExplicitHeight = 357
        object pgctrlMain: TUniPageControl
          Left = 1
          Top = 1
          Width = 512
          Height = 351
          Hint = ''
          ActivePage = tabBasedLocation
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          object tabBasedFullInv: TUniTabSheet
            Hint = ''
            Caption = 'Full Inv'
            object Panel3: TUniPanel
              Tag = 1999
              Left = 0
              Top = 0
              Width = 504
              Height = 323
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
              Caption = ''
            end
          end
          object tabBasedCycleCount: TUniTabSheet
            Hint = ''
            ImageIndex = 1
            Caption = 'Cycle Count'
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 256
            ExplicitHeight = 128
            object Panel23: TUniPanel
              Tag = 1999
              Left = 0
              Top = 0
              Width = 504
              Height = 105
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              Caption = ''
              object Label3: TUniLabel
                Left = 37
                Top = 58
                Width = 86
                Height = 13
                Hint = ''
                Caption = 'Cycle Count Code'
                TabOrder = 5
              end
              object chkbAllCycleCountCodes: TUniCheckBox
                Left = 15
                Top = 8
                Width = 142
                Height = 17
                Hint = 'Include all cycle count codes'
                Caption = 'Include All Cycle Codes'
                TabOrder = 0
                OnClick = chkCycleCountCodesClick
              end
              object dbCycleCountCode: TUniDBLookupComboBox
                Left = 155
                Top = 55
                Width = 130
                Height = 21
                Hint = ''
                ListFieldIndex = 0
                TabOrder = 2
                Color = clWindow
              end
              object chkbSelectedCycleCountCodes: TUniCheckBox
                Left = 15
                Top = 79
                Width = 174
                Height = 17
                Hint = 'Include selected cycle count codes'
                Caption = 'Include Selected Cycle Codes'
                TabOrder = 3
                OnClick = chkCycleCountCodesClick
              end
              object chkbOneCycleCountCode: TUniCheckBox
                Left = 15
                Top = 34
                Width = 122
                Height = 18
                Hint = 'Select one cycle count code'
                Caption = 'One Cycle Code'
                TabOrder = 1
                OnClick = chkCycleCountCodesClick
              end
            end
            object Panel4: TUniPanel
              Tag = 1999
              Left = 0
              Top = 105
              Width = 504
              Height = 218
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              object Bevel1: TUniPanel
                Left = 1
                Top = 1
                Width = 29
                Height = 216
                Hint = ''
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                TabOrder = 2
                Caption = ''
              end
              object IQSearch2: TIQUniGridControl
                Left = 30
                Top = 1
                Width = 473
                Height = 216
                Layout = 'border'
                ParentAlignmentControl = False
                AlignmentControl = uniAlignmentClient
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 0
                IQComponents.Grid.Left = 0
                IQComponents.Grid.Top = 29
                IQComponents.Grid.Width = 256
                IQComponents.Grid.Height = 130
                IQComponents.Grid.Hint = ''
                IQComponents.Grid.DataSource = SrcCycleCountCodeGrid
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
                IQComponents.Navigator.DataSource = SrcCycleCountCodeGrid
                IQComponents.Navigator.LayoutConfig.Region = 'east'
                IQComponents.Navigator.TabOrder = 3
                IQComponents.HiddenPanel.Left = 256
                IQComponents.HiddenPanel.Top = 29
                IQComponents.HiddenPanel.Width = 209
                IQComponents.HiddenPanel.Height = 130
                IQComponents.HiddenPanel.Hint = ''
                IQComponents.HiddenPanel.Visible = True
                IQComponents.HiddenPanel.Align = alRight
                IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
                IQComponents.FormTab.Hint = ''
                IQComponents.FormTab.ImageIndex = 1
                IQComponents.FormTab.Caption = 'Form'
                IQComponents.FormTab.Layout = 'border'
                DataSource = SrcCycleCountCodeGrid
                Columns = <
                  item
                    FieldName = 'CODE'
                    Title.Caption = 'Code'
                    Width = 64
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'DESCRIP'
                    Title.Caption = 'Descrition'
                    Width = 64
                    CheckBoxField.FieldValues = 'true;false'
                  end>
                TabsVisible = True
                Marker = 0
              end
            end
          end
          object tabBasedProd: TUniTabSheet
            Hint = ''
            ImageIndex = 2
            Caption = 'Production'
            object Panel24: TUniPanel
              Tag = 1999
              Left = 0
              Top = 0
              Width = 504
              Height = 323
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
              Caption = ''
              object Label1: TUniLabel
                Left = 12
                Top = 13
                Width = 67
                Height = 13
                Hint = ''
                Caption = 'Scope in Days'
                TabOrder = 2
              end
              object seScope: TUniSpinEdit
                Left = 116
                Top = 8
                Width = 139
                Height = 22
                Hint = ''
                TabOrder = 0
              end
            end
          end
          object tabBasedLocation: TUniTabSheet
            Hint = ''
            ImageIndex = 3
            Caption = 'Location'
            object Panel25: TUniPanel
              Tag = 1999
              Left = 0
              Top = 0
              Width = 504
              Height = 323
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
              Caption = ''
              object Splitter6: TUniSplitter
                Left = 1
                Top = 130
                Width = 502
                Height = 3
                Cursor = crVSplit
                Hint = ''
                Align = alTop
                ParentColor = False
                Color = clBtnFace
              end
              object pgctrlLocation: TUniPageControl
                Left = 1
                Top = 133
                Width = 502
                Height = 189
                Hint = ''
                ActivePage = tabCycleCount
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 0
                OnChange = pgctrlLocationChange
                object tabClass: TUniTabSheet
                  Hint = ''
                  Caption = 'Class'
                  object IQSearch1: TIQUniGridControl
                    Left = 0
                    Top = 0
                    Width = 494
                    Height = 161
                    Layout = 'border'
                    ParentAlignmentControl = False
                    AlignmentControl = uniAlignmentClient
                    Align = alClient
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    TabOrder = 0
                    IQComponents.Grid.Left = 0
                    IQComponents.Grid.Top = 29
                    IQComponents.Grid.Width = 277
                    IQComponents.Grid.Height = 75
                    IQComponents.Grid.Hint = ''
                    IQComponents.Grid.DataSource = SrcClass
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
                    IQComponents.Navigator.DataSource = SrcClass
                    IQComponents.Navigator.LayoutConfig.Region = 'east'
                    IQComponents.Navigator.TabOrder = 3
                    IQComponents.HiddenPanel.Left = 277
                    IQComponents.HiddenPanel.Top = 29
                    IQComponents.HiddenPanel.Width = 209
                    IQComponents.HiddenPanel.Height = 75
                    IQComponents.HiddenPanel.Hint = ''
                    IQComponents.HiddenPanel.Visible = True
                    IQComponents.HiddenPanel.Align = alRight
                    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
                    IQComponents.FormTab.Hint = ''
                    IQComponents.FormTab.ImageIndex = 1
                    IQComponents.FormTab.Caption = 'Form'
                    IQComponents.FormTab.Layout = 'border'
                    DataSource = SrcClass
                    Columns = <
                      item
                        FieldName = 'CLASS'
                        Title.Caption = 'Class'
                        Width = 64
                        CheckBoxField.FieldValues = 'true;false'
                      end>
                    TabsVisible = True
                    Marker = 0
                  end
                end
                object tabItem: TUniTabSheet
                  Hint = ''
                  ImageIndex = 1
                  Caption = 'Item'
                  object IQSearchItem: TIQUniGridControl
                    Left = 0
                    Top = 0
                    Width = 494
                    Height = 161
                    Layout = 'border'
                    ParentAlignmentControl = False
                    AlignmentControl = uniAlignmentClient
                    Align = alClient
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    TabOrder = 0
                    IQComponents.Grid.Left = 0
                    IQComponents.Grid.Top = 29
                    IQComponents.Grid.Width = 277
                    IQComponents.Grid.Height = 75
                    IQComponents.Grid.Hint = ''
                    IQComponents.Grid.DataSource = SrcArinvt
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
                    IQComponents.Navigator.DataSource = SrcArinvt
                    IQComponents.Navigator.LayoutConfig.Region = 'east'
                    IQComponents.Navigator.TabOrder = 3
                    IQComponents.HiddenPanel.Left = 277
                    IQComponents.HiddenPanel.Top = 29
                    IQComponents.HiddenPanel.Width = 209
                    IQComponents.HiddenPanel.Height = 75
                    IQComponents.HiddenPanel.Hint = ''
                    IQComponents.HiddenPanel.Visible = True
                    IQComponents.HiddenPanel.Align = alRight
                    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
                    IQComponents.FormTab.Hint = ''
                    IQComponents.FormTab.ImageIndex = 1
                    IQComponents.FormTab.Caption = 'Form'
                    IQComponents.FormTab.Layout = 'border'
                    DataSource = SrcArinvt
                    Columns = <
                      item
                        FieldName = 'ITEMNO'
                        Title.Caption = 'Item #'
                        Width = 64
                        ReadOnly = True
                        CheckBoxField.FieldValues = 'true;false'
                      end
                      item
                        FieldName = 'DESCRIP'
                        Title.Caption = 'Description'
                        Width = 64
                        ReadOnly = True
                        CheckBoxField.FieldValues = 'true;false'
                      end
                      item
                        FieldName = 'REV'
                        Title.Caption = 'Rev'
                        Width = 64
                        ReadOnly = True
                        CheckBoxField.FieldValues = 'true;false'
                      end
                      item
                        FieldName = 'CLASS'
                        Title.Caption = 'Class'
                        Width = 64
                        ReadOnly = True
                        CheckBoxField.FieldValues = 'true;false'
                      end
                      item
                        FieldName = 'DESCRIP2'
                        Title.Caption = 'Ext Description'
                        Width = 64
                        ReadOnly = True
                        CheckBoxField.FieldValues = 'true;false'
                      end>
                    TabsVisible = True
                    Marker = 0
                  end
                end
                object tabCycleCount: TUniTabSheet
                  Hint = ''
                  ImageIndex = 2
                  Caption = 'Cycle Count Code'
                  object Panel2: TUniPanel
                    Tag = 1999
                    Left = 0
                    Top = 0
                    Width = 494
                    Height = 161
                    Hint = ''
                    Align = alClient
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    TabOrder = 0
                    Caption = ''
                    object IQSearchCycleCount: TIQUniGridControl
                      Left = 1
                      Top = 1
                      Width = 492
                      Height = 159
                      Layout = 'border'
                      ParentAlignmentControl = False
                      AlignmentControl = uniAlignmentClient
                      Align = alClient
                      Anchors = [akLeft, akTop, akRight, akBottom]
                      TabOrder = 0
                      IQComponents.Grid.Left = 0
                      IQComponents.Grid.Top = 29
                      IQComponents.Grid.Width = 275
                      IQComponents.Grid.Height = 73
                      IQComponents.Grid.Hint = ''
                      IQComponents.Grid.DataSource = SrcCycleCountCodeGrid
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
                      IQComponents.Navigator.DataSource = SrcCycleCountCodeGrid
                      IQComponents.Navigator.LayoutConfig.Region = 'east'
                      IQComponents.Navigator.TabOrder = 3
                      IQComponents.HiddenPanel.Left = 275
                      IQComponents.HiddenPanel.Top = 29
                      IQComponents.HiddenPanel.Width = 209
                      IQComponents.HiddenPanel.Height = 73
                      IQComponents.HiddenPanel.Hint = ''
                      IQComponents.HiddenPanel.Visible = True
                      IQComponents.HiddenPanel.Align = alRight
                      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
                      IQComponents.FormTab.Hint = ''
                      IQComponents.FormTab.ImageIndex = 1
                      IQComponents.FormTab.Caption = 'Form'
                      IQComponents.FormTab.Layout = 'border'
                      DataSource = SrcCycleCountCodeGrid
                      Columns = <
                        item
                          FieldName = 'CODE'
                          Title.Caption = 'Code'
                          Width = 64
                          CheckBoxField.FieldValues = 'true;false'
                        end
                        item
                          FieldName = 'DESCRIP'
                          Title.Caption = 'Descrition'
                          Width = 64
                          CheckBoxField.FieldValues = 'true;false'
                        end>
                      TabsVisible = True
                      Marker = 0
                    end
                  end
                end
              end
              object Panel26: TUniPanel
                Left = 1
                Top = 1
                Width = 502
                Height = 129
                Hint = ''
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
                Caption = ''
                object Splitter1: TUniSplitter
                  Left = 254
                  Top = 1
                  Width = 6
                  Height = 127
                  Hint = ''
                  Align = alLeft
                  ParentColor = False
                  Color = clBtnFace
                end
                object pnlAvailableLocations: TUniPanel
                  Left = 1
                  Top = 1
                  Width = 253
                  Height = 127
                  Hint = ''
                  Align = alLeft
                  Anchors = [akLeft, akTop, akBottom]
                  TabOrder = 0
                  Caption = ''
                  object Panel10: TUniPanel
                    Left = 1
                    Top = 1
                    Width = 221
                    Height = 125
                    Hint = ''
                    Align = alClient
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    TabOrder = 0
                    Caption = ''
                    object Panel13: TUniPanel
                      Left = 1
                      Top = 1
                      Width = 219
                      Height = 20
                      Hint = ''
                      Align = alTop
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 0
                      Caption = 'All Locations'
                      object sbtnRefreshLocations: TUniSpeedButton
                        Left = 1
                        Top = 0
                        Width = 20
                        Height = 20
                        Hint = 'Refresh Locations'
                        ShowHint = True
                        ParentShowHint = False
                        Glyph.Data = {
                          46010000424D460100000000000076000000280000001C0000000D0000000100
                          040000000000D000000000000000000000001000000000000000000000000000
                          8000008000000080800080000000800080008080000080808000C0C0C0000000
                          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                          3333333FFFFF3333000033333707333333333FF3337733330000333700733333
                          3333733337333333000033300733333333337333733333330000337073333333
                          3337333F3333333300003300333333333337333F3FFFFFF30000330033300000
                          3337333F733333F300003300733370003337333F373333F30000337007370000
                          33373333F33333F3000033300000007033337333333373F30000333370007330
                          33333733333773F3000033333333333333333377777337330000333333333333
                          33333333333333330000}
                        Caption = ''
                        ParentColor = False
                        Color = clWindow
                        OnClick = sbtnRefreshLocationsClick
                      end
                    end
                    object lbSelect: TUniListBox
                      Left = 1
                      Top = 21
                      Width = 219
                      Height = 103
                      Hint = ''
                      Align = alClient
                      Anchors = [akLeft, akTop, akRight, akBottom]
                      TabOrder = 1
                      MultiSelect = True
                    end
                  end
                  object Panel18: TUniPanel
                    Left = 222
                    Top = 1
                    Width = 30
                    Height = 125
                    Hint = ''
                    Align = alRight
                    Anchors = [akTop, akRight, akBottom]
                    TabOrder = 1
                    Caption = ''
                    object BtnRight: TUniButton
                      Left = 4
                      Top = 21
                      Width = 25
                      Height = 25
                      Hint = ''
                      Caption = '>'
                      ParentFont = False
                      Font.Color = clBlack
                      Font.Height = -12
                      TabOrder = 1
                      OnClick = BtnRightClick
                    end
                    object BtnAllRight: TUniButton
                      Left = 4
                      Top = 45
                      Width = 25
                      Height = 25
                      Hint = ''
                      Caption = '>>'
                      ParentFont = False
                      Font.Color = clBlack
                      Font.Height = -12
                      TabOrder = 2
                      OnClick = BtnAllRightClick
                    end
                    object BtnAllLeft: TUniButton
                      Left = 4
                      Top = 69
                      Width = 25
                      Height = 25
                      Hint = ''
                      Caption = '<<'
                      ParentFont = False
                      Font.Color = clBlack
                      Font.Height = -12
                      TabOrder = 3
                      OnClick = BtnAllLeftClick
                    end
                    object BtnLeft: TUniButton
                      Left = 4
                      Top = 93
                      Width = 25
                      Height = 25
                      Hint = ''
                      Caption = '<'
                      ParentFont = False
                      Font.Color = clBlack
                      Font.Height = -12
                      TabOrder = 4
                      OnClick = BtnLeftClick
                    end
                  end
                end
                object Panel8: TUniPanel
                  Left = 260
                  Top = 1
                  Width = 241
                  Height = 127
                  Hint = ''
                  Align = alClient
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  TabOrder = 1
                  Caption = ''
                  object Panel9: TUniPanel
                    Left = 1
                    Top = 1
                    Width = 239
                    Height = 20
                    Hint = ''
                    Align = alTop
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 0
                    Caption = 'Selected Locations'
                  end
                  object lbLoc: TUniListBox
                    Left = 1
                    Top = 21
                    Width = 239
                    Height = 105
                    Hint = ''
                    Align = alClient
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    TabOrder = 1
                    MultiSelect = True
                  end
                end
              end
            end
          end
        end
      end
      object pnlTitle: TUniPanel
        Left = 1
        Top = 1
        Width = 514
        Height = 32
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 1
        Alignment = taLeftJustify
        Caption = '  Full Physical Inventory'
      end
    end
  end
  object tblLocations: TFDTable
    BeforeOpen = tblLocationsBeforeOpen
    Filtered = True
    IndexFieldNames = 'LOC_DESC;EPLANT_ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'LOCATIONS'
    TableName = 'LOCATIONS'
    Left = 5
    Top = 233
    object tblLocationsEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object tblLocationsID: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object tblLocationsLOC_DESC: TStringField
      FieldName = 'LOC_DESC'
      Size = 30
    end
    object tblLocationsSTART_ROW: TBCDField
      FieldName = 'START_ROW'
      Size = 0
    end
    object tblLocationsSTART_COL: TBCDField
      FieldName = 'START_COL'
      Size = 0
    end
    object tblLocationsEND_ROW: TBCDField
      FieldName = 'END_ROW'
      Size = 0
    end
    object tblLocationsEND_COL: TBCDField
      FieldName = 'END_COL'
      Size = 0
    end
    object tblLocationsSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object tblLocationsDIVISION_ID: TBCDField
      FieldName = 'DIVISION_ID'
      Size = 0
    end
    object tblLocationsDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 50
    end
    object tblLocationsVMI: TStringField
      FieldName = 'VMI'
      Size = 1
    end
  end
  object pmSelect: TUniPopupMenu
    Left = 41
    Top = 234
    object SelectAll2: TUniMenuItem
      Caption = 'Select All'
      OnClick = SelectAll2Click
    end
    object DeselectAll2: TUniMenuItem
      Caption = 'Deselect All'
      OnClick = DeselectAll2Click
    end
    object InvertSelection1: TUniMenuItem
      Caption = 'Invert Selection'
      OnClick = InvertSelection1Click
    end
  end
  object pmLoc: TUniPopupMenu
    Left = 73
    Top = 234
    object SelectAll3: TUniMenuItem
      Caption = 'Select All'
      OnClick = SelectAll3Click
    end
    object DeselectAll3: TUniMenuItem
      Caption = 'Deselect All'
      OnClick = DeselectAll3Click
    end
    object InvertSelection2: TUniMenuItem
      Caption = 'Invert Selection'
      OnClick = InvertSelection2Click
    end
  end
  object SrcClass: TDataSource
    DataSet = QryClass
    Left = 14
    Top = 178
  end
  object QryClass: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct class from arinvt')
    Left = 30
    Top = 178
    object QryClassCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 10
      FieldName = 'CLASS'
      Origin = 'CLASS'
      FixedChar = True
      Size = 2
    end
  end
  object QryCycleCountCode: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, code, descrip'
      '  from cycle_count'
      ' order by code'
      ' ')
    Left = 111
    Top = 225
    object QryCycleCountCodeCODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 15
      FieldName = 'CODE'
      Origin = 'IQ.CYCLE_COUNT.CODE'
      Size = 15
    end
    object QryCycleCountCodeDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Origin = 'IQ.CYCLE_COUNT.DESCRIP'
      Size = 35
    end
    object QryCycleCountCodeID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.CYCLE_COUNT.ID'
      Visible = False
      Size = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 15
    Top = 272
    object File1: TUniMenuItem
      Caption = 'File'
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
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmTagSelect'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 196616 $'
    BuildVersion = '176554'
    Left = 48
    Top = 273
  end
  object QryDivision: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select -1 as ID,'
      
        '        decode( NVL(is_whs_division, '#39'N'#39'), '#39'Y'#39', '#39'<All Warehouses' +
        '>'#39',         '#39'<All Divisions>'#39'         ) as name,'
      
        '        decode( NVL(is_whs_division, '#39'N'#39'), '#39'Y'#39', '#39'<Include All Wa' +
        'rehouses>'#39', '#39'<Include All Divisions>'#39' ) as descrip,'
      '        0 as sort'
      '   from params'
      ''
      'UNION ALL       '
      ''
      'select id, '
      '       name, '
      '       descrip,'
      '       1 as sort'
      '  from division'
      ' where misc.eplant_filter( eplant_id ) = 1'
      ' '
      ' order by sort, name'
      '')
    Left = 145
    Top = 226
    object QryDivisionNAME: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 25
      FieldName = 'NAME'
      Size = 25
    end
    object QryDivisionDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 50
      FieldName = 'DESCRIP'
      Size = 50
    end
    object QryDivisionID: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 38
    end
  end
  object QryCycleCountCodeGrid: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, code, descrip'
      '  from cycle_count'
      ' order by code'
      ' ')
    Left = 36
    Top = 138
    object QryCycleCountCodeGridCODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 15
      FieldName = 'CODE'
      Origin = 'CODE'
      Size = 15
    end
    object QryCycleCountCodeGridDESCRIP: TStringField
      DisplayLabel = 'Descrition'
      DisplayWidth = 37
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 35
    end
    object QryCycleCountCodeGridID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'ID'
      Visible = False
      Size = 0
    end
  end
  object SrcCycleCountCodeGrid: TDataSource
    DataSet = QryCycleCountCodeGrid
    Left = 16
    Top = 138
  end
  object SrcArinvt: TDataSource
    DataSet = QryArinvt
    Left = 69
    Top = 177
  end
  object QryArinvt: TFDQuery
    Tag = 1
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.id,'
      '       a.itemno,'
      '       a.descrip,'
      '       a.rev,'
      '       a.class,'
      '       a.descrip2'
      '  from '
      '       arinvt a'
      ' where '
      '       misc.eplant_filter( eplant_id ) = 1'
      '    '
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 81
    Top = 177
    object QryArinvtITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 'a.itemno'
      ReadOnly = True
      FixedChar = True
      Size = 50
    end
    object QryArinvtDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 28
      FieldName = 'DESCRIP'
      Origin = 'a.descrip'
      ReadOnly = True
      Size = 100
    end
    object QryArinvtREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 8
      FieldName = 'REV'
      Origin = 'a.rev'
      ReadOnly = True
      FixedChar = True
      Size = 15
    end
    object QryArinvtCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 4
      FieldName = 'CLASS'
      Origin = 'a.class'
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object QryArinvtDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP2'
      Origin = 'a.descrip2'
      ReadOnly = True
      Size = 100
    end
    object QryArinvtID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
  end
  object SrcDivision: TDataSource
    DataSet = QryDivision
    Left = 96
    Top = 328
  end
end
