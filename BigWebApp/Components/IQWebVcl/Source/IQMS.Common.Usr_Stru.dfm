object FrmUsr_Define_Stru: TFrmUsr_Define_Stru
  Left = 180
  Top = 144
  ClientHeight = 481
  ClientWidth = 885
  Caption = 'Define Structure'
  OldCreateOrder = True
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TUniPanel
    Left = 0
    Top = 440
    Width = 885
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel3: TUniPanel
      Left = 675
      Top = 1
      Width = 210
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnCreateView: TUniButton
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Create View'
        TabOrder = 1
        OnClick = btnCreateViewClick
      end
      object btnCancel: TUniButton
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
        OnClick = btnCancelClick
      end
    end
  end
  object PageControl1: TUniPageControl
    Left = 0
    Top = 0
    Width = 885
    Height = 440
    Hint = ''
    ActivePage = TabSheet1
    TabBarVisible = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object TabSheet1: TUniTabSheet
      Hint = ''
      Caption = 'General'
      object Splitter1: TUniSplitter
        Left = 0
        Top = 222
        Width = 877
        Height = 3
        Cursor = crVSplit
        Hint = ''
        Align = alTop
        ParentColor = False
        Color = clBtnFace
      end
      object Panel6: TUniPanel
        Tag = 1999
        Left = 0
        Top = 225
        Width = 877
        Height = 187
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object Bevel1: TUniPanel
          Left = 1
          Top = 47
          Width = 875
          Height = 3
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          Caption = ''
        end
        object Panel7: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 875
          Height = 47
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = ''
          object Panel8: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 873
            Height = 20
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clWhite
            TabOrder = 0
            Caption = ''
            Color = clBtnShadow
            object Label2: TUniLabel
              Left = 1
              Top = 1
              Width = 92
              Height = 13
              Hint = ''
              Caption = 'Drop-Down Text'
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              ParentFont = False
              Font.Color = clWhite
              Font.Style = [fsBold]
              TabOrder = 1
            end
          end
          object Panel15: TUniPanel
            Tag = 1999
            Left = 1
            Top = 20
            Width = 873
            Height = 27
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            object DBNavigator3: TUniDBNavigator
              Left = 648
              Top = 1
              Width = 225
              Height = 25
              Hint = ''
              DataSource = SrcUDDropDownTxt
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
              Align = alRight
              Anchors = [akTop, akRight, akBottom]
              TabOrder = 0
            end
          end
        end
        object Panel5: TUniPanel
          Tag = 1999
          Left = 1
          Top = 50
          Width = 875
          Height = 137
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object wwDBGrid1: TIQUniGridControl
            Left = 1
            Top = 1
            Width = 873
            Height = 135
            Layout = 'border'
            ParentAlignmentControl = False
            AlignmentControl = uniAlignmentClient
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            IQComponents.Grid.Left = 0
            IQComponents.Grid.Top = 29
            IQComponents.Grid.Width = 656
            IQComponents.Grid.Height = 49
            IQComponents.Grid.Hint = ''
            IQComponents.Grid.DataSource = SrcUDDropDownTxt
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
            IQComponents.Navigator.DataSource = SrcUDDropDownTxt
            IQComponents.Navigator.LayoutConfig.Region = 'east'
            IQComponents.Navigator.TabOrder = 3
            IQComponents.HiddenPanel.Left = 656
            IQComponents.HiddenPanel.Top = 29
            IQComponents.HiddenPanel.Width = 209
            IQComponents.HiddenPanel.Height = 49
            IQComponents.HiddenPanel.Hint = ''
            IQComponents.HiddenPanel.Visible = True
            IQComponents.HiddenPanel.Align = alRight
            IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
            IQComponents.FormTab.Hint = ''
            IQComponents.FormTab.ImageIndex = 1
            IQComponents.FormTab.Caption = 'Form'
            IQComponents.FormTab.Layout = 'border'
            DataSource = SrcUDDropDownTxt
            Columns = <
              item
                FieldName = 'TEXT'
                Title.Caption = 'Text'
                Width = 546
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'ParentColValue'
                Title.Caption = 'Parent Drop Down Value'
                Width = 420
                CheckBoxField.FieldValues = 'true;false'
              end>
            Marker = 0
          end
          object wwDBComboDlgParentColValue: TUniEdit
            Left = 260
            Top = 68
            Width = 121
            Height = 21
            Hint = ''
            Text = ''
            TabOrder = 1
            ReadOnly = True
            OnKeyDown = wwDBComboDlgParentColValueKeyDown
          end
        end
      end
      object PnlGenTop: TUniPanel
        Tag = 1999
        Left = 0
        Top = 0
        Width = 877
        Height = 222
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Caption = ''
        object Bevel2: TUniPanel
          Left = 1
          Top = 27
          Width = 875
          Height = 3
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
          Caption = ''
        end
        object Splitter3: TUniSplitter
          Left = 577
          Top = 30
          Width = 4
          Height = 192
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object Panel1: TUniPanel
          Left = 1
          Top = 1
          Width = 875
          Height = 27
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = ''
          object sbtnLayoutManager: TUniSpeedButton
            Left = 58
            Top = 1
            Width = 25
            Height = 25
            Hint = 'Layout Manager'
            ShowHint = True
            ParentShowHint = False
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000FF00FFB0A090
              604830604830604830604830816151907060A08870FF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFC0A090FFE8E0FFE8D0FFE0D0FFE0D0FFE0D0FF
              E0D0907870FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0A890
              FFF0E0B08870B08870B08070B08070FFE0D0807060FF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFC0A890FFF0F0FFE8E0FFE8E0FFE0D0FFE0D0FF
              E0D0806050FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0A8A0
              FFF8F0B09880B09080B08870B08870FFE0D0706050FF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFC0A8A0FFF8F0FFF0F0FFF0E0FFE8E0FFE8D0FF
              E0D0705040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0B0A0
              FFF8F0C0A090C09890C09880B09080FFE0D0604830FF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFC0B0A0FFFFFFFFF8F0FFF8F0FFF0F0FFE8E0FF
              E8E0604830634935634935634935634935634935684E3AFF00FFFF00FFC0B0A0
              FFFFFFD0B0A0C0A8A0C0A890C0A090FFE8E0604830FBFAF6FBF8F3FBF5EFFAF3
              EBFAF0E7684E3AFF00FFFF00FFD0B8A0FFFFFFFFFFFFFFFFFFFFF8F0FFF8F0FF
              F0E0604830DAC8BDFBFAF7D3BCAFD6C0B3FAF3EC684E3AFF00FFFF00FFD0B8A0
              FFFFFFD0C0B0D0B8B0D0B0A0C0B0A0FFF0F0604830FCFEFCFCFDFAFCFBF7FBF9
              F4FBF6F1684E3AFF00FFFF00FFD0B8A0FFFFFFFFFFFFFFFFFFFFFFFFFFF8FFFF
              F8F0604830DBCAC0FCFEFCD8C4B9D8C4B9FBF9F5684E3AFF00FFFF00FFD0B8A0
              D0B8A0C0B0A0C0B0A0C0B0A0C0A8A0C0A890C0A890FCFEFCFCFEFCFCFEFCFCFD
              FBFCFCF9684E3AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFEBAC8DEA
              AA8CEAA989E9A27EE89971E68F63E58555E37B47CC6430FF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFEBAC8DFFC3A2FEBF9DFCBB98FBB692FAB08BF9AB
              83F8A67CD26C38FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFEBAC8DEA
              AA8BEAAA8BEAA889E9A281E89C77E7946BE68C60E27239FF00FF}
            Caption = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            ParentColor = False
            Color = clWindow
            OnClick = sbtnLayoutManagerClick
          end
          object Bevel10: TUniPanel
            AlignWithMargins = True
            Left = 53
            Top = 3
            Width = 2
            Height = 21
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 3
            Caption = ''
          end
          object sbtnMoveUp: TUniSpeedButton
            Left = 1
            Top = 1
            Width = 25
            Height = 25
            Hint = 'Move Up'
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
              FF00FFFF00FFFF00FF809880404840304030303830202020FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4646463B
              3B3B353535202020FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF80A09090C090508860408050202820FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B9B9BB4B4B47D
              7D7D747474252525FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF80A09090C8A060B070509060303830FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B9B9BBDBDBDA1
              A1A1848484353535FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF90A890A0D8B070B880609870304030FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA2A2A2CDCDCDAA
              AAAA8D8D8D3B3B3BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              A0C0A0507060505850405840A0E0C080C89060A8804048403040303040303038
              30FF00FFFF00FFFF00FFFF00FFFF00FFB8B8B86A6A6A555555525252D6D6D6BA
              BABA9C9C9C4646463B3B3B3B3B3B353535FF00FFFF00FFFF00FFFF00FFFF00FF
              DFD6BCA0C0A0C0F0D0B0E8C090E0B090D8A070C09070A880508060304030D5C1
              ADFF00FFFF00FFFF00FFFF00FFFF00FFD2D2D2B8B8B8E7E7E7DDDDDDD2D2D2C9
              C9C9B3B3B39D9D9D7777773B3B3BBFBFBFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFDFD7BEA0C8B0C0F8D0B0E8C090E0B090D8A0609870607860D5C2AFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD3D3D3C1C1C1EDEDEDDDDDDDD2
              D2D2C9C9C98D8D8D717171C0C0C0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFDFD8C0A0C8B0C0F8D0B0F0C070A880506050D8C8B7FF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD4D4D4C1C1C1EDEDEDE3
              E3E39D9D9D5B5B5BC6C6C6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFDFD8C1A0D0B0C0F0D0506850D8C9B8FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD4D4D4C7C7C7E7
              E7E7626262C7C7C7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFDFDAC390B8A0CDC2AEFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD6D6D6B1
              B1B1BFBFBFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
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
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            ParentColor = False
            Color = clWindow
            OnClick = sbtnMoveUpClick
          end
          object sbtnMoveDown: TUniSpeedButton
            Left = 25
            Top = 1
            Width = 25
            Height = 25
            Hint = 'Move Down'
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
              FF00FFFF00FFFF00FFFF00FFCDC2AB607860B5A189FF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBF71
              71719E9E9EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFCEC5AE809880509060202020B7A48DFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1C1C191919184
              8484202020A1A1A1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFD0C8B280988070B08060A870407850202020B8A791FF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC5C5C5919191A3A3A39A
              9A9A6E6E6E202020A4A4A4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFD1CBB680988080C89070C09070B88060A870407850202020B4A690FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC8C8C8919191BABABAB3B3B3AA
              AAAA9A9A9A6E6E6E202020A3A3A3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              DFD6BD809880A0E0C0B0E8C0A0E0B070C090609870509060407850202020D5C1
              ADFF00FFFF00FFFF00FFFF00FFFF00FFD2D2D2919191D6D6D6DDDDDDD3D3D3B3
              B3B38D8D8D8484846E6E6E202020BFBFBFFF00FFFF00FFFF00FFFF00FFFF00FF
              90B8A090A89080A090809880A0E8C080D0A060A0704048408090808090808090
              80FF00FFFF00FFFF00FFFF00FFFF00FF808080808080808080808080DCDCDCC2
              C2C29494944646468C8C8C8C8C8C8C8C8CFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF80A090B0E8C090D8A070A880304030FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080DDDDDDC9
              C9C99D9D9D3B3B3BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF90A890B0F0C090E0B070B080303830FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080E3E3E3D2
              D2D2A3A3A3353535FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF90B8A0B0F0D0B0F0C0B0E8C0202820FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080E6E6E6E3
              E3E3DDDDDD252525FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF90C0A090B8A090A89080A090809880FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF80808080808080
              8080808080808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
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
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            ParentColor = False
            Color = clWindow
            OnClick = sbtnMoveDownClick
          end
          object DBNavigator1: TUniDBNavigator
            Left = 636
            Top = 1
            Width = 239
            Height = 25
            Hint = ''
            DataSource = SrcUD_Cols
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
          end
        end
        object Panel10: TUniPanel
          Tag = 1999
          Left = 1
          Top = 30
          Width = 577
          Height = 192
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 1
          Caption = ''
          object wwDBGridHeader: TIQUniGridControl
            Left = 1
            Top = 1
            Width = 575
            Height = 190
            Layout = 'border'
            ParentAlignmentControl = False
            AlignmentControl = uniAlignmentClient
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            IQComponents.Grid.Left = 0
            IQComponents.Grid.Top = 29
            IQComponents.Grid.Width = 358
            IQComponents.Grid.Height = 104
            IQComponents.Grid.Hint = ''
            IQComponents.Grid.DataSource = SrcUD_Cols
            IQComponents.Grid.LoadMask.Message = 'Loading data...'
            IQComponents.Grid.Align = alClient
            IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
            IQComponents.Grid.TabOrder = 0
            IQComponents.Grid.OnDrawColumnCell = wwDBGridHeaderDBGridDrawColumnCell
            IQComponents.Navigator.Left = 410
            IQComponents.Navigator.Top = 0
            IQComponents.Navigator.Width = 241
            IQComponents.Navigator.Height = 25
            IQComponents.Navigator.Hint = ''
            IQComponents.Navigator.ShowHint = True
            IQComponents.Navigator.DataSource = SrcUD_Cols
            IQComponents.Navigator.LayoutConfig.Region = 'east'
            IQComponents.Navigator.TabOrder = 3
            IQComponents.HiddenPanel.Left = 358
            IQComponents.HiddenPanel.Top = 29
            IQComponents.HiddenPanel.Width = 209
            IQComponents.HiddenPanel.Height = 104
            IQComponents.HiddenPanel.Hint = ''
            IQComponents.HiddenPanel.Visible = True
            IQComponents.HiddenPanel.Align = alRight
            IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
            IQComponents.FormTab.Hint = ''
            IQComponents.FormTab.ImageIndex = 1
            IQComponents.FormTab.Caption = 'Form'
            IQComponents.FormTab.Layout = 'border'
            DataSource = SrcUD_Cols
            Columns = <
              item
                FieldName = 'SEQ'
                Title.Caption = '#'
                Width = 14
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'COL_NAME'
                Title.Caption = 'Column Name in the View'
                Width = 147
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'COL_TYPE'
                Title.Caption = 'Field Type'
                Width = 70
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'COL_KIND'
                Title.Caption = 'Field Kind'
                Width = 91
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'COL_LABEL'
                Title.Caption = 'Label'
                Width = 126
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'USE_COMPONENT'
                Title.Caption = 'Use Component'
                Width = 147
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'ParentColName'
                Title.Caption = 'Parent~Column  Name'
                Width = 210
                CheckBoxField.FieldValues = 'true;false'
              end>
            Marker = 0
          end
          object wwDBComboBoxFieldType: TUniDBComboBox
            Left = 280
            Top = 48
            Width = 120
            Height = 21
            Hint = ''
            Style = csDropDownList
            Items.Strings = (
              'CHAR'#9'C'
              'NUMERIC'#9'N'
              'DATE'#9'D')
            TabOrder = 1
          end
          object wwDBComboBoxFieldKind: TUniDBComboBox
            Left = 280
            Top = 72
            Width = 120
            Height = 21
            Hint = ''
            Style = csDropDownList
            Items.Strings = (
              'DATA'#9'D'
              'QUERY'#9'C'
              'LINKED'#9'L'
              'PICKLIST'#9'P')
            TabOrder = 2
          end
          object wwDBComboBoxUseComponent: TUniDBComboBox
            Left = 280
            Top = 96
            Width = 120
            Height = 21
            Hint = ''
            Style = csDropDownList
            Items.Strings = (
              'DBEDIT'
              'DROP-DOWN'
              'DROP-DOWN-LIST'
              'CHECKBOX'
              'MEMO')
            TabOrder = 3
          end
          object wwDBComboDlgParentColName: TUniEdit
            Left = 280
            Top = 123
            Width = 121
            Height = 21
            Hint = ''
            Visible = False
            Text = ''
            TabOrder = 4
            ReadOnly = True
            OnKeyDown = wwDBComboDlgParentColNameKeyDown
          end
        end
        object Panel9: TUniPanel
          Left = 581
          Top = 30
          Width = 296
          Height = 192
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 2
          Caption = ''
          object Panel11: TUniPanel
            Left = 1
            Top = 1
            Width = 294
            Height = 32
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Alignment = taLeftJustify
            Caption = ' Additional'
          end
          object Panel12: TUniPanel
            Left = 1
            Top = 32
            Width = 294
            Height = 160
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            object pgctrlAdditional: TUniPageControl
              Left = 1
              Top = 1
              Width = 292
              Height = 158
              Hint = ''
              ActivePage = TabEmpty
              TabBarVisible = True
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
              object TabEmpty: TUniTabSheet
                Hint = ''
                ImageIndex = 2
                Caption = 'TabEmpty'
              end
              object TabQuery: TUniTabSheet
                Hint = ''
                Caption = 'TabQuery'
                object Panel16: TUniPanel
                  Left = 0
                  Top = 0
                  Width = 284
                  Height = 27
                  Hint = ''
                  Align = alTop
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 0
                  Alignment = taLeftJustify
                  Caption = ' SQL Statement'
                  object Panel17: TUniPanel
                    Left = 255
                    Top = 1
                    Width = 29
                    Height = 25
                    Hint = ''
                    Align = alRight
                    Anchors = [akTop, akRight, akBottom]
                    TabOrder = 0
                    Caption = ''
                    object sbtnEditSQL: TUniSpeedButton
                      Left = 2
                      Top = 2
                      Width = 23
                      Height = 22
                      Hint = 'Edit SQL Statement'
                      ShowHint = True
                      ParentShowHint = False
                      Glyph.Data = {
                        76010000424D7601000000000000760000002800000020000000100000000100
                        0400000000000001000000000000000000001000000000000000000000000000
                        8000008000000080800080000000800080008080000080808000C0C0C0000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDD000DDDD
                        DDDDDDDDD777FFFFDDDDDDDD08880000DDDDDDDD78887777FFDDDDDD0FFF8888
                        00DDDDDD7FDD888877FDDDDD0FFFFFFF880DDDDD7FDDDDDD887FDDDD0FFFFFFF
                        FF0DDDDD7FDDDDDDDD7FDDDD0FF0FFFFFF0DDDDD7FD7DDDDDD7FDDDD0F007777
                        8F0DDDDD7F7777778D7FDDDD00B0FFFFFF0DDDDD77F7DDDDDD7FDDDD0B077777
                        8F0DDDDD7F7777778D7FDDD0B0FFFFFFFF0DDDD7F7DDDDDDDD7FDD0B0FF77778
                        FF0DDD7F7FD77778DD7FD0B00FFFFFFFFF0DD7F77FDDDDDDDD7F0B0D0FFFFFFF
                        FF0D7F7D7FFFFFFFFF7F90DD00000000000DD7DD77777777777DDDDDDDDDDDDD
                        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
                      Caption = ''
                      ParentColor = False
                      Color = clWindow
                      OnClick = sbtnEditSQLClick
                    end
                  end
                end
                object DBMemo1: TUniDBMemo
                  Left = 0
                  Top = 27
                  Width = 284
                  Height = 103
                  Hint = ''
                  DataField = 'SQL_TEXT'
                  DataSource = SrcUD_Cols
                  ScrollBars = ssBoth
                  Align = alClient
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  ReadOnly = True
                  TabOrder = 1
                  WordWrap = False
                end
              end
              object TabSource: TUniTabSheet
                Hint = ''
                ImageIndex = 1
                Caption = 'TabSource'
                object Splitter4: TUniSplitter
                  Left = 101
                  Top = 0
                  Width = 4
                  Height = 130
                  Hint = ''
                  Align = alLeft
                  ParentColor = False
                  Color = clBtnFace
                end
                object Panel14: TUniPanel
                  Left = 105
                  Top = 0
                  Width = 179
                  Height = 130
                  Hint = ''
                  Align = alClient
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  TabOrder = 0
                  Caption = ''
                  DesignSize = (
                    179
                    130)
                  object wwDBComboDlgSourceFieldName: TUniEdit
                    Left = 1
                    Top = 3
                    Width = 174
                    Height = 21
                    Hint = ''
                    CharCase = ecUpperCase
                    Text = ''
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 0
                    OnKeyDown = wwDBComboDlgSourceFieldNameKeyDown
                  end
                end
                object Panel13: TUniPanel
                  Left = 0
                  Top = 0
                  Width = 101
                  Height = 130
                  Hint = ''
                  Align = alLeft
                  Anchors = [akLeft, akTop, akBottom]
                  TabOrder = 1
                  Caption = ''
                  object Label5: TUniLabel
                    Left = 4
                    Top = 6
                    Width = 85
                    Height = 13
                    Hint = ''
                    Caption = 'Linked Field Name'
                    TabOrder = 1
                  end
                end
              end
              object TabPickList: TUniTabSheet
                Hint = ''
                ImageIndex = 3
                Caption = 'TabPickList'
                object Panel18: TUniPanel
                  Left = 0
                  Top = 0
                  Width = 284
                  Height = 27
                  Hint = ''
                  Align = alTop
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 0
                  Alignment = taLeftJustify
                  Caption = ' Picklist SQL'
                  object Panel19: TUniPanel
                    Left = 255
                    Top = 1
                    Width = 29
                    Height = 25
                    Hint = ''
                    Align = alRight
                    Anchors = [akTop, akRight, akBottom]
                    TabOrder = 0
                    Caption = ''
                    object sbtnEditPicklistSQL: TUniSpeedButton
                      Left = 2
                      Top = 2
                      Width = 23
                      Height = 22
                      Hint = 'Edit SQL Statement'
                      ShowHint = True
                      ParentShowHint = False
                      Glyph.Data = {
                        76010000424D7601000000000000760000002800000020000000100000000100
                        0400000000000001000000000000000000001000000000000000000000000000
                        8000008000000080800080000000800080008080000080808000C0C0C0000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDD000DDDD
                        DDDDDDDDD777FFFFDDDDDDDD08880000DDDDDDDD78887777FFDDDDDD0FFF8888
                        00DDDDDD7FDD888877FDDDDD0FFFFFFF880DDDDD7FDDDDDD887FDDDD0FFFFFFF
                        FF0DDDDD7FDDDDDDDD7FDDDD0FF0FFFFFF0DDDDD7FD7DDDDDD7FDDDD0F007777
                        8F0DDDDD7F7777778D7FDDDD00B0FFFFFF0DDDDD77F7DDDDDD7FDDDD0B077777
                        8F0DDDDD7F7777778D7FDDD0B0FFFFFFFF0DDDD7F7DDDDDDDD7FDD0B0FF77778
                        FF0DDD7F7FD77778DD7FD0B00FFFFFFFFF0DD7F77FDDDDDDDD7F0B0D0FFFFFFF
                        FF0D7F7D7FFFFFFFFF7F90DD00000000000DD7DD77777777777DDDDDDDDDDDDD
                        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
                      Caption = ''
                      ParentColor = False
                      Color = clWindow
                      OnClick = sbtnEditPicklistSQLClick
                    end
                  end
                end
                object DBMemo2: TUniDBMemo
                  Left = 0
                  Top = 27
                  Width = 284
                  Height = 103
                  Hint = ''
                  DataField = 'SQL_TEXT'
                  DataSource = SrcUD_Cols
                  ScrollBars = ssBoth
                  Align = alClient
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  ReadOnly = True
                  TabOrder = 1
                  WordWrap = False
                end
              end
            end
          end
        end
      end
    end
    object TabSheet2: TUniTabSheet
      Hint = ''
      Caption = 'Options'
      object Panel4: TUniPanel
        Left = 0
        Top = 0
        Width = 877
        Height = 27
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        object DBNavigator2: TUniDBNavigator
          Left = 802
          Top = 1
          Width = 75
          Height = 25
          Hint = ''
          DataSource = SrcUD_Tables
          VisibleButtons = [nbPost, nbCancel, nbRefresh]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
      object PnlClient01: TUniPanel
        Tag = 1999
        Left = 0
        Top = 27
        Width = 877
        Height = 385
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object Splitter2: TUniSplitter
          Left = 105
          Top = 0
          Width = 6
          Height = 385
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object PnlLeft01: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 105
          Height = 383
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Label1: TUniLabel
            Left = 4
            Top = 36
            Width = 66
            Height = 13
            Hint = ''
            Caption = 'Menu Caption'
            TabOrder = 1
          end
          object Label3: TUniLabel
            Left = 4
            Top = 60
            Width = 64
            Height = 13
            Hint = ''
            Caption = 'Form Caption'
            TabOrder = 2
          end
          object Label4: TUniLabel
            Left = 4
            Top = 12
            Width = 76
            Height = 13
            Hint = ''
            Caption = 'UD Structure ID'
            ParentFont = False
            Font.Color = clGray
            ParentColor = False
            Color = clBtnFace
            TabOrder = 3
          end
        end
        object PnlClient02: TUniPanel
          Tag = 1999
          Left = 111
          Top = 1
          Width = 766
          Height = 383
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object dbeMenu_Caption: TUniDBEdit
            Left = 1
            Top = 33
            Width = 293
            Height = 21
            Hint = ''
            DataField = 'MENU_CAPTION'
            DataSource = SrcUD_Tables
            TabOrder = 0
          end
          object dbeForm_Caption: TUniDBEdit
            Left = 1
            Top = 57
            Width = 293
            Height = 21
            Hint = ''
            DataField = 'FORM_CAPTION'
            DataSource = SrcUD_Tables
            TabOrder = 1
          end
          object dbeUD_Tables_ID: TUniDBEdit
            Left = 1
            Top = 9
            Width = 73
            Height = 21
            Hint = ''
            Enabled = False
            DataField = 'ID'
            DataSource = SrcUD_Tables
            TabOrder = 2
            ReadOnly = True
          end
        end
      end
    end
  end
  object SrcUD_Cols: TDataSource
    DataSet = TblUD_Cols
    OnDataChange = SrcUD_ColsDataChange
    Left = 140
    Top = 308
  end
  object TblUD_Cols: TFDQuery
    BeforeOpen = TblUD_ColsBeforeOpen
    BeforeInsert = TblUD_ColsBeforeInsert
    BeforePost = TblUD_ColsBeforePost
    AfterPost = TblUD_ColsAfterPost
    BeforeDelete = TblUD_ColsBeforeDelete
    AfterDelete = TblUD_ColsAfterPost
    OnCalcFields = TblUD_ColsCalcFields
    OnNewRecord = TblUD_ColsNewRecord
    Filtered = True
    MasterSource = SrcUD_Tables
    MasterFields = 'ID'
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'UD_COLS'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = FDUpdateSQL_UDCols
    SQL.Strings = (
      '  SELECT id,'
      '         ud_tables_id,'
      '         col_name,'
      '         col_label,'
      '         col_type,'
      '         seq,'
      '         use_component,'
      '         tab_name,'
      '         col_kind,'
      '         sql_text,'
      '         ud_groupbox_id,'
      '         groupbox_seq,'
      '         linked_col_name,'
      '         ud_cols_parent_id,'
      '         pklist_field_name'
      '    FROM ud_cols'
      '   WHERE ud_tables_id = :ID'
      'ORDER BY seq')
    Left = 140
    Top = 324
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object TblUD_ColsSEQ: TBCDField
      DisplayLabel = '#'
      DisplayWidth = 2
      FieldName = 'SEQ'
      Required = True
      Size = 0
    end
    object TblUD_ColsCOL_NAME: TStringField
      DisplayLabel = 'Column Name in the View'
      DisplayWidth = 21
      FieldName = 'COL_NAME'
      Required = True
      Size = 50
    end
    object TblUD_ColsCOL_TYPE: TStringField
      DisplayLabel = 'Field Type'
      DisplayWidth = 10
      FieldName = 'COL_TYPE'
      Required = True
      Size = 1
    end
    object TblUD_ColsCOL_KIND: TStringField
      DisplayLabel = 'Field Kind'
      DisplayWidth = 13
      FieldName = 'COL_KIND'
      Size = 1
    end
    object TblUD_ColsCOL_LABEL: TStringField
      DisplayLabel = 'Label'
      DisplayWidth = 18
      FieldName = 'COL_LABEL'
      Required = True
      Size = 50
    end
    object TblUD_ColsUSE_COMPONENT: TStringField
      DisplayLabel = 'Use Component'
      DisplayWidth = 21
      FieldName = 'USE_COMPONENT'
    end
    object TblUD_ColsSQL_TEXT: TStringField
      DisplayLabel = 'SQL Statement'
      DisplayWidth = 30
      FieldName = 'SQL_TEXT'
      Visible = False
      Size = 4000
    end
    object TblUD_ColsTAB_NAME: TStringField
      DisplayLabel = 'Tab Name'
      DisplayWidth = 20
      FieldName = 'TAB_NAME'
      Visible = False
      Size = 60
    end
    object TblUD_ColsID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object TblUD_ColsUD_TABLES_ID: TBCDField
      FieldName = 'UD_TABLES_ID'
      Visible = False
      Size = 0
    end
    object TblUD_ColsLINKED_COL_NAME: TStringField
      FieldName = 'LINKED_COL_NAME'
      Visible = False
      Size = 30
    end
    object TblUD_ColsUD_COLS_PARENT_ID: TBCDField
      FieldName = 'UD_COLS_PARENT_ID'
      Size = 0
    end
    object TblUD_ColsParentColName: TStringField
      FieldKind = fkCalculated
      FieldName = 'ParentColName'
      Size = 30
      Calculated = True
    end
    object TblUD_ColsPKLIST_FIELD_NAME: TStringField
      FieldName = 'PKLIST_FIELD_NAME'
      Visible = False
      Size = 30
    end
  end
  object SrcUD_Tables: TDataSource
    DataSet = TblUD_Tables
    Left = 184
    Top = 308
  end
  object TblUD_Tables: TFDQuery
    OnNewRecord = TblUD_TablesNewRecord
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'UD_TABLES'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = FDUpdateSQL_Tables
    SQL.Strings = (
      '  SELECT id,'
      '         table_name,'
      '         form_caption,'
      '         menu_caption,'
      '         source_attribute,'
      '         source,'
      '         is_native,'
      '         app_name,'
      '         owner_name'
      '    FROM ud_tables'
      'ORDER BY table_name')
    Left = 184
    Top = 324
    object TblUD_TablesID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 0
    end
    object TblUD_TablesTABLE_NAME: TStringField
      FieldName = 'TABLE_NAME'
      Size = 50
    end
    object TblUD_TablesFORM_CAPTION: TStringField
      FieldName = 'FORM_CAPTION'
      Size = 100
    end
    object TblUD_TablesMENU_CAPTION: TStringField
      FieldName = 'MENU_CAPTION'
      Size = 50
    end
  end
  object SrcUDDropDownTxt: TDataSource
    DataSet = TblUDDropDownTxt
    Left = 262
    Top = 314
  end
  object TblUDDropDownTxt: TFDQuery
    BeforeOpen = TblUDDropDownTxtBeforeOpen
    BeforeInsert = CheckUsedComponent
    BeforeEdit = CheckUsedComponent
    BeforePost = TblUDDropDownTxtBeforePost
    OnCalcFields = TblUDDropDownTxtCalcFields
    OnNewRecord = TblUDDropDownTxtNewRecord
    MasterSource = SrcUD_Cols
    MasterFields = 'ID'
    ConnectionName = 'IQFD'
    UpdateOptions.UpdateTableName = 'UD_DROP_DOWN_TEXT'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = FDUpdateSQL_UDDropDownTxt
    SQL.Strings = (
      '  SELECT id,'
      '         ud_cols_id,'
      '         text,'
      '         ud_drop_down_parent_id'
      '    FROM ud_drop_down_text'
      '   WHERE ud_cols_id = :ID'
      'ORDER BY text')
    Left = 263
    Top = 328
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object TblUDDropDownTxtTEXT: TStringField
      DisplayLabel = 'Text'
      DisplayWidth = 78
      FieldName = 'TEXT'
      Size = 250
    end
    object TblUDDropDownTxtParentColValue: TStringField
      DisplayLabel = 'Parent Drop Down Value'
      DisplayWidth = 60
      FieldKind = fkCalculated
      FieldName = 'ParentColValue'
      Size = 250
      Calculated = True
    end
    object TblUDDropDownTxtID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object TblUDDropDownTxtUD_COLS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'UD_COLS_ID'
      Visible = False
      Size = 0
    end
    object TblUDDropDownTxtUD_DROP_DOWN_PARENT_ID: TBCDField
      FieldName = 'UD_DROP_DOWN_PARENT_ID'
      Visible = False
      Size = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 92
    Top = 312
    object File1: TUniMenuItem
      Caption = 'File'
      object Import1: TUniMenuItem
        Caption = 'Import'
        OnClick = Import1Click
      end
      object Export1: TUniMenuItem
        Caption = 'Export'
        OnClick = Export1Click
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
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmUsr_Define_Stru'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 191657 $'
    BuildVersion = '176554'
    Left = 96
    Top = 350
  end
  object PkDirectSourceLink: TIQWebHpick
    BeforeOpen = PkDirectSourceLinkBeforeOpen
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select column_name'
      '  from user_tab_columns'
      ' where table_name = :table_name')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 328
    Top = 267
    ParamData = <
      item
        Name = 'table_name'
        DataType = ftString
        ParamType = ptInput
      end>
    object PkDirectSourceLinkCOLUMN_NAME: TStringField
      DisplayLabel = 'Field Name'
      FieldName = 'COLUMN_NAME'
      Origin = 'IQ.USER_TAB_COLUMNS.COLUMN_NAME'
      Size = 128
    end
  end
  object PkUDCols: TIQWebHpick
    BeforeOpen = PkUDColsBeforeOpen
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select id as id,'
      '       col_name as col_name, '
      '       col_label as col_label'
      '  from ud_cols'
      ' where ud_tables_id = :ud_tables_id'
      '   and id <> :this_id'
      '   and use_component in ('#39'DROP-DOWN'#39', '#39'DROP-DOWN-LIST'#39')'
      '   ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 356
    Top = 315
    ParamData = <
      item
        Name = 'ud_tables_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'this_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkUDColsCOL_NAME: TStringField
      DisplayLabel = 'Column Name'
      DisplayWidth = 30
      FieldName = 'COL_NAME'
      Origin = 'IQ.UD_COLS.COL_NAME'
      Size = 50
    end
    object PkUDColsCOL_LABEL: TStringField
      DisplayLabel = 'Column Label'
      DisplayWidth = 30
      FieldName = 'COL_LABEL'
      Origin = 'IQ.UD_COLS.COL_LABEL'
      Size = 50
    end
    object PkUDColsID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.UD_COLS.ID'
      Visible = False
      Size = 0
    end
  end
  object PkParentColVal: TIQWebHpick
    BeforeOpen = PkParentColValBeforeOpen
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select id as id, '
      '       text as text'
      '  from ud_drop_down_text'
      ' where ud_cols_id = :ud_cols_id')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 392
    Top = 315
    ParamData = <
      item
        Name = 'ud_cols_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkParentColValID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.UD_DROP_DOWN_TEXT.ID'
      Visible = False
      Size = 0
    end
    object PkParentColValTEXT: TStringField
      DisplayLabel = 'Text'
      FieldName = 'TEXT'
      Origin = 'IQ.UD_DROP_DOWN_TEXT.TEXT'
      Size = 250
    end
  end
  object FDUpdateSQL_UDCols: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'INSERT INTO UD_COLS'
      '(ID, UD_TABLES_ID, COL_NAME, COL_LABEL, COL_TYPE, '
      '  SEQ, USE_COMPONENT, TAB_NAME, COL_KIND, '
      '  SQL_TEXT, LINKED_COL_NAME, UD_COLS_PARENT_ID, '
      '  PKLIST_FIELD_NAME)'
      
        'VALUES (:NEW_ID, :NEW_UD_TABLES_ID, :NEW_COL_NAME, :NEW_COL_LABE' +
        'L, :NEW_COL_TYPE, '
      '  :NEW_SEQ, :NEW_USE_COMPONENT, :NEW_TAB_NAME, :NEW_COL_KIND, '
      '  :NEW_SQL_TEXT, :NEW_LINKED_COL_NAME, :NEW_UD_COLS_PARENT_ID, '
      '  :NEW_PKLIST_FIELD_NAME)')
    ModifySQL.Strings = (
      'UPDATE UD_COLS'
      
        'SET ID = :NEW_ID, UD_TABLES_ID = :NEW_UD_TABLES_ID, COL_NAME = :' +
        'NEW_COL_NAME, '
      
        '  COL_LABEL = :NEW_COL_LABEL, COL_TYPE = :NEW_COL_TYPE, SEQ = :N' +
        'EW_SEQ, '
      '  USE_COMPONENT = :NEW_USE_COMPONENT, TAB_NAME = :NEW_TAB_NAME, '
      
        '  COL_KIND = :NEW_COL_KIND, SQL_TEXT = :NEW_SQL_TEXT, LINKED_COL' +
        '_NAME = :NEW_LINKED_COL_NAME, '
      
        '  UD_COLS_PARENT_ID = :NEW_UD_COLS_PARENT_ID, PKLIST_FIELD_NAME ' +
        '= :NEW_PKLIST_FIELD_NAME'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM UD_COLS'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, UD_TABLES_ID, COL_NAME, COL_LABEL, COL_TYPE, SEQ, USE' +
        '_COMPONENT, '
      '  TAB_NAME, COL_KIND, SQL_TEXT, UD_GROUPBOX_ID, GROUPBOX_SEQ, '
      '  LINKED_COL_NAME, UD_COLS_PARENT_ID, PKLIST_FIELD_NAME'
      'FROM UD_COLS'
      'WHERE ID = :ID')
    Left = 144
    Top = 360
  end
  object FDUpdateSQL_Tables: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'INSERT INTO UD_TABLES'
      '(ID, TABLE_NAME, FORM_CAPTION, MENU_CAPTION)'
      
        'VALUES (:NEW_ID, :NEW_TABLE_NAME, :NEW_FORM_CAPTION, :NEW_MENU_C' +
        'APTION)')
    ModifySQL.Strings = (
      'UPDATE UD_TABLES'
      
        'SET ID = :NEW_ID, TABLE_NAME = :NEW_TABLE_NAME, FORM_CAPTION = :' +
        'NEW_FORM_CAPTION, '
      '  MENU_CAPTION = :NEW_MENU_CAPTION'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM UD_TABLES'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, TABLE_NAME, FORM_CAPTION, MENU_CAPTION, SOURCE_ATTRIB' +
        'UTE, '
      '  SOURCE, IS_NATIVE, APP_NAME, OWNER_NAME'
      'FROM UD_TABLES'
      'WHERE ID = :ID')
    Left = 184
    Top = 360
  end
  object FDUpdateSQL_UDDropDownTxt: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'INSERT INTO UD_DROP_DOWN_TEXT'
      '(ID, UD_COLS_ID, TEXT, UD_DROP_DOWN_PARENT_ID)'
      
        'VALUES (:NEW_ID, :NEW_UD_COLS_ID, :NEW_TEXT, :NEW_UD_DROP_DOWN_P' +
        'ARENT_ID)')
    ModifySQL.Strings = (
      'UPDATE UD_DROP_DOWN_TEXT'
      
        'SET ID = :NEW_ID, UD_COLS_ID = :NEW_UD_COLS_ID, TEXT = :NEW_TEXT' +
        ', '
      '  UD_DROP_DOWN_PARENT_ID = :NEW_UD_DROP_DOWN_PARENT_ID'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM UD_DROP_DOWN_TEXT'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT ID, UD_COLS_ID, TEXT, UD_DROP_DOWN_PARENT_ID'
      'FROM UD_DROP_DOWN_TEXT'
      'WHERE ID = :ID')
    Left = 264
    Top = 368
  end
end
