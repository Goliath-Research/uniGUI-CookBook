object frmUpdate: TfrmUpdate
  Left = 291
  Top = 190
  ClientHeight = 68
  ClientWidth = 341
  Caption = 'EnterpriseIQ Update From Master'
  BorderStyle = bsSingle
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 8
    Top = 8
    Width = 66
    Height = 13
    Hint = ''
    Caption = 'Updating File:'
    TabOrder = 1
  end
  object lblUpdatingFile: TUniLabel
    Left = 8
    Top = 24
    Width = 18
    Height = 13
    Hint = ''
    Caption = 'N/A'
    TabOrder = 2
  end
  object ProgressBar: TUniProgressBar
    Left = 8
    Top = 40
    Width = 321
    Height = 17
    Hint = ''
    Visible = False
    TabOrder = 0
  end
end
