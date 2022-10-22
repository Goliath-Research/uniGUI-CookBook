object FormTaxMain: TFormTaxMain
  Left = 258
  Top = 137
  HelpContext = 1093302
  ClientHeight = 354
  ClientWidth = 504
  Caption = 'Tax Code Maintenance'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 504
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object SBToggle: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Toggle Table/Form View'
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
      OnClick = SBToggleClick
    end
    object sbtnWebServices: TUniSpeedButton
      Left = 26
      Top = 2
      Width = 25
      Height = 25
      Hint = 'Web Service Settings'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FFFF00FF
        CEA484A7826C7E5D4B704F3D89694EBA9070FF00FFCEA484A7826C7E5D4B704F
        3D89694EBA9070FF00FFFF00FFFF00FFA2A2A28181815D5D5D4F4F4F6767678E
        8E8EFF00FFA2A2A28181815D5D5D4F4F4F6767678E8E8EFF00FFFF00FFD5AF92
        B79684D0B0A0E0D0C0E0C8B0B090807F5D4BAF8A73B79684D0B0A0E0D0C0E0C8
        B0B090807F5D4BBC9474FF00FFADADAD959595AFAFAFCECECEC5C5C58F8F8F5D
        5D5D898989959595AFAFAFCECECEC5C5C58F8F8F5D5D5D929292FF00FFC3A18C
        E0D0C0B3917EA18060BB9A8750281040281040281040281071573EA18060BB9A
        87CBA996B0988081644AFF00FFA0A0A0CECECE9090907D7D7D99999928282826
        26262626262626265454547D7D7D999999A8A8A8959595626262FF00FFB39B82
        FFFFFF633B23D6B197D6B5A2FFFFFFFFF8F0FFE8E0F0D8D0F0D0C0967355DFBA
        9DB89E85E0D0C0684837FF00FF989898FFFFFF3B3B3BAFAFAFB4B4B4FFFFFFF7
        F7F7E9E9E9D9D9D9D0D0D0717171B8B8B89B9B9BCECECE484848FF00FFC5A990
        F0E0D09C8978593928604830B09880D0B0A0C0A890D0B8B0C3AA926E543B7B61
        48B5A08DC0B0A0997764FF00FFA6A6A6DEDEDE878787393939464646959595AF
        AFAFA5A5A5B8B8B8A7A7A75252525E5E5E9E9E9EAEAEAE767676FF00FFCBB29E
        C0A8A0E0D8D0FFF8F0FFF0F0D0C0B0A08070806850C0A890E0D8D0FFF8F0FFF0
        F0D0C0B0AA8A79D1B09AFF00FFB0B0B0A8A8A8D7D7D7F7F7F7F2F2F2BEBEBE80
        8080656565A5A5A5D7D7D7F7F7F7F2F2F2BEBEBE898989AEAEAEFF00FFB09C8A
        D08860C09070A09880A09070907860308820706830906850AA8B7AB8A088B899
        88C1A68FD8BBA4FF00FFFF00FF9A9A9A8888888E8E8E9494948B8B8B75757576
        76766060606767678A8A8A9D9D9D989898A4A4A4B9B9B9FF00FFD3BDA9C09070
        FF9860E0906060785050A03050A030809020D07840706840605840B79D86FF00
        FFFF00FFFF00FFFF00FFBBBBBB8E8E8E9A9A9A9090906F6F6F8C8C8C8C8C8C81
        81817979796161615454549B9B9BFF00FFFF00FFFF00FFFF00FFC7AE97F09870
        F0987060705060984060B04090A040E08860D08050506840407830907760FF00
        FFFF00FFFF00FFFF00FFACACAC9A9A9A9A9A9A6969698787879B9B9B9191918A
        8A8A8080805F5F5F6A6A6A757575FF00FFFF00FFFF00FFFF00FFB49C93FFA070
        80806040A04050B040909060E09870E09060E0885060A020409820695848FF00
        FFFF00FFFF00FFFF00FF9C9C9CA1A1A17A7A7A8D8D8D9B9B9B88888898989890
        90908888888C8C8C848484565656FF00FFFF00FFFF00FFFF00FFB4A393E09070
        60985040C86040C87070A070B0A070D09860E09060A0903040A020785848FF00
        FFFF00FFFF00FFFF00FFA1A1A1929292898989B1B1B1B3B3B394949499999994
        94949090908484848B8B8B585858FF00FFFF00FFFF00FFFF00FFC7B5A3A09060
        50B86060D88090E0A080E0A0A0D090B0A060F09860E088505098309B836CFF00
        FFFF00FFFF00FFFF00FFB3B3B3898989A4A4A4C3C3C3D0D0D0CFCFCFC1C1C196
        9696989898888888868686808080FF00FFFF00FFFF00FFFF00FFDAC6B4A0A080
        30C86070E090C0F0B0D0F0D0F0F8D0B0E8A0809860D09840808840BEAA98FF00
        FFFF00FFFF00FFFF00FFC4C4C49A9A9AB1B1B1CCCCCCE1E1E1E8E8E8F0F0F0D8
        D8D88D8D8D9090907C7C7CA8A8A8FF00FFFF00FFFF00FFFF00FFF3DDCAC7B5A4
        90B88080D880C0F0B0E0F8D080A87070D89040B060908040A69483EDD6C2FF00
        FFFF00FFFF00FFFF00FFDBDBDBB3B3B3ABABABC4C4C4E1E1E1EFEFEF9C9C9CC6
        C6C69E9E9E777777929292D4D4D4FF00FFFF00FFFF00FFFF00FFFF00FFE9D5C3
        C7B5A5B0B890B0D090A0D89080E09050C070909060B19F8FE1CBB7FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFD3D3D3B3B3B3B0B0B0C3C3C3C8C8C8CDCDCDAD
        ADAD8888889D9D9DC9C9C9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        F3DECEDBC8B7C7B6A5B4A494B49C94C7AB9AD4C1B0F1DBCAFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFDDDDDDC6C6C6B4B4B4A2A2A29C9C9CAA
        AAAABFBFBFDADADAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnWebServicesClick
    end
  end
  object pcMain: TUniPageControl
    Left = 0
    Top = 27
    Width = 504
    Height = 327
    Hint = ''
    ActivePage = TabCodes
    TabBarVisible = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    OnChange = pcMainChange
    object TabCodes: TUniTabSheet
      Hint = ''
      Caption = 'Tax Codes'
      object Splitter1: TUniSplitter
        Left = 0
        Top = 124
        Width = 496
        Height = 3
        Cursor = crVSplit
        Hint = ''
        Align = alTop
        ParentColor = False
        Color = clBtnFace
      end
      object PnlTaxCodePCCarrier: TUniPanel
        Left = 0
        Top = 0
        Width = 496
        Height = 124
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        object pcTaxCodes: TUniPageControl
          Left = 1
          Top = 1
          Width = 494
          Height = 122
          Hint = ''
          ActivePage = TabGrid
          TabBarVisible = True
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          object TabGrid: TUniTabSheet
            Hint = ''
            Caption = 'TabGrid'
            object IQSearch1: TIQUniGridControl
              Left = 0
              Top = 0
              Width = 486
              Height = 94
              Layout = 'border'
              ParentAlignmentControl = False
              AlignmentControl = uniAlignmentClient
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
              IQComponents.Grid.Left = 0
              IQComponents.Grid.Top = 29
              IQComponents.Grid.Width = 269
              IQComponents.Grid.Height = 8
              IQComponents.Grid.Hint = ''
              IQComponents.Grid.DataSource = DM_Tax.SrcTaxCodes
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
              IQComponents.Navigator.DataSource = DM_Tax.SrcTaxCodes
              IQComponents.Navigator.LayoutConfig.Region = 'east'
              IQComponents.Navigator.TabOrder = 3
              IQComponents.HiddenPanel.Left = 269
              IQComponents.HiddenPanel.Top = 29
              IQComponents.HiddenPanel.Width = 209
              IQComponents.HiddenPanel.Height = 8
              IQComponents.HiddenPanel.Hint = ''
              IQComponents.HiddenPanel.Visible = True
              IQComponents.HiddenPanel.Align = alRight
              IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
              IQComponents.FormTab.Hint = ''
              IQComponents.FormTab.ImageIndex = 1
              IQComponents.FormTab.Caption = 'Form'
              IQComponents.FormTab.Layout = 'border'
              DataSource = DM_Tax.SrcTaxCodes
              Columns = <
                item
                  FieldName = 'TAX_CODE'
                  Title.Caption = 'Tax Code'
                  Width = 64
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'TAX_CODE_DESC'
                  Title.Caption = 'Description'
                  Width = 64
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'TAX_RATE'
                  Title.Caption = 'Total Rate'
                  Width = 64
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'INCLUDE_FREIGHT'
                  Title.Caption = 'Include Freight'
                  Width = 64
                  CheckBoxField.FieldValues = 'Y;N'
                end
                item
                  FieldName = 'STATE'
                  Title.Caption = 'State'
                  Width = 64
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'COUNTY'
                  Title.Caption = 'County'
                  Width = 64
                  CheckBoxField.FieldValues = 'true;false'
                end>
              Marker = 0
            end
          end
          object TabForm: TUniTabSheet
            Hint = ''
            Caption = 'TabForm'
            object PnlTaxCodesForm: TUniPanel
              Left = 0
              Top = 0
              Width = 486
              Height = 94
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
              Caption = ''
              object Splitter2: TUniSplitter
                Left = 110
                Top = 0
                Width = 6
                Height = 94
                Hint = ''
                Align = alLeft
                ParentColor = False
                Color = clBtnFace
              end
              object PnlTaxCodesFormLeft: TUniPanel
                Left = 1
                Top = 1
                Width = 110
                Height = 92
                Hint = ''
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                TabOrder = 0
                Caption = ''
                object Label1: TUniLabel
                  Left = 8
                  Top = 12
                  Width = 46
                  Height = 13
                  Hint = ''
                  Caption = 'Tax Code'
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
                  Top = 58
                  Width = 71
                  Height = 13
                  Hint = ''
                  Caption = 'Total Tax Rate'
                  TabOrder = 3
                end
                object Label4: TUniLabel
                  Left = 8
                  Top = 80
                  Width = 72
                  Height = 13
                  Hint = ''
                  Caption = 'Include Freight'
                  TabOrder = 4
                end
              end
              object PnlTaxCodesFormClient: TUniPanel
                Left = 116
                Top = 1
                Width = 370
                Height = 92
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
                Caption = ''
                object DBTextTaxRate: TUniDBText
                  Left = 1
                  Top = 58
                  Width = 76
                  Height = 13
                  Hint = ''
                  DataField = 'TAX_RATE'
                  DataSource = DM_Tax.SrcTaxCodes
                end
                object DBEditTaxCode: TUniDBEdit
                  Left = 1
                  Top = 8
                  Width = 169
                  Height = 21
                  Hint = ''
                  DataField = 'TAX_CODE'
                  DataSource = DM_Tax.SrcTaxCodes
                  TabOrder = 0
                end
                object DBEditDescript: TUniDBEdit
                  Left = 1
                  Top = 32
                  Width = 169
                  Height = 21
                  Hint = ''
                  DataField = 'TAX_CODE_DESC'
                  DataSource = DM_Tax.SrcTaxCodes
                  TabOrder = 1
                end
                object DBInclFreight: TUniDBCheckBox
                  Left = 3
                  Top = 77
                  Width = 21
                  Height = 17
                  Hint = ''
                  DataField = 'INCLUDE_FREIGHT'
                  DataSource = DM_Tax.SrcTaxCodes
                  ValueChecked = 'Y'
                  ValueUnchecked = 'N'
                  Caption = ''
                  TabOrder = 2
                end
              end
            end
          end
        end
      end
      object PnlTaxElements: TUniPanel
        Tag = 1999
        Left = 0
        Top = 127
        Width = 496
        Height = 172
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object PnlToolbar: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 494
          Height = 47
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = ''
          object PnlToolbarCaption: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 492
            Height = 20
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clWhite
            TabOrder = 0
            Caption = ''
            Color = clBtnShadow
            object lblCaptionLabel: TUniLabel
              Left = 1
              Top = 1
              Width = 116
              Height = 13
              Hint = ''
              Caption = 'Linked Tax Elements'
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              ParentFont = False
              Font.Color = clWhite
              Font.Style = [fsBold]
              TabOrder = 1
            end
          end
          object PnlToolbarInner: TUniPanel
            Tag = 1999
            Left = 1
            Top = 20
            Width = 492
            Height = 27
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
          end
        end
        object PnlTaxElementsGrid: TUniPanel
          Tag = 1999
          Left = 1
          Top = 47
          Width = 494
          Height = 125
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object wwDBGrid1: TIQUniGridControl
            Left = 1
            Top = 1
            Width = 492
            Height = 123
            Layout = 'border'
            ParentAlignmentControl = False
            AlignmentControl = uniAlignmentClient
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            IQComponents.Grid.Left = 0
            IQComponents.Grid.Top = 29
            IQComponents.Grid.Width = 275
            IQComponents.Grid.Height = 37
            IQComponents.Grid.Hint = ''
            IQComponents.Grid.DataSource = DM_Tax.SrcTaxCodeLink
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
            IQComponents.Navigator.DataSource = DM_Tax.SrcTaxCodeLink
            IQComponents.Navigator.LayoutConfig.Region = 'east'
            IQComponents.Navigator.TabOrder = 3
            IQComponents.HiddenPanel.Left = 275
            IQComponents.HiddenPanel.Top = 29
            IQComponents.HiddenPanel.Width = 209
            IQComponents.HiddenPanel.Height = 37
            IQComponents.HiddenPanel.Hint = ''
            IQComponents.HiddenPanel.Visible = True
            IQComponents.HiddenPanel.Align = alRight
            IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
            IQComponents.FormTab.Hint = ''
            IQComponents.FormTab.ImageIndex = 1
            IQComponents.FormTab.Caption = 'Form'
            IQComponents.FormTab.Layout = 'border'
            DataSource = DM_Tax.SrcTaxCodeLink
            Columns = <
              item
                FieldName = 'SEQ'
                Title.Caption = 'SEQ'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'Descrip'
                Title.Caption = 'Description'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'Rate'
                Title.Caption = 'Rate'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'GlAcct'
                Title.Caption = 'GL Account'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'VAT_PAID'
                Title.Caption = 'VAT Paid'
                Width = 64
                CheckBoxField.FieldValues = 'Y;N'
              end>
            Marker = 0
          end
          object wwDBComboDlg2: TUniEdit
            Left = 104
            Top = 48
            Width = 121
            Height = 21
            Hint = ''
            Text = ''
            TabOrder = 1
          end
        end
      end
    end
    object TabElements: TUniTabSheet
      Hint = ''
      Caption = 'Tax Elements'
      object IQSearch2: TIQUniGridControl
        Left = 0
        Top = 0
        Width = 496
        Height = 299
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 279
        IQComponents.Grid.Height = 213
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = DM_Tax.SrcTaxElements
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
        IQComponents.Navigator.DataSource = DM_Tax.SrcTaxElements
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 279
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 213
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = DM_Tax.SrcTaxElements
        Columns = <
          item
            FieldName = 'DESCRIP'
            Title.Caption = 'Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'TAX_RATE'
            Title.Caption = 'Tax Rate'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ACCT'
            Title.Caption = 'GL Account'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
        object wwDBComboDlg1: TUniEdit
          Left = 352
          Top = 104
          Width = 121
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 2
        end
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 280
    Top = 8
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Reports2: TUniMenuItem
      Caption = '&Reports'
      object ListofTaxCodes2: TUniMenuItem
        Caption = '&List of Tax Codes'
        Visible = False
      end
      object ListofElements2: TUniMenuItem
        Caption = 'List of &Elements'
        Visible = False
      end
      object N2: TUniMenuItem
        Caption = '-'
        Visible = False
      end
      object Userdefined2: TUniMenuItem
        Caption = '&User defined...'
        Visible = False
      end
      object N3: TUniMenuItem
        Caption = '-'
        Visible = False
      end
      object Print1: TUniMenuItem
        Caption = '&Print'
        OnClick = Print1Click
      end
      object PrintSetup1: TUniMenuItem
        Caption = 'Print &Setup'
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
    ModuleName = 'Tax Code Maintenance'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 193342 $'
    BuildVersion = '176554'
    Left = 248
    Top = 8
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FormTaxMain'
    WebUse = False
    TouchScreen = False
    Left = 344
    Top = 8
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 309
    Top = 8
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'NavMain'
      'NavLink'
      'GridTaxCode'
      'GridTaxLinks'
      'GridTaxElements'
      'Print1'
      'PrintSetup1'
      'BtnApply'
      'DBInclFreight')
    SecurityCode = 'FORMTAXMAIN'
    Left = 384
    Top = 8
  end
end
