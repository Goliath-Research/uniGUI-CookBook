object FrmEstimateBOLBase: TFrmEstimateBOLBase
  Left = 439
  Top = 213
  HelpContext = 1110583
  ClientHeight = 294
  ClientWidth = 566
  Caption = 'Estimate BOL'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 141
    Width = 566
    Height = 4
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object pnlHeader: TUniPanel
    Left = 0
    Top = 0
    Width = 566
    Height = 141
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object Splitter2: TUniSplitter
      Left = 214
      Top = 0
      Width = 4
      Height = 141
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object pnlHdrLeft01: TUniPanel
      Left = 1
      Top = 1
      Width = 214
      Height = 139
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Panel3: TUniPanel
        Left = 1
        Top = 1
        Width = 212
        Height = 27
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        object sbtnCalculateBOL_All: TUniSpeedButton
          Left = 1
          Top = 1
          Width = 25
          Height = 25
          Hint = 'Calculate BOL for all items'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FF00FF806860
            806050705840705840705040705040605040605030605030705040E0E0E00000
            00FF00FFFF00FFFF00FF877766D0C0B0D0B8B0D0B0A0C0B0A0C0A8A0C0A8A0C0
            A090C0A090B0A090E0E0E0000000000000000000FF00FFFF00FF967E66F0E0D0
            D0C0B0D0B8B0D0B0B0C0B0A0C0A8A0C0A8A0D0C8C0E0E0E00000000000000000
            00000000000000FF00FF967E75F0E0D0C08870B07050D0B8B0C08870B07050C0
            B0A0E0E0E0000000000000000000000000000000000000000000968675F0E0E0
            FFC8B0C08870D0C0B0F0C8B0C08870C0B0A0E0E0E0D0C8C0C6A891C6A891FF00
            FFFF00FFFF00FFFF00FF968D85F0E8E0E0D0C0D0C8C0D0C0C0D0C0B0D0B8B0D0
            B8B0C0B0A0C0B0A0C0A8A0776655FF00FFFF00FFFF00FFFF00FFA58D85FFE8E0
            C09070B07050E0C8C0C09080B07050D0B8B0C09070B07050C0B0A0866655FF00
            FFFF00FFFF00FFFF00FFA59585FFF0F0FFC8B0C08870E0D0C0F0C8B0C08870D0
            C0B0F0C8B0C08870D0B0A0866D55FF00FFFF00FFFF00FFFF00FFA59C94FFF0F0
            E0E0E0E0D8D0E0D0D0E0D0D0E0C8C0D0C8C0D0C0B0D0C0B0D0B8B0866D55FF00
            FFFF00FFFF00FFFF00FFB4A494FFF8F09080D04030A0E0D8D09080D04030A0E0
            C8C09080D04030A0D0C0B0867564FF00FFFF00FFFF00FFFF00FFB4A4A3FFF8F0
            C0C0E09080D0E0E0E0C0C0E09080D0E0D0D0C0C0E09080D0D0C0C0957564FF00
            FFFF00FFFF00FFFF00FFB4ABA3FFF8FFFFE0D0FFD0B0FFD0B0FFC090F0B890D0
            A080D0A080D0B0A0D0C8C0957C73FF00FFFF00FFFF00FFFF00FFB4ABA3FFFFFF
            FF9860FFA060FFA060FFA060FFA060FFA060FFA060B06850C0A890958473FF00
            FFFF00FFFF00FFFF00FFB4B3A3FFFFFFE07840F0D8D0F0D8D0F0C8B0E0B0A0E0
            A080E08050A05830D0A090958473FF00FFFF00FFFF00FFFF00FFDAC7C0BEB3A9
            F0B8A0D09070D08860D08050D07040D06830C06030D08060A08880C6A891FF00
            FFFF00FFFF00FFFF00FFFF00FFCCC4B3B0A8A0B0A8A0B0A090B09890B09890A0
            9890A09080A08880C9AE98FF00FFFF00FFFF00FFFF00FFFF00FF}
          Caption = ''
          ParentColor = False
          Color = clWindow
          OnClick = sbtnCalculateBOL_AllClick
        end
        object Bevel5: TUniPanel
          Left = 28
          Top = 3
          Width = 2
          Height = 21
          Hint = ''
          TabOrder = 2
          Caption = ''
        end
        object sbtnRequestEstimate: TUniSpeedButton
          Left = 31
          Top = 1
          Width = 25
          Height = 25
          Hint = 'No Web Service specified for this Ship Via!'
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
          OnClick = sbtnRequestEstimateClick
        end
      end
      object wwDataInspector1: TwwDataInspector
        Left = 0
        Top = 27
        Width = 214
        Height = 112
        DisableThemes = False
        Align = alClient
        TabOrder = 1
        DataSource = SrcHeader
        Items = <
          item
            DataSource = SrcHeader
            DataField = 'ID'
            Caption = 'ID'
            WordWrap = False
          end>
        DefaultRowHeight = 19
        CaptionWidth = 100
        Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        LineStyleCaption = ovDottedLine
        LineStyleData = ovDottedLine
      end
    end
    object pnlHdrClient01: TUniPanel
      Left = 218
      Top = 1
      Width = 348
      Height = 139
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object wwDBGridItem: TIQUniGridControl
        Left = 1
        Top = 27
        Width = 346
        Height = 112
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 129
        IQComponents.Grid.Height = 26
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcItem
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
        IQComponents.Navigator.DataSource = SrcItem
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 129
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 26
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcItem
        Marker = 0
      end
      object Panel2: TUniPanel
        Left = 1
        Top = 1
        Width = 346
        Height = 27
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Caption = ''
        object NavItem: TUniDBNavigator
          Left = 231
          Top = 1
          Width = 115
          Height = 25
          Hint = ''
          DataSource = SrcItem
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
    end
  end
  object pnlClient01: TUniPanel
    Left = 0
    Top = 145
    Width = 566
    Height = 149
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel1: TUniPanel
      Left = 1
      Top = 1
      Width = 564
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object sbtnCalculateBOL: TUniSpeedButton
        Left = 1
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Calculate BOL for selected item'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FF00FF806860
          806050705840705840705040705040605040605030605030705040E0E0E00000
          00FF00FFFF00FFFF00FF877766D0C0B0D0B8B0D0B0A0C0B0A0C0A8A0C0A8A0C0
          A090C0A090B0A090E0E0E0000000000000000000FF00FFFF00FF967E66F0E0D0
          D0C0B0D0B8B0D0B0B0C0B0A0C0A8A0C0A8A0D0C8C0E0E0E00000000000000000
          00000000000000FF00FF967E75F0E0D0C08870B07050D0B8B0C08870B07050C0
          B0A0E0E0E0000000000000000000000000000000000000000000968675F0E0E0
          FFC8B0C08870D0C0B0F0C8B0C08870C0B0A0E0E0E0D0C8C0C6A891C6A891FF00
          FFFF00FFFF00FFFF00FF968D85F0E8E0E0D0C0D0C8C0D0C0C0D0C0B0D0B8B0D0
          B8B0C0B0A0C0B0A0C0A8A0776655FF00FFFF00FFFF00FFFF00FFA58D85FFE8E0
          C09070B07050E0C8C0C09080B07050D0B8B0C09070B07050C0B0A0866655FF00
          FFFF00FFFF00FFFF00FFA59585FFF0F0FFC8B0C08870E0D0C0F0C8B0C08870D0
          C0B0F0C8B0C08870D0B0A0866D55FF00FFFF00FFFF00FFFF00FFA59C94FFF0F0
          E0E0E0E0D8D0E0D0D0E0D0D0E0C8C0D0C8C0D0C0B0D0C0B0D0B8B0866D55FF00
          FFFF00FFFF00FFFF00FFB4A494FFF8F09080D04030A0E0D8D09080D04030A0E0
          C8C09080D04030A0D0C0B0867564FF00FFFF00FFFF00FFFF00FFB4A4A3FFF8F0
          C0C0E09080D0E0E0E0C0C0E09080D0E0D0D0C0C0E09080D0D0C0C0957564FF00
          FFFF00FFFF00FFFF00FFB4ABA3FFF8FFFFE0D0FFD0B0FFD0B0FFC090F0B890D0
          A080D0A080D0B0A0D0C8C0957C73FF00FFFF00FFFF00FFFF00FFB4ABA3FFFFFF
          FF9860FFA060FFA060FFA060FFA060FFA060FFA060B06850C0A890958473FF00
          FFFF00FFFF00FFFF00FFB4B3A3FFFFFFE07840F0D8D0F0D8D0F0C8B0E0B0A0E0
          A080E08050A05830D0A090958473FF00FFFF00FFFF00FFFF00FFDAC7C0BEB3A9
          F0B8A0D09070D08860D08050D07040D06830C06030D08060A08880C6A891FF00
          FFFF00FFFF00FFFF00FFFF00FFCCC4B3B0A8A0B0A8A0B0A090B09890B09890A0
          9890A09080A08880C9AE98FF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = sbtnCalculateBOLClick
      end
      object NavBOL: TUniDBNavigator
        Left = 315
        Top = 1
        Width = 249
        Height = 25
        Hint = ''
        DataSource = SrcEstimate_Bol
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
    object wwDBGridBol: TIQUniGridControl
      Left = 1
      Top = 27
      Width = 564
      Height = 122
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 347
      IQComponents.Grid.Height = 36
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcEstimate_Bol
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
      IQComponents.Navigator.DataSource = SrcEstimate_Bol
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 347
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 36
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcEstimate_Bol
      Columns = <
        item
          FieldName = 'VOLUME'
          Title.Caption = 'Volume'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CLASS'
          Title.Caption = 'Class'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'BUMPED'
          Title.Caption = 'Bumped'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'NMFC_CODE'
          Title.Caption = 'NMFC'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'COMMENT1'
          Title.Caption = 'Comment'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'LBS_CU_FT'
          Title.Caption = 'Weight/Volume Act'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Lbs_Cu_Ft_Std'
          Title.Caption = 'Weight/Volume Std'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'WEIGHT'
          Title.Caption = 'Total Weight'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TOTAL_BOXES'
          Title.Caption = 'Total Boxes'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'BOX_QTY'
          Title.Caption = 'Box Qty'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
    object wwDBLookupComboNMFC: TUniDBLookupComboBox
      Left = 213
      Top = 73
      Width = 121
      Height = 21
      Hint = ''
      ListFieldIndex = 0
      TabOrder = 2
      Color = clWindow
    end
    object wwDBComboDlgWeight: TUniEdit
      Left = 213
      Top = 103
      Width = 121
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 3
    end
  end
  object popmCalculateDropDownAll: TUniPopupMenu
    Left = 128
    Top = 54
    object CalculateByUserDefinedWeightAndVolumeForAllItems1: TUniMenuItem
      Caption = 'By User-Defined Weight and Volume for All Items'
      OnClick = CalculateByUserDefinedWeightAndVolumeForAllItems1Click
    end
    object CalculateByDefaultSystemValuesForAllItems1: TUniMenuItem
      Caption = 'By Default System Values for All Items'
      OnClick = CalculateByDefaultSystemValuesForAllItems1Click
    end
  end
  object popmCalculateDropDownSelected: TUniPopupMenu
    Left = 160
    Top = 54
    object CalculateByUserDefinedWeightAndVolumeSelectedItem1: TUniMenuItem
      Caption = 'By User-Defined Weight and Volume for Selected Item'
      OnClick = CalculateByUserDefinedWeightAndVolumeSelectedItem1Click
    end
    object CalculateByDefaultSystemValuesForSelectedItem1: TUniMenuItem
      Caption = 'By Default System Values for Selected Item'
      OnClick = CalculateByDefaultSystemValuesForSelectedItem1Click
    end
  end
  object SrcHeader: TDataSource
    DataSet = QryHeader
    Left = 83
    Top = 216
  end
  object SrcItem: TDataSource
    DataSet = QryItem
    Left = 118
    Top = 216
  end
  object QryHeader: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      '-- stub'
      'select id from orders where rownum < 2')
    Left = 83
    Top = 230
    object QryHeaderID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
  end
  object QryItem: TFDQuery
    OnCalcFields = QryItemCalcFields
    MasterSource = SrcHeader
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      '-- stub'
      'select id from ord_detail where rownum < 2')
    Left = 118
    Top = 230
    object QryItemSource: TStringField
      FieldKind = fkCalculated
      FieldName = 'Source'
      Calculated = True
    end
    object QryItemSource_ID: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Source_ID'
      Calculated = True
    end
    object QryItemID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
  end
  object SrcEstimate_Bol: TDataSource
    DataSet = QryEstimate_Bol
    Left = 155
    Top = 217
  end
  object QryNMFC: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       code,'
      '       descrip'
      '  from nmfc'
      ' order by code')
    Left = 357
    Top = 217
    object QryNMFCCODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 25
      FieldName = 'CODE'
      Origin = 'IQ.NMFC.CODE'
      Size = 25
    end
    object QryNMFCDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 50
      FieldName = 'DESCRIP'
      Origin = 'IQ.NMFC.DESCRIP'
      Size = 50
    end
    object QryNMFCID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.NMFC.ID'
      Visible = False
      Size = 0
    end
  end
  object QryEstimate_Bol: TFDQuery
    BeforePost = QryEstimate_BolBeforePost
    OnCalcFields = QryEstimate_BolCalcFields
    OnNewRecord = QryEstimate_BolNewRecord
    MasterSource = SrcItem
    MasterFields = 'Source;ID'
    Connection = UniMainModule.FDConnection1
    UpdateObject = UpdateSQLEstimateBOL
    SQL.Strings = (
      'select id,'
      '       volume,'
      '       class,'
      '       bumped,'
      '       nmfc_code,'
      '       comment1,'
      '       lbs_cu_ft,'
      '       weight,'
      '       total_boxes,'
      '       box_qty,'
      '       source,'
      '       source_id,'
      '       charge'
      '  from ESTIMATE_BOL'
      ' where source = :source'
      '   and source_id = :id'
      ' order by id'
      '')
    Left = 155
    Top = 229
    ParamData = <
      item
        Name = 'Source'
        DataType = ftString
        ParamType = ptInput
        Size = 21
      end
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryEstimate_BolVOLUME: TFMTBCDField
      DisplayLabel = 'Volume'
      DisplayWidth = 7
      FieldName = 'VOLUME'
      Origin = 'IQ.ESTIMATE_BOL.VOLUME'
      Size = 6
    end
    object QryEstimate_BolCLASS: TBCDField
      DisplayLabel = 'Class'
      DisplayWidth = 7
      FieldName = 'CLASS'
      Origin = 'IQ.ESTIMATE_BOL.CLASS'
      Size = 2
    end
    object QryEstimate_BolBUMPED: TStringField
      DisplayLabel = 'Bumped'
      DisplayWidth = 7
      FieldName = 'BUMPED'
      Origin = 'IQ.ESTIMATE_BOL.BUMPED'
      FixedChar = True
      Size = 1
    end
    object QryEstimate_BolNMFC_CODE: TStringField
      DisplayLabel = 'NMFC'
      DisplayWidth = 9
      FieldName = 'NMFC_CODE'
      Origin = 'IQ.ESTIMATE_BOL.NMFC_CODE'
      Size = 25
    end
    object QryEstimate_BolCOMMENT1: TStringField
      DisplayLabel = 'Comment'
      DisplayWidth = 10
      FieldName = 'COMMENT1'
      Origin = 'IQ.ESTIMATE_BOL.COMMENT1'
      Size = 2000
    end
    object QryEstimate_BolLBS_CU_FT: TFMTBCDField
      DisplayLabel = 'Weight/Volume Act'
      DisplayWidth = 18
      FieldName = 'LBS_CU_FT'
      Origin = 'IQ.ESTIMATE_BOL.LBS_CU_FT'
      DisplayFormat = '########0.00'
      Size = 6
    end
    object QryEstimate_BolLbs_Cu_Ft_Std: TFloatField
      DisplayLabel = 'Weight/Volume Std'
      DisplayWidth = 18
      FieldKind = fkCalculated
      FieldName = 'Lbs_Cu_Ft_Std'
      ReadOnly = True
      DisplayFormat = '########0.00'
      Calculated = True
    end
    object QryEstimate_BolWEIGHT: TFMTBCDField
      DisplayLabel = 'Total Weight'
      DisplayWidth = 10
      FieldName = 'WEIGHT'
      Origin = 'IQ.ESTIMATE_BOL.WEIGHT'
      Size = 6
    end
    object QryEstimate_BolTOTAL_BOXES: TFMTBCDField
      DisplayLabel = 'Total Boxes'
      DisplayWidth = 10
      FieldName = 'TOTAL_BOXES'
      Origin = 'IQ.ESTIMATE_BOL.TOTAL_BOXES'
      DisplayFormat = '########0.00'
      Size = 6
    end
    object QryEstimate_BolBOX_QTY: TFMTBCDField
      DisplayLabel = 'Box Qty'
      DisplayWidth = 10
      FieldName = 'BOX_QTY'
      Origin = 'IQ.ESTIMATE_BOL.BOX_QTY'
      DisplayFormat = '########0.00'
      Size = 6
    end
    object QryEstimate_BolCHARGE: TFMTBCDField
      DisplayLabel = 'Freight Charge'
      DisplayWidth = 10
      FieldName = 'CHARGE'
      Origin = 'IQ.ESTIMATE_BOL.CHARGE'
      ReadOnly = True
      Visible = False
      Size = 6
    end
    object QryEstimate_BolID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.ESTIMATE_BOL.ID'
      Visible = False
      Size = 0
    end
    object QryEstimate_BolSOURCE: TStringField
      FieldName = 'SOURCE'
      Origin = 'IQ.ESTIMATE_BOL.SOURCE'
      Visible = False
      Size = 30
    end
    object QryEstimate_BolSOURCE_ID: TBCDField
      FieldName = 'SOURCE_ID'
      Origin = 'IQ.ESTIMATE_BOL.SOURCE_ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQLEstimateBOL: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into ESTIMATE_BOL'
      
        '  (ID, VOLUME, CLASS, BUMPED, NMFC_CODE, COMMENT1, LBS_CU_FT, WE' +
        'IGHT, TOTAL_BOXES, '
      '   BOX_QTY, SOURCE, SOURCE_ID, CHARGE)'
      'values'
      
        '  (:ID, :VOLUME, :CLASS, :BUMPED, :NMFC_CODE, :COMMENT1, :LBS_CU' +
        '_FT, :WEIGHT, '
      '   :TOTAL_BOXES, :BOX_QTY, :SOURCE, :SOURCE_ID, :CHARGE)')
    ModifySQL.Strings = (
      'update ESTIMATE_BOL'
      'set'
      '  ID = :ID,'
      '  VOLUME = :VOLUME,'
      '  CLASS = :CLASS,'
      '  BUMPED = :BUMPED,'
      '  NMFC_CODE = :NMFC_CODE,'
      '  COMMENT1 = :COMMENT1,'
      '  LBS_CU_FT = :LBS_CU_FT,'
      '  WEIGHT = :WEIGHT,'
      '  TOTAL_BOXES = :TOTAL_BOXES,'
      '  BOX_QTY = :BOX_QTY,'
      '  SOURCE = :SOURCE,'
      '  SOURCE_ID = :SOURCE_ID,'
      '  CHARGE = :CHARGE'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from ESTIMATE_BOL'
      'where'
      '  ID = :OLD_ID')
    Left = 156
    Top = 245
  end
  object PopupMenuBol: TUniPopupMenu
    Left = 186
    Top = 54
    object CalculateBOLWeight1: TUniMenuItem
      Caption = 'Calculate BOL Weight'
      OnClick = wwDBComboDlgWeightCustomDlg
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 127
    Top = 88
    object File1: TUniMenuItem
      Caption = '&File'
      object miTroubleshooting1: TUniMenuItem
        Caption = 'Troubleshooting...'
        Hint = 
          'This writes requested and received data to theIQCheckPointList.t' +
          'xt file.'
        OnClick = miTroubleshooting1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmEstimateBOLBase'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 193463 $'
    BuildVersion = '176554'
    Left = 160
    Top = 87
  end
end
