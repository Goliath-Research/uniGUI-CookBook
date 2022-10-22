object ProductsDM: TProductsDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 209
  Width = 214
  object dsProducts: TDataSource
    DataSet = dstProducts
    Left = 88
    Top = 24
  end
  object dstProducts: TObjectDataSet
    TrackChanges = True
    AfterPost = dstProductsAfterPost
    Left = 88
    Top = 96
    object dstProductsID: TAutoIncField
      FieldName = 'ID'
    end
    object dstProductsDescription: TStringField
      FieldName = 'Description'
      Size = 64
    end
    object dstProductsPrice: TCurrencyField
      FieldName = 'Price'
    end
  end
end
