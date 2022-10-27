object UniServerModule: TUniServerModule
  OldCreateOrder = False
  OnCreate = UniGUIServerModuleCreate
  TempFolder = 'temp\'
  Title = 'Point of Sale (demo)'
  SuppressErrors = []
  Bindings = <>
  ServerMessages.UnavailableErrMsg = 'Server unavailable, please try later'
  SSL.SSLOptions.RootCertFile = 'root.pem'
  SSL.SSLOptions.CertFile = 'cert.pem'
  SSL.SSLOptions.KeyFile = 'key.pem'
  SSL.SSLOptions.Method = sslvSSLv3
  SSL.SSLOptions.SSLVersions = [sslvSSLv3]
  SSL.SSLOptions.Mode = sslmUnassigned
  SSL.SSLOptions.VerifyMode = []
  SSL.SSLOptions.VerifyDepth = 0
  ConnectionFailureRecovery.ErrorMessage = 'Connection Error'
  ConnectionFailureRecovery.RetryMessage = 'Retrying...'
  Height = 147
  Width = 201
  object FDManager1: TFDManager
    ConnectionDefFileName = 'C:\bitbucket\unigui-cookbook\BigWebApp\BigWebAppConnDefs.ini'
    WaitCursor = gcrNone
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    Left = 40
    Top = 16
  end
end
