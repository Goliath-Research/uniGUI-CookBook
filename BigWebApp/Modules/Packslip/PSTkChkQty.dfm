inherited FrmPSTkChkQty: TFrmPSTkChkQty
  Left = 184
  Top = 150
  ClientHeight = 83
  ClientWidth = 430
  OldCreateOrder = True
  ExplicitWidth = 446
  ExplicitHeight = 122
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Width = 430
    Height = 45
    ExplicitWidth = 430
    ExplicitHeight = 45
    object Label1: TUniLabel
      Left = 14
      Top = 12
      Width = 412
      Height = 38
      Hint = ''
      AutoSize = False
      Caption = 'Label1'
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
    end
  end
  inherited Panel2: TUniPanel
    Top = 45
    Width = 430
    ExplicitTop = 45
    ExplicitWidth = 430
    inherited Bevel1: TUniPanel
      Width = 428
      ExplicitWidth = 428
    end
    object pnlButtons: TUniPanel
      Left = 219
      Top = 5
      Width = 211
      Height = 33
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object btnContinue: TUniButton
        Tag = 1
        Left = 2
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'C&ontinue'
        TabOrder = 1
        OnClick = btnContinueClick
      end
      object btnCancel: TUniButton
        Left = 106
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        ModalResult = 2
        TabOrder = 2
        OnClick = btnContinueClick
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmPSTkChkQty')
    SecurityItems.Strings = (
      'btnContinue'
      'CheckBox')
    SecurityCode = 'IQDIALOGCHECKBOX_PS_TKT'
    Left = 154
    Top = 55
  end
end
