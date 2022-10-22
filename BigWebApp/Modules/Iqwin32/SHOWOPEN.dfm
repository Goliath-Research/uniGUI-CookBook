object FrmShowOpenForms: TFrmShowOpenForms
  Left = 200
  Top = 108
  ClientHeight = 159
  ClientWidth = 332
  Caption = 'Currently Open'
  Position = poDefaultPosOnly
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ListBox1: TUniListBox
    Left = 0
    Top = 0
    Width = 332
    Height = 126
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    OnDblClick = btnOKClick
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 126
    Width = 332
    Height = 33
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel2: TUniPanel
      Left = 163
      Top = 1
      Width = 169
      Height = 31
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 2
        Top = 5
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 90
        Top = 5
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
        OnClick = btnCancelClick
      end
    end
  end
end
