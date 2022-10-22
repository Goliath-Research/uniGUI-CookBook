object FrmToolingConfirm: TFrmToolingConfirm
  Left = 362
  Top = 111
  ClientHeight = 121
  ClientWidth = 290
  Caption = 'Confirm'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 290
    Height = 80
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object RadioGroup1: TUniRadioGroup
      Left = 1
      Top = 1
      Width = 288
      Height = 78
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = ' Options '
      TabOrder = 0
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 80
    Width = 290
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel3: TUniPanel
      Left = 81
      Top = 1
      Width = 209
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniBitBtn
        Left = 1
        Top = 10
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 0
      end
      object btnCancel: TUniBitBtn
        Left = 104
        Top = 10
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
end
