object FrmCRMWordEdit: TFrmCRMWordEdit
  Left = 164
  Top = 158
  ClientHeight = 426
  ClientWidth = 747
  Caption = 'CRM Mail Merge Wizard'
  OnShow = FormShow
  BorderStyle = bsSingle
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  ActiveControl = cmbQueries
  PixelsPerInch = 96
  TextHeight = 13
  object PnlCarrier: TUniPanel
    Left = 0
    Top = 0
    Width = 747
    Height = 426
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitWidth = 653
    ExplicitHeight = 427
    object SplitterMenu: TUniSplitter
      Left = 158
      Top = 0
      Width = 6
      Height = 390
      Hint = ''
      Visible = False
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlPageControlCarrier: TUniPanel
      Left = 164
      Top = 1
      Width = 583
      Height = 390
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object pcMain: TUniPageControl
        Left = 1
        Top = 1
        Width = 581
        Height = 388
        Hint = ''
        ActivePage = TabDataSet
        TabBarVisible = False
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        ExplicitWidth = 490
        ExplicitHeight = 389
        object TabDataSet: TUniTabSheet
          Hint = ''
          ImageIndex = 5
          Caption = 'Merge Dataset'
          object PnlMergeDataset: TUniPanel
            Tag = 1999
            Left = 0
            Top = 0
            Width = 573
            Height = 360
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            object Label2: TUniLabel
              Left = 16
              Top = 92
              Width = 38
              Height = 13
              Hint = ''
              Caption = 'Dataset'
              TabOrder = 1
            end
            object CaptionPanel1: TIQWebCaptionPanel
              Left = 1
              Top = 1
              Width = 571
              Height = 60
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              Caption = 'Step 1 of 7:  What data do you want to merge?'
              ParentColor = True
              Text = 'Please choose from the list of datasets.'
              PictureLayout = plImageRight
              LayoutStyle = lsBasic
              DesignSize = (
                571
                60)
            end
            object cmbQueries: TUniComboBox
              Left = 60
              Top = 89
              Width = 217
              Hint = ''
              Style = csDropDownList
              Text = ''
              Items.Strings = (
                'Applicants'
                'Contacts'
                'CRM Group'
                'Customers and Prospects'
                'Employees'
                'Partner Contacts'
                'Partners'
                'Vendor Contacts'
                'Vendors')
              TabOrder = 3
              OnDropDown = cmbQueriesDropDown
              OnChange = cmbQueriesChange
            end
          end
        end
        object TabFields: TUniTabSheet
          Hint = ''
          Caption = 'Merge Fields'
          object PnlMergeFields: TUniPanel
            Tag = 1999
            Left = 0
            Top = 0
            Width = 573
            Height = 360
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            object PnlFieldSelection: TUniPanel
              Tag = 1999
              Left = 1
              Top = 60
              Width = 571
              Height = 300
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
              Caption = ''
              object Splitter1: TUniSplitter
                Left = 200
                Top = 0
                Width = 6
                Height = 295
                Hint = ''
                Align = alLeft
                ParentColor = False
                Color = clBtnFace
              end
              object Bevel4: TUniPanel
                Left = 1
                Top = 295
                Width = 569
                Height = 5
                Hint = ''
                Align = alBottom
                Anchors = [akLeft, akRight, akBottom]
                TabOrder = 4
                Caption = ''
              end
              object Bevel1: TUniPanel
                Left = 1
                Top = 1
                Width = 6
                Height = 295
                Hint = ''
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                TabOrder = 5
                Caption = ''
              end
              object Bevel3: TUniPanel
                Left = 565
                Top = 1
                Width = 6
                Height = 295
                Hint = ''
                Align = alRight
                Anchors = [akTop, akRight, akBottom]
                TabOrder = 6
                Caption = ''
              end
              object PnlFieldSelection01: TUniPanel
                Left = 6
                Top = 1
                Width = 194
                Height = 295
                Hint = ''
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                TabOrder = 0
                Caption = ''
                object lstAvailableFields: TUniListBox
                  Left = 1
                  Top = 20
                  Width = 192
                  Height = 275
                  Hint = ''
                  ShowHint = True
                  ParentShowHint = False
                  Align = alClient
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  TabOrder = 0
                  MultiSelect = True
                  OnDblClick = sbtnIncludeClick
                end
                object PnlMergeFieldsAvailBar: TUniPanel
                  Tag = 1999
                  Left = 1
                  Top = 1
                  Width = 192
                  Height = 20
                  Hint = ''
                  Align = alTop
                  Anchors = [akLeft, akTop, akRight]
                  ParentFont = False
                  Font.Color = clWhite
                  TabOrder = 1
                  Caption = ''
                  Color = clBtnShadow
                  object Label40: TUniLabel
                    Left = 1
                    Top = 1
                    Width = 87
                    Height = 13
                    Hint = 'Fields available for you to select for your merge document.'
                    ShowHint = True
                    ParentShowHint = False
                    Caption = 'Available Fields'
                    Align = alTop
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clWhite
                    Font.Style = [fsBold]
                    TabOrder = 1
                  end
                end
              end
              object Panel7: TUniPanel
                Left = 206
                Top = 1
                Width = 359
                Height = 295
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
                Caption = ''
                object PnlSelectionControls: TUniPanel
                  Left = 1
                  Top = 1
                  Width = 30
                  Height = 293
                  Hint = ''
                  Align = alLeft
                  Anchors = [akLeft, akTop, akBottom]
                  TabOrder = 0
                  Caption = ''
                  DesignSize = (
                    30
                    293)
                  object Panel4: TUniPanel
                    Left = 1
                    Top = 87
                    Width = 28
                    Height = 122
                    Hint = ''
                    Anchors = [akLeft]
                    TabOrder = 0
                    Caption = ''
                    object sbtnInclude: TUniSpeedButton
                      Left = 3
                      Top = 1
                      Width = 25
                      Height = 25
                      Hint = 'Select Field'
                      ShowHint = True
                      ParentShowHint = False
                      Glyph.Data = {
                        46010000424D460100000000000076000000280000001A0000000D0000000100
                        040000000000D000000000000000000000001000000010000000000000000000
                        8000008000000080800080000000800080008080000080808000C0C0C0000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                        88888888F8888800000088888808888888888887FF8888000000888888008888
                        8888888778F8880000008888880608888888FFF7F78F88000000880000066088
                        888777778878F80000008806666666088887F88888878F000000880666666660
                        8887F8888888780000008806666666088887FFFFF88788000000880000066088
                        88877777F8788800000088888806088888888887F78888000000888888008888
                        8888888778888800000088888808888888888887888888000000888888888888
                        88888888888888000000}
                      Caption = ''
                      ParentColor = False
                      Color = clWindow
                      OnClick = sbtnIncludeClick
                    end
                    object sbtnIncludeAll: TUniSpeedButton
                      Left = 3
                      Top = 30
                      Width = 25
                      Height = 25
                      Hint = 'Select All Fields'
                      ShowHint = True
                      ParentShowHint = False
                      Glyph.Data = {
                        46010000424D460100000000000076000000280000001C0000000D0000000100
                        040000000000D000000000000000000000001000000010000000000000000000
                        8000008000000080800080000000800080008080000080808000C0C0C0000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                        DDDDDDDDDDDDDDDD0000DDDDD0DD0DDDDDDDDD7FD7FDDDDD0000DDDDD00D00DD
                        DDDDDD77F77FDDDD0000DDDDD060060DDDDDDD787787FDDD0000D00000660660
                        DD77777F87F87FDD0000D066666660660D78FFF8F87F87FD0000D06666666606
                        607888888F87F87D0000D066666660660D788888887887DD0000D00000660660
                        DD77777887887DDD0000DDDDD060060DDDDDDD787787DDDD0000DDDDD00D00DD
                        DDDDDD77D77DDDDD0000DDDDD0DD0DDDDDDDDD7DD7DDDDDD0000DDDDDDDDDDDD
                        DDDDDDDDDDDDDDDD0000}
                      Caption = ''
                      ParentColor = False
                      Color = clWindow
                      OnClick = sbtnIncludeAllClick
                    end
                    object sbtnExclude: TUniSpeedButton
                      Left = 3
                      Top = 65
                      Width = 25
                      Height = 25
                      Hint = 'Remove Field'
                      Enabled = False
                      ShowHint = True
                      ParentShowHint = False
                      Glyph.Data = {
                        46010000424D460100000000000076000000280000001A0000000D0000000100
                        040000000000D000000000000000000000001000000010000000000000000000
                        8000008000000080800080000000800080008080000080808000C0C0C0000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                        8888888888888800000088888808888888888887F88888000000888880088888
                        88888877F8888800000088880608888888888787FFFFF8000000888066000008
                        888878877777F8000000880666666608888788888887F8000000806666666608
                        8878F8888887F800000088066666660888878F88FFF7F8000000888066000008
                        888878F777778800000088880608888888888787F88888000000888880088888
                        88888877F8888800000088888808888888888887888888000000888888888888
                        88888888888888000000}
                      Caption = ''
                      ParentColor = False
                      Color = clWindow
                      OnClick = sbtnExcludeClick
                    end
                    object sbtnExcludeAll: TUniSpeedButton
                      Left = 3
                      Top = 94
                      Width = 25
                      Height = 25
                      Hint = 'Remove All Fields'
                      Enabled = False
                      ShowHint = True
                      ParentShowHint = False
                      Glyph.Data = {
                        56010000424D560100000000000076000000280000001C0000000E0000000100
                        040000000000E000000000000000000000001000000010000000000000000000
                        8000008000000080800080000000800080008080000080808000C0C0C0000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                        DDDDDDDDDDDDDDDD0000DDDDDDDDDDDDDDDDDDDDDDDDDDDD0000DDDDD0DD0DDD
                        DDDDDDD7FD7FDDDD0000DDDD00D00DDDDDDDDD77F77FDDDD0000DDD060060DDD
                        DDDDD787787FFFFF0000DD06606600000DDD78878877777F0000D06606666666
                        0DD788788888887F00000660666666660D78F78F8888887F0000D06606666666
                        0DD78F78F88FFF7F0000DD06606600000DDD78F78F77777D0000DDD060060DDD
                        DDDDD787787FDDDD0000DDDD00D00DDDDDDDDD77F77FDDDD0000DDDDD0DD0DDD
                        DDDDDDD7DD7DDDDD0000DDDDDDDDDDDDDDDDDDDDDDDDDDDD0000}
                      Caption = ''
                      ParentColor = False
                      Color = clWindow
                      OnClick = sbtnExcludeAllClick
                    end
                  end
                end
                object PnlFieldSelection02: TUniPanel
                  Left = 30
                  Top = 1
                  Width = 299
                  Height = 293
                  Hint = ''
                  Align = alClient
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  TabOrder = 1
                  Caption = ''
                  object lstSelectedFields: TUniListBox
                    Left = 1
                    Top = 20
                    Width = 297
                    Height = 273
                    Hint = ''
                    Align = alClient
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    TabOrder = 0
                    MultiSelect = True
                    OnMouseDown = lstSelectedFieldsMouseDown
                  end
                  object PnlMergeFieldsSelBar: TUniPanel
                    Tag = 1999
                    Left = 1
                    Top = 1
                    Width = 297
                    Height = 20
                    Hint = ''
                    Align = alTop
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clWhite
                    TabOrder = 1
                    Caption = ''
                    Color = clBtnShadow
                    object Label20: TUniLabel
                      Left = 1
                      Top = 1
                      Width = 84
                      Height = 13
                      Hint = 
                        'Fields which you have selected to display in your merge document' +
                        '.'
                      ShowHint = True
                      ParentShowHint = False
                      Caption = 'Selected Fields'
                      Align = alTop
                      Anchors = [akLeft, akTop, akRight]
                      ParentFont = False
                      Font.Color = clWhite
                      Font.Style = [fsBold]
                      TabOrder = 1
                    end
                  end
                end
                object PnlMoveUpDownControls: TUniPanel
                  Left = 329
                  Top = 1
                  Width = 30
                  Height = 293
                  Hint = ''
                  Align = alRight
                  Anchors = [akTop, akRight, akBottom]
                  TabOrder = 2
                  Caption = ''
                  DesignSize = (
                    30
                    293)
                  object Panel9: TUniPanel
                    Left = 1
                    Top = 87
                    Width = 28
                    Height = 122
                    Hint = ''
                    Anchors = [akLeft]
                    TabOrder = 0
                    Caption = ''
                    object sbtnMoveUp: TUniSpeedButton
                      Left = 3
                      Top = 1
                      Width = 25
                      Height = 25
                      Hint = 'Move Field Up'
                      Enabled = False
                      ShowHint = True
                      ParentShowHint = False
                      Glyph.Data = {
                        46010000424D460100000000000076000000280000001A0000000D0000000100
                        040000000000D000000000000000000000001000000010000000000000000000
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
                    object sbtnMoveUpAll: TUniSpeedButton
                      Left = 3
                      Top = 30
                      Width = 25
                      Height = 25
                      Hint = 'Move Field To Top of List'
                      Enabled = False
                      ShowHint = True
                      ParentShowHint = False
                      Glyph.Data = {
                        56010000424D560100000000000076000000280000001C0000000E0000000100
                        040000000000E000000000000000000000001000000010000000000000000000
                        8000008000000080800080000000800080008080000080808000C0C0C0000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                        DDDDDDDDFFFFFDDD0000DDDDD00000DDDDDDDDD77777FDDD0000DDDDD06660DD
                        DDDDDDD7F887FDDD0000DDDDD06660DDDDDDDDD7F887FDDD0000DDDDD06660DD
                        DDDDDDD7F887FFFD0000DD00006660000DDD77778887777F0000DDD066666660
                        DDDDD78F888887FD0000DDDD0666660DDDDDDD78F8887FDD0000DD0000666000
                        0DDD77778F87777F0000DDD066060660DDDDD78F787887FD0000DDDD0660660D
                        DDDDDD78F7887FDD0000DDDDD06660DDDDDDDDD78F87FDDD0000DDDDDD060DDD
                        DDDDDDDD787FDDDD0000DDDDDDD0DDDDDDDDDDDDD7FDDDDD0000}
                      Caption = ''
                      ParentColor = False
                      Color = clWindow
                      OnClick = sbtnMoveUpAllClick
                    end
                    object sbtnMoveDown: TUniSpeedButton
                      Left = 3
                      Top = 65
                      Width = 25
                      Height = 25
                      Hint = 'Move Field Down'
                      Enabled = False
                      ShowHint = True
                      ParentShowHint = False
                      Glyph.Data = {
                        46010000424D460100000000000076000000280000001A0000000D0000000100
                        040000000000D000000000000000000000001000000010000000000000000000
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
                    object sbtnMoveDownAll: TUniSpeedButton
                      Left = 3
                      Top = 94
                      Width = 25
                      Height = 25
                      Hint = 'Move Field To Bottom of List'
                      Enabled = False
                      ShowHint = True
                      ParentShowHint = False
                      Glyph.Data = {
                        56010000424D560100000000000076000000280000001C0000000E0000000100
                        040000000000E000000000000000000000001000000010000000000000000000
                        8000008000000080800080000000800080008080000080808000C0C0C0000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDD0DDDD
                        DDDDDDDDD7FDDDDD0000DDDDDD060DDDDDDDDDDD787FDDDD0000DDDDD06660DD
                        DDDDDDD78F87FDDD0000DDDD0660660DDDDDDD78F7887FDD0000DDD066060660
                        DDDDD78F787887FD0000DD00006660000DDD77778F87777F0000DDDD0666660D
                        DDDDDD78F8887FDD0000DDD066666660DDDDD78F888887FD0000DD0000666000
                        0DDD77778887777F0000DDDDD06660DDDDDDDDD7F887FDDD0000DDDDD06660DD
                        DDDDDDD7F887FDDD0000DDDDD06660DDDDDDDDD7F887FDDD0000DDDDD00000DD
                        DDDDDDD77777DDDD0000DDDDDDDDDDDDDDDDDDDDDDDDDDDD0000}
                      Caption = ''
                      ParentColor = False
                      Color = clWindow
                      OnClick = sbtnMoveDownAllClick
                    end
                  end
                end
              end
            end
            object CaptionPanel2: TIQWebCaptionPanel
              Left = 1
              Top = 1
              Width = 571
              Height = 60
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              Caption = 'Step 2 of 7:  Which fields do you want to display?'
              ParentColor = True
              Text = 
                'Select the fields you want to display in your mail merge documen' +
                't by clicking the arrow buttons.'
              PictureLayout = plImageRight
              LayoutStyle = lsBasic
              DesignSize = (
                571
                60)
            end
          end
        end
        object TabSorting: TUniTabSheet
          Hint = ''
          ImageIndex = 7
          Caption = 'Sort By'
          object PnlSortBy: TUniPanel
            Tag = 1999
            Left = 0
            Top = 0
            Width = 573
            Height = 360
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            object Bevel5: TUniPanel
              Left = 1
              Top = 60
              Width = 16
              Height = 300
              Hint = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 2
              Caption = ''
            end
            object CaptionPanel3: TIQWebCaptionPanel
              Left = 1
              Top = 1
              Width = 571
              Height = 60
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 3
              Caption = 'Step 3 of 7:  How do you want records sorted?'
              ParentColor = True
              Text = 'Choose fields to sort by.'
              PictureLayout = plImageRight
              LayoutStyle = lsBasic
              DesignSize = (
                571
                60)
            end
            object PnlSortColumns: TUniPanel
              Left = 16
              Top = 60
              Width = 557
              Height = 300
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              ExplicitLeft = -296
              ExplicitWidth = 869
              ExplicitHeight = 325
              object Label3: TUniLabel
                Left = 8
                Top = 12
                Width = 54
                Height = 13
                Hint = ''
                Caption = 'Sort Field 1'
                TabOrder = 1
              end
              object Label8: TUniLabel
                Left = 8
                Top = 36
                Width = 54
                Height = 13
                Hint = ''
                Caption = 'Sort Field 2'
                TabOrder = 2
              end
              object Label12: TUniLabel
                Left = 8
                Top = 60
                Width = 54
                Height = 13
                Hint = ''
                Caption = 'Sort Field 3'
                TabOrder = 3
              end
              object Label13: TUniLabel
                Left = 8
                Top = 84
                Width = 54
                Height = 13
                Hint = ''
                Caption = 'Sort Field 4'
                TabOrder = 4
              end
              object Label14: TUniLabel
                Left = 8
                Top = 108
                Width = 54
                Height = 13
                Hint = ''
                Caption = 'Sort Field 5'
                TabOrder = 5
              end
              object Label16: TUniLabel
                Left = 8
                Top = 132
                Width = 54
                Height = 13
                Hint = ''
                Caption = 'Sort Field 6'
                TabOrder = 6
              end
              object Label18: TUniLabel
                Left = 8
                Top = 156
                Width = 54
                Height = 13
                Hint = ''
                Caption = 'Sort Field 7'
                TabOrder = 14
              end
              object sbtnClearSortField1: TUniSpeedButton
                Left = 384
                Top = 7
                Width = 22
                Height = 22
                Hint = 'Clear sort field selection'
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  36060000424D3606000000000000360400002800000020000000100000000100
                  08000000000000020000C21E0000C21E00000001000000000000473E7D005050
                  500051515100535353005555550057575700585858005D5D5D005E5E5E005F5F
                  5F004D4E63004E486B00504D6D004E4C760049417E004E457E00606060006565
                  650066666600696969006A6A6A006B6B6B006C6C6C006E6E6E006F6F6F006363
                  7B0070707000717171007272720076767600473C800049388200533D8F004B40
                  84004C448500534F83005655810059568D005B568D0054449700554598005D54
                  93005E5294005C5A9500625E9900665B9F0062618B00636693005451A7005C4E
                  B3005F4FB4005C4FBB005D4DBC006153A100695EAE007474A4007978A2007D7E
                  A0007D7DB3007C7BBB007E7CBE005B4BC0007C72CC00FF00FF00808080008282
                  8200868686008B8B8B008C8C8C008D8D8D008E8E8E008C949B00909090009191
                  910093939300959595009696960097979700949C9B0098989800999999009B9B
                  9B009D9D9D009F9F9F009BA49A009BA69C00A1AE9E009E9FA3009F99AA008386
                  B3008184B7008F8EB000898EB5008882BD008885BC00888CBC009492B0009B9F
                  B8009EA9A1009FA0B500A0A0A000A2A2A200A3A3A300A4A4A400A5A5A500A7A7
                  A700A0ACA000A6AAAB00A9A9A900AAAAAA00ACACAC00A1A5B000B3B3B300B5B5
                  B500B7B7B700B9B9B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBF
                  BF00888AC4008487CB008C8EC8009191C100928BD400968FD800979AD7009CA2
                  CD009CA0D100A0A3C200AFBCCC00A6A7DA00B3A9D800AEB1D700B0B1D300B6B8
                  D600BABBD500B2B5DB00B2B3DF00B1B8DF0097AAE3009FB1E0009CB3E100AAAD
                  E000AAA9E700ACAEE400B1A7ED00A3B0E800B2B2E000B2B3E500B9BFE800BCBD
                  E900A3AEF200B4B5F200BBB5F600B7BBF000B9BDF000B8BCF100BBBEF100B5B7
                  F800B8B5FA00B7BCF900BDB9FF00BFC6ED00C1C1C100C4C4C400C6C6C600C7C7
                  C700C8C8C800C9C9C900CACACA00CBCBCB00C9CFCE00CECECE00CFCFCF00C3C5
                  D700CACCD400D0D0D000D2D2D200D3D3D300D4D4D400D5D5D500D6D6D600D4DB
                  D400D8D8D800D9D9D900DCDDD900DCDCDC00DDDDDD00DEDEDE00DFDFDF00C3C9
                  E600C7C8EA00C7CCEB00D2D2E000D3D2E200DCDCEA00C6C5F100C1C1F700C7C3
                  F400C2C6F700C6CAF300C5C8F400CBCAF200C8C9F500C6C6FF00CBC7F800CCC5
                  FF00D0CAFF00CED6F300D7D3F700D7D6F600D7D8F200D1DAF500D8D4FD00DADC
                  FA00DADDFC00DDDDFF00E4DCFB00DFE3F600D9E8F100DAE0FF00E0E0E000E3E3
                  E300E1E5E600E4E4E400E5E5E500E6E6E600E7E7E700E2E8EF00E9E9E900EAEA
                  EA00E0E2F400EFECFF00ECF6FF00F1F1F100F6F6F600F4FFF000F3F4FF00F8F7
                  FF00F2F8FF00F2FBFF00F3FFFC00F4FFFE00F4FEFF00F6FFFF00F8F8F800F9F9
                  F900FAFAFA00FCFCFC00FEFEFE00FFFFFF0000000000000000003F3F3F3F3F3F
                  3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3FB26F58575455
                  4E6BBC3F3F3F3F3F3F3FAF6952646567516DBD3F3F3F3F3F3F3F39373231333D
                  343660B93F3F3F3F3F3F42401A181C1C1C1D50BB3F3F3F3F3F3F2CA4958F908E
                  9A7B2F61BD3F3F3F3F3F17AD7776777279501B68BD3F3F3F3F3F38A2A39B9899
                  9C5A803063C53F3F3F3F41A9ADA7ABAAA8486C1568B83F3F3F3F882BD3C3D1D0
                  C994598D2A62C43F3F3F7314BEB5B6B6B37449A61169B73F3F3F3F2E89D8EAD4
                  E7D55D838B286AC63F3F3F1679BFE5BDE9BE496D78096CC03F3F3F8A0FF7F2EF
                  F5F4875E81962756DC3F3FA604FDFAFBFDFC744A6E77086DE33F3F3F2DD28C97
                  9192933E7C828735AE3F3F3F18BA787973737545526E7414B03F3F3F3F22D7A0
                  9EA19D9F3B5F852647E23F3F3F05E0ACABA9AAAB444F70114BE43F3F3F3F0EDE
                  CFCAC8CCCB3A7E8424B13F3F3F3F03E8B6B4AFB5B643537910AB3F3F3F3F3F00
                  DBC7CDC2C1CE5C7F255B3F3F3F3F3F02E4B3B6B3B3B64D66114C3F3F3F3F3F3F
                  0BEBD6DDD9DAA57A3C233F3F3F3F3F3F02EDBFE6E1E3B05046073F3F3F3F3F3F
                  3F0AF1F0F3F6ECDF7D0D3F3F3F3F3F3F3F03F9EEFBFCF8E652053F3F3F3F3F3F
                  3F3F190C201F211E29863F3F3F3F3F3F3F3F13040601040212713F3F3F3F3F3F
                  3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F}
                Caption = ''
                ParentColor = False
                Color = clWindow
                OnClick = sbtnClearSortField1Click
              end
              object sbtnClearSortField2: TUniSpeedButton
                Left = 384
                Top = 31
                Width = 22
                Height = 22
                Hint = 'Clear sort field selection'
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  36060000424D3606000000000000360400002800000020000000100000000100
                  08000000000000020000C21E0000C21E00000001000000000000473E7D005050
                  500051515100535353005555550057575700585858005D5D5D005E5E5E005F5F
                  5F004D4E63004E486B00504D6D004E4C760049417E004E457E00606060006565
                  650066666600696969006A6A6A006B6B6B006C6C6C006E6E6E006F6F6F006363
                  7B0070707000717171007272720076767600473C800049388200533D8F004B40
                  84004C448500534F83005655810059568D005B568D0054449700554598005D54
                  93005E5294005C5A9500625E9900665B9F0062618B00636693005451A7005C4E
                  B3005F4FB4005C4FBB005D4DBC006153A100695EAE007474A4007978A2007D7E
                  A0007D7DB3007C7BBB007E7CBE005B4BC0007C72CC00FF00FF00808080008282
                  8200868686008B8B8B008C8C8C008D8D8D008E8E8E008C949B00909090009191
                  910093939300959595009696960097979700949C9B0098989800999999009B9B
                  9B009D9D9D009F9F9F009BA49A009BA69C00A1AE9E009E9FA3009F99AA008386
                  B3008184B7008F8EB000898EB5008882BD008885BC00888CBC009492B0009B9F
                  B8009EA9A1009FA0B500A0A0A000A2A2A200A3A3A300A4A4A400A5A5A500A7A7
                  A700A0ACA000A6AAAB00A9A9A900AAAAAA00ACACAC00A1A5B000B3B3B300B5B5
                  B500B7B7B700B9B9B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBF
                  BF00888AC4008487CB008C8EC8009191C100928BD400968FD800979AD7009CA2
                  CD009CA0D100A0A3C200AFBCCC00A6A7DA00B3A9D800AEB1D700B0B1D300B6B8
                  D600BABBD500B2B5DB00B2B3DF00B1B8DF0097AAE3009FB1E0009CB3E100AAAD
                  E000AAA9E700ACAEE400B1A7ED00A3B0E800B2B2E000B2B3E500B9BFE800BCBD
                  E900A3AEF200B4B5F200BBB5F600B7BBF000B9BDF000B8BCF100BBBEF100B5B7
                  F800B8B5FA00B7BCF900BDB9FF00BFC6ED00C1C1C100C4C4C400C6C6C600C7C7
                  C700C8C8C800C9C9C900CACACA00CBCBCB00C9CFCE00CECECE00CFCFCF00C3C5
                  D700CACCD400D0D0D000D2D2D200D3D3D300D4D4D400D5D5D500D6D6D600D4DB
                  D400D8D8D800D9D9D900DCDDD900DCDCDC00DDDDDD00DEDEDE00DFDFDF00C3C9
                  E600C7C8EA00C7CCEB00D2D2E000D3D2E200DCDCEA00C6C5F100C1C1F700C7C3
                  F400C2C6F700C6CAF300C5C8F400CBCAF200C8C9F500C6C6FF00CBC7F800CCC5
                  FF00D0CAFF00CED6F300D7D3F700D7D6F600D7D8F200D1DAF500D8D4FD00DADC
                  FA00DADDFC00DDDDFF00E4DCFB00DFE3F600D9E8F100DAE0FF00E0E0E000E3E3
                  E300E1E5E600E4E4E400E5E5E500E6E6E600E7E7E700E2E8EF00E9E9E900EAEA
                  EA00E0E2F400EFECFF00ECF6FF00F1F1F100F6F6F600F4FFF000F3F4FF00F8F7
                  FF00F2F8FF00F2FBFF00F3FFFC00F4FFFE00F4FEFF00F6FFFF00F8F8F800F9F9
                  F900FAFAFA00FCFCFC00FEFEFE00FFFFFF0000000000000000003F3F3F3F3F3F
                  3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3FB26F58575455
                  4E6BBC3F3F3F3F3F3F3FAF6952646567516DBD3F3F3F3F3F3F3F39373231333D
                  343660B93F3F3F3F3F3F42401A181C1C1C1D50BB3F3F3F3F3F3F2CA4958F908E
                  9A7B2F61BD3F3F3F3F3F17AD7776777279501B68BD3F3F3F3F3F38A2A39B9899
                  9C5A803063C53F3F3F3F41A9ADA7ABAAA8486C1568B83F3F3F3F882BD3C3D1D0
                  C994598D2A62C43F3F3F7314BEB5B6B6B37449A61169B73F3F3F3F2E89D8EAD4
                  E7D55D838B286AC63F3F3F1679BFE5BDE9BE496D78096CC03F3F3F8A0FF7F2EF
                  F5F4875E81962756DC3F3FA604FDFAFBFDFC744A6E77086DE33F3F3F2DD28C97
                  9192933E7C828735AE3F3F3F18BA787973737545526E7414B03F3F3F3F22D7A0
                  9EA19D9F3B5F852647E23F3F3F05E0ACABA9AAAB444F70114BE43F3F3F3F0EDE
                  CFCAC8CCCB3A7E8424B13F3F3F3F03E8B6B4AFB5B643537910AB3F3F3F3F3F00
                  DBC7CDC2C1CE5C7F255B3F3F3F3F3F02E4B3B6B3B3B64D66114C3F3F3F3F3F3F
                  0BEBD6DDD9DAA57A3C233F3F3F3F3F3F02EDBFE6E1E3B05046073F3F3F3F3F3F
                  3F0AF1F0F3F6ECDF7D0D3F3F3F3F3F3F3F03F9EEFBFCF8E652053F3F3F3F3F3F
                  3F3F190C201F211E29863F3F3F3F3F3F3F3F13040601040212713F3F3F3F3F3F
                  3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F}
                Caption = ''
                ParentColor = False
                Color = clWindow
                OnClick = sbtnClearSortField2Click
              end
              object sbtnClearSortField3: TUniSpeedButton
                Left = 384
                Top = 55
                Width = 22
                Height = 22
                Hint = 'Clear sort field selection'
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  36060000424D3606000000000000360400002800000020000000100000000100
                  08000000000000020000C21E0000C21E00000001000000000000473E7D005050
                  500051515100535353005555550057575700585858005D5D5D005E5E5E005F5F
                  5F004D4E63004E486B00504D6D004E4C760049417E004E457E00606060006565
                  650066666600696969006A6A6A006B6B6B006C6C6C006E6E6E006F6F6F006363
                  7B0070707000717171007272720076767600473C800049388200533D8F004B40
                  84004C448500534F83005655810059568D005B568D0054449700554598005D54
                  93005E5294005C5A9500625E9900665B9F0062618B00636693005451A7005C4E
                  B3005F4FB4005C4FBB005D4DBC006153A100695EAE007474A4007978A2007D7E
                  A0007D7DB3007C7BBB007E7CBE005B4BC0007C72CC00FF00FF00808080008282
                  8200868686008B8B8B008C8C8C008D8D8D008E8E8E008C949B00909090009191
                  910093939300959595009696960097979700949C9B0098989800999999009B9B
                  9B009D9D9D009F9F9F009BA49A009BA69C00A1AE9E009E9FA3009F99AA008386
                  B3008184B7008F8EB000898EB5008882BD008885BC00888CBC009492B0009B9F
                  B8009EA9A1009FA0B500A0A0A000A2A2A200A3A3A300A4A4A400A5A5A500A7A7
                  A700A0ACA000A6AAAB00A9A9A900AAAAAA00ACACAC00A1A5B000B3B3B300B5B5
                  B500B7B7B700B9B9B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBF
                  BF00888AC4008487CB008C8EC8009191C100928BD400968FD800979AD7009CA2
                  CD009CA0D100A0A3C200AFBCCC00A6A7DA00B3A9D800AEB1D700B0B1D300B6B8
                  D600BABBD500B2B5DB00B2B3DF00B1B8DF0097AAE3009FB1E0009CB3E100AAAD
                  E000AAA9E700ACAEE400B1A7ED00A3B0E800B2B2E000B2B3E500B9BFE800BCBD
                  E900A3AEF200B4B5F200BBB5F600B7BBF000B9BDF000B8BCF100BBBEF100B5B7
                  F800B8B5FA00B7BCF900BDB9FF00BFC6ED00C1C1C100C4C4C400C6C6C600C7C7
                  C700C8C8C800C9C9C900CACACA00CBCBCB00C9CFCE00CECECE00CFCFCF00C3C5
                  D700CACCD400D0D0D000D2D2D200D3D3D300D4D4D400D5D5D500D6D6D600D4DB
                  D400D8D8D800D9D9D900DCDDD900DCDCDC00DDDDDD00DEDEDE00DFDFDF00C3C9
                  E600C7C8EA00C7CCEB00D2D2E000D3D2E200DCDCEA00C6C5F100C1C1F700C7C3
                  F400C2C6F700C6CAF300C5C8F400CBCAF200C8C9F500C6C6FF00CBC7F800CCC5
                  FF00D0CAFF00CED6F300D7D3F700D7D6F600D7D8F200D1DAF500D8D4FD00DADC
                  FA00DADDFC00DDDDFF00E4DCFB00DFE3F600D9E8F100DAE0FF00E0E0E000E3E3
                  E300E1E5E600E4E4E400E5E5E500E6E6E600E7E7E700E2E8EF00E9E9E900EAEA
                  EA00E0E2F400EFECFF00ECF6FF00F1F1F100F6F6F600F4FFF000F3F4FF00F8F7
                  FF00F2F8FF00F2FBFF00F3FFFC00F4FFFE00F4FEFF00F6FFFF00F8F8F800F9F9
                  F900FAFAFA00FCFCFC00FEFEFE00FFFFFF0000000000000000003F3F3F3F3F3F
                  3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3FB26F58575455
                  4E6BBC3F3F3F3F3F3F3FAF6952646567516DBD3F3F3F3F3F3F3F39373231333D
                  343660B93F3F3F3F3F3F42401A181C1C1C1D50BB3F3F3F3F3F3F2CA4958F908E
                  9A7B2F61BD3F3F3F3F3F17AD7776777279501B68BD3F3F3F3F3F38A2A39B9899
                  9C5A803063C53F3F3F3F41A9ADA7ABAAA8486C1568B83F3F3F3F882BD3C3D1D0
                  C994598D2A62C43F3F3F7314BEB5B6B6B37449A61169B73F3F3F3F2E89D8EAD4
                  E7D55D838B286AC63F3F3F1679BFE5BDE9BE496D78096CC03F3F3F8A0FF7F2EF
                  F5F4875E81962756DC3F3FA604FDFAFBFDFC744A6E77086DE33F3F3F2DD28C97
                  9192933E7C828735AE3F3F3F18BA787973737545526E7414B03F3F3F3F22D7A0
                  9EA19D9F3B5F852647E23F3F3F05E0ACABA9AAAB444F70114BE43F3F3F3F0EDE
                  CFCAC8CCCB3A7E8424B13F3F3F3F03E8B6B4AFB5B643537910AB3F3F3F3F3F00
                  DBC7CDC2C1CE5C7F255B3F3F3F3F3F02E4B3B6B3B3B64D66114C3F3F3F3F3F3F
                  0BEBD6DDD9DAA57A3C233F3F3F3F3F3F02EDBFE6E1E3B05046073F3F3F3F3F3F
                  3F0AF1F0F3F6ECDF7D0D3F3F3F3F3F3F3F03F9EEFBFCF8E652053F3F3F3F3F3F
                  3F3F190C201F211E29863F3F3F3F3F3F3F3F13040601040212713F3F3F3F3F3F
                  3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F}
                Caption = ''
                ParentColor = False
                Color = clWindow
                OnClick = sbtnClearSortField3Click
              end
              object sbtnClearSortField4: TUniSpeedButton
                Left = 384
                Top = 79
                Width = 22
                Height = 22
                Hint = 'Clear sort field selection'
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  36060000424D3606000000000000360400002800000020000000100000000100
                  08000000000000020000C21E0000C21E00000001000000000000473E7D005050
                  500051515100535353005555550057575700585858005D5D5D005E5E5E005F5F
                  5F004D4E63004E486B00504D6D004E4C760049417E004E457E00606060006565
                  650066666600696969006A6A6A006B6B6B006C6C6C006E6E6E006F6F6F006363
                  7B0070707000717171007272720076767600473C800049388200533D8F004B40
                  84004C448500534F83005655810059568D005B568D0054449700554598005D54
                  93005E5294005C5A9500625E9900665B9F0062618B00636693005451A7005C4E
                  B3005F4FB4005C4FBB005D4DBC006153A100695EAE007474A4007978A2007D7E
                  A0007D7DB3007C7BBB007E7CBE005B4BC0007C72CC00FF00FF00808080008282
                  8200868686008B8B8B008C8C8C008D8D8D008E8E8E008C949B00909090009191
                  910093939300959595009696960097979700949C9B0098989800999999009B9B
                  9B009D9D9D009F9F9F009BA49A009BA69C00A1AE9E009E9FA3009F99AA008386
                  B3008184B7008F8EB000898EB5008882BD008885BC00888CBC009492B0009B9F
                  B8009EA9A1009FA0B500A0A0A000A2A2A200A3A3A300A4A4A400A5A5A500A7A7
                  A700A0ACA000A6AAAB00A9A9A900AAAAAA00ACACAC00A1A5B000B3B3B300B5B5
                  B500B7B7B700B9B9B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBF
                  BF00888AC4008487CB008C8EC8009191C100928BD400968FD800979AD7009CA2
                  CD009CA0D100A0A3C200AFBCCC00A6A7DA00B3A9D800AEB1D700B0B1D300B6B8
                  D600BABBD500B2B5DB00B2B3DF00B1B8DF0097AAE3009FB1E0009CB3E100AAAD
                  E000AAA9E700ACAEE400B1A7ED00A3B0E800B2B2E000B2B3E500B9BFE800BCBD
                  E900A3AEF200B4B5F200BBB5F600B7BBF000B9BDF000B8BCF100BBBEF100B5B7
                  F800B8B5FA00B7BCF900BDB9FF00BFC6ED00C1C1C100C4C4C400C6C6C600C7C7
                  C700C8C8C800C9C9C900CACACA00CBCBCB00C9CFCE00CECECE00CFCFCF00C3C5
                  D700CACCD400D0D0D000D2D2D200D3D3D300D4D4D400D5D5D500D6D6D600D4DB
                  D400D8D8D800D9D9D900DCDDD900DCDCDC00DDDDDD00DEDEDE00DFDFDF00C3C9
                  E600C7C8EA00C7CCEB00D2D2E000D3D2E200DCDCEA00C6C5F100C1C1F700C7C3
                  F400C2C6F700C6CAF300C5C8F400CBCAF200C8C9F500C6C6FF00CBC7F800CCC5
                  FF00D0CAFF00CED6F300D7D3F700D7D6F600D7D8F200D1DAF500D8D4FD00DADC
                  FA00DADDFC00DDDDFF00E4DCFB00DFE3F600D9E8F100DAE0FF00E0E0E000E3E3
                  E300E1E5E600E4E4E400E5E5E500E6E6E600E7E7E700E2E8EF00E9E9E900EAEA
                  EA00E0E2F400EFECFF00ECF6FF00F1F1F100F6F6F600F4FFF000F3F4FF00F8F7
                  FF00F2F8FF00F2FBFF00F3FFFC00F4FFFE00F4FEFF00F6FFFF00F8F8F800F9F9
                  F900FAFAFA00FCFCFC00FEFEFE00FFFFFF0000000000000000003F3F3F3F3F3F
                  3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3FB26F58575455
                  4E6BBC3F3F3F3F3F3F3FAF6952646567516DBD3F3F3F3F3F3F3F39373231333D
                  343660B93F3F3F3F3F3F42401A181C1C1C1D50BB3F3F3F3F3F3F2CA4958F908E
                  9A7B2F61BD3F3F3F3F3F17AD7776777279501B68BD3F3F3F3F3F38A2A39B9899
                  9C5A803063C53F3F3F3F41A9ADA7ABAAA8486C1568B83F3F3F3F882BD3C3D1D0
                  C994598D2A62C43F3F3F7314BEB5B6B6B37449A61169B73F3F3F3F2E89D8EAD4
                  E7D55D838B286AC63F3F3F1679BFE5BDE9BE496D78096CC03F3F3F8A0FF7F2EF
                  F5F4875E81962756DC3F3FA604FDFAFBFDFC744A6E77086DE33F3F3F2DD28C97
                  9192933E7C828735AE3F3F3F18BA787973737545526E7414B03F3F3F3F22D7A0
                  9EA19D9F3B5F852647E23F3F3F05E0ACABA9AAAB444F70114BE43F3F3F3F0EDE
                  CFCAC8CCCB3A7E8424B13F3F3F3F03E8B6B4AFB5B643537910AB3F3F3F3F3F00
                  DBC7CDC2C1CE5C7F255B3F3F3F3F3F02E4B3B6B3B3B64D66114C3F3F3F3F3F3F
                  0BEBD6DDD9DAA57A3C233F3F3F3F3F3F02EDBFE6E1E3B05046073F3F3F3F3F3F
                  3F0AF1F0F3F6ECDF7D0D3F3F3F3F3F3F3F03F9EEFBFCF8E652053F3F3F3F3F3F
                  3F3F190C201F211E29863F3F3F3F3F3F3F3F13040601040212713F3F3F3F3F3F
                  3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F}
                Caption = ''
                ParentColor = False
                Color = clWindow
                OnClick = sbtnClearSortField4Click
              end
              object sbtnClearSortField5: TUniSpeedButton
                Left = 384
                Top = 103
                Width = 22
                Height = 22
                Hint = 'Clear sort field selection'
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  36060000424D3606000000000000360400002800000020000000100000000100
                  08000000000000020000C21E0000C21E00000001000000000000473E7D005050
                  500051515100535353005555550057575700585858005D5D5D005E5E5E005F5F
                  5F004D4E63004E486B00504D6D004E4C760049417E004E457E00606060006565
                  650066666600696969006A6A6A006B6B6B006C6C6C006E6E6E006F6F6F006363
                  7B0070707000717171007272720076767600473C800049388200533D8F004B40
                  84004C448500534F83005655810059568D005B568D0054449700554598005D54
                  93005E5294005C5A9500625E9900665B9F0062618B00636693005451A7005C4E
                  B3005F4FB4005C4FBB005D4DBC006153A100695EAE007474A4007978A2007D7E
                  A0007D7DB3007C7BBB007E7CBE005B4BC0007C72CC00FF00FF00808080008282
                  8200868686008B8B8B008C8C8C008D8D8D008E8E8E008C949B00909090009191
                  910093939300959595009696960097979700949C9B0098989800999999009B9B
                  9B009D9D9D009F9F9F009BA49A009BA69C00A1AE9E009E9FA3009F99AA008386
                  B3008184B7008F8EB000898EB5008882BD008885BC00888CBC009492B0009B9F
                  B8009EA9A1009FA0B500A0A0A000A2A2A200A3A3A300A4A4A400A5A5A500A7A7
                  A700A0ACA000A6AAAB00A9A9A900AAAAAA00ACACAC00A1A5B000B3B3B300B5B5
                  B500B7B7B700B9B9B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBF
                  BF00888AC4008487CB008C8EC8009191C100928BD400968FD800979AD7009CA2
                  CD009CA0D100A0A3C200AFBCCC00A6A7DA00B3A9D800AEB1D700B0B1D300B6B8
                  D600BABBD500B2B5DB00B2B3DF00B1B8DF0097AAE3009FB1E0009CB3E100AAAD
                  E000AAA9E700ACAEE400B1A7ED00A3B0E800B2B2E000B2B3E500B9BFE800BCBD
                  E900A3AEF200B4B5F200BBB5F600B7BBF000B9BDF000B8BCF100BBBEF100B5B7
                  F800B8B5FA00B7BCF900BDB9FF00BFC6ED00C1C1C100C4C4C400C6C6C600C7C7
                  C700C8C8C800C9C9C900CACACA00CBCBCB00C9CFCE00CECECE00CFCFCF00C3C5
                  D700CACCD400D0D0D000D2D2D200D3D3D300D4D4D400D5D5D500D6D6D600D4DB
                  D400D8D8D800D9D9D900DCDDD900DCDCDC00DDDDDD00DEDEDE00DFDFDF00C3C9
                  E600C7C8EA00C7CCEB00D2D2E000D3D2E200DCDCEA00C6C5F100C1C1F700C7C3
                  F400C2C6F700C6CAF300C5C8F400CBCAF200C8C9F500C6C6FF00CBC7F800CCC5
                  FF00D0CAFF00CED6F300D7D3F700D7D6F600D7D8F200D1DAF500D8D4FD00DADC
                  FA00DADDFC00DDDDFF00E4DCFB00DFE3F600D9E8F100DAE0FF00E0E0E000E3E3
                  E300E1E5E600E4E4E400E5E5E500E6E6E600E7E7E700E2E8EF00E9E9E900EAEA
                  EA00E0E2F400EFECFF00ECF6FF00F1F1F100F6F6F600F4FFF000F3F4FF00F8F7
                  FF00F2F8FF00F2FBFF00F3FFFC00F4FFFE00F4FEFF00F6FFFF00F8F8F800F9F9
                  F900FAFAFA00FCFCFC00FEFEFE00FFFFFF0000000000000000003F3F3F3F3F3F
                  3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3FB26F58575455
                  4E6BBC3F3F3F3F3F3F3FAF6952646567516DBD3F3F3F3F3F3F3F39373231333D
                  343660B93F3F3F3F3F3F42401A181C1C1C1D50BB3F3F3F3F3F3F2CA4958F908E
                  9A7B2F61BD3F3F3F3F3F17AD7776777279501B68BD3F3F3F3F3F38A2A39B9899
                  9C5A803063C53F3F3F3F41A9ADA7ABAAA8486C1568B83F3F3F3F882BD3C3D1D0
                  C994598D2A62C43F3F3F7314BEB5B6B6B37449A61169B73F3F3F3F2E89D8EAD4
                  E7D55D838B286AC63F3F3F1679BFE5BDE9BE496D78096CC03F3F3F8A0FF7F2EF
                  F5F4875E81962756DC3F3FA604FDFAFBFDFC744A6E77086DE33F3F3F2DD28C97
                  9192933E7C828735AE3F3F3F18BA787973737545526E7414B03F3F3F3F22D7A0
                  9EA19D9F3B5F852647E23F3F3F05E0ACABA9AAAB444F70114BE43F3F3F3F0EDE
                  CFCAC8CCCB3A7E8424B13F3F3F3F03E8B6B4AFB5B643537910AB3F3F3F3F3F00
                  DBC7CDC2C1CE5C7F255B3F3F3F3F3F02E4B3B6B3B3B64D66114C3F3F3F3F3F3F
                  0BEBD6DDD9DAA57A3C233F3F3F3F3F3F02EDBFE6E1E3B05046073F3F3F3F3F3F
                  3F0AF1F0F3F6ECDF7D0D3F3F3F3F3F3F3F03F9EEFBFCF8E652053F3F3F3F3F3F
                  3F3F190C201F211E29863F3F3F3F3F3F3F3F13040601040212713F3F3F3F3F3F
                  3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F}
                Caption = ''
                ParentColor = False
                Color = clWindow
                OnClick = sbtnClearSortField5Click
              end
              object sbtnClearSortField6: TUniSpeedButton
                Left = 384
                Top = 127
                Width = 22
                Height = 22
                Hint = 'Clear sort field selection'
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  36060000424D3606000000000000360400002800000020000000100000000100
                  08000000000000020000C21E0000C21E00000001000000000000473E7D005050
                  500051515100535353005555550057575700585858005D5D5D005E5E5E005F5F
                  5F004D4E63004E486B00504D6D004E4C760049417E004E457E00606060006565
                  650066666600696969006A6A6A006B6B6B006C6C6C006E6E6E006F6F6F006363
                  7B0070707000717171007272720076767600473C800049388200533D8F004B40
                  84004C448500534F83005655810059568D005B568D0054449700554598005D54
                  93005E5294005C5A9500625E9900665B9F0062618B00636693005451A7005C4E
                  B3005F4FB4005C4FBB005D4DBC006153A100695EAE007474A4007978A2007D7E
                  A0007D7DB3007C7BBB007E7CBE005B4BC0007C72CC00FF00FF00808080008282
                  8200868686008B8B8B008C8C8C008D8D8D008E8E8E008C949B00909090009191
                  910093939300959595009696960097979700949C9B0098989800999999009B9B
                  9B009D9D9D009F9F9F009BA49A009BA69C00A1AE9E009E9FA3009F99AA008386
                  B3008184B7008F8EB000898EB5008882BD008885BC00888CBC009492B0009B9F
                  B8009EA9A1009FA0B500A0A0A000A2A2A200A3A3A300A4A4A400A5A5A500A7A7
                  A700A0ACA000A6AAAB00A9A9A900AAAAAA00ACACAC00A1A5B000B3B3B300B5B5
                  B500B7B7B700B9B9B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBF
                  BF00888AC4008487CB008C8EC8009191C100928BD400968FD800979AD7009CA2
                  CD009CA0D100A0A3C200AFBCCC00A6A7DA00B3A9D800AEB1D700B0B1D300B6B8
                  D600BABBD500B2B5DB00B2B3DF00B1B8DF0097AAE3009FB1E0009CB3E100AAAD
                  E000AAA9E700ACAEE400B1A7ED00A3B0E800B2B2E000B2B3E500B9BFE800BCBD
                  E900A3AEF200B4B5F200BBB5F600B7BBF000B9BDF000B8BCF100BBBEF100B5B7
                  F800B8B5FA00B7BCF900BDB9FF00BFC6ED00C1C1C100C4C4C400C6C6C600C7C7
                  C700C8C8C800C9C9C900CACACA00CBCBCB00C9CFCE00CECECE00CFCFCF00C3C5
                  D700CACCD400D0D0D000D2D2D200D3D3D300D4D4D400D5D5D500D6D6D600D4DB
                  D400D8D8D800D9D9D900DCDDD900DCDCDC00DDDDDD00DEDEDE00DFDFDF00C3C9
                  E600C7C8EA00C7CCEB00D2D2E000D3D2E200DCDCEA00C6C5F100C1C1F700C7C3
                  F400C2C6F700C6CAF300C5C8F400CBCAF200C8C9F500C6C6FF00CBC7F800CCC5
                  FF00D0CAFF00CED6F300D7D3F700D7D6F600D7D8F200D1DAF500D8D4FD00DADC
                  FA00DADDFC00DDDDFF00E4DCFB00DFE3F600D9E8F100DAE0FF00E0E0E000E3E3
                  E300E1E5E600E4E4E400E5E5E500E6E6E600E7E7E700E2E8EF00E9E9E900EAEA
                  EA00E0E2F400EFECFF00ECF6FF00F1F1F100F6F6F600F4FFF000F3F4FF00F8F7
                  FF00F2F8FF00F2FBFF00F3FFFC00F4FFFE00F4FEFF00F6FFFF00F8F8F800F9F9
                  F900FAFAFA00FCFCFC00FEFEFE00FFFFFF0000000000000000003F3F3F3F3F3F
                  3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3FB26F58575455
                  4E6BBC3F3F3F3F3F3F3FAF6952646567516DBD3F3F3F3F3F3F3F39373231333D
                  343660B93F3F3F3F3F3F42401A181C1C1C1D50BB3F3F3F3F3F3F2CA4958F908E
                  9A7B2F61BD3F3F3F3F3F17AD7776777279501B68BD3F3F3F3F3F38A2A39B9899
                  9C5A803063C53F3F3F3F41A9ADA7ABAAA8486C1568B83F3F3F3F882BD3C3D1D0
                  C994598D2A62C43F3F3F7314BEB5B6B6B37449A61169B73F3F3F3F2E89D8EAD4
                  E7D55D838B286AC63F3F3F1679BFE5BDE9BE496D78096CC03F3F3F8A0FF7F2EF
                  F5F4875E81962756DC3F3FA604FDFAFBFDFC744A6E77086DE33F3F3F2DD28C97
                  9192933E7C828735AE3F3F3F18BA787973737545526E7414B03F3F3F3F22D7A0
                  9EA19D9F3B5F852647E23F3F3F05E0ACABA9AAAB444F70114BE43F3F3F3F0EDE
                  CFCAC8CCCB3A7E8424B13F3F3F3F03E8B6B4AFB5B643537910AB3F3F3F3F3F00
                  DBC7CDC2C1CE5C7F255B3F3F3F3F3F02E4B3B6B3B3B64D66114C3F3F3F3F3F3F
                  0BEBD6DDD9DAA57A3C233F3F3F3F3F3F02EDBFE6E1E3B05046073F3F3F3F3F3F
                  3F0AF1F0F3F6ECDF7D0D3F3F3F3F3F3F3F03F9EEFBFCF8E652053F3F3F3F3F3F
                  3F3F190C201F211E29863F3F3F3F3F3F3F3F13040601040212713F3F3F3F3F3F
                  3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F}
                Caption = ''
                ParentColor = False
                Color = clWindow
                OnClick = sbtnClearSortField6Click
              end
              object sbtnClearSortField7: TUniSpeedButton
                Left = 384
                Top = 151
                Width = 22
                Height = 22
                Hint = 'Clear sort field selection'
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  36060000424D3606000000000000360400002800000020000000100000000100
                  08000000000000020000C21E0000C21E00000001000000000000473E7D005050
                  500051515100535353005555550057575700585858005D5D5D005E5E5E005F5F
                  5F004D4E63004E486B00504D6D004E4C760049417E004E457E00606060006565
                  650066666600696969006A6A6A006B6B6B006C6C6C006E6E6E006F6F6F006363
                  7B0070707000717171007272720076767600473C800049388200533D8F004B40
                  84004C448500534F83005655810059568D005B568D0054449700554598005D54
                  93005E5294005C5A9500625E9900665B9F0062618B00636693005451A7005C4E
                  B3005F4FB4005C4FBB005D4DBC006153A100695EAE007474A4007978A2007D7E
                  A0007D7DB3007C7BBB007E7CBE005B4BC0007C72CC00FF00FF00808080008282
                  8200868686008B8B8B008C8C8C008D8D8D008E8E8E008C949B00909090009191
                  910093939300959595009696960097979700949C9B0098989800999999009B9B
                  9B009D9D9D009F9F9F009BA49A009BA69C00A1AE9E009E9FA3009F99AA008386
                  B3008184B7008F8EB000898EB5008882BD008885BC00888CBC009492B0009B9F
                  B8009EA9A1009FA0B500A0A0A000A2A2A200A3A3A300A4A4A400A5A5A500A7A7
                  A700A0ACA000A6AAAB00A9A9A900AAAAAA00ACACAC00A1A5B000B3B3B300B5B5
                  B500B7B7B700B9B9B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBF
                  BF00888AC4008487CB008C8EC8009191C100928BD400968FD800979AD7009CA2
                  CD009CA0D100A0A3C200AFBCCC00A6A7DA00B3A9D800AEB1D700B0B1D300B6B8
                  D600BABBD500B2B5DB00B2B3DF00B1B8DF0097AAE3009FB1E0009CB3E100AAAD
                  E000AAA9E700ACAEE400B1A7ED00A3B0E800B2B2E000B2B3E500B9BFE800BCBD
                  E900A3AEF200B4B5F200BBB5F600B7BBF000B9BDF000B8BCF100BBBEF100B5B7
                  F800B8B5FA00B7BCF900BDB9FF00BFC6ED00C1C1C100C4C4C400C6C6C600C7C7
                  C700C8C8C800C9C9C900CACACA00CBCBCB00C9CFCE00CECECE00CFCFCF00C3C5
                  D700CACCD400D0D0D000D2D2D200D3D3D300D4D4D400D5D5D500D6D6D600D4DB
                  D400D8D8D800D9D9D900DCDDD900DCDCDC00DDDDDD00DEDEDE00DFDFDF00C3C9
                  E600C7C8EA00C7CCEB00D2D2E000D3D2E200DCDCEA00C6C5F100C1C1F700C7C3
                  F400C2C6F700C6CAF300C5C8F400CBCAF200C8C9F500C6C6FF00CBC7F800CCC5
                  FF00D0CAFF00CED6F300D7D3F700D7D6F600D7D8F200D1DAF500D8D4FD00DADC
                  FA00DADDFC00DDDDFF00E4DCFB00DFE3F600D9E8F100DAE0FF00E0E0E000E3E3
                  E300E1E5E600E4E4E400E5E5E500E6E6E600E7E7E700E2E8EF00E9E9E900EAEA
                  EA00E0E2F400EFECFF00ECF6FF00F1F1F100F6F6F600F4FFF000F3F4FF00F8F7
                  FF00F2F8FF00F2FBFF00F3FFFC00F4FFFE00F4FEFF00F6FFFF00F8F8F800F9F9
                  F900FAFAFA00FCFCFC00FEFEFE00FFFFFF0000000000000000003F3F3F3F3F3F
                  3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3FB26F58575455
                  4E6BBC3F3F3F3F3F3F3FAF6952646567516DBD3F3F3F3F3F3F3F39373231333D
                  343660B93F3F3F3F3F3F42401A181C1C1C1D50BB3F3F3F3F3F3F2CA4958F908E
                  9A7B2F61BD3F3F3F3F3F17AD7776777279501B68BD3F3F3F3F3F38A2A39B9899
                  9C5A803063C53F3F3F3F41A9ADA7ABAAA8486C1568B83F3F3F3F882BD3C3D1D0
                  C994598D2A62C43F3F3F7314BEB5B6B6B37449A61169B73F3F3F3F2E89D8EAD4
                  E7D55D838B286AC63F3F3F1679BFE5BDE9BE496D78096CC03F3F3F8A0FF7F2EF
                  F5F4875E81962756DC3F3FA604FDFAFBFDFC744A6E77086DE33F3F3F2DD28C97
                  9192933E7C828735AE3F3F3F18BA787973737545526E7414B03F3F3F3F22D7A0
                  9EA19D9F3B5F852647E23F3F3F05E0ACABA9AAAB444F70114BE43F3F3F3F0EDE
                  CFCAC8CCCB3A7E8424B13F3F3F3F03E8B6B4AFB5B643537910AB3F3F3F3F3F00
                  DBC7CDC2C1CE5C7F255B3F3F3F3F3F02E4B3B6B3B3B64D66114C3F3F3F3F3F3F
                  0BEBD6DDD9DAA57A3C233F3F3F3F3F3F02EDBFE6E1E3B05046073F3F3F3F3F3F
                  3F0AF1F0F3F6ECDF7D0D3F3F3F3F3F3F3F03F9EEFBFCF8E652053F3F3F3F3F3F
                  3F3F190C201F211E29863F3F3F3F3F3F3F3F13040601040212713F3F3F3F3F3F
                  3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F}
                Caption = ''
                ParentColor = False
                Color = clWindow
                OnClick = sbtnClearSortField7Click
              end
              object cmbSortType1: TUniComboBox
                Left = 273
                Top = 6
                Width = 105
                Height = 21
                Hint = ''
                Style = csDropDownList
                Text = ''
                Items.Strings = (
                  'Ascending'
                  'Descending')
                TabOrder = 22
              end
              object cmbSortType2: TUniComboBox
                Left = 272
                Top = 32
                Width = 105
                Height = 21
                Hint = ''
                Style = csDropDownList
                Text = ''
                Items.Strings = (
                  'Ascending'
                  'Descending')
                TabOrder = 23
              end
              object cmbSortType3: TUniComboBox
                Left = 272
                Top = 56
                Width = 105
                Height = 21
                Hint = ''
                Style = csDropDownList
                Text = ''
                Items.Strings = (
                  'Ascending'
                  'Descending')
                TabOrder = 24
              end
              object cmbSortType4: TUniComboBox
                Left = 272
                Top = 80
                Width = 105
                Height = 21
                Hint = ''
                Style = csDropDownList
                Text = ''
                Items.Strings = (
                  'Ascending'
                  'Descending')
                TabOrder = 25
              end
              object cmbSortType5: TUniComboBox
                Left = 272
                Top = 104
                Width = 105
                Height = 21
                Hint = ''
                Style = csDropDownList
                Text = ''
                Items.Strings = (
                  'Ascending'
                  'Descending')
                TabOrder = 26
              end
              object cmbSortType6: TUniComboBox
                Left = 272
                Top = 128
                Width = 105
                Height = 21
                Hint = ''
                Style = csDropDownList
                Text = ''
                Items.Strings = (
                  'Ascending'
                  'Descending')
                TabOrder = 27
              end
              object cmbSortType7: TUniComboBox
                Left = 272
                Top = 152
                Width = 105
                Height = 21
                Hint = ''
                Style = csDropDownList
                Text = ''
                Items.Strings = (
                  'Ascending'
                  'Descending')
                TabOrder = 28
              end
              object cmbSortFields1: TUniComboBox
                Left = 80
                Top = 8
                Width = 185
                Height = 21
                Hint = ''
                Style = csDropDownList
                Text = ''
                TabOrder = 7
                OnCloseUp = cmbSortFields1CloseUp
                OnChange = DoSortByFieldChange
              end
              object cmbSortFields2: TUniComboBox
                Left = 80
                Top = 32
                Width = 185
                Height = 21
                Hint = ''
                Style = csDropDownList
                Text = ''
                TabOrder = 8
                OnCloseUp = cmbSortFields2CloseUp
                OnChange = DoSortByFieldChange
              end
              object cmbSortFields3: TUniComboBox
                Left = 80
                Top = 56
                Width = 185
                Height = 21
                Hint = ''
                Style = csDropDownList
                Text = ''
                TabOrder = 9
                OnCloseUp = cmbSortFields3CloseUp
                OnChange = DoSortByFieldChange
              end
              object cmbSortFields4: TUniComboBox
                Left = 80
                Top = 80
                Width = 185
                Height = 21
                Hint = ''
                Style = csDropDownList
                Text = ''
                TabOrder = 10
                OnCloseUp = cmbSortFields4CloseUp
                OnChange = DoSortByFieldChange
              end
              object cmbSortFields5: TUniComboBox
                Left = 80
                Top = 104
                Width = 185
                Height = 21
                Hint = ''
                Style = csDropDownList
                Text = ''
                TabOrder = 11
                OnCloseUp = cmbSortFields5CloseUp
                OnChange = DoSortByFieldChange
              end
              object cmbSortFields6: TUniComboBox
                Left = 80
                Top = 128
                Width = 185
                Height = 21
                Hint = ''
                Style = csDropDownList
                Text = ''
                TabOrder = 12
                OnCloseUp = cmbSortFields6CloseUp
                OnChange = DoSortByFieldChange
              end
              object cmbSortFields7: TUniComboBox
                Left = 80
                Top = 152
                Width = 185
                Height = 21
                Hint = ''
                Style = csDropDownList
                Text = ''
                TabOrder = 13
                OnCloseUp = cmbSortFields7CloseUp
                OnChange = DoSortByFieldChange
              end
            end
          end
        end
        object TabCriteria: TUniTabSheet
          Hint = ''
          ImageIndex = 2
          Caption = 'Filtering'
          object PnlSelectionCriteria: TUniPanel
            Tag = 1999
            Left = 0
            Top = 0
            Width = 573
            Height = 360
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = 'PnlSelectionCriteria'
            object PnlGridSelectionCriteria: TUniPanel
              Left = 1
              Top = 60
              Width = 571
              Height = 300
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
              Caption = ''
              object Bevel6: TUniPanel
                Left = 1
                Top = 27
                Width = 569
                Height = 3
                Hint = ''
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 3
                Caption = ''
              end
              object PnlSelectionCriteriaGrid: TUniPanel
                Left = 1
                Top = 30
                Width = 569
                Height = 270
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 0
                Caption = 'PnlSelectionCriteriaGrid'
                object GridSelectionCriteria: TIQUniGridControl
                  Left = 1
                  Top = 1
                  Width = 567
                  Height = 268
                  Layout = 'border'
                  ParentAlignmentControl = False
                  AlignmentControl = uniAlignmentClient
                  Align = alClient
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  TabOrder = 0
                  IQComponents.Grid.Left = 0
                  IQComponents.Grid.Top = 29
                  IQComponents.Grid.Width = 350
                  IQComponents.Grid.Height = 182
                  IQComponents.Grid.Hint = ''
                  IQComponents.Grid.DataSource = CRMWORD_DM.SrcCRMWordCriteria
                  IQComponents.Grid.LoadMask.Message = 'Loading data...'
                  IQComponents.Grid.Align = alClient
                  IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
                  IQComponents.Grid.TabOrder = 0
                  IQComponents.Navigator.Left = 410
                  IQComponents.Navigator.Top = 0
                  IQComponents.Navigator.Width = 241
                  IQComponents.Navigator.Height = 25
                  IQComponents.Navigator.Hint = ''
                  IQComponents.Navigator.Visible = False
                  IQComponents.Navigator.ShowHint = True
                  IQComponents.Navigator.DataSource = CRMWORD_DM.SrcCRMWordCriteria
                  IQComponents.Navigator.LayoutConfig.Region = 'east'
                  IQComponents.Navigator.TabOrder = 3
                  IQComponents.HiddenPanel.Left = 350
                  IQComponents.HiddenPanel.Top = 29
                  IQComponents.HiddenPanel.Width = 209
                  IQComponents.HiddenPanel.Height = 182
                  IQComponents.HiddenPanel.Hint = ''
                  IQComponents.HiddenPanel.Visible = True
                  IQComponents.HiddenPanel.Align = alRight
                  IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
                  IQComponents.FormTab.Hint = ''
                  IQComponents.FormTab.TabVisible = False
                  IQComponents.FormTab.ImageIndex = 1
                  IQComponents.FormTab.Caption = 'Form'
                  IQComponents.FormTab.Layout = 'border'
                  DataSource = CRMWORD_DM.SrcCRMWordCriteria
                  Columns = <
                    item
                      FieldName = 'SEQ'
                      Title.Caption = '#'
                      Width = 14
                      CheckBoxField.FieldValues = 'true;false'
                    end
                    item
                      FieldName = 'COL_NAME'
                      Title.Caption = 'Column'
                      Width = 105
                      Editor = GridSelectionCriteria.cmbColumn
                      CheckBoxField.FieldValues = 'true;false'
                    end
                    item
                      FieldName = 'DESCRIP'
                      Title.Caption = 'Label'
                      Width = 119
                      CheckBoxField.FieldValues = 'true;false'
                    end
                    item
                      FieldName = 'RANGE_START'
                      Title.Caption = 'From'
                      Width = 91
                      CheckBoxField.FieldValues = 'true;false'
                    end
                    item
                      FieldName = 'UNARY_OPERATOR'
                      Title.Caption = '=?'
                      Width = 28
                      Editor = GridSelectionCriteria.cmbUniaryOperator
                      CheckBoxField.FieldValues = 'true;false'
                    end
                    item
                      FieldName = 'RANGE_END'
                      Title.Caption = 'To'
                      Width = 98
                      CheckBoxField.FieldValues = 'true;false'
                    end
                    item
                      FieldName = 'BINARY_OPERATOR'
                      Title.Caption = 'And/Or'
                      Width = 49
                      Editor = GridSelectionCriteria.cmbBinaryOperator
                      CheckBoxField.FieldValues = 'true;false'
                    end
                    item
                      FieldName = 'INCLUDE_NULLS'
                      Title.Caption = 'Include Empty ~Values?'
                      Width = 98
                      CheckBoxField.FieldValues = 'Y;N'
                    end>
                  ExplicitLeft = -1
                  IQControlCount = 3
                  IQParents = (
                    'cmbColumn=GridEditorsPanel'
                    'cmbBinaryOperator=GridEditorsPanel'
                    'cmbUniaryOperator=GridEditorsPanel')
                  Marker = 0
                  object cmbUniaryOperator: TUniComboBox
                    Left = 8
                    Top = 56
                    Width = 145
                    Hint = ''
                    Style = csDropDownList
                    Text = '='
                    Items.Strings = (
                      '='
                      '<'
                      '>'
                      '<>')
                    ItemIndex = 0
                    TabOrder = 3
                  end
                  object cmbBinaryOperator: TUniComboBox
                    Left = 8
                    Top = 32
                    Width = 145
                    Hint = ''
                    Style = csDropDownList
                    Text = 'AND'
                    Items.Strings = (
                      'AND'
                      'OR')
                    ItemIndex = 0
                    TabOrder = 2
                  end
                  object cmbColumn: TUniComboBox
                    Left = 8
                    Top = 8
                    Width = 145
                    Hint = ''
                    Style = csDropDownList
                    Text = ''
                    TabOrder = 1
                    OnCloseUp = GridSelectionCriteriacmbColumnCloseUp
                  end
                end
              end
              object PnlSelectionCriteriaToolbar: TUniPanel
                Left = 1
                Top = 1
                Width = 569
                Height = 27
                Hint = ''
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
                Caption = ''
                object sbtnClear: TUniSpeedButton
                  Left = 1
                  Top = 1
                  Width = 25
                  Height = 25
                  Hint = 'Clear "To" and "From" Values'
                  ShowHint = True
                  ParentShowHint = False
                  Glyph.Data = {
                    36060000424D3606000000000000360400002800000020000000100000000100
                    08000000000000020000C21E0000C21E00000001000000000000473E7D005050
                    500051515100535353005555550057575700585858005D5D5D005E5E5E005F5F
                    5F004D4E63004E486B00504D6D004E4C760049417E004E457E00606060006565
                    650066666600696969006A6A6A006B6B6B006C6C6C006E6E6E006F6F6F006363
                    7B0070707000717171007272720076767600473C800049388200533D8F004B40
                    84004C448500534F83005655810059568D005B568D0054449700554598005D54
                    93005E5294005C5A9500625E9900665B9F0062618B00636693005451A7005C4E
                    B3005F4FB4005C4FBB005D4DBC006153A100695EAE007474A4007978A2007D7E
                    A0007D7DB3007C7BBB007E7CBE005B4BC0007C72CC00FF00FF00808080008282
                    8200868686008B8B8B008C8C8C008D8D8D008E8E8E008C949B00909090009191
                    910093939300959595009696960097979700949C9B0098989800999999009B9B
                    9B009D9D9D009F9F9F009BA49A009BA69C00A1AE9E009E9FA3009F99AA008386
                    B3008184B7008F8EB000898EB5008882BD008885BC00888CBC009492B0009B9F
                    B8009EA9A1009FA0B500A0A0A000A2A2A200A3A3A300A4A4A400A5A5A500A7A7
                    A700A0ACA000A6AAAB00A9A9A900AAAAAA00ACACAC00A1A5B000B3B3B300B5B5
                    B500B7B7B700B9B9B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBF
                    BF00888AC4008487CB008C8EC8009191C100928BD400968FD800979AD7009CA2
                    CD009CA0D100A0A3C200AFBCCC00A6A7DA00B3A9D800AEB1D700B0B1D300B6B8
                    D600BABBD500B2B5DB00B2B3DF00B1B8DF0097AAE3009FB1E0009CB3E100AAAD
                    E000AAA9E700ACAEE400B1A7ED00A3B0E800B2B2E000B2B3E500B9BFE800BCBD
                    E900A3AEF200B4B5F200BBB5F600B7BBF000B9BDF000B8BCF100BBBEF100B5B7
                    F800B8B5FA00B7BCF900BDB9FF00BFC6ED00C1C1C100C4C4C400C6C6C600C7C7
                    C700C8C8C800C9C9C900CACACA00CBCBCB00C9CFCE00CECECE00CFCFCF00C3C5
                    D700CACCD400D0D0D000D2D2D200D3D3D300D4D4D400D5D5D500D6D6D600D4DB
                    D400D8D8D800D9D9D900DCDDD900DCDCDC00DDDDDD00DEDEDE00DFDFDF00C3C9
                    E600C7C8EA00C7CCEB00D2D2E000D3D2E200DCDCEA00C6C5F100C1C1F700C7C3
                    F400C2C6F700C6CAF300C5C8F400CBCAF200C8C9F500C6C6FF00CBC7F800CCC5
                    FF00D0CAFF00CED6F300D7D3F700D7D6F600D7D8F200D1DAF500D8D4FD00DADC
                    FA00DADDFC00DDDDFF00E4DCFB00DFE3F600D9E8F100DAE0FF00E0E0E000E3E3
                    E300E1E5E600E4E4E400E5E5E500E6E6E600E7E7E700E2E8EF00E9E9E900EAEA
                    EA00E0E2F400EFECFF00ECF6FF00F1F1F100F6F6F600F4FFF000F3F4FF00F8F7
                    FF00F2F8FF00F2FBFF00F3FFFC00F4FFFE00F4FEFF00F6FFFF00F8F8F800F9F9
                    F900FAFAFA00FCFCFC00FEFEFE00FFFFFF0000000000000000003F3F3F3F3F3F
                    3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3FB26F58575455
                    4E6BBC3F3F3F3F3F3F3FAF6952646567516DBD3F3F3F3F3F3F3F39373231333D
                    343660B93F3F3F3F3F3F42401A181C1C1C1D50BB3F3F3F3F3F3F2CA4958F908E
                    9A7B2F61BD3F3F3F3F3F17AD7776777279501B68BD3F3F3F3F3F38A2A39B9899
                    9C5A803063C53F3F3F3F41A9ADA7ABAAA8486C1568B83F3F3F3F882BD3C3D1D0
                    C994598D2A62C43F3F3F7314BEB5B6B6B37449A61169B73F3F3F3F2E89D8EAD4
                    E7D55D838B286AC63F3F3F1679BFE5BDE9BE496D78096CC03F3F3F8A0FF7F2EF
                    F5F4875E81962756DC3F3FA604FDFAFBFDFC744A6E77086DE33F3F3F2DD28C97
                    9192933E7C828735AE3F3F3F18BA787973737545526E7414B03F3F3F3F22D7A0
                    9EA19D9F3B5F852647E23F3F3F05E0ACABA9AAAB444F70114BE43F3F3F3F0EDE
                    CFCAC8CCCB3A7E8424B13F3F3F3F03E8B6B4AFB5B643537910AB3F3F3F3F3F00
                    DBC7CDC2C1CE5C7F255B3F3F3F3F3F02E4B3B6B3B3B64D66114C3F3F3F3F3F3F
                    0BEBD6DDD9DAA57A3C233F3F3F3F3F3F02EDBFE6E1E3B05046073F3F3F3F3F3F
                    3F0AF1F0F3F6ECDF7D0D3F3F3F3F3F3F3F03F9EEFBFCF8E652053F3F3F3F3F3F
                    3F3F190C201F211E29863F3F3F3F3F3F3F3F13040601040212713F3F3F3F3F3F
                    3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F}
                  Caption = ''
                  ParentColor = False
                  Color = clWindow
                  OnClick = sbtnClearClick
                end
                object sbtnPreview: TUniSpeedButton
                  Left = 26
                  Top = 1
                  Width = 25
                  Height = 25
                  Hint = 'Preview Dataset'
                  ShowHint = True
                  ParentShowHint = False
                  Glyph.Data = {
                    36060000424D3606000000000000360400002800000020000000100000000100
                    08000000000000020000610F0000610F00000001000000000000252525002A2A
                    2A002D2D2D003333330060200000602800007028000070301000704020006046
                    320063493500684E3A004040400045454500484848004D4D4D004F4F4F005757
                    57005A5A5A005F5F5F0067676700696969006F6F6F0070707000777777007979
                    79007D7D7D007F7F7F008048200080503000CC643000D26C3800E27239008058
                    4000905840009060400090685000A0685000A0705000A0786000B0786000E37B
                    4700A0806000B0806000B0807000B0887000B0907000E5855500E68C6000E68F
                    6300E7946B00E8997100E89C7700E9A27E00F8A67C00FF00FF00818181008787
                    87008D8D8D008E8E8E008F8F8F00919191009595950097979700999999009A9A
                    9A009D9D9D009E9E9E00B0908000B8A39400A0A0A000A2A2A200A7A7A700A8A8
                    A800A9A9A900AAAAAA00ABABAB00ACACAC00B0B0B000B5B5B500B6B6B600B7B7
                    B700B9B9B900BABABA00BBBBBB00BEBEBE00BFBFBF00C0908000C0988000D098
                    8000D0A08000C0A09000D0A89000E9A28100EAA88900EAA98900EAAA8B00EAAA
                    8C00EBAC8D00F9AB8300FAB08B00FBB69200FCBB9800FEBF9D00CCB6A700D3BC
                    AF00E0B8A000E1BBA200D6C0B300D8C4B900DAC8BD00FFC3A200E0C8B000E6CC
                    BB00F0C0B000F0C8B000F0D0B000C1C1C100C2C2C200C4C4C400C5C5C500C7C7
                    C700CACACA00CBCBCB00CDCDCD00CECECE00DBCAC000D0D0D000D7D7D700D9D9
                    D900E0D0C000F0D0C000E0D8D000F0D8D000FAF3EB00FBF5EF00F0F0F000F2F2
                    F200F5F5F500F6F6F600F7F7F700FBF6F100FBF8F300FFF8F000FBF9F400FBF9
                    F500FBFAF600FBFAF700FCFBF700F8F8F800F9F9F900FAFAFA00FBFBFB00FCFC
                    F900FCFDFA00FCFDFB00FCFCFC00FDFDFD00FCFEFC00FEFEFE00FFFFFF000000
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
                    0000000000000000000000000000000000000000000000000000373737373726
                    0707070637060504040437373737371603030302370201000000373737373727
                    85A0742537236A825A0437373737371881A07C153713517D430037373737372B
                    83A0742637257084590837373737371B7FA07C1637157880400C373737373758
                    2C2D27270725582A242137373737373F3839181803153F1A1411373737373737
                    44A0742307238F721D373737373737373CA07C1303138C751037373737373737
                    58A074281C23A0731D373737373737373FA07C190E13A0791037373737373737
                    5B582B57262D58272437373737373737463F1B3D16393F18143745090A0A0A0A
                    715B8457575888236B37470D0E0E0E0E7B46803D3D3F88135237689B99928E87
                    865CA05C375CA02237374F9D9C97958A8948A0483748A0123737689E7E6E9369
                    6C582E2D37582E2D37374F9F7A799754563F3A39373F3A393737689E9E9E9A94
                    908D0B373737373737374F9F9F9F9D98968B0F37373737373737689E7E7E9E6D
                    6D910B373737373737374F9F7A7A9F7777960F37373737373737689E9E9E9E9E
                    9B990B373737373737374F9F9F9F9F9F9D9C0F3737373737373762615F353331
                    2F291E373737373737374D4B4A47413D391B1537373737373737626F67666564
                    63361F373737373737374D765553504E4C4817373737373737376260605E5D34
                    323020373737373737374D4B4B4947423E3B1837373737373737}
                  Caption = ''
                  ParentColor = False
                  Color = clWindow
                  OnClick = sbtnPreviewClick
                end
                object NavSelectionCriteria: TUniDBNavigator
                  Left = 344
                  Top = 1
                  Width = 225
                  Height = 25
                  Hint = ''
                  ShowHint = True
                  ParentShowHint = False
                  DataSource = CRMWORD_DM.SrcCRMWordCriteria
                  VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
                  Align = alRight
                  Anchors = [akTop, akRight, akBottom]
                  TabOrder = 0
                end
              end
            end
            object CaptionPanel4: TIQWebCaptionPanel
              Left = 1
              Top = 1
              Width = 571
              Height = 60
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              Caption = 'Step 4 of 7:  How do you want the data filtered?'
              ParentColor = True
              Text = 
                'Create parameters that will help you filter the data to be merge' +
                'd.'
              PictureLayout = plImageRight
              LayoutStyle = lsBasic
              DesignSize = (
                571
                60)
            end
          end
        end
        object TabFileName: TUniTabSheet
          Hint = ''
          ImageIndex = 4
          Caption = 'Document Name'
          object PnlDocumentName: TUniPanel
            Tag = 1999
            Left = 0
            Top = 0
            Width = 573
            Height = 360
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            DesignSize = (
              573
              360)
            object Label10: TUniLabel
              Left = 16
              Top = 96
              Width = 105
              Height = 13
              Hint = ''
              Caption = 'Mail Merge document:'
              TabOrder = 3
            end
            object sbtnSelectDocument: TUniSpeedButton
              Left = 472
              Top = 112
              Width = 22
              Height = 22
              Hint = 'Click to specify the path and name of a new mail merge document'
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                1800000000000006000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE4A592
                C06860B05850A05050A05050A050509048509048409048408040408038408038
                40703840703830FF00FFFF00FFA7A7A770707060606059595959595959595952
                52524E4E4E4E4E4E4747474242424242424040403D3D3DFF00FFFF00FFD06870
                F09090E08080B04820403020C0B8B0C0B8B0D0C0C0D0C8C0505050A04030A040
                30A03830703840FF00FFFF00FF7575759A9A9A8A8A8A5050502E2E2EB7B7B7B7
                B7B7C2C2C2C7C7C75050504A4A4A4A4A4A454545404040FF00FFFF00FFD07070
                FF98A0F08880E08080705850404030907870F0E0E0F0E8E0908070A04030A040
                40A04030803840FF00FFFF00FF7A7A7AA4A4A49292928A8A8A5858583D3D3D78
                7878E2E2E2E7E7E77E7E7E4A4A4A4C4C4C4A4A4A424242FF00FFFF00FFD07870
                FFA0A0F09090F08880705850000000404030F0D8D0F0E0D0807860B04840B048
                40A04040804040FF00FFFF00FF7F7F7FAAAAAA9A9A9A9292925858580000003D
                3D3DD9D9D9DEDEDE7474745454545454544C4C4C474747FF00FFFF00FFD07880
                FFA8B0FFA0A0F09090705850705850705850705850706050806860C05850B050
                50B04840804040FF00FFFF00FF838383B2B2B2AAAAAA9A9A9A58585858585858
                58585858585E5E5E6868686363635C5C5C545454474747FF00FFFF00FFE08080
                FFB0B0FFB0B0FFA0A0F09090F08880E08080E07880D07070D06870C06060C058
                50B05050904840FF00FFFF00FF8A8A8AB7B7B7B7B7B7AAAAAA9A9A9A9292928A
                8A8A8585857A7A7A7575756B6B6B6363635C5C5C4E4E4EFF00FFFF00FFE08890
                FFB8C0FFB8B0D06060C06050C05850C05040B05030B04830A04020A03810C060
                60C05850904840FF00FFFF00FF929292C0C0C0BDBDBD6E6E6E6868686363635C
                5C5C5757575252524848484242426B6B6B6363634E4E4EFF00FFFF00FFE09090
                FFC0C0D06860FFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0E0D0C0E0C8C0A038
                10C06060904850FF00FFFF00FF989898C6C6C6727272E7E7E7E7E7E7E7E7E7E7
                E7E7E7E7E7E7E7E7E7E7E7E7E7E74242426B6B6B525252FF00FFFF00FFE098A0
                FFC0C0D07070FFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0E0D0C0A040
                20D06860A05050FF00FFFF00FFA1A1A1C6C6C67A7A7AE7E7E7E7E7E7E7E7E7E7
                E7E7E7E7E7E7E7E7E7E7E7E7E7E7484848727272595959FF00FFFF00FFF0A0A0
                FFC0C0E07870FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0B048
                30D07070A05050FF00FFFF00FFA8A8A8C6C6C6828282E7E7E7E7E7E7E7E7E7E7
                E7E7E7E7E7E7E7E7E7E7E7E7E7E75252527A7A7A595959FF00FFFF00FFF0A8A0
                FFC0C0E08080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0B050
                30E07880A05050FF00FFFF00FFADADADC6C6C68A8A8AE7E7E7E7E7E7E7E7E7E7
                E7E7E7E7E7E7E7E7E7E7E7E7E7E7575757858585595959FF00FFFF00FFF0B0B0
                FFC0C0F08890FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0C050
                40603030B05850FF00FFFF00FFB6B6B6C6C6C6959595E7E7E7E7E7E7E7E7E7E7
                E7E7E7E7E7E7E7E7E7E7E7E7E7E75C5C5C353535606060FF00FFFF00FFF0B0B0
                FFC0C0FF9090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0C058
                50B05860B05860FF00FFFF00FFB6B6B6C6C6C69C9C9CE7E7E7E7E7E7E7E7E7E7
                E7E7E7E7E7E7E7E7E7E7E7E7E7E7636363646464646464FF00FFFF00FFF0B8B0
                F0B8B0F0B0B0F0B0B0F0A8B0F0A0A0E098A0E09090E09090E08890E08080D078
                80D07870D07070FF00FFFF00FFBCBCBCBCBCBCB6B6B6B6B6B6B0B0B0A8A8A8A1
                A1A19898989898989292928A8A8A8383837F7F7F7A7A7AFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              Caption = ''
              Anchors = [akTop, akRight]
              ParentColor = False
              Color = clWindow
              OnClick = sbtnSelectDocumentClick
            end
            object CaptionPanel5: TIQWebCaptionPanel
              Left = 1
              Top = 1
              Width = 571
              Height = 60
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 5
              Caption = 'Step 5 of 7:  What do you want to name the mail merge document?'
              ParentColor = True
              Text = 
                'Please specify a file name and location for the Microsoft Word m' +
                'ail merge document.'
              PictureLayout = plImageRight
              LayoutStyle = lsBasic
              DesignSize = (
                571
                60)
            end
            object chkOverwriteDocument: TUniCheckBox
              Left = 56
              Top = 138
              Width = 169
              Height = 17
              Hint = ''
              Checked = True
              Caption = 'Overwrite current document'
              TabOrder = 1
            end
            object dbeDocument: TUniDBEdit
              Left = 56
              Top = 113
              Width = 412
              Height = 21
              Hint = ''
              DataField = 'FILENAME'
              DataSource = CRMWORD_DM.SrcCRMWordDoc
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
        end
        object TabTemplate: TUniTabSheet
          Hint = ''
          ImageIndex = 6
          Caption = 'Template Name'
          object PnlTemplateName: TUniPanel
            Tag = 1999
            Left = 0
            Top = 0
            Width = 573
            Height = 360
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            ExplicitWidth = 484
            ExplicitHeight = 363
            DesignSize = (
              573
              360)
            object CaptionPanel6: TIQWebCaptionPanel
              Left = 1
              Top = 1
              Width = 571
              Height = 60
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              Caption = 'Step 6 of 7:  Which template do you want to use?'
              ParentColor = True
              Text = 
                'You can optionally specify a template for the new mail merge doc' +
                'ument. '
              PictureLayout = plImageRight
              LayoutStyle = lsBasic
              DesignSize = (
                571
                60)
            end
            object gbTemplate: TUniGroupBox
              Left = 8
              Top = 88
              Width = 557
              Height = 95
              Hint = ''
              Caption = ' Use this Template '
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              DesignSize = (
                557
                95)
              object sbtnBrowseTemplate: TUniSpeedButton
                Left = 527
                Top = 64
                Width = 23
                Height = 22
                Hint = ''
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
                Anchors = [akTop, akRight]
                ParentColor = False
                Color = clWindow
                OnClick = sbtnBrowseTemplateClick
              end
              object rbTemplate_Blank: TUniRadioButton
                Left = 8
                Top = 16
                Width = 153
                Height = 17
                Hint = ''
                Checked = True
                Caption = 'Default Blank Document'
                TabOrder = 0
                OnClick = rbTemplate_BlankClick
              end
              object rbTemplate_UD: TUniRadioButton
                Left = 8
                Top = 40
                Width = 169
                Height = 17
                Hint = ''
                Caption = 'Use This Template:'
                TabOrder = 1
                OnClick = rbTemplate_UDClick
              end
              object cmbTemplate: TUniDBComboBox
                Left = 24
                Top = 64
                Width = 501
                Height = 21
                Hint = ''
                Anchors = [akLeft, akTop, akRight]
                DataField = 'TEMPLATENAME'
                DataSource = CRMWORD_DM.SrcCRMWordDoc
                TabOrder = 2
                OnDropDown = cmbTemplateDropDown
              end
            end
          end
        end
        object TabName: TUniTabSheet
          Hint = ''
          ImageIndex = 4
          Caption = 'Merge Record Name'
          object PnlMergeRecordName: TUniPanel
            Left = 0
            Top = 0
            Width = 573
            Height = 360
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            ExplicitWidth = 484
            ExplicitHeight = 363
            object PnlMergeRecordNameInner: TUniPanel
              Tag = 1999
              Left = 1
              Top = 60
              Width = 571
              Height = 87
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              Caption = ''
              DesignSize = (
                571
                87)
              object Label4: TUniLabel
                Left = 16
                Top = 12
                Width = 27
                Height = 13
                Hint = ''
                Caption = 'Name'
                TabOrder = 4
              end
              object Label5: TUniLabel
                Left = 16
                Top = 36
                Width = 53
                Height = 13
                Hint = ''
                Caption = 'Description'
                TabOrder = 5
              end
              object dbeName: TUniDBEdit
                Left = 128
                Top = 8
                Width = 436
                Height = 21
                Hint = ''
                DataField = 'NAME'
                DataSource = CRMWORD_DM.SrcCRMWordDoc
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                OnChange = dbeNameChange
                OnKeyPress = dbeNameKeyPress
              end
              object dbeDescrip: TUniDBEdit
                Left = 128
                Top = 32
                Width = 436
                Height = 37
                Hint = ''
                DataField = 'DESCRIPTION'
                DataSource = CRMWORD_DM.SrcCRMWordDoc
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
                OnChange = dbeNameChange
              end
              object chkPublished: TUniDBCheckBox
                Left = 128
                Top = 72
                Width = 433
                Height = 17
                Hint = 
                  'Check this option if you want all CRM users to view and use this' +
                  ' Mail Merge record'
                ShowHint = True
                ParentShowHint = False
                DataField = 'PUBLISHED'
                DataSource = CRMWORD_DM.SrcCRMWordDoc
                ValueChecked = 'Y'
                ValueUnchecked = 'N'
                Caption = 'Publish this Mail Merge record'
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
              end
            end
            object CaptionPanel7: TIQWebCaptionPanel
              Left = 1
              Top = 1
              Width = 571
              Height = 60
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 3
              Caption = 'Step 7 of 7:  How do you want to reference your document later?'
              ParentColor = True
              Text = 
                'For future reference, enter a name and description which you wan' +
                't to appear on the list of saved documents.'
              PictureLayout = plImageRight
              LayoutStyle = lsBasic
              DesignSize = (
                571
                60)
            end
            object PnlCampaign2: TUniPanel
              Tag = 1999
              Left = 1
              Top = 147
              Width = 571
              Height = 213
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 2
              Caption = ''
              DesignSize = (
                571
                213)
              object PnlCampaignControls: TUniPanel
                Left = 1
                Top = 17
                Width = 743
                Height = 85
                Hint = ''
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                Caption = ''
                ExplicitWidth = 649
                object PnlCampaignLeft01: TUniPanel
                  Left = 1
                  Top = 1
                  Width = 127
                  Height = 83
                  Hint = ''
                  Align = alLeft
                  Anchors = [akLeft, akTop, akBottom]
                  TabOrder = 0
                  Caption = ''
                  object Label19: TUniLabel
                    Left = 16
                    Top = 12
                    Width = 58
                    Height = 13
                    Hint = ''
                    Caption = 'Campaign #'
                    TabOrder = 1
                  end
                  object Label11: TUniLabel
                    Left = 16
                    Top = 36
                    Width = 25
                    Height = 13
                    Hint = ''
                    Caption = 'Code'
                    TabOrder = 2
                  end
                  object Label32: TUniLabel
                    Left = 16
                    Top = 60
                    Width = 53
                    Height = 13
                    Hint = ''
                    Caption = 'Description'
                    TabOrder = 3
                  end
                end
                object PnlCampaignClient01: TUniPanel
                  Left = 127
                  Top = 1
                  Width = 616
                  Height = 83
                  Hint = ''
                  Align = alClient
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  TabOrder = 1
                  Caption = ''
                  DesignSize = (
                    616
                    83)
                  object cmbCampaign: TUniDBLookupComboBox
                    Left = 1
                    Top = 7
                    Width = 145
                    Height = 21
                    Hint = ''
                    ListFieldIndex = 0
                    TabOrder = 0
                    Color = clWindow
                  end
                  object dbeCampaignCode: TUniDBEdit
                    Left = 1
                    Top = 31
                    Width = 145
                    Height = 21
                    Hint = ''
                    DataField = 'CODE'
                    DataSource = CRMWORD_DM.SrcCampaign
                    TabOrder = 1
                    Color = clBtnFace
                    ReadOnly = True
                  end
                  object dbeCampaignDescription: TUniDBEdit
                    Left = 1
                    Top = 55
                    Width = 436
                    Height = 21
                    Hint = ''
                    DataField = 'DESCRIPTION'
                    DataSource = CRMWORD_DM.SrcCampaign
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    Color = clBtnFace
                    ReadOnly = True
                  end
                end
              end
              object chkAssocCampaign: TUniCheckBox
                Left = 128
                Top = 5
                Width = 153
                Height = 17
                Hint = ''
                Caption = 'Associate with campaign'
                TabOrder = 1
                OnClick = chkAssocCampaignClick
              end
            end
          end
        end
        object TabFinish: TUniTabSheet
          Hint = ''
          ImageIndex = 4
          Caption = 'Finish'
          object PnlFinish: TUniPanel
            Tag = 1999
            Left = 0
            Top = 0
            Width = 573
            Height = 360
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            object PnlSummary: TUniPanel
              Tag = 1999
              Left = 1
              Top = 134
              Width = 571
              Height = 226
              Hint = ''
              Align = alBottom
              Anchors = [akLeft, akRight, akBottom]
              TabOrder = 0
              Caption = ''
              object gbSummary: TUniGroupBox
                Left = 1
                Top = 1
                Width = 569
                Height = 224
                Hint = ''
                Caption = ' Summary '
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 0
              end
              object PnlSummaryInner: TUniPanel
                Tag = 1999
                Left = 1
                Top = 1
                Width = 573
                Height = 228
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                ParentFont = False
                Font.Charset = ANSI_CHARSET
                TabOrder = 1
                Caption = ''
                Color = clWindow
                DesignSize = (
                  573
                  228)
                object lblMergeDatasetLabel: TUniLabel
                  Left = 19
                  Top = 36
                  Width = 84
                  Height = 13
                  Hint = ''
                  Caption = 'Merge Dataset'
                  ParentFont = False
                  Font.Charset = ANSI_CHARSET
                  Font.Style = [fsBold]
                  TabOrder = 7
                end
                object lblMailMergeDocumentLabel: TUniLabel
                  Left = 19
                  Top = 61
                  Width = 123
                  Height = 13
                  Hint = ''
                  Caption = 'Mail Merge Document'
                  ParentFont = False
                  Font.Charset = ANSI_CHARSET
                  Font.Style = [fsBold]
                  TabOrder = 8
                end
                object lblMicrosoftWordTemplateLabel: TUniLabel
                  Left = 19
                  Top = 85
                  Width = 143
                  Height = 13
                  Hint = ''
                  Caption = 'Microsoft Word Template'
                  ParentFont = False
                  Font.Charset = ANSI_CHARSET
                  Font.Style = [fsBold]
                  TabOrder = 9
                end
                object lblMicrosoftAccessDatabaseLabel: TUniLabel
                  Left = 19
                  Top = 108
                  Width = 129
                  Height = 13
                  Hint = ''
                  Caption = 'Export Database Name'
                  ParentFont = False
                  Font.Charset = ANSI_CHARSET
                  Font.Style = [fsBold]
                  TabOrder = 10
                end
                object lblMicrosoftAccessTableLabel: TUniLabel
                  Left = 19
                  Top = 132
                  Width = 106
                  Height = 13
                  Hint = ''
                  Caption = 'Export Table Name'
                  ParentFont = False
                  Font.Charset = ANSI_CHARSET
                  Font.Style = [fsBold]
                  TabOrder = 11
                end
                object lblFieldSelectedLabel: TUniLabel
                  Left = 19
                  Top = 156
                  Width = 84
                  Height = 13
                  Hint = ''
                  Caption = 'Fields Selected'
                  ParentFont = False
                  Font.Charset = ANSI_CHARSET
                  Font.Style = [fsBold]
                  TabOrder = 12
                end
                object lblFieldSelectedSummary: TUniLabel
                  Left = 198
                  Top = 156
                  Width = 6
                  Height = 13
                  Hint = ''
                  Caption = '0'
                  TabOrder = 13
                end
                object lblMergeDatasetImage: TUniImage
                  Left = 1
                  Top = 34
                  Width = 17
                  Height = 17
                  Hint = ''
                  Visible = False
                  Picture.Data = {
                    07544269746D617036030000424D360300000000000036000000280000001000
                    000010000000010018000000000000030000120B0000120B0000000000000000
                    0000FF00FFFF00FFFF00FFFF00FFFF00FFA3A3C93737B20A0A930808932B2BAA
                    A3A3C8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB4B4CC3232
                    B1000085000586000990000C9100078600007D3131A8B3B3CAFF00FFFF00FFFF
                    00FFFF00FFFF00FF9393CC080898020595151BD42025D78C8EB49697AC2C32C2
                    1B25D80509920808899191C6FF00FFFF00FFFF00FFB2B2CE0B0B9F0E10A53B3B
                    F52C2CFF8A8AD8F9F9F9F3F3F38686BC3A3AFF454AF71015A60A0A8AB1B1CAFF
                    00FFFF00FF3131C30707995353F54A4AFF3434FF4344CDEFEFF5FAFAFB5A5BCC
                    3F3FFF5454FF5B5EF9090E9A2E2EA9FF00FF9FA0D20101A03D3DD86767FF4F4F
                    FF3D3DFF2A2BE54E4EB35454A73A3AE93B3BEB5858FF6B6BFF4047E20101899A
                    9AC83D4CD90005A86B6BFA6363FF5454FF4A4AFF3636DBD8D8E0C7C7C74647C9
                    5454FF5D5DFF6A6AFF6B6EFD0007A33838B81932D70910B76F6FFF6262FF5959
                    FF5656FF4444C2FDFDFDE6E6E65C5CBE5A5AE16363FF6969FF6D6DFF0E13BA15
                    15AD1636D80912B76363FF5F5FFF6060FF6363EE3E40B5FFFFFFF4F4F45E5FB5
                    6565E16C6CFF6767FF6666FF1013BA1212AD2F56DE000EAA5757FB5E5EFF6A6A
                    FF7373EE5555B9FFFFFFFDFDFD6A6BB47B7AED7777FF6969FF6060FD0205A52A
                    2ABC819BDA001AB23535DC6060FF7575FF7F7EE85D5DB9FFFFFFFFFFFF7373B7
                    8383E78181FF6E6DFF4040E70000987878CEFF00FF1A4DD70C13B35C5CF97D7D
                    FF7777D36566C0FFFFFFFFFFFF7071BB8383DC8686FF6868FD1010B41818BAFF
                    00FFFF00FF92ABD8032BC5171AC16969F78888E56667BCFFFFFFFFFFFF6969BC
                    8383E56C6CFA1D1DC70207AD8F8FD3FF00FFFF00FFFF00FF6E97DE0229C90C12
                    BC3C3CDC5A5BDA5E5FC76060C75555CE3F3FE21010BD0209B56A6ED9FF00FFFF
                    00FFFF00FFFF00FFFF00FF8AA9DA124CDF001DC40210BB151AC5181DC70710BD
                    0010BC1229D28590D8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCACB
                    CD769EDE3973E5225AE41E55E43463E2738EDDC8C9CDFF00FFFF00FFFF00FFFF
                    00FF}
                  Transparent = True
                end
                object lblMailMergeDocumentImage: TUniImage
                  Left = 1
                  Top = 59
                  Width = 17
                  Height = 17
                  Hint = ''
                  Visible = False
                  Picture.Data = {
                    07544269746D617036030000424D360300000000000036000000280000001000
                    000010000000010018000000000000030000120B0000120B0000000000000000
                    0000FF00FFFF00FFFF00FFFF00FFFF00FFA3A3C93737B20A0A930808932B2BAA
                    A3A3C8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB4B4CC3232
                    B1000085000586000990000C9100078600007D3131A8B3B3CAFF00FFFF00FFFF
                    00FFFF00FFFF00FF9393CC080898020595151BD42025D78C8EB49697AC2C32C2
                    1B25D80509920808899191C6FF00FFFF00FFFF00FFB2B2CE0B0B9F0E10A53B3B
                    F52C2CFF8A8AD8F9F9F9F3F3F38686BC3A3AFF454AF71015A60A0A8AB1B1CAFF
                    00FFFF00FF3131C30707995353F54A4AFF3434FF4344CDEFEFF5FAFAFB5A5BCC
                    3F3FFF5454FF5B5EF9090E9A2E2EA9FF00FF9FA0D20101A03D3DD86767FF4F4F
                    FF3D3DFF2A2BE54E4EB35454A73A3AE93B3BEB5858FF6B6BFF4047E20101899A
                    9AC83D4CD90005A86B6BFA6363FF5454FF4A4AFF3636DBD8D8E0C7C7C74647C9
                    5454FF5D5DFF6A6AFF6B6EFD0007A33838B81932D70910B76F6FFF6262FF5959
                    FF5656FF4444C2FDFDFDE6E6E65C5CBE5A5AE16363FF6969FF6D6DFF0E13BA15
                    15AD1636D80912B76363FF5F5FFF6060FF6363EE3E40B5FFFFFFF4F4F45E5FB5
                    6565E16C6CFF6767FF6666FF1013BA1212AD2F56DE000EAA5757FB5E5EFF6A6A
                    FF7373EE5555B9FFFFFFFDFDFD6A6BB47B7AED7777FF6969FF6060FD0205A52A
                    2ABC819BDA001AB23535DC6060FF7575FF7F7EE85D5DB9FFFFFFFFFFFF7373B7
                    8383E78181FF6E6DFF4040E70000987878CEFF00FF1A4DD70C13B35C5CF97D7D
                    FF7777D36566C0FFFFFFFFFFFF7071BB8383DC8686FF6868FD1010B41818BAFF
                    00FFFF00FF92ABD8032BC5171AC16969F78888E56667BCFFFFFFFFFFFF6969BC
                    8383E56C6CFA1D1DC70207AD8F8FD3FF00FFFF00FFFF00FF6E97DE0229C90C12
                    BC3C3CDC5A5BDA5E5FC76060C75555CE3F3FE21010BD0209B56A6ED9FF00FFFF
                    00FFFF00FFFF00FFFF00FF8AA9DA124CDF001DC40210BB151AC5181DC70710BD
                    0010BC1229D28590D8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCACB
                    CD769EDE3973E5225AE41E55E43463E2738EDDC8C9CDFF00FFFF00FFFF00FFFF
                    00FF}
                  Transparent = True
                end
                object lblMicrosoftWordTemplateImage: TUniImage
                  Left = 1
                  Top = 83
                  Width = 17
                  Height = 17
                  Hint = ''
                  Visible = False
                  Picture.Data = {
                    07544269746D617036030000424D360300000000000036000000280000001000
                    000010000000010018000000000000030000120B0000120B0000000000000000
                    0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBABABA9797979797979797
                    979797979797979797979797979797979797979898989E9E9EA9A9A9A9A9A9BB
                    BBBBFF00FF353A3C0C3E460E434B12474E15454D15444C10282C10171815424A
                    104049094048053F47003D45011C1FAFAFAFFF00FF7B7B7B0E71880DC1EC1ECF
                    F42ED4F535C4E0697375E7E7E75A7E8432D7F625D4F417D0F309BCDC132829C9
                    C9C9FF00FFC6C6C632444711AEE026CBF140D9F648C4DD6B747679808165777A
                    48DCF939D8F627D4F41B555E838383FF00FFFF00FFFF00FFA1A1A120546226C4
                    F448D8FA5CE1FC5CC4D863C4D75CD8F05DE2FB4CDDFA37A9BE464949FF00FFFF
                    00FFFF00FFFF00FFFF00FF6B6C6C2685A342D0FA5FE0FD6D7676798082747E80
                    68E3FD58D3EC3E4444C0C0C0FF00FFFF00FFFF00FFFF00FFFF00FFC2C2C2303C
                    4033BEF052DAFD757C7DE2E2E26181876BE4FD538995727272FF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FF83838326617149D4FD71787AEAEAEA66787B
                    63C8DB4F5151CACACAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCACA
                    CA323E4046D3FA707677F3F3F36181874E7880838383FF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FF89898933687682898AECECEC43757E
                    484A4ACACACAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FF51525235859842919E2D3B3EB1B1B1FF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA4A4A42751582F85964C4C4C
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FF4E5253192E32AAAAAAFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B9B9B5A5A5AFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FF}
                  Transparent = True
                end
                object lblFieldSelectedImage: TUniImage
                  Left = 1
                  Top = 154
                  Width = 17
                  Height = 17
                  Hint = ''
                  Visible = False
                  Picture.Data = {
                    07544269746D617036030000424D360300000000000036000000280000001000
                    000010000000010018000000000000030000120B0000120B0000000000000000
                    0000FF00FFFF00FFFF00FFFF00FFFF00FFA3A3C93737B20A0A930808932B2BAA
                    A3A3C8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB4B4CC3232
                    B1000085000586000990000C9100078600007D3131A8B3B3CAFF00FFFF00FFFF
                    00FFFF00FFFF00FF9393CC080898020595151BD42025D78C8EB49697AC2C32C2
                    1B25D80509920808899191C6FF00FFFF00FFFF00FFB2B2CE0B0B9F0E10A53B3B
                    F52C2CFF8A8AD8F9F9F9F3F3F38686BC3A3AFF454AF71015A60A0A8AB1B1CAFF
                    00FFFF00FF3131C30707995353F54A4AFF3434FF4344CDEFEFF5FAFAFB5A5BCC
                    3F3FFF5454FF5B5EF9090E9A2E2EA9FF00FF9FA0D20101A03D3DD86767FF4F4F
                    FF3D3DFF2A2BE54E4EB35454A73A3AE93B3BEB5858FF6B6BFF4047E20101899A
                    9AC83D4CD90005A86B6BFA6363FF5454FF4A4AFF3636DBD8D8E0C7C7C74647C9
                    5454FF5D5DFF6A6AFF6B6EFD0007A33838B81932D70910B76F6FFF6262FF5959
                    FF5656FF4444C2FDFDFDE6E6E65C5CBE5A5AE16363FF6969FF6D6DFF0E13BA15
                    15AD1636D80912B76363FF5F5FFF6060FF6363EE3E40B5FFFFFFF4F4F45E5FB5
                    6565E16C6CFF6767FF6666FF1013BA1212AD2F56DE000EAA5757FB5E5EFF6A6A
                    FF7373EE5555B9FFFFFFFDFDFD6A6BB47B7AED7777FF6969FF6060FD0205A52A
                    2ABC819BDA001AB23535DC6060FF7575FF7F7EE85D5DB9FFFFFFFFFFFF7373B7
                    8383E78181FF6E6DFF4040E70000987878CEFF00FF1A4DD70C13B35C5CF97D7D
                    FF7777D36566C0FFFFFFFFFFFF7071BB8383DC8686FF6868FD1010B41818BAFF
                    00FFFF00FF92ABD8032BC5171AC16969F78888E56667BCFFFFFFFFFFFF6969BC
                    8383E56C6CFA1D1DC70207AD8F8FD3FF00FFFF00FFFF00FF6E97DE0229C90C12
                    BC3C3CDC5A5BDA5E5FC76060C75555CE3F3FE21010BD0209B56A6ED9FF00FFFF
                    00FFFF00FFFF00FFFF00FF8AA9DA124CDF001DC40210BB151AC5181DC70710BD
                    0010BC1229D28590D8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCACB
                    CD769EDE3973E5225AE41E55E43463E2738EDDC8C9CDFF00FFFF00FFFF00FFFF
                    00FF}
                  Transparent = True
                end
                object lblMicrosoftAccessTableSummary: TUniEdit
                  Left = 198
                  Top = 132
                  Width = 369
                  Height = 21
                  Hint = ''
                  ShowHint = True
                  ParentShowHint = False
                  Text = ''
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 5
                  ReadOnly = True
                end
                object lblMicrosoftAccessDatabaseSummary: TUniEdit
                  Left = 198
                  Top = 108
                  Width = 369
                  Height = 21
                  Hint = ''
                  ShowHint = True
                  ParentShowHint = False
                  Text = ''
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 4
                  ReadOnly = True
                end
                object lblMicrosoftWordTemplateSummary: TUniEdit
                  Left = 198
                  Top = 85
                  Width = 369
                  Height = 21
                  Hint = ''
                  ShowHint = True
                  ParentShowHint = False
                  Text = ''
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 3
                  ReadOnly = True
                end
                object lblMailMergeDocumentSummary: TUniEdit
                  Left = 198
                  Top = 61
                  Width = 369
                  Height = 21
                  Hint = ''
                  ShowHint = True
                  ParentShowHint = False
                  Text = ''
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 2
                  ReadOnly = True
                end
                object lblMergeDatasetSummary: TUniEdit
                  Left = 198
                  Top = 36
                  Width = 369
                  Height = 21
                  Hint = ''
                  ShowHint = True
                  ParentShowHint = False
                  Text = ''
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 1
                  ReadOnly = True
                end
                object PnlSummaryBar: TUniPanel
                  Tag = 1999
                  Left = 1
                  Top = 1
                  Width = 571
                  Height = 20
                  Hint = ''
                  Align = alTop
                  Anchors = [akLeft, akTop, akRight]
                  ParentFont = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWhite
                  TabOrder = 0
                  Caption = ''
                  Color = clBtnShadow
                  object lblSummary: TUniLabel
                    Left = 1
                    Top = 1
                    Width = 55
                    Height = 13
                    Hint = 'Fields available for you to select for your merge document.'
                    ShowHint = True
                    ParentShowHint = False
                    Caption = 'Summary'
                    Align = alTop
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWhite
                    Font.Style = [fsBold]
                    TabOrder = 1
                  end
                end
              end
            end
            object cpFinish: TIQWebCaptionPanel
              Left = 1
              Top = 1
              Width = 571
              Height = 60
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              Caption = 'Finish'
              ParentColor = True
              Text = 
                'That is all the information required to create the mail merge do' +
                'cument.  Click Finish to complete the process.'
              PictureLayout = plImageRight
              LayoutStyle = lsBasic
              DesignSize = (
                571
                60)
            end
          end
        end
      end
    end
    object PnlControls: TUniPanel
      Left = 1
      Top = 390
      Width = 745
      Height = 36
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Panel1: TUniPanel
        Left = 329
        Top = 1
        Width = 416
        Height = 34
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object btnCancel: TUniBitBtn
          Left = 1
          Top = 5
          Width = 97
          Height = 25
          Hint = ''
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333333333000033338833333333333333333F333333333333
            0000333911833333983333333388F333333F3333000033391118333911833333
            38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
            911118111118333338F3338F833338F3000033333911111111833333338F3338
            3333F8330000333333911111183333333338F333333F83330000333333311111
            8333333333338F3333383333000033333339111183333333333338F333833333
            00003333339111118333333333333833338F3333000033333911181118333333
            33338333338F333300003333911183911183333333383338F338F33300003333
            9118333911183333338F33838F338F33000033333913333391113333338FF833
            38F338F300003333333333333919333333388333338FFF830000333333333333
            3333333333333333333888330000333333333333333333333333333333333333
            0000}
          Caption = 'Cancel'
          ModalResult = 2
          TabOrder = 0
          OnClick = btnCancel1Click
        end
        object btnBack: TUniBitBtn
          Left = 108
          Top = 5
          Width = 97
          Height = 25
          Hint = ''
          Glyph.Data = {
            46010000424D460100000000000076000000280000001A0000000D0000000100
            040000000000D000000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888888800000088888808888888888887F88888000000888880088888
            88888877F8888800000088880608888888888787FFFFF8000000888066000008
            888878877777F8000000880666666608888788888887F8000000806666666608
            8878F8888887F800000088066666660888878F88FFF7F8000000888066000008
            888878F777778800000088880608888888888787F88888000000888880088888
            88888877F8888800000088888808888888888887888888000000888888888888
            88888888888888000000}
          Caption = '&Back'
          TabOrder = 1
          OnClick = ButtonBackClick
        end
        object btnNext: TUniBitBtn
          Left = 210
          Top = 5
          Width = 97
          Height = 25
          Hint = ''
          Glyph.Data = {
            46010000424D460100000000000076000000280000001A0000000D0000000100
            040000000000D000000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            88888888F8888800000088888808888888888887FF8888000000888888008888
            8888888778F8880000008888880608888888FFF7F78F88000000880000066088
            888777778878F80000008806666666088887F88888878F000000880666666660
            8887F8888888780000008806666666088887FFFFF88788000000880000066088
            88877777F8788800000088888806088888888887F78888000000888888008888
            8888888778888800000088888808888888888887888888000000888888888888
            88888888888888000000}
          Caption = '&Next'
          TabOrder = 2
          OnClick = ButtonNextClick
        end
        object btnFinish: TUniBitBtn
          Left = 312
          Top = 5
          Width = 97
          Height = 25
          Hint = ''
          Enabled = False
          Glyph.Data = {
            F6000000424DF60000000000000076000000280000000C000000100000000100
            0400000000008000000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777087777777
            00007770087777770000777700877777000077770B0877770000770000B08777
            0000770BBFBB087700007770FB00007700007770BFB08777000000000BFB0877
            00000FBFBFBFB087000070FBFB000077000070BFBFB087770000770BFBFB0877
            0000770FFFBFF08700007770FBFFBF0800007770000000000000}
          Caption = '&Finish'
          ModalResult = 1
          TabOrder = 3
          OnClick = btnFinish1Click
        end
      end
    end
    object PnlMenu: TUniPanel
      Left = 1
      Top = 1
      Width = 158
      Height = 390
      Hint = ''
      Visible = False
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 2
      Caption = ''
      object Bevel2: TUniPanel
        Left = 1
        Top = 23
        Width = 156
        Height = 3
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        Caption = ''
      end
      object Panel6: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 156
        Height = 23
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        object Panel13: TUniPanel
          Left = 1
          Top = 1
          Width = 154
          Height = 21
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object Panel14: TUniPanel
            Left = 129
            Top = 1
            Width = 25
            Height = 19
            Hint = ''
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            object sbtnHideMenu: TUniSpeedButton
              Left = 6
              Top = 1
              Width = 17
              Height = 17
              Hint = 'Close'
              ShowHint = True
              ParentShowHint = False
              Glyph.Data = {
                C6000000424DC60000000000000076000000280000000A0000000A0000000100
                0400000000005000000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDD00
                0000DDDDDDDDDD000000D00DDDD00D000000DD00DD00DD000000DDD0000DDD00
                0000DDDD00DDDD000000DDD0000DDD000000DD00DD00DD000000D00DDDD00D00
                0000DDDDDDDDDD000000}
              Caption = ''
              ParentColor = False
              Color = clWindow
              OnClick = sbtnHideMenuClick
            end
          end
          object Panel15: TUniPanel
            Left = 1
            Top = 1
            Width = 48
            Height = 19
            Hint = ''
            Visible = False
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 1
            Caption = ''
            object sbtnMenuPrior: TUniSpeedButton
              Left = 2
              Top = 1
              Width = 17
              Height = 17
              Hint = 'Previous'
              ShowHint = True
              ParentShowHint = False
              Glyph.Data = {
                BE000000424DBE00000000000000760000002800000009000000090000000100
                0400000000004800000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDD00DDD000
                0000DDD070DDD0000000DD07700000000000D077777700000000077777770000
                0000D077777700000000DD07700000000000DDD070DDD0000000DDDD00DDD000
                0000}
              Caption = ''
              ParentColor = False
              Color = clWindow
              OnClick = ButtonBackClick
            end
            object sbtnMenuNext: TUniSpeedButton
              Left = 19
              Top = 1
              Width = 17
              Height = 17
              Hint = 'Next'
              ShowHint = True
              ParentShowHint = False
              Glyph.Data = {
                BE000000424DBE00000000000000760000002800000009000000090000000100
                0400000000004800000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDD00DDDD000
                0000DDD070DDD00000000000770DD000000007777770D0000000077777770000
                000007777770D00000000000770DD0000000DDD070DDD0000000DDD00DDDD000
                0000}
              Caption = ''
              ParentColor = False
              Color = clWindow
              OnClick = ButtonNextClick
            end
          end
        end
      end
      object Panel8: TUniPanel
        Left = 1
        Top = 26
        Width = 156
        Height = 364
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object tvMenu: TUniTreeView
          Left = 1
          Top = 1
          Width = 154
          Height = 362
          Hint = ''
          Items.FontData = {0100000000}
          Images = ImageList1
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Color = clWindow
          OnClick = tvMenuClick
        end
      end
    end
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.doc'
    Filter = 
      'Microsoft Word Document (*.doc; *.docx; *.docm)|*.doc; *.docx; *' +
      '.docm'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 36
    Top = 46
  end
  object QryColInfo: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select data_type,'
      '          data_length,'
      '          data_precision,'
      '          data_scale'
      ' from all_tab_columns'
      'where owner = '#39'IQMS'#39
      '  and table_name = :table_name'
      '  and column_name = :column_name')
    Left = 64
    Top = 46
    ParamData = <
      item
        Name = 'table_name'
        DataType = ftString
      end
      item
        Name = 'column_name'
        DataType = ftString
      end>
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Mail Merge Editor'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 195295 $'
    BuildVersion = '176554'
    Left = 120
    Top = 46
  end
  object QryFields: TFDQuery
    BeforeOpen = QryFieldsBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select column_name'
      'from all_tab_columns'
      'where owner = '#39'IQMS'#39
      'and table_name = :name'
      'order by column_name')
    Left = 92
    Top = 46
    ParamData = <
      item
        Name = 'name'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryFieldsCOLUMN_NAME: TStringField
      FieldName = 'COLUMN_NAME'
      Origin = 'ALL_TAB_COLUMNS.COLUMN_NAME'
      Size = 128
    end
  end
  object OpenTemplate: TOpenDialog
    DefaultExt = 'Word Templates (*.dot)'
    Filter = 'Word Templates (*.dot; *.dotx; *.dotm)|*.dot; *.dotx; *.dotm'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 8
    Top = 46
  end
  object ImageList1: TUniImageList
    Left = 40
    Top = 162
    Bitmap = {
      494C010106000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
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
      0000000000000000000000000000000000004848480048484800484848004848
      4800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000018799C001879
      9C0018799C0018799C0018799C0018799C0018799C0018799C0018799C001879
      9C00000000000000000000000000000000000344640000000000000000000000
      00000000000000000000000000000000000048484800F7FFFF00F7FFFF00F7FF
      FF00484848000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001896C6001896C6001896
      C6001896C6001896C6001896C6001896C6001896C6001896C6001896C6001896
      C60018799C0000000000000000000000000000669A0003446400000000000000
      00000000000000000000000000000000000048484800F7FFFF00C7C7C700F7FF
      FF00F7FFFF004848480000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000189EC600189EC6009CFFFF006BD7
      FF006BD7FF006BD7FF006BD7FF006BD7FF006BD7FF006BD7FF006BD7FF006BD7
      FF00299EBD000871A50000000000000000000344640000669A00034464000000
      0000000000000000000048484800484848005E5E5E002E2E2E0000000000CCCC
      CC00F7FFFF00E5E5E50060606000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000189EC600189EC6007BE7F7009CFF
      FF007BE7FF007BE7FF007BE7FF007BE7FF007BE7FF007BE7FF007BE7FF007BDF
      FF0042B6DE000871A5000000000000000000000000000344640000669A000344
      640000000000000000004848480003030300E8E8E80044444400070707007C7C
      7C00444444002E2E2E00FFFFFF00484848000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000189EC60021A6CE0039BED6009CFF
      FF0084EFFF0084EFFF0084EFFF0084EFFF0084EFFF0084EFFF0084EFFF0084E7
      FF0042BEEF000871A50000000000000000000000000000000000034464000066
      9A00034464000000000048484800E6E6E600CCCCCC007C7C7C00E4E4E400E4E4
      E4000707070000000000C7C7C700484848000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000189EC60042B6E70021A6CE00A5FF
      FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7
      FF0052BEE7005ABECE000871A500000000000000000000000000000000000344
      640000669A000344640000000000C7C7C7000000000007070700E4E4E400E4E4
      E4007C7C7C00CCCCCC00E6E6E600484848000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000189EC6006BD7FF00189EC6008CF7
      F7009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFF
      FF005AC7FF0094FFFF000871A500000000000000000000000000000000000000
      00000344640000669A0003446400FFFFFF002E2E2E00444444007C7C7C000707
      070044444400E8E8E80003030300484848000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000189EC60084D7FF00189EC6006BBE
      DE00FFFFFF00FFFFFF00F7FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084E7FF00FFFFFF000871A500000000000000000000000000000000000000
      0000000000000344640000669A0003446400E5E5E500F5FFFF00CCCCCC000000
      00002E2E2E005E5E5E0060606000484848000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000189EC60084EFFF004AC7E700189E
      C600189EC600189EC600189EC600189EC600189EC600189EC600189EC600189E
      C600189EC600189EC6000871A500000000000000000000000000000000000000
      000000000000000000000344640000669A0003446400F7FEFE00F5FFFF00C7C7
      C700F5FEFE004848480000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000189EC6009CF7FF008CF7FF008CF7
      FF008CF7FF008CF7FF008CF7FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00189EC60018799C0000000000000000000000000000000000000000000000
      00000000000000000000000000000344640000669A0003446400F7FEFE00F8FF
      FF00F7FEFE004848480000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000189EC600FFFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF00FFFFFF00189EC600189EC600189EC600189EC600189E
      C600189EC6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000344640000669A0003446400F9FE
      FE00606060000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000021A6CE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00189EC600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000344640000669A000344
      6400484848000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000021A6CE0021A6
      CE0021A6CE0021A6CE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000034464000066
      9A00034464000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000344
      640000669A000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000018799C001879
      9C0018799C0018799C0018799C0018799C0018799C0018799C0018799C001879
      9C0018799C0018799C0018799C0000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF0084848400FFFFFF0084848400FFFFFF0084848400FFFFFF0084848400FFFF
      FF008484840000000000000000000000000000000000188EB500188EB500188E
      B500188EB500188EB500188EB500188EB500188EB500188EB500188EB500188E
      B500188EB500188EB500188EB50018799C00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF0084848400FFFFFF0084848400FFFFFF0084848400FFFFFF008484
      8400FFFFFF00000000000000000000000000319EBD0063CFFF00188EB5009CFF
      FF006BD7FF006BD7FF006BD7FF006BD7FF006BD7FF006BD7FF006BD7FF006BD7
      FF0039B6DE009CF7FF00188EB50018799C00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF0084848400FFFFFF0084848400FFFFFF0084848400FFFFFF0084848400FFFF
      FF0084848400000000000000000000000000319EBD0063CFFF00188EB5009CFF
      FF007BE7FF007BE7FF007BE7FF007BE7FF007BE7FF007BE7FF007BE7FF007BDF
      FF0042B6DE009CFFFF00188EB50018799C00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF0084848400FFFFFF0084848400FFFFFF0084848400FFFFFF008484
      8400FFFFFF00000000000000000000000000319EBD0063CFFF00188EB5009CFF
      FF0084E7FF0084E7FF0084E7FF0084E7FF0084E7FF0084E7FF0084E7FF0084EF
      FF004AB6DE00A5F7FF00188EB50018799C00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF000000000000000000FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF0084848400FFFFFF0084848400FFFFFF0084848400FFFFFF0084848400FFFF
      FF0084848400000000000000000000000000319EBD0063CFFF00188EB5009CFF
      FF0094FFFF0094FFFF0094FFFF0094FFFF0094FFFF0094FFFF0094FFFF008CF7
      FF0052BEE7009CFFFF00188EB50018799C00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF0084848400FFFFFF0084848400FFFFFF0084848400FFFFFF008484
      8400FFFFFF00000000000000000000000000319EBD006BD7FF00188EB5009CFF
      FF009CFFFF009CFFFF009CFFFF00A5F7FF009CFFFF009CFFFF009CFFFF009CFF
      FF0063CFFF009CFFFF00188EB50018799C00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF0084848400FFFFFF0084848400FFFFFF0084848400FFFFFF0084848400FFFF
      FF0084848400000000000000000000000000319EBD007BDFFF00188EB500FFFF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00FFFFFF00FFFFFF00FFFF
      FF0084D7F700F7FFFF00188EB50018799C00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF0084848400FFFFFF0084848400FFFFFF0084848400FFFFFF008484
      8400FFFFFF00000000000000000000000000319EBD0084EFFF0084E7FF00188E
      B500188EB500188EB500188EB500188EB500188EB500188EB500188EB500188E
      B500188EB500188EB500188EB50000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF0084848400FFFFFF0084848400FFFFFF0084848400FFFFFF0084848400FFFF
      FF0084848400000000000000000000000000319EBD009CF7FF008CF7FF008CF7
      FF008CF7FF008CF7FF008CF7FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF001079A500000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF0084848400FFFFFF0084848400FFFFFF0084848400FFFFFF008484
      8400FFFFFF00000000000000000000000000319EBD00FFFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF00FFFFFF00188EB500188EB500188EB500188EB500188E
      B5001079A5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000319EBD00FFFFFF00FFFF
      FF00FFFFFF00F7FFFF00319EBD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000319EBD00319E
      BD00319EBD00319EBD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FFFFFF0F00000000
      C00F7F070000000080073F030000000000031C010000000000038C0000000000
      0003C400000000000001E000000000000001F000000000000001F80000000000
      0001FC03000000000003FE03000000000007FF070000000081FFFF8700000000
      C3FFFFC700000000FFFFFFE700000000FFFFFFFFFFFFFFFF800180018001FFFF
      800180018001C001800180018001800080018001800100008001800180010000
      8001800180010000800180018001000080018001800100008001800180010000
      80018001800100018001800180010007800180018001000780018001800181FF
      800180018001C3FFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
end
