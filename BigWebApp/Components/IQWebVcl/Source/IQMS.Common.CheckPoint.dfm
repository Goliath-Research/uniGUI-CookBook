object FrmCheckPointList: TFrmCheckPointList
  Left = 125
  Top = 147
  ClientHeight = 159
  ClientWidth = 412
  Caption = 'Check Point List'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 120
    Width = 412
    Height = 39
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object pnlBtns: TUniPanel
      Left = 199
      Top = 1
      Width = 213
      Height = 37
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnRefresh: TUniButton
        Left = 4
        Top = 7
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Refresh'
        TabOrder = 1
        OnClick = btnRefreshClick
      end
      object btnClear: TUniButton
        Left = 108
        Top = 7
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Clear'
        TabOrder = 2
        OnClick = btnClearClick
      end
    end
  end
  object RichEdit1: TUniMemo
    Left = 0
    Top = 0
    Width = 412
    Height = 120
    Hint = ''
    ScrollBars = ssBoth
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Name = 'Courier New'
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    ReadOnly = True
    TabOrder = 1
    WordWrap = False
  end
end
