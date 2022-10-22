object FrmLnLogin: TFrmLnLogin
  Left = 384
  Top = 301
  ClientHeight = 135
  ClientWidth = 330
  Caption = 'Log In To Lotus Notes'
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  Font.Name = 'MS Sans Serif'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlPrompt: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 330
    Height = 41
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object lblPrompt: TUniLabel
      Left = 8
      Top = 8
      Width = 245
      Height = 13
      Hint = ''
      Caption = 'Please enter your password to log in to Lotus Notes.'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
    end
  end
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 94
    Width = 330
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 122
      Top = 1
      Width = 208
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniBitBtn
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 0
        Default = True
      end
      object btnCancel: TUniBitBtn
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  object PnlClient01: TUniPanel
    Tag = 1999
    Left = 0
    Top = 41
    Width = 330
    Height = 53
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 81
      Top = 0
      Width = 6
      Height = 53
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 81
      Height = 51
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object lblPassword: TUniLabel
        Left = 16
        Top = 4
        Width = 46
        Height = 13
        Hint = ''
        Caption = 'Password'
        TabOrder = 1
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 84
      Top = 1
      Width = 246
      Height = 51
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        243
        51)
      object edtPassword: TUniEdit
        Left = 1
        Top = 1
        Width = 227
        Height = 21
        Hint = ''
        PasswordChar = '*'
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitWidth = 233
      end
      object chkSave: TUniCheckBox
        Left = 1
        Top = 24
        Width = 209
        Height = 17
        Hint = ''
        Visible = False
        Caption = 'Remember my login on this computer'
        TabOrder = 1
      end
    end
  end
end
