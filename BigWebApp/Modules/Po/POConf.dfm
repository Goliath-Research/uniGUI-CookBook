inherited Frm_POReceivedReleasesConfirm: TFrm_POReceivedReleasesConfirm
  Left = 285
  Top = 241
  ClientHeight = 125
  ClientWidth = 402
  Caption = 'Warning'
  OldCreateOrder = True
  ExplicitWidth = 418
  ExplicitHeight = 164
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Width = 402
    Height = 84
    ExplicitWidth = 402
    ExplicitHeight = 84
  end
  inherited Panel2: TUniPanel
    Top = 84
    Width = 402
    Height = 41
    ExplicitTop = 84
    ExplicitWidth = 402
    ExplicitHeight = 41
    inherited Bevel1: TUniPanel
      Width = 400
      ExplicitWidth = 400
    end
    object Panel3: TUniPanel
      Left = 193
      Top = 6
      Width = 208
      Height = 34
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object btnOk: TUniButton
        Left = 1
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 1
      end
      object btnCancel: TUniButton
        Left = 104
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'Frm_POReceivedReleasesConfirm')
    SecurityItems.Strings = (
      'btnOk')
    SecurityCode = 'FRM_PORECEIVEDRELEASESCONFIRM'
    Left = 157
    Top = 51
  end
end
