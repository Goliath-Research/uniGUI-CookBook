object FrmChangePassword: TFrmChangePassword
  Left = 309
  Top = 267
  HelpContext = 999478
  ClientHeight = 115
  ClientWidth = 354
  Caption = 'Change Password'
  OnShow = FormShow
  BorderStyle = bsDialog
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 74
    Width = 354
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 144
      Top = 1
      Width = 210
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnCancel: TUniButton
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
      end
      object btnOK: TUniButton
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 2
        Default = True
        OnClick = btnOKClick
      end
    end
  end
  object PnlClient01: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 354
    Height = 74
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 113
      Height = 72
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object lblNewPassword: TUniLabel
        Left = 8
        Top = 11
        Width = 70
        Height = 13
        Hint = ''
        Caption = 'New Password'
        TabOrder = 1
      end
      object lblConfirmPassword: TUniLabel
        Left = 8
        Top = 35
        Width = 86
        Height = 13
        Hint = ''
        Caption = 'Confirm Password'
        TabOrder = 2
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 113
      Top = 1
      Width = 241
      Height = 72
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object edConfirm: TUniEdit
        Left = 1
        Top = 32
        Width = 233
        Height = 21
        Hint = ''
        PasswordChar = '*'
        Text = ''
        TabOrder = 1
      end
      object edNew: TUniEdit
        Left = 1
        Top = 8
        Width = 233
        Height = 21
        Hint = ''
        PasswordChar = '*'
        Text = ''
        TabOrder = 0
      end
    end
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmChangePassword')
    SecurityItems.Strings = (
      'btnOK')
    SecurityCode = 'FRMCHANGEPASSWORD'
    Left = 8
    Top = 59
  end
end
