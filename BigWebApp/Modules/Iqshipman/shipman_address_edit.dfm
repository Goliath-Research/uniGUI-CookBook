object FrmShipManAddrError: TFrmShipManAddrError
  Left = 334
  Top = 149
  ClientHeight = 438
  ClientWidth = 500
  Caption = 'Incomplete Address'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Left = 0
    Top = 397
    Width = 500
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Left = 286
      Top = 1
      Width = 214
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniBitBtn
        Left = 7
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 0
        Default = True
        OnClick = btnOkClick
      end
      object btnCancel: TUniBitBtn
        Left = 110
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  object PnlPrompt: TUniPanel
    Left = 0
    Top = 0
    Width = 500
    Height = 62
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object lblPrompt: TUniLabel
      Left = 1
      Top = 1
      Width = 970
      Height = 13
      Hint = ''
      Caption = 
        'The Packing Slip Shipping Address is incomplete.  Please enter t' +
        'he required values (bold).  A postal code is required for Canada' +
        ' and the United States of America, and may be required by other ' +
        'countries.'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
    end
  end
  object sbAddress: TUniScrollBox
    Left = 0
    Top = 62
    Width = 500
    Height = 335
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    ScrollHeight = 305
    object PnlDBEditControls: TUniPanel
      Left = 0
      Top = 0
      Width = 498
      Height = 305
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object Splitter1: TUniSplitter
        Left = 121
        Top = 0
        Width = 6
        Height = 305
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object PnlLabels: TUniPanel
        Left = 1
        Top = 1
        Width = 121
        Height = 303
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object lblPackslipno: TUniLabel
          Left = 8
          Top = 4
          Width = 66
          Height = 13
          Hint = ''
          Caption = 'Packing Slip #'
          TabOrder = 1
        end
        object lblCompany: TUniLabel
          Left = 8
          Top = 28
          Width = 45
          Height = 13
          Hint = ''
          Caption = 'Company'
          TabOrder = 2
        end
        object lblAddr1: TUniLabel
          Left = 8
          Top = 76
          Width = 56
          Height = 13
          Hint = ''
          Caption = 'Address 1'
          ParentFont = False
          Font.Style = [fsBold]
          TabOrder = 3
        end
        object lblAddr2: TUniLabel
          Left = 8
          Top = 100
          Width = 48
          Height = 13
          Hint = ''
          Caption = 'Address 2'
          TabOrder = 4
        end
        object lblAddr3: TUniLabel
          Left = 8
          Top = 124
          Width = 48
          Height = 13
          Hint = ''
          Caption = 'Address 3'
          TabOrder = 5
        end
        object lblCity: TUniLabel
          Left = 8
          Top = 148
          Width = 22
          Height = 13
          Hint = ''
          Caption = 'City'
          ParentFont = False
          Font.Style = [fsBold]
          TabOrder = 6
        end
        object lblState: TUniLabel
          Left = 8
          Top = 172
          Width = 88
          Height = 13
          Hint = ''
          Caption = 'State or Region'
          ParentFont = False
          Font.Style = [fsBold]
          TabOrder = 7
        end
        object lblZip: TUniLabel
          Left = 8
          Top = 196
          Width = 66
          Height = 13
          Hint = ''
          Caption = 'Postal Code'
          ParentFont = False
          Font.Style = [fsBold]
          TabOrder = 8
        end
        object lblCountry: TUniLabel
          Left = 8
          Top = 220
          Width = 45
          Height = 13
          Hint = ''
          Caption = 'Country'
          ParentFont = False
          Font.Style = [fsBold]
          TabOrder = 9
        end
        object lblTelephone: TUniLabel
          Left = 8
          Top = 244
          Width = 71
          Height = 13
          Hint = ''
          Caption = 'Telephone #'
          ParentFont = False
          Font.Style = [fsBold]
          TabOrder = 10
        end
        object lblContact: TUniLabel
          Left = 8
          Top = 52
          Width = 44
          Height = 13
          Hint = ''
          Caption = 'Contact'
          ParentFont = False
          Font.Style = [fsBold]
          TabOrder = 11
        end
        object lblEmail: TUniLabel
          Left = 8
          Top = 268
          Width = 24
          Height = 13
          Hint = ''
          Caption = 'Email'
          TabOrder = 12
        end
      end
      object pnlFields: TUniPanel
        Left = 127
        Top = 1
        Width = 371
        Height = 303
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object Splitter2: TUniSplitter
          Left = 0
          Top = 0
          Width = 1
          Height = 303
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object PnlEditBoxes: TUniPanel
          Left = 1
          Top = 1
          Width = 370
          Height = 301
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          DesignSize = (
            370
            301)
          object sbtnLookupZipCode: TUniSpeedButton
            Left = 164
            Top = 192
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
          object dbePackslipno: TUniDBEdit
            Left = 1
            Top = 1
            Width = 160
            Height = 21
            Hint = ''
            DataField = 'PACKSLIPNO'
            DataSource = srcShipments
            TabOrder = 0
            Color = clBtnFace
            ReadOnly = True
          end
          object dbeCompany: TUniDBEdit
            Left = 1
            Top = 24
            Width = 369
            Height = 21
            Hint = ''
            DataField = 'SHIP_TO_ATTN'
            DataSource = srcShipments
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object dbeAddr1: TUniDBEdit
            Left = 1
            Top = 72
            Width = 369
            Height = 21
            Hint = ''
            DataField = 'SHIP_TO_ADDR1'
            DataSource = srcShipments
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
            OnChange = DoAddressChange
          end
          object dbeAddr2: TUniDBEdit
            Left = 1
            Top = 96
            Width = 369
            Height = 21
            Hint = ''
            DataField = 'SHIP_TO_ADDR2'
            DataSource = srcShipments
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
            OnChange = DoAddressChange
          end
          object dbeAddr3: TUniDBEdit
            Left = 1
            Top = 120
            Width = 369
            Height = 21
            Hint = ''
            DataField = 'SHIP_TO_ADDR3'
            DataSource = srcShipments
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 5
            OnChange = DoAddressChange
          end
          object dbeCity: TUniDBEdit
            Left = 1
            Top = 144
            Width = 369
            Height = 21
            Hint = ''
            DataField = 'SHIP_TO_CITY'
            DataSource = srcShipments
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 6
            OnChange = DoAddressChange
          end
          object dbeZip: TUniDBEdit
            Left = 1
            Top = 192
            Width = 160
            Height = 21
            Hint = ''
            DataField = 'SHIP_TO_ZIP'
            DataSource = srcShipments
            TabOrder = 8
            OnChange = DoAddressChange
          end
          object cmbCountry: TUniDBComboBox
            Left = 1
            Top = 216
            Width = 372
            Height = 21
            Hint = ''
            Anchors = [akLeft, akTop, akRight]
            DataField = 'SHIP_TO_COUNTRY_CODE'
            DataSource = srcShipments
            Style = csDropDownList
            TabOrder = 9
            OnCloseUp = cmbCountryCloseUp
          end
          object cmbState: TUniDBComboBox
            Left = 1
            Top = 168
            Width = 225
            Height = 21
            Hint = ''
            Anchors = [akLeft, akTop, akRight]
            DataField = 'SHIP_TO_STATE'
            DataSource = srcShipments
            TabOrder = 7
            OnDropDown = cmbStateDropDown
          end
          object dbeTelephone: TUniDBEdit
            Left = 1
            Top = 240
            Width = 160
            Height = 21
            Hint = ''
            DataField = 'SHIP_TO_PHONE_NUMBER'
            DataSource = srcShipments
            TabOrder = 10
          end
          object dbeContact: TUniDBEdit
            Left = 1
            Top = 48
            Width = 372
            Height = 21
            Hint = ''
            DataField = 'SHIP_TO_PRIME_CONTACT'
            DataSource = srcShipments
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
          object dbeEmail: TUniDBEdit
            Left = 1
            Top = 264
            Width = 160
            Height = 21
            Hint = ''
            DataField = 'SHIP_TO_CONTACT_EMAIL'
            DataSource = srcShipments
            TabOrder = 11
          end
        end
        object pnlSuggestedChanges: TUniPanel
          Left = 371
          Top = 1
          Width = 0
          Height = 301
          Hint = ''
          Visible = False
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object pnlSugChangeFields: TUniPanel
            Left = 33
            Top = 1
            Width = 167
            Height = 299
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            DesignSize = (
              167
              299)
            object lblSuggestedChanges: TUniLabel
              Left = 6
              Top = 3
              Width = 114
              Height = 13
              Hint = ''
              Caption = 'Suggested Changes:'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 1
            end
            object cmbSugAddr1: TUniComboBox
              Left = 1
              Top = 72
              Width = 165
              Height = 21
              Hint = ''
              Text = ''
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              OnChange = cmbSuggestionChange
            end
            object cmbSugAddr2: TUniComboBox
              Left = 1
              Top = 96
              Width = 165
              Height = 21
              Hint = ''
              Text = ''
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 3
              OnChange = cmbSuggestionChange
            end
            object cmbSugCompany: TUniComboBox
              Left = 1
              Top = 24
              Width = 165
              Height = 21
              Hint = ''
              Text = ''
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 4
              OnChange = cmbSuggestionChange
            end
            object cmbSugAddr3: TUniComboBox
              Left = 1
              Top = 120
              Width = 165
              Height = 21
              Hint = ''
              Text = ''
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 5
              OnChange = cmbSuggestionChange
            end
            object cmbSugCity: TUniComboBox
              Left = 1
              Top = 144
              Width = 165
              Height = 21
              Hint = ''
              Text = ''
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 6
              OnChange = cmbSuggestionChange
            end
            object cmbSugState: TUniComboBox
              Left = 1
              Top = 168
              Width = 165
              Height = 21
              Hint = ''
              Text = ''
              TabOrder = 7
              OnChange = cmbSuggestionChange
            end
            object cmbSugZip: TUniComboBox
              Left = 1
              Top = 192
              Width = 165
              Height = 21
              Hint = ''
              Text = ''
              TabOrder = 8
              OnChange = cmbSuggestionChange
            end
            object cmbSugContact: TUniComboBox
              Left = 1
              Top = 48
              Width = 165
              Height = 21
              Hint = ''
              Text = ''
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 9
              OnChange = cmbSuggestionChange
            end
          end
          object pnlSugChangesButtons: TUniPanel
            Left = 1
            Top = 1
            Width = 33
            Height = 299
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 1
            Caption = ''
            object sbtnLeft: TUniSpeedButton
              Left = 4
              Top = 122
              Width = 25
              Height = 25
              Hint = 'Remove from proposed pick ticket'
              Glyph.Data = {
                46010000424D460100000000000076000000280000001A0000000D0000000100
                040000000000D000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                DDDDDDDDDDDDDD000000DDDDDD0DDDDDDDDDDDD7FDDDDD000000DDDDD00DDDDD
                DDDDDD77FDDDDD000000DDDD060DDDDDDDDDD7D7FFFFFD000000DDD06600000D
                DDDD7DD77777FD000000DD066666660DDDD7DDDDDDD7FD000000D0666666660D
                DD78FDDDDDD7FD000000DD066666660DDDD78FDDFFF7FD000000DDD06600000D
                DDDD78F77777DD000000DDDD060DDDDDDDDDD787FDDDDD000000DDDDD00DDDDD
                DDDDDD77FDDDDD000000DDDDDD0DDDDDDDDDDDD7DDDDDD000000DDDDDDDDDDDD
                DDDDDDDDDDDDDD000000}
              Caption = ''
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Style = [fsBold]
              ParentColor = False
              Color = clWindow
              OnClick = sbtnLeftClick
            end
          end
        end
      end
    end
  end
  object qryShipment: TFDQuery
    BeforeOpen = qryShipmentBeforeOpen
    AfterPost = qryShipmentAfterPost
    CachedUpdates = True
    OnUpdateRecord = qryShipmentUpdateRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    SQL.Strings = (
      'SELECT a.source_id, a.source, a.packslipno, '
      '       a.ship_to_attn,'
      '       a.ship_to_addr1, a.ship_to_addr2, a.ship_to_addr3,'
      '       a.ship_to_city, a.ship_to_state, a.ship_to_country,'
      
        '       a.ship_to_country_code, a.ship_to_zip, a.ship_to_phone_nu' +
        'mber,'
      '       a.ship_to_prime_contact, a.ship_to_contact_email,'
      '       a.ship_residential,'
      '       a.dist_center_id,'
      '       a.ignore_dist_center'
      '  FROM v_packslips a'
      '  WHERE a.source = :SOURCE'
      '  AND a.source_id = :SOURCE_ID'
      'UNION'
      'SELECT a.id, '#39'RETURN_SHIPMENT_FROM'#39', a.packslipno, '
      '       a.ship_from_attn,'
      '       a.ship_from_addr1, a.ship_from_addr2, a.ship_from_addr3,'
      '       a.ship_from_city, a.ship_from_state,'
      
        '       to_char(substr(country_code.getcountrynamefor(a.ship_from' +
        '_country_code), 1, 60)) ship_to_country,'
      
        '       a.ship_from_country_code, a.ship_from_zip, a.ship_from_ph' +
        'one,'
      '       a.ship_from_contact, null,'
      '       a.ship_from_residential,'
      '       null, null'
      '  FROM return_shipment a'
      '  WHERE a.id = :SOURCE_ID'
      '  and :SOURCE = '#39'RETURN_SHIPMENT_FROM'#39
      'UNION'
      'SELECT a.id, '#39'SHIP_TO'#39', null, '
      '       a.attn,'
      '       a.addr1, a.addr2, a.addr3,'
      '       a.city, a.state,'
      '       a.country,'
      
        '       to_char(substr(country_code.getcountrycode(upper(trim(a.c' +
        'ountry))), 1, 2)) country_code, '
      '       a.zip, a.phone_number,'
      '       a.prime_contact, null,'
      '       null,'
      '       null, null'
      '  FROM ship_to a'
      '  WHERE a.id = :SOURCE_ID'
      '  and :SOURCE = '#39'SHIP_TO'#39
      'UNION ALL'
      'SELECT a.id, '#39'REMIT_TO'#39', null, '
      '       a.attn,'
      '       a.addr1, a.addr2, a.addr3,'
      '       a.city, a.state,'
      '       a.country,'
      
        '       to_char(substr(country_code.getcountrycode(upper(trim(a.c' +
        'ountry))), 1, 2)) country_code, '
      '       a.zip, a.phone_number,'
      '       a.prime_contact, null,'
      '       null,'
      '       null, null'
      '  FROM remit_to a'
      '  WHERE a.id = :SOURCE_ID'
      '  and :SOURCE = '#39'REMIT_TO'#39
      'UNION ALL'
      'SELECT a.id, a.source, null, '
      '       a.company,'
      '       a.address1, a.address2, a.address3,'
      '       a.city, a.state,'
      '       a.country,'
      
        '       to_char(substr(country_code.getcountrycode(upper(trim(a.c' +
        'ountry))), 1, 2)) country_code, '
      '       a.zip, a.phone,'
      '       a.attn, null,'
      '       null,'
      '       null, null'
      '  FROM v_company_addresses a'
      '  WHERE a.source = :SOURCE'
      '  AND a.id = :SOURCE_ID')
    Left = 74
    Top = 10
    ParamData = <
      item
        Name = 'SOURCE'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'SOURCE_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object qryShipmentSOURCE_ID: TFMTBCDField
      FieldName = 'SOURCE_ID'
      Origin = 'IQ.V_PACKSLIPS.SOURCE_ID'
      Size = 38
    end
    object qryShipmentSOURCE: TStringField
      FieldName = 'SOURCE'
      Origin = 'IQ.V_PACKSLIPS.SOURCE'
    end
    object qryShipmentPACKSLIPNO: TStringField
      FieldName = 'PACKSLIPNO'
      Origin = 'IQ.V_PACKSLIPS.PACKSLIPNO'
      Size = 60
    end
    object qryShipmentSHIP_TO_ATTN: TStringField
      FieldName = 'SHIP_TO_ATTN'
      Origin = 'IQ.V_PACKSLIPS.SHIP_TO_ATTN'
      Size = 60
    end
    object qryShipmentSHIP_TO_ADDR1: TStringField
      FieldName = 'SHIP_TO_ADDR1'
      Origin = 'IQ.V_PACKSLIPS.SHIP_TO_ADDR1'
      Size = 60
    end
    object qryShipmentSHIP_TO_ADDR2: TStringField
      FieldName = 'SHIP_TO_ADDR2'
      Origin = 'IQ.V_PACKSLIPS.SHIP_TO_ADDR2'
      Size = 60
    end
    object qryShipmentSHIP_TO_ADDR3: TStringField
      FieldName = 'SHIP_TO_ADDR3'
      Origin = 'IQ.V_PACKSLIPS.SHIP_TO_ADDR3'
      Size = 60
    end
    object qryShipmentSHIP_TO_CITY: TStringField
      FieldName = 'SHIP_TO_CITY'
      Origin = 'IQ.V_PACKSLIPS.SHIP_TO_CITY'
      Size = 30
    end
    object qryShipmentSHIP_TO_STATE: TStringField
      FieldName = 'SHIP_TO_STATE'
      Origin = 'IQ.V_PACKSLIPS.SHIP_TO_STATE'
    end
    object qryShipmentSHIP_TO_COUNTRY: TStringField
      FieldName = 'SHIP_TO_COUNTRY'
      Origin = 'IQ.V_PACKSLIPS.SHIP_TO_COUNTRY'
      Size = 100
    end
    object qryShipmentSHIP_TO_COUNTRY_CODE: TStringField
      FieldName = 'SHIP_TO_COUNTRY_CODE'
      Origin = 'IQ.V_PACKSLIPS.SHIP_TO_COUNTRY_CODE'
      Size = 2
    end
    object qryShipmentSHIP_TO_ZIP: TStringField
      FieldName = 'SHIP_TO_ZIP'
      Origin = 'IQ.V_PACKSLIPS.SHIP_TO_ZIP'
    end
    object qryShipmentSHIP_TO_PHONE_NUMBER: TStringField
      FieldName = 'SHIP_TO_PHONE_NUMBER'
      Origin = 'IQ.V_PACKSLIPS.SHIP_TO_PHONE_NUMBER'
      Size = 25
    end
    object qryShipmentSHIP_TO_PRIME_CONTACT: TStringField
      FieldName = 'SHIP_TO_PRIME_CONTACT'
      Origin = 'IQ.V_PACKSLIPS.SHIP_TO_PRIME_CONTACT'
      Size = 61
    end
    object qryShipmentSHIP_RESIDENTIAL: TStringField
      FieldName = 'SHIP_RESIDENTIAL'
      Origin = 'IQ.V_PACKSLIPS.SHIP_RESIDENTIAL'
      Size = 1
    end
    object qryShipmentSHIP_TO_CONTACT_EMAIL: TStringField
      FieldName = 'SHIP_TO_CONTACT_EMAIL'
      Size = 250
    end
    object qryShipmentDIST_CENTER_ID: TFMTBCDField
      FieldName = 'DIST_CENTER_ID'
      Size = 38
    end
    object qryShipmentIGNORE_DIST_CENTER: TStringField
      FieldName = 'IGNORE_DIST_CENTER'
      Size = 1
    end
  end
  object srcShipments: TDataSource
    DataSet = qryShipment
    OnDataChange = SrcShipmentsDataChange
    Left = 136
    Top = 8
  end
  object qryAddressValidation: TFDQuery
    BeforeOpen = qryShipmentBeforeOpen
    BeforePost = qryAddressValidationBeforePost
    AfterPost = qryAddressValidationAfterPost
    OnNewRecord = qryAddressValidationNewRecord
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateObject = UpdateSQLAddressValidation
    SQL.Strings = (
      
        'select id, source, source_id, cleanse_hash, override_hash, valid' +
        'ated'
      '  FROM address_validation a'
      '  WHERE a.source_id = :SOURCE_ID'
      '  and a.source = :SOURCE'
      '')
    Left = 306
    Top = 306
    ParamData = <
      item
        Name = 'SOURCE_ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'SOURCE'
        DataType = ftString
        ParamType = ptInput
      end>
    object qryAddressValidationID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.ADDRESS_VALIDATION.ID'
      Size = 0
    end
    object qryAddressValidationSOURCE: TStringField
      FieldName = 'SOURCE'
      Origin = 'IQ.ADDRESS_VALIDATION.SOURCE'
      Size = 60
    end
    object qryAddressValidationSOURCE_ID: TBCDField
      FieldName = 'SOURCE_ID'
      Origin = 'IQ.ADDRESS_VALIDATION.SOURCE_ID'
      Size = 0
    end
    object qryAddressValidationCLEANSE_HASH: TStringField
      FieldName = 'CLEANSE_HASH'
      Origin = 'IQ.ADDRESS_VALIDATION.CLEANSE_HASH'
      Size = 60
    end
    object qryAddressValidationOVERRIDE_HASH: TStringField
      FieldName = 'OVERRIDE_HASH'
      Origin = 'IQ.ADDRESS_VALIDATION.OVERRIDE_HASH'
      Size = 60
    end
    object qryAddressValidationVALIDATED: TStringField
      FieldName = 'VALIDATED'
      Origin = 'IQ.ADDRESS_VALIDATION.VALIDATED'
      Size = 1
    end
  end
  object UpdateSQLAddressValidation: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into address_validation'
      
        '  (ID, SOURCE, SOURCE_ID, CLEANSE_HASH, OVERRIDE_HASH, VALIDATED' +
        ')'
      'values'
      
        '  (:ID, :SOURCE, :SOURCE_ID, :CLEANSE_HASH, :OVERRIDE_HASH, :VAL' +
        'IDATED)')
    ModifySQL.Strings = (
      'update address_validation'
      'set'
      '  ID = :ID,'
      '  SOURCE = :SOURCE,'
      '  SOURCE_ID = :SOURCE_ID,'
      '  CLEANSE_HASH = :CLEANSE_HASH,'
      '  OVERRIDE_HASH = :OVERRIDE_HASH,'
      '  VALIDATED = :VALIDATED'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from address_validation'
      'where'
      '  ID = :OLD_ID and'
      '  SOURCE = :OLD_SOURCE and'
      '  SOURCE_ID = :OLD_SOURCE_ID and'
      '  CLEANSE_HASH = :OLD_CLEANSE_HASH and'
      '  OVERRIDE_HASH = :OLD_OVERRIDE_HASH')
    Left = 344
    Top = 272
  end
  object srcAddressValidation: TDataSource
    DataSet = qryAddressValidation
    OnDataChange = SrcShipmentsDataChange
    Left = 328
    Top = 312
  end
  object procUpdateAddress: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    StoredProcName = 'IQMS.SHIPMAN.UPDATE_ADDRESS'
    Left = 392
    Top = 216
    ParamData = <
      item
        Position = 1
        Name = 'V_SOURCE'
        DataType = ftString
        FDDataType = dtAnsiString
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'V_SOURCE_ID'
        DataType = ftFMTBcd
        FDDataType = dtFmtBCD
        Precision = 38
        NumericScale = 38
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'V_CONTACT'
        DataType = ftString
        FDDataType = dtAnsiString
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'V_ATTN'
        DataType = ftString
        FDDataType = dtAnsiString
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'V_ADDR1'
        DataType = ftString
        FDDataType = dtAnsiString
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'V_ADDR2'
        DataType = ftString
        FDDataType = dtAnsiString
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'V_ADDR3'
        DataType = ftString
        FDDataType = dtAnsiString
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'V_CITY'
        DataType = ftString
        FDDataType = dtAnsiString
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'V_STATE'
        DataType = ftString
        FDDataType = dtAnsiString
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'V_ZIP'
        DataType = ftString
        FDDataType = dtAnsiString
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'V_COUNTRY_CODE'
        DataType = ftString
        FDDataType = dtAnsiString
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'V_PHONE'
        DataType = ftString
        FDDataType = dtAnsiString
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'V_EMAIL'
        DataType = ftString
        FDDataType = dtAnsiString
        ParamType = ptInput
      end>
  end
end
