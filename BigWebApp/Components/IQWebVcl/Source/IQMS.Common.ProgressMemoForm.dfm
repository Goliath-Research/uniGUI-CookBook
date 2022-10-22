object FrmProgressMemo: TFrmProgressMemo
  Left = 238
  Top = 244
  Cursor = crArrow
  ClientHeight = 229
  ClientWidth = 337
  Caption = ''
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlText: TUniPanel
    Left = 0
    Top = 0
    Width = 337
    Height = 188
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    Color = clWindow
    object Memo: TUniMemo
      Left = 1
      Top = 1
      Width = 335
      Height = 152
      Cursor = crArrow
      Hint = ''
      ScrollBars = ssBoth
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Height = -13
      Font.Name = 'Courier New'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      ReadOnly = True
      TabOrder = 0
      WordWrap = False
      OnMouseDown = MemoMouseDown
    end
    object UniPanel1: TUniPanel
      Left = 1
      Top = 152
      Width = 335
      Height = 36
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 2
      Caption = ''
      object btnCopy: TUniButton
        Left = 8
        Top = 5
        Width = 102
        Height = 25
        Hint = ''
        Caption = 'Copy'
        TabOrder = 1
      end
      object btnCopyToClipboard: TUniButton
        Left = 116
        Top = 5
        Width = 102
        Height = 25
        Hint = ''
        Caption = 'Copy All'
        TabOrder = 2
      end
      object btnSaveToFile: TUniButton
        Left = 224
        Top = 5
        Width = 102
        Height = 25
        Hint = ''
        Caption = 'Save To File'
        TabOrder = 3
        OnClick = btnSaveToFileClick
      end
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 188
    Width = 337
    Height = 41
    Cursor = crArrow
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PnlCancel: TUniPanel
      Left = 248
      Top = 1
      Width = 89
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnCancel: TUniBitBtn
        Left = 8
        Top = 11
        Width = 75
        Height = 25
        Cursor = crArrow
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 0
        OnClick = btnCancelClick
      end
    end
    object PnlProgressBar: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 248
      Height = 39
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        248
        39)
      object ProgressBar_StatusIndicator: TUniProgressBar
        Left = 8
        Top = 12
        Width = 231
        Height = 16
        Cursor = crHourGlass
        Hint = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
    end
  end
end
