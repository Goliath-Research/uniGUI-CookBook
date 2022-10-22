object FrmConnDlg: TFrmConnDlg
  Left = 291
  Top = 253
  ClientHeight = 80
  ClientWidth = 361
  Caption = 'Connect & Send ...'
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object IP: TUniLabel
    Left = 6
    Top = 34
    Width = 52
    Height = 13
    Hint = ''
    Caption = 'IP Address'
    TabOrder = 3
  end
  object Port: TUniLabel
    Left = 6
    Top = 59
    Width = 20
    Height = 13
    Hint = ''
    Caption = 'Port'
    TabOrder = 4
  end
  object Label1: TUniLabel
    Left = 6
    Top = 9
    Width = 46
    Height = 13
    Hint = ''
    Caption = 'File Name'
    TabOrder = 5
  end
  object sbtnBrowse: TUniSpeedButton
    Left = 244
    Top = 5
    Width = 22
    Height = 21
    Hint = 'Find file ...'
    ShowHint = True
    ParentShowHint = False
    Glyph.Data = {
      E6040000424DE604000000000000360000002800000014000000140000000100
      180000000000B0040000C40E0000C40E00000000000000000000C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C6C3C6C6C3C6C6
      C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6
      C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C0C0C0C0C0C0C6C3C6C6C3C6C6C3C6C6C3
      C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C600000000
      0000C6C3C6C6C3C6C6C3C6C0C0C0C0C0C0C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6
      C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6840000FFFF00FF00000000
      00C6C3C6C6C3C6C0C0C0C0C0C0C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6
      C3C6C6C3C6C6C3C6C6C3C6C6C3C6840000FFFF00FF0000FF0000000000C6C3C6
      C6C3C6C0C0C0C0C0C0C6C3C6C6C3C60000000000000000000000000000000000
      00000000000000840000FFFF00FF0000FF0000000000C6C3C6C6C3C6C6C3C6C0
      C0C0C0C0C0C6C3C6848684008684008684008684008684008684008684008684
      840000FFFF00FF0000FF0000008684008684000000C6C3C6C6C3C6C0C0C0C0C0
      C0C6C3C6848684FFFFFF00FFFFC6C7C6848684000000000000848684C6C7C6FF
      0000FF000000868400FFFF008684000000C6C3C6C6C3C6C0C0C0C0C0C0C6C3C6
      848684FFFFFFC6C7C6848684C6C7C6FFFF00C6C7C60000008486840086840086
      8400FFFFC6C7C6008684000000C6C3C6C6C3C6C0C0C0C0C0C0C6C3C6848684FF
      FFFF848684FFFFFFFFFF00C6C7C6FFFF00C6C7C600000000868400FFFFC6C7C6
      00FFFF008684000000C6C3C6C6C3C6C0C0C0C0C0C0C6C3C6848684FFFFFF8486
      84FFFF00FFFFFFFFFF00C6C7C6FFFF00000000008684C6C7C600FFFFC6C7C600
      8684000000C6C3C6C6C3C6C0C0C0C0C0C0C6C3C6848684FFFFFF848684FFFFFF
      FFFF00FFFFFFFFFF00C6C7C600000084868400FFFFC6C7C600FFFF0086840000
      00C6C3C6C6C3C6C0C0C0C0C0C0C6C3C6848684FFFFFFC6C7C6848684FFFFFFFF
      FF00FFFFFF00000084868400FFFFC6C7C600FFFFC6C7C6008684000000C6C3C6
      C6C3C6C0C0C0C0C0C0C6C3C6848684FFFFFF00FFFFC6C7C68486848486840000
      0084868400FFFFC6C7C600FFFFC6C7C600FFFF008684000000C6C3C6C6C3C6C0
      C0C0C0C0C0C6C3C6848684FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF008684000000C6C3C6C6C3C6C0C0C0C0C0
      C0C6C3C6848684C6C7C600FFFFC6C7C600FFFFC6C7C600FFFFC6C7C684868484
      8684848684848684848684848684C6C3C6C6C3C6C6C3C6C0C0C0C0C0C0C6C3C6
      C6C3C6848684C6C7C600FFFFC6C7C600FFFFC6C7C6848684C6C3C6C6C3C6C6C3
      C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C0C0C0C0C0C0C6C3C6C6C3C6C6
      C3C6848684848684848684848684848684C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6
      C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C0C0C0C0C0C0C6C3C6C6C3C6C6C3C6C6C3
      C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6
      C3C6C6C3C6C6C3C6C6C3C6C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0}
    Caption = ''
    ParentColor = False
    Color = clWindow
    OnClick = sbtnBrowseClick
  end
  object edIP: TUniEdit
    Left = 67
    Top = 30
    Width = 176
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 1
  end
  object edPort: TUniEdit
    Left = 67
    Top = 56
    Width = 79
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 2
  end
  object edFileName: TUniEdit
    Left = 67
    Top = 5
    Width = 175
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 0
  end
  object btnOK: TUniButton
    Left = 281
    Top = 5
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'OK'
    TabOrder = 7
    OnClick = btnOKClick
  end
  object btnCancel: TUniButton
    Left = 281
    Top = 37
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    Cancel = True
    ModalResult = 2
    TabOrder = 8
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
    Left = 240
    Top = 32
  end
end
