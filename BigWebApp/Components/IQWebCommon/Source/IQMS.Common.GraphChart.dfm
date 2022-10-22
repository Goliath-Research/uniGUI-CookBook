object IQGraphChart: TIQGraphChart
  Left = 208
  Top = 121
  ClientHeight = 185
  ClientWidth = 504
  Caption = 'IQ Graph Chart'
  WindowState = wsMaximized
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 428
    Top = 0
    Width = 76
    Height = 185
    Hint = ''
    Align = alRight
    Anchors = [akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitLeft = 44
    ExplicitHeight = 0
    object Config: TUniButton
      Left = 8
      Top = 1
      Width = 65
      Height = 25
      Hint = ''
      Caption = '&Config'
      TabOrder = 1
      OnClick = ConfigClick
    end
    object Terminate: TUniButton
      Left = 8
      Top = 37
      Width = 65
      Height = 25
      Hint = ''
      Caption = '&Exit '
      TabOrder = 2
      OnClick = TerminateClick
    end
  end
  object Panel2: TUniPanel
    Left = 57
    Top = 30
    Width = 337
    Height = 113
    Hint = ''
    TabOrder = 1
    Caption = 'This Graph is Temporarily Diabled. '
  end
end
