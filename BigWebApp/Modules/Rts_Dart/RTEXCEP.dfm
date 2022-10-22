object FrmExceptionList: TFrmExceptionList
  Left = 87
  Top = 185
  ClientHeight = 176
  ClientWidth = 443
  Caption = ''
  Position = poDefaultPosOnly
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Name = 'MS Sans Serif'
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 141
    Width = 443
    Height = 35
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 184
      Top = 1
      Width = 259
      Height = 33
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnClear: TUniButton
        Left = 92
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Clear'
        TabOrder = 1
        OnClick = btnClearClick
      end
      object Button2: TUniButton
        Left = 183
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Exit'
        ModalResult = 1
        TabOrder = 2
      end
      object btnRefresh: TUniButton
        Left = 1
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Refresh'
        TabOrder = 3
        OnClick = btnRefreshClick
      end
    end
  end
  object UniMemo1: TUniMemo
    Left = 0
    Top = 0
    Width = 443
    Height = 141
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    ExplicitLeft = 160
    ExplicitTop = 56
    ExplicitWidth = 185
    ExplicitHeight = 89
  end
end
