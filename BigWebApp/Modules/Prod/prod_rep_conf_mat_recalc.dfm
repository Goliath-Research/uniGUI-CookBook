inherited FrmProdRepConfMatRecalc: TFrmProdRepConfMatRecalc
  ClientHeight = 101
  ClientWidth = 449
  ExplicitWidth = 465
  ExplicitHeight = 140
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Width = 449
    Height = 63
    ExplicitWidth = 449
    ExplicitHeight = 63
    inherited lblConfBasMsgText: TUniLabel
      Width = 128
      Caption = 'Recalculate Material Used?'
      ExplicitWidth = 128
    end
  end
  inherited Panel2: TUniPanel
    Top = 63
    Width = 449
    ExplicitTop = 63
    ExplicitWidth = 449
    inherited Bevel1: TUniPanel
      Width = 447
      ExplicitWidth = 447
    end
    object Panel3: TUniPanel
      Left = 276
      Top = 5
      Width = 173
      Height = 33
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object btnYes: TUniButton
        Tag = 1
        Left = 7
        Top = 3
        Width = 75
        Height = 25
        Hint = ''
        Caption = '&Yes'
        TabOrder = 1
        OnClick = btnYesClick
      end
      object btnAbort: TUniButton
        Left = 91
        Top = 3
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'No'
        ModalResult = 2
        TabOrder = 2
        OnClick = btnYesClick
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmProdRepConfMatRecalc')
    SecurityItems.Strings = (
      'btnYes'
      'CheckBox')
    SecurityCode = 'FRMPRODREPCONFMATRECALC'
    Left = 153
    Top = 15
  end
end
