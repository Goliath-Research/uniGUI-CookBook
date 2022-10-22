object FrmDateTimeDlg: TFrmDateTimeDlg
  Left = 359
  Top = 299
  ClientHeight = 116
  ClientWidth = 324
  Caption = 'Select Date and Time'
  BorderStyle = bsDialog
  Position = poOwnerFormCenter
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 75
    Width = 324
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 115
      Top = 1
      Width = 209
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniButton
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 1
        Default = True
      end
      object btnCancel: TUniButton
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel1: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 324
    Height = 75
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object lblDateTime: TUniLabel
      Left = 8
      Top = 20
      Width = 69
      Height = 13
      Hint = ''
      Caption = 'Date and Time'
      TabOrder = 2
    end
    object cmbDate: TUniDateTimePicker
      Left = 100
      Top = 16
      Width = 93
      Height = 21
      Hint = ''
      DateTime = 42647.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 0
    end
    object cmbTime: TUniDateTimePicker
      Left = 196
      Top = 16
      Width = 93
      Height = 21
      Hint = ''
      DateTime = 0.114947708330873900
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      Kind = tUniTime
      TabOrder = 3
    end
  end
end
