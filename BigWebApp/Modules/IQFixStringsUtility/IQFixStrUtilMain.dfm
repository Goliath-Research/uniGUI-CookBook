object FrmIQFixStrUtilMain: TFrmIQFixStrUtilMain
  Left = 0
  Top = 0
  ClientHeight = 290
  ClientWidth = 554
  Caption = 'Fix Strings'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnFixDelphiDebugStr: TUniButton
    Left = 8
    Top = 8
    Width = 219
    Height = 25
    Hint = ''
    Caption = 'Fix Delphi Debugger String'
    TabOrder = 0
    OnClick = btnFixDelphiDebugStrClick
  end
  object Button1: TUniButton
    Left = 8
    Top = 39
    Width = 219
    Height = 25
    Hint = ''
    Caption = 'Fix File Lines'
    TabOrder = 1
    OnClick = Button1Click
  end
  object btnFixDelphiUsesList: TUniButton
    Left = 8
    Top = 70
    Width = 219
    Height = 25
    Hint = ''
    Caption = 'Fix Delphi Uses List'
    TabOrder = 2
    OnClick = btnFixDelphiUsesListClick
  end
end
