inherited FrmEditRemitTo: TFrmEditRemitTo
  Left = 413
  Top = 192
  ClientHeight = 389
  ClientWidth = 385
  Caption = 'Edit Remittance Address'
  ExplicitWidth = 401
  ExplicitHeight = 428
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlFormCarrier: TUniPanel
    Width = 385
    Height = 328
    ExplicitWidth = 385
    ExplicitHeight = 328
    inherited PageControl1: TUniPageControl
      Width = 383
      Height = 326
      ExplicitWidth = 383
      ExplicitHeight = 326
      inherited TabForm: TUniTabSheet
        ExplicitWidth = 375
        ExplicitHeight = 298
        inherited PnlFormView: TUniPanel
          Width = 375
          Height = 298
          ExplicitWidth = 375
          ExplicitHeight = 298
          inherited sbMain: TUniScrollBox
            Width = 375
            Height = 298
            ExplicitWidth = 375
            ExplicitHeight = 298
            ScrollHeight = 277
            inherited PnlClient01: TUniPanel
              Width = 373
              Height = 277
              ExplicitWidth = 373
              ExplicitHeight = 277
              inherited Splitter1: TUniSplitter
                Height = 277
                ExplicitHeight = 277
              end
              inherited PnlLeft01: TUniPanel
                Height = 275
                ExplicitHeight = 275
                inherited Label10: TUniLabel
                  Top = 300
                  Visible = False
                  ExplicitTop = 300
                end
                inherited Label11: TUniLabel
                  Top = 252
                  ExplicitTop = 252
                end
              end
              inherited PnlClient02: TUniPanel
                Width = 274
                Height = 275
                ExplicitWidth = 274
                ExplicitHeight = 275
                inherited dbeContact: TUniDBEdit
                  Width = 272
                  ExplicitWidth = 272
                end
                inherited dbeCompany: TUniDBEdit
                  Width = 272
                  ExplicitWidth = 272
                end
                inherited dbeAddress1: TUniDBEdit
                  Width = 272
                  ExplicitWidth = 272
                end
                inherited dbeAddress2: TUniDBEdit
                  Width = 272
                  ExplicitWidth = 272
                end
                inherited dbeAddress3: TUniDBEdit
                  Width = 272
                  ExplicitWidth = 272
                end
                inherited dbeCity: TUniDBEdit
                  Width = 272
                  ExplicitWidth = 272
                end
                inherited dbCountry: TUniDBComboBox
                  Width = 272
                  ExplicitWidth = 272
                end
                inherited dbeExt: TUniDBEdit
                  Top = 296
                  Visible = False
                  DataSource = nil
                  ExplicitTop = 296
                end
                inherited dbeFax: TUniDBEdit
                  Top = 248
                  DataField = 'FAX_NUMBER'
                  ExplicitTop = 248
                end
              end
            end
          end
        end
      end
      inherited TabGrid: TUniTabSheet
        ExplicitWidth = 375
        ExplicitHeight = 298
        inherited Grid: TUniDBGrid
          Width = 375
          Height = 298
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
              FieldName = 'PHONE_NUMBER'
              Title.Caption = 'Phone#'
              Width = 124
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'FAX'
              Title.Caption = 'Fax#'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'EXT'
              Title.Caption = 'Ext.'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'FAX'
              Title.Caption = 'Fax#'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
      end
    end
  end
  inherited Panel1: TUniPanel
    Width = 385
    ExplicitWidth = 385
    inherited DBNavigator1: TUniDBNavigator
      Left = 160
    end
  end
  inherited Panel2: TUniPanel
    Top = 355
    Width = 385
    ExplicitTop = 355
    ExplicitWidth = 385
    inherited Panel3: TUniPanel
      Left = 175
      ExplicitLeft = 175
    end
  end
  inherited Src: TDataSource
    DataSet = TblRemitTo
  end
  inherited Table: TFDTable
    Left = 312
    Top = 240
  end
  object TblRemitTo: TFDTable [5]
    Active = True
    BeforePost = TblRemitToBeforePost
    IndexFieldNames = 'VENDOR_ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'REMIT_TO'
    TableName = 'REMIT_TO'
    Left = 84
    Top = 17
    object TblRemitToID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object TblRemitToVENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Visible = False
      Size = 0
    end
    object TblRemitToPRIME_CONTACT: TStringField
      DisplayLabel = 'Contact'
      DisplayWidth = 20
      FieldName = 'PRIME_CONTACT'
      Size = 30
    end
    object TblRemitToATTN: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 20
      FieldName = 'ATTN'
      Size = 60
    end
    object TblRemitToADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 20
      FieldName = 'ADDR1'
      Size = 60
    end
    object TblRemitToADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 20
      FieldName = 'ADDR2'
      Size = 60
    end
    object TblRemitToADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 20
      FieldName = 'ADDR3'
      Size = 60
    end
    object TblRemitToCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 15
      FieldName = 'CITY'
      Size = 30
    end
    object TblRemitToSTATE: TStringField
      DisplayLabel = 'State or Region'
      FieldName = 'STATE'
    end
    object TblRemitToZIP: TStringField
      DisplayLabel = 'Postal Code'
      FieldName = 'ZIP'
      Size = 10
    end
    object TblRemitToCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 10
      FieldName = 'COUNTRY'
      Size = 100
    end
    object TblRemitToCURRENCY_ID: TStringField
      FieldName = 'CURRENCY_ID'
      Visible = False
      Size = 3
    end
    object TblRemitToPHONE_NUMBER: TStringField
      DisplayLabel = 'Telephone #'
      DisplayWidth = 20
      FieldName = 'PHONE_NUMBER'
      Size = 25
    end
    object TblRemitToFAX_NUMBER: TStringField
      DisplayLabel = 'Fax #'
      DisplayWidth = 20
      FieldName = 'FAX_NUMBER'
      Size = 25
    end
  end
end
