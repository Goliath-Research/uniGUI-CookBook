object TestForm: TTestForm
  Left = 0
  Top = 0
  ClientHeight = 246
  ClientWidth = 477
  Caption = 'Test (using App DM On Demand)'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 0
    Width = 477
    Height = 246
    Hint = ''
    DataSource = AppDM1.dsList
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
  end
end
