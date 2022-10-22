object FrmTLItem: TFrmTLItem
  Left = 422
  Top = 167
  ClientHeight = 115
  ClientWidth = 248
  Caption = 'Item Type'
  BorderStyle = bsDialog
  Position = poOwnerFormCenter
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlCtrls: TUniPanel
    Left = 0
    Top = 78
    Width = 248
    Height = 37
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtons: TUniPanel
      Left = 42
      Top = 1
      Width = 206
      Height = 35
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniBitBtn
        Left = 1
        Top = 6
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 0
      end
      object btnCancel: TUniBitBtn
        Left = 103
        Top = 6
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  object rgOption: TUniRadioGroup
    Left = 6
    Top = 4
    Width = 237
    Height = 61
    Hint = ''
    Items.Strings = (
      'Select from Inventory'
      'Free Form')
    ItemIndex = 0
    Caption = ' Choose Item Option '
    TabOrder = 1
  end
end
