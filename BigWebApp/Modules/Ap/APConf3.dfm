inherited FrmOutOfBal: TFrmOutOfBal
  ClientHeight = 150
  ClientWidth = 403
  Caption = 'Warning'
  OldCreateOrder = True
  ExplicitWidth = 419
  ExplicitHeight = 189
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Width = 403
    Height = 108
    ExplicitWidth = 411
    ExplicitHeight = 113
  end
  inherited Panel2: TUniPanel
    Top = 108
    Width = 403
    Height = 42
    ExplicitTop = 113
    ExplicitWidth = 411
    ExplicitHeight = 42
    inherited Bevel1: TUniPanel
      Width = 409
      ExplicitWidth = 409
    end
    object Panel3: TUniPanel
      Left = 203
      Top = 5
      Width = 208
      Height = 37
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        208
        37)
      object BtnOk: TUniButton
        Left = 1
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 1
        OnClick = BtnOkClick
      end
      object btnEdit: TUniButton
        Tag = 1
        Left = 104
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Edit Invoice'
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 2
        OnClick = BtnOkClick
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmOutOfBal')
    SecurityItems.Strings = (
      'BtnOk'
      'btnEdit'
      'CheckBox')
    SecurityCode = 'FRMOUTOFBAL'
  end
end
