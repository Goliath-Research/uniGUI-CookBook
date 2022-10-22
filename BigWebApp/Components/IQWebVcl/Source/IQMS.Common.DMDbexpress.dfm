object DBExpress_DM: TDBExpress_DM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object SQLConnection: TSQLConnection
    ConnectionName = 'OracleConnection'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit='
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver230.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=23.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXSybaseASAMetaDataCommandFactory,DbxSyb' +
        'aseASADriver230.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXSybaseASAMetaDataCommand' +
        'Factory,Borland.Data.DbxSybaseASADriver,Version=23.0.0.0,Culture' +
        '=neutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverASA'
      'LibraryName=dbxasa.dll'
      'LibraryNameOsx=libsqlasa.dylib'
      'VendorLib=dbodbc*.dll'
      'VendorLibWin64=dbodbc*.dll'
      'VendorLibOsx=libdbodbc12.dylib'
      'HostName=ServerName'
      'Database=DBNAME'
      'User_Name=user'
      'Password=password'
      'Port='
      'ConnectionString='
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted')
    Left = 104
    Top = 64
  end
end
