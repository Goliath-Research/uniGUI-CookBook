object CountryLookupDataModule: TCountryLookupDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 222
  Width = 190
  object SrcLocaleCountryLookup: TDataSource
    DataSet = QryLocaleCountryLookup
    Left = 56
    Top = 32
  end
  object QryLocaleCountryLookup: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      '  SELECT id, '
      '         name, '
      '         pk_hide'
      '    FROM locale_country'
      'ORDER BY seq')
    Left = 64
    Top = 40
    object QryLocaleCountryLookupID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryLocaleCountryLookupNAME: TWideStringField
      DisplayLabel = 'Country'
      FieldName = 'NAME'
      Origin = 'NAME'
      Size = 250
    end
    object QryLocaleCountryLookupPK_HIDE: TStringField
      DisplayLabel = 'Inactive?'
      FieldName = 'PK_HIDE'
      Origin = 'PK_HIDE'
      Visible = False
      Size = 1
    end
  end
  object SrcLocaleStateLookup: TDataSource
    DataSet = QryLocaleStateLookup
    Left = 64
    Top = 104
  end
  object QryLocaleStateLookup: TFDQuery
    BeforeOpen = QryLocaleStateLookupBeforeOpen
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      '  SELECT id, locale_country_id, name'
      '    FROM locale_subdivision'
      '   WHERE locale_country_id = :ID'
      'ORDER BY name')
    Left = 72
    Top = 112
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 37120000c
      end>
    object QryLocaleStateLookupNAME: TWideStringField
      DisplayLabel = 'Country Name'
      DisplayWidth = 25
      FieldName = 'NAME'
      Origin = 'NAME'
      Size = 100
    end
    object QryLocaleStateLookupID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryLocaleStateLookupLOCALE_COUNTRY_ID: TBCDField
      FieldName = 'LOCALE_COUNTRY_ID'
      Origin = 'LOCALE_COUNTRY_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
  end
end
