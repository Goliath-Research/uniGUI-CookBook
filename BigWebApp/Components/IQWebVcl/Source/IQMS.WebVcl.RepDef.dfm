object frmRepDef: TfrmRepDef
  Left = 68
  Top = 273
  ClientHeight = 582
  ClientWidth = 614
  Caption = 'Registered Reports'
  OnShow = FormShow
  OnResize = FormResize
  OldCreateOrder = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  KeyPreview = True
  MonitoredKeys.Keys = <>
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCarrier: TUniPanel
    Left = 0
    Top = 0
    Width = 614
    Height = 582
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 1
      Top = 216
      Width = 612
      Height = 3
      Cursor = crVSplit
      Hint = ''
      OnMoved = Splitter1Moved
      Align = alBottom
      ParentColor = False
      Color = clBtnFace
      ExplicitLeft = 0
      ExplicitTop = 217
      ExplicitWidth = 614
    end
    object Panel2: TUniPanel
      Left = 1
      Top = 1
      Width = 612
      Height = 215
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Bevel1: TUniPanel
        Left = 1
        Top = 28
        Width = 610
        Height = 3
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        Caption = ''
        ExplicitTop = 27
      end
      inline dbgReports: TIQUniGridControl
        Left = 1
        Top = 57
        Width = 610
        Height = 157
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        TabOrder = 2
        ParentFont = False
        ExplicitLeft = 1
        ExplicitTop = 57
        ExplicitWidth = 610
        ExplicitHeight = 157
        inherited PageControl: TUniPageControl
          Width = 610
          Height = 128
          ExplicitWidth = 610
          ExplicitHeight = 128
        end
        inherited TopToolBar: TUniToolBar
          Width = 610
        end
      end
      object PnlToolbarMain: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 610
        Height = 27
        Hint = ''
        Visible = False
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        object sbtnUnHideAll: TUniSpeedButton
          Left = 1
          Top = 1
          Width = 25
          Height = 25
          Hint = 'Unhide all the reports on this menu'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C21E0000C21E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF034464FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF034464FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFD78300663333663333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            034464FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF663333663333FF9900CC66
            00663333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF034464FFFFFFFFFFFFFFFFFFFF
            FFFF663333CC6600CC6600FFE2B4FF9900CC6600663333FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF034464FFFFFFFFFFFFFFFFFF663333CC6600CC6600CC6600FFE2
            B4FF9900CC6600663333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF034464FFFFFFFF
            FFFF663333FF9900CC6600CC6600CC6600FFE2B4FF9900663333000080FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF034464663333000080FFE2B4FF9900CC6600CC66
            00663333663333FFFFFF000080000080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
            0080CC6600CC6600FFE2B4FF9900663333FFFFFFFFFFFFFFFFFFFFFFFF000080
            000080FFFFFFFFFFFFFFFFFF000080FFFFFF034464CC6600CC6600FFE2B46633
            33FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000080000080000080000080FFFFFFFF
            FFFFFFFFFF034464CC6600CC6600663333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF000080000080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF034464663333FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000080000080000080000080FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF034464FFFFFFFFFFFFFFFFFFFFFFFF000080000080
            000080FFFFFFFFFFFF000080000080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0344
            64FFFFFFFFFFFFFFFFFF000080000080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
            0080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          Caption = ''
          ParentColor = False
          Color = clWindow
          TabOrder = 2
          OnClick = sbtnUnHideAllClick
        end
        object NavMain: TUniDBNavigator
          Left = 536
          Top = 1
          Width = 74
          Height = 25
          Hint = ''
          ShowHint = True
          ParentShowHint = False
          DataSource = SrcRepDef
          VisibleButtons = [nbPost, nbCancel, nbRefresh]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
      object pnlReportSearch: TUniPanel
        Left = 1
        Top = 31
        Width = 610
        Height = 26
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Caption = ''
        ExplicitTop = 30
      end
    end
    object pnlGrid: TUniPanel
      Left = 1
      Top = 219
      Width = 612
      Height = 326
      Hint = ''
      Constraints.MinHeight = 184
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      ExplicitTop = 220
      object PageControl1: TUniPageControl
        Left = 1
        Top = 1
        Width = 610
        Height = 324
        Hint = ''
        ActivePage = TabSheet1
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        object TabSheet1: TUniTabSheet
          Hint = ''
          Caption = 'Selection Criteria'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 256
          ExplicitHeight = 128
          object Bevel2: TUniPanel
            Left = 0
            Top = 27
            Width = 602
            Height = 3
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            Caption = ''
          end
          object dbgParams: TUniDBGrid
            Left = 0
            Top = 30
            Width = 602
            Height = 266
            Hint = ''
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clBlack
            DataSource = SrcRepDef_Criteria
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
            LoadMask.Message = 'Loading data...'
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            OnDrawColumnCell = dbgParamsDrawColumnCell
            Columns = <
              item
                FieldName = 'DESCRIP'
                Title.Caption = 'Parameter'
                Width = 154
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                ReadOnly = True
              end
              item
                FieldName = 'UNARY_OPERATOR'
                Title.Caption = '    '
                Width = 38
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                PickList.Strings = (
                  '='
                  'NOT')
              end
              item
                FieldName = 'LIKE_OPERATOR'
                Title.Caption = 'Use Like'
                Width = 51
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                PickList.Strings = (
                  'Y'
                  'N')
              end
              item
                FieldName = 'RANGE_START'
                Title.Caption = 'From'
                Width = 97
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
              end
              item
                FieldName = 'RANGE_END'
                Title.Caption = 'To'
                Width = 107
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
              end
              item
                FieldName = 'BINARY_OPERATOR'
                Title.Caption = 'And / Or'
                Width = 60
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                PickList.Strings = (
                  'AND'
                  'OR')
              end
              item
                FieldName = 'INCLUDE_NULLS'
                Title.Caption = 'Include Nulls'
                Width = 72
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                PickList.Strings = (
                  'N'
                  'Y')
              end>
          end
          object PnlFilterToolbar: TUniPanel
            Tag = 1999
            Left = 0
            Top = 0
            Width = 602
            Height = 27
            Hint = ''
            ShowHint = True
            ParentShowHint = False
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            Caption = ''
            object sbtnClear: TUniSpeedButton
              Left = 1
              Top = 1
              Width = 25
              Height = 25
              Hint = 'Clear Selection Criteria'
              ShowHint = True
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD17DDDD
                DDD7DDDDDD7FDDDDDDDFDDDDDD117DDDDD17DDDDDD77FDDDDD7FDDDDDD711DDD
                D71DDDDDDDD77DDDDF7DDDDDDDD117DD117DDDDDDFF77FDD77FDDDDD00071177
                11DDDDDD777F77FF77DDDDDD060D11111DDDDDDD7D7F77777DDDDDDD080D7111
                DDDDDDDD7D7FD777DDDDDDDD087711117DDDDDDD7D7F7777FDDDDDD081111DD1
                17DDDDD7F7777DD77FDDDD0881167DDD117DDD7FD77D7FFD77FDD06FF88860DD
                D11DD7FDDDDDD7FDD77DD000000000DDDDDDD777777777DDDDDDDDDDDDDDDDDD
                DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
              Caption = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              ParentColor = False
              Color = clWindow
              TabOrder = 2
              OnClick = sbtnClearClick
            end
            object sbtnSelectCriteria: TUniSpeedButton
              Left = 34
              Top = 1
              Width = 25
              Height = 25
              Hint = 'Select Selection Criteria'
              ShowHint = True
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
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              ParentColor = False
              Color = clWindow
              TabOrder = 3
              OnClick = sbtnSelectCriteriaClick
            end
            object sbtnSaveCriteria: TUniSpeedButton
              Left = 59
              Top = 1
              Width = 25
              Height = 25
              Hint = 'Save Selection Criteria'
              ShowHint = True
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
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              ParentColor = False
              Color = clWindow
              TabOrder = 4
              OnClick = sbtnSaveCriteriaClick
            end
            object bvlCruteriaTool: TUniPanel
              AlignWithMargins = True
              Left = 28
              Top = 3
              Width = 3
              Height = 21
              Hint = ''
              ShowHint = True
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 5
              Caption = ''
            end
            object NavParams: TUniDBNavigator
              Left = 423
              Top = 1
              Width = 179
              Height = 25
              Hint = ''
              ShowHint = True
              DataSource = SrcRepDef_Criteria
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel, nbRefresh]
              Align = alRight
              Anchors = [akTop, akRight, akBottom]
              TabOrder = 0
            end
          end
        end
        object TabSheet2: TUniTabSheet
          Hint = ''
          Caption = 'Destination'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 256
          ExplicitHeight = 128
          object PnlDestCarrier: TUniPanel
            Left = 0
            Top = 31
            Width = 602
            Height = 265
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            object pgctrDestination: TUniPageControl
              Left = 1
              Top = 1
              Width = 600
              Height = 263
              Hint = ''
              ActivePage = tabFile
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
              OnChange = pgctrDestinationChange
              object tabScreen: TUniTabSheet
                Hint = ''
                Caption = 'Screen'
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 256
                ExplicitHeight = 128
                object Label4: TUniLabel
                  Left = 8
                  Top = 12
                  Width = 70
                  Height = 13
                  Hint = ''
                  Caption = 'Print to screen'
                  TabOrder = 0
                end
              end
              object tabPrinter: TUniTabSheet
                Hint = ''
                ImageIndex = 1
                Caption = 'Printer'
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 256
                ExplicitHeight = 128
                object Label1: TUniLabel
                  Left = 8
                  Top = 12
                  Width = 83
                  Height = 13
                  Hint = ''
                  Caption = 'Number of copies'
                  TabOrder = 2
                end
                object DBEdit1: TUniDBEdit
                  Left = 120
                  Top = 8
                  Width = 33
                  Height = 21
                  Hint = ''
                  DataField = 'NUM_COPIES'
                  DataSource = SrcRepDef
                  TabOrder = 0
                end
                object DBCheckBox1: TUniDBCheckBox
                  Left = 8
                  Top = 40
                  Width = 126
                  Height = 17
                  Hint = ''
                  DataField = 'COLLATE'
                  DataSource = SrcRepDef
                  ValueChecked = 'Y'
                  ValueUnchecked = 'N'
                  Caption = 'Collated'
                  TabOrder = 1
                end
              end
              object tabFile: TUniTabSheet
                Hint = ''
                ImageIndex = 2
                Caption = 'File'
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 256
                ExplicitHeight = 128
                object PnlClient01: TUniPanel
                  Left = 0
                  Top = 0
                  Width = 592
                  Height = 235
                  Hint = ''
                  Align = alClient
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  TabOrder = 0
                  Caption = ''
                  object Splitter2: TUniSplitter
                    Left = 82
                    Top = 1
                    Width = 6
                    Height = 233
                    Hint = ''
                    Align = alLeft
                    ParentColor = False
                    Color = clBtnFace
                    ExplicitLeft = 81
                    ExplicitTop = 0
                    ExplicitHeight = 235
                  end
                  object PnlDestFileLeft01: TUniPanel
                    Left = 1
                    Top = 1
                    Width = 81
                    Height = 233
                    Hint = ''
                    Align = alLeft
                    Anchors = [akLeft, akTop, akBottom]
                    TabOrder = 0
                    Caption = ''
                    object Label3: TUniLabel
                      Left = 8
                      Top = 12
                      Width = 43
                      Height = 13
                      Hint = ''
                      Caption = 'File Type'
                      TabOrder = 1
                    end
                    object Label2: TUniLabel
                      Left = 8
                      Top = 36
                      Width = 46
                      Height = 13
                      Hint = ''
                      Caption = 'File Name'
                      TabOrder = 2
                    end
                  end
                  object PnlClient02: TUniPanel
                    Left = 88
                    Top = 1
                    Width = 503
                    Height = 233
                    Hint = ''
                    Align = alClient
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    TabOrder = 1
                    Caption = ''
                    ExplicitLeft = 87
                    ExplicitWidth = 505
                    object pnpFileRight: TUniPanel
                      Left = 473
                      Top = 1
                      Width = 29
                      Height = 231
                      Hint = ''
                      Align = alRight
                      Anchors = [akTop, akRight, akBottom]
                      TabOrder = 0
                      Caption = ''
                      ExplicitLeft = 476
                      object btnSaveFile: TUniSpeedButton
                        Left = 1
                        Top = 32
                        Width = 22
                        Height = 22
                        Hint = 'Browse for file'
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
                        ParentFont = False
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clBlack
                        Font.Height = -12
                        Font.Style = [fsBold]
                        ParentColor = False
                        Color = clWindow
                        TabOrder = 1
                        OnClick = btnSaveFileClick
                      end
                    end
                    object PnlDestFileCtrls: TUniPanel
                      Left = 1
                      Top = 1
                      Width = 472
                      Height = 231
                      Hint = ''
                      Align = alClient
                      Anchors = [akLeft, akTop, akRight, akBottom]
                      TabOrder = 1
                      Caption = ''
                      ExplicitWidth = 476
                      DesignSize = (
                        472
                        231)
                      object cboxFileType: TUniComboBox
                        Left = 1
                        Top = 8
                        Width = 472
                        Height = 21
                        Hint = ''
                        Style = csDropDownList
                        Text = ''
                        Items.Strings = (
                          'RTF (Word)'
                          'RTF'
                          'Comma Delimited'
                          'Ascii'
                          'AdobeAcrobatPDF'
                          'Excel'
                          'HTML4')
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 3
                        OnCloseUp = cboxFileTypeCloseUp
                      end
                      object edSaveFile: TUniDBEdit
                        Left = 1
                        Top = 32
                        Width = 472
                        Height = 21
                        Hint = ''
                        DataField = 'FILE_NAME'
                        DataSource = SrcRepDef
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        Color = clBtnFace
                        ReadOnly = True
                        OnChange = edSaveFileChange
                      end
                      object chkOpenFileUponSaving: TUniCheckBox
                        Left = 1
                        Top = 56
                        Width = 97
                        Height = 17
                        Hint = ''
                        Caption = 'Open File Upon Saving'
                        TabOrder = 2
                      end
                    end
                  end
                end
              end
              object tabEmail: TUniTabSheet
                Hint = ''
                ImageIndex = 3
                Caption = 'Email'
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 256
                ExplicitHeight = 128
                object ScrollBoxEmail: TUniScrollBox
                  Left = 0
                  Top = 0
                  Width = 592
                  Height = 235
                  Hint = ''
                  Align = alClient
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  TabOrder = 0
                  ScrollWidth = 130
                  object Splitter3: TUniSplitter
                    Left = 124
                    Top = 0
                    Width = 6
                    Height = 233
                    Hint = ''
                    Align = alLeft
                    ParentColor = False
                    Color = clBtnFace
                  end
                  object PnlDestEMailClient01: TUniPanel
                    Left = 130
                    Top = 0
                    Width = 460
                    Height = 233
                    Hint = ''
                    Align = alClient
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    TabOrder = 0
                    Caption = ''
                    ParentColor = True
                    DesignSize = (
                      460
                      233)
                    object sbtnAssignEmail: TUniSpeedButton
                      Left = 382
                      Top = 1
                      Width = 22
                      Height = 22
                      Hint = 'Add '#39'TO'#39' Address'
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
                      Anchors = [akTop, akRight]
                      ParentColor = False
                      Color = clWindow
                      TabOrder = 8
                      OnClick = sbtnAssignEmailClick
                    end
                    object sbtnAssignEmailBcc: TUniSpeedButton
                      Left = 382
                      Top = 93
                      Width = 22
                      Height = 22
                      Hint = 'Add '#39'Bcc'#39' Address'
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
                      Anchors = [akTop, akRight]
                      ParentColor = False
                      Color = clWindow
                      TabOrder = 9
                      OnClick = sbtnAssignEmailClick
                    end
                    object sbtnAssignEMailSender: TUniSpeedButton
                      Left = 382
                      Top = 72
                      Width = 22
                      Height = 22
                      Hint = 'Assign '#39'Sender'#39' Address'
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
                      Anchors = [akTop, akRight]
                      ParentColor = False
                      Color = clWindow
                      TabOrder = 10
                      OnClick = sbtnAssignEMailSenderClick
                    end
                    object DBNavigator1: TUniDBNavigator
                      Left = 404
                      Top = 1
                      Width = 44
                      Height = 22
                      Hint = ''
                      DataSource = SrcRepDef_EMail
                      VisibleButtons = [nbPost, nbCancel]
                      Anchors = [akTop, akRight]
                      TabOrder = 1
                    end
                    object dbeEMailSubject: TUniDBEdit
                      Left = 1
                      Top = 46
                      Width = 380
                      Height = 21
                      Hint = ''
                      DataField = 'EMAIL_SUBJECT'
                      DataSource = SrcRepDef_EMail
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                    end
                    object cboxEMailFileType: TUniComboBox
                      Left = 1
                      Top = 119
                      Width = 380
                      Height = 21
                      Hint = ''
                      Style = csDropDownList
                      Text = ''
                      Items.Strings = (
                        'RTF (Word)'
                        'RTF'
                        'Comma Delimited'
                        'Ascii'
                        'AdobeAcrobatPDF'
                        'Excel'
                        'HTML4'
                        'Excel - Data Only')
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 11
                    end
                    object EdAttachmentName: TUniEdit
                      Left = 1
                      Top = 142
                      Width = 380
                      Height = 21
                      Hint = ''
                      Text = ''
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 6
                    end
                    object dbeBCC: TUniDBEdit
                      Left = 1
                      Top = 94
                      Width = 380
                      Height = 21
                      Hint = ''
                      DataField = 'EMAIL_BCC'
                      DataSource = SrcRepDef_EMail
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 4
                    end
                    object memoEmailTo: TUniDBMemo
                      Left = 1
                      Top = 2
                      Width = 380
                      Height = 40
                      Hint = ''
                      DataField = 'EMAIL_TO'
                      DataSource = SrcRepDef_EMail
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 0
                    end
                    object memoEmail: TUniDBMemo
                      Left = 1
                      Top = 167
                      Width = 380
                      Height = 103
                      Hint = ''
                      DataField = 'EMAIL_BODY'
                      DataSource = SrcRepDef_EMail
                      Anchors = [akLeft, akTop, akRight, akBottom]
                      TabOrder = 7
                    end
                    object dbeEMailSender: TUniDBEdit
                      Left = 1
                      Top = 70
                      Width = 380
                      Height = 21
                      Hint = ''
                      DataField = 'EMAIL_SENDER'
                      DataSource = SrcRepDef_EMail
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 3
                    end
                  end
                  object PnlDestEMailLeft01: TUniPanel
                    Left = 0
                    Top = 0
                    Width = 124
                    Height = 233
                    Hint = ''
                    Align = alLeft
                    Anchors = [akLeft, akTop, akBottom]
                    TabOrder = 1
                    Caption = ''
                    ParentColor = True
                    object Label5: TUniLabel
                      Left = 8
                      Top = 5
                      Width = 12
                      Height = 13
                      Hint = ''
                      Caption = 'To'
                      TabOrder = 1
                    end
                    object Label6: TUniLabel
                      Left = 8
                      Top = 49
                      Width = 36
                      Height = 13
                      Hint = ''
                      Caption = 'Subject'
                      TabOrder = 2
                    end
                    object Label7: TUniLabel
                      Left = 8
                      Top = 120
                      Width = 56
                      Height = 13
                      Hint = ''
                      Caption = 'Attachment'
                      TabOrder = 3
                    end
                    object Label8: TUniLabel
                      Left = 8
                      Top = 145
                      Width = 86
                      Height = 13
                      Hint = ''
                      Caption = 'Attachment Name'
                      TabOrder = 4
                    end
                    object Label10: TUniLabel
                      Left = 8
                      Top = 97
                      Width = 16
                      Height = 13
                      Hint = ''
                      Caption = 'Bcc'
                      TabOrder = 5
                    end
                    object lblSender: TUniLabel
                      Left = 8
                      Top = 72
                      Width = 34
                      Height = 13
                      Hint = ''
                      Caption = 'Sender'
                      TabOrder = 6
                    end
                  end
                end
              end
              object tabFax: TUniTabSheet
                Hint = ''
                ImageIndex = 4
                Caption = 'Fax'
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 256
                ExplicitHeight = 128
                object pnlFaxRight: TUniPanel
                  Left = 564
                  Top = 0
                  Width = 28
                  Height = 235
                  Hint = ''
                  Align = alRight
                  Anchors = [akTop, akRight, akBottom]
                  TabOrder = 0
                  Caption = ''
                  object sbtnFax: TUniSpeedButton
                    Left = 3
                    Top = 1
                    Width = 23
                    Height = 22
                    Hint = 'Add fax information'
                    ShowHint = True
                    ParentShowHint = False
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFC1C1C1FF00FF164E010963000963001750
                      01FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAFACAA92847D695F5C59
                      5E52045E0000D81D00D70000D70400DA391C5D05FF00FFFF00FFCBCBCBA19F9F
                      827873948177D2B4A4FFE9DBF1D5C504600100DC5700D820FFFFFFFAFAFA00DA
                      3600DC671C5D05FF00FF72717192796CF9EEE8FFF9F4FFFDF8FFFFFC1C5D0531
                      DF8800DC5E00DA39FFFFFFFAFAFA00DA4800DD6B43E4971C5A01BEBEBE676563
                      9E8A7EF8F3F1FFFFFFFFFFFF1C5D0523DD80FEFEFEFAFAFAFFFFFFFAFAFAFAFA
                      FAFFFFFF18DD791C5D054C4C4C7373735D58536B5A5487827F6A615C1C5D0500
                      DD6BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00DD6E1C5D059D9D9D767676
                      BEACA3AD9B90DCC1B2FCE6DC1C5D0500DC6200DD6E4FDF95FFFFFFFFFFFF5BDF
                      9B18DD791DE2821C5D05FF00FFB4B3B16F6056AA947FFFF7F0F3E7E0D5D5D51C
                      5D0512DD7779E0AAFFFFFFFFFFFF70E0A623DD801C5D05B7AAA1FF00FFAD9F90
                      34302E5C5148DBCEC2F5F0ED9494947070701C5D0500DD6775E0A859E09900DF
                      691C5D05EFD8C7D0CCCAFF00FFC5BFBA3B3530332D29877767FBF7F58B8B8C46
                      46484E4E4E1C5D051C5D051C5D051C5D05666363A48F7FFF00FFFF00FFFF00FF
                      A4948546423F574E46766459CEC4BB7E7A777B797770706F5252514C4C4C4C4C
                      4C4C4C4C725B50FF00FFFF00FFFF00FFFF00FFA8988A6A625D6C615D9B8A7A92
                      78695757575757575757575757575757575757575E5046CAC9C8FF00FFFF00FF
                      FF00FFFF00FFC7C3C0C0B8B0CCCBCBB8ABA2665C56666666685E58967D6E665B
                      54666666665953C6C1BEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC6
                      C2BF705C5273737370645ECBCAC971615873737370615AC8C6C4FF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFCBCAC9745E537F7F7F7B716CC6C1BE7D66
                      5A7F6C5FA18A7CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FFA48B7A9274628D705ECAC9C8C8C5C4FF00FFFF00FFFF00FF}
                    Caption = ''
                    ParentColor = False
                    Color = clWindow
                    TabOrder = 1
                    OnClick = sbtnFaxClick
                  end
                  object sbtnFaxSetup: TUniSpeedButton
                    Left = 3
                    Top = 24
                    Width = 23
                    Height = 22
                    Hint = 'Setup fax polling parameters'
                    ShowHint = True
                    ParentShowHint = False
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8986864D27254F24226C5E
                      5ECACACAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF92
                      92926159594A42426428007E36024423236C6A6A837E7EFF00FFFF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFB5B5B55C37256F2C0C66280F793B05793D046F3D
                      1461250B561A00A5A5A5FF00FFC9CACB2669AA3089C54882B76485AE4A495675
                      380E9B6B38834D1A61554D685F5B723618976730915D255A413AFF00FFB2BBC6
                      1C6BA933C1F632C3F82EBFF8238EBF243542A6733A483F43708DB295A5BB6F64
                      61A877436A483B7B7776FF00FF9BAABF1A7EB9329FD53CD1FB3BCFFA2B779066
                      5342CAA580605A5932A3D2309ACF344852C59A716F534A8E8D8CFF00FF7E98B6
                      1C83BF2A7EB64ADCFD49DCFD308293BD956EF2D3B6CEAB8B604C46534B4BCFB0
                      8CE7CEB6CDA784685B57FF00FF6A8CB11E84BE2872A951D4F356E4FF52DFFA49
                      5D5D615747817E69FFE8CEF5DDBF927D69B68A75867159BCBCBCFF00FF5980AA
                      218FCB308FC14BAED466EAFF61E9FF5BDFF44DC0D33E5748FAE1C3DBBFAA2D58
                      64337B9077818FFF00FFFF00FF4A7BAA2BAAE041C1ED46ACDA4DAAD555B0D758
                      B4D869D5ED58A7B2546E7253545D4EA2B163EAFF6993BCFF00FFB9BDC42277B4
                      3CBFED51D2F55DDBF964E0FD6CE6FD67CDE959A9CD5295C18BE3F477D4ED8EF4
                      FF85F3FF64B2D5C0C4C98390A82E99D34DD0F65EDCFA66E2FD6FE7FF76ECFF7D
                      EEFF85EEFF8AE8FA76ADD096DAEEAFF9FFA5F9FF99F0FC8499B76173973FBDED
                      59D9FA63E0FD69E5FD71E9FF79ECFF81EDFF89EDFF91EDFF84D0EC537EAF708E
                      B56B90B872A5CA6786B1768DAE44A3D255C6EB5FDCF967E7FF6FEAFF78EAFF81
                      EAFF88EAFF8DEAFC94EAFC6E8CB2FF00FFFF00FFCBCBCCBDC2C9FF00FFBBC1C8
                      A0AEC08799B5748DAF6887AF6086B05C88B45A8DBA5D94C05D97C38FA0B8FF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                    Caption = ''
                    ParentColor = False
                    Color = clWindow
                    TabOrder = 2
                    OnClick = sbtnFaxSetupClick
                  end
                end
                object lviewFaxRecipients: TListView
                  Left = 0
                  Top = 0
                  Width = 564
                  Height = 235
                  Align = alClient
                  Columns = <
                    item
                      Caption = 'To'
                      Width = 70
                    end
                    item
                      Caption = 'Organization'
                      Width = 90
                    end
                    item
                      Caption = 'Fax #'
                      Width = 118
                    end>
                  FlatScrollBars = True
                  ReadOnly = True
                  RowSelect = True
                  TabOrder = 1
                  ViewStyle = vsReport
                end
              end
            end
          end
          object PnlDestBtns: TUniPanel
            Left = 0
            Top = 0
            Width = 602
            Height = 31
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Caption = ''
            object sbtnDest_Screen: TUniSpeedButton
              Tag = 10
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 97
              Height = 25
              Hint = ''
              GroupIndex = 1
              Down = True
              Glyph.Data = {
                36060000424D3606000000000000360400002800000020000000100000000100
                08000000000000020000C21E0000C21E00000001000000000000604830004646
                46006B6B6B00717171007575750076767600797979007A7A7A007B7B7B00C068
                4000C0704000D0784000C0785000D0705000D0785000E0704000E0784000E080
                4000E0805000C0806000D0886000D0887000C0907000E0806000E0886000E090
                6000F0987000F0A07000FF00FF00818181008282820085858500888888008A8A
                8A008B8B8B008E8E8E009090900093939300999999009A9A9A009E9E9E00A0A0
                A000A2A2A200A8A8A800AEAEAE00AFAFAF00B0B0B000B1B1B100B5B5B500B8B8
                B800D0908000D0988000D0A08000E0A08000F0A08000F0A88000FFB08000F0B0
                9000FFB09000FFB89000C0A8A000C0B0A000D0B0A000D0B8A000FFC0A000FFC8
                A000FFC8B000FFD0B000C0C0C000C6C6C600C8C8C800CECECE00D1D1D100D7D7
                D700DADADA00FFD0C000FFD8C000FFD8D000FFE0D000FFE8D000E0E0E000E6E6
                E600E9E9E900EEEEEE00FFE8E000FFF0E000F2F2F200F7F7F700FFF0F000FFF8
                F000FFFFFF000000000000000000000000000000000000000000000000000000
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
                00000000000000000000000000000000000000000000000000001C1C1C1C1C1C
                1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C
                1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C0000000000
                00000000000000001C1C1C010101010101010101010101011C1C3C5855555454
                54544F4E4E4E4E4E001C2B56535352525252515050505050011C3C583335361B
                1A1918121110124E001C2B5626292A292724211E1D081E50011C3D5916403937
                1B1A19170E0D0F4E001C2C5723442E2B2927241F07040550011C3D591642544F
                4E4E4D4C4B0E0F4E001C2C572346525150504A4948070550011C3D5916434140
                3A37361A19170F4E001C2C57234745442F2B2A27241F0550011C3D59164B5554
                544F4E4E4D190F4F001C2C5723485352525150504A240551011C3D59164C4B42
                41403B371B1A0F54001C2C57234948464544312B29270552011C3E5A164E5855
                5540403B3A1B1054001C2D5A23505653534444312F290852011C3E5A164E4D4C
                434240403B381054001C2D5A23504A4947464444312D0852011C3F5A34321615
                14130C0A09090B54001C305A28252322201D060302020652011C3F5A5A5A5A59
                5959595958585555001C305A5A5A5A575757575756565353011C1C3F3F3E3E3D
                3D3D3D3D3C3C3C3C1C1C1C30302D2D2C2C2C2C2C2B2B2B2B1C1C1C1C1C1C1C1C
                1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C}
              Caption = 'Screen'
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              ParentColor = False
              Color = clWindow
              TabOrder = 1
              OnClick = DoDestBtnClick
            end
            object sbtnDest_Printer: TUniSpeedButton
              Tag = 11
              AlignWithMargins = True
              Left = 106
              Top = 3
              Width = 98
              Height = 25
              Hint = ''
              GroupIndex = 1
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFCCCBCBCDC5BEC4BBAFC2B9ADC6C1B8CAC9
                C6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCE
                A483BB875DBD9872BF9A76B68B63A87B4DA57A4AAB875BB7A180FF00FFFF00FF
                C6AFA6B87E63C38F6EC7A289CEAA8FE79977E3B79BF9F5F0F4EDE7EEE3DAE8DA
                CDE0CDBBD8BDA3B0885AFF00FFCCCBCBB87C5CC18660E29252D58349D8926CED
                A888EFD8C6FFFFFFFFFFFFFFFFFFFFFFFFFFFDFDCBAD8ACFA27EFF00FFC4A89A
                CB8654C8ADA6FFFDFDC1A08EC58E69E6C1A3FDF9F4FDFDFAFFFFFFFFFFFFFFFD
                FDCFB291D59671D2BAA5FF00FFC18D71E6B387CBAFA3FFF6EDAB7058AF6E3D9D
                6C40AF7B4CC8905DD59F72EDBB94CBA37AC89B75D08D60CCC6C1FF00FFC79477
                EAD3BED3B19FFDECD5C87055DA683CE67745D27447BA6D44A6633B90562BB168
                3BF9F0E8DBAC8DCCC1B9FF00FFCB9F84E0D3CFEAC19DFDE0C1DA6240F4693CFA
                7244FA7043FA6C3CFA6E3FF77142E7744FFBEDDDD8A380CCC6C1FF00FFCAAB9D
                DAB6A3FFCB92E0AA8EC85937E07B56E78B6AE78A67E3774FDF6437D55D32E09B
                81FDDBBAD19A75FF00FFFF00FFC6AA9ED7A079E8B17FC47655C47854BE7754BC
                7A56B87955B7744EB1623BA76044F7D0A8F0BC8BCBAC98FF00FFFF00FFFF00FF
                CCC7C3CCAF9AB97B58BC7151C27454C47354BF6E51B66348AA6041F0C496E7AC
                77CBAA94FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCB9877E38C6FD39E7DCA
                8B67CF835FCEA581CEB49EC9A993CCC1BAFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFAE7656A3694EB67D5BB46A4CCB835ECDCAC7FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCFB197B98862B17C58AB
                714CCDAC90FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              Caption = 'Printer'
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              ParentColor = False
              Color = clWindow
              TabOrder = 2
              OnClick = DoDestBtnClick
            end
            object sbtnDest_File: TUniSpeedButton
              Tag = 12
              AlignWithMargins = True
              Left = 210
              Top = 3
              Width = 98
              Height = 25
              Hint = ''
              GroupIndex = 1
              Glyph.Data = {
                36060000424D3606000000000000360400002800000020000000100000000100
                08000000000000020000C21E0000C21E000000010000000000003D3D3D006868
                680099330000CC660000FF00FF0080808000A0A0A000A4A4A400A8A8A800ADAD
                AD00B1B1B100BABABA00FBDBBF00C8C8C800D3D3D300D5D5D500D6D6D600D7D7
                D700D8D8D800D9D9D900EFD4C200E9DAC300ECDAC300EFDBC200E3D8CF00E5D9
                CE00E9DACD00F2D6C200F2DBC200F4D8C100F7D9C000F4DBC100FAE5D100F9E8
                D600F8EADC00E3E3E300E6E6E600E9E9E900EBEBEB00EEEEEE00F7EFE500F8EC
                E000F7F1E900F6F3ED00F0F0F000F3F3F300F6F4F000F5F6F300F4F4F400F5F7
                F600F6F6F600F7F7F700F3F9FA00F4F8F800F2FAFC00F2FAFD00F0FBFE00F1FB
                FE00F0FBFF00F8F8F800F9F9F900FAFAFA00FBFBFB00FCFCFC00000000000000
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
                0000000000000000000000000000000000000000000000000000040404040404
                0404040404040404040404040404040404040404040404040404040402020202
                020202020202020404040404050505050505050505050504040404040518191A
                16171C1F1E0C02040404040405111213111212121113050404040404052B0D0B
                0A090807061E020404040404052D0D0B0A0908070611050404040404052E2B2A
                28292221201D02040404040405302D2C272625242310050404040404052F0D0B
                0A090807061B02040404040405320D0B0A090807060F05040404040405312F2E
                2B2A28292214020404040404053332302D2C2726250E05040404040405350D0B
                0A0908070616020404040404053B0D0B0A090807061105040404040405343531
                2F2E2B2A2815020404040404053C3B3332302D2C271105040404040405360D0B
                0A0908070619020404040404053D0D0B0A090807061205040404040405373634
                35312F2E2B18020404040404053E3D3C3B3332302D1105040404040405390D0B
                0A0931020202020404040404053F0D0B0A093305050505040404040405383937
                363435030D02040404040404053E3F3E3D3C3B050D05040404040404053A3839
                373634030204040404040404053F3E3F3E3D3C05050404040404040405050505
                0505050204040404040404040505050505050505040404040404040404040404
                0404040404040404040404040404040404040404040404040404}
              Caption = 'File'
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              ParentColor = False
              Color = clWindow
              TabOrder = 3
              OnClick = DoDestBtnClick
            end
            object sbtnDest_EMail: TUniSpeedButton
              Tag = 13
              AlignWithMargins = True
              Left = 314
              Top = 3
              Width = 97
              Height = 25
              Hint = ''
              GroupIndex = 1
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC39D89
                AE785CC49D80C8A386C8A589CAA68DC9AA95CAAE9DCBB6AACBBFB8CCCAC9FF00
                FFFF00FFFF00FFFF00FFFF00FFC6A99ABE9B7CD2B39EEAD6C7DDCCB4DAC4ACD9
                C2A7D8C1A5D6BFA3D5BA9CD1B394D0B095CEAF95CFA890FF00FFFF00FFC8AB9B
                CCB395CFB396E1C6B5F3EAE3EEE1D6EDDED1ECDDCFECDCCDE9DBCBE9DAC8E9D9
                C9E7D6C4CAA283FF00FFFF00FFC9AC9BE2CDBBE3D1C0DFC9B4DFC3B1F4F0E7F5
                EEE5F5EDE3F5EDE4F5EDE6F6EFE7E7D2C1CDAF8DC6A782FF00FFFF00FFCCAD9D
                EBDCCEEFE2D5EEE0D6EAD9CCDCBEACF8F0EBE2CAB6E0C7B2F7F0ECE0C8B4DAC4
                A7D3BB9ACBAB8EFF00FFFF00FFCCAE9DF2E7DDF4EBE3F5EDE4F4EAE0F0E4D9D0
                A388D3AF8CCEA984D3B397E6D6BFE2D0B8DBC7AACEAD95FF00FFFF00FFCFB1A2
                F6EDE6F8EFEAF9F1EDF6EFE8DFBDA6E2C6A9E6D2BEE0CAB1D1B08DDFC8B4EADB
                C6E1D2B9CCAE9CFF00FFFF00FFD3B6A7F9F2EDFBF5F1FBF6F3E4C8B4E8CFB4ED
                DDCDEFE3D8EEE0D2DFC9ACD3B391EEE4D5E9DBC8CBAE9EFF00FFFF00FFD5BAAB
                FDF8F3FAF5F1E9D0BFEAD3BCF3E6D8F5ECE3F5EDE4F5EDE4F1E6D8E2CAAEDABF
                A3F1E8DACAB4A7FF00FFFF00FFD5B6A6FAF3EFE5C6B1F4E3D1F7F0E8FAF4EFFA
                F4EDFAF3EDFAF3ECFAF2EBFAEDE5F0D7C0DEC3B0CABFB9FF00FFFF00FFD5B5A5
                E7C1AEFDE8D5FDF2EAFDF3EBFDF2EAFDF0E9FDEFE5FDEBDBEFD0C0E1BFABD6B0
                9BCBA694CCCBCAFF00FFFF00FFBA866ADDAF98DCB7A2D3B19CD1B0A0CBAB9AC7
                ACA0CCBAB0C8B9B2CBC4C1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              Caption = 'Email'
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              ParentColor = False
              Color = clWindow
              TabOrder = 4
              OnClick = DoDestBtnClick
            end
            object sbtnDest_Fax: TUniSpeedButton
              Tag = 14
              AlignWithMargins = True
              Left = 417
              Top = 3
              Width = 96
              Height = 25
              Hint = ''
              GroupIndex = 1
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFC1C1C1FF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAFACAA92847D695F5C60
                5E5C929292FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCBCBCBA19F9F
                827873948177D2B4A4FFE9DBF1D5C5A086786A6462818181AFAAA9BEBAB7FF00
                FFFF00FFFF00FFFF00FF72717192796CF9EEE8FFF9F4FFFDF8FFFFFCFFFFFCFF
                FBF4A78F7E4D4846655C5661544DB7B1ADFF00FFFF00FFFF00FFBEBEBE676563
                9E8A7EF8F3F1FFFFFFFFFFFFFBFAFABDBCBC8787874B3E39E9D4CAA8907F7665
                5EB2A9A3FF00FFFF00FF4C4C4C7373735D58536B5A5487827F6A615C786C63A2
                8E86C7B3A4F0D7C7FCDFCFF9D5BCC7A7947A6A62908680FF00FF9D9D9D767676
                BEACA3AD9B90DCC1B2FCE6DCCFC1BA9BB3C6BEC5CBD3B8A9C3A291CBA792FFE6
                D1DAB9A2635850B6AFA9FF00FFB4B3B16F6056AA947FFFF7F0F3E7E0D5D5D594
                9494646464B8A9A2C9A594AE9283D9BDAEF9D4BCD7B59FB7AAA1FF00FFAD9F90
                34302E5C5148DBCEC2F5F0ED949494707070545454626261B8A79FDDC2B6DCCA
                C0FFF6EEEFD8C7D0CCCAFF00FFC5BFBA3B3530332D29877767FBF7F58B8B8C46
                46484E4E4E4F4F50787778B2B0AF979492666363A48F7FFF00FFFF00FFFF00FF
                A4948546423F574E46766459CEC4BB7E7A777B797770706F5252514C4C4C4C4C
                4C4C4C4C725B50FF00FFFF00FFFF00FFFF00FFA8988A6A625D6C615D9B8A7A92
                78695757575757575757575757575757575757575E5046CAC9C8FF00FFFF00FF
                FF00FFFF00FFC7C3C0C0B8B0CCCBCBB8ABA2665C56666666685E58967D6E665B
                54666666665953C6C1BEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC6
                C2BF705C5273737370645ECBCAC971615873737370615AC8C6C4FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFCBCAC9745E537F7F7F7B716CC6C1BE7D66
                5A7F6C5FA18A7CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFA48B7A9274628D705ECAC9C8C8C5C4FF00FFFF00FFFF00FF}
              Caption = 'Fax'
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              ParentColor = False
              Color = clWindow
              TabOrder = 5
              OnClick = DoDestBtnClick
            end
          end
        end
      end
    end
    object pnlButtons: TUniPanel
      Left = 1
      Top = 545
      Width = 612
      Height = 36
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 2
      Caption = ''
      ExplicitTop = 546
      object Panel3: TUniPanel
        Left = 145
        Top = 1
        Width = 467
        Height = 34
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object btnPrint: TUniBitBtn
          Left = 117
          Top = 3
          Width = 112
          Height = 25
          Hint = 'Print'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFCCCBCBCDC5BEC4BBAFC2B9ADC6C1B8CAC9
            C6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCE
            A483BB875DBD9872BF9A76B68B63A87B4DA57A4AAB875BB7A180FF00FFFF00FF
            C6AFA6B87E63C38F6EC7A289CEAA8FE79977E3B79BF9F5F0F4EDE7EEE3DAE8DA
            CDE0CDBBD8BDA3B0885AFF00FFCCCBCBB87C5CC18660E29252D58349D8926CED
            A888EFD8C6FFFFFFFFFFFFFFFFFFFFFFFFFFFDFDCBAD8ACFA27EFF00FFC4A89A
            CB8654C8ADA6FFFDFDC1A08EC58E69E6C1A3FDF9F4FDFDFAFFFFFFFFFFFFFFFD
            FDCFB291D59671D2BAA5FF00FFC18D71E6B387CBAFA3FFF6EDAB7058AF6E3D9D
            6C40AF7B4CC8905DD59F72EDBB94CBA37AC89B75D08D60CCC6C1FF00FFC79477
            EAD3BED3B19FFDECD5C87055DA683CE67745D27447BA6D44A6633B90562BB168
            3BF9F0E8DBAC8DCCC1B9FF00FFCB9F84E0D3CFEAC19DFDE0C1DA6240F4693CFA
            7244FA7043FA6C3CFA6E3FF77142E7744FFBEDDDD8A380CCC6C1FF00FFCAAB9D
            DAB6A3FFCB92E0AA8EC85937E07B56E78B6AE78A67E3774FDF6437D55D32E09B
            81FDDBBAD19A75FF00FFFF00FFC6AA9ED7A079E8B17FC47655C47854BE7754BC
            7A56B87955B7744EB1623BA76044F7D0A8F0BC8BCBAC98FF00FFFF00FFFF00FF
            CCC7C3CCAF9AB97B58BC7151C27454C47354BF6E51B66348AA6041F0C496E7AC
            77CBAA94FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCB9877E38C6FD39E7DCA
            8B67CF835FCEA581CEB49EC9A993CCC1BAFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFAE7656A3694EB67D5BB46A4CCB835ECDCAC7FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCFB197B98862B17C58AB
            714CCDAC90FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Caption = '&Print'
          TabOrder = 0
          Default = True
          OnClick = btnPrintClick
        end
        object btnCurrent: TUniBitBtn
          Left = 233
          Top = 3
          Width = 112
          Height = 25
          Hint = 'Print Current Record'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1C5D051C5D051C5D051C5D
            05FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FF4F4F4F4F4F4F4F4F4F4F4F4FFF00FFFF00FFFF00FF4B2914563423
            5634235634235634235634225634225633221C5D0523B60023B60023B6001C5D
            051C5D05FF00FFFF00FF29292934343434343434343434343434343434343433
            33334F4F4F9D9D9D9D9D9D9D9D9D4F4F4F4F4F4FFF00FFFF00FF54321CE9D2AB
            E9D2ABE9D2ABE9D2ABE9D2ABE9D2AB1C5D0532BD0C24BB0025BB0124BB0024BB
            001C5D051C5D05FF00FF313131CDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCD4F
            4F4FA4A4A4A1A1A1A1A1A1A1A1A1A1A1A14F4F4F4F4F4FFF00FF54331DECD8B6
            ECD8B6ECD8B6ECD8B6ECD8B6ECD8B61C5D0527C1032FFF6E1C5D051C5D051C5D
            0524C1001C5D05FF00FF323232D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D34F
            4F4FA6A6A6E1E1E14F4F4F4F4F4F4F4F4FA6A6A64F4F4FFF00FF51321CECD8B6
            ECD8B6ECD8B6ECD8B6ECD8B6ECD8B61C5D0527C7012FFF6E1C5D05ECD8B6ECD8
            B61C5D051C5D05FF00FF313131D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D34F
            4F4FABABABE1E1E14F4F4FD3D3D3D3D3D34F4F4F4F4F4FFF00FF5436208B7259
            7E644B7E644B7E644B7E644B1C5D0527CE0027CE002FFF6E2FFF6E1C5D058B72
            59533520FF00FFFF00FF3535356F6F6F6161616161616161616161614F4F4FB2
            B2B2B2B2B2E1E1E1E1E1E14F4F4F6F6F6F343434FF00FFFF00FF543621F4E4CF
            F4E4CFF4E4CFF4E4CFF4E4CFF4E4CF1C5D055DD8362FFF6E1C5D05F4E4CFF4E4
            CF533621FF00FFFF00FF353535E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E14F
            4F4FBDBDBDE1E1E14F4F4FE1E1E1E1E1E1353535FF00FFFF00FF553824FAF0E3
            FAF0E3FAF0E3FAF0E3FAF0E3FAF0E3FAF0E31C5D051C5D05FAF0E3FAF0E3FAF0
            E35B402AFF00FFFF00FF373737EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
            EFEF4F4F4F4F4F4FEFEFEFEFEFEFEFEFEF3F3F3FFF00FFFF00FF573B2587735F
            87735F826C58826C58826C58826C58826C58826C58826C58826C58826C588D79
            65543823FF00FFFF00FF3A3A3A7171717171716A6A6A6A6A6A6A6A6A6A6A6A6A
            6A6A6A6A6A6A6A6A6A6A6A6A6A6A777777373737FF00FFFF00FF553824FFF9F1
            FFF9F1FFF9F1FFF9F1FFF9F1FFF9F1FFF9F1FFF9F1FFF9F1FFF9F1FFF9F1FFF9
            F1543723FF00FFFF00FF373737F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8
            F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8363636FF00FFFF00FF553622FDF7F0
            FDF7F0FDF7F0FDF7F0FDF7F0FDF7F0FDF7F0FDF7F0FDF7F0FDF7F0FDF7F0FDF7
            F0533522FF00FFFF00FF353535F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6
            F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6343434FF00FFFF00FF4E301E617F81
            617F81617F81617F81617F81617F81617F81617F81617F81617F81617F815986
            904C301EFF00FFFF00FF2F2F2F7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D
            7D7D7D7D7D7D7D7D7D7D7D7D7D7D8585852F2F2FFF00FFFF00FF48302000BEFF
            00BEFF00BEFF00BEFF00BEFF00BEFF00BEFF00BEFF00BEFF00BEFF00BEFF00BE
            FF483121FF00FFFF00FF2F2F2FC9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9
            C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9303030FF00FFFF00FF48301F00C8FF
            00C8FF00C8FF00C8FF00C8FF00C8FF00C8FF00C8FF00C8FF00C8FF00C8FF00C8
            FF483120FF00FFFF00FF2F2F2FD0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0
            D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0303030FF00FFFF00FF563321523321
            5233215233215233215133215133215133215133215133215133215133215133
            21482814FF00FFFF00FF33333333333333333333333333333332323232323232
            3232323232323232323232323232323232282828FF00FFFF00FF}
          Caption = 'Current &Record'
          TabOrder = 1
          OnClick = btnCurrentClick
        end
        object btnExit: TUniBitBtn
          Left = 349
          Top = 3
          Width = 112
          Height = 25
          Hint = 'Exit'
          ShowHint = True
          ParentShowHint = False
          Caption = '&Close'
          Cancel = True
          TabOrder = 2
          OnClick = btnExitClick
        end
        object btnSetUp: TUniBitBtn
          Left = 1
          Top = 3
          Width = 112
          Height = 25
          Hint = 'Printer Setup'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000C21E0000C21E00001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
            DDDDDDDDDDDDDDDDDDDDDD000000000000DDDD000000000000DDDD0885888885
            80DDDD088788888780DDDD055555555550DDDD077777777770DDDD0885888885
            80DDDD088788888780DDDD088588888580DDDD088788888780DDDD0885888885
            80DDDD088788888780DDDD088588888580DDDD088788888780DDDD0885888885
            80DDDD088788888780DDDD088588888580DDDD088788888780DDDD0885888885
            80DDDD088788888780DDDD088588888580DDDD088788888780DDDD0885888800
            00DDDD088788880000DDDD05555555080DDDDD07777777080DDDDD0885888800
            DDDDDD0887888800DDDDDD000000000DDDDDDD000000000DDDDD}
          Caption = '&Setup'
          TabOrder = 3
          OnClick = btnSetUpClick
        end
      end
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 10
    Top = 80
    object AddReport1: TUniMenuItem
      Caption = '&Add'
      OnClick = AddReport1Click
    end
    object Remove1: TUniMenuItem
      Caption = '&Remove'
      OnClick = Remove1Click
    end
    object Edit1: TUniMenuItem
      Caption = '&Edit'
      OnClick = Edit1Click
    end
    object Clone1: TUniMenuItem
      Caption = 'Clone'
      OnClick = Clone1Click
    end
    object Info1: TUniMenuItem
      Caption = '&Information'
      OnClick = Info1Click
    end
    object ViewReportCatalog1: TUniMenuItem
      Caption = 'View Report Catalog'
      OnClick = ViewReportCatalog1Click
    end
    object ReportsExecutionLog1: TUniMenuItem
      Caption = 'Reports Execution Log'
      OnClick = ReportsExecutionLog1Click
    end
    object N2: TUniMenuItem
      Caption = '-'
    end
    object ShowAllReports1: TUniMenuItem
      Caption = 'Show All Reports'
      OnClick = ShowAllReports1Click
    end
    object ReportEditor1: TUniMenuItem
      Caption = 'Report Editor'
      OnClick = ReportEditor1Click
    end
    object N1: TUniMenuItem
      Caption = '-'
    end
    object About1: TUniMenuItem
      Caption = 'A&bout'
      OnClick = About1Click
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Crystal Report File (*.rpt)|*.rpt|Any File (*.*)|*.*'
    Options = [ofFileMustExist]
    Left = 40
    Top = 79
  end
  object SrcRepDef: TDataSource
    DataSet = RepDef
    OnDataChange = SrcRepDefDataChange
    Left = 16
    Top = 131
  end
  object RepDef: TFDTable
    BeforePost = RepDefBeforePost
    AfterPost = RepDefAfterPost
    BeforeDelete = RepDefBeforeDelete
    AfterDelete = RepDefAfterPost
    OnCalcFields = RepDefCalcFields
    Filtered = True
    OnFilterRecord = RepDefFilterRecord
    IndexFieldNames = 'APP_ID;DESCRIP'
    ConnectionName = 'IQFD'
    UpdateOptions.UpdateTableName = 'REPDEF'
    TableName = 'REPDEF'
    Left = 8
    Top = 115
    object RepDefDESCRIP: TStringField
      DisplayLabel = 'Report Description'
      DisplayWidth = 51
      FieldName = 'DESCRIP'
      Required = True
      Size = 255
    end
    object RepDefAPP_ID: TStringField
      DisplayWidth = 30
      FieldName = 'APP_ID'
      Required = True
      Visible = False
      Size = 30
    end
    object RepDefREPNAME: TStringField
      DisplayWidth = 50
      FieldName = 'REPNAME'
      Required = True
      Visible = False
      Size = 50
    end
    object RepDefCURR_REC_COL_NAME: TStringField
      DisplayWidth = 60
      FieldName = 'CURR_REC_COL_NAME'
      Visible = False
      Size = 60
    end
    object RepDefCRW_MATCH_COL_NAME: TStringField
      DisplayWidth = 60
      FieldName = 'CRW_MATCH_COL_NAME'
      Visible = False
      Size = 60
    end
    object RepDefBEFORE_PRINT: TStringField
      DisplayWidth = 60
      FieldName = 'BEFORE_PRINT'
      Visible = False
      Size = 60
    end
    object RepDefNUM_COPIES: TBCDField
      DisplayWidth = 10
      FieldName = 'NUM_COPIES'
      Visible = False
      Size = 0
    end
    object RepDefCOLLATE: TStringField
      DisplayWidth = 1
      FieldName = 'COLLATE'
      Visible = False
      Size = 1
    end
    object RepDefHIDDEN: TStringField
      FieldName = 'HIDDEN'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object RepDefEDIT_DATE: TDateTimeField
      FieldName = 'EDIT_DATE'
    end
    object RepDefSTORED_PROCEDURE: TStringField
      FieldName = 'STORED_PROCEDURE'
      FixedChar = True
      Size = 1
    end
    object RepDefLANGUAGE_CODE: TBCDField
      FieldName = 'LANGUAGE_CODE'
      Size = 0
    end
    object RepDefMFGTYPE: TStringField
      FieldName = 'MFGTYPE'
      Size = 10
    end
    object RepDefFILE_NAME: TStringField
      FieldName = 'FILE_NAME'
      Size = 250
    end
    object RepDefDISABLE_PRINT: TStringField
      FieldName = 'DISABLE_PRINT'
      Visible = False
      Size = 1
    end
    object RepDefReportOwner: TStringField
      FieldKind = fkCalculated
      FieldName = 'ReportOwner'
      Visible = False
      Size = 30
      Calculated = True
    end
  end
  object dbfREPDEF: TADOTable
    Connection = ADOConnection1
    TableName = 'REPDEF.DBF'
    Left = 192
    Top = 79
  end
  object RepDef_Criteria: TFDTable
    BeforeInsert = RepDef_CriteriaBeforeInsert
    BeforePost = RepDef_CriteriaBeforePost
    IndexFieldNames = 'APP_ID;REPNAME;SEQ'
    MasterSource = SrcRepDef
    MasterFields = 'APP_ID;REPNAME'
    ConnectionName = 'IQFD'
    UpdateOptions.UpdateTableName = 'REPDEF_CRITERIA'
    TableName = 'REPDEF_CRITERIA'
    Left = 75
    Top = 117
    object RepDef_CriteriaAPP_ID: TStringField
      FieldName = 'APP_ID'
      Required = True
      Size = 30
    end
    object RepDef_CriteriaREPNAME: TStringField
      DisplayWidth = 50
      FieldName = 'REPNAME'
      Required = True
      Size = 50
    end
    object RepDef_CriteriaSEQ: TBCDField
      FieldName = 'SEQ'
      Required = True
      Size = 0
    end
    object RepDef_CriteriaCRW_COL_NAME: TStringField
      FieldName = 'CRW_COL_NAME'
      Required = True
      Size = 60
    end
    object RepDef_CriteriaDESCRIP: TStringField
      DisplayWidth = 60
      FieldName = 'DESCRIP'
      Size = 60
    end
    object RepDef_CriteriaRANGE_START: TStringField
      FieldName = 'RANGE_START'
      Size = 60
    end
    object RepDef_CriteriaRANGE_END: TStringField
      FieldName = 'RANGE_END'
      Size = 60
    end
    object RepDef_CriteriaUNARY_OPERATOR: TStringField
      FieldName = 'UNARY_OPERATOR'
      OnValidate = RepDef_CriteriaUNARY_OPERATORValidate
      Size = 3
    end
    object RepDef_CriteriaBINARY_OPERATOR: TStringField
      FieldName = 'BINARY_OPERATOR'
      OnValidate = RepDef_CriteriaBINARY_OPERATORValidate
      Size = 3
    end
    object RepDef_CriteriaINCLUDE_NULLS: TStringField
      FieldName = 'INCLUDE_NULLS'
      Size = 1
    end
    object RepDef_CriteriaLIKE_OPERATOR: TStringField
      DisplayLabel = 'Like'
      FieldName = 'LIKE_OPERATOR'
      Size = 1
    end
  end
  object SrcRepDef_Criteria: TDataSource
    DataSet = RepDef_Criteria
    OnDataChange = SrcRepDef_CriteriaDataChange
    Left = 75
    Top = 139
  end
  object QryColInfo: TFDQuery
    ConnectionName = 'IQFD'
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
    Left = 292
    Top = 115
    ParamData = <
      item
        Name = 'table_name'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'column_name'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object SaveDialog1: TSaveDialog
    Filter = 
      'Rich Text Format|*.RTF|Ascii Text |*.TXT|Adobe Acrobat PDF|*.PDF' +
      '|Excel|*.XLS|HTML4|*.htm|Any File|*.*'
    Options = [ofOverwritePrompt, ofPathMustExist]
    Title = 'Save Report As ...'
    Left = 288
    Top = 79
  end
  object SrcRepDefFormulas: TDataSource
    DataSet = RepDef_Formulas
    Left = 128
    Top = 131
  end
  object RepDef_Formulas: TFDTable
    IndexFieldNames = 'APP_ID;REPNAME;SEQ'
    MasterSource = SrcRepDef
    MasterFields = 'APP_ID;REPNAME'
    ConnectionName = 'IQFD'
    UpdateOptions.UpdateTableName = 'REPDEF_FORMULAS'
    TableName = 'REPDEF_FORMULAS'
    Left = 127
    Top = 116
    object RepDef_FormulasAPP_ID: TStringField
      FieldName = 'APP_ID'
      Required = True
      Size = 30
    end
    object RepDef_FormulasREPNAME: TStringField
      FieldName = 'REPNAME'
      Required = True
      Size = 50
    end
    object RepDef_FormulasSEQ: TBCDField
      FieldName = 'SEQ'
      Required = True
      Size = 0
    end
    object RepDef_FormulasLABEL_TEXT: TStringField
      DisplayLabel = 'Label Text'
      FieldName = 'LABEL_TEXT'
      Required = True
      Size = 60
    end
    object RepDef_FormulasFORM_NAME: TStringField
      DisplayLabel = 'Formula Name'
      FieldName = 'FORM_NAME'
      Required = True
      Size = 60
    end
    object RepDef_FormulasFORM_TYPE: TStringField
      DisplayLabel = 'Formula Type'
      FieldName = 'FORM_TYPE'
      Required = True
      OnSetText = RepDef_FormulasFORM_TYPESetText
      Size = 10
    end
    object RepDef_FormulasFORM_VALUE: TStringField
      DisplayLabel = 'Formula Value'
      FieldName = 'FORM_VALUE'
      OnSetText = RepDef_FormulasFORM_VALUESetText
      Size = 60
    end
    object RepDef_FormulasFUNC_NAME: TStringField
      FieldName = 'FUNC_NAME'
      Size = 60
    end
  end
  object popmEmail: TUniPopupMenu
    Left = 259
    Top = 118
    object AddfromVendors1: TUniMenuItem
      Caption = 'Add from Vendors'
      OnClick = AddfromVendors1Click
    end
    object AddfromCustomers1: TUniMenuItem
      Caption = 'Add from Customers'
      OnClick = AddfromVendors1Click
    end
    object AddfromEmployees1: TUniMenuItem
      Caption = 'Add from Employees'
      OnClick = AddfromVendors1Click
    end
  end
  object SrcRepDef_EMail: TDataSource
    DataSet = RepDef_EMail
    OnDataChange = SrcRepDef_EMailDataChange
    Left = 183
    Top = 131
  end
  object RepDef_EMail: TFDTable
    IndexFieldNames = 'APP_ID;REPNAME'
    MasterSource = SrcRepDef
    MasterFields = 'APP_ID;REPNAME'
    ConnectionName = 'IQFD'
    UpdateOptions.UpdateTableName = 'REPDEF_EMAIL'
    TableName = 'REPDEF_EMAIL'
    Left = 175
    Top = 115
    object RepDef_EMailAPP_ID: TStringField
      FieldName = 'APP_ID'
      Required = True
      Size = 30
    end
    object RepDef_EMailREPNAME: TStringField
      DisplayWidth = 50
      FieldName = 'REPNAME'
      Required = True
      Size = 50
    end
    object RepDef_EMailEMAIL_TO: TStringField
      FieldName = 'EMAIL_TO'
      Size = 2000
    end
    object RepDef_EMailEMAIL_SUBJECT: TStringField
      FieldName = 'EMAIL_SUBJECT'
      Size = 200
    end
    object RepDef_EMailEMAIL_BODY: TStringField
      FieldName = 'EMAIL_BODY'
      Size = 2000
    end
    object RepDef_EMailEMAIL_BCC: TStringField
      FieldName = 'EMAIL_BCC'
      Visible = False
      Size = 200
    end
    object RepDef_EMailEMAIL_SENDER: TStringField
      FieldName = 'EMAIL_SENDER'
      Visible = False
      Size = 200
    end
  end
  object RepDef_Cat: TFDTable
    IndexFieldNames = 'APP_ID'
    ConnectionName = 'IQFD'
    UpdateOptions.UpdateTableName = 'REPDEF_CAT'
    TableName = 'REPDEF_CAT'
    Left = 223
    Top = 117
  end
  object QryCriteriaPkList: TFDQuery
    Tag = 1
    MasterSource = SrcRepDef_Criteria
    MasterFields = 'APP_ID;REPNAME;CRW_COL_NAME'
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select column_name,'
      '       caption,'
      '       width'
      '  from repdef_criteria_picklist'
      ' where app_id = :app_id'
      '   and repname = :repname'
      '   and crw_col_name = :crw_col_name'
      ' order by seq')
    Left = 321
    Top = 115
    ParamData = <
      item
        Name = 'APP_ID'
        DataType = ftString
        ParamType = ptInput
        Size = 31
      end
      item
        Name = 'REPNAME'
        DataType = ftString
        ParamType = ptInput
        Size = 31
      end
      item
        Name = 'CRW_COL_NAME'
        DataType = ftString
        ParamType = ptInput
        Size = 61
      end>
    object QryCriteriaPkListCOLUMN_NAME: TStringField
      FieldName = 'COLUMN_NAME'
      Origin = 'IQ.REPDEF_CRITERIA_PICKLIST.COLUMN_NAME'
      Size = 30
    end
    object QryCriteriaPkListCAPTION: TStringField
      FieldName = 'CAPTION'
      Origin = 'IQ.REPDEF_CRITERIA_PICKLIST.CAPTION'
      Size = 60
    end
    object QryCriteriaPkListWIDTH: TBCDField
      FieldName = 'WIDTH'
      Origin = 'IQ.REPDEF_CRITERIA_PICKLIST.WIDTH'
      Size = 0
    end
  end
  object PrintDialog1: TPrintDialog
    MaxPage = 999
    Left = 320
    Top = 80
  end
  object ImageList1: TUniImageList
    Width = 32
    Left = 368
    Top = 152
    Bitmap = {
      494C010101000500080020001000FF00FF00FF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000001000000001002000000000000020
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
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
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
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
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00C0704000B0583000B0583000A0502000A05020009048
      2000904820009040200080402000FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00717171005C5C5C005C5C5C0053535300535353004A4A
      4A004A4A4A004545450042424200FF00FF000000000000000000000000000000
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
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00C0785000F0D8D000F0D8C000F0D0C000F0D0B000F0D0
      B000F0D0B000F0D0B00090402000FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0079797900D9D9D900D5D5D500D0D0D000CDCDCD00CDCD
      CD00CDCDCD00CDCDCD0045454500FF00FF000000000000000000000000000000
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
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00D0886000FFF8F000FFF8F000FFF0E000FFF0E000FFE8
      E000FFE8E000F0D0B00090482000FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0088888800F7F7F700F7F7F700EEEEEE00EEEEEE00E9E9
      E900E9E9E900CDCDCD004A4A4A00FF00FF000000000000000000000000000000
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
      000000000000000000000000000000000000FF00FF00C0704000B0583000B058
      3000A0502000A050200090482000904820009040200080402000FFF0F000FFE8
      E000FFE8E000F0D0B00090482000FF00FF00FF00FF00717171005C5C5C005C5C
      5C0053535300535353004A4A4A004A4A4A004545450042424200F2F2F200E9E9
      E900E9E9E900CDCDCD004A4A4A00FF00FF000000000000000000000000000000
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
      000000000000000000000000000000000000FF00FF00C0785000F0D8D000F0D8
      C000F0D0C000F0D0B000F0D0B000F0D0B000F0D0B00090402000FFF8F000FFF0
      E000FFF0E000F0D0C000A0482000FF00FF00FF00FF0079797900D9D9D900D5D5
      D500D0D0D000CDCDCD00CDCDCD00CDCDCD00CDCDCD0045454500F7F7F700EEEE
      EE00EEEEEE00D0D0D0004D4D4D00FF00FF000000000000000000000000000000
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
      000000000000000000000000000000000000FF00FF00D0886000FFF8F000E090
      6000D0805000D0805000D0805000D0805000F0D0B00090482000FFFFFF00FFF0
      F000FFF0F000F0D8D000A0502000FF00FF00FF00FF0088888800F7F7F7009090
      900080808000808080008080800080808000CDCDCD004A4A4A00FFFFFF00F2F2
      F200F2F2F200D9D9D90053535300FF00FF000000000000000000000000000000
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
      000000000000000000000000000000000000FF00FF00D0907000FFFFFF00FFFF
      FF00FFF0F000FFF0F000FFE8E000FFE8E000F0D0B00090482000FFFFFF00FFF8
      F000FFF8F000F0E0E000A0502000FF00FF00FF00FF0090909000FFFFFF00FFFF
      FF00F2F2F200F2F2F200E9E9E900E9E9E900CDCDCD004A4A4A00FFFFFF00F7F7
      F700F7F7F700E2E2E20053535300FF00FF000000000000000000000000000000
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
      000000000000000000000000000000000000FF00FF00E0A08000FFFFFF00F0A8
      8000E0987000E0906000D0805000D0805000F0D0C000A0482000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A0502000FF00FF00FF00FF00A0A0A000FFFFFF00A8A8
      A80098989800909090008080800080808000D0D0D0004D4D4D00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0053535300FF00FF000000000000000000000000000000
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
      000000000000000000000000000000000000FF00FF00E0A89000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF0F000FFF0F000F0D8D000A0502000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A0502000FF00FF00FF00FF00A9A9A900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F2F2F200F2F2F200D9D9D90053535300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0053535300FF00FF000000000000000000000000000000
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
      000000000000000000000000000000000000FF00FF00E0B8A000FFFFFF00FFB0
      9000F0B09000F0A88000F0987000E0906000F0E0E000A0502000E0A08000D090
      7000D0886000C0785000C0704000FF00FF00FF00FF00B7B7B700FFFFFF00B1B1
      B100B0B0B000A8A8A8009A9A9A0090909000E2E2E20053535300A0A0A0009090
      9000888888007979790071717100FF00FF000000000000000000000000000000
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
      000000000000000000000000000000000000FF00FF00F0C0A000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A0502000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BEBEBE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0053535300FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
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
      000000000000000000000000000000000000FF00FF00F0C8B000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A0502000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C7C7C700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0053535300FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
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
      000000000000000000000000000000000000FF00FF00F0C8B000F0C0B000F0C0
      B000F0B8A000E0A08000D0907000D0886000C0785000C0704000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C7C7C700C1C1C100C1C1
      C100B8B8B800A0A0A00090909000888888007979790071717100FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
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
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000100000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF000000000000000000000000
      FFFFFFFF000000000000000000000000FC01FC01000000000000000000000000
      FC01FC01000000000000000000000000FC01FC01000000000000000000000000
      8001800100000000000000000000000080018001000000000000000000000000
      8001800100000000000000000000000080018001000000000000000000000000
      8001800100000000000000000000000080018001000000000000000000000000
      80018001000000000000000000000000803F803F000000000000000000000000
      803F803F000000000000000000000000803F803F000000000000000000000000
      FFFFFFFF00000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object ADOConnection1: TADOConnection
    Left = 104
    Top = 77
  end
  object SQLiteRepDef: TFDTable
    Connection = SQLiteConnection
    UpdateOptions.UpdateTableName = 'REPDEF'
    TableName = 'REPDEF'
    Left = 368
    Top = 80
  end
  object SQLiteConnection: TFDConnection
    Left = 424
    Top = 80
  end
end
