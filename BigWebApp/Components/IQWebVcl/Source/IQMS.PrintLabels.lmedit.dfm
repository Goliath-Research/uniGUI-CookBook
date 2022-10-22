object FrmLabels: TFrmLabels
  Left = 236
  Top = 166
  HelpContext = 1004606
  ClientHeight = 552
  ClientWidth = 594
  Caption = 'Label Maintenance'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 281
    Width = 594
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object PnlToolbarUpper: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 594
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object SBToggleHeader: TUniSpeedButton
      Left = 26
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Toggle Bank Info Grid/Form'
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
      TabOrder = 1
      OnClick = SBToggleHeaderClick
    end
    object SBSearch: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Search... '
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
      TabOrder = 2
      OnClick = SBSearchClick
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 27
    Width = 594
    Height = 254
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object PC: TUniPageControl
      Left = 1
      Top = 1
      Width = 592
      Height = 252
      Hint = ''
      ActivePage = TabForm
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabForm: TUniTabSheet
        Hint = ''
        TabVisible = False
        Caption = 'TabForm'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        object Label1: TUniLabel
          Left = 8
          Top = 12
          Width = 74
          Height = 13
          Hint = ''
          Caption = 'Label File Name'
          TabOrder = 9
        end
        object Label2: TUniLabel
          Left = 8
          Top = 36
          Width = 46
          Height = 13
          Hint = ''
          Caption = 'Customer'
          TabOrder = 10
        end
        object Label3: TUniLabel
          Left = 327
          Top = 12
          Width = 77
          Height = 13
          Hint = ''
          Caption = 'Label Menu Title'
          TabOrder = 11
        end
        object Label4: TUniLabel
          Left = 327
          Top = 36
          Width = 52
          Height = 13
          Hint = ''
          Caption = 'Label Type'
          TabOrder = 12
        end
        object Label5: TUniLabel
          Left = 327
          Top = 60
          Width = 48
          Height = 13
          Hint = ''
          Caption = 'Label Kind'
          TabOrder = 13
        end
        object Label6: TUniLabel
          Left = 8
          Top = 60
          Width = 102
          Height = 13
          Hint = ''
          Caption = 'Remote Server Name'
          TabOrder = 14
        end
        object Label7: TUniLabel
          Left = 8
          Top = 84
          Width = 46
          Height = 13
          Hint = ''
          Caption = 'COM Port'
          TabOrder = 15
        end
        object Label8: TUniLabel
          Left = 327
          Top = 84
          Width = 60
          Height = 13
          Hint = ''
          Caption = 'EPlant Name'
          TabOrder = 16
        end
        object sbtnEPlant: TUniSpeedButton
          Left = 550
          Top = 79
          Width = 22
          Height = 22
          Hint = 'Assign EPlant'
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
          ParentColor = False
          Color = clWindow
          TabOrder = 17
          OnClick = sbtnEPlantClick
        end
        object Label9: TUniLabel
          Left = 8
          Top = 108
          Width = 104
          Height = 13
          Hint = ''
          Caption = 'CRW Duplicate Labels'
          TabOrder = 18
        end
        object sbtnArcusto: TUniSpeedButton
          Left = 288
          Top = 33
          Width = 22
          Height = 22
          Hint = 'Search... '
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
          TabOrder = 19
          OnClick = SelectCustomer1Click
        end
        object wwCustomerForm: TUniDBLookupComboBox
          Left = 141
          Top = 32
          Width = 143
          Height = 21
          Hint = ''
          ListField = 'COMPANY'
          ListSource = SrcArcusto
          KeyField = 'ID'
          ListFieldIndex = 0
          DataField = 'ARCUSTO_ID'
          DataSource = SrcLabels
          TabOrder = 1
          Color = clWindow
          OnDropDown = wwCustomerGridDropDown
        end
        object EditLabel: TUniDBEdit
          Left = 141
          Top = 8
          Width = 143
          Height = 21
          Hint = ''
          DataField = 'LABEL_FILE'
          DataSource = SrcLabels
          TabOrder = 0
        end
        object EditMenu: TUniDBEdit
          Left = 424
          Top = 8
          Width = 121
          Height = 21
          Hint = ''
          DataField = 'LABEL_MENU_NAME'
          DataSource = SrcLabels
          TabOrder = 4
        end
        object CBType: TUniDBComboBox
          Left = 424
          Top = 32
          Width = 121
          Height = 21
          Hint = ''
          DataField = 'LABEL_TYPE'
          DataSource = SrcLabels
          Style = csDropDownList
          Items.Strings = (
            'MANUFACTURED'
            'PURCHASED'
            'LOAD')
          TabOrder = 5
        end
        object cbKind: TUniDBComboBox
          Left = 424
          Top = 56
          Width = 121
          Height = 21
          Hint = ''
          DataField = 'LABEL_KIND'
          DataSource = SrcLabels
          Style = csDropDownList
          Items.Strings = (
            'RF'
            'GENERAL')
          TabOrder = 6
        end
        object wwDBComboBox2: TUniDBComboBox
          Left = 141
          Top = 80
          Width = 65
          Height = 21
          Hint = ''
          DataField = 'COMM_PORT'
          DataSource = SrcLabels
          Style = csDropDownList
          Items.Strings = (
            'Default'
            'COM1'
            'COM2'
            'COM3'
            'COM4'
            'LPT1'
            'LPT2'
            'LPT3')
          ItemIndex = 2
          TabOrder = 3
        end
        object dbePlantName: TUniDBEdit
          Left = 424
          Top = 80
          Width = 121
          Height = 21
          Hint = ''
          DataField = 'EPlant_Name'
          DataSource = SrcLabels
          TabOrder = 7
          TabStop = False
          Color = clBtnFace
        end
        object wwDBComboBox1: TUniDBComboBox
          Left = 141
          Top = 56
          Width = 143
          Height = 21
          Hint = ''
          DataField = 'REMOTE_SERVER'
          DataSource = SrcLabels
          TabOrder = 2
          OnDropDown = wwNetNamesDropDown
        end
        object DBEdit1: TUniDBEdit
          Left = 141
          Top = 104
          Width = 64
          Height = 21
          Hint = ''
          DataField = 'CRW_LABEL_COPIES'
          DataSource = SrcLabels
          TabOrder = 8
        end
      end
      object TabGrid: TUniTabSheet
        Hint = ''
        TabVisible = False
        Caption = 'TabGrid'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        inline GridHeader: TIQUniGridControl
          Left = 0
          Top = 0
          Width = 584
          Height = 224
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          ExplicitWidth = 584
          ExplicitHeight = 224
          inherited PageControl: TUniPageControl
            Width = 584
            Height = 195
            ExplicitWidth = 584
            ExplicitHeight = 195
          end
          inherited TopToolBar: TUniToolBar
            Width = 584
            TabOrder = 9
          end
        end
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 284
    Width = 594
    Height = 230
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    Caption = ''
    object bvSpacerDetail1: TUniPanel
      Left = 1
      Top = 1
      Width = 592
      Height = 3
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
    end
    object PnlDetailGrid: TUniPanel
      Left = 1
      Top = 4
      Width = 592
      Height = 225
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      inline GridDetail: TIQUniGridControl
        Left = 1
        Top = 1
        Width = 590
        Height = 223
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 590
        ExplicitHeight = 223
        inherited PageControl: TUniPageControl
          Width = 590
          Height = 194
          ExplicitWidth = 590
          ExplicitHeight = 194
        end
        inherited TopToolBar: TUniToolBar
          Width = 590
        end
      end
    end
  end
  object Panel5: TUniPanel
    Left = 0
    Top = 514
    Width = 594
    Height = 38
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Panel6: TUniPanel
      Left = 350
      Top = 1
      Width = 243
      Height = 36
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnCreate: TUniButton
        Left = 123
        Top = 7
        Width = 112
        Height = 25
        Hint = ''
        Caption = 'Create DBF File'
        TabOrder = 1
        OnClick = BtnCreateClick
      end
      object BtnReset: TUniButton
        Left = 2
        Top = 7
        Width = 112
        Height = 25
        Hint = ''
        Caption = 'Reset to Defaults'
        TabOrder = 2
        OnClick = BtnResetClick
      end
    end
    object Panel7: TUniPanel
      Left = 1
      Top = 1
      Width = 281
      Height = 36
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 1
      Caption = ''
      object Label37: TUniLabel
        Left = 10
        Top = 10
        Width = 60
        Height = 13
        Hint = ''
        Caption = 'LM Directory'
        TabOrder = 2
      end
      object sbtnSelectDir: TUniSpeedButton
        Left = 255
        Top = 6
        Width = 22
        Height = 22
        Hint = 'Select directory'
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
        Font.Style = [fsBold]
        ParentColor = False
        Color = clWindow
        TabOrder = 3
        OnClick = sbtnSelectDirClick
      end
      object EditLMDir: TUniDBEdit
        Left = 87
        Top = 6
        Width = 165
        Height = 21
        Hint = ''
        DataField = 'LM_DIRECTORY'
        DataSource = SrcParams
        TabOrder = 0
        ReadOnly = True
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 180
    object File1: TUniMenuItem
      Caption = '&File'
      object New1: TUniMenuItem
        Caption = '&New'
        OnClick = New1Click
      end
      object Delete1: TUniMenuItem
        Caption = '&Delete'
        OnClick = Delete1Click
      end
      object N2: TUniMenuItem
        Caption = '-'
      end
      object ResettoDefaults1: TUniMenuItem
        Caption = '&Reset to defaults'
        OnClick = BtnResetClick
      end
      object CreateDBFFile1: TUniMenuItem
        Caption = '&Create DBF File'
        OnClick = BtnCreateClick
      end
      object N3: TUniMenuItem
        Caption = '-'
      end
      object Search1: TUniMenuItem
        Caption = 'Search...'
        OnClick = SBSearchClick
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Edit1: TUniMenuItem
      Caption = 'Edit'
      object LabelTemplates1: TUniMenuItem
        Caption = 'Label Designer'
        OnClick = LabelTemplates1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        OnClick = Contents1Click
      end
    end
  end
  object SrcLabelsDtl: TDataSource
    DataSet = TblLabelsDtl
    OnDataChange = SrcLabelsDtlDataChange
    Left = 284
    Top = 185
  end
  object TblLabelsDtl: TFDTable
    BeforeInsert = TblLabelsDtlBeforeDelete
    BeforeEdit = TblLabelsDtlBeforeEdit
    BeforePost = TblLabelsDtlBeforePost
    BeforeDelete = TblLabelsDtlBeforeDelete
    IndexFieldNames = 'LM_LABELS_ID;FIELD_NAME'
    MasterSource = SrcLabels
    MasterFields = 'ID'
    ConnectionName = 'IQFD'
    UpdateOptions.UpdateTableName = 'LM_LABELS_DETAIL'
    TableName = 'LM_LABELS_DETAIL'
    Left = 304
    Top = 184
    object TblLabelsDtlFIELD_NAME: TStringField
      DisplayLabel = 'Field Name'
      DisplayWidth = 20
      FieldName = 'FIELD_NAME'
      Size = 10
    end
    object TblLabelsDtlFIELD_TYPE: TStringField
      DisplayLabel = 'Field Type'
      DisplayWidth = 21
      FieldName = 'FIELD_TYPE'
      Size = 9
    end
    object TblLabelsDtlWIDTH: TBCDField
      DisplayLabel = 'Width'
      DisplayWidth = 10
      FieldName = 'WIDTH'
      Size = 0
    end
    object TblLabelsDtlDEC: TBCDField
      DisplayLabel = 'Dec.'
      DisplayWidth = 7
      FieldName = 'DEC'
      Size = 0
    end
    object TblLabelsDtlACT_WIDTH: TBCDField
      DisplayLabel = 'Actual Width'
      DisplayWidth = 14
      FieldName = 'ACT_WIDTH'
      Size = 0
    end
    object TblLabelsDtlLM_LABELS_ID: TBCDField
      FieldName = 'LM_LABELS_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcLabels: TDataSource
    DataSet = TblLabels
    OnDataChange = SrcLabelsDataChange
    Left = 348
    Top = 185
  end
  object TblLabels: TFDTable
    BeforeOpen = AssignEPlantFilter
    BeforePost = TblLabelsBeforePost
    AfterPost = TblLabelsAfterPost
    BeforeDelete = TblLabelsBeforeDelete
    Filtered = True
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'LM_LABELS'
    TableName = 'LM_LABELS'
    Left = 369
    Top = 186
    object TblLabelsCustomer: TStringField
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'Customer'
      LookupDataSet = TblArcusto
      LookupKeyFields = 'ID'
      LookupResultField = 'COMPANY'
      KeyFields = 'ARCUSTO_ID'
      Lookup = True
    end
    object TblLabelsLABEL_FILE: TStringField
      DisplayLabel = 'Label File Name'
      DisplayWidth = 19
      FieldName = 'LABEL_FILE'
      Size = 25
    end
    object TblLabelsLABEL_MENU_NAME: TStringField
      DisplayLabel = 'Menu Title'
      DisplayWidth = 14
      FieldName = 'LABEL_MENU_NAME'
      Required = True
      Size = 25
    end
    object TblLabelsLABEL_TYPE: TStringField
      DisplayLabel = 'Label Type'
      DisplayWidth = 18
      FieldName = 'LABEL_TYPE'
      Required = True
      Size = 25
    end
    object TblLabelsLABEL_KIND: TStringField
      DisplayLabel = 'Label Kind'
      DisplayWidth = 10
      FieldName = 'LABEL_KIND'
      Size = 10
    end
    object TblLabelsREMOTE_SERVER: TStringField
      DisplayLabel = 'Remote Server Name'
      DisplayWidth = 20
      FieldName = 'REMOTE_SERVER'
      Size = 50
    end
    object TblLabelsCOMM_PORT: TStringField
      DisplayLabel = 'Com Port'
      DisplayWidth = 10
      FieldName = 'COMM_PORT'
      Size = 10
    end
    object TblLabelsREPORT_NAME: TStringField
      DisplayLabel = 'CRW Report Name'
      DisplayWidth = 21
      FieldName = 'REPORT_NAME'
      Size = 100
    end
    object TblLabelsCRW_LABEL_COPIES: TBCDField
      DisplayLabel = 'CRW Duplicate Labels'
      DisplayWidth = 19
      FieldName = 'CRW_LABEL_COPIES'
      Size = 0
    end
    object TblLabelsEPlant_Name: TStringField
      DisplayLabel = 'EPlant Name'
      DisplayWidth = 18
      FieldKind = fkLookup
      FieldName = 'EPlant_Name'
      LookupDataSet = QryEPlant
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIP'
      KeyFields = 'EPLANT_ID'
      ReadOnly = True
      Lookup = True
    end
    object TblLabelsVERIFY_REPRINT: TStringField
      DisplayLabel = 'Verify Reprint'
      DisplayWidth = 12
      FieldName = 'VERIFY_REPRINT'
      FixedChar = True
      Size = 1
    end
    object TblLabelsTemplate: TStringField
      DisplayLabel = 'Label Template'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'Template'
      LookupDataSet = TblLabelTemplate
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIP'
      KeyFields = 'LABEL_TEMPLATE_ID'
      OnChange = TblLabelsTemplateChange
      Lookup = True
    end
    object TblLabelsLABEL_TEMPLATE_ID: TBCDField
      DisplayLabel = 'Label Template'
      DisplayWidth = 10
      FieldName = 'LABEL_TEMPLATE_ID'
      Visible = False
      Size = 0
    end
    object TblLabelsID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object TblLabelsARCUSTO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object TblLabelsEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
  end
  object QryArcusto: TFDQuery
    Filtered = True
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      
        'select id, company, custno, addr1, addr2, city, state, zip, pk_h' +
        'ide'
      '  from v_arcusto'
      ' order by company'
      ' ')
    Left = 192
    Top = 188
    object QryArcustoCOMPANY: TStringField
      DisplayLabel = 'Customer'
      DisplayWidth = 20
      FieldName = 'COMPANY'
      Size = 60
    end
    object QryArcustoCUSTNO: TStringField
      DisplayLabel = 'Cust#'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Size = 10
    end
    object QryArcustoADDR1: TStringField
      DisplayLabel = 'Addr.1'
      DisplayWidth = 20
      FieldName = 'ADDR1'
      Size = 60
    end
    object QryArcustoADDR2: TStringField
      DisplayLabel = 'Addr.2'
      DisplayWidth = 20
      FieldName = 'ADDR2'
      Size = 60
    end
    object QryArcustoCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 15
      FieldName = 'CITY'
      Size = 30
    end
    object QryArcustoSTATE: TStringField
      DisplayLabel = 'State'
      DisplayWidth = 2
      FieldName = 'STATE'
    end
    object QryArcustoZIP: TStringField
      DisplayWidth = 10
      FieldName = 'ZIP'
      Size = 10
    end
    object QryArcustoID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryArcustoPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.V_ARCUSTO.PK_HIDE'
      FixedChar = True
      Size = 1
    end
  end
  object TblLMInv: TFDTable
    ConnectionName = 'IQFD'
    UpdateOptions.UpdateTableName = 'LMINVTRY'
    TableName = 'LMINVTRY'
    Left = 144
    Top = 188
  end
  object TblLMMat: TFDTable
    ConnectionName = 'IQFD'
    UpdateOptions.UpdateTableName = 'LMMATRL'
    TableName = 'LMMATRL'
    Left = 112
    Top = 188
  end
  object TblArcusto: TFDTable
    IndexName = 'PK_ARCUSTO'
    ConnectionName = 'IQFD'
    UpdateOptions.UpdateTableName = 'ARCUSTO'
    TableName = 'ARCUSTO'
    Left = 232
    Top = 188
    object TblArcustoCOMPANY: TStringField
      DisplayLabel = 'Customer'
      DisplayWidth = 20
      FieldName = 'COMPANY'
      Size = 60
    end
    object TblArcustoCUSTNO: TStringField
      DisplayLabel = 'Cust#'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Size = 10
    end
    object TblArcustoADDR1: TStringField
      DisplayLabel = 'Addr.1'
      DisplayWidth = 15
      FieldName = 'ADDR1'
      Size = 60
    end
    object TblArcustoADDR2: TStringField
      DisplayLabel = 'Addr.2'
      DisplayWidth = 15
      FieldName = 'ADDR2'
      Size = 60
    end
    object TblArcustoCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 15
      FieldName = 'CITY'
      Size = 30
    end
    object TblArcustoSTATE: TStringField
      DisplayLabel = 'State'
      DisplayWidth = 2
      FieldName = 'STATE'
    end
    object TblArcustoZIP: TStringField
      DisplayWidth = 10
      FieldName = 'ZIP'
      Size = 10
    end
    object TblArcustoID: TBCDField
      FieldName = 'ID'
      Required = True
      Visible = False
      Size = 0
    end
  end
  object SrcParams: TDataSource
    DataSet = TblParams
    Left = 353
    Top = 217
  end
  object TblParams: TFDTable
    ConnectionName = 'IQFD'
    UpdateOptions.UpdateTableName = 'PARAMS'
    TableName = 'PARAMS'
    Left = 369
    Top = 218
  end
  object PCustomer: TUniPopupMenu
    Left = 208
    object SelectCustomer1: TUniMenuItem
      Caption = 'Select Customer from Pick List'
      OnClick = SelectCustomer1Click
    end
  end
  object QryEPlant: TFDQuery
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       name,'
      '       '#39'['#39' || ID || '#39']  '#39' || name as descrip'
      '  from eplant')
    Left = 428
    Top = 187
  end
  object popmHeader: TUniPopupMenu
    Left = 254
    Top = 114
    object Trace1: TUniMenuItem
      Caption = 'Trace'
      OnClick = Trace1Click
    end
    object N4: TUniMenuItem
      Caption = '-'
    end
    object CreateDBFFileforEveryLMLabel1: TUniMenuItem
      Caption = 'Create DBF File for every LM label'
      OnClick = CreateDBFFileforEveryLMLabel1Click
    end
  end
  object TblLabelTemplate: TFDTable
    ConnectionName = 'IQFD'
    UpdateOptions.UpdateTableName = 'LABEL_TEMPLATE'
    TableName = 'LABEL_TEMPLATE'
    Left = 424
    Top = 232
  end
  object SrcArcusto: TDataSource
    DataSet = QryArcusto
    Left = 45
    Top = 220
  end
  object UniFileUpload1: TUniFileUpload
    Title = 'Upload'
    Messages.Uploading = 'Uploading...'
    Messages.PleaseWait = 'Please Wait'
    Messages.Cancel = 'Cancel'
    Messages.Processing = 'Processing...'
    Messages.UploadError = 'Upload Error'
    Messages.Upload = 'Upload'
    Messages.NoFileError = 'Please Select a File'
    Messages.BrowseText = 'Browse...'
    Left = 288
    Top = 288
  end
end
