object FrmCRMEditVendorAkaAll: TFrmCRMEditVendorAkaAll
  Left = 289
  Top = 108
  HelpContext = 17721
  ClientHeight = 365
  ClientWidth = 624
  Caption = 'Vendor AKA Assignment'
  OnShow = FormShow
  OnResize = FormResize
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlCarrier: TUniPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 346
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitHeight = 350
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 622
      Height = 4
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
    end
    object pcMain: TUniPageControl
      Left = 1
      Top = 4
      Width = 622
      Height = 342
      Hint = ''
      ActivePage = TabVendors
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      ExplicitHeight = 346
      object TabVendors: TUniTabSheet
        Hint = ''
        ImageIndex = 1
        Caption = 'Vendors'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Splitter2: TUniSplitter
          Left = 261
          Top = 0
          Width = 6
          Height = 322
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object PnlArcustoList: TUniPanel
          Left = 0
          Top = 0
          Width = 261
          Height = 322
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Panel7: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 259
            Height = 48
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Caption = ''
            object Panel8: TUniPanel
              Tag = 1999
              Left = 1
              Top = 1
              Width = 257
              Height = 21
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clWhite
              TabOrder = 0
              Caption = ''
              Color = clBtnShadow
              object Label3: TUniLabel
                Left = 2
                Top = 2
                Width = 63
                Height = 13
                Hint = ''
                Caption = 'Vendor List'
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Color = clWhite
                Font.Style = [fsBold]
                TabOrder = 1
              end
            end
            object Panel9: TUniPanel
              Tag = 1999
              Left = 1
              Top = 22
              Width = 257
              Height = 25
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              object sbtnVendorAKA1: TUniSpeedButton
                Left = 1
                Top = 1
                Width = 25
                Height = 23
                Hint = 'Edit Vendor AKA'
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
                  FF00FFB05840A04030803030602820503030FF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5E5E5E4A4A4A3A3A3A2D2D2D33
                  3333FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  B07060FFA070FFB890B04830D06040904830603830FF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FF737373A1A1A1B8B8B85252526868684C
                  4C4C3A3A3AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  C08070FFC8A0FF9860B04830D06040D06040703840305830304030FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FF838383C6C6C69A9A9A52525268686868
                  68684040404F4F4F3B3B3BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  F0D8D0C09080E09880FFC090C05840904040B0C8B040B05040A050304030FF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFD9D9D9FF00FF9A9A9ABDBDBD60606049
                  4949C2C2C29C9C9C8F8F8F3B3B3BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF606860606870907060B0D8C040A84050B86040B850407840FF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565696969707070D1
                  D1D1949494A4A4A4A2A2A26C6C6CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FF303030C0C8C0B0A8A060687090B09090D0A040A840509050C0C8C0FF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF303030C6C6C6A7A7A7696969A8
                  A8A8C3C3C3949494828282C6C6C6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FF505850D0D8D0C0C8C0A0A0A0807880706060609060D0D8D0FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF555555D6D6D6C6C6C6A0A0A07B
                  7B7B616161858585D6D6D6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FF606060807880808880D0D0D0909890B0B0B0606060707070FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6060607B7B7B868686D0D0D096
                  9696B0B0B0606060707070FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FF606860C0C0C0908890504850707070C0C8C0B0B0B0707070FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565C0C0C08A8A8A4A4A4A70
                  7070C6C6C6B0B0B0707070FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF707870606860404840807880908890D0D0D0A0A8A0FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7575756565654646467B
                  7B7B8A8A8AD0D0D0A6A6A6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FF706870C0C8C0908890505050707870FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6A6A6AC6
                  C6C68A8A8A505050757575FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFE0D8D0707060505850706860D0C8C0FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD7D7D76D
                  6D6D555555676767C7C7C7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                Caption = ''
                ParentColor = False
                Color = clWindow
                OnClick = sbtnVendorAKA1Click
              end
            end
          end
          object GridVendors: TIQUniGridControl
            Left = 1
            Top = 48
            Width = 259
            Height = 274
            Layout = 'border'
            ParentAlignmentControl = False
            AlignmentControl = uniAlignmentClient
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            IQComponents.Grid.Left = 0
            IQComponents.Grid.Top = 29
            IQComponents.Grid.Width = 434
            IQComponents.Grid.Height = 434
            IQComponents.Grid.Hint = ''
            IQComponents.Grid.DataSource = SrcVendor
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
            IQComponents.Navigator.DataSource = SrcVendor
            IQComponents.Navigator.LayoutConfig.Region = 'east'
            IQComponents.Navigator.TabOrder = 3
            IQComponents.HiddenPanel.Left = 434
            IQComponents.HiddenPanel.Top = 29
            IQComponents.HiddenPanel.Width = 209
            IQComponents.HiddenPanel.Height = 434
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
            DataSource = SrcVendor
            Columns = <
              item
                FieldName = 'COMPANY'
                Title.Caption = 'Company'
                Width = 175
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'CUSTNO'
                Title.Caption = 'Customer #'
                Width = 70
                CheckBoxField.FieldValues = 'true;false'
              end>
            Marker = 0
          end
        end
        object PnlSelectedCustomers: TUniPanel
          Left = 264
          Top = 0
          Width = 354
          Height = 322
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object Bevel2: TUniPanel
            Left = 1
            Top = 48
            Width = 352
            Height = 3
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
            Caption = ''
          end
          object Panel12: TUniPanel
            Left = 1
            Top = 51
            Width = 34
            Height = 271
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            DesignSize = (
              34
              263)
            object Panel13: TUniPanel
              Left = 1
              Top = 67
              Width = 32
              Height = 129
              Hint = ''
              Anchors = [akLeft, akRight]
              TabOrder = 0
              Caption = ''
              ExplicitTop = 75
              object sbtnAddToAka: TUniSpeedButton
                Left = 5
                Top = 1
                Width = 25
                Height = 25
                Hint = 'Add Vendor to List'
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  46010000424D460100000000000076000000280000001A0000000D0000000100
                  040000000000D000000000000000000000001000000000000000000000000000
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
                OnClick = sbtnAddToAkaClick
              end
              object sbtnAddAllToAka: TUniSpeedButton
                Left = 5
                Top = 32
                Width = 25
                Height = 25
                Hint = 'Add All Customers to List'
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  46010000424D460100000000000076000000280000001C0000000D0000000100
                  040000000000D000000000000000000000001000000000000000000000000000
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
                OnClick = sbtnAddAllToAkaClick
              end
              object sbtnRemove: TUniSpeedButton
                Left = 5
                Top = 72
                Width = 25
                Height = 25
                Hint = 'Remove Vendor from List'
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  46010000424D460100000000000076000000280000001A0000000D0000000100
                  040000000000D000000000000000000000001000000000000000000000000000
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
                OnClick = sbtnRemoveClick
              end
              object sbtnRemoveAll: TUniSpeedButton
                Left = 5
                Top = 104
                Width = 25
                Height = 25
                Hint = 'Remove All Customers from List'
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  56010000424D560100000000000076000000280000001C0000000E0000000100
                  040000000000E000000000000000000000001000000000000000000000000000
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
                OnClick = sbtnRemoveAllClick
              end
            end
          end
          object Panel14: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 345
            Height = 48
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            Caption = ''
            ExplicitWidth = 354
            object Panel18: TUniPanel
              Tag = 1999
              Left = 1
              Top = 1
              Width = 350
              Height = 21
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clWhite
              TabOrder = 0
              Caption = ''
              Color = clBtnShadow
              object lblSelectedCaption: TUniLabel
                Left = 2
                Top = 2
                Width = 98
                Height = 13
                Hint = ''
                Caption = 'Selected Vendors'
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                ParentFont = False
                Font.Color = clWhite
                Font.Style = [fsBold]
                TabOrder = 1
              end
              object lblVendorCompany: TUniLabel
                Left = 113
                Top = 2
                Width = 3
                Height = 13
                Hint = ''
                Caption = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 2
              end
              object lblDash1: TUniLabel
                Left = 102
                Top = 2
                Width = 10
                Height = 13
                Hint = ''
                Caption = ' - '
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                TabOrder = 3
              end
            end
            object Panel19: TUniPanel
              Tag = 1999
              Left = 1
              Top = 22
              Width = 350
              Height = 25
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              object sbtnVendorAKA2: TUniSpeedButton
                Left = 1
                Top = 1
                Width = 25
                Height = 23
                Hint = 'Edit Vendor AKA'
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
                  FF00FFB05840A04030803030602820503030FF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5E5E5E4A4A4A3A3A3A2D2D2D33
                  3333FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  B07060FFA070FFB890B04830D06040904830603830FF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FF737373A1A1A1B8B8B85252526868684C
                  4C4C3A3A3AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  C08070FFC8A0FF9860B04830D06040D06040703840305830304030FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FF838383C6C6C69A9A9A52525268686868
                  68684040404F4F4F3B3B3BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  F0D8D0C09080E09880FFC090C05840904040B0C8B040B05040A050304030FF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFD9D9D9FF00FF9A9A9ABDBDBD60606049
                  4949C2C2C29C9C9C8F8F8F3B3B3BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF606860606870907060B0D8C040A84050B86040B850407840FF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565696969707070D1
                  D1D1949494A4A4A4A2A2A26C6C6CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FF303030C0C8C0B0A8A060687090B09090D0A040A840509050C0C8C0FF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF303030C6C6C6A7A7A7696969A8
                  A8A8C3C3C3949494828282C6C6C6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FF505850D0D8D0C0C8C0A0A0A0807880706060609060D0D8D0FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF555555D6D6D6C6C6C6A0A0A07B
                  7B7B616161858585D6D6D6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FF606060807880808880D0D0D0909890B0B0B0606060707070FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6060607B7B7B868686D0D0D096
                  9696B0B0B0606060707070FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FF606860C0C0C0908890504850707070C0C8C0B0B0B0707070FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565C0C0C08A8A8A4A4A4A70
                  7070C6C6C6B0B0B0707070FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF707870606860404840807880908890D0D0D0A0A8A0FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7575756565654646467B
                  7B7B8A8A8AD0D0D0A6A6A6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FF706870C0C8C0908890505050707870FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6A6A6AC6
                  C6C68A8A8A505050757575FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFE0D8D0707060505850706860D0C8C0FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD7D7D76D
                  6D6D555555676767C7C7C7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                Caption = ''
                ParentColor = False
                Color = clWindow
                OnClick = EditVendorAKA1Click
              end
              object Panel20: TUniPanel
                Left = 302
                Top = 1
                Width = 51
                Height = 23
                Hint = ''
                Align = alRight
                Anchors = [akTop, akRight, akBottom]
                TabOrder = 0
                Caption = ''
              end
            end
          end
          object lvSelectedVendor: TListView
            Left = 34
            Top = 51
            Width = 313
            Height = 263
            Align = alClient
            Columns = <
              item
                Caption = 'Company'
                Width = 242
              end
              item
                Caption = 'Vendor #'
                Width = 80
              end>
            ReadOnly = True
            PopupMenu = PSelCust
            TabOrder = 2
            ViewStyle = vsReport
            OnClick = lvSelectedVendorClick
            OnKeyDown = lvSelectedVendorKeyDown
            ExplicitWidth = 320
            ExplicitHeight = 271
          end
        end
      end
      object TabAKAAssignment: TUniTabSheet
        Hint = ''
        Caption = 'AKA List'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        object Splitter1: TUniSplitter
          Left = 261
          Top = 0
          Width = 6
          Height = 314
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
          ExplicitHeight = 322
        end
        object PnlAKAList: TUniPanel
          Left = 0
          Top = 0
          Width = 261
          Height = 314
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object GridAvailableArinvt: TIQUniGridControl
            Left = 1
            Top = 48
            Width = 259
            Height = 266
            Layout = 'border'
            ParentAlignmentControl = False
            AlignmentControl = uniAlignmentClient
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            IQComponents.Grid.Left = 0
            IQComponents.Grid.Top = 29
            IQComponents.Grid.Width = 434
            IQComponents.Grid.Height = 434
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
            IQComponents.HiddenPanel.Left = 434
            IQComponents.HiddenPanel.Top = 29
            IQComponents.HiddenPanel.Width = 209
            IQComponents.HiddenPanel.Height = 434
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
            DataSource = SrcArinvt
            Columns = <
              item
                FieldName = 'ITEMNO'
                Title.Caption = 'Item #'
                Width = 70
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'DESCRIP'
                Title.Caption = 'Description'
                Width = 70
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'DESCRIP2'
                Title.Caption = 'Extended Description'
                Width = 154
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'CLASS'
                Title.Caption = 'Class'
                Width = 14
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'REV'
                Title.Caption = 'Revision'
                Width = 70
                CheckBoxField.FieldValues = 'true;false'
              end>
            ExplicitHeight = 274
            Marker = 0
          end
          object Panel1: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 259
            Height = 48
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            Caption = ''
            object Panel5: TUniPanel
              Tag = 1999
              Left = 1
              Top = 1
              Width = 257
              Height = 21
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clWhite
              TabOrder = 0
              Caption = ''
              Color = clBtnShadow
              object Label1: TUniLabel
                Left = 2
                Top = 2
                Width = 123
                Height = 13
                Hint = ''
                Caption = 'Master Inventory List'
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Color = clWhite
                Font.Style = [fsBold]
                TabOrder = 1
              end
            end
            object Panel15: TUniPanel
              Tag = 1999
              Left = 1
              Top = 21
              Width = 257
              Height = 27
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              ExplicitTop = 22
              ExplicitHeight = 25
              DesignSize = (
                257
                27)
              object lblFilterByClass: TUniLabel
                Left = 4
                Top = 6
                Width = 67
                Height = 13
                Hint = ''
                Caption = 'Filter by Class'
                TabOrder = 2
              end
              object cmbClassFilter: TUniDBLookupComboBox
                Left = 80
                Top = 2
                Width = 97
                Height = 21
                Hint = ''
                ListFieldIndex = 0
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                Color = clWindow
                OnChange = cmbClassFilterChange
              end
            end
          end
        end
        object PnlSelectedAKA: TUniPanel
          Left = 267
          Top = 0
          Width = 347
          Height = 314
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          ExplicitLeft = 264
          ExplicitWidth = 354
          ExplicitHeight = 322
          object Bevel3: TUniPanel
            Left = 1
            Top = 48
            Width = 354
            Height = 3
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
            Caption = ''
          end
          object Panel3: TUniPanel
            Left = 1
            Top = 51
            Width = 34
            Height = 271
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            DesignSize = (
              34
              263)
            object Panel11: TUniPanel
              Left = 1
              Top = 63
              Width = 32
              Height = 129
              Hint = ''
              Anchors = [akLeft, akRight]
              TabOrder = 0
              Caption = ''
              ExplicitTop = 71
              object sbtnAddArinvtToAka: TUniSpeedButton
                Left = 5
                Top = 1
                Width = 25
                Height = 25
                Hint = 'Add Item to AKA List'
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  46010000424D460100000000000076000000280000001A0000000D0000000100
                  040000000000D000000000000000000000001000000000000000000000000000
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
                OnClick = sbtnAddArinvtToAkaClick
              end
              object sbtnAddAllArinvtToAka: TUniSpeedButton
                Left = 5
                Top = 32
                Width = 25
                Height = 25
                Hint = 'Add All Items to AKA List'
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  46010000424D460100000000000076000000280000001C0000000D0000000100
                  040000000000D000000000000000000000001000000000000000000000000000
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
                OnClick = sbtnAddAllArinvtToAkaClick
              end
              object sbtnRemoveAka: TUniSpeedButton
                Left = 5
                Top = 72
                Width = 25
                Height = 25
                Hint = 'Remove Item from AKA List'
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  46010000424D460100000000000076000000280000001A0000000D0000000100
                  040000000000D000000000000000000000001000000000000000000000000000
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
                OnClick = sbtnRemoveAkaClick
              end
              object sbtnRemoveAllAka: TUniSpeedButton
                Left = 5
                Top = 104
                Width = 25
                Height = 25
                Hint = 'Remove All Items from AKA List'
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  56010000424D560100000000000076000000280000001C0000000E0000000100
                  040000000000E000000000000000000000001000000000000000000000000000
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
                OnClick = sbtnRemoveAllAkaClick
              end
            end
          end
          object lvSelectedAKA: TListView
            Left = 34
            Top = 51
            Width = 313
            Height = 263
            Align = alClient
            Columns = <
              item
                Caption = 'Item #'
                Width = 100
              end
              item
                Caption = 'Description'
                Width = 200
              end
              item
                Caption = 'Class'
              end
              item
                Caption = 'Revision'
                Width = 100
              end>
            MultiSelect = True
            ReadOnly = True
            RowSelect = True
            TabOrder = 1
            ViewStyle = vsReport
            OnKeyDown = lvSelectedAKAKeyDown
            ExplicitWidth = 320
            ExplicitHeight = 271
          end
          object Panel16: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 345
            Height = 48
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            Caption = ''
            ExplicitWidth = 354
            object Panel17: TUniPanel
              Tag = 1999
              Left = 1
              Top = 1
              Width = 352
              Height = 21
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clWhite
              TabOrder = 0
              Caption = ''
              Color = clBtnShadow
              object Label2: TUniLabel
                Left = 2
                Top = 2
                Width = 112
                Height = 13
                Hint = ''
                Caption = 'Selected AKA Items'
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                ParentFont = False
                Font.Color = clWhite
                Font.Style = [fsBold]
                TabOrder = 1
              end
              object lblVendorCompanyAKA: TUniLabel
                Left = 125
                Top = 2
                Width = 3
                Height = 13
                Hint = ''
                Caption = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 2
              end
              object lblDash2: TUniLabel
                Left = 114
                Top = 2
                Width = 10
                Height = 13
                Hint = ''
                Caption = ' - '
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                TabOrder = 3
              end
            end
            object Panel4: TUniPanel
              Tag = 1999
              Left = 1
              Top = 22
              Width = 352
              Height = 25
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              object PnlSelectedToolbuttons: TUniPanel
                Left = 301
                Top = 1
                Width = 52
                Height = 23
                Hint = ''
                Align = alRight
                Anchors = [akTop, akRight, akBottom]
                TabOrder = 0
                Caption = ''
                object sbtnSaveList: TUniSpeedButton
                  Left = 27
                  Top = 1
                  Width = 25
                  Height = 25
                  Hint = 'Save Selected List to Vendor AKA'
                  Enabled = False
                  ShowHint = True
                  ParentShowHint = False
                  Glyph.Data = {
                    46010000424D460100000000000076000000280000001C0000000D0000000100
                    040000000000D000000000000000000000001000000000000000000000000000
                    8000008000000080800080000000800080008080000080808000C0C0C0000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                    33333333333333330000333333333333333333F3333333330000333303333333
                    33333F3F3333333300003330003333333333F333F33333330000330000033333
                    333F33333F33333300003000300033333373333333F333330000300333000333
                    337333F7333F33330000333333300033333777337333F3330000333333330003
                    3333333337333F33000033333333300033333333337333F30000333333333300
                    3333333333373373000033333333333333333333333377330000333333333333
                    33333333333333330000}
                  Caption = ''
                  ParentColor = False
                  Color = clWindow
                  OnClick = sbtnSaveListClick
                end
                object sbtnCancel: TUniSpeedButton
                  Left = 2
                  Top = 1
                  Width = 25
                  Height = 25
                  Hint = 'Cancel Operation'
                  Enabled = False
                  ShowHint = True
                  ParentShowHint = False
                  Glyph.Data = {
                    DE010000424DDE01000000000000760000002800000024000000120000000100
                    0400000000006801000000000000000000001000000000000000000000000000
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
                  Caption = ''
                  ParentColor = False
                  Color = clWindow
                  OnClick = sbtnCancelClick
                end
              end
            end
          end
        end
      end
    end
  end
  object StatusBar: TUniStatusBar
    Left = 0
    Top = 346
    Width = 624
    Height = 19
    Hint = ''
    Panels = <
      item
        Width = 300
      end
      item
        Width = 200
      end
      item
        Bevel = pbNone
        Width = 50
      end>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
    ExplicitTop = 350
    ExplicitWidth = 816
  end
  object MainMenu1: TUniMainMenu
    Left = 310
    Top = 200
    object File1: TUniMenuItem
      Caption = '&File'
      object Close1: TUniMenuItem
        Caption = '&Close'
        OnClick = Close1Click
      end
    end
    object View1: TUniMenuItem
      Caption = '&View'
      object Refresh1: TUniMenuItem
        Caption = 'Refresh'
        ShortCut = 116
        OnClick = Refresh1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        ShortCut = 112
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'All Vendor AKA Assignment'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 195023 $'
    BuildVersion = '176554'
    Left = 338
    Top = 200
  end
  object SrcVendor: TDataSource
    DataSet = QryVendor
    OnDataChange = SrcVendorDataChange
    Left = 80
    Top = 140
  end
  object QryVendor: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT id, vendorno, company'
      '  FROM v_vendor'
      ' WHERE NVL(pk_hide, '#39'N'#39') <> '#39'Y'#39)
    Left = 88
    Top = 152
    object QryVendorCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 25
      FieldName = 'COMPANY'
      Origin = 'COMPANY'
      Size = 60
    end
    object QryVendorID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryVendorVENDORNO: TStringField
      FieldName = 'VENDORNO'
      Origin = 'VENDORNO'
      Required = True
      Visible = False
      FixedChar = True
      Size = 10
    end
  end
  object SrcArinvt: TDataSource
    DataSet = QryArinvt
    Left = 148
    Top = 144
  end
  object QryArinvt: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, itemno, descrip, descrip2, class, rev, eplant_id'
      'from arinvt'
      'where NVL( pk_hide, '#39'N'#39' ) <> '#39'Y'#39)
    Left = 160
    Top = 152
    object QryArinvtITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 10
      FieldName = 'ITEMNO'
      Origin = 'ITEMNO'
      Required = True
      FixedChar = True
      Size = 50
    end
    object QryArinvtDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 10
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Required = True
      Size = 100
    end
    object QryArinvtDESCRIP2: TStringField
      DisplayLabel = 'Extended Description'
      DisplayWidth = 22
      FieldName = 'DESCRIP2'
      Origin = 'DESCRIP2'
      Size = 100
    end
    object QryArinvtCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 2
      FieldName = 'CLASS'
      Origin = 'CLASS'
      Required = True
      FixedChar = True
      Size = 2
    end
    object QryArinvtREV: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 10
      FieldName = 'REV'
      Origin = 'REV'
      Required = True
      FixedChar = True
      Size = 15
    end
    object QryArinvtID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryArinvtEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object QryClassLookup: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select '#39' <Not filtered> '#39' as class from dual'
      'union'
      'select distinct class from arinvt'
      'order by class')
    Left = 220
    Top = 150
    object QryClassLookupCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 10
      FieldName = 'CLASS'
      Origin = 'IQ.ARINVT.CLASS'
      FixedChar = True
      Size = 16
    end
  end
  object PSelCust: TUniPopupMenu
    OnPopup = PSelCustPopup
    Left = 324
    Top = 148
    object EditVendorAKA1: TUniMenuItem
      Caption = 'Edit this Vendor'#39's AKA'
      OnClick = EditVendorAKA1Click
    end
  end
  object PVendor: TUniPopupMenu
    OnPopup = PVendorPopup
    Left = 296
    Top = 148
    object EditVendorAKA2: TUniMenuItem
      Caption = 'Edit this Vendor'#39's AKA'
      OnClick = EditVendorAKA2Click
    end
    object JumpToVendor1: TUniMenuItem
      Caption = 'Jump to Vendor Maintenance'
      OnClick = JumpToVendor1Click
    end
    object JumpToVendorCentral1: TUniMenuItem
      Caption = 'Jump to Vendor Central'
      OnClick = JumpToVendorCentral1Click
    end
  end
  object JVendor: TIQWebJump
    DataField = 'ID'
    DataSource = SrcVendor
    JumpTo = jtVendor
    Left = 108
    Top = 236
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'cmbClassFilter'
      'EditVendorAKA1'
      'EditVendorAKA2'
      'JumptoVendor1'
      'JumpToVendorCentral1'
      'JumptoInventory1'
      'sbtnVendorAKA1'
      'sbtnVendorAKA2'
      'sbtnSaveList')
    SecurityCode = 'FRMCRMEDITVENDORAKAALL'
    Left = 188
    Top = 220
  end
  object PArinvt: TUniPopupMenu
    Left = 352
    Top = 148
    object JumptoInventory1: TUniMenuItem
      Caption = 'Jump to Inventory'
      OnClick = JumptoInventory1Click
    end
  end
  object JInventory: TIQWebJump
    DataField = 'ID'
    DataSource = SrcArinvt
    JumpTo = jtInventory
    Left = 140
    Top = 236
  end
end
