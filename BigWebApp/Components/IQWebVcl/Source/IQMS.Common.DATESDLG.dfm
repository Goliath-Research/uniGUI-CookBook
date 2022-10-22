object FrmDatesDialog: TFrmDatesDialog
  Left = 165
  Top = 149
  ClientHeight = 105
  ClientWidth = 313
  Caption = 'Dates'
  BorderStyle = bsDialog
  OldCreateOrder = True
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TUniGroupBox
    Left = 0
    Top = 0
    Width = 313
    Height = 66
    Hint = ''
    Caption = '  Select Dates Scope  '
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object Label1: TUniLabel
      Left = 16
      Top = 26
      Width = 24
      Height = 13
      Hint = ''
      Caption = 'From'
      TabOrder = 3
    end
    object Label2: TUniLabel
      Left = 174
      Top = 26
      Width = 12
      Height = 13
      Hint = ''
      Caption = 'To'
      TabOrder = 4
    end
    object DateTimePicker1: TUniDateTimePicker
      Left = 49
      Top = 22
      Width = 97
      Height = 21
      Hint = ''
      DateTime = 42631.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 0
    end
    object DateTimePicker2: TUniDateTimePicker
      Left = 198
      Top = 22
      Width = 97
      Height = 21
      Hint = ''
      DateTime = 42631.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 1
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 66
    Width = 313
    Height = 39
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel2: TUniPanel
      Left = 106
      Top = 1
      Width = 207
      Height = 37
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
end
