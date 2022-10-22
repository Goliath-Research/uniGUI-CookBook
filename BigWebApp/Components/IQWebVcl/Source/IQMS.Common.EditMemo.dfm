object FrmEditMemo: TFrmEditMemo
  Left = 189
  Top = 254
  ClientHeight = 164
  ClientWidth = 309
  Caption = 'Edit Memo '
  Position = poDefaultPosOnly
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBMemo: TUniDBMemo
    Left = 0
    Top = 0
    Width = 309
    Height = 131
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 131
    Width = 309
    Height = 33
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel2: TUniPanel
      Left = 224
      Top = 1
      Width = 85
      Height = 31
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 8
        Top = 6
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'OK'
        ModalResult = 1
        TabOrder = 1
      end
    end
  end
end
