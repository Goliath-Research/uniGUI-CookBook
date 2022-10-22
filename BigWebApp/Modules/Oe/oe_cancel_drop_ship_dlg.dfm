object FrmCancelDropShipDlg: TFrmCancelDropShipDlg
  Left = 395
  Top = 240
  ClientHeight = 99
  ClientWidth = 286
  Caption = 'Cancel Drop Ship'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object rbtnDeletePO: TUniRadioButton
    Left = 12
    Top = 11
    Width = 255
    Height = 17
    Hint = ''
    Caption = 'Delete Drop Ship PO'
    TabOrder = 0
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 58
    Width = 286
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 284
      Height = 3
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
    end
    object Panel2: TUniPanel
      Tag = 1999
      Left = 69
      Top = 3
      Width = 217
      Height = 38
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 10
        Top = 7
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 114
        Top = 7
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Abort'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object rbtnCancelDropShip: TUniRadioButton
    Left = 12
    Top = 35
    Width = 220
    Height = 17
    Hint = ''
    Caption = 'Cancel Drop Ship, Keep PO'
    TabOrder = 2
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmCancelDropShipDlg')
    SecurityItems.Strings = (
      'rbtnDeletePO'
      'rbtnCancelDropShip'
      'btnOK')
    SecurityCode = 'FRMCANCELDROPSHIPDLG'
    Left = 35
    Top = 70
  end
end
