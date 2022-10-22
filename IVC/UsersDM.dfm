object dmUsers: TdmUsers
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 150
  Width = 193
  object dsUsers: TDataSource
    DataSet = tblUsers
    Left = 24
    Top = 16
  end
  object tblUsers: TFDTable
    Active = True
    BeforePost = tblUsersBeforePost
    IndexFieldNames = 'Username'
    Connection = UniMainModule.Conn
    UpdateOptions.UpdateTableName = 'Users'
    TableName = 'Users'
    Left = 24
    Top = 72
    object tblUsersUsername: TStringField
      FieldName = 'Username'
      Origin = 'Username'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 16
    end
    object tblUsersPassword: TStringField
      FieldName = 'Password'
      Origin = 'Password'
      Required = True
      Size = 32
    end
    object tblUsersAdmin: TBooleanField
      FieldName = 'Admin'
      Origin = 'Admin'
    end
  end
  object ActionList1: TActionList
    Left = 104
    Top = 40
    object actToggleAdmin: TAction
      Category = 'tblUsers'
      Caption = 'Toggle Admin Status'
      ImageIndex = 3
      OnExecute = actToggleAdminExecute
    end
  end
end
