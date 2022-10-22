object FrmTLSecureDlgBase: TFrmTLSecureDlgBase
  Left = 372
  Top = 286
  ClientHeight = 154
  ClientWidth = 336
  Caption = 'Confirm'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 113
    Width = 336
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitTop = 118
    ExplicitWidth = 344
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 134
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
        ModalResult = 1
        TabOrder = 1
        Default = True
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
  object Panel1: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 336
    Height = 113
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitWidth = 344
    ExplicitHeight = 118
    object lblPrompt: TUniLabel
      Left = 8
      Top = 8
      Width = 3
      Height = 13
      Hint = ''
      Caption = ' '
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
    end
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmTLSecureDlgBase')
    SecurityItems.Strings = (
      'btnOk')
    SecurityCode = 'FRMTLSECUREDLGBASE'
    Left = 168
    Top = 40
  end
end
