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
    ConnectionDefFileName = 'C:\bitbucket\unigui-cookbook\Samples\Hybrid3\ConnDefs.ini'
    WaitCursor = gcrNone
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        PrecMax = 2
        PrecMin = 0
        ScaleMax = 0
        ScaleMin = 0
        SourceDataType = dtBCD
        TargetDataType = dtSByte
      end
      item
        PrecMax = 4
        PrecMin = 3
        ScaleMax = 0
        ScaleMin = 0
        SourceDataType = dtBCD
        TargetDataType = dtInt16
      end
      item
        PrecMax = 8
        PrecMin = 5
        ScaleMax = 0
        ScaleMin = 0
        SourceDataType = dtBCD
        TargetDataType = dtInt32
      end
      item
        PrecMax = 18
        PrecMin = 18
        ScaleMax = 4
        ScaleMin = 4
        SourceDataType = dtBCD
        TargetDataType = dtCurrency
      end
      item
        SourceDataType = dtDateTimeStamp
        TargetDataType = dtDateTime
      end>
    Active = True
    Left = 40
    Top = 16
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Console'
    ScreenCursor = gcrNone
    Left = 104
    Top = 64
  end
end
