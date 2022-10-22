object ShopDlg: TShopDlg
  Left = 277
  Top = 201
  ClientHeight = 165
  ClientWidth = 622
  Caption = ''
  BorderStyle = bsDialog
  OldCreateOrder = True
  MonitoredKeys.Keys = <>
  Font.Name = 'Segoe UI'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 124
    Width = 622
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 412
      Top = 1
      Width = 210
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object bbtnOK: TUniBitBtn
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 0
      end
      object bbtnCancel: TUniBitBtn
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        TabOrder = 1
      end
    end
  end
  object PnlMain: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 622
    Height = 124
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object lblPrompt: TUniLabel
      Left = 1
      Top = 1
      Width = 591
      Height = 13
      Hint = ''
      Caption = 
        'This option recreates and stores weekends/off shift information ' +
        'according to the Shop Calendar Setup parameters.'
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object lblYear: TUniLabel
      Left = 8
      Top = 62
      Width = 246
      Height = 13
      Hint = ''
      Caption = 'Create weekends/off shift info for calendar year'
      TabOrder = 2
    end
    object eYear: TUniSpinEdit
      Left = 261
      Top = 56
      Width = 52
      Height = 22
      Hint = ''
      Value = 1234
      TabOrder = 3
    end
  end
end
