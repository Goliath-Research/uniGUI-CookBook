object FrmInvTransNewRuleDlg: TFrmInvTransNewRuleDlg
  Left = 0
  Top = 0
  ClientHeight = 128
  ClientWidth = 322
  Caption = 'Create Rule'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 22
    Top = 11
    Width = 72
    Height = 13
    Hint = ''
    Caption = 'Select rule kind'
    TabOrder = 3
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 87
    Width = 322
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 106
      Top = 1
      Width = 216
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 4
        Top = 7
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Ok'
        ModalResult = 1
        TabOrder = 1
      end
      object btnCancel: TUniButton
        Left = 112
        Top = 7
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object rbtnLocating: TUniRadioButton
    Left = 50
    Top = 30
    Width = 92
    Height = 17
    Hint = ''
    Checked = True
    Caption = 'Locating Rule'
    TabOrder = 1
  end
  object rbtnPicking: TUniRadioButton
    Left = 50
    Top = 53
    Width = 92
    Height = 17
    Hint = ''
    Caption = 'Picking Rule'
    TabOrder = 2
  end
end
