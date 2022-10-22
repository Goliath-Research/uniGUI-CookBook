object Cnvrt_DM: TCnvrt_DM
  OldCreateOrder = True
  Height = 177
  Width = 258
  object TblArinvt: TFDTable
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'ARINVT'
    TableName = 'ARINVT'
    Left = 24
    Top = 16
  end
  object TblFgMulti: TFDTable
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'FGMULTI'
    TableName = 'FGMULTI'
    Left = 88
    Top = 16
  end
  object TblArinvt_Breaks: TFDTable
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'ARINVT_BREAKS'
    TableName = 'ARINVT_BREAKS'
    Left = 24
    Top = 80
  end
end
