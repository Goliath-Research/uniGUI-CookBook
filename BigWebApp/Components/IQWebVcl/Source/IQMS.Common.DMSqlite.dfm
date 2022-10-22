object sqlite_DM: Tsqlite_DM
  OldCreateOrder = False
  Height = 257
  Width = 312
  object ConnToDbfFile: TADOConnection
    LoginPrompt = False
    Left = 40
    Top = 80
  end
  object DBFDataset: TADODataSet
    Connection = ConnToDbfFile
    Parameters = <>
    Left = 40
    Top = 24
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 48
    Top = 192
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 48
    Top = 144
  end
  object FDConnToSQLiteDB: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    FormatOptions.AssignedValues = [fvStrsTrim]
    FormatOptions.StrsTrim = False
    LoginPrompt = False
    Left = 144
    Top = 32
  end
  object tblSQLite: TFDTable
    Connection = FDConnToSQLiteDB
    FormatOptions.AssignedValues = [fvStrsTrim]
    FormatOptions.StrsTrim = False
    Left = 144
    Top = 88
  end
end
