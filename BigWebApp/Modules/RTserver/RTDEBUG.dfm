object RTDebugLog: TRTDebugLog
  Left = 57
  Top = 114
  ClientHeight = 171
  ClientWidth = 423
  Caption = 'Debug Log'
  OldCreateOrder = True
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 137
    Width = 423
    Height = 34
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 257
      Top = 1
      Width = 166
      Height = 32
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnRefresh: TUniButton
        Left = 1
        Top = 7
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Refresh'
        TabOrder = 1
        OnClick = btnRefreshClick
      end
      object btnClear: TUniButton
        Left = 89
        Top = 7
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Clear'
        TabOrder = 2
        OnClick = btnClearClick
      end
    end
  end
  object RichEdit1: TUniHTMLMemo
    Left = 0
    Top = 0
    Width = 423
    Height = 137
    Hint = ''
    ScrollBars = ssBoth
    Lines.Strings = (
      'RichEdit1')
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clWindow
    TabOrder = 1
  end
end
