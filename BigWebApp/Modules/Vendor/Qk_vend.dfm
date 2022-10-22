inherited QuickAddVendor: TQuickAddVendor
  Left = 295
  Top = 194
  ClientHeight = 441
  ClientWidth = 385
  Caption = 'Quick Add'
  ExplicitWidth = 401
  ExplicitHeight = 480
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel [0]
    Left = 0
    Top = 0
    Width = 385
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
  end
  inherited Panel1: TUniPanel
    Top = 403
    Width = 385
    Height = 38
    ExplicitTop = 403
    ExplicitWidth = 385
    ExplicitHeight = 38
    inherited Panel2: TUniPanel
      Left = 178
      Width = 207
      Height = 36
      ExplicitLeft = 178
      ExplicitWidth = 207
      ExplicitHeight = 36
      inherited btnOK: TUniButton
        Top = 7
        ExplicitTop = 7
      end
      inherited btnCancel: TUniButton
        Left = 103
        Top = 7
        ExplicitLeft = 103
        ExplicitTop = 7
      end
    end
  end
  inherited PageControl1: TUniPageControl
    Top = 3
    Width = 385
    Height = 400
    ExplicitTop = 5
    ExplicitWidth = 385
    ExplicitHeight = 400
    inherited TabSheet1: TUniTabSheet
      Caption = 'New Vendor'
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 377
      ExplicitHeight = 372
      object ScrollBox1: TUniScrollBox
        Left = 0
        Top = 0
        Width = 377
        Height = 372
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        ScrollHeight = 353
        object PnlClient01: TUniPanel
          Left = 0
          Top = 0
          Width = 375
          Height = 353
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = ''
          object Splitter1: TUniSplitter
            Left = 107
            Top = 0
            Width = 6
            Height = 353
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object PnlLeft01: TUniPanel
            Left = 1
            Top = 1
            Width = 107
            Height = 351
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object Label14: TUniLabel
              Left = 8
              Top = 8
              Width = 45
              Height = 13
              Hint = ''
              Caption = 'Vendor #'
              TabOrder = 1
            end
            object Label2: TUniLabel
              Left = 8
              Top = 32
              Width = 45
              Height = 13
              Hint = ''
              Caption = 'Company'
              TabOrder = 2
            end
            object Label3: TUniLabel
              Left = 8
              Top = 56
              Width = 45
              Height = 13
              Hint = ''
              Caption = 'Address1'
              TabOrder = 3
            end
            object Label4: TUniLabel
              Left = 8
              Top = 80
              Width = 45
              Height = 13
              Hint = ''
              Caption = 'Address2'
              TabOrder = 4
            end
            object Label5: TUniLabel
              Left = 8
              Top = 104
              Width = 45
              Height = 13
              Hint = ''
              Caption = 'Address3'
              TabOrder = 5
            end
            object Label6: TUniLabel
              Left = 8
              Top = 128
              Width = 19
              Height = 13
              Hint = ''
              Caption = 'City'
              TabOrder = 6
            end
            object Label7: TUniLabel
              Left = 8
              Top = 203
              Width = 75
              Height = 13
              Hint = ''
              Caption = 'State or Region'
              TabOrder = 7
            end
            object Label8: TUniLabel
              Left = 8
              Top = 152
              Width = 39
              Height = 13
              Hint = ''
              Caption = 'Country'
              TabOrder = 8
            end
            object Label10: TUniLabel
              Left = 8
              Top = 251
              Width = 41
              Height = 13
              Hint = ''
              Caption = 'Phone #'
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
              Width = 67
              Height = 13
              Hint = ''
              Caption = 'Prime Contact'
              TabOrder = 11
            end
            object Label1: TUniLabel
              Left = 8
              Top = 324
              Width = 31
              Height = 13
              Hint = ''
              Caption = 'Status'
              TabOrder = 12
            end
            object Label91: TUniLabel
              Left = 8
              Top = 227
              Width = 57
              Height = 13
              Hint = ''
              Caption = 'Postal Code'
              TabOrder = 13
            end
          end
          object PnlClient02: TUniPanel
            Left = 113
            Top = 1
            Width = 262
            Height = 351
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            object PnlRightButtons: TUniPanel
              Left = 231
              Top = 1
              Width = 31
              Height = 349
              Hint = ''
              Align = alRight
              Anchors = [akTop, akRight, akBottom]
              TabOrder = 0
              Caption = ''
              object sbtnSelectZipCode: TUniSpeedButton
                Left = 4
                Top = 223
                Width = 22
                Height = 22
                Hint = 'Select Postal Code'
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
                OnClick = sbtnSelectZipCodeClick
              end
            end
            object PnlEditCtrls: TUniPanel
              Left = 1
              Top = 1
              Width = 231
              Height = 349
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              OnResize = PnlEditCtrlsResize
              DesignSize = (
                231
                349)
              object edVendNo: TUniDBEdit
                Left = 1
                Top = 4
                Width = 144
                Height = 21
                Hint = ''
                DataField = 'VENDORNO'
                DataSource = DataSource1
                CharCase = ecUpperCase
                TabOrder = 0
              end
              object edComp: TUniDBEdit
                Left = 1
                Top = 28
                Width = 234
                Height = 21
                Hint = ''
                DataField = 'COMPANY'
                DataSource = DataSource1
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
              end
              object edAddr1: TUniDBEdit
                Left = 1
                Top = 52
                Width = 234
                Height = 21
                Hint = ''
                DataField = 'ADDR1'
                DataSource = DataSource1
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
              end
              object edAddr2: TUniDBEdit
                Left = 1
                Top = 76
                Width = 234
                Height = 21
                Hint = ''
                DataField = 'ADDR2'
                DataSource = DataSource1
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 3
              end
              object edAddr3: TUniDBEdit
                Left = 1
                Top = 100
                Width = 234
                Height = 21
                Hint = ''
                DataField = 'ADDR3'
                DataSource = DataSource1
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 4
              end
              object edCity: TUniDBEdit
                Left = 1
                Top = 124
                Width = 234
                Height = 21
                Hint = ''
                DataField = 'CITY'
                DataSource = DataSource1
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 5
              end
              object edZip: TUniDBEdit
                Left = 1
                Top = 224
                Width = 234
                Height = 21
                Hint = ''
                DataField = 'ZIP'
                DataSource = DataSource1
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 9
              end
              object edCountry: TUniDBComboBox
                Left = 1
                Top = 148
                Width = 234
                Height = 21
                Hint = ''
                Anchors = [akLeft, akTop, akRight]
                DataField = 'COUNTRY'
                DataSource = DataSource1
                TabOrder = 6
              end
              object edPhone: TUniDBEdit
                Left = 1
                Top = 248
                Width = 234
                Height = 21
                Hint = ''
                DataField = 'PHONE_NUMBER'
                DataSource = DataSource1
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 10
              end
              object edFax: TUniDBEdit
                Left = 1
                Top = 272
                Width = 234
                Height = 21
                Hint = ''
                DataField = 'FAX_NUMBER'
                DataSource = DataSource1
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 11
              end
              object edContact: TUniDBEdit
                Left = 1
                Top = 296
                Width = 234
                Height = 21
                Hint = ''
                DataField = 'PRIME_CONTACT'
                DataSource = DataSource1
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 12
              end
              object dbcStatus: TUniDBComboBox
                Left = 1
                Top = 320
                Width = 144
                Height = 21
                Hint = ''
                DataField = 'STATUS_ID'
                DataSource = DataSource1
                Items.Strings = (
                  'Approved'
                  'Not Approved'
                  'Payment Hold'
                  'Receive Hold'
                  'Not Active')
                TabOrder = 13
              end
              object edState: TUniDBComboBox
                Left = 1
                Top = 200
                Width = 145
                Height = 21
                Hint = ''
                DataField = 'STATE'
                DataSource = DataSource1
                TabOrder = 8
              end
              object chkUseUSAMask: TUniDBCheckBox
                Left = 1
                Top = 176
                Width = 97
                Height = 17
                Hint = ''
                DataField = 'USE_USA_MASK'
                DataSource = DataSource1
                ValueChecked = 'Y'
                ValueUnchecked = 'N'
                Caption = 'Use USA Mask'
                TabOrder = 7
              end
            end
          end
        end
      end
    end
  end
  inherited Table1: TFDTable
    AfterPost = Table1AfterPost
    IndexFieldNames = 'ID'
    UpdateOptions.UpdateTableName = 'VENDOR'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'VENDOR'
    object Table1ID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object Table1VENDORNO: TStringField
      FieldName = 'VENDORNO'
      Required = True
      Size = 10
    end
    object Table1COMPANY: TStringField
      FieldName = 'COMPANY'
      Size = 60
    end
    object Table1ATTN: TStringField
      FieldName = 'ATTN'
      Size = 30
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
      Size = 30
    end
    object Table1STATE: TStringField
      FieldName = 'STATE'
    end
    object Table1COUNTRY: TStringField
      FieldName = 'COUNTRY'
      Size = 100
    end
    object Table1ZIP: TStringField
      FieldName = 'ZIP'
      Size = 10
    end
    object Table1PHONE_NUMBER: TStringField
      FieldName = 'PHONE_NUMBER'
      OnGetText = DoGetTelephoneText
      Size = 25
    end
    object Table1FAX_NUMBER: TStringField
      FieldName = 'FAX_NUMBER'
      OnGetText = DoGetTelephoneText
      Size = 25
    end
    object Table1CREDIT_LIMIT: TBCDField
      FieldName = 'CREDIT_LIMIT'
      Size = 2
    end
    object Table1TERMS_ID: TBCDField
      FieldName = 'TERMS_ID'
      Size = 0
    end
    object Table1YTD_PURCHASES: TBCDField
      FieldName = 'YTD_PURCHASES'
      Size = 2
    end
    object Table1FED_TAX_ID: TStringField
      FieldName = 'FED_TAX_ID'
      Size = 30
    end
    object Table1CUSER1: TStringField
      FieldName = 'CUSER1'
      Size = 60
    end
    object Table1CUSER2: TStringField
      FieldName = 'CUSER2'
      Size = 60
    end
    object Table1CUSER3: TStringField
      FieldName = 'CUSER3'
      Size = 60
    end
    object Table1NUSER1: TFMTBCDField
      FieldName = 'NUSER1'
      Size = 6
    end
    object Table1NUSER2: TFMTBCDField
      FieldName = 'NUSER2'
      Size = 6
    end
    object Table1GL_ACCT: TStringField
      FieldName = 'GL_ACCT'
      Size = 25
    end
    object Table1TAXRATE: TFMTBCDField
      FieldName = 'TAXRATE'
      Size = 6
    end
    object Table1QA_RATING: TStringField
      FieldName = 'QA_RATING'
      Size = 10
    end
    object Table1VEN_RATING: TStringField
      FieldName = 'VEN_RATING'
      Size = 10
    end
    object Table1GLACCT_ID_EXP: TBCDField
      FieldName = 'GLACCT_ID_EXP'
      Size = 0
    end
    object Table1PRIME_CONTACT: TStringField
      FieldName = 'PRIME_CONTACT'
      Size = 30
    end
    object Table1STATUS_ID: TStringField
      FieldName = 'STATUS_ID'
    end
    object Table1E_MAIL_ADDR: TStringField
      FieldName = 'E_MAIL_ADDR'
      Size = 250
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
    Left = 243
    Top = 48
    object SelectZipCode1: TUniMenuItem
      Caption = 'Select Zip Code'
      OnClick = SelectZipCode1Click
    end
  end
end
