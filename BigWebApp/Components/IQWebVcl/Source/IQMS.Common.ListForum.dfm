object ListForm: TListForm
  Left = 348
  Top = 233
  ClientHeight = 204
  ClientWidth = 495
  Caption = 'List'
  OnShow = UniFormShow
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlPrompt: TUniPanel
    Left = 0
    Top = 0
    Width = 495
    Height = 30
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object lblPrompt: TUniLabel
      Left = 8
      Top = 8
      Width = 12
      Height = 13
      Hint = ''
      Caption = '...'
      TabOrder = 1
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 30
    Width = 495
    Height = 133
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Memo: TUniMemo
      Left = 144
      Top = 16
      Width = 185
      Height = 89
      Hint = ''
      Visible = False
      Lines.Strings = (
        'Memo')
      TabOrder = 1
    end
    object lstList: TUniListBox
      Left = 1
      Top = 1
      Width = 493
      Height = 131
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      OnDblClick = lstListDblClick
    end
  end
  object PnlButtons: TUniPanel
    Left = 0
    Top = 163
    Width = 495
    Height = 41
    Hint = ''
    Visible = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Left = 267
      Top = 1
      Width = 228
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniBitBtn
        Left = 16
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
        Left = 120
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
    object btnSelectAll: TUniButton
      Left = 116
      Top = 7
      Width = 98
      Height = 25
      Hint = ''
      Caption = 'Save To File'
      TabOrder = 2
      OnClick = btnSelectAllClick
    end
    object btnCopyToClipboard: TUniButton
      Left = 8
      Top = 7
      Width = 102
      Height = 25
      Hint = ''
      Caption = 'Copy'
      TabOrder = 3
    end
  end
end
