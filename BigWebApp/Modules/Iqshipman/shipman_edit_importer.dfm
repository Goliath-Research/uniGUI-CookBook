object FrmShipmanEditImporter: TFrmShipmanEditImporter
  Left = 347
  Top = 163
  ClientHeight = 413
  ClientWidth = 350
  Caption = 'Edit Importer'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel4: TUniPanel
    Left = 0
    Top = 0
    Width = 350
    Height = 413
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlLeft: TUniPanel
      Left = 1
      Top = 1
      Width = 114
      Height = 374
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label2: TUniLabel
        Left = 8
        Top = 12
        Width = 42
        Height = 13
        Hint = ''
        Caption = 'Importer'
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
      object Label14: TUniLabel
        Left = 8
        Top = 348
        Width = 17
        Height = 13
        Hint = ''
        Caption = 'EIN'
        TabOrder = 14
      end
    end
    object Panel3: TUniPanel
      Left = 322
      Top = 1
      Width = 28
      Height = 374
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
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
    object PnlEditBoxes: TUniPanel
      Left = 114
      Top = 1
      Width = 208
      Height = 374
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      Caption = ''
      DesignSize = (
        208
        374)
      object dbeImporter: TUniDBEdit
        Left = 1
        Top = 8
        Width = 199
        Height = 21
        Hint = ''
        DataField = 'ATTN'
        DataSource = srcImporter
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object dbeAddr1: TUniDBEdit
        Left = 1
        Top = 32
        Width = 199
        Height = 21
        Hint = ''
        DataField = 'ADDR1'
        DataSource = srcImporter
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object dbeAddr2: TUniDBEdit
        Left = 1
        Top = 56
        Width = 199
        Height = 21
        Hint = ''
        DataField = 'ADDR2'
        DataSource = srcImporter
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
      object dbeAddr3: TUniDBEdit
        Left = 1
        Top = 80
        Width = 199
        Height = 21
        Hint = ''
        DataField = 'ADDR3'
        DataSource = srcImporter
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
      end
      object dbeCity: TUniDBEdit
        Left = 1
        Top = 104
        Width = 199
        Height = 21
        Hint = ''
        DataField = 'CITY'
        DataSource = srcImporter
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
        DataSource = srcImporter
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
        Width = 199
        Height = 21
        Hint = ''
        DataField = 'ZIP'
        DataSource = srcImporter
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 6
      end
      object cbCountry: TUniDBComboBox
        Left = 1
        Top = 176
        Width = 199
        Height = 21
        Hint = ''
        Anchors = [akLeft, akTop, akRight]
        DataField = 'COUNTRY'
        DataSource = srcImporter
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
        Width = 214
        Height = 17
        Hint = 'Use USA data mask for phone and fax numbers'
        ShowHint = True
        ParentShowHint = False
        DataField = 'USE_USA_MASK'
        DataSource = srcImporter
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
        DataSource = srcImporter
        TabOrder = 9
      end
      object dbeExt: TUniDBEdit
        Left = 1
        Top = 248
        Width = 65
        Height = 21
        Hint = ''
        DataField = 'EXT'
        DataSource = srcImporter
        TabOrder = 10
      end
      object dbeFax: TUniDBEdit
        Left = 1
        Top = 272
        Width = 137
        Height = 21
        Hint = ''
        DataField = 'FAX'
        DataSource = srcImporter
        TabOrder = 11
      end
      object dbeContact: TUniDBEdit
        Left = 1
        Top = 296
        Width = 199
        Height = 21
        Hint = ''
        DataField = 'PRIME_CONTACT'
        DataSource = srcImporter
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 12
      end
      object dbeAccount: TUniDBEdit
        Left = 1
        Top = 320
        Width = 199
        Height = 21
        Hint = ''
        DataField = 'ACCOUNT_NUMBER'
        DataSource = srcImporter
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 13
      end
      object dbeEIN: TUniDBEdit
        Left = 1
        Top = 344
        Width = 199
        Height = 21
        Hint = ''
        DataField = 'EIN'
        DataSource = srcImporter
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 14
      end
    end
    object Panel1: TUniPanel
      Left = 1
      Top = 374
      Width = 348
      Height = 39
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 3
      Caption = ''
      object Panel2: TUniPanel
        Left = 142
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
  end
  object tblImporter: TFDTable
    BeforePost = tblImporterBeforePost
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'IMPORTER'
    TableName = 'IMPORTER'
    Left = 244
    object tblImporterID: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object tblImporterATTN: TStringField
      FieldName = 'ATTN'
      Size = 60
    end
    object tblImporterADDR1: TStringField
      FieldName = 'ADDR1'
      Size = 60
    end
    object tblImporterADDR2: TStringField
      FieldName = 'ADDR2'
      Size = 60
    end
    object tblImporterADDR3: TStringField
      FieldName = 'ADDR3'
      Size = 60
    end
    object tblImporterCITY: TStringField
      FieldName = 'CITY'
      FixedChar = True
      Size = 30
    end
    object tblImporterSTATE: TStringField
      FieldName = 'STATE'
    end
    object tblImporterCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      FixedChar = True
      Size = 100
    end
    object tblImporterZIP: TStringField
      FieldName = 'ZIP'
      FixedChar = True
      Size = 10
    end
    object tblImporterPHONE_NUMBER: TStringField
      FieldName = 'PHONE_NUMBER'
      Size = 25
    end
    object tblImporterEXT: TStringField
      FieldName = 'EXT'
      FixedChar = True
      Size = 5
    end
    object tblImporterFAX: TStringField
      FieldName = 'FAX'
      Size = 25
    end
    object tblImporterPRIME_CONTACT: TStringField
      FieldName = 'PRIME_CONTACT'
      FixedChar = True
      Size = 30
    end
    object tblImporterNOTES: TStringField
      FieldName = 'NOTES'
      Size = 2000
    end
    object tblImporterUSE_USA_MASK: TStringField
      FieldName = 'USE_USA_MASK'
      FixedChar = True
      Size = 1
    end
    object tblImporterEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object tblImporterSHIP_TIME: TBCDField
      FieldName = 'SHIP_TIME'
      Size = 3
    end
    object tblImporterEIN: TStringField
      FieldName = 'EIN'
      Size = 10
    end
    object tblImporterACCOUNT_NUMBER: TStringField
      FieldName = 'ACCOUNT_NUMBER'
      Size = 15
    end
  end
  object srcImporter: TDataSource
    DataSet = tblImporter
    Left = 276
  end
end
