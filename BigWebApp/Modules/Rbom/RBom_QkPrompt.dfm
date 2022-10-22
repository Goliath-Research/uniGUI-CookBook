object FrmRBomQuickPrompt: TFrmRBomQuickPrompt
  Left = 306
  Top = 194
  ClientHeight = 123
  ClientWidth = 332
  Caption = 'Apply to All'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 82
    Width = 332
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 123
      Top = 1
      Width = 208
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 0
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object PnlClient01: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 332
    Height = 82
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 122
      Top = 1
      Width = 6
      Height = 80
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 121
      Height = 80
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label1: TUniLabel
        Left = 8
        Top = 12
        Width = 56
        Height = 13
        Hint = ''
        Caption = 'New MFG #'
        TabOrder = 1
      end
      object Label2: TUniLabel
        Left = 8
        Top = 36
        Width = 57
        Height = 13
        Hint = ''
        Caption = 'New Item #'
        TabOrder = 2
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 128
      Top = 1
      Width = 203
      Height = 80
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        203
        80)
      object edMfgNo: TUniEdit
        Left = 0
        Top = 8
        Width = 187
        Height = 21
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object edItemNo: TUniEdit
        Left = 0
        Top = 32
        Width = 187
        Height = 21
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
    end
  end
end
