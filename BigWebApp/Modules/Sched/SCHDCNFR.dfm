object ConfirmRecalc: TConfirmRecalc
  Left = 221
  Top = 170
  ClientHeight = 109
  ClientWidth = 352
  Caption = 'Confirm Recalculation'
  BorderStyle = bsDialog
  OldCreateOrder = True
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 70
    Width = 352
    Height = 39
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 22
      Top = 1
      Width = 330
      Height = 37
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnCurrent: TUniButton
        Left = 16
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Current'
        ModalResult = 1
        TabOrder = 1
      end
      object btnALL: TUniButton
        Left = 120
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'All Centers'
        TabOrder = 2
        OnClick = btnALLClick
      end
      object btnCancel: TUniButton
        Left = 224
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 3
      end
    end
  end
  object PnlMain: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 352
    Height = 70
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Label1: TUniLabel
      Left = 13
      Top = 16
      Width = 101
      Height = 13
      Hint = ''
      Caption = 'Current Work Center'
      TabOrder = 2
    end
    object Edit1: TUniEdit
      Left = 127
      Top = 12
      Width = 142
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 0
      Color = clBtnFace
      ReadOnly = True
    end
  end
end
