object FrmMatStaging: TFrmMatStaging
  Left = 298
  Top = 219
  HelpContext = 1052028
  ClientHeight = 409
  ClientWidth = 878
  Caption = 'Material Staging Requirements'
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TUniPageControl
    Left = 0
    Top = 27
    Width = 878
    Height = 382
    Hint = ''
    ActivePage = shByMaterial
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    TabStop = False
    OnChange = PageControl1Change
    ExplicitWidth = 766
    ExplicitHeight = 307
    object shByMaterial: TUniTabSheet
      Hint = ''
      HelpContext = 1052028
      Caption = 'By Material'
      ExplicitWidth = 758
      ExplicitHeight = 279
      object Splitter1: TUniSplitter
        Left = 0
        Top = 131
        Width = 870
        Height = 3
        Cursor = crVSplit
        Hint = ''
        Align = alTop
        ParentColor = False
        Color = clBtnFace
        ExplicitTop = 96
        ExplicitWidth = 758
      end
      object pnlMatStaging: TUniPanel
        Left = 0
        Top = 0
        Width = 870
        Height = 131
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = 'pnlMatStaging'
        ExplicitWidth = 831
        object gridMatStaging: TUniDBGrid
          Left = 1
          Top = 1
          Width = 868
          Height = 129
          Hint = ''
          DataSource = SrcMatStaging
          LoadMask.Message = 'Loading data...'
          OnEnter = SetNavigatorSource
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Columns = <
            item
              FieldName = 'CLASS'
              Title.Caption = 'Class'
              Width = 41
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ITEMNO'
              Title.Caption = 'Item #'
              Width = 118
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'REV'
              Title.Caption = 'Revision'
              Width = 57
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DESCRIP'
              Title.Caption = 'Description'
              Width = 178
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'QTY'
              Title.Caption = 'Required'
              Width = 67
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'EPLANT_DESCRIP'
              Title.Caption = 'EPlant'
              Width = 94
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DESCRIP2'
              Title.Caption = 'Ext Description'
              Width = 214
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
      end
      object gridMatStagingDtl: TUniDBGrid
        Left = 0
        Top = 181
        Width = 870
        Height = 173
        Hint = ''
        DataSource = SrcMatStagingDtl
        LoadMask.Message = 'Loading data...'
        OnEnter = SetNavigatorSource
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        OnDrawColumnCell = gridMatStagingDtlDrawColumnCell
        Columns = <
          item
            FieldName = 'EQNO'
            Title.Caption = 'Work Center'
            Width = 79
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'TOT_MAT_QTY'
            Title.Caption = 'Required'
            Width = 65
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PROD_DATE'
            Title.Caption = 'Date'
            Width = 112
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'WORKORDER_ID'
            Title.Caption = 'Work Order #'
            Width = 85
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'MFGNO'
            Title.Caption = 'MFG #'
            Width = 84
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PROD_HRS'
            Title.Caption = 'Production Hours'
            Width = 93
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'SETUPHRS'
            Title.Caption = 'Setup Hours'
            Width = 87
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'FG_ITEMNO'
            Title.Caption = 'FG Item #'
            Width = 102
            CheckBoxField.FieldValues = 'true;false'
          end>
      end
      object Panel3: TUniPanel
        Tag = 1999
        Left = 0
        Top = 134
        Width = 870
        Height = 47
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Caption = ''
        ExplicitTop = 99
        ExplicitWidth = 758
        object Panel5: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 868
          Height = 20
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          TabOrder = 0
          Caption = ''
          Color = clBtnShadow
          ExplicitWidth = 756
          object Label2: TUniLabel
            Left = 1
            Top = 1
            Width = 120
            Height = 13
            Hint = ''
            Caption = ' Work Center Staging'
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
          Width = 868
          Height = 25
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          ExplicitWidth = 756
        end
      end
    end
    object shByWorkCenter: TUniTabSheet
      Hint = ''
      HelpContext = 1052030
      Caption = 'By Work Center '
      ExplicitWidth = 758
      ExplicitHeight = 279
      object Splitter2: TUniSplitter
        Left = 191
        Top = 0
        Width = 6
        Height = 354
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
        ExplicitHeight = 279
      end
      object pnlWorkCenters: TUniPanel
        Left = 0
        Top = 0
        Width = 191
        Height = 354
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        ExplicitHeight = 279
        object DBGrid1: TUniDBGrid
          Left = 1
          Top = 1
          Width = 189
          Height = 352
          Hint = ''
          DataSource = SrcSchedCenters
          LoadMask.Message = 'Loading data...'
          OnEnter = SetNavigatorSource
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Columns = <
            item
              FieldName = 'CNTR_DESC'
              Title.Caption = 'Work Center Description'
              Width = 129
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'EQNO'
              Title.Caption = 'Work Center'
              Width = 76
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'EPLANT_DESCRIP'
              Title.Caption = 'EPlant'
              Width = 61
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
      end
      object Panel2: TUniPanel
        Left = 197
        Top = 0
        Width = 673
        Height = 354
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        ExplicitWidth = 561
        ExplicitHeight = 279
        object Splitter3: TUniSplitter
          Left = 1
          Top = 137
          Width = 671
          Height = 3
          Cursor = crVSplit
          Hint = ''
          Align = alTop
          ParentColor = False
          Color = clBtnFace
          ExplicitWidth = 559
        end
        object pnlWrkCntrStageDtl: TUniPanel
          Left = 1
          Top = 1
          Width = 671
          Height = 136
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = 'pnlWrkCntrStageDtl'
          ExplicitWidth = 559
          object gridWrkCntrStageDtl: TUniDBGrid
            Left = 1
            Top = 1
            Width = 669
            Height = 134
            Hint = ''
            DataSource = SrcSchdCntrStageDtl
            LoadMask.Message = 'Loading data...'
            OnEnter = SetNavigatorSource
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Columns = <
              item
                FieldName = 'CLASS'
                Title.Caption = 'Class'
                Width = 42
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'ITEMNO'
                Title.Caption = 'Item #'
                Width = 196
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'QTY'
                Title.Caption = 'Required'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'REV'
                Title.Caption = 'Revision'
                Width = 50
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'DESCRIP'
                Title.Caption = 'Description'
                Width = 118
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'DESCRIP2'
                Title.Caption = 'Ext Description'
                Width = 142
                CheckBoxField.FieldValues = 'true;false'
              end>
          end
        end
        object gridWrkCntrStageDates: TUniDBGrid
          Left = 1
          Top = 140
          Width = 671
          Height = 213
          Hint = ''
          DataSource = SrcSchdCntrStageDates
          LoadMask.Message = 'Loading data...'
          OnEnter = SetNavigatorSource
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Columns = <
            item
              FieldName = 'PROD_DATE'
              Title.Caption = 'Date'
              Width = 112
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'QTY'
              Title.Caption = 'Required'
              Width = 50
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'WORKORDER_ID'
              Title.Caption = 'Work Order #'
              Width = 89
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'MFGNO'
              Title.Caption = 'MFG #'
              Width = 104
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ITEMNO'
              Title.Caption = 'FG Item #'
              Width = 135
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
      end
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 878
    Height = 27
    Hint = ''
    ShowHint = True
    ParentShowHint = False
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Alignment = taLeftJustify
    Caption = ''
    ExplicitWidth = 766
    object SBFilter: TUniSpeedButton
      Left = 30
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Scope'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000232E0000232E00000000000000000000FF00FFFF00FF
        FF00FFB3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB397
        7DB3977DB3977DB3977DFF00FFFF00FFFF00FF94949494949494949494949494
        9494949494949494949494949494949494949494949494949494FF00FFFF00FF
        FF00FFB3977DF4EDE2F3ECE0E1D1BEE4BFA6F2E8DAF1E6D8CCB294E4BFA6EFE3
        D4EFE2D0EFE2D2B3977DFF00FFFF00FFFF00FF949494EBEBEBEAEAEACFCFCFBD
        BDBDE6E6E6E4E4E4AEAEAEBDBDBDE1E1E1E0E0E0E0E0E0949494FF00FFFF00FF
        FF00FFB3977DF3ECE3F3EBE1E3D3C2E4BFA6F1E7DBEFE6D9CFB69AE4BFA6EDE2
        D3EFE2D0EDE1D1B3977DFF00FFFF00FFFF00FF949494EBEBEBEAEAEAD1D1D1BD
        BDBDE6E6E6E4E4E4B3B3B3BDBDBDE0E0E0E0E0E0DFDFDF949494FF00FFFF00FF
        FF00FFB3977DE4BFA6E4BFA6E4BFA6E4BFA6E4BFA6E4BFA6E4BFA6E4BFA6E4BF
        A6E4BFA6E4BFA6B3977DFF00FFFF00FFFF00FF949494BDBDBDBDBDBDBDBDBDBD
        BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD949494FF00FFFF00FF
        FF00FFB3977DFDFBFAFCFBF9EFE5DBE4BFA6FBF8F5FAF7F3DEC9B5E4BFA62152
        FF1143FF0033FFB3977DFF00FFFF00FFFF00FF949494FBFBFBFBFBFBE4E4E4BD
        BDBDF8F8F8F7F7F7C7C7C7BDBDBD8F8F8F8A8A8A868686949494FF00FFFF00FF
        FF00FFB3977DFAF5F2FAF4F1EFE3D9E4BFA6F8F3EEF7F1ECE1CCB9E4BFA64A79
        FF2152FF1143FFB3977DFF00FFFF00FFFF00FF949494F5F5F5F4F4F4E2E2E2BD
        BDBDF3F3F3F1F1F1CACACABDBDBDA1A1A18F8F8F8A8A8A949494FF00FFFF00FF
        FF00FFB3977DE4BFA6E4BFA6E4BFA6E4BFA6E4BFA6E4BFA6E4BFA6E4BFA6E4BF
        A6E4BFA6E4BFA6B3977DFF00FFFF00FFFF00FF949494BDBDBDBDBDBDBDBDBDBD
        BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD949494FF00FFFF00FF
        FF00FFB3977D707070404040000800E4BFA6FFFEFEFFFFFEEDDBCEE4BFA6FFFE
        FFFFFFFFFFFEFEB3977DFF00FFFF00FFFF00FF949494707070404040050505BD
        BDBDFEFEFEFFFFFFDADADABDBDBDFEFEFEFFFFFFFEFEFE949494FF00FFFF00FF
        FF00FFB3977D707070505050100810E4BFA6ECE1D8ECE2D9E0C9B7E4BFA6ECE4
        DCECE4DCECE4DDB3977DFF00FFFF00FFFF00FF9494947070705050500B0B0BBD
        BDBDE0E0E0E1E1E1C7C7C7BDBDBDE3E3E3E3E3E3E3E3E3949494FF00FFFF00FF
        FF00FFA17A57707070707070404040CA9C7AC89774C78F6AC58860C28056BE77
        4CBE774CB66D44A17A57FF00FFFF00FFFF00FF77777770707070707040404099
        99999595958D8D8D8787877F7F7F7777777777776E6E6E777777FF00FFFF00FF
        FF00FFA17A57707070909890504850E3CCB8B78B67B68661B5825CB47D56B178
        50B17850AD734CA17A57FF00FFFF00FFFF00FF7777777070709696964A4A4ACA
        CACA8989898484848080807C7C7C777777777777727272777777FF00FFFF00FF
        FF00FFD3C8B9909090D0C8C0505850BAA69CFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC6C6C6909090C7C7C7555555A6
        A6A6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        DACBBF808880F0F0F0E0D8D0909890404840D0BCACFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFCACACA868686F0F0F0D7D7D796969646
        4646BABABAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE5D3C9
        707070F0E8F0FFF8FFF0E8E0D0D0D0707070404840D9C1AEFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFD3D3D3707070EBEBEBFAFAFAE7E7E7D0D0D070
        7070464646BFBFBFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDFCFC7707070
        C0C8C0FFFFFFF0F8F0F0F0F0D0D8D0B0A8B0606060404840CDB5A2FF00FFFF00
        FFFF00FFFF00FFFF00FFCFCFCF707070C6C6C6FFFFFFF6F6F6F0F0F0D6D6D6AB
        ABAB606060464646B4B4B4FF00FFFF00FFFF00FFFF00FFFF00FFC0B8C0C0C0C0
        D0C8D0C0C0C0B0B8B0B0B0B0B0B0B0A0A0A0808080606060404840FF00FFFF00
        FFFF00FFFF00FFFF00FFBBBBBBC0C0C0CBCBCBC0C0C0B6B6B6B0B0B0B0B0B0A0
        A0A0808080606060464646FF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = SBFilterClick
    end
    object sbtnSearch: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Search'
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
      ParentColor = False
      Color = clWindow
      OnClick = sbtnSearchClick
    end
    object sbtnEplantView: TUniSpeedButton
      Left = 55
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Set EPlant View'
      ShowHint = True
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFB0A0906048306048306048306048306048306048306048
        30604830604830604830FF00FFFF00FFFF00FFFF00FFFF00FF9E9E9E46464646
        4646464646464646464646464646464646464646464646464646FF00FFFF00FF
        FF00FFFF00FFFF00FFB0A090E0E8E0D0D8D0D0D0D0C0C0C0C0B8C0B0B0B0B0A8
        A0A0A0A0A098A0604830FF00FFFF00FFFF00FFFF00FFFF00FF9E9E9EE6E6E6D6
        D6D6D0D0D0C0C0C0BBBBBBB0B0B0A7A7A7A0A0A09B9B9B464646FF00FFFF00FF
        FF00FFFF00FFFF00FFB0A090F0F0F0F0E8F0E0E0E0E0D8D0D0D0D06060508078
        70A0A0A0A0A0A0604830FF00FFFF00FFFF00FFFF00FFFF00FF9E9E9EF0F0F0EB
        EBEBE0E0E0D7D7D7D0D0D05C5C5C777777A0A0A0A0A0A0464646FF00FFFF00FF
        FF00FFFF00FFFF00FFB0A090FFF8FFF0F8F0F0F0F0E0E8E0E0D8E0303030FFFF
        FF909090B0A8A0604830FF00FFFF00FFFF00FFFF00FFFF00FF9E9E9EFAFAFAF6
        F6F6F0F0F0E6E6E6DBDBDB303030FFFFFF909090A7A7A7464646FF00FFFF00FF
        FF00FFFF00FFFF00FFB0A090FFFFFFB0B0B0808880A0A0A0D0D0D02018103028
        20706050B0B0B0604830FF00FFFF00FFFF00FFFF00FFFF00FF9E9E9EFFFFFFB0
        B0B0868686A0A0A0D0D0D01717172727275E5E5EB0B0B0464646FF00FFFF00FF
        FF00FFFF00FFFF00FFB0A090FFFFFFFFFFFFFFFFFFFFF8FFF0F0F0E0E8E0E0D8
        E0D0D0D0B0B8B0604830FF00FFFF00FFFF00FFFF00FFFF00FF9E9E9EFFFFFFFF
        FFFFFFFFFFFAFAFAF0F0F0E6E6E6DBDBDBD0D0D0B6B6B6464646FF00FFFF00FF
        FF00FFFF00FF707070404040000800FFFFFFFFFFFFFFFFFFFFF8FF6060508078
        70A0A0A0C0C0C0604830FF00FFFF00FFFF00FFFF00FF707070404040050505FF
        FFFFFFFFFFFFFFFFFAFAFA5C5C5C777777A0A0A0C0C0C0464646FF00FFFF00FF
        FF00FFFF00FF707070505050100810FFFFFFFFFFFFFFFFFFFFFFFF303030FFFF
        FF909090D0C8D0604830FF00FFFF00FFFF00FFFF00FF7070705050500B0B0BFF
        FFFFFFFFFFFFFFFFFFFFFF303030FFFFFF909090CBCBCB464646FF00FFFF00FF
        FF00FFFF00FF707070707070404040B0B8B0909090A098A0E0E0E01018103028
        20706050D0D8D0604830FF00FFFF00FFFF00FFFF00FF707070707070404040B6
        B6B69090909B9B9BE0E0E01616162727275E5E5ED6D6D6464646FF00FFFF00FF
        FF00FFFF00FF707070909890504850F0E8F0FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF8FFE0E0E0604830FF00FFFF00FFFF00FFFF00FF7070709696964A4A4AEB
        EBEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAE0E0E0464646FF00FFFF00FF
        FF00FFD3C8B9909090D0C8C0505850B08070E09870E09070E09060E08060D080
        50D07840D07040D06830FF00FFFF00FFFF00FFC6C6C6909090C7C7C755555581
        81819898989292929090908585858080807979797373736C6C6CFF00FFFF00FF
        DACBBF808880F0F0F0E0D8D0909890404840D0A080FFB090FFA880F0A070F098
        70F09860F09860D06830FF00FFFF00FFCACACA868686F0F0F0D7D7D796969646
        46469E9E9EB1B1B1A9A9A9A0A0A09A9A9A9898989898986C6C6CFF00FFE5D3C9
        707070F0E8F0FFF8FFF0E8E0D0D0D0707070404840C08860E09060E08860D080
        50D07840D07040D06830FF00FFD3D3D3707070EBEBEBFAFAFAE7E7E7D0D0D070
        70704646468686869090908A8A8A8080807979797373736C6C6CDFCFC7707070
        C0C8C0FFFFFFF0F8F0F0F0F0D0D8D0B0A8B0606060404840CDB5A2FF00FFFF00
        FFFF00FFFF00FFFF00FFCFCFCF707070C6C6C6FFFFFFF6F6F6F0F0F0D6D6D6AB
        ABAB606060464646B4B4B4FF00FFFF00FFFF00FFFF00FFFF00FFC0B8C0C0C0C0
        D0C8D0C0C0C0B0B8B0B0B0B0B0B0B0A0A0A0808080606060404840FF00FFFF00
        FFFF00FFFF00FFFF00FFBBBBBBC0C0C0CBCBCBC0C0C0B6B6B6B0B0B0B0B0B0A0
        A0A0808080606060464646FF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnEplantViewClick
    end
    object sbtnUpdateSched: TUniSpeedButton
      Tag = 1
      Left = 80
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Run  Update Schedule'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000232E0000232E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFB3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB397
        7DB3977DB3977DB3977DFF00FFFF00FFFF00FF94949494949494949494949494
        9494949494949494949494949494949494949494949494949494FF00FFFF00FF
        FF00FFB3977DF4EDE2F3ECE0E1D1BEE4BFA6F2E8DAF1E6D8CCB294E4BFA6EFE3
        D4EFE2D0EFE2D2B3977DFF00FFFF00FFFF00FF949494EBEBEBEAEAEACFCFCFBD
        BDBDE6E6E6E4E4E4AEAEAEBDBDBDE1E1E1E0E0E0E0E0E0949494CADCCA375438
        708173AA9078F3ECE3F3EBE1E3D3C2E4BFA6F1E7DBEFE6D9CFB69AE4BFA6EDE2
        D3EFE2D0EDE1D1B3977DD7D7D74D4D4D7D7D7D8E8E8EEBEBEBEAEAEAD1D1D1BD
        BDBDE6E6E6E4E4E4B3B3B3BDBDBDE0E0E0E0E0E0DFDFDF949494008A0000DA05
        0FA6225B6F4ED0AF99E4BFA6E4BFA6E4BFA6E4BFA6E4BFA6E4BFA6E4BFA6E4BF
        A6E4BFA6E4BFA6B3977D767676BCBCBC8F8F8F686868ADADADBDBDBDBDBDBDBD
        BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD949494008A0000E000
        00D90611A421739578E3E2E0EFE5DBE4BFA6FBF8F5FAF7F3DEC9B5E4BFA62152
        FF1143FF0033FFB3977D767676C2C2C2BBBBBB8D8D8D8D8D8DE2E2E2E4E4E4BD
        BDBDF8F8F8F7F7F7C7C7C7BDBDBD8F8F8F8A8A8A868686949494008A0000E300
        00EB0000D90610A6206E8E71D9CFC6E4BFA6F8F3EEF7F1ECE1CCB9E4BFA64A79
        FF2152FF1143FFB3977D767676C4C4C4CBCBCBBBBBBB8F8F8F878787CECECEBD
        BDBDF3F3F3F1F1F1CACACABDBDBDA1A1A18F8F8F8A8A8A949494008A0200E210
        00ED0000EB0000DA050EAA20607354D7B59EE4BFA6E4BFA6E4BFA6E4BFA6E4BF
        A6E4BFA6E4BFA6B3977D767676C3C3C3CDCDCDCBCBCBBCBCBC9393936C6C6CB3
        B3B3BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD949494058A0027E00A
        00E21100EE0000EB0000DB0409B11F57604EFFFEFEFFFFFEEDDBCEE4BFA6FFFE
        FFFFFFFFFFFEFEB3977D767676C2C2C2C3C3C3CECECECBCBCBBDBDBD9999995C
        5C5CFEFEFEFFFFFFDADADABDBDBDFEFEFEFFFFFFFEFEFE949494078A1031E674
        00F30A00E21000EF0002E80700D90411890EECE1D8ECE2D9E0C9B7E4BFA6ECE4
        DCECE4DCECE4DDB3977D767676CCCCCCD2D2D2C3C3C3CFCFCFC9C9C9BBBBBB75
        7575E0E0E0E1E1E1C7C7C7BDBDBDE3E3E3E3E3E3E3E3E3949494088A0E3BE668
        00FF0000F30B00E20E22D3572A962FB8996FC89774C78F6AC58860C28056BE77
        4CBE774CB66D44A17A57767676CCCCCCDCDCDCD2D2D2C3C3C3BABABA83838394
        94949595958D8D8D8787877F7F7F7777777777776E6E6E7777770E8A0363E618
        00FF0012FA0412D7102998209D8D5EB88E6BB78B67B68661B5825CB47D56B178
        50B17850AD734CA17A57767676C8C8C8DCDCDCD8D8D8BABABA8484848686868C
        8C8C8989898484848080807C7C7C777777777777727272777777118A0B7AE552
        13FA043FD50F60B749D2E7D2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF767676CACACAD8D8D8B9B9B9A2A2A2E1E1E1FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF158A15AEDFAE
        5DD3515FB64AD2E7D2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF777777D3D3D3BABABAA1A1A1E1E1E1FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF158A15A0CDA0
        60AF60DAEBDAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF777777C2C2C29E9E9EE7E7E7FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC6E2C644A144
        E9F3E9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFDBDBDB8E8E8EF1F1F1FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnUpdateSchedClick
    end
    object sbtnPrintStagingReport: TUniSpeedButton
      Left = 111
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Print Staging Report'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDAB395
        8068508060508060507060507058407058407050407050406048306048306048
        30AF8C6FFF00FFFF00FFFF00FFB1B1B16565656060606060605E5E5E56565656
        56565050505050504646464646464646468A8A8AFF00FFFF00FFD3B39AA48B82
        E0D0C0B0A090B0A090B0A090B0A090B0A090B0A090B0A090B0A090B0A090B0A0
        90604830FF00FFFF00FFB1B1B18B8B8BCECECE9E9E9E9E9E9E9E9E9E9E9E9E9E
        9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E464646FF00FFFF00FFC8AD97B39B91
        FFE8E0FFF8F0FFF0E0FFE8E0F0D8D0F0D0B0F0C0A000A00000A00000A0007058
        406048308D7057FF00FFABABAB9B9B9BE9E9E9F7F7F7EEEEEEE9E9E9D9D9D9CD
        CDCDBEBEBE8A8A8A8A8A8A8A8A8A5656564646466E6E6EFF00FFB49383E0D8D0
        FFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F0E0E0F0D8C000FF1000FFB000A0008068
        50705040604830FF00FF939393D7D7D7FFFFFFFFFFFFFFFFFFFFFFFFF2F2F2E2
        E2E2D5D5D5DCDCDCE8E8E88A8A8A656565505050464646FF00FFB09080F0E8E0
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0E8E000FF1000FF1000A0009070
        60706050604830FF00FF8F8F8FE7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
        F7F7E7E7E7DCDCDCDCDCDC8A8A8A7070705E5E5E464646FF00FFB09880D0C0B0
        D0B8B0C0B0A0B0A090B09880A088809080709070608068608060507058509080
        70806860705840FF00FF959595BEBEBEB8B8B8AEAEAE9E9E9E9595958888887E
        7E7E7070706868686060605858587E7E7E686868565656FF00FFC0A090FFF8F0
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0FFF0F0F0F0F0F0E8E0A088
        80907860806050FF00FFA0A0A0F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF7F7F7F2F2F2F0F0F0E7E7E7888888757575606060FF00FFDFC5AEB9A089
        D0B0A0C0A8A0D0B0A0C0A090B09080A08070907060806050706050807060B0A0
        90A08870806050FF00FFC3C3C39D9D9DAFAFAFA8A8A8AFAFAFA0A0A08F8F8F80
        80807070706060605E5E5E6E6E6E9E9E9E858585606060FF00FFFF00FFD9C3AF
        C0B0A0E0C8C0FFFFFFFFF8FFFFF8FFFFF0F0F0F0E0F0E0E0C0A8A0806050A090
        80C0B0A0806050FF00FFFF00FFC1C1C1AEAEAEC9C9C9FFFFFFFAFAFAFAFAFAF2
        F2F2EDEDEDE2E2E2A8A8A86060608E8E8EAEAEAE606060FF00FFFF00FFFF00FF
        F0D9C5C0B0A0FFFFFFF0E8E0D0C8C0D0C8C0D0B8B0D0C0B0E0D0D08068608060
        50B09890B0A090FF00FFFF00FFFF00FFD7D7D7AEAEAEFFFFFFE7E7E7C7C7C7C7
        C7C7B8B8B8BEBEBED2D2D26868686060609999999E9E9EFF00FFFF00FFFF00FF
        FF00FFE0C8B1F0E8E0FFFFFFFFFFFFFFFFFFFFF8FFFFF0F0F0E0D0D0B8B08060
        50C5AA97FF00FFFF00FFFF00FFFF00FFFF00FFC6C6C6E7E7E7FFFFFFFFFFFFFF
        FFFFFAFAFAF2F2F2DEDEDEB8B8B8606060A9A9A9FF00FFFF00FFFF00FFFF00FF
        FF00FFF6DFCCD0B8B0FFFFFFF0F0F0D0C8C0D0C8C0D0B8B0C0B0B0E0D8D08070
        60876757FF00FFFF00FFFF00FFFF00FFFF00FFDDDDDDB8B8B8FFFFFFF0F0F0C7
        C7C7C7C7C7B8B8B8B1B1B1D7D7D76E6E6E676767FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFE9D1C3E1D1D0FFFFFFFFFFFFFFFFFFFFFFFFFFF8FFF0E8E0D0B8
        B0806050EDD5C2FF00FFFF00FFFF00FFFF00FFFF00FFD0D0D0D3D3D3FFFFFFFF
        FFFFFFFFFFFFFFFFFAFAFAE7E7E7B8B8B8606060D4D4D4FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFE9D2C4D0C0B0D0C0B0D0C0B0D0C0B0D0C0B0D0C0B0D0C0
        B0D0C0B0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD1D1D1BEBEBEBE
        BEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnPrintStagingReportClick
    end
    object Bevel4: TUniPanel
      Left = 27
      Top = 3
      Width = 2
      Height = 20
      Hint = ''
      ShowHint = True
      TabOrder = 7
      Caption = ''
    end
    object Bevel1: TUniPanel
      Left = 107
      Top = 3
      Width = 2
      Height = 20
      Hint = ''
      ShowHint = True
      TabOrder = 8
      Caption = ''
    end
    object NavMain: TUniDBNavigator
      Left = 777
      Top = 1
      Width = 100
      Height = 25
      Hint = ''
      ShowHint = True
      DataSource = SrcMatStaging
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      ExplicitLeft = 665
    end
  end
  object SrcMatStaging: TDataSource
    DataSet = QryMatStaging
    Left = 40
    Top = 64
  end
  object SrcMatStagingDtl: TDataSource
    DataSet = QryMatStagingDtl
    Left = 96
    Top = 80
  end
  object QryMatStaging: TFDQuery
    BeforeOpen = AssignEPlantFilter
    OnCalcFields = QryMatStagingCalcFields
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select use.arinvt_id,'
      '       a.class,'
      '       a.itemno, '
      '       a.rev,'
      '       a.descrip,'
      '       a.descrip2,'
      '       a.eplant_id,'
      
        '       decode( e.id, NULL, '#39' '#39', '#39'['#39' || e.ID || '#39']  '#39' || e.name )' +
        ' as eplant_descrip,'
      '       sum(use.tot_mat_qty) as qty'
      '  from day_hrs hrs,'
      '       day_pts pts,'
      '       day_use use,'
      '       cntr_sched,'
      '       arinvt a,'
      '       eplant e,'
      '       workorder,'
      '       params'
      ' where pts.day_hrs_id = hrs.id'
      '   and use.day_pts_id = pts.id'
      '   and trunc(hrs.prod_date) between :prod_date1 and :prod_date2'
      '   and cntr_sched.workorder_id = hrs.workorder_id'
      '   and a.id = use.arinvt_id'
      '   and a.eplant_id = e.id(+)'
      '   and hrs.workorder_id = workorder.id(+)'
      ''
      
        '   and nvl( hrs.sndop_id, 0) = nvl((select sndop_id from sndop_d' +
        'ispatch where id = cntr_sched.sndop_dispatch_id),0)'
      '   '
      '   and ( NVL(params.fr_hide, '#39'N'#39') = '#39'N'#39
      '         or'
      
        '         NVL(params.fr_hide, '#39'N'#39') = '#39'Y'#39' and NVL(workorder.origin' +
        ', '#39'*'#39') <> '#39'FORECAST'#39')'
      '  group by a.class,'
      '           a.itemno, '
      '           a.rev,'
      '           a.descrip,'
      '           a.descrip2,'
      '           use.arinvt_id,'
      '           a.eplant_id,'
      
        '           decode( e.id, NULL, '#39' '#39', '#39'['#39' || e.ID || '#39']  '#39' || e.na' +
        'me )'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 40
    Top = 96
    ParamData = <
      item
        Name = 'prod_date1'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'prod_date2'
        DataType = ftDateTime
        ParamType = ptInput
      end>
    object QryMatStagingARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Origin = 'DAY_USE_TOTAL.ARINVT_ID'
      Size = 0
    end
    object QryMatStagingCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Origin = 'ARINVT.CLASS'
      Size = 2
    end
    object QryMatStagingITEMNO: TStringField
      DisplayLabel = 'Item#'
      FieldName = 'ITEMNO'
      Origin = 'ARINVT.ITEMNO'
      Size = 50
    end
    object QryMatStagingREV: TStringField
      DisplayLabel = 'Rev'
      FieldName = 'REV'
      Origin = 'ARINVT.REV'
      Size = 15
    end
    object QryMatStagingDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'ARINVT.DESCRIP'
      Size = 100
    end
    object QryMatStagingQTY: TFMTBCDField
      DisplayLabel = 'Required'
      FieldName = 'QTY'
      Origin = 'DAY_USE_TOTAL.TOT_MAT_QTY'
      DisplayFormat = '#########0.00'
      Size = 38
    end
    object QryMatStagingProd_Date1: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'Prod_Date1'
      Calculated = True
    end
    object QryMatStagingProd_Date2: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'Prod_Date2'
      Calculated = True
    end
    object QryMatStagingEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object QryMatStagingEPLANT_DESCRIP: TStringField
      DisplayWidth = 15
      FieldName = 'EPLANT_DESCRIP'
      Size = 74
    end
    object QryMatStagingDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Size = 100
    end
  end
  object QryMatStagingDtl: TFDQuery
    MasterSource = SrcMatStaging
    MasterFields = 'ARINVT_ID;Prod_Date1;Prod_Date2'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select hrs.workorder_id,'
      '       Trunc(hrs.prod_date) as prod_date,'
      '       a.itemno as fg_itemno,'
      '       use.tot_mat_qty,'
      '       s.mfgno,'
      '       hrs.prod_hrs,'
      '       hrs.setuphrs,'
      '       wc.eqno,'
      '       wo.origin'
      '  from day_hrs hrs,'
      '       day_pts pts,'
      '       day_use use,'
      '       workorder wo,'
      '       standard s,'
      '       cntr_sched sched,'
      '       work_center wc,'
      '       partno,'
      '       arinvt a,'
      '       params'
      ' where use.arinvt_id = :arinvt_id'
      '   and Trunc(hrs.prod_date) between :prod_date1 and :prod_date2'
      '   and pts.day_hrs_id = hrs.id'
      '   and use.day_pts_id = pts.id'
      '   and hrs.workorder_id = wo.id'
      ''
      
        '   and nvl( hrs.sndop_id, 0) = nvl((select sndop_id from sndop_d' +
        'ispatch where id = sched.sndop_dispatch_id),0)'
      '   '
      '   and s.id = wo.standard_id'
      '   and sched.workorder_id = wo.id'
      '   and wc.id = sched.work_center_id'
      '   and partno.id = pts.partno_id'
      '   and a.id = partno.arinvt_id'
      '   and wc.parent_id is null'
      '   and ( NVL(params.fr_hide, '#39'N'#39') = '#39'N'#39
      '         or'
      
        '         NVL(params.fr_hide, '#39'N'#39') = '#39'Y'#39' and NVL(wo.origin, '#39'*'#39') ' +
        '<> '#39'FORECAST'#39')'
      '             '
      ' ')
    Left = 96
    Top = 96
    ParamData = <
      item
        Name = 'ARINVT_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end
      item
        Name = 'Prod_Date1'
        DataType = ftDateTime
        ParamType = ptInput
        Size = 8
        Value = Null
      end
      item
        Name = 'Prod_Date2'
        DataType = ftDateTime
        ParamType = ptInput
        Size = 8
        Value = Null
      end>
    object QryMatStagingDtlWORKORDER_ID: TBCDField
      DisplayLabel = 'WO#'
      FieldName = 'WORKORDER_ID'
      Size = 0
    end
    object QryMatStagingDtlPROD_DATE: TDateTimeField
      DisplayLabel = 'Date'
      FieldName = 'PROD_DATE'
    end
    object QryMatStagingDtlFG_ITEMNO: TStringField
      DisplayLabel = 'FG Item#'
      FieldName = 'FG_ITEMNO'
      Size = 50
    end
    object QryMatStagingDtlTOT_MAT_QTY: TFMTBCDField
      DisplayLabel = 'Required'
      FieldName = 'TOT_MAT_QTY'
      DisplayFormat = '#########0.00'
      Size = 6
    end
    object QryMatStagingDtlMFGNO: TStringField
      DisplayLabel = 'Mfg#'
      FieldName = 'MFGNO'
      Size = 50
    end
    object QryMatStagingDtlPROD_HRS: TFMTBCDField
      DisplayLabel = 'Prod Hrs'
      FieldName = 'PROD_HRS'
      Size = 6
    end
    object QryMatStagingDtlSETUPHRS: TFMTBCDField
      DisplayLabel = 'Setup Hrs'
      FieldName = 'SETUPHRS'
      Size = 6
    end
    object QryMatStagingDtlEQNO: TStringField
      DisplayLabel = 'Work Center'
      FieldName = 'EQNO'
      Size = 60
    end
    object QryMatStagingDtlORIGIN: TStringField
      FieldName = 'ORIGIN'
      Size = 10
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 144
    Top = 82
    object File1: TUniMenuItem
      Caption = '&File'
      object Filter1: TUniMenuItem
        Caption = '&Scope ...'
        OnClick = SBFilterClick
      end
      object SetEPlantView1: TUniMenuItem
        Caption = 'Set &EPlant View ...'
        OnClick = sbtnEplantViewClick
      end
      object Recalculate1: TUniMenuItem
        Caption = '&Recalculate'
        Visible = False
        OnClick = Recalculate1Click
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
      object PrinterSetup1: TUniMenuItem
        Caption = 'Printer &Setup'
        OnClick = PrinterSetup1Click
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
  object PkArinvt: TIQWebHpick
    BeforeOpen = PkArinvtBeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select distinct use.arinvt_id,'
      '       a.class,'
      '       a.itemno, '
      '       a.rev,'
      '       a.descrip,'
      '       a.descrip2,      '
      '       a.eplant_id'
      '  from day_use_total use,'
      '       arinvt a'
      ' where a.id = use.arinvt_id'
      '   and trunc(use.prod_date) between :prod_date1 and :prod_date2'
      ''
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 172
    Top = 82
    ParamData = <
      item
        Name = 'prod_date1'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'prod_date2'
        DataType = ftDateTime
        ParamType = ptInput
      end>
    object PkArinvtARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Origin = 'DAY_USE.ARINVT_ID'
      Visible = False
      Size = 0
    end
    object PkArinvtCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Origin = 'ARINVT.CLASS'
      Size = 2
    end
    object PkArinvtITEMNO: TStringField
      DisplayLabel = 'Item#'
      FieldName = 'ITEMNO'
      Origin = 'ARINVT.ITEMNO'
      Size = 50
    end
    object PkArinvtREV: TStringField
      DisplayLabel = 'Rev'
      FieldName = 'REV'
      Origin = 'ARINVT.REV'
      Size = 15
    end
    object PkArinvtDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'ARINVT.DESCRIP'
      Size = 100
    end
    object PkArinvtEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object PkArinvtDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Size = 100
    end
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmMatStaging'
    WebUse = False
    TouchScreen = False
    Left = 200
    Top = 82
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Material Staging'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 196837 $'
    BuildVersion = '176554'
    Left = 228
    Top = 83
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 256
    Top = 82
  end
  object SrcSchdCntrStageDtl: TDataSource
    DataSet = QrySchdCntrStageDtl
    Left = 367
    Top = 82
  end
  object QrySchdCntrStageDtl: TFDQuery
    OnCalcFields = QryMatStagingCalcFields
    MasterSource = SrcSchedCenters
    MasterFields = 'Prod_Date1;Prod_Date2;WORK_CENTER_ID'
    DetailFields = 'Prod_Date1;Prod_Date2;WORK_CENTER_ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select sched.work_center_id,'
      '       use.arinvt_id,'
      '       Sum(use.tot_mat_qty) as qty,'
      '       a.class,'
      '       a.itemno,'
      '       a.rev,'
      '       a.descrip,'
      '       a.descrip2'
      '  from day_use use,'
      '       day_pts pts,'
      '       day_hrs hrs,'
      '       cntr_sched sched,'
      '       arinvt a'
      ' where Trunc(hrs.prod_date) between :prod_date1 and :prod_date2'
      '   and pts.day_hrs_id = hrs.id '
      '   and use.day_pts_id = pts.id'
      '   and sched.workorder_id = hrs.workorder_id'
      '   and sched.work_center_id = :work_center_id '
      '   and use.arinvt_id = a.id'
      ' group by sched.work_center_id,'
      '          a.class,'
      '          a.itemno,'
      '          a.rev,'
      '          a.descrip,'
      '          a.descrip2,'
      '          use.arinvt_id'
      ''
      '')
    Left = 368
    Top = 96
    ParamData = <
      item
        Name = 'Prod_Date1'
        DataType = ftDateTime
        ParamType = ptInput
        Size = 8
        Value = Null
      end
      item
        Name = 'Prod_Date2'
        DataType = ftDateTime
        ParamType = ptInput
        Size = 8
        Value = Null
      end
      item
        Name = 'WORK_CENTER_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QrySchdCntrStageDtlWORK_CENTER_ID: TBCDField
      FieldName = 'WORK_CENTER_ID'
      Size = 0
    end
    object QrySchdCntrStageDtlARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Size = 0
    end
    object QrySchdCntrStageDtlQTY: TFMTBCDField
      DisplayLabel = 'Required'
      FieldName = 'QTY'
      DisplayFormat = '#########0.00'
      Size = 38
    end
    object QrySchdCntrStageDtlCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Size = 2
    end
    object QrySchdCntrStageDtlITEMNO: TStringField
      DisplayLabel = 'Item#'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object QrySchdCntrStageDtlREV: TStringField
      DisplayLabel = 'Rev'
      FieldName = 'REV'
      Size = 15
    end
    object QrySchdCntrStageDtlDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 100
    end
    object QrySchdCntrStageDtlProd_Date2: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'Prod_Date2'
      Calculated = True
    end
    object QrySchdCntrStageDtlProd_Date1: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'Prod_Date1'
      Calculated = True
    end
    object QrySchdCntrStageDtlDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Size = 100
    end
  end
  object SrcSchedCenters: TDataSource
    DataSet = QrySchdCntr
    Left = 332
    Top = 82
  end
  object QrySchdCntr: TFDQuery
    BeforeOpen = AssignEPlantFilter
    OnCalcFields = QryMatStagingCalcFields
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct wc.eqno,'
      '       wc.id as work_center_id,'
      '       wc.eplant_id,'
      
        '       decode( e.id, NULL, '#39' '#39', '#39'['#39' || e.ID || '#39']  '#39' || e.name )' +
        ' as eplant_descrip,'
      '       wc.cntr_desc'
      '  from day_hrs hrs,'
      '       cntr_sched sched,'
      '       work_center wc,'
      '       eplant e'
      'where trunc(hrs.prod_date) between :prod_date1 and :prod_date2'
      '  and hrs.workorder_id = sched.workorder_id'
      '  and wc.id = sched.work_center_id'
      '  and wc.eplant_id = e.id(+)'
      '  and wc.parent_id is null'
      '         '
      ' '
      ' ')
    Left = 333
    Top = 96
    ParamData = <
      item
        Name = 'prod_date1'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'prod_date2'
        DataType = ftDateTime
        ParamType = ptInput
      end>
    object QrySchdCntrWORK_CENTER_ID: TBCDField
      FieldName = 'WORK_CENTER_ID'
      Size = 0
    end
    object QrySchdCntrEQNO: TStringField
      DisplayLabel = 'Work Center'
      FieldName = 'EQNO'
      Size = 60
    end
    object QrySchdCntrProd_Date1: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'Prod_Date1'
      Calculated = True
    end
    object QrySchdCntrProd_Date2: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'Prod_Date2'
      Calculated = True
    end
    object QrySchdCntrEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object QrySchdCntrEPLANT_DESCRIP: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 15
      FieldName = 'EPLANT_DESCRIP'
      Size = 74
    end
    object QrySchdCntrCNTR_DESC: TStringField
      DisplayLabel = 'Work Center Description'
      FieldName = 'CNTR_DESC'
      FixedChar = True
      Size = 250
    end
  end
  object SrcSchdCntrStageDates: TDataSource
    DataSet = QrySchdCntrStageDates
    Left = 404
    Top = 82
  end
  object QrySchdCntrStageDates: TFDQuery
    MasterSource = SrcSchdCntrStageDtl
    MasterFields = 'Prod_Date1;Prod_Date2;ARINVT_ID;WORK_CENTER_ID'
    DetailFields = 'ARINVT_ID;WORK_CENTER_ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select sched.work_center_id,'
      '       use.arinvt_id,'
      '       Trunc(hrs.prod_date) as prod_date,'
      '       use.tot_mat_qty as qty,'
      '       hrs.workorder_id,'
      '       s.mfgno,'
      '       a.itemno'
      '  from day_use use,'
      '       day_pts pts,'
      '       day_hrs hrs,'
      '       cntr_sched sched,'
      '       workorder wo,'
      '       standard s,'
      '       partno,'
      '       arinvt a'
      ' where Trunc(hrs.prod_date) between :prod_date1 and :prod_date2'
      '   and pts.day_hrs_id = hrs.id '
      '   and use.day_pts_id = pts.id'
      '   and use.arinvt_id = :arinvt_id'
      '   and sched.workorder_id = hrs.workorder_id'
      '   and sched.work_center_id = :work_center_id '
      '   and wo.id = hrs.workorder_id'
      '   and s.id = wo.standard_id'
      '   and pts.partno_id = partno.id'
      '   and partno.arinvt_id = a.id'
      '')
    Left = 405
    Top = 96
    ParamData = <
      item
        Name = 'Prod_Date1'
        DataType = ftDateTime
        ParamType = ptInput
        Size = 8
        Value = Null
      end
      item
        Name = 'Prod_Date2'
        DataType = ftDateTime
        ParamType = ptInput
        Size = 8
        Value = Null
      end
      item
        Name = 'ARINVT_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end
      item
        Name = 'WORK_CENTER_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QrySchdCntrStageDatesWORK_CENTER_ID: TBCDField
      FieldName = 'WORK_CENTER_ID'
      Size = 0
    end
    object QrySchdCntrStageDatesARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Size = 0
    end
    object QrySchdCntrStageDatesPROD_DATE: TDateTimeField
      FieldName = 'PROD_DATE'
    end
    object QrySchdCntrStageDatesQTY: TFMTBCDField
      FieldName = 'QTY'
      DisplayFormat = '#########0.00'
      Size = 6
    end
    object QrySchdCntrStageDatesWORKORDER_ID: TBCDField
      FieldName = 'WORKORDER_ID'
      Size = 0
    end
    object QrySchdCntrStageDatesMFGNO: TStringField
      FieldName = 'MFGNO'
      Size = 50
    end
    object QrySchdCntrStageDatesITEMNO: TStringField
      FieldName = 'ITEMNO'
      Size = 50
    end
  end
  object SoftEPlant1: TIQWebSoftEPlant
    EPlant_Include_Nulls = False
    Left = 284
    Top = 82
  end
  object PopupMenu1: TUniPopupMenu
    Left = 452
    Top = 85
    object JumptoInventory1: TUniMenuItem
      Caption = 'Jump to &Inventory'
      OnClick = JumptoInventory1Click
    end
    object JumpToLocationsTransactions1: TUniMenuItem
      Caption = 'Jump To Locations && Transactions'
      OnClick = JumpToLocationsTransactions1Click
    end
  end
  object IQJumpInv: TIQWebJump
    DataField = 'ARINVT_ID'
    DataSource = SrcMatStaging
    JumpTo = jtInventory
    Left = 484
    Top = 85
  end
  object popmWorkCenter: TUniPopupMenu
    Left = 42
    Top = 132
    object ByWorkCenter1: TUniMenuItem
      Caption = 'By Work Center #'
      OnClick = ByWorkCenter1Click
    end
    object ByWorkCenterDescription1: TUniMenuItem
      Caption = 'By Work Center Description'
      OnClick = ByWorkCenterDescription1Click
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'sbtnUpdateSched'
      'sbtnPrintStagingReport'
      'JumpToLocationsTransactions1'
      'JumpToLocationsTransactions2'
      'JumptoInventory1'
      'JumptoInventory2')
    SecurityCode = 'FRMMATSTAGING'
    Left = 516
    Top = 85
  end
  object PopupMenu2: TUniPopupMenu
    Left = 453
    Top = 120
    object JumpToInventory2: TUniMenuItem
      Caption = 'Jump To Inventory'
      OnClick = JumpToInventory2Click
    end
    object JumpToLocationsTransactions2: TUniMenuItem
      Caption = 'Jump To Locations && Transactions'
      OnClick = JumpToLocationsTransactions2Click
    end
  end
  object IQJumpInv2: TIQWebJump
    DataField = 'ARINVT_ID'
    DataSource = SrcSchdCntrStageDtl
    JumpTo = jtInventory
    Left = 486
    Top = 120
  end
end
