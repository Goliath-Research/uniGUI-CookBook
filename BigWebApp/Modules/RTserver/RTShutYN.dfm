object RTShutDownConfirm: TRTShutDownConfirm
  Left = 203
  Top = 156
  ClientHeight = 123
  ClientWidth = 269
  Caption = 'Confirm Shut Down'
  BorderStyle = bsDialog
  OldCreateOrder = True
  OnClose = UniFormClose
  MonitoredKeys.Keys = <>
  ActiveControl = btnCancel
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 27
    Top = 14
    Width = 209
    Height = 13
    Hint = ''
    Caption = 'Are you sure you want to shut down?'
    ParentFont = False
    Font.Color = clBlack
    Font.Style = [fsBold]
    TabOrder = 0
  end
  object lblTimeLeft: TUniLabel
    Left = 160
    Top = 38
    Width = 6
    Height = 13
    Hint = ''
    Caption = '9'
    ParentFont = False
    Font.Color = clBlack
    TabOrder = 1
  end
  object Label2: TUniLabel
    Left = 59
    Top = 38
    Width = 94
    Height = 13
    Hint = ''
    Caption = 'Back to RTServer in'
    TabOrder = 3
  end
  object Label3: TUniLabel
    Left = 170
    Top = 38
    Width = 39
    Height = 13
    Hint = ''
    Caption = 'seconds'
    TabOrder = 4
  end
  object btnShutDown: TUniButton
    Left = 33
    Top = 67
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Shut &Down'
    ModalResult = 1
    TabOrder = 5
  end
  object btnCancel: TUniButton
    Left = 161
    Top = 67
    Width = 75
    Height = 25
    Hint = ''
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 6
    Default = True
  end
  object chkKeepMonitor: TUniCheckBox
    Left = 7
    Top = 102
    Width = 245
    Height = 17
    Hint = ''
    Caption = 'Keep monitoring COM ports via Watch Dog'
    TabOrder = 2
  end
  object Timer1: TUniTimer
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = Timer1Timer
    Left = 240
    Top = 32
  end
end
