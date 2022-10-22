object FrmSPCChartWizExportChartBmp: TFrmSPCChartWizExportChartBmp
  Left = 0
  Top = 0
  ClientHeight = 290
  ClientWidth = 554
  Caption = 'Exporting...'
  OnShow = FormShow
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlProgress: TUniPanel
    Tag = 1999
    Left = 0
    Top = 249
    Width = 554
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      554
      41)
    object ProgressBar1: TUniProgressBar
      Left = 16
      Top = 16
      Width = 521
      Height = 16
      Hint = ''
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
  end
  object PnlChartParent: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 554
    Height = 249
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    Color = clWhite
  end
end
