object DataModuleWC_9224: TDataModuleWC_9224
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 150
  Width = 215
  object mt1: TFDMemTable
    IndexFieldNames = 'ID'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 88
    Top = 48
    object mt1ID: TIntegerField
      FieldName = 'ID'
    end
    object mt1Name: TStringField
      FieldName = 'Name'
      Size = 10
    end
    object mt1EPLANT_ID: TFloatField
      DisplayLabel = 'Plant Code'
      FieldName = 'EPLANT_ID'
    end
    object mt1EPLANT_NAME: TStringField
      DisplayLabel = 'Plant Name'
      FieldName = 'EPLANT_NAME'
      Size = 64
    end
  end
end
