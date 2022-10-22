object FrmTlConfDelProdWo: TFrmTlConfDelProdWo
  Left = 0
  Top = 0
  ClientHeight = 189
  ClientWidth = 436
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
    Top = 148
    Width = 436
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 226
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
  object Panel1: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 436
    Height = 148
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object lblPrompt: TUniLabel
      Left = 1
      Top = 1
      Width = 44
      Height = 13
      Hint = ''
      Caption = 'lblPrompt'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
    end
    object PnlCheckBox: TUniPanel
      Tag = 1999
      Left = 1
      Top = 102
      Width = 434
      Height = 46
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object chkDeleteFromSystem: TUniCheckBox
        Left = 1
        Top = 6
        Width = 201
        Height = 17
        Hint = ''
        Caption = 'Delete work order from the system'
        TabOrder = 0
      end
    end
  end
end
