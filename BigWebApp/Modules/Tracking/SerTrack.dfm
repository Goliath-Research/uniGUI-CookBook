object FrmTrackSer: TFrmTrackSer
  Left = 73
  Top = 158
  HelpContext = 1423489
  ClientHeight = 713
  ClientWidth = 903
  Caption = ''
  OnShow = FormShow
  OnResize = FormResize
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PanelMain: TUniPanel
    Left = 0
    Top = 0
    Width = 903
    Height = 713
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 0
      Top = 353
      Width = 903
      Height = 3
      Cursor = crVSplit
      Hint = ''
      Align = alTop
      ParentColor = False
      Color = clBtnFace
    end
    object PageControl1: TUniPageControl
      Left = 1
      Top = 356
      Width = 901
      Height = 357
      Hint = ''
      ActivePage = tabPallets
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object tabPallets: TUniTabSheet
        Hint = ''
        Caption = 'Containers'
        object Splitter2: TUniSplitter
          Left = 0
          Top = 145
          Width = 893
          Height = 3
          Cursor = crVSplit
          Hint = ''
          Align = alTop
          ParentColor = False
          Color = clBtnFace
        end
        object Panel2: TUniPanel
          Left = 0
          Top = 0
          Width = 893
          Height = 145
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = ''
          object IQSearch1: TIQUniGridControl
            Left = 1
            Top = 1
            Width = 891
            Height = 143
            Layout = 'border'
            ParentAlignmentControl = False
            AlignmentControl = uniAlignmentClient
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            IQComponents.Grid.Left = 0
            IQComponents.Grid.Top = 29
            IQComponents.Grid.Width = 674
            IQComponents.Grid.Height = 57
            IQComponents.Grid.Hint = ''
            IQComponents.Grid.DataSource = SrcMasterLblDtl
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
            IQComponents.Navigator.DataSource = SrcMasterLblDtl
            IQComponents.Navigator.LayoutConfig.Region = 'east'
            IQComponents.Navigator.TabOrder = 3
            IQComponents.HiddenPanel.Left = 674
            IQComponents.HiddenPanel.Top = 29
            IQComponents.HiddenPanel.Width = 209
            IQComponents.HiddenPanel.Height = 57
            IQComponents.HiddenPanel.Hint = ''
            IQComponents.HiddenPanel.Visible = True
            IQComponents.HiddenPanel.Align = alRight
            IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
            IQComponents.FormTab.Hint = ''
            IQComponents.FormTab.ImageIndex = 1
            IQComponents.FormTab.Caption = 'Form'
            IQComponents.FormTab.Layout = 'border'
            DataSource = SrcMasterLblDtl
            Columns = <
              item
                FieldName = 'CLASS'
                Title.Caption = 'Class'
                Width = 2
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'ITEMNO'
                Title.Caption = 'Itemno'
                Width = 25
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'DESCRIP'
                Title.Caption = 'Description'
                Width = 35
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'DESCRIP2'
                Title.Caption = 'Ext. Description'
                Width = 100
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'MFGNO'
                Title.Caption = 'Mfg#'
                Width = 25
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'PONO'
                Title.Caption = 'PO#'
                Width = 20
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'FG_LOTNO'
                Title.Caption = 'Lot#'
                Width = 25
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'SERIAL'
                Title.Caption = 'Serial#'
                Width = 9
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'QTY'
                Title.Caption = 'Qty.'
                Width = 10
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'LOC_DESC'
                Title.Caption = 'Location'
                Width = 30
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'USER_NAME'
                Title.Caption = 'User'
                Width = 35
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'ORDERNO'
                Title.Caption = 'Order#'
                Width = 15
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'ORIG_SYSDATE'
                Title.Caption = 'Original Date'
                Width = 18
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'ORIG_USER_NAME'
                Title.Caption = 'Original User'
                Width = 35
                CheckBoxField.FieldValues = 'true;false'
              end>
            Marker = 0
          end
        end
        object Panel3: TUniPanel
          Left = 0
          Top = 148
          Width = 893
          Height = 181
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object Label1: TUniLabel
            Left = 1
            Top = 1
            Width = 103
            Height = 13
            Hint = ''
            Caption = 'Pallets Foreign Labels'
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
          object IQSearchForeign2: TIQUniGridControl
            Left = 1
            Top = 13
            Width = 891
            Height = 168
            Layout = 'border'
            ParentAlignmentControl = False
            AlignmentControl = uniAlignmentClient
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            IQComponents.Grid.Left = 0
            IQComponents.Grid.Top = 29
            IQComponents.Grid.Width = 674
            IQComponents.Grid.Height = 82
            IQComponents.Grid.Hint = ''
            IQComponents.Grid.DataSource = SrcForeign2
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
            IQComponents.Navigator.DataSource = SrcForeign2
            IQComponents.Navigator.LayoutConfig.Region = 'east'
            IQComponents.Navigator.TabOrder = 3
            IQComponents.HiddenPanel.Left = 674
            IQComponents.HiddenPanel.Top = 29
            IQComponents.HiddenPanel.Width = 209
            IQComponents.HiddenPanel.Height = 82
            IQComponents.HiddenPanel.Hint = ''
            IQComponents.HiddenPanel.Visible = True
            IQComponents.HiddenPanel.Align = alRight
            IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
            IQComponents.FormTab.Hint = ''
            IQComponents.FormTab.ImageIndex = 1
            IQComponents.FormTab.Caption = 'Form'
            IQComponents.FormTab.Layout = 'border'
            DataSource = SrcForeign2
            Columns = <
              item
                FieldName = 'SERIAL'
                Title.Caption = 'Serial #'
                Width = 25
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'SCAN_DATE'
                Title.Caption = 'Scan Date'
                Width = 18
                CheckBoxField.FieldValues = 'true;false'
              end>
            Marker = 0
          end
        end
      end
      object tabForeign: TUniTabSheet
        Hint = ''
        ImageIndex = 1
        Caption = 'Foreign Labels'
        object IQSearchForeign1: TIQUniGridControl
          Left = 0
          Top = 0
          Width = 893
          Height = 329
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 676
          IQComponents.Grid.Height = 243
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcForeign1
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
          IQComponents.Navigator.DataSource = SrcForeign1
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 676
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 243
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcForeign1
          Columns = <
            item
              FieldName = 'SERIAL'
              Title.Caption = 'Serial #'
              Width = 25
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'SCAN_DATE'
              Title.Caption = 'Scan Date'
              Width = 18
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
        end
      end
      object TabSRepackTo: TUniTabSheet
        Hint = ''
        ImageIndex = 2
        Caption = 'Repacked To SN#'
        object IQSearch2: TIQUniGridControl
          Left = 0
          Top = 0
          Width = 893
          Height = 329
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 676
          IQComponents.Grid.Height = 243
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcRepackedTo
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
          IQComponents.Navigator.DataSource = SrcRepackedTo
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 676
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 243
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcRepackedTo
          Columns = <
            item
              FieldName = 'FG_LOTNO'
              Title.Caption = 'Lot#'
              Width = 25
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'SERIAL'
              Title.Caption = 'Serial#'
              Width = 9
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'QTY'
              Title.Caption = 'Qty.'
              Width = 10
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'LOC_DESC'
              Title.Caption = 'Location'
              Width = 30
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
        end
      end
    end
    object Panel8: TUniPanel
      Left = 1
      Top = 1
      Width = 901
      Height = 353
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      object Panel1: TUniPanel
        Left = 1
        Top = 1
        Width = 899
        Height = 27
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        object sbtnSearch: TUniSpeedButton
          Left = 1
          Top = 1
          Width = 25
          Height = 25
          Hint = 'Search Serial #'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB18C76A07860
            90604090584090584087492AFF00FFFF00FFFF00FFB485659C755DA070509058
            40905030773818FF00FFB09080FFF8FFE0C8C0D0A090C08060804020FF00FFFF
            00FFFF00FFB08060F0E8E0E0C8C0D0A890B07850804820FF00FFB09080FFF8FF
            E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
            B0C08870804830FF00FFB09080FFF8FFE0C8C0D0A090C08060804020FF00FFFF
            00FFFF00FFB08060F0E8E0F0E0E0E0C0B0C08870804830FF00FFC09880FFFFFF
            F0E8E0E0C8C0D0A080804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
            B0C08870804830FF00FFC3A494B08870A068509050308048308048208038108F
            4C26B08870A06850905830904830804020703810905830FF00FFDEC4B4B08870
            FFFFFFE0D0C0D0A090A07050804010D5B89CB09070E0D8D0F0D8D0D0A090B078
            50803820CFA98AFF00FFFF00FFC09080F0F0F0FFF8F0F0D8C0B0806080482096
            5732B09070FFFFFFFFF8F0F0D0C0B07850804820FF00FFFF00FFFF00FFF8E2D2
            C09880B08060A068509050309058409D6842B07860B08870A070508048308048
            20ECC4A7FF00FFFF00FFFF00FFFF00FFC09880FFF8FFE0C0B0C09070804820FF
            00FFC09880FFF8FFE0C8B0D0A080804820FF00FFFF00FFFF00FFFF00FFFF00FF
            CFB1A1B09080A06850905030875139FF00FFC0A890B09080A06850905030864F
            37FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1836DFFF8F0814527FF00FFFF
            00FFFF00FFB08068FFF8F0804324FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFC7A898B48D759D6843FF00FFFF00FFFF00FFCEAE9CB48C749C6640FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Caption = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          ParentColor = False
          Color = clWindow
          OnClick = SearchSerial1Click
        end
        object sbtnReprint: TUniSpeedButton
          Left = 25
          Top = 1
          Width = 25
          Height = 25
          Hint = 'Reprint Label'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000130B0000130B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFCCCBCBCDC5BEC4BBAFC2B9ADC6C1B8CAC9C6FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCEA483BB
            875DBD9872BF9A76B68B63A87B4DA57A4AAB875BB7A180FF00FFFF00FFC6AFA6
            B87E63C38F6EC7A289CEAA8FE79977E3B79BF9F5F0F4EDE7EEE3DAE8DACDE0CD
            BBD8BDA3B0885AFF00FFFF00FFB87C5CC18660E29252D58349D8926CEDA888EF
            D8C6FFFFFFFFFFFFFFFFFFFFFFFFFFFDFDCBAD8ACFA27EFF00FFC4A89ACB8654
            C8ADA6FFFDFDC1A08EC58E69E6C1A3FDF9F4FDFDFAFFFFFFFFFFFFFFFDFDCFB2
            91D59671D2BAA5FF00FFC18D71E6B387CBAFA3FFF6EDAB7058AF6E3D9D6C40AF
            7B4CC8905DD59F72EDBB94CBA37AC89B75D08D60CCC6C1FF00FFC79477EAD3BE
            D3B19FFDECD5C87055DA683CE67745D27447BA6D44A6633B90562BB1683BF9F0
            E8DBAC8DCCC1B9FF00FFCB9F84E0D3CFEAC19DFDE0C1DA6240F4693CFA7244FA
            7043FA6C3CFA6E3FF77142E7744FFBEDDDD8A380CCC6C1FF00FFCAAB9DDAB6A3
            FFCB92E0AA8EC85937E07B56E78B6A6544196544196544196544196544196544
            19654419654419FF00FFC6AA9ED7A079E8B17FC47655C47854BE7754654419EF
            D6BDEFD6BDEFD6BDEFD6BDEFD6BDEFD6BDEFD6BDE4CAB1654419FF00FFCCC7C3
            CCAF9AB97B58BC7151C27454654419FFEAD5C7B7A6948B820F0F0F55504B948B
            82AFA59AFFEAD5654419FF00FFFF00FFFF00FFCB9877E38C6FD39E7D654419FF
            F3E6070707D2D2D20F0F0FD2D2D20F0F0F7F7C79FFF3E6654419FF00FFFF00FF
            FF00FFAE7656A3694EB67D5B654419FFF7F0070707D2D2D20F0F0FD2D2D20F0F
            0F7F7E7EFFF7F0654419FF00FFFF00FFFF00FFCFB197B98862B17C58654419FF
            FFFF070707D2D2D20F0F0FD2D2D20F0F0F7F7F7FFFFFFF654419FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF654419FFFFFF2E2922D2D2D20F0F0FD2D2D20F0F
            0F88837CFFFFFF654419FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA3
            8F75A38F75A38F75A38F75A38F75A38F75A38F75A38F75FF00FF}
          Caption = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          ParentColor = False
          Color = clWindow
          OnClick = sbtnReprintClick
        end
        object sbtnTransPlan: TUniSpeedButton
          Tag = 1999
          Left = 50
          Top = 1
          Width = 25
          Height = 25
          Hint = 'Inventory Move Transaction Location Plan Simulation'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            1800000000000006000000000000000000000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2098C0
            1070901068801068800060800060700058700058700050600050600048600048
            60004050004050004050FF00FF9D9D9D7474746A6A6A6A6A6A6565656161615B
            5B5B5B5B5B5151515151514B4B4B4B4B4B424242424242424242FF00FF20A0C0
            80D0FF80D0FF80D0FF70D0FF70C8FF60C0FF60C0FF50B8FF50B0FF40A8FF30A0
            F030A0F03098F0004050FF00FFA3A3A3D8D8D8D8D8D8D8D8D8D7D7D7D1D1D1CB
            CBCBCBCBCBC6C6C6C1C1C1BBBBBBB1B1B1B1B1B1ACACAC424242FF00FF20A0D0
            80D0FF2090B080D0FF2090B070D0FF2088B060C0FF1080A050B8FF1078A040A8
            FF10709030A0F0005060FF00FFA7A7A7D8D8D8939393D8D8D8939393D7D7D78E
            8E8ECBCBCB848484C6C6C67E7E7EBBBBBB747474B1B1B1515151FF00FF20A0D0
            20A0D02090B020A0D02090B020A0C02088B02098C01080A01088B01078A01080
            A0107090107890007090FF00FFA7A7A7A7A7A7939393A7A7A7939393A3A3A38E
            8E8E9D9D9D8484848E8E8E7E7E7E8484847474747A7A7A747474D07040D07040
            D07040D06840C06030B05830A05020A04820904010904010903810FF00FFFF00
            FFFF00FFFF00FFFF00FF7373737373737373736E6E6E6464645C5C5C5353534D
            4D4D4444444444443F3F3FFF00FFFF00FFFF00FFFF00FFFF00FFD07040FFA080
            F08050F07840E07040E07030707070505850000000C07050D9E3E2FF00FFFF00
            FFFF00FFFF00FFFF00FF737373A4A4A48585857E7E7E76767674747470707055
            5555000000737373E3E3E3FF00FFFF00FFFF00FFFF00FFFF00FFD07040FFB090
            903810904020B05020C06030A0A0A0FFFFFF5090B0101010B8CFD4FF00FFFF00
            FFFF00FFFF00FFFF00FF737373B1B1B13F3F3F454545555555646464A0A0A0FF
            FFFF949494101010CFCFCFFF00FFFF00FFFF00FFFF00FFFF00FFD07850FFB890
            A04820D8E9ECD07040F08050A0A0A090B8C070D0E05098B0101010B8CFD4FF00
            FFFF00FFFF00FFFF00FF7A7A7AB8B8B84D4D4DE9E9E9737373858585A0A0A0B7
            B7B7CFCFCF9A9A9A101010CFCFCFFF00FFFF00FFFF00FFFF00FFE07850FFC0A0
            C06030D07050FF8850FF9860C0806050A0B090E0F060C0D05098B0101010ADC6
            CCFF00FFFF00FFFF00FF7D7D7DC0C0C06464647575758D8D8D9A9A9A818181A0
            A0A0E0E0E0BFBFBF9A9A9A101010C6C6C6FF00FFFF00FFFF00FFE08060FFC8A0
            D07040FFA870FFA070D07850DBDDD8C1D6DC50A0B090E0F060C0D05098B01010
            10ADC6CCFF00FFFF00FF858585C6C6C6737373A7A7A7A1A1A17A7A7ADCDCDCD6
            D6D6A0A0A0E0E0E0BFBFBF9A9A9A101010C6C6C6FF00FFFF00FFE08860FFC8A0
            FFB890FFB080D07850DBDDD8FF00FFFF00FFC1D6DC60A8B090E0F060C0D05098
            B0101010B8CDD1FF00FF8A8A8AC6C6C6B8B8B8AFAFAF7A7A7ADCDCDCFF00FFFF
            00FFD6D6D6A6A6A6E0E0E0BFBFBF9A9A9A101010CDCDCDFF00FFE09070FFC8A0
            FFB890E08850DBDDD8FF00FFFF00FFFF00FFFF00FFC1D6DC70B0C090E0F070C8
            E0808880303890A3B1CA929292C6C6C6B8B8B8888888DCDCDCFF00FFFF00FFFF
            00FFFF00FFD6D6D6B1B1B1E0E0E0C9C9C9868686545454B6B6B6E09870FFC0A0
            E09070DBDDD8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1D6DC80B0C0D0B8
            B07088D06070B0303890989898C0C0C0929292DCDCDCFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFD6D6D6B1B1B1B8B8B89A9A9A808080545454E09880E0A080
            DBDDD8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1D6DC6070
            B07090E06078D06070B09A9A9AA0A0A0DCDCDCFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFD6D6D6808080A4A4A48F8F8F808080E0A080FF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB7C8
            DE6070B06070B0C1D3E3A0A0A0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFCCCCCC808080808080D6D6D6}
          Caption = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          ParentColor = False
          Color = clWindow
          OnClick = sbtnTransPlanClick
        end
      end
      object Panel4: TUniPanel
        Left = 1
        Top = 27
        Width = 899
        Height = 326
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object Splitter3: TUniSplitter
          Left = 385
          Top = 0
          Width = 6
          Height = 326
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object Panel5: TUniPanel
          Left = 1
          Top = 1
          Width = 385
          Height = 324
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object StringGrid1: TUniStringGrid
            Left = 1
            Top = 1
            Width = 383
            Height = 322
            Hint = ''
            FixedCols = 0
            RowCount = 2
            ColCount = 3
            DefaultColWidth = 220
            DefaultRowHeight = 17
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goThumbTracking]
            Columns = <>
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
          end
        end
        object Panel6: TUniPanel
          Left = 391
          Top = 1
          Width = 508
          Height = 324
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object PCTrack: TUniPageControl
            Left = 1
            Top = 1
            Width = 506
            Height = 322
            Hint = ''
            ActivePage = TabSer
            TabBarVisible = True
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            object TabSer: TUniTabSheet
              Hint = ''
              Caption = ' Serial # Transaction Tracking'
              object Panel7: TUniPanel
                Tag = 1999
                Left = 0
                Top = 0
                Width = 498
                Height = 27
                Hint = ''
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                Alignment = taLeftJustify
                Caption = ''
                object NavTransLog: TUniDBNavigator
                  Left = 398
                  Top = 1
                  Width = 100
                  Height = 25
                  Hint = ''
                  DataSource = SrcTransLog
                  VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
                  Align = alRight
                  Anchors = [akTop, akRight, akBottom]
                  TabOrder = 0
                end
              end
              object DBGridTransLog: TUniDBGrid
                Left = 0
                Top = 27
                Width = 498
                Height = 267
                Hint = ''
                DataSource = SrcTransLog
                ReadOnly = True
                LoadMask.Message = 'Loading data...'
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
                Columns = <
                  item
                    FieldName = 'TRANS_DATE'
                    Title.Caption = 'Date'
                    Width = 112
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'TRANS_IN_OUT'
                    Title.Caption = 'In/Out'
                    Width = 36
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'TRANS_TYPE'
                    Title.Caption = 'Trans Type'
                    Width = 95
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'LABEL_QTY'
                    Title.Caption = 'SN Qty'
                    Width = 64
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'TRANS_QUAN'
                    Title.Caption = 'Tran Qty'
                    Width = 48
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'BEGIN_QUAN'
                    Title.Caption = 'Start Qty'
                    Width = 48
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'RG_QUAN'
                    Title.Caption = 'Tran RG'
                    Width = 48
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'BEGIN_RG_QUAN'
                    Title.Caption = 'Start RG'
                    Width = 48
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'LOC_DESC'
                    Title.Caption = 'Location'
                    Width = 78
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'LOTNO'
                    Title.Caption = 'Lot#'
                    Width = 73
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'ACT_COST'
                    Title.Caption = 'Act Cost'
                    Width = 51
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'STD_COST'
                    Title.Caption = 'Std Cost'
                    Width = 64
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'TRANS_REASON'
                    Title.Caption = 'Reason'
                    Width = 111
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'USERID'
                    Title.Caption = 'User'
                    Width = 49
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'FG_LOTNO'
                    Title.Caption = 'FG Lot#'
                    Width = 103
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'FGMULTI_CUSER1'
                    Title.Caption = 'CUser1'
                    Width = 154
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'FGMULTI_CUSER2'
                    Title.Caption = 'CUser2'
                    Width = 154
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'FGMULTI_CUSER3'
                    Title.Caption = 'CUser3'
                    Width = 154
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'TRANS_CODE'
                    Title.Caption = 'Tran Code'
                    Width = 64
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'TRANS_DESCRIP'
                    Title.Caption = 'Tran Description'
                    Width = 120
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'RECEIPTNO'
                    Title.Caption = 'Receipt#'
                    Width = 119
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'DIVISION_NAME'
                    Title.Caption = 'Division'
                    Width = 79
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'LOCATION_DESCRIP'
                    Title.Caption = 'Location Description'
                    Width = 181
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'BEGIN_QUAN_TOTAL'
                    Title.Caption = 'Total Start Qty'
                    Width = 82
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'BEGIN_RG_QUAN_TOTAL'
                    Title.Caption = 'Total Start RG'
                    Width = 82
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'EPLANT_ID'
                    Title.Caption = 'EPlant ID'
                    Width = 64
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'POSTED'
                    Title.Caption = 'Posted'
                    Width = 37
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'SYSTEM_DATE'
                    Title.Caption = 'System Date'
                    Width = 112
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'FGMULTI_ID'
                    Title.Caption = 'Location ID'
                    Width = 64
                    CheckBoxField.FieldValues = 'true;false'
                  end>
              end
            end
            object TabDim: TUniTabSheet
              Hint = ''
              ImageIndex = 2
              Caption = 'Dimensional Inv'
              object IQSearch4: TIQUniGridControl
                Left = 0
                Top = 27
                Width = 498
                Height = 267
                Layout = 'border'
                ParentAlignmentControl = False
                AlignmentControl = uniAlignmentClient
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 0
                IQComponents.Grid.Left = 0
                IQComponents.Grid.Top = 29
                IQComponents.Grid.Width = 281
                IQComponents.Grid.Height = 181
                IQComponents.Grid.Hint = ''
                IQComponents.Grid.DataSource = SrcDimInv
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
                IQComponents.Navigator.DataSource = SrcDimInv
                IQComponents.Navigator.LayoutConfig.Region = 'east'
                IQComponents.Navigator.TabOrder = 3
                IQComponents.HiddenPanel.Left = 281
                IQComponents.HiddenPanel.Top = 29
                IQComponents.HiddenPanel.Width = 209
                IQComponents.HiddenPanel.Height = 181
                IQComponents.HiddenPanel.Hint = ''
                IQComponents.HiddenPanel.Visible = True
                IQComponents.HiddenPanel.Align = alRight
                IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
                IQComponents.FormTab.Hint = ''
                IQComponents.FormTab.ImageIndex = 1
                IQComponents.FormTab.Caption = 'Form'
                IQComponents.FormTab.Layout = 'border'
                DataSource = SrcDimInv
                Columns = <
                  item
                    FieldName = 'NAME'
                    Title.Caption = 'Dim/Characteristic'
                    Width = 30
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'NVALUE'
                    Title.Caption = 'Value'
                    Width = 16
                    CheckBoxField.FieldValues = 'true;false'
                  end>
                Marker = 0
              end
              object Panel10: TUniPanel
                Tag = 1999
                Left = 0
                Top = 0
                Width = 498
                Height = 27
                Hint = ''
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
                Alignment = taLeftJustify
                Caption = ''
                object NavDim: TUniDBNavigator
                  Left = 398
                  Top = 1
                  Width = 100
                  Height = 25
                  Hint = ''
                  DataSource = SrcDimInv
                  VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
                  Align = alRight
                  Anchors = [akTop, akRight, akBottom]
                  TabOrder = 0
                end
              end
            end
            object TabUD: TUniTabSheet
              Hint = ''
              ImageIndex = 3
              Caption = 'User-Defined'
              object sbUserDefined: TUniScrollBox
                Left = 0
                Top = 0
                Width = 498
                Height = 294
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 0
                ScrollHeight = 252
                object PnlUserDefined: TUniPanel
                  Left = 0
                  Top = 0
                  Width = 496
                  Height = 252
                  Hint = ''
                  Align = alTop
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 0
                  Caption = ''
                  object Splitter4: TUniSplitter
                    Left = 257
                    Top = 0
                    Width = 4
                    Height = 252
                    Hint = ''
                    Align = alRight
                    ParentColor = False
                    Color = clBtnFace
                  end
                  object PnlClient01: TUniPanel
                    Left = 1
                    Top = 1
                    Width = 257
                    Height = 250
                    Hint = ''
                    Align = alClient
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    TabOrder = 0
                    Caption = ''
                    object Splitter5: TUniSplitter
                      Left = 81
                      Top = 0
                      Width = 6
                      Height = 250
                      Hint = ''
                      Align = alLeft
                      ParentColor = False
                      Color = clBtnFace
                    end
                    object PnlUDLeft01: TUniPanel
                      Left = 1
                      Top = 1
                      Width = 81
                      Height = 248
                      Hint = ''
                      Align = alLeft
                      Anchors = [akLeft, akTop, akBottom]
                      TabOrder = 0
                      Caption = ''
                      object IQUserDefLabel1: TIQWebUserDefLabel
                        Left = 8
                        Top = 12
                        Width = 56
                        Height = 13
                        Hint = ''
                        Caption = 'User Text 1'
                        TabOrder = 1
                        ParentAppName = 'IQWIN32.EXE'
                      end
                      object IQUserDefLabel2: TIQWebUserDefLabel
                        Left = 8
                        Top = 36
                        Width = 56
                        Height = 13
                        Hint = ''
                        Caption = 'User Text 2'
                        TabOrder = 2
                        ParentAppName = 'IQWIN32.EXE'
                      end
                      object IQUserDefLabel3: TIQWebUserDefLabel
                        Left = 8
                        Top = 60
                        Width = 56
                        Height = 13
                        Hint = ''
                        Caption = 'User Text 3'
                        TabOrder = 3
                        ParentAppName = 'IQWIN32.EXE'
                      end
                      object IQUserDefLabel7: TIQWebUserDefLabel
                        Left = 8
                        Top = 84
                        Width = 56
                        Height = 13
                        Hint = ''
                        Caption = 'User Text 4'
                        TabOrder = 4
                        ParentAppName = 'IQWIN32.EXE'
                      end
                      object IQUserDefLabel8: TIQWebUserDefLabel
                        Left = 8
                        Top = 108
                        Width = 56
                        Height = 13
                        Hint = ''
                        Caption = 'User Text 5'
                        TabOrder = 5
                        ParentAppName = 'IQWIN32.EXE'
                      end
                      object IQUserDefLabel9: TIQWebUserDefLabel
                        Left = 8
                        Top = 132
                        Width = 56
                        Height = 13
                        Hint = ''
                        Caption = 'User Text 6'
                        TabOrder = 6
                        ParentAppName = 'IQWIN32.EXE'
                      end
                      object IQUserDefLabel13: TIQWebUserDefLabel
                        Left = 8
                        Top = 156
                        Width = 56
                        Height = 13
                        Hint = ''
                        Caption = 'User Text 7'
                        TabOrder = 7
                        ParentAppName = 'IQWIN32.EXE'
                      end
                      object IQUserDefLabel14: TIQWebUserDefLabel
                        Left = 8
                        Top = 180
                        Width = 56
                        Height = 13
                        Hint = ''
                        Caption = 'User Text 8'
                        TabOrder = 8
                        ParentAppName = 'IQWIN32.EXE'
                      end
                      object IQUserDefLabel15: TIQWebUserDefLabel
                        Left = 8
                        Top = 204
                        Width = 56
                        Height = 13
                        Hint = ''
                        Caption = 'User Text 9'
                        TabOrder = 9
                        ParentAppName = 'IQWIN32.EXE'
                      end
                      object IQUserDefLabel19: TIQWebUserDefLabel
                        Left = 8
                        Top = 228
                        Width = 62
                        Height = 13
                        Hint = ''
                        Caption = 'User Text 10'
                        TabOrder = 10
                        ParentAppName = 'IQWIN32.EXE'
                      end
                    end
                    object PnlClient02: TUniPanel
                      Left = 87
                      Top = 1
                      Width = 170
                      Height = 248
                      Hint = ''
                      Align = alClient
                      Anchors = [akLeft, akTop, akRight, akBottom]
                      TabOrder = 1
                      Caption = ''
                      object DBEdit1: TUniDBEdit
                        Left = 3
                        Top = 8
                        Width = 163
                        Height = 21
                        Hint = ''
                        DataField = 'INV_CUSER1'
                        DataSource = SrcMasterLbl2
                        TabOrder = 0
                        ReadOnly = True
                      end
                      object DBEdit2: TUniDBEdit
                        Left = 3
                        Top = 32
                        Width = 163
                        Height = 21
                        Hint = ''
                        DataField = 'INV_CUSER2'
                        DataSource = SrcMasterLbl2
                        TabOrder = 1
                        ReadOnly = True
                      end
                      object DBEdit3: TUniDBEdit
                        Left = 3
                        Top = 56
                        Width = 163
                        Height = 21
                        Hint = ''
                        DataField = 'INV_CUSER3'
                        DataSource = SrcMasterLbl2
                        TabOrder = 2
                        ReadOnly = True
                      end
                      object DBEdit4: TUniDBEdit
                        Left = 3
                        Top = 80
                        Width = 163
                        Height = 21
                        Hint = ''
                        DataField = 'INV_CUSER4'
                        DataSource = SrcMasterLbl2
                        TabOrder = 3
                        ReadOnly = True
                      end
                      object DBEdit5: TUniDBEdit
                        Left = 3
                        Top = 104
                        Width = 163
                        Height = 21
                        Hint = ''
                        DataField = 'INV_CUSER5'
                        DataSource = SrcMasterLbl2
                        TabOrder = 4
                        ReadOnly = True
                      end
                      object DBEdit6: TUniDBEdit
                        Left = 3
                        Top = 128
                        Width = 163
                        Height = 21
                        Hint = ''
                        DataField = 'INV_CUSER6'
                        DataSource = SrcMasterLbl2
                        TabOrder = 5
                        ReadOnly = True
                      end
                      object DBEdit7: TUniDBEdit
                        Left = 3
                        Top = 152
                        Width = 163
                        Height = 21
                        Hint = ''
                        DataField = 'INV_CUSER7'
                        DataSource = SrcMasterLbl2
                        TabOrder = 6
                        ReadOnly = True
                      end
                      object DBEdit8: TUniDBEdit
                        Left = 3
                        Top = 176
                        Width = 163
                        Height = 21
                        Hint = ''
                        DataField = 'INV_CUSER8'
                        DataSource = SrcMasterLbl2
                        TabOrder = 7
                        ReadOnly = True
                      end
                      object DBEdit9: TUniDBEdit
                        Left = 3
                        Top = 200
                        Width = 163
                        Height = 21
                        Hint = ''
                        DataField = 'INV_CUSER9'
                        DataSource = SrcMasterLbl2
                        TabOrder = 8
                        ReadOnly = True
                      end
                      object DBEdit10: TUniDBEdit
                        Left = 3
                        Top = 225
                        Width = 163
                        Height = 21
                        Hint = ''
                        DataField = 'INVCUSER10'
                        DataSource = SrcMasterLbl2
                        TabOrder = 9
                        ReadOnly = True
                      end
                    end
                  end
                  object PnlUDRight01: TUniPanel
                    Left = 261
                    Top = 1
                    Width = 235
                    Height = 250
                    Hint = ''
                    Align = alRight
                    Anchors = [akTop, akRight, akBottom]
                    TabOrder = 1
                    Caption = ''
                    object Splitter6: TUniSplitter
                      Left = 88
                      Top = 0
                      Width = 6
                      Height = 250
                      Hint = ''
                      Align = alLeft
                      ParentColor = False
                      Color = clBtnFace
                    end
                    object PnlUDLeft02: TUniPanel
                      Left = 1
                      Top = 1
                      Width = 88
                      Height = 248
                      Hint = ''
                      Align = alLeft
                      Anchors = [akLeft, akTop, akBottom]
                      TabOrder = 0
                      Caption = ''
                      object IQUserDefLabel4: TIQWebUserDefLabel
                        Left = 8
                        Top = 12
                        Width = 72
                        Height = 13
                        Hint = ''
                        Caption = 'User Numeric 1'
                        TabOrder = 1
                        ParentAppName = 'IQWIN32.EXE'
                      end
                      object IQUserDefLabel5: TIQWebUserDefLabel
                        Left = 8
                        Top = 36
                        Width = 72
                        Height = 13
                        Hint = ''
                        Caption = 'User Numeric 2'
                        TabOrder = 2
                        ParentAppName = 'IQWIN32.EXE'
                      end
                      object IQUserDefLabel6: TIQWebUserDefLabel
                        Left = 8
                        Top = 60
                        Width = 72
                        Height = 13
                        Hint = ''
                        Caption = 'User Numeric 3'
                        TabOrder = 3
                        ParentAppName = 'IQWIN32.EXE'
                      end
                      object IQUserDefLabel10: TIQWebUserDefLabel
                        Left = 8
                        Top = 84
                        Width = 72
                        Height = 13
                        Hint = ''
                        Caption = 'User Numeric 4'
                        TabOrder = 4
                        ParentAppName = 'IQWIN32.EXE'
                      end
                      object IQUserDefLabel11: TIQWebUserDefLabel
                        Left = 8
                        Top = 108
                        Width = 72
                        Height = 13
                        Hint = ''
                        Caption = 'User Numeric 5'
                        TabOrder = 5
                        ParentAppName = 'IQWIN32.EXE'
                      end
                      object IQUserDefLabel12: TIQWebUserDefLabel
                        Left = 8
                        Top = 132
                        Width = 72
                        Height = 13
                        Hint = ''
                        Caption = 'User Numeric 6'
                        TabOrder = 6
                        ParentAppName = 'IQWIN32.EXE'
                      end
                      object IQUserDefLabel16: TIQWebUserDefLabel
                        Left = 8
                        Top = 156
                        Width = 72
                        Height = 13
                        Hint = ''
                        Caption = 'User Numeric 7'
                        TabOrder = 7
                        ParentAppName = 'IQWIN32.EXE'
                      end
                      object IQUserDefLabel17: TIQWebUserDefLabel
                        Left = 8
                        Top = 180
                        Width = 72
                        Height = 13
                        Hint = ''
                        Caption = 'User Numeric 8'
                        TabOrder = 8
                        ParentAppName = 'IQWIN32.EXE'
                      end
                      object IQUserDefLabel18: TIQWebUserDefLabel
                        Left = 8
                        Top = 204
                        Width = 72
                        Height = 13
                        Hint = ''
                        Caption = 'User Numeric 9'
                        TabOrder = 9
                        ParentAppName = 'IQWIN32.EXE'
                      end
                      object IQUserDefLabel20: TIQWebUserDefLabel
                        Left = 8
                        Top = 228
                        Width = 78
                        Height = 13
                        Hint = ''
                        Caption = 'User Numeric 10'
                        TabOrder = 10
                        ParentAppName = 'IQWIN32.EXE'
                      end
                    end
                    object PnlClient03: TUniPanel
                      Left = 94
                      Top = 1
                      Width = 141
                      Height = 248
                      Hint = ''
                      Align = alClient
                      Anchors = [akLeft, akTop, akRight, akBottom]
                      TabOrder = 1
                      Caption = ''
                      object DBEdit11: TUniDBEdit
                        Left = 5
                        Top = 8
                        Width = 130
                        Height = 21
                        Hint = ''
                        DataField = 'INV_NUSER1'
                        DataSource = SrcMasterLbl2
                        TabOrder = 0
                        ReadOnly = True
                      end
                      object DBEdit12: TUniDBEdit
                        Left = 5
                        Top = 32
                        Width = 130
                        Height = 21
                        Hint = ''
                        DataField = 'INV_NUSER2'
                        DataSource = SrcMasterLbl2
                        TabOrder = 1
                        ReadOnly = True
                      end
                      object DBEdit13: TUniDBEdit
                        Left = 5
                        Top = 56
                        Width = 130
                        Height = 21
                        Hint = ''
                        DataField = 'INV_NUSER3'
                        DataSource = SrcMasterLbl2
                        TabOrder = 2
                        ReadOnly = True
                      end
                      object DBEdit14: TUniDBEdit
                        Left = 5
                        Top = 80
                        Width = 130
                        Height = 21
                        Hint = ''
                        DataField = 'INV_NUSER4'
                        DataSource = SrcMasterLbl2
                        TabOrder = 3
                        ReadOnly = True
                      end
                      object DBEdit15: TUniDBEdit
                        Left = 5
                        Top = 104
                        Width = 130
                        Height = 21
                        Hint = ''
                        DataField = 'INV_NUSER5'
                        DataSource = SrcMasterLbl2
                        TabOrder = 4
                        ReadOnly = True
                      end
                      object DBEdit16: TUniDBEdit
                        Left = 5
                        Top = 128
                        Width = 130
                        Height = 21
                        Hint = ''
                        DataField = 'INV_NUSER6'
                        DataSource = SrcMasterLbl2
                        TabOrder = 5
                        ReadOnly = True
                      end
                      object DBEdit17: TUniDBEdit
                        Left = 5
                        Top = 152
                        Width = 130
                        Height = 21
                        Hint = ''
                        DataField = 'INV_NUSER7'
                        DataSource = SrcMasterLbl2
                        TabOrder = 6
                        ReadOnly = True
                      end
                      object DBEdit18: TUniDBEdit
                        Left = 5
                        Top = 176
                        Width = 130
                        Height = 21
                        Hint = ''
                        DataField = 'INV_NUSER8'
                        DataSource = SrcMasterLbl2
                        TabOrder = 7
                        ReadOnly = True
                      end
                      object DBEdit19: TUniDBEdit
                        Left = 5
                        Top = 200
                        Width = 130
                        Height = 21
                        Hint = ''
                        DataField = 'INV_NUSER9'
                        DataSource = SrcMasterLbl2
                        TabOrder = 8
                        ReadOnly = True
                      end
                      object DBEdit20: TUniDBEdit
                        Left = 5
                        Top = 225
                        Width = 130
                        Height = 21
                        Hint = ''
                        DataField = 'INVNUSER10'
                        DataSource = SrcMasterLbl2
                        TabOrder = 9
                        ReadOnly = True
                      end
                    end
                  end
                end
              end
            end
            object TabVin: TUniTabSheet
              Hint = ''
              ImageIndex = 1
              Caption = 'VIN Tracking'
              object Panel9: TUniPanel
                Tag = 1999
                Left = 0
                Top = 0
                Width = 498
                Height = 27
                Hint = ''
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                Alignment = taLeftJustify
                Caption = ''
                object NavVin: TUniDBNavigator
                  Left = 348
                  Top = 1
                  Width = 150
                  Height = 25
                  Hint = ''
                  DataSource = SrcVin
                  VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel]
                  Align = alRight
                  Anchors = [akTop, akRight, akBottom]
                  TabOrder = 0
                end
              end
              object IQSearch3: TIQUniGridControl
                Left = 0
                Top = 27
                Width = 498
                Height = 267
                Layout = 'border'
                ParentAlignmentControl = False
                AlignmentControl = uniAlignmentClient
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
                IQComponents.Grid.Left = 0
                IQComponents.Grid.Top = 29
                IQComponents.Grid.Width = 281
                IQComponents.Grid.Height = 181
                IQComponents.Grid.Hint = ''
                IQComponents.Grid.DataSource = SrcVin
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
                IQComponents.Navigator.DataSource = SrcVin
                IQComponents.Navigator.LayoutConfig.Region = 'east'
                IQComponents.Navigator.TabOrder = 3
                IQComponents.HiddenPanel.Left = 281
                IQComponents.HiddenPanel.Top = 29
                IQComponents.HiddenPanel.Width = 209
                IQComponents.HiddenPanel.Height = 181
                IQComponents.HiddenPanel.Hint = ''
                IQComponents.HiddenPanel.Visible = True
                IQComponents.HiddenPanel.Align = alRight
                IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
                IQComponents.FormTab.Hint = ''
                IQComponents.FormTab.ImageIndex = 1
                IQComponents.FormTab.Caption = 'Form'
                IQComponents.FormTab.Layout = 'border'
                DataSource = SrcVin
                Columns = <
                  item
                    FieldName = 'VIN_NO'
                    Title.Caption = 'VIN Number'
                    Width = 17
                    ReadOnly = True
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'SMART_CODE'
                    Title.Caption = 'Config Code'
                    Width = 10
                    ReadOnly = True
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'CONFIG_WEIGHT'
                    Title.Caption = 'Weight'
                    Width = 10
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'GAWR'
                    Title.Caption = 'GAWR'
                    Width = 10
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'GVWR'
                    Title.Caption = 'GVWR'
                    Width = 10
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'TIRE_SIZE'
                    Title.Caption = 'Tire Size'
                    Width = 20
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'RIM'
                    Title.Caption = 'Rim'
                    Width = 20
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'PSI'
                    Title.Caption = 'PSI'
                    Width = 20
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'SINGLE_DUAL'
                    Title.Caption = 'Single/Dual'
                    Width = 20
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'VEHICLE_ATTRIB'
                    Title.Caption = 'Vehicle Attributes'
                    Width = 20
                    ReadOnly = True
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'SPARE_TIRE'
                    Title.Caption = 'Spare Tire'
                    Width = 20
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'NUM_AXLES'
                    Title.Caption = 'Number of Axels'
                    Width = 10
                    ReadOnly = True
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'MODEL_YR'
                    Title.Caption = 'Model Year'
                    Width = 10
                    ReadOnly = True
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'ARCUSTO_COMPANY'
                    Title.Caption = 'Company'
                    Width = 20
                    ReadOnly = True
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'UNIT_PRICE'
                    Title.Caption = 'Sales Value'
                    Width = 10
                    ReadOnly = True
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'LIST_UNIT_PRICE'
                    Title.Caption = 'Sales List Price'
                    Width = 10
                    ReadOnly = True
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'WORKORDER_NUMBER'
                    Title.Caption = 'Workorder Number'
                    Width = 10
                    ReadOnly = True
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'PACKSLIPNO'
                    Title.Caption = 'Packing Slip Number'
                    Width = 15
                    ReadOnly = True
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'INVOICE_NO'
                    Title.Caption = 'Invoice Number'
                    Width = 25
                    ReadOnly = True
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'CONFIG_CHOICES'
                    Title.Caption = 'Config Choices'
                    Width = 10
                    CheckBoxField.FieldValues = 'true;false'
                  end>
                Marker = 0
                object wwDBComboDlgConfigChoices: TUniEdit
                  Left = 152
                  Top = 48
                  Width = 121
                  Height = 21
                  Hint = ''
                  Visible = False
                  Text = ''
                  TabOrder = 2
                  ReadOnly = True
                end
              end
            end
          end
        end
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 138
    Top = 40
    object File1: TUniMenuItem
      Caption = '&File'
      object SearchSerial1: TUniMenuItem
        Caption = '&Search Serial #'
        OnClick = SearchSerial1Click
      end
      object ReprintLabel1: TUniMenuItem
        Caption = 'Reprint Label'
        OnClick = sbtnReprintClick
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Reports1: TUniMenuItem
      Caption = '&Reports'
      object Print1: TUniMenuItem
        Caption = '&Print'
        OnClick = Print1Click
      end
      object PrinterSetUp1: TUniMenuItem
        Caption = 'Printer &Setup'
        OnClick = PrinterSetUp1Click
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
    ModuleName = 'Tracking Serial Number'
    Version = 'Feature unsupported'
    ChangeListNumber = '$Change: 187498 $'
    Left = 170
    Top = 40
  end
  object QryMasterLbl: TFDQuery
    AfterScroll = QryMasterLblAfterScroll
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       eqno,'
      '       class,'
      '       itemno,'
      '       rev,'
      '       descrip,'
      '       descrip2,'
      '       mfgno,'
      '       orderno,'
      '       pono,'
      '       arcusto_id,'
      '       fg_lotno,'
      '       boxno,'
      '       print_date,'
      '       scanned,'
      '       serial,'
      '       qty,'
      '       parent_id,'
      '       lpad( parent_id, 9, '#39'0'#39') as parent_id_disp,'
      '       dispo_scan,'
      '       volume,'
      '       weight,'
      '       is_skid,'
      '       loc_desc,'
      '       box_id,'
      '       arinvt_id,'
      '       sys_date,'
      '       user_name,'
      '       DISPO_DATE,'
      '       decode(shipment_dtl_id, null, '#39'N'#39', '#39'Y'#39') as shipped,'
      '       orig_sysdate,'
      '       orig_user_name,'
      '       repacked_master_label_id,'
      '       vin_no,'
      '       standard_id,'
      '       workorder_id,'
      '       shipment_dtl_id,'
      '       ps_ticket_dtl_id'
      '  from master_label'
      ' where id = :AID'
      ''
      '')
    Left = 216
    Top = 39
    ParamData = <
      item
        Name = 'AID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryMasterLblEQNO: TStringField
      DisplayLabel = 'Tool #'
      DisplayWidth = 25
      FieldName = 'EQNO'
      Origin = 'MASTER_LABEL.EQNO'
      Size = 60
    end
    object QryMasterLblCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 2
      FieldName = 'CLASS'
      Origin = 'MASTER_LABEL.CLASS'
      Size = 2
    end
    object QryMasterLblITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 'MASTER_LABEL.ITEMNO'
      Size = 50
    end
    object QryMasterLblREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 15
      FieldName = 'REV'
      Origin = 'MASTER_LABEL.REV'
      Size = 15
    end
    object QryMasterLblDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Origin = 'MASTER_LABEL.DESCRIP'
      Size = 100
    end
    object QryMasterLblDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 100
      FieldName = 'DESCRIP2'
      Origin = 'MASTER_LABEL.DESCRIP2'
      Size = 100
    end
    object QryMasterLblMFGNO: TStringField
      DisplayLabel = 'Mfg #'
      DisplayWidth = 25
      FieldName = 'MFGNO'
      Origin = 'MASTER_LABEL.MFGNO'
      Size = 50
    end
    object QryMasterLblPONO: TStringField
      DisplayLabel = 'PO #'
      DisplayWidth = 20
      FieldName = 'PONO'
      Origin = 'MASTER_LABEL.PONO'
      Size = 35
    end
    object QryMasterLblFG_LOTNO: TStringField
      DisplayLabel = 'Lot #'
      DisplayWidth = 25
      FieldName = 'FG_LOTNO'
      Origin = 'MASTER_LABEL.FG_LOTNO'
      Size = 25
    end
    object QryMasterLblBOXNO: TBCDField
      DisplayLabel = 'Box #'
      DisplayWidth = 10
      FieldName = 'BOXNO'
      Origin = 'MASTER_LABEL.BOXNO'
      Size = 0
    end
    object QryMasterLblPRINT_DATE: TDateTimeField
      DisplayLabel = 'Print Date'
      DisplayWidth = 18
      FieldName = 'PRINT_DATE'
      Origin = 'MASTER_LABEL.PRINT_DATE'
    end
    object QryMasterLblSCANNED: TStringField
      DisplayLabel = 'Scanned'
      DisplayWidth = 1
      FieldName = 'SCANNED'
      Origin = 'MASTER_LABEL.SCANNED'
      Size = 1
    end
    object QryMasterLblSERIAL: TStringField
      DisplayLabel = 'Serial #'
      DisplayWidth = 9
      FieldName = 'SERIAL'
      Origin = 'MASTER_LABEL.SERIAL'
      Size = 13
    end
    object QryMasterLblQTY: TFMTBCDField
      DisplayLabel = 'Current Qty'
      DisplayWidth = 10
      FieldName = 'QTY'
      Origin = 'MASTER_LABEL.QTY'
      Size = 6
    end
    object QryMasterLblDISPO_SCAN: TStringField
      DisplayLabel = 'Dispo Scan'
      DisplayWidth = 1
      FieldName = 'DISPO_SCAN'
      Origin = 'MASTER_LABEL.DISPO_SCAN'
      Size = 1
    end
    object QryMasterLblVOLUME: TFMTBCDField
      DisplayLabel = 'Volume'
      DisplayWidth = 10
      FieldName = 'VOLUME'
      Origin = 'MASTER_LABEL.VOLUME'
      Size = 6
    end
    object QryMasterLblWEIGHT: TFMTBCDField
      DisplayLabel = 'Weight'
      DisplayWidth = 10
      FieldName = 'WEIGHT'
      Origin = 'MASTER_LABEL.WEIGHT'
      Size = 6
    end
    object QryMasterLblLOC_DESC: TStringField
      DisplayLabel = 'Location'
      DisplayWidth = 30
      FieldName = 'LOC_DESC'
      Origin = 'MASTER_LABEL.LOC_DESC'
      Size = 30
    end
    object QryMasterLblUSER_NAME: TStringField
      DisplayLabel = 'User'
      DisplayWidth = 35
      FieldName = 'USER_NAME'
      Origin = 'MASTER_LABEL.USER_NAME'
      Size = 35
    end
    object QryMasterLblID: TBCDField
      Tag = 1
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'MASTER_LABEL.ID'
      Visible = False
      Size = 0
    end
    object QryMasterLblARCUSTO_ID: TBCDField
      Tag = 1
      DisplayWidth = 10
      FieldName = 'ARCUSTO_ID'
      Origin = 'MASTER_LABEL.ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object QryMasterLblPARENT_ID: TBCDField
      Tag = 1
      DisplayLabel = 'Parent Pallet #'
      DisplayWidth = 10
      FieldName = 'PARENT_ID'
      Origin = 'MASTER_LABEL.PARENT_ID'
      Visible = False
      Size = 0
    end
    object QryMasterLblIS_SKID: TStringField
      Tag = 1
      DisplayWidth = 1
      FieldName = 'IS_SKID'
      Origin = 'MASTER_LABEL.IS_SKID'
      Visible = False
      Size = 1
    end
    object QryMasterLblBOX_ID: TBCDField
      Tag = 1
      DisplayWidth = 10
      FieldName = 'BOX_ID'
      Origin = 'MASTER_LABEL.BOX_ID'
      Visible = False
      Size = 0
    end
    object QryMasterLblARINVT_ID: TBCDField
      Tag = 1
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Origin = 'MASTER_LABEL.ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryMasterLblSYS_DATE: TDateTimeField
      Tag = 1
      DisplayWidth = 18
      FieldName = 'SYS_DATE'
      Origin = 'MASTER_LABEL.SYS_DATE'
      Visible = False
    end
    object QryMasterLblPARENT_ID_DISP: TStringField
      DisplayLabel = 'Belongs to Pallet #'
      FieldName = 'PARENT_ID_DISP'
      Size = 9
    end
    object QryMasterLblORDERNO: TStringField
      DisplayLabel = 'Order #'
      FieldName = 'ORDERNO'
      Origin = 'MASTER_LABEL.ORDERNO'
      Size = 15
    end
    object QryMasterLblDISPO_DATE: TDateTimeField
      DisplayLabel = 'Dispo Date'
      FieldName = 'DISPO_DATE'
    end
    object QryMasterLblSHIPPED: TStringField
      DisplayLabel = 'Shipped'
      FieldName = 'SHIPPED'
      Size = 1
    end
    object QryMasterLblORIG_SYSDATE: TDateTimeField
      DisplayLabel = 'Original Date'
      FieldName = 'ORIG_SYSDATE'
    end
    object QryMasterLblORIG_USER_NAME: TStringField
      DisplayLabel = 'Original User'
      FieldName = 'ORIG_USER_NAME'
      Size = 35
    end
    object QryMasterLblREPACKED_MASTER_LABEL_ID: TBCDField
      Tag = 1
      FieldName = 'REPACKED_MASTER_LABEL_ID'
      Size = 0
    end
    object QryMasterLblVIN_NO: TStringField
      Tag = 1
      FieldName = 'VIN_NO'
      Size = 17
    end
    object QryMasterLblSTANDARD_ID: TBCDField
      Tag = 1
      FieldName = 'STANDARD_ID'
      Size = 0
    end
    object QryMasterLblWORKORDER_ID: TBCDField
      Tag = 1
      FieldName = 'WORKORDER_ID'
      Size = 0
    end
    object QryMasterLblSHIPMENT_DTL_ID: TBCDField
      Tag = 1
      FieldName = 'SHIPMENT_DTL_ID'
      Size = 0
    end
    object QryMasterLblPS_TICKET_DTL_ID: TBCDField
      Tag = 1
      FieldName = 'PS_TICKET_DTL_ID'
      Size = 0
    end
  end
  object PopupMenu1: TUniPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 264
    Top = 48
    object DrillDownbyLot1: TUniMenuItem
      Caption = '&Drill Down by Lot#'
      OnClick = DrillDownbyLot1Click
    end
    object JumptoInventory1: TUniMenuItem
      Caption = 'Jump to Inventory'
      OnClick = JumptoInventory1Click
    end
    object JumptoBOM2: TUniMenuItem
      Caption = 'Jump to &BOM'
      OnClick = JumptoBOM2Click
    end
    object JumptoWorkOrder1: TUniMenuItem
      Caption = 'Jump to Work Order'
      OnClick = JumptoWorkOrder1Click
    end
    object JumptoPackingSlip2: TUniMenuItem
      Caption = 'Jump to Packing Slip'
      OnClick = JumptoPackingSlip2Click
    end
    object N2: TUniMenuItem
      Caption = '-'
    end
    object CopyCelltoClipboard1: TUniMenuItem
      Caption = 'Copy Cell to Clipboard'
      OnClick = CopyCelltoClipboard1Click
    end
  end
  object SrcMasterLbl: TDataSource
    DataSet = QryMasterLbl
    Left = 216
    Top = 55
  end
  object SrcMasterLblDtl: TDataSource
    DataSet = QryMasterLblDtl
    Left = 135
    Top = 83
  end
  object QryMasterLblDtl: TFDQuery
    MasterSource = SrcMasterLbl
    MasterFields = 'ID'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       class,'
      '       itemno,'
      '       descrip,'
      '       descrip2,'
      '       mfgno,'
      '       orderno,'
      '       pono,'
      '       fg_lotno,'
      '       serial,'
      '       qty,'
      '       loc_desc,'
      '       user_name,'
      '       orig_sysdate,'
      '       orig_user_name,'
      '       shipment_dtl_id,'
      '       ps_ticket_dtl_id,'
      '       workorder_id        '
      '  from master_label'
      ' where parent_id = :id'
      ' '
      ' ')
    Left = 135
    Top = 99
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryMasterLblDtlCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 2
      FieldName = 'CLASS'
      Origin = 'CLASS'
      FixedChar = True
      Size = 2
    end
    object QryMasterLblDtlITEMNO: TStringField
      DisplayLabel = 'Itemno'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 'ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryMasterLblDtlDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 100
    end
    object QryMasterLblDtlDESCRIP2: TStringField
      DisplayLabel = 'Ext. Description'
      DisplayWidth = 100
      FieldName = 'DESCRIP2'
      Origin = 'DESCRIP2'
      Size = 100
    end
    object QryMasterLblDtlMFGNO: TStringField
      DisplayLabel = 'Mfg#'
      DisplayWidth = 25
      FieldName = 'MFGNO'
      Origin = 'MFGNO'
      Size = 50
    end
    object QryMasterLblDtlPONO: TStringField
      DisplayLabel = 'PO#'
      DisplayWidth = 20
      FieldName = 'PONO'
      Origin = 'PONO'
      Size = 35
    end
    object QryMasterLblDtlFG_LOTNO: TStringField
      DisplayLabel = 'Lot#'
      DisplayWidth = 25
      FieldName = 'FG_LOTNO'
      Origin = 'FG_LOTNO'
      FixedChar = True
      Size = 25
    end
    object QryMasterLblDtlSERIAL: TStringField
      DisplayLabel = 'Serial#'
      DisplayWidth = 9
      FieldName = 'SERIAL'
      Origin = 'SERIAL'
      Size = 13
    end
    object QryMasterLblDtlQTY: TFMTBCDField
      DisplayLabel = 'Qty.'
      DisplayWidth = 10
      FieldName = 'QTY'
      Origin = 'QTY'
      Size = 6
    end
    object QryMasterLblDtlLOC_DESC: TStringField
      DisplayLabel = 'Location'
      DisplayWidth = 30
      FieldName = 'LOC_DESC'
      Origin = 'LOC_DESC'
      FixedChar = True
      Size = 30
    end
    object QryMasterLblDtlUSER_NAME: TStringField
      DisplayLabel = 'User'
      DisplayWidth = 35
      FieldName = 'USER_NAME'
      Origin = 'USER_NAME'
      Size = 35
    end
    object QryMasterLblDtlORDERNO: TStringField
      DisplayLabel = 'Order#'
      DisplayWidth = 15
      FieldName = 'ORDERNO'
      Origin = 'ORDERNO'
      Size = 15
    end
    object QryMasterLblDtlID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      Visible = False
      Size = 0
    end
    object QryMasterLblDtlORIG_SYSDATE: TDateTimeField
      DisplayLabel = 'Original Date'
      DisplayWidth = 18
      FieldName = 'ORIG_SYSDATE'
      Origin = 'ORIG_SYSDATE'
    end
    object QryMasterLblDtlORIG_USER_NAME: TStringField
      DisplayLabel = 'Original User'
      DisplayWidth = 35
      FieldName = 'ORIG_USER_NAME'
      Origin = 'ORIG_USER_NAME'
      Size = 35
    end
  end
  object SrcForeign2: TDataSource
    DataSet = QryForeign2
    Left = 167
    Top = 84
  end
  object QryForeign2: TFDQuery
    MasterSource = SrcMasterLblDtl
    MasterFields = 'ID'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select serial, scan_date '
      '  from foreign_label'
      ' where master_label_id = :id')
    Left = 167
    Top = 100
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryForeign2SERIAL: TStringField
      DisplayLabel = 'Serial #'
      DisplayWidth = 25
      FieldName = 'SERIAL'
      Origin = 'FOREIGN_LABEL.SERIAL'
      Size = 50
    end
    object QryForeign2SCAN_DATE: TDateTimeField
      DisplayLabel = 'Scan Date'
      DisplayWidth = 18
      FieldName = 'SCAN_DATE'
      Origin = 'FOREIGN_LABEL.SCAN_DATE'
    end
  end
  object SrcForeign1: TDataSource
    DataSet = QryForeign1
    Left = 218
    Top = 86
  end
  object QryForeign1: TFDQuery
    MasterSource = SrcMasterLbl
    MasterFields = 'ID'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select serial, scan_date '
      '  from foreign_label'
      ' where master_label_id = :id')
    Left = 218
    Top = 101
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryForeign1SERIAL: TStringField
      DisplayLabel = 'Serial #'
      DisplayWidth = 25
      FieldName = 'SERIAL'
      Origin = 'FOREIGN_LABEL.SERIAL'
      Size = 50
    end
    object QryForeign1SCAN_DATE: TDateTimeField
      DisplayLabel = 'Scan Date'
      DisplayWidth = 18
      FieldName = 'SCAN_DATE'
      Origin = 'FOREIGN_LABEL.SCAN_DATE'
    end
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 91
    Top = 107
  end
  object QryTransLog: TFDQuery
    MasterSource = SrcMasterLbl
    MasterFields = 'ID'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select t.ID                  as id                 ,'
      '       t.trans_date          as trans_date         ,'
      '       t.trans_in_out        as trans_in_out       ,'
      '       t.trans_quan          as trans_quan         ,'
      '       t.rg_quan             as rg_quan            ,'
      '       t.trans_type          as trans_type         ,'
      '       t.loc_desc            as loc_desc           ,'
      '       t.lotno               as lotno              ,'
      '       t.fg_lotno            as fg_lotno           ,'
      '       t.act_cost            as act_cost           ,'
      '       t.std_cost            as std_cost           ,'
      '       t.trans_reason        as trans_reason       ,'
      '       t.userid              as userid             ,'
      '       t.begin_quan          as begin_quan         ,'
      '       t.begin_rg_quan       as begin_rg_quan      ,'
      '       t.batch               as batch              ,'
      '       t.parent_arinvt_id    as parent_arinvt_id   ,'
      '       t.arinvt_id           as arinvt_id          ,'
      '       t.fgmulti_cuser1      as fgmulti_cuser1     ,'
      '       t.fgmulti_cuser2      as fgmulti_cuser2     ,'
      '       t.fgmulti_cuser3      as fgmulti_cuser3     ,'
      '       t.receiptno           as receiptno          ,'
      '       t.division_name       as division_name      ,'
      '       t.trans_code          as trans_code         ,'
      '       t.trans_descrip       as trans_descrip      ,'
      '       t.location_descrip    as location_descrip   ,'
      '       t.exclude_rpt         as exclude_rpt        ,'
      '       t.workorder_id        as workorder_id       ,'
      '       t.source              as source             ,'
      '       t.source_id           as source_id          ,'
      '       t.begin_quan_total    as begin_quan_total   ,'
      '       t.begin_rg_quan_total as begin_rg_quan_total,'
      '       t.eplant_id           as eplant_id          ,'
      '       t.posted              as posted             ,'
      '       t.act_date            as system_date        ,'
      '       m.qty                 as label_qty          ,'
      '       t.fgmulti_id          as fgmulti_id'
      '  from translog t,'
      '       translog_master_label m'
      ' where m.translog_id = t.id'
      '   and m.master_label_id = :ID'
      ' order by t.id desc'
      ''
      ' '
      ' ')
    Left = 48
    Top = 68
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryTransLogTRANS_DATE: TDateTimeField
      FieldName = 'TRANS_DATE'
    end
    object QryTransLogTRANS_IN_OUT: TStringField
      FieldName = 'TRANS_IN_OUT'
      Size = 3
    end
    object QryTransLogTRANS_QUAN: TFMTBCDField
      FieldName = 'TRANS_QUAN'
      Size = 6
    end
    object QryTransLogRG_QUAN: TFMTBCDField
      FieldName = 'RG_QUAN'
      Size = 6
    end
    object QryTransLogTRANS_TYPE: TStringField
      FieldName = 'TRANS_TYPE'
      Size = 30
    end
    object QryTransLogLOC_DESC: TStringField
      FieldName = 'LOC_DESC'
      Size = 30
    end
    object QryTransLogLOTNO: TStringField
      FieldName = 'LOTNO'
      Size = 25
    end
    object QryTransLogACT_COST: TFMTBCDField
      FieldName = 'ACT_COST'
      Size = 6
    end
    object QryTransLogTRANS_REASON: TStringField
      DisplayWidth = 35
      FieldName = 'TRANS_REASON'
      Size = 50
    end
    object QryTransLogSTD_COST: TFMTBCDField
      FieldName = 'STD_COST'
      Size = 6
    end
    object QryTransLogFG_LOTNO: TStringField
      FieldName = 'FG_LOTNO'
      Origin = 'TRANSLOG.FG_LOTNO'
      Size = 25
    end
    object QryTransLogBATCH: TBCDField
      FieldName = 'BATCH'
      Origin = 'TRANSLOG.BATCH'
      Size = 0
    end
    object QryTransLogPARENT_ARINVT_ID: TBCDField
      FieldName = 'PARENT_ARINVT_ID'
      Origin = 'TRANSLOG.PARENT_ARINVT_ID'
      Size = 0
    end
    object QryTransLogARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Origin = 'TRANSLOG.ARINVT_ID'
      Size = 0
    end
    object QryTransLogUSERID: TStringField
      FieldName = 'USERID'
      Origin = 'TRANSLOG.USERID'
      Size = 35
    end
    object QryTransLogFGMULTI_CUSER1: TStringField
      FieldName = 'FGMULTI_CUSER1'
      Origin = 'TRANSLOG.FGMULTI_CUSER1'
      Size = 25
    end
    object QryTransLogFGMULTI_CUSER2: TStringField
      FieldName = 'FGMULTI_CUSER2'
      Origin = 'TRANSLOG.FGMULTI_CUSER2'
      Size = 25
    end
    object QryTransLogFGMULTI_CUSER3: TStringField
      FieldName = 'FGMULTI_CUSER3'
      Origin = 'TRANSLOG.FGMULTI_CUSER3'
      Size = 25
    end
    object QryTransLogRECEIPTNO: TStringField
      DisplayLabel = 'Receipt#'
      FieldName = 'RECEIPTNO'
      Origin = 'TRANSLOG.RECEIPTNO'
      Size = 50
    end
    object QryTransLogDIVISION_NAME: TStringField
      DisplayLabel = 'Division'
      FieldName = 'DIVISION_NAME'
      Origin = 'TRANSLOG.DIVISION_NAME'
      Size = 25
    end
    object QryTransLogTRANS_CODE: TStringField
      DisplayLabel = 'Tran Code'
      FieldName = 'TRANS_CODE'
      Origin = 'TRANSLOG.TRANS_CODE'
      Size = 10
    end
    object QryTransLogTRANS_DESCRIP: TStringField
      DisplayLabel = 'Tran Description'
      FieldName = 'TRANS_DESCRIP'
      Origin = 'TRANSLOG.TRANS_DESCRIP'
      Size = 25
    end
    object QryTransLogLOCATION_DESCRIP: TStringField
      DisplayLabel = 'Location Description'
      FieldName = 'LOCATION_DESCRIP'
      Origin = 'TRANSLOG.LOCATION_DESCRIP'
      Size = 50
    end
    object QryTransLogID: TBCDField
      FieldName = 'ID'
      Origin = 'TRANSLOG.ID'
      Size = 0
    end
    object QryTransLogEXCLUDE_RPT: TStringField
      FieldName = 'EXCLUDE_RPT'
      Origin = 'TRANSLOG.EXCLUDE_RPT'
      Size = 1
    end
    object QryTransLogWORKORDER_ID: TBCDField
      FieldName = 'WORKORDER_ID'
      Origin = 'TRANSLOG.WORKORDER_ID'
      Size = 0
    end
    object QryTransLogParent_ItemNo: TStringField
      FieldKind = fkCalculated
      FieldName = 'Parent_ItemNo'
      LookupKeyFields = 'ARINVT_ID'
      LookupResultField = 'ITEMNO'
      KeyFields = 'PARENT_ARINVT_ID'
      Calculated = True
    end
    object QryTransLogSOURCE: TStringField
      FieldName = 'SOURCE'
      Origin = 'TRANSLOG.SOURCE'
      Size = 50
    end
    object QryTransLogSOURCE_ID: TBCDField
      FieldName = 'SOURCE_ID'
      Origin = 'TRANSLOG.SOURCE_ID'
      Size = 0
    end
    object QryTransLogEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'IQ.TRANSLOG.EPLANT_ID'
      Size = 0
    end
    object QryTransLogPOSTED: TStringField
      DisplayLabel = 'Posted'
      FieldName = 'POSTED'
      Origin = 'IQ.TRANSLOG.POSTED'
      FixedChar = True
      Size = 1
    end
    object QryTransLogSYSTEM_DATE: TDateTimeField
      DisplayLabel = 'System Date'
      FieldName = 'SYSTEM_DATE'
      Origin = 'IQ.TRANSLOG.ACT_DATE'
    end
    object QryTransLogLABEL_QTY: TFMTBCDField
      DisplayLabel = 'SN Qty'
      FieldName = 'LABEL_QTY'
      Origin = 'IQ.TRANSLOG_MASTER_LABEL.QTY'
      Size = 6
    end
    object QryTransLogFGMULTI_ID: TBCDField
      DisplayLabel = 'Location ID'
      FieldName = 'FGMULTI_ID'
      Origin = 'IQ.TRANSLOG.FGMULTI_ID'
      Size = 0
    end
    object QryTransLogBEGIN_QUAN: TFMTBCDField
      FieldName = 'BEGIN_QUAN'
      Origin = 'BEGIN_QUAN'
      Precision = 12
      Size = 2
    end
    object QryTransLogBEGIN_RG_QUAN: TFMTBCDField
      FieldName = 'BEGIN_RG_QUAN'
      Origin = 'BEGIN_RG_QUAN'
      Precision = 12
      Size = 2
    end
    object QryTransLogBEGIN_QUAN_TOTAL: TFMTBCDField
      DisplayLabel = 'Total Start Qty'
      FieldName = 'BEGIN_QUAN_TOTAL'
      Origin = 'BEGIN_QUAN_TOTAL'
      Precision = 12
      Size = 2
    end
    object QryTransLogBEGIN_RG_QUAN_TOTAL: TFMTBCDField
      DisplayLabel = 'Total Start RG'
      FieldName = 'BEGIN_RG_QUAN_TOTAL'
      Origin = 'BEGIN_RG_QUAN_TOTAL'
      Precision = 12
      Size = 2
    end
  end
  object SrcTransLog: TDataSource
    DataSet = QryTransLog
    Left = 48
    Top = 88
  end
  object SrcRepackedTo: TDataSource
    DataSet = QryRepackedTo
    Left = 264
    Top = 88
  end
  object QryRepackedTo: TFDQuery
    MasterSource = SrcMasterLbl
    MasterFields = 'ID'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       class,'
      '       itemno,'
      '       descrip,'
      '       descrip2,'
      '       mfgno,'
      '       orderno,'
      '       pono,'
      '       fg_lotno,'
      '       serial,'
      '       qty,'
      '       loc_desc,'
      '       user_name,'
      '       orig_sysdate,'
      '       orig_user_name'
      '  from master_label'
      ' where REPACKED_MASTER_LABEL_ID = :id'
      ' '
      ' ')
    Left = 264
    Top = 104
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryRepackedToFG_LOTNO: TStringField
      DisplayLabel = 'Lot#'
      DisplayWidth = 25
      FieldName = 'FG_LOTNO'
      Origin = 'FG_LOTNO'
      FixedChar = True
      Size = 25
    end
    object QryRepackedToSERIAL: TStringField
      DisplayLabel = 'Serial#'
      DisplayWidth = 9
      FieldName = 'SERIAL'
      Origin = 'SERIAL'
      Size = 13
    end
    object QryRepackedToQTY: TFMTBCDField
      DisplayLabel = 'Qty.'
      DisplayWidth = 10
      FieldName = 'QTY'
      Origin = 'QTY'
      Size = 6
    end
    object QryRepackedToLOC_DESC: TStringField
      DisplayLabel = 'Location'
      DisplayWidth = 30
      FieldName = 'LOC_DESC'
      Origin = 'LOC_DESC'
      FixedChar = True
      Size = 30
    end
    object QryRepackedToCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 2
      FieldName = 'CLASS'
      Origin = 'CLASS'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object QryRepackedToITEMNO: TStringField
      DisplayLabel = 'Itemno'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 'ITEMNO'
      Visible = False
      FixedChar = True
      Size = 50
    end
    object QryRepackedToDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Visible = False
      Size = 100
    end
    object QryRepackedToDESCRIP2: TStringField
      DisplayLabel = 'Ext. Description'
      DisplayWidth = 100
      FieldName = 'DESCRIP2'
      Origin = 'DESCRIP2'
      Visible = False
      Size = 100
    end
    object QryRepackedToMFGNO: TStringField
      DisplayLabel = 'Mfg#'
      DisplayWidth = 25
      FieldName = 'MFGNO'
      Origin = 'MFGNO'
      Visible = False
      Size = 50
    end
    object QryRepackedToPONO: TStringField
      DisplayLabel = 'PO#'
      DisplayWidth = 20
      FieldName = 'PONO'
      Origin = 'PONO'
      Visible = False
      Size = 35
    end
    object QryRepackedToUSER_NAME: TStringField
      DisplayLabel = 'User'
      DisplayWidth = 35
      FieldName = 'USER_NAME'
      Origin = 'USER_NAME'
      Visible = False
      Size = 35
    end
    object QryRepackedToORDERNO: TStringField
      DisplayLabel = 'Order#'
      DisplayWidth = 15
      FieldName = 'ORDERNO'
      Origin = 'ORDERNO'
      Visible = False
      Size = 15
    end
    object QryRepackedToORIG_SYSDATE: TDateTimeField
      DisplayLabel = 'Original Date'
      DisplayWidth = 18
      FieldName = 'ORIG_SYSDATE'
      Origin = 'ORIG_SYSDATE'
      Visible = False
    end
    object QryRepackedToORIG_USER_NAME: TStringField
      DisplayLabel = 'Original User'
      DisplayWidth = 35
      FieldName = 'ORIG_USER_NAME'
      Origin = 'ORIG_USER_NAME'
      Visible = False
      Size = 35
    end
    object QryRepackedToID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      Visible = False
      Size = 0
    end
  end
  object PopupMenu2: TUniPopupMenu
    Left = 312
    Top = 48
    object JumptoSN1: TUniMenuItem
      Caption = 'Jump to SN'
      OnClick = JumptoSN1Click
    end
  end
  object QryVin: TFDQuery
    BeforeInsert = QryVinBeforeInsert
    BeforeDelete = QryVinBeforeInsert
    MasterSource = SrcMasterLbl
    MasterFields = 'VIN_NO'
    UpdateOptions.UpdateTableName = 'VIN_HISTORY'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select v.id,'
      '       v.vin_no,'
      '       v.smart_code,'
      '       v.config_weight,'
      '       v.gawr,'
      '       v.gvwr,'
      '       v.tire_size,'
      '       v.rim,'
      '       v.psi,'
      '       v.single_dual,'
      '       v.vehicle_attrib,'
      '       v.spare_tire,'
      '       v.num_axles,'
      '       v.model_yr,'
      '       v.arcusto_company,'
      '       v.unit_price,'
      '       v.list_unit_price,'
      '       v.arinvt_id,'
      '       v.standard_id,'
      '       v.workorder_id,'
      '       v.ord_detail_id,'
      '       v.crm_quote_detail_id,'
      '       s.id as shipments_id,'
      '       a.id as arinvoice_id,'
      '       NVL(w.id, v.workorder_id)  as workorder_number,'
      '       s.packslipno,'
      '       a.invoice_no,'
      
        '       (select data1 from arinvt_cargo where arinvt_id = v.arinv' +
        't_id and kind = '#39'CONFIG CHOICES'#39') as config_choices'
      '  from vin_history v,'
      '       master_label m,'
      '       shipment_dtl sd,'
      '       shipments s,'
      '       workorder w,'
      '       arinvoice_detail ad,'
      '       arinvoice a'
      ' where v.vin_no = m.vin_no(+)'
      '   and sd.shipments_id = s.id(+)'
      '   and m.shipment_dtl_id = ad.shipment_dtl_id(+)'
      '   and m.shipment_dtl_id = sd.id(+)'
      '   and ad.arinvoice_id = a.id(+)'
      '   and v.workorder_id = w.id(+)'
      '   and v.vin_no = :VIN_NO')
    Left = 64
    Top = 216
    ParamData = <
      item
        Name = 'VIN_NO'
        DataType = ftString
        ParamType = ptInput
        Size = 18
      end>
    object QryVinVIN_NO: TStringField
      DisplayLabel = 'VIN Number'
      DisplayWidth = 17
      FieldName = 'VIN_NO'
      Origin = 'v.VIN_NO'
      ReadOnly = True
      Size = 17
    end
    object QryVinSMART_CODE: TStringField
      DisplayLabel = 'Config Code'
      DisplayWidth = 10
      FieldName = 'SMART_CODE'
      Origin = 'v.SMART_CODE'
      ReadOnly = True
      Size = 2000
    end
    object QryVinCONFIG_WEIGHT: TFMTBCDField
      DisplayLabel = 'Weight'
      DisplayWidth = 10
      FieldName = 'CONFIG_WEIGHT'
      Origin = 'v.CONFIG_WEIGHT'
      Size = 6
    end
    object QryVinGAWR: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'GAWR'
      Origin = 'v.GAWR'
      Size = 6
    end
    object QryVinGVWR: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'GVWR'
      Origin = 'v.GVWR'
      Size = 6
    end
    object QryVinTIRE_SIZE: TStringField
      DisplayLabel = 'Tire Size'
      DisplayWidth = 20
      FieldName = 'TIRE_SIZE'
      Origin = 'v.TIRE_SIZE'
      Size = 60
    end
    object QryVinRIM: TStringField
      DisplayLabel = 'Rim'
      DisplayWidth = 20
      FieldName = 'RIM'
      Origin = 'v.RIM'
      Size = 60
    end
    object QryVinPSI: TStringField
      DisplayWidth = 20
      FieldName = 'PSI'
      Origin = 'v.PSI'
      Size = 60
    end
    object QryVinSINGLE_DUAL: TStringField
      DisplayLabel = 'Single/Dual'
      DisplayWidth = 20
      FieldName = 'SINGLE_DUAL'
      Origin = 'v.SINGLE_DUAL'
      Size = 60
    end
    object QryVinVEHICLE_ATTRIB: TStringField
      DisplayLabel = 'Vehicle Attributes'
      DisplayWidth = 20
      FieldName = 'VEHICLE_ATTRIB'
      Origin = 'v.VEHICLE_ATTRIB'
      ReadOnly = True
      Size = 60
    end
    object QryVinSPARE_TIRE: TStringField
      DisplayLabel = 'Spare Tire'
      DisplayWidth = 20
      FieldName = 'SPARE_TIRE'
      Origin = 'v.SPARE_TIRE'
      Size = 60
    end
    object QryVinNUM_AXLES: TBCDField
      DisplayLabel = 'Number of Axels'
      DisplayWidth = 10
      FieldName = 'NUM_AXLES'
      Origin = 'v.NUM_AXLES'
      ReadOnly = True
      Size = 0
    end
    object QryVinMODEL_YR: TBCDField
      DisplayLabel = 'Model Year'
      DisplayWidth = 10
      FieldName = 'MODEL_YR'
      Origin = 'v.MODEL_YR'
      ReadOnly = True
      Size = 0
    end
    object QryVinARCUSTO_COMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 20
      FieldName = 'ARCUSTO_COMPANY'
      Origin = 'v.ARCUSTO_COMPANY'
      ReadOnly = True
      Size = 60
    end
    object QryVinUNIT_PRICE: TFMTBCDField
      DisplayLabel = 'Sales Value'
      DisplayWidth = 10
      FieldName = 'UNIT_PRICE'
      Origin = 'v.UNIT_PRICE'
      ReadOnly = True
      Size = 6
    end
    object QryVinLIST_UNIT_PRICE: TFMTBCDField
      DisplayLabel = 'Sales List Price'
      DisplayWidth = 10
      FieldName = 'LIST_UNIT_PRICE'
      Origin = 'v.LIST_UNIT_PRICE'
      ReadOnly = True
      Size = 6
    end
    object QryVinWORKORDER_NUMBER: TFMTBCDField
      DisplayLabel = 'Workorder Number'
      DisplayWidth = 10
      FieldName = 'WORKORDER_NUMBER'
      Origin = 'w.id'
      ReadOnly = True
      Size = 38
    end
    object QryVinPACKSLIPNO: TStringField
      DisplayLabel = 'Packing Slip Number'
      DisplayWidth = 15
      FieldName = 'PACKSLIPNO'
      Origin = 's.packslipno'
      ReadOnly = True
      Size = 15
    end
    object QryVinINVOICE_NO: TStringField
      DisplayLabel = 'Invoice Number'
      DisplayWidth = 25
      FieldName = 'INVOICE_NO'
      Origin = 'a.invoice_no'
      ReadOnly = True
      Size = 25
    end
    object QryVinCONFIG_CHOICES: TStringField
      DisplayLabel = 'Config Choices'
      DisplayWidth = 10
      FieldName = 'CONFIG_CHOICES'
      Size = 4000
    end
    object QryVinID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'v.id'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryVinARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Origin = 'v.ARINVT_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryVinSTANDARD_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'STANDARD_ID'
      Origin = 'v.STANDARD_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryVinWORKORDER_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'WORKORDER_ID'
      Origin = 'v.WORKORDER_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryVinORD_DETAIL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ORD_DETAIL_ID'
      Origin = 'v.ORD_DETAIL_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryVinCRM_QUOTE_DETAIL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'CRM_QUOTE_DETAIL_ID'
      Origin = 'v.CRM_QUOTE_DETAIL_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryVinSHIPMENTS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SHIPMENTS_ID'
      Origin = 's.id'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryVinARINVOICE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVOICE_ID'
      Origin = 'a.id'
      ReadOnly = True
      Visible = False
      Size = 0
    end
  end
  object SrcVin: TDataSource
    DataSet = QryVin
    Left = 32
    Top = 216
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmTrackSer'
    WebUse = False
    TouchScreen = False
    Left = 344
    Top = 112
  end
  object PrinterSetupDialog2: TPrinterSetupDialog
    Left = 308
    Top = 113
  end
  object PopupMenu3: TUniPopupMenu
    Left = 272
    Top = 144
    object JumptoInventory2: TUniMenuItem
      Caption = 'Jump to Inventory'
      OnClick = JumptoInventory2Click
    end
    object JumptoBOM1: TUniMenuItem
      Caption = 'Jump to BOM'
      OnClick = JumptoBOM1Click
    end
    object JumptoWO1: TUniMenuItem
      Caption = 'Jump to WO'
      OnClick = JumptoWO1Click
    end
    object JumptoCRMQuote1: TUniMenuItem
      Caption = 'Jump to Sales Quotation'
      OnClick = JumptoCRMQuote1Click
    end
    object JumptoPackingSlip1: TUniMenuItem
      Caption = 'Jump to Packing Slip'
      OnClick = JumptoPackingSlip1Click
    end
    object JumptoPostedARInvoice1: TUniMenuItem
      Caption = 'Jump to Posted AR Invoice'
      OnClick = JumptoPostedARInvoice1Click
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    ModifySQL.Strings = (
      'update vin_history'
      'set'
      '  CONFIG_WEIGHT = :CONFIG_WEIGHT,'
      '  GAWR = :GAWR,'
      '  GVWR = :GVWR,'
      '  TIRE_SIZE = :TIRE_SIZE,'
      '  RIM = :RIM,'
      '  PSI = :PSI,'
      '  SINGLE_DUAL = :SINGLE_DUAL,'
      '  SPARE_TIRE = :SPARE_TIRE'
      'where'
      '  ID = :OLD_ID')
    Left = 104
    Top = 216
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FRMTRACKSER')
    SecurityCode = 'FRMTRACKSER'
    AfterApply = SRAfterApply
    Left = 408
    Top = 144
  end
  object SrcDimInv: TDataSource
    DataSet = QryDimInv
    Left = 120
    Top = 272
  end
  object QryDimInv: TFDQuery
    BeforeInsert = QryDimInvBeforeInsert
    BeforeEdit = QryDimInvBeforeEdit
    BeforeDelete = QryDimInvBeforeDelete
    UpdateObject = FDUpdateSQL1
    SQL.Strings = (
      'select id,'
      '       master_label_id,'
      '       name,'
      '       uom,'
      '       nvalue'
      '  from master_label_dim'
      ' where master_label_id = :aId')
    Left = 144
    Top = 272
    ParamData = <
      item
        Name = 'AID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryDimInvID: TBCDField
      DisplayWidth = 16
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
    object QryDimInvMASTER_LABEL_ID: TBCDField
      DisplayWidth = 16
      FieldName = 'MASTER_LABEL_ID'
      Origin = 'MASTER_LABEL_ID'
      Precision = 15
      Size = 0
    end
    object QryDimInvNAME: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 30
      FieldName = 'NAME'
      Origin = 'NAME'
      Size = 60
    end
    object QryDimInvUOM: TStringField
      DisplayWidth = 10
      FieldName = 'UOM'
      Origin = 'UOM'
      Size = 10
    end
    object QryDimInvNVALUE: TFMTBCDField
      DisplayLabel = 'Value'
      DisplayWidth = 16
      FieldName = 'NVALUE'
      Origin = 'NVALUE'
      Precision = 15
      Size = 6
    end
  end
  object FDUpdateSQL1: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'INSERT INTO MASTER_LABEL_DIM'
      '(ID, MASTER_LABEL_ID, NAME, UOM, NVALUE)'
      
        'VALUES (:NEW_ID, :NEW_MASTER_LABEL_ID, :NEW_NAME, :NEW_UOM, :NEW' +
        '_NVALUE)')
    ModifySQL.Strings = (
      'UPDATE MASTER_LABEL_DIM'
      
        'SET ID = :NEW_ID, MASTER_LABEL_ID = :NEW_MASTER_LABEL_ID, NAME =' +
        ' :NEW_NAME, '
      '  UOM = :NEW_UOM, NVALUE = :NEW_NVALUE'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM MASTER_LABEL_DIM'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT ID, MASTER_LABEL_ID, NAME, UOM, NVALUE'
      'FROM MASTER_LABEL_DIM'
      'WHERE ID = :ID')
    Left = 184
    Top = 280
  end
  object SrcMasterLbl2: TDataSource
    DataSet = QryMasterLbl2
    Left = 256
    Top = 280
  end
  object QryMasterLbl2: TFDQuery
    BeforeInsert = QryDimInvBeforeInsert
    BeforeDelete = QryDimInvBeforeDelete
    UpdateObject = FDUpdateSQL2
    SQL.Strings = (
      'select id,'
      '      inv_cuser1,'
      '      inv_cuser2,'
      '      inv_cuser3,'
      '      inv_cuser4,'
      '      inv_cuser5,'
      '      inv_cuser6,'
      '      inv_cuser7,'
      '      inv_cuser8,'
      '      inv_cuser9,'
      '      inv_nuser1,'
      '      inv_nuser2,'
      '      inv_nuser3,'
      '      inv_nuser4,'
      '      inv_nuser5,'
      '      inv_nuser6,'
      '      inv_nuser7,'
      '      inv_nuser8,'
      '      inv_nuser9,'
      '      invcuser10,'
      '      invnuser10'
      ' from master_label'
      'where id = :aId')
    Left = 280
    Top = 280
    ParamData = <
      item
        Name = 'AID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryMasterLbl2ID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
    object QryMasterLbl2INV_CUSER1: TStringField
      FieldName = 'INV_CUSER1'
      Origin = 'INV_CUSER1'
      Size = 100
    end
    object QryMasterLbl2INV_CUSER2: TStringField
      FieldName = 'INV_CUSER2'
      Origin = 'INV_CUSER2'
      Size = 100
    end
    object QryMasterLbl2INV_CUSER3: TStringField
      FieldName = 'INV_CUSER3'
      Origin = 'INV_CUSER3'
      Size = 100
    end
    object QryMasterLbl2INV_CUSER4: TStringField
      FieldName = 'INV_CUSER4'
      Origin = 'INV_CUSER4'
      Size = 100
    end
    object QryMasterLbl2INV_CUSER5: TStringField
      FieldName = 'INV_CUSER5'
      Origin = 'INV_CUSER5'
      Size = 100
    end
    object QryMasterLbl2INV_CUSER6: TStringField
      FieldName = 'INV_CUSER6'
      Origin = 'INV_CUSER6'
      Size = 100
    end
    object QryMasterLbl2INV_CUSER7: TStringField
      FieldName = 'INV_CUSER7'
      Origin = 'INV_CUSER7'
      Size = 100
    end
    object QryMasterLbl2INV_CUSER8: TStringField
      FieldName = 'INV_CUSER8'
      Origin = 'INV_CUSER8'
      Size = 100
    end
    object QryMasterLbl2INV_CUSER9: TStringField
      FieldName = 'INV_CUSER9'
      Origin = 'INV_CUSER9'
      Size = 100
    end
    object QryMasterLbl2INV_NUSER1: TFMTBCDField
      FieldName = 'INV_NUSER1'
      Origin = 'INV_NUSER1'
      Precision = 16
      Size = 6
    end
    object QryMasterLbl2INV_NUSER2: TFMTBCDField
      FieldName = 'INV_NUSER2'
      Origin = 'INV_NUSER2'
      Precision = 16
      Size = 6
    end
    object QryMasterLbl2INV_NUSER3: TFMTBCDField
      FieldName = 'INV_NUSER3'
      Origin = 'INV_NUSER3'
      Precision = 16
      Size = 6
    end
    object QryMasterLbl2INV_NUSER4: TFMTBCDField
      FieldName = 'INV_NUSER4'
      Origin = 'INV_NUSER4'
      Precision = 16
      Size = 6
    end
    object QryMasterLbl2INV_NUSER5: TFMTBCDField
      FieldName = 'INV_NUSER5'
      Origin = 'INV_NUSER5'
      Precision = 16
      Size = 6
    end
    object QryMasterLbl2INV_NUSER6: TFMTBCDField
      FieldName = 'INV_NUSER6'
      Origin = 'INV_NUSER6'
      Precision = 16
      Size = 6
    end
    object QryMasterLbl2INV_NUSER7: TFMTBCDField
      FieldName = 'INV_NUSER7'
      Origin = 'INV_NUSER7'
      Precision = 16
      Size = 6
    end
    object QryMasterLbl2INV_NUSER8: TFMTBCDField
      FieldName = 'INV_NUSER8'
      Origin = 'INV_NUSER8'
      Precision = 16
      Size = 6
    end
    object QryMasterLbl2INV_NUSER9: TFMTBCDField
      FieldName = 'INV_NUSER9'
      Origin = 'INV_NUSER9'
      Precision = 16
      Size = 6
    end
    object QryMasterLbl2INVCUSER10: TStringField
      FieldName = 'INVCUSER10'
      Origin = 'INVCUSER10'
      Size = 100
    end
    object QryMasterLbl2INVNUSER10: TFMTBCDField
      FieldName = 'INVNUSER10'
      Origin = 'INVNUSER10'
      Precision = 16
      Size = 6
    end
  end
  object FDUpdateSQL2: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'INSERT INTO MASTER_LABEL'
      '(ID, INV_CUSER1, INV_CUSER2, INV_CUSER3, '
      '  INV_CUSER4, INV_CUSER5, INV_CUSER6, INV_CUSER7, '
      '  INV_CUSER8, INV_CUSER9, INV_NUSER1, INV_NUSER2, '
      '  INV_NUSER3, INV_NUSER4, INV_NUSER5, INV_NUSER6, '
      '  INV_NUSER7, INV_NUSER8, INV_NUSER9, INVCUSER10, '
      '  INVNUSER10)'
      
        'VALUES (:NEW_ID, :NEW_INV_CUSER1, :NEW_INV_CUSER2, :NEW_INV_CUSE' +
        'R3, '
      
        '  :NEW_INV_CUSER4, :NEW_INV_CUSER5, :NEW_INV_CUSER6, :NEW_INV_CU' +
        'SER7, '
      
        '  :NEW_INV_CUSER8, :NEW_INV_CUSER9, :NEW_INV_NUSER1, :NEW_INV_NU' +
        'SER2, '
      
        '  :NEW_INV_NUSER3, :NEW_INV_NUSER4, :NEW_INV_NUSER5, :NEW_INV_NU' +
        'SER6, '
      
        '  :NEW_INV_NUSER7, :NEW_INV_NUSER8, :NEW_INV_NUSER9, :NEW_INVCUS' +
        'ER10, '
      '  :NEW_INVNUSER10)')
    ModifySQL.Strings = (
      'UPDATE MASTER_LABEL'
      
        'SET ID = :NEW_ID, INV_CUSER1 = :NEW_INV_CUSER1, INV_CUSER2 = :NE' +
        'W_INV_CUSER2, '
      '  INV_CUSER3 = :NEW_INV_CUSER3, INV_CUSER4 = :NEW_INV_CUSER4, '
      '  INV_CUSER5 = :NEW_INV_CUSER5, INV_CUSER6 = :NEW_INV_CUSER6, '
      '  INV_CUSER7 = :NEW_INV_CUSER7, INV_CUSER8 = :NEW_INV_CUSER8, '
      '  INV_CUSER9 = :NEW_INV_CUSER9, INV_NUSER1 = :NEW_INV_NUSER1, '
      '  INV_NUSER2 = :NEW_INV_NUSER2, INV_NUSER3 = :NEW_INV_NUSER3, '
      '  INV_NUSER4 = :NEW_INV_NUSER4, INV_NUSER5 = :NEW_INV_NUSER5, '
      '  INV_NUSER6 = :NEW_INV_NUSER6, INV_NUSER7 = :NEW_INV_NUSER7, '
      '  INV_NUSER8 = :NEW_INV_NUSER8, INV_NUSER9 = :NEW_INV_NUSER9, '
      '  INVCUSER10 = :NEW_INVCUSER10, INVNUSER10 = :NEW_INVNUSER10'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM MASTER_LABEL'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, EQNO, CLASS, ITEMNO, REV, DESCRIP, DESCRIP2, MFGNO, O' +
        'RDERNO, '
      '  PONO, ARCUSTO_ID, FG_LOTNO, BOXNO, PRINT_DATE, SCANNED, '
      '  SERIAL, QTY, PARENT_ID, DISPO_SCAN, VOLUME, WEIGHT, IS_SKID, '
      
        '  LOC_DESC, BOX_ID, ARINVT_ID, SYS_DATE, USER_NAME, VMI_CONSUMED' +
        ', '
      
        '  SHIPMENT_DTL_ID, PS_TICKET_REL_ID, PS_TICKET_DTL_ID, IS_PALLET' +
        ', '
      '  TRACKNO, PRINT_QTY, DISPO_DATE, ORD_DETAIL_ID, STANDARD_ID, '
      '  PKG_AKA_ID, PKG_AKA_ITEMNO, SHIPPING, FGMULTI_ID, DOCKID, '
      '  LINEFEED, RESERVELOC, PCI_11Z, PCI_12Z, PCI_13Z, PCI_14Z, '
      '  PCI_15Z, PCI_16Z, PCI_17Z, SEG_MAN, DAY_PART_ID, NOSHIP, '
      '  REPACKED_MASTER_LABEL_ID, LM_LABELS_ID, UPC_CODE, UPC_CODE2, '
      
        '  ORIG_SYSDATE, ORIG_USER_NAME, SHIP_DOCK_LOCATIONS_ID, VERIFIED' +
        ', '
      '  LOT_DATE, INV_CUSER1, INV_CUSER2, INV_CUSER3, INV_CUSER4, '
      '  INV_CUSER5, INV_CUSER6, INV_CUSER7, INV_CUSER8, INV_CUSER9, '
      '  INV_NUSER1, INV_NUSER2, INV_NUSER3, INV_NUSER4, INV_NUSER5, '
      '  INV_NUSER6, INV_NUSER7, INV_NUSER8, INV_NUSER9, INVCUSER10, '
      '  INVNUSER10, PRESSNO, PROD_DATE, LAST_SNDOP_ID, NEXT_SNDOP_ID, '
      
        '  PROCESS_LOGIN, PROCESS_SHIFT, SNDOP_DISPATCH_ID, NEXT_SNDOP_DI' +
        'SPATCH_ID, '
      
        '  VIN_NO, VIN_WO_ID, WORKORDER_ID, COUNTRYORG, PROCESS_SHIFT_ID,' +
        ' '
      '  PACKSLIPNO, RAN, MIXED_ARINVT_ID, DATE_RECEIVED, BADGENO'
      'FROM MASTER_LABEL'
      'WHERE ID = :ID')
    Left = 320
    Top = 288
  end
  object popmTranslog: TUniPopupMenu
    Left = 436
    Top = 192
    object ShowSerialNumbers1: TUniMenuItem
      Caption = 'Show Serial Numbers'
      OnClick = ShowSerialNumbers1Click
    end
  end
end
