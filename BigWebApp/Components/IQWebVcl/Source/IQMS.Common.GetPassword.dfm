object FrmSystemPassword: TFrmSystemPassword
  Left = 200
  Top = 108
  ClientHeight = 109
  ClientWidth = 327
  Caption = 'System Password Required'
  OnShow = FormShow
  BorderStyle = bsDialog
  OldCreateOrder = True
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  DesignSize = (
    327
    109)
  PixelsPerInch = 96
  TextHeight = 13
  object lblPrompt: TUniLabel
    Left = 8
    Top = 8
    Width = 75
    Height = 13
    Hint = ''
    Caption = 'Enter Password'
    TabOrder = 2
  end
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 68
    Width = 327
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 117
      Top = 1
      Width = 210
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniButton
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 1
        Default = True
        OnClick = btnOkClick
      end
      object btnCancel: TUniButton
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object edtPassword: TUniEdit
    Left = 8
    Top = 27
    Width = 148
    Height = 21
    Hint = ''
    PasswordChar = #9679
    Text = ''
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    OnChange = edtPasswordChange
  end
  object dbaseElecSign: TFDConnection
    Left = 212
    Top = 14
  end
end
