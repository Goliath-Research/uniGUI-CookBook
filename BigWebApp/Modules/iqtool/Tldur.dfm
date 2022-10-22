object FrmToolingDuration: TFrmToolingDuration
  Left = 368
  Top = 243
  ClientHeight = 101
  ClientWidth = 271
  Caption = 'Edit Duration'
  OnShow = FormShow
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlCarrier: TUniPanel
    Left = 0
    Top = 0
    Width = 271
    Height = 69
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object lblDuration: TUniLabel
      Left = 8
      Top = 12
      Width = 41
      Height = 13
      Hint = ''
      Caption = 'Duration'
      TabOrder = 1
    end
    object lblUnit: TUniLabel
      Left = 8
      Top = 36
      Width = 19
      Height = 13
      Hint = ''
      Caption = 'Unit'
      TabOrder = 2
    end
    object cmbUnit: TUniComboBox
      Left = 80
      Top = 32
      Width = 98
      Height = 21
      Hint = ''
      Text = ''
      Items.Strings = (
        'Minutes'
        'Hours'
        'Days'
        'Weeks')
      TabOrder = 3
    end
    object cmbDuration: TIQWebFloatSpinner
      Left = 80
      Top = 5
      Width = 100
      Height = 21
      Hint = ''
      TabOrder = 4
      Position = 0.000000000000000000
      Precision = 9
      Style = fstCustom
      SpinBtnHeight = 10
      SpinBtnWidth = 17
      LargeBtnImage = False
      DesignSize = (
        100
        21)
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 69
    Width = 271
    Height = 32
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel2: TUniPanel
      Left = 64
      Top = 1
      Width = 207
      Height = 30
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniBitBtn
        Left = 3
        Top = 2
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 0
        Default = True
      end
      object btnCancel: TUniBitBtn
        Left = 104
        Top = 2
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
end
