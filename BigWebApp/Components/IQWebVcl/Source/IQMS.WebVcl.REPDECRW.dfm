object CRWColumns: TCRWColumns
  Left = 404
  Top = 239
  ClientHeight = 185
  ClientWidth = 258
  Caption = 'CRW Table.Column'
  OldCreateOrder = True
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object TreeCRWColumns: TUniTreeView
    Left = 0
    Top = 0
    Width = 258
    Height = 152
    Hint = ''
    Items.FontData = {0100000000}
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Color = clWindow
    OnDblClick = TreeCRWColumnsDblClick
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 152
    Width = 258
    Height = 33
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel2: TUniPanel
      Left = 52
      Top = 1
      Width = 206
      Height = 31
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Button1: TUniButton
        Left = 2
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        ModalResult = 1
        TabOrder = 1
      end
      object Button2: TUniButton
        Left = 103
        Top = 4
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
