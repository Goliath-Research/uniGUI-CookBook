object LocationsTable: TLocationsTable
  Left = 138
  Top = 162
  HelpContext = 1327783
  ClientHeight = 536
  ClientWidth = 740
  Caption = 'Master Locations'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  KeyPreview = True
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  ActiveControl = Panel1
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 28
    Width = 740
    Height = 4
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Caption = ''
  end
  object Splitter9: TUniSplitter
    Left = 0
    Top = 216
    Width = 740
    Height = 4
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 740
    Height = 28
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object spSearch: TUniSpeedButton
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
      OnClick = spSearchClick
    end
    object sbtnToggle: TUniSpeedButton
      Left = 25
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Form - Table Toggle'
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
      OnClick = sbtnToggleClick
    end
    object sbtnTransPlan: TUniSpeedButton
      Left = 49
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Trans Plans'
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
      ParentColor = False
      Color = clWindow
      OnClick = sbtnTransPlanClick
    end
    object DBNavigator: TUniDBNavigator
      Left = 514
      Top = 1
      Width = 225
      Height = 26
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = SrcLocations
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object pnlHeader: TUniPanel
    Left = 0
    Top = 32
    Width = 740
    Height = 184
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object pgctrlMain: TUniPageControl
      Left = 1
      Top = 1
      Width = 738
      Height = 182
      Hint = ''
      ActivePage = TabForm
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabForm: TUniTabSheet
        Hint = ''
        Caption = 'TabForm'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        object PnlFormView: TUniPanel
          Tag = 1999
          Left = 0
          Top = 0
          Width = 730
          Height = 154
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object sbFormView: TUniScrollBox
            Tag = 1999
            Left = 1
            Top = 1
            Width = 728
            Height = 152
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 732
            ExplicitHeight = 156
            ScrollHeight = 176
            object PnlFormViewInner: TUniPanel
              Tag = 1999
              Left = 0
              Top = 0
              Width = 709
              Height = 176
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              Caption = ''
              object Splitter4: TUniSplitter
                Left = 252
                Top = 1
                Width = 4
                Height = 174
                Hint = ''
                Align = alLeft
                ParentColor = False
                Color = clBtnFace
              end
              object Splitter5: TUniSplitter
                Left = 530
                Top = 1
                Width = 4
                Height = 174
                Hint = ''
                Align = alLeft
                ParentColor = False
                Color = clBtnFace
              end
              object PnlFormViewClient01: TUniPanel
                Tag = 1999
                Left = 1
                Top = 1
                Width = 251
                Height = 174
                Hint = ''
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                TabOrder = 0
                Caption = ''
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitHeight = 176
                object Splitter6: TUniSplitter
                  Left = 86
                  Top = 1
                  Width = 4
                  Height = 172
                  Hint = ''
                  Align = alLeft
                  ParentColor = False
                  Color = clBtnFace
                end
                object PnlFormViewLeft01: TUniPanel
                  Left = 1
                  Top = 1
                  Width = 85
                  Height = 172
                  Hint = ''
                  Align = alLeft
                  Anchors = [akLeft, akTop, akBottom]
                  TabOrder = 0
                  Caption = ''
                  object Label1: TUniLabel
                    Left = 8
                    Top = 84
                    Width = 36
                    Height = 13
                    Hint = ''
                    Caption = 'Building'
                    TabOrder = 1
                  end
                  object Label2: TUniLabel
                    Left = 8
                    Top = 12
                    Width = 40
                    Height = 13
                    Hint = ''
                    Caption = 'Location'
                    TabOrder = 2
                  end
                  object Label3: TUniLabel
                    Left = 8
                    Top = 36
                    Width = 53
                    Height = 13
                    Hint = ''
                    Caption = 'Description'
                    TabOrder = 3
                  end
                  object Label4: TUniLabel
                    Left = 8
                    Top = 60
                    Width = 30
                    Height = 13
                    Hint = ''
                    Caption = 'EPlant'
                    TabOrder = 4
                  end
                  object lblDivision: TUniLabel
                    Left = 8
                    Top = 108
                    Width = 36
                    Height = 13
                    Hint = ''
                    Caption = 'Division'
                    TabOrder = 5
                  end
                  object Label23: TUniLabel
                    Left = 8
                    Top = 132
                    Width = 31
                    Height = 13
                    Hint = ''
                    Caption = 'Status'
                    TabOrder = 6
                  end
                  object lblReservation: TUniLabel
                    Left = 8
                    Top = 156
                    Width = 58
                    Height = 13
                    Hint = ''
                    Caption = 'Reservation'
                    TabOrder = 7
                  end
                end
                object PnlFormViewClient04: TUniPanel
                  Left = 90
                  Top = 1
                  Width = 160
                  Height = 172
                  Hint = ''
                  Align = alClient
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  TabOrder = 1
                  Caption = ''
                  DesignSize = (
                    160
                    172)
                  object IQUDComboBoxBuilding: TIQWebUDComboBox
                    Left = 0
                    Top = 80
                    Width = 156
                    Height = 21
                    Hint = 'Right click to edit the list'
                    ShowHint = True
                    ParentShowHint = False
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'BUILDING'
                    DataSource = SrcLocations
                    TabOrder = 3
                    KeyTableName = 'LOCATIONS'
                    KeyFieldName = 'BUILDING'
                  end
                  object dbeLocationDescrip: TUniDBEdit
                    Left = 0
                    Top = 32
                    Width = 156
                    Height = 21
                    Hint = ''
                    DataField = 'DESCRIP'
                    DataSource = SrcLocations
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object wwDBComboDlgEplantOnForm: TUniEdit
                    Left = 0
                    Top = 56
                    Width = 156
                    Height = 21
                    Hint = ''
                    Text = ''
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    ReadOnly = True
                  end
                  object dbeLocation: TUniDBEdit
                    Left = 0
                    Top = 8
                    Width = 156
                    Height = 21
                    Hint = ''
                    DataField = 'LOC_DESC'
                    DataSource = SrcLocations
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 0
                  end
                  object wwDBLookupComboDivision: TUniDBLookupComboBox
                    Left = 0
                    Top = 104
                    Width = 156
                    Height = 21
                    Hint = ''
                    ListFieldIndex = 0
                    DataField = 'DIVISION_ID'
                    DataSource = SrcLocations
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 4
                    Color = clWindow
                  end
                  object wwDBComboBoxLocStatus: TUniDBComboBox
                    Left = 0
                    Top = 128
                    Width = 156
                    Height = 21
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'LOC_STATUS'
                    DataSource = SrcLocations
                    Style = csDropDownList
                    Items.Strings = (
                      'E-Empty'#9'E'
                      'P-Picking'#9'P'
                      'S-Storage'#9'S')
                    TabOrder = 5
                  end
                  object dbeReservation: TUniDBEdit
                    Left = 0
                    Top = 152
                    Width = 156
                    Height = 21
                    Hint = ''
                    DataField = 'RESERVATION_SOURCE_DESCRIP'
                    DataSource = SrcLocations
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 6
                  end
                end
              end
              object PnlFormViewClient02: TUniPanel
                Tag = 1999
                Left = 256
                Top = 1
                Width = 274
                Height = 174
                Hint = ''
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                TabOrder = 1
                Caption = ''
                object Splitter7: TUniSplitter
                  Left = 102
                  Top = 1
                  Width = 4
                  Height = 172
                  Hint = ''
                  Align = alLeft
                  ParentColor = False
                  Color = clBtnFace
                end
                object PnlFormViewLeft02: TUniPanel
                  Left = 1
                  Top = 1
                  Width = 101
                  Height = 172
                  Hint = ''
                  Align = alLeft
                  Anchors = [akLeft, akTop, akBottom]
                  TabOrder = 0
                  Caption = ''
                  object lblZone: TUniLabel
                    Left = 8
                    Top = 12
                    Width = 67
                    Height = 13
                    Hint = ''
                    Caption = 'Locating Zone'
                    TabOrder = 1
                  end
                  object Label6: TUniLabel
                    Left = 8
                    Top = 108
                    Width = 43
                    Height = 13
                    Hint = ''
                    Caption = 'Pick Path'
                    TabOrder = 2
                  end
                  object Label12: TUniLabel
                    Left = 8
                    Top = 132
                    Width = 67
                    Height = 13
                    Hint = ''
                    Caption = 'Location Type'
                    TabOrder = 3
                  end
                  object Label20: TUniLabel
                    Left = 8
                    Top = 84
                    Width = 52
                    Height = 13
                    Hint = ''
                    Caption = 'Work Zone'
                    TabOrder = 4
                  end
                  object Label21: TUniLabel
                    Left = 8
                    Top = 36
                    Width = 73
                    Height = 13
                    Hint = ''
                    Caption = 'Allocating Zone'
                    TabOrder = 5
                  end
                  object Label22: TUniLabel
                    Left = 8
                    Top = 60
                    Width = 50
                    Height = 13
                    Hint = ''
                    Caption = 'Drop Zone'
                    TabOrder = 6
                  end
                end
                object PnlFormViewClient05: TUniPanel
                  Left = 106
                  Top = 1
                  Width = 167
                  Height = 172
                  Hint = ''
                  Align = alClient
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  TabOrder = 1
                  Caption = ''
                  DesignSize = (
                    167
                    172)
                  object wwDBComboDlgZoneLO: TUniEdit
                    Left = 0
                    Top = 8
                    Width = 161
                    Height = 21
                    Hint = ''
                    Text = ''
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 0
                    ReadOnly = True
                    OnKeyDown = wwDBComboDlgZoneLOKeyDown
                  end
                  object dbePickPath: TUniDBEdit
                    Left = 0
                    Top = 104
                    Width = 161
                    Height = 21
                    Hint = ''
                    DataField = 'START_ROW'
                    DataSource = SrcLocations
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 4
                  end
                  object wwDBComboDlgLocationTypeDescrip: TUniEdit
                    Left = 0
                    Top = 128
                    Width = 161
                    Height = 21
                    Hint = ''
                    Text = ''
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 5
                    ReadOnly = True
                    OnKeyDown = ClearLocationType
                  end
                  object wwDBComboDlgZoneAL: TUniEdit
                    Left = 0
                    Top = 32
                    Width = 161
                    Height = 21
                    Hint = ''
                    Text = ''
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                    OnKeyDown = wwDBComboDlgZoneLOKeyDown
                  end
                  object wwDBComboDlgZoneDZ: TUniEdit
                    Left = 0
                    Top = 56
                    Width = 161
                    Height = 21
                    Hint = ''
                    Text = ''
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    ReadOnly = True
                    OnKeyDown = wwDBComboDlgZoneLOKeyDown
                  end
                  object wwDBComboDlgZoneWK: TUniEdit
                    Left = 0
                    Top = 80
                    Width = 161
                    Height = 21
                    Hint = ''
                    Text = ''
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 3
                    ReadOnly = True
                    OnKeyDown = wwDBComboDlgZoneLOKeyDown
                  end
                end
              end
              object PnlFormViewClient03: TUniPanel
                Tag = 1999
                Left = 534
                Top = 1
                Width = 174
                Height = 174
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 2
                Caption = ''
                object Splitter8: TUniSplitter
                  Left = 81
                  Top = 1
                  Width = 4
                  Height = 172
                  Hint = ''
                  Align = alLeft
                  ParentColor = False
                  Color = clBtnFace
                end
                object PnlFormViewLeft03: TUniPanel
                  Left = 1
                  Top = 1
                  Width = 80
                  Height = 172
                  Hint = ''
                  Align = alLeft
                  Anchors = [akLeft, akTop, akBottom]
                  TabOrder = 0
                  Caption = ''
                  object Label13: TUniLabel
                    Left = 8
                    Top = 12
                    Width = 33
                    Height = 13
                    Hint = ''
                    Caption = 'Length'
                    TabOrder = 1
                  end
                  object Label14: TUniLabel
                    Left = 8
                    Top = 36
                    Width = 28
                    Height = 13
                    Hint = ''
                    Caption = 'Width'
                    TabOrder = 2
                  end
                  object Label15: TUniLabel
                    Left = 8
                    Top = 60
                    Width = 31
                    Height = 13
                    Hint = ''
                    Caption = 'Height'
                    TabOrder = 3
                  end
                  object Label16: TUniLabel
                    Left = 8
                    Top = 84
                    Width = 34
                    Height = 13
                    Hint = ''
                    Caption = 'Weight'
                    TabOrder = 4
                  end
                  object Label24: TUniLabel
                    Left = 8
                    Top = 108
                    Width = 58
                    Height = 13
                    Hint = ''
                    Caption = 'Pallet Count'
                    TabOrder = 5
                  end
                end
                object PnlFormViewClient06: TUniPanel
                  Left = 85
                  Top = 1
                  Width = 88
                  Height = 172
                  Hint = ''
                  Align = alClient
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  TabOrder = 1
                  Caption = ''
                  object DBEdit3: TUniDBEdit
                    Left = 0
                    Top = 8
                    Width = 89
                    Height = 21
                    Hint = ''
                    Enabled = False
                    DataField = 'LENGTH'
                    DataSource = SrcLocations
                    TabOrder = 0
                    Color = clBtnFace
                    ReadOnly = True
                  end
                  object DBEdit4: TUniDBEdit
                    Left = 0
                    Top = 32
                    Width = 89
                    Height = 21
                    Hint = ''
                    Enabled = False
                    DataField = 'WIDTH'
                    DataSource = SrcLocations
                    TabOrder = 1
                    Color = clBtnFace
                    ReadOnly = True
                  end
                  object DBEdit5: TUniDBEdit
                    Left = 0
                    Top = 56
                    Width = 89
                    Height = 21
                    Hint = ''
                    Enabled = False
                    DataField = 'HEIGHT'
                    DataSource = SrcLocations
                    TabOrder = 2
                    Color = clBtnFace
                    ReadOnly = True
                  end
                  object DBEdit6: TUniDBEdit
                    Left = 0
                    Top = 80
                    Width = 89
                    Height = 21
                    Hint = ''
                    Enabled = False
                    DataField = 'WEIGHT'
                    DataSource = SrcLocations
                    TabOrder = 3
                    Color = clBtnFace
                    ReadOnly = True
                  end
                  object DBCheckBox1: TUniDBCheckBox
                    Left = 0
                    Top = 128
                    Width = 73
                    Height = 17
                    Hint = ''
                    DataField = 'PK_HIDE'
                    DataSource = SrcLocations
                    ValueChecked = 'Y'
                    ValueUnchecked = 'N'
                    Caption = 'Inactive'
                    TabOrder = 5
                  end
                  object DBEdit7: TUniDBEdit
                    Left = 0
                    Top = 104
                    Width = 89
                    Height = 21
                    Hint = ''
                    DataField = 'PKG_COUNT'
                    DataSource = SrcLocations
                    TabOrder = 4
                  end
                end
              end
            end
          end
        end
      end
      object TabGrid: TUniTabSheet
        Hint = ''
        ImageIndex = 1
        Caption = 'TabGrid'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        object pnlGrid: TUniPanel
          Left = 0
          Top = 0
          Width = 730
          Height = 154
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          DesignSize = (
            730
            154)
          object Grid: TIQUniGridControl
            Left = 1
            Top = 28
            Width = 728
            Height = 125
            Layout = 'border'
            ParentAlignmentControl = False
            AlignmentControl = uniAlignmentClient
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 2
            IQComponents.Grid.Left = 0
            IQComponents.Grid.Top = 29
            IQComponents.Grid.Width = 511
            IQComponents.Grid.Height = 39
            IQComponents.Grid.Hint = ''
            IQComponents.Grid.DataSource = SrcLocations
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
            IQComponents.Navigator.DataSource = SrcLocations
            IQComponents.Navigator.LayoutConfig.Region = 'east'
            IQComponents.Navigator.TabOrder = 3
            IQComponents.HiddenPanel.Left = 511
            IQComponents.HiddenPanel.Top = 29
            IQComponents.HiddenPanel.Width = 209
            IQComponents.HiddenPanel.Height = 39
            IQComponents.HiddenPanel.Hint = ''
            IQComponents.HiddenPanel.Visible = True
            IQComponents.HiddenPanel.Align = alRight
            IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
            IQComponents.FormTab.Hint = ''
            IQComponents.FormTab.ImageIndex = 1
            IQComponents.FormTab.Caption = 'Form'
            IQComponents.FormTab.Layout = 'border'
            DataSource = SrcLocations
            Columns = <
              item
                FieldName = 'LOC_DESC'
                Title.Caption = 'Location'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'DESCRIP'
                Title.Caption = 'Description'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'EPLANT'
                Title.Caption = 'EPlant'
                Width = 64
                ReadOnly = True
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'START_ROW'
                Title.Caption = 'Path'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'DivisionName'
                Title.Caption = 'Division'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'ID'
                Title.Caption = 'Location ID'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'PKG_COUNT'
                Title.Caption = 'Pallet Count'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'PK_HIDE'
                Title.Caption = 'Inactive'
                Width = 64
                CheckBoxField.FieldValues = 'Y;N'
              end
              item
                FieldName = 'BUILDING'
                Title.Caption = 'Building'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'LOC_STATUS'
                Title.Caption = 'Status'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'LENGTH'
                Title.Caption = 'Length'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'WIDTH'
                Title.Caption = 'Width'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'HEIGHT'
                Title.Caption = 'Height'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'WEIGHT'
                Title.Caption = 'Weight'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'InvZoneCodeLO'
                Title.Caption = 'Locating Zone'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'InvZoneCodeAL'
                Title.Caption = 'Allocating  Zone'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'InvZoneCodeDZ'
                Title.Caption = 'Drop Zone'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'InvZoneCodeWK'
                Title.Caption = 'Work Zone'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'LocationTypeDescrip'
                Title.Caption = 'Location Type'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end>
            Marker = 0
          end
          object wwDBComboDlg1: TUniEdit
            Left = 144
            Top = 71
            Width = 121
            Height = 21
            Hint = ''
            Text = ''
            TabOrder = 1
          end
          object wwDBLookupCombo1: TUniDBLookupComboBox
            Left = 144
            Top = 48
            Width = 121
            Height = 21
            Hint = ''
            ListFieldIndex = 0
            TabOrder = 0
            Color = clWindow
          end
          object PnlAltToolbar: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 728
            Height = 27
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
            Caption = ''
            object Panel3: TUniPanel
              Left = 677
              Top = 1
              Width = 50
              Height = 25
              Hint = ''
              Align = alRight
              Anchors = [akTop, akRight, akBottom]
              TabOrder = 0
              Caption = ''
              DesignSize = (
                50
                25)
              object Shape3: TUniPanel
                Left = 1
                Top = 8
                Width = 10
                Height = 11
                Hint = 'In Transit Location'
                ShowHint = True
                ParentShowHint = False
                Anchors = [akTop, akRight]
                TabOrder = 1
                Caption = ''
              end
              object Shape2: TUniPanel
                Left = 15
                Top = 7
                Width = 12
                Height = 13
                Hint = 'Non-Conform'
                ShowHint = True
                ParentShowHint = False
                Anchors = [akTop, akRight]
                TabOrder = 2
                Caption = ''
              end
              object Shape1: TUniPanel
                Left = 31
                Top = 8
                Width = 10
                Height = 11
                Hint = 'VMI Location'
                ShowHint = True
                ParentShowHint = False
                Anchors = [akTop, akRight]
                TabOrder = 3
                Caption = ''
              end
            end
          end
          object IQUDComboBoxBuildingOnGrid: TIQWebUDComboBox
            Left = 144
            Top = 94
            Width = 121
            Height = 21
            Hint = 'Right click to edit the list'
            ShowHint = True
            ParentShowHint = False
            TabOrder = 4
            KeyTableName = 'LOCATIONS'
            KeyFieldName = 'BUILDING'
          end
          object wwDBComboBoxLocStatusOnGrid: TUniDBComboBox
            Left = 144
            Top = 118
            Width = 68
            Height = 21
            Hint = ''
            Anchors = [akLeft, akTop, akRight]
            Style = csDropDownList
            Items.Strings = (
              'E-Empty'#9'E'
              'P-Picking'#9'P'
              'S-Storage'#9'S')
            TabOrder = 5
          end
          object wwDBComboDlgLo_OnGrid: TUniEdit
            Left = 276
            Top = 49
            Width = 131
            Height = 21
            Hint = ''
            Text = ''
            TabOrder = 6
            ReadOnly = True
            OnKeyDown = wwDBComboDlgZoneLOKeyDown
          end
          object wwDBComboDlgAl_OnGrid: TUniEdit
            Left = 276
            Top = 73
            Width = 131
            Height = 21
            Hint = ''
            Text = ''
            TabOrder = 7
            ReadOnly = True
            OnKeyDown = wwDBComboDlgZoneLOKeyDown
          end
          object wwDBComboDlgDz_OnGrid: TUniEdit
            Left = 276
            Top = 98
            Width = 131
            Height = 21
            Hint = ''
            Text = ''
            TabOrder = 8
            ReadOnly = True
            OnKeyDown = wwDBComboDlgZoneLOKeyDown
          end
          object wwDBComboDlgWk_OnGrid: TUniEdit
            Left = 276
            Top = 122
            Width = 131
            Height = 21
            Hint = ''
            Text = ''
            TabOrder = 9
            ReadOnly = True
            OnKeyDown = wwDBComboDlgZoneLOKeyDown
          end
          object wwDBComboDlgLocTypeOnGrid: TUniEdit
            Left = 465
            Top = 48
            Width = 131
            Height = 21
            Hint = ''
            Text = ''
            TabOrder = 10
            ReadOnly = True
            OnKeyDown = ClearLocationType
          end
        end
      end
    end
  end
  object pgctrlDetails: TUniPageControl
    Left = 0
    Top = 220
    Width = 740
    Height = 316
    Hint = ''
    ActivePage = tabGeneral
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    object tabGeneral: TUniTabSheet
      Hint = ''
      Caption = '  General  '
      object pnlDetails: TUniPanel
        Left = 0
        Top = 0
        Width = 732
        Height = 288
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object Splitter2: TUniSplitter
          Left = 353
          Top = 1
          Width = 4
          Height = 286
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnHighlight
        end
        object PnlCheckBoxes: TUniPanel
          Left = 357
          Top = 1
          Width = 374
          Height = 286
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object pnlOptions: TUniPanel
            Left = 1
            Top = 1
            Width = 372
            Height = 284
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            object lblDefaultNonConfirmCode: TUniLabel
              Left = 32
              Top = 60
              Width = 63
              Height = 13
              Hint = ''
              Caption = 'Default Code'
              TabOrder = 15
            end
            object dbchkVMI: TUniDBCheckBox
              Left = 8
              Top = 8
              Width = 136
              Height = 17
              Hint = ''
              DataField = 'VMI'
              DataSource = SrcLocations
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'VMI'
              TabOrder = 0
            end
            object dbchkNonConform: TUniDBCheckBox
              Left = 8
              Top = 24
              Width = 136
              Height = 17
              Hint = ''
              DataField = 'NON_CONFORM'
              DataSource = SrcLocations
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'Non Conform'
              TabOrder = 1
              OnClick = dbchkNonConformClick
            end
            object dbchkShipDesignator: TUniDBCheckBox
              Left = 8
              Top = 96
              Width = 136
              Height = 17
              Hint = ''
              DataField = 'SHIP_DEFAULT'
              DataSource = SrcLocations
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'Ship Designator'
              TabOrder = 4
            end
            object dbchkAutoDelete: TUniDBCheckBox
              Left = 8
              Top = 209
              Width = 136
              Height = 17
              Hint = ''
              DataField = 'DISABLE_DEL_EMPTY'
              DataSource = SrcLocations
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'Disable Auto Delete'
              TabOrder = 11
            end
            object dbchkTransit: TUniDBCheckBox
              Left = 8
              Top = 193
              Width = 136
              Height = 17
              Hint = ''
              DataField = 'TRANSIT'
              DataSource = SrcLocations
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'Transit Location'
              TabOrder = 10
            end
            object dbchkNoShip: TUniDBCheckBox
              Left = 8
              Top = 161
              Width = 136
              Height = 17
              Hint = ''
              DataField = 'NO_SHIP'
              DataSource = SrcLocations
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'No Ship'
              TabOrder = 8
            end
            object dbchkNoBackflush: TUniDBCheckBox
              Left = 8
              Top = 177
              Width = 136
              Height = 17
              Hint = ''
              DataField = 'NO_BACKFLUSH'
              DataSource = SrcLocations
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'No Backflush'
              TabOrder = 9
            end
            object dbchkRecv: TUniDBCheckBox
              Left = 8
              Top = 112
              Width = 136
              Height = 17
              Hint = ''
              DataField = 'RECV_DEFAULT'
              DataSource = SrcLocations
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'Receive Designator'
              TabOrder = 5
            end
            object dbchkShipDock: TUniDBCheckBox
              Left = 8
              Top = 144
              Width = 151
              Height = 17
              Hint = ''
              DataField = 'SHIP_DOCK'
              DataSource = SrcLocations
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'Shipping/Receiving Dock'
              TabOrder = 7
            end
            object dbchNonConformAllocatable: TUniDBCheckBox
              Left = 32
              Top = 40
              Width = 114
              Height = 17
              Hint = ''
              DataField = 'NON_CONFORM_ALLOCATABLE'
              DataSource = SrcLocations
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'Allocatable'
              TabOrder = 2
            end
            object dbchDispoDesignator: TUniDBCheckBox
              Left = 8
              Top = 128
              Width = 136
              Height = 17
              Hint = ''
              DataField = 'AUTO_DISPO_DEFAULT_LOC'
              DataSource = SrcLocations
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'Disposition Designator'
              TabOrder = 6
            end
            object dbchkNonAllocatable: TUniDBCheckBox
              Left = 8
              Top = 80
              Width = 136
              Height = 17
              Hint = ''
              DataField = 'NON_ALLOCATABLE'
              DataSource = SrcLocations
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'Non Allocatable'
              TabOrder = 3
            end
            object dbchkShelfLife2NoProcess: TUniDBCheckBox
              Left = 8
              Top = 225
              Width = 163
              Height = 17
              Hint = ''
              DataField = 'SHELF_LIFE2_NO_PROCESS'
              DataSource = SrcLocations
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'Do Not Process Shelf Life 2'
              TabOrder = 12
            end
            object cmbDefaultNonConfirmCode: TUniEdit
              Left = 120
              Top = 56
              Width = 121
              Height = 21
              Hint = ''
              Text = ''
              TabOrder = 13
              ReadOnly = True
              OnKeyDown = cmbDefaultNonConfirmCodeKeyDown
            end
          end
        end
        object PnlGeneralCllient01: TUniPanel
          Left = 1
          Top = 1
          Width = 352
          Height = 286
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 1
          Caption = ''
          object Splitter3: TUniSplitter
            Left = 123
            Top = 1
            Width = 4
            Height = 284
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnHighlight
          end
          object PnlGeneralLeft01: TUniPanel
            Left = 1
            Top = 1
            Width = 122
            Height = 284
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object Label7: TUniLabel
              Left = 8
              Top = 83
              Width = 89
              Height = 13
              Hint = ''
              Caption = 'Items per Location'
              TabOrder = 1
            end
            object Label9: TUniLabel
              Left = 8
              Top = 131
              Width = 76
              Height = 13
              Hint = ''
              Caption = 'Max Case Stack'
              TabOrder = 2
            end
            object Label10: TUniLabel
              Left = 8
              Top = 155
              Width = 78
              Height = 13
              Hint = ''
              Caption = 'Max Pallet Stack'
              TabOrder = 3
            end
            object Label11: TUniLabel
              Left = 8
              Top = 179
              Width = 88
              Height = 13
              Hint = ''
              Caption = 'Allocate Sequence'
              TabOrder = 4
            end
            object IQUserDefLabel1: TIQWebUserDefLabel
              Left = 8
              Top = 203
              Width = 56
              Height = 13
              Hint = ''
              Caption = 'User Text 1'
              TabOrder = 5
              ParentAppName = 'IQWIN32.EXE'
            end
            object IQUserDefLabel2: TIQWebUserDefLabel
              Left = 8
              Top = 227
              Width = 56
              Height = 13
              Hint = ''
              Caption = 'User Text 2'
              TabOrder = 6
              ParentAppName = 'IQWIN32.EXE'
            end
            object Label17: TUniLabel
              Left = 8
              Top = 11
              Width = 22
              Height = 13
              Hint = ''
              Caption = 'Aisle'
              TabOrder = 7
            end
            object Label18: TUniLabel
              Left = 8
              Top = 35
              Width = 18
              Height = 13
              Hint = ''
              Caption = 'Bay'
              TabOrder = 8
            end
            object Label19: TUniLabel
              Left = 8
              Top = 59
              Width = 25
              Height = 13
              Hint = ''
              Caption = 'Level'
              TabOrder = 9
            end
            object lblLastCycleCount: TUniLabel
              Left = 8
              Top = 251
              Width = 81
              Height = 13
              Hint = ''
              Caption = 'Last Cycle Count'
              TabOrder = 10
            end
          end
          object PnlGeneralCllient02: TUniPanel
            Left = 127
            Top = 1
            Width = 224
            Height = 284
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            DesignSize = (
              224
              284)
            object dbeMaxCaseStack: TUniDBEdit
              Left = 0
              Top = 128
              Width = 121
              Height = 21
              Hint = ''
              Enabled = False
              DataField = 'MAX_CASE_STACK'
              DataSource = SrcLocations
              TabOrder = 5
              Color = clBtnFace
              ReadOnly = True
            end
            object dbeMaxPalletStack: TUniDBEdit
              Left = 0
              Top = 152
              Width = 121
              Height = 21
              Hint = ''
              Enabled = False
              DataField = 'MAX_PALLET_STACK'
              DataSource = SrcLocations
              TabOrder = 6
              Color = clBtnFace
              ReadOnly = True
            end
            object wwDBComboBoxAllocSeq: TUniDBComboBox
              Left = 0
              Top = 176
              Width = 121
              Height = 21
              Hint = ''
              Enabled = False
              DataField = 'ALLOCATE_SEQ'
              DataSource = SrcLocations
              Style = csDropDownList
              Items.Strings = (
                'FIFO'#9'F'
                'LIFO'#9'L')
              TabOrder = 7
              ReadOnly = True
            end
            object wwDBComboBoxItemsPerLocation: TUniDBComboBox
              Left = 0
              Top = 80
              Width = 121
              Height = 21
              Hint = ''
              Enabled = False
              DataField = 'ITEMS_PER_LOC'
              DataSource = SrcLocations
              Style = csDropDownList
              Items.Strings = (
                '1'#9'1'
                '2'#9'2'
                '3'#9'3'
                '4'#9'4'
                '5'#9'5'
                '6'#9'6'
                '7'#9'7'
                '8'#9'8'
                '9'#9'9'
                'Multiple'#9'M')
              TabOrder = 3
              ReadOnly = True
            end
            object dbchkAlloMixedLots: TUniDBCheckBox
              Left = 0
              Top = 104
              Width = 120
              Height = 17
              Hint = ''
              Enabled = False
              DataField = 'ALLOW_MIXED_LOTS'
              DataSource = SrcLocations
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'Allow Mixed Lots'
              TabOrder = 4
              ReadOnly = True
            end
            object DBEdit1: TUniDBEdit
              Left = 0
              Top = 200
              Width = 219
              Height = 21
              Hint = ''
              DataField = 'CUSER1'
              DataSource = SrcLocations
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 8
            end
            object DBEdit2: TUniDBEdit
              Left = 0
              Top = 224
              Width = 219
              Height = 21
              Hint = ''
              DataField = 'CUSER2'
              DataSource = SrcLocations
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 9
            end
            object dbeLocAisle: TUniEdit
              Left = 0
              Top = 8
              Width = 121
              Height = 21
              Hint = ''
              Text = ''
              TabOrder = 0
              ReadOnly = True
            end
            object dbeLocBay: TUniDBEdit
              Left = 0
              Top = 32
              Width = 121
              Height = 21
              Hint = ''
              DataField = 'LOC_BAY'
              DataSource = SrcLocations
              TabOrder = 1
            end
            object dbeLocLevel: TUniDBEdit
              Left = 0
              Top = 56
              Width = 121
              Height = 21
              Hint = ''
              DataField = 'LOC_LEVEL'
              DataSource = SrcLocations
              TabOrder = 2
            end
            object dbeCycleCountDate: TUniDBEdit
              Left = 0
              Top = 248
              Width = 121
              Height = 21
              Hint = ''
              DataField = 'CYCLE_COUNT_DATE'
              DataSource = SrcLocations
              TabOrder = 10
              Color = clBtnFace
              ReadOnly = True
            end
          end
        end
      end
    end
    object tabStaging: TUniTabSheet
      Hint = ''
      ImageIndex = 1
      Caption = '  Raw Material Staging  '
      object Splitter1: TUniSplitter
        Left = 0
        Top = 157
        Width = 732
        Height = 4
        Cursor = crVSplit
        Hint = ''
        Align = alTop
        ParentColor = False
        Color = clBtnFace
      end
      object pnlStagingIn: TUniPanel
        Left = 0
        Top = 0
        Width = 732
        Height = 157
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        object PnlToolbarRawMatStaging1: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 730
          Height = 27
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Alignment = taLeftJustify
          Caption = '  IN Transaction  '
          object navStagingIn: TUniDBNavigator
            Left = 504
            Top = 1
            Width = 225
            Height = 25
            Hint = ''
            DataSource = SrcStagingIN
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
          end
        end
        object gridStagingIn: TIQUniGridControl
          Left = 1
          Top = 28
          Width = 730
          Height = 128
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 513
          IQComponents.Grid.Height = 42
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcStagingIN
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
          IQComponents.Navigator.DataSource = SrcStagingIN
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 513
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 42
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcStagingIN
          Columns = <
            item
              FieldName = 'EQNO'
              Title.Caption = 'Work Center'
              Width = 64
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'CNTR_DESC'
              Title.Caption = 'Description'
              Width = 64
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'TRANS_PRIORITY'
              Title.Caption = 'Priority'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'PICKUP_PACKAGES'
              Title.Caption = '# Of Packages'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'PICKUP_PALLETS'
              Title.Caption = '# of Pallets'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
        end
        object wwDBComboDlgWorkcenterTransIN: TUniEdit
          Left = 190
          Top = 112
          Width = 121
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 2
          ReadOnly = True
        end
      end
      object Panel18: TUniPanel
        Left = 0
        Top = 161
        Width = 732
        Height = 127
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object PnlToolbarRawMatStaging2: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 730
          Height = 27
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Alignment = taLeftJustify
          Caption = '  OUT Transaction'
          object navStagingOut: TUniDBNavigator
            Left = 504
            Top = 1
            Width = 225
            Height = 25
            Hint = ''
            DataSource = SrcStagingOUT
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
          end
        end
        object gridStagingOut: TIQUniGridControl
          Left = 1
          Top = 28
          Width = 730
          Height = 98
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 513
          IQComponents.Grid.Height = 12
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcStagingOUT
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
          IQComponents.Navigator.DataSource = SrcStagingOUT
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 513
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 12
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcStagingOUT
          Columns = <
            item
              FieldName = 'EQNO'
              Title.Caption = 'Work Center #'
              Width = 64
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'CNTR_DESC'
              Title.Caption = 'Description'
              Width = 64
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'STAGING_HRS'
              Title.Caption = 'This Work Center'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'STAGING_HRS_PARAMS'
              Title.Caption = 'Default'
              Width = 64
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
        end
        object wwDBComboDlgWorkcenterTransOUT: TUniEdit
          Left = 190
          Top = 88
          Width = 121
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 2
          ReadOnly = True
        end
      end
    end
    object tabMilkRun: TUniTabSheet
      Hint = ''
      ImageIndex = 2
      Caption = '  Milk Run Staging  '
      object PnlToolbar_MilkRunStaging: TUniPanel
        Tag = 1999
        Left = 0
        Top = 0
        Width = 732
        Height = 27
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = ''
        object NavMilkRun: TUniDBNavigator
          Left = 506
          Top = 1
          Width = 225
          Height = 25
          Hint = ''
          DataSource = SrcMilkRun
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
      object gridMilkRun: TIQUniGridControl
        Left = 0
        Top = 27
        Width = 732
        Height = 261
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 515
        IQComponents.Grid.Height = 175
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcMilkRun
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
        IQComponents.Navigator.DataSource = SrcMilkRun
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 515
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 175
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcMilkRun
        Columns = <
          item
            FieldName = 'ITEMNO'
            Title.Caption = 'Item #'
            Width = 64
            ReadOnly = True
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DESCRIP'
            Title.Caption = 'Item Description'
            Width = 64
            ReadOnly = True
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ORDERNO'
            Title.Caption = 'Order #'
            Width = 64
            ReadOnly = True
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSTNO'
            Title.Caption = 'Customer #'
            Width = 64
            ReadOnly = True
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ATTN'
            Title.Caption = 'Ship To'
            Width = 64
            ReadOnly = True
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'REV'
            Title.Caption = 'Rev'
            Width = 64
            ReadOnly = True
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CLASS'
            Title.Caption = 'Class'
            Width = 64
            ReadOnly = True
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DESCRIP2'
            Title.Caption = 'Item Ext Description'
            Width = 64
            ReadOnly = True
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'COMPANY'
            Title.Caption = 'Customer Name'
            Width = 64
            ReadOnly = True
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
      object wwDBComboDlgMilkRun: TUniEdit
        Left = 176
        Top = 72
        Width = 121
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 2
        ReadOnly = True
      end
    end
  end
  object SrcLocations: TDataSource
    DataSet = QryLocations
    OnDataChange = SrcLocationsDataChange
    Left = 55
    Top = 190
  end
  object wwQryDivisionLookup: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select d.id, '
      '       d.name,'
      '       e.name as eplant_name'
      '  from division d,'
      '       eplant e'
      ' where d.eplant_id = e.id(+)'
      ' ')
    Left = 92
    Top = 191
    object wwQryDivisionLookupNAME: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 15
      FieldName = 'NAME'
      Size = 25
    end
    object wwQryDivisionLookupEPLANT_NAME: TStringField
      DisplayLabel = 'Division EPlant'
      DisplayWidth = 15
      FieldName = 'EPLANT_NAME'
      Size = 30
    end
    object wwQryDivisionLookupID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 56
    Top = 296
    object File1: TUniMenuItem
      Caption = 'File'
      object Parameters1: TUniMenuItem
        Caption = 'Parameters'
        OnClick = Parameters1Click
      end
      object N2: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Options1: TUniMenuItem
      Caption = 'Options'
      object Aisles1: TUniMenuItem
        Caption = 'Aisles'
        OnClick = Aisles1Click
      end
      object Zones1: TUniMenuItem
        Caption = 'Zones'
        OnClick = Zones1Click
      end
      object LocationTypes1: TUniMenuItem
        Caption = 'Location Types'
        OnClick = LocationTypes1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object ViewAll1: TUniMenuItem
        Caption = 'View All'
        RadioItem = True
        OnClick = FilterPKHide
      end
      object ViewActive1: TUniMenuItem
        Caption = 'View Active'
        RadioItem = True
        OnClick = FilterPKHide
      end
      object ViewInactive1: TUniMenuItem
        Caption = 'View Inactive'
        RadioItem = True
        OnClick = FilterPKHide
      end
    end
    object Reports1: TUniMenuItem
      Caption = 'Reports'
      object Print1: TUniMenuItem
        Caption = 'Print'
        OnClick = Print1Click
      end
      object PrinterSetup1: TUniMenuItem
        Caption = 'Printer Setup'
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
  object IQAbout1: TIQWebAbout
    ModuleName = 'Master Locations'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 196093 $'
    BuildVersion = '176554'
    Left = 92
    Top = 300
  end
  object QryEdi: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       '#39'['#39' || ID || '#39']  '#39' || name as descrip'
      '  from eplant')
    Left = 128
    Top = 191
    object QryEdiID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object QryEdiDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 74
    end
  end
  object PkLoc: TIQWebHpick
    BeforeOpen = PkLocBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select l.id as id,'
      '       l.loc_desc as location,'
      '       l.start_row as path,'
      '       l.descrip as description,'
      '       '#39'['#39' || e.ID || '#39']  '#39' || e.name as eplant_name,'
      '       d.name as division,'
      '       a.name as loc_aisle ,'
      '       l.loc_bay as loc_bay,'
      '       l.loc_level as loc_level,'
      
        '       decode(NVL(l.pk_hide, '#39'N'#39'), '#39'N'#39', '#39'Active'#39', '#39'InActive'#39') as' +
        ' active_type'
      '  from locations l,'
      '       eplant e,'
      '       division d,'
      '       inv_aisles a'
      ' where l.eplant_id = e.id(+)'
      '   and l.division_id = d.id(+)'
      '   and misc.eplant_filter(l.eplant_id) = 1'
      '   and misc.pk_hide_filter( pk_hide, :selected_view ) = 1'
      '   and l.inv_aisles_id = a.id(+)'
      ''
      ''
      ''
      ''
      ' ')
    OnIQModify = PkLocIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 92
    Top = 268
    ParamData = <
      item
        Name = 'selected_view'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkLocID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkLocLOCATION: TStringField
      DisplayLabel = 'Location'
      FieldName = 'LOCATION'
      FixedChar = True
      Size = 30
    end
    object PkLocDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIPTION'
      Size = 50
    end
    object PkLocPATH: TBCDField
      DisplayLabel = 'Path'
      FieldName = 'PATH'
      Size = 0
    end
    object PkLocEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant Name'
      FieldName = 'EPLANT_NAME'
      Size = 74
    end
    object PkLocDIVISION: TStringField
      DisplayLabel = 'Division'
      FieldName = 'DIVISION'
      Size = 25
    end
    object PkLocACTIVE_TYPE: TStringField
      DisplayLabel = 'State'
      FieldName = 'ACTIVE_TYPE'
      Size = 8
    end
    object PkLocLOC_AISLE: TStringField
      DisplayLabel = 'Aisle'
      FieldName = 'LOC_AISLE'
      Size = 9
    end
    object PkLocLOC_BAY: TStringField
      DisplayLabel = 'Bay'
      FieldName = 'LOC_BAY'
      Size = 9
    end
    object PkLocLOC_LEVEL: TStringField
      DisplayLabel = 'Level'
      FieldName = 'LOC_LEVEL'
      Size = 9
    end
  end
  object UpdateSQLLocations: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into LOCATIONS'
      
        '  (LOC_DESC, DESCRIP, START_ROW, ID, VMI, NON_CONFORM, SHIP_DEFA' +
        'ULT, '
      'EPLANT_ID, '
      
        '   START_COL, END_ROW, END_COL, STATUS, DIVISION_ID, DISABLE_DEL' +
        '_EMPTY, '
      
        '   TRANSIT, NO_SHIP, NO_BACKFLUSH, RECV_DEFAULT, SHIP_DOCK, PKG_' +
        'COUNT, '
      '   PK_HIDE, BUILDING, CUSER1, CUSER2, NON_CONFORM_ALLOCATABLE, '
      'AUTO_DISPO_DEFAULT_LOC, '
      
        '   INV_ZONE_ID, LOCATION_TYPE_ID, INV_AISLES_ID, LOC_BAY, LOC_LE' +
        'VEL, '
      'AL_INV_ZONE_ID, '
      '   DZ_INV_ZONE_ID, WK_INV_ZONE_ID, NON_ALLOCATABLE, LOC_STATUS, '
      'SHELF_LIFE2_NO_PROCESS, NON_CONFORM_ID)'
      'values'
      
        '  (:LOC_DESC, :DESCRIP, :START_ROW, :ID, :VMI, :NON_CONFORM, :SH' +
        'IP_DEFAULT, '
      
        '   :EPLANT_ID, :START_COL, :END_ROW, :END_COL, :STATUS, :DIVISIO' +
        'N_ID, '
      ':DISABLE_DEL_EMPTY, '
      
        '   :TRANSIT, :NO_SHIP, :NO_BACKFLUSH, :RECV_DEFAULT, :SHIP_DOCK,' +
        ' '
      ':PKG_COUNT, '
      
        '   :PK_HIDE, :BUILDING, :CUSER1, :CUSER2, :NON_CONFORM_ALLOCATAB' +
        'LE, '
      ':AUTO_DISPO_DEFAULT_LOC, '
      
        '   :INV_ZONE_ID, :LOCATION_TYPE_ID, :INV_AISLES_ID, :LOC_BAY, :L' +
        'OC_LEVEL, '
      
        '   :AL_INV_ZONE_ID, :DZ_INV_ZONE_ID, :WK_INV_ZONE_ID, :NON_ALLOC' +
        'ATABLE, '
      '   :LOC_STATUS, :SHELF_LIFE2_NO_PROCESS, :NON_CONFORM_ID)')
    ModifySQL.Strings = (
      'update LOCATIONS'
      'set'
      '  LOC_DESC = :LOC_DESC,'
      '  DESCRIP = :DESCRIP,'
      '  START_ROW = :START_ROW,'
      '  ID = :ID,'
      '  VMI = :VMI,'
      '  NON_CONFORM = :NON_CONFORM,'
      '  SHIP_DEFAULT = :SHIP_DEFAULT,'
      '  EPLANT_ID = :EPLANT_ID,'
      '  START_COL = :START_COL,'
      '  END_ROW = :END_ROW,'
      '  END_COL = :END_COL,'
      '  STATUS = :STATUS,'
      '  DIVISION_ID = :DIVISION_ID,'
      '  DISABLE_DEL_EMPTY = :DISABLE_DEL_EMPTY,'
      '  TRANSIT = :TRANSIT,'
      '  NO_SHIP = :NO_SHIP,'
      '  NO_BACKFLUSH = :NO_BACKFLUSH,'
      '  RECV_DEFAULT = :RECV_DEFAULT,'
      '  SHIP_DOCK = :SHIP_DOCK,'
      '  PKG_COUNT = :PKG_COUNT,'
      '  PK_HIDE = :PK_HIDE,'
      '  BUILDING = :BUILDING,'
      '  CUSER1 = :CUSER1,'
      '  CUSER2 = :CUSER2,'
      '  NON_CONFORM_ALLOCATABLE = :NON_CONFORM_ALLOCATABLE,'
      '  AUTO_DISPO_DEFAULT_LOC = :AUTO_DISPO_DEFAULT_LOC,'
      '  INV_ZONE_ID = :INV_ZONE_ID,'
      '  LOCATION_TYPE_ID = :LOCATION_TYPE_ID,'
      '  INV_AISLES_ID = :INV_AISLES_ID,'
      '  LOC_BAY = :LOC_BAY,'
      '  LOC_LEVEL = :LOC_LEVEL,'
      '  AL_INV_ZONE_ID = :AL_INV_ZONE_ID,'
      '  DZ_INV_ZONE_ID = :DZ_INV_ZONE_ID,'
      '  WK_INV_ZONE_ID = :WK_INV_ZONE_ID,'
      '  NON_ALLOCATABLE = :NON_ALLOCATABLE,'
      '  LOC_STATUS = :LOC_STATUS,'
      '  SHELF_LIFE2_NO_PROCESS = :SHELF_LIFE2_NO_PROCESS,'
      '  NON_CONFORM_ID = :NON_CONFORM_ID'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from LOCATIONS'
      'where'
      '  ID = :OLD_ID')
    Left = 217
    Top = 303
  end
  object QryLocations: TFDQuery
    BeforeOpen = QryLocationsBeforeOpen
    BeforeEdit = QryLocationsBeforeEdit
    BeforePost = QryLocationsBeforePost
    AfterPost = ApplyUpdates
    AfterCancel = QryLocationsAfterCancel
    BeforeDelete = QryLocationsBeforeDelete
    AfterDelete = ApplyUpdates
    OnCalcFields = QryLocationsCalcFields
    OnNewRecord = QryLocoationsNewRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'LOCATIONS'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLLocations
    SQL.Strings = (
      'select loc.loc_desc,'
      '       loc.descrip,'
      '       loc.start_row,'
      '       loc.id,'
      '       loc.vmi,'
      '       loc.non_conform,'
      '       loc.ship_default,'
      '       loc.eplant_id,'
      '       loc.start_col,'
      '       loc.end_row,'
      '       loc.end_col,'
      '       loc.status,'
      '       loc.division_id,'
      '       loc.disable_del_empty,'
      '       loc.transit,'
      '       loc.no_ship,'
      '       loc.no_backflush,'
      '       loc.recv_default,'
      '       loc.ship_dock,'
      '       loc.pkg_count,'
      
        '       decode( loc.eplant_id, null, null, '#39'['#39' || loc.eplant_id |' +
        '| '#39']  '#39' || eplant.name ) as eplant,'
      '       loc.pk_hide,'
      '       loc.building,'
      '       loc.cuser1,'
      '       loc.cuser2,'
      '       loc.non_conform_allocatable,'
      '       loc.auto_dispo_default_loc,'
      '       loc.inv_zone_id,'
      '       loc.location_type_id,'
      '       loc.inv_aisles_id,'
      '       loc.loc_bay,'
      '       loc.loc_level,'
      '       loc.al_inv_zone_id,'
      '       loc.dz_inv_zone_id,'
      '       loc.wk_inv_zone_id,'
      '       loc.non_allocatable,'
      '       nvl(loc.loc_status, '#39'E'#39') as loc_status,'
      '       loc.cycle_count_date,'
      
        '       substrB(iqeval.substrW63Max( inv_trans_misc.get_source_de' +
        'scrip(p.source, p.source_id), 1, 255), 1, 255) as reservation_so' +
        'urce_descrip,'
      '       loc.shelf_life2_no_process,'
      '       loc.non_conform_id,'
      
        '       (select code from non_conform where id = loc.non_conform_' +
        'id) as non_conform_code'
      '          '
      '  from '
      '       locations loc,'
      '       eplant,'
      '       inv_trans_plan p'
      ' where misc.eplant_filter( loc.eplant_id ) = 1'
      '   and loc.eplant_id = eplant.id(+)'
      '   and misc.pk_hide_filter( pk_hide, :selected_view ) = 1'
      '   and (:non_conform_only = 0 or'
      '        :non_conform_only = 1 and nvl(non_conform, '#39'N'#39') = '#39'Y'#39')'
      '   and loc.reserved_inv_trans_plan_id = p.id(+)     '
      ''
      ' order by loc_desc'
      '')
    Left = 56
    Top = 208
    ParamData = <
      item
        Name = 'selected_view'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'non_conform_only'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryLocationsLOC_DESC: TStringField
      DisplayLabel = 'Location'
      DisplayWidth = 16
      FieldName = 'LOC_DESC'
      Size = 30
    end
    object QryLocationsDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 15
      FieldName = 'DESCRIP'
      Size = 50
    end
    object QryLocationsEPLANT: TStringField
      FieldName = 'EPLANT'
      ReadOnly = True
      Size = 74
    end
    object QryLocationsSTART_ROW: TBCDField
      DisplayLabel = 'Picking Route'
      DisplayWidth = 12
      FieldName = 'START_ROW'
      Size = 0
    end
    object QryLocationsDivisionName: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 12
      FieldKind = fkCalculated
      FieldName = 'DivisionName'
      Size = 25
      Calculated = True
    end
    object QryLocationsID: TBCDField
      DisplayLabel = 'Location ID'
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object QryLocationsVMI: TStringField
      DisplayWidth = 6
      FieldName = 'VMI'
      Visible = False
      Size = 1
    end
    object QryLocationsNON_CONFORM: TStringField
      DisplayLabel = 'Non Conf'
      DisplayWidth = 8
      FieldName = 'NON_CONFORM'
      Visible = False
      Size = 1
    end
    object QryLocationsSHIP_DEFAULT: TStringField
      DisplayLabel = 'Ship Designator'
      DisplayWidth = 1
      FieldName = 'SHIP_DEFAULT'
      Visible = False
      Size = 1
    end
    object QryLocationsEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
    object QryLocationsSTART_COL: TBCDField
      DisplayWidth = 10
      FieldName = 'START_COL'
      Visible = False
      Size = 0
    end
    object QryLocationsEND_ROW: TBCDField
      DisplayWidth = 10
      FieldName = 'END_ROW'
      Visible = False
      Size = 0
    end
    object QryLocationsEND_COL: TBCDField
      DisplayWidth = 10
      FieldName = 'END_COL'
      Visible = False
      Size = 0
    end
    object QryLocationsSTATUS: TStringField
      DisplayWidth = 1
      FieldName = 'STATUS'
      Visible = False
      Size = 1
    end
    object QryLocationsDIVISION_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'DIVISION_ID'
      Visible = False
      Size = 0
    end
    object QryLocationsDISABLE_DEL_EMPTY: TStringField
      DisplayWidth = 1
      FieldName = 'DISABLE_DEL_EMPTY'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryLocationsTRANSIT: TStringField
      FieldName = 'TRANSIT'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryLocationsNO_SHIP: TStringField
      DisplayLabel = 'No Ship'
      DisplayWidth = 1
      FieldName = 'NO_SHIP'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryLocationsNO_BACKFLUSH: TStringField
      DisplayLabel = 'No Backflush'
      DisplayWidth = 1
      FieldName = 'NO_BACKFLUSH'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryLocationsRECV_DEFAULT: TStringField
      DisplayLabel = 'Receive Designator'
      FieldName = 'RECV_DEFAULT'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryLocationsSHIP_DOCK: TStringField
      FieldName = 'SHIP_DOCK'
      Size = 1
    end
    object QryLocationsPKG_COUNT: TBCDField
      DisplayLabel = 'Pallet Count'
      FieldName = 'PKG_COUNT'
      Size = 0
    end
    object QryLocationsPK_HIDE: TStringField
      DisplayLabel = 'Archived'
      FieldName = 'PK_HIDE'
      Size = 1
    end
    object QryLocationsBUILDING: TStringField
      FieldName = 'BUILDING'
      Visible = False
      Size = 60
    end
    object QryLocationsCUSER1: TStringField
      FieldName = 'CUSER1'
      Visible = False
      Size = 60
    end
    object QryLocationsCUSER2: TStringField
      FieldName = 'CUSER2'
      Visible = False
      Size = 60
    end
    object QryLocationsNON_CONFORM_ALLOCATABLE: TStringField
      FieldName = 'NON_CONFORM_ALLOCATABLE'
      Visible = False
      Size = 1
    end
    object QryLocationsAUTO_DISPO_DEFAULT_LOC: TStringField
      FieldName = 'AUTO_DISPO_DEFAULT_LOC'
      Visible = False
      Size = 1
    end
    object QryLocationsINV_ZONE_ID: TBCDField
      FieldName = 'INV_ZONE_ID'
      Visible = False
      Size = 0
    end
    object QryLocationsInvZoneCodeLO: TStringField
      FieldKind = fkCalculated
      FieldName = 'InvZoneCodeLO'
      Visible = False
      Size = 25
      Calculated = True
    end
    object QryLocationsLOCATION_TYPE_ID: TBCDField
      FieldName = 'LOCATION_TYPE_ID'
      Visible = False
      Size = 0
    end
    object QryLocationsLocationTypeDescrip: TStringField
      FieldKind = fkCalculated
      FieldName = 'LocationTypeDescrip'
      Visible = False
      Size = 50
      Calculated = True
    end
    object QryLocationsLENGTH: TFloatField
      FieldKind = fkCalculated
      FieldName = 'LENGTH'
      Visible = False
      Calculated = True
    end
    object QryLocationsWIDTH: TFloatField
      FieldKind = fkCalculated
      FieldName = 'WIDTH'
      Visible = False
      Calculated = True
    end
    object QryLocationsHEIGHT: TFloatField
      FieldKind = fkCalculated
      FieldName = 'HEIGHT'
      Visible = False
      Calculated = True
    end
    object QryLocationsWEIGHT: TFloatField
      FieldKind = fkCalculated
      FieldName = 'WEIGHT'
      Visible = False
      Calculated = True
    end
    object QryLocationsITEMS_PER_LOC: TStringField
      FieldKind = fkCalculated
      FieldName = 'ITEMS_PER_LOC'
      Visible = False
      Size = 1
      Calculated = True
    end
    object QryLocationsALLOW_MIXED_LOTS: TStringField
      FieldKind = fkCalculated
      FieldName = 'ALLOW_MIXED_LOTS'
      Visible = False
      Size = 1
      Calculated = True
    end
    object QryLocationsMAX_CASE_STACK: TFloatField
      FieldKind = fkCalculated
      FieldName = 'MAX_CASE_STACK'
      Visible = False
      Calculated = True
    end
    object QryLocationsMAX_PALLET_STACK: TFloatField
      FieldKind = fkCalculated
      FieldName = 'MAX_PALLET_STACK'
      Visible = False
      Calculated = True
    end
    object QryLocationsALLOCATE_SEQ: TStringField
      FieldKind = fkCalculated
      FieldName = 'ALLOCATE_SEQ'
      Visible = False
      Size = 1
      Calculated = True
    end
    object QryLocationsEplantDisp: TStringField
      FieldKind = fkCalculated
      FieldName = 'EplantDisp'
      Size = 35
      Calculated = True
    end
    object QryLocationsLOC_AISLE: TStringField
      FieldKind = fkCalculated
      FieldName = 'Loc_Aisle'
      Visible = False
      Size = 9
      Calculated = True
    end
    object QryLocationsLOC_BAY: TStringField
      FieldName = 'LOC_BAY'
      Visible = False
      Size = 9
    end
    object QryLocationsLOC_LEVEL: TStringField
      FieldName = 'LOC_LEVEL'
      Visible = False
      Size = 9
    end
    object QryLocationsInvZoneCodeAL: TStringField
      FieldKind = fkCalculated
      FieldName = 'InvZoneCodeAL'
      Visible = False
      Size = 50
      Calculated = True
    end
    object QryLocationsInvZoneCodeDZ: TStringField
      FieldKind = fkCalculated
      FieldName = 'InvZoneCodeDZ'
      Visible = False
      Size = 50
      Calculated = True
    end
    object QryLocationsInvZoneCodeWK: TStringField
      FieldKind = fkCalculated
      FieldName = 'InvZoneCodeWK'
      Visible = False
      Size = 50
      Calculated = True
    end
    object QryLocationsAL_INV_ZONE_ID: TBCDField
      FieldName = 'AL_INV_ZONE_ID'
      Visible = False
      Size = 0
    end
    object QryLocationsDZ_INV_ZONE_ID: TBCDField
      FieldName = 'DZ_INV_ZONE_ID'
      Visible = False
      Size = 0
    end
    object QryLocationsWK_INV_ZONE_ID: TBCDField
      FieldName = 'WK_INV_ZONE_ID'
      Visible = False
      Size = 0
    end
    object QryLocationsLOC_STATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'LOC_STATUS'
      Size = 1
    end
    object QryLocationsINV_AISLES_ID: TBCDField
      FieldName = 'INV_AISLES_ID'
      Visible = False
      Size = 0
    end
    object QryLocationsLocationTypeSubType: TStringField
      FieldKind = fkCalculated
      FieldName = 'LocationTypeSubType'
      Size = 1
      Calculated = True
    end
    object QryLocationsCYCLE_COUNT_DATE: TDateTimeField
      FieldName = 'CYCLE_COUNT_DATE'
      ReadOnly = True
    end
    object QryLocationsRESERVATION_SOURCE_DESCRIP: TStringField
      DisplayLabel = 'Reservation Description'
      DisplayWidth = 30
      FieldName = 'RESERVATION_SOURCE_DESCRIP'
      ReadOnly = True
      Size = 255
    end
    object QryLocationsNON_ALLOCATABLE: TStringField
      FieldName = 'NON_ALLOCATABLE'
      Size = 1
    end
    object QryLocationsSHELF_LIFE2_NO_PROCESS: TStringField
      DisplayLabel = 'Do Not Process Shelf Life 2'
      FieldName = 'SHELF_LIFE2_NO_PROCESS'
      Visible = False
      Size = 1
    end
    object QryLocationsNON_CONFORM_CODE: TStringField
      FieldName = 'NON_CONFORM_CODE'
      Size = 10
    end
    object QryLocationsNON_CONFORM_ID: TBCDField
      FieldName = 'NON_CONFORM_ID'
      Origin = 'loc.non_conform_id'
      Size = 0
    end
  end
  object popmUserDefined: TUniPopupMenu
    Left = 56
    Top = 328
    object DefineLabelText1: TUniMenuItem
      Caption = 'Define Label Text'
      OnClick = DefineLabelText1Click
    end
  end
  object PkInvZone: TIQWebHpick
    BeforeOpen = PkInvZoneBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id as id, '
      '       code as code, '
      '       descrip as descrip'
      '  from inv_zone'
      ' where zone_type = :zone_type ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 56
    Top = 268
    ParamData = <
      item
        Name = 'zone_type'
        DataType = ftString
        ParamType = ptInput
      end>
    object PkInvZoneID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.INV_ZONE.ID'
      Visible = False
      Size = 0
    end
    object PkInvZoneCODE: TStringField
      DisplayLabel = 'Code'
      FieldName = 'CODE'
      Origin = 'IQ.INV_ZONE.CODE'
      Size = 25
    end
    object PkInvZoneDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 60
      FieldName = 'DESCRIP'
      Origin = 'IQ.INV_ZONE.DESCRIP'
      Size = 100
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 90
    Top = 328
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'LocationsTable'
    WebUse = False
    TouchScreen = False
    Left = 124
    Top = 328
  end
  object PkLocationType: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       descrip,'
      '       length,'
      '       width,'
      '       height,'
      '       weight'
      '  from location_type       '
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 128
    Top = 268
    object PkLocationTypeID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkLocationTypeDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object PkLocationTypeLENGTH: TBCDField
      DisplayLabel = 'Length'
      FieldName = 'LENGTH'
      Size = 2
    end
    object PkLocationTypeWIDTH: TBCDField
      DisplayLabel = 'Width'
      FieldName = 'WIDTH'
      Size = 2
    end
    object PkLocationTypeHEIGHT: TBCDField
      DisplayLabel = 'Height'
      FieldName = 'HEIGHT'
      Size = 2
    end
    object PkLocationTypeWEIGHT: TBCDField
      DisplayLabel = 'Weight'
      FieldName = 'WEIGHT'
      Size = 2
    end
  end
  object PkAisle: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.id as id, '
      '       a.name as name,'
      '       d.name as division_name,'
      '       a.eplant_id as eplant_id'
      '  from inv_aisles a,  '
      '       division d       '
      ' where a.division_id = d.id(+)'
      '   and misc.eplant_filter( a.eplant_id ) = 1       ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 160
    Top = 268
    object PkAisleID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkAisleNAME: TStringField
      DisplayLabel = 'Aisle Name'
      FieldName = 'NAME'
      Size = 9
    end
    object PkAisleDIVISION_NAME: TStringField
      DisplayLabel = 'Division'
      FieldName = 'DIVISION_NAME'
      Size = 25
    end
    object PkAisleEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object SrcStagingIN: TDataSource
    DataSet = QryStagingIN
    Left = 200
    Top = 192
  end
  object QryStagingIN: TFDQuery
    BeforeInsert = PostParent
    AfterInsert = QryStagingINAfterInsert
    BeforeEdit = PostParent
    BeforePost = QryStagingINBeforePost
    AfterPost = ApplyUpdates
    AfterDelete = ApplyUpdates
    CachedUpdates = True
    MasterSource = SrcLocations
    MasterFields = 'ID'
    OnUpdateRecord = QryStagingINUpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select w.id,'
      '       w.eqno,'
      '       w.cntr_desc,'
      '       w.trans_priority,'
      '       w.pickup_packages,'
      '       w.pickup_pallets,'
      '       w.locations_id_in'
      '  from work_center w'
      ' where w.locations_id_in = :id'
      ' order by w.eqno')
    Left = 200
    Top = 216
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryStagingINEQNO: TStringField
      DisplayLabel = 'Work Center'
      DisplayWidth = 21
      FieldName = 'EQNO'
      Origin = 'IQ.WORK_CENTER.EQNO'
      ReadOnly = True
      FixedChar = True
      Size = 60
    end
    object QryStagingINCNTR_DESC: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 33
      FieldName = 'CNTR_DESC'
      Origin = 'IQ.WORK_CENTER.CNTR_DESC'
      ReadOnly = True
      Size = 250
    end
    object QryStagingINTRANS_PRIORITY: TBCDField
      DisplayLabel = 'Priority'
      FieldName = 'TRANS_PRIORITY'
      Origin = 'IQ.WORK_CENTER.TRANS_PRIORITY'
      Size = 0
    end
    object QryStagingINPICKUP_PACKAGES: TBCDField
      DisplayLabel = '# Of Packages'
      DisplayWidth = 17
      FieldName = 'PICKUP_PACKAGES'
      Origin = 'IQ.WORK_CENTER.PICKUP_PACKAGES'
      Size = 0
    end
    object QryStagingINPICKUP_PALLETS: TBCDField
      DisplayLabel = '# of Pallets'
      DisplayWidth = 15
      FieldName = 'PICKUP_PALLETS'
      Origin = 'IQ.WORK_CENTER.PICKUP_PALLETS'
      Size = 0
    end
    object QryStagingINID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.WORK_CENTER.ID'
      Visible = False
      Size = 0
    end
    object QryStagingINLOCATIONS_ID_IN: TBCDField
      FieldName = 'LOCATIONS_ID_IN'
      Origin = 'IQ.WORK_CENTER.LOCATIONS_ID_IN'
      Visible = False
      Size = 0
    end
  end
  object PkWorkCenterStagingIN: TIQWebHpick
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select w.id as id,'
      '       w.eqno as eqno, '
      '       w.cntr_type as cntr_type,'
      '       w.cntr_desc as cntr_desc,'
      '       w.eplant_id as eplant_id,'
      '       loc1.loc_desc as loc_desc_in,'
      '       loc2.loc_desc as loc_desc_out,'
      '       w.locations_id_in as locations_id_in,'
      '       w.locations_id as locations_id'
      '  from work_center w,'
      '       locations loc1,'
      '       locations loc2'
      ' where w.locations_id_in = loc1.id(+)'
      '   and w.locations_id = loc2.id(+)'
      '  '
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 200
    Top = 247
    object StringField2: TStringField
      DisplayLabel = 'Work Center #'
      DisplayWidth = 25
      FieldName = 'EQNO'
      Size = 60
    end
    object StringField3: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 60
      FieldName = 'CNTR_DESC'
      Size = 250
    end
    object StringField1: TStringField
      DisplayLabel = 'Center Type'
      FieldName = 'CNTR_TYPE'
    end
    object PkWorkCenterStagingINID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.WORK_CENTER.ID'
      Visible = False
      Size = 0
    end
    object PkWorkCenterStagingINEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'IQ.WORK_CENTER.EPLANT_ID'
      Size = 0
    end
    object PkWorkCenterStagingINLOC_DESC_IN: TStringField
      DisplayLabel = 'IN Transaction Location'
      FieldName = 'LOC_DESC_IN'
      FixedChar = True
      Size = 30
    end
    object PkWorkCenterStagingINLOC_DESC_OUT: TStringField
      DisplayLabel = 'OUT Transaction Location'
      FieldName = 'LOC_DESC_OUT'
      FixedChar = True
      Size = 30
    end
    object PkWorkCenterStagingINLOCATIONS_ID_IN: TBCDField
      FieldName = 'LOCATIONS_ID_IN'
      Visible = False
      Size = 0
    end
    object PkWorkCenterStagingINLOCATIONS_ID: TBCDField
      FieldName = 'LOCATIONS_ID'
      Visible = False
      Size = 0
    end
  end
  object PkWorkCenterStagingOUT: TIQWebHpick
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select w.id as id,'
      '       w.eqno as eqno, '
      '       w.cntr_type as cntr_type,'
      '       w.cntr_desc as cntr_desc,'
      '       w.eplant_id as eplant_id,'
      '       loc1.loc_desc as loc_desc_in,'
      '       loc2.loc_desc as loc_desc_out,'
      '       w.locations_id_in as locations_id_in,'
      '       w.locations_id as locations_id'
      '  from work_center w,'
      '       locations loc1,'
      '       locations loc2'
      ' where w.locations_id_in = loc1.id(+)'
      '   and w.locations_id = loc2.id(+)'
      '   and (w.locations_id_in is null'
      '        or'
      
        '        nvl(w.pickup_packages,0) = 0 and nvl(w.pickup_pallets,0)' +
        ' = 0)'
      '  '
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 241
    Top = 246
    object StringField4: TStringField
      DisplayLabel = 'Work Center #'
      DisplayWidth = 25
      FieldName = 'EQNO'
      Size = 60
    end
    object StringField5: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 60
      FieldName = 'CNTR_DESC'
      Size = 250
    end
    object StringField6: TStringField
      DisplayLabel = 'Center Type'
      FieldName = 'CNTR_TYPE'
    end
    object FloatField1: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.WORK_CENTER.ID'
      Visible = False
      Size = 0
    end
    object FloatField2: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'IQ.WORK_CENTER.EPLANT_ID'
      Size = 0
    end
    object StringField7: TStringField
      DisplayLabel = 'IN Transaction Location'
      FieldName = 'LOC_DESC_IN'
      FixedChar = True
      Size = 30
    end
    object StringField8: TStringField
      DisplayLabel = 'OUT Transaction Location'
      FieldName = 'LOC_DESC_OUT'
      FixedChar = True
      Size = 30
    end
    object FloatField3: TBCDField
      FieldName = 'LOCATIONS_ID_IN'
      Visible = False
      Size = 0
    end
    object FloatField4: TBCDField
      FieldName = 'LOCATIONS_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcStagingOUT: TDataSource
    DataSet = QryStagingOUT
    Left = 240
    Top = 192
  end
  object QryStagingOUT: TFDQuery
    BeforeInsert = PostParent
    AfterInsert = QryStagingOUTAfterInsert
    BeforeEdit = PostParent
    BeforePost = QryStagingOUTBeforePost
    AfterPost = ApplyUpdates
    AfterDelete = ApplyUpdates
    CachedUpdates = True
    MasterSource = SrcLocations
    MasterFields = 'ID'
    OnUpdateRecord = QryStagingOUTUpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select w.id,'
      '       w.eqno,'
      '       w.cntr_desc,'
      '       w.locations_id,'
      '       w.staging_hrs,'
      
        '       (select staging_hrs from params where rownum < 2) as stag' +
        'ing_hrs_params'
      '  from work_center w'
      ' where w.locations_id = :id'
      ' order by w.eqno')
    Left = 240
    Top = 216
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryStagingOUTID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.WORK_CENTER.ID'
      Visible = False
      Size = 0
    end
    object QryStagingOUTEQNO: TStringField
      DisplayLabel = 'Work Center #'
      DisplayWidth = 21
      FieldName = 'EQNO'
      Origin = 'IQ.WORK_CENTER.EQNO'
      ReadOnly = True
      FixedChar = True
      Size = 60
    end
    object QryStagingOUTCNTR_DESC: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 33
      FieldName = 'CNTR_DESC'
      Origin = 'IQ.WORK_CENTER.CNTR_DESC'
      ReadOnly = True
      Size = 250
    end
    object QryStagingOUTLOCATIONS_ID: TBCDField
      FieldName = 'LOCATIONS_ID'
      Origin = 'IQ.WORK_CENTER.LOCATIONS_ID'
      Visible = False
      Size = 0
    end
    object QryStagingOUTSTAGING_HRS: TFMTBCDField
      DisplayLabel = 'This Staging Hrs'
      DisplayWidth = 10
      FieldName = 'STAGING_HRS'
      Origin = 'IQ.WORK_CENTER.STAGING_HRS'
      Size = 6
    end
    object QryStagingOUTSTAGING_HRS_PARAMS: TFMTBCDField
      DisplayLabel = 'Params Staging Hrs'
      DisplayWidth = 10
      FieldName = 'STAGING_HRS_PARAMS'
      Origin = 'IQ.PARAMS.STAGING_HRS'
      ReadOnly = True
      Size = 38
    end
  end
  object SrcMilkRun: TDataSource
    DataSet = QryMilkRun
    Left = 280
    Top = 192
  end
  object QryMilkRun: TFDQuery
    BeforeInsert = PostParent
    AfterInsert = QryMilkRunAfterInsert
    BeforeEdit = PostParent
    AfterPost = ApplyUpdates
    AfterDelete = ApplyUpdates
    CachedUpdates = True
    MasterSource = SrcLocations
    MasterFields = 'ID'
    OnUpdateRecord = QryMilkRunUpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select d.id, '
      '       o.orderno,'
      '       a.itemno,'
      '       a.descrip,'
      '       a.rev,'
      '       a.class,'
      '       a.descrip2,'
      '       arcusto.custno,'
      '       arcusto.company,'
      '       ship_to.attn,'
      '       d.milk_run_locations_id'
      '  from ord_detail d,'
      '       orders o,'
      '       arinvt a,'
      '       arcusto,'
      '       ship_to'
      ' where d.milk_run_locations_id = :id'
      '   and d.orders_id = o.id'
      '   and d.arinvt_id = a.id(+)'
      '   and o.arcusto_id = arcusto.id(+)'
      '   and o.ship_to_id = ship_to.id(+)'
      ' order by '
      '       a.itemno')
    Left = 280
    Top = 216
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryMilkRunITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      ReadOnly = True
      FixedChar = True
      Size = 50
    end
    object QryMilkRunDESCRIP: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      ReadOnly = True
      Size = 100
    end
    object QryMilkRunORDERNO: TStringField
      DisplayLabel = 'Order #'
      DisplayWidth = 15
      FieldName = 'ORDERNO'
      ReadOnly = True
      Size = 15
    end
    object QryMilkRunCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object QryMilkRunATTN: TStringField
      DisplayLabel = 'Ship To'
      DisplayWidth = 30
      FieldName = 'ATTN'
      ReadOnly = True
      Size = 60
    end
    object QryMilkRunREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 15
      FieldName = 'REV'
      ReadOnly = True
      FixedChar = True
      Size = 15
    end
    object QryMilkRunCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 4
      FieldName = 'CLASS'
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object QryMilkRunDESCRIP2: TStringField
      DisplayLabel = 'Item Ext Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP2'
      ReadOnly = True
      Size = 100
    end
    object QryMilkRunCOMPANY: TStringField
      DisplayLabel = 'Customer Name'
      DisplayWidth = 35
      FieldName = 'COMPANY'
      ReadOnly = True
      Size = 60
    end
    object QryMilkRunID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryMilkRunMILK_RUN_LOCATIONS_ID: TBCDField
      FieldName = 'MILK_RUN_LOCATIONS_ID'
      Visible = False
      Size = 0
    end
  end
  object PkOrdDetail: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select d.id as id, '
      '       o.orderno as orderno,'
      '       a.itemno as itemno,'
      '       a.descrip as descrip,'
      '       a.rev as rev,'
      '       a.class as class,'
      '       a.descrip2 as descrip2,'
      '       arcusto.custno as custno,'
      '       arcusto.company as company,'
      '       ship_to.attn as attn,'
      '       loc.loc_desc as loc_desc,'
      '       d.milk_run_locations_id'
      '  from ord_detail d,'
      '       orders o,'
      '       arinvt a,'
      '       arcusto,'
      '       ship_to,'
      '       locations loc'
      ' where '
      '       d.orders_id = o.id'
      '   and d.arinvt_id = a.id(+)'
      '   and o.arcusto_id = arcusto.id(+)'
      '   and o.ship_to_id = ship_to.id(+)'
      '   and d.milk_run_locations_id = loc.id(+)'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 279
    Top = 246
    object PkOrdDetailID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkOrdDetailORDERNO: TStringField
      DisplayLabel = 'Order #'
      FieldName = 'ORDERNO'
      Size = 15
    end
    object PkOrdDetailITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      FixedChar = True
      Size = 50
    end
    object PkOrdDetailCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      FieldName = 'CUSTNO'
      FixedChar = True
      Size = 10
    end
    object PkOrdDetailATTN: TStringField
      DisplayLabel = 'Ship To'
      DisplayWidth = 40
      FieldName = 'ATTN'
      Size = 60
    end
    object PkOrdDetailLOC_DESC: TStringField
      DisplayLabel = 'Milk Run Location'
      FieldName = 'LOC_DESC'
      FixedChar = True
      Size = 30
    end
    object PkOrdDetailDESCRIP: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Size = 100
    end
    object PkOrdDetailREV: TStringField
      DisplayLabel = 'Rev'
      FieldName = 'REV'
      FixedChar = True
      Size = 15
    end
    object PkOrdDetailCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      FixedChar = True
      Size = 2
    end
    object PkOrdDetailDESCRIP2: TStringField
      DisplayLabel = 'Item Ext Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object PkOrdDetailCOMPANY: TStringField
      DisplayLabel = 'Customer Name'
      DisplayWidth = 40
      FieldName = 'COMPANY'
      Size = 60
    end
  end
  object PkInvTransPlan: TIQWebHpick
    BeforeOpen = PkInvTransPlanBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select p.id as id,'
      '       p.source_module as source_module,'
      '       p.source as source,'
      '       p.kind as kind,'
      '       i.arinvt_id as arinvt_id,'
      '       a.class as class,'
      '       a.itemno as itemno,'
      '       a.descrip as descrip,'
      '       a.descrip2 as descrip2,'
      '       a.rev as rev,'
      '       i.qty as qty,'
      '       case nvl(i.pk_unit_type, '#39'C'#39')'
      '            when '#39'E'#39' then '#39'LOOSE'#39
      '            when '#39'C'#39' then '#39'CASE'#39
      '            when '#39'P'#39' then '#39'PALLET'#39
      '       end as pk_unit_type,'
      '       i.units as units'
      ''
      '  from inv_trans_plan p,'
      '       inv_trans_item i,'
      '       arinvt a'
      '       '
      ' where p.id = i.inv_trans_plan_id'
      '   and exists (select 1 '
      '                 from inv_trans_locations '
      '                where locations_id = :locations_id'
      '                  and inv_trans_item_id = i.id)'
      '   and i.arinvt_id = a.id'
      ''
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 160
    Top = 300
    ParamData = <
      item
        Name = 'locations_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkInvTransPlanID: TBCDField
      DisplayLabel = 'Plan ID'
      FieldName = 'ID'
      Size = 0
    end
    object PkInvTransPlanSOURCE_MODULE: TStringField
      DisplayLabel = 'Module'
      FieldName = 'SOURCE_MODULE'
    end
    object PkInvTransPlanSOURCE: TStringField
      DisplayLabel = 'Source'
      DisplayWidth = 20
      FieldName = 'SOURCE'
      Size = 30
    end
    object PkInvTransPlanKIND: TStringField
      DisplayLabel = 'Kind'
      FieldName = 'KIND'
      Size = 10
    end
    object PkInvTransPlanARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object PkInvTransPlanITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      FixedChar = True
      Size = 50
    end
    object PkInvTransPlanDESCRIP: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Size = 100
    end
    object PkInvTransPlanQTY: TFMTBCDField
      DisplayLabel = 'Qty'
      FieldName = 'QTY'
      Size = 6
    end
    object PkInvTransPlanPK_UNIT_TYPE: TStringField
      DisplayLabel = 'Pk Unit Type'
      FieldName = 'PK_UNIT_TYPE'
      Size = 6
    end
    object PkInvTransPlanUNITS: TBCDField
      DisplayLabel = 'Pk Units'
      FieldName = 'UNITS'
      Size = 0
    end
    object PkInvTransPlanDESCRIP2: TStringField
      DisplayLabel = 'Item Ext Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object PkInvTransPlanCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      FixedChar = True
      Size = 2
    end
    object PkInvTransPlanREV: TStringField
      DisplayLabel = 'Rev'
      FieldName = 'REV'
      FixedChar = True
      Size = 15
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'QryLocations'
      'DBNavigator'
      'sbtnTransPlan'
      'navStagingIn'
      'NavMilkRun'
      'QryStagingIN'
      'QryStagingOUT'
      'QryMilkRun'
      'Parameters1'
      'Aisles1'
      'Zones1'
      'LocationTypes1'
      'cmbDefaultNonConfirmCode'
      'SelectNonConformCode1'
      'ClearNonConformCode1'
      '')
    SecurityCode = 'LOCATIONSTABLE'
    AfterApply = SRAfterApply
    Left = 624
    Top = 356
  end
  object PkNonConform: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id, code, descrip from non_conform')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 128
    Top = 300
    object PkNonConformID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.NON_CONFORM.ID'
      Visible = False
      Size = 0
    end
    object PkNonConformCODE: TStringField
      DisplayLabel = 'Non-Conform Code'
      FieldName = 'CODE'
      Origin = 'IQ.NON_CONFORM.CODE'
      Size = 10
    end
    object PkNonConformDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'IQ.NON_CONFORM.DESCRIP'
      Size = 30
    end
  end
  object PNonConformCode: TUniPopupMenu
    Left = 320
    Top = 248
    object SelectNonConformCode1: TUniMenuItem
      Caption = 'Select'
      Default = True
      OnClick = SelectNonConformCode1Click
    end
    object ClearNonConformCode1: TUniMenuItem
      Caption = 'Clear'
      OnClick = ClearNonConformCode1Click
    end
  end
end
