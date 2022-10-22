object IQDialogCheckDlgBox: TIQDialogCheckDlgBox
  Left = 304
  Top = 250
  ClientHeight = 180
  ClientWidth = 483
  Caption = 'Confirm'
  OnShow = FormShow
  BorderStyle = bsDialog
  Position = poMainFormCenter
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  Font.Charset = ANSI_CHARSET
  Font.Height = -13
  PixelsPerInch = 120
  TextHeight = 16
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 483
    Height = 142
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object lblConfBasMsgText: TUniLabel
      Left = 110
      Top = 44
      Width = 55
      Height = 16
      Hint = ''
      Caption = ' Confirm?'
      Align = alCustom
      TabOrder = 1
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 142
    Width = 483
    Height = 38
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 481
      Height = 5
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
    end
    object CheckBox: TUniCheckBox
      Left = 6
      Top = 12
      Width = 159
      Height = 17
      Hint = ''
      Caption = 'Do not show next time'
      TabOrder = 0
    end
    object BtnYes: TUniButton
      Tag = 1
      Left = 171
      Top = 9
      Width = 97
      Height = 25
      Hint = ''
      Caption = '&Yes'
      ModalResult = 1
      TabOrder = 3
      OnClick = BtnYesClick
    end
    object BtnNo: TUniButton
      Left = 275
      Top = 9
      Width = 97
      Height = 25
      Hint = ''
      Caption = '&No'
      ModalResult = 7
      TabOrder = 4
      OnClick = BtnYesClick
    end
    object BtnCancel: TUniButton
      Tag = 2
      Left = 380
      Top = 9
      Width = 97
      Height = 25
      Hint = ''
      Caption = '&Cancel'
      ModalResult = 2
      TabOrder = 5
      OnClick = BtnYesClick
    end
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'IQDialogCheckDlgBox')
    SecurityItems.Strings = (
      'BtnYes'
      'BtnNo'
      'BtnCancel'
      'CheckBox')
    SecurityCode = 'IQDIALOGCHECKBOX'
    Left = 437
    Top = 99
  end
end
