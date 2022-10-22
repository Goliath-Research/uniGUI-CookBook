inherited FrmTransConfMove: TFrmTransConfMove
  ClientHeight = 100
  ExplicitWidth = 395
  ExplicitHeight = 139
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Height = 62
    ExplicitHeight = 62
    inherited lblConfBasMsgText: TUniLabel
      Width = 22
      Caption = 'Text'
      ExplicitWidth = 22
    end
  end
  inherited Panel2: TUniPanel
    Top = 62
    ExplicitTop = 62
    object Panel4: TUniPanel
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
        ModalResult = 1
        TabOrder = 1
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
    Left = 77
    Top = 19
  end
end
