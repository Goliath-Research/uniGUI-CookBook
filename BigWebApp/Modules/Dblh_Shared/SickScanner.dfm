object FrmSickScanner: TFrmSickScanner
  Left = 659
  Top = 434
  ClientHeight = 61
  ClientWidth = 158
  Caption = 'Sick Scanner'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object commSickScanner: TApdWinsockPort
    WsLocalAddresses.Strings = (
      '10.92.6.120')
    WsLocalAddressIndex = 0
    WsPort = 'telnet'
    WsSocksServerInfo.Port = 0
    AutoOpen = False
    Baud = 2400
    ComNumber = 1
    InSize = 1024
    TraceName = 'APRO.TRC'
    LogName = 'APROScannerLeft.LOG'
    OutSize = 1024
    PromptForPort = False
    OnTriggerAvail = commSickScannerTriggerAvail
    Left = 32
    Top = 8
  end
  object Timer1: TUniTimer
    Interval = 60000
    Enabled = False
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = Timer1Timer
    Left = 96
    Top = 8
  end
end
