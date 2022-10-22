object FrmIQDBXSummary: TFrmIQDBXSummary
  Left = 238
  Top = 180
  ClientHeight = 185
  ClientWidth = 511
  Caption = ''
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 511
    Height = 154
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel3: TUniPanel
      Left = 1
      Top = 1
      Width = 509
      Height = 33
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object lblPrompt: TUniLabel
        Left = 8
        Top = 8
        Width = 150
        Height = 13
        Hint = ''
        Caption = 'Finished importing successfully.'
        TabOrder = 1
      end
    end
    object memSummary: TUniMemo
      Left = 1
      Top = 33
      Width = 509
      Height = 121
      Hint = ''
      ScrollBars = ssBoth
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      ReadOnly = True
      Color = clBtnFace
      TabOrder = 1
      WordWrap = False
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 154
    Width = 511
    Height = 31
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel4: TUniPanel
      Left = 398
      Top = 1
      Width = 113
      Height = 29
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnClose: TUniButton
        Left = 8
        Top = 2
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Close'
        ModalResult = 1
        TabOrder = 1
      end
    end
    object btnCopyToClipboard: TUniButton
      Left = 3
      Top = 2
      Width = 102
      Height = 25
      Hint = ''
      Caption = 'Copy'
      TabOrder = 2
    end
    object btnSelectAll: TUniButton
      Left = 111
      Top = 2
      Width = 98
      Height = 25
      Hint = ''
      Caption = 'Select All'
      TabOrder = 3
      OnClick = btnSelectAllClick
    end
  end
end
