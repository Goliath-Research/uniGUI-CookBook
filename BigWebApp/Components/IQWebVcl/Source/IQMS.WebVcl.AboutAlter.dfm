object IQAboutAlterSession: TIQAboutAlterSession
  Left = 192
  Top = 165
  ClientHeight = 117
  ClientWidth = 262
  Caption = 'Alter Session'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 4
    Top = 6
    Width = 253
    Height = 73
    Hint = ''
    TabOrder = 2
    Caption = ''
  end
  object Label1: TUniLabel
    Left = 15
    Top = 19
    Width = 90
    Height = 13
    Hint = ''
    Caption = 'Max dump  file size'
    TabOrder = 3
  end
  object edMaxDumpFileSize: TUniEdit
    Left = 121
    Top = 15
    Width = 78
    Height = 21
    Hint = ''
    Text = '409600'
    TabOrder = 0
  end
  object chkbTrace: TUniCheckBox
    Left = 12
    Top = 43
    Width = 122
    Height = 17
    Hint = ''
    Caption = 'Turn SQL Trace ON'
    TabOrder = 1
  end
  object btnOK: TUniButton
    Left = 97
    Top = 86
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'OK'
    TabOrder = 4
    OnClick = btnOKClick
  end
  object btnCancel: TUniButton
    Left = 182
    Top = 86
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    Cancel = True
    ModalResult = 2
    TabOrder = 5
  end
end
