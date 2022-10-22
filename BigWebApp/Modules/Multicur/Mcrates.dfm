object FrmMCrates: TFrmMCrates
  Left = 244
  Top = 134
  HelpContext = 1120008
  ClientHeight = 480
  ClientWidth = 550
  Caption = 'Multi-Currency'
  OnShow = FormShow
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
    Top = 213
    Width = 550
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 550
    Height = 213
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object PnlCurrencyPcCarrier: TUniPanel
      Tag = 1999
      Left = 1
      Top = 28
      Width = 548
      Height = 184
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object PC: TUniPageControl
        Left = 1
        Top = 1
        Width = 546
        Height = 182
        Hint = ''
        ActivePage = TabForm
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        object TabForm: TUniTabSheet
          Hint = ''
          TabVisible = False
          Caption = 'TabForm'
          object sbCurrency: TUniScrollBox
            Left = 0
            Top = 0
            Width = 538
            Height = 154
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            ScrollHeight = 176
            object PnlClient01: TUniPanel
              Tag = 1999
              Left = 0
              Top = 0
              Width = 519
              Height = 176
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              Caption = ''
              object Splitter2: TUniSplitter
                Left = 106
                Top = 1
                Width = 6
                Height = 174
                Hint = ''
                Align = alLeft
                ParentColor = False
                Color = clBtnFace
              end
              object PnlLeft01: TUniPanel
                Tag = 1999
                Left = 1
                Top = 1
                Width = 105
                Height = 174
                Hint = ''
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                TabOrder = 0
                Caption = ''
                object Label1: TUniLabel
                  Left = 8
                  Top = 12
                  Width = 72
                  Height = 13
                  Hint = ''
                  Caption = 'Currency Code'
                  TabOrder = 1
                end
                object Label4: TUniLabel
                  Left = 8
                  Top = 108
                  Width = 41
                  Height = 13
                  Hint = ''
                  Caption = 'GL Value'
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
                object Label6: TUniLabel
                  Left = 8
                  Top = 132
                  Width = 78
                  Height = 13
                  Hint = ''
                  Caption = 'Native Currency'
                  TabOrder = 4
                end
                object Label2: TUniLabel
                  Left = 8
                  Top = 60
                  Width = 34
                  Height = 13
                  Hint = ''
                  Caption = 'Symbol'
                  TabOrder = 5
                end
                object Label5: TUniLabel
                  Left = 8
                  Top = 84
                  Width = 45
                  Height = 13
                  Hint = ''
                  Caption = 'Spot rate'
                  TabOrder = 6
                end
              end
              object PnlClient02: TUniPanel
                Tag = 1999
                Left = 112
                Top = 1
                Width = 406
                Height = 174
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
                Caption = ''
                object cbCurrCodeForm: TUniDBComboBox
                  Left = 0
                  Top = 8
                  Width = 193
                  Height = 21
                  Hint = ''
                  DataField = 'CURR_CODE'
                  DataSource = SrcCurrency
                  Style = csDropDownList
                  Items.Strings = (
                    'Afghanistan Afghani  (AFA)'#9'AFA'
                    'Albania Lek  (ALL)'#9'ALL'
                    'Algerian Dinar  (DZD)'#9'DZD'
                    'Angola New Kwanza  (AON)'#9'AON'
                    'Argentina Peso  (ARS)'#9'ARS'
                    'Armenia Dram  (AMD)'#9'AMD'
                    'Aruban Florin  (AWG)'#9'AWG'
                    'Australian Dollar  (AUD)'#9'AUD'
                    'Austrian Schilling  (ATS)'#9'ATS'
                    'Azerbaijani Manat  (AZM)'#9'AZM'
                    'Bahamian Dollar  (BSD)'#9'BSD'
                    'Bahraini Dinar  (BHD)'#9'BHD'
                    'Bangladesh Taka  (BDT)'#9'BDT'
                    'Barbados Dollar  (BBD)'#9'BBD'
                    'Belarussian Rouble  (BYB)'#9'BYB'
                    'Belgium Franc  (BEF)'#9'BEF'
                    'Belize Dollar  (BZD)'#9'BZD'
                    'Bermudian Dollar  (BMD)'#9'BMD'
                    'Bhutan Ngultrum  (BTN)'#9'BTN'
                    'Bolivian Boliviano  (BOB)'#9'BOB'
                    'Bosnian Convertible Mark  (BAM)'#9'BAM'
                    'Botswana Pula  (BWP)'#9'BWP'
                    'Brazilian Real  (BRL)'#9'BRL'
                    'Brunei Dollar  (BND)'#9'BND'
                    'Bulgaria Lev  (BGL)'#9'BGL'
                    'Burundi Franc  (BIF)'#9'BIF'
                    'Cambodia Riel  (KHR)'#9'KHR'
                    'Canadian Dollar  (CAD)'#9'CAD'
                    'Cayman Islands Dollar  (KYD)'#9'KYD'
                    'CFP Franc  (XPF)'#9'XPF'
                    'Chilean Peso  (CLP)'#9'CLP'
                    'Chinese Renminbi Yuan  (CNY)'#9'CNY'
                    'Colombian Peso  (COP)'#9'COP'
                    'Comorian Franc  (KMF)'#9'KMF'
                    'Costa Rican Col'#243'n  (CRC)'#9'CRC'
                    'Croatia Kuna  (HRK)'#9'HRK'
                    'Cuban Peso  (CUP)'#9'CUP'
                    'Cypriot Pound  (CYP)'#9'CYP'
                    'Czech Koruna  (CZK)'#9'CZK'
                    'Danish Krone  (DKK)'#9'DKK'
                    'Deutsche Mark  (DEM)'#9'DEM'
                    'Djibouti Franc  (DJF)'#9'DJF'
                    'Dominican Republic Peso  (DOP)'#9'DOP'
                    'Dutch Guilder  (NLG)'#9'NLG'
                    'East Caribbean Dollar  (XCD)'#9'XCD'
                    'Ecuador Sucre  (ECS)'#9'ECS'
                    'Egytian Pound  (EGP)'#9'EGP'
                    'El Salvadorian Col'#243'n  (SVC)'#9'SVC'
                    'Eritrea, Nakfa  (ERN)'#9'ERN'
                    'Escudo Caboverdiano  (CVE)'#9'CVE'
                    'Estonia Kroon  (EEK)'#9'EEK'
                    'Ethiopia Birr  (ETB)'#9'ETB'
                    'Euro  (EUR)'#9'EUR'
                    'Falkland Pound  (FKP)'#9'FKP'
                    'Fiji Dollar  (FJD)'#9'FJD'
                    'Finnish Markka  (FIM)'#9'FIM'
                    'Franc de la Communaut'#233' financ  (XAF)'#9'XAF'
                    'French Franc  (FRF)'#9'FRF'
                    'Gambia Dalasi  (GMD)'#9'GMD'
                    'Georgia, Lari  (GEL)'#9'GEL'
                    'Ghana Cedi  (GHC)'#9'GHC'
                    'Gibraltar Pound  (GIP)'#9'GIP'
                    'Greek Drachma  (GRD)'#9'GRD'
                    'Guatemala Quetzal  (GTQ)'#9'GTQ'
                    'Guyana Dollar  (GYD)'#9'GYD'
                    'Haiti Gourde  (HTG)'#9'HTG'
                    'Honduras Lempira  (HNL)'#9'HNL'
                    'Hong Kong Dollar  (HKD)'#9'HKD'
                    'Hungary Forint  (HUF)'#9'HUF'
                    'Icelandic Kr'#243'na  (ISK)'#9'ISK'
                    'Indian Rupee  (INR)'#9'INR'
                    'Indonesia Rupiah  (IDR)'#9'IDR'
                    'Iranian Riyal  (IRR)'#9'IRR'
                    'Iraqi Dinar  (IQD)'#9'IQD'
                    'Irish Punt  (IEP)'#9'IEP'
                    'Israel Shekel  (ILS)'#9'ILS'
                    'Italian Lira  (ITL)'#9'ITL'
                    'Jamaican Dollar  (JMD)'#9'JMD'
                    'Japanese Yen  (JPY)'#9'JPY'
                    'Jordanian Dinar  (JOD)'#9'JOD'
                    'Kazakhstan Tenge  (KZT)'#9'KZT'
                    'Kenyan Shilling  (KES)'#9'KES'
                    'Kuwaiti Dinar  (KWD)'#9'KWD'
                    'Kyrgyzstan, Som  (KGS)'#9'KGS'
                    'Laos Kip  (LAK)'#9'LAK'
                    'Latvia Lat  (LVL)'#9'LVL'
                    'Lebanese Pound  (LBP)'#9'LBP'
                    'Lesotho Maloti  (LSL)'#9'LSL'
                    'Liberian Dollar  (LRD)'#9'LRD'
                    'Libyan Dinar  (LYD)'#9'LYD'
                    'Lithuania Litas  (LTL)'#9'LTL'
                    'Luxembourg Franc  (LUF)'#9'LUF'
                    'Macao Pataca  (MOP)'#9'MOP'
                    'Macedonian Denar  (MKD)'#9'MKD'
                    'Malagasy Franc  (MGF)'#9'MGF'
                    'Malawian Kwacha  (MWK)'#9'MWK'
                    'Malaysian Ringgit  (MYR)'#9'MYR'
                    'Maldives Rufiyaa  (MVR)'#9'MVR'
                    'Maltese Lira  (MTL)'#9'MTL'
                    'Mauritania Ouguiya  (MRO)'#9'MRO'
                    'Mauritius Rupee  (MUR)'#9'MUR'
                    'Mexican Peso  (MXN)'#9'MXN'
                    'Moldovian Leu  (MDL)'#9'MDL'
                    'Mongolia Tugrik  (MNT)'#9'MNT'
                    'Moroccan Dirham  (MAD)'#9'MAD'
                    'Mozambique Metical  (MZM)'#9'MZM'
                    'Myanmar Kyat                (MMK)'#9'MMK'
                    'Namibian Dollar  (NAD)'#9'NAD'
                    'Nepalese Rupee  (NPR)'#9'NPR'
                    'Netherlands Antilles Guilder  (ANG)'#9'ANG'
                    'New Za'#239're  (ZRN)'#9'ZRN'
                    'New Zealand Dollar  (NZD)'#9'NZD'
                    'Nicaragua C'#243'rdoba  (NIC)'#9'NIC'
                    'Nigeria Naira  (NGN)'#9'NGN'
                    'North Korean Won  (KPW)'#9'KPW'
                    'Norwegian Krone  (NOK)'#9'NOK'
                    'Pakistani Rupee  (PKR)'#9'PKR'
                    'Panama Balboa  (PAB)'#9'PAB'
                    'Papua New Guinea Kina  (PGK)'#9'PGK'
                    'Paraguay Guarani  (PYG)'#9'PYG'
                    'Peru New Sol  (PEN)'#9'PEN'
                    'Philippine Peso  (PHP)'#9'PHP'
                    'Poland New Zloty  (PLZ)'#9'PLZ'
                    'Portuguese Escudo  (PTE)'#9'PTE'
                    'Qatari Riyal  (QAR)'#9'QAR'
                    'Riyal Omani  (OMR)'#9'OMR'
                    'Romanian Leu  (ROL)'#9'ROL'
                    'Russian Federation Rouble  (RUR)'#9'RUR'
                    'Rwanda Franc  (RWF)'#9'RWF'
                    'S. African Rand Commerc.  (SAC)'#9'SAC'
                    'S'#227'o Tom'#233' & Pr'#237'ncipe Dobra  (STD)'#9'STD'
                    'Saudi Riyal  (SAR)'#9'SAR'
                    'Seychelles Rupee  (SCR)'#9'SCR'
                    'Sierra Leone Leone  (SLL)'#9'SLL'
                    'Singapore Dollar  (SGD)'#9'SGD'
                    'Slovak Koruna  (SKK)'#9'SKK'
                    'Slovenia Tolar  (SIT)'#9'SIT'
                    'Solomon Islands Dollar  (SBD)'#9'SBD'
                    'Somali Shilling  (SOS)'#9'SOS'
                    'South African Rand  (ZAR)'#9'ZAR'
                    'South Korean Won  (KRW)'#9'KRW'
                    'Spanish Peseta  (ESP)'#9'ESP'
                    'Sri Lankan Rupee  (LKR)'#9'LKR'
                    'St Helena Pound  (SHP)'#9'SHP'
                    'Sterling  (GBP)'#9'GBP'
                    'Sudanese Pound  (SDP)'#9'SDP'
                    'Surinam Guilder  (SRG)'#9'SRG'
                    'Swaziland Lilangeni  (SZL)'#9'SZL'
                    'Swedish Krona  (SEK)'#9'SEK'
                    'Swiss Franc  (CHF)'#9'CHF'
                    'Syrian Pound  (SYP)'#9'SYP'
                    'Taiwanese NT Dollar  (TWD)'#9'TWD'
                    'Tajikistan, Ruble  (TJR)'#9'TJR'
                    'Tanzanian Shilling  (TZS)'#9'TZS'
                    'Thailand Baht  (THB)'#9'THB'
                    'Tonga Palanga  (TOP)'#9'TOP'
                    'Trinidad & Tobago Dollar  (TTD)'#9'TTD'
                    'Tunisia Tunisian Dinar  (TND)'#9'TND'
                    'Turkish Lira  (TRL)'#9'TRL'
                    'Turkmenistan, Manat  (TMM)'#9'TMM'
                    'UAE Dirham  (AED)'#9'AED'
                    'Ugandian Shilling  (UGX)'#9'UGX'
                    'Ukraine Hryvna  (UAH)'#9'UAH'
                    'Uruguayan New Peso  (UYU)'#9'UYU'
                    'US Dollar  (USD)'#9'USD'
                    'Uzbekistani Sum  (UZS)'#9'UZS'
                    'Vanuatu Vatu  (VUV)'#9'VUV'
                    'Venezuela Bolivar  (VEB)'#9'VEB'
                    'Vietnam Dong  (VND)'#9'VND'
                    'Western Samoa Tala  (WST)'#9'WST'
                    'Yemen Riyal  (YER)'#9'YER'
                    'Yugoslavia New Dinar  (YUM)'#9'YUM'
                    'Zambian Kwacha  (ZMW)'#9'ZMW'
                    'Zimbabwe Dollar  (ZWD)'#9'ZWD')
                  TabOrder = 0
                  OnEnter = cbCurrCodeFormEnter
                end
                object edDescrip: TUniDBEdit
                  Left = 0
                  Top = 32
                  Width = 295
                  Height = 21
                  Hint = ''
                  DataField = 'DESCRIP'
                  DataSource = SrcCurrency
                  TabOrder = 1
                end
                object dbCurSymbol: TUniDBEdit
                  Left = 0
                  Top = 56
                  Width = 51
                  Height = 21
                  Hint = ''
                  DataField = 'CURR_SYMBOL'
                  DataSource = SrcCurrency
                  TabOrder = 2
                end
                object edSpotRate: TUniDBEdit
                  Left = 0
                  Top = 80
                  Width = 51
                  Height = 21
                  Hint = ''
                  DataField = 'SPOT_RATE'
                  DataSource = SrcCurrency
                  TabOrder = 3
                end
                object eGlValue: TUniDBEdit
                  Left = 0
                  Top = 104
                  Width = 190
                  Height = 21
                  Hint = ''
                  DataField = 'GLVALUE'
                  DataSource = SrcCurrency
                  TabOrder = 4
                end
                object wwNative: TUniDBComboBox
                  Left = 0
                  Top = 128
                  Width = 193
                  Height = 21
                  Hint = ''
                  DataField = 'NATIVE_CURR'
                  DataSource = SrcCurrency
                  Style = csDropDownList
                  Items.Strings = (
                    'Afghanistan Afghani  (AFA)'#9'AFA'
                    'Albania Lek  (ALL)'#9'ALL'
                    'Algerian Dinar  (DZD)'#9'DZD'
                    'Angola New Kwanza  (AON)'#9'AON'
                    'Argentina Peso  (ARS)'#9'ARS'
                    'Armenia Dram  (AMD)'#9'AMD'
                    'Aruban Florin  (AWG)'#9'AWG'
                    'Australian Dollar  (AUD)'#9'AUD'
                    'Austrian Schilling  (ATS)'#9'ATS'
                    'Azerbaijani Manat  (AZM)'#9'AZM'
                    'Bahamian Dollar  (BSD)'#9'BSD'
                    'Bahraini Dinar  (BHD)'#9'BHD'
                    'Bangladesh Taka  (BDT)'#9'BDT'
                    'Barbados Dollar  (BBD)'#9'BBD'
                    'Belarussian Rouble  (BYB)'#9'BYB'
                    'Belgium Franc  (BEF)'#9'BEF'
                    'Belize Dollar  (BZD)'#9'BZD'
                    'Bermudian Dollar  (BMD)'#9'BMD'
                    'Bhutan Ngultrum  (BTN)'#9'BTN'
                    'Bolivian Boliviano  (BOB)'#9'BOB'
                    'Bosnian Convertible Mark  (BAM)'#9'BAM'
                    'Botswana Pula  (BWP)'#9'BWP'
                    'Brazilian Real  (BRL)'#9'BRL'
                    'Brunei Dollar  (BND)'#9'BND'
                    'Bulgaria Lev  (BGL)'#9'BGL'
                    'Burundi Franc  (BIF)'#9'BIF'
                    'Cambodia Riel  (KHR)'#9'KHR'
                    'Canadian Dollar  (CAD)'#9'CAD'
                    'Cayman Islands Dollar  (KYD)'#9'KYD'
                    'CFP Franc  (XPF)'#9'XPF'
                    'Chilean Peso  (CLP)'#9'CLP'
                    'Chinese Renminbi Yuan  (CNY)'#9'CNY'
                    'Colombian Peso  (COP)'#9'COP'
                    'Comorian Franc  (KMF)'#9'KMF'
                    'Costa Rican Col'#243'n  (CRC)'#9'CRC'
                    'Croatia Kuna  (HRK)'#9'HRK'
                    'Cuban Peso  (CUP)'#9'CUP'
                    'Cypriot Pound  (CYP)'#9'CYP'
                    'Czech Koruna  (CZK)'#9'CZK'
                    'Danish Krone  (DKK)'#9'DKK'
                    'Deutsche Mark  (DEM)'#9'DEM'
                    'Djibouti Franc  (DJF)'#9'DJF'
                    'Dominican Republic Peso  (DOP)'#9'DOP'
                    'Dutch Guilder  (NLG)'#9'NLG'
                    'East Caribbean Dollar  (XCD)'#9'XCD'
                    'Ecuador Sucre  (ECS)'#9'ECS'
                    'Egytian Pound  (EGP)'#9'EGP'
                    'El Salvadorian Col'#243'n  (SVC)'#9'SVC'
                    'Eritrea, Nakfa  (ERN)'#9'ERN'
                    'Escudo Caboverdiano  (CVE)'#9'CVE'
                    'Estonia Kroon  (EEK)'#9'EEK'
                    'Ethiopia Birr  (ETB)'#9'ETB'
                    'Euro  (EUR)'#9'EUR'
                    'Falkland Pound  (FKP)'#9'FKP'
                    'Fiji Dollar  (FJD)'#9'FJD'
                    'Finnish Markka  (FIM)'#9'FIM'
                    'Franc de la Communaut'#233' financ  (XAF)'#9'XAF'
                    'French Franc  (FRF)'#9'FRF'
                    'Gambia Dalasi  (GMD)'#9'GMD'
                    'Georgia, Lari  (GEL)'#9'GEL'
                    'Ghana Cedi  (GHC)'#9'GHC'
                    'Gibraltar Pound  (GIP)'#9'GIP'
                    'Greek Drachma  (GRD)'#9'GRD'
                    'Guatemala Quetzal  (GTQ)'#9'GTQ'
                    'Guyana Dollar  (GYD)'#9'GYD'
                    'Haiti Gourde  (HTG)'#9'HTG'
                    'Honduras Lempira  (HNL)'#9'HNL'
                    'Hong Kong Dollar  (HKD)'#9'HKD'
                    'Hungary Forint  (HUF)'#9'HUF'
                    'Icelandic Kr'#243'na  (ISK)'#9'ISK'
                    'Indian Rupee  (INR)'#9'INR'
                    'Indonesia Rupiah  (IDR)'#9'IDR'
                    'Iranian Riyal  (IRR)'#9'IRR'
                    'Iraqi Dinar  (IQD)'#9'IQD'
                    'Irish Punt  (IEP)'#9'IEP'
                    'Israel Shekel  (ILS)'#9'ILS'
                    'Italian Lira  (ITL)'#9'ITL'
                    'Jamaican Dollar  (JMD)'#9'JMD'
                    'Japanese Yen  (JPY)'#9'JPY'
                    'Jordanian Dinar  (JOD)'#9'JOD'
                    'Kazakhstan Tenge  (KZT)'#9'KZT'
                    'Kenyan Shilling  (KES)'#9'KES'
                    'Kuwaiti Dinar  (KWD)'#9'KWD'
                    'Kyrgyzstan, Som  (KGS)'#9'KGS'
                    'Laos Kip  (LAK)'#9'LAK'
                    'Latvia Lat  (LVL)'#9'LVL'
                    'Lebanese Pound  (LBP)'#9'LBP'
                    'Lesotho Maloti  (LSL)'#9'LSL'
                    'Liberian Dollar  (LRD)'#9'LRD'
                    'Libyan Dinar  (LYD)'#9'LYD'
                    'Lithuania Litas  (LTL)'#9'LTL'
                    'Luxembourg Franc  (LUF)'#9'LUF'
                    'Macao Pataca  (MOP)'#9'MOP'
                    'Macedonian Denar  (MKD)'#9'MKD'
                    'Malagasy Franc  (MGF)'#9'MGF'
                    'Malawian Kwacha  (MWK)'#9'MWK'
                    'Malaysian Ringgit  (MYR)'#9'MYR'
                    'Maldives Rufiyaa  (MVR)'#9'MVR'
                    'Maltese Lira  (MTL)'#9'MTL'
                    'Mauritania Ouguiya  (MRO)'#9'MRO'
                    'Mauritius Rupee  (MUR)'#9'MUR'
                    'Mexican Peso  (MXN)'#9'MXN'
                    'Moldovian Leu  (MDL)'#9'MDL'
                    'Mongolia Tugrik  (MNT)'#9'MNT'
                    'Moroccan Dirham  (MAD)'#9'MAD'
                    'Mozambique Metical  (MZM)'#9'MZM'
                    'Myanmar Kyat                (MMK)'#9'MMK'
                    'Namibian Dollar  (NAD)'#9'NAD'
                    'Nepalese Rupee  (NPR)'#9'NPR'
                    'Netherlands Antilles Guilder  (ANG)'#9'ANG'
                    'New Za'#239're  (ZRN)'#9'ZRN'
                    'New Zealand Dollar  (NZD)'#9'NZD'
                    'Nicaragua C'#243'rdoba  (NIC)'#9'NIC'
                    'Nigeria Naira  (NGN)'#9'NGN'
                    'North Korean Won  (KPW)'#9'KPW'
                    'Norwegian Krone  (NOK)'#9'NOK'
                    'Pakistani Rupee  (PKR)'#9'PKR'
                    'Panama Balboa  (PAB)'#9'PAB'
                    'Papua New Guinea Kina  (PGK)'#9'PGK'
                    'Paraguay Guarani  (PYG)'#9'PYG'
                    'Peru New Sol  (PEN)'#9'PEN'
                    'Philippine Peso  (PHP)'#9'PHP'
                    'Poland New Zloty  (PLZ)'#9'PLZ'
                    'Portuguese Escudo  (PTE)'#9'PTE'
                    'Qatari Riyal  (QAR)'#9'QAR'
                    'Riyal Omani  (OMR)'#9'OMR'
                    'Romanian Leu  (ROL)'#9'ROL'
                    'Russian Federation Rouble  (RUR)'#9'RUR'
                    'Rwanda Franc  (RWF)'#9'RWF'
                    'S. African Rand Commerc.  (SAC)'#9'SAC'
                    'S'#227'o Tom'#233' & Pr'#237'ncipe Dobra  (STD)'#9'STD'
                    'Saudi Riyal  (SAR)'#9'SAR'
                    'Seychelles Rupee  (SCR)'#9'SCR'
                    'Sierra Leone Leone  (SLL)'#9'SLL'
                    'Singapore Dollar  (SGD)'#9'SGD'
                    'Slovak Koruna  (SKK)'#9'SKK'
                    'Slovenia Tolar  (SIT)'#9'SIT'
                    'Solomon Islands Dollar  (SBD)'#9'SBD'
                    'Somali Shilling  (SOS)'#9'SOS'
                    'South African Rand  (ZAR)'#9'ZAR'
                    'South Korean Won  (KRW)'#9'KRW'
                    'Spanish Peseta  (ESP)'#9'ESP'
                    'Sri Lankan Rupee  (LKR)'#9'LKR'
                    'St Helena Pound  (SHP)'#9'SHP'
                    'Sterling  (GBP)'#9'GBP'
                    'Sudanese Pound  (SDP)'#9'SDP'
                    'Surinam Guilder  (SRG)'#9'SRG'
                    'Swaziland Lilangeni  (SZL)'#9'SZL'
                    'Swedish Krona  (SEK)'#9'SEK'
                    'Swiss Franc  (CHF)'#9'CHF'
                    'Syrian Pound  (SYP)'#9'SYP'
                    'Taiwanese NT Dollar  (TWD)'#9'TWD'
                    'Tajikistan, Ruble  (TJR)'#9'TJR'
                    'Tanzanian Shilling  (TZS)'#9'TZS'
                    'Thailand Baht  (THB)'#9'THB'
                    'Tonga Palanga  (TOP)'#9'TOP'
                    'Trinidad & Tobago Dollar  (TTD)'#9'TTD'
                    'Tunisia Tunisian Dinar  (TND)'#9'TND'
                    'Turkish Lira  (TRL)'#9'TRL'
                    'Turkmenistan, Manat  (TMM)'#9'TMM'
                    'UAE Dirham  (AED)'#9'AED'
                    'Ugandian Shilling  (UGX)'#9'UGX'
                    'Ukraine Hryvna  (UAH)'#9'UAH'
                    'Uruguayan New Peso  (UYU)'#9'UYU'
                    'US Dollar  (USD)'#9'USD'
                    'Uzbekistani Sum  (UZS)'#9'UZS'
                    'Vanuatu Vatu  (VUV)'#9'VUV'
                    'Venezuela Bolivar  (VEB)'#9'VEB'
                    'Vietnam Dong  (VND)'#9'VND'
                    'Western Samoa Tala  (WST)'#9'WST'
                    'Yemen Riyal  (YER)'#9'YER'
                    'Yugoslavia New Dinar  (YUM)'#9'YUM'
                    'Zambian Kwacha  (ZMW)'#9'ZMW'
                    'Zimbabwe Dollar  (ZWD)'#9'ZWD')
                  TabOrder = 5
                end
                object wwCheckBox1: TUniCheckBox
                  Left = 205
                  Top = 130
                  Width = 221
                  Height = 17
                  Hint = ''
                  Caption = 'Use daily Spot Rate table for transactions'
                  TabOrder = 6
                end
              end
            end
          end
        end
        object tabGrid: TUniTabSheet
          Hint = ''
          TabVisible = False
          Caption = 'tabGrid'
          object gridCurrency: TIQUniGridControl
            Left = 0
            Top = 0
            Width = 538
            Height = 154
            Layout = 'border'
            ParentAlignmentControl = False
            AlignmentControl = uniAlignmentClient
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            IQComponents.Grid.Left = 0
            IQComponents.Grid.Top = 29
            IQComponents.Grid.Width = 321
            IQComponents.Grid.Height = 68
            IQComponents.Grid.Hint = ''
            IQComponents.Grid.DataSource = SrcCurrency
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
            IQComponents.Navigator.DataSource = SrcCurrency
            IQComponents.Navigator.LayoutConfig.Region = 'east'
            IQComponents.Navigator.TabOrder = 3
            IQComponents.HiddenPanel.Left = 321
            IQComponents.HiddenPanel.Top = 29
            IQComponents.HiddenPanel.Width = 209
            IQComponents.HiddenPanel.Height = 68
            IQComponents.HiddenPanel.Hint = ''
            IQComponents.HiddenPanel.Visible = True
            IQComponents.HiddenPanel.Align = alRight
            IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
            IQComponents.FormTab.Hint = ''
            IQComponents.FormTab.ImageIndex = 1
            IQComponents.FormTab.Caption = 'Form'
            IQComponents.FormTab.Layout = 'border'
            DataSource = SrcCurrency
            Columns = <
              item
                FieldName = 'CURR_CODE'
                Title.Caption = 'Currency Code'
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
                FieldName = 'GLVALUE'
                Title.Caption = 'GL Value'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'SPOT_RATE'
                Title.Caption = 'Spot rate'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'CURR_SYMBOL'
                Title.Caption = 'Currency Symbol'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'NATIVE_CURR'
                Title.Caption = 'Native Currency Code'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'USE_DAILY_RATE'
                Title.Caption = 'Use Daily Spot Rate Table for Transactions'
                Width = 64
                CheckBoxField.FieldValues = 'Y;N'
              end>
            Marker = 0
          end
          object cbCurCodeGrid: TUniDBComboBox
            Left = 88
            Top = 32
            Width = 81
            Height = 21
            Hint = ''
            Visible = False
            DataField = 'CURR_CODE'
            DataSource = SrcCurrency
            Style = csDropDownList
            Items.Strings = (
              'Afghanistan Afghani  (AFA)'#9'AFA'
              'Albania Lek  (ALL)'#9'ALL'
              'Algerian Dinar  (DZD)'#9'DZD'
              'Angola New Kwanza  (AON)'#9'AON'
              'Argentina Peso  (ARS)'#9'ARS'
              'Armenia Dram  (AMD)'#9'AMD'
              'Aruban Florin  (AWG)'#9'AWG'
              'Australian Dollar  (AUD)'#9'AUD'
              'Austrian Schilling  (ATS)'#9'ATS'
              'Azerbaijani Manat  (AZM)'#9'AZM'
              'Bahamian Dollar  (BSD)'#9'BSD'
              'Bahraini Dinar  (BHD)'#9'BHD'
              'Bangladesh Taka  (BDT)'#9'BDT'
              'Barbados Dollar  (BBD)'#9'BBD'
              'Belarussian Rouble  (BYB)'#9'BYB'
              'Belgium Franc  (BEF)'#9'BEF'
              'Belize Dollar  (BZD)'#9'BZD'
              'Bermudian Dollar  (BMD)'#9'BMD'
              'Bhutan Ngultrum  (BTN)'#9'BTN'
              'Bolivian Boliviano  (BOB)'#9'BOB'
              'Bosnian Convertible Mark  (BAM)'#9'BAM'
              'Botswana Pula  (BWP)'#9'BWP'
              'Brazilian Real  (BRL)'#9'BRL'
              'Brunei Dollar  (BND)'#9'BND'
              'Bulgaria Lev  (BGL)'#9'BGL'
              'Burundi Franc  (BIF)'#9'BIF'
              'Cambodia Riel  (KHR)'#9'KHR'
              'Canadian Dollar  (CAD)'#9'CAD'
              'Cayman Islands Dollar  (KYD)'#9'KYD'
              'CFP Franc  (XPF)'#9'XPF'
              'Chilean Peso  (CLP)'#9'CLP'
              'Chinese Renminbi Yuan  (CNY)'#9'CNY'
              'Colombian Peso  (COP)'#9'COP'
              'Comorian Franc  (KMF)'#9'KMF'
              'Costa Rican Col'#243'n  (CRC)'#9'CRC'
              'Croatia Kuna  (HRK)'#9'HRK'
              'Cuban Peso  (CUP)'#9'CUP'
              'Cypriot Pound  (CYP)'#9'CYP'
              'Czech Koruna  (CZK)'#9'CZK'
              'Danish Krone  (DKK)'#9'DKK'
              'Deutsche Mark  (DEM)'#9'DEM'
              'Djibouti Franc  (DJF)'#9'DJF'
              'Dominican Republic Peso  (DOP)'#9'DOP'
              'Dutch Guilder  (NLG)'#9'NLG'
              'East Caribbean Dollar  (XCD)'#9'XCD'
              'Ecuador Sucre  (ECS)'#9'ECS'
              'Egytian Pound  (EGP)'#9'EGP'
              'El Salvadorian Col'#243'n  (SVC)'#9'SVC'
              'Eritrea, Nakfa  (ERN)'#9'ERN'
              'Escudo Caboverdiano  (CVE)'#9'CVE'
              'Estonia Kroon  (EEK)'#9'EEK'
              'Ethiopia Birr  (ETB)'#9'ETB'
              'Euro  (EUR)'#9'EUR'
              'Falkland Pound  (FKP)'#9'FKP'
              'Fiji Dollar  (FJD)'#9'FJD'
              'Finnish Markka  (FIM)'#9'FIM'
              'Franc de la Communaut'#233' financ  (XAF)'#9'XAF'
              'French Franc  (FRF)'#9'FRF'
              'Gambia Dalasi  (GMD)'#9'GMD'
              'Georgia, Lari  (GEL)'#9'GEL'
              'Ghana Cedi  (GHC)'#9'GHC'
              'Gibraltar Pound  (GIP)'#9'GIP'
              'Greek Drachma  (GRD)'#9'GRD'
              'Guatemala Quetzal  (GTQ)'#9'GTQ'
              'Guyana Dollar  (GYD)'#9'GYD'
              'Haiti Gourde  (HTG)'#9'HTG'
              'Honduras Lempira  (HNL)'#9'HNL'
              'Hong Kong Dollar  (HKD)'#9'HKD'
              'Hungary Forint  (HUF)'#9'HUF'
              'Icelandic Kr'#243'na  (ISK)'#9'ISK'
              'Indian Rupee  (INR)'#9'INR'
              'Indonesia Rupiah  (IDR)'#9'IDR'
              'Iranian Riyal  (IRR)'#9'IRR'
              'Iraqi Dinar  (IQD)'#9'IQD'
              'Irish Punt  (IEP)'#9'IEP'
              'Israel Shekel  (ILS)'#9'ILS'
              'Italian Lira  (ITL)'#9'ITL'
              'Jamaican Dollar  (JMD)'#9'JMD'
              'Japanese Yen  (JPY)'#9'JPY'
              'Jordanian Dinar  (JOD)'#9'JOD'
              'Kazakhstan Tenge  (KZT)'#9'KZT'
              'Kenyan Shilling  (KES)'#9'KES'
              'Kuwaiti Dinar  (KWD)'#9'KWD'
              'Kyrgyzstan, Som  (KGS)'#9'KGS'
              'Laos Kip  (LAK)'#9'LAK'
              'Latvia Lat  (LVL)'#9'LVL'
              'Lebanese Pound  (LBP)'#9'LBP'
              'Lesotho Maloti  (LSL)'#9'LSL'
              'Liberian Dollar  (LRD)'#9'LRD'
              'Libyan Dinar  (LYD)'#9'LYD'
              'Lithuania Litas  (LTL)'#9'LTL'
              'Luxembourg Franc  (LUF)'#9'LUF'
              'Macao Pataca  (MOP)'#9'MOP'
              'Macedonian Denar  (MKD)'#9'MKD'
              'Malagasy Franc  (MGF)'#9'MGF'
              'Malawian Kwacha  (MWK)'#9'MWK'
              'Malaysian Ringgit  (MYR)'#9'MYR'
              'Maldives Rufiyaa  (MVR)'#9'MVR'
              'Maltese Lira  (MTL)'#9'MTL'
              'Mauritania Ouguiya  (MRO)'#9'MRO'
              'Mauritius Rupee  (MUR)'#9'MUR'
              'Mexican Peso  (MXP)'#9'MXN'
              'Moldovian Leu  (MDL)'#9'MDL'
              'Mongolia Tugrik  (MNT)'#9'MNT'
              'Moroccan Dirham  (MAD)'#9'MAD'
              'Mozambique Metical  (MZM)'#9'MZM'
              'Myanmar Kyat                (MMK)'#9'MMK'
              'Namibian Dollar  (NAD)'#9'NAD'
              'Nepalese Rupee  (NPR)'#9'NPR'
              'Netherlands Antilles Guilder  (ANG)'#9'ANG'
              'New Za'#239're  (ZRN)'#9'ZRN'
              'New Zealand Dollar  (NZD)'#9'NZD'
              'Nicaragua C'#243'rdoba  (NIC)'#9'NIC'
              'Nigeria Naira  (NGN)'#9'NGN'
              'North Korean Won  (KPW)'#9'KPW'
              'Norwegian Krone  (NOK)'#9'NOK'
              'Pakistani Rupee  (PKR)'#9'PKR'
              'Panama Balboa  (PAB)'#9'PAB'
              'Papua New Guinea Kina  (PGK)'#9'PGK'
              'Paraguay Guarani  (PYG)'#9'PYG'
              'Peru New Sol  (PEN)'#9'PEN'
              'Philippine Peso  (PHP)'#9'PHP'
              'Poland New Zloty  (PLZ)'#9'PLZ'
              'Portuguese Escudo  (PTE)'#9'PTE'
              'Qatari Riyal  (QAR)'#9'QAR'
              'Riyal Omani  (OMR)'#9'OMR'
              'Romanian Leu  (ROL)'#9'ROL'
              'Russian Federation Rouble  (RUR)'#9'RUR'
              'Rwanda Franc  (RWF)'#9'RWF'
              'S. African Rand Commerc.  (SAC)'#9'SAC'
              'S'#227'o Tom'#233' & Pr'#237'ncipe Dobra  (STD)'#9'STD'
              'Saudi Riyal  (SAR)'#9'SAR'
              'Seychelles Rupee  (SCR)'#9'SCR'
              'Sierra Leone Leone  (SLL)'#9'SLL'
              'Singapore Dollar  (SGD)'#9'SGD'
              'Slovak Koruna  (SKK)'#9'SKK'
              'Slovenia Tolar  (SIT)'#9'SIT'
              'Solomon Islands Dollar  (SBD)'#9'SBD'
              'Somali Shilling  (SOS)'#9'SOS'
              'South African Rand  (ZAR)'#9'ZAR'
              'South Korean Won  (KRW)'#9'KRW'
              'Spanish Peseta  (ESP)'#9'ESP'
              'Sri Lankan Rupee  (LKR)'#9'LKR'
              'St Helena Pound  (SHP)'#9'SHP'
              'Sterling  (GBP)'#9'GBP'
              'Sudanese Pound  (SDP)'#9'SDP'
              'Surinam Guilder  (SRG)'#9'SRG'
              'Swaziland Lilangeni  (SZL)'#9'SZL'
              'Swedish Krona  (SEK)'#9'SEK'
              'Swiss Franc  (CHF)'#9'CHF'
              'Syrian Pound  (SYP)'#9'SYP'
              'Taiwanese NT Dollar  (TWD)'#9'TWD'
              'Tajikistan, Ruble  (TJR)'#9'TJR'
              'Tanzanian Shilling  (TZS)'#9'TZS'
              'Thailand Baht  (THB)'#9'THB'
              'Tonga Palanga  (TOP)'#9'TOP'
              'Trinidad & Tobago Dollar  (TTD)'#9'TTD'
              'Tunisia Tunisian Dinar  (TND)'#9'TND'
              'Turkish Lira  (TRL)'#9'TRL'
              'Turkmenistan, Manat  (TMM)'#9'TMM'
              'UAE Dirham  (AED)'#9'AED'
              'Ugandian Shilling  (UGX)'#9'UGX'
              'Ukraine Hryvna  (UAH)'#9'UAH'
              'Uruguayan New Peso  (UYU)'#9'UYU'
              'US Dollar  (USD)'#9'USD'
              'Uzbekistani Sum  (UZS)'#9'UZS'
              'Vanuatu Vatu  (VUV)'#9'VUV'
              'Venezuela Bolivar  (VEB)'#9'VEB'
              'Vietnam Dong  (VND)'#9'VND'
              'Western Samoa Tala  (WST)'#9'WST'
              'Yemen Riyal  (YER)'#9'YER'
              'Yugoslavia New Dinar  (YUM)'#9'YUM'
              'Zambian Kwacha  (ZMK)'#9'ZMK'
              'Zimbabwe Dollar  (ZWD)'#9'ZWD')
            TabOrder = 1
          end
          object cbNatCurCodeGrid: TUniDBComboBox
            Left = 88
            Top = 56
            Width = 81
            Height = 21
            Hint = ''
            Visible = False
            DataField = 'NATIVE_CURR'
            DataSource = SrcCurrency
            Style = csDropDownList
            Items.Strings = (
              'Afghanistan Afghani  (AFA)'#9'AFA'
              'Albania Lek  (ALL)'#9'ALL'
              'Algerian Dinar  (DZD)'#9'DZD'
              'Angola New Kwanza  (AON)'#9'AON'
              'Argentina Peso  (ARS)'#9'ARS'
              'Armenia Dram  (AMD)'#9'AMD'
              'Aruban Florin  (AWG)'#9'AWG'
              'Australian Dollar  (AUD)'#9'AUD'
              'Austrian Schilling  (ATS)'#9'ATS'
              'Azerbaijani Manat  (AZM)'#9'AZM'
              'Bahamian Dollar  (BSD)'#9'BSD'
              'Bahraini Dinar  (BHD)'#9'BHD'
              'Bangladesh Taka  (BDT)'#9'BDT'
              'Barbados Dollar  (BBD)'#9'BBD'
              'Belarussian Rouble  (BYB)'#9'BYB'
              'Belgium Franc  (BEF)'#9'BEF'
              'Belize Dollar  (BZD)'#9'BZD'
              'Bermudian Dollar  (BMD)'#9'BMD'
              'Bhutan Ngultrum  (BTN)'#9'BTN'
              'Bolivian Boliviano  (BOB)'#9'BOB'
              'Bosnian Convertible Mark  (BAM)'#9'BAM'
              'Botswana Pula  (BWP)'#9'BWP'
              'Brazilian Real  (BRL)'#9'BRL'
              'Brunei Dollar  (BND)'#9'BND'
              'Bulgaria Lev  (BGL)'#9'BGL'
              'Burundi Franc  (BIF)'#9'BIF'
              'Cambodia Riel  (KHR)'#9'KHR'
              'Canadian Dollar  (CAD)'#9'CAD'
              'Cayman Islands Dollar  (KYD)'#9'KYD'
              'CFP Franc  (XPF)'#9'XPF'
              'Chilean Peso  (CLP)'#9'CLP'
              'Chinese Renminbi Yuan  (CNY)'#9'CNY'
              'Colombian Peso  (COP)'#9'COP'
              'Comorian Franc  (KMF)'#9'KMF'
              'Costa Rican Col'#243'n  (CRC)'#9'CRC'
              'Croatia Kuna  (HRK)'#9'HRK'
              'Cuban Peso  (CUP)'#9'CUP'
              'Cypriot Pound  (CYP)'#9'CYP'
              'Czech Koruna  (CZK)'#9'CZK'
              'Danish Krone  (DKK)'#9'DKK'
              'Deutsche Mark  (DEM)'#9'DEM'
              'Djibouti Franc  (DJF)'#9'DJF'
              'Dominican Republic Peso  (DOP)'#9'DOP'
              'Dutch Guilder  (NLG)'#9'NLG'
              'East Caribbean Dollar  (XCD)'#9'XCD'
              'Ecuador Sucre  (ECS)'#9'ECS'
              'Egytian Pound  (EGP)'#9'EGP'
              'El Salvadorian Col'#243'n  (SVC)'#9'SVC'
              'Eritrea, Nakfa  (ERN)'#9'ERN'
              'Escudo Caboverdiano  (CVE)'#9'CVE'
              'Estonia Kroon  (EEK)'#9'EEK'
              'Ethiopia Birr  (ETB)'#9'ETB'
              'Euro  (EUR)'#9'EUR'
              'Falkland Pound  (FKP)'#9'FKP'
              'Fiji Dollar  (FJD)'#9'FJD'
              'Finnish Markka  (FIM)'#9'FIM'
              'Franc de la Communaut'#233' financ  (XAF)'#9'XAF'
              'French Franc  (FRF)'#9'FRF'
              'Gambia Dalasi  (GMD)'#9'GMD'
              'Georgia, Lari  (GEL)'#9'GEL'
              'Ghana Cedi  (GHC)'#9'GHC'
              'Gibraltar Pound  (GIP)'#9'GIP'
              'Greek Drachma  (GRD)'#9'GRD'
              'Guatemala Quetzal  (GTQ)'#9'GTQ'
              'Guyana Dollar  (GYD)'#9'GYD'
              'Haiti Gourde  (HTG)'#9'HTG'
              'Honduras Lempira  (HNL)'#9'HNL'
              'Hong Kong Dollar  (HKD)'#9'HKD'
              'Hungary Forint  (HUF)'#9'HUF'
              'Icelandic Kr'#243'na  (ISK)'#9'ISK'
              'Indian Rupee  (INR)'#9'INR'
              'Indonesia Rupiah  (IDR)'#9'IDR'
              'Iranian Riyal  (IRR)'#9'IRR'
              'Iraqi Dinar  (IQD)'#9'IQD'
              'Irish Punt  (IEP)'#9'IEP'
              'Israel Shekel  (ILS)'#9'ILS'
              'Italian Lira  (ITL)'#9'ITL'
              'Jamaican Dollar  (JMD)'#9'JMD'
              'Japanese Yen  (JPY)'#9'JPY'
              'Jordanian Dinar  (JOD)'#9'JOD'
              'Kazakhstan Tenge  (KZT)'#9'KZT'
              'Kenyan Shilling  (KES)'#9'KES'
              'Kuwaiti Dinar  (KWD)'#9'KWD'
              'Kyrgyzstan, Som  (KGS)'#9'KGS'
              'Laos Kip  (LAK)'#9'LAK'
              'Latvia Lat  (LVL)'#9'LVL'
              'Lebanese Pound  (LBP)'#9'LBP'
              'Lesotho Maloti  (LSL)'#9'LSL'
              'Liberian Dollar  (LRD)'#9'LRD'
              'Libyan Dinar  (LYD)'#9'LYD'
              'Lithuania Litas  (LTL)'#9'LTL'
              'Luxembourg Franc  (LUF)'#9'LUF'
              'Macao Pataca  (MOP)'#9'MOP'
              'Macedonian Denar  (MKD)'#9'MKD'
              'Malagasy Franc  (MGF)'#9'MGF'
              'Malawian Kwacha  (MWK)'#9'MWK'
              'Malaysian Ringgit  (MYR)'#9'MYR'
              'Maldives Rufiyaa  (MVR)'#9'MVR'
              'Maltese Lira  (MTL)'#9'MTL'
              'Mauritania Ouguiya  (MRO)'#9'MRO'
              'Mauritius Rupee  (MUR)'#9'MUR'
              'Mexican Peso  (MXN)'#9'MXN'
              'Moldovian Leu  (MDL)'#9'MDL'
              'Mongolia Tugrik  (MNT)'#9'MNT'
              'Moroccan Dirham  (MAD)'#9'MAD'
              'Mozambique Metical  (MZM)'#9'MZM'
              'Myanmar Kyat                (MMK)'#9'MMK'
              'Namibian Dollar  (NAD)'#9'NAD'
              'Nepalese Rupee  (NPR)'#9'NPR'
              'Netherlands Antilles Guilder  (ANG)'#9'ANG'
              'New Za'#239're  (ZRN)'#9'ZRN'
              'New Zealand Dollar  (NZD)'#9'NZD'
              'Nicaragua C'#243'rdoba  (NIC)'#9'NIC'
              'Nigeria Naira  (NGN)'#9'NGN'
              'North Korean Won  (KPW)'#9'KPW'
              'Norwegian Krone  (NOK)'#9'NOK'
              'Pakistani Rupee  (PKR)'#9'PKR'
              'Panama Balboa  (PAB)'#9'PAB'
              'Papua New Guinea Kina  (PGK)'#9'PGK'
              'Paraguay Guarani  (PYG)'#9'PYG'
              'Peru New Sol  (PEN)'#9'PEN'
              'Philippine Peso  (PHP)'#9'PHP'
              'Poland New Zloty  (PLZ)'#9'PLZ'
              'Portuguese Escudo  (PTE)'#9'PTE'
              'Qatari Riyal  (QAR)'#9'QAR'
              'Riyal Omani  (OMR)'#9'OMR'
              'Romanian Leu  (ROL)'#9'ROL'
              'Russian Federation Rouble  (RUR)'#9'RUR'
              'Rwanda Franc  (RWF)'#9'RWF'
              'S. African Rand Commerc.  (SAC)'#9'SAC'
              'S'#227'o Tom'#233' & Pr'#237'ncipe Dobra  (STD)'#9'STD'
              'Saudi Riyal  (SAR)'#9'SAR'
              'Seychelles Rupee  (SCR)'#9'SCR'
              'Sierra Leone Leone  (SLL)'#9'SLL'
              'Singapore Dollar  (SGD)'#9'SGD'
              'Slovak Koruna  (SKK)'#9'SKK'
              'Slovenia Tolar  (SIT)'#9'SIT'
              'Solomon Islands Dollar  (SBD)'#9'SBD'
              'Somali Shilling  (SOS)'#9'SOS'
              'South African Rand  (ZAR)'#9'ZAR'
              'South Korean Won  (KRW)'#9'KRW'
              'Spanish Peseta  (ESP)'#9'ESP'
              'Sri Lankan Rupee  (LKR)'#9'LKR'
              'St Helena Pound  (SHP)'#9'SHP'
              'Sterling  (GBP)'#9'GBP'
              'Sudanese Pound  (SDP)'#9'SDP'
              'Surinam Guilder  (SRG)'#9'SRG'
              'Swaziland Lilangeni  (SZL)'#9'SZL'
              'Swedish Krona  (SEK)'#9'SEK'
              'Swiss Franc  (CHF)'#9'CHF'
              'Syrian Pound  (SYP)'#9'SYP'
              'Taiwanese NT Dollar  (TWD)'#9'TWD'
              'Tajikistan, Ruble  (TJR)'#9'TJR'
              'Tanzanian Shilling  (TZS)'#9'TZS'
              'Thailand Baht  (THB)'#9'THB'
              'Tonga Palanga  (TOP)'#9'TOP'
              'Trinidad & Tobago Dollar  (TTD)'#9'TTD'
              'Tunisia Tunisian Dinar  (TND)'#9'TND'
              'Turkish Lira  (TRL)'#9'TRL'
              'Turkmenistan, Manat  (TMM)'#9'TMM'
              'UAE Dirham  (AED)'#9'AED'
              'Ugandian Shilling  (UGX)'#9'UGX'
              'Ukraine Hryvna  (UAH)'#9'UAH'
              'Uruguayan New Peso  (UYU)'#9'UYU'
              'US Dollar  (USD)'#9'USD'
              'Uzbekistani Sum  (UZS)'#9'UZS'
              'Vanuatu Vatu  (VUV)'#9'VUV'
              'Venezuela Bolivar  (VEB)'#9'VEB'
              'Vietnam Dong  (VND)'#9'VND'
              'Western Samoa Tala  (WST)'#9'WST'
              'Yemen Riyal  (YER)'#9'YER'
              'Yugoslavia New Dinar  (YUM)'#9'YUM'
              'Zambian Kwacha  (ZMK)'#9'ZMK'
              'Zimbabwe Dollar  (ZWD)'#9'ZWD')
            TabOrder = 2
          end
        end
      end
    end
    object Panel3: TUniPanel
      Left = 1
      Top = 1
      Width = 548
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object sbSearch: TUniSpeedButton
        Left = 0
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Search... '
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB18C76A07860
          90604090584090584087492AFF00FFFF00FFFF00FFB485659C755DA070509058
          40905030773818FF00FFB09080FFF8FFE0C8C0D0A090C08060804020FF00FFFF
          00FFFF00FFB08060F0E8E0E0C8C0D0A890B07850804820FF00FFB09080FFF8FF
          E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
          B0C08870804830FF00FFB09080FFF8FFE0C8C0D0A090C08060804020FF00FFFF
          00FFFF00FFB08060F0E8E0F0E0E0E0C0B0C08870804830FF00FFC09880FFFFFF
          F0E8E0E0C8C0D0A080804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
          B0C08870804830FF00FFC3A494B08870A068509050308048308048208038108F
          4C26B08870A06850905830904830804020703810905830FF00FFDEC4B4B08870
          FFFFFFE0D0C0D0A090A07050804010D5B89CB09070E0D8D0F0D8D0D0A090B078
          50803820CFA98AFF00FFFF00FFC09080F0F0F0FFF8F0F0D8C0B0806080482096
          5732B09070FFFFFFFFF8F0F0D0C0B07850804820FF00FFFF00FFFF00FFF8E2D2
          C09880B08060A068509050309058409D6842B07860B08870A070508048308048
          20ECC4A7FF00FFFF00FFFF00FFFF00FFC09880FFF8FFE0C0B0C09070804820FF
          00FFC09880FFF8FFE0C8B0D0A080804820FF00FFFF00FFFF00FFFF00FFFF00FF
          CFB1A1B09080A06850905030875139FF00FFC0A890B09080A06850905030864F
          37FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1836DFFF8F0814527FF00FFFF
          00FFFF00FFB08068FFF8F0804324FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFC7A898B48D759D6843FF00FFFF00FFFF00FFCEAE9CB48C749C6640FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = sbSearchClick
      end
      object sbToggle: TUniSpeedButton
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
        ParentColor = False
        Color = clWindow
        OnClick = sbToggleClick
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 216
    Width = 550
    Height = 264
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PC2: TUniPageControl
      Left = 1
      Top = 1
      Width = 548
      Height = 262
      Hint = ''
      ActivePage = TabLang
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabRate: TUniTabSheet
        Hint = ''
        Caption = 'Rate'
        object IQSearch1: TIQUniGridControl
          Left = 0
          Top = 27
          Width = 540
          Height = 207
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 323
          IQComponents.Grid.Height = 121
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcCurrPost
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
          IQComponents.Navigator.DataSource = SrcCurrPost
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 323
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 121
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcCurrPost
          Columns = <
            item
              FieldName = 'BALSHEET_RATE'
              Title.Caption = 'Bal. Sheet Rate'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'GLPERIOD'
              Title.Caption = 'GL Period'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'END_DATE'
              Title.Caption = 'End Date'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'START_DATE'
              Title.Caption = 'Start Date'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
          object wwDBPeriod: TUniEdit
            Left = 200
            Top = 40
            Width = 121
            Height = 21
            Hint = ''
            Text = ''
            TabOrder = 2
          end
        end
        object Panel4: TUniPanel
          Left = 0
          Top = 0
          Width = 540
          Height = 27
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Caption = ''
        end
      end
      object TabLang: TUniTabSheet
        Hint = ''
        ImageIndex = 1
        Caption = 'Language'
        object IQSearch2: TIQUniGridControl
          Left = 0
          Top = 27
          Width = 540
          Height = 207
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 323
          IQComponents.Grid.Height = 121
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcLang
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
          IQComponents.Navigator.DataSource = SrcLang
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 323
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 121
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcLang
          Columns = <
            item
              FieldName = 'LANGUAGE_CODE'
              Title.Caption = 'Language Code'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DESCRIP'
              Title.Caption = 'Description'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
          object wwDBLang: TUniDBComboBox
            Left = 184
            Top = 48
            Width = 121
            Height = 21
            Hint = ''
            Style = csDropDownList
            Items.Strings = (
              'English'#9'eng'
              'French'#9'fra'
              'German'#9'ger'
              'Spanish'#9'spa')
            TabOrder = 2
          end
        end
        object Panel5: TUniPanel
          Left = 0
          Top = 0
          Width = 540
          Height = 27
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Caption = ''
        end
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 320
    Top = 240
    object File1: TUniMenuItem
      Caption = '&File'
      object New1: TUniMenuItem
        Caption = '&New'
        OnClick = New1Click
      end
      object N2: TUniMenuItem
        Caption = '-'
      end
      object Toggle1: TUniMenuItem
        Caption = '&Toggle'
        OnClick = sbToggleClick
      end
      object Search1: TUniMenuItem
        Caption = '&Search'
        OnClick = sbSearchClick
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Options1: TUniMenuItem
      Caption = '&Options'
      object SpotRateHistory1: TUniMenuItem
        Caption = '&Spot Rate History'
        OnClick = SpotRateHistory1Click
      end
      object N4: TUniMenuItem
        Caption = '-'
      end
      object Initializemulticurrency1: TUniMenuItem
        Caption = 'Initialize Multi-Currency'
        OnClick = Initializemulticurrency1Click
      end
    end
    object Print1: TUniMenuItem
      Caption = '&Print'
      object Print2: TUniMenuItem
        Caption = '&Print'
        OnClick = Print2Click
      end
      object PrinterSetUp1: TUniMenuItem
        Caption = 'Printer &Setup'
        OnClick = PrinterSetUp1Click
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
  object SrcCurrency: TDataSource
    DataSet = tblCurrency
    Left = 16
    Top = 240
  end
  object tblCurrency: TFDTable
    BeforePost = tblCurrencyBeforePost
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'CURRENCY'
    TableName = 'CURRENCY'
    Left = 24
    Top = 240
    object tblCurrencyCURR_CODE: TStringField
      DisplayLabel = 'Currency Code'
      DisplayWidth = 10
      FieldName = 'CURR_CODE'
      Size = 10
    end
    object tblCurrencyDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 50
      FieldName = 'DESCRIP'
      Size = 50
    end
    object tblCurrencyGLVALUE: TStringField
      DisplayLabel = 'GL Value'
      DisplayWidth = 50
      FieldName = 'GLVALUE'
      Size = 50
    end
    object tblCurrencySPOT_RATE: TFMTBCDField
      DisplayLabel = 'Spot rate'
      DisplayWidth = 10
      FieldName = 'SPOT_RATE'
      Size = 6
    end
    object tblCurrencyCURR_SYMBOL: TStringField
      DisplayLabel = 'Currency Symbol'
      DisplayWidth = 10
      FieldName = 'CURR_SYMBOL'
      Size = 10
    end
    object tblCurrencyNATIVE_CURR: TStringField
      DisplayLabel = 'Native Currency Code'
      DisplayWidth = 3
      FieldName = 'NATIVE_CURR'
      Size = 3
    end
    object tblCurrencyUSE_DAILY_RATE: TStringField
      DisplayLabel = 'Use Daily Spot Rate Table for Transactions'
      DisplayWidth = 1
      FieldName = 'USE_DAILY_RATE'
      FixedChar = True
      Size = 1
    end
    object tblCurrencyID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
  end
  object SrcCurrPost: TDataSource
    DataSet = QryCurrPost
    Left = 72
    Top = 240
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Multi-Currency'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 194773 $'
    BuildVersion = '176554'
    Left = 272
    Top = 244
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmMCrates'
    WebUse = False
    TouchScreen = False
    Left = 232
    Top = 244
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 200
    Top = 244
  end
  object PKCurrency: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       curr_code,'
      '       descrip,'
      '       spot_rate,'
      '       curr_symbol,'
      '       native_curr'
      '  from currency'
      '')
    OnIQModify = PKCurrencyIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 352
    Top = 244
    object PKCurrencyID: TBCDField
      FieldName = 'ID'
      Origin = 'CURRENCY.ID'
      Visible = False
      Size = 0
    end
    object PKCurrencyCURR_CODE: TStringField
      DisplayLabel = 'Currency Code'
      FieldName = 'CURR_CODE'
      Origin = 'CURRENCY.CURR_CODE'
      Size = 10
    end
    object PKCurrencyDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'CURRENCY.DESCRIP'
      Size = 50
    end
    object PKCurrencySPOT_RATE: TFMTBCDField
      DisplayLabel = 'Spot Rate'
      FieldName = 'SPOT_RATE'
      Origin = 'CURRENCY.SPOT_RATE'
      Size = 6
    end
    object PKCurrencyNATIVE_CURR: TStringField
      DisplayLabel = 'Native Currency'
      FieldName = 'NATIVE_CURR'
      Origin = 'IQ.CURRENCY.NATIVE_CURR'
      Size = 3
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 144
    Top = 212
    object Trace1: TUniMenuItem
      Caption = '&Trace'
      OnClick = Trace1Click
    end
    object N3: TUniMenuItem
      Caption = '-'
    end
    object SpotRateHistory2: TUniMenuItem
      Caption = '&Spot Rate History'
      OnClick = SpotRateHistory1Click
    end
  end
  object QryCurrPost: TFDQuery
    BeforeInsert = QryCurrPostBeforeEdit
    BeforeEdit = QryCurrPostBeforeEdit
    BeforePost = QryCurrPostBeforePost
    MasterSource = SrcCurrency
    MasterFields = 'ID'
    DetailFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.UpdateTableName = 'CURRENCYPOST'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select c.id,'
      '       c.currency_id,'
      '       c.balsheet_rate,'
      '       c.glperiods_id,'
      '       p.period as glperiod,'
      '      p.start_date,'
      '     p.end_date'
      ' from CURRENCYPOST c,'
      '        glperiods p'
      'where currency_id = :ID'
      '  and c.glperiods_id = p.id(+)')
    Left = 96
    Top = 248
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 10000c
      end>
    object QryCurrPostBALSHEET_RATE: TFMTBCDField
      DisplayLabel = 'Bal. Sheet Rate'
      DisplayWidth = 10
      FieldName = 'BALSHEET_RATE'
      Origin = 'c.BALSHEET_RATE'
      Size = 6
    end
    object QryCurrPostGLPERIOD: TBCDField
      DisplayLabel = 'GL Period'
      DisplayWidth = 10
      FieldName = 'GLPERIOD'
      Origin = 'p.period'
      Size = 0
    end
    object QryCurrPostEND_DATE: TDateTimeField
      DisplayLabel = 'End Date'
      DisplayWidth = 18
      FieldName = 'END_DATE'
      Origin = 'p.end_date'
      ReadOnly = True
    end
    object QryCurrPostSTART_DATE: TDateTimeField
      DisplayLabel = 'Start Date'
      DisplayWidth = 18
      FieldName = 'START_DATE'
      Origin = 'p.start_date'
      ReadOnly = True
    end
    object QryCurrPostID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'c.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryCurrPostCURRENCY_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'CURRENCY_ID'
      Origin = 'c.CURRENCY_ID'
      Visible = False
      Size = 0
    end
    object QryCurrPostGLPERIODS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'GLPERIODS_ID'
      Origin = 'c.GLPERIODS_ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into CURRENCYPOST'
      '  (ID, CURRENCY_ID, BALSHEET_RATE, GLPERIODS_ID)'
      'values'
      '  (:ID, :CURRENCY_ID, :BALSHEET_RATE, :GLPERIODS_ID)')
    ModifySQL.Strings = (
      'update CURRENCYPOST'
      'set'
      '  ID = :ID,'
      '  CURRENCY_ID = :CURRENCY_ID,'
      '  BALSHEET_RATE = :BALSHEET_RATE,'
      '  GLPERIODS_ID = :GLPERIODS_ID'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from CURRENCYPOST'
      'where'
      '  ID = :OLD_ID')
    Left = 96
    Top = 280
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'navCurrency'
      'sbSearch'
      'sbToggle'
      'cbCurrCodeForm'
      'dbCurSymbol'
      'eGlValue'
      'edSpotRate'
      'edDescrip'
      'wwNative'
      'wwCheckBox1'
      'navCurrPost'
      'SpotRateHistory2'
      'New1'
      'Toggle1'
      'Search1'
      'SpotRateHistory1'
      'Print2'
      'Initializemulticurrency1')
    SecurityCode = 'FRMMCRATES'
    Left = 308
    Top = 97
  end
  object SrcLang: TDataSource
    DataSet = QryLang
    Left = 60
    Top = 323
  end
  object QryLang: TFDQuery
    BeforeInsert = QryLangBeforeEdit
    BeforeEdit = QryLangBeforeEdit
    BeforePost = QryLangBeforePost
    OnNewRecord = QryLangNewRecord
    MasterSource = SrcCurrency
    MasterFields = 'ID'
    DetailFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.UpdateTableName = 'CURRENCY_LANGUAGE'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL2
    SQL.Strings = (
      'select id,'
      '       currency_id,'
      '       language_code,'
      '       descrip'
      '  from CURRENCY_LANGUAGE'
      ' where currency_id = :ID')
    Left = 64
    Top = 336
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 10000c
      end>
    object QryLangLANGUAGE_CODE: TStringField
      DisplayLabel = 'Language Code'
      DisplayWidth = 3
      FieldName = 'LANGUAGE_CODE'
      Origin = 'LANGUAGE_CODE'
      Size = 3
    end
    object QryLangDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 50
    end
    object QryLangID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryLangCURRENCY_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'CURRENCY_ID'
      Origin = 'CURRENCY_ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQL2: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into CURRENCY_LANGUAGE'
      '  (ID, CURRENCY_ID, LANGUAGE_CODE, DESCRIP)'
      'values'
      '  (:ID, :CURRENCY_ID, :LANGUAGE_CODE, :DESCRIP)')
    ModifySQL.Strings = (
      'update CURRENCY_LANGUAGE'
      'set'
      '  ID = :ID,'
      '  CURRENCY_ID = :CURRENCY_ID,'
      '  LANGUAGE_CODE = :LANGUAGE_CODE,'
      '  DESCRIP = :DESCRIP'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from CURRENCY_LANGUAGE'
      'where'
      '  ID = :OLD_ID')
    Left = 64
    Top = 368
  end
end
