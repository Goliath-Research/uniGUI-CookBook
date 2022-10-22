object FrmBFPromptKind: TFrmBFPromptKind
  Left = 242
  Top = 224
  ClientHeight = 105
  ClientWidth = 371
  Caption = 'Configuration Kind'
  BorderStyle = bsSingle
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Name = 'MS Sans Serif'
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 15
    Top = 24
    Width = 86
    Height = 13
    Hint = ''
    Caption = 'Configuration Kind'
    TabOrder = 2
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 62
    Width = 371
    Height = 43
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 369
      Height = 2
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
    end
    object Panel2: TUniPanel
      Left = 149
      Top = 2
      Width = 222
      Height = 41
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 3
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        ModalResult = 1
        TabOrder = 1
      end
      object btnCancel: TUniButton
        Left = 115
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
  object wwDBComboBox1: TUniDBComboBox
    Left = 125
    Top = 20
    Width = 125
    Height = 21
    Hint = ''
    Style = csDropDownList
    Items.Strings = (
      'BAG'#9'B'
      'FILM'#9'F')
    ItemIndex = 0
    TabOrder = 1
  end
end
