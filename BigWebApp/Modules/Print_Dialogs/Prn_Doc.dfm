object FrmPrintDocsCustom: TFrmPrintDocsCustom
  Left = 317
  Top = 199
  ClientHeight = 368
  ClientWidth = 429
  Caption = 'Print'
  OnShow = FormShow
  Constraints.MinHeight = 224
  Constraints.MinWidth = 326
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 330
    Width = 429
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Visible = False
    Align = alBottom
    ParentColor = False
    Color = clBtnFace
  end
  object PageControl1: TUniPageControl
    Left = 0
    Top = 0
    Width = 429
    Height = 330
    Hint = ''
    ActivePage = tabDestination
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object tabSelectionCriteria: TUniTabSheet
      Hint = ''
      Caption = 'Selection Criteria'
      object pnlCriteriaBottom: TUniPanel
        Left = 0
        Top = 229
        Width = 421
        Height = 73
        Hint = ''
        Align = alBottom
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        DesignSize = (
          421
          73)
        object lblPrinting: TUniLabel
          Left = 14
          Top = 1
          Width = 81
          Height = 13
          Hint = ''
          Caption = 'Printing Progress'
          TabOrder = 2
        end
        object edStatus: TUniEdit
          Left = 14
          Top = 17
          Width = 397
          Height = 19
          Hint = ''
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Color = clBtnFace
          ReadOnly = True
        end
      end
      object pnlCriteriaTop: TUniPanel
        Left = 0
        Top = 0
        Width = 421
        Height = 229
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object Label1: TUniLabel
          Left = 14
          Top = 15
          Width = 24
          Height = 13
          Hint = ''
          Caption = 'From'
          TabOrder = 4
        end
        object wwcombFrom: TUniDBLookupComboBox
          Left = 51
          Top = 11
          Width = 123
          Height = 21
          Hint = ''
          ListSource = dsQryLookup
          ListFieldIndex = 0
          TabOrder = 0
          Color = clWindow
          OnDropDown = CheckLookupQueryOpen
        end
        object pnlCriteriaRight: TUniPanel
          Left = 259
          Top = 1
          Width = 161
          Height = 227
          Hint = ''
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object Label2: TUniLabel
            Left = 8
            Top = 15
            Width = 12
            Height = 13
            Hint = ''
            Caption = 'To'
            TabOrder = 2
          end
          object wwcombTo: TUniDBLookupComboBox
            Left = 32
            Top = 11
            Width = 123
            Height = 21
            Hint = ''
            ListSource = dsQryLookup
            ListFieldIndex = 0
            TabOrder = 0
            Color = clWindow
            OnDropDown = CheckLookupQueryOpen
          end
        end
        object chkExcludeAttachedDocs: TUniCheckBox
          Left = 14
          Top = 50
          Width = 171
          Height = 17
          Hint = ''
          Caption = 'Exclude attached documents'
          TabOrder = 2
        end
      end
    end
    object tabDestination: TUniTabSheet
      Hint = ''
      ImageIndex = 1
      Caption = 'Destination'
      object PnlDestinationPCCarrier: TUniPanel
        Left = 0
        Top = 27
        Width = 421
        Height = 275
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object pgctrDestination: TUniPageControl
          Left = 1
          Top = 1
          Width = 419
          Height = 273
          Hint = ''
          ActivePage = tabFax
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          OnChange = pgctrDestinationChange
          object tabPrinter: TUniTabSheet
            Hint = ''
            Caption = 'Printer'
            object Label3: TUniLabel
              Left = 8
              Top = 8
              Width = 82
              Height = 13
              Hint = ''
              Caption = 'Output to printer'
              TabOrder = 0
            end
          end
          object tabScreen: TUniTabSheet
            Hint = ''
            ImageIndex = 1
            Caption = 'Screen'
            object Label4: TUniLabel
              Left = 8
              Top = 8
              Width = 82
              Height = 13
              Hint = ''
              Caption = 'Output to screen'
              TabOrder = 0
            end
          end
          object tabFile: TUniTabSheet
            Hint = ''
            ImageIndex = 2
            Caption = 'File'
            object Splitter2: TUniSplitter
              Left = 81
              Top = 0
              Width = 6
              Height = 245
              Hint = ''
              Align = alLeft
              ParentColor = False
              Color = clBtnFace
            end
            object pnlFileRight: TUniPanel
              Left = 387
              Top = 0
              Width = 24
              Height = 245
              Hint = ''
              Align = alRight
              Anchors = [akTop, akRight, akBottom]
              TabOrder = 0
              Caption = ''
              object btnSaveFile: TUniSpeedButton
                Left = 1
                Top = 29
                Width = 22
                Height = 22
                Hint = 'Browse'
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
                Font.Color = clBlack
                Font.Height = -12
                Font.Style = [fsBold]
                ParentColor = False
                Color = clWindow
                OnClick = btnSaveFileClick
              end
            end
            object pnlFileClient: TUniPanel
              Left = 87
              Top = 0
              Width = 300
              Height = 245
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              DesignSize = (
                300
                245)
              object edSaveFile: TUniEdit
                Left = 0
                Top = 29
                Width = 302
                Height = 21
                Hint = ''
                ShowHint = True
                ParentShowHint = False
                Text = ''
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
              end
              object cboxFileType: TUniComboBox
                Left = 0
                Top = 2
                Width = 302
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
                  'Excel')
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
                OnCloseUp = cboxFileTypeCloseUp
              end
            end
            object PnlDestFileLeft01: TUniPanel
              Left = 0
              Top = 0
              Width = 81
              Height = 245
              Hint = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 2
              Caption = ''
              object Label6: TUniLabel
                Left = 3
                Top = 6
                Width = 43
                Height = 13
                Hint = ''
                Caption = 'File Type'
                TabOrder = 1
              end
              object Label5: TUniLabel
                Left = 3
                Top = 32
                Width = 46
                Height = 13
                Hint = ''
                Caption = 'File Name'
                TabOrder = 2
              end
            end
          end
          object tabEmail: TUniTabSheet
            Hint = ''
            ImageIndex = 3
            Caption = 'Email'
            object Splitter3: TUniSplitter
              Left = 129
              Top = 0
              Width = 6
              Height = 245
              Hint = ''
              Align = alLeft
              ParentColor = False
              Color = clBtnFace
            end
            object pnlEmailRight: TUniPanel
              Left = 387
              Top = 0
              Width = 24
              Height = 245
              Hint = ''
              Align = alRight
              Anchors = [akTop, akRight, akBottom]
              TabOrder = 0
              Caption = ''
              DesignSize = (
                24
                245)
              object sbtnAssignEmail: TUniSpeedButton
                Left = 2
                Top = 3
                Width = 20
                Height = 20
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
                ParentColor = False
                Color = clWindow
                OnClick = sbtnAssignEmailClick
              end
              object sbtnBoilerPlates: TUniSpeedButton
                Left = 2
                Top = 50
                Width = 20
                Height = 20
                Hint = 'Boiler plates, user signature ...'
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  36060000424D3606000000000000360400002800000020000000100000000100
                  08000000000000020000C21E0000C21E00000001000000000000504030006048
                  3000203040003048600030506000305070005058500060585000645A5F006562
                  5F00505860005068700060686000706860007A776B007C79760080787000877E
                  7500867E7700808070008F857C008F8C7C00AC917900407090004078C000FF00
                  FF007090A0006090B0007098B0003080D0004098E00040A0E00050B0F00060C8
                  FF0080808000908983009C9189009A938D009090900097999000AF9C8B00AE9B
                  8C00B0989000B0A09000B3A09100B1A19400B1A29600B1A39800B0A0A000B0A8
                  A000B0B0A000D0988000C0A09000C0A89000D0A09000D0A89000C0A8A000C0B0
                  A000CBBAA900D0B0A000C0B8B000E0B8A000E0B8B000D0C0B000D0C0B300D6C4
                  B300DFCCBE00E0C0B000F0D0B000C0C0C000D0C8C000E0C8C000EEDACB00EEDB
                  CD00F0D0C000F0D8C000F0D8D000F0E0D000F0E0E000F0E8E000FFE8E000F0F0
                  E000FFF0E000F0F0F000FFF0F000FFF8F000FFF8FF00FFFFFF00000000000000
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
                  0000000000000000000000000000000000000000000000000000191919191919
                  1919191919191919191919191919191919191919191919191919191919191919
                  192D022819191919191919191919191919300227191919191919191919191919
                  2E0418032919191919191919191919193006230627191919191919191919192F
                  051D1E200B19191919191919191919300626314509191919191919421209080A
                  171F211A2C19191919191946220908070F314622301919191919400F313F3B10
                  061B1C24191919191919450F3145320F06272222191919191919233C52504B44
                  10000E16010101010101233C534F46460F000F22060606060606144F5554504C
                  3B07433E3B3B37363301224F55534F4932064545323231302706154F57555450
                  430C4F4F4D4C4C4A3301234F5755534F45094F4F4E4949462706254557575552
                  2B0D3F302B2A2A4C3701264557575553270945302727274931064927454F4F32
                  224F55544F4F4D4C3D014E27454F4F32224F55534F4F4E493C06194811261310
                  45463830382B2B4E470119492226220F454631303127274E4606191941575757
                  575757565554514F4C01191945575757575757565553534F490619193A573838
                  38383838383838534E0119193C57313131313131313131534E06191939575757
                  575757575756555453011919325757575757575757565553530619193B3B3939
                  3939393838383535342B19193232323232323231313131313027}
                Caption = ''
                ParentColor = False
                Color = clWindow
                OnClick = sbtnBoilerPlatesClick
              end
              object sbtnOtherAttachments: TUniSpeedButton
                Left = 2
                Top = 225
                Width = 20
                Height = 20
                Hint = 'Assign attachments ...'
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  F6000000424DF600000000000000760000002800000010000000100000000100
                  0400000000008000000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                  DDDDDDDDDDDDDDDDDDDDDDDD0000000000DDDDDD0FFFFFFFF0DDDDDD0FFFFFFF
                  F0DDDDDD0FF80FFFF0DDDDDD0F800FFFF0DDDDDD080B0FFFF0DDDDDD00B0FFFF
                  F0DDDDDD0B0FFFFFF0DDDDD0B0FFFFFFF0DDDD0B0FFFFFFFF0DDD0B07FFFFFFF
                  F0DDD90D0000000000DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
                Caption = ''
                Anchors = [akLeft, akBottom]
                ParentColor = False
                Color = clWindow
                OnClick = sbtnOtherAttachmentsClick
              end
            end
            object pnlEMailClient: TUniPanel
              Left = 135
              Top = 0
              Width = 252
              Height = 245
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              DesignSize = (
                252
                245)
              object edEmailTo: TUniEdit
                Left = 0
                Top = 2
                Width = 255
                Height = 21
                Hint = ''
                Text = ''
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
              end
              object edSubject: TUniEdit
                Left = 0
                Top = 27
                Width = 255
                Height = 21
                Hint = ''
                Text = ''
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
              end
              object memoEmail: TUniMemo
                Left = 0
                Top = 52
                Width = 255
                Height = 120
                Hint = ''
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 2
              end
              object cboxEMailFileType: TUniComboBox
                Left = 0
                Top = 176
                Width = 255
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
                  'Excel')
                Anchors = [akLeft, akRight, akBottom]
                TabOrder = 6
              end
              object EdAttachmentName: TUniEdit
                Left = 0
                Top = 200
                Width = 255
                Height = 21
                Hint = ''
                Text = ''
                Anchors = [akLeft, akRight, akBottom]
                TabOrder = 4
              end
              object edOtherAttachments: TUniEdit
                Left = 0
                Top = 224
                Width = 255
                Height = 21
                Hint = ''
                Text = ''
                Anchors = [akLeft, akRight, akBottom]
                TabOrder = 5
                ReadOnly = True
              end
            end
            object PnlDestEMailLeft01: TUniPanel
              Left = 0
              Top = 0
              Width = 129
              Height = 245
              Hint = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 2
              Caption = ''
              DesignSize = (
                129
                245)
              object Label7: TUniLabel
                Left = 0
                Top = 6
                Width = 12
                Height = 13
                Hint = ''
                Caption = 'To'
                TabOrder = 1
              end
              object Label8: TUniLabel
                Left = 0
                Top = 31
                Width = 36
                Height = 13
                Hint = ''
                Caption = 'Subject'
                TabOrder = 2
              end
              object Label9: TUniLabel
                Left = 3
                Top = 180
                Width = 56
                Height = 13
                Hint = ''
                Caption = 'Attachment'
                Anchors = [akLeft, akBottom]
                TabOrder = 3
              end
              object Label11: TUniLabel
                Left = 2
                Top = 204
                Width = 86
                Height = 13
                Hint = ''
                Caption = 'Attachment Name'
                Anchors = [akLeft, akBottom]
                TabOrder = 4
              end
              object lblOtherAttachments: TUniLabel
                Left = 2
                Top = 228
                Width = 92
                Height = 13
                Hint = ''
                Caption = 'Other Attachments'
                Anchors = [akLeft, akBottom]
                TabOrder = 5
              end
            end
          end
          object tabFax: TUniTabSheet
            Hint = ''
            ImageIndex = 4
            Caption = 'Fax'
            object pnlFaxRight: TUniPanel
              Left = 387
              Top = 0
              Width = 24
              Height = 245
              Hint = ''
              Align = alRight
              Anchors = [akTop, akRight, akBottom]
              TabOrder = 0
              Caption = ''
              object sbtnFax: TUniSpeedButton
                Left = 1
                Top = 1
                Width = 23
                Height = 22
                Hint = 'Add Fax information'
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  36060000424D3606000000000000360000002800000020000000100000000100
                  18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFC1C1C1FF00FF164E010963000963001750
                  01FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1
                  C1C1FF00FF424242545454545454444444FF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFAFACAA92847D695F5C595E52045E0000D81D00D70000D70400DA
                  391C5D05FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFACACAC8484845F5F5F5B
                  5B5B4F4F4FBABABABABABABABABABDBDBD4F4F4FFF00FFFF00FFCBCBCBA19F9F
                  827873948177D2B4A4FFE9DBF1D5C504600100DC5700D820FFFFFFFAFAFA00DA
                  3600DC671C5D05FF00FFCBCBCB9F9F9F787878818181B3B3B3E8E8E8D4D4D451
                  5151C1C1C1BBBBBBFFFFFFFAFAFABDBDBDC3C3C34F4F4FFF00FF72717192796C
                  F9EEE8FFF9F4FFFDF8FFFFFC1C5D0531DF8800DC5E00DA39FFFFFFFAFAFA00DA
                  4800DD6B43E4971C5A01717171797979EEEEEEF9F9F9FDFDFDFFFFFF4F4F4FC9
                  C9C9C2C2C2BDBDBDFFFFFFFAFAFABEBEBEC4C4C4CFCFCF4D4D4DBEBEBE676563
                  9E8A7EF8F3F1FFFFFFFFFFFF1C5D0523DD80FEFEFEFAFAFAFFFFFFFAFAFAFAFA
                  FAFFFFFF18DD791C5D05BEBEBE656565898989F3F3F3FFFFFFFFFFFF4F4F4FC6
                  C6C6FEFEFEFAFAFAFFFFFFFAFAFAFAFAFAFFFFFFC6C6C64F4F4F4C4C4C737373
                  5D58536B5A5487827F6A615C1C5D0500DD6BFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFF00DD6E1C5D054C4C4C7373735757575A5A5A8282826161614F4F4FC4
                  C4C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4C4C44F4F4F9D9D9D767676
                  BEACA3AD9B90DCC1B2FCE6DC1C5D0500DC6200DD6E4FDF95FFFFFFFFFFFF5BDF
                  9B18DD791DE2821C5D059D9D9D767676ACACAC9A9A9AC0C0C0E6E6E64F4F4FC2
                  C2C2C4C4C4CBCBCBFFFFFFFFFFFFCCCCCCC6C6C6CACACA4F4F4FFF00FFB4B3B1
                  6F6056AA947FFFF7F0F3E7E0D5D5D51C5D0512DD7779E0AAFFFFFFFFFFFF70E0
                  A623DD801C5D05B7AAA1FF00FFB3B3B35F5F5F929292F6F6F6E7E7E7D5D5D54F
                  4F4FC5C5C5D1D1D1FFFFFFFFFFFFD0D0D0C6C6C64F4F4FA9A9A9FF00FFAD9F90
                  34302E5C5148DBCEC2F5F0ED9494947070701C5D0500DD6775E0A859E09900DF
                  691C5D05EFD8C7D0CCCAFF00FF9D9D9D303030505050CDCDCDF0F0F094949470
                  70704F4F4FC3C3C3D0D0D0CDCDCDC5C5C54F4F4FD7D7D7CCCCCCFF00FFC5BFBA
                  3B3530332D29877767FBF7F58B8B8C4646484E4E4E1C5D051C5D051C5D051C5D
                  05666363A48F7FFF00FFFF00FFBFBFBF3434342C2C2C757575F7F7F78B8B8B46
                  46464E4E4E4F4F4F4F4F4F4F4F4F4F4F4F6363638E8E8EFF00FFFF00FFFF00FF
                  A4948546423F574E46766459CEC4BB7E7A777B797770706F5252514C4C4C4C4C
                  4C4C4C4C725B50FF00FFFF00FFFF00FF9292924141414D4D4D636363C3C3C37A
                  7A7A7979797070705252524C4C4C4C4C4C4C4C4C5A5A5AFF00FFFF00FFFF00FF
                  FF00FFA8988A6A625D6C615D9B8A7A9278695757575757575757575757575757
                  575757575E5046CAC9C8FF00FFFF00FFFF00FF96969662626261616188888877
                  77775757575757575757575757575757575757574F4F4FC9C9C9FF00FFFF00FF
                  FF00FFFF00FFC7C3C0C0B8B0CCCBCBB8ABA2665C56666666685E58967D6E665B
                  54666666665953C6C1BEFF00FFFF00FFFF00FFFF00FFC3C3C3B7B7B7CBCBCBAA
                  AAAA5C5C5C6666665E5E5E7C7C7C5A5A5A666666595959C1C1C1FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFC6C2BF705C5273737370645ECBCAC97161
                  5873737370615AC8C6C4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC2
                  C2C25B5B5B737373646464CACACA606060737373606060C6C6C6FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFCBCAC9745E537F7F7F7B716CC6C1BE7D66
                  5A7F6C5FA18A7CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCA
                  CACA5D5D5D7F7F7F717171C1C1C16565656B6B6B898989FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA48B7A9274628D705ECAC9C8C8C5
                  C4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FF8A8A8A7373736F6F6FC9C9C9C5C5C5FF00FFFF00FFFF00FF}
                Caption = ''
                ParentColor = False
                Color = clWindow
                OnClick = sbtnFaxClick
              end
              object sbtnFaxSetup: TUniSpeedButton
                Left = 1
                Top = 24
                Width = 23
                Height = 22
                Hint = 'Set up fax polling parameters'
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  36060000424D3606000000000000360000002800000020000000100000000100
                  18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8986864D27254F24226C5E
                  5ECACACAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FF8686862A2A2A2828285F5F5FCACACAFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FF9292926159594A42426428007E36024423
                  236C6A6A837E7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF92
                  92925A5A5A4242422B2B2B3939392626266A6A6A7F7F7FFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFB5B5B55C37256F2C0C66280F793B05793D046F3D
                  1461250B561A00A5A5A5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB5B5B537
                  37373030302C2C2C3C3C3C3D3D3D3D3D3D292929202020A5A5A5FF00FFC9CACB
                  2669AA3089C54882B76485AE4A495675380E9B6B38834D1A61554D685F5B7236
                  18976730915D255A413AFF00FFCACACA7878789595958D8D8D8D8D8D4C4C4C3A
                  3A3A6868684B4B4B5454545F5F5F3838386363635A5A5A424242FF00FFB2BBC6
                  1C6BA933C1F632C3F82EBFF8238EBF243542A6733A483F43708DB295A5BB6F64
                  61A877436A483B7B7776FF00FFBDBDBD787878C9C9C9CBCBCBC8C8C896969637
                  37376F6F6F404040949494A9A9A9646464737373494949777777FF00FF9BAABF
                  1A7EB9329FD53CD1FB3BCFFA2B7790665342CAA580605A5932A3D2309ACF3448
                  52C59A716F534A8E8D8CFF00FFAEAEAE8A8A8AA8A8A8D5D5D5D4D4D47A7A7A51
                  5151A2A2A25A5A5AAAAAAAA3A3A34949499696965353538D8D8DFF00FF7E98B6
                  1C83BF2A7EB64ADCFD49DCFD308293BD956EF2D3B6CEAB8B604C46534B4BCFB0
                  8CE7CEB6CDA784685B57FF00FF9E9E9E8F8F8F898989DEDEDEDEDEDE82828291
                  9191D0D0D0A8A8A84D4D4D4B4B4BACACACCBCBCBA4A4A45B5B5BFF00FF6A8CB1
                  1E84BE2872A951D4F356E4FF52DFFA495D5D615747817E69FFE8CEF5DDBF927D
                  69B68A75867159BCBCBCFF00FF9393938F8F8F7E7E7ED6D6D6E4E4E4DFDFDF5C
                  5C5C5555557A7A7AE5E5E5D9D9D97B7B7B8A8A8A6E6E6EBCBCBCFF00FF5980AA
                  218FCB308FC14BAED466EAFF61E9FF5BDFF44DC0D33E5748FAE1C3DBBFAA2D58
                  64337B9077818FFF00FFFF00FF8888889B9B9B989898B3B3B3E9E9E9E8E8E8DE
                  DEDEBFBFBF525252DDDDDDBDBDBD5959597D7D7D838383FF00FFFF00FF4A7BAA
                  2BAAE041C1ED46ACDA4DAAD555B0D758B4D869D5ED58A7B2546E7253545D4EA2
                  B163EAFF6993BCFF00FFFF00FF848484B2B2B2C6C6C6B3B3B3B0B0B0B5B5B5B8
                  B8B8D6D6D6A5A5A56D6D6D565656A1A1A1E9E9E99A9A9AFF00FFB9BDC42277B4
                  3CBFED51D2F55DDBF964E0FD6CE6FD67CDE959A9CD5295C18BE3F477D4ED8EF4
                  FF85F3FF64B2D5C0C4C9BFBFBF848484C5C5C5D5D5D5DCDCDCE1E1E1E5E5E5CF
                  CFCFAEAEAE9C9C9CE2E2E2D5D5D5F1F1F1F1F1F1B6B6B6C5C5C58390A82E99D3
                  4DD0F65EDCFA66E2FD6FE7FF76ECFF7DEEFF85EEFF8AE8FA76ADD096DAEEAFF9
                  FFA5F9FF99F0FC8499B7959595A4A4A4D4D4D4DDDDDDE2E2E2E7E7E7EBEBEBED
                  EDEDEDEDEDE7E7E7B2B2B2DBDBDBF6F6F6F6F6F6EEEEEE9F9F9F6173973FBDED
                  59D9FA63E0FD69E5FD71E9FF79ECFF81EDFF89EDFF91EDFF84D0EC537EAF708E
                  B56B90B872A5CA6786B17A7A7AC4C4C4DBDBDBE1E1E1E5E5E5E8E8E8EBEBEBEC
                  ECECECECECEDEDEDD3D3D3888888969696989898ABABAB8F8F8F768DAE44A3D2
                  55C6EB5FDCF967E7FF6FEAFF78EAFF81EAFF88EAFF8DEAFC94EAFC6E8CB2FF00
                  FFFF00FFCBCBCCBDC2C9939393AAAAAACACACADDDDDDE7E7E7E9E9E9EAEAEAEA
                  EAEAEAEAEAE9E9E9EAEAEA939393FF00FFFF00FFCBCBCBC4C4C4FF00FFBBC1C8
                  A0AEC08799B5748DAF6887AF6086B05C88B45A8DBA5D94C05D97C38FA0B8FF00
                  FFFF00FFFF00FFFF00FFFF00FFC3C3C3B1B1B19E9E9E9494948F8F8F8E8E8E80
                  80809595959C9C9C9F9F9FA4A4A4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                Caption = ''
                ParentColor = False
                Color = clWindow
                OnClick = sbtnFaxSetupClick
              end
            end
            object pnlFaxClient: TUniPanel
              Left = 0
              Top = 0
              Width = 387
              Height = 245
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              object bvTopBuffer: TUniPanel
                Left = 1
                Top = 1
                Width = 385
                Height = 3
                Hint = ''
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
                Caption = ''
              end
              object bvLeftBuffer: TUniPanel
                Left = 1
                Top = 4
                Width = 3
                Height = 236
                Hint = ''
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                TabOrder = 3
                Caption = ''
              end
              object bvRightBuffer: TUniPanel
                Left = 382
                Top = 4
                Width = 4
                Height = 236
                Hint = ''
                Align = alRight
                Anchors = [akTop, akRight, akBottom]
                TabOrder = 4
                Caption = ''
              end
              object bvBottomBuffer: TUniPanel
                Left = 1
                Top = 240
                Width = 385
                Height = 4
                Hint = ''
                Align = alBottom
                Anchors = [akLeft, akRight, akBottom]
                TabOrder = 5
                Caption = ''
              end
              object lviewFaxRecipients: TListView
                Left = 4
                Top = 4
                Width = 378
                Height = 236
                Align = alClient
                Columns = <
                  item
                    Caption = 'To'
                    Width = 80
                  end
                  item
                    Caption = 'Organization'
                    Width = 95
                  end
                  item
                    Caption = 'Fax #'
                    Width = 118
                  end>
                FlatScrollBars = True
                ReadOnly = True
                RowSelect = True
                TabOrder = 0
                ViewStyle = vsReport
              end
            end
          end
        end
      end
      object Panel1: TUniPanel
        Tag = 1999
        Left = 0
        Top = 0
        Width = 421
        Height = 27
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Caption = ''
        object TabControl1: TUniTabControl
          Left = 1
          Top = 1
          Width = 419
          Height = 25
          Hint = ''
          TabIndex = 0
          Tabs.Strings = (
            'Printer'
            'Screen'
            'File'
            'Email'
            'Fax')
          OnChange = TabControl1Change
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
    end
  end
  object pnlButtons: TUniPanel
    Left = 0
    Top = 333
    Width = 429
    Height = 35
    Hint = ''
    Constraints.MinHeight = 33
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object pnlButtonsRight: TUniPanel
      Left = 114
      Top = 1
      Width = 314
      Height = 33
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 107
        Top = 5
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 211
        Top = 5
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Close'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
        OnClick = btnCancelClick
      end
      object BtnProp: TUniButton
        Left = 3
        Top = 5
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Properties'
        TabOrder = 3
        OnClick = BtnPropClick
      end
    end
  end
  object wwQryLookup: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    Left = 5
    Top = 141
  end
  object QryMain: TFDQuery
    Tag = 1
    AfterScroll = QryMainAfterScroll
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    Left = 37
    Top = 201
  end
  object SrcMain: TDataSource
    DataSet = QryMain
    Left = 37
    Top = 173
  end
  object QryDocs: TFDQuery
    Tag = 1
    MasterSource = SrcMain
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    Left = 5
    Top = 201
  end
  object SrcDocs: TDataSource
    DataSet = QryDocs
    Left = 5
    Top = 173
  end
  object QryDocsExt: TFDQuery
    Tag = 1
    MasterSource = SrcMain
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    Left = 37
    Top = 141
  end
  object SaveDialog1: TSaveDialog
    Filter = 
      'Rich Text Format|*.RTF|Ascii Text |*.TXT|Adobe Acrobat PDF|*.PDF' +
      '|Any File|*.*'
    Left = 326
    Top = 155
  end
  object popmEmail: TUniPopupMenu
    OnPopup = popmEmailPopup
    Left = 263
    Top = 156
    object AddFromPickList1: TUniMenuItem
      Caption = 'Add from Pick List'
      OnClick = AddFromPickList1Click
    end
    object AddfromVendors1: TUniMenuItem
      Caption = 'Add from Vendors'
      Visible = False
      OnClick = AddfromVendors1Click
    end
    object AddfromCustomers1: TUniMenuItem
      Caption = 'Add from Customers'
      Visible = False
      OnClick = AddfromVendors1Click
    end
    object AddfromEmployees1: TUniMenuItem
      Caption = 'Add from Employees'
      Visible = False
      OnClick = AddfromVendors1Click
    end
    object N2: TUniMenuItem
      Caption = '-'
    end
    object AddFromThisCustomer1: TUniMenuItem
      Caption = 'Add from This Customer'
      OnClick = AddFromThisVendor1Click
    end
    object AddFromThisVendor1: TUniMenuItem
      Caption = 'Add from This Vendor'
      OnClick = AddFromThisVendor1Click
    end
    object AddFromThisEmployee1: TUniMenuItem
      Caption = 'Add from This Employee'
      OnClick = AddFromThisVendor1Click
    end
  end
  object PkEmailVendor: TIQWebHpick
    Tag = 1
    BeforeOpen = PkEmailBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select c.last_name       as last_name,'
      '       c.first_name      as first_name,'
      '       c.email           as email,'
      '       c.title           as title,'
      '       c.phone_number    as contact_phone_number,'
      '       v.vendorno        as vendorno    ,'
      '       v.company         as company     ,'
      '       v.attn            as attn        ,'
      '       v.addr1           as addr1       ,'
      '       v.addr2           as addr2       ,'
      '       v.city            as city        ,'
      '       v.state           as state       ,'
      '       v.country         as country     ,'
      '       v.zip             as zip         ,'
      '       v.phone_number    as phone_number'
      '  from vendor v, vendor_contact c'
      ' where v.id = c.vendor_id(+)'
      '   and (:pk_hide = '#39'N'#39' and nvl(v.pk_hide, '#39'N'#39') <> '#39'Y'#39
      '        or'
      '        :pk_hide = '#39'Y'#39' and nvl(v.pk_hide, '#39'N'#39') = '#39'Y'#39')'
      '   and (:this_vendor_id = 0'
      '        or                   '
      '        :this_vendor_id > 0 and v.id = :this_vendor_id)'
      '    '
      '        '
      ''
      ' '
      ' ')
    OnIQAfterHPickCreate = PkEmailIQAfterHPickCreate
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 203
    Top = 147
    ParamData = <
      item
        Name = 'pk_hide'
        DataType = ftString
      end
      item
        Name = 'this_vendor_id'
        DataType = ftBCD
      end>
    object PkEmailVendorVENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      FieldName = 'VENDORNO'
      Origin = 'v.vendorno'
      Size = 10
    end
    object PkEmailVendorCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 20
      FieldName = 'COMPANY'
      Origin = 'v.company'
      Size = 60
    end
    object PkEmailVendorLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 20
      FieldName = 'LAST_NAME'
      Origin = 'c.last_name'
      Size = 30
    end
    object PkEmailVendorFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 20
      FieldName = 'FIRST_NAME'
      Origin = 'c.first_name'
      Size = 30
    end
    object PkEmailVendorEMAIL: TStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Origin = 'c.email'
      Size = 250
    end
    object PkEmailVendorCONTACT_PHONE_NUMBER: TStringField
      DisplayLabel = 'Contact Phone #'
      DisplayWidth = 20
      FieldName = 'CONTACT_PHONE_NUMBER'
      Origin = 'c.phone_number'
      Size = 25
    end
    object PkEmailVendorADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 20
      FieldName = 'ADDR1'
      Origin = 'v.addr1'
      Size = 60
    end
    object PkEmailVendorADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 20
      FieldName = 'ADDR2'
      Origin = 'v.addr2'
      Size = 60
    end
    object PkEmailVendorCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 20
      FieldName = 'CITY'
      Origin = 'v.city'
      Size = 30
    end
    object PkEmailVendorSTATE: TStringField
      DisplayLabel = 'State or Region'
      FieldName = 'STATE'
      Origin = 'v.state'
    end
    object PkEmailVendorCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 15
      FieldName = 'COUNTRY'
      Origin = 'v.country'
      Size = 100
    end
    object PkEmailVendorZIP: TStringField
      DisplayLabel = 'Postal Code'
      FieldName = 'ZIP'
      Origin = 'v.zip'
      Size = 10
    end
    object PkEmailVendorPHONE_NUMBER: TStringField
      DisplayLabel = 'Company Telephone #'
      DisplayWidth = 20
      FieldName = 'PHONE_NUMBER'
      Origin = 'phone_number'
      Size = 25
    end
    object PkEmailVendorTITLE: TStringField
      DisplayLabel = 'Title'
      FieldName = 'TITLE'
      Origin = 'c.title'
      FixedChar = True
      Size = 60
    end
  end
  object PkEMailCustomer: TIQWebHpick
    Tag = 1
    BeforeOpen = PkEmailBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.custno       as custno       ,'
      '       a.company      as company      ,'
      '       a.addr1        as addr1        ,'
      '       a.addr2        as addr2        ,'
      '       a.city         as city         ,'
      '       a.state        as state        ,'
      '       a.country      as country      ,'
      '       a.zip          as zip          ,'
      '       a.phone_number as phone_number ,'
      '       c.last_name    as last_name    ,'
      '       c.first_name   as first_name   ,'
      '       c.title        as title        ,'
      '       c.phone_number as contact_phone_number,'
      '       c.email        as email'
      '  from arcusto a,'
      '       contact c'
      ' where a.id = c.arcusto_id(+)'
      '   and (:pk_hide = '#39'N'#39' and nvl(a.pk_hide, '#39'N'#39') <> '#39'Y'#39
      '        or'
      '        :pk_hide = '#39'Y'#39' and nvl(a.pk_hide, '#39'N'#39') = '#39'Y'#39')'
      '   and (:this_arcusto_id = 0'
      '        or                   '
      '        :this_arcusto_id > 0 and a.id = :this_arcusto_id)    '
      ' ')
    OnIQAfterHPickCreate = PkEmailIQAfterHPickCreate
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 233
    Top = 147
    ParamData = <
      item
        Name = 'pk_hide'
        DataType = ftString
      end
      item
        Name = 'this_arcusto_id'
        DataType = ftBCD
      end>
    object PkEMailCustomerCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      FieldName = 'CUSTNO'
      Origin = 'a.custno'
      Size = 10
    end
    object PkEMailCustomerCOMPANY: TStringField
      DisplayLabel = 'Company Name'
      DisplayWidth = 20
      FieldName = 'COMPANY'
      Origin = 'a.company'
      Size = 60
    end
    object PkEMailCustomerLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 20
      FieldName = 'LAST_NAME'
      Origin = 'c.last_name'
      Size = 30
    end
    object PkEMailCustomerFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 20
      FieldName = 'FIRST_NAME'
      Origin = 'c.first_name'
      Size = 30
    end
    object PkEMailCustomerEMAIL: TStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Origin = 'c.email'
      Size = 250
    end
    object PkEMailCustomerCONTACT_PHONE_NUMBER: TStringField
      DisplayLabel = 'Contact Phone #'
      DisplayWidth = 20
      FieldName = 'CONTACT_PHONE_NUMBER'
      Origin = 'c.phone_number'
      Size = 25
    end
    object PkEMailCustomerADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 20
      FieldName = 'ADDR1'
      Origin = 'a.addr1'
      Size = 60
    end
    object PkEMailCustomerADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 20
      FieldName = 'ADDR2'
      Origin = 'a.addr2'
      Size = 60
    end
    object PkEMailCustomerCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 20
      FieldName = 'CITY'
      Origin = 'a.city'
      Size = 30
    end
    object PkEMailCustomerSTATE: TStringField
      DisplayLabel = 'State or Region'
      FieldName = 'STATE'
      Origin = 'a.state'
    end
    object PkEMailCustomerCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 20
      FieldName = 'COUNTRY'
      Origin = 'a.country'
      Size = 100
    end
    object PkEMailCustomerZIP: TStringField
      DisplayLabel = 'Postal Code'
      FieldName = 'ZIP'
      Origin = 'a.zip'
      Size = 10
    end
    object PkEMailCustomerPHONE_NUMBER: TStringField
      DisplayLabel = 'Company Phone #'
      DisplayWidth = 20
      FieldName = 'PHONE_NUMBER'
      Origin = 'a.phone_number'
      Size = 25
    end
    object PkEMailCustomerTITLE: TStringField
      DisplayLabel = 'Title'
      FieldName = 'TITLE'
      Origin = 'c.title'
      FixedChar = True
      Size = 60
    end
  end
  object PkEmployee: TIQWebHpick
    BeforeOpen = PkEmailBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select NVL(e.first_name, u.user_name) as first_name,'
      '       e.last_name,'
      '       u.email '
      '  from s_user_general u, pr_emp e'
      ' where u.pr_emp_id = e.id(+)'
      '   and (:pk_hide = '#39'N'#39' and nvl(e.pk_hide, '#39'N'#39') <> '#39'Y'#39
      '        or'
      '        :pk_hide = '#39'Y'#39' and nvl(e.pk_hide, '#39'N'#39') = '#39'Y'#39')'
      '   and (:this_employee_id = 0'
      '        or                   '
      '        :this_employee_id > 0 and e.id = :this_employee_id)'
      '    '
      '')
    OnIQAfterHPickCreate = PkEmailIQAfterHPickCreate
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 173
    Top = 147
    ParamData = <
      item
        Name = 'pk_hide'
        DataType = ftString
      end
      item
        Name = 'this_employee_id'
        DataType = ftBCD
      end>
    object PkEmployeeFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      FieldName = 'FIRST_NAME'
      Origin = 'NVL(e.first_name, u.user_name)'
      Size = 35
    end
    object PkEmployeeLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      FieldName = 'LAST_NAME'
      Origin = 'e.last_name'
      Size = 30
    end
    object PkEmployeeEMAIL: TStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Origin = 'u.email'
      Size = 250
    end
  end
  object ImageList1: TUniImageList
    Left = 368
    Top = 163
    Bitmap = {
      494C0101050009001C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C1C1C1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AFACAA0092847D00695F5C00605E5C009292920000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBCBCB00A19F9F00827873009481
      7700D2B4A400FFE9DB00F1D5C500A08678006A64620081818100AFAAA900BEBA
      B700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007271710092796C00F9EEE800FFF9
      F400FFFDF800FFFFFC00FFFFFC00FFFBF400A78F7E004D484600655C56006154
      4D00B7B1AD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BEBEBE00676563009E8A7E00F8F3
      F100FFFFFF00FFFFFF00FBFAFA00BDBCBC00878787004B3E3900E9D4CA00A890
      7F0076655E00B2A9A30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004C4C4C00737373005D5853006B5A
      540087827F006A615C00786C6300A28E8600C7B3A400F0D7C700FCDFCF00F9D5
      BC00C7A794007A6A620090868000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009D9D9D0076767600BEACA300AD9B
      9000DCC1B200FCE6DC00CFC1BA009BB3C600BEC5CB00D3B8A900C3A29100CBA7
      9200FFE6D100DAB9A20063585000B6AFA9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B4B3B1006F605600AA94
      7F00FFF7F000F3E7E000D5D5D5009494940064646400B8A9A200C9A59400AE92
      8300D9BDAE00F9D4BC00D7B59F00B7AAA1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD9F900034302E005C51
      4800DBCEC200F5F0ED0094949400707070005454540062626100B8A79F00DDC2
      B600DCCAC000FFF6EE00EFD8C700D0CCCA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C5BFBA003B353000332D
      290087776700FBF7F5008B8B8C00464648004E4E4E004F4F500078777800B2B0
      AF009794920066636300A48F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A49485004642
      3F00574E460076645900CEC4BB007E7A77007B79770070706F00525251004C4C
      4C004C4C4C004C4C4C00725B5000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A898
      8A006A625D006C615D009B8A7A00927869005757570057575700575757005757
      570057575700575757005E504600CAC9C8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C7C3C000C0B8B000CCCBCB00B8ABA200665C560066666600685E5800967D
      6E00665B54006666660066595300C6C1BE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C2BF00705C52007373730070645E00CBCA
      C900716158007373730070615A00C8C6C4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CBCAC900745E53007F7F7F007B716C00C6C1
      BE007D665A007F6C5F00A18A7C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A48B7A00927462008D705E00CAC9
      C800C8C5C4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CCCBCB00CDC5BE00C4BBAF00C2B9AD00C6C1
      B800CAC9C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CEA48300BB875D00BD987200BF9A7600B68B
      6300A87B4D00A57A4A00AB875B00B7A180000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000993300009933
      0000993300009933000099330000993300009933000099330000993300009933
      0000993300000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6AFA600B87E
      6300C38F6E00C7A28900CEAA8F00E7997700E3B79B00F9F5F000F4EDE700EEE3
      DA00E8DACD00E0CDBB00D8BDA300B0885A000000000060483000604830006048
      3000604830006048300060483000604830006048300060483000604830006048
      300060483000604830000000000000000000000000000000000080808000E3D8
      CF00E5D9CE00E9DACD00ECDAC300EFDBC200F2DBC200F4DBC100F7D9C000FBDB
      BF009933000000000000000000000000000000000000C39D8900AE785C00C49D
      8000C8A38600C8A58900CAA68D00C9AA9500CAAE9D00CBB6AA00CBBFB800CCCA
      C9000000000000000000000000000000000000000000CCCBCB00B87C5C00C186
      6000E2925200D5834900D8926C00EDA88800EFD8C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFDFD00CBAD8A00CFA27E00C0A8A000FFF0F000FFF0E000FFF0
      E000FFE8E000FFE8E000FFE8E000FFE8E000FFE8D000FFE0D000FFE0D000FFE0
      D000FFE0D000FFE0D0006048300000000000000000000000000080808000F6F3
      ED00C8C8C800BABABA00B1B1B100ADADAD00A8A8A800A4A4A400A0A0A000F7D9
      C0009933000000000000000000000000000000000000C6A99A00BE9B7C00D2B3
      9E00EAD6C700DDCCB400DAC4AC00D9C2A700D8C1A500D6BFA300D5BA9C00D1B3
      9400D0B09500CEAF9500CFA890000000000000000000C4A89A00CB865400C8AD
      A600FFFDFD00C1A08E00C58E6900E6C1A300FDF9F400FDFDFA00FFFFFF00FFFF
      FF00FFFDFD00CFB29100D5967100D2BAA500C0A8A000FFF0F000D0988000E0A0
      8000F0A08000F0A07000F0987000E0906000E0886000E0805000E0804000E078
      4000E0805000FFE0D0006048300000000000000000000000000080808000F6F4
      F000F6F3ED00F7F1E900F7EFE500F8ECE000F8EADC00F9E8D600FAE5D100F4D8
      C1009933000000000000000000000000000000000000C8AB9B00CCB39500CFB3
      9600E1C6B500F3EAE300EEE1D600EDDED100ECDDCF00ECDCCD00E9DBCB00E9DA
      C800E9D9C900E7D6C400CAA283000000000000000000C18D7100E6B38700CBAF
      A300FFF6ED00AB705800AF6E3D009D6C4000AF7B4C00C8905D00D59F7200EDBB
      9400CBA37A00C89B7500D08D6000CCC6C100C0B0A000FFF8F000C0907000FFC0
      A000F0B09000F0A88000F0A07000F0987000E0906000E0806000D0785000D070
      5000E0704000FFE0D0006048300000000000000000000000000080808000F5F6
      F300C8C8C800BABABA00B1B1B100ADADAD00A8A8A800A4A4A400A0A0A000F2D6
      C2009933000000000000000000000000000000000000C9AC9B00E2CDBB00E3D1
      C000DFC9B400DFC3B100F4F0E700F5EEE500F5EDE300F5EDE400F5EDE600F6EF
      E700E7D2C100CDAF8D00C6A782000000000000000000C7947700EAD3BE00D3B1
      9F00FDECD500C8705500DA683C00E6774500D2744700BA6D4400A6633B009056
      2B00B1683B00F9F0E800DBAC8D00CCC1B900C0B0A000FFF8F000C0907000FFC8
      B000FFE8E000FFE8D000FFE0D000FFE0D000FFD8D000FFD8C000FFD0C000D078
      5000E0704000FFE0D0006048300000000000000000000000000080808000F5F7
      F600F5F6F300F6F4F000F6F3ED00F7F1E900F7EFE500F8ECE000F8EADC00EFD4
      C2009933000000000000000000000000000000000000CCAD9D00EBDCCE00EFE2
      D500EEE0D600EAD9CC00DCBEAC00F8F0EB00E2CAB600E0C7B200F7F0EC00E0C8
      B400DAC4A700D3BB9A00CBAB8E000000000000000000CB9F8400E0D3CF00EAC1
      9D00FDE0C100DA624000F4693C00FA724400FA704300FA6C3C00FA6E3F00F771
      4200E7744F00FBEDDD00D8A38000CCC6C100C0B0A000FFF8F000C0907000FFD0
      B000FFC8A000FFC0A000FFB09000F0A88000F0A08000F0987000E0906000E080
      6000E0704000FFE0D0006048300000000000000000000000000080808000F4F8
      F800C8C8C800BABABA00B1B1B100ADADAD00A8A8A800A4A4A400A0A0A000ECDA
      C3009933000000000000000000000000000000000000CCAE9D00F2E7DD00F4EB
      E300F5EDE400F4EAE000F0E4D900D0A38800D3AF8C00CEA98400D3B39700E6D6
      BF00E2D0B800DBC7AA00CEAD95000000000000000000CAAB9D00DAB6A300FFCB
      9200E0AA8E00C8593700E07B5600E78B6A00E78A6700E3774F00DF643700D55D
      3200E09B8100FDDBBA00D19A750000000000C0B0A000FFF8F000C0907000FFD0
      C000FFF0E000FFE8E000FFE8E000FFE8D000FFE0D000FFE0D000FFD8D000E090
      6000E0704000FFE8D0006048300000000000000000000000000080808000F3F9
      FA00F4F8F800F5F7F600F5F6F300F6F4F000F6F3ED00F7F1E900F7EFE500E9DA
      C3009933000000000000000000000000000000000000CFB1A200F6EDE600F8EF
      EA00F9F1ED00F6EFE800DFBDA600E2C6A900E6D2BE00E0CAB100D1B08D00DFC8
      B400EADBC600E1D2B900CCAE9C000000000000000000C6AA9E00D7A07900E8B1
      7F00C4765500C4785400BE775400BC7A5600B8795500B7744E00B1623B00A760
      4400F7D0A800F0BC8B00CBAC980000000000C0B0A000FFF8F000C0907000FFD8
      C000FFD0C000FFC8B000FFC8A000FFC0A000FFB89000F0A88000F0A07000F098
      7000E0704000FFE8E0006048300000000000000000000000000080808000F2FA
      FC00C8C8C800BABABA00B1B1B100ADADAD00A8A8A800A4A4A400A0A0A000E5D9
      CE009933000000000000000000000000000000000000D3B6A700F9F2ED00FBF5
      F100FBF6F300E4C8B400E8CFB400EDDDCD00EFE3D800EEE0D200DFC9AC00D3B3
      9100EEE4D500E9DBC800CBAE9E00000000000000000000000000CCC7C300CCAF
      9A00B97B5800BC715100C2745400C4735400BF6E5100B6634800AA604100F0C4
      9600E7AC7700CBAA94000000000000000000D0B0A000FFFFFF00C0907000FFE0
      D000FFF0F000FFF0E000FFF0E000FFC0A000FFC0A000FFB89000FFB09000F0A0
      7000E0784000FFE8E0006048300000000000000000000000000080808000F2FA
      FD00F2FAFC00F3F9FA00F4F8F800F5F7F600F5F6F300F6F4F000F6F3ED00E3D8
      CF009933000000000000000000000000000000000000D5BAAB00FDF8F300FAF5
      F100E9D0BF00EAD3BC00F3E6D800F5ECE300F5EDE400F5EDE400F1E6D800E2CA
      AE00DABFA300F1E8DA00CAB4A700000000000000000000000000000000000000
      0000CB987700E38C6F00D39E7D00CA8B6700CF835F00CEA58100CEB49E00C9A9
      9300CCC1BA00000000000000000000000000D0B0A000FFFFFF00C0907000FFE0
      D000FFD8D000FFD8C000FFD0B000FFC8B000FFC0A000FFC0A000FFB89000FFB0
      8000E0784000FFE8E0006048300000000000000000000000000080808000F1FB
      FE00C8C8C800BABABA00B1B1B100ADADAD00F5F7F60099330000993300009933
      00009933000000000000000000000000000000000000D5B6A600FAF3EF00E5C6
      B100F4E3D100F7F0E800FAF4EF00FAF4ED00FAF3ED00FAF3EC00FAF2EB00FAED
      E500F0D7C000DEC3B000CABFB900000000000000000000000000000000000000
      0000AE765600A3694E00B67D5B00B46A4C00CB835E00CDCAC700000000000000
      000000000000000000000000000000000000D0B8A000FFFFFF00D0A08000D090
      8000C0907000D0887000D0886000C0806000C0785000C0704000C0684000C068
      4000D0784000FFE8E0006048300000000000000000000000000080808000F0FB
      FE00F1FBFE00F2FAFD00F2FAFC00F3F9FA00F4F8F800CC660000C8C8C8009933
      00000000000000000000000000000000000000000000D5B5A500E7C1AE00FDE8
      D500FDF2EA00FDF3EB00FDF2EA00FDF0E900FDEFE500FDEBDB00EFD0C000E1BF
      AB00D6B09B00CBA69400CCCBCA00000000000000000000000000000000000000
      0000CFB19700B9886200B17C5800AB714C00CDAC900000000000000000000000
      000000000000000000000000000000000000D0B8A000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF8F000FFF8F000FFF8F000FFF8F000FFF8F000FFF0F000FFF0
      F000FFF0E000FFF0E0006048300000000000000000000000000080808000F0FB
      FF00F0FBFE00F1FBFE00F2FAFD00F2FAFC00F3F9FA00CC660000993300000000
      00000000000000000000000000000000000000000000BA866A00DDAF9800DCB7
      A200D3B19C00D1B0A000CBAB9A00C7ACA000CCBAB000C8B9B200CBC4C1000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D0B8A000D0B8A000D0B0
      A000D0B0A000C0B0A000C0B0A000C0B0A000C0B0A000C0B0A000C0A8A000C0A8
      A000C0A8A000C0A8A00000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800099330000000000000000
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
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FEFF000000000000F07F000000000000
      000F000000000000000700000000000000030000000000000001000000000000
      0000000000000000800000000000000080000000000000008001000000000000
      C001000000000000E000000000000000F000000000000000FE00000000000000
      FE01000000000000FF07000000000000FE07FFFFFFFFFFFFFE00FFFFC007FFFF
      C0008003C007800F80000001C007800180000001C007800180000001C0078001
      80000001C007800180000001C007800180010001C007800180010001C0078001
      C0030001C0078001F0070001C0078001F03F0001C00F8001F07F0001C01F801F
      FFFF8003C03FFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object SoftEPlant1: TIQWebSoftEPlant
    EPlant_Include_Nulls = False
    Left = 125
    Top = 181
  end
  object popmBoilerPlate: TUniPopupMenu
    Left = 292
    Top = 157
    object LoadfromBoilerPlate1: TUniMenuItem
      Caption = 'Load From Boiler Plate'
      OnClick = LoadfromBoilerPlate1Click
    end
    object N1: TUniMenuItem
      Caption = '-'
    end
    object ViewEditBoilerPlates1: TUniMenuItem
      Caption = 'View/Edit Boiler Plates'
      OnClick = ViewEditBoilerPlates1Click
    end
    object UserSignature1: TUniMenuItem
      Caption = 'User Signature ...'
      OnClick = UserSignature1Click
    end
  end
  object PkBoiler: TIQWebHpick
    BeforeOpen = PkBoilerBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select ID, '
      '       descrip '
      '  from boiler_plate'
      'where type = :type'
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 173
    Top = 219
    ParamData = <
      item
        Name = 'type'
        DataType = ftString
      end>
    object PkBoilerID: TBCDField
      DisplayLabel = 'Boiler Plate #'
      FieldName = 'ID'
      Origin = 'BOILER_PLATE.ID'
      Size = 0
    end
    object PkBoilerDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'BOILER_PLATE.DESCRIP'
      Size = 50
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'BtnProp'
      'cbAutoEmail'
      'cbPrintOnly')
    SecurityCode = 'FRMPRINTDOCSCUSTOM'
    Left = 64
    Top = 115
  end
  object ImageList2: TUniImageList
    Width = 32
    Left = 368
    Top = 200
    Bitmap = {
      494C0101010005001C0020001000FF00FF00FF10FFFFFFFFFFFFFFFF424D3600
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
  object dsQryLookup: TDataSource
    DataSet = wwQryLookup
    Left = 208
    Top = 192
  end
end
