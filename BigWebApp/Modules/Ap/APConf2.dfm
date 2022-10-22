inherited FrmAPARConf: TFrmAPARConf
  ClientHeight = 116
  ClientWidth = 481
  OldCreateOrder = True
  ExplicitWidth = 497
  ExplicitHeight = 155
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Width = 481
    Height = 77
    ExplicitWidth = 481
    ExplicitHeight = 77
  end
  inherited Panel2: TUniPanel
    Top = 77
    Width = 481
    Height = 39
    ExplicitTop = 77
    ExplicitWidth = 481
    ExplicitHeight = 39
    inherited Bevel1: TUniPanel
      Width = 479
      ExplicitWidth = 479
    end
    object BtnOk: TUniButton
      Left = 176
      Top = 8
      Width = 97
      Height = 25
      Hint = ''
      Caption = '&OK'
      TabOrder = 3
      OnClick = BtnOkClick
    end
    object btnPeriod: TUniButton
      Tag = 1
      Left = 280
      Top = 8
      Width = 97
      Height = 25
      Hint = ''
      Caption = '&Change Period'
      TabOrder = 4
      OnClick = BtnOkClick
    end
    object BtnDate: TUniButton
      Tag = 2
      Left = 384
      Top = 8
      Width = 97
      Height = 25
      Hint = ''
      Caption = '&Edit Date'
      TabOrder = 5
      OnClick = BtnOkClick
    end
  end
end
