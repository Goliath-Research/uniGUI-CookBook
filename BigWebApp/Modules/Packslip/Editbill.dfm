object FrmEditBilltoCustom: TFrmEditBilltoCustom
  Left = 442
  Top = 191
  ClientHeight = 404
  ClientWidth = 384
  Caption = 'Edit Billing Address'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlFormCarrier: TUniPanel
    Tag = 1999
    Left = 0
    Top = 27
    Width = 384
    Height = 343
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object PageControl1: TUniPageControl
      Left = 1
      Top = 1
      Width = 382
      Height = 341
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
          Width = 374
          Height = 313
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object sbMain: TUniScrollBox
            Tag = 1999
            Left = 0
            Top = 0
            Width = 374
            Height = 313
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            ScrollHeight = 315
            object PnlClient01: TUniPanel
              Tag = 1999
              Left = 0
              Top = 0
              Width = 355
              Height = 315
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              Caption = ''
              object Splitter1: TUniSplitter
                Left = 93
                Top = 0
                Width = 6
                Height = 315
                Hint = ''
                Align = alLeft
                ParentColor = False
                Color = clBtnFace
              end
              object PnlLeft01: TUniPanel
                Tag = 1999
                Left = 1
                Top = 1
                Width = 93
                Height = 313
                Hint = ''
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                TabOrder = 0
                Caption = ''
                object Label12: TUniLabel
                  Left = 8
                  Top = 11
                  Width = 38
                  Height = 13
                  Hint = ''
                  Caption = 'Contact'
                  TabOrder = 1
                end
                object Label1: TUniLabel
                  Left = 8
                  Top = 35
                  Width = 45
                  Height = 13
                  Hint = ''
                  Caption = 'Company'
                  TabOrder = 2
                end
                object Label2: TUniLabel
                  Left = 8
                  Top = 59
                  Width = 45
                  Height = 13
                  Hint = ''
                  Caption = 'Address1'
                  TabOrder = 3
                end
                object Label3: TUniLabel
                  Left = 8
                  Top = 83
                  Width = 48
                  Height = 13
                  Hint = ''
                  Caption = 'Address 2'
                  TabOrder = 4
                end
                object Label7: TUniLabel
                  Left = 8
                  Top = 107
                  Width = 45
                  Height = 13
                  Hint = ''
                  Caption = 'Address3'
                  TabOrder = 5
                end
                object Label4: TUniLabel
                  Left = 8
                  Top = 131
                  Width = 19
                  Height = 13
                  Hint = ''
                  Caption = 'City'
                  TabOrder = 6
                end
                object Label8: TUniLabel
                  Left = 8
                  Top = 155
                  Width = 39
                  Height = 13
                  Hint = ''
                  Caption = 'Country'
                  TabOrder = 7
                end
                object Label9: TUniLabel
                  Left = 8
                  Top = 227
                  Width = 61
                  Height = 13
                  Hint = ''
                  Caption = 'Telephone #'
                  TabOrder = 8
                end
                object Label10: TUniLabel
                  Left = 8
                  Top = 251
                  Width = 47
                  Height = 13
                  Hint = ''
                  Caption = 'Extension'
                  TabOrder = 9
                end
                object Label11: TUniLabel
                  Left = 8
                  Top = 275
                  Width = 29
                  Height = 13
                  Hint = ''
                  Caption = 'Fax #'
                  TabOrder = 10
                end
                object Label5: TUniLabel
                  Left = 8
                  Top = 179
                  Width = 75
                  Height = 13
                  Hint = ''
                  Caption = 'State or Region'
                  TabOrder = 11
                end
                object Label6: TUniLabel
                  Left = 8
                  Top = 203
                  Width = 57
                  Height = 13
                  Hint = ''
                  Caption = 'Postal Code'
                  TabOrder = 12
                end
              end
              object PnlClient02: TUniPanel
                Tag = 1999
                Left = 99
                Top = 1
                Width = 256
                Height = 313
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
                Caption = ''
                DesignSize = (
                  256
                  313)
                object dbeContact: TUniDBEdit
                  Left = 1
                  Top = 8
                  Width = 278
                  Height = 21
                  Hint = ''
                  DataField = 'PRIME_CONTACT'
                  DataSource = Src
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 0
                end
                object dbeCompany: TUniDBEdit
                  Left = 1
                  Top = 32
                  Width = 278
                  Height = 21
                  Hint = ''
                  DataField = 'ATTN'
                  DataSource = Src
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 1
                end
                object dbeAddress1: TUniDBEdit
                  Left = 1
                  Top = 56
                  Width = 278
                  Height = 21
                  Hint = ''
                  DataField = 'ADDR1'
                  DataSource = Src
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 2
                end
                object dbeAddress2: TUniDBEdit
                  Left = 1
                  Top = 80
                  Width = 278
                  Height = 21
                  Hint = ''
                  DataField = 'ADDR2'
                  DataSource = Src
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 3
                end
                object dbeAddress3: TUniDBEdit
                  Left = 1
                  Top = 104
                  Width = 278
                  Height = 21
                  Hint = ''
                  DataField = 'ADDR3'
                  DataSource = Src
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 4
                end
                object dbeCity: TUniDBEdit
                  Left = 1
                  Top = 128
                  Width = 278
                  Height = 21
                  Hint = ''
                  DataField = 'CITY'
                  DataSource = Src
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 5
                end
                object dbCountry: TUniDBComboBox
                  Left = 1
                  Top = 152
                  Width = 278
                  Height = 21
                  Hint = ''
                  Anchors = [akLeft, akTop, akRight]
                  DataField = 'COUNTRY'
                  DataSource = Src
                  Items.Strings = (
                    'Afghanistan '
                    'Albania '
                    'Algeria '
                    'Andorra '
                    'Angola '
                    'Antigua and Barbuda '
                    'Argentina '
                    'Armenia '
                    'Australia '
                    'Austria '
                    'Azerbaijan '
                    'Bahamas '
                    'Bahrain '
                    'Bangladesh '
                    'Barbados '
                    'Belarus '
                    'Belgium '
                    'Belize '
                    'Benin '
                    'Bhutan '
                    'Bolivia '
                    'Bosnia and Herzegovina '
                    'Botswana '
                    'Brazil '
                    'Brunei Darussalam '
                    'Bulgaria '
                    'Burkina Faso '
                    'Burundi '
                    'Cambodia '
                    'Cameroon '
                    'Canada '
                    'Cape Verde '
                    'Central African Republic '
                    'Chad '
                    'Chile '
                    'China '
                    'Colombia '
                    'Comoros '
                    'Congo '
                    'Costa Rica '
                    'Croatia '
                    'Cuba '
                    'Cyprus '
                    'Czech Republic '
                    'DPR of Korea '
                    'Denmark '
                    'Djibouti '
                    'Dominica '
                    'Dominican Republic '
                    'Ecuador '
                    'Egypt '
                    'El Salvador '
                    'Equatorial Guinea '
                    'Eritrea '
                    'Estonia '
                    'Ethiopia '
                    'Fiji '
                    'Finland '
                    'France '
                    'Gabon '
                    'Gambia '
                    'Georgia '
                    'Germany '
                    'Ghana '
                    'Great Britain'
                    'Greece '
                    'Grenada '
                    'Guatemala '
                    'Guinea '
                    'Guinea-Bissau '
                    'Guyana '
                    'Haiti '
                    'Honduras '
                    'Hungary '
                    'Iceland '
                    'India '
                    'Indonesia '
                    'Iran '
                    'Iraq '
                    'Ireland '
                    'Israel '
                    'Italy '
                    'Ivory Coast'
                    'Jamaica '
                    'Japan '
                    'Jordan '
                    'Kazakhstan '
                    'Kenya '
                    'Kuwait '
                    'Kyrgyzstan '
                    'Laos'
                    'Latvia '
                    'Lebanon '
                    'Lesotho '
                    'Liberia '
                    'Libya'
                    'Liechtenstein '
                    'Lithuania '
                    'Luxembourg '
                    'Madagascar '
                    'Malawi '
                    'Malaysia '
                    'Maldives '
                    'Mali '
                    'Malta '
                    'Marshall Islands '
                    'Mauritania '
                    'Mauritius '
                    'Mexico '
                    'Micronesia '
                    'Monaco '
                    'Mongolia '
                    'Morocco '
                    'Mozambique '
                    'Myanmar '
                    'Namibia '
                    'Nepal '
                    'Netherlands '
                    'New Zealand '
                    'Nicaragua '
                    'Niger '
                    'Nigeria '
                    'Norway '
                    'Oman '
                    'Pakistan '
                    'Palau '
                    'Panama '
                    'Papua New Guinea '
                    'Paraguay '
                    'Peru '
                    'Philippines '
                    'Poland '
                    'Portugal '
                    'Qatar '
                    'Republic of Korea '
                    'Republic of Moldova'
                    'Romania '
                    'Russia'
                    'Saint Kitts and Nevis '
                    'Saint Lucia '
                    'Saint Vincent and the Grenadines '
                    'Samoa '
                    'San Marino '
                    'Sao Tome and Principe '
                    'Saudi Arabia '
                    'Senegal '
                    'Seychelles '
                    'Sierra Leone '
                    'Singapore '
                    'Slovakia '
                    'Slovenia '
                    'Solomon Islands '
                    'Somalia '
                    'South Africa '
                    'Spain '
                    'Sri Lanka '
                    'Sudan '
                    'Suriname '
                    'Swaziland '
                    'Sweden '
                    'Syria'
                    'Tajikistan '
                    'Thailand '
                    'Macedonia'
                    'Togo '
                    'Trinidad and Tobago '
                    'Tunisia '
                    'Turkey '
                    'Turkmenistan '
                    'Uganda '
                    'Ukraine '
                    'United Arab Emirates '
                    'United Republic of Tanzania '
                    'USA'
                    'Uruguay '
                    'Uzbekistan '
                    'Vanuatu '
                    'Venezuela '
                    'Viet Nam '
                    'Yemen '
                    'Yugoslavia '
                    'Zambia '
                    'Zimbabwe ')
                  TabOrder = 6
                end
                object dbeTelephone: TUniDBEdit
                  Left = 1
                  Top = 224
                  Width = 161
                  Height = 21
                  Hint = ''
                  DataField = 'PHONE_NUMBER'
                  DataSource = Src
                  TabOrder = 9
                end
                object dbeExt: TUniDBEdit
                  Left = 1
                  Top = 248
                  Width = 81
                  Height = 21
                  Hint = ''
                  DataField = 'EXT'
                  DataSource = Src
                  TabOrder = 10
                end
                object dbeFax: TUniDBEdit
                  Left = 1
                  Top = 272
                  Width = 161
                  Height = 21
                  Hint = ''
                  DataField = 'FAX'
                  DataSource = Src
                  TabOrder = 11
                end
                object dbeZip: TUniDBEdit
                  Left = 1
                  Top = 200
                  Width = 121
                  Height = 21
                  Hint = ''
                  DataField = 'ZIP'
                  DataSource = Src
                  TabOrder = 8
                end
                object dbeState: TUniDBComboBox
                  Left = 1
                  Top = 176
                  Width = 121
                  Height = 21
                  Hint = ''
                  DataField = 'STATE'
                  DataSource = Src
                  TabOrder = 7
                end
              end
            end
          end
        end
      end
      object TabGrid: TUniTabSheet
        Hint = ''
        Caption = 'TabGrid'
        object Grid: TUniDBGrid
          Left = 0
          Top = 0
          Width = 374
          Height = 313
          Hint = ''
          DataSource = Src
          LoadMask.Message = 'Loading data...'
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
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
              Width = 124
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ADDR1'
              Title.Caption = 'Address1'
              Width = 124
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ADDR2'
              Title.Caption = 'Address2'
              Width = 124
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ADDR3'
              Title.Caption = 'Address3'
              Width = 124
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'CITY'
              Title.Caption = 'City'
              Width = 94
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'STATE'
              Title.Caption = 'State or Region'
              Width = 124
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ZIP'
              Title.Caption = 'Postal Code'
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
              FieldName = 'PHONE_NUMBER'
              Title.Caption = 'Phone#'
              Width = 94
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'EXT'
              Title.Caption = 'Ext.'
              Width = 34
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'FAX'
              Title.Caption = 'Fax#'
              Width = 94
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
      end
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 384
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnToggleView: TUniSpeedButton
      Left = 26
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Toggle Form/Grid'
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
      OnClick = sbtnToggleViewClick
    end
    object sbtnSearch: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = ''
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
    object DBNavigator1: TUniDBNavigator
      Left = 159
      Top = 1
      Width = 225
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = Src
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 370
    Width = 384
    Height = 34
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel3: TUniPanel
      Left = 174
      Top = 1
      Width = 210
      Height = 32
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnOk: TUniButton
        Left = 6
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 1
        OnClick = BtnOkClick
      end
      object BtnCancel: TUniButton
        Left = 108
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        TabOrder = 2
        OnClick = BtnCancelClick
      end
    end
  end
  object Src: TDataSource
    DataSet = Table
    OnDataChange = SrcDataChange
    Left = 72
    Top = 8
  end
  object Table: TFDTable
    Active = True
    BeforePost = TableBeforePost
    IndexFieldNames = 'ARCUSTO_ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'BILL_TO'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'BILL_TO'
    Left = 88
    Top = 16
    object TableID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object TableARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object TablePRIME_CONTACT: TStringField
      DisplayLabel = 'Contact'
      DisplayWidth = 20
      FieldName = 'PRIME_CONTACT'
      Size = 30
    end
    object TableATTN: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 20
      FieldName = 'ATTN'
      Size = 60
    end
    object TableADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 20
      FieldName = 'ADDR1'
      Size = 60
    end
    object TableADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 20
      FieldName = 'ADDR2'
      Size = 60
    end
    object TableADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 20
      FieldName = 'ADDR3'
      Size = 60
    end
    object TableSTATE: TStringField
      DisplayLabel = 'State or Region'
      FieldName = 'STATE'
    end
    object TableCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 15
      FieldName = 'CITY'
      Size = 30
    end
    object TableZIP: TStringField
      DisplayLabel = 'Postal Code'
      FieldName = 'ZIP'
      Size = 10
    end
    object TableCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 10
      FieldName = 'COUNTRY'
      Size = 100
    end
    object TablePHONE_NUMBER: TStringField
      DisplayLabel = 'Telephone #'
      DisplayWidth = 15
      FieldName = 'PHONE_NUMBER'
      Size = 25
    end
    object TableEXT: TStringField
      DisplayLabel = 'Ext'
      FieldName = 'EXT'
      Size = 5
    end
    object TableFAX: TStringField
      DisplayLabel = 'Fax'
      DisplayWidth = 15
      FieldName = 'FAX'
      Size = 25
    end
  end
  object Pk: TIQWebHpick
    BeforeOpen = PkBeforeOpen
    Filtered = True
    ConnectionName = 'IQFD'
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 120
    Top = 12
  end
end
