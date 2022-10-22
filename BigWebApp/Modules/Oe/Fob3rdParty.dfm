object FrmFobThirdParty: TFrmFobThirdParty
  Left = 0
  Top = 0
  ClientHeight = 444
  ClientWidth = 671
  Caption = 'Third Party Billing Info'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlToolbar: TUniPanel
    Left = 0
    Top = 0
    Width = 671
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object SBSearch: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Search Purchase Orders'
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
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      OnClick = SBSearchClick
    end
    object SBGridView: TUniSpeedButton
      Left = 25
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Toggle Form/Table View'
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
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      OnClick = SBGridViewClick
    end
    object Nav: TUniDBNavigator
      Left = 446
      Top = 1
      Width = 225
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = SrcFob
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object Panel4: TUniPanel
    Left = 0
    Top = 27
    Width = 671
    Height = 417
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PC: TUniPageControl
      Left = 1
      Top = 1
      Width = 669
      Height = 415
      Hint = ''
      ActivePage = TabForm
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabForm: TUniTabSheet
        Hint = ''
        Caption = 'TabForm'
        object PnlFormView: TUniPanel
          Tag = 1999
          Left = 0
          Top = 0
          Width = 661
          Height = 387
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object Splitter2: TUniSplitter
            Left = 273
            Top = 0
            Width = 6
            Height = 387
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object PnlClient01: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 273
            Height = 385
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object Splitter1: TUniSplitter
              Left = 89
              Top = 0
              Width = 6
              Height = 385
              Hint = ''
              Align = alLeft
              ParentColor = False
              Color = clBtnFace
            end
            object PnlLeft01: TUniPanel
              Tag = 1999
              Left = 1
              Top = 1
              Width = 89
              Height = 383
              Hint = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 0
              Caption = ''
              object Label36: TUniLabel
                Left = 8
                Top = 12
                Width = 45
                Height = 13
                Hint = ''
                Caption = 'Company'
                TabOrder = 1
              end
              object Label37: TUniLabel
                Left = 8
                Top = 36
                Width = 48
                Height = 13
                Hint = ''
                Caption = 'Address 1'
                TabOrder = 2
              end
              object Label38: TUniLabel
                Left = 8
                Top = 60
                Width = 48
                Height = 13
                Hint = ''
                Caption = 'Address 2'
                TabOrder = 3
              end
              object Label39: TUniLabel
                Left = 8
                Top = 84
                Width = 48
                Height = 13
                Hint = ''
                Caption = 'Address 3'
                TabOrder = 4
              end
              object Label40: TUniLabel
                Left = 8
                Top = 108
                Width = 19
                Height = 13
                Hint = ''
                Caption = 'City'
                TabOrder = 5
              end
              object Label41: TUniLabel
                Left = 8
                Top = 155
                Width = 75
                Height = 13
                Hint = ''
                Caption = 'State or Region'
                TabOrder = 6
              end
              object Label56: TUniLabel
                Left = 8
                Top = 131
                Width = 39
                Height = 13
                Hint = ''
                Caption = 'Country'
                TabOrder = 7
              end
              object Label42: TUniLabel
                Left = 8
                Top = 180
                Width = 57
                Height = 13
                Hint = ''
                Caption = 'Postal Code'
                TabOrder = 8
              end
            end
            object PnlClient02: TUniPanel
              Tag = 1999
              Left = 95
              Top = 1
              Width = 178
              Height = 383
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              DesignSize = (
                178
                383)
              object dbeShipCompany: TUniDBEdit
                Left = 1
                Top = 8
                Width = 174
                Height = 21
                Hint = ''
                DataField = 'ATTN'
                DataSource = SrcFob
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Color = clBlack
                TabOrder = 0
              end
              object dbeShipAddr1: TUniDBEdit
                Left = 1
                Top = 32
                Width = 174
                Height = 21
                Hint = ''
                DataField = 'ADDR1'
                DataSource = SrcFob
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Color = clBlack
                TabOrder = 1
              end
              object dbeShipAddr2: TUniDBEdit
                Left = 1
                Top = 56
                Width = 174
                Height = 21
                Hint = ''
                DataField = 'ADDR2'
                DataSource = SrcFob
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Color = clBlack
                TabOrder = 2
              end
              object dbeShipAddr3: TUniDBEdit
                Left = 1
                Top = 80
                Width = 174
                Height = 21
                Hint = ''
                DataField = 'ADDR3'
                DataSource = SrcFob
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Color = clBlack
                TabOrder = 3
              end
              object dbeShipCity: TUniDBEdit
                Left = 1
                Top = 104
                Width = 174
                Height = 21
                Hint = ''
                DataField = 'CITY'
                DataSource = SrcFob
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Color = clBlack
                TabOrder = 4
              end
              object dbcShipState: TUniDBComboBox
                Left = 1
                Top = 152
                Width = 73
                Height = 21
                Hint = ''
                DataField = 'STATE'
                DataSource = SrcFob
                ParentFont = False
                Font.Color = clBlack
                TabOrder = 6
              end
              object dbeShipCountry: TUniDBComboBox
                Left = 1
                Top = 128
                Width = 177
                Height = 21
                Hint = ''
                Anchors = [akLeft, akTop, akRight]
                DataField = 'COUNTRY'
                DataSource = SrcFob
                TabOrder = 5
              end
              object dbeShipZIP: TUniDBEdit
                Left = 1
                Top = 176
                Width = 113
                Height = 21
                Hint = ''
                DataField = 'ZIP'
                DataSource = SrcFob
                ParentFont = False
                Font.Color = clBlack
                TabOrder = 7
              end
            end
          end
          object PnlClient03: TUniPanel
            Tag = 1999
            Left = 279
            Top = 1
            Width = 382
            Height = 385
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            object Splitter3: TUniSplitter
              Left = 97
              Top = 0
              Width = 6
              Height = 385
              Hint = ''
              Align = alLeft
              ParentColor = False
              Color = clBtnFace
            end
            object PnlLeft02: TUniPanel
              Tag = 1999
              Left = 1
              Top = 1
              Width = 97
              Height = 383
              Hint = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 0
              Caption = ''
              object Label57: TUniLabel
                Left = 8
                Top = 12
                Width = 38
                Height = 13
                Hint = ''
                Caption = 'Contact'
                TabOrder = 1
              end
              object Label58: TUniLabel
                Left = 8
                Top = 60
                Width = 50
                Height = 13
                Hint = ''
                Caption = 'Telephone'
                TabOrder = 2
              end
              object Label59: TUniLabel
                Left = 8
                Top = 108
                Width = 18
                Height = 13
                Hint = ''
                Caption = 'Fax'
                TabOrder = 3
              end
              object Label65: TUniLabel
                Left = 8
                Top = 84
                Width = 47
                Height = 13
                Hint = ''
                Caption = 'Extension'
                TabOrder = 4
              end
            end
            object PnlClient04: TUniPanel
              Tag = 1999
              Left = 103
              Top = 1
              Width = 279
              Height = 383
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              DesignSize = (
                279
                383)
              object dbchkUSAmaskShipTo: TUniDBCheckBox
                Left = 1
                Top = 32
                Width = 97
                Height = 22
                Hint = 'Use USA data mask for phone and fax numbers'
                DataField = 'USE_USA_MASK'
                DataSource = SrcFob
                ValueChecked = 'Y'
                ValueUnchecked = 'N'
                Caption = 'Use USA mask'
                TabOrder = 1
              end
              object dbeShipPhone: TUniDBEdit
                Left = 1
                Top = 56
                Width = 116
                Height = 21
                Hint = ''
                DataField = 'PHONE_NUMBER'
                DataSource = SrcFob
                TabOrder = 2
              end
              object dbeShipFax: TUniDBEdit
                Left = 1
                Top = 104
                Width = 116
                Height = 21
                Hint = ''
                DataField = 'FAX'
                DataSource = SrcFob
                TabOrder = 4
              end
              object dbeShipToExtension: TUniDBEdit
                Left = 1
                Top = 80
                Width = 38
                Height = 21
                Hint = ''
                DataField = 'EXT'
                DataSource = SrcFob
                TabOrder = 3
              end
              object dbeShipContact: TUniDBEdit
                Left = 3
                Top = 5
                Width = 272
                Height = 21
                Hint = ''
                DataField = 'PRIME_CONTACT'
                DataSource = SrcFob
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
              end
            end
          end
        end
      end
      object TabGrid: TUniTabSheet
        Hint = ''
        ImageIndex = 1
        Caption = 'TabGrid'
        object Grid: TIQUniGridControl
          Left = 0
          Top = 0
          Width = 661
          Height = 387
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 444
          IQComponents.Grid.Height = 301
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcFob
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
          IQComponents.Navigator.DataSource = SrcFob
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 444
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 301
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcFob
          Columns = <
            item
              FieldName = 'PRIME_CONTACT'
              Title.Caption = 'Contact'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ATTN'
              Title.Caption = 'Company'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ADDR1'
              Title.Caption = 'Address 1'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ADDR2'
              Title.Caption = 'Address 2'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ADDR3'
              Title.Caption = 'Address 3'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'CITY'
              Title.Caption = 'City'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'COUNTRY'
              Title.Caption = 'Country'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'STATE'
              Title.Caption = 'State or Region'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ZIP'
              Title.Caption = 'Postal Code'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'PHONE_NUMBER'
              Title.Caption = 'Telephone'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'FAX'
              Title.Caption = 'Fax'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'EXT'
              Title.Caption = 'Extention'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'USE_USA_MASK'
              Title.Caption = 'Use USA Mask'
              Width = 64
              CheckBoxField.FieldValues = 'Y;N'
            end>
          Marker = 0
        end
      end
    end
  end
  object SrcFob: TDataSource
    DataSet = QryFOB
    Left = 224
  end
  object MainMenu1: TUniMainMenu
    Left = 344
    object File1: TUniMenuItem
      Caption = '&File'
      object New1: TUniMenuItem
        Caption = 'New'
        OnClick = New1Click
      end
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Third Party Billing Info'
    Version = 'Feature unsupported'
    ChangeListNumber = '$Change: 191336 $'
    Left = 392
  end
  object QryFOB: TFDQuery
    BeforePost = QryFOBBeforePost
    OnNewRecord = QryFOBNewRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'FOB_THIRD_PARTY'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select id,'
      '       attn,'
      '       addr1,'
      '       addr2,'
      '       addr3,'
      '       city,'
      '       state,'
      '       country,'
      '       zip,'
      '       phone_number,'
      '       ext,'
      '       fax,'
      '       prime_contact,'
      '      USE_USA_MASK'
      ''
      ' from FOB_THIRD_PARTY'
      '')
    Left = 296
    object QryFOBPRIME_CONTACT: TStringField
      DisplayLabel = 'Contact'
      DisplayWidth = 30
      FieldName = 'PRIME_CONTACT'
      Origin = 'IQ.FOB.PRIME_CONTACT'
      FixedChar = True
      Size = 30
    end
    object QryFOBATTN: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 60
      FieldName = 'ATTN'
      Origin = 'IQ.FOB.ATTN'
      Size = 60
    end
    object QryFOBADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 60
      FieldName = 'ADDR1'
      Origin = 'IQ.FOB.ADDR1'
      Size = 60
    end
    object QryFOBADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 60
      FieldName = 'ADDR2'
      Origin = 'IQ.FOB.ADDR2'
      Size = 60
    end
    object QryFOBADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 60
      FieldName = 'ADDR3'
      Origin = 'IQ.FOB.ADDR3'
      Size = 60
    end
    object QryFOBCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 30
      FieldName = 'CITY'
      Origin = 'IQ.FOB.CITY'
      FixedChar = True
      Size = 30
    end
    object QryFOBCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 30
      FieldName = 'COUNTRY'
      Origin = 'IQ.FOB.COUNTRY'
      FixedChar = True
      Size = 100
    end
    object QryFOBSTATE: TStringField
      DisplayLabel = 'State or Region'
      DisplayWidth = 20
      FieldName = 'STATE'
      Origin = 'IQ.FOB.STATE'
    end
    object QryFOBZIP: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 10
      FieldName = 'ZIP'
      Origin = 'IQ.FOB.ZIP'
      FixedChar = True
      Size = 10
    end
    object QryFOBPHONE_NUMBER: TStringField
      DisplayLabel = 'Telephone'
      DisplayWidth = 25
      FieldName = 'PHONE_NUMBER'
      Origin = 'IQ.FOB.PHONE_NUMBER'
      OnGetText = DoGetTelephoneText
      Size = 25
    end
    object QryFOBFAX: TStringField
      DisplayLabel = 'Fax'
      DisplayWidth = 25
      FieldName = 'FAX'
      Origin = 'IQ.FOB.FAX'
      OnGetText = DoGetTelephoneText
      Size = 25
    end
    object QryFOBEXT: TStringField
      DisplayLabel = 'Extention'
      DisplayWidth = 5
      FieldName = 'EXT'
      Origin = 'IQ.FOB.EXT'
      FixedChar = True
      Size = 5
    end
    object QryFOBUSE_USA_MASK: TStringField
      DisplayLabel = 'Use USA Mask'
      DisplayWidth = 1
      FieldName = 'USE_USA_MASK'
      Origin = 'IQ.FOB.USE_USA_MASK'
      Size = 1
    end
    object QryFOBID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into FOB_THIRD_PARTY'
      '  (ID, ATTN, ADDR1, '
      
        '   ADDR2, ADDR3, CITY, STATE, COUNTRY, ZIP, PHONE_NUMBER, EXT, F' +
        'AX, '
      'PRIME_CONTACT, USE_USA_MASK)'
      'values'
      '  (:ID, :ATTN, '
      
        '   :ADDR1, :ADDR2, :ADDR3, :CITY, :STATE, :COUNTRY, :ZIP, :PHONE' +
        '_NUMBER, '
      '   :EXT, :FAX, :PRIME_CONTACT, :USE_USA_MASK)')
    ModifySQL.Strings = (
      'update FOB_THIRD_PARTY'
      'set'
      '  ID = :ID,'
      '  ATTN = :ATTN,'
      '  ADDR1 = :ADDR1,'
      '  ADDR2 = :ADDR2,'
      '  ADDR3 = :ADDR3,'
      '  CITY = :CITY,'
      '  STATE = :STATE,'
      '  COUNTRY = :COUNTRY,'
      '  ZIP = :ZIP,'
      '  PHONE_NUMBER = :PHONE_NUMBER,'
      '  EXT = :EXT,'
      '  FAX = :FAX,'
      '  PRIME_CONTACT = :PRIME_CONTACT,'
      '  USE_USA_MASK = :USE_USA_MASK'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from FOB_THIRD_PARTY'
      'where'
      '  ID = :OLD_ID')
    Left = 264
  end
  object PkThirdParty: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id as id,'
      '       attn as attn,'
      '       addr1 as addr1,'
      '       addr2 as addr2,'
      '       addr3 as addr3,'
      '       city as city,'
      '       state as state,'
      '       country as country,'
      '       zip as zip,'
      '       phone_number as phone_number,'
      '       ext as ext,'
      '       fax as fax,'
      '       prime_contact as prime_contact,'
      '       use_usa_mask as use_usa_mask '
      ' from fob_third_party')
    OnIQModify = PkThirdPartyIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 184
    object PkThirdPartyID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.FOB_THIRD_PARTY.ID'
      Visible = False
      Size = 0
    end
    object PkThirdPartyATTN: TStringField
      DisplayLabel = 'Company'
      FieldName = 'ATTN'
      Origin = 'IQ.FOB_THIRD_PARTY.ATTN'
      Size = 60
    end
    object PkThirdPartyADDR1: TStringField
      DisplayLabel = 'Address 1'
      FieldName = 'ADDR1'
      Origin = 'IQ.FOB_THIRD_PARTY.ADDR1'
      Size = 60
    end
    object PkThirdPartyADDR2: TStringField
      DisplayLabel = 'Address 2'
      FieldName = 'ADDR2'
      Origin = 'IQ.FOB_THIRD_PARTY.ADDR2'
      Size = 60
    end
    object PkThirdPartyADDR3: TStringField
      DisplayLabel = 'Address 3'
      FieldName = 'ADDR3'
      Origin = 'IQ.FOB_THIRD_PARTY.ADDR3'
      Size = 60
    end
    object PkThirdPartyCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Origin = 'IQ.FOB_THIRD_PARTY.CITY'
      FixedChar = True
      Size = 30
    end
    object PkThirdPartySTATE: TStringField
      DisplayLabel = 'State'
      FieldName = 'STATE'
      Origin = 'IQ.FOB_THIRD_PARTY.STATE'
    end
    object PkThirdPartyCOUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      Origin = 'IQ.FOB_THIRD_PARTY.COUNTRY'
      FixedChar = True
      Size = 100
    end
    object PkThirdPartyZIP: TStringField
      DisplayLabel = 'State or Region'
      FieldName = 'ZIP'
      Origin = 'IQ.FOB_THIRD_PARTY.ZIP'
      FixedChar = True
      Size = 10
    end
    object PkThirdPartyPHONE_NUMBER: TStringField
      DisplayLabel = 'Telephone'
      FieldName = 'PHONE_NUMBER'
      Origin = 'IQ.FOB_THIRD_PARTY.PHONE_NUMBER'
      Size = 25
    end
    object PkThirdPartyEXT: TStringField
      DisplayLabel = 'Extention'
      FieldName = 'EXT'
      Origin = 'IQ.FOB_THIRD_PARTY.EXT'
      FixedChar = True
      Size = 5
    end
    object PkThirdPartyFAX: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX'
      Origin = 'IQ.FOB_THIRD_PARTY.FAX'
      Size = 25
    end
    object PkThirdPartyPRIME_CONTACT: TStringField
      DisplayLabel = 'Contact'
      FieldName = 'PRIME_CONTACT'
      Origin = 'IQ.FOB_THIRD_PARTY.PRIME_CONTACT'
      FixedChar = True
      Size = 30
    end
  end
end
