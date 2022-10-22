inherited FrmPSConfDelEmptyTktLine: TFrmPSConfDelEmptyTktLine
  Left = 76
  Top = 290
  ClientHeight = 118
  ClientWidth = 388
  OldCreateOrder = True
  ExplicitWidth = 404
  ExplicitHeight = 156
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Width = 388
    Height = 79
    ExplicitWidth = 396
    ExplicitHeight = 83
    object Label1: TUniLabel
      Left = 7
      Top = 9
      Width = 381
      Height = 73
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      Caption = 'Label1'
    end
  end
  inherited Panel2: TUniPanel
    Top = 79
    Width = 388
    Height = 39
    ExplicitTop = 83
    ExplicitWidth = 396
    ExplicitHeight = 39
    inherited Bevel1: TUniPanel
      Width = 396
      ExplicitWidth = 396
    end
    object pnlButtons: TUniPanel
      Left = 180
      Top = 5
      Width = 216
      Height = 34
      Align = alRight
      TabOrder = 1
      object btnYes: TUniButton
        Tag = 1
        Left = 3
        Top = 3
        Width = 97
        Height = 25
        Caption = '&Yes'
        OnClick = btnYesClick
      end
      object btnAbort: TUniButton
        Left = 110
        Top = 3
        Width = 97
        Height = 25
        Caption = '&Abort'
        ModalResult = 2
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'btnYes'
      'CheckBox')
    SecurityCode = 'IQDIALOGCHECKBOX_DEL_EMPTY_TKT_LINE'
    Left = 153
    Top = 21
  end
end
