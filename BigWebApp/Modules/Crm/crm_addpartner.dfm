inherited QuickAddPartner: TQuickAddPartner
  Left = 373
  Top = 153
  ClientHeight = 419
  ClientWidth = 444
  Caption = 'Quick Add'
  ActiveControl = edComp
  ExplicitWidth = 460
  ExplicitHeight = 458
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Tag = 1999
    Top = 380
    Width = 444
    ExplicitTop = 380
    ExplicitWidth = 444
    inherited Panel2: TUniPanel
      Left = 236
      Width = 208
      ExplicitLeft = 236
      ExplicitWidth = 208
      inherited btnCancel: TUniButton
        Left = 105
        ExplicitLeft = 105
      end
    end
  end
  inherited PageControl1: TUniPageControl
    Width = 444
    Height = 380
    ExplicitWidth = 444
    ExplicitHeight = 380
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 436
      ExplicitHeight = 352
      object Splitter1: TUniSplitter
        Left = 101
        Top = 0
        Width = 6
        Height = 352
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object PnlLeft01: TUniPanel
        Left = 0
        Top = 0
        Width = 101
        Height = 352
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object Label14: TUniLabel
          Left = 8
          Top = 11
          Width = 47
          Height = 13
          Hint = ''
          Caption = 'Partner #'
          TabOrder = 1
        end
        object Label2: TUniLabel
          Left = 8
          Top = 35
          Width = 45
          Height = 13
          Hint = ''
          Caption = 'Company'
          TabOrder = 2
        end
        object Label3: TUniLabel
          Left = 8
          Top = 59
          Width = 45
          Height = 13
          Hint = ''
          Caption = 'Address1'
          TabOrder = 3
        end
        object Label4: TUniLabel
          Left = 8
          Top = 83
          Width = 45
          Height = 13
          Hint = ''
          Caption = 'Address2'
          TabOrder = 4
        end
        object Label5: TUniLabel
          Left = 8
          Top = 107
          Width = 45
          Height = 13
          Hint = ''
          Caption = 'Address3'
          TabOrder = 5
        end
        object Label6: TUniLabel
          Left = 8
          Top = 131
          Width = 19
          Height = 13
          Hint = ''
          Caption = 'City'
          TabOrder = 6
        end
        object Label7: TUniLabel
          Left = 8
          Top = 179
          Width = 75
          Height = 13
          Hint = ''
          Caption = 'State or Region'
          TabOrder = 7
        end
        object Label8: TUniLabel
          Left = 8
          Top = 155
          Width = 39
          Height = 13
          Hint = ''
          Caption = 'Country'
          TabOrder = 8
        end
        object Label10: TUniLabel
          Left = 8
          Top = 251
          Width = 61
          Height = 13
          Hint = ''
          Caption = 'Telephone #'
          TabOrder = 9
        end
        object Label12: TUniLabel
          Left = 8
          Top = 275
          Width = 29
          Height = 13
          Hint = ''
          Caption = 'Fax #'
          TabOrder = 10
        end
        object Label13: TUniLabel
          Left = 8
          Top = 299
          Width = 77
          Height = 13
          Hint = ''
          Caption = 'Primary Contact'
          TabOrder = 11
        end
        object Label9: TUniLabel
          Left = 8
          Top = 203
          Width = 57
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          Caption = 'Postal Code'
          TabOrder = 12
        end
      end
      object PnlClient01: TUniPanel
        Left = 107
        Top = 0
        Width = 329
        Height = 352
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        DesignSize = (
          329
          352)
        object sbtnLookupZipCode: TUniSpeedButton
          Left = 165
          Top = 201
          Width = 22
          Height = 22
          Hint = 'Lookup Postal Code'
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
        object edtPartnerNo: TUniDBEdit
          Left = 1
          Top = 8
          Width = 137
          Height = 21
          Hint = ''
          DataField = 'PARTNERNO'
          DataSource = DataSource1
          CharCase = ecUpperCase
          TabOrder = 0
        end
        object edComp: TUniDBEdit
          Left = 1
          Top = 32
          Width = 325
          Height = 21
          Hint = ''
          DataField = 'COMPANY'
          DataSource = DataSource1
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
        object edAddr1: TUniDBEdit
          Left = 1
          Top = 56
          Width = 325
          Height = 21
          Hint = ''
          DataField = 'ADDR1'
          DataSource = DataSource1
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
        end
        object edAddr2: TUniDBEdit
          Left = 1
          Top = 80
          Width = 325
          Height = 21
          Hint = ''
          DataField = 'ADDR2'
          DataSource = DataSource1
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
        end
        object edAddr3: TUniDBEdit
          Left = 1
          Top = 104
          Width = 325
          Height = 21
          Hint = ''
          DataField = 'ADDR3'
          DataSource = DataSource1
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
        end
        object edCity: TUniDBEdit
          Left = 1
          Top = 128
          Width = 325
          Height = 21
          Hint = ''
          DataField = 'CITY'
          DataSource = DataSource1
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 5
        end
        object cmbState: TUniDBComboBox
          Left = 1
          Top = 176
          Width = 159
          Height = 21
          Hint = ''
          DataField = 'STATE'
          DataSource = DataSource1
          TabOrder = 7
          OnDropDown = cmbStateDropDown
        end
        object edZip: TUniDBEdit
          Left = 1
          Top = 200
          Width = 159
          Height = 21
          Hint = ''
          DataField = 'ZIP'
          DataSource = DataSource1
          TabOrder = 8
        end
        object edPhone: TUniDBEdit
          Left = 1
          Top = 248
          Width = 180
          Height = 21
          Hint = ''
          DataField = 'PHONE_NUMBER'
          DataSource = DataSource1
          TabOrder = 10
        end
        object edFax: TUniDBEdit
          Left = 1
          Top = 272
          Width = 180
          Height = 21
          Hint = ''
          DataField = 'FAX_NUMBER'
          DataSource = DataSource1
          TabOrder = 11
        end
        object edContact: TUniDBEdit
          Left = 1
          Top = 296
          Width = 180
          Height = 21
          Hint = ''
          DataField = 'PRIME_CONTACT'
          DataSource = DataSource1
          TabOrder = 12
        end
        object cmbCountry: TUniDBComboBox
          Left = 1
          Top = 152
          Width = 328
          Height = 21
          Hint = ''
          Anchors = [akLeft, akTop, akRight]
          DataField = 'COUNTRY'
          DataSource = DataSource1
          TabOrder = 6
        end
        object chkUseUSAMask: TUniDBCheckBox
          Left = 1
          Top = 224
          Width = 97
          Height = 17
          Hint = ''
          DataField = 'USE_USA_MASK'
          DataSource = DataSource1
          ValueChecked = 'Y'
          ValueUnchecked = 'N'
          Caption = 'Use USA Mask'
          TabOrder = 9
        end
      end
    end
  end
  inherited Table1: TFDTable
    UpdateOptions.UpdateTableName = 'PARTNER'
    TableName = 'PARTNER'
    object Table1ID: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object Table1PARTNERNO: TStringField
      FieldName = 'PARTNERNO'
      FixedChar = True
      Size = 10
    end
    object Table1PARTNER_GROUP: TStringField
      FieldName = 'PARTNER_GROUP'
      FixedChar = True
      Size = 10
    end
    object Table1COMPANY: TStringField
      FieldName = 'COMPANY'
      FixedChar = True
      Size = 60
    end
    object Table1PRIME_CONTACT: TStringField
      FieldName = 'PRIME_CONTACT'
      FixedChar = True
      Size = 30
    end
    object Table1ADDR1: TStringField
      FieldName = 'ADDR1'
      FixedChar = True
      Size = 60
    end
    object Table1ADDR2: TStringField
      FieldName = 'ADDR2'
      FixedChar = True
      Size = 60
    end
    object Table1ADDR3: TStringField
      FieldName = 'ADDR3'
      FixedChar = True
      Size = 60
    end
    object Table1CITY: TStringField
      FieldName = 'CITY'
      FixedChar = True
      Size = 30
    end
    object Table1STATE: TStringField
      FieldName = 'STATE'
      FixedChar = True
    end
    object Table1ZIP: TStringField
      FieldName = 'ZIP'
      FixedChar = True
      Size = 10
    end
    object Table1COUNTRY: TStringField
      FieldName = 'COUNTRY'
      FixedChar = True
      Size = 100
    end
    object Table1PHONE_NUMBER: TStringField
      FieldName = 'PHONE_NUMBER'
      OnGetText = DoGetTelephoneText
      Size = 25
    end
    object Table1EXT: TStringField
      FieldName = 'EXT'
      FixedChar = True
      Size = 5
    end
    object Table1FAX_NUMBER: TStringField
      FieldName = 'FAX_NUMBER'
      OnGetText = DoGetTelephoneText
      Size = 25
    end
    object Table1WEB_SITE_URL: TStringField
      FieldName = 'WEB_SITE_URL'
      Size = 255
    end
    object Table1INDUSTRY: TStringField
      FieldName = 'INDUSTRY'
      FixedChar = True
      Size = 5
    end
    object Table1CREATED: TDateTimeField
      FieldName = 'CREATED'
    end
    object Table1USE_USA_MASK: TStringField
      FieldName = 'USE_USA_MASK'
      FixedChar = True
      Size = 1
    end
  end
  inherited DataSource1: TDataSource
    OnDataChange = DataSource1DataChange
  end
  object PZipCode: TUniPopupMenu
    Left = 204
    Top = 44
    object SelectZipCode1: TUniMenuItem
      Caption = 'Select Postal Code'
      OnClick = SelectZipCode1Click
    end
  end
end
