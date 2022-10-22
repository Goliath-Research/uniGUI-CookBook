inherited FrmCDConf: TFrmCDConf
  Left = 291
  Top = 255
  ClientHeight = 105
  ClientWidth = 466
  OldCreateOrder = True
  ExplicitWidth = 482
  ExplicitHeight = 144
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Width = 466
    Height = 58
    ExplicitWidth = 466
    ExplicitHeight = 58
  end
  inherited Panel2: TUniPanel
    Top = 58
    Width = 466
    Height = 47
    ExplicitTop = 58
    ExplicitWidth = 466
    ExplicitHeight = 47
    inherited Bevel1: TUniPanel
      Width = 464
      ExplicitWidth = 464
    end
    inherited CheckBox: TUniCheckBox
      Top = 20
      ExplicitTop = 20
    end
    object Panel3: TUniPanel
      Left = 155
      Top = 5
      Width = 311
      Height = 42
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object BtnOk: TUniButton
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 1
        OnClick = BtnOkClick
      end
      object btnPeriod: TUniButton
        Tag = 1
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Change Period'
        TabOrder = 2
        OnClick = BtnOkClick
      end
      object BtnDate: TUniButton
        Tag = 2
        Left = 208
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Edit Date'
        TabOrder = 3
        OnClick = BtnOkClick
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmCDConf')
    SecurityItems.Strings = (
      'CheckBox')
    SecurityCode = 'FRMCDCONF'
    Left = 157
    Top = 75
  end
end
