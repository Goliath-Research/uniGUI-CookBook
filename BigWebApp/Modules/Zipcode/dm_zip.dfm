object ZIP_DM: TZIP_DM
  OldCreateOrder = False
  Height = 150
  Width = 215
  object PkZipCode: TIQWebHpick
    Tag = 1
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select'
      '   id as id,'
      '   city as city,'
      '   state as state,'
      '   zip as zip,'
      '   country as country'
      'from zipcode   ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 48
    Top = 16
    object PkZipCodeID: TBCDField
      FieldName = 'ID'
      Origin = 'ZIPCODE.ID'
      Visible = False
      Size = 0
    end
    object PkZipCodeCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 18
      FieldName = 'CITY'
      Origin = 'ZIPCODE.CITY'
      Size = 30
    end
    object PkZipCodeSTATE: TStringField
      DisplayLabel = 'State or Region'
      DisplayWidth = 12
      FieldName = 'STATE'
      Origin = 'ZIPCODE.STATE'
    end
    object PkZipCodeZIP: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 12
      FieldName = 'ZIP'
      Origin = 'ZIPCODE.ZIP'
    end
    object PkZipCodeCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 18
      FieldName = 'COUNTRY'
      Origin = 'ZIPCODE.COUNTRY'
      Size = 100
    end
  end
  object PkZipCodeLookup: TIQWebHpick
    Tag = 1
    BeforeOpen = PkZipCodeLookupBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select'
      '   id as id,'
      '   city as city,'
      '   state as state,'
      '   zip as zip,'
      '   country as country'
      'from zipcode   '
      'where trim(upper(zip)) = trim(upper( :zipcode ))')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 48
    Top = 64
    ParamData = <
      item
        Name = 'zipcode'
        DataType = ftString
        ParamType = ptInput
      end>
    object PkZipCodeLookupID: TBCDField
      FieldName = 'ID'
      Origin = 'ZIPCODE.ID'
      Visible = False
      Size = 0
    end
    object PkZipCodeLookupCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 18
      FieldName = 'CITY'
      Origin = 'ZIPCODE.CITY'
      Size = 30
    end
    object PkZipCodeLookupSTATE: TStringField
      DisplayLabel = 'State or Region'
      DisplayWidth = 12
      FieldName = 'STATE'
      Origin = 'ZIPCODE.STATE'
    end
    object PkZipCodeLookupZIP: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 12
      FieldName = 'ZIP'
      Origin = 'ZIPCODE.ZIP'
    end
    object PkZipCodeLookupCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 18
      FieldName = 'COUNTRY'
      Origin = 'ZIPCODE.COUNTRY'
      Size = 100
    end
  end
end
