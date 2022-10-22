inherited FrmDBTransExportExcel: TFrmDBTransExportExcel
  Left = 373
  Top = 196
  ClientHeight = 80
  ClientWidth = 415
  Caption = 'Export'
  OnShow = FormShow
  BorderStyle = bsDialog
  OldCreateOrder = True
  ExplicitWidth = 421
  ExplicitHeight = 129
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel4: TUniPanel
    Width = 415
    ExplicitWidth = 415
  end
  inherited PnlMain: TUniPanel
    Width = 415
    Height = 77
    ExplicitWidth = 415
    ExplicitHeight = 77
    object lblStatus1: TUniLabel
      Left = 8
      Top = 8
      Width = 83
      Height = 13
      Hint = ''
      Caption = 'Exporting data...'
      TabOrder = 2
    end
    object ProgressBar: TUniProgressBar
      Left = 8
      Top = 48
      Width = 399
      Height = 17
      Hint = ''
      TabOrder = 0
    end
  end
  inherited MainMenu1: TUniMainMenu
    Left = 232
    Top = 8
    inherited File1: TUniMenuItem
      Visible = False
    end
  end
end
