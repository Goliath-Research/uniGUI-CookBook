object FrmIQProgressDlg: TFrmIQProgressDlg
  Left = 324
  Top = 231
  ClientHeight = 81
  ClientWidth = 450
  Caption = ''
  BorderStyle = bsDialog
  OldCreateOrder = False
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label_ProcessStatus1: TUniLabel
    Left = 9
    Top = 8
    Width = 3
    Height = 13
    Hint = ''
    Caption = ''
    TabOrder = 2
  end
  object Label_ProcessStatus2: TUniLabel
    Left = 9
    Top = 27
    Width = 3
    Height = 13
    Hint = ''
    Caption = ''
    TabOrder = 3
  end
  object ProgressBar_StatusIndicator: TUniProgressBar
    Left = 8
    Top = 48
    Width = 345
    Height = 16
    Hint = ''
    TabOrder = 0
  end
  object btnCancel: TUniBitBtn
    Left = 365
    Top = 48
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
    OnClick = btnCancelClick
  end
end
