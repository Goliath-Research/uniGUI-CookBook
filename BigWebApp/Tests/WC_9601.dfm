object Frm_WC_9601: TFrm_WC_9601
  Left = 0
  Top = 0
  ClientHeight = 572
  ClientWidth = 810
  Caption = 'Frm_WC_9601'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object IQWebTinyMCE1: TIQWebTinyMCE
    Left = 0
    Top = 0
    Width = 810
    Height = 257
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
  end
  object UniButton1: TUniButton
    Left = 216
    Top = 263
    Width = 369
    Height = 41
    Hint = ''
    Caption = 'Get HTML Text'
    TabOrder = 1
    OnClick = UniButton1Click
  end
  object UniMemo1: TUniMemo
    Left = 0
    Top = 310
    Width = 810
    Height = 262
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
  end
end
