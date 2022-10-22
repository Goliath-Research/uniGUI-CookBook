inherited FrmPrivilegedUserPassword: TFrmPrivilegedUserPassword
  ClientHeight = 124
  Caption = 'Privileged User Required!'
  ExplicitHeight = 153
  PixelsPerInch = 96
  TextHeight = 13
  inherited lblPrompt: TUniLabel
    Top = 43
    Width = 46
    Caption = 'Password'
    TabOrder = 3
    ExplicitTop = 43
    ExplicitWidth = 46
  end
  object lblUser: TUniLabel [1]
    Left = 8
    Top = 19
    Width = 22
    Height = 13
    Hint = ''
    Caption = 'User'
    TabOrder = 4
  end
  inherited PnlButtons: TUniPanel
    Top = 83
    TabOrder = 2
    ExplicitTop = 83
  end
  object edtUserName: TUniEdit [3]
    Left = 104
    Top = 16
    Width = 170
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 0
    OnChange = EditChange
  end
  inherited edtPassword: TUniEdit
    Left = 104
    Top = 40
    Width = 170
    OnChange = EditChange
    ExplicitLeft = 104
    ExplicitTop = 40
    ExplicitWidth = 170
  end
end
