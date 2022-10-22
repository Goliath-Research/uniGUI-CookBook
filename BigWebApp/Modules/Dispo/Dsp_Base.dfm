object FrmDispoBase: TFrmDispoBase
  Left = 81
  Top = 158
  HelpContext = 1016816
  ClientHeight = 312
  ClientWidth = 735
  Caption = 'Disposition'
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlMain: TUniPanel
    Left = 0
    Top = 0
    Width = 735
    Height = 312
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 1
      Top = 273
      Width = 733
      Height = 39
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object lblStatus: TUniLabel
        Left = 3
        Top = 10
        Width = 35
        Height = 13
        Hint = ''
        Caption = 'Status:'
        TabOrder = 2
      end
      object Panel3: TUniPanel
        Left = 524
        Top = 1
        Width = 209
        Height = 37
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object btnDisposition: TUniButton
          Left = 1
          Top = 8
          Width = 97
          Height = 25
          Hint = ''
          Caption = 'Disposition'
          TabOrder = 1
          OnClick = btnDispositionClick
        end
        object Button2: TUniButton
          Left = 104
          Top = 8
          Width = 97
          Height = 25
          Hint = ''
          Caption = '&Cancel'
          TabOrder = 2
          OnClick = Button2Click
        end
      end
    end
    object PnlCarrier: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 733
      Height = 273
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object SplitterCarrierLeft01: TUniSplitter
        Left = 230
        Top = 0
        Width = 6
        Height = 273
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object ScrollBoxCarrierLeft01: TUniScrollBox
        Left = 0
        Top = 0
        Width = 230
        Height = 273
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        object pnlCarrierLeft01: TUniPanel
          Left = 0
          Top = 0
          Width = 228
          Height = 271
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object Label1: TUniLabel
            Left = 8
            Top = 79
            Width = 25
            Height = 13
            Hint = ''
            Caption = 'Class'
            TabOrder = 6
          end
          object Label2: TUniLabel
            Left = 8
            Top = 33
            Width = 33
            Height = 13
            Hint = ''
            Caption = 'Item #'
            TabOrder = 7
          end
          object Label3: TUniLabel
            Tag = 110
            Left = 8
            Top = 101
            Width = 19
            Height = 13
            Hint = ''
            Caption = 'Rev'
            TabOrder = 8
          end
          object Label4: TUniLabel
            Left = 8
            Top = 57
            Width = 23
            Height = 13
            Hint = ''
            Caption = 'Desc'
            TabOrder = 9
          end
          object lblUnit: TUniLabel
            Left = 8
            Top = 9
            Width = 19
            Height = 13
            Hint = ''
            Caption = 'Unit'
            TabOrder = 10
          end
          object DBEdit1: TUniDBEdit
            Left = 47
            Top = 76
            Width = 25
            Height = 19
            Hint = ''
            DataSource = SrcMaster
            TabOrder = 0
            Color = clBtnFace
            ReadOnly = True
          end
          object DBEdit2: TUniDBEdit
            Tag = 1
            Left = 47
            Top = 30
            Width = 180
            Height = 19
            Hint = ''
            DataSource = SrcMaster
            TabOrder = 1
            Color = clBtnFace
            ReadOnly = True
          end
          object DBEdit3: TUniDBEdit
            Tag = 2
            Left = 47
            Top = 98
            Width = 59
            Height = 19
            Hint = ''
            DataSource = SrcMaster
            TabOrder = 2
            Color = clBtnFace
            ReadOnly = True
          end
          object DBEdit4: TUniDBEdit
            Tag = 1
            Left = 47
            Top = 54
            Width = 180
            Height = 19
            Hint = ''
            DataSource = SrcMaster
            TabOrder = 3
            Color = clBtnFace
            ReadOnly = True
          end
          object dbeUNIT: TUniDBEdit
            Left = 47
            Top = 6
            Width = 52
            Height = 19
            Hint = ''
            DataSource = SrcMaster
            TabOrder = 4
            Color = clBtnFace
            ReadOnly = True
          end
        end
      end
      object pnlCarrierClient01: TUniPanel
        Left = 236
        Top = 1
        Width = 497
        Height = 271
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object Splitter1: TUniSplitter
          Left = 0
          Top = 117
          Width = 497
          Height = 3
          Cursor = crVSplit
          Hint = ''
          Align = alTop
          ParentColor = False
          Color = clBtnFace
        end
        object PageControl1: TUniPageControl
          Left = 1
          Top = 1
          Width = 495
          Height = 117
          Hint = ''
          ActivePage = TabSheet1
          TabBarVisible = True
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          object TabSheet1: TUniTabSheet
            Hint = ''
            TabVisible = False
            Caption = 'TabSheet1'
            object Panel1: TUniPanel
              Tag = 1999
              Left = 0
              Top = 0
              Width = 487
              Height = 89
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
              Caption = 'Panel9'
              object bvAddTo: TUniPanel
                Left = 1
                Top = 47
                Width = 485
                Height = 3
                Hint = ''
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 4
                Caption = ''
              end
              object Panel5: TUniPanel
                Tag = 1999
                Left = 1
                Top = 20
                Width = 485
                Height = 27
                Hint = ''
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                Caption = ''
                object DBNavigator1: TUniDBNavigator
                  Left = 360
                  Top = 1
                  Width = 125
                  Height = 25
                  Hint = ''
                  ShowHint = True
                  ParentShowHint = False
                  DataSource = SrcMasterLoc
                  VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
                  Align = alRight
                  Anchors = [akTop, akRight, akBottom]
                  TabOrder = 0
                end
              end
              object gridTargetLoc: TUniDBGrid
                Left = 1
                Top = 50
                Width = 485
                Height = 39
                Hint = ''
                DataSource = SrcMasterLoc
                LoadMask.Message = 'Loading data...'
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
                Columns = <
                  item
                    Title.Caption = 'Location'
                    Width = 64
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    Title.Caption = 'Lot'
                    Width = 55
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    Title.Caption = 'Quantity'
                    Width = 59
                    CheckBoxField.FieldValues = 'true;false'
                  end>
              end
              object PnlAddToCaption: TUniPanel
                Tag = 1999
                Left = 1
                Top = 1
                Width = 485
                Height = 20
                Hint = ''
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Color = clWhite
                TabOrder = 2
                Caption = ''
                Color = clBtnShadow
                object Label5: TUniLabel
                  Left = 1
                  Top = 1
                  Width = 39
                  Height = 13
                  Hint = ''
                  Caption = 'Add To'
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
        object Panel4: TUniPanel
          Left = 1
          Top = 120
          Width = 495
          Height = 151
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object Splitter2: TUniSplitter
            Left = 239
            Top = 0
            Width = 6
            Height = 151
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object Panel7: TUniPanel
            Left = 1
            Top = 1
            Width = 239
            Height = 149
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object bvMaterialsInvolved: TUniPanel
              Left = 1
              Top = 47
              Width = 237
              Height = 3
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 4
              Caption = ''
            end
            object gridMatReq: TUniDBGrid
              Left = 1
              Top = 50
              Width = 237
              Height = 99
              Hint = ''
              DataSource = SrcDetail
              LoadMask.Message = 'Loading data...'
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
              Columns = <
                item
                  Title.Caption = 'Class'
                  Width = 64
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  Title.Caption = 'Item #'
                  Width = 67
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  Title.Caption = 'Description'
                  Width = 61
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  Title.Caption = 'Quantity'
                  Width = 50
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  Title.Caption = 'RG Quantity'
                  Width = 68
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  Title.Caption = 'Revision'
                  Width = 63
                  ReadOnly = True
                  CheckBoxField.FieldValues = 'true;false'
                end>
            end
            object Panel11: TUniPanel
              Tag = 1999
              Left = 1
              Top = 20
              Width = 237
              Height = 27
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              Caption = ''
              object DBNavigator3: TUniDBNavigator
                Left = 112
                Top = 1
                Width = 125
                Height = 25
                Hint = ''
                ShowHint = True
                ParentShowHint = False
                DataSource = SrcDetail
                VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
                Align = alRight
                Anchors = [akTop, akRight, akBottom]
                TabOrder = 0
              end
            end
            object PnlMaterialsInvolvedCaption: TUniPanel
              Tag = 1999
              Left = 1
              Top = 1
              Width = 237
              Height = 20
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clWhite
              TabOrder = 2
              Caption = ''
              Color = clBtnShadow
              object Label9: TUniLabel
                Left = 1
                Top = 1
                Width = 106
                Height = 13
                Hint = ''
                Caption = 'Materials Involved'
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                ParentFont = False
                Font.Color = clWhite
                Font.Style = [fsBold]
                TabOrder = 1
              end
            end
          end
          object Panel9: TUniPanel
            Left = 272
            Top = 1
            Width = 223
            Height = 149
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            object bvRelieve: TUniPanel
              Left = 1
              Top = 47
              Width = 221
              Height = 3
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 4
              Caption = ''
            end
            object Panel10: TUniPanel
              Tag = 1999
              Left = 1
              Top = 20
              Width = 221
              Height = 27
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              Caption = ''
              object DBNavigator2: TUniDBNavigator
                Left = 96
                Top = 1
                Width = 125
                Height = 25
                Hint = ''
                ShowHint = True
                ParentShowHint = False
                DataSource = SrcDetailLoc
                VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
                Align = alRight
                Anchors = [akTop, akRight, akBottom]
                TabOrder = 0
              end
            end
            object gridMatLoc: TUniDBGrid
              Left = 1
              Top = 50
              Width = 221
              Height = 99
              Hint = ''
              DataSource = SrcDetailLoc
              LoadMask.Message = 'Loading data...'
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Columns = <
                item
                  Title.Caption = 'Location'
                  Width = 64
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  Title.Caption = 'Lot'
                  Width = 35
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  Title.Caption = 'Quantity'
                  Width = 47
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  Title.Caption = 'RG Quantity'
                  Width = 76
                  CheckBoxField.FieldValues = 'true;false'
                end>
            end
            object PnlRelieveCaption: TUniPanel
              Tag = 1999
              Left = 1
              Top = 1
              Width = 221
              Height = 20
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clWhite
              TabOrder = 2
              Caption = ''
              Color = clBtnShadow
              object Label8: TUniLabel
                Left = 1
                Top = 1
                Width = 42
                Height = 13
                Hint = ''
                Caption = 'Relieve'
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                ParentFont = False
                Font.Color = clWhite
                Font.Style = [fsBold]
                TabOrder = 1
              end
            end
          end
          object Panel8: TUniPanel
            Left = 245
            Top = 1
            Width = 27
            Height = 149
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 2
            Caption = ''
            object sbtnLeft: TUniSpeedButton
              Left = 1
              Top = 82
              Width = 25
              Height = 25
              Hint = ''
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
                FF00FFFF00FFFF00FFFF00FFFF00FFD5C1AD303830FF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBF
                BFBF353535FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFD5C2AF304030304030FF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0C0C03B
                3B3B3B3B3BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFD8C8B7607860508060304030FF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC6C6C671717177
                77773B3B3BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFD8C9B850605060987070A8804048403040303038302028202020
                20FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC7C7C75B5B5B8D8D8D9D
                9D9D4646463B3B3B353535252525202020FF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFCDC2AE50685070A88090D8A070C09060A8806098705090604080503038
                30FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBF6262629D9D9DC9C9C9B3
                B3B39C9C9C8D8D8D848484747474353535FF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF90B8A0C0F0D0B0F0C090E0B090D8A080C89070B88060B0705088603040
                30FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1B1B1E7E7E7E3E3E3D2D2D2C9
                C9C9BABABAAAAAAAA1A1A17D7D7D3B3B3BFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFDFDAC3A0D0B0C0F8D0B0E8C090E0B0A0E0C0A0D8B090C8A090C0904048
                40FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD6D6D6C7C7C7EDEDEDDDDDDDD2
                D2D2D6D6D6CDCDCDBDBDBDB4B4B4464646FF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFDFD8C1A0C8B0C0F8D0B0E8C040584090A89080A09080A0908098
                80FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD4D4D4C1C1C1EDEDEDDD
                DDDD525252A2A2A29B9B9B9B9B9BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFDFD8C0A0C8B0C0F0D0505850FF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD4D4D4C1C1C1E7
                E7E7555555FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFDFD7BEA0C0A0507060FF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD3D3D3B8
                B8B86A6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFDFD6BCA0C0A0FF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD2
                D2D2B8B8B8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              Caption = ''
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Style = [fsBold]
              ParentColor = False
              Color = clWindow
              OnClick = sbtnLeftClick
            end
            object sbtnRight: TUniSpeedButton
              Left = 1
              Top = 50
              Width = 25
              Height = 25
              Hint = ''
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
                FF00FFFF00FFFF00FFFF00FFFF00FF809080D5C1ADFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8C
                8C8CBFBFBFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FF809080202020B4A690FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8C
                8C8C202020A3A3A3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FF809080407850202020B8A791FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8C
                8C8C6E6E6E202020A4A4A4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF809880202820303830304030404840509060407850202020B7A48DFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2525253535353B3B3B46
                46468484846E6E6E202020A1A1A1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF80A090B0E8C070B08070A88060A07060987060A870407850202020B5A1
                89FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B9B9BDDDDDDA3A3A39D9D9D94
                94948D8D8D9A9A9A6E6E6E2020209E9E9EFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF90A890B0F0C090E0B090D8A080D0A070C09070B88060A8705090606078
                60FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA2A2A2E3E3E3D2D2D2C9C9C9C2
                C2C2B3B3B3AAAAAA9A9A9A848484717171FF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF90B8A0B0F0D0B0F0C0B0E8C0A0E8C0A0E0B070C09070B080809880CDC2
                ABFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1B1B1E6E6E6E3E3E3DDDDDDDC
                DCDCD3D3D3B3B3B3A3A3A3919191BFBFBFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF90C0A090B8A090A89080A090809880B0E8C080C890809880CEC5AEFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB7B7B7B1B1B1A2A2A29B9B9B91
                9191DDDDDDBABABA919191C1C1C1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FF80A090A0E0C0809880D0C8B2FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B
                9B9BD6D6D6919191C5C5C5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FF90A890809880D1CBB6FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA2
                A2A2919191C8C8C8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FF90B8A0DFD6BDFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1
                B1B1D2D2D2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              Caption = ''
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Style = [fsBold]
              ParentColor = False
              Color = clWindow
              OnClick = sbtnRightClick
            end
          end
        end
      end
    end
  end
  object SrcMaster: TDataSource
    DataSet = TblMaster
    Left = 8
    Top = 209
  end
  object SrcDetail: TDataSource
    DataSet = TblDetail
    Left = 40
    Top = 209
  end
  object TblMaster: TFDTable
    Connection = UniMainModule.FDConnection1
    Left = 8
    Top = 226
  end
  object TblDetail: TFDTable
    Connection = UniMainModule.FDConnection1
    Left = 40
    Top = 226
  end
  object SrcMasterLoc: TDataSource
    DataSet = TblMasterLoc
    Left = 80
    Top = 209
  end
  object SrcDetailLoc: TDataSource
    DataSet = TblDetailLoc
    Left = 112
    Top = 209
  end
  object TblMasterLoc: TFDTable
    Connection = UniMainModule.FDConnection1
    Left = 80
    Top = 226
  end
  object TblDetailLoc: TFDTable
    Connection = UniMainModule.FDConnection1
    Left = 112
    Top = 226
  end
  object SR: TIQWebSecurityRegister
    SecurityCode = 'FRMDISPOBASE'
    Left = 372
    Top = 6
  end
end
