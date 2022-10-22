object FrmCRMSalesConfigDeleteOptionDlg: TFrmCRMSalesConfigDeleteOptionDlg
  Left = 480
  Top = 323
  ClientHeight = 121
  ClientWidth = 290
  Caption = 'Confirm'
  OnShow = FormShow
  Position = poOwnerFormCenter
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object lblPrompt: TUniLabel
    Left = 16
    Top = 16
    Width = 70
    Height = 13
    Hint = ''
    Caption = 'Delete record?'
    TabOrder = 1
  end
  object PnlButtons: TUniPanel
    Left = 0
    Top = 84
    Width = 290
    Height = 37
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel3: TUniPanel
      Left = 85
      Top = 1
      Width = 205
      Height = 35
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnYes: TUniButton
        Tag = 1
        Left = 1
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Yes'
        ModalResult = 1
        TabOrder = 1
      end
      object btnNo: TUniButton
        Left = 101
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&No'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmCRMSalesConfigDeleteOptionDlg')
    SecurityItems.Strings = (
      'btnYes')
    SecurityCode = 'FRMCRMSALESCONFIGDELETEOPTIONDLG'
    Left = 152
    Top = 40
  end
end
