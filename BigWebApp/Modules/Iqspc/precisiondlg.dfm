object FrmPrecisionDlg: TFrmPrecisionDlg
  Left = 315
  Top = 269
  ClientHeight = 129
  ClientWidth = 283
  Caption = 'Precision'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Left = 0
    Top = 94
    Width = 283
    Height = 35
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel1: TUniPanel
      Left = 67
      Top = 1
      Width = 215
      Height = 33
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniBitBtn
        Left = 6
        Top = 5
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 0
      end
      object btnCancel: TUniBitBtn
        Left = 110
        Top = 5
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  object PnlMain: TUniPanel
    Left = 0
    Top = 0
    Width = 283
    Height = 94
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      283
      94)
    object Label1: TUniLabel
      Left = 8
      Top = 8
      Width = 270
      Height = 31
      Hint = ''
      AutoSize = False
      Caption = 'Specify number of places after the decimal point'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
    object Label2: TUniLabel
      Left = 8
      Top = 52
      Width = 69
      Height = 13
      Hint = ''
      Caption = 'Decimal Places'
      TabOrder = 3
    end
    object edtPrecision: TUniEdit
      Left = 144
      Top = 48
      Width = 73
      Height = 21
      Hint = ''
      Text = '0'
      TabOrder = 0
    end
    object udPrecision: TUpDown
      Left = 217
      Top = 48
      Width = 16
      Height = 21
      Associate = edtPrecision
      Max = 10
      TabOrder = 4
    end
  end
end
