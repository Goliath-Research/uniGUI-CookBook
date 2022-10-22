inherited FrmPOChkStatusChange: TFrmPOChkStatusChange
  ClientHeight = 90
  OldCreateOrder = True
  ExplicitWidth = 395
  ExplicitHeight = 129
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Height = 51
    ExplicitHeight = 51
    object Label1: TUniLabel
      Left = 14
      Top = 12
      Width = 412
      Height = 36
      Hint = ''
      AutoSize = False
      Caption = 'Label1'
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
    end
  end
  inherited Panel2: TUniPanel
    Top = 51
    Height = 39
    ExplicitTop = 51
    ExplicitHeight = 39
    object Panel3: TUniPanel
      Left = 170
      Top = 5
      Width = 209
      Height = 34
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = ''
      object btnContinue: TUniButton
        Tag = 1
        Left = 1
        Top = 1
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'C&ontinue'
        ModalResult = 1
        TabOrder = 1
      end
      object btnCancel: TUniButton
        Left = 104
        Top = 1
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
      'FrmPOChkStatusChange')
    SecurityItems.Strings = (
      'btnContinue'
      'CheckBox')
    SecurityCode = 'FRMPOCHKSTATUSCHANGE'
    Left = 151
    Top = 71
  end
end
