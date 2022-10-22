object FrmChangeCase: TFrmChangeCase
  Left = 365
  Top = 331
  ClientHeight = 130
  ClientWidth = 243
  Caption = 'Change Case'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 243
    Height = 89
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object rgCase: TUniRadioGroup
      Left = 1
      Top = 1
      Width = 241
      Height = 87
      Hint = ''
      Items.Strings = (
        'lowercase'
        'UPPERCASE'
        'Title Case')
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = ' Select Case Option '
      TabOrder = 0
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 89
    Width = 243
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel3: TUniPanel
      Left = 30
      Top = 1
      Width = 213
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniBitBtn
        Left = 8
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 0
      end
      object btnCancel: TUniBitBtn
        Left = 112
        Top = 8
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
