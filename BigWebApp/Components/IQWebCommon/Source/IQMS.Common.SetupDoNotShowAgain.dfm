object FrmSetupDoNotShowAgain: TFrmSetupDoNotShowAgain
  Left = 218
  Top = 220
  HelpContext = 1098479
  ClientHeight = 201
  ClientWidth = 367
  Caption = 'Setup Dialogs "Do not show again"'
  OldCreateOrder = False
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object HeaderCheckListBox1: TIQWebHeaderCheckListBox
    Left = 0
    Top = 0
    Width = 367
    Height = 160
    Hint = ''
    Align = alClient
    Flat = False
    IntegralHeight = False
    ItemHeight = 16
    ItemIndex = -1
    Sorted = False
    Sections = <
      item
        ImageIndex = -1
        Text = 'Show'
        Width = 39
      end
      item
        ImageIndex = -1
        Text = 'Key'
        Width = 140
      end
      item
        ImageIndex = -1
        Text = 'Text'
        Width = 200
      end>
    DelimChar = '^'
    LBStyle = hlbStandard
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 160
    Width = 367
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 157
      Top = 1
      Width = 210
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 2
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 106
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
end
