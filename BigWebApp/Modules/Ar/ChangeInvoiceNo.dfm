object FrmChangeARInvoiceno: TFrmChangeARInvoiceno
  Left = 116
  Top = 199
  ClientHeight = 119
  ClientWidth = 315
  Caption = 'Change Invoice #'
  OnShow = FormShow
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 11
    Top = 36
    Width = 79
    Height = 13
    Hint = ''
    Caption = 'Invoice Number:'
    TabOrder = 2
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 81
    Width = 315
    Height = 38
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel3: TUniPanel
      Left = 141
      Top = 1
      Width = 174
      Height = 36
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      DesignSize = (
        174
        36)
      object BtnCancel: TUniButton
        Left = 93
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Anchors = [akRight, akBottom]
        TabOrder = 1
        OnClick = BtnCancelClick
      end
      object BtnOk: TUniButton
        Tag = 1
        Left = 11
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = '&Ok'
        Anchors = [akRight, akBottom]
        TabOrder = 2
        OnClick = BtnOkClick
      end
    end
  end
  object Edit1: TUniEdit
    Left = 101
    Top = 32
    Width = 191
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 1
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmChangeARInvoiceno')
    SecurityItems.Strings = (
      'BtnOk')
    SecurityCode = 'FRMCHANGEARINVOICENO'
    Left = 64
    Top = 89
  end
end
