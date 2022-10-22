inherited FrmEditBillto: TFrmEditBillto
  Left = 334
  Top = 163
  ClientHeight = 416
  ExplicitHeight = 455
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlFormCarrier: TUniPanel
    Height = 355
    ExplicitHeight = 355
    inherited PageControl1: TUniPageControl
      Height = 353
      ActivePage = TabGrid
      ExplicitHeight = 353
      inherited TabForm: TUniTabSheet
        ExplicitWidth = 376
        ExplicitHeight = 327
        inherited PnlFormView: TUniPanel
          Height = 325
          ExplicitHeight = 325
          inherited sbMain: TUniScrollBox
            Height = 323
            ExplicitHeight = 327
            ScrollHeight = 321
            inherited PnlClient01: TUniPanel
              Width = 370
              Height = 321
              ExplicitWidth = 370
              ExplicitHeight = 321
              inherited Splitter1: TUniSplitter
                Height = 319
                ExplicitHeight = 319
              end
              inherited PnlLeft01: TUniPanel
                Height = 319
                ExplicitHeight = 319
                object lblRemitTo: TUniLabel [9]
                  Left = 8
                  Top = 300
                  Width = 42
                  Height = 13
                  Hint = ''
                  Caption = 'Remit To'
                  TabOrder = 13
                end
              end
              inherited PnlClient02: TUniPanel
                Width = 269
                Height = 319
                ExplicitHeight = 321
                inherited dbeContact: TUniDBEdit
                  TabOrder = 3
                end
                inherited dbeCompany: TUniDBEdit
                  TabOrder = 4
                end
                inherited dbeAddress1: TUniDBEdit
                  TabOrder = 5
                end
                inherited dbeAddress2: TUniDBEdit
                  TabOrder = 6
                end
                inherited dbeAddress3: TUniDBEdit
                  TabOrder = 7
                end
                inherited dbeCity: TUniDBEdit
                  TabOrder = 11
                end
                inherited dbCountry: TUniDBComboBox
                  TabOrder = 12
                end
                object wwDBLookupCombo1: TUniDBLookupComboBox [8]
                  Left = 0
                  Top = 296
                  Width = 275
                  Height = 21
                  Hint = ''
                  ListFieldIndex = 0
                  DataField = 'COMPANY_ID'
                  DataSource = Src
                  TabOrder = 1
                  Color = clWindow
                end
                inherited dbeFax: TUniDBEdit
                  TabOrder = 2
                end
                inherited dbeState: TUniDBComboBox
                  TabOrder = 0
                end
              end
            end
          end
        end
      end
      inherited TabGrid: TUniTabSheet
        ExplicitHeight = 325
        inherited Grid: TUniDBGrid
          Height = 325
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
  inherited Panel2: TUniPanel
    Top = 382
    ExplicitTop = 382
  end
  inherited Table: TFDTable
    object TableCOMPANY_ID: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'COMPANY_ID'
      ProviderFlags = []
      Precision = 15
      Size = 0
    end
  end
  object TblComp: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'COMPANY'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'COMPANY'
    Left = 44
    Top = 9
  end
end
