object TimeDiff: TTimeDiff
  Left = 120
  Top = 163
  ClientHeight = 152
  ClientWidth = 324
  Caption = 'Set Time Zone Difference'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TUniLabel
    Left = 6
    Top = 83
    Width = 123
    Height = 13
    Hint = ''
    Caption = 'Time Zone Difference (hr)'
    TabOrder = 1
  end
  object Bevel4: TUniPanel
    Left = 6
    Top = 111
    Width = 313
    Height = 4
    Hint = ''
    TabOrder = 2
    Caption = ''
  end
  object Bevel1: TUniPanel
    Left = 6
    Top = 6
    Width = 315
    Height = 64
    Hint = ''
    TabOrder = 5
    Caption = ''
  end
  object Memo1: TUniMemo
    Left = 9
    Top = 9
    Width = 309
    Height = 58
    Hint = ''
    Lines.Strings = (
      'Unable to determine Time Zone Information. Error Code = 00')
    Color = clBtnFace
    TabOrder = 3
  end
  object Edit1: TUniEdit
    Left = 138
    Top = 79
    Width = 68
    Height = 21
    Hint = 'Time difference in hours: Server Time - Local Time'
    ShowHint = True
    ParentShowHint = False
    Text = '0'
    TabOrder = 0
  end
  object btnSave: TUniButton
    Left = 158
    Top = 121
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Save'
    TabOrder = 6
    OnClick = btnSaveClick
  end
  object btnIgnore: TUniButton
    Left = 245
    Top = 121
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    Cancel = True
    ModalResult = 2
    TabOrder = 7
  end
  object chkForceOffset: TUniCheckBox
    Left = 6
    Top = 122
    Width = 135
    Height = 17
    Hint = ''
    Caption = 'Force Offset Time'
    TabOrder = 4
  end
end
