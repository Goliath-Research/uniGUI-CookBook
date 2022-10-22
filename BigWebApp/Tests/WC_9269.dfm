object frm_WC_9269: Tfrm_WC_9269
  Left = 0
  Top = 0
  ClientHeight = 138
  ClientWidth = 423
  Caption = 'IQMM'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object UniButton1: TUniButton
    Left = 24
    Top = 63
    Width = 145
    Height = 25
    Hint = ''
    Caption = 'Play files/demo.mp3'
    TabOrder = 0
    OnClick = UniButton1Click
  end
  object UniCheckBox1: TUniCheckBox
    Left = 24
    Top = 24
    Width = 97
    Height = 17
    Hint = ''
    Caption = 'Loop'
    TabOrder = 1
  end
  object UniButton2: TUniButton
    Left = 24
    Top = 103
    Width = 145
    Height = 25
    Hint = ''
    Caption = 'Play Custom Uploaded File'
    TabOrder = 2
    OnClick = UniButton2Click
  end
  object UniButton3: TUniButton
    Left = 184
    Top = 63
    Width = 73
    Height = 65
    Hint = ''
    Caption = 'Pause'
    TabOrder = 3
    OnClick = UniButton3Click
  end
  object UniButton4: TUniButton
    Left = 263
    Top = 63
    Width = 73
    Height = 65
    Hint = ''
    Caption = 'Resume'
    TabOrder = 4
    OnClick = UniButton4Click
  end
  object UniButton5: TUniButton
    Left = 342
    Top = 63
    Width = 73
    Height = 65
    Hint = ''
    Caption = 'Stop'
    TabOrder = 5
    OnClick = UniButton5Click
  end
  object UniButton6: TUniButton
    Left = 184
    Top = 32
    Width = 145
    Height = 25
    Hint = ''
    Caption = 'Play Beep'
    TabOrder = 6
    OnClick = UniButton6Click
  end
  object IQWebSound1: TIQWebSound
    Loop = False
    Volume = 100
    BeepFileName = 'files/beep.wav'
    Left = 264
    Top = 16
  end
  object UniFileUpload1: TUniFileUpload
    OnCompleted = UniFileUpload1Completed
    Title = 'Upload'
    Messages.Uploading = 'Uploading...'
    Messages.PleaseWait = 'Please Wait'
    Messages.Cancel = 'Cancel'
    Messages.Processing = 'Processing...'
    Messages.UploadError = 'Upload Error'
    Messages.Upload = 'Upload'
    Messages.NoFileError = 'Please Select a File'
    Messages.BrowseText = 'Browse...'
    Left = 208
    Top = 32
  end
end
