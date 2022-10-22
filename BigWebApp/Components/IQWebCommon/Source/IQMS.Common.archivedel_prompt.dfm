object FrmArchiveDeletePrompt: TFrmArchiveDeletePrompt
  Left = 304
  Top = 214
  ClientHeight = 97
  ClientWidth = 244
  Caption = 'Confirm Delete'
  BorderStyle = bsDialog
  Position = poOwnerFormCenter
  OldCreateOrder = True
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TUniPanel
    Left = 0
    Top = 63
    Width = 244
    Height = 34
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel3: TUniPanel
      Left = 59
      Top = 1
      Width = 185
      Height = 32
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 21
        Top = 6
        Width = 75
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 1
      end
      object btnCancel: TUniButton
        Left = 108
        Top = 6
        Width = 75
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
    Left = 0
    Top = 0
    Width = 244
    Height = 63
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object grpOptions: TUniRadioGroup
      Left = 1
      Top = 1
      Width = 242
      Height = 61
      Hint = ''
      Items.Strings = (
        'Delete'
        'Archive')
      ItemIndex = 1
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = ' Options '
      TabOrder = 0
    end
  end
end
