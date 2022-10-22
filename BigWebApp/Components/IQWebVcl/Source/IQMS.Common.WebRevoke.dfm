object FrmWebRevoke: TFrmWebRevoke
  Left = 318
  Top = 252
  ClientHeight = 113
  ClientWidth = 334
  Caption = 'User'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Left = 0
    Top = 82
    Width = 334
    Height = 31
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel3: TUniPanel
      Left = 126
      Top = 1
      Width = 208
      Height = 29
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 1
        Top = 1
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 104
        Top = 1
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object PnlClient: TUniPanel
    Left = 0
    Top = 0
    Width = 334
    Height = 82
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      334
      82)
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 332
      Height = 80
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      Caption = ''
    end
    object Label1: TUniLabel
      Left = 16
      Top = 18
      Width = 260
      Height = 28
      Hint = ''
      AutoSize = False
      Caption = 'About to Revoke WebDirect access from the user.'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
    end
    object chkRemove: TUniCheckBox
      Left = 16
      Top = 56
      Width = 177
      Height = 17
      Hint = 'This option is only available for Oracle/EIQ users'
      ShowHint = True
      ParentShowHint = False
      Caption = 'Remove user from the system'
      TabOrder = 0
    end
  end
end
