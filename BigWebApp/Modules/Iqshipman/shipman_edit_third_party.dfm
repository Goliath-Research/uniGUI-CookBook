object FrmShipmanThirdParty: TFrmShipmanThirdParty
  Left = 227
  Top = 237
  ClientHeight = 406
  ClientWidth = 342
  Caption = 'Edit Third Party'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 32
    Width = 342
    Height = 374
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 1
      Top = 335
      Width = 340
      Height = 39
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Panel3: TUniPanel
        Left = 134
        Top = 1
        Width = 206
        Height = 37
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object btnOK: TUniButton
          Left = 1
          Top = 8
          Width = 97
          Height = 25
          Hint = ''
          Caption = '&OK'
          TabOrder = 1
          Default = True
          OnClick = btnOKClick
        end
        object btnCancel: TUniButton
          Left = 104
          Top = 8
          Width = 97
          Height = 25
          Hint = ''
          Caption = '&Cancel'
          Cancel = True
          TabOrder = 2
          OnClick = btnCancelClick
        end
      end
    end
    object PnlEditBoxes: TUniPanel
      Left = 114
      Top = 1
      Width = 200
      Height = 335
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        200
        335)
      object dbeThirdParty: TUniDBEdit
        Left = 1
        Top = 8
        Width = 195
        Height = 21
        Hint = ''
        DataField = 'ATTN'
        DataSource = srcThirdParty
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object dbeAddr1: TUniDBEdit
        Left = 1
        Top = 32
        Width = 195
        Height = 21
        Hint = ''
        DataField = 'ADDR1'
        DataSource = srcThirdParty
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object dbeAddr2: TUniDBEdit
        Left = 1
        Top = 56
        Width = 195
        Height = 21
        Hint = ''
        DataField = 'ADDR2'
        DataSource = srcThirdParty
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
      object dbeAddr3: TUniDBEdit
        Left = 1
        Top = 80
        Width = 195
        Height = 21
        Hint = ''
        DataField = 'ADDR3'
        DataSource = srcThirdParty
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
      end
      object dbeCity: TUniDBEdit
        Left = 1
        Top = 104
        Width = 195
        Height = 21
        Hint = ''
        DataField = 'CITY'
        DataSource = srcThirdParty
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
      end
      object dbcState: TUniDBComboBox
        Left = 1
        Top = 128
        Width = 97
        Height = 21
        Hint = ''
        DataField = 'STATE'
        DataSource = srcThirdParty
        Items.Strings = (
          'AK'
          'AL'
          'AR'
          'AZ'
          'CA'
          'CO'
          'CT'
          'DC'
          'DE'
          'FL'
          'GA'
          'HA'
          'IA'
          'ID'
          'IL'
          'IN'
          'KS'
          'KY'
          'LA'
          'MA'
          'MD'
          'MI'
          'MN'
          'MO'
          'MS'
          'MT'
          'NC'
          'ND'
          'NE'
          'NH'
          'NJ'
          'NM'
          'NV'
          'NY'
          'OH'
          'OK'
          'OR'
          'PA'
          'RI'
          'SC'
          'SD'
          'TN'
          'TX'
          'UT'
          'VA'
          'VT'
          'WA'
          'WI'
          'WV'
          'WY')
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        TabOrder = 5
      end
      object dbeZip: TUniDBEdit
        Left = 1
        Top = 152
        Width = 195
        Height = 21
        Hint = ''
        DataField = 'ZIP'
        DataSource = srcThirdParty
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 6
      end
      object cbCountry: TUniDBComboBox
        Left = 1
        Top = 176
        Width = 195
        Height = 21
        Hint = ''
        Anchors = [akLeft, akTop, akRight]
        DataField = 'COUNTRY'
        DataSource = srcThirdParty
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
          'Hong Kong'
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
          'Switzerland'
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
          'Zimbabwe '
          ' ')
        TabOrder = 7
      end
      object dbchkUSAmaskCustomer: TUniDBCheckBox
        Left = 1
        Top = 200
        Width = 215
        Height = 17
        Hint = 'Use USA data mask for phone and fax numbers'
        ShowHint = True
        ParentShowHint = False
        DataField = 'USE_USA_MASK'
        DataSource = srcThirdParty
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
        Caption = 'Use USA mask'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 8
      end
      object dbeTelephone: TUniDBEdit
        Left = 1
        Top = 224
        Width = 137
        Height = 21
        Hint = ''
        DataField = 'PHONE_NUMBER'
        DataSource = srcThirdParty
        TabOrder = 9
      end
      object dbeExt: TUniDBEdit
        Left = 1
        Top = 248
        Width = 65
        Height = 21
        Hint = ''
        DataField = 'EXT'
        DataSource = srcThirdParty
        TabOrder = 10
      end
      object dbeFax: TUniDBEdit
        Left = 1
        Top = 272
        Width = 137
        Height = 21
        Hint = ''
        DataField = 'FAX'
        DataSource = srcThirdParty
        TabOrder = 11
      end
      object dbeContact: TUniDBEdit
        Left = 1
        Top = 296
        Width = 195
        Height = 21
        Hint = ''
        DataField = 'PRIME_CONTACT'
        DataSource = srcThirdParty
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 12
      end
      object dbeAccount: TUniDBEdit
        Left = 1
        Top = 320
        Width = 195
        Height = 21
        Hint = ''
        DataField = 'ACCOUNT_NUMBER'
        DataSource = srcThirdParty
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 13
      end
    end
    object Panel4: TUniPanel
      Left = 314
      Top = 1
      Width = 28
      Height = 335
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 2
      Caption = ''
      object sbtnLookupZipCode: TUniSpeedButton
        Left = 1
        Top = 151
        Width = 22
        Height = 22
        Hint = 'Lookup Zip Code'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDD07DDDDD
          DDDDDDDDD007DDDDDDDDDDDDDD007DDDDDDDDDDDDD0B07DDDDDDDDDD0000B07D
          DDDDDDDD0BBFBB07DDDDDDDDD0FB0000DDDDDDDDD0BFB07DDDDDDD00000BFB07
          DDDDDD0FBFBFBFB07DDDDDD0FBFB0000DDDDDDD0BFBFB07DDDDDDDDD0BFBFB07
          DDDDDDDD0FFFBFF07DDDDDDDD0FBFFBF07DDDDDDD000000000DD}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = sbtnLookupZipCodeClick
      end
    end
    object PnlLeft: TUniPanel
      Left = 1
      Top = 1
      Width = 114
      Height = 335
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 3
      Caption = ''
      object Label2: TUniLabel
        Left = 8
        Top = 12
        Width = 53
        Height = 13
        Hint = ''
        Caption = 'Third Party'
        TabOrder = 1
      end
      object Label3: TUniLabel
        Left = 8
        Top = 36
        Width = 45
        Height = 13
        Hint = ''
        Caption = 'Address1'
        TabOrder = 2
      end
      object Label4: TUniLabel
        Left = 8
        Top = 60
        Width = 45
        Height = 13
        Hint = ''
        Caption = 'Address2'
        TabOrder = 3
      end
      object Label5: TUniLabel
        Left = 8
        Top = 84
        Width = 45
        Height = 13
        Hint = ''
        Caption = 'Address3'
        TabOrder = 4
      end
      object Label6: TUniLabel
        Left = 8
        Top = 108
        Width = 19
        Height = 13
        Hint = ''
        Caption = 'City'
        TabOrder = 5
      end
      object Label7: TUniLabel
        Left = 8
        Top = 132
        Width = 75
        Height = 13
        Hint = ''
        Caption = 'State or Region'
        TabOrder = 6
      end
      object Label8: TUniLabel
        Left = 8
        Top = 180
        Width = 39
        Height = 13
        Hint = ''
        Caption = 'Country'
        TabOrder = 7
      end
      object Label10: TUniLabel
        Left = 8
        Top = 228
        Width = 61
        Height = 13
        Hint = ''
        Caption = 'Telephone #'
        TabOrder = 8
      end
      object Label12: TUniLabel
        Left = 8
        Top = 276
        Width = 29
        Height = 13
        Hint = ''
        Caption = 'Fax #'
        TabOrder = 9
      end
      object Label13: TUniLabel
        Left = 8
        Top = 300
        Width = 67
        Height = 13
        Hint = ''
        Caption = 'Prime Contact'
        TabOrder = 10
      end
      object Label9: TUniLabel
        Left = 8
        Top = 156
        Width = 57
        Height = 13
        Hint = ''
        Caption = 'Postal Code'
        TabOrder = 11
      end
      object Label11: TUniLabel
        Left = 8
        Top = 252
        Width = 47
        Height = 13
        Hint = ''
        Caption = 'Extension'
        TabOrder = 12
      end
      object Label1: TUniLabel
        Left = 8
        Top = 324
        Width = 79
        Height = 13
        Hint = ''
        Caption = 'Account Number'
        TabOrder = 13
      end
    end
  end
  object Panel5: TUniPanel
    Left = 0
    Top = 0
    Width = 342
    Height = 32
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      342
      32)
    object sbtnSearch: TUniSpeedButton
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
      OnClick = sbtnSearchClick
    end
    object DBNavigator1: TUniDBNavigator
      Left = 135
      Top = 2
      Width = 198
      Height = 25
      Hint = ''
      DataSource = srcThirdParty
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Anchors = [akTop, akRight]
      TabOrder = 0
    end
  end
  object tblThirdParty: TFDTable
    BeforePost = tblThirdPartyBeforePost
    OnNewRecord = tblThirdPartyNewRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'THIRD_PARTY'
    TableName = 'THIRD_PARTY'
    Left = 260
    Top = 128
    object tblThirdPartyID: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object tblThirdPartyATTN: TStringField
      FieldName = 'ATTN'
      Size = 60
    end
    object tblThirdPartyADDR1: TStringField
      FieldName = 'ADDR1'
      Size = 60
    end
    object tblThirdPartyADDR2: TStringField
      FieldName = 'ADDR2'
      Size = 60
    end
    object tblThirdPartyADDR3: TStringField
      FieldName = 'ADDR3'
      Size = 60
    end
    object tblThirdPartyCITY: TStringField
      FieldName = 'CITY'
      FixedChar = True
      Size = 30
    end
    object tblThirdPartySTATE: TStringField
      FieldName = 'STATE'
    end
    object tblThirdPartyCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      FixedChar = True
      Size = 100
    end
    object tblThirdPartyZIP: TStringField
      FieldName = 'ZIP'
      FixedChar = True
      Size = 10
    end
    object tblThirdPartyPHONE_NUMBER: TStringField
      FieldName = 'PHONE_NUMBER'
      Size = 25
    end
    object tblThirdPartyEXT: TStringField
      FieldName = 'EXT'
      FixedChar = True
      Size = 5
    end
    object tblThirdPartyFAX: TStringField
      FieldName = 'FAX'
      Size = 25
    end
    object tblThirdPartyPRIME_CONTACT: TStringField
      FieldName = 'PRIME_CONTACT'
      FixedChar = True
      Size = 30
    end
    object tblThirdPartyNOTES: TStringField
      FieldName = 'NOTES'
      Size = 2000
    end
    object tblThirdPartyUSE_USA_MASK: TStringField
      FieldName = 'USE_USA_MASK'
      FixedChar = True
      Size = 1
    end
    object tblThirdPartyEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object tblThirdPartySHIP_TIME: TBCDField
      FieldName = 'SHIP_TIME'
      Size = 3
    end
    object tblThirdPartyACCOUNT_NUMBER: TStringField
      FieldName = 'ACCOUNT_NUMBER'
      Size = 15
    end
  end
  object srcThirdParty: TDataSource
    DataSet = tblThirdParty
    Left = 292
    Top = 128
  end
  object PKThirdParty: TIQWebHpick
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select t.attn,'
      '       t.addr1,'
      '       t.addr2,'
      '       t.eplant_id,'
      '       t.city,'
      '       t.state,'
      '       t.zip,'
      '       t.country,'
      '       t.country_code,'
      '       t.id,'
      '       t.addr3,'
      '       t.ship_time,'
      '       t.phone_number,'
      '       t.ext,'
      '       t.fax,'
      '       t.prime_contact,'
      '       t.account_number'
      '  from v_third_party t'
      ' order by t.attn'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 76
    Top = 17
    object PKThirdPartyATTN: TStringField
      DisplayLabel = 'Attn'
      FieldName = 'ATTN'
      Size = 60
    end
    object PKThirdPartyADDR1: TStringField
      DisplayLabel = 'Address 1'
      FieldName = 'ADDR1'
      Size = 60
    end
    object PKThirdPartyADDR2: TStringField
      DisplayLabel = 'Address 2'
      FieldName = 'ADDR2'
      Size = 60
    end
    object PKThirdPartyEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object PKThirdPartyCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      FixedChar = True
      Size = 30
    end
    object PKThirdPartySTATE: TStringField
      DisplayLabel = 'State'
      FieldName = 'STATE'
    end
    object PKThirdPartyZIP: TStringField
      DisplayLabel = 'Zip Code'
      FieldName = 'ZIP'
      FixedChar = True
      Size = 10
    end
    object PKThirdPartyCOUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      FixedChar = True
      Size = 100
    end
    object PKThirdPartyCOUNTRY_CODE: TStringField
      FieldName = 'COUNTRY_CODE'
      Origin = 'IQ.V_THIRD_PARTY.COUNTRY_CODE'
      Visible = False
      Size = 4000
    end
    object PKThirdPartyID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PKThirdPartyADDR3: TStringField
      DisplayLabel = 'Address 3'
      FieldName = 'ADDR3'
      Size = 60
    end
    object PKThirdPartySHIP_TIME: TBCDField
      FieldName = 'SHIP_TIME'
      Visible = False
      Size = 3
    end
    object PKThirdPartyPHONE_NUMBER: TStringField
      DisplayLabel = 'Phone Number'
      FieldName = 'PHONE_NUMBER'
      Size = 25
    end
    object PKThirdPartyEXT: TStringField
      FieldName = 'EXT'
      Visible = False
      FixedChar = True
      Size = 5
    end
    object PKThirdPartyFAX: TStringField
      DisplayLabel = 'Fax Number'
      FieldName = 'FAX'
      Size = 25
    end
    object PKThirdPartyPRIME_CONTACT: TStringField
      DisplayLabel = 'Prime Contact'
      FieldName = 'PRIME_CONTACT'
      FixedChar = True
      Size = 30
    end
    object PKThirdPartyACCOUNT_NUMBER: TStringField
      DisplayLabel = 'Account Number'
      FieldName = 'ACCOUNT_NUMBER'
      Size = 15
    end
  end
end
