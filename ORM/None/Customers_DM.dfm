object CustomersDM: TCustomersDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 150
  Width = 215
  object tblCustomers: TFDTable
    AfterPost = tblCustomersAfterPost
    IndexFieldNames = 'ID'
    Connection = MainDM.FDConnection1
    UpdateOptions.UpdateTableName = 'Customers'
    TableName = 'Customers'
    Left = 88
    Top = 72
  end
  object dsCustomers: TDataSource
    DataSet = tblCustomers
    Left = 88
    Top = 24
  end
end
