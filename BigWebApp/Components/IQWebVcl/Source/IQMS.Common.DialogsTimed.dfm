object FrmIQTimedMessageDlg: TFrmIQTimedMessageDlg
  Left = 447
  Top = 230
  ClientHeight = 92
  ClientWidth = 211
  Caption = ''
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object lblMsgText: TUniLabel
    Left = 8
    Top = 16
    Width = 3
    Height = 13
    Hint = ''
    Caption = ' '
    TabOrder = 1
  end
  object btnOk: TUniBitBtn
    Left = 61
    Top = 64
    Width = 97
    Height = 25
    Hint = ''
    Caption = ''
    Cancel = True
    ModalResult = 1
    TabOrder = 0
    Default = True
  end
  object CloseTimer: TUniTimer
    Interval = 10000
    Enabled = False
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = CloseTimerTimer
    Left = 48
    Top = 16
  end
end
