inherited FrmDBTransExportMDB: TFrmDBTransExportMDB
  Left = 305
  Top = 308
  ClientHeight = 80
  ClientWidth = 415
  Caption = 'Export'
  OnShow = UniFormShow
  BorderStyle = bsDialog
  OldCreateOrder = True
  OnKeyDown = FormKeyDown
  KeyPreview = True
  ExplicitWidth = 421
  ExplicitHeight = 129
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel4: TUniPanel
    Width = 415
    Visible = False
    ExplicitWidth = 415
  end
  inherited PnlMain: TUniPanel
    Width = 415
    Height = 77
    ExplicitWidth = 415
    ExplicitHeight = 77
    object lblStatus: TUniLabel
      Left = 8
      Top = 8
      Width = 69
      Height = 13
      Hint = ''
      Caption = 'Please wait ...'
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
    Left = 56
    Top = 0
    inherited File1: TUniMenuItem
      Visible = False
    end
  end
end
