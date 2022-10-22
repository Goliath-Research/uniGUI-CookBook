object CustomersDM: TCustomersDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 150
  Width = 215
  object dsCustomers: TDataSource
    DataSet = dstCustomers
    Left = 88
    Top = 24
  end
  object dstCustomers: TObjectDataSet
    Left = 88
    Top = 72
    object dstCustomersID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dstCustomersName: TStringField
      FieldName = 'Name'
      Origin = 'Name'
      Required = True
      Size = 64
    end
  end
end
