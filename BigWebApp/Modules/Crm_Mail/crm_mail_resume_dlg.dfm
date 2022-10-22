object FrmCRMMailResumeDlg: TFrmCRMMailResumeDlg
  Left = 0
  Top = 0
  ClientHeight = 198
  ClientWidth = 483
  Caption = 'Resume'
  OnShow = FormShow
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 157
    Width = 483
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 273
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
    Width = 483
    Height = 157
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object lblPrompt: TUniLabel
      Left = 1
      Top = 1
      Width = 1081
      Height = 13
      Hint = ''
      Caption = 
        'Create a new mass mailing and send to pending recipients?   A ne' +
        'w mailing will be created containing only pending recipients for' +
        'm this mailing.  If you wish, you may also remove the pending re' +
        'cipients from the old mass mailing.'
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
    object chkRemovePending: TUniCheckBox
      Left = 8
      Top = 80
      Width = 329
      Height = 17
      Hint = ''
      Caption = 'Yes, remove the "Pending" recipients from the old mass mailing'
      TabOrder = 0
    end
  end
end
