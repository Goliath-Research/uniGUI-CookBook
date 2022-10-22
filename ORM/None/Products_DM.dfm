object ProductsDM: TProductsDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 183
  Width = 214
  object tblProducts: TFDTable
    AfterPost = tblProductsAfterPost
    IndexFieldNames = 'ID'
    Connection = MainDM.FDConnection1
    UpdateOptions.UpdateTableName = 'Products'
    TableName = 'Products'
    Left = 88
    Top = 72
  end
  object dsProducts: TDataSource
    DataSet = tblProducts
    Left = 88
    Top = 24
  end
end
