inherited FrmQkShipTo: TFrmQkShipTo
  Left = 362
  Top = 181
  ClientHeight = 344
  Caption = 'Add Shipping Address'
  ExplicitWidth = 322
  ExplicitHeight = 383
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Top = 305
    ExplicitTop = 305
  end
  inherited PageControl1: TUniPageControl
    Height = 305
    ExplicitHeight = 305
    inherited TabSheet1: TUniTabSheet
      Caption = 'New Ship To'
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 298
      ExplicitHeight = 277
      object IQScrollBox1: TUniScrollBox
        Left = 0
        Top = 0
        Width = 298
        Height = 277
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        ScrollHeight = 274
        object PnlClient01: TUniPanel
          Tag = 1999
          Left = 0
          Top = 0
          Width = 296
          Height = 274
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = ''
          object Splitter1: TUniSplitter
            Left = 93
            Top = 0
            Width = 6
            Height = 274
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
            Height = 272
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object Label2: TUniLabel
              Left = 8
              Top = 12
              Width = 45
              Height = 13
              Hint = ''
              Caption = 'Company'
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
              Top = 204
              Width = 61
              Height = 13
              Hint = ''
              Caption = 'Telephone #'
              TabOrder = 8
            end
            object Label13: TUniLabel
              Left = 8
              Top = 252
              Width = 65
              Height = 13
              Hint = ''
              Caption = 'Prme Contact'
              TabOrder = 9
            end
            object Label9: TUniLabel
              Left = 10
              Top = 156
              Width = 57
              Height = 13
              Hint = ''
              Caption = 'Postal Code'
              TabOrder = 10
            end
            object Label11: TUniLabel
              Left = 10
              Top = 228
              Width = 47
              Height = 13
              Hint = ''
              Caption = 'Extension'
              TabOrder = 11
            end
          end
          object PnlClient02: TUniPanel
            Tag = 1999
            Left = 99
            Top = 1
            Width = 197
            Height = 272
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            object DBEdit2: TUniDBEdit
              Left = 1
              Top = 8
              Width = 184
              Height = 21
              Hint = ''
              DataField = 'ATTN'
              DataSource = DataSource1
              TabOrder = 0
            end
            object DBEdit3: TUniDBEdit
              Left = 1
              Top = 32
              Width = 184
              Height = 21
              Hint = ''
              DataField = 'ADDR1'
              DataSource = DataSource1
              TabOrder = 1
            end
            object DBEdit4: TUniDBEdit
              Left = 1
              Top = 56
              Width = 184
              Height = 21
              Hint = ''
              DataField = 'ADDR2'
              DataSource = DataSource1
              TabOrder = 2
            end
            object DBEdit5: TUniDBEdit
              Left = 1
              Top = 80
              Width = 184
              Height = 21
              Hint = ''
              DataField = 'ADDR3'
              DataSource = DataSource1
              TabOrder = 3
            end
            object DBEdit6: TUniDBEdit
              Left = 1
              Top = 104
              Width = 184
              Height = 21
              Hint = ''
              DataField = 'CITY'
              DataSource = DataSource1
              TabOrder = 4
            end
            object dbcState: TUniDBComboBox
              Left = 1
              Top = 128
              Width = 89
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
              TabOrder = 5
            end
            object DBEdit9: TUniDBEdit
              Left = 1
              Top = 152
              Width = 89
              Height = 21
              Hint = ''
              DataField = 'ZIP'
              DataSource = DataSource1
              TabOrder = 6
            end
            object DBEdit8: TUniDBEdit
              Left = 1
              Top = 176
              Width = 185
              Height = 21
              Hint = ''
              DataField = 'COUNTRY'
              DataSource = DataSource1
              TabOrder = 7
            end
            object DBEdit10: TUniDBEdit
              Left = 1
              Top = 200
              Width = 106
              Height = 21
              Hint = ''
              DataField = 'PHONE_NUMBER'
              DataSource = DataSource1
              TabOrder = 8
            end
            object DBEdit11: TUniDBEdit
              Left = 1
              Top = 224
              Width = 89
              Height = 21
              Hint = ''
              DataField = 'EXT'
              DataSource = DataSource1
              TabOrder = 9
            end
            object DBEdit13: TUniDBEdit
              Left = 1
              Top = 248
              Width = 185
              Height = 21
              Hint = ''
              DataField = 'PRIME_CONTACT'
              DataSource = DataSource1
              TabOrder = 10
            end
          end
        end
      end
    end
  end
  inherited Table1: TFDTable
    UpdateOptions.UpdateTableName = 'SHIP_TO'
    TableName = 'SHIP_TO'
    object Table1ID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object Table1ARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
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
      Size = 30
    end
    object Table1STATE: TStringField
      FieldName = 'STATE'
    end
    object Table1COUNTRY: TStringField
      FieldName = 'COUNTRY'
      Size = 30
    end
    object Table1ZIP: TStringField
      FieldName = 'ZIP'
      Size = 10
    end
    object Table1SHIP_TIME: TBCDField
      FieldName = 'SHIP_TIME'
      Size = 3
    end
    object Table1TAX_CODE_ID: TBCDField
      FieldName = 'TAX_CODE_ID'
      Size = 0
    end
    object Table1PHONE_NUMBER: TStringField
      FieldName = 'PHONE_NUMBER'
      Size = 25
    end
    object Table1EXT: TStringField
      FieldName = 'EXT'
      Size = 5
    end
    object Table1FAX: TStringField
      FieldName = 'FAX'
      Size = 25
    end
    object Table1PRIME_CONTACT: TStringField
      FieldName = 'PRIME_CONTACT'
      Size = 30
    end
    object Table1FREIGHT_ID: TBCDField
      FieldName = 'FREIGHT_ID'
      Size = 0
    end
    object Table1NOTES: TStringField
      FieldName = 'NOTES'
      Size = 2000
    end
  end
end
