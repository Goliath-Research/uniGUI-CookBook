object FrmICTDiagram: TFrmICTDiagram
  Left = 221
  Top = 241
  ClientHeight = 376
  ClientWidth = 544
  Caption = 'FrmICTDiagram'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCarrier: TUniPanel
    Left = 0
    Top = 0
    Width = 544
    Height = 376
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object sboxCarrier: TUniScrollBox
      Left = 1
      Top = 29
      Width = 542
      Height = 346
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
    end
    object pnlTop: TUniPanel
      Left = 1
      Top = 1
      Width = 542
      Height = 28
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      object TrackBar: TUniTrackBar
        Left = 370
        Top = 1
        Width = 171
        Height = 26
        Hint = 'Zoom Level'
        ShowHint = True
        ParentShowHint = False
        Min = 1
        Position = 1
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
  end
end
