object DM: TDM
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 196
  Width = 295
  object dsOrders: TDataSource
    DataSet = tblOrders
    Left = 80
    Top = 16
  end
  object dsItems: TDataSource
    DataSet = tblItems
    Left = 80
    Top = 105
  end
  object Conn: TFDConnection
    Params.Strings = (
      
        'Database=X:\OneDrive\GitHub\unigui-cookbook\Samples\Databases\Fi' +
        'reDAC\SQLite\SQLite_Sales.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 16
    Top = 64
  end
  object tblCustomers: TFDTable
    IndexFieldNames = 'ID'
    Connection = Conn
    UpdateOptions.UpdateTableName = 'Customers'
    TableName = 'Customers'
    Left = 208
    Top = 16
    object tblCustomersID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object tblCustomersName: TStringField
      FieldName = 'Name'
      Origin = 'Name'
      Required = True
      Size = 64
    end
  end
  object tblProducts: TFDTable
    IndexFieldNames = 'ID'
    Connection = Conn
    UpdateOptions.UpdateTableName = 'Products'
    TableName = 'Products'
    Left = 208
    Top = 104
    object tblProductsID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object tblProductsDescription: TStringField
      FieldName = 'Description'
      Origin = 'Description'
      Required = True
      Size = 64
    end
    object tblProductsPrice: TCurrencyField
      FieldName = 'Price'
      Origin = 'Price'
    end
  end
  object tblOrders: TFDTable
    IndexFieldNames = 'ID'
    Connection = Conn
    UpdateOptions.UpdateTableName = 'Orders'
    TableName = 'Orders'
    Left = 144
    Top = 16
    object tblOrdersID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object tblOrdersCustomerID: TIntegerField
      FieldName = 'CustomerID'
      Origin = 'CustomerID'
      Required = True
    end
    object tblOrdersCustomer: TStringField
      DisplayWidth = 23
      FieldKind = fkLookup
      FieldName = 'Customer'
      LookupDataSet = tblCustomers
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'CustomerID'
      Size = 64
      Lookup = True
    end
    object tblOrdersPosted: TDateTimeField
      FieldName = 'Posted'
      Origin = 'Posted'
      Required = True
    end
  end
  object tblItems: TFDTable
    OnCalcFields = tblItemsCalcFields
    IndexFieldNames = 'OrderID;ProductID'
    MasterSource = dsOrders
    MasterFields = 'ID'
    DetailFields = 'OrderID'
    Connection = Conn
    UpdateOptions.UpdateTableName = 'Items'
    TableName = 'Items'
    Left = 144
    Top = 104
    object tblItemsOrderID: TIntegerField
      DisplayWidth = 10
      FieldName = 'OrderID'
      Origin = 'OrderID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tblItemsProductID: TIntegerField
      DisplayWidth = 10
      FieldName = 'ProductID'
      Origin = 'ProductID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object tblItemsProduct: TStringField
      DisplayWidth = 23
      FieldKind = fkLookup
      FieldName = 'Product'
      LookupDataSet = tblProducts
      LookupKeyFields = 'ID'
      LookupResultField = 'Description'
      KeyFields = 'ProductID'
      Size = 64
      Lookup = True
    end
    object tblItemsQuantity: TIntegerField
      DisplayWidth = 10
      FieldName = 'Quantity'
      Origin = 'Quantity'
      Required = True
    end
    object tblItemsPrice: TCurrencyField
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'Price'
      LookupDataSet = tblProducts
      LookupKeyFields = 'ID'
      LookupResultField = 'Price'
      KeyFields = 'ProductID'
      Lookup = True
    end
    object tblItemsTotal: TCurrencyField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Total'
      Calculated = True
    end
  end
end
