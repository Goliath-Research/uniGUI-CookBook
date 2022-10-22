object CountryListDataModule: TCountryListDataModule
  OldCreateOrder = False
  Height = 383
  Width = 356
  object SrcLocaleCountry: TDataSource
    DataSet = QryLocaleCountry
    Left = 64
    Top = 40
  end
  object QryLocaleCountry: TFDQuery
    BeforePost = QryLocaleCountryBeforePost
    OnNewRecord = QryLocaleCountryNewRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'LOCALE_COUNTRY'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = FDUpdateSQL_LocaleCountry
    SQL.Strings = (
      'SELECT a.id as id,'
      '       a.seq as seq,'
      '       a.name as name,'
      '       a.chr2 as chr2,'
      '       a.chr3 as chr3,'
      '       a.digit3 as digit3,'
      '       a.default_spelling as default_spelling,'
      '       a.address_format as address_format,'
      '       a.currency_id as currency_id,'
      '       b.curr_code as curr_code,'
      '       a.pk_hide as pk_hide'
      '  FROM locale_country a, currency b'
      ' WHERE b.id(+) = a.currency_id')
    Left = 80
    Top = 56
    object QryLocaleCountryNAME: TWideStringField
      DisplayLabel = 'Country Name'
      DisplayWidth = 25
      FieldName = 'NAME'
      Origin = 'a.name'
      Size = 250
    end
    object QryLocaleCountrySEQ: TBCDField
      DisplayLabel = '#'
      FieldName = 'SEQ'
      Origin = 'a.seq'
      Precision = 15
      Size = 0
    end
    object QryLocaleCountryCHR2: TWideStringField
      DisplayLabel = 'ISO 2 Char'
      DisplayWidth = 2
      FieldName = 'CHR2'
      Origin = 'a.chr2'
      Size = 2
    end
    object QryLocaleCountryCHR3: TWideStringField
      DisplayLabel = 'ISO 3 Char'
      DisplayWidth = 3
      FieldName = 'CHR3'
      Origin = 'a.chr3'
      Size = 3
    end
    object QryLocaleCountryDIGIT3: TBCDField
      Tag = 1
      DisplayLabel = 'ISO 3 Digit'
      DisplayWidth = 4
      FieldName = 'DIGIT3'
      Origin = 'a.digit3'
      MaxValue = 999.000000000000000000
      Precision = 3
      Size = 0
    end
    object QryLocaleCountryDEFAULT_SPELLING: TStringField
      DisplayLabel = 'Default Spelling?'
      DisplayWidth = 1
      FieldName = 'DEFAULT_SPELLING'
      Origin = 'a.default_spelling'
      Size = 1
    end
    object QryLocaleCountryCURR_CODE: TStringField
      DisplayLabel = 'Currency'
      DisplayWidth = 10
      FieldName = 'CURR_CODE'
      Origin = 'b.curr_code'
      Size = 10
    end
    object QryLocaleCountryID: TBCDField
      Tag = 1
      FieldName = 'ID'
      Origin = 'a.id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryLocaleCountryCURRENCY_ID: TBCDField
      Tag = 1
      FieldName = 'CURRENCY_ID'
      Origin = 'a.currency_id'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryLocaleCountryPK_HIDE: TStringField
      DisplayLabel = 'Hide From Pick Lists'
      FieldName = 'PK_HIDE'
      Origin = 'a.pk_hide'
      Size = 1
    end
  end
  object SrcLocaleSubdivision: TDataSource
    DataSet = QryLocaleSubdivision
    Left = 64
    Top = 120
  end
  object QryLocaleSubdivision: TFDQuery
    BeforeInsert = QryLocaleSubdivisionBeforeInsert
    BeforePost = QryLocaleSubdivisionBeforePost
    OnNewRecord = QryLocaleSubdivisionNewRecord
    MasterSource = SrcLocaleCountry
    MasterFields = 'ID'
    DetailFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.UpdateTableName = 'LOCALE_SUBDIVISION'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = FDUpdateSQL_LocaleSubdivision
    SQL.Strings = (
      '  SELECT id, '
      '         locale_country_id, '
      '         name'
      '    FROM locale_subdivision'
      '   WHERE locale_country_id = :ID'
      'ORDER BY name')
    Left = 80
    Top = 136
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryLocaleSubdivisionNAME: TWideStringField
      DisplayLabel = 'Subdivision Name'
      DisplayWidth = 100
      FieldName = 'NAME'
      Origin = 'NAME'
      Size = 100
    end
    object QryLocaleSubdivisionID: TBCDField
      Tag = 1
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryLocaleSubdivisionLOCALE_COUNTRY_ID: TBCDField
      Tag = 1
      FieldName = 'LOCALE_COUNTRY_ID'
      Origin = 'LOCALE_COUNTRY_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object FDUpdateSQL_LocaleCountry: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'INSERT INTO IQMS.LOCALE_COUNTRY'
      '(ID, SEQ, NAME, CHR2, CHR3, DIGIT3, '
      '  DEFAULT_SPELLING, ADDRESS_FORMAT, CURRENCY_ID, '
      '  PK_HIDE)'
      
        'VALUES (:NEW_ID, :NEW_SEQ, :NEW_NAME, :NEW_CHR2, :NEW_CHR3, :NEW' +
        '_DIGIT3, '
      '  :NEW_DEFAULT_SPELLING, :NEW_ADDRESS_FORMAT, :NEW_CURRENCY_ID, '
      '  :NEW_PK_HIDE)')
    ModifySQL.Strings = (
      'UPDATE IQMS.LOCALE_COUNTRY'
      
        'SET ID = :NEW_ID, SEQ = :NEW_SEQ, NAME = :NEW_NAME, CHR2 = :NEW_' +
        'CHR2, '
      
        '  CHR3 = :NEW_CHR3, DIGIT3 = :NEW_DIGIT3, DEFAULT_SPELLING = :NE' +
        'W_DEFAULT_SPELLING, '
      
        '  ADDRESS_FORMAT = :NEW_ADDRESS_FORMAT, CURRENCY_ID = :NEW_CURRE' +
        'NCY_ID, '
      '  PK_HIDE = :NEW_PK_HIDE'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM IQMS.LOCALE_COUNTRY'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, SEQ, NAME, CHR2, CHR3, DIGIT3, DEFAULT_SPELLING, ADDR' +
        'ESS_FORMAT, '
      '  CURRENCY_ID, PK_HIDE'
      'FROM IQMS.LOCALE_COUNTRY'
      'WHERE ID = :ID')
    Left = 96
    Top = 64
  end
  object FDUpdateSQL_LocaleSubdivision: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'INSERT INTO IQMS.LOCALE_SUBDIVISION'
      '(ID, LOCALE_COUNTRY_ID, NAME)'
      'VALUES (:NEW_ID, :NEW_LOCALE_COUNTRY_ID, :NEW_NAME)')
    ModifySQL.Strings = (
      'UPDATE IQMS.LOCALE_SUBDIVISION'
      
        'SET ID = :NEW_ID, LOCALE_COUNTRY_ID = :NEW_LOCALE_COUNTRY_ID, NA' +
        'ME = :NEW_NAME'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM IQMS.LOCALE_SUBDIVISION'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT ID, LOCALE_COUNTRY_ID, NAME'
      'FROM IQMS.LOCALE_SUBDIVISION'
      'WHERE ID = :ID')
    Left = 96
    Top = 152
  end
  object PkLocaleCountry: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT a.id,'
      '       a.name,'
      '       a.chr2,'
      '       a.chr3,'
      '       a.digit3,'
      '       a.default_spelling,'
      '       a.address_format,'
      '       a.currency_id,'
      '       b.curr_code'
      '  FROM locale_country a, currency b'
      ' WHERE b.id(+) = a.currency_id')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 240
    Top = 48
    object PkLocaleCountryID: TBCDField
      Tag = 1
      FieldName = 'ID'
      Origin = 'a.id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object PkLocaleCountryNAME: TWideStringField
      DisplayLabel = 'Country Name'
      DisplayWidth = 25
      FieldName = 'NAME'
      Origin = 'a.name'
      Size = 250
    end
    object PkLocaleCountryCHR2: TWideStringField
      DisplayLabel = 'ISO 2 Char'
      FieldName = 'CHR2'
      Origin = 'a.chr2'
      Size = 2
    end
    object PkLocaleCountryCHR3: TWideStringField
      DisplayLabel = 'ISO 3 Char'
      FieldName = 'CHR3'
      Origin = 'a.chr3'
      Size = 3
    end
    object PkLocaleCountryDIGIT3: TBCDField
      DisplayLabel = 'ISO 3 Digit'
      FieldName = 'DIGIT3'
      Origin = 'a.digit3'
      Precision = 3
      Size = 0
    end
    object PkLocaleCountryDEFAULT_SPELLING: TStringField
      DisplayLabel = 'Default Spelling?'
      FieldName = 'DEFAULT_SPELLING'
      Origin = 'a.default_spelling'
      Size = 1
    end
    object PkLocaleCountryADDRESS_FORMAT: TBCDField
      DisplayLabel = 'Address Format'
      FieldName = 'ADDRESS_FORMAT'
      Origin = 'a.address_format'
      Visible = False
      Precision = 3
      Size = 0
    end
    object PkLocaleCountryCURRENCY_ID: TBCDField
      Tag = 1
      FieldName = 'CURRENCY_ID'
      Origin = 'a.currency_id'
      Visible = False
      Precision = 15
      Size = 0
    end
    object PkLocaleCountryCURR_CODE: TStringField
      DisplayLabel = 'Currency'
      FieldName = 'CURR_CODE'
      Origin = 'a.curr_code'
      Size = 10
    end
  end
  object PkLocaleSubdivision: TIQWebHpick
    BeforeOpen = PkLocaleSubdivisionBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT id, '
      '       locale_country_id, '
      '       name'
      '  FROM locale_subdivision'
      ' WHERE locale_country_id = :ID')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 240
    Top = 104
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkLocaleSubdivisionID: TBCDField
      Tag = 1
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object PkLocaleSubdivisionLOCALE_COUNTRY_ID: TBCDField
      Tag = 1
      FieldName = 'LOCALE_COUNTRY_ID'
      Origin = 'LOCALE_COUNTRY_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object PkLocaleSubdivisionNAME: TWideStringField
      DisplayLabel = 'Name'
      FieldName = 'NAME'
      Origin = 'NAME'
      Size = 100
    end
  end
  object PkCurrencyCode: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT id,'
      '       descrip,'
      '       native_curr,'
      '       curr_code,'
      '       digit3'
      '  FROM v_currency')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 240
    Top = 168
    object PkCurrencyCodeDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 50
    end
    object PkCurrencyCodeCURR_CODE: TStringField
      DisplayLabel = 'Currency Code'
      FieldName = 'CURR_CODE'
      Origin = 'CURR_CODE'
      Size = 10
    end
    object PkCurrencyCodeDIGIT3: TStringField
      DisplayLabel = 'Numeric Code'
      DisplayWidth = 18
      FieldName = 'DIGIT3'
      Origin = 'DIGIT3'
      Size = 3
    end
    object PkCurrencyCodeNATIVE_CURR: TStringField
      DisplayLabel = 'Native Currency Code'
      DisplayWidth = 18
      FieldName = 'NATIVE_CURR'
      Origin = 'NATIVE_CURR'
      Size = 3
    end
    object PkCurrencyCodeID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
  end
end
