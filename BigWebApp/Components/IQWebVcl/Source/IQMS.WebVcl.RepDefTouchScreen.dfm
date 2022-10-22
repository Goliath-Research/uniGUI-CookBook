inherited FrmRepDefTouchScreen: TFrmRepDefTouchScreen
  Left = 191
  Top = 11
  ClientHeight = 586
  ClientWidth = 752
  WindowState = wsMaximized
  ExplicitWidth = 768
  ExplicitHeight = 625
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCarrier: TUniPanel
    Width = 752
    Height = 586
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    ExplicitWidth = 752
    ExplicitHeight = 586
    inherited Splitter1: TUniSplitter
      Top = 205
      Width = 752
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      ExplicitTop = 205
      ExplicitWidth = 752
    end
    inherited Panel2: TUniPanel
      Width = 750
      Height = 205
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      ExplicitWidth = 750
      ExplicitHeight = 205
      inherited Bevel1: TUniPanel
        Width = 748
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Visible = False
        ExplicitWidth = 748
      end
      inherited dbgReports: TIQUniGridControl
        Width = 699
        Height = 149
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        IQComponents.Grid.Width = 482
        IQComponents.Grid.Height = 63
        IQComponents.HiddenPanel.Left = 482
        IQComponents.HiddenPanel.Height = 63
        Columns = <
          item
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        ExplicitWidth = 699
        ExplicitHeight = 149
        Marker = 0
      end
      object Panel9: TUniPanel [2]
        Left = 699
        Top = 56
        Width = 51
        Height = 149
        Hint = ''
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        Color = cl3DLight
        object Panel11: TUniPanel
          Left = 1
          Top = 1
          Width = 49
          Height = 97
          Hint = ''
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = ''
          object sbtnNavFirst: TUniSpeedButton
            Left = 1
            Top = 1
            Width = 47
            Height = 48
            Hint = ''
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Glyph.Data = {
              1E010000424D1E010000000000007600000028000000130000000E0000000100
              040000000000A800000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
              FFFFFFF00000F00000000000000000F00000FF000000000000000FF00000FFF0
              000000000000FFF00000FFFF00000000000FFFF00000FFFFF000000000FFFFF0
              0000FFFFFF0000000FFFFFF00000FFFFFFF00000FFFFFFF00000FFFFFFFF000F
              FFFFFFF00000FFFFFFFFF0FFFFFFFFF00000F00000000000000000F00000F000
              00000000000000F00000F00000000000000000F00000FFFFFFFFFFFFFFFFFFF0
              0000}
            Caption = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            ParentColor = False
            Color = clWindow
            OnClick = sbtnNavFirstClick
          end
          object sbtnNavPrior: TUniSpeedButton
            Left = 1
            Top = 48
            Width = 47
            Height = 48
            Hint = ''
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Glyph.Data = {
              72000000424D72000000000000003E00000028000000130000000D0000000100
              010000000000340000000000000000000000020000000200000000000000FFFF
              FF00FFFFE000FFFFE00080002000C0006000E000E000F001E000F803E000FC07
              E000FE0FE000FF1FE000FFBFE000FFFFE000FFFFE000}
            Caption = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            ParentColor = False
            Color = clWindow
            OnClick = sbtnNavPriorClick
          end
        end
        object Panel12: TUniPanel
          Left = 1
          Top = 52
          Width = 49
          Height = 97
          Hint = ''
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Align = alBottom
          Anchors = [akLeft, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object sbtnNavNext: TUniSpeedButton
            Left = 1
            Top = 1
            Width = 47
            Height = 48
            Hint = ''
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Glyph.Data = {
              72000000424D72000000000000003E00000028000000130000000D0000000100
              010000000000340000000000000000000000020000000200000000000000FFFF
              FF00FFFFE000FFFFE000FFBFE000FF1FE000FE0FE000FC07E000F803E000F001
              E000E000E000C000600080002000FFFFE000FFFFE000}
            Caption = ''
            Align = alBottom
            Anchors = [akLeft, akRight, akBottom]
            ParentColor = False
            Color = clWindow
            OnClick = sbtnNavNextClick
          end
          object sbtnNavLast: TUniSpeedButton
            Left = 1
            Top = 49
            Width = 47
            Height = 48
            Hint = ''
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Glyph.Data = {
              76000000424D76000000000000003E00000028000000130000000E0000000100
              010000000000380000000000000000000000020000000200000000000000FFFF
              FF00FFFFE000800020008000200080002000FFBFE000FF1FE000FE0FE000FC07
              E000F803E000F001E000E000E000C000600080002000FFFFE000}
            Caption = ''
            Align = alBottom
            Anchors = [akLeft, akRight, akBottom]
            ParentColor = False
            Color = clWindow
            OnClick = sbtnNavLastClick
          end
        end
      end
      inherited PnlToolbarMain: TUniPanel
        Width = 748
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        ExplicitWidth = 748
        inherited sbtnUnHideAll: TUniSpeedButton
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
        end
        inherited NavMain: TUniDBNavigator
          Left = 674
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          ExplicitLeft = 674
        end
      end
      inherited pnlReportSearch: TUniPanel
        Width = 748
        TabOrder = 3
        ExplicitWidth = 748
        inherited wwIncrementalSearchReportName: TwwIncrementalSearch
          Width = 743
          ExplicitWidth = 743
        end
      end
    end
    inherited pnlGrid: TUniPanel
      Top = 208
      Width = 750
      Height = 331
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Constraints.MinHeight = 110
      ExplicitTop = 208
      ExplicitWidth = 750
      ExplicitHeight = 331
      inherited PageControl1: TUniPageControl
        Width = 748
        Height = 329
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        ActivePage = TabSheet2
        ExplicitWidth = 748
        ExplicitHeight = 329
        inherited TabSheet1: TUniTabSheet
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          ExplicitLeft = 4
          ExplicitTop = 24
          ExplicitWidth = 740
          ExplicitHeight = 301
          inherited Bevel2: TUniPanel
            Top = 48
            Width = 740
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            ExplicitTop = 48
            ExplicitWidth = 740
          end
          inherited dbgParams: TUniDBGrid
            Top = 51
            Width = 740
            Height = 250
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            Columns = <
              item
                FieldName = 'DESCRIP'
                Title.Caption = 'Parameter'
                Width = 51
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                ReadOnly = True
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'UNARY_OPERATOR'
                Title.Caption = '    '
                Width = 26
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                PickList.Strings = (
                  '='
                  'NOT')
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'RANGE_START'
                Title.Caption = 'From'
                Width = 91
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'RANGE_END'
                Title.Caption = 'To'
                Width = 78
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'BINARY_OPERATOR'
                Title.Caption = 'And / Or'
                Width = 101
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                PickList.Strings = (
                  'AND'
                  'OR')
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'INCLUDE_NULLS'
                Title.Caption = 'Include Nulls'
                Width = 158
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                PickList.Strings = (
                  'N'
                  'Y')
                CheckBoxField.FieldValues = 'true;false'
              end>
          end
          inherited PnlFilterToolbar: TUniPanel
            Width = 740
            Height = 48
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            ExplicitWidth = 740
            ExplicitHeight = 48
            object sbtnToolBox: TUniSpeedButton [0]
              Left = 46
              Top = 1
              Width = 46
              Height = 46
              Hint = 'Show Toolbox'
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              ParentShowHint = False
              AllowAllUp = True
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDFFFFFFFFFFDDDDD00000000
                00DDDDDD7777777777FDDDDD0FFFFFFFF0DDDDDD7FDDDDDDD7FDDDDD0FFFFFFF
                F0DDDDDD7FDDDDDDD7FDDDDD0FF80FFFF0DDDDDD7FD87FDDD7FDDDDD0F800FFF
                F0DDDDDD7F877FDDD7FDDDDD080B0FFFF0DDDDDD787F7DDDD7FDDDDD00B0FFFF
                F0DDDDDD77F7DDDDD7FDDDDD0B0FFFFFF0DDDDDD7F7DDDDDD7FDDDD0B0FFFFFF
                F0DDDDD7F7DDDDDDD7FDDD0B0FFFFFFFF0DDDD7F7FDDDDDDD7FDD0B07FFFFFFF
                F0DDD7F77FFFFFFFF7FDD90D0000000000DDD77D7777777777DDDDDDDDDDDDDD
                DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
              Caption = 'Edit'
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              ParentColor = False
              Color = clWindow
              OnClick = sbtnToolBoxClick
            end
            inherited sbtnClear: TUniSpeedButton
              Width = 46
              Height = 46
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              ShowHint = False
              ParentShowHint = False
              Caption = 'Clear'
              ExplicitWidth = 46
              ExplicitHeight = 46
            end
            inherited sbtnSelectCriteria: TUniSpeedButton
              Left = 99
              Width = 46
              Height = 46
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              ExplicitLeft = 99
              ExplicitWidth = 46
              ExplicitHeight = 46
            end
            inherited sbtnSaveCriteria: TUniSpeedButton
              Left = 145
              Width = 46
              Height = 46
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              ExplicitLeft = 145
              ExplicitWidth = 46
              ExplicitHeight = 46
            end
            inherited bvlCruteriaTool: TUniPanel
              Left = 94
              Top = 2
              Height = 44
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              ExplicitLeft = 94
              ExplicitHeight = 44
            end
            inherited NavParams: TUniDBNavigator
              Left = 561
              Height = 46
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              ExplicitLeft = 561
              ExplicitHeight = 46
            end
          end
        end
        inherited TabSheet2: TUniTabSheet
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          ExplicitLeft = 4
          ExplicitTop = 24
          ExplicitWidth = 740
          ExplicitHeight = 301
          inherited PnlDestCarrier: TUniPanel
            Top = 42
            Width = 740
            Height = 259
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            ExplicitTop = 42
            ExplicitWidth = 740
            ExplicitHeight = 259
            inherited pgctrDestination: TUniPageControl
              Width = 738
              Height = 257
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              ActivePage = tabScreen
              ExplicitWidth = 738
              ExplicitHeight = 257
              inherited tabScreen: TUniTabSheet
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                ExplicitLeft = 4
                ExplicitTop = 24
                ExplicitWidth = 730
                ExplicitHeight = 229
                inherited Label4: TUniLabel
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                end
              end
              inherited tabPrinter: TUniTabSheet
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                ExplicitLeft = 4
                ExplicitTop = 24
                ExplicitWidth = 730
                inherited Label1: TUniLabel
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                end
                object sbtnEditBoxQty: TUniSpeedButton [1]
                  Left = 166
                  Top = 10
                  Width = 29
                  Height = 28
                  Hint = 'Show Keypad'
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  ShowHint = True
                  ParentShowHint = False
                  AllowAllUp = True
                  Glyph.Data = {
                    36060000424D3606000000000000360000002800000020000000100000000100
                    18000000000000060000232E0000232E00000000000000000000FF00FF806860
                    806050705840705840705040705040605040605030605030705040FF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FF6868686060605656565656565050505050504E
                    4E4E4C4C4C4C4C4C505050FF00FFFF00FFFF00FFFF00FFFF00FF967E75D0C0B0
                    D0B8B0D0B0A0C0B0A0C0A8A0C0A8A0C0A090C0A090B0A090B09890775E46FF00
                    FFFF00FFFF00FFFF00FF7E7E7EBEBEBEB8B8B8AFAFAFAEAEAEA8A8A8A8A8A8A0
                    A0A0A0A0A09E9E9E9999995C5C5CFF00FFFF00FFFF00FFFF00FF968675F0E0D0
                    D0C0B0D0B8B0D0B0B0C0B0A0C0A8A0C0A8A0C0A090C0A090B0A090775E46FF00
                    FFFF00FFFF00FFFF00FF848484DEDEDEBEBEBEB8B8B8B3B3B3AEAEAEA8A8A8A8
                    A8A8A0A0A0A0A0A09E9E9E5C5C5CFF00FFFF00FFFF00FFFF00FF968D85F0E0D0
                    929292606060D0B8B0929292606060C0B0A0929292606060C0A090775E46FF00
                    FFFF00FFFF00FFFF00FF8C8C8CDEDEDE929292606060B8B8B8929292606060AE
                    AEAE929292606060A0A0A05C5C5CFF00FFFF00FFFF00FFFF00FFA58D85F0E0E0
                    C8C8C8838383D0C0B0C8C8C8838383C0B0A0C8C8C8838383C0A890775E46FF00
                    FFFF00FFFF00FFFF00FF8D8D8DE2E2E2C8C8C8838383BEBEBEC8C8C8838383AE
                    AEAEC8C8C8838383A5A5A55C5C5CFF00FFFF00FFFF00FFFF00FFA59585F0E8E0
                    E0D0C0D0C8C0D0C0C0D0C0B0D0B8B0D0B8B0C0B0A0C0B0A0C0A8A0776655FF00
                    FFFF00FFFF00FFFF00FF939393E7E7E7CECECEC7C7C7C2C2C2BEBEBEB8B8B8B8
                    B8B8AEAEAEAEAEAEA8A8A8646464FF00FFFF00FFFF00FFFF00FFA59C94FFE8E0
                    929292606060E0C8C0929292606060D0B8B0929292606060C0B0A0866655FF00
                    FFFF00FFFF00FFFF00FF9B9B9BE9E9E9929292606060C9C9C9929292606060B8
                    B8B8929292606060AEAEAE666666FF00FFFF00FFFF00FFFF00FFB4A494FFF0F0
                    C8C8C8838383E0D0C0C8C8C8838383D0C0B0C8C8C8838383D0B0A0866D55FF00
                    FFFF00FFFF00FFFF00FFA2A2A2F2F2F2C8C8C8838383CECECEC8C8C8838383BE
                    BEBEC8C8C8838383AFAFAF6B6B6BFF00FFFF00FFFF00FFFF00FFB4A4A3FFF0F0
                    E0E0E0E0D8D0E0D0D0E0D0D0E0C8C0D0C8C0C0C8C0406070D0B8B0866D55FF00
                    FFFF00FFFF00FFFF00FFA6A6A6F2F2F2E0E0E0D7D7D7D2D2D2D2D2D2C9C9C9C7
                    C7C7C6C6C6626262B8B8B86B6B6BFF00FFFF00FFFF00FFFF00FFB4ABA3FFF8F0
                    929292E0E8F0607880E0E0E0606060C0C8D050607030A8D0203840B0A0A0FF00
                    FFFF00FFFF00FFA9B28DAAAAAAF7F7F7929292EAEAEA787878E0E0E0606060CA
                    CACA636363ADADAD383838A2A2A2FF00FFFF00FFFF00FFABABABB4ABA3FFF8F0
                    C8C8C890A8B080D0E0506070B0B8C050607060C0E050607030B8F01028301030
                    40102830767473407840AAAAAAF7F7F7C8C8C8A8A8A8D0D0D0636363B9B9B963
                    6363C3C3C3636363C1C1C12828283232322828287474746C6C6CB4B3A3FBF9F7
                    E0E0E0E0E8F090A8B080E0F050607080D0E050607060D0F040607030B0E02098
                    D02088B0205070508860B0B0B0F9F9F9E0E0E0EAEAEAA8A8A8DFDFDF636363D0
                    D0D0636363D2D2D2626262B7B7B7A2A2A28E8E8E5656567D7D7DDAC7C0BEB3A9
                    F0E8E0F0E8E0E0E8F090A8B080E0F050607080E0F040587060D0F050C8F040C0
                    F020B0E020A0D0609870C7C7C7B2B2B2E7E7E7E7E7E7EAEAEAA8A8A8DFDFDF63
                    6363DFDFDF5D5D5DD2D2D2CCCCCCC6C6C6B7B7B7A7A7A78D8D8DFF00FFDAC7C0
                    B0A8A0B0A8A0B0A090E0E8F090A8B080E0F040587080E0F070D8F060D0F050C8
                    F040C0F030B8F070A880FF00FFC7C7C7A7A7A7A7A7A79E9E9EEAEAEAA8A8A8DF
                    DFDF5D5D5DDFDFDFD9D9D9D2D2D2CCCCCCC6C6C6C1C1C19D9D9DFF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFE0E8F090A8B080E0F080E0F080E0F070D8F060D0
                    F060B0D0808890B0C0A0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFEAEAEAA8
                    A8A8DFDFDFDFDFDFDFDFDFD9D9D9D2D2D2B3B3B3898989B9B9B9FF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFE0E8F090A8B090A0B090A0A08098A08090
                    A0808890BEB7B2A0B8A0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFEA
                    EAEAA8A8A8A3A3A39F9F9F989898939393898989B7B7B7B2B2B2}
                  Caption = ''
                  ParentColor = False
                  Color = clWindow
                  OnClick = sbtnEditBoxQtyClick
                end
                inherited DBEdit1: TUniDBEdit
                  Left = 128
                  Top = 10
                  Width = 28
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  ExplicitLeft = 128
                  ExplicitTop = 10
                  ExplicitWidth = 28
                end
                inherited DBCheckBox1: TUniDBCheckBox
                  Top = 43
                  Width = 82
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  ExplicitTop = 43
                  ExplicitWidth = 82
                end
              end
              inherited tabFile: TUniTabSheet
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                ExplicitLeft = 4
                ExplicitTop = 24
                ExplicitWidth = 730
                ExplicitHeight = 229
                inherited PnlClient01: TUniPanel
                  Width = 730
                  Height = 229
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  ExplicitWidth = 730
                  ExplicitHeight = 229
                  inherited Splitter2: TUniSplitter
                    Height = 229
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    ExplicitHeight = 229
                  end
                  inherited PnlDestFileLeft01: TUniPanel
                    Height = 227
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    ExplicitHeight = 227
                    inherited Label3: TUniLabel
                      Margins.Left = 2
                      Margins.Top = 2
                      Margins.Right = 2
                      Margins.Bottom = 2
                    end
                    inherited Label2: TUniLabel
                      Margins.Left = 2
                      Margins.Top = 2
                      Margins.Right = 2
                      Margins.Bottom = 2
                    end
                  end
                  inherited PnlClient02: TUniPanel
                    Width = 643
                    Height = 227
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    ExplicitWidth = 643
                    ExplicitHeight = 227
                    inherited pnpFileRight: TUniPanel
                      Left = 614
                      Height = 225
                      Margins.Left = 2
                      Margins.Top = 2
                      Margins.Right = 2
                      Margins.Bottom = 2
                      ExplicitLeft = 614
                      ExplicitHeight = 225
                      inherited btnSaveFile: TUniSpeedButton
                        Margins.Left = 2
                        Margins.Top = 2
                        Margins.Right = 2
                        Margins.Bottom = 2
                      end
                    end
                    inherited PnlDestFileCtrls: TUniPanel
                      Width = 614
                      Height = 225
                      Margins.Left = 2
                      Margins.Top = 2
                      Margins.Right = 2
                      Margins.Bottom = 2
                      ExplicitWidth = 614
                      ExplicitHeight = 225
                      inherited cboxFileType: TUniComboBox
                        Width = 615
                        Margins.Left = 2
                        Margins.Top = 2
                        Margins.Right = 2
                        Margins.Bottom = 2
                        ExplicitWidth = 615
                      end
                      inherited edSaveFile: TUniDBEdit
                        Width = 582
                        Margins.Left = 2
                        Margins.Top = 2
                        Margins.Right = 2
                        Margins.Bottom = 2
                        ExplicitWidth = 582
                      end
                    end
                  end
                end
              end
              inherited tabEmail: TUniTabSheet
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                ExplicitLeft = 4
                ExplicitTop = 24
                ExplicitWidth = 730
                ExplicitHeight = 229
                inherited ScrollBoxEmail: TUniScrollBox
                  Width = 730
                  Height = 229
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  ExplicitWidth = 730
                  ExplicitHeight = 229
                  ScrollWidth = 130
                  inherited Splitter3: TUniSplitter
                    Height = 227
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                    ExplicitHeight = 227
                  end
                  inherited PnlDestEMailClient01: TUniPanel
                    Width = 598
                    Height = 227
                    ExplicitWidth = 598
                    inherited sbtnAssignEmail: TUniSpeedButton
                      Left = 473
                      ExplicitLeft = 473
                    end
                    inherited sbtnAssignEmailBcc: TUniSpeedButton
                      Left = 473
                      ExplicitLeft = 473
                    end
                    inherited sbtnAssignEMailSender: TUniSpeedButton
                      Left = 473
                      ExplicitLeft = 473
                    end
                    inherited DBNavigator1: TUniDBNavigator
                      Left = 495
                      ExplicitLeft = 495
                    end
                    inherited dbeEMailSubject: TUniDBEdit
                      Width = 471
                      ExplicitWidth = 471
                    end
                    inherited cboxEMailFileType: TUniComboBox
                      Width = 471
                      ExplicitWidth = 471
                    end
                    inherited EdAttachmentName: TUniEdit
                      Width = 471
                      ExplicitWidth = 471
                    end
                    inherited dbeBCC: TUniDBEdit
                      Width = 471
                      ExplicitWidth = 471
                    end
                    inherited memoEmailTo: TUniDBMemo
                      Width = 471
                      ExplicitWidth = 471
                    end
                    inherited memoEmail: TUniDBMemo
                      Left = 3
                      Top = 169
                      Width = 471
                      Height = 76
                      ExplicitLeft = 3
                      ExplicitTop = 169
                      ExplicitWidth = 471
                      ExplicitHeight = 76
                    end
                    inherited dbeEMailSender: TUniDBEdit
                      Width = 471
                      ExplicitWidth = 471
                    end
                  end
                  inherited PnlDestEMailLeft01: TUniPanel
                    Height = 227
                  end
                end
              end
              inherited tabFax: TUniTabSheet
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                ExplicitLeft = 4
                ExplicitTop = 24
                ExplicitWidth = 730
                ExplicitHeight = 229
                inherited pnlFaxRight: TUniPanel
                  Left = 702
                  Height = 229
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  ExplicitLeft = 702
                  ExplicitHeight = 229
                  inherited sbtnFax: TUniSpeedButton
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                  end
                  inherited sbtnFaxSetup: TUniSpeedButton
                    Margins.Left = 2
                    Margins.Top = 2
                    Margins.Right = 2
                    Margins.Bottom = 2
                  end
                end
                inherited lviewFaxRecipients: TListView
                  Width = 702
                  Height = 229
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Columns = <
                    item
                      Caption = 'To'
                      Width = 42
                    end
                    item
                      Caption = 'Organization'
                      Width = 54
                    end
                    item
                      Caption = 'Fax #'
                      Width = 70
                    end>
                  ExplicitWidth = 702
                  ExplicitHeight = 229
                end
              end
            end
          end
          inherited PnlDestBtns: TUniPanel
            Width = 740
            Height = 42
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            ExplicitWidth = 740
            ExplicitHeight = 42
            inherited sbtnDest_Screen: TUniSpeedButton
              Width = 120
              Height = 36
              ExplicitWidth = 120
              ExplicitHeight = 36
            end
            inherited sbtnDest_Printer: TUniSpeedButton
              Left = 129
              Width = 120
              Height = 36
              ExplicitLeft = 129
              ExplicitWidth = 120
              ExplicitHeight = 36
            end
            inherited sbtnDest_File: TUniSpeedButton
              Left = 255
              Width = 120
              Height = 36
              ExplicitLeft = 255
              ExplicitWidth = 120
              ExplicitHeight = 36
            end
            inherited sbtnDest_EMail: TUniSpeedButton
              Left = 381
              Width = 120
              Height = 36
              ExplicitLeft = 381
              ExplicitWidth = 120
              ExplicitHeight = 36
            end
            inherited sbtnDest_Fax: TUniSpeedButton
              Left = 507
              Width = 120
              Height = 36
              ExplicitLeft = 507
              ExplicitWidth = 120
              ExplicitHeight = 36
            end
          end
        end
      end
    end
    inherited pnlButtons: TUniPanel
      Top = 539
      Width = 750
      Height = 47
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      ExplicitTop = 539
      ExplicitWidth = 750
      ExplicitHeight = 47
      inherited Panel3: TUniPanel
        Left = 86
        Width = 664
        Height = 45
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        ExplicitLeft = 86
        ExplicitWidth = 664
        ExplicitHeight = 45
        inherited btnPrint: TUniBitBtn
          Left = 165
          Top = 1
          Width = 160
          Height = 40
          ExplicitLeft = 165
          ExplicitTop = 1
          ExplicitWidth = 160
          ExplicitHeight = 40
        end
        inherited btnCurrent: TUniBitBtn
          Left = 330
          Top = 1
          Width = 160
          Height = 40
          ExplicitLeft = 330
          ExplicitTop = 1
          ExplicitWidth = 160
          ExplicitHeight = 40
        end
        inherited btnExit: TUniBitBtn
          Left = 495
          Top = 1
          Width = 160
          Height = 40
          ExplicitLeft = 495
          ExplicitTop = 1
          ExplicitWidth = 160
          ExplicitHeight = 40
        end
        inherited btnSetUp: TUniBitBtn
          Top = 1
          Width = 160
          Height = 40
          ExplicitTop = 1
          ExplicitWidth = 160
          ExplicitHeight = 40
        end
      end
    end
  end
end
