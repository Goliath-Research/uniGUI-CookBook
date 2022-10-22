object FrmInvWmsSetup: TFrmInvWmsSetup
  Left = 0
  Top = 0
  ClientHeight = 316
  ClientWidth = 258
  Caption = 'WMS Setup'
  BorderStyle = bsSizeToolWin
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 258
    Height = 316
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    Color = clWindow
    object Panel1: TUniPanel
      Left = 1
      Top = 1
      Width = 26
      Height = 314
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      ParentColor = True
      object pnlVSeparator1: TUniPanel
        Left = 24
        Top = 1
        Width = 1
        Height = 312
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
      end
    end
  end
end
