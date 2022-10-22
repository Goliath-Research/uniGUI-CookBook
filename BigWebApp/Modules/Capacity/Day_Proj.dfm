object FrmDPartsProj: TFrmDPartsProj
  Left = 100
  Top = 144
  HelpContext = 1129382
  ClientHeight = 406
  ClientWidth = 614
  Caption = 'Daily Parts Projection'
  OnShow = UniFormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 177
    Width = 614
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object pnlMain: TUniPanel
    Left = 0
    Top = 0
    Width = 614
    Height = 177
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object Splitter2: TUniSplitter
      Left = 309
      Top = 0
      Width = 6
      Height = 177
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object pnlItems: TUniPanel
      Left = 1
      Top = 1
      Width = 309
      Height = 175
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Bevel1: TUniPanel
        Left = 1
        Top = 27
        Width = 307
        Height = 3
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        Caption = ''
      end
      object GridItems: TUniDBGrid
        Left = 1
        Top = 30
        Width = 307
        Height = 145
        Hint = ''
        DataSource = SrcItems
        LoadMask.Message = 'Loading data...'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Columns = <
          item
            FieldName = 'ITEMNO'
            Title.Caption = 'Item #'
            Width = 67
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DESCRIP'
            Title.Caption = 'Description'
            Width = 93
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CLASS'
            Title.Caption = 'Class'
            Width = 34
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'REV'
            Title.Caption = 'Revision'
            Width = 48
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'MFGNO'
            Title.Caption = 'MFG #'
            Width = 76
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'EPLANT_DESCRIP'
            Title.Caption = 'EPlant'
            Width = 94
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'BUYER_CODE'
            Title.Caption = 'Buyer Code'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DESCRIP2'
            Title.Caption = 'Ext Description'
            Width = 214
            CheckBoxField.FieldValues = 'true;false'
          end>
      end
      object Panel5: TUniPanel
        Left = 1
        Top = 1
        Width = 307
        Height = 27
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Caption = ''
        object SBSearch: TUniSpeedButton
          Left = 1
          Top = 1
          Width = 25
          Height = 25
          Hint = 'Search'
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
          ParentColor = False
          Color = clWindow
          OnClick = SBSearchClick
        end
        object SBFilter: TUniSpeedButton
          Left = 26
          Top = 1
          Width = 25
          Height = 25
          Hint = 'Filter'
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
            FF00FFFF00FFFF00FFFF00FF5A5857404040202820000800FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF58585840
            4040252525050505FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF606060706870404040000800FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6060606A
            6A6A404040050505FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF605860909090606060302830FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5B5B5B90
            90906060602A2A2AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF505850B0A8B0808080404840FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF555555AB
            ABAB808080464646FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFE0C9B9605850C0C0C0A0A0A0404040CEB3A0FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC8C8C8575757C0
            C0C0A0A0A0404040B2B2B2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFE0CABA505850A0A0A0D0D0D0B0B0B0707070201820CCAE9BFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC9C9C9555555A0A0A0D0
            D0D0B0B0B07070701A1A1AADADADFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFE1CCBC706870C0B8C0E0E8E0E0E0E0C0C0C0909890605860201820CBAB
            96FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCBCBCB6A6A6ABBBBBBE6E6E6E0
            E0E0C0C0C09696965B5B5B1A1A1AA9A9A9FF00FFFF00FFFF00FFFF00FFFF00FF
            E1CDBE707070C0C0C0F0E8F0FFF8FFF0F0F0D0D8D0C0C0C0A098A06058601018
            10C9A791FF00FFFF00FFFF00FFFF00FFCCCCCC707070C0C0C0EBEBEBFAFAFAF0
            F0F0D6D6D6C0C0C09B9B9B5B5B5B161616A5A5A5FF00FFFF00FFFF00FFE1CDC0
            808080D0D0D0F0F0F0FFFFFFFFFFFFFFF8FFE0E8E0D0D8D0C0B8C09090905050
            50201820C8A38CFF00FFFF00FFCCCCCC808080D0D0D0F0F0F0FFFFFFFFFFFFFA
            FAFAE6E6E6D6D6D6BBBBBB9090905050501A1A1AA2A2A2FF00FFFF00FF808080
            D0D0D0F0F0F0FFF8FFFFF8FFF0F8F0F0F0F0E0E8E0D0D0D0C0C0C0A098A06068
            60505850101810FF00FFFF00FF808080D0D0D0F0F0F0FAFAFAFAFAFAF6F6F6F0
            F0F0E6E6E6D0D0D0C0C0C09B9B9B656565555555161616FF00FFFF00FFB0B8B0
            C0C8C0D0D0D0D0D0D0C0C0C0C0B8C0B0B0B0A0A8A0A0A0A0A098A09090907078
            70606060504850FF00FFFF00FFB6B6B6C6C6C6D0D0D0D0D0D0C0C0C0BBBBBBB0
            B0B0A6A6A6A0A0A09B9B9B9090907575756060604A4A4AFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Caption = ''
          ParentColor = False
          Color = clWindow
          OnClick = SBFilterClick
        end
        object sbtnEplantView: TUniSpeedButton
          Left = 51
          Top = 1
          Width = 25
          Height = 25
          Hint = 'Set EPlant View'
          ShowHint = True
          ParentShowHint = False
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
        object DBNavigator1: TUniDBNavigator
          Left = 207
          Top = 1
          Width = 100
          Height = 25
          Hint = ''
          DataSource = SrcItems
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
    end
    object Panel4: TUniPanel
      Left = 315
      Top = 1
      Width = 299
      Height = 175
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = 'Panel4'
      object GridDay: TUniDBGrid
        Left = 1
        Top = 47
        Width = 297
        Height = 128
        Hint = ''
        DataSource = SrcDays
        LoadMask.Message = 'Loading data...'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Columns = <
          item
            FieldName = 'DayOfWeek'
            Title.Caption = 'Day'
            Width = 31
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PROD_DATE'
            Title.Caption = 'Date'
            Width = 67
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'QTY'
            Title.Caption = 'Projected'
            Width = 107
            CheckBoxField.FieldValues = 'true;false'
          end>
      end
      object Panel1: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 297
        Height = 47
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Caption = ''
        object Panel3: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 295
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
            Width = 95
            Height = 13
            Hint = ''
            Caption = 'Daily Projections'
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
          Top = 20
          Width = 295
          Height = 27
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object DBNavigator2: TUniDBNavigator
            Left = 195
            Top = 1
            Width = 100
            Height = 25
            Hint = ''
            DataSource = SrcDays
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
          end
        end
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 180
    Width = 614
    Height = 226
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = 'Panel2'
    object GridProj: TUniDBGrid
      Left = 1
      Top = 47
      Width = 612
      Height = 160
      Hint = ''
      DataSource = SrcProj
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Columns = <
        item
          FieldName = 'EQNO'
          Title.Caption = 'Work Center #'
          Width = 95
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'WORKORDER_ID'
          Title.Caption = 'Work Order #'
          Width = 93
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ORDERNO'
          Title.Caption = 'Sales Order #'
          Width = 89
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'COMPANY'
          Title.Caption = 'Customer'
          Width = 128
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PONO'
          Title.Caption = 'PO #'
          Width = 71
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'REL_DATE'
          Title.Caption = 'Delivery Date'
          Width = 87
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'REL_QUAN'
          Title.Caption = 'Delivery Quantity'
          Width = 91
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CNTR_DESC'
          Title.Caption = 'Work Center Description'
          Width = 184
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
    object StatusBar1: TUniStatusBar
      Left = 1
      Top = 207
      Width = 612
      Height = 19
      Hint = ''
      Panels = <
        item
          Width = 300
        end
        item
          Width = 300
        end>
      SizeGrip = False
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      ParentColor = False
      Color = clWindow
    end
    object Panel8: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 612
      Height = 47
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
      object Panel9: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 610
        Height = 20
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 0
        Caption = ''
        Color = clBtnShadow
        object Label1: TUniLabel
          Left = 1
          Top = 1
          Width = 100
          Height = 13
          Hint = ''
          Caption = 'Projection Source'
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
      object Panel10: TUniPanel
        Tag = 1999
        Left = 1
        Top = 20
        Width = 610
        Height = 27
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object DBNavigator3: TUniDBNavigator
          Left = 510
          Top = 1
          Width = 100
          Height = 25
          Hint = ''
          DataSource = SrcProj
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 497
    Top = 89
    object File1: TUniMenuItem
      Caption = '&File'
      object Recalculate1: TUniMenuItem
        Caption = '&Recalculate'
        Visible = False
        OnClick = Recalculate1Click
      end
      object N2: TUniMenuItem
        Caption = '-'
        Visible = False
      end
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Options1: TUniMenuItem
      Caption = '&Options'
      object Filter1: TUniMenuItem
        Caption = '&Filter'
        OnClick = SBFilterClick
      end
      object SetEPlantView1: TUniMenuItem
        Caption = 'Set &EPlant View'
        OnClick = sbtnEplantViewClick
      end
    end
    object Reports1: TUniMenuItem
      Caption = '&Reports'
      object Print1: TUniMenuItem
        Caption = '&Print'
        OnClick = Print1Click
      end
      object PrintSetup1: TUniMenuItem
        Caption = 'Printer &Setup'
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
    ModuleName = 'Daily Parts Projection'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 191574 $'
    BuildVersion = '176554'
    Left = 413
    Top = 89
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmDPartsProj'
    WebUse = False
    TouchScreen = False
    Left = 441
    Top = 89
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 469
    Top = 89
  end
  object SrcItems: TDataSource
    DataSet = QryItems
    Left = 41
    Top = 65
  end
  object QryItems: TFDQuery
    BeforeOpen = AssignEPlantFilter
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select a.id as arinvt_id, '
      '       a.itemno as itemno, '
      '       a.descrip as descrip,'
      '       a.descrip2 as descrip2,'
      '       a.class as class, '
      '       a.rev as rev,'
      '       p.id as partno_id,'
      '       s.mfgno as mfgno,'
      '       s.id as standard_id,'
      '       a.eplant_id,'
      
        '       decode( e.id, NULL, '#39' '#39', '#39'['#39' || e.ID || '#39']  '#39' || e.name )' +
        ' as eplant_descrip,'
      '       a.buyer_code_id as buyer_code_id,'
      '       b.buyer_code as buyer_code'
      '  from arinvt a,           '
      '       partno p,'
      '       standard s,'
      '       arcusto c1,'
      '       eplant e,'
      '       buyer_code b'
      ' where p.standard_id = s.id'
      '   and p.arinvt_id = a.id'
      '   and s.arcusto_id = c1.id(+)'
      '   and a.eplant_id = e.id(+)'
      '   and a.buyer_code_id = b.id(+)'
      'order by a.itemno       '
      ''
      ' '
      ' '
      ' ')
    Left = 42
    Top = 80
    object QryItemsARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Size = 0
    end
    object QryItemsITEMNO: TStringField
      FieldName = 'ITEMNO'
      Size = 50
    end
    object QryItemsDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 100
    end
    object QryItemsCLASS: TStringField
      FieldName = 'CLASS'
      Size = 2
    end
    object QryItemsREV: TStringField
      FieldName = 'REV'
      Size = 15
    end
    object QryItemsPARTNO_ID: TBCDField
      FieldName = 'PARTNO_ID'
      Size = 0
    end
    object QryItemsMFGNO: TStringField
      FieldName = 'MFGNO'
      Size = 50
    end
    object QryItemsSTANDARD_ID: TBCDField
      FieldName = 'STANDARD_ID'
      Size = 0
    end
    object QryItemsEPLANT_DESCRIP: TStringField
      DisplayWidth = 15
      FieldName = 'EPLANT_DESCRIP'
      Size = 74
    end
    object QryItemsEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object QryItemsBUYER_CODE_ID: TBCDField
      FieldName = 'BUYER_CODE_ID'
      Size = 0
    end
    object QryItemsBUYER_CODE: TStringField
      FieldName = 'BUYER_CODE'
      Size = 10
    end
    object QryItemsDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Size = 100
    end
  end
  object SrcDays: TDataSource
    DataSet = QryDays
    Left = 349
    Top = 89
  end
  object QryDays: TFDQuery
    OnCalcFields = QryDaysCalcFields
    MasterSource = SrcItems
    MasterFields = 'PARTNO_ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select p.qty,'
      '       d.prod_date,'
      '       d.workorder_id,'
      '       p.partno_id'
      '  from day_pts p,'
      '       day_hrs d'
      ' where d.id = p.day_hrs_id'
      '   and p.partno_id = :PARTNO_ID'
      '  order by'
      '       d.prod_date'
      '  '
      '')
    Left = 348
    Top = 121
    ParamData = <
      item
        Name = 'PARTNO_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryDaysQTY: TFMTBCDField
      FieldName = 'QTY'
      DisplayFormat = '#########0.00'
      Size = 6
    end
    object QryDaysPROD_DATE: TDateTimeField
      FieldName = 'PROD_DATE'
      DisplayFormat = 'c'
    end
    object QryDaysDayOfWeek: TStringField
      FieldKind = fkCalculated
      FieldName = 'DayOfWeek'
      Calculated = True
    end
    object QryDaysWORKORDER_ID: TBCDField
      FieldName = 'WORKORDER_ID'
      Size = 0
    end
    object QryDaysPARTNO_ID: TBCDField
      FieldName = 'PARTNO_ID'
      Size = 0
    end
  end
  object SrcProj: TDataSource
    DataSet = QryProj
    Left = 144
    Top = 239
  end
  object QryProj: TFDQuery
    MasterSource = SrcDays
    MasterFields = 'PARTNO_ID;WORKORDER_ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select v.workorder_id,'
      '       v.partno_id,'
      '       t.id as ptorder_id,'
      '       r.rel_quan,'
      '       r.rel_date,'
      '       r.orderno,'
      '       r.pono,'
      '       c.custno,'
      '       c.company,'
      '       o.eqno,'
      '       o.cntr_desc'
      '  from v_workorder_partno v, '
      '       ptorder t,'
      '       ptorder_rel r,'
      '       arcusto c,'
      '       cntr_sched s,'
      '       work_center o'
      ' where t.workorder_id(+) = v.workorder_id'
      '   and t.partno_id(+) = v.partno_id'
      '   and r.ptorder_id(+) = t.id'
      '   and v.arcusto_id = c.id'
      '   and s.workorder_id(+) = v.workorder_id'
      '   and s.work_center_id = o.id(+)'
      '   and v.partno_id = :PARTNO_ID '
      '   and v.workorder_id = :WORKORDER_ID '
      '   and o.parent_id is null'
      '         '
      '       ')
    Left = 144
    Top = 272
    ParamData = <
      item
        Name = 'PARTNO_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end
      item
        Name = 'WORKORDER_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryProjWORKORDER_ID: TBCDField
      FieldName = 'WORKORDER_ID'
      Size = 0
    end
    object QryProjCUSTNO: TStringField
      FieldName = 'CUSTNO'
      Size = 10
    end
    object QryProjCOMPANY: TStringField
      FieldName = 'COMPANY'
      Size = 60
    end
    object QryProjORDERNO: TStringField
      DisplayWidth = 10
      FieldName = 'ORDERNO'
      Size = 15
    end
    object QryProjPONO: TStringField
      FieldName = 'PONO'
      Size = 35
    end
    object QryProjREL_DATE: TDateTimeField
      FieldName = 'REL_DATE'
      DisplayFormat = 'c'
    end
    object QryProjREL_QUAN: TBCDField
      FieldName = 'REL_QUAN'
      DisplayFormat = '#########0.00'
      Size = 2
    end
    object QryProjEQNO: TStringField
      FieldName = 'EQNO'
      Size = 60
    end
    object QryProjCNTR_DESC: TStringField
      DisplayLabel = 'Work Center Description'
      DisplayWidth = 30
      FieldName = 'CNTR_DESC'
      FixedChar = True
      Size = 250
    end
  end
  object PkArinvt: TIQWebHpick
    BeforeOpen = AssignEPlantFilter
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.id as arinvt_id, '
      '       a.itemno as itemno, '
      '       a.descrip as descrip,'
      '       a.descrip2 as descrip2,'
      '       a.class as class, '
      '       a.rev as rev,'
      '       p.id as partno_id,'
      '       s.mfgno as mfgno,'
      '       a.eplant_id'
      '  from arinvt a,'
      '       partno p,'
      '       standard s'
      ' where p.standard_id = s.id'
      '   and p.arinvt_id = a.id'
      ''
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 89
    Top = 65
    object PkArinvtARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object PkArinvtITEMNO: TStringField
      DisplayLabel = 'Item#'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object PkArinvtDESCRIP: TStringField
      DisplayLabel = 'Descrip'
      FieldName = 'DESCRIP'
      Size = 100
    end
    object PkArinvtCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Size = 2
    end
    object PkArinvtREV: TStringField
      DisplayLabel = 'Rev.'
      FieldName = 'REV'
      Size = 15
    end
    object PkArinvtPARTNO_ID: TBCDField
      FieldName = 'PARTNO_ID'
      Visible = False
      Size = 0
    end
    object PkArinvtMFGNO: TStringField
      DisplayLabel = 'Config#'
      FieldName = 'MFGNO'
      Size = 50
    end
    object PkArinvtEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'ARINVT.EPLANT_ID'
      Size = 0
    end
    object PkArinvtDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Origin = 'IQ.ARINVT.DESCRIP2'
      Size = 100
    end
  end
  object SoftEPlant1: TIQWebSoftEPlant
    EPlant_Include_Nulls = False
    Left = 124
    Top = 66
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FRMDPARTSPROJ')
    SecurityCode = 'FRMDPARTSPROJ'
    Left = 528
    Top = 88
  end
end
