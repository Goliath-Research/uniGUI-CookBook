object FrmCostSourceSummary: TFrmCostSourceSummary
  Left = 0
  Top = 0
  ClientHeight = 290
  ClientWidth = 554
  Caption = 'Cost Source'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  Font.Height = -13
  PixelsPerInch = 96
  TextHeight = 16
  object IQRecordViewPanel1: TIQWebRecordViewPanel
    Left = 0
    Top = 0
    Width = 554
    Height = 290
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ReadOnly = True
    ControlOptions = []
    ReadOnlyColor = clBtnFace
  end
  object PMain: TUniPopupMenu
    Left = 272
    Top = 152
  end
  object ActionList1: TActionList
    Left = 280
    Top = 160
  end
  object AppDef1: TIQWebAppDef
    Left = 448
    Top = 216
  end
end
