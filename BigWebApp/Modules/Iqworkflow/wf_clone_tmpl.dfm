object FrmCloneWorkflowTemplate: TFrmCloneWorkflowTemplate
  Left = 208
  Top = 187
  ClientHeight = 112
  ClientWidth = 319
  Caption = 'Clone Existing Template'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  DesignSize = (
    319
    112)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 8
    Top = 10
    Width = 27
    Height = 13
    Hint = ''
    Caption = 'Name'
    TabOrder = 3
  end
  object Label2: TUniLabel
    Left = 9
    Top = 36
    Width = 53
    Height = 13
    Hint = ''
    Caption = 'Description'
    TabOrder = 4
  end
  object edName: TUniEdit
    Left = 76
    Top = 6
    Width = 235
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    Text = ''
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
  end
  object edDescrip: TUniEdit
    Left = 76
    Top = 32
    Width = 235
    Height = 21
    Hint = ''
    Text = ''
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 71
    Width = 319
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 317
      Height = 3
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
    end
    object Panel2: TUniPanel
      Left = 95
      Top = 3
      Width = 224
      Height = 38
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 3
        Top = 5
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 110
        Top = 5
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
end
