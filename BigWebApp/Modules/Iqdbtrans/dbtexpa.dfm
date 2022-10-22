inherited FrmDBTransExportAlias: TFrmDBTransExportAlias
  Left = 335
  Top = 258
  ClientHeight = 80
  ClientWidth = 415
  Caption = 'Export'
  BorderStyle = bsDialog
  OldCreateOrder = True
  ExplicitWidth = 421
  ExplicitHeight = 128
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel4: TUniPanel
    Width = 415
    Visible = False
    ExplicitWidth = 384
  end
  inherited PnlMain: TUniPanel
    Width = 415
    Height = 77
    ExplicitWidth = 415
    ExplicitHeight = 77
    object lblPrompt: TUniLabel
      Left = 8
      Top = 8
      Width = 86
      Height = 13
      Hint = ''
      Caption = 'Exporting data ...'
      TabOrder = 2
    end
    object ProgressBar1: TUniProgressBar
      Left = 8
      Top = 48
      Width = 399
      Height = 17
      Hint = ''
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
  end
  inherited MainMenu1: TUniMainMenu
    Left = 136
    Top = 8
    inherited File1: TUniMenuItem
      Visible = False
    end
  end
  object TargetSQLConnection: TSQLConnection
    Left = 176
    Top = 8
  end
  object TargetADOConnection: TADOConnection
    Left = 216
    Top = 8
  end
end
