inherited FrmProdRepConfirmArchive: TFrmProdRepConfirmArchive
  ClientHeight = 104
  ExplicitHeight = 142
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Height = 66
    ExplicitHeight = 66
    inherited lblConfBasMsgText: TUniLabel
      Width = 91
      Caption = 'lblConfBasMsgText'
      ExplicitWidth = 91
    end
  end
  inherited Panel2: TUniPanel
    Top = 66
    ExplicitTop = 66
    object Panel3: TUniPanel
      Left = 206
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
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'CheckBox'
      'btnYes')
    SecurityCode = 'FRMPRODREPCONFIRMARCHIVE'
    Left = 162
    Top = 77
  end
end
