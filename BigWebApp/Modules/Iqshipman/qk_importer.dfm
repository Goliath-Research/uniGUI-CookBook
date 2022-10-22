inherited QuickAddImporter: TQuickAddImporter
  Left = 579
  Top = 121
  ClientHeight = 456
  ClientWidth = 357
  Caption = 'Quick Add'
  ExplicitWidth = 373
  ExplicitHeight = 495
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Top = 417
    Width = 357
    ExplicitTop = 417
    ExplicitWidth = 357
    inherited Panel2: TUniPanel
      Left = 151
      ExplicitLeft = 151
    end
  end
  inherited PageControl1: TUniPageControl
    Width = 357
    Height = 417
    ExplicitWidth = 357
    ExplicitHeight = 417
    inherited TabSheet1: TUniTabSheet
      Caption = 'New Importer'
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 349
      ExplicitHeight = 389
      object PnlLeft: TUniPanel
        Left = 0
        Top = 0
        Width = 114
        Height = 389
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
        Left = 321
        Top = 0
        Width = 28
        Height = 389
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
        end
      end
      object PnlEditBoxes: TUniPanel
        Left = 114
        Top = 0
        Width = 207
        Height = 389
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 2
        Caption = ''
        DesignSize = (
          207
          389)
        object dbeImporter: TUniDBEdit
          Left = 1
          Top = 8
          Width = 200
          Height = 21
          Hint = ''
          DataField = 'ATTN'
          DataSource = DataSource1
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object dbeAddr1: TUniDBEdit
          Left = 1
          Top = 32
          Width = 200
          Height = 21
          Hint = ''
          DataField = 'ADDR1'
          DataSource = DataSource1
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
        object dbeAddr2: TUniDBEdit
          Left = 1
          Top = 56
          Width = 200
          Height = 21
          Hint = ''
          DataField = 'ADDR2'
          DataSource = DataSource1
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
        end
        object dbeAddr3: TUniDBEdit
          Left = 1
          Top = 80
          Width = 200
          Height = 21
          Hint = ''
          DataField = 'ADDR3'
          DataSource = DataSource1
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
        end
        object dbeCity: TUniDBEdit
          Left = 1
          Top = 104
          Width = 200
          Height = 21
          Hint = ''
          DataField = 'CITY'
          DataSource = DataSource1
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
          DataSource = DataSource1
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
          Width = 200
          Height = 21
          Hint = ''
          DataField = 'ZIP'
          DataSource = DataSource1
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 6
        end
        object cbCountry: TUniDBComboBox
          Left = 1
          Top = 176
          Width = 200
          Height = 21
          Hint = ''
          Anchors = [akLeft, akTop, akRight]
          DataField = 'COUNTRY'
          DataSource = DataSource1
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
          DataSource = DataSource1
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
          DataSource = DataSource1
          TabOrder = 9
        end
        object dbeExt: TUniDBEdit
          Left = 1
          Top = 248
          Width = 65
          Height = 21
          Hint = ''
          DataField = 'EXT'
          DataSource = DataSource1
          TabOrder = 10
        end
        object dbeFax: TUniDBEdit
          Left = 1
          Top = 272
          Width = 137
          Height = 21
          Hint = ''
          DataField = 'FAX'
          DataSource = DataSource1
          TabOrder = 11
        end
        object dbeContact: TUniDBEdit
          Left = 1
          Top = 296
          Width = 200
          Height = 21
          Hint = ''
          DataField = 'PRIME_CONTACT'
          DataSource = DataSource1
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 12
        end
        object dbeAccount: TUniDBEdit
          Left = 1
          Top = 320
          Width = 200
          Height = 21
          Hint = ''
          DataField = 'ACCOUNT_NUMBER'
          DataSource = DataSource1
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 13
        end
        object dbeEIN: TUniDBEdit
          Left = 1
          Top = 344
          Width = 200
          Height = 21
          Hint = ''
          DataField = 'EIN'
          DataSource = DataSource1
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 14
        end
      end
    end
  end
  inherited Table1: TFDTable
    IndexFieldNames = 'ID'
    UpdateOptions.UpdateTableName = 'IMPORTER'
    TableName = 'IMPORTER'
    object Table1ID: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object Table1ATTN: TStringField
      FieldName = 'ATTN'
      Size = 60
    end
    object Table1ADDR1: TStringField
      FieldName = 'ADDR1'
      Size = 60
    end
    object Table1ADDR2: TStringField
      FieldName = 'ADDR2'
      Size = 60
    end
    object Table1ADDR3: TStringField
      FieldName = 'ADDR3'
      Size = 60
    end
    object Table1CITY: TStringField
      FieldName = 'CITY'
      FixedChar = True
      Size = 30
    end
    object Table1STATE: TStringField
      FieldName = 'STATE'
    end
    object Table1COUNTRY: TStringField
      FieldName = 'COUNTRY'
      FixedChar = True
      Size = 100
    end
    object Table1ZIP: TStringField
      FieldName = 'ZIP'
      FixedChar = True
      Size = 10
    end
    object Table1PHONE_NUMBER: TStringField
      FieldName = 'PHONE_NUMBER'
      Size = 25
    end
    object Table1EXT: TStringField
      FieldName = 'EXT'
      FixedChar = True
      Size = 5
    end
    object Table1FAX: TStringField
      FieldName = 'FAX'
      Size = 25
    end
    object Table1PRIME_CONTACT: TStringField
      FieldName = 'PRIME_CONTACT'
      FixedChar = True
      Size = 30
    end
    object Table1NOTES: TStringField
      FieldName = 'NOTES'
      Size = 2000
    end
    object Table1USE_USA_MASK: TStringField
      FieldName = 'USE_USA_MASK'
      FixedChar = True
      Size = 1
    end
    object Table1EPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object Table1SHIP_TIME: TBCDField
      FieldName = 'SHIP_TIME'
      Size = 3
    end
    object Table1EIN: TStringField
      FieldName = 'EIN'
      Size = 10
    end
    object Table1ACCOUNT_NUMBER: TStringField
      FieldName = 'ACCOUNT_NUMBER'
      Size = 15
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'btnOK')
    SecurityCode = 'QUICKADDCUSTOMER'
    Left = 145
    Top = 65535
  end
end
