inherited FrmConfirmMissingLotNo: TFrmConfirmMissingLotNo
  ClientHeight = 135
  ClientWidth = 455
  ExplicitWidth = 471
  ExplicitHeight = 174
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Width = 455
    Height = 97
    ExplicitWidth = 455
    ExplicitHeight = 97
    inherited lblConfBasMsgText: TUniLabel
      Width = 37
      Caption = 'Confirm'
      ExplicitWidth = 37
    end
  end
  inherited Panel2: TUniPanel
    Top = 97
    Width = 455
    ExplicitTop = 97
    ExplicitWidth = 455
    inherited Bevel1: TUniPanel
      Width = 453
      ExplicitWidth = 453
    end
    object Panel3: TUniPanel
      Left = 229
      Top = 6
      Width = 225
      Height = 31
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object btnYes: TUniButton
        Tag = 1
        Left = 7
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Yes'
        ModalResult = 1
        TabOrder = 1
      end
      object btnAbort: TUniButton
        Left = 115
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'No'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmConfirmMissingLotNo')
    SecurityItems.Strings = (
      'btnYes'
      'CheckBox')
    SecurityCode = 'FRMCONFIRMMISSINGLOTNO'
  end
end
