object ProdGotoDlg: TProdGotoDlg
  Left = 354
  Top = 184
  ClientHeight = 99
  ClientWidth = 268
  Caption = 'Go To'
  BorderStyle = bsDialog
  OldCreateOrder = True
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 64
    Width = 268
    Height = 35
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      268
      35)
    object btnGo: TUniButton
      Left = 60
      Top = 4
      Width = 97
      Height = 25
      Hint = ''
      Caption = 'Go'
      ModalResult = 1
      Anchors = [akTop, akRight]
      TabOrder = 1
      OnClick = btnGoClick
    end
    object btnCancel: TUniButton
      Left = 164
      Top = 4
      Width = 97
      Height = 25
      Hint = ''
      Caption = 'Cancel'
      Cancel = True
      ModalResult = 2
      Anchors = [akTop, akRight]
      TabOrder = 2
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 268
    Height = 64
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 109
      Top = 0
      Width = 6
      Height = 64
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Left = 1
      Top = 1
      Width = 109
      Height = 62
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label1: TUniLabel
        Left = 8
        Top = 8
        Width = 61
        Height = 13
        Hint = ''
        Caption = 'Work Center'
        TabOrder = 1
      end
      object Label2: TUniLabel
        Left = 8
        Top = 32
        Width = 80
        Height = 13
        Hint = ''
        Caption = 'Manufacturing #'
        TabOrder = 2
      end
    end
    object Panel4: TUniPanel
      Left = 112
      Top = 1
      Width = 156
      Height = 62
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        153
        62)
      object eMach: TUniEdit
        Left = 1
        Top = 4
        Width = 149
        Height = 21
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnChange = eMachChange
        ExplicitWidth = 152
      end
      object eMfgNo: TUniEdit
        Left = 1
        Top = 28
        Width = 149
        Height = 21
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        OnChange = eMachChange
        ExplicitWidth = 152
      end
    end
  end
end
